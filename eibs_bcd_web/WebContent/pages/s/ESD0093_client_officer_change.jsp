<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>

<title>Client - Officer Change</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META http-equiv="Content-Style-Type" content="text/css">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet" type="text/css" media="screen" />

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />
<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />
<jsp:useBean id= "ofcList" class= "datapro.eibs.beans.JBObjList"   scope="session"/>
<jsp:useBean id= "custList" class= "datapro.eibs.beans.JBObjList"  scope="session" />


<script language="Javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<SCRIPT Language="javascript">
var ok = false;
 
function goProcess(scr) {
	if(document.forms[0].E01CUCOCD.value == "") {
		alert("Favor seleccione un Gerente!!!");
		initVal();
		return;	 
	}
	if(document.forms[0].E01CUCNCD.value == "") {
		alert("Favor seleccione Gerente que reemplaza!!!");
		initVal();
		return;	 
	}
	if(document.forms[0].E01CUCOCD.value == document.forms[0].E01CUCNCD.value) {
		alert("Gerente debe ser Diferente!!!");
		initVal();
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

function initVal() {
	document.forms[0].Refresh.value = 'Refrescar';
	document.forms[0].Submit.value = 'Enviar';
	document.forms[0].Refresh.disabled = false;
	document.forms[0].Submit.disabled = false;
}
function putOfc(ofc, nme) {
	document.forms[0].E01CUCOCD.value = ofc;
	document.forms[0].OFCDSC.value = nme;
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
    getElement("ALLRCD").value = "1";
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
    getElement("ALLRCD").value = "0";
 }
  
function markOpt(cust, p) {
	var formLength= document.forms[0].elements.length;
	for(n=0;n<formLength;n++) {
     	var elementName= document.forms[0].elements[n].name;
     	var val= document.forms[0].elements[n].value;
      	if(val == cust) {
      		var row = elementName.substring(7); 
      		var act = '';
      		var act1 = '';
      		if (p) {
      			act = 'getElement("E01ACT_' + row + '").checked = true;';
      			act1 = 'getElement("E01ACT_' + row + '").value = "S";';
      		} else {
      			act = 'getElement("E01ACT_' + row + '").checked = false;';
      			act1 = 'getElement("E01ACT_' + row + '").value = "U";';
      		}	
      		var myFucn = new Function(act);
 			myFucn();
 			myFucn = new Function(act1);
 			myFucn();
 			getElement("ALLRCD").value = "0";
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

<H3 align="center">Clientes - Cambio Masivo de Gerente Comercial
	<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="client_officer_change.jsp, ESD0093">
</h3>
<hr size="4">


<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSESD0093">

  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="2">
  <INPUT type=HIDDEN name="totalRow" value="1">
  <INPUT TYPE=HIDDEN NAME="actRow" VALUE="0">
  <INPUT TYPE=HIDDEN NAME="TOTROWS" VALUE="0"> 
  <INPUT TYPE=HIDDEN NAME="NEXTROWS" VALUE="0">	
  <INPUT TYPE=HIDDEN NAME="CURRROWS" VALUE="0">
  <INPUT TYPE=HIDDEN NAME="E01CUCTYP" VALUE="O">
  <INPUT TYPE=HIDDEN NAME="ALLRCD" VALUE="0">

  <table  class="tableinfo" width="100%">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <tr id="trdark"> 
        	<td width="100%" align="left">
       			<div align="left"> 	<%= currUser.getE01USNME()%></div>
          		<div align="right">Date : <%= datapro.eibs.master.Util.formatCustomDate(currUser.getE01DTF(),
          															   currUser.getBigDecimalE01RDM().intValue(),
          															   currUser.getBigDecimalE01RDD().intValue(),
          															   currUser.getBigDecimalE01RDY().intValue()) %></div>													   
        	</td>
        </tr>
        <tr id="trdark"> 
         	<td width="100%" align="left">Gerente Comercial : 
            	<input type="text" name="E01CUCOCD" size="6" maxlength="4" value="<%=userPO.getHeader1()%>">
            	<input type="text" name="OFCDSC" size="50" maxlength="45"  value="<%=userPO.getHeader2()%>" readonly>
            	<a href="javascript:GetCodeDescCNOFC('E01CUCOCD', 'OFCDSC','15'); DisabledSub()">
            	<img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda Gerentes" align="bottom" border="0" ></a>
        		 Trasladar a Gerente Comercial : 
            	<input type="text" name="E01CUCNCD" size="6" maxlength="4" value="<%=userPO.getHeader3()%>">
            	<input type="text" name="OFC2DSC" size="50" maxlength="45"  value="<%=userPO.getHeader4()%>" readonly>
            	<a href="javascript:GetCodeDescCNOFC('E01CUCNCD', 'OFC2DSC','15');">
            	<img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda Gerentes" align="bottom" border="0" ></a>
            </td>
         </tr>
         <tr id="trclear"> 
         	<td width="100%" align="left">Clientes Ordenados Por : 
         		<select name="E01ORD">
					<option <%=userPO.getHeader5().trim().equals("I")?"selected":"" %> value="I">Identificación</option>
					<option <%=userPO.getHeader5().trim().equals("N")?"selected":"" %> value="N">Nombre</option>
					<option <%=userPO.getHeader5().trim().equals("E")?"selected":"" %> value="E">Estado</option>	
				</select>
            </td>	
         </tr>	    
		<tr id="trdark"> 
			<td nowrap valign="top" width="100%" height="60"> 
          		<table id="headTable">
            	<tbody> 
            	<tr id="trintrot"> 
              		<th align="CENTER" nowrap></th>
              		<th align="CENTER" nowrap>Código</th>
              		<th align="CENTER" nowrap>Nombre Gerente</th>
              		<th align="CENTER" nowrap>Segmento</th>
              		<th align="CENTER" nowrap>Descripción Segmento</th>
            	</tr>
            	</tbody> 
          		</table>
          		<div id="dataDiv1" class="scbarcolor"  style="overflow-Y:scroll;height:100"> 
            	<table id="dataTable"  style="font-size:6pt">
              <%
                ofcList.initRow();
                while (ofcList.getNextRow()) {

                	datapro.eibs.beans.ESD009302Message msgList = (datapro.eibs.beans.ESD009302Message) ofcList.getRecord();
					if (msgList.getE02INDOPE().equals("*")) {
						break;
							
					}
					%>	
						<tr>
							<td nowrap align="center">	 
        						<input type="radio" name="OFC" value="<%=msgList.getE02CUCOFC()%>" onClick="putOfc(this.value,'<%= msgList.getE02CUCDOF()%>')">
        					</td>
        					<td nowrap align="center">
        						<%= msgList.getE02CUCOFC()%>
        					</td> 
        					<td nowrap align="left">
        						<%= msgList.getE02CUCDOF()%>
        					</td>
        					<td nowrap align="center">
        						<%= msgList.getE02CUCSEG()%>
        					</td>
        					<td nowrap align="left">
        						<%= msgList.getE02CUCDSE()%>
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

<%	if ( custList.getNoResult() ) { %>
 	<TABLE class="tbenter" width=100% height=30%">
 	<TR>
      <TD>         
      <div align="center"> <h4 style="text-align:center">No existen Clientes para este Oficial.</h4></div>
      </TD>
	</TR>
   	</TABLE>
<%
	} else {
%>    
  <center>
  <table class="tableinfo2" width="100%">
  <tr>
  <td>
   	<table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
      	<tr id="trdark">
      		<td colspan="8">
      			<div id="container">
					<h4>CLIENTES :  
						<input type="checkbox" name="ALL" value="1" onClick="putAll(this.checked);">
						Seleccionar todas los Clientes
						<input type="checkbox" name="NONE" value="1" onClick="delAll(this.checked);">
						Deshacer selección de Clientes
					</h4>
	  			</div>
	  		</td>
	  	</tr>
	  	
		<tr id="trclear"> 
			<td nowrap valign="top" width="100%" height="60"> 
          		<table id="headTable2">
            	<tbody> 
            	<tr id="trintrot"> 
              		<th align="CENTER" nowrap></th>
              		<th align="CENTER" nowrap>Código</th>
              		<th align="CENTER" nowrap>Nombre Cliente</th>
              		<th align="CENTER" nowrap>Segmento</th>
              		<th align="CENTER" nowrap>ID</th>
              		<th align="CENTER" nowrap>Mensaje</th>
           	</tr>
           	</tbody> 
          		</table>
          		<div id="dataDiv2" class="scbarcolor"  style="overflow-Y:scroll;height:500"> 
            	<table id="dataTable2">
					<%
      				int i = 0;
      				custList.initRow();
      				while (custList.getNextRow()) {
      					datapro.eibs.beans.ESD009301Message msgList = (datapro.eibs.beans.ESD009301Message) custList.getRecord();
      					if (msgList.getE01INDOPE().equals("*")) {
						break;
						}
      			%>		<tr>
							<td nowrap align="center">
      							<input type="checkbox" id="sel" name="E01ACT_<%= custList.getCurrentRow() %>" value="S" <% if (msgList.getE01ACT().equals("S")) { out.print("checked"); } %> 
      								onClick="markOpt('<%=msgList.getE01CUCCUN()%>',this.checked)">
      						</td>
      						<td nowrap align="center"><%=msgList.getE01CUCCUN()%></td>
      						<input type="hidden" name="E01CUCCUN_<%=custList.getCurrentRow() %>" value="<%=msgList.getE01CUCCUN()%>">
      						<td nowrap align="left"><%=msgList.getD01NA1()%></td>
      						<td nowrap align="center"><%=msgList.getE01CUCSEG()%></td>
      						<td nowrap align="left"><%=msgList.getE01CUCTID()%> - <%=msgList.getE01CUCIDN()%></td>
      						<td nowrap align="left" style="color:red;font-size:12;"><%=msgList.getE01CUCERR()%></td>
       	    	<%
       	 				i++;   
      				}
      			%>			
      			</table>
      			</div>
      		</td>	
		</tr>
    </table>
    </td>
    </tr>
</table>
</center>

<SCRIPT language="JavaScript">

	document.forms[0].TOTROWS.value = <%=i%>;
	document.forms[0].NEXTROWS.value = <%= custList.getLastRec()%>;
	document.forms[0].CURRROWS.value = <%= custList.getFirstRec()%>;

</SCRIPT>	
<%	
	} 
%>

<SCRIPT language="JavaScript">

document.forms[0].totalRow.value="11";
function resizeDoc() {
      adjustEquTables(headTable, dataTable, dataDiv1,1,false);
      adjustEquTables(headTable2, dataTable2, dataDiv2,1,false);
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