<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<title>Promedios de Cuentas</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<%@ page import = "datapro.eibs.master.Util" %>
<jsp:useBean id="msg02" class="datapro.eibs.beans.ELC090002Message"  scope="session" />
<jsp:useBean id="error" class="datapro.eibs.beans.ELEERRMessage" scope="session" />
<script type="text/javascript">
window.moveTo(0,0);

if (document.all)
{
  top.window.resizeTo(screen.availWidth,screen.availHeight);
}

else if (document.layers||document.getElementById)
{
  if (top.window.outerHeight<screen.availHeight||top.window.outerWidth<screen.availWidth)
  {
    top.window.outerHeight = screen.availHeight;
    top.window.outerWidth = screen.availWidth;
  }
}

function Imprimir(){
 
	div1.style.display="none";
	window.print();
	div1.style.display="";
}
</script>
</head>

<body>
<%String title = "";
	if("40".equals(msg02.getE02LCYACD())) {
		title += "Cartas de Crédito ";
		if("O".equals(msg02.getE02LCYTYP())){
			title += "de Importación ";
		}  else if("I".equals(msg02.getE02LCYTYP())) {
			title += "de Exportación ";
		} else if("L".equals(msg02.getE02LCYTYP())) {
			title += "Locales ";
		} else if("S".equals(msg02.getE02LCYTYP())) {
			title += "de Garantías Emitidas ";
		} else if("R".equals(msg02.getE02LCYTYP())) {
			title += "de Garantías Recibidas ";
		}
	} else 	if("41".equals(msg02.getE02LCYACD())){
		title = title + "Aceptación ";
	} else {
		title = title + "Pago Diferido ";
	}
	
	title += "Año " + msg02.getE02SCHDTY();
 %>
  
  <%if (error.getERRNUM().equals("0")) { %>
  <table height="90%" width="100%" class="tableinfo">
    <tr> 
      <td nowrap>
        <table cellspacing=0 cellpadding=1 width="100%" height="100%" border="0">
          <tr id="trdark"> 
			<td width="95%" height="100%">
				<applet archive="eibs_applets.zip" code="datapro.eibs.applets.graph.VerticalBar3D" height="100%" width="100%" codebase="<%=request.getContextPath()%>/pages/s/">
<param name="legend_border_off">
<param name="show_legend_on_right">
<param name="title" value="Comisiones <%=title %>">

<param name="transparency" value=".8">
<param name="x_axis_description" value="Comisiones">
<param name="vert_grid_off">
<param name="set_legend_off">
<param name="show_percents_on_legend">
<param name="y_axis_description" value="Montos">
<param name="show_description_on_x_axis">
<param name="legend_rows" value="1">
<param name="show_values_on_top_of_bars">

				<%int i = 0;
					java.math.BigDecimal amount = null;
					String desc = null;
					java.math.BigDecimal total = new java.math.BigDecimal("0");
				%>

				<%
				amount = msg02.getBigDecimalE02COMAM1();
				desc = msg02.getE02COMDS1();
				total = total.add(amount);
				i++;%>				
<param name="val_1" value="<%=amount%>">
<param name="description_1" value=<%=desc%>">

				<%
				amount = msg02.getBigDecimalE02COMAM2();
				desc = msg02.getE02COMDS2();
				total = total.add(amount);
				i++;%>	
<param name="val_2" value="<%=amount%>">
<param name="description_2" value="<%=desc%>">

				<%
				amount = msg02.getBigDecimalE02COMAM3();
				desc = msg02.getE02COMDS3();
				total = total.add(amount);
				i++;%>	
<param name="val_3" value="<%=amount%>">
<param name="description_3" value="<%=desc%>">

				<%
				amount = msg02.getBigDecimalE02COMAM4();
				desc = msg02.getE02COMDS4();
				total = total.add(amount);
				i++;%>	
<param name="val_4" value="<%=amount%>">
<param name="description_4" value="<%=desc%>">

				<%
				amount = msg02.getBigDecimalE02COMAM5();
				desc = msg02.getE02COMDS5();
				total = total.add(amount);
				i++;%>	
<param name="val_5" value="<%=amount%>">
<param name="description_5" value="<%=desc%>">

				<%
				amount = msg02.getBigDecimalE02COMAM6();
				desc = msg02.getE02COMDS6();
				total = total.add(amount);
				i++;%>	
<param name="val_6" value="<%=amount%>">
<param name="description_6" value="<%=desc%>">

				<%
				amount = msg02.getBigDecimalE02COMAM7();
				desc = msg02.getE02COMDS7();
				total = total.add(amount);
				i++;%>	
<param name="val_7" value="<%=amount%>">
<param name="description_7" value="<%=desc%>">

				<%
				amount = msg02.getBigDecimalE02COMAM8();
				desc = msg02.getE02COMDS8();
				total = total.add(amount);
				i++;%>	
<param name="val_8" value="<%=amount%>">
<param name="description_8" value="<%=desc%>">

				<%
				amount = msg02.getBigDecimalE02COMAM9();
				desc = msg02.getE02COMDS9();
				total = total.add(amount);
				i++;%>	
<param name="val_9" value="<%=amount%>">
<param name="description_9" value="<%=desc%>">

				<%
				amount = msg02.getBigDecimalE02COMA10();
				desc = msg02.getE02COMD10();
				total = total.add(amount);
				i++;%>	
<param name="val_10" value="<%=amount%>">
<param name="description_10" value="<%=desc%>">

				<%
				amount = msg02.getBigDecimalE02COMA11();
				desc = msg02.getE02COMD11();
				total = total.add(amount);
				i++;%>	
<param name="val_11" value="<%=amount%>">
<param name="description_11" value="<%=desc%>">

				<%
				amount = msg02.getBigDecimalE02COMA12();
				desc = msg02.getE02COMD12();
				total = total.add(amount);
				i++;%>	
<param name="val_12" value="<%=amount%>">
<param name="description_12" value="<%=desc%>">

</applet>
</td>
</tr></table></td></tr></table>
<B>Total Comisiones: <%=Util.formatCCY(total.toString()) %></B>
<%} else {%>
<TABLE class="tbenter" width=100% height=90%>
   		<TR>
      <TD> 
        <div align="center">
        		<font size="3"><b>
        				No hay resultados que correspondan a su criterio de búsqueda 
        		</b></font>
        	</div>
      </TD></TR>
   		</TABLE>
<%}%>
<br>
    <div id="div1" align="center"> 
      <input id="EIBSBTN" type=button name="Submit" OnClick='top.close()' value="Cerrar">
      &nbsp;&nbsp;&nbsp;
      <input id="EIBSBTN" type=button name="Submit" OnClick='Imprimir()' value="Imprimir">
    </div>
</body>
</html>
