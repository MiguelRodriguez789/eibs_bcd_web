<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput"%>
<%@ page import="datapro.eibs.master.Util,datapro.eibs.beans.ECO004001Message"%>
<%@page import="com.datapro.constants.EibsFields"%>

<html>
<head>
<title>Asignar Convenios Lista</title>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id="list" class="datapro.eibs.beans.JBObjList" scope="session" />
<jsp:useBean id="header" class="datapro.eibs.beans.ECO004002Message"  scope="session" />
<jsp:useBean id="msg" class="datapro.eibs.beans.ECO004001Message"  scope="session" />
<jsp:useBean id="error" class="datapro.eibs.beans.ELEERRMessage" scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>
<jsp:useBean id="currUser" class="datapro.eibs.beans.ESS0030DSMessage" scope="session" />

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </script>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>

<script type="text/javascript">

function goAction(op) {
	getElement("SCREEN").value = op;
    
    if (op == '300') {
    	if (confirm("Desea eliminar este registro seleccionado?")) {
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

addEventHandler(document, 'click', closeHiddenDivNew);

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

<h3 align="center">Lista de Convenios Asignados<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="asignar_list.jsp,ECO0040"></h3>
<hr size="4">
<form method="POST" action="<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSECO0040">
<input type="hidden" id="SCREEN" name="SCREEN" value="4"> 
 
<div id="hiddenDivNew" class="hiddenDiv">
    <table id=tbhelp style="border-top-width : 1px;border-right-width : 1px;border-bottom-width : 1px;border-left-width : 1px;
	border-color: #0b23b5;
	border-style : solid solid solid solid;
	filter:progid:DXImageTransform.Microsoft.dropshadow(OffX=3, OffY=3, Color='gray', Positive='true');">
      <tr id="trdark"> 
        <td align=CENTER width="18%"> 
          <div align="right">Convenio :</div>
        </td>
        <td align=CENTER width="34%"> 
          <div align="left">
	          <input type="text" name="E01CCNCOD" size="5" maxlength="4" value="<%= msg.getE01CCNCOD().trim()%>">
              <a href="javascript:GetCodeDescDeal('E01CCNCOD','E01CCNDSC')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="bottom" border="0" ></a> 
              <input type="hidden" name="E01CCNDSC">
          </div>
        </td>
      </tr>
      <tr id="trclear"> 
        <td align=center nowrap colspan="2"> 
          <input id="EIBSBTN" type=button name="Submit" value="Enviar" onClick="javascript:goAction('400')">
        </td>
      </tr>
    </table>
</div>

  <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
          <tr id="trdark"> 
            <td nowrap width="16%" > 
              <div align="right"><b>Cliente :</b></div>
            </td>
            <td nowrap width="16%" > 
              <div align="left"> 
                <input type="text" name="E02CCNCUN" size="10" maxlength="9" value="<%= header.getE02CCNCUN().trim()%>" readonly>
              </div>
            </td>
            <td nowrap width="16%" > 
              <div align="right"><b>Nombre :</b></div>
            </td>
            <td nowrap colspan="3" > 
              <div align="left"> 
                <input type="text" name="E02CUSNA1" size="50" maxlength="45" value="<%= header.getE02CUSNA1().trim()%>" readonly>
              </div>
            </td>
            <td nowrap width="16%" > 
              <div align="right"><b>Identificacion :</b></div>
            </td>
            <td nowrap width="16%" > 
              <div align="left"> 
                <input type="text" name="E02CCNIDE" size="13" maxlength="12" value="<%= header.getE02CCNIDE().trim()%>" readonly>
              </div>
            </td>
		</tr>
       </table>
      </td>
    </tr>
  </table>

<table class="tbenter" width="100%" height="10%">
	<tr>
		<td align="center" id="eibsNew" class="tdbkg" width="50%"><b>Asignar</b></td>
		<td align="center" class="tdbkg" width="50%"><a href="javascript:goAction('300')"> <b>Borrar</b> </a></td>
	</tr>
</table>

<% if (list.getNoResult()) { %>
<table class="tbenter" width=100% height=80%>
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
<% } else { %>

  <TABLE  id="mainTable" class="tableinfo" style="height:400px;">
    <tr  height="5%"> 
      <td NOWRAP valign="top" width="100%"> 
		<table id="headTable" width="100%">
			<tr id="trdark">
				<th align="center" nowrap width="5%">&nbsp;</th>
				<th align="center" nowrap width="25%">Convenio</th>
				<th align="center" nowrap width="45%">Descripci&oacute;n</th>
				<th align="center" nowrap width="25%">Vence</th>
			</tr>
        </table>
      </td>
    </tr>    
		  <tr  height="95%">    
		    <td nowrap="nowrap">      
		       <div id="dataDiv1" style="height:400px; overflow:auto;"> 
		       <table id="dataTable" cellspacing="0" cellpadding="1" border="0" width="100%">         
		<%
			list.initRow();
				boolean firstTime = true;
				String chk = "";
				while (list.getNextRow()) {
					if (firstTime) {
						firstTime = false;
						chk = "checked";
					} else {
						chk = "";
					}
					ECO004001Message data = (ECO004001Message) list.getRecord();
		%>
		<tr id="dataTable<%= list.getCurrentRow() %>">
			<td nowrap align="center" width="5%"><input type="radio" id="key" name="key" value="<%=list.getCurrentRow()%>" <%=chk%> class="highlight" onClick="highlightRow('dataTable', <%= list.getCurrentRow() %>)"/></td>
			<td nowrap align="center" width="25%"><%=data.getE01CCNCOD()%></td>
			<td nowrap align="left" width="45%"><%=data.getE01CCNDSC()%></td>
			<td nowrap align="center" width="25%"><%=Util.formatCustomDate(currUser.getE01DTF(),data.getBigDecimalE01CCNFVM().intValue(),data.getBigDecimalE01CCNFVD().intValue(),data.getBigDecimalE01CCNFVY().intValue())%></td>
		</tr>
		<% } %>
        </table>
        </div>
    	</td>
	</tr>
</table>
<% } %>
</form>
<SCRIPT type="text/javascript">
	showChecked("key");
 	document.getElementById("hiddenDivNew").onclick=cancelBub;
	document.getElementById("eibsNew").onclick=showHiddenDivNew;  
</SCRIPT>
</body>
</html>

