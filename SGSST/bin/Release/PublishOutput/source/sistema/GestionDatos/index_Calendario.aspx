<%@ Page Language="C#" MasterPageFile="~/source/MasterPages/Menu.Master" AutoEventWireup="true" CodeBehind="index_Calendario.aspx.cs" Inherits="SGSSTC.source.sistema.GestionDatos.index_Calendario" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, 
    PublicKeyToken=31bf3856ad364e35"
    Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server"></asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">


    <asp:UpdatePanel ID="updatePanelPrinicpal" runat="server">
        <ContentTemplate>


            <ol class="breadcrumb">
                <li><a href="#">Gestión de Datos</a></li>
                <li><a href="#">Calendario</a></li>
            </ol>

            <div class="page-header">
                <h1 class="text-center">Calendario de Alarmas</h1>
            </div>

            <!-- calendario-->
            <div class="row">
                <div class="col-md-4">
                    <div class="box">

                        <div class="box-header label-primary">
                            <h3 class="box-title">Alarmas del Dia</h3>
                        </div>

                        <div class="box-body table-responsive no-padding">
                            <table class="table table-hover">
                                <tbody>
                                    <tr>
                                        <th>Alarma</th>
                                        <th>Fecha</th>
                                        <th>Prioridad</th>
                                    </tr>
                                    <asp:Panel runat="server" ID="pAlarmas"></asp:Panel>

                                </tbody>
                            </table>
                        </div>

                    </div>
                </div>

                <div class="col-md-8">
                    <asp:Calendar ID="PrettyCalendar"
                        class="table table-bordered table-hover dataTable"
                        FirstDayOfWeek="Monday"
                        runat="server"
                        OnDayRender="PrettyCalendar_OnDayRender">
                        <TodayDayStyle BackColor="#5ac594"></TodayDayStyle>

                        <DayStyle Font-Bold="True" HorizontalAlign="Left" Height="90px" BorderWidth="1px"
                            BorderStyle="Solid" BorderColor="Black" Width="200px" VerticalAlign="Top"></DayStyle>

                        <NextPrevStyle ForeColor="Black" />

                        <DayHeaderStyle Font-Size="Large" Font-Bold="True" BorderWidth="1px" ForeColor="Black"
                            BorderStyle="Solid" BorderColor="Black" Width="100px" BackColor="#00c0ef"></DayHeaderStyle>

                        <TitleStyle Font-Size="Large" Font-Bold="True" BorderWidth="1px" BorderStyle="Solid"
                            BorderColor="Black" BackColor="#3c8dbc"></TitleStyle>

                        <WeekendDayStyle BackColor="#d2d6de"></WeekendDayStyle>

                    </asp:Calendar>
                </div>
            </div>


            <script src="../../../resources/plugins/jQuery/jQuery-2.1.4.min.js"></script>
            <script src="https://code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>
            <script src="../../../resources/bootstrap/js/bootstrap.min.js"></script>

        </ContentTemplate>
    </asp:UpdatePanel>




</asp:Content>
