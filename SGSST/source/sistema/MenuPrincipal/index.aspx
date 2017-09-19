<%@ Page Language="C#" MasterPageFile="~/source/MasterPages/Menu.Master" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="SGSSTC.source.sistema.MenuPrincipal.index" %>
<%@ Register Assembly="CKEditor.NET" Namespace="CKEditor.NET" TagPrefix="CKEditor" %>
<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35"  Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server"></asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <asp:Timer runat="server" ID="Timer1" Interval="60000" OnTick="Timer1_Tick"></asp:Timer>

    <!-- porcentaje fases-->
    <div class="row">

        <div class="col-md-12 col-sm-12">
            <div class="box box-solid">
                <div class="box-header with-border">
                    <h4 class="box-title">Porcentaje de Cumplimiento de las Fases</h4>
                    <br />

                </div>
            </div>
        </div>

        <div class="col-md-3 col-sm-4">
            <!-- small box -->
            <div class="small-box bg-aqua">
                <div class="inner">
                    <h3>
                        <asp:Label runat="server" Text="0" ID="evaini" /></h3>
                    <p>Evaluación Inicial</p>
                </div>

                <div class="icon">
                    <i class="fa fa-file-text-o"></i>
                </div>
                <a href="#" class="small-box-footer">Mas información<i class="fa fa-arrow-circle-right"></i></a>
            </div>
        </div>

        <div class="col-md-2 col-sm-4">
            <!-- small box -->
            <div class="small-box bg-purple">
                <div class="inner">
                    <h3>
                        <asp:Label runat="server" Text="0" ID="lbTrabajadores" />
                    </h3>
                    <p>Planear</p>
                </div>

                <div class="icon">
                    <i class="fa fa-fw fa-calendar"></i>

                </div>

                <a href="#" class="small-box-footer">Mas información<i class="fa fa-arrow-circle-right"></i></a>

            </div>
        </div>

        <div class="col-md-2 col-sm-4">
            <!-- small box -->
            <div class="small-box bg-green">
                <div class="inner">
                    <h3>
                        <asp:Label runat="server" Text="0" ID="hacer" /><sup style="font-size: 20px">%</sup>
                    </h3>
                    <p>Hacer</p>
                </div>

                <div class="icon">
                    <i class="fa fa-tasks"></i>
                </div>

                <a href="#" class="small-box-footer">Mas información <i class="fa fa-arrow-circle-right"></i></a>
            </div>
        </div>

        <div class="col-md-2 col-sm-4">
            <!-- small box -->
            <div class="small-box bg-yellow">
                <div class="inner">
                    <h3>
                        <asp:Label runat="server" Text="0" ID="lbEstMatRie" /><sup style="font-size: 20px">%</sup>
                    </h3>
                    <p>Verificar</p>
                </div>

                <div class="icon">
                    <i class="fa fa-search"></i>
                </div>

                <a href="#" class="small-box-footer">Mas información <i class="fa fa-arrow-circle-right"></i></a>
            </div>
        </div>

        <div class="col-md-3 col-sm-4">
            <!-- small box -->
            <div class="small-box bg-red">
                <div class="inner">
                    <h3>
                        <asp:Label runat="server" Text="0" ID="actuar" />
                    </h3>
                    <p>Actuar</p>
                </div>
                <div class="icon">
                    <i class="fa fa-cogs"></i>
                </div>
                <a href="#" class="small-box-footer">Mas información <i class="fa fa-arrow-circle-right"></i>
                </a>
            </div>
        </div>
    </div>



    <!-- actividades pendientes y finalizadas-->
    <div class="row">

        <div class="col-md-6">
            <div class="box">

                <div class="box-header label-primary">
                    <h3 class="box-title">Actividades pendientes</h3>
                </div>

                <div class="box-body table-responsive no-padding">
                    <table class="table table-hover">
                        <tbody>
                            <tr>
                                <th>Actividad</th>
                                <th>Fase</th>
                                <th>Link</th>
                            </tr>

                            <asp:Panel runat="server" ID="pActPend"></asp:Panel>

                        </tbody>
                    </table>
                </div>
            </div>
        </div>

        <div class="col-md-6">
            <div class="box">

                <div class="box-header label-success">
                    <h3 class="box-title">Actividades finalizadas</h3>
                </div>

                <div class="box-body table-responsive no-padding">
                    <table class="table table-hover">
                        <tbody>
                            <tr>
                                <th>Actividad</th>
                                <th>Fase</th>
                                <th>Link</th>
                            </tr>

                            <asp:Panel runat="server" ID="pActFin"></asp:Panel>


                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>

    <asp:UpdatePanel ID="updatePanelMensajes" runat="server">
        <ContentTemplate>

            <div class="row text-center">

                <div class="col-md-6">
                    <div class="box">
                        <div class="box-header label-primary">
                            <h3 class="box-title">Preguntas de mis Pares</h3>
                        </div>
                    </div>

                    <div class="box-body table-responsive no-padding">
                        <table class="table table-hover">
                            <tbody>
                                <tr>
                                    <th class="col-md-6 text-left">Pregunta</th>
                                    <th class="col-md-3 text-center">Fecha</th>
                                    <th class="col-md-1 text-center">Respuestas</th>
                                    <th class="col-md-2"></th>
                                </tr>
                                <asp:Panel runat="server" ID="pSusPreguntas"></asp:Panel>
                            </tbody>
                        </table>
                    </div>
                </div>

                <div class="col-md-6 text-center">
                    <div class="box">

                        <div class="box-header label-primary">
                            <h3 class="box-title">Mis Preguntas</h3>
                        </div>

                        <div class="box-body table-responsive no-padding">
                            <table class="table table-hover">
                                <tbody>
                                    <tr>
                                        <th class="col-md-7 text-left">Pregunta</th>
                                        <th class="col-md-4 text-center">Fecha</th>
                                        <th class="col-md-1 text-center">Respuestas</th>
                                    </tr>

                                    <asp:Panel runat="server" ID="panelMisPreguntas"></asp:Panel>

                                </tbody>
                            </table>
                        </div>

                        <asp:ImageButton alt="-" ID="btnAgregar" runat="server" ImageUrl="~\ico\agregar.png" data-toggle="modal"
                            data-target="#addModal" />
                        <h4>Nueva Pregunta</h4>
                    </div>
                </div>
            </div>

        </ContentTemplate>
    </asp:UpdatePanel>

    <hr />

    <!-- Modal Añadir una pregunta -->
    <div id="addModal" class="modal">
        <div class="modal-dialog">
            <div class="modal-content">

                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                    <h3>Nueva Pregunta</h3>
                </div>

                <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                    <ContentTemplate>

                        <div class="modal-body form-group text-left">
                            <div class="row">
                                <div class="col-md-12">
                                    <h4>Titulo de la Pregunta</h4>
                                    <asp:TextBox ID="txtTituloPregunta" runat="server" ClientIDMode="Static"
                                        CssClass="form-control"></asp:TextBox>
                                </div>

                                <div class="col-md-12">
                                    <h4>Pregunta</h4>


                                    <CKEditor:CKEditorControl ID="txtPregunta" BasePath="/ckeditor/" runat="server"></CKEditor:CKEditorControl>

                                    <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>"
                                        SetFocusOnError="true" Display="Dynamic" ForeColor="#B50128" Font-Size="10"
                                        Font-Bold="true" ControlToValidate="txtPregunta" runat="server"
                                        ValidationGroup="ValidationAdd" />
                                </div>
                            </div>
                        </div>

                        <div class="modal-footer">
                            <div class="row">

                                <div class="col-md-4 col-md-offset-2">
                                    <asp:Button ID="btnAdd" runat="server" Text="Preguntar" class="btn btn-block btn-info"
                                        OnClick="AgregarRegistro" ValidationGroup="ValidationAdd" />
                                </div>

                                <div class="col-md-4">
                                    <button class="btn btn-block btn-default" data-dismiss="modal" aria-hidden="true">Cerrar</button>
                                </div>
                            </div>
                        </div>

                    </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="btnAdd" EventName="Click" />
                    </Triggers>
                </asp:UpdatePanel>
            </div>
        </div>
    </div>

    <!-- Modal Ver una pregunta-->
    <div id="viewModal" class="modal">
        <div class="modal-dialog">
            <div class="modal-content">

                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                    <h3>Ver Pregunta</h3>
                </div>

                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>
                        <asp:HiddenField ID="hdfPreguntaID" runat="server" />

                        <div class="modal-body form-group text-left">

                            <div class="row">
                                <div class="col-md-12">
                                    <h4>
                                        <asp:Label ID="lbTitulo" runat="server" ClientIDMode="Static"></asp:Label>
                                    </h4>
                                </div>

                                <hr />
                                <div class="col-md-12">
                                    <asp:Label ID="lbPregunta" runat="server" ClientIDMode="Static"></asp:Label>
                                </div>
                                <hr />
                            </div>

                        </div>

                    </ContentTemplate>
                    <Triggers>
                    </Triggers>
                </asp:UpdatePanel>
            </div>
        </div>
    </div>

    <!-- Modal Añadir una respuesta a una pregunta  -->
    <div id="RespuestaModal" class="modal">
        <div class="modal-dialog">
            <div class="modal-content">

                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                    <h3>Responder Pregunta</h3>
                </div>

                <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                    <ContentTemplate>
                        <asp:HiddenField ID="hdfResponderPregunta" runat="server" />

                        <div class="modal-body form-group text-left">

                            <div class="row">

                                <div class="col-md-12">
                                    <h4>
                                        <asp:Label ID="lbTituloPregunta_Responder" runat="server" ClientIDMode="Static"></asp:Label>
                                    </h4>
                                    <asp:Label ID="lbPregunta_Responder" runat="server" ClientIDMode="Static"></asp:Label>
                                </div>

                                <hr />

                                <div class="col-md-12 text-left">
                                    <h2><strong>Respuesta:</strong></h2>

                                    <CKEditor:CKEditorControl ID="CKRespuesta" BasePath="/ckeditor/" runat="server"></CKEditor:CKEditorControl>

                                    <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>"
                                        SetFocusOnError="true" Display="Dynamic" ForeColor="#B50128" Font-Size="10"
                                        Font-Bold="true" ControlToValidate="CKRespuesta" runat="server"
                                        ValidationGroup="ValidationResponder" />
                                </div>
                            </div>

                        </div>

                        <div class="modal-footer">
                            <div class="row">

                                <div class="col-md-4 col-md-offset-2">
                                    <asp:Button ID="btnResponder" runat="server" Text="Responder" class="btn btn-block btn-info"
                                        OnClick="ResponderPregunta" ValidationGroup="ValidationResponder" />
                                </div>

                                <div class="col-md-4">
                                    <button class="btn btn-block btn-default" data-dismiss="modal" aria-hidden="true">Cerrar</button>
                                </div>
                            </div>
                        </div>

                    </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="btnResponder" EventName="Click" />
                    </Triggers>
                </asp:UpdatePanel>

                </ContentTemplate>
                    <triggers>
                    </triggers>
                </asp:updatepanel>
            </div>
        </div>
    </div>

    <!-- Modal Ver Las Respuestas de una pregunta  -->
    <div id="viewRespuestasModal" class="modal">
        <div class="modal-dialog">
            <div class="modal-content">

                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                    <h3>Ver Respuestas</h3>
                </div>

                <asp:UpdatePanel ID="UpdatePanel4" runat="server">
                    <ContentTemplate>

                        <div class="modal-body form-group text-left">

                            <div class="row">
                                <div class="col-md-12">
                                    <h4>
                                        <asp:Label ID="lbTitulo_VerRespuestas" runat="server" ClientIDMode="Static"></asp:Label>
                                    </h4>
                                </div>

                                <hr />
                                <div class="col-md-12">
                                    <div class="box">
                                        <div class="box-header label-primary">
                                            <h3 class="box-title">Respuestas</h3>
                                        </div>

                                        <div class="box-body table-responsive no-padding">
                                            <table class="table table-hover">
                                                <tbody>
                                                    <tr>
                                                        <th class="col-md-9">Respuesta</th>
                                                        <th class="col-md-2">Fecha</th>
                                                        <th class="col-md-1">Calificación</th>
                                                    </tr>
                                                    <asp:Panel runat="server" ID="pVerRespuestas"></asp:Panel>

                                                </tbody>
                                            </table>
                                        </div>
                                    </div>

                                </div>
                                <hr />
                            </div>

                        </div>

                    </ContentTemplate>
                    <Triggers>
                    </Triggers>
                </asp:UpdatePanel>
            </div>
        </div>
    </div>

    <!-- Modal Ver una respuesta-->
    <div id="Ver_Res_Esp_Modal" class="modal">
        <div class="modal-dialog">
            <div class="modal-content">

                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                    <h3>Ver Respuesta</h3>
                </div>

                <asp:UpdatePanel ID="UpdatePanel5" runat="server">

                    <ContentTemplate>

                        <asp:HiddenField ID="hdfVer_Res_Esp" runat="server" />

                        <div class="modal-body form-group text-left">

                            <div class="row">
                                <div class="col-md-6">
                                    <h3>Usuario :</h3>
                                    <asp:Label ID="lbUsuario_Respuesta" runat="server" ClientIDMode="Static"></asp:Label>

                                </div>

                                <div class="col-md-6">
                                    <h3>Fecha :</h3>
                                    <asp:Label ID="lbFecha_respuesta" runat="server" ClientIDMode="Static"></asp:Label>

                                </div>

                            </div>

                            <div class="row">
                                <hr />
                                <div class="col-md-12">
                                    <h3>Respuesta :</h3>
                                    <asp:Label ID="lbVerCuerpoRespuesta" runat="server" ClientIDMode="Static"></asp:Label>
                                </div>
                                <hr />
                            </div>

                            <div class="row">
                                <div class="col-md-12">
                                    <h3>Calificación :</h3>
                                    <asp:Label ID="lbCalificacion_Respuesta" runat="server" ClientIDMode="Static"></asp:Label>
                                </div>
                            </div>
                        </div>
                    </ContentTemplate>
                    <Triggers></Triggers>
                </asp:UpdatePanel>
            </div>
        </div>
    </div>

</asp:Content>
