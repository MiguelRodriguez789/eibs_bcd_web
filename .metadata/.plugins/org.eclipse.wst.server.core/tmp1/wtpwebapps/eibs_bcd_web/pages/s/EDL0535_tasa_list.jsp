<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput"%>
<%@ page import="datapro.eibs.master.Util,datapro.eibs.beans.EDL053502Message"%>
<%@page import="com.datapro.constants.EibsFields"%>

<html>
<head>
<title>Tablas de Producto</title>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id="tasaList" class="datapro.eibs.beans.JBObjList" scope="session" />
<jsp:useBean id="error" class="datapro.eibs.beans.ELEERRMessage" scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>
<jsp:useBean id="currUser" class="datapro.eibs.beans.ESS0030DSMessage" scope="session" />

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </script>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>


<script src="<%=request.getContextPath()%>/jquery/deleteLocalAuthorization.jsp"> </script>

<script type="text/javascript">

function goAction(op) {
	if (op == '303') {
		if (confirm("Desea eliminar este registro seleccionado?")) {
			getElement("SCREEN").value = op;
			//document.forms[0].submit();
			enableDeleteAuthorization( ) ;
		}
	} else if (op == '200'){
		getElement("SCREEN").value = op;
		document.forms[0].submit();		
	} else {
		var url = "<%=request.getContextPath()%>/servlet/datapro.eibs.params.JSEDL0535?SCREEN="+ op;		
		if (op =='302') {				
			url += "&index=" + getElementChecked('index').value;		
		}	
		CenterWindow(url, 600, 200, 2);		
	}
}

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

<h3 align="center">Tabla de Tasa Maxima Permitida
	<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="tasa_list.jsp,EDL0535"></h3>
<hr size="4">
<form method="POST" action="<%=request.getContextPath()%>/servlet/datapro.eibs.params.JSEDL0535">
<input type="hidden" id="SCREEN" name="SCREEN" value="2"> 

 <table  class="tableinfo" style="height: 25px">
    <tr id="trdark">   
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" >
          <tr id="trdark">
             <td nowrap width="16%" align="right"> Banco :&nbsp; 
              </td>
             <td nowrap width="16%" align="left">
             	<input type="text" name="E02MRTBNK" size="3" maxlength="2" value="<%=userPO.getBank() %>" readonly>
             </td>
             <td nowrap width="16%" align="right"> Moneda :&nbsp; 
               </td>
             <td nowrap width="16%"align="left">
             	<input type="text" name="E02MRTCCY" size="4" maxlength="3" value="<%=userPO.getCurrency() %>" readonly>
             </td>
             <td nowrap width="16%" align="right"> Producto :&nbsp; 
               </td>
             <td nowrap width="16%"align="left">
             	<input type="text" name="E02MRTPRD" size="4" maxlength="3" value="<%=userPO.getProdCode() %>" readonly>             	
             </td>
         </tr>
        </table>
      </td>
    </tr>
  </table>
  
<table class="tbenter" width="100%" height="10%">
	<tr>
      <% if( "1".equals( currUser.getH01WK1() ) ){ %>
	      <td class=TDBKG width="25%"> 
	        <div align="center"><a href="javascript:goAction(302)"><b>Consultar</b></a></div>
	      </td>     
      <% } else { %>

		<td align="center" class="tdbkg" width="25%">
			<a href="javascript:goAction('301')"> <b>Crear</b> </a>
		</td>
		<% if (!(tasaList.getNoResult())) { %>
		<td align="center" class="tdbkg" width="25%">
			<a href="javascript:goAction('302')"> <b>Modificar</b> </a>
		</td>
		<td align="center" class="tdbkg" width="25%">
			<a href="javascript:goAction('303')"> <b>Borrar</b> </a>
		</td>
		<td align="center" class="tdbkg" width="25%">
			<a href="javascript:goAction('200')"> <b>Lista</b><br>Productos</a>
		</td>
		<% }
        }
		%>
	</tr>
</table>

<% if (tasaList.getNoResult()) { %>
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
				<th align="center" nowrap width="10%">&nbsp;</th>
				<th align="center" nowrap width="15%">Fecha</th>
				<th align="left" nowrap width="30%">Tasa Máxima Interés</th>
				<th align="left" nowrap width="30%">Tasa Máxima Mora</th>
				<th align="left" nowrap width="15%">Factor</th>
			</tr>
        </table>
      </td>
    </tr>    
		  <tr  height="95%">    
		    <td nowrap="nowrap">      
		       <div id="dataDiv1" style="height:400px; overflow:auto;"> 
		       <table id="dataTable" cellspacing="0" cellpadding="1" border="0" width="100%">         
		<%
			tasaList.initRow();
				int k = 0;
				boolean firstTime = true;
				String chk = "";
				while (tasaList.getNextRow()) {
					if (firstTime) {
						firstTime = false;
						chk = "checked";
					} else {
						chk = "";
					}
					EDL053502Message list = (EDL053502Message) tasaList.getRecord();
		%>
		<tr id="dataTable<%= tasaList.getCurrentRow() %>">
			<td nowrap align="center" width="10%"><input type="radio" name="index" value="<%=tasaList.getCurrentRow()%>" <%=chk%> class="highlight" onClick="highlightRow('dataTable', <%= tasaList.getCurrentRow() %>)"/></td>
			<td nowrap align="center" width="15%"><%=Util.formatCustomDate(currUser.getE01DTF(),
																			list.getBigDecimalE02MRTPDM().intValue(),
																			list.getBigDecimalE02MRTPDD().intValue(),
																			list.getBigDecimalE02MRTPDY().intValue())%></td>
			<td nowrap align="left" width="30%"><%=list.getE02MRTTMI()%></td>
			<td nowrap align="left" width="30%"><%=list.getE02MRTTMM()%></td>
			<%if (list.getE02MRTTTA().equals("S")) { %>
				<td nowrap align="left" width="15%"><a>Suma</a></td>
			<% } else if (list.getE02MRTTTA().equals("M")) { %>
				<td nowrap align="left" width="15%"><a>Multiplica</a></td>
			<%} else { %>					
				<td nowrap align="left" width="15%"><a>Porcentaje</a></td>
			<% } %>
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
	showChecked("index");
</SCRIPT>
</body>
</html>

