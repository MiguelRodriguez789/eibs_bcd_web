<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
 
<%@ page import ="datapro.eibs.master.Util" %>
<HTML>
<HEAD>
<TITLE>
Lista de Pedidos Papel Valor
</TITLE>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "mtList" class= "datapro.eibs.beans.JBObjList"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />

<SCRIPT language="javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>


<SCRIPT language="javascript">
  
  function goAction(opt) {
    
    if (opt == "D") {
      ok = confirm("Esta seguro que desea eliminar el registro seleccionado?");
	  if (ok) document.forms[0].submit();
	} else if (opt == "M") { 
		var row = document.forms[0].CURRENTROW.value;   
    	page = "<%=request.getContextPath()%>/pages/s/EVL0010_value_paper_req_maint.jsp?ROW=" + row;
  		CenterNamedWindow(page,'Information',500,330,2);
  	 } else {
  	    page = "<%=request.getContextPath()%>/pages/s/EVL0010_value_paper_req_new.jsp?NEW=1";
  		CenterNamedWindow(page,'Information',500,300,2);
  	}
  }
  
</SCRIPT>

</HEAD>

<BODY>

<% 
 String chk = "";
 	
 if ( !error.getERRNUM().equals("0")  ) {
     error.setERRNUM("0");
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors();");
     out.println("</SCRIPT>");
 } 
%>


<h3 align="center">Lista de Pedidos de Papel Valor
<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="value_paper_req_list.jsp,EVL0010">
</h3>
<hr size="4">
<FORM Method="post" Action="<%=request.getContextPath()%>/servlet/datapro.eibs.valuepaper.JSEVL0010" >

<%
	if ( mtList.getNoResult() ) {
%> 

  <TABLE class="tbenter" width="60%" style="width: 1040px">
    <TR> 
      <TD class=TDBKG width="50%"> 
        <div align="center"><a href="javascript:goAction('N')">Crear</a> 
        </div>
      </TD>
      <TD class=TDBKG width="50%"> 
        <div align="center"><a href="javascript:checkClose()">Salir</a> </div>
      </TD>
    </TR>
  </TABLE>
  <TABLE class="tbenter" style="width: 1040px">
   	<TR>
      <TD> 
        <div align="center"> 
          <p>
            <b>No existen registros de pedidos. Haga click en la opcion "Nuevo" para crear un pedido </b>
          </p>          
        </div>
      </TD>
     </TR>
   </TABLE>
  <%   		
	}
	else { 
	
  %>
     
 <INPUT TYPE=HIDDEN NAME="CURRENTROW" VALUE="0"> 
 <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="200">
    
 <TABLE class="tbenter" width="100%" style="width: 1040px">
    <TR> 
      <TD class=TDBKG width="25%"> 
        <div align="center"><a href="javascript:goAction('N')">Crear</a> 
        </div>
      </TD>
      <TD class=TDBKG width="25%"> 
        <div align="center"><a href="javascript:goAction('M')">Modificar</a> 
        </div>
      </TD>
      <TD class=TDBKG width="25%"> 
        <div align="center"><a href="javascript:goAction('D')">Borrar</a> 
        </div>
      </TD>
      <TD class=TDBKG width="25%"> 
        <div align="center"><a href="javascript:checkClose()">Salir</a> </div>
      </TD>
    </TR>
 </TABLE>
  
   <TABLE  id="mainTable" class="tableinfo" style="height:400px; width:1040px;">
   <tr  height="5%"> 
      <td NOWRAP valign="top" width="100%"> 
		<table id="headTable" width="98%">
			<tr id="trdark">
	    		<TH ALIGN=CENTER width="5%"></TH>
	    		<TH ALIGN=CENTER width="10%">Referencia</TH>   
	    		<TH ALIGN=CENTER width="5%">Banco</TH>
	    		<TH ALIGN=CENTER width="5%">Oficina</TH>
	    		<TH ALIGN=CENTER width="5%">Tipo<BR>Papel<BR>Valor</TH>
	    		<TH ALIGN=CENTER width="20%">Descripcion Tipo</TH>
	    		<TH ALIGN=CENTER width="10%">Subtipo<BR>Papel<BR>Valor</TH>
	    		<TH ALIGN=CENTER width="15%">Descripcion Subtipo</TH>
	    		<TH ALIGN=CENTER width="5%">Cantidad<BR>Solicitada</TH>
	    		<TH ALIGN=CENTER width="20%">Usuario<BR>Fecha/Hora<BR>Creacion</TH> 
			</tr>
        </table>
      </td>
    </tr>    
		  <tr  height="95%">    
		    <td nowrap="nowrap">      
		       <div id="dataDiv1" style="height:400px; overflow:auto;"> 
		       <table id="dataTable" cellspacing="0" cellpadding="1" border="0" width="100%">         
     <%
                mtList.initRow(); 
                chk = "checked";               
                while (mtList.getNextRow()) {
                   datapro.eibs.beans.EVL001001Message msgMT = (datapro.eibs.beans.EVL001001Message) mtList.getRecord();
     %>               
          <tr id="dataTable<%= mtList.getCurrentRow() %>"> 
            <td NOWRAP  align=CENTER width="5%"><input type="radio" name="ROW" id="ROW" value="<%= mtList.getCurrentRow() %>" <%=chk%> class="highlight" onClick="document.forms[0].CURRENTROW.value = this.value;" ></td>
			<TD NOWRAP ALIGN="CENTER" width="10%"><%=Util.formatCell(msgMT.getE01REQREF()) %></TD>
			<TD NOWRAP ALIGN="CENTER" width="5%"><%=Util.formatCell(msgMT.getE01REQBNK())%></TD>
			<TD NOWRAP ALIGN="CENTER" width="5%"><%=Util.formatCell(msgMT.getE01REQBRN())%></TD>
			<TD NOWRAP ALIGN="CENTER" width="5%"><%=Util.formatCell(msgMT.getE01REQTIP())%></TD>
			<TD NOWRAP ALIGN="LEFT" width="20%"><%=Util.formatCell(msgMT.getE01REQTIN())%></TD>
			<TD NOWRAP ALIGN="CENTER" width="10%"><%=Util.formatCell(msgMT.getE01REQSUB())%></TD>
			<TD NOWRAP ALIGN="LEFT" width="15%"><%=Util.formatCell(msgMT.getE01REQSUN())%></TD>
			<TD NOWRAP ALIGN="CENTER" width="5%"><%=Util.formatCell(msgMT.getE01REQRQT())%></TD>
		    <TD NOWRAP ALIGN="left" width="20%"><%=Util.formatCell(msgMT.getE01REQCRU()) + "<br>" +  Util.formatDate(msgMT.getE01REQCD1(),msgMT.getE01REQCD2(),msgMT.getE01REQCD3()) + "<br>" + Util.formatCell(msgMT.getE01REQCRT()) %></TD>
		</TR>    		
    <%             
    	chk = "";     
     }
    %>    
             </table>
             </div>
             </td>
             </tr>
</table>

<SCRIPT language="JavaScript">
  showChecked("ROW");       
</SCRIPT>

<%   		
	} 
 %>
</FORM>

</BODY>
</HTML>
