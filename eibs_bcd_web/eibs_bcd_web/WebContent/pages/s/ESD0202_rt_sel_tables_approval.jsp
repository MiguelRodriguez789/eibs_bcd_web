<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput"%>
<%@ page import="datapro.eibs.master.Util,datapro.eibs.beans.ESD020201Message"%>
<html>
<head>
<title>Comisiones-Aprobación Definición de Cargos</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "ESD0202Help" class= "datapro.eibs.beans.JBObjList"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>

<script type="text/javascript">

function goAction(op) {

	document.forms[0].action.value = op;
	if (op == 'D') {
    	if (confirm("Desea eliminar este registro seleccionado?")) {
			document.forms[0].submit();		
    	}
  	} else if (op == 'I') {
		document.forms[0].SCREEN.value = "7";
		document.forms[0].submit();
  	} else {
		document.forms[0].submit();
	}
}


function CheckAcc(op){

	document.forms[0].SCREEN.value = op;
	if(document.forms[0].E01DDCCDE.value.length < 1){
		alert("Ingrese un código de comisión válido");
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
<h3 align="center">Comisiones-Aprobación Definición de Cargos
	<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="rt_sel_tables_approval.jsp,ESD0202"></h3>
<hr size="4">
<form name="form1" METHOD="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.params.JSESD0202" >
  <input type=HIDDEN name="SCREEN" value="6">
  <input type=HIDDEN name="action" value=" ">
  <input type=hidden name="TABLE" value="<%= userPO.getHeader4().trim()%>"> 
  <input type=hidden name="CUSTOMER" value="<%= userPO.getHeader3().trim()%>">  
  <input type=hidden name="E01RTETAR" value=" ">

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
      <td class=TDBKG width="25%"> 
        <div align="center"><a name="linkApproval" href="javascript:goAction('A')"><b>Aprobar</b></a></div>
      </td>
      <td class=TDBKG width="25%"> 
        <div align="center"><a name="linkReject" href="javascript:enterReason('R')"><b>Rechazar</b></a></div>
      </td>
      <td class=TDBKG width="25%"> 
        <div align="center"><a href="javascript:goAction('D')"><b>Eliminar</b></a></div>
      </td>
      <td class=TDBKG width="25%"> 
        <div align="center"><a href="javascript:goAction('I')"><b>Consultar</b></a></div>
      </td>
    </tr>
  </table>
   
  <br>
  
  <TABLE  id="mainTable" class="tableinfo" style="height:400px;">
    <tr  height="5%"> 
      <td NOWRAP valign="top" width="100%"> 
		<table id="headTable" width="100%">
			<tr id="trdark">
	            <th align=CENTER nowrap width="5%">&nbsp;</th>
	            <th align=CENTER nowrap width="15%">Código de Comisión</th>
	            <th align=CENTER nowrap width="30%">Descripción de Comisión</th>
	            <th align=CENTER nowrap width="20%">Cuenta Contable</th>
	            <th align=CENTER nowrap width="10%">I.V.A</th>
	            <th align=CENTER nowrap width="10%">Fecha Inicio</th>
	            <th align=CENTER nowrap width="10%">Fecha Cierre</th>
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
				<td nowrap align="center" width="5%"> <input type="radio" name="key" value="<%=ESD0202Help.getCurrentRow()%>" <%=chk%>
					class="highlight" onClick="highlightRow('dataTable', <%=ESD0202Help.getCurrentRow()%>)" /></td>
				<td nowrap align="center" width="15%"><%= Util.formatCell(list.getE01DDCCDE())%></td>
				<td nowrap align="left" width="30%"><%= Util.formatCell(list.getE01DDCDSC())%></td>
				<td nowrap align="center" width="20%"><%= Util.formatCell(list.getE01DDCGLN())%></td>
				<td nowrap align="center" width="10%"><%= Util.formatCell(list.getE01DDCTAX())%></td>
				<td nowrap align="center" width="10%"><%= Util.formatCustomDate(currUser.getE01DTF(),list.getBigDecimalE01DDCOPM().intValue(),list.getBigDecimalE01DDCOPD().intValue(),list.getBigDecimalE01DDCOPY().intValue())%></td>				
				<td nowrap align="center" width="10%"><%= Util.formatCustomDate(currUser.getE01DTF(),list.getBigDecimalE01DDCMAM().intValue(),list.getBigDecimalE01DDCMAD().intValue(),list.getBigDecimalE01DDCMAY().intValue())%></td>
			</tr>
			<%
				}
			%>
             </table>
             </div>
             </td>
             </tr>
</table>


  <% }  %>

<SCRIPT type="text/javascript">
    showChecked("key");

</SCRIPT>
</form>

</body>
</html>
