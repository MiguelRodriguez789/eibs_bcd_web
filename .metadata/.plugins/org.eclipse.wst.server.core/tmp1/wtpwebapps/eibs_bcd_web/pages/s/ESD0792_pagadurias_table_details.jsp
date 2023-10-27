<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@ page import = "datapro.eibs.master.Util" %>
<%@ page import="com.datapro.constants.EibsFields"%>

<html>
<head>
<title>Tabla de Codigo</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

</head>

<jsp:useBean id= "datarec" class="datapro.eibs.beans.ESD079201Message"  scope="session" />
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

function cerrarVentana(){
	window.open('','_parent','');
	window.close(); 
}

   
</SCRIPT>

<% 
    if ( !error.getERRNUM().equals("0")  ) {
        out.println("<SCRIPT Language=\"Javascript\">");
        error.setERRNUM("0");
        out.println("       showErrors()");
        out.println("</SCRIPT>");
    }
    
%>

<H3 align="center">Tabla de C&oacute;digos de Pagadurias<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="pagadurias_table_details.jsp, ESD0360"></H3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSESD0792" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="600">
  
  <h4>Informaci&oacute;n B&aacute;sica</h4>
  
  <%int row = 0; %>
  <table  class="tableinfo">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="40%"> 
              <div align="right">Codigo de Covenio :</div>
            </td>
            <td nowrap> 
              <div align="left"> 
                <input type="text" name="E01COPCDE" size="3" maxlength="2" value="<%= datarec.getE01COPCDE()%>" readonly>
              </div>
            </td>
          </tr>
          
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="40%"> 
              <div align="right">No. Secuencia :</div>
            </td>
            <td nowrap> 
              <div align="left"> 
                <input type="text" name="E01COPSEQ" size="3" maxlength="2" value="<%= datarec.getE01COPSEQ()%>" readonly>
              </div>
            </td>
          </tr>
                    
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="40%" height="23"> 
              <div align="right">Descripci&oacute;n :</div>
            </td>
            <td nowrap height="23"> 
              <div align="left"> 
                <input type="text" name="E01COPDES" size="50" maxlength="45" value="<%= datarec.getE01COPDES()%>" >
              </div>
            </td>
          </tr>

          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="40%" height="23"> 
              <div align="right">Contacto Operativo :</div>
            </td>
            <td nowrap height="23"> 
              <div align="left"> 
                <input type="text" name="E01COPCOP" size="50" maxlength="45" value="<%= datarec.getE01COPCOP()%>" >
              </div>
            </td>
          </tr>
          
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="40%" height="23"> 
              <div align="right">Contacto Comercial :</div>
            </td>
            <td nowrap height="23"> 
              <div align="left"> 
                <input type="text" name="E01COPCCO" size="50" maxlength="45" value="<%= datarec.getE01COPCCO()%>" >
              </div>
            </td>
          </tr>          
          
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="40%" height="23"> 
              <div align="right">Telefono :</div>
            </td>
            <td nowrap height="23"> 
              <div align="left"> 
                <input type="text" name="E01COPPHN" size="18" maxlength="15" value="<%= datarec.getE01COPPHN()%>" onKeyPress="enterInteger(event)">
              </div>
            </td>
          </tr>          
          
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="40%" height="23"> 
              <div align="right">E-Mail :</div>
            </td>
            <td nowrap height="23"> 
              <div align="left"> 
                <input type="text" name="E01COPIAD" size="60" maxlength="60" value="<%= datarec.getE01COPIAD()%>" >
              </div>
            </td>
          </tr>          

        </table>
      </td>
    </tr>
  </table>
  
  <div align="center">
<% if ("true".equals(request.getParameter("readOnly"))) { %>
	<script type="text/javascript">
	  	$("input[type='text']").attr("readonly", "readonly");  
		$("select" ).add("input[type='radio']").attr("disabled", "disabled");  
		$("img[title='null']").add("img[title='ayuda']").hide(); 
	</script>
<% } else { %>   
    <input id="EIBSBTN" type=submit name="Submit" value="Enviar">
<% } %>
	<input id="EIBSBTN" type="button" name="Cancel" value="Cancelar" onclick="javascript:cerrarVentana()">
  </div>	
</form>

<% if ("S".equals(request.getAttribute("ACT"))) { %>
  <script type="text/javascript">
    window.opener.location.href = '<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSESD0792?SCREEN=100';	   	   
    cerrarVentana();	  
  </script>
<% } %>   

</body>
</html>
