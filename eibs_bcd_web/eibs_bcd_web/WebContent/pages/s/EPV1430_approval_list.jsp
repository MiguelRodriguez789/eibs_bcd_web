<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<%@ page import="datapro.eibs.master.Util,datapro.eibs.beans.EPV143001Message" %>
<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@page import="com.datapro.constants.EibsFields"%>

<HTML>
<HEAD>
<TITLE> Lista de Cuentas a Aprobar </TITLE>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "searchParameters" class= "datapro.eibs.beans.EPV143001Message"  scope="session" />
<jsp:useBean id= "EPV14301List" class= "datapro.eibs.beans.JBObjList"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />


<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>


<script type="text/javascript">
  	var reason = '';
  	function goAction(op,type,row) {
  		
  		if(row == undefined){
  			row = getElement("CURROW").value;
  		}
      	getElement("reason").value = reason;
  		if(!isNaN(row) && typeof(row) != "undefined"){
	    	if (op == "R"){
	    		if (confirm("Desea rechazar este registro seleccionado?")) {
					getElement("opt").value = 2;
					document.forms[0].submit();		
	    		}
	  		} else if (op == "A") {
	  			if (confirm("Desea aprobar este registro seleccionado?")) {
					getElement("opt").value = 1;
					document.forms[0].submit();		
	    		}
			} else if (op == "I") {
			
				clickElement("CURROW", row);
				
				if( type == 41){ // DESEMBOLSO
					var url = "<%=request.getContextPath()%>/servlet/datapro.eibs.salesplatform.JSEPV0154DADC?SCREEN=" + getElement('SCREEN').value;
					url += "&opt="+1;
					url += "&CURROW=" + getElementChecked('CURROW').value;
				
				}else if(type== 40){ //INGRESSO MANT
					var url = "<%=request.getContextPath()%>/servlet/datapro.eibs.salesplatform.JSEPV0154?SCREEN=" + getElement('SCREEN').value;
					url += "&CURROW=" + getElementChecked('CURROW').value;
					
				}else if(type == 42){//INCR o DISM.
					var url = "<%=request.getContextPath()%>/servlet/datapro.eibs.salesplatform.JSEPV0154DADC?SCREEN=" + getElement('SCREEN').value;
					url += "&opt="+2;
					url += "&CURROW=" + getElementChecked('CURROW').value;
	
				}else if(type == 43){ // CAMBIO ESTATUS
					var url = "<%=request.getContextPath()%>/servlet/datapro.eibs.salesplatform.JSEPV0154DADC?SCREEN=" + getElement('SCREEN').value;
					url += "&opt="+3;
					url += "&CURROW=" + getElementChecked('CURROW').value;
				
				}else if(type == 44){ // CAMBIO TASA
					var url = "<%=request.getContextPath()%>/servlet/datapro.eibs.salesplatform.JSEPV0154DADC?SCREEN=" + getElement('SCREEN').value;
					url += "&opt="+4;
					url += "&CURROW=" + getElementChecked('CURROW').value;
				}
				CenterWindow(url, 1000, 600, 2);
		 	}else if (op == 'Search'){
				getElement('SCREEN').value = 100; //Request Filtered List
	        	document.getElementsByTagName('body')[0].className = 'waiting';		        	
	        	document.forms[0].submit();				
		 	}
				
  		}else{
	 		if (op == 'Search'){
				getElement('SCREEN').value = 100; //Request Filtered List
        		document.getElementsByTagName('body')[0].className = 'waiting';		        	
        		document.forms[0].submit();				
	 		}else{  			
				alert("Debe seleccionar un registro.");
  		
	 		}
	 	}
	 }
 	
	 function goDelete() {
		if( getElement("CURROW") != null){
			if(confirm("Desea eliminar este registro seleccionado?")){
				getElement("opt").value = 3;
				document.forms[0].submit();
			}
			
		}else{
			alert("Debe seleccionar un registro.");
		}
	}
	
 	function extraInfo(textfields, noField) {
 		var pos = 0;
 		var s = "";
 		for ( var i=0; i<noField ; i++ ) {
   			s += "<br>"+textfields[i]+" ";
  		}
 		return s;
 	}	
	
	 function updateSideInfo(textField) {
   		getElement("infobasica").rows[0].cells[1].innerHTML = extraInfo(textField, textField.length);   
	}	
	
</script>

</HEAD>

<BODY onload="MM_preloadImages('<%=request.getContextPath()%>/images/s/approve_over.gif')">

<% 
 	if ( !error.getERRNUM().equals("0")  ) {
     	out.println("<SCRIPT Language=\"Javascript\">");
     	out.println("       showErrors()");
     	out.println("</SCRIPT>");
 	} 
   	userPO.setHeader1("APPROVAL");
%>


<FORM Method="post" Action="<%=request.getContextPath()%>/servlet/datapro.eibs.salesplatform.JSEPV1430" >
<INPUT TYPE=HIDDEN NAME="SCREEN" id="SCREEN" VALUE="800">
<INPUT TYPE=HIDDEN NAME="totalRow" id="totalRow" VALUE="0">
<INPUT TYPE=HIDDEN NAME="reason" id="reason" VALUE="">

<input type=HIDDEN name="opt" id="opt" >

<h3 align="center"> Aprobación de Cupo Rotativo </h3>
<hr size="4">
  	<% String appCode = "L2"; 
  	    String generic = "I";
  		String title = "";%>	
  
<div id="divCredilineaSearch" class="hiddenDiv">
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
				<a id="linkHelp" href="javascript:GetProduct('E01SELPRD','<%= appCode%>','<%=currUser.getE01UBK()%>','', 'E01SELTYP')">
				<img src="${pageContext.request.contextPath}/images/1b.gif" title="null" align="bottom" border="0"/>
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
        <div align="center"><a id="linkApproval" name="linkApproval" href="javascript:goAction('A')"><b>Aprobar</b></a></div>
      </TD>
      <TD class=TDBKG width="25%"> 
        <div align="center"><a id="linkReject" name="linkReject" href="javascript:enterReason('R')"><b>Rechazar</b></a></div>
      </TD>
      <TD class=TDBKG width="25%"> 
        <div align="center"><a href="javascript:goDelete()"><b>Eliminar</b></a></div>
      </TD>
      <TD class=TDBKG width="25%"> 
        <div align="center"><a href="<%=request.getContextPath()%>/pages/background.jsp"><b>Salir</b></a></div>
      </TD>  
    </TR>
  </TABLE>
  
 <TABLE  id="mainTable" class="tableinfo" height="70%">
 <tr height="5%">
	<td NOWRAP valign="top" width="82%">
  		<TABLE id="headTable" width="100%" >
		  <TR id="trdark"> 
		    <TH ALIGN=CENTER rowspan="2" nowrap width="5%"><img id="searchIcon"src="<%=request.getContextPath()%>/images/search1.gif" style="cursor : hand;" ></TH>
		    <TH ALIGN=CENTER rowspan="2" nowrap width="20%">Cuenta</TH>
		    <TH ALIGN=CENTER colspan="2" nowrap width="55%">Cliente</TH>
		    <TH ALIGN=CENTER rowspan="2" nowrap width="20%">C&oacute;digo <br> Producto</TH>
		  </TR>
		  <TR id="trdark"> 
		    <TH ALIGN=CENTER nowrap width="15%">N&uacute;mero</TH>
		    <TH ALIGN=CENTER nowrap width="40%">Nombre</TH>
		  </TR>
 		 </TABLE>
  	</TD>
	<td NOWRAP valign="top" width="18%">
      <Table id="tbAddInfoH"  width="100%">
      <tr id="trdark">
          <TH ALIGN=CENTER rowspan="2"> Informaci&oacute;n B&aacute;sica </TH>
      </tr>
      <tr id="trdark">
      	 <td></td>
      </tr>      
      </Table>
	</TD>
  </TR>	
  	<TR height="95%"> 
    	<TD NOWRAP valign="top" width="82%" >
			  	<div id="dataDiv1" style=" height:400px; overflow:auto;">  
			    <table id=dataTable cellspacing="0" cellpadding="1" border="0" width="100%" >
		<%
			if (EPV14301List.isEmpty()){
		%>		 
          <tr id="dataTable"> 
			<TD ALIGN="CENTER" nowrap width="35%" style="color:#d0122c" colspan="5">
				<br><br><br><br> <font size=3>No hay Cupo Rotativo para la Aparobaci&oacute;n con esta criteria. </font>
			</TD>          
		 </tr>
		 <%}else{ 			    
                EPV14301List.initRow();
				boolean firstTime = true;
				String chk = "";
        		while (EPV14301List.getNextRow()) {
					if (firstTime) {
						firstTime = false;
						chk = "checked";
					} else {
						chk = "";
					}
              	datapro.eibs.beans.EPV143001Message msgList = (datapro.eibs.beans.EPV143001Message) EPV14301List.getRecord();
		 %>

          <tr id="dataTable<%= EPV14301List.getCurrentRow() %>"> 
            <td NOWRAP  align=CENTER width="4%"><input type="radio" name="CURROW" value="<%= EPV14301List.getCurrentRow() %>"  <%=chk%> onClick="highlightRow('dataTable', <%= EPV14301List.getCurrentRow() %>);
            			 updateSideInfo(['<%=msgList.getE01DEARMK().trim()%>','<%= Util.fcolorCCY(msgList.getE01DEAPRI().trim())%>',
            							'<%=msgList.getE01DEACCY().trim() %>','<%=msgList.getE01DEABNK().trim() %>', '<%=msgList.getE01DEABRN().trim() %>',
            							'<%=msgList.getE01DEAGLN().trim() %>','<%=msgList.getE01DEACCN().trim() %>','<%=msgList.getE01DEAUBT().trim() %>', 
            							'<%=msgList.getE01DEAUSR().trim() %>']);" >   
            </td>
            <td NOWRAP  align=CENTER width="16%"><a href="javascript:goAction('I',<%= msgList.getE01DEAOPE().trim()%>,<%= EPV14301List.getCurrentRow()%>);"><%= msgList.getE01DEAACC()%></a></td>
            <td NOWRAP  align=CENTER width="12%"><a href="javascript:goAction('I',<%= msgList.getE01DEAOPE().trim()%>,<%= EPV14301List.getCurrentRow()%>);"><%= msgList.getE01DEACUN() %></a></td>
            <td NOWRAP  align=LEFT width="32%"><a href="javascript:goAction('I',<%= msgList.getE01DEAOPE().trim()%>,<%= EPV14301List.getCurrentRow()%>);"><%= msgList.getE01CUSNA1() %></a></td>
            <td NOWRAP  align=CENTER width="16%"><a href="javascript:goAction('I', <%= msgList.getE01DEAOPE().trim()%>,<%= EPV14301List.getCurrentRow()%>);"><%= msgList.getE01DEAPRO() %></a></td>
          </tr>
          <% }} %>   
          		</table>
   				</div>
   		</TD>
	   <td nowrap ALIGN="LEFT" valign="top" width="18%">
	     <Table id="infobasica" width="100%">
	      <tr id="trclear"> 
	         <!--<TD ALIGN="LEFT" nowrap></TD> THIS IS USED WHEN ONLY DOING WHEN INNER HTML CELL EDIT-->
	         <TD ALIGN="RIGHT" nowrap width="50%"><br><b>Comentario : <br>Monto Cupo : <br>Moneda : <br>Banco : <br>Sucursal : <br>Mayor General : <br>Centro de Costo : <br>Lote : <br>Operador : </b><br></TD>
    	     <TD ALIGN="LEFT" nowrap width="50%" style="color:#d0122c"> </TD>
	      </tr>
	     </Table>
	  </td>
   </TR>
</table>

  <TABLE  class="tbenter" WIDTH="98%" ALIGN="center"  height="10%">
  	<TR>
  		 <TD WIDTH="50%" ALIGN=LEFT height="25">
  		 <% 
        	if ( EPV14301List.getShowPrev() ) {
      			int pos = EPV14301List.getFirstRec() - 51;
      		    out.print("<A HREF=\"" + request.getContextPath() + "/servlet/datapro.eibs.salesplatform.JSEPV1430?SCREEN=100&FromRecord=" + pos + "\" ><img src=\""+request.getContextPath()+"/images/s/previous_records.gif\" border=0></A>");
        	}
  		 %>
  		 </TD>
  		 <TD WIDTH="50%" ALIGN=RIGHT height="25">
  		 <% 
        	if ( EPV14301List.getShowNext() ) {
      			int pos = EPV14301List.getLastRec();
      		    out.print("<A HREF=\"" + request.getContextPath() + "/servlet/datapro.eibs.salesplatform.JSEPV1430?SCREEN=100&FromRecord=" + pos + "\" ><img src=\""+request.getContextPath()+"/images/s/next_records.gif\" border=0></A>");
        	}
  		 %>
  		 </TD>
  	</TR>
  </TABLE>

   				

<SCRIPT type="text/javascript">
	showChecked("CURROW");


		function showHiddenDiv(evt) {
			evt = (evt) ? evt : ((window.event) ? window.event : "");
		 	
				var divCredilineaSearch = document.getElementById("divCredilineaSearch");
		
				var y=evt.clientY + document.body.scrollTop;
				var x=evt.clientX + document.body.scrollLeft;
			     
				cancelBub(evt);
		
				moveElement(divCredilineaSearch, y, x);
				setVisibility(divCredilineaSearch, "visible");
			 
		}
		
		function closeHiddenDivApprovalCREDILINEAS(){
			setVisibility(getElement("divCredilineaSearch"), "hidden");
		}

		getElement("divCredilineaSearch").onclick = cancelBub;
		
		document.getElementById("searchIcon").onclick = showHiddenDiv; 

		addEventHandler(document, 'click', closeHiddenDivApprovalCREDILINEAS);
	
</SCRIPT>


</FORM>

</BODY>
</HTML>
