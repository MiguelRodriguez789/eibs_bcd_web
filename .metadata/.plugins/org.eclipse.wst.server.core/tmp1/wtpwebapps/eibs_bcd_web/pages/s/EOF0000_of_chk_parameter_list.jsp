<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput"%>
<%@ page import="datapro.eibs.master.Util,datapro.eibs.beans.EOF000001Message"%>
<%@page import="com.datapro.constants.EibsFields"%>

<html>
<head>
<title>Formatos de Cheques Oficiales</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "EOF000001Help" class= "datapro.eibs.beans.JBObjList"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>

<script type="text/javascript">



  function goAction(op) {
	var ok = false;
	var cun = "";
	var pg = "";

	document.forms[0].SCREEN.value = op;
    
    if (op == '13') {
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

 <h3 align="center">Parametros de Control de Cheques de Gerencia<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="of_chk_parameter_list.jsp, EOF0000"></h3>
<hr size="4">
<FORM name="form1" METHOD="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.params.JSEOF0000" >
  <p> 
    <input type=HIDDEN name="SCREEN" value="12">
 	<input type=HIDDEN name="BANK">
    <input type=HIDDEN name="BRANCH">
   
    <input type=HIDDEN name="opt">
  </p>
  <p> 
    <%
	if ( EOF000001Help.getNoResult() ) {
 %>
  </p>
  <p>&nbsp;</p>
  <p>&nbsp;</p>
  <TABLE class="tbenter" width="100%" >
    <TR>
      <TD > 
        <div align="center"> 
          <p><b>No hay resultados para su b&uacute;squeda</b></p>
          <table class="tbenter" width=100% align=center>
            <tr> 
              <td class=TDBKG width="30%"> 
                <div align="center"><a href="javascript:goAction(11)"><b>Crear</b></a></div>
              </td>
              <td class=TDBKG width="30%"> 
                <div align="center"><a href="<%=request.getContextPath()%>/pages/background.jsp"><b>Salir</b></a></div>
              </td>
            </tr>
          </table>
          <p>&nbsp;</p>
        </div>
	  </TD>
	</TR>
    </TABLE>
	
<% } else {%> 

  <table class="tbenter" width=100% align=center>
    <tr> 
      <td class=TDBKG width="25%"> 
        <div align="center"><a href="javascript:goAction(11)"><b>Crear</b></a></div>
      </td>
		<td class=TDBKG width="25%"> 
        <div align="center"><a href="javascript:goAction(12)"><b>Modificar</b></a></div>
      </td>
      <td class=TDBKG width="25%"> 
        <div align="center"><a href="javascript:goAction(13)"><b>Borrar</b></a></div>
      </td>
      <td class=TDBKG width="25%"> 
        <div align="center"><a href="<%=request.getContextPath()%>/pages/background.jsp"><b>Salir</b></a></div>
      </td>
    </tr>
  </table>
   
  <br>
 <TABLE  id="mainTable" class="tableinfo"  height="60%" width="80%">
 <tr height="5%"> 
   <td NOWRAP valign="top" width="80%" >
        <table id="headTable" width="100%">
          <tr id="trdark"> 
            <th align=CENTER nowrap width="5%">&nbsp;</th>
            <th align=CENTER nowrap width="15%">Formato</th>
            <th align=CENTER nowrap width="30%"> 
              <div align="center">Descripci&oacute;n</div>
            </th>
            <th align=CENTER nowrap width="25%"> 
              <div align="center">Cuenta Contable <br> Cheques x Imprimir</div>
            </th>
            <th align=CENTER nowrap width="25%"> 
              <div align="center">Cuenta Contable <br> Cheques Impresos</div>
            </th>
          </table>
    </td>
 </tr>

          	<tr  height="100%"> 
          	<td nowrap="nowrap">     
          	<div id="dataDiv1" style="height:100%; overflow:auto;">   
			<table id="dataTable" cellspacing="0" cellpadding="1" border="0" width="100%">
			
          <%
                EOF000001Help.initRow();
				boolean firstTime = true;
				String chk = "";
        		while (EOF000001Help.getNextRow()) {
					if (firstTime) {
						firstTime = false;
						chk = "checked";
					} else {
						chk = "";
					}
				EOF000001Message msgList= (EOF000001Message) EOF000001Help.getRecord();
		 %>
		 
		<tr id="dataTable<%= EOF000001Help.getCurrentRow() %>">
	    	<td nowrap  ALIGN=center width="5%"><input type="radio" name="key" value="<%= EOF000001Help.getCurrentRow() %>" <%=chk%> class="highlight" onClick="highlightRow('dataTable', <%= EOF000001Help.getCurrentRow() %>)"></td>
            <td NOWRAP  align=CENTER width="15%"><%= msgList.getE01OFCFTY() %></td>
            <td NOWRAP  align=LEFT width="30%"><%= msgList.getE01OFCDSC() %></td>
            <td NOWRAP  align=CENTER width="25%"><%= msgList.getE01OFCXPR() %></td>
			<td NOWRAP  align=CENTER width="25%"><%= msgList.getE01OFCPRT() %></td>
        </tr>
          <%  } %>
        </table>
        </div>
        </td>
        </tr>
  </table>
     <%}%>
     </form>
<SCRIPT type="text/javascript">
  showChecked("key");
</SCRIPT>




  

</body>
</html>
