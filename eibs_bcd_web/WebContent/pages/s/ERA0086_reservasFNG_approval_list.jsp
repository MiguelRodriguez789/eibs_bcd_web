<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<HTML>
<HEAD>
<TITLE>
Aprobación Reservas FNG
</TITLE>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Studio">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "appList" class= "datapro.eibs.beans.JBList"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript">
  var reason = '';
 
  function goAction(op) {

     document.forms[0].action.value = op;
     document.forms[0].reason.value = reason;
     var formLength= document.forms[0].elements.length;
     var ok = false;
     for(n=0;n<formLength;n++)
     {
      	var elementName= document.forms[0].elements[n].name;
      	if(elementName == "REFNUM") 
      	{
        		ok = true;
        		break;
      	}
      }
	  if ( ok ) {
		if (op == 'A') {
	        if (confirm("Confirmar Aprobacion de esta Reserva")) {
				document.forms[0].submit();		
    	     }
		}
		if (op == 'R') {
			document.forms[0].submit();		
		}
		if (op == 'E') {
	        if (confirm("Confirmar Eliminación de esta Reserva")) {
				document.forms[0].submit();		
    	     }
		}
      }
      else {
			alert("Seleccione un numero de referencia antes de realizar esta operación");	   
      }

  } 
  
  function goExit(){
     window.location.href="<%=request.getContextPath()%>/pages/background.jsp";

  }
  
  function showAddInfo(idxRow){   
   for ( var i=0; i<dataTable.rows.length; i++ ) {
       dataTable.rows[i].className="trnormal";
    }
   dataTable.rows[idxRow].className="trhighlight";
  } 
  
function showInqReserva(acd,ref,x){
	var SCREEN = "102";
	var OPECOD = "0004";
	var E01RESNRE = ref;
	page = "<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSERA0075?SCREEN="+SCREEN+"&OPECOD="+OPECOD+"&E01RESNRE="+E01RESNRE+"&PURPOSE=INQUIRY&E01RESCUN=0";
	CenterNamedWindow(page,'Information',1200,600,2);
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
%>

<BODY onload="MM_preloadImages('<%=request.getContextPath()%>/images/s/approve_over.gif','<%=request.getContextPath()%>/images/s/reject_over.gif')">

<FORM Method="post" Action="<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSERA0086" >
<INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="2">
<INPUT TYPE=HIDDEN NAME="action" VALUE="A">
<INPUT TYPE=HIDDEN NAME="reason" VALUE="">
<INPUT TYPE=HIDDEN NAME="totalRow" VALUE="0">       
 <h3 align="center">Aprobación Reservas FNG </h3>
<hr size="4">
  
  
<TABLE class="tbenter">
  	<TR> 
  	  <TD class=TDBKG width="25%"> 
        <div align="center"><a name="linkApproval" href="javascript:goAction('A')"><b>Aprobar</b></a></div>
      </TD>
      <TD class=TDBKG width="25%"> 
        <div align="center"><a href="javascript:enterReason('R')"><b>Rechazar</b></a></div>
      </TD>
      <TD class=TDBKG width="25%"> 
        <div align="center"><a href="javascript:goAction('E')"><b>Eliminar</b></a></div>
      </TD>
      <TD class=TDBKG width="25%"> 
        <div align="center"><a href="<%=request.getContextPath()%>/pages/background.jsp"><b>Salir</b></a></div>
      </TD> 
  </TR>
</TABLE>
 
  <TABLE  id="mainTable" class="tableinfo" ALIGN=CENTER height="70%">
 <TR height="5%"> 
    <TD NOWRAP valign="top" width="90%">
  <TABLE id="headTable" width="100%" >
    <TR id="trdark"> 
      <TH ALIGN=CENTER nowrap></TH>
      <TH ALIGN=CENTER nowrap>No. Reserva</TH>
      <TH ALIGN=CENTER nowrap>Nombre Cliente</TH>
      <TH ALIGN=CENTER nowrap>Moneda</TH>
      <TH ALIGN=CENTER nowrap>Monto Reserva</TH>
      <TH ALIGN=CENTER nowrap>Estado</TH>
      <TH ALIGN=CENTER nowrap>Bco</TH>
      <TH ALIGN=CENTER nowrap>No. Cliente</TH>
    </TR>
  </TABLE>
  
  	<div id="dataDiv1" style="height:400px; overflow:auto;">   
	<table id="dataTable" cellspacing="0" cellpadding="1" border="0" width="100%">
    <%
                appList.initRow();
                int k=1;
                while (appList.getNextRow()) {
                    if (appList.getFlag().equals("")) {
                    		out.println(appList.getRecord());
                    k++;
                    }        
                }
    %>
   </table>
   </div>
   
  </TD>
  </TR>	
</TABLE>

<SCRIPT type="text/javascript">
  function resizeDoc() {
       divResize();
     adjustEquTables( getElement("headTable"), getElement("dataTable"), getElement("dataDiv1"),1,false);
}
  showChecked("REFNUM");
  resizeDoc();
  window.onresize=resizeDoc;
     
  document.forms[0].totalRow.value="<%= k %>";
  
</SCRIPT>

</FORM>

</BODY>
</HTML>
