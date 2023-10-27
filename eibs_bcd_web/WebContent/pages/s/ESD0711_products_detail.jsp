<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@page import="com.lowagie.text.Document"%>
<HTML>
<HEAD>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Studio">
<LINK HREF="<%=request.getContextPath()%>/pages/style.css" REL="stylesheet">

<%@ page import = "java.io.*,java.net.*,datapro.eibs.sockets.*,datapro.eibs.beans.*,datapro.eibs.master.*,java.math.*" %>

<TITLE>Ayuda</TITLE>

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>
<jsp:useBean id="data" class="datapro.eibs.beans.ESD071102Message"  scope="session" />

<%
	// Parameter entries
	String bank = request.getParameter("bank") == null ? "" : request.getParameter("bank");
	String appCode = request.getParameter("appcode") == null ? "" : request.getParameter("appcode");
	String typeCode = request.getParameter("typecode") == null ? "" : request.getParameter("typecode");
	String cusnum = userPO.getCusNum() == null ? "0" : userPO.getCusNum().trim();
	String generic = request.getParameter("generic") == null ? "" : request.getParameter("generic");
	String title = request.getParameter("title") == null ? "" : request.getParameter("title");
	String sel = request.getParameter("sel") == null ? "" : request.getParameter("sel");
	String accnum = request.getParameter("accnum") == null ? "" : request.getParameter("accnum");
	String deapac = request.getParameter("deapac") == null ? "" : request.getParameter("deapac");
	String deaoam = request.getParameter("deaoam") == null ? "" : request.getParameter("deaoam");
	String deacnv = request.getParameter("deacnv") == null ? "" : request.getParameter("deacnv");
	int k = 0; 
	int appCod = 0;
	boolean displayTypes = "".equals(typeCode);
	boolean autoNum = false;
%>

<script type="text/javascript">

function goAsign() {
	var url = "<%=request.getContextPath()%>/servlet/datapro.eibs.salesplatform.JSEPV0150?SCREEN=700";		
	CenterWindow(url, 30, 30, 2);		
}

function showHiddenDivNew(evt) {
	var show = goNew();
	var showLN = goNewLN();
	if (showLN) {
		if(getElement("codigoDeConvenio").style.display == 'none' && getElement("loanAmountTR").style.display == 'none'){
			goAction(10);
		} else {
			evt = (evt) ? evt : ((window.event) ? window.event : "");
			var hiddenDiv = getElement("hiddenDivNewLN");
			var y = evt.clientY + document.body.scrollTop;
			var x = evt.clientX + document.body.scrollLeft;
			cancelBub(evt);
			moveElement(hiddenDiv, y, x - 200);
			setVisibility(hiddenDiv, "visible");
			document.forms[0].deaoam.focus();
		}
	} else if (show) {
		evt = (evt) ? evt : ((window.event) ? window.event : "");
		var hiddenDiv = getElement("hiddenDivNew");
		var y = evt.clientY + document.body.scrollTop;
		var x = evt.clientX + document.body.scrollLeft;
		cancelBub(evt);
		moveElement(hiddenDiv, y, x - 200);
		setVisibility(hiddenDiv, "visible");
		document.forms[0].accnum.focus();
	} else {
			goAction(10);
	}
}

function goNew(){
	<% 
		autoNum = false;
		try {
			appCod = Integer.parseInt(appCode);
		} catch (Exception e) {
			appCod = 0;
		}
		switch (appCod) {
			case 11 :
			case 12 :  
				autoNum = JSEIBSProp.getAutoNumCD();
				break;
			case 1 :	
			case 2 :
			case 3 :
			case 5 :
				autoNum = JSEIBSProp.getAutoNumRT();
				break;
			case 4 :	
				autoNum = JSEIBSProp.getAutoNumSV();
				break;
			case 10 :	
				autoNum = JSEIBSProp.getAutoNumLN();
				break;
			default :
				autoNum = false;
				break;
		}
	%>	
	return <%= autoNum %>
}

function goNewLN(){
	<% 
		autoNum = false;
		try {
			appCod = Integer.parseInt(appCode);
		} catch (Exception e) {
			appCod = 0;
		}
		
		if(generic.trim().equals("G") || generic.trim().equals("V")){
			appCod = 0;
		}
		
		
		switch (appCod) {
			case 10 :	
				autoNum = true;
				break;
			default :
				autoNum = false;
				break;
		}
	%>	
	return <%= autoNum %>
}

function showHiddenDivParam() {
	evt = (evt) ? evt : ((window.event) ? window.event : "");
	var hiddenDiv = getElement("hiddenDivParam");
	var y = evt.clientY + document.body.scrollTop;
	var x = evt.clientX + document.body.scrollLeft;
	cancelBub(evt);
	moveElement(hiddenDiv, y, x - 200);
	setVisibility(hiddenDiv, "visible");
	document.forms[0].deapac.focus();
}

function goNewPAR(){
	closeEnter();
	if (document.forms[0].par.value == 'P') {
		ShowEnterPar();
	} else {
		goAction(10);
	}
}

function closeHiddenDivNew(){
	setVisibility(getElement("hiddenDivNew"), "hidden");
}

function closeHiddenDivNewLN(){
	setVisibility(getElement("hiddenDivNewLN"), "hidden");
}

function closeHiddenDivParam(){
	setVisibility(getElement("hiddenDivParam"), "hidden");
}

function closeHiddenDivs(){
	closeHiddenDivNew();
	closeHiddenDivNewLN();
	closeHiddenDivParam();
}

function goAction(s) {
	document.forms[0].SCREEN.value = s;
	var formLength = document.forms[0].elements.length;
	var ok = false;
	for (n=0; n<formLength; n++) {
		var elementName= document.forms[0].elements[n].name;
		if(elementName == "PROD_CODE") {
			ok = true;
			break;
		}
	}
	if ( ok || (s == 12)) {
		switch ( s ) {
			case 2 : 
			case 4 : 
			case 6 : 
				document.forms[0].target="detail";
				document.forms[0].submit();
				break;
			case 8 : 
				document.forms[0].target="detail";
				document.forms[0].submit();
				break;
			case 10 : 
				document.forms[0].target="detail";
				if (getElement("eibsNew")) 
					getElement("eibsNew").onclick = "";
				document.forms[0].submit();
				break;
			case 12 : 
				parent.window.location.href="<%=request.getContextPath()%>/pages/background.jsp";
				break;
			default : 
		}
	} else {
		alert("Seleccione un producto antes de realizar esta operación");	   
	}
}

function setValues(prod, bank, row) {
 	//document.forms[0].PROD_CODE.value = prod;
	document.forms[0].bank.value = bank;
	highlightRow('dataTableDetail', row);
}

function setConvenio(flag) {
	if(getElement("codigoDeConvenio") != null){
		if(flag == "Y") {
		 getElement("codigoDeConvenio").style.display = 'table-row';
		} else{ 
		 getElement("codigoDeConvenio").style.display = 'none';
		}
	}
	
}

function setReestruct(flag) {
	if(getElement("eibsNew") != null){
		if(flag == "Y") {
		 getElement("loanAmountTR").style.display = 'none';
		} else{ 
		 getElement("loanAmountTR").style.display = 'table-row';
		}
	}
}
</script>

</HEAD>
<BODY >

<% 
	String FirstValue = "";
	if ( !"0".equals(error.getERRNUM())) {
		error.setERRNUM("0");
		out.println("<SCRIPT Language=\"Javascript\">");
		out.println("       showErrors()");
		out.println("</SCRIPT>");
	} else {
		String action = userPO.getHeader2() == null ? "" : userPO.getHeader2();
		userPO.setHeader2("");
		String mypage = userPO.getHeader3() == null ? "" : userPO.getHeader3();
		userPO.setHeader3("");
		if (action.equals("DO_INQ")) {
			if (!mypage.equals("")) {
%>		
				<SCRIPT type="text/javascript">
					CenterWindow('<%= mypage %>', 620, 500, 2);
				</SCRIPT>
<% 
			}
		} else if (action.equals("DO_NEW")) {
			if ( !mypage.equals("") ) {
							out.println("<SCRIPT Language=\"Javascript\">");
							out.println("addEventHandler(document, 'DOMContentLoaded', function() {document.getElementsByTagName('body')[0].className = 'waiting';});");
							out.println("parent.window.location.href=\"" + mypage + "\";");
							out.println("</SCRIPT>");
						}	
		} else if (action.equals("DO_HTML")) {
			 if (!mypage.equals("")) {
%>
				<SCRIPT type="text/javascript">	
					CenterWindow('<%= mypage %>', 620, 500, 2);
				</SCRIPT>
<%
			 }
		}
	}
%>

<FORM Method="post" Action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSESD0711" title="product_detail.jsp,ESD0711">
	<INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="">
	<INPUT TYPE=HIDDEN NAME="totalRow" VALUE="0">
	<INPUT TYPE=HIDDEN NAME="bank" VALUE="<%= bank %>">
	<INPUT TYPE=HIDDEN NAME="appcode" VALUE="<%= appCode %>">
	<INPUT TYPE=HIDDEN NAME="typecode" VALUE="<%= typeCode %>">
	<INPUT TYPE=HIDDEN NAME="cusnum" VALUE="<%= cusnum %>">
	<INPUT TYPE=HIDDEN NAME="generic" VALUE="<%= generic %>">
	<INPUT TYPE=HIDDEN NAME="title" VALUE="<%= title %>">
	<INPUT TYPE=HIDDEN NAME="sel" VALUE="<%= sel %>">
	<INPUT TYPE=HIDDEN NAME="par">

	
	<div id="hiddenDivNew" class="hiddenDiv">
		 <TABLE id=tbhelp style="border-top-width : 1px;border-right-width : 1px;border-bottom-width : 1px;border-left-width : 1px;
			border-color: #0b23b5;
			border-style : solid solid solid solid;
			filter:progid:DXImageTransform.Microsoft.dropshadow(OffX=3, OffY=3, Color='gray', Positive='true');">
			<TR>
	  			<TD ALIGN=right nowrap>Introduzca el número de cuenta : 
          			<input type="text" maxlength="12" size="13" name="accnum" onKeyPress="enterInteger(event)" value="<%= accnum %>">
      			</TD>
      			<TD ALIGN=Left nowrap>
	     			<a href="javascript:goAction(10)"><img name="Image1" border="0" src="<%=request.getContextPath()%>/images/s/applicar_on.gif"></a> 
	  			</TD>
			</TR>
		</TABLE>
	</div>
	
	<div id="hiddenDivNewLN" class="hiddenDiv">
		<table id=tbhelp style="border-top-width : 1px;border-right-width : 1px;border-bottom-width : 1px;border-left-width : 1px;
			border-color: #0b23b5;
			border-style : solid solid solid solid;
			filter:progid:DXImageTransform.Microsoft.dropshadow(OffX=3, OffY=3, Color='gray', Positive='true');">
			<tr id="loanAmountTR" style="display: none">
				<td align=right nowrap>Monto del Cr&eacute;dito :</td>
				<td > 
					<input type="text" name="deaoam" maxlength="20" size="22" value="" onclick="this.select();" onkeypress="enterDecimal(event, 2)" onblur="this.value = formatCCY(this.value)" class="TXTRIGHT"> 
				</td>
			</tr> 
			<tr id="codigoDeConvenio" style="display: none">
				<td align=right nowrap>Codigo de Convenio :  </td>
				<td > 
					<input type="text" name="deacnv" size="5" maxlength="4" value="<%= deacnv %>" >
					<a href="javascript:GetConvenio('deacnv','',document.forms[0].cusnum.value)"><img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="bottom" border="0" ></a>
					<a href="#" onclick="goAsign();">&nbsp;&nbsp;&nbsp;<b>Asignar</b></a>
				</td>
			</tr>
			<tr>
				<td align=center colspan="2" class="tdbkg">
					<a href="javascript:goAction(10)"><b>Enviar</b></a>
				</td>
			</tr>
		</table>
	</div>

	<div id="hiddenDivParam" style="position:absolute; visibility:hidden; left:25px; top:-50px; z-index:3; filter:progid:DXImageTransform.Microsoft.Fade(duration=1.0,overlap=1.0)" onclick="cancelBub()">
		 <TABLE id=tbhelp style="border-top-width : 1px;border-right-width : 1px;border-bottom-width : 1px;border-left-width : 1px;
			border-color: #0b23b5;
			border-style : solid solid solid solid;
			filter:progid:DXImageTransform.Microsoft.dropshadow(OffX=3, OffY=3, Color='gray', Positive='true');">
			<TR>
	  			<TD ALIGN=right nowrap>Enter Participated Loan Number : 
          			<input type="text" maxlength=9 size=11 name="deapac" onKeyPress="enterInteger(event)" value="<%= accnum %>">
          			<a href="javascript:GetParticipation('deapac')">
          				<img src="<%=request.getContextPath()%>/images/1b.gif" title="help" align="bottom" border="0" >
          			</a> 
      			</TD>
      			<TD ALIGN=Left nowrap>
	     			<a href="javascript:goAction(10)">
	     				<img name="Image1" border="0" src="<%=request.getContextPath()%>/images/s/applicar_on.gif">
	     			</a> 
	  			</TD>
			</TR>
		</TABLE>	
	</div>
<%
  	if (displayTypes) { // Types Detail
%>
		<table class="tbenter" width=100% align=center>
	    	<tr>
            	<td width="25%">
                	<div align="center"><a href="javascript:goAction(2)"><img src="<%=request.getContextPath()%>/images/s/prod_audio.gif" align="middle" border="0"></a></div>
              	</td>
              	<td width="25%">
                	<div align="center"><a href="javascript:goAction(4)"><img src="<%=request.getContextPath()%>/images/s/prod_video.gif" align="middle" border="0"></a></div>
              	</td>
              	<td width="25%">
                	<div align="center"><a href="javascript:goAction(6)"><img src="<%=request.getContextPath()%>/images/s/prod_html.gif" align="middle" border="0"></a></div>
              	</td>
              	<td width="25%">
                	<div align="center"><a href="javascript:goAction(12)"><img src="<%=request.getContextPath()%>/images/s/prod_exit.gif" align="middle" border="0"></a></div>
                </td>	
            </tr>
         </table>
         <table cellspacing="0" cellpadding="2" width="100%" border="1">
           	<tr > 
            	<td nowrap> 
               		<table cellspacing="0" cellpadding="2" class="tbhead" width="100%"  align="center">
         				<tr>
         					<td align=left colspan=5 NOWRAP> <%= title %></td>
         				</tr>
                	</table>
              	</td>
            </tr>
         </table>
         <TABLE  id="mainTable" class="tableinfo">
				 <tr height="5%">
					<td NOWRAP valign="top" width="80%">
				  		<TABLE id="headTable" width="100%" >
       					<TR id="trdark">  
							<TD align="center" width="10%" nowrap>&nbsp;</TD>
							<TD align="center" width="30%" nowrap>Tipo</TD>
							<TD align="left" width="70%" nowrap>Descripción</TD>
		 				</TR>
     				</TABLE>
					</td>	
			  	</TR>	
			  	<TR height="95%"> 
			    	<TD NOWRAP valign="top" width="80%">
   					<div id="dataDiv1" class="scbarcolor" style="height:200px; overflow:auto;">
    					<table id="dataTableDetail" width="100%">
<% 
						session = (HttpSession) request.getSession(false);
						
						if (session != null) {
					
						  	MessageProcessor mp = null;
							ESS0030DSMessage msgUser = (ESS0030DSMessage) session.getAttribute("currUser");
					      	try {
					      		mp = new MessageProcessor("ESD0711");
								ESD071102Message msgHelp = (ESD071102Message) mp.getMessageRecord("ESD071102");
					            msgHelp.setE02USERID(msgUser.getH01USR());
					            msgHelp.setE02SELACD(appCode); 
					           	msgHelp.setE02GENERI(generic);
					           	msgHelp.setE02SELTYP(typeCode);
					            mp.sendMessage(msgHelp);
					            JBObjList list = mp.receiveMessageRecordList("E02OPERAC");
					      		
					            if (!list.isEmpty()) {
									boolean firstItem = true;
									String chk = "";
									String col = "";
					            	list.initRow();
					            	while (list.getNextRow()) {
					            		msgHelp =  (ESD071102Message) list.getRecord();
					           			out.println("<tr id=\"trclear\">");
				           				col = msgHelp.getE02APCTYP().trim().equals("") ? "&nbsp;" : msgHelp.getE02APCTYP().trim(); 
				    					if (sel.equals("")) {
				    						chk = firstItem ? "checked" : "";
				               				firstItem = false;
				                        } else if (sel.equals(col)) {
				    						chk = firstItem ? "checked" : "";
				               				firstItem = false;
				                        } else {
				                            chk = "";
				                        }
				           				out.println("<td width=\"10%\" NOWRAP>" +
				           					"<input type=\"radio\" name=\"PROD_CODE\" value=\"" + col + "\" " +
				           					"onclick=\"setValues('"+ col + "','" + msgHelp.getE02APCBNK() + "',"+ list.getCurrentRow() +")\"" + chk + "></td>"); // radio button
				           				out.println("<td align=\"center\" width=\"30%\" NOWRAP>" + col + "</td>"); // Type Code
				           				col = msgHelp.getE02DESCRI().trim().equals("") ? "&nbsp;" : msgHelp.getE02DESCRI().trim(); 
				           				out.println("<td width=\"70%\" NOWRAP><div >"  + col + "</div></td>"); // Description
					        			out.println("</tr>");
					           			k++;
					            	}
					            }
					      		
							} finally {
								if (mp != null) mp.close();
							}            
						}
%>    					
    					</table>
    				</div>
    			</TD>
    		</TR>
    	</TABLE>						
<%
	} else { // Products Detail
%>	
	         <table class="tbenter" width=100% align=center style="height: 70px">
	         	<tr>
	            	<td width="2%"></td>
	              	<td width="16%">
	                	<div align="center"><a href="javascript:goAction(2)"><img src="<%=request.getContextPath()%>/images/s/prod_audio.gif" align="middle" border="0"></a></div>
	              	</td>
	              	<td width="16%">
	                	<div align="center"><a href="javascript:goAction(4)"><img src="<%=request.getContextPath()%>/images/s/prod_video.gif" align="middle" border="0"></a></div>
	              	</td>
	              	<td width="16%">
	                	<div align="center"><a href="javascript:goAction(6)"><img src="<%=request.getContextPath()%>/images/s/prod_html.gif" align="middle" border="0"></a></div>
	              	</td>
	              	<td width="16%">
	                	<div align="center"><a href="javascript:goAction(8)"><img src="<%=request.getContextPath()%>/images/s/prod_inquiry.gif" align="middle" border="0"></a></div>
	              	</td>
	              	<td width="16%">
	                	<div id="eibsNew" align="center" ><img src="<%=request.getContextPath()%>/images/s/prod_new.gif" align="middle" border="0" style="cursor:hand" ></div>
	              	</td>
	              	<td width="16%">
	                	<div align="center"><a href="javascript:goAction(12)"><img src="<%=request.getContextPath()%>/images/s/prod_exit.gif" align="middle" border="0"></a></div>
	              	</td>
	              	<td width="2%"></td>
	           	</tr>
	         </table>
         	<table cellspacing="0" cellpadding="2" width="100%" border="1" style="width: 100%">
           		<tr> 
             		<td nowrap> 
               			<table cellspacing="0" cellpadding="2" class="tbhead" width="100%"  align="center">
							<tr>
								<td align=left colspan=5 NOWRAP> <%=typeCode %>  - <%= title %></td>
							</tr>
                		</table>
              		</td>
            	</tr>
         	</table>
  	   		<TABLE  id="mainTable" class="tableinfo">
				 <tr height="5%">
					<td NOWRAP valign="top" width="100">
				  		<TABLE id="headTable" width="100%" >
 			 				<TR id="trdark">  
								<TD align="center" width="5%" nowrap>&nbsp;</TD>
							    <TD align="center" width="10%" nowrap>Producto</TD>
							    <TD align="center" width="10%" nowrap>Banco</TD>
							    <TD align="center" width="10%" nowrap>Moneda</TD>
							    <TD align="left" width="35%" nowrap>Descripción</TD>
							    <TD align="center" width="30%" nowrap><div>Nombre de Mercadeo</div></TD>
	     					</TR>
						</TABLE>
					</td>	
			  	</TR>	
			  	<TR height="95%"> 
			    	<TD NOWRAP valign="top" width="80%">
					   	<div id="dataDiv1" class="scbarcolor" style="height:200px; overflow:auto;">
					    	<table id="dataTableDetail" width="100%">
<% 
							session = (HttpSession) request.getSession(false);
							FirstValue = "";
							
							if (session != null) {
						
							  	MessageProcessor mp = null;
								ESS0030DSMessage msgUser = (ESS0030DSMessage) session.getAttribute("currUser");
						      	try {
						      		mp = new MessageProcessor("ESD0711");
									ESD071102Message msgHelp = (ESD071102Message) mp.getMessageRecord("ESD071102");
						            msgHelp.setE02USERID(msgUser.getH01USR());
						            msgHelp.setE02SELACD(appCode); 
						           	msgHelp.setE02GENERI(generic);
						           	msgHelp.setE02SELTYP(typeCode);
						            mp.sendMessage(msgHelp);
						            JBObjList list = mp.receiveMessageRecordList("E02OPERAC");
						      		
						            if (!list.isEmpty()) {
										boolean firstItem = true;
										String chk = "";
										String col = "";
						            	list.initRow();
						            	while (list.getNextRow()) {
						            		msgHelp =  (ESD071102Message) list.getRecord();
						           			out.println("<tr>");
					           				col = msgHelp.getE02APCCDE().trim().equals("") ? "&nbsp;" : msgHelp.getE02APCCDE().trim(); 
					    					if (sel.equals("")) {
					    						chk = firstItem ? "checked" : "";
					               				if (firstItem) FirstValue = col;
					               				firstItem = false;
					                        } else if (sel.equals(col)) {
					    						chk = firstItem ? "checked" : "";
					                        } else {
					                            chk = "";
					                        }
					           				out.println("<td width=\"5%\" align=\"center\" NOWRAP>" +
					           					"<input type=\"radio\" name=\"PROD_CODE\" value=\"" + col + "\" " + 
												"onclick=\"setValues('"+ col + "','" + msgHelp.getE02APCBNK() + "', "+ list.getCurrentRow() +"), setReestruct('"+ msgHelp.getE02FLGREE() +"') ,setConvenio('"+ msgHelp.getE02FLGCNV() +"')\"" + chk + "></td>"); // radio button
					           				out.println("<td align=\"center\" width=\"10%\" NOWRAP>" + col + "</td>"); // Prod Code
					           				col = msgHelp.getE02APCBNK().trim().equals("") ? "&nbsp;" : msgHelp.getE02APCBNK().trim(); 
					           				out.println("<td align=\"center\" width=\"10%\" NOWRAP>" + col + "</td>"); // Bank Code
					           				col = msgHelp.getE02CURREN().trim().equals("") ? "&nbsp;" : msgHelp.getE02CURREN().trim(); 
					            			out.println("<td align=\"center\" width=\"10%\" NOWRAP>" + col + "</td>"); // Currency Code
					            			col = msgHelp.getE02DESCRI().trim().equals("") ? "&nbsp;" : msgHelp.getE02DESCRI().trim(); 
					           				out.println("<td width=\"35%\" NOWRAP><div >"  + col + "</div></td>"); // Description
					           				col = msgHelp.getE02NICNME().trim().equals("") ? "&nbsp;" : msgHelp.getE02NICNME().trim(); 
					            			out.println("<td align=\"center\" width=\"30%\" NOWRAP><div >" + col + "</div></td>"); // Nick Name
						        			out.println("</tr>");
						           			k++;
						            	}
						            }
						      		
								} finally {
									if (mp != null) mp.close();
								}            
							}
%>    					
					    	</table>
						</div>
	    			</TD>
	    		</TR>	
	         </TABLE>
	         
<% 
	}
%>		
<SCRIPT type="text/javascript">

	document.forms[0].totalRow.value="<%= k %>";
	
	clickElement('PROD_CODE', '<%=FirstValue%>');
	
/* 	function resizeDoc() {
		divResize();
		adjustEquTables(
		getElement("headTable"), 
		getElement("dataTableDetail"), 
		getElement("dataDiv1"), 1, false);
	}
	
	resizeDoc();
	window.onresize = resizeDoc; */

	applyTrans(getElement("hiddenDivNew"));
		 
	addEventHandler(document, 'click' , closeHiddenDivs);
	getElement("hiddenDivNew").onclick = cancelBub;
	getElement("hiddenDivNewLN").onclick = cancelBub;
	getElement("hiddenDivParam").onclick = cancelBub;
	
	if (getElement("eibsNew")) 
		getElement("eibsNew").onclick = showHiddenDivNew;
	if (getElement("eibsParam")) 
		getElement("eibsParam").onclick = showHiddenDivParam;

</SCRIPT>
			    	
</FORM>
</BODY>
</HTML>

