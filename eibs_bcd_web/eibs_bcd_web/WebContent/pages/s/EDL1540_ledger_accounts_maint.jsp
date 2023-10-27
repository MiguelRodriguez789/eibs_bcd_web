<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@ page import = "datapro.eibs.master.Util" %>
<%@ page import="com.datapro.constants.EibsFields" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<html>
<head>
<title>Cuentas Contables NIIF 9 - Provision</title>
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="GENERATOR" content="Rational Software Architect">

<jsp:useBean id="EDL1540Record" class="datapro.eibs.beans.EDL154002Message"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>

<%
		if (!error.getERRNUM().equals("0")) {
		error.setERRNUM("0");
		out.println("<SCRIPT Language=\"Javascript\">");
		out.println("       showErrors()");
		out.println("</SCRIPT>");
	}
	
	boolean isReadOnly = userPO.getPurpose().equals("MAINT")?true:false;
%>

</head>
<body>
<H3 align="center">Cuentas Contables NIIF 9 - Provision<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="ledger_accounts_maint.jsp, EDL1540"></H3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.misc.JSEDL1540" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="33">
  
  <table  class="tableinfo">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
          <tr id="trdark"> 
            <td nowrap width="16%" > 
              <div align="right"><b>Banco:</b></div>
            </td>
            <td nowrap colspan="3" > 
              <div align="left">
              	<input type="text" name="E02BNK" maxlength="2" size="3" value="<%= currUser.getE01UBK()%>" readonly>
              </div>
            </td>
			<td nowrap width="16%" > 
              <div align="right"><b>Moneda:</b></div>
            </td>
            <td nowrap colspan="3" > 
              <div align="left">
              	<eibsinput:help name="EDL1540Record" property="E02CCY" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CURRENCY %>" fn_param_one="E02CCY" fn_param_two="document.forms[0].E02BNK.value" required="true" 
              	readonly="<%=isReadOnly %>"/>
              </div>
            </td>
		  </tr>	
		  <tr id="trclear"> 
			<td nowrap width="16%" > 
              <div align="right"><b>Modalidad de Cr&eacute;dito/Impuesto:</b></div>
            </td>
            <td nowrap colspan="3" > 
              <div align="left"><font face="Arial"><font face="Arial"><font size="2"> 
              	<select name="E02TPR" <%=isReadOnly?"disabled":""%>>
						<option value=" " <%if (!(EDL1540Record.getE02TPR().equals("H")  
													|| EDL1540Record.getE02TPR().equals("M")
													|| EDL1540Record.getE02TPR().equals("C")
													|| EDL1540Record.getE02TPR().equals("L")
													|| EDL1540Record.getE02TPR().equals("I")
													)){ out.print("selected");}%>> </option>
						<option value="H" <%if (EDL1540Record.getE02TPR().equals("H")) { out.print("selected");}%>>Hipotecario</option>
						<option value="M" <%if (EDL1540Record.getE02TPR().equals("M")) { out.print("selected");}%>>Microcredito</option>
						<option value="C" <%if (EDL1540Record.getE02TPR().equals("C")) { out.print("selected");}%>>Consumo</option>
						<option value="L" <%if (EDL1540Record.getE02TPR().equals("L")) { out.print("selected");}%>>Comercial</option>
						<option value="T" <%if (EDL1540Record.getE02TPR().equals("T")) { out.print("selected");}%>>Impuesto</option>
				</select>
              	</font></font></font>
              </div>
            </td>
			<td nowrap width="16%" > 
              <div align="right"></div>
            </td>
            <td nowrap colspan="3" > 
              <div align="left"></div>
            </td>
		  </tr>
        </table>
      </td>
    </tr>
  </table>
  <br>  
  <table  class="tableinfo">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="trdark"> 
            <td nowrap width="15%"> 
           </td>
           <td nowrap width="5%"> 
           </td>
            <td nowrap width="25%"> 
              <div align="right"><b>Cuenta de Debito Capital</b></div>
            </td>
            <td nowrap width="55%"> 
              <div align="left" >
                <eibsinput:help name="EDL1540Record" property="E02CDP" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_GLEDGER %>" fn_param_one="E02CDP" fn_param_two="document.forms[0].E02BNK.value" fn_param_three="document.forms[0].E02CCY.value" required="true" />
              </div>
            </td>
            <td nowrap width="25%"> 
              <div align="right"><b>Cuenta de Debito Reintegro Capital</b></div>
            </td>
            <td nowrap width="55%"> 
              <div align="left" >
                <eibsinput:help name="EDL1540Record" property="E02RDC" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_GLEDGER %>" fn_param_one="E02RDC" fn_param_two="document.forms[0].E02BNK.value" fn_param_three="document.forms[0].E02CCY.value" required="true" />
              </div>
            </td>
            
	    </tr>
         <tr id="trclear"> 
           <td nowrap width="15%"> 
           </td>
           <td nowrap width="5%"> 
           </td>
            <td nowrap width="25%"> 
              <div align="right"><b>Cuenta de Credito Capital</b></div>
            </td>
            <td nowrap width="55%"> 
              <div align="left" >
                <eibsinput:help name="EDL1540Record" property="E02CCP" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_GLEDGER %>" fn_param_one="E02CCP" fn_param_two="document.forms[0].E02BNK.value" fn_param_three="document.forms[0].E02CCY.value" required="true" />
              </div>
            </td>
			<td nowrap width="25%"> 
              <div align="right"><b>Cuenta de Credito Reintegro Capital</b></div>
            </td>
            <td nowrap width="55%"> 
              <div align="left" >
                <eibsinput:help name="EDL1540Record" property="E02RCC" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_GLEDGER %>" fn_param_one="E02RCC" fn_param_two="document.forms[0].E02BNK.value" fn_param_three="document.forms[0].E02CCY.value" required="true" />
              </div>
            </td>
          </tr>
          <tr id="trdark"> 
          <td nowrap width="15%"> 
           </td>
           <td nowrap width="5%"> 
           </td>
           	<td nowrap width="25%"> 
              <div align="right"><b>Cuenta de Debito Intereses</b></div>
            </td>
            <td nowrap width="55%"> 
              <div align="left" >
                <eibsinput:help name="EDL1540Record" property="E02CDI" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_GLEDGER %>" fn_param_one="E02CDI" fn_param_two="document.forms[0].E02BNK.value" fn_param_three="document.forms[0].E02CCY.value" required="true" />
              </div>
            </td>
			<td nowrap width="25%"> 
              <div align="right"><b>Cuenta de Debito Reintegro Interes</b></div>
            </td>
            <td nowrap width="55%"> 
              <div align="left" >
                <eibsinput:help name="EDL1540Record" property="E02RDI" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_GLEDGER %>" fn_param_one="E02RDI" fn_param_two="document.forms[0].E02BNK.value" fn_param_three="document.forms[0].E02CCY.value" required="true" />
              </div>
            </td>
          </tr>
          <tr id="trclear"> 
          	<td nowrap width="15%"> 
           </td>
           <td nowrap width="5%"> 
           </td>
            <td nowrap width="25%"> 
              <div align="right"><b>Cuenta de Credito Intereses</b></div>
            </td>
            <td nowrap width="55%"> 
              <div align="left" >
                <eibsinput:help name="EDL1540Record" property="E02CCI" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_GLEDGER %>" fn_param_one="E02CCI" fn_param_two="document.forms[0].E02BNK.value" fn_param_three="document.forms[0].E02CCY.value" required="true" />
              </div>
            </td>
			<td nowrap width="25%"> 
              <div align="right"><b>Cuenta de Credito Reintegro Intereses </b></div>
            </td>
            <td nowrap width="55%"> 
              <div align="left" >
                <eibsinput:help name="EDL1540Record" property="E02RCI" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_GLEDGER %>" fn_param_one="E02RCI" fn_param_two="document.forms[0].E02BNK.value" fn_param_three="document.forms[0].E02CCY.value" required="true" />
              </div>
            </td>
          </tr>
          <tr id="trdark"> 
        	<td nowrap width="15%"> 
           </td>
           <td nowrap width="5%"> 
           </td>
        	 <td nowrap width="25%"> 
              <div align="right"><b>Cuenta de Debito Otros Gastos</b></div>
            </td>
             <td nowrap width="55%"> 
              <div align="left" >
                <eibsinput:help name="EDL1540Record" property="E02CDO" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_GLEDGER %>" fn_param_one="E02CDO" fn_param_two="document.forms[0].E02BNK.value" fn_param_three="document.forms[0].E02CCY.value" required="true" />
              </div>
              </td>
			  <td nowrap width="25%"> 
              <div align="right"><b>Cuenta de Debito Reintegro Otros Gastos</b></div>
            </td>
            <td nowrap width="55%"> 
              <div align="left" >
                <eibsinput:help name="EDL1540Record" property="E02RDO" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_GLEDGER %>" fn_param_one="E02RDO" fn_param_two="document.forms[0].E02BNK.value" fn_param_three="document.forms[0].E02CCY.value" required="true" />
              </div>
          	</td>
          </tr>
          <tr id="trclear">  
            <td nowrap width="15%"> 
           </td>
           <td nowrap width="5%"> 
           </td>
            <td nowrap width="25%"> 
              <div align="right"><b>Cuenta de Credito Otros Gastos</b></div>
            </td>
            <td nowrap width="55%"> 
              <div align="left" >
                <eibsinput:help name="EDL1540Record" property="E02CCO" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_GLEDGER %>" fn_param_one="E02CCO" fn_param_two="document.forms[0].E02BNK.value" fn_param_three="document.forms[0].E02CCY.value" required="true" />
              </div>
              </td>
			  <td nowrap width="25%"> 
              <div align="right"><b>Cuenta de Credito Reintegro Otros Gastos </b></div>
            </td>
            <td nowrap width="55%"> 
              <div align="left" >
                <eibsinput:help name="EDL1540Record" property="E02RCO" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_GLEDGER %>" fn_param_one="E02RCO" fn_param_two="document.forms[0].E02BNK.value" fn_param_three="document.forms[0].E02CCY.value" required="true" />
              </div>
            </td>
          </tr>
  		</table>
  </td>
  </tr>
  </table>
  <br>
  <p>
  <br>
  </p>
  <div align="center"> 
  	<input id="EIBSBTN" type=submit name="Submit" value="Enviar">
  </div>
</form>
</body>
</html>