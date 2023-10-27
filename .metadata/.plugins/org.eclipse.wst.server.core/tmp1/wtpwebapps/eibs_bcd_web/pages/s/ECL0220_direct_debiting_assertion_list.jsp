<html> 
<head>
<title>Confirmación de Domiciliaciones</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<%@ page import = "datapro.eibs.master.Util" %>

<jsp:useBean id= "appList" class= "datapro.eibs.beans.JBObjList"  scope="session" />
<jsp:useBean id= "msgCD" class= "datapro.eibs.beans.ECL022001Message"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>

<script type="text/javascript">

function goAction(op) {
	document.forms[0].opt.value = op;
	if (op == 4){
		if(confirm("¿Está seguro que desea eliminar este registro?")){
			document.forms[0].submit();
		} 
	} else {
		document.forms[0].submit();
	}
}

function getDetail(rowNum)
{
	page = "<%=request.getContextPath()%>/servlet/datapro.eibs.misc.JSECL0220?SCREEN=3&ROW=" + rowNum;
	CenterWindow(page,800,500,2);
}

</SCRIPT>  

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
<h3 align="center">Confirmación de Domiciliaciones
<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="direct_debiting_assertion_list.jsp, ECL0220"></h3>
<hr size="4">
<FORM name="form1" METHOD="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.misc.JSECL0220" >
  <input type=HIDDEN name="SCREEN" value="5">
  <input type=HIDDEN name="opt" value="1">
  <input type=HIDDEN name="totalRow" value="0">
  <input type=HIDDEN name="CURRENTROW" value="">
  <input type=HIDDEN name="SEL" value="">
  
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
  <p> 
          
  <table class="tbenter" width=100% align=center>
    <tr> 
      <td class=TDBKG> 
 		<div align="center"><a href="javascript:goAction(1)"><b>Historial de Seguimiento</b></a></div>
      </td>
      <td class=TDBKG> 
        <div align="center"><a href="<%=request.getContextPath()%>/pages/background.jsp"><b>Salir</b></a></div>
      </td>
    </tr>
  </table>
   
  <br>
  
  <TABLE  id=cfTable class="tableinfo">
 <TR > 
    <TD NOWRAP valign="top" width="100%">
        <table id="headTable" width="100%">
          <tr id="trdark"> 
            <th align=CENTER nowrap width="2%">&nbsp;</th>
            <th align=CENTER nowrap width="18%"><div align="center">Referencia</div></th>
            <th align=CENTER nowrap width="20%"><div align="center">RIF de la Compañía</div></th>
            <th align=CENTER nowrap width="20%"><div align="center">Nombre<br>de la Compañía</div></th>
            <th align=CENTER nowrap width="20%"><div align="center">Número<br>de Contrato</div></th>
            <th align=CENTER nowrap width="20%"><div align="center">Nombre<br>del Pagador</div></th>
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
           datapro.eibs.beans.ECL022001Message msgPart = (datapro.eibs.beans.ECL022001Message) appList.getRecord();
     	%>               
        <TR>
			<TD NOWRAP width="2%">
				<input type="radio" name="ROW" value="<%= appList.getCurrentRow()%>" <%=chk%> onClick="document.forms[0].CURRENTROW.value = this.value; document.forms[0].SEL.value = <%= msgPart.getE01CLIIND()%>">
			</TD>
			<TD NOWRAP ALIGN="CENTER">
				<a href="javascript:getDetail('<%= appList.getCurrentRow() %>')"><%=Util.formatCell(msgPart.getE01CLIIND())%></a>
			</TD>
			<TD NOWRAP ALIGN="CENTER">
				<a href="javascript:getDetail('<%= appList.getCurrentRow() %>')"><%=Util.formatCell(msgPart.getE01CLIRIF())%></a>
			</TD>
			<TD NOWRAP ALIGN="CENTER">
				<a href="javascript:getDetail('<%= appList.getCurrentRow() %>')"><%=Util.formatCell(msgPart.getE01CLIRIN())%></a>
			</TD>
			<TD NOWRAP ALIGN="CENTER">
				<a href="javascript:getDetail('<%= appList.getCurrentRow() %>')"><%=Util.formatCell(msgPart.getE01CLICON())%></a>
			</TD>
			<TD NOWRAP ALIGN="CENTER">
				<a href="javascript:getDetail('<%= appList.getCurrentRow() %>')"><%=Util.formatCell(msgPart.getE01CLINOM())%></a>
			</TD>
		</TR>    		
    	<%}%>    
        </table>
    </table>

<TABLE class="tbenter" WIDTH="98%" ALIGN=CENTER>
  <TR>
  <TD WIDTH="50%" ALIGN=LEFT>
<%
        if ( appList.getShowPrev() ) {
      			int pos = appList.getFirstRec() - 50 - 1;
      			out.println("<A HREF=\""+request.getContextPath()+"/servlet/datapro.eibs.misc.JSECL0220?SCREEN=1&Pos=" + pos + "\"><IMG border=\"0\" src=\""+request.getContextPath()+"/images/s/previous_records.gif\" ></A>");
        }
  %>  
  </TD>
  <TD WIDTH="50%" ALIGN=RIGHT>     
 <%      
        if ( appList.getShowNext() ) {
      			int pos = appList.getLastRec();
      			out.println("<A HREF=\""+request.getContextPath()+"/servlet/datapro.eibs.misc.JSECL0220?SCREEN=1&Pos=" + pos + "\"><IMG border=\"0\" src=\""+request.getContextPath()+"/images/s/next_records.gif\" ></A>");
        }
   %> 
   </TD>
 	</TR>
</TABLE>

  <%}%>

<SCRIPT type="text/javascript">  
  showChecked("ROW");  
</SCRIPT>
</form>

</body>
</html>
