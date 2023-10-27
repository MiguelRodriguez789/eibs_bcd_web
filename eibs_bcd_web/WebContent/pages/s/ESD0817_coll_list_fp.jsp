<%@ page import = "datapro.eibs.master.Util" %>

<HTML>
<HEAD>
<TITLE>Estado de Cuentas de Cobranzas</TITLE>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
</HEAD>

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>
<jsp:useBean id= "cifList" class= "datapro.eibs.beans.JBList"  scope="session" />
<jsp:useBean id="lcBalances" class="datapro.eibs.beans.ESD081702Message"  scope="session" />
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />

<BODY>


<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>

<SCRIPT type="text/javascript">
function PrintPreview() {

  <% 
  int iniPos = cifList.getFirstRec() - 1;
  out.println("var pos = " + iniPos + ";");
  %>
	var pg = '<%=request.getContextPath()%>/servlet/datapro.eibs.trade.JSESD0817C?SCREEN=4&Pos=' + pos;
	CenterWindow(pg,720,500,2);

}

<%
   if (userPO.getPurpose().equals("INQUIRY")){ 
%>
       builtNewMenu(coll_i_opt);
        
<%
}
%>
</SCRIPT>

<% 
 if ( !error.getERRNUM().equals("0")  ) {
     error.setERRNUM("0");
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
 }
 if (userPO.getPurpose().equals("INQUIRY")){ 
   out.println("<SCRIPT> initMenu(); </SCRIPT>");}
%> 

<FORM>
<%
	if ( cifList.getNoResult() ) {
   		out.print("<center><h3>No hay resultados que correspondan a su criterio de b�squeda</h3></center>");
	}else {
%>
  <h3 align="center">Estado de Cuentas<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="coll_list_fp.jsp,ESD0817">
  </h3>
  <hr size="4">
<br>
<%int row = 0; %>
  <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="14%" > 
              <div align="right"><b>Cliente :</b></div>
            </td>
            <td nowrap width="9%" > 
              <div align="left"> 
                <input type="text" name="E02CUN2" size="9" maxlength="9" readonly value="<%= userPO.getHeader2().trim()%>">
              </div>
            </td>
            <td nowrap width="12%" > 
              <div align="right"><b>Nombre :</b> </div>
            </td>
            <td nowrap > 
              <div align="left"> 
                <input type="text" name="E02NA12" size="45" maxlength="45" readonly value="<%= userPO.getHeader3().trim()%>">
              </div>
            </td>
            <td nowrap > 
              <div align="right"><b>Producto : </b></div>
            </td>
            <td nowrap ><b> 
              <input type="text" name="E02PRO2" size="4" maxlength="4" readonly value="<%= userPO.getHeader1().trim()%>">
              </b></td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="14%"> 
              <div align="right"><b>Cuenta :</b></div>
            </td>
            <td nowrap width="9%"> 
              <div align="left"> 
                <input type="text" name="E02ACC" size="12" maxlength="12" value="<%= userPO.getIdentifier().trim()%>" readonly>
              </div>
            </td>
            <td nowrap width="12%"> 
              <div align="right"><b>Oficial :</b></div>
            </td>
            <td nowrap width="33%"> 
              <div align="left"><b> 
                <input type="text" name="E02NA122" size="45" maxlength="45" readonly value="<%= userPO.getOfficer().trim()%>">
                </b> </div>
            </td>
            <td nowrap width="11%"> 
              <div align="right"><b>Moneda : </b></div>
            </td>
            <td nowrap width="21%"> 
              <div align="left"><b> 
                <input type="text" name="E01DEACCY" size="3" maxlength="3" value="<%= userPO.getCurrency().trim()%>" readonly>
                </b> </div>
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"><td align="right" nowrap>Estado :</td><td colspan="5">
          <% if (lcBalances.getE02LCMSTS().equals("C")) out.print("Cancelado");
             else if (lcBalances.getE02LCMSTS().equals("X")) out.print("Con Aviso de Pago");
                   else if (lcBalances.getE02LCMSTS().equals("P"))
out.print("Pendiente");
             else out.print("Vigente"); %>
         </td></tr>
        </table>
      </td>
    </tr>
  </table>
  <h4>Datos del Oficial</h4>
  <table class="tableinfo">
    <tr> 
      <td > 
        <table cellspacing=0 cellpadding=2 width="100%" border="0">
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="25%"> 
              <div align="right"><b>Correo Electr&oacute;nico : </b></div>
            </td>
            <td width="25%"> 
              <div align="Left"><a href="mailto:<%= lcBalances.getE02OFCEML().trim()%>" target="body"><%= lcBalances.getE02OFCEML().trim()%></a></div>
            </td>
            <td width="25%"> 
              <div align="right"><b>Oficina :</b></div>
            </td>
            <td nowrap> 
              <div align="left"><%= lcBalances.getE02OFCAOF().trim()%></div>
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td width="25%"> 
              <div align="right"><b>Telefono</b></div>
            </td>
            <td width="25%"> 
              <div align="left"><%= lcBalances.getE02OFCPHN()%></div>
            </td>
            <td nowrap width="25%"> 
              <div align="right"><b>Extension : </b></div>
            </td>
            <td> 
              <div align="left"><%= lcBalances.getE02OFCPXT()%></div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <h4>Datos B&aacute;sicos de la Cuenta</h4>
  <table class="tableinfo">
    <tr > 
      <td > 
        <table cellspacing=0 cellpadding=2 width="100%" border="0">
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td  width="32%" height="15" nowrap> 
              <div align="right"><b>Direcci&oacute;n :</b></div>
            </td>
            <td  width="28%" height="15"> 
              <div align="left"><%= lcBalances.getE02CUMMA2().trim()%></div>
            </td>
            <td  width="25%" height="15"> 
              <div align="right"><b>Monto</b> <%= lcBalances.getE02CIFCCY().trim()%> 
                <b>Original :</b></div>
            </td>
            <td  width="15%" height="15" nowrap> 
              <div align="right"><%= Util.fcolorCCY(lcBalances.getE02AMOUN1().trim())%></div>
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td  width="32%"> 
              <div align="right"></div>
            </td>
            <td  width="28%" nowrap> 
              <div align="left"><%= lcBalances.getE02CUMMA3().trim()%></div>
            </td>
            <td  width="25%" nowrap> 
              <div align="right"><b>Saldo :</b></div>
            </td>
            <td  width="15%"> 
              <div align="right"><%= Util.fcolorCCY(lcBalances.getE02AMOUN2().trim())%></div>
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td  width="32%" nowrap> 
              <div align="right"><b> </b></div>
            </td>
            <td  width="28%"> 
              <div align="left"><%= lcBalances.getE02CUMMA4().trim()%></div>
            </td>
            <td  width="25%" nowrap> 
              <div align="right"><b>Saldo Negociado :</b></div>
            </td>
            <td  width="15%"> 
              <div align="right"><%= Util.fcolorCCY(lcBalances.getE02AMOUN3().trim())%></div>
            </td>
          </tr>
         <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td  width="32%" nowrap> 
              <div align="right"><b>Fecha de Emisi&oacute;n :</b></div>
            </td>
            <td  width="28%" nowrap> 
              <div align="left"><%= Util.formatCustomDate(currUser.getE01DTF(),
              											lcBalances.getBigDecimalE02DATEAM().intValue(),
              											lcBalances.getBigDecimalE02DATEAD().intValue(),
              											lcBalances.getBigDecimalE02DATEAY().intValue())%></div>
            </td>
            <td  width="25%" nowrap> 
              <div align="right"><b>Fecha de Expiraci&oacute;n :</b></div>
            </td>
            <td  width="15%"> 
              <div align="right"><%= Util.formatCustomDate(currUser.getE01DTF(),
              											lcBalances.getBigDecimalE02DATEBM().intValue(),
              											lcBalances.getBigDecimalE02DATEBD().intValue(),
              											lcBalances.getBigDecimalE02DATEBY().intValue())%></div>
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td  width="32%" height="20"> 
              <div align="right"><b>Facsimil :</b></div>
            </td>
            <td  width="28%" nowrap height="20"> 
              <div align="left"><%= lcBalances.getE02CUSFAX().trim()%></div>
            </td>
            <td  width="25%" nowrap height="20"> 
              <div align="right"><b>Correo Electr&oacute;nico :</b></div>
            </td>
            <td  width="15%" nowrap height="20"> 
              <div align="right"><a href="mailto:<%= lcBalances.getE02CUSIAD().trim()%>" target="body"><%= lcBalances.getE02CUSIAD().trim()%></a></div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <h4 align="left">Transacciones</h4>
  <TABLE class="tableinfo">
    <tr id="trdark"> 
      <TH ALIGN=CENTER nowrap >Fecha Proceso</TH>
      <TH ALIGN=CENTER  nowrap >Fecha Valor</TH>
      <TH ALIGN=CENTER  nowrap >TC</TH>
      <TH ALIGN=CENTER  nowrap >Descripci&oacute;n </TH>
      <TH ALIGN=CENTER  nowrap > D&eacute;bitos</TH>
      <TH ALIGN=CENTER  nowrap >Cr&eacute;ditos </TH>
      <TH ALIGN=CENTER nowrap >Lote</TH>
      <TH ALIGN=CENTER nowrap >Hora </TH>
      <TH ALIGN=CENTER nowrap >Usuario</TH>
      <TH ALIGN=CENTER nowrap >Banco<br>Originador</TH>
      <TH ALIGN=CENTER nowrap >Sucursal<br>Orginadora</TH>
    </TR>
    <%
                cifList.initRow();
                while (cifList.getNextRow()) {
                    if (cifList.getFlag().equals("")) {
                    		out.println(cifList.getRecord());
                    }
                }
              %> 
  </TABLE>

  <br>
  <table width="100%">
    <tr> 
      <td width="20%"> 
        <div align="center"><b>Totales</b></div>
      </td>
      <td width="45%"><b>D&eacute;bitos</b> : <%= userPO.getHeader19().trim()%></td>
      <td width="35%"><b>Cr&eacute;ditos </b> : <%= userPO.getHeader20().trim()%></td>
    </tr>
  </table>
  

  <div align="center"> 
    <p><input id="EIBSBTN" type=button name="Submit" OnClick="PrintPreview()" value="Imprimir"></p>
  </div>


<%
  }
%>
</FORM>

</BODY>
</HTML>
