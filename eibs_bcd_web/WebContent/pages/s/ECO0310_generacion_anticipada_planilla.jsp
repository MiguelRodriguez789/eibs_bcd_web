
<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput"%>
<%@page import="com.datapro.constants.EibsFields"%>
<%@page import="com.datapro.eibs.constants.HelpTypes"%>

<%@page import="com.datapro.constants.Entities"%> 

<!doctype html public "-//w3c//dtd html 4.0 transitional//en">
<html>
<head>
<title>Pago Comisiones</title>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
 
<jsp:useBean id="cnvObj" class="datapro.eibs.beans.ECO031001Message" scope="session" />
<jsp:useBean id="currUser" class="datapro.eibs.beans.ESS0030DSMessage" scope="session" />

<jsp:useBean id="error" class="datapro.eibs.beans.ELEERRMessage" scope="session" />

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </script>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </script>

<script type="text/javascript">

	   function validar(){
	   
	   	return true;
	   }
	   
  	  function cerrarVentana(){  	
    	alert("Actualización Exitosa!!");  	
		window.open('','_parent','');
		window.close(); 
  	}

</script>


</head>

<body>
<% 
 if ( !error.getERRNUM().equals("0")  ) {
     error.setERRNUM("0");
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
 }
%>

<h3 align="center">Reenvio de Planillas<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="generacion_anticipada_planilla.jsp, ECO0310"></h3>
<hr size="4">
<form method="POST" action="<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSECO0310" onsubmit="return validar();">
<input type="hidden" name="SCREEN" value="300">

<br>
<table id="mainTable" class="tableinfo" align="center" >
	<tr>
	<td nowrap valign="top" width="100%">
		<table width="100%">
          <tr id="trclear">
             <td nowrap width="10%" align="right" height="29"> Convenio: 
              </td>
             <td nowrap width="10%" align="left" height="29">
	  			<eibsinput:text name="cnvObj" property="E01COTCDE" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CUSTOMER %>" readonly="true"/>
             </td>
             <td nowrap width="10%" align="right" height="29">Solicitud:  
             </td>
             <td nowrap width="10%" align="left" height="29">
	  			<eibsinput:text name="cnvObj" property="E01COTNUM" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_ACCOUNT %>" readonly="true"/>
             </td>
             <td nowrap width="10%" align="right" height="29"> Descripcion: 
               </td>
             <td nowrap width="50%"align="left" height="29">
	  			<eibsinput:text name="cnvObj" property="E01COTDES" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_NAME %>" readonly="true"/>
             </td>
         </tr>

          <tr id="trclear">
             <td nowrap width="10%" align="right" height="29"> Empleador: 
              </td>
             <td nowrap width="10%" align="left" height="29">
	  			<eibsinput:text name="cnvObj" property="E01EMPCUN" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CUSTOMER %>" readonly="true"/>
             </td>
             <td nowrap width="10%" align="right" height="29">Identificación:  
             </td>
             <td nowrap width="10%" align="left" height="29">
	  			<eibsinput:text name="cnvObj" property="E01EMPIDN" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_IDENTIFICATION %>" readonly="true"/>
             </td>
             <td nowrap width="10%" align="right" height="29"> Nombre: 
               </td>
             <td nowrap width="50%"align="left" height="29">
	  			<eibsinput:text name="cnvObj" property="E01EMPNME" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_NAME %>" readonly="true"/>
             </td>
         </tr>

          <tr id="trclear">
             <td nowrap width="10%" align="right" height="29"> Cliente: 
              </td>
             <td nowrap width="10%" align="left" height="29">
	  			<eibsinput:text name="cnvObj" property="E01CLICUN" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CUSTOMER %>" readonly="true"/>
             </td>
             <td nowrap width="10%" align="right" height="29">Identificación:  
             </td>
             <td nowrap width="10%" align="left" height="29">
	  			<eibsinput:text name="cnvObj" property="E01CLIIDN" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_IDENTIFICATION %>" readonly="true"/>
             </td>
             <td nowrap width="10%" align="right" height="29"> Nombre: 
               </td>
             <td nowrap width="50%"align="left" height="29">
	  			<eibsinput:text name="cnvObj" property="E01CLINME" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_NAME %>" readonly="true"/>
             </td>
         </tr>

		</table>
	</td>
  </tr>
</table>
  
<H4>Informacion de envio</H4>

<table class="tableinfo" align="center" >
  <tr > 
    <td> 
      <table cellspacing=0 cellpadding=2 width="100%" border="0">
      	<tr id="trdark">
            <td width="40%"> 
              <div align="right">Fecha de Inicio :</div>
            </td>
            <td width="60%"> 
    	        <eibsinput:date name="cnvObj" fn_year="E01COTFIY" fn_month="E01COTFIM" fn_day="E01COTFID" readonly="true"/>
            </td>
        </tr>
      	<tr id="trclear">
            <td width="40%"> 
              <div align="right">Fecha Vencimiento :</div>
            </td>
            <td width="60%"> 
    	        <eibsinput:date name="cnvObj" fn_year="E01COTFVY" fn_month="E01COTFVM" fn_day="E01COTFVD" readonly="true"/>
            </td>
        </tr>
      	<tr id="trdark">
            <td width="40%"> 
              <div align="right">Fecha Proxima Emision Planilla :</div>
            </td>
            <td width="60%"> 
    	        <eibsinput:date name="cnvObj" fn_year="E01COTEPY" fn_month="E01COTEPM" fn_day="E01COTEPD" readonly="true"/>
            </td>
        </tr>
      	<tr id="trclear">
            <td width="40%"> 
              <div align="right">Fecha Proxima Cuota :</div>
            </td>
            <td width="60%"> 
    	        <eibsinput:date name="cnvObj" fn_year="E01COTPVY" fn_month="E01COTPVM" fn_day="E01COTPVD" readonly="true"/>
            </td>
        </tr>
      	<tr id="trdark">
            <td width="40%"> 
              <div align="right">Fecha Ultimo Solicitud :</div>
            </td>
            <td width="60%"> 
    	        <eibsinput:date name="cnvObj" fn_year="E01COTEAY" fn_month="E01COTEAM" fn_day="E01COTEAD" readonly="true"/>
            </td>
        </tr>
      	<tr id="trclear">
            <td width="40%"> 
              <div align="right">Numero de Planillas a Emitir :</div>
            </td>
            <td width="60%"> 
	  			<eibsinput:text name="cnvObj" property="E01COTEAP" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_INTEGER %>" size="2" maxlength="1" />
            </td>
        </tr>
     
     </table>
   </td>
   </tr>  
 </table>
 
<table align="center" id="TBHELPN">
	<tr>
	<td>
	<div id="DIVSUBMIT" align="center">
		<input id="EIBSBTN" type="submit" name="Submit" value="Enviar">
	</div>
	</td>
	</tr>
</table>
	
</form>
</body>
</html>
