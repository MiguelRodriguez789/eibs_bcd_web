<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@ page import = "datapro.eibs.master.Util" %>
<%@page import="com.datapro.constants.EibsFields"%>
<%@page import="com.datapro.eibs.constants.HelpTypes"%>

<html>
<head>
<title>Canales de Contacto</title>
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
	String read = "";
 	String disabled = "";
 	String mandatory = "<img src=\"" + request.getContextPath() + "/images/Check.gif\" alt=\"campo obligatorio\" align=\"bottom\" border=\"0\" >";
 	String tf = "false";
 	
	if (!(userPO.getPurpose().equals("NEW") || userPO.getPurpose().equals("MAINTENANCE"))) 
		{ read = " readonly ";
		  disabled = " disabled";
		  tf = "true";
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
	document.forms[0].E01CCC.value = getValChk("E01C") + getValChk("E01P");
	document.forms[0].submit();
}

function chgTipo(p) {
	document.forms[0].E01CCN.value = p;
	var x = [ 'E01C', 'E01C'];
 	if (p == 'Y') {
		document.forms[0].E01C.disabled = false;
		document.forms[0].E01P.disabled = false;
	} else {	
		document.forms[0].E01C.checked = false;
		document.forms[0].E01P.checked = false;
		document.forms[0].E01C.disabled = true;
		document.forms[0].E01P.disabled = true;
	}	
 }
 
 function getValChk(v) {
	var formLength= document.forms[0].elements.length;
   	var vc = "N";
	for(n=0;n<formLength;n++) {
     	var elementName= document.forms[0].elements[n].name;
      	if(elementName == v) {
			if (document.forms[0].elements[n].checked == true) {
				vc = document.forms[0].elements[n].value;
        		break;
			}
      	}
    }
    return vc;
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

<H3 align="center">Canales de Contacto<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="client_contact_via.jsp, ESD0094"></H3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSESD0094" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="5">
  
  <INPUT TYPE=HIDDEN NAME="E01RTP" VALUE="<%=userPO.getHeader10() %>">
  <INPUT TYPE=HIDDEN NAME="E01CCN" VALUE="<%=ESD0094Record.getE01CCN()%>">
  <INPUT TYPE=HIDDEN NAME="E01CCC" VALUE="<%=ESD0094Record.getE01CCC()%>">
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
            <td nowrap width="10%" align="right">C�digo :</td>
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

  <h4>Informaci�n B�sica</h4>  
  <table  class="tableinfo" width="100%">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          
          <tr id="trdark"> 
            <td nowrap width="15%" align="right">Desea Contacto :</td>
            <td nowrap width="35%" align="left"> 
              <p> 
                <input type="radio" name="CCN" value="Y" <%if (ESD0094Record.getE01CCN().equals("Y")) out.print("checked"); %> <%=disabled%> onclick="chgTipo(this.value)" <%=(ESD0094Record.getF01CCN().equals("Y"))?"id=\"txtchanged\"":"" %>>
                SI
                <input type="radio" name="CCN" value="N" <%if (!ESD0094Record.getE01CCN().equals("Y")) out.print("checked"); %> <%=disabled%> onclick="chgTipo(this.value)" <%=(ESD0094Record.getF01CCN().equals("Y"))?"id=\"txtchanged\"":"" %>>
                NO 
              </p> 
            </td>
            <td nowrap width="15%" align="right">Canal de Contacto :</td>
            <td nowrap width="35%" align="left">
            	<INPUT type="checkbox" name="E01C" value="Y" <% if (ESD0094Record.getE01CCC().substring(0,1).equals("Y")) out.print("checked"); %> <%=disabled%>>Correo Electr�nico
                <INPUT type="checkbox" name="E01P" value="Y" <% if (ESD0094Record.getE01CCC().substring(1,2).equals("Y")) out.print("checked"); %> <%=disabled%>>Tel�fono
         	</td>
         </tr>  
         <tr id="trclear"> 
            <td nowrap width="15%" align="right"></td>
            <td nowrap width="35%" align="left">
            </td >
            <td nowrap width="15%" align="right"></td>
            <td nowrap width="35%" align="left">
            </td>
          </tr>
          <tr id="trdark">
            	<td nowrap width="15%" align="right">Fecha de Actualizaci�n : </td>
            	<td nowrap width="35%" align="left">
            		<eibsinput:date name="ESD0094Record" fn_year="E01CCY" fn_month="E01CCM" fn_day="E01CCD" required="false" readonly="true"/> 
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
	<% if ((userPO.getPurpose().equals("NEW") || userPO.getPurpose().equals("MAINTENANCE"))) {%> 
	  chgTipo('<%=ESD0094Record.getE01CCN()%>')
	<% } %>>
</SCRIPT>
</html>
