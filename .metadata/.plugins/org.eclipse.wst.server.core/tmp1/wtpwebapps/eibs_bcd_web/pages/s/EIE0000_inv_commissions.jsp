<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<%@ page import = "datapro.eibs.master.Util" %> 
<%@ page import = "datapro.eibs.master.Util" %>
<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@ page import="com.datapro.constants.EibsFields"%>
<%@ page import = "datapro.eibs.master.Util" %>
<%@ page import="com.datapro.eibs.constants.HelpTypes"%>

<html>
<head>
<%@ page import = "datapro.eibs.master.*,datapro.eibs.beans.*" %>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">

<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/jquery/plugins/contextMenu/css/jquery.contextMenu.css" rel="stylesheet" type="text/css" />

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "msgRcd" class= "datapro.eibs.beans.EIE000001Message"  scope="session" />
<jsp:useBean id= "userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script src="<%=request.getContextPath()%>/jquery/readOnlyPage.jsp"></script>
<SCRIPT type="text/javascript">


<%
	String read = "";
 	String disabled = "";
 	boolean readOnly = false;
 	String mandatory = "<img src=\"" + request.getContextPath() + "/images/Check.gif\" alt=\"Campo Obligatorio\" align=\"bottom\" border=\"0\" >";
 	String help = "<img src=\"" + request.getContextPath() + "/images/1b.gif\" title=\"Ayuda\" align=\"bottom\" border=\"0\" >";
 	if (!(userPO.getPurpose().equals("NEW") || userPO.getPurpose().equals("MAINTENANCE"))) 
		{ read = " readonly ";
		  disabled = " disabled"; 
		  mandatory = "";
		  readOnly = true;
	}	
 	boolean isInquiry = (userPO.getPurpose().equals("INQUIRY") || userPO.getPurpose().equals("APPROVAL"));
 	boolean isReadOnly = isInquiry;
 	String readMnt = (userPO.getPurpose().equals("NEW")?"":" readonly");
 	boolean readMntB = (userPO.getPurpose().equals("NEW")?false:true);
 	String disabledMnt = (userPO.getPurpose().equals("NEW")?"":" disabled");
 	if (isInquiry) {
 	  help = "";
 	}
%>

$(document).ready(function(){
  	
  	$("#E01COMACD").on("propertychange change keyup paste click paste", function(){
    showTypeAcd(); })
});
function goAction(op) {
	document.forms[0].SCREEN.value = op;
	if (op == 4) {
		if (!confirm("Desea borrar este registro?")) {
			return;
		}
		}
	submitForm();
}

</SCRIPT>

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

<h3 align="center">Mantenimiento de Comisiones de Inversiones<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" 
	name="EIBS_GIF" title="inv_commissions.jsp, EIE0000"></h3>
<hr size="4">


<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.invest.JSEIE0000" >

  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="5">
  
 	<table  class="tableinfo" width="100%">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          	<tr id="trdark">
				<td nowrap width=10% align="right">Banco / Número de Tabla : </td>
				<td nowrap width=40% align="left">
					<input type="text" name="E01COMBNK" size="3" maxlength="2" value="<%= msgRcd.getE01COMBNK() %>" onkeypress="enterInteger(event)" <%= readMnt%>>
					<input type="text" name="E01COMTBL" size="3" maxlength="2" value="<%= msgRcd.getE01COMTBL() %>" onkeypress="enterInteger(event)" <%= readMnt%>>
					<%=mandatory %>
				</td>
            	<td nowrap width=10% align="right">Descripción de la Tabla : </td>
            	<td nowrap width=40% align="left">
            		<input type="text" name="E01COMDE0" size="55" maxlength="40" value="<%= msgRcd.getE01COMDE0().trim()%>" <%=read%>>
              		<%=mandatory %>
       			</td>
	  		</tr>
          	<tr id="trclear"> 
            	<td nowrap width="10%" align="right">Aplicación : </td>
            	<td nowrap width=40% align="left"> 
              		<SELECT name="E01COMACD" id="E01COMACD" <%=disabledMnt%> onclick="showTypeAcd()">
              		<OPTION value="  " <%if (!msgRcd.getE01COMACD().contains("65_66_67_68_69_CS")) out.print("selected"); %>> </OPTION>
					<OPTION value="65" <%if (msgRcd.getE01COMACD().equals("65")) out.print("selected"); %>>COMODITIES</OPTION>
					<OPTION value="66" <%if (msgRcd.getE01COMACD().equals("66")) out.print("selected"); %>>ACCIONES</OPTION>
					<OPTION value="67" <%if (msgRcd.getE01COMACD().equals("67")) out.print("selected"); %>>FONDOS MUTUOS</OPTION>
					<OPTION value="68" <%if (msgRcd.getE01COMACD().equals("68")) out.print("selected"); %>>BONOS</OPTION>
					<OPTION value="69" <%if (msgRcd.getE01COMACD().equals("69")) out.print("selected"); %>>ACCIONES PREFERENCIALES</OPTION>
					<OPTION value="CS" <%if (msgRcd.getE01COMACD().equals("CS")) out.print("selected"); %>>CUSTODIA</OPTION>
				</SELECT>
					<%=mandatory %>			
				</td>
				<td nowrap width=10% align="right">Tipo de Producto : </td>
           		<td nowrap width=40% align="left">
              		<input type="text" name="E01COMTYP" size="5" maxlength="4" value="<%= msgRcd.getE01COMTYP() %>" <%= readMnt%>>
              		<input type="text" name="D01DESTYP" size="25" maxlength="25" value="<%= msgRcd.getD01DESTYP()%>" readonly>
              		<% if (!readMntB) { %>
					<a href="javascript:GetCNOFCFilteredCodes('E01COMTYP','D01DESTYP', document.forms[0].E01COMACD.value,'04')"><%=help%></a>
					<% } %>
					<%=mandatory %>
       			</td>
          </tr>
          <tr id="trdark">
            	<td nowrap width="10%" align="right">Número de Cliente : </td>
            	<td nowrap width=40% align="left"> 
              		<input type="text" name="E01COMCUN" size="12" maxlength="9" value="<%= msgRcd.getE01COMCUN().trim()%>" <%=readMnt%>>
              		<input type="text" name="D01DESCDE" size="25" maxlength="25" value="<%= msgRcd.getD01DESCDE()%>" readonly>
              		<% if (!readMntB) { %>
              		<a href="javascript:GetCustomerDescId('E01COMCUN','D01DESCDE','')"><%=help%></a>
              		<% } %> 
				</td>
				<td nowrap width=10% align="right">Moneda de Comisión : </td>
           		<td nowrap width=40% align="left">
           			<input type="text" name="E01COMCCY" size="4" maxlength="3" value="<%= msgRcd.getE01COMCCY().trim()%>" <%=read%>>
              		<a href="javascript:GetCurrency('E01COMCCY','')"><%=help%></a>
              		<%=mandatory %>
       			</td>           
          </tr>
        </table>
      </td>
    </tr>
   </table>
   
   <div id="hiddenDivCST">
  <h4>Información Custodia Para Calculo Diario de Intereses Unicamente (Factor D y J)</h4>  
  
  <table  class="tableinfo">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
        	<tr id="clear">
			<td nowrap width="10%" align="right">Base de Cálculo :</td>
			<td nowrap width=40% align="left">
				<INPUT type="text" name="E01COMBAS" size="4" maxlength="3" onKeyPress="enterInteger()" value="<%= msgRcd.getE01COMBAS()%>"> Tipo :
				<SELECT name="E01COMICT">
					<OPTION value=" "
						<%if (!(msgRcd.getE01COMICT().equals("S") || msgRcd.getE01COMICT().equals("M")))	out.print("selected"); %>></OPTION>
					<OPTION value="S"
						<%if (msgRcd.getE01COMICT().equals("S")) out.print("selected"); %>>Dia Calendario</OPTION>
					<OPTION value="M"
						<%if (msgRcd.getE01COMICT().equals("M")) out.print("selected"); %>>Dia Comercial</OPTION>
				</SELECT>
			</td>
			<td nowrap width="10%" align="right">Dia de Pago :</td>
			<td nowrap width=40% align="left">
				<INPUT type="text" name="E01COMDAY" size="3" maxlength="2" onKeyPress="enterInteger()" value="<%= msgRcd.getE01COMDAY()%>">
				(31 Cada Fin de Mes - No Valido para frecuencia &quot;I&quot;)
			</td>
		</tr>
		<tr id="dark">
			<td nowrap width="10%" align="right">Exonera con :</td>
			<td nowrap width=40% align="left">
			    <INPUT type="text" name="E01COMTRN" size="3" maxlength="2" onKeyPress="enterInteger()" value="<%= msgRcd.getE01COMTRN()%>">
			    Transacciones (Solo Valido para factor "J")
			</td>
			<td nowrap width="10%" align="right">Monto Mínimo :</td>
			<td nowrap width=40% align="left">
			    <INPUT type="text" name="E01COMMMI" size="12" maxlength="10" onKeyPress="enterDecimal()" value="<%= msgRcd.getE01COMMMI()%>">
			    Cuenta Custodia (Solo Valido para factor "J")
			</td>
		</tr> 
    	</table>
      </td>
    </tr>
  </table>
</div> 


  <h4>Valores</h4>
  <table  class="tableinfo" >
    <tr > 
      <td nowrap> 
        <table cellpadding=2 cellspacing=0 width="100%" border="0">
          <tr id="trdark"> 
            <td nowrap > 
              <div align="center">Rango <BR>
                Bajo</div>
            </td>
            <td nowrap > 
              <div align="center">Rango <BR>
                Alto</div>
            </td>
            <td nowrap > 
              <div align="center">Tarifa</div>
            </td>
            <td nowrap > 
              <div align="center">Monto <BR>
                Minimo</div>
            </td>
            <td nowrap > 
              <div align="center">Monto <BR>
                Maximo</div>
            </td>
            <td nowrap > 
              <div align="center">Factor</div>
            </td>
            <td nowrap > 
              <div align="center">Frec.</div>
            </td>
            <td nowrap > 
              <div align="center">Banco</div>
            </td>
            <td nowrap > 
              <div align="center">CCY</div>
            </td>
            <td nowrap > 
              <div align="center">C/Contable</div>
            </td>
            <td nowrap > 
              <div align="center">Narrativa</div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap > 
              <div align="center"> 
                <input type="text" name="E01COMRI1" size="16" maxlength="15" onKeyPress="enterDecimal()" value="<%= msgRcd.getE01COMRI1()%>">
              </div>
            </td>
            <td nowrap > 
              <div align="center"> 
                <input type="text" name="E01COMRF1" size="16" maxlength="15" onKeyPress="enterDecimal()" value="<%= msgRcd.getE01COMRF1()%>">
              </div>
            </td>
            <td nowrap > 
              <div align="center"> 
                <input type="text" name="E01COMVA1" size="16" maxlength="15" onKeyPress="enterDecimal()" value="<%= msgRcd.getE01COMVA1()%>">
              </div>
            </td>
            <td nowrap > 
              <div align="center"> 
                <input type="text" name="E01COMMI1" size="16" maxlength="15" onKeyPress="enterDecimal()" value="<%= msgRcd.getE01COMMI1()%>">
              </div>
            </td>
            <td nowrap > 
              <div align="center"> 
                <input type="text" name="E01COMMA1" size="16" maxlength="15" onKeyPress="enterDecimal()" value="<%= msgRcd.getE01COMMA1()%>">
              </div>
            </td>
            <td nowrap > 
              <div align="center"> 
                <input type="text" name="E01COMFA1" size="3" maxlength="1"
	              class="context-menu-help" onmousedown="init(staticFactHelp,this.name)" value="<%= msgRcd.getE01COMFA1()%>">
              </div>
            </td>
            <td nowrap > 
              <div align="center"> 
                <input type="text" name="E01COMFR1" size="3" maxlength="1"
	              class="context-menu-help" onmousedown="init(staticFrecHelp,this.name)" value="<%= msgRcd.getE01COMFR1()%>">
              </div>
            </td>
            <td nowrap > 
              <div align="center"> 
                <input type="text" name="E01COMBK1" size="2" maxlength="2" value="<%= msgRcd.getE01COMBK1()%>">
              </div>
            </td>
            <td nowrap > 
              <div align="center"> 
                <input type="text" name="E01COMCY1" size="3" maxlength="3" value="<%= msgRcd.getE01COMCY1()%>"
	              class="context-menu-help" onmousedown="init(currencyHelp,this.name,document.forms[0].E01COMBK1.value,'','','','')">
              </div>
            </td>
            <td nowrap > 
              <div align="center"> 
                <input type="text" name="E01COMGL1" size="17" maxlength="16" value="<%= msgRcd.getE01COMGL1()%>" 
	              class="context-menu-help" onmousedown="init(ledgerHelp,this.name,document.forms[0].E01COMBK1.value,document.forms[0].E01COMCY1.value,'','','')" >
              </div>
            </td>
            <td nowrap > 
              <div align="left"> 
                <input type="text" name="E01COMDE1" size="25" maxlength="20" value="<%= msgRcd.getE01COMDE1()%>">
              </div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap > 
              <div align="center"> 
                <input type="text" name="E01COMRI2" size="16" maxlength="15" onKeyPress="enterDecimal()" value="<%= msgRcd.getE01COMRI2()%>">
              </div>
            </td>
            <td nowrap > 
              <div align="center"> 
                <input type="text" name="E01COMRF2" size="16" maxlength="15" onKeyPress="enterDecimal()" value="<%= msgRcd.getE01COMRF2()%>">
              </div>
            </td>
            <td nowrap > 
              <div align="center"> 
                <input type="text" name="E01COMVA2" size="16" maxlength="15" onKeyPress="enterDecimal()" value="<%= msgRcd.getE01COMVA2()%>">
              </div>
            </td>
            <td nowrap > 
              <div align="center"> 
                <input type="text" name="E01COMMI2" size="16" maxlength="15" onKeyPress="enterDecimal()" value="<%= msgRcd.getE01COMMI2()%>">
              </div>
            </td>
            <td nowrap > 
              <div align="center"> 
                <input type="text" name="E01COMMA2" size="16" maxlength="15" onKeyPress="enterDecimal()" value="<%= msgRcd.getE01COMMA2()%>">
              </div>
            </td>
            <td nowrap > 
              <div align="center"> 
                <input type="text" name="E01COMFA2" size="3" maxlength="1"
	              class="context-menu-help"
	              onmousedown="init(staticFactHelp,this.name)" value="<%= msgRcd.getE01COMFA2()%>">
              </div>
            </td>
            <td nowrap > 
              <div align="center"> 
                <input type="text" name="E01COMFR2" size="3" maxlength="1"
	              class="context-menu-help"
	              onmousedown="init(staticFrecHelp,this.name)" value="<%= msgRcd.getE01COMFR2()%>">
              </div>
            </td>
            <td nowrap > 
              <div align="center"> 
                <input type="text" name="E01COMBK2" size="2" maxlength="2" value="<%= msgRcd.getE01COMBK2()%>">
              </div>
            </td>
            <td nowrap > 
              <div align="center"> 
                <input type="text" name="E01COMCY2" size="3" maxlength="3" value="<%= msgRcd.getE01COMCY2()%>"
	              class="context-menu-help"
	              onmousedown="init(currencyHelp,this.name,document.forms[0].E01COMBK2.value,'','','','')">
              </div>
            </td>
            <td nowrap > 
              <div align="center"> 
                <input type="text" name="E01COMGL2" size="17" maxlength="16" value="<%= msgRcd.getE01COMGL2()%>"
	              class="context-menu-help"
	              onmousedown="init(ledgerHelp,this.name,document.forms[0].E01COMBK2.value,document.forms[0].E01COMCY2.value,'','','')"  >
              </div>
            </td>
            <td nowrap > 
              <div align="left"> 
                <input type="text" name="E01COMDE2" size="25" maxlength="20" value="<%= msgRcd.getE01COMDE2()%>">
              </div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap > 
              <div align="center"> 
                <input type="text" name="E01COMRI3" size="16" maxlength="15" onKeyPress="enterDecimal()" value="<%= msgRcd.getE01COMRI3()%>">
              </div>
            </td>
            <td nowrap > 
              <div align="center"> 
                <input type="text" name="E01COMRF3" size="16" maxlength="15" onKeyPress="enterDecimal()" value="<%= msgRcd.getE01COMRF3()%>">
              </div>
            </td>
            <td nowrap > 
              <div align="center"> 
                <input type="text" name="E01COMVA3" size="16" maxlength="15" onKeyPress="enterDecimal()" value="<%= msgRcd.getE01COMVA3()%>">
              </div>
            </td>
            <td nowrap > 
              <div align="center"> 
                <input type="text" name="E01COMMI3" size="16" maxlength="15" onKeyPress="enterDecimal()" value="<%= msgRcd.getE01COMMI3()%>">
              </div>
            </td>
            <td nowrap > 
              <div align="center"> 
                <input type="text" name="E01COMMA3" size="16" maxlength="15" onKeyPress="enterDecimal()" value="<%= msgRcd.getE01COMMA3()%>">
              </div>
            </td>
            <td nowrap > 
              <div align="center"> 
                <input type="text" name="E01COMFA3" size="3" maxlength="1"
	              class="context-menu-help"
	              onmousedown="init(staticFactHelp,this.name)" value="<%= msgRcd.getE01COMFA3()%>">
              </div>
            </td>
            <td nowrap > 
              <div align="center"> 
                <input type="text" name="E01COMFR3" size="3" maxlength="1"
	              class="context-menu-help"
	              onmousedown="init(staticFrecHelp,this.name)" value="<%= msgRcd.getE01COMFR3()%>">
              </div>
            </td>
            <td nowrap > 
              <div align="center"> 
                <input type="text" name="E01COMBK3" size="2" maxlength="2" value="<%= msgRcd.getE01COMBK3()%>">
              </div>
            </td>
            <td nowrap > 
              <div align="center"> 
                <input type="text" name="E01COMCY3" size="3" maxlength="3" value="<%= msgRcd.getE01COMCY3()%>"
	              class="context-menu-help"
	              onmousedown="init(currencyHelp,this.name,document.forms[0].E01COMBK3.value,'','','','')">
              </div>
            </td>
            <td nowrap > 
              <div align="center"> 
                <input type="text" name="E01COMGL3" size="17" maxlength="16" value="<%= msgRcd.getE01COMGL3()%>"
	              class="context-menu-help"
	              onmousedown="init(ledgerHelp,this.name,document.forms[0].E01COMBK3.value,document.forms[0].E01COMCY3.value,'','','')"  >
              </div>
            </td>
            <td nowrap > 
              <div align="left"> 
                <input type="text" name="E01COMDE3" size="25" maxlength="20" value="<%= msgRcd.getE01COMDE3()%>">
              </div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap > 
              <div align="center"> 
                <input type="text" name="E01COMRI4" size="16" maxlength="15" onKeyPress="enterDecimal()" value="<%= msgRcd.getE01COMRI4()%>">
              </div>
            </td>
            <td nowrap > 
              <div align="center"> 
                <input type="text" name="E01COMRF4" size="16" maxlength="15" onKeyPress="enterDecimal()" value="<%= msgRcd.getE01COMRF4()%>">
              </div>
            </td>
            <td nowrap > 
              <div align="center"> 
                <input type="text" name="E01COMVA4" size="16" maxlength="15" onKeyPress="enterDecimal()" value="<%= msgRcd.getE01COMVA4()%>">
              </div>
            </td>
            <td nowrap > 
              <div align="center"> 
                <input type="text" name="E01COMMI4" size="16" maxlength="15" onKeyPress="enterDecimal()" value="<%= msgRcd.getE01COMMI4()%>">
              </div>
            </td>
            <td nowrap > 
              <div align="center"> 
                <input type="text" name="E01COMMA4" size="16" maxlength="15" onKeyPress="enterDecimal()" value="<%= msgRcd.getE01COMMA4()%>">
              </div>
            </td>
            <td nowrap > 
              <div align="center"> 
                <input type="text" name="E01COMFA4" size="3" maxlength="1"
	              class="context-menu-help"
	              onmousedown="init(staticFactHelp,this.name)" value="<%= msgRcd.getE01COMFA4()%>">
              </div>
            </td>
            <td nowrap > 
              <div align="center"> 
                <input type="text" name="E01COMFR4" size="3" maxlength="1"
	              class="context-menu-help"
	              onmousedown="init(staticFrecHelp,this.name)" value="<%= msgRcd.getE01COMFR4()%>">
              </div>
            </td>
            <td nowrap > 
              <div align="center"> 
                <input type="text" name="E01COMBK4" size="2" maxlength="2" value="<%= msgRcd.getE01COMBK4()%>">
              </div>
            </td>
            <td nowrap > 
              <div align="center"> 
                <input type="text" name="E01COMCY4" size="3" maxlength="3" value="<%= msgRcd.getE01COMCY4()%>"
	              class="context-menu-help"
	              onmousedown="init(currencyHelp,this.name,document.forms[0].E01COMBK4.value,'','','','')">
              </div>
            </td>
            <td nowrap > 
              <div align="center"> 
                <input type="text" name="E01COMGL4" size="17" maxlength="16" value="<%= msgRcd.getE01COMGL4()%>"
	              class="context-menu-help"
	              onmousedown="init(ledgerHelp,this.name,document.forms[0].E01COMBK4.value,document.forms[0].E01COMCY4.value,'','','')"  >
              </div>
            </td>
            <td nowrap > 
              <div align="left"> 
                <input type="text" name="E01COMDE4" size="25" maxlength="20" value="<%= msgRcd.getE01COMDE4()%>">
              </div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap > 
              <div align="center"> 
                <input type="text" name="E01COMRI5" size="16" maxlength="15" onKeyPress="enterDecimal()" value="<%= msgRcd.getE01COMRI5()%>">
              </div>
            </td>
            <td nowrap > 
              <div align="center"> 
                <input type="text" name="E01COMRF5" size="16" maxlength="15" onKeyPress="enterDecimal()" value="<%= msgRcd.getE01COMRF5()%>">
              </div>
            </td>
            <td nowrap > 
              <div align="center"> 
                <input type="text" name="E01COMVA5" size="16" maxlength="15" onKeyPress="enterDecimal()" value="<%= msgRcd.getE01COMVA5()%>">
              </div>
            </td>
            <td nowrap > 
              <div align="center"> 
                <input type="text" name="E01COMMI5" size="16" maxlength="15" onKeyPress="enterDecimal()" value="<%= msgRcd.getE01COMMI5()%>">
              </div>
            </td>
            <td nowrap > 
              <div align="center"> 
                <input type="text" name="E01COMMA5" size="16" maxlength="15" onKeyPress="enterDecimal()" value="<%= msgRcd.getE01COMMA5()%>">
              </div>
            </td>
            <td nowrap > 
              <div align="center"> 
                <input type="text" name="E01COMFA5" size="3" maxlength="1"
	              class="context-menu-help" onmousedown="init(staticFactHelp,this.name)" value="<%= msgRcd.getE01COMFA5()%>">
              </div>
            </td>
            <td nowrap > 
              <div align="center"> 
                <input type="text" name="E01COMFR5" size="3" maxlength="1"
	              class="context-menu-help" onmousedown="init(staticFrecHelp,this.name)" value="<%= msgRcd.getE01COMFR5()%>">
              </div>
            </td>
            <td nowrap > 
              <div align="center"> 
                <input type="text" name="E01COMBK5" size="2" maxlength="2" value="<%= msgRcd.getE01COMBK5()%>">
              </div>
            </td>
            <td nowrap > 
              <div align="center"> 
                <input type="text" name="E01COMCY5" size="3" maxlength="3" value="<%= msgRcd.getE01COMCY5()%>"
	              class="context-menu-help" onmousedown="init(currencyHelp,this.name,document.forms[0].E01COMBK5.value,'','','','')">
              </div>
            </td>
            <td nowrap > 
              <div align="center"> 
                <input type="text" name="E01COMGL5" size="17" maxlength="16" value="<%= msgRcd.getE01COMGL5()%>"
	              class="context-menu-help" onmousedown="init(ledgerHelp,this.name,document.forms[0].E01COMBK5.value,document.forms[0].E01COMCY5.value,'','','')"  >
              </div>
            </td>
            <td nowrap > 
              <div align="left"> 
                <input type="text" name="E01COMDE5" size="25" maxlength="20" value="<%= msgRcd.getE01COMDE5()%>">
              </div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap > 
              <div align="center"> 
                <input type="text" name="E01COMRI6" size="16" maxlength="15" onKeyPress="enterDecimal()" value="<%= msgRcd.getE01COMRI6()%>">
              </div>
            </td>
            <td nowrap > 
              <div align="center"> 
                <input type="text" name="E01COMRF6" size="16" maxlength="15" onKeyPress="enterDecimal()" value="<%= msgRcd.getE01COMRF6()%>">
              </div>
            </td>
            <td nowrap > 
              <div align="center"> 
                <input type="text" name="E01COMVA6" size="16" maxlength="15" onKeyPress="enterDecimal()" value="<%= msgRcd.getE01COMVA6()%>">
              </div>
            </td>
            <td nowrap > 
              <div align="center"> 
                <input type="text" name="E01COMMI6" size="16" maxlength="15" onKeyPress="enterDecimal()" value="<%= msgRcd.getE01COMMI6()%>">
              </div>
            </td>
            <td nowrap > 
              <div align="center"> 
                <input type="text" name="E01COMMA6" size="16" maxlength="15" onKeyPress="enterDecimal()" value="<%= msgRcd.getE01COMMA6()%>">
              </div>
            </td>
            <td nowrap > 
              <div align="center"> 
                <input type="text" name="E01COMFA6" size="3" maxlength="1"
	              class="context-menu-help"
	              onmousedown="init(staticFactHelp,this.name)" value="<%= msgRcd.getE01COMFA6()%>">
              </div>
            </td>
            <td nowrap > 
              <div align="center"> 
                <input type="text" name="E01COMFR6" size="3" maxlength="1"
	              class="context-menu-help"
	              onmousedown="init(staticFrecHelp,this.name)" value="<%= msgRcd.getE01COMFR6()%>">
              </div>
            </td>
            <td nowrap > 
              <div align="center"> 
                <input type="text" name="E01COMBK6" size="2" maxlength="2" value="<%= msgRcd.getE01COMBK6()%>">
              </div>
            </td>
            <td nowrap > 
              <div align="center"> 
                <input type="text" name="E01COMCY6" size="3" maxlength="3" value="<%= msgRcd.getE01COMCY6()%>"
	              class="context-menu-help"
	              onmousedown="init(currencyHelp,this.name,document.forms[0].E01COMBK6.value,'','','','')">
              </div>
            </td>
            <td nowrap > 
              <div align="center"> 
                <input type="text" name="E01COMGL6" size="17" maxlength="16" value="<%= msgRcd.getE01COMGL6()%>"
	              class="context-menu-help"
	              onmousedown="init(ledgerHelp,this.name,document.forms[0].E01COMBK6.value,document.forms[0].E01COMCY6.value,'','','')"  >
              </div>
            </td>
            <td nowrap > 
              <div align="left"> 
                <input type="text" name="E01COMDE6" size="25" maxlength="20" value="<%= msgRcd.getE01COMDE6()%>">
              </div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap > 
              <div align="center"> 
                <input type="text" name="E01COMRI7" size="16" maxlength="15" onKeyPress="enterDecimal()" value="<%= msgRcd.getE01COMRI7()%>">
              </div>
            </td>
            <td nowrap > 
              <div align="center"> 
                <input type="text" name="E01COMRF7" size="16" maxlength="15" onKeyPress="enterDecimal()" value="<%= msgRcd.getE01COMRF7()%>">
              </div>
            </td>
            <td nowrap > 
              <div align="center"> 
                <input type="text" name="E01COMVA7" size="16" maxlength="15" onKeyPress="enterDecimal()" value="<%= msgRcd.getE01COMVA7()%>">
              </div>
            </td>
            <td nowrap > 
              <div align="center"> 
                <input type="text" name="E01COMMI7" size="16" maxlength="15" onKeyPress="enterDecimal()" value="<%= msgRcd.getE01COMMI7()%>">
              </div>
            </td>
            <td nowrap > 
              <div align="center"> 
                <input type="text" name="E01COMMA7" size="16" maxlength="15" onKeyPress="enterDecimal()" value="<%= msgRcd.getE01COMMA7()%>">
              </div>
            </td>
            <td nowrap > 
              <div align="center"> 
                <input type="text" name="E01COMFA7" size="3" maxlength="1"
	              class="context-menu-help"
	              onmousedown="init(staticFactHelp,this.name)" value="<%= msgRcd.getE01COMFA7()%>">
              </div>
            </td>
            <td nowrap > 
              <div align="center"> 
                <input type="text" name="E01COMFR7" size="3" maxlength="1"
	              class="context-menu-help"
	              onmousedown="init(staticFrecHelp,this.name)" value="<%= msgRcd.getE01COMFR7()%>">
              </div>
            </td>
            <td nowrap > 
              <div align="center"> 
                <input type="text" name="E01COMBK7" size="2" maxlength="2" value="<%= msgRcd.getE01COMBK7()%>">
              </div>
            </td>
            <td nowrap > 
              <div align="center"> 
                <input type="text" name="E01COMCY7" size="3" maxlength="3" value="<%= msgRcd.getE01COMCY7()%>"
	              class="context-menu-help"
	              onmousedown="init(currencyHelp,this.name,document.forms[0].E01COMBK7.value,'','','','')">
              </div>
            </td>
            <td nowrap > 
              <div align="center"> 
                <input type="text" name="E01COMGL7" size="17" maxlength="16" value="<%= msgRcd.getE01COMGL7()%>"
	              class="context-menu-help"
	              onmousedown="init(ledgerHelp,this.name,document.forms[0].E01COMBK7.value,document.forms[0].E01COMCY7.value,'','','')"  >
              </div>
            </td>
            <td nowrap > 
              <div align="left"> 
                <input type="text" name="E01COMDE7" size="25" maxlength="20" value="<%= msgRcd.getE01COMDE7()%>">
              </div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap > 
              <div align="center"> 
                <input type="text" name="E01COMRI8" size="16" maxlength="15" onKeyPress="enterDecimal()" value="<%= msgRcd.getE01COMRI8()%>">
              </div>
            </td>
            <td nowrap > 
              <div align="center"> 
                <input type="text" name="E01COMRF8" size="16" maxlength="15" onKeyPress="enterDecimal()" value="<%= msgRcd.getE01COMRF8()%>">
              </div>
            </td>
            <td nowrap > 
              <div align="center"> 
                <input type="text" name="E01COMVA8" size="16" maxlength="15" onKeyPress="enterDecimal()" value="<%= msgRcd.getE01COMVA8()%>">
              </div>
            </td>
            <td nowrap > 
              <div align="center"> 
                <input type="text" name="E01COMMI8" size="16" maxlength="15" onKeyPress="enterDecimal()" value="<%= msgRcd.getE01COMMI8()%>">
              </div>
            </td>
            <td nowrap > 
              <div align="center"> 
                <input type="text" name="E01COMMA8" size="16" maxlength="15" onKeyPress="enterDecimal()" value="<%= msgRcd.getE01COMMA8()%>">
              </div>
            </td>
            <td nowrap > 
              <div align="center"> 
                <input type="text" name="E01COMFA8" size="3" maxlength="1"
	              class="context-menu-help"
	              onmousedown="init(staticFactHelp,this.name)" value="<%= msgRcd.getE01COMFA8()%>">
              </div>
            </td>
            <td nowrap > 
              <div align="center"> 
                <input type="text" name="E01COMFR8" size="3" maxlength="1"
	              class="context-menu-help"
	              onmousedown="init(staticFrecHelp,this.name)" value="<%= msgRcd.getE01COMFR8()%>">
              </div>
            </td>
            <td nowrap > 
              <div align="center"> 
                <input type="text" name="E01COMBK8" size="2" maxlength="2" value="<%= msgRcd.getE01COMBK8()%>">
              </div>
            </td>
            <td nowrap > 
              <div align="center"> 
                <input type="text" name="E01COMCY8" size="3" maxlength="3" value="<%= msgRcd.getE01COMCY8()%>"
	              class="context-menu-help"
	              onmousedown="init(currencyHelp,this.name,document.forms[0].E01COMBK8.value,'','','','')">
              </div>
            </td>
            <td nowrap > 
              <div align="center"> 
                <input type="text" name="E01COMGL8" size="17" maxlength="16" value="<%= msgRcd.getE01COMGL8()%>"
	              class="context-menu-help"
	              onmousedown="init(ledgerHelp,this.name,document.forms[0].E01COMBK8.value,document.forms[0].E01COMCY8.value,'','','')"  >
              </div>
            </td>
            <td nowrap > 
              <div align="left"> 
                <input type="text" name="E01COMDE8" size="25" maxlength="20" value="<%= msgRcd.getE01COMDE8()%>">
              </div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap > 
              <div align="center"> 
                <input type="text" name="E01COMRI9" size="16" maxlength="15" onKeyPress="enterDecimal()" value="<%= msgRcd.getE01COMRI9()%>">
              </div>
            </td>
            <td nowrap > 
              <div align="center"> 
                <input type="text" name="E01COMRF9" size="16" maxlength="15" onKeyPress="enterDecimal()" value="<%= msgRcd.getE01COMRF9()%>">
              </div>
            </td>
            <td nowrap > 
              <div align="center"> 
                <input type="text" name="E01COMVA9" size="16" maxlength="15" onKeyPress="enterDecimal()" value="<%= msgRcd.getE01COMVA9()%>">
              </div>
            </td>
            <td nowrap > 
              <div align="center"> 
                <input type="text" name="E01COMMI9" size="16" maxlength="15" onKeyPress="enterDecimal()" value="<%= msgRcd.getE01COMMI9()%>">
              </div>
            </td>
            <td nowrap > 
              <div align="center"> 
                <input type="text" name="E01COMMA9" size="16" maxlength="15" onKeyPress="enterDecimal()" value="<%= msgRcd.getE01COMMA9()%>">
              </div>
            </td>
            <td nowrap > 
              <div align="center"> 
                <input type="text" name="E01COMFA9" size="3" maxlength="1"
	              class="context-menu-help"
	              onmousedown="init(staticFactHelp,this.name)" value="<%= msgRcd.getE01COMFA9()%>">
              </div>
            </td>
            <td nowrap > 
              <div align="center"> 
                <input type="text" name="E01COMFR9" size="3" maxlength="1"
	              class="context-menu-help"
	              onmousedown="init(staticFrecHelp,this.name)" value="<%= msgRcd.getE01COMFR9()%>">
              </div>
            </td>
            <td nowrap > 
              <div align="center"> 
                <input type="text" name="E01COMBK9" size="2" maxlength="2" value="<%= msgRcd.getE01COMBK9()%>">
              </div>
            </td>
            <td nowrap > 
              <div align="center"> 
                <input type="text" name="E01COMCY9" size="3" maxlength="3" value="<%= msgRcd.getE01COMCY9()%>"
	              class="context-menu-help"
	              onmousedown="init(currencyHelp,this.name,document.forms[0].E01COMBK9.value,'','','','')">
              </div>
            </td>
            <td nowrap > 
              <div align="center"> 
                <input type="text" name="E01COMGL9" size="17" maxlength="16" value="<%= msgRcd.getE01COMGL9()%>"
	              class="context-menu-help"
	              onmousedown="init(ledgerHelp,this.name,document.forms[0].E01COMBK9.value,document.forms[0].E01COMCY9.value,'','','')"  >
              </div>
            </td>
            <td nowrap > 
              <div align="left"> 
                <input type="text" name="E01COMDE9" size="25" maxlength="20" value="<%= msgRcd.getE01COMDE9()%>">
              </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <br>
  <table width="100%" border="0" cellspacing="0" cellpadding="0" bgcolor="#FFFFFF" bordercolor="#FFFFFF">
    <tr bgcolor="#FFFFFF"> 
      <td> 
        <div align="center"> </div>
      </td>
    </tr>
  </table>
  
	<table width="100%">		
  	<tr>
  		<td width="50%">
  		<%if (!isInquiry) {%>
  		  <div align="center"> 
     		<input id="EIBSBTN" type="button" name="Submit" value="Enviar" onClick="goAction(5);">
     	  </div>	
     	  <%} %>
  		</td>
  		<td width="50%">
  		  <div align="center"> 
     		<input id="EIBSBTN" type="button" name="Exit" value="Salir" 
			<%if (!isInquiry) {%>
			    onClick="goAction(1);" 
			<% } else { %>
				onClick="goAction(6);" 
			<% } %>>
     	  </div>	
  		</td>
  	</tr>	
  </table>	
  <font face="Arial"><font size="2"> 
  </font></font><BR>
  </form>
<SCRIPT type="text/javascript">

showTypeAcd();

function showTypeAcd(){
	var acd = document.getElementById("E01COMACD");
    acd.value = acd.value.toUpperCase();
	if(acd.value == 'CS'){
		setVisibility(document.getElementById("hiddenDivCST"), "visible");
	} else {
		setVisibility(document.getElementById("hiddenDivCST"), "hidden");	
	}
}
	<%if (isInquiry) {%>
		readOnlyPage();
	<% } %>
</SCRIPT>  
</body>
</html>
