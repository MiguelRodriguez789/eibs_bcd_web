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

<jsp:useBean id="msg" class="datapro.eibs.beans.ELC001001Message"  scope="session" />
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

<h3 align="center"><%=userPO.getPurpose().equals("INQUIRY")?"Consulta":"Mantenimiento"%> de Beneficiarios
	<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="beneficiary_basic, ELC0010" ></h3>
<hr size="4">

<FORM name="form" METHOD="post" ACTION="<%=request.getContextPath()%>/servlet/datapro.eibs.trade.JSELC0010" >
	<INPUT TYPE=HIDDEN ID="ACTION" NAME="SCREEN" VALUE="500">
	<table  class="tableinfo">
    	<tr > 
      		<td nowrap> 
        		<table cellspacing="0" cellpadding="2" width="100%" border="0">
          			<tr id="trclear"> 
            			<td nowrap><div align="right"><b>Cliente :</b></div></td>
            			<td nowrap colspan="3"> 
              				<input type="text" name="E01CUBCUN" size="13" maxlength="12" value="<%= msg.getE01CUBCUN().trim()%>" readonly>
              				<input type="text" name="E01CUSNME" size="40" maxlength="40" value="<%= msg.getE01CUSNME().trim()%>" readonly>
             			</td>  
          			</tr>
    </table>
	</td>
	</tr>
	</table>
	<br>
	
	<table  class="tableinfo">
    	<tr > 
      		<td nowrap> 
        		<table cellspacing="0" cellpadding="2" width="100%" border="0">
          			<tr id="trclear"> 
            			<td nowrap><div align="right">Rut del Beneficiario :</div></td>
            			<td nowrap colspan="3"> 
              				<input type="text" name="E01CUBBID" size="40" maxlength="35" value="<%= msg.getE01CUBBID().trim()%>" <%= readonly %>>
             			</td>  
          			</tr>
          			<tr id="trdark"> 
            			<td nowrap><div align="right">Nombre del Beneficiario :</div></td>
            			<td nowrap colspan="3"> 
            					<input type="text" name="E01CUBNA1" size="40" maxlength="35" value="<%= msg.getE01CUBNA1().trim()%>" <%= readonly %>>
             			</td>  
          			</tr>
          			<tr id="trclear"> 
            			<td nowrap><div align="right">Dirección :</div></td>
            			<td nowrap colspan="3"> 
              				<input type="text" name="E01CUBNA2" size="40" maxlength="35" value="<%= msg.getE01CUBNA2().trim()%>" <%= readonly %>> 
            			</td>
          			</tr>
          			<tr id="trdark"> 
            			<td nowrap><div align="right"></div></td>
            			<td nowrap colspan="3"> 
              				<input type="text" name="E01CUBNA3" size="40" maxlength="35" value="<%= msg.getE01CUBNA3().trim()%>" <%= readonly %>> 
            			</td>
          			</tr>
          			<tr id="trclear"> 
            			<td nowrap><div align="right">Ciudad :</div></td>
            			<td nowrap colspan="3"> 
              				<input type="text" name="E01CUBNA4" size="18" maxlength="16" value="<%= msg.getE01CUBNA4().trim()%>" <%= readonly %>> 
            			</td>
          			</tr>
          			<tr id="trdark"> 
            			<td nowrap><div align="right">País del Beneficiario :</div></td>
            			<td nowrap colspan="3"> 
              				<input type="text" name="E01CUBCTR" size="4" maxlength="3" value="<%= msg.getE01CUBCTR().trim()%>" <%= readonly %>>
              				<input readonly type="text" name="E01CTRNME" size="40" maxlength="40" value="<%= msg.getE01CTRNME().trim()%>"> 
              				<%if("".equals(readonly)) { %>
              					<a href="javascript:GetCodeDescCNOFC('E01CUBCTR','E01CTRNME','03')">
									<img src="<%=request.getContextPath()%>/images/1b.gif" title=". . ."
										align="bottom" border="0"></a>
							<%} %>
            			</td>
          			</tr>
          	   </table>
      		</td>
    	</tr>
  	</table>
  	
  	<h4>Banco del Beneficiario</h4>
  	<table  class="tableinfo">
    	<tr > 
      		<td nowrap> 
        		<table cellspacing="0" cellpadding="2" width="100%" border="0">
          			<tr id="trclear"> 
            			<td nowrap><div align="right">Codigo Swift (BIC) :</div></td>
            			<td nowrap colspan="3"> 
              				<input type="text" name="E01CUBBBI" size="18" maxlength="16" value="<%= msg.getE01CUBBBI().trim()%>" <%= readonly %>>
             			    <%if("".equals(readonly)) { %>
            					<A href="javascript:GetSwiftIdDesc('E01CUBBBI','E01CUBBB1','E01CUBBB2','E01CUBBB3')"> <IMG src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda"  border="0"></A> 
            				<%} %>
             			</td>  
          			</tr>
          			<tr id="trdark"> 
            			<td nowrap><div align="right">Nombre :</div></td>
            			<td nowrap colspan="3"> 
            					<input type="text" name="E01CUBBB1" size="40" maxlength="35" value="<%= msg.getE01CUBBB1().trim()%>" <%= readonly %>>
             			</td>  
          			</tr>
          			<tr id="trclear"> 
            			<td nowrap><div align="right">Dirección :</div></td>
            			<td nowrap colspan="3"> 
              				<input type="text" name="E01CUBBB2" size="40" maxlength="35" value="<%= msg.getE01CUBBB2().trim()%>" <%= readonly %>>
             			</td>  
          			</tr>
          			<tr id="trdark"> 
            			<td nowrap><div align="right"></div></td>
            			<td nowrap colspan="3"> 
            					<input type="text" name="E01CUBBB3" size="40" maxlength="35" value="<%= msg.getE01CUBBB3().trim()%>" <%= readonly %>>
             			</td>  
          			</tr>
          			<tr id="trclear"> 
            			<td nowrap><div align="right">Ciudad  :</div></td>
            			<td nowrap colspan="3"> 
              				<input type="text" name="E01CUBBB4" size="18" maxlength="16" value="<%= msg.getE01CUBBB4().trim()%>" <%= readonly %>>
             			</td>  
          			</tr>
          			<tr id="trdark"> 
            			<td nowrap><div align="right">País :</div></td>
            			<td nowrap colspan="3"> 
            					<input type="text" name="E01CUBBB5" size="4" maxlength="3" value="<%= msg.getE01CUBBB5().trim()%>" <%= readonly %>>
             			</td>  
          			</tr>
        		</table>
      		</td>
    	</tr>
  	</table>
  	
  	<h4>Banco Intermediario</h4>
  	<table  class="tableinfo">
    	<tr > 
      		<td nowrap> 
        		<table cellspacing="0" cellpadding="2" width="100%" border="0">
          			<tr id="trclear"> 
            			<td nowrap><div align="right">Codigo Swift (BIC) :</div></td>
            			<td nowrap colspan="3"> 
              				<input type="text" name="E01CUBIBI" size="18" maxlength="16" value="<%= msg.getE01CUBIBI().trim()%>" <%= readonly %>>
             			    <%if("".equals(readonly)) { %>
            					<A href="javascript:GetSwiftIdDesc('E01CUBIBI','E01CUBIB1','E01CUBIB2','E01CUBIB3')"> <IMG src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda"  border="0"></A> 
            				<%} %>
             			</td>  
          			</tr>
          			<tr id="trdark"> 
            			<td nowrap><div align="right">Nombre :</div></td>
            			<td nowrap colspan="3"> 
            					<input type="text" name="E01CUBIB1" size="40" maxlength="35" value="<%= msg.getE01CUBIB1().trim()%>" <%= readonly %>>
             			</td>  
          			</tr>
          			<tr id="trclear"> 
            			<td nowrap><div align="right">Dirección :</div></td>
            			<td nowrap colspan="3"> 
              				<input type="text" name="E01CUBIB2" size="40" maxlength="35" value="<%= msg.getE01CUBIB2().trim()%>" <%= readonly %>>
             			</td>  
          			</tr>
          			<tr id="trdark"> 
            			<td nowrap><div align="right"></div></td>
            			<td nowrap colspan="3"> 
            					<input type="text" name="E01CUBIB3" size="40" maxlength="35" value="<%= msg.getE01CUBIB3().trim()%>" <%= readonly %>>
             			</td>  
          			</tr>
          			<tr id="trclear"> 
            			<td nowrap><div align="right">Ciudad  :</div></td>
            			<td nowrap colspan="3"> 
              				<input type="text" name="E01CUBIB4" size="18" maxlength="16" value="<%= msg.getE01CUBIB4().trim()%>" <%= readonly %>>
             			</td>  
          			</tr>
          			<tr id="trdark"> 
            			<td nowrap><div align="right">País :</div></td>
            			<td nowrap colspan="3"> 
            					<input type="text" name="E01CUBIB5" size="4" maxlength="3" value="<%= msg.getE01CUBIB5().trim()%>" <%= readonly %>>
             			</td>  
          			</tr>
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

