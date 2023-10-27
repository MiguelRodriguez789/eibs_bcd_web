<%@ page import = "datapro.eibs.master.Util" %>
<%@ page import="datapro.eibs.beans.EDL090002Message"%>
<%@ page import="datapro.eibs.beans.EDL090003Message"%>
<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput"%>
<%@page import="com.datapro.eibs.constants.HelpTypes"%>
<%@page import="com.datapro.constants.EibsFields"%>

<HTML>
<HEAD>
<TITLE>Cronograma de Plan de Pagos</TITLE>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id="header" class="datapro.eibs.beans.EDL090001Message"  scope="session" />
<jsp:useBean id="list" class="datapro.eibs.beans.JBObjList" scope="session" />
<jsp:useBean id="listUF" class="datapro.eibs.beans.JBObjList" scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>
<jsp:useBean id="currUser" class="datapro.eibs.beans.ESS0030DSMessage" scope="session" />

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>

<SCRIPT type="text/javascript">

function enter(dateM, dateD, dateY) {
	var oForm = top.opener.document.forms[0];
	
	if (top.opener.fieldAux1 != "" && oForm[top.opener.fieldAux1]) {
		oForm[top.opener.fieldAux1].value = dateM;
	}
	if (top.opener.fieldAux2 != "" && oForm[top.opener.fieldAux2]) {
		oForm[top.opener.fieldAux2].value = dateD;
	}
	if (top.opener.fieldAux3 != "" && oForm[top.opener.fieldAux3]) {
		oForm[top.opener.fieldAux3].value = dateY;
	}

	top.close();
 }
 
</SCRIPT>

</HEAD>
<BODY>

<form>
  <input TYPE=HIDDEN name="SCREEN" id="SCREEN" value="200">
  
  <h3 align="center">Fechas de Plan del Pagos
  	<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="fechas_plan_pago.jsp,EDL0158"> 
  </h3>
  <hr size="4">

  <TABLE class="tableinfoList"  cellpadding=2 cellspacing=3 >
    <tr id="trdark"> 
      <TH ALIGN=CENTER nowrap width="50%" >Numero<br>Cuota</TH>
      <TH ALIGN=CENTER nowrap width="50%" >Fecha <br>a Pagar</TH>
     </TR>
    </TABLE>
	
	<div id="dataDiv1"  style="max-height:400px; overflow:auto; border: 0px;"> 
  		<TABLE class="tableinfoList"  cellpadding=2 cellspacing=3 >
    <%

			list.initRow();
				while (list.getNextRow()) {
					EDL090002Message plan = (EDL090002Message) list.getRecord();
					if(!plan.getE02DLPSTS().equals("P")){
	%> 
	<tr id="dataTable<%= list.getCurrentRow() %>">
		<td nowrap align="center" width="50%">
			<%=  plan.getE02DLPPNU().equals("77777") ? "Aceler."  :
				( plan.getE02DLPPNU().equals("88888") ? "Abono" :
				( plan.getE02DLPPNU().equals("99999") ? "Prepago" : plan.getE02DLPPNU()))  %>
		</td>
		<td nowrap align="center" width="50%">
			<a href="javascript:enter('<%=plan.getE02DLPPDM()%>','<%=plan.getE02DLPPDD()%>','<%=plan.getE02DLPPDY()%>')">
			<%=Util.formatCustomDate(currUser.getE01DTF(),
				plan.getBigDecimalE02DLPPDM().intValue(),
				plan.getBigDecimalE02DLPPDD().intValue(),
				plan.getBigDecimalE02DLPPDY().intValue())%></a>
		</td>
	
	</tr>
    <% } } %>
  </TABLE>
  </div>
  
</FORM>

</BODY>
</HTML>
