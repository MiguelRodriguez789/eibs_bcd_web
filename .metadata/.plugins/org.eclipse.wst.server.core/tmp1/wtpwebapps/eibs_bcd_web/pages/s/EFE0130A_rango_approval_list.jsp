<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
<HEAD>
<TITLE>
Lista de Rango de Tolerancia para Aprobar
</TITLE>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "appList" class= "datapro.eibs.beans.JBList"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>

<script src="<%=request.getContextPath()%>/pages/s/javascripts/eIBSTreasury.jsp"> </SCRIPT>
<script src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
 

<script type="text/javascript">
  var reason = '';
  var accOfac = '';
  var accWarn = '';
 
  
  function goApproval() {
	document.forms[0].action.value = "A";
	document.forms[0].submit();
  }
  
   function goAction(op) {
     var op2 = '';
     if (op == 'Z') 
     	{op2 = 'A';} 
     else 
     	{op2 = op;}
     

	 document.forms[0].SCREEN.value = 3;
     document.forms[0].action.value = op2;
     document.forms[0].reason.value = reason;
     
     var formLength= document.forms[0].elements.length;
     var ok = false;
     for(var n=0;n<formLength;n++)
     {
      	var elementName= document.forms[0].elements[n].name;
      	if(elementName == "ACCNUM") 
      	{
        		ok = true;
        		break;
      	}
      }
      if ( ok ) {
          if (accOfac.trim() != "" && op != 'Z' && op != 'D') {

             page = "${pageContext.request.contextPath}/servlet/datapro.eibs.helps.JSEWD0092?shrAcc=" + accOfac + "&shrCategory=ALL" + "&FromRecord=0&shrAction=APV";
	
	     CenterWindow(page,600,500,2);

          } else {
				document.forms[0].submit();
          }
      }
      else {
 	alert("Select customer before this operation");	   
      }

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

<BODY onload="MM_preloadImages('<%=request.getContextPath()%>/images/s/approve_over.gif','<%=request.getContextPath()%>/images/s/reject_over.gif')">
 
<h3 align="center">Aprobacion Rangos de Tolerancia</h3>
<hr size="4">
  
  
<FORM Method="post" Action="<%=request.getContextPath()%>/servlet/datapro.eibs.forex.JSEFE0130A">
<INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="3">
<INPUT TYPE=HIDDEN NAME="action" VALUE="A">
<INPUT TYPE=HIDDEN NAME="reason" VALUE="">
<INPUT TYPE=HIDDEN NAME="totalRow" VALUE="0">
<INPUT TYPE=HIDDEN NAME="CHECKENC" VALUE=" ">
 <TABLE class="tbenter" width="100%" align=center>   
    <TR>
      <TD class=TDBKG width="50%"> 
        <div align="center"><a href="javascript:goAction('A')" id="linkApproval"><b>Aprobar</b></a></div>
      </TD>
      <TD class=TDBKG width="50%"> 
        <div align="center"><a href="javascript:goExit()" id="linkExit"><b>Salir</b></a></div>
      </TD>
    </TR>
  </TABLE>
  
 <TABLE  id="mainTable" class="tableinfo">
 <TR> 
   <TD NOWRAP valign="top" width="100%"> 
    <table id="headTable" style="width: 100%">
    <TR id="trdark">  
      	 
      	<th align=CENTER nowrap >&nbsp;</th>
        <th align=CENTER nowrap > 
              <div align="center">Nro. de <br> Trade Ticket</div>
        </th>
        <th align=CENTER nowrap >Cliente</th>
        <th align=CENTER nowrap >
              <div align="center">Producto</div>
        </th>
        <th align=CENTER nowrap > 
          <div align="center">Moneda</div>
        </th>
        <th align=CENTER nowrap >Monto</th>
        <th align=CENTER nowrap > 
              <div align="center">Usuario</div>
        </th>  
    </TR>
   </TABLE>
     
  
   <div id="dataDiv1" class="scbarcolor" >
    <table id="dataTable" >
    <%
                appList.initRow();
                int k=1;
                while (appList.getNextRow()) {
                    if (appList.getFlag().equals("")) {
                    		out.println(appList.getRecord());
                    k++;
                    }        
                }
                  if ( k > 10 ) {
      %>
                    		 <SCRIPT type="text/javascript">
                    		    document.forms[0].totalRow.value="<%= k %>";
                    		    //initTime();
   							</SCRIPT>	 
  			<%	 
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
            	adjustEquTables(getElement('headTable'),getElement('dataTable'), getElement('dataDiv1'),1,false);
  }
  showChecked("ACCNUM");
  resizeDoc();
  window.onresize=resizeDoc;
     
</SCRIPT>

</FORM>

</BODY>
</HTML>
