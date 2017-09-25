<%@ Page Language="C#" MasterPageFile="~/source/MasterPages/Menu.Master" AutoEventWireup="true" CodeBehind="create_ObjetivosSGSST.aspx.cs" Inherits="SGSSTC.source.sistema.EvaluacionInicial.create_ObjetivosSGSST" %>

<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>

<%@ Register Assembly="CKEditor.NET" Namespace="CKEditor.NET" TagPrefix="CKEditor" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server"></asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <script src="//ajax.googleapis.com/ajax/libs/jquery/1.8.0/jquery.min.js" type="text/javascript"></script>
    <script type="text/javascript" src="//www.google.com/jsapi"></script>

    <asp:UpdatePanel ID="MyUpdatePanel" runat="server" UpdateMode="Always">

        <ContentTemplate>

            <ol class="breadcrumb">
                <li><a href="#">Fase: Planear</a></li>
                <li><a href="../Planear/index_ObjetivosSGSST.aspx"> Objetivos SG-SST</a></li>
                <li><a href="#">Crear Documento Objetivos SG-SST</a></li>
            </ol>

            <div class="page-header">
                <h1 class="text-center">Crear Documento de Objetivos SG-SST</h1>
            </div>

            <div class="row">
                <asp:PlaceHolder runat="server" ID="phEmpresa">
                    <div class="col-md-4 col-md-offset-4">
                        <h4 class="text-center">Empresa</h4>
                        <asp:DropDownList runat="server" ID="ddlEmpresa" data-toggle="tooltip" data-placement="bottom" title="Seleccione una Empresa" class="form-control" AutoPostBack="true"
                            OnSelectedIndexChanged="ddlEmpresa_SelectedIndexChanged">
                        </asp:DropDownList>
                    </div>
                </asp:PlaceHolder>

                <asp:PlaceHolder runat="server" ID="phSucursal" Visible="false">
                    <div class="col-md-4 col-md-offset-4">
                        <h4 class="text-center">Sucursal</h4>
                        <asp:DropDownList runat="server" ID="ddlSucursal" data-toggle="tooltip" data-placement="bottom" title="Seleccione una Sucursal" class="form-control"></asp:DropDownList>
                        <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" SetFocusOnError="true"
                            Display="Dynamic" ForeColor="#B50128" Font-Size="10" Font-Bold="true"
                            ControlToValidate="ddlSucursal" runat="server" ValidationGroup="ValidationAdd" />
                    </div>
                </asp:PlaceHolder>
            </div>
            <br />

            <div class="row text-center">
                <div class="box">
            <div class="panel-group" id="accordion">
                <div class="panel panel-default">
                    <div class="panel-heading bg-aqua color-palette">
                        <h4 class="panel-title"><a data-toggle="collapse" data-parent="#accordion" href="#collapse1">OBJETIVOS DEL SG-SST</a></h4>
                    </div>

                    <div id="collapse1" class="panel-collapse collapse">
                        <div class="panel-body">
                            <CKEditor:CKEditorControl ID="txtObjetivosSGSST" BasePath="/ckeditor/" runat="server"></CKEditor:CKEditorControl>
                        </div>
                    </div>
                </div>
                
            </div>

        </div>
            </div>

            <div class="row text-center">
                <div class="col-md-4 col-md-offset-4">
                    <asp:ImageButton alt="-" ID="btnGuardar" runat="server" ImageUrl="~\ico\print.png" OnClick="GenerarDocumento"
                        ValidationGroup="ValidationAdd" data-toggle="tooltip" data-placement="bottom"
                        title="Presione para generar el documento de Auto-Evaluación" />
                    <h4>Generar Documento</h4>
                </div>
            </div>

        </ContentTemplate>

        <Triggers>
            <asp:PostBackTrigger ControlID="btnGuardar" />
        </Triggers>
    </asp:UpdatePanel>

</asp:Content>
