<%@ Page Language="C#" MasterPageFile="~/source/MasterPages/Menu.Master" AutoEventWireup="true" CodeBehind="index_Politica_SST.aspx.cs" Inherits="SGSSTC.source.sistema.Hacer.index_Politica_SST" %>

<%@ Register Assembly="CKEditor.NET" Namespace="CKEditor.NET" TagPrefix="CKEditor" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server"></asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <ol class="breadcrumb">
        <li><a href="#">Fase: Planear</a></li>
        <li><a href="index_PerfilCargo.aspx">index Perfil de Cargo</a></li>
        <li><a href="#">Política SST</a></li>
    </ol>

    <div class="page-header">
        <h1 class="text-center">Política de Seguridad y Salud en el Trabajo</h1>
    </div>

    <div class="row text-center">
        <div class="col-md-2 col-md-offset-5">
            <h4>Año</h4>
            <asp:DropDownList CssClass="form-control" runat="server" ID="ddlYear"></asp:DropDownList>
        </div>
    </div>

    <br />

    <div class="row">
        <div class="box">
            <div class="panel-group" id="accordion">
                <div class="panel panel-default">
                    <div class="panel-heading bg-aqua color-palette">
                        <h4 class="panel-title"><a data-toggle="collapse" data-parent="#accordion" href="#collapse1">COMPROMISO DE LA EMPRESA</a></h4>
                    </div>

                    <div id="collapse1" class="panel-collapse collapse">
                        <div class="panel-body">
                            <CKEditor:CKEditorControl ID="txtCompromiso" BasePath="/ckeditor/" runat="server"></CKEditor:CKEditorControl>
                        </div>
                    </div>
                </div>

                <div class="panel panel-default">
                    <div class="panel-heading bg-aqua color-palette">
                        <h4 class="panel-title"><a data-toggle="collapse" data-parent="#accordion" href="#collapse3">ALCANCE</a></h4>
                    </div>

                    <div id="collapse3" class="panel-collapse collapse">
                        <div class="panel-body">
                            <CKEditor:CKEditorControl ID="txtAlcance" BasePath="/ckeditor/" runat="server">
                            <p><h3><strong>Compromiso de la Empresa</strong></h3><br />
                            
                            Establecer la postura de la Organización con respecto a la protección en materia de seguridad y
                                salud de sus empleados, desarrollando todas las actividades operacionales en pro de preservar
                                la integridad del personal, las instalaciones, la producción y el medio ambiente</p>

                            </CKEditor:CKEditorControl>
                        </div>

                    </div>
                </div>

                <div class="panel panel-default">
                    <div class="panel-heading bg-aqua color-palette">
                        <h4 class="panel-title"><a data-toggle="collapse" data-parent="#accordion" href="#collapse2">EN TAL SENTIDO LA EMPRESA SE COMPROMETE A</a></h4>
                    </div>

                    <div id="collapse2" class="panel-collapse collapse">
                        <div class="panel-body">
                            <CKEditor:CKEditorControl ID="txtObjetivos" BasePath="/ckeditor/" runat="server"></CKEditor:CKEditorControl>
                        </div>

                    </div>
                </div>

            </div>

        </div>
    </div>

    <div class="row text-center">

        <div class="col-md-4 col-md-offset-2">
            <asp:ImageButton alt="-" ID="btnSave" runat="server" ImageUrl="~\ico\agregar.png"
                OnClick="btnSave_Click" />
            <h4>Guardar y/o Actualizar</h4>
        </div>

        <div class="col-md-4">
            <asp:ImageButton alt="-" ID="btnPrint" runat="server" ImageUrl="~\ico\print.png"
                OnClick="GenerarDocumento" />
            <h4>Generar Documento</h4>
        </div>
    </div>

</asp:Content>
