<%@ Page Title="" Language="C#" MasterPageFile="~/source/MasterPages/Menu.Master" AutoEventWireup="true" CodeBehind="index_PolPrevAcoLab.aspx.cs" Inherits="SGSST.source.sistema.Planear.index_PolPrevAcoLab" %>

<%@ Register Assembly="CKEditor.NET" Namespace="CKEditor.NET" TagPrefix="CKEditor" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server"></asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        
    <ol class="breadcrumb">
        <li><a href="#">Fase: Planear</a></li>
        <li><a href="#">Politica de Prevención de Acoso Laboral</a></li>
    </ol>
    
    <div class="page-header">
        <h1 class="text-center">Pólitica de Prevención de Acoso Laboral</h1>
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
                    <h3>COMPROMISO DE LA EMPRESA</h3>
                    <p><h4>
                        Conscientes de la importancia de definir mecanismos de prevención de las conductas de acoso laboral, 
                        en la Compañía se ha creado el Comité de Convivencia Laboral, que en conjunto con todos los trabajadores
                        de la organización establecerá actividades en pro de generar una sana convivencia que promueva el trabajo 
                        en equipo y armonía entre los integrantes que hacen vida laboral en la organización.
                        <br /><br />
                        la Organización está comprometida a proporcionar un ambiente de trabajo sano, seguro y adecuado a sus
                        trabajadores, Implementando para ello mecanismos que erradiquen el acoso laboral, Velando por el 
                        cumplimiento de las Normas establecidas en el Manual de Convivencia en pro de evitar cualquier 
                        comportamiento que pueda calificar como acoso laboral.
                        <br /><br />
                        La Empresa se compromete a dar tramite oportuno a las quejas presentadas al comité de convivencia en 
                        torno a conductas inapropiadas que promuevan el acoso en cualquiera de sus formas, generando acciones 
                        que permitan establecer una cultura en donde se promueva la tolerancia y no discriminación, Con el 
                        propósito de asegurar que todos los empleados de esta organización tengan un entorno de trabajo en el 
                        que la dignidad de la persona sea respetada, en todos los níveles de jerarquía sin primar quién sea la 
                        víctima o el ofensor, ni cuál sea su rango jerárquico, Cualquier persona involucrada en un comportamiento 
                        de hostigamiento será sujeta a investigación de acuerdo a lo establecido en la normatividad vigente,
                        procedimientos y sus respectivas medidas disciplinarias
                    </h4></p>

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

