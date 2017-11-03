<%@ Page Title="" Language="C#" MasterPageFile="~/source/MasterPages/Menu.Master" AutoEventWireup="true" CodeBehind="ComiteConvivencia.aspx.cs" Inherits="SGSST.source.sistema.Planear.ComiteConvivencia" %>

<%@ Register Assembly="CKEditor.NET" Namespace="CKEditor.NET" TagPrefix="CKEditor" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server"></asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        
    <ol class="breadcrumb">
        <li><a href="#">Fase: Planear</a></li>
        <li><a href="#">Manual de Convivencia</a></li>
    </ol>
    
    <div class="page-header">
        <h1 class="text-center">Manual de Convivencia</h1>
    </div>
    
    <div class="row form-group">
        <asp:PlaceHolder runat="server" ID="phEmpresa">
            <div class="col-md-4">
                <h4 class="text-center">Empresa</h4>
                <asp:DropDownList runat="server" ID="ddlEmpresa" data-toggle="tooltip" data-placement="bottom" title="Seleccione una Empresa" class="form-control" AutoPostBack="true"
                    OnSelectedIndexChanged="ddlEmpresa_SelectedIndexChanged">
                </asp:DropDownList>

            </div>
        </asp:PlaceHolder>

        <asp:PlaceHolder runat="server" ID="phSucursal">
            <div class="col-md-4 col-md-offset-4">
                <h4 class="text-center">Sucursal</h4>
                <asp:DropDownList runat="server" ID="ddlSucursal" data-toggle="tooltip" data-placement="bottom" title="Seleccione una Sucursal" class="form-control"></asp:DropDownList>

                <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" SetFocusOnError="true" Display="Dynamic"
                    ForeColor="#B50128" Font-Size="10" Font-Bold="true" ControlToValidate="ddlSucursal" runat="server"
                    ValidationGroup="ValidationAdd" />
            </div>
        </asp:PlaceHolder>
    </div>
    
    <div class="row text-center">
        <CKEditor:CKEditorControl ID="txtValProvCont" BasePath="/ckeditor/" runat="server" Height="500px"> 

<div class=WordSection1>

<p class=MsoNormal align=center style='mso-margin-top-alt:auto;text-align:center'><b
style='mso-bidi-font-weight:normal'><span lang=ES-TRAD style='font-family:"Arial",sans-serif;
mso-ansi-language:ES-TRAD'><o:p>&nbsp;</o:p></span></b></p>

<p class=MsoNormal align=center style='mso-margin-top-alt:auto;text-align:center'><b
style='mso-bidi-font-weight:normal'><span lang=ES-TRAD style='font-size:12.0pt;
font-family:"Arial",sans-serif;mso-ansi-language:ES-TRAD'>Acta de Constitución
del Comité de Convivencia Laboral<o:p></o:p></span></b></p>

<p class=MsoNormal style='mso-margin-top-alt:auto;text-align:justify'><span
lang=ES style='font-size:12.0pt;font-family:"Arial",sans-serif'>El día __ del
mes de ________ 2017 en las instalaciones de la Empresa se reunió el
Representante Legal y los trabajadores de la Organización para conformar el
Comité de Convivencia Laboral, el cual tendrá un período de vigencia de dos (2)
años, el mismo se reunirá cada 3 meses y sesionará con la mitad más uno de sus
integrantes y extraordinariamente cuando se presenten casos que requieran de su
inmediata intervención, el Comité tendrá como funciones las descritas a
continuación:<o:p></o:p></span></p>

<p class=MsoListParagraphCxSpFirst style='mso-margin-top-alt:auto;mso-add-space:
auto;text-align:justify;text-indent:-18.0pt;mso-list:l1 level1 lfo3'><![if !supportLists]><span
lang=ES style='font-size:12.0pt;font-family:"Arial",sans-serif;mso-fareast-font-family:
Arial'><span style='mso-list:Ignore'>1.<span style='font:7.0pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;
</span></span></span><![endif]><span lang=ES style='font-size:12.0pt;
font-family:"Arial",sans-serif'>Recibir y dar trámite a las quejas presentadas
en las que se describan situaciones que puedan constituir acoso laboral, así
como las pruebas que las soportan.<o:p></o:p></span></p>

<p class=MsoListParagraphCxSpMiddle style='mso-margin-top-alt:auto;mso-add-space:
auto;text-align:justify;text-indent:-18.0pt;mso-list:l1 level1 lfo3'><![if !supportLists]><span
lang=ES style='font-size:12.0pt;font-family:"Arial",sans-serif;mso-fareast-font-family:
Arial'><span style='mso-list:Ignore'>2.<span style='font:7.0pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;
</span></span></span><![endif]><span lang=ES style='font-size:12.0pt;
font-family:"Arial",sans-serif'>Examinar de manera confidencial los casos
específicos o puntuales en los que se formule queja o reclamo, que pudieran
tipificar conductas o circunstancias de acoso laboral, al interior de la
entidad pública o empresa privada.<o:p></o:p></span></p>

<p class=MsoListParagraphCxSpMiddle style='mso-margin-top-alt:auto;mso-add-space:
auto;text-align:justify;text-indent:-18.0pt;mso-list:l1 level1 lfo3'><![if !supportLists]><span
lang=ES style='font-size:12.0pt;font-family:"Arial",sans-serif;mso-fareast-font-family:
Arial'><span style='mso-list:Ignore'>3.<span style='font:7.0pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;
</span></span></span><![endif]><span lang=ES style='font-size:12.0pt;
font-family:"Arial",sans-serif'>Escuchar a las partes involucradas de manera
individual sobre los hechos que dieron lugar a la queja.<o:p></o:p></span></p>

<p class=MsoListParagraphCxSpMiddle style='mso-margin-top-alt:auto;mso-add-space:
auto;text-align:justify;text-indent:-18.0pt;mso-list:l1 level1 lfo3'><![if !supportLists]><span
lang=ES style='font-size:12.0pt;font-family:"Arial",sans-serif;mso-fareast-font-family:
Arial'><span style='mso-list:Ignore'>4.<span style='font:7.0pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;
</span></span></span><![endif]><span lang=ES style='font-size:12.0pt;
font-family:"Arial",sans-serif'>Adelantar reuniones con el fin de crear un
espacio de diálogo entre las partes involucradas, promoviendo compromisos
mutuos para llegar a una solución efectiva de las controversias.<o:p></o:p></span></p>

<p class=MsoListParagraphCxSpMiddle style='mso-margin-top-alt:auto;mso-add-space:
auto;text-align:justify;text-indent:-18.0pt;mso-list:l1 level1 lfo3'><![if !supportLists]><span
lang=ES style='font-size:12.0pt;font-family:"Arial",sans-serif;mso-fareast-font-family:
Arial'><span style='mso-list:Ignore'>5.<span style='font:7.0pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;
</span></span></span><![endif]><span lang=ES style='font-size:12.0pt;
font-family:"Arial",sans-serif'>Formular un plan de mejora concertado entre las
partes, para construir, renovar y promover la convivencia laboral, garantizando
en todos los casos el principio de la confidencialidad.<o:p></o:p></span></p>

<p class=MsoListParagraphCxSpMiddle style='mso-margin-top-alt:auto;mso-add-space:
auto;text-align:justify;text-indent:-18.0pt;mso-list:l1 level1 lfo3'><![if !supportLists]><span
lang=ES style='font-size:12.0pt;font-family:"Arial",sans-serif;mso-fareast-font-family:
Arial'><span style='mso-list:Ignore'>6.<span style='font:7.0pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;
</span></span></span><![endif]><span lang=ES style='font-size:12.0pt;
font-family:"Arial",sans-serif'>Hacer seguimiento a los compromisos adquiridos
por las partes involucradas en la queja, verificando su cumplimiento de acuerdo
con lo pactado.<o:p></o:p></span></p>

<p class=MsoListParagraphCxSpMiddle style='mso-margin-top-alt:auto;mso-add-space:
auto;text-align:justify;text-indent:-18.0pt;mso-list:l1 level1 lfo3'><![if !supportLists]><span
lang=ES style='font-size:12.0pt;font-family:"Arial",sans-serif;mso-fareast-font-family:
Arial'><span style='mso-list:Ignore'>7.<span style='font:7.0pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;
</span></span></span><![endif]><span lang=ES style='font-size:12.0pt;
font-family:"Arial",sans-serif'>En aquellos casos en que no se llegue a un
acuerdo entre las partes, no se cumplan las recomendaciones formuladas o la
conducta persista, el Comité informará a la alta dirección de la empresa,
cerrará el caso y el trabajador puede presentar la queja ante el inspector de
trabajo o demandar ante el juez competente.<o:p></o:p></span></p>

<p class=MsoListParagraphCxSpMiddle style='mso-margin-top-alt:auto;mso-add-space:
auto;text-align:justify;text-indent:-18.0pt;mso-list:l1 level1 lfo3'><![if !supportLists]><span
lang=ES style='font-size:12.0pt;font-family:"Arial",sans-serif;mso-fareast-font-family:
Arial'><span style='mso-list:Ignore'>8.<span style='font:7.0pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;
</span></span></span><![endif]><span lang=ES style='font-size:12.0pt;
font-family:"Arial",sans-serif'>Presentar a la alta dirección las
recomendaciones para el desarrollo efectivo de las medidas preventivas y
correctivas del acoso laboral, así como el informe anual de resultados de la
gestión del comité de convivencia laboral y los informes requeridos por los
organismos de control.<o:p></o:p></span></p>

<p class=MsoListParagraphCxSpMiddle style='mso-margin-top-alt:auto;mso-add-space:
auto;text-align:justify;text-indent:-18.0pt;mso-list:l1 level1 lfo3'><![if !supportLists]><span
lang=ES style='font-size:12.0pt;font-family:"Arial",sans-serif;mso-fareast-font-family:
Arial'><span style='mso-list:Ignore'>9.<span style='font:7.0pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;
</span></span></span><![endif]><span lang=ES style='font-size:12.0pt;
font-family:"Arial",sans-serif'>Hacer seguimiento al cumplimiento de las
recomendaciones dadas por el Comité de Convivencia a las dependencias de
gestión del recurso humano y salud ocupacional de las empresas e instituciones
públicas y privadas.<o:p></o:p></span></p>

<p class=MsoListParagraphCxSpMiddle style='mso-margin-top-alt:auto;mso-add-space:
auto;text-align:justify;text-indent:-18.0pt;mso-list:l1 level1 lfo3'><![if !supportLists]><span
lang=ES style='font-size:12.0pt;font-family:"Arial",sans-serif;mso-fareast-font-family:
Arial'><span style='mso-list:Ignore'>10.<span style='font:7.0pt "Times New Roman"'>
</span></span></span><![endif]><span lang=ES style='font-size:12.0pt;
font-family:"Arial",sans-serif'>Elaborar informes trimestrales sobre la gestión
del Comité que incluya estadísticas de las quejas, seguimiento de los casos y
recomendaciones, los cuales serán presentados a la alta dirección de la entidad
pública o empresa privada<o:p></o:p></span></p>

<p class=MsoListParagraphCxSpLast style='mso-margin-top-alt:auto;mso-add-space:
auto;text-align:justify'><span lang=ES style='font-size:12.0pt;font-family:
"Arial",sans-serif'><o:p>&nbsp;</o:p></span></p>

<p class=MsoNormal style='mso-margin-top-alt:auto;text-align:justify'><span
lang=ES style='font-size:12.0pt;font-family:"Arial",sans-serif'>Por parte de la
Empresa fueron seleccionados para conformar el comité los siguientes
trabajadores:<o:p></o:p></span></p>

<p class=MsoNormal style='mso-margin-top-alt:auto;text-align:justify'><span
lang=ES style='font-size:12.0pt;font-family:"Arial",sans-serif;color:black;
mso-themecolor:text1'><o:p>&nbsp;</o:p></span></p>

    <br /><br />

<table class=MsoTableGrid border=1 cellspacing=0 cellpadding=0 width="100%"
 style='width:100.0%;border-collapse:collapse;border:none;mso-border-alt:solid windowtext .5pt;
 mso-yfti-tbllook:1184;mso-padding-alt:0cm 5.4pt 0cm 5.4pt'>
 <tr style='mso-yfti-irow:0;mso-yfti-firstrow:yes'>
  <td width="5%" valign=top style='width:5.26%;border:solid windowtext 1.0pt;
  mso-border-alt:solid windowtext .5pt;padding:0cm 5.4pt 0cm 5.4pt'>
  <p class=MsoNormal align=center style='mso-margin-top-alt:auto;text-align:
  center'><b style='mso-bidi-font-weight:normal'><span lang=ES
  style='font-size:12.0pt;font-family:"Arial",sans-serif;color:black;
  mso-themecolor:text1'>Nº<o:p></o:p></span></b></p>
  </td>
  <td width="33%" valign=top style='width:33.98%;border:solid windowtext 1.0pt;
  border-left:none;mso-border-left-alt:solid windowtext .5pt;mso-border-alt:
  solid windowtext .5pt;padding:0cm 5.4pt 0cm 5.4pt'>
  <p class=MsoNormal align=center style='mso-margin-top-alt:auto;text-align:
  center'><b style='mso-bidi-font-weight:normal'><span lang=ES
  style='font-size:12.0pt;font-family:"Arial",sans-serif;color:black;
  mso-themecolor:text1'>Nombre<o:p></o:p></span></b></p>
  </td>
  <td width="30%" valign=top style='width:30.38%;border:solid windowtext 1.0pt;
  border-left:none;mso-border-left-alt:solid windowtext .5pt;mso-border-alt:
  solid windowtext .5pt;padding:0cm 5.4pt 0cm 5.4pt'>
  <p class=MsoNormal align=center style='mso-margin-top-alt:auto;text-align:
  center'><b style='mso-bidi-font-weight:normal'><span lang=ES
  style='font-size:12.0pt;font-family:"Arial",sans-serif;color:black;
  mso-themecolor:text1'>Cargo <o:p></o:p></span></b></p>
  </td>
  <td width="30%" valign=top style='width:30.38%;border:solid windowtext 1.0pt;
  border-left:none;mso-border-left-alt:solid windowtext .5pt;mso-border-alt:
  solid windowtext .5pt;padding:0cm 5.4pt 0cm 5.4pt'>
  <p class=MsoNormal align=center style='mso-margin-top-alt:auto;text-align:
  center'><b style='mso-bidi-font-weight:normal'><span lang=ES
  style='font-size:12.0pt;font-family:"Arial",sans-serif;color:black;
  mso-themecolor:text1'>Cargo en el Comité<o:p></o:p></span></b></p>
  </td>
 </tr>
 <tr style='mso-yfti-irow:1'>
  <td width="5%" valign=top style='width:5.26%;border:solid windowtext 1.0pt;
  border-top:none;mso-border-top-alt:solid windowtext .5pt;mso-border-alt:solid windowtext .5pt;
  padding:0cm 5.4pt 0cm 5.4pt'>
  <p class=MsoNormal align=center style='mso-margin-top-alt:auto;text-align:
  center'><span lang=ES style='font-size:12.0pt;font-family:"Arial",sans-serif;
  color:black;mso-themecolor:text1'>1<o:p></o:p></span></p>
  </td>
  <td width="33%" valign=top style='width:33.98%;border-top:none;border-left:
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
  mso-border-alt:solid windowtext .5pt;padding:0cm 5.4pt 0cm 5.4pt'>
  <p class=MsoNormal style='mso-margin-top-alt:auto;text-align:justify'><span
  lang=ES style='font-size:12.0pt;font-family:"Arial",sans-serif;color:#0070C0'><o:p>&nbsp;</o:p></span></p>
  </td>
  <td width="30%" valign=top style='width:30.38%;border-top:none;border-left:
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
  mso-border-alt:solid windowtext .5pt;padding:0cm 5.4pt 0cm 5.4pt'>
  <p class=MsoNormal align=center style='mso-margin-top-alt:auto;text-align:
  center'><span lang=ES style='font-size:12.0pt;font-family:"Arial",sans-serif;
  color:black;mso-themecolor:text1'><o:p>&nbsp;</o:p></span></p>
  </td>
  <td width="30%" valign=top style='width:30.38%;border-top:none;border-left:
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
  mso-border-alt:solid windowtext .5pt;padding:0cm 5.4pt 0cm 5.4pt'>
  <p class=MsoNormal align=center style='mso-margin-top-alt:auto;text-align:
  center'><span lang=ES style='font-size:12.0pt;font-family:"Arial",sans-serif;
  color:black;mso-themecolor:text1'>Principal<o:p></o:p></span></p>
  </td>
 </tr>
 <tr style='mso-yfti-irow:2'>
  <td width="5%" valign=top style='width:5.26%;border:solid windowtext 1.0pt;
  border-top:none;mso-border-top-alt:solid windowtext .5pt;mso-border-alt:solid windowtext .5pt;
  padding:0cm 5.4pt 0cm 5.4pt'>
  <p class=MsoNormal align=center style='mso-margin-top-alt:auto;text-align:
  center'><span lang=ES style='font-size:12.0pt;font-family:"Arial",sans-serif;
  color:black;mso-themecolor:text1'>2<o:p></o:p></span></p>
  </td>
  <td width="33%" valign=top style='width:33.98%;border-top:none;border-left:
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
  mso-border-alt:solid windowtext .5pt;padding:0cm 5.4pt 0cm 5.4pt'>
  <p class=MsoNormal style='mso-margin-top-alt:auto;text-align:justify'><span
  lang=ES style='font-size:12.0pt;font-family:"Arial",sans-serif;color:#0070C0'><o:p>&nbsp;</o:p></span></p>
  </td>
  <td width="30%" valign=top style='width:30.38%;border-top:none;border-left:
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
  mso-border-alt:solid windowtext .5pt;padding:0cm 5.4pt 0cm 5.4pt'>
  <p class=MsoNormal style='mso-margin-top-alt:auto;text-align:justify'><span
  lang=ES style='font-size:12.0pt;font-family:"Arial",sans-serif;color:#0070C0'><o:p>&nbsp;</o:p></span></p>
  </td>
  <td width="30%" valign=top style='width:30.38%;border-top:none;border-left:
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
  mso-border-alt:solid windowtext .5pt;padding:0cm 5.4pt 0cm 5.4pt'>
  <p class=MsoNormal align=center style='mso-margin-top-alt:auto;text-align:
  center'><span lang=ES style='font-size:12.0pt;font-family:"Arial",sans-serif;
  color:black;mso-themecolor:text1'>Principal</span><span lang=ES
  style='font-size:12.0pt;font-family:"Arial",sans-serif;color:#0070C0'><o:p></o:p></span></p>
  </td>
 </tr>
 <tr style='mso-yfti-irow:3'>
  <td width="5%" valign=top style='width:5.26%;border:solid windowtext 1.0pt;
  border-top:none;mso-border-top-alt:solid windowtext .5pt;mso-border-alt:solid windowtext .5pt;
  padding:0cm 5.4pt 0cm 5.4pt'>
  <p class=MsoNormal align=center style='mso-margin-top-alt:auto;text-align:
  center'><span lang=ES style='font-size:12.0pt;font-family:"Arial",sans-serif;
  color:black;mso-themecolor:text1'>3<o:p></o:p></span></p>
  </td>
  <td width="33%" valign=top style='width:33.98%;border-top:none;border-left:
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
  mso-border-alt:solid windowtext .5pt;padding:0cm 5.4pt 0cm 5.4pt'>
  <p class=MsoNormal style='mso-margin-top-alt:auto;text-align:justify'><span
  lang=ES style='font-size:12.0pt;font-family:"Arial",sans-serif;color:#0070C0'><o:p>&nbsp;</o:p></span></p>
  </td>
  <td width="30%" valign=top style='width:30.38%;border-top:none;border-left:
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
  mso-border-alt:solid windowtext .5pt;padding:0cm 5.4pt 0cm 5.4pt'>
  <p class=MsoNormal align=center style='mso-margin-top-alt:auto;text-align:
  center'><span lang=ES style='font-size:12.0pt;font-family:"Arial",sans-serif;
  color:black;mso-themecolor:text1'><o:p>&nbsp;</o:p></span></p>
  </td>
  <td width="30%" valign=top style='width:30.38%;border-top:none;border-left:
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
  mso-border-alt:solid windowtext .5pt;padding:0cm 5.4pt 0cm 5.4pt'>
  <p class=MsoNormal align=center style='mso-margin-top-alt:auto;text-align:
  center'><span lang=ES style='font-size:12.0pt;font-family:"Arial",sans-serif;
  color:black;mso-themecolor:text1'>Suplente<o:p></o:p></span></p>
  </td>
 </tr>
 <tr style='mso-yfti-irow:4;mso-yfti-lastrow:yes'>
  <td width="5%" valign=top style='width:5.26%;border:solid windowtext 1.0pt;
  border-top:none;mso-border-top-alt:solid windowtext .5pt;mso-border-alt:solid windowtext .5pt;
  padding:0cm 5.4pt 0cm 5.4pt'>
  <p class=MsoNormal align=center style='mso-margin-top-alt:auto;text-align:
  center'><span lang=ES style='font-size:12.0pt;font-family:"Arial",sans-serif;
  color:black;mso-themecolor:text1'>4<o:p></o:p></span></p>
  </td>
  <td width="33%" valign=top style='width:33.98%;border-top:none;border-left:
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
  mso-border-alt:solid windowtext .5pt;padding:0cm 5.4pt 0cm 5.4pt'>
  <p class=MsoNormal style='mso-margin-top-alt:auto;text-align:justify'><span
  lang=ES style='font-size:12.0pt;font-family:"Arial",sans-serif;color:#0070C0'><o:p>&nbsp;</o:p></span></p>
  </td>
  <td width="30%" valign=top style='width:30.38%;border-top:none;border-left:
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
  mso-border-alt:solid windowtext .5pt;padding:0cm 5.4pt 0cm 5.4pt'>
  <p class=MsoNormal style='mso-margin-top-alt:auto;text-align:justify'><span
  lang=ES style='font-size:12.0pt;font-family:"Arial",sans-serif;color:#0070C0'><o:p>&nbsp;</o:p></span></p>
  </td>
  <td width="30%" valign=top style='width:30.38%;border-top:none;border-left:
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
  mso-border-alt:solid windowtext .5pt;padding:0cm 5.4pt 0cm 5.4pt'>
  <p class=MsoNormal align=center style='mso-margin-top-alt:auto;text-align:
  center'><span lang=ES style='font-size:12.0pt;font-family:"Arial",sans-serif;
  color:black;mso-themecolor:text1'>Suplente</span><span lang=ES
  style='font-size:12.0pt;font-family:"Arial",sans-serif;color:#0070C0'><o:p></o:p></span></p>
  </td>
 </tr>
</table>

<p class=MsoNormal style='mso-margin-top-alt:auto;text-align:justify'><b
style='mso-bidi-font-weight:normal'><span lang=ES-TRAD style='font-size:12.0pt;
font-family:"Arial",sans-serif;mso-ansi-language:ES-TRAD'><o:p>&nbsp;</o:p></span></b></p>

<p class=MsoNormal style='mso-margin-top-alt:auto;text-align:justify'><span
lang=ES style='font-size:12.0pt;font-family:"Arial",sans-serif'>Por parte de
los Trabajadores y mediante elección fueron nombrados por votación para
conformar el comité los siguientes trabajadores:<o:p></o:p></span></p>

<p class=MsoNormal style='mso-margin-top-alt:auto;text-align:justify'><span
lang=ES style='font-size:12.0pt;font-family:"Arial",sans-serif;color:black;
mso-themecolor:text1'><o:p>&nbsp;</o:p></span></p>

<table class=MsoTableGrid border=1 cellspacing=0 cellpadding=0 width="100%"
 style='width:100.0%;border-collapse:collapse;border:none;mso-border-alt:solid windowtext .5pt;
 mso-yfti-tbllook:1184;mso-padding-alt:0cm 5.4pt 0cm 5.4pt'>
 <tr style='mso-yfti-irow:0;mso-yfti-firstrow:yes'>
  <td width="5%" valign=top style='width:5.26%;border:solid windowtext 1.0pt;
  mso-border-alt:solid windowtext .5pt;padding:0cm 5.4pt 0cm 5.4pt'>
  <p class=MsoNormal align=center style='mso-margin-top-alt:auto;text-align:
  center'><b style='mso-bidi-font-weight:normal'><span lang=ES
  style='font-size:12.0pt;font-family:"Arial",sans-serif;color:black;
  mso-themecolor:text1'>Nº<o:p></o:p></span></b></p>
  </td>
  <td width="33%" valign=top style='width:33.98%;border:solid windowtext 1.0pt;
  border-left:none;mso-border-left-alt:solid windowtext .5pt;mso-border-alt:
  solid windowtext .5pt;padding:0cm 5.4pt 0cm 5.4pt'>
  <p class=MsoNormal align=center style='mso-margin-top-alt:auto;text-align:
  center'><b style='mso-bidi-font-weight:normal'><span lang=ES
  style='font-size:12.0pt;font-family:"Arial",sans-serif;color:black;
  mso-themecolor:text1'>Nombre<o:p></o:p></span></b></p>
  </td>
  <td width="30%" valign=top style='width:30.38%;border:solid windowtext 1.0pt;
  border-left:none;mso-border-left-alt:solid windowtext .5pt;mso-border-alt:
  solid windowtext .5pt;padding:0cm 5.4pt 0cm 5.4pt'>
  <p class=MsoNormal align=center style='mso-margin-top-alt:auto;text-align:
  center'><b style='mso-bidi-font-weight:normal'><span lang=ES
  style='font-size:12.0pt;font-family:"Arial",sans-serif;color:black;
  mso-themecolor:text1'>Cargo<o:p></o:p></span></b></p>
  </td>
  <td width="30%" valign=top style='width:30.38%;border:solid windowtext 1.0pt;
  border-left:none;mso-border-left-alt:solid windowtext .5pt;mso-border-alt:
  solid windowtext .5pt;padding:0cm 5.4pt 0cm 5.4pt'>
  <p class=MsoNormal align=center style='mso-margin-top-alt:auto;text-align:
  center'><b style='mso-bidi-font-weight:normal'><span lang=ES
  style='font-size:12.0pt;font-family:"Arial",sans-serif;color:black;
  mso-themecolor:text1'>Cargo en el Comité<o:p></o:p></span></b></p>
  </td>
 </tr>
 <tr style='mso-yfti-irow:1'>
  <td width="5%" valign=top style='width:5.26%;border:solid windowtext 1.0pt;
  border-top:none;mso-border-top-alt:solid windowtext .5pt;mso-border-alt:solid windowtext .5pt;
  padding:0cm 5.4pt 0cm 5.4pt'>
  <p class=MsoNormal align=center style='mso-margin-top-alt:auto;text-align:
  center'><span lang=ES style='font-size:12.0pt;font-family:"Arial",sans-serif;
  color:black;mso-themecolor:text1'>1<o:p></o:p></span></p>
  </td>
  <td width="33%" valign=top style='width:33.98%;border-top:none;border-left:
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
  mso-border-alt:solid windowtext .5pt;padding:0cm 5.4pt 0cm 5.4pt'>
  <p class=MsoNormal style='mso-margin-top-alt:auto;text-align:justify'><span
  lang=ES style='font-size:12.0pt;font-family:"Arial",sans-serif;color:#0070C0'><o:p>&nbsp;</o:p></span></p>
  </td>
  <td width="30%" valign=top style='width:30.38%;border-top:none;border-left:
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
  mso-border-alt:solid windowtext .5pt;padding:0cm 5.4pt 0cm 5.4pt'>
  <p class=MsoNormal style='mso-margin-top-alt:auto;text-align:justify'><span
  lang=ES style='font-size:12.0pt;font-family:"Arial",sans-serif;color:#0070C0'><o:p>&nbsp;</o:p></span></p>
  </td>
  <td width="30%" valign=top style='width:30.38%;border-top:none;border-left:
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
  mso-border-alt:solid windowtext .5pt;padding:0cm 5.4pt 0cm 5.4pt'>
  <p class=MsoNormal align=center style='mso-margin-top-alt:auto;text-align:
  center'><span lang=ES style='font-size:12.0pt;font-family:"Arial",sans-serif;
  color:black;mso-themecolor:text1'>Principal</span><span lang=ES
  style='font-size:12.0pt;font-family:"Arial",sans-serif;color:#0070C0'><o:p></o:p></span></p>
  </td>
 </tr>
 <tr style='mso-yfti-irow:2'>
  <td width="5%" valign=top style='width:5.26%;border:solid windowtext 1.0pt;
  border-top:none;mso-border-top-alt:solid windowtext .5pt;mso-border-alt:solid windowtext .5pt;
  padding:0cm 5.4pt 0cm 5.4pt'>
  <p class=MsoNormal align=center style='mso-margin-top-alt:auto;text-align:
  center'><span lang=ES style='font-size:12.0pt;font-family:"Arial",sans-serif;
  color:black;mso-themecolor:text1'>2<o:p></o:p></span></p>
  </td>
  <td width="33%" valign=top style='width:33.98%;border-top:none;border-left:
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
  mso-border-alt:solid windowtext .5pt;padding:0cm 5.4pt 0cm 5.4pt'>
  <p class=MsoNormal style='mso-margin-top-alt:auto;text-align:justify'><span
  lang=ES style='font-size:12.0pt;font-family:"Arial",sans-serif;color:#0070C0'><o:p>&nbsp;</o:p></span></p>
  </td>
  <td width="30%" valign=top style='width:30.38%;border-top:none;border-left:
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
  mso-border-alt:solid windowtext .5pt;padding:0cm 5.4pt 0cm 5.4pt'>
  <p class=MsoNormal style='mso-margin-top-alt:auto;text-align:justify'><span
  lang=ES style='font-size:12.0pt;font-family:"Arial",sans-serif;color:#0070C0'><o:p>&nbsp;</o:p></span></p>
  </td>
  <td width="30%" valign=top style='width:30.38%;border-top:none;border-left:
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
  mso-border-alt:solid windowtext .5pt;padding:0cm 5.4pt 0cm 5.4pt'>
  <p class=MsoNormal align=center style='mso-margin-top-alt:auto;text-align:
  center'><span lang=ES style='font-size:12.0pt;font-family:"Arial",sans-serif;
  color:black;mso-themecolor:text1'>Principal</span><span lang=ES
  style='font-size:12.0pt;font-family:"Arial",sans-serif;color:#0070C0'><o:p></o:p></span></p>
  </td>
 </tr>
 <tr style='mso-yfti-irow:3'>
  <td width="5%" valign=top style='width:5.26%;border:solid windowtext 1.0pt;
  border-top:none;mso-border-top-alt:solid windowtext .5pt;mso-border-alt:solid windowtext .5pt;
  padding:0cm 5.4pt 0cm 5.4pt'>
  <p class=MsoNormal align=center style='mso-margin-top-alt:auto;text-align:
  center'><span lang=ES style='font-size:12.0pt;font-family:"Arial",sans-serif;
  color:black;mso-themecolor:text1'>3<o:p></o:p></span></p>
  </td>
  <td width="33%" valign=top style='width:33.98%;border-top:none;border-left:
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
  mso-border-alt:solid windowtext .5pt;padding:0cm 5.4pt 0cm 5.4pt'>
  <p class=MsoNormal style='mso-margin-top-alt:auto;text-align:justify'><span
  lang=ES style='font-size:12.0pt;font-family:"Arial",sans-serif;color:#0070C0'><o:p>&nbsp;</o:p></span></p>
  </td>
  <td width="30%" valign=top style='width:30.38%;border-top:none;border-left:
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
  mso-border-alt:solid windowtext .5pt;padding:0cm 5.4pt 0cm 5.4pt'>
  <p class=MsoNormal style='mso-margin-top-alt:auto;text-align:justify'><span
  lang=ES style='font-size:12.0pt;font-family:"Arial",sans-serif;color:#0070C0'><o:p>&nbsp;</o:p></span></p>
  </td>
  <td width="30%" valign=top style='width:30.38%;border-top:none;border-left:
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
  mso-border-alt:solid windowtext .5pt;padding:0cm 5.4pt 0cm 5.4pt'>
  <p class=MsoNormal align=center style='mso-margin-top-alt:auto;text-align:
  center'><span lang=ES style='font-size:12.0pt;font-family:"Arial",sans-serif;
  color:black;mso-themecolor:text1'>Suplente</span><span lang=ES
  style='font-size:12.0pt;font-family:"Arial",sans-serif;color:#0070C0'><o:p></o:p></span></p>
  </td>
 </tr>
 <tr style='mso-yfti-irow:4;mso-yfti-lastrow:yes'>
  <td width="5%" valign=top style='width:5.26%;border:solid windowtext 1.0pt;
  border-top:none;mso-border-top-alt:solid windowtext .5pt;mso-border-alt:solid windowtext .5pt;
  padding:0cm 5.4pt 0cm 5.4pt'>
  <p class=MsoNormal align=center style='mso-margin-top-alt:auto;text-align:
  center'><span lang=ES style='font-size:12.0pt;font-family:"Arial",sans-serif;
  color:black;mso-themecolor:text1'>4<o:p></o:p></span></p>
  </td>
  <td width="33%" valign=top style='width:33.98%;border-top:none;border-left:
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
  mso-border-alt:solid windowtext .5pt;padding:0cm 5.4pt 0cm 5.4pt'>
  <p class=MsoNormal style='mso-margin-top-alt:auto;text-align:justify'><span
  lang=ES style='font-size:12.0pt;font-family:"Arial",sans-serif;color:#0070C0'><o:p>&nbsp;</o:p></span></p>
  </td>
  <td width="30%" valign=top style='width:30.38%;border-top:none;border-left:
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
  mso-border-alt:solid windowtext .5pt;padding:0cm 5.4pt 0cm 5.4pt'>
  <p class=MsoNormal style='mso-margin-top-alt:auto;text-align:justify'><span
  lang=ES style='font-size:12.0pt;font-family:"Arial",sans-serif;color:#0070C0'><o:p>&nbsp;</o:p></span></p>
  </td>
  <td width="30%" valign=top style='width:30.38%;border-top:none;border-left:
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
  mso-border-alt:solid windowtext .5pt;padding:0cm 5.4pt 0cm 5.4pt'>
  <p class=MsoNormal align=center style='mso-margin-top-alt:auto;text-align:
  center'><span lang=ES style='font-size:12.0pt;font-family:"Arial",sans-serif;
  color:black;mso-themecolor:text1'>Suplente</span><span lang=ES
  style='font-size:12.0pt;font-family:"Arial",sans-serif;color:#0070C0'><o:p></o:p></span></p>
  </td>
 </tr>
</table>

<p class=MsoNormal style='mso-margin-top-alt:auto;text-align:justify'><b
style='mso-bidi-font-weight:normal'><span lang=ES-TRAD style='font-size:12.0pt;
font-family:"Arial",sans-serif;mso-ansi-language:ES-TRAD'><o:p>&nbsp;</o:p></span></b></p>

<p class=MsoNormal style='mso-margin-top-alt:auto;text-align:justify'><span
lang=ES style='font-size:12.0pt;font-family:"Arial",sans-serif'>El
Representante Legal de la empresa designa a ________________ Presidente del
comité, y por votación de los miembros del Comité se nombra a
__________________ Secretario del mismo<o:p></o:p></span></p>

<p class=MsoNormal style='mso-margin-top-alt:auto;text-align:justify'><span
lang=ES style='font-size:12.0pt;font-family:"Arial",sans-serif'><o:p>&nbsp;</o:p></span></p>

<p class=MsoNormal style='mso-margin-top-alt:auto;text-align:justify'><span
lang=ES style='font-size:12.0pt;font-family:"Arial",sans-serif'>.<o:p></o:p></span></p>

<p class=MsoNormal style='mso-margin-top-alt:auto;text-align:justify'><span
lang=ES style='font-size:12.0pt;font-family:"Arial",sans-serif'><o:p>&nbsp;</o:p></span></p>

<p class=MsoNormal style='mso-margin-top-alt:auto;text-align:justify'><b
style='mso-bidi-font-weight:normal'><span lang=ES-TRAD style='font-size:12.0pt;
font-family:"Arial",sans-serif;mso-ansi-language:ES-TRAD'><o:p>&nbsp;</o:p></span></b></p>

</div>


        </CKEditor:CKEditorControl>
    </div>

    <hr /><br />
    <div class="row text-center">
        <div class="col-md-4 col-md-offset-4">
            <asp:ImageButton alt="-" ID="btnGuardar" runat="server" ImageUrl="~\ico\print.png" OnClick="GenerarDocumento" ValidationGroup="ValidationAdd" />
            <h4>Generar Documento</h4>
        </div>
    </div>


</asp:Content>
