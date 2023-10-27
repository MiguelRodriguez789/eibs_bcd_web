<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput"%>
<%@ page import="datapro.eibs.master.Util,datapro.eibs.beans.EPV122501Message"%>

<!doctype html public "-//w3c//dtd html 4.0 transitional//en">
<%@page import="com.datapro.constants.EibsFields"%>
<html>
<head>
<title>Plataforma de Venta</title>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="<%=request.getContextPath()%>/pages/style.css"
	rel="stylesheet">

<jsp:useBean id="EPV122501List" class="datapro.eibs.beans.JBObjList" scope="session" />
<jsp:useBean id="error" class="datapro.eibs.beans.ELEERRMessage" scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </script>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>

<script type="text/javascript">

  function goAction(op) {
	var ok = false;
	var cun = "";
	var pg = "";

	if (op != '200'){	//Checks something is selected
	 	for(n=0; n<document.forms[0].elements.length; n++)
	     {
	      	var element = document.forms[0].elements[n];
	      	if(element.name == "PVAFAC") 
	      	{	
	      		if (element.checked == true) {
	      			getElement("E01PVAFAC").value = element.value; 
        			ok = true;
        			break;
				}
	      	}
	      }
      } else {
      	ok = true;
      }
      
      if ( ok ) {
      	var confirm1 = true;
      	
      	if (op =='202'){
      		confirm1 = confirm("Desea Eliminar este Registro Seleccionado?");
      	}
		if (confirm1){
			document.forms[0].SCREEN.value = op;
			document.forms[0].submit();		
		}		

     } else {
		alert("Debe seleccionar un registro para continuar.");	   
	 }    
	}
function showInq(num) {
	page = "${pageContext.request.contextPath}/servlet/datapro.eibs.salesplatform.JSEPV1225?SCREEN=203&PVAFAC=" + num;
	CenterWindow(page,600,500,2);
}
 
function closeHiddenDivNew(){
	setVisibility(getElement("hiddenDivNew"), "hidden");
}

function showHiddenDivNew(evt) {
	evt = (evt) ? evt : ((window.event) ? window.event : "");
 	
	var hiddenDivNew = getElement("hiddenDivNew");

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

<h3 align="center">Descuento Aval - Plataforma de Venta<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="PRAPD_list.jsp,EPV1225"></h3>
<hr size="4">
<form method="POST"
	action="<%=request.getContextPath()%>/servlet/datapro.eibs.salesplatform.JSEPV1225">
<input type="hidden" name="SCREEN" value="201"> 

<div id="hiddenDivNew" class="hiddenDiv">
    <table id=tbhelp style="border-top-width : 1px;border-right-width : 1px;border-bottom-width : 1px;border-left-width : 1px;
	border-color: #0b23b5;
	border-style : solid solid solid solid;
	filter:progid:DXImageTransform.Microsoft.dropshadow(OffX=3, OffY=3, Color='gray', Positive='true');">
      <tr id="trdark"> 
        <td align=CENTER width="18%"> 
          <div align="right">Descuento :</div>
        </td>
        <td align="left" width="34%" > 
            <input type="text" align="right" id="E01PVAFAC" name="E01PVAFAC" size="8" maxlength="7" onKeyPress="enterDecimal()">%	                        
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
			href="javascript:goAction('202')"> <b>Borrar</b> </a></td>
		<td align="center" class="tdbkg" width="20%"><a
			href="<%=request.getContextPath()%>/pages/background.jsp"><b>Salir</b></a>
		</td>
	</tr>
</table>

<%
	if (EPV122501List.getNoResult()) {
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

  <TABLE  id="mainTable" class="tableinfo" style="height:600px; width:1040px;">
    <tr  height="5%"> 
      <td NOWRAP valign="top" width="100%"> 
		<table id="headTable" width="98%">
			<tr id="trdark">
				<th align="center" nowrap width="5%"></th>
				<th align="center" nowrap width="10%">Porcentaje de Descuento</th>
				<th align="center" nowrap width="30%">Veces Renta</th>				
			</tr>
        </table>
      </td>
    </tr>    
		  <tr  height="95%">    
		    <td nowrap="nowrap">      
		       <div id="dataDiv1" style="height:600px; overflow:auto;"> 
		       <table id="dataTable" cellspacing="0" cellpadding="1" border="0" width="100%">         
		<%
			EPV122501List.initRow();
				int k = 0;
				boolean firstTime = true;
				String chk = "";
				while (EPV122501List.getNextRow()) {
					if (firstTime) {
						firstTime = false;
						chk = "checked";
					} else {
						chk = "";
					}
					EPV122501Message pvapd = (EPV122501Message) EPV122501List.getRecord();
		%>
		<tr id="dataTable<%= EPV122501List.getCurrentRow() %>">
			<td nowrap align="center" width="5%"><input type="radio" name="PVAFAC" <%=chk%>	value="<%=EPV122501List.getCurrentRow()%>" class="highlight" onClick="highlightRow('dataTable', <%= EPV122501List.getCurrentRow() %>)"/></td>
			<td nowrap align="center" width="10%"><a href="javascript:showInq('<%= EPV122501List.getCurrentRow() %>');"><%=pvapd.getE01PVAFAC()%></a></td>																			   																		   
			<td nowrap align="center" width="30%"><a href="javascript:showInq('<%= EPV122501List.getCurrentRow() %>');"><%=pvapd.getE01PVALVE()%></a></td>	
		</tr>
		<%
			}
		%>
             </table>
             </div>
             </td>
             </tr>
</table>

<table class="tbenter" width="98%" align="center">
	<tr>
		<td width="50%" align="left">
		<%
			if (EPV122501List.getShowPrev()) {
					int pos = EPV122501List.getFirstRec() - 13;
					out
							.println("<A HREF=\""
									+ request.getContextPath()
									+ "/servlet/datapro.eibs.client.JSEPV1225?SCREEN=100&codNum="
									+ request.getAttribute("codNum")
									+ "\"><IMG border=\"0\" src=\""
									+ request.getContextPath()
									+ "/images/s/previous_records.gif\" ></A>");
				}
		%>
		</td>
		<td width="50%" align="right">
		<%
			if (EPV122501List.getShowNext()) {
					int pos = EPV122501List.getLastRec();
					out
							.println("<A HREF=\""
									+ request.getContextPath()
									+ "/servlet/datapro.eibs.client.JSEPV1225?SCREEN=100&codNum="
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
	showChecked("PVAFAC");
 	getElement("hiddenDivNew").onclick=cancelBub;
	getElement("eibsNew").onclick=showHiddenDivNew;  
</SCRIPT>
</body>
</html>

