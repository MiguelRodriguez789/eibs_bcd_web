<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<title>Consulta de Saldos de Tarjeta de Crédito</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<%@ page import = "datapro.eibs.master.Util" %>

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>

<jsp:useBean id= "msgBal" class= "datapro.eibs.beans.ECL0140DSMessage"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>

</head>
<body >
<h3 align="center">Operaciones del Cliente<br>Consulta de Saldos de Tarjeta de Crédito<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="cc_balance_inq.jsp, ECL0140"> 
</h3>
<hr size="4">
<% 

	if ( !error.getERRNUM().equals("0")  ) {
		//error.setERRNUM("0");
		out.println("<SCRIPT Language=\"Javascript\">");
		out.println("       showErrors()");
		out.println("</SCRIPT>");
	}

	String cardMask = "";
	cardMask = msgBal.getE01TARNRO().substring(0,4) + "XXXXXXXX" + msgBal.getE01TARNRO().substring(12,16);
	
	String fpp = "";
	if (msgBal.getE01CTSFPP().equals("0")) {
		fpp = "00/00/0000";
	}
	else {
		fpp = msgBal.getE01CTSFPP().substring(0,2) + "/" + msgBal.getE01CTSFPP().substring(2,4) + "/" + msgBal.getE01CTSFPP().substring(4);
	}
 
	String fup = "";
	if (msgBal.getE01CTSFUP().equals("0")) {
		fup = "00/00/0000";
	}
	else {
		fup = msgBal.getE01CTSFUP().substring(0,2) + "/" + msgBal.getE01CTSFUP().substring(2,4) + "/" + msgBal.getE01CTSFUP().substring(4);
	}
%> 
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.misc.JSECL0140">
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="">

  <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="trdark"> 
            <td nowrap width="16%"> 
              <div align="right">Identificación del Cliente :</div>
            </td>
            <td nowrap width="16%"> 
              <div align="left"> 
              	<input type="text" name="E01IDETIP" size="2" maxlength="1" value="<%= msgBal.getE01IDETIP().trim()%>" readonly>
              	<input type="text" name="E01IDECLI" size="10" maxlength="9" value="<%= msgBal.getE01IDECLI().trim()%>" readonly>
              </div>
            </td>
            <td nowrap width="16%"> 
              <div align="right">Nombre del Cliente :</div>
            </td>
            <td nowrap width="20%"> 
              <div align="left"> 
                <input type="text" name="E01NOMCLI" size="36" maxlength="35" value="<%= msgBal.getE01NOMCLI().trim()%>" readonly>
              </div>
            </td>
          </tr>    
          <tr id="trclear"> 
            <td nowrap width="25%"> 
              <div align="right">Número de Tarjeta :</div>
            </td>
            <td nowrap width="25%"> 
              <div align="left"> 
              	<input type="text" name="E01TARNRO" size="20" maxlength="16" value="<%= cardMask %>" readonly>
              </div>
            </td>
            <td nowrap width="25%"> 
              <div align="right">Estado de la Cuenta :</div>
            </td>
            <td nowrap width="27%"> 
 				<input type="text" readonly name="E01CTSSTA" size="2" maxlength="1" value="<%= msgBal.getE01CTSSTA().trim() %>">            
 			</td>
          </tr>            
          <tr id="trdark"> 
            <td nowrap width="16%"> 
              <div align="right">Estado de la Distribución :</div>
            </td>
            <td nowrap width="16%"> 
              <div align="left"> 
              	<input type="text" name="E01ESTDIS" size="3" maxlength="2" value="<%= msgBal.getE01ESTDIS().trim()%>" readonly>
              	<input type="text" name="E01DESEDI" size="35" maxlength="30" value="<%= msgBal.getE01DESEDI().trim()%>" readonly>
              </div>
            </td>
            <td nowrap width="16%"> 
            </td>
            <td nowrap width="20%"> 
            </td>
          </tr>    
        </table>
      </td>
    </tr>
  </table>
  
  <h4>Saldos</h4>
  <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="trdark"> 
            <td nowrap width="25%"> 
              <div align="right">Saldo Actual :</div>
            </td>
            <td nowrap width="25%"> 
              <div align="left"> 
              	<input type="text" name="E01CTSSAC" size="18" maxlength="17" value="<%= msgBal.getE01CTSSAC().trim() %>" readonly>
              </div>
            </td>
            <td nowrap width="25%"> 
              <div align="right">Límite de Crédito :</div>
            </td>
            <td nowrap width="25%"> 
              <div align="left"> 
              	<input type="text" name="E01CTSLCR" size="18" maxlength="17" value="<%= msgBal.getE01CTSLCR().trim() %>" readonly>
              </div>
            </td>
          </tr>    
          <tr id="trclear"> 
            <td nowrap width="25%"> 
              <div align="right">Saldo al Corte :</div>
            </td>
            <td nowrap width="25%"> 
              <div align="left"> 
              	<input type="text" name="E01CTSSCO" size="18" maxlength="17" value="<%= msgBal.getE01CTSSCO().trim() %>" readonly>
              </div>
            </td>
            <td nowrap width="25%"> 
              <div align="right">Cuota del Mes :</div>
            </td>
            <td nowrap width="25%"> 
              <div align="left"> 
              	<input type="text" name="E01CTSCME" size="18" maxlength="17" value="<%= msgBal.getE01CTSCME().trim() %>" readonly>
              </div>
            </td>
          </tr>            
          <tr id="trdark"> 
            <td nowrap width="25%"> 
              <div align="right">Monto de Último Pago :</div>
            </td>
            <td nowrap width="25%"> 
              <div align="left"> 
              	<input type="text" name="E01CTSMUP" size="18" maxlength="17" value="<%= msgBal.getE01CTSMUP().trim() %>" readonly>
              </div>
            </td>
            <td nowrap width="25%"> 
              <div align="right">Importes Vencidos :</div>
            </td>
            <td nowrap width="25%"> 
              <div align="left"> 
              	<input type="text" name="E01CTSIVE" size="18" maxlength="17" value="<%= msgBal.getE01CTSIVE().trim() %>" readonly>
              </div>
            </td>
          </tr>    
          <tr id="trclear"> 
            <td nowrap width="25%"> 
              <div align="right">Fecha de Próximo Pago :</div>
            </td>
            <td nowrap width="25%"> 
              <div align="left"> 
              	<input type="text" name="E01CTSFPP" size="18" maxlength="17" value="<%= fpp %>" readonly>
              </div>
            </td>
            <td nowrap width="25%"> 
              <div align="right">Fecha de Último Pago :</div>
            </td>
            <td nowrap width="25%"> 
              <div align="left"> 
              	<input type="text" name="E01CTSFUP" size="18" maxlength="17" value="<%= fup %>" readonly>
              </div>
            </td>
          </tr>            
          <tr id="trdark"> 
            <td nowrap width="25%"> 
              <div align="right">Saldo Disponible :</div>
            </td>
            <td nowrap width="25%"> 
              <div align="left"> 
              	<input type="text" name="E01CTSSDC" size="18" maxlength="17" value="<%= msgBal.getE01CTSSDC().trim() %>" readonly>
              </div>
            </td>
            <td nowrap width="25%"> 
            </td>
            <td nowrap width="25%"> 
            </td>
          </tr>    
        </table>
      </td>
    </tr>
  </table>
  
  <h4>Cupos CADIVI</h4> 
  <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellpadding=2 cellspacing=0 width="100%" border="0">
          <tr id="trclear"> 
            <td nowrap width="25%"> 
              <div align="right">Cupo de Dólares para Internet :</div>
            </td>
            <td nowrap width="25%"> 
              <div align="left"> 
              	<input type="text" name="E01CDOINT" size="18" maxlength="17" value="<%= msgBal.getE01CDOINT().trim() %>" readonly>
              </div>
            </td>
            <td nowrap width="25%"> 
              <div align="right">Cupo de Dólares para Viajes :</div>
            </td>
            <td nowrap width="25%"> 
              <div align="left"> 
              	<input type="text" name="E01CDOVIA" size="18" maxlength="17" value="<%= msgBal.getE01CDOVIA().trim() %>" readonly>
              </div>
            </td>
          </tr>            
          <tr id="trdark"> 
            <td nowrap width="25%"> 
              <div align="right">Saldo Consumido de Dólares para Internet :</div>
            </td>
            <td nowrap width="25%"> 
              <div align="left"> 
              	<input type="text" name="E01SDOCDI" size="18" maxlength="17" value="<%= msgBal.getE01SDOCDI().trim() %>" readonly>
              </div>
            </td>
            <td nowrap width="25%"> 
              <div align="right">Saldo Consumido de Dólares para Viajes :</div>
            </td>
            <td nowrap width="25%"> 
              <div align="left"> 
              	<input type="text" name="E01SDOCDV" size="18" maxlength="17" value="<%= msgBal.getE01SDOCDV().trim() %>" readonly>
              </div>
            </td>
          </tr>            
          <tr id="trclear"> 
            <td nowrap width="25%"> 
              <div align="right">Saldo Disponible de Dólares para Internet :</div>
            </td>
            <td nowrap width="25%"> 
              <div align="left"> 
              	<input type="text" name="E01CTSCID" size="18" maxlength="17" value="<%= msgBal.getE01CTSCID().trim() %>" readonly>
              </div>
            </td>
            <td nowrap width="25%"> 
              <div align="right">Saldo Disponible de Dólares para Viajes :</div>
            </td>
            <td nowrap width="25%"> 
              <div align="left"> 
              	<input type="text" name="E01CTSCVD" size="18" maxlength="17" value="<%= msgBal.getE01CTSCVD().trim() %>" readonly>
              </div>
            </td>
          </tr>            
        </table>
      </td>
    </tr>
  </table>

</form>
</body>
</html>
