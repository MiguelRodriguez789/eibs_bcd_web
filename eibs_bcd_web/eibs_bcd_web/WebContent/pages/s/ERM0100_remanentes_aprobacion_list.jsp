<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<%@page import="com.datapro.presentation.input.EibsInputFields"%>
<%@page import="com.datapro.eibs.constants.HelpTypes"%>
<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@page import="com.datapro.constants.EibsFields"%>
<%@ page import="datapro.eibs.beans.ERM010001Message"%>
<%@ page import="datapro.eibs.master.Util"%>

<html>
<head>
<title>Remanentes</title>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "searchParameters" class= "datapro.eibs.beans.ERM010001Message"  scope="session" />
<jsp:useBean id="ERM010001List" class="datapro.eibs.beans.JBObjList" scope="session" />
<jsp:useBean id="error" class="datapro.eibs.beans.ELEERRMessage" scope="session" />
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </script>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>

<script type="text/javascript">


  function goAction(op,row) {
	var ok = false;
	
    for(n=0; n<document.forms[0].elements.length; n++)
     {
     	var elementName= document.forms[0].elements[n].name;
     	if(elementName == "key") 
     	{
			if (document.forms[0].elements[n].checked == true) {
      			ok = true;
      			break;
			}
     	}
     } 
    
	clickElement("key", row);
    
    
	if( getElementChecked("key") != null){
	    if ( ok ) { 
			document.forms[0].SCREEN.value = op;
			var keysel = document.forms[0].key.value;
			
      		if (op == 'Search'){
				getElement('SCREEN').value = 100; //Request Filtered List
	        	document.getElementsByTagName('body')[0].className = 'waiting';		        	
	        	document.forms[0].submit();				
      		
      		} else if (op == '900') {	//Inquiry
				dir = "<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSERM0100?SCREEN="+document.forms[0].SCREEN.value+
					  "&key="+document.forms[0].keysel.value;			
				CenterWindow(dir,780,500,2);
		   	
      		} else {
				document.forms[0].submit();	
			}
	    }
     } else {
   		if (op == 'Search'){
			getElement('SCREEN').value = 100; //Request Filtered List
        	document.getElementsByTagName('body')[0].className = 'waiting';		        	
        	document.forms[0].submit();	    	 
   		
   		}else{
			alert("Debe seleccionar un convenio para continuar.");	   
	 	
   		}
     }
		
  }

  
 function showAddInfo(idxRow){
    //alert("idx......... " +idxRow);
    document.forms[0].keysel.value=idxRow;
    document.forms[0].key.value=idxRow;
     
   tbAddInfo.rows[0].cells[1].style.color="#d0122c";   
   tbAddInfo.rows[0].cells[1].innerHTML=getElement("TXTDATA"+idxRow).value;//extraInfo(getElement("TXTDATA"+idxRow).value,4);

   		for ( var i=0; i<getElement("dataTable").rows.length; i++ ) {
       		getElement("dataTable").rows[i].className = "trnormal";
    	}
   		getElement("dataTable").rows[idxRow].className = "trhighlight";

   }
      
   
 function extraInfo(textfields,noField) {
	 var pos=0;
	 var s= textfields;
	 for ( var i=0; i<noField ; i++ ) {
	   pos=textfields.indexOf("<br>",pos+1);
	  }
	 s=textfields.substring(0,pos);
	 return(s);
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

<h3 align="center">Aprobacion Remanenetes<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="remanentes_aprobacion_list.jsp,ERM0100"></h3>
	<% String appCode = "97";
		String generic = "";
		String title = "Remanentes";%>	
<hr size="4">
<form method="POST"	action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSERM0100">
<input type="hidden" name="SCREEN" value="200"> 
<input type="hidden" name="keysel" value="">
<input type="hidden" name="totalRow" value="">
<input type="hidden" name="selected_customer">

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
          <div align="right" style="vertical-align: bottom;" > Por Palbara :</div>
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
          <div align="right" >Tipo de Producto :</div>
        </td>
        <td align=CENTER  > 
          <div align="left"> 
              <input type="text" name="E01SELTYP" size="5" maxlength="4" value="<%=searchParameters.getE01SELTYP()%>" class="TXTRIGHT">
              <a href="javascript:GetProductRates('E01SELTYP','<%=appCode%>')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="null" align="bottom" border="0" ></a>           
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
				<a id="linkHelp" href="javascript:GetProduct('E01SELPRD','<%= appCode%>','<%=currUser.getE01UBK()%>','', '<%=generic%>')">
				<img src="<%=request.getContextPath()%>/images/1b.gif" title="null" align="bottom" border="0" />
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

<table class="tbenter" width=100% align=center>
	<tr>
		<td class=TDBKG width="33.3%">
			<div align="center"><a href="javascript:goAction('200')" id="linkApproval"><b>Aprobar</b></a></div>
		</td>
		<td class=TDBKG width="33.3%">
			<div align="center"><a href="javascript:goAction('400')" id="linkReject"><b>Eliminar</b></a></div>
		</td>
		<td class=TDBKG width="33.3%">
		<div align="center"><a
			href="<%=request.getContextPath()%>/pages/background.jsp"><b>Salir</b></a></div>
		</td>
	</tr>
</table>

<TABLE  id="mainTable" class="tableinfo" height="70%">
 <tr height="5%">
	<td NOWRAP valign="top" width="80%">
  		<TABLE id="headTable" width="100%" >
		 <TR id="trdark">
		    <TH ALIGN=CENTER rowspan="2" nowrap width="5%"><img id="searchIcon"src="<%=request.getContextPath()%>/images/search1.gif" style="cursor : hand;" ></TH>
		    <TH ALIGN=CENTER rowspan="2"  nowrap width="15%">Cuenta</TH>
		    <TH ALIGN=CENTER colspan="2"  nowrap width="50%">Cliente</TH>
		    <TH ALIGN=CENTER rowspan="2"  nowrap width="30%">Código de Producto</TH>
		  </TR>
		  <TR id="trdark">
		    <TH ALIGN=CENTER nowrap width="20%">Número</TH>
		    <TH ALIGN=CENTER nowrap width="30%">Nombre</TH>
		  </TR>
		  </TABLE>
	</td>
 	<TD nowrap ALIGN="RIGHT" valign="top" width="20%">
	        <Table id="tbAddInfoH"  width="100%" >
	        <tr id="trdark">
	            <TH ALIGN=CENTER nowrap > Informaci&oacute;n B&aacute;sica</TH>
	        </tr>
	      	</Table>
  	</TD>	
  	</tr>	  
  	<TR height="95%"> 
    	<TD NOWRAP valign="top" width="80%">
			  	<div id="dataDiv1" style=" height:400px; overflow:auto;">  
			    <table id=dataTable cellspacing="0" cellpadding="1" border="0" width="100%" >
		<%  int k = 0;
			if (ERM010001List.isEmpty()){
		%>		 
          <tr id="dataTable"> 
			<TD ALIGN="CENTER" nowrap width="35%" style="color:#d0122c" colspan="5">
				<br><br><br><br> <font size=3>No hay <%=title%> para la Aparobaci&oacute;n con esta criteria. </font>
			</TD>          
		 </tr>
		 <%}else{ 		
				ERM010001List.initRow();
					k = 0;
					boolean firstTime = true;
					String chk = "";
					while (ERM010001List.getNextRow()) {
						if (firstTime) {
							firstTime = false;
							chk = "checked";
						} else {
							chk = "";
						}
						ERM010001Message convObj = (ERM010001Message) ERM010001List.getRecord();
			%>
          <tr id="dataTable<%= ERM010001List.getCurrentRow() %>"> 
            <td NOWRAP  align="center" width="2%"><input type="radio" name="key" id="key" value="<%= ERM010001List.getCurrentRow() %>" <%=chk%> class="highlight" onClick="highlightRow('dataTable', <%= ERM010001List.getCurrentRow() %>); showAddInfo(<%=k%>); //setValue('<%=convObj.getE01RMMACC()%>')" ></td>
				<td nowrap align="center" width="15%"><a href="javascript:goAction('900',<%= ERM010001List.getCurrentRow() %>);"><%= Util.formatCell(convObj.getE01RMMACC())%></a></td>
				<td nowrap align="center" width="20%"><a href="javascript:goAction('900',<%= ERM010001List.getCurrentRow() %>);"><%= Util.formatCell(convObj.getE01RMMCUN())%></a></td>
				<td nowrap align="left" width="30%"><a href="javascript:goAction('900',<%= ERM010001List.getCurrentRow() %>);"><%= Util.formatCell(convObj.getE01CUSNA1())%></a></td>
				<td nowrap align="center" width="30%"><a href="javascript:goAction('900',<%= ERM010001List.getCurrentRow() %>);"><%=Util.formatCell(convObj.getE01RMMTYP() + "/" + convObj.getE01RMMPRO())%></a>
				<%
					String ls = "";
							ls += Util.formatCell(convObj.getE01RMMCUN()) + "<br>";
							ls += Util.formatCell(convObj.getE01RMMUSR()) + "<br>";
							ls += Util.fcolorCCY(convObj.getE01RMMRMK()) + "<br>";
				%>
				<input type="hidden" id="TXTDATA<%=k%>"  name="TXTDATA<%=k%>" value="<%=ls%>">
				</td>
			</tr>
			<%
			k++;
				}
			%>
   </table>
   </div>
     </TD>
   <td nowrap ALIGN="RIGHT" valign="top" width="20%">
     <Table id="tbAddInfo">
      <tr id="trclear"> 
         <TD ALIGN="RIGHT" valign="middle" nowrap><b>Numero de Cliente : <br> Usuario : <br> Remark :<br> </b></TD>
         <TD ALIGN="LEFT" valign="middle" nowrap class="tdaddinfo"></TD>
      </tr>
     </Table>
  </td>
 </tr>	
</TABLE>  

<script type="text/javascript">
    // showAddInfo(0);          
</script> 
<br>
<table class="tbenter" width="98%" align="center">
	<tr>
		<td width="50%" align="left">
		<%
			if (ERM010001List.getShowPrev()) {
					int pos = ERM010001List.getFirstRec() - 13;
					out
							.println("<A HREF=\""
									+ request.getContextPath()
									+ "/servlet/datapro.eibs.products.JSERM0100?SCREEN=3&NameSearch="
									//+ ERM010001List.getSearchText() + "&Type="
									//+ ERM010001List.getSearchType() + "&Pos=" + pos +""
									+ "\"><IMG border=\"0\" src=\""
									+ request.getContextPath()
									+ "/images/s/previous_records.gif\" ></A>");
				}
		%>
		</td>
		<td width="50%" align="right">
		<%
			if (ERM010001List.getShowNext()) {
					int pos = ERM010001List.getLastRec();
					out
							.println("<A HREF=\""
									+ request.getContextPath()
									+ "/servlet/datapro.eibs.products.JSERM0100?SCREEN=3&NameSearch="
									//	+ cifList.getSearchText() + "&Type="
									//	+ cifList.getSearchType() + "&Pos=" + pos
									+ "\"><IMG border=\"0\" src=\""
									+ request.getContextPath()
									+ "/images/s/next_records.gif\" ></A>");
				}
		%>
		</td>
	</tr>
</table>
<%
	}
%>

</form>

<SCRIPT type="text/javascript">

 showChecked("key");
 document.forms[0].totalRow.value=<%= k %>;
 getElement("tbAddInfoH").rows[0].cells[0].height = getElement("headTable").rows[0].cells[0].clientHeight;
   
	function showHiddenDiv(evt) {
		evt = (evt) ? evt : ((window.event) ? window.event : "");
	 	
		var divSearch = document.getElementById("divSearch");
	
		var y = evt.clientY + document.body.scrollTop;
		var x = evt.clientX + document.body.scrollLeft;
		     
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
</SCRIPT>
</body>
</html>
