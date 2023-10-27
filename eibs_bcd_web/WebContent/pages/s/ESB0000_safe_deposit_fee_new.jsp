<html>
<head>
<title>Safe Deposit Types</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<%@ page import ="datapro.eibs.master.Util" %>
<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@page import="com.datapro.constants.EibsFields"%>

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>

<jsp:useBean id= "msgPart" 	class= "datapro.eibs.beans.ESB000001Message"  	scope="session" />
<jsp:useBean id= "error" 	class= "datapro.eibs.beans.ELEERRMessage"  		scope="session" />
<jsp:useBean id= "userPO" 	class= "datapro.eibs.beans.UserPos"  			scope="session"/>

<% 
if ( !error.getERRNUM().equals("0")  ) {
      error.setERRNUM("0");
%>
<SCRIPT type="text/javascript">
        showErrors();
</SCRIPT>
<%}%>

</head>
<body>

<H3 align="center">Nuevo Cargo Caja Seguridad<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="safe_deposit_fee_new, ESB0000"></H3>
<hr size="4">


<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.safedeposit.JSESB0000">
 
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="500">
  
  <table class="tableinfo">
   <tr> 
   <td>
    <table cellspacing=0 cellpadding=2 width="100%" border="0">    
     	<tr id=trclear> 
	      <td nowrap width="40%"> 
	        <div align="right">Tabla : </div>
	      </td>
				<td nowrap width="60%" colspan="5">
					<div align="left">
					<input type="text"	name="E01SBFCOD" id="E01SBFCOD" size="3" maxlength="2"	value="<%= userPO.getHeader1() %>" readonly>
										<img src="<%=request.getContextPath()%>/images/Check.gif" title="mandatory field" align="bottom" border="0" > 
					</div>
				</td>
			</tr>
     	<tr id=trdark> 
	      <td nowrap> 
	        <div align="right">Descripción : </div>
	      </td>
				<td nowrap colspan="5">
				<div align="left">
				<input type="text" name="E01SBFDSC" size="35" maxlength="30" value="<%= msgPart.getE01SBFDSC() %>">
					<img src="<%=request.getContextPath()%>/images/Check.gif" title="mandatory field" align="bottom" border="0" > 
				</div>
				</td>
			</tr>
     	<tr id=trclear>
	      <TD nowrap></TD>
				<td nowrap colspan="5"></td>
			</tr>
     	<tr id=trdark>
	      <TD nowrap>
	      Tipo</TD>
	      <td nowrap>Cargo</td>
	      <TD>Frec.</TD>
	      <TD nowrap>Banco</td>
	      <TD nowrap>Mda</td>
	      <TD nowrap>Cuenta Contable</TD>
     	</tr>
     	<tr id=trclear> 
		  <td nowrap valign="bottom"> 
		     <div align="left"><INPUT type="text" name="E01SBFFD1" size="30"
					maxlength="30" value="<%= msgPart.getE01SBFFD1() %>" readonly> </div>        
		  </td>
      	  <td nowrap valign="bottom"><div align="left">
      	    <input type="text" name="E01SBFAM1" size="16" maxlength="15" value="<%= msgPart.getE01SBFAM1() %>">
      	    					<img src="<%=request.getContextPath()%>/images/Check.gif" title="mandatory field" align="bottom" border="0" > 
      	    </div>
      	  </td>
				<TD nowrap valign="bottom">
				<div align="left">
				<SELECT name="E01SBFFR1">
					<OPTION value="D"
						<%if (msgPart.getE01SBFFR1().equals("D")) { out.print("selected"); }%>>Diario</OPTION>
					<OPTION value="M"
						<%if (msgPart.getE01SBFFR1().equals("M")) { out.print("selected"); }%>>Mensual</OPTION>
					<OPTION value="S"
						<%if (msgPart.getE01SBFFR1().equals("S")) { out.print("selected"); }%>>Semestral</OPTION>
					<OPTION value="Y"
						<%if (msgPart.getE01SBFFR1().equals("Y")) { out.print("selected"); }%>>Anual</OPTION>
					<OPTION value="O"
						<%if (msgPart.getE01SBFFR1().equals("O")) { out.print("selected"); }%>>A la Apertura</OPTION>
				</SELECT>
				<img src="<%=request.getContextPath()%>/images/Check.gif" title="mandatory field" align="bottom" border="0" > 
				</div>
				</TD>
      	  <TD nowrap valign="bottom">
      	  	<eibsinput:text property="E01SBFBK1" name="msgPart" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_BANK %>" required="true" readonly="false"/> 
      	  	  
      	  </TD>
      	  	<TD nowrap valign="bottom">
				<eibsinput:help property="E01SBFCY1" name="msgPart" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_CURRENCY %>" required="true" readonly="false"
    			 fn_param_one="E01SBFCY1"/> 		
			</TD>
    		<TD nowrap valign="bottom"> 
    		<div align="left"> 
    			<eibsinput:help property="E01SBFGL1" name="msgPart" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_GLEDGER %>" required="true" readonly="false"
    			 fn_param_one="E01SBFGL1" fn_param_two="document.forms[0].E01SBFBK1.value"/> 
    		</div>
			</TD>
	
     	</tr>
      	<tr id=trdark>
		  <td nowrap valign="bottom">
				<div align="left"><INPUT type="text" name="E01SBFFD2" size="30"
					maxlength="30" value="<%= msgPart.getE01SBFFD2() %>" readonly></div>
				</td>
      	  <td nowrap valign="bottom"> 
      	    <input type="text" name="E01SBFAM2" size="16" maxlength="15" value="<%= msgPart.getE01SBFAM2() %>">
      	  </td>
				<TD nowrap valign="bottom">
				<div align="left">
				<SELECT name="E01SBFFR2">
					<OPTION value="D"
						<%if (msgPart.getE01SBFFR2().equals("D")) { out.print("selected"); }%>>Diario</OPTION>
					<OPTION value="M"
						<%if (msgPart.getE01SBFFR2().equals("M")) { out.print("selected"); }%>>Mensual</OPTION>
					<OPTION value="S"
						<%if (msgPart.getE01SBFFR2().equals("S")) { out.print("selected"); }%>>Semestral</OPTION>
					<OPTION value="Y"
						<%if (msgPart.getE01SBFFR2().equals("Y")) { out.print("selected"); }%>>Anual</OPTION>
					<OPTION value="O"
						<%if (msgPart.getE01SBFFR2().equals("O")) { out.print("selected"); }%>>A la Apertura</OPTION>
				</SELECT>
				</div>
				</TD>
      	  <TD nowrap valign="bottom">
      	  	<eibsinput:text property="E01SBFBK2" name="msgPart" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_BANK %>" readonly="false"/>
      	  </TD>
      	  <TD nowrap valign="bottom">
      	  	<eibsinput:help property="E01SBFCY2" name="msgPart" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_CURRENCY %>" readonly="false" fn_param_one="E01SBFCY2"/> 
      	  </TD>
    	<TD nowrap valign="bottom"> 
    		<div align="left"> 
    			<eibsinput:help property="E01SBFGL2" name="msgPart" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_GLEDGER %>" required="true" readonly="false"
    			 fn_param_one="E01SBFGL2" fn_param_two="document.forms[0].E01SBFBK1.value"/>     		    			
    		</div>
			</TD>
      	</tr>
     </table>
    </td>
   </tr>
  </table>
  <br>
  
  <p align="center"> 
    <input id="ESBSBTN" type="submit" name="Submit" value="Enviar">
  </p>
</form>
</body>
</html>
