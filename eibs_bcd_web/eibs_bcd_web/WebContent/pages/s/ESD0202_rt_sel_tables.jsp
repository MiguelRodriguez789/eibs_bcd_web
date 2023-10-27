<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput"%>
<%@ page import="datapro.eibs.master.Util,datapro.eibs.beans.ESD020201Message"%>

<html>
<head>
<title>Comisiones-Definición de Cargos</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "ESD0202Help" class= "datapro.eibs.beans.JBObjList"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>

<script type="text/javascript">

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

addEventHandler(document, 'click' , closeHiddenDivNew);

function goAction(op,row) {

	clickElement("key", row);
	document.forms[0].SCREEN.value = op;
	if (op == '3') {
    	if (confirm("Desea eliminar este registro seleccionado?")) {
			document.forms[0].submit();		
    	}
  	} else {
		document.forms[0].submit();
	}

}


function CheckAcc(op){

	document.forms[0].SCREEN.value = op;
	if(document.forms[0].E01DDCCDE.value.length < 1){
		alert("Ingrese un código válido");
		document.forms[0].E01DDCCDE.value='';
		document.forms[0].E01DDCCDE.focus();
	}
	else {
		document.forms[0].submit();
	
	}

}

</SCRIPT>  

</head>

<BODY>
  <h3 align="center">Comisiones-Definición de Cargos<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="rt_sel_tables.jsp, ESD0202"></H3>
  <hr size="4">
<form name="form1" METHOD="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.params.JSESD0202" >
  <input type=HIDDEN name="SCREEN" value="2">
  <input type=hidden name="TABLE" value="<%= userPO.getHeader4().trim()%>"> 
  <input type=hidden name="CUSTOMER" value="<%= userPO.getHeader3().trim()%>">  

<div id="hiddenDivNew" class="hiddenDiv">

	<% int row = 0; %>
    <table id=tbhelp style="border-top-width : 1px;border-right-width : 1px;border-bottom-width : 1px;border-left-width : 1px;
	border-color: #0b23b5;
	border-style : solid solid solid solid;
	filter:progid:DXImageTransform.Microsoft.dropshadow(OffX=3, OffY=3, Color='gray', Positive='true');">
      
      <tr id="trdark">  
        <td align=CENTER width="18%"> 
          <div align="right">Código de Comisión :</div>
        </td>
        <td align=CENTER width="34%"> 
          <div align="left"> 
            <input type="text" name="E01DDCCDE" size="5" maxlength="4">
          </div>
        </td>
      </tr>
      
      <tr id="trdark">  
        <td align=center nowrap colspan="2"> 
          <input id="EIBSBTN" type=button name="Submit" value="Enviar" onClick="javascript:CheckAcc(1)">
        </td>
      </tr>
    </table>
  </div>
  <%
  	if (ESD0202Help.getNoResult()) {
  %>
  <p>&nbsp;</p><TABLE class="tbenter" width="100%" >
    <TR>
      <TD > 
        <div align="center"> 
          <p><b>No hay resultados para su b&uacute;squeda</b></p>
          <table class="tbenter" width=100% align=center>
           <tr>
            <td class=TDBKG>
                <div id="eibsNew" align="center" style="cursor:pointer"><a><b>Crear</b></a></div>
              </td>
              <td class=TDBKG>
                <div align="center"><a href="<%=request.getContextPath()%>/pages/background.jsp"><b>Salir</b></a></div>
              </td>
           </tr>
         </table>
	  </div>

	  </TD>
	</TR>
    </TABLE>
	
  <%
	  	} else {
	  %>
  <%
  	if (!error.getERRNUM().equals("0")) {
  			error.setERRNUM("0");
  			out.println("<SCRIPT Language=\"Javascript\">");
  			out.println("       showErrors()");
  			out.println("</SCRIPT>");
  		}
  %> 
  <p> 

          
  <table class="tbenter" width=100% align=center>
    <tr> 
      <% if( "1".equals( currUser.getH01WK1() ) ){ %>
	      <td class=TDBKG width="25%"> 
	        <div align="center"><a href="javascript:goAction(4)"><b>Consultar</b></a></div>
	      </td>    
      <% } else { %>
	      <td class=TDBKG width="25%"> 
	                <div id="eibsNew" align="center" style="cursor:pointer"><a><b>Crear</b></a></div>
	      </td>
	      <td class=TDBKG width="25%"> 
	        <div align="center"><a href="javascript:goAction(2)"><b>Modificar</b></a></div>
	      </td>
	      <td class=TDBKG width="25%"> 
	        <div align="center"><a href="javascript:goAction(3)"><b>Eliminar</b></a></div>
	      </td>
	      <td class=TDBKG width="25%"> 
	        <div align="center"><a href="javascript:goAction(4)"><b>Consultar</b></a></div>
	      </td>
      <% } %>

    </tr>
  </table>
   
  <br>
  
  <TABLE  id="mainTable" class="tableinfo" style="height:400px;">
    <tr  height="5%"> 
      <td NOWRAP valign="top" width="100%"> 
		<table id="headTable" width="100%">
			<tr id="trdark">
	            <th align=CENTER nowrap width="2%">&nbsp;</th>
	            <th align=CENTER nowrap width="5%">Código</th>
	            <th align=CENTER nowrap width="25%">Descripción</th>
	            <th align=CENTER nowrap width="5%">Aplicacion</th>
	            <th align=CENTER nowrap width="10%">Valor</th>
	            <th align=CENTER nowrap width="5%">Factor</th>
	            <th align=CENTER nowrap width="5%">Moneda</th>
	            <th align=CENTER nowrap width="10%">Contabilidad</th>
	            <th align=CENTER nowrap width="8%">Inicio</th>
	            <th align=CENTER nowrap width="8%">Final</th>
			</tr>
        </table>
      </td>
    </tr>    
		  <tr  height="95%">    
		    <td nowrap="nowrap">      
		       <div id="dataDiv1" style="height:400px; overflow:auto;"> 
		       <table id="dataTable" cellspacing="0" cellpadding="1" border="0" width="100%">         
		<%
          	ESD0202Help.initRow();
          		boolean firstTime = true;
          		String chk = "";
          		while (ESD0202Help.getNextRow()) {
          			if (firstTime) {
          				firstTime = false;
          				chk = "checked";
          			} else {
          				chk = "";
          			}
          			ESD020201Message list = (ESD020201Message) ESD0202Help.getRecord();
          %>
			<tr id="dataTable<%=ESD0202Help.getCurrentRow()%>">
				<td nowrap align="center" width="2%"> <input type="radio" name="key" value="<%=ESD0202Help.getCurrentRow()%>" <%=chk%>
					class="highlight" onClick="highlightRow('dataTable', <%=ESD0202Help.getCurrentRow()%>)" /></td>
				<td nowrap align="center" width="5%"><a href="javascript:goAction('2',<%= ESD0202Help.getCurrentRow()%>);"><%= Util.formatCell(list.getE01DDCCDE())%></a></td>
				<td nowrap align="left" width="25%"><a href="javascript:goAction('2',<%= ESD0202Help.getCurrentRow()%>);"><%= Util.formatCell(list.getE01DDCDSC())%></a></td>
				<td nowrap align="left" width="5%"><a href="javascript:goAction('2',<%= ESD0202Help.getCurrentRow()%>);">
													<% if (list.getE01DDCFRQ().equals("P")) out.print("PERIODICA"); 
														if (list.getE01DDCFRQ().equals("T")) out.print("TRANSACCION");
														if (list.getE01DDCFRQ().equals("X")) out.print("TABLA CARGOS");%></a></td>
				<td nowrap align="right" width="10%"><a href="javascript:goAction('2',<%= ESD0202Help.getCurrentRow()%>);"><%= Util.formatCell(list.getE01DDCCOA())%></a></td>
				<td nowrap align="left" width="5%"><a href="javascript:goAction('2',<%= ESD0202Help.getCurrentRow()%>);">
													<% if (list.getE01DDCMTH().equals("F")) out.print("FIJO"); 
														if (list.getE01DDCMTH().equals("P")) out.print("PORCENTAJE");
														if (list.getE01DDCMTH().equals("1")) out.print("TASA/PLAZO");
														if (list.getE01DDCMTH().equals("E")) out.print("ESCALA/TRAMOS");%></a></td>
				<td nowrap align="center" width="5%"><a href="javascript:goAction('2',<%= ESD0202Help.getCurrentRow()%>);"><%= Util.formatCell(list.getE01DDCCCY())%></a></td>
				<td nowrap align="center" width="10%"><a href="javascript:goAction('2',<%= ESD0202Help.getCurrentRow()%>);"><%= Util.formatCell(list.getE01DDCGLN())%></a></td>
				<td nowrap align="center" width="8%"><a href="javascript:goAction('2',<%= ESD0202Help.getCurrentRow()%>);"><%= Util.formatCustomDate(currUser.getE01DTF(),list.getBigDecimalE01DDCOPM().intValue(),list.getBigDecimalE01DDCOPD().intValue(),list.getBigDecimalE01DDCOPY().intValue())%></a></td>				
				<td nowrap align="center" width="8%"><a href="javascript:goAction('2',<%= ESD0202Help.getCurrentRow()%>);"><%= Util.formatCustomDate(currUser.getE01DTF(),list.getBigDecimalE01DDCMAM().intValue(),list.getBigDecimalE01DDCMAD().intValue(),list.getBigDecimalE01DDCMAY().intValue())%></a></td>
			</tr>
			<% } %>
             </table>
             </div>
             </td>
             </tr>
</table>

  <% }  %>

<SCRIPT type="text/javascript">
    showChecked("key");
	getElement("hiddenDivNew").onclick=cancelBub;
	getElement("eibsNew").onclick=showHiddenDivNew;
  
</SCRIPT>
</form>

</body>
</html>
