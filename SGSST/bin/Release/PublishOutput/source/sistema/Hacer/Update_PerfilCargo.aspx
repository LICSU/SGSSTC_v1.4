<%@ Page Title="" Language="C#" MasterPageFile="~/source/MasterPages/Menu.Master" AutoEventWireup="true" CodeBehind="Update_PerfilCargo.aspx.cs" Inherits="SGSSTC.source.sistema.Hacer.Update_PerfilCargo" %>
<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>
<%@ Register Assembly="CKEditor.NET" Namespace="CKEditor.NET" TagPrefix="CKEditor" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server"></asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <ol class="breadcrumb">
        <li><a href="#">Fase: Hacer</a></li>
        <li><a href="index_PerfilCargo.aspx">index Perfil de Cargo</a></li>
        <li><a href="#">Editar Perfil de Cargo</a></li>
    </ol>

    <asp:PlaceHolder ID="phAlerta" runat="server" Visible="false">
        <div ID="divAlerta" runat="server">
            <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>            
            <asp:Label ID="lbAlerta" runat="server" Text="Label"></asp:Label>
            <asp:TextBox ID="txtAlerta" visible="false" runat="server"></asp:TextBox>
        </div>
    </asp:PlaceHolder>


    <div class="page-header">
        <h1 class="text-center">Editar Perfil de Cargo</h1>
    </div>

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
                        
            </CKEditor:CKEditorControl>
        </div>

    </div>

    <br />
    <hr />

    <div class="row text-center">

        <div class="col-md-4 col-md-offset-4">
            <asp:ImageButton alt="-" ID="btnEdit" runat="server" ImageUrl="~\ico\editar.png"
                OnClick="btnEdit_Click" />
            <h4>Actualizar</h4>
        </div>

    </div>

</asp:Content>
