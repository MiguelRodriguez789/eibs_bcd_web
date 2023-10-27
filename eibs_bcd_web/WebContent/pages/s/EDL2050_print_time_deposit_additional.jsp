
<%@page import="com.datapro.constants.EibsFields"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.1 Transitional//EN">
<HTML>
<HEAD>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css"> 

<TITLE>Print Time Deposits</TITLE>
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<%@page import="com.datapro.constants.Entities"%>
<%@page import="datapro.eibs.sockets.*, datapro.eibs.beans.* , datapro.eibs.master.*" %>
<%@taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@page import="com.datapro.constants.EibsFields"%>
<%@page import="datapro.eibs.services.ParametersServices"%>
<jsp:useBean id= "msgCD" class= "datapro.eibs.beans.EDL205001Message"  scope="session" />
<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />
<jsp:useBean id="error" class="datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "currClient" class= "datapro.eibs.beans.ESD080001Message"  scope="session" />

<%
	String client = currClient != null ? currClient.getE01CUSCUN() : ""; 
	String txtch = !userPO.getApplicationCode().equals("12")?" Certificado de Dep�sito":" Bono";
	String txacd = !userPO.getApplicationCode().equals("12")?"11":"12";
%>

<SCRIPT LANGUAGE="JavaScript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<SCRIPT Language="JavaScript">

function goBack(){
	document.forms[0].SCREEN.value = "960";
	document.forms[0].submit();
}
</SCRIPT>

</HEAD>
<body>

<% 
 	String mandatory = "<img src=\"" + request.getContextPath() + "/images/Check.gif\" alt=\"campo obligatorio\" align=\"bottom\" border=\"0\" >";
 	int row = 0;
 	boolean isReadOnly = (msgCD.getE01STS().equals("A") || userPO.getHeader10().equals("APPROVAL"))?true:false;
%>
 <%if (!userPO.getHeader10().equals("APPROVAL")){ %>
<h3 align="center">Re-Impresion <%=txtch %> (Papel Valor)</h3>
<%}else{ %>
<h3 align="center">Aprobacion Re-Impresion <%=txtch %> (Papel Valor)</h3>
<%} %>
	<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="print_time_deposit_additional, EDL2050"></h3>

<hr size="4">
 <FORM METHOD="POST" action="<%=request.getContextPath()%>/servlet/datapro.eibs.timedeposits.JSEDL2050">	
    <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="4">
    <INPUT TYPE=HIDDEN NAME="OPE" VALUE="R">
     <INPUT TYPE=HIDDEN NAME="appcode" VALUE="<%=txacd%>">
  
 <%if (!userPO.getHeader10().equals("APPROVAL")){ %>
  <table border="0" cellspacing="0" cellpadding="0" width="100%">
  	<tr>
  		<td align="right" valign="top" width="85%" style="color:red;font-size:12;"><b><%=msgCD.getSWDFIL()%></b></td>
  		<td width="5%"></td>
  	</tr>
  </table>
  <%} %> 
  
  <table id="tbenter" align="center" style="width:85%" border="1">
    <tr> 
      <td> 
        <table id="tbenter" width="100%" border="0" cellspacing="1" cellpadding="0">
          <tr> 
            <td width="20%" align="left"> </td>
            <td width="30%"> </td>
            <td width="50%" align="left"> </td>
          </tr>
          <tr> 
            <td width="20%" align="right"><B> </B></td>
            <td width="30%"> </td>
            <td width="50%" align="left"><B> </B></td>
          </tr>
          <tr class="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
          	<td width="20%" align="center"></td>
            <td nowrap width="30%">
            	<div align="right">N�mero <%=txtch %> a Imprimir : </div>
            </td>
            <td nowrap width="50%">
            	<input type="text" name="R01ACC" size="15" maxlength="12" value="<%= userPO.getAccNum().toString()%>" readonly="readonly">
              	<%if(!isReadOnly) out.print(mandatory);%>
            </td>
          </tr>        
          <tr class="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
          	<td width="20%" align="center"></td>
			<td nowrap width="30%">
				<div align="right">Motivo:  </div>
			</td>
	    	<td nowrap width="50%"> 
				<eibsinput:cnofc name="msgCD" property="R01UC1" flag="MI" fn_code="R01UC1" fn_description= "D01UC1" readonly="<%=isReadOnly%>"/>
				<eibsinput:text name="msgCD" property="D01UC1" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_NAME %>" readonly="true" /> 
				<%if(!isReadOnly) out.print(mandatory);%>
			</td>
	  </tr>
          
        </table>
      </td>
    </tr>
  </table>

<%if (!userPO.getHeader10().equals("APPROVAL")){ %>
  <p align="center">  
     <input id="EIBSBTN" type="submit" name="Process" value="Enviar" >
     <span><input id="EIBSBTN_BACK" class="EIBSBTN" type="button" name="Back" value="Regresar" onclick="goBack()"></span>
     
  </p>
  <%}else{ %>
 	<p align="center">
     				<input id="EIBSBTN" type="Button" name="Process" value="Salir" onClick="JavaScript:window.close()">
  	</p>
 <%} %> 
 
  <%
 if ( !error.getERRNUM().equals("0")  ) {
      error.setERRNUM("0");
 %> <SCRIPT language="Javascript">
            showErrors();
     </SCRIPT> 
 <% } %>
 </FORM>
</BODY>
</HTML>
