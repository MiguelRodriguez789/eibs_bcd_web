<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@ page import = "datapro.eibs.master.Util" %>
<%@ page import="com.datapro.constants.EibsFields"%>
<%@ page import="java.io.*,java.net.*,datapro.eibs.beans.*,datapro.eibs.master.*,java.math.*"%>

<html>
<head>
<title>Parametros IPC</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Studio">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/jquery/plugins/contextMenu/css/jquery.contextMenu.css" rel="stylesheet" type="text/css" />

<jsp:useBean id="IPC" class="datapro.eibs.beans.EDL099802Message" scope="session" /> 
<jsp:useBean id="error" class="datapro.eibs.beans.ELEERRMessage" scope="session" />
<jsp:useBean id="currUser" class="datapro.eibs.beans.ESS0030DSMessage" scope="session" />
<jsp:useBean id="userPO" class="datapro.eibs.beans.UserPos" scope="session" />


<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>
</head>

<body>


<SCRIPT type="text/javascript">

<%
 	boolean isApprovalInquiry = userPO.getPurpose().equals("APPROVAL");
 	boolean isInquiry = userPO.getPurpose().equals("INQUIRY");
 	boolean isReadOnly = isApprovalInquiry || isInquiry;
 	boolean isReadOnlyMnt = false;
 	String read = "";
	String readMnt = "";
 	String disabled = "";
 	String disabledMnt = "";
 	String mandatory = "<img src=\"" + request.getContextPath() + "/images/Check.gif\" alt=\"campo obligatorio\" align=\"bottom\" border=\"0\" >";
 	
	if (!(userPO.getPurpose().equals("NEW") || userPO.getPurpose().equals("MAINTENANCE"))) 
		{ read = " readonly ";
		  disabled = " disabled";
		}
		
	if (!(userPO.getPurpose().equals("NEW"))) 
		{ readMnt = " readonly ";
		  disabledMnt = " disabled";
		  isReadOnlyMnt = true;
		}
		
%>


 
function goAction(op) {
	document.forms[0].SCREEN.value = op;
	if (op == 8) {
		if (!confirm("Desea borrar este registro?")) {
			return;
		}
	}
	submitForm();
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

<H3 align="center">Parametros IPC<img
	src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="IPC_year.jsp, EDL0998"></H3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDL0998" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="5">
  <INPUT TYPE=HIDDEN NAME="E02INDVDD" VALUE="<%= IPC.getE02INDVDD().trim()%>">


<table  class="tableinfo">
   <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
         <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
            <tr id="trdark"> 
               <td nowrap width="10%" > 
                  <div align="right"><b>Año :</b></div>
               </td>
               <td nowrap width="30%"> 
                  <div align="left">
                     <input type="text" name="E02INDVDY" size="4" maxlength="4" readonly value="<%= IPC.getE02INDVDY().trim()%>">
                  </div>
               </td>
               <td nowrap width="10%"> 
                  <div align="left">
                  </div>
               </td>
               <td nowrap width="10%"> 
                  <div align="left">
                  </div>
               </td>
               <td nowrap width="10%" > 
                </td>
               <td nowrap width="30%"> 
               </td>
            </tr>

         </table>
      </td>
   </tr>
</table>

  <table  class="tableinfo" width="100%">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
		<tr id="trclear"> 
            <td nowrap width="10%" align="right">Mes :</td>
            <td nowrap width="40%" align="left">
            	<eibsinput:text name="IPC" property="E02INDVDM" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_RATE %>" required="false" readonly="<%=isReadOnly %>"/> 
 			</td>
			
            <td nowrap width="10%" align="right">Valor IPC : </td>
			<td nowrap width="40%" align="left">
				<eibsinput:text name="IPC" property="E02INDPRC" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_RATE %>" required="false" readonly="<%=isReadOnly %>"/>
 			</td>
		</tr>	
       </table>
      </td>
    </tr>
  </table>

   <br> 

    <table width="100%">		
  	<tr>
  	<% if (userPO.getPurpose().equals("NEW") || userPO.getPurpose().equals("MAINTENANCE"))  { %>
  		<td width="50%">
  		  <div align="center"> 
     		<input id="EIBSBTN" type=button name="Submit" value="Enviar" onClick="goAction(4);" >
     	  </div>	
  		</td>
  		<td width="50%" align="center"> 
     		<input id="EIBSBTN" type=submit name="Exit" value="Salir"  onClick="goAction(2);">
  		</td>
	<% } %>
  	<% if (userPO.getPurpose().equals("DELETE")) { %>
  		<td width="50%"> 
  		  <div align="center"> 
     		<input id="EIBSBTN" type=button name="Delete" value="Borrar" onClick="goAction(8);" >
     	  </div>	
  		</td>
  		<td width="50%" align="center"> 
     		<input id="EIBSBTN" type=submit name="Exit" value="Salir"  onClick="goAction(2);">
  		</td>
	<% } %>
  	<% if (!userPO.getPurpose().equals("DELETE") && !userPO.getPurpose().equals("NEW") && !userPO.getPurpose().equals("MAINTENANCE")) { %>
 		<td width="100%" align="center"> 
     		<input id="EIBSBTN" type=submit name="Exit" value="Salir"  onClick="goAction(2);"> 
  		</td>
	<% } %>
  	</tr>	

  </table>	

  <h4>Información de Auditoria</h4>  
  <table  class="tableinfo" width="100%">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="trdark"> 
            <td nowrap width="15%" align="right">Usuario Creador : </td>
            <td nowrap align="left" width="35%">
            	<%= IPC.getE02INDCUS()%>
			</td>
            <td nowrap width="15%" align="right">Usuario último Cambio : </td>
            <td nowrap width="35%" align="left">
            	<%= IPC.getE02INDLMU()%>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="15%" align="right">Fecha de Proceso - Creación : </td>
			<td nowrap width="35%" align="left">
                <%= datapro.eibs.master.Util.formatCustomDate(currUser.getE01DTF(),Integer.parseInt(IPC.getE02INDCMM()),Integer.parseInt(IPC.getE02INDCMD()),Integer.parseInt(IPC.getE02INDCMY()))%>
            </td>
            <td nowrap width="15%" align="right">Fecha de Proceso - Cambio : </td>
			<td nowrap width="35%" align="left">
                <%= datapro.eibs.master.Util.formatCustomDate(currUser.getE01DTF(),Integer.parseInt(IPC.getE02INDLMM()),Integer.parseInt(IPC.getE02INDLMD()),Integer.parseInt(IPC.getE02INDLMY()))%>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="15%" align="right">Fecha / Hora - Creación : </td>
			<td nowrap width="35%" align="left">
				<%= IPC.getE02INDCTM()%>
            </td>
            <td nowrap width="15%" align="right">Fecha / Hora - Cambio : </td>
			<td nowrap width="35%" align="left"> 
            	<%= IPC.getE02INDLMT()%>
			</td>
          </tr>
        </table> 
      </td>  
    </tr>
  </table>
  </form>
</body>

<SCRIPT Language="Javascript">

	
</SCRIPT>
<% if (!(userPO.getPurpose().equals("NEW") || userPO.getPurpose().equals("MAINTENANCE"))) {%>
<script src="<%=request.getContextPath()%>/jquery/readOnlyPage.jsp"> </script>
<% } %>
<script src="<%=request.getContextPath()%>/jquery/markChangedFields.jsp?MSGOBJ=IPC"> </script>

</html>
