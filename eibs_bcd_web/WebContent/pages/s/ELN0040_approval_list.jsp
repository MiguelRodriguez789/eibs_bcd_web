<HTML>
<HEAD>
<TITLE>
Lista de Lineas de Crédito a Aprobar
</TITLE>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
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
      	if(elementName == "ACCNUM") 
      	{
        		ok = true;
        		break;
      	}
      }
	  if ( ok ) {
          document.forms[0].submit();
      }
     else {
			alert("Seleccione una cuenta antes de realizar esta operación");	   
      }

  } 
  function goExit(){
   window.location.href="<%=request.getContextPath()%>/pages/background.jsp";

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

<BODY onload="MM_preloadImages('<%=request.getContextPath()%>/images/s/approve_over.gif','<%=request.getContextPath()%>/images/s/delete_over.gif','<%=request.getContextPath()%>/images/s/reject_over.gif')">

<FORM Method="post" Action="<%=request.getContextPath()%>/servlet/datapro.eibs.credit.JSELN0040">
<INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="2">
<INPUT TYPE=HIDDEN NAME="action" VALUE="A">
<INPUT TYPE=HIDDEN NAME="reason" VALUE="">
<INPUT TYPE=HIDDEN NAME="totalRow" VALUE="0">       
 
 <h3 align="center"> Aprobación de Lineas de Crédito</h3>
<hr size="4">

<TABLE class="tbenter" width="100%" align=center>   
    <TR>
      <TD class=TDBKG width="25%"> 
        <div align="center"><a href="javascript:goAction('A')" id="linkApproval"><b>Aprobar</b></a></div>
      </TD>
    <TD class=TDBKG width="25%"> 
        <div align="center"><a href="javascript:goAction('D')" id="linkDelete"><b>Eliminar</b></a></div>
      </TD>
      <TD class=TDBKG width="25%"> 
        <div align="center"><a href="javascript:enterReason('R')" id="linkReject"><b>Rechazar</b></a></div>
      </TD>
      <TD class=TDBKG width="25%"> 
        <div align="center"><a href="javascript:goExit()" id="linkExit"><b>Salir</b></a></div>
      </TD>
    </TR>
  </TABLE>  
   
  <TABLE  id="mainTable" class="tableinfo" ALIGN=CENTER >
 <TR> 
    <TD NOWRAP>
  <TABLE id="headTable" style="width: 100%">
  <TR id="trdark"> 
      <TH ALIGN=CENTER rowspan="2" nowrap width="5%"></TH>
      <TH ALIGN=CENTER colspan="2" nowrap width="30%">N&uacute;mero de</TH>
      <TH ALIGN=CENTER rowspan="2" nowrap width="30%">Nombre Cliente</TH>
      <TH ALIGN=CENTER rowspan="2" nowrap width="25%">Comentario</TH>
      <TH ALIGN=CENTER rowspan="2" nowrap width="10%">Importe<br>
        Aprobado</TH>
    </TR>
    <TR id="trdark">  
      <TH ALIGN=CENTER nowrap width="15%">Cliente</TH>
      <TH ALIGN=CENTER nowrap width="15%">L&iacute;nea</TH>
    </TR>
    </TABLE>
  
   <div id="dataDiv1" class="scbarcolor" style="padding:0" >
    <table id="dataTable" style="width: 100%">
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
  document.forms[0].totalRow.value="<%= k %>";
  
  function resizeDoc() {
    divResize();
  	adjustDifTables(getElement('headTable'), getElement('dataTable'), getElement('dataDiv1'), 1, 1); 
  }
  
  resizeDoc();
  window.onresize=resizeDoc;
     
</SCRIPT>
</FORM>

</BODY>
</HTML>
