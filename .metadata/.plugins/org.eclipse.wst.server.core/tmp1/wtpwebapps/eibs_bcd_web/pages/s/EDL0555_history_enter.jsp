<%@taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@page import="com.datapro.eibs.constants.HelpTypes"%>
<%@page import="com.datapro.constants.EibsFields"%>
<%@page import="datapro.eibs.master.Util" %>
<html>
<head>
<title>Table/List Monitoreo Creditos</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id="error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>
<jsp:useBean id="headInfo" class="datapro.eibs.beans.EDL055506Message" scope="session" />
<jsp:useBean id="currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>

<script type="text/javascript">

function goAction(op) {
	getElement("opt").value = op;
	document.forms[0].submit();
}

</script>  

</head>

<body>

<% 
	 if ( !error.getERRNUM().equals("0")  ) {
		 out.println("<SCRIPT Language=\"Javascript\">");
		 out.println("       showErrors()");
		 out.println("</SCRIPT>");
	 }
%>

<h3 align="center">Hist&oacute;rico Estados<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="history_enter.jsp, EDL0555"></h3>
<hr size="4">
<FORM name="form1" METHOD="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDL0555" >
	<input type=HIDDEN name="SCREEN" id="SCREEN" value="2012">
	<%int row = 0; %>
	<table class="tableinfo">
		<tr bordercolor="#FFFFFF"> 
			<td nowrap> 
				<table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
					<tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
						<td nowrap width="10%" align="right"> Propuesta : </td>
						<td nowrap width="30%"align="left">
							<input type="text" name="porfNum" size="13" maxlength="12" value="<%= userPO.getPorfNum()%>" readonly>
						</td>
						<td nowrap width="20%" align="right"> Cliente : </td>
						<td nowrap width="40%" align="left">
							<input type="text" name="cusNum" size="13" maxlength="12" value="<%= userPO.getCusNum()%>" readonly>
							<input type="text" name="cusName" size="50" maxlength="50" value="<%= userPO.getCusName()%>" readonly>
						</td>
					</tr>
				</table>
			</td>
		</tr>
	</table>
	<br>
	<p></p>  

	<table class="tableinfo">
		<tr > 
			<td nowrap height="94"> 
				<table cellpadding=2 cellspacing=0 width="100%" border="0">
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">  
						<td nowrap width="15%"> 
							<div align="center"> <b>Seleccionar Fechas : </b></div>
						</td>
						<td nowrap width="15%"><div align="right"><b>Desde : </b></div></td>
						<td nowrap width="15%"> 
							<div align="left"> 
								<eibsinput:date fn_month="E06FMDTMM" fn_day="E06FMDTDD" fn_year="E06FMDTYY"  />
							</div>
						</td>
						<td nowrap width="5%"> 
							<div align="right"><b>Hasta :</b></div>
						</td>
						<td nowrap width="47%"> 
							<div align="left"> 
								<eibsinput:date fn_month="E06TODTMM" fn_day="E06TODTDD" fn_year="E06TODTYY"  />
							</div>
						</td>
					</tr>
				</table>
			</td>
		</tr>
	</table>
	
	<br>
	<div align="center" style="width:95%"> 
		<input id="EIBSBTN" type=submit name="Submit" value="Enviar">
	</div>

</form>
</body>
</html>
