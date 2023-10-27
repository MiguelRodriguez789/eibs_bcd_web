<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput"%>
<%@ page import="datapro.eibs.master.Util,datapro.eibs.beans.EDL053501Message"%>
<%@page import="com.datapro.constants.EibsFields"%>

<html>
<head>
<title>Tablas de Producto</title>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id="currUser" class="datapro.eibs.beans.ESS0030DSMessage" scope="session" />
<jsp:useBean id="prodList" class="datapro.eibs.beans.JBObjList" scope="session" />
<jsp:useBean id="data" class="datapro.eibs.beans.EDL053501Message" scope="session" />
<jsp:useBean id="error" class="datapro.eibs.beans.ELEERRMessage" scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </script>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>


<script src="<%=request.getContextPath()%>/jquery/deleteLocalAuthorization.jsp"> </script>


<script type="text/javascript">

function goAction(op) {
	getElement("SCREEN").value = op;
    if (op == '202') {
    	if (confirm("Desea eliminar este registro seleccionado? Nota: si se elimina este producto todos las tasas de dentro se eliminarán también.")) {
			//document.forms[0].submit();
    		enableDeleteAuthorization( ) ;
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

<h3 align="center">Tabla de Producto
	<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="product_list.jsp,EDL0535"></h3>
<hr size="4">
<form method="POST" action="<%=request.getContextPath()%>/servlet/datapro.eibs.params.JSEDL0535">
<input type="hidden" id="SCREEN" name="SCREEN" value="2"> 
<input type="hidden" id="E01MRTBNK" name="E01MRTBNK" value="<%=userPO.getBank() %>"> 
<input type="hidden" id="E01MRTCCY" name="E01MRTCCY" value="<%=userPO.getCurrency() %>"> 

<div id="hiddenDivNew" class="hiddenDiv">
    <table id=tbhelp style="border-top-width : 1px;border-right-width : 1px;border-bottom-width : 1px;border-left-width : 1px;
	border-color: #0b23b5;
	border-style : solid solid solid solid;
	filter:progid:DXImageTransform.Microsoft.dropshadow(OffX=3, OffY=3, Color='gray', Positive='true');">
      <tr id="trclear"> 
        <td align=CENTER > 
          <div align="right">Tipo de Producto :&nbsp;</div>
        </td>
        <td align=CENTER > 
          <div align="left"> 
            <input type="text" name="E01MRTPRD" size="5" maxlength="4" value="<%= data.getE01MRTPRD().trim()%>" >
            <a href="javascript:GetCodeDescCNOFC('E01MRTPRD','E01MRTDSC','04')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="ayuda" align="bottom" border="0"></a>
          </div>
        </td>
      </tr>
      <tr id="trclear"> 
        <td align=CENTER > 
          <div align="right">Descripci&oacute;n :&nbsp;</div>
        </td>
        <td align=CENTER > 
          <div align="left"> 
			<eibsinput:text property="E01MRTDSC" name="data" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" />
          </div>
        </td>
      </tr>
      <tr id="trclear"> 
        <td align=center nowrap colspan="2"> 
          <input id="EIBSBTN" type=button name="Submit" value="Enviar" onClick="javascript:goAction('201')">
        </td>
      </tr>
    </table>
  </div>
  
  
<table class="tbenter" width="100%" height="10%">
	<tr>
      <% if( "1".equals( currUser.getH01WK1() ) ){ %>
	      <td class=TDBKG width="25%"> 
	        <div align="center"><a href="javascript:goAction(300)"><b>Lista</b></a></div>
	      </td>     
      <% } else { %>

		<td align="center" id="eibsNew" class="tdbkg" width="33%"><b>Crear</b></td>
		<td align="center" class="tdbkg" width="33%">
			<a href="javascript:goAction('300')"><b>Lista</b></a>
		</td>
		<td align="center" class="tdbkg" width="34%">
			<a href="javascript:goAction('202')"><b>Borrar</b></a>
		</td>
		
      <% } %>

		
	</tr>
</table>

<% if (prodList.getNoResult()) { %>
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
				<th align="center" nowrap width="20%">Tipo de Producto</th>
				<th align="left" nowrap width="45%">Descripci&oacute;n</th>
			</tr>
        </table>
      </td>
    </tr>    
		  <tr  height="95%">    
		    <td nowrap="nowrap">      
		       <div id="dataDiv1" style="height:400px; overflow:auto;"> 
		       <table id="dataTable" cellspacing="0" cellpadding="1" border="0" width="100%">         
		<%
			prodList.initRow();
				int k = 0;
				boolean firstTime = true;
				String chk = "";
				while (prodList.getNextRow()) {
					if (firstTime) {
						firstTime = false;
						chk = "checked";
					} else {
						chk = "";
					}
					EDL053501Message list = (EDL053501Message) prodList.getRecord();
		%>
		<tr id="dataTable<%= prodList.getCurrentRow() %>">
			<td nowrap align="center" width="5%"><input type="radio" name="key" value="<%=prodList.getCurrentRow()%>" <%=chk%> class="highlight" onClick="highlightRow('dataTable', <%= prodList.getCurrentRow() %>)"/></td>
			<td nowrap align="center" width="20%"><%=list.getE01MRTPRD()%></td>
			<td nowrap align="left" width="45%"><%=list.getE01MRTDSC()%></td>
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

