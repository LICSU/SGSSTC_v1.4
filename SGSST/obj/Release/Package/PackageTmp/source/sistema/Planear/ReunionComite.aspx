<%@ Page Title="" Language="C#" MasterPageFile="~/source/MasterPages/Menu.Master" AutoEventWireup="true" CodeBehind="ReunionComite.aspx.cs" Inherits="SGSST.source.sistema.Planear.ReunionComite" %>
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

            <table class=MsoNormalTable border=0 cellspacing=0 cellpadding=0 width=868
             style='width:650.8pt;border-collapse:collapse;mso-yfti-tbllook:1184;
             mso-padding-alt:0cm 3.5pt 0cm 3.5pt'>
             <tr style='mso-yfti-irow:0;mso-yfti-firstrow:yes;height:15.75pt'>
              <td width=868 nowrap colspan=8 valign=bottom style='width:650.8pt;border:
              solid windowtext 1.0pt;border-right:solid black 1.0pt;background:#95B3D7;
              padding:0cm 3.5pt 0cm 3.5pt;height:15.75pt'>
              <p class=MsoNormal align=center style='margin-bottom:0cm;margin-bottom:.0001pt;
              text-align:center;line-height:normal'><b><span style='mso-ascii-font-family:
              Calibri;mso-fareast-font-family:"Times New Roman";mso-hansi-font-family:Calibri;
              mso-bidi-font-family:Calibri;color:black;mso-fareast-language:ES-VE'>Acta <span
              class=GramE>de<span style='mso-spacerun:yes'>  </span>Reunión</span> del
              Comité de Convivencia<o:p></o:p></span></b></p>
              </td>
             </tr>
             <tr style='mso-yfti-irow:1;height:15.75pt'>
              <td width=71 nowrap valign=bottom style='width:53.6pt;border-top:none;
              border-left:solid windowtext 1.0pt;border-bottom:solid windowtext 1.0pt;
              border-right:none;padding:0cm 3.5pt 0cm 3.5pt;height:15.75pt'>
              <p class=MsoNormal style='margin-bottom:0cm;margin-bottom:.0001pt;line-height:
              normal'><span style='mso-ascii-font-family:Calibri;mso-fareast-font-family:
              "Times New Roman";mso-hansi-font-family:Calibri;mso-bidi-font-family:Calibri;
              color:black;mso-fareast-language:ES-VE'>&nbsp;<o:p></o:p></span></p>
              </td>
              <td width=71 nowrap valign=bottom style='width:53.6pt;border:none;border-bottom:
              solid windowtext 1.0pt;padding:0cm 3.5pt 0cm 3.5pt;height:15.75pt'>
              <p class=MsoNormal style='margin-bottom:0cm;margin-bottom:.0001pt;line-height:
              normal'><span style='mso-ascii-font-family:Calibri;mso-fareast-font-family:
              "Times New Roman";mso-hansi-font-family:Calibri;mso-bidi-font-family:Calibri;
              color:black;mso-fareast-language:ES-VE'>&nbsp;<o:p></o:p></span></p>
              </td>
              <td width=28 nowrap valign=bottom style='width:20.75pt;border:none;
              border-bottom:solid windowtext 1.0pt;padding:0cm 3.5pt 0cm 3.5pt;height:15.75pt'>
              <p class=MsoNormal style='margin-bottom:0cm;margin-bottom:.0001pt;line-height:
              normal'><span style='mso-ascii-font-family:Calibri;mso-fareast-font-family:
              "Times New Roman";mso-hansi-font-family:Calibri;mso-bidi-font-family:Calibri;
              color:black;mso-fareast-language:ES-VE'>&nbsp;<o:p></o:p></span></p>
              </td>
              <td width=28 nowrap valign=bottom style='width:20.75pt;border:none;
              border-bottom:solid windowtext 1.0pt;padding:0cm 3.5pt 0cm 3.5pt;height:15.75pt'>
              <p class=MsoNormal style='margin-bottom:0cm;margin-bottom:.0001pt;line-height:
              normal'><span style='mso-ascii-font-family:Calibri;mso-fareast-font-family:
              "Times New Roman";mso-hansi-font-family:Calibri;mso-bidi-font-family:Calibri;
              color:black;mso-fareast-language:ES-VE'>&nbsp;<o:p></o:p></span></p>
              </td>
              <td width=28 nowrap valign=bottom style='width:20.75pt;border:none;
              border-bottom:solid windowtext 1.0pt;padding:0cm 3.5pt 0cm 3.5pt;height:15.75pt'>
              <p class=MsoNormal style='margin-bottom:0cm;margin-bottom:.0001pt;line-height:
              normal'><span style='mso-ascii-font-family:Calibri;mso-fareast-font-family:
              "Times New Roman";mso-hansi-font-family:Calibri;mso-bidi-font-family:Calibri;
              color:black;mso-fareast-language:ES-VE'>&nbsp;<o:p></o:p></span></p>
              </td>
              <td width=28 nowrap valign=bottom style='width:20.75pt;border:none;
              border-bottom:solid windowtext 1.0pt;padding:0cm 3.5pt 0cm 3.5pt;height:15.75pt'>
              <p class=MsoNormal style='margin-bottom:0cm;margin-bottom:.0001pt;line-height:
              normal'><span style='mso-ascii-font-family:Calibri;mso-fareast-font-family:
              "Times New Roman";mso-hansi-font-family:Calibri;mso-bidi-font-family:Calibri;
              color:black;mso-fareast-language:ES-VE'>&nbsp;<o:p></o:p></span></p>
              </td>
              <td width=346 nowrap valign=bottom style='width:259.45pt;border:none;
              border-bottom:solid windowtext 1.0pt;padding:0cm 3.5pt 0cm 3.5pt;height:15.75pt'>
              <p class=MsoNormal style='margin-bottom:0cm;margin-bottom:.0001pt;line-height:
              normal'><span style='mso-ascii-font-family:Calibri;mso-fareast-font-family:
              "Times New Roman";mso-hansi-font-family:Calibri;mso-bidi-font-family:Calibri;
              color:black;mso-fareast-language:ES-VE'>&nbsp;<o:p></o:p></span></p>
              </td>
              <td width=268 nowrap valign=bottom style='width:201.15pt;border-top:none;
              border-left:none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
              padding:0cm 3.5pt 0cm 3.5pt;height:15.75pt'>
              <p class=MsoNormal style='margin-bottom:0cm;margin-bottom:.0001pt;line-height:
              normal'><span style='mso-ascii-font-family:Calibri;mso-fareast-font-family:
              "Times New Roman";mso-hansi-font-family:Calibri;mso-bidi-font-family:Calibri;
              color:black;mso-fareast-language:ES-VE'>&nbsp;<o:p></o:p></span></p>
              </td>
             </tr>
             <tr style='mso-yfti-irow:2;height:15.0pt'>
              <td width=600 nowrap colspan=7 valign=bottom style='width:449.65pt;
              border:solid windowtext 1.0pt;border-top:none;mso-border-top-alt:solid windowtext 1.0pt;
              mso-border-top-alt:1.0pt;mso-border-left-alt:1.0pt;mso-border-bottom-alt:
              .5pt;mso-border-right-alt:.5pt;mso-border-color-alt:windowtext;mso-border-style-alt:
              solid;padding:0cm 3.5pt 0cm 3.5pt;height:15.0pt'>
              <p class=MsoNormal style='margin-bottom:0cm;margin-bottom:.0001pt;line-height:
              normal'><span style='mso-ascii-font-family:Calibri;mso-fareast-font-family:
              "Times New Roman";mso-hansi-font-family:Calibri;mso-bidi-font-family:Calibri;
              color:black;mso-fareast-language:ES-VE'>Nombre de la Empresa:<o:p></o:p></span></p>
              </td>
              <td width=268 nowrap rowspan=3 valign=top style='width:201.15pt;border-top:
              none;border-left:none;border-bottom:solid black 1.0pt;border-right:solid windowtext 1.0pt;
              mso-border-left-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
              mso-border-bottom-alt:solid black .5pt;mso-border-right-alt:solid windowtext 1.0pt;
              padding:0cm 3.5pt 0cm 3.5pt;height:15.0pt'>
              <p class=MsoNormal align=center style='margin-bottom:0cm;margin-bottom:.0001pt;
              text-align:center;line-height:normal'><span style='mso-ascii-font-family:
              Calibri;mso-fareast-font-family:"Times New Roman";mso-hansi-font-family:Calibri;
              mso-bidi-font-family:Calibri;color:black;mso-fareast-language:ES-VE'>ACTA <span
              class=SpellE>N°</span><o:p></o:p></span></p>
              </td>
             </tr>
             <tr style='mso-yfti-irow:3;height:15.0pt'>
              <td width=600 nowrap colspan=7 valign=bottom style='width:449.65pt;
              border:solid windowtext 1.0pt;border-top:none;mso-border-top-alt:solid windowtext .5pt;
              mso-border-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext 1.0pt;
              padding:0cm 3.5pt 0cm 3.5pt;height:15.0pt'>
              <p class=MsoNormal style='margin-bottom:0cm;margin-bottom:.0001pt;line-height:
              normal'><span style='mso-ascii-font-family:Calibri;mso-fareast-font-family:
              "Times New Roman";mso-hansi-font-family:Calibri;mso-bidi-font-family:Calibri;
              color:black;mso-fareast-language:ES-VE'>Lugar:<o:p></o:p></span></p>
              </td>
             </tr>
             <tr style='mso-yfti-irow:4;height:15.0pt'>
              <td width=600 nowrap colspan=7 valign=bottom style='width:449.65pt;
              border:solid windowtext 1.0pt;border-top:none;mso-border-top-alt:solid windowtext .5pt;
              mso-border-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext 1.0pt;
              padding:0cm 3.5pt 0cm 3.5pt;height:15.0pt'>
              <p class=MsoNormal style='margin-bottom:0cm;margin-bottom:.0001pt;line-height:
              normal'><span style='mso-ascii-font-family:Calibri;mso-fareast-font-family:
              "Times New Roman";mso-hansi-font-family:Calibri;mso-bidi-font-family:Calibri;
              color:black;mso-fareast-language:ES-VE'>Fecha:<o:p></o:p></span></p>
              </td>
             </tr>
             <tr style='mso-yfti-irow:5;height:15.0pt'>
              <td width=198 nowrap colspan=4 valign=bottom style='width:148.7pt;border-top:
              none;border-left:solid windowtext 1.0pt;border-bottom:solid windowtext 1.0pt;
              border-right:none;mso-border-top-alt:solid windowtext .5pt;mso-border-top-alt:
              solid windowtext .5pt;mso-border-left-alt:solid windowtext 1.0pt;mso-border-bottom-alt:
              solid windowtext .5pt;padding:0cm 3.5pt 0cm 3.5pt;height:15.0pt'>
              <p class=MsoNormal style='margin-bottom:0cm;margin-bottom:.0001pt;line-height:
              normal'><span style='mso-ascii-font-family:Calibri;mso-fareast-font-family:
              "Times New Roman";mso-hansi-font-family:Calibri;mso-bidi-font-family:Calibri;
              color:black;mso-fareast-language:ES-VE'>Hora de Inicio:<o:p></o:p></span></p>
              </td>
              <td width=669 nowrap colspan=4 valign=bottom style='width:502.1pt;border-top:
              none;border-left:none;border-bottom:solid windowtext 1.0pt;border-right:solid black 1.0pt;
              mso-border-top-alt:solid windowtext .5pt;mso-border-top-alt:solid windowtext .5pt;
              mso-border-bottom-alt:solid windowtext .5pt;mso-border-right-alt:solid black 1.0pt;
              padding:0cm 3.5pt 0cm 3.5pt;height:15.0pt'>
              <p class=MsoNormal style='margin-bottom:0cm;margin-bottom:.0001pt;line-height:
              normal'><span style='mso-ascii-font-family:Calibri;mso-fareast-font-family:
              "Times New Roman";mso-hansi-font-family:Calibri;mso-bidi-font-family:Calibri;
              color:black;mso-fareast-language:ES-VE'>Hora de Finalización:<o:p></o:p></span></p>
              </td>
             </tr>
             <tr style='mso-yfti-irow:6;height:15.0pt'>
              <td width=868 nowrap colspan=8 valign=bottom style='width:650.8pt;border-top:
              none;border-left:solid windowtext 1.0pt;border-bottom:solid windowtext 1.0pt;
              border-right:solid black 1.0pt;mso-border-top-alt:solid windowtext .5pt;
              mso-border-top-alt:windowtext .5pt;mso-border-left-alt:windowtext 1.0pt;
              mso-border-bottom-alt:windowtext .5pt;mso-border-right-alt:black 1.0pt;
              mso-border-style-alt:solid;background:#95B3D7;padding:0cm 3.5pt 0cm 3.5pt;
              height:15.0pt'>
              <p class=MsoNormal style='margin-bottom:0cm;margin-bottom:.0001pt;line-height:
              normal'><b><span style='mso-ascii-font-family:Calibri;mso-fareast-font-family:
              "Times New Roman";mso-hansi-font-family:Calibri;mso-bidi-font-family:Calibri;
              color:black;mso-fareast-language:ES-VE'>Miembros Principales del Comité: <o:p></o:p></span></b></p>
              </td>
             </tr>
             <tr style='mso-yfti-irow:7;height:15.0pt'>
              <td width=226 nowrap colspan=5 style='width:169.45pt;border-top:none;
              border-left:solid windowtext 1.0pt;border-bottom:solid windowtext 1.0pt;
              border-right:solid black 1.0pt;mso-border-left-alt:solid windowtext 1.0pt;
              mso-border-bottom-alt:solid windowtext .5pt;mso-border-right-alt:solid black .5pt;
              padding:0cm 3.5pt 0cm 3.5pt;height:15.0pt'>
              <p class=MsoNormal align=center style='margin-bottom:0cm;margin-bottom:.0001pt;
              text-align:center;line-height:normal'><span style='mso-ascii-font-family:
              Calibri;mso-fareast-font-family:"Times New Roman";mso-hansi-font-family:Calibri;
              mso-bidi-font-family:Calibri;color:black;mso-fareast-language:ES-VE'>Nombre
              Completo<o:p></o:p></span></p>
              </td>
              <td width=642 nowrap colspan=3 style='width:481.35pt;border-top:none;
              border-left:none;border-bottom:solid windowtext 1.0pt;border-right:solid black 1.0pt;
              mso-border-bottom-alt:solid windowtext .5pt;mso-border-right-alt:solid black 1.0pt;
              padding:0cm 3.5pt 0cm 3.5pt;height:15.0pt'>
              <p class=MsoNormal align=center style='margin-bottom:0cm;margin-bottom:.0001pt;
              text-align:center;line-height:normal'><span style='mso-ascii-font-family:
              Calibri;mso-fareast-font-family:"Times New Roman";mso-hansi-font-family:Calibri;
              mso-bidi-font-family:Calibri;color:black;mso-fareast-language:ES-VE'>Cargo<o:p></o:p></span></p>
              </td>
             </tr>
             <tr style='mso-yfti-irow:8;height:15.0pt'>
              <td width=226 nowrap colspan=5 valign=bottom style='width:169.45pt;
              border:solid windowtext 1.0pt;border-top:none;mso-border-top-alt:solid windowtext .5pt;
              mso-border-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext 1.0pt;
              padding:0cm 3.5pt 0cm 3.5pt;height:15.0pt'>
              <p class=MsoNormal style='margin-bottom:0cm;margin-bottom:.0001pt;line-height:
              normal'><span style='mso-ascii-font-family:Calibri;mso-fareast-font-family:
              "Times New Roman";mso-hansi-font-family:Calibri;mso-bidi-font-family:Calibri;
              color:black;mso-fareast-language:ES-VE'>&nbsp;<o:p></o:p></span></p>
              </td>
              <td width=642 nowrap colspan=3 valign=bottom style='width:481.35pt;
              border-top:none;border-left:none;border-bottom:solid windowtext 1.0pt;
              border-right:solid black 1.0pt;mso-border-top-alt:solid windowtext .5pt;
              mso-border-top-alt:solid windowtext .5pt;mso-border-bottom-alt:solid windowtext .5pt;
              mso-border-right-alt:solid black 1.0pt;padding:0cm 3.5pt 0cm 3.5pt;
              height:15.0pt'>
              <p class=MsoNormal style='margin-bottom:0cm;margin-bottom:.0001pt;line-height:
              normal'><span style='mso-ascii-font-family:Calibri;mso-fareast-font-family:
              "Times New Roman";mso-hansi-font-family:Calibri;mso-bidi-font-family:Calibri;
              color:black;mso-fareast-language:ES-VE'>&nbsp;<o:p></o:p></span></p>
              </td>
             </tr>
             <tr style='mso-yfti-irow:9;height:15.0pt'>
              <td width=226 nowrap colspan=5 valign=bottom style='width:169.45pt;
              border:solid windowtext 1.0pt;border-top:none;mso-border-top-alt:solid windowtext .5pt;
              mso-border-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext 1.0pt;
              padding:0cm 3.5pt 0cm 3.5pt;height:15.0pt'>
              <p class=MsoNormal style='margin-bottom:0cm;margin-bottom:.0001pt;line-height:
              normal'><span style='mso-ascii-font-family:Calibri;mso-fareast-font-family:
              "Times New Roman";mso-hansi-font-family:Calibri;mso-bidi-font-family:Calibri;
              color:black;mso-fareast-language:ES-VE'>&nbsp;<o:p></o:p></span></p>
              </td>
              <td width=642 nowrap colspan=3 valign=bottom style='width:481.35pt;
              border-top:none;border-left:none;border-bottom:solid windowtext 1.0pt;
              border-right:solid black 1.0pt;mso-border-top-alt:solid windowtext .5pt;
              mso-border-top-alt:solid windowtext .5pt;mso-border-bottom-alt:solid windowtext .5pt;
              mso-border-right-alt:solid black 1.0pt;padding:0cm 3.5pt 0cm 3.5pt;
              height:15.0pt'>
              <p class=MsoNormal style='margin-bottom:0cm;margin-bottom:.0001pt;line-height:
              normal'><span style='mso-ascii-font-family:Calibri;mso-fareast-font-family:
              "Times New Roman";mso-hansi-font-family:Calibri;mso-bidi-font-family:Calibri;
              color:black;mso-fareast-language:ES-VE'>&nbsp;<o:p></o:p></span></p>
              </td>
             </tr>
             <tr style='mso-yfti-irow:10;height:15.0pt'>
              <td width=226 nowrap colspan=5 valign=bottom style='width:169.45pt;
              border:solid windowtext 1.0pt;border-top:none;mso-border-top-alt:solid windowtext .5pt;
              mso-border-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext 1.0pt;
              padding:0cm 3.5pt 0cm 3.5pt;height:15.0pt'>
              <p class=MsoNormal style='margin-bottom:0cm;margin-bottom:.0001pt;line-height:
              normal'><span style='mso-ascii-font-family:Calibri;mso-fareast-font-family:
              "Times New Roman";mso-hansi-font-family:Calibri;mso-bidi-font-family:Calibri;
              color:black;mso-fareast-language:ES-VE'>&nbsp;<o:p></o:p></span></p>
              </td>
              <td width=642 nowrap colspan=3 valign=bottom style='width:481.35pt;
              border-top:none;border-left:none;border-bottom:solid windowtext 1.0pt;
              border-right:solid black 1.0pt;mso-border-top-alt:solid windowtext .5pt;
              mso-border-top-alt:solid windowtext .5pt;mso-border-bottom-alt:solid windowtext .5pt;
              mso-border-right-alt:solid black 1.0pt;padding:0cm 3.5pt 0cm 3.5pt;
              height:15.0pt'>
              <p class=MsoNormal style='margin-bottom:0cm;margin-bottom:.0001pt;line-height:
              normal'><span style='mso-ascii-font-family:Calibri;mso-fareast-font-family:
              "Times New Roman";mso-hansi-font-family:Calibri;mso-bidi-font-family:Calibri;
              color:black;mso-fareast-language:ES-VE'>&nbsp;<o:p></o:p></span></p>
              </td>
             </tr>
             <tr style='mso-yfti-irow:11;height:15.0pt'>
              <td width=226 nowrap colspan=5 valign=bottom style='width:169.45pt;
              border:solid windowtext 1.0pt;border-top:none;mso-border-top-alt:solid windowtext .5pt;
              mso-border-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext 1.0pt;
              padding:0cm 3.5pt 0cm 3.5pt;height:15.0pt'>
              <p class=MsoNormal style='margin-bottom:0cm;margin-bottom:.0001pt;line-height:
              normal'><span style='mso-ascii-font-family:Calibri;mso-fareast-font-family:
              "Times New Roman";mso-hansi-font-family:Calibri;mso-bidi-font-family:Calibri;
              color:black;mso-fareast-language:ES-VE'>&nbsp;<o:p></o:p></span></p>
              </td>
              <td width=642 nowrap colspan=3 valign=bottom style='width:481.35pt;
              border-top:none;border-left:none;border-bottom:solid windowtext 1.0pt;
              border-right:solid black 1.0pt;mso-border-top-alt:solid windowtext .5pt;
              mso-border-top-alt:solid windowtext .5pt;mso-border-bottom-alt:solid windowtext .5pt;
              mso-border-right-alt:solid black 1.0pt;padding:0cm 3.5pt 0cm 3.5pt;
              height:15.0pt'>
              <p class=MsoNormal style='margin-bottom:0cm;margin-bottom:.0001pt;line-height:
              normal'><span style='mso-ascii-font-family:Calibri;mso-fareast-font-family:
              "Times New Roman";mso-hansi-font-family:Calibri;mso-bidi-font-family:Calibri;
              color:black;mso-fareast-language:ES-VE'>&nbsp;<o:p></o:p></span></p>
              </td>
             </tr>
             <tr style='mso-yfti-irow:12;height:15.0pt'>
              <td width=868 nowrap colspan=8 valign=bottom style='width:650.8pt;border:
              solid windowtext 1.0pt;border-top:none;mso-border-top-alt:solid windowtext .5pt;
              mso-border-top-alt:.5pt;mso-border-left-alt:1.0pt;mso-border-bottom-alt:.5pt;
              mso-border-right-alt:1.0pt;mso-border-color-alt:windowtext;mso-border-style-alt:
              solid;background:#95B3D7;padding:0cm 3.5pt 0cm 3.5pt;height:15.0pt'>
              <p class=MsoNormal style='margin-bottom:0cm;margin-bottom:.0001pt;line-height:
              normal'><b><span style='mso-ascii-font-family:Calibri;mso-fareast-font-family:
              "Times New Roman";mso-hansi-font-family:Calibri;mso-bidi-font-family:Calibri;
              color:black;mso-fareast-language:ES-VE'>Invitados:<o:p></o:p></span></b></p>
              </td>
             </tr>
             <tr style='mso-yfti-irow:13;height:15.0pt'>
              <td width=226 nowrap colspan=5 style='width:169.45pt;border-top:none;
              border-left:solid windowtext 1.0pt;border-bottom:solid windowtext 1.0pt;
              border-right:solid black 1.0pt;mso-border-left-alt:solid windowtext 1.0pt;
              mso-border-bottom-alt:solid windowtext .5pt;mso-border-right-alt:solid black .5pt;
              padding:0cm 3.5pt 0cm 3.5pt;height:15.0pt'>
              <p class=MsoNormal align=center style='margin-bottom:0cm;margin-bottom:.0001pt;
              text-align:center;line-height:normal'><span style='mso-ascii-font-family:
              Calibri;mso-fareast-font-family:"Times New Roman";mso-hansi-font-family:Calibri;
              mso-bidi-font-family:Calibri;color:black;mso-fareast-language:ES-VE'>Nombre
              Completo<o:p></o:p></span></p>
              </td>
              <td width=642 nowrap colspan=3 style='width:481.35pt;border-top:none;
              border-left:none;border-bottom:solid windowtext 1.0pt;border-right:solid black 1.0pt;
              mso-border-bottom-alt:solid windowtext .5pt;mso-border-right-alt:solid black 1.0pt;
              padding:0cm 3.5pt 0cm 3.5pt;height:15.0pt'>
              <p class=MsoNormal align=center style='margin-bottom:0cm;margin-bottom:.0001pt;
              text-align:center;line-height:normal'><span style='mso-ascii-font-family:
              Calibri;mso-fareast-font-family:"Times New Roman";mso-hansi-font-family:Calibri;
              mso-bidi-font-family:Calibri;color:black;mso-fareast-language:ES-VE'>Cargo<o:p></o:p></span></p>
              </td>
             </tr>
             <tr style='mso-yfti-irow:14;height:15.0pt'>
              <td width=71 nowrap style='width:53.6pt;border-top:none;border-left:solid windowtext 1.0pt;
              border-bottom:solid windowtext 1.0pt;border-right:none;mso-border-left-alt:
              solid windowtext 1.0pt;mso-border-bottom-alt:solid windowtext .5pt;
              padding:0cm 3.5pt 0cm 3.5pt;height:15.0pt'>
              <p class=MsoNormal style='margin-bottom:0cm;margin-bottom:.0001pt;line-height:
              normal'><span style='mso-ascii-font-family:Calibri;mso-fareast-font-family:
              "Times New Roman";mso-hansi-font-family:Calibri;mso-bidi-font-family:Calibri;
              color:black;mso-fareast-language:ES-VE'>&nbsp;<o:p></o:p></span></p>
              </td>
              <td width=71 nowrap style='width:53.6pt;border:none;border-bottom:solid windowtext 1.0pt;
              mso-border-bottom-alt:solid windowtext .5pt;padding:0cm 3.5pt 0cm 3.5pt;
              height:15.0pt'>
              <p class=MsoNormal style='margin-bottom:0cm;margin-bottom:.0001pt;line-height:
              normal'><span style='mso-ascii-font-family:Calibri;mso-fareast-font-family:
              "Times New Roman";mso-hansi-font-family:Calibri;mso-bidi-font-family:Calibri;
              color:black;mso-fareast-language:ES-VE'>&nbsp;<o:p></o:p></span></p>
              </td>
              <td width=28 nowrap style='width:20.75pt;border:none;border-bottom:solid windowtext 1.0pt;
              mso-border-bottom-alt:solid windowtext .5pt;padding:0cm 3.5pt 0cm 3.5pt;
              height:15.0pt'>
              <p class=MsoNormal style='margin-bottom:0cm;margin-bottom:.0001pt;line-height:
              normal'><span style='mso-ascii-font-family:Calibri;mso-fareast-font-family:
              "Times New Roman";mso-hansi-font-family:Calibri;mso-bidi-font-family:Calibri;
              color:black;mso-fareast-language:ES-VE'>&nbsp;<o:p></o:p></span></p>
              </td>
              <td width=28 nowrap style='width:20.75pt;border:none;border-bottom:solid windowtext 1.0pt;
              mso-border-bottom-alt:solid windowtext .5pt;padding:0cm 3.5pt 0cm 3.5pt;
              height:15.0pt'>
              <p class=MsoNormal style='margin-bottom:0cm;margin-bottom:.0001pt;line-height:
              normal'><span style='mso-ascii-font-family:Calibri;mso-fareast-font-family:
              "Times New Roman";mso-hansi-font-family:Calibri;mso-bidi-font-family:Calibri;
              color:black;mso-fareast-language:ES-VE'>&nbsp;<o:p></o:p></span></p>
              </td>
              <td width=28 nowrap style='width:20.75pt;border-top:none;border-left:none;
              border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
              mso-border-bottom-alt:solid windowtext .5pt;mso-border-right-alt:solid windowtext .5pt;
              padding:0cm 3.5pt 0cm 3.5pt;height:15.0pt'>
              <p class=MsoNormal style='margin-bottom:0cm;margin-bottom:.0001pt;line-height:
              normal'><span style='mso-ascii-font-family:Calibri;mso-fareast-font-family:
              "Times New Roman";mso-hansi-font-family:Calibri;mso-bidi-font-family:Calibri;
              color:black;mso-fareast-language:ES-VE'>&nbsp;<o:p></o:p></span></p>
              </td>
              <td width=28 nowrap style='width:20.75pt;border:none;border-bottom:solid windowtext 1.0pt;
              mso-border-bottom-alt:solid windowtext .5pt;padding:0cm 3.5pt 0cm 3.5pt;
              height:15.0pt'>
              <p class=MsoNormal style='margin-bottom:0cm;margin-bottom:.0001pt;line-height:
              normal'><span style='mso-ascii-font-family:Calibri;mso-fareast-font-family:
              "Times New Roman";mso-hansi-font-family:Calibri;mso-bidi-font-family:Calibri;
              color:black;mso-fareast-language:ES-VE'>&nbsp;<o:p></o:p></span></p>
              </td>
              <td width=346 nowrap style='width:259.45pt;border:none;border-bottom:solid windowtext 1.0pt;
              mso-border-bottom-alt:solid windowtext .5pt;padding:0cm 3.5pt 0cm 3.5pt;
              height:15.0pt'>
              <p class=MsoNormal style='margin-bottom:0cm;margin-bottom:.0001pt;line-height:
              normal'><span style='mso-ascii-font-family:Calibri;mso-fareast-font-family:
              "Times New Roman";mso-hansi-font-family:Calibri;mso-bidi-font-family:Calibri;
              color:black;mso-fareast-language:ES-VE'>&nbsp;<o:p></o:p></span></p>
              </td>
              <td width=268 nowrap style='width:201.15pt;border-top:none;border-left:none;
              border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
              mso-border-bottom-alt:solid windowtext .5pt;mso-border-right-alt:solid windowtext 1.0pt;
              padding:0cm 3.5pt 0cm 3.5pt;height:15.0pt'>
              <p class=MsoNormal style='margin-bottom:0cm;margin-bottom:.0001pt;line-height:
              normal'><span style='mso-ascii-font-family:Calibri;mso-fareast-font-family:
              "Times New Roman";mso-hansi-font-family:Calibri;mso-bidi-font-family:Calibri;
              color:black;mso-fareast-language:ES-VE'>&nbsp;<o:p></o:p></span></p>
              </td>
             </tr>
             <tr style='mso-yfti-irow:15;height:15.0pt'>
              <td width=226 nowrap colspan=5 valign=bottom style='width:169.45pt;
              border:solid windowtext 1.0pt;border-top:none;mso-border-top-alt:solid windowtext .5pt;
              mso-border-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext 1.0pt;
              padding:0cm 3.5pt 0cm 3.5pt;height:15.0pt'>
              <p class=MsoNormal style='margin-bottom:0cm;margin-bottom:.0001pt;line-height:
              normal'><span style='mso-ascii-font-family:Calibri;mso-fareast-font-family:
              "Times New Roman";mso-hansi-font-family:Calibri;mso-bidi-font-family:Calibri;
              color:black;mso-fareast-language:ES-VE'>&nbsp;<o:p></o:p></span></p>
              </td>
              <td width=642 nowrap colspan=3 valign=bottom style='width:481.35pt;
              border-top:none;border-left:none;border-bottom:solid windowtext 1.0pt;
              border-right:solid black 1.0pt;mso-border-top-alt:solid windowtext .5pt;
              mso-border-top-alt:solid windowtext .5pt;mso-border-bottom-alt:solid windowtext .5pt;
              mso-border-right-alt:solid black 1.0pt;padding:0cm 3.5pt 0cm 3.5pt;
              height:15.0pt'>
              <p class=MsoNormal style='margin-bottom:0cm;margin-bottom:.0001pt;line-height:
              normal'><span style='mso-ascii-font-family:Calibri;mso-fareast-font-family:
              "Times New Roman";mso-hansi-font-family:Calibri;mso-bidi-font-family:Calibri;
              color:black;mso-fareast-language:ES-VE'>&nbsp;<o:p></o:p></span></p>
              </td>
             </tr>
             <tr style='mso-yfti-irow:16;height:15.0pt'>
              <td width=868 nowrap colspan=8 valign=bottom style='width:650.8pt;border-top:
              none;border-left:solid windowtext 1.0pt;border-bottom:solid windowtext 1.0pt;
              border-right:solid black 1.0pt;mso-border-top-alt:solid windowtext .5pt;
              mso-border-top-alt:windowtext .5pt;mso-border-left-alt:windowtext 1.0pt;
              mso-border-bottom-alt:windowtext .5pt;mso-border-right-alt:black 1.0pt;
              mso-border-style-alt:solid;background:#95B3D7;padding:0cm 3.5pt 0cm 3.5pt;
              height:15.0pt'>
              <p class=MsoNormal style='margin-bottom:0cm;margin-bottom:.0001pt;line-height:
              normal'><b><span style='mso-ascii-font-family:Calibri;mso-fareast-font-family:
              "Times New Roman";mso-hansi-font-family:Calibri;mso-bidi-font-family:Calibri;
              color:black;mso-fareast-language:ES-VE'>Temas Tratados:<o:p></o:p></span></b></p>
              </td>
             </tr>
             <tr style='mso-yfti-irow:17;height:15.0pt'>
              <td width=868 nowrap colspan=8 valign=bottom style='width:650.8pt;border-top:
              none;border-left:solid windowtext 1.0pt;border-bottom:solid windowtext 1.0pt;
              border-right:solid black 1.0pt;mso-border-top-alt:solid windowtext .5pt;
              mso-border-top-alt:windowtext .5pt;mso-border-left-alt:windowtext 1.0pt;
              mso-border-bottom-alt:windowtext .5pt;mso-border-right-alt:black 1.0pt;
              mso-border-style-alt:solid;padding:0cm 3.5pt 0cm 3.5pt;height:15.0pt'>
              <p class=MsoNormal align=center style='margin-bottom:0cm;margin-bottom:.0001pt;
              text-align:center;line-height:normal'><span style='mso-ascii-font-family:
              Calibri;mso-fareast-font-family:"Times New Roman";mso-hansi-font-family:Calibri;
              mso-bidi-font-family:Calibri;color:black;mso-fareast-language:ES-VE'>&nbsp;<o:p></o:p></span></p>
              </td>
             </tr>
             <tr style='mso-yfti-irow:18;height:15.0pt'>
              <td width=868 nowrap colspan=8 valign=bottom style='width:650.8pt;border-top:
              none;border-left:solid windowtext 1.0pt;border-bottom:solid windowtext 1.0pt;
              border-right:solid black 1.0pt;mso-border-top-alt:solid windowtext .5pt;
              mso-border-top-alt:windowtext .5pt;mso-border-left-alt:windowtext 1.0pt;
              mso-border-bottom-alt:windowtext .5pt;mso-border-right-alt:black 1.0pt;
              mso-border-style-alt:solid;background:#95B3D7;padding:0cm 3.5pt 0cm 3.5pt;
              height:15.0pt'>
              <p class=MsoNormal style='margin-bottom:0cm;margin-bottom:.0001pt;line-height:
              normal'><b><span style='mso-ascii-font-family:Calibri;mso-fareast-font-family:
              "Times New Roman";mso-hansi-font-family:Calibri;mso-bidi-font-family:Calibri;
              color:black;mso-fareast-language:ES-VE'><span
              style='mso-spacerun:yes'> </span>Solicitudes:<o:p></o:p></span></b></p>
              </td>
             </tr>
             <tr style='mso-yfti-irow:19;height:15.0pt'>
              <td width=868 nowrap colspan=8 valign=bottom style='width:650.8pt;border-top:
              none;border-left:solid windowtext 1.0pt;border-bottom:solid windowtext 1.0pt;
              border-right:solid black 1.0pt;mso-border-top-alt:solid windowtext .5pt;
              mso-border-top-alt:windowtext .5pt;mso-border-left-alt:windowtext 1.0pt;
              mso-border-bottom-alt:windowtext .5pt;mso-border-right-alt:black 1.0pt;
              mso-border-style-alt:solid;padding:0cm 3.5pt 0cm 3.5pt;height:15.0pt'>
              <p class=MsoNormal style='margin-bottom:0cm;margin-bottom:.0001pt;line-height:
              normal'><span style='mso-ascii-font-family:Calibri;mso-fareast-font-family:
              "Times New Roman";mso-hansi-font-family:Calibri;mso-bidi-font-family:Calibri;
              color:black;mso-fareast-language:ES-VE'>&nbsp;<o:p></o:p></span></p>
              </td>
             </tr>
             <tr style='mso-yfti-irow:20;height:15.0pt'>
              <td width=71 nowrap valign=bottom style='width:53.6pt;border:none;border-left:
              solid windowtext 1.0pt;padding:0cm 3.5pt 0cm 3.5pt;height:15.0pt'>
              <p class=MsoNormal style='margin-bottom:0cm;margin-bottom:.0001pt;line-height:
              normal'><span style='mso-ascii-font-family:Calibri;mso-fareast-font-family:
              "Times New Roman";mso-hansi-font-family:Calibri;mso-bidi-font-family:Calibri;
              color:black;mso-fareast-language:ES-VE'>&nbsp;<o:p></o:p></span></p>
              </td>
              <td width=71 nowrap valign=bottom style='width:53.6pt;padding:0cm 3.5pt 0cm 3.5pt;
              height:15.0pt'></td>
              <td width=28 nowrap valign=bottom style='width:20.75pt;padding:0cm 3.5pt 0cm 3.5pt;
              height:15.0pt'></td>
              <td width=28 nowrap valign=bottom style='width:20.75pt;padding:0cm 3.5pt 0cm 3.5pt;
              height:15.0pt'></td>
              <td width=28 nowrap valign=bottom style='width:20.75pt;padding:0cm 3.5pt 0cm 3.5pt;
              height:15.0pt'></td>
              <td width=28 nowrap valign=bottom style='width:20.75pt;padding:0cm 3.5pt 0cm 3.5pt;
              height:15.0pt'></td>
              <td width=346 nowrap valign=bottom style='width:259.45pt;padding:0cm 3.5pt 0cm 3.5pt;
              height:15.0pt'></td>
              <td width=268 nowrap valign=bottom style='width:201.15pt;border:none;
              border-right:solid windowtext 1.0pt;padding:0cm 3.5pt 0cm 3.5pt;height:15.0pt'>
              <p class=MsoNormal style='margin-bottom:0cm;margin-bottom:.0001pt;line-height:
              normal'><span style='mso-ascii-font-family:Calibri;mso-fareast-font-family:
              "Times New Roman";mso-hansi-font-family:Calibri;mso-bidi-font-family:Calibri;
              color:black;mso-fareast-language:ES-VE'>&nbsp;<o:p></o:p></span></p>
              </td>
             </tr>
             <tr style='mso-yfti-irow:21;height:15.0pt'>
              <td width=143 nowrap colspan=2 valign=bottom style='width:107.2pt;border:
              none;border-left:solid windowtext 1.0pt;padding:0cm 3.5pt 0cm 3.5pt;
              height:15.0pt'>
              <p class=MsoNormal style='margin-bottom:0cm;margin-bottom:.0001pt;line-height:
              normal'><span style='mso-ascii-font-family:Calibri;mso-fareast-font-family:
              "Times New Roman";mso-hansi-font-family:Calibri;mso-bidi-font-family:Calibri;
              color:black;mso-fareast-language:ES-VE'><span
              style='mso-spacerun:yes'>                     </span><span class=GramE>Presidente
              :</span><o:p></o:p></span></p>
              </td>
              <td width=28 nowrap valign=bottom style='width:20.75pt;padding:0cm 3.5pt 0cm 3.5pt;
              height:15.0pt'></td>
              <td width=28 nowrap valign=bottom style='width:20.75pt;padding:0cm 3.5pt 0cm 3.5pt;
              height:15.0pt'></td>
              <td width=28 nowrap valign=bottom style='width:20.75pt;padding:0cm 3.5pt 0cm 3.5pt;
              height:15.0pt'></td>
              <td width=28 nowrap valign=bottom style='width:20.75pt;padding:0cm 3.5pt 0cm 3.5pt;
              height:15.0pt'></td>
              <td width=346 nowrap valign=bottom style='width:259.45pt;padding:0cm 3.5pt 0cm 3.5pt;
              height:15.0pt'>
              <p class=MsoNormal style='margin-bottom:0cm;margin-bottom:.0001pt;line-height:
              normal'><span style='mso-ascii-font-family:Calibri;mso-fareast-font-family:
              "Times New Roman";mso-hansi-font-family:Calibri;mso-bidi-font-family:Calibri;
              color:black;mso-fareast-language:ES-VE'>Secretario:<o:p></o:p></span></p>
              </td>
              <td width=268 nowrap valign=bottom style='width:201.15pt;border:none;
              border-right:solid windowtext 1.0pt;padding:0cm 3.5pt 0cm 3.5pt;height:15.0pt'>
              <p class=MsoNormal style='margin-bottom:0cm;margin-bottom:.0001pt;line-height:
              normal'><span style='mso-ascii-font-family:Calibri;mso-fareast-font-family:
              "Times New Roman";mso-hansi-font-family:Calibri;mso-bidi-font-family:Calibri;
              color:black;mso-fareast-language:ES-VE'>&nbsp;<o:p></o:p></span></p>
              </td>
             </tr>
             <tr style='mso-yfti-irow:22;height:15.0pt'>
              <td width=71 nowrap valign=bottom style='width:53.6pt;border:none;border-left:
              solid windowtext 1.0pt;padding:0cm 3.5pt 0cm 3.5pt;height:15.0pt'>
              <p class=MsoNormal style='margin-bottom:0cm;margin-bottom:.0001pt;line-height:
              normal'><span style='mso-ascii-font-family:Calibri;mso-fareast-font-family:
              "Times New Roman";mso-hansi-font-family:Calibri;mso-bidi-font-family:Calibri;
              color:black;mso-fareast-language:ES-VE'>&nbsp;<o:p></o:p></span></p>
              </td>
              <td width=71 nowrap valign=bottom style='width:53.6pt;padding:0cm 3.5pt 0cm 3.5pt;
              height:15.0pt'></td>
              <td width=28 nowrap valign=bottom style='width:20.75pt;padding:0cm 3.5pt 0cm 3.5pt;
              height:15.0pt'></td>
              <td width=28 nowrap valign=bottom style='width:20.75pt;padding:0cm 3.5pt 0cm 3.5pt;
              height:15.0pt'></td>
              <td width=28 nowrap valign=bottom style='width:20.75pt;padding:0cm 3.5pt 0cm 3.5pt;
              height:15.0pt'></td>
              <td width=28 nowrap valign=bottom style='width:20.75pt;padding:0cm 3.5pt 0cm 3.5pt;
              height:15.0pt'></td>
              <td width=346 nowrap valign=bottom style='width:259.45pt;padding:0cm 3.5pt 0cm 3.5pt;
              height:15.0pt'></td>
              <td width=268 nowrap valign=bottom style='width:201.15pt;border:none;
              border-right:solid windowtext 1.0pt;padding:0cm 3.5pt 0cm 3.5pt;height:15.0pt'>
              <p class=MsoNormal style='margin-bottom:0cm;margin-bottom:.0001pt;line-height:
              normal'><span style='mso-ascii-font-family:Calibri;mso-fareast-font-family:
              "Times New Roman";mso-hansi-font-family:Calibri;mso-bidi-font-family:Calibri;
              color:black;mso-fareast-language:ES-VE'>&nbsp;<o:p></o:p></span></p>
              </td>
             </tr>
             <tr style='mso-yfti-irow:23;height:15.0pt'>
              <td width=71 nowrap valign=bottom style='width:53.6pt;border:none;border-left:
              solid windowtext 1.0pt;padding:0cm 3.5pt 0cm 3.5pt;height:15.0pt'>
              <p class=MsoNormal style='margin-bottom:0cm;margin-bottom:.0001pt;line-height:
              normal'><span style='mso-ascii-font-family:Calibri;mso-fareast-font-family:
              "Times New Roman";mso-hansi-font-family:Calibri;mso-bidi-font-family:Calibri;
              color:black;mso-fareast-language:ES-VE'>&nbsp;<o:p></o:p></span></p>
              </td>
              <td width=71 nowrap valign=bottom style='width:53.6pt;padding:0cm 3.5pt 0cm 3.5pt;
              height:15.0pt'></td>
              <td width=28 nowrap valign=bottom style='width:20.75pt;padding:0cm 3.5pt 0cm 3.5pt;
              height:15.0pt'></td>
              <td width=28 nowrap valign=bottom style='width:20.75pt;padding:0cm 3.5pt 0cm 3.5pt;
              height:15.0pt'></td>
              <td width=28 nowrap valign=bottom style='width:20.75pt;padding:0cm 3.5pt 0cm 3.5pt;
              height:15.0pt'></td>
              <td width=28 nowrap valign=bottom style='width:20.75pt;padding:0cm 3.5pt 0cm 3.5pt;
              height:15.0pt'></td>
              <td width=346 nowrap valign=bottom style='width:259.45pt;padding:0cm 3.5pt 0cm 3.5pt;
              height:15.0pt'></td>
              <td width=268 nowrap valign=bottom style='width:201.15pt;border:none;
              border-right:solid windowtext 1.0pt;padding:0cm 3.5pt 0cm 3.5pt;height:15.0pt'>
              <p class=MsoNormal style='margin-bottom:0cm;margin-bottom:.0001pt;line-height:
              normal'><span style='mso-ascii-font-family:Calibri;mso-fareast-font-family:
              "Times New Roman";mso-hansi-font-family:Calibri;mso-bidi-font-family:Calibri;
              color:black;mso-fareast-language:ES-VE'>&nbsp;<o:p></o:p></span></p>
              </td>
             </tr>
             <tr style='mso-yfti-irow:24;height:15.0pt'>
              <td width=71 nowrap valign=bottom style='width:53.6pt;border:none;border-left:
              solid windowtext 1.0pt;padding:0cm 3.5pt 0cm 3.5pt;height:15.0pt'>
              <p class=MsoNormal style='margin-bottom:0cm;margin-bottom:.0001pt;line-height:
              normal'><span style='mso-ascii-font-family:Calibri;mso-fareast-font-family:
              "Times New Roman";mso-hansi-font-family:Calibri;mso-bidi-font-family:Calibri;
              color:black;mso-fareast-language:ES-VE'>&nbsp;<o:p></o:p></span></p>
              </td>
              <td width=99 nowrap colspan=2 valign=bottom style='width:74.35pt;border:none;
              border-bottom:solid windowtext 1.0pt;mso-border-bottom-alt:solid windowtext .5pt;
              padding:0cm 3.5pt 0cm 3.5pt;height:15.0pt'>
              <p class=MsoNormal align=center style='margin-bottom:0cm;margin-bottom:.0001pt;
              text-align:center;line-height:normal'><span style='mso-ascii-font-family:
              Calibri;mso-fareast-font-family:"Times New Roman";mso-hansi-font-family:Calibri;
              mso-bidi-font-family:Calibri;color:black;mso-fareast-language:ES-VE'>&nbsp;<o:p></o:p></span></p>
              </td>
              <td width=28 nowrap valign=bottom style='width:20.75pt;padding:0cm 3.5pt 0cm 3.5pt;
              height:15.0pt'></td>
              <td width=28 nowrap valign=bottom style='width:20.75pt;padding:0cm 3.5pt 0cm 3.5pt;
              height:15.0pt'></td>
              <td width=28 nowrap valign=bottom style='width:20.75pt;padding:0cm 3.5pt 0cm 3.5pt;
              height:15.0pt'></td>
              <td width=346 nowrap valign=bottom style='width:259.45pt;border:none;
              border-bottom:solid windowtext 1.0pt;mso-border-bottom-alt:solid windowtext .5pt;
              padding:0cm 3.5pt 0cm 3.5pt;height:15.0pt'>
              <p class=MsoNormal style='margin-bottom:0cm;margin-bottom:.0001pt;line-height:
              normal'><span style='mso-ascii-font-family:Calibri;mso-fareast-font-family:
              "Times New Roman";mso-hansi-font-family:Calibri;mso-bidi-font-family:Calibri;
              color:black;mso-fareast-language:ES-VE'>&nbsp;<o:p></o:p></span></p>
              </td>
              <td width=268 nowrap valign=bottom style='width:201.15pt;border-top:none;
              border-left:none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
              mso-border-bottom-alt:solid windowtext .5pt;mso-border-right-alt:solid windowtext 1.0pt;
              padding:0cm 3.5pt 0cm 3.5pt;height:15.0pt'>
              <p class=MsoNormal style='margin-bottom:0cm;margin-bottom:.0001pt;line-height:
              normal'><span style='mso-ascii-font-family:Calibri;mso-fareast-font-family:
              "Times New Roman";mso-hansi-font-family:Calibri;mso-bidi-font-family:Calibri;
              color:black;mso-fareast-language:ES-VE'>&nbsp;<o:p></o:p></span></p>
              </td>
             </tr>
             <tr style='mso-yfti-irow:25;height:15.0pt'>
              <td width=71 nowrap valign=bottom style='width:53.6pt;border:none;border-left:
              solid windowtext 1.0pt;padding:0cm 3.5pt 0cm 3.5pt;height:15.0pt'>
              <p class=MsoNormal style='margin-bottom:0cm;margin-bottom:.0001pt;line-height:
              normal'><span style='mso-ascii-font-family:Calibri;mso-fareast-font-family:
              "Times New Roman";mso-hansi-font-family:Calibri;mso-bidi-font-family:Calibri;
              color:black;mso-fareast-language:ES-VE'>&nbsp;<o:p></o:p></span></p>
              </td>
              <td width=99 nowrap colspan=2 valign=bottom style='width:74.35pt;border:none;
              mso-border-top-alt:solid windowtext .5pt;padding:0cm 3.5pt 0cm 3.5pt;
              height:15.0pt'>
              <p class=MsoNormal align=center style='margin-bottom:0cm;margin-bottom:.0001pt;
              text-align:center;line-height:normal'><span style='mso-ascii-font-family:
              Calibri;mso-fareast-font-family:"Times New Roman";mso-hansi-font-family:Calibri;
              mso-bidi-font-family:Calibri;color:black;mso-fareast-language:ES-VE'>Firma<o:p></o:p></span></p>
              </td>
              <td width=28 nowrap valign=bottom style='width:20.75pt;padding:0cm 3.5pt 0cm 3.5pt;
              height:15.0pt'></td>
              <td width=28 nowrap valign=bottom style='width:20.75pt;padding:0cm 3.5pt 0cm 3.5pt;
              height:15.0pt'></td>
              <td width=28 nowrap valign=bottom style='width:20.75pt;padding:0cm 3.5pt 0cm 3.5pt;
              height:15.0pt'></td>
              <td width=614 nowrap colspan=2 valign=bottom style='width:460.6pt;border:
              none;border-right:solid black 1.0pt;mso-border-top-alt:solid windowtext .5pt;
              padding:0cm 3.5pt 0cm 3.5pt;height:15.0pt'>
              <p class=MsoNormal align=center style='margin-bottom:0cm;margin-bottom:.0001pt;
              text-align:center;line-height:normal'><span style='mso-ascii-font-family:
              Calibri;mso-fareast-font-family:"Times New Roman";mso-hansi-font-family:Calibri;
              mso-bidi-font-family:Calibri;color:black;mso-fareast-language:ES-VE'>Firma<o:p></o:p></span></p>
              </td>
             </tr>
             <tr style='mso-yfti-irow:26;height:15.0pt'>
              <td width=71 nowrap valign=bottom style='width:53.6pt;border:none;border-left:
              solid windowtext 1.0pt;padding:0cm 3.5pt 0cm 3.5pt;height:15.0pt'>
              <p class=MsoNormal style='margin-bottom:0cm;margin-bottom:.0001pt;line-height:
              normal'><span style='mso-ascii-font-family:Calibri;mso-fareast-font-family:
              "Times New Roman";mso-hansi-font-family:Calibri;mso-bidi-font-family:Calibri;
              color:black;mso-fareast-language:ES-VE'>&nbsp;<o:p></o:p></span></p>
              </td>
              <td width=71 nowrap valign=bottom style='width:53.6pt;padding:0cm 3.5pt 0cm 3.5pt;
              height:15.0pt'></td>
              <td width=28 nowrap valign=bottom style='width:20.75pt;padding:0cm 3.5pt 0cm 3.5pt;
              height:15.0pt'></td>
              <td width=28 nowrap valign=bottom style='width:20.75pt;padding:0cm 3.5pt 0cm 3.5pt;
              height:15.0pt'></td>
              <td width=28 nowrap valign=bottom style='width:20.75pt;padding:0cm 3.5pt 0cm 3.5pt;
              height:15.0pt'></td>
              <td width=28 nowrap valign=bottom style='width:20.75pt;padding:0cm 3.5pt 0cm 3.5pt;
              height:15.0pt'></td>
              <td width=346 nowrap valign=bottom style='width:259.45pt;padding:0cm 3.5pt 0cm 3.5pt;
              height:15.0pt'></td>
              <td width=268 nowrap valign=bottom style='width:201.15pt;border:none;
              border-right:solid windowtext 1.0pt;padding:0cm 3.5pt 0cm 3.5pt;height:15.0pt'>
              <p class=MsoNormal style='margin-bottom:0cm;margin-bottom:.0001pt;line-height:
              normal'><span style='mso-ascii-font-family:Calibri;mso-fareast-font-family:
              "Times New Roman";mso-hansi-font-family:Calibri;mso-bidi-font-family:Calibri;
              color:black;mso-fareast-language:ES-VE'>&nbsp;<o:p></o:p></span></p>
              </td>
             </tr>
             <tr style='mso-yfti-irow:27;mso-yfti-lastrow:yes;height:15.75pt'>
              <td width=71 nowrap valign=bottom style='width:53.6pt;border-top:none;
              border-left:solid windowtext 1.0pt;border-bottom:solid windowtext 1.0pt;
              border-right:none;padding:0cm 3.5pt 0cm 3.5pt;height:15.75pt'>
              <p class=MsoNormal style='margin-bottom:0cm;margin-bottom:.0001pt;line-height:
              normal'><span style='mso-ascii-font-family:Calibri;mso-fareast-font-family:
              "Times New Roman";mso-hansi-font-family:Calibri;mso-bidi-font-family:Calibri;
              color:black;mso-fareast-language:ES-VE'>&nbsp;<o:p></o:p></span></p>
              </td>
              <td width=71 nowrap valign=bottom style='width:53.6pt;border:none;border-bottom:
              solid windowtext 1.0pt;padding:0cm 3.5pt 0cm 3.5pt;height:15.75pt'>
              <p class=MsoNormal style='margin-bottom:0cm;margin-bottom:.0001pt;line-height:
              normal'><span style='mso-ascii-font-family:Calibri;mso-fareast-font-family:
              "Times New Roman";mso-hansi-font-family:Calibri;mso-bidi-font-family:Calibri;
              color:black;mso-fareast-language:ES-VE'>&nbsp;<o:p></o:p></span></p>
              </td>
              <td width=28 nowrap valign=bottom style='width:20.75pt;border:none;
              border-bottom:solid windowtext 1.0pt;padding:0cm 3.5pt 0cm 3.5pt;height:15.75pt'>
              <p class=MsoNormal style='margin-bottom:0cm;margin-bottom:.0001pt;line-height:
              normal'><span style='mso-ascii-font-family:Calibri;mso-fareast-font-family:
              "Times New Roman";mso-hansi-font-family:Calibri;mso-bidi-font-family:Calibri;
              color:black;mso-fareast-language:ES-VE'>&nbsp;<o:p></o:p></span></p>
              </td>
              <td width=28 nowrap valign=bottom style='width:20.75pt;border:none;
              border-bottom:solid windowtext 1.0pt;padding:0cm 3.5pt 0cm 3.5pt;height:15.75pt'>
              <p class=MsoNormal style='margin-bottom:0cm;margin-bottom:.0001pt;line-height:
              normal'><span style='mso-ascii-font-family:Calibri;mso-fareast-font-family:
              "Times New Roman";mso-hansi-font-family:Calibri;mso-bidi-font-family:Calibri;
              color:black;mso-fareast-language:ES-VE'>&nbsp;<o:p></o:p></span></p>
              </td>
              <td width=28 nowrap valign=bottom style='width:20.75pt;border:none;
              border-bottom:solid windowtext 1.0pt;padding:0cm 3.5pt 0cm 3.5pt;height:15.75pt'>
              <p class=MsoNormal style='margin-bottom:0cm;margin-bottom:.0001pt;line-height:
              normal'><span style='mso-ascii-font-family:Calibri;mso-fareast-font-family:
              "Times New Roman";mso-hansi-font-family:Calibri;mso-bidi-font-family:Calibri;
              color:black;mso-fareast-language:ES-VE'>&nbsp;<o:p></o:p></span></p>
              </td>
              <td width=28 nowrap valign=bottom style='width:20.75pt;border:none;
              border-bottom:solid windowtext 1.0pt;padding:0cm 3.5pt 0cm 3.5pt;height:15.75pt'>
              <p class=MsoNormal style='margin-bottom:0cm;margin-bottom:.0001pt;line-height:
              normal'><span style='mso-ascii-font-family:Calibri;mso-fareast-font-family:
              "Times New Roman";mso-hansi-font-family:Calibri;mso-bidi-font-family:Calibri;
              color:black;mso-fareast-language:ES-VE'>&nbsp;<o:p></o:p></span></p>
              </td>
              <td width=346 nowrap valign=bottom style='width:259.45pt;border:none;
              border-bottom:solid windowtext 1.0pt;padding:0cm 3.5pt 0cm 3.5pt;height:15.75pt'>
              <p class=MsoNormal style='margin-bottom:0cm;margin-bottom:.0001pt;line-height:
              normal'><span style='mso-ascii-font-family:Calibri;mso-fareast-font-family:
              "Times New Roman";mso-hansi-font-family:Calibri;mso-bidi-font-family:Calibri;
              color:black;mso-fareast-language:ES-VE'>&nbsp;<o:p></o:p></span></p>
              </td>
              <td width=268 nowrap valign=bottom style='width:201.15pt;border-top:none;
              border-left:none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
              padding:0cm 3.5pt 0cm 3.5pt;height:15.75pt'>
              <p class=MsoNormal style='margin-bottom:0cm;margin-bottom:.0001pt;line-height:
              normal'><span style='mso-ascii-font-family:Calibri;mso-fareast-font-family:
              "Times New Roman";mso-hansi-font-family:Calibri;mso-bidi-font-family:Calibri;
              color:black;mso-fareast-language:ES-VE'>&nbsp;<o:p></o:p></span></p>
              </td>
             </tr>
            </table>

            <p class=MsoNormal><o:p>&nbsp;</o:p></p>

            </div>

        </CKEditor:CKEditorControl>

    </div>

    <hr />
    <br />
    <div class="row text-center">
        <div class="col-md-4 col-md-offset-4">
            <asp:ImageButton alt="-" ID="btnGuardar" runat="server" ImageUrl="~\ico\print.png" OnClick="GenerarDocumento" ValidationGroup="ValidationAdd" />
            <h4>Generar Documento</h4>
        </div>
    </div>


</asp:Content>
