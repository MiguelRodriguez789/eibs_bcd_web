<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@ page import = "datapro.eibs.master.Util" %>
<%@page import="com.datapro.constants.EibsFields"%>
<%@page import="com.datapro.eibs.constants.HelpTypes"%>

<html>
<head>
<title>Geo Info</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet"> 

</head>

<jsp:useBean id="ESD0094Record" class="datapro.eibs.beans.ESD009401Message"  scope="session" /> 
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />
 
<body>

<script src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>
<SCRIPT >
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
%>    
 
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

<H3 align="center">Información de Georeferenciador<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="client_geo.jsp, ESD0094"></H3>
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
 
  <% int row = 0;%>
  <h4>Información Básica</h4>  
  <table  class="tableinfo" width="100%">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">  
            <td nowrap width="15%" align="right">Direccion Normalizada :</td>
            <td nowrap width="35%" align="left"> 
              <eibsinput:text name="ESD0094Record" property="E01CUKI01" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CHAR %>" size="65" maxlength="60" required="false" readonly="true" /> 
            </td>
            <td nowrap width="15%" align="right">Barrio : </td>
            <td nowrap width="35%" align="left">
            	<eibsinput:text name="ESD0094Record" property="E01CUKI02" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CHAR %>" size="65" maxlength="60" required="false" readonly="true" />
            </td>
         </tr>
         <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">  
            <td nowrap width="15%" align="right">Localidad :</td>
            <td nowrap width="35%" align="left"> 
              <eibsinput:text name="ESD0094Record" property="E01CUKI03" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CHAR %>" size="65" maxlength="60" required="false" readonly="true" /> 
            </td>
            <td nowrap width="15%" align="right">Nivel SocioEconomico : </td>
            <td nowrap width="35%" align="left">
            	<eibsinput:text name="ESD0094Record" property="E01CUKI04" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CHAR %>" size="65" maxlength="60" required="false" readonly="true" />
            </td>
         </tr>
         <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">  
            <td nowrap width="15%" align="right">Coordenada X :</td>
            <td nowrap width="35%" align="left"> 
              <eibsinput:text name="ESD0094Record" property="E01CUKI05" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CHAR %>" size="65" maxlength="60" required="false" readonly="true" /> 
            </td>
            <td nowrap width="15%" align="right">Coordenada Y : </td>
            <td nowrap width="35%" align="left">
            	<eibsinput:text name="ESD0094Record" property="E01CUKI06" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CHAR %>" size="65" maxlength="60" required="false" readonly="true" />
            </td>
         </tr>
         <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">  
            <td nowrap width="15%" align="right">Código Postal :</td>
            <td nowrap width="35%" align="left"> 
              <eibsinput:text name="ESD0094Record" property="E01CUKI07" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CHAR %>" size="10" maxlength="6" required="false" readonly="true" /> 
            </td>
            <td nowrap width="15%" align="right">Divipola : </td>
            <td nowrap width="35%" align="left">
            	<eibsinput:text name="ESD0094Record" property="E01CUKI08" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CHAR %>" size="65" maxlength="60" required="false" readonly="true" />
            </td>
         </tr>
         <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">  
            <td nowrap width="15%" align="right">Estado Dirección : </td>
            <td nowrap width="35%" align="left"> 
              <eibsinput:text name="ESD0094Record" property="E01CUKC01" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CHAR %>" size="3" maxlength="2" required="false" readonly="true" /> 
            </td>
            <td nowrap width="15%" align="right">Fuerza Comercial : </td>
            <td nowrap width="35%" align="left">
            	<eibsinput:text name="ESD0094Record" property="E01CUKC02" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CHAR %>" size="5" maxlength="4" required="false" readonly="true" />
            </td>
         </tr>
         <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">  
            <td nowrap width="15%" align="right">Oficina Frente : </td>
            <td nowrap width="35%" align="left"> 
              <eibsinput:text name="ESD0094Record" property="E01CUKC03" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CHAR %>" size="5" maxlength="4" required="false" readonly="true" /> 
            </td>
            <td nowrap width="15%" align="right">Zona : </td>
            <td nowrap width="35%" align="left">
            	<eibsinput:text name="ESD0094Record" property="E01CUKC04" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CHAR %>" size="5" maxlength="4" required="false" readonly="true" />
            </td>
         </tr>
         <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">  
            <td nowrap width="15%" align="right">Zona Frente : </td>
            <td nowrap width="35%" align="left"> 
              <eibsinput:text name="ESD0094Record" property="E01CUKC05" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CHAR %>" size="5" maxlength="4" required="false" readonly="true" /> 
            </td>
            <td nowrap width="15%" align="right">Sub Zona : </td>
            <td nowrap width="35%" align="left">
            	<eibsinput:text name="ESD0094Record" property="E01CUKC06" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CHAR %>" size="5" maxlength="4" required="false" readonly="true" />
            </td>
         </tr>
         <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">  
            <td nowrap width="15%" align="right">Oficina : </td>
            <td nowrap width="35%" align="left"> 
              <eibsinput:text name="ESD0094Record" property="E01CUKC07" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CHAR %>" size="5" maxlength="4" required="false" readonly="true" /> 
            </td>
            <td nowrap width="15%" align="right">Nombre Estado Dirección : </td>
            <td nowrap width="35%" align="left">
            	<eibsinput:text name="ESD0094Record" property="E01CUKI09" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CHAR %>" size="65" maxlength="60" required="false" readonly="true" />
            </td>
         </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            	<td nowrap width="15%" align="right">Fecha de Actualización : </td>
            	<td nowrap width="35%" align="left">
            		<eibsinput:date name="ESD0094Record" fn_year="E01CUKLMY" fn_month="E01CUKLMM" fn_day="E01CUKLMD" required="false" readonly="true"/> 
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
  </form>
</body>

<SCRIPT>
	
</SCRIPT>
</html>
