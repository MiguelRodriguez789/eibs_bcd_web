<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput"%>
<%@page import="com.datapro.eibs.constants.HelpTypes"%>
<%@page import="com.datapro.constants.EibsFields"%>
<%@ page import = "datapro.eibs.master.Util" %>
<html>
<head>
<title> Credilinea Basic Information for Status</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id="RecData" class="datapro.eibs.beans.EPV015306Message"  scope="session" />
<jsp:useBean id="error" class="datapro.eibs.beans.ELEERRMessage" scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session" />
<jsp:useBean id="currUser" class="datapro.eibs.beans.ESS0030DSMessage" scope="session" />

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </script>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </script>

<script type="text/javascript">
 function goAction(op) {
	getElement("SCREEN").value = op;
	document.forms[0].submit();
 }
 
</script>
</head>
          
<body >
<%
	if (!error.getERRNUM().equals("0")) {
		error.setERRNUM("0");
		out.println("<SCRIPT Language=\"Javascript\">");
		out.println("       showErrors()");
		out.println("</SCRIPT>");
	}
%>

<%	
	boolean readOnly=false;
	if (request.getParameter("readOnly") != null ){
		if (request.getParameter("readOnly").toLowerCase().equals("true")){
			readOnly=true;
		} else {
			readOnly=false;
		}
	}	
 %>


<h3 align="center"> Cambio Status- L&iacute;nea Cr&eacute;dito:  <%=RecData.getE06DSCPRO()%>
 <img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="cuplus_cambio_status_info.jsp, EPV0153"></h3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.salesplatform.JSEPV0153DADC" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="250">

  <%int row = 0; %>
 <table class="tableinfo" >
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
          <tr id="trdark">
            <td nowrap width="15%" > 
              <div align="right"><b>Cliente :</b></div>
            </td>
            <td nowrap width="10%" > 
              <div align="left">
              	<eibsinput:text property="E06DEACUN" name="RecData" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_CUSTOMER %>" readonly="true"/>
			  </div>
            </td>
            <td nowrap width="10%" > 
              <div align="right"><b>Nombre :</b> </div>
            </td>
            <td nowrap width="35%"> 
              <div align="left">
              	<eibsinput:text property="E06CUSNA1" name="RecData" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_NAME %>" readonly="true"/>
              </div>
            </td>
            <td nowrap width="10%"> 
              <div align="right"><b>Tipo : </b></div>
            </td>
            <td nowrap width="20%"> 
              <div align="left">
              	<eibsinput:text property="E06DEATYP" name="RecData" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_PRODUCT %>" readonly="true"/>
              </div>
            </td>
          </tr>
          <tr id="trdark">
            <td nowrap width="15%"> 
              <div align="right"><b>Cuenta :</b></div>
            </td>
            <td nowrap width="10%"> 
              <div align="left"> 
              	<eibsinput:text property="E06DEAACC" name="RecData" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_ACCOUNT%>" readonly="true"/>
              </div>
            </td>
            <td nowrap width="10%"> 
              <div align="right"><b>Moneda : </b></div>
            </td>
            <td nowrap width="35%"> 
              <div align="left">
              	<eibsinput:text property="E06DEACCY" name="RecData" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_CURRENCY %>" readonly="true"/>
              </div>
            </td>
            <td nowrap width="10%"> 
              <div align="right"><b>Producto : </b></div>
            </td>
            <td nowrap width="20%"> 
              <div align="left">
              	<eibsinput:text property="E06DEAPRO" name="RecData" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_PRODUCT %>" readonly="true"/>
              </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
 </table>
  
  <h4>Datos B&aacute;sicos de la Operaci&oacute;n </h4>
  <table class="tableinfo" >
    <tr > 
	<%row++;%>    
      <td nowrap> 
        <table cellpadding=2 cellspacing=0 width="100%" border="0">
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="40%"> 
              <div align="right">Monto de la L&iacute;nea :</div>
            </td>
              <td nowrap width="60%"> 
             	<eibsinput:text property="E06CPAMNT" name="RecData" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_AMOUNT%>" readonly="true" />
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="40%"> 
              <div align="right">Monto Utilizado :</div>
            </td>
              <td nowrap width="60%"> 
             	<eibsinput:text property="E06CPUSED" name="RecData" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_AMOUNT%>" readonly="true" />
            </td>
		  </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="40%"> 
              <div align="right">Monto Retenido :</div>
            </td>
              <td nowrap width="60%"> 
             	<eibsinput:text property="E06CPDIFE" name="RecData" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_AMOUNT%>" readonly="true" />
            </td>
		  </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="40%"> 
              <div align="right">Monto Disponible :</div>
            </td>
              <td nowrap width="60%"> 
             	<eibsinput:text property="E06CPBALN" name="RecData" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_AMOUNT%>" readonly="true" />
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="40%"> 
              <div align="right">Saldo Inter&eacute;s :</div>
            </td>
              <td nowrap width="60%"> 
             	<eibsinput:text property="E06BALINT" name="RecData" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_AMOUNT%>" readonly="true" />
            </td>
		  </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="40%"> 
              <div align="right">D&iacute;as de Mora :</div>
            </td>
              <td nowrap width="60%"> 
                 <eibsinput:text name="RecData" property="E06DIAMOR" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DAYS%>" readonly="true"/>
            </td>		  
		  </tr>		  
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="40%"> 
              <div align="right">Status Actual :</div>
            </td>
              <td nowrap width="60%">
              <select name="E06OLDSTS" id="E06OLDSTS" disabled>
	              <OPTION value=" " <% if (!(RecData.getE06OLDSTS().equals("1") ||RecData.getE06OLDSTS().equals("2")||
	              			RecData.getE06OLDSTS().equals("3")||RecData.getE06OLDSTS().equals("4")||RecData.getE06OLDSTS().equals("5") ||RecData.getE06OLDSTS().equals("6")||RecData.getE06OLDSTS().equals("7"))) out.print("selected");;%>>Pendiente</OPTION>
	              <OPTION value="1" <% if(RecData.getE06OLDSTS().equals("1")) out.print("selected");%>>Activo</OPTION>
	              <OPTION value="2" <% if(RecData.getE06OLDSTS().equals("2")) out.print("selected");%>>Inactivo</OPTION>
	              <OPTION value="3" <% if(RecData.getE06OLDSTS().equals("3")) out.print("selected");%>>Bloqueado</OPTION>
	              <OPTION value="4" <% if(RecData.getE06OLDSTS().equals("4")) out.print("selected");%>>Bloqueo DEF</OPTION>
	              <OPTION value="5" <% if(RecData.getE06OLDSTS().equals("5")) out.print("selected");%>>Cancelado</OPTION>
	              <OPTION value="6" <% if(RecData.getE06OLDSTS().equals("6")) out.print("selected");%>>Cerrado</OPTION>
	              <OPTION value="7" <% if(RecData.getE06NEWSTS().equals("7")) out.print("selected");%>>Bloqueo Manual</OPTION>
              </select>
            </td>		  
		  </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="40%"> 
              <div align="right">Nuevo Status :</div>
            </td>
              <td nowrap width="60%"> 
              <%if(readOnly){%>
              <select name="E06NEWSTS" id="E06NEWSTS" disabled>
	              <OPTION value=" " <% if (!(RecData.getE06NEWSTS().equals("1") ||RecData.getE06NEWSTS().equals("2")||RecData.getE06NEWSTS().equals("3")||
	              			RecData.getE06NEWSTS().equals("4")||RecData.getE06NEWSTS().equals("5") ||RecData.getE06NEWSTS().equals("6")||RecData.getE06NEWSTS().equals("7"))) out.print("selected");;%>>Pendiente</OPTION>
	              <OPTION value="1" <% if(RecData.getE06NEWSTS().equals("1")) out.print("selected");%>>Activo</OPTION>
	              <OPTION value="2" <% if(RecData.getE06NEWSTS().equals("2")) out.print("selected");%>>Inactivo</OPTION>
	              <OPTION value="3" <% if(RecData.getE06NEWSTS().equals("3")) out.print("selected");%>>Bloqueado</OPTION>
	              <OPTION value="4" <% if(RecData.getE06NEWSTS().equals("4")) out.print("selected");%>>Bloqueo DEF</OPTION>
	              <OPTION value="5" <% if(RecData.getE06NEWSTS().equals("5")) out.print("selected");%>>Cancelado</OPTION>
	              <OPTION value="6" <% if(RecData.getE06NEWSTS().equals("6")) out.print("selected");%>>Cerrado</OPTION>
	              <OPTION value="7" <% if(RecData.getE06NEWSTS().equals("7")) out.print("selected");%>>Bloqueo Manual</OPTION>
              </select>              
              <%}else{%>
              <select name="E06NEWSTS" id="E06NEWSTS" >
	              <OPTION value="1" <% if(RecData.getE06NEWSTS().equals("1")) out.print("selected");%>>Activo</OPTION>
	              <OPTION value="2" <% if(RecData.getE06NEWSTS().equals("2")) out.print("selected");%>>Inactivo</OPTION>
	              <OPTION value="3" <% if(RecData.getE06NEWSTS().equals("3")) out.print("selected");%>>Bloqueado</OPTION>
	              <OPTION value="4" <% if(RecData.getE06NEWSTS().equals("4")) out.print("selected");%>>Bloqueo DEF</OPTION>
	              <OPTION value="5" <% if(RecData.getE06NEWSTS().equals("5")) out.print("selected");%>>Cancelado</OPTION>
	              <OPTION value="6" <% if(RecData.getE06NEWSTS().equals("6")) out.print("selected");%>>Cerrado</OPTION>
	              <OPTION value="7" <% if(RecData.getE06NEWSTS().equals("7")) out.print("selected");%>>Bloqueo Manual</OPTION>
              </select>
              <%}%>              
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="40%"> 
              <div align="right">Motivo :</div>
            </td>
              <td nowrap width="60%"> 
              	<eibsinput:cnofc flag="CJ" name="RecData" property="E06CODMTV" fn_code= "E06CODMTV" readonly="<%=readOnly%>"  />
            </td>		  
          </tr>          
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
              <td nowrap width="40%" align="right">Comentarios :</td>
              <td nowrap width="60%" align="left">
              	<%if(readOnly){%>
              		<textarea name="E06REMARK" cols="64" rows="4" readonly><%=RecData.getE06REMARK()%></textarea>
              	<%}else{%>
              		<textarea name="E06REMARK" cols="64" rows="4"><%=RecData.getE06REMARK()%></textarea>
              	<%}%>
              </td>
			</tr>          
        </table>
      </td>
    </tr>
 </table>
	<p></p>	

	<%if(!userPO.getHeader1().equals("APPROVAL")){%>
      <div align="center" style="width:95%"> 
       <input id="EIBSBTN" type=submit name="Submit" value="Enviar">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
       <input id="EIBSBTN" type=button name="Cancel" value="Cancelar" onclick="javascript:goAction(150);">
	  </div>  
	<%}%> 

</form>
<script type="text/javascript">
	function removeOptionsVal(selectElemnt, valueRemoved){
		var options = selectElemnt.getElementsByTagName('OPTION');
		
		for(var i=0; i< options.length; i++) {
	        if(options[i].value == valueRemoved ) {
	        	selectElemnt.removeChild(options[i]);
	            i--; // options have now less element, then decrease i
	        }
	    }
	}


addEventHandler(document, 'DOMContentLoaded', function() {
	var oldStatus = getElement("E06OLDSTS").value;
	var newStatusElement = getElement("E06NEWSTS");
	
   	removeOptionsVal(newStatusElement , oldStatus);
	
});

</script>


</body>
</HTML>




