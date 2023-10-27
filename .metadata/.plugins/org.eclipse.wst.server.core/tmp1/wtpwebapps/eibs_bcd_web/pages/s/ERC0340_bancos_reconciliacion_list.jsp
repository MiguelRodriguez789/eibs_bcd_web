<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput"%>
<%@ page import="datapro.eibs.master.Util,datapro.eibs.beans.ERC034001Message"%>

<!doctype html public "-//w3c//dtd html 4.0 transitional//en">
<%@page import="com.datapro.constants.EibsFields"%>
<html>
<head>
<title>Reconciliacion Bancaria</title>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="<%=request.getContextPath()%>/pages/style.css"
	rel="stylesheet">

<jsp:useBean id="ERC034001List" class="datapro.eibs.beans.JBObjList" scope="session" />
<jsp:useBean id="error" class="datapro.eibs.beans.ELEERRMessage" scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </script>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>

<script type="text/javascript">

function goAction(op) {
 	document.forms[0].SCREEN.value = op;
 	if (op == 200) {
		document.getElementById("E01BRMEID").value = document.getElementById("bank").value; 
		document.getElementById("E01BRMCTA").value = document.getElementById("account").value; 
 	}
    if (op =='202') {
    	if (confirm("Desea Eliminar este Registro Seleccionado?")) {
			document.forms[0].submit();		
     	}
    } else {
		document.forms[0].submit();		
    }
}

function closeHiddenDivNew(){
	setVisibility(document.getElementById("hiddenDivNew"), "hidden");
}

function showHiddenDivNew(evt) {
	evt = (evt) ? evt : ((window.event) ? window.event : "");
 	
	var hiddenDivNew = document.getElementById("hiddenDivNew");

	var y=evt.clientY + document.body.scrollTop;
	var x=evt.clientX + document.body.scrollLeft;
     
	cancelBub(evt);

	moveElement(hiddenDivNew, y, x);
	setVisibility(hiddenDivNew, "visible");
	 
}

function setValues(bank, account) {
	document.getElementById("E01BRMEID").value = bank; 
	document.getElementById("E01BRMCTA").value = account; 
}

addEventHandler(document, 'click' , closeHiddenDivNew);

</SCRIPT>  

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

<h3 align="center">Bancos a Reconciliar<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="bancos_reconciliacion_list.jsp,ERC0340"></h3>
<hr size="4">
<form method="POST"
	action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSERC0340">
<input type="hidden" name="SCREEN" value="201"> 
<input type="hidden" id="E01BRMEID" name="E01BRMEID" value=""> 
<input type="hidden" id="E01BRMCTA" name="E01BRMCTA" value=""> 

<div id="hiddenDivNew" class="hiddenDiv">
    <table id=tbhelp style="border-top-width : 1px;border-right-width : 1px;border-bottom-width : 1px;border-left-width : 1px;
	border-color: #0b23b5;
	border-style : solid solid solid solid;
	filter:progid:DXImageTransform.Microsoft.dropshadow(OffX=3, OffY=3, Color='gray', Positive='true');">
      <tr id="trclear"> 
        <td align=CENTER width="18%"> 
          <div align="right">Codigo Banco :</div>
        </td>
        <td align=CENTER width="34%"> 
          <div align="left"> 
            <input type="text" id="bank" name="N01BRMEID" size="5" maxlength="4">
              <a href="javascript:GetCodeCNOFC('N01BRMEID','X3')">
              <img src="<%=request.getContextPath()%>/images/1b.gif" title=". . ." align="bottom" border="0" ></a> 
          </div>
        </td>
      </tr>
      <tr id="trdark"> 
        <td align=CENTER width="18%"> 
          <div align="right">Numero de Cuenta :</div>
        </td>
        <td align=CENTER width="34%"> 
          <div align="left"> 
            <input type="text" id="account" name="N01BRMCTA" size="23" maxlength="20">
          </div>
        </td>
      </tr>
      <tr id="trclear"> 
        <td align=center nowrap colspan="2"> 
          <input id="EIBSBTN" type=button name="Submit" value="Enviar" onClick="javascript:goAction('200')">
        </td>
      </tr>
    </table>
  </div>

<%
	if (ERC034001List.getNoResult()) {
%>
 
<table class="tbenter" width="100%">
	<tr>
		<td align="center" id="eibsNew" class="tdbkg" width="20%"><b>Crear</b></td>
		<td align="center" class="tdbkg" width="20%"><a
			href="<%=request.getContextPath()%>/pages/background.jsp"><b>Salir</b></a>
		</td>
	</tr>
</table>

<table class="tbenter" width=100% height=90%>
	<tr>
		<td>
		<div align="center">
			<font size="3">
				<b> No hay Resultados que Correspondan a su Criterio de Búsqueda. </b>
			</font>
		</div>
		</td>
	</tr>
</table>
<%
	} else {
%>

 
<table class="tbenter" width="100%">
	<tr>
		<td align="center" id="eibsNew" class="tdbkg" width="20%"><b>Crear</b></td>
		<td align="center" class="tdbkg" width="20%"><a
			href="javascript:goAction('201')"> <b>Modificar</b> </a></td>
		<td align="center" class="tdbkg" width="20%"><a
			href="javascript:goAction('202')"> <b>Borrar</b> </a></td>
		<td align="center" class="tdbkg" width="20%"><a
			href="<%=request.getContextPath()%>/pages/background.jsp"><b>Salir</b></a>
		</td>
	</tr>
</table>

	<table id="headTable" width="100%">
		<tr id="trdark">
			<th align="center" nowrap width="5%"></th>
			<th align="left" nowrap width="5%">Codigo</th>
			<th align="left" nowrap width="50%">Nombre del Banco</th>
			<th align="left" nowrap width="20%">Cuenta Banco</th>
			<th align="left" nowrap width="20%">Cuenta IBS</th>
		</tr>
		<%
			ERC034001List.initRow();
				int k = 0;
				boolean firstTime = true;
				String chk = "";
				while (ERC034001List.getNextRow()) {
					if (firstTime) {
						firstTime = false;
						chk = "checked";
					} else {
						chk = "";
					}
					ERC034001Message brmst = (ERC034001Message) ERC034001List
							.getRecord();
		%>
		<tr>
			<td nowrap><input type="radio" name="NUMIDE" value="<%=ERC034001List.getCurrentRow()%>" <%=chk%> onclick="setValues('<%=brmst.getE01BRMEID()%>', '<%=brmst.getE01BRMCTA()%>')"/></td>
			<td nowrap align="left"><a href="javascript:goAction('203');"><%=Util.formatCell(brmst.getE01BRMEID())%></a></td>
			<td nowrap align="left"><a href="javascript:goAction('203');"><%=brmst.getE01BRMNME()%></a></td>
			<td nowrap align="left"><a href="javascript:goAction('203');"><%=brmst.getE01BRMCTA()%></a></td>
			<td nowrap align="left"><a href="javascript:goAction('203');"><%=brmst.getE01BRMACC()%></a></td>
		</tr>
		<%
			}
		%>
	</table>


<table class="tbenter" width="98%" align="center">
	<tr>
		<td width="50%" align="left">
		<%
			if (ERC034001List.getShowPrev()) {
					int pos = ERC034001List.getFirstRec() - 13;
					out
							.println("<A HREF=\""
									+ request.getContextPath()
									+ "/servlet/datapro.eibs.client.JSERC0340?SCREEN=100&codNum="
									+ request.getAttribute("codNum")
									+ "\"><IMG border=\"0\" src=\""
									+ request.getContextPath()
									+ "/images/s/previous_records.gif\" ></A>");
				}
		%>
		</td>
		<td width="50%" align="right">
		<%
			if (ERC034001List.getShowNext()) {
					int pos = ERC034001List.getLastRec();
					out
							.println("<A HREF=\""
									+ request.getContextPath()
									+ "/servlet/datapro.eibs.client.JSERC0340?SCREEN=100&codNum="
									+ request.getAttribute("codNum")
									+ "\"><IMG border=\"0\" src=\""
									+ request.getContextPath()
									+ "/images/s/previous_records.gif\" ></A>");
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
	clickElement('NUMIDE', '0');
 	document.getElementById("hiddenDivNew").onclick=cancelBub;
	document.getElementById("eibsNew").onclick=showHiddenDivNew;  
</SCRIPT>
</body>
</html>

