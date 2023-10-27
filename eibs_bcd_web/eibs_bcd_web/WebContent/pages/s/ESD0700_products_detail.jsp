<HTML>
<HEAD>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<LINK HREF="<%=request.getContextPath()%>/pages/style.css" REL="stylesheet">
<%@ page import="java.io.*,java.net.*,datapro.eibs.sockets.*,datapro.eibs.beans.*,datapro.eibs.master.*,java.math.*"%>

<TITLE>Productos IBS</TITLE>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>

<jsp:useBean id="error" class="datapro.eibs.beans.ELEERRMessage" scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session" />
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />


<%
	String FirstValue = "";

	// Parameter entries
  	String bank = request.getParameter("bank") == null ? "" : request.getParameter("bank");
  	String appCode = request.getParameter("appcode") == null ? "" : request.getParameter("appcode");
  	String typeCode = request.getParameter("typecode") == null ? "" : request.getParameter("typecode");
  	String generic = request.getParameter("generic") == null ? "" : request.getParameter("generic");
  	String title = request.getParameter("title") == null ? "" : request.getParameter("title");
  	String sel = request.getParameter("sel") == null ? "" : request.getParameter("sel");
	String accnum = request.getParameter("accnum") == null ? "" : request.getParameter("accnum");
	int k = 0; 
  	boolean displayTypes = "".equals(typeCode);
%>
<script type="text/javascript">

function closeHiddenDivNew(){
	setVisibility(document.getElementById("hiddenDivNew"), "hidden");
}

function showHiddenDivNew(evt) {
	evt = (evt) ? evt : ((window.event) ? window.event : "");
 	
	var hiddenDivNew = document.getElementById("hiddenDivNew");

	var y=evt.clientY + document.body.scrollTop;
	var x=evt.clientX + document.body.scrollLeft;
     
	cancelBub(evt);

	moveElement(hiddenDivNew, y, x);
	setVisibility(hiddenDivNew, "visible");
	 
	document.forms[0].newprod.focus();
}


function goAction(s) {
	 var chkRow; 
	 document.forms[0].SCREEN.value = s;
     var formLength = document.forms[0].elements.length;
     var ok = false;
     for (n=0; n<formLength; n++) {
      	var elementName = document.forms[0].elements[n].name;
      	if (elementName == "PROD_CODE")	{
        		ok = true;
        		break;
      	}
     }
	 if ( ok || (s == 12) || (s == 2)) {
     	  switch ( s ) {
             case 2 : 
             case 4 : 
				var chkRow = getRadioVal("PROD_CODE");
 				 sessionStorage.setItem('chkRow', chkRow);
                 document.forms[0].target = "detail";
                 document.forms[0].submit();
                 break;
             case 6 : 
     			var confirm1 = true;
    	  		confirm1 = confirm("Desea Eliminar este Registro Seleccionado?");
				if (confirm1) {
	                document.forms[0].target = "detail";
                 	document.forms[0].submit();
                 }
                 break;
             case 12 : 
                 parent.window.location.href="<%=request.getContextPath()%>/pages/background.jsp";
                 break;
             default :
             	break; 
          }
     } else {
			alert("Seleccione un producto antes de realizar esta operación");	   
     }
}
  
function setValues(prod, bank, row) {
 	//document.forms[0].PROD_CODE.value = prod;
	document.forms[0].bank.value = bank;
	highlightRow('dataTable', row);
}

addEventHandler(document, 'click' , closeHiddenDivNew);

</script>

</HEAD>
<BODY>

<% 
 	if (!error.getERRNUM().equals("0")) {
	    out.println("<SCRIPT Language=\"Javascript\">");
	    out.println("       showErrors()");
	    error.setERRNUM("0");
	    out.println("</SCRIPT>");
	} else {
      	String action = null;
      	try {
 			action = userPO.getHeader2();
 			userPO.setHeader2("");
      	} catch (Exception e) {
      	 	action = "";
      	}
      	String mypage = null;
      	try {
 			mypage = userPO.getHeader3();
 			userPO.setHeader3("");
      	} catch (Exception e) {
      	 	mypage = "";
      	}
      	if ( action.equals("DO_NEW") || action.equals("DO_MAINT")) {
        	if ( !mypage.equals("") ) {
%>  
				<SCRIPT type="text/javascript">	
					CenterWindow('<%= mypage %>', 1150, 700, 2);
              	</SCRIPT>       	
<%        	
        	}
  		}
  	}	                	 
%>
<h3><img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="products_detail.jsp,ESD0700"></h3>

<FORM Method="post"	Action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSESD0700">
	<INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="">
	<INPUT TYPE=HIDDEN NAME="totalRow" VALUE="0">
	<INPUT TYPE=HIDDEN NAME="bank" VALUE="<%= bank %>"> 
	<INPUT TYPE=HIDDEN NAME="appcode" VALUE="<%= appCode %>">
	<INPUT TYPE=HIDDEN NAME="typecode" VALUE="<%= typeCode %>">
	<INPUT TYPE=HIDDEN NAME="generic" VALUE="<%= generic %>">
	<INPUT TYPE=HIDDEN NAME="title" VALUE="<%= title %>">
	<INPUT TYPE=HIDDEN NAME="sel" VALUE="<%= sel %>">	
	<input type="HIDDEN" name="H01FLGMAS"  >
	
	<div id="hiddenDivNew" class="hiddenDiv">
		<TABLE id=tbhelp class=tableinfo>
			<TR>
				<TD ALIGN=right nowrap>Introduzca el código de Producto : 
					<input type="text" maxlength=4 size=4 name="newprod" value="">
				</TD>
				<TD class=TDBKG align="left"><a href="javascript:javascript:goAction(2)" id="linkApplicar"><b>Aplicar</b></a></TD>
			</TR>
		</TABLE>
	</div>
	
<%
	if ( displayTypes ) {  // Types Detail
%>	
		<table class="tbenter" width=100% align=center>
			<tr>
		      <% if( "1".equals( currUser.getH01WK1() ) ){ %>
				<td class=TDBKG><div align="center"><a href="javascript:goAction(9)"><b>Consultar</b></a></div></td>
		      <% } else { %>

				<td class=TDBKG><div align="center"><a href="javascript:goAction(8)"><b>Crear</b></a></div></td>
				<td class=TDBKG><div align="center"><a href="javascript:goAction(9)"><b>Modificar</b></a></div></td>
				<td class=TDBKG><div align="center"><a href="javascript:goAction(10)"><b>Borrar</b></a></div></td>
		      <% } %>

				<td class=TDBKG><div align="center"><a href="javascript:goAction(12)"><b>Salir</b></a></div></td>
			</tr>
		</table>
		<table cellspacing="0" cellpadding="2" width="100%" border="1">
			<tr>
				<td nowrap>
					<table cellspacing="0" cellpadding="2" class="tbhead" width="100%" align="center">
						<tr>
							<td align=left colspan=5 NOWRAP><%= title %></td>
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
						<TR id="trdark">
							<TD align="center" nowrap></TD>
							<TD align="center" nowrap>Tipo</TD>
							<TD align="center" nowrap>Descripción</TD>
		 				</TR>
     				</TABLE>
					</td>	
			  	</TR>	
			  	<TR height="95%"> 
			    	<TD NOWRAP valign="top" width="80%">
   					<div id="dataDiv1" class="scbarcolor" style="height:200px; overflow:auto;">
    					<table id="dataTable" width="100%">
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
					           	if ("MAINTENANCE".equals(userPO.getPurpose())) {
					           		msgHelp.setE02APCTYP("M");
					           	}
					           	
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
				           				col = msgHelp.getE02APCTYP().trim().equals("") ? "&nbsp;" : msgHelp.getE02APCTYP().trim(); 
			               				if (firstItem) FirstValue = col;
				    					if (sel.equals("")) {
				    						chk = firstItem ? "checked=\"checked\"" : "";
				               				firstItem = false;
				                        } else if (sel.equals(col)) {
				    						chk = firstItem ? "checked=\"checked\"" : "";
				               				firstItem = false;
				                        } else {
				                            chk = "";
				                        }
				           				out.println("<td width=\"10%\" NOWRAP>" +
				           					"<input type=\"radio\" name=\"PROD_CODE\" class=\"highlight\" " + chk + " value=\"" + col + "\" " +
				           					"onclick=\"setValues('"+ col + "','" + msgHelp.getE02APCBNK() + ","+list.getCurrentRow()+")\"></td>"); // radio button
				           				out.println("<td align=\"center\" width=\"30%\" NOWRAP>" + col + "</td>"); // Type Code
				           				col = msgHelp.getE02DESCRI().trim().equals("") ? "&nbsp;" : msgHelp.getE02DESCRI().trim(); 
				           				out.println("<td NOWRAP width=\"70%\"><div>"  + col + "</div></td>"); // Description
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
		<table class="tbenter" width=100% align=center>
			<tr>
		      <% if( "1".equals( currUser.getH01WK1() ) ){ %>
				<td class=TDBKG><div align="center"><a href="javascript:goAction(4)"><b>Consultar</b></a></div></td>
		      <% } else { %>

				<td class=TDBKG><div id="eibsNew" align="center" style="cursor: pointer"><a><b>Crear</b></a></div></td>
				<td class=TDBKG><div align="center"><a href="javascript:goAction(4)"><b>Modificar</b></a></div></td>
				<td class=TDBKG><div align="center"><a href="javascript:goAction(6)"><b>Borrar</b></a></div></td>
		      <% } %>

				<td class=TDBKG><div align="center"><a href="javascript:goAction(12)"><b>Salir</b></a></div></td>
			</tr>
		</table>
		<table cellspacing="0" cellpadding="2" width="100%" border="1">
			<tr>
				<td nowrap>
					<table cellspacing="0" cellpadding="2" class="tbhead" width="100%" align="center">
						<tr>
							<td align=left colspan=5 NOWRAP><%=typeCode %> - <%= title %></td>
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
								<TD align="center" width="5%" nowrap>&nbsp;</TD>
							    <TD align="center" width="10%" nowrap>Producto</TD>
							    <TD align="center" width="10%" nowrap>Banco</TD>
							    <TD align="center" width="10%" nowrap >Moneda</TD>
							    <TD align="left" width="35%" nowrap>Descripción</TD>
							    <TD align="center" width="30%" nowrap><div>Nombre de Mercadeo</div></TD>
	     					</TR>
						</TABLE>
					</td>	
			  	</TR>	
			  	<TR height="95%"> 
			    	<TD NOWRAP valign="top" width="80%">
					   	<div id="dataDiv1" class="scbarcolor" style="height:200px; overflow:auto;">
					    	<table id="dataTable" width="100%">
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
						           	if ("MAINTENANCE".equals(userPO.getPurpose())) {
						           		msgHelp.setE02APCTYP("M");
						           	}
						           	
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
				               				if (firstItem) FirstValue = col;
					    					if (sel.equals("")) {
					    						chk = firstItem ? "checked=\"checked\"" : "";
					               				firstItem = false;
					                        } else if (sel.equals(col)) {
					    						chk = firstItem ? "checked=\"checked\"" : "";
					                        } else {
					                            chk = "";
					                        }
					           				out.println("<td NOWRAP width=\"5%\">" +
					           					"<input type=\"radio\" name=\"PROD_CODE\" class=\"highlight\" "+ chk  + " value=\"" + col + "\" " + 
												"onclick=\"setValues('"+ col + "','" + msgHelp.getE02APCBNK() + "',"+list.getCurrentRow()+")\" ></td>"); // radio button
					           				out.println("<td align=\"center\" NOWRAP width=\"10%\">" + col + "</td>"); // Prod Code
					           				col = msgHelp.getE02APCBNK().trim().equals("") ? "&nbsp;" : msgHelp.getE02APCBNK().trim(); 
					           				out.println("<td align=\"center\" NOWRAP width=\"10%\">" + col + "</td>"); // Bank Code
					           				col = msgHelp.getE02CURREN().trim().equals("") ? "&nbsp;" : msgHelp.getE02CURREN().trim(); 
					            			out.println("<td align=\"center\" NOWRAP width=\"10%\">" + col + "</td>"); // Currency Code
					            			col = msgHelp.getE02DESCRI().trim().equals("") ? "&nbsp;" : msgHelp.getE02DESCRI().trim(); 
					           				out.println("<td NOWRAP><div nowrap width=\"35%\">"  + col + "</div></td>"); // Description
					           				col = msgHelp.getE02NICNME().trim().equals("") ? "&nbsp;" : msgHelp.getE02NICNME().trim(); 
					            			out.println("<td align=\"center\" NOWRAP width=\"30%\"><div nowrap>" + col + "</div></td>"); // Nick Name
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
	document.forms[0].totalRow.value = "<%= k %>";
	
	clickElement('PROD_CODE', '<%=FirstValue%>');
	
    function resizeDoc() {
    	divResize();
       	adjustEquTables(
       		document.getElementById("headTable"), 
       		document.getElementById("dataTable"), 
       		document.getElementById("dataDiv1"), 1, false);
    }
	
	applyTrans(document.getElementById("hiddenDivNew"));
	resizeDoc();
    window.onresize = resizeDoc;
     
 	document.getElementById("hiddenDivNew").onclick = cancelBub;
 	if (document.getElementById("eibsNew")) 
 		document.getElementById("eibsNew").onclick = showHiddenDivNew;
 		
 	if (window.sessionStorage && typeof window.sessionStorage.getItem('chkRow') !== null) {
 		clickElement("PROD_CODE", window.sessionStorage.getItem("chkRow"));	
 	}
 		
</SCRIPT>

</FORM>
</BODY>
</HTML>
