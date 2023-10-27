<html> 
<head>
<title>Transacciones de Cuentas Conformadas</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<%@ page import = "datapro.eibs.master.Util" %>

<jsp:useBean id= "chkList" class= "datapro.eibs.beans.JBObjList"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>

</head>

 <% 
 if ( !error.getERRNUM().equals("0")  ) {
 	 error.setERRNUM("0");
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
 }
%>
<BODY >
<h3 align="center">Transacciones de Cuentas Conformadas
<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="rt_check_holding_inq_list.jsp, ECL0110">
</h3>
<hr size="4">
<FORM name="form1" METHOD="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.misc.JSECL0110" >
  <input type=HIDDEN name="SCREEN" value="3">
  <input type=HIDDEN name="opt" value="1">
  <input type=HIDDEN name="totalRow" value="0">
  <input type=HIDDEN name="CURRENTROW" value="">
  
  <%
	if ( chkList.getNoResult() ) {
 %>
  <p>&nbsp;</p><TABLE class="tbenter" width="100%" >
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
  <br>
  
  <TABLE id=cfTable class="tableinfo">
 <TR > 
    <TD NOWRAP valign="top" width="100%">
        <table id="headTable" width="100%">
          <tr id="trdark"> 
            <th align=CENTER nowrap width="10%"><div align="center">Número<br>Cuenta</div></th>
            <th align=CENTER nowrap width="10%"><div align="center">Número<br>Cheque</div></th>
            <th align=CENTER nowrap width="10%"><div align="center">Monto</div></th>
            <th align=CENTER nowrap width="10%"><div align="center">Fecha<br>Creación</div></th>
            <th align=CENTER nowrap width="10%"><div align="center">Fecha<br>Expiración</div></th>
            <th align=CENTER nowrap width="10%"><div align="center">Reversado</div></th>
            <th align=CENTER nowrap width="30%"><div align="center">Beneficiario</div></th>
            <th align=CENTER nowrap width="10%"><div align="center">Código<br>Autorización</div></th>
          </tr>
     	<%
        chkList.initRow(); 
        while (chkList.getNextRow()) {
           datapro.eibs.beans.ECL0110DSMessage msgPart = (datapro.eibs.beans.ECL0110DSMessage) chkList.getRecord();
     	%>               
        <TR>
			<TD NOWRAP ALIGN="CENTER">
				<%=Util.formatCell(msgPart.getE01CTARPT())%>
			</TD>
			<TD NOWRAP ALIGN="CENTER">
				<%=Util.formatCell(msgPart.getE01NROCHE())%>
			</TD>
			<TD NOWRAP ALIGN="CENTER">
				<%=Util.formatCCY(msgPart.getE01MONCHE())%>
			</TD>
			<TD NOWRAP ALIGN="CENTER">
				<%=msgPart.getE01FECCRE().substring(6,8)%>/<%=msgPart.getE01FECCRE().substring(4,6)%>/<%=msgPart.getE01FECCRE().substring(0,4)%>
			</TD>
			<TD NOWRAP ALIGN="CENTER">
				<%=msgPart.getE01FECEXP().substring(6,8)%>/<%=msgPart.getE01FECEXP().substring(4,6)%>/<%=msgPart.getE01FECEXP().substring(0,4)%>
			</TD>
			<TD NOWRAP ALIGN="CENTER">
				<%=Util.formatCell(msgPart.getE01FLGREV())%>
			</TD>
			<TD NOWRAP ALIGN="CENTER">
				<%=Util.formatCell(msgPart.getE01BENEFI())%>
			</TD>
			<TD NOWRAP ALIGN="CENTER">
				<%=Util.formatCell(msgPart.getE01CODAUT())%>
			</TD>
		</TR>    		
    	<%}%>    
        </table>
    </table>
     
<TABLE class="tbenter" WIDTH="98%" ALIGN=CENTER>
  <TR>
  <TD WIDTH="50%" ALIGN=LEFT>
<%
        if ( chkList.getShowPrev() ) {
      			int pos = chkList.getFirstRec() - 50 - 1;
      			out.println("<A HREF=\""+request.getContextPath()+"/servlet/datapro.eibs.misc.JSECL0110?SCREEN=101&Pos=" + pos + "\"><IMG border=\"0\" src=\""+request.getContextPath()+"/images/s/previous_records.gif\" ></A>");
        }
  %>  
  </TD>
  <TD WIDTH="50%" ALIGN=RIGHT>     
 <%      
        if ( chkList.getShowNext() ) {
      			int pos = chkList.getLastRec();
      			out.println("<A HREF=\""+request.getContextPath()+"/servlet/datapro.eibs.misc.JSECL0110?SCREEN=101&Pos=" + pos + "\"><IMG border=\"0\" src=\""+request.getContextPath()+"/images/s/next_records.gif\" ></A>");
        }
   %> 
   </TD>
 	</TR>
</TABLE>

  <%}%>
  

</form>

</body>
</html>
