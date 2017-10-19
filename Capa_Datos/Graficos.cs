using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Capa_Datos
{
	public class Graficos
	{
		public static String AddGraficoTorta_ReporteTrabajadores_A_B(Double TotalSi, Double TotalNo)
		{
			StringBuilder str = new StringBuilder();
			str.Append(@"<script type = *text/javascript* >
					   google.load( *visualization*, *1*, {packages:[*corechart*]});
					   google.setOnLoadCallback(drawChart);
						function drawChart()
						{
							var data = google.visualization.arrayToDataTable([
	
							  ['Task', 'Hours per Day'],
	
							  ['SI', " + TotalSi + "],");
			str.Append(@"['NO'," + TotalNo + "]]); ");

			str.Append(@"var options = {
						  title: 'Porcentaje de riesgo',
						  is3D: true,
						  width: 1000, 
						  height: 350,
						};

						var chart = new google.visualization.PieChart(document.getElementById('piechart'));
						chart.draw(data, options);
						
						$('#ImgChart').attr('src', chart.getImageURI());
						$('#rutaImg').val(chart.getImageURI());

					}
					</script>");

			return str.ToString().Replace('*', '"');
		}

		
	}
}
