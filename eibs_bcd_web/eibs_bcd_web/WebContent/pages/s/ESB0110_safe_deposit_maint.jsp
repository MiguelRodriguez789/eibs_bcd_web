<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput"%>
<%@page import="com.datapro.constants.EibsFields"%>
<%@page import="com.datapro.eibs.constants.HelpTypes"%>

<%@page import="com.datapro.constants.Entities"%> 
<%@ page import ="datapro.eibs.master.Util" %>

<html>
<head>
<title></title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </script>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBSBillsP.jsp"> </script>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </script>

<jsp:useBean id= "msgPart" 	class= "datapro.eibs.beans.ESB011001Message"  	scope="session" />
<jsp:useBean id= "error" 	class= "datapro.eibs.beans.ELEERRMessage"  		scope="session" />
<jsp:useBean id= "userPO" 	class= "datapro.eibs.beans.UserPos"  			scope="session"/>
<jsp:useBean id="currUser"  class="datapro.eibs.beans.ESS0030DSMessage" scope="session" />

<SCRIPT type="text/javascript">
function enterAction(code,numc,id,prod,card,apc) {
	
	if (card =="") 
		document.forms[0].fieldName.value = code; 
	else 
		document.forms[0].fieldName.value = card;
 }
</SCRIPT>
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
<H3 align="center">Mantenimiento Caja de Seguridad<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="safe_deposit_maint, ESB0110"></H3>
<hr size="4">


<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.safedeposit.JSESB0110">
 
  <INPUT TYPE=HIDDEN NAME="SCREEN" id="SCREEN" VALUE="500">
  <INPUT TYPE=HIDDEN NAME="E01SBMBNK" id="E01SBMBNK" VALUE="<%=msgPart.getE01SBMBNK()%>">
  <%int row = 0; %>
  <table class="tableinfo">
   <tr> 
   <td>
    <table cellspacing=0 cellpadding=2 width="100%" border="0">    
     	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
	      <td nowrap width="40%"> 
	        <div align="right">Número : </div>
	      </td>
				<td nowrap width="60%" colspan="3">
				<div align="left">
					<input type="text" name="E01SBMCOD" id="E01SBMCOD" size="14" maxlength="12" value="<%= msgPart.getE01SBMCOD() %>" readonly> 
					<a href="javascript:GetAvailableSafeDeposits('document.getElementById('E01SBMCOD')','E01SBMDSC','E01SBMTYP','D01SBTDSC' ,'E01SBMLOC','D01LOCNME','E01SBMSER', 'E01SBMKNU');"> 
					<img src="<%=request.getContextPath()%>/images/1b.gif" title="Help" align="bottom" border="0"></a>
					<img src="<%=request.getContextPath()%>/images/Check.gif" title="mandatory field" align="bottom" border="0">
				</div>
				</td>
			</tr>
     	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
	      <td nowrap> 
	        <div align="right">Tipo : </div>
	      </td>
				<td nowrap colspan="3">
				<div align="left">
					<input type="text" name="E01SBMTYP" id="E01SBMTYP" size="6" maxlength="5" value="<%= msgPart.getE01SBMTYP().trim() %>"> 
					<input type="text" name="D01SBTDSC" id="D01SBTDSC" size="52" maxlength="50" value="<%= msgPart.getD01SBTDSC() %>" readonly> 
					<a href="javascript:GetDepositType('document.getElementById('E01SBMTYP')','document.getElementById('D01SBTDSC')')"> 
					<img src="<%=request.getContextPath()%>/images/1b.gif" title="Help" align="bottom" border="0"></a>
					 <img src="<%=request.getContextPath()%>/images/Check.gif" title="mandatory field" align="bottom" border="0">
				</div>
				</td>
			</tr>
     	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
	      <td nowrap> 
	        <div align="right">Ubicación : </div>
	      </td>
				<td nowrap colspan="3">
				<div align="left">
					<input type="text" name="E01SBMLOC" id="E01SBMLOC" size="4" maxlength="3" value="<%= msgPart.getE01SBMLOC() %>">
					 <input type="text" name="D01LOCNME" id="D01LOCNME" size="51" maxlength="50" value="<%= msgPart.getD01LOCNME() %>" readonly>
					<A href="javascript:GetLocations('document.getElementById(')E01SBMLOC'','document.getElementById('D01LOCNME')')"> 
					<IMG src="<%=request.getContextPath()%>/images/1b.gif" title="Help" align="bottom" border="0"></A> 
					<img src="<%=request.getContextPath()%>/images/Check.gif" title="mandatory field" align="bottom" border="0">
				</div>
				</td>
			</TR>
     	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">  
	      <td nowrap> 
	        <div align="right">Descripción : </div>
	      </td>
				<td nowrap colspan="3">
				<div align="left">
					<eibsinput:text property="E01SBMDSC" name="msgPart" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_NAME%>" />
				</div>
				</td>
			</tr>
     	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
	      <td nowrap> 
	        <div align="right">Cliente : </div>
	      </td>
				<td nowrap colspan="3">
				<div align="left">
					<eibsinput:help name="msgPart" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CUSTOMER %>" property="E01SBMCUN" fn_param_one="E01SBMCUN" fn_param_two="D01CUSNA1" required="true" />
					<eibsinput:text property="D01CUSNA1" name="msgPart" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_NAME%>" />
				</div>
				</td>
     	</TR>
			<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
		<td nowrap> 
	        <div align="right">Cuenta Corriente a Debitar : </div>   
	      </td>
	      <td nowrap colspan="3">
	      	<div align="left">
 	 			<eibsinput:help name="msgPart" property="E01SBMRAC" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_ACCOUNT %>"fn_param_one="E01SBMRAC" fn_param_two="" fn_param_three="RT" fn_param_four="" fn_param_five="document.forms[0].E01SBMCUN.value"/>
      	    </div>
		  </td>
			</TR>
			<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
     	  <td nowrap> 
	        <div align="right">Tabla de Cargos : </div>
	      </td>
	      <td nowrap><div align="left">
	      	<input type="text" name="E01SBMFEE" id="E01SBMFEE" size="4" maxlength="2" value="<%= msgPart.getE01SBMFEE() %>">
      	    <a href="javascript:GetFeeTable('E01SBMFEE')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="Help" align="bottom" border="0" ></a>
      	    </div>
		  </td>
		  </tr>
		  <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
			<TD nowrap>
				<div align="right">Frecuencia de Cargos : </div>
			</TD>
				<TD nowrap>
				<div align="left">
				<SELECT name="E01SBMFRQ" id="E01SBMFRQ">
					<OPTION value="M"
						<%if (msgPart.getE01SBMFRQ().equals("M")) { out.print("selected"); }%>>Mensual</OPTION>
					<OPTION value="Q"
						<%if (msgPart.getE01SBMFRQ().equals("Q")) { out.print("selected"); }%>>Trimestral</OPTION>
					<OPTION value="S"
						<%if (msgPart.getE01SBMFRQ().equals("S")) { out.print("selected"); }%>>Semestral</OPTION>
					<OPTION value="Y"
						<%if (msgPart.getE01SBMFRQ().equals("Y")) { out.print("selected"); }%>>Anual</OPTION>
				</SELECT>
				</div>
				</TD>
			</TR>
			<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="17%" >
              <div align="right">Fecha Apertura :</div>
            </td>
              <td nowrap > 
                <div align="left"> 
                	<eibsinput:date name="msgPart" fn_year="E01SBMODY" fn_month="E01SBMODM" fn_day="E01SBMODD" />
                  
                </div>
              </td>
				<TD nowrap></TD>
				<TD nowrap></TD>
			</TR>
			<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="17%" >
              <div align="right">Fecha Pr&oacute;ximo Cobro :</div>
            </td>
              <td nowrap > 
                <div align="left"> 
                	<eibsinput:date name="msgPart" fn_year="E01SBMCDY" fn_month="E01SBMCDM" fn_day="E01SBMCDD"/>
                </div>
              </td>
				<TD nowrap></TD>
				<TD nowrap></TD>
      	</tr>
      	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
		  <td nowrap> 
		     <div align="right">No. Serie Caja de Seguridad : </div>        
		  </td>
      	  <td nowrap> 
      	    <input type="text" name="E01SBMSER" id="E01SBMSER" size="16" maxlength="14" value="<%= msgPart.getE01SBMSER() %>">
      	  </td>
				<TD nowrap></TD>
				<TD nowrap></TD>
      	</TR>
			<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="17%" >
              <div align="right">Número Llave :</div>
            </td>
      	  <td nowrap> 
      	    <input type="text" name="E01SBMKEY" id="E01SBMKEY" size="16" maxlength="14" value="<%= msgPart.getE01SBMKEY() %>">
      	  </td>
				<TD nowrap></TD>
				<TD nowrap></TD>
			</TR>
			<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="17%" >
              <div align="right">Cantidad de Llaves Liberadas :</div>
            </td>
      	  <td nowrap> 
      	    <input type="text" name="E01SBMKNU" id="E01SBMKNU" size="6" maxlength="4" value="<%= msgPart.getE01SBMKNU() %>">
      	  </td>
				<TD nowrap></TD>
				<TD nowrap></TD>
			</TR></table>
    </td>
   </tr>
  </table>
  <br>

  <div align="center"> 
	    <input id="EIBSBTN" type=submit name="Submit" value="Enviar">
   </div>
  
</form>
</body>
</html>
