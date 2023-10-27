 <!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>Borra transacciones de Cuentas Reconciliables</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

</head>

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "msg" class= "datapro.eibs.beans.EGL026001Message"  scope="session" />

<body>

<h3 align="center"> Borrar Transacciones de Cuentas Reconciliables<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="recons_delete_search.jsp, EGL0260"> 
</h3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEGL0260" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="2">
  <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing=0 cellpadding=2 width="100%" border="0">
          <tr id="trdark"> 
            <td nowrap width="23%" height="31"> 
              <div align="right"><b>C&oacute;digo de Banco : </b></div>
            </td>
            <td nowrap width="32%" height="31"> 
              <input type="text" name="E01TRABNK" size="3" maxlength="2" value="<%= msg.getE01TRABNK() %>">
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="23%"> 
              <div align="right"><b>N&uacute;mero de Sucursal : </b></div>
            </td>
            <td nowrap width="32%">
              <input type="text" name="E01TRABRN" size="5" maxlength="4" value="<%= msg.getE01TRABRN() %>">
              <a href="javascript:GetBranch('E01TRABRN',document.forms[0].E01TRABNK.value)"> 
              <img src="<%=request.getContextPath()%>/images/1b.gif" title=". . ." align="middle" border="0" > 
              </a> </td>
          </tr>
          <tr id="trdark">
            <td nowrap width="23%">
              <div align="right"><b>Moneda : </b></div>
            </td>
            <td nowrap width="32%">
              <input type="text" name="E01TRACCY" size="4" maxlength="3" value="<%= msg.getE01TRACCY() %>">
              <a href="javascript:GetCurrency('E01TRACCY',document.forms[0].E01TRABNK.value)"> 
              <img src="<%=request.getContextPath()%>/images/1b.gif" title=". . ." align="middle" border="0" > 
              </a> </td>
          </tr>
          <tr id="trdark">
            <td nowrap width="23%">
              <div align="right"><b>Cuenta Contable : </b></div>
            </td>
            <td nowrap width="32%">
              <input type="text" name="E01TRAGLN" size="18" maxlength="16" onKeypress="enterInteger(event)" value="<%= msg.getE01TRAGLN() %>">
              <a href="javascript:GetLedger('E01TRAGLN',document.forms[0].E01TRABNK.value,document.forms[0].E01TRACCY.value,'')"> 
              <img src="<%=request.getContextPath()%>/images/1b.gif" title=". . ." align="middle" border="0" > 
              </a> </td>
          </tr>
          <tr id="trdark">
            <td nowrap width="23%">
              <div align="right"><b>Numero de Referencia : </b></div>
            </td>
            <td width="32%"> 
              <input type="text" name="E01TRAACC" size="13" maxlength="12" onKeypress="enterInteger(event)" value="<%= msg.getE01TRAACC() %>">
              <a href="javascript:GetAccount('E01TRAACC','','','')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="Busqueda por Cuenta" align="bottom" border="0" ></a> 
			</td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <p>&nbsp;</p>
  
 	 
	  <div align="center"> 
    	<p><input id="EIBSBTN" type=submit name="Submit" value="Enviar"></p>
  	  </div>

<% 
 if ( !error.getERRNUM().equals("0")  ) {
      error.setERRNUM("0");
 %>
     <SCRIPT type="text/javascript">;
            showErrors();
     </SCRIPT>
 <%
 }
%>
	

</form>
</body>
</html>
 