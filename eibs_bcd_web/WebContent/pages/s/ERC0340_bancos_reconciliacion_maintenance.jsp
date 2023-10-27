<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput"%>
<%@page import="com.datapro.constants.EibsFields"%>
<%@page import="com.datapro.eibs.constants.HelpTypes"%>


<%@page import="com.datapro.constants.Entities"%> 
<html>
<head>
<title>Reconciliacion Bancaria</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id="cnvObj" class="datapro.eibs.beans.ERC034001Message"  scope="session" />
<jsp:useBean id="error" class="datapro.eibs.beans.ELEERRMessage" scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session" />
<jsp:useBean id="currUser" class="datapro.eibs.beans.ESS0030DSMessage" scope="session" />

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </script>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBSBillsP.jsp"> </script>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </script>

</head>

<%
	boolean readOnly=false;
	boolean maintenance=false;
%> 
          
<%
	// Determina si es solo lectura
	if (request.getParameter("readOnly") != null ){
		if (request.getParameter("readOnly").toLowerCase().equals("true")){
			readOnly=true;
		} else {
			readOnly=false;
		}
	}
%>
<body>
<%
	if (!error.getERRNUM().equals("0")) {
		error.setERRNUM("0");
		out.println("<SCRIPT Language=\"Javascript\">");
		out.println("       showErrors()");
		out.println("</SCRIPT>");
	}
	if (!userPO.getPurpose().equals("NEW")) {
		maintenance = true;
		out.println("<SCRIPT> initMenu(); </SCRIPT>");
	}
%>

<h3 align="center">
<%if (readOnly){ %>
	CONSULTA BANCO A RECONCILIAR
<%} else if (maintenance){ %>
	MANTENIMIENTO BANCO A RECONCILIAR
<%} else { %>
	NUEVO BANCO A RECONCILIAR
<%} %>

 <img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="bancos_reconciliacion_maintenance.jsp, ERC0340"></h3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSERC0340" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="600">
  <input type=HIDDEN name="E01UBK" value="<%= currUser.getE01UBK().trim()%>">
  
 <% int row = 0;%>
 
    
  <table  class="tableinfo">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">

          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td width="30%" > 
              <div align="right">Codigo :</div>
            </td>
            <td width="70%" > 
	             <eibsinput:text property="E01BRMEID" name="cnvObj" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CNOFC%>" readonly="true"/>
	        </td>
          </tr>

          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td width="30%" > 
              <div align="right">Nombre del Banco :</div>
            </td>
            <td width="70%" > 
                 <eibsinput:text property="E01BRMNME" name="cnvObj" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_NAME%>"  readonly="true"/>
	        </td>
          </tr>

          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td width="30%" > 
              <div align="right">Numero de Cuenta Banco :</div>
            </td>
            <td width="70%" > 
                 <eibsinput:text property="E01BRMCTA" name="cnvObj" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CHAR%>" size="20" maxlength="20" readonly="true"/>
	        </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td width="30%" > 
              <div align="right">Numero de Cuenta en IBS:</div>
            </td>
            <td width="70%" > 
 				<eibsinput:help name="cnvObj" property="E01BRMACC" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_ACCOUNT%>" required="false" fn_param_one="E01BRMACC" fn_param_two="document.forms[0].E01UBK.value" fn_param_three="RT" readonly="<%=readOnly %>"/>
            </td>
          </tr>

          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td width="30%" > 
              <div align="right">Dirección :</div>
            </td>
            <td width="70%" > 
                 <eibsinput:text property="E01BRMAD1" name="cnvObj" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_NAME%>" readonly="<%=readOnly %>"/>
	        </td>
           </tr>

          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td width="30%" > 
              <div align="right"> </div>
            </td>
            <td width="70%" > 
                 <eibsinput:text property="E01BRMAD2" name="cnvObj" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_NAME%>" readonly="<%=readOnly %>"/>
	        </td>
          </tr>
 
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td width="30%" > 
              <div align="right"> </div>
            </td>
            <td width="70%" > 
                 <eibsinput:text property="E01BRMAD3" name="cnvObj" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_NAME%>" readonly="<%=readOnly %>"/>
	        </td>
          </tr>

          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td width="30%" > 
              <div align="right">Nombre del Contacto :</div>
            </td>
            <td width="70%" > 
                 <eibsinput:text property="E01BRMNMC" name="cnvObj" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_NAME%>" readonly="<%=readOnly %>"/>
	        </td>
          </tr>

          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td width="30%" > 
              <div align="right">Telefono Oficina :</div>
            </td>
            <td width="70%" > 
                 <eibsinput:text property="E01BRMPHN" name="cnvObj" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_PHONE%>" readonly="<%=readOnly %>"/>
	        </td>
          </tr>

          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td width="30%" > 
              <div align="right">Anexo :</div>
            </td>
            <td width="70%" > 
                 <eibsinput:text property="E01BRMPXT" name="cnvObj" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_INTEGER%>" size="5" maxlength="4" readonly="<%=readOnly %>"/>
	        </td>
          </tr>

          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td width="30%" > 
              <div align="right">Celular :</div>
            </td>
            <td width="70%" > 
                 <eibsinput:text property="E01BRMPH1" name="cnvObj" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_PHONE%>" readonly="<%=readOnly %>"/>
	        </td>
          </tr>

          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td width="30%" > 
              <div align="right">Numero de Fax :</div>
            </td>
            <td width="70%" > 
                 <eibsinput:text property="E01BRMFAX" name="cnvObj" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_PHONE%>" readonly="<%=readOnly %>"/>
	        </td>
          </tr>

          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td width="30%" > 
              <div align="right">Email :</div>
            </td>
            <td width="70%" > 
                 <eibsinput:text property="E01BRMEMC" name="cnvObj" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_EMAIL%>" readonly="<%=readOnly %>"/>
	        </td>
          </tr>

          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td width="30%" > 
              <div align="right">Nombre Archivo de Cartola :</div>
            </td>
            <td width="70%" > 
                 <eibsinput:text property="E01BRMFNM" name="cnvObj" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CHAR%>" size="10" maxlength="8"  readonly="<%=readOnly %>"/>
	        </td>
          </tr>

        </table>
      </td>
    </tr>
  </table>

<%if  (!readOnly) { %>
    <div align="center"> 
        <input id="EIBSBTN" type=submit name="Submit" value="Enviar">
    </div>
<% } %>  

  </form>
</body>
</HTML>
