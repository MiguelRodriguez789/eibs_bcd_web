<%@ page import="datapro.eibs.beans.ECO010001Message"%>
<%@ page import="datapro.eibs.master.Util"%>
<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@page import="com.datapro.constants.EibsFields"%>

<!doctype html public "-//w3c//dtd html 4.0 transitional//en">
<html>
<head>
<title>Listado de Convenios</title>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="<%=request.getContextPath()%>/pages/style.css"
	rel="stylesheet">

<jsp:useBean id= "searchParameters" class= "datapro.eibs.beans.ECO010001Message"  scope="session" />
<jsp:useBean id="ECO010001List" class="datapro.eibs.beans.JBObjList" scope="session" />
<jsp:useBean id="error" class="datapro.eibs.beans.ELEERRMessage" scope="session" />

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>

<script type="text/javascript">


  function goAction(op) {
	var ok = false;
	
	
	if (!isValidObject(getElementChecked("key"))){
 		if (op == 'Search'){
			getElement('SCREEN').value = 500; //Request Filtered List
    		document.getElementsByTagName('body')[0].className = 'waiting';		        	
    		document.forms[0].submit();			
 		}else{
			alert("Debe seleccionar un registro.");
			return;
 		}		
    
  } else {
		if (op == 'Search'){
			getElement('SCREEN').value = 500; //Request Filtered List
    		document.getElementsByTagName('body')[0].className = 'waiting';		        	
    		document.forms[0].submit();			
 		}else{
 			document.forms[0].SCREEN.value = op;
 			document.forms[0].submit();
 		}		
	}
}

  
 function showAddInfo(idxRow){
   getElement("tbAddInfo").rows[0].cells[1].style.color="#d0122c";   
   getElement("tbAddInfo").rows[0].cells[1].innerHTML=extraInfo(getElement("TXTDATA"+idxRow).value,3);
   } 
   
 function extraInfo(textfields,noField) {
	 var pos=0
	 var s= textfields;
	 for ( var i=0; i<noField ; i++ ) {
	   pos=textfields.indexOf("<br>",pos+1);
	  }
	 s=textfields.substring(0,pos);
	 return(s);
 }  
function showInq(num) {
	page = "${pageContext.request.contextPath}/servlet/datapro.eibs.client.JSECO0100?SCREEN=900&key=" + num;
	CenterWindow(page,600,500,2);
}
</script>

</head>

<body>
<% 
 if ( !error.getERRNUM().equals("0")  ) {
     error.setERRNUM("0");
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
 }
%>

<h3 align="center">Solicitudes de Convenios<img
	src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left"
	name="EIBS_GIF" title="covenant_approval_list.jsp,ECO0100"></h3>
<hr size="4">
<form method="POST"
	action="<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSECO0100">
<input type="hidden" name="SCREEN" value="201"> 
<input type="hidden" name="selected_customer">
<input type="hidden" name="customer_number" value="<%=(String) request.getAttribute("customer_number") %>">	

<table class="tbenter" width=100% align=center>
	<tr>
		<td class=TDBKG width="35%">
			<div align="center"><a href="javascript:goAction(200)" id="linkApproval"><b>Aprobar</b></a></div>
		</td>		
		<td class=TDBKG width="35%">
			<div align="center"><a href="javascript:goAction(400)" id="linkReject"><b>Eliminar</b></a></div>
		</td>		
		<td class=TDBKG width="30%">
		<div align="center"><a
			href="<%=request.getContextPath()%>/pages/background.jsp"><b>Salir</b></a></div>
		</td>
	</tr>
</table>

<div id="divSearch" class="hiddenDiv">
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
          <div align="right" >Por Sucursal:</div>
        </td>
        <td align=CENTER  > 
          <div align="left"> 
			<eibsinput:help name="searchParameters" fn_param_one="E01SELBRN" property="E01SELBRN" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_BRANCH%>" />
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

 <TABLE  id="mainTable" class="tableinfo" height="70%">
 <tr height="5%">
	<td NOWRAP valign="top" width="80%">
  		<TABLE id="headTable" width="100%" >
			<tr id="trdark">
		  		<TH ALIGN=CENTER nowrap width="5%"><img id="searchIcon"src="<%=request.getContextPath()%>/images/search1.gif" style="cursor : hand;" ></TH>
				<th align="center" nowrap width="15%">N&uacute;mero</th>
				<th align="center" nowrap width="40%">Empleador</th>
				<th align="center" nowrap width="40%">Cliente Convenio</th>
			</tr>
		</table>
		</td>
  		<TD nowrap ALIGN="RIGHT" valign="top" width="20%">
	        <Table id="tbAddInfoH"  width="100%" >
	        <tr id="trdark">
	            <TH ALIGN=CENTER nowrap > Informaci&oacute;n B&aacute;sica</TH>
	        </tr>
	      	</Table>
  		</TD>
  	</TR>
    	<TR height="95%"> 
    	<TD NOWRAP valign="top" width="80%">
			  	<div id="dataDiv1" style=" height:400px; overflow:auto;">  
			    <table id=dataTable cellspacing="0" cellpadding="1" border="0" width="100%" >
			<%
				if (ECO010001List.getNoResult()){
			%>		 
	          <tr id="dataTable"> 
				<TD ALIGN="CENTER" nowrap width="35%" style="color:#d0122c" colspan="5">
					<br><br><br><br> <font size=3>No hay Solicitudes Pendientes de Aprobacion. </font>
				</TD>          
			 </tr>			 
			 
		    <% }else {	
				ECO010001List.initRow();
					int k = 0;
					boolean firstTime = true;
					String chk = "";
					while (ECO010001List.getNextRow()) {
						if (firstTime) {
							firstTime = false;
							chk = "checked";
						} else {
							chk = "";
						}
						ECO010001Message convObj = (ECO010001Message) ECO010001List.getRecord();
			%>
			<tr>
				<td nowrap width="5%" align="center"><input type="radio" name="key" value="<%= ECO010001List.getCurrentRow() %>" onclick="showAddInfo(<%=ECO010001List.getCurrentRow()%>);" <%=chk%>></td>
				<td nowrap width="15%" align="center"><a href="javascript:showInq('<%= ECO010001List.getCurrentRow() %>');"><%= Util.formatCell(convObj.getE01EMPNUM())%></a></td>
				<td nowrap width="40%" align="center"><a href="javascript:showInq('<%= ECO010001List.getCurrentRow() %>');"><%= Util.formatCell(convObj.getE01EMPNA1())%></a></td>
				<td nowrap width="40%" align="center"><a href="javascript:showInq('<%= ECO010001List.getCurrentRow() %>');"><%= Util.formatCell(convObj.getE01CONNA1())%></a>
				<%
					String ls = "";
							ls += Util.formatCell(convObj.getE01EMPCUN()) + "<br>";
							ls += Util.formatCell(convObj.getE01CUSUSR()) + "<br>";
							ls += Util.fcolorCCY(convObj.getE01CUSRMK()) + "&nbsp;<br>";
				%>
				<input type="hidden" name="TXTDATA<%=k%>" value="<%=ls%>">
				</td>
			</tr>
			<%
				}}
			%>
		</table>
		</div>
		</td>
		<td nowrap align="right" valign="top">
			<table id="tbAddInfo" width="100%">
				<tr id="trclear">
					<td>Numero de Cliente : <br>Usuario : <br>Remark : </td>
					<td align="left" valign="middle" nowrap class="tdaddinfo"></td>
				</tr> 
			</table>
		</td>
	</tr>
</table>
<%  if (!ECO010001List.getNoResult()){ %>		 
	<script type="text/javascript">
	     showAddInfo(0);     
	</script> <br>
<% } %>
<script type="text/javascript">
function showHiddenDiv(evt) {
	evt = (evt) ? evt : ((window.event) ? window.event : "");
 	
		var divSearch = document.getElementById("divSearch");

		var y=evt.clientY + document.body.scrollTop;
		var x=evt.clientX + document.body.scrollLeft;
	     
		cancelBub(evt);

		moveElement(divSearch, y, x);
		setVisibility(divSearch, "visible");
	 
}

function closeHiddenDivApproval(){
	setVisibility(getElement("divSearch"), "hidden");
}

getElement("divSearch").onclick = cancelBub;

document.getElementById("searchIcon").onclick = showHiddenDiv; 

addEventHandler(document, 'click', closeHiddenDivApproval);	  

</script>

</form>

</body>
</html>
