<%@ Page Language="C#" MasterPageFile="~/source/MasterPages/Menu.Master" AutoEventWireup="true" CodeBehind="Update_AsistenciaCapacitacion.aspx.cs" Inherits="SGSSTC.source.sistema.Hacer.Update_AsistenciaCapacitacion" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server"></asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <asp:UpdatePanel ID="MyUpdatePanel" runat="server">
        <ContentTemplate>

            <ol class="breadcrumb">
                <li><a href="#">Fase: Hacer</a></li>
                <li><a href="../Hacer/index_GestionLaboral.aspx">Gestión Laboral</a></li>
                <li><a href="#">Editar Asistencia Capacitaciones</a></li>
            </ol>

            <div class="page-header">
                <h1 class="text-center">Asistencia Capacitaciones</h1>
            </div>

            <asp:PlaceHolder ID="phAlerta" runat="server" Visible="false">
                <div id="divAlerta" runat="server">
                    <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                    <asp:Label ID="lbAlerta" runat="server" Text="Label"></asp:Label>
                </div>
            </asp:PlaceHolder>

            <div class="row col-md-offset-2">
                <div class="col-md-4">
                    <label>Trabajador:</label><br />
                    <asp:BulletedList ID="chkAsistencia" runat="server"></asp:BulletedList>
                </div>
                <div class="col-md-4">
                    <label>Asistencia:</label><br />
                    <asp:Panel ID="panelAsistencia" runat="server"></asp:Panel>
                </div>
            </div>

            <br />

            <hr />

            <!-- Boton-->
            <div class="row">
                <div class="col-md-2 col-md-offset-5">
                    <asp:Button runat="server" ID="btPrintSave" Text="Guardar"
                        class="btn btn-block btn-info" OnClick="btPrintSave_Click"></asp:Button>
                </div>
            </div>

        </ContentTemplate>
        <Triggers>
        </Triggers>
    </asp:UpdatePanel>

</asp:Content>
