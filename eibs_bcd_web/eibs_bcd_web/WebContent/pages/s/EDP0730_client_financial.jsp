<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@ page import="com.datapro.constants.EibsFields"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
<HEAD>
<TITLE>Información Financiera</TITLE>

<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id="mL0730" class="datapro.eibs.beans.EDP073001Message" scope="session" />
<jsp:useBean id="optListN" class="datapro.eibs.beans.JBList" scope="session" />
<jsp:useBean id="optListJ" class="datapro.eibs.beans.JBList" scope="session" />
<jsp:useBean id="optListF"  class="datapro.eibs.beans.JBList" scope="session" />
<jsp:useBean id="optList"  class="datapro.eibs.beans.JBListRec" scope="session" />
<jsp:useBean id="grpList" class="datapro.eibs.beans.JBListRec" scope="session" />
<jsp:useBean id="accList" class="datapro.eibs.beans.JBListRec" scope="session" />
<jsp:useBean id="error" class="datapro.eibs.beans.ELEERRMessage" scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session" />
<jsp:useBean id= "cnofcP4" class= "datapro.eibs.beans.JBList" scope="session" />

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>
<% 
    if ( !error.getERRNUM().equals("0")  ) {
        out.println("<SCRIPT Language=\"Javascript\">");
        error.setERRNUM("0");
        out.println("       showErrors()");
        out.println("</SCRIPT>");
    }
    
%>
<script type="text/javascript">

	function init() {
	}


	function showOption(obj){
 		var i = obj.value;
 		var opt = getElement("ActOpt").value; 
   		getElement("dataGrpTable" + opt).style.display = "none";
   		getElement("dataGrpTable" + i).style.display = "";
   		getElement("ActOpt").value = i;
   		adjustEquTables( getElement("headTable1"), getElement("dataGrpTable"+ i), getElement("dataDiv1"), 1, false);
   		showChecked("GRPNUM"+i);
	}

	function showGrpAcc(flg, idxRow){
  		var i = getElement("ActAccTb").value;
  		var j = getElement("ActOpt").value;
  		var k = getElement("dataGrpTable"+j).rows.length;
  		for (var l=0; l<k; l++) {
  			getElement("dataGrpTable"+j).rows[l].className = "trnormal";
   		}
    	getElement("dataGrpTable"+j).rows[idxRow].className = "trhighlight";
    	getElement("dataAccTable"+i).style.display = "none";
  		getElement("ActAccTb").value = flg;
		var table = getElement("dataAccTable"+flg);
		if (isValidObject(table)) {
			table.style.display = "";
			if (table.rows.length > 0) {
				document.getElementById("ACCINFO").style.display = "";
				showChecked("ACCNUM"+flg);
			} else {
				document.getElementById("ACCINFO").style.display = "none";
			}
		}
		adjustEquTables( getElement("headTable2"), getElement("dataAccTable"+i), getElement("dataDiv2"), 1, false);
	}    

	function setAccInfo(valNA1, idxRow, idxAbsRow, MEMO,grupo){
  		var idx = getElement("ActAccTb").value;
  		var dataTable = getElement("dataAccTable" + idx);
  		for ( var i=0; i<dataTable.rows.length; i++ ) {
       		dataTable.rows[i].className = "trnormal";
    	}
   		dataTable.rows[idxRow].className = "trhighlight";
   		document.forms[0].E01IFMNA1.value = valNA1;
   		document.forms[0].E01IFMGLN.value = trim(dataTable.rows[idxRow].cells[1].innerText);
   		document.forms[0].E01IFMDSC.value = trim(dataTable.rows[idxRow].cells[2].innerText);
   		document.forms[0].E01IFMAMT.value = trim(replaceAll(dataTable.rows[idxRow].cells[3].innerText,","));
   		document.forms[0].E01CNORCD.value = trim(dataTable.rows[idxRow].cells[5].innerText);
   		document.forms[0].E01DPMS01.value = "<%=mL0730.getE01DPMS01().trim()%>";
   		document.forms[0].E01DPXLID.value = trim(dataTable.rows[idxRow].cells[7].innerText);
   		document.forms[0].MEMO.value = MEMO;
   		document.forms[0].ROW.value = idxAbsRow;
		document.forms[0].E01CNORCD.value=grupo;
	}

 	function goUpdVal(){
		document.forms[0].SCREEN.value=8;
		document.forms[0].submit();	 
	}

 	function updval(valNA1, idxRow, idxAbsRow){
  		var idx = getElement("ActAccTb").value;
  		var dataTable = getElement("dataAccTable" + idx);
  		for ( var i=0; i<dataTable.rows.length; i++ ) {
       		dataTable.rows[i].className = "trnormal";
    	}
   		dataTable.rows[idxRow].className = "trhighlight";
   		document.forms[0].E01IFMAMT.value = valNA1;
   		document.forms[0].E01IFMNA1.value = valNA1;
   		document.forms[0].E01IFMGLN.value = trim(dataTable.rows[idxRow].cells[1].innerText);
   		document.forms[0].E01IFMDSC.value = trim(dataTable.rows[idxRow].cells[2].innerText);
   		document.forms[0].E01CNORCD.value = trim(dataTable.rows[idxRow].cells[5].innerText);
   		document.forms[0].E01DPMS01.value = "<%=mL0730.getE01DPMS01().trim()%>";
   		document.forms[0].E01DPXLID.value = trim(dataTable.rows[idxRow].cells[7].innerText);
   		document.forms[0].ROW.value = idxAbsRow;
		document.forms[0].submit();	 
	}

 	function cancelBub(){
  		event.cancelBubble = true;
 	}

 	function goAction(op) {
 		var page = "";
		// LA SIGUIENTE PANTALLA LA MUESTRA EN LA MISMA	CenterNamedWindow(page,'Information',800,600,2);
		// ABRE OTRA PANTALLA SOBRE LA MISMA QUE LA LLAMA				CenterWindow(page,600,600,2);
   		switch (op) {
    	case 1 :
            break;
    	case 2 :
			if ("<%= mL0730.getE01CUSLGT().trim() %>" == "1") {
	            page= "${pageContext.request.contextPath}/pages/s/EDP0730_client_financial_plan_comp.jsp";
 				CenterWindow(page,900,600,2);
			} else {
        	    page= "${pageContext.request.contextPath}/pages/s/EDP0730_client_financial_plan.jsp";
 				CenterWindow(page,900,600,2);
			}
            break;
    	case 3 :
			if ("<%= mL0730.getE01CUSLGT().trim() %>" == "1") {
            	page = "${pageContext.request.contextPath}/servlet/datapro.eibs.creditproposal.JSEDP0730?SCREEN=600";
				CenterWindow(page,900,600,2);
			} else {
            	page = "${pageContext.request.contextPath}/servlet/datapro.eibs.creditproposal.JSEDP0730?SCREEN=300&E01DPBFED="
							+ document.forms[0].E01DPBFED.value;
				CenterWindow(page,900,600,2);
			}
    		break;
    	case 4 :
			if (document.forms[0].MEMO.value!="0") {
	    		document.forms[0].SCREEN.value="4";
		     	document.forms[0].submit();	  	
			}
    		break;
    	case 5 :
			document.forms[0].action.value = op;
			document.forms[0].SCREEN.value="400";
			document.forms[0].submit(); 
    		break;
    	case 6 :
			document.forms[0].action.value = op;
			document.forms[0].SCREEN.value="800";
            page = "${pageContext.request.contextPath}/servlet/datapro.eibs.creditproposal.JSEDP0730?SCREEN=800&E01IFMFEM="
							+ document.forms[0].E01DPBFEM.value +
							"&E01IFMFEY="+ document.forms[0].E01DPBFEY.value +
							"&E01IFMFED="+ document.forms[0].E01DPBFED.value +
							"&E01IFMCFO="+ document.forms[0].E01IFMCFO.value ;
			CenterWindow(page,900,700,2);
    		break;
    	case 7 :
			if ("<%= mL0730.getE01CUSLGT().trim() %>" == "1") {
            	page = "${pageContext.request.contextPath}/servlet/datapro.eibs.creditproposal.JSEDP0739?SCREEN=400&E01DPBFEM="
							+ document.forms[0].E01DPBFEM.value +
							"&E01DPBFEY="+ document.forms[0].E01DPBFEY.value +
							"&E01DPBFED="+ document.forms[0].E01DPBFED.value +
							"&E01IFMCFO="+ document.forms[0].E01IFMCFO.value ;
				CenterWindow(page,1200,700,2);
			} else {
            	page = "${pageContext.request.contextPath}/servlet/datapro.eibs.creditproposal.JSEDP0739?SCREEN=400&E01DPBFEY="
							+ document.forms[0].E01DPBFEY.value +
							"&E01DPBFEM="+ document.forms[0].E01DPBFEM.value +
							"&E01DPBFED="+ document.forms[0].E01DPBFED.value +
							"&E01IFMCFO="+ document.forms[0].E01IFMCFO.value ;
				CenterWindow(page, 1200,700,2);
			}
    		break;
    	case 8 :
			if ("<%= mL0730.getE01CUSLGT().trim() %>" == "1") {
            	page = "${pageContext.request.contextPath}/servlet/datapro.eibs.creditproposal.JSEDP0755?SCREEN=400&E01DPBFEM="
							+ document.forms[0].E01DPBFEM.value +
							"&E01DPBFEY="+ document.forms[0].E01DPBFEY.value +
							"&E01DPBFED="+ document.forms[0].E01DPBFED.value +
							"&E01IFMCFO="+ document.forms[0].E01IFMCFO.value ;
				CenterWindow(page,1000,650,2);
			} else {
            	page = "${pageContext.request.contextPath}/servlet/datapro.eibs.creditproposal.JSEDP0755?SCREEN=400&E01DPBFEY="
							+ document.forms[0].E01DPBFEY.value +
							"&E01DPBFEM="+ document.forms[0].E01DPBFEM.value +
							"&E01DPBFED="+ document.forms[0].E01DPBFED.value +
							"&E01IFMCFO="+ document.forms[0].E01IFMCFO.value ;
				CenterWindow(page, 1000,650,2);
			}
    		break;
    	case 9 :
			if ("<%= mL0730.getE01CUSLGT().trim() %>" == "1") {
            	page = "${pageContext.request.contextPath}/servlet/datapro.eibs.creditproposal.JSEDP0755?SCREEN=400&E01DPBFEM="
							+ document.forms[0].E01DPBFEM.value +
							"&E01DPBFEY="+ document.forms[0].E01DPBFEY.value +
							"&E01DPBFED="+ document.forms[0].E01DPBFED.value +
							"&E01IFMCFO="+ document.forms[0].E01IFMCFO.value +
							"&ANUALIZAR=Y" ;
				CenterWindow(page,1000,650,2);
			} else {
            	page = "${pageContext.request.contextPath}/servlet/datapro.eibs.creditproposal.JSEDP0755?SCREEN=400&E01DPBFEY="
							+ document.forms[0].E01DPBFEY.value +
							"&E01DPBFEM="+ document.forms[0].E01DPBFEM.value +
							"&E01DPBFED="+ document.forms[0].E01DPBFED.value +
							"&E01IFMCFO="+ document.forms[0].E01IFMCFO.value +
							"&ANUALIZAR=Y" ;
				CenterWindow(page, 1000,650,2);
			}
    		break;
    	case 10 :
    		break;
   		}  
 	}

	function goMemo(idxRow){
  		var idx = getElement("ActAccTb").value;
  		var dataTable = getElement("dataAccTable" + idx);
  		for ( var i=0; i<dataTable.rows.length; i++ ) {
       		dataTable.rows[i].className = "trnormal";
    	}
   		dataTable.rows[idxRow].className = "trhighlight";

   		var parameters = "?SCREEN=4";
   		parameters += "&E01IFMCUN=" + getElement("E01IFMCUN").value;
   		parameters += "&E01IFMFEY=" + getElement("E01IFMFEY").value;
   		parameters += "&E01IFMFEM=" + getElement("E01IFMFEM").value;
   		parameters += "&E01IFMFED=" + getElement("E01IFMFED").value;
   		parameters += "&E01IFMCFO=" + getElement("E01IFMCFO").value;
   		parameters += "&E01IFMCFA=" + getElement("E01IFMCFA").value;
   		parameters += "&E01CNORCD=" + getElement("E01CNORCD").value;
   		parameters += "&E01IFMGLN=" + getElement("E01IFMGLN").value;
   		parameters += "&E01IFMDSC=" + getElement("E01IFMDSC").value;
   		parameters += "&MEMO=" + getElement("MEMO").value;
   		parameters += "&ROW=" + document.forms[0].ROW.value;
   		
   		var page = "${pageContext.request.contextPath}/servlet/datapro.eibs.creditproposal.JSEDP0730" + parameters;
   		CenterWindow(page, 1000, 650, 2);
	}

 	function goExit(){
		if (document.forms[0].RETORNO.value != "null" 
			&& document.forms[0].RETORNO.value !=  "") {
			window.location.href= EIBS.context() +"<%=userPO.getHeader11()%>";
		} else {
	   		window.location.href="<%=request.getContextPath()%>/pages/background.jsp";
		}
  	}

	function goConfirm() {
		document.forms[0].submit();	  		  
	}

	function goVal() {
		document.forms[0].SCREEN.value = "6";
		document.forms[0].submit();	  		  
	}

	function selFmt() {
		var selectedItem = document.forms[0].E01IFMCFOW.selectedIndex;
		var selectedText = document.forms[0].E01IFMCFOW.options[selectedItem].text;
		var selectedValue = document.forms[0].E01IFMCFOW.options[selectedItem].value;
		document.forms[0].TITULO.value = selectedText;
		document.forms[0].E01IFMCFO.value = selectedValue;
	}


</script>

</HEAD>

<body onload="javascript:init()">

<h3 align="center">Información Financiera Propuesta de Crédito
	<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="client_financial.jsp,EDP0730"></h3>
<hr size="4">

<h3 align="center"> <%=userPO.getHeader20()%> </h3>

<FORM Method="post" ACTION="<%= request.getContextPath() %>/pages/s/body_wait.jsp?ServletName=<%= request.getContextPath() %>/servlet/datapro.eibs.creditproposal.JSEDP0730">
<INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="2"> 
<INPUT TYPE=HIDDEN NAME="ActRow" VALUE="0"> 
<INPUT TYPE=HIDDEN NAME="ActRowD" VALUE="0"> 
<INPUT TYPE=HIDDEN NAME="ActAccTb" VALUE="0"> 
<INPUT TYPE=HIDDEN NAME="ActGrpTb" VALUE="0"> 
<INPUT TYPE=HIDDEN NAME="ActOpt" VALUE="0"> 
<INPUT type=HIDDEN NAME="E01IFMDSC" value="">
<INPUT type=HIDDEN NAME="E01IFMTYP" value="D"> 
<INPUT type=HIDDEN NAME="E01IFMNA1" value=""> 
<INPUT type=HIDDEN NAME="E01DPMS01" value="">
<INPUT type=HIDDEN NAME="E01DPXLID" value=""> 
<INPUT type=HIDDEN NAME="E01IFMAMT" value=""> 
<INPUT type=HIDDEN NAME="E01IFMGLN" value=""> 
<INPUT type=HIDDEN NAME="E01CNORCD" value="<%= mL0730.getE01CNORCD().trim()%>"> 
<INPUT type=HIDDEN NAME="ROW" value=""> 
<INPUT type=HIDDEN NAME="MEMO" value=""> 
<INPUT type=HIDDEN NAME="TITULO" value=""> 
<INPUT type=HIDDEN NAME="opt" value=""> 
<INPUT type=HIDDEN NAME="action" value=""> 
<INPUT type=HIDDEN NAME="RETORNO" value="<%=userPO.getHeader11()%>" >
<input type=HIDDEN name="E01IFMCFA" value="<%= mL0730.getE01IFMCFA().trim()%>">

<table class="tableinfo">
	<TR>
		<TD NOWRAP>
		<TABLE id="headTable" width="100%" cellpading=0 cellspacing=0>
			<tr id="trdark">
				<td align="right"><b>Cliente :</b></td>
				<td nowrap>
				<input type="text" name="E01IFMCUN" size="12" value="<%=userPO.getHeader1()%>" onKeypress="enterInteger(event)"
				<% if(!userPO.getOption().equals("1")){out.print("readonly");}%> 
				>
				<% if(userPO.getOption().equals("1")) { %> 
	            <a href="javascript:GetCustomerDescId('E01IFMCUN','NAMECUM','')"><img src="<%=request.getContextPath()%>/images/1b.gif" title=". . ." align="middle" border="0" >
				<% };%>
	            </a> 
				</td>
				<td align="right"><b>Nombre :</b></td>
				<td nowrap colspan=3>
				<input type="text" name="NAMECUM" size="45" readonly value="<%=userPO.getHeader2()%>">
				<INPUT type="text" name="E01IFMCIN" size="36" readonly value="<%=userPO.getHeader18()%>"></td>
			</tr>
			<tr id="trdark">
				<td align="right">Dia/Mes/Año Fin<b></b></td>
				<td nowrap>
					<% if(!userPO.getOption().equals("1")) { %>
						<eibsinput:date name="mL0730" fn_month="E01IFMFEM" fn_day="E01IFMFED" fn_year="E01IFMFEY" readonly="true" />
					<% } else { %>
						<eibsinput:date name="mL0730" fn_month="E01IFMFEM" fn_day="E01IFMFED" fn_year="E01IFMFEY" />
					<% } %>				
				</td>

				<td align="right"></td>

				<td nowrap>

				<% if(userPO.getHeader1().equals("")
						|| userPO.getHeader1().equals("0")){%> 
				<SELECT name="E01IFMCFOW" onchange="selFmt()">
					<%optListF.initRow();
					while (optListF.getNextRow()) {
						if (optListF.getFlag().equals("")) { 
							out.println(optListF.getRecord());
						}
					}%>
				</SELECT>
				<%}else{%>
				<% if(mL0730.getE01CUSLGT().equals("1")){%> 
				<SELECT name="E01IFMCFOW" onchange="selFmt()">
					<%optListN.initRow();
					while (optListN.getNextRow()) {
						if (optListN.getFlag().equals("")) { 
							out.println(optListN.getRecord());
						}
					}%>
				</SELECT>
				<%}%>
				<% if(mL0730.getE01CUSLGT().equals("2")){%> 
				<SELECT name="E01IFMCFOW" onchange="selFmt()">
					<%optListJ.initRow();
					while (optListJ.getNextRow()) {
						if (optListJ.getFlag().equals("")) { 
							out.println(optListJ.getRecord());
						}
					}%>
				</SELECT>
				<%}};%>

				<INPUT type="text" name="E01IFMCFO" size="2" readonly value="<%=userPO.getHeader3()%>">
				<INPUT type="text" name="E01DXXCR1" size="25" readonly value="<%=mL0730.getE01DXXCR1()%>">
				<div align="right"> 
					<% if(!userPO.getOption().equals("4")){%> 
					<INPUT id="EIBSBTN0" type="button" name="Submit0" value="Enviar" class="EIBSBTN" onclick="goAction(5)"
					<% if(userPO.getOption().equals("4")){out.print("disabled");}%> >
					<%}%>
				</div>

				</td>
			</tr>
		</table>
		</td>
	</tr>
</table>

<% if (accList.getNoResult()) {%>
<TABLE class="tbenter" width=100% height=30%>
	<TR>
		<TD>
		<% if(!userPO.getOption().equals("1")) { %> 
		
		<div align="center"><font size="3">
		<b> No hay datos que correspondan con su criterio de busqueda </b>
		</font>
		<INPUT type="text" name="TITULO1" size="45" readonly value="<%=userPO.getHeader20()%>"><BR>
		</div>
		<%} else {%>
		<div align="center"><font size="3">
		<b> Ingreso de nuevo estado financiero </b>
		</font></div>
		<%} %>
		</TD>
	</TR>
</TABLE>
<% } else { %>
<TABLE class="tbenter">
	<TR>
		<TD ALIGN=LEFT width="4%" nowrap>
		<SELECT name="OPTION" DISABLED onChange="showOption(this)" style="visibility: hidden">
<%
			optList.initRow();
         	int k = 0;
            while (optList.getNextRow()) {
				if (optList.getFlag().equals("")) {%>
					<option value="<%=optList.getCurrentRow()%>"><%=optList.getRecord(0)%></option>
<% 
					k++;
                }
            }
%>
		</SELECT></TD>
		<TD ALIGN=CENTER width="15%" class=tdbkg><a
			href="javascript:goAction(2)"><b>Estado Financiero</b></a></TD>
		<TD ALIGN=CENTER width="15%" class=tdbkg><a
			href="javascript:goAction(7)"><b>Análisis Variaciones</b></a></TD>
		<TD ALIGN=CENTER width="15%" class=tdbkg><a
			href="javascript:goAction(3)"><b>Indices Financieros</b></a></TD>
		<TD ALIGN=CENTER width="15%" class=tdbkg><a
			href="javascript:goAction(6)"><b>Análisis Aspectos Cuantitativos</b></a></TD>
		<TD ALIGN=CENTER width="15%" class=tdbkg><a
			href="javascript:goAction(8)"><b>Proyección</b></a></TD>
		<TD ALIGN=CENTER width="15%" class=tdbkg><a
			href="javascript:goAction(9)"><b>Proyección Anualizada</b></a></TD>
		<TD ALIGN=CENTER width="15%" class=tdbkg><a 
			href="<%=request.getContextPath()%>/pages/background.jsp"><b>Salir</b></a></TD>
	</TR>
</TABLE>
<table class="tableinfo" width="100%">
	<TR>
		<TD NOWRAP width="100%">
		<TABLE id="headTable" width="100%" cellpading=0 cellspacing=0>
			<tr id="trdark">
				<td align="right"><b>Revisado:</b></td>
				<td nowrap>
				<SELECT name="E01DPBREV" 
				<% if(userPO.getOption().equals("4")){out.print("disabled");}%> 
				>
					<OPTION value=""
						<%if (mL0730.getE01DPBREV().equals("")) { out.print("selected"); }%>></OPTION>
					<OPTION value="1"
						<%if (mL0730.getE01DPBREV().equals("1")) { out.print("selected"); }%>>SI</OPTION>
					<OPTION value="0"
						<%if (!mL0730.getE01DPBREV().equals("1")) { out.print("selected"); }%>>NO</OPTION>
				</SELECT>
				</td>
				<td align="right"><b></b></td>
				<td nowrap colspan=3>
				</td>
<%-- 		<% if((!userPO.getHeader3().equals("A"))&&(!userPO.getHeader3().equals("B"))) { %> 
--%>
				<td align="right" width="344"><b>Periodo: Desde:</b>
					<% if(!userPO.getOption().equals("4")){ %>
						<eibsinput:date name="mL0730" fn_month="E01DPBIEM" fn_day="E01DPBIED" fn_year="E01DPBIEA"  />
					<% } else {%>
						<eibsinput:date name="mL0730" fn_month="E01DPBIEM" fn_day="E01DPBIED" fn_year="E01DPBIEA" readonly="true"  />
					<% } %>
<%-- 
				<%}else{%> 
					<INPUT type=HIDDEN NAME="E01DPBIED" value=""> 
					<INPUT type=HIDDEN NAME="E01DPBIEM" value=""> 
					<INPUT type=HIDDEN NAME="E01DPBIEA" value=""> 
				<%}%> 
--%>
				</td>
				<td align="right" width="282"><b>Hasta:</b>
					<% if(!userPO.getOption().equals("4")){ %>
						<eibsinput:date name="mL0730" fn_month="E01DPBFEM" fn_day="E01DPBFED" fn_year="E01DPBFEY"  />
					<% } else {%>
						<eibsinput:date name="mL0730" fn_month="E01DPBFEM" fn_day="E01DPBFED" fn_year="E01DPBFEY" readonly="true"  />
					<% } %>
				</td>
			</tr>
			
			
			<tr id="trclear">
				
				<td align="right">
					<b>Clase:</b>
				</td>
						
				<td nowrap>
	            	<SELECT name="E01DPBCRE"
					<% if(userPO.getOption().equals("4")){out.print("disabled");}%> 
	            	>
					<OPTION value=""
						<%if (mL0730.getE01DPBCRE().equals("")) { out.print("selected"); }%>></OPTION>
					<OPTION value="1"
						<%if (mL0730.getE01DPBCRE().equals("1")) { out.print("selected"); }%>>Auditado</OPTION>
					<OPTION value="2"
						<%if (mL0730.getE01DPBCRE().equals("2")) { out.print("selected"); }%>>No Auditado</OPTION>
					<OPTION value="3"
						<%if (mL0730.getE01DPBCRE().equals("3")) { out.print("selected"); }%>>Precierre</OPTION>	
				</SELECT>	 
				</td>
				
				<td align="right">
				</td>
				
				<td nowrap colspan=3>
				<B>Auditado:</B></td>


				<td align="left" width="344"><b></b> <INPUT type="text" name="E01DPBAU1"
					size="35" maxlength="35" value="<%=mL0730.getE01DPBAU1()%>"
					<% if(userPO.getOption().equals("4")){out.print("readonly");}%>>
				</td>


				<td align="left" width="282">
					<div align="right">
					<% if(!userPO.getOption().equals("4")){%> 
						<INPUT id="EIBSBTN01" type="button" name="Submit1" value="Enviar" class="EIBSBTN" onclick="goVal()"
							<% if(userPO.getOption().equals("4")){out.print("disabled");}%>>
					<%}%>				
					</div>
				</td>
				
			</tr>
		</table>
		</td>
	</tr>
</table>

	<% if(!mL0730.getH01FLGWK3().equals("5")) { %> 
		<TABLE id="mainTable" class="tableinfo" ALIGN=CENTER width="100%">
			<TR>
				<TD NOWRAP valign="top" width="100%">
				<TABLE id="headTable1">
					<TR id="trdark">
						<TH ALIGN=CENTER NOWRAP></TH>
						<TH ALIGN=CENTER NOWRAP>Descripción</TH>
						<TH ALIGN=CENTER NOWRAP>Monto</TH>
					</TR>
				</TABLE>
				<div id="dataDiv1" class="scbarcolor">
<%
				boolean firstTime = true;
				String grpChk = "";
				String flg = "";
				int accRow = 0;
				int grpRow = 0;
				int selOpt = 0;
				int actAccTb = 0;
				int actGrpTb = 0;
				try {
					accRow = Integer.parseInt(request.getParameter("ROW"));
				} catch (Exception e) {
				}
				accList.setCurrentRow(accRow);
				flg = accList.getFlag();
				actAccTb = Integer.parseInt(flg); //
				try {
					grpRow = Integer.parseInt(flg.substring(1, flg.length()));
					selOpt = Integer.parseInt(flg.substring(0, 1));
				} catch (Exception e) {
				}

				for (int i = 0; i < k; i++) {%>
					<table id="dataGrpTable<%=i%>" style="display: none">
					<%int j = 0;
					firstTime = true;
					grpList.initRow();
					while (grpList.getNextRow()) {
						if (grpList.getFlag().equals("" + i)) {
							if (i == selOpt) {
								grpChk = (grpRow == j) ? "checked" : "";
							} else {
								grpChk = (firstTime) ? "checked" : "";
							}
							firstTime = false;%>
							<TR>
								<TD ALIGN=Center NOWRAP>
									<input type="radio" name="GRPNUM<%=i%>"	value="<%=grpList.getFlag() + "" + j%>" onClick="showGrpAcc(this.value,<%=j%>);showGrpAcc(this.value,<%=j%>)" <%=grpChk%>></TD>
								<TD ALIGN=LEFT NOWRAP>
									<a href="javascript:radioClick('GRPNUM<%=i%>',<%=j%>)"><%=grpList.getRecord(0)%></a>
								</TD>
								<TD ALIGN=RIGHT NOWRAP>
									<DIV>
										<a href="javascript:radioClick('GRPNUM<%=i%>',<%=j%>)"><%=datapro.eibs.master.Util.fcolorCCY(grpList.getRecord(1))%></a>
									</DIV>
								</TD>
							</TR>
<%							j++;
						}
					}
%>
					</table>
<%
				}
%>				
				</div>
				</TD>
			</TR>		
		</TABLE>
		<DIV id="ACCINFO">
			<TABLE class="tbenter" id="opTable">
				<TR>
					<TD ALIGN=CENTER class=tdbkg><a href="javascript:goAction(4)"><b>Memo</b></a></TD>
				</TR>
			</TABLE>
			<A NAME="accounts"> </A>
			<TABLE id="mainTable2" class="tableinfo" ALIGN=CENTER width="100%">
				<TR>
					<TD NOWRAP valign="top" width="100%">
					<TABLE id="headTable2">
						<TR id="trdark">
							<TH ALIGN=CENTER NOWRAP></TH>
							<TH ALIGN=CENTER NOWRAP>Cuenta</TH>
							<TH ALIGN=CENTER NOWRAP>Descripción</TH>
							<TH ALIGN=CENTER NOWRAP>Monto</TH>
							<TH ALIGN=CENTER NOWRAP>Audit</TH>
							<TH ALIGN=CENTER NOWRAP>Grupo</TH>
							<TH ALIGN=CENTER NOWRAP>Sec.</TH>
							<TH ALIGN=CENTER NOWRAP>Tipo</TH>
							<TH ALIGN=CENTER NOWRAP>Memo</TH>
						</TR>
					</TABLE>
					<div id="dataDiv2" class="scbarcolor">
<%
					grpList.initRow();
					int g = 0;
					int h = 0;
					int chgGrp = 0;
					int accRowD = 0;
					while (grpList.getNextRow()) {
						int flg1 = Integer.parseInt(grpList.getFlag()); 
						if (flg1 != chgGrp) {
							chgGrp = flg1;
							g = 0;
						}
%>
						<table id="dataAccTable<%=grpList.getFlag() + "" + g%>" style="display: none">
<%
						String accChk = "";
						accList.initRow();
						int j = 0;
						firstTime = true;
						while (accList.getNextRow()) {
							if (accList.getFlag().equals(grpList.getFlag() + "" + g)) {
								if (accList.getFlag().equals(flg)) {
									accChk = (accRowD == accList.getCurrentRow()) ? "checked" : "";
								} else {
									accChk = (firstTime) ? "checked" : "";
								}
								firstTime = false;
%>
							<TR>

								<TD ALIGN=Center NOWRAP>
            						<input type="HIDDEN" name="DPLGLN<%=h%>" value="<%=accList.getRecord(0)%>">
            						<input type="HIDDEN" name="CNORCD<%=h%>" value="<%=accList.getRecord(5)%>">
									<input type="radio" name="ACCNUM<%=accList.getFlag()%>"
										value="<%=accList.getRecord(3)%>" <%=accChk%>
										onClick="setAccInfo(this.value,'<%=j%>','<%=accList.getCurrentRow()%>','<%=accList.getRecord(10)%>','<%=accList.getRecord(5)%>'))">
								</TD>		
								<TD ALIGN=center NOWRAP>
									<div><a href="javascript:radioClick('ACCNUM<%=accList.getFlag()%>',<%=j%>)"><%=accList.getRecord(0)%></a></DIV>
								</TD>
								<TD ALIGN=LEFT NOWRAP>
									<div><a href="javascript:radioClick('ACCNUM<%=accList.getFlag()%>',<%=j%>)"><%=accList.getRecord(1)%></a></DIV>
								</TD>
								<TD ALIGN=right NOWRAP>
									<div>
<% 
										if (!accList.getRecord(7).equals("Titulo")) {  
											if (!accList.getRecord(7).equals("Calculo")) { 
%>				
											<INPUT type="text" name="VLRCTA<%=h%>" size="21" maxlength="16" value="<%=accList.getRecord(2)%>"  style="text-align: right;" 
<% 
												if(userPO.getOption().equals("4")){out.print("readonly");}
%> 
												onKeypress="enterDecimal(event);setAccInfo(this.value,'<%=j%>','<%=accList.getCurrentRow()%>','<%=accList.getRecord(10)%>', '<%=accList.getRecord(5)%>'); "	>
<% 
											} else { 
%>
											<a href="javascript:radioClick('ACCNUM<%=accList.getFlag()%>',<%=j%>)"><%=datapro.eibs.master.Util.fcolorCCY(accList.getRecord(2))%></a>
<% 
											}  
										} 
%>
									</DIV>
								</TD>
								<TD ALIGN=LEFT NOWRAP>
									<div><a href="javascript:radioClick('ACCNUM<%=accList.getFlag()%>',<%=j%>)"><%=accList.getRecord(4)%> </a></DIV>
								</TD>
								<TD ALIGN=center NOWRAP>
									<div><a href="javascript:radioClick('ACCNUM<%=accList.getFlag()%>',<%=j%>)"><%=accList.getRecord(5)%></a></DIV>
								</TD>
								<TD ALIGN=center NOWRAP>
									<div><a href="javascript:radioClick('ACCNUM<%=accList.getFlag()%>',<%=j%>)"><%=accList.getRecord(6)%></a></DIV>
								</TD>
								<TD ALIGN=center NOWRAP>
									<div><a href="javascript:radioClick('ACCNUM<%=accList.getFlag()%>',<%=j%>)"><%=accList.getRecord(7)%></a></DIV>
								</TD>
								<TD ALIGN=center NOWRAP>
									<div>
										<% if (!accList.getRecord(10).equals("0")) { %>	
											<a href="javascript:goMemo(<%=j%>)">
	                							<img src="<%=request.getContextPath()%>/images/page_properties.gif" alt="Memo" align="bottom" border="0" width="16" height="20" onclick="radioClick('ACCNUM<%=accList.getFlag()%>',<%=j%>)""></a>

										<% } 
										 if (accList.getRecord(11).equals("1")) { %>	
											<a href="javascript:goMemo(<%=j%>)">
	                							<img src="<%=request.getContextPath()%>/images/close_up.gif" alt="Memo" align="bottom" border="0" width="16" height="20" onclick="radioClick('ACCNUM<%=accList.getFlag()%>',<%=j%>)"></a>
										<% } %>
									</DIV>
								</TD>
							</TR>
<%
							j++;
							h++;
						} 
					}
%>
					</table>
<%
					g++;
}%>
    				<input type="HIDDEN" name="RECNUM" value="<%=h%>">					
    				</div>
					</TD>
				</TR>
			</TABLE>			
		</DIV>
		<div align="center"> 
			<% if(!userPO.getOption().equals("4")){%> 
				<INPUT id="EIBSBTN02" type="button" name="Submit2"  class="EIBSBTN" value="Enviar" onclick="goUpdVal()"
			<% if(userPO.getOption().equals("4")){out.print("disabled");}%> 
			<%}%>
			>
		</div>
		
<script type="text/javascript">
   document.forms[0].ActRow.value = <%=accRow%>;
   document.forms[0].ActRowD.value = <%=accRowD%>;
   document.forms[0].ActAccTb.value = "<%=flg%>";
   document.forms[0].ActGrpTb.value = "<%=selOpt%>";
   document.forms[0].ActOpt.value = <%=selOpt%>;
   document.forms[0].OPTION.value = <%=selOpt%>;
   
   showOption(document.forms[0].OPTION);
   
   function resizeDoc() {
		var actvTbGrp = document.forms[0].ActGrpTb.value;
      	var actvTbAcc = document.forms[0].ActAccTb.value;
      	var dataTGrp = getElement("dataGrpTable"+actvTbGrp);
      	var dataTAcc = getElement("dataAccTable"+actvTbAcc);
       	adjustEquTables( getElement("headTable1"), dataTGrp, getElement("dataDiv1"), 1, false);
       	adjustEquTables( getElement("headTable2"), dataTAcc, getElement("dataDiv2"), 1, false);
   }
   
   resizeDoc();
   window.onresize = resizeDoc;

</script>		
		
<% 		} %>
	
<% } %>
</FORM>
</BODY>
</HTML>
