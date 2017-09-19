<%@ Page Language="C#" MasterPageFile="~/source/MasterPages/Menu.Master" AutoEventWireup="true" CodeBehind="ViewMisPreguntas.aspx.cs" Inherits="SGSSTC.source.sistema.MenuPrincipal.ViewMisPreguntas" %>
<%@ Register Assembly="CKEditor.NET" Namespace="CKEditor.NET" TagPrefix="CKEditor" %>
<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server"></asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <asp:UpdatePanel runat="server">
        <ContentTemplate>

            <ol class="breadcrumb">
                <li><a href="index.aspx">Menu Principal</a></li>
                <li><a href="#">Ver Mis Preguntas</a></li>
            </ol>

            <div class="page-header">
                <h1 class="text-center">Ver Mis Preguntas</h1>
            </div>
            
            <asp:PlaceHolder ID="phAlerta" runat="server" Visible="false">
                <div id="divAlerta" runat="server">
                    <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                    <asp:Label ID="lbAlerta" runat="server" Text="Label"></asp:Label>
                </div>
            </asp:PlaceHolder>

            <div class="row">
                <div class="col-md-4">
                    <h4 class="text-center">Fecha inicio: </h4>
                    <asp:TextBox ID="txtFechaInicio" runat="server" class="col-md-10" CssClass="form-control" TextMode="Date"
                        AutoPostBack="true" OnTextChanged="txtFechaInicio_TextChanged"></asp:TextBox>
                </div>

                <div class="col-md-4">
                    <h4 class="text-center">Fecha fin: </h4>
                    <asp:TextBox ID="txtFechaFin" runat="server" class="col-md-10" CssClass="form-control" TextMode="Date"
                        AutoPostBack="true" OnTextChanged="txtFechaFin_TextChanged"></asp:TextBox>
                </div>
            </div>

            <div class="row">
                <div class="box-body">
                    <div class="dataTables_wrapper form-inline dt-bootstrap">
                        <ucpag:pagination runat="server" id="pagination" />

                        <asp:GridView ID="GridView1" class="table table-bordered table-hover dataTable" runat="server"
                            AutoGenerateColumns="false" AllowPaging="true" PageSize="10" OnRowCommand="GridView1_RowCommand"
                            OnPageIndexChanging="GridView1_PageIndexChanging" OnRowCreated="GridView1_RowCreated"
                            EmptyDataText="No existen Registros">

                            <RowStyle HorizontalAlign="Center" />

                            <Columns>
                                <asp:TemplateField Visible="false" HeaderStyle-CssClass="text-center">
                                    <ItemTemplate>
                                        <asp:Label ID="id_pregunta" runat="server" Text='<%# Eval("id_pregunta") %>' /></ItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="Pregunta" HeaderStyle-CssClass="text-center">
                                    <ItemTemplate>
                                        <asp:Label ID="titulo" runat="server" Text='<%# Eval("titulo") %>' /></ItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="Fecha" HeaderStyle-CssClass="text-center">
                                    <ItemTemplate>
                                        <asp:Label ID="fecha" runat="server" Text='<%# Eval("fecha","{0:dd/MM/yyyy}") %>' /></ItemTemplate>
                                </asp:TemplateField>

                                <asp:ButtonField HeaderText="Ver Pregunta" CommandName="VerPre" ButtonType="Image" ImageUrl="~\ico\view.png">
                                    <ControlStyle></ControlStyle>
                                </asp:ButtonField>

                                <asp:ButtonField HeaderText="Ver Respuestas" CommandName="VerRes" ButtonType="Image" ImageUrl="~\ico\view.png">
                                    <ControlStyle></ControlStyle>
                                </asp:ButtonField>

                                <asp:ButtonField HeaderText="Editar" CommandName="Editar" ButtonType="Image" ImageUrl="~\ico\editar.png" HeaderStyle-CssClass="text-center">
                                    <ControlStyle></ControlStyle>
                                </asp:ButtonField>

                                <asp:ButtonField HeaderText="Eliminar" CommandName="Eliminar" ButtonType="Image" ImageUrl="~\ico\delete.png">
                                    <ControlStyle></ControlStyle>
                                </asp:ButtonField>


                            </Columns>

                        </asp:GridView>

                    </div>
                </div>
            </div>

        </ContentTemplate>
        <Triggers></Triggers>
    </asp:UpdatePanel>

    <!-- view Modal -->
    <div id="viewModal" class="modal fade">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                    <h3>Ver Pregunta</h3>
                </div>
                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>

                        <div class="container" style="width: 100%;">
                            <div class="modal-body form-group">
                                <asp:HiddenField ID="hdfVerPregunta" runat="server" />

                                <div class="row">
                                    <div class="col-md-4">
                                        <h4>Titulo</h4>
                                    </div>
                                    <div class="col-md-8">
                                        <asp:Label ID="txtViewTitulo" class="control-label" runat="server"></asp:Label>
                                    </div>
                                </div>
                                <hr />

                                <div class="row">
                                    <div class="col-md-4">
                                        <h4>Pregunta</h4>
                                    </div>
                                    <div class="col-md-8">
                                        <asp:Label ID="txtViewPregunta" class="control-label" runat="server"></asp:Label>
                                    </div>
                                </div>
                                <hr />

                                <div class="row">
                                    <div class="col-md-4">
                                        <h4>Fecha</h4>
                                    </div>
                                    <div class="col-md-8">
                                        <asp:Label ID="txtViewFecha" class="control-label" runat="server"></asp:Label>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="modal-footer">
                            <div class="row">
                                <div class="col-md-4 col-md-offset-4">
                                    <button class="btn btn-block btn-default" data-dismiss="modal"
                                        aria-hidden="true">
                                        Cerrar</button>
                                </div>
                            </div>
                        </div>

                    </ContentTemplate>
                    <Triggers></Triggers>
                </asp:UpdatePanel>
            </div>
        </div>
    </div>

    <!-- Edit Modal -->
    <div id="editModal" class="modal fade">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                    <h3>Editar Obligacion</h3>
                </div>

                <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                    <ContentTemplate>
                        <div class="modal-body form-group">
                            <asp:HiddenField ID="hdfPreguntaEdit" runat="server" />

                            <div class="row">
                                <label class="col-md-4 control-label">Fecha: </label>
                                <div class="col-md-6">
                                    <asp:TextBox ID="txtFechaEdit" type="date" runat="server" ClientIDMode="Static"
                                        CssClass="form-control"></asp:TextBox>

                                    <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>"
                                        SetFocusOnError="true" Display="Dynamic" ForeColor="#B50128" Font-Size="10"
                                        Font-Bold="true" ControlToValidate="txtFechaEdit" runat="server"
                                        ValidationGroup="ValidationEdit" />
                                </div>
                            </div>

                            <br />

                            <div class="row">
                                <label class="col-md-4 control-label">Titulo</label>

                                <div class="col-md-6">
                                    <asp:TextBox ID="txtTituloEdit" runat="server" ClientIDMode="Static" CssClass="form-control"></asp:TextBox>

                                    <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" SetFocusOnError="true"
                                        Display="Dynamic" ForeColor="#B50128" Font-Size="10" Font-Bold="true"
                                        ControlToValidate="txtTituloEdit" runat="server" ValidationGroup="ValidationEdit" />
                                </div>
                            </div>

                            <br />

                            <div class="row">
                                <label class="col-md-4 control-label">Cuerpo Pregunta</label>

                                <div class="col-md-12">
                                    <h4>Pregunta</h4>

                                    <CKEditor:CKEditorControl ID="txtPreguntaEdit" BasePath="/ckeditor/" runat="server"></CKEditor:CKEditorControl>

                                    <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" SetFocusOnError="true"
                                        Display="Dynamic" ForeColor="#B50128" Font-Size="10" Font-Bold="true"
                                        ControlToValidate="txtPreguntaEdit" runat="server" ValidationGroup="ValidationEdit" />
                                </div>
                            </div>
                        </div>

                        <div class="modal-footer">
                            <div class="row">
                                <div class="col-md-4 col-md-offset-2">
                                    <asp:Button ID="btnEditar" runat="server" Text="Guardar" class="btn btn-block btn-info"
                                        OnClick="EditarRegistro" ValidationGroup="ValidationEdit" />
                                </div>

                                <div class="col-md-4">
                                    <button class="btn btn-block btn-default" data-dismiss="modal" aria-hidden="true">Cerrar</button>
                                </div>
                            </div>
                        </div>
                    </ContentTemplate>
                    <Triggers>
                        <asp:PostBackTrigger ControlID="btnEditar" />
                    </Triggers>
                </asp:UpdatePanel>
            </div>
        </div>
    </div>

    <!-- Delete Modal -->
    <div id="deleteModal" class="modal fade">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                    <h3>Eliminar Registro</h3>
                </div>
                <asp:UpdatePanel ID="upDel" runat="server">
                    <ContentTemplate>
                        <asp:HiddenField ID="hdfPreguntaIDDel" runat="server" />
                        <div class="modal-body form-group">
                            <div class="row">
                                <h4 class="text-center">¿Seguro desea eliminar este registro?</h4>
                            </div>
                        </div>

                        <div class="modal-footer">
                            <div class="row">
                                <div class="col-md-4 col-md-offset-2">
                                    <asp:Button ID="btnDelete" runat="server" Text="Eliminar" class="btn btn-block btn-info"
                                        OnClick="EliminarRegistro" />
                                </div>

                                <div class="col-md-4">
                                    <button class="btn btn-block btn-default" data-dismiss="modal" aria-hidden="true">Cerrar</button>
                                </div>
                            </div>
                        </div>

                    </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="btnDelete" EventName="Click" />
                    </Triggers>
                </asp:UpdatePanel>
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

                            <asp:HiddenField ID="hdfRespuestas" runat="server" />

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
                            </div>
                        </div>
                    </ContentTemplate>
                    <Triggers></Triggers>
                </asp:UpdatePanel>
            </div>
        </div>
    </div>

</asp:Content>
