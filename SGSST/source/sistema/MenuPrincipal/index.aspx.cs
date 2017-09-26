using Capa_Datos;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI.WebControls;

namespace SGSSTC.source.sistema.MenuPrincipal
{
    public partial class index : System.Web.UI.Page
    {
        private Model_UsuarioSistema ObjUsuario;
        private Tuple<bool, bool> BoolEmpSuc;
        private  Utilidades objUtilidades = new Utilidades();

        #region acciones index
        protected void Page_Load(object sender, EventArgs e)
        {
            ObjUsuario = Utilidades.ValidarSesion(HttpContext.Current.User.Identity as FormsIdentity, this);

            BoolEmpSuc = Getter.Get_Empresa_Sucursal(ObjUsuario);

            List<documento> ListaDocumento = new List<documento>();
            List<trabajador> ListTrabajador = new List<trabajador>();


            int Anho = DateTime.Now.Year;
            int contActividades = 0;

            if (!BoolEmpSuc.Item1 && BoolEmpSuc.Item2)
            {
                #region porcentaje evaluacion incial

                ListaDocumento = Getter.Documentos(Anho, "AutoEvaluacion", 0, ObjUsuario.Id_empresa);

                var groupedList = ListaDocumento.GroupBy(x => new { x.id_tabla, x.fecha_subida.Value.Year }).Select(grp => grp.ToList()).ToList();

                List<sucursal> ListSucursal = new List<sucursal>();
                ListSucursal = Getter.Sucursal(0, ObjUsuario.Id_empresa);

                Double CantSucursales = ListSucursal.Count;
                Double CantAutoEvaluacion = groupedList.Count;

                Double porcentaje = Math.Round(((CantAutoEvaluacion * 100) / CantSucursales), 0);

                if (porcentaje > 100) { evaini.Text = "100%"; }
                else if (porcentaje < 0) { evaini.Text = "0%"; }
                else { evaini.Text = porcentaje + "%"; }
                #endregion
                
                #region actualizar lista al año en curso
                GrupoLiEntities contexto = new GrupoLiEntities();

                lista_actividad Edit = contexto.lista_actividad.
                    SingleOrDefault(b => b.sucursal.id_empresa == ObjUsuario.Id_empresa && b.anho != Anho);

                if (Edit != null)
                {
                    Edit.estatus = "No";
                    Edit.anho = Anho;
                }
                ObjUsuario.Error = CRUD.Edit_Fila(contexto);

                #endregion

                #region actividades pendientes

                contexto = new GrupoLiEntities();
                var consultaLista = contexto.lista_actividad.Where(
                    b => b.sucursal.id_empresa == ObjUsuario.Id_empresa && b.estatus == "No").ToList();
                contActividades = 0;

                foreach (var item in consultaLista)
                {
                    contActividades++;

                    if (contActividades < 6)
                    {
                        string clase = "";
                        if (item.fase == "E") { clase = "<span class='label bg-aqua'>Evaluación Inicial</span>"; }
                        else if (item.fase == "p") { clase = "<span class='label bg-purple'>Planear</span>"; }
                        else if (item.fase == "H") { clase = "<span class='label bg-green'>Hacer</span>"; }
                        else if (item.fase == "V") { clase = "<span class='label bg-yellow'>Verificar</span>"; }
                        else if (item.fase == "A") { clase = "<span class='label bg-red'>Actuar</span>"; }

                        ControlesDinamicos.CrearLiteral("<tr>" +
                           "<td>" + item.actividad + " de la sucursal " + item.sucursal.nombre + "</td>" +
                           "<td>" + clase + "</td>" +
                           "<td><a target='_blank' href='" + item.link + "' class='small-box-footer'>Ir al Modulo -><i class='fa fa-arrow-circle-right'></i></a></td>" +
                           "</tr>"
                           , pActPend);
                    }
                    if (contActividades == 6)
                    {
                        ControlesDinamicos.CrearLiteral("<tr>" +
                           "<td>" +
                           "<a target='_blnk' href='#' >Ver Todas las Actividades</a>" +
                           "<td>" +
                           "</tr>", pActPend);

                    }
                }
                #endregion

                #region actividades finalizadas
                contActividades = 0;
                contexto = new GrupoLiEntities();
                var consultaLista1 = contexto.lista_actividad.Where(
                    b => b.sucursal.id_empresa == ObjUsuario.Id_empresa && b.estatus == "Si").ToList();

                foreach (var item in consultaLista1)
                {
                    contActividades++;

                    if (contActividades < 6)
                    {
                        string clase = "";
                        if (item.fase == "E") { clase = "<span class='label bg-aqua'>Evaluación Inicial</span>"; }
                        else if (item.fase == "p") { clase = "<span class='label bg-purple'>Planear</span>"; }
                        else if (item.fase == "H") { clase = "<span class='label bg-green'>Hacer</span>"; }
                        else if (item.fase == "V") { clase = "<span class='label bg-yellow'>Verificar</span>"; }
                        else if (item.fase == "A") { clase = "<span class='label bg-red'>Actuar</span>"; }



                        ControlesDinamicos.CrearLiteral("<tr>" +
                           "<td>" + item.actividad + " de la sucursal " + item.sucursal.nombre + "</td>" +
                           "<td>" + clase + "</td>" +
                           "<td><a target='_blank' href='" + item.link + "' class='small-box-footer'>Ir al Modulo -><i class='fa fa-arrow-circle-right'></i></a></td>" +
                           "</tr>"
                           , pActFin);
                    }
                    if (contActividades == 6)
                    {
                        ControlesDinamicos.CrearLiteral("<tr>" +
                           "<td>" +
                           "<a target='_blnk' href='#' >Ver Todas las Actividades</a>" +
                           "<td>" +
                           "</tr>", pActFin);

                    }
                }
                #endregion

            }

            if (!BoolEmpSuc.Item2)
            {
                #region porcentaje evaluacion inicial

                ListaDocumento = Getter.Documentos(Anho, "AutoEvaluacion", ObjUsuario.Id_sucursal);

                if (ListaDocumento.Count > 0)
                {
                    evaini.Text = "100%";
                }
                else
                {
                    evaini.Text = "0%";
                }
                #endregion
                
                #region actualizar lista al año en curso
                GrupoLiEntities contexto = new GrupoLiEntities();
                lista_actividad Edit = contexto.lista_actividad.SingleOrDefault(
                    b => b.id_sucursal == ObjUsuario.Id_sucursal && b.anho != Anho);
                if (Edit != null)
                {
                    Edit.estatus = "No";
                    Edit.anho = Anho;
                }
                ObjUsuario.Error = CRUD.Edit_Fila(contexto);

                #endregion

                #region actividades pendientes
                contexto = new GrupoLiEntities();
                var consultaLista = contexto.lista_actividad.Where(
                    b => b.id_sucursal == ObjUsuario.Id_sucursal && b.estatus == "No").ToList();

                contActividades = 0;
                foreach (var item in consultaLista)
                {
                    contActividades++;

                    if (contActividades < 6)
                    {
                        string clase = "";
                        if (item.fase == "E") { clase = "<span class='label bg-aqua'>Evaluación Inicial</span>"; }
                        else if (item.fase == "p") { clase = "<span class='label bg-purple'>Planear</span>"; }
                        else if (item.fase == "H") { clase = "<span class='label bg-green'>Hacer</span>"; }
                        else if (item.fase == "V") { clase = "<span class='label bg-yellow'>Verificar</span>"; }
                        else if (item.fase == "A") { clase = "<span class='label bg-red'>Actuar</span>"; }

                        ControlesDinamicos.CrearLiteral("<tr>" +
                           "<td>" + item.actividad + " de la sucursal " + item.sucursal.nombre + "</td>" +
                           "<td>" + clase + "</td>" +
                           "<td><a target='_blank' href='" + item.link + "' class='small-box-footer'>Ir al Modulo -><i class='fa fa-arrow-circle-right'></i></a></td>" +
                           "</tr>"
                           , pActPend);
                    }

                    if (contActividades == 6)
                    {
                        ControlesDinamicos.CrearLiteral("<tr>" +
                           "<td>" +
                           "<a target='_blnk' href='#' >Ver Todas las Actividades</a>" +
                           "<td>" +
                           "</tr>", pActPend);
                    }
                }
                #endregion

                #region actividades finalizadas
                contexto = new GrupoLiEntities();
                var consultaLista1 = contexto.lista_actividad.Where(
                    b => b.id_sucursal == ObjUsuario.Id_sucursal && b.estatus == "Si").ToList();

                contActividades = 0;
                foreach (var item in consultaLista1)
                {
                    contActividades++;

                    if (contActividades < 6)
                    {
                        string clase = "";
                        if (item.fase == "E") { clase = "<span class='label bg-aqua'>Evaluación Inicial</span>"; }
                        else if (item.fase == "p") { clase = "<span class='label bg-purple'>Planear</span>"; }
                        else if (item.fase == "H") { clase = "<span class='label bg-green'>Hacer</span>"; }
                        else if (item.fase == "V") { clase = "<span class='label bg-yellow'>Verificar</span>"; }
                        else if (item.fase == "A") { clase = "<span class='label bg-red'>Actuar</span>"; }



                        ControlesDinamicos.CrearLiteral("<tr>" +
                           "<td>" + item.actividad + " de la sucursal " + item.sucursal.nombre + "</td>" +
                           "<td>" + clase + "</td>" +
                           "<td><a target='_blank' href='" + item.link + "' class='small-box-footer'>Ir al Modulo -><i class='fa fa-arrow-circle-right'></i></a></td>" +
                           "</tr>"
                           , pActFin);
                    }

                    if (contActividades == 6)
                    {
                        ControlesDinamicos.CrearLiteral("<tr>" +
                           "<td>" +
                           "<a target='_blnk' href='#' >Ver Todas las Actividades</a>" +
                           "<td>" +
                           "</tr>", pActFin);
                    }
                }
                #endregion
            }

            string valor = Convert.ToString(Request.QueryString["date"]);
            if (valor != null)
            {
                ViewState["FechaAlarma"] = Convert.ToDateTime(Request.QueryString["date"]);
            }
            else
            {
                ViewState["FechaAlarma"] = string.Empty + DateTime.Now.ToShortDateString();
            }

            MostrarMisPreguntas();
            MostrarSusPreguntas();
        }

        protected void Timer1_Tick(object sender, EventArgs e)
        {
            MostrarSusPreguntas();
            MostrarMisPreguntas();
        }
        #endregion


        // Muestra el modal de ver una pregunta
        protected void VerRegistroModal(object sender, EventArgs e)
        {
            LinkButton boton = sender as LinkButton;

            int idPregunta = 0;

            if (boton.ClientID.Contains("ContentPlaceHolder1_lk_MP_Pregunta_"))
            {
                idPregunta = Convert.ToInt32(boton.ClientID.Replace("ContentPlaceHolder1_lk_MP_Pregunta_", ""));
            }
            else if (boton.ClientID.Contains("ContentPlaceHolder1_lk_SP_Pregunta_"))
            {
                idPregunta = Convert.ToInt32(boton.ClientID.Replace("ContentPlaceHolder1_lk_SP_Pregunta_", ""));
            }


            List<Pregunta> consulta = new List<Pregunta>();
            GrupoLiEntities contexto = new GrupoLiEntities();

            var consultaLista = (
                from PR in contexto.Pregunta
                where PR.id_pregunta == idPregunta
                select new
                {
                    PR.id_pregunta,
                    PR.titulo,
                    PR.cuerpo_pregunta,
                    PR.id_usuario,
                    PR.fecha,
                    TotalRespuestas = PR.Respuesta.Count
                }).ToList();

            foreach (var item in consultaLista)
            {
                lbTitulo.Text = item.titulo;
                lbPregunta.Text = item.cuerpo_pregunta;
            }


            Modal.registrarModal("viewModal", "viewModalScript", this);
        }

        // Muestra el modal de responder una pregunta
        protected void RespuestaModal(object sender, EventArgs e)
        {
            Button boton = sender as Button;

            int idPregunta = Convert.ToInt32(boton.ClientID.Replace("ContentPlaceHolder1_lk_SP_Responder_", ""));
            hdfResponderPregunta.Value = Convert.ToString(idPregunta);

            List<Pregunta> consulta = new List<Pregunta>();
            GrupoLiEntities contexto = new GrupoLiEntities();

            var consultaLista = (
                from PR in contexto.Pregunta
                where PR.id_pregunta == idPregunta
                select new
                {
                    PR.id_pregunta,
                    PR.titulo,
                    PR.cuerpo_pregunta,
                    PR.id_usuario,
                    PR.fecha,
                    TotalRespuestas = PR.Respuesta.Count
                }).ToList();

            foreach (var item in consultaLista)
            {
                lbTituloPregunta_Responder.Text = item.titulo;
                lbPregunta_Responder.Text = item.cuerpo_pregunta;
            }

            Modal.registrarModal("RespuestaModal", "RespuestaModalScript", this);
        }

        // Muestra el modal para ver las respuestas de una pregunta
        protected void VerRespuestasModal(object sender, EventArgs e)
        {
            LinkButton boton = sender as LinkButton;

            int idPregunta = 0;

            if (boton.ClientID.Contains("ContentPlaceHolder1_lk_MP_Respuesta_"))
            {
                idPregunta = Convert.ToInt32(boton.ClientID.Replace("ContentPlaceHolder1_lk_MP_Respuesta_", ""));
            }
            else if (boton.ClientID.Contains("ContentPlaceHolder1_lk_SP_Respuesta_"))
            {
                idPregunta = Convert.ToInt32(boton.ClientID.Replace("ContentPlaceHolder1_lk_SP_Respuesta_", ""));
            }

            GrupoLiEntities contexto = new GrupoLiEntities();

            List<Respuesta> consulta = new List<Respuesta>();

            consulta = contexto.Respuesta.Where(x => x.id_pregunta == idPregunta).OrderByDescending(x => x.calificacion).ToList();

            string Calificacion = string.Empty;

            foreach (var item in consulta)
            {
                Calificacion = item.calificacion == 0 ? "Sin Calificar" :
                                       item.calificacion == 1 ? "Mala" :
                                       item.calificacion == 2 ? "Buena" :
                                       item.calificacion == 3 ? "Regular" : "Excelente";

                string _Respuesta = item.usuario;
                _Respuesta = _Respuesta.Length > 50 ? item.usuario.Substring(0, 47) + "..." : item.usuario;

                ControlesDinamicos.CrearLiteral("<tr><td class='text-left'>", pVerRespuestas);

                string idRespuesta = objUtilidades.cifrarCadena(Convert.ToString(item.id_respuesta));

                ControlesDinamicos.CrearHyperLink("lk_VerRespuesta_" + item.id_respuesta, pVerRespuestas, "VerRespuesta.aspx?rs=" + idRespuesta, _Respuesta);

                ControlesDinamicos.CrearLiteral("</td><td>" + Convert.ToDateTime(item.fecha).ToString("yyyy-MM-dd") + "</td>", pVerRespuestas);

                ControlesDinamicos.CrearLiteral("<td class='text-center'>" + Calificacion + "</td></tr>", pVerRespuestas);
            }

            Modal.registrarModal("viewRespuestasModal", "viewRespuestasModalScript", this);
        }

        //Muestra el modal para ver una respuesta en especifica
        protected void VerRespuestaEspecificaModal(object sender, EventArgs e)
        {
            int idRespuesta = Convert.ToInt32(hdfVer_Res_Esp.Value.Replace("ContentPlaceHolder1_lk_VerRespuesta_", ""));

            GrupoLiEntities contexto = new GrupoLiEntities();
            List<Respuesta> consulta = new List<Respuesta>();

            consulta = contexto.Respuesta.Where(x => x.id_respuesta == idRespuesta).ToList();

            foreach (var item in consulta)
            {
                lbUsuario_Respuesta.Text = item.usuario;
                lbFecha_respuesta.Text = Convert.ToDateTime(item.fecha).ToString("yyyy-MM-dd");
                lbVerCuerpoRespuesta.Text = item.cuerpo_respuesta;
                lbCalificacion_Respuesta.Text = Convert.ToString(item.calificacion);
            }

        }

        //Agrega una respuesta a una pregunta
        protected void ResponderPregunta(object sender, EventArgs e)
        {
            int idPregunta = Convert.ToInt32(hdfResponderPregunta.Value);
            string nomUsuario = string.Empty;

            List<Pregunta> consulta = new List<Pregunta>();
            GrupoLiEntities contexto = new GrupoLiEntities();

            var consultaLista = (
                from PR in contexto.Pregunta
                where PR.id_pregunta == idPregunta
                select new
                {
                    nombreUsuario = PR.usuario.login
                }).ToList();

            foreach (var item in consultaLista)
            {
                nomUsuario = item.nombreUsuario;
            }

            String[] valores = {
                CKRespuesta.Text,
                nomUsuario,
                Convert.ToString(idPregunta)
                };

            ObjUsuario.Error = CRUD.Add_Respuesta( valores);

            Modal.CerrarModal("RespuestaModal", "RespuestaModalScript", this);

            MostrarSusPreguntas();
            MostrarMisPreguntas();
        }

        // Agrega una pregunta
        protected void AgregarRegistro(object sender, EventArgs e)
        {
            String[] valores = {
                txtTituloPregunta.Text,
                txtPregunta.Text
                };

            ObjUsuario.Error = CRUD.Add_Pregunta(ObjUsuario, valores);

            Modal.CerrarModal("addModal", "AddModalScript", this);

            //Modal.MostrarAlertaAdd(phAlerta, divAlerta, lbAlerta, ObjUsuario.Error,txtBuscar);

            MostrarSusPreguntas();
            MostrarMisPreguntas();
        }


        //Rellena los cuadros del index
        private void MostrarSusPreguntas()
        {
            List<empresa_itemdivision> consulta = new List<empresa_itemdivision>();
            consulta = Getter.CodigoCiiu_Empresa(ObjUsuario.Id_empresa);

            int act1 = 0, act2 = 0, act3 = 0, cont = 0;
            foreach (var item in consulta)
            {
                cont++;
                if (cont == 1) { act1 = Convert.ToInt32(item.id_clase_ciiu); }
                else if (cont == 2) { act2 = Convert.ToInt32(item.id_clase_ciiu); }
                else if (cont == 3) { act3 = Convert.ToInt32(item.id_clase_ciiu); }
            }

            GrupoLiEntities contexto = new GrupoLiEntities();
            var consultaLista = (
                from PR in contexto.Pregunta
                join EC in contexto.empresa_itemdivision
                on PR.usuario.trabajador.puesto_trabajo.area.sucursal.id_empresa equals EC.id_empresa
                where (EC.id_clase_ciiu == act1 || EC.id_clase_ciiu == act2 || EC.id_clase_ciiu == act3) && PR.id_usuario != ObjUsuario.Id_usuario
                select new
                {
                    PR.id_pregunta,
                    PR.titulo,
                    PR.cuerpo_pregunta,
                    PR.id_usuario,
                    PR.fecha,
                    TotalRespuestas = PR.Respuesta.Count
                }).ToList();


            consultaLista = ((from s in consultaLista select s).Distinct()).ToList();

            int contadorPreguntas = 0;

            pSusPreguntas.Controls.Clear();

            foreach (var item in consultaLista)
            {
                contadorPreguntas++;
                if (contadorPreguntas < 5)
                {
                    string titulo = item.titulo;
                    titulo = titulo.Length > 20 ? item.titulo.Substring(0, 17) + "..." : item.titulo;

                    ControlesDinamicos.CrearLiteral("<tr><td class='text-left'>", pSusPreguntas);

                    ControlesDinamicos.CrearLinkButton("lk_SP_Pregunta_" + item.id_pregunta, pSusPreguntas, VerRegistroModal, titulo);

                    ControlesDinamicos.CrearLiteral("</td><td>" + Convert.ToDateTime(item.fecha).ToString("yyyy-MM-dd") + "</td><td>", pSusPreguntas);

                    ControlesDinamicos.CrearLinkButton("lk_SP_Respuesta_" + item.id_pregunta, pSusPreguntas, VerRespuestasModal, "" + item.TotalRespuestas);

                    ControlesDinamicos.CrearLiteral("</td><td>", pSusPreguntas);

                    ControlesDinamicos.CrearButtonModal("lk_SP_Responder_" + item.id_pregunta, pSusPreguntas, RespuestaModal, "Responder", "RespuestaModal");

                    ControlesDinamicos.CrearLiteral("</td></tr>", pSusPreguntas);
                }
            }


            ControlesDinamicos.CrearLiteral("<tr><td class='text-left'>", pSusPreguntas);
            ControlesDinamicos.CrearHyperLink("ViewPreguntasPares", pSusPreguntas, "ViewPreguntasPares.aspx", "Ver Todas...");
            ControlesDinamicos.CrearLiteral("</td><td></td><td></td></tr>", pSusPreguntas);
        }

        private void MostrarMisPreguntas()
        {
            GrupoLiEntities contexto = new GrupoLiEntities();

            var consultaLista = contexto.Pregunta.Where(b => b.id_usuario == ObjUsuario.Id_usuario).ToList();
            int contadorPreguntas = 0;

            panelMisPreguntas.Controls.Clear();

            foreach (var item in consultaLista)
            {
                contadorPreguntas++;
                if (contadorPreguntas < 5)
                {
                    string titulo = item.titulo;
                    titulo = titulo.Length > 20 ? item.titulo.Substring(0, 17) + "..." : item.titulo;

                    ControlesDinamicos.CrearLiteral("<tr><td class='text-left'>", panelMisPreguntas);

                    ControlesDinamicos.CrearLinkButton("lk_MP_Pregunta_" + item.id_pregunta, panelMisPreguntas, VerRegistroModal, titulo);

                    ControlesDinamicos.CrearLiteral("</td><td>" + Convert.ToDateTime(item.fecha).ToString("yyyy-MM-dd") + "</td><td>", panelMisPreguntas);

                    ControlesDinamicos.CrearLinkButton("lk_MP_Respuesta_" + item.id_pregunta, panelMisPreguntas, VerRespuestasModal, "" + item.Respuesta.Count());

                    ControlesDinamicos.CrearLiteral("</td>", panelMisPreguntas);

                    ControlesDinamicos.CrearLiteral("</tr>", panelMisPreguntas);
                }
            }

            ControlesDinamicos.CrearLiteral("<tr><td class='text-left'>", panelMisPreguntas);
            ControlesDinamicos.CrearHyperLink("ViewMisPreguntas", panelMisPreguntas, "ViewMisPreguntas.aspx", "Ver Todas...");
            ControlesDinamicos.CrearLiteral("</td><td></td><td></td></tr>", panelMisPreguntas);

        }
        
    }
}