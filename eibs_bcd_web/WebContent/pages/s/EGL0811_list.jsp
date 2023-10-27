<%@ page import ="datapro.eibs.master.Util, datapro.eibs.beans.EGL081101Message" %>

<%@page import="datapro.eibs.beans.EGL081101Message"%><html>
<head>
<title>Lista Cuentas Reconciliables</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<jsp:useBean id= "EGL081101Help" class= "datapro.eibs.beans.JBObjList"  scope="session" />
<jsp:useBean id= "optList1" class= "datapro.eibs.beans.JBList"  scope="session" />
<jsp:useBean id= "optList" class= "datapro.eibs.beans.JBList"  scope="session" />

<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />
<jsp:useBean id="error" class="datapro.eibs.beans.ELEERRMessage"
	scope="session" />
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>
<script type="text/javascript">
function goAction(op) {
	if (op == "1") {
	       document.forms[0].SCREEN.value="100";
	       document.forms[0].opt.value = op;
	       document.forms[0].submit();
}
}

function getParams(currrow,cli,gln) {

	document.forms[0].CURRENTROW.value = currrow;
    document.forms[0].CLI.value = cli;
    document.forms[0].GLN.value = gln;
}


function inipos(pos) {
    document.forms[0].pos.value = pos;
alert(document.forms[0].pos.value);
}
</SCRIPT>
<SCRIPT type="text/javascript"
	src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<SCRIPT type="text/javascript"
	src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>
</head>
<BODY>
<h3 align="center">Consulta Cuentas Reconciliables</h3>
<P align="center">
	<IMG src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="list.jsp, EGL0811">
	<INPUT type="text" name="DSC" size="3" maxlength="2" value="<%= userPO.getBank().trim()%>" readonly>-
	<INPUT type="text" name="DSC1" size="5" maxlength="4" value="<%= userPO.getBranch().trim()%>" readonly>-
	<INPUT type="text" name="DSC2" size="4" maxlength="3" value="<%= userPO.getCurrency().trim()%>" readonly>-
	<INPUT type="text" name="DSC3" size="20" maxlength="16" value="<%= userPO.getAccNum().trim()%>" readonly>-
	<INPUT type="text" name="DSC4" size="20" maxlength="16" value="<%= userPO.getIdentifier().trim()%>" readonly>-
	<INPUT type="text" name="DSC5" size="40" maxlength="40" value="<%= userPO.getCusName().trim()%>" readonly>
</P>
<HR size="4" width="100%" align="right">
<FORM name="form1" METHOD="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEGL0811" >
  <p> 
    <INPUT TYPE=HIDDEN NAME="CURRENTROW" VALUE="0"> 
    <input type=HIDDEN name="SCREEN" value="800">
    <input type=HIDDEN name="totalRow" value="0">
    <input type=HIDDEN name="opt">
    <input type=HIDDEN name="CLI" value=" " size=2 maxlength=1>
    <input type=HIDDEN name="GLN" value=" " size=2 maxlength=1>
    <input type=HIDDEN name="pos">
  </p>
  <p> 
    <%
	if ( EGL081101Help.getNoResult() ) {
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
                <div align="center"> <a href="javascript:goAction(1)"><b>Nueva Consulta</b></a> </div>
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

String chk = "";

 if ( !error.getERRNUM().equals("0")  ) {
     error.setERRNUM("0");
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
     }

%> 
  <table class="tbenter" width=100% align=center>
            <tr> 
              <td class=TDBKG width="30%"> 
                <div align="center"> <a href="javascript:goAction(1)"><b>Nueva Consulta</b></a> </div>
              </td>
              <td class=TDBKG width="30%"> 
                <div align="center"><a href="<%=request.getContextPath()%>/pages/background.jsp"><b>Salir</b></a></div>
              </td>
            </tr>
          </table>

 <table id="headTable" width="100%">
<%
	EGL081101Message msgList = null;
   	EGL081101Help.initRow();
   	if (EGL081101Help.getNextRow()) {
   		msgList = (EGL081101Message) EGL081101Help.getRecord();
%>
          <tr id="trdark"> 
            <th align=CENTER nowrap width="10%"> <div align="right">Saldo Inicial 
			<div> <INPUT type="text" name="BALANCE" size="20" maxlength="20" value="<%= msgList.getE01INPINB()%>" readonly></div>
			</div>
			</th>
          </tr> 
<%
 }
%>
 </table>

  <table  id=cfTable class="tableinfo">
    <tr > 
      <td NOWRAP valign="top" width="100%"> 
        <table id="headTable" width="100%">
          <tr id="trdark"> 
            <th align=CENTER nowrap width="10%"> <div align="center">Lote</div> </th>
            <th align=CENTER nowrap width="25%"> <div align="center">Fecha Batch</div> </th>
            <th align=CENTER nowrap width="25%"> <div align="center">Fecha Valor</div> </th>
            <th align=CENTER nowrap width="25%"> <div align="center">Descripci�n</div> </th>
            <th align=CENTER nowrap width="15%"> <div align="center">Monto</div> </th>
            <th align=CENTER nowrap width="5%"> <div align="center">DB/CR</div> </th>
            <th align=CENTER nowrap width="5%"> <div align="center">CD</div> </th>
            <th align=CENTER nowrap width="10%"> <div align="center">Referencia</div> </th>
            <th align=CENTER nowrap width="15%"> <div align="left">Saldo</div> </th>
           </tr>
          <%
                EGL081101Help.initRow();
                chk = "checked";
                while (EGL081101Help.getNextRow()) {
                 
                  msgList = (EGL081101Message) EGL081101Help.getRecord();
		 %>
          <tr> 
            <td NOWRAP  align=CENTER width=\"10%\"><%= msgList.getE01TRABTH() %></td>
            <td NOWRAP  align=CENTER width=\"25%\"><%= msgList.getE01DTEBTH() %></td>
            <td NOWRAP  align=CENTER width=\"25%\"><%= msgList.getE01DTEVAL() %></td>
            <td NOWRAP  align=CENTER width=\"25%\"><%= msgList.getE01INPTDS() %></td>
			<td NOWRAP  align=CENTER width=\"15%\"><%= msgList.getE01INPAMN() %></td>
            <td NOWRAP  align=CENTER width=\"5%\"><%= msgList.getE01INPDC() %></td>
			<td NOWRAP  align=CENTER width=\"5%\"><%= msgList.getE01TRACDE() %></td>
			<td NOWRAP  align=CENTER width=\"15%\"><%= msgList.getE01INPBAL() %></td>
          </tr>
          <%
    				chk = "";     
                }
              %>
        </table>
        </td>
        </tr>
  </table>
  <BR>
  <TABLE class="tbenter" WIDTH="98%" ALIGN=CENTER>
  <TR>
  <TD WIDTH="50%" ALIGN=LEFT>
  <%
        if ( EGL081101Help.getShowPrev() ) {
		int pos = EGL081101Help.getFirstRec() - 20;
   			out.println("<A HREF=\""+request.getContextPath()+"/servlet/datapro.eibs.products.JSEGL0811?SCREEN=200&Pos=" + pos +"\"><img src=\""+request.getContextPath()+"/images/s/previous_records.gif\" border=0></A>");
        }
  %>
  </TD>
  <TD WIDTH="50%" ALIGN=RIGHT>
  <%
        if ( EGL081101Help.getShowNext() ) {
		int pos = EGL081101Help.getLastRec();
   			out.println("<A HREF=\""+request.getContextPath()+"/servlet/datapro.eibs.products.JSEGL0811?SCREEN=200&Pos=" + pos +"\"><img src=\""+request.getContextPath()+"/images/s/next_records.gif\" border=0></A>");
        }
  %> 
 </TD>
 </TR>
 </TABLE>
<SCRIPT type="text/javascript">
	showChecked("CURRCODE");
</SCRIPT>
<%}%>
<DIV align="center"></DIV>
<div align="center"> 
</div>
</form>
</body>
</html>