<%@ page import = "datapro.eibs.master.Util" %>
<%@ page import = "java.lang.Object" %>

<HTML>
<HEAD>
<TITLE> Detalle de Cuota </TITLE>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id="header" class="datapro.eibs.beans.EDL090001Message"  scope="session" />
<jsp:useBean id= "list" class= "datapro.eibs.beans.JBListRec"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>

</HEAD>

<BODY>

<form>
  <p> 
    <input TYPE=HIDDEN name="SCREEN" value="500">
    <INPUT TYPE=HIDDEN NAME="opt" VALUE="1">
  </p>

  <h3 align="center">Detalle de la Cuota<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="ln_crn_pay_det.jsp,EDL0900"> 
  </h3>
  <hr size="4">

  <%
   int row = Integer.parseInt(request.getParameter("Row"));
   list.setCurrentRow(row);
 %> 
  <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
          <%if(!userPO.getCusNum().equals("0")){ %>
          <tr id="trdark"> 
            <td nowrap width="14%" > 
              <div align="right"><b>Cliente :</b></div>
            </td>
            <td nowrap width="9%" > 
              <div align="left"> 
              		<input type="text" name="E02CUN2" size="10" maxlength="9" readonly value="<%= userPO.getCusNum().trim()%>">
              </div>
            </td>
            <td nowrap width="12%" > 
              <div align="right"><b>Nombre :</b> </div>
            </td>
            <td nowrap > 
              <div align="left"> 
              		<input type="text" name="E02NA12" size="45" maxlength="45" readonly value="<%= userPO.getCusName().trim()%>">
              </div>
            </td>
            <td nowrap > 
              <div align="right"><b>Producto : </b></div>
            </td>
            <td nowrap ><b> 
              		<input type="text" name="E02PRO2" size="5" maxlength="4" readonly value="<%= userPO.getProdCode().trim()%>">
              </b></td>
          </tr>
          <% }%>
          <tr id="trdark"> 
            <td nowrap width="14%"> 
              <div align="right"><b>Cuenta :</b></div>
            </td>
            <td nowrap width="9%"> 
              <div align="left"> 
              		<input type="text" name="E02ACC" size="13" maxlength="12" readonly value="<%= userPO.getAccNum().trim()%>">
              </div>
            </td>
            <td nowrap width="12%"></td>
            <td nowrap width="33%"></td>
            <td nowrap width="11%"> 
              <div align="right"><b>Moneda : </b></div>
            </td>
            <td nowrap width="21%"> 
              <div align="left"><b> 
               	<input type="text" name="E01DEACCY" size="4" maxlength="3" value="<%= userPO.getCurrency().trim()%>" readonly>
              </b> </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
 
  <BR>
  <%int row1 = 0; %>
  <table class="tableinfo">
    <tr> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
          <tr id="<%= (row1 % 2 == 1) ? "trdark" : "trclear" %><%row1++;%>"> 
            <td nowrap width="30%" > 
              <div align="right">Fecha de Apertura :</div>
            </td>
            <td nowrap width="20%"  > 
              <div align="right"><%= userPO.getHeader10().trim()%></div>
            </td>
            <td nowrap width="30%" > 
              <div align="right">Tasa de Inter&eacute;s :</div>
            </td>
            <td nowrap width="20%" > 
              <div align="right"><%= userPO.getHeader13().trim()%></div>
            </td>
          </tr>
          <tr id="<%= (row1 % 2 == 1) ? "trdark" : "trclear" %><%row1++;%>">
            <td nowrap width="30%" > 
              <div align="right">Fecha de Vencimiento :</div>
            </td>
            <td nowrap width="20%" > 
              <div align="right"><%= userPO.getHeader11().trim()%></div>
            </td>
            <td nowrap width="30%" > 
              <div align="right">Per&iacute;odo Base :</div>
            </td>
            <td nowrap width="20%" > 
              <div align="right"><%= userPO.getHeader14().trim()%></div>
            </td>
          </tr>
          <tr id="<%= (row1 % 2 == 1) ? "trdark" : "trclear" %><%row1++;%>"> 
            <td nowrap width="30%" > 
              <div align="right">Monto Original :</div>
            </td>
            <td nowrap width="20%" > 
              <div align="right"><%= userPO.getHeader12().trim()%></div>
            </td>
            <td nowrap width="30%" > 
              <div align="right">Tipo de C&aacute;lculo :</div>
            </td>
            <td nowrap width="30%" > 
              <div align="right"><%= userPO.getHeader15().trim()%></div>
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
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
          <tr id="<%= (row1 % 2 == 1) ? "trdark" : "trclear" %><%row1++;%>"> 
            <td nowrap width="30%" >Cuota N&uacute;mero : <%= list.getRecord(0) %></td>
            <td nowrap width="3%" >&nbsp;</td>
            <td nowrap width="30%" > 
              <div align="left">Fecha a Pagar : <%= list.getRecord(1) %></div>
            </td>
            <td nowrap width="3%" >&nbsp;</td>
            <td nowrap width="30%" > 
              <div align="left">Fecha de Pago : <%= list.getRecord(9) %></div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <br>
  
  <table class="tableinfo">
    <tr id="<%= (row1 % 2 == 1) ? "trdark" : "trclear" %><%row1++;%>">
      <th align=CENTER nowrap width="30%" >Descripci&oacute;n</th>
      <th align=right nowrap width="15%" >A Pagar</th>
      <th align=right nowrap width="20%" >Pagado</th>
      <th align=right nowrap width="20%" >Condonado</th>
      <th align=right nowrap width="15%" >Saldos</th>
    </tr>
    <%
     	for (int i=31;i<51;i++) {
	    	if (!(list.getRecord(i).equals("0.00") || list.getRecord(i).equals("0,00")) ){  %> 
	    <tr> 
	      <td align=CENTER  nowrap width="15%"><%= list.getRecord(i-20) %></td>
	      <td align=CENTER  nowrap width="10%"> 
	        <div align="right" ><%= list.getRecord(i) %></div>
	      </td>
	      <td align=CENTER  nowrap width="10%"> 
	        <div align="right" ><%= list.getRecord(i+20) %></div>
	      </td>
	      <td align=CENTER  nowrap width="10%"> 
	        <div align="right" ><%= list.getRecord(i+40) %></div>
	      </td>
	      <td align=CENTER  nowrap width="10%"> 
	        <div align="right" ><%= list.getRecord(i+63) %></div>
	      </td>
	    </tr>
	    <%   }
	 	}
	%> 
  </table>
  <br>
  
  <table class="tableinfo">
    <tr id="<%= (row1 % 2 == 1) ? "trdark" : "trclear" %><%row1++;%>">
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
          <tr id="<%= (row1 % 2 == 1) ? "trdark" : "trclear" %><%row1++;%>">
            <td nowrap width="20%" height="18" ><b>Total</b></td>
            <td nowrap width="20%" height="18" >A Pagar : &nbsp;<%= list.getRecord(91) %></td>
            <td nowrap width="20%" height="18" > 
              <div align="left">Pagado :&nbsp;<%= list.getRecord(92) %></div>
            </td>
            <td nowrap width="20%" height="18" > 
              <div align="left">Condonado :&nbsp;<%= list.getRecord(93) %></div>
            </td>
            <td nowrap width="20%" height="18" > 
              <div align="left">Saldos :&nbsp;<%= list.getRecord(124) %></div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  </FORM>

</BODY>
</HTML>
