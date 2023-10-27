<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
 <%@ page import = "datapro.eibs.master.Util" %>
 <%@ page import = "datapro.eibs.beans.*" %>

<HTML>
<HEAD>
<TITLE>Desembolsos Relacionados con Proyectos de Construcci�n</TITLE>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "extList" class= "datapro.eibs.beans.JBObjList"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>

<script type="text/javascript">

function goAction(op) {
 var delok= false;
 var page="";
 if (op == 1) {
     page = '${pageContext.request.contextPath}/pages/s/EPC0065_pc_new_sch.jsp';
 } else if (op == 2) {
     page = '${pageContext.request.contextPath}/pages/s/EPC0065_pc_maint_sch.jsp?ROW=' + document.forms[0].ROW.value;
 } else if (op == 4) {     
     page = '${pageContext.request.contextPath}/pages/s/EPC0065_pc_program_sch.jsp?ROW=' + document.forms[0].ROW.value; 
 } else if (op == 5) {     
     page = '${pageContext.request.contextPath}/pages/s/EPC0065_pc_sale_sch.jsp?ROW=' + document.forms[0].ROW.value; 
 }
   CenterWindow(page,800,800,2);
 }      

function goExit(){
  window.location.href="<%=request.getContextPath()%>/pages/background.jsp";

}

function showInfo(idxRow,d1,d2,d3){
   for ( var i=0; i<dataTable.rows.length; i++ ) {
       dataTable.rows[i].className="trnormal";
    }
   dataTable.rows[idxRow].className="trhighlight";
   document.forms[0].ROW.value = "" + idxRow;
  } 

</script>
</HEAD>

<BODY>
<% 
 if ( !error.getERRNUM().equals("0")  ) {
     error.setERRNUM("0");
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
 }
%>
<FORM Method="post" Action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEPC0065">
<INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="2">
<INPUT TYPE=HIDDEN NAME="OPT" VALUE="3">
<INPUT TYPE=HIDDEN NAME="ROW" VALUE="0">

<h3 align="center">Desembolsos Relacionados con Proyectos de Construcci�n<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="pc_list_sch.jsp,EPC0065"> 
</h3>
<hr size="4">
  
  
<TABLE class="tbenter">
  <TR> 
 <%
	if ( !(extList.getNoResult() )) {
 %>
    <TD ALIGN=CENTER CLASS=tdbkg width="33.3%"><a href="javascript:goAction('2')">Anticipo</a></TD>
    <TD ALIGN=CENTER CLASS=tdbkg width="33.3%"><a href="javascript:goAction('4')">Ampliaci�n</a></TD>    
 <% } %>
    <TD ALIGN=CENTER CLASS=tdbkg width="33.3%"><a href="javascript:goExit()">Salir</a></TD>
  </TR>
</TABLE>


<%
	if ( extList.getNoResult() ) {
 %>
   	<TABLE class="tbenter" width=100% height=40%>
   	 <TR valign="middle">
      <TD> 
        <div align="center">       		
          <p><b>No hay resultados que correspondan a su criterio de b�squeda. 
            </b></p>
          </div>
      </TD>
     </TR>
   	</TABLE>
<%   		
	}
	else {
%>  
 <INPUT TYPE=HIDDEN NAME="E01DLLSD1" VALUE="">
 <INPUT TYPE=HIDDEN NAME="E01DLLSD2" VALUE="">
 <INPUT TYPE=HIDDEN NAME="E01DLLSD3" VALUE="">
 
  <TABLE  id="mainTable" class="tableinfo">
    <tr  height="5%"> 
      <td NOWRAP valign="top" width="100%"> 
		<table id="headTable" width="98%">
			<tr id="trdark">
		      <TH ALIGN="center" nowrap width="5%">&nbsp;</TH>
		      <TH ALIGN="center" nowrap width="15%">N�mero</TH>
		      <TH ALIGN="center" nowrap width="35%">Direccion Principal</TH>
		      <TH ALIGN="center" nowrap width="10%">Ciudad</TH>
		      <TH ALIGN="center" nowrap width="10%">Pais</TH>      
		      <TH ALIGN="center" nowrap width="10%">Valor Solicitado</TH>
		      <TH ALIGN="center" nowrap width="10%">Estado</TH>            
			</tr>
        </table>
      </td>
    </tr>    
		  <tr  height="95%">    
		    <td nowrap="nowrap">      
		       <div id="dataDiv1" style="height:350px; overflow:auto;"> 
		       <table id="dataTable" cellspacing="0" cellpadding="1" border="0" width="95">         
    <%
         int row;
		 try{row = Integer.parseInt(request.getParameter("ROW"));}catch(Exception e){row = 0;}
         extList.initRow();        
         while (extList.getNextRow()) {
            EPC006501Message msgPC = (EPC006501Message) extList.getRecord();
     %> 
            <TR> 
              <TD ALIGN=CENTER NOWRAP width="5%"> 
                <INPUT TYPE="radio" NAME="EXTCHG" VALUE="<%= extList.getCurrentRow() %>" <% if (extList.getCurrentRow() == row) out.print("checked"); %> onClick="showInfo(<%= extList.getCurrentRow() %>,'<%=msgPC.getE01PCMACC()%>')">
              </TD>
              <TD ALIGN=CENTER NOWRAP width="15%"><%= Util.formatCell(msgPC.getE01PCMACC()) %></TD>
              <TD ALIGN=LEFT NOWRAP width="35%"><%= Util.formatCell(msgPC.getE01PCMAD1()) %></TD>
              <TD ALIGN=LEFT NOWRAP width="10%"><%= Util.formatCell(msgPC.getE01PCMCTY()) %></TD>
              <TD ALIGN=LEFT NOWRAP width="10%"><%= Util.formatCell(msgPC.getE01PCMCTR()) %></TD>
              <TD ALIGN=RIGHT NOWRAP width="10%"><%= Util.formatCell(msgPC.getE01PCMVSL()) %></TD>              
              <TD ALIGN=CENTER NOWRAP width="10%"><%= Util.formatCell(msgPC.getE01PCMRMK()) %></TD>
             </TR>
      <%              
         }        
    %>
             </table>
             </div>
             </td>
             </tr>
</table>
 
  <SCRIPT type="text/javascript">  	
  	function resizeDoc() {
            	adjustEquTables(getElement('headTable'),getElement('dataTable'), getElement('dataDiv1'),1,false);
    }
    showChecked("EXTCHG");
    resizeDoc();
    window.onresize=resizeDoc;     
  </SCRIPT>
  <%
  }
 %>
 


</FORM>

</BODY>
</HTML>
