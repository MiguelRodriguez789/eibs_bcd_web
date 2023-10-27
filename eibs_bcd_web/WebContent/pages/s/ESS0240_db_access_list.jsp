<%@ page import = "datapro.eibs.master.Util" %>
<html>
<head>
<title>Lista de Acceso a Base de Datos</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "dbList" 	class= "datapro.eibs.beans.JBObjList"  			scope="session" />
<jsp:useBean id= "error" 	class= "datapro.eibs.beans.ELEERRMessage"  		scope="session" />
<jsp:useBean id= "userPO" 	class= "datapro.eibs.beans.UserPos"  			scope="session" />
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  	scope="session" />

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>

<script type="text/javascript">
function goAction(acc, apc) {

	document.forms[0].ACCNUMBER.value = acc;
	document.forms[0].APCCDE.value = apc;
	document.forms[0].submit();
}
</SCRIPT>  

</head>

<BODY>
<h3 align="center">Acceso a Base de Datos<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="db_access_list.jsp, ESS0240"></h3>
<hr size="4">
<FORM name="form1" METHOD="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.security.JSESS0240" >
  <p> 
    <input type=hidden name="SCREEN" value="300">
    <input type=hidden name="ACCNUMBER" value="">
    <input type=hidden name="APCCDE" value="">
  </p>
  <p> 
  <%if ( dbList.getNoResult() ) {%>
  </p>
  <p>&nbsp;</p>
  <p>&nbsp;</p>
  <p>&nbsp;</p>
  <p>&nbsp;</p>
  <p>&nbsp;</p>
  <TABLE class="tbenter" width="100%" >
    <TR>
      <TD > 
        <div align="center"> 
          <p><b>No hay resultados para su criterio de búsqueda</b></p>
          <table class="tbenter" width=100% align=center>
            <tr> 
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
	<%} else {
		if ( !error.getERRNUM().equals("0")  ) {
     		error.setERRNUM("0");
     		out.println("<SCRIPT Language=\"Javascript\">");
	     	out.println("       showErrors()");
     		out.println("</SCRIPT>");
     	}
	%> 

  <table class="tbenter" width=100% align=center>
    <tr> 
      <td class=TDBKG width="100%"> 
        <div align="center"><a href="<%=request.getContextPath()%>/pages/background.jsp"><b>Salir</b></a></div>
      </td>
    </tr>
  </table>
   
  <br>
  <table  id=cfTable class="tableinfo">
    <tr > 
      <td NOWRAP valign="top" width="100%"> 
        <table id="headTable" width="100%">
          <tr id="trdark"> 
            <th align=CENTER nowrap width="10%">Fecha</th>
            <th align=CENTER nowrap width="10%"></th>
            <th align=CENTER nowrap width="10%"> 
              <div align="center">Referencia</div>
            </th>
            <th align=CENTER nowrap width="10%"> 
              <div align="center">Operador</div>
            </th>
            <th align=CENTER nowrap width="25%"> 
              <div align="center">Nombre</div>
            </th>
            <th align=CENTER nowrap width="10%"> 
              <div align="center">Supervisor</div>
            </th>
            <th align=CENTER nowrap width="25%"> 
              <div align="center">Nombre</div>
            </th>
          </tr>
          <%
          dbList.initRow();
          boolean firstTime = true;
          String chk = "";
          while (dbList.getNextRow()) {
				if (firstTime) {
					firstTime = false;
					chk = "checked";
				} else {
					chk = "";
				}
                 
                datapro.eibs.beans.ESS024002Message msgList = (datapro.eibs.beans.ESS024002Message) dbList.getRecord();
		 %>
          <tr> 
            <td NOWRAP  align=CENTER width=\"10%\"><a href="javascript:goAction('<%= msgList.getE02NUMREF() %>','<%= msgList.getE02APLCDE() %>')"><%= Util.formatCustomDate(currUser.getE01DTF(),
            																																					msgList.getBigDecimalE02DATERM().intValue(),	
            																																					msgList.getBigDecimalE02DATERD().intValue(),	
            																																					msgList.getBigDecimalE02DATERY().intValue()) %></a></td>
            <td NOWRAP  align=CENTER width=\"10%\"><a href="javascript:goAction('<%= msgList.getE02NUMREF() %>','<%= msgList.getE02APLCDE() %>')"><%= msgList.getE02NUMREF() %></a></td>
            <td NOWRAP  align=RIGHT  width=\"10%\"><a href="javascript:goAction('<%= msgList.getE02NUMREF() %>','<%= msgList.getE02APLCDE() %>')"><%= msgList.getE02USERID() %></a></td>
            <td NOWRAP  align=CENTER width=\"25%\"><a href="javascript:goAction('<%= msgList.getE02NUMREF() %>','<%= msgList.getE02APLCDE() %>')"><%= msgList.getE02USRNME() %></a></td>
            <td NOWRAP  align=LEFT   width=\"10%\"><a href="javascript:goAction('<%= msgList.getE02NUMREF() %>','<%= msgList.getE02APLCDE() %>')"><%= msgList.getE02MNPUSA() %></a></td>
            <td NOWRAP  align=CENTER width=\"25%\"><a href="javascript:goAction('<%= msgList.getE02NUMREF() %>','<%= msgList.getE02APLCDE() %>')"><%= msgList.getE02USANME() %></a></td>
          </tr>
          <%}%>
        </table>
        </td>
        </tr>
  </table>
     
<SCRIPT type="text/javascript">
	showChecked("CURRCODE");
</SCRIPT>
<%}%>
</form>
</body>
</html>
