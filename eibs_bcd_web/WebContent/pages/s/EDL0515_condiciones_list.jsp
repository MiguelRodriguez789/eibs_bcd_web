<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput"%>
<%@ page import="datapro.eibs.master.Util,datapro.eibs.beans.EDL051501Message"%>

<html>
<head>
<title>Lista de Condiciones</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id="msglist" class="datapro.eibs.beans.JBObjList" scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/graphical.js"> </SCRIPT>

<script type="text/javascript">

function goAction(op) {

	getElement("SCREEN").value = op;
	if (op == '203') {
    	if (confirm("Desea eliminar este registro seleccionado?")) {
			document.forms[0].submit();		
    	}
  	} else {
		document.forms[0].submit();		
	}
}

</SCRIPT>  
</head>

<BODY>

<% 

 if ( !error.getERRNUM().equals("0")  ) {
     error.setERRNUM("0");
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
 }
%>

<h3 align="center">Tabla de Condiciones <img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="condiciones_list.jsp, EDL0515"></h3>
<hr size="4">

<FORM name="form" METHOD="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.params.JSEDL0515" >
  <input type=HIDDEN name="SCREEN" id="SCREEN" value="202">
    
	<p>&nbsp;</p>
	<p>&nbsp;</p>
 <% if ( msglist.getNoResult() ) { %>
  <TABLE class="tbenter" width="100%" >
    <TR>
      <TD > 
        <div align="center"> 
          <p><b>No hay resultados para su b&uacute;squeda</b></p>
          <br>
          <table class="tbenter" width=100% align=center>
           <tr>
            <td align="center" class="tdbkg" width="50%"><a href="javascript:goAction('201')"> <b>Crear</b> </a></td> 
            <td class=TDBKG width="50%"><a href="<%=request.getContextPath()%>/pages/background.jsp"><b>Salir</b></a></td>
           </tr>
         </table>
	  </div>
	  </TD>
	</TR>
    </TABLE>
	
  <% } else { %>
        
  <table class="tbenter" width=100% align=center>
    <tr> 
      <td align="center" class="tdbkg" width="25%"><a href="javascript:goAction('201')"> <b>Crear</b> </a></td>
      <td align="center" class="tdbkg" width="25%"><a href="javascript:goAction('202')"> <b>Modificar</b> </a></td>
      <td align="center" class="tdbkg" width="25%"><a href="javascript:goAction('203')"> <b>Borrar</b> </a></td>
      <td class=TDBKG width="25%"><a href="<%=request.getContextPath()%>/pages/background.jsp"><b>Salir</b></a></td>
    </tr>
  </table>
   
  <br>
  
  <TABLE  id="mainTable" class="tableinfo" style="height:200px;">
    <tr  height="5%"> 
      <td NOWRAP valign="top" width="100%"> 
		<table id="headTable" width="100%">
			<tr id="trdark">
	            <th align="center" nowrap width="5%">&nbsp;</th>
	            <th align="center" nowrap width="15%">Condiciones</th>
	            <th align="center" nowrap width="40%">Descripci&oacute;n</th>
	            <th align="center" nowrap width="40%">Vencimiento Desde</th>
			</tr>
        </table>
      </td>
    </tr>    
		  <tr  height="95%">    
		    <td nowrap="nowrap">      
		       <div id="dataDiv1" style="height:200px; overflow:auto;"> 
		       <table id="dataTable" cellspacing="0" cellpadding="1" border="0" width="100%">         
          <%
                msglist.initRow();
				boolean firstTime = true;
          		String chk = "";
                while (msglist.getNextRow()) {
                 if (firstTime) {
          				firstTime = false;
          				chk = "checked";
          			} else {
          				chk = "";
          			}  
          			EDL051501Message list = (EDL051501Message) msglist.getRecord();
            %>
		<tr id="dataTable<%= msglist.getCurrentRow() %>">
			<td nowrap align="center" width="5%"><input type="radio" name="key" value="<%=msglist.getCurrentRow()%>" <%=chk%> class="highlight" onClick="highlightRow('dataTable', <%= msglist.getCurrentRow() %>)"/></td>
			<td nowrap align="center" width="15%"><%=list.getE01CDLDLC()%></td>
			<td nowrap align="left" width="40%"><%=list.getE01CDLDSC()%></td>
			<td nowrap align="center" width="40%"><%=list.getE01CDLDYS()%></td>
		</tr>
			<%
				}
			 %>
             </table>
             </div>
             </td>
             </tr>
</table>

    
<% } %>

<SCRIPT type="text/javascript">
	showChecked("key");
</SCRIPT>

</form>
</body>
</html>
