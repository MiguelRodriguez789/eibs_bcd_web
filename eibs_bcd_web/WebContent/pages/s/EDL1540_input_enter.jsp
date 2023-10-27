<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<%@page import="com.datapro.eibs.constants.ISOCodes"%>
<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@page import="com.datapro.constants.EibsFields"%>
<%@ page import = "datapro.eibs.master.*" %>
<html>
<head>
<title>Generar Archivo de Lote Contable NIIF 9 - Provision</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<SCRIPT Language="javascript">

function CheckACC(){
	if(document.forms[0].E04PDY.value < 1 || document.forms[0].E04PDM.value < 1){
		alert("Por favor ingrese el Periodo");
		document.forms[0].E04PDY.value='';
		document.forms[0].E04PDY.focus();
	} else {
	 	document.forms[0].submit();
	}
}

</SCRIPT>
</head>



<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />
<jsp:useBean id= "EDL1540Record" class= "datapro.eibs.beans.EDL154004Message"  scope="session" />


<body bgcolor="#FFFFFF">


<% 
 if ( !error.getERRNUM().equals("0")  ) {
     error.setERRNUM("0");
	 out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
 }
%>

<h3 align="center">Generar Archivo de Lote Contable NIIF 9 - Provision
<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="input_enter.jsp , EDL1540"> 
</h3><hr size="4">

<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.misc.JSEDL1540" >
  <p> 
<INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="50">


  </p>



  <table class="tbenter" cellspacing=0 cellpadding=2 width="100%" border="0" bordercolor="#000000">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table class="tbenter" cellspacing=0 cellpadding=2 width="100%" border="0">
          <tr><td>&nbsp;</td></tr>
		   <tr><td>&nbsp;</td></tr>
		    <tr><td>&nbsp;</td></tr>
			 <tr><td>&nbsp;</td></tr>
		  <tr> 
            <td nowrap width="50%"> 
              <div align="right"><b>Banco :</b></div>
            </td>
            <td nowrap width="50%"> 
                <eibsinput:text property="E04BNK" name="EDL1540Record" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_BANK %>" value="<%=currUser.getE01UBK() %>" readonly="true"/>
            </td>
          </tr>
		  <tr>
     		<td nowrap width="50%">
				<div align="right"><b>Periodo Año/Mes:</b></div>
			</td>
			<td nowrap width="50%">
            	<eibsinput:text property="E04PDY" name="EDL1540Record" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_YEAR %>"/>/<eibsinput:text property="E04PDM" name="EDL1540Record" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_MONTH %>"/>
			</td>
		  </tr>
		  <tr>
     		<td nowrap width="50%">
				<div align="right"><b>Fecha de Proceso:</b></div>
			</td>
			<td nowrap width="50%">
            	<eibsinput:date name="EDL1540Record" fn_year="E04FDY" fn_month="E04FDM" fn_day="E04FDD"/>
			</td>
		  </tr>

    <tr>
      <td nowrap align="center">  
      </td>
    </tr>




        </table>
      </td>
    </tr>
  </table>

    	  <div align="center"> 
   		   <input id="EIBSBTN" type=button name="Submit" OnClick="CheckACC()" value="Enviar">
    	  </div>




<script language="JavaScript">
  document.forms[0].YEAR.focus();
  document.forms[0].YEAR.select();
</script>

</form>
</body>
</html>
