<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput"%>
<%@ page import="datapro.eibs.master.Util,datapro.eibs.beans.ESD020601Message"%>
<html>
<head>
<title>Aprobación Reintegro/Reversión de Comisiones</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "ESD0206Help" class= "datapro.eibs.beans.JBObjList"  scope="session" />
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


</SCRIPT>  

</head>

<BODY>
<h3 align="center">Aprobación Reintegro/Reversión de Comisiones
	<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="reversal_fees_approval.jsp,ESD0206"></h3>
<hr size="4">
<form name="form1" METHOD="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.params.JSESD0206" >
  <input type=HIDDEN name="SCREEN" value="6">
  <input type=HIDDEN name="action" value=" ">
  <input type=hidden name="TABLE" value="<%= userPO.getHeader4().trim()%>"> 
  <input type=hidden name="CUSTOMER" value="<%= userPO.getHeader3().trim()%>">  
  <input type=hidden name="E01RTETAR" value=" ">
  <INPUT TYPE=HIDDEN NAME="totalRow" id="totalRow" VALUE="0">
	<% int row = 0;
	 int indexRow = 0; %>	
	


  <%
  	if (ESD0206Help.getNoResult()) {
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
		      <TH ALIGN=center nowrap width="5%" >&nbsp;</TH>
		      <TH ALIGN=center nowrap width="10%">Número<br>Cuenta</TH>
		      <TH ALIGN=center nowrap width="5%">Número<br>Cliente</TH>
		      <TH ALIGN=center nowrap width="25%">Nombre</TH>
		      <TH ALIGN=center nowrap width="5%">Secuencia</TH>
		      <TH ALIGN=center nowrap width="10%">Fecha<br>Proceso</TH>
		      <TH ALIGN=center nowrap width="5%">Comision</TH>
		      <TH ALIGN=center nowrap width="20%">Descripcion</TH>
		      <TH ALIGN=center nowrap width="15%">Valor Comision</TH>
			</tr>
        </table>
      </td>
    </tr>    
		  <tr  height="95%">    
		    <td nowrap="nowrap">      
		       <div id="dataDiv1" style="height:400px; overflow:auto;"> 
		       <table id="dataTable" cellspacing="0" cellpadding="1" border="0" width="100%">         
		<%
          	ESD0206Help.initRow();
				indexRow = 0;
          		boolean firstTime = true;
          		String chk = "";
          		while (ESD0206Help.getNextRow()) {
          			if (firstTime) {
          				firstTime = false;
          				chk = "checked";
          			} else {
          				chk = "";
          			}
          			ESD020601Message list = (ESD020601Message) ESD0206Help.getRecord();
          %>
			<tr id="dataTable<%=ESD0206Help.getCurrentRow()%>">
				<td nowrap align="center" width="5%"> <input type="radio" name="key" value="<%=ESD0206Help.getCurrentRow()%>" <%=chk%>
					class="highlight" onClick="highlightRow('dataTable', <%=ESD0206Help.getCurrentRow()%>)" /></td>
				<td nowrap align="center" width="10%"><%= Util.formatCell(list.getE01CACACC())%></td>
				<td nowrap align="center" width="5%"><%= Util.formatCell(list.getE01CACCUN())%></td>
				<td nowrap align="left" width="25%"><%= Util.formatCell(list.getE01CUSNA1())%></td>
				<td nowrap align="center" width="5%"><%= Util.formatCell(list.getE01CACSEQ())%></td>
				<td nowrap align="center" width="10%"><%= Util.formatCustomDate(currUser.getE01DTF(),list.getBigDecimalE01CACRDD().intValue(),list.getBigDecimalE01CACRDM().intValue(),list.getBigDecimalE01CACRDY().intValue())%></td>
				<td nowrap align="center" width="5%"><%= Util.formatCell(list.getE01CACCDE())%></td>
				<td nowrap align="left" width="20%"><%= Util.formatCell(list.getD01CACCDE())%></td>
				<td nowrap align="center" width="15%"><%= Util.formatCell(list.getE01CACCOA())%></td>
			</tr>
			<%
    		indexRow++;
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
