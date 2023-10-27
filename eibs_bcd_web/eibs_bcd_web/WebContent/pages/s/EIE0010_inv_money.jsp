<html>
<head>
<title>Money Launder Control</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

</head>

<jsp:useBean id="cdMoney" class="datapro.eibs.beans.ELD000001Message" scope="session" />

<jsp:useBean id="error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />

<jsp:useBean id="userPO" class= "datapro.eibs.beans.UserPos" scope="session" />

<body>

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>

<SCRIPT type="text/javascript">

 builtNewMenu(cus_m_port_opt);
 initMenu();
 
</SCRIPT>

<% 
 if ( !error.getERRNUM().equals("0")  ) {
     out.println("<SCRIPT Language=\"Javascript\">");
	 error.setERRNUM("0");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
 }

%>


<H3 align="center">Parametros de Lavado de Dinero
	<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="inv_money, EIE0010"></H3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.invest.JSEIE0010" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="53">
  <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
          <tr id="trdark"> 
            <td nowrap width="16%" > 
              <div align="right"><b>Cliente : </b></div>
            </td>
            <td nowrap width="20%" > 
              <div align="left"> 
                <input type="text"  name="CUSCUN" size="9" maxlength="9" value="<%= cdMoney.getE06LDMCUN().trim()%>" readonly>
              </div>
            </td>
            <td nowrap width="16%" > 
              <div align="right"><b>Nombre :</b> </div>
            </td>
            <td nowrap colspan="3" > 
              <div align="left"> 
                <input type="text"  name="CUSNA1" size="45"  maxlength="45" value="<%= cdMoney.getE06CUSNA1().trim()%>" readonly>
              </div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="16%"> 
              <div align="right"><b>Cuenta : </b></div>
            </td>
            <td nowrap width="20%"> 
              <div align="left"> 
                <input type="text"  name="ACCNUM" size="12"  maxlength="9" value="<%= cdMoney.getE06LDMACC().trim()%>" readonly>
              </div>
            </td>
            <td nowrap width="16%"> 
              <div align="right"><b>Moneda : </b></div>
            </td>
            <td nowrap width="16%"> 
              <div align="left"> 
                <input type="text"  name="PROCCY" size="4"  maxlength="4" value="<%= cdMoney.getE06LDMCCY().trim()%>" readonly>
              </div>
            </td>
            <td nowrap width="16%"> 
              <div align="right"><b>Producto : </b></div>
            </td>
            <td nowrap width="16%"> 
              <div align="left"> 
                <input type="text"  name="PROCOD" size="4"  maxlength="4" value="<%= cdMoney.getE06LDMPRO().trim()%>" readonly>
              </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <br>
  <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="trdark"> 
            <td nowrap width="38%"> 
              <div align="right">Tabla de Perfil :</div>
            </td>
            <td nowrap width="62%"> 
              <input type="text" name="E06LDMPRF" size="3" maxlength="2" value="<%= cdMoney.getE06LDMPRF().trim()%>" >
              <input type="text" name="E06DSCPRF" size="36" maxlength="35" value="<%= cdMoney.getE06DSCPRF().trim()%>" >
			  			  <a href="javascript:GetProfileTable('E06LDMPRF','E06DSCPRF')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="help" align="absmiddle" border="0"></a>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  
  
    <h4>Portafolio</h4>
  <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="trdark"> 
            <td nowrap width="29%"> 
              <div align="center"><b>Tipo de Actividad</b></div>
            </td>
            <td nowrap width="19%"> 
              <div align="center"><b>Número</b></div>
            </td>
            <td nowrap width="26%"> 
              <div align="center"><b>% Cargos</b></div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="29%"> 
              <div align="right">Compras :</div>
            </td>
            <td nowrap width="19%"> 
              <div align="center"> 
                <input type="text" name="E06LDMPPN" size="5" maxlength="5" value="<%=cdMoney.getE06LDMPPN().trim()%>" onKeyPress="enterInteger(event)">
              </div>
            </td>
            <td nowrap width="26%"> 
              <div align="center"> 
                <input type="text" name="E06LDMPPC" size="7" maxlength="5" value="<%=cdMoney.getE06LDMPPC().trim()%>" onKeyPress="enterDecimal(event, 2)">
              </div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="29%"> 
              <div align="right">Venta :</div>
            </td>
            <td nowrap width="19%"> 
              <div align="center"> 
                <input type="text" name="E06LDMPSN" size="5" maxlength="5" value="<%= cdMoney.getE06LDMPSN().trim()%>" onKeyPress="enterInteger(event)">
              </div>
            </td>
            <td nowrap width="26%"> 
              <div align="center"> 
                <input type="text" name="E06LDMPSC" size="7" maxlength="5" value="<%= cdMoney.getE06LDMPSC().trim()%>" onKeyPress="enterDecimal(event, 2)">
              </div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="29%" height="23"> 
              <div align="right">Transferencia de Entrada :</div>
            </td>
            <td nowrap width="19%" height="23"> 
              <div align="center"> 
                <input type="text" name="E06LDMPIN" size="5" maxlength="5" value="<%= cdMoney.getE06LDMPIN().trim()%>" onKeyPress="enterInteger(event)">
              </div>
            </td>
            <td nowrap width="26%" height="23"> 
              <div align="center"> 
                <input type="text" name="E06LDMPIC" size="7" maxlength="5" value="<%= cdMoney.getE06LDMPIC().trim()%>" onKeyPress="enterDecimal(event, 2)">
              </div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="29%" height="19"> 
              <div align="right">Transferencia de Salida :</div>
            </td>
            <td nowrap width="19%" height="19"> 
              <div align="center"> 
                <input type="text" name="E06LDMPON" size="5" maxlength="5" value="<%= cdMoney.getE06LDMPON().trim()%>" onKeyPress="enterInteger(event)">
              </div>
            </td>
            <td nowrap width="26%" height="19"> 
              <div align="center"> 
                <input type="text" name="E06LDMPOC" size="7" maxlength="5" value="<%= cdMoney.getE06LDMPOC().trim()%>" onKeyPress="enterDecimal(event, 2)">
              </div>
            </td>
          </tr>
          
          <tr id="trclear"> 
            <td nowrap width="29%"> 
              <div align="center"><b>Actividad Inusual</b></div>
            </td>
          </tr>          
          <tr id="trdark"> 
            <td nowrap width="29%" height="19"> 
              <div align="right"> Porciento de Variación :</div>
            </td>
            <td nowrap width="26%">           	
            	<div align="left">
              <input type="text" name="E06LDMPPL" size="7"
					maxlength="5" value="<%= cdMoney.getE06LDMPPL().trim()%>"
					onkeypress="enterDecimal()">
			</div>						
            </td> 
            <td nowrap width="26%" height="19"> 
            </td>            
           </tr>
           
          <tr id="trclear"> 
            <td nowrap width="29%" height="19"> 
              <div align="right"> Monto Potencial :</div>
            </td>
            <td nowrap width="26%">           	
            	<div align="left">
              <input type="text" name="E06LDMPPA" size="17"
					maxlength="16" value="<%= cdMoney.getE06LDMPPA().trim()%>"
					onkeypress="enterDecimal()">
			</div>						
            </td> 
            <td nowrap width="26%" height="19"> 
            </td>            
           </tr>
          
        </table>
      </td>
    </tr>
  </table>
  
  
  <p align="center"> 
	   <INPUT id="EIBSBTN" type="submit" name="Submit" value="Enviar">
  </p>
  
  </form>
</body>
</html>
