<%@ Page Title="" Language="C#" MasterPageFile="~/source/MasterPages/Menu.Master" AutoEventWireup="true" CodeBehind="ConstanciaReinduccionAdm.aspx.cs" Inherits="SGSST.source.sistema.Planear.ConstanciaReinduccionAdm" %>
<%@ Register Assembly="CKEditor.NET" Namespace="CKEditor.NET" TagPrefix="CKEditor" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server"></asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        
    <ol class="breadcrumb">
        <li><a href="#">Fase: Planear</a></li>
        <li><a href="#">Constancia de ReInducción de Area Administrativa</a></li>
    </ol>
    
    <div class="page-header">
        <h1 class="text-center">Constancia de ReInducción de Area Administrativa</h1>
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

<p class=MsoNormal style='line-height:150%'><b style='mso-bidi-font-weight:
normal'><span lang=ES>DATOS DEL TRABAJADOR<o:p></o:p></span></b></p>

<p class=MsoNormal style='line-height:150%'><b style='mso-bidi-font-weight:
normal'><span lang=ES><o:p>&nbsp;</o:p></span></b></p>

<p class=MsoNormal style='line-height:150%'><b style='mso-bidi-font-weight:
normal'><span lang=ES-MX style='font-family:"Arial",sans-serif;mso-ansi-language:
ES-MX'>Nombre y Apellido: <a name="OLE_LINK3">_______________________________________________________________</a><o:p></o:p></span></b></p>

<p class=MsoNormal style='line-height:150%'><b style='mso-bidi-font-weight:
normal'><span lang=ES-MX style='font-family:"Arial",sans-serif;mso-ansi-language:
ES-MX'>Cedula de Ciudadanía:
_____________________________________________________________<o:p></o:p></span></b></p>

<p class=MsoNormal style='line-height:150%'><b style='mso-bidi-font-weight:
normal'><span lang=ES-MX style='font-family:"Arial",sans-serif;mso-ansi-language:
ES-MX'>Cargo: __________________________________________________________________________<o:p></o:p></span></b></p>

<p class=MsoNormal style='line-height:150%'><b style='mso-bidi-font-weight:
normal'><span lang=ES-MX style='font-family:"Arial",sans-serif;mso-ansi-language:
ES-MX'>Fecha:
__________________________________________________________________________<o:p></o:p></span></b></p>

<p class=MsoNormal style='line-height:150%'><b style='mso-bidi-font-weight:
normal'><span lang=ES-MX style='font-family:"Arial",sans-serif;mso-ansi-language:
ES-MX'><o:p>&nbsp;</o:p></span></b></p>

<p class=MsoNormal style='line-height:150%'><b style='mso-bidi-font-weight:
normal'><span lang=ES-MX style='font-family:"Arial",sans-serif;mso-ansi-language:
ES-MX'>Duración de la capacitación:<span style='mso-spacerun:yes'>  </span><a
name="OLE_LINK2">________________________________________________</a>_______<o:p></o:p></span></b></p>

<p class=MsoNormal style='line-height:150%'><b style='mso-bidi-font-weight:
normal'><span lang=ES-MX style='font-family:"Arial",sans-serif;mso-ansi-language:
ES-MX'><o:p>&nbsp;</o:p></span></b></p>

<p class=MsoNormal style='line-height:150%'><b style='mso-bidi-font-weight:
normal'><span lang=ES-MX style='font-family:"Arial",sans-serif;mso-ansi-language:
ES-MX'>Persona Encargada del entrenamiento: <a name="OLE_LINK1">_______________________________________</a>________<o:p></o:p></span></b></p>

<p class=MsoNormal style='line-height:150%'><b style='mso-bidi-font-weight:
normal'><span lang=ES-MX style='font-family:"Arial",sans-serif;mso-ansi-language:
ES-MX'><o:p>&nbsp;</o:p></span></b></p>

<p class=MsoNormal style='line-height:150%'><b style='mso-bidi-font-weight:
normal'><span lang=ES-MX style='font-family:"Arial",sans-serif;mso-ansi-language:
ES-MX'>Actividad:
_______________________________________________________________________<o:p></o:p></span></b></p>

<p class=MsoNormal style='line-height:150%'><b style='mso-bidi-font-weight:
normal'><span lang=ES-MX style='font-family:"Arial",sans-serif;mso-ansi-language:
ES-MX'><o:p>&nbsp;</o:p></span></b></p>

<p class=MsoNormal style='line-height:150%'><b style='mso-bidi-font-weight:
normal'><span lang=ES-MX style='font-family:"Arial",sans-serif;mso-ansi-language:
ES-MX'>1.<span style='mso-spacerun:yes'>  </span>Mencione las actividades que
realiza y como las realiza en este puesto de trabajo<o:p></o:p></span></b></p>

<p class=MsoNormal style='line-height:150%'><a name="OLE_LINK5"></a><a
name="OLE_LINK4"><span style='mso-bookmark:OLE_LINK5'><b style='mso-bidi-font-weight:
normal'><span lang=ES-MX style='font-family:"Arial",sans-serif;mso-ansi-language:
ES-MX'>________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________</span></b></span></a><span
style='mso-bookmark:OLE_LINK5'><b style='mso-bidi-font-weight:normal'><span
lang=ES-MX style='font-family:"Arial",sans-serif;mso-ansi-language:ES-MX'><o:p></o:p></span></b></span></p>

<span style='mso-bookmark:OLE_LINK5'></span>

<p class=MsoNormal style='line-height:150%'><b style='mso-bidi-font-weight:
normal'><span lang=ES-MX style='font-family:"Arial",sans-serif;mso-ansi-language:
ES-MX'><o:p>&nbsp;</o:p></span></b></p>

<p class=MsoNormal style='line-height:150%'><b style='mso-bidi-font-weight:
normal'><span lang=ES-MX style='font-family:"Arial",sans-serif;mso-ansi-language:
ES-MX'>2. ¿Qué equipos o implementos de protección debe utilizar en las
actividades correspondientes al puesto de trabajo, para minimizar la exposición
a los diferentes factores de riesgo?<o:p></o:p></span></b></p>

<p class=MsoNormal style='line-height:150%'><b style='mso-bidi-font-weight:
normal'><span lang=ES-MX style='font-family:"Arial",sans-serif;mso-ansi-language:
ES-MX'>________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________<o:p></o:p></span></b></p>

<p class=MsoNormal style='line-height:150%'><b style='mso-bidi-font-weight:
normal'><span lang=ES-MX style='font-family:"Arial",sans-serif;mso-ansi-language:
ES-MX'><o:p>&nbsp;</o:p></span></b></p>

<p class=MsoNormal style='line-height:150%'><b style='mso-bidi-font-weight:
normal'><span lang=ES-MX style='font-family:"Arial",sans-serif;mso-ansi-language:
ES-MX'>3. Describa con sus palabras los riesgos a los que pudiera estar
expuesto al realizar las actividades de su puesto de trabajo<o:p></o:p></span></b></p>

<p class=MsoNormal style='line-height:150%'><b style='mso-bidi-font-weight:
normal'><span lang=ES-MX style='font-family:"Arial",sans-serif;mso-ansi-language:
ES-MX'>________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________<o:p></o:p></span></b></p>

<p class=MsoNormal style='line-height:150%'><b style='mso-bidi-font-weight:
normal'><span lang=ES-MX style='font-family:"Arial",sans-serif;mso-ansi-language:
ES-MX'><o:p>&nbsp;</o:p></span></b></p>

<p class=MsoNormal style='line-height:150%'><b style='mso-bidi-font-weight:
normal'><span lang=ES-MX style='font-family:"Arial",sans-serif;mso-ansi-language:
ES-MX'>4. ¿Comente su comprensión respecto a la Política de Seguridad y Salud
en el Trabajo de la Organización?<o:p></o:p></span></b></p>

<p class=MsoNormal style='line-height:150%'><b style='mso-bidi-font-weight:
normal'><span lang=ES-MX style='font-family:"Arial",sans-serif;mso-ansi-language:
ES-MX'>________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________<o:p></o:p></span></b></p>

<p class=MsoNormal style='line-height:150%'><b style='mso-bidi-font-weight:
normal'><span lang=ES-MX style='font-family:"Arial",sans-serif;mso-ansi-language:
ES-MX'><o:p>&nbsp;</o:p></span></b></p>

<p class=MsoNormal style='line-height:150%'><b style='mso-bidi-font-weight:
normal'><span lang=ES-MX style='font-family:"Arial",sans-serif;mso-ansi-language:
ES-MX'>5.- ¿Mencione las Normas de Seguridad y Salud en el Trabajo que le
fueron impartidas?<o:p></o:p></span></b></p>

<p class=MsoNormal style='line-height:150%'><b style='mso-bidi-font-weight:
normal'><span lang=ES-MX style='font-family:"Arial",sans-serif;mso-ansi-language:
ES-MX'>________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________<o:p></o:p></span></b></p>

<p class=MsoNormal style='line-height:150%'><b style='mso-bidi-font-weight:
normal'><span lang=ES-MX style='font-family:"Arial",sans-serif;mso-ansi-language:
ES-MX'><o:p>&nbsp;</o:p></span></b></p>

<p class=MsoNormal style='line-height:150%'><b style='mso-bidi-font-weight:
normal'><span lang=ES-MX style='font-family:"Arial",sans-serif;mso-ansi-language:
ES-MX'>6. ¿Mencione los objetivos en materia de seguridad y salud en el trabajo
que le fueron indicados en la inducción?<o:p></o:p></span></b></p>

<p class=MsoNormal style='line-height:150%'><b style='mso-bidi-font-weight:
normal'><span lang=ES-MX style='font-family:"Arial",sans-serif;mso-ansi-language:
ES-MX'>________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________<o:p></o:p></span></b></p>

<p class=MsoNormal style='line-height:150%'><b style='mso-bidi-font-weight:
normal'><span lang=ES-MX style='font-family:"Arial",sans-serif;mso-ansi-language:
ES-MX'><o:p>&nbsp;</o:p></span></b></p>

<p class=MsoNormal style='line-height:150%'><b style='mso-bidi-font-weight:
normal'><span lang=ES-MX style='font-family:"Arial",sans-serif;mso-ansi-language:
ES-MX'>7. ¿Mencione que pausas activas realiza durante la<span
style='mso-spacerun:yes'>  </span>jornada de trabajo, y con qué frecuencia las
aplica?<o:p></o:p></span></b></p>

<p class=MsoNormal style='line-height:150%'><b style='mso-bidi-font-weight:
normal'><span lang=ES-MX style='font-family:"Arial",sans-serif;mso-ansi-language:
ES-MX'>________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________<o:p></o:p></span></b></p>

<p class=MsoNormal style='line-height:150%'><b style='mso-bidi-font-weight:
normal'><span lang=ES-MX style='font-family:"Arial",sans-serif;mso-ansi-language:
ES-MX'><o:p>&nbsp;</o:p></span></b></p>

<p class=MsoNormal style='line-height:150%'><b style='mso-bidi-font-weight:
normal'><span lang=ES-MX style='font-family:"Arial",sans-serif;mso-ansi-language:
ES-MX'>8. Según la información recibida, indique que medidas de prevención
deben tomarse antes, durante y después de una emergencia.<span
style='mso-spacerun:yes'>  </span><o:p></o:p></span></b></p>

<p class=MsoNormal style='line-height:150%'><b style='mso-bidi-font-weight:
normal'><span lang=ES-MX style='font-family:"Arial",sans-serif;mso-ansi-language:
ES-MX'><o:p>&nbsp;</o:p></span></b></p>

<p class=MsoNormal style='line-height:150%'><b style='mso-bidi-font-weight:
normal'><span lang=ES-MX style='font-family:"Arial",sans-serif;mso-ansi-language:
ES-MX'>Antes:<a name="OLE_LINK6"><o:p></o:p></a></span></b></p>

<p class=MsoNormal style='line-height:150%'><span style='mso-bookmark:OLE_LINK6'><b
style='mso-bidi-font-weight:normal'><span lang=ES-MX style='font-family:"Arial",sans-serif;
mso-ansi-language:ES-MX'>___________________________________________________________________________________________________________________________________________________________________________________________________________________________________________<o:p></o:p></span></b></span></p>

<span style='mso-bookmark:OLE_LINK6'></span>

<p class=MsoNormal style='line-height:150%'><b style='mso-bidi-font-weight:
normal'><span lang=ES-MX style='font-family:"Arial",sans-serif;mso-ansi-language:
ES-MX'>Durante:
___________________________________________________________________________________________________________________________________________________________________________________________________________________________________________<o:p></o:p></span></b></p>

<p class=MsoNormal style='line-height:150%'><b style='mso-bidi-font-weight:
normal'><span lang=ES-MX style='font-family:"Arial",sans-serif;mso-ansi-language:
ES-MX'>Después:
___________________________________________________________________________________________________________________________________________________________________________________________________________________________________________<o:p></o:p></span></b></p>

<p class=MsoNormal style='line-height:150%'><b style='mso-bidi-font-weight:
normal'><span lang=ES-MX style='font-family:"Arial",sans-serif;mso-ansi-language:
ES-MX'><o:p>&nbsp;</o:p></span></b></p>

<table class=MsoTableGrid border=1 cellspacing=0 cellpadding=0
 style='border-collapse:collapse;border:none;mso-border-alt:solid black .5pt;
 mso-border-themecolor:text1;mso-yfti-tbllook:1184;mso-padding-alt:0cm 5.4pt 0cm 5.4pt'>
 <tr style='mso-yfti-irow:0;mso-yfti-firstrow:yes;height:16.9pt'>
  <td width=650 valign=top style='width:487.7pt;border:solid black 1.0pt;
  mso-border-themecolor:text1;mso-border-alt:solid black .5pt;mso-border-themecolor:
  text1;padding:0cm 5.4pt 0cm 5.4pt;height:16.9pt'>
  <p class=MsoNormal style='line-height:150%'><b style='mso-bidi-font-weight:
  normal'><span lang=ES-MX style='font-size:11.0pt;line-height:150%;font-family:
  "Arial",sans-serif;mso-ansi-language:ES-MX'>Firma del Capacitador: <a
  name="OLE_LINK7"><o:p></o:p></a></span></b></p>
  <p class=MsoNormal style='line-height:150%'><span style='mso-bookmark:OLE_LINK7'><b
  style='mso-bidi-font-weight:normal'><span lang=ES-MX style='font-size:11.0pt;
  line-height:150%;font-family:"Arial",sans-serif;mso-ansi-language:ES-MX'>|<o:p></o:p></span></b></span></p>
  <p class=MsoNormal style='line-height:150%'><span style='mso-bookmark:OLE_LINK7'><b
  style='mso-bidi-font-weight:normal'><span lang=ES-MX style='font-size:11.0pt;
  line-height:150%;font-family:"Arial",sans-serif;mso-ansi-language:ES-MX'>|<o:p></o:p></span></b></span></p>
  <p class=MsoNormal style='line-height:150%'><span style='mso-bookmark:OLE_LINK7'><b
  style='mso-bidi-font-weight:normal'><span lang=ES-MX style='font-size:11.0pt;
  line-height:150%;font-family:"Arial",sans-serif;mso-ansi-language:ES-MX'>|</span></b></span><b
  style='mso-bidi-font-weight:normal'><span lang=ES-MX style='font-size:11.0pt;
  line-height:150%;font-family:"Arial",sans-serif;mso-ansi-language:ES-MX'><o:p></o:p></span></b></p>
  </td>
 </tr>
 <tr style='mso-yfti-irow:1;height:18.85pt'>
  <td width=650 valign=top style='width:487.7pt;border:solid black 1.0pt;
  mso-border-themecolor:text1;border-top:none;mso-border-top-alt:solid black .5pt;
  mso-border-top-themecolor:text1;mso-border-alt:solid black .5pt;mso-border-themecolor:
  text1;padding:0cm 5.4pt 0cm 5.4pt;height:18.85pt'>
  <p class=MsoNormal style='line-height:150%'><b style='mso-bidi-font-weight:
  normal'><span lang=ES-MX style='font-size:11.0pt;line-height:150%;font-family:
  "Arial",sans-serif;mso-ansi-language:ES-MX'>Huella dactilar<o:p></o:p></span></b></p>
  <p class=MsoNormal style='line-height:150%'><b style='mso-bidi-font-weight:
  normal'><span lang=ES-MX style='font-size:11.0pt;line-height:150%;font-family:
  "Arial",sans-serif;mso-ansi-language:ES-MX'>|<o:p></o:p></span></b></p>
  <p class=MsoNormal style='line-height:150%'><b style='mso-bidi-font-weight:
  normal'><span lang=ES-MX style='font-size:11.0pt;line-height:150%;font-family:
  "Arial",sans-serif;mso-ansi-language:ES-MX'>|<o:p></o:p></span></b></p>
  <p class=MsoNormal style='line-height:150%'><b style='mso-bidi-font-weight:
  normal'><span lang=ES-MX style='font-size:11.0pt;line-height:150%;font-family:
  "Arial",sans-serif;mso-ansi-language:ES-MX'>|<o:p></o:p></span></b></p>
  </td>
 </tr>
 <tr style='mso-yfti-irow:2;height:18.15pt'>
  <td width=650 valign=top style='width:487.7pt;border:solid black 1.0pt;
  mso-border-themecolor:text1;border-top:none;mso-border-top-alt:solid black .5pt;
  mso-border-top-themecolor:text1;mso-border-alt:solid black .5pt;mso-border-themecolor:
  text1;padding:0cm 5.4pt 0cm 5.4pt;height:18.15pt'>
  <p class=MsoNormal style='line-height:150%'><b style='mso-bidi-font-weight:
  normal'><span lang=ES-MX style='font-size:11.0pt;line-height:150%;font-family:
  "Arial",sans-serif;mso-ansi-language:ES-MX'>Firma del Trabajador: <o:p></o:p></span></b></p>
  <p class=MsoNormal style='line-height:150%'><b style='mso-bidi-font-weight:
  normal'><span lang=ES-MX style='font-size:11.0pt;line-height:150%;font-family:
  "Arial",sans-serif;mso-ansi-language:ES-MX'>|<o:p></o:p></span></b></p>
  <p class=MsoNormal style='line-height:150%'><b style='mso-bidi-font-weight:
  normal'><span lang=ES-MX style='font-size:11.0pt;line-height:150%;font-family:
  "Arial",sans-serif;mso-ansi-language:ES-MX'>|<o:p></o:p></span></b></p>
  <p class=MsoNormal style='line-height:150%'><b style='mso-bidi-font-weight:
  normal'><span lang=ES-MX style='font-size:11.0pt;line-height:150%;font-family:
  "Arial",sans-serif;mso-ansi-language:ES-MX'>|<o:p></o:p></span></b></p>
  </td>
 </tr>
 <tr style='mso-yfti-irow:3;height:19.2pt'>
  <td width=650 valign=top style='width:487.7pt;border:solid black 1.0pt;
  mso-border-themecolor:text1;border-top:none;mso-border-top-alt:solid black .5pt;
  mso-border-top-themecolor:text1;mso-border-alt:solid black .5pt;mso-border-themecolor:
  text1;padding:0cm 5.4pt 0cm 5.4pt;height:19.2pt'>
  <p class=MsoNormal style='line-height:150%'><b style='mso-bidi-font-weight:
  normal'><span lang=ES-MX style='font-size:11.0pt;line-height:150%;font-family:
  "Arial",sans-serif;mso-ansi-language:ES-MX'>Huella dactilar<o:p></o:p></span></b></p>
  <p class=MsoNormal style='line-height:150%'><b style='mso-bidi-font-weight:
  normal'><span lang=ES-MX style='font-size:11.0pt;line-height:150%;font-family:
  "Arial",sans-serif;mso-ansi-language:ES-MX'>|<o:p></o:p></span></b></p>
  <p class=MsoNormal style='line-height:150%'><b style='mso-bidi-font-weight:
  normal'><span lang=ES-MX style='font-size:11.0pt;line-height:150%;font-family:
  "Arial",sans-serif;mso-ansi-language:ES-MX'>|<o:p></o:p></span></b></p>
  <p class=MsoNormal style='line-height:150%'><b style='mso-bidi-font-weight:
  normal'><span lang=ES-MX style='font-size:11.0pt;line-height:150%;font-family:
  "Arial",sans-serif;mso-ansi-language:ES-MX'>|<o:p></o:p></span></b></p>
  </td>
 </tr>
 <tr style='mso-yfti-irow:4;height:12.4pt'>
  <td width=650 valign=top style='width:487.7pt;border:solid black 1.0pt;
  mso-border-themecolor:text1;border-top:none;mso-border-top-alt:solid black .5pt;
  mso-border-top-themecolor:text1;mso-border-alt:solid black .5pt;mso-border-themecolor:
  text1;padding:0cm 5.4pt 0cm 5.4pt;height:12.4pt'>
  <p class=MsoNormal style='line-height:150%'><b style='mso-bidi-font-weight:
  normal'><span lang=ES-MX style='font-size:11.0pt;line-height:150%;font-family:
  "Arial",sans-serif;mso-ansi-language:ES-MX'>Firma del responsable del SG-SST:
  <o:p></o:p></span></b></p>
  <p class=MsoNormal style='line-height:150%'><b style='mso-bidi-font-weight:
  normal'><span lang=ES-MX style='font-size:11.0pt;line-height:150%;font-family:
  "Arial",sans-serif;mso-ansi-language:ES-MX'>|<o:p></o:p></span></b></p>
  <p class=MsoNormal style='line-height:150%'><b style='mso-bidi-font-weight:
  normal'><span lang=ES-MX style='font-size:11.0pt;line-height:150%;font-family:
  "Arial",sans-serif;mso-ansi-language:ES-MX'>|<o:p></o:p></span></b></p>
  <p class=MsoNormal style='line-height:150%'><b style='mso-bidi-font-weight:
  normal'><span lang=ES-MX style='font-size:11.0pt;line-height:150%;font-family:
  "Arial",sans-serif;mso-ansi-language:ES-MX'>|<o:p></o:p></span></b></p>
  </td>
 </tr>
 <tr style='mso-yfti-irow:5;mso-yfti-lastrow:yes;height:3.5pt'>
  <td width=650 valign=top style='width:487.7pt;border:solid black 1.0pt;
  mso-border-themecolor:text1;border-top:none;mso-border-top-alt:solid black .5pt;
  mso-border-top-themecolor:text1;mso-border-alt:solid black .5pt;mso-border-themecolor:
  text1;padding:0cm 5.4pt 0cm 5.4pt;height:3.5pt'>
  <p class=MsoNormal style='line-height:150%'><b style='mso-bidi-font-weight:
  normal'><span lang=ES-MX style='font-size:11.0pt;line-height:150%;font-family:
  "Arial",sans-serif;mso-ansi-language:ES-MX'>Huella dactilar<o:p></o:p></span></b></p>
  <p class=MsoNormal style='line-height:150%'><b style='mso-bidi-font-weight:
  normal'><span lang=ES-MX style='font-size:11.0pt;line-height:150%;font-family:
  "Arial",sans-serif;mso-ansi-language:ES-MX'>|<o:p></o:p></span></b></p>
  <p class=MsoNormal style='line-height:150%'><b style='mso-bidi-font-weight:
  normal'><span lang=ES-MX style='font-size:11.0pt;line-height:150%;font-family:
  "Arial",sans-serif;mso-ansi-language:ES-MX'>|<o:p></o:p></span></b></p>
  <p class=MsoNormal style='line-height:150%'><b style='mso-bidi-font-weight:
  normal'><span lang=ES-MX style='font-size:11.0pt;line-height:150%;font-family:
  "Arial",sans-serif;mso-ansi-language:ES-MX'>|<o:p></o:p></span></b></p>
  </td>
 </tr>
</table>

<p class=MsoNormal style='line-height:150%'><b style='mso-bidi-font-weight:
normal'><span lang=ES-MX style='font-family:"Arial",sans-serif;mso-ansi-language:
ES-MX'><o:p>&nbsp;</o:p></span></b></p>

<p class=MsoNormal style='line-height:150%'><b style='mso-bidi-font-weight:
normal'><span lang=ES-MX style='font-family:"Arial",sans-serif;mso-ansi-language:
ES-MX'><o:p>&nbsp;</o:p></span></b></p>

<p class=MsoNormal style='line-height:150%'><b style='mso-bidi-font-weight:
normal'><span lang=ES-MX style='font-family:"Arial",sans-serif;mso-ansi-language:
ES-MX'><o:p>&nbsp;</o:p></span></b></p>

<p class=MsoNormal style='line-height:150%'><b style='mso-bidi-font-weight:
normal'><span lang=ES-MX style='font-family:"Arial",sans-serif;mso-ansi-language:
ES-MX'><o:p>&nbsp;</o:p></span></b></p>

<p class=MsoNormal style='line-height:150%'><b style='mso-bidi-font-weight:
normal'><span lang=ES-MX style='font-family:"Arial",sans-serif;mso-ansi-language:
ES-MX'><o:p>&nbsp;</o:p></span></b></p>

<p class=MsoNormal style='line-height:150%'><b style='mso-bidi-font-weight:
normal'><span lang=ES-MX style='font-family:"Arial",sans-serif;mso-ansi-language:
ES-MX'><o:p>&nbsp;</o:p></span></b></p>

<p class=MsoNormal style='line-height:150%'><b style='mso-bidi-font-weight:
normal'><span lang=ES-MX style='font-family:"Arial",sans-serif;mso-ansi-language:
ES-MX'><o:p>&nbsp;</o:p></span></b></p>

<p class=MsoNormal style='line-height:150%'><b style='mso-bidi-font-weight:
normal'><span lang=ES-MX style='font-family:"Arial",sans-serif;mso-ansi-language:
ES-MX'><o:p>&nbsp;</o:p></span></b></p>

<p class=MsoNormal style='line-height:150%'><b style='mso-bidi-font-weight:
normal'><span lang=ES-MX style='font-family:"Arial",sans-serif;mso-ansi-language:
ES-MX'><o:p>&nbsp;</o:p></span></b></p>

<p class=MsoNormal style='line-height:150%'><b style='mso-bidi-font-weight:
normal'><span lang=ES-MX style='font-family:"Arial",sans-serif;mso-ansi-language:
ES-MX'><o:p>&nbsp;</o:p></span></b></p>

<p class=MsoNormal style='line-height:150%'><b style='mso-bidi-font-weight:
normal'><span lang=ES-MX style='font-family:"Arial",sans-serif;mso-ansi-language:
ES-MX'><o:p>&nbsp;</o:p></span></b></p>

<p class=MsoNormal style='line-height:150%'><b style='mso-bidi-font-weight:
normal'><span lang=ES-MX style='font-family:"Arial",sans-serif;mso-ansi-language:
ES-MX'><o:p>&nbsp;</o:p></span></b></p>

<p class=MsoNormal style='line-height:150%'><b style='mso-bidi-font-weight:
normal'><span lang=ES-MX style='font-family:"Arial",sans-serif;mso-ansi-language:
ES-MX'><span style='mso-spacerun:yes'>    </span><o:p></o:p></span></b></p>

<p class=MsoHeader style='text-align:justify;line-height:150%;tab-stops:center 36.0pt 220.95pt right 441.9pt'><span
lang=ES style='font-size:12.0pt;line-height:150%;font-family:"Arial",sans-serif'><o:p>&nbsp;</o:p></span></p>

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