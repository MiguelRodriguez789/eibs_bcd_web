<html> 
<head>
<title>Entrega de Documentos Emitidos</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<%@ page import = "datapro.eibs.master.Util" %>

<jsp:useBean id= "jbList" class= "datapro.eibs.beans.JBObjList"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>

<script language="JavaScript">

function getDetail(acd,num)
{
		document.forms[0].SCREEN.value = "2000";
		document.forms[0].E01IMPACC.value = num;
		document.forms[0].E01IMPACD.value = acd;
		document.forms[0].submit();
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
<h3 align="center">Entrega de Documentos Emitidos
<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="vl_delivery_list.jsp, EVL0120"></h3>
<hr size="4">
<FORM name="form1" METHOD="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.valuepaper.JSEVL0120" >
  <input type=HIDDEN name="SCREEN" value="2000">
  <input type=HIDDEN name="E01IMPACC" value="">
  <input type=HIDDEN name="E01IMPACD" value="">
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
	int count = 0;
	java.math.BigDecimal originalAmountTotal = new java.math.BigDecimal("0"), amountTotal = new java.math.BigDecimal("0");
%> 
  <p> </p>

  <TABLE id=cfTable class="tableinfo">
  <TR> 
    <TD NOWRAP valign="top" width="100%">
        <table id="headTable" width="100%">
          <tr id="trdark"> 
            <th align=CENTER nowrap width="8%"><div align="center">Oficina<br>Emisión</div></th>
            <th align=CENTER nowrap width="8%"><div align="center">Oficina<br>Impresión</div></th>            
            <th align=CENTER nowrap width="10%"><div align="center">RUT<br>Cliente</div></th>
            <th align=CENTER nowrap width="8%"><div align="center">Tipo<br>Docto.</div></th>
            <th align=CENTER nowrap width="10%"><div align="center">Folio<br>Interno</div></th>
            <th align=CENTER nowrap width="10%"><div align="center">Folio<br>P.Valor</div></th>
            <th align=CENTER nowrap width="8%"><div align="center">Fecha<br>Emisión</div></th>
            <th align=CENTER nowrap width="8%"><div align="center">Hora</div></th>
            <th align=CENTER nowrap width="10%"><div align="center">Usuario<br>Impresión</div></th>
            <th align=CENTER nowrap width="8%"><div align="center">Fecha<br>Impresión</div></th>
            <th align=CENTER nowrap width="8%"><div align="center">Hora</div></th>
            <th align=CENTER nowrap width="16%"><div align="center">Nombre <br>quien retira</div></th>
            <th align=CENTER nowrap width="10%"><div align="center">RUT<br>retiro</div></th>
            <th align=CENTER nowrap width="8%"><div align="center">Fecha<br>Entrega</div></th>
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
           datapro.eibs.beans.EVL012001Message msgPart = (datapro.eibs.beans.EVL012001Message) jbList.getRecord();
        
        	count++;
        	
        	java.math.BigDecimal oam = new java.math.BigDecimal("0");
        	try {
        		oam = new java.math.BigDecimal(msgPart.getE01IMPAMT().trim().replaceAll(",",""));
        	} catch(Exception e){
        	}
        	
        	originalAmountTotal = originalAmountTotal.add(oam);
        	
     	%>               
        <TR>
			<TD NOWRAP ALIGN="CENTER"><a href="javascript:getDetail('<%= msgPart.getE01IMPACD() %>', '<%= msgPart.getE01IMPACC() %>')"><%=Util.formatCell(msgPart.getE01IMPBRN())%></a></TD>        
			<TD NOWRAP ALIGN="CENTER"><a href="javascript:getDetail('<%= msgPart.getE01IMPACD() %>', '<%= msgPart.getE01IMPACC() %>')"><%=Util.formatCell(msgPart.getE01IMPBR1())%></a></TD>
			<TD NOWRAP ALIGN="CENTER"><a href="javascript:getDetail('<%= msgPart.getE01IMPACD() %>', '<%= msgPart.getE01IMPACC() %>')"><%=Util.formatCell(msgPart.getE01IMPIDN())%></a></TD>
			<TD NOWRAP ALIGN="CENTER"><a href="javascript:getDetail('<%= msgPart.getE01IMPACD() %>', '<%= msgPart.getE01IMPACC() %>')"><%=Util.formatCell(msgPart.getE01IMPACD())%></a></TD>
			<TD NOWRAP ALIGN="CENTER"><a href="javascript:getDetail('<%= msgPart.getE01IMPACD() %>', '<%= msgPart.getE01IMPACC() %>')"><%=Util.formatCell(msgPart.getE01IMPACC())%></a></TD> 
			<TD NOWRAP ALIGN="CENTER"><a href="javascript:getDetail('<%= msgPart.getE01IMPACD() %>', '<%= msgPart.getE01IMPACC() %>')"><%=Util.formatCell(msgPart.getE01IMPSER())%></a></TD>
			<TD NOWRAP ALIGN="CENTER"><a href="javascript:getDetail('<%= msgPart.getE01IMPACD() %>', '<%= msgPart.getE01IMPACC() %>')"><%=Util.formatDate(msgPart.getE01IMPOSD(),msgPart.getE01IMPOSM(),msgPart.getE01IMPOSY())%></a></TD>
			<TD NOWRAP ALIGN="CENTER"><a href="javascript:getDetail('<%= msgPart.getE01IMPACD() %>', '<%= msgPart.getE01IMPACC() %>')"><%=Util.getTimeFromTimestamp(msgPart.getE01IMPOST())%></a></TD>
			<TD NOWRAP ALIGN="CENTER"><a href="javascript:getDetail('<%= msgPart.getE01IMPACD() %>', '<%= msgPart.getE01IMPACC() %>')"><%=Util.formatCell(msgPart.getE01IMPUSR())%></a></TD>
			<TD NOWRAP ALIGN="CENTER"><a href="javascript:getDetail('<%= msgPart.getE01IMPACD() %>', '<%= msgPart.getE01IMPACC() %>')"><%=Util.formatDate(msgPart.getE01IMPUS2(),msgPart.getE01IMPUS1(),msgPart.getE01IMPUS3())%></a></TD>
			<TD NOWRAP ALIGN="CENTER"><a href="javascript:getDetail('<%= msgPart.getE01IMPACD() %>', '<%= msgPart.getE01IMPACC() %>')"><%=Util.getTimeFromTimestamp(msgPart.getE01IMPUST())%></a></TD>
			<TD NOWRAP ALIGN="CENTER"><a href="javascript:getDetail('<%= msgPart.getE01IMPACD() %>', '<%= msgPart.getE01IMPACC() %>')"><%=Util.formatCell(msgPart.getE01IMPNRE())%></a></TD>
			<TD NOWRAP ALIGN="CENTER"><a href="javascript:getDetail('<%= msgPart.getE01IMPACD() %>', '<%= msgPart.getE01IMPACC() %>')"><%=Util.formatCell(msgPart.getE01IMPRRE())%></a></TD>
			<TD NOWRAP ALIGN="CENTER"><a href="javascript:getDetail('<%= msgPart.getE01IMPACD() %>', '<%= msgPart.getE01IMPACC() %>')"><%=Util.formatDate(msgPart.getE01IMPUE2(),msgPart.getE01IMPUE1(),msgPart.getE01IMPUE3())%></a></TD>
		</TR>    		
    	<%}%>    
        </table>
    </table>
<br>
<%--
  <TABLE id=cfTable class="tableinfo">
  <TR> 
    <TD NOWRAP valign="top" width="100%">
        <table id="headTable" width="100%">
	<tr id="trdark">
		<th>Total Documentos :
		</th>
		<td>
		<input readonly type="text" value="<%=count %>">
		</td>
		<th>
		Total Monto :
		</th>
		<td>
		<input readonly type="text" value="<%=Util.formatCCY(originalAmountTotal.toString()) %>">
		</td>
</tr></table></TD></TR></TABLE>
--%>
  <%}%>

</form>

</body>
</html>
