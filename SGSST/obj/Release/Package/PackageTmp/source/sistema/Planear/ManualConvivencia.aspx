<%@ Page Title="" Language="C#" MasterPageFile="~/source/MasterPages/Menu.Master" AutoEventWireup="true" CodeBehind="ManualConvivencia.aspx.cs" Inherits="SGSST.source.sistema.Planear.ManualConvivencia" %>

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

            <p class=MsoNormal style='line-height:150%'><b style='mso-bidi-font-weight:
            normal'><span lang=ES-MX style='font-family:"Arial",sans-serif;mso-ansi-language:
            ES-MX'><span style='mso-spacerun:yes'>      </span><o:p></o:p></span></b></p>

            <p class=MsoNormal style='line-height:150%'><b style='mso-bidi-font-weight:
            normal'><span lang=ES-MX style='font-family:"Arial",sans-serif;mso-ansi-language:
            ES-MX'>Meta<o:p></o:p></span></b></p>

            <p class=MsoNormal style='line-height:150%'><b style='mso-bidi-font-weight:
            normal'><span lang=ES-MX style='font-family:"Arial",sans-serif;mso-ansi-language:
            ES-MX'><o:p>&nbsp;</o:p></span></b></p>

            <p class=MsoNormal style='margin-left:7.1pt;text-align:justify;line-height:
            150%'><span lang=ES-MX style='font-family:"Arial",sans-serif;mso-ansi-language:
            ES-MX'>Promover la sana convivencia entre los compañeros de trabajo, en armonía
            con el ambiente que les rodea, </span><span lang=ES style='font-family:"Arial",sans-serif'>en
            pro de minimizar el riesgo Psicosocial que implica estar inmerso en las presiones
            del entorno, enfocándonos en generar estrategias que permitan fortalecer y
            consolidar la cultura del respeto y la sana convivencia, la cual es una de las
            características más importantes de una organización, <span
            style='mso-spacerun:yes'> </span>cuando hablamos de tener una sana convivencia
            estamos buscando que en las relaciones en el entorno laboral haya civismo, que
            usualmente está integrado por valores y actitudes que encierran lo que es vivir
            en conjunto con los demás. <o:p></o:p></span></p>

            <p class=MsoNormal style='margin-left:7.1pt;text-align:justify;line-height:
            150%'><span lang=ES style='font-family:"Arial",sans-serif'><o:p>&nbsp;</o:p></span></p>

            <p class=MsoNormal style='margin-left:7.1pt;text-align:justify;line-height:
            150%'><span lang=ES style='font-family:"Arial",sans-serif'>El respeto, la
            tolerancia, la solidaridad, la equidad, la honestidad, entre otros muchos, son
            valores necesarios para crear una adecuada convivencia. Por lo cual se ha
            implementado el presente manual de convivencia, alineado con nuestra política
            empresarial.<o:p></o:p></span></p>

            <p class=MsoNormal style='text-align:justify;line-height:150%'><span
            lang=ES-MX style='font-family:"Arial",sans-serif;mso-ansi-language:ES-MX'><o:p>&nbsp;</o:p></span></p>

            <p class=MsoNormal style='text-align:justify;line-height:150%'><b
            style='mso-bidi-font-weight:normal'><span lang=ES style='font-family:"Arial",sans-serif'>Objetivos<o:p></o:p></span></b></p>

            <p class=MsoListParagraphCxSpFirst style='text-align:justify;line-height:150%'><b
            style='mso-bidi-font-weight:normal'><span lang=ES style='font-size:12.0pt;
            line-height:150%;font-family:"Arial",sans-serif'><o:p>&nbsp;</o:p></span></b></p>

            <p class=MsoListParagraphCxSpMiddle style='margin-top:0cm;margin-right:0cm;
            margin-bottom:0cm;margin-left:1.0cm;margin-bottom:.0001pt;mso-add-space:auto;
            text-align:justify;text-indent:-18.0pt;line-height:150%;mso-list:l12 level1 lfo18'><![if !supportLists]><span
            lang=ES style='font-size:12.0pt;line-height:150%;font-family:Wingdings;
            mso-fareast-font-family:Wingdings;mso-bidi-font-family:Wingdings'><span
            style='mso-list:Ignore'>ü<span style='font:7.0pt "Times New Roman"'>&nbsp; </span></span></span><![endif]><span
            lang=ES style='font-size:12.0pt;line-height:150%;font-family:"Arial",sans-serif'>Definir
            los la importancia de la conformación y funcionamiento del Comité de
            Convivencia Laboral<o:p></o:p></span></p>

            <p class=MsoListParagraphCxSpMiddle style='margin-top:0cm;margin-right:0cm;
            margin-bottom:0cm;margin-left:1.0cm;margin-bottom:.0001pt;mso-add-space:auto;
            text-align:justify;text-indent:-18.0pt;line-height:150%;mso-list:l12 level1 lfo18'><![if !supportLists]><span
            lang=ES style='font-size:12.0pt;line-height:150%;font-family:Wingdings;
            mso-fareast-font-family:Wingdings;mso-bidi-font-family:Wingdings'><span
            style='mso-list:Ignore'>ü<span style='font:7.0pt "Times New Roman"'>&nbsp; </span></span></span><![endif]><span
            lang=ES style='font-size:12.0pt;line-height:150%;font-family:"Arial",sans-serif'>Establecer
            las pautas necesarias para consolidar una cultura del respeto y<span
            style='mso-spacerun:yes'>  </span>sana convivencia<o:p></o:p></span></p>

            <p class=MsoListParagraphCxSpMiddle style='margin-top:0cm;margin-right:0cm;
            margin-bottom:0cm;margin-left:1.0cm;margin-bottom:.0001pt;mso-add-space:auto;
            text-align:justify;text-indent:-18.0pt;line-height:150%;mso-list:l12 level1 lfo18'><![if !supportLists]><span
            lang=ES style='font-size:12.0pt;line-height:150%;font-family:Wingdings;
            mso-fareast-font-family:Wingdings;mso-bidi-font-family:Wingdings'><span
            style='mso-list:Ignore'>ü<span style='font:7.0pt "Times New Roman"'>&nbsp; </span></span></span><![endif]><span
            lang=ES style='font-size:12.0pt;line-height:150%;font-family:"Arial",sans-serif'>Generar
            en la Empresa un clima de convivencia positiva en el que todos los miembros de
            la organización se sientan participes<o:p></o:p></span></p>

            <p class=MsoListParagraphCxSpMiddle style='margin-top:0cm;margin-right:0cm;
            margin-bottom:0cm;margin-left:1.0cm;margin-bottom:.0001pt;mso-add-space:auto;
            text-align:justify;text-indent:-18.0pt;line-height:150%;mso-list:l12 level1 lfo18'><![if !supportLists]><span
            lang=ES style='font-size:12.0pt;line-height:150%;font-family:Wingdings;
            mso-fareast-font-family:Wingdings;mso-bidi-font-family:Wingdings'><span
            style='mso-list:Ignore'>ü<span style='font:7.0pt "Times New Roman"'>&nbsp; </span></span></span><![endif]><span
            lang=ES style='font-size:12.0pt;line-height:150%;font-family:"Arial",sans-serif'>Establecer
            las Normas de convivencia para fomentar las relaciones positivas<o:p></o:p></span></p>

            <p class=MsoListParagraphCxSpMiddle style='margin-top:0cm;margin-right:0cm;
            margin-bottom:0cm;margin-left:1.0cm;margin-bottom:.0001pt;mso-add-space:auto;
            text-align:justify;text-indent:-18.0pt;line-height:150%;mso-list:l12 level1 lfo18'><![if !supportLists]><span
            lang=ES style='font-size:12.0pt;line-height:150%;font-family:Wingdings;
            mso-fareast-font-family:Wingdings;mso-bidi-font-family:Wingdings'><span
            style='mso-list:Ignore'>ü<span style='font:7.0pt "Times New Roman"'>&nbsp; </span></span></span><![endif]><span
            lang=ES style='font-size:12.0pt;line-height:150%;font-family:"Arial",sans-serif'>Elaborar
            y poner en marcha estrategias para el adecuado tratamiento de los conflictos y
            para el aprendizaje de la resolución pacífica de los mismos<o:p></o:p></span></p>

            <p class=MsoListParagraphCxSpMiddle style='margin-top:0cm;margin-right:0cm;
            margin-bottom:0cm;margin-left:1.0cm;margin-bottom:.0001pt;mso-add-space:auto;
            text-align:justify;text-indent:-18.0pt;line-height:150%;mso-list:l12 level1 lfo18'><![if !supportLists]><span
            lang=ES style='font-size:12.0pt;line-height:150%;font-family:Wingdings;
            mso-fareast-font-family:Wingdings;mso-bidi-font-family:Wingdings'><span
            style='mso-list:Ignore'>ü<span style='font:7.0pt "Times New Roman"'>&nbsp; </span></span></span><![endif]><span
            lang=ES style='font-size:12.0pt;line-height:150%;font-family:"Arial",sans-serif'>Elaborar
            de forma consensuada criterios y pautas de intervención ante conductas
            inadecuadas<o:p></o:p></span></p>

            <p class=MsoListParagraphCxSpMiddle style='margin-top:0cm;margin-right:0cm;
            margin-bottom:0cm;margin-left:1.0cm;margin-bottom:.0001pt;mso-add-space:auto;
            text-align:justify;text-indent:-18.0pt;line-height:150%;mso-list:l12 level1 lfo18'><![if !supportLists]><span
            lang=ES style='font-size:12.0pt;line-height:150%;font-family:Wingdings;
            mso-fareast-font-family:Wingdings;mso-bidi-font-family:Wingdings'><span
            style='mso-list:Ignore'>ü<span style='font:7.0pt "Times New Roman"'>&nbsp; </span></span></span><![endif]><span
            lang=ES style='font-size:12.0pt;line-height:150%;font-family:"Arial",sans-serif'>Definir
            los valores que nos caracterizan como organización, para ser un centro de
            trabajo en el que la tolerancia, el respeto, la solidaridad y la colaboración
            sean valores compartidos que se reflejen en acciones concretas<o:p></o:p></span></p>

            <p class=MsoListParagraphCxSpMiddle style='margin-top:0cm;margin-right:0cm;
            margin-bottom:0cm;margin-left:1.0cm;margin-bottom:.0001pt;mso-add-space:auto;
            text-align:justify;text-indent:-18.0pt;line-height:150%;mso-list:l12 level1 lfo18'><![if !supportLists]><span
            lang=ES style='font-size:12.0pt;line-height:150%;font-family:Wingdings;
            mso-fareast-font-family:Wingdings;mso-bidi-font-family:Wingdings'><span
            style='mso-list:Ignore'>ü<span style='font:7.0pt "Times New Roman"'>&nbsp; </span></span></span><![endif]><span
            lang=ES style='font-size:12.0pt;line-height:150%;font-family:"Arial",sans-serif'>Superar
            el racismo, discriminación o exclusión, canalizando las situaciones en que se
            produce, fomentado la empatía y el reconocimiento de los derechos de todas las
            personas por igual<o:p></o:p></span></p>

            <p class=MsoListParagraphCxSpLast style='margin-top:0cm;margin-right:0cm;
            margin-bottom:0cm;margin-left:1.0cm;margin-bottom:.0001pt;mso-add-space:auto;
            text-align:justify;text-indent:-18.0pt;line-height:150%;mso-list:l12 level1 lfo18'><![if !supportLists]><span
            lang=ES style='font-size:12.0pt;line-height:150%;font-family:Wingdings;
            mso-fareast-font-family:Wingdings;mso-bidi-font-family:Wingdings'><span
            style='mso-list:Ignore'>ü<span style='font:7.0pt "Times New Roman"'>&nbsp; </span></span></span><![endif]><span
            lang=ES style='font-size:12.0pt;line-height:150%;font-family:"Arial",sans-serif'>Describir
            las conductas asociadas al mejoramiento continuo de las relaciones
            interpersonales<o:p></o:p></span></p>

            <p class=MsoHeader style='text-align:justify;line-height:150%;tab-stops:center 36.0pt right 425.2pt'><b
            style='mso-bidi-font-weight:normal'><span lang=ES-MX style='font-size:12.0pt;
            line-height:150%;font-family:"Arial",sans-serif;mso-ansi-language:ES-MX'><o:p>&nbsp;</o:p></span></b></p>

            <p class=MsoHeader style='text-align:justify;line-height:150%;tab-stops:center 36.0pt right 425.2pt'><b
            style='mso-bidi-font-weight:normal'><span lang=ES-MX style='font-size:12.0pt;
            line-height:150%;font-family:"Arial",sans-serif;mso-ansi-language:ES-MX'>Explicación
            del Manual<o:p></o:p></span></b></p>

            <p class=MsoHeader style='margin-left:7.1pt;text-align:justify;line-height:
            150%;tab-stops:center 36.0pt right 425.2pt'><b style='mso-bidi-font-weight:
            normal'><span lang=ES-MX style='font-size:12.0pt;line-height:150%;font-family:
            "Arial",sans-serif;mso-ansi-language:ES-MX'><o:p>&nbsp;</o:p></span></b></p>

            <p class=MsoListParagraph style='margin-top:0cm;margin-right:0cm;margin-bottom:
            0cm;margin-left:7.1pt;margin-bottom:.0001pt;mso-add-space:auto;text-align:justify;
            line-height:150%'><span lang=ES style='font-size:12.0pt;line-height:150%;
            font-family:"Arial",sans-serif'>El Manual de Convivencia describe un conjunto
            de comportamientos que deberán ser evidenciados en las relaciones entre
            compañeros, partiendo del principio de creer en las personas y en que sus
            actuaciones están orientadas al mejoramiento continuo de las relaciones
            interpersonales, en caso de que existan diferentes situaciones en las que
            nuestros colaboradores se vean afectados, las mismas se canalizarán en el
            Comité de Convivencia Laboral, en pro de cumplir con las responsabilidades y
            deberes en nuestro lugar de trabajo, para mantener una buena conducta, actitud
            positiva, realizar las actividades correctamente y con responsabilidad <span
            style='mso-spacerun:yes'> </span>y así lograr un ambiente laboral armónico que
            contribuya al desarrollo personal y profesional<o:p></o:p></span></p>

            <p class=MsoNormal><span lang=ES style='mso-fareast-language:EN-US'><o:p>&nbsp;</o:p></span></p>

            <p class=MsoNormal><span lang=ES style='mso-fareast-language:EN-US'><o:p>&nbsp;</o:p></span></p>

            <p class=MsoHeader style='text-align:justify;line-height:150%;tab-stops:center 36.0pt right 425.2pt'><b
            style='mso-bidi-font-weight:normal'><span lang=ES-MX style='font-size:12.0pt;
            line-height:150%;font-family:"Arial",sans-serif;mso-ansi-language:ES-MX'><o:p>&nbsp;</o:p></span></b></p>

            <p class=MsoHeader style='text-align:justify;line-height:150%;tab-stops:center 36.0pt right 425.2pt'><b
            style='mso-bidi-font-weight:normal'><span lang=ES-MX style='font-size:12.0pt;
            line-height:150%;font-family:"Arial",sans-serif;mso-ansi-language:ES-MX'><o:p>&nbsp;</o:p></span></b></p>

            <p class=MsoHeader style='text-align:justify;line-height:150%;tab-stops:center 36.0pt right 425.2pt'><b
            style='mso-bidi-font-weight:normal'><span lang=ES-MX style='font-size:12.0pt;
            line-height:150%;font-family:"Arial",sans-serif;mso-ansi-language:ES-MX'>Principios
            de Convivencia<o:p></o:p></span></b></p>

            <p class=MsoHeader style='text-align:justify;line-height:150%;tab-stops:center 36.0pt right 425.2pt'><b
            style='mso-bidi-font-weight:normal'><span lang=ES-MX style='font-size:12.0pt;
            line-height:150%;font-family:"Arial",sans-serif;mso-ansi-language:ES-MX'><o:p>&nbsp;</o:p></span></b></p>

            <p class=MsoHeader style='margin-left:36.0pt;text-align:justify;text-indent:
            -18.0pt;line-height:150%;mso-list:l19 level1 lfo21;tab-stops:center 36.0pt right 425.2pt'><![if !supportLists]><span
            lang=ES-MX style='font-size:12.0pt;line-height:150%;font-family:"Arial",sans-serif;
            mso-fareast-font-family:Arial;mso-ansi-language:ES-MX'><span style='mso-list:
            Ignore'>1.<span style='font:7.0pt "Times New Roman"'>&nbsp;&nbsp;&nbsp; </span></span></span><![endif]><span
            lang=ES style='font-size:12.0pt;line-height:150%;font-family:"Arial",sans-serif'>Fomentar
            el trabajo en equipo basado en los principios de colaboración, lealtad,
            solidaridad, responsabilidad, compañerismo, cooperación entre las áreas y en
            todos los niveles de jerarquía.</span><b style='mso-bidi-font-weight:normal'><span
            lang=ES-MX style='font-size:12.0pt;line-height:150%;font-family:"Arial",sans-serif;
            mso-ansi-language:ES-MX'><o:p></o:p></span></b></p>

            <p class=MsoHeader style='margin-left:36.0pt;text-align:justify;text-indent:
            -18.0pt;line-height:150%;mso-list:l19 level1 lfo21;tab-stops:center 36.0pt right 425.2pt'><![if !supportLists]><span
            lang=ES-MX style='font-size:12.0pt;line-height:150%;font-family:"Arial",sans-serif;
            mso-fareast-font-family:Arial;mso-ansi-language:ES-MX'><span style='mso-list:
            Ignore'>2.<span style='font:7.0pt "Times New Roman"'>&nbsp;&nbsp;&nbsp; </span></span></span><![endif]><span
            lang=ES-MX style='font-size:12.0pt;line-height:150%;font-family:"Arial",sans-serif;
            mso-ansi-language:ES-MX'>Reconocer la importancia del trabajo en equipo para el
            buen desempeño del recurso humano de la organización<b style='mso-bidi-font-weight:
            normal'><o:p></o:p></b></span></p>

            <p class=MsoHeader style='margin-left:36.0pt;text-align:justify;text-indent:
            -18.0pt;line-height:150%;mso-list:l19 level1 lfo21;tab-stops:center 36.0pt right 425.2pt'><![if !supportLists]><span
            lang=ES-MX style='font-size:12.0pt;line-height:150%;font-family:"Arial",sans-serif;
            mso-fareast-font-family:Arial;mso-ansi-language:ES-MX'><span style='mso-list:
            Ignore'>3.<span style='font:7.0pt "Times New Roman"'>&nbsp;&nbsp;&nbsp; </span></span></span><![endif]><span
            lang=ES-MX style='font-size:12.0pt;line-height:150%;font-family:"Arial",sans-serif;
            mso-ansi-language:ES-MX'>Valorar los aportes realizados por los compañeros de
            trabajo y retroalimentar los diversos enfoques cuando sus conductas van en
            contra de los valores organizacionales<b style='mso-bidi-font-weight:normal'><o:p></o:p></b></span></p>

            <p class=MsoHeader style='margin-left:36.0pt;text-align:justify;text-indent:
            -18.0pt;line-height:150%;mso-list:l19 level1 lfo21;tab-stops:center 36.0pt right 425.2pt'><![if !supportLists]><span
            lang=ES-MX style='font-size:12.0pt;line-height:150%;font-family:"Arial",sans-serif;
            mso-fareast-font-family:Arial;mso-ansi-language:ES-MX'><span style='mso-list:
            Ignore'>4.<span style='font:7.0pt "Times New Roman"'>&nbsp;&nbsp;&nbsp; </span></span></span><![endif]><span
            lang=ES style='font-size:12.0pt;line-height:150%;font-family:"Arial",sans-serif;
            mso-bidi-font-weight:bold'>Construir relaciones de trabajo sanas, duraderas y
            productivas basadas en la tolerancia, confianza, respeto, honestidad y sensibilidad
            hacia los compañeros de trabajo.</span><b style='mso-bidi-font-weight:normal'><span
            lang=ES-MX style='font-size:12.0pt;line-height:150%;font-family:"Arial",sans-serif;
            mso-ansi-language:ES-MX'><o:p></o:p></span></b></p>

            <p class=MsoHeader style='margin-left:36.0pt;text-align:justify;text-indent:
            -18.0pt;line-height:150%;mso-list:l19 level1 lfo21;tab-stops:center 36.0pt right 425.2pt'><![if !supportLists]><span
            lang=ES-MX style='font-size:12.0pt;line-height:150%;font-family:"Arial",sans-serif;
            mso-fareast-font-family:Arial;mso-ansi-language:ES-MX'><span style='mso-list:
            Ignore'>5.<span style='font:7.0pt "Times New Roman"'>&nbsp;&nbsp;&nbsp; </span></span></span><![endif]><span
            lang=ES-MX style='font-size:12.0pt;line-height:150%;font-family:"Arial",sans-serif;
            mso-ansi-language:ES-MX'>Demostrar a través del ejemplo la coherencia entre lo
            que se dice y lo que se hace en la cotidianidad laboral, velando porque todas
            las actuaciones sean congruentes con nuestros valores personales y
            organizacionales.<b style='mso-bidi-font-weight:normal'><o:p></o:p></b></span></p>

            <p class=MsoHeader style='margin-left:36.0pt;text-align:justify;text-indent:
            -18.0pt;line-height:150%;mso-list:l19 level1 lfo21;tab-stops:center 36.0pt right 425.2pt'><![if !supportLists]><span
            lang=ES-MX style='font-size:12.0pt;line-height:150%;font-family:"Arial",sans-serif;
            mso-fareast-font-family:Arial;mso-ansi-language:ES-MX'><span style='mso-list:
            Ignore'>6.<span style='font:7.0pt "Times New Roman"'>&nbsp;&nbsp;&nbsp; </span></span></span><![endif]><span
            lang=ES-MX style='font-size:12.0pt;line-height:150%;font-family:"Arial",sans-serif;
            mso-ansi-language:ES-MX'>Adoptar la autodisciplina y el autocontrol como parte
            de la cultura corporativa<b style='mso-bidi-font-weight:normal'><o:p></o:p></b></span></p>

            <p class=MsoHeader style='margin-left:36.0pt;text-align:justify;text-indent:
            -18.0pt;line-height:150%;mso-list:l19 level1 lfo21;tab-stops:center 36.0pt right 425.2pt'><![if !supportLists]><span
            lang=ES-MX style='font-size:12.0pt;line-height:150%;font-family:"Arial",sans-serif;
            mso-fareast-font-family:Arial;mso-ansi-language:ES-MX'><span style='mso-list:
            Ignore'>7.<span style='font:7.0pt "Times New Roman"'>&nbsp;&nbsp;&nbsp; </span></span></span><![endif]><span
            lang=ES-MX style='font-size:12.0pt;line-height:150%;font-family:"Arial",sans-serif;
            mso-ansi-language:ES-MX'>Trabajar permanentemente para lograr un modelo
            positivo de </span><span lang=ES style='font-size:12.0pt;line-height:150%;
            font-family:"Arial",sans-serif'>comportamiento, demostrando integridad en lo
            que se hace, responsabilizándose de los actos y asumiendo las consecuencias de
            los mismos </span><span lang=ES-MX style='font-size:12.0pt;line-height:150%;
            font-family:"Arial",sans-serif;mso-ansi-language:ES-MX'><o:p></o:p></span></p>

            <p class=MsoHeader style='margin-left:36.0pt;text-align:justify;text-indent:
            -18.0pt;line-height:150%;mso-list:l19 level1 lfo21;tab-stops:center 36.0pt right 425.2pt'><![if !supportLists]><span
            lang=ES-MX style='font-size:12.0pt;line-height:150%;font-family:"Arial",sans-serif;
            mso-fareast-font-family:Arial;mso-ansi-language:ES-MX'><span style='mso-list:
            Ignore'>8.<span style='font:7.0pt "Times New Roman"'>&nbsp;&nbsp;&nbsp; </span></span></span><![endif]><span
            lang=ES style='font-size:12.0pt;line-height:150%;font-family:"Arial",sans-serif'>Actuar
            conforme a las Normas y a los estándares éticos definidos por la organización,</span><span
            lang=ES style='font-size:12.0pt;line-height:150%;font-family:"Arial",sans-serif;
            mso-ansi-language:ES-MX'> </span><span lang=ES style='font-size:12.0pt;
            line-height:150%;font-family:"Arial",sans-serif'>Cumplir el Reglamento Interno
            de Trabajo, el Reglamento de Seguridad y Salud en el Trabajo, los códigos de
            vestimenta, y demás normativas establecida por la organización</span><span
            lang=ES-MX style='font-size:12.0pt;line-height:150%;font-family:"Arial",sans-serif;
            mso-ansi-language:ES-MX'><o:p></o:p></span></p>

            <p class=MsoHeader style='margin-left:36.0pt;text-align:justify;text-indent:
            -18.0pt;line-height:150%;mso-list:l19 level1 lfo21;tab-stops:center 36.0pt right 425.2pt'><![if !supportLists]><span
            lang=ES-MX style='font-size:12.0pt;line-height:150%;font-family:"Arial",sans-serif;
            mso-fareast-font-family:Arial;mso-ansi-language:ES-MX'><span style='mso-list:
            Ignore'>9.<span style='font:7.0pt "Times New Roman"'>&nbsp;&nbsp;&nbsp; </span></span></span><![endif]><span
            lang=ES-MX style='font-size:12.0pt;line-height:150%;font-family:"Arial",sans-serif;
            mso-ansi-language:ES-MX'>Buscar la solución más apropiada a los conflictos de
            interés que se puedan presentar en la cotidianidad laboral, manteniendo una
            comunicación asertiva, aportando al conocimiento personal y profesional de los
            compañeros de trabajo<o:p></o:p></span></p>

            <p class=MsoHeader style='margin-left:36.0pt;text-align:justify;text-indent:
            -18.0pt;line-height:150%;mso-list:l19 level1 lfo21;tab-stops:center 36.0pt right 425.2pt'><![if !supportLists]><span
            lang=ES-MX style='font-size:12.0pt;line-height:150%;font-family:"Arial",sans-serif;
            mso-fareast-font-family:Arial;mso-ansi-language:ES-MX'><span style='mso-list:
            Ignore'>10.<span style='font:7.0pt "Times New Roman"'> </span></span></span><![endif]><span
            lang=ES-MX style='font-size:12.0pt;line-height:150%;font-family:"Arial",sans-serif;
            mso-ansi-language:ES-MX'>Respetar la integridad física y mental de nuestros
            compañeros de trabajo su filosofía religiosa, raza, preferencias políticas,
            diferencias individuales y culturales.<o:p></o:p></span></p>

            <p class=MsoHeader style='margin-left:36.0pt;text-align:justify;text-indent:
            -18.0pt;line-height:150%;mso-list:l19 level1 lfo21;tab-stops:center 36.0pt right 425.2pt'><![if !supportLists]><span
            lang=ES-MX style='font-size:12.0pt;line-height:150%;font-family:"Arial",sans-serif;
            mso-fareast-font-family:Arial;mso-ansi-language:ES-MX'><span style='mso-list:
            Ignore'>11.<span style='font:7.0pt "Times New Roman"'> </span></span></span><![endif]><span
            lang=ES-MX style='font-size:12.0pt;line-height:150%;font-family:"Arial",sans-serif;
            mso-ansi-language:ES-MX'>Dirigirse con respeto y amablemente a las personas
            presentes y ausentes, haciendo uso de los modales </span><span lang=ES
            style='font-size:12.0pt;line-height:150%;font-family:"Arial",sans-serif'>de
            educación al saludar y al despedirse de los compañeros de trabajo y al
            interactuar con todas las personas que integran el entorno laboral</span><span
            lang=ES-MX style='font-size:12.0pt;line-height:150%;font-family:"Arial",sans-serif;
            mso-ansi-language:ES-MX'><o:p></o:p></span></p>

            <p class=MsoHeader style='margin-left:36.0pt;text-align:justify;text-indent:
            -18.0pt;line-height:150%;mso-list:l19 level1 lfo21;tab-stops:center 36.0pt right 425.2pt'><![if !supportLists]><span
            lang=ES-MX style='font-size:12.0pt;line-height:150%;font-family:"Arial",sans-serif;
            mso-fareast-font-family:Arial;mso-ansi-language:ES-MX'><span style='mso-list:
            Ignore'>12.<span style='font:7.0pt "Times New Roman"'> </span></span></span><![endif]><span
            lang=ES-MX style='font-size:12.0pt;line-height:150%;font-family:"Arial",sans-serif;
            mso-ansi-language:ES-MX'>Generar espacios para escuchar a las personas antes de
            emitir juicios sobre ellas, respetando al interlocutor sin interrumpirlo y
            permitiendo de esta manera la defensa en caso de presentarse conductas no
            adecuadas para resolver las inquietudes y situaciones confusas<o:p></o:p></span></p>

            <p class=MsoHeader style='margin-left:36.0pt;text-align:justify;text-indent:
            -18.0pt;line-height:150%;mso-list:l19 level1 lfo21;tab-stops:center 36.0pt right 425.2pt'><![if !supportLists]><span
            lang=ES-MX style='font-size:12.0pt;line-height:150%;font-family:"Arial",sans-serif;
            mso-fareast-font-family:Arial;mso-ansi-language:ES-MX'><span style='mso-list:
            Ignore'>13.<span style='font:7.0pt "Times New Roman"'> </span></span></span><![endif]><span
            lang=ES-MX style='font-size:12.0pt;line-height:150%;font-family:"Arial",sans-serif;
            mso-ansi-language:ES-MX'>Propiciar la participación de las personas en la
            reuniones, creando para ello un clima de confianza, donde los asistentes opinen
            sin sentirse cohibidos o incómodos<o:p></o:p></span></p>

            <p class=MsoHeader style='margin-left:36.0pt;text-align:justify;text-indent:
            -18.0pt;line-height:150%;mso-list:l19 level1 lfo21;tab-stops:center 36.0pt right 425.2pt'><![if !supportLists]><span
            lang=ES-MX style='font-size:12.0pt;line-height:150%;font-family:"Arial",sans-serif;
            mso-fareast-font-family:Arial;mso-ansi-language:ES-MX'><span style='mso-list:
            Ignore'>14.<span style='font:7.0pt "Times New Roman"'> </span></span></span><![endif]><span
            lang=ES-MX style='font-size:12.0pt;line-height:150%;font-family:"Arial",sans-serif;
            mso-ansi-language:ES-MX'>Propiciar el diálogo como medio para gestionar los
            conflictos, Evitando las situaciones violentas o enfrentamientos, no tolerar
            actos amenazantes o represalias entre compañeros de trabajo<o:p></o:p></span></p>

            <p class=MsoHeader style='margin-left:36.0pt;text-align:justify;text-indent:
            -18.0pt;line-height:150%;mso-list:l19 level1 lfo21;tab-stops:center 36.0pt right 425.2pt'><![if !supportLists]><span
            lang=ES-MX style='font-size:12.0pt;line-height:150%;font-family:"Arial",sans-serif;
            mso-fareast-font-family:Arial;mso-ansi-language:ES-MX'><span style='mso-list:
            Ignore'>15.<span style='font:7.0pt "Times New Roman"'> </span></span></span><![endif]><span
            lang=ES-MX style='font-size:12.0pt;line-height:150%;font-family:"Arial",sans-serif;
            mso-ansi-language:ES-MX'>Fomentar un equilibrio entre el trabajo y la vida
            personal, respetando la vida privada de cada persona, fomentando espacios de
            esparcimiento para el bienestar de los empleados y su entorno familiar.<o:p></o:p></span></p>

            <p class=MsoHeader style='margin-left:36.0pt;text-align:justify;text-indent:
            -18.0pt;line-height:150%;mso-list:l19 level1 lfo21;tab-stops:center 36.0pt right 425.2pt'><![if !supportLists]><span
            lang=ES-MX style='font-size:12.0pt;line-height:150%;font-family:"Arial",sans-serif;
            mso-fareast-font-family:Arial;mso-ansi-language:ES-MX'><span style='mso-list:
            Ignore'>16.<span style='font:7.0pt "Times New Roman"'> </span></span></span><![endif]><span
            lang=ES style='font-size:12.0pt;line-height:150%;font-family:"Arial",sans-serif'>La
            toma de decisiones debe estar soportada en hechos y datos reales y no en la
            presunción de la ocurrencia de conductas inapropiadas, teniendo como premisa el
            diálogo argumentado como forma de lograr acuerdos frente a las diferencias</span><span
            lang=ES-MX style='font-size:12.0pt;line-height:150%;font-family:"Arial",sans-serif;
            mso-ansi-language:ES-MX'><o:p></o:p></span></p>

            <p class=MsoHeader style='margin-left:36.0pt;text-align:justify;text-indent:
            -18.0pt;line-height:150%;mso-list:l19 level1 lfo21;tab-stops:center 36.0pt right 425.2pt'><![if !supportLists]><span
            lang=ES-MX style='font-size:12.0pt;line-height:150%;font-family:"Arial",sans-serif;
            mso-fareast-font-family:Arial;mso-ansi-language:ES-MX'><span style='mso-list:
            Ignore'>17.<span style='font:7.0pt "Times New Roman"'> </span></span></span><![endif]><span
            lang=ES style='font-size:12.0pt;line-height:150%;font-family:"Arial",sans-serif'>Mantener
            una actitud positiva que promueva la sana</span><span lang=ES-MX
            style='font-size:12.0pt;line-height:150%;font-family:"Arial",sans-serif;
            mso-ansi-language:ES-MX'> convivencia, buscando siempre el beneficio mutuo en
            las relaciones de trabajo<o:p></o:p></span></p>

            <p class=MsoHeader style='margin-left:36.0pt;text-align:justify;text-indent:
            -18.0pt;line-height:150%;mso-list:l19 level1 lfo21;tab-stops:center 36.0pt right 425.2pt'><![if !supportLists]><span
            lang=ES-MX style='font-size:12.0pt;line-height:150%;font-family:"Arial",sans-serif;
            mso-fareast-font-family:Arial;mso-ansi-language:ES-MX'><span style='mso-list:
            Ignore'>18.<span style='font:7.0pt "Times New Roman"'> </span></span></span><![endif]><span
            lang=ES-MX style='font-size:12.0pt;line-height:150%;font-family:"Arial",sans-serif;
            mso-ansi-language:ES-MX'>Manejar de forma responsable y confidencial la
            información de la organización<o:p></o:p></span></p>

            <p class=MsoHeader style='margin-left:36.0pt;text-align:justify;text-indent:
            -18.0pt;line-height:150%;mso-list:l19 level1 lfo21;tab-stops:center 36.0pt right 425.2pt'><![if !supportLists]><span
            lang=ES-MX style='font-size:12.0pt;line-height:150%;font-family:"Arial",sans-serif;
            mso-fareast-font-family:Arial;mso-ansi-language:ES-MX'><span style='mso-list:
            Ignore'>19.<span style='font:7.0pt "Times New Roman"'> </span></span></span><![endif]><span
            lang=ES style='font-size:12.0pt;line-height:150%;font-family:"Arial",sans-serif'>Reconocer
            los logros de los compañeros de trabajo, expresando el reconocimiento del
            aporte del mismo a la organización<span style='mso-spacerun:yes'>  </span></span><span
            lang=ES-MX style='font-size:12.0pt;line-height:150%;font-family:"Arial",sans-serif;
            mso-ansi-language:ES-MX'><o:p></o:p></span></p>

            <p class=MsoHeader style='margin-left:36.0pt;text-align:justify;text-indent:
            -18.0pt;line-height:150%;mso-list:l19 level1 lfo21;tab-stops:center 36.0pt right 425.2pt'><![if !supportLists]><span
            lang=ES-MX style='font-size:12.0pt;line-height:150%;font-family:"Arial",sans-serif;
            mso-fareast-font-family:Arial;mso-ansi-language:ES-MX'><span style='mso-list:
            Ignore'>20.<span style='font:7.0pt "Times New Roman"'> </span></span></span><![endif]><span
            lang=ES style='font-size:12.0pt;line-height:150%;font-family:"Arial",sans-serif'>Resaltar
            las fortalezas del otro en vez de enfocarse en las debilidades, como forma de
            mantener una actitud positiva en el entorno laboral</span><span lang=ES-MX
            style='font-size:12.0pt;line-height:150%;font-family:"Arial",sans-serif;
            mso-ansi-language:ES-MX'><o:p></o:p></span></p>

            <p class=MsoHeader style='margin-left:36.0pt;text-align:justify;text-indent:
            -18.0pt;line-height:150%;mso-list:l19 level1 lfo21;tab-stops:center 36.0pt right 425.2pt'><![if !supportLists]><span
            lang=ES-MX style='font-size:12.0pt;line-height:150%;font-family:"Arial",sans-serif;
            mso-fareast-font-family:Arial;mso-ansi-language:ES-MX'><span style='mso-list:
            Ignore'>21.<span style='font:7.0pt "Times New Roman"'> </span></span></span><![endif]><span
            lang=ES style='font-size:12.0pt;line-height:150%;font-family:"Arial",sans-serif'>Hacer
            uso adecuado y respetuoso de las áreas comunes y puestos de trabajo,
            garantizando que permanezcan ordenados y limpios </span><span lang=ES-MX
            style='font-size:12.0pt;line-height:150%;font-family:"Arial",sans-serif;
            mso-ansi-language:ES-MX'><o:p></o:p></span></p>

            <p class=MsoHeader style='margin-left:36.0pt;text-align:justify;text-indent:
            -18.0pt;line-height:150%;mso-list:l19 level1 lfo21;tab-stops:center 36.0pt right 425.2pt'><![if !supportLists]><span
            lang=ES-MX style='font-size:12.0pt;line-height:150%;font-family:"Arial",sans-serif;
            mso-fareast-font-family:Arial;mso-ansi-language:ES-MX'><span style='mso-list:
            Ignore'>22.<span style='font:7.0pt "Times New Roman"'> </span></span></span><![endif]><span
            lang=ES style='font-size:12.0pt;line-height:150%;font-family:"Arial",sans-serif'>Respetar
            los espacios de trabajo compartidos</span><span lang=ES-MX style='font-size:
            12.0pt;line-height:150%;font-family:"Arial",sans-serif;mso-ansi-language:ES-MX'><o:p></o:p></span></p>

            <p class=MsoHeader style='margin-left:36.0pt;text-align:justify;text-indent:
            -18.0pt;line-height:150%;mso-list:l19 level1 lfo21;tab-stops:center 36.0pt right 425.2pt'><![if !supportLists]><span
            lang=ES-MX style='font-size:12.0pt;line-height:150%;font-family:"Arial",sans-serif;
            mso-fareast-font-family:Arial;mso-ansi-language:ES-MX'><span style='mso-list:
            Ignore'>23.<span style='font:7.0pt "Times New Roman"'> </span></span></span><![endif]><span
            lang=ES-MX style='font-size:12.0pt;line-height:150%;font-family:"Arial",sans-serif;
            mso-ansi-language:ES-MX'>No interrumpir las actividades de trabajo de los
            compañeros<o:p></o:p></span></p>

            <p class=MsoHeader style='margin-left:36.0pt;text-align:justify;text-indent:
            -18.0pt;line-height:150%;mso-list:l19 level1 lfo21;tab-stops:center 36.0pt right 425.2pt'><![if !supportLists]><span
            lang=ES-MX style='font-size:12.0pt;line-height:150%;font-family:"Arial",sans-serif;
            mso-fareast-font-family:Arial;mso-ansi-language:ES-MX'><span style='mso-list:
            Ignore'>24.<span style='font:7.0pt "Times New Roman"'> </span></span></span><![endif]><span
            lang=ES-MX style='font-size:12.0pt;line-height:150%;font-family:"Arial",sans-serif;
            mso-ansi-language:ES-MX'>Emplear un tono de voz adecuado al dirigirse a los
            demás<o:p></o:p></span></p>

            <p class=MsoHeader style='margin-left:36.0pt;text-align:justify;text-indent:
            -18.0pt;line-height:150%;mso-list:l19 level1 lfo21;tab-stops:center 36.0pt right 425.2pt'><![if !supportLists]><span
            lang=ES-MX style='font-size:12.0pt;line-height:150%;font-family:"Arial",sans-serif;
            mso-fareast-font-family:Arial;mso-ansi-language:ES-MX'><span style='mso-list:
            Ignore'>25.<span style='font:7.0pt "Times New Roman"'> </span></span></span><![endif]><span
            lang=ES-MX style='font-size:12.0pt;line-height:150%;font-family:"Arial",sans-serif;
            mso-ansi-language:ES-MX'>Comunicar oportunamente cualquier observación que
            pueda estimarse como acoso laboral.<o:p></o:p></span></p>

            <p class=MsoHeader style='margin-left:36.0pt;text-align:justify;line-height:
            150%;tab-stops:center 36.0pt right 425.2pt'><span lang=ES-MX style='font-size:
            12.0pt;line-height:150%;font-family:"Arial",sans-serif;mso-ansi-language:ES-MX'><o:p>&nbsp;</o:p></span></p>

            <p class=MsoHeader style='margin-left:36.0pt;text-align:justify;line-height:
            150%;tab-stops:center 36.0pt right 425.2pt'><span lang=ES-MX style='font-size:
            12.0pt;line-height:150%;font-family:"Arial",sans-serif;mso-ansi-language:ES-MX'><o:p>&nbsp;</o:p></span></p>

            <p class=MsoHeader style='margin-left:36.0pt;text-align:justify;line-height:
            150%;tab-stops:center 36.0pt right 425.2pt'><span lang=ES-MX style='font-size:
            12.0pt;line-height:150%;font-family:"Arial",sans-serif;mso-ansi-language:ES-MX'><o:p>&nbsp;</o:p></span></p>

            <p class=MsoHeader style='margin-left:36.0pt;text-align:justify;line-height:
            150%;tab-stops:center 36.0pt right 425.2pt'><span lang=ES-MX style='font-size:
            12.0pt;line-height:150%;font-family:"Arial",sans-serif;mso-ansi-language:ES-MX'><o:p>&nbsp;</o:p></span></p>

            <p class=MsoHeader style='margin-left:36.0pt;text-align:justify;line-height:
            150%;tab-stops:center 36.0pt right 425.2pt'><span lang=ES-MX style='font-size:
            12.0pt;line-height:150%;font-family:"Arial",sans-serif;mso-ansi-language:ES-MX'><o:p>&nbsp;</o:p></span></p>

            <p class=MsoHeader style='margin-left:36.0pt;text-align:justify;line-height:
            150%;tab-stops:center 36.0pt right 425.2pt'><span lang=ES-MX style='font-size:
            12.0pt;line-height:150%;font-family:"Arial",sans-serif;mso-ansi-language:ES-MX'><o:p>&nbsp;</o:p></span></p>

            <p class=MsoHeader style='margin-left:36.0pt;text-align:justify;line-height:
            150%;tab-stops:center 36.0pt right 425.2pt'><span lang=ES-MX style='font-size:
            12.0pt;line-height:150%;font-family:"Arial",sans-serif;mso-ansi-language:ES-MX'><o:p>&nbsp;</o:p></span></p>

            <p class=MsoHeader style='margin-left:36.0pt;text-align:justify;line-height:
            150%;tab-stops:center 36.0pt right 425.2pt'><span lang=ES-MX style='font-size:
            12.0pt;line-height:150%;font-family:"Arial",sans-serif;mso-ansi-language:ES-MX'><o:p>&nbsp;</o:p></span></p>

            <p class=MsoHeader style='margin-left:36.0pt;text-align:justify;line-height:
            150%;tab-stops:center 36.0pt right 425.2pt'><span lang=ES-MX style='font-size:
            12.0pt;line-height:150%;font-family:"Arial",sans-serif;mso-ansi-language:ES-MX'><o:p>&nbsp;</o:p></span></p>

            <p class=MsoHeader style='text-align:justify;line-height:150%;tab-stops:center 36.0pt right 425.2pt'><b
            style='mso-bidi-font-weight:normal'><span lang=ES-MX style='font-size:12.0pt;
            line-height:150%;font-family:"Arial",sans-serif;mso-ansi-language:ES-MX'><o:p>&nbsp;</o:p></span></b></p>

            <p class=MsoHeader style='text-align:justify;line-height:150%;tab-stops:center 36.0pt right 425.2pt'><b
            style='mso-bidi-font-weight:normal'><span lang=ES-MX style='font-size:12.0pt;
            line-height:150%;font-family:"Arial",sans-serif;mso-ansi-language:ES-MX'><o:p>&nbsp;</o:p></span></b></p>

            <p class=MsoHeader style='text-align:justify;line-height:150%;tab-stops:center 36.0pt right 425.2pt'><b
            style='mso-bidi-font-weight:normal'><span lang=ES-MX style='font-size:12.0pt;
            line-height:150%;font-family:"Arial",sans-serif;mso-ansi-language:ES-MX'>Compromisos
            de la Empresa <o:p></o:p></span></b></p>

            <p class=MsoHeader style='margin-left:36.0pt;text-align:justify;line-height:
            150%;tab-stops:center 36.0pt right 425.2pt'><span lang=ES-MX style='font-size:
            12.0pt;line-height:150%;font-family:"Arial",sans-serif;mso-ansi-language:ES-MX'><o:p>&nbsp;</o:p></span></p>

            <p class=MsoListParagraphCxSpFirst style='text-align:justify;text-indent:-18.0pt;
            line-height:150%;mso-list:l8 level1 lfo23'><![if !supportLists]><span lang=ES
            style='font-size:12.0pt;line-height:150%;font-family:"Arial",sans-serif;
            mso-fareast-font-family:Arial'><span style='mso-list:Ignore'>1.<span
            style='font:7.0pt "Times New Roman"'>&nbsp;&nbsp;&nbsp; </span></span></span><![endif]><span
            lang=ES style='font-size:12.0pt;line-height:150%;font-family:"Arial",sans-serif'>Promover
            un ambiente laboral positivo y armónico para todos en igualdad de oportunidades,
            garantizando un ambiente de trabajo libre de discriminaciones e inequidad. <o:p></o:p></span></p>

            <p class=MsoListParagraphCxSpLast style='text-align:justify;text-indent:-18.0pt;
            line-height:150%;mso-list:l8 level1 lfo23'><![if !supportLists]><span lang=ES
            style='font-size:12.0pt;line-height:150%;font-family:"Arial",sans-serif;
            mso-fareast-font-family:Arial'><span style='mso-list:Ignore'>2.<span
            style='font:7.0pt "Times New Roman"'>&nbsp;&nbsp;&nbsp; </span></span></span><![endif]><span
            lang=ES style='font-size:12.0pt;line-height:150%;font-family:"Arial",sans-serif'>Programar
            Talleres de capacitación para el desarrollo personal y profesional de los
            trabajadores.<o:p></o:p></span></p>

            <p class=MsoHeader style='margin-left:36.0pt;text-align:justify;text-indent:
            -18.0pt;line-height:150%;mso-list:l8 level1 lfo23;tab-stops:center 36.0pt right 425.2pt'><![if !supportLists]><span
            lang=ES-MX style='font-size:12.0pt;line-height:150%;font-family:"Arial",sans-serif;
            mso-fareast-font-family:Arial;mso-ansi-language:ES-MX'><span style='mso-list:
            Ignore'>3.<span style='font:7.0pt "Times New Roman"'>&nbsp;&nbsp;&nbsp; </span></span></span><![endif]><span
            lang=ES style='font-size:12.0pt;line-height:150%;font-family:"Arial",sans-serif'>Desde
            la alta dirección se promueve la participación de los empleados para las
            decisiones que inciden en la organización, fomentando el diálogo para construir
            criterios en pro del beneficio de ambas partes</span><span lang=ES-MX
            style='font-size:12.0pt;line-height:150%;font-family:"Arial",sans-serif;
            mso-ansi-language:ES-MX'><o:p></o:p></span></p>

            <p class=MsoHeader style='margin-left:36.0pt;text-align:justify;text-indent:
            -18.0pt;line-height:150%;mso-list:l8 level1 lfo23;tab-stops:center 36.0pt right 425.2pt'><![if !supportLists]><span
            lang=ES-MX style='font-size:12.0pt;line-height:150%;font-family:"Arial",sans-serif;
            mso-fareast-font-family:Arial;mso-ansi-language:ES-MX'><span style='mso-list:
            Ignore'>4.<span style='font:7.0pt "Times New Roman"'>&nbsp;&nbsp;&nbsp; </span></span></span><![endif]><span
            lang=ES style='font-size:12.0pt;line-height:150%;font-family:"Arial",sans-serif'>Establecer
            metas claras y acordes a las capacidades de las personas, con la finalidad de
            desarrollar el potencial de los miembros del equipo.</span><span lang=ES-MX
            style='font-size:12.0pt;line-height:150%;font-family:"Arial",sans-serif;
            mso-ansi-language:ES-MX'><o:p></o:p></span></p>

            <p class=MsoListParagraphCxSpFirst style='text-align:justify;text-indent:-18.0pt;
            line-height:150%;mso-list:l8 level1 lfo23'><![if !supportLists]><span lang=ES
            style='font-size:12.0pt;line-height:150%;font-family:"Arial",sans-serif;
            mso-fareast-font-family:Arial'><span style='mso-list:Ignore'>5.<span
            style='font:7.0pt "Times New Roman"'>&nbsp;&nbsp;&nbsp; </span></span></span><![endif]><span
            lang=ES style='font-size:12.0pt;line-height:150%;font-family:"Arial",sans-serif'>Tratar
            sin distinción de color, religión, preferencia sexual o nacionalidad a los
            trabajadores de la empresa.<o:p></o:p></span></p>

            <p class=MsoListParagraphCxSpMiddle style='text-align:justify;text-indent:-18.0pt;
            line-height:150%;mso-list:l8 level1 lfo23'><![if !supportLists]><span lang=ES
            style='font-size:12.0pt;line-height:150%;font-family:"Arial",sans-serif;
            mso-fareast-font-family:Arial'><span style='mso-list:Ignore'>6.<span
            style='font:7.0pt "Times New Roman"'>&nbsp;&nbsp;&nbsp; </span></span></span><![endif]><span
            lang=ES-MX style='font-size:12.0pt;line-height:150%;font-family:"Arial",sans-serif;
            mso-ansi-language:ES-MX'>Informar con veracidad y claridad todos los aspectos
            relevantes y las decisiones que adopte la organización y que incidan
            directamente en los trabajadores</span><span lang=ES style='font-size:12.0pt;
            line-height:150%;font-family:"Arial",sans-serif'><o:p></o:p></span></p>

            <p class=MsoListParagraphCxSpMiddle style='text-align:justify;text-indent:-18.0pt;
            line-height:150%;mso-list:l8 level1 lfo23'><![if !supportLists]><span lang=ES
            style='font-size:12.0pt;line-height:150%;font-family:"Arial",sans-serif;
            mso-fareast-font-family:Arial'><span style='mso-list:Ignore'>7.<span
            style='font:7.0pt "Times New Roman"'>&nbsp;&nbsp;&nbsp; </span></span></span><![endif]><span
            lang=ES style='font-size:12.0pt;line-height:150%;font-family:"Arial",sans-serif'>Hacer
            cumplir los horarios de trabajo establecidos y respetar el horario de descanso<o:p></o:p></span></p>

            <p class=MsoListParagraphCxSpMiddle style='text-align:justify;text-indent:-18.0pt;
            line-height:150%;mso-list:l8 level1 lfo23'><![if !supportLists]><span lang=ES
            style='font-size:12.0pt;line-height:150%;font-family:"Arial",sans-serif;
            mso-fareast-font-family:Arial'><span style='mso-list:Ignore'>8.<span
            style='font:7.0pt "Times New Roman"'>&nbsp;&nbsp;&nbsp; </span></span></span><![endif]><span
            lang=ES style='font-size:12.0pt;line-height:150%;font-family:"Arial",sans-serif'>Programar
            actividades de recreación en pro del bienestar laboral.<o:p></o:p></span></p>

            <p class=MsoListParagraphCxSpMiddle style='text-align:justify;line-height:150%'><span
            lang=ES style='font-size:12.0pt;line-height:150%;font-family:"Arial",sans-serif'><o:p>&nbsp;</o:p></span></p>

            <p class=MsoListParagraphCxSpMiddle style='text-align:justify;line-height:150%'><span
            lang=ES style='font-size:12.0pt;line-height:150%;font-family:"Arial",sans-serif'><o:p>&nbsp;</o:p></span></p>

            <p class=MsoListParagraphCxSpMiddle style='text-align:justify;line-height:150%'><span
            lang=ES style='font-size:12.0pt;line-height:150%;font-family:"Arial",sans-serif'><o:p>&nbsp;</o:p></span></p>

            <p class=MsoListParagraphCxSpMiddle style='text-align:justify;line-height:150%'><span
            lang=ES style='font-size:12.0pt;line-height:150%;font-family:"Arial",sans-serif'><o:p>&nbsp;</o:p></span></p>

            <p class=MsoListParagraphCxSpMiddle style='text-align:justify;line-height:150%'><span
            lang=ES style='font-size:12.0pt;line-height:150%;font-family:"Arial",sans-serif'><o:p>&nbsp;</o:p></span></p>

            <p class=MsoListParagraphCxSpLast style='text-align:justify;line-height:150%'><span
            lang=ES style='font-size:12.0pt;line-height:150%;font-family:"Arial",sans-serif'><o:p>&nbsp;</o:p></span></p>

            <p class=MsoHeader style='text-align:justify;line-height:150%;tab-stops:center 36.0pt right 425.2pt'><b
            style='mso-bidi-font-weight:normal'><span lang=ES-MX style='font-size:12.0pt;
            line-height:150%;font-family:"Arial",sans-serif;mso-ansi-language:ES-MX'>Conductas
            No Apropiadas que se deben evitar<span style='mso-spacerun:yes'>  </span><o:p></o:p></span></b></p>

            <p class=MsoListParagraphCxSpFirst><span lang=ES style='font-size:12.0pt;
            line-height:115%;font-family:"Arial",sans-serif'><o:p>&nbsp;</o:p></span></p>

            <p class=MsoListParagraphCxSpMiddle style='margin-left:35.45pt;mso-add-space:
            auto;text-align:justify;text-indent:-14.15pt;line-height:150%;mso-list:l23 level1 lfo24'><![if !supportLists]><span
            lang=ES style='font-size:12.0pt;line-height:150%;font-family:"Arial",sans-serif;
            mso-fareast-font-family:Arial'><span style='mso-list:Ignore'>1.<span
            style='font:7.0pt "Times New Roman"'>&nbsp; </span></span></span><![endif]><span
            lang=ES style='font-size:12.0pt;line-height:150%;font-family:"Arial",sans-serif'>Realizar
            comentarios de descalificación profesional<o:p></o:p></span></p>

            <p class=MsoListParagraphCxSpMiddle style='margin-left:35.45pt;mso-add-space:
            auto;text-align:justify;text-indent:-14.15pt;line-height:150%;mso-list:l23 level1 lfo24'><![if !supportLists]><span
            lang=ES style='font-size:12.0pt;line-height:150%;font-family:"Arial",sans-serif;
            mso-fareast-font-family:Arial'><span style='mso-list:Ignore'>2.<span
            style='font:7.0pt "Times New Roman"'>&nbsp; </span></span></span><![endif]><span
            lang=ES style='font-size:12.0pt;line-height:150%;font-family:"Arial",sans-serif'>No
            suministrar información y materiales indispensables para cumplir con las
            labores designadas.<o:p></o:p></span></p>

            <p class=MsoListParagraphCxSpMiddle style='margin-left:35.45pt;mso-add-space:
            auto;text-align:justify;text-indent:-14.15pt;line-height:150%;mso-list:l23 level1 lfo24'><![if !supportLists]><span
            lang=ES style='font-size:12.0pt;line-height:150%;font-family:"Arial",sans-serif;
            mso-fareast-font-family:Arial'><span style='mso-list:Ignore'>3.<span
            style='font:7.0pt "Times New Roman"'>&nbsp; </span></span></span><![endif]><span
            lang=ES style='font-size:12.0pt;line-height:150%;font-family:"Arial",sans-serif'>Expresarse
            de manera ofensiva sobre la persona, utilizando palabras groseras o
            cuestionando sobre su origen familiar, raza, género, creencias religiosas,
            preferencias políticas o sexuales<o:p></o:p></span></p>

            <p class=MsoListParagraphCxSpMiddle style='margin-left:35.45pt;mso-add-space:
            auto;text-align:justify;text-indent:-14.15pt;line-height:150%;mso-list:l23 level1 lfo24'><![if !supportLists]><span
            lang=ES style='font-size:12.0pt;line-height:150%;font-family:"Arial",sans-serif;
            mso-fareast-font-family:Arial'><span style='mso-list:Ignore'>4.<span
            style='font:7.0pt "Times New Roman"'>&nbsp; </span></span></span><![endif]><span
            lang=ES style='font-size:12.0pt;line-height:150%;font-family:"Arial",sans-serif'>Descalificar
            las actividades realizadas por un compañero de trabajo.<o:p></o:p></span></p>

            <p class=MsoListParagraphCxSpMiddle style='margin-left:35.45pt;mso-add-space:
            auto;text-align:justify;text-indent:-14.15pt;line-height:150%;mso-list:l23 level1 lfo24'><![if !supportLists]><span
            lang=ES style='font-size:12.0pt;line-height:150%;font-family:"Arial",sans-serif;
            mso-fareast-font-family:Arial'><span style='mso-list:Ignore'>5.<span
            style='font:7.0pt "Times New Roman"'>&nbsp; </span></span></span><![endif]><span
            lang=ES style='font-size:12.0pt;line-height:150%;font-family:"Arial",sans-serif'>Especificaciones
            poco claras de funciones y tareas en el puesto de trabajo<o:p></o:p></span></p>

            <p class=MsoListParagraphCxSpMiddle style='margin-left:35.45pt;mso-add-space:
            auto;text-align:justify;text-indent:-14.15pt;line-height:150%;mso-list:l23 level1 lfo24'><![if !supportLists]><span
            lang=ES style='font-size:12.0pt;line-height:150%;font-family:"Arial",sans-serif;
            mso-fareast-font-family:Arial'><span style='mso-list:Ignore'>6.<span
            style='font:7.0pt "Times New Roman"'>&nbsp; </span></span></span><![endif]><span
            lang=ES style='font-size:12.0pt;line-height:150%;font-family:"Arial",sans-serif'>Ignorar
            o dejar de incluir a una persona en las actividades de la empresa<o:p></o:p></span></p>

            <p class=MsoListParagraphCxSpMiddle style='margin-left:35.45pt;mso-add-space:
            auto;text-align:justify;line-height:150%'><span lang=ES style='font-size:12.0pt;
            line-height:150%;font-family:"Arial",sans-serif'><o:p>&nbsp;</o:p></span></p>

            <p class=MsoListParagraphCxSpMiddle style='margin-left:14.2pt;mso-add-space:
            auto;text-align:justify;line-height:150%'><span lang=ES style='font-size:12.0pt;
            line-height:150%;font-family:"Arial",sans-serif'><o:p>&nbsp;</o:p></span></p>

            <p class=MsoListParagraphCxSpMiddle style='margin-left:14.2pt;mso-add-space:
            auto;text-align:justify;line-height:150%'><span lang=ES style='font-size:12.0pt;
            line-height:150%;font-family:"Arial",sans-serif'>Conscientes de la importancia
            de establecer mecanismos de prevención de las conductas de acoso laboral, la Empresa
            conforma el Comité de Convivencia Laboral, el cual establecerá actividades
            tendientes a generar una conciencia colectiva de sana convivencia, que promueva
            el trabajo en condiciones dignas entre quienes comparten vida laboral
            empresarial, la Empresa se compromete a vigilar el cumplimiento de las normas
            dirigidas a prevenir cualquier conducta o comportamiento que implique la
            calificación de acoso laboral y a dar trámite oportuno a las quejas que pueden
            surgir <span style='mso-spacerun:yes'> </span>en torno al mismo a través del
            Comité de Convivencia Laboral.<o:p></o:p></span></p>

            <p class=MsoListParagraphCxSpMiddle style='margin-left:14.2pt;mso-add-space:
            auto;text-align:justify;line-height:150%'><span lang=ES style='font-size:12.0pt;
            line-height:150%;font-family:"Arial",sans-serif'><o:p>&nbsp;</o:p></span></p>

            <p class=MsoListParagraphCxSpLast style='margin-left:72.0pt;mso-add-space:auto'><span
            lang=ES style='font-size:12.0pt;line-height:115%;font-family:"Arial",sans-serif'><o:p>&nbsp;</o:p></span></p>

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
