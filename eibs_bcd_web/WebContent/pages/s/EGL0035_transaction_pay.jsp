<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<title>Transacciones</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR"
	content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css"	rel="stylesheet">
<link href="<%=request.getContextPath()%>/jquery/plugins/contextMenu/css/jquery.contextMenu.css" rel="stylesheet" type="text/css" />


<SCRIPT SRC="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<SCRIPT	SRC="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>



<jsp:useBean id="trans" class="datapro.eibs.beans.JBListRec"
	scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos"
	scope="session" />
<jsp:useBean id="error" class="datapro.eibs.beans.ELEERRMessage"
	scope="session" />
<jsp:useBean id="transData" class="datapro.eibs.beans.DataTransaction"
	scope="session" />


</head>
<body>
<%
	trans.initRow();
    int blank_row = Integer.parseInt(transData.getTrNum());
    int max_row = 9999;
    int row;
    int total_row;
    try {
      	row = Integer.parseInt(request.getParameter("ROW"));
    } catch (Exception e) {
      	row = 0;
    }
    if ( (row == 0) || (row < trans.getLastRow()) ) {
      	total_row = trans.getLastRow() + 1 + blank_row;
    } else {
		total_row = row;       
    }
    
%>

<SCRIPT type="text/javascript">
<%
  	if ( !userPO.getOption().equals("TRANSACTION") ) {
    	if (userPO.getOption().equals("CD")) {
%>
<%
            if (!userPO.getPurpose().equals("CD_TRANSACTION")) {
%>
	 		   builtNewMenu(cd_m_opt);
<%	
   			} else {
%>
	   			builtNewMenu(cd_t_m_opt);   
<%   
            }
   		} else if (userPO.getOption().equals("LN")) {
%>
	 			builtNewMenu(ln_m_opt);
<%
  		} else if (userPO.getOption().equals("DFT")) {
%>
				builtNewMenu(dft_m_opt);
<%
   		} else if (userPO.getOption().equals("OCK")) {
         	if ( userPO.getHeader19().equals("0")) {
%>		
      			builtNewMenu(of_p_opt);
<%	
   			} else {
%>
	   			builtNewMenu(of_np_opt);
<%   
       		}
   		} else if (userPO.getOption().equals("PR")) {
%>
	 		builtNewMenu(pr_m_opt);
<%   
   		} else if (userPO.getOption().equals("LN_TRANSACTION")) {
%>		
      		builtNewMenu(ln_t_m_opt);
<%	
       	} else if (userPO.getOption().equals("CD_TRANSACTION")) {
%>		
      		builtNewMenu(cd_t_m_opt);
<%	
   		}
%>
  
   		initMenu();
<%  
	}
%>
   	function initPopUpForCode(optHelp, fieldname, bank, ccy, aux1, aux2, transaction) {
	   	var opcode = (transaction.toUpperCase() == "C") ? "9A" : "9B";
	   	init(optHelp, fieldname, bank, ccy, aux1, aux2, opcode);
   	}
   
	function checkRowValue() {
  		var r = <%= total_row %> + parseInt(document.forms[0].TEMP_ROW.value);
  		if (r > <%= max_row %>) {
    		alert("Valor de registros fuera de rango numero maximo es 9999");
  		} else {
    		document.getElementById("ROW").value = r + "";
  		}
	}

	function submitThis(option) {
  		document.getElementById("opt").value = option;
  		if ( option == 4) { 
    		if ( confirm("Esta opcion borrara todo el lote de transacciones") ) { document.forms[0].submit();}
  		} else if ( option == 1) {
      		if ( confirm("Esta opcion borrara las transacciones seleccionadas") ) { document.forms[0].submit();	}
    	} else { document.forms[0].submit();}
 	}
	function getXMLFile() {
		pg = "${pageContext.request.contextPath}/servlet/datapro.eibs.products.JSEIFS100?SCREEN=100";
 		CenterWindow(pg, 800, 200, 2);
	}
	function submitFile(file, dir) {
		document.getElementById("E01PROFIL").value = "Y";
		document.getElementById("E01FILDIR").value = dir;
		document.getElementById("E01FILENA").value = file;
		document.getElementById("opt").value = 6;
		document.forms[0].submit();
	}
	function doPrint() {
 		pg = "${pageContext.request.contextPath}/pages/s/EGL0035_transaction_print.jsp";
 		CenterWindow(pg, 650, 450, 2);
	}

	function setCurrentRow(row) {
		var form = document.forms[0];
   		form["CURRENTROW"].value = row;
   		if ( (form["E01WRKBNK_"+ row].value =="") && (form["E01WRKBRN_"+ row].value =="") && (form["E01WRKCCY_"+ row].value =="")
        	&& (form["E01WRKGLN_"+ row].value =="") && (form["E01WRKCCN_"+ row].value =="") && (form["E01WRKACC_"+ row].value =="")
        	&& (form["E01WRKCDE_"+ row].value =="") && (form["E01WRKAMT_"+ row].value =="") && (form["E01WRKDCC_"+ row].value =="")) {
    		form["E01WRKTDS_"+ row].value = form["E01WRKTDS"].value;
    		form["E01WRKVD1_"+ row].value = form["E01WRKVD1"].value;
    		form["E01WRKVD2_"+ row].value = form["E01WRKVD2"].value;
    		form["E01WRKVD3_"+ row].value = form["E01WRKVD3"].value;
  		}
	}

	function GetInfo(currentrow) {
		var winH = (currentrow == "") ? 400 : 600;
		if (currentrow == "") {
			winH = 500;
		} else {
			setCurrentRow(currentrow);
		}
		pg = "${pageContext.request.contextPath}/pages/s/EGL0035_transaction_info.jsp?CurrRow="+ currentrow;
		CenterNamedWindow(pg, 'Information', 500, winH, 1);           
	}

</SCRIPT>

<% 
 	if ( !error.getERRNUM().equals("0")  ) {
    	error.setERRNUM("0");
 %>
		<SCRIPT type="text/javascript">
            showErrors();
     	</SCRIPT>
<%
 	}
%>

<% 
 	if ( transData.isFlagPrint()  ) {
    	transData.setFlagPrint(false);
    %>
		<SCRIPT type="text/javascript">
            doPrint();
     	</SCRIPT>
<%
 	}
%>
<h3 align="center">Entrada de Multiples Transacciones<img
	src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left"
	name="EIBS_GIF" title="transaction_pay,EGL0035"></h3>
<hr size="4">


<form method="post"
	action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEGL0035">

	<INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="2">
	<INPUT TYPE=HIDDEN id="opt" NAME="opt" VALUE="1">
	<INPUT TYPE=HIDDEN NAME="CURRENTROW" VALUE=""> 
	<input type=HIDDEN name="OPTHELP" value=""> 
	<INPUT TYPE=HIDDEN NAME="totalRow" VALUE="<%= total_row %>">
	<INPUT TYPE=HIDDEN NAME="E01FILDIR" ID="E01FILDIR" VALUE="">
	<INPUT TYPE=HIDDEN NAME="E01FILENA" ID="E01FILENA" VALUE="">
	<INPUT TYPE=HIDDEN NAME="E01PROFIL" ID="E01PROFIL" VALUE="N">
	

<table width="100%" class="tbenter">
	<tr>
		<td align="center" class="TDBKG"><a
			href="javascript:submitThis(1)">Borrar<BR>
		Selección</a></td>
		<td align="center" class="TDBKG"><a
			href="javascript:submitThis(2)">Duplicar<BR>
		Selección</a></td>
		<% if (null != userPO.getType() && userPO.getType().equals("FACT")) { %>
		<td align="center" class="TDBKG"><a
			href="javascript:getXMLFile()">Factura<BR>
		XML</a></td>
		<% } %>
		<td align="center" class="TDBKG"><a
			href="javascript:submitThis(4)">Borrar<BR>
		Lote</a></td>
		<td align="center" class="TDBKG"><a
			href="javascript:submitThis(5)">Imprimir</a></td>
		<td align="center" class="TDBKG"><a
			href="javascript:submitThis(6)">Aceptar</a></td>
		<td align="center" class="TDBKG"><a
			href="javascript:submitThis(7)">Aceptar con<BR>
		Errores</a></td>
	</tr>
</table>
<table class="tableinfo" id="trdark">
	<tr id="trdark">
		<td align="right" nowrap width="21%">
		<%	if (userPO.getOption().equals("LN")) { out.println("Cuenta : ");}
        	else if (userPO.getOption().equals("CD")) { out.println("Certificado : ");}
        	else if (userPO.getOption().equals("OCK")) { out.println("Cheque No. : ");}
        	else if (userPO.getOption().equals("TRANSACTION")) { out.println("Lote : ");}
        %>
		</td>
		<td align="right" nowrap width="21%">
		<div align="left">
		<% if (!userPO.getOption().equals("TRANSACTION")) { 
           if (userPO.getOption().equals("OCK")) { %> <input type="text"
			name="E01NUMACC" size="12" maxlength="11" readonly
			value="<%= transData.getChkNum() %>"> <% } else {%> <input
			type="text" name="E01NUMACC" size="17" maxlength="15" readonly
			value="<%= transData.getAccNum() %>"> <% } 
           } else {%> <input type="text" name="E01BTHNUM" size="6"
			maxlength="5" readonly value="<%= transData.getBthnum() %>">
		<% } %>
		</div>
		</td>
		<td align="left" nowrap width="20%">
		<div align="right">
		<% if (userPO.getOption().equals("TRANSACTION")) { %> Originado : <% } %>
		</div>
		</td>
		<td align="right" nowrap width="33%">
		<div align="left">
		<% if (userPO.getOption().equals("TRANSACTION")) { %> <input type="text"
			name="E01WRKOBK" size="3" maxlength="2" readonly
			value="<%= transData.getBank() %>"> <input type="text"
			name="E01WRKOBR" size="5" maxlength="4" readonly
			value="<%= transData.getBranch() %>"> <% } %>
		</div>
		</td>
		<td align="right" nowrap width="33%">Total Debitos Moneda Base :</td>
		<td align="left" nowrap colspan="3"><input type="text"
			name="DEBIT" size="18" maxlength="15" class="txtright" readonly
			value="<%= transData.getDebitAmt()==null?"":transData.getDebitAmt() %>">
		</td>
	</tr>
	<tr id="trdark">
		<td align="right" nowrap width="21%">Total Transacciones :</td>
		<td align="right" nowrap width="21%">
		<div align="left"><input type="text" id="ROW" name="ROW" size="7"
			maxlength="7" class="txtright" readonly value="<%= total_row %>">
		</div>
		</td>
		<td align="left" nowrap width="20%">&nbsp;</td>
		<td align="right" nowrap width="33%">
		<div align="left"></div>
		</td>
		<td align="right" nowrap width="33%">Total Creditos Moneda Base :</td>
		<td align="left" nowrap colspan="3" width="26%"><input
			type="text" name="CREDIT" size="18" maxlength="15" class="txtright"
			readonly
			value="<%= transData.getCreditAmt()==null?"":transData.getCreditAmt() %>">
		</td>
	</tr>

</table>
<BR>
<table class="tableinfo">
	<tr id="trclear">
		<td align="right" width="17%">Descripcion :</td>
		<td align="left" width="40%" nowrap><input type="text"
			name="E01WRKTDS" size="40" maxlength="300" readonly
			value="<%= transData.getDescription()==null?"":transData.getDescription() %>">
		<a href="javascript:GetInfo('')"><img
			src="<%=request.getContextPath()%>/images/s/info.gif"
			title="Mas Información" align="middle" border="0"></a></td>
		<td align="right" width="14%">Fecha Valor :</td>
		<td align="left" width="29%" nowrap><input type="text"
			name="E01WRKVD1" size="3" maxlength="2" readonly
			value="<%= transData.getDate1()==null?"":transData.getDate1() %>">
		<input type="text" name="E01WRKVD2" size="3" maxlength="2" readonly
			value="<%= transData.getDate2()==null?"":transData.getDate2()  %>">
		<input type="text" name="E01WRKVD3" size="5" maxlength="4" readonly
			value="<%= transData.getDate3()==null?"":transData.getDate3()  %>">
		</td>
	</tr>
</table>
<BR>
<TABLE id="mainTable" class="tableinfo" ALIGN=CENTER>
	<TR height="5%">
		<TD NOWRAP valign="top" width="100%">
		<TABLE id="headTable" width="100%">
			<TR id="trdark">
				<th nowrap>&nbsp;</th>
				<th align="center" nowrap>Bnc</th>
				<th align="center" nowrap>Suc</th>
				<th align="center" nowrap>Mda</th>
				<th align="center" nowrap>Cuenta<br>
				Contable</th>
				<th align="center" nowrap>Centro<br>
				Costo</th>
				<th align="center" nowrap>Número<br>
				Cuenta</th>
				<th align="center" nowrap>TR/CD</th>
				<th align="center" nowrap>Monto</th>
				<th align="center" nowrap>D/C</th>
				<th align="center" nowrap>Origen/<br>
				Destino</th>
				<th nowrap>&nbsp;</th>
			</tr>
		</TABLE>
		</TD>
    </tr>    
    <tr height="95%">    
		<TD NOWRAP>
		<div id="dataDiv1" class="scbarcolor"  style="height:400px;  overflow:auto;">
		<table id="dataTable" width="100%">
		<%
	 		trans.initRow();
            while (trans.getNextRow()) {
	    %>
			<tr id="trclear">
				<td align="center" nowrap><input type="checkbox"
					name="TRANSROW_<%= trans.getCurrentRow() %>" value="checked">
				</td>
				<td align="center" nowrap><input type="text"
					name="E01WRKBNK_<%= trans.getCurrentRow() %>" size="2"
					maxlength="2" value="<%= trans.getRecord(0) %>"
					onFocus="setCurrentRow('<%= trans.getCurrentRow() %>')"
					<% if ( trans.getRecord(24).equals("*")) out.print("class=\"txtchanged\""); %>>
				</td>
				<td align="center" nowrap><input type="text" class="context-menu-help"
					name="E01WRKBRN_<%= trans.getCurrentRow() %>" size="4"
					maxlength="4" onKeypress="enterInteger(event)"
					value="<%= trans.getRecord(1) %>"
					onFocus="setCurrentRow('<%= trans.getCurrentRow() %>')"
					onmousedown="init(branchHelp,this.name,document.forms[0].E01WRKBNK_<%= trans.getCurrentRow() %>.value,'','','','')"
					<% if ( trans.getRecord(24).equals("*")) out.print("class=\"txtchanged\""); %>>
				</td>
				<td align="center" nowrap><input type="text" class="context-menu-help"
					name="E01WRKCCY_<%= trans.getCurrentRow() %>" size="3"
					maxlength="3" value="<%= trans.getRecord(2) %>"
					onFocus="setCurrentRow('<%= trans.getCurrentRow() %>')"
					onmousedown="init(currencyHelp,this.name,document.forms[0].E01WRKBNK_<%= trans.getCurrentRow() %>.value,'','','','')"
					<% if ( trans.getRecord(24).equals("*")) out.print("id=\"txtrchanged\""); else out.print("id=\"txtright\""); %>>
				</td>
				<td align="center" nowrap>
					<input type="text" class="context-menu-help"
					name="E01WRKGLN_<%= trans.getCurrentRow() %>" size="17"
					maxlength="16" onKeypress="enterInteger(event)"
					value="<%= trans.getRecord(3) %>"
					onFocus="setCurrentRow('<%= trans.getCurrentRow() %>')"
					onmousedown="init(ledgerHelp,this.name,document.forms[0].E01WRKBNK_<%= trans.getCurrentRow() %>.value,document.forms[0].E01WRKCCY_<%= trans.getCurrentRow() %>.value,'','','')"
					<% if ( trans.getRecord(24).equals("*")) out.print("id=\"txtrchanged\""); else out.print("id=\"txtright\""); %>>
				</td>
				<td align="center" nowrap><input type="text" class="context-menu-help"
					name="E01WRKCCN_<%= trans.getCurrentRow() %>" size="8"
					maxlength="8" value="<%= trans.getRecord(4) %>"
					onFocus="setCurrentRow('<%= trans.getCurrentRow() %>')"
					onmousedown="init(costcenterHelp,this.name,document.forms[0].E01WRKBNK_<%= trans.getCurrentRow() %>.value,'','','','')"
					<% if ( trans.getRecord(24).equals("*")) out.print("id=\"txtrchanged\""); else out.print("id=\"txtright\""); %>>
				</td>
				<td align="center" nowrap><input type="text" class="context-menu-help"
					name="E01WRKACC_<%= trans.getCurrentRow() %>" size="13"
					maxlength="12" onKeypress="enterInteger(event)"
					value="<%= trans.getRecord(5) %>"
					onFocus="setCurrentRow('<%= trans.getCurrentRow() %>')"
					onmousedown="init(accountHelp,this.name,'','','','','')"
					<% if ( trans.getRecord(24).equals("*")) out.print("id=\"txtrchanged\""); else out.print("id=\"txtright\""); %>>
				</td>
				<td align="center" nowrap><input type="text" class="context-menu-help"
					name="E01WRKCDE_<%= trans.getCurrentRow() %>" size="4"
					maxlength="4" value="<%= trans.getRecord(6) %>"
					onFocus="setCurrentRow('<%= trans.getCurrentRow() %>')"
					onmousedown="init(cnofHelp,this.name,'','','','','20')"
					<% if ( trans.getRecord(24).equals("*")) out.print("id=\"txtrchanged\""); else out.print("id=\"txtright\""); %>>
				</td>
				<td align="center" nowrap><input type="text"
					name="E01WRKAMT_<%= trans.getCurrentRow() %>" size="17"
					maxlength="17" value="<%= trans.getRecord(7) %>"
					onKeypress="enterDecimal(event, 2)"
					onFocus="setCurrentRow('<%= trans.getCurrentRow() %>')"
					<% if ( trans.getRecord(24).equals("*")) out.print("id=\"txtrchanged\""); else out.print("id=\"txtright\""); %>>
				</td>
				<td align="center" nowrap><input type="text" id="E01WRKDCC_<%= trans.getCurrentRow() %>"
					name="E01WRKDCC_<%= trans.getCurrentRow() %>" size="2"
					maxlength="1" value="<%= trans.getRecord(8) %>"
					onFocus="setCurrentRow('<%= trans.getCurrentRow() %>')"
					<% if ( trans.getRecord(24).equals("*")) out.print("id=\"txtrchanged\""); else out.print("id=\"txtright\""); %>>
				</td>
				<td align="center" nowrap><input type="text" class="context-menu-help" name="E01WRKCOD_<%= trans.getCurrentRow() %>" size="6"
					maxlength="4" value="<%= trans.getRecord(50) %>"
					<% if ( trans.getRecord(24).equals("*")) out.print("id=\"txtrchanged\""); else out.print("id=\"txtright\""); %>
					onFocus="setCurrentRow('<%= trans.getCurrentRow() %>')"
					onmousedown="initPopUpForCode(cnofHelp,this.name,'','','','',document.getElementById('E01WRKDCC_<%= trans.getCurrentRow() %>').value)">
				</td>
				<td align="left" nowrap><a
					href="javascript:GetInfo('<%= trans.getCurrentRow()%>')"><img
					src="<%=request.getContextPath()%>/images/s/info.gif"
					title="Mas Información" align="middle" border="0"></a> <input
					type=Hidden name="E01WRKTDS_<%= trans.getCurrentRow()%>" size="40"
					maxlength="300"
					<%if (null != userPO.getType() && !userPO.getType().equals("FACT")) { %>
					value="<%=trans.getRecord(9)+trans.getRecord(15)+trans.getRecord(16)+
                              trans.getRecord(17)+trans.getRecord(18)+trans.getRecord(19)+
							  trans.getRecord(20)+trans.getRecord(21)+trans.getRecord(22)+
							  trans.getRecord(23)%>">
				<% } else { %>
					value="<%=trans.getRecord(9)+trans.getRecord(15)+trans.getRecord(16)+
                              trans.getRecord(17)+trans.getRecord(18)+trans.getRecord(19)+
							  trans.getRecord(20)+trans.getRecord(21)+trans.getRecord(22)%>">
				<% } %>
				<input type=HIdden name="E01WRKDS9_<%= trans.getCurrentRow()%>" 
					size="45" maxlength="45" value="<%= trans.getRecord(23) %>">
				<input type=Hidden name="E01WRKVD1_<%= trans.getCurrentRow()%>"
					size="3" maxlength="2" value="<%= trans.getRecord(10) %>">
				<input type=Hidden name="E01WRKVD2_<%= trans.getCurrentRow()%>"
					size="3" maxlength="2" value="<%= trans.getRecord(11) %>">
				<input type=Hidden name="E01WRKVD3_<%= trans.getCurrentRow()%>"
					size="5" maxlength="4" value="<%= trans.getRecord(12) %>">
				<input type=Hidden name="E01WRKMD1_<%= trans.getCurrentRow()%>"
					size="3" maxlength="2" value="<%= trans.getRecord(37) %>">
				<input type=Hidden name="E01WRKMD2_<%= trans.getCurrentRow()%>"
					size="3" maxlength="2" value="<%= trans.getRecord(38) %>">
				<input type=Hidden name="E01WRKMD3_<%= trans.getCurrentRow()%>"
					size="5" maxlength="4" value="<%= trans.getRecord(39) %>">
				<input type=Hidden name="E01WRKCKN_<%= trans.getCurrentRow()%>"
					size="12" maxlength="11" value="<%= trans.getRecord(27) %>">
				<input type=Hidden name="E01WRKTYP_<%= trans.getCurrentRow()%>"
					size="4" maxlength="4" value="<%= trans.getRecord(25) %>">
				<input type=Hidden name="E01WRKEXR_<%= trans.getCurrentRow()%>"
					size="12" maxlength="11" value="<%= trans.getRecord(13) %>">
				<input type=Hidden name="E01WRKCUN_<%= trans.getCurrentRow()%>"
					size="10" maxlength="9" value="<%= trans.getRecord(26) %>">
				<input type=Hidden name="E01WRKIVP_<%= trans.getCurrentRow()%>" 
				    size="7" maxlength="6" value="<%= trans.getRecord(47) %>">
				<input type=Hidden name="E01WRKIVB_<%= trans.getCurrentRow()%>" 
				    size="17" maxlength="15" value="<%= trans.getRecord(49) %>">		
				<input type=Hidden name="E01WRKCDT_<%= trans.getCurrentRow()%>" 
				    size="5" maxlength="4" value="<%=trans.getRecord(51)%>" >
				<input type=Hidden name="E01WRKRCL_<%= trans.getCurrentRow()%>" 
				    size="15" maxlength="12" value="<%=trans.getRecord(52)%>" >
				<input type=Hidden name="E01WRKUN1_<%= trans.getCurrentRow()%>"
					value="<%= trans.getRecord(48) %>"> <input type=Hidden
					name="DUPLIC_<%= trans.getCurrentRow()%>" size="4" maxlength="4"
					value="<%= trans.getRecord(24) %>"> <input type=Hidden
					name="E01WRKCR2_<%= trans.getCurrentRow()%>"
					value="<%= trans.getRecord(41) %>"> <input type=Hidden
					name="E01WRKUN2_<%= trans.getCurrentRow()%>"
					value="<%= trans.getRecord(42) %>"> <input type=Hidden
					name="E01WRKCR3_<%= trans.getCurrentRow()%>"
					value="<%= trans.getRecord(43) %>"> <input type=Hidden
					name="E01WRKUN3_<%= trans.getCurrentRow()%>"
					value="<%= trans.getRecord(44) %>"></td>
			</tr>
			<tr id="trdark">
				<td nowrap colspan="5"></td>
				<td nowrap colspan="7"><input readonly type="text"
					name="E01TITDSC" size="60" maxlength="60"
					value="<%= trans.getRecord(40).trim()%>"></td>
			</tr>

	<%
            }
			for (int i=trans.getRow(); i < total_row; i++) {
    %>
			<tr id="trclear">
				<td align="center" nowrap><input type="checkbox"
					name="TRANSROW_<%= i %>" value="checked"></td>
				<td align="center" nowrap><input type="text"
					name="E01WRKBNK_<%= i %>" size="2" maxlength="2"
					onFocus="setCurrentRow('<%= i %>')"></td>
				<td align="center" nowrap><input type="text" class="context-menu-help"
					name="E01WRKBRN_<%= i %>" size="4" maxlength="4"
					onKeypress="enterInteger(event)"
					onFocus="setCurrentRow('<%= i %>')"
					onmousedown="init(branchHelp,this.name,document.forms[0].E01WRKBNK_<%= trans.getCurrentRow() %>.value,'','','','')">
				</td>
				<td align="center" nowrap><input type="text" class="context-menu-help"
					name="E01WRKCCY_<%= i %>" size="3" maxlength="3" value=""
					class="txtright" onFocus="setCurrentRow('<%= i %>')"
					onmousedown="init(currencyHelp,this.name,document.forms[0].E01WRKBNK_<%= i %>.value,'','','','')">
				</td>
				<td align="center" nowrap><input type="text" class="context-menu-help"
					name="E01WRKGLN_<%= i %>" size="17" maxlength="16" value=""
					onKeypress="enterInteger(event)" class="txtright"
					onFocus="setCurrentRow('<%= i %>')"
					onmousedown="init(ledgerHelp,this.name,document.forms[0].E01WRKBNK_<%= i %>.value,document.forms[0].E01WRKCCY_<%= i %>.value,'','','')">
				</td>
				<td align="center" nowrap><input type="text" class="context-menu-help"
					name="E01WRKCCN_<%= i %>" size="8" maxlength="8" value=""
					class="txtright" onFocus="setCurrentRow('<%= i %>')"
					onmousedown="init(costcenterHelp,this.name,document.forms[0].E01WRKBNK_<%= i %>.value,'','','','')">
				</td>
				<td align="center" nowrap><input type="text" class="context-menu-help"
					name="E01WRKACC_<%= i %>" size="13" maxlength="12" value=""
					onKeypress="enterInteger(event)" class="txtright"
					onFocus="setCurrentRow('<%= i %>')"
					onmousedown="init(accountHelp,this.name,'','','','','')">
				</td>
				<td align="center" nowrap><input type="text" class="context-menu-help"
					name="E01WRKCDE_<%= i %>" size="4" maxlength="4" value=""
					class="txtright" onFocus="setCurrentRow('<%= i %>')"
					onmousedown="init(cnofHelp,this.name,'','','','','20')">
				</td>
				<td align="center" nowrap><input type="text"
					name="E01WRKAMT_<%= i %>" size="17" maxlength="17" value=""
					class="txtright" onFocus="setCurrentRow('<%= i %>')"
					onKeypress="enterDecimal(event, 2)"></td>
				<td align="center" nowrap><input type="text" id="E01WRKDCC_<%= i %>"
					name="E01WRKDCC_<%= i %>" size="2" maxlength="1" value=""
					class="txtright" onFocus="setCurrentRow('<%= i %>')"></td>
				<td align="center" nowrap><input type="text" class="context-menu-help"
					name="E01WRKCOD_<%= i %>" size="6" maxlength="4" value=""
					class="txtright" onFocus="setCurrentRow('<%= i %>')"
					onmousedown="initPopUpForCode(cnofHelp,this.name,'','','','',document.getElementById('E01WRKDCC_<%= i %>').value)">
				</td>
				<td align="left" nowrap><a
					href="javascript:GetInfo('<%= i %>')"><img
					src="<%=request.getContextPath()%>/images/s/info.gif"
					title="Mas Información" align="middle" border="0"></a> <input
					type=Hidden name="E01WRKTDS_<%= i %>" size="37" maxlength="300"
					value=""> <input type=Hidden name="E01WRKVD1_<%= i %>"
					size="3" maxlength="2" value=""> <input type=Hidden
					name="E01WRKVD2_<%= i %>" size="3" maxlength="2" value="">
				<input type=Hidden name="E01WRKVD3_<%= i %>" size="5" maxlength="4"
					value=""> <input type=Hidden name="E01WRKMD1_<%= i %>"
					size="3" maxlength="2" value=""> <input type=Hidden
					name="E01WRKMD2_<%= i %>" size="3" maxlength="2" value="">
				<input type=Hidden name="E01WRKMD3_<%= i %>" size="5" maxlength="4"
					value=""> <input type=Hidden name="E01WRKCKN_<%= i %>"
					size="10" maxlength="9" value=""> <input type=Hidden
					name="E01WRKTYP_<%= i %>" size="4" maxlength="4" value=" ">
				<input type=Hidden name="E01WRKEXR_<%= i %>" size="12"
					maxlength="11" value=""> <input type=Hidden
					name="E01WRKCUN_<%= i %>" size="10" maxlength="9" value="">
				<input type=Hidden name="E01WRKUN1_<%= i %>" value=""> 
				<input type=Hidden name="DUPLIC_<%= i %>" size="4" maxlength="4" value="">
				<input type=Hidden name="E01WRKCR2_<%= i %>" value=""> 
				<input type=Hidden name="E01WRKUN2_<%= i %>" value="">
				<input type=Hidden name="E01WRKIVP_<%= i %>" size="7" maxlength="6" value=""> 
				<input type=Hidden name="E01WRKIVB_<%= i %>" size="17" maxlength="15" value=""> 
				<input type=Hidden name="E01WRKCDT_<%= i %>" size="5" maxlength="4" value=""> 
				<input type=Hidden name="E01WRKCR3_<%= i %>" value=""> 
				<input type=Hidden name="E01WRKUN3_<%= i %>" value="">
				<input type=Hidden name="E01WRKRCL_<%= i %>" value=""></td>
			</tr>
			<tr id="trdark">
				<td nowrap colspan="5"></td>
				<td nowrap colspan="7"><input readonly type="text"
					name="E01TITDSC_<%= i %>" size="60" maxlength="60"></td>
			</tr>

	<%
    		}
    %>
		</table>
		</div>

		</TD>
	</TR>
</TABLE>

<BR>
<table class="tbenter" width="100%">
	<tr>
		<td width="91%">
		<div align="right">Cantidad de Registros a A&ntilde;adir : <input
			type="text" name="TEMP_ROW" size="4" maxlength="4" value="0"
			onKeypress="enterInteger(event)" onBlur="checkRowValue()"></div>
		</td>
		<td bordercolor="#FFFFFF" class="TDBKG" width="8%"><a
			href="javascript:submitThis(3)">Adicionar</a></td>
	</tr>
</table>
<BR>

</form>
</body>
</html>
