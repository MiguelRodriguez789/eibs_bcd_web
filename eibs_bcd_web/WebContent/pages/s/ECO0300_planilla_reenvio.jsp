<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput"%>
<%@page import="com.datapro.constants.EibsFields"%>
<%@page import="com.datapro.eibs.constants.HelpTypes"%>

<%@page import="com.datapro.constants.Entities"%> 
<%@ page import = "datapro.eibs.master.Util" %>

<html>
<head>
<title>Pago Comisiones</title>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
 
<jsp:useBean id="cnvObj" class="datapro.eibs.beans.ECO030001Message" scope="session" />
<jsp:useBean id="currUser" class="datapro.eibs.beans.ESS0030DSMessage" scope="session" />

<jsp:useBean id="error" class="datapro.eibs.beans.ELEERRMessage" scope="session" />

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </script>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </script>

<script type="text/javascript">

	   function validar(){
	   
	   	return true;
	   }
	   
  	  function cerrarVentana(){  	
    	alert("Actualización Exitosa!!");  	
		window.open('','_parent','');
		window.close(); 
  	}

</script>


</head>

<body>
<% 
 if ( !error.getERRNUM().equals("0")  ) {
     error.setERRNUM("0");
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
 }
%>

<h3 align="center">Reenvio de Planillas<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="planilla_reenvio.jsp,ECO300"></h3>
<hr size="4">
<form method="POST" action="<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSECO0300" onsubmit="return validar();">
<input type="hidden" name="SCREEN" value="300">
<input type=HIDDEN name="E01PLHBNK"  value="<%= cnvObj.getE01PLHBNK().trim()%>">
<input type=HIDDEN name="E01BCU"  value="<%= currUser.getE01BCU().trim()%>">

<br>
<table id="mainTable" class="tableinfo" align="center" >
	<tr>
	<td nowrap valign="top" width="100%">
		<table width="100%">
			<tr >
				<td  align="right" nowrap width="10%">Codigo Convenio :</td>				
				<td  align="left" nowrap width="15%"><%=cnvObj.getE01PLHCDE() %><input type="hidden" name="E01PLHCDE" value="<%=cnvObj.getE01PLHCDE() %>"></td>
				<td  align="right" nowrap width="10%">Nro Planilla :</td>
				<td  align="left" nowrap width="15%"><%=cnvObj.getE01PLHNUM() %><input type="hidden" name="E01PLHNUM" value="<%=cnvObj.getE01PLHNUM() %>"></td>
				<td  align="right" nowrap width="10%">Fecha Emisión :</td>
				<td  align="left" nowrap width="15%"><%=Util.formatCustomDate(currUser.getE01DTF(),
																 cnvObj.getBigDecimalE01PLHFEM().intValue(),
																 cnvObj.getBigDecimalE01PLHFED().intValue(),
																 cnvObj.getBigDecimalE01PLHFEY().intValue())%></td>
				<td  align="right" nowrap width="10%">Estado :</td>
				<td  align="left" nowrap width="15%"><%=cnvObj.getE01DSCSTA() %></td>
			</tr>
			<tr >
				<td  align="right"  nowrap  width="10%">Empleador :</td>
				<td  align="left" nowrap width="15%"><%=cnvObj.getE01PLHENM()%></td>
				<td  align="right" nowrap width="10%">Identificacion :</td>
				<td   align="left" nowrap width="15%"><%=cnvObj.getE01PLHEID()%></td>
				<td  align="right" nowrap width="10%">Vencimiento : </td>
				<td  align="left" nowrap  width="15%"><%=Util.formatCustomDate(currUser.getE01DTF(),
																 cnvObj.getBigDecimalE01PLHFVM().intValue(),
																 cnvObj.getBigDecimalE01PLHFVD().intValue(),
																 cnvObj.getBigDecimalE01PLHFVY().intValue())%></td>
				<td  align="right" nowrap width="10%">Oficina Pago :</td>
				<td  align="left" nowrap width="15%"><%=cnvObj.getE01PLHBRN()%></td>
			</tr>
			<tr >
				<td  align="right"  nowrap  width="10%">Cliente Convenio :</td>
				<td  align="left" nowrap width="15%"><%=cnvObj.getE01PLHCNM()%></td>
				<td  align="right" nowrap width="10%">Identificacion :</td>
				<td  align="left" nowrap width="15%"><%=cnvObj.getE01PLHCID()%></td>
				<td  align="right" nowrap width="10%">Moneda :</td>
				<td  align="left" nowrap  width="15%"><%=cnvObj.getE01PLHRCY() %><input type="hidden" name="E01PLHRCY" value="<%=cnvObj.getE01PLHRCY() %>"></td>
				<td  align="right" nowrap width="10%">Total Planilla :</td>
				<td  align="left" nowrap  width="15%"><%=cnvObj.getE01PLHPAM() %></td>
			</tr>
		</table>
	</td>
  </tr>
</table>
<br> 
<table id="mainTable" class="tableinfo" align="center" >
  <tr>
	<td nowrap valign="top" width="100%">
		<table width="100%">
			<tr id="trdark">
				<td align="center" width="14%">Monto Recibido</td>				
				<td align="center" width="14%">Recibido Aplicado</td>				
				<td align="center" width="14%">Recibido Rechazado</td>				
				<td align="center" width="14%">Pagado de menos</td>				
				<td align="center" width="14%">Monto Impago</td>				
				<td align="center" width="14%">Aportes Pagados</td>				
				<td align="center" width="14%">Pagado por Caja </td>				
			</tr>
			<tr >
				<td align="center" nowrap  width="14%"><%=cnvObj.getE01PLHPPG() %></td>
				<td align="center" nowrap  width="14%"><%=cnvObj.getE01PLHPAP() %></td>
				<td align="center" nowrap  width="14%"><%=cnvObj.getE01PLHPRE() %></td>
				<td align="center" nowrap  width="14%"><%=cnvObj.getE01PLHPPN() %></td>
				<td align="center" nowrap  width="14%"><%=cnvObj.getE01PLHNRP() %></td>
				<td align="center" nowrap  width="14%"><%=cnvObj.getE01PLHAAM() %></td>
				<td align="center" nowrap  width="14%"><%=cnvObj.getE01PLHRAM() %></td>
			</tr>
		</table>
      </td>
    </tr>
 </table>


  
<H4>Informacion de envio</H4>

<table class="tableinfo" align="center" >
  <tr > 
    <td> 
      <table cellspacing=0 cellpadding=2 width="100%" border="0">
      	<tr >
            <td width="48%"> 
              <div align="right">Fecha de ultimo envio :</div>
            </td>
            <td width="52%"> 
    	        <eibsinput:date name="cnvObj" fn_year="E01PLHIPY" fn_month="E01PLHIPM" fn_day="E01PLHIPD" readonly="true"/>
            </td>
          </tr>
     
     </table>
   </td>
   </tr>  
 </table>
 
<table align="center" id="TBHELPN">
	<tr>
	<td>
	<div id="DIVSUBMIT" align="center">
		<input id="EIBSBTN" type="submit" name="Submit" value="Enviar">
	</div>
	</td>
	</tr>
</table>
	
</form>
</body>
</html>
