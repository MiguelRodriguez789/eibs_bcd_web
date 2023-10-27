<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
<HEAD>
<TITLE>
Customer List
</TITLE>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">


<jsp:useBean id= "appList" class= "datapro.eibs.beans.JBList"   scope="session"/>

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"   scope="session"/>

<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session"/>

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
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
     if (op == 'Z') {op2 = 'A';} else {op2 = op;}
     

	
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
            if (accWarn.trim() != "" && op != 'D') {
   		 	page = "${pageContext.request.contextPath}/servlet/datapro.eibs.alerts.JSESD0000?ACCNUM=" + accWarn+"&APP=1";
 	        CenterWindow(page,420,300,2);
            } else {
              document.forms[0].submit();
            }
       	}
      }
      else {
 			alert("Select account before this operation");	   
      }

 }
  
 function goExit(){
    window.location.href="<%=request.getContextPath()%>/pages/background.jsp";
  }

 function extraInfo(textfields,noField) {
 var pos=0
 var s= textfields;
 for ( var i=0; i<noField ; i++ ) {
   pos=textfields.indexOf("<br>",pos+1);
  }
 s=textfields.substring(0,pos);
 return(s);
 }
 
 function showAddInfo(idxRow,cus){
   document.forms[0].E02DLICUS.value = cus;
   tbAddInfo.rows[0].cells[1].style.color="white";
   tbAddInfo.rows[0].cells[1].innerHTML=getElement("TXTDATA"+idxRow).value;

   if (getElement("STSOFAC"+idxRow).value == "3") {
      var formLength = document.forms[0].elements.length;
      for (var n=0;n<formLength;n++){
        var elemt = document.forms[0].elements[n];
        if ( elemt.checked ) {
              accOfac=elemt.value;
              break;
        }
      }      
   } else {
      accOfac = "";
   }

 if (getElement("STSWARN"+idxRow).value == "A") {
      var formLength = document.forms[0].elements.length;
      for (var n=0;n<formLength;n++){
        var elemt = document.forms[0].elements[n];
        if ( elemt.checked ) {
              accWarn=elemt.value;
              break;
        }
      }      
   } else {
      accWarn = "";
   }

   if (tbAddInfo.rows[0].cells[1].filters[0])	
   tbAddInfo.rows[0].cells[1].filters[0].apply();
   tbAddInfo.rows[0].cells[1].style.color="";
   if (tbAddInfo.rows[0].cells[1].filters[0])
   tbAddInfo.rows[0].cells[1].filters[0].Play();
   for ( var i=0; i<dataTable.rows.length; i++ ) {
       dataTable.rows[i].className="trnormal";
    }
   dataTable.rows[idxRow].className="trhighlight";
   adjustDifTables('headTable', 'dataTable', 'dataDiv1',2,1);
  }   

function showInqOFAC(fieldValue){
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
	page = "${pageContext.request.contextPath}/servlet/datapro.eibs.helps.JSEWD0092?shrAcc=" + fieldValue + "&shrCategory=ALL" + "&FromRecord=0&shrAction=INQ";
	CenterWindow(page,600,500,2);    
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

<BODY onload="MM_preloadImages('<%=request.getContextPath()%>/images/e/approve_over.gif','<%=request.getContextPath()%>/images/e/reject_over.gif')">

<FORM Method="post" Action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDL0109">
<INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="2">
<INPUT TYPE=HIDDEN NAME="E02DLICUS" VALUE="">
<INPUT TYPE=HIDDEN NAME="action" VALUE="A">
<INPUT TYPE=HIDDEN NAME="reason" VALUE="">
 <INPUT TYPE=HIDDEN NAME="totalRow" VALUE="0">
  <input type=HIDDEN name="appCode" value="<%= userPO.getHeader10()%>">
  <h3 align="center"> Aprobaci�n de Papeles Comerciales</h3>
<hr size="4">

  <TABLE class="tbenter">
    <TR> 
      <TD class=TDBKG> 
        <div align="center"><a name="linkApproval" href="javascript:goAction('A')"><b>Aprobar</b></a></div>
      </TD>
      <TD class=TDBKG> 
        <div align="center"><a name="linkReject" href="javascript:enterReason('R')"><b>Rechazar</b></a></div>
      </TD>
      <TD class=TDBKG> 
        <div align="center"><a href="javascript:goAction('D')"><b>Eliminar</b></a></div>
      </TD>
      <TD class=TDBKG> 
        <div align="center"><a href="<%=request.getContextPath()%>/pages/background.jsp"><b>Salir</b></a></div>
      </TD>  
    </TR>
  </TABLE>
  
 <TABLE  id="mainTable" class="tableinfo">
 <TR > 
    <TD NOWRAP valign="top" width="100%" >
  <TABLE id="headTable" >
  <TR id="trdark"> 
      <TH ALIGN=CENTER rowspan="2" NOWRAP> </TH>
      <TH ALIGN=CENTER rowspan="2" NOWRAP>Cuenta</TH>
      <TH ALIGN=CENTER colspan="2" NOWRAP>Cliente</TH>
      <TH ALIGN=CENTER rowspan="2" NOWRAP>Producto<br>C�digo</TH>
    </TR>
    <TR id="trdark"> 
      <TH ALIGN=CENTER NOWRAP>N�mero</TH>
      <TH ALIGN=CENTER NOWRAP>Nombre</TH>
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
    %> 
   </table>
   </div>
   </TD>
   <TD nowrap ALIGN="RIGHT" valign="top">
      <Table id="tbAddInfoH"   width="100%" >
        <tr id="trdark">
         <TH ALIGN=CENTER nowrap >Informaci�n B�sica</TH>
        </tr>
      </Table>

     <Table id="tbAddInfo"  >
      <tr id="trclear" >
         <TD  ALIGN="RIGHT"  nowrap >
         <b>Banco : <br>Agencia : <br>
         Usuario : <br>C�digo Comercia  :  
         </b>
         </TD>
         <TD ALIGN="LEFT"  nowrap class="tdaddinfo"></TD>
      </tr>
     </Table>
  </TD>
  </TR>	
</TABLE>

<SCRIPT type="text/javascript">
     document.forms[0].totalRow.value="<%= k %>";
     function resizeDoc() {
       divResize(true);
     adjustDifTables('headTable', 'dataTable', 'dataDiv1',2,1);
      }
     showChecked("ACCNUM");
     resizeDoc();
     tbAddInfoH.rows[0].cells[0].height = headTable.rows[0].cells[0].clientHeight;
     window.onresize=resizeDoc;
     
</SCRIPT>

</FORM>

</BODY>
</HTML>
