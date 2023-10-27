<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<HTML>
<HEAD>
<TITLE>
GENERACION ARCHIVO CONFECAMARAS 
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
	      if (op == 'H') {
	        if (confirm("Desea someter proceso generacion archivo Preliminar a Confecamaras?")) {
			     document.forms[0].reason.value = "P";
				document.forms[0].submit();		
    	     }
	       } else {   
	      if (op == 'G') {
	        if (confirm("Desea someter proceso generacion archivo Definitivo a Confecamaras?")) {
			     document.forms[0].reason.value = "D";
				document.forms[0].submit();		
    	     }
	       } else {   
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
  
function showInqApprovalColla(acd,ref,x){
	var SCREEN = "200";
	var OPECOD = "0004";
	var E01ROCREF = ref;
	page = "<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSERA0050?SCREEN="+SCREEN+"&OPECOD="+OPECOD+"&REF="+E01ROCREF+"&PURPOSE=APPROVE";
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

<FORM Method="post" Action="<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSERA0081" >
<INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="2">
<INPUT TYPE=HIDDEN NAME="action" VALUE="A">
<INPUT TYPE=HIDDEN NAME="reason" VALUE="">
<INPUT TYPE=HIDDEN NAME="totalRow" VALUE="0">       
 <h3 align="center"> Proceso Confecamaras </h3>
<hr size="4">
  
  
<TABLE class="tbenter">
  	<TR> 
  	
  	  <TD class=TDBKG width="25%"> 
        <div align="center"><a name="linkApproval" href="javascript:goAction('A')"><b>Enviar/No Enviar</b></a></div>
      </TD>
      <TD class=TDBKG width="25%"> 
        <div align="center"><a href="javascript:goAction('H')"><b>Genera Preliminar</b></a></div>
      </TD>
      <TD class=TDBKG width="25%"> 
        <div align="center"><a href="javascript:goAction('G')"><b>Genera Definitivo</b></a></div>
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
      <TH ALIGN=CENTER nowrap>Referencia</TH>
      <TH ALIGN=CENTER nowrap>Nombre Cliente</TH>
      <TH ALIGN=CENTER nowrap>MDA</TH>
      <TH ALIGN=CENTER nowrap>Monto </TH>
      <TH ALIGN=CENTER nowrap>Estatus Confecamara</TH>
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
