 <%@ page import = "datapro.eibs.master.Util" %>
 <%@ page import = "datapro.eibs.beans.*" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
<HEAD>
<TITLE>Reporte Consolidados de Proyectos</TITLE>
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

<style>
<!--
BODY {
	background-color: #FFFFFF;
}
	
TABLE {
	font-family: Arial, Helvetica, sans-serif;
	font-size:8pt;
	background-color: #F0F0F0;
	border-color: #0b23b5;
	color: #0B23B5;
	
}
	
TH {font-family: Arial, Helvetica, sans-serif;
	font-size:8pt;
	color: #0B23B5;
	text-transform : uppercase;
        
}

#trdark{
	background-color: #D1D1D1;
	font-family: Arial, Helvetica, sans-serif;
	font-size: 8pt;
	color: #0B23B5;
	height:20pt;
}

#trclear{
	background-color: #F0F0F0;
	font-family: Arial, Helvetica, sans-serif;
	font-size: 8pt;
	color: #0B23B5;
	height:20pt;
	}
	
P {
	font-family: Arial, Helvetica, sans-serif;
	font-size: 8pt;
	color: #0B23B5;
} 

HR{
	color: #D1D1D1;
	height : 4pt;
}

H3 {font-family: "MS Sans Serif", Geneva, sans-serif;
	font-size:10pt;
	text-align: center;
	color: #0B23B5;
	}
 
 H4{font-family: "MS Sans Serif", Geneva, sans-serif;
	font-size: 8pt;
	text-align:left;
	color: #0B23B5;
}

.tableinfo{
	border-top-width : 1px;border-right-width : 1px;border-bottom-width : 1px;border-left-width : 1px;
	border-color: #0b23b5;
	border-style : solid solid solid solid;
	width:100%;
	filter:progid:DXImageTransform.Microsoft.dropshadow(OffX=3, OffY=3, Color='gray', Positive='true');  
}
-->
</style>


<BODY>


<FORM Method="post" Action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEPC0200">
<INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="104">
<INPUT TYPE=HIDDEN NAME="OPT" VALUE="3">
<INPUT TYPE=HIDDEN NAME="ROW" VALUE="0">
<INPUT TYPE=HIDDEN NAME="LASTROW" VALUE="1">

<h3 align="center">Reporte Consolidados de Proyectos<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="pc_list_sch.jsp,EPC0200"> 
</h3>
<hr size="4">
  
  
<TABLE class="tbenter">
  <TR> 
    <TD ALIGN=CENTER CLASS=tdbkg><a href="javascript:goExit()">Salir</a></TD>
  </TR>
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
