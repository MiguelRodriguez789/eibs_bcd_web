<!DOCTYPE HTML">
<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@ page import = "datapro.eibs.master.Util" %>
<%@page import="com.datapro.constants.EibsFields"%>
<%@page import="com.datapro.eibs.constants.HelpTypes"%>
<%@ page import = "datapro.eibs.master.*,datapro.eibs.beans.*" %>

<html>
<head>
<title>Customer Fusión Info</title>

<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset="utf-8">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<link rel="stylesheet" href="<%=request.getContextPath()%>/jquery/themes/smoothness/jquery-ui.css"/> 

<script language="Javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script language="Javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>
 


<jsp:useBean id="client" class="datapro.eibs.beans.ESD108001Message"  scope="session" /> 
<jsp:useBean id= "ECIF010List" class= "datapro.eibs.beans.JBObjList"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />

 <script>
$(function() {
$( "#tabs" ).tabs();
});

$(document).ready(function () {
    var currentTabIndex = "0";

    $tab = $("#tabs").tabs({
         activate : function (e, ui) {
            currentTabIndex = ui.newTab.index().toString();
            sessionStorage.setItem('tab-index', currentTabIndex);
         }
    });

    if (sessionStorage.getItem('tab-index') != null) {
        currentTabIndex = sessionStorage.getItem('tab-index');
        console.log(currentTabIndex);
        <%  if ( !error.getERRNUM().equals("0") && error.getERDF01().equals("")) error.setERRNUM("0");  
        	if (error.getERRNUM().equals("0") ) { %>
        	$tab.tabs('option', 'active', currentTabIndex);
        <% } else { %>	
        	$tab.tabs('option', 'active', <%=client.getH01SCR()%>);
        <% } %>
    }
    $('#btn-sub').on('click', function () {
        sessionStorage.setItem("tab-index", currentTabIndex);
    });
});

 $(function() {
$( "#datepicker" ).datepicker({ dateFormat: "dd-mm-yy" } );
});

</script>

</head>
 
<body>

<script language="Javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script language="JavaScript">

	
function goAction(op) {
	document.forms[0].SCREEN.value = op;
	if (op == 4) {
		if (!confirm("Desea borrar este Mantenimiento?")) {
			return;
		}
		document.forms[0].Delete.disabled = true;
	}
	if (op == 5) {
		document.forms[0].Submit.disabled = true;
	}
	document.forms[0].submit();
}

function goMotivo() {
	var x = [ 'E01RE1', 'E01RE2', 'E01RE3', 'E01RE4', 'E01RE5', 'E01RE6', 'E01RE7', 'E01RE8', 'E01RE9', 'E01REA'];
    cleanFields(x);
    document.forms[0].VALMOT.value="N";
	goAction(5);
}
function goNewCustomer() {
	if (getElement("E1SRCN").value == getElement("E01CUNCN").value) {
		alert("Cliente que recibe NO puede ser igual al que se fusiona.");
		return;
	}
    document.forms[0].VALMOT.value="N";
	goAction(5);
}

function putAll(p) {
 	if (p) {
		var formLength= document.forms[0].elements.length;
		for(n=0;n<formLength;n++) {
     		var elementName= document.forms[0].elements[n].name;
      		var nme = elementName.substring(0,6);
      			if (nme == 'E06ACT') {
      				getElement(elementName).checked = true;
      				getElement(elementName).value = "Y";
      			}	
      	}		
    }
    getElement("ALL").checked = false;
 }

function delAll(p) {
 	if (p) {
		var formLength= document.forms[0].elements.length;
		for(n=0;n<formLength;n++) {
     		var elementName= document.forms[0].elements[n].name;
      		var nme = elementName.substring(0,6); 
      			if (nme == 'E06ACT') {
      				if (getElement(elementName).disabled == false) {
      					getElement(elementName).checked = false;
      					getElement(elementName).value = "N";
      				}
      			}	
      	}		
    }
    getElement("NONE").checked = false;
 }
  
function markOpt(acc, typ, p) {
	var formLength= document.forms[0].elements.length;
	for(n=0;n<formLength;n++) {
     	var elementName= document.forms[0].elements[n].name;
     	var val= document.forms[0].elements[n].value;
      	if(val == acc) {
      		var row = elementName.substring(10);
      		var valT = getElement("E06SELTYP_" + row).value;
      		if (valT == typ) { 
      			var act = '';
      			var act1 = '';
      			if (p) {
      				getElement("E06ACT_" + row).checked = true;
      				getElement("E06ACT_" + row).value = "Y";
      			} else {
      				getElement("E06ACT_" + row).checked = false;
      				getElement("E06ACT_" + row).value = "N";
      			}	
 			}	
		}
    }
}
 </SCRIPT>  
 

<% 
	if ( !error.getERRNUM().equals("0") && !error.getERDF01().equals("")  ) {
        out.println("<SCRIPT Language=\"Javascript\">");
        error.setERRNUM("0");
        out.println("       showErrors()");
        out.println("</SCRIPT>");
    }
    
    
    String legtyp = (client.getE01LGT().equals("1")?"JURIDICO":"PERSONA");
    String readNew = (userPO.getPurpose().equals("NEW")?"readonly":"");
	String read = "";
 	String disabled = "";
 	String mandatory = "<img src=\"" + request.getContextPath() + "/images/Check.gif\" alt=\"campo obligatorio\" align=\"bottom\" border=\"0\" >";
 	String tf = "false";
 	Boolean isReadOnly = false;
 	Boolean isNew = false;
 	
	if (!(userPO.getPurpose().equals("NEW") || userPO.getPurpose().equals("MAINTENANCE"))) 
		{ read = " readonly ";
		  disabled = " disabled";
		  tf = "true";
		  isReadOnly = true;
		}
	int row = 0;
%>

<H3 align="center">Mantenimiento de Fusión de Clientes<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="client_fusion.jsp, ESD1080"></H3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSESD1080">
  
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="5">
  <INPUT TYPE=HIDDEN NAME="OPE" VALUE="10">
  <INPUT TYPE=HIDDEN NAME="E01OPE" VALUE="10">
  <INPUT TYPE=HIDDEN NAME="VALMOT" VALUE="Y">
  <INPUT TYPE=HIDDEN NAME="TOTROWS" VALUE="0">
  <INPUT TYPE=HIDDEN NAME="NEXTROWS" VALUE="0">
  <INPUT TYPE=HIDDEN NAME="CURRROWS" VALUE="0">

  <table  class="tableinfo" width="100%">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
        <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %>">  
            <td nowrap width="5%" align="right">Tipo Legal : </td>
            <td nowrap width="10%" align="left" > <%=legtyp%>
            	<INPUT TYPE=HIDDEN NAME="E01LGT" VALUE="<%= client.getE01LGT()%>" >
			</td>
            <td nowrap width="5%" align="right">Estado : </td>
			<td nowrap width="40%" align="left" style="color:red;font-size:12;">
				<input type="HIDDEN" name="E01STS" VALUE="<%= client.getE01STS()%>" > 
			  	<% if (client.getE01STS().equals("1")) { out.print("INACTIVO"); }
					  	else if (client.getE01STS().equals("2")) { out.print("ACTIVO");  }
						else if (client.getE01STS().equals("3")) { out.print("BLOQUEADO"); }
						else if (client.getE01STS().equals("4")) { out.print("FALLECIDO"); }
						else { out.print(""); } 
				%>	
				<b><%= client.getD01CRT().trim()%></b>		
			</td>
            <td nowrap width="5%" align="right"></td>
			<td nowrap width="35%" align="center" valign="top">
			</td>
		</tr>
		<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %>">  
            <td nowrap width="5%" align="right">Cliente que se fusiona :</td>
            <td nowrap width="10%" align="left"> 
                <INPUT type="text" name="E01CUN" size="10" readonly value="<%= client.getE01CUN().trim()%>">
			</td>
            <td nowrap width="5%" align="right">Nombre Legal :</td>
			<td nowrap width="40%" align="left">
				<INPUT type="text" name="LEGNME" size="60" readonly value="<%= client.getE01NM6().trim()%>"
				<%=(client.getF01NM6().equals("Y"))?"id=\"txtchanged\"":"" %>>
			</td>
            <td nowrap width="5%" align="right">Nombre Corto :</td>
			<td nowrap width="35%" align="left">
				<eibsinput:text name="client" property="E01SHN" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CHAR %>" size="26" required="false" readonly="true" modified="F01SHN"/>
			</td>
		</tr>
		<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %>">  
            <td nowrap width="5%" align="right">Tipo ID : </td>
            <td nowrap width="10%" align="left">
            	<eibsinput:text name="client" property="E01TID" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CNOFC %>" required="false" readonly="true" modified="F01TID"/> 
			</td>
            <td nowrap width="5%" align="right"><%= client.getD01TID().trim()%> : </td>
			<td nowrap width="40%" align="left">
				<eibsinput:text name="client" property="E01IDN" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_IDENTIFICATION %>" required="false" readonly="true" modified="F01IDN"/>
			</td>
            <td nowrap width="5%" align="right">País Identificación : </td>
			<td nowrap width="35%" align="left">
				<eibsinput:text name="client" property="E01PID" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CNOFC %>" required="false" readonly="true" modified="F01PID"/>
				<%= client.getD01PID().trim()%>
			</td>
		</tr>
		<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %>">  
            <td nowrap width="5%" align="right"></td>
            <td nowrap width="10%" align="left"> 
			</td>
            <td nowrap width="5%" align="right"></td> 
			<td nowrap width="40%" align="left">
			</td>
            <td nowrap width="5%" align="right"></td>
			<td nowrap width="35%" align="left">
			</td>
		</tr>
        </table>
     
<div id="tabs">  
	<ul>
    	<li><a href="#tab1">Datos para Fusión</a></li>
    	<li><a href="#tab2">Selección de Productos</a></li>
	</ul>


<div id="tab1">  <!-- Informacion de Refundición -->
    
  <table  class="tableinfo" width="100%">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
        	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %>">  
              <td nowrap width="15%" align="right">Cliente que Recibe Productos : </td>
              <td nowrap width="20%" align="left">
              	<eibsinput:text property="E1SRCN" name="client" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_CUSTOMER %>" readonly="false" required="true" modified="F1SRCN" onchange="goNewCustomer();"/>
              	<A href="javascript:GetCustomerDetails('E1SRCN', 'E1SMA1', 'E1SBNI', 'E1STID', 'E1SPID', '', '', '', '', '', '', '', '', '', '', '', '', '')" > 
				<IMG src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="bottom" border="0">
				</A>
              </td>
              <td nowrap width="15%" align="right">Nombre :</td>
              <td nowrap width="50%" align="left">
              	<eibsinput:text property="E1SMA1" name="client" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_NAME %>" readonly="true"/>
              </td>
            </tr>
            <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %>">  
            	<td nowrap width="15%" align="right">Tipo ID : </td>
            	<td nowrap width="20%" align="left">
            		<eibsinput:text name="client" property="E1STID" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CNOFC %>" required="false" readonly="true"/> 
				</td>
				<td nowrap width="15%" align="right">Número :</td>
            	<td nowrap width="50%" align="left">
					<eibsinput:text name="client" property="E1SBNI" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_IDENTIFICATION %>" required="false" readonly="true" />
					País : <eibsinput:text name="client" property="E1SPID" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CNOFC %>" required="false" readonly="true"/>
				</td>
			</tr>
            <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %>">  
              <td nowrap width="15%" align="right">Nuevo Estado Cliente que se fusiona : </td>
              <td nowrap width="35%" align="left"> 
                <select name="E01NST" <%= disabled %> <%=(client.getF01STS().equals("Y"))?"id=\"txtchanged\"":"" %>>
                	<option value=" " <% if (!(client.getE01NST().equals("1")||client.getE01NST().equals("2") || client.getE01NST().equals("3"))) out.print("selected"); %>></option>
                    <option value="1" <% if (client.getE01NST().equals("1")) out.print("selected"); %>>INACTIVO</option>
                    <option value="2" <% if (client.getE01NST().equals("2")) out.print("selected"); %>>ACTIVO</option>                   
                    <option value="3" <% if (client.getE01NST().equals("3")) out.print("selected"); %>>BLOQUEADO</option>
                </select>
                <%=mandatory %>
              </td>
              <td nowrap width="15%" align="right"></td>
              <td nowrap width="35%" align="left">
              </td>
            </tr>
            <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %>">  
              <td nowrap width="15%" align="right">Causal :</td>
            	<td nowrap width="35%" align="left">
            	<input type="text" name="E01FC1" size="5" maxlength="4" value="<%= client.getE01FC1().trim()%>" <%=read%>>
            		<% if ( !isReadOnly) {%>
            		<a href="javascript:Get2FilterCodes('E01FC1','D01FC1','FU', '',document.forms[0]['E01NST'].value)" >
              		<img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="bottom" border="0" style="cursor:hand" ></a>
              		<% } %>
              		<%=mandatory %>
            	<input type="text" name="D01FC1" size="20" value="<%= client.getD01FC1().trim()%>" readonly><br>
              </td>
              <td nowrap width="15%" align="right">Motivo de Causal :</td>
              <td nowrap width="35%" align="left">
            	<input type="text" name="E01FC2" size="5" maxlength="4" value="<%= client.getE01FC2().trim()%>" <%=read%> onchange="goMotivo();">
            		<% if ( !isReadOnly) {%>
            		<a href="javascript:Get2FilterCodes('E01FC2','D01FC2','FM', '',document.forms[0]['E01FC1'].value)" >
              		<img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="bottom" border="0" style="cursor:hand" ></a>
              		<% } %>
              		<%=mandatory %>
            	<input type="text" name="D01FC2" size="20" value="<%= client.getD01FC2().trim()%>" readonly> 
              </td>
            </tr>
            <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %>">  
              <td nowrap width="15%" align="right">Comentarios :</td>
              <td nowrap width="35%" align="left">
              	<textarea name="E01RMK" cols="64" rows="4" <%=read%>><%=client.getE01RMK()%></textarea>
              </td>
              <td nowrap width="15%" align="right"></td> 
              <td nowrap width="35%" align="left">
              </td> 
            </tr>
          </table>
        </td>
      </tr>
    </table>
   
   <br> 
  <table  class="tableinfo">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <%
          String[] lbl = {  client.getC01LB1(), client.getC01LB2(), client.getC01LB3(), client.getC01LB4(), client.getC01LB5(),
          					client.getC01LB6(), client.getC01LB7(), client.getC01LB8(), client.getC01LB9(), client.getC01LB0()};
		  String[] typ = {  client.getC01PT1(), client.getC01PT2(), client.getC01PT3(), client.getC01PT4(), client.getC01PT5(),
          					client.getC01PT6(), client.getC01PT7(), client.getC01PT8(), client.getC01PT9(), client.getC01PT0()};
          String[] lng = {  client.getC01LN1(), client.getC01LN2(), client.getC01LN3(), client.getC01LN4(), client.getC01LN5(),
          					client.getC01LN6(), client.getC01LN7(), client.getC01LN8(), client.getC01LN9(), client.getC01LN0()};
          String[] dec = {  client.getC01DE1(), client.getC01DE2(), client.getC01DE3(), client.getC01DE4(), client.getC01DE5(),
          					client.getC01DE6(), client.getC01DE7(), client.getC01DE8(), client.getC01DE9(), client.getC01DE0()};
          String[] vlu = {  client.getE01RE1(), client.getE01RE2(), client.getE01RE3(), client.getE01RE4(), client.getE01RE5(),
          					client.getE01RE6(), client.getE01RE7(), client.getE01RE8(), client.getE01RE9(), client.getE01REA()};	
          String[] f01 = {  client.getF01RE1(), client.getF01RE2(), client.getF01RE3(), client.getF01RE4(), client.getF01RE5(),
          					client.getF01RE6(), client.getF01RE7(), client.getF01RE8(), client.getF01RE9(), client.getF01REA()};																				        					 
          int rw = 1;
          int x = 0; 
          while (rw < 11) {
            if (!lbl[x].equals("")) {
             	String v = String.valueOf(rw).trim();
             	if (v == "10") v = "A";
          %>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %>"> 
             <td nowrap width="35%" align="right"><%=lbl[x]%> :</td>
              <td nowrap width="65%" align="left">
              	<% if (typ[x].equals("A")) { %>
              	<INPUT type="text" name="E01RE<%=v%>" size="40" maxlength="<%=lng[x]%>" value="<%=vlu[x]%>" <%=read%>
              	<%=(f01[x].equals("Y"))?"id=\"txtchanged\"":"" %>>
              	<% } %>
              	<% if (typ[x].equals("N")) { %>
              	<INPUT type="text" name="E01RE<%=v%>" size="25" maxlength="<%=lng[x]%>" value="<%=vlu[x]%>" onKeypress="enterDecimal(event, <%=dec[x]%>)" <%=read%>
              	<%=(f01[x].equals("Y"))?"id=\"txtchanged\"":"" %>>
              	<% } %>
              	<% if (typ[x].equals("F")) { %>
              	<INPUT type="text" name="E01RE<%=v%>" value="<%=vlu[x]%>" id="datepicker" <%=read%>
              	<%=(f01[x].equals("Y"))?"id=\"txtchanged\"":"" %>>
              	<% } %>
              	<%=mandatory%>
             </td>
          </tr>
          <%} 
          	rw++;
          	x++; 
          } %>
		</table>
      </td>
    </tr>
  </table>
</div>
    
<div id="tab2">  <!-- Informacion de Productos -->
    
  <table  class="tableinfo" width="100%">
  	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %>"> 
      	<td colspan="8">
      		<div id="container">
				<h4>PRODUCTOS Y RELACIONES :  
					<input type="checkbox" name="ALL" value="1" onClick="putAll(this.checked);">
					Seleccionar todos
					<input type="checkbox" name="NONE" value="1" onClick="delAll(this.checked);">
					Deshacer selección
				</h4>
			</div>
		</td>
	</tr>
    <TR id=trdark> 
		<td NOWRAP align="center" width="10%"><B>Sel</B></td>
		<td NOWRAP align="center" width="15%"><B>Cuenta</B></td>
		<td NOWRAP align="center" width="25%"><B>Tipo</B></td>
		<TD nowrap align="center" width="5%"><B>Banco</B></TD>
		<TD nowrap align="center" width="10%"><B>Oficina</B></TD>
		<td NOWRAP align="center" width="10%"><B>Moneda</B></td>
		<td NOWRAP align="center" width="25%"><B>Producto</B></td>
	</TR>
    
        <%
    	  int i = 0;
          ECIF010List.initRow();    
          while (ECIF010List.getNextRow()) {
            ESD108006Message cifList = (ESD108006Message) ECIF010List.getRecord();  
		%>              
    <TR id=trclear>

		<td NOWRAP align="center" width="10%"> 
            <input type="checkbox" name="E06ACT_<%= ECIF010List.getCurrentRow() %>" value="Y" <% if (cifList.getE06ACT().equals("Y")) { out.print("checked"); } %> 
      								onClick="markOpt('<%=cifList.getE06ACCNUM()%>','<%=cifList.getE06SELTYP()%>',this.checked)">
      		<input type="hidden" name="E06SELTYP_<%= ECIF010List.getCurrentRow() %>" value="<%=cifList.getE06SELTYP()%>">
      		<input type="hidden" name="E06SELCUN_<%= ECIF010List.getCurrentRow() %>" value="<%=cifList.getE06SELCUN()%>">						
		</td>
		<td NOWRAP align="center" width="15%" >
			<a href="javascript:showInqAcc('<%= cifList.getE06ACCNUM() %>')">
			<b><%= cifList.getE06ACCNUM() %></b>
			</a>
			<input type="hidden" name="E06ACCNUM_<%= ECIF010List.getCurrentRow() %>" value="<%=cifList.getE06ACCNUM()%>">
		</td>
		<td NOWRAP align="left" width="25%" ><%= cifList.getD06ACD() %> - <%= cifList.getE06ACCSTS() %>
			<input type="hidden" name="E06SELACD_<%= ECIF010List.getCurrentRow() %>" value="<%=cifList.getE06SELACD()%>">
		</td>
		<td NOWRAP align="center" width="5%" ><%= cifList.getE06BNKNUM() %></td>
		<td NOWRAP align="center" width="10%" ><%= cifList.getE06BRNNUM()%></td>
		<td NOWRAP align="center" width="10%" ><%= cifList.getE06CCYCDE() %></td>
		<td NOWRAP align="center" width="25%" ><%= cifList.getE06PROCDE() %> <%= cifList.getD06PRD() %></td>
	</TR> 
       <% 
       	 i++; 
        } 
       %> 
  </TABLE>
  
</div>


</div>  <!-- Fin de Tabs  -->

<% 	if (userPO.getPurpose().equals("MAINTENANCE") || userPO.getPurpose().equals("NEW")) { %>

	<table width="100%" border="0" cellspacing="0" cellpadding="0" bgcolor="#FFFFFF" bordercolor="#FFFFFF">
    	<tr bgcolor="#FFFFFF"> 
      		<td width="33%" align="center"><input type="checkbox" name="H01FLGWK2" value="1" >Aceptar con Avisos</td>
    	</tr>
  	</table>    
    
    <table width="100%">		
  	<tr>
  		<td width="33%">
  		  <div align="center"> 
     		<input id="EIBSBTN" type=button name="Submit" value="Enviar" onClick="goAction(5);" <%= disabled %>>
     	  </div>	
  		</td>
  		<td width="33%"> 
  		  <div align="center"> 
  		  	<% if (!userPO.getPurpose().equals("NEW")) {%>
     		<input id="EIBSBTN" type=button name="Delete" value="Borrar Mnto" onClick="goAction(4);" <%= disabled %>>
     		<% } %>
     	  </div>	
  		</td>
  		<td width="34%">
  		  <div align="center"> 
     		<input id="EIBSBTN" type=submit name="Exit" value="Salir" 
			<% if ( userPO.getPurpose().equals("NEW")) {%>
			    onClick="goAction(1);" 
			<% } else { %>
				onClick="goAction(6);" 
			<% } %>>
     	  </div>	
  		</td>
	</table>
<% } %>
	</td>
  	</tr>	
  </table>	
  
  </form>
</body> 

<SCRIPT language="JavaScript">

	document.forms[0].TOTROWS.value = <%=i%>;
	document.forms[0].NEXTROWS.value = <%= ECIF010List.getLastRec()%>;
	document.forms[0].CURRROWS.value = <%= ECIF010List.getFirstRec()%>;

</SCRIPT>
<% if (!(userPO.getPurpose().equals("NEW") || userPO.getPurpose().equals("MAINTENANCE"))) {%>
<script src="<%=request.getContextPath()%>/jquery/readOnlyPage.jsp"> </script>
<% } %>
<script src="<%=request.getContextPath()%>/jquery/markChangedFields.jsp?MSGOBJ=client"> </script>
</html>
