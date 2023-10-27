<html> 
<head>
<title>Control de Parámetros de Caja</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<%@ page import = "datapro.eibs.master.Util" %>

<jsp:useBean id= "appList" class= "datapro.eibs.beans.JBObjList"  scope="session" />
<jsp:useBean id= "msgCD" class= "datapro.eibs.beans.ETLR20001Message"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>

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
<h3 align="center">Control de Parámetros de Caja<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="teller_params_list.jsp, ETLR200"> </h3>
<hr size="4">
<FORM name="form1" METHOD="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.params.JSETLR200" >
  <input type=HIDDEN name="SCREEN" value="2">
  <input type=HIDDEN name="opt" value="1">
  <input type=HIDDEN name="totalRow" value="0">
  <input type=HIDDEN name="CURRENTROW" value="">
  
  <%
	if ( appList.getNoResult() ) {
 %>
  <p>&nbsp;</p><TABLE class="tbenter" width="100%" >
    <TR>
      <TD > 
        <div align="center"> 
          <p><b>No hay resultados para su b&uacute;squeda</b></p>
          <table class="tbenter" width=100% align=center>
           <tr>
            <td class=TDBKG>
 				<div align="center"><a href="javascript:goAction(1)"><b>Crear</b></a></div>
              </td>
              <td class=TDBKG>
                <div align="center"><a href="<%=request.getContextPath()%>/pages/background.jsp"><b>Salir</b></a></div>
              </td>
           </tr>
         </table>
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
 		<div align="center"><a href="javascript:goAction(1)"><b>Crear</b></a></div>
      </td>
      <td class=TDBKG> 
        <div align="center"><a href="javascript:goAction(2)"><b>Modificar</b></a></div>
      </td>
      <td class=TDBKG> 
        <div align="center"><a href="javascript:goAction(4)"><b>Eliminar</b></a></div>
      </td>
      <td class=TDBKG> 
        <div align="center"><a href="<%=request.getContextPath()%>/pages/background.jsp"><b>Salir</b></a></div>
      </td>
    </tr>
  </table>
   
  <br>
  
 <table  id=cfTable class="tableinfo" height="55%">
    <tr  height="5%"> 
      <td NOWRAP valign="top" width="100%"> 
		<table id="headTable" width="100%">
			<tr id="trdark">
            <th align=CENTER nowrap width="5%" rowspan="2">&nbsp;</th>
            <th align=CENTER nowrap width="10%" rowspan="2">Banco</th>
            <th align=CENTER nowrap width="10%" rowspan="2">Moneda</th>
            <th align=CENTER nowrap width="15%" colspan="2">Depósitos en Efectivo</th>
            <th align=CENTER nowrap width="15%" colspan="2">Retiros en Efectivo</th>
          </tr>
          <tr id="trdark"> 
            <th align=CENTER nowrap width="15%">Límite Diario</th>
            <th align=CENTER nowrap width="15%">Límite por Trs.</th>
            <th align=CENTER nowrap width="15%">Límite Diario</th>
            <th align=CENTER nowrap width="15%">Límite por Trs.</th>
			</tr>
        </table>
      </td>
    </tr>    
		  <tr  height="95%">    
		    <td nowrap="nowrap">      
		       <div id="dataDiv1" style="height:400px; overflow:auto;"> 
		       <table id="dataTable" cellspacing="0" cellpadding="1" border="0" width="100%">         
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
           datapro.eibs.beans.ETLR20001Message msgPart = (datapro.eibs.beans.ETLR20001Message) appList.getRecord();
     	%>               
		<tr id="dataTable<%= appList.getCurrentRow() %>">
			<td nowrap width="5%" align="center" ><input type="radio" id="ROW" name="ROW" value="<%=appList.getCurrentRow()%>" <%=chk%> class="highlight" onClick="highlightRow('dataTable', <%= appList.getCurrentRow() %>)" onClick="document.forms[0].CURRENTROW.value = this.value;"/></td>
			<TD NOWRAP width="10%" ALIGN="center"><%=Util.formatCell(msgPart.getE01TLRBNK())%></TD>
			<TD NOWRAP width="10%" ALIGN="center"><%=Util.formatCell(msgPart.getE01TLRCCY())%></TD>
			<TD NOWRAP width="15%" ALIGN="right"><%=Util.formatCell(msgPart.getE01TLRLDDE())%></TD>
			<TD NOWRAP width="15%" ALIGN="right"><%=Util.formatCell(msgPart.getE01TLRLTDE())%></TD>
			<TD NOWRAP width="15%" ALIGN="right"><%=Util.formatCell(msgPart.getE01TLRLDWE())%></TD>
			<TD NOWRAP width="15%" ALIGN="right"><%=Util.formatCell(msgPart.getE01TLRLTWE())%></TD>
		</TR>    		
    	<%}%>    
             </table>
             </div>
             </td>
             </tr>
</table>	  
     
  <%}%>

<SCRIPT type="text/javascript">  
  showChecked("ROW");  
</SCRIPT>
</form>

</body>
</html>
