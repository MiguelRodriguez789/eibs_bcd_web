<%@taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@page import = "datapro.eibs.master.Util" %>
<%@page import="com.datapro.constants.EibsFields"%>
<%@page import="com.datapro.eibs.constants.HelpTypes"%>
<html>
<head>
<title>Canje - Cubiertas - Contabilidad</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css"rel="stylesheet">
<link rel="stylesheet" href="<%=request.getContextPath()%>/jquery/themes/smoothness/jquery-ui.css"/>
 
<jsp:useBean id="msgRcd" class= "datapro.eibs.beans.EDD096203Message"  scope="session"  />
<jsp:useBean id="error" class="datapro.eibs.beans.ELEERRMessage" scope="session" />
<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"></SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"></SCRIPT>
<script src="<%=request.getContextPath()%>/pages/s/javascripts/jquery.jsp"> </script>
<script src="<%=request.getContextPath()%>/jquery/readOnlyPage.jsp"></script>
<script src="<%=request.getContextPath()%>/jquery/markChangedFields.jsp?MSGOBJ=msgRcd"> </script>

<SCRIPT type="text/javascript">


<%int row = 0; %>


	
function goAction(op) {
	var err = 0;
    if(document.forms[0].E03CACDTD.value=="" || document.forms[0].E03CACDTD.value=="0" || document.forms[0].E03CACDTD.value=="00")
    	err = 1;
    if(document.forms[0].E03CACDTM.value=="" || document.forms[0].E03CACDTM.value=="0" || document.forms[0].E03CACDTM.value=="00")
    	err = 1;	
    if(document.forms[0].E03CACDTY.value=="" || document.forms[0].E03CACDTY.value=="0" || document.forms[0].E03CACDTY.value=="0000")
    	err = 1;  	
    if(err==1)	
    	alert("Ingrese una Fecha de Proceso Valida!");
    else{
		document.forms[0].SCREEN.value = op;
		submitForm();
	}
}
</SCRIPT>


</head>
<body>
	<%
		if (!error.getERRNUM().equals("0")) {
			error.setERRNUM("0");
			out.println("<SCRIPT Language=\"Javascript\">");
			out.println("       showErrors()");
			out.println("</SCRIPT>");

  out.println("<SCRIPT> initMenu(); </SCRIPT>");				
		
		}
	%>
	<div align="center">
		<h3>
			Devolucion Enviada Total - Canje<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="cleaning_cover_post_canje.jsp,EDD0962">
		</h3>
	</div>
	<hr size="4">
	<form method="post"
		action="<%=request.getContextPath()%>/servlet/datapro.eibs.cleaning.JSEDD0962">
		<h4>Información Básica</h4>
		<input type="hidden" name="SCREEN" value="14">
		
		<table class="tableinfo">
		<tr>
			<td nowrap>
				<table cellpadding=2 cellspacing=0 width="100%" border="0">
          			<tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
 						<td nowrap width="25%" align="right">Fecha de Proceso :</td>
						<td nowrap width="25%"> 
            			  	<div align="left"> 
             				  <eibsinput:date name="msgRcd" fn_year="E03CACDTY" fn_month="E03CACDTM" fn_day="E03CACDTD"
								required="true"  /></td>
              				</div>
            			</td>
					</tr>
				</table>
			</td>
		</tr>
	</table>

		<table class="tableinfo">
			<tr>
				<td align="center">
					Esta opción genera el archivo de devolucion enviada total<br>
					Asegurese que todos las devoluciones tecnica esten procesadas <br>
					y no se vayan a enviar mas procesos de devolucion<br>
				<BR><BR>
 				</td>      
    		</tr>
  		</table>

	<table width="100%">		
        <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
  		<td width="50%">
  		  <div align="center"> 
     		<input id="EIBSBTN" type="button" name="Submit" value="Enviar" onClick="goAction(14);">
     	  </div>	
  		</td>
  		<td width="50%">
  		  <div align="center"> 
			<a href="<%=request.getContextPath()%>/pages/background.jsp" class="botonrojo"><b>Salir</b></a>
     	  </div>	
  		</td>
  	</tr>	
  </table>	


		
	</form>
	
</body>
</html>
