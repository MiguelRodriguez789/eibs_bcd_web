<html>
<head>
<title>Tablas de Presvisiones</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "ESD200001Help" class= "datapro.eibs.beans.JBObjList"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>

<script type="text/javascript">

function goAction(op) {
	document.getElementById("opt").value = op;
	document.forms[0].submit();
}

function getParams(bank,branch) {
    document.getElementById("BANK").value = account;
    document.getElementById("BRANCH").value = branch;
}
</SCRIPT>  

</head>

<BODY>
<h3 align="center">Mantenimiento de Par�metros - Banca por Internet<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="internet_parameters.jsp, ESD2000"></h3>
<hr size="4">
<FORM name="form1" METHOD="post" action="<%=request.getContextPath()%>/servlet/com.datapro.eibs.internet.JSESD2000" >
  <p> 
    <input type=HIDDEN id="SCREEN" name="SCREEN" value="800">
    <input type=HIDDEN id="totalRow" name="totalRow" value="0">
    <input type=HIDDEN id="BANK" name="BANK">
    <input type=HIDDEN id="BRANCH" name="BRANCH">
   
    <input type=HIDDEN id="opt" name="opt">
  </p>
  <p> 
  <%if ( ESD200001Help.getNoResult() ) {%>
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
          <p><b>No hay Resultados para su Criterio de B�squeda</b></p>
          <table class="tbenter" width=100% align=center>
            <tr> 
              <td class=TDBKG width="30%"> 
                <div align="center"><a href="javascript:goAction(1)"><b>Crear</b></a></div>
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
      <td class=TDBKG width="30%"> 
        <div align="center"><a href="javascript:goAction(1)"><b>Crear</b></a></div>
      </td>
      <td class=TDBKG width="30%"> 
        <div align="center"><a href="javascript:goAction(2)"><b>Modificar</b></a></div>
      </td>
      <td class=TDBKG width="30%"> 
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
            <th align=CENTER nowrap width="10%">&nbsp;</th>
            <th align=CENTER nowrap width="20%">Banco</th>
            <th align=CENTER nowrap width="70%"><div align="center">Descripci�n</div></th>
          </tr>
          
          <%
          ESD200001Help.initRow();
          boolean firstTime = true;
          String chk = "";
          while (ESD200001Help.getNextRow()) {
				if (firstTime) {
					firstTime = false;
					chk = "checked";
				} else {
					chk = "";
				}
                 
	            datapro.eibs.beans.ESD200001Message msgList = (datapro.eibs.beans.ESD200001Message) ESD200001Help.getRecord();
		  %>
          <tr> 
            <td NOWRAP  align=CENTER width="10%"> 
              <input type="radio" id="CURRCODE" name="CURRCODE" class="highlight" value="<%= ESD200001Help.getCurrentRow() %>" <%=chk%>>
            </td>
            <td NOWRAP  align=CENTER width=\"20%\"><%= msgList.getE01INTBNK() %></td>
            <td NOWRAP  align=CENTER width=\"70%\"><%= msgList.getE01INTDSC() %></td>
          </tr>
          <%}%>
        </table>
  </table>
     
<SCRIPT type="text/javascript">
	showChecked("CURRCODE");
</SCRIPT>
<%}%>
</form>
</body>
</html>
