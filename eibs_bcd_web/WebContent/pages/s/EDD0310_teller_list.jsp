<%@ page import="datapro.eibs.master.Util,datapro.eibs.beans.EDD031001Message"%>

<html>
<head>
<title>Cajero</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "EDD031001Help" class= "datapro.eibs.beans.JBObjList"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>

<script type="text/javascript">

function goAction(op) {
	getElement("opt").value = op;
	
	if(op == '3'){
		if (!confirm("Desea eliminar este registro seleccionado?")) {
			return;
		}	
		document.forms[0].submit();		
 	} else {
	  document.forms[0].submit();
 	}
}

function goSearch() {
	if (getElement("SEARCHCDE").value == "") {
		alert("Favor digitar un Código para posicionarse en la lista!!!");
		return;
	}
	getElement("SCREEN").value="1";
	document.forms[0].submit();
}

</SCRIPT> 



</head>

<BODY>

<h3 align="center">Mantenimiento Cajero<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="teller_list.jsp, EDD0310"></h3>
<hr size="4">
<FORM name="form1" METHOD="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.teller.JSEDD0310" >
  <p> 
    <input type=HIDDEN name="SCREEN" id="SCREEN" value="800">
    <input type=HIDDEN name="totalRow" id="totalRow" value="0">
    <input type=HIDDEN name="idxrow" id="idxrow" >
    <input type=HIDDEN name="opt" id="opt" >
  </p>
   <p> 
    <%
	if ( EDD031001Help.getNoResult() ) {
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
          <p><b>No hay resultados para su criterio de búsqueda</b></p>
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
        <div align="center"><a href="<%=request.getContextPath()%>/pages/background.jsp"><b>Salir</b></a></div>
      </td>
    </tr>
  </table>
   
  <br>

  <TABLE  id="mainTable" class="tableinfo">
    <tr  height="5%"> 
      <td NOWRAP valign="top" width="100%"> 
		<table id="headTable" width="98%">
			<tr id="trdark">
	            <th align=CENTER nowrap width="5%">&nbsp;</th>
	            <th align=CENTER nowrap width="10%">Usuario IBS</th>
	            <th align=CENTER nowrap width="25%">Nombre Usuario</th>
	            <th align=CENTER nowrap width="10%">Usuario IBSBranch</th>
	            <th align=CENTER nowrap width="10%">Oficina</th>
	            <th align=CENTER nowrap width="10%"><div align="center">Moneda</div></th>
	            <th align=CENTER nowrap width="10%"><div align="center">Nivel</div></th>
	            <th align=CENTER nowrap width="10%"><div align="center">Tipo</div></th>
	            <th align=CENTER nowrap width="10%"><div align="center">Estado</div></th>
			</tr>
			<TR id=trdark>
				<td NOWRAP align="center" width="5%"></td>
				<td NOWRAP align="left" width="10%">
					<INPUT type="text" name="SEARCHCDE" size="13" maxlength="10" value="<%= userPO.getHeader2() %>" >
					<IMG src="<%=request.getContextPath()%>/images/ico5.gif" onclick="goSearch()" width="15" height="11" title="Posicionarse en...">
				</td>
				<TD nowrap align="center" width="25%"><B></B></TD>
				<TD nowrap align="center" width="10%"><B></B></TD>
				<TD nowrap align="center" width="10%"><B></B></TD>
				<TD nowrap align="center" width="10%"><B></B></TD>
				<TD nowrap align="center" width="10%"><B></B></TD>
				<TD nowrap align="center" width="10%"><B></B></TD>
				<TD nowrap align="center" width="10%"><B></B></TD>
	</TR> 
        </table>
      </td>
    </tr>    
		  <tr  height="95%">    
		    <td nowrap="nowrap">      
		       <div id="dataDiv1" style="height:400px; overflow:auto;"> 
		       <table id="dataTable" cellspacing="0" cellpadding="1" border="0" width="100%">         
          <%
          EDD031001Help.initRow();
          boolean firstTime = true;
          String chk = "";
          while (EDD031001Help.getNextRow()) {
				if (firstTime) {
					firstTime = false;
					chk = "checked";
				} else {
					chk = "";
				}
                 
          			EDD031001Message msgList = (EDD031001Message) EDD031001Help.getRecord();
                
		 %>
			<tr id="dataTable<%=EDD031001Help.getCurrentRow()%>">
            <td NOWRAP  align=CENTER width="5%"><input type="radio" name="key" id="key" value="<%=EDD031001Help.getCurrentRow()%>" <%=chk%> class="hightlight" onClick="highlightRow('dataTable', <%=EDD031001Help.getCurrentRow()%>)" /></td>
            <td NOWRAP  align=CENTER width="10%"><%= msgList.getE01TLMUSU() %></td>
            <td NOWRAP  align=CENTER width="25%"><%= msgList.getD01TLMDSC() %></td>
            <td NOWRAP  align=CENTER width="10%"><%= msgList.getE01TLMTID() %></td>
            <td NOWRAP  align=CENTER width="10%"><%= msgList.getE01TLMBRN() %></td> 
            <td NOWRAP  align=CENTER width="10%"><%= msgList.getE01TLMCCY() %></td>
            <td NOWRAP  align=CENTER width="10%"><%= msgList.getD01TLMLEV() %></td>
            <td NOWRAP  align=CENTER width="10%"><%= msgList.getD01TLMTYP() %></td>
            <td NOWRAP  align=CENTER width="10%"><%= msgList.getD01TLMCLF() %></td>
          </tr>
          <%
                }
              %>
             </table>
             </div>
             </td>
             </tr>
</table>
     
<SCRIPT type="text/javascript">
    showChecked("key");
</SCRIPT>
<%}%>
</form>
</body>
</html>
