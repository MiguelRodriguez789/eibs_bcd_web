<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput"%>
<%@ page import="datapro.eibs.master.Util,datapro.eibs.beans.ESD036501Message"%>

<!doctype html public "-//w3c//dtd html 4.0 transitional//en">
<%@page import="com.datapro.constants.EibsFields"%>
<html>
<head>
<title>Tablas de Menu de EIBS</title>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id="ESD036501List" class="datapro.eibs.beans.JBObjList" scope="session" />
<jsp:useBean id="error" class="datapro.eibs.beans.ELEERRMessage" scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>
<jsp:useBean id="currUser" class="datapro.eibs.beans.ESS0030DSMessage" scope="session" />

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </script>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>

<script type="text/javascript">

  function goAction(op, row) {
	var ok = false;
	var cun = "";
	var pg = "";

	getElement("SCREEN").value = op;
    
    if (op == '400') {
    	if (confirm("Desea eliminar este registro seleccionado?")) {
			//document.forms[0].submit();
    		enableDeleteAuthorization( ) ;
    	}
  	} else {
  	
  	if(op =='300'){
		clickElement("key", row);
  	}
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

<h3 align="center">Planes de Fomento
	<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="planes_foment_list.jsp,ESD0365"></h3>
<hr size="4">
<form method="POST" action="<%=request.getContextPath()%>/servlet/datapro.eibs.params.JSESD0365">
<input type="hidden" id="SCREEN" name="SCREEN" value="500"> 

<div id="hiddenDivNew" class="hiddenDiv">
    <table id=tbhelp style="border-top-width : 1px;border-right-width : 1px;border-bottom-width : 1px;border-left-width : 1px;
	border-color: #0b23b5;
	border-style : solid solid solid solid;
	filter:progid:DXImageTransform.Microsoft.dropshadow(OffX=3, OffY=3, Color='gray', Positive='true');">
      <tr id="trdark"> 
        <td align=CENTER width="100px"> 
          <div align="right">Nuevo C&oacute;digo :</div>
        </td>
        <td align=CENTER width="100px"> 
          <div align="left"> 
            <input type="text" id="E01PFMCOD" name="E01PFMCOD" size="5" maxlength="4">
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

<table class="tbenter" width="100%" height="10%">
	<tr>
      <% if( "1".equals( currUser.getH01WK1() ) ){ %>
	      <td class=TDBKG width="25%"> 
	        <div align="center"><a href="javascript:goAction(300)"><b>Consultar</b></a></div>
	      </td>     
      <% } else { %>

		<td align="center" id="NewPlan" class="tdbkg" width="25%"><b>Crear</b></td>
		<td align="center" class="tdbkg" width="25%"><a	href="javascript:goAction('300')"> <b>Modificar</b> </a></td>
		<td align="center" class="tdbkg" width="25%"><a	href="javascript:goAction('400')"> <b>Borrar</b> </a></td>
      <% } %>
		<td align="center" class="tdbkg" width="25%">
			<a href="<%=request.getContextPath()%>/pages/background.jsp"><b>Salir</b></a>
		</td>

	</tr>
</table>
<br>
<br>

  <TABLE  id="mainTable" class="tableinfo" style="height:340px;" width="100%">
    <tr  height="5%"> 
      <td NOWRAP valign="top" width="100%"> 
		<table id="headTable" width="100%">
			<tr id="trdark">
				<th align="CENTER" nowrap width="4%"  > </th>
				<th align="CENTER" nowrap width="4%"  > C&oacute;digo </th>
				<th align="LEFT" nowrap width="20%" >Descripci&oacute;n</th>
				<th align="CENTER" nowrap width="10%" > No.Cliente </th>
				<th align="LEFT" nowrap width="20%" > Nombre </th>
				<th align="CENTER" nowrap width="10%" > Fecha Inicio </th>
				<th align="CENTER" nowrap width="10%" > Fecha Vencimiento </th>
				<th align="CENTER" nowrap width="10%" > Tasa de Fomento </th>
				<th align="CENTER" nowrap width="10%" > Monto  Disponible</th>
			</tr>
        </table>
      </td>
    </tr>    
		  <tr  height="100%">    
		    <td nowrap="nowrap">      
		       <div id="dataDiv1" style="height:340px; overflow:auto; width:100%"> 
		       <table id="dataTable" cellspacing="0" cellpadding="1" border="0" width="100%">         
		<%
			ESD036501List.initRow();
				int k = 0;
				boolean firstTime = true;
				String chk = "";
				while (ESD036501List.getNextRow()) {
					if (firstTime) {
						firstTime = false;
						chk = "checked";
					} else {
						chk = "";
					}
					ESD036501Message list = (ESD036501Message) ESD036501List.getRecord();
		%>
		<tr id="dataTable<%= ESD036501List.getCurrentRow() %>">
			<td nowrap align="center" width="4%"><input type="radio" id="key" name="key" value="<%=ESD036501List.getCurrentRow()%>" <%=chk%> class="highlight" onClick="highlightRow('dataTable', <%= ESD036501List.getCurrentRow() %>)"/></td>
			<td nowrap align="center" width="4%"><a href="javascript:goAction('300',<%=ESD036501List.getCurrentRow()%>);"><%=Util.formatCell(list.getE01PFMCOD())%></a></td>
			<td nowrap align="LEFT" width="20%"><a href="javascript:goAction('300',<%=ESD036501List.getCurrentRow()%>);"><%=Util.formatCell(list.getE01PFMNME())%></a></td>
			<td nowrap align="center" width="10%"><a href="javascript:goAction('300',<%=ESD036501List.getCurrentRow()%>);"><%=Util.formatCell(list.getE01PFMCUN())%></a></td>
			<td nowrap align="LEFT" width="20%"><a href="javascript:goAction('300',<%=ESD036501List.getCurrentRow()%>);"><%=Util.formatCell(list.getE01CUSNA1())%></a></td>
			<td nowrap align="LEFT" width="10%"><a href="javascript:goAction('300',<%=ESD036501List.getCurrentRow()%>);"><%= Util.formatCustomDate(currUser.getE01DTF(), 
																																	list.getBigDecimalE01PFMFIM().intValue(),
																																	list.getBigDecimalE01PFMFID().intValue(), 
																																	list.getBigDecimalE01PFMFIY().intValue()) %></a></td>
			<td nowrap align="LEFT" width="10%"><a href="javascript:goAction('300',<%=ESD036501List.getCurrentRow()%>);"><%= Util.formatCustomDate(currUser.getE01DTF(), 
																																	list.getBigDecimalE01PFMFVM().intValue(),
																																	list.getBigDecimalE01PFMFVD().intValue(), 
																																	list.getBigDecimalE01PFMFVY().intValue()) %></a></td>
			<td nowrap align="RIGHT" width="6%"><a href="javascript:goAction('300',<%=ESD036501List.getCurrentRow()%>);"><%= Util.formatCell(list.getE01PFMRTE())%></a></td>
			<td nowrap align="RIGHT" width="10%"><a href="javascript:goAction('300',<%=ESD036501List.getCurrentRow()%>);"><%= Util.formatCCY((list.getBigDecimalE01PFMAMA().subtract(list.getBigDecimalE01PFMAMU())).toString()) %></a></td>
		</tr>
		<%
			}
		%>
             </table>
             </div>
             </td>
             </tr>
</table>

  <TABLE class="tbenter" WIDTH="90%" ALIGN=CENTER height="10%">
  <TR>
  <TD WIDTH="50%" ALIGN=LEFT>
<%
        if ( ESD036501List.getShowPrev() ) {
 			int pos = ESD036501List.getFirstRec() - 51;
      			out.println("<A HREF=\""+request.getContextPath()+"/servlet/datapro.eibs.params.JSESD0365?SCREEN=500&Pos=" + pos +"\"><img src=\""+request.getContextPath()+"/images/s/previous_records.gif\" border=0></A>");
        }
%> 
	</TD>
 	<TD WIDTH="50%" ALIGN=RIGHT>
<%       
        if ( ESD036501List.getShowNext() ) {
      			int pos = ESD036501List.getLastRec();
      			out.println("<A HREF=\""+request.getContextPath()+"/servlet/datapro.eibs.params.JSESD0365?SCREEN=500&Pos=" + pos +"\"><img src=\""+request.getContextPath()+"/images/s/next_records.gif\" border=0></A>");
        }
%> 
 	</TD>
	 </TR>
	 </TABLE>

</form>
<SCRIPT type="text/javascript">
	showChecked("key");
 	document.getElementById("hiddenDivNew").onclick=cancelBub;
	document.getElementById("NewPlan").onclick=showHiddenDivNew;  
</SCRIPT>
</body>
</html>

