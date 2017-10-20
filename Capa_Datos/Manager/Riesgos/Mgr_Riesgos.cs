using Capa_Datos.Manager.PuestoTrabajo;
using Capa_Datos.Manager.Sucursal;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web.UI.WebControls;

namespace Capa_Datos.Manager.Riesgos
{
    public class Mgr_Riesgos
    {
        //---------------crud
        public static bool Add_Riesgos_Sucursal(String[] valores)
        {
            DateTime fechaActual = DateTime.Now;

            GrupoLiEntities contexto = new GrupoLiEntities();
            List<riesgos_item> ListaRiesgosItem = new List<riesgos_item>();

            int act1 = Convert.ToInt32(valores[0]);
            int act2 = Convert.ToInt32(valores[1]);
            int act3 = Convert.ToInt32(valores[2]);

            ListaRiesgosItem = contexto.riesgos_item.Where(x =>
                x.id_item == act1 ||
                x.id_item == act2 ||
                x.id_item == act3
                ).ToList();

            var distinctList = ListaRiesgosItem
                .GroupBy(x => new { x.id_factor_riesgo, x.id_enfermedad_laboral })
                .Select(g => g.First())
                .ToList();

            foreach (var item in distinctList)
            {
                #region se guarda la identificacion del peligro
                identificacion_peligro nuevoIde_Peligro = new identificacion_peligro()
                {
                    fecha_identificacion = fechaActual,
                    medidas_control_existentes = "",
                    observaciones = "",
                    matriz_riesgo = 1,
                    estatus = "Desactualizado",
                };
                contexto.identificacion_peligro.Add(nuevoIde_Peligro);
                try
                {
                    contexto.SaveChanges();
                }
                catch
                {
                    Mgr_Sucursal.DeleteSucursal(Convert.ToInt32(valores[3]));
                    return false;
                }

                #endregion

                #region se guarda la identificacion del puesto

                int id_IdentificacionPeligro = Convert.ToInt32(GetterMax.IdentificacionPeligro());
                identificacion_puesto nuevoIde_Puesto = new identificacion_puesto()
                {
                    id_puesto = Convert.ToInt32(Mgr_PuestoTrabajo.PuestoTrabajo()),
                    id_identificacion = id_IdentificacionPeligro
                };
                contexto.identificacion_puesto.Add(nuevoIde_Puesto);
                try
                {
                    contexto.SaveChanges();
                }
                catch
                {
                    Mgr_Sucursal.DeleteSucursal(Convert.ToInt32(valores[3]));
                    return false;
                }

                #endregion

                #region se guarda el factor identifiacion

                factor_identificacion nuevoFactor_ide = new factor_identificacion()
                {
                    id_factor = item.id_factor_riesgo,
                    id_identificacion = id_IdentificacionPeligro,
                    consecuencias = item.enfermedadLaboral.nombre,
                    tiempo_exposicion = "Sin especificar"
                };
                contexto.factor_identificacion.Add(nuevoFactor_ide);
                try
                {
                    contexto.SaveChanges();
                }
                catch
                {
                    Mgr_Sucursal.DeleteSucursal(Convert.ToInt32(valores[3]));
                    return false;
                }

                #endregion
            }

            return true;

        }
        
        //---------------getter
        public static Double AvgPorcEstRieSuc(int _idSucursal)
        {
            GrupoLiEntities contexto = new GrupoLiEntities();

            List<puesto_trabajo> puestos = contexto.puesto_trabajo.Where(x => x.area.id_sucursal == _idSucursal).ToList();
            List<evaluacion_riesgo> evaluaciones = new List<evaluacion_riesgo>();

            double total = 0;
            double acumulado = 0;
            foreach (var itemPuestos in puestos)
            {
                foreach (var itemIdePuesto in itemPuestos.identificacion_puesto)
                {
                    total++;
                    foreach (var itemEvaRiesgo in itemIdePuesto.evaluacion_riesgo)
                    {
                        acumulado = acumulado + Convert.ToDouble(itemEvaRiesgo.porc_estatus);
                    }
                }
            }

            double promedio = acumulado / total;

            return Math.Round(promedio, 3);
        }
        public static Double AvgPorcEstRieEmp(int _idEmpresa)
        {
            GrupoLiEntities contexto = new GrupoLiEntities();

            List<puesto_trabajo> puestos = contexto.puesto_trabajo.Where(x => x.area.sucursal.id_empresa == _idEmpresa).ToList();
            List<evaluacion_riesgo> evaluaciones = new List<evaluacion_riesgo>();

            double total = 0;
            double acumulado = 0;
            foreach (var itemPuestos in puestos)
            {
                foreach (var itemIdePuesto in itemPuestos.identificacion_puesto)
                {
                    total++;
                    foreach (var itemEvaRiesgo in itemIdePuesto.evaluacion_riesgo)
                    {
                        acumulado = acumulado + Convert.ToDouble(itemEvaRiesgo.porc_estatus);
                    }
                }
            }

            double promedio = acumulado / total;

            return Math.Round(promedio, 3);
        }

        public static List<factor_riesgo> FactorRiesgo(int id_factor_riesgo = 0, string _nombre = "")
        {
            GrupoLiEntities contexto = new GrupoLiEntities();
            List<factor_riesgo> consulta = new List<factor_riesgo>();

            if (_nombre != string.Empty)
            {
                consulta = contexto.factor_riesgo.Where(x => x.nombre.Contains(_nombre)).ToList();
            }

            if (id_factor_riesgo != 0)
            {
                consulta = contexto.factor_riesgo.Where(x => x.id_factor_riesgo == id_factor_riesgo).ToList();
            }

            return consulta;
        }

        public static List<identificacion_peligro> IdentificacionPeligro(int _id_identificacion_peligro)
        {
            GrupoLiEntities contexto = new GrupoLiEntities();
            List<identificacion_peligro> consulta = new List<identificacion_peligro>();
            consulta = contexto.identificacion_peligro.Where(x => x.id_identificacion_peligro == _id_identificacion_peligro).ToList();

            return consulta;
        }
        public static List<identificacion_puesto> IdentificacionPuesto(int _id_ide_puesto)
        {
            GrupoLiEntities contexto = new GrupoLiEntities();
            List<identificacion_puesto> consulta = new List<identificacion_puesto>();
            consulta = contexto.identificacion_puesto.Where(x => x.id_ide_puesto == _id_ide_puesto).ToList();

            return consulta;
        }
        public static List<evaluacion_riesgo> EvaluacionRiesgo(int _id_eva_riesgo)
        {
            GrupoLiEntities contexto = new GrupoLiEntities();
            List<evaluacion_riesgo> consulta = new List<evaluacion_riesgo>();
            consulta = contexto.evaluacion_riesgo.Where(x => x.id_evaluacion_riesgo == _id_eva_riesgo).ToList();

            return consulta;
        }


        //----listas
        public static void Riesgos(DropDownList DropDownList1, string tabla, string _id_tipo = "")
        {
            GrupoLiEntities contexto = new GrupoLiEntities();
            if (tabla == "TipoRiesgo")
            {
                var Consulta = (from c in contexto.tipo_riesgo
                                select new { c.id_tipo_riesgo, c.nombre }).ToList();

                DropDownList1.DataValueField = "id_tipo_riesgo";
                DropDownList1.DataTextField = "nombre";
                DropDownList1.DataSource = Consulta;
            }
            else if (tabla == "FactorRiesgo")
            {
                #region codigo
                int idtipo = Convert.ToInt32(_id_tipo);


                var Consulta = (from c in contexto.factor_riesgo
                                where c.id_tipo_riesgo == idtipo
                                select new { c.id_factor_riesgo, c.nombre }).ToList();

                DropDownList1.DataValueField = "id_factor_riesgo";
                DropDownList1.DataTextField = "nombre";
                DropDownList1.DataSource = Consulta;
                #endregion
            }
            DropDownList1.DataBind();
            DropDownList1.Items.Insert(0, new ListItem("Seleccione", ""));
        }

        //----grid
        public static void MatrizRiesgo(GridView GridView1, int _id_sucursal = 0, int _id_empresa = 0, string _tipo_riesgo = "", string nombre = "")
        {
            GrupoLiEntities contexto = new GrupoLiEntities();

            var query = (
                from IP in contexto.identificacion_puesto
                join PT in contexto.puesto_trabajo on IP.id_puesto equals PT.id_puesto_trabajo
                join IR in contexto.identificacion_peligro on IP.id_identificacion equals IR.id_identificacion_peligro
                join FI in contexto.factor_identificacion on IR.id_identificacion_peligro equals FI.id_identificacion
                where IR.matriz_riesgo == 1
                select new
                {
                    PT.area.id_sucursal,
                    Sucursal = PT.area.sucursal.nombre,
                    PT.area.sucursal.id_empresa,
                    IR.fecha_identificacion,
                    Medidas = IR.medidas_control_existentes == "" ? "Sin Asignar" : IR.medidas_control_existentes,
                    Observaciones = IR.observaciones == "" ? "Sin Asignar" : IR.observaciones,
                    IR.id_identificacion_peligro,
                    Evaluacion = IP.evaluacion_riesgo.Count == 0 ? "Sin Evaluación" : "Con Evaluación",
                    FactorRiesgo = FI.factor_riesgo.nombre,
                    FI.factor_riesgo.id_factor_riesgo,
                    tipoRiesgo = FI.factor_riesgo.tipo_riesgo.nombre,
                    FI.factor_riesgo.id_tipo_riesgo,
                    PT.nombre,
                    IR.estatus,
                    IP.id_ide_puesto,
                    porc_estatus = (from EV in contexto.evaluacion_riesgo
                                    where EV.id_ide_puesto == IP.id_ide_puesto
                                    select EV.porc_estatus).FirstOrDefault() != null ?
                    "" + (from EV in contexto.evaluacion_riesgo where EV.id_ide_puesto == IP.id_ide_puesto select EV.porc_estatus).FirstOrDefault()
                    : "0"
                }).ToList();

            if (_id_sucursal != 0) { query = query.Where(x => x.id_sucursal == _id_sucursal).ToList(); }
            if (_id_empresa != 0) { query = query.Where(x => x.id_empresa == _id_empresa).ToList(); }
            if (_tipo_riesgo != string.Empty) { query = query.Where(x => x.tipoRiesgo.ToLower().Contains(_tipo_riesgo.ToLower())).ToList(); }
            if (nombre != string.Empty) { query = query.Where(x => x.FactorRiesgo.ToLower().Contains(nombre.ToLower())).ToList(); }

            GridView1.DataSource = query;
            GridView1.DataBind();
        }
        public static void MapaRiesgos(GridView GridView1, int _id_sucursal = 0, string _buscar = "")
        {
            GrupoLiEntities contexto = new GrupoLiEntities();
            var query = (
                    from PM in contexto.documento
                    where PM.tipo == "MapaRiesgos"
                    select new
                    {
                        PM.id_documento,
                        PM.nombre,
                        PM.ruta,
                        PM.sucursal.id_empresa,
                        PM.sucursal.id_sucursal,
                        Empresa = PM.sucursal.empresa.nombre,
                        Sucursal = PM.sucursal.nombre,
                        PM.id_tabla,
                        PM.fecha_subida
                    }).ToList();

            if (_id_sucursal != 0) { query = query.Where(x => x.id_tabla == _id_sucursal).ToList(); }
            if (_buscar != string.Empty) { query = query.Where(x => x.nombre.ToLower().Contains(_buscar.ToLower())).ToList(); }

            GridView1.DataSource = query;
            GridView1.DataBind();
        }
        public static void FactorRiesgo(GridView GridView1, string nombre = "")
        {
            GrupoLiEntities contexto = new GrupoLiEntities();
            var query = (
                from FR in contexto.factor_riesgo
                select new
                {
                    FR.id_factor_riesgo,
                    FR.nombre,
                    tipoRiesgo = FR.tipo_riesgo.nombre
                }).ToList();

            if (nombre != string.Empty) { query = query.Where(x => x.nombre.ToLower().Contains(nombre.ToLower())).ToList(); }

            GridView1.DataSource = query;
            GridView1.DataBind();
        }
        public static void IdentificacionPeligro(GridView GridView1, int _id_sucursal, string _fecha = "")
        {
            if (_id_sucursal != 0)
            {
                GrupoLiEntities contexto = new GrupoLiEntities();
                var query = (
                    from IPT in contexto.identificacion_peligro
                    where (
                        (from PT in contexto.puesto_trabajo
                         where PT.area.id_sucursal == _id_sucursal
                         select new
                         {
                             PT.area.id_sucursal
                         }).FirstOrDefault().id_sucursal
                        ) == _id_sucursal
                    orderby IPT.fecha_identificacion descending
                    select new
                    {
                        IPT.id_identificacion_peligro,
                        IPT.fecha_identificacion,
                        NumPuestos = IPT.identificacion_puesto.Count
                    }).ToList();

                if (_fecha != string.Empty) { query = query.Where(x => x.fecha_identificacion <= Convert.ToDateTime(_fecha)).ToList(); }

                GridView1.DataSource = query;
                GridView1.DataBind();
            }
        }
        public static void EvaluacionRiesgo(GridView GridView1, int _id_sucursal)
        {
            if (_id_sucursal != 0)
            {
                GrupoLiEntities contexto = new GrupoLiEntities();
                var query = (
                    from IPT in contexto.identificacion_puesto
                    where IPT.puesto_trabajo.area.id_sucursal == _id_sucursal
                    select new
                    {
                        IPT.id_ide_puesto,
                        IPT.id_puesto,
                        Puesto = IPT.puesto_trabajo.nombre,
                        Evaluacion = IPT.evaluacion_riesgo.Count == 0 ? "Sin Evaluación" : "Con Evaluación",
                        Num_Evaluacion = IPT.evaluacion_riesgo.Count
                    }).ToList();

                GridView1.DataSource = query;
                GridView1.DataBind();
            }
        }
        public static void EvaluacionPuesto(GridView GridView1, int _id_puesto, string _fecha = "")
        {
            GrupoLiEntities contexto = new GrupoLiEntities();

            var query = (
                from ER in contexto.evaluacion_riesgo
                where ER.identificacion_puesto.id_puesto == _id_puesto
                select new
                {
                    ER.id_evaluacion_riesgo,
                    ER.fecha_evaluacion,
                    ER.nivel_riesgo,
                    ER.aceptabilidad_riesgo
                }).ToList();

            if (_fecha != string.Empty) { query = query.Where(x => x.fecha_evaluacion <= Convert.ToDateTime(_fecha)).ToList(); }
            GridView1.DataSource = query;
            GridView1.DataBind();
        }
        public static void EstructuraRiesgos(GridView GridView1, int _id_empresa, int _id_sucursal = 0)
        {
            GrupoLiEntities contexto = new GrupoLiEntities();
            var query = (
                from I in contexto.documento
                where I.sucursal.id_empresa == _id_empresa && I.tipo == "EstructuraRiesgos"
                select new
                {
                    I.id_documento,
                    I.ruta,
                    I.id_tabla,
                    sucursal = I.sucursal.nombre,
                    archivo = I.nombre == null ? "No se ha subido" : "" + I.nombre
                }).ToList();

            if (_id_sucursal != 0) { query = query.Where(x => x.id_tabla == _id_sucursal).ToList(); }

            GridView1.DataSource = query;
            GridView1.DataBind();
        }
        public static void EvaluacionRiesgos(GridView GridView1, int _id_empresa, int _id_sucursal = 0)
        {
            GrupoLiEntities contexto = new GrupoLiEntities();
            var query = (
                from I in contexto.documento
                where I.sucursal.id_empresa == _id_empresa && I.tipo == "EvaluacionRiesgos"
                select new
                {
                    I.id_documento,
                    I.ruta,
                    I.id_tabla,
                    sucursal = I.sucursal.nombre,
                    archivo = I.nombre == null ? "No se ha subido" : "" + I.nombre
                }).ToList();

            if (_id_sucursal != 0) { query = query.Where(x => x.id_tabla == _id_sucursal).ToList(); }

            GridView1.DataSource = query;
            GridView1.DataBind();
        }
    }
}
