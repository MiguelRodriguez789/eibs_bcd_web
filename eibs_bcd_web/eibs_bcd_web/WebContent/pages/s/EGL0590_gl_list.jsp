<html>
<head>
<title>GL List</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "glList" class= "datapro.eibs.beans.JBObjList"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>

<script type="text/javascript">
function goAction(op) {
	document.forms[0].opt.value = op;
	document.forms[0].submit();
}
</SCRIPT>  

</head>

<BODY>
<h3 align="center">Cuentas de Tesoreria<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="gl_list.jsp, EGL0590"></h3>
<hr size="4">
<FORM name="form1" METHOD="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.forex.JSEGL0590" >
  <p> 
    <input type=hidden name="SCREEN" 	value="300">
    <input type=hidden name="totalRow" 	value="0">
    <input type=hidden name="BANK" 		value="<%=userPO.getBank()%>">
    <input type=hidden name="opt">
  </p>
  <p> 
  <%if ( glList.getNoResult() ) {%>
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
          <p><b>No hay resultados para su criterio de busqueda</b></p>
          <table class="tbenter" width=100% align=center>
            <tr> 
              <td class=TDBKG width="30%"> 
                <div align="center"><a href="<%=request.getContextPath()%>/pages/background.jsp"><b>Salida</b></a></div>
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
  <p> 
  <table class="tbenter" width=100% align=center>
    <tr> 
      <td class=TDBKG width="33%"> 
        <div align="center"><a href="javascript:goAction('T')"><b>Total</b></a></div>
      </td>
		<td class=TDBKG width="33%"> 
        <div align="center"><a href="javascript:goAction('D')"><b>Detalle</b></a></div>
      </td>
      <td class=TDBKG width="33%"> 
        <div align="center"><a href="<%=request.getContextPath()%>/pages/background.jsp"><b>Salida</b></a></div>
      </td>
    </tr>
  </table>
   
  <br>
  <TABLE  id="mainTable" class="tableinfo">
    <tr  height="5%"> 
      <td NOWRAP valign="top" width="100%"> 
		<table id="headTable" width="100%">
			<tr id="trdark">
	            <th align="center" nowrap width="5%">&nbsp;</th>
	            <th align="center" nowrap width="25%">Numero de Cuenta</th>
	            <th align="center" nowrap width="10%"><div align="center">Moneda</div></th>
	            <th align="center" nowrap width="20%"><div align="center">Descripcion</div></th>
	            <th align="center" nowrap width="20%"><div align="center">Tipo</div></th>
	            <th align="center" nowrap width="20%"><div align="center"> Balance Inicial</div></th>
			</tr>
        </table>
      </td>
    </tr>    
		  <tr  height="95%">    
		    <td nowrap="nowrap">      
		       <div id="dataDiv1" style="height:400px; overflow:auto;"> 
		       <table id="dataTable" cellspacing="0" cellpadding="1" border="0" width="100%">         
          <%
          glList.initRow();
          boolean firstTime = true;
          String chk = "";
          while (glList.getNextRow()) {
				if (firstTime) {
					firstTime = false;
					chk = "checked";
				} else {
					chk = "";
				}
                 
                datapro.eibs.beans.EGL059001Message msgList = (datapro.eibs.beans.EGL059001Message) glList.getRecord();
		 %>
		<tr id="dataTable<%= glList.getCurrentRow() %>">
			<td nowrap align="center" width="5%"><input type="radio" id="CURRCODE" name="CURRCODE" value="<%=glList.getCurrentRow()%>" <%=chk%> class="highlight" onClick="highlightRow('dataTable', <%= glList.getCurrentRow() %>)"/></td>
            <td NOWRAP  align="center" width="25%"><%= msgList.getE01GLMGLN() %></td>
            <td NOWRAP  align="center" width="10%"><%= msgList.getE01GLMCCY() %></td>
            <td NOWRAP  align="center"   width="20%"><%= msgList.getE01GLMDSC() %></td>
            <td NOWRAP  align="center" width="20%"><%= msgList.getE01GLMATY() %></td>
            <td NOWRAP  align="right"  width="20%"><%= msgList.getE01GLMBBL() %></td>
          </tr>
          <%}%>
             </table>
             </div>
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
