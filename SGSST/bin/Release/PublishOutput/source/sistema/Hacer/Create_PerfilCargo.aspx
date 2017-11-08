<%@ Page Title="" Language="C#" MasterPageFile="~/source/MasterPages/Menu.Master" AutoEventWireup="true" CodeBehind="Create_PerfilCargo.aspx.cs" Inherits="SGSSTC.source.sistema.Hacer.Create_PerfilCargo" %>

<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>
<%@ Register Assembly="CKEditor.NET" Namespace="CKEditor.NET" TagPrefix="CKEditor" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server"></asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:UpdatePanel ID="updatePanelPrinicpal" runat="server">
        <ContentTemplate>

            <ol class="breadcrumb">
                <li><a href="#">Fase: Hacer</a></li>
                <li><a href="index_PerfilCargo.aspx">index Perfil de Cargo</a></li>
                <li><a href="#">Crear Perfil de Cargo</a></li>
            </ol>

            <div class="page-header">
                <h1 class="text-center">Crear Perfil de Cargo</h1>
            </div>


            <asp:PlaceHolder ID="phAlerta" runat="server" Visible="false">
                <div id="divAlerta" runat="server">
                    <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                    <asp:Label ID="lbAlerta" runat="server" Text="Label"></asp:Label>
                </div>
            </asp:PlaceHolder>

            <div class="row">

                <div class="col-md-5 col-md-offset-1">
                    <h4>Nombre del Cargo</h4>
                    <asp:TextBox ID="txtNombre" MaxLength="50" runat="server" ClientIDMode="Static" CssClass="form-control"></asp:TextBox>
                </div>

                <div class="col-md-5">
                    <h4>Codigo CNO Asociado</h4>
                    <asp:DropDownList runat="server" ID="ddlCargo" CssClass="form-control" data-toggle="tooltip"
                        data-placement="bottom" title="Seleccione el cargo del trabajador(a)">
                    </asp:DropDownList>
                </div>

                <div class="col-md-10 col-md-offset-1">
                    <h4>Descripción</h4>
                    <CKEditor:CKEditorControl ID="txtDescripcion" BasePath="/ckeditor/" runat="server">
                        <table class=MsoNormalTable border=0 cellspacing=0 cellpadding=0 width=765 style='width:574.0pt;margin-left:.1pt;border-collapse:collapse'>
                            <tr style='height:19.5pt'>
                                <td width=765 style='width:574.0pt;border:solid windowtext 1.0pt;border-right: solid black 1.0pt;background:#DCE6F1;padding:0cm 3.5pt 0cm 3.5pt;height:19.5pt'>
                                    <p class=MsoNormal style='margin-bottom:0cm;margin-bottom:.0001pt;line-height:normal'>
                                        <b>
                                            <span style='font-family:"Arial",sans-serif'>DESCRIPCIÓN DEL CARGO</span>

                                        </b>

                                    </p>
                                </td>
                                <td style='height:19.5pt;border:none' width=0 height=26></td>

                            </tr>
                            <tr style='height:22.5pt'>
                                <td width=765 valign=top style='width:574.0pt;border-top:none;border-left: solid windowtext 1.0pt;border-bottom:solid windowtext 1.0pt;border-right: solid black 1.0pt;padding:0cm 3.5pt 0cm 3.5pt;height:22.5pt'>
                                    <p class=MsoNormal style='margin-bottom:0cm;margin-bottom:.0001pt;line-height: normal'>
                                        <b>
                                            <span style='font-family:"Arial",sans-serif;color:black'>Nombre del cargo:</span>

                                        </b>
                                        <span style='font-family:"Arial",sans-serif;color:black'>

                                        </span>

                                    </p>

                                </td>
                                <td style='height:22.5pt;border:none' width=0 height=30></td>

                            </tr>
                            <tr style='height:22.5pt'>
                                <td width=765 valign=top style='width:574.0pt;border-top:none;border-left:solid windowtext 1.0pt;border-bottom:solid windowtext 1.0pt;border-right: solid black 1.0pt;padding:0cm 3.5pt 0cm 3.5pt;height:22.5pt'>
                                    <p class=MsoNormal style='margin-bottom:0cm;margin-bottom:.0001pt;line-height: normal'>
                                        <b><span style='font-family:"Arial",sans-serif;color:black'>Nivel:</span></b></p>

                                </td>
                                <td style='height:22.5pt;border:none' width=0 height=30></td>

                            </tr>
                             <tr style='height:22.5pt'>
                              <td width=765 valign=top style='width:574.0pt;border-top:none;border-left:
                              solid windowtext 1.0pt;border-bottom:solid windowtext 1.0pt;border-right:
                              solid black 1.0pt;padding:0cm 3.5pt 0cm 3.5pt;height:22.5pt'>
                              <p class=MsoNormal style='margin-bottom:0cm;margin-bottom:.0001pt;line-height:
                              normal'><b><span style='font-family:"Arial",sans-serif;color:black'>Supervisor
                              inmediato:</span></b></p>
                              </td>
                              <td style='height:22.5pt;border:none' width=0 height=30></td>
                             </tr>
                             <tr style='height:45.0pt'>
                              <td width=765 valign=top style='width:574.0pt;border-top:none;border-left:
                              solid windowtext 1.0pt;border-bottom:solid windowtext 1.0pt;border-right:
                              solid black 1.0pt;padding:0cm 3.5pt 0cm 3.5pt;height:45.0pt'>
                              <p class=MsoNormal style='margin-bottom:0cm;margin-bottom:.0001pt;line-height:
                              normal'><b><span style='font-family:"Arial",sans-serif;color:black'>Cargos
                              bajo su responsabilidad:</span></b></p>
                              </td>
                              <td style='height:45.0pt;border:none' width=0 height=60></td>
                             </tr>
                             <tr style='height:15.0pt'>
                              <td width=765 rowspan=11 valign=top style='width:574.0pt;border-top:none;
                              border-left:solid windowtext 1.0pt;border-bottom:solid black 1.0pt;
                              border-right:solid black 1.0pt;padding:0cm 3.5pt 0cm 3.5pt;height:15.0pt'>
                              <p class=MsoNormal style='margin-bottom:0cm;margin-bottom:.0001pt;line-height:
                              normal'><b><span style='font-family:"Arial",sans-serif;color:black'>Funciones
                              y Responsabilidades:<br>
                               </span></b><b><span style='font-size:12.0pt;font-family:"Arial",sans-serif;
                              color:black'>•<br>
                               • <br>
                               •<br>
                               •<br>
                               •<br>
                               •<br>
                               •<br>
                               •<br>
                               • <br>
                               •<br>
                               •<br>
                               •<br>
                               •<br>
                               •</span></b></p>
                              </td>
                              <td style='height:15.0pt;border:none' width=0 height=20></td>
                             </tr>
                             <tr style='height:15.0pt'>
                                 <td style='height:15.0pt;border:none' width=0 height=20>

                                 </td>

                             </tr>
                             <tr style='height:15.0pt'>
                              <td style='height:15.0pt;border:none' width=0 height=20></td>
                             </tr>
                             <tr style='height:43.5pt'>
                              <td style='height:43.5pt;border:none' width=0 height=58></td>
                             </tr>
                             <tr style='height:43.5pt'>
                              <td style='height:43.5pt;border:none' width=0 height=58></td>
                             </tr>
                             <tr style='height:40.5pt'>
                              <td style='height:40.5pt;border:none' width=0 height=54></td>
                             </tr>
                             <tr style='height:15.0pt'>
                              <td style='height:15.0pt;border:none' width=0 height=20></td>
                             </tr>
                             <tr style='height:15.0pt'>
                              <td style='height:15.0pt;border:none' width=0 height=20></td>
                             </tr>
                             <tr style='height:15.0pt'>
                              <td style='height:15.0pt;border:none' width=0 height=20></td>
                             </tr>
                             <tr style='height:32.25pt'>
                              <td style='height:32.25pt;border:none' width=0 height=43></td>
                             </tr>
                             <tr style='height:14.25pt'>
                              <td style='height:14.25pt;border:none' width=0 height=19></td>
                             </tr>
                             <tr style='height:15.0pt'>
                              <td width=765 style='width:574.0pt;border-top:none;border-left:solid windowtext 1.0pt;
                              border-bottom:solid windowtext 1.0pt;border-right:solid black 1.0pt;
                              background:#DCE6F1;padding:0cm 3.5pt 0cm 3.5pt;height:15.0pt'>
                              <p class=MsoNormal style='margin-bottom:0cm;margin-bottom:.0001pt;line-height:
                              normal'><b><span style='font-family:"Arial",sans-serif'>REQUISITOS
                              INTELECTUALES</span></b></p>
                              </td>
                              <td style='height:15.0pt;border:none' width=0 height=20></td>
                             </tr>
                             <tr style='height:52.5pt'>
                              <td width=765 valign=top style='width:574.0pt;border-top:none;border-left:
                              solid windowtext 1.0pt;border-bottom:solid windowtext 1.0pt;border-right:
                              solid black 1.0pt;padding:0cm 3.5pt 0cm 3.5pt;height:52.5pt'>
                              <p class=MsoNormal style='margin-bottom:0cm;margin-bottom:.0001pt;line-height:
                              normal'><b><span style='font-family:"Arial",sans-serif;color:black'>Grado de
                              instrucción:</span></b></p>
                              </td>
                              <td style='height:52.5pt;border:none' width=0 height=70></td>
                             </tr>
                             <tr style='height:15.75pt'>
                              <td width=765 valign=top style='width:574.0pt;border-top:none;border-left:
                              solid windowtext 1.0pt;border-bottom:solid windowtext 1.0pt;border-right:
                              solid black 1.0pt;padding:0cm 3.5pt 0cm 3.5pt;height:15.75pt'>
                              <p class=MsoNormal style='margin-bottom:0cm;margin-bottom:.0001pt;line-height:
                              normal'><b><span style='font-family:"Arial",sans-serif;color:black'>Experiencia:</span></b></p>
                              </td>
                              <td style='height:15.75pt;border:none' width=0 height=21></td>
                             </tr>
                             <tr style='height:25.5pt'>
                              <td width=765 valign=top style='width:574.0pt;border-top:none;border-left:
                              solid windowtext 1.0pt;border-bottom:solid windowtext 1.0pt;border-right:
                              solid black 1.0pt;padding:0cm 3.5pt 0cm 3.5pt;height:25.5pt'>
                              <p class=MsoNormal style='margin-bottom:0cm;margin-bottom:.0001pt;line-height:
                              normal'><b><span style='font-family:"Arial",sans-serif;color:black'>Formación
                              o Capacitación:</span></b></p>
                              </td>
                              <td style='height:25.5pt;border:none' width=0 height=34></td>
                             </tr>
                             <tr style='height:15.0pt'>
                              <td width=765 valign=top style='width:574.0pt;border-top:none;border-left:
                              solid windowtext 1.0pt;border-bottom:solid windowtext 1.0pt;border-right:
                              solid black 1.0pt;padding:0cm 3.5pt 0cm 3.5pt;height:15.0pt'>
                              <p class=MsoNormal style='margin-bottom:0cm;margin-bottom:.0001pt;line-height:
                              normal'><b><span style='font-family:"Arial",sans-serif;color:black'>Habilidades
                              y destrezas: <br>
                               </span></b><b><span style='font-size:12.0pt;font-family:"Arial",sans-serif;
                              color:black'>•<br>
                               • <br>
                               •<br>
                               •<br>
                               •<br>
                               •<br>
                               •</span></b></p>
                              </td>
                              <td style='height:15.0pt;border:none' width=0 height=20></td>
                             </tr>
                             <tr style='height:15.0pt'>
                              <td width=765 style='width:574.0pt;border-top:none;border-left:solid windowtext 1.0pt;
                              border-bottom:solid windowtext 1.0pt;border-right:solid black 1.0pt;
                              background:#DCE6F1;padding:0cm 3.5pt 0cm 3.5pt;height:15.0pt'>
                              <p class=MsoNormal style='margin-bottom:0cm;margin-bottom:.0001pt;line-height:
                              normal'><b><span style='font-family:"Arial",sans-serif'>REQUISITOS FÍSICOS</span></b></p>
                              </td>
                              <td style='height:15.0pt;border:none' width=0 height=20></td>
                             </tr>
                             <tr style='height:15.0pt'>
                              <td width=765 valign=top style='width:574.0pt;border-top:none;border-left:
                              solid windowtext 1.0pt;border-bottom:solid windowtext 1.0pt;border-right:
                              solid black 1.0pt;padding:0cm 3.5pt 0cm 3.5pt;height:15.0pt'>
                              <p class=MsoNormal style='margin-bottom:0cm;margin-bottom:.0001pt;line-height:
                              normal'><b><span style='font-family:"Arial",sans-serif;color:black'>Constitución
                              física necesaria:</span></b></p>
                              </td>
                              <td style='height:15.0pt;border:none' width=0 height=20></td>
                             </tr>
                             <tr style='height:15.0pt'>
                              <td width=765 valign=top style='width:574.0pt;border-top:none;border-left:
                              solid windowtext 1.0pt;border-bottom:solid windowtext 1.0pt;border-right:
                              solid black 1.0pt;padding:0cm 3.5pt 0cm 3.5pt;height:15.0pt'>
                              <p class=MsoNormal style='margin-bottom:0cm;margin-bottom:.0001pt;line-height:
                              normal'><b><span style='font-family:"Arial",sans-serif;color:black'>Estatura:</span></b></p>
                              </td>
                              <td style='height:15.0pt;border:none' width=0 height=20></td>
                             </tr>
                             <tr style='height:15.0pt'>
                              <td width=765 valign=top style='width:574.0pt;border-top:none;border-left:
                              solid windowtext 1.0pt;border-bottom:solid windowtext 1.0pt;border-right:
                              solid black 1.0pt;padding:0cm 3.5pt 0cm 3.5pt;height:15.0pt'>
                              <p class=MsoNormal style='margin-bottom:0cm;margin-bottom:.0001pt;line-height:
                              normal'><b><span style='font-family:"Arial",sans-serif;color:black'>Sexo:</span></b></p>
                              </td>
                              <td style='height:15.0pt;border:none' width=0 height=20></td>
                             </tr>
                             <tr style='height:15.0pt'>
                              <td width=765 style='width:574.0pt;border-top:none;border-left:solid windowtext 1.0pt;
                              border-bottom:solid windowtext 1.0pt;border-right:solid black 1.0pt;
                              background:#DCE6F1;padding:0cm 3.5pt 0cm 3.5pt;height:15.0pt'>
                              <p class=MsoNormal style='margin-bottom:0cm;margin-bottom:.0001pt;line-height:
                              normal'><b><span style='font-family:"Arial",sans-serif'>RESPONSABILIDADES EN
                              SEGURIDAD Y SALUD EN EL TRABAJO</span></b></p>
                              </td>
                              <td style='height:15.0pt;border:none' width=0 height=20></td>
                             </tr>
                             <tr style='height:15.0pt'>
                              <td width=765 rowspan=4 valign=top style='width:574.0pt;border-top:none;
                              border-left:solid windowtext 1.0pt;border-bottom:solid black 1.0pt;
                              border-right:solid black 1.0pt;padding:0cm 3.5pt 0cm 3.5pt;height:15.0pt'>
                              <p class=MsoNormal style='margin-bottom:0cm;margin-bottom:.0001pt;line-height:
                              normal'>
                                  <span style='font-size:12.0pt;font-family:"Arial",sans-serif;color:black'>
                                  <b>
                                      •<br>
                                      •<br>
                                      •<br>
                                      •<br>
                                      •</b>
                                  </span>
                              </p>
                              </td>
                              <td style='height:15.0pt;border:none' width=0 height=20></td>
                             </tr>
                             <tr style='height:15.0pt'>
                              <td style='height:15.0pt;border:none' width=0 height=20></td>
                             </tr>
                             <tr style='height:15.0pt'>
                              <td style='height:15.0pt;border:none' width=0 height=20></td>
                             </tr>
                             <tr style='height:15.75pt'>
                              <td style='height:15.75pt;border:none' width=0 height=21></td>
                             </tr>
                            </table>
                    </CKEditor:CKEditorControl>
                </div>

            </div>

            <br />
            <hr />

            <div class="row text-center">

                <div class="col-md-4 col-md-offset-2">
                    <asp:ImageButton alt="-" ID="btnSave" runat="server" ImageUrl="~\ico\agregar.png"
                        OnClick="btnSave_Click" />
                    <h4>Guardar</h4>
                </div>

                <div class="col-md-4">
                    <asp:ImageButton alt="-" ID="btnPrint" runat="server" ImageUrl="~\ico\print.png"
                        OnClick="GenerarDocumento" />
                    <h4>Generar Documento</h4>
                </div>

            </div>

        </ContentTemplate>
        <Triggers>
            <asp:PostBackTrigger ControlID="btnPrint" />
        </Triggers>
    </asp:UpdatePanel>
</asp:Content>
