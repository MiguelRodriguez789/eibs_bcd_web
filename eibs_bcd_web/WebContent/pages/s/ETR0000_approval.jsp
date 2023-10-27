<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>

<title>Treasury - Approval</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META http-equiv="Content-Style-Type" content="text/css">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet" type="text/css" media="screen" />

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>
<jsp:useBean id= "dealList" class= "datapro.eibs.beans.JBObjList"   scope="session"/>
<jsp:useBean id= "prodList" class= "datapro.eibs.beans.JBObjList"  scope="session" />


<script src="<%=request.getContextPath()%>/pages/s/javascripts/eIBSTreasury.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/mapstyler.js"></script>
<SCRIPT type="text/javascript">
var ok = false;
 
function goAction(op) {
	isCheck();
	if ( !ok ) {
		alert("Favor seleccionar un Contrato!!!");
		return;
	}
			
	if (op == 'I') {;
		var page = webapp + "/servlet/datapro.eibs.treasury.JSETR0000?SCREEN=16&E03TRDACC=" + document.forms[0].E03TRDACC.value;
		CenterWindow(page, 600, 500, 2);    
		return;
	} 
	var op1 = '25';
	var op2 = '';
    if (op == 'Z') {op2 = 'A';} else {op2 = op;}
	if (op == 'R') {
		op1 = '14';
    }
    document.forms[0].action.value = op2;
    document.forms[0].reason.value = reason;
	
	if (op1 == '14') {
		if (!confirm("Desea Rechazar el Contrato " + document.forms[0].E03TRDACC.value + "?")) {
			return;
		}
	}
	document.forms[0].SCREEN.value = op1;
	document.forms[0].submit();
}

function goRefresh() {
	document.forms[0].E03TRDSTS.value = "X";
	document.forms[0].SCREEN.value = "21";
    document.forms[0].submit();
}

function isCheck() {
	var formLength= document.forms[0].elements.length;
   	ok = false;
	for(n=0;n<formLength;n++) {
     	var elementName= document.forms[0].elements[n].name;
      	if(elementName == "ACCOUNT") {
			if (document.forms[0].elements[n].checked == true) {
				ok = true;
				break;
			}
      	}
    }
}

function getType(typ) {
	document.forms[0].E03TRDTYP.value = typ;
}

function getProduct(prd) {
	document.forms[0].E03TRDPRO.value = prd;
}

function getFields(acc, pgm, dac, cun) {
	document.forms[0].E03TRDACC.value = acc;
	document.forms[0].E03TRDPGM.value = pgm;
	document.forms[0].E03TRDDAC.value = dac;
	document.forms[0].E03TRDCUN.value = cun;
}
	
function showInqWarn(fieldValue) {
	var formLength = document.forms[0].elements.length;
	for (n=0; n<formLength; n++) {
   		var elementName = document.forms[0].elements[n].name;
   		var elementValue = document.forms[0].elements[n].value;
   		if (elementName == "ACCNUM" && elementValue == fieldValue) {
      		document.forms[0].elements[n].click();
	   		break;
   		} 
    }
	var page = webapp + "/servlet/datapro.eibs.alerts.JSESD0000?ACCNUM=" + fieldValue;
	CenterWindow(page, 420, 300, 2);    
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

<H3 align="center">Tesorería - Aprobar Contratos (BackOffice)
	<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="approval.jsp, ETR0000">
</h3>
<hr size="4">


<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.treasury.JSETR0000">

  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="25">
  <INPUT TYPE=HIDDEN NAME="action" id="action" VALUE="A">
  <INPUT TYPE=HIDDEN NAME="reason" id="reason" VALUE="">
  <INPUT TYPE=HIDDEN NAME="TOTROWS" VALUE="0">
  <INPUT TYPE=HIDDEN NAME="NEXTROWS" VALUE="0">
  <INPUT TYPE=HIDDEN NAME="CURRROWS" VALUE="0">
  <INPUT TYPE=HIDDEN NAME="E03TRDDAC" VALUE="">
  <INPUT TYPE=HIDDEN NAME="E03TRDPGM" VALUE="">
  <INPUT TYPE=HIDDEN NAME="E03TRDTYP" VALUE="">
  <INPUT TYPE=HIDDEN NAME="E03TRDPRO" VALUE="">
  <INPUT TYPE=HIDDEN NAME="E03TRDSTS" VALUE="B">

<%	if ( prodList.getNoResult() ) { %>
 	<TABLE class="tbenter" width=100% height=30%">
 	<TR>
      <TD>         
      <div align="center"> <h4 style="text-align:center">No hay Productos definidos para Tesorería.<BR>Revise Tabla 04 de Códigos de Referencia.</h4></div>
      </TD>
	</TR>
   	</TABLE>
<%
	}
	else {
%>    
<center>
  <div id="dataDiv1" class="scbarcolor"  style="overflow-Y:scroll;height:250"> 
    <table id="dataTable" cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
	  <tr id="trintro"> 
        <td> 
          <div align="right">Cliente : </div>
        </td>
        <td >
            <input type="text" name="E03TRDCUN" size="10" maxlength="9">
            <input type="text" name="CUNDSC" size="50" maxlength="45">
            <a href="javascript:GetCustomerDescId('E03TRDCUN','CUNDSC','')">
            <img src="<%=request.getContextPath()%>/images/1b.gif" alt="Ayuda" align="bottom" border="0" ></a>
        </td>
      </tr>
      <tr id="trintro"> 
        <td align="right">Número de Referencia : </td>
        <td >
            <input type="text" name="E03TRDACC" size="15" maxlength="12" >
          		<a href="javascript:GetDealerAcc('E03TRDACC', 'B')"> 
          		<img src="<%=request.getContextPath()%>/images/1b.gif" alt="Ayuda" align="middle" border="0" ></a>
        </td>
      </tr> 
      <tr id="trdark">
      <td colspan="8">
      <div id="container">
		<h4>FILTRAR POR : </h4>
		<div id="content">
		<noscript><p><strong>Sorry, this page needs JavaScript to make any sense at all</strong></p></noscript>
		<ul id="sitemap">
      
      <%
      	boolean firstTimeL1 = true;
      	prodList.initRow();
      	String chk = "";
      	
      	while (prodList.getNextRow()) {
      		datapro.eibs.beans.ETR000001Message msgList = (datapro.eibs.beans.ETR000001Message) prodList.getRecord();
      		// Level 1
      		if (msgList.getE01TRELEV().equals("1")) { 
      			if (!firstTimeL1) {
      				out.println("</ul>");
      				out.println("</li>");
      			}
      			firstTimeL1 = false;
      			%>
      				<li><a href="#"><%= msgList.getE01TRETYP() + " - " + msgList.getE01TREDSC() %>
      					<input type="radio" name="ROWT" value="<%=msgList.getE01TRETYP()%>" 
							onClick="getType('<%=msgList.getE01TRETYP()%>')">
      					</a>
      				<ul>	
       	    	<%
       	    } 
       	    // Level 2
      		if (msgList.getE01TRELEV().equals("2")) { 
      			%>
      				<li><a href="#">
							<input type="radio" name="ROW" value="<%=msgList.getE01TREPRD()%>" 
							onClick="getProduct('<%=msgList.getE01TREPRD()%>')">
      						<%=msgList.getE01TREPRD() + " - " + msgList.getE01TREPDS() + " (" + msgList.getE01TRECCY() + ")" %>
      					</a>
      				</li>	
       	    	<%
       	    }
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
    </table>
  </center>

<table width="100%" border="0" cellspacing="0" cellpadding="0" bgcolor="#FFFFFF" bordercolor="#FFFFFF">
      <tr bgcolor="#FFFFFF"> 
        <td width="25%" align="center"> 
	    	<input id="EIBSBTN" type="button" name="Refresh" value="Buscar" onClick="goRefresh()">
  		</td>
  		<td width="25%" align="center"> 
	        <input id="EIBSBTN" type="button" name="Submit" value="Consultar" onClick="goAction('I')">
  		</td>
  		<td width="25%" align="center"> 
	        <input id="EIBSBTN" type="button" name="Submit" value="Aprobar" onClick="enterReason('A')">
  		</td>
  		<td width="25%" align="center"> 
	        <input id="EIBSBTN" type="button" name="Reject" value="Rechazar" onClick="enterReason('R')">
  		</td>
      </tr>
    </table>

 <center>
    <table  id="mainTable" class="tableinfo" width="100%">
      <tr> 
        <td nowrap valign="top" height="60" width="100%"> 
          <table id="headTable" width="100%">
            <tbody> 
            <tr> 
              <td align="CENTER" width="5%"></td>
              <td align="CENTER" width="5%"><b>Número<br>Tiquete</b></td>
              <td align="CENTER" width="5%"><b>Número<br>Contrato</b></td>
              <td align="CENTER" width="10%"><b>Estado</b></td>
              <td align="CENTER" width="5%"><b>Tipo</b></td>
              <td align="CENTER" width="5%"><b>Producto</b></td>
              <td align="CENTER" width="5%"><b>Código<br>Cliente</b></td>
              <td align="CENTER" width="30%"><b>Nombre</b></td>
              <td align="CENTER" width="5%"><b>MDA</b></td>
              <td align="CENTER" width="15%"><b>Monto</b></td>
              <td align="CENTER" width="10%"><b>Fecha</b></td>
            </tr>
            </tbody> 
          </table>
          <div id="dataDiv2" class="scbarcolor"  style="overflow-Y:scroll;height:250" > 
            <table id="dataTable1"  width="100%">
              <%
              	String chkWarn = "";
                dealList.initRow();
               	while (dealList.getNextRow()) {

                	datapro.eibs.beans.ETR000003Message msgList = (datapro.eibs.beans.ETR000003Message) dealList.getRecord();
					if (msgList.getE03INDOPE().equals("*")) {
						break;
					}
					chkWarn = (msgList.getH03FLGWK2().equals("A")? "<a href=\"javascript:showInqWarn('"	+ msgList.getE03TRDACC()+ "')\"><img src=\"" + request.getContextPath() + "/images/warning01.gif\" alt=\"Alerta\" align=\"middle\" border=\"0\" ></a>": "");
					%>	
						<tr>
							<td nowrap align="center" width="5%">	 
        						<input type="radio" name="ACCOUNT" value="<%=msgList.getE03TRDACC()%>" 
        						onClick="getFields('<%=msgList.getE03TRDACC()%>','<%=msgList.getE03TRDPGM()%>', '<%=msgList.getE03TRDDAC()%>', '<%=msgList.getE03TRDCUN()%>')">
        					</td>
        					<td nowrap align="center" width="5%"><%= msgList.getE03TRDACC()%><%=chkWarn%></td>
        					<td nowrap align="center" width="5%"><%= msgList.getE03TRDDAC()%></td>
        					<td nowrap align="center" width="10%">
        						<% 	if (msgList.getE03TRDSTS().equals("D")) out.print("Tiquete");
			    					else if (msgList.getE03TRDSTS().equals("B")) out.print("BackOffice"); 
			    					else if (msgList.getE03TRDSTS().equals("R")) out.print("Rechazado"); 
			    					else if (msgList.getE03TRDSTS().equals("A")) out.print("Aprobado"); 
			    					
			    				   	if(msgList.getE03TRDSBT().equals("PU")) out.print("-Compra");
                                    else if(msgList.getE03TRDSBT().equals("PA")) out.print("-Compra Adicional");
                                    else if(msgList.getE03TRDSBT().equals("SL")) out.print("-Venta");
                                    else if(msgList.getE03TRDSBT().equals("S1")) out.print("-ReVenta");
                                    else if(msgList.getE03TRDSBT().equals("PR")) out.print("-ReCompra");
                                    else if(msgList.getE03TRDSBT().equals("RL")) out.print("-Liberar Custodia");
                                    
                                %>    
        					</td>  
        					<td nowrap align="center" width="5%"><%= msgList.getE03TRDTYP()%></td>
        					<td nowrap align="center" width="5%"><%= msgList.getE03TRDPRO()%></td>
        					<td nowrap align="center" width="5%"><%= msgList.getE03TRDCUN()%></td>
        					<td nowrap align="center" width="35%"><%= msgList.getD03CUSDSC()%></td>
        					<td nowrap align="center" width="5%"><%= msgList.getE03TRDCCY()%></td>
        					<td nowrap align="center" width="15%"><%= msgList.getE03TRDOAM()%></td>
        					<td nowrap align="center" width="10%">
        						<%= datapro.eibs.master.Util.formatDate(msgList.getE03TRDODD(),msgList.getE03TRDODM(),msgList.getE03TRDODY())%>
        					</td>
						</tr>
					<%	
                }
               	}
	            %>
            </table>
          </div>
         </td>
       </tr>  
    </table>
  </center>
 
 <% 
 if ( !error.getERRNUM().equals("0")  ) {
      error.setERRNUM("0");
 %>
     <SCRIPT type="text/javascript">
            showErrors();
     </SCRIPT>
     
<%
 }
%>
<SCRIPT type="text/javascript">

     function resizeDoc() {
       adjustEquTables( getElement('mainTable'), getElement('headTable'), getElement('dataTable'), getElement('dataTable1'), 1, false);
     }
     
     resizeDoc();
     window.onresize = resizeDoc;

</SCRIPT>

</form>
</body>
</html>
 