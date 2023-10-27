<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@page import="com.datapro.eibs.constants.ISOCodes"%>
<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@ page import="com.datapro.constants.EibsFields"%>
<%@ page import = "datapro.eibs.master.Util" %>

<html>
<head>
<title>Cuentas de Ahorro</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Studio">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/jquery/plugins/contextMenu/css/jquery.contextMenu.css" rel="stylesheet" type="text/css" />

<%@ page import = "java.io.*,java.net.*,datapro.eibs.beans.*,datapro.eibs.master.*,java.math.*" %>

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>
<jsp:useBean id="currUser" class="datapro.eibs.beans.ESS0030DSMessage" scope="session" />

 
 <script src="<%=request.getContextPath()%>/pages/s/javascripts/jquery.jsp"> </script>
 <script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT> 
 <script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>
 
</head>
<body>


<%

boolean isReadOnly = userPO.getPurpose().equals("I") ||userPO.getHeader10().equals("D") ? true:false;

 if ( !error.getERRNUM().equals("0")  ) {
     out.println("<SCRIPT Language=\"Javascript\">");
     error.setERRNUM("0");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
 }

%> 
<H3 align="center"><%if(userPO.getPurpose().equals("M") || userPO.getPurpose().equals("D"))out.print("Mantenimiento "); else out.print("Consulta ");%> de Cuentas Asociadas<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="sav_acc_group_det.jsp, EDD0010"></H3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDD0010" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="4">
  <table  class="tableinfo">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
          <tr id="trclear"> 
            <td nowrap width="16%"> 
              <div align="right"><b>Banco :</b></div>
            </td>
            <td nowrap width="20%"> 
              <div align="left"> 
                <input type="text" name="H01BNK" size="3" maxlength="2" readonly value="<%= userPO.getBank() %>">
              </div>
            </td>
            <td nowrap width="16%"> 
              <div align="right"><b>Moneda : </b></div>
            </td>
            <td nowrap width="16%"> 
              <div align="left"><b> 
                <input type="text" name="H01CCY" size="4" maxlength="3" value="<%= userPO.getCurrency()%>" readonly>
                </b> </div>
            </td>
            <td nowrap width="16%"> 
              <div align="right"><b>Tipo de Cuenta : </b></div>
            </td>
            <td nowrap width="16%"> 
              <div align="left"><b> 
                <input type="text" name="H01TYP" size="5" maxlength="4" readonly value="<%= userPO.getHeader1()%>">
                </b> </div>
            </td>
          </tr>
           <tr id="trdark"> 
            <td nowrap width="16%"> 
              <div align="right"><b>Producto :</b></div>
            </td>
            <td nowrap width="20%"> 
              <div align="left"> 
                <input type="text" name="H01CDE" size="5" maxlength="4" readonly value="<%= userPO.getProdCode() %>">
                <input type="text" name="H01DSC" size="45" maxlength="44" readonly value="<%= userPO.getHeader2() %>">
              </div>
            </td>
            <td nowrap width="16%"> 
              <div align="right"><b>Escala tramos : </b></div>
            </td>
            <td nowrap width="16%"> 
              <div align="left"><b> 
                <input type="text" name="H01TBL" size="5" maxlength="4" value="<%= userPO.getHeader3()%>" readonly>
                </b> </div>
            </td>
            <td nowrap width="16%"> 
           
            </td>
            <td nowrap width="16%"> 
              </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
 
 <h4>Datos Basicos del Grupo </h4>
  	<jsp:include page="EDD0010_sav_acc_group_template.jsp" flush="true" />
  
  <br>
	
  
     <%if  (!isReadOnly) { %>
       <div align="center"> 
           <input class="EIBSBTN" type="button" name="Submit" value="Enviar" onclick="goConfirm('U')">
           <input class="EIBSBTN" type="button" value="Cancelar" onclick="goBack()">
       </div>
     <% }else if (userPO.getHeader10().equals("D")){ %>  
  		  <div align="center"> 
           <input class="EIBSBTN" type="button" value="Borrar" onclick="goConfirm('D')">
           <input class="EIBSBTN" type="button" value="Cancelar" onclick="goBack()">
       	</div>
     <%}else{ %>
     	 <div align="center"> 
           <input class="EIBSBTN" type="button" value="Regresar" onclick="goBack()">
       	</div>
     <%} %>
  </form>
  
  
<script type="text/javascript">
function goBack(){
	document.forms[0].action = "<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDD0010?SCREEN=2";
	document.forms[0].submit();
}

function goConfirm(ope){
    if (ope == 'U'){ 
		if (!confirm("Desea Registrar este mantenimiento?")) 
			return;
	}else{
		if (!confirm("Desea Eliminar ese grupo?")) 
			return;
	}
	document.forms[0].submit();
}

</script>    

  
  
</body>
</html>
