<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<%@ page import ="datapro.eibs.master.Util,datapro.eibs.beans.*" %>
<HTML>
<HEAD> 
<TITLE>
Payment Schedule Maintenance
</TITLE>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">


<jsp:useBean id="header" class= "datapro.eibs.beans.EDL015501Message"  scope="session"/>
<jsp:useBean id= "list" class= "datapro.eibs.beans.JBObjList"  scope="session"/>
<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session"/>
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage" scope="session"/>

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>
<script type="text/javascript">

function showDetailPay(rowNum) {
	document.forms[0].Row.value = rowNum;
	document.forms[0].submit();
}

function NewPayment() {
	document.forms[0].SCREEN.value = "5";
	document.forms[0].submit();
}

function UpdPayment() {
	document.forms[0].SCREEN.value = "6";
	document.forms[0].submit();
}

</SCRIPT>

</HEAD>

<BODY>

<% 
 if ( !error.getERRNUM().equals("0")  ) {
     error.setERRNUM("0");
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
 }
    %>

<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDL0155">
  <input TYPE=HIDDEN name="SCREEN" value="4">
  <input TYPE=HIDDEN NAME="opt" VALUE="1">
  <input TYPE=HIDDEN NAME="Row" VALUE="0">


  
  <h3 align="center">Plan de Pagos<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="ln_crn_pay.jsp , EDL0155"> 
  </h3>
  <hr size="4">

<h4></h4>

  <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
          <tr id="trdark"> 
            <td nowrap width="14%" > 
              <div align="right"><b>Cliente :</b></div>
            </td>
            <td nowrap width="9%" > 
              <div align="left"> 
                <input type="text" name="E01DEACUN" size="10" maxlength="9" readonly value="<%= userPO.getCusNum().trim()%>">
              </div>
            </td>
            <td nowrap width="12%" > 
              <div align="right"><b>Nombre :</b> </div>
            </td>
            <td nowrap > 
              <div align="left"> 
                <input type="text" name="E01CUSNA1" size="46" maxlength="45" readonly value="<%= userPO.getCusName().trim()%>">
              </div>
            </td>
            <td nowrap > 
              <div align="right"><b>Producto : </b></div>
            </td>
            <td nowrap ><b> 
              <input type="text" name="E01DEASPRO" size="5" maxlength="4" readonly value="<%= userPO.getProdCode().trim()%>">
              </b></td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="14%"> 
              <div align="right"><b>Cuenta :</b></div>
            </td>
            <td nowrap width="9%"> 
              <div align="left"> 
                <input type="text" name="E01DEAACC" size="13" maxlength="12" value="<%= userPO.getAccNum().trim()%>" readonly>
              </div>
            </td>
            <td nowrap width="12%"> 
              <div align="right"><b>Moneda : </b></div>
            </td>
            <td nowrap width="33%"> 
              <div align="left"><b> 
                <input type="text" name="E01DEACCY" size="4" maxlength="3" value="<%= userPO.getCurrency().trim()%>" readonly>
                </b> </div>
            </td>
            <td nowrap width="11%"> 
              <div align="right"></div>
            </td>
            <td nowrap width="21%"> 
              <div align="left"><b> 
                
                </b> </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <h4>&nbsp;</h4>
  <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
          <tr id="trdark"> 
            <td nowrap width="30%" > 
              <div align="right" >Fecha Apertura :</div>
            </td>
            <td nowrap width="20%"  > 
              <div align="right"><%= userPO.getHeader10().trim()%></div>
            </td>
            <td nowrap width="30%" > 
              <div align="right">Tasa de Interés :</div>
            </td>
            <td nowrap width="20%"  > 
              <div align="right"><%= userPO.getHeader13().trim()%></div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="30%" > 
              <div align="right">Fecha Vencimiento :</div>
            </td>
            <td nowrap width="20%" > 
              <div align="right"><%= userPO.getHeader11().trim()%></div>
            </td>
            <td nowrap width="30%" > 
              <div align="right">Periodo Base :</div>
            </td>
            <td nowrap width="20%" > 
              <div align="right"><%= userPO.getHeader14().trim()%></div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="30%" > 
              <div align="right">Monto Original  :</div>
            </td>
            <td nowrap width="20%" > 
              <div align="right"><%= userPO.getHeader12().trim()%></div>
            </td>
            <td nowrap width="30%" > 
              <div align="right">Tipo de Interés :</div>
            </td>
            <td nowrap width="20%" > 
              <div align="right">
	            <% if (userPO.getHeader15().trim().equals("S")) out.print("LINEAL/CALENDARIO/AL VENC.");
					else if (userPO.getHeader15().trim().equals("M")) out.print("LINEAL/COMRECIAL/AL VENC.");
					else if (userPO.getHeader15().trim().equals("P")) out.print("LINEAL/CALENDARIO/PREPAGADO");
					else if (userPO.getHeader15().trim().equals("A")) out.print("LINEAL/COMRECIAL/PREPAGADO");
					else if (userPO.getHeader15().trim().equals("D")) out.print("LINEAL/CALENDARIO/DESCONTADO");
					else if (userPO.getHeader15().trim().equals("R")) out.print("LINEAL/COMRECIAL/PREPAGADO");
					else if (userPO.getHeader15().trim().equals("1")) out.print("EXPON/CALENDARIO/AL VENC.");
					else if (userPO.getHeader15().trim().equals("2")) out.print("EXPON/COMRECIAL/AL VENC.");
					else if (userPO.getHeader15().trim().equals("3")) out.print("EXPON/CALENDARIO/PREPAGADO");
					else if (userPO.getHeader15().trim().equals("4")) out.print("EXPON/COMRECIAL/PREPAGADO");
					else if (userPO.getHeader15().trim().equals("5")) out.print("EXPON/CALENDARIO/DESCONTADO");
					else if (userPO.getHeader15().trim().equals("6")) out.print("EXPON/COMRECIAL/PREPAGADO");
					else out.print("");%>
              </div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="30%" > 
              <div align="right">C&aacute;lculo Inter&eacute;s Normal :</div>
            </td>
            <td nowrap width="20%"  > 
              <div align="right">
	            <% if (userPO.getHeader16().trim().equals("1")) out.print("CAPITAL VIGENTE");
							else if (userPO.getHeader16().trim().equals("2")) out.print("CAPITAL ORIGINAL");
							else if (userPO.getHeader16().trim().equals("3")) out.print("CAPITAL VIGENTE - VENCIDO");
							else if (userPO.getHeader16().trim().equals("N")) out.print("NO CALCULA INTERES");
							else out.print("");%>
			  </div>
            </td>
            <td nowrap width="30%" > 
              <div align="right">C&aacute;lculo Inter&eacute;s Mora :</div>
            </td>
            <td nowrap width="20%" > 
              <div align="right">
	              <% if (userPO.getHeader17().trim().equals("1")) out.print("CAPITAL VENCIDO");
						else if (userPO.getHeader17().trim().equals("2")) out.print("CAPITAL ORIGINAL");
						else if (userPO.getHeader17().trim().equals("3")) out.print("CAPITAL VIGENTE");
						else if (userPO.getHeader17().trim().equals("4")) out.print("CAPITAL + INTERES VENCIDO");
						else if (userPO.getHeader17().trim().equals("N")) out.print("NO CALCULA INTERES");
						else out.print("");%>
			 </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <BR>
  
	<% if (userPO.getHeader18().trim().equals("SC1")) { %>
  <table width="100%" border="0" cellspacing="0" cellpadding="0" bgcolor="#FFFFFF" bordercolor="#FFFFFF">
    <tr bgcolor="#FFFFFF"> 
      <td width="33%" align="center"> 
       		<input id="EIBSBTN" type=button name="Submit" value="Interes Diferido" onClick="UpdPayment();" >
  	  </td>     
    </tr>    
  </table>  
	<% } %>
  
  <TABLE class="tableinfo">
    <TR id="trdark"> 
      <TH ALIGN=CENTER  nowrap >Numero <BR> Cuota</TH>
      <TH ALIGN=CENTER nowrap >Fecha <BR> Vencimiento</TH>
      <TH ALIGN=CENTER nowrap >Monto <BR> Capital</TH>
      <TH ALIGN=CENTER nowrap >Monto <BR> Interés</TH>
      <TH ALIGN=CENTER nowrap >Otros <BR> Cargos</TH>
      <TH ALIGN=CENTER nowrap  >Total <BR> a Pagar</TH>
      <TH ALIGN=CENTER nowrap >Balance</TH>
      <TH ALIGN=CENTER nowrap >Estado</TH>
      <TH ALIGN=CENTER nowrap >Dias <BR> Mora</TH>
      <TH ALIGN=CENTER nowrap >Fecha <BR> Pago</TH>
      <TH ALIGN=CENTER nowrap >Monto <BR> Pagado</TH>
    </TR>
    <%
                list.initRow();
                while (list.getNextRow()) {
                	EDL015502Message msg = (EDL015502Message)list.getRecord();
	%> 
    <TR> 
      <TD ALIGN=CENTER  nowrap ><A HREF="javascript:showDetailPay(<%= list.getCurrentRow()%>)"><%=msg.getE02DLPPNU()%></A></TD>
      <TD ALIGN=CENTER  nowrap ><A HREF="javascript:showDetailPay(<%= list.getCurrentRow() %>)"><%=Util.formatCustomDate(currUser.getE01DTF(),msg.getBigDecimalE02DLPPDM().intValue(),msg.getBigDecimalE02DLPPDD().intValue(),msg.getBigDecimalE02DLPPDY().intValue())%></A></TD>
      <TD ALIGN=RIGHT   nowrap ><A HREF="javascript:showDetailPay(<%= list.getCurrentRow() %>)"><%= msg.getE02DLPPRN() %></A></TD>
      <TD ALIGN=RIGHT   nowrap ><A HREF="javascript:showDetailPay(<%= list.getCurrentRow() %>)"><%= msg.getE02DLPINT() %></A></TD>
      <TD ALIGN=RIGHT   nowrap ><A HREF="javascript:showDetailPay(<%= list.getCurrentRow() %>)"><%= msg.getE02DLPOTH() %></A></TD>
      <TD ALIGN=RIGHT   nowrap ><A HREF="javascript:showDetailPay(<%= list.getCurrentRow() %>)"><%= msg.getE02DLPTOT() %></A></TD>
      <TD ALIGN=RIGHT   nowrap ><A HREF="javascript:showDetailPay(<%= list.getCurrentRow() %>)"><%= msg.getE02DLPBAL() %></A></TD>
      <TD ALIGN=CENTER  nowrap ><A HREF="javascript:showDetailPay(<%= list.getCurrentRow() %>)"><%= msg.getE02DLPSTS() %></A></TD>
      <TD ALIGN=RIGHT   nowrap ><A HREF="javascript:showDetailPay(<%= list.getCurrentRow() %>)"><%= msg.getE02DLPVEN() %></A></TD>
      <TD ALIGN=CENTER  nowrap ><A HREF="javascript:showDetailPay(<%= list.getCurrentRow() %>)"><%=Util.formatCustomDate(currUser.getE01DTF() ,msg.getBigDecimalE02DLPDTM().intValue(),msg.getBigDecimalE02DLPDTD().intValue(),msg.getBigDecimalE02DLPDTY().intValue())%></A></TD>
      <TD ALIGN=RIGHT   nowrap ><A HREF="javascript:showDetailPay(<%= list.getCurrentRow() %>)"><%= msg.getE02DLPPAG() %></A></TD>
    </TR>
    <%
                }
    %> 
  </TABLE>
  <BR>
  <table width="100%" border="0" cellspacing="0" cellpadding="0" bgcolor="#FFFFFF" bordercolor="#FFFFFF">
    <tr bgcolor="#FFFFFF"> 
      <td width="33%" align="center"> 
       		<input id="EIBSBTN" type=button name="Submit" value="Agregar" onClick="NewPayment();" >
  	  </td>     
   	  
    </tr>    
  </table>  
</FORM>

</BODY>
</HTML>
