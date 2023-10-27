<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput"%>
<%@ page import="datapro.eibs.master.Util,datapro.eibs.beans.EFE009501Message"%>

<!doctype html public "-//w3c//dtd html 4.0 transitional//en">
<%@page import="com.datapro.constants.EibsFields"%>
<html>
<head>
<title>Listado Tablas de Registros</title>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="<%=request.getContextPath()%>/pages/style.css"
	rel="stylesheet">

<jsp:useBean id="EFE009501List" class="datapro.eibs.beans.JBObjList"
	scope="session" />
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
	      	if(element.name == "TABLECODE") 
	      	{	
	      		if (element.checked == true) {
	      			getElement("E01FEBNUM").value = element.value; 
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

<h3 align="center">Tablas de Registros
	<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="FEBRK_list.jsp,EFE0095"></h3>
<hr size="4">
<form method="POST"
	action="<%=request.getContextPath()%>/servlet/datapro.eibs.params.JSEFE0095">
<input type="hidden" name="SCREEN" value="201"> 

<div id="hiddenDivNew" class="hiddenDiv">
    <table id=tbhelp style="border-top-width : 1px;border-right-width : 1px;border-bottom-width : 1px;border-left-width : 1px;
	border-color: #0b23b5;
	border-style : solid solid solid solid;
	filter:progid:DXImageTransform.Microsoft.dropshadow(OffX=3, OffY=3, Color='gray', Positive='true');">
      <tr id="trdark"> 
        <td align=CENTER width="18%"> 
          <div align="right">Nuevo Codigo :</div>
        </td>
        <td align=CENTER width="34%"> 
          <div align="left"> 
            <input type="text" id="E01FEBNUM" name="E01FEBNUM" size="5" maxlength="4">
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
  
  <table  class="tableinfo" height="10%">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
          <tr>
             <td nowrap width="10%" align="right"> Tipo Registro : 
              </td>
             <td nowrap width="10%" align="left">
                <input type="text" readonly name="rectyp" size="2" maxlength="1" value="<%= userPO.getOption().trim()%>" readonly>
             </td>
             <td nowrap width="10%" align="right"> Descripcion : 
               </td>
             <td nowrap width="70%"align="left">
				<% 
			        if (userPO.getOption().equals("A")) out.print("SEGURO AUTOS");
			        else if (userPO.getOption().equals("C")) out.print("CREDIAHORROS");
			        else if (userPO.getOption().equals("T")) out.print("RECOLECTOR DE IMPUESTOS");
			        else if (userPO.getOption().equals("V")) out.print("AGENTES DE BOLSA");
			        else if (userPO.getOption().equals("G")) out.print("ADMINISTRACION DE FONDOS");
			        else if (userPO.getOption().equals("I")) out.print("SEGUROS");
			        else if (userPO.getOption().equals("L")) out.print("ENTIDADES AVALADORAS");
			        else if (userPO.getOption().equals("E")) out.print("ENTIDADES DE GOBIERNO");
			        else if (userPO.getOption().equals("F")) out.print("ENTIDADES DE SUBSIDIO");
			        else if (userPO.getOption().equals("K")) out.print("ENTIDADES DE VENTA O TITULARIZACION");
			        else if (userPO.getOption().equals("R")) out.print("ENTIDADES DE RECAUDO");
			        else if (userPO.getOption().equals("S")) out.print("VENDEDORES - COMISIONISTAS");
			        else if (userPO.getOption().equals("D")) out.print("AGENTES - REPRESENTANTES COMEX");
			        else if (userPO.getOption().equals("N")) out.print("NOTARIAS");
			        else if (userPO.getOption().equals("P")) out.print("PARTICIPANTES POOL CONTRATOS");
			        else if (userPO.getOption().equals("O")) out.print("INSPECTORES DE OBRA"); 
			        else if (userPO.getOption().equals("X")) out.print("TIENDA VIRTUAL"); 
			        else if (userPO.getOption().equals("Y")) out.print("TARJETAS ALIANZA");
			        else if (userPO.getOption().equals("B")) out.print("ENTIDADES DE EMBARGO");
				%>
             </td>
         </tr>
        </table>
      </td>
    </tr>
  </table>
  
<table class="tbenter" width="100%" height="10%">
	<tr>
		<td align="center" id="eibsNew" class="tdbkg" width="25%"><b>Crear</b></td>
		<td align="center" class="tdbkg" width="25%"><a
			href="javascript:goAction('201')"> <b>Modificar</b> </a></td>
		<td align="center" class="tdbkg" width="25%"><a
			href="javascript:goAction('202')"> <b>Borrar</b> </a></td>
		<td align="center" class="tdbkg" width="25%"><a
			href="<%=request.getContextPath()%>/pages/background.jsp"><b>Salir</b></a>
		</td>
	</tr>
</table>

<%
	if (EFE009501List.getNoResult()) {
%>
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
<%
	} else {
%>

  <TABLE  id="mainTable" class="tableinfo" style="height:400px;">
    <tr  height="5%"> 
      <td NOWRAP valign="top" width="100%"> 
		<table id="headTable" width="100%">
			<tr id="trdark">
				<th align="center" nowrap width="5%">&nbsp;</th>
				<th align="center" nowrap width="10%">Codigo</th>
				<th align="left" nowrap width="40%">Nombre</th>
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
			EFE009501List.initRow();
				int k = 0;
				boolean firstTime = true;
				String chk = "";
				while (EFE009501List.getNextRow()) {
					if (firstTime) {
						firstTime = false;
						chk = "checked";
					} else {
						chk = "";
					}
					EFE009501Message febrk = (EFE009501Message) EFE009501List.getRecord();
		%>
		<tr id="dataTable<%= EFE009501List.getCurrentRow() %>">
			<td nowrap align="center" width="5%"><input type="radio" name="TABLECODE"	value="<%=febrk.getE01FEBNUM()%>" <%=chk%> class="highlight" onClick="highlightRow('dataTable', <%= EFE009501List.getCurrentRow() %>)"/></td>
			<td nowrap align="center" width="10%"><a href="javascript:goAction('203');"><%=Util.formatCell(febrk.getE01FEBNUM())%></a></td>
			<td nowrap align="left" width="40%"><a href="javascript:goAction('203');"><%=febrk.getE01FEBNM1().trim()%></a></td>
			<td nowrap align="left" width="45%"><a href="javascript:goAction('203');"><%=febrk.getE01FEBNM4().trim()%></a></td>
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
        if ( EFE009501List.getShowPrev() ) {
 			int pos = EFE009501List.getFirstRec() - 51;
      			out.println("<A HREF=\""+request.getContextPath()+"/servlet/datapro.eibs.params.JSEFE0095?SCREEN=101&Pos=" + pos +"\"><img src=\""+request.getContextPath()+"/images/s/previous_records.gif\" border=0></A>");
        }
%> 
	</TD>
 	<TD WIDTH="50%" ALIGN=RIGHT>
<%       
        if ( EFE009501List.getShowNext() ) {
      			int pos = EFE009501List.getLastRec();
      			out.println("<A HREF=\""+request.getContextPath()+"/servlet/datapro.eibs.params.JSEFE0095?SCREEN=101&Pos=" + pos +"\"><img src=\""+request.getContextPath()+"/images/s/next_records.gif\" border=0></A>");
        }
%> 
 	</TD>
	 </TR>
	 </TABLE>
<%
	}
%>
</form>
<SCRIPT type="text/javascript">
	showChecked("TABLECODE");
 	getElement("hiddenDivNew").onclick=cancelBub;
	getElement("eibsNew").onclick=showHiddenDivNew;  
</SCRIPT>
</body>
</html>

