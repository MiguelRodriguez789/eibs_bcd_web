<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput"%>
<%@ page import="datapro.eibs.master.Util,datapro.eibs.beans.ERC000002Message"%>

<!doctype html public "-//w3c//dtd html 4.0 transitional//en">
<%@page import="com.datapro.constants.EibsFields"%>
<html>
<head>
<title>Reconciliacion Bancaria</title>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="<%=request.getContextPath()%>/pages/style.css"
	rel="stylesheet">

<jsp:useBean id="ERC000002List" class="datapro.eibs.beans.JBObjList" scope="session" />
<jsp:useBean id= "rcbank" class= "datapro.eibs.beans.ERC000001Message"  scope="session" />
<jsp:useBean id="error" class="datapro.eibs.beans.ELEERRMessage" scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </script>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>

<script type="text/javascript">

function goAction(op) {
 	document.forms[0].SCREEN.value = op;
 	if (op == 200) {
		document.getElementById("E02RCSSTN").value = document.getElementById("numstm").value; 
		document.getElementById("E02RCSSDD").value = document.getElementById("dateday").value; 
		document.getElementById("E02RCSSDM").value = document.getElementById("datemonth").value; 
		document.getElementById("E02RCSSDY").value = document.getElementById("dateyear").value; 
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

function setValues(numstm, dateday, datemonth,dateyear) {
	document.getElementById("E02RCSSTN").value = numstm; 
	document.getElementById("E02RCSSDD").value = dateday; 
	document.getElementById("E02RCSSDM").value = datemonth; 
	document.getElementById("E02RCSSDY").value = dateyear; 
}

addEventHandler(document, 'click' closeHiddenDivNew);

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

<h3 align="center">Bancos a Reconciliar<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="bancos_reconciliacion_list.jsp,ERC0000"></h3>
<hr size="4">
<form method="POST" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSERC0000">
<input type="hidden" name="SCREEN" value="201"> 

<input type="hidden" id="E02RCSSTN" name="E02RCSSTN" value=""> 
<input type="hidden" id="E02RCSSDD" name="E02RCSSDD" value=""> 
<input type="hidden" id="E02RCSSDM" name="E02RCSSDM" value=""> 
<input type="hidden" id="E02RCSSDY" name="E02RCSSDY" value=""> 


  <table  class="tableinfo">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
          <tr>
             <td nowrap width="20%" align="right"> Codigo Banco : 
              </td>
             <td nowrap width="30%" align="left">
	  			<eibsinput:text name="rcbank" property="E01RCSRBK" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CNOFC %>" readonly="true"/>
             </td>
             <td nowrap width="20%" align="right"> Nombre : 
               </td>
             <td nowrap width="30%"align="left">
	  			<eibsinput:text name="rcbank" property="E01CUSNA1" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_NAME_FULL %>" readonly="true"/>
             </td>
         </tr>
          <tr>
             <td nowrap width="20%" align="right"> Cuenta Banco : 
              </td>
             <td nowrap width="30%" align="left">
	  			<eibsinput:text name="rcbank" property="E01RCSCTA" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CHAR %>" size="20" readonly="true"/>
             </td>
             <td nowrap width="20%" align="right"> Cuenta IBS : 
               </td>
             <td nowrap width="30%"align="left">
	  			<eibsinput:text name="rcbank" property="E01RCSACC" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_ACCOUNT %>" readonly="true"/>
             </td>
         </tr>
        </table>
      </td>
    </tr>
  </table>

<div id="hiddenDivNew" class="hiddenDiv">
    <table id=tbhelp style="border-top-width : 1px;border-right-width : 1px;border-bottom-width : 1px;border-left-width : 1px;
	border-color: #0b23b5;
	border-style : solid solid solid solid;
	filter:progid:DXImageTransform.Microsoft.dropshadow(OffX=3, OffY=3, Color='gray', Positive='true');">
      <tr id="trclear"> 
        <td align=CENTER width="18%"> 
          <div align="right">Numero Cartola :</div>
        </td>
        <td align=CENTER width="34%"> 
          <div align="left"> 
            <input type="text" id="numstm" name="N02RCSSTN" size="13" maxlength="12">
          </div>
        </td>
      </tr>
      <tr id="trdark"> 
        <td align=CENTER width="18%"> 
          <div align="right">Fecha Cartola :</div>
        </td>
        <td align=CENTER width="34%"> 
          <div align="left"> 
            <input type="text" id="dateday" name="N02RCSSDD" size="3" maxlength="2">
            <input type="text" id="datemonth" name="N02RCSSDM" size="3" maxlength="2">
            <input type="text" id="dateyear" name="N02RCSSDY" size="5" maxlength="4">
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
 
<table class="tbenter" width="100%">
	<tr>
		<td align="center" id="eibsNew" class="tdbkg" width="20%"><b>Crear</b></td>
		<td align="center" class="tdbkg" width="20%"><a
			href="javascript:goAction('201')"> <b>Modificar</b> </a></td>
		<td align="center" class="tdbkg" width="20%"><a
			href="javascript:goAction('1150')"> <b>Transacciones</b> </a></td>
		<td align="center" class="tdbkg" width="20%"><a
			href="<%=request.getContextPath()%>/pages/background.jsp"><b>Salir</b></a>
		</td>
	</tr>
</table>

<%
	if (ERC000002List.getNoResult()) {
%>
<table class="tbenter" width=100% height=90%>
	<tr>
		<td>
		<div align="center">
			<font size="3">
				<b> No hay resultados que correspondan a su criterio de búsqueda. </b>
			</font>
		</div>
		</td>
	</tr>
</table>
<%
	} else {
%>

	<table id="headTable" width="100%">
		<tr id="trdark">
			<th align="center" nowrap width="5%"></th>
			<th align="left" nowrap width="20%">Cartola</th>
			<th align="left" nowrap width="20%">Fecha</th>
		</tr>
		<%
			ERC000002List.initRow();
				int k = 0;
				boolean firstTime = true;
				String chk = "";
				while (ERC000002List.getNextRow()) {
					if (firstTime) {
						firstTime = false;
						chk = "checked";
					} else {
						chk = "";
					}
					ERC000002Message statement = (ERC000002Message) ERC000002List
							.getRecord();
		%>
		<tr>
			<td nowrap><input type="radio" name="NUMIDE" value="<%=ERC000002List.getCurrentRow()%>" 
				<%=chk%> onclick="setValues('<%=statement.getE02RCSSTN()%>', '<%=statement.getE02RCSSDD()%>', '<%=statement.getE02RCSSDM()%>', '<%=statement.getE02RCSSDY()%>')"/></td>
			<td nowrap align="left"><a href="javascript:goAction('203');"><%=statement.getE02RCSSTN()%></a></td>
			<td nowrap align="left"><a href="javascript:goAction('203');"><%= Util.formatDate(statement.getE02RCSSDD(),statement.getE02RCSSDM(),statement.getE02RCSSDY()) %></a></td>
		</tr>
		<%
			}
		%>
	</table>


<table class="tbenter" width="98%" align="center">
	<tr>
		<td width="50%" align="left">
		<%
			if (ERC000002List.getShowPrev()) {
					int pos = ERC000002List.getFirstRec() - 13;
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
			if (ERC000002List.getShowNext()) {
					int pos = ERC000002List.getLastRec();
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

