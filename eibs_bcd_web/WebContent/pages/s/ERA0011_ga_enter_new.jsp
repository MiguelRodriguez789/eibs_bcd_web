<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<HTML><HEAD>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1"> 
<%@ page import = "java.io.*,java.net.*,datapro.eibs.sockets.*,datapro.eibs.beans.*,datapro.eibs.master.*,java.math.*" %>
<META name="GENERATOR" content="IBM WebSphere Studio">
<TITLE>Mantenimiento  de Garantias</TITLE>
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<jsp:useBean id= "gaList" class= "datapro.eibs.beans.JBListRec"  scope="session" />
<jsp:useBean id= "gaCodeList" class= "datapro.eibs.beans.JBListRec"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session"/>
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>

<SCRIPT type="text/javascript">

function showCollItems(flg,idx){
  	var actTab= document.forms[0].CCOD.value;
  	for ( var i=0; i<dataTable.rows.length; i++ ) {
    	dataTable.rows[i].className="trnormal";
  	}
  	dataTable.rows[idx].className="trhighlight"; 
  	if (actTab.trim() != "") {  
  		getElement("dataTable"+actTab).style.display="none";
  	}
  	getElement("dataTable"+flg).style.display="";
  	document.forms[0].CCOD.value=flg;
  	adjustEquTables(getElement("headTable2"), getElement("dataTable"+flg), getElement("dataDiv2"),1,false);
  	showChecked("COLLITEM"+flg);    
//  tabDESC.rows[0].cells[1].innerText = dataTable.rows[idx].cells[1].innerText +" - "+ dataTable.rows[idx].cells[2].innerText;
}    

function setItemInfo(flg,idx,pos){
  	var actTab= document.forms[0].CCOD.value;
  	for ( var i=0; i< getElement("dataTable"+actTab).rows.length; i++ ) {
       getElement("dataTable"+actTab).rows[i].className="trnormal";
    }
   	getElement("dataTable"+actTab).rows[idx].className="trhighlight"; 
  	document.forms[0].ICOD.value = flg;
  	document.forms[0].ROW.value = pos;
}

function closeEnterACC(){
   	  enterACC.filters[0].apply();
      enterACC.style.visibility="hidden";
      enterACC.filters[0].Play();
}

function cancelBub(){
  event.cancelBubble = true;
}

function ShowEnterAcc() {	 
	 var y=event.clientY + document.body.scrollTop - enterACC.clientHeight;
     var x=event.clientX + document.body.scrollLeft - (enterACC.clientWidth/2);
	 cancelBub();
	 eval('enterACC.style.pixelTop=' + y);
     eval('enterACC.style.pixelLeft=' + x);
	 enterACC.filters[0].apply();
     enterACC.style.visibility="visible";
     enterACC.filters[0].Play();
	 document.forms[0].accnum.focus();
}

function goNew(){
   <% 
    boolean autoNum = true;
    try {
  	 autoNum = JSEIBSProp.getAutoNumCOLL();
	 autoNum = true;
  	} catch (Exception e){
  	}
	if (!autoNum){ %>
	  ShowEnterAcc();
   <%} else { %>
	  document.forms[0].submit();
   <%}%>
}

function goSubmit(){
  document.forms[0].submit();
}

addEventHandler(document, 'click', closeEnterACC);
</SCRIPT>

</HEAD>
<body> 

<h3 align="center">Selección Tipo Garant&iacute;as</h3>
<hr>
 <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSERA0011" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="400">
  <INPUT TYPE=HIDDEN NAME="CCOD" VALUE="">
  <INPUT TYPE=HIDDEN NAME="ICOD" VALUE="">
  <INPUT TYPE=HIDDEN NAME="ROW" VALUE="0">
  <input type="hidden" name="CUSNUM" value="<%= userPO.getCusNum().trim()%>" >
  <input type="hidden" name="REFERE" value="<%= userPO.getHeader18().trim()%>" >
  <input type="hidden" name="bank" value="<%= userPO.getBank().trim()%>" >
  
<div id="enterACC" style="position:absolute; visibility:hidden; left:25px; top:-50px; z-index:3; filter:BlendTrans(duration=1)" onclick="cancelBub()">
	<TABLE id=tbhelp style="border-top-width : 1px;border-right-width : 1px;border-bottom-width : 1px;border-left-width : 1px;	border-color: #0b23b5; border-style: solid solid solid solid; filter:progid:DXImageTransform.Microsoft.dropshadow(OffX=3, OffY=3, Color='gray', Positive='true');">
		<TR>
	  		<TD ALIGN=right nowrap>Introduzca el Número de Cuenta : <input type="text" maxlength=12 size=12 name="accnum" onKeyPress="enterInteger(event)" value=""></TD>
      		<TD ALIGN=Left nowrap><a href="javascript:goSubmit()"><img name="Image1" border="0" src="<%=request.getContextPath()%>/images/s/applicar_on.gif"></a></TD>
   		</TR>
 	</TABLE>
</div>

<% if (gaCodeList.getNoResult()) { %>
   	<TABLE class="tbenter" height="60%">
   		<TR>
      		<TD ALIGN=CENTER VALIGN=MIDDLE><H4 style="text-align: center">No existe ningun Tipo de Garantía creado. <br> Consulte a su Administrador de Sistemas</h4></TD>
    	</TR>
   	</TABLE>
<% } else {%>
  
  	<TABLE  id="mainTable1" class="tableinfo">
  		<TR > 
    		<TD NOWRAP width="100%" >
    			<TABLE id="headTable1" >
					<TR id="trdark"> 
				    	<TH ALIGN=CENTER NOWRAP></TH>
				      	<TH ALIGN=CENTER NOWRAP>Código</TH>
				      	<TH ALIGN=CENTER NOWRAP>Descripción Tipo Garantía</TH>
				      	<TH ALIGN=CENTER NOWRAP>Contabilidad</TH>
				      	<TH ALIGN=CENTER NOWRAP>MDA</TH>      
				    </TR>
    			</TABLE>
  
   				<div id="dataDiv1" class="scbarcolor">
    				<table id="dataTable">
    				<%
                		boolean firstTime=true;
                		String gaChk=""; 
                		gaCodeList.initRow();
              
                		int i=0;
                		while (gaCodeList.getNextRow()) {
                    		if (gaCodeList.getFlag().equals("")) {
	                      		gaChk=(firstTime) ? "checked":"";
	                      		firstTime=false;
	     				%>               
		          				<TR>       			
		                			<TD ALIGN=LEFT NOWRAP> 
		                 				<input type="radio" name="COLLCOD" value="<%= gaCodeList.getRecord(2) %>" onClick="showCollItems(this.value,<%= i %>)" <%= gaChk %>>
									</TD>
		      						<TD ALIGN=CENTER NOWRAP><DIV><a href="javascript:radioClick('COLLCOD',<%= i %>)"><%= gaCodeList.getRecord(0) %></a></DIV></TD>
		      						<TD ALIGN=LEFT NOWRAP><DIV><a href="javascript:radioClick('COLLCOD',<%= i %>)"><%= gaCodeList.getRecord(1) %></a></DIV></TD>      
		      						<TD ALIGN=CENTER NOWRAP><DIV><a href="javascript:radioClick('COLLCOD',<%= i %>)"><%= gaCodeList.getRecord(2) %></a></DIV></TD>
		      						<TD ALIGN=CENTER NOWRAP><DIV><a href="javascript:radioClick('COLLCOD',<%= i %>)"><%= gaCodeList.getRecord(3) %></a></DIV></TD>
		      					</TR>              
	                    
	     				<%  	i++;
	                    	}        
                		}
    				%> 
   					</table>
   				</div>
   			</TD>
 		</tr>
	</table>
 		<br>
  		<TABLE id=tabDESC class="tbenter">
    		<TR> 
      			<TD ALIGN=RIGHT width="45%" nowrap><b>Bienes asociados al Tipo de Garantía seleccionado : </b></TD>
      			<TD ALIGN=LEFT></TD>
    		</TR>
  		</TABLE>
  
 		<TABLE  id="mainTable" class="tableinfo">
 			<TR > 
    			<TD NOWRAP valign="top" width="100%" >
      
  					<TABLE id="headTable2" >
  						<TR id="trdark"> 
					    	<TH ALIGN=CENTER NOWRAP></TH>
					      	<TH ALIGN=CENTER NOWRAP>Código</TH>
						  	<TH ALIGN=CENTER NOWRAP>Descripción</TH>
    					</TR>
   					</TABLE>
  
   				<div id="dataDiv2" class="scbarcolor">
    			<%
            		gaCodeList.initRow();
            		gaList.initRow();
            		//int j=0;
            		while (gaCodeList.getNextRow()) {
    			%>                
    					<table id="dataTable<%=gaCodeList.getRecord(2)%>" style="display:none;">
    			<%
                		int j=0;
                		String itemChk="";
                		firstTime=true;
                		while (gaList.getNextRow()) {
                    		if (gaList.getFlag().equals(gaCodeList.getRecord(2))) {
                    			itemChk=(firstTime) ? "checked":"";
                    			firstTime=false;
    			%>
                				<TR> 
      			    				<TD ALIGN=Left NOWRAP><input type="radio" name="COLLITEM<%= gaList.getFlag() %>" value="<%= gaList.getRecord(1) %>" <%=itemChk%> onClick="setItemInfo(this.value,<%= j %>,<%= gaList.getCurrentRow()%>)"></TD>
      								<TD ALIGN=CENTER NOWRAP><a href="javascript:radioClick('COLLITEM<%= gaList.getFlag() %>',<%= j %>)"><%= gaList.getRecord(0) %></a></TD>
      								<TD ALIGN=LEFT NOWRAP><a href="javascript:radioClick('COLLITEM<%= gaList.getFlag() %>',<%= j %>)"><%= gaList.getRecord(2) %></a></TD>      
      							</TR>  
    			<%                 
                     			j++; 
                    		} else {
                      			gaList.setCurrentRow(gaList.getCurrentRow()-1);
                      			break;
                    		}        
                		}
    			%> 
   						</table>
   				<%       
            		}
    			%> 
   				</div>
   			</TD>
  		</TR>	
	</TABLE>
	
	<p align="center"><input id="EIBSBTN" type=button name="Submit" value="Enviar" onClick="goNew()"></p>

<% 
 	if ( !error.getERRNUM().equals("0")  ) {
     	error.setERRNUM("0"); 
     	out.println("<SCRIPT Language=\"Javascript\">");
     	out.println("       showErrors()");
     	out.println("</SCRIPT>");
     	int row;
     	String code="";
     	String flag="";
     	try {
      		row = Integer.parseInt(request.getParameter("ROW"));
     	} catch (Exception e) {
      		row = 0;
     	}
     	gaList.setCurrentRow(row);
     	flag = gaList.getFlag();
     	code = gaList.getRecord(1);
 %>
   		<SCRIPT type="text/javascript">
     		var collLen = document.forms[0].elements("COLLCOD").length;
     		var colItm = document.forms[0].elements("COLLITEM<%=flag%>");
     		var itemLen = colItm.length; 
     		for(var i=0; i < collLen;i++) {
       			if (document.forms[0].COLLCOD[i].value == "<%=flag%>") {
         			document.forms[0].COLLCOD[i].checked = true;
         			break;
       			}
     		}
     		for(var i=0; i<itemLen;i++) {
       			if (colItm[i].value == "<%=code%>") {
         			colItm[i].checked = true;
         			break;
       			}
     		}
   		</SCRIPT>
<% 
 	} 
%> 
	<SCRIPT type="text/javascript">

     	function resizeDoc() {
      		var actvTb = document.forms[0].CCOD.value;
      		var dataT = getElement("dataTable"+actvTb);
       		adjustEquTables(getElement("headTable1"), getElement("dataTable"), getElement("dataDiv1"),1,false);
       		adjustEquTables(getElement("headTable2"), dataT, getElement("dataDiv2"),1,false);
      	}
	 	showChecked("COLLCOD");
     	resizeDoc();
     	window.onresize=resizeDoc;
     
	</SCRIPT> 
<% } %> 

</FORM>
</BODY>
</HTML>
 