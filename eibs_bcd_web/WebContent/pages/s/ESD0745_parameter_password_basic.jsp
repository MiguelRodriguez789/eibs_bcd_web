<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>

<%@ page import = "datapro.eibs.master.Util" %>
<%@page import="com.datapro.constants.EibsFields"%>


<%@page import="com.datapro.eibs.constants.HelpTypes"%>



<html>
<%@ page import = "datapro.eibs.master.Util" %>
<head>
<title>Mantenimiento Control de Parámetros de Subsistema eIBS</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V4.0 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id="pp" class="datapro.eibs.beans.ESD074501Message"  scope="session" />
<jsp:useBean id="error" class="datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="userPO" class="datapro.eibs.beans.UserPos" scope="session" />

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script Language="Javascript1.1">
function showType(value) {
	if (value == "PWD") {    
		getElement('DIVINFOSBS').style.display='none' ;
		getElement('DIVINFOPWD').style.display='block' ;
		getElement('DIVPASSWORD').style.display='block' ;
		getElement('DIVPORTS').style.display='none' ;
		showPassword(document.forms[0].E01EPRFG3.value);
	} else {
		getElement('DIVINFOSBS').style.display='block' ;
		getElement('DIVINFOPWD').style.display='none' ;
		getElement('DIVPASSWORD').style.display='none' ;
		getElement('DIVPORTS').style.display='block' ;
	}
}

function showPassword(value){
	if(value == "2"){
		getElement('DIVPASSWORD').style.display='none';
	} else {
		getElement('DIVPASSWORD').style.display='block';
	} 
}
</script>
</head>

<body bgcolor="#FFFFFF">

 <% 
 if ( !error.getERRNUM().equals("0")  ) {
     error.setERRNUM("0") ;
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
 }
%>

<h3 align="center">
<% 
if (userPO.getType().equals("PWD")) out.print("Mantenimiento Parámetros de Acceso"); else out.print("Mantenimiento Parámetros de Subsistema eIBS");
%>
<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="parameter_password_basic, ESD0745" ></h3>
<hr size="4">
 <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/servlet/datapro.eibs.security.JSESD0745" >
  <p>
    <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="3">
    <INPUT TYPE=HIDDEN NAME="OPT" VALUE="<%= userPO.getPurpose()%>">
    <INPUT TYPE=HIDDEN NAME="TYP" VALUE="<%= userPO.getType()%>">
  </p>
  <table  class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
			
          <tr id="trdark"> 
            <td nowrap> 
              <div align="right">Banco :</div>
            </td>
            <td nowrap> 
              <input type="text" name="E01EPRBNK" size="3" maxlength="2" value="<%= pp.getE01EPRBNK().trim()%>" <% if (!userPO.getPurpose().equals("N")) out.print("readonly");%>>
             </td>  
          </tr>
          <tr id="trdark"> 
            <td nowrap> 
              <div align="right">Descripción :</div>
            </td>
            <td nowrap> 
                <eibsinput:text name="pp" property="E01EPRDSC" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" />
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>

<div id="DIVINFOSBS" style="position:relative; display:block">   
  <h4>Información Básica</h4>
  <table  class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="trdark"> 
            <td nowrap> 
              <div align="right">Generacion del archivo Trace :</div>
            </td>
            <td nowrap> 
              <input type="radio" name="E01EPRTRC" value="Y" <%if (pp.getE01EPRTRC().equals("Y")) out.print("checked"); %>>Sí
              <input type="radio" name="E01EPRTRC" value="N" <%if (!pp.getE01EPRTRC().equals("Y")) out.print("checked"); %>>No
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap align="right">Directorio Base en IFS : </td>
            <td nowrap>
         		 <select name="E01EPRFG2">
						<option value="" <%if (!pp.getE01EPRFG2().equals("1")) { out.print("selected");}%>>QIBM</option>
						<option value="1" <%if (pp.getE01EPRFG2().equals("1")) { out.print("selected");}%>>EIBS</option>
				</select>
			</td>
          </tr>	
        </table>
      </td>
    </tr>
  </table>
</div>

<div id="DIVINFOPWD" style="position:relative; display:block">   
  <h4>Información Básica</h4>
  <table  class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="trdark"> 
            <td nowrap> 
              <div align="right">Tipo de Sign-on :</div>
            </td>
            <td nowrap> 
               <select name="E01EPRFG3" onchange="showPassword(this.value)">
                  <option value="1" <% if (!pp.getE01EPRFG3().equals("2")){out.print("selected");} %>>e-IBS Stand Alone</option>
                  <option value="2" <% if (pp.getE01EPRFG3().equals("2")){out.print("selected");} %>>e-IBS Single Sign-on</option>
                </select>
             </td>  
          </tr>
          <tr id="trclear"> 
            <td nowrap> 
              <div align="right">Tiempo de espera para Cancelacion :</div>
            </td>
            <td nowrap> 
                <eibsinput:text name="pp" property="E01EPRTOU" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_INTEGER %>" size="6" maxlength="5"/>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
</div>

<div id="DIVPASSWORD" style="position:relative; display:block">   
		<h4>Control de Cuenta y Clave </h4>
		<table class="tableinfo">
          <tr id="trdark"> 
            <td nowrap> 
              <div align="right">No. de Días para Accesar e-IBS :</div>
            </td>
            <td nowrap> 
                <eibsinput:text name="pp" property="E01EPREXP" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_INTEGER%>" size="4" maxlength="3"/>
              <b>(0=Indefinido)</b>
             </td>  
          </tr>
          <tr id="trclear"> 
            <td nowrap width="50%"> 
              <div align="right">No. de Caracteres en Contraseña :</div>
            </td>
            <td nowrap> 
                <eibsinput:text name="pp" property="E01EPRPSL" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_INTEGER%>" size="3" maxlength="2"/>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap> 
              <div align="right">No. de Caracteres Repetidos Permitidos :</div>
            </td>
            <td nowrap> 
                <eibsinput:text name="pp" property="E01EPRRPC" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_INTEGER%>" size="3" maxlength="2"/>
	              <b>(0=No Repeticiones Permitidas)</b>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap> 
              <div align="right">No. de Letras Permitidas :</div>
            </td>
            <td nowrap> 
                <eibsinput:text name="pp" property="E01EPRLET" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_INTEGER%>" size="3" maxlength="2"/>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap> 
              <div align="right">No. de Accesos Fallidos Permitidos :</div>
            </td>
            <td nowrap> 
                <eibsinput:text name="pp" property="E01EPRETM" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_INTEGER%>" size="3" maxlength="2"/>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap> 
              <div align="right">No. de Días Inactivo para Cambio de Estado :</div>
            </td>
            <td nowrap> 
                <eibsinput:text name="pp" property="E01EPRDPI" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_INTEGER%>" size="4" maxlength="3"/>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap> 
              <div align="right">No. de Días para Expiración de Contraseña :</div>
            </td>
            <td nowrap> 
                <eibsinput:text name="pp" property="E01EPRCHG" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_INTEGER%>" size="4" maxlength="3"/>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap> 
              <div align="right">Historico de claves no Permitidas :</div>
            </td>
            <td nowrap> 
                <eibsinput:text name="pp" property="E01EPRFG1" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_INTEGER%>" size="2" maxlength="1"/>
            </td>
          </tr>
        </table>
</div>
	
<div id="DIVPORTS" style="position:relative; display:block">   
  <h4>Informacion sobre puertos para el e-IBS y d-IBS </h4>
  <table  class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="trdark"> 
            <td nowrap width="50%"> 
              <div align="right">Puerto Inicial para Socket Asignado para Plataforma e-IBS :</div>
            </td>
            <td nowrap> 
                <eibsinput:text name="pp" property="E01EPRSK1" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_INTEGER%>" size="6" maxlength="5"/>
             </td>  
          </tr>
          <tr id="trclear"> 
            <td nowrap> 
              <div align="right">Puerto Inicial para el Socket Asignado a Internet Personas :</div>
            </td>
            <td nowrap> 
                <eibsinput:text name="pp" property="E01EPRSK2" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_INTEGER%>" size="6" maxlength="5"/>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap> 
              <div align="right">Puerto Inicial para Socket Asignado a Internet Corporativo :</div>
            </td>
            <td nowrap> 
                <eibsinput:text name="pp" property="E01EPRSK3" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_INTEGER%>" size="6" maxlength="5"/>
            </td>
          </tr>
         </table>
      </td>
    </tr>
  </table>
</div>
 
  <br>
   <p align="center">
    <input id="EIBSBTN" type=submit name="Submit" value="Enviar">
  </p>
</form>

<script Language="Javascript1.1">
	showType("<%= userPO.getType()%>");
</script>
	
</body>
</html>

