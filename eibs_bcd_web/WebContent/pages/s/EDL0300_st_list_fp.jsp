<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<%@ page import = "datapro.eibs.master.Util" %>
<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@ page import="com.datapro.constants.EibsFields" %>

<HTML>
<HEAD>
<TITLE> Lista de Clientes </TITLE>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
</HEAD>

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "cifList" class= "datapro.eibs.beans.JBList"  scope="session" />
<jsp:useBean id="stBalances" class="datapro.eibs.beans.EDL030002Message"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>
<jsp:useBean id="currUser" class="datapro.eibs.beans.ESS0030DSMessage" scope="session" />

<BODY>

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>

<SCRIPT type="text/javascript">
<% if (userPO.getPurpose().equals("INQUIRY")){ %>
	   builtNewMenu(cd_i_opt);
<% } %>

function PrintPreview() {

  <% 
  int iniPos = cifList.getFirstRec() - 1;
  out.println("var pos = " + iniPos + ";");
  %>
	var pg = '<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSEDL0300?SCREEN=4&Pos=' + pos;
	CenterWindow(pg,720,500,2);

}

</SCRIPT>

<% 
 if ( !error.getERRNUM().equals("0")  ) {
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
   		out.print("<center><h3>No hay resultados que correspondan a su criterio de búsqueda</h3></center>");
	}
	else {
%>
  <h3 align="center">Estado de Cuentas<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="st_list_fp.jsp,EDL0300"> 
  </h3>
  <hr size="4">
  <br>
  
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
              <input type="text" name="E02PTYP" size="5" maxlength="4" readonly value="<%= userPO.getType().trim()%>">
              <input type="text" name="E02PRO2" size="5" maxlength="4" readonly value="<%= userPO.getProdCode().trim()%>">
              </b></td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="14%"> 
              <div align="right"><b>Cuenta :</b></div>
            </td>
            <td nowrap width="9%"> 
              <div align="left"> 
                <input type="text" name="E02ACC" size="13" maxlength="12" value="<%= userPO.getIdentifier().trim()%>" readonly>
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
        </table>
      </td>
    </tr>
  </table>
 
  <h4>Datos del Oficial</h4>
  
  <%int row = 0; %>
  <table class="tableinfo">
    <tr> 
      <td > 
        <table cellspacing=0 cellpadding=2 width="100%" border="0">
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap width="25%"> 
              <div align="right"><b>Correo Electr&oacute;nico : </b></div>
            </td>
            <td width="25%"> 
              <div align="Left"><a href="mailto:<%= stBalances.getE02OFCEML().trim()%>" target="body"><%= stBalances.getE02OFCEML().trim()%></a></div>
            </td>
            <td width="25%"> 
              <div align="right"><b>Oficina :</b></div>
            </td>
            <td nowrap> 
              <div align="left"><%= stBalances.getE02OFCAOF().trim()%></div>
            </td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
            <td width="25%"> 
              <div align="right"><b>Tel&eacute;fono :</b></div>
            </td>
            <td width="25%"> 
              <div align="left"><%= stBalances.getE02OFCPHN()%></div>
            </td>
            <td nowrap width="25%"> 
              <div align="right"><b>Extensi&oacute;n :</b></div>
            </td>
            <td> 
              <div align="left"><%= stBalances.getE02OFCPXT()%></div>
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
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td  width="25%"  nowrap> 
              <div align="right"><b>Nombre :</b></div>
            </td>
            <td  width="25%" > 
              <div align="left"></div>
              <%= stBalances.getE02CUMNME().trim()%></td>
            <td  width="25%" > 
              <div align="right"><b>Saldo</b> <%= stBalances.getE02DEACCY().trim()%> 
                <b>Principal :</b></div>
            </td>
            <td  width="25%"  nowrap> 
              <div align="left"><%= Util.fcolorCCY(stBalances.getE02DEAMEP().trim())%></div>
            </td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td  width="25%"> 
              <div align="right"><b>Direcci&oacute;n :</b></div>
            </td>
            <td  width="25%" nowrap> 
              <div align="left"></div>
              <%= stBalances.getE02CUMMA1().trim()%></td>
            <td  width="25%" nowrap> 
              <div align="right"><b>Saldo Inter&eacute;s :</b></div>
            </td>
            <td  width="25%"> 
              <div align="left"><%= Util.fcolorCCY(stBalances.getE02DEAMEI().trim())%></div>
            </td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td  width="25%" nowrap> 
              <div align="right"><b> </b></div>
            </td>
            <td  width="25%"> 
              <div align="left"></div>
              <%= stBalances.getE02CUMMA2().trim()%></td>
            <td  width="25%" nowrap> 
              <div align="right"><b>Saldo Total :</b></div>
            </td>
            <td  width="25%"> 
              <div align="left"><%= Util.fcolorCCY(stBalances.getE02TOTAMN().trim())%></div>
            </td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
            <td  width="25%" nowrap> 
              <div align="right"></div>
            </td>
            <td  width="25%" nowrap> 
              <div align="left"></div>
              <%= stBalances.getE02CUMMA3().trim()%></td>
            <td  width="25%" nowrap> 
              <div align="right"><b>Tasa de Inter&eacute;s :</b></div>
            </td>
            <td  width="25%"> 
              <div align="left"><%= stBalances.getE02DEARTE().trim()%></div>
            </td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td  width="25%" nowrap> 
              <div align="right"></div>
            </td>
            <td  width="25%" nowrap> 
              <div align="left"></div>
              <%= stBalances.getE02CUMMA4().trim()%></td>
            <td  width="25%" nowrap> 
              <div align="right"><b>Fecha de Apertura :</b></div>
            </td>
            <td  width="25%"> 
              <div align="left"> <%= Util.formatCustomDate(currUser.getE01DTF(), stBalances.getE02OPENDM(),stBalances.getE02OPENDD(),stBalances.getE02OPENDY())%></div>
            </td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
            <td  width="25%"> 
              <div align="right"><b>Telefonos :</b></div>
            </td>
            <td  width="25%" nowrap> 
              <div align="left"></div>
              <%= stBalances.getE02CUSPHN().trim()%> <%= stBalances.getE02CUSHPN().trim()%>
             </td>
            <td  width="25%" nowrap> 
              <div align="right"><b>Fecha Vencimiento :</b></div>
            </td>
            <td  width="25%" nowrap> 
              <div align="left"> <%= Util.formatCustomDate(currUser.getE01DTF(), stBalances.getE02MATURM(),stBalances.getE02MATURD(),stBalances.getE02MATURY())%> </div>
            </td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
            <td  width="25%"> 
              <div align="right"><b>Numero Fax :</b></div>
            </td>
            <td  width="25%" nowrap> 
              <div align="left"> <%= stBalances.getE02CUSFAX().trim()%> </div>
            </td>
            <td  width="25%" nowrap> 
              <div align="right"><b>Ultima Renovaci&oacute;n :</b></div>
            </td>
            <td  width="25%" nowrap> 
              <div align="left"> <%= Util.formatCustomDate(currUser.getE01DTF(), stBalances.getE02LSTRDM(),stBalances.getE02LSTRDD(),stBalances.getE02LSTRDY())%> </div>
            </td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
            <td  width="25%"> 
              <div align="right"><b>Pagina Web :</b></div>
            </td>
            <td  width="25%" nowrap> 
              <div align="left"><a href="mailto:<%= stBalances.getE02CUSWEB().trim()%>" target="body"><%= stBalances.getE02CUSWEB().trim()%></a></div>
            </td>
            <td  width="25%" nowrap> 
              <div align="right"><b>N&uacute;mero Renovaciones :</b></div>
            </td>
            <td  width="25%" nowrap> 
             <div align="left"><%= stBalances.getE02DEARON().trim()%></div>
            </td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
            <td  width="25%" nowrap > 
              <div align="right"><b>Correo Electr&oacute;nico :</b></div>
            </td>
            <td  width="25%" nowrap > 
              <div align="left"><a href="mailto:<%= stBalances.getE02CUSIAD().trim()%>" target="body"><%= stBalances.getE02CUSIAD().trim()%></a></div>
            </td>
            <td  width="25%" > 
              <div align="right"><b>Ultimo C&aacute;lculo Interes :</b></div>
            </td>
            <td  width="25%" nowrap > 
              <div align="left"><%= Util.formatCustomDate(currUser.getE01DTF(), stBalances.getE02LSTCLM(),stBalances.getE02LSTCLD(),stBalances.getE02LSTCLY())%> </div></td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  
  <h4 align="left">Transacciones</h4>
  <TABLE id=cfTable class="tableinfolist">
    <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
      <TH ALIGN=CENTER nowrap > Fecha <% if (userPO.getHeader8().trim().equals("B")) out.print("Proceso"); else out.print("Valor");%></TH>
      <TH ALIGN=CENTER nowrap > Fecha <% if (userPO.getHeader8().trim().equals("B")) out.print("Valor"); else out.print("Proceso");%></TH>
      <TH ALIGN=CENTER nowrap >Fecha de<br> Registro</TH>
      <TH ALIGN=CENTER nowrap > TC </TH>
      <TH ALIGN=CENTER nowrap > Descripci&oacute;n </TH>
      <TH ALIGN=CENTER nowrap > Principal </TH>
      <TH ALIGN=CENTER nowrap > </TH>
      <TH ALIGN=CENTER nowrap > Intereses </TH>
      <TH ALIGN=CENTER nowrap > </TH>
      <TH ALIGN=CENTER nowrap > Lote </TH>
      <TH ALIGN=CENTER nowrap > Hora </TH>
      <TH ALIGN=CENTER nowrap > Usuario </TH>
      <TH ALIGN=CENTER nowrap > Banco<br> Origen</TH>
      <TH ALIGN=CENTER nowrap > Sucursal<br> Origen</TH>
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
  
  <BR>
  
  <TABLE class="tbenter" WIDTH="98%" ALIGN=CENTER>
  <TR>
  <TD WIDTH="50%" ALIGN=LEFT>

<%
        if ( cifList.getShowPrev() ) {
      			int pos = cifList.getFirstRec() - 51;
      			out.println("<A HREF=\""+request.getContextPath()+"/servlet/datapro.eibs.client.JSEDL0300?SCREEN=1&Pos=" + pos +"\"><img src=\""+request.getContextPath()+"/images/s/previous_records.gif\" border=0></A>");
        }
 %> 
 	</TD>
 	<TD WIDTH="50%" ALIGN=RIGHT>
 <%      
        if ( cifList.getShowNext() ) {
      			int pos = cifList.getLastRec();
      			out.println("<A HREF=\""+request.getContextPath()+"/servlet/datapro.eibs.client.JSEDL0300?SCREEN=1&Pos=" + pos +"\"><img src=\""+request.getContextPath()+"/images/s/next_records.gif\" border=0></A>");
        }
%>
   </TD>
 	</TR>
 	</TABLE>

    
  <div align="center"> 
    <input id="EIBSBTN" type=button name="Submit" OnClick="PrintPreview()" value="Imprimir">
  </div>
<%
  }
%>
<SCRIPT type="text/javascript">
   var max=cfTable.rows.length;
     for(i= 0; i < max; i++){
      cfTable.rows[i].cells[2].style.display="none";
     }
  </SCRIPT> 
</FORM>

</BODY>
</HTML>
