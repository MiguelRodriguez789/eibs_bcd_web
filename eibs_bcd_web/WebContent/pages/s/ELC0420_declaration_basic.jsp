<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@ page import = "datapro.eibs.master.Util" %>
<%@page import="com.datapro.constants.EibsFields"%>
<%@page import="com.datapro.eibs.constants.HelpTypes"%>

<html>

<head>
<title>Declaraciones de Ingreso</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V4.0 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id="msg" class="datapro.eibs.beans.ELC042001Message"  scope="session" />
<jsp:useBean id="error" class="datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session" />

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>

<script type="text/javascript">
	function getList() {
  		getElement("ACTION").value = "1500";
  		document.forms[0].submit();
	}
</script>


<% 
if ( !error.getERRNUM().equals("0")  ) {
     error.setERRNUM("0");
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors();");
     out.println("</SCRIPT>");
} 

	String readonly = "";
	String lock = "";
	if (userPO.getPurpose().equals("INQUIRY")) {
		readonly = "readonly";
		lock = "readonly";
	}
	if (userPO.getPurpose().equals("MAINTENANCE")) {
		lock = "readonly";
	}
%>

</head>
<body bgcolor="#FFFFFF">

<h3 align="center">Declaraciones de Ingreso/Salida
	<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="declaration_basic, ELC0420" ></h3>
<hr size="4">

<FORM name="form" METHOD="post" ACTION="<%=request.getContextPath()%>/servlet/datapro.eibs.trade.JSELC0420" >
	<INPUT TYPE=HIDDEN ID="ACTION" NAME="SCREEN" VALUE="500">
	<TABLE  id="mainTable" class="tableinfo" >
  			<TR> 
    			<TD NOWRAP valign=top>
  	 				<TABLE id="dataTable" width="100%">
  						<TR id="trclear"> 
							<TD NOWRAP ALIGN="CENTER">Cliente: <%= Util.formatCell(userPO.getCusNum()) %></TD>
							<TD NOWRAP ALIGN="CENTER"> - <%= Util.formatCell(userPO.getCusName()) %></TD>
  						</TR>
				     </TABLE>
			    </TD>
		   	</TR>	
     	</TABLE>
	<table  class="tableinfo">
    	<tr > 
      		<td nowrap> 
        		<table cellspacing="0" cellpadding="2" width="100%" border="0">
          			<tr id="trclear"> 
            			<td nowrap><div align="right">Tipo Documento :</div></td>
            			<td nowrap colspan="3"> 
              				<select name="E01DDITYP" >
                <option value="1" <% if (msg.getE01DDITYP().trim().equals("1")) out.print("selected"); %>>Declaracion de Ingreso Nacional (DIN)</option>
                <option value="2" <% if (msg.getE01DDITYP().trim().equals("2")) out.print("selected"); %>>Declaracion Unica de Salida (DUS)</option>
              </select>	
             			</td>  
          			</tr>
          			<tr id="trdark"> 
            			<td nowrap><div align="right">Numero Documento :</div></td>
            			<td nowrap colspan="3"> 
              				<input type="text" name="E01DDINUM" size="24" maxlength="20" value="<%= msg.getE01DDINUM().trim()%>" <%= lock %>>
             			</td>  
          			</tr>
          			<tr id="trclear"> 
            			<td nowrap><div align="right">Fecha :</div></td>
            			<td nowrap colspan="3"> 
            				<% if("".equals(readonly)) { %>
              					<eibsinput:date readonly="false" name="msg" fn_year="E01DDIFE3" fn_month="E01DDIFE2" fn_day="E01DDIFE1" required="false"/>
             				<% } else { %>
             					<eibsinput:date readonly="true" name="msg" fn_year="E01DDIFE3" fn_month="E01DDIFE2" fn_day="E01DDIFE1" required="false"/>
             				<% } %>
             			</td>  
          			</tr>
          			<tr id="trdark"> 
            			<td nowrap><div align="right">Monto :</div></td>
            			<td nowrap colspan="3"> 
              				<input type="text" name="E01DDIMTO" size="18" maxlength="16" value="<%= msg.getE01DDIMTO().trim()%>" <%= readonly %> onkeypress="enterDecimal(event)">
              				<input type="hidden" name="E01DDIMDA" size="4" maxlength="3" value="<%= msg.getE01DDIMDA().trim()%>" <%= readonly %> readonly> 
            			</td>
          			</tr>
          			<%-- tr id="trclear"> 
            			<td nowrap><div align="right">Moneda :</div></td>
            			<td nowrap colspan="3"--%> 
              				 
                			<%--a href="javascript:GetCurrency('E01DDIMDA','')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="help" align="middle" border="0" ></a>
            			</td>
          			</tr--%>
        		</table>
      		</td>
    	</tr>
  	</table>
 
  	<br>
  	<% if (!userPO.getPurpose().equals("INQUIRY")) { %>
   			<p align="center"><input id="EIBSBTN" type=submit name="Submit" value="Aceptar"></p>
   	<% } %>	
   	
</form>

</body>
</html>

