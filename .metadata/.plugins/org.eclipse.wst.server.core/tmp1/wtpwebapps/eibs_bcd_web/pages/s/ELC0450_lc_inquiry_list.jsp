<html> 
<head>
<title>Consulta de Cartas de Crédito</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<%@ page import = "datapro.eibs.master.Util" %>

<jsp:useBean id= "jbList" class= "datapro.eibs.beans.JBObjList"  scope="session" />
<jsp:useBean id= "msg044001" class= "datapro.eibs.beans.ELC044001Message"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos"  scope="session" />
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>

<script type="text/javascript">

function getDetail(num)
{
	page = "<%=request.getContextPath()%>/servlet/datapro.eibs.trade.JSELC0450?SCREEN=200&E01LCMACC=" + num;
	CenterWindow(page,800,600,2);
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
<h3 align="center">Consulta de Cartas de Crédito
<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="lc_inquiry_list.jsp, ELC0450"></h3>
<hr size="4">
<FORM name="form1" METHOD="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.trade.JSELC0450" >
  <input type=HIDDEN name="SCREEN" value="200">
  <input type=HIDDEN name="opt" value="">
  <input type=HIDDEN name="totalRow" value="0">
  <input type=HIDDEN name="CURRENTROW" value="">
  
  <%
	if ( jbList.getNoResult() ) {
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
  <p> 

  <TABLE id=cfTable class="tableinfo">
  <TR> 
    <TD NOWRAP valign="top" width="100%">
        <table id="headTable" width="100%">
          <tr id="trdark"> 
            <th align=CENTER nowrap width="17%"><div align="center">Nro. Carta de Crédito</div></th>
            <th align=CENTER nowrap width="17%"><div align="center">Nombre del Cliente</div></th>
            <th align=CENTER nowrap width="15%"><div align="center">Moneda</div></th>
            <th align=CENTER nowrap width="17%"><div align="center">Monto Original</div></th>
            <th align=CENTER nowrap width="17%"><div align="center">Saldo</div></th>
            <th align=CENTER nowrap width="17%"><div align="center">Estado</div></th>
          </tr>
     	<%
        jbList.initRow(); 
		boolean firstTime = true;
		String chk = "";
        while (jbList.getNextRow()) {
			if (firstTime) {
				firstTime = false;
				chk = "checked";
			} else {
				chk = "";
			}
           datapro.eibs.beans.ELC044001Message msgPart = (datapro.eibs.beans.ELC044001Message) jbList.getRecord();
     	%>               
        <TR>
			<TD NOWRAP ALIGN="CENTER"><a href="javascript:getDetail('<%= msgPart.getE01LCMACC() %>')"><%=Util.formatCell(msgPart.getE01LCMACC())%></a></TD>
			<TD NOWRAP ALIGN="CENTER"><a href="javascript:getDetail('<%= msgPart.getE01LCMACC() %>')"><%=Util.formatCell(msgPart.getE01CUSNME())%></a></TD>
            <TD NOWRAP ALIGN="CENTER"><a href="javascript:getDetail('<%= msgPart.getE01LCMACC() %>')"><%=Util.formatCell(msgPart.getE01LCMCCY())%></a></TD>
			<TD NOWRAP ALIGN="CENTER"><a href="javascript:getDetail('<%= msgPart.getE01LCMACC() %>')"><%=Util.formatCell(msgPart.getE01LCMOAM())%></a></TD>
			<TD NOWRAP ALIGN="CENTER"><a href="javascript:getDetail('<%= msgPart.getE01LCMACC() %>')"><%=Util.formatCell(msgPart.getE01LCMMEB())%></a></TD>
			<TD NOWRAP ALIGN="CENTER"><a href="javascript:getDetail('<%= msgPart.getE01LCMACC() %>')"><%=Util.formatCell(msgPart.getE01LCRSTS())%></a></TD>
		</TR>    		
    	<%}%>    
        </table>
    </table>

  <%}%>

</form>

</body>
</html>
