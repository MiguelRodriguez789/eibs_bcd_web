<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
<HEAD>
<TITLE>Front Office - Lista de Clientes</TITLE>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "cifList" class= "datapro.eibs.beans.JBList"  scope="session" />
<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session"/>

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript">

 function goAction(op) {

	document.forms[0].opt.value = op;
    var formLength= document.forms[0].elements.length;
    var ok = false;
 	var cun = "0";
  	var prf = "";
	var pg = "";
    for(n=0;n<formLength;n++) {
    	var elementName= document.forms[0].elements[n].name;
      	if(elementName == "CUSTOMER") {
			if (document.forms[0].elements[n].checked == true) {
				ok = true;
				cun = document.forms[0].elements[n].value;
        		break;
			}
 		}
	}
  	if (!ok && op < 4) {
  		alert("Favor seleccionar un Cliente para continuar.");	   
		return;
    }
  	
	switch (op){
		// Front Office - Transaccions
		case 2:  {
			pg = "<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEFO0120?SCREEN=1&CUSTOMER=" + cun;
    		window.location.href=pg;
          	break;
        }
		// Not Verified or Exit
   		default: {
	  	    pg = "<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEFO0010?SCREEN=1&TYPE=FRONT_OFFICE";
			window.location.href=pg;
	  	  	break;
        }
    }  
  }
  
function getPortfClient(indexRow,customer) {
    document.forms[0].CUSTOMER.value = customer;
    showAddInfo(indexRow)
}
  
function showAddInfo(idxRow){
   tbAddInfo.rows[0].cells[1].style.color="white";
   tbAddInfo.rows[0].cells[1].innerHTML=getElement("TXTDATA"+idxRow).value;
   if (tbAddInfo.rows[0].cells[1].filters[0])
   	tbAddInfo.rows[0].cells[1].filters[0].apply();
   tbAddInfo.rows[0].cells[1].style.color="";
   if (tbAddInfo.rows[0].cells[1].filters[0])
   	tbAddInfo.rows[0].cells[1].filters[0].Play();   
   for ( var i=0; i<dataTable.rows.length; i++ ) {
       dataTable.rows[i].className="trnormal";
    }
   dataTable.rows[idxRow].className="trhighlight";
        	adjustEquTables(getElement('headTable'),getElement('dataTable'), getElement('dataDiv1'),1,false);
}    
</script>

</HEAD>

<BODY>

<h3 align="center"><%= userPO.getHeader7()%><br>Lista de Clientes</h3>
<hr size="4">
<FORM Method="post" Action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEFO0010" > 
<INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="4">
<INPUT TYPE=HIDDEN NAME="opt" VALUE="1">

<%
	if ( cifList.getNoResult() ) {
 %>
   	<TABLE class="tbenter" width=100% height=90%>
   		<TR>
      		<TD> 
      			<div align="center"> <font size="3"><b> No hay resultados para este criterio de Busqueda</b></font>
	 			</div>
      		</TD>
		</TR>
   	</TABLE>
<%   		
	}
	else {
%>
  
  <TABLE class="tbenter" width="100%">
    <TR> 
      <TD CLASS="TDBKG" ALIGN=CENTER class=IBSBTN> <a href="javascript:goAction(2)">
		 Ejecutar Acci�n</a>
      </TD>
      <TD CLASS="TDBKG" ALIGN=CENTER class=IBSBTN> <a href="javascript:goAction(99)">Salir</a> 
      </TD>
    </TR>
  </TABLE>
  
<TABLE  id="mainTable" class="tableinfo" ALIGN=CENTER >
 <TR> 
    <TD NOWRAP valign="top" width="100%" >
     <table id="headTable" style="width: 100%">
     <TR id="trdark"> 
      <TH ALIGN=CENTER NOWRAP></TH>
      <TH ALIGN=CENTER NOWRAP>Cliente</TH>
      <TH NOWRAP>Nombre</TH>
      <TH ALIGN=CENTER NOWRAP>Oficial</TH>
      <TH ALIGN=CENTER NOWRAP>Agencia</TH>
      <TH NOWRAP>Nombre Corto</TH>
  </TR>
</TABLE>

    
   <div id="dataDiv1" class="scbarcolor">
    <table id="dataTable" >
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
      <Table id="tbAddInfoH" width="100%" >
        <tr id="trdark">
         <TH ALIGN=CENTER nowrap >Informaci�n B�sica</TH>
        </tr>
      </Table>

     <Table id="tbAddInfo" width="100%">
      <tr id="trclear" >
         <TD  ALIGN="RIGHT"  valign="middle" nowrap ><b>N�mero Ident. : <br>Tipo Ident. : <br>Pa�s : <br>Status : <br>Tipo : </b></TD>
         <TD ALIGN="LEFT" valign="middle" nowrap class="tdaddinfo"></TD>
      </tr>
     </Table>
  </TD>
  </TR>	
</TABLE>

<SCRIPT type="text/javascript">
     function resizeDoc() {
           	adjustEquTables(getElement('headTable'),getElement('dataTable'), getElement('dataDiv1'),1,false);
      tbAddInfoH.rows[0].cells[0].height = headTable.rows[0].cells[0].clientHeight;
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
      			int pos = cifList.getFirstRec() - 101;
      			out.println("<A HREF=\""+request.getContextPath()+"/servlet/datapro.eibs.products.JSEFO0010?SCREEN=3&NameSearch=" + cifList.getSearchText() +"&Type=" + cifList.getSearchType() + "&Pos=" + pos + "\"><IMG border=\"0\" src=\""+request.getContextPath()+"/images/e/previous_records.gif\" ></A>");
        }
  %>  
  </TD>
  <TD WIDTH="50%" ALIGN=RIGHT>     
 <%      
        if ( cifList.getShowNext() ) {
      			int pos = cifList.getLastRec();
      			out.println("<A HREF=\""+request.getContextPath()+"/servlet/datapro.eibs.products.JSEFO0010?SCREEN=3&NameSearch=" + cifList.getSearchText() +"&Type=" + cifList.getSearchType() + "&Pos=" + pos + "\"><IMG border=\"0\" src=\""+request.getContextPath()+"/images/e/next_records.gif\" ></A>");
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
