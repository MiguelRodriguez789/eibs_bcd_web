<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<%@page import="com.datapro.eibs.constants.ISOCodes"%>
<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput"%>
<%@page import="com.datapro.constants.EibsFields"%>
<%@ page
	import="java.io.*,java.net.*,datapro.eibs.beans.*,datapro.eibs.master.*,java.math.*"%>

<HTML>
<HEAD>
<TITLE>Lista de Documentos</TITLE>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR"
	content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link href="<%=request.getContextPath()%>/pages/style.css"
	rel="stylesheet">

<%@ page import="datapro.eibs.master.JSEIBSProp" %>

<jsp:useBean id="listImg" class="datapro.eibs.beans.JBListRec" scope="session" />
<jsp:useBean id="msgchk" class="datapro.eibs.beans.ETL051002Message" scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session" />

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"></SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/Ajax.js"></script>
	
<SCRIPT type="text/javascript">

	function loadPage(num, typ, seq) {
  		$('[name="blank_viewer"]', parent.document).attr("src", "<%=request.getContextPath()%>/pages/s/EDI0010_doc_viewer_img_page_help.jsp?PAGE_NAME=" + num + "&TYPE=" + typ + "&SEQNUM=" + seq);
  	}
	
	function showRules() {
		var url = "${pageContext.request.contextPath}/servlet/datapro.eibs.products.JSEDD5500?SCREEN=1&Type=FI&ACTION=C&OPE=V";	
		CenterWindow(url, 800, 660, 2);
	}

	function validateSelect() {
		var rules = "";
		var obj = document.getElementsByName("rulebox");
		for (var i = 0; i < obj.length; i++) {
			if (obj[i].checked) rules += "&RULES=" + obj[i].value;
		}
		var amount = getElement("E02OFMMCH").value.split(',').join("");
		var url = "<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSESD4000";
		PostXMLRequest(url, "SCREEN=930" + rules + "&AMOUNT=" + amount, resultTest, false);
	}
	
	function resultTest(res) {
		alert(res.responseText);
	}
	
	function enter(code) {
		var form = top.opener.document.forms[0];
		var formLength= form.elements.length;
		for (n=0; n<formLength; n++) {
			var elementName = form.elements[n].name;
			if (elementName == top.opener.fieldName){
				form.elements[n].value = code;
  				break;
			}
		}
		top.close();
	}
	
</SCRIPT>

</HEAD>

<BODY>
<%if(!userPO.getHeader11().equals("SIGNERS")){  %>
<h3 align="center">Documentos</h3>
<h4 align="center"><div align="center"><p><%= userPO.getAccNum() %></p></div></h4>
<%}else{ %>
<h3 align="center">Cuenta Cheque: <%= userPO.getPorfNum() %></h3>
<h3 align="center">Cuenta IBS: <%= userPO.getAccNum() %></h3>
<hr size="4">
<% } %>
<FORM id="form1">
<%
	listImg.setCurrentRow(0);
%>

<div style="display: none;"> 
	<input type="text" name="hiddenXX">
</div>
	
<TABLE class="tbenter" align="center" width="250" border="1"
	cellpadding="2" cellspacing="2">
	<TR bgcolor="#CCCCCC">
		<TD ALIGN=CENTER width="95%"><b><%=listImg.getRecord(1)%> </b> <b>
		</b></TD>
	</TR>
	<%if(userPO.getHeader11().equals("SIGNERS")){  %>
	<TR>
	<TD align="center"  class="TDBKG" valign="middle">
			<a href="javascript:showRules()">Ver Reglas</a>
		</TD>
	</TR>
</TABLE>
	<table>
	<%if (userPO.getHeader15().equals("CHK")){ %>
	<tr>
		<td><div>Cheque Nro.:</div></td>
		<td><input type="text" name="NUMCHK" id="NUMCHK" value=<%= msgchk.getE02OFMNCH()%> size="12" maxlength="12" readonly="readonly"></td>
	</tr>
	<tr>
		<td><div>Fecha.:</div></td>
		<td><B>
		<%= msgchk.getE02OFMDAT().substring(6)+"/"+msgchk.getE02OFMDAT().substring(4, 6)+"/"+msgchk.getE02OFMDAT().substring(0, 4)%>
		 </B></td>
	</tr>
	<tr>
		<td><div>ID Beneficiario.:</div></td>
		<td><b><%= msgchk.getE02OFMBID().trim()%></b></td>
	</tr>
	<tr>
		<td><div>Nombre Beneficiario.:</div></td>
		<td><b><%= msgchk.getE02OFMBNF().trim()%></b></td>
	</tr>
	<%} %>
	<tr> 
		<td><div>Monto :</div></td>
		<td><eibsinput:text name="msgchk" property="E02OFMMCH" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>"  /></td>
	</tr>
	</table>
<table align="center">
	<tr>
		<TD class="TDBKG" >
				<a href="javascript:validateSelect()" id="enter"><font color="#ff0000"> Validar</font></a>
		</TD>
		<td></td>
	</tr>
</table>
	
	<%} %>	
<br>
<TABLE width="190" border="0" class="tbenter" align="center">
	<%
		listImg.initRow();
		int pagenum = 0;
		int cont = 0;
		String imgName = "";
		String pagename = "";
		String pagedate = "";
		String seqnum = "";
		String uid = "";
		String type = "";
		String size = "";
		String signature="";
		String rcn = "";
		String rnu = "";
		String signer = "";
		String rule = "";
		String ddi = "";
		String mmi = "";
		String yyi = "";
		String ddf = "";
		String mmf = "";
		String yyf = "";
				

		while (listImg.getNextRow()) {
			pagename = listImg.getRecord(0);
			uid = listImg.getRecord(5);
			if (!seqnum.equals(listImg.getRecord(4))) {
				seqnum = listImg.getRecord(4);
				pagedate = listImg.getRecord(3);
				pagenum = 0;
				imgName = listImg.getRecord(5) + "_" + seqnum + "."
					+ listImg.getRecord(2);
				type = listImg.getRecord(2);
				signer = listImg.getRecord(6);
				signature = listImg.getRecord(7);
				
				if(userPO.getHeader11().equals("SIGNERS")){
					if(listImg.getRecord(16).equals(null) || listImg.getRecord(16).equals("")){
						ddi = "00/";
						mmi = "00/";
						yyi = "0000";
					}else{
						ddi = listImg.getRecord(16).substring(6).equals("99")?"00/":listImg.getRecord(16).substring(6)+"/";
						mmi = listImg.getRecord(16).substring(4, 6).equals("99")?"00/":listImg.getRecord(16).substring(4, 6)+"/";
						yyi = listImg.getRecord(16).substring(0, 4).equals("9999")?"0000":listImg.getRecord(16).substring(0, 4);
					}	
					if(listImg.getRecord(17).equals(null) || listImg.getRecord(17).equals("")){
						ddf = "00/";
						mmf = "00/";
						yyf = "0000";
					}else{
						ddf = listImg.getRecord(17).substring(6).equals("99")?"00/":listImg.getRecord(17).substring(6)+"/";
						mmf = listImg.getRecord(17).substring(4, 6).equals("99")?"00/":listImg.getRecord(17).substring(4, 6)+"/";
						yyf = listImg.getRecord(17).substring(0, 4).equals("9999")?"0000":listImg.getRecord(17).substring(0, 4);
					}	
					rcn = listImg.getRecord(18).equals("C")?"Cliente ":"Entidad ";
					rnu = listImg.getRecord(19);
				}
				
				pagenum++;
				cont++;
	%>
					<TR bgcolor="#bbbbbb">
						<TD ALIGN=LEFT>
						<table width="100%" border="1" cellspacing="0" cellpadding="2">
							<tr>
								<a href="javascript:loadPage('<%=imgName%>', '<%=listImg.getRecord(2)%>',  '<%=seqnum%>')">
								<b>Secuencia <%=seqnum + ""%> </b>: <%=pagedate%><br>
							</tr>
						</table>
						</TD>
					</TR>
	<%
		}
			
	%>
	<%if(!userPO.getHeader11().equals("SIGNERS")){  %>
	<tr>
		<TD align="center" class="TDBKG" valign="middle">
				<a href="javascript:enter('<%=seqnum%>')"><font color="#ff0000"> Aceptar</font></a>
		</TD>
	</tr>
	<tr>
		<TD align="center">
 			<br>
			<hr>
			<br>
		</TD>	
	</TR>
	<%}else{ %>
	<tr>
		<TD  align="center" valign="middle">
				<b>Firmante: <%=rcn + rnu%> </b><br>
		</TD>
	</tr>
	<tr>
		<TD  align="center" valign="middle">
				<b><%=signer%> </b><br>
		</TD>
	</tr>
	<tr>
		<TD align="center" valign="middle">
				<b>Fecha Inicio: 
		<%= ddi+mmi+yyi %>
		 </b><br>
		</TD>
	</tr>
	<tr>	
		<TD align="center" valign="middle">
				<b>Fecha Fin: 
		<%= ddf+mmf+yyf %>
		 </b><br>
		<td>
		</td>
	</tr>
	<tr>
		<TD align="center" valign="middle">
				<b>Firma: <%=signature+"  "%> </b><br>
		</TD>
	</tr>
	
	<tr>
		<TD align="center" class="TDBKG" valign="middle">
			<input type="checkbox" name="rulebox" value="<%=signature%>">
		</TD>
	</tr>
	<%} %>
	<%
		}
	%>
</TABLE>
<%
	listImg.initRow();
	if (listImg.getNextRow()) {
		imgName = listImg.getRecord(5) + "_" + listImg.getRecord(4) + "."
				+ listImg.getRecord(2);
		seqnum = listImg.getRecord(4);
		type = listImg.getRecord(2);
%> 
		<SCRIPT type="text/javascript">
			loadPage('<%=imgName%>', '<%=type%>', '<%=seqnum%>');
		</SCRIPT> <%
 	}
 %>
</FORM>
</BODY>
</HTML>
