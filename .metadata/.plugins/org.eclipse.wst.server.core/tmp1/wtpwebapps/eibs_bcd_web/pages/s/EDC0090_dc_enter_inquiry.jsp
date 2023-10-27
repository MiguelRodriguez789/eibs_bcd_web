<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@ page import = "datapro.eibs.master.Util" %>
<%@ page import="com.datapro.constants.EibsFields"%>

<html>
<head>
<title>Consulta de Cartas de Crédito</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>

<SCRIPT type="text/javascript">
function redirect() {
	if (trim(document.forms[0].E01DCMACC.value) != "") {
		document.forms[0].SCREEN.value = 200;
	}
	else {
		document.forms[0].SCREEN.value = 210;
	}
	document.forms[0].submit();
}

</SCRIPT>

</head>

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />

<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>

<body  bgcolor="#FFFFFF">

<h3 align="center">Consulta de Cobranzas<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="dc_enter_inquiry.jsp, EDC0090"></h3>
<hr size="4">

<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.trade.JSEDC0100" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="200">

  <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" >
          <tr id="trdark">
            <td width="50%"> 
              <div align="right">Número de Cobranza : </div>
            </td>
            <td width="50%"> 
              <div align="left"> 
	              <input type="text" name="E01DCMACC" size="13" maxlength="12" onKeypress="enterInteger(event)">
    	          <a href="javascript:GetAccount('E01DCMACC','','CL','')"><img src="<%=request.getContextPath()%>/images/1b.gif" title=". . ." align="bottom" border="0" ></a> 
              </div>
            </td>
          </tr>
         </table>
      </td>
    </tr>
  </table>
  <br>
  <h5 align="center">o</h5>
  <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" >
          <tr id="trdark">
            <td width="30%" nowrap>
              <div align="right">Número de Cliente : </div>
            </td>
            <td width="70%" nowrap>
              <input type="text" name="E01SCHCUN" size="10" maxlength="9" onKeyPress="enterInteger(event)">
              <a href="javascript:GetCustomer('E01SCHCUN')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="Help" align="bottom" border="0"></a>
            </td>
          </tr>
          <tr id="trclear">
            <td width="30%" nowrap> 
              <div align="right">Fecha de Emisión : </div>
            </td>
            <td width="70%" nowrap>
              Del 
				<eibsinput:date  fn_month="E01SCHFIM" fn_day="E01SCHFID" fn_year="E01SCHFIY" />              
              al
               <eibsinput:date  fn_month="E01SCHTIM" fn_day="E01SCHTID" fn_year="E01SCHTIY" />                          
            </td>
          </tr>
          <tr id="trdark">
            <td width="30%" nowrap> 
              <div align="right">Fecha de Vencimiento : </div>
            </td>
            <td width="70%" nowrap>	
  			 Del 
			<eibsinput:date  fn_month="E01SCHFMM" fn_day="E01SCHFMD" fn_year="E01SCHFMY" />
              al 
			<eibsinput:date  fn_month="E01SCHTMM" fn_day="E01SCHTMD" fn_year="E01SCHTMY" />                           
            </td>
          </tr>
          <tr id="trclear">
            <td width="30%" nowrap>
              <div align="right">Tipo de Cuenta : </div>
            </td>
            <td width="70%" nowrap>
				<SELECT name="E01SCHACD">
					<OPTION value="50">Cobranza Simple</OPTION>
					<OPTION value="51">Cobranza Documentaria</OPTION>
				</SELECT>
            </td>
          </tr>
          <tr id="trdark">
            <td width="30%" nowrap>
              <div align="right">Tipo de Producto : </div>
            </td>
            <td width="70%" nowrap>
              <input type="text" name="E01SCHATY" size="5" maxlength="4">
              <a href="javascript:GetProductRates('E01SCHATY','DC')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="Help" align="bottom" border="0"></a>
            </td>
          </tr>
          <tr id="trclear">
            <td width="30%" nowrap>
              <div align="right">Código de Producto : </div>
            </td>
            <td width="70%" nowrap>
              <input type="text" name="E01SCHPRO" size="5" maxlength="4">
              <a href="javascript:GetProduct('E01SCHPRO','CL','')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="Help" align="bottom" border="0"></a>
            </td>
          </tr>
          <tr id="trdark">
            <td width="30%" nowrap>
              <div align="right">Agencia : </div>
            </td>
            <td width="70%" nowrap>
              <input type="text" name="E01SCHBRN" size="4" maxlength="3">
              <a href="javascript:GetBranch('E01SCHBRN','','')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="Help" align="bottom" border="0"></a>
            </td>
          </tr>
          <tr id="trclear">
            <td width="30%" nowrap>
              <div align="right">Moneda : </div>
            </td>
            <td width="70%" nowrap>
              <input type="text" name="E01SCHCCY" size="4" maxlength="3">
              <a href="javascript:GetCurrency('E01SCHCCY','')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="Help" align="bottom" border="0"></a>
            </td>
          </tr>
          <tr id="trdark">
            <td width="30%" nowrap > 
              <div align="right">Monto : </div>
            </td>
            <td width="70%" nowrap >
          	  Desde 
              <input type="text" name="E01SCHAMF" size="20" maxlength="19" onKeypress="enterDecimal()">
              hasta
              <input type="text" name="E01SCHAMT" size="20" maxlength="19" onKeypress="enterDecimal()">
            </td>
          </tr>
          <tr id="trclear">
            <td width="30%" nowrap>
              <div align="right">Banco Remitente : </div>
            </td>
            <td width="70%" nowrap>
              <input type="text" name="E01SCHRBK" size="40" maxlength="35">
            </td>
          </tr>
          <tr id="trdark">
            <td width="30%" nowrap>
              <div align="right">Girador / Exportador : </div>
            </td>
            <td width="70%" nowrap>
              <input type="text" name="E01SCHDRW" size="40" maxlength="35">
            </td>
          </tr>
          <tr id="trclear">
            <td width="30%" nowrap>
              <div align="right">Girado / Beneficiario : </div>
            </td>
            <td width="70%" nowrap>
              <input type="text" name="E01SCHDWE" size="40" maxlength="35">
            </td>
          </tr>
          <tr id="trdark">
            <td width="30%" nowrap>
              <div align="right">Banco Cobrador / Banco Girado : </div>
            </td>
            <td width="70%" nowrap>
              <input type="text" name="E01SCHCLB" size="40" maxlength="35">
            </td>
          </tr>		  
          <tr id="trclear">
            <td width="30%" nowrap>
              <div align="right">Tipo de Cobranza : </div>
            </td>
            <td width="70%" nowrap>
				<SELECT name="E01SCHTYP">
					<OPTION value=""></OPTION>
					<OPTION value="O">Enviada</OPTION>
					<OPTION value="I">Recibida</OPTION>
				</SELECT>
            </td>
          </tr>
          <tr id="trdark">
            <td width="30%" nowrap>
              <div align="right">Nuestra Referencia : </div>
            </td>
            <td width="70%" nowrap>
              <input type="text" name="E01SCHORF" size="17" maxlength="16">
            </td>
          </tr>
          <tr id="trclear">
            <td width="30%" nowrap>
              <div align="right">Referencia del Girador : </div>
            </td>
            <td width="70%" nowrap>
              <input type="text" name="E01SCHDRF" size="17" maxlength="16">
            </td>
          </tr>
          <tr id="trdark">
            <td width="30%" nowrap>
              <div align="right">Referencia del Banco Remitente: </div>
            </td>
            <td width="70%" nowrap>
              <input type="text" name="E01SCHRRF" size="17" maxlength="16">
            </td>
          </tr>
          <tr id="trclear">
            <td width="30%" nowrap>
              <div align="right">Referencia del Banco Cobrador : </div>
            </td>
            <td width="70%" nowrap>
              <input type="text" name="E01SCHCRF" size="17" maxlength="16">
            </td>
          </tr>		  
          <tr id="trdark">
            <td width="30%" nowrap>
              <div align="right">Estado : </div>
            </td>
            <td width="70%" nowrap>
				<SELECT name="E01SCHSTS">
					<OPTION value=""></OPTION>
					<OPTION value="A">Activas</OPTION>
					<OPTION value="C">Cerradas</OPTION>
				</SELECT>
            </td>
          </tr>
          <tr id="trclear">
            <td width="30%" nowrap>
              <div align="right">País : </div>
            </td>
            <td width="70%" nowrap>
              <input type="text" name="E01SCHGCD" size="5" maxlength="4">
              <a href="javascript:GetCodeCNOFC('E01SCHGCD','03')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="bottom" border="0" ></a> 
            </td>
          </tr>
          <tr id="trdark">
            <td width="30%" nowrap>
              <div align="right">País de Riesgo : </div>
            </td>
            <td width="70%" nowrap>
              <input type="text" name="E01SCHGRC" size="5" maxlength="4">
              <a href="javascript:GetCodeCNOFC('E01SCHGRC','03')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="bottom" border="0" ></a> 
            </td>
          </tr>
         </table>
      </td>
    </tr>
  </table>
  <br>
  <div align="center"> 
    <input id="EIBSBTN" type=submit name="Submit" value="Enviar" onclick="redirect();">
  </div>

<script type="text/javascript">
  document.forms[0].E01DCMACC.focus();
  document.forms[0].E01DCMACC.select();
</script>
<% 
 if ( !error.getERRNUM().equals("0")  ) {
      error.setERRNUM("0");
 %>
     <SCRIPT type="text/javascript">;
            showErrors();
     </SCRIPT>;
 <%
 }
%>
</form>
</body>
</html>
