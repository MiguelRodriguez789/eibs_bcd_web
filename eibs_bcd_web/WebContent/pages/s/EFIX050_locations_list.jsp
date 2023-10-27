<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput"%>
<%@ page import="datapro.eibs.master.Util,datapro.eibs.beans.EFIX05001Message"%>

<html>
<head>
<title>Tablas de Presvisiones</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "EFIX05001Help" class= "datapro.eibs.beans.JBObjList"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>

<script type="text/javascript">

function goAction(op) {

	document.getElementById("SCREEN").value = op;
	if (op == '3') {
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
<h3 align="center">Ubicaciones de Activos Fijos<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="locations_list.jsp, EFIX050"></h3>
<hr size="4">
<FORM name="form1" METHOD="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.amort.JSEFIX050" >
 
    <input type=HIDDEN id="SCREEN" name="SCREEN" value="800">
   
 <% if (EFIX05001Help.getNoResult() ) {  %>

  <p>&nbsp;</p>
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
                <div align="center"><a href="javascript:goAction(1)"><b>Crear</b></a></div>
              </td>
              <td class=TDBKG width="30%"> 
                <div align="center"><a href="javascript:checkClose()"><b>Salir</b></a></div>
              </td>
            </tr>
          </table>
          <p>&nbsp;</p>
          
        </div>

	  </TD>
	</TR>
    </TABLE>
	
  <%  } else {%>

<% 
 if ( !error.getERRNUM().equals("0")  ) {
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
        <div align="center"><a href="javascript:goAction(1)"><b>Crear</b></a></div>
      </td>
      <td class=TDBKG width="25%"> 
        <div align="center"><a href="javascript:goAction(2)"><b>Modificar</b></a></div>
      </td>
      <td class=TDBKG width="25%"> 
        <div align="center"><a href="javascript:goAction(3)"><b>Borrar</b></a></div>
      </td>
      <td class=TDBKG width="25%"> 
        <div align="center"><a href="javascript:checkClose()"><b>Salir</b></a></div>
      </td>
    </tr>
  </table>
   
  <br>
  
<TABLE id="mainTable" class="tableinfo" ALIGN=CENTER>
	<TR height="5%">
		<TD NOWRAP valign="top" width="100%">
			<TABLE id="headTable" width="100%">
			<tr id="trdark">
            	<th align="CENTER" nowrap width="5%">&nbsp;</th>
            	<th align="CENTER" nowrap width="10%">Ubicaci&oacute;n</th>
            	<th align="LEFT" nowrap width="60%">Nombre</th>
            </tr>
			</TABLE>
		</TD>
	</TR>
    <tr height="95%">    
		<TD NOWRAP>
		<div id="dataDiv1" class="scbarcolor"  style="height:400px;  overflow:auto;">
			<table id="dataTable" width="100%">
          <%
                EFIX05001Help.initRow();
				boolean firstTime = true;
				String chk = "";
                while (EFIX05001Help.getNextRow()) {
                 	EFIX05001Message msgList = (EFIX05001Message) EFIX05001Help.getRecord();
		 %>
				<tr id="dataTable<%=EFIX05001Help.getCurrentRow()%>">
		            <td NOWRAP align="CENTER" width="5%"> 
		              <input type="radio" id="CURRCODE" name="CURRCODE" value="<%= EFIX05001Help.getCurrentRow() %>" class="highlight" onClick="highlightRow('dataTable', <%=EFIX05001Help.getCurrentRow()%>)" />
		            </td>
		            <td NOWRAP  align="CENTER" width="10%"><%= msgList.getE01LOCLOC() %></td>
		            <td NOWRAP  align="LEFT" width="60%"><%= msgList.getE01LOCNME() %></td>
	          	</tr>
          <%
                }
              %>
			</table>
		</div>
		</TD>
	</tr>			
</TABLE>			
  
<SCRIPT type="text/javascript">
 	radioClick("CURRCODE", 0);
</SCRIPT>

<%}%>

</FORM>
</body>
</html>
