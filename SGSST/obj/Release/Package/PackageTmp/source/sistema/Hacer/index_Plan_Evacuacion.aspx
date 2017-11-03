<%@ Page Language="C#" MasterPageFile="~/source/MasterPages/Menu.Master" AutoEventWireup="true" CodeBehind="index_Plan_Evacuacion.aspx.cs" Inherits="SGSSTC.source.sistema.Hacer.index_Plan_Evacuacion" %>
<%@ Register Assembly="CKEditor.NET" Namespace="CKEditor.NET" TagPrefix="CKEditor" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, 	PublicKeyToken=31bf3856ad364e35"	Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server"></asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

	<ol class="breadcrumb">
		<li><a href="#">Fase: Hacer</a></li>
		<li><a href="#">Plan De Evacuación</a></li>
	</ol>

	<div class="page-header">
		<h3 class="text-center">Plan De Evacuación</h3>
	</div>

    <asp:PlaceHolder ID="phAlerta" runat="server" Visible="false">
        <div id="divAlerta" runat="server">
            <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
            <asp:Label ID="lbAlerta" runat="server" Text="Label"></asp:Label>
        </div>
    </asp:PlaceHolder>
    <asp:TextBox ID="txtBuscar" runat="server" Visible="false"></asp:TextBox>
	<div class="row form-group">
		<asp:PlaceHolder runat="server" ID="phEmpresa">
			<div class="col-md-4">
				<h4 class="text-center">Empresa</h4>
				<asp:DropDownList runat="server" ID="ddlEmpresa" data-toggle="tooltip" data-placement="bottom" title="Seleccione una Empresa" class="form-control" AutoPostBack="true" OnSelectedIndexChanged="ddlEmpresa_SelectedIndexChanged"></asp:DropDownList>
			</div>
		</asp:PlaceHolder>

		<asp:PlaceHolder runat="server" ID="phSucursal">
			<div class="col-md-4 col-md-offset-4">
				<h4 class="text-center">Sucursal</h4>
				<asp:DropDownList runat="server" ID="ddlSucursal" data-toggle="tooltip" data-placement="bottom" title="Seleccione una Sucursal" class="form-control" AutoPostBack="true"
					OnSelectedIndexChanged="ddlSucursal_SelectedIndexChanged">
				</asp:DropDownList>

				<asp:RequiredFieldValidator ErrorMessage="<p>Campo Obligatorio!</p>" SetFocusOnError="true"
					Display="Dynamic" ForeColor="#B50128" Font-Size="10" Font-Bold="true" ControlToValidate="ddlSucursal"
					runat="server" ValidationGroup="ValidationAdd" />
			</div>
		</asp:PlaceHolder>
	</div>

	<div class="row" align="left">
		<div class="col-md-12">
		</div>
	</div>

	<asp:PlaceHolder runat="server" ID="phckeditor" Visible="false">
		<div class="row">
			<CKEditor:CKEditorControl Height="1000" ID="txtPlanEvacuacion" BasePath="~/ckeditor/" runat="server">
					<h3>Plan de Evacuación: </h3><br />
					Son las estrategias definidas para el desplazamiento de las personas en una situación de peligro 
					inminente a un sitio seguro , las cuales deben ser divulgadas y conocidas en todos los niveles de 
					la Organización.

					<h4>Fases de un Plan de Evacuación:</h4>

					<h4>Detección: </h4>
					Es el tiempo transcurrido desde el momento en que se origina el peligro hasta que alguien lo 
					reconoce, durante esta fase la persona que detecta el peligro debe informar a la Brigada de 
					Emergencia para verificar la veracidad del mismo
					
					<h4>Alarma: </h4>
					Mecanismo que se activa, luego de tomar la decisión de Evacuar, una vez corroborada la situación de 
					Emergencia
					
					<h4>Preparación para la Salida: </h4>
					Proceso de Verificación de quienes están en el recinto, indicar instrucciones para apagar los 
					equipos o interrumpir el fluido eléctrico de ser necesario, trancar las puertas sin seguro y 
					recordar las vías de evacuación y  el punto de reunión final
					
					<h4>Salida: </h4>
					Tiempo transcurrido desde que sale la primera persona hasta que sale la última, el coordinador de 
					la brigada de evacuación dirigirá la salida del personal a través de los pasillos, verificando que
					no permanezca nadie dentro de la instalación, que se mantenga el orden, que las personas no se 
					devuelvan, que se de prioridad a las personas con mayor riesgo y verificar en el punto de reunión 
					final la cantidad de personal evacuado
					<br />
					<a style="opacity:1;">#NOBORRAR#</a>
					<h3>Instructivo Básico De Evacuación </h3><br/>
					
					<ul>
						<li>Todo el personal de la Empresa debe conocer las Rutas de Evacuación al momento de recibir la orden de evacuar, en lo posible se deberá desenergizar los equipos que se encuentren conectados a la red de energía eléctrica, según procedimientos técnicos previamente acordados.</li>
						<li>Una vez iniciado el proceso de evacuación, nadie debe devolverse a recoger artefactos ú elementos personales, "SU VIDA ES MAS IMPORTANTE".</li>
						<li>Antes de salir verificar el estado de las vías de evacuación</li>
						<li>A fin de evitar situaciones precipitadas con el consiguiente desorden y/o pánico, el personal debe seguir solo las órdenes del brigadista de Evacuación, según las instrucciones estipuladas en el presente Plan.</li>
						<li>No utilizar ascensores</li>
						<li>Sí Ud. se ve alcanzado por las llamas (fuego), y estás cubren parcial ó totalmente su cuerpo, NO CORRA, tírese al suelo libre de sustancias combustibles y haga rodar su cuerpo.</li>
						<li>Sí Ud. se encuentra en compañía de algún usuario, deberá acompañarlo(a) y guiarlo(a) por la vía de evacuación hacia el punto de encuentro señalada para esa área en el presente documento.</li>
						<li>Al momento de ordenarse la evacuación, Ud. se encuentra en otras dependencias ó en el baño, deberá seguir las instrucciones que imparta el brigadista de evacuación de esa área, procediendo por la vía de evacuación hacia la zona de seguridad correspondiente, informe de su ubicación para facilitar el conteo de las personas</li>
						<li>Verificar la lista de personal en el punto de reunión final</li>
						<li>Verificar que no haya quedado nadie dentro de las instalaciones</li>
						<li>Colaborar con los organismo de socorro para el control del evento</li>
					</ul>
					
					<h3>Rutas de evacuación </h3><br/>
					
					<strong>Principal</strong><br/>
					La ruta principal, corresponde a la vía de salida más viable para las diferentes áreas, es decir, 
					es aquella donde se recorrerán las distancias más cortas.
					
					<strong>Ruta alterna</strong><br/>
					Teniendo en cuenta, que en el evento de un siniestro que conlleve a una evacuación, la salida 
					principal podría obstruirse por las características del mismo, se debe contar al menos con otra 
					opción de salida, evaluada de la misma forma que la ruta principal.
					
					<strong>Punto de Reunión Final </strong><br/>
					Una vez se ha salido de la edificación, es necesario que todos los ocupantes se reúnan en un lugar 
					determinado, para verificar que todos hayan salido y establecer las novedades. En el punto de 
					reunión final se establecerá, si se puede o no retornar a las labores.
					
					<strong>Punto de encuentro </strong><br/>
					Espacio(s) de reunión para la ubicación de las personas después de la evacuación,deben estar 
					preferiblemente al aire libre, señalizado, delimitado y libre de riesgos como:
					<ul>
						<li>Cables de alta tensión,</li>
						<li>Árboles en riesgo de caída,</li>
						<li>Muros en riesgo de colapso.</li>
					</ul>

					<h3>Señalización de Evacuación </h3><br/>
					Es necesario Anexar el Plano de Planta, indicando las rutas de evacuación, el plano de la 
					institución o empresa debe ser claro, contener las diferentes áreas, que permitan marcar la 
					circulación y colocar la señalización sugerida. Debe contener la descripción necesaria para 
					identificar los diferentes elementos.
					
					la señalización tiene como objetivo orientar a las personas en cuanto a las rutas que deben tomar. 
					Dicha señalización reafirma las rutas que se han tomado en los simulacros y genera confianza entre 
					las personas,
					
					Para que la señalización preventiva sea realmente efectiva, debe cumplir con unas características 
					elementales, entre las que se destacan:
					<ul>
						<li>Atraer la atención de quien la observa</li>
						<li>Dar a conocer el mensaje previsto con suficiente anterioridad</li>
						<li>Informar sobre la conducta a seguir</li>
						<li>Ser clara y de interpretación única</li>
						<li>Permitir a quien la observe crear la necesidad de cumplir con lo indicado La señalización no elimina el riesgo solamente lo resalta. Por lo tanto, nunca da seguridad efectiva o real. Debe emplearse como técnica complementaria de las medidas de control</li>
					</ul>
					
					Se dispondrán señales o pictogramas y planos de “Ud. esta aquí”, con la descripción de las 
					Instrucciones de actuación de carácter general a tener en cuenta en caso de emergencia:
					<ul>
						<li>Las vías de evacuación y salidas.</li>
						<li>Itinerario de salida más próximo que corresponde a su área.</li>
						<li>La localización de los medios de detección, alarma y extinción.</li>
					</ul>

					Atención y respuesta
					Acciones para superar una condición crítica
					<ul>
						<li>Atención de afectados</li>
						<li>Atención de Lesionados:</li>
						<li>Cadena de socorros –Triage: estabilización y transporte de heridos</li>
					</ul>
					De acuerdo a los protocolos de emergencia todo plan de evacuación debe ser divulgado, practicado, 
					evaluado escrito y estar actualizado para ser aprobado determinando su efectividad y falencias ante
					un evento.
			</CKEditor:CKEditorControl>

		</div>
	</asp:PlaceHolder>
	<asp:PlaceHolder runat="server" ID="phckeditorNo">
		<h4>Debe seleccionar primero la empresa y la sucursal.</h4>
	</asp:PlaceHolder>
	<br />
	<div class="row">
		<div class="col-md-4 col-md-offset-2">
			<asp:Button ID="btnPrint" runat="server" CssClass="btn btn-success"
				OnClick="GenerarDocumento" Text="Generar Documento" ValidationGroup="ValidationAdd" />
		</div>

		<div class="col-md-4">
			<asp:Button ID="btnGuardar" runat="server" CssClass="btn btn-primary"
				OnClick="GuardarRegistro" Text="Guardar y/o Actualizar Datos" ValidationGroup="ValidationAdd" />
		</div>

	</div>
</asp:Content>
