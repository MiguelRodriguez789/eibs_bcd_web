<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<%@ page import = "datapro.eibs.master.Util" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>

<title>Treasury - Dealer Slip</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META http-equiv="Content-Style-Type" content="text/css">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet" type="text/css" media="screen" />

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>
<jsp:useBean id= "custList" class= "datapro.eibs.beans.JBObjList"   scope="session"/>
<jsp:useBean id= "prodList" class= "datapro.eibs.beans.JBObjList"  scope="session" />
<jsp:useBean id= "currClient" class= "datapro.eibs.beans.ESD080001Message"  scope="session" />

<%
	String client = currClient != null ? currClient.getE01CUSCUN() : ""; 
	String name = currClient != null ? currClient.getE01CUSNA1() : ""; 
%>
<script src="<%=request.getContextPath()%>/pages/s/javascripts/eIBSTreasury.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/mapstyler.js"></script>
<SCRIPT type="text/javascript">
var ok = false;
 
function goProcess() {
	if(document.forms[0].R01TREACC.value == "") {
	  isCheck();
	  if ( !ok ) {
		alert("Favor Seleccionar un Producto!!!");
		return;	 
	  }
	  if(document.forms[0].R01TRECUN.value == ""){
		var formLength= document.forms[0].elements.length;
		for(n=0;n<formLength;n++) {
     		var elementName= document.forms[0].elements[n].name;
      		if(elementName == "CUSTOMER") {
				if (document.forms[0].elements[n].checked == true) {
					document.forms[0].R01TRECUN.value = document.forms[0].elements[n].value;
					break;
				}
      		}
    	}
	  }
	  if(document.forms[0].R01TRECUN.value == "") {
	  	alert("Favor Seleccionar un Cliente!!!");
		return;	 
	  }
	  document.forms[0].SCREEN.value = "2";
	} else {
	  document.forms[0].SCREEN.value = "3";                // By Reference (Update old Dealer Slip)
	}  
    document.forms[0].submit();
    document.forms[0].Submit.disabled = true;
}

function isCheck() {
	var formLength= document.forms[0].elements.length;
   	ok = false;
	for(n=0;n<formLength;n++) {
     	var elementName= document.forms[0].elements[n].name;
      	if(elementName == "ROW") {
			if (document.forms[0].elements[n].checked == true) {
				ok = true;
				break;
			}
      	}
    }
}

function maintenance(){
 	if(!document.forms[0].R01TREACC.value == ""){
 		document.forms[0].SCREEN.value = "3";
    	document.forms[0].submit();
	}
}

function getFields(prd, acd, dsc, typ, pgm) {
	document.forms[0].R01TREPRD.value = prd;
	document.forms[0].R01TREACD.value = acd;
	document.forms[0].R01TREDSC.value = dsc;
	document.forms[0].R01TRETYP.value = typ;
	document.forms[0].R01TREPGM.value = pgm;
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

<H3 align="center">Tesorería - Entrada de Tiquetes (Dealer Slip)
	<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="dealer_slip.jsp, ETR0000">
</h3>
<hr size="4">


<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.treasury.JSETR0000">

  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="2">
  <INPUT TYPE=HIDDEN NAME="actRow" VALUE="0">
  <INPUT TYPE=HIDDEN NAME="TOTROWS" VALUE="0">
  <INPUT TYPE=HIDDEN NAME="NEXTROWS" VALUE="0">
  <INPUT TYPE=HIDDEN NAME="CURRROWS" VALUE="0">
  <INPUT TYPE=HIDDEN NAME="R01TREPRD" VALUE="">
  <INPUT TYPE=HIDDEN NAME="R01TREACD" VALUE="">
  <INPUT TYPE=HIDDEN NAME="R01TREDSC" VALUE="">
  <INPUT TYPE=HIDDEN NAME="R01TRETYP" VALUE="">
  <INPUT TYPE=HIDDEN NAME="R01TREPGM" VALUE="">

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
            <input type="text" name="R01TRECUN" size="10" maxlength="9">
            <input type="text" name="CUNDSC" size="50" maxlength="45">
            <a href="javascript:GetCustomerDescId('R01TRECUN','CUNDSC','')">
            <img src="<%=request.getContextPath()%>/images/1b.gif" alt="Ayuda" align="bottom" border="0" ></a>
        </td>
      </tr>
      <tr id="trintro"> 
        <td align="right">Número de Referencia : </td>
        <td >
            <input type="text" name="R01TREACC" size="15" maxlength="12" >
          		<a href="javascript:GetDealerAcc('R01TREACC', 'X')">
          		<img src="<%=request.getContextPath()%>/images/1b.gif" alt="Ayuda" align="middle" border="0" ></a>
          		(Solo para modificar Tiquetes)
        </td>
      </tr> 
      <tr id="trdark">
      <td colspan="8">
      <div id="container">
		<h4>PRODUCTOS DISPONIBLES PARA TESORERIA : </h4>
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
      				<li><a href="#"><%= msgList.getE01TRETYP() + " - " + msgList.getE01TREDSC() %></a>
      				<ul>	
       	    	<%
       	    } 
       	    // Level 2
      		if (msgList.getE01TRELEV().equals("2")) { 
      			%>
      				<li><a href="#">
							<input type="radio" name="ROW" value="<%=msgList.getE01TREPRD()%>" 
							onClick="getFields('<%=msgList.getE01TREPRD()%>','<%=msgList.getE01TREACD()%>','<%=msgList.getE01TREDSC()%>','<%=msgList.getE01TRETYP()%>','<%=msgList.getE01TREPGM()%>')">
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
	</tr>
    </table>
  </center>

<table width="100%" border="0" cellspacing="0" cellpadding="0" bgcolor="#FFFFFF" bordercolor="#FFFFFF">
      <tr bgcolor="#FFFFFF"> 
        <td width="100%"> 
  			<div align="center"> 
	        	<input id="EIBSBTN" type="button" name="Submit" value="Enviar" onClick="goProcess()">
  			</div>        
  		</td>
      </tr>
      <tr bgcolor="#FFFFFF"> 
        <td> </td>
      </tr>
</table>
<center>
    <table  id="mainTable" class="tableinfo" width="100%">
      <tr> 
        <td nowrap valign="top" height="60" width="100%"> 
          <table id="headTable" width="100%">
            <tbody> 
            <tr id="trintrot"> 
              <th align="CENTER" nowrap >Sel</th>
              <th align="LEFT" nowrap >Número</th>
              <th align="LEFT" nowrap >Nombre</th>
              <th align="CENTER" nowrap >Identificación</th>
            </tr>
            </tbody> 
          </table>
          <div id="dataDiv2" class="scbarcolor"  style="overflow-Y:scroll;height:250" > 
            <table id="dataTable1"  style="font-size:7pt" width="100%">
              <%
                custList.initRow();
                int k = 0;
                while (custList.getNextRow()) {

                	datapro.eibs.beans.ETR000002Message msgList = (datapro.eibs.beans.ETR000002Message) custList.getRecord();
					if (msgList.getE02INDOPE().equals("*")) {
						break;
					}
					%>	
						<tr>
							<td nowrap align="center" >	 
        						<input type="radio" name="CUSTOMER" value="<%=msgList.getE02TRECUN()%>" >
        					</td> 
        					<td nowrap align="center" >
        						<%= msgList.getE02TRECUN()%>
        					</td>
        					<td nowrap align="left" >
        						<%= msgList.getE02TRENA1()%>
        					</td>
        					<td nowrap align="left" >
        						<%= msgList.getE02TREIDN()%>
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
       adjustEquTables( getElement('headTable'), getElement('dataTable'), getElement('mainTable'), getElement('dataTable1'), 1, false);
     }
     
     resizeDoc();
     window.onresize = resizeDoc;

</SCRIPT>

</form>
</body>
</html>