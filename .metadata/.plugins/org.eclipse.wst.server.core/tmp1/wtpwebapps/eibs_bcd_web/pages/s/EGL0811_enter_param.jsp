<html>
<head>
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>


<jsp:useBean id="msgList" class="datapro.eibs.beans.EGL081101Message"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session"/>

<script type="text/javascript">

builtHPopUp();

function showPopUp(opth,field,bank,ccy,field1,field2,opcod) {
	init(opth,field,bank,ccy,field1,field2,opcod);
	showPopupHelp();
}

function checkValues() {
	return true;
}

function enter(){
	  document.forms[0].submit();
	 }
</script>

</head>
<body>


<% 
 if ( !error.getERRNUM().equals("0")  ) {
     out.println("<SCRIPT Language=\"Javascript\">");
     error.setERRNUM("0");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
    }
%> 
<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEGL0811" >
	<INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="200">
 	<INPUT TYPE=HIDDEN NAME="SEARCHC" VALUE="">
<h3 align="center">Consulta Transacciones de Cuentas Reconciliables<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="enter_param.jsp, EGL0811"></h3>
<hr size="4">
  <br><br><br><br><br><br>
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
          <tr id="trdark"> 
           <td nowrap width="23%"> 
           <div align="right"><b>Listar desde Importe Débito : </b></div>
          </td>
         <td width="32%">  
          	<input type="text" name="E01INPLMI" value="<%= msgList.getE01INPLMI() %>" size="18" maxlength="15" onkeypress="enterDecimal()">              
         </td>
      </tr>
      <tr id="trdark"> 
         <td nowrap width="23%"> 
          <div align="right"><b>Listar desde Importe Crédito : </b></div>
      </td>
      <td width="32%">
       	<input type="text" name="E01INPLMX" value="<%= msgList.getE01INPLMX() %>" size="18" maxlength="16" onkeypress="enterDecimal()">              
      </td>
    </tr>
  </table>
  </td>
  </tr>
  </table>
 
   <br>
  <table width="100%" border="0" cellspacing="0" cellpadding="0" bgcolor="#FFFFFF" bordercolor="#FFFFFF">
          <tr bgcolor="#FFFFFF"> 
            <td width="33%"> 
              <div align="center"> 
                <input id="EIBSBTN" type=submit name="Submit" value="Enviar">
              </div>
            </td>
          </tr>
          <tr bgcolor="#FFFFFF"> 
            <td> 
              <div align="center"> </div>
            </td>
          </tr>
        </table>
</form>
</body>
</html>