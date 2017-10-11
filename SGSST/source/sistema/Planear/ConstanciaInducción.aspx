<%@ Page Title="" Language="C#" MasterPageFile="~/source/MasterPages/Menu.Master" AutoEventWireup="true" CodeBehind="ConstanciaInducción.aspx.cs" Inherits="SGSST.source.sistema.Planear.ConstanciaInducción" %>
<%@ Register Assembly="CKEditor.NET" Namespace="CKEditor.NET" TagPrefix="CKEditor" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server"></asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        
    <ol class="breadcrumb">
        <li><a href="#">Fase: Planear</a></li>
        <li><a href="#">Constancia de Inducción</a></li>
    </ol>
    
    <div class="page-header">
        <h1 class="text-center">Constancia de Inducción</h1>
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

            <p class=MsoNormal align=right style='text-align:right;line-height:150%;
            tab-stops:center 36.0pt 220.95pt right 441.9pt'><span lang=ES style='font-family:
            "Arial",sans-serif;mso-fareast-font-family:Calibri;mso-fareast-theme-font:minor-latin;
            mso-fareast-language:EN-US'><o:p>&nbsp;</o:p></span></p>

            <p class=MsoNormal align=right style='text-align:right;line-height:150%;
            tab-stops:center 36.0pt 220.95pt right 441.9pt'><span lang=ES style='font-family:
            "Arial",sans-serif;mso-fareast-font-family:Calibri;mso-fareast-theme-font:minor-latin;
            mso-fareast-language:EN-US'>Fecha ___/____/____<o:p></o:p></span></p>

            <p class=MsoNormal align=right style='text-align:right;line-height:150%;
            tab-stops:center 36.0pt 220.95pt right 441.9pt'><span lang=ES style='font-family:
            "Arial",sans-serif;mso-fareast-font-family:Calibri;mso-fareast-theme-font:minor-latin;
            mso-fareast-language:EN-US'><o:p>&nbsp;</o:p></span></p>

            <p class=MsoNormal align=right style='text-align:right;line-height:150%;
            tab-stops:center 36.0pt 220.95pt right 441.9pt'><span lang=ES style='font-family:
            "Arial",sans-serif;mso-fareast-font-family:Calibri;mso-fareast-theme-font:minor-latin;
            mso-fareast-language:EN-US'><o:p>&nbsp;</o:p></span></p>

            <p class=MsoNormal align=center style='text-align:center;line-height:150%;
            tab-stops:center 36.0pt 220.95pt right 441.9pt'><b style='mso-bidi-font-weight:
            normal'><span lang=ES style='font-family:"Arial",sans-serif;mso-fareast-font-family:
            Calibri;mso-fareast-theme-font:minor-latin;mso-fareast-language:EN-US'>CONSTANCIA
            DE INDUCCIÓN EN SEGURIDAD Y SALUD EN EL TRABAJO<o:p></o:p></span></b></p>

            <p class=MsoNormal align=center style='text-align:center;line-height:150%;
            tab-stops:center 36.0pt 220.95pt right 441.9pt'><b style='mso-bidi-font-weight:
            normal'><span lang=ES style='font-family:"Arial",sans-serif;mso-fareast-font-family:
            Calibri;mso-fareast-theme-font:minor-latin;mso-fareast-language:EN-US'><o:p>&nbsp;</o:p></span></b></p>

            <p class=MsoNormal style='text-align:justify;line-height:150%;tab-stops:center 36.0pt 220.95pt right 441.9pt'><span
            lang=ES style='font-family:"Arial",sans-serif;mso-fareast-font-family:Calibri;
            mso-fareast-theme-font:minor-latin;mso-fareast-language:EN-US'>Yo ______________________________________
            titular de la cédula de ciudadanía.______________ De _____ años de edad,
            domiciliado en __________________________________________________________________<o:p></o:p></span></p>

            <p class=MsoNormal style='text-align:justify;line-height:150%;tab-stops:center 36.0pt 220.95pt right 441.9pt'><span
            lang=ES style='font-family:"Arial",sans-serif;mso-fareast-font-family:Calibri;
            mso-fareast-theme-font:minor-latin;mso-fareast-language:EN-US'>Por medio de la
            presente hago constar que al momento de mi ingreso en la Empresa
            ______________________________; </span><span lang=ES style='font-family:"Arial",sans-serif'>el
            día __________ en el cargo de: ______________, </span><span lang=ES
            style='font-family:"Arial",sans-serif;mso-fareast-font-family:Calibri;
            mso-fareast-theme-font:minor-latin;mso-fareast-language:EN-US'><span
            style='mso-spacerun:yes'> </span>me fue informado y señalado de manera general
            y específica los riesgos a los cuales estaré expuesto durante mi permanencia en
            la misma, así como también mis deberes y derechos, para adaptarme al ambiente
            laboral. Además me fue informado acerca del correcto uso y cuidado de los
            equipos de protección personal suministrados por la empresa para mi uso
            exclusivo y de carácter obligatorio.<o:p></o:p></span></p>

            <p class=MsoNormal style='text-align:justify;line-height:150%;tab-stops:center 36.0pt 220.95pt right 441.9pt'><span
            lang=ES style='font-family:"Arial",sans-serif;mso-fareast-font-family:Calibri;
            mso-fareast-theme-font:minor-latin;mso-fareast-language:EN-US'><o:p>&nbsp;</o:p></span></p>

            <p class=MsoHeader style='text-align:justify;line-height:150%;tab-stops:center 36.0pt 220.95pt right 441.9pt'><span
            lang=ES style='font-size:12.0pt;line-height:150%;font-family:"Arial",sans-serif'>El
            Responsable del Sistema de Gestión de Seguridad y Salud en el Trabajo
            _______________________________Cedula de Ciudadanía_______________, con el
            cargo de _______________________, suministró la información necesaria en pro de
            facilitar la integración a la organización, y explicó durante la inducción los
            procedimientos de trabajo seguro y las medidas de prevención en cada una de las
            labores a realizar, efectuando un recorrido por las instalaciones de la empresa
            e indicando la ubicación de los medios de extinción y las vías de evacuación en
            caso de una emergencia. <o:p></o:p></span></p>

            <p class=MsoHeader style='text-align:justify;line-height:150%;tab-stops:center 36.0pt 220.95pt right 441.9pt'><span
            lang=ES style='font-size:12.0pt;line-height:150%;font-family:"Arial",sans-serif'><o:p>&nbsp;</o:p></span></p>

            <p class=MsoHeader style='text-align:justify;line-height:150%;tab-stops:center 36.0pt 220.95pt right 441.9pt'><span
            lang=ES style='font-size:12.0pt;line-height:150%;font-family:"Arial",sans-serif'><o:p>&nbsp;</o:p></span></p>

            <p class=MsoHeader style='text-align:justify;line-height:150%;tab-stops:center 36.0pt 220.95pt right 441.9pt'><span
            lang=ES style='font-size:12.0pt;line-height:150%;font-family:"Arial",sans-serif'><o:p>&nbsp;</o:p></span></p>

            <p class=MsoHeader style='text-align:justify;line-height:150%;tab-stops:center 36.0pt 220.95pt right 441.9pt'><span
            lang=ES style='font-size:12.0pt;line-height:150%;font-family:"Arial",sans-serif'>Concluida
            la inducción, el trabajador deberá responder las preguntas que se presentan a
            continuación, Para ello debe seleccionar con una (X) en la casilla
            correspondiente SI o NO, de acuerdo al resultado de la inducción:<o:p></o:p></span></p>

            <p class=MsoHeader style='text-align:justify;line-height:150%;tab-stops:center 36.0pt 220.95pt right 441.9pt'><span
            lang=ES style='font-size:12.0pt;line-height:150%;font-family:"Arial",sans-serif'><o:p>&nbsp;</o:p></span></p>

            <p class=MsoHeader style='text-align:justify;line-height:115%;tab-stops:center 36.0pt 220.95pt right 441.9pt'><span
            lang=ES style='font-family:"Times New Roman",serif'><o:p>&nbsp;</o:p></span></p>

            <table class=MsoTableGrid border=1 cellspacing=0 cellpadding=0 width=612
             style='width:459.0pt;border-collapse:collapse;border:none;mso-border-alt:solid black .5pt;
             mso-border-themecolor:text1;mso-yfti-tbllook:1184;mso-padding-alt:0cm 5.4pt 0cm 5.4pt'>
             <tr style='mso-yfti-irow:0;mso-yfti-firstrow:yes'>
              <td width=527 valign=top style='width:395.25pt;border:solid black 1.0pt;
              mso-border-themecolor:text1;mso-border-alt:solid black .5pt;mso-border-themecolor:
              text1;background:#92CDDC;mso-background-themecolor:accent5;mso-background-themetint:
              153;padding:0cm 5.4pt 0cm 5.4pt'>
              <p class=MsoHeader align=center style='text-align:center;tab-stops:center 36.0pt 220.95pt right 441.9pt'><b
              style='mso-bidi-font-weight:normal'><span lang=ES style='font-size:12.0pt;
              font-family:"Times New Roman",serif'>INFORMACIÓN<o:p></o:p></span></b></p>
              </td>
              <td width=38 valign=top style='width:1.0cm;border:solid black 1.0pt;
              mso-border-themecolor:text1;border-left:none;mso-border-left-alt:solid black .5pt;
              mso-border-left-themecolor:text1;mso-border-alt:solid black .5pt;mso-border-themecolor:
              text1;background:#92CDDC;mso-background-themecolor:accent5;mso-background-themetint:
              153;padding:0cm 5.4pt 0cm 5.4pt'>
              <p class=MsoHeader align=center style='text-align:center;line-height:115%;
              tab-stops:center 36.0pt 220.95pt right 441.9pt'><b style='mso-bidi-font-weight:
              normal'><span lang=ES style='font-family:"Times New Roman",serif'>SI<o:p></o:p></span></b></p>
              </td>
              <td width=47 valign=top style='width:35.4pt;border:solid black 1.0pt;
              mso-border-themecolor:text1;border-left:none;mso-border-left-alt:solid black .5pt;
              mso-border-left-themecolor:text1;mso-border-alt:solid black .5pt;mso-border-themecolor:
              text1;background:#92CDDC;mso-background-themecolor:accent5;mso-background-themetint:
              153;padding:0cm 5.4pt 0cm 5.4pt'>
              <p class=MsoHeader align=center style='text-align:center;line-height:115%;
              tab-stops:center 36.0pt 220.95pt right 441.9pt'><b style='mso-bidi-font-weight:
              normal'><span lang=ES style='font-family:"Times New Roman",serif'>NO<o:p></o:p></span></b></p>
              </td>
             </tr>
             <tr style='mso-yfti-irow:1'>
              <td width=527 style='width:395.25pt;border:solid black 1.0pt;mso-border-themecolor:
              text1;border-top:none;mso-border-top-alt:solid black .5pt;mso-border-top-themecolor:
              text1;mso-border-alt:solid black .5pt;mso-border-themecolor:text1;padding:
              0cm 5.4pt 0cm 5.4pt'>
              <p class=MsoHeader style='tab-stops:center 36.0pt 220.95pt right 441.9pt'><span
              lang=ES style='font-family:"Times New Roman",serif'>¿Le dieron a conocer las
              instalaciones externas de la empresa?<o:p></o:p></span></p>
              </td>
              <td width=38 valign=top style='width:1.0cm;border-top:none;border-left:none;
              border-bottom:solid black 1.0pt;mso-border-bottom-themecolor:text1;
              border-right:solid black 1.0pt;mso-border-right-themecolor:text1;mso-border-top-alt:
              solid black .5pt;mso-border-top-themecolor:text1;mso-border-left-alt:solid black .5pt;
              mso-border-left-themecolor:text1;mso-border-alt:solid black .5pt;mso-border-themecolor:
              text1;padding:0cm 5.4pt 0cm 5.4pt'>
              <p class=MsoHeader style='text-align:justify;line-height:115%;tab-stops:center 36.0pt 220.95pt right 441.9pt'><span
              lang=ES style='font-family:"Times New Roman",serif'><o:p>&nbsp;</o:p></span></p>
              </td>
              <td width=47 valign=top style='width:35.4pt;border-top:none;border-left:none;
              border-bottom:solid black 1.0pt;mso-border-bottom-themecolor:text1;
              border-right:solid black 1.0pt;mso-border-right-themecolor:text1;mso-border-top-alt:
              solid black .5pt;mso-border-top-themecolor:text1;mso-border-left-alt:solid black .5pt;
              mso-border-left-themecolor:text1;mso-border-alt:solid black .5pt;mso-border-themecolor:
              text1;padding:0cm 5.4pt 0cm 5.4pt'>
              <p class=MsoHeader style='text-align:justify;line-height:115%;tab-stops:center 36.0pt 220.95pt right 441.9pt'><span
              lang=ES style='font-family:"Times New Roman",serif'><o:p>&nbsp;</o:p></span></p>
              </td>
             </tr>
             <tr style='mso-yfti-irow:2'>
              <td width=527 style='width:395.25pt;border:solid black 1.0pt;mso-border-themecolor:
              text1;border-top:none;mso-border-top-alt:solid black .5pt;mso-border-top-themecolor:
              text1;mso-border-alt:solid black .5pt;mso-border-themecolor:text1;padding:
              0cm 5.4pt 0cm 5.4pt'>
              <p class=MsoHeader style='tab-stops:center 36.0pt 220.95pt right 441.9pt'><span
              lang=ES style='font-family:"Times New Roman",serif'>¿Le dieron a conocer las
              instalaciones internas de la empresa?<o:p></o:p></span></p>
              </td>
              <td width=38 valign=top style='width:1.0cm;border-top:none;border-left:none;
              border-bottom:solid black 1.0pt;mso-border-bottom-themecolor:text1;
              border-right:solid black 1.0pt;mso-border-right-themecolor:text1;mso-border-top-alt:
              solid black .5pt;mso-border-top-themecolor:text1;mso-border-left-alt:solid black .5pt;
              mso-border-left-themecolor:text1;mso-border-alt:solid black .5pt;mso-border-themecolor:
              text1;padding:0cm 5.4pt 0cm 5.4pt'>
              <p class=MsoHeader style='text-align:justify;line-height:115%;tab-stops:center 36.0pt 220.95pt right 441.9pt'><span
              lang=ES style='font-family:"Times New Roman",serif'><o:p>&nbsp;</o:p></span></p>
              </td>
              <td width=47 valign=top style='width:35.4pt;border-top:none;border-left:none;
              border-bottom:solid black 1.0pt;mso-border-bottom-themecolor:text1;
              border-right:solid black 1.0pt;mso-border-right-themecolor:text1;mso-border-top-alt:
              solid black .5pt;mso-border-top-themecolor:text1;mso-border-left-alt:solid black .5pt;
              mso-border-left-themecolor:text1;mso-border-alt:solid black .5pt;mso-border-themecolor:
              text1;padding:0cm 5.4pt 0cm 5.4pt'>
              <p class=MsoHeader style='text-align:justify;line-height:115%;tab-stops:center 36.0pt 220.95pt right 441.9pt'><span
              lang=ES style='font-family:"Times New Roman",serif'><o:p>&nbsp;</o:p></span></p>
              </td>
             </tr>
             <tr style='mso-yfti-irow:3'>
              <td width=527 style='width:395.25pt;border:solid black 1.0pt;mso-border-themecolor:
              text1;border-top:none;mso-border-top-alt:solid black .5pt;mso-border-top-themecolor:
              text1;mso-border-alt:solid black .5pt;mso-border-themecolor:text1;padding:
              0cm 5.4pt 0cm 5.4pt'>
              <p class=MsoHeader style='tab-stops:center 36.0pt 220.95pt right 441.9pt'><span
              lang=ES style='font-family:"Times New Roman",serif'>¿Le indicaron el área del
              comedor?<o:p></o:p></span></p>
              </td>
              <td width=38 valign=top style='width:1.0cm;border-top:none;border-left:none;
              border-bottom:solid black 1.0pt;mso-border-bottom-themecolor:text1;
              border-right:solid black 1.0pt;mso-border-right-themecolor:text1;mso-border-top-alt:
              solid black .5pt;mso-border-top-themecolor:text1;mso-border-left-alt:solid black .5pt;
              mso-border-left-themecolor:text1;mso-border-alt:solid black .5pt;mso-border-themecolor:
              text1;padding:0cm 5.4pt 0cm 5.4pt'>
              <p class=MsoHeader style='text-align:justify;line-height:115%;tab-stops:center 36.0pt 220.95pt right 441.9pt'><span
              lang=ES style='font-family:"Times New Roman",serif'><o:p>&nbsp;</o:p></span></p>
              </td>
              <td width=47 valign=top style='width:35.4pt;border-top:none;border-left:none;
              border-bottom:solid black 1.0pt;mso-border-bottom-themecolor:text1;
              border-right:solid black 1.0pt;mso-border-right-themecolor:text1;mso-border-top-alt:
              solid black .5pt;mso-border-top-themecolor:text1;mso-border-left-alt:solid black .5pt;
              mso-border-left-themecolor:text1;mso-border-alt:solid black .5pt;mso-border-themecolor:
              text1;padding:0cm 5.4pt 0cm 5.4pt'>
              <p class=MsoHeader style='text-align:justify;line-height:115%;tab-stops:center 36.0pt 220.95pt right 441.9pt'><span
              lang=ES style='font-family:"Times New Roman",serif'><o:p>&nbsp;</o:p></span></p>
              </td>
             </tr>
             <tr style='mso-yfti-irow:4'>
              <td width=527 style='width:395.25pt;border:solid black 1.0pt;mso-border-themecolor:
              text1;border-top:none;mso-border-top-alt:solid black .5pt;mso-border-top-themecolor:
              text1;mso-border-alt:solid black .5pt;mso-border-themecolor:text1;padding:
              0cm 5.4pt 0cm 5.4pt'>
              <p class=MsoHeader style='tab-stops:center 36.0pt 220.95pt right 441.9pt'><span
              lang=ES style='font-family:"Times New Roman",serif'>¿Le dieron a conocer las
              instalaciones de los vestieres y baños?<o:p></o:p></span></p>
              </td>
              <td width=38 valign=top style='width:1.0cm;border-top:none;border-left:none;
              border-bottom:solid black 1.0pt;mso-border-bottom-themecolor:text1;
              border-right:solid black 1.0pt;mso-border-right-themecolor:text1;mso-border-top-alt:
              solid black .5pt;mso-border-top-themecolor:text1;mso-border-left-alt:solid black .5pt;
              mso-border-left-themecolor:text1;mso-border-alt:solid black .5pt;mso-border-themecolor:
              text1;padding:0cm 5.4pt 0cm 5.4pt'>
              <p class=MsoHeader style='text-align:justify;line-height:115%;tab-stops:center 36.0pt 220.95pt right 441.9pt'><span
              lang=ES style='font-family:"Times New Roman",serif'><o:p>&nbsp;</o:p></span></p>
              </td>
              <td width=47 valign=top style='width:35.4pt;border-top:none;border-left:none;
              border-bottom:solid black 1.0pt;mso-border-bottom-themecolor:text1;
              border-right:solid black 1.0pt;mso-border-right-themecolor:text1;mso-border-top-alt:
              solid black .5pt;mso-border-top-themecolor:text1;mso-border-left-alt:solid black .5pt;
              mso-border-left-themecolor:text1;mso-border-alt:solid black .5pt;mso-border-themecolor:
              text1;padding:0cm 5.4pt 0cm 5.4pt'>
              <p class=MsoHeader style='text-align:justify;line-height:115%;tab-stops:center 36.0pt 220.95pt right 441.9pt'><span
              lang=ES style='font-family:"Times New Roman",serif'><o:p>&nbsp;</o:p></span></p>
              </td>
             </tr>
             <tr style='mso-yfti-irow:5;height:15.65pt'>
              <td width=527 style='width:395.25pt;border:solid black 1.0pt;mso-border-themecolor:
              text1;border-top:none;mso-border-top-alt:solid black .5pt;mso-border-top-themecolor:
              text1;mso-border-alt:solid black .5pt;mso-border-themecolor:text1;padding:
              0cm 5.4pt 0cm 5.4pt;height:15.65pt'>
              <p class=MsoHeader style='tab-stops:center 36.0pt 220.95pt right 441.9pt'><span
              lang=ES style='font-family:"Times New Roman",serif'>¿Le indicaron las vías de
              acceso a las diferentes áreas de la empresa?<o:p></o:p></span></p>
              </td>
              <td width=38 valign=top style='width:1.0cm;border-top:none;border-left:none;
              border-bottom:solid black 1.0pt;mso-border-bottom-themecolor:text1;
              border-right:solid black 1.0pt;mso-border-right-themecolor:text1;mso-border-top-alt:
              solid black .5pt;mso-border-top-themecolor:text1;mso-border-left-alt:solid black .5pt;
              mso-border-left-themecolor:text1;mso-border-alt:solid black .5pt;mso-border-themecolor:
              text1;padding:0cm 5.4pt 0cm 5.4pt;height:15.65pt'>
              <p class=MsoHeader style='text-align:justify;line-height:115%;tab-stops:center 36.0pt 220.95pt right 441.9pt'><span
              lang=ES style='font-family:"Times New Roman",serif'><o:p>&nbsp;</o:p></span></p>
              </td>
              <td width=47 valign=top style='width:35.4pt;border-top:none;border-left:none;
              border-bottom:solid black 1.0pt;mso-border-bottom-themecolor:text1;
              border-right:solid black 1.0pt;mso-border-right-themecolor:text1;mso-border-top-alt:
              solid black .5pt;mso-border-top-themecolor:text1;mso-border-left-alt:solid black .5pt;
              mso-border-left-themecolor:text1;mso-border-alt:solid black .5pt;mso-border-themecolor:
              text1;padding:0cm 5.4pt 0cm 5.4pt;height:15.65pt'>
              <p class=MsoHeader style='text-align:justify;line-height:115%;tab-stops:center 36.0pt 220.95pt right 441.9pt'><span
              lang=ES style='font-family:"Times New Roman",serif'><o:p>&nbsp;</o:p></span></p>
              </td>
             </tr>
             <tr style='mso-yfti-irow:6'>
              <td width=527 style='width:395.25pt;border:solid black 1.0pt;mso-border-themecolor:
              text1;border-top:none;mso-border-top-alt:solid black .5pt;mso-border-top-themecolor:
              text1;mso-border-alt:solid black .5pt;mso-border-themecolor:text1;padding:
              0cm 5.4pt 0cm 5.4pt'>
              <p class=MsoHeader style='tab-stops:center 36.0pt 220.95pt right 441.9pt'><span
              lang=ES style='font-family:"Times New Roman",serif'>¿Le indicaron las vías de
              evacuación en caso de una emergencia?<o:p></o:p></span></p>
              </td>
              <td width=38 valign=top style='width:1.0cm;border-top:none;border-left:none;
              border-bottom:solid black 1.0pt;mso-border-bottom-themecolor:text1;
              border-right:solid black 1.0pt;mso-border-right-themecolor:text1;mso-border-top-alt:
              solid black .5pt;mso-border-top-themecolor:text1;mso-border-left-alt:solid black .5pt;
              mso-border-left-themecolor:text1;mso-border-alt:solid black .5pt;mso-border-themecolor:
              text1;padding:0cm 5.4pt 0cm 5.4pt'>
              <p class=MsoHeader style='text-align:justify;line-height:115%;tab-stops:center 36.0pt 220.95pt right 441.9pt'><span
              lang=ES style='font-family:"Times New Roman",serif'><o:p>&nbsp;</o:p></span></p>
              </td>
              <td width=47 valign=top style='width:35.4pt;border-top:none;border-left:none;
              border-bottom:solid black 1.0pt;mso-border-bottom-themecolor:text1;
              border-right:solid black 1.0pt;mso-border-right-themecolor:text1;mso-border-top-alt:
              solid black .5pt;mso-border-top-themecolor:text1;mso-border-left-alt:solid black .5pt;
              mso-border-left-themecolor:text1;mso-border-alt:solid black .5pt;mso-border-themecolor:
              text1;padding:0cm 5.4pt 0cm 5.4pt'>
              <p class=MsoHeader style='text-align:justify;line-height:115%;tab-stops:center 36.0pt 220.95pt right 441.9pt'><span
              lang=ES style='font-family:"Times New Roman",serif'><o:p>&nbsp;</o:p></span></p>
              </td>
             </tr>
             <tr style='mso-yfti-irow:7'>
              <td width=527 style='width:395.25pt;border:solid black 1.0pt;mso-border-themecolor:
              text1;border-top:none;mso-border-top-alt:solid black .5pt;mso-border-top-themecolor:
              text1;mso-border-alt:solid black .5pt;mso-border-themecolor:text1;padding:
              0cm 5.4pt 0cm 5.4pt'>
              <p class=MsoHeader style='tab-stops:center 36.0pt 220.95pt right 441.9pt'><span
              lang=ES style='font-family:"Times New Roman",serif'>¿Le indicaron el horario de
              trabajo?<o:p></o:p></span></p>
              </td>
              <td width=38 valign=top style='width:1.0cm;border-top:none;border-left:none;
              border-bottom:solid black 1.0pt;mso-border-bottom-themecolor:text1;
              border-right:solid black 1.0pt;mso-border-right-themecolor:text1;mso-border-top-alt:
              solid black .5pt;mso-border-top-themecolor:text1;mso-border-left-alt:solid black .5pt;
              mso-border-left-themecolor:text1;mso-border-alt:solid black .5pt;mso-border-themecolor:
              text1;padding:0cm 5.4pt 0cm 5.4pt'>
              <p class=MsoHeader style='text-align:justify;line-height:115%;tab-stops:center 36.0pt 220.95pt right 441.9pt'><span
              lang=ES style='font-family:"Times New Roman",serif'><o:p>&nbsp;</o:p></span></p>
              </td>
              <td width=47 valign=top style='width:35.4pt;border-top:none;border-left:none;
              border-bottom:solid black 1.0pt;mso-border-bottom-themecolor:text1;
              border-right:solid black 1.0pt;mso-border-right-themecolor:text1;mso-border-top-alt:
              solid black .5pt;mso-border-top-themecolor:text1;mso-border-left-alt:solid black .5pt;
              mso-border-left-themecolor:text1;mso-border-alt:solid black .5pt;mso-border-themecolor:
              text1;padding:0cm 5.4pt 0cm 5.4pt'>
              <p class=MsoHeader style='text-align:justify;line-height:115%;tab-stops:center 36.0pt 220.95pt right 441.9pt'><span
              lang=ES style='font-family:"Times New Roman",serif'><o:p>&nbsp;</o:p></span></p>
              </td>
             </tr>
             <tr style='mso-yfti-irow:8'>
              <td width=527 style='width:395.25pt;border:solid black 1.0pt;mso-border-themecolor:
              text1;border-top:none;mso-border-top-alt:solid black .5pt;mso-border-top-themecolor:
              text1;mso-border-alt:solid black .5pt;mso-border-themecolor:text1;padding:
              0cm 5.4pt 0cm 5.4pt'>
              <p class=MsoHeader style='tab-stops:center 36.0pt 220.95pt right 441.9pt'><span
              lang=ES style='font-family:"Times New Roman",serif'>¿Le impartieron
              información general de la empresa y proceso productivo y/o administrativo?<o:p></o:p></span></p>
              </td>
              <td width=38 valign=top style='width:1.0cm;border-top:none;border-left:none;
              border-bottom:solid black 1.0pt;mso-border-bottom-themecolor:text1;
              border-right:solid black 1.0pt;mso-border-right-themecolor:text1;mso-border-top-alt:
              solid black .5pt;mso-border-top-themecolor:text1;mso-border-left-alt:solid black .5pt;
              mso-border-left-themecolor:text1;mso-border-alt:solid black .5pt;mso-border-themecolor:
              text1;padding:0cm 5.4pt 0cm 5.4pt'>
              <p class=MsoHeader style='text-align:justify;line-height:115%;tab-stops:center 36.0pt 220.95pt right 441.9pt'><span
              lang=ES style='font-family:"Times New Roman",serif'><o:p>&nbsp;</o:p></span></p>
              </td>
              <td width=47 valign=top style='width:35.4pt;border-top:none;border-left:none;
              border-bottom:solid black 1.0pt;mso-border-bottom-themecolor:text1;
              border-right:solid black 1.0pt;mso-border-right-themecolor:text1;mso-border-top-alt:
              solid black .5pt;mso-border-top-themecolor:text1;mso-border-left-alt:solid black .5pt;
              mso-border-left-themecolor:text1;mso-border-alt:solid black .5pt;mso-border-themecolor:
              text1;padding:0cm 5.4pt 0cm 5.4pt'>
              <p class=MsoHeader style='text-align:justify;line-height:115%;tab-stops:center 36.0pt 220.95pt right 441.9pt'><span
              lang=ES style='font-family:"Times New Roman",serif'><o:p>&nbsp;</o:p></span></p>
              </td>
             </tr>
             <tr style='mso-yfti-irow:9'>
              <td width=527 style='width:395.25pt;border:solid black 1.0pt;mso-border-themecolor:
              text1;border-top:none;mso-border-top-alt:solid black .5pt;mso-border-top-themecolor:
              text1;mso-border-alt:solid black .5pt;mso-border-themecolor:text1;padding:
              0cm 5.4pt 0cm 5.4pt'>
              <p class=MsoHeader style='tab-stops:center 36.0pt 220.95pt right 441.9pt'><span
              lang=ES style='font-family:"Times New Roman",serif'>¿Le entregaron de forma
              escrita el procedimiento seguro de trabajo y advertencias de los riesgos
              laborales, concernientes a su puesto de trabajo?<o:p></o:p></span></p>
              </td>
              <td width=38 valign=top style='width:1.0cm;border-top:none;border-left:none;
              border-bottom:solid black 1.0pt;mso-border-bottom-themecolor:text1;
              border-right:solid black 1.0pt;mso-border-right-themecolor:text1;mso-border-top-alt:
              solid black .5pt;mso-border-top-themecolor:text1;mso-border-left-alt:solid black .5pt;
              mso-border-left-themecolor:text1;mso-border-alt:solid black .5pt;mso-border-themecolor:
              text1;padding:0cm 5.4pt 0cm 5.4pt'>
              <p class=MsoHeader style='text-align:justify;line-height:115%;tab-stops:center 36.0pt 220.95pt right 441.9pt'><span
              lang=ES style='font-family:"Times New Roman",serif'><o:p>&nbsp;</o:p></span></p>
              </td>
              <td width=47 valign=top style='width:35.4pt;border-top:none;border-left:none;
              border-bottom:solid black 1.0pt;mso-border-bottom-themecolor:text1;
              border-right:solid black 1.0pt;mso-border-right-themecolor:text1;mso-border-top-alt:
              solid black .5pt;mso-border-top-themecolor:text1;mso-border-left-alt:solid black .5pt;
              mso-border-left-themecolor:text1;mso-border-alt:solid black .5pt;mso-border-themecolor:
              text1;padding:0cm 5.4pt 0cm 5.4pt'>
              <p class=MsoHeader style='text-align:justify;line-height:115%;tab-stops:center 36.0pt 220.95pt right 441.9pt'><span
              lang=ES style='font-family:"Times New Roman",serif'><o:p>&nbsp;</o:p></span></p>
              </td>
             </tr>
             <tr style='mso-yfti-irow:10'>
              <td width=527 style='width:395.25pt;border:solid black 1.0pt;mso-border-themecolor:
              text1;border-top:none;mso-border-top-alt:solid black .5pt;mso-border-top-themecolor:
              text1;mso-border-alt:solid black .5pt;mso-border-themecolor:text1;padding:
              0cm 5.4pt 0cm 5.4pt'>
              <p class=MsoHeader style='tab-stops:center 36.0pt 220.95pt right 441.9pt'><span
              lang=ES style='font-family:"Times New Roman",serif'>¿Le ratificaron la
              importancia del uso, manejo y mantenimiento de Equipos de Protección
              Personal, en el área de trabajo y en toda la empresa?<o:p></o:p></span></p>
              </td>
              <td width=38 valign=top style='width:1.0cm;border-top:none;border-left:none;
              border-bottom:solid black 1.0pt;mso-border-bottom-themecolor:text1;
              border-right:solid black 1.0pt;mso-border-right-themecolor:text1;mso-border-top-alt:
              solid black .5pt;mso-border-top-themecolor:text1;mso-border-left-alt:solid black .5pt;
              mso-border-left-themecolor:text1;mso-border-alt:solid black .5pt;mso-border-themecolor:
              text1;padding:0cm 5.4pt 0cm 5.4pt'>
              <p class=MsoHeader style='text-align:justify;line-height:115%;tab-stops:center 36.0pt 220.95pt right 441.9pt'><span
              lang=ES style='font-family:"Times New Roman",serif'><o:p>&nbsp;</o:p></span></p>
              </td>
              <td width=47 valign=top style='width:35.4pt;border-top:none;border-left:none;
              border-bottom:solid black 1.0pt;mso-border-bottom-themecolor:text1;
              border-right:solid black 1.0pt;mso-border-right-themecolor:text1;mso-border-top-alt:
              solid black .5pt;mso-border-top-themecolor:text1;mso-border-left-alt:solid black .5pt;
              mso-border-left-themecolor:text1;mso-border-alt:solid black .5pt;mso-border-themecolor:
              text1;padding:0cm 5.4pt 0cm 5.4pt'>
              <p class=MsoHeader style='text-align:justify;line-height:115%;tab-stops:center 36.0pt 220.95pt right 441.9pt'><span
              lang=ES style='font-family:"Times New Roman",serif'><o:p>&nbsp;</o:p></span></p>
              </td>
             </tr>
             <tr style='mso-yfti-irow:11'>
              <td width=527 style='width:395.25pt;border:solid black 1.0pt;mso-border-themecolor:
              text1;border-top:none;mso-border-top-alt:solid black .5pt;mso-border-top-themecolor:
              text1;mso-border-alt:solid black .5pt;mso-border-themecolor:text1;padding:
              0cm 5.4pt 0cm 5.4pt'>
              <p class=MsoHeader style='tab-stops:center 36.0pt 220.95pt right 441.9pt'><span
              lang=ES style='font-family:"Times New Roman",serif'>¿Le ratificaron la
              importancia del cumplimiento de las Normas de Salud y Seguridad Laboral, en
              el área de trabajo y en toda Empresa?<o:p></o:p></span></p>
              </td>
              <td width=38 valign=top style='width:1.0cm;border-top:none;border-left:none;
              border-bottom:solid black 1.0pt;mso-border-bottom-themecolor:text1;
              border-right:solid black 1.0pt;mso-border-right-themecolor:text1;mso-border-top-alt:
              solid black .5pt;mso-border-top-themecolor:text1;mso-border-left-alt:solid black .5pt;
              mso-border-left-themecolor:text1;mso-border-alt:solid black .5pt;mso-border-themecolor:
              text1;padding:0cm 5.4pt 0cm 5.4pt'>
              <p class=MsoHeader style='text-align:justify;line-height:115%;tab-stops:center 36.0pt 220.95pt right 441.9pt'><span
              lang=ES style='font-family:"Times New Roman",serif'><o:p>&nbsp;</o:p></span></p>
              </td>
              <td width=47 valign=top style='width:35.4pt;border-top:none;border-left:none;
              border-bottom:solid black 1.0pt;mso-border-bottom-themecolor:text1;
              border-right:solid black 1.0pt;mso-border-right-themecolor:text1;mso-border-top-alt:
              solid black .5pt;mso-border-top-themecolor:text1;mso-border-left-alt:solid black .5pt;
              mso-border-left-themecolor:text1;mso-border-alt:solid black .5pt;mso-border-themecolor:
              text1;padding:0cm 5.4pt 0cm 5.4pt'>
              <p class=MsoHeader style='text-align:justify;line-height:115%;tab-stops:center 36.0pt 220.95pt right 441.9pt'><span
              lang=ES style='font-family:"Times New Roman",serif'><o:p>&nbsp;</o:p></span></p>
              </td>
             </tr>
             <tr style='mso-yfti-irow:12'>
              <td width=527 style='width:395.25pt;border:solid black 1.0pt;mso-border-themecolor:
              text1;border-top:none;mso-border-top-alt:solid black .5pt;mso-border-top-themecolor:
              text1;mso-border-alt:solid black .5pt;mso-border-themecolor:text1;padding:
              0cm 5.4pt 0cm 5.4pt'>
              <p class=MsoHeader style='tab-stops:center 36.0pt 220.95pt right 441.9pt'><span
              lang=ES style='font-family:"Times New Roman",serif'>¿Le dieron a conocer la
              ubicación del puesto de trabajo?<o:p></o:p></span></p>
              </td>
              <td width=38 valign=top style='width:1.0cm;border-top:none;border-left:none;
              border-bottom:solid black 1.0pt;mso-border-bottom-themecolor:text1;
              border-right:solid black 1.0pt;mso-border-right-themecolor:text1;mso-border-top-alt:
              solid black .5pt;mso-border-top-themecolor:text1;mso-border-left-alt:solid black .5pt;
              mso-border-left-themecolor:text1;mso-border-alt:solid black .5pt;mso-border-themecolor:
              text1;padding:0cm 5.4pt 0cm 5.4pt'>
              <p class=MsoHeader style='text-align:justify;line-height:115%;tab-stops:center 36.0pt 220.95pt right 441.9pt'><span
              lang=ES style='font-family:"Times New Roman",serif'><o:p>&nbsp;</o:p></span></p>
              </td>
              <td width=47 valign=top style='width:35.4pt;border-top:none;border-left:none;
              border-bottom:solid black 1.0pt;mso-border-bottom-themecolor:text1;
              border-right:solid black 1.0pt;mso-border-right-themecolor:text1;mso-border-top-alt:
              solid black .5pt;mso-border-top-themecolor:text1;mso-border-left-alt:solid black .5pt;
              mso-border-left-themecolor:text1;mso-border-alt:solid black .5pt;mso-border-themecolor:
              text1;padding:0cm 5.4pt 0cm 5.4pt'>
              <p class=MsoHeader style='text-align:justify;line-height:115%;tab-stops:center 36.0pt 220.95pt right 441.9pt'><span
              lang=ES style='font-family:"Times New Roman",serif'><o:p>&nbsp;</o:p></span></p>
              </td>
             </tr>
             <tr style='mso-yfti-irow:13'>
              <td width=527 style='width:395.25pt;border:solid black 1.0pt;mso-border-themecolor:
              text1;border-top:none;mso-border-top-alt:solid black .5pt;mso-border-top-themecolor:
              text1;mso-border-alt:solid black .5pt;mso-border-themecolor:text1;padding:
              0cm 5.4pt 0cm 5.4pt'>
              <p class=MsoHeader style='tab-stops:center 36.0pt 220.95pt right 441.9pt'><span
              lang=ES style='font-family:"Times New Roman",serif'>¿Le indicaron que existe
              un Comité Paritario de y Seguridad y Salud en el Trabajo en la empresa?<o:p></o:p></span></p>
              </td>
              <td width=38 valign=top style='width:1.0cm;border-top:none;border-left:none;
              border-bottom:solid black 1.0pt;mso-border-bottom-themecolor:text1;
              border-right:solid black 1.0pt;mso-border-right-themecolor:text1;mso-border-top-alt:
              solid black .5pt;mso-border-top-themecolor:text1;mso-border-left-alt:solid black .5pt;
              mso-border-left-themecolor:text1;mso-border-alt:solid black .5pt;mso-border-themecolor:
              text1;padding:0cm 5.4pt 0cm 5.4pt'>
              <p class=MsoHeader style='text-align:justify;line-height:115%;tab-stops:center 36.0pt 220.95pt right 441.9pt'><span
              lang=ES style='font-family:"Times New Roman",serif'><o:p>&nbsp;</o:p></span></p>
              </td>
              <td width=47 valign=top style='width:35.4pt;border-top:none;border-left:none;
              border-bottom:solid black 1.0pt;mso-border-bottom-themecolor:text1;
              border-right:solid black 1.0pt;mso-border-right-themecolor:text1;mso-border-top-alt:
              solid black .5pt;mso-border-top-themecolor:text1;mso-border-left-alt:solid black .5pt;
              mso-border-left-themecolor:text1;mso-border-alt:solid black .5pt;mso-border-themecolor:
              text1;padding:0cm 5.4pt 0cm 5.4pt'>
              <p class=MsoHeader style='text-align:justify;line-height:115%;tab-stops:center 36.0pt 220.95pt right 441.9pt'><span
              lang=ES style='font-family:"Times New Roman",serif'><o:p>&nbsp;</o:p></span></p>
              </td>
             </tr>
             <tr style='mso-yfti-irow:14'>
              <td width=527 style='width:395.25pt;border:solid black 1.0pt;mso-border-themecolor:
              text1;border-top:none;mso-border-top-alt:solid black .5pt;mso-border-top-themecolor:
              text1;mso-border-alt:solid black .5pt;mso-border-themecolor:text1;padding:
              0cm 5.4pt 0cm 5.4pt'>
              <p class=MsoHeader style='tab-stops:center 36.0pt 220.95pt right 441.9pt'><span
              lang=ES style='font-family:"Times New Roman",serif'>¿Le informaron sobre el
              comité de convivencia laboral?<o:p></o:p></span></p>
              </td>
              <td width=38 valign=top style='width:1.0cm;border-top:none;border-left:none;
              border-bottom:solid black 1.0pt;mso-border-bottom-themecolor:text1;
              border-right:solid black 1.0pt;mso-border-right-themecolor:text1;mso-border-top-alt:
              solid black .5pt;mso-border-top-themecolor:text1;mso-border-left-alt:solid black .5pt;
              mso-border-left-themecolor:text1;mso-border-alt:solid black .5pt;mso-border-themecolor:
              text1;padding:0cm 5.4pt 0cm 5.4pt'>
              <p class=MsoHeader style='text-align:justify;line-height:115%;tab-stops:center 36.0pt 220.95pt right 441.9pt'><span
              lang=ES style='font-family:"Times New Roman",serif'><o:p>&nbsp;</o:p></span></p>
              </td>
              <td width=47 valign=top style='width:35.4pt;border-top:none;border-left:none;
              border-bottom:solid black 1.0pt;mso-border-bottom-themecolor:text1;
              border-right:solid black 1.0pt;mso-border-right-themecolor:text1;mso-border-top-alt:
              solid black .5pt;mso-border-top-themecolor:text1;mso-border-left-alt:solid black .5pt;
              mso-border-left-themecolor:text1;mso-border-alt:solid black .5pt;mso-border-themecolor:
              text1;padding:0cm 5.4pt 0cm 5.4pt'>
              <p class=MsoHeader style='text-align:justify;line-height:115%;tab-stops:center 36.0pt 220.95pt right 441.9pt'><span
              lang=ES style='font-family:"Times New Roman",serif'><o:p>&nbsp;</o:p></span></p>
              </td>
             </tr>
             <tr style='mso-yfti-irow:15'>
              <td width=527 style='width:395.25pt;border:solid black 1.0pt;mso-border-themecolor:
              text1;border-top:none;mso-border-top-alt:solid black .5pt;mso-border-top-themecolor:
              text1;mso-border-alt:solid black .5pt;mso-border-themecolor:text1;padding:
              0cm 5.4pt 0cm 5.4pt'>
              <p class=MsoHeader style='tab-stops:center 36.0pt 220.95pt right 441.9pt'><span
              lang=ES style='font-family:"Times New Roman",serif'>¿Le presentaron al
              Supervisor de su área de trabajo?<o:p></o:p></span></p>
              </td>
              <td width=38 valign=top style='width:1.0cm;border-top:none;border-left:none;
              border-bottom:solid black 1.0pt;mso-border-bottom-themecolor:text1;
              border-right:solid black 1.0pt;mso-border-right-themecolor:text1;mso-border-top-alt:
              solid black .5pt;mso-border-top-themecolor:text1;mso-border-left-alt:solid black .5pt;
              mso-border-left-themecolor:text1;mso-border-alt:solid black .5pt;mso-border-themecolor:
              text1;padding:0cm 5.4pt 0cm 5.4pt'>
              <p class=MsoHeader style='text-align:justify;line-height:115%;tab-stops:center 36.0pt 220.95pt right 441.9pt'><span
              lang=ES style='font-family:"Times New Roman",serif'><o:p>&nbsp;</o:p></span></p>
              </td>
              <td width=47 valign=top style='width:35.4pt;border-top:none;border-left:none;
              border-bottom:solid black 1.0pt;mso-border-bottom-themecolor:text1;
              border-right:solid black 1.0pt;mso-border-right-themecolor:text1;mso-border-top-alt:
              solid black .5pt;mso-border-top-themecolor:text1;mso-border-left-alt:solid black .5pt;
              mso-border-left-themecolor:text1;mso-border-alt:solid black .5pt;mso-border-themecolor:
              text1;padding:0cm 5.4pt 0cm 5.4pt'>
              <p class=MsoHeader style='text-align:justify;line-height:115%;tab-stops:center 36.0pt 220.95pt right 441.9pt'><span
              lang=ES style='font-family:"Times New Roman",serif'><o:p>&nbsp;</o:p></span></p>
              </td>
             </tr>
             <tr style='mso-yfti-irow:16'>
              <td width=527 style='width:395.25pt;border:solid black 1.0pt;mso-border-themecolor:
              text1;border-top:none;mso-border-top-alt:solid black .5pt;mso-border-top-themecolor:
              text1;mso-border-alt:solid black .5pt;mso-border-themecolor:text1;padding:
              0cm 5.4pt 0cm 5.4pt'>
              <p class=MsoHeader style='tab-stops:center 36.0pt 220.95pt right 441.9pt'><span
              lang=ES style='font-family:"Times New Roman",serif'>¿Le indicaron la ubicación
              de los extintores contra incendio?<o:p></o:p></span></p>
              </td>
              <td width=38 valign=top style='width:1.0cm;border-top:none;border-left:none;
              border-bottom:solid black 1.0pt;mso-border-bottom-themecolor:text1;
              border-right:solid black 1.0pt;mso-border-right-themecolor:text1;mso-border-top-alt:
              solid black .5pt;mso-border-top-themecolor:text1;mso-border-left-alt:solid black .5pt;
              mso-border-left-themecolor:text1;mso-border-alt:solid black .5pt;mso-border-themecolor:
              text1;padding:0cm 5.4pt 0cm 5.4pt'>
              <p class=MsoHeader style='text-align:justify;line-height:115%;tab-stops:center 36.0pt 220.95pt right 441.9pt'><span
              lang=ES style='font-family:"Times New Roman",serif'><o:p>&nbsp;</o:p></span></p>
              </td>
              <td width=47 valign=top style='width:35.4pt;border-top:none;border-left:none;
              border-bottom:solid black 1.0pt;mso-border-bottom-themecolor:text1;
              border-right:solid black 1.0pt;mso-border-right-themecolor:text1;mso-border-top-alt:
              solid black .5pt;mso-border-top-themecolor:text1;mso-border-left-alt:solid black .5pt;
              mso-border-left-themecolor:text1;mso-border-alt:solid black .5pt;mso-border-themecolor:
              text1;padding:0cm 5.4pt 0cm 5.4pt'>
              <p class=MsoHeader style='text-align:justify;line-height:115%;tab-stops:center 36.0pt 220.95pt right 441.9pt'><span
              lang=ES style='font-family:"Times New Roman",serif'><o:p>&nbsp;</o:p></span></p>
              </td>
             </tr>
             <tr style='mso-yfti-irow:17'>
              <td width=527 style='width:395.25pt;border:solid black 1.0pt;mso-border-themecolor:
              text1;border-top:none;mso-border-top-alt:solid black .5pt;mso-border-top-themecolor:
              text1;mso-border-alt:solid black .5pt;mso-border-themecolor:text1;padding:
              0cm 5.4pt 0cm 5.4pt'>
              <p class=MsoHeader style='tab-stops:center 36.0pt 220.95pt right 441.9pt'><span
              lang=ES style='font-family:"Times New Roman",serif'>¿Le indicaron que existe un
              botiquín de primeros auxilios?<o:p></o:p></span></p>
              </td>
              <td width=38 valign=top style='width:1.0cm;border-top:none;border-left:none;
              border-bottom:solid black 1.0pt;mso-border-bottom-themecolor:text1;
              border-right:solid black 1.0pt;mso-border-right-themecolor:text1;mso-border-top-alt:
              solid black .5pt;mso-border-top-themecolor:text1;mso-border-left-alt:solid black .5pt;
              mso-border-left-themecolor:text1;mso-border-alt:solid black .5pt;mso-border-themecolor:
              text1;padding:0cm 5.4pt 0cm 5.4pt'>
              <p class=MsoHeader style='text-align:justify;line-height:115%;tab-stops:center 36.0pt 220.95pt right 441.9pt'><span
              lang=ES style='font-family:"Times New Roman",serif'><o:p>&nbsp;</o:p></span></p>
              </td>
              <td width=47 valign=top style='width:35.4pt;border-top:none;border-left:none;
              border-bottom:solid black 1.0pt;mso-border-bottom-themecolor:text1;
              border-right:solid black 1.0pt;mso-border-right-themecolor:text1;mso-border-top-alt:
              solid black .5pt;mso-border-top-themecolor:text1;mso-border-left-alt:solid black .5pt;
              mso-border-left-themecolor:text1;mso-border-alt:solid black .5pt;mso-border-themecolor:
              text1;padding:0cm 5.4pt 0cm 5.4pt'>
              <p class=MsoHeader style='text-align:justify;line-height:115%;tab-stops:center 36.0pt 220.95pt right 441.9pt'><span
              lang=ES style='font-family:"Times New Roman",serif'><o:p>&nbsp;</o:p></span></p>
              </td>
             </tr>
             <tr style='mso-yfti-irow:18'>
              <td width=527 style='width:395.25pt;border:solid black 1.0pt;mso-border-themecolor:
              text1;border-top:none;mso-border-top-alt:solid black .5pt;mso-border-top-themecolor:
              text1;mso-border-alt:solid black .5pt;mso-border-themecolor:text1;padding:
              0cm 5.4pt 0cm 5.4pt'>
              <p class=MsoHeader style='tab-stops:center 36.0pt 220.95pt right 441.9pt'><span
              lang=ES style='font-family:"Times New Roman",serif'>¿ Le presentaron a los
              integrantes de las brigadas de emergencias<o:p></o:p></span></p>
              </td>
              <td width=38 valign=top style='width:1.0cm;border-top:none;border-left:none;
              border-bottom:solid black 1.0pt;mso-border-bottom-themecolor:text1;
              border-right:solid black 1.0pt;mso-border-right-themecolor:text1;mso-border-top-alt:
              solid black .5pt;mso-border-top-themecolor:text1;mso-border-left-alt:solid black .5pt;
              mso-border-left-themecolor:text1;mso-border-alt:solid black .5pt;mso-border-themecolor:
              text1;padding:0cm 5.4pt 0cm 5.4pt'>
              <p class=MsoHeader style='text-align:justify;line-height:150%;tab-stops:center 36.0pt 220.95pt right 441.9pt'><span
              lang=ES style='font-family:"Times New Roman",serif'><o:p>&nbsp;</o:p></span></p>
              </td>
              <td width=47 valign=top style='width:35.4pt;border-top:none;border-left:none;
              border-bottom:solid black 1.0pt;mso-border-bottom-themecolor:text1;
              border-right:solid black 1.0pt;mso-border-right-themecolor:text1;mso-border-top-alt:
              solid black .5pt;mso-border-top-themecolor:text1;mso-border-left-alt:solid black .5pt;
              mso-border-left-themecolor:text1;mso-border-alt:solid black .5pt;mso-border-themecolor:
              text1;padding:0cm 5.4pt 0cm 5.4pt'>
              <p class=MsoHeader style='text-align:justify;line-height:150%;tab-stops:center 36.0pt 220.95pt right 441.9pt'><span
              lang=ES style='font-family:"Times New Roman",serif'><o:p>&nbsp;</o:p></span></p>
              </td>
             </tr>
             <tr style='mso-yfti-irow:19'>
              <td width=527 style='width:395.25pt;border:solid black 1.0pt;mso-border-themecolor:
              text1;border-top:none;mso-border-top-alt:solid black .5pt;mso-border-top-themecolor:
              text1;mso-border-alt:solid black .5pt;mso-border-themecolor:text1;padding:
              0cm 5.4pt 0cm 5.4pt'>
              <p class=MsoHeader style='tab-stops:center 36.0pt 220.95pt right 441.9pt'><span
              lang=ES style='font-family:"Times New Roman",serif'>¿Le presentaron a sus
              compañeros de trabajo?<o:p></o:p></span></p>
              </td>
              <td width=38 valign=top style='width:1.0cm;border-top:none;border-left:none;
              border-bottom:solid black 1.0pt;mso-border-bottom-themecolor:text1;
              border-right:solid black 1.0pt;mso-border-right-themecolor:text1;mso-border-top-alt:
              solid black .5pt;mso-border-top-themecolor:text1;mso-border-left-alt:solid black .5pt;
              mso-border-left-themecolor:text1;mso-border-alt:solid black .5pt;mso-border-themecolor:
              text1;padding:0cm 5.4pt 0cm 5.4pt'>
              <p class=MsoHeader style='text-align:justify;line-height:150%;tab-stops:center 36.0pt 220.95pt right 441.9pt'><span
              lang=ES style='font-family:"Times New Roman",serif'><o:p>&nbsp;</o:p></span></p>
              </td>
              <td width=47 valign=top style='width:35.4pt;border-top:none;border-left:none;
              border-bottom:solid black 1.0pt;mso-border-bottom-themecolor:text1;
              border-right:solid black 1.0pt;mso-border-right-themecolor:text1;mso-border-top-alt:
              solid black .5pt;mso-border-top-themecolor:text1;mso-border-left-alt:solid black .5pt;
              mso-border-left-themecolor:text1;mso-border-alt:solid black .5pt;mso-border-themecolor:
              text1;padding:0cm 5.4pt 0cm 5.4pt'>
              <p class=MsoHeader style='text-align:justify;line-height:150%;tab-stops:center 36.0pt 220.95pt right 441.9pt'><span
              lang=ES style='font-family:"Times New Roman",serif'><o:p>&nbsp;</o:p></span></p>
              </td>
             </tr>
             <tr style='mso-yfti-irow:20'>
              <td width=527 style='width:395.25pt;border:solid black 1.0pt;mso-border-themecolor:
              text1;border-top:none;mso-border-top-alt:solid black .5pt;mso-border-top-themecolor:
              text1;mso-border-alt:solid black .5pt;mso-border-themecolor:text1;padding:
              0cm 5.4pt 0cm 5.4pt'>
              <p class=MsoHeader style='tab-stops:center 36.0pt 220.95pt right 441.9pt'><span
              lang=ES style='font-family:"Times New Roman",serif'>¿ Le Explicaron<span
              style='mso-spacerun:yes'>  </span>el reglamento de Higiene y Seguridad
              Industrial<o:p></o:p></span></p>
              </td>
              <td width=38 valign=top style='width:1.0cm;border-top:none;border-left:none;
              border-bottom:solid black 1.0pt;mso-border-bottom-themecolor:text1;
              border-right:solid black 1.0pt;mso-border-right-themecolor:text1;mso-border-top-alt:
              solid black .5pt;mso-border-top-themecolor:text1;mso-border-left-alt:solid black .5pt;
              mso-border-left-themecolor:text1;mso-border-alt:solid black .5pt;mso-border-themecolor:
              text1;padding:0cm 5.4pt 0cm 5.4pt'>
              <p class=MsoHeader style='text-align:justify;line-height:150%;tab-stops:center 36.0pt 220.95pt right 441.9pt'><span
              lang=ES style='font-family:"Times New Roman",serif'><o:p>&nbsp;</o:p></span></p>
              </td>
              <td width=47 valign=top style='width:35.4pt;border-top:none;border-left:none;
              border-bottom:solid black 1.0pt;mso-border-bottom-themecolor:text1;
              border-right:solid black 1.0pt;mso-border-right-themecolor:text1;mso-border-top-alt:
              solid black .5pt;mso-border-top-themecolor:text1;mso-border-left-alt:solid black .5pt;
              mso-border-left-themecolor:text1;mso-border-alt:solid black .5pt;mso-border-themecolor:
              text1;padding:0cm 5.4pt 0cm 5.4pt'>
              <p class=MsoHeader style='text-align:justify;line-height:150%;tab-stops:center 36.0pt 220.95pt right 441.9pt'><span
              lang=ES style='font-family:"Times New Roman",serif'><o:p>&nbsp;</o:p></span></p>
              </td>
             </tr>
             <tr style='mso-yfti-irow:21'>
              <td width=527 style='width:395.25pt;border:solid black 1.0pt;mso-border-themecolor:
              text1;border-top:none;mso-border-top-alt:solid black .5pt;mso-border-top-themecolor:
              text1;mso-border-alt:solid black .5pt;mso-border-themecolor:text1;padding:
              0cm 5.4pt 0cm 5.4pt'>
              <p class=MsoHeader style='tab-stops:center 36.0pt 220.95pt right 441.9pt'><span
              lang=ES style='font-family:"Times New Roman",serif'>¿Le explicaron la
              definición de riesgos, y su clasificación?<o:p></o:p></span></p>
              </td>
              <td width=38 valign=top style='width:1.0cm;border-top:none;border-left:none;
              border-bottom:solid black 1.0pt;mso-border-bottom-themecolor:text1;
              border-right:solid black 1.0pt;mso-border-right-themecolor:text1;mso-border-top-alt:
              solid black .5pt;mso-border-top-themecolor:text1;mso-border-left-alt:solid black .5pt;
              mso-border-left-themecolor:text1;mso-border-alt:solid black .5pt;mso-border-themecolor:
              text1;padding:0cm 5.4pt 0cm 5.4pt'>
              <p class=MsoHeader style='text-align:justify;line-height:150%;tab-stops:center 36.0pt 220.95pt right 441.9pt'><span
              lang=ES style='font-family:"Times New Roman",serif'><o:p>&nbsp;</o:p></span></p>
              </td>
              <td width=47 valign=top style='width:35.4pt;border-top:none;border-left:none;
              border-bottom:solid black 1.0pt;mso-border-bottom-themecolor:text1;
              border-right:solid black 1.0pt;mso-border-right-themecolor:text1;mso-border-top-alt:
              solid black .5pt;mso-border-top-themecolor:text1;mso-border-left-alt:solid black .5pt;
              mso-border-left-themecolor:text1;mso-border-alt:solid black .5pt;mso-border-themecolor:
              text1;padding:0cm 5.4pt 0cm 5.4pt'>
              <p class=MsoHeader style='text-align:justify;line-height:150%;tab-stops:center 36.0pt 220.95pt right 441.9pt'><span
              lang=ES style='font-family:"Times New Roman",serif'><o:p>&nbsp;</o:p></span></p>
              </td>
             </tr>
             <tr style='mso-yfti-irow:22'>
              <td width=527 style='width:395.25pt;border:solid black 1.0pt;mso-border-themecolor:
              text1;border-top:none;mso-border-top-alt:solid black .5pt;mso-border-top-themecolor:
              text1;mso-border-alt:solid black .5pt;mso-border-themecolor:text1;padding:
              0cm 5.4pt 0cm 5.4pt'>
              <p class=MsoHeader style='tab-stops:center 36.0pt 220.95pt right 441.9pt'><span
              lang=ES style='font-family:"Times New Roman",serif'>¿Le indicaron el concepto
              de accidente de trabajo y las causas directas e indirectas?<o:p></o:p></span></p>
              </td>
              <td width=38 valign=top style='width:1.0cm;border-top:none;border-left:none;
              border-bottom:solid black 1.0pt;mso-border-bottom-themecolor:text1;
              border-right:solid black 1.0pt;mso-border-right-themecolor:text1;mso-border-top-alt:
              solid black .5pt;mso-border-top-themecolor:text1;mso-border-left-alt:solid black .5pt;
              mso-border-left-themecolor:text1;mso-border-alt:solid black .5pt;mso-border-themecolor:
              text1;padding:0cm 5.4pt 0cm 5.4pt'>
              <p class=MsoHeader style='text-align:justify;line-height:150%;tab-stops:center 36.0pt 220.95pt right 441.9pt'><span
              lang=ES style='font-family:"Times New Roman",serif'><o:p>&nbsp;</o:p></span></p>
              </td>
              <td width=47 valign=top style='width:35.4pt;border-top:none;border-left:none;
              border-bottom:solid black 1.0pt;mso-border-bottom-themecolor:text1;
              border-right:solid black 1.0pt;mso-border-right-themecolor:text1;mso-border-top-alt:
              solid black .5pt;mso-border-top-themecolor:text1;mso-border-left-alt:solid black .5pt;
              mso-border-left-themecolor:text1;mso-border-alt:solid black .5pt;mso-border-themecolor:
              text1;padding:0cm 5.4pt 0cm 5.4pt'>
              <p class=MsoHeader style='text-align:justify;line-height:150%;tab-stops:center 36.0pt 220.95pt right 441.9pt'><span
              lang=ES style='font-family:"Times New Roman",serif'><o:p>&nbsp;</o:p></span></p>
              </td>
             </tr>
             <tr style='mso-yfti-irow:23'>
              <td width=527 style='width:395.25pt;border:solid black 1.0pt;mso-border-themecolor:
              text1;border-top:none;mso-border-top-alt:solid black .5pt;mso-border-top-themecolor:
              text1;mso-border-alt:solid black .5pt;mso-border-themecolor:text1;padding:
              0cm 5.4pt 0cm 5.4pt'>
              <p class=MsoHeader style='tab-stops:center 36.0pt 220.95pt right 441.9pt'><span
              lang=ES style='font-family:"Times New Roman",serif'>¿Le explicaron los tipos
              de enfermedad laboral?<o:p></o:p></span></p>
              </td>
              <td width=38 valign=top style='width:1.0cm;border-top:none;border-left:none;
              border-bottom:solid black 1.0pt;mso-border-bottom-themecolor:text1;
              border-right:solid black 1.0pt;mso-border-right-themecolor:text1;mso-border-top-alt:
              solid black .5pt;mso-border-top-themecolor:text1;mso-border-left-alt:solid black .5pt;
              mso-border-left-themecolor:text1;mso-border-alt:solid black .5pt;mso-border-themecolor:
              text1;padding:0cm 5.4pt 0cm 5.4pt'>
              <p class=MsoHeader style='text-align:justify;line-height:150%;tab-stops:center 36.0pt 220.95pt right 441.9pt'><span
              lang=ES style='font-family:"Times New Roman",serif'><o:p>&nbsp;</o:p></span></p>
              </td>
              <td width=47 valign=top style='width:35.4pt;border-top:none;border-left:none;
              border-bottom:solid black 1.0pt;mso-border-bottom-themecolor:text1;
              border-right:solid black 1.0pt;mso-border-right-themecolor:text1;mso-border-top-alt:
              solid black .5pt;mso-border-top-themecolor:text1;mso-border-left-alt:solid black .5pt;
              mso-border-left-themecolor:text1;mso-border-alt:solid black .5pt;mso-border-themecolor:
              text1;padding:0cm 5.4pt 0cm 5.4pt'>
              <p class=MsoHeader style='text-align:justify;line-height:150%;tab-stops:center 36.0pt 220.95pt right 441.9pt'><span
              lang=ES style='font-family:"Times New Roman",serif'><o:p>&nbsp;</o:p></span></p>
              </td>
             </tr>
             <tr style='mso-yfti-irow:24'>
              <td width=527 style='width:395.25pt;border:solid black 1.0pt;mso-border-themecolor:
              text1;border-top:none;mso-border-top-alt:solid black .5pt;mso-border-top-themecolor:
              text1;mso-border-alt:solid black .5pt;mso-border-themecolor:text1;padding:
              0cm 5.4pt 0cm 5.4pt'>
              <p class=MsoHeader style='tab-stops:center 36.0pt 220.95pt right 441.9pt'><span
              lang=ES style='font-family:"Times New Roman",serif'>¿Le hablaron sobre
              higiene postural?<o:p></o:p></span></p>
              </td>
              <td width=38 valign=top style='width:1.0cm;border-top:none;border-left:none;
              border-bottom:solid black 1.0pt;mso-border-bottom-themecolor:text1;
              border-right:solid black 1.0pt;mso-border-right-themecolor:text1;mso-border-top-alt:
              solid black .5pt;mso-border-top-themecolor:text1;mso-border-left-alt:solid black .5pt;
              mso-border-left-themecolor:text1;mso-border-alt:solid black .5pt;mso-border-themecolor:
              text1;padding:0cm 5.4pt 0cm 5.4pt'>
              <p class=MsoHeader style='text-align:justify;line-height:150%;tab-stops:center 36.0pt 220.95pt right 441.9pt'><span
              lang=ES style='font-family:"Times New Roman",serif'><o:p>&nbsp;</o:p></span></p>
              </td>
              <td width=47 valign=top style='width:35.4pt;border-top:none;border-left:none;
              border-bottom:solid black 1.0pt;mso-border-bottom-themecolor:text1;
              border-right:solid black 1.0pt;mso-border-right-themecolor:text1;mso-border-top-alt:
              solid black .5pt;mso-border-top-themecolor:text1;mso-border-left-alt:solid black .5pt;
              mso-border-left-themecolor:text1;mso-border-alt:solid black .5pt;mso-border-themecolor:
              text1;padding:0cm 5.4pt 0cm 5.4pt'>
              <p class=MsoHeader style='text-align:justify;line-height:150%;tab-stops:center 36.0pt 220.95pt right 441.9pt'><span
              lang=ES style='font-family:"Times New Roman",serif'><o:p>&nbsp;</o:p></span></p>
              </td>
             </tr>
             <tr style='mso-yfti-irow:25'>
              <td width=527 style='width:395.25pt;border:solid black 1.0pt;mso-border-themecolor:
              text1;border-top:none;mso-border-top-alt:solid black .5pt;mso-border-top-themecolor:
              text1;mso-border-alt:solid black .5pt;mso-border-themecolor:text1;padding:
              0cm 5.4pt 0cm 5.4pt'>
              <p class=MsoHeader style='tab-stops:center 36.0pt 220.95pt right 441.9pt'><span
              lang=ES style='font-family:"Times New Roman",serif'>¿Hicieron prácticas sobre
              la correcta manipulación de cargas?<o:p></o:p></span></p>
              </td>
              <td width=38 valign=top style='width:1.0cm;border-top:none;border-left:none;
              border-bottom:solid black 1.0pt;mso-border-bottom-themecolor:text1;
              border-right:solid black 1.0pt;mso-border-right-themecolor:text1;mso-border-top-alt:
              solid black .5pt;mso-border-top-themecolor:text1;mso-border-left-alt:solid black .5pt;
              mso-border-left-themecolor:text1;mso-border-alt:solid black .5pt;mso-border-themecolor:
              text1;padding:0cm 5.4pt 0cm 5.4pt'>
              <p class=MsoHeader style='text-align:justify;line-height:150%;tab-stops:center 36.0pt 220.95pt right 441.9pt'><span
              lang=ES style='font-family:"Times New Roman",serif'><o:p>&nbsp;</o:p></span></p>
              </td>
              <td width=47 valign=top style='width:35.4pt;border-top:none;border-left:none;
              border-bottom:solid black 1.0pt;mso-border-bottom-themecolor:text1;
              border-right:solid black 1.0pt;mso-border-right-themecolor:text1;mso-border-top-alt:
              solid black .5pt;mso-border-top-themecolor:text1;mso-border-left-alt:solid black .5pt;
              mso-border-left-themecolor:text1;mso-border-alt:solid black .5pt;mso-border-themecolor:
              text1;padding:0cm 5.4pt 0cm 5.4pt'>
              <p class=MsoHeader style='text-align:justify;line-height:150%;tab-stops:center 36.0pt 220.95pt right 441.9pt'><span
              lang=ES style='font-family:"Times New Roman",serif'><o:p>&nbsp;</o:p></span></p>
              </td>
             </tr>
             <tr style='mso-yfti-irow:26'>
              <td width=527 style='width:395.25pt;border:solid black 1.0pt;mso-border-themecolor:
              text1;border-top:none;mso-border-top-alt:solid black .5pt;mso-border-top-themecolor:
              text1;mso-border-alt:solid black .5pt;mso-border-themecolor:text1;padding:
              0cm 5.4pt 0cm 5.4pt'>
              <p class=MsoHeader style='tab-stops:center 36.0pt 220.95pt right 441.9pt'><span
              lang=ES style='font-family:"Times New Roman",serif'>¿Practicó el uso adecuado
              e los equipos de Protección personal?<o:p></o:p></span></p>
              </td>
              <td width=38 valign=top style='width:1.0cm;border-top:none;border-left:none;
              border-bottom:solid black 1.0pt;mso-border-bottom-themecolor:text1;
              border-right:solid black 1.0pt;mso-border-right-themecolor:text1;mso-border-top-alt:
              solid black .5pt;mso-border-top-themecolor:text1;mso-border-left-alt:solid black .5pt;
              mso-border-left-themecolor:text1;mso-border-alt:solid black .5pt;mso-border-themecolor:
              text1;padding:0cm 5.4pt 0cm 5.4pt'>
              <p class=MsoHeader style='text-align:justify;line-height:150%;tab-stops:center 36.0pt 220.95pt right 441.9pt'><span
              lang=ES style='font-family:"Times New Roman",serif'><o:p>&nbsp;</o:p></span></p>
              </td>
              <td width=47 valign=top style='width:35.4pt;border-top:none;border-left:none;
              border-bottom:solid black 1.0pt;mso-border-bottom-themecolor:text1;
              border-right:solid black 1.0pt;mso-border-right-themecolor:text1;mso-border-top-alt:
              solid black .5pt;mso-border-top-themecolor:text1;mso-border-left-alt:solid black .5pt;
              mso-border-left-themecolor:text1;mso-border-alt:solid black .5pt;mso-border-themecolor:
              text1;padding:0cm 5.4pt 0cm 5.4pt'>
              <p class=MsoHeader style='text-align:justify;line-height:150%;tab-stops:center 36.0pt 220.95pt right 441.9pt'><span
              lang=ES style='font-family:"Times New Roman",serif'><o:p>&nbsp;</o:p></span></p>
              </td>
             </tr>
             <tr style='mso-yfti-irow:27'>
              <td width=527 style='width:395.25pt;border:solid black 1.0pt;mso-border-themecolor:
              text1;border-top:none;mso-border-top-alt:solid black .5pt;mso-border-top-themecolor:
              text1;mso-border-alt:solid black .5pt;mso-border-themecolor:text1;padding:
              0cm 5.4pt 0cm 5.4pt'>
              <p class=MsoHeader style='tab-stops:center 36.0pt 220.95pt right 441.9pt'><span
              lang=ES style='font-family:"Times New Roman",serif'>¿Se le explicó sobre las
              pausas activas a practicar<span style='mso-spacerun:yes'>  </span>durante la
              jornada de trabajo?<o:p></o:p></span></p>
              </td>
              <td width=38 valign=top style='width:1.0cm;border-top:none;border-left:none;
              border-bottom:solid black 1.0pt;mso-border-bottom-themecolor:text1;
              border-right:solid black 1.0pt;mso-border-right-themecolor:text1;mso-border-top-alt:
              solid black .5pt;mso-border-top-themecolor:text1;mso-border-left-alt:solid black .5pt;
              mso-border-left-themecolor:text1;mso-border-alt:solid black .5pt;mso-border-themecolor:
              text1;padding:0cm 5.4pt 0cm 5.4pt'>
              <p class=MsoHeader style='text-align:justify;line-height:150%;tab-stops:center 36.0pt 220.95pt right 441.9pt'><span
              lang=ES style='font-family:"Times New Roman",serif'><o:p>&nbsp;</o:p></span></p>
              </td>
              <td width=47 valign=top style='width:35.4pt;border-top:none;border-left:none;
              border-bottom:solid black 1.0pt;mso-border-bottom-themecolor:text1;
              border-right:solid black 1.0pt;mso-border-right-themecolor:text1;mso-border-top-alt:
              solid black .5pt;mso-border-top-themecolor:text1;mso-border-left-alt:solid black .5pt;
              mso-border-left-themecolor:text1;mso-border-alt:solid black .5pt;mso-border-themecolor:
              text1;padding:0cm 5.4pt 0cm 5.4pt'>
              <p class=MsoHeader style='text-align:justify;line-height:150%;tab-stops:center 36.0pt 220.95pt right 441.9pt'><span
              lang=ES style='font-family:"Times New Roman",serif'><o:p>&nbsp;</o:p></span></p>
              </td>
             </tr>
             <tr style='mso-yfti-irow:28;mso-yfti-lastrow:yes'>
              <td width=527 style='width:395.25pt;border:solid black 1.0pt;mso-border-themecolor:
              text1;border-top:none;mso-border-top-alt:solid black .5pt;mso-border-top-themecolor:
              text1;mso-border-alt:solid black .5pt;mso-border-themecolor:text1;padding:
              0cm 5.4pt 0cm 5.4pt'>
              <p class=MsoHeader style='tab-stops:center 36.0pt 220.95pt right 441.9pt'><span
              lang=ES style='font-family:"Times New Roman",serif'>¿Considera que la
              información le permite identificarse con la empresa?<o:p></o:p></span></p>
              </td>
              <td width=38 valign=top style='width:1.0cm;border-top:none;border-left:none;
              border-bottom:solid black 1.0pt;mso-border-bottom-themecolor:text1;
              border-right:solid black 1.0pt;mso-border-right-themecolor:text1;mso-border-top-alt:
              solid black .5pt;mso-border-top-themecolor:text1;mso-border-left-alt:solid black .5pt;
              mso-border-left-themecolor:text1;mso-border-alt:solid black .5pt;mso-border-themecolor:
              text1;padding:0cm 5.4pt 0cm 5.4pt'>
              <p class=MsoHeader style='text-align:justify;line-height:150%;tab-stops:center 36.0pt 220.95pt right 441.9pt'><span
              lang=ES style='font-family:"Times New Roman",serif'><o:p>&nbsp;</o:p></span></p>
              </td>
              <td width=47 valign=top style='width:35.4pt;border-top:none;border-left:none;
              border-bottom:solid black 1.0pt;mso-border-bottom-themecolor:text1;
              border-right:solid black 1.0pt;mso-border-right-themecolor:text1;mso-border-top-alt:
              solid black .5pt;mso-border-top-themecolor:text1;mso-border-left-alt:solid black .5pt;
              mso-border-left-themecolor:text1;mso-border-alt:solid black .5pt;mso-border-themecolor:
              text1;padding:0cm 5.4pt 0cm 5.4pt'>
              <p class=MsoHeader style='text-align:justify;line-height:150%;tab-stops:center 36.0pt 220.95pt right 441.9pt'><span
              lang=ES style='font-family:"Times New Roman",serif'><o:p>&nbsp;</o:p></span></p>
              </td>
             </tr>
            </table>

            <p class=MsoHeader style='text-align:justify;line-height:150%;tab-stops:center 36.0pt 220.95pt right 441.9pt'><b
            style='mso-bidi-font-weight:normal'><span lang=ES style='font-family:"Times New Roman",serif'><o:p>&nbsp;</o:p></span></b></p>

            <p class=MsoNormal style='text-align:justify;line-height:150%'><span lang=ES
            style='font-family:"Arial",sans-serif'><o:p>&nbsp;</o:p></span></p>

            <p class=MsoNormal style='text-align:justify;line-height:150%'><span lang=ES
            style='font-family:"Arial",sans-serif'>Como trabajador de la empresa estoy
            comprometido a:<o:p></o:p></span></p>

            <p class=MsoNormal style='text-align:justify;line-height:150%'><span lang=ES
            style='font-family:"Arial",sans-serif'><o:p>&nbsp;</o:p></span></p>

            <p class=MsoListParagraphCxSpFirst style='margin-left:35.45pt;mso-add-space:
            auto;text-align:justify;text-indent:-18.0pt;line-height:150%;mso-list:l11 level1 lfo17;
            mso-hyphenate:none'><![if !supportLists]><span lang=ES style='font-size:12.0pt;
            line-height:150%;font-family:Symbol;mso-fareast-font-family:Symbol;mso-bidi-font-family:
            Symbol'><span style='mso-list:Ignore'>·<span style='font:7.0pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            </span></span></span><![endif]><span lang=ES style='font-size:12.0pt;
            line-height:150%;font-family:"Arial",sans-serif'>Hacer uso de los elementos de
            protección personal que me han asignado y que corresponde a mi trabajo de
            acuerdo a mi actividad <span style='mso-spacerun:yes'> </span>laboral,
            garantizando su conservación.<o:p></o:p></span></p>

            <p class=MsoListParagraphCxSpMiddle style='margin-left:35.45pt;mso-add-space:
            auto;text-align:justify;text-indent:-18.0pt;line-height:150%;mso-list:l11 level1 lfo17;
            mso-hyphenate:none'><![if !supportLists]><span lang=ES style='font-size:12.0pt;
            line-height:150%;font-family:Symbol;mso-fareast-font-family:Symbol;mso-bidi-font-family:
            Symbol'><span style='mso-list:Ignore'>·<span style='font:7.0pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            </span></span></span><![endif]><span lang=ES style='font-size:12.0pt;
            line-height:150%;font-family:"Arial",sans-serif'>Conozco los principios y
            valores de la organización y me comprometo a aplicarlos y cumplirlos de acuerdo
            a mi actividad y al área donde me encuentre asignado.<o:p></o:p></span></p>

            <p class=MsoListParagraphCxSpLast style='margin-left:35.45pt;mso-add-space:
            auto;text-align:justify;text-indent:-18.0pt;line-height:150%;mso-list:l11 level1 lfo17;
            mso-hyphenate:none'><![if !supportLists]><span lang=ES style='font-size:12.0pt;
            line-height:150%;font-family:Symbol;mso-fareast-font-family:Symbol;mso-bidi-font-family:
            Symbol'><span style='mso-list:Ignore'>·<span style='font:7.0pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            </span></span></span><![endif]><span lang=ES style='font-size:12.0pt;
            line-height:150%;font-family:"Arial",sans-serif'>Así mismo, conozco la política
            y Normas de Seguridad y Salud en el Trabajo <span
            style='mso-spacerun:yes'> </span>y me comprometo a cumplirlas.<o:p></o:p></span></p>

            <p class=MsoNormal style='margin-left:17.45pt;text-align:justify;line-height:
            150%;mso-hyphenate:none'><span lang=ES style='font-family:"Arial",sans-serif'><o:p>&nbsp;</o:p></span></p>

            <p class=MsoNormal style='text-align:justify;line-height:150%;tab-stops:center 36.0pt 220.95pt right 441.9pt'><span
            lang=ES style='font-family:"Arial",sans-serif;mso-fareast-font-family:Calibri;
            mso-fareast-theme-font:minor-latin;mso-fareast-language:EN-US'>Inducción que se
            realiza en la Empresa:_______________________________, en cumplimiento a lo
            dispuesto en el Parágrafo 2 , artículo 2.2.4.6.11<span
            style='mso-spacerun:yes'>  </span>del Decreto 1072, Realizar inducción a todo
            trabajador de nuevo ingreso previo al inicio de sus labores, especificando las
            actividades a realizar, los riesgos a los que estará expuestos y las medidas de
            prevención.<o:p></o:p></span></p>

            <p class=MsoBodyText style='text-indent:7.1pt;line-height:150%'><span
            lang=ES-CO style='font-size:12.0pt;line-height:150%;font-family:"Arial",sans-serif'><o:p>&nbsp;</o:p></span></p>

            <p class=MsoBodyText style='text-indent:7.1pt;line-height:150%'><span
            lang=ES-CO style='font-size:12.0pt;line-height:150%;font-family:"Arial",sans-serif'><o:p>&nbsp;</o:p></span></p>

            <p class=MsoBodyText style='text-indent:7.1pt;line-height:150%'><span
            lang=ES-CO style='font-size:12.0pt;line-height:150%;font-family:"Arial",sans-serif'>Tiempo
            Total de Inducción: ________<o:p></o:p></span></p>

            <p class=MsoHeader style='text-align:justify;line-height:150%;tab-stops:center 36.0pt 220.95pt right 441.9pt'><b
            style='mso-bidi-font-weight:normal'><span lang=ES style='font-size:12.0pt;
            line-height:150%;font-family:"Arial",sans-serif'><o:p>&nbsp;</o:p></span></b></p>

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