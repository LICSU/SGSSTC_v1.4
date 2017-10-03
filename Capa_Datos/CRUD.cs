using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;

namespace Capa_Datos
{
    /// <summary>
    /// Es la clase que hace las operaciones de Agregar, eliminar y editar del sistema a la bd
    /// </summary>
    public class CRUD
    {
        /// <summary>
        /// constructor de la clase
        /// </summary>
        public CRUD()
        {
            //
            // TODO: Agregar aquí la lógica del constructor
            //
        }

        /// <summary>
        /// añade una registro a una tabla de la base de datos
        /// </summary>
        public static bool Add_Fila(dynamic _nuevo)
        {
            GrupoLiEntities contexto = new GrupoLiEntities();
            bool bError = true;

            try
            {
                if (_nuevo.GetType() == typeof(lista_actividad)) { contexto.lista_actividad.Add(_nuevo); }
                else if (_nuevo.GetType() == typeof(alarma)) { contexto.alarma.Add(_nuevo); }
                else if (_nuevo.GetType() == typeof(at_it_el_pa)) { contexto.at_it_el_pa.Add(_nuevo); }
                else if (_nuevo.GetType() == typeof(Pregunta)) { contexto.Pregunta.Add(_nuevo); }
                else if (_nuevo.GetType() == typeof(perfil_cargo)) { contexto.perfil_cargo.Add(_nuevo); }
                else if (_nuevo.GetType() == typeof(Respuesta)) { contexto.Respuesta.Add(_nuevo); }
                else if (_nuevo.GetType() == typeof(area)) { contexto.area.Add(_nuevo); }
                else if (_nuevo.GetType() == typeof(brigada_emergencia)) { contexto.brigada_emergencia.Add(_nuevo); }
                else if (_nuevo.GetType() == typeof(categoria)) { contexto.categoria.Add(_nuevo); }
                else if (_nuevo.GetType() == typeof(documento)) { contexto.documento.Add(_nuevo); }
                else if (_nuevo.GetType() == typeof(desc_socio)) { contexto.desc_socio.Add(_nuevo); }
                else if (_nuevo.GetType() == typeof(empleo_anterior)) { contexto.empleo_anterior.Add(_nuevo); }
                else if (_nuevo.GetType() == typeof(empresa)) { contexto.empresa.Add(_nuevo); }
                else if (_nuevo.GetType() == typeof(empresa_itemdivision)) { contexto.empresa_itemdivision.Add(_nuevo); }
                else if (_nuevo.GetType() == typeof(encuesta_politica)) { contexto.encuesta_politica.Add(_nuevo); }
                else if (_nuevo.GetType() == typeof(epp)) { contexto.epp.Add(_nuevo); }
                else if (_nuevo.GetType() == typeof(estatus)) { contexto.estatus.Add(_nuevo); }
                else if (_nuevo.GetType() == typeof(extintor)) { contexto.extintor.Add(_nuevo); }
                else if (_nuevo.GetType() == typeof(factor_riesgo)) { contexto.factor_riesgo.Add(_nuevo); }
                else if (_nuevo.GetType() == typeof(gestion_laboral)) { contexto.gestion_laboral.Add(_nuevo); }
                else if (_nuevo.GetType() == typeof(historia_clinica_ocupacional)) { contexto.historia_clinica_ocupacional.Add(_nuevo); }
                else if (_nuevo.GetType() == typeof(horario)) { contexto.horario.Add(_nuevo); }
                else if (_nuevo.GetType() == typeof(investigacion_ac_in)) { contexto.investigacion_ac_in.Add(_nuevo); }
                else if (_nuevo.GetType() == typeof(matriz_responsabilidad)) { contexto.matriz_responsabilidad.Add(_nuevo); }
                else if (_nuevo.GetType() == typeof(medida_sucursal)) { contexto.medida_sucursal.Add(_nuevo); }
                else if (_nuevo.GetType() == typeof(norma_sucursal)) { contexto.norma_sucursal.Add(_nuevo); }
                else if (_nuevo.GetType() == typeof(obligacion)) { contexto.obligacion.Add(_nuevo); }
                else if (_nuevo.GetType() == typeof(plan)) { contexto.plan.Add(_nuevo); }
                else if (_nuevo.GetType() == typeof(plan_trabajo)) { contexto.plan_trabajo.Add(_nuevo); }
                else if (_nuevo.GetType() == typeof(politica_sst)) { contexto.politica_sst.Add(_nuevo); }
                else if (_nuevo.GetType() == typeof(procedimiento_comunicacion)) { contexto.procedimiento_comunicacion.Add(_nuevo); }
                else if (_nuevo.GetType() == typeof(puesto_trabajo)) { contexto.puesto_trabajo.Add(_nuevo); }
                else if (_nuevo.GetType() == typeof(puesto_trabajo_epp)) { contexto.puesto_trabajo_epp.Add(_nuevo); }
                else if (_nuevo.GetType() == typeof(sucursal)) { contexto.sucursal.Add(_nuevo); }
                else if (_nuevo.GetType() == typeof(tipo_documento)) { contexto.tipo_documento.Add(_nuevo); }
                else if (_nuevo.GetType() == typeof(tipo_epp)) { contexto.tipo_epp.Add(_nuevo); }
                else if (_nuevo.GetType() == typeof(trabajador)) { contexto.trabajador.Add(_nuevo); }
                else if (_nuevo.GetType() == typeof(trabajador_estatus)) { contexto.trabajador_estatus.Add(_nuevo); }
                else if (_nuevo.GetType() == typeof(trabajador_gestion)) { contexto.trabajador_gestion.Add(_nuevo); }
                else if (_nuevo.GetType() == typeof(usuario)) { contexto.usuario.Add(_nuevo); }
                else if (_nuevo.GetType() == typeof(soporte)) { contexto.soporte.Add(_nuevo); }
                else if (_nuevo.GetType() == typeof(identificacion_peligro)) { contexto.identificacion_peligro.Add(_nuevo); }
                else if (_nuevo.GetType() == typeof(identificacion_puesto)) { contexto.identificacion_puesto.Add(_nuevo); }
                else if (_nuevo.GetType() == typeof(factor_identificacion)) { contexto.factor_identificacion.Add(_nuevo); }
                else if (_nuevo.GetType() == typeof(evaluacion_riesgo)) { contexto.evaluacion_riesgo.Add(_nuevo); }
                else if (_nuevo.GetType() == typeof(senalizacion)) { contexto.senalizacion.Add(_nuevo); }
                else if (_nuevo.GetType() == typeof(rol)) { contexto.rol.Add(_nuevo); }

                contexto.SaveChanges();
            }
            catch (Exception e)
            {
                bError = false;
                Utilidades.LogMessage("Execpción: " + e);
            }

            return bError;
        }

        /// <summary>
        /// edita una registro de una tabla de la base de datos
        /// </summary>
        public static bool Edit_Fila(GrupoLiEntities contexto)
        {
            bool bError = true;

            try
            {
                contexto.SaveChanges();
            }
            catch (Exception e)
            {
                bError = false; Utilidades.LogMessage("Execpción: " + e);
            }

            return bError;
        }

        /// <summary>
        /// elimina una registro de una tabla de la base de datos
        /// </summary>
        public static bool Delete_Fila(dynamic tabla, int _id)
        {
            GrupoLiEntities contexto = new GrupoLiEntities();
            bool bError = true;

            try
            {
                if (tabla.GetType() == typeof(alarma))
                {
                    var Eliminar = new alarma { id_alarmas = _id };
                    contexto.alarma.Attach(Eliminar);
                    contexto.alarma.Remove(Eliminar);
                }
                else if (tabla.GetType() == typeof(at_it_el_pa))
                {
                    var Eliminar = new at_it_el_pa { id_at_it_el_pa = _id };
                    contexto.at_it_el_pa.Attach(Eliminar);
                    contexto.at_it_el_pa.Remove(Eliminar);
                }
                else if (tabla.GetType() == typeof(area))
                {
                    var Eliminar = new area { id_area = _id };
                    contexto.area.Attach(Eliminar);
                    contexto.area.Remove(Eliminar);
                }
                else if (tabla.GetType() == typeof(categoria))
                {
                    var Eliminar = new categoria { id_categorias = _id };
                    contexto.categoria.Attach(Eliminar);
                    contexto.categoria.Remove(Eliminar);
                }
                else if (tabla.GetType() == typeof(documento))
                {
                    var Eliminar = new documento { id_documento = _id };
                    contexto.documento.Attach(Eliminar);
                    contexto.documento.Remove(Eliminar);
                }
                else if (tabla.GetType() == typeof(desc_socio))
                {
                    var Eliminar = new desc_socio { id_desc_socio = _id };
                    contexto.desc_socio.Attach(Eliminar);
                    contexto.desc_socio.Remove(Eliminar);
                }
                else if (tabla.GetType() == typeof(encuesta_politica))
                {
                    var Eliminar = new encuesta_politica { id_encuesta = _id };
                    contexto.encuesta_politica.Attach(Eliminar);
                    contexto.encuesta_politica.Remove(Eliminar);
                }
                else if (tabla.GetType() == typeof(epp))
                {
                    var Eliminar = new epp { id_epp = _id };
                    contexto.epp.Attach(Eliminar);
                    contexto.epp.Remove(Eliminar);
                }
                else if (tabla.GetType() == typeof(estatus))
                {
                    var Eliminar = new estatus { id_estatus = _id };
                    contexto.estatus.Attach(Eliminar);
                    contexto.estatus.Remove(Eliminar);
                }
                else if (tabla.GetType() == typeof(extintor))
                {
                    var Eliminar = new extintor { id_extintor = _id };
                    contexto.extintor.Attach(Eliminar);
                    contexto.extintor.Remove(Eliminar);
                }
                else if (tabla.GetType() == typeof(factor_riesgo))
                {
                    var Eliminar = new factor_riesgo { id_factor_riesgo = _id };
                    contexto.factor_riesgo.Attach(Eliminar);
                    contexto.factor_riesgo.Remove(Eliminar);
                }
                else if (tabla.GetType() == typeof(gestion_laboral))
                {
                    var Eliminar = new gestion_laboral { id_ges_lab = _id };
                    contexto.gestion_laboral.Attach(Eliminar);
                    contexto.gestion_laboral.Remove(Eliminar);
                }
                else if (tabla.GetType() == typeof(historia_clinica_ocupacional))
                {
                    var Eliminar = new historia_clinica_ocupacional { id_his_cli_ocu = _id };
                    contexto.historia_clinica_ocupacional.Attach(Eliminar);
                    contexto.historia_clinica_ocupacional.Remove(Eliminar);
                }
                else if (tabla.GetType() == typeof(horario))
                {
                    var Eliminar = new horario { id_horario = _id };
                    contexto.horario.Attach(Eliminar);
                    contexto.horario.Remove(Eliminar);
                }
                else if (tabla.GetType() == typeof(matriz_responsabilidad))
                {
                    var Eliminar = new matriz_responsabilidad { id_matriz_responsabilidad = _id };
                    contexto.matriz_responsabilidad.Attach(Eliminar);
                    contexto.matriz_responsabilidad.Remove(Eliminar);
                }
                else if (tabla.GetType() == typeof(obligacion))
                {
                    var Eliminar = new obligacion { id_obligacion = _id };
                    contexto.obligacion.Attach(Eliminar);
                    contexto.obligacion.Remove(Eliminar);
                }
                else if (tabla.GetType() == typeof(plan))
                {
                    var Eliminar = new plan { id_plan = _id };
                    contexto.plan.Attach(Eliminar);
                    contexto.plan.Remove(Eliminar);
                }
                else if (tabla.GetType() == typeof(plan_trabajo))
                {
                    var Eliminar = new plan_trabajo { id_plan_trabajo = _id };
                    contexto.plan_trabajo.Attach(Eliminar);
                    contexto.plan_trabajo.Remove(Eliminar);
                }
                else if (tabla.GetType() == typeof(Pregunta))
                {
                    var Eliminar = new Pregunta { id_pregunta = _id };
                    contexto.Pregunta.Attach(Eliminar);
                    contexto.Pregunta.Remove(Eliminar);
                }
                else if (tabla.GetType() == typeof(perfil_cargo))
                {
                    var Eliminar = new perfil_cargo { id_perfil_cargo = _id };
                    contexto.perfil_cargo.Attach(Eliminar);
                    contexto.perfil_cargo.Remove(Eliminar);
                }
                else if (tabla.GetType() == typeof(politica_sst))
                {
                    var Eliminar = new politica_sst { id_politica = _id };
                    contexto.politica_sst.Attach(Eliminar);
                    contexto.politica_sst.Remove(Eliminar);
                }
                else if (tabla.GetType() == typeof(puesto_trabajo))
                {
                    var Eliminar = new puesto_trabajo { id_puesto_trabajo = _id };
                    contexto.puesto_trabajo.Attach(Eliminar);
                    contexto.puesto_trabajo.Remove(Eliminar);
                }
                else if (tabla.GetType() == typeof(puesto_trabajo_epp))
                {
                    var Eliminar = new puesto_trabajo_epp { id_puesto_trabajo_epp = _id };
                    contexto.puesto_trabajo_epp.Attach(Eliminar);
                    contexto.puesto_trabajo_epp.Remove(Eliminar);
                }
                else if (tabla.GetType() == typeof(sucursal))
                {
                    var Eliminar = new sucursal { id_sucursal = _id };
                    contexto.sucursal.Attach(Eliminar);
                    contexto.sucursal.Remove(Eliminar);
                }
                else if (tabla.GetType() == typeof(tipo_documento))
                {
                    var Eliminar = new tipo_documento { id_tipo_documento = _id };
                    contexto.tipo_documento.Attach(Eliminar);
                    contexto.tipo_documento.Remove(Eliminar);
                }
                else if (tabla.GetType() == typeof(tipo_epp))
                {
                    var Eliminar = new tipo_epp { id_tipo_epp = _id };
                    contexto.tipo_epp.Attach(Eliminar);
                    contexto.tipo_epp.Remove(Eliminar);
                }
                else if (tabla.GetType() == typeof(trabajador))
                {
                    var Eliminar = new trabajador { id_trabajador = _id };
                    contexto.trabajador.Attach(Eliminar);
                    contexto.trabajador.Remove(Eliminar);
                }
                else if (tabla.GetType() == typeof(trabajador_gestion))
                {
                    //contexto.trabajador_gestion.RemoveRange(contexto.trabajador_gestion.Where(x => x.id_ges_lab == _id));
                }
                else if (tabla.GetType() == typeof(usuario))
                {
                    var Eliminar = new usuario { id_usuario = _id };
                    contexto.usuario.Attach(Eliminar);
                    contexto.usuario.Remove(Eliminar);
                }
                else if (tabla.GetType() == typeof(investigacion_ac_in))
                {
                    var Eliminar = new investigacion_ac_in { id_inv_ac_in = _id };
                    contexto.investigacion_ac_in.Attach(Eliminar);
                    contexto.investigacion_ac_in.Remove(Eliminar);
                }
                else if (tabla.GetType() == typeof(identificacion_peligro))
                {
                    var Eliminar = new identificacion_peligro { id_identificacion_peligro = _id };
                    contexto.identificacion_peligro.Attach(Eliminar);
                    contexto.identificacion_peligro.Remove(Eliminar);
                }
                else if (tabla.GetType() == typeof(evaluacion_riesgo))
                {
                    var Eliminar = new evaluacion_riesgo { id_evaluacion_riesgo = _id };
                    contexto.evaluacion_riesgo.Attach(Eliminar);
                    contexto.evaluacion_riesgo.Remove(Eliminar);
                }
                else if (tabla.GetType() == typeof(empresa))
                {
                    var Eliminar = new empresa { id_empresa = _id };
                    contexto.empresa.Attach(Eliminar);
                    contexto.empresa.Remove(Eliminar);
                }
                else if (tabla.GetType() == typeof(rol))
                {
                    var Eliminar = new rol { id_rol = _id };
                    contexto.rol.Attach(Eliminar);
                    contexto.rol.Remove(Eliminar);
                }
                else if (tabla.GetType() == typeof(senalizacion))
                {
                    var Eliminar = new senalizacion { id_senalizacion = _id };
                    contexto.senalizacion.Attach(Eliminar);
                    contexto.senalizacion.Remove(Eliminar);
                }

                contexto.SaveChanges();
            }
            catch (Exception e)
            {
                bError = false; Utilidades.LogMessage("Execpción: " + e);
            }


            return bError;
        }


        public static bool AddAutoEvaluacion(Tuple<int, int> IdEmpSuc, String[] valores, FileUpload flpArchivo)
        {
            int IdEmpresa = IdEmpSuc.Item1;
            int IdSucursal = IdEmpSuc.Item2;
            Boolean berror = false;
            string _ruta = Utilidades.GuardarArchivo(flpArchivo, IdEmpresa + valores[0], Paginas.Archivos_Autoevaluacion.Value);

            DateTime fecha = new DateTime(Convert.ToInt32(valores[1]), 1, 1);

            documento nuevo = new documento()
            {
                nombre = valores[2],
                ruta = _ruta,
                fecha_subida = fecha,
                id_tabla = IdSucursal,
                tipo = TipoDocumento.Auto_Evaluacion.Value
            };

            berror = Add_Fila(nuevo);

            if (berror)
            {
                GrupoLiEntities contexto = new GrupoLiEntities();
                lista_actividad Edit = contexto.lista_actividad.SingleOrDefault(b => b.id_sucursal == IdSucursal);
                if (Edit != null)
                {
                    Edit.estatus = "Si";
                }
                berror = CRUD.Edit_Fila(contexto);

            }

            return berror;
        }

        public static bool DeleteAutoEvaluacion(String idAutoEvaluacion, Model_UsuarioSistema ObjUsuario)
        {
            int idAuto = Convert.ToInt32(idAutoEvaluacion);
            int idSucursal = 0;

            GrupoLiEntities contexto = new GrupoLiEntities();
            List<documento> ListaDocumento = new List<documento>();
            ListaDocumento = contexto.documento.Where(b => b.id_documento == idAuto).ToList();

            foreach (var item in ListaDocumento)
            {
                idSucursal = Convert.ToInt32(item.id_tabla);
            }

            documento tabla = new documento();
            ObjUsuario.Error = Delete_Fila(tabla, idAuto);

            if (ObjUsuario.Error)
            {
                contexto = new GrupoLiEntities();
                lista_actividad Edit = contexto.lista_actividad.SingleOrDefault(b => b.id_sucursal == idSucursal);
                if (Edit != null)
                {
                    Edit.estatus = "No";
                }
                ObjUsuario.Error = CRUD.Edit_Fila(contexto);

            }

            return ObjUsuario.Error;
        }

        public static bool AddInspeccion(Tuple<int, int> IdEmpSuc, String[] valores, FileUpload flpArchivo)
        {
            int IdEmpresa = IdEmpSuc.Item1;
            int IdSucursal = IdEmpSuc.Item2;

            string ruta = Utilidades.GuardarArchivo(flpArchivo, IdEmpresa + valores[0], Paginas.Archivos_Inspecciones.Value);

            documento nuevo = new documento()
            {
                nombre = valores[0],
                fecha_subida = DateTime.Today.Date,
                id_tabla = IdSucursal,
                tipo = valores[1],
                ruta = ruta
            };

            return Add_Fila(nuevo);
        }

        public static bool AddReporteTrabajadores(Tuple<int, int> IdEmpSuc, String[] valores, FileUpload flpArchivo)
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
            return Add_Fila(nuevo);
        }

        public static bool AddIndicadores(Tuple<int, int> IdEmpSuc, String[] valores, FileUpload flpArchivo)
        {
            int IdEmpresa = IdEmpSuc.Item1;
            int IdSucursal = IdEmpSuc.Item2;

            string ruta = Utilidades.GuardarArchivo(flpArchivo, IdEmpresa + valores[0], Paginas.Archivos_Indicadores.Value);

            documento nuevo = new documento()
            {
                nombre = valores[0],
                fecha_subida = DateTime.Today.Date,
                id_tabla = IdSucursal,
                tipo = valores[1],
                ruta = ruta
            };
            return Add_Fila(nuevo);
        }

        public static bool AddEmpresa(String[] valores, FileUpload fuLogoEmpresa)
        {
            string ruta = Utilidades.GuardarImagen(fuLogoEmpresa, valores[0], Paginas.Archivos_LogosEmpresas.Value);

            if (!ruta.Contains("ERR-"))
            {
                empresa nuevo = new empresa()
                {
                    nombre = valores[0],
                    CodEmpresa = valores[1],
                    nit = valores[2],
                    email = valores[3],
                    representante = valores[4],
                    movil = valores[5],
                    fijo = valores[6],
                    logo_url = ruta,
                    id_arl = Convert.ToInt32(valores[7]),
                    jornada = Convert.ToInt32(valores[8])
                };

                return Add_Fila(nuevo);
            }
            else
            {
                return false;
            }
        }
        public static bool DeleteEmpresa(int IdEmpresa)
        {
            empresa tabla = new empresa();
            return Delete_Fila(tabla, IdEmpresa);
        }

        public static bool AddCodigoCiiu_Empresa(String[] valores)
        {
            empresa_itemdivision nuevo;
            Boolean berror = false;

            #region se guarda la actividad principal
            nuevo = new empresa_itemdivision()
            {
                id_empresa = Convert.ToInt32(valores[0]),
                id_clase_ciiu = Convert.ToInt32(valores[1]),
                num_actividad = "Actividad Principal"
            };
            berror = CRUD.Add_Fila(nuevo);
            #endregion

            #region se guarda la actividad secundaria
            if (valores[2] != string.Empty)
            {
                nuevo = new empresa_itemdivision()
                {
                    id_empresa = Convert.ToInt32(valores[0]),
                    id_clase_ciiu = Convert.ToInt32(valores[2]),
                    num_actividad = "Actividad Secundaria"
                };
                berror = CRUD.Add_Fila(nuevo);
            }
            #endregion

            #region se guarda la tercera actividad
            if (valores[3] != string.Empty)
            {
                nuevo = new empresa_itemdivision()
                {
                    id_empresa = Convert.ToInt32(valores[0]),
                    id_clase_ciiu = Convert.ToInt32(valores[3]),
                    num_actividad = "Otras Actividades"
                };
                berror = Add_Fila(nuevo);
            }
            #endregion

            return berror;
        }
        public static bool Add_Categoria_Empresa(String[] valores)
        {
            List<categoria> Listacategoria = new List<categoria>();

            Boolean berror = false;

            for (int i = 0; i < ValoresDefault.Nombre_Categorias.Value.Length; i++)
            {
                categoria ListaCategoria = new categoria();

                string nombreCat = ValoresDefault.Nombre_Categorias.Value[i];

                ListaCategoria.nombre = ValoresDefault.Nombre_Categorias.Value[i];

                ListaCategoria.descripcion = ValoresDefault.Descripcion_Categorias.Value[i];
                ListaCategoria.id_empresa = Convert.ToInt32(valores[0]);

                Listacategoria.Add(ListaCategoria);

                berror = Add_Fila(ListaCategoria);

                if (!berror)
                {
                    i = valores.Length;
                }
            }

            return berror;
        }
        public static bool Add_Estatus_Empresa(String[] valores)
        {
            List<estatus> ListaEstatus = new List<estatus>();
            Boolean berror = false;
            for (int i = 0; i < ValoresDefault.Nombre_Estatus.Value.Length; i++)
            {
                estatus ObjEstatus = new estatus();
                ObjEstatus.nombre = ValoresDefault.Nombre_Estatus.Value[i];
                ObjEstatus.descripcion = ValoresDefault.Descripcion_Estatus.Value[i];
                ObjEstatus.id_empresa = Convert.ToInt32(valores[0]);

                ListaEstatus.Add(ObjEstatus);

                berror = Add_Fila(ObjEstatus);

                if (!berror)
                {
                    i = valores.Length;
                }
            }

            return berror;
        }
        public static bool Add_TipoEpp_Empresa(Model_UsuarioSistema ObjUsuario)
        {
            int errores = 0;

            for (int i = 0; i < ValoresDefault.Nombre_TipoEpp.Value.Length; i++)
            {
                tipo_epp ObjTipoEpp = new tipo_epp();
                ObjTipoEpp.nombre = ValoresDefault.Nombre_TipoEpp.Value[i];
                ObjTipoEpp.nombre_senal = ValoresDefault.Descripcion_TipoEpp.Value[i];
                ObjTipoEpp.url_senal = Paginas.URL_Señalizacion.Value + ValoresDefault.Nombre_TipoEpp.Value[i] + ".jpg";

                ObjUsuario.Error = CRUD.Add_Fila(ObjTipoEpp);

                if (!ObjUsuario.Error)
                {
                    errores++;
                    i = ValoresDefault.Nombre_TipoEpp.Value.Length;
                }
            }

            if (errores == 0)
            {
                return true;
            }
            else
            {
                return false;
            }
        }
        public static bool Add_Epp_Empresa(Model_UsuarioSistema ObjUsuario)
        {
            List<tipo_epp> TpoEppEmpresa = new List<tipo_epp>();
            epp ObjEpp = new epp();
            int posTipo = 0;

            foreach (var dato in TpoEppEmpresa)
            {
                ObjEpp = new epp();

                for (int i = 0; i < 65; i++)
                {
                    if (posTipo == 0 && i == 0) { ObjEpp.id_tipo_epp = dato.id_tipo_epp; ObjEpp.nombre = ValoresDefault.Nombre_Epp.Value[i]; }
                    else if (posTipo == 1 && i > 0 && i < 3) { ObjEpp.id_tipo_epp = dato.id_tipo_epp; ObjEpp.nombre = ValoresDefault.Nombre_Epp.Value[i]; }
                    else if (posTipo == 2 && i > 2 && i < 8) { ObjEpp.id_tipo_epp = dato.id_tipo_epp; ObjEpp.nombre = ValoresDefault.Nombre_Epp.Value[i]; }
                    else if (posTipo == 3 && i == 8) { ObjEpp.id_tipo_epp = dato.id_tipo_epp; ObjEpp.nombre = ValoresDefault.Nombre_Epp.Value[i]; }
                    else if (posTipo == 4 && i > 8 && i < 13) { ObjEpp.id_tipo_epp = dato.id_tipo_epp; ObjEpp.nombre = ValoresDefault.Nombre_Epp.Value[i]; }
                    else if (posTipo == 5 && i == 13) { ObjEpp.id_tipo_epp = dato.id_tipo_epp; ObjEpp.nombre = ValoresDefault.Nombre_Epp.Value[i]; }
                    else if (posTipo == 6 && i == 14) { ObjEpp.id_tipo_epp = dato.id_tipo_epp; ObjEpp.nombre = ValoresDefault.Nombre_Epp.Value[i]; }
                    else if (posTipo == 7 && i > 14 && i < 22) { ObjEpp.id_tipo_epp = dato.id_tipo_epp; ObjEpp.nombre = ValoresDefault.Nombre_Epp.Value[i]; }
                    else if (posTipo == 8 && i > 21 && i < 33) { ObjEpp.id_tipo_epp = dato.id_tipo_epp; ObjEpp.nombre = ValoresDefault.Nombre_Epp.Value[i]; }
                    else if (posTipo == 9 && i > 32 && i < 38) { ObjEpp.id_tipo_epp = dato.id_tipo_epp; ObjEpp.nombre = ValoresDefault.Nombre_Epp.Value[i]; }
                    else if (posTipo == 10 && i == 38) { ObjEpp.id_tipo_epp = dato.id_tipo_epp; ObjEpp.nombre = ValoresDefault.Nombre_Epp.Value[i]; }
                    else if (posTipo == 11 && i > 38 && i < 41) { ObjEpp.id_tipo_epp = dato.id_tipo_epp; ObjEpp.nombre = ValoresDefault.Nombre_Epp.Value[i]; }
                    else if (posTipo == 12 && i == 41) { ObjEpp.id_tipo_epp = dato.id_tipo_epp; ObjEpp.nombre = ValoresDefault.Nombre_Epp.Value[i]; }
                    else if (posTipo == 13 && i > 41 && i < 44) { ObjEpp.id_tipo_epp = dato.id_tipo_epp; ObjEpp.nombre = ValoresDefault.Nombre_Epp.Value[i]; }
                    else if (posTipo == 14 && i > 43 && i < 46) { ObjEpp.id_tipo_epp = dato.id_tipo_epp; ObjEpp.nombre = ValoresDefault.Nombre_Epp.Value[i]; }
                    else if (posTipo == 15 && i > 45 && i < 54) { ObjEpp.id_tipo_epp = dato.id_tipo_epp; ObjEpp.nombre = ValoresDefault.Nombre_Epp.Value[i]; }
                    else if (posTipo == 16 && i > 53 && i < 60) { ObjEpp.id_tipo_epp = dato.id_tipo_epp; ObjEpp.nombre = ValoresDefault.Nombre_Epp.Value[i]; }
                    else if (posTipo == 17 && i == 60) { ObjEpp.id_tipo_epp = dato.id_tipo_epp; ObjEpp.nombre = ValoresDefault.Nombre_Epp.Value[i]; }
                    else if (posTipo == 18 && i > 60) { ObjEpp.id_tipo_epp = dato.id_tipo_epp; ObjEpp.nombre = ValoresDefault.Nombre_Epp.Value[i]; }
                }
                posTipo++;

                ObjUsuario.Error = Add_Fila(ObjEpp);

                if (!ObjUsuario.Error)
                {
                    return false;
                }
            }

            return ObjUsuario.Error;
        }
        public static bool Add_Sucursal_Empresa(String[] valores)
        {
            sucursal nuevo = new sucursal()
            {
                nombre = valores[0],
                id_municpio = Convert.ToInt32(valores[1]),
                id_empresa = Convert.ToInt32(valores[2]),
                direccion = valores[3],
                sede_principal = 1,
                representante = valores[4],
                movil = valores[5],
                fijo = valores[6],
                actividad_ppal = 0,
                actividad_sec = 0,
                actividad_otra = 0
            };

            return Add_Fila(nuevo);
        }
        public static bool Add_Area_Sucursal(String[] valores)
        {
            area nuevo = new area()
            {
                nombre = valores[0],
                id_sucursal = Convert.ToInt32(valores[1]),
                id_area_padre = 0,
                nivel = 1,
                tipo = "Administrativa"
            };

            return Add_Fila(nuevo);
        }
        public static bool Add_PuestoTrabajo_Sucursal(String[] valores)
        {
            puesto_trabajo nuevo = new puesto_trabajo()
            {
                nombre = "Puesto de Trabajo Default " + valores[0],
                descripcion = "Descripcion del Puesto Default",
                id_area = GetterMax.Areas()
            };
            return Add_Fila(nuevo);
        }
        public static bool Add_Horario_Sucursal(String[] valores)
        {
            horario nuevo = new horario()
            {
                nombre = "Horario Default " + valores[0],
                id_empresa = GetterMax.Empresas(),
                fecha_inicio = "12:00",
                fecha_fin = "01:00",
                fecha_creacion = DateTime.Today
            };
            return Add_Fila(nuevo);
        }
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
                id_puesto_trabajo = GetterMax.PuestoTrabajo(),
                es_discapacitado = "No",
                desc_discapacidad = "---",
                id_horario = GetterMax.Horario(),
                id_estatus_actual = 1,
                fecha_ingreso = DateTime.Now
            };
            return Add_Fila(nuevo);
        }
        public static bool Add_Usuario_Sucursal(String[] valores)
        {
            usuario nuevo = new usuario()
            {
                login = valores[0],
                clave = valores[1],
                id_trabajador = GetterMax.Trabajador(),
                id_rol = Convert.ToInt32(valores[2])
            };

            return Add_Fila(nuevo);
        }
        public static bool Add_TipoDocumento_Sucursal(String[] valores)
        {
            List<tipo_documento> ListaTipoDocumento = new List<tipo_documento>();
            Boolean berror = false;

            for (int i = 0; i < 41; i++)
            {
                tipo_documento ObjTipoDocumento = new tipo_documento();
                ObjTipoDocumento.id_sucursal = Convert.ToInt32(valores[0]);
                ObjTipoDocumento.nombre = ValoresDefault.Nombre_TipoDocumento.Value[i];
                ObjTipoDocumento.dirigida = ValoresDefault.Dirigida_TipoDocumento.Value[i];
                ObjTipoDocumento.modalidad = ValoresDefault.Modalidad_TipoDocumento.Value[i];
                ObjTipoDocumento.responsable = ValoresDefault.Responsable_TipoDocumento.Value[i];
                ObjTipoDocumento.aprobado = ValoresDefault.Aprobado_TipoDocumento.Value[i];
                ObjTipoDocumento.archivado = ValoresDefault.Archivado_TipoDocumento.Value[i];
                ObjTipoDocumento.estatus = "No Cumplido";
                ListaTipoDocumento.Add(ObjTipoDocumento);

                berror = Add_Fila(ObjTipoDocumento);

                if (!berror)
                {
                    return berror;
                }
            }

            return berror;
        }

        public static bool Add_PuestoTrabajo(Model_UsuarioSistema ObjUsuario, String[] valores, FileUpload fuAnexo, ListBox ddlEpp)
        {
            string ruta = Utilidades.GuardarImagen(fuAnexo, valores[0] + "PuestoTrabajo", Paginas.Archivos_PuestoTrabajo.Value);

            puesto_trabajo nuevo = new puesto_trabajo()
            {
                nombre = valores[0],
                descripcion = valores[1],
                recurso_humano = valores[2],
                objeto_trabajo = valores[3],
                insumos = valores[4],
                maquinas = valores[5],
                herramientas = valores[6],
                emisiones = valores[7],
                productos = valores[8],
                desechos = valores[9],
                foto = ruta,
                id_area = Convert.ToInt32(valores[10])
            };


            int IdUsuario = ObjUsuario.Id_usuario;
            DateTime fechaActual = DateTime.Now;
            Boolean bError = false;

            if (Add_Fila(nuevo))
            {
                if (ddlEpp.SelectedValue != string.Empty)
                {
                    foreach (ListItem li in ddlEpp.Items)
                    {
                        if (li.Selected)
                        {
                            puesto_trabajo_epp nuevopuestoEpp = new puesto_trabajo_epp()
                            {
                                id_puesto_trabajo = Convert.ToInt32(GetterMax.PuestoTrabajo()),
                                id_epp = Convert.ToInt32(li.Value)
                            };
                            bError = Add_Fila(nuevopuestoEpp);

                            if (!bError)
                            {
                                return bError;
                            }
                        }
                    }
                }
            }

            return bError;


        }
        public static bool Add_Sucursal(String[] valores)
        {
            sucursal nuevo = new sucursal()
            {
                nombre = valores[0],
                id_municpio = Convert.ToInt32(valores[1]),
                id_empresa = Convert.ToInt32(valores[2]),
                direccion = valores[3],
                sede_principal = 0,
                representante = valores[4],
                movil = valores[5],
                fijo = valores[6],
                actividad_ppal = Convert.ToInt32(valores[7]),
                actividad_sec = Convert.ToInt32(valores[8]),
                actividad_otra = Convert.ToInt32(valores[9]),
            };

            return Add_Fila(nuevo);
        }
        public static bool DeleteSucursal(int id_sucursal)
        {
            sucursal tabla = new sucursal();
            return Delete_Fila(tabla, id_sucursal);
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

            if (Add_Fila(nuevo))
            {
                int idTrabajador = GetterMax.Trabajador();
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
                berror = Add_Fila(nuevoTE);

            }


            return berror;
        }

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
                    DeleteSucursal(Convert.ToInt32(valores[3]));
                    return false;
                }

                #endregion

                #region se guarda la identificacion del puesto

                int id_IdentificacionPeligro = Convert.ToInt32(GetterMax.IdentificacionPeligro());
                identificacion_puesto nuevoIde_Puesto = new identificacion_puesto()
                {
                    id_puesto = Convert.ToInt32(GetterMax.PuestoTrabajo()),
                    id_identificacion = id_IdentificacionPeligro
                };
                contexto.identificacion_puesto.Add(nuevoIde_Puesto);
                try
                {
                    contexto.SaveChanges();
                }
                catch
                {
                    DeleteSucursal(Convert.ToInt32(valores[3]));
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
                    DeleteSucursal(Convert.ToInt32(valores[3]));
                    return false;
                }

                #endregion
            }

            return true;

        }
        public static bool Add_Normas_Sucursal(String[] valores)
        {
            GrupoLiEntities contexto = new GrupoLiEntities();

            #region insertar normas generales
            List<norma> normasGeneral = Getter.Norma(0, "General");

            foreach (var item in normasGeneral)
            {
                norma_sucursal nuevo = new norma_sucursal()
                {
                    id_sucursal = Convert.ToInt32(valores[3]),
                    id_normas = item.id_normas,
                    estatus_norma = 0
                };
                contexto.norma_sucursal.Add(nuevo);

            }
            #endregion

            #region insertar normas jurisprudencia y especifica
            List<norma_claseciiu> ListaNormas = new List<norma_claseciiu>();

            int act1 = Convert.ToInt32(valores[0]);
            int act2 = Convert.ToInt32(valores[1]);
            int act3 = Convert.ToInt32(valores[2]);

            ListaNormas = contexto.norma_claseciiu.Where(x =>
                x.id_clase_ciiu == act1 ||
                x.id_clase_ciiu == act2 ||
                x.id_clase_ciiu == act3
                ).ToList();

            var distinctList = ListaNormas
                .GroupBy(x => new { x.norma.documento, x.norma.anho, x.norma.articulo, x.norma.literal })
                .Select(g => g.First()).ToList();

            foreach (var item in distinctList)
            {
                norma_sucursal nuevo = new norma_sucursal()
                {
                    id_sucursal = Convert.ToInt32(valores[3]),
                    id_normas = item.id_normas,
                    estatus_norma = 0
                };
                contexto.norma_sucursal.Add(nuevo);

            }
            #endregion

            try
            {
                contexto.SaveChanges();
            }
            catch
            {
                DeleteSucursal(Convert.ToInt32(valores[3]));
                return false;
            }

            return true;
        }
        public static bool Add_Medidas_Sucursal(int id_sucursal)
        {
            GrupoLiEntities contexto = new GrupoLiEntities();
            List<norma_sucursal> ListaNormasSucursal = Getter.Normas_Sucursal(id_sucursal, 0);

            foreach (var item in ListaNormasSucursal)
            {
                foreach (var item1 in item.norma.medida)
                {
                    medida_sucursal nuevo = new medida_sucursal()
                    {
                        id_normas_sucursal = item.id_normas_sucursal,
                        descripcion = item1.descripcion,
                        estatus_medida = 0,
                        aplica = 1
                    };

                    contexto.medida_sucursal.Add(nuevo);
                }
            }

            try
            {
                contexto.SaveChanges();
            }
            catch
            {
                DeleteSucursal(id_sucursal);
                return false;
            }
            return true;
        }

        public static bool Add_Lista_Actividad(int id_sucursal)
        {
            lista_actividad nuevo = new lista_actividad()
            {
                actividad = "Crear Documento de Autoevaluación",
                id_sucursal = id_sucursal,
                estatus = "No",
                fase = "E",
                link = "../EvaluacionInicial/index_AutoEvaluacion.aspx",
                anho = DateTime.Now.Year
            };

            return Add_Fila(nuevo);
        }

        public static bool Add_Area(CheckBox chkAreaPadre, String[] valores)
        {
            int id_area_padre = 0;

            if (!chkAreaPadre.Checked || (valores[0] == string.Empty))
            {
                valores[1] = "1";
            }
            else
            {
                id_area_padre = Convert.ToInt32(valores[0]);

                List<area> ListaArea = new List<area>();
                ListaArea = Getter.Area(0, Convert.ToInt32(valores[0]), "");

                foreach (var item in ListaArea)
                {
                    valores[1] = item.nivel.ToString();
                }

                if (valores[1] == "1") { valores[1] = "2"; }
                else if (valores[1] == "2") { valores[1] = "3"; }
                else if (valores[1] == "3") { valores[1] = "4"; }
            }

            area nuevo = new area()
            {
                nombre = valores[2],
                id_sucursal = Convert.ToInt32(valores[3]),
                id_area_padre = id_area_padre,
                nivel = Convert.ToInt32(valores[1]),
                tipo = valores[4]
            };

            return Add_Fila(nuevo);

        }

        public static bool Add_Pregunta(Model_UsuarioSistema ObjUsuario, String[] valores)
        {
            Pregunta nuevo = new Pregunta()
            {
                titulo = valores[0],
                cuerpo_pregunta = valores[1],
                id_usuario = ObjUsuario.Id_usuario,
                estatus = 0,
                fecha = DateTime.Now
            };

            return Add_Fila(nuevo);
        }

        public static bool Add_Respuesta(String[] valores)
        {
            Respuesta nuevo = new Respuesta()
            {
                cuerpo_respuesta = valores[0],
                usuario = valores[1],
                id_pregunta = Convert.ToInt32(valores[2]),
                fecha = DateTime.Now,
                calificacion = 0
            };

            return Add_Fila(nuevo);
        }

        //Senalizacion
        public static bool AddSenalizacion(String[] valores, FileUpload fuImagen)
        {
            string ruta = Utilidades.GuardarImagen(fuImagen, valores[0], Paginas.Archivos_Senalizacion.Value);

            if (!ruta.Contains("ERR-"))
            {
                senalizacion nuevo = new senalizacion()
                {
                    nombre = valores[0],
                    descripcion = valores[1],
                    url_imagen = ruta
                };

                return Add_Fila(nuevo);
            }
            else
            {
                return false;
            }
        }

    }
}