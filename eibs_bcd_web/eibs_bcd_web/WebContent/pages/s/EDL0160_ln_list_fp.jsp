<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<%@ page import = "datapro.eibs.master.Util" %>
<HTML>
<HEAD>
<TITLE>Estado de Cuentas</TITLE>
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
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/Ajax.js"></script>

<SCRIPT type="text/javascript">
<%if (userPO.getPurpose().equals("INQUIRY")){%>

<%if ( userPO.getHeader23().equals("G") ||  userPO.getHeader23().equals("V")){%>
	builtNewMenu(ln_i_1_opt);
<%}else if (userPO.getHeader23().equals("DFT")){%>
	builtNewMenu(dft_i_opt);
<%}else{%>
	<%  if(!userPO.getHeader22().equals("CreditLines")) {%>
		builtNewMenu(ln_i_2_opt);
		initMenu();
	<%}else{%>
		builtNewMenu(crotat_inq_opt);
		initMenu();
	<%} %>
<%}%>
<%}%>

function PrintPreview() {

  <% 
  int iniPos = cifList.getFirstRec() - 1;
  out.println("var pos = " + iniPos + ";");
  %>
	var pg = '<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSEDL0300L?SCREEN=4&Pos=' + pos;
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

<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSEDL0300L" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="200">
  <h3 align="center">Estado de Cuentas<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="ln_list_fp.jsp,EDL0160"> 
  </h3>
  <hr size="4">
  <BR>
  <table class="tableinfo" style="width: 100%">
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
              <div align="right"><b>Nombre :</b></div>
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
              <input type="text" name="E02PTYP" size="4" maxlength="4" readonly value="<%= userPO.getType().trim()%>">
              <input type="text" name="E02PRO2" size="4" maxlength="4" readonly value="<%= userPO.getProdCode().trim()%>">
              </b></td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="14%"> 
              <div align="right"><b>Cuenta :</b></div>
            </td>
            <td nowrap width="9%"> 
              <div align="left"> 
                <input type="text" name="E02ACC" size="13" maxlength="12" value="<%= userPO.getAccNum().trim()%>" readonly>
              </div>
            </td>
            <td nowrap width="12%"> 
              <div align="right">Oficial :</div>
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
  <table class="tableinfo" style="width: 100%">
    <tr> 
      <td > 
        <table cellspacing=0 cellpadding=2 width="100%" border="0">
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
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
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
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
  <table class="tableinfo" style="width: 100%">
    <tr > 
      <td > 
        <table cellspacing=0 cellpadding=2 width="100%" border="0">
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
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
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
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
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
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
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
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
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
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
              <div align="left"> 
 				<%= datapro.eibs.master.Util.formatCustomDate(currUser.getE01DTF(),
															  stBalances.getBigDecimalE02OPENDM().intValue(),
															  stBalances.getBigDecimalE02OPENDD().intValue(),
															  stBalances.getBigDecimalE02OPENDY().intValue())%>
              </div>
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td  width="25%"> 
              <div align="right"><b>Telefono :</b></div>
            </td>
            <td  width="25%" nowrap> 
              <div align="left"></div>
              <%= stBalances.getE02CUSPHN().trim()%>
             </td>
            <td  width="25%" nowrap> 
              <div align="right"><b>Fecha Vencimiento :</b></div>
            </td>
            <td  width="25%" nowrap> 
              <div align="left"> 
 				<%= datapro.eibs.master.Util.formatCustomDate(currUser.getE01DTF(),
															  stBalances.getBigDecimalE02MATURM().intValue(),
															  stBalances.getBigDecimalE02MATURD().intValue(),
															  stBalances.getBigDecimalE02MATURY().intValue())%>
              </div>
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td  width="25%"> 
              <div align="right"><b>Numero Fax :</b></div>
            </td>
            <td  width="25%" nowrap> 
              <%= stBalances.getE02CUSFAX().trim()%>
            </td>
            <td  width="25%" nowrap> 
              <div align="right"><b>Ultima Renovaci&oacute;n :</b></div>
            </td>
            <td  width="25%" nowrap> 
              <div align="left">
 				<%= datapro.eibs.master.Util.formatCustomDate(currUser.getE01DTF(),
															  stBalances.getBigDecimalE02LSTRDM().intValue(),
															  stBalances.getBigDecimalE02LSTRDD().intValue(),
															  stBalances.getBigDecimalE02LSTRDY().intValue())%>
              </div>
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
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
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
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
              <div align="left">
 				<%= datapro.eibs.master.Util.formatCustomDate(currUser.getE01DTF(),
															  stBalances.getBigDecimalE02LSTCLM().intValue(),
															  stBalances.getBigDecimalE02LSTCLD().intValue(),
															  stBalances.getBigDecimalE02LSTCLY().intValue())%>
              </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  
  <%
	if ( cifList.getNoResult() ) {
   		out.print("<h4 align=\"right\">No hay resultados que correspondan a su criterio de búsqueda</h4>");
	}
	else {
  %>
  
  <h4 align="left">Transacciones</h4>
   <TABLE  id="mainTable" class="tableinfo"  >   
			<tr id="trdark"> 
		      <TH ALIGN=LEFT nowrap width="8%" >Fecha<br>Proceso</TH>
		      <TH ALIGN=CENTER nowrap width="1%" >Cod<br>trn</TH>
		      <TH ALIGN=CENTER nowrap width="20%" >Descripci&oacute;n </TH>
		      <TH ALIGN=CENTER nowrap width="6%" >Principal</TH>
		      <TH ALIGN=CENTER nowrap width="0%" >&nbsp;</TH>
		      <TH ALIGN=CENTER nowrap width="08%" >Intereses</TH>
		      <TH ALIGN=CENTER nowrap width="0%" >&nbsp;</TH>
		      <TH ALIGN=CENTER nowrap width="08%" >Mora</TH>
		      <TH ALIGN=CENTER nowrap width="0%" >&nbsp;</TH>
		      <TH ALIGN=CENTER nowrap width="08%" >Otros <br> Cargos</TH> 
		      <TH ALIGN=CENTER nowrap width="0%" >&nbsp;</TH>
		      <TH ALIGN=CENTER nowrap width="4%" >Lote</TH>
		      <TH ALIGN=CENTER nowrap width="6%" >Fecha<br>Valor</TH>
		      <TH ALIGN=CENTER nowrap width="2%" >Hora </TH> 
		      <TH ALIGN=CENTER nowrap width="6%" >Usuario</TH>
		      <TH ALIGN=CENTER nowrap width="2%" >Bco<br>Org</TH>
		      <TH ALIGN=CENTER nowrap width="3%" >Suc<br>Org</TH> 
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
<a id="TRANSACTIONS_LIST"></a>

  <BR>
  
  <TABLE class="tbenter" WIDTH="98%" ALIGN=CENTER>
  <TR>
  <TD WIDTH="45%" ALIGN=LEFT>
 <%
        if ( cifList.getShowPrev() ) {
      			int pos = cifList.getFirstRec() - 101;
      			out.println("<A HREF=\""+request.getContextPath()+"/servlet/datapro.eibs.client.JSEDL0300L?SCREEN=1&Pos=" + pos +"\"><img src=\""+request.getContextPath()+"/images/s/previous_records.gif\" border=0 onclick=pagination();></A>");
        }
%> 
	</TD>
	<%if (cifList.getShowPrev()||cifList.getShowNext()){%>
	  <td width="5%">
	   	<div id="userWait" style="background-color: white;"></div>
	  </td>	
	<%}%>
   <TD WIDTH="45%" ALIGN=RIGHT> 
 <%      
        if ( cifList.getShowNext() ) {
      			int pos = cifList.getLastRec();
      			out.println("<A HREF=\""+request.getContextPath()+"/servlet/datapro.eibs.client.JSEDL0300L?SCREEN=1&Pos=" + pos +"\"><img src=\""+request.getContextPath()+"/images/s/next_records.gif\" border=0 onclick=pagination();></A>");
        }
%>
   </TD>
  </TR>
  </TABLE>

  <p align=center>&nbsp; </p>

  <%
 	 }
  %> 
  
  <div align="center"> 
    <input id="EIBSBTN" type=button name="Submit" OnClick="PrintPreview()" value="Imprimir">
    <input id="EIBSBTN" type=button name="Submit" OnClick="goAction('200')" value="Regresar">
  </div>

</FORM>
<script type="text/javascript">
	function goAction(op){
		getElement("SCREEN").value = op;
		document.forms[0].submit();
	}
	

<% if ( cifList.getShowPrev() || cifList.getShowNext() ){%>
var paginationCounter= 0;

function pagination() {
	paginationCounter++;
	sessionStorage.setItem('fromPageSelection', "true");
	sessionStorage.setItem('fromClickNext', "true");	
  	callWaiting("userWait", "<%=request.getContextPath()%>/images/throbber.gif", "Esperando");
}

if(sessionStorage.getItem('fromPageSelection') == "true"){
	window.location.hash = "TRANSACTIONS_LIST" ;
	sessionStorage.setItem('fromPageSelection', "false");	
}
 
<%}%>
	window.onbeforeunload = function (event) {
		if(sessionStorage.getItem('fromClickNext') != "true"){
			sessionStorage.setItem('fromPageSelection', "false");
		}	
	};


</script>

</BODY>
</HTML>
