<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@ page import = "datapro.eibs.master.Util" %>
<%@page import="com.datapro.constants.EibsFields"%>

<html>
<head>
<title>Información Básica de Garantías</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/jquery/plugins/contextMenu/css/jquery.contextMenu.css" rel="stylesheet" type="text/css" />

<jsp:useBean id="gaMant" class= "datapro.eibs.beans.ERA005000Message"  scope="session"/>
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session"/>
<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session"/>
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />
<jsp:useBean id= "currClient" class= "datapro.eibs.beans.ESD080001Message"  scope="session" />
<jsp:useBean id= "listConst" class= "datapro.eibs.beans.JBListRec"  scope="session" /> 
<jsp:useBean id= "listGarant" class= "datapro.eibs.beans.JBListRec"  scope="session" /> 
<jsp:useBean id="ERA006001Help" class="datapro.eibs.beans.JBObjList" scope="session" />
<jsp:useBean id="ERA006401Help" class="datapro.eibs.beans.JBObjList" scope="session" />
<jsp:useBean id="ERA006501Help" class="datapro.eibs.beans.JBObjList" scope="session" />
<jsp:useBean id="ERA006601Help" class="datapro.eibs.beans.JBObjList" scope="session" />
<jsp:useBean id="ERA006701Help" class="datapro.eibs.beans.JBObjList" scope="session" />
<jsp:useBean id="ERA006801Help" class="datapro.eibs.beans.JBObjList" scope="session" />
<jsp:useBean id="ERA006901Help" class="datapro.eibs.beans.JBObjList" scope="session" />
<jsp:useBean id="ERA007301Help" class="datapro.eibs.beans.JBObjList" scope="session" />
<jsp:useBean id="ERA007401Help" class="datapro.eibs.beans.JBObjList" scope="session" />
<jsp:useBean id="ERA006101Help" class="datapro.eibs.beans.JBObjList" scope="session" />
<jsp:useBean id="ERA006203Help" class="datapro.eibs.beans.JBObjList" scope="session" />
<jsp:useBean id="gaListBien" class="datapro.eibs.beans.JBListRec" scope="session" />
<jsp:useBean id="gaListIns" class="datapro.eibs.beans.JBListRec" scope="session" />
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>
<script src="<%=request.getContextPath()%>/pages/s/javascripts/jquery.jsp"> </script>

<%
	boolean b_read_only1 = false;
	boolean b_read_onlyType = false;
	boolean list_1 = false;
	boolean list_2 = false;
	boolean list_3 = false;
	boolean list_4 = false;
	boolean list_fid = false;
	boolean list_acc = false;
	boolean list_FNG = false;
%>
<%
	String read_only1 = "";
%>
<%
	String disabled1 = "";
%>
<%
	String desc_type_coll = "";
%>

<%
	String TablaDepreciar = "";
	String client = currClient != null ? currClient.getE01CUSCUN() : "";
	String curname = currClient != null ? currClient.getE01CUSNA1()
			.trim() : "";
%>
<%
	if (userPO.getPurpose().equals("INQUIRY")) {
		b_read_only1 = true;
		b_read_onlyType = true;
		read_only1 = "readonly";
		disabled1 = "disabled";
	}
%>
<%
	if (gaMant.getE01ROCSTS().equals("4")) {
		b_read_only1 = true;
		read_only1 = "readonly";
		disabled1 = "disabled";
	}
%>
<%
	if (userPO.getPurpose().equals("APPROVE")) {
		b_read_only1 = true;
		read_only1 = "readonly";
		disabled1 = "disabled";
	}
%>
<%
	desc_type_coll = gaMant.getE01ROCDGT();
%>
<%
	String[] listAval1 = { "H", "I", "J", "K", "M", "N", "O", "Q", "R", "S", "U", "0", "3", "Z", "6", "G", "2", "L" };
	// Search for element in list
	for (int i = 0; i < listAval1.length; i++) {
		if (listAval1[i].equals(gaMant.getE01ROCTYP())) {
			list_1 = true;
			break;
		}
	}
	String[] listAval2 = { "H", "Q", "R", "S", "3", "Z", "0"};
	// Search for element in list
	for (int i = 0; i < listAval2.length; i++) {
		if (listAval2[i].equals(gaMant.getE01ROCTYP())) {
			list_2 = true;
			break;
		}
	}
	String[] listAval3 = { "I", "J", "K", "N", "O", "U", "3", "G", "6" };
	// Search for element in list
	for (int i = 0; i < listAval3.length; i++) {
		if (listAval3[i].equals(gaMant.getE01ROCTYP())) {
			list_3 = true;
			break;
		}
	}
	String[] listAval4 = { "C", "W", "A", "P" };
	// Search for element in list
	for (int i = 0; i < listAval4.length; i++) {
		if (listAval4[i].equals(gaMant.getE01ROCTYP())) {
			list_4 = true;
			break;
		}
	}
	String[] listFid = { "4", "5" };
	// Search for element in list
	for (int i = 0; i < listFid.length; i++) {
		if (listFid[i].equals(gaMant.getE01ROCTYP())) {
			list_fid = true;
			break;
		}
	}
	String[] listAcc = { "7", "9" };
	// Search for element in list
	for (int i = 0; i < listFid.length; i++) {
		if (listAcc[i].equals(gaMant.getE01ROCTYP())) {
			list_acc = true;
			break;
		}
	}

	String[] listFNG = { "Y", "X" };
	// Search for element in list
	for (int i = 0; i < listFid.length; i++) {
		if (listFNG[i].equals(gaMant.getE01ROCTYP())) {
			list_FNG = true;
			break;
		}
	}
%>

<%
	if (userPO.getPurpose().equals("MAINTENANCE")) {
%>
<SCRIPT type="text/javascript">
    builtNewMenu(colla_M_opt);
    initMenu();
</SCRIPT>
<%
	}
%> 

<%
 	if (userPO.getPurpose().equals("INQUIRY")) {
 %>
<SCRIPT type="text/javascript">
    builtNewMenu(colla_i_opt);
    initMenu();
</SCRIPT>
<%
	}
%> 
<%
 	if (userPO.getPurpose().equals("APPROVE")) {
 %>
<SCRIPT type="text/javascript">
   
    builtNewMenu(colla_i_opt);
    initMenu();
</SCRIPT>
<%
	}
%> 
<SCRIPT type="text/javascript">

function getParamsBien(idx,bien){
	document.forms[0].SEQBIEN.value = bien;
}

function getParamsI(idx,poliza){
	document.forms[0].POLIZA.value = poliza;
}


function UpdateFlag(val) {
  getElement("H01FLGWK2").value = (val==true)?"X":"";
 }

function asigVal(fld,val)  
{
	eval("document.forms[0]."+fld+".value ="+val);
}
function tabview_aux(TabViewId, id)
{
  var TabView = getElement(TabViewId);

  var Tabs = TabView.firstChild;
  while (Tabs.className != "Tabs" ) Tabs = Tabs.nextSibling;

  var Tab = Tabs.firstChild;
  var i   = 0;

  do
  {
    if (Tab.tagName == "A")
    {
      i++;
      Tab.href      = "javascript:tabview_switch('"+TabViewId+"', "+i+");";
      Tab.className = (i == id) ? "Active" : "";
      Tab.blur();
    }
  }
  while (Tab = Tab.nextSibling);

  var Pages = TabView.firstChild;
  while (Pages.className != 'Pages') Pages = Pages.nextSibling;

  var Page = Pages.firstChild;
  var i    = 0;

  do
  {
    if (Page.className == 'Page')
    {
      i++;
      if (Pages.offsetHeight) Page.style.height = (Pages.offsetHeight-2)+"px";
      Page.style.overflow = "auto";
      Page.style.display  = (i == id) ? 'block' : 'none';
    }
  }
  while (Page = Page.nextSibling);
}

function tabview_switch(TabViewId, id) { tabview_aux(TabViewId, id); }

function tabview_initialize(TabViewId) { tabview_aux(TabViewId,  1); }

function goAction(type,op) {
<%--
	document.getElementById("btnA1").removeAttribute("href");
	document.getElementById("btnA1").style.color = "grey";
	document.getElementById("btnA2").removeAttribute("href");
	document.getElementById("btnA2").style.color = "grey";
	document.getElementById("btnA3").removeAttribute("href");
	document.getElementById("btnA3").style.color = "grey";
	document.getElementById("btnA4").removeAttribute("href");
	document.getElementById("btnA4").style.color = "grey";
	document.body.style.cursor='wait';
--%>
   switch (type) {
    case 'B' :{    
	         document.forms[0].SCREEN.value = 101;
            }
            break;
    case 'F' :{
	         document.forms[0].SCREEN.value = 103;
            }
            break;
    case 'V' :{
	         document.forms[0].SCREEN.value = 102;
            }
            break;
    case 'I' :{
	         document.forms[0].SCREEN.value = 104;
            }
            break;
    case 'C' :{
	         document.forms[0].SCREEN.value = 105;
            }
            break;
    case '1' :{
	         document.forms[0].SCREEN.value = 106;
            }
            break;
    case '4' :{
	         document.forms[0].SCREEN.value = 107;
            }
            break;
    case '8' :{
	         document.forms[0].SCREEN.value = 108;
            }
            break;
    case '9' :{
	         document.forms[0].SCREEN.value = 109;
            }
            break;
    case '10' :{
	         document.forms[0].SCREEN.value = 110;
            }
            break;
    default : {
            }
            break;
    }

   switch (op) {
            //adicion
    case 1 :{    
	         document.forms[0].OPECOD.value = "0001";
            }
            break;
            //modificacion
    case 2 :{
	         document.forms[0].OPECOD.value = "0005";
            }
            break;
    case 3 :{
            //borrar
	         document.forms[0].OPECOD.value = "0006";
            }
            break;
    case 4 :{
            //consultar
	         document.forms[0].OPECOD.value = "0004";
            }
            break;
    case 5 :{
            //copiar bien
	         document.forms[0].OPECOD.value = "0007";
            }
            break;
    default : {
            }
            break;
    }
<%
	if (userPO.getPurpose().equals("NEW")) {
%>
    document.forms[0].H01FLGMAS.value = "A";
<%
	}
%>
<%
	if ((userPO.getPurpose().equals("INQUIRY"))||(userPO.getPurpose().equals("APPROVE"))) {
%>
    document.forms[0].UPDCONST.value = "0";
    document.forms[0].UPDGARANT.value = "0";
<%
	}
%>
	var SCREEN = document.forms[0].SCREEN.value;
	var OPECOD = document.forms[0].OPECOD.value;
	document.forms[0].submit();
<%--
	var E01ROCREF = document.forms[0].E01ROCREF.value;
	var SEQBIEN = document.forms[0].SEQBIEN.value;
	var RESNRE = document.forms[0].E01RESNRE.value;
	var E01ROCTYP = document.forms[0].E01ROCTYP.value;
	var E01ROCRGK = document.forms[0].E01ROCRGK.value;
	var UPDCONST = document.forms[0].UPDCONST.value;
	var UPDGARANT = document.forms[0].UPDGARANT.value;
	if ((OPECOD == "0004")||(OPECOD == "0005")||(OPECOD == "0006")){
		if (SEQBIEN != ""){
			page = "<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSERA0050?SCREEN="+SCREEN+"&OPECOD="+OPECOD+"&E01ROCREF="+E01ROCREF+"&SEQBIEN="+SEQBIEN+"&RESNRE="+RESNRE+"&E01ROCTYP="+E01ROCTYP+"&E01ROCRGK="+E01ROCRGK+"&UPDCONST="+UPDCONST+"&UPDGARANT="+UPDGARANT;
			CenterNamedWindow(page,'Information',1200,600,2);
		}
	}else{
		page = "<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSERA0050?SCREEN="+SCREEN+"&OPECOD="+OPECOD+"&E01ROCREF="+E01ROCREF+"&SEQBIEN="+SEQBIEN+"&RESNRE="+RESNRE+"&E01ROCTYP="+E01ROCTYP+"&E01ROCRGK="+E01ROCRGK+"&UPDCONST="+UPDCONST+"&UPDGARANT="+UPDGARANT;
		CenterNamedWindow(page,'Information',1200,600,2);
	}
--%>
 }
function goActionA(op) {
<%--
	document.getElementById("btnA1").removeAttribute("href");
	document.getElementById("btnA1").style.color = "grey";
	document.getElementById("btnA2").removeAttribute("href");
	document.getElementById("btnA2").style.color = "grey";
	document.getElementById("btnA3").removeAttribute("href");
	document.getElementById("btnA3").style.color = "grey";
	document.getElementById("btnA4").removeAttribute("href");
	document.getElementById("btnA4").style.color = "grey";
	document.body.style.cursor='wait';
--%>
   switch (op) {
            //adicion
    case 1 :{    
	         document.forms[0].OPECOD.value = "0001";
	         document.forms[0].SCREEN.value = 111;
            }
            break;
            //modificacion
    case 2 :{
	         document.forms[0].OPECOD.value = "0005";
	         document.forms[0].SCREEN.value = 111;
            }
            break;
    case 3 :{
            //borrar
	         document.forms[0].OPECOD.value = "0006";
	         document.forms[0].SCREEN.value = 111;
            }
            break;
    case 4 :{
            //consultar
	         document.forms[0].OPECOD.value = "0004";
	         document.forms[0].SCREEN.value = 111;
            }
            break;
    default : {
            }
            break;
    }
	var SCREEN = document.forms[0].SCREEN.value;
	var OPECOD = document.forms[0].OPECOD.value;
	var E01ROCBNK = document.forms[0].E01ROCBNK.value;
	var E01ROCREF = document.forms[0].E01ROCREF.value;
	var SEQBIEN = "0";
	var POLIZA = document.forms[0].POLIZA.value;
	var PURPOSE = document.forms[0].PURPOSE.value;
	var UPDCONST = document.forms[0].UPDCONST.value;
	var UPDGARANT = document.forms[0].UPDGARANT.value;
	page = "<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSERA0050?SCREEN="+SCREEN+"&OPECOD="+OPECOD+"&E01ROCBNK="+E01ROCBNK+"&E01ROCREF="+E01ROCREF+"&SEQBIEN="+SEQBIEN+"&POLIZA="+POLIZA+"&PURPOSE="+PURPOSE+"&UPDCONST="+UPDCONST+"&UPDGARANT="+UPDGARANT;
	CenterWindow(page,1200,600,2);
 }


function goRefresh() {
    document.forms[0].SCREEN.value = 2;
	document.forms[0].submit();
}

function goRefreshAfterIns() {
    document.forms[0].SCREEN.value = 200;
	document.forms[0].submit();
}

function goValuation() {
	var SCREEN = "200";
	var OPECOD = "0020";
	var E01HVAREF = document.forms[0].E01ROCREF.value;
	var SEQBIEN = document.forms[0].SEQBIEN.value;
	var SEQVAL = "0";
	page = "<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSERA0084?SCREEN="+SCREEN+"&OPECOD="+OPECOD+"&E01HVAREF="+E01HVAREF+"&E01HVASEQ="+SEQBIEN+"&E01HVASEA="+SEQVAL;
	CenterNamedWindow(page,'Information',1200,500,2);
}
function goHistAppr() {
	var SCREEN = "100";
	var OPECOD = "0015";
	var E01HVAREF = document.forms[0].E01ROCREF.value;
	page = "<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSERA0084?SCREEN="+SCREEN+"&OPECOD="+OPECOD+"&E01HVAREF="+E01HVAREF;
	CenterNamedWindow(page,'Information',1200,500,2);
}
function goHistMnt() {
	page = "<%=request.getContextPath()%>/servlet/datapro.eibs.security.JSESS0240?SCREEN=400&TYPE=W";
	CenterNamedWindow(page,'Information',1200,500,2);
}
function goRefreshIns() {
    document.forms[0].SCREEN.value = 101;
	document.forms[0].submit();
}

function callDocum() {
var TABLE_NUM = document.forms[0].E01ROCCNL.value;   
var IDENTIFIER = document.forms[0].E01ROCREF.value;   
var SEQG = 0;   
var purpose = "<%=read_only1%>";

if (purpose == "readonly") {
    	page = "<%=request.getContextPath()%>/servlet/datapro.eibs.tools.JSEDI0010?SCREEN=3&Type=G&TABLE_NUM="+TABLE_NUM+"&IDENTIFIER="+IDENTIFIER+"&SEQG="+SEQG;
    	CenterNamedWindow(page,'Information',650,500,2);
}else{
    	page = "<%=request.getContextPath()%>/servlet/datapro.eibs.tools.JSEDI0010?SCREEN=1&Type=G&TABLE_NUM="+TABLE_NUM+"&IDENTIFIER="+IDENTIFIER+"&SEQG="+SEQG;
    	CenterNamedWindow(page,'Information',650,500,2);
}
}

function callOpGar() {
    	page = "<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSERA0000?SCREEN=3";
    	CenterNamedWindow(page,'Information',650,500,2);
}

function callCust() {
var customer = document.forms[0].E01ROCCUN.value;   
    	page = "<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSESD0080?SCREEN=600&E01CUN="+customer;
    	CenterNamedWindow(page,'Information',650,500,2);
}
function helpCust(cus) {
var customer = cus;   
    	page = "<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSESD1080?SCREEN=8&E01CUN="+customer;
    	CenterNamedWindow(page,'Information',1200,650,2);
}

function callConfInq() {
var garantia = document.forms[0].E01ROCREF.value;   
    	page = "<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSERA0078?SCREEN=102&E01ROCREF="+garantia;
    	CenterNamedWindow(page,'Information',1200,630,2);
}

function hideDiv(fld, value){
 if (value) {
   eval(fld+".style.display='none'");
   } else{
   eval(fld+".style.display=''");
   }
}
function closeEnterACC(){
//   	  AMT.filters[0].apply();
      AMT.style.visibility="hidden";
//      AMT.filters[0].Play();
}

function cancelBub(){
  event.cancelBubble = true;
}

//function GetReserva(name,bnk,app,sel,amt,cun) {
//   Client = cun;
//   page= prefix +language + "EWD0037_client_help_container.jsp";
//   fieldName = name;
//   fieldDesc = "";
//   fieldAux1 = "";
//   fieldAux2 = "";
//   fieldAux3 = "";
//   fieldAux4 = "";
//   fieldAux5 = 0;
//   AppCode = app;
//   Bank = bnk;
//   Selection = sel;
//   CenterWindow(page,850,500,1);
//}

function ShowEnterAcc() {
	 var y= mainTableF.offsetTop + 10;
     var x= mainTableF.offsetLeft + (AMT.clientWidth /2);
	 //cancelBub();
	 eval('AMT.style.pixelTop=' + y);
     eval('AMT.style.pixelLeft=' + x);
//	 AMT.filters[0].apply();
     AMT.style.visibility="visible";
//     AMT.filters[0].Play();
	 document.forms[0].E01RESNRE.focus();
}
document.onclick= closeEnterACC;

</SCRIPT>

<style type="text/css">
div.TabView div.Tabs
{
    height: 36px;
    overflow: hidden;
}

div.TabView div.Tabs a
{

    float: left;
    display: block;
    width:  230px;
    text-align: center;
    height: 36px;
    padding-top: 3px;
    vertical-align: middle;
    border: 1px solid black;
    border-bottom-width: 0;

    text-decoration: none;

    font-family: "Arial", Serif;
    font-weight: 900;
    color: #000080;

}

div.TabView div.Tabs a:hover, div.TabView div.Tabs a.Active
{
    background-color: light#d0122c;
}

div.TabView div.Pages
{
    clear: both;
    border: 1px solid #404040;
    overflow: hidden;
}

div.TabView div.Pages div.Page
{
    height: 100%;
    padding: 0px;
    overflow: hidden;
}

div.TabView div.Pages div.Page div.Pad
{
    padding: 3px 5px;
}
</style>

</head>

<body>
<%
	if (!error.getERRNUM().equals("0")) {
		error.setERRNUM("0");
		out.println("<SCRIPT Language=\"Javascript\">");
		out.println("       showErrors()");
		out.println("</SCRIPT>");
	}
%> 
<h3 align="center">
<%
	if (userPO.getPurpose().equals("INQUIRY")) {
%>
Consulta de Garant&iacute;a
<%
	} else {
%>
<%
	if (userPO.getPurpose().equals("NEW")) {
%>
Nueva Garantía
<%
	} else {
%>
<%
	if (userPO.getPurpose().equals("APPROVE")) {
%>
Aprobación de Garantía
<%
	} else {
%>
Mantenimiento de Garant&iacute;a
<%
	}
		}
	}
%>
</h3> 
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSERA0050" >


<%
	if (!userPO.getPurpose().equals("NEW")) {
%>
  		<INPUT TYPE=HIDDEN NAME="SCREEN" ID="SCREEN" VALUE="2">
<%
	} else {
%>
   		<INPUT TYPE=HIDDEN NAME="SCREEN" ID="SCREEN" VALUE="500">
<%
	}
%>
    
   <input type="hidden" name="E01ROCTYP" id="E01ROCTYP" value="<%=gaMant.getE01ROCTYP().trim()%>">
   <input type="hidden" name="E01ROCDCC" id="E01ROCDCC" value="<%=gaMant.getE01ROCDCC().trim()%>" >
   <input type="hidden" name="E01ROCSTN" id="E01ROCSTN" value="<%=gaMant.getE01ROCSTN().trim()%>" >
   <input type="hidden" name="E01ROCCNL" id="E01ROCCNL" value="<%=gaMant.getE01ROCCNL().trim()%>" >
   <input type="hidden" name="E01ROCSTY" id="E01ROCSTY" value="<%=gaMant.getE01ROCSTY().trim()%>" >
   <input type="hidden" name="E01ROCSTM" id="E01ROCSTM" value="<%=gaMant.getE01ROCSTM().trim()%>" >
   <input type="hidden" name="E01ROCSTD" id="E01ROCSTD" value="<%=gaMant.getE01ROCSTD().trim()%>" >
   <input type="hidden" name="E01ROCFLG" id="E01ROCFLG" value="<%=gaMant.getE01ROCFLG().trim()%>" >
   <input type="hidden" name="E01ROCRGK" id="E01ROCRGK" value="<%=gaMant.getE01ROCRGK().trim()%>" >
   <input type="hidden" name="E01ROCFAA" id="E01ROCFAA" value="<%=gaMant.getE01ROCFAA().trim()%>" >
   <input type="hidden" name="E01ROCAM1" id="E01ROCAM1" value="<%=gaMant.getE01ROCAM1().trim()%>" >
   <input type="hidden" name="E01ROCINA" id="E01ROCINA" value="<%=gaMant.getE01ROCINA().trim()%>" >
   <input type="hidden" name="E01ROCUC5" id="E01ROCUC5" value="<%=gaMant.getE01ROCUC5().trim()%>" >
   <input type="hidden" name="E01ROCTS4" id="E01ROCTS4" value="<%=gaMant.getE01ROCTS4().trim()%>" >
   <input type="hidden" name="REF" id="REF" value="<%=gaMant.getE01ROCREF().trim()%>" >
   <input type="hidden" name="DSC" id="DSC" value="" >               
   <input type=HIDDEN name="UPDCONST" value="1"> 
   <input type=HIDDEN name="UPDGARANT" value="1"> 
   <input type=HIDDEN name="E01R01SEQ" value=""> 
   <input type=HIDDEN name="OPECOD" value=""> 
   <input type=HIDDEN name="SEQBIEN" value=""> 
   <input type=HIDDEN name="PURPOSE" value="<%=userPO.getPurpose()%>"> 
   <input type=HIDDEN name="POLIZA" value="" readonly>                 
<div id="AMT" style="position:absolute; visibility:hidden; left:25px;  top:750px;" onclick="cancelBub()">	
    <table id=tbhelp style="border-top-width : 1px;border-right-width : 1px;border-bottom-width : 1px;border-left-width : 1px;
	border-color: #0b23b5;
	border-style : solid solid solid solid;
	filter:progid:DXImageTransform.Microsoft.dropshadow(OffX=3, OffY=3, Color='gray', Positive='true');">
		<TR>
	  		<TD ALIGN=right nowrap>Ingrese el Número de Reserva a asignar a esta Garantía : 
	  		<input type="text" maxlength=17 size=12 name="E01RESNRE" onKeyPress="enterInteger(event)" value="">
   			<a href="javascript:GetReserva('E01RESNRE','','RS','','','<%=gaMant.getE01ROCCUN().trim()%>')"><img src="<%=request.getContextPath()%>/images/1b.gif" title=". . ." align="middle" border="0" ></a> 
       			&nbsp; 
	  		</TD>
      		<TD ALIGN=Left nowrap>
      		<a href="javascript:goAction('10',1)"><img name="Image1" border="0" src="<%=request.getContextPath()%>/images/s/applicar_on.gif"></a>
      		</TD>
   		</TR>
 	</TABLE>
</div>
                                        
  <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
          <tr id="trdark">
            <td nowrap> 
              <div align="right"><b>Cliente : </b></div>
            </td>
            <td nowrap > 
              <div align="left"> 
                <%
                 	if (userPO.getPurpose().equals("NEW")) {
                 %>  
                <input type="text" name="E01ROCCUN" id="E01ROCCUN" size="11" maxlength="9" value="<%=gaMant.getE01ROCCUN().trim().equals("0") ? client
						: gaMant.getE01ROCCUN().trim()%>">
                <a href="javascript:GetCustomerDescId('E01ROCCUN','E01CUSNA1','')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="bottom" border="0" ></a>
                <%
                	} else {
                %> 
                <input type="text" name="E01ROCCUN" id="E01ROCCUN" readonly size="11" maxlength="9" value="<%=gaMant.getE01ROCCUN().trim()%>">
              	<%
              		}
              	%>
              </div>
            </td>
            <td nowrap> 
              <div align="right"><b>Nombre :</b> </div>
            </td>
            <td nowrap> 
              <div align="left">
                <input type="text" name="E01CUSNA1" id="E01CUSNA1" readonly size="60" maxlength="45" value="<%=gaMant.getE01CUSNA1().trim().equals("") ? curname
					: gaMant.getE01CUSNA1().trim()%>" >
              </div>
            </td>
          </tr>
          <tr id="trdark">
            <td nowrap > 
              <div align="right"><b>No. Referencia : </b></div>
            </td>
            <td nowrap>
             <%
             	if (userPO.getPurpose().equals("NEW")) {
             %> 
              <input type="hidden" name="E01ROCREF" id="E01ROCREF" size="14" maxlength="12" value="<%=gaMant.getE01ROCREF().trim()%>">
              <input type="text" name="E01ROCREF" id="TMPREF" size="14" maxlength="12" value="<%if (gaMant.getE01ROCREF().trim().equals("999999999999"))
					out.print("NUEVA CUENTA");
				else
					out.print(gaMant.getE01ROCREF().trim());%>" readonly>
              <%
              	} else {
              %> 
              <input type="text" name="E01ROCREF" id="E01ROCREF" size="14" maxlength="12" value="<%=gaMant.getE01ROCREF().trim()%>" readonly>
              <%
              	}
              %>
            </td> 
            <td nowrap> 
              <div align="right"><b>Moneda : </b></div>
            </td>
            <td nowrap> 
              <div align="left">
               <input type="text" name="E01ROCCCY" id="E01ROCCCY" size="4" maxlength="3" value="<%=gaMant.getE01ROCCCY().trim()%>" readonly> 
              </div>
            </td>
           </tr>
          <tr id="trdark">             
            <td nowrap> 
              <div align="right"><b>Producto :</b> </div>
            </td>
            <td nowrap> 
              <div align="left">
                <input type="text" name="PRODUCT" size="38" value="<%=gaMant.getE01ROCPRD().trim()%> - <%=gaMant.getE01ROCDPR().trim()%>" readonly>                 
                <input type="hidden" name="E01ROCPRD" size="4" maxlength="4" value="<%=gaMant.getE01ROCPRD().trim()%>" readonly> 
                <input type="hidden" name="E01ROCDPR" size="30" maxlength="30" value="<%=gaMant.getE01ROCDPR().trim()%>" readonly> 
              </div>
            </td>
            <td nowrap> 
              <div align="right"><b>Tipo de Garantía :</b> </div>
            </td>
            <td nowrap> 
              <div align="left">
                <input type="text" name="TYPE" size="38" value="<%=gaMant.getE01ROCTYP().trim()%> - <%=gaMant.getE01ROCDGT().trim()%>" readonly>                 
                <input type="hidden" name="E01ROCCGT" size="4" maxlength="4" value="<%=gaMant.getE01ROCCGT().trim()%>" readonly> 
                <input type="hidden" name="E01ROCDGT" size="30" maxlength="30" value="<%=gaMant.getE01ROCDGT().trim()%>" readonly> 
              </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
<%
	if (!userPO.getPurpose().equals("NEW") && (!gaMant.getD01ROCCNL().equals(""))) {
%>

  <table class="tableinfo">
    <tr > 
        <td >
          <table cellspacing="0" cellpadding="2" width="100%" border="0" >
   		  <tr id="trdark"> 
      		<td align="center" nowrap  width="100%"> 
             <div><b><font color="#ff6600"><%=gaMant.getD01ROCCNL().trim()%></font></b></div>
			</td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
<%
	}
%>

<%
	if (!userPO.getPurpose().equals("NEW") && (gaMant.getE01ROCRGK().equals("Y"))) {
	if (!gaMant.getE01ROCUC5().equals("D")){ 
%>

  <table class="tableinfo">
    <tr > 
        <td >
          <table cellspacing="0" cellpadding="2" width="100%" border="0" >
   		  <tr id="trdark"> 
      		<td align="center" nowrap  width="100%"> 
             <div><b><font color="#ff6600">GARANTIA PENDIENTE DE ENVIO A CONFECAMARAS</font></b></div>
			</td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
<%
	}}
%>
<%
	if (!userPO.getPurpose().equals("NEW") && (gaMant.getE01ROCTYP().equals("X"))) {
	if (gaMant.getE01ROCIPD().equals("0")){ 
%>

  <table class="tableinfo">
    <tr > 
        <td >
          <table cellspacing="0" cellpadding="2" width="100%" border="0" >
   		  <tr id="trdark"> 
      		<td align="center" nowrap  width="100%"> 
             <div><b><font color="#ff6600">CUENTA DE COBRO PENDIENTE DE INGRESAR</font></b></div>
			</td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
<%
	}}
%>

<div id="divGarConst" style="position:relative; display:block;">

<TABLE id="mainTableD" class="tableinfo">
<TR>
<TD nowrap valign="top" >

  <div class="TabView" id="TabView" >
    <div class="Tabs" style="width: 100%;"><a>Constituyentes</a><a>Garantizados</a></div>
    <div class="Pages" style="width: 100%; height: 250px;">
		  <%
		  	if (b_read_only1 == false) {
		  %>

		  <table class="tbenter" align=center>
    		<tr> 
<%-- 
    			<td class=TDBKG width="20%">
        		<div align="center"><a href="javascript:goActionList1(1)" id="btn1"><b>Enviar</b></a></div> 
			    </td> 
--%>
	 			<td class=TDBKG > 
        		<div align="center"><a href="javascript:goRefresh()" id="btn2"><b>Borrar Selección</b></a></div>
				</td>
		    </tr>
		  </table>
		  <%
		  	}
		  %>
  

      <div class="Page">
	  <TABLE id="mainTable2" class="tableinfo" >
         			<tr id="trdark"> 
					<%
 						if (b_read_only1 == false) {
 					%>
            		<th align=CENTER width="5%"> <div align="center">Borrar </div> </th>
					<%
						}
					%>
            		<th align=CENTER width="10%"> <div align="center">Número</div> </th>
            		<th align=CENTER width="30%">Nombre y Apellidos</th>
            		<th align=CENTER width="15%"> <div align="center">Identificación</div> </th>
            		<th align=CENTER width="10%"> <div align="center">Porcentaje</div> </th>
		    	  	</tr>
    	<%
    		int i = 0;
    		int iw = 5;
    	%> 
    		<%
     			listConst.initRow();
     			boolean firstTime = true;
     			while (listConst.getNextRow()) {
     				if (firstTime) {
     					firstTime = false;
     					iw = iw - 5;
     				}
     		%> 
		<%
		if (b_read_only1 == false) {
		%>
   		<tr id="trclear"> 
		  	<input type="HIDDEN" name="E01CUMCUN_<%=listConst.getCurrentRow()%>" value="<%=gaMant.getE01ROCREF().trim()%>">
		  	<input type="HIDDEN" name="E01CUMMAN_<%=listConst.getCurrentRow()%>" value="<%=listConst.getRecord(0)%>">
			<%
				if (b_read_only1 == false) {
			%>
      		<td width="5%"> 
        	<input type="checkbox" name="SELCONST_<%=listConst.getCurrentRow()%>" value="checked" onfocus="document.forms[0].UPDGARANT.value='1'">
			</td>
			<%
				}
			%>
      		<td  width="10%">  
	          <input type="text" name="E01CUMRCN_<%=listConst.getCurrentRow()%>" size="12" maxlength="9"  value="<%=listConst.getRecord(1)%>" onKeyPress="enterInteger(event)" onfocus="asigVal('UPDGARANT','1');"  onchange="asigVal('UPDGARANT','1');"
				class="context-menu-help" onmousedown="init(custdescidHelp,'E01CUMRCN_<%=listConst.getCurrentRow()%>','','','E01CUMMA1_<%=listConst.getCurrentRow()%>','E01CUMBNI_<%=listConst.getCurrentRow()%>','')" <%=read_only1%>>
    		</td>
      		<td  width="30%"> 
          	<input type="text" name="E01CUMMA1_<%=listConst.getCurrentRow()%>" size="30" maxlength="45"  value="<%=listConst.getRecord(2)%>"  onfocus="asigVal('UPDGARANT','1');" onchange="asigVal('UPDGARANT','1');" <%=read_only1%> >
			</td>												
      		<td width="15%"> 
          	<input type="text" name="E01CUMBNI_<%=listConst.getCurrentRow()%>" size="21" maxlength="25" value="<%=listConst.getRecord(3)%>" onfocus="asigVal('UPDGARANT','1');" onchange="asigVal('UPDGARANT','1');" <%=read_only1%>>
			</td>	
      		<td  width="10%"> 
          	<input type="text" name="E01CUMAM2_<%=listConst.getCurrentRow()%>" size="7" maxlength="6"  value="<%=listConst.getRecord(45)%>" onfocus="asigVal('UPDGARANT','1');" onchange="asigVal('UPDGARANT','1');" <%=read_only1%>  onKeyPress="enterInteger(event,2)">
    		</td>
    	</tr>
		<%
			}else{
		%>
   		<tr id="trclear"> 
			<td > <a href="javascript:helpCust('<%=listConst.getRecord(1)%>')"><%=Util.formatCell(listConst.getRecord(1))%></a></td>
			<td > <a href="javascript:helpCust('<%=listConst.getRecord(1)%>')"><%=Util.formatCell(listConst.getRecord(2))%></a></td>
			<td > <a href="javascript:helpCust('<%=listConst.getRecord(1)%>')"><%=Util.formatCell(listConst.getRecord(3))%></a></td>
			<td > <a href="javascript:helpCust('<%=listConst.getRecord(1)%>')"><%=Util.formatCell(listConst.getRecord(45))%></a></td>
    	</tr>
		<%
			}
		%>
   		 <%
   		 	}
   		 	if (b_read_only1 == false) {
   		 		for (i = listConst.getRow(); i < listConst.getCurrentRow()
   		 				+ (iw + 5); i++) {
   		 %> 
    	<tr id="trclear"> 
      	<td  > 
       	 <input type="checkbox" name="SELCONST_<%=i%>" value="checked">
      	</td>
      	<td > 
        	  <input type="text" name="E01CUMRCN_<%=i%>" size="12" maxlength="9" onKeyPress="enterInteger(event)" onfocus="asigVal('UPDGARANT','1');" onchange="asigVal('UPDGARANT','1');" 
				class="context-menu-help" onmousedown="init(custdescidHelp,'E01CUMRCN_<%=i%>','','','E01CUMMA1_<%=i%>','E01CUMBNI_<%=i%>','')"  <%=read_only1%>>
	      </td>
		<td > 
        	  <input type="text" name="E01CUMMA1_<%=i%>" size="30" maxlength="45" onfocus="asigVal('UPDGARANT','1');" onchange="asigVal('UPDGARANT','1');">
  	    </td>
     	<td  > 
          <input type="text" name="E01CUMBNI_<%=i%>" size="21" maxlength="25" value="" onfocus="asigVal('UPDGARANT','1');" onchange="asigVal('UPDGARANT','1');">
  	    </td>
    	<td > 
          <input type="text" name="E01CUMAM2_<%=i%>" size="7" maxlength="6" value="" onfocus="asigVal('UPDGARANT','1');" onchange="asigVal('UPDGARANT','1');"  onKeyPress="enterInteger(event,2)">
      	</td>

	  </tr>
   	 	<%
   	 		}
   	 		}
   	 	%> 
	  	<input type="HIDDEN" name="RECNUMDB" value="<%=i%>">
   </table>
    </div>
    
      <div class="Page">
		<TABLE id="mainTable3" class="tableinfo" >
          			<tr id="trdark"> 
					<%
 						if (b_read_only1 == false) {
 					%>
            		<th align=CENTER nowrap width="5%"> <div align="center">Borrar </div></th>
					<%
						}
					%>
            		<th align=CENTER width="10%"> <div align="center">Número</div> </th>
            		<th align=CENTER width="30%">Nombre y Apellidos</th>
            		<th align=CENTER width="15%"> <div align="center">Identificación</div> </th>
            		<th align=CENTER width="10%"> <div align="center">Porcentaje</div> </th>
		    	  	</tr>
    	<%
    		i = 0;
    		iw = 5;
    	%> 
    		<%
     			listGarant.initRow();
     			firstTime = true;
     			while (listGarant.getNextRow()) {
     				if (firstTime) {
     					firstTime = false;
     					iw = iw - 5;
     				}
     		%> 
			<%
				if (b_read_only1 == false) {
			%>
    		<tr id="trclear"> 
		  	<input type="HIDDEN" name="E02CUMCUN_<%=listGarant.getCurrentRow()%>" value="<%=gaMant.getE01ROCREF().trim()%>">
		  	<input type="HIDDEN" name="E02CUMMAN_<%=listGarant.getCurrentRow()%>" value="<%=listGarant.getRecord(0)%>">
			<%
				if (b_read_only1 == false) {
			%>
      		<td   width="5%"> 
        	<input type="checkbox" name="SELGARANT_<%=listGarant.getCurrentRow()%>" value="checked" onfocus="document.forms[0].UPDCONST.value='1'">
			</td>
			<%
				}
			%>
      		<td   width="10%">  
	          <input type="text" name="E02CUMRCN_<%=listGarant.getCurrentRow()%>" size="12" maxlength="9"  value="<%=listGarant.getRecord(1)%>" onKeyPress="enterInteger(event)" onfocus="asigVal('UPDCONST','1');"  onchange="asigVal('UPDCONST','1');"
				class="context-menu-help" onmousedown="init(custdescidHelp,this.name,'','','E02CUMMA1_<%=listGarant.getCurrentRow()%>','E02CUMBNI_<%=listGarant.getCurrentRow()%>','')"  <%=read_only1%>>
    		</td>
      		<td   width="30%"> 
          	<input type="text" name="E02CUMMA1_<%=listGarant.getCurrentRow()%>" size="30" maxlength="45"  value="<%=listGarant.getRecord(2)%>"  onfocus="asigVal('UPDCONST','1');" onchange="asigVal('UPDCONST','1');" <%=read_only1%> >
			</td>												
      		<td   width="15%"> 
          	<input type="text" name="E02CUMBNI_<%=listGarant.getCurrentRow()%>" size="21" maxlength="25" value="<%=listGarant.getRecord(3)%>" onfocus="asigVal('UPDCONST','1');" onchange="asigVal('UPDCONST','1');" <%=read_only1%>>
			</td>	
      		<td  width="10%"> 
          	<input type="text" name="E02CUMAM2_<%=listGarant.getCurrentRow()%>" size="7" maxlength="6"  value="<%=listGarant.getRecord(45)%>" onfocus="asigVal('UPDCONST','1');" onchange="asigVal('UPDCONST','1');" <%=read_only1%>  onKeyPress="enterInteger(event,2)">
    		</td>
    	</tr>
		<%
			}else{
		%>
   		<tr id="trclear"> 
			<td  > <a href="javascript:helpCust('<%=listGarant.getRecord(1)%>')"><%=Util.formatCell(listGarant.getRecord(1))%></a></td>
			<td  > <a href="javascript:helpCust('<%=listGarant.getRecord(1)%>')"><%=Util.formatCell(listGarant.getRecord(2))%></a></td>
			<td  > <a href="javascript:helpCust('<%=listGarant.getRecord(1)%>')"><%=Util.formatCell(listGarant.getRecord(3))%></a></td>
			<td  > <a href="javascript:helpCust('<%=listGarant.getRecord(1)%>')"><%=Util.formatCell(listGarant.getRecord(45))%></a></td>
    	</tr>
		<%
			}
		%>
   		 <%
   		 	}
   		 	if (b_read_only1 == false) {
   		 		for (i = listGarant.getRow(); i < listGarant.getCurrentRow()
   		 				+ (iw + 5); i++) {
   		 %> 
    	<tr id="trclear"> 
      	<td  > 
       	 <input type="checkbox" name="SELGARANT_<%=i%>" value="checked">
      	</td>
      	<td  > 
        	  <input type="text" name="E02CUMRCN_<%=i%>" size="12" maxlength="9" onkeypress="enterInteger()" onfocus="asigVal('UPDCONST','1');" onchange="asigVal('UPDCONST','1');" 
				class="context-menu-help" onmousedown="init(custdescidHelp,this.name,'','','E02CUMMA1_<%=i%>','E02CUMBNI_<%=i%>','')"  <%=read_only1%>>
	      </td>
		<td > 
        	  <input type="text" name="E02CUMMA1_<%=i%>" size="30" maxlength="45" onfocus="asigVal('UPDCONST','1');" onchange="asigVal('UPDCONST','1');">
  	    </td>
     	<td  > 
          <input type="text" name="E02CUMBNI_<%=i%>" size="21" maxlength="25" value="" onfocus="asigVal('UPDCONST','1');" onchange="asigVal('UPDCONST','1');">
  	    </td>
<%--      	<td  > 
          <input type="text" name="E02CUMAM1_<%=i%>" size="17" maxlength="15" value="" onfocus="asigVal('UPDCONST','1');" onchange="asigVal('UPDCONST','1');"  onkeypress="enterInteger()">
  	    </td>
--%>    	<td  > 
          <input type="text" name="E02CUMAM2_<%=i%>" size="7" maxlength="6" value="" onfocus="asigVal('UPDCONST','1');" onchange="asigVal('UPDCONST','1');" onKeyPress="enterInteger(event,2)" >
      	</td>

	  </tr>
   	 	<%
   	 		}
   	 		}
   	 	%> 
	  	<input type="HIDDEN" name="RECNUMGAR" value="<%=i%>">
   </table>
      </div>
  </DIV>
  </div>
</TD>
</TR>
</TABLE>
</div> 
 
  <h4>Informaci&oacute;n B&aacute;sica</h4>
      
  <table class="tableinfo" width="100%">
    <tr > 
      <td nowrap> 
        <table cellspacing=0 cellpadding=2 width="100%" border="0">
          <tr id="trclear">  
            <td nowrap> 
              <div align="right">Estado Garantía : </div>
            </td>
            <td nowrap >
             <div>
              <INPUT type="text" name="D01ROCUC2" size="32" maxlength="30" value="<%= gaMant.getD01ROCFG1().trim()%>" readonly>
             </div>
            </td>
            <td nowrap >
              <div align="right">Estado Contable : </div>
            </td>
            <td nowrap >
             <div>
                  <select name="E01ROCSTS">
                    <option value=" " <%if (!(gaMant.getE01ROCSTS().equals("1")
					|| gaMant.getE01ROCSTS().equals("2")
					|| gaMant.getE01ROCSTS().equals("3")
					|| gaMant.getE01ROCSTS().equals("4")
					|| gaMant.getE01ROCSTS().equals("5") || gaMant
					.getE01ROCSTS().equals("6")))
				out.print("selected");%>disabled> 
                     </option>
                     <option value="1" <%if (gaMant.getE01ROCSTS().equals("1"))
				out.print("selected");%> disabled>Por Utilizar</option>
                     <option value="2" <%if (gaMant.getE01ROCSTS().equals("2"))
				out.print("selected");%> disabled>Utilizada</option>
                     <option value="3" <%if (gaMant.getE01ROCSTS().equals("3"))
				out.print("selected");%> disabled>Por Cancelar</option>
                     <option value="4" <%if (gaMant.getE01ROCSTS().equals("4"))
				out.print("selected");%> disabled>Cancelada</option>
                     <option value="5" <%if (gaMant.getE01ROCSTS().equals("5"))
				out.print("selected");%> disabled>Titularizada</option>
                   </select>
			</div>
            </td>
          </tr>

          <tr id="trdark">  
            <td nowrap> 
              <div align="right">Estado Transaccional : </div>
            </td>
            <td nowrap >
             <div>
              <INPUT type="text" name="E01ROCUC1" size="5" maxlength="4" value="<%= gaMant.getE01ROCUC1().trim()%>" <%=read_only1%>>
			<%
				if (b_read_only1 == false) {
			%>
              <a href="javascript:GetCodeDescCNOFC('E01ROCUC1','E01ROCUNR','G0')"><img src="<%=request.getContextPath()%>/images/1b.gif" title=". . ." align="bottom" border="0"></a> 
            <%} %>
              <INPUT type="text" name="E01ROCUNR" size="32" maxlength="30" value="<%= gaMant.getE01ROCUNR().trim()%>" readonly>
             </div>
            </td>
            <td nowrap >
            </td>
            <td nowrap >
             <div>
			</div>
            </td>
          </tr>

          <tr id="trclear">  
            <td nowrap> 
              <div align="right">Abierta/Cerrada : </div>
            </td>
            <td nowrap >
                <input type="hidden" name="E01ROCFL1" value="<%=gaMant.getE01ROCFL1()%>">
                <input type="radio" name="CE01ROCFL1" value="A" onClick="document.forms[0].E01ROCFL1.value='A'"
			  <%if (gaMant.getE01ROCFL1().equals("A")) out.print("checked");%> <%if (!gaMant.getE01ROCTS2().equals("")) out.print("disabled");%> <%=disabled1%>>
                Abierta 
                <input type="radio" name="CE01ROCFL1" value="C" onClick="document.forms[0].E01ROCFL1.value='C'"
			  <%if (gaMant.getE01ROCFL1().equals("C")) out.print("checked");%> <%if (!gaMant.getE01ROCTS2().equals("")) out.print("disabled");%> <%=disabled1%>>
                Cerrada
				<img src="<%=request.getContextPath()%>/images/Check.gif" title="campo obligatorio" align="bottom" border="0" width="16" height="20"  >
             </td>
            <td nowrap >
              <div align="right">Con Tenencia : </div>
            </td>
            <td nowrap >
                <input type="hidden" name="E01ROCFL2" value="<%=gaMant.getE01ROCFL2()%>">
                <input type="radio" name="CE01ROCFL2" value="Y" onClick="document.forms[0].E01ROCFL2.value='Y'"
			  <%if (gaMant.getE01ROCFL2().equals("Y"))
				out.print("checked");%> <%=disabled1%>>
                Si 
                <input type="radio" name="CE01ROCFL2" value="N" onClick="document.forms[0].E01ROCFL2.value='N'"
			  <%if (gaMant.getE01ROCFL2().equals("N"))
				out.print("checked");%> <%=disabled1%>>
                No
				<img src="<%=request.getContextPath()%>/images/Check.gif" title="campo obligatorio" align="bottom" border="0" width="16" height="20"  >  				                
            </td>
          </tr>
          <tr id="trdark">  
            <td nowrap> 
              <div align="right">Idonea : </div>
            </td>
            <td nowrap >
                <input type="hidden" name="E01ROCFL3" value="<%=gaMant.getE01ROCFL3()%>">
                <input type="radio" name="CE01ROCFL3" value="Y" onClick="document.forms[0].E01ROCFL3.value='Y'"
			  <%if (gaMant.getE01ROCFL3().equals("Y")) out.print("checked");%> <%if (!gaMant.getE01ROCTS3().equals("")) out.print("disabled");%> <%=disabled1%>>
                Si
                <input type="radio" name="CE01ROCFL3" value="N" onClick="document.forms[0].E01ROCFL3.value='N'"
			  <%if (gaMant.getE01ROCFL3().equals("N")) out.print("checked");%> <%if (!gaMant.getE01ROCTS3().equals("")) out.print("disabled");%> <%=disabled1%>>
                No
				<img src="<%=request.getContextPath()%>/images/Check.gif" title="campo obligatorio" align="bottom" border="0" width="16" height="20"  >
             </td>
            <td nowrap >
              <div align="right">Garantía/Fuente de Pago : </div>
            </td>
            <td nowrap >
                <input type="hidden" name="E01ROCCOU" value="<%=gaMant.getE01ROCCOU()%>">
                <input type="radio" name="CE01ROCCOU" value="G" onClick="document.forms[0].E01ROCCOU.value='G'"
			  <%if (gaMant.getE01ROCCOU().equals("G"))
				out.print("checked");%> disabled>
                Garantía 
                <input type="radio" name="CE01ROCCOU" value="F" onClick="document.forms[0].E01ROCCOU.value='F'"
			  <%if (gaMant.getE01ROCCOU().equals("F"))
				out.print("checked");%> disabled>
                Fuente de Pago
            </td>
          </tr>
          <tr id="trclear">  
            <td nowrap> 
              <div align="right">Admisible : </div>
            </td>
            <td nowrap >
                <input type="hidden" name="E01ROCTCY" value="<%=gaMant.getE01ROCTCY()%>">
                <input type="radio" name="CE01ROCTCY" value="Y" onClick="document.forms[0].E01ROCTCY.value='Y'"
			  <%if (gaMant.getE01ROCTCY().equals("Y")) out.print("checked");%> <%if (!gaMant.getE01ROCTS4().equals("")) out.print("disabled");%> <%=disabled1%>>
                Si
                <input type="radio" name="CE01ROCTCY" value="N" onClick="document.forms[0].E01ROCTCY.value='N'"
			  <%if (gaMant.getE01ROCTCY().equals("N")) out.print("checked");%> <%if (!gaMant.getE01ROCTS4().equals("")) out.print("disabled");%> <%=disabled1%>>
                No
				<img src="<%=request.getContextPath()%>/images/Check.gif" title="campo obligatorio" align="bottom" border="0" width="16" height="20"  > 
            </td>
            <td nowrap >
              <div align="right">Característica de la Garantía :</div>
            </td>
            <td nowrap >
			  <%if (gaMant.getE01ROCTYP().equals("Y")){ %>
               <div align="left"> 
                  <select name="E01ROCEND">
                    <option value=" " <%if (!(gaMant.getE01ROCEND().equals("N")
					|| gaMant.getE01ROCEND().equals("C") || gaMant
					.getE01ROCEND().equals("R")))
				out.print("selected");%> disabled> 
                     </option>
                     <option value="N" <%if (gaMant.getE01ROCEND().equals("N"))
				out.print("selected");%> <%=disabled1%>>Normal</option>
                     <option value="C" <%if (gaMant.getE01ROCEND().equals("C"))
				out.print("selected");%> <%=disabled1%>>Castigo</option>
                     <option value="R" <%if (gaMant.getE01ROCEND().equals("R"))
				out.print("selected");%> <%=disabled1%>>Reestructurado</option>
                   </select>
                </div>
                <%}else{ %>
               <div align="left"> 
                  <select name="E01ROCEND">
                    <option value=" " <%if (!(gaMant.getE01ROCEND().equals("N")
					|| gaMant.getE01ROCEND().equals("C") || gaMant
					.getE01ROCEND().equals("R")))
				out.print("selected");%> disabled> 
                     </option>
                     <option value="N" <%if (gaMant.getE01ROCEND().equals("N"))
				out.print("selected");%> disabled>Normal</option>
                     <option value="C" <%if (gaMant.getE01ROCEND().equals("C"))
				out.print("selected");%> disabled>Castigo</option>
                     <option value="R" <%if (gaMant.getE01ROCEND().equals("R"))
				out.print("selected");%> disabled>Reestructurado</option>
                   </select>
                </div>
                <%} %>
            </td>
          </tr>
          <tr id="trdark">  
            <td nowrap> 
              <div align="right">Garantía Voluntaria : </div>
            </td>
            <td nowrap >
                <input type="hidden" name="E01ROCFG2" value="<%=gaMant.getE01ROCFG2()%>">
                <input type="radio" name="CE01ROCFG2" value="Y" onClick="document.forms[0].E01ROCFG2.value='Y'; hideDiv('DivActa',true)"
			  <%if (gaMant.getE01ROCFG2().equals("Y"))
				out.print("checked");%> <%=disabled1%> onChange="hideDiv('DivActa',true)" onBlur="hideDiv('DivActa',true)" >
                Si
                <input type="radio" name="CE01ROCFG2" value="N" onClick="document.forms[0].E01ROCFG2.value='N'; hideDiv('DivActa',false)"
			  <%if (gaMant.getE01ROCFG2().equals("N"))
				out.print("checked");%> <%=disabled1%> onChange="hideDiv('DivActa',false)" onBlur="hideDiv('DivActa',false)" >
                No
            </td>
            <td nowrap >
              <div align="right">Cuenta Contable: </div>
            </td>
            <td nowrap >
              	<input type="text" name="E01ROCBNK" readonly size="3" maxlength="2" value="<%=gaMant.getE01ROCBNK().trim()%>" readonly>
              	<input type="text" name="E01ROCBRN" readonly size="5" maxlength="4" value="<%=gaMant.getE01ROCBRN().trim()%>" <%=read_only1%>>
               <%
              	if (read_only1.equals("")) {
              %> 
              <a href="javascript:GetBranch('E01ROCBRN','<%=gaMant.getE01ROCBNK().trim()%>','')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="bottom" border="0"  ></a>
			  <%
			  	}
			  %>
              	<input type="text" name="E01ROCGLN" readonly size="20" maxlength="18" value="<%=gaMant.getE01ROCGLN().trim()%>" readonly>
            </td>
          </tr>
          <tr id="trclear">  
            <td nowrap> 
              <div align="right">Fecha Apertura : </div>
            </td>
            <td nowrap >
			<eibsinput:date name="gaMant" fn_year="E01ROCOPY" fn_month="E01ROCOPM" fn_day="E01ROCOPD" required="true" readonly="<%=b_read_onlyType%>"/>
            </td>
            <td nowrap >
              <div align="right">Fecha Vencimiento : </div>
            </td>
            <td nowrap >
             <eibsinput:date name="gaMant" fn_year="E01ROCMTY" fn_month="E01ROCMTM" fn_day="E01ROCMTD" required="true" readonly="<%=b_read_onlyType%>"/>
            </td>
          </tr>
          <tr id="trdark">  
            <td nowrap> 
              <div align="right">Fecha de Revisión : </div>
            </td>
            <td nowrap >
			<eibsinput:date name="gaMant" fn_year="E01ROCREY" fn_month="E01ROCREM" fn_day="E01ROCRED" readonly="false" modified="F01ROCREY;F01ROCREM;F01ROCRED" />
            </td>
            <td nowrap >
            </td>
            <td nowrap >
            </td>
          </tr>
<!--<%-- 
   		  <tr id="trdark"> 
			<td nowrap> 
              <div align="right">Estado del Bien : </div>
            </td>
            <td nowrap>            	 
              <INPUT type="text" name="E01ROCEST" size="2" maxlength="1" value="<%=gaMant.getE01ROCEST().trim()%>" <%=read_only1%>>
              <%
              	if (read_only1.equals("")) {
              %> 
              <A href="javascript:GetCode('E01ROCEST','STATIC_coll_help_benef.jsp')"><img src="<%=request.getContextPath()%>/images/1b.gif" title=". . ." align="bottom" border="0"  ></a>
              <%
              	}
              %> 
               <img src="<%=request.getContextPath()%>/images/Check.gif" title="campo obligatorio" align="bottom" border="0" width="16" height="20"  > 
              <INPUT type="text" name="D01ROCEST" size="30" maxlength="30" value="<%=gaMant.getD01ROCEST().trim()%>" readonly>
            </td>
            <td nowrap> 
--%>
<%-- 

              <div align="right">Origen de la Garantía : </div>
--%>            </td>
            <td nowrap>            	 
<%-- 
              <INPUT type="text" name="E01ROCUC1" size="5" maxlength="4" value="<%= gaMant.getE01ROCUC1().trim()%>" <%=read_only1%>>
              <a href="javascript:GetCodeDescCNOFC('E01ROCUC1','','G1')"><img src="<%=request.getContextPath()%>/images/1b.gif" title=". . ." align="bottom" border="0"></a> 
--%>
			</td>

          </tr>

          --><tr id="trclear">
           
           
            <td nowrap> 
              <div align="right"><b>Valor Garantía :</b></div>
            </td>
            <td nowrap>            	 
	       	  <div align="left"> 
              	<b><%=gaMant.getE01ROCFAA().trim()%></b>
              </div>
            </td>           
            <td nowrap> 
<%-- 
			  <%if (gaMant.getE01ROCTYP().equals("Y")){ %>
--%>
              <div align="right"><b>Valor Original Garantía :</b></div>
<%-- 
			  <%} %>
--%>
            </td>
            <td nowrap>            	 
              <div align="left">
<%-- 
			  <%if (gaMant.getE01ROCTYP().equals("Y")){ %>
--%>
              	<b><%=gaMant.getE01ROCIAL().trim()%></b>
<%-- 
			  <%} %>
--%>
              </div>
            </td>
          </tr>			
			  <%if (gaMant.getE01ROCTYP().equals("Y")){ %>
          <tr id="trclear">  
            <td nowrap> 
              <div align="right">Fecha Maxima de Reclamación : </div>
            </td>
            <td nowrap >
			<eibsinput:date name="gaMant" fn_year="E01ROCPDY" fn_month="E01ROCPDM" fn_day="E01ROCPDD" required="false" readonly="true"/>
            </td>
            <td nowrap >
              <div align="right"><b>Fondo de Garantías :</b></div>
            </td>
            <td nowrap >
              	<b><%=gaMant.getE01ROCUC3().trim()%></b>
            </td>
          </tr>
			  <%} %>

          <tr id="trdark">
            <td nowrap> 
              <div align="right"><b>Valor Asignado :</b></div>
            </td>
            <td nowrap>            	 
              <div align="left">
              	<b><%=gaMant.getE01ROCCOP().trim()%></b>
<%-- ROCCOP = MONTO UTILIZADO SEGUN PARAMETRO GLOBAL CNTCOT
              	<input type="text" name="E01ROCCOP" readonly size="17" maxlength="15" value="<%=gaMant.getE01ROCIAL().trim()%>">
	 ROCIAL = MONTO UTILIZADO SEGUN LISTA DE CUENTAS UTILIZADAS EN RRCOLL 
              	<input type="text" name="E01ROCIAL" readonly size="17" maxlength="15" value="<%=gaMant.getE01ROCIAL().trim()%>">
--%>
              </div>
            </td>
            <td nowrap> 
            </td>
            <td nowrap>
            </td>           
          </tr>			
          <tr id="trclear">
            <td nowrap> 
              <div align="right">Porcentaje de Cobertura de la Garantía :</div>
            </td>
            <td nowrap>            	 
	       	  <div align="left">
              	<input type="text" name="E01ROCPRS" size="11" maxlength="7" value="<%=gaMant.getE01ROCPRS().trim()%>"  			  
              	<%if (gaMant.getE01ROCTYP().equals("Y")){ %>
    			readonly
              	<%}else{ %>
				<%=read_only1%>
              	<%} %>
              	>
				<img src="<%=request.getContextPath()%>/images/Check.gif" title="campo obligatorio" align="bottom" border="0" width="16" height="20"  > 
              </div>
            </td>
            <td nowrap> 
              <div align="right"><b>Valor Máximo a Garantizar :</b></div>
            </td>
            <td nowrap>
              	<b><%=gaMant.getE01ROCAM1().trim()%></b>
            </td>           
          </tr>	
	<%if (gaMant.getE01ROCTYP().equals("Y")){ %>
         <tr id="trclear">
            <td nowrap> 
              <div align="right">Valor Máximo a Garantizar Fondo Garantías :</div>
            </td>
            <td nowrap>            	 
	       	  <div align="left">
              	<b><%=gaMant.getE01ROCIPA().trim()%></b>
              </div>
            </td>
            <td nowrap> 
            </td>
            <td nowrap>
            </td>           
          </tr>	
       	<%} %>
		  <%  if (gaMant.getE01ROCTYP().equals("B") ||(gaMant.getE01ROCTYP().equals("V")) ||(gaMant.getE01ROCTYP().equals("F")) ||(gaMant.getE01ROCTYP().equals("E"))||(gaMant.getE01ROCTYP().equals("T"))) {%>
          <tr id="trdark">  
            <td nowrap> 
              <div align="right">Póliza Endosada : </div>
            </td>
            <td nowrap >
                <input type="hidden" name="E01ROCINF" value="<%=gaMant.getE01ROCINF()%>">
                <input type="radio" name="CE01ROCINF" value="Y" onClick="document.forms[0].E01ROCINF.value='Y'"  onClick="document.forms[0].E01ROCFG2.value='Y'; hideDiv('DivSeg',false)"
			  <%if (gaMant.getE01ROCINF().equals("Y"))
				out.print("checked");%> <%=disabled1%>  onChange="hideDiv('DivSeg',false)" onBlur="hideDiv('DivSeg',false)" >
                Sí
                <input type="radio" name="CE01ROCINF" value="N" onClick="document.forms[0].E01ROCINF.value='N'"  onClick="document.forms[0].E01ROCFG2.value='N'; hideDiv('DivSeg',true)"
			  <%if (gaMant.getE01ROCINF().equals("N"))
				out.print("checked");%> <%=disabled1%>  onChange="hideDiv('DivSeg',true)" onBlur="hideDiv('DivSeg',true)" >
                No
				<img src="<%=request.getContextPath()%>/images/Check.gif" title="campo obligatorio" align="bottom" border="0" width="16" height="20"  > 
            </td>
            <td nowrap> 
            </td>
            <td nowrap colspan="3"> 
            </td>
          </tr>
<%}%>
          <tr id="trdark">  
            <td nowrap> 
              <div align="right">Oficina Contable :</div>
            </td>
            <td nowrap colspan="3"> 
              <input type="text" name="E01ROCU10" id="E01ROCU10" size="5" maxlength="4" value="<%=gaMant.getE01ROCU10().trim()%>" <%=read_only1%>  onKeyPress="enterDecimal(event,0)">
              <%
              	if (read_only1.equals("")) {
              %> 
              <a href="javascript:GetBranch('E01ROCU10','<%=gaMant.getE01ROCBNK().trim()%>','E01ROCICM')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="bottom" border="0"  ></a>
			  <%
			  	}
			  %>
             	<eibsinput:text name="gaMant" property="E01ROCICM" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_NAME %>" readonly="true"/>
            </td>
            <td nowrap> 
            </td>
            <td nowrap >
            </td>
          </tr>
   		  <tr id="trclear"> 
            <td nowrap> 
              <div align="right">Descripción :</div>
            </td>
            <td nowrap colspan="3">            	 
              <input type="text" name="E01ROCSP1" size="85" maxlength="70" value="<%=gaMant.getE01ROCSP1().trim()%>" <%=read_only1%>><br>
              <input type="text" name="E01ROCSP2" size="85" maxlength="70" value="<%=gaMant.getE01ROCSP2().trim()%>" <%=read_only1%>><br>
              <input type="text" name="E01ROCSP3" size="85" maxlength="70" value="<%=gaMant.getE01ROCSP3().trim()%>" <%=read_only1%>><br>
              <input type="text" name="E01ROCDES" size="75" maxlength="60" value="<%=gaMant.getE01ROCDES().trim()%>" <%=read_only1%>><br>
              <input type="text" name="E01ROCLOC" size="75" maxlength="60" value="<%=gaMant.getE01ROCLOC().trim()%>" <%=read_only1%>>
            </td>
          </tr>			
 			  <%if (gaMant.getE01ROCRGK().equals("Y")){ %>
          <tr id="trdark">  
            <td nowrap> 
              <div align="right">Enviado a Confecámaras : </div>
            </td>
            <td nowrap >
			  <input type="checkbox" <%=disabled1%> name="E01ROCUC5" value="Y" <%if (!gaMant.getE01ROCUC5().equals("")){out.print(" checked");}; %>/>
            </td>
            <td nowrap >
 			  <%if (gaMant.getE01ROCUC5().equals("D")){ %>
             <div><b> Definitivo </b></div>
			  <%}else{ %>
             <div><b> Preliminar</b></div>
			  <%} %>
            </td>
            <td nowrap >
            </td>
          </tr>
			  <%} %>

          <tr id="trclear">  
            <td nowrap> 
              <div align="right">Garantía Siniestrada : </div>
            </td>
            <td nowrap >
                <input type="hidden" name="E01RODFLG" value="<%=gaMant.getE01RODFLG()%>">
                <input type="radio" name="CE01RODFLG" value="Y" onClick="document.forms[0].E01RODFLG.value='Y'; hideDiv('DivSin',false)"
			  <%if (gaMant.getE01RODFLG().equals("Y"))
				out.print("checked");%> <%=disabled1%> onChange="hideDiv('DivSin',false)" onBlur="hideDiv('DivSin',false)" >
                Si
                <input type="radio" name="CE01RODFLG" value="N" onClick="document.forms[0].E01RODFLG.value='N'; hideDiv('DivSin',true)"
			  <%if (gaMant.getE01RODFLG().equals("N"))
				out.print("checked");%> <%=disabled1%> onChange="hideDiv('DivSin',true)" onBlur="hideDiv('DivSin',true)" >
                No
            </td>
            <td nowrap >
            </td>
            <td nowrap >
            </td>
          </tr>

         </table>
      </td>
    </tr>
  </table>

<div id="DivSin" style="position:relative; display:block;">

<%
	if (!userPO.getPurpose().equals("NEW")) {
%>

<h4>Información del Siniestro</h4>
    <table class="tableinfo">
      <tr > 
        <td >
          <table cellspacing="0" cellpadding="2" width="100%" border="0" >

   		  <tr id="trdark"> 
			<td nowrap> 
              <div align="right">Código de Siniestro :</div>
            </td>
            <td nowrap colspan="3">
              <input type="text" name="E01RODUC1" size="4" maxlength="5" value="<%=gaMant.getE01RODUC1().trim()%>" <%=read_only1%>>
              <%
              	if (read_only1.equals("")) {
              %> 
              <a href="javascript:GetCodeDescCNOFC('E01RODUC1','D01RODUC1','QA')"><img src="<%=request.getContextPath()%>/images/1b.gif" title=". . ." align="bottom" border="0"  ></a>
			  <%
			  	}
			  %>
              <input type="text" name="D01RODUC1" size="45" maxlength="45" value="<%=gaMant.getD01RODUC1().trim()%>" readonly>
            </td>
            <td nowrap> 
              <div align="right">Fecha del Siniestro :</div>
            </td>
            <td nowrap colspan="3">
             <eibsinput:date name="gaMant" fn_year="E01RODPDY" fn_month="E01RODPDM" fn_day="E01RODPDD" readonly="<%=b_read_only1%>"/>
            </td>
          </tr>
   		  <tr id="trclear"> 
			<td nowrap> 
              <div align="right">Estado del Tramite :</div>
            </td>
            <td nowrap colspan="3">
              <input type="text" name="E01RODUC2" size="4" maxlength="5" value="<%=gaMant.getE01RODUC2().trim()%>" <%=read_only1%>>
              <%
              	if (read_only1.equals("")) {
              %> 
              <a href="javascript:GetCodeDescCNOFC('E01RODUC2','D01RODUC2','QB')"><img src="<%=request.getContextPath()%>/images/1b.gif" title=". . ." align="bottom" border="0"  ></a>
			  <%
			  	}
			  %>
              <input type="text" name="D01RODUC2" size="45" maxlength="45" value="<%=gaMant.getD01RODUC2().trim()%>" readonly>
            </td>
            <td nowrap> 
              <div align="right">Fecha de Reclamo a la Aseguradora :</div>
            </td>
            <td nowrap colspan="3">
             <eibsinput:date name="gaMant" fn_year="E01RODNDY" fn_month="E01RODNDM" fn_day="E01RODNDD" readonly="<%=b_read_only1%>"/>
            </td>
          </tr>
          </table>
        </td>
      </tr>
    </table>
<%
	}
%>
</div>


<%-- B. BIENES INMUEBLES --%>

<%
	if ((gaMant.getE01ROCTYP().equals("B")||(gaMant.getE01ROCTYP().equals("T")))
			&& (!userPO.getPurpose().equals("NEW"))) {
%>


<%
	if (gaListBien.getNoResult()) {
%>
<h3>Bienes Asociados a la Garantía</h3>
<TABLE class="tbenter" height="20%">
	<TR>
		<TD ALIGN=CENTER VALIGN=MIDDLE>
		<H4 style="text-align: center">No existe ningún bien asociado a la garantía.
		</h4>
		</TD>
	</TR>
	<tr>
		<%
			if (b_read_only1 == false) {
		%>
		<td class=TDBKG width="20%">
		<div align="center"><a href="javascript:goAction('B',1)" id="btn3"><b>Crear Bien Asociado</b></a></div>
		</td>
		<%
			}
		%>
	</tr>
</TABLE>
<%
	} else {
%>
<h3><%=desc_type_coll%> Asociados a la Garantía</h3>
	<TABLE id="mainTableF" class="tableinfo">
			<TR>
				<TD nowrap valign="top" width="100%">

					<table class="tbenter" width=100% align=center>
					<tr>
					<%
						if (b_read_only1 == false) {
					%>
					<td class=TDBKG width="12%">
					<div align="center"><a href="javascript:goAction('B',1)" id="btnA1"><b>Adicionar </b></a></div>
					</td>
					<%
						}
					%>
					<%
						if (b_read_only1 == false) {
					%>
					<td class=TDBKG width="12%">
					<div align="center"><a href="javascript:goAction('B',2)" id="btnA2"><b>Modificar</b></a></div>
					</td>
					<td class=TDBKG width="12%">
					<div align="center"><a href="javascript:goAction('B',5)" id="btnA5"><b>Copiar Bien</b></a></div>
					</td>
					<%if (b_read_only1 == false && (!gaMant.getE01ROCSTS().equals("x"))){%>
					<td class=TDBKG width="12%">
					<div align="center"><a href="javascript:goValuation()" id="btnA6"><b>Valuación</b></a></div>
					</td>
					<%
						}
					%>
					<td class=TDBKG width="12%">
					<div align="center"><a href="javascript:goAction('B',3)" id="btnA3"><b>Borrar</b></a></div>
					</td>
					<%
						}
					%>
					<td class=TDBKG width="12%">
					<div align="center"><a href="javascript:goAction('B',4)" id="btnA4"><b>Consultar </b></a></div>
					</td>
					</tr>
					</table>

					<TABLE id="headTable1" >
					<TBODY>
					<tr id="trdark">
					<TH align="CENTER" nowrap width="5%">&nbsp;</TH>
					<TH align="CENTER" nowrap width="5%">Sec.</TH>
					<TH align="CENTER" nowrap width="25%">Tipo</TH>
					<TH align="CENTER" nowrap width="25%">Número Escritura</TH>
					<TH align="CENTER" nowrap width="15%">Avalúo</TH>
					<TH align="CENTER" nowrap width="15%"></TH>
					<TH align="CENTER" nowrap width="15%">Póliza</TH>
 					</tr>
					</TBODY>
					</TABLE>

					<div id="dataDiv1" class="scbarcolor">
						<table id="dataTable1" >
			<%
				firstTime = true;
						String gaChk = "";
						gaListBien.initRow();
						i = 0;
						ERA006001Help.initRow();

						while (gaListBien.getNextRow()) {
							if (gaListBien.getFlag().equals("")) {
								gaChk = (firstTime) ? "checked" : "";
								firstTime = false;
								ERA006001Help.getNextRow();
								datapro.eibs.beans.ERA006001Message msgList = (datapro.eibs.beans.ERA006001Message) ERA006001Help
										.getRecord();
			%>
			<TBODY>
			<%
				if (!msgList.getH01FLGWK2().equals("T")) {
			%>		

			<TR>
				<TD ALIGN=LEFT NOWRAP width="5%">
				<input type="radio" name="COLLCOD" value="<%=ERA006001Help.getCurrentRow()%>" onClick="getParamsBien(this.value,'<%=msgList.getE01R01SEQ()%>')" <%=gaChk%>>
				</TD>
				<TD ALIGN=CENTER NOWRAP width="5%">
				<a href="javascript:radioClick('COLLCOD',<%=i%>)">
				<DIV NOWRAP><%=msgList.getE01R01SEQ().trim()%></DIV>
				</a>
				</TD>
				<TD ALIGN=CENTER NOWRAP width="25%">
				<a href="javascript:radioClick('COLLCOD',<%=i%>)">
				<DIV NOWRAP><%=msgList.getE01R01TBN().trim()%>-<%=msgList.getD01R01TBN().trim()%></DIV>
				</a>
				</TD>
				<TD ALIGN=CENTER NOWRAP width="25%">
				<a href="javascript:radioClick('COLLCOD',<%=i%>)">
				<DIV NOWRAP><%=msgList.getE01R01NES().trim()%></DIV>
				</a>
				</TD>
				<TD ALIGN=CENTER NOWRAP width="15%">
				<a href="javascript:radioClick('COLLCOD',<%=i%>)">
				<DIV NOWRAP><%=msgList.getE01R01ACO().trim()%></DIV>
				</a>
				</TD>
				<TD ALIGN=CENTER NOWRAP width="15%">
				<a href="javascript:radioClick('COLLCOD',<%=i%>)">
				<DIV NOWRAP><%=msgList.getD01R01STS().trim()%></DIV>
				</a>
				</TD>
				<TD ALIGN=CENTER NOWRAP width="15%">
				<a href="javascript:radioClick('COLLCOD',<%=i%>)">
				<DIV NOWRAP><%=msgList.getD01R01GTE().trim()%></DIV>
				</a>
				</TD>
 			</TR>
			<%
				} else {
			%>
			<TR>
				<TD ALIGN=LEFT NOWRAP width="5%">
				</TD>

				<TD ALIGN=LEFT NOWRAP width="5%">
				</TD>

				<TD ALIGN=CENTER NOWRAP width="25%"><h5> </h5>
				</TD>
				<TD ALIGN=CENTER NOWRAP width="25%"><h5><DIV NOWRAP><%=msgList.getE01R01NES().trim()%></DIV>
				</h5>
				</TD>
				<TD ALIGN=CENTER NOWRAP width="15%"><h5><DIV NOWRAP><%=msgList.getE01R01ACO().trim()%></DIV></h5>
				</TD>
				<TD ALIGN=LEFT NOWRAP width="15%"><h5> </h5>
				</TD>
 			</TR>
			<%
				}
			%>
			</TBODY>
			<%
				i++;
							}
						}
			%>
			</table>
			</DIV>
			</TD>
			</TR>

	</TABLE>

<%
	}
%>
<%
	}
%> 


<%-- V. PRENDA VEHICULOS --%>

<%
	if (gaMant.getE01ROCTYP().equals("V")
			&& (!userPO.getPurpose().equals("NEW"))) {
%>

<%
	if (gaListBien.getNoResult()) {
%>
<h3>Vehículos Asociados a la Garantía</h3>
<TABLE class="tbenter" height="20%">
	<TR>
		<TD ALIGN=CENTER VALIGN=MIDDLE>
		<H4 style="text-align: center">No existe ninguna prenda de vehículo asociado a la garantía.
		</h4>
		</TD>
	</TR>
	<tr>
		<%
			if (b_read_only1 == false) {
		%>
		<td class=TDBKG width="20%">
		<div align="center"><a href="javascript:goAction('V',1)" id="btn3"><b>Crear Prenda Vehículo</b></a></div>
		</td>
		<%
			}
		%>
	</tr>
</TABLE>
<%
	} else {
%>
<h3>Prenda Vehículos Asociados a la Garantía</h3>
	<TABLE id="mainTableF" class="tableinfo">
			<TR>
				<TD nowrap valign="top" width="100%">

					<table class="tbenter" width=100% align=center>
					<tr>
					<%
						if (b_read_only1 == false) {
					%>
					<td class=TDBKG width="12%">
					<div align="center"><a href="javascript:goAction('V',1)" id="btnA1"><b>Adicionar </b></a></div>
					</td>
					<%
						}
					%>
					<%
						if (b_read_only1 == false) {
					%>
					<td class=TDBKG width="12%">
					<div align="center"><a href="javascript:goAction('V',2)" id="btnA2"><b>Modificar</b></a></div>
					</td>
					<td class=TDBKG width="12%">
					<div align="center"><a href="javascript:goAction('V',5)" id="btnA5"><b>Copiar Bien</b></a></div>
					</td>
					<%if (b_read_only1 == false && (!gaMant.getE01ROCSTS().equals("X"))){%>
					<td class=TDBKG width="12%">
					<div align="center"><a href="javascript:goValuation()" id="btnA6"><b>Valuación</b></a></div>
					</td>
					<%
						}
					%>
					<td class=TDBKG width="12%">
					<div align="center"><a href="javascript:goAction('V',3)" id="btnA3"><b>Borrar</b></a></div>
					</td>
					<%
						}
					%>
					<td class=TDBKG width="12%">
					<div align="center"><a href="javascript:goAction('V',4)" id="btnA4"><b>Consultar </b></a></div>
					</td>
					</tr>
					</table>

					<TABLE id="headTable1" >
					<TBODY>
					<tr id="trdark">
					<TH align="CENTER" nowrap width="5%">&nbsp;</TH>
					<TH align="CENTER" nowrap width="5%">Sec.</TH>
					<TH align="CENTER" nowrap width="25%">Tipo</TH>
					<TH align="CENTER" nowrap width="25%">Referencia</TH>
					<TH align="CENTER" nowrap width="15%">Avalúo</TH>
					<TH align="CENTER" nowrap width="15%">Marca</TH>
					<TH align="CENTER" nowrap width="15%">Póliza</TH>
 					</tr>
					</TBODY>
					</TABLE>

					<div id="dataDiv1" class="scbarcolor">
						<table id="dataTable1" >
			<%
				firstTime = true;
						String gaChk = "";
						gaListBien.initRow();
						i = 0;
						ERA006401Help.initRow();

						while (gaListBien.getNextRow()) {
							if (gaListBien.getFlag().equals("")) {
								gaChk = (firstTime) ? "checked" : "";
								firstTime = false;
								ERA006401Help.getNextRow();
								datapro.eibs.beans.ERA006401Message msgList = (datapro.eibs.beans.ERA006401Message) ERA006401Help
										.getRecord();
			%>
			<TBODY>
			<%
				if (!msgList.getH01FLGWK2().equals("T")) {
			%>		

			<TR>
				<TD ALIGN=LEFT NOWRAP width="5%">
				<input type="radio" name="COLLCOD" value="<%=ERA006401Help.getCurrentRow()%>" onClick="getParamsBien(this.value,'<%=msgList.getE01R03SEQ()%>')" <%=gaChk%>>
				</TD>
				<TD ALIGN=CENTER NOWRAP width="5%">
				<a href="javascript:radioClick('COLLCOD',<%=i%>)">
				<DIV NOWRAP><%=msgList.getE01R03SEQ().trim()%></DIV>
				</a>
				</TD>
				<TD ALIGN=CENTER NOWRAP width="25%">
				<a href="javascript:radioClick('COLLCOD',<%=i%>)">
				<DIV NOWRAP><%=msgList.getE01R03CLV().trim()%>-<%=msgList.getE01R03MRV().trim()%></DIV>
				</a>
				</TD>
				<TD ALIGN=CENTER NOWRAP width="25%">
				<a href="javascript:radioClick('COLLCOD',<%=i%>)">
				<DIV NOWRAP><%=msgList.getE01R03PLC().trim()%></DIV>
				</a>
				</TD>
				<TD ALIGN=CENTER NOWRAP width="15%">
				<a href="javascript:radioClick('COLLCOD',<%=i%>)">
				<DIV NOWRAP><%=msgList.getE01R03MGA().trim()%></DIV>
				</a>
				</TD>
				<TD ALIGN=CENTER NOWRAP width="15%">
				<a href="javascript:radioClick('COLLCOD',<%=i%>)">
				<DIV NOWRAP><%=msgList.getE01R03MRV().trim()%></DIV>
				</a>
				</TD>
				<TD ALIGN=CENTER NOWRAP width="15%">
				<a href="javascript:radioClick('COLLCOD',<%=i%>)">
				<DIV NOWRAP><%=msgList.getD01R03US3().trim()%></DIV>
				</a>
				</TD>
 			</TR>
			<%
				} else {
			%>
			<TR>
				<TD ALIGN=LEFT NOWRAP width="5%">
				</TD>

				<TD ALIGN=LEFT NOWRAP width="5%">
				</TD>

				<TD ALIGN=CENTER NOWRAP width="25%"><h5> </h5>
				</TD>
				<TD ALIGN=CENTER NOWRAP width="25%"><h5><DIV NOWRAP></DIV>
				</h5>
				</TD>
				<TD ALIGN=CENTER NOWRAP width="15%"><h5><DIV NOWRAP><%=msgList.getE01R03MGA().trim()%></DIV></h5>
				</TD>
				<TD ALIGN=LEFT NOWRAP width="15%"><h5> </h5>
				</TD>
 			</TR>
			<%
				}
			%>
			</TBODY>
			<%
				i++;
							}
						}
			%>
			</table>
			</DIV>
			</TD>
			</TR>

	</TABLE>

<%
	}
%>

<%
	}
%> 

<%-- F. PRENDA INDUSTRIAL D. OTRAS PRENDAS Y E PRENDAS ESTABLECIMIENTO DE COMERCIO--%>

<%
	if ((gaMant.getE01ROCTYP().equals("F") && (!userPO.getPurpose()
			.equals("NEW")))
			|| (gaMant.getE01ROCTYP().equals("D") && (!userPO
					.getPurpose().equals("NEW")))
			|| (gaMant.getE01ROCTYP().equals("E") && (!userPO
					.getPurpose().equals("NEW")))) {
%>

<%
	if (gaListBien.getNoResult()) {
%>
<h3><%=desc_type_coll%> Asociada a la Garantía</h3>
<TABLE class="tbenter" height="20%">
	<TR>
		<TD ALIGN=CENTER VALIGN=MIDDLE>
		<H4 style="text-align: center">No existe ninguna <%=desc_type_coll%>  asociada a la garantía.
		</h4>
		</TD>
	</TR>
	<tr>
		<%
			if (b_read_only1 == false) {
		%>
		<td class=TDBKG width="20%">
		<div align="center"><a href="javascript:goAction('F',1)" id="btn3"><b>Crear <%=desc_type_coll%> </b></a></div>
		</td>
		<%
			}
		%>
	</tr>
</TABLE>
<%
	} else {
%>
<h3><%=desc_type_coll%>  Asociadas a la Garantía</h3>
	<TABLE id="mainTableF" class="tableinfo">
			<TR>
				<TD nowrap valign="top" width="100%">

					<table class="tbenter" width=100% align=center>
					<tr>
					<%
						if (b_read_only1 == false) {
					%>
					<td class=TDBKG width="12%">
					<div align="center"><a href="javascript:goAction('F',1)" id="btnA1"><b>Adicionar </b></a></div>
					</td>
					<%
						}
					%>
					<%
						if (b_read_only1 == false) {
					%>
					<td class=TDBKG width="12%">
					<div align="center"><a href="javascript:goAction('F',2)" id="btnA2"><b>Modificar</b></a></div>
					</td>
					<td class=TDBKG width="12%">
					<div align="center"><a href="javascript:goAction('F',3)" id="btnA3"><b>Borrar</b></a></div>
					</td>
					<%
						}
					%>
					<%	if (b_read_only1 == false && (!gaMant.getE01ROCSTS().equals("X"))) {
					%>
					<td class=TDBKG width="12%">
					<div align="center"><a href="javascript:goValuation()" id="btnA6"><b>Valuación</b></a></div>
					</td>
					<%
						}
					%>
					<td class=TDBKG width="12%">
					<div align="center"><a href="javascript:goAction('F',4)" id="btnA4"><b>Consultar </b></a></div>
					</td>
					</tr>
					</table>

					<TABLE id="headTable1" >
					<TBODY>
					<tr id="trdark">
					<TH align="CENTER" nowrap width="5%">&nbsp;</TH>
					<TH align="CENTER" nowrap width="5%">Sec.</TH>
					<TH align="CENTER" nowrap width="25%">Tipo</TH>
					<TH align="CENTER" nowrap width="25%">Referencia</TH>
					<TH align="CENTER" nowrap width="15%">Avalúo</TH>
					<%
					if (!gaMant.getE01ROCTYP().equals("E")) {
					%>		
					<TH align="CENTER" nowrap width="15%">Estado</TH>
    		        <%
	        	     }
		            %>
					<%
					if (gaMant.getE01ROCTYP().equals("E")) {
					%>		
					<TH align="CENTER" nowrap width="15%">Avaluador</TH>
    		        <%
	        	     }
		            %>
					<TH align="CENTER" nowrap width="15%">Póliza</TH>
 					</tr>
					</TBODY>
					</TABLE>

					<div id="dataDiv1" class="scbarcolor">
						<table id="dataTable1" >
			<%
				firstTime = true;
						String gaChk = "";
						gaListBien.initRow();
						i = 0;
						ERA006501Help.initRow();

						while (gaListBien.getNextRow()) {
							if (gaListBien.getFlag().equals("")) {
								gaChk = (firstTime) ? "checked" : "";
								firstTime = false;
								ERA006501Help.getNextRow();
								datapro.eibs.beans.ERA006501Message msgList = (datapro.eibs.beans.ERA006501Message) ERA006501Help
										.getRecord();
			%>
			<TBODY>
			<%
				if (!msgList.getH01FLGWK2().equals("T")) {
			%>		

			<TR>
				<TD ALIGN=LEFT NOWRAP width="5%">
				<input type="radio" name="COLLCOD" value="<%=ERA006501Help.getCurrentRow()%>" onClick="getParamsBien(this.value,'<%=msgList.getE01R04SEQ()%>')" <%=gaChk%>>
				</TD>
				<TD ALIGN=CENTER NOWRAP width="5%">
				<a href="javascript:radioClick('COLLCOD',<%=i%>)">
				<DIV NOWRAP><%=msgList.getE01R04SEQ().trim()%></DIV>
				</a>
				</TD>
				<TD ALIGN=CENTER NOWRAP width="25%">
				<a href="javascript:radioClick('COLLCOD',<%=i%>)">
				<DIV NOWRAP><%=msgList.getE01R04DSP()%></DIV>
				</a>
				</TD>
				<TD ALIGN=CENTER NOWRAP width="25%">
				<a href="javascript:radioClick('COLLCOD',<%=i%>)">
				<DIV NOWRAP><%=msgList.getE01R04SER().trim()%></DIV>
				</a>
				</TD>
				<TD ALIGN=CENTER NOWRAP width="15%">
				<a href="javascript:radioClick('COLLCOD',<%=i%>)">
				<DIV NOWRAP><%=msgList.getE01R04VCO().trim()%></DIV>
				</a>
				</TD>
				<TD ALIGN=CENTER NOWRAP width="15%">
				<a href="javascript:radioClick('COLLCOD',<%=i%>)">
				<DIV NOWRAP>
			<%
				if (!gaMant.getE01ROCTYP().equals("E")) {
			%>		
                <%
                	if (msgList.getE01R04EST().equals("N"))
                							out.print("NUEVO");
                						else if (msgList.getE01R04EST().equals("U"))
                							out.print("USADO");
                						else
                							out.print("N/A");
                %>
                <%
                }
                %>
			<%
				if (gaMant.getE01ROCTYP().equals("E")) {
			%>		
			<%=msgList.getD01R04TRL().trim()%>
            <%
             }
            %>
				</DIV>
				</a>
				</TD>
				<TD ALIGN=CENTER NOWRAP width="15%">
				<a href="javascript:radioClick('COLLCOD',<%=i%>)">
				<DIV NOWRAP><%=msgList.getD01R04US3().trim()%></DIV>
				</a>
				</TD>
 			</TR>
			<%
				} else {
			%>
			<TR>
				<TD ALIGN=LEFT NOWRAP width="5%">
				</TD>

				<TD ALIGN=LEFT NOWRAP width="5%">
				</TD>

				<TD ALIGN=CENTER NOWRAP width="25%"><h5> </h5>
				</TD>
				<TD ALIGN=CENTER NOWRAP width="25%"><h5><DIV NOWRAP><%=msgList.getE01R04DSP()%></DIV>
				</h5>
				</TD>
				<TD ALIGN=CENTER NOWRAP width="15%"><h5><DIV NOWRAP><%=msgList.getE01R04VCO().trim()%></DIV></h5>
				</TD>
				<TD ALIGN=LEFT NOWRAP width="15%"><h5> </h5>
				</TD>
 			</TR>
			<%
				}
			%>
			</TBODY>
			<%
				i++;
							}
						}
			%>
			</table>
			</DIV>
			</TD>
			</TR>

	</TABLE>

<%
	}
%>

<%
	}
%> 

<%-- I/J/K/L/M. AVALES--%>

<%
	if ((list_1 && (!userPO.getPurpose().equals("NEW")))){
%>

<%
	if (gaListBien.getNoResult()) {
%>
<h3><%=desc_type_coll%> Asociada a la Garantía</h3>
<TABLE class="tbenter" height="20%">
	<TR>
		<TD ALIGN=CENTER VALIGN=MIDDLE>
		<H4 style="text-align: center">No existe ningún <%=desc_type_coll%>  asociada a la garantía.
		</h4>
		</TD>
	</TR>
	<tr>
		<%
			if (b_read_only1 == false) {
		%>
		<td class=TDBKG width="20%">
		<div align="center"><a href="javascript:goAction('I',1)" id="btn3"><b>Crear <%=desc_type_coll%> </b></a></div>
		</td>
		<%
			}
		%>
	</tr>
</TABLE>
<%
	} else {
%>
<h3><%=desc_type_coll%>  Asociadas a la Garantía</h3>
	<TABLE id="mainTableF" class="tableinfo">
			<TR>
				<TD nowrap valign="top" width="100%">

					<table class="tbenter" width=100% align=center>
					<tr>
					<%
						if (b_read_only1 == false) {
					%>
					<td class=TDBKG width="12%">
					<div align="center"><a href="javascript:goAction('I',1)" id="btnA1"><b>Adicionar </b></a></div>
					</td>
					<%
						}
					%>
					<%
						if (b_read_only1 == false) {
					%>
					<td class=TDBKG width="12%">
					<div align="center"><a href="javascript:goAction('I',2)" id="btnA2"><b>Modificar</b></a></div>
					</td>
					<td class=TDBKG width="12%">
					<div align="center"><a href="javascript:goAction('I',3)" id="btnA3"><b>Borrar</b></a></div>
					</td>
					<%
						}
					%>
					<td class=TDBKG width="12%">
					<div align="center"><a href="javascript:goAction('I',4)" id="btnA4"><b>Consultar </b></a></div>
					</td>
					</tr>
					</table>

					<TABLE id="headTable1" >
					<TBODY>
					<tr id="trdark">
					<%
						if (list_2){
					%>
					<TH align="CENTER" nowrap width="5%">&nbsp;</TH>
					<TH align="CENTER" nowrap width="5%">Sec.</TH>
			<%
				if (!gaMant.getE01ROCTYP().equals("3")) {
			%>		
					<TH align="CENTER" nowrap width="25%">Bien</TH>
					<%
						}
					%>
					<TH align="CENTER" nowrap width="25%">Emisor</TH>
					<TH align="CENTER" nowrap width="15%">Monto Límite</TH>
					<TH align="CENTER" nowrap width="15%"></TH>
					<%
						}
					%>
					<%
						if ((gaMant.getE01ROCTYP().equals("6") && (!userPO
												.getPurpose().equals("NEW")))
										|| (gaMant.getE01ROCTYP().equals("G") && (!userPO
												.getPurpose().equals("NEW")))
										|| (gaMant.getE01ROCTYP().equals("O") && (!userPO
												.getPurpose().equals("NEW")))) {
					%>
					<TH align="CENTER" nowrap width="5%">&nbsp;</TH>
					<TH align="CENTER" nowrap width="5%">Sec.</TH>
					<TH align="CENTER" nowrap width="25%">Cliente</TH>
					<TH align="CENTER" nowrap width="25%">Emisor</TH>
					<TH align="CENTER" nowrap width="15%">Monto Límite</TH>
					<TH align="CENTER" nowrap width="15%"></TH>
					<%
						}
					%>
					<%
						if ((gaMant.getE01ROCTYP().equals("U") && (!userPO
												.getPurpose().equals("NEW")))) {
					%>
					<TH align="CENTER" nowrap width="5%">&nbsp;</TH>
					<TH align="CENTER" nowrap width="5%">Sec.</TH>
					<TH align="CENTER" nowrap width="25%">Emisor</TH>
					<TH align="CENTER" nowrap width="25%">Documento</TH>
					<TH align="CENTER" nowrap width="15%">Monto Límite</TH>
					<TH align="CENTER" nowrap width="15%"></TH>
					<%
						}
					%>
					<%
						if ((gaMant.getE01ROCTYP().equals("I") && (!userPO
										.getPurpose().equals("NEW")))
										|| (gaMant.getE01ROCTYP().equals("J") && (!userPO
										.getPurpose().equals("NEW")))
										|| (gaMant.getE01ROCTYP().equals("N") && (!userPO
												.getPurpose().equals("NEW")))
										|| (gaMant.getE01ROCTYP().equals("K") && (!userPO
												.getPurpose().equals("NEW")))) {
					%>
					<TH align="CENTER" nowrap width="5%">&nbsp;</TH>
					<TH align="CENTER" nowrap width="5%">Sec.</TH>
					<TH align="CENTER" nowrap width="25%">Ubicación Datos</TH>
					<TH align="CENTER" nowrap width="25%">Emisor</TH>
					<TH align="CENTER" nowrap width="15%">Monto Límite</TH>
					<TH align="CENTER" nowrap width="15%"></TH>
					<%
						}
					%>
					<%
						if ((gaMant.getE01ROCTYP().equals("L") && (!userPO
										.getPurpose().equals("NEW")))) {
					%>
					<TH align="CENTER" nowrap width="5%">&nbsp;</TH>
					<TH align="CENTER" nowrap width="5%">Sec.</TH>
					<TH align="CENTER" nowrap width="25%">Número Resolución</TH>
					<TH align="CENTER" nowrap width="25%">Número de Carta</TH>
					<TH align="CENTER" nowrap width="15%">Monto a Garantizar</TH>
					<TH align="CENTER" nowrap width="15%">Valor Carta</TH>
					<%
						}
					%>
					<%
						if ((gaMant.getE01ROCTYP().equals("M") && (!userPO
										.getPurpose().equals("NEW")))) {
					%>
					<TH align="CENTER" nowrap width="5%">&nbsp;</TH>
					<TH align="CENTER" nowrap width="5%">Sec.</TH>
					<TH align="CENTER" nowrap width="25%">Número de Pagaré</TH>
					<TH align="CENTER" nowrap width="25%">Otorgado Por</TH>
					<TH align="CENTER" nowrap width="15%">Valor</TH>
					<TH align="CENTER" nowrap width="15%"></TH>
					<%
						}
					%>
					<%
						if ((gaMant.getE01ROCTYP().equals("2") && (!userPO
										.getPurpose().equals("NEW")))) {
					%>
					<TH align="CENTER" nowrap width="5%">&nbsp;</TH>
					<TH align="CENTER" nowrap width="5%">Sec.</TH>
					<TH align="CENTER" nowrap width="25%">Número de Factura</TH>
					<TH align="CENTER" nowrap width="25%">Comprador</TH>
					<TH align="CENTER" nowrap width="15%">Valor</TH>
					<TH align="CENTER" nowrap width="15%"></TH>
					<%
						}
					%>
 					</tr>
					</TBODY>
					</TABLE>

					<div id="dataDiv1" class="scbarcolor">
						<table id="dataTable1" >
			<%
				firstTime = true;
						String gaChk = "";
						gaListBien.initRow();
						i = 0;
						ERA006601Help.initRow();

						while (gaListBien.getNextRow()) {
							if (gaListBien.getFlag().equals("")) {
								gaChk = (firstTime) ? "checked" : "";
								firstTime = false;
								ERA006601Help.getNextRow();
								datapro.eibs.beans.ERA006601Message msgList = (datapro.eibs.beans.ERA006601Message) ERA006601Help
										.getRecord();
			%>
			<TBODY>
			<%
				if (!msgList.getH01FLGWK2().equals("T")) {
			%>		

			<TR>
				<TD ALIGN=LEFT NOWRAP width="5%">
				<input type="radio" name="COLLCOD" value="<%=ERA006601Help.getCurrentRow()%>" onClick="getParamsBien(this.value,'<%=msgList.getE01R05SEQ()%>')" <%=gaChk%>>
				</TD>
				<TD ALIGN=CENTER NOWRAP width="5%">
				<a href="javascript:radioClick('COLLCOD',<%=i%>)">
				<DIV NOWRAP><%=msgList.getE01R05SEQ().trim()%></DIV>
				</a>
				</TD>
				<%
					if ((list_3 && (!userPO.getPurpose().equals("NEW")))) {
				%>
				<TD ALIGN=CENTER NOWRAP width="25%">
				<a href="javascript:radioClick('COLLCOD',<%=i%>)">
			<%
				if (!gaMant.getE01ROCTYP().equals("3")) {
			%>		
				<DIV NOWRAP><%=msgList.getE01R05TIC().trim()%>-<%=msgList.getE01R05IDC().trim()%>-<%=msgList.getE01R05NMC().trim()%></DIV>
				</a>
				</TD>
				<TD ALIGN=CENTER NOWRAP width="25%">
				<a href="javascript:radioClick('COLLCOD',<%=i%>)">
				<DIV NOWRAP><%=msgList.getE01R05TIE().trim()%>-<%=msgList.getE01R05IDE().trim()%>-<%=msgList.getE01R05NME().trim()%></DIV>
			<%
				}else{
			%>		
				<DIV NOWRAP><%=msgList.getE01R05OTP().trim()%></DIV>
			<%
				}
			%>		

				</a>
				</TD>
				<TD ALIGN=CENTER NOWRAP width="15%">
				<a href="javascript:radioClick('COLLCOD',<%=i%>)">
				<DIV NOWRAP><%=msgList.getE01R05MGA().trim()%></DIV>
				</a>
				</TD>
				<TD ALIGN=CENTER NOWRAP width="15%">
				<a href="javascript:radioClick('COLLCOD',<%=i%>)">
				<DIV NOWRAP>
				</DIV>
				</a>
				</TD>
				<%
					}
				%>
				<%
					if ((gaMant.getE01ROCTYP().equals("L") && (!userPO
												.getPurpose().equals("NEW")))) {
				%>
				<TD ALIGN=CENTER NOWRAP width="25%">
				<a href="javascript:radioClick('COLLCOD',<%=i%>)">
				<DIV NOWRAP><%=msgList.getE01R05NRS().trim()%></DIV>
				</a>
				</TD>
				<TD ALIGN=CENTER NOWRAP width="25%">
				<a href="javascript:radioClick('COLLCOD',<%=i%>)">
				<DIV NOWRAP><%=msgList.getE01R05NCA().trim()%></DIV>
				</a>
				</TD>
				<TD ALIGN=CENTER NOWRAP width="15%">
				<a href="javascript:radioClick('COLLCOD',<%=i%>)">
				<DIV NOWRAP><%=msgList.getE01R05MGA().trim()%></DIV>
				</a>
				</TD>
				<TD ALIGN=CENTER NOWRAP width="15%">
				<a href="javascript:radioClick('COLLCOD',<%=i%>)">
				<DIV NOWRAP><%=msgList.getE01R05MCA().trim()%></DIV>
				</a>
				</TD>
				<%
					}
				%>
				<%
					if ((gaMant.getE01ROCTYP().equals("M") && (!userPO
												.getPurpose().equals("NEW")))) {
				%>
				<TD ALIGN=CENTER NOWRAP width="25%">
				<a href="javascript:radioClick('COLLCOD',<%=i%>)">
				<DIV NOWRAP><%=msgList.getE01R05NRS().trim()%></DIV>
				</a>
				</TD>
				<TD ALIGN=CENTER NOWRAP width="25%">
				<a href="javascript:radioClick('COLLCOD',<%=i%>)">
				<DIV NOWRAP><%=msgList.getE01R05OTP().trim()%></DIV>
				</a>
				</TD>
				<TD ALIGN=CENTER NOWRAP width="15%">
				<a href="javascript:radioClick('COLLCOD',<%=i%>)">
				<DIV NOWRAP><%=msgList.getE01R05MGA().trim()%></DIV>
				</a>
				</TD>
				<TD ALIGN=CENTER NOWRAP width="15%">
				<a href="javascript:radioClick('COLLCOD',<%=i%>)">
				<DIV NOWRAP></DIV>
				</a>
				</TD>
				<%
					}
				%>
				<%
					if ((gaMant.getE01ROCTYP().equals("Z") && (!userPO
												.getPurpose().equals("NEW")))) {
				%>
				<TD ALIGN=CENTER NOWRAP width="25%">
				<a href="javascript:radioClick('COLLCOD',<%=i%>)">
				<DIV NOWRAP><%=msgList.getE01R05TIE().trim()%>-<%=msgList.getD01R05TIE().trim()%></DIV>
				</a>
				</TD>
				<TD ALIGN=CENTER NOWRAP width="25%">
				<a href="javascript:radioClick('COLLCOD',<%=i%>)">
				<DIV NOWRAP><%=msgList.getE01R05TCO().trim()%>-<%=msgList.getD01R05TCO().trim()%></DIV>
				</a>
				</TD>
				<TD ALIGN=CENTER NOWRAP width="15%">
				<a href="javascript:radioClick('COLLCOD',<%=i%>)">
				<DIV NOWRAP><%=msgList.getE01R05MGA().trim()%></DIV>
				</a>
				</TD>
				<TD ALIGN=CENTER NOWRAP width="15%">
				<a href="javascript:radioClick('COLLCOD',<%=i%>)">
				<DIV NOWRAP></DIV>
				</a>
				</TD>
				<%
					}
				%>
				<%
					if ((gaMant.getE01ROCTYP().equals("2") && (!userPO
												.getPurpose().equals("NEW")))) {
				%>
				<TD ALIGN=CENTER NOWRAP width="25%">
				<a href="javascript:radioClick('COLLCOD',<%=i%>)">
				<DIV NOWRAP><%=msgList.getE01R05NRS().trim()%>-<%=msgList.getE01R05OTP().trim()%></DIV>
				</a>
				</TD>
				<TD ALIGN=CENTER NOWRAP width="25%">
				<a href="javascript:radioClick('COLLCOD',<%=i%>)">
				<DIV NOWRAP><%=msgList.getE01R05UDB().trim()%></DIV>
				</a>
				</TD>
				<TD ALIGN=CENTER NOWRAP width="15%">
				<a href="javascript:radioClick('COLLCOD',<%=i%>)">
				<DIV NOWRAP><%=msgList.getE01R05MGA().trim()%></DIV>
				</a>
				</TD>
				<TD ALIGN=CENTER NOWRAP width="15%">
				<a href="javascript:radioClick('COLLCOD',<%=i%>)">
				<DIV NOWRAP></DIV>
				</a>
				</TD>
				<%
					}
				%>
				<%
					if ((gaMant.getE01ROCTYP().equals("0") && (!userPO
												.getPurpose().equals("NEW")))) {
				%>
				<TD ALIGN=CENTER NOWRAP width="25%">
				<a href="javascript:radioClick('COLLCOD',<%=i%>)">
				<DIV NOWRAP><%=msgList.getE01R05UDB().trim()%></DIV>
				</a>
				</TD>
				<TD ALIGN=CENTER NOWRAP width="25%">
				<a href="javascript:radioClick('COLLCOD',<%=i%>)">
				<DIV NOWRAP><%=msgList.getE01R05NRS().trim()%>-<%=msgList.getE01R05OTP().trim()%></DIV>
				</a>
				</TD>
				<TD ALIGN=CENTER NOWRAP width="15%">
				<a href="javascript:radioClick('COLLCOD',<%=i%>)">
				<DIV NOWRAP><%=msgList.getE01R05MGA().trim()%></DIV>
				</a>
				</TD>
				<TD ALIGN=CENTER NOWRAP width="15%">
				<a href="javascript:radioClick('COLLCOD',<%=i%>)">
				<DIV NOWRAP></DIV>
				</a>
				</TD>
				<%
					}
				%>
				<%
					if ((gaMant.getE01ROCTYP().equals("S") && (!userPO
												.getPurpose().equals("NEW")))
										|| (gaMant.getE01ROCTYP().equals("Q") && (!userPO
												.getPurpose().equals("NEW")))
										|| (gaMant.getE01ROCTYP().equals("H") && (!userPO
												.getPurpose().equals("NEW")))
										|| (gaMant.getE01ROCTYP().equals("R") && (!userPO
												.getPurpose().equals("NEW")))) {
				%>
				<TD ALIGN=CENTER NOWRAP width="25%">
				<a href="javascript:radioClick('COLLCOD',<%=i%>)">
				<DIV NOWRAP><%=msgList.getE01R05COM().trim()%></DIV>
				</a>
				</TD>
				<TD ALIGN=CENTER NOWRAP width="25%">
				<a href="javascript:radioClick('COLLCOD',<%=i%>)">
				<DIV NOWRAP><%=msgList.getE01R05COA().trim()%></DIV>
				</a>
				</TD>
				<TD ALIGN=CENTER NOWRAP width="15%">
				<a href="javascript:radioClick('COLLCOD',<%=i%>)">
				<DIV NOWRAP><%=msgList.getE01R05MGA().trim()%></DIV>
				</a>
				</TD>
				<TD ALIGN=CENTER NOWRAP width="15%">
				<a href="javascript:radioClick('COLLCOD',<%=i%>)">
				<DIV NOWRAP></DIV>
				</a>
				</TD>
				<%
					}
				%>
 			</TR>
			<%
				} else {
			%>
			<TR>
				<TD ALIGN=LEFT NOWRAP width="5%">
				</TD>

				<TD ALIGN=LEFT NOWRAP width="5%">
				</TD>

				<TD ALIGN=CENTER NOWRAP width="25%"><h5> </h5>
				</TD>
				<TD ALIGN=CENTER NOWRAP width="25%"><h5><DIV NOWRAP></DIV>
				</h5>
				</TD>
				<TD ALIGN=CENTER NOWRAP width="15%"><h5><DIV NOWRAP><%=msgList.getE01R05MGA().trim()%></DIV></h5>
				</TD>
				<TD ALIGN=LEFT NOWRAP width="15%"><h5> </h5>
				</TD>
 			</TR>
			<%
				}
			%>
			</TBODY>
			<%
				i++;
							}
						}
			%>
			</table>
			</DIV>
			</TD>
			</TR>

	</TABLE>

<%
	}
%>

<%
	}
%> 

<%-- C DEPOSITOS EN EFECTIVO Y CDT'S --%>
<%
	if ((list_4 && (!userPO.getPurpose().equals("NEW")))){
%>


<%
	if (gaListBien.getNoResult()) {
%>
<h3><%=desc_type_coll%> Asociados a la Garantía</h3>
<TABLE class="tbenter" height="20%">
	<TR>
		<TD ALIGN=CENTER VALIGN=MIDDLE>
		<H4 style="text-align: center">No existe ningún bien <%=desc_type_coll%> asociado a la garantía.
		</h4>
		</TD>
	</TR>
	<tr>
		<%
			if (b_read_only1 == false) {
		%>
		<td class=TDBKG width="20%">
		<div align="center"><a href="javascript:goAction('C',1)" id="btn3"><b>Crear Bien Asociado</b></a></div>
		</td>
		<%
			}
		%>
	</tr>
</TABLE>
<%
	} else {
%>
<h3><%=desc_type_coll%> Asociados a la Garantía</h3>
	<TABLE id="mainTableF" class="tableinfo">
			<TR>
				<TD nowrap valign="top" width="100%">

					<table class="tbenter" width=100% align=center>
					<tr>
					<%
						if (b_read_only1 == false) {
					%>
					<td class=TDBKG width="12%">
					<div align="center"><a href="javascript:goAction('C',1)" id="btnA1"><b>Adicionar </b></a></div>
					</td>
					<%
						}
					%>
					<%
						if (b_read_only1 == false) {
					%>
					<td class=TDBKG width="12%">
					<div align="center"><a href="javascript:goAction('C',2)" id="btnA2"><b>Modificar</b></a></div>
					</td>
					<td class=TDBKG width="12%">
					<div align="center"><a href="javascript:goAction('C',3)" id="btnA3"><b>Borrar</b></a></div>
					</td>
					<%
						}
					%>
					<td class=TDBKG width="12%">
					<div align="center"><a href="javascript:goAction('C',4)" id="btnA4"><b>Consultar </b></a></div>
					</td>
					</tr>
					</table>

					<TABLE id="headTable1" >
					<TBODY>
					<tr id="trdark">
					<TH align="CENTER" nowrap width="5%">&nbsp;</TH>
					<TH align="CENTER" nowrap width="5%">Sec.</TH>
					<TH align="CENTER" nowrap width="25%">Referencia</TH>
					<%
					if (gaMant.getE01ROCTYP().equals("C")) {
					%>		
					<TH align="CENTER" nowrap width="25%">Suscrito por</TH>
					<%
					}else{
					%>
					<TH align="CENTER" nowrap width="25%">Tipo</TH>
					<%
					}
					%>
					<TH align="CENTER" nowrap width="15%">Valor</TH>
					<TH align="CENTER" nowrap width="15%"></TH>
 					</tr>
					</TBODY>
					</TABLE>

					<div id="dataDiv1" class="scbarcolor">
						<table id="dataTable1" >
			<%
				firstTime = true;
						String gaChk = "";
						gaListBien.initRow();
						i = 0;
						ERA006701Help.initRow();

						while (gaListBien.getNextRow()) {
							if (gaListBien.getFlag().equals("")) {
								gaChk = (firstTime) ? "checked" : "";
								firstTime = false;
								ERA006701Help.getNextRow();
								datapro.eibs.beans.ERA006701Message msgList = (datapro.eibs.beans.ERA006701Message) ERA006701Help
										.getRecord();
			%>
			<TBODY>
			<%
				if (!msgList.getH01FLGWK2().equals("T")) {
			%>		

			<TR>
				<TD ALIGN=LEFT NOWRAP width="5%">
				<input type="radio" name="COLLCOD" value="<%=ERA006701Help.getCurrentRow()%>" onClick="getParamsBien(this.value,'<%=msgList.getE01R06SEQ()%>')" <%=gaChk%>>
				</TD>
				<TD ALIGN=CENTER NOWRAP width="5%">
				<a href="javascript:radioClick('COLLCOD',<%=i%>)">
				<DIV NOWRAP><%=msgList.getE01R06SEQ().trim()%></DIV>
				</a>
				</TD>
				<TD ALIGN=CENTER NOWRAP width="25%">
				<a href="javascript:radioClick('COLLCOD',<%=i%>)">
				<DIV NOWRAP><%=msgList.getE01R06ACC().trim()%></DIV>
				</a>
				</TD>
				<%
				if (gaMant.getE01ROCTYP().equals("C")) {
				%>		
				<TD ALIGN=CENTER NOWRAP width="25%">
				<a href="javascript:radioClick('COLLCOD',<%=i%>)">
				<DIV NOWRAP><%=msgList.getE01R06SUS().trim()%></DIV>
				</a>
				</TD>
				<%
				}else{
				%>
				<TD ALIGN=CENTER NOWRAP width="25%">
				<a href="javascript:radioClick('COLLCOD',<%=i%>)">
				<DIV NOWRAP><%=msgList.getD01R06ACC().trim()%></DIV>
				</a>
				</TD>
				<%
				}
				%>
				<TD ALIGN=CENTER NOWRAP width="15%">
				<a href="javascript:radioClick('COLLCOD',<%=i%>)">
				<DIV NOWRAP><%=msgList.getE01R06MGA().trim()%></DIV>
				</a>
				</TD>
				<TD ALIGN=CENTER NOWRAP width="15%">
				<a href="javascript:radioClick('COLLCOD',<%=i%>)">
				<DIV NOWRAP></DIV>
				</a>
				</TD>
 			</TR>
			<%
				} else {
			%>
			<TR>
				<TD ALIGN=LEFT NOWRAP width="5%">
				</TD>

				<TD ALIGN=LEFT NOWRAP width="5%">
				</TD>

				<TD ALIGN=CENTER NOWRAP width="25%"><h5> </h5>
				</TD>
				<TD ALIGN=CENTER NOWRAP width="25%"><h5><DIV NOWRAP></DIV>
				</h5>
				</TD>
				<TD ALIGN=CENTER NOWRAP width="15%"><h5><DIV NOWRAP><%=msgList.getE01R06MGA().trim()%></DIV></h5>
				</TD>
				<TD ALIGN=LEFT NOWRAP width="15%"><h5> </h5>
				</TD>
 			</TR>
			<%
				}
			%>
			</TBODY>
			<%
				i++;
							}
						}
			%>
			</table>
			</DIV>
			</TD>
			</TR>

	</TABLE>

<%
	}
%>
<%
	}
%> 
<%-- 1. CESION DE DERECHOS ECONOMICOS --%>

<%
	if (gaMant.getE01ROCTYP().equals("1") && (!userPO.getPurpose().equals("NEW"))) {
%>

<%
	if (gaListBien.getNoResult()) {
%>
<h3>Cesión de Derechos Económicos Asociados a la Garantía</h3>
<TABLE class="tbenter" height="20%">
	<TR>
		<TD ALIGN=CENTER VALIGN=MIDDLE>
		<H4 style="text-align: center">No existe ninguna Cesión de Derechos Económicos asociados a la garantía.
		</h4>
		</TD>
	</TR>
	<tr>
		<%
			if (b_read_only1 == false) {
		%>
		<td class=TDBKG width="20%">
		<div align="center"><a href="javascript:goAction('1',1)" id="btn3"><b>Crear Cesión de Derechos</b></a></div>
		</td>
		<%
			}
		%>
	</tr>
</TABLE>
<%
	} else {
%>
<h3>Cesión de Derechos Económicos Asociados a la Garantía</h3>
	<TABLE id="mainTableF" class="tableinfo">
			<TR>
				<TD nowrap valign="top" width="100%">

					<table class="tbenter" width=100% align=center>
					<tr>
					<%
						if (b_read_only1 == false) {
					%>
					<td class=TDBKG width="12%">
					<div align="center"><a href="javascript:goAction('1',1)" id="btnA1"><b>Adicionar </b></a></div>
					</td>
					<%
						}
					%>
					<%
						if (b_read_only1 == false) {
					%>
					<td class=TDBKG width="12%">
					<div align="center"><a href="javascript:goAction('1',2)" id="btnA2"><b>Modificar</b></a></div>
					</td>
					<td class=TDBKG width="12%">
					<div align="center"><a href="javascript:goAction('1',3)" id="btnA3"><b>Borrar</b></a></div>
					</td>
					<%
						}
					%>
					<td class=TDBKG width="12%">
					<div align="center"><a href="javascript:goAction('1',4)" id="btnA4"><b>Consultar </b></a></div>
					</td>
					</tr>
					</table>

					<TABLE id="headTable1" >
					<TBODY>
					<tr id="trdark">
					<TH align="CENTER" nowrap width="5%">&nbsp;</TH>
					<TH align="CENTER" nowrap width="5%">Sec.</TH>
					<TH align="CENTER" nowrap width="25%">Suscrito por</TH>
					<TH align="CENTER" nowrap width="25%">Negocio Subyacente</TH>
					<TH align="CENTER" nowrap width="15%">Valor Cedido</TH>
					<TH align="CENTER" nowrap width="15%"></TH>
 					</tr>
					</TBODY>
					</TABLE>

					<div id="dataDiv1" class="scbarcolor">
						<table id="dataTable1" >
			<%
				firstTime = true;
						String gaChk = "";
						gaListBien.initRow();
						i = 0;
						ERA006801Help.initRow();

						while (gaListBien.getNextRow()) {
							if (gaListBien.getFlag().equals("")) {
								gaChk = (firstTime) ? "checked" : "";
								firstTime = false;
								ERA006801Help.getNextRow();
								datapro.eibs.beans.ERA006801Message msgList = (datapro.eibs.beans.ERA006801Message) ERA006801Help
										.getRecord();
			%>
			<TBODY>
			<%
				if (!msgList.getH01FLGWK2().equals("T")) {
			%>		

			<TR>
				<TD ALIGN=LEFT NOWRAP width="5%">
				<input type="radio" name="COLLCOD" value="<%=ERA006801Help.getCurrentRow()%>" onClick="getParamsBien(this.value,'<%=msgList.getE01R10SEQ()%>')" <%=gaChk%>>
				</TD>
				<TD ALIGN=CENTER NOWRAP width="5%">
				<a href="javascript:radioClick('COLLCOD',<%=i%>)">
				<DIV NOWRAP><%=msgList.getE01R10SEQ().trim()%></DIV>
				</a>
				</TD>
				<TD ALIGN=CENTER NOWRAP width="25%">
				<a href="javascript:radioClick('COLLCOD',<%=i%>)">
				<DIV NOWRAP><%=msgList.getE01R10SUS().trim()%></DIV>
				</a>
				</TD>
				<TD ALIGN=CENTER NOWRAP width="25%">
				<a href="javascript:radioClick('COLLCOD',<%=i%>)">
				<DIV NOWRAP><%=msgList.getE01R10NSB().trim()%></DIV>
				</a>
				</TD>
				<TD ALIGN=CENTER NOWRAP width="15%">
				<a href="javascript:radioClick('COLLCOD',<%=i%>)">
				<DIV NOWRAP><%=msgList.getE01R10VCD().trim()%></DIV>
				</a>
				</TD>
				<TD ALIGN=CENTER NOWRAP width="15%">
				<a href="javascript:radioClick('COLLCOD',<%=i%>)">
				<DIV NOWRAP><%=msgList.getE01R10NPA().trim()%></DIV>
				</a>
				</TD>
 			</TR>
			<%
				} else {
			%>
			<TR>
				<TD ALIGN=LEFT NOWRAP width="5%">
				</TD>

				<TD ALIGN=LEFT NOWRAP width="5%">
				</TD>

				<TD ALIGN=CENTER NOWRAP width="25%"><h5> </h5>
				</TD>
				<TD ALIGN=CENTER NOWRAP width="25%"><h5><DIV NOWRAP></DIV>
				</h5>
				</TD>
				<TD ALIGN=CENTER NOWRAP width="15%"><h5><DIV NOWRAP><%=msgList.getE01R10VCD().trim()%></DIV></h5>
				</TD>
				<TD ALIGN=LEFT NOWRAP width="15%"><h5> </h5>
				</TD>
 			</TR>
			<%
				}
			%>
			</TBODY>
			<%
				i++;
							}
						}
			%>
			</table>
			</DIV>
			</TD>
			</TR>

	</TABLE>

<%
	}
%>

<%
	}
%> 
<%-- 4/5. Fiducia Administración y Fuente de Pago/Fiducia en Garantía --%>

<%
	if ((list_fid && (!userPO.getPurpose().equals("NEW")))){

%>

<%
	if (gaListBien.getNoResult()) {
%>
<h3><%=desc_type_coll%> Asociados a la Garantía</h3>
<TABLE class="tbenter" height="20%">
	<TR>
		<TD ALIGN=CENTER VALIGN=MIDDLE>
		<H4 style="text-align: center">No existe ninguna <%=desc_type_coll%> asociados a la garantía.
		</h4>
		</TD>
	</TR>
	<tr>
		<%
			if (b_read_only1 == false) {
		%>
		<td class=TDBKG width="20%">
		<div align="center"><a href="javascript:goAction('4',1)" id="btn3"><b>Crear <%=desc_type_coll%></b></a></div>
		</td>
		<%
			}
		%>
	</tr>
</TABLE>
<%
	} else {
%>
<h3><%=desc_type_coll%> Asociados a la Garantía</h3>
	<TABLE id="mainTableF" class="tableinfo">
			<TR>
				<TD nowrap valign="top" width="100%">

					<table class="tbenter" width=100% align=center>
					<tr>
					<%
						if (b_read_only1 == false) {
					%>
					<td class=TDBKG width="12%">
					<div align="center"><a href="javascript:goAction('4',1)" id="btnA1"><b>Adicionar </b></a></div>
					</td>
					<%
						}
					%>
					<%
						if (b_read_only1 == false) {
					%>
					<td class=TDBKG width="12%">
					<div align="center"><a href="javascript:goAction('4',2)" id="btnA2"><b>Modificar</b></a></div>
					</td>
					<td class=TDBKG width="12%">
					<div align="center"><a href="javascript:goAction('4',3)" id="btnA3"><b>Borrar</b></a></div>
					</td>
					<%
						}
					%>
					<td class=TDBKG width="12%">
					<div align="center"><a href="javascript:goAction('4',4)" id="btnA4"><b>Consultar </b></a></div>
					</td>
					</tr>
					</table>

					<TABLE id="headTable1" >
					<TBODY>
					<tr id="trdark">
					<TH align="CENTER" nowrap width="5%">&nbsp;</TH>
					<TH align="CENTER" nowrap width="5%">Sec.</TH>
					<TH align="CENTER" nowrap width="25%">Número de Escritura</TH>
					<TH align="CENTER" nowrap width="25%">Fiduciaria Emisora</TH>
					<TH align="CENTER" nowrap width="15%">Monto Fiducia</TH>
					<TH align="CENTER" nowrap width="15%"></TH>
 					</tr>
					</TBODY>
					</TABLE>

					<div id="dataDiv1" class="scbarcolor">
						<table id="dataTable1" >
			<%
				firstTime = true;
						String gaChk = "";
						gaListBien.initRow();
						i = 0;
						ERA006901Help.initRow();

						while (gaListBien.getNextRow()) {
							if (gaListBien.getFlag().equals("")) {
								gaChk = (firstTime) ? "checked" : "";
								firstTime = false;
								ERA006901Help.getNextRow();
								datapro.eibs.beans.ERA006901Message msgList = (datapro.eibs.beans.ERA006901Message) ERA006901Help
										.getRecord();
			%>
			<TBODY>
			<%
				if (!msgList.getH01FLGWK2().equals("T")) {
			%>		

			<TR>
				<TD ALIGN=LEFT NOWRAP width="5%">
				<input type="radio" name="COLLCOD" value="<%=ERA006901Help.getCurrentRow()%>" onClick="getParamsBien(this.value,'<%=msgList.getE01R07SEQ()%>')" <%=gaChk%>>
				</TD>
				<TD ALIGN=CENTER NOWRAP width="5%">
				<a href="javascript:radioClick('COLLCOD',<%=i%>)">
				<DIV NOWRAP><%=msgList.getE01R07SEQ().trim()%></DIV>
				</a>
				</TD>
				<TD ALIGN=CENTER NOWRAP width="25%">
				<a href="javascript:radioClick('COLLCOD',<%=i%>)">
				<DIV NOWRAP><%=msgList.getE01R07NES().trim()%></DIV>
				</a>
				</TD>
				<TD ALIGN=CENTER NOWRAP width="25%">
				<a href="javascript:radioClick('COLLCOD',<%=i%>)">
				<DIV NOWRAP><%=msgList.getE01R07FIE().trim()%></DIV>
				</a>
				</TD>
				<TD ALIGN=CENTER NOWRAP width="15%">
				<a href="javascript:radioClick('COLLCOD',<%=i%>)">
				<DIV NOWRAP><%=msgList.getE01R07MGA().trim()%></DIV>
				</a>
				</TD>
				<TD ALIGN=CENTER NOWRAP width="15%">
				<a href="javascript:radioClick('COLLCOD',<%=i%>)">
				<DIV NOWRAP></DIV>
				</a>
				</TD>
 			</TR>
			<%
				} else {
			%>
			<TR>
				<TD ALIGN=LEFT NOWRAP width="5%">
				</TD>

				<TD ALIGN=LEFT NOWRAP width="5%">
				</TD>

				<TD ALIGN=CENTER NOWRAP width="25%"><h5> </h5>
				</TD>
				<TD ALIGN=CENTER NOWRAP width="25%"><h5><DIV NOWRAP></DIV>
				</h5>
				</TD>
				<TD ALIGN=CENTER NOWRAP width="15%"><h5><DIV NOWRAP><%=msgList.getE01R07MGA().trim()%></DIV></h5>
				</TD>
				<TD ALIGN=LEFT NOWRAP width="15%"><h5> </h5>
				</TD>
 			</TR>
			<%
				}
			%>
			</TBODY>
			<%
				i++;
							}
						}
			%>
			</table>
			</DIV>
			</TD>
			</TR>

	</TABLE>

<%
	}
%>

<%
	}
%> 
<%-- 8. Pignoración de Rentas --%>

<%
	if (gaMant.getE01ROCTYP().equals("8") && (!userPO.getPurpose().equals("NEW"))) {

%>

<%
	if (gaListBien.getNoResult()) {
%>
<h3><%=desc_type_coll%> Asociados a la Garantía</h3>
<TABLE class="tbenter" height="20%">
	<TR>
		<TD ALIGN=CENTER VALIGN=MIDDLE>
		<H4 style="text-align: center">No existe ninguna <%=desc_type_coll%> asociados a la garantía.
		</h4>
		</TD>
	</TR>
	<tr>
		<%
			if (b_read_only1 == false) {
		%>
		<td class=TDBKG width="20%">
		<div align="center"><a href="javascript:goAction('8',1)" id="btn3"><b>Crear <%=desc_type_coll%></b></a></div>
		</td>
		<%
			}
		%>
	</tr>
</TABLE>
<%
	} else {
%>
<h3><%=desc_type_coll%> Asociados a la Garantía</h3>
	<TABLE id="mainTableF" class="tableinfo">
			<TR>
				<TD nowrap valign="top" width="100%">

					<table class="tbenter" width=100% align=center>
					<tr>
					<%
						if (b_read_only1 == false) {
					%>
					<td class=TDBKG width="12%">
					<div align="center"><a href="javascript:goAction('8',1)" id="btnA1"><b>Adicionar </b></a></div>
					</td>
					<%
						}
					%>
					<%
						if (b_read_only1 == false) {
					%>
					<td class=TDBKG width="12%">
					<div align="center"><a href="javascript:goAction('8',2)" id="btnA2"><b>Modificar</b></a></div>
					</td>
					<td class=TDBKG width="12%">
					<div align="center"><a href="javascript:goAction('8',3)" id="btnA3"><b>Borrar</b></a></div>
					</td>
					<%
						}
					%>
					<td class=TDBKG width="12%">
					<div align="center"><a href="javascript:goAction('8',4)" id="btnA4"><b>Consultar </b></a></div>
					</td>
					</tr>
					</table>

					<TABLE id="headTable1" >
					<TBODY>
					<tr id="trdark">
					<TH align="CENTER" nowrap width="5%">&nbsp;</TH>
					<TH align="CENTER" nowrap width="5%">Sec.</TH>
					<TH align="CENTER" nowrap width="25%">Número de Decreto</TH>
					<TH align="CENTER" nowrap width="25%">Representante</TH>
					<TH align="CENTER" nowrap width="15%">Monto Fiducia</TH>
					<TH align="CENTER" nowrap width="15%"></TH>
 					</tr>
					</TBODY>
					</TABLE>

					<div id="dataDiv1" class="scbarcolor">
						<table id="dataTable1" >
			<%
				firstTime = true;
						String gaChk = "";
						gaListBien.initRow();
						i = 0;
						ERA007301Help.initRow();

						while (gaListBien.getNextRow()) {
							if (gaListBien.getFlag().equals("")) {
								gaChk = (firstTime) ? "checked" : "";
								firstTime = false;
								ERA007301Help.getNextRow();
								datapro.eibs.beans.ERA007301Message msgList = (datapro.eibs.beans.ERA007301Message) ERA007301Help.getRecord();
			%>
			<TBODY>
			<%
				if (!msgList.getH01FLGWK2().equals("T")) {
			%>		

			<TR>
				<TD ALIGN=LEFT NOWRAP width="5%">
				<input type="radio" name="COLLCOD" value="<%=ERA007301Help.getCurrentRow()%>" onClick="getParamsBien(this.value,'<%=msgList.getE01R08SEQ()%>')" <%=gaChk%>>
				</TD>
				<TD ALIGN=CENTER NOWRAP width="5%">
				<a href="javascript:radioClick('COLLCOD',<%=i%>)">
				<DIV NOWRAP><%=msgList.getE01R08SEQ().trim()%></DIV>
				</a>
				</TD>
				<TD ALIGN=CENTER NOWRAP width="25%">
				<a href="javascript:radioClick('COLLCOD',<%=i%>)">
				<DIV NOWRAP><%=msgList.getE01R08NDA().trim()%></DIV>
				</a>
				</TD>
				<TD ALIGN=CENTER NOWRAP width="25%">
				<a href="javascript:radioClick('COLLCOD',<%=i%>)">
				<DIV NOWRAP><%=msgList.getE01R08RLA().trim()%></DIV>
				</a>
				</TD>
				<TD ALIGN=CENTER NOWRAP width="15%">
				<a href="javascript:radioClick('COLLCOD',<%=i%>)">
				<DIV NOWRAP><%=msgList.getE01R08MGA().trim()%></DIV>
				</a>
				</TD>
				<TD ALIGN=CENTER NOWRAP width="15%">
				<a href="javascript:radioClick('COLLCOD',<%=i%>)">
				<DIV NOWRAP></DIV>
				</a>
				</TD>
 			</TR>
			<%
				} else {
			%>
			<TR>
				<TD ALIGN=LEFT NOWRAP width="5%">
				</TD>

				<TD ALIGN=LEFT NOWRAP width="5%">
				</TD>

				<TD ALIGN=CENTER NOWRAP width="25%"><h5> </h5>
				</TD>
				<TD ALIGN=CENTER NOWRAP width="25%"><h5><DIV NOWRAP></DIV>
				</h5>
				</TD>
				<TD ALIGN=CENTER NOWRAP width="15%"><h5><DIV NOWRAP><%=msgList.getE01R08MGA().trim()%></DIV></h5>
				</TD>
				<TD ALIGN=LEFT NOWRAP width="15%"><h5> </h5>
				</TD>
 			</TR>
			<%
				}
			%>
			</TBODY>
			<%
				i++;
							}
						}
			%>
			</table>
			</DIV>
			</TD>
			</TR>

	</TABLE>

<%
	}
%>

<%
	}
%> 
<%-- 7/9. Acciones y Otros Titulos valores --%>

<%
	if ((list_acc && (!userPO.getPurpose().equals("NEW")))){

%>

<%
	if (gaListBien.getNoResult()) {
%>
<h3><%=desc_type_coll%> Asociados a la Garantía</h3>
<TABLE class="tbenter" height="20%">
	<TR>
		<TD ALIGN=CENTER VALIGN=MIDDLE>
		<H4 style="text-align: center">No existe ninguna <%=desc_type_coll%> asociados a la garantía.
		</h4>
		</TD>
	</TR>
	<tr>
		<%
			if (b_read_only1 == false) {
		%>
		<td class=TDBKG width="20%">
		<div align="center"><a href="javascript:goAction('9',1)" id="btn3"><b>Crear <%=desc_type_coll%></b></a></div>
		</td>
		<%
			}
		%>
	</tr>
</TABLE>
<%
	} else {
%>
<h3><%=desc_type_coll%> Asociados a la Garantía</h3>
	<TABLE id="mainTableF" class="tableinfo">
			<TR>
				<TD nowrap valign="top" width="100%">

					<table class="tbenter" width=100% align=center>
					<tr>
					<%
						if (b_read_only1 == false) {
					%>
					<td class=TDBKG width="12%">
					<div align="center"><a href="javascript:goAction('9',1)" id="btnA1"><b>Adicionar </b></a></div>
					</td>
					<%
						}
					%>
					<%
						if (b_read_only1 == false) {
					%>
					<td class=TDBKG width="12%">
					<div align="center"><a href="javascript:goAction('9',2)" id="btnA2"><b>Modificar</b></a></div>
					</td>
					<td class=TDBKG width="12%">
					<div align="center"><a href="javascript:goAction('9',3)" id="btnA3"><b>Borrar</b></a></div>
					</td>
					<%
						}
					%>
					<td class=TDBKG width="12%">
					<div align="center"><a href="javascript:goAction('9',4)" id="btnA4"><b>Consultar </b></a></div>
					</td>
					</tr>
					</table>

					<TABLE id="headTable1" >
					<TBODY>
					<tr id="trdark">
					<TH align="CENTER" nowrap width="5%">&nbsp;</TH>
					<TH align="CENTER" nowrap width="5%">Sec.</TH>
					<%
						if ((gaMant.getE01ROCTYP().equals("9") && (!userPO
										.getPurpose().equals("NEW")))) {
					%>
					<TH align="CENTER" nowrap width="25%">Emisor</TH>
					<TH align="CENTER" nowrap width="25%">Número de Títulos</TH>
					<TH align="CENTER" nowrap width="15%">Monto Garantía</TH>
					<%
						}
					%>
					<%
						if ((gaMant.getE01ROCTYP().equals("7") && (!userPO
										.getPurpose().equals("NEW")))) {
					%>
					<TH align="CENTER" nowrap width="25%">Emisor</TH>
					<TH align="CENTER" nowrap width="25%">Número de Certificado</TH>
					<TH align="CENTER" nowrap width="15%">Valor Título</TH>
					<%
						}
					%>
					<TH align="CENTER" nowrap width="15%"></TH>
 					</tr>
					</TBODY>
					</TABLE>

					<div id="dataDiv1" class="scbarcolor">
						<table id="dataTable1" >
			<%
				firstTime = true;
						String gaChk = "";
						gaListBien.initRow();
						i = 0;
						ERA007401Help.initRow();

						while (gaListBien.getNextRow()) {
							if (gaListBien.getFlag().equals("")) {
								gaChk = (firstTime) ? "checked" : "";
								firstTime = false;
								ERA007401Help.getNextRow();
								datapro.eibs.beans.ERA007401Message msgList = (datapro.eibs.beans.ERA007401Message) ERA007401Help
										.getRecord();
			%>
			<TBODY>
			<%
				if (!msgList.getH01FLGWK2().equals("T")) {
			%>		

			<TR>
				<TD ALIGN=LEFT NOWRAP width="5%">
				<input type="radio" name="COLLCOD" value="<%=ERA007401Help.getCurrentRow()%>" onClick="getParamsBien(this.value,'<%=msgList.getE01R09SEQ()%>')" <%=gaChk%>>
				</TD>
				<TD ALIGN=CENTER NOWRAP width="5%">
				<a href="javascript:radioClick('COLLCOD',<%=i%>)">
				<DIV NOWRAP><%=msgList.getE01R09SEQ().trim()%></DIV>
				</a>
				</TD>
					<%
						if ((gaMant.getE01ROCTYP().equals("9") && (!userPO
										.getPurpose().equals("NEW")))) {
					%>
				<TD ALIGN=CENTER NOWRAP width="25%">
				<a href="javascript:radioClick('COLLCOD',<%=i%>)">
				<DIV NOWRAP><%=msgList.getE01R09EMC().trim()%></DIV>
				</a>
				</TD>
				<TD ALIGN=CENTER NOWRAP width="25%">
				<a href="javascript:radioClick('COLLCOD',<%=i%>)">
				<DIV NOWRAP><%=msgList.getE01R09CEP().trim()%></DIV>
				</a>
				</TD>
				<TD ALIGN=CENTER NOWRAP width="15%">
				<a href="javascript:radioClick('COLLCOD',<%=i%>)">
				<DIV NOWRAP><%=msgList.getE01R09MGA().trim()%></DIV>
				</a>
				</TD>
					<%
						}
					%>
					<%
						if ((gaMant.getE01ROCTYP().equals("7") && (!userPO
										.getPurpose().equals("NEW")))) {
					%>
				<TD ALIGN=CENTER NOWRAP width="25%">
				<a href="javascript:radioClick('COLLCOD',<%=i%>)">
				<DIV NOWRAP><%=msgList.getE01R09EMS().trim()%></DIV>
				</a>
				</TD>
				<TD ALIGN=CENTER NOWRAP width="25%">
				<a href="javascript:radioClick('COLLCOD',<%=i%>)">
				<DIV NOWRAP><%=msgList.getE01R09NCS().trim()%></DIV>
				</a>
				</TD>
				<TD ALIGN=CENTER NOWRAP width="15%">
				<a href="javascript:radioClick('COLLCOD',<%=i%>)">
				<DIV NOWRAP><%=msgList.getE01R09PVB().trim()%></DIV>
				</a>
				</TD>
					<%
						}
					%>
				<TD ALIGN=CENTER NOWRAP width="15%">
				<a href="javascript:radioClick('COLLCOD',<%=i%>)">
				<DIV NOWRAP></DIV>
				</a>
				</TD>
 			</TR>
			<%
				} else {
			%>
			<TR>
				<TD ALIGN=LEFT NOWRAP width="5%">
				</TD>

				<TD ALIGN=LEFT NOWRAP width="5%">
				</TD>

				<TD ALIGN=CENTER NOWRAP width="25%"><h5> </h5>
				</TD>
				<TD ALIGN=CENTER NOWRAP width="25%"><h5><DIV NOWRAP></DIV>
				</h5>
				</TD>
				<TD ALIGN=CENTER NOWRAP width="15%"><h5><DIV NOWRAP><%=msgList.getE01R09MGA().trim()%></DIV></h5>
				</TD>
				<TD ALIGN=LEFT NOWRAP width="15%"><h5> </h5>
				</TD>
 			</TR>
			<%
				}
			%>
			</TBODY>
			<%
				i++;
							}
						}
			%>
			</table>
			</DIV>
			</TD>
			</TR>

	</TABLE>

<%
	}
%>

<%
	}
%> 

<%-- Y/X. FNG/FAG --%>

<%
	if ((list_FNG && (!userPO.getPurpose().equals("NEW")))){

%>

<%
	if (gaListBien.getNoResult()) {
%>
<h3><%=desc_type_coll%> Asociados a la Garantía</h3>
<TABLE class="tbenter" id="mainTableF" height="20%">
	<TR>
		<TD ALIGN=CENTER VALIGN=MIDDLE>
		<H4 style="text-align: center">No existe ninguna <%=desc_type_coll%> asociados a la garantía.
		</h4>
		</TD>
	</TR>
	<tr>
		<%
			if (b_read_only1 == false) {
		%>
		<td class=TDBKG width="20%">
		<%
			if (gaMant.getE01ROCTYP().equals("Y")) {
		%>
		<div align="center"><a href="javascript:ShowEnterAcc()" id="btn3"><b>Crear <%=desc_type_coll%></b></a></div>
		<%
			}else{
		%>
		<div align="center"><a href="javascript:goAction('10',1)" id="btn3"><b>Crear <%=desc_type_coll%></b></a></div>
		<%
			}
		%>
		</td>
		<%
			}
		%>
	</tr>
</TABLE>
<%
	} else {
%>
<h3>
	<%
		if (gaMant.getE01ROCTYP().equals("Y")) {
	%>
Reservas Asociadas a la Garantía
	<%
		}
	%>
	<%
		if (gaMant.getE01ROCTYP().equals("X")) {
	%>
Bienes Asociadas a la Garantía
	<%
		}
	%>

</h3>
	<TABLE id="mainTableF" class="tableinfo">
			<TR>
				<TD nowrap valign="top" width="100%">

					<table class="tbenter" width=100% align=center>
					<tr>
					<%
						if (b_read_only1 == false) {
					%>
					<td class=TDBKG width="12%">

		<%
			if (gaMant.getE01ROCTYP().equals("Y")) {
		%>
		<div align="center"><a href="javascript:ShowEnterAcc()" id="btnA1"><b>Adicionar</b></a></div>
		<%
			}else{
		%>
		<div align="center"><a href="javascript:goAction('10',1)" id="btnA1"><b>Adicionar</b></a></div>
		<%
			}
		%>


					</td>
					<%
						}
					%>
					<%
						if (b_read_only1 == false) {
					%>
					<td class=TDBKG width="12%">
					<div align="center"><a href="javascript:goAction('10',2)" id="btnA2"><b>Modificar</b></a></div>
					</td>
					<td class=TDBKG width="12%">
					<div align="center"><a href="javascript:goAction('10',3)" id="btnA3"><b>Borrar</b></a></div>
					</td>
					<%
						}
					%>
					<td class=TDBKG width="12%">
					<div align="center"><a href="javascript:goAction('10',4)" id="btnA4"><b>Consultar </b></a></div>
					</td>
					</tr>
					</table>

					<TABLE id="headTable1" >
					<TBODY>
					<tr id="trdark">
					<TH align="CENTER" nowrap width="5%">&nbsp;</TH>
					<TH align="CENTER" nowrap width="5%">Sec.</TH>
					<%
						if ((gaMant.getE01ROCTYP().equals("Y") && (!userPO
										.getPurpose().equals("NEW")))) {
					%>
					<TH align="CENTER" nowrap width="25%">Numero Reserva</TH>
					<TH align="CENTER" nowrap width="25%"></TH>
					<TH align="CENTER" nowrap width="15%">Monto Garantía</TH>
					<%
						}
					%>
					<%
						if ((gaMant.getE01ROCTYP().equals("X") && (!userPO
										.getPurpose().equals("NEW")))) {
					%>
					<TH align="CENTER" nowrap width="25%">Numero Pagare</TH>
					<TH align="CENTER" nowrap width="15%">Saldo Redescuento</TH>
					<TH align="CENTER" nowrap width="25%">Valor Inicial</TH>
					<%
						}
					%>
					<TH align="CENTER" nowrap width="15%"></TH>
 					</tr>
					</TBODY>
					</TABLE>

					<div id="dataDiv1" class="scbarcolor">
						<table id="dataTable1" >
			<%
				firstTime = true;
						String gaChk = "";
						gaListBien.initRow();
						i = 0;
						ERA006101Help.initRow();

						while (gaListBien.getNextRow()) {
							if (gaListBien.getFlag().equals("")) {
								gaChk = (firstTime) ? "checked" : "";
								firstTime = false;
								ERA006101Help.getNextRow();
								datapro.eibs.beans.ERA006101Message msgList = (datapro.eibs.beans.ERA006101Message) ERA006101Help
										.getRecord();
			%>
			<TBODY>
			<%
				if (!msgList.getH01FLGWK2().equals("T")) {
			%>		

			<TR>
				<TD ALIGN=LEFT NOWRAP width="5%">
				<input type="radio" name="COLLCOD" value="<%=ERA006101Help.getCurrentRow()%>" onClick="getParamsBien(this.value,'<%=msgList.getE01R02SEQ()%>')" <%=gaChk%>>
				</TD>
				<TD ALIGN=CENTER NOWRAP width="5%">
				<a href="javascript:radioClick('COLLCOD',<%=i%>)">
				<DIV NOWRAP><%=msgList.getE01R02SEQ().trim()%></DIV>
				</a>
				</TD>
					<%
						if ((gaMant.getE01ROCTYP().equals("Y") && (!userPO
										.getPurpose().equals("NEW")))) {
					%>
				<TD ALIGN=CENTER NOWRAP width="25%">
				<a href="javascript:radioClick('COLLCOD',<%=i%>)">
				<DIV NOWRAP><%=msgList.getE01R02NRE().trim()%></DIV>
				</a>
				</TD>
				<TD ALIGN=CENTER NOWRAP width="25%">
				<a href="javascript:radioClick('COLLCOD',<%=i%>)">
				<DIV NOWRAP><%=msgList.getD01R02PFN().trim()%></DIV>
				</a>
				</TD>
					<%
						}
					%>
					<%
						if ((gaMant.getE01ROCTYP().equals("X") && (!userPO
										.getPurpose().equals("NEW")))) {
					%>
				<TD ALIGN=CENTER NOWRAP width="25%">
				<a href="javascript:radioClick('COLLCOD',<%=i%>)">
				<DIV NOWRAP><%=msgList.getE01R02NPG().trim()%></DIV>
				</a>
				</TD>
				<TD ALIGN=CENTER NOWRAP width="25%">
				<a href="javascript:radioClick('COLLCOD',<%=i%>)">
				<DIV NOWRAP><%=msgList.getE01R02SRD().trim()%></DIV>
				</a>
				</TD>
					<%
						}
					%>
				<TD ALIGN=CENTER NOWRAP width="15%">
				<a href="javascript:radioClick('COLLCOD',<%=i%>)">
				<DIV NOWRAP><%=msgList.getE01R02MRE().trim()%></DIV>
				</a>
				</TD>
				<TD ALIGN=CENTER NOWRAP width="15%">
				<a href="javascript:radioClick('COLLCOD',<%=i%>)">
				<DIV NOWRAP></DIV>
				</a>
				</TD>
 			</TR>
			<%
				} else {
			%>
			<TR>
				<TD ALIGN=LEFT NOWRAP width="5%">
				</TD>

				<TD ALIGN=LEFT NOWRAP width="5%">
				</TD>

				<TD ALIGN=CENTER NOWRAP width="25%"><h5> </h5>
				</TD>
				<TD ALIGN=CENTER NOWRAP width="25%"><h5><DIV NOWRAP></DIV>
				</h5>
				</TD>
				<TD ALIGN=CENTER NOWRAP width="15%"><h5><DIV NOWRAP><%=msgList.getE01R02MIG().trim()%></DIV></h5>
				</TD>
				<TD ALIGN=LEFT NOWRAP width="15%"><h5> </h5>
				</TD>
 			</TR>
			<%
				}
			%>
			</TBODY>
			<%
				i++;
							}
						}
			%>
			</table>
			</DIV>
			</TD>
			</TR>

	</TABLE>

<%
	}
%>

<%
	}
%> 


<%-- inicio seguros --%>

<div id="DivSeg" style="position:relative; display:block;">

<%
if (!userPO.getPurpose().equals("NEW")) {
  if (gaMant.getE01ROCTYP().equals("B") ||(gaMant.getE01ROCTYP().equals("V")) ||(gaMant.getE01ROCTYP().equals("F")) ||(gaMant.getE01ROCTYP().equals("E")) ||(gaMant.getE01ROCTYP().equals("1"))||(gaMant.getE01ROCTYP().equals("T"))) {
	if (gaListIns.getNoResult()) {
%>
<h3>Seguros Asociados a la Garantía</h3>
<TABLE class="tbenter" >
<%-- 
	<TR>
		<TD ALIGN=CENTER VALIGN=MIDDLE>
		<H4 style="text-align: center">No existe ningún seguro asociado a la garantía.
		</h4>
		</TD>
	</TR>
--%>
	<tr>
		<%
			if (b_read_only1 == false) {
		%>
		<td class=TDBKG width="20%">
		<div align="center"><a href="javascript:goActionA(1)" id="btn3"><b>Crear seguro para esta garantía</b></a></div>
		</td>
		<%
			}
		%>
	</tr>
</TABLE>
<%
	} else {
%>
<h3>Seguros Relacionados a esta Garantía</h3>
	<TABLE id="mainTableI" class="tableinfo">
			<TR>
				<TD nowrap valign="top" width="100%">

					<table class="tbenter" width=100% align=center>
					<tr>
					<%
						if (b_read_only1 == false) {
					%>
					<td class=TDBKG width="12%">
					<div align="center"><a href="javascript:goActionA(1)" id="btnA1"><b>Adicionar </b></a></div>
					</td>
					<%
						}
					%>
					<%
						if (b_read_only1 == false) {
					%>
					<td class=TDBKG width="12%">
					<div align="center"><a href="javascript:goActionA(2)" id="btnA2"><b>Modificar</b></a></div>
					</td>
					<td class=TDBKG width="12%">
					<div align="center"><a href="javascript:goActionA(3)" id="btnA3"><b>Borrar</b></a></div>
					</td>
					<%
						}
					%>
					<td class=TDBKG width="12%">
					<div align="center"><a href="javascript:goActionA(4)" id="btnA4"><b>Consultar </b></a></div>
					</td>
					</tr>
					</table>

					<TABLE id="headTableI" >
					<TBODY>
				<tr id="trdark">
					<TH ALIGN=CENTER NOWRAP></TH>
					<TH ALIGN=CENTER NOWRAP>Compa&ntilde;&iacute;a</TH>
					<TH ALIGN=CENTER NOWRAP>Nombre</TH>
					<TH ALIGN=CENTER NOWRAP>N&uacute;mero<BR>P&oacute;liza</TH>
					<TH ALIGN=CENTER NOWRAP>Moneda</TH>
					<TH ALIGN=CENTER NOWRAP>Monto</TH>
				</tr>
			</TBODY>
			</TABLE>

			<div id="dataDivI" class="scbarcolor">
				<table id="dataTableI" >
			<%
				firstTime = true;
					String gaChk = "";
					gaListIns.initRow();
					i = 0;
					ERA006203Help.initRow();

					while (gaListIns.getNextRow()) {
						if (gaListIns.getFlag().equals("")) {
							gaChk = (firstTime) ? "checked" : "";
							firstTime = false;
							ERA006203Help.getNextRow();
							datapro.eibs.beans.ERA006203Message msgList = (datapro.eibs.beans.ERA006203Message) ERA006203Help
									.getRecord();
			%>
			<TBODY>

				<TR>
					<TD ALIGN=LEFT NOWRAP width="5%"><input type="radio"
						name="COLLCODI" value="<%=ERA006203Help.getCurrentRow()%>"
						onClick="getParamsI(this.value,'<%=msgList.getE03ROCCIN()%>')"
						<%=gaChk%>></TD>
					<TD ALIGN=CENTER NOWRAP><%=Util.formatCell(msgList.getE03ROCICN())%></TD>
					<TD ALIGN=CENTER NOWRAP><%=Util.formatCell(msgList.getE03ROCICM())%></TD>
					<TD ALIGN=CENTER NOWRAP><%=Util.formatCell(msgList.getE03ROCCIN())%></TD>
					<TD ALIGN=CENTER NOWRAP><%=Util.formatCell(msgList.getE03ROCICY())%></TD>
					<TD ALIGN=CENTER NOWRAP><%=Util.fcolorCCY(msgList.getE03ROCIPA())%></TD>
				</TR>
			</TBODY>
			<%
				i++;
						}
					}
			%>
			</table>
			</DIV>
			</TD>
			</TR>

	</TABLE>

<%
	}
}
}
%>
</div>

<%-- fin seguros --%>

<div id="DivActa" style="position:relative; display:block;">

<%
	if (!userPO.getPurpose().equals("NEW")) {
%>

<h4>Información del Acta de Comité</h4>
    <table class="tableinfo">
      <tr > 
        <td >
          <table cellspacing="0" cellpadding="2" width="100%" border="0" >

   		  <tr id="trdark"> 
			<td nowrap> 
              <div align="right">Número de Acta :</div>
            </td>
            <td nowrap colspan="3">
               <input type="text" name="E01ROCRF3" size="20" maxlength="22" value="<%=gaMant.getE01ROCRF3().trim()%>" <%=read_only1%>>
            </td>
            <td nowrap> 
              <div align="right">Fecha del Acta :</div>
            </td>
            <td nowrap colspan="3">
             <eibsinput:date name="gaMant" fn_year="E01ROCTPY" fn_month="E01ROCTPM" fn_day="E01ROCTPD" readonly="<%=b_read_only1%>"/>
            </td>
          </tr>
   		  <tr id="trclear"> 
			<td nowrap> 
              <div align="right">Comité de Aprobación :</div>
            </td>
            <td nowrap colspan="3">
               <input type="text" name="E01ROCCPH" size="30" maxlength="33" value="<%=gaMant.getE01ROCCPH().trim()%>" <%=read_only1%>>
            </td>
            <td nowrap> 
              <div align="right">Banca :</div>
            </td>
            <td nowrap colspan="3">
              <input type="text" name="E01ROCUC6" size="4" maxlength="5" value="<%=gaMant.getE01ROCUC6().trim()%>" <%=read_only1%>>
              <%
              	if (read_only1.equals("")) {
              %> 
              <a href="javascript:GetCodeDescCNOFC('E01ROCUC6','D01ROCUC6','9U')"><img src="<%=request.getContextPath()%>/images/1b.gif" title=". . ." align="bottom" border="0"  ></a>
			  <%
			  	}
			  %>
             	<eibsinput:text name="gaMant" property="D01ROCUC6" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_NAME %>" readonly="true"/>
            </td>
          </tr>
   		  <tr id="trdark"> 
			<td nowrap> 
              <div align="right">Condiciones de la Aprobación :</div>
            </td>
            <td nowrap colspan="7">
              <input type="text" name="E01ROCSP4" size="82" maxlength="70" value="<%=gaMant.getE01ROCSP4().trim()%>" <%=read_only1%>><br>
              <input type="text" name="E01ROCSP5" size="82" maxlength="70" value="<%=gaMant.getE01ROCSP5().trim()%>" <%=read_only1%>><br>
              <input type="text" name="E01ROCSP6" size="82" maxlength="70" value="<%=gaMant.getE01ROCSP6().trim()%>" <%=read_only1%>>
			</td>
          </tr>

   		  <tr id="trclear"> 
            <td nowrap> 
              <div align="right">Oficina Contable :</div>
            </td>
            <td nowrap colspan="3"> 
              <input type="text" name="E01ROCSEQ" id="E01ROCSEQ" size="5" maxlength="4" value="<%=gaMant.getE01ROCSEQ().trim()%>" <%=read_only1%>  onKeyPress="enterDecimal(event,0)">
              <%
              	if (read_only1.equals("")) {
              %> 
              <a href="javascript:GetBranch('E01ROCSEQ','<%=gaMant.getE01ROCBNK().trim()%>','D01ROCSEQ')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="bottom" border="0"  ></a>
			  <%
			  	}
			  %>
             	<eibsinput:text name="gaMant" property="D01ROCSEQ" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_NAME %>" readonly="true"/>
            </td>
			<td nowrap> 
<%-- 
              <div align="right">Porcentaje de Cobertura de la Garantía :</div>
--%>
            </td>
            <td nowrap colspan="3">            	 
<%-- 
              	<input type="text" name="E01ROCCPE" size="11" maxlength="7" value="<%=gaMant.getE01ROCCPE().trim()%>" <%=read_only1%>>
--%>
            </td>
          </tr>
   		  <tr id="trdark"> 
			<td nowrap> 
              <div align="right">Número de Obligación :</div>
            </td>
            <td nowrap colspan="3">
               <input type="text" name="E01ROCRF2" size="22" maxlength="20" value="<%=gaMant.getE01ROCRF2().trim()%>" <%=read_only1%>>
            </td>
            <td nowrap> 
            </td>
            <td nowrap colspan="3">
            </td>
          </tr>
          </table>
        </td>
      </tr>
    </table>
<%
	}
%>
</div>

  <table width="100%">		
	<%
	if (b_read_only1 == false) {
	%>
	<tr>
		<td width="100%" align="center" colspan="3">
			<input type="checkbox" name="H01FLGMAS" value="A" <%if (gaMant.getH01FLGMAS().trim().equals("A"))
				out.print(" checked");%>>
			Aceptar con Información Parcial
		</td>
	</tr>
	<%
	}
	%>
	<tr>
		<td width="100%" align="center" colspan="3">
	<%
	if (b_read_only1 == false) {
	%>
	  	<input class="EIBSBTN" id="EIBSBTN" type=submit name="Submit" value="Enviar">
	<%
	}else{
	%>
      <div align="center"><a href="<%=request.getContextPath()%>/pages/background.jsp"><b>Salir</b></a></div>
	<%
	}
	%>
	</td>
	</tr>
  </table>	
  <SCRIPT Language="Javascript">
	
   function waitSimulate() {
     document.body.style.cursor = "wait";
   }
   document.forms[0].onsubmit= waitSimulate;

   </SCRIPT> 
<script type="text/javascript">
    tabview_initialize('TabView');
</script>
  </FORM>
 </BODY>
<SCRIPT language="JavaScript">
   function resizeDoc() {
	if (document.all["dataTable1"]!=null) {
	   adjustEquTables(headTable1, dataTable1, dataDiv1,1,false);
	}
	if (document.all["dataTableI"]!=null) {
	   adjustEquTables(headTableI, dataTableI, dataDivI,1,false);
	}
   }
	resizeDoc();
    window.onresize=resizeDoc;
    window.resize=resizeDoc;
	 showChecked("COLLCOD");
	 showChecked("COLLCODI");

 	if (document.forms[0].E01ROCFG2.value != "S") {
		hideDiv('DivActa',false)
	}else{
		hideDiv('DivActa',true)
	}
	if (isValidObject(getElement("E01ROCINF"))) {
	 	if (document.forms[0].E01ROCINF.value == "N") {
			hideDiv('DivSeg',true)
		}else{
			hideDiv('DivSeg',false)
		}
	}
// 	if (document.forms[0].REF.value == "999999999999") {
//		hideDiv('divGarConst',true)
//	}else{
//		hideDiv('divGarConst',false)
//	}
		hideDiv('divGarConst',true);
	if (isValidObject(getElement("E01RODFLG"))) {
	 	if (document.forms[0].E01RODFLG.value == "Y") {
			hideDiv('DivSin',false)
		}else{
			hideDiv('DivSin',true)
		}
	}


//     initPage();
</SCRIPT>
 </html>