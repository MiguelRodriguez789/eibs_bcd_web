<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput"%>
<%@ page import="datapro.eibs.master.Util,datapro.eibs.beans.EPV120001Message"%>

<!doctype html public "-//w3c//dtd html 4.0 transitional//en">
<%@page import="com.datapro.constants.EibsFields"%>
<html>
<head>
<title>Plataforma de Venta</title>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="<%=request.getContextPath()%>/pages/style.css"
	rel="stylesheet">

<jsp:useBean id="EPV120001List" class="datapro.eibs.beans.JBObjList" scope="session" />
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
	      	if(element.name == "PVVICU") 
	      	{	
	      		if (element.checked == true) {
	      			getElement("E01PVVICU").value = element.value; 
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
			getElement("SCREEN").value = op;
			document.forms[0].submit();		
		}		

     } else {
		alert("Debe seleccionar un registro para continuar.");	   
	 }
      
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

<h3 align="center">Leverage para Pago Directo <br>Plataforma de Venta<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="PVVRT_PD_list.jsp,EPV1200"></h3>
<hr size="4">
<form method="POST"	action="<%=request.getContextPath()%>/servlet/datapro.eibs.salesplatform.JSEPV1200">
<input type="hidden" name="SCREEN" id="SCREEN" value="201"> 

<div id="hiddenDivNew" class="hiddenDiv">
    <table id=tbhelp style="border-top-width : 1px;border-right-width : 1px;border-bottom-width : 1px;border-left-width : 1px;
	border-color: #0b23b5;
	border-style : solid solid solid solid;
	filter:progid:DXImageTransform.Microsoft.dropshadow(OffX=3, OffY=3, Color='gray', Positive='true');">
      <tr id="trdark"> 
        <td align=CENTER width="18%"> 
          <div align="right">Renta Liquida :</div>
        </td>
        <td align=CENTER width="34%"> 
          <div align="left"> 
            <input type="text" id="E01PVVCU" name="E01PVVICU" size="17" maxlength="16" onKeyPress="enterSignDecimal()">
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
			href="javascript:goAction('202')"> <b>Borrar</b> </a></td>
		<td align="center" class="tdbkg" width="20%"><a
			href="<%=request.getContextPath()%>/pages/background.jsp"><b>Salir</b></a>
		</td>
	</tr>
</table>

<%
	if (EPV120001List.getNoResult()) {
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
				<th align="center" nowrap width="20%"> <br>Renta Liquida</th>
				<th align="center" nowrap width="20%"> Porcentaje <br>Carga Financiera</th>
				<th align="center" nowrap width="20%">Veces Renta<br>Credito Consumo Normal</th>			
				<th align="center" nowrap width="20%">Veces Renta<br>Credito Compra Cartera</th>				
			</tr>
        </table>
      </td>
    </tr>    
		  <tr  height="95%">    
		    <td nowrap="nowrap">      
		       <div id="dataDiv1" style="height:600px; overflow:auto;"> 
		       <table id="dataTable" cellspacing="0" cellpadding="1" border="0" width="100%">         
		<%
			EPV120001List.initRow();
				int k = 0;
				boolean firstTime = true;
				String chk = "";
				while (EPV120001List.getNextRow()) {
					if (firstTime) {
						firstTime = false;
						chk = "checked";
					} else {
						chk = "";
					}
					EPV120001Message pvvrt = (EPV120001Message) EPV120001List.getRecord();
		%>
		<tr id="dataTable<%= EPV120001List.getCurrentRow() %>">
			<td nowrap align="center" width="5%"><input type="radio" id="PVVICU" name="PVVICU" value="<%=pvvrt.getE01PVVICU()%>; <%=EPV120001List.getCurrentRow()%>" <%=chk%> class="highlight" onClick="highlightRow('dataTable', <%= EPV120001List.getCurrentRow() %>)"/></td>
			<td nowrap align="center" width="20%"><a href="javascript:goAction('203');"><%=Util.formatCell(pvvrt.getE01PVVICU())%></a></td>
			<td nowrap align="center" width="20%"><a href="javascript:goAction('203');"><%=Util.formatCell(pvvrt.getE01PVVCAR())%></a></td>
			<td nowrap align="center" width="20%"><a href="javascript:goAction('203');"><%=Util.formatCell(pvvrt.getE01PVVLNO())%></a></td>
			<td nowrap align="center" width="20%"><a href="javascript:goAction('203');"><%=Util.formatCell(pvvrt.getE01PVVLCC())%></a></td>		
		</tr>
		<%
			}
		%>
             </table>
             </div>
             </td>
             </tr>
</table>


<%
	}
%>
</form>
<SCRIPT type="text/javascript">
	showChecked("PVVICU");
 	getElement("hiddenDivNew").onclick=cancelBub;
	getElement("eibsNew").onclick=showHiddenDivNew;  
</SCRIPT>
</body>
</html>

