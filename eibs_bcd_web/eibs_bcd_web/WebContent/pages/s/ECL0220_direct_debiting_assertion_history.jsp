<html> 
<head>
<title>Confirmación de Domiciliaciones</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<%@ page import = "datapro.eibs.master.Util" %>

<jsp:useBean id= "appList" class= "datapro.eibs.beans.JBObjList"  scope="session" />
<jsp:useBean id= "msgDetail" class= "datapro.eibs.beans.ECL022001Message"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>

</head>

 <% 
 if ( !error.getERRNUM().equals("0")  ) {
 	 error.setERRNUM("0");
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
 }
%>
<body >
<h3 align="center">Confirmación de Domiciliaciones<br>Historial de Seguimiento
<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="direct_debiting_assertion_history.jsp, ECL0220"></h3>
<hr size="4">
<FORM name="form1" METHOD="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.misc.JSECL0220" >
  <input type=HIDDEN name="SCREEN" value="5">
  
 <%
	if ( appList.getNoResult() ) {
 %>
  <p>&nbsp;</p>
  <TABLE class="tbenter" width="100%" >
    <TR>
      <TD > 
        <div align="center"> 
          <p><b>No hay resultados para su b&uacute;squeda</b></p>
	    </div>
	  </TD>
	</TR>
  </TABLE>
	
  <%  
		}
	else {
%> 
  <TABLE  id=cfTable class="tableinfo">
 <TR > 
    <TD NOWRAP valign="top" width="100%">
        <table id="headTable" width="100%">
          <tr id="trdark"> 
            <th align=CENTER nowrap width="15%"><div align="center">RIF de la Compañía</div></th>
            <th align=CENTER nowrap width="15%"><div align="center">Número<br>de Contrato</div></th>
            <th align=CENTER nowrap width="15%"><div align="center">ID del Pagador</div></th>
            <th align=CENTER nowrap width="15%"><div align="center">Fecha de Gestión</div></th>
            <th align=CENTER nowrap width="15%"><div align="center">Hora de Gestión</div></th>
            <th align=CENTER nowrap width="23%"><div align="center">Comentarios</div></th>
          </tr>
     	<%
        appList.initRow(); 
		boolean firstTime = true;
		String chk = "";
        while (appList.getNextRow()) {
			if (firstTime) {
				firstTime = false;
				chk = "checked";
			} else {
				chk = "";
			}
           datapro.eibs.beans.ECL022002Message msgPart = (datapro.eibs.beans.ECL022002Message) appList.getRecord();
     	%>               
        <TR>
			<TD NOWRAP ALIGN="CENTER"><%=Util.formatCell(msgPart.getE02LOGEMP())%></TD>
			<TD NOWRAP ALIGN="CENTER"><%=Util.formatCell(msgPart.getE02LOGCON())%></TD>
			<TD NOWRAP ALIGN="CENTER"><%=Util.formatCell(msgPart.getE02LOGIDE())%></TD>
			<TD NOWRAP ALIGN="CENTER"><%=Util.formatCell(msgPart.getE02LOGDIA())%>/<%=Util.formatCell(msgPart.getE02LOGMES())%>/<%=Util.formatCell(msgPart.getE02LOGANO())%></TD>
			<TD NOWRAP ALIGN="CENTER"><%=Util.formatCell(msgPart.getE02LOGTIM())%></TD>
			<TD NOWRAP ALIGN="CENTER"><%=Util.formatCell(msgPart.getE02LOGGE1())%></TD>
		</TR>    		
    	<%}%>    
        </table>
    </table>

  <%}%>

</form>

</body>
</html>
