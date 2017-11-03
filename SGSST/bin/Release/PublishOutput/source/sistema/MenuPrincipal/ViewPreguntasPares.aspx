<%@ Page Language="C#" MasterPageFile="~/source/MasterPages/Menu.Master" AutoEventWireup="true" CodeBehind="ViewPreguntasPares.aspx.cs" Inherits="SGSSTC.source.sistema.MenuPrincipal.ViewPreguntasPares" %>
<%@ Register Assembly="CKEditor.NET" Namespace="CKEditor.NET" TagPrefix="CKEditor" %>
<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>

<%@ Register Src="~/source/WebUserControl/pagination.ascx" TagPrefix="ucpag" TagName="pagination" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server"></asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

	<asp:UpdatePanel runat="server">
		<ContentTemplate>

			<ol class="breadcrumb">
				<li><a href="index.aspx">Menu Principal</a></li>
				<li><a href="#">Ver Preguntas Pares</a></li>
			</ol>

			<div class="page-header">
				<h1 class="text-center">Ver Preguntas Pares</h1>
			</div>
            
            <asp:PlaceHolder ID="phAlerta" runat="server" Visible="false">
                <div id="divAlerta" runat="server">
                    <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                    <asp:Label ID="lbAlerta" runat="server" Text="Label"></asp:Label>
                </div>
            </asp:PlaceHolder>

            <div class="row">
                <div class="col-md-3">

                    <h4 class="text-center">Sección: </h4>
                    <asp:DropDownList runat="server" ID="ddlSeccion" data-toggle="tooltip" data-placement="bottom" 
                        title="Seleccione una Empresa" class="form-control" AutoPostBack="true"
                        OnSelectedIndexChanged="ddlSeccion_SelectedIndexChanged">
                    </asp:DropDownList>

                </div>

                <div class="col-md-3">
                    <h4 class="text-center">División: </h4>
                    <asp:DropDownList runat="server" ID="ddlDivision" data-toggle="tooltip" data-placement="bottom" 
                        title="Seleccione una Empresa" class="form-control" AutoPostBack="true"
                        OnSelectedIndexChanged="ddlDivision_SelectedIndexChanged">
                    </asp:DropDownList>
                </div>

                <div class="col-md-3">
                    <h4 class="text-center">Clase: </h4>
                    <asp:DropDownList runat="server" ID="ddlClase" data-toggle="tooltip" data-placement="bottom" 
                        title="Seleccione una Empresa" class="form-control" AutoPostBack="true"
                        OnSelectedIndexChanged="ddlClase_SelectedIndexChanged">
                    </asp:DropDownList>
                </div>

                <div class="col-md-3">
                    <h4 class="text-center">Rol: </h4>
                    <asp:DropDownList runat="server" ID="ddlRol" data-toggle="tooltip" data-placement="bottom" 
                        title="Seleccione una Empresa" class="form-control" AutoPostBack="true"
                        OnSelectedIndexChanged="ddlRol_SelectedIndexChanged">
                    </asp:DropDownList>
                </div>
            </div>
            
            <br />

            <div class="row">
                <div class="col-md-3">
                    <h4 class="text-center">Fecha inicio: </h4>
                    <asp:TextBox ID="txtFechaInicio" runat="server" class="col-md-10" CssClass="form-control" TextMode="Date"
                        AutoPostBack="true" OnTextChanged="txtFechaInicio_TextChanged"></asp:TextBox>
                </div>

                <div class="col-md-3">
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

								<asp:ButtonField HeaderText="Responder" CommandName="Responder" ButtonType="Image" ImageUrl="~\ico\editar.png" HeaderStyle-CssClass="text-center">
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
								<div class="col-md-12">
									<asp:Label ID="txtViewFecha" runat="server" ClientIDMode="Static"></asp:Label>
								</div>
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
</asp:Content>
