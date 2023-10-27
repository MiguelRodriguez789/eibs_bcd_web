<html>
<head>
<title>Parámetros de Call Center</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "callList" class= "datapro.eibs.beans.JBObjList"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>

<script type="text/javascript">
function goAction(op) {
	document.forms[0].opt.value = op;
	if (op == 4){
		if(confirm("Esta seguro que desea eliminar este registro?")){
			document.forms[0].submit();
		} 
	} else {
		document.forms[0].submit();
	}
}	
</SCRIPT>  

</head>

<BODY>
<h3 align="center">Parámetros de Call Center<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="params_list.jsp, ECL0001"></h3>
<hr size="4">
<FORM name="form1" METHOD="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.misc.JSECL0001" >
  <p> 
    <input type=HIDDEN name="SCREEN" value="800">
    <input type=HIDDEN name="totalRow" value="0">
    <input type=HIDDEN name="opt">
  </p>
  <p> 
    <%
	if ( callList.getNoResult() ) {
 %>
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
          <p><b>No hay resultados para su b&uacute;squeda</b></p>
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
	
  <%  
		}
	else {
%> <% 
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
        <div align="center"><a href="javascript:goAction(4)"><b>Borrar</b></a></div>
      </td>
      <td class=TDBKG width="30%"> 
        <div align="center"><a href="<%=request.getContextPath()%>/pages/background.jsp"><b>Salir</b></a></div>
      </td>
    </tr>
  </table>
   
  <br>
  <table id=cfTable class="tableinfo">
    <tr > 
      <td NOWRAP valign="top" width="100%"> 
        <table id="headTable" width="100%">
          <tr id="trdark"> 
            <th align=CENTER nowrap width="4%"></th>
            <th align=CENTER nowrap width="16%">Banco</th>
            <th align=CENTER nowrap width="16%">Canal</th>
            <th align=CENTER nowrap width="16%">Cantidad<br>Preguntas T1</th>
            <th align=CENTER nowrap width="16%">Cantidad<br>Preguntas T2</th>
            <th align=CENTER nowrap width="16%">Cant. Respuestas<br>Inválidas</th>
            <th align=CENTER nowrap width="16%">Cantidad<br>Reintentos</th>
          </tr>
          <%
                callList.initRow();
				boolean firstTime = true;
				String chk = "";
                while (callList.getNextRow()) {
					if (firstTime) {
						firstTime = false;
						chk = "checked";
					} else {
						chk = "";
					}
                  	datapro.eibs.beans.ECL0001DSMessage msgList = (datapro.eibs.beans.ECL0001DSMessage) callList.getRecord();
		 %>
          <tr> 
            <td NOWRAP align=CENTER width="4%"> 
              <input type="radio" name="CURRCODE" value="<%= callList.getCurrentRow() %>" <%=chk%> >
            </td>
            <td NOWRAP align=CENTER width="16%"><%= msgList.getE01CATBNK() %></td>
            <td NOWRAP align=CENTER width="16%"><%= msgList.getE01CATCNL() %></td>
            <td NOWRAP align=CENTER width="16%"><%= msgList.getE01CATQT1() %></td>
            <td NOWRAP align=CENTER width="16%"><%= msgList.getE01CATQT2() %></td>
            <td NOWRAP align=CENTER width="16%"><%= msgList.getE01CATERR() %></td>
            <td NOWRAP align=CENTER width="16%"><%= msgList.getE01CATINT() %></td>
          </tr>
          <%
                }
              %>
        </table>
  </table>
     
<SCRIPT type="text/javascript">
	showChecked("CURRCODE");
</SCRIPT>

<%}%>

  </form>

</body>
</html>
