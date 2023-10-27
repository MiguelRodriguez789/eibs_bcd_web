<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@ page import = "datapro.eibs.master.Util" %>
<%@ page import="com.datapro.constants.EibsFields"%>
<%@ page import="java.io.*,java.net.*,datapro.eibs.beans.*,datapro.eibs.master.*,java.math.*"%>

<html>
<head>
<title>Tarifa/Impuesto NIIF 9</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Studio">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/jquery/plugins/contextMenu/css/jquery.contextMenu.css" rel="stylesheet" type="text/css" />

<jsp:useBean id="EDL1540Record" class="datapro.eibs.beans.EDL154003Message" scope="session" /> 
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
 	
	if (!(userPO.getPurpose().equals("NEW") || userPO.getPurpose().equals("MAINT"))) 
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

<H3 align="center">Impuesto NIIF 9<img
	src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="tariff_maint.jsp, EDL1540"></H3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.misc.JSEDL1540" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="43">
  <INPUT TYPE=HIDDEN NAME="E03VDD" VALUE="<%= EDL1540Record.getE03VDD().trim()%>">
  <INPUT TYPE=HIDDEN NAME="E03CDE" VALUE="NII">
  <INPUT TYPE=HIDDEN NAME="E03EXP" VALUE="P">


<table  class="tableinfo">
   <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
         <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
            <tr id="trdark"> 
               <td nowrap width="10%" > 
                  <div align="right"><b>Banco :</b></div>
               </td>
               <td nowrap width="30%"> 
                  <div align="left">
                     <input type="text" name="E03BNK" size="2" maxlength="3" readonly value="<%= userPO.getBank()%>">
                  </div>
               </td>
               <td nowrap width="10%" > 
                  <div align="right"><b>Año :</b></div>
               </td>
               <td nowrap width="30%"> 
                  <div align="left">
                     <input type="text" name="E03VDY" size="4" maxlength="4" readonly value="<%= userPO.getHeader1()%>">
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
            	<eibsinput:text name="EDL1540Record" property="E03VDM" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_RATE %>" required="false" readonly="<%=isReadOnly %>"/> 
 			</td>
			
            <td nowrap width="10%" align="right">Valor Impuesto : </td>
			<td nowrap width="40%" align="left">
				<eibsinput:text name="EDL1540Record" property="E03PRC" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_RATE %>" required="false" readonly="<%=isReadOnly %>"/>
 			</td>
		</tr>	
       </table>
      </td>
    </tr>
  </table>

   <br> 

    <table width="100%">		
  	<tr>
  		<td width="50%">
  		  <div align="center"> 
     		<input id="EIBSBTN" type="button" name="Submit" value="Enviar" onClick="goAction(43);" >
     	  </div>	
  		</td>
  		<td width="50%" align="center"> 
     		<input id="EIBSBTN" type="button" name="Exit" value="Salir"  onClick="goAction(40);">
  		</td>
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
            	<%= EDL1540Record.getE03CUS()%>
			</td>
            <td nowrap width="15%" align="right">Usuario último Cambio : </td>
            <td nowrap width="35%" align="left">
            	<%= EDL1540Record.getE03LMU()%>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="15%" align="right">Fecha de Proceso - Creación : </td>
			<td nowrap width="35%" align="left">
                <%= datapro.eibs.master.Util.formatCustomDate(currUser.getE01DTF(),Integer.parseInt(EDL1540Record.getE03CMM()),Integer.parseInt(EDL1540Record.getE03CMD()),Integer.parseInt(EDL1540Record.getE03CMY()))%>
            </td>
            <td nowrap width="15%" align="right">Fecha de Proceso - Cambio : </td>
			<td nowrap width="35%" align="left">
                <%= datapro.eibs.master.Util.formatCustomDate(currUser.getE01DTF(),Integer.parseInt(EDL1540Record.getE03LMM()),Integer.parseInt(EDL1540Record.getE03LMD()),Integer.parseInt(EDL1540Record.getE03LMY()))%>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="15%" align="right">Fecha / Hora - Creación : </td>
			<td nowrap width="35%" align="left">
				<%= EDL1540Record.getE03CTM()%>
            </td>
            <td nowrap width="15%" align="right">Fecha / Hora - Cambio : </td>
			<td nowrap width="35%" align="left"> 
            	<%= EDL1540Record.getE03LMT()%>
			</td>
          </tr>
        </table> 
      </td>  
    </tr>
  </table>
  </form>
</body>

</html>
