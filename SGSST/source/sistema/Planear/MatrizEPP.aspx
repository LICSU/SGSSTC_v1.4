<%@ Page Title="" Language="C#" MasterPageFile="~/source/MasterPages/Menu.Master" AutoEventWireup="true" CodeBehind="MatrizEPP.aspx.cs" Inherits="SGSST.source.sistema.Planear.MatrizEPP" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <asp:UpdatePanel ID="updatePanelPrinicpal" runat="server">
        <ContentTemplate>

            <ol class="breadcrumb">
                <li><a href="#">Planear</a></li>
                <li><a href="#">Matriz Epp</a></li>
            </ol>

            <div class="page-header">
                <h1 class="text-center">MATRIZ EPP</h1>
            </div>

            <div class="row">
                <div class="box-body">
                    <div class="dataTables_wrapper form-inline dt-bootstrap">


                        <asp:GridView ID="GridView1" class="table table-bordered table-hover dataTable" runat="server"
                            AutoGenerateColumns="false" AllowPaging="true" PageSize="10" 
                            OnPageIndexChanging="GridView1_PageIndexChanging" 
                            EmptyDataText="No existen Registros">
                            <Columns>

                                <asp:TemplateField HeaderText="Nombre" HeaderStyle-CssClass="text-center">
                                    <ItemTemplate>
                                        <asp:Label ID="nombre" runat="server" Text='<%# Eval("nombre") %>' />
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="Marca/Modelo" HeaderStyle-CssClass="text-center">
                                    <ItemTemplate>
                                        <asp:Label ID="marca_modelo" runat="server" Text='<%# Eval("marca_modelo") %>' />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                
                                <asp:TemplateField HeaderText="Uso" HeaderStyle-CssClass="text-center">
                                    <ItemTemplate>
                                        <asp:Label ID="uso" runat="server" Text='<%# Eval("uso") %>' />
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="Imagen" HeaderStyle-CssClass="text-center">
                                    <ItemTemplate>
                                        <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("url_imagen") %>'/>
                                    </ItemTemplate>
                                </asp:TemplateField>

                            </Columns>

                        </asp:GridView>

                    </div>
                </div>
            </div>

        </ContentTemplate>
        <Triggers></Triggers>
    </asp:UpdatePanel>
</asp:Content>
