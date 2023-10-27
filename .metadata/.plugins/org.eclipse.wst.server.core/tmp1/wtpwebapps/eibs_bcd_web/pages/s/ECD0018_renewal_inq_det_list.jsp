<html> 
<head>
<title>Consulta de Renovación</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<%@ page import = "datapro.eibs.master.Util" %>

<jsp:useBean id= "detList" class= "datapro.eibs.beans.JBObjList"  scope="session" />
<jsp:useBean id= "msgCD" class= "datapro.eibs.beans.ECD0018DSMessage"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>

<script type="text/javascript">

function PrintPreview() {

	var pg = "<%=request.getContextPath()%>/pages/s/ECD0018_renewal_inq_det_print.jsp";
	CenterWindow(pg,720,500,2);

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
<BODY>
<h3 align="center">Consulta de Renovación<BR>Detalle
<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="renewal_inq_det_list.jsp , ECD0018">
</h3>
<hr size="4">
<FORM name="form1" METHOD="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSECD0018" >
  <input type=HIDDEN name="SCREEN" value="3">
  <input type=HIDDEN name="opt" value="1">
  <input type=HIDDEN name="totalRow" value="0">
  <input type=HIDDEN name="CURRENTROW" value="">
  
  <%
	if ( detList.getNoResult() ) {
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
  
  <TABLE  id=cfTable class="tableinfo">
 <TR > 
    <TD NOWRAP valign="top" width="100%">
        <table id="headTable" width="100%">
          <tr id="trdark"> 
            <th align=CENTER nowrap width="10%">Año/Mes</th>
            <th align=CENTER nowrap width="10%">Agencia</th>
            <th align=CENTER nowrap width="20%">Tipo de Plástico</th>
            <th align=CENTER nowrap width="20%">Tarjeta</th>
            <th align=CENTER nowrap width="40%">Cliente</th>
          </tr>
     	<%
        detList.initRow(); 
        while (detList.getNextRow()) {
           datapro.eibs.beans.ECD0018DSMessage msgPart = (datapro.eibs.beans.ECD0018DSMessage) detList.getRecord();
     	%>               
        <TR>
			<TD NOWRAP ALIGN="CENTER">
				<%=Util.formatCell(msgPart.getE01CDPYYD())%>/<%=Util.formatCell(msgPart.getE01CDPMMD())%>
			</TD>
			<TD NOWRAP ALIGN="CENTER">
				<%=Util.formatCell(msgPart.getE01CDPSUR())%>
			</TD>
			<TD NOWRAP ALIGN="CENTER">
				<%=Util.formatCell(msgPart.getE01CDPTPL())%>
			</TD>
			<TD NOWRAP ALIGN="CENTER">
				<%=Util.formatCell(msgPart.getE01CDPNUM())%>
			</TD>
			<TD NOWRAP ALIGN="CENTER">
				<%=Util.formatCell(msgPart.getE01CDPNAM())%>
			</TD>

		</TR>    		
    	<%}%>    
        </table>
    </table>
    
<TABLE class="tbenter" WIDTH="98%" ALIGN=CENTER>
  <TR>
  <TD WIDTH="50%" ALIGN=LEFT>
<%
        if ( detList.getShowPrev() ) {
      			int pos = detList.getFirstRec() - 50 - 1;
      			out.println("<A HREF=\""+request.getContextPath()+"/servlet/datapro.eibs.products.JSECD0018?SCREEN=102&Pos=" + pos + "\"><IMG border=\"0\" src=\""+request.getContextPath()+"/images/s/previous_records.gif\" ></A>");
        }
  %>  
  </TD>
  <TD WIDTH="50%" ALIGN=RIGHT>     
 <%      
        if ( detList.getShowNext() ) {
      			int pos = detList.getLastRec();
      			out.println("<A HREF=\""+request.getContextPath()+"/servlet/datapro.eibs.products.JSECD0018?SCREEN=102&Pos=" + pos + "\"><IMG border=\"0\" src=\""+request.getContextPath()+"/images/s/next_records.gif\" ></A>");
        }
   %> 
   </TD>
 	</TR>
</TABLE>

  <p align="center"> 
      <input id="EIBSBTN" type=button name="Print" OnClick="PrintPreview()" value="Imprimir">
    
  </p>
     
  <%}%>

</form>

</body>
</html>
