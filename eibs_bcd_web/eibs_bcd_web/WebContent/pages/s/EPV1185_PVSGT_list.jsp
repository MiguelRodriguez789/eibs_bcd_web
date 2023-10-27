<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput"%>
<%@ page import="datapro.eibs.master.Util,datapro.eibs.beans.EPV118501Message"%>

<!doctype html public "-//w3c//dtd html 4.0 transitional//en">
<%@page import="com.datapro.constants.EibsFields"%>
<html>
<head>
<title>Plataforma de Venta</title>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="<%=request.getContextPath()%>/pages/style.css"
	rel="stylesheet">

<jsp:useBean id="EPV118501List" class="datapro.eibs.beans.JBObjList" scope="session" />
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
	      	if(element.name == "DEDCOD") 
	      	{	
	      		if (element.checked == true) {
	      			document.getElementById("E01PSTDED").value = element.value; 
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

function getParams(bnk,acd,tar) {

    document.forms[0].BANK.value = bnk;
	document.forms[0].ACD.value = acd;
	document.forms[0].TABLEN.value = tar;
    
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

<h3 align="center">Seguros para Plataforma de Venta<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="PVSGT_list.jsp,EPV1185"></h3>
<hr size="4">
<form method="POST"
	action="<%=request.getContextPath()%>/servlet/datapro.eibs.salesplatform.JSEPV1185">
<input type="hidden" name="SCREEN" value="201"> 

<div id="hiddenDivNew" class="hiddenDiv">
    <table id=tbhelp style="border-top-width : 1px;border-right-width : 1px;border-bottom-width : 1px;border-left-width : 1px;
	border-color: #0b23b5;
	border-style : solid solid solid solid;
	filter:progid:DXImageTransform.Microsoft.dropshadow(OffX=3, OffY=3, Color='gray', Positive='true');">
      <tr id="trdark"> 
        <td align=CENTER width="18%"> 
          <div align="right">Codigo Seguro :</div>
        </td>
        <td align=CENTER width="34%"> 
          <div align="left"> 
            <input type="text" id="E01PSTDED" name="E01PSTDED" size="5" maxlength="4">
			<a href="javascript:GetCodeDescCNOFC('E01PSTDED',' ','IT')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="ayuda" align="bottom" border="0"></a>
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
	if (EPV118501List.getNoResult()) {
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
			<th align="center" nowrap width="5%">Codigo</th>
			<th align="center" nowrap width="40%">Nombre</th>
			<th align="center" nowrap width="10%">Forma Cobro</th>
			<th align="center" nowrap width="10%">Seleccion</th>
		</tr>
		<%
			EPV118501List.initRow();
				int k = 0;
				boolean firstTime = true;
				String chk = "";
				while (EPV118501List.getNextRow()) {
					if (firstTime) {
						firstTime = false;
						chk = "checked";
					} else {
						chk = "";
					}
					EPV118501Message pvsgt = (EPV118501Message) EPV118501List
							.getRecord();
		%>
		<tr>
			<td nowrap><input type="radio" name="DEDCOD"	value="<%=pvsgt.getE01PSTDED()%>" <%=chk%>/></td>
			<td nowrap align="center"><a href="javascript:goAction('203');"><%=Util.formatCell(pvsgt.getE01PSTDED())%></a></td>
			<td nowrap align="left"><a href="javascript:goAction('203');"><%=pvsgt.getE01PSTNME()%></a></td>
			<td nowrap align="center"><a href="javascript:goAction('203');"><% if (pvsgt.getE01PSTCOP().equals("O")) out.print("APERTURA"); 
																			 if (pvsgt.getE01PSTCOP().equals("L")) out.print("CUOTAS"); %></a></td>	
			<td nowrap align="center"><a href="javascript:goAction('203');"><% if (pvsgt.getE01PSTREQ().equals("Y")) out.print("REQUERIDO"); 
																			 if (!pvsgt.getE01PSTREQ().equals("Y")) out.print(" "); %></a></td>
		</tr>
		<%
			}
		%>
	</table>


<table class="tbenter" width="98%" align="center">
	<tr>
		<td width="50%" align="left">
		<%
			if (EPV118501List.getShowPrev()) {
					int pos = EPV118501List.getFirstRec() - 13;
					out
							.println("<A HREF=\""
									+ request.getContextPath()
									+ "/servlet/datapro.eibs.client.JSEPV1185?SCREEN=100&codNum="
									+ request.getAttribute("codNum")
									+ "\"><IMG border=\"0\" src=\""
									+ request.getContextPath()
									+ "/images/s/previous_records.gif\" ></A>");
				}
		%>
		</td>
		<td width="50%" align="right">
		<%
			if (EPV118501List.getShowNext()) {
					int pos = EPV118501List.getLastRec();
					out
							.println("<A HREF=\""
									+ request.getContextPath()
									+ "/servlet/datapro.eibs.client.JSEPV1185?SCREEN=100&codNum="
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
 	document.getElementById("hiddenDivNew").onclick=cancelBub;
	document.getElementById("eibsNew").onclick=showHiddenDivNew;  
</SCRIPT>
</body>
</html>

