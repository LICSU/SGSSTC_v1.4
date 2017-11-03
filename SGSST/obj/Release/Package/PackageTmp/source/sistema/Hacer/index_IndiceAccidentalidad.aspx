<%@ Page Language="C#" MasterPageFile="~/source/MasterPages/Menu.Master" AutoEventWireup="true" CodeBehind="index_IndiceAccidentalidad.aspx.cs" Inherits="SGSSTC.source.sistema.EvaluacionInicial.index_IndiceAccidentalidad" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server"></asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">


    <ol class="breadcrumb">
        <li><a href="#">Fase: Hacer</a></li>
        <li><a href="#">Índices de Accidentalidad</a></li>
    </ol>

    <div class="page-header">
        <h1 class="text-center">Índices de Accidentalidad </h1>
    </div>

    <asp:PlaceHolder ID="phAlerta" runat="server" Visible="false">
        <div id="divAlerta" runat="server">
            <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
            <asp:Label ID="lbAlerta" runat="server" Text="Label"></asp:Label>
        </div>
    </asp:PlaceHolder>

    <div class="row">
        <asp:PlaceHolder runat="server" ID="phEmpresa" Visible="true">
            <div class="col-md-4 text-center">
                <label>Empresa</label>
                <asp:DropDownList runat="server" ID="ddlEmpresa" data-toggle="tooltip" data-placement="bottom" title="Seleccione una Empresa" CssClass="form-control" AutoPostBack="true" OnSelectedIndexChanged="ddlEmpresa_SelectedIndexChanged"></asp:DropDownList>
            </div>
        </asp:PlaceHolder>
    </div>
    <br />

    <div class="row">
        <asp:PlaceHolder runat="server" ID="phSucursal" Visible="true">
            <div class="col-md-4 text-center">
                <label>Sucursal</label>
                <asp:DropDownList runat="server" ID="ddlSucursal" data-toggle="tooltip" data-placement="bottom" title="Seleccione una Sucursal" CssClass="form-control" AutoPostBack="true" OnSelectedIndexChanged="ddlSucursal_SelectedIndexChanged"></asp:DropDownList>
            </div>
        </asp:PlaceHolder>

        <asp:PlaceHolder runat="server" ID="phAnho" Visible="true">
            <div class="col-md-4 text-center">
                <label>Año</label>
                <asp:DropDownList runat="server" ID="ddlAnho" CssClass="form-control" AutoPostBack="true" OnSelectedIndexChanged="ddlAnho_SelectedIndexChanged"></asp:DropDownList>
            </div>
        </asp:PlaceHolder>

        <div class="col-md-4 text-center">
            <label>Tipo de Periodo</label>
            <asp:DropDownList runat="server" ID="ddlPeriodo" CssClass="form-control" AutoPostBack="true" OnSelectedIndexChanged="ddlPeriodo_SelectedIndexChanged">
                <asp:ListItem Text="Seleccione Uno" Value="" />
                <asp:ListItem Text="Mensual" Value="1" />
                <asp:ListItem Text="Trimestral" Value="2" />
                <asp:ListItem Text="Semestral" Value="3" />
                <asp:ListItem Text="Anual" Value="4" />
            </asp:DropDownList>
        </div>
    </div>
    <br />

    <div class="row" style="overflow: auto;">
        <div class="box-body">
            <div class="dataTables_wrapper form-inline dt-bootstrap">
                

                <asp:PlaceHolder runat="server" ID="phMensual" Visible="false">
                    <asp:GridView ID="GridView1"
                        class="table table-bordered table-hover dataTable"
                        runat="server">
                    </asp:GridView>
                </asp:PlaceHolder>

                <asp:PlaceHolder runat="server" ID="phSemestral" Visible="false">
                    <asp:GridView ID="GridView2"
                        class="table table-bordered table-hover dataTable"
                        runat="server">
                    </asp:GridView>
                </asp:PlaceHolder>

                <asp:PlaceHolder runat="server" ID="phTrimestral" Visible="false">
                    <asp:GridView ID="GridView3"
                        class="table table-bordered table-hover dataTable"
                        runat="server">
                    </asp:GridView>
                </asp:PlaceHolder>

                <asp:PlaceHolder runat="server" ID="phAnual" Visible="false">
                    <asp:GridView ID="GridView4"
                        class="table table-bordered table-hover dataTable"
                        runat="server">
                    </asp:GridView>
                </asp:PlaceHolder>

                <script src="//ajax.googleapis.com/ajax/libs/jquery/1.8.0/jquery.min.js" type="text/javascript"></script>
                <script type="text/javascript" src="//www.google.com/jsapi"></script>


                <div class="row">
                    <div class="col-md-10 col-md-offset-1">
                        <asp:Literal ID="ltIF" runat="server"></asp:Literal>
                        <div id="chartIF"></div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-10 col-md-offset-1">
                        <asp:Literal ID="ltIS" runat="server"></asp:Literal>
                        <div id="chartIS"></div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-10 col-md-offset-1">
                        <asp:Literal ID="ltIDP" runat="server"></asp:Literal>
                        <div id="chartIDP"></div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-10 col-md-offset-1">
                        <asp:Literal ID="ltILI" runat="server"></asp:Literal>
                        <div id="chartILI"></div>
                    </div>
                </div>

            </div>
        </div>
    </div>
    <br />

</asp:Content>
