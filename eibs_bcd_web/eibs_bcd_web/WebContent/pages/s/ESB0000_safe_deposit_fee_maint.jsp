<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@ page import = "datapro.eibs.master.Util" %>
<%@page import="com.datapro.constants.EibsFields"%>

<html>
<head>
<title>Mantenimiento Cargos Caja Seguridad</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<%@ page import ="datapro.eibs.master.Util" %>

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>

<jsp:useBean id= "msgPart" 	class= "datapro.eibs.beans.ESB000001Message"  	scope="session" />
<jsp:useBean id= "error" 	class= "datapro.eibs.beans.ELEERRMessage"  		scope="session" />
<jsp:useBean id= "userPO" 	class= "datapro.eibs.beans.UserPos"  			scope="session"/>

</head>
<body>
<% 
if ( !error.getERRNUM().equals("0")  ) {
     error.setERRNUM("0");
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors();");
     out.println("</SCRIPT>");
} 
%>
<H3 align="center">Mantenimiento Cargos Caja Seguridad<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="safe_deposit_fee_maint, ESB0000"></H3>
<hr size="4">


<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.safedeposit.JSESB0000">
 
  <INPUT TYPE=HIDDEN NAME="SCREEN" id="SCREEN" VALUE="500">
  <%int row = 0; %>
  <table class="tableinfo">
   <tr> 
   <td>
    <table cellspacing=0 cellpadding=2 width="100%" border="0">    
     	<tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
	      <td nowrap width="40%"> 
	        <div align="right">Codigo Tabla : </div>
	      </td>
				<td nowrap width="60%" colspan="6">
					<div align="left">
					<eibsinput:text property="E01SBFCOD" name="msgPart" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_INTEGER %>" size="3" maxlength="2" readonly="true" required="true"/>
					</div>
				</td>
			</tr>
     	<tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
	      <td nowrap> 
	        <div align="right">Descripción : </div>
	      </td>
				<td nowrap colspan="6">
				<div align="left">
					<eibsinput:text property="E01SBFDSC" name="msgPart" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" required="true"/>
				</div>
				</td>
			</tr>
     	<tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
	      <TD nowrap></TD>
				<td nowrap colspan="6"></td>
			</tr>
     	<tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
	      <TD nowrap> Tipo</TD>
	      <td nowrap>Cargo</td>
	      <TD>Frecuencia</TD>
	      <TD nowrap>Banco</td>
	      <TD nowrap>Moneda</td>
	      <TD nowrap>ITBMS</td>
	      <TD nowrap>Cuenta Contable</TD>
     	</tr>
     	<tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
		  <td nowrap valign="bottom"> 
		     <div align="left">
		     	<eibsinput:text property="E01SBFFD1" name="msgPart" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true"/>
		     </div>        
		  </td>
      	  <td nowrap valign="bottom">
      	  	<div align="left">
      	  		<eibsinput:text property="E01SBFAM1" name="msgPart" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DECIMAL%>" size="16" maxlength="15" required="true"/>
      	    </div>
      	  </td>
				<TD nowrap valign="bottom">
				<div align="left">
				<SELECT name="E01SBFFR1" id="E01SBFFR1">
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
      	  	<eibsinput:text property="E01SBFBK1" name="msgPart" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_BANK %>" />
      	  </TD>
      	  
        
      	  <TD nowrap valign="bottom">
      	  	<eibsinput:help property="E01SBFCY1" name="msgPart" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_CURRENCY %>" required="true" readonly="false"
    			 fn_param_one="E01SBFCY1"/> 
      	  	</TD>
					
			<TD nowrap valign="bottom">
		     <div align="center"> 
	              <select name="E01SBFTX1" id="E01SBFTX1">
	                <option value=" " <% if (!(msgPart.getE01SBFTX1().equals("Y") ||msgPart.getE01SBFTX1().equals("N"))) out.print("selected"); %>></option>
	                <option value="Y" <% if (msgPart.getE01SBFTX1().equals("Y")) out.print("selected"); %>>Si</option>
	                <option value="N" <% if (msgPart.getE01SBFTX1().equals("N")) out.print("selected"); %>>No</option>        
	              </select>                
              </div>
		  </TD>		
					
    		<TD nowrap valign="bottom"> 
    		<div align="left"> 
    			<eibsinput:help property="E01SBFGL1" name="msgPart" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_GLEDGER %>" required="true" readonly="false"
    			 fn_param_one="E01SBFGL1" fn_param_two="document.forms[0].E01SBFBK1.value"/> 
    		</div>
			</TD>
     	</tr>
     	
     	
      	<tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
		  <td nowrap valign="bottom">
				<div align="left">
					<eibsinput:text property="E01SBFFD2" name="msgPart" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true"/>
				</div>
				</td>
      	  <td nowrap valign="bottom"> 
      	  	<eibsinput:text property="E01SBFAM2" name="msgPart" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DECIMAL%>" size="16" maxlength="15" />
      	  </td>
				<TD nowrap valign="bottom">
				<div align="left">
				<SELECT name="E01SBFFR2" id="E01SBFFR2">
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
      	  	<eibsinput:text property="E01SBFBK2" name="msgPart" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_BANK %>" />
      	  </TD>
      	  <TD nowrap valign="bottom">
      	  	<eibsinput:help property="E01SBFCY2" name="msgPart" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_CURRENCY %>" required="false" readonly="false"
    			 fn_param_one="E01SBFCY2"/> 
		   </TD>
		  <TD nowrap valign="bottom">
		     <div align="center"> 
	              <select name="E01SBFTX2" id="E01SBFTX2">
	                <option value=" " <% if (!(msgPart.getE01SBFTX2().equals("Y") ||!msgPart.getE01SBFTX2().equals("N"))) out.print("selected"); %>></option>
	                <option value="Y" <% if (msgPart.getE01SBFTX2().equals("Y")) out.print("selected"); %>>Si</option>
	                <option value="N" <% if (msgPart.getE01SBFTX2().equals("N")) out.print("selected"); %>>No</option>        
	              </select>                
              </div>
		  </TD>			
    		<TD nowrap valign="bottom"> 
    		<div align="left"> 
    			<eibsinput:help property="E01SBFGL2" name="msgPart" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_GLEDGER %>" required="false" readonly="false"
    			 fn_param_one="E01SBFGL2" fn_param_two="document.forms[0].E01SBFBK2.value"/> 
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
