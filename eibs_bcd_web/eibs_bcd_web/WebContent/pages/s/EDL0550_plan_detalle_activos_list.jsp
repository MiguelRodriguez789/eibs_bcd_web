<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput"%>
<%@ page import="datapro.eibs.master.Util,datapro.eibs.beans.EDL055001Message"%>
<%@ page import="datapro.eibs.master.Util,datapro.eibs.beans.EDL055002Message"%>
<%@page import="com.datapro.constants.EibsFields"%>

<!doctype html public "-//w3c//dtd html 4.0 transitional//en">
<html>
<head>
<title>Detalle del Paquete de Redescuento</title>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id="EDL055002Loans" class="datapro.eibs.beans.JBObjList" scope="session" />
<jsp:useBean id="recData" class="datapro.eibs.beans.EDL055001Message"  scope="session" />
<jsp:useBean id="error" class="datapro.eibs.beans.ELEERRMessage" scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>
<jsp:useBean id="currUser" class="datapro.eibs.beans.ESS0030DSMessage" scope="session" />

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </script>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>

<script type="text/javascript">

function goAction(op, row) {
	if ((op != '701') && (op != '601') && (!isValidObject(getElement("keyDetail")))) {
		alert("Debe seleccionar un registro.");
		return;
	}
	if ((op == '500') || (op == '601') || (op == '703')) {
		if ((op == '500') || (op == '703')) chk = true;
		if (op == '601') chk = confirm("Desea activar el paquete de redescuento?");
		if (!chk) return;
		//enableDeleteAuthorization();
		getElement("SCREEN").value = op;
		document.forms[0].submit();	
	} else {
		var url = "<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDL0550?SCREEN="+op;
		if ((op != '701')) {
			url += "&keyDetail=" + getElementChecked('keyDetail').value;
		}
		CenterWindow(url, 1000, 650, 2);		
	}
}

function closeHiddenDivDlt(){
  setVisibility(document.getElementById("hiddenDivDlt"), "hidden");
}

function showHiddenDivDlt(evt) {
  evt = (evt) ? evt : ((window.event) ? window.event : "");
  var hiddenDivDlt = document.getElementById("hiddenDivDlt");
  var y=evt.clientY + document.body.scrollTop;
  var x=evt.clientX + document.body.scrollLeft;
  cancelBub(evt);
  moveElement(hiddenDivDlt, y, x);
  setVisibility(hiddenDivDlt, "visible");
}

addEventHandler(document, 'click' , closeHiddenDivDlt);

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

<h3 align="center">Detalle del Paquete de Redescuento
<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="plan_detalle_activos_list.jsp,EDL0550"></h3>
<hr size="4">
<form method="POST" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDL0550">
  <input type="hidden" id="SCREEN" name="SCREEN" value="1500">
  <input type="hidden" id="H01FLGMAS" name="H01FLGMAS" value="A">  

  <div id="hiddenDivDlt" class="hiddenDiv">
    <table id=tbhelp style="border-top-width : 1px;border-right-width : 1px;border-bottom-width : 1px;border-left-width : 1px;
    border-color: #0b23b5;
    border-style : solid solid solid solid;
    filter:progid:DXImageTransform.Microsoft.dropshadow(OffX=3, OffY=3, Color='gray', Positive='true');">
      <tr id="trdark"> 
        <td align=CENTER width="120px"> 
          <div align="right">Fuente de Recurso :</div>
        </td>
        <td align=CENTER width="100px"> 
          <div align="left"> 
              <eibsinput:cnofc name="lnBasic" flag="RS" property="E02DEAUC7" fn_code="E02DEAUC7" fn_description="" required="true"/>
          </div>
        </td>
      </tr>
      <tr id="trclear"> 
        <td align=center nowrap colspan="2"> 
          <input id="EIBSBTN" type=button name="Submit" value="Enviar" onClick="javascript:goAction('703')">
        </td>
      </tr>
    </table>
  </div>


  <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
          <tr id="trdark">
            <td nowrap width="10%" align="right"> Paquete :</td>          
            <td nowrap width="90%" align="left" colspan="5">
              <input type="text" name="E01PDSCOD" size="5" maxlength="4" value="<%= recData.getE01PDSCOD()%>" readonly >
            </td> 
          </tr>
         <tr id="trdark">
             <td nowrap width="10%" align="right"> Entidad de Redescuento :</td>
             <td nowrap width="90%" align="left" colspan="5">
              <input type="text" name="E01PDSREC" size="5" maxlength="4" value="<%= recData.getE01PDSREC()%>" readonly >
              <eibsinput:text name="recData" property="E01CUSNA1" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true"/>
             </td>
         </tr>
         <tr id="trdark">
             <td nowrap width="10%" align="right"> Cantidad de Prestamos :</td>
             <td nowrap width="10%" align="left">
               <input type="text" name="E01PDSSEQ" size="7" maxlength="6" value="<%= recData.getE01PDSSEQ()%>" readonly >
             </td>
             <td nowrap width="10%" align="right"> Total Paquete :</td>
             <td nowrap width="70%" align="left">
	  			<input type="text" name="E01PDSAMA" size="18" maxlength="15" value="<%= recData.getE01PDSAMA()%>" readonly >
             </td>             
             <td nowrap width="10%" align="right"> Estado :</td>
             <td nowrap width="70%" align="left">
	  			<input type="text" name="E01DSCSTS" size="18" maxlength="15" value="<%= recData.getE01DSCSTS()%>" readonly >
             </td>             
         </tr>
        </table>
      </td>
    </tr>
  </table>

<table class="tbenter" width="100%" height="10%">
	<tr>
        <% if (!recData.getE01PDSSTS().equals("R")) { %>
		<td align="center" class="tdbkg" width="25%"><a href="javascript:goAction('701')"><b>Agregar</b> </a></td>
        <% } %>
        <% if (recData.getE01PDSSTS().equals("A") || recData.getE01PDSSTS().equals("R")) { %>
		<td align="center" class="tdbkg" width="25%" id="dltSeq"><b>Desvincular</b> </a></td>
        <% } else { %>
		<td align="center" class="tdbkg" width="25%"><a href="javascript:goAction('703')"><b>Desvincular</b> </a></td>
        <% } %>
        <% if (!recData.getE01PDSSTS().equals("R")) { %>
		<td align="center" class="tdbkg" width="25%"><a href="javascript:goAction('601')"><b>Activar<br>Paquete</b> </a></td>
        <% } %>
		<td align="center" class="tdbkg" width="25%"><a href="javascript:goAction('500')"><b>Salir</b></a></td>
	</tr>
</table>

  <TABLE  id="mainTable" class="tableinfo" style="height:340px;" width="100%">
    <tr  height="5%"> 
      <td NOWRAP valign="top" width="100%"> 
		<table id="headTable" width="100%">
			<tr id="trdark">
				<th align="CENTER" nowrap width="2%" > </th>
				<th align="CENTER" nowrap width="8%" >Cuenta </th>
				<th align="CENTER" nowrap width="6%" >Cliente </th>
				<th align="CENTER" nowrap width="28%">Nombre</th>
				<th align="CENTER" nowrap width="8%" >Producto </th>			
				<th align="CENTER" nowrap width="8%" >Plazo </th>			
				<th align="CENTER" nowrap width="16%">Capital </th>			
				<th align="CENTER" nowrap width="12%">Fecha Inicio </th>
				<th align="CENTER" nowrap width="12%">Fecha Venc. </th>		
				
			</tr>
        </table>
      </td>
    </tr>    
		  <tr  height="100%">    
		    <td nowrap="nowrap">      
		       <div id="dataDiv1" style="height:340px; overflow:auto; width:100%"> 
		       <table id="dataTable" cellspacing="0" cellpadding="1" border="0" width="100%">         
		<%
			EDL055002Loans.initRow();
				int k = 0;
				boolean firstTime = true;
				String chk = "";
				while (EDL055002Loans.getNextRow()) {
					if (firstTime) {
						firstTime = false;
						chk = "checked";
					} else {
						chk = "";
					}
					EDL055002Message list = (EDL055002Message) EDL055002Loans.getRecord();
		%>
		<tr id="dataTable<%= EDL055002Loans.getCurrentRow() %>">
			<td nowrap align="center" width="2%" ><input type="radio" id="keyDetail" name="keyDetail" value="<%=EDL055002Loans.getCurrentRow()%>" <%=chk%> class="highlight" onClick="highlightRow('dataTable', <%= EDL055002Loans.getCurrentRow() %>)"/></td>
			<td nowrap align="right"  width="8%" ><%=Util.formatCell(list.getE02PDTACC())%></td>
			<td nowrap align="right"  width="6%" ><%=Util.formatCell(list.getE02PDTCUN())%>&nbsp;</td>
			<td nowrap align="left"   width="28%">&nbsp;<%=Util.formatCell(list.getE02CUSNA1())%></td>
			<td nowrap align="center" width="8%" ><%=Util.formatCell(list.getE02PDTPRD())%></td>
			<td nowrap align="center" width="8%" ><%=Util.formatCell(list.getE02PDTTRM())%></td>
			<td nowrap align="right"  width="16%"><%=Util.formatCell(list.getE02PDTPRI())%></td>
			<td nowrap align="center" width="12%"><%= Util.formatCustomDate(currUser.getE01DTF(), 
														list.getBigDecimalE02PDTFFM().intValue(),
														list.getBigDecimalE02PDTFFD().intValue(), 
														list.getBigDecimalE02PDTFFA().intValue()) %></td>
			<td nowrap align="center" width="12%"><%= Util.formatCustomDate(currUser.getE01DTF(), 
														list.getBigDecimalE02PDTFTM().intValue(),
														list.getBigDecimalE02PDTFTD().intValue(), 
														list.getBigDecimalE02PDTFTA().intValue()) %></td>
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
        if ( EDL055002Loans.getShowPrev() ) {
 			int pos = EDL055002Loans.getFirstRec() - 51;
      			out.println("<A HREF=\""+request.getContextPath()+"/servlet/datapro.eibs.params.JSEDL0550?SCREEN=1500&Pos=" + pos +"\"><img src=\""+request.getContextPath()+"/images/s/previous_records.gif\" border=0></A>");
        }
%> 
	</TD>
 	<TD WIDTH="50%" ALIGN=RIGHT>
<%       
        if ( EDL055002Loans.getShowNext() ) {
      			int pos = EDL055002Loans.getLastRec();
      			out.println("<A HREF=\""+request.getContextPath()+"/servlet/datapro.eibs.params.JSDLD0550?SCREEN=1500&Pos=" + pos +"\"><img src=\""+request.getContextPath()+"/images/s/next_records.gif\" border=0></A>");
        }
%> 
 	</TD>
	 </TR>
	 </TABLE>

</form>
<SCRIPT type="text/javascript">
  showChecked("keyDetail");
  document.getElementById("hiddenDivDlt").onclick=cancelBub;
  if (isValidObject(getElement("dltSeq"))) {
    document.getElementById("dltSeq").onclick=showHiddenDivDlt;  
  }
</SCRIPT>
</body>
</html>

