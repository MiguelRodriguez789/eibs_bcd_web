 <%@ page import = "datapro.eibs.master.Util" %>
 <%@ page import = "datapro.eibs.beans.*" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
<HEAD>
<TITLE>Consulta Consolidados de Proyectos</TITLE>
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

function goAction(op) {
 var delok= false;
 var page="";
 if (op == 1) {
     page = '${pageContext.request.contextPath}/pages/s/EPC0200_pc_list_sch_prt.jsp';
 }
   CenterWindow(page,600,470,2);
 }      


function goExit(){
  window.location.href="<%=request.getContextPath()%>/pages/background.jsp";

}

function showInfo(idxRow,d1,d2,d3,d4,d5){
   for ( var i=0; i<dataTable.rows.length; i++ ) {
       dataTable.rows[i].className="trnormal";
    }
   dataTable.rows[idxRow].className="trhighlight";
   document.forms[0].ROW.value = "" + idxRow;
  } 


function getDetail(PRCD,PCCY,PBRN,PCCN)
{
	page = "${pageContext.request.contextPath}/servlet/datapro.eibs.products.JSEPC0200?SCREEN=104&RCD=" + PRCD + "&CCY=" + PCCY + "&BRN=" + PBRN + "&CCN=" + PCCN;
	CenterWindow(page,800,500,2);
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


<FORM Method="post" Action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEPC0200">
<INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="104">
<INPUT TYPE=HIDDEN NAME="OPT" VALUE="3">
<INPUT TYPE=HIDDEN NAME="ROW" VALUE="0">
<INPUT TYPE=HIDDEN NAME="LASTROW" VALUE="1">

<h3 align="center">Consulta Consolidados de Proyectos<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="pc_list_sch.jsp,EPC0200"> 
</h3>
<hr size="4">
  
  
<TABLE class="tbenter">

 <%
	if ( !(extList.getNoResult() )) {
 %>
 	<tr>
    <TD ALIGN=CENTER CLASS=tdbkg><a href="javascript:goAction('1')">Imprimir</a></TD>
	</tr>
 <% } %>
	<tr>
    <TD ALIGN=CENTER CLASS=tdbkg><a href="javascript:goExit()">Salir</a></TD>
	</tr>
</TABLE>

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
 
 <TABLE  id="mainTable" class="tableinfo" >
 <TR> 
   <TD NOWRAP valign="top" width="100%">
    <table id="headTable" style="width: 100%">
    <TR id="trdark"> 

      <TH ALIGN=CENTER nowrap>Secuencia</TH>
      <TH ALIGN=CENTER nowrap>Concepto</TH>      
      <TH ALIGN=CENTER nowrap>Descripción</TH>      
      <TH ALIGN=CENTER nowrap>Número</TH>            
      <TH ALIGN=CENTER nowrap>Valor Solicitado</TH>                  
    </TR>
    </TABLE>
  
    <div id="dataDiv1" class="scbarcolor" style="padding:0">
    <table id="dataTable"  >
    <%
         int Type;
	     Type = Integer.parseInt(userPO.getHeader18().trim());
         int row;
		 try{row = Integer.parseInt(request.getParameter("ROW"));}catch(Exception e){row = 0;}
         extList.initRow();  
         int k=1;               
         while (extList.getNextRow()) {
            EPC020001Message msgPC = (EPC020001Message) extList.getRecord();
            k++;            
     %> 
            <TR> 
			<% if (!msgPC.getE01PCMNUM().equals("0")) { %>
			<TD NOWRAP ALIGN="CENTER">
				<a href="javascript:getDetail('<%= msgPC.getE01CNORCD()%>','<%= msgPC.getE01PCMCCY()%>','<%= msgPC.getE01PCMBRN()%>','<%= msgPC.getE01PCMCCN()%>')"><%=Util.formatCell(msgPC.getE01PCMNUM())%></a>
			</TD>
             <%  } else {%>
              <TD ALIGN=CENTER NOWRAP> </TD>
             <%  }%>             

			<% if (msgPC.getH01OPECOD().equals("0015")) { %>
              <TD ALIGN=CENTER NOWRAP><%= Util.formatCell(msgPC.getE01CNORCD()) %></TD>              
             <%  } else if (msgPC.getH01OPECOD().equals("0025")){%>
              <TD ALIGN=CENTER NOWRAP><%= Util.formatCell(msgPC.getE01PCMCCY()) %></TD>              
             <%  } else if (msgPC.getH01OPECOD().equals("0035")){%>
              <TD ALIGN=CENTER NOWRAP><%= Util.formatCell(msgPC.getE01PCMBRN()) %></TD>              
             <%  } else if (msgPC.getH01OPECOD().equals("0045")){%>
              <TD ALIGN=CENTER NOWRAP><%= Util.formatCell(msgPC.getE01PCMCCN()) %></TD>              
             <%  }%>             
              <TD ALIGN=LEFT NOWRAP><%= Util.formatCell(msgPC.getE01CNODSC()) %></TD>              
              <TD ALIGN=RIGHT NOWRAP><%= Util.formatCell(msgPC.getE01TOTNUM()) %></TD>              
              <TD ALIGN=RIGHT NOWRAP><%= Util.formatCell(msgPC.getE01TOTVSL()) %></TD>              
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
