<html>
<head>
<title>Estado de Cuentas Contables</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />

<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>

</head>

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>

<body>

<% 
 if ( !error.getERRNUM().equals("0")  ) {
     error.setERRNUM("0");
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
 }
%> 

<h3 align="center"> Consulta de Cuentas Reconciliables<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="st_selection.jsp,EGL0810"> 
</h3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSEGL0810" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="200">
  <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing=0 cellpadding=2 width="100%" border="0">
          <tr id="trdark"> 
            <td nowrap width="23%" height="31"> 
              <div align="right"><b>C&oacute;digo de Banco : </b></div>
            </td>
            <td nowrap width="32%" height="31"> 
              <input type="text" name="E01TRABNK" size="3" maxlength="2">
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="23%"> 
              <div align="right"><b>N&uacute;mero de Sucursal : </b></div>
            </td>
            <td nowrap width="32%">
              <input type="text" name="E01TRABRN" size="5" maxlength="4">
              <a href="javascript:GetBranch('E01TRABRN',document.forms[0].E01TRABNK.value)"> 
              <img src="<%=request.getContextPath()%>/images/1b.gif" title=". . ." align="middle" border="0" > 
              </a> </td>
          </tr>
          <tr id="trdark">
            <td nowrap width="23%">
              <div align="right"><b>Moneda : </b></div>
            </td>
            <td nowrap width="32%">
              <input type="text" name="E01TRACCY" size="4" maxlength="3">
              <a href="javascript:GetCurrency('E01TRACCY',document.forms[0].E01TRABNK.value)"> 
              <img src="<%=request.getContextPath()%>/images/1b.gif" title=". . ." align="middle" border="0" > 
              </a> </td>
          </tr>
          <tr id="trdark">
            <td nowrap width="23%">
              <div align="right"><b>Cuenta Contable : </b></div>
            </td>
            <td nowrap width="32%">
              <input type="text" name="E01TRAGLN" size="18" maxlength="16" onKeypress="enterInteger(event)">
              <a href="javascript:GetLedger('E01TRAGLN',document.forms[0].E01TRABNK.value,document.forms[0].E01TRACCY.value,'')"> 
              <img src="<%=request.getContextPath()%>/images/1b.gif" title=". . ." align="middle" border="0" > 
              </a> </td>
          </tr>
          <tr id="trdark">
            <td nowrap width="23%">
              <div align="right"><b>Numero de Referencia : </b></div>
            </td>
            <td width="32%"> 
              <input type="text" name="E01TRAACC" size="13" maxlength="12" onKeypress="enterInteger(event)">
              <a href="javascript:GetAccount('E01TRAACC','','','')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="Busqueda por Cuenta" align="bottom" border="0" ></a> 
			</td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <p>&nbsp;</p>
  
	  <div align="center"> 
    	<input id="EIBSBTN" type=submit name="Submit" value="Enviar">
  	  </div>

  </form>
</body>
</html>
