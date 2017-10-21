using Capa_Datos.Manager.Horario;
using Capa_Datos.Manager.PuestoTrabajo;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.UI.WebControls;

namespace Capa_Datos.Manager.Trabajador
{
    public class Mgr_Trabajador
    {
        //-----------------------FUNCIONES DE CREAR, EDITAR Y ELIMINAR
        public static bool Add_Trabajador_Sucursal(String[] valores)
        {
            trabajador nuevo = new trabajador()
            {
                cedula = "0",
                primer_nombre = " Trabajador Default " + valores[0],
                segundo_nombre = "---",
                primer_apellido = "---",
                segundo_apellido = "---",
                email = "---",
                fecha_nacimiento = Convert.ToDateTime("1900-01-01"),
                edo_civil = "Soltero(a)",
                sexo = "Masculino",
                foto = "~/source/archivos/foto_perfil/usuario.png",
                telefono_casa = "---",
                telefono_movil = "---",
                activo = 1,
                id_ccf = 0,
                direccion = "---",
                id_municipio = 1,
                id_puesto_trabajo = Mgr_PuestoTrabajo.Get_PuestoTrabajo(),
                es_discapacitado = "No",
                desc_discapacidad = "---",
                id_horario = Mgr_Horario.Get_Horario(),
                id_estatus_actual = 1,
                fecha_ingreso = DateTime.Now
            };
            return CRUD.Add_Fila(nuevo);
        }
        public static bool Add_Trabajador(String[] valores, FileUpload fuFoto)
        {
            string ruta = Utilidades.GuardarImagen(fuFoto, valores[0] + "_foto", Paginas.Archivos_Foto_Perfil.Value);
            trabajador nuevo = new trabajador()
            {
                cedula = valores[0],
                primer_nombre = valores[1],
                segundo_nombre = valores[2],
                primer_apellido = valores[3],
                segundo_apellido = valores[4],
                email = valores[5],
                fecha_nacimiento = Convert.ToDateTime(valores[6]),
                edo_civil = valores[7],
                sexo = valores[8],
                foto = ruta,
                telefono_casa = valores[9],
                telefono_movil = valores[10],
                activo = 1,
                id_ccf = Convert.ToInt32(valores[11]),
                direccion = valores[12],
                id_municipio = Convert.ToInt32(valores[13]),
                id_puesto_trabajo = Convert.ToInt32(valores[14]),
                es_discapacitado = valores[15],
                desc_discapacidad = valores[16] == string.Empty ? "---" : valores[16],
                id_horario = Convert.ToInt32(valores[17]),
                id_estatus_actual = Convert.ToInt32(valores[18]),
                fecha_ingreso = Convert.ToDateTime(valores[19]),
                tipo_vinculacion = valores[20],
                tipo_horario = valores[21],
                id_perfil_cargo = Convert.ToInt32(valores[22]),
                salario = Convert.ToInt32(valores[23]),
                mano_dominante = valores[24]
            };
            Boolean berror = false;

            if (CRUD.Add_Fila(nuevo))
            {
                int idTrabajador = Get_Trabajador();
                trabajador_estatus nuevoTE = new trabajador_estatus()
                {
                    id_estatus = Convert.ToInt32(valores[18]),
                    id_trabajador = idTrabajador,
                    fecha_registro = DateTime.Now,
                    motivo = "Registro de Trabajador",
                    id_enfermedad = 0,
                    id_sistema = 0,
                    url_constancia = "",
                    fecha_constancia = DateTime.Now,
                    dias_reposo = 0,
                    tpo_enfermedad = ""
                };
                berror = CRUD.Add_Fila(nuevoTE);

            }


            return berror;
        }
        public static bool Add_ReporteTrabajadores(Tuple<int, int> IdEmpSuc, String[] valores, FileUpload flpArchivo)
        {
            int IdEmpresa = IdEmpSuc.Item1;
            int IdSucursal = IdEmpSuc.Item2;

            string ruta = Utilidades.GuardarArchivo(flpArchivo, IdEmpresa + valores[0], Paginas.Archivos_ReporteTrabajadores.Value);

            documento nuevo = new documento()
            {
                nombre = valores[0],
                fecha_subida = DateTime.Today.Date,
                id_tabla = IdSucursal,
                tipo = valores[1],
                ruta = ruta
            };
            return CRUD.Add_Fila(nuevo);
        }

        //-----------------------FUNCIONES DE CONSULTAR
        public static int Get_Trabajador()
        {
            GrupoLiEntities contexto = new GrupoLiEntities();
            var consulta = new trabajador();
            int id = contexto.trabajador.Max(x => x.id_trabajador);
            return id;
        }
        public static int Get_TrabPuesto(int _id_puesto)
        {
            GrupoLiEntities contexto = new GrupoLiEntities();
            var query = (
                    from AC in contexto.trabajador
                    where (AC.id_puesto_trabajo == _id_puesto)
                    select new
                    {
                        AC.id_trabajador
                    }
            ).ToList();

            return query.Count();
        }
        public static int Get_DescripcionSociodemografica()
        {
            GrupoLiEntities contexto = new GrupoLiEntities();
            var consulta = new desc_socio();
            int id = contexto.desc_socio.Max(x => x.id_desc_socio);
            return id;
        }
        public static int Get_TrabajadorByCedula(string cedula)
        {
            GrupoLiEntities contexto = new GrupoLiEntities();
            var consulta = contexto.trabajador.Where(x => x.cedula == cedula).ToList();
            if (consulta.Count == 0)
                return 0;
            else
                return 1;
        }
        public static int Get_TrabajadorAutocomplete(string valor)
        {
            GrupoLiEntities contexto = new GrupoLiEntities();
            var consulta = contexto.trabajador.Where(c => c.primer_nombre + " " + c.primer_apellido + " " + c.cedula == valor).SingleOrDefault();
            return consulta.id_trabajador;
        }
        public static int Get_TrabajadoresByEmpresa(int _id_empresa)
        {
            GrupoLiEntities contexto = new GrupoLiEntities();
            int query = (
                from SC in contexto.trabajador
                where SC.puesto_trabajo.area.sucursal.id_empresa == _id_empresa
                select new
                {
                    SC.id_trabajador
                }).Count();

            return query;
        }
        public static perfil_cargo Get_PerfilCargo(int _id_perfil)
        {
            GrupoLiEntities contexto = new GrupoLiEntities();
            return contexto.perfil_cargo.Where(x => x.id_perfil_cargo == _id_perfil).SingleOrDefault();
        }
        public static int Get_Trabajadores(int id_empresa = 0, int id_sucursal = 0)
        {
            GrupoLiEntities contexto = new GrupoLiEntities();
            var query = (
                from SC in contexto.sucursal
                select new
                {
                    SC.id_sucursal,
                    SC.nombre,
                    SC.id_empresa,
                    empresa = SC.empresa.nombre,
                    NumTrab = (
                        from TB in contexto.trabajador
                        where TB.puesto_trabajo.area.id_sucursal == SC.id_sucursal
                        select TB.id_trabajador).Count()
                }).ToList();

            if (id_empresa > 0) { query = query.Where(x => x.id_empresa == id_empresa).ToList(); }
            if (id_sucursal > 0) { query = query.Where(x => x.id_sucursal == Convert.ToInt32(id_sucursal)).ToList(); }

            return query.ElementAt(0).NumTrab;
        }
        public static int Get_Reposos(int _anho, int id_empresa = 0, int id_sucursal = 0)
        {
            GrupoLiEntities contexto = new GrupoLiEntities();
            var query = (
                from TE in contexto.trabajador_estatus
                join T in contexto.trabajador on TE.id_trabajador equals T.id_trabajador
                where TE.fecha_constancia.Value.Year == _anho && TE.dias_reposo > 0
                select new
                {
                    T.id_trabajador,
                    T.puesto_trabajo.area.sucursal.id_sucursal,
                    T.puesto_trabajo.area.sucursal.empresa.id_empresa
                }
            ).ToList();

            if (id_empresa > 0) { query = query.Where(x => x.id_empresa == id_empresa).ToList(); }
            if (id_sucursal > 0) { query = query.Where(x => x.id_sucursal == Convert.ToInt32(id_sucursal)).ToList(); }

            return query.Count();
        }
        public static List<trabajador_estatus> Get_HistorialTrabajador(int _id_trabajador)
        {
            GrupoLiEntities contexto = new GrupoLiEntities();
            List<trabajador_estatus> consulta = new List<trabajador_estatus>();
            consulta = contexto.trabajador_estatus.Where(x => x.id_trabajador == _id_trabajador).ToList();
            return consulta;
        }
        public static int Get_DiasReposo(int _anho, int id_empresa = 0, int id_sucursal = 0)
        {
            GrupoLiEntities contexto = new GrupoLiEntities();
            var query = (
                from TE in contexto.trabajador_estatus
                join T in contexto.trabajador on TE.id_trabajador equals T.id_trabajador
                where TE.fecha_constancia.Value.Year == _anho && TE.url_constancia != string.Empty && TE.dias_reposo > 0
                select new
                {
                    T.id_trabajador,
                    TE.dias_reposo,
                    T.puesto_trabajo.area.sucursal.id_sucursal,
                    T.puesto_trabajo.area.sucursal.empresa.id_empresa
                }
            ).ToList();

            if (id_empresa > 0) { query = query.Where(x => x.id_empresa == id_empresa).ToList(); }
            if (id_sucursal > 0) { query = query.Where(x => x.id_sucursal == Convert.ToInt32(id_sucursal)).ToList(); }

            int suma = Convert.ToInt32(query.Sum(x => x.dias_reposo));
            return suma;
        }
        public static int Get_Constancias(int _anho, int id_empresa = 0, int id_sucursal = 0)
        {
            GrupoLiEntities contexto = new GrupoLiEntities();
            var query = (
                from TE in contexto.trabajador_estatus
                join T in contexto.trabajador on TE.id_trabajador equals T.id_trabajador
                where TE.fecha_constancia.Value.Year == _anho && TE.url_constancia != string.Empty
                select new
                {
                    T.id_trabajador,
                    T.puesto_trabajo.area.sucursal.id_sucursal,
                    T.puesto_trabajo.area.sucursal.empresa.id_empresa
                }
            ).ToList();

            if (id_empresa > 0) { query = query.Where(x => x.id_empresa == id_empresa).ToList(); }
            if (id_sucursal > 0) { query = query.Where(x => x.id_sucursal == Convert.ToInt32(id_sucursal)).ToList(); }

            return query.Count();
        }
        public static void Get_TrabajadorGestion(GridView GridView1, string _id_trabajador = "")
        {
            GrupoLiEntities contexto = new GrupoLiEntities();
            var query = (
                    from TG in contexto.trabajador_gestion
                    where TG.gestion_laboral.tipo_gestion == 1
                    select new
                    {
                        tipo = TG.gestion_laboral.tipo_gestion,
                        TG.id_trabajador,
                        TG.gestion_laboral.fecha
                    }).ToList();

            if (_id_trabajador != string.Empty) { query = query.Where(x => x.id_trabajador == Convert.ToInt32(_id_trabajador)).ToList(); }

            GridView1.DataSource = query;
            GridView1.DataBind();
        }
        public static int Get_Trabajador_Sistemas(int _anho, string sistema, int id_empresa, int id_sucursal)
        {
            GrupoLiEntities contexto = new GrupoLiEntities();
            int cantidad = 0;
            if (id_sucursal > 0)
            {
                var query = (
                    from TE in contexto.trabajador_estatus
                    join E in contexto.sistema on TE.id_sistema equals E.id_sistemas
                    where (TE.trabajador.puesto_trabajo.area.sucursal.id_sucursal == id_sucursal
                           && TE.fecha_constancia.Value.Year == _anho
                           && E.nombre.ToUpper().Equals(sistema.ToUpper())
                           && TE.dias_reposo > 0)
                    select new
                    {
                        TE.id_trabajador_estatus
                    }
                    ).ToList();
                cantidad = Convert.ToInt32(query.Count());
            }
            if (id_empresa > 0)
            {
                var query = (
                    from TE in contexto.trabajador_estatus
                    join E in contexto.sistema on TE.id_sistema equals E.id_sistemas
                    where (TE.trabajador.puesto_trabajo.area.sucursal.empresa.id_empresa == id_empresa
                           && TE.fecha_constancia.Value.Year == _anho
                           && E.nombre.ToUpper().Equals(sistema.ToUpper())
                           && TE.dias_reposo > 0)
                    select new
                    {
                        TE.id_trabajador_estatus
                    }
                    ).ToList();
                cantidad = Convert.ToInt32(query.Count());
            }

            return cantidad;
        }
        public static int Get_Trabajador_Enfermedad(int _anho, string enfermedad, int id_empresa, int id_sucursal)
        {
            GrupoLiEntities contexto = new GrupoLiEntities();
            int cantidad = 0;
            if (id_sucursal > 0)
            {
                var query = (
                    from TE in contexto.trabajador_estatus
                    join E in contexto.enfermedad on TE.id_enfermedad equals E.id_enfermedad
                    where (TE.trabajador.puesto_trabajo.area.sucursal.id_sucursal == id_sucursal
                           && TE.fecha_constancia.Value.Year == _anho
                           && E.nombre.ToUpper().Equals(enfermedad.ToUpper())
                           && TE.dias_reposo > 0)
                    select new
                    {
                        TE.id_trabajador_estatus
                    }
                    ).ToList();
                cantidad = Convert.ToInt32(query.Count());
            }
            if (id_empresa > 0)
            {
                var query = (
                    from TE in contexto.trabajador_estatus
                    join E in contexto.enfermedad on TE.id_enfermedad equals E.id_enfermedad
                    where (TE.trabajador.puesto_trabajo.area.sucursal.empresa.id_empresa == id_empresa
                           && TE.fecha_constancia.Value.Year == _anho
                           && E.nombre.ToUpper().Equals(enfermedad.ToUpper())
                           && TE.dias_reposo > 0)
                    select new
                    {
                        TE.id_trabajador_estatus
                    }
                    ).ToList();
                cantidad = Convert.ToInt32(query.Count());
            }

            return cantidad;
        }
        public static int Get_Trabajadores_Discapacitados(int _anho, int id_empresa = 0, int id_sucursal = 0)
        {
            GrupoLiEntities contexto = new GrupoLiEntities();
            var query = (
                from T in contexto.trabajador
                where T.es_discapacitado.ToUpper() == "SI"
                select new
                {
                    T.puesto_trabajo.area.sucursal.id_sucursal,
                    T.puesto_trabajo.area.sucursal.empresa.id_empresa,
                }).ToList();

            if (id_empresa > 0) { query = query.Where(x => x.id_empresa == id_empresa).ToList(); }
            if (id_sucursal > 0) { query = query.Where(x => x.id_sucursal == Convert.ToInt32(id_sucursal)).ToList(); }

            return query.Count();
        }
        public static int Get_RepososByNombre(int _anho, string tipo, int id_empresa = 0, int id_sucursal = 0)
        {
            GrupoLiEntities contexto = new GrupoLiEntities();
            var query = (
                from TE in contexto.trabajador_estatus
                join T in contexto.trabajador on TE.id_trabajador equals T.id_trabajador
                where TE.fecha_constancia.Value.Year == _anho && TE.tpo_enfermedad == tipo && TE.dias_reposo > 0
                select new
                {
                    T.id_trabajador,
                    T.puesto_trabajo.area.sucursal.id_sucursal,
                    T.puesto_trabajo.area.sucursal.empresa.id_empresa
                }
            ).ToList();

            if (id_empresa > 0) { query = query.Where(x => x.id_empresa == id_empresa).ToList(); }
            if (id_sucursal > 0) { query = query.Where(x => x.id_sucursal == Convert.ToInt32(id_sucursal)).ToList(); }

            return query.Count();
        }
        public static List<trabajador_gestion> Get_TrabajadorInGestion(int id_trabajador = 0, int _id_ges_lab = 0)
        {
            GrupoLiEntities contexto = new GrupoLiEntities();
            var consulta = new List<trabajador_gestion>();

            if (_id_ges_lab != 0)
            {
                consulta = contexto.trabajador_gestion.Where(x => x.id_ges_lab == _id_ges_lab).ToList();
            }
            else if (id_trabajador != 0 && _id_ges_lab != 0)
            {
                consulta = contexto.trabajador_gestion.
                    Where(x => x.id_trabajador == id_trabajador && x.id_ges_lab == _id_ges_lab)
                    .ToList();
            }

            return consulta;
        }
        public static List<desc_socio> Get_DescripcionSociodemografica(int _id_desc_socio = 0, int _id_trabajador = 0)
        {
            GrupoLiEntities contexto = new GrupoLiEntities();
            List<desc_socio> consulta = new List<desc_socio>();

            if (_id_desc_socio != 0) { consulta = contexto.desc_socio.Where(x => x.id_desc_socio == _id_desc_socio).ToList(); }
            else if (_id_trabajador != 0) { consulta = contexto.desc_socio.Where(x => x.id_trabajador == _id_trabajador).ToList(); }

            return consulta;
        }
        public static int Get_Trabajadores_ByCapacidad(int id_sucursal, DateTime fechaIni, DateTime fechaFin)
        {
            GrupoLiEntities contexto1 = new GrupoLiEntities();

            var query = (
                from T in contexto1.trabajador
                join TG in contexto1.trabajador_gestion on T.id_trabajador equals TG.id_trabajador
                join PT in contexto1.puesto_trabajo on T.id_puesto_trabajo equals PT.id_puesto_trabajo
                join A in contexto1.area on PT.id_area equals A.id_area
                join SU in contexto1.sucursal on A.id_sucursal equals SU.id_sucursal
                join GL in contexto1.gestion_laboral on TG.id_ges_lab equals GL.id_ges_lab
                where (TG.gestion_laboral.tipo_gestion == 2 && GL.fecha >= fechaIni && GL.fecha <= fechaFin && SU.id_sucursal == id_sucursal)
                select new
                {
                    T.id_trabajador
                }
            ).ToList();

            return query.Distinct().Count();
        }
        public static List<trabajador_estatus> Get_TrabajadorReposo(int _id_trabajador, DateTime fechaInicio, DateTime fechaFin)
        {
            GrupoLiEntities contexto = new GrupoLiEntities();
            List<trabajador_estatus> consulta = new List<trabajador_estatus>();
            consulta = contexto.trabajador_estatus.Where(
                x => x.id_trabajador == _id_trabajador &&
                (x.fecha_constancia >= fechaInicio && x.fecha_constancia <= fechaFin)
            ).ToList();
            return consulta;
        }
        public static List<trabajador_gestion> Get_TrabajadoresByCapacitacion(int _id_trabajador, DateTime fechaIni, DateTime fechaFin)
        {
            GrupoLiEntities contexto = new GrupoLiEntities();

            List<trabajador_gestion> consulta = new List<trabajador_gestion>();
            consulta = contexto.trabajador_gestion.Where(x =>
            x.id_trabajador == _id_trabajador &&
            x.gestion_laboral.fecha >= fechaIni &&
            x.gestion_laboral.fecha <= fechaFin &&
            x.gestion_laboral.tipo_gestion == 2
            ).ToList();

            return consulta;
        }
        public static List<trabajador> Get_Trabajador(int _id_trabajador = 0,int _id_empresa = 0,int _id_sucursal = 0,int _id_puesto_trabajo = 0)
        {
            GrupoLiEntities contexto = new GrupoLiEntities();
            List<trabajador> consulta = new List<trabajador>();

            if (_id_trabajador != 0)
            {
                consulta = contexto.trabajador.Where(x => x.id_trabajador == _id_trabajador).OrderBy(y => y.primer_nombre).ToList();
            }
            else if (_id_empresa != 0)
            {
                consulta = contexto.trabajador.Where(x => x.puesto_trabajo.area.sucursal.id_empresa == _id_empresa).OrderBy(y => y.primer_nombre).ToList();
            }
            else if (_id_sucursal != 0)
            {
                consulta = contexto.trabajador.Where(x => x.puesto_trabajo.area.id_sucursal == _id_sucursal).OrderBy(y => y.primer_nombre).ToList();
            }
            else if (_id_puesto_trabajo != 0)
            {
                consulta = contexto.trabajador.Where(x => x.id_puesto_trabajo == _id_puesto_trabajo).OrderBy(y => y.primer_nombre).ToList();
            }

            return consulta;
        }
                
        //------------------FUNCIONES DE LLENAR LISTAS
        public static void Lista_Trabajadores_Area(DropDownList DropDownList1, int _id_area)
        {
            GrupoLiEntities contexto = new GrupoLiEntities();
            var Consulta = (from c in contexto.trabajador
                            where c.puesto_trabajo.area.id_area == _id_area
                            select new { c.id_trabajador, nombre = c.primer_nombre + " " + c.primer_apellido }).ToList();
            DropDownList1.DataValueField = "id_trabajador";
            DropDownList1.DataTextField = "nombre";
            DropDownList1.DataSource = Consulta;
            DropDownList1.DataBind();
            DropDownList1.Items.Insert(0, new ListItem("Seleccione el Trabajador", ""));
        }
        public static void Lista_PerfilCargo(DropDownList DropDownList1, int _id_empresa = 0)
        {
            GrupoLiEntities contexto = new GrupoLiEntities();
            var Consulta = (from c in contexto.perfil_cargo
                            select new { c.id_perfil_cargo, nombre = c.nombre, c.id_empresa }).OrderBy(x => x.nombre.Trim()).ToList();

            if (_id_empresa > 0)
            {
                Consulta = Consulta.Where(x => x.id_empresa == _id_empresa).ToList();
            }

            DropDownList1.DataValueField = "id_perfil_cargo";
            DropDownList1.DataTextField = "nombre";
            DropDownList1.DataSource = Consulta;
            DropDownList1.DataBind();
            DropDownList1.Items.Insert(0, new ListItem("Seleccione el Cargo", ""));
        }
        public static void Lista_Trabajadores_Puestos(DropDownList DropDownList1, int _id_puesto)
        {
            GrupoLiEntities contexto = new GrupoLiEntities();
            var Consulta = (from c in contexto.trabajador
                            where c.id_puesto_trabajo == _id_puesto
                            select new
                            {
                                c.id_trabajador,
                                nombre = c.primer_nombre + " " + c.primer_apellido
                            }).ToList();
            DropDownList1.DataValueField = "id_trabajador";
            DropDownList1.DataTextField = "nombre";
            DropDownList1.DataSource = Consulta;
            DropDownList1.DataBind();
            DropDownList1.Items.Insert(0, new ListItem("Seleccione el Trabajador", ""));
        }
        public static void Lista_Trabajadores_Sucursal(DropDownList DropDownList1, int _id_sucursal)
        {
            GrupoLiEntities contexto = new GrupoLiEntities();
            var Consulta = (from c in contexto.trabajador
                            where c.puesto_trabajo.area.sucursal.id_sucursal == _id_sucursal
                            select new { c.id_trabajador, nombre = c.primer_nombre + " " + c.primer_apellido }).ToList();
            DropDownList1.DataValueField = "id_trabajador";
            DropDownList1.DataTextField = "nombre";
            DropDownList1.DataSource = Consulta;
            DropDownList1.DataBind();
            DropDownList1.Items.Insert(0, new ListItem("Seleccione el Trabajador", ""));
        }
        public static void Lista_Trabajadores_Empresa(DropDownList DropDownList1, int _id_empresa)
        {
            GrupoLiEntities contexto = new GrupoLiEntities();
            var Consulta = (from c in contexto.trabajador
                            where c.puesto_trabajo.area.sucursal.empresa.id_empresa == _id_empresa
                            select new { c.id_trabajador, nombre = c.primer_nombre + " " + c.primer_apellido }).ToList();
            DropDownList1.DataValueField = "id_trabajador";
            DropDownList1.DataTextField = "nombre";
            DropDownList1.DataSource = Consulta;
            DropDownList1.DataBind();
            DropDownList1.Items.Insert(0, new ListItem("Seleccione el Trabajador", ""));
        }

        //-----------------FUNCIONES DE LLENAR GRID
        public static void Grid_DescripcionSociodemografica(GridView GridView1, string _where = "")
        {
            GrupoLiEntities contexto = new GrupoLiEntities();
            var query = (
                    from DS in contexto.desc_socio
                    select new
                    {
                        DS.trabajador.cedula,
                        DS.id_desc_socio,
                        empresa = DS.trabajador.puesto_trabajo.area.sucursal.empresa.nombre,
                        nombres = DS.trabajador.primer_nombre + " " + DS.trabajador.primer_apellido
                    }).ToList();

            if (_where != string.Empty) { query = query.Where(x => x.cedula.Contains(_where)).ToList(); }
            GridView1.DataSource = query;
            GridView1.DataBind();
        }
        public static void Grid_PerfilCargo(GridView GridView1, int id_empresa = 0, string _nombre = "")
        {
            GrupoLiEntities contexto = new GrupoLiEntities();
            var query = (
                from CA in contexto.perfil_cargo
                select new
                {
                    CA.id_perfil_cargo,
                    CA.nombre,
                    CA.id_empresa,
                    CA.descripcion,
                    empresa = CA.empresa.nombre,
                    ocupacion = CA.cno.ocupacion
                }).ToList();

            if (id_empresa != 0) { query = query.Where(x => x.id_empresa == id_empresa).ToList(); }
            if (_nombre != string.Empty) { query = query.Where(x => x.nombre.ToLower().Contains(_nombre.ToLower())).ToList(); }

            GridView1.DataSource = query;
            GridView1.DataBind();
        }
        public static void Grid_PerfilMedico(GridView GridView1, int id_empresa = 0, int id_cargo = 0, string _nombre = "")
        {
            GrupoLiEntities contexto = new GrupoLiEntities();
            var query = (
                from PM in contexto.perfil_medico
                select new
                {
                    PM.id_perfil_medico,
                    PM.nombre,
                    PM.id_empresa,
                    PM.descripcion,
                    PM.id_cargo,
                    PM.ruta,
                    empresa = PM.perfil_cargo.empresa.nombre,
                    cargo = PM.perfil_cargo.nombre
                }).ToList();

            if (id_empresa != 0) { query = query.Where(x => x.id_empresa == id_empresa).ToList(); }
            if (id_cargo != 0) { query = query.Where(x => x.id_cargo == id_cargo).ToList(); }
            if (_nombre != string.Empty) { query = query.Where(x => x.nombre.ToLower().Contains(_nombre.ToLower())).ToList(); }

            GridView1.DataSource = query;
            GridView1.DataBind();
        }
        public static void Grid_Trabajador(GridView GridView1, int MiTrabajador = 0, int _id_empresa = 0, string _id_area = "0", string _id_estatus_actual = "", string buscar = "", int _id_sucursal = 0)
        {
            GrupoLiEntities contexto = new GrupoLiEntities();
            var query = (
                    from CT in contexto.trabajador
                    where CT.id_trabajador != MiTrabajador
                    join ES in contexto.estatus on CT.id_estatus_actual equals ES.id_estatus
                    select new
                    {
                        CT.id_trabajador,
                        CT.puesto_trabajo.area.id_sucursal,
                        CT.cedula,
                        CT.id_estatus_actual,
                        nombres = CT.primer_nombre + " " + CT.segundo_nombre,
                        apellidos = CT.primer_apellido + " " + CT.segundo_apellido,
                        CT.puesto_trabajo.id_area,
                        area = CT.puesto_trabajo.area.nombre,
                        empresa = CT.puesto_trabajo.area.sucursal.empresa.id_empresa,
                        Nomestatus = CT.id_estatus_actual == 0 ? "Sin estatus" : "" + ES.nombre,
                        estatus = CT.id_estatus_actual,
                        sucursal = CT.puesto_trabajo.area.sucursal.nombre
                    }).ToList();

            if (_id_empresa != 0) { query = query.Where(x => x.empresa == _id_empresa).ToList(); }

            if (_id_area != "0") { query = query.Where(x => x.id_area == Convert.ToInt32(_id_area)).ToList(); }

            if (_id_estatus_actual != string.Empty) { query = query.Where(x => x.id_estatus_actual == Convert.ToInt32(_id_estatus_actual)).ToList(); }

            if (buscar != string.Empty)
            {
                query = query.Where(x => x.nombres.ToLower().Contains(buscar.ToLower())
                || x.apellidos.ToLower().Contains(buscar.ToLower()) || x.cedula.ToLower().Contains(buscar.ToLower())).ToList();
            }

            if (_id_sucursal != 0) { query = query.Where(x => x.id_sucursal == _id_sucursal).ToList(); }

            GridView1.DataSource = query;
            GridView1.DataBind();
        }
    }
}
