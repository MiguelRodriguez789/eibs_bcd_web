<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<title>Promedios de Cuentas</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<%@ page import = "datapro.eibs.master.Util" %>
<jsp:useBean id="msg01" class="datapro.eibs.beans.ELC090001Message"  scope="session" />
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
	if("50".equals(msg01.getE01LCYACD())) {
		title += "Cobranzas Simples ";
	} else {
		title += "Cobranzas Documentarias ";
	}

	if("O".equals(msg01.getE01LCYTYP())){
		title += "Enviadas ";
	}  else if("I".equals(msg01.getE01LCYTYP())) {
		title += "Recibidas ";
	} 
		
	title += "Año " + msg01.getE01SCHDTY();
 %>
  
  <%if (error.getERRNUM().equals("0")) { %>

  <table height="90%" width="100%" class="tableinfo">
    <tr> 
      <td nowrap>
        <table cellspacing=0 cellpadding=2 width="100%" height="100%" border="0">
          <tr id="trdark"> 
			<td width="90%" height="100%">
				<applet archive="eibs_applets.zip" code="datapro.eibs.applets.graph.VerticalBar3D" height="100%" width="100%" codebase="<%=request.getContextPath()%>/pages/s/">
<param name="legend_border_off">
<param name="show_legend_on_right">
<param name="title" value="Movimientos de <%=title %> ">

<param name="transparency" value=".8">
<param name="x_axis_description" value="Transacciones">
<param name="vert_grid_off">
<param name="set_legend_off">
<param name="show_percents_on_legend">
<param name="y_axis_description" value="Cantidades">
<param name="show_description_on_x_axis">
<param name="legend_rows" value="1">
<param name="show_values_on_top_of_bars">

				<%int i = 0;%>
				
				<%i++;%>			
				<param name="description_1" value="Aperturas">
				<param name="val_1" value="<%=msg01.getBigDecimalE01LCYOPT()%>">
				
			
				<%i++;%>
				<param name="description_2" value="Pagos">
				<param name="val_2" value="<%=msg01.getBigDecimalE01LCYPYT()%>">
							
				<%i++;%>
				<param name="description_3" value="Cancelaciones">
				<param name="val_3" value="<%=msg01.getBigDecimalE01LCYCAT()%>">
			
				<%i++;%>
				<param name="description_4" value="Otros">
				<param name="val_4" value="<%=msg01.getBigDecimalE01LCYOTT()%>">
			
				</applet>
</td>
<td width="10%" height="100%" align="left" valign="top">
				<b>Total en USD</b><br>
				<%=Util.formatCCY(msg01.getE01LCYOPA())%><br>
<%=Util.formatCCY(msg01.getE01LCYPYA())%><br>
<%=Util.formatCCY(msg01.getE01LCYCAA())%><br>
<%=Util.formatCCY(msg01.getE01LCYOTA())%><br>
<u><b>
<%=Util.formatCCY(msg01.getBigDecimalE01LCYOPA().add(msg01.getBigDecimalE01LCYPYA().add(
msg01.getBigDecimalE01LCYCAA().add(msg01.getBigDecimalE01LCYOTA()))).toString())%>
</b></u>
</td></tr></table></td></tr></table>
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
