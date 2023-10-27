<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>

<%@ page import = "datapro.eibs.master.Util" %>
<%@page import="com.datapro.constants.EibsFields"%>


<html>
<head>
<title>Tabla de Codigo</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

</head>

<jsp:useBean id="refCodes" class="datapro.eibs.beans.ESD038001Message"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />

<body>

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>

<SCRIPT type="text/javascript">

function cancel() {
	document.forms[0].SCREEN.value = 100;
	document.forms[0].submit();
}
   
</SCRIPT>

<% 
    if ( !error.getERRNUM().equals("0")  ) {
        out.println("<SCRIPT Language=\"Javascript\">");
        error.setERRNUM("0");
        out.println("       showErrors()");
        out.println("</SCRIPT>");
    }
    
    String readonly = "NEW".equals(userPO.getPurpose()) ? "" : "readonly";
    
%>


<H3 align="center">Tabla de C&oacute;digos del Sistema <img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="cnof_table_details.jsp, ESD0380"></H3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.params.JSESD0380" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="600">
  <INPUT TYPE=HIDDEN NAME="E01CNOLAN" VALUE="<%= currUser.getE01LAN() %>">
  <INPUT TYPE=HIDDEN NAME="FromRecord" VALUE="<%= request.getParameter("FromRecord") %>">
  
  <h4>Informaci&oacute;n B&aacute;sica</h4>
  
  <%int row = 0; %>
  <table  class="tableinfo">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="40%"> 
              <div align="right">Codigo de Clasificaci&oacute;n :</div>
            </td>
            <td nowrap> 
              <div align="left"> 
                <input type="text" name="E01CNOTCN" size="3" maxlength="2" value="<%= refCodes.getE01CNOTCN().trim()%>" <%=readonly%>>
              </div>
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="40%" height="23"> 
              <div align="right">Descripci&oacute;n de la Tabla :</div>
            </td>
            <td nowrap height="23"> 
              <div align="left"> 
                <input type="text" name="E01CNODCN" size="50" maxlength="45" value="<%= refCodes.getE01CNODCN().trim()%>" style="text-transform: none">
              </div>
            </td>
          </tr>

          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="40%" height="23"> 
              <div align="right">Longitud Campo Clave :</div>
            </td>
            <td nowrap height="23"> 
              <div align="left"> 
                   <select name="E01CNOFLD" >
                   		<option value="4" <% if (!(refCodes.getE01CNOFLD().equals("1") ||  refCodes.getE01CNOFLD().equals("2")||  refCodes.getE01CNOFLD().equals("3")||  refCodes.getE01CNOFLD().equals("4") ||  refCodes.getE01CNOFLD().equals("5") || refCodes.getE01CNOFLD().equals("6"))) out.print("selected"); %>> </option>
	                    <option value="1" <% if (refCodes.getE01CNOFLD().equals("1")) out.print("selected"); %>>1 Posiciones</option>                   
	                    <option value="2" <% if (refCodes.getE01CNOFLD().equals("2")) out.print("selected"); %>>2 Posiciones</option>
	                    <option value="3" <% if (refCodes.getE01CNOFLD().equals("3")) out.print("selected"); %>>3 Posiciones</option>                   
	                    <option value="4" <% if (refCodes.getE01CNOFLD().equals("4")) out.print("selected"); %>>4 Posiciones</option>                   
	                    <option value="5" <% if (refCodes.getE01CNOFLD().equals("5")) out.print("selected"); %>>5 Posiciones</option>                   
	                    <option value="6" <% if (refCodes.getE01CNOFLD().equals("6")) out.print("selected"); %>>6 Posiciones</option>                    
	               </select>
              </div>
            </td>
          </tr>

          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="40%" height="23"> 
              <div align="right">Pantalla a Utilizar :</div>
            </td>
            <td nowrap height="23"> 
              <div align="left"> 
	               <select name="E01CNOSCR" >
	                    <option value="0" <% if (refCodes.getE01CNOSCR().equals(" ")) out.print("selected"); %>> </option>
	                    <option value="1" <% if (refCodes.getE01CNOSCR().equals("1")) out.print("selected"); %>>Tipo Cuenta</option>
	                    <option value="2" <% if (refCodes.getE01CNOSCR().equals("2")) out.print("selected"); %>>Transacciones</option>                   
	                    <option value="3" <% if (refCodes.getE01CNOSCR().equals("3")) out.print("selected"); %>>Paises</option> 
	                    <option value="4" <% if (refCodes.getE01CNOSCR().equals("4")) out.print("selected"); %>>Generico</option>
	                    <option value="14" <% if (refCodes.getE01CNOSCR().equals("14")) out.print("selected"); %>>Genérico Extendido</option>
	                    <option value="24" <% if (refCodes.getE01CNOSCR().equals("24")) out.print("selected"); %>>Genérico con campos variables</option>   
	                    <option value="5" <% if (refCodes.getE01CNOSCR().equals("5")) out.print("selected"); %>>Tipo Garantias</option>   
	                    <option value="6" <% if (refCodes.getE01CNOSCR().equals("6")) out.print("selected"); %>>Grupos Contables</option>         
	                    <option value="30" <% if (refCodes.getE01CNOSCR().equals("30")) out.print("selected"); %>>Calculo Corporativo</option>      
	                    <option value="40" <% if (refCodes.getE01CNOSCR().equals("40")) out.print("selected"); %>>Usuarios</option>                     
	               </select>
              </div>
            </td>
          </tr>

          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="40%" height="23"> 
              <div align="right">Campo Obligatorio :</div>
            </td>
            <td nowrap height="23"> 
				<input type="radio" name="E01CNODRQ" value="Y" <%if (refCodes.getE01CNODRQ().equals("Y")) out.print("checked"); %>> Si 
				<input type="radio" name="E01CNODRQ" value="N" <%if (refCodes.getE01CNODRQ().equals("N")) out.print("checked"); %>> No
            </td>
          </tr>

        </table>
      </td>
    </tr>
  </table>
  <div align="center">
    <input id="EIBSBTN" type=submit name="Submit" value="Enviar">
    <input id="EIBSBTN" type="button" name="Cancel" value="Cancelar" onclick="cancel()">
  </div>
  </form>
</body>
</html>
