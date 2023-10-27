<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<HTML>
<HEAD>
<TITLE>
Aprobacion
</TITLE>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Studio">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
</HEAD>

<jsp:useBean id= "EATM01002Help" class= "datapro.eibs.beans.JBList"  scope="session" />

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />

<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>

<% 
 if ( !error.getERRNUM().equals("0")  ) {
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
 }
%>

<script type="text/javascript">
 
  function goAction(op) {
	document.forms[0].action.value = op;
	document.forms[0].submit();
  }

  
 function goExit(){
    window.location.href="<%=request.getContextPath()%>/pages/background.jsp";
  }



function showInqWarn(fieldValue){
       document.forms[0].ACCNUM.value=fieldValue;
	var formLength= document.forms[0].elements.length;
   	for(n=0;n<formLength;n++)
     	{
      		var elementName= document.forms[0].elements[n].name;
      		var elementValue= document.forms[0].elements[n].value;
      		if(elementName == "ACCNUM" && elementValue== fieldValue) 
      			{
        		document.forms[0].elements[n].click();
        		break;
      		}
      	}
	page = "${pageContext.request.contextPath}/servlet/datapro.eibs.alerts.JSESD0000?ACCNUM=" + fieldValue;
	CenterWindow(page,420,300,2);    
}

function getParams(cust,card) {

    document.forms[0].E01ATMCUN.value = cust;
	document.forms[0].E01ATMPAN.value = card;
	
    
}

function showApprovalCard(cust,card) {

	page = "${pageContext.request.contextPath}/servlet/datapro.eibs.products.JSEATM010A?SCREEN=20&E01ATMCUN=" + cust + "&E01ATMPAN=" + card;
	CenterWindow(page,600,500,2);
 
}
</script>
<BODY onload="MM_preloadImages('<%=request.getContextPath()%>/images/s/approve_over.gif','<%=request.getContextPath()%>/images/s/reject_over.gif')">
<FORM Method="post" Action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEATM010A" >
<INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="2">
<INPUT TYPE=HIDDEN NAME="action" VALUE="A">
<INPUT TYPE=HIDDEN NAME="reason" VALUE="">
<INPUT TYPE=HIDDEN NAME="totalRow" VALUE="0">
<input type=HIDDEN name="E01ATMCUN" value="">
<input type=HIDDEN name="E01ATMPAN" value="">

  <h3 align="center"> Aprobación de Archivo de Tarjetas<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="approval_list.jsp,EDD1000"> 
  </h3>
   <hr size="4">

<%
	if (EATM01002Help.getNoResult() ) {
 %>
   		<TABLE class="tbenter" width=100% height=100%>
   		<TR>
      <TD> 
        <div align="center"> <b> No hay resultados que correspondan con su criterio 
          de b&uacute;squeda</b></div>
      </TD></TR>
   		</TABLE>
<%  
		}
	else {
%>	
   
   
  <TABLE class="tbenter" width="100%" align=center>   
    <TR>
      <TD class=TDBKG width="33%"> 
        <div align="center"><a href="javascript:goAction('A')" id="linkApproval"><b>Aprobar</b></a></div>
      </TD>
      <TD class=TDBKG width="33%"> 
        <div align="center"><a href="javascript:goAction('D')" id="linkDelete"><b>Eliminar</b></a></div>
      </TD>
      <TD class=TDBKG width="34%"> 
        <div align="center"><a href="javascript:goExit()" id="linkExit"><b>Salir</b></a></div>
      </TD>
    </TR>
  </TABLE>>
  
  <table  id=cfTable class="tableinfo">
    <tr > 
      <td NOWRAP valign="top" width="100%"> 
        <table id="headTable" width="100%">
          <tr id="trdark"> 
            <th align=CENTER nowrap width="10%">&nbsp;</th>
            <th align=CENTER nowrap width="20%"> 
              <div align="center">Tarjeta</div>
            </th>
            <th align=CENTER nowrap width="10%"> 
              <div align="center">Cliente</div>
            </th>
            <th align=CENTER nowrap width="30%">Nombre</th>
            <th align=CENTER nowrap width="20%">Fecha de <br>
              Apertura</th>
            <th align=CENTER nowrap width="10%"> 
              <div align="center">Vencimiento</div>
            </th>
          </tr>
          <%
                EATM01002Help.initRow();
				int k=1;
                while (EATM01002Help.getNextRow()) {
                 
                  out.println(EATM01002Help.getRecord());
                  k++;   
                }
              %>
        </table>
  </table>
<%
   }  
%>
</FORM>

<SCRIPT type="text/javascript">
    showChecked("CARDNUM");
 
</SCRIPT>

</BODY>
</HTML>
