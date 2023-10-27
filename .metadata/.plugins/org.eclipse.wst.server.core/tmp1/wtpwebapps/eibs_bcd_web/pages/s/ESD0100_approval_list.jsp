<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<%@page import="com.datapro.presentation.input.EibsInputFields"%>
<%@page import="com.datapro.eibs.constants.HelpTypes"%>
<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@page import="com.datapro.constants.EibsFields"%>

<HTML>
<HEAD>
<TITLE> Approval Customer List </TITLE>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "searchParameters" class= "datapro.eibs.beans.ESD010001Message"  scope="session" />
<jsp:useBean id= "appList" class= "datapro.eibs.beans.JBList"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />

<script src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>
 
<script language="javascript">
  	var reason = '';
  	var accOfac = '';
  	var page = '';
  	var area = '<%=userPO.getHeader22()%>';

  	function goAction(op) {
    	var op2 = '';
     	if (op == 'Z') {op2 = 'A';} else {op2 = op;}
	
     	getElement("action").value = op2;
     	getElement("reason").value = reason;
     
  		if( getElementChecked("ACCNUM") != null){
	     	if (op == 'R') {
	    		if (confirm("Desea rechazar este registro seleccionado?")) {
					document.forms[0].submit();		
	    		}
	  		}
	  		
	        if (accOfac != "" && op == 'A') {
	        	if (area != '0015' && area != '0020') {
	        		var page = "${pageContext.request.contextPath}/servlet/datapro.eibs.helps.JSEWD0092?shrAcc=" + accOfac + "&shrCategory=ALL" + "&FromRecord=0&shrAction=APV";
		     		CenterWindow(page, 600, 500, 2);
		     	} else {
		     		getElement("reason").value = 'Aprobado Area ' + area;
		     		goAction('Z');
		     	}	
	        } else {
				document.forms[0].submit();
	        }
	        
		  	if(op == 'Search'){
				getElement('SCREEN').value = 5; //Request Filtered List
				getElement('action').value = '';
	        	document.getElementsByTagName('body')[0].className = 'waiting';		        	
	        	document.forms[0].submit();				
		  	}  
  		} else {
		  	if(op == 'Search'){
				getElement('SCREEN').value = 5; //Request Filtered List
				getElement('action').value = '';
	        	document.getElementsByTagName('body')[0].className = 'waiting';		        	
	        	document.forms[0].submit();				
		  	}else{	
				alert("Debe seleccionar un registro.");
		  	}
  		}
 	}
 
 	function goExit(){
  		window.location.href="<%=request.getContextPath()%>/pages/background.jsp";
  	}
  
 	function showAddInfo(idxRow) {
   		if (getElement("STSOFAC"+idxRow).value == "3") {
            accOfac = getElementChecked("ACCNUM").value;
   		} else {
      		accOfac = "";
   		}
   
   		getElement("tbAddInfo").rows[0].cells[1].innerHTML = getElement("TXTDATA"+idxRow).value;
   		
   		for ( var i=0; i<getElement("dataTable").rows.length; i++ ) {
       		getElement("dataTable").rows[i].className = "trnormal";
    	}
   		getElement("dataTable").rows[idxRow].className = "trhighlight";
  	}    
  
	function showInqWarn(fieldValue) {
		var formLength = document.forms[0].elements.length;
   		for (n=0; n<formLength; n++) {
      		var elementName = document.forms[0].elements[n].name;
      		var elementValue = document.forms[0].elements[n].value;
      		if (elementName == "ACCNUM" && elementValue == fieldValue) {
        		document.forms[0].elements[n].click();
        		break;
      		} 
      	}
		page = "${pageContext.request.contextPath}/servlet/datapro.eibs.alerts.JSESD0000?ACCNUM=" + fieldValue;
		CenterWindow(page, 420, 300, 2);    
 	}
 
 	function showInqOFAC(fieldValue) {
		var formLength = document.forms[0].elements.length;
   		for (n=0; n<formLength; n++) {
      		var elementName = document.forms[0].elements[n].name;
      		var elementValue = document.forms[0].elements[n].value;
      		if (elementName == "ACCNUM" && elementValue == fieldValue) {
        		document.forms[0].elements[n].click();
        		break;
      		}
      	}
		page = "${pageContext.request.contextPath}/servlet/datapro.eibs.helps.JSEWD0092?shrAcc=" + fieldValue + "&shrCategory=ALL" + "&FromRecord=0&shrAction=INQ";
		CenterWindow(page, 600, 500, 2);    
 	}

	function checkEnc(obj) {
		if (obj.checked) {
	    	obj.value = "Y"; 
	    	getElement("CHECKENC").value = "Y";
	    } else { 
	    	obj.value="N";
   	    	getElement("CHECKENC").value = "N";
	    }
	}

function custInquiry(cus, ope) {
		if (cus != 0 && cus != 999999999) {
			if (ope != "99") {
	    		showInqApprovalClient(cus,ope);
	    	} else {
				page = "${pageContext.request.contextPath}/servlet/datapro.eibs.client.JSESD1080?SCREEN=8&E01CUN=" + cus;
		     	CenterWindow(page,1000,600,2);
  			}
	    } else { 
	    	alert("Cliente NO Existe aun en el Sistema");
	    }
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
 String titu = "Clientes";
 if (!userPO.getHeader22().equals("CUST") && userPO.getHeader23().equals("2")) titu = "Posibles Coincidencias Listas de Control";
 if (userPO.getHeader22().equals("CUST") && userPO.getHeader23().equals("2")) titu = "Cumplimiento (SARLAFT) / Cambio de Estado)";
 if (userPO.getHeader22().equals("0015") && userPO.getHeader23().equals("2")) titu = "Cumplimiento - Verificación de Extranjero";
 if (userPO.getHeader22().equals("0020") && userPO.getHeader23().equals("2")) titu = "Gerencia de Negocios - Verificación de Extranjero";
%>

<BODY onload="MM_preloadImages('<%=request.getContextPath()%>/images/s/approve_over.gif','<%=request.getContextPath()%>/images/s/reject_over.gif')">
<h3 align="center">Aprobación de <%=titu%>
	<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="approval_list.jsp, ESD0100"> 
</h3>
<hr size="4">
  
<FORM Method="post" Action="<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSESD0100">
<INPUT TYPE=HIDDEN NAME="SCREEN" id="SCREEN" VALUE="2">
<INPUT TYPE=HIDDEN NAME="action" id="action" VALUE="A">
<INPUT TYPE=HIDDEN NAME="reason" id="reason" VALUE="">
<INPUT TYPE=HIDDEN NAME="AREA" id="AREA" VALUE="<%=userPO.getHeader22()%>">   
<INPUT TYPE=HIDDEN NAME="QUEUE" id="QUEUE" VALUE="<%=userPO.getHeader23()%>">
<INPUT TYPE=HIDDEN NAME="totalRow" id="totalRow" VALUE="<%=appList.getLastRec()%>">
<INPUT TYPE=HIDDEN NAME="CHECKENC" id="CHECKENC" VALUE=" ">
   
   <TABLE class="tbenter" width="100%" align=center>   
    <TR>
      <TD class=TDBKG width="33%"> 
        <div align="center"><a href="javascript:goAction('A')" id="linkApproval"><b>Aprobar</b></a></div>
      </TD>
      <TD class=TDBKG width="33%"> 
        <div align="center"><a href="javascript:enterReason('R')" id="linkReject"><b>Rechazar</b></a></div>
      </TD>
      <TD class=TDBKG width="34%"> 
        <div align="center"><a href="<%=request.getContextPath()%>/pages/background.jsp"><b>Salir</b></a></div>
      </TD>
    </TR>
  </TABLE>
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
          <div align="right" > Por País Identificación :</div>
        </td>
        <td align=CENTER  > 
          <div align="left">
				<eibsinput:cnofc name="searchParameters" property="E01SELPID" flag="03" fn_code="E01SELPID" /> 
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
      <tr> 
        <td align=center nowrap colspan="2"> 
		<br>
          <input class="styled-button-Search" type=button name="Submit" value="Enviar" onClick="javascript:goAction('Search')">
        </td>
      </tr>      
    </table>
  </div>  
  

 <TABLE  id="mainTable" class="tableinfo" height="70%">
 	<TR height="5%"> 
   		<TD NOWRAP valign="top" width="70%"> 
    		<TABLE id="headTable" width="100%">
    			<TR id="trdark">  
		 		    <TH ALIGN=CENTER rowspan="2" nowrap width="10%"><img id="searchIcon"src="<%=request.getContextPath()%>/images/search1.gif" style="cursor : hand;" ></TH>
            		<TH ALIGN=CENTER NOWRAP width="10%">Número</TH>
            		<TH ALIGN=CENTER NOWRAP width="50%">Nombre</TH>
            		<TH ALIGN=CENTER NOWRAP width="30%">Identificación</TH>
    			</TR>
       		</TABLE>
  		</TD>
  		<TD nowrap ALIGN="RIGHT" valign="top" width="30%">
	        <Table id="tbAddInfoH"  width="100%" >
	        <tr id="trdark">
	            <TH ALIGN=CENTER nowrap >Información Básica</TH>
	        </tr>
	      	</Table>
  		</TD>
  	</TR>	
  	<TR height="95%"> 
    	<TD NOWRAP valign="top" width="80%">
  
   <div id="dataDiv1" style="height:400px; overflow:auto;">  
   <table id=dataTable cellspacing="0" cellpadding="1" border="0" width="100%" >
			<%  int k = 0;
				
				if (appList.getNoResult()){
			%>	  
	          <tr id="dataTable"> 
				<TD ALIGN="CENTER" nowrap width="35%" style="color: #474747;" colspan="5">
					<br><br><br><br> <font size=3>No hay resultados que correspondan a su criterio de búsqueda </font>
				</TD>          
			 </tr>	  
  
    <%	} else {
    			appList.initRow();
                while (appList.getNextRow()) {
              		out.println(appList.getRecord());
                }
    	}
      %> 
   </table>
   </div>
   </TD>
      <TD nowrap ALIGN="RIGHT" valign="top" width="20%"> 
         <%int row = 0; %>

     <Table id="tbAddInfo" >
      <tr id="trclear">
            <TD  ALIGN="RIGHT"  nowrap ><b>Comentario : <br>
              Tipo : <br>
              País : <br>
              Lote :<br>
              Usuario : 
              </b>
            </TD>
         <TD ALIGN="LEFT" nowrap class="tdaddinfo"></TD>
      </tr>
     </Table>
  </TD>
  </TR>	
</TABLE>

<SCRIPT language="JavaScript">
    showChecked("ACCNUM");
    
	function showHiddenDiv(evt) {
		evt = (evt) ? evt : ((window.event) ? window.event : "");
	 	
			var divSearch = document.getElementById("divSearch");
	
			var y=evt.clientY + document.body.scrollTop;
			var x=evt.clientX + document.body.scrollLeft;
		     
			cancelBub(evt);
	
			moveElement(divSearch, y, x);
			setVisibility(divSearch, "visible");
		 
	}
	
	function closeHiddenDivApproval_CLIENT(){
		setVisibility(getElement("divSearch"), "hidden");
	}

	getElement("divSearch").onclick = cancelBub;
	
	document.getElementById("searchIcon").onclick = showHiddenDiv; 

	document.onclick = closeHiddenDivApproval_CLIENT;      
    
    
</SCRIPT>


</FORM>

</BODY>
</HTML>
