<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput"%>
<%@ page import="datapro.eibs.master.Util,datapro.eibs.beans.EDL037102Message"%>
<%@page import="com.datapro.constants.EibsFields"%>

<html>
<head>
<title>Deducciones</title>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id="list" class="datapro.eibs.beans.JBObjList" scope="session" />
<jsp:useBean id="error" class="datapro.eibs.beans.ELEERRMessage" scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>
<jsp:useBean id="header" class="datapro.eibs.beans.EDL037103Message"  scope="session" />
<jsp:useBean id="currUser" class="datapro.eibs.beans.ESS0030DSMessage" scope="session" />

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </script>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>

<script type="text/javascript">

function goAction(op) {
	getElement("SCREEN").value = op;
    
    if (op == '2003') {
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

<h3 align="center">Deducciones<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="deductions_list.jsp,EDL0371"></h3>
<hr size="4">
<form method="POST" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDL0371">
<input type="hidden" id="SCREEN" name="SCREEN" value="9000"> 
 
<div id="hiddenDivNew" class="hiddenDiv">
    <table id=tbhelp style="border-top-width : 1px;border-right-width : 1px;border-bottom-width : 1px;border-left-width : 1px;
	border-color: #0b23b5;
	border-style : solid solid solid solid;
	filter:progid:DXImageTransform.Microsoft.dropshadow(OffX=3, OffY=3, Color='gray', Positive='true');">
      <tr id="trdark"> 
        <td align=CENTER width="18%"> 
          <div align="right">Deducci&oacute;n :</div>
        </td>
        <td align=CENTER width="34%"> 
          <div align="left"> 
            <eibsinput:help property="E02DLICDE" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_BROKER %>" fn_param_one="E02DLICDE" fn_param_two="" fn_param_three="I" />
          </div>
        </td>
      </tr>
      <tr id="trclear"> 
        <td align=center nowrap colspan="2"> 
          <input id="EIBSBTN" type=button name="Submit" value="Enviar" onClick="javascript:goAction('2001')">
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

<table class="tbenter" width="100%" height="10%">
	<tr>
		<td align="center" id="eibsNew" class="tdbkg" width="25%"><b>Crear</b></td>
		<td align="center" class="tdbkg" width="25%"><a href="javascript:goAction('2002')"> <b>Modificar</b> </a></td>
		<td align="center" class="tdbkg" width="25%"><a href="javascript:goAction('2003')"> <b>Borrar</b> </a></td>
		<td align="center" class="tdbkg" width="25%"><a href="<%=request.getContextPath()%>/pages/background.jsp"><b>Salir</b></a></td>
	</tr>
</table>

  <TABLE  id="mainTable" class="tableinfo" style="height:400px;">
    <tr  height="5%"> 
      <td NOWRAP valign="top" width="100%"> 
		<table id="headTable" width="100%">
			<tr id="trdark">
				<th align="center" nowrap width="5%">&nbsp;</th>
				<th align="center" nowrap width="10%">Dedducci&oacute;n</th>
				<th align="center" nowrap width="5%">Plan</th>
				<th align="center" nowrap width="25%">Descripci&oacute;n</th>
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
					EDL037102Message msg = (EDL037102Message) list.getRecord();
		%>
		<tr id="dataTable<%= list.getCurrentRow() %>">
			<td nowrap align="center" width="5%"><input type="radio" id="key" name="key" value="<%=list.getCurrentRow()%>" <%=chk%> class="highlight" onClick="highlightRow('dataTable', <%= list.getCurrentRow() %>)"/></td>
			<td nowrap align="center" width="10%"><%=msg.getE02DLICDE()%></td>
			<td nowrap align="center" width="5%"><%=msg.getE02DLIPLN()%></td>
			<td nowrap align="left" width="25%"><%=msg.getE02DLINME()%></td>
			<td nowrap align="right" width="10%"><%=msg.getE02DLIDPM()%></td>
			<td nowrap align="center" width="10%"><%= msg.getE02DLIFAC().equals("F") ? "Fijo" : ( msg.getE02DLIFAC().equals("P") ? "Porcentaje %" : (msg.getE02DLIFAC().equals("1") ? "Tasa/Periodo" : "" )) %></td>
			<td nowrap align="center" width="20%">
				<% if(msg.getE02DLITYP().equals("A")){ %>
				    	Seguro de Auto 
				<% } else if (msg.getE02DLITYP().equals("C")){ %>
						Credito Ahorros
				<% } else if (msg.getE02DLITYP().equals("E")){ %>
						Entidades del Gobierno
				<% } else if (msg.getE02DLITYP().equals("G")){ %>
						Administracion de Fondos
				<% } else if (msg.getE02DLITYP().equals("I")){ %>
						Seguro
				<% } else if (msg.getE02DLITYP().equals("N")){ %>
						Notarios
				<% } else if (msg.getE02DLITYP().equals("S")){ %>
						Vendedores o Comisionistas
				<% } else if (msg.getE02DLITYP().equals("V")){ %>
						Agentes de Bolsa
				<% } else { %>
						Recaudador de Impuestos
				<% } %>
			</td>
			<td nowrap align="center" width="15%">
				<% if(msg.getE02DLIRTY().equals("D")){%>
					Borrado
				<% } else if(msg.getE02DLIRTY().equals("U")) { %>
					Actualizado
				<% } else if(msg.getE02DLIRTY().equals("N")) { %>
					Nuevo
				<% } %>
			</td>
		</tr>
		<% } %>
        </table>
        </div>
    	</td>
	</tr>
</table>

</form>
<SCRIPT type="text/javascript">
	showChecked("key");
 	document.getElementById("hiddenDivNew").onclick=cancelBub;
	document.getElementById("eibsNew").onclick=showHiddenDivNew;  
</SCRIPT>
</body>
</html>

