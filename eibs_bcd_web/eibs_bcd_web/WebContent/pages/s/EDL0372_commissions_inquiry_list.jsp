<%@taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput"%>
<%@page import="datapro.eibs.master.Util,datapro.eibs.beans.EDL037202Message"%>
<%@page import="com.datapro.constants.EibsFields"%>

<html>
<head>
<title>Comisiones</title>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id="list" class="datapro.eibs.beans.JBObjList" scope="session" />
<jsp:useBean id="error" class="datapro.eibs.beans.ELEERRMessage" scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>
<jsp:useBean id="header" class="datapro.eibs.beans.EDL037203Message"  scope="session" />
<jsp:useBean id="currUser" class="datapro.eibs.beans.ESS0030DSMessage" scope="session" />

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </script>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>

<script type="text/javascript">

function goAction(op) {
	getElement("SCREEN").value = op;
	document.forms[0].submit();		
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

<h3 align="center">Comisiones<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="commissions_list.jsp,EDL0372"></h3>
<hr size="4">
<form method="POST" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDL0372">
<input type="hidden" id="SCREEN" name="SCREEN" value="9000"> 
 
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
                <input type="text" name="E03DEACUN" size="10" maxlength="9" value="<%= header.getE03DEACUN().trim()%>" readonly>
              </div>
            </td>
            <td nowrap width="16%" > 
              <div align="right"><b>Nombre :</b></div>
            </td>
            <td nowrap colspan="3" > 
              <div align="left"> 
                <input type="text" name="E03CUSNA1" size="50" maxlength="45" value="<%= header.getE03CUSNA1().trim()%>" readonly>
              </div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="16%" > 
              <div align="right"><b>Cuenta :</b></div>
            </td>
            <td nowrap width="16%" > 
              <div align="left"> 
                <input type="text" name="E03DEAACC" size="13" maxlength="12" value="<%= header.getE03DEAACC().trim()%>" readonly>
              </div>
            </td>
            <td nowrap width="16%" > 
              <div align="right"><b>Moneda :</b></div>
            </td>
            <td nowrap width="16%" > 
              <div align="left"> 
                <input type="text" name="E03DEACCY" size="4" maxlength="3" value="<%= header.getE03DEACCY().trim()%>" readonly>
              </div>
            </td>
            <td nowrap width="16%" > 
              <div align="right"><b>Producto :</b></div>
            </td>
            <td nowrap width="17%" > 
              <div align="left"> 
                <input type="text" name="E03DEAPRO" size="5" maxlength="4" value="<%= header.getE03DEAPRO().trim()%>" readonly>
              </div>
            </td>
          </tr>
        </table>
      </td>
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
<br>
  <TABLE  id="mainTable" class="tableinfo" style="height:400px;">
    <tr  height="5%"> 
      <td NOWRAP valign="top" width="100%"> 
		<table id="headTable" width="100%">
			<tr id="trdark">
				<th align="center" nowrap width="5%">&nbsp;</th>
				<th align="center" nowrap width="10%">Comisi&oacute;n</th>
				<th align="center" nowrap width="30%">Descripci&oacute;n</th>
				<th align="center" nowrap width="10%">Monto</th>
				<th align="center" nowrap width="10%">Factor</th>
				<th align="center" nowrap width="20%">Tipo</th>
				<th align="center" nowrap width="15%">Estatus</th>
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
					EDL037202Message msg = (EDL037202Message) list.getRecord();
		%>
		<tr id="dataTable<%= list.getCurrentRow() %>">
			<td nowrap align="center" width="5%"><input type="radio" id="key" name="key" value="<%=list.getCurrentRow()%>" <%=chk%> class="highlight" onClick="highlightRow('dataTable', <%= list.getCurrentRow() %>)"/></td>
			<td nowrap align="center" width="10%"><a href="javascript:goAction('4000');"><%=msg.getE02DCOCDE()%></a></td>
			<td nowrap align="left" width="30%"><a href="javascript:goAction('4000');"><%=msg.getE02DCONAR()%></a></td>
			<td nowrap align="right" width="10%"><a href="javascript:goAction('4000');"><%=msg.getE02DCOFVA()%></a></td>
			<td nowrap align="center" width="10%"><a href="javascript:goAction('4000');"><%=msg.getE02DCOPVI()%></a></td>
			<td nowrap align="left" width="20%"><a href="javascript:goAction('4000');">
				<% if(msg.getE02DCOCTY().equals("P")){ %>
				    	Principal
				<% } else if (msg.getE02DCOCTY().equals("C")){ %>
						Comision
				<% } else if (msg.getE02DCOCTY().equals("F")){ %>
						FNG
				<% } else if (msg.getE02DCOCTY().equals("I")){ %>
						Impuesto
				<% } else { %>
						Otra
				<% } %></a>
			</td>
<!-- 			<td nowrap align="center" width="15%"><a href="javascript:goAction('4000');"> -->
<%-- 				<% if(msg.getE02DLIRTY().equals("D")){%> --%>
<!-- 					Borrado -->
<%-- 				<% } else if(msg.getE02DLIRTY().equals("U")) { %> --%>
<!-- 					Actualizado -->
<%-- 				<% } else if(msg.getE02DLIRTY().equals("N")) { %> --%>
<!-- 					Nuevo -->
<%-- 				<% } %></a> --%>
<!-- 			</td> -->
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

