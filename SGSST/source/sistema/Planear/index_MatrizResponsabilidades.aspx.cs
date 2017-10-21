using Capa_Datos;
using Capa_Datos.Manager.Sucursal;
using Capa_Datos.Manager.Empresa;
using System;
using System.Collections.Generic;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using Capa_Datos.Manager.Documento;

namespace SGSSTC.source.sistema.Hacer
{
    public partial class index_MatrizResponsabilidades : Page
    {
        private Model_UsuarioSistema ObjUsuario;
        private Tuple<bool, bool> BoolEmpSuc;

        protected void Page_Load(object sender, EventArgs e)
        {
            Page.Form.Attributes.Add("enctype", "multipart/form-data");

            ObjUsuario = Utilidades.ValidarSesion(HttpContext.Current.User.Identity as FormsIdentity, this);
            phAlerta.Visible = false;

            BoolEmpSuc = Mgr_Empresa.Get_Empresa_Sucursal(ObjUsuario);
            phEmpresa.Visible = BoolEmpSuc.Item1;
            phSucursal.Visible = BoolEmpSuc.Item2;

            if (!IsPostBack)
            {
                CargarListas();
                if (BoolEmpSuc.Item2)
                {
                    Mgr_Sucursal.Sucursal(ddlSucursal, ObjUsuario.Id_empresa);
                }
                else
                {
                    cargarMatriz();
                }
            }
        }
        private void CargarListas()
        {
            if (BoolEmpSuc.Item1)
            {
                Mgr_Empresa.Lista_Empresa(ddlEmpresa);
            }
            if (BoolEmpSuc.Item2)
            {
                Mgr_Sucursal.Sucursal(ddlSucursal, ObjUsuario.Id_empresa);
            }
        }
        private void cargarMatriz()
        {
            phTabla.Visible = true;
            int IdSucursal = Mgr_Sucursal.Set_IdSucursalDDl(ObjUsuario, ddlSucursal);
            int idMatriz = Mgr_Documento.Matriz_Responsabilidad(IdSucursal);

            if (idMatriz != 0)
            {
                List<matriz_responsabilidad> ListaMatrizResponsabilidad = new List<matriz_responsabilidad>();
                ListaMatrizResponsabilidad = Mgr_Documento.MatrizResponsabilidad(idMatriz);

                if (ListaMatrizResponsabilidad.Count > 0)
                {
                    foreach (var item in ListaMatrizResponsabilidad)
                    {
                        txt1.Text = item.puesto1;
                        txt2.Text = item.puesto2;
                        txt3.Text = item.puesto3;
                        txt4.Text = item.puesto4;
                        txt5.Text = item.puesto5;
                        txt6.Text = item.puesto6;
                        txt7.Text = item.puesto7;
                        txt8.Text = item.pusto8;
                    }
                }
            }
            else
            {
                #region campo1
                txt1.Text = "<ul><li type='disc'>Definir, firmar y divulgar la política de Seguridad y Salud en el Trabajo a través de un  documento escrito</li>" +
                       "<li type='disc'>Revisar los objetivos de seguridad y salud en el trabajo, establecidos en la Política de SSL</li>" +
                       "<li type='disc'>Asignar, documentar y comunicar las responsabilidades específicas en SSL a todos los niveles de la organización dentro del marco de sus funciones</li>" +
                       "<li type='disc'>Solicitar cuentas o avances informativos del estatus actual a quienes se les hayan delegado responsabilidades en el Sistema de Gestión de la Seguridad y Salud en el Trabajo SGSST</li>" +
                       "<li type='disc'>Documentar de manera escrita o electrónica los progresos en materia de seguridad respecto a las responsabilidades asignadas a cada nivel de la organización</li>" +
                       "<li type='disc'>Definir y asignar los recursos financieros, técnicos y el personal necesario para el diseño, implementación, revisión evaluación y mejora de las medidas de prevención y control de riesgos</li>" +
                       "<li type='disc'>Garantizar el cumplimiento de la normatividad Nacional vigente aplicable en materia de seguridad y salud en el trabajo, Actualizando la matriz legal en la medida que sean emitidas nuevas disposiciones aplicables a la Empresa</li>" +
                       "<li type='disc'>Garantizar la disponibilidad de personal adecuado para liderar y controlar el desarrollo de la seguridad y salud en el trabajo</li>" +
                       "<li type='disc'>Garantizar la consulta y participación de los trabajadores en la identificación de los peligros y control de los riesgos y los canales de comunicación que permitan recolectar la información manifestada por los trabajadores, así como la participación a través del Comité Paritario de Seguridad y Salud en el Trabajo</li>" +
                       "<li type='disc'>Garantizar la capacitación de los trabajadores en los aspectos de seguridad y salud en el trabajo de acuerdo con las características de la Empresa, la identificación de peligros, la evaluación y valoración de riesgos relacionados con su trabajo, incluidas las disposiciones relativas a las situaciones de emergencia</li>" +
                       "<li type='disc'>El empleador debe implementar y desarrollar actividades de prevención de accidentes de trabajo y enfermedades laborales, así como de promoción de la salud en el  SG-SST</li>" +
                       "<li type='disc'>Asegurar la adopción de medidas eficaces que garanticen la participación de todos los trabajadores y sus representantes ante el Comité Paritario o Vigía de Seguridad y Salud en el Trabajo, en la ejecución de la política y también que estos últimos funcionen y cuenten con el tiempo y demás recursos necesarios</li>" +
                       "<li type='disc'>Realizar una auditoría anual al SG-SST con la participación del comité paritario y vigía de seguridad y salud en el trabajo</li>" +
                       "<li type='disc'>Gestionar los peligros y riesgos, desarrollando las medidas  de identificación de peligros, evaluación y valoración de riesgos , estableciendo los controles necesarios para mitigarlos</li>" +
                       "<li type='disc'>Diseñar e implementar un plan de trabajo anual para alcanzar los objetivos propuestos en el sistema de gestión de seguridad y salud en el trabajo, describiendo metas, responsabilidades, recursos y cronograma de actividades</li>" +
                       "<li type='disc'>Garantizar un programa de inducción y entrenamiento para los trabajadores que ingresen a la empresa, independientemente de su forma de contratación y vinculación.</li>" +
                       "<li type='disc'>Garantizar un programa de capacitación acorde con las necesidades específicas detectadas en la identificación de peligros y valoración de riesgos.</li>" +
                       "<li type='disc'>Suministrar al personal de manera gratuita los equipos de protección personal y especificar el deber y la forma correcta de utilizarlos desarrollando las acciones necesarias para que el trabajador utilice los implementos de protección</li>" +
                       "</ul>";
                #endregion

                #region campo2

                txt2.Text = "<ul>" +
                    "<li type='disc'>Planear, organizar, dirigir, desarrollar y aplicar el Sistema de Gestión de la Seguridad y Salud en el Trabajo SG-SST, y como mínimo una (1) vez al año, realizar su evaluación</li>" +
                    "<li type='disc'>Informar a la alta dirección sobre el funcionamiento y los resultados del Sistema de Gestión de la Seguridad y Salud en el Trabajo SG-SST</li>" +
                    "<li type='disc'>Promover la participación de todos los miembros de la Empresa en la implementación del SG-SST</li>" +
                    "<li type='disc'>Definir indicadores que permitan evaluar el sistema de gestión de la seguridad y salud en el trabajo</li>" +
                    "<li type='disc'>Coordinar y elaborar la actualización de la identificación de peligros, evaluación de riesgos y determinación de controles, planes de emergencia y hacer la priorización para focalizar la intervención, teniendo en cuenta reportes de condiciones inseguras y análisis de accidentes e incidentes.</li>" +
                    "<li type='disc'>Validar o construir con los jefes de las unidades los planes de acción y hacer seguimiento a su cumplimiento</li>" +
                    "<li type='disc'>Gestionar los recursos para cumplir con el plan de SG-SST y hacer seguimiento a los indicadores.</li>" +
                    "<li type='disc'>Implementar las acciones preventivas y correctivas necesarias, con base en los resultados de la supervisión y  difundirlas a todos los niveles pertinentes</li>" +
                    "<li type='disc'>Reportar los accidentes y las enfermedades diagnosticadas como laborales dentro de los dos días hábiles siguientes a la ocurrencia del evento </li>" +
                    "</ul>";
                #endregion

                #region campo3
                txt3.Text = "<ul>" +
                        "<li type='disc'>Participar en la actualización del panorama de factores de riesgo</li>" +
                        "<li type='disc'>Participar en la construcción y ejecución de planes de acción</li>" +
                        "<li type='disc'>Promover la comprensión de la política en los trabajadores</li>" +
                        "<li type='disc'>Informar sobre las necesidades de capacitación y entrenamiento en seguridad y salud ocupacional</li>" +
                        "<li type='disc'>Participar en la investigación de los incidentes y accidentes de trabajo,  conformando un equipo investigador del área donde ocurrió el accidente</li>" +
                        "<li type='disc'>Participar en las inspecciones de seguridad</li>" +
                        "</ul>";
                #endregion

                #region campo4

                txt4.Text = "<ul>" +
                    "<li type='disc'>Coordinar con los jefes de las áreas, la elaboración y actualización del panorama de factores de riesgos y hacer la priorización para focalizar la intervención</li>" +
                    "<li type='disc'>Realizar la vigilancia epidemiológica de la salud de los trabajadores, evaluaciones médicas de ingreso, egreso y periódicas</li>" +
                    "<li type='disc'>Cumplimiento de las actividades propuestas en el componente de SST </li>" +
                    "<li type='disc'>Capacitación en materia de prevención según los riesgos prioritarios y los niveles de la organización</li>" +
                    "<li type='disc'>Participar de las reuniones del Comité Paritario y apoyar su gestión</li>" +
                    "<li type='disc'>Apoyar la investigación de los accidentes e incidentes de trabajo.</li>" +
                    "<li type='disc'>Implementación y seguimiento del SG-SST.</li>" +
                    "</ul>";
                #endregion

                #region campo5
                txt5.Text = "<ul>" +
                        "<li type='disc'>Procurar el cuidado integral de su salud</li>" +
                        "<li type='disc'>Conocer y tener clara la política de SG-SST</li>" +
                        "<li type='disc'>Suministrar información clara, completa y veraz sobre su estado de salud</li>" +
                        "<li type='disc'>Cumplir las normas, reglamentos e instrucciones del SG-SST de la empresa</li>" +
                        "<li type='disc'>Informar oportunamente al empleador o contratante acerca de los peligros y riesgos latentes en su sitio de trabajo</li>" +
                        "<li type='disc'>Participar en las actividades de capacitación en seguridad y salud en el trabajo definido en el plan de capacitación del SG-SST</li>" +
                        "<li type='disc'>Participar y contribuir al cumplimiento de los objetivos del Sistema de Gestión de la Seguridad y Salud en el Trabajo SG-SST</li>" +
                        "<li type='disc'>Cumplir las normas de seguridad e higiene propias de la empresa</li>" +
                        "<li type='disc'>Reportar inmediatamente todo accidente de trabajo o incidente</li>" +
                        "<li type='disc'>Hacer uso de los Equipos de Protección Personal y Responsabilizarse por el cuidado de los mismos</li>" +
                        "</ul>";
                #endregion

                #region campo6
                txt6.Text = "<ul>" +
                        "<li type='disc'>Proponer a las directivas las actividades relacionadas con la salud y la seguridad de los trabajadores</li>" +
                        "<li type='disc'>Analizar las causas de accidentes y enfermedades.</li>" +
                        "<li type='disc'>Visitar periódicamente las instalaciones</li>" +
                        "<li type='disc'>Acoger las sugerencias que presenten los trabajadores en materia de seguridad</li>" +
                        "<li type='disc'>Servir de punto de coordinación entre las directivas y los trabajadores para las situaciones relacionadas con SSL</li>" +
                        "<li type='disc'>Participar en las Reuniones ordinarias y extraordinarias</li>" +
                        "</ul>";
                #endregion

                #region campo7
                txt7.Text = "<ul>" +
                        "<li type='disc'>Recibir y dar trámite a las quejas presentadas en las que se describan situaciones que puedan constituir acoso laboral, así como las pruebas que las soportan </li>" +
                        "<li type='disc'>Examinar de manera confidencial los casos específicos o puntuales en los que se formule queja o reclamo, que pudieran tipificar conductas o circunstancias de acoso laboral, al interior de la entidad pública o empresa privada. </li>" +
                        "<li type='disc'>Escuchar a las partes involucradas de manera individual sobre los hechos que dieron lugar a la queja </li>" +
                        "<li type='disc'>Programar reuniones con el fin de crear un espacio de diálogo entre las partes involucradas, promoviendo compromisos mutuos para llegar a una solución efectiva de las controversias </li>" +
                        "<li type='disc'>Formular planes de mejora y hacer seguimiento a los compromisos </li>" +
                        "<li type='disc'>Presentar a la alta dirección de la entidad pública o la empresa privada las recomendaciones para el desarrollo efectivo de las medidas preventivas y correctivas del acoso laboral </li>" +
                        "<li type='disc'>Elaborar informes trimestrales sobre la gestión del Comité que incluya estadísticas de las quejas, seguimiento de los casos y recomendaciones. </li>" +
                        "</ul>";
                #endregion

                #region campo8
                txt8.Text = "<ul>" +
                        "<li type='disc'>Identificar los Riesgos en el sitio en donde se realizan trabajos en alturas y adoptar las medidas correctivas y preventivas necesarias</li>" +
                        "<li type='disc'>Apoyar la elaboración de Procedimientos Seguros para el trabajo en alturas</li>" +
                        "<li type='disc'>Inspeccionar anualmente el sistema de acceso para trabajo en alturas y sus componentes.</li>" +
                        "<li type='disc'>Avalar la selección y uso específicos de cada sistema de acceso para trabajo en alturas, y de los sistemas de prevención y protección contra caídas aplicables</li>" +
                        "<li type='disc'>Verificar la instalación de los sistemas de protección contra caídas.</li>" +
                        "</ul>";
                #endregion
            }

        }
        protected void GuardarRegistro(object sender, EventArgs e)
        {
            int IdSucursal = Mgr_Sucursal.Set_IdSucursalDDl(ObjUsuario, ddlSucursal);

            matriz_responsabilidad tabla = new matriz_responsabilidad();
            ObjUsuario.Error = CRUD.Delete_Fila(tabla, Mgr_Documento.Matriz_Responsabilidad(IdSucursal));

            matriz_responsabilidad nuevo = new matriz_responsabilidad()
            {
                id_sucursal = IdSucursal,
                puesto1 = txt1.Text,
                puesto2 = txt2.Text,
                puesto3 = txt3.Text,
                puesto4 = txt4.Text,
                puesto5 = txt5.Text,
                puesto6 = txt6.Text,
                puesto7 = txt7.Text,
                pusto8 = txt8.Text
            };
            ObjUsuario.Error = CRUD.Add_Fila(nuevo);

            if (ObjUsuario.Error)
            {
                cargarMatriz();
            }


            Modal.MostrarAlertaAdd(phAlerta, divAlerta, lbAlerta, ObjUsuario.Error, txt1);
        }
        protected void GenerarDocumento(object sender, EventArgs e)
        {
            Tuple<int, int> IdEmpSuc = Mgr_Empresa.Get_IdEmpresa_IdSucursal(ObjUsuario, ddlEmpresa, ddlSucursal);
            String[] valores = {
                string.Empty + IdEmpSuc.Item2,
                txt1.Text,
                txt2.Text,
                txt3.Text,
                txt4.Text,
                txt5.Text,
                txt6.Text,
                txt7.Text,
                txt8.Text
            };
            PrintFile.PrintMatrizResponsabilidades(valores, this);
        }
        protected void ddlEmpresa_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlEmpresa.SelectedValue != string.Empty)
            {
                Mgr_Sucursal.Sucursal(ddlSucursal, Convert.ToInt32(ddlEmpresa.SelectedValue));
            }
        }
        protected void ddlSucursal_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlSucursal.SelectedValue != string.Empty)
            {
                cargarMatriz();
            }
            else
            {
                phTabla.Visible = false;
            }
        }
    }
}