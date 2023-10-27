<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@page import="com.datapro.presentation.input.EibsInputFields"%>
<%@page import="com.datapro.eibs.constants.HelpTypes"%>
<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@page import="com.datapro.constants.EibsFields"%>

<HTML>
<HEAD>
<TITLE>
Lista de Clientes para Aprobar
</TITLE>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Studio">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "searchParameters" class= "datapro.eibs.beans.EDL053901Message"  scope="session" />
<jsp:useBean id= "appList" class= "datapro.eibs.beans.JBList"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>

<script type="text/javascript">
  var reason = '';
 
	function goAction(op) {
		document.forms[0].action.value = op;
     	document.forms[0].reason.value = reason;
	
		if(op == 'Search'){
				getElement('SCREEN').value = 5; //Request Filtered List
				getElement('action').value = '';
	        	document.getElementsByTagName('body')[0].className = 'waiting';		        	
		}	  		  
        document.forms[0].submit();
  	} 
  
  	function showAddInfo(idxRow) {
  		var table = document.getElementById("dataTable");   
   		for ( var i=0; i<table.rows.length; i++ ) {
       		table.rows[i].className = "trnormal";
    	}
   		table.rows[idxRow].className = "trhighlight";
  	} 
  
	function showInqApprovalAdi(ref){
		var SCREEN = "300";
		var E01DEAACC = ref;
		var page = "<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDL0517?SCREEN="+SCREEN+"&E01DEAACC="+E01DEAACC;
		CenterNamedWindow(page,'Information', 1200, 600, 2);
	}
	
  function goExit(){
    window.location.href="<%=request.getContextPath()%>/pages/background.jsp";
  }

</script>
</HEAD>

<% 
 if ( !error.getERRNUM().equals("0")  ) {
     error.setERRNUM("0");
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
 }
%>

<BODY onLoad="MM_preloadImages('<%=request.getContextPath()%>/images/s/approve_over.gif','<%=request.getContextPath()%>/images/s/reject_over.gif')">

<h3 align="center"> Aprobación de Provisi&oacute;n Adicional</h3>
<hr size="4">


<FORM Method="post" Action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDL0539" >
<INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="2">
<INPUT TYPE=HIDDEN NAME="action" VALUE="A">
<INPUT TYPE=HIDDEN NAME="reason" VALUE="">
<INPUT TYPE=HIDDEN NAME="totalRow" VALUE="0">       
<div id="divGarantiasSearch" class="hiddenDiv">
<table class="approvalSearch" style="width: 500px">
    	<caption>B&uacute;squeda</caption>
      <tr > 
        <td align=CENTER nowrap="nowrap"> 
          <div align="right" >Numero de Cliente :</div>
        </td>
        <td align=CENTER  > 
          <div align="left">
			<eibsinput:help name="searchParameters" fn_param_one="E01SELCUN" property="E01SELCUN" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_CUSTOMER%>" />
          </div>
        </td>
      </tr>
      <tr > 
        <td align=CENTER   nowrap="nowrap"> 
          <div align="right" >Numero de Identificaci&oacute;n :</div>
        </td>
        <td align=CENTER  > 
          <div align="left"> 
			<eibsinput:help name="searchParameters" fn_param_one="E01SELIDN" property="E01SELIDN" size="25"  eibsType="<%=EibsFields.EIBS_FIELD_TYPE_IDENTIFICATION%>" />
          </div> 
        </td>
      </tr>
      <tr > 
        <td align=CENTER   nowrap="nowrap"> 
          <div align="right" style="vertical-align: bottom;" > Por Palabra :</div>
        </td>
        <td align=CENTER  > 
          <div align="left" style="vertical-align: bottom;"> 
          	<br style="margin: 1px">
          	<eibsinput:text property="E01SELNME" name="searchParameters" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_TEXT%>" size="<%=String.valueOf(EibsFields.EIBS_FIELD_NAME_LENGTH)%>" />
          </div>
        </td>
      </tr>
      <tr > 
        <td align=CENTER   nowrap="nowrap"> 
          <div align="right" > Codigo de Producto:</div>
        </td>
        <td align=CENTER  > 
          <div align="left">
			<input type="text" name="E01SELPRD" maxlength="4" size="5" value="<%=searchParameters.getE01SELPRD()%>" class="TXTRIGHT">
				<a id="linkHelp" href="javascript:GetProduct('E01SELPRD','91','','', '')">
				<img src="<%=request.getContextPath()%>/images/1b.gif" title="null" align="bottom" border="0"/>
			</a>
          </div>
        </td>
      </tr>       
      <tr > 
        <td align=CENTER   nowrap="nowrap"> 
          <div align="right" >Por Sucursal:</div>
        </td>
        <td align=CENTER  > 
          <div align="left"> 
			<eibsinput:help name="searchParameters" fn_param_one="E01SELBRN" property="E01SELBRN" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_BRANCH%>" />
          </div> 
        </td>
      </tr>   
      <tr > 
        <td align=CENTER   nowrap="nowrap"> 
          <div align="right" >Por Moneda:</div>
        </td>
        <td align=CENTER  > 
          <div align="left"> 
			<eibsinput:help name="searchParameters" fn_param_one="E01SELCCY" property="E01SELCCY" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_CURRENCY%>" />
          </div> 
        </td>
      </tr>       
      <tr> 
        <td align=center nowrap colspan="2"> 
		<br>
          <input class="styled-button-Search" type=button name="Submit" value="Enviar" onClick="javascript:goAction('Search')">
        </td>
      </tr>      
    </table>
  </div> 

<TABLE class="tbenter" width="100%" align=center>   
    <TR>
      <TD class=TDBKG width="25%"> 
        <div align="center"><a href="javascript:goAction('A')" id="linkApproval"><b>Aprobar</b></a></div>
      </TD>
    <TD class=TDBKG width="25%"> 
        <div align="center"><a href="javascript:enterReason('D')" id="linkDelete"><b>Eliminar</b></a></div>
      </TD>
      <TD class=TDBKG width="25%"> 
        <div align="center"><a href="javascript:enterReason('R')" id="linkReject"><b>Rechazar</b></a></div>
      </TD>
      <TD class=TDBKG width="25%"> 
        <div align="center"><a href="javascript:goExit()" id="linkExit"><b>Salir</b></a></div>
      </TD>
    </TR>
  </TABLE>    

 <TABLE  id="mainTable" class="tableinfo" height="70%" style="width: 100%">
 <tr height="5%">
	<td NOWRAP valign="top" width="80%">
  		<TABLE id="headTable" width="100%" >
		  <TR id="trdark"> 
		    <TH ALIGN=CENTER nowrap width="5%"><img id="searchIcon"src="<%=request.getContextPath()%>/images/search1.gif" style="cursor : hand;" ></TH>
		     <TH ALIGN=CENTER nowrap width="10%">No. Prestamo</TH>
		     <TH ALIGN=CENTER nowrap width="10%">No. Cliente</TH>
		     <TH ALIGN=CENTER nowrap width="25%">Nombre Cliente</TH>
		     <TH ALIGN=CENTER nowrap width="10%">Identificaci&oacute;n</TH>
   		 </TR>
  		</TABLE>
	  </td>
  	</tr>
  	<TR height="95%"> 
    	<TD NOWRAP valign="top" width="80%">
			  	<div id="dataDiv1" style="height:400px; overflow:auto;">  
			    <table id="dataTable" cellspacing="0" cellpadding="1" border="0" width="100%" >
  			<%  int k = 0;
				
				if (appList.getNoResult()){
			%>	  
	          <tr id="dataTable"> 
				<TD ALIGN="CENTER" nowrap width="35%" style="color:#d0122c" colspan="5">
					<br><br><br><br> 
					<font size=3>No  hay Provisi&oacute;n Adicional para su Aprobaci&oacute;n. </font>				</TD>          
			 </tr>	  
  
		    <%	} else {
                appList.initRow();
                k=1;
                while (appList.getNextRow()) {
                    if (appList.getFlag().equals("")) {
                    		out.println(appList.getRecord());
                    k++;
                    }        
                }
		    } %>
   				</table>
  				</div>
   
       </TD>
    </TR>	
</TABLE>

<SCRIPT type="text/javascript">
  function resizeDoc() {
       divResize();
     //adjustEquTables(getElement("headTable"), getElement("dataTable"), getElement("dataDiv1"),1,false);
}
  showChecked("REFNUM");
  resizeDoc();
  window.onresize=resizeDoc;
     
  document.forms[0].totalRow.value="<%= k %>";
</SCRIPT>

<SCRIPT type="text/javascript">
	function showHiddenDiv(event) {
		var evt = getEvent(event);
		var divGarantiasSearch = document.getElementById("divGarantiasSearch");
	
		var y = evt.clientY + document.body.scrollTop;
		var x = evt.clientX + document.body.scrollLeft;
		     
		cancelBub(evt);
	
		moveElement(divGarantiasSearch, y, x);
		setVisibility(divGarantiasSearch, "visible");
	}
	
	function closeHiddenDivApproval_Garantias(){
		setVisibility(getElement("divGarantiasSearch"), "hidden");
	}
	
	getElement("divGarantiasSearch").onclick = cancelBub;
	document.getElementById("searchIcon").onclick = showHiddenDiv; 
	addEventHandler(document, 'click', closeHiddenDivApproval_Garantias);  

</script>
</FORM>

</BODY>
</HTML>
