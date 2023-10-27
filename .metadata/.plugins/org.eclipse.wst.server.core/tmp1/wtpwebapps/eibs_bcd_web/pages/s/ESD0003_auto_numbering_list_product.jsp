<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<%@ page import = "datapro.eibs.beans.*" %>
<title>Lista</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "dvList" class= "datapro.eibs.beans.JBObjList"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/graphical.js"> </SCRIPT>

<SCRIPT type="text/javascript">

function ShowWin() { 
  	  var acd = document.forms[0].ACD.value;
  	  var aty = document.forms[0].ATY.value;
  	  var dsc = document.forms[0].DSC.value;
  	  var bnk = document.forms[0].bank.value;
  	  var brn = document.forms[0].branch.value;
  	  
      page = "<%=request.getContextPath()%>/servlet/datapro.eibs.params.JSESD0003?SCREEN=300&E01NUMACD=" + acd + "&E01NUMATY=" + aty + "&E01NUMDSC=" + dsc + "&E01NUMBNK=" + bnk + "&E01NUMBRN=" + brn;
      listin = CenterWindow(page,680,260,3);
      closehiddenDivBnk();
	  closehiddenDivBrn();
	  closehiddenDivBbr();
}

//-------------------------------------------------------------------------------//
//---- Functions for BANK CODE - PREFIX
//-------------------------------------------------------------------------------//
function showhiddenDivBnk(evt) {
	var evt = (evt) ? evt : ((window.event) ? window.event : "");
 	
	var hiddenDivBnk = document.getElementById("hiddenDivBnk");

	var y=evt.clientY + document.body.scrollTop;
	var x=evt.clientX + document.body.scrollLeft;
     
	cancelBub(evt);

	// moveElement(hiddenDivBnk, y, x);
	// hiddenDivBnk.style.top = y ; // + "px";
    // hiddenDivBnk.style.left= x ; // + "px";
	
	setVisibility(hiddenDivBnk, "visible");
	 
	document.forms[0].newbank.focus();
	document.forms[0].newbank.select();
}

function closehiddenDivBnk(){
	setVisibility(document.getElementById("hiddenDivBnk"), "hidden");
	return true;	
}

function validateBank() {
	var bnk = 0;
	if (!document.forms[0].newbank.value == "") {
		bnk = document.forms[0].newbank.value;
	}

    if (bnk <= 0) {
    	alert("Ingrese Código de Banco");
        document.forms[0].newbank.focus();
        document.forms[0].newbank.select();
        return false;
    } else {
		return true;			
	}	
}

//-------------------------------------------------------------------------------//
//---- Functions for BRANCH CODE - PREFIX
//-------------------------------------------------------------------------------//
function showhiddenDivBrn(evt) {
	var evt = (evt) ? evt : ((window.event) ? window.event : "");
 	
	var hiddenDivBrn = document.getElementById("hiddenDivBrn");

	var y=evt.clientY + document.body.scrollTop;
	var x=evt.clientX + document.body.scrollLeft;
     
	cancelBub(evt);

	// moveElement(hiddenDivBrn, y, x);
	// hiddenDivBrn.style.top = y ; // + "px";
    // hiddenDivBrn.style.left= x ; // + "px";
	
	setVisibility(hiddenDivBrn, "visible");
	 
	document.forms[0].newbranch.focus();
	document.forms[0].newbranch.select();
}

function closehiddenDivBrn(){
	setVisibility(document.getElementById("hiddenDivBrn"), "hidden");
	return true;
}

//-------------------------------------------------------------------------------//
//---- Functions for BANK and BRANCH CODE - PREFIX
//-------------------------------------------------------------------------------//
function showhiddenDivBbr(evt) {
	var evt = (evt) ? evt : ((window.event) ? window.event : "");
 	
	var hiddenDivBbr = document.getElementById("hiddenDivBbr");

	var y=evt.clientY + document.body.scrollTop;
	var x=evt.clientX + document.body.scrollLeft;
     
	cancelBub(evt);

	// moveElement(hiddenDivBrn, y, x);
	// hiddenDivBrn.style.top = y ; // + "px";
    // hiddenDivBrn.style.left= x ; // + "px";
	
	setVisibility(hiddenDivBbr, "visible");
	 
	document.forms[0].newbank2.focus();
	document.forms[0].newbank2.select();
}

function closehiddenDivBbr(){
	setVisibility(document.getElementById("hiddenDivBbr"), "hidden");
	return true;
}
//-------------------------------------------------------------------------------//

function assigningValues(acd, aty, dsc) {
	document.forms[0].ACD.value = acd;
	document.forms[0].ATY.value = aty;
	document.forms[0].DSC.value = dsc;
	
	return true;
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

<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.params.JSESD0003">

  <INPUT TYPE=HIDDEN NAME="SCREEN"	VALUE="300"> 
  <INPUT TYPE=HIDDEN NAME="bank" 	VALUE=""> 
  <INPUT TYPE=HIDDEN NAME="branch" 	VALUE=""> 
  <INPUT TYPE=HIDDEN NAME="ACD" 	VALUE="">
  <INPUT TYPE=HIDDEN NAME="ATY" 	VALUE="">
  <INPUT TYPE=HIDDEN NAME="DSC" 	VALUE="">  
  <INPUT TYPE=HIDDEN NAME="ANG" 	VALUE="">  
  

<!-- =================================================================================
	 Popup Window for - BANK CODE - PREFIX  
	 ================================================================================= -->  
<div id="hiddenDivBnk" class="hiddenDiv">
<br>
<br>
<br>
 <TABLE id=tbhelp style="border-top-width : 1px;border-right-width : 1px;border-bottom-width : 1px;border-left-width : 1px;
	border-color: #0b23b5;
	border-style : solid solid solid solid;
	filter:progid:DXImageTransform.Microsoft.dropshadow(OffX=3, OffY=3, Color='gray', Positive='true');">
	<TR>
	  <TD ALIGN=right nowrap>
          Banco : 
          <input type="text" maxlength="2" size="3" name="newbank" value="0" onblur="document.forms[0].bank.value=this.value;" onkeypress="enterInteger(event)">
      </TD> 
      <TD ALIGN=Left nowrap>
	     <a href="javascript:validateBank();ShowWin()"><img name="Image1" border="0" src="<%=request.getContextPath()%>/images/s/applicar_on.gif"></a> 
	  </TD>
   </TR>
 </TABLE>
</div>

<!-- =================================================================================
	 Popup Window for - BRANCH CODE - PREFIX
	 ================================================================================= -->  
<div id="hiddenDivBrn" class="hiddenDiv">
<br>
<br>
<br>
 <TABLE id=tbhelp style="border-top-width : 1px;border-right-width : 1px;border-bottom-width : 1px;border-left-width : 1px;
	border-color: #0b23b5;
	border-style : solid solid solid solid;
	filter:progid:DXImageTransform.Microsoft.dropshadow(OffX=3, OffY=3, Color='gray', Positive='true');">
	<TR>
	  <TD ALIGN=right nowrap>
          Sucursal : 
          <input type="text" maxlength="4" size="5" name="newbranch" value="0" onblur="document.forms[0].branch.value=this.value;" onkeypress="enterInteger(event)">
      </TD> 
      <TD ALIGN=Left nowrap>
	     <a href="javascript:ShowWin()"><img name="Image1" border="0" src="<%=request.getContextPath()%>/images/s/applicar_on.gif"></a> 
	  </TD>
   </TR>
 </TABLE>
</div>

<!-- =================================================================================
	 Popup Window for - BANK and BRANCH CODE - PREFIX
	 ================================================================================= -->  
<div id="hiddenDivBbr" class="hiddenDiv">
<br>
<br>
<br>
 <TABLE id=tbhelp style="border-top-width : 1px;border-right-width : 1px;border-bottom-width : 1px;border-left-width : 1px;
	border-color: #0b23b5;
	border-style : solid solid solid solid;
	filter:progid:DXImageTransform.Microsoft.dropshadow(OffX=3, OffY=3, Color='gray', Positive='true');">
	<TR>
	  <TD ALIGN=right nowrap>
          Banco : 
          <input type="text" maxlength="2" size="3" name="newbank2" value="0" onblur="document.forms[0].bank.value=this.value;" onkeypress="enterInteger(event)">
      </TD> 	
	  <TD ALIGN=right nowrap>
          Sucursal : 
          <input type="text" maxlength="4" size="5" name="newbranch2" value="0" onblur="document.forms[0].branch.value=this.value;" onkeypress="enterInteger(event)">
      </TD> 
      <TD ALIGN=Left nowrap>
	     <a href="javascript:ShowWin()"><img name="Image1" border="0" src="<%=request.getContextPath()%>/images/s/applicar_on.gif"></a> 
	  </TD>
   </TR>
 </TABLE>
</div>
<!-- ================================================================================ -->      

  
<% 
	if ( dvList.getNoResult() ) {
%>
 	<TABLE class="tbenter" width=100% height=30%">
 		<TR>
      <TD>         
      <div align="center"> <h4 style="text-align:center"> No Existen Productos creados para el tipo seleccionado.</h4> 
      </div>
      </TD></TR>
   	</TABLE>
<%
	}
	else {
%>
  
  <TABLE class="tableinfo" id="dataTable">
    
    <tr id="trdark" align="center">
      	<td colspan="2">  <b>Lista de Productos</b> </td>
    </tr>
  
    <%
                
          dvList.initRow();               
          while (dvList.getNextRow()) {
               ESD000301Message msgList = (ESD000301Message) dvList.getRecord();	 		                     
       %>                                 
          <TR>
          <td>
            <% if (msgList.getE01CNTANG().equals("2") && !msgList.getE01NUMACD().equals("")) { // Bank Code Prefix %>
            <a href ="javascript:assigningValues('<%= msgList.getE01NUMACD() %>', '<%= msgList.getE01NUMATY() %>', '<%= msgList.getE01NUMDSC() %>');showhiddenDivBnk()"> <%= msgList.getE01NUMATY() %> - <%= msgList.getE01NUMDSC() %> </a><br />
            <% } else { 
               if (msgList.getE01CNTANG().equals("3")) { // Branch Code Prefix %>
            <a href ="javascript:assigningValues('<%= msgList.getE01NUMACD() %>', '<%= msgList.getE01NUMATY() %>', '<%= msgList.getE01NUMDSC() %>');showhiddenDivBrn()"> <%= msgList.getE01NUMATY() %> - <%= msgList.getE01NUMDSC() %> </a><br />
            <% } else { 
               if (msgList.getE01CNTANG().equals("4")) { // Bank and Branch Code Prefix %>
            <a href ="javascript:assigningValues('<%= msgList.getE01NUMACD() %>', '<%= msgList.getE01NUMATY() %>', '<%= msgList.getE01NUMDSC() %>');showhiddenDivBbr()"> <%= msgList.getE01NUMATY() %> - <%= msgList.getE01NUMDSC() %> </a><br />
            <% } else { %>
          	<a href ="javascript:assigningValues('<%= msgList.getE01NUMACD() %>', '<%= msgList.getE01NUMATY() %>', '<%= msgList.getE01NUMDSC() %>');ShowWin()"> <%= msgList.getE01NUMATY() %> - <%= msgList.getE01NUMDSC() %> </a><br />
          	<% }
          	   }
          	   } %>
      	  </td>
		</TR>
        <% } %> 
  </TABLE>
<BR>

<SCRIPT type="text/javascript">
	applyTrans(document.getElementById("hiddenDivBnk"));
	document.getElementById("hiddenDivBnk").onclick=cancelBub;    
	
	applyTrans(document.getElementById("hiddenDivBrn"));
	document.getElementById("hiddenDivBrn").onclick=cancelBub;    
	
</script>


<%      
  }
%> 
</form>
</body>
</html>
