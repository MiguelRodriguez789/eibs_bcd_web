<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<%@ page import ="datapro.eibs.master.Util" %>
<HTML>
<HEAD>
<TITLE></TITLE>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "msgList" 	class= "datapro.eibs.beans.JBObjList"  			scope="session" />
<jsp:useBean id= "error" 	class= "datapro.eibs.beans.ELEERRMessage"  		scope="session" />
<jsp:useBean id= "userPO" 	class= "datapro.eibs.beans.UserPos"  			scope="session"/>

<SCRIPT type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>

<SCRIPT type="text/javascript">

function goAction(opt, submit) {
    if (opt == "N") {
		document.getElementById("SCREEN").value = '100';
		if(submit) 	document.forms[0].submit();
	} else if (opt == "M") { 
		document.getElementById("SCREEN").value = '200';
  		document.forms[0].submit();
	} else if (opt == "I") { 
		document.getElementById("SCREEN").value = '300';
  		document.forms[0].submit();
  	} else if (opt == "D") {
      		ok = confirm("Está seguro que desea eliminar este registro?");
		document.getElementById("SCREEN").value = '400';
	  	if (ok) document.forms[0].submit();
  	}
}

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

<h3 align="center">Caja de Seguridad<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="safe_deposit_list, ESB0110"></H3>
<hr size="4">
<FORM Method="post" Action="<%=request.getContextPath()%>/servlet/datapro.eibs.safedeposit.JSESB0110" >
 <INPUT TYPE=HIDDEN NAME="SCREEN" id="SCREEN" VALUE="200">

<div id="hiddenDivNew" class="hiddenDiv">
    <table id=tbhelp style="border-top-width : 1px;border-right-width : 1px;border-bottom-width : 1px;border-left-width : 1px;
	border-color: #0b23b5;
	border-style : solid solid solid solid;
	filter:progid:DXImageTransform.Microsoft.dropshadow(OffX=3, OffY=3, Color='gray', Positive='true');">
      <tr id="trdark"> 
      <td align=CENTER width="25%"> 
        <div align="right">Número:</div>
        <div id="errorMsg" align="left" style="visibility:hidden;">(No Valida)</div>
      </td>
      <td align=CENTER width="75%"> 
        <div align="left"> 
          <input type="text" name="E01SBMCOD" id="E01SBMCOD" size="12" maxlength="10" onchange="SetErrorVisible()">
          <img src="<%=request.getContextPath()%>/images/Check.gif" title="mandatory field" align="bottom"> 
        </div>
      </td>
    </tr>
   <tr id="trclear">
   
   <TD ALIGN=center nowrap colspan="2">
	     <input id="ESBSBTN" type=submit name="Submit" value="Enviar"> 
   </TD>
   
   </tr>
 </TABLE>
 </div>

<%if ( msgList.getNoResult() ) {%> 
  <TABLE class="tbenter" width="60%" align=center>
    <TR>
      <TD class=TDBKG width="50%"> 
        <div align="center" style="cursor:hand" onClick="goAction('N' ,true);" id="eibsNew"><a><b>Crear</b></a></div>
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
            <b>No hay resultados para su criterio de búsqueda</b>
          </p>          
        </div>
      </TD>
     </TR>
   </TABLE>
<%}	else {%>
  <INPUT TYPE=HIDDEN NAME="CURRENTROW" id="CURRENTROW" VALUE="0"> 
  
 <TABLE class="tbenter" width="100%" align=center>
    <TR>
      <TD class=TDBKG width="25%"> 
        <div align="center" style="cursor:hand" onClick="goAction('N')"><a><b>Crear</b></a></div>
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
  
  <table  id=cfTable class="tableinfo" height="55%">
    <tr  height="5%"> 
      <td NOWRAP valign="top" width="100%"> 
		<table id="headTable" width="98%">
			<tr id="trdark">
  			<TH ALIGN=CENTER width="5%" ></TH>
    		<TH ALIGN=CENTER width="5%" >No. Caja <BR>
				Seguridad</TH>
    		<TH ALIGN=CENTER width="20%" >Tipo</TH>
    		<TH ALIGN=CENTER width="30%" >Ubicación</TH>
    		<TH ALIGN=CENTER width="40%" >Cliente</TH>
			</tr>
        </table>
      </td>
    </tr>    
		  <tr  height="95%">    
		    <td nowrap="nowrap">      
		       <div id="dataDiv1" style="height:400px; overflow:auto;"> 
		       <table id="dataTable" cellspacing="0" cellpadding="1" border="0" width="100%">         
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
           datapro.eibs.beans.ESB011001Message msgPart = (datapro.eibs.beans.ESB011001Message) msgList.getRecord();
     	%>               
		<tr id="dataTable<%= msgList.getCurrentRow() %>">
			<td nowrap align="center" width="5%"><input type="radio" id="ROW" name="ROW" value="<%=msgList.getCurrentRow()%>" <%=chk%> class="highlight" onClick="highlightRow('dataTable', <%= msgList.getCurrentRow() %>)"/></td>
			<TD NOWRAP ALIGN="CENTER" width="5%"><%=Util.formatCell(msgPart.getE01SBMCOD())%></TD>
			<TD NOWRAP ALIGN="CENTER" width="20%"><%=Util.formatCell(msgPart.getD01SBTDSC())%></TD>
			<TD NOWRAP ALIGN="CENTER" width="30%"><%=Util.formatCell(msgPart.getD01LOCNME())%></TD>
			<TD NOWRAP ALIGN="CENTER" width="40%"><%=Util.formatCell(msgPart.getD01CUSNA1())%></TD>
		</TR>    		
    	<%}%>    
             </table>
             </div>
             </td>
             </tr>
</table>
<SCRIPT type="text/javascript">
  showChecked("ROW");   
  getElement("hiddenDivNew").onclick=cancelBub;
  getElement("eibsNew").onclick=showHiddenDivNew;  
      
</SCRIPT>
<%}%>



</FORM>
</BODY>
</HTML>
