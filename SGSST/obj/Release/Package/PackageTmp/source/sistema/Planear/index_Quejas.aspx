<%@ Page Title="" Language="C#" MasterPageFile="~/source/MasterPages/Menu.Master" AutoEventWireup="true" CodeBehind="index_Quejas.aspx.cs" Inherits="SGSST.source.sistema.Planear.index_Quejas" %>

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

        <p class=MsoNormal align=center style='text-align:center;line-height:normal'><b
        style='mso-bidi-font-weight:normal'><span lang=ES style='font-size:12.0pt'>COMITÉ
        DE CONVIVENCIA LABORAL<o:p></o:p></span></b></p>

        <p class=MsoNormal align=center style='text-align:center;line-height:normal'><b
        style='mso-bidi-font-weight:normal'><span lang=ES style='font-size:12.0pt'>FORMATO
        PARA INTERPONER UNA QUEJA POR ACOSO LABORAL<o:p></o:p></span></b></p>

        <p class=MsoNormal align=center style='text-align:center'><span lang=ES><o:p>&nbsp;</o:p></span></p>

        <p class=MsoNormal><span lang=ES>Fecha de presentación de la queja:
        ________________________________________________</span></p>

        <p class=MsoNormal><span lang=ES>Nombre de quien presenta la queja:
        _______________________________________________</span></p>

        <p class=MsoNormal><span lang=ES>Cargo:
        _______________________________________________________________________</span></p>

        <p class=MsoNormal><span lang=ES>Correo electrónico:
        _____________________________________________________________</span></p>

        <p class=MsoNormal><span lang=ES>Persona contra quien se presenta la queja:
        _________________________________________</span></p>

        <p class=MsoNormal><span lang=ES>Cargo: ________________________________________________________________________</span></p>

        <p class=MsoNormal><span lang=ES>Hechos que motivan su queja (indique
        brevemente tiempo, modo y lugar de los hechos)</span></p>

        <p class=MsoNormal><span lang=ES>_______________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________</span></p>

        <p class=MsoNormal><span lang=ES>Pruebas que respaldan su queja</span></p>

        <p class=MsoNormal><span lang=ES>_____________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________</span></p>

        <p class=MsoNormal><span lang=ES><o:p>&nbsp;</o:p></span></p>

        <p class=MsoNormal><span lang=ES>__________________________________</span></p>

        <p class=MsoNormal><span lang=ES>Firma de quien presenta la queja</span></p>

        <p class=MsoNormal><span lang=ES>C.C </span></p>

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
