<%@ Page Language="C#" MasterPageFile="~/source/MasterPages/Menu.Master" AutoEventWireup="true" CodeBehind="index_PlanTrabajo.aspx.cs" Inherits="SGSSTC.source.sistema.Hacer.index_PlanTrabajo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server"></asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <asp:UpdatePanel runat="server">
        <ContentTemplate>

            <ol class="breadcrumb">
                <li><a href="#">Fase: Planear</a></li>
                <li><a href="#">Plan de Trabajo anual</a></li>
            </ol>

            <div class="page-header">
                <h1 class="text-center">Plan de Trabajo Anual</h1>
            </div>
            
            <asp:PlaceHolder ID="phAlerta" runat="server" Visible="false">
                <div id="divAlerta" runat="server">
                    <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                    <asp:Label ID="lbAlerta" runat="server" Text="Label"></asp:Label>
                    <asp:TextBox ID="txtBuscar" runat="server" Visible="false"></asp:TextBox>
                </div>
            </asp:PlaceHolder>

            <div class="row">
                <div class="col-md-3 col-md-offset-3">
                    <h4 class="text-center">Año</h4>

                    <asp:DropDownList runat="server" ID="ddlYear" class="form-control" AutoPostBack="true"
                        OnSelectedIndexChanged="ddlYear_SelectedIndexChanged">
                    </asp:DropDownList>

                    <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" SetFocusOnError="true"
                        Display="Dynamic" ForeColor="#B50128" Font-Size="10" Font-Bold="true"
                        ControlToValidate="ddlYear" runat="server" />
                </div>

                <asp:PlaceHolder runat="server" ID="phEmpresa">
                    <div class="col-md-3">
                        <h4 class="text-center">Empresa</h4>
                        <asp:DropDownList runat="server" ID="ddlEmpresa" class="form-control" AutoPostBack="true"
                            data-toggle="tooltip" data-placement="bottom" title="Seleccione una Empresa"
                            OnSelectedIndexChanged="ddlEmpresa_SelectedIndexChanged">
                        </asp:DropDownList>
                    </div>
                </asp:PlaceHolder>

                <asp:PlaceHolder runat="server" ID="phSucursal">
                    <div class="col-md-3">
                        <h4 class="text-center">Sucursal</h4>

                        <asp:DropDownList runat="server" ID="ddlSucursal" class="form-control" AutoPostBack="true"
                            data-toggle="tooltip" data-placement="bottom" title="Seleccione una Sucursal"
                            OnSelectedIndexChanged="ddlSucursal_SelectedIndexChanged">
                        </asp:DropDownList>

                        <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" SetFocusOnError="true"
                            Display="Dynamic" ForeColor="#B50128" Font-Size="10" Font-Bold="true"
                            ControlToValidate="ddlSucursal" runat="server" />
                    </div>
                </asp:PlaceHolder>

            </div>

            <br />

            <hr />

            <div class="row">
                <h3 class="text-center">Plan de Trabajo Año
                    <asp:Label runat="server" ID="lbAnho" Text="---"> </asp:Label>
                    de la Sucursal 
                    <asp:Label runat="server" ID="lbSucursal" Text="---"></asp:Label>
                </h1>
            </div>

            <br />

            <div class="row">
                <div class="col-md-12">
                    <div class="box-body">
                        <div class="dataTables_wrapper form-inline dt-bootstrap" style="overflow: auto;">
                            <asp:GridView ID="GridView1" class="table table-bordered table-hover dataTable" runat="server"
                                AutoGenerateColumns="false" AllowPaging="true" PageSize="10" EmptyDataText="No existen Registros"
                                OnRowCommand="GridView1_RowCommand" OnRowDataBound="GridView1_RowDataBound"
                                OnRowCreated="GridView1_RowCreated">

                                <RowStyle HorizontalAlign="Center" />

                                <Columns>

                                    <asp:TemplateField HeaderText="Actividad" HeaderStyle-CssClass="text-center">
                                        <ItemTemplate>
                                            <asp:Label ID="actividad" runat="server" Text='<%# Eval("actividad") %>' />
                                            <asp:Label ID="id_planTrabajo" runat="server" Visible="false" Text='<%# Eval("id_plan_trabajo") %>' />
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Objetivos" HeaderStyle-CssClass="text-center">
                                        <ItemTemplate>
                                            <asp:Label ID="Label53" runat="server" Text='<%# Eval("objetivo") %>' />
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Responsable" HeaderStyle-CssClass="text-center">
                                        <ItemTemplate>
                                            <asp:Label ID="Label54" runat="server" Text='<%# Eval("nombreResp") %>' />
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Obligaciones" HeaderStyle-CssClass="text-center"
                                        HeaderStyle-Font-Bold="true"
                                        HeaderStyle-ForeColor="Black">
                                        <ItemTemplate>
                                            <div id="accordion2" class="panel-group">
                                                <asp:Panel ID="pnl" runat="server">
                                                </asp:Panel>
                                            </div>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Recursos Aprobados" HeaderStyle-CssClass="text-center">
                                        <ItemTemplate>
                                            <asp:Label ID="Label55" runat="server" Text='<%# Eval("recursos_aprobados") %>' />
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:ButtonField HeaderText="Acciones" CommandName="Editar" ButtonType="Image"
                                        HeaderStyle-CssClass="text-center" ImageUrl="~\ico\editar.png">
                                        <ControlStyle></ControlStyle>
                                    </asp:ButtonField>

                                    <asp:ButtonField HeaderText="Eliminar" CommandName="Eliminar" ButtonType="Image" ImageUrl="~\ico\delete.png" HeaderStyle-CssClass="text-center">
                                        <ControlStyle></ControlStyle>
                                    </asp:ButtonField>

                                    <asp:TemplateField HeaderText="1" HeaderStyle-CssClass="text-center">
                                        <ItemTemplate>
                                            <asp:Label ID="Label1" runat="server" Text='<%# Eval("sem1") %>' />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="2" HeaderStyle-CssClass="text-center">
                                        <ItemTemplate>
                                            <asp:Label ID="Label2" runat="server" Text='<%# Eval("sem2") %>' />
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="3" HeaderStyle-CssClass="text-center">
                                        <ItemTemplate>
                                            <asp:Label ID="Label3" runat="server" Text='<%# Eval("sem3") %>' />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="4" HeaderStyle-CssClass="text-center">
                                        <ItemTemplate>
                                            <asp:Label ID="Label4" runat="server" Text='<%# Eval("sem4") %>' />
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="5" HeaderStyle-CssClass="text-center">
                                        <ItemTemplate>
                                            <asp:Label ID="Label5" runat="server" Text='<%# Eval("sem5") %>' />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="6" HeaderStyle-CssClass="text-center">
                                        <ItemTemplate>
                                            <asp:Label ID="Label6" runat="server" Text='<%# Eval("sem6") %>' />
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="7" HeaderStyle-CssClass="text-center">
                                        <ItemTemplate>
                                            <asp:Label ID="Label7" runat="server" Text='<%# Eval("sem7") %>' />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="8" HeaderStyle-CssClass="text-center">
                                        <ItemTemplate>
                                            <asp:Label ID="Label8" runat="server" Text='<%# Eval("sem8") %>' />
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="9" HeaderStyle-CssClass="text-center">
                                        <ItemTemplate>
                                            <asp:Label ID="Label9" runat="server" Text='<%# Eval("sem9") %>' />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="10" HeaderStyle-CssClass="text-center">
                                        <ItemTemplate>
                                            <asp:Label ID="Label10" runat="server" Text='<%# Eval("sem10") %>' />
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="11" HeaderStyle-CssClass="text-center">
                                        <ItemTemplate>
                                            <asp:Label ID="Label11" runat="server" Text='<%# Eval("sem11") %>' />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="12" HeaderStyle-CssClass="text-center">
                                        <ItemTemplate>
                                            <asp:Label ID="Label12" runat="server" Text='<%# Eval("sem12") %>' />
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="13" HeaderStyle-CssClass="text-center">
                                        <ItemTemplate>
                                            <asp:Label ID="Label13" runat="server" Text='<%# Eval("sem13") %>' />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="14" HeaderStyle-CssClass="text-center">
                                        <ItemTemplate>
                                            <asp:Label ID="Label14" runat="server" Text='<%# Eval("sem14") %>' />
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="15" HeaderStyle-CssClass="text-center">
                                        <ItemTemplate>
                                            <asp:Label ID="Label15" runat="server" Text='<%# Eval("sem15") %>' />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="16" HeaderStyle-CssClass="text-center">
                                        <ItemTemplate>
                                            <asp:Label ID="Label16" runat="server" Text='<%# Eval("sem15") %>' />
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="17" HeaderStyle-CssClass="text-center">
                                        <ItemTemplate>
                                            <asp:Label ID="Label17" runat="server" Text='<%# Eval("sem16") %>' />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="18" HeaderStyle-CssClass="text-center">
                                        <ItemTemplate>
                                            <asp:Label ID="Label18" runat="server" Text='<%# Eval("sem17") %>' />
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="19" HeaderStyle-CssClass="text-center">
                                        <ItemTemplate>
                                            <asp:Label ID="Label19" runat="server" Text='<%# Eval("sem18") %>' />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="20" HeaderStyle-CssClass="text-center">
                                        <ItemTemplate>
                                            <asp:Label ID="Label20" runat="server" Text='<%# Eval("sem19") %>' />
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="21" HeaderStyle-CssClass="text-center">
                                        <ItemTemplate>
                                            <asp:Label ID="Label21" runat="server" Text='<%# Eval("sem20") %>' />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="22" HeaderStyle-CssClass="text-center">
                                        <ItemTemplate>
                                            <asp:Label ID="Label22" runat="server" Text='<%# Eval("sem21") %>' />
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="23" HeaderStyle-CssClass="text-center">
                                        <ItemTemplate>
                                            <asp:Label ID="Label23" runat="server" Text='<%# Eval("sem22") %>' />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="24" HeaderStyle-CssClass="text-center">
                                        <ItemTemplate>
                                            <asp:Label ID="Label24" runat="server" Text='<%# Eval("sem23") %>' />
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="25" HeaderStyle-CssClass="text-center">
                                        <ItemTemplate>
                                            <asp:Label ID="Label25" runat="server" Text='<%# Eval("sem24") %>' />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="26" HeaderStyle-CssClass="text-center">
                                        <ItemTemplate>
                                            <asp:Label ID="Label26" runat="server" Text='<%# Eval("sem25") %>' />
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="27" HeaderStyle-CssClass="text-center">
                                        <ItemTemplate>
                                            <asp:Label ID="Label27" runat="server" Text='<%# Eval("sem26") %>' />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="28" HeaderStyle-CssClass="text-center">
                                        <ItemTemplate>
                                            <asp:Label ID="Label28" runat="server" Text='<%# Eval("sem27") %>' />
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="29" HeaderStyle-CssClass="text-center">
                                        <ItemTemplate>
                                            <asp:Label ID="Label29" runat="server" Text='<%# Eval("sem28") %>' />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="30" HeaderStyle-CssClass="text-center">
                                        <ItemTemplate>
                                            <asp:Label ID="Label30" runat="server" Text='<%# Eval("sem29") %>' />
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="31" HeaderStyle-CssClass="text-center">
                                        <ItemTemplate>
                                            <asp:Label ID="Label31" runat="server" Text='<%# Eval("sem31") %>' />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="32" HeaderStyle-CssClass="text-center">
                                        <ItemTemplate>
                                            <asp:Label ID="Label32" runat="server" Text='<%# Eval("sem32") %>' />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="33" HeaderStyle-CssClass="text-center">
                                        <ItemTemplate>
                                            <asp:Label ID="Label33" runat="server" Text='<%# Eval("sem33") %>' />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="34" HeaderStyle-CssClass="text-center">
                                        <ItemTemplate>
                                            <asp:Label ID="Label34" runat="server" Text='<%# Eval("sem34") %>' />
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="35" HeaderStyle-CssClass="text-center">
                                        <ItemTemplate>
                                            <asp:Label ID="Label35" runat="server" Text='<%# Eval("sem35") %>' />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="36" HeaderStyle-CssClass="text-center">
                                        <ItemTemplate>
                                            <asp:Label ID="Label36" runat="server" Text='<%# Eval("sem36") %>' />
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="37" HeaderStyle-CssClass="text-center">
                                        <ItemTemplate>
                                            <asp:Label ID="Label37" runat="server" Text='<%# Eval("sem37") %>' />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="38" HeaderStyle-CssClass="text-center">
                                        <ItemTemplate>
                                            <asp:Label ID="Label38" runat="server" Text='<%# Eval("sem38") %>' />
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="39" HeaderStyle-CssClass="text-center">
                                        <ItemTemplate>
                                            <asp:Label ID="Label39" runat="server" Text='<%# Eval("sem39") %>' />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="40" HeaderStyle-CssClass="text-center">
                                        <ItemTemplate>
                                            <asp:Label ID="Label40" runat="server" Text='<%# Eval("sem40") %>' />
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="41" HeaderStyle-CssClass="text-center">
                                        <ItemTemplate>
                                            <asp:Label ID="Label41" runat="server" Text='<%# Eval("sem41") %>' />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="42" HeaderStyle-CssClass="text-center">
                                        <ItemTemplate>
                                            <asp:Label ID="Label42" runat="server" Text='<%# Eval("sem42") %>' />
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="43" HeaderStyle-CssClass="text-center">
                                        <ItemTemplate>
                                            <asp:Label ID="Label43" runat="server" Text='<%# Eval("sem43") %>' />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="44" HeaderStyle-CssClass="text-center">
                                        <ItemTemplate>
                                            <asp:Label ID="Label44" runat="server" Text='<%# Eval("sem44") %>' />
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="45" HeaderStyle-CssClass="text-center">
                                        <ItemTemplate>
                                            <asp:Label ID="Label45" runat="server" Text='<%# Eval("sem45") %>' />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="46" HeaderStyle-CssClass="text-center">
                                        <ItemTemplate>
                                            <asp:Label ID="Label46" runat="server" Text='<%# Eval("sem46") %>' />
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="47" HeaderStyle-CssClass="text-center">
                                        <ItemTemplate>
                                            <asp:Label ID="Label47" runat="server" Text='<%# Eval("sem47") %>' />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="48" HeaderStyle-CssClass="text-center">
                                        <ItemTemplate>
                                            <asp:Label ID="Label48" runat="server" Text='<%# Eval("sem48") %>' />
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="49" HeaderStyle-CssClass="text-center">
                                        <ItemTemplate>
                                            <asp:Label ID="Label49" runat="server" Text='<%# Eval("sem49") %>' />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="50" HeaderStyle-CssClass="text-center">
                                        <ItemTemplate>
                                            <asp:Label ID="Label50" runat="server" Text='<%# Eval("sem50") %>' />
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="51" HeaderStyle-CssClass="text-center">
                                        <ItemTemplate>
                                            <asp:Label ID="Label51" runat="server" Text='<%# Eval("sem51") %>' />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="52" HeaderStyle-CssClass="text-center">
                                        <ItemTemplate>
                                            <asp:Label ID="Label52" runat="server" Text='<%# Eval("sem52") %>' />
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="ID" Visible="false" HeaderStyle-CssClass="text-center">
                                        <ItemTemplate>
                                            <asp:Label ID="id_plan_trabajo" runat="server" Text='<%# Eval("id_plan_trabajo") %>' />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                            </asp:GridView>
                        </div>
                    </div>
                </div>
            </div>

            <br />

            <asp:PlaceHolder runat="server" Visible="false" ID="phAgregar">
                <div class="row text-center">

                    <div class="col-md-3 col-md-offset-1">
                        <asp:ImageButton alt="-" ID="btnAgregar" runat="server" ImageUrl="~\ico\agregar.png"
                            data-toggle="modal" data-target="#addModal" />
                        <h4>Nueva Actividad</h4>
                    </div>

                    <div class="col-md-3">
                        <asp:ImageButton alt="-" ID="btnImprimirG" runat="server" ImageUrl="~\ico\print.png"
                            OnClick="GenerarDocumentoG" />
                        <h4>Generar Documento General</h4>
                    </div>

                    <div class="col-md-3">
                        <asp:ImageButton alt="-" ID="btnImprimirE" runat="server" ImageUrl="~\ico\print.png"
                            OnClick="GenerarDocumentoE" />
                        <h4>Generar Documento Especifico</h4>
                    </div>
                </div>
            </asp:PlaceHolder>
            </div>

        </ContentTemplate>
        <Triggers>
            <asp:PostBackTrigger ControlID="btnImprimirG" />
            <asp:PostBackTrigger ControlID="btnImprimirE" />
        </Triggers>
    </asp:UpdatePanel>

    <!-- Add Modal -->
    <div id="addModal" class="modal">
        <div class="modal-dialog">
            <div class="modal-content">

                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">Cerrar</button>
                    <h3>Agregar Registro</h3>
                </div>

                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>

                        <div class="modal-body form-group text-left">

                            <asp:PlaceHolder runat="server" ID="phEmpresaAdd" Visible="false">
                                <div class="row">
                                    <div class="col-md-8 col-md-offset-2">
                                        <h4>Empresa</h4>

                                        <asp:DropDownList ID="ddlEmpresaAdd" data-toggle="tooltip" data-placement="bottom" title="Seleccione una Empresa" runat="server" ClientIDMode="Static" CssClass="form-control"
                                            AutoPostBack="true" OnSelectedIndexChanged="ddlEmpresaAdd_SelectedIndexChanged">
                                        </asp:DropDownList>

                                        <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>"
                                            SetFocusOnError="true" Display="Dynamic" ForeColor="#B50128" Font-Size="10" Font-Bold="true"
                                            ControlToValidate="ddlEmpresaAdd" runat="server" ValidationGroup="ValidationAdd" />
                                    </div>

                                </div>
                                <br />
                            </asp:PlaceHolder>

                            <asp:PlaceHolder runat="server" ID="phSucursalAdd" Visible="false">
                                <div class="row">
                                    <div class="col-md-8 col-md-offset-2">
                                        <h4>Sucursal</h4>

                                        <asp:DropDownList ID="ddlSucursalAdd" data-toggle="tooltip" data-placement="bottom" title="Seleccione una Sucursal" runat="server" ClientIDMode="Static"
                                            CssClass="form-control" AutoPostBack="true"
                                            OnSelectedIndexChanged="ddlSucursalAdd_SelectedIndexChanged">
                                        </asp:DropDownList>

                                        <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" SetFocusOnError="true"
                                            Display="Dynamic" ForeColor="#B50128" Font-Size="10" Font-Bold="true"
                                            ControlToValidate="ddlSucursalAdd" runat="server" ValidationGroup="ValidationAdd" />
                                    </div>
                                </div>
                                <br />
                            </asp:PlaceHolder>

                            <div class="row">
                                <div class="col-md-4 col-md-offset-2">
                                    <h4>Semana Inicial</h4>

                                    <asp:TextBox CssClass="form-control" runat="server" type="week" ID="TxtSemanaIniAdd"></asp:TextBox>

                                    <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" SetFocusOnError="true"
                                        Display="Dynamic" ForeColor="#B50128" Font-Size="10" Font-Bold="true"
                                        ControlToValidate="TxtSemanaIniAdd" runat="server" ValidationGroup="ValidationAdd" />
                                </div>

                                <div class="col-md-4">
                                    <h4>Semana Final</h4>

                                    <asp:TextBox CssClass="form-control" runat="server" type="week"
                                        ID="TxtSemanaFinAdd"></asp:TextBox>

                                    <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" SetFocusOnError="true"
                                        Display="Dynamic" ForeColor="#B50128" Font-Size="10" Font-Bold="true"
                                        ControlToValidate="TxtSemanaFinAdd" runat="server" ValidationGroup="ValidationAdd" />
                                </div>

                            </div>

                            <br />

                            <div class="row">
                                <div class="col-md-8 col-md-offset-2">
                                    <h4>Nombre de la Actividad</h4>

                                    <asp:TextBox ID="txtActividad" runat="server" MaxLength="1000" ClientIDMode="Static"
                                        CssClass="form-control"></asp:TextBox>

                                    <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" SetFocusOnError="true"
                                        Display="Dynamic" ForeColor="#B50128" Font-Size="10" Font-Bold="true"
                                        ControlToValidate="txtActividad" runat="server" ValidationGroup="ValidationAdd" />

                                </div>
                            </div>

                            <br />

                            <div class="row">
                                <div class="col-md-8 col-md-offset-2">
                                    <h4>Objetivos</h4>

                                    <asp:TextBox ID="txtObjetivos" runat="server" MaxLength="1000" ClientIDMode="Static"
                                        CssClass="form-control"></asp:TextBox>

                                    <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" SetFocusOnError="true"
                                        Display="Dynamic" ForeColor="#B50128" Font-Size="10" Font-Bold="true"
                                        ControlToValidate="txtObjetivos" runat="server" ValidationGroup="ValidationAdd" />
                                </div>

                            </div>

                            <br />

                            <div class="row">
                                <div class="col-md-4 col-md-offset-2">
                                    <h4>Recursos Aprobados</h4>

                                    <asp:TextBox ID="txtRecursosAdd" runat="server" ClientIDMode="Static"
                                        CssClass="form-control" type="number" step="0.01"></asp:TextBox>

                                    <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" SetFocusOnError="true"
                                        Display="Dynamic" ForeColor="#B50128" Font-Size="10" Font-Bold="true"
                                        ControlToValidate="txtRecursosAdd" runat="server" ValidationGroup="ValidationAdd" />

                                </div>
                                <div class="col-md-4">
                                    <h4>Responsable</h4>

                                    <asp:DropDownList ID="ddlResponsable" runat="server" ClientIDMode="Static" CssClass="form-control"></asp:DropDownList>

                                    <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" SetFocusOnError="true"
                                        Display="Dynamic" ForeColor="#B50128" Font-Size="10" Font-Bold="true"
                                        ControlToValidate="ddlResponsable" runat="server" ValidationGroup="ValidationAdd" />
                                </div>
                            </div>

                            <br />
                        </div>

                        <div class="modal-footer">
                            <div class="row">
                                <div class="col-md-4 col-md-offset-2">
                                    <asp:Button ID="btnAdd" runat="server" Text="Agregar" class="btn btn-block btn-info"
                                        OnClick="Guardar" ValidationGroup="ValidationAdd" />
                                </div>
                                <div class="col-md-4">
                                    <button class="btn btn-block btn-default" data-dismiss="modal" aria-hidden="true">Cerrar</button>

                                </div>
                            </div>
                        </div>

                    </ContentTemplate>
                    <Triggers>
                        <asp:PostBackTrigger ControlID="btnAdd" />
                    </Triggers>
                </asp:UpdatePanel>
            </div>
        </div>
    </div>

    <!-- Edit Modal -->
    <div id="editModal" class="modal">
        <div class="modal-dialog">
            <div class="modal-content">

                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                    <h3>Editar Registro</h3>
                </div>

                <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                    <ContentTemplate>

                        <div class="modal-body form-group">
                            <asp:HiddenField ID="hdfEditID" runat="server" />

                            <div class="modal-body form-group">
                                <asp:PlaceHolder runat="server" ID="phEmpresaEdit" Visible="false">
                                    <div class="row">
                                        <div class="col-md-4">
                                            <h4 class="text-center">Empresa</h4>
                                        </div>

                                        <div class="col-md-8">
                                            <asp:DropDownList ID="ddlEmpresaEdit" data-toggle="tooltip" data-placement="bottom" title="Seleccione una empresa" runat="server" ClientIDMode="Static"
                                                CssClass="form-control" AutoPostBack="true"
                                                OnSelectedIndexChanged="ddlEmpresaEdit_SelectedIndexChanged">
                                            </asp:DropDownList>

                                            <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" SetFocusOnError="true"
                                                Display="Dynamic" ForeColor="#B50128" Font-Size="10" Font-Bold="true"
                                                ControlToValidate="ddlEmpresaEdit" runat="server" ValidationGroup="ValidationEdit" />
                                        </div>
                                    </div>
                                    <br />
                                </asp:PlaceHolder>

                                <asp:PlaceHolder runat="server" ID="phSucursalEdit" Visible="false">
                                    <div class="row">
                                        <div class="col-md-4">
                                            <h4 class="text-center">Sucursal</h4>
                                        </div>

                                        <div class="col-md-8">
                                            <asp:DropDownList ID="ddlSucursalEdit" data-toggle="tooltip" data-placement="bottom" title="Seleccione una Sucursal" runat="server" ClientIDMode="Static"
                                                CssClass="form-control" AutoPostBack="true"
                                                OnSelectedIndexChanged="ddlSucursalAdd_SelectedIndexChanged">
                                            </asp:DropDownList>

                                            <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" SetFocusOnError="true"
                                                Display="Dynamic" ForeColor="#B50128" Font-Size="10" Font-Bold="true"
                                                ControlToValidate="ddlSucursalEdit" runat="server" ValidationGroup="ValidationEdit" />

                                        </div>
                                    </div>
                                    <br />
                                </asp:PlaceHolder>

                                <div class="row">
                                    <div class="col-md-4">
                                        <h4 class="text-center">Semana Inicial</h4>
                                    </div>
                                    <div class="col-md-8">
                                        <asp:TextBox CssClass="form-control" runat="server" type="week" ID="TxtSemanaIniEdit"></asp:TextBox>

                                        <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" SetFocusOnError="true"
                                            Display="Dynamic" ForeColor="#B50128" Font-Size="10" Font-Bold="true"
                                            ControlToValidate="TxtSemanaIniEdit" runat="server" ValidationGroup="ValidationEdit" />

                                    </div>
                                </div>
                                <br />

                                <div class="row">
                                    <div class="col-md-4">
                                        <h4 class="text-center">Semana Final</h4>
                                    </div>
                                    <div class="col-md-8">
                                        <asp:TextBox CssClass="form-control" runat="server" type="week" ID="TxtSemanaFinEdit"></asp:TextBox>

                                        <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" SetFocusOnError="true"
                                            Display="Dynamic" ForeColor="#B50128" Font-Size="10" Font-Bold="true"
                                            ControlToValidate="TxtSemanaFinEdit" runat="server" ValidationGroup="ValidationEdit" />
                                    </div>
                                </div>
                                <br />

                                <div class="row">
                                    <div class="col-md-4">
                                        <h4 class="text-center">Actividad</h4>
                                    </div>

                                    <div class="col-md-8">
                                        <asp:TextBox ID="txtActividadEdit" MaxLength="1000" runat="server" ClientIDMode="Static" CssClass="form-control"></asp:TextBox>

                                        <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" SetFocusOnError="true"
                                            Display="Dynamic" ForeColor="#B50128" Font-Size="10" Font-Bold="true"
                                            ControlToValidate="txtActividadEdit" runat="server" ValidationGroup="ValidationEdit" />
                                    </div>
                                </div>
                                <br />

                                <div class="row">
                                    <div class="col-md-4">
                                        <h4 class="text-center">Objetivos</h4>
                                    </div>

                                    <div class="col-md-8">
                                        <asp:TextBox ID="txtObjetivosEdit" MaxLength="1000" runat="server" ClientIDMode="Static" CssClass="form-control"></asp:TextBox>

                                        <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" SetFocusOnError="true"
                                            Display="Dynamic" ForeColor="#B50128" Font-Size="10" Font-Bold="true"
                                            ControlToValidate="txtObjetivosEdit" runat="server" ValidationGroup="ValidationEdit" />
                                    </div>

                                </div>
                                <br />

                                <div class="row">

                                    <div class="col-md-4">
                                        <h4 class="text-center">Recursos Aprobados</h4>
                                    </div>

                                    <div class="col-md-8">
                                        <asp:TextBox ID="txtRecursosEdit" runat="server" ClientIDMode="Static"
                                            CssClass="form-control" type="number" step="0.01"></asp:TextBox>

                                        <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" SetFocusOnError="true"
                                            Display="Dynamic" ForeColor="#B50128" Font-Size="10" Font-Bold="true"
                                            ControlToValidate="txtRecursosEdit" runat="server" ValidationGroup="ValidationEdit" />

                                    </div>
                                </div>
                                <br />

                                <div class="row">
                                    <div class="col-md-4">
                                        <h4 class="text-center">Responsable</h4>
                                    </div>

                                    <div class="col-md-8">
                                        <asp:DropDownList ID="ddlResponsableEdit" runat="server" ClientIDMode="Static"
                                            CssClass="form-control">
                                        </asp:DropDownList>

                                        <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" SetFocusOnError="true"
                                            Display="Dynamic" ForeColor="#B50128" Font-Size="10" Font-Bold="true"
                                            ControlToValidate="ddlResponsableEdit" runat="server" ValidationGroup="ValidationEdit" />
                                    </div>
                                </div>
                                <br />
                            </div>
                        </div>

                        <div class="modal-footer">
                            <div class="row">
                                <div class="col-md-4 col-md-offset-2">
                                    <asp:Button ID="btnEditar" runat="server" Text="Guardar" class="btn btn-block btn-info" OnClick="EditarRegistro" ValidationGroup="ValidationEdit" />
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
    <div id="deleteModal" class="modal">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">Cerrar</button>
                    <h3>Eliminar Registro</h3>
                </div>
                <asp:UpdatePanel ID="upDel" runat="server">
                    <ContentTemplate>

                        <div class="modal-body form-group">
                            <asp:HiddenField ID="hdfIDDel" runat="server" />

                            <div class="row">
                                <h4 class="text-center">¿Seguro desea eliminar este registro?</h4>
                            </div>
                        </div>

                        <div class="modal-footer">
                            <div class="row">
                                <div class="col-md-4 col-md-offset-2">
                                    <asp:Button ID="btnDelete" runat="server" Text="Eliminar" class="btn btn-block btn-info" OnClick="EliminarRegistro" />
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

    <!-- view Modal -->
    <div id="viewModal" class="modal fade">
        <div class="modal-dialog">
            <div class="modal-content">

                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                    <h3>Ver Obligacion</h3>
                </div>

                <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                    <ContentTemplate>
                        <div class="modal-body form-group">

                            <div class="row">
                                <div>
                                    <label class="col-md-4 control-label">Fecha de Entrega: </label>
                                    <div class="col-md-6">
                                        <asp:TextBox ID="txtViewFecha" runat="server" ClientIDMode="Static" CssClass="form-control"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <br />

                            <div class="row">
                                <div>
                                    <label class="col-md-4 control-label">Responsable:</label>
                                    <div class="col-md-6">
                                        <asp:TextBox ID="txtViewResp" runat="server" ClientIDMode="Static" CssClass="form-control"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <br />

                            <div class="row">
                                <div>
                                    <asp:Label ID="lbMedida" class="col-md-4 control-label" runat="server" Text="Label" Font-Bold="True"></asp:Label>
                                    <div class="col-md-6">
                                        <asp:TextBox ID="txtViewMedida" runat="server" ClientIDMode="Static" TextMode="MultiLine" CssClass="form-control"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <br />

                            <div class="row">
                                <div>
                                    <label class="col-md-4 control-label">Categoria:</label>
                                    <div class="col-md-6">
                                        <asp:TextBox ID="txtViewCategoria" runat="server" ClientIDMode="Static" CssClass="form-control"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <br />

                            <div class="row">
                                <div>
                                    <label class="col-md-4 control-label">Prioridad:</label>

                                    <div class="col-md-6">
                                        <asp:TextBox ID="txtViewPrioridad" runat="server" ClientIDMode="Static" CssClass="form-control"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <br />
                            <div class="row">
                                <div>
                                    <label class="col-md-4 control-label">Frecuencia de Control:</label>

                                    <div class="col-md-6">
                                        <asp:TextBox ID="txtViewFrecuencia" runat="server" ClientIDMode="Static" CssClass="form-control"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <br />

                            <div class="row">
                                <div>
                                    <label class="col-md-4 control-label">Estatus:</label>

                                    <div class="col-md-6">
                                        <asp:TextBox ID="txtViewEstatus" runat="server" ClientIDMode="Static" CssClass="form-control"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <br />

                            <div class="row">
                                <div>
                                    <label class="col-md-4 control-label">Descripción</label>
                                    <div class="col-md-6">
                                        <asp:TextBox ID="txtViewDesc" runat="server" ClientIDMode="Static" CssClass="form-control" TextMode="MultiLine" Rows="5"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <br />

                            <div class="row">
                                <div>
                                    <label class="col-md-4 control-label">Acciones: </label>
                                    <div class="col-md-6">
                                        <asp:TextBox ID="txtViewAcciones" runat="server" ClientIDMode="Static" CssClass="form-control" TextMode="MultiLine" Rows="5"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <br />


                        </div>

                        <div class="modal-footer">
                            <div class="row">
                                <div class="col-md-4 col-md-offset-4">
                                    <button class="btn btn-block btn-default" data-dismiss="modal" aria-hidden="true">Cerrar</button>
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
