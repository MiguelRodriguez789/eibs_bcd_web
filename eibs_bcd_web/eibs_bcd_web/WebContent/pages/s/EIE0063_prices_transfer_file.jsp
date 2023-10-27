<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<%@ page import = "datapro.eibs.master.Util" %>

<HTML><HEAD>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css"> 
<TITLE>Interfaz para carga de precios</TITLE>
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<script language="Javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<SCRIPT Language="javascript">

function CheckFile(){
if ( document.forms[0].FILENAME.value.length < 1) {
  alert("Ruta Inválida o Falta Nombre de Archivo");
  document.forms[0].FILENAME.value='';
  document.forms[0].FILENAME.focus();
}
else {	
  	document.forms[0].SCREEN.value = '200';	
	document.forms[0].submit();
  }
}

 function FillZeros(idField,idNum){

	  var strID = "";
	    while ((idNum.value.length < 6))
	      idNum.value='0'+idNum.value;
	  strID = trim(idNum.value);
      idField.value=strID.toUpperCase();
}

</SCRIPT>
<jsp:useBean id="invInst" class="datapro.eibs.beans.EIE006301Message"  scope="session" />
<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />
<jsp:useBean id="error" class="datapro.eibs.beans.ELEERRMessage"  scope="session" />

</HEAD>

<body>

 <h3 align="center">Interfaz para carga de precios<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" alt="prices_transfer_file.jsp, EIE0063"></h3>
<hr size="4">
 <FORM METHOD="POST" action="<%=request.getContextPath()%>/servlet/datapro.eibs.invest.JSEIE0063" ENCTYPE="multipart/form-data">	
    <p>
    	<INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="200">
    </p>
   
  <h4>Información Básica
  </h4>
  <table  class="tableinfo" width="715">
    <tr > 
    <td nowrap> 
        <table cellpadding=2 cellspacing=0 width="100%" border="0">
          <tr id="trdark"> 
            <td nowrap width="17%" > 
              <div align="right">Fecha :</div>
            </td>
            <td nowrap width="36%" > 
              <input type="text"  name="E01QUOTEM" size="3" maxlength="2" value="<%= invInst.getE01QUOTEM()%>" onkeypress="enterInteger()">
              <input type="text"  name="E01QUOTED" size="3" maxlength="2" value="<%= invInst.getE01QUOTED()%>" onkeypress="enterInteger()">
              <input type="text"  name="E01QUOTEY" size="3" maxlength="2" value="<%= invInst.getE01QUOTEY()%>" onkeypress="enterInteger()">
              <a href="javascript:DatePicker(document.forms[0].E01QUOTE1,document.forms[0].E01QUOTE2,document.forms[0].E01QUOTE3)">
              <img src="<%=request.getContextPath()%>/images/calendar.gif" alt="help" align="middle" border="0"></a> 
              <img src="<%=request.getContextPath()%>/images/Check.gif" alt="mandatory field" align="bottom" border="0"  > 
            </td>
            <td nowrap width="14%" > 
              <div align="right">Hora :</div>
            </td>
            <td nowrap width="33%" > 
              <input type="text" name="E01QUOTET" size="15"  maxlength="6" value="<%= invInst.getE01QUOTET()%>" onkeypress="enterInteger()" onchange="FillZeros(document.forms[0].E01QUOTET, document.forms[0].E01QUOTET);" >
              
               <img src="<%=request.getContextPath()%>/images/Check.gif" alt="mandatory field" align="bottom" border="0" > (HHMMSS)
            </td>
          </tr>
        </table>
                <table cellpadding=2 cellspacing=0 width="100%" border="0">
          <tr id="trclear"> 
            <td nowrap width="17%" > 
              <div align="right">Ruta y Nombre de Archivo :</div>
            </td>
            <td nowrap width="36%" > 
              <div align="left">
                 <input type=file name="FILENAME" size="60" maxlength="255" >
              </div>
            </td>
          </tr>      
        </table>
      </td>
    </tr>
  </table>
  
  	<% if (invInst.getH01FLGMAS().equals("Y")) {%>
	  <table width="100%" border="0" cellspacing="0" cellpadding="0" bgcolor="#FFFFFF" bordercolor="#FFFFFF">
	    <tr bgcolor="#FFFFFF"> 
	      <td width="33%"> 
	        <div align="center"> 
	          <input type="checkbox" name="H01FLGWK2" value="Y" >
	          Aceptar con Advertencias </div>
	      </td>
	    </tr>
	  </table>  
	<% } %>
  
  
  
  <p align="center"> 
	<input id="EIBSBTN" type="button" name="Submit" value="Enviar" onClick="CheckFile()"> 
	<% userPO.setPurpose("PROCESS"); %>
  </p> 
	  

<script language="JavaScript">
  document.forms[0].FILENAME.focus();
</script>
<% 
 if ( !error.getERRNUM().equals("0")  ) {
      error.setERRNUM("0");
 %>
     <SCRIPT Language="Javascript">
            showErrors();
     </SCRIPT>
 <%
 }
%>
 </FORM>
</BODY>
</HTML>
