<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<%@ page import ="datapro.eibs.master.Util" %>
<HTML>
<HEAD>
<TITLE>Safe Deposit Types</TITLE>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "msgList" 	class= "datapro.eibs.beans.JBObjList"  			scope="session" />
<jsp:useBean id= "error" 	class= "datapro.eibs.beans.ELEERRMessage"  		scope="session" />
<jsp:useBean id= "userPO" 	class= "datapro.eibs.beans.UserPos"  			scope="session"/>

<SCRIPT type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>

<SCRIPT type="text/javascript">

function goAction(opt) {
    if (opt == "N") {
		getElement("SCREEN").value = '100';
		//ShowNew(x,y);  		
	} else if (opt == "M") { 
		getElement("SCREEN").value = '200';
  		document.forms[0].submit();
	} else if (opt == "I") { 
		getElement("SCREEN").value = '300';
  		document.forms[0].submit();
  	} else if (opt == "D") {
      	ok = confirm("Está seguro que desea eliminar este registro?");
		getElement("SCREEN").value = '400';
	  	if (ok) document.forms[0].submit();
  	}
}

function closeHiddenDivNew(){
	setVisibility(getElement("enterNew"), "hidden");
}

function showHiddenDivNew(evt) {
	evt = (evt) ? evt : ((window.event) ? window.event : "");
 	
	var hiddenDivNew = getElement("enterNew");

	var y=evt.clientY + document.body.scrollTop;
	var x=evt.clientX + document.body.scrollLeft;
     
	cancelBub(evt);
	moveElement(hiddenDivNew, y, x);
	setVisibility(hiddenDivNew, "visible");
    goAction('N');
}

function SetErrorVisible() {	 
	 var myValue = document.forms[0].E01SBFCOD.value;

	 if (true) { // verify myValue Here
	 	document.forms[0].E01SBFCOD.onkeypress = "";
     	errorMsg.style.visibility="hidden";
	 } else {
	 	document.forms[0].E01SBFCOD.onkeypress="";
	 	document.forms[0].E01SBFCOD.value="";
    	errorMsg.style.visibility="visible";
	 }
}



function SetType() {	 
	 var myYear = document.forms[0].getElementById("E01LOCLOC").value;

	 if (true) {
	 	getElement("E01LOCLOC").onkeypress = "";
     	errorMsg.style.visibility="hidden";
	 } else {
	 	getElement("E01LOCLOC").onkeypress="";
	 	getElement("E01LOCLOC").value="";
    	errorMsg.style.visibility="visible";
	 }
}

addEventHandler(document, 'click' , closeHiddenDivNew);

</SCRIPT>  

</HEAD>
<BODY>

<% 
if ( !error.getERRNUM().equals("0")  ) {
     error.setERRNUM("0");
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors();");
     out.println("</SCRIPT>");
} 
%>

<h3 align="center">Tipos Caja de Seguridad<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="safe_deposit_types_list, ESB0010"></H3>
<hr size="4">
<FORM Method="post" Action="<%=request.getContextPath()%>/servlet/datapro.eibs.safedeposit.JSESB0010" >
 <INPUT TYPE=HIDDEN id="SCREEN" NAME="SCREEN" VALUE="200">

<div id="enterNew" style="position:absolute; visibility:hidden; left:25px; top:-50px; z-index:3; filter:progid:DXImageTransform.Microsoft.Fade(duration=1.0,overlap=1.0)" onclick="cancelBub()">
 <TABLE id=tbhelp style="border-top-width : 1px;border-right-width : 1px;border-bottom-width : 1px;border-left-width : 1px;
	border-color: #0b23b5;
	border-style : solid solid solid solid;
	filter:progid:DXImageTransform.Microsoft.dropshadow(OffX=3, OffY=3, Color='gray', Positive='true');">
	<tr id="trdark"> 
      <td align=CENTER width="25%"> 
        <div align="right">Tipo:</div>
        <div id="errorMsg" align="left" style="visibility:hidden;">(No Valido)</div>
      </td>
      <td align=CENTER width="75%"> 
        <div align="left"> 
          <input type="text" id="E01SBTTYP" name="E01SBTTYP" size="5" maxlength="4" onchange="SetType()"  onKeypress="enterInteger(event)">
          <img src="<%=request.getContextPath()%>/images/Check.gif" title="mandatory field" align="bottom"> 
        </div>
      </td>
    </tr>
   <tr id="trclear">
   
   <TD ALIGN=center nowrap colspan="2">
	     <input id="EIRSBTN" type=submit name="Submit" value="Enviar"> 
   </TD>
   
   </tr>
 </TABLE>
 </div>

<%if ( msgList.getNoResult() ) {%> 
  <TABLE class="tbenter" width="60%" align=center>
    <TR>
      <TD class=TDBKG width="50%"> 
        <div align="center" style="cursor:hand" onClick="goAction('N'); document.forms[0].submit"><a><b>Crear</b></a></div>
      </TD>
      <TD class=TDBKG width="50%"> 
        <div align="center"><a href="<%=request.getContextPath()%>/pages/background.jsp">Salir</a> </div>
      </TD>
    </TR>
  </TABLE>
  <TABLE class="tbenter" width=100% height=40%>
   	<TR>
      <TD> 
        <div align="center"> 
          <p>
            <b>No hay Resultados para su criterio de búsqueda</b>
          </p>          
        </div>
      </TD>
     </TR>
   </TABLE>
<%}	else {%>
 <INPUT TYPE=HIDDEN id="CURRENTROW" NAME="CURRENTROW" VALUE="0"> 
     
 <TABLE class="tbenter" width="100%" align=center>
    <TR>
      <TD class=TDBKG width="25%"> 
        <div align="center"  id="eibsNew" style="cursor:hand" onClick="goAction('N')"><a><b>Crear</b></a></div>
      </TD>
      <TD class=TDBKG width="25%"> 
        <div align="center"><a href="javascript:goAction('M')">Modificar</a> 
        </div>
      </TD>
      <TD class=TDBKG width="25%"> 
        <div align="center"><a href="javascript:goAction('D')">Eliminar</a> 
        </div>
      </TD>
      <TD class=TDBKG width="25%"> 
        <div align="center"><a href="<%=request.getContextPath()%>/pages/background.jsp">Salir</a> </div>
      </TD>
    </TR>
 </TABLE>
  
<TABLE  id="mainTable" class="tableinfo">
	<tr height="5%">
		<td NOWRAP valign="top" width="80%">
	  		<TABLE id="headTable" width="100%" >
				<TR id="trdark"> 
		  			<TH ALIGN=CENTER width="5%"></TH>
		    		<TH ALIGN=CENTER width="10%">Tipo</TH>
		    		<TH ALIGN=CENTER width="25%">Descripción</TH>
		    		<TH ALIGN=CENTER width="20%">Marca</TH>
		    		<TH ALIGN=CENTER width="20%">Modelo</TH>
		    		<TH ALIGN=CENTER width="20%">Proveedor</TH>
				</TR>
			</TABLE>
		</td>	
  	</TR>	
			  	<TR height="95%"> 
			    	<TD NOWRAP valign="top" width="80%">
   					<div id="dataDiv1" class="scbarcolor" style="height:200px; overflow:auto;">
    					<table id="dataTable" width="100%">
     	<%
        msgList.initRow(); 
		boolean firstTime = true;
		String chk = "";
        while (msgList.getNextRow()) {
			if (firstTime) {
				firstTime = false;
				chk = "checked";
			} else {
				chk = "";
			}
           datapro.eibs.beans.ESB001001Message msgPart = (datapro.eibs.beans.ESB001001Message) msgList.getRecord();
     	%>               
		<tr id="dataTable<%= msgList.getCurrentRow() %>">
			<td nowrap align="center" width="5%"><input type="radio" id="ROW" name="ROW" value="<%=msgList.getCurrentRow()%>" <%=chk%> class="highlight" onClick="highlightRow('dataTable', <%= msgList.getCurrentRow() %>)" onClick="getElement('CURRENTROW').value = this.value;"/></td>
			<TD NOWRAP ALIGN="CENTER" width="10%"><%=Util.formatCell(msgPart.getE01SBTTYP())%></TD>
			<TD NOWRAP ALIGN="CENTER" width="25%"><%=Util.formatCell(msgPart.getE01SBTDSC())%></TD>
			<TD NOWRAP ALIGN="CENTER" width="20%"><%=Util.formatCell(msgPart.getE01SBTBRA())%></TD>
			<TD NOWRAP ALIGN="CENTER" width="20%"><%=Util.formatCell(msgPart.getE01SBTMOD())%></TD>
			<TD NOWRAP ALIGN="CENTER" width="20%"><%=Util.formatCell(msgPart.getD01BAVNM1())%></TD>
		</TR>    		
    	<%}%>    
    					</table>
    				</div>
    			</TD>
    		</TR>
    	</TABLE>						

<SCRIPT type="text/javascript">
    showChecked("ROW"); 
 	getElement("enterNew").onclick=cancelBub;
	getElement("eibsNew").onclick=showHiddenDivNew;  
        
</SCRIPT>

<%}%>
</FORM>
</BODY>
</HTML>
