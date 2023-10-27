<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
<HEAD>
<TITLE>
Lista de Documentos o Giros
</TITLE>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">


<jsp:useBean id= "docList" class= "datapro.eibs.beans.JBListRec"  scope="session" />
<jsp:useBean id= "accList" class= "datapro.eibs.beans.JBListRec"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"   scope="session"/>
<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session"/>

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript">
 var reason = "";

 function goAction(op) {    
     document.getElementById("action").value = op;
     document.getElementById("reason").value = reason;
     document.forms[0].submit();
  }  
  
 function goExit(){
    window.location.href="<%=request.getContextPath()%>/pages/background.jsp";
  }

 function showAccInfo(idxRow){
   var actvTb = document.getElementById("activeTable").value;
   var dataT = getElement("dataTable"+idxRow);
   for ( var i=0; i<dataTable.rows.length; i++ ) {
       dataTable.rows[i].className="trnormal";
    }
   dataTable.rows[idxRow].className="trhighlight";
   getElement("dataTable"+actvTb).style.display="none";
   getElement("dataTable"+idxRow).style.display="";
   document.getElementById("activeTable").value="" + idxRow;
   if (dataT.rows.length >=5){
     dataDiv2.style.pixelHeight = 100;
   }
   adjustEquTables(getElement("headTable2"), dataT, getElement("dataDiv2"),1,false);
   showChecked("RECNUM"+idxRow);
   
  }   
 
 function showDocInfo(loan,id,doc,type,idxTable,idxRow){
  
  var dataT = getElement("dataTable"+idxTable);
  for ( var i=0; i<dataT.rows.length; i++ ) {
       dataT.rows[i].className="trnormal";
    }
  dataT.rows[idxRow].className="trhighlight";
  document.getElementById("Loan").value=loan;
  document.getElementById("ID").value=id;
  document.getElementById("Doc").value=doc;
  document.getElementById("Type").value=type;
}  

function showDetailApproval(radio,row,sts) {
	radioClick(radio,row);
    var loan=document.getElementById("Loan").value;
    var id=document.getElementById("ID").value;
    var doc=document.getElementById("Doc").value;
    var type=document.getElementById("Type").value;
    if (sts =="Q")
    {
		 page = "${pageContext.request.contextPath}/servlet/datapro.eibs.approval.JSEDL0828?SCREEN=5&Loan="+loan+"&ID="+id+"&Doc="+doc+"&Type="+type;
		 CenterWindow(page,630,460,2);
	}
	if (sts =="A")
	{
		page = "${pageContext.request.contextPath}/servlet/datapro.eibs.approval.JSEDL0828?SCREEN=7&Loan="+loan+"&ID="+id+"&Doc="+doc+"&Type="+type;
		CenterWindow(page,630,460,2);
	}
	if(sts =="P")
	{
		 page = "${pageContext.request.contextPath}/servlet/datapro.eibs.approval.JSEDL0828?SCREEN=4&Loan="+loan+"&ID="+id+"&Doc="+doc+"&Type="+type;
		 CenterWindow(page,530,460,2);
	 }
 
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
<h3 align="center">Aprobación de Documentos al Cobro</h3>
<hr size="4">
<FORM Method="post" Action="<%=request.getContextPath()%>/servlet/datapro.eibs.approval.JSEDL0828">
<INPUT TYPE=HIDDEN NAME="SCREEN" id="SCREEN" VALUE="3">
<INPUT TYPE=HIDDEN NAME="action" id="action" VALUE="A">
<INPUT TYPE=HIDDEN NAME="reason" id="reason" VALUE="">
<INPUT TYPE=HIDDEN NAME="activeTable" id="activeTable" VALUE="0">
<INPUT TYPE=HIDDEN NAME="Loan" id="Loan" VALUE="">
<INPUT TYPE=HIDDEN NAME="ID" id="ID" VALUE="">
<INPUT TYPE=HIDDEN NAME="Type" id="Type" VALUE="">
<INPUT TYPE=HIDDEN NAME="Doc" id="Doc" VALUE="">


 <TABLE  id="mainTable1" class="tableinfo">
 <TR > 
    <TD NOWRAP width="100%" >
    <TABLE id="headTable1" >
     <TR id="trdark"> 
      <TH ALIGN=CENTER NOWRAP></TH>
      <TH ALIGN=CENTER NOWRAP>Cuenta</TH>
	  <TH ALIGN=CENTER NOWRAP>Nombre Cliente</TH>
      <TH ALIGN=CENTER NOWRAP>Producto</TH>
	  <TH ALIGN=CENTER NOWRAP>Monto</TH>
	  <TH ALIGN=CENTER NOWRAP>Entrado Por</TH>
     </TR>
    </TABLE>
  
   <div id="dataDiv1" class="scbarcolor">
    <table id="dataTable">
     	<%
                accList.initRow();
				String chk = "checked";
                while (accList.getNextRow()) {
                    if (!accList.getFlag().equals("")) {	
  		%> 
     		<TR>      			
                <TD ALIGN=CENTER NOWRAP>				
                 <input type="radio" name="RECNUM" value="<%= accList.getCurrentRow() %>" <%=chk%> onClick="showAccInfo('<%= accList.getCurrentRow() %>')">
				</TD>
      			<TD ALIGN=CENTER NOWRAP><a href="javascript:radioClick('RECNUM',<%= accList.getCurrentRow() %>)"><%= accList.getRecord(0) %></a></TD>
      			<TD ALIGN=LEFT NOWRAP><a href="javascript:radioClick('RECNUM',<%= accList.getCurrentRow() %>)"><%= accList.getRecord(2) %></a></TD>      
      			<TD ALIGN=CENTER NOWRAP><DIV ><a href="javascript:radioClick('RECNUM',<%= accList.getCurrentRow() %>)"><%= accList.getRecord(3) %></a></DIV></TD>
      			<TD ALIGN=RIGHT NOWRAP><DIV ><a href="javascript:radioClick('RECNUM',<%= accList.getCurrentRow() %>)"><%= datapro.eibs.master.Util.fcolorCCY(accList.getRecord(4)) %></a></DIV></TD>
      			<TD ALIGN=CENTER NOWRAP><DIV ><a href="javascript:radioClick('RECNUM',<%= accList.getCurrentRow() %>)"><%= accList.getRecord(5) %></a></DIV></TD>
     		</TR>
  		<% 
				chk = "";
                    }
                }
  		%>
   </table>
   </div>
   </TD>
 </tr>
</table>

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
  
 <TABLE  id="mainTable" class="tableinfo">
 <TR > 
    <TD NOWRAP valign="top" width="100%" >
      
  <TABLE id="headTable2" >
  	<TR id="trdark"> 
      <TH ALIGN=CENTER NOWRAP></TH>
      <TH ALIGN=CENTER NOWRAP>No. Doc</TH>
	        <TH ALIGN=CENTER NOWRAP>Deudor</TH>
	  <TH ALIGN=CENTER NOWRAP>Valor</TH>
      <!--<TH ALIGN=CENTER NOWRAP>Tot. Pagado</TH>-->
      <TH ALIGN=CENTER NOWRAP>Status</TH>
    </TR>
   </TABLE>
  
   <div id="dataDiv2" class="scbarcolor">
    <%
                accList.initRow();
				docList.initRow();
                int j=0;
                while (accList.getNextRow()) {
    %>                
    <table id="dataTable<%=j%>" style="display:none;">
    <%
  
                int k=0;
    			chk="checked";
                while (docList.getNextRow()) {
                    if (docList.getFlag().equals(accList.getFlag())) {
                     %> 
     		<TR> 
      			
              <TD ALIGN=Left NOWRAP> 
                <input type="radio" name="RECNUM<%=j%>" value="<%= docList.getCurrentRow() %>" <%=chk%> onClick="showDocInfo('<%= docList.getRecord(7)%>','<%= docList.getRecord(1)%>','<%= docList.getRecord(0)%>','<%= docList.getRecord(6)%>','<%=j%>',<%=k%>)"> 
			  </TD>
      			<TD ALIGN=CENTER NOWRAP><div ><a href="javascript:showDetailApproval('RECNUM<%=j%>',<%= k %>,'<%= docList.getRecord(8) %>')"><%= docList.getRecord(0) %></a></DIV></TD>
      			<TD ALIGN=LEFT NOWRAP><div ><a href="javascript:showDetailApproval('RECNUM<%=j%>',<%= k %>,'<%= docList.getRecord(8) %>')"><%= docList.getRecord(2) %></a></DIV></TD>      
      			<TD ALIGN=RIGHT NOWRAP><div ><a href="javascript:showDetailApproval('RECNUM<%=j%>',<%= k %>,'<%= docList.getRecord(8) %>')"><%= datapro.eibs.master.Util.fcolorCCY(docList.getRecord(3)) %></a></DIV></TD>
      			<!--<TD ALIGN=RIGHT NOWRAP><div ><a href="javascript:showDetailApproval('RECNUM<%=j%>',<%= k %>)"><%= datapro.eibs.master.Util.fcolorCCY(docList.getRecord(4)) %></a></DIV></TD>-->
      			<TD ALIGN=CENTER NOWRAP><div ><a href="javascript:showDetailApproval('RECNUM<%=j%>',<%= k %>,'<%= docList.getRecord(8) %>')"><%= docList.getRecord(5) %></a></DIV></TD>
     		</TR>
  		<% 
                    k++;
					chk="";
                    }
                   else{
					 docList.setCurrentRow(docList.getCurrentRow()-1);
                     break;
					}        
                }
    	%> 
   </table>
   <%  
               j++;      
            }
    %> 
   </div>
   </TD>
   
  </TR>	
</TABLE>

<SCRIPT type="text/javascript">
     if (dataTable.rows.length >=5){
	   dataDiv1.style.height="120"; 
   	   dataDiv1.style.overflowY="scroll";
   	 }
     function resizeDoc() {
      var actvTb = document.getElementById("activeTable").value;
      var dataT = getElement("dataTable"+actvTb);
       adjustEquTables(hetElement("headTable1"), getElement("dataTable"), getElement("dataDiv1"),1,false);
       adjustEquTables(getElement("headTable2"), dataT, dataDiv2,1,false);
      }
	 showChecked("RECNUM");
     resizeDoc();
     window.onresize=resizeDoc;
     
</SCRIPT>

</FORM>

</BODY>
</HTML>
