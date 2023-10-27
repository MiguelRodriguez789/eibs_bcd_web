<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<%@ page import = "datapro.eibs.master.Util" %>
<HTML>
<HEAD>
<TITLE>
Reemisión de Estado de Cuenta
</TITLE>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Studio">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
</HEAD>

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "cifList" class= "datapro.eibs.beans.JBList"  scope="session" />
<jsp:useBean id="stBalances" class="datapro.eibs.beans.ECL018001Message"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />

<body >

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>

<SCRIPT type="text/javascript">
    
function doPrint(){
	if(!window.print){
       var msg ="Debe actualizar su navegador para imprimir";
	   alert(msg);
	   return;
	}
	
    window.focus();
	window.print();

	return;
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

<FORM>
<%
	if ( cifList.getNoResult() ) {
%>
 		<TABLE class="tbenter" width=100% height=100%>
 		<TR>
      <TD> 
        
      <div align="center"> <font size="3"><b> No hay datos que correspondan con su criterio de busqueda</b></font> 
      </div>
      </TD></TR>
   		</TABLE>
<%
	}
	else {
%>
  <img src="<%=request.getContextPath()%>/images/bfc.jpg" align="left" title="account_st_print.jsp, ECL0180">
  <h3 align="center">Estado de Cuenta Corriente</h3>
  <p>&nbsp;</p>
  <p>&nbsp;</p>
  <p>&nbsp;</p>
  <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
          <tr id="trdark"> 
            <td nowrap width="16%"> 
              <div align="right">Identificación del Cliente :</div>
            </td>
            <td nowrap width="16%"> 
              <div align="left"> 
              	<input type="text" name="E01STBTID" size="2" maxlength="1" value="<%= stBalances.getE01STBTID().trim()%>" readonly>
              	<input type="text" name="E01STBIDN" size="10" maxlength="9" value="<%= stBalances.getE01STBIDN().trim()%>" readonly>
              </div>
            </td>
            <td nowrap width="12%" > 
              <div align="right"><b>Nombre del Cliente :</b> </div>
            </td>
            <td nowrap > 
              <div align="left"> 
                <input type="text" name="E01STBNA1" size="45" maxlength="45" readonly value="<%= stBalances.getE01STBNA1().trim()%>">
              </div>
            </td>
            <td nowrap > 
            </td>
            <td nowrap ></td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <h4>Resumen</h4>
  <table class="tableinfo" width="75%">
    <tr> 
      <td > 
        <table cellspacing=0 cellpadding=2 width="100%" border="0">
          <tr id="trdark"> 
            <td width="40%"> 
              <div align="left"><b> Saldo al </b><%= Util.formatCustomDate( currUser.getE01DTF(), stBalances.getE01STBLPM().trim(),stBalances.getE01STBLPD().trim(), stBalances.getE01STBLPY().trim())%> 
                <b>: </b></div>
            </td>
            <td width="30%"></td>
            <td width="30%"><div align="right"><%= Util.fcolorCCY(stBalances.getE01STBGAV().trim())%></div></td>
          </tr>
          <tr id="trclear"> 
            <td width="40%"> 
              <div align="left"><b>Créditos : </b></div>
            </td>
            <td width="30%"><div align="center"><%= Util.formatCell(stBalances.getE01CANCRE().trim())%></div></td>
            <td width="30%"><div align="right"><%= Util.fcolorCCY(stBalances.getE01STBOIA().trim())%></div></td>
          </tr>
          <tr id="trdark"> 
            <td width="40%"> 
              <div align="left"><b>Débitos : </b></div>
            </td>
            <td width="30%"><div align="center"><%= Util.formatCell(stBalances.getE01CANDEB().trim())%></div></td>
            <td width="30%"><div align="right"><%= Util.fcolorCCY(stBalances.getE01MTOCAR().trim())%></div></td>
          </tr>
          <tr id="trclear"> 
            <td width="40%"> 
              <div align="left"><b> Saldo al </b><%= Util.formatCustomDate( currUser.getE01DTF(), stBalances.getE01STBTMM().trim(), stBalances.getE01STBTMD().trim(), stBalances.getE01STBTMY().trim())%> 
                <b>: </b></div>
            </td>
            <td width="30%"></td>
            <td width="30%"><div align="right"><%= Util.fcolorCCY(stBalances.getE01STBMNB().trim())%></div></td>
          </tr>
          <tr id="trdark"> 
            <td width="40%"> 
              <div align="left"><b>Cheques Pagados : </b></div>
            </td>
            <td width="30%"><div align="center"><%= Util.formatCell(stBalances.getE01CANCHP().trim())%></div></td>
            <td width="30%"><div align="right"><%= Util.fcolorCCY(stBalances.getE01MTOCHE().trim())%></div></td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <h4 align="left">Transacciones</h4>
  <table id=cfTable class="tableinfo">
    <tr> 
      <th align=CENTER nowrap>Fecha Valor</th>
      <th align=CENTER nowrap>Referencia</th>
      <th align=CENTER nowrap>TC</th>
      <th align=CENTER nowrap>Descripci&oacute;n </th>
      <th align=CENTER nowrap> 
        <div align="right">D&eacute;bito</div>
      </th>
      <th align=CENTER nowrap> 
        <div align="center">Cr&eacute;dito</div>
      </th>
      <th align=CENTER nowrap> 
        <div align="center">Saldo</div>
      </th>
      <th align=CENTER nowrap>Fecha Proceso </th>
      <th align=CENTER nowrap>Usuario </th>
    </tr>
    <%
                cifList.initRow();
                while (cifList.getNextRow()) {
                    if (cifList.getFlag().equals("")) {
                    		out.println(cifList.getRecord());
                    }
                }
              %> 
  </table>
  <%
  }
%> 
  <SCRIPT type="text/javascript">
   if (typeof(cfTable) != "undefined"){
		var max=cfTable.rows.length;
     	for(i= 1; i < max; i++){
      		cfTable.rows[i].cells[1].style.display="none";
     	}
    }

	doPrint();
  </SCRIPT>
</FORM>

</BODY>
</HTML>
