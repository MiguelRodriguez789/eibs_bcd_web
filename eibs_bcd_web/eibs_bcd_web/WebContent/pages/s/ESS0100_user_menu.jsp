<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>

<title>Security - User Options</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META http-equiv="Content-Style-Type" content="text/css">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet" type="text/css" media="screen" />

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>
<jsp:useBean id= "userList" class= "datapro.eibs.beans.JBObjList"   scope="session"/>
<jsp:useBean id= "optList" class= "datapro.eibs.beans.JBObjList"  scope="session" />


<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/mapstyler.js"></script>
<SCRIPT type="text/javascript">
var ok = false;
 
function goProcess(scr) {
	if(document.forms[0].R01WEBUID.value == "") {
		alert("Favor seleccione un Usuario o Grupo!!!");
		return;	 
	}
	document.forms[0].Refresh.disabled = true;
	document.forms[0].Submit.disabled = false;
	if (scr == 2) {
		document.forms[0].Submit.disabled = true;
	}
    document.forms[0].SCREEN.value = scr;
    document.forms[0].submit();
}

function putUser(usr, nme) {
	document.forms[0].R01WEBUID.value = usr;
	document.forms[0].USRDSC.value = nme;
	DisabledSub();
}

function DisabledSub() {
	document.forms[0].Submit.disabled = true;
}

function putAll(p) {
 	if (p) {
		var formLength= document.forms[0].elements.length;
		for(n=0;n<formLength;n++) {
     		var elementName= document.forms[0].elements[n].name;
      		var nme = elementName.substring(0,6);
      			if (nme == 'E01ACT') {
      				getElement(elementName).checked = true;
      				getElement(elementName).value = "1";
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
      			if (nme == 'E01ACT') {
      				if (getElement(elementName).disabled == false) {
      					getElement(elementName).checked = false;
      					getElement(elementName).value = "0";
      				}
      			}	
      	}		
    }
    getElement("NONE").checked = false;
 }
  
function markOpt(menu, p) {
	var formLength= document.forms[0].elements.length;
	for(n=0;n<formLength;n++) {
     	var elementName= document.forms[0].elements[n].name;
     	var val= document.forms[0].elements[n].value;
      	if(val == menu) {
      		var row = elementName.substring(10); 
      		var act = '';
      		var act1 = '';
      		if (p) {
      			act = 'getElement("E01ACT_' + row + '").checked = true;';
      			act1 = 'getElement("E01ACT_' + row + '").value = "1";';
      		} else {
      			act = 'getElement("E01ACT_' + row + '").checked = false;';
      			act1 = 'getElement("E01ACT_' + row + '").value = "0";';
      		}	
      		var myFucn = new Function(act);
 			myFucn();
 			myFucn = new Function(act1);
 			myFucn();
		}
    }
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

<H3 align="center">Seguridad - Opciones de Menú
	<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="user_menu.jsp, ESS0100">
</h3>
<hr size="4">


<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.security.JSESS0100">

  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="2">
  <INPUT type=HIDDEN name="totalRow" value="1">
  <INPUT TYPE=HIDDEN NAME="actRow" VALUE="0">
  <INPUT TYPE=HIDDEN NAME="TOTROWS" VALUE="0"> 
  <INPUT TYPE=HIDDEN NAME="NEXTROWS" VALUE="0">
  <INPUT TYPE=HIDDEN NAME="CURRROWS" VALUE="0">

  <table  class="tableinfo" width="100%">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <tr id="trdark"> 
        	<td width="100%" align="left">
       			<div align="left"> 	<%= currUser.getE01NME()%></div>
          		<div align="right">Date : <%= datapro.eibs.master.Util.formatCustomDate(currUser.getE01DTF(),
														          		currUser.getBigDecimalE01RDM().intValue(),
														          		currUser.getBigDecimalE01RDD().intValue(),
														          		currUser.getBigDecimalE01RDY().intValue())%></div>
        	</td>
        </tr>
        <tr id="trdark"> 
         	<td width="100%" align="left">Usuario / Grupo : 
            	<input type="text" name="R01WEBUID" size="12" maxlength="10" onChange="goProcess(1)" onBlur="goProcess(1)" value="<%=userPO.getHeader1()%>">
            	<input type="text" name="USRDSC" size="50" maxlength="45"  value="<%=userPO.getHeader2()%>" readonly>
            	<a href="javascript:GetUser('R01WEBUID','USRDSC',' '); DisabledSub()">
            	<img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda Usuarios" align="bottom" border="0" ></a>
            	<a href="javascript:GetGroupId('R01WEBUID','USRDSC'); DisabledSub()">
            	<img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda Grupos" align="bottom" border="0"></a> 
        	</td>			
         </tr>	    
		<tr id="trclear"> 
			<td nowrap valign="top" width="100%" height="60"> 
          		<table id="headTable" style="width: 100%">
            	<tbody> 
            	<tr id="trintrot"> 
              		<th align="CENTER" nowrap></th>
              		<th align="CENTER" nowrap>Usuario/Grupo</th>
              		<th align="CENTER" nowrap>Nombre</th>
              		<th align="CENTER" nowrap>Tipo<br>Autorización</th>
            	</tr>
            	</tbody> 
          		</table>
          		<div id="dataDiv1" class="scbarcolor"  style="overflow-Y:scroll;height:100"> 
            	<table id="dataTable"  style="font-size:6pt">
              <%
                userList.initRow();
                while (userList.getNextRow()) {

                	datapro.eibs.beans.ESS010002Message msgList = (datapro.eibs.beans.ESS010002Message) userList.getRecord();
					if (msgList.getE02INDOPE().equals("*")) {
						break;
					}
					%>	
						<tr>
							<td nowrap align="center">	 
        						<input type="radio" name="USER" value="<%=msgList.getE02WEBUID()%>" onClick="putUser(this.value,'<%= msgList.getE02WEBUNM()%>');goProcess(1)">
        					</td> 
        					<td nowrap align="center">
        						<%= msgList.getE02WEBUID()%>
        					</td>
        					<td nowrap align="left">
        						<%= msgList.getE02WEBUNM()%>
        					</td>
        					<td nowrap align="left">
        						<%= msgList.getE02WEBAUT()%> - 
        						<% if (msgList.getE02WEBAUT().equals("A")) out.print(" Administrador"); %>
        						<% if (msgList.getE02WEBAUT().equals("S")) out.print(" Supervisor"); %>
        						<% if (msgList.getE02WEBAUT().equals("B")) out.print(" Supervisor / Operador"); %>
        						<% if (msgList.getE02WEBAUT().equals("O")) out.print(" Operador"); %>
        						<% if (msgList.getE02WEBAUT().equals("C")) out.print(" Supervisor/Operador que puede aprobar sus propias transacciones");%>
        						<% if (msgList.getE02WEBAUT().equals("I")) out.print(" Consulta"); %>
        						<% if (msgList.getE02WEBAUT().equals("G")) out.print(" Grupo"); %>
        					</td>
						</tr>
					<%	
                }
	            %>
            </table>
          </div>
        </td>
		</tr>
       </table>
<br>
    <table width="100%" border="0" cellspacing="0" cellpadding="0" bgcolor="#FFFFFF" bordercolor="#FFFFFF">
      <tr bgcolor="#FFFFFF"> 
        <td width="50%"> 
  			<div align="center"> 
	        	<input id="EIBSBTN" type="button" name="Refresh" value="Refrescar" onClick="this.disabled=true;this.value='Enviando, Favor Esperar...';goProcess(1)">
  			</div>        
  		</td>
  		<td width="50%"> 
  			<div align="center"> 
	        	<input id="EIBSBTN" type="button" name="Submit" value="Enviar" onClick="this.disabled=true;this.value='Enviando, Favor Esperar...';goProcess(2)">
  			</div>        
  		</td>
      </tr>
      <tr bgcolor="#FFFFFF"> 
        <td> </td>
      </tr>
    </table>
<br>

<%	if ( optList.getNoResult() ) { %>
 	<TABLE class="tbenter" width=100% height=30%">
 	<TR>
      <TD>         
      <div align="center"> <h4 style="text-align:center">No existen opciones de Menu en la base de datos de IBS.</h4></div>
      </TD>
	</TR>
   	</TABLE>
<%
	} else {
%>    
  <center>
    <table class="tableinfo" width="73%">
    <tr>
    <td>
   	<table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
      <tr id="trdark">
      <td colspan="8">
      <div id="container">
		<h4>OPCIONES DE MENU :  
			<input type="checkbox" name="ALL" value="1" onClick="putAll(this.checked);">
			Seleccionar todas las Opciones
			<input type="checkbox" name="NONE" value="1" onClick="delAll(this.checked);">
			Quitar todas las Opciones
		</h4>
		<div id="content">
		<noscript><p><strong>Lo siento, esta pagina necesita JavaScript para funcionar</strong></p></noscript>
		<ul id="sitemap">
      <%
      	boolean firstTimeL1 = true;
      	int i = 0;
      	optList.initRow();
      	
      	while (optList.getNextRow()) {
      		datapro.eibs.beans.ESS010001Message msgList = (datapro.eibs.beans.ESS010001Message) optList.getRecord();
      		// Level 1
      		if (msgList.getE01WEBLEV().equals("1")) { 
      			if (!firstTimeL1) {
      				out.println("</ul>");
      				out.println("</li>"); 
      			}
      			firstTimeL1 = false;
      			%>
      				<li><a href="#">
      						<input type="checkbox" id="type" name="E01ACT_<%= optList.getCurrentRow() %>" value="1" <% if (msgList.getE01ACT().equals("1")) { out.print("checked"); } %> <% if (msgList.getE01ACT().equals("2")) { out.print("checked disabled"); } %>
      						onClick="markOpt('<%=msgList.getE01WEBDEN()%>',this.checked)">
      						<%=msgList.getE01WEBDEN()%> - <%=msgList.getE01WEBDSC()%>
      					</a>
      						<input type="hidden" name="E01WEBDEN_<%= optList.getCurrentRow() %>" value="<%=msgList.getE01WEBDEN()%>">
      						<input type="hidden" name="E01WEBOPT_<%= optList.getCurrentRow() %>" value="<%=msgList.getE01WEBOPT()%>">
      						<input type="hidden" name="E01WEBLEV_<%= optList.getCurrentRow() %>" value="<%=msgList.getE01WEBLEV()%>">
      						
      				<ul>	
       	    	<%
       	    } 
       	    // Level 2
      		if (msgList.getE01WEBLEV().equals("2")) { 
      			%>
      				<li><a href="#">
      						<input type="checkbox" id="type" name="E01ACT_<%= optList.getCurrentRow() %>" value="1" <% if (msgList.getE01ACT().equals("1")) { out.print("checked"); } %> <% if (msgList.getE01ACT().equals("2")) { out.print("checked disabled"); } %>>
      						<%=msgList.getE01WEBOPT()%> <%=msgList.getE01WEBODS()%>
      					</a>
      						<input type="hidden" name="E01WEBDEN_<%= optList.getCurrentRow() %>" value="<%=msgList.getE01WEBDEN()%>">
      						<input type="hidden" name="E01WEBOPT_<%= optList.getCurrentRow() %>" value="<%=msgList.getE01WEBOPT()%>">
      						<input type="hidden" name="E01WEBLEV_<%= optList.getCurrentRow() %>" value="<%=msgList.getE01WEBLEV()%>">
      					
      				</li>	
       	    	<%
       	    }
       	 i++;   
      	}
      	if (!firstTimeL1) {
			out.println("</ul>");
			out.println("</li>");
      	}
      	%>
      	</ul>
		</div>
	</div>
	</td>
	</tr>
    </table>
    </td>
    </tr>

</table>
</center>

<SCRIPT type="text/javascript">

	document.forms[0].TOTROWS.value = <%=i%>;
	document.forms[0].NEXTROWS.value = <%= optList.getLastRec()%>;
	document.forms[0].CURRROWS.value = <%= optList.getFirstRec()%>;

</SCRIPT>	
<%	
	} 
%>

<SCRIPT type="text/javascript">

document.forms[0].totalRow.value="11";
function resizeDoc() {
           	adjustEquTables(getElement('headTable'),getElement('dataTable'), getElement('dataDiv1'),1,false);
     }
     resizeDoc();
     window.onresize = resizeDoc;

function divResize2() {
  var minValue= mainTable.offsetTop + dataDiv1.offsetTop + 30;
  var h = 400 - minValue ;
  var totalrow= parseInt(document.forms[0].totalRow.value);
  var maxHeight= totalrow * 20; 
  
  if (totalrow > 6) {
     dataDiv1.style.height= maxHeight + ""; 
     dataDiv1.style.overflowY="scroll";
  } else {
	dataDiv1.style.height= maxHeight + ""; 
   	dataDiv1.style.overflowY="";
  } 
}
     
</SCRIPT>

</form>
</body>
</html>