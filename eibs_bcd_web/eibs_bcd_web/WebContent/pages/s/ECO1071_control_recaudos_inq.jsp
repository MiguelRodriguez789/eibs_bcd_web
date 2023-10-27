<%@taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@page import = "datapro.eibs.master.Util" %>
<%@page import="com.datapro.constants.EibsFields"%>
<%@page import="com.datapro.eibs.constants.HelpTypes"%>

<html> 
<head>
<title>Consulta de Reporte de Paquetes por Fecha</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">


<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "msgMT" class= "datapro.eibs.beans.ECO107101Message"  scope="session" />
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />

<script type="text/javascript">
   function checkFechas() {           	  
   		if ( (document.forms[0].E01PAQYYI.value == "" || document.forms[0].E01PAQYYI.value == "0") &&
   			 (document.forms[0].E01PAQYMI.value == "" || document.forms[0].E01PAQYMI.value == "0") &&
   			 (document.forms[0].E01PAQYDI.value == "" || document.forms[0].E01PAQYDI.value == "0") &&
   		
   			 (document.forms[0].E01PAQYYF.value == "" || document.forms[0].E01PAQYYF.value == "0") &&
   			 (document.forms[0].E01PAQYMF.value == "" || document.forms[0].E01PAQYMF.value == "0") &&
   			 (document.forms[0].E01PAQYDF.value == "" || document.forms[0].E01PAQYDF.value == "0") 
   			){
   				alert("Debe Colocar una fecha valida");
   				return false;
   		}else{
   				return true;
   		}
   }
</script>
</head>
<body>

<H3 align="center">Consulta de Control de Recaudos<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="control_recaudos_inq,ECO1071"></H3>
<hr size="4">
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>

<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.adhesives.JSECO1071" onsubmit="checkFechas()">
    <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="300">
    <INPUT TYPE=HIDDEN NAME="E01PAQREG" VALUE="0">
    <INPUT TYPE=HIDDEN NAME="BNK" VALUE="<%=currUser.getE01UBK()%>">

<table id="TBHELPN" width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-left: center; margin-right: center;">
		<tr>
	      <td nowrap width="46%"><div align="right">&nbsp;</div></td>
	      <td nowrap width="54%"><div align="left">&nbsp;</div></td>
     	</tr> 
		<tr>
	      <td nowrap><div align="right">Oficina :</div></td>
	      <td nowrap><div align="left">
	      	<eibsinput:help fn_param_one="E01PAQBRN" fn_param_two="document.forms[0].BNK.value" property="E01PAQBRN" name="msgMT" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_BRANCH %>"/>
	      </div></td>
     	</tr>       	     	     	
        <tr >
          <td nowrap>
              <div align="right">Fecha : </div>
          </td>
          <td nowrap>
           	  <eibsinput:date name="msgMT" fn_year="E01PAQYYI" fn_month="E01PAQMMI" fn_day="E01PAQDDI" />             
          </td>
		<tr>
	      <td nowrap></td>
	      <td nowrap></td>
     	</tr>          
 		<tr align="center" >
			<td nowrap colspan="2" align="center">
			<div id="DIVSUBMIT" align="center">
				<input id="EIBSBTN" type="submit" name="Submit" value="Enviar">
			</div>
			</td>
		</tr>
     </table>

<% 
 if ( !error.getERRNUM().equals("0")  ) {
      error.setERRNUM("0");
 %>
     <SCRIPT type="text/javascript">
            showErrors();
     </SCRIPT>
 <% } %>
</form>
</body>
</html>
