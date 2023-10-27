 <%@ page import = "datapro.eibs.master.Util" %>
 <%@ page import = "datapro.eibs.beans.*" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
<HEAD>
<TITLE>Unidades de Vivienda Asociadas a Proyecto</TITLE>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">

<jsp:useBean id= "extList" class= "datapro.eibs.beans.JBObjList"  scope="session" />

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />

<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>


<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>

<script type="text/javascript">

   builtNewMenu(pc_i_opt);

function goAction(op) {
 var delok= false;
 var page="";
 if (op == 1) {
     page = '${pageContext.request.contextPath}/pages/s/EPC0005_pc_new_sch.jsp?LASTROW=' + document.forms[0].LASTROW.value;
 } else if (op == 2) {
     page = '${pageContext.request.contextPath}/pages/s/EPC0005_pc_maint_sch_inq.jsp?ROW=' + document.forms[0].ROW.value;
 } else if (op == 4) {     
     page = '${pageContext.request.contextPath}/pages/s/EPC0005_pc_delete_sch.jsp?ROW=' + document.forms[0].ROW.value; 
 } else if (op == 5) {     
     page = '${pageContext.request.contextPath}/pages/s/EPC0005_pc_sale_sch.jsp?ROW=' + document.forms[0].ROW.value; 
 }
   CenterWindow(page,600,470,2);
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

<% 
 if ( !error.getERRNUM().equals("0")  ) {
     error.setERRNUM("0");
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
 }
  out.println("<SCRIPT> initMenu(); </SCRIPT>"); 
%>

<BODY>


<FORM Method="post" Action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEPC0005">
<INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="201">
<INPUT TYPE=HIDDEN NAME="OPT" VALUE="3">
<INPUT TYPE=HIDDEN NAME="ROW" VALUE="0">
<INPUT TYPE=HIDDEN NAME="LASTROW" VALUE="1">

<h3 align="center">Unidades de Vivienda Asociadas a Proyecto<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="pc_list_sch_inq.jsp,EPC0005"> 
</h3>
<hr size="4">
  
  
<TABLE class="tbenter">
  <TR> 

 <%
	if ( !(extList.getNoResult() )) {
 %>
    <TD ALIGN=CENTER CLASS=tdbkg><a href="javascript:goAction('2')">Consultar</a></TD>
 <% } %>
    <TD ALIGN=CENTER CLASS=tdbkg><a href="javascript:goExit()">Salir</a></TD>
  </TR>
</TABLE>

  <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
          <tr id="trdark"> 
            <td nowrap width="20%" > 
              <div align="right"><b>Número de Proyecto : </b></div>
            </td>
            <td nowrap width="30%" > 
              <div align="left"> 
                <input type="text" name="E01ACCNUM" size="12" maxlength="12" value="<%= userPO.getIdentifier().trim()%>" readonly>
              </div>
            </td>
            <td nowrap width="20%" > 
              <div align="right"><b>Cliente : </b></div>
            </td>
            <td nowrap width="5%" > 
              <div align="left"> 
                <input type="text" name="E01DLLCUN" size="11" maxlength="9" value="<%= userPO.getCusNum().trim()%>" readonly>
              </div>
            </td>
            <td nowrap width="25%" > 
              <div align="left"> 
                <input type="text" name="D01PCDCUN" size="48" maxlength="45" value="<%= userPO.getCusName().trim()%>" readonly>
              </div>
            </td>

          </tr>
        </table>
      </td>
    </tr>
  </table>
<br>
<%
	if ( extList.getNoResult() ) {
 %>

<%  
	int LastRow=1;
    int k=1;
%>
   	<TABLE class="tbenter" width=100% height=40%>
   	 <TR valign="middle">
      <TD> 
        <div align="center">       		
          <p><b>No hay resultados que correspondan a su criterio de búsqueda.</b></p>
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
 
 <TABLE  id="mainTable" class="tableinfo" >
 <TR> 
   <TD NOWRAP valign="top" width="100%">
    <table id="headTable" style="width: 100%">
    <TR id="trdark"> 
      <TH ALIGN=CENTER nowrap>&nbsp;</TH>
      <TH ALIGN=CENTER nowrap>Número</TH>
      <TH ALIGN=CENTER nowrap>Direccion Principal</TH>
      <TH ALIGN=CENTER nowrap>Ciudad</TH>
      <TH ALIGN=CENTER nowrap>Pais</TH>      
      <TH ALIGN=CENTER nowrap>Precio de Unidad</TH>
      <TH ALIGN=CENTER nowrap>Estado</TH>            
    </TR>
    </TABLE>
  
    <div id="dataDiv1" class="scbarcolor" style="padding:0">
    <table id="dataTable"  >
    <%
         int row;
		 try{row = Integer.parseInt(request.getParameter("ROW"));}catch(Exception e){row = 0;}
         extList.initRow();  
         int k=1;               
         while (extList.getNextRow()) {
            EPC000501Message msgPC = (EPC000501Message) extList.getRecord();
            k++;            
     %> 
            <TR> 
              <TD ALIGN=CENTER NOWRAP> 
<%--                <INPUT TYPE="radio" NAME="EXTCHG" VALUE="<%= extList.getCurrentRow() %>" <% if (extList.getCurrentRow() == row) out.print("checked"); %> onClick="showInfo(<%= extList.getCurrentRow() %>,'<%=msgPC.getE01PCDNUM()%>')">--%>
            <% if (!msgPC.getE01PCDSTS().equals("D")) { %>
                <INPUT TYPE="radio" NAME="EXTCHG" VALUE="<%= extList.getCurrentRow() %>"
                 <% if (extList.getCurrentRow() == row) out.print(" checked"); %> 
                <% if (msgPC.getE01PCDSTS() == "D") out.print(" disabled"); %>
                onClick="showInfo(<%= extList.getCurrentRow() %>,'<%=msgPC.getE01PCDNUM()%>')">
			<% } %>
              </TD>
              <TD ALIGN=CENTER NOWRAP><%= Util.formatCell(msgPC.getE01PCDNUM()) %></TD>
              <TD ALIGN=LEFT NOWRAP><%= Util.formatCell(msgPC.getE01PCDAD1()) %></TD>
              <TD ALIGN=LEFT NOWRAP><%= Util.formatCell(msgPC.getE01PCDCTY()) %></TD>
              <TD ALIGN=LEFT NOWRAP><%= Util.formatCell(msgPC.getE01PCDCTR()) %></TD>
              <TD ALIGN=RIGHT NOWRAP><%= Util.formatCell(msgPC.getE01PCDVVE()) %></TD>              
              <TD ALIGN=CENTER NOWRAP><%= Util.formatCell(msgPC.getE01PCDSTS()) %></TD>
             </TR>
      <%              
		}
    %>
    </table>
    </div>
   </TD> 
  </TR>	
 </TABLE>
 
  <SCRIPT type="text/javascript">  	
  document.forms[0].LASTROW.value="<%= k %>";
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
