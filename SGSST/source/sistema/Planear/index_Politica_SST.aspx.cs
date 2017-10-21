using Capa_Datos;
using Capa_Datos.Manager.PoliticaSST;
using System;
using System.Collections.Generic;
using System.Web;
using System.Web.Security;
using System.Web.UI.WebControls;

namespace SGSSTC.source.sistema.Hacer
{
    public partial class index_Politica_SST : System.Web.UI.Page
    {
        private Model_UsuarioSistema ObjUsuario;

        protected void Page_Load(object sender, EventArgs e)
        {

            ObjUsuario = Utilidades.ValidarSesion(HttpContext.Current.User.Identity as FormsIdentity, this);

            if (!IsPostBack)
            {
                ddlYear = ListaAnho(ddlYear);
                cargarPolitica();
            }

        }

        private DropDownList ListaAnho(DropDownList DropDownList1)
        {
            DateTime anho = DateTime.Now;
            int anhoActual = Convert.ToInt32(anho.Year);

            ViewState["anho"] = string.Empty + anhoActual;

            for (int i = anhoActual; i >= 1950; i--)
            {
                DropDownList1.Items.Add(new System.Web.UI.WebControls.ListItem(string.Empty + i, string.Empty + i));
            }

            return DropDownList1;
        }

        private void cargarPolitica()
        {
            int idPolitica = Mgr_PoliticaSST.Politica_SST(ObjUsuario.Id_empresa);

            List<politica_sst> ListaPolitica = new List<politica_sst>();
            ListaPolitica = Mgr_PoliticaSST.PoliticaSST(idPolitica);

            if (ListaPolitica.Count == 0)
            {
                txtCompromiso.Text = "<p><h3><strong>Compromiso de la Empresa</strong></h3><br />" +
                    "Establecer la postura de la Organización con respecto a la protección en materia de seguridad y" +
                    "salud de sus empleados, desarrollando todas las actividades operacionales en pro de preservar" +
                    "la integridad del personal, las instalaciones, la producción y el medio ambiente</ p > ";

                txtObjetivos.Text = "<p><h3><strong>Política</strong></h3><br />" +
                    "_____________________________ C.A, considera que las funciones de seguridad y salud laboral deben estar presentes en la selección, formación y desarrollo de todo el personal de la organización, y que la Seguridad y Salud es una responsabilidad compartida y depende de cada empleado comprender y seguir las leyes aplicables, así como las políticas, los estándares y los procedimientos de la Compañía, para ello la Organización asume los siguientes compromisos en beneficio de la seguridad y salud en el trabajo.</br></br>" +
                    "1.La Organización cumplirá con todas las leyes aplicables en las prácticas referentes a la protección de la salud y la seguridad de los trabajadores teniendo como valores centrales de la compañía La protección de la salud, la seguridad y la prevención de la contaminación al medio ambiente.</br>" +
                    "2.Fomentar la responsabilidad personal en cuanto a seguridad y salud en el trabajo, promoviendo el adiestramiento y capacitación de los trabajadores, velando por la planificación y ejecución anual de los programas de capacitación en la búsqueda continua del interés y la participación activa de los trabajadores, demostrando que la seguridad y salud es competencia de todos, de manera que los ejecutivos, empleados, responsables de seguridad y contratistas y proveedores conozcan sus responsabilidades y posean la formación y experiencia necesaria para asumirlas.</br>" +
                    "3.La Compañía está comprometida a mejorar continuamente las prácticas de gestión de Seguridad y Salud en el Trabajo, proporcionando para ello todos los recursos necesarios para poner en práctica dicha Gestión con el objeto de identificar, evaluar y controlar los riesgos en toda la empresa.</br>" +
                    "4.La Compañía dará a conocer esta política y la pondrá a disposición de sus empleados, clientes, contratistas y proveedores para alcanzar estos objetivos y cumplir con estas políticas.</p> ";

                txtAlcance.Text = "<p><h3><strong>Alcance</strong></h3><br />" +
                            "La presente Política aplica a todas las operaciones de la Empresa y al personal perteneciente a la" +
                            " misma, además de contratistas y proveedores.</ p > ";
            }
            else
            {
                foreach (var item in ListaPolitica)
                {
                    if (item.compromiso != null) { txtCompromiso.Text = item.compromiso; }
                    else
                    {
                        txtCompromiso.Text = "<p><h3><strong>Compromiso de la Empresa</strong></h3><br />" +
                            "Establecer la postura de la Organización con respecto a la protección en materia de seguridad y" +
                            "salud de sus empleados, desarrollando todas las actividades operacionales en pro de preservar" +
                            "la integridad del personal, las instalaciones, la producción y el medio ambiente</ p > ";
                    }

                    if (item.objetivos != null) { txtObjetivos.Text = item.objetivos; }
                    else
                    {
                        txtObjetivos.Text = "<p><h3><strong>Alcance</strong></h3><br />" +
                            " _____________________________ C.A, considera que las funciones de seguridad y salud laboral deben estar presentes en la selección, formación y desarrollo de todo el personal de la organización, y que la Seguridad y Salud es una responsabilidad compartida y depende de cada empleado comprender y seguir las leyes aplicables, así como las políticas, los estándares y los procedimientos de la Compañía, para ello la Organización asume los siguientes compromisos en beneficio de la seguridad y salud en el trabajo.</br></br> " +
                            "1.La Organización cumplirá con todas las leyes aplicables en las prácticas referentes a la protección de la salud y la seguridad de los trabajadores teniendo como valores centrales de la compañía La protección de la salud, la seguridad y la prevención de la contaminación al medio ambiente.</br>" +
                            "2.Fomentar la responsabilidad personal en cuanto a seguridad y salud en el trabajo, promoviendo el adiestramiento y capacitación de los trabajadores, velando por la planificación y ejecución anual de los programas de capacitación en la búsqueda continua del interés y la participación activa de los trabajadores, demostrando que la seguridad y salud es competencia de todos, de manera que los ejecutivos, empleados, responsables de seguridad y contratistas y proveedores conozcan sus responsabilidades y posean la formación y experiencia necesaria para asumirlas.</br>" +
                            "3.La Compañía está comprometida a mejorar continuamente las prácticas de gestión de Seguridad y Salud en el Trabajo, proporcionando para ello todos los recursos necesarios para poner en práctica dicha Gestión con el objeto de identificar, evaluar y controlar los riesgos en toda la empresa.</br>" +
                            "4.La Compañía dará a conocer esta política y la pondrá a disposición de sus empleados, clientes, contratistas y proveedores para alcanzar estos objetivos y cumplir con estas políticas.</p> ";
                    }

                    if (item.alcance != null) { txtAlcance.Text = item.alcance; }
                    else { txtAlcance.Text = "<p><h3><strong>Alcance</strong></h3><br />" +
                            "La presente Política aplica a todas las operaciones de la Empresa y al personal perteneciente a la" +
                            " misma, además de contratistas y proveedores.</ p > ";
                    }
                }
            }
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            politica_sst nuevo = new politica_sst()
            {
                id_empresa = ObjUsuario.Id_empresa,
                compromiso = txtCompromiso.Text,
                anho = Convert.ToInt32(ddlYear.SelectedValue),
                objetivos = txtObjetivos.Text,
                alcance = txtAlcance.Text
            };

            ObjUsuario.Error = CRUD.Add_Fila(nuevo);

            if (ObjUsuario.Error)
            {
                Response.Redirect(Paginas.index_Politica_SST.Value);
            }
        }

        protected void GenerarDocumento(object sender, EventArgs e)
        {
            String[] valores = {
                string.Empty + ObjUsuario.Id_sucursal,
                ddlYear.SelectedValue,
                txtCompromiso.Text,
                txtObjetivos.Text,
                txtAlcance.Text
            };
            PrintFile.PrintPoliticaSST(valores, this);
        }
    }
}