<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
<HEAD>
<TITLE> Lista de Cliente </TITLE>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "cifList" class= "datapro.eibs.beans.JBList"  scope="session" />

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>

<script type="text/javascript">
  function goAction(op) {

     document.getElementById("opt").value = op;
	 var cun = getElementChecked("CUSTOMER").value;
	 var pg = "";
     if (op == 7) {
		pg = "<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSESD1080?SCREEN=8&E01CUN=" + cun;
//		 window.location.href = pg;
	 } else {
	  	pg = "<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSECIF010?SCREEN=4&opt=" + op + "&CUSTOMER=" + cun;
	 }
     CenterWindow(pg,1000,600,2);
  }
  
  function showAddInfo(idxRow){
   		document.getElementById("tbAddInfo").rows[0].cells[1].style.color = "#d0122c";
   		document.getElementById("tbAddInfo").rows[0].cells[1].innerHTML = getElement("TXTDATA"+idxRow).value;
   
      		for ( var i=0; i<document.getElementById("dataTable").rows.length; i++ ) {
       		document.getElementById("dataTable").rows[i].className = "trnormal";
    	}
   		document.getElementById("dataTable").rows[idxRow].className = "trhighlight";
      
   
   document.getElementById("tbAddInfo").rows[0].cells[1].style.color="";
   for ( var i=0; i<dataTable.rows.length; i++ ) {
       document.getElementById("dataTable").rows[i].className="trnormal";
    }
   document.getElementById("dataTable").rows[idxRow].className="trhighlight";
        	adjustEquTables(getElement('headTable'),getElement('dataTable'), getElement('dataDiv1'),1,false, .80);
}    
</script>

</HEAD>

<BODY>

<h3 align="center">Clientes<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="cif_list.jsp,ECIF010"></h3>
<hr size="4">
<FORM Method="post" Action="<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSECIF010" >
<INPUT TYPE=HIDDEN NAME="SCREEN" id="SCREEN" VALUE="4">
<INPUT TYPE=HIDDEN NAME="opt" id="opt" VALUE="1">

<%
	if ( cifList.getNoResult() ) {
 %>
   		<TABLE class="tbenter" width=100% height=90%>
   		<TR>
      <TD> 
        
      <div align="center"> <font size="3"><b> No hay resultado que corresponda a su criterio de búsqueda. 
        </b></font> </div>
      </TD></TR>
   		</TABLE>
<%   		
	}
	else {
%>
  
  <TABLE class="tbenter" width="100%">
    <TR> 
      <TD ALIGN=CENTER class=TDBKG> <a href="javascript:goAction(7)" ><b>Consulta</b></a></TD>
      <TD ALIGN=CENTER class=TDBKG> <a href="javascript:goAction(1)" ><b> Totales</b></a></TD>
      <TD ALIGN=CENTER class=TDBKG> <a href="javascript:goAction(2)" ><b>Posicion</b></a></TD>
      <TD ALIGN=CENTER class=TDBKG> <a href="javascript:goAction(3)" ><b>Consulta<br>Gerencial</b></a> </TD>
      <TD ALIGN=CENTER class=TDBKG> <a href="javascript:goAction(4)" ><b>Lista de<br>Cuentas</b></a> </TD>
      <TD ALIGN=CENTER class=TDBKG> <a href="javascript:goAction(5)" ><b>Lineas de<br>Credito</b></a> </TD>
      <TD ALIGN=CENTER class=TDBKG> <a href="javascript:goAction(6)" ><b>Garantias</b></a></TD>
      <TD ALIGN=CENTER class=TDBKG><a href="javascript:goAction(9)"><b>Rentabilidad</b></a></TD>
      <TD ALIGN=CENTER class=TDBKG> <a href="<%=request.getContextPath()%>/pages/background.jsp" ><b>Salir</b></a> 
      </TD>
    </TR>
  </TABLE>
        
  
 <TABLE  id="mainTable" class="tableinfo" height="10%" width="100%">
 	<TR height="5%"> 
   		<TD NOWRAP valign="top" > 
    		<TABLE id="headTable" >
    			<TR id="trdark">  
			      <TH ALIGN=CENTER width="10%" NOWRAP ></TH>
			      <TH ALIGN=CENTER width="10%" NOWRAP >Número</TH>
			      <TH ALIGN=CENTER width="40%" NOWRAP >Nombre Legal</TH>
			      <TH ALIGN=CENTER width="40%" NOWRAP >Nombre Corto</TH>
    			</TR>
       		</TABLE>
  		</TD>
  		<TD nowrap ALIGN="RIGHT" valign="top">
	        <Table id="tbAddInfoH"  width="100%" >
	        <tr id="trdark">
	            <TH ALIGN=CENTER nowrap > Informaci&oacute;n B&aacute;sica</TH>
	        </tr>
	      	</Table>
  		</TD>
  	</TR>	
  	<TR height="95%"> 
    	<TD NOWRAP valign="top" width="80%">
  
   <div id="dataDiv1" style="height:400px; overflow:auto;">  
   <table id=dataTable cellspacing="0" cellpadding="1" border="0" width="100%" >
  <%
                cifList.initRow();
                while (cifList.getNextRow()) {
                    if (cifList.getFlag().equals("")) {
                    		out.println(cifList.getRecord());
                    }
                }
    %> 
   </table>
   </div>
   </TD>
   <TD nowrap ALIGN="RIGHT" valign="top">

    <Table id="tbAddInfo" >
      <tr id="trclear">
            <TD  ALIGN="RIGHT"  nowrap >
         <b>Número Ident. : 
         <br>Tipo Ident. : 
         <br>País : 
         <br>Status : 
         <br>Tipo : </b></TD>
         <TD ALIGN="LEFT" nowrap class="tdaddinfo"></TD>
      </tr>
     </Table>
  </TD>
  </TR>	
</TABLE>

<SCRIPT type="text/javascript">
     function resizeDoc() {
      adjustEquTables(getElement('headTable'), getElement('dataTable'), getElement('dataDiv1'), 1, false, .77);
      document.getElementById("tbAddInfoH").rows[0].cells[0].height = document.getElementById("headTable").rows[0].cells[0].clientHeight;
      }
      showAddInfo(0);
     resizeDoc();
     window.onresize=resizeDoc;
     
</SCRIPT>
<BR>
<TABLE class="tbenter" WIDTH="98%" ALIGN=CENTER>
  <TR>
  <TD WIDTH="50%" ALIGN=LEFT>
<%
        if ( cifList.getShowPrev() ) {
      			int pos = cifList.getFirstRec() - 13;
      			out.println("<A HREF=\""+request.getContextPath()+"/servlet/datapro.eibs.client.JSECIF010?SCREEN=3&NameSearch=" + cifList.getSearchText() +"&Type=" + cifList.getSearchType() + "&Pos=" + pos + "\"><IMG border=\"0\" src=\""+request.getContextPath()+"/images/s/previous_records.gif\" ></A>");
        }
  %>  
  </TD>
  <TD WIDTH="50%" ALIGN=RIGHT>     
 <%      
        if ( cifList.getShowNext() ) {
      			int pos = cifList.getLastRec();
      			out.println("<A HREF=\""+request.getContextPath()+"/servlet/datapro.eibs.client.JSECIF010?SCREEN=3&NameSearch=" + cifList.getSearchText() +"&Type=" + cifList.getSearchType() + "&Pos=" + pos + "\"><IMG border=\"0\" src=\""+request.getContextPath()+"/images/s/next_records.gif\" ></A>");
        }
   %> 
   </TD>
 	</TR>
 	</TABLE>
<%           
  }
%>

</FORM>

</BODY>
</HTML>
