 <%@ page import = "datapro.eibs.master.Util" %>
 <%@ page import = "datapro.eibs.beans.*" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
<HEAD>
<TITLE>Mantenimiento Presupuesto/Ejecución de Obra</TITLE>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "extList" class= "datapro.eibs.beans.JBObjList"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>

<script type="text/javascript">

   builtNewMenu(pc_m_opt);

function goAction(op) {
 var delok= false;
 var page="";
 if (op == 1) {
     page = '${pageContext.request.contextPath}/pages/s/EPC0300_pc_new_sch.jsp';
 } else if (op == 2) {
     page = '${pageContext.request.contextPath}/pages/s/EPC0300_pc_maint_sch.jsp?ROW=' + document.forms[0].ROW.value;
 } else if (op == 4) {     
     page = '${pageContext.request.contextPath}/pages/s/EPC0300_pc_delete_sch.jsp?ROW=' + document.forms[0].ROW.value; 
 } else if (op == 5) {     
     page = '${pageContext.request.contextPath}/pages/s/EPC0300_pc_budget_sch.jsp?ROW=' + document.forms[0].ROW.value; 
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

<BODY>
<% 
 if ( !error.getERRNUM().equals("0")  ) {
     error.setERRNUM("0");
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
 }
  out.println("<SCRIPT> initMenu(); </SCRIPT>");    
%>
<FORM Method="post" Action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEPC0300">
<INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="2">
<INPUT TYPE=HIDDEN NAME="OPT" VALUE="3">
<INPUT TYPE=HIDDEN NAME="ROW" VALUE="0">

<h3 align="center">Mantenimiento Presupuesto/Ejecución de Obra<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="pc_list_sch.jsp,EPC0300"> 
</h3>
<hr size="4">
  
  
<TABLE class="tbenter">
  <TR> 
    <TD ALIGN=CENTER CLASS=tdbkg><a href="javascript:goAction('1')">Crear</a></TD>
 <%
	if ( !(extList.getNoResult() )) {
 %>
    <TD ALIGN=CENTER CLASS=tdbkg><a href="javascript:goAction('2')">Modificar</a></TD>
    <TD ALIGN=CENTER CLASS=tdbkg><a href="javascript:goAction('4')">Eliminar</a></TD>
    <TD ALIGN=CENTER CLASS=tdbkg><a href="javascript:goAction('5')">Obra Ejecutada</a></TD>
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
                <input type="text" name="E01ACCNUM" size="13" maxlength="12" value="<%= userPO.getIdentifier().trim()%>" readonly>
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
<%if ( extList.getNoResult() ) { %>
   	<TABLE class="tbenter" width=100% height=40%>
   	 <TR valign="middle">
      <TD> 
        <div align="center">       		
          <p><b>No hay resultados que correspondan a su criterio de búsqueda. 
            Haga Click en la opci&oacute;n Nueva para adicionar una unidad
            </b></p>
          </div>
      </TD>
     </TR>
   	</TABLE>
<% } else {%>  
 <INPUT TYPE=HIDDEN NAME="E01DLLSD1" VALUE="">
 <INPUT TYPE=HIDDEN NAME="E01DLLSD2" VALUE="">
 <INPUT TYPE=HIDDEN NAME="E01DLLSD3" VALUE="">
 
  <TABLE  id="mainTable" class="tableinfo">
    <tr  height="5%"> 
      <td NOWRAP valign="top" width="100%"> 
		<table id="headTable" width="98%">
			<tr id="trdark">
		      <TH ALIGN=CENTER nowrap width="5%">&nbsp;</TH>
		      <TH ALIGN=CENTER nowrap width="15%">Código Presupuesto</TH>
		      <TH ALIGN=CENTER nowrap width="30%">Descripción</TH>
		      <TH ALIGN=CENTER nowrap width="25%">Valor Presupuesto</TH>
		      <TH ALIGN=CENTER nowrap width="25%">Valor Ejecutado</TH>
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
            EPC030001Message msgPCC = (EPC030001Message) extList.getRecord();
     %> 
            <TR> 
              <TD ALIGN=CENTER NOWRAP width="5%"> 
                <INPUT TYPE="radio" NAME="EXTCHG" VALUE="<%= extList.getCurrentRow() %>" <% if (extList.getCurrentRow() == row) out.print("checked"); %> onClick="showInfo(<%= extList.getCurrentRow() %>,'<%=msgPCC.getE01PCBNUM()%>')">
              </TD>
              <TD ALIGN=CENTER NOWRAP width="15%"><%= Util.formatCell(msgPCC.getE01PCBRCD()) %></TD>
              <TD ALIGN=LEFT NOWRAP width="30%"><%= Util.formatCell(msgPCC.getD01PCMPRO()) %></TD>
              <TD ALIGN=RIGHT NOWRAP width="25%"><%= Util.formatCell(msgPCC.getE01PCBAMT()) %></TD>              
              <TD ALIGN=RIGHT NOWRAP width="25%"><%= Util.formatCell(msgPCC.getE01PCBXAM()) %></TD>              
             </TR>
      <% } %>
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
