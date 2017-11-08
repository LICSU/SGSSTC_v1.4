<%@ Page Language="C#" MasterPageFile="~/source/MasterPages/Menu.Master" AutoEventWireup="true" CodeBehind="Update_Trabajador.aspx.cs" Inherits="SGSSTC.source.sistema.GestionDatos.Update_Trabajador" %>
<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server"></asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <asp:UpdatePanel ID="MyUpdatePanel" runat="server">
        <ContentTemplate>

            <ol class="breadcrumb">
                <li><a href="#">Gestión de Datos</a></li>
                <li><a href="../GestionDatos/index_Trabajador.aspx">Trabajador</a></li>
                <li><a href="#">Editar Trabajador</a></li>
            </ol>

            <div class="page-header">
                <h1 class="text-center">Editar Trabajador</h1>
            </div>

            <asp:PlaceHolder ID="phAlerta" runat="server" Visible="false">
                <div id="divAlerta" runat="server">
                    <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                    <asp:Label ID="lbAlerta" runat="server" Text="Label"></asp:Label>
                </div>
            </asp:PlaceHolder>

            <!-- Empresa y sucursal -->
            <asp:PlaceHolder runat="server" ID="phEmpresa1" Visible="false">
                <div class="row">
                    <div class="col-md-4  col-md-offset-4">
                        <h4>Empresa</h4>

                        <asp:DropDownList runat="server" ID="ddlEmpresas" data-toggle="tooltip" data-placement="bottom"
                            title="Seleccione una empresa" CssClass="form-control" AutoPostBack="true"
                            OnSelectedIndexChanged="ddlEmpresas_SelectedIndexChanged">
                        </asp:DropDownList>

                        <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" SetFocusOnError="true"
                            Display="Dynamic" ForeColor="#B50128" Font-Size="10" Font-Bold="true"
                            ControlToValidate="ddlEmpresas" runat="server" ValidationGroup="ValidationAdd" />
                    </div>
                </div>
            </asp:PlaceHolder>

            <asp:PlaceHolder runat="server" ID="phSucursal1" Visible="false">
                <div class="row">
                    <div class="col-md-4  col-md-offset-4">
                        <h4>Sucursal</h4>

                        <asp:DropDownList runat="server" ID="ddlSucursal" data-toggle="tooltip" data-placement="bottom"
                            title="Seleccione una Sucursal" CssClass="form-control" AutoPostBack="true"
                            OnSelectedIndexChanged="ddlSucursal_SelectedIndexChanged">
                        </asp:DropDownList>

                        <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" SetFocusOnError="true"
                            Display="Dynamic" ForeColor="#B50128" Font-Size="10" Font-Bold="true" runat="server"
                            ControlToValidate="ddlSucursal" ValidationGroup="ValidationAdd" />
                    </div>
                </div>
            </asp:PlaceHolder>

            <div class="row">
                <div class="col-md-4 col-md-offset-2">
                    <h4>Primer Nombre</h4>

                    <asp:TextBox runat="server" MaxLength="50" ID="txtNombre1" CssClass="form-control" placeholder="Primer Nombre"
                        data-toggle="tooltip" data-placement="bottom" title="Ingrese el primer nombre del trabajador(a)"></asp:TextBox>

                    <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" SetFocusOnError="true" Display="Dynamic"
                        ForeColor="#B50128" Font-Size="10" Font-Bold="true" ControlToValidate="txtNombre1" runat="server"
                        ValidationGroup="ValidationAdd" />
                </div>

                <div class="col-md-4">
                    <h4>Segundo Nombre</h4>

                    <asp:TextBox runat="server" MaxLength="50" ID="txtNombre2" CssClass="form-control" placeholder="Segundo Nombre"
                        data-toggle="tooltip" data-placement="bottom" title="Ingrese el segundo nombre del trabajador(a)"></asp:TextBox>

                </div>
            </div>

            <div class="row">
                <div class="col-md-4 col-md-offset-2">
                    <h4>Primer Apellido</h4>

                    <asp:TextBox runat="server" MaxLength="50" ID="txtApellido1" CssClass="form-control"
                        placeholder="Primer Apellido" data-toggle="tooltip" data-placement="bottom"
                        title="Ingrese el primer apellido del trabajador(a)"></asp:TextBox>

                    <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" SetFocusOnError="true" Display="Dynamic"
                        ForeColor="#B50128" Font-Size="10" Font-Bold="true" ControlToValidate="txtApellido1" runat="server"
                        ValidationGroup="ValidationAdd" />
                </div>

                <div class="col-md-4">
                    <h4>Segundo Apellido</h4>

                    <asp:TextBox runat="server" MaxLength="50" ID="txtApellido2" CssClass="form-control"
                        placeholder="Segundo Apellido" data-toggle="tooltip" data-placement="bottom"
                        title="Ingrese el segundo apellido del trabajador(a)"></asp:TextBox>

                    <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" SetFocusOnError="true" Display="Dynamic"
                        ForeColor="#B50128" Font-Size="10" Font-Bold="true" ControlToValidate="txtApellido2" runat="server"
                        ValidationGroup="ValidationAdd" />
                </div>
            </div>

            <div class="row">
                <div class="col-md-4 col-md-offset-2">
                    <h4>Estatus</h4>

                    <asp:DropDownList runat="server" ID="ddlEstatus" CssClass="form-control" data-toggle="tooltip" data-placement="bottom"
                        title="Seleccion el estatus dentro de la empresa en la que se encuentra el trabajador(a)">
                    </asp:DropDownList>

                    <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" SetFocusOnError="true" Display="Dynamic"
                        ForeColor="#B50128" Font-Size="10" Font-Bold="true" ControlToValidate="ddlEstatus" runat="server"
                        ValidationGroup="ValidationAdd" />
                </div>

                <div class="col-md-4">
                    <h4>Documento de Identidad</h4>

                    <asp:TextBox runat="server" MaxLength="15" ID="txtCedula" CssClass="form-control" placeholder="Cédula"
                        TextMode="Number" data-toggle="tooltip" data-placement="bottom"
                        title="Ingrese el numero de identidad del trabajador(a)"></asp:TextBox>

                    <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" SetFocusOnError="true" Display="Dynamic"
                        ForeColor="#B50128" Font-Size="10" Font-Bold="true" ControlToValidate="txtCedula" runat="server"
                        ValidationGroup="ValidationAdd" />
                </div>
            </div>

            <div class="row">
                <div class="col-md-4 col-md-offset-2">
                    <h4>Fecha de Nacimiento</h4>
                    <asp:TextBox runat="server" ID="txtFechadeNacimiento" CssClass="form-control" TextMode="Date"
                        placeholder="yyyy-MM-dd" data-toggle="tooltip" data-placement="bottom"
                        title="Ingrese la fecha de nacimiento del trabajador(a)"></asp:TextBox>

                    <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" SetFocusOnError="true" Display="Dynamic"
                        ForeColor="#B50128" Font-Size="10" Font-Bold="true" ControlToValidate="txtFechadeNacimiento" runat="server"
                        ValidationGroup="ValidationAdd" />
                </div>

                <div class="col-md-4">
                    <h4>Email</h4>

                    <asp:TextBox runat="server" MaxLength="50" ID="txtEmail" CssClass="form-control" placeholder="Email"
                        data-toggle="tooltip" data-placement="bottom" title="Ingrese el correo electronico del trabajador(a)"></asp:TextBox>

                </div>
            </div>

            <div class="row">
                <div class="col-md-4 col-md-offset-2">
                    <h4>Puesto de Trabajo</h4>

                    <asp:DropDownList runat="server" ID="ddlPuestoTrabajo"
                        data-toggle="tooltip" data-placement="bottom" title="Seleccione el Puesto de Trabajo del trabajador(a)"
                        CssClass="form-control">
                    </asp:DropDownList>

                    <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" SetFocusOnError="true"
                        Display="Dynamic" ForeColor="#B50128" Font-Size="10" Font-Bold="true"
                        ControlToValidate="ddlPuestoTrabajo" runat="server" ValidationGroup="ValidationAdd" />
                </div>

                <div class="col-md-4">
                    <h4>Sexo</h4>

                    <asp:DropDownList runat="server" ID="ddlSexo" CssClass="form-control" data-toggle="tooltip"
                        data-placement="bottom" title="Ingrese el sexo del trabajador(a)">
                        <asp:ListItem Text="Seleccione un Valor" Value=""></asp:ListItem>
                        <asp:ListItem Text="Femenino" Value="Femenino"></asp:ListItem>
                        <asp:ListItem Text="Masculino" Value="Masculino"></asp:ListItem>
                    </asp:DropDownList>

                    <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" SetFocusOnError="true" Display="Dynamic"
                        ForeColor="#B50128" Font-Size="10" Font-Bold="true" ControlToValidate="ddlSexo" runat="server"
                        ValidationGroup="ValidationAdd" />
                </div>

            </div>

            <div class="row">
                <div class="col-md-4 col-md-offset-2">
                    <h4>Estado Civil</h4>

                    <asp:DropDownList runat="server" ID="ddlEdoCivil" CssClass="form-control" data-toggle="tooltip"
                        data-placement="bottom" title="Ingrese el estado civil del trabajador(a)">
                        <asp:ListItem Text="Seleccione un Valor" Value=""></asp:ListItem>
                        <asp:ListItem Text="Soltero(a)" Value="Soltero(a)"></asp:ListItem>
                        <asp:ListItem Text="Casado(a)" Value="Casado(a)"></asp:ListItem>
                        <asp:ListItem Text="Divorciado(a)" Value="Divorciado(a)"></asp:ListItem>
                        <asp:ListItem Text="Viudo(a)" Value="Viudo(a)"></asp:ListItem>
                    </asp:DropDownList>

                    <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" SetFocusOnError="true" Display="Dynamic"
                        ForeColor="#B50128" Font-Size="10" Font-Bold="true" ControlToValidate="ddlEdoCivil" runat="server"
                        ValidationGroup="ValidationAdd" />
                </div>

                <div class="col-md-4">
                    <h4>Cargo</h4>

                    <asp:DropDownList runat="server" ID="ddlCargo" CssClass="form-control" data-toggle="tooltip"
                        data-placement="bottom" title="Seleccione el cargo del trabajador(a)">
                    </asp:DropDownList>

                    <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" SetFocusOnError="true" Display="Dynamic"
                        ForeColor="#B50128" Font-Size="10" Font-Bold="true" ControlToValidate="ddlCargo" runat="server"
                        ValidationGroup="ValidationAdd" />
                </div>
            </div>

            <div class="row">
                <div class="col-md-4 col-md-offset-2">
                    <h4>Télefono Casa</h4>

                    <asp:TextBox runat="server" MaxLength="15" ID="txtTelCasa" CssClass="form-control" placeholder="Casa"
                        TextMode="Number" data-toggle="tooltip" data-placement="bottom"
                        title="Ingrese el número de telefono de casa del trabajador(a)"></asp:TextBox>

                    <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" SetFocusOnError="true" Display="Dynamic"
                        ForeColor="#B50128" Font-Size="10" Font-Bold="true" ControlToValidate="txtTelCasa" runat="server"
                        ValidationGroup="ValidationAdd" />
                </div>

                <div class="col-md-4">
                    <h4>Télefono Movil</h4>

                    <asp:TextBox runat="server" MaxLength="15" ID="txtTelCelular" CssClass="form-control" placeholder="Celular"
                        TextMode="Number" data-toggle="tooltip" data-placement="bottom"
                        title="Ingrese el número de teléfono movil del trabajador(a)"></asp:TextBox>

                    <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" SetFocusOnError="true" Display="Dynamic"
                        ForeColor="#B50128" Font-Size="10" Font-Bold="true" ControlToValidate="txtTelCelular" runat="server"
                        ValidationGroup="ValidationAdd" />
                </div>
            </div>

            <div class="row">
                <div class="col-md-8 col-md-offset-2">
                    <h4>Dirección</h4>
                    <asp:TextBox runat="server" MaxLength="100" ID="txtDireccion" CssClass="form-control" TextMode="MultiLine"
                        Columns="3" data-toggle="tooltip" data-placement="bottom" title="Ingrese la dirección del trabajador(a)"></asp:TextBox>

                    <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" SetFocusOnError="true" Display="Dynamic"
                        ForeColor="#B50128" Font-Size="10" Font-Bold="true" ControlToValidate="txtDireccion" runat="server"
                        ValidationGroup="ValidationAdd" />
                </div>
            </div>

            <div class="row">
                <div class="col-md-3 col-md-offset-1">
                    <h4>Región donde Reside</h4>

                    <asp:DropDownList runat="server" ID="ddlRegion" CssClass="form-control" AutoPostBack="true"
                        OnSelectedIndexChanged="ddlRegion_SelectedIndexChanged" data-toggle="tooltip" data-placement="bottom"
                        title="Seleccione la región donde reside el trabajador(a)">
                    </asp:DropDownList>

                    <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" SetFocusOnError="true" Display="Dynamic"
                        ForeColor="#B50128" Font-Size="10" Font-Bold="true" ControlToValidate="ddlRegion" runat="server"
                        ValidationGroup="ValidationAdd" />
                </div>

                <div class="col-md-4">
                    <h4>Departamento donde Reside</h4>

                    <asp:DropDownList runat="server" ID="ddlDepartamento" CssClass="form-control" AutoPostBack="true"
                        OnSelectedIndexChanged="ddlDepartamento_SelectedIndexChanged" data-toggle="tooltip" data-placement="bottom"
                        title="Seleccione el departamento donde reside el trabajador(a)">
                    </asp:DropDownList>

                    <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" SetFocusOnError="true" Display="Dynamic"
                        ForeColor="#B50128" Font-Size="10" Font-Bold="true" ControlToValidate="ddlDepartamento" runat="server"
                        ValidationGroup="ValidationAdd" />
                </div>

                <div class="col-md-3">
                    <h4>Municipio donde Reside</h4>

                    <asp:DropDownList runat="server" ID="ddlMunicipio" CssClass="form-control" data-toggle="tooltip"
                        data-placement="bottom" title="Seleccione el municipio  donde reside el trabajador(a)">
                    </asp:DropDownList>

                    <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" SetFocusOnError="true" Display="Dynamic"
                        ForeColor="#B50128" Font-Size="10" Font-Bold="true" ControlToValidate="ddlMunicipio" runat="server"
                        ValidationGroup="ValidationAdd" />
                </div>
            </div>

            <div class="row">
                <div class="col-md-4 col-md-offset-2">
                    <h4>¿Es Discapacitado?</h4>

                    <asp:DropDownList runat="server" ID="ddlDiscapacitado" CssClass="form-control" AutoPostBack="true"
                        data-toggle="tooltip" data-placement="bottom" title="Seleccione si el trabajador(a) tiene una discapacidad">
                        <asp:ListItem Text="Seleccione un Valor" Value=""></asp:ListItem>
                        <asp:ListItem Text="Si" Value="Si"></asp:ListItem>
                        <asp:ListItem Text="No" Value="No"></asp:ListItem>
                    </asp:DropDownList>

                    <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" SetFocusOnError="true" Display="Dynamic"
                        ForeColor="#B50128" Font-Size="10" Font-Bold="true" ControlToValidate="ddlDiscapacitado" runat="server"
                        ValidationGroup="ValidationAdd" />
                </div>

                <div class="col-md-4">
                    <br />
                    <br />

                    <asp:TextBox runat="server" ID="txtDiscapacidad" MaxLength="200" CssClass="form-control" Visible="false"
                        placeholder="Descripcion Discapacidad" data-toggle="tooltip" data-placement="bottom"
                        title="Ingrese la discapacidad del trabajador(a)"></asp:TextBox>
                </div>
            </div>

            <div class="row">
                <div class="col-md-4 col-md-offset-2">
                    <h4>Mano Dominante</h4>

                    <asp:DropDownList runat="server" ID="ddlManodominante" CssClass="form-control" data-toggle="tooltip"
                        data-placement="bottom" title="Seleccione la mano dominante del trabajador(a)">
                        <asp:ListItem Text="Derecha" Value="Derecha"></asp:ListItem>
                        <asp:ListItem Text="Izquierda" Value="Izquierda"></asp:ListItem>
                    </asp:DropDownList>

                    <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" SetFocusOnError="true" Display="Dynamic"
                        ForeColor="#B50128" Font-Size="10" Font-Bold="true" ControlToValidate="ddlManodominante" runat="server"
                        ValidationGroup="ValidationAdd" />
                </div>

                <div class="col-md-4">
                    <h4>Tipo Vinculacion Laboral</h4>

                    <asp:DropDownList runat="server" ID="ddlTipoVinculacion" CssClass="form-control" data-toggle="tooltip"
                        data-placement="bottom" title="Seleccione el tipo de vinculación laboral del trabajador(a) con la empresa">
                        <asp:ListItem Text="Contrato" Value="Contrato"></asp:ListItem>
                        <asp:ListItem Text="Carrera" Value="Carrera"></asp:ListItem>
                        <asp:ListItem Text="Cooperador" Value="Cooperador"></asp:ListItem>
                        <asp:ListItem Text="Estudiante o aprendiz" Value="Estudiante o aprendiz"></asp:ListItem>
                        <asp:ListItem Text="Independiente" Value="Independiente"></asp:ListItem>
                    </asp:DropDownList>

                    <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" SetFocusOnError="true" Display="Dynamic"
                        ForeColor="#B50128" Font-Size="10" Font-Bold="true" ControlToValidate="ddlTipoVinculacion" runat="server"
                        ValidationGroup="ValidationAdd" />
                </div>
            </div>

            <div class="row">
                <div class="col-md-4 col-md-offset-2">
                    <h4>Tipo de Horario</h4>

                    <asp:DropDownList runat="server" ID="ddlTipoHorario" CssClass="form-control" data-toggle="tooltip"
                        data-placement="bottom" title="Seleccione el tipo de horario del trabajador(a)">
                        <asp:ListItem Text="Diurno" Value="Diurno"></asp:ListItem>
                        <asp:ListItem Text="Nocturno" Value="Nocturno"></asp:ListItem>
                        <asp:ListItem Text="Mixto" Value="Mixto"></asp:ListItem>
                    </asp:DropDownList>

                    <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" SetFocusOnError="true" Display="Dynamic"
                        ForeColor="#B50128" Font-Size="10" Font-Bold="true" ControlToValidate="ddlTipoHorario" runat="server"
                        ValidationGroup="ValidationAdd" />
                </div>

                <div class="col-md-4">
                    <h4>Horario</h4>

                    <asp:DropDownList runat="server" ID="ddlHorario" CssClass="form-control" data-toggle="tooltip"
                        data-placement="bottom" title="Seleccione el horario del trabajador(a)">
                    </asp:DropDownList>

                    <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" SetFocusOnError="true" Display="Dynamic"
                        ForeColor="#B50128" Font-Size="10" Font-Bold="true" ControlToValidate="ddlHorario" runat="server"
                        ValidationGroup="ValidationAdd" />
                </div>
            </div>

            <div class="row">
                <div class="col-md-4 col-md-offset-2">
                    <h4>Salario</h4>

                    <asp:TextBox runat="server" MaxLength="15" ID="txtSalario" CssClass="form-control" data-toggle="tooltip"
                        data-placement="bottom" title="Ingrese el salario (en pesos colombianos) del trabajador(a)"></asp:TextBox>

                    <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" SetFocusOnError="true" Display="Dynamic"
                        ForeColor="#B50128" Font-Size="10" Font-Bold="true" ControlToValidate="txtSalario" runat="server"
                        ValidationGroup="ValidationAdd" />
                </div>

                <div class="col-md-4">
                    <h4>Fecha de Ingreso</h4>

                    <asp:TextBox runat="server" ID="txtFechaIngreso" CssClass="form-control" TextMode="Date" placeholder="yyyy-MM-dd"
                        data-toggle="tooltip" data-placement="bottom"
                        title="Ingrese la fecha de ingreso del trabajador(a) a la empresa"></asp:TextBox>

                    <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" SetFocusOnError="true" Display="Dynamic"
                        ForeColor="#B50128" Font-Size="10" Font-Bold="true" ControlToValidate="txtFechaIngreso" runat="server"
                        ValidationGroup="ValidationAdd" />
                </div>

            </div>

            <div class="row">
                <div class="col-md-4 col-md-offset-2">
                    <h4>Caja de Compensación Familiar</h4>

                    <asp:DropDownList runat="server" ID="ddlCcf" CssClass="form-control" data-toggle="tooltip"
                        data-placement="bottom" title="Seleccione la Caja de Compensación Familiar del trabajador(a)">
                    </asp:DropDownList>

                    <asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" SetFocusOnError="true" Display="Dynamic"
                        ForeColor="#B50128" Font-Size="10" Font-Bold="true" ControlToValidate="ddlCcf" runat="server"
                        ValidationGroup="ValidationAdd" />
                </div>

                <div class="row">
                    <div class="col-md-4">
                        <h4>Foto</h4>

                        <asp:Image alt="-" runat="server" ID="ImgFoto" CssClass="img-thumbnail" />

                        <asp:FileUpload runat="server" ID="fuFoto" />

                    </div>
                </div>
                <br />

            </div>

            <br />
            <hr />

            <!-- aceptar y cancelar-->
            <div class="row">
                <div class="col-md-2 col-md-offset-5">
                    <asp:Button runat="server" ID="btnAceptar" Text="Aceptar" OnClick="btnAceptar_Click"
                        class="btn btn-block btn-info" ValidationGroup="ValidationAdd"
                        data-toggle="tooltip" data-placement="bottom" title="Presione para registrar el trabajador"></asp:Button>
                </div>
            </div>

        </ContentTemplate>
        <Triggers>
            <asp:PostBackTrigger ControlID="btnAceptar" />
        </Triggers>
    </asp:UpdatePanel>

</asp:Content>