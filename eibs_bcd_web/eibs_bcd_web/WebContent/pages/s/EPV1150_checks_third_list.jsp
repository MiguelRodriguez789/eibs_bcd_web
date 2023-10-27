<!doctype html public "-//w3c//dtd html 4.0 transitional//en">
<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput"%>
<%@ page import="datapro.eibs.master.Util,datapro.eibs.beans.EPV115001Message"%>
<%@ page import="com.datapro.constants.EibsFields"%>

<html>
<head>
<title>Cheques a Terceros</title>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id="EPV115001List" class="datapro.eibs.beans.JBObjList" scope="session" />
<jsp:useBean id="error" class="datapro.eibs.beans.ELEERRMessage" scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </script>

<script type="text/javascript">

function goAction(op) {
	var ok = false;
	var cun = "";
	var pg = "";
	if (op != '200'){	//Checks something is selected
		for(n=0; n<document.forms[0].elements.length; n++) {
			var element = document.forms[0].elements[n];
	      	if (element.name == "key") {	
				if (element.checked == true) {
        			ok = true;
        			break;
				}
	      	}
		}
	} else {
      	ok = true;
	}
	if ( ok ) {
		var confirm1 = true;
      	if (op =='202'){
      		confirm1 = confirm("Desea Eliminar el Cheque a Tercero seleccionado?");
      	}
		if (confirm1){
			document.forms[0].SCREEN.value = op;
			if (op =='202'){//solo para eliminar..
				document.forms[0].submit();				
			}else{
				dir = "<%=request.getContextPath()%>/servlet/datapro.eibs.salesplatform.JSEPV1150?SCREEN="+document.forms[0].SCREEN.value+
					  "&cusNum="+document.forms[0].cusNum.value+"&PorfNum="+document.forms[0].PorfNum.value;		
				if (op =='201' || op =='203'){				
					dir = dir + "&E01PVCSEQ="+document.forms[0].seqNum.value;		
				}	
				CenterWindow(dir,820,325,2);
			}		
		}		
    } else {
		alert("Debe seleccionar un numero de Cheque a Tercero para continuar.");	   
	}
	hideMenu();
}

function setRow(table, row, seq, opc) {
	// Selecciona la fila
	highlightRow(table, row);
	// Marca el radio
	var ctrl = document.forms[0].key;
	if (!ctrl) return;
	var ctrlLen = ctrl.length;
	if (ctrlLen == undefined) {
		ctrl.checked = (ctrl.value == row.toString());
	}
	for (var i = 0; i < ctrlLen; i++) {
		ctrl[i].checked = false;
		if (ctrl[i].value == row.toString()) {
			ctrl[i].checked = true;
		}
	}
	// Asigna la secuencia	
	try {
	  document.forms[0].seqNum.value = seq;
	} catch(e){
	}
	// goAction
	if (opc != undefined) {
		goAction(opc);
		document.getElementById("menuCT").style.display = 'none';
	}
}

function hideMenu() {
	 if (document.getElementById("menuCT").style.display == 'none') {
	   document.getElementById("menuCT").style.display = '';
	 } else {
	   document.getElementById("menuCT").style.display = 'none';
	 }
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

 <% String emp = (String)session.getAttribute("EMPCT");
 	emp = (emp==null)?"":emp;//si es blanco viene llamado por menu, sino viene llamdo desde la pantalla EPV1010
 %>
 <%if ("".equals(emp)){ %>
<h3 align="center">Listado de Cheques a Terceros<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="checks_third_list.jsp,EPV1150"></h3>
<hr size="4">
<%}%>
<form method="POST" action="<%=request.getContextPath()%>/servlet/datapro.eibs.salesplatform.JSEPV1150">
<input type="hidden" name="SCREEN" id="SCREEN" value="201"> 
<input type="hidden" name="seqNum" id="seqNum" value="0">
	
<%if ("".equals(emp)){ %>
  <table  class="tableinfo">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
          <tr>
             <td nowrap width="10%" align="right"> Cliente : 
              </td>
             <td nowrap width="10%" align="left">
	  			<eibsinput:text name="userPO" property="cusNum" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CUSTOMER %>" readonly="true"/>
             </td>
             <td nowrap width="10%" align="right"> Propuesta : 
               </td>
             <td nowrap width="50%"align="left">
   		        <input type="text" name="PorfNum" id="PorfNum" size="13" maxlength="12" value="<%= userPO.getPorfNum()%>" readonly>
             </td>
         </tr>
        </table>
      </td>
    </tr>
  </table>
 <table class="tbenter" style="width: 1000px">
	<tr>
 		<td align="center" class="tdbkg" width="20%"><a href="javascript:goAction('200')"> <b>Crear</b> </a></td> 
		<td align="center" class="tdbkg" width="20%"><a href="javascript:goAction('201')"> <b>Modificar</b> </a></td>
		<td align="center" class="tdbkg" width="20%"><a href="javascript:goAction('202')"> <b>Borrar</b> </a></td>
		<td align="center" class="tdbkg" width="20%"><a href="<%=request.getContextPath()%>/pages/background.jsp"><b>Salir</b></a></td>
	</tr>
 </table>

<%}else if ("A".equals(emp)){%>
    <input type="hidden" name="cusNum" size="13" maxlength="12" value="<%= userPO.getCusNum()%>" readonly>		
    <input type="hidden" name="PorfNum" size="13" maxlength="12" value="<%= userPO.getPorfNum()%>" readonly>
	<h4>Cheques a Terceros</h4>
<%}else{%>
    <input type="hidden" name="cusNum" size="13" maxlength="12" value="<%= userPO.getCusNum()%>" readonly>		
   	<input type="hidden" name="PorfNum" id="PorfNum" size="13" maxlength="12" value="<%= userPO.getPorfNum()%>" readonly>
    <a href="#" onclick="hideMenu();"><b>Cheques a Terceros</b></a>
    <br><br>
    <table id="menuCT" class="tbenter" width="100%" >
      <tr>
        <td align="center" class="tdbkg" width="20%"><a href="javascript:goAction('200')"> <b>Crear</b> </a></td> 
        <td align="center" class="tdbkg" width="20%"><a href="javascript:goAction('201')"> <b>Modificar</b> </a></td>
        <td align="center" class="tdbkg" width="20%"><a href="javascript:goAction('202')"> <b>Borrar</b> </a></td>
      </tr>
    </table>
<%}%>  
 <table  id="mainTable" class="tableinfo" style="height:80px;" width="100%">
   <tr  height="5%"> 
     <td NOWRAP valign="top" width="100%"> 
	<table id="headTable" width="100%">
		<tr id="trdark">
			<th align="center" nowrap width="5%">&nbsp;</th>
			<th align="center" nowrap width="5%">Sec</th>						
			<th align="center" nowrap width="25%">Nombre</th>
			<th align="center" nowrap width="10%">Referencia</th>
			<th align="center" nowrap width="25%">Destino</th>			
			<th align="center" nowrap width="10%">Monto</th>	
			<th align="center" nowrap width="10%">Gravamen</th>
			<th align="center" nowrap width="10%">Total</th>
		</tr>
       </table>
     </td> 
   </tr>    
   <tr  height="95%">    
	    <td nowrap="nowrap">      
	       <div id="dataDiv1" style="height:80px; overflow:auto;"> 
	       <table id="dataTable" cellspacing="0" cellpadding="1" border="0" width="100%">         
			<%	
				double suma = 0;
				double sumb = 0;
				double sumc = 0;
				EPV115001List.initRow();
					int k = 0;
					boolean firstTime = true;
					String chk = "";
					while (EPV115001List.getNextRow()) {
						if (firstTime) {
							firstTime = false;
							chk = "checked";
						} else {
							chk = "";
						}
						EPV115001Message convObj = (EPV115001Message) EPV115001List.getRecord();
						suma += convObj.getBigDecimalE01PVCVAL().doubleValue();
						sumb += convObj.getBigDecimalE01PVCTXA().doubleValue();
						sumc += convObj.getBigDecimalE01PVCTOT().doubleValue();
			%>
			<tr id="dataTable<%= EPV115001List.getCurrentRow() %>">
				<td nowrap align="center" width="5%"><input type="radio" id="key" name="key" value="<%=EPV115001List.getCurrentRow()%>" <%=chk%> class="highlight" onClick="setRow('dataTable',<%=EPV115001List.getCurrentRow()%>,<%=convObj.getE01PVCSEQ()%>)"/></td>
				<td nowrap align="center" width="5%"><a href="javascript:setRow('dataTable',<%=EPV115001List.getCurrentRow()%>,<%=convObj.getE01PVCSEQ()%>,'203')"><%=Util.formatCell(convObj.getE01PVCSEQ())%></a></td>
				<td nowrap align="left"   width="25%"><a href="javascript:setRow('dataTable',<%=EPV115001List.getCurrentRow()%>,<%=convObj.getE01PVCSEQ()%>,'203')"><%=convObj.getE01PVCNME()%></a></td>
				<td nowrap align="left" width="10%"><a href="javascript:setRow('dataTable',<%=EPV115001List.getCurrentRow()%>,<%=convObj.getE01PVCSEQ()%>,'203')"><%=convObj.getE01PVCCQC()%></a></td>
				<td nowrap align="left" width="25%"><a href="javascript:setRow('dataTable',<%=EPV115001List.getCurrentRow()%>,<%=convObj.getE01PVCSEQ()%>,'203')"><%=convObj.getE01PVCDST()%> - <%=convObj.getE01DSCDST()%></a></td>																		
				<td nowrap align="right" width="10%"><a href="javascript:setRow('dataTable',<%=EPV115001List.getCurrentRow()%>,<%=convObj.getE01PVCSEQ()%>,'203')"><%=convObj.getE01PVCVAL() %></a></td>									
				<td nowrap align="right" width="10%"><a href="javascript:setRow('dataTable',<%=EPV115001List.getCurrentRow()%>,<%=convObj.getE01PVCSEQ()%>,'203')"><%=convObj.getE01PVCTXA() %></a></td>									
				<td nowrap align="right" width="10%"><a href="javascript:setRow('dataTable',<%=EPV115001List.getCurrentRow()%>,<%=convObj.getE01PVCSEQ()%>,'203')"><%=convObj.getE01PVCTOT() %></a></td>									
			</tr>
			<% } %>
			<tr>
				<td align="center" nowrap width="5%">&nbsp;</td>
				<td align="center" nowrap width="5%">&nbsp;</td>						
				<td align="center" nowrap width="25%">&nbsp;</td>
				<td align="center" nowrap width="10%">&nbsp;</td>
				<td nowrap align="right" width="25%"><b>TOTAL : </b> </td>
				<td nowrap align="right"" width="10%"><b><%=datapro.eibs.master.Util.formatCCY(suma)%></b></td>
				<td nowrap align="right"" width="10%"><b><%=datapro.eibs.master.Util.formatCCY(sumb)%></b></td>
				<td nowrap align="right"" width="10%"><b><%=datapro.eibs.master.Util.formatCCY(sumc)%></b></td>
			</tr>								
           </table>
         </div>
       </td>
     </tr>
</table>

</form>

<% if (!EPV115001List.getNoResult()) { %> 
<SCRIPT type="text/javascript">
	showChecked("key");
</SCRIPT>
<% } %>
<SCRIPT type="text/javascript">
	document.getElementById("menuCT").style.display = 'none';
</SCRIPT>

</body>
</html>
