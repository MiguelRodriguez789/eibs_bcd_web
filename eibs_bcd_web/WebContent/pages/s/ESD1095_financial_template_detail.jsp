<%@ page import="datapro.eibs.master.Util" %>
<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@ page import="com.datapro.constants.EibsFields" %>
<%@ page import="com.datapro.eibs.constants.HelpTypes" %>

<html>
<head>
<title>Clients</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/jquery/plugins/contextMenu/css/jquery.contextMenu.css" rel="stylesheet" type="text/css" />
</head>

<jsp:useBean id="msgRcd" class="datapro.eibs.beans.ESD109501Message"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />

<body>
 
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>


<script type="text/javascript">
<%
	String read = "";
 	String disabled = "";
 	boolean readOnly = false;
 	String mandatory = "<img src=\"" + request.getContextPath() + "/images/Check.gif\" alt=\"Campo Obligatorio\" align=\"bottom\" border=\"0\" >";
 	if (!(userPO.getPurpose().equals("NEW") || userPO.getPurpose().equals("MAINTENANCE"))) 
		{ read = " readonly ";
		  disabled = " disabled"; 
		  mandatory = "";
		  readOnly = true;
	}	
 	boolean isInquiry = userPO.getPurpose().equals("INQUIRY");
 	boolean isReadOnly = isInquiry;
 	String readMnt = (userPO.getPurpose().equals("NEW")?"":" readonly");
 	boolean readMntB = (userPO.getPurpose().equals("NEW")?false:true);
%>

function updLin(n) {
	
	repType = getElement("E01IFTTIN").value;
	
	if (n == 0 ) {
		getElement('DETAIL').style.display='none';
		getElement('VALIDATE').style.display='none';
		getElement('CALCULATE').style.display='none';
		getElement('IMPORT1').style.display='none';
		getElement('IMPORT2').style.display='none';
	} else {
		getElement('DETAIL').style.display='block';
		getElement('VALIDATE').style.display='block';
		getElement('CALCULATE').style.display='block';
		getElement('IMPORT1').style.display='none';
		getElement('IMPORT2').style.display='none';
		if (repType ==  'IFF') {
			getElement('IMPORT1').style.display='block';
			getElement('IMPORT2').style.display='block';
		}
		if (repType ==  'IFG') {
			getElement('IMPORT1').style.display='block';
		}	
		document.forms[0].E01IFTRPN.readonly = true;
		document.forms[0].E01IFTTIN.disabled = true;
		document.forms[0].E01IFTLGT.disabled = true;
		document.forms[0].E01IFTEST.disabled = true;
	}
}

function updLinTyp() {
	
	type = getElement("E01IFTLIT").value; 
	repType = getElement("E01IFTTIN").value;
	getElement('IMPORT').style.display='none';
	
	if (type == 'T' ) {
		getElement('VALIDATE').style.display='none';
		getElement('CALCULATE').style.display='none';
		getElement('IMPORT').style.display='none';
		var x = [ 'E01IFTZER', 'E01IFTNEG', 'E01IFTMIN', 'E01IFTVOP', 'E01IFTVLI', 'E01IFTO01', 'E01IFTO02', 'E01IFTO03', 'E01IFTO04', 'E01IFTO05',
				  'E01IFTO06', 'E01IFTO07', 'E01IFTO08', 'E01IFTO09', 'E01IFTO10', 'E01IFTL01', 'E01IFTL02', 'E01IFTL03', 'E01IFTL04', 'E01IFTL05',
				  'E01IFTL06', 'E01IFTL07', 'E01IFTL08', 'E01IFTL09', 'E01IFTL10', 'E01IFTIDN', 'E01IFTIDL', 'E01IFTIDM', 'E01IFTIGN', 'E01IFTIGL',
				  'E01IFTIGM' ];
    	cleanFields(x);
	} 
	
	if (type ==  'I') {
		getElement('VALIDATE').style.display='block';
		getElement('CALCULATE').style.display='none';
		if (repType ==  'IFF') {
			getElement('IMPORT').style.display='block';
		}	
		var x = [ 'E01IFTO01', 'E01IFTO02', 'E01IFTO03', 'E01IFTO04', 'E01IFTO05',
				  'E01IFTO06', 'E01IFTO07', 'E01IFTO08', 'E01IFTO09', 'E01IFTO10', 'E01IFTL01', 'E01IFTL02', 'E01IFTL03', 'E01IFTL04', 'E01IFTL05',
				  'E01IFTL06', 'E01IFTL07', 'E01IFTL08', 'E01IFTL09', 'E01IFTL10' ];
    	cleanFields(x);
	}
	
	if (type ==  'C' || type ==  'B') {
		getElement('VALIDATE').style.display='block';
		getElement('CALCULATE').style.display='block';
		if (repType ==  'IFF') {
			getElement('IMPORT').style.display='block';
		}	
	}
}

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

<% 
    if ( !error.getERRNUM().equals("0")  ) {
        out.println("<SCRIPT Language=\"Javascript\">");
        error.setERRNUM("0");
        out.println("       showErrors()");
        out.println("</SCRIPT>");
    }
%>  

<H3 align="center">
<% if (userPO.getPurpose().equals("NEW") || userPO.getPurpose().equals("MAINTENANCE"))  { %>
Mantenimiento
<% } else {%>
Consulta
<% } %>
 de Formatos Financieros para Clientes
<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="financial_template_detail.jsp, ESD1095"></H3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSESD1095" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="5">
  
  <% int row = 0; %>  
  <h4>Información Básica</h4>  
  <table  class="tableinfo" width="100%">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="<%=(row % 2 == 1) ? "trclear" : "trdark"%><%row++;%>"> 
            <td nowrap width="15%" align="right">Formato : </td>
            <td nowrap align="left" width="35%">
            	<INPUT type="text" name="E01IFTRPN" maxlength="5" size="3" readonly value="<%= msgRcd.getE01IFTRPN().trim()%>" onkeypress="enterInteger(event)">
			</td>
            <td nowrap width="15%" align="right">Tipo de Formato : </td>
			<td nowrap align="left" width="35%">
				<select name="E01IFTTIN" <%= disabled %>>
                	<option value=" " <% if (!(msgRcd.getE01IFTTIN().equals("IFG")||msgRcd.getE01IFTTIN().equals("IFD") || msgRcd.getE01IFTTIN().equals("IFF"))) out.print("selected"); %>> 
                    </option>
                    <option value="IFD" <% if (msgRcd.getE01IFTTIN().equals("IFD")) out.print("selected"); %>>Detallado</option>                   
                    <option value="IFF" <% if (msgRcd.getE01IFTTIN().equals("IFF")) out.print("selected"); %>>Fiscal</option>
                    <option value="IFG" <% if (msgRcd.getE01IFTTIN().equals("IFG")) out.print("selected"); %>>General</option>
                </select>
			</td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trclear" : "trdark"%><%row++;%>">
			<td nowrap width="15%" align="right">Descripción : </td>
			<td nowrap align="left" width="35%">
            	<INPUT type="text" name="E01IFTLID" maxlength="65" size="60" value="<%= msgRcd.getE01IFTLID().trim()%>" <%=read%>>
            	<%=mandatory %>
			</td>
            <td nowrap width=10% align="right"> </td>
            <td  nowrap width=40% align="left">
       		</td>
	     </tr>
        <tr id="<%=(row % 2 == 1) ? "trclear" : "trdark"%><%row++;%>">
			<td nowrap width=10% align="right">Tipo Legal :</td>
			<td  nowrap width=40% align="left">
				<select name="E01IFTLGT" disabled>
          		<option value="1" <% if (msgRcd.getE01IFTLGT().equals("1")) out.print("selected"); %>>JURIDICA</option>
               	<option value="2" <% if (msgRcd.getE01IFTLGT().equals("2")) out.print("selected"); %>>PERSONA</option>
               	<option value="B" <% if (msgRcd.getE01IFTLGT().equals("B")) out.print("selected"); %>>TODAS</option>
           		</select>
			</td>
            <td nowrap width=10% align="right">Estado : </td>
            <td  nowrap width=40% align="left">
            	<select name="E01IFTEST" disabled>
          		<option value="A" <% if (msgRcd.getE01IFTEST().equals("A")) out.print("selected"); %> >ACTIVO</option>
               	<option value="I" <% if (msgRcd.getE01IFTEST().equals("I")) out.print("selected"); %>>INACTIVO</option>
           		</select>
       		</td>
	    </tr>	
	  </table> 
	   
	<div id="DETAIL" style="position:relative; display:none;">
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="<%=(row % 2 == 1) ? "trclear" : "trdark"%><%row++;%>"> 
            <td nowrap width="15%" align="right">Linea : </td>
            <td nowrap align="left" width="35%">
            	<INPUT type="text" name="E01IFTLIN" maxlength="5" size="3" <%=readMnt%> value="<%= msgRcd.getE01IFTLIN().trim()%>" onkeypress="enterInteger(event)" onChange="updLin(this.value)">
            	<%=mandatory %>
			</td>
            <td nowrap width="15%" align="right">Tipo de Linea : </td>
			<td nowrap align="left" width="35%">
            	<select name="E01IFTLIT" <%= disabled %> onChange="updLinTyp()">
                	<option value=" " <% if (!(msgRcd.getE01IFTLIT().equals("R")||msgRcd.getE01IFTLIT().equals("T") || msgRcd.getE01IFTLIT().equals("I") || msgRcd.getE01IFTLIT().equals("C") || msgRcd.getE01IFTLIT().equals("B"))) out.print("selected"); %>> 
                    </option>
                    <option value="T" <% if (msgRcd.getE01IFTLIT().equals("T")) out.print("selected"); %>>Titulo de Linea</option>
                    <option value="I" <% if (msgRcd.getE01IFTLIT().equals("I")) out.print("selected"); %>>Digitada</option>
                    <option value="C" <% if (msgRcd.getE01IFTLIT().equals("C")) out.print("selected"); %>>Calculada</option>
                    <option value="B" <% if (msgRcd.getE01IFTLIT().equals("B")) out.print("selected"); %>>Digitada o Calculada</option>
                </select>
                <%=mandatory %>
			</td>
          </tr>
       </table>
	</div>   
	<div id="VALIDATE" style="position:relative; display:none;">
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="<%=(row % 2 == 1) ? "trclear" : "trdark"%><%row++;%>"> 
            <td nowrap width="15%" align="right">Cero Permitido : </td>
            <td nowrap align="left" width="35%">
            	<p> 
                <input type="radio" name="E01IFTZER" value="Y" <%if (msgRcd.getE01IFTZER().equals("Y")) out.print("checked"); %> <%= disabled %>>Si 
                <input type="radio" name="E01IFTZER" value="N" <%if (!msgRcd.getE01IFTZER().equals("Y")) out.print("checked"); %> <%= disabled %>>No
                </p>
			</td>
            <td nowrap width="15%" align="right">Valores Negativos : </td>
			<td nowrap align="left" width="35%">
            	<p> 
                <input type="radio" name="E01IFTNEG" value="Y" <%if (msgRcd.getE01IFTNEG().equals("Y")) out.print("checked"); %> <%= disabled %>>Si 
                <input type="radio" name="E01IFTNEG" value="N" <%if (!msgRcd.getE01IFTNEG().equals("Y")) out.print("checked"); %> <%= disabled %>>No
                </p>
			</td>
			<tr id="<%=(row % 2 == 1) ? "trclear" : "trdark"%><%row++;%>"> 
            <td nowrap width="15%" align="right">Valor Mínimo : </td>
            <td nowrap align="left" width="35%">
            	<INPUT type="text" name="E01IFTMIN" maxlength="20" size="20" <%=read%> value="<%= msgRcd.getE01IFTMIN().trim()%>" onkeypress="enterDecimal(event)">
			</td>
            <td nowrap width="15%" align="right">Validar que sea : </td>
			<td nowrap align="left" width="35%">
				<select name="E01IFTVOP" <%= disabled %>>
                	<option value=" " <% if (!(msgRcd.getE01IFTVOP().equals("=")|| msgRcd.getE01IFTVOP().equals("<") || msgRcd.getE01IFTVOP().equals(">"))) out.print("selected"); %>> 
                    </option>
                    <option value="=" <% if (msgRcd.getE01IFTVOP().equals("=")) out.print("selected"); %>>Igual</option>
                    <option value="<" <% if (msgRcd.getE01IFTVOP().equals("<")) out.print("selected"); %>>Menor</option>
                    <option value=">" <% if (msgRcd.getE01IFTVOP().equals(">")) out.print("selected"); %>>Mayor</option>
                </select>
				a Linea :
            	<INPUT type="text" name="E01IFTVLI" maxlength="5" size="3" <%=read%> value="<%= msgRcd.getE01IFTVLI().trim()%>" onkeypress="enterInteger(event)">
			</td>
          </tr>
       </table>
	</div>        
 	<div id="CALCULATE" style="position:relative; display:none;">
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
			<tr id="<%=(row % 2 == 1) ? "trclear" : "trdark"%><%row++;%>">
				<td nowrap align="left" colspan="10" width="30%">Ingrese Operadores y Lineas para Calculo</td>
			</tr>
			<tr id="<%=(row % 2 == 1) ? "trclear" : "trdark"%><%row++;%>"> 
			<td nowrap align="left" width="10%">
				<select name="E01IFTO01" <%= disabled %>>
                	<option value=" " <% if (!(msgRcd.getE01IFTO01().equals("+")|| msgRcd.getE01IFTO01().equals("-") || msgRcd.getE01IFTO01().equals("*") || msgRcd.getE01IFTO01().equals("/"))) out.print("selected"); %>> 
                    </option>
                    <option value="+" <% if (msgRcd.getE01IFTO01().equals("+")) out.print("selected"); %>>+</option>
                    <option value="-" <% if (msgRcd.getE01IFTO01().equals("-")) out.print("selected"); %>>-</option>
                    <option value="*" <% if (msgRcd.getE01IFTO01().equals("*")) out.print("selected"); %>>*</option>
                    <option value="/" <% if (msgRcd.getE01IFTO01().equals("/")) out.print("selected"); %>>/</option>
                </select>
            	<INPUT type="text" name="E01IFTL01" maxlength="5" size="3" <%=read%> value="<%= msgRcd.getE01IFTL01().trim()%>" onkeypress="enterInteger(event)">
			</td>
			<td nowrap align="left" width="10%">
				<select name="E01IFTO02" <%= disabled %>>
                	<option value=" " <% if (!(msgRcd.getE01IFTO02().equals("+")|| msgRcd.getE01IFTO02().equals("-") || msgRcd.getE01IFTO02().equals("*") || msgRcd.getE01IFTO02().equals("/"))) out.print("selected"); %>> 
                    </option>
                    <option value="+" <% if (msgRcd.getE01IFTO02().equals("+")) out.print("selected"); %>>+</option>
                    <option value="-" <% if (msgRcd.getE01IFTO02().equals("-")) out.print("selected"); %>>-</option>
                    <option value="*" <% if (msgRcd.getE01IFTO02().equals("*")) out.print("selected"); %>>*</option>
                    <option value="/" <% if (msgRcd.getE01IFTO02().equals("/")) out.print("selected"); %>>/</option>
                </select>
            	<INPUT type="text" name="E01IFTL02" maxlength="5" size="3" <%=read%> value="<%= msgRcd.getE01IFTL02().trim()%>" onkeypress="enterInteger(event)">
			</td>
			<td nowrap align="left" width="10%">
				<select name="E01IFTO03" <%= disabled %>>
                	<option value=" " <% if (!(msgRcd.getE01IFTO03().equals("+")|| msgRcd.getE01IFTO03().equals("-") || msgRcd.getE01IFTO03().equals("*") || msgRcd.getE01IFTO03().equals("/"))) out.print("selected"); %>> 
                    </option>
                    <option value="+" <% if (msgRcd.getE01IFTO03().equals("+")) out.print("selected"); %>>+</option>
                    <option value="-" <% if (msgRcd.getE01IFTO03().equals("-")) out.print("selected"); %>>-</option>
                    <option value="*" <% if (msgRcd.getE01IFTO03().equals("*")) out.print("selected"); %>>*</option>
                    <option value="/" <% if (msgRcd.getE01IFTO03().equals("/")) out.print("selected"); %>>/</option>
                </select>
            	<INPUT type="text" name="E01IFTL03" maxlength="5" size="3" <%=read%> value="<%= msgRcd.getE01IFTL03().trim()%>" onkeypress="enterInteger(event)">
			</td>
			<td nowrap align="left" width="10%">
				<select name="E01IFTO04" <%= disabled %>>
                	<option value=" " <% if (!(msgRcd.getE01IFTO04().equals("+")|| msgRcd.getE01IFTO04().equals("-") || msgRcd.getE01IFTO04().equals("*") || msgRcd.getE01IFTO04().equals("/"))) out.print("selected"); %>> 
                    </option>
                    <option value="+" <% if (msgRcd.getE01IFTO04().equals("+")) out.print("selected"); %>>+</option>
                    <option value="-" <% if (msgRcd.getE01IFTO04().equals("-")) out.print("selected"); %>>-</option>
                    <option value="*" <% if (msgRcd.getE01IFTO04().equals("*")) out.print("selected"); %>>*</option>
                    <option value="/" <% if (msgRcd.getE01IFTO04().equals("/")) out.print("selected"); %>>/</option>
                </select>
            	<INPUT type="text" name="E01IFTL04" maxlength="5" size="3" <%=read%> value="<%= msgRcd.getE01IFTL04().trim()%>" onkeypress="enterInteger(event)">
			</td>
			<td nowrap align="left" width="10%">
				<select name="E01IFTO05" <%= disabled %>>
                	<option value=" " <% if (!(msgRcd.getE01IFTO05().equals("+")|| msgRcd.getE01IFTO05().equals("-") || msgRcd.getE01IFTO05().equals("*") || msgRcd.getE01IFTO05().equals("/"))) out.print("selected"); %>> 
                    </option>
                    <option value="+" <% if (msgRcd.getE01IFTO05().equals("+")) out.print("selected"); %>>+</option>
                    <option value="-" <% if (msgRcd.getE01IFTO05().equals("-")) out.print("selected"); %>>-</option>
                    <option value="*" <% if (msgRcd.getE01IFTO05().equals("*")) out.print("selected"); %>>*</option>
                    <option value="/" <% if (msgRcd.getE01IFTO05().equals("/")) out.print("selected"); %>>/</option>
                </select>
            	<INPUT type="text" name="E01IFTL05" maxlength="5" size="3" <%=read%> value="<%= msgRcd.getE01IFTL05().trim()%>" onkeypress="enterInteger(event)">
			</td>
			<td nowrap align="left" width="10%">
				<select name="E01IFTO06" <%= disabled %>>
                	<option value=" " <% if (!(msgRcd.getE01IFTO06().equals("+")|| msgRcd.getE01IFTO06().equals("-") || msgRcd.getE01IFTO06().equals("*") || msgRcd.getE01IFTO06().equals("/"))) out.print("selected"); %>> 
                    </option>
                    <option value="+" <% if (msgRcd.getE01IFTO06().equals("+")) out.print("selected"); %>>+</option>
                    <option value="-" <% if (msgRcd.getE01IFTO06().equals("-")) out.print("selected"); %>>-</option>
                    <option value="*" <% if (msgRcd.getE01IFTO06().equals("*")) out.print("selected"); %>>*</option>
                    <option value="/" <% if (msgRcd.getE01IFTO06().equals("/")) out.print("selected"); %>>/</option>
                </select>
            	<INPUT type="text" name="E01IFTL06" maxlength="5" size="3" <%=read%> value="<%= msgRcd.getE01IFTL06().trim()%>" onkeypress="enterInteger(event)">
			</td>
			<td nowrap align="left" width="10%">
				<select name="E01IFTO07" <%= disabled %>>
                	<option value=" " <% if (!(msgRcd.getE01IFTO07().equals("+")|| msgRcd.getE01IFTO07().equals("-") || msgRcd.getE01IFTO07().equals("*") || msgRcd.getE01IFTO07().equals("/"))) out.print("selected"); %>> 
                    </option>
                    <option value="+" <% if (msgRcd.getE01IFTO07().equals("+")) out.print("selected"); %>>+</option>
                    <option value="-" <% if (msgRcd.getE01IFTO07().equals("-")) out.print("selected"); %>>-</option>
                    <option value="*" <% if (msgRcd.getE01IFTO07().equals("*")) out.print("selected"); %>>*</option>
                    <option value="/" <% if (msgRcd.getE01IFTO07().equals("/")) out.print("selected"); %>>/</option>
                </select>
            	<INPUT type="text" name="E01IFTL07" maxlength="5" size="3" <%=read%> value="<%= msgRcd.getE01IFTL07().trim()%>" onkeypress="enterInteger(event)">
			</td>
			<td nowrap align="left" width="10%">
				<select name="E01IFTO08" <%= disabled %>>
                	<option value=" " <% if (!(msgRcd.getE01IFTO08().equals("+")|| msgRcd.getE01IFTO08().equals("-") || msgRcd.getE01IFTO08().equals("*") || msgRcd.getE01IFTO08().equals("/"))) out.print("selected"); %>> 
                    </option>
                    <option value="+" <% if (msgRcd.getE01IFTO08().equals("+")) out.print("selected"); %>>+</option>
                    <option value="-" <% if (msgRcd.getE01IFTO08().equals("-")) out.print("selected"); %>>-</option>
                    <option value="*" <% if (msgRcd.getE01IFTO08().equals("*")) out.print("selected"); %>>*</option>
                    <option value="/" <% if (msgRcd.getE01IFTO08().equals("/")) out.print("selected"); %>>/</option>
                </select>
            	<INPUT type="text" name="E01IFTL08" maxlength="5" size="3" <%=read%> value="<%= msgRcd.getE01IFTL08().trim()%>" onkeypress="enterInteger(event)">
			</td>
			<td nowrap align="left" width="10%">
				<select name="E01IFTO09" <%= disabled %>>
                	<option value=" " <% if (!(msgRcd.getE01IFTO09().equals("+")|| msgRcd.getE01IFTO09().equals("-") || msgRcd.getE01IFTO09().equals("*") || msgRcd.getE01IFTO09().equals("/"))) out.print("selected"); %>> 
                    </option>
                    <option value="+" <% if (msgRcd.getE01IFTO09().equals("+")) out.print("selected"); %>>+</option>
                    <option value="-" <% if (msgRcd.getE01IFTO09().equals("-")) out.print("selected"); %>>-</option>
                    <option value="*" <% if (msgRcd.getE01IFTO09().equals("*")) out.print("selected"); %>>*</option>
                    <option value="/" <% if (msgRcd.getE01IFTO09().equals("/")) out.print("selected"); %>>/</option>
                </select>
            	<INPUT type="text" name="E01IFTL09" maxlength="5" size="3" <%=read%> value="<%= msgRcd.getE01IFTL09().trim()%>" onkeypress="enterInteger(event)">
			</td>
			<td nowrap align="left" width="10%">
				<select name="E01IFTO10" <%= disabled %>>
                	<option value=" " <% if (!(msgRcd.getE01IFTO10().equals("+")|| msgRcd.getE01IFTO10().equals("-") || msgRcd.getE01IFTO10().equals("*") || msgRcd.getE01IFTO10().equals("/"))) out.print("selected"); %>> 
                    </option>
                    <option value="+" <% if (msgRcd.getE01IFTO10().equals("+")) out.print("selected"); %>>+</option>
                    <option value="-" <% if (msgRcd.getE01IFTO10().equals("-")) out.print("selected"); %>>-</option>
                    <option value="*" <% if (msgRcd.getE01IFTO10().equals("*")) out.print("selected"); %>>*</option>
                    <option value="/" <% if (msgRcd.getE01IFTO10().equals("/")) out.print("selected"); %>>/</option>
                </select>
            	<INPUT type="text" name="E01IFTL10" maxlength="5" size="3" <%=read%> value="<%= msgRcd.getE01IFTL10().trim()%>" onkeypress="enterInteger(event)">
			</td>
          </tr>
       </table>
	</div>  
	<div id="IMPORT1" style="position:relative; display:none;">
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="<%=(row % 2 == 1) ? "trclear" : "trdark"%><%row++;%>"> 
            <td nowrap width="15%" align="right">Importar de Inf. Detallada : </td>
            <td nowrap align="left" width="35%">
            	Reporte : 
            	<INPUT type="text" name="E01IFTIDN" maxlength="3" size="5" <%=read%> value="<%= msgRcd.getE01IFTIDN().trim()%>" onkeypress="enterInteger(event)">
            	Linea : 
            	<INPUT type="text" name="E01IFTIDL" maxlength="3" size="5" <%=read%> value="<%= msgRcd.getE01IFTIDL().trim()%>" onkeypress="enterInteger(event)">
            	Multiplicado por  : 
            	<INPUT type="text" name="E01IFTIDM" maxlength="2" size="3" <%=read%> value="<%= msgRcd.getE01IFTIDM().trim()%>" onkeypress="enterInteger(event)">
			</td>
            <td nowrap width="15%" align="right"></td>
			<td nowrap align="left" width="35%">
			</td>
          </tr>
       </table>
	</div>        
	<div id="IMPORT2" style="position:relative; display:none;">
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="<%=(row % 2 == 1) ? "trclear" : "trdark"%><%row++;%>"> 
            <td nowrap width="15%" align="right">Importar de Inf. General : </td>
            <td nowrap align="left" width="35%">
            	Reporte : 
            	<INPUT type="text" name="E01IFTIGN" maxlength="3" size="5" <%=read%> value="<%= msgRcd.getE01IFTIGN().trim()%>" onkeypress="enterInteger(event)">
            	Linea : 
            	<INPUT type="text" name="E01IFTIGL" maxlength="3" size="5" <%=read%> value="<%= msgRcd.getE01IFTIGL().trim()%>" onkeypress="enterInteger(event)">
            	Multiplicado por  : 
            	<INPUT type="text" name="E01IFTIGM" maxlength="2" size="3" <%=read%> value="<%= msgRcd.getE01IFTIGM().trim()%>" onkeypress="enterInteger(event)">
			</td>
            <td nowrap width="15%" align="right"></td>
			<td nowrap align="left" width="35%">
			</td>
          </tr>
       </table>
	</div>   
	    
   </td>  
   </tr>
  </table>
  
    <table width="100%">		
  	<tr>
  		<td width="33%">
  		  <div align="center"> 
     		<input id="EIBSBTN" type="button" name="Submit" value="Enviar" onClick="goAction(5);" <%= disabled %>>
     	  </div>	
  		</td>
  		<td width="33%"> 
  		  <div align="center"> 
     		<input id="EIBSBTN" type="button" name="Delete" value="Borrar" onClick="goAction(4);" <%= disabled %>>
     	  </div>	
  		</td>
  		<td width="34%">
  		  <div align="center"> 
     		<input id="EIBSBTN" type="button" name="Exit" value="Salir" 
			<% if (userPO.getPurpose().equals("NEW") || userPO.getPurpose().equals("MAINTENANCE"))  { %>
			    onClick="goAction(8);" 
			<% } else { %>
				onClick="goAction(9);" 
			<% } %>>
     	  </div>	
  		</td>
  	</tr>	
  </table>	
  
  <h4>Información de Auditoria</h4>  
  <table  class="tableinfo" width="100%">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="trdark"> 
            <td nowrap width="15%" align="right">Usuario Creador : </td>
            <td nowrap align="left" width="35%">
            	<%= msgRcd.getE01IFTCUS()%>
			</td>
            <td nowrap width="15%" align="right">Usuario último Cambio : </td>
            <td nowrap width="35%" align="left">
            	<%= msgRcd.getE01IFTMUS()%>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="15%" align="right">Fecha de Proceso - Creación : </td>
			<td nowrap width="35%" align="left">
                <%= datapro.eibs.master.Util.formatCustomDate(currUser.getE01DTF(),Integer.parseInt(msgRcd.getE01IFTCDM()),Integer.parseInt(msgRcd.getE01IFTCDD()),Integer.parseInt(msgRcd.getE01IFTCDY()))%>
            </td>
            <td nowrap width="15%" align="right">Fecha de Proceso - Cambio : </td>
			<td nowrap width="35%" align="left">
                <%= datapro.eibs.master.Util.formatCustomDate(currUser.getE01DTF(),Integer.parseInt(msgRcd.getE01IFTMDM()),Integer.parseInt(msgRcd.getE01IFTMDD()),Integer.parseInt(msgRcd.getE01IFTMDY()))%>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="15%" align="right">Fecha / Hora - Creación : </td>
			<td nowrap width="35%" align="left">
				<%= msgRcd.getE01IFTCTM()%>
            </td>
            <td nowrap width="15%" align="right">Fecha / Hora - Cambio : </td>
			<td nowrap width="35%" align="left"> 
            	<%= msgRcd.getE01IFTMTM()%>
			</td>
          </tr>
        </table> 
      </td>  
    </tr>
  </table>

  </form>
</body>

	<SCRIPT type="text/javascript">
		updLin(<%=msgRcd.getE01IFTLIN()%>);
		updLinTyp();	
	</SCRIPT>


</html>
