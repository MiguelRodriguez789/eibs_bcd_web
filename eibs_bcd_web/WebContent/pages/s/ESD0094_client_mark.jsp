<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@ page import = "datapro.eibs.master.Util" %>
<%@page import="com.datapro.constants.EibsFields"%>
<%@page import="com.datapro.eibs.constants.HelpTypes"%>

<html>
<head>
<title>Insurance Info</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet"> 

</head>

<jsp:useBean id="ESD0094Record" class="datapro.eibs.beans.ESD009401Message"  scope="session" /> 
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />
 
<body>

<script language="Javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script language="Javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>
<SCRIPT Language="javascript">
<%
 	boolean isApprovalInquiry = userPO.getPurpose().equals("APPROVAL_INQ");
 	boolean isInquiry = userPO.getPurpose().equals("INQUIRY");
 	boolean isReadOnly = isApprovalInquiry || isInquiry;
 	String legtyp = (ESD0094Record.getH01LGT().equals("1")?"JURIDICO":"PERSONA");  
	String Readonly = "";
 	String disabled = "";
 	String mandatory = "<img src=\"" + request.getContextPath() + "/images/Check.gif\" alt=\"campo obligatorio\" align=\"bottom\" border=\"0\" >";
 	
	if (!(userPO.getPurpose().equals("NEW") || userPO.getPurpose().equals("MAINTENANCE"))) 
		{ Readonly= " readonly ";
		  disabled = " disabled";
		  mandatory = "";
		}	
    if (isApprovalInquiry) {%>
		<% if (!ESD0094Record.getH01LGT().equals("1") ) { %>
		     builtNewMenu(client_ap_personal_opt);
         <% } else {  %>
		     builtNewMenu(client_ap_corp_opt);
         <% } %>
   <% } else { %>

   <% if (isInquiry) { %>
	    <% if (!ESD0094Record.getH01LGT().equals("1") ) { %>
		     builtNewMenu(client_inq_personal_opt);
         <% } else {  %>
		     builtNewMenu(client_inq_corp_opt);
         <% } %>	 
   <%} else {%>
         <% if (!ESD0094Record.getH01LGT().equals("1") ) { %>
		     builtNewMenu(client_personal_opt);
         <% } else {  %>
		     builtNewMenu(client_corp_opt);
         <% } %>
   <% } %> 
   <% } %>  
 
function goAction(op) {
	document.forms[0].SCREEN.value = op;
	if (op == 4) {
		if (!confirm("Desea borrar este registro?")) {
			return;
		}
	}
	document.forms[0].submit();
}

</SCRIPT>  
 

<% 
    if ( !error.getERRNUM().equals("0")  ) {
        out.println("<SCRIPT Language=\"Javascript\">");
        error.setERRNUM("0");
        out.println("       showErrors()");
        out.println("</SCRIPT>");
    }
    out.println("<SCRIPT> initMenu(); </SCRIPT>");
    
%>

<H3 align="center">Información de Seguros<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="client_mark.jsp, ESD0094"></H3>
<hr size="4">

<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSESD0094" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="5">
  <INPUT TYPE=HIDDEN NAME="E01RTP" VALUE="<%=userPO.getHeader10() %>">

  <table class="tableinfo">
  <tr> 
    <td nowrap> 
      <table  class="tableinfo" width="100%">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" class="tbhead" bgcolor="#FFFFFF" bordercolor="#FFFFFF" align="center">
        <tr id="trdark"> 
            <td nowrap width="10%" align="right">Tipo Legal : </td>
            <td nowrap width="20%" align="left" > <%=legtyp%></td>
            <td nowrap width="10%" align="right">Estado : </td>
			<td nowrap width="60%" align="left" style="color:red;font-size:12;">
				<b><%= ESD0094Record.getD01STS().trim()%>  <%= ESD0094Record.getD01UC6().trim()%></b>		
			</td>
		</tr>
		<tr id="trclear"> 
            <td nowrap width="10%" align="right">Código :</td>
            <td nowrap width="20%" align="left"><b><%= ESD0094Record.getH01CUN().trim()%></b></td>
            <td nowrap width="10%" align="right">Nombre Legal :</td>
			<td nowrap width="60%" align="left"><b><%= ESD0094Record.getH01NA1().trim()%></b></td>
		</tr>
		<tr id="trdark"> 
            <td nowrap width="10%" align="right">ID : </td>
            <td nowrap width="20%" align="left">
            	<b><%=ESD0094Record.getH01PID().trim()%> - <%=ESD0094Record.getH01TID().trim()%> - <%= ESD0094Record.getH01IDN().trim()%></b> 
			</td>
            <td nowrap width="10%" align="right"></td>
			<td nowrap width="60%" align="left"></td>
		</tr>
        </table>
	</td>
  </tr>
</table>  
    </td>
  </tr>
 </table>
 
  <h4>Información Básica</h4>  
  <table  class="tableinfo" width="100%">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          
          <tr id="trdark"> 
            <td nowrap width="15%" align="right">Padece alguna enfermedad? :</td>
            <td nowrap width="35%" align="left"> 
              <input type="hidden" name="E01PAE" value="<%= ESD0094Record.getE01PAE()%>">
              <input type="radio" name="CE01PAE" value="Y" onClick="document.forms[0].E01PAE.value='Y';"
			  <%if(ESD0094Record.getE01PAE().equals("Y")) out.print("checked");%> <%=disabled %> >
              Sí 
              <input type="radio" name="CE01PAE" value="N" onClick="document.forms[0].E01PAE.value='N';"
			  <%if(ESD0094Record.getE01PAE().equals("N")) out.print("checked");%> <%=disabled %>>
              No 
            </td>
            <td nowrap width="15%" align="right">Cual enfermedad :</td>
            <td nowrap width="35%" align="left">
            	<eibsinput:text name="ESD0094Record" property="E01ENF" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CHAR %>" size="65" maxlength="60" required="false" readonly="<%=isReadOnly%>" modified="F01ENF"/>
            </td>
         </tr>
         <tr id="trclear"> 
            <td nowrap width="15%" align="right">Requiere examen médico? :</td>
            <td nowrap width="35%" align="left">
            	<input type="hidden" name="E01REM" value="<%= ESD0094Record.getE01REM()%>">
              <input type="radio" name="CE01REM" value="Y" onClick="document.forms[0].E01REM.value='Y';"
			  <%if(ESD0094Record.getE01REM().equals("Y")) out.print("checked");%> <%=disabled %> >
              Sí 
              <input type="radio" name="CE01REM" value="N" onClick="document.forms[0].E01REM.value='N';"
			  <%if(ESD0094Record.getE01REM().equals("N")) out.print("checked");%> <%=disabled %>>
              No 
            </td >
            <td nowrap width="15%" align="right"></td>
            <td nowrap width="35%" align="left">
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="15%" align="right">Estatura :</td>
            <td nowrap width="35%" align="left">
            	<eibsinput:text name="ESD0094Record" property="E01EST" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" size="7" maxlength="4" required="false" readonly="<%=isReadOnly%>" modified="F01EST"/> 
            </td >
            <td nowrap width="15%" align="right">Peso :</td>
            <td nowrap width="35%" align="left">
            	<eibsinput:text name="ESD0094Record" property="E01PES" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_INTEGER %>" size="5" maxlength="3" required="false" readonly="<%=isReadOnly%>" modified="F01PES"/>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="15%" align="right">Beneficiario :</td>
            <td nowrap width="35%" align="left">
            	<eibsinput:text name="ESD0094Record" property="E01BEN" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_TEXT %>" size="65" maxlength="60" required="false" readonly="<%=isReadOnly%>" modified="F01BEN"/> 
            </td >
            <td nowrap width="15%" align="right">Porcentaje Beneficiario :</td>
            <td nowrap width="35%" align="left">
            	<eibsinput:text name="ESD0094Record" property="E01BEP" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_PERCENTAGE %>" size="7" maxlength="5" required="false" readonly="<%=isReadOnly%>" modified="F01BEP"/>
            </td>
          </tr>
          <tr id="trdark">
            	<td nowrap width="15%" align="right">Fecha de Actualización : </td>
            	<td nowrap width="35%" align="left">
            		<eibsinput:date name="ESD0094Record" fn_year="E01ICY" fn_month="E01ICM" fn_day="E01ICD" required="false" readonly="true"/> 
 	            </td>	
 	           	<td nowrap width="15%" align="right"></td>
            	<td nowrap width="35%" align="left">	 
            	</td>
            </tr>
       </table>
            
       </td>
       </tr>
    </table>

 <br> 
<% if (userPO.getPurpose().equals("NEW") || userPO.getPurpose().equals("MAINTENANCE"))  { %>	   
    <table width="100%">		
  	<tr>
  		<td width="100%">
  		  <div align="center"> 
     		<input id="EIBSBTN" type=button name="Submit" value="Enviar" onClick="goAction(5);" <%= disabled %>>
     	  </div>	
  		</td>
  	</tr>	
  </table>	
<%} %>
  </form>
</body>

<SCRIPT Language="Javascript">
	
</SCRIPT>
</html>
