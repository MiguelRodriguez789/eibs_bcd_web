<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<%@ page import ="datapro.eibs.master.Util" %>
<HTML>
<HEAD>
<TITLE>
Lista de Ordenes de Pago
</TITLE>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "appList" class= "datapro.eibs.beans.JBObjList"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />

<SCRIPT type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>


<script type="text/javascript">
  
	var reason = '';
  
  	function goAction(opt) {
  		var confirmMsg = "operacion";
  		
    	document.forms[0].action.value = opt;
    	document.forms[0].reason.value = reason;
    	
    	if(opt == "A") confirmMsg = "aprobar" ;
    	if(opt == "R") confirmMsg = "rechazar" ;
    	if(opt == "D") confirmMsg = "borrar" ;
    	
    	if (confirm("Esta seguro que desea " + confirmMsg +  " el registro seleccionado?")) {
    		document.forms[0].submit();
    	}
  	}
  
  	function showAddInfo(idxRow){
  		var tableInfo = document.getElementById("tbAddInfo");
     	tableInfo.rows[0].cells[1].style.color = "#d0122c";   
	   	tableInfo.rows[0].cells[1].innerHTML = getElement("TXTDATA"+idxRow).value;   
	   	tableInfo.rows[0].cells[1].style.color = "";
	   	var i = getElement("CURRENTROW").value;
	   	document.getElementById("dataTable").rows[i].className = "trnormal";    
	   	document.getElementById("dataTable").rows[idxRow].className = "trhighlight";
	   	getElement("CURRENTROW").value = idxRow;
  	}  
  	
  	function showOrden(bank, account, reference) {
  		var params = "&bank=" + bank;
  		params += "&account=" + account;
  		params += "&reference=" + reference;
  		var page = "<%=request.getContextPath()%>/servlet/datapro.eibs.transfer.JSEPR2010?SCREEN=3" + params;
  		CenterWindow(page, 640, 500, 2);
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


<h3 align="center">Aprobacion de Ordenes de Pago
<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="approval_list.jsp, EPR2010">
</h3>
<hr size="4">
<FORM Method="post" Action="<%=request.getContextPath()%>/servlet/datapro.eibs.transfer.JSEPR2010" >

<%
	if ( appList.getNoResult() ) {
%> 
  <TABLE class="tbenter" width=100% height=40%>
   	<TR>
      <TD> 
        <div align="center"> 
          <p>
            <b>No existen registros para su criterio de busqueda </b>
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
 <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="2">
 <INPUT TYPE=HIDDEN NAME="action" VALUE="A">
 <INPUT TYPE=HIDDEN NAME="reason" VALUE="">   
<INPUT TYPE=HIDDEN NAME="totalRow" VALUE="0">
 
 <TABLE class="tbenter" width="100%" align=center>
    <TR> 
      <TD class=TDBKG width="25%"> 
        <div align="center"><a href="javascript:goAction('A')">Aprobar</a> 
        </div>
      </TD>
      <TD class=TDBKG width="25%"> 
        <div align="center"><a href="javascript:enterReason('R')">Rechazar</a> 
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
 
 
<TABLE  id="mainTable" class="tableinfo" height="70%">
 <tr height="5%">
	<td NOWRAP valign="top" width="82%">
  		<TABLE id="headTable" width="100%" >
		  <TR id="trdark"> 
		    		<TH ALIGN=CENTER nowrap width="5%"></TH>
		    		<TH ALIGN=CENTER nowrap width="10%">No. Orden</TH>   
		    		<TH ALIGN=CENTER nowrap width="35%">Descripcion</TH>
		    		<TH ALIGN=CENTER nowrap width="20%">Monto</TH>
		    		<TH ALIGN=CENTER nowrap width="10%">Moneda</TH>
		    		<TH ALIGN=CENTER nowrap width="20%">Forma de Pago</TH>
		  </TR>
 		 </TABLE>
  	</TD>
	<td NOWRAP valign="top" width="18%">
      <Table id="tbAddInfoH"  width="100%">
      <tr id="trdark">
          <TH ALIGN=CENTER> Informaci&oacute;n B&aacute;sica </TH>
      </tr>
      </Table>
	</TD>
  </TR>	
  	<TR height="95%"> 
    	<TD NOWRAP valign="top" width="82%" >
			  	<div id="dataDiv1" style=" height:400px; overflow:auto;">  
			    <table id=dataTable cellspacing="0" cellpadding="1" border="0" width="100%" >
		<%
			if (appList.isEmpty()){
		%>		 
          <tr id="dataTable"> 
			<TD ALIGN="CENTER" nowrap width="35%" style="color:#d0122c" colspan="5">
				<br><br><br><br> <font size=3>No hay Cr&eacute;dil&iacute;neas para la Aparobaci&oacute;n con esta criteria. </font>
			</TD>          
		 </tr>
		 <%}else{ 			    
             appList.initRow(); 
             chk = "checked";               
             while (appList.getNextRow()) {
                datapro.eibs.beans.EPR201001Message bean = (datapro.eibs.beans.EPR201001Message) appList.getRecord();
  			%>   

          <tr id="dataTable<%= appList.getCurrentRow() %>"> 
				<TD NOWRAP width="5%"  ALIGN="CENTER"><input type="radio" name="ROW" value="<%= appList.getCurrentRow()%>" <%=chk%> onclick="showAddInfo(this.value);"></TD>
				<TD NOWRAP width="10%" ALIGN="CENTER"><a href="javascript:showOrden('<%=Util.formatCell(bean.getE01PRPDBK())%>', '<%=Util.formatCell(bean.getE01PRPDAC())%>', '<%=Util.formatCell(bean.getE01PRPNUM())%>')"><%=Util.formatCell(bean.getE01PRPNUM())%></a></TD>
				<TD NOWRAP width="35%" ALIGN="LEFT"><a href="javascript:showOrden('<%=Util.formatCell(bean.getE01PRPDBK())%>', '<%=Util.formatCell(bean.getE01PRPDAC())%>', '<%=Util.formatCell(bean.getE01PRPNUM())%>')"><%=Util.formatCell(bean.getE01PRPDSC())%></a></TD>
				<TD NOWRAP width="20%" ALIGN="RIGHT"><a href="javascript:showOrden('<%=Util.formatCell(bean.getE01PRPDBK())%>', '<%=Util.formatCell(bean.getE01PRPDAC())%>', '<%=Util.formatCell(bean.getE01PRPNUM())%>')"><%=Util.formatCCY(bean.getE01PRPAMT())%></a></TD>
				<TD NOWRAP width="10%" ALIGN="CENTER"><a href="javascript:showOrden('<%=Util.formatCell(bean.getE01PRPDBK())%>', '<%=Util.formatCell(bean.getE01PRPDAC())%>', '<%=Util.formatCell(bean.getE01PRPNUM())%>')"><%=Util.formatCell(bean.getE01PRPTCY())%></a></TD>
				<TD NOWRAP width="20%" ALIGN="CENTER"><a href="javascript:showOrden('<%=Util.formatCell(bean.getE01PRPDBK())%>', '<%=Util.formatCell(bean.getE01PRPDAC())%>', '<%=Util.formatCell(bean.getE01PRPNUM())%>')">
						<% if (bean.getE01PRPPVI().equals("1")) { 
							out.print("FED");
		                 } else if (bean.getE01PRPPVI().equals("2")) {
		                    out.print("SWIFT MT-100/MT-103");
		                 } else if (bean.getE01PRPPVI().equals("3")) {
		                    out.print("SWIFT MT-200/MT-202");
		                 } else if (bean.getE01PRPPVI().equals("4")) {
		                    out.print("CHIPS");
		                 } else if (bean.getE01PRPPVI().equals("5")) {
		                    out.print("ACH");
		                 } else if (bean.getE01PRPPVI().equals("6")) {
		                    out.print("CHEQUE OFICIAL");
		                 } else if (bean.getE01PRPPVI().equals("7")) {
		                 	out.print("INTERNA");
		                 } %></a>
						<INPUT TYPE=HIDDEN NAME="TXTDATA<%= appList.getCurrentRow()%>" 
						VALUE="<%= bean.getE01PRPDBK()%><br><%= bean.getE01PRPDAC()%><br>
							   <%= bean.getE01PRPORD()%><br><%= bean.getE01PRPBNF()%><br>
							   <%= bean.getE01PRPCAC()%><br><%= Util.formatDate(bean.getE01PRPOPD(),bean.getE01PRPOPM(),bean.getE01PRPOPY())%><br>
							   <%= bean.getE01PRPUSR()%>">						
				</TD>          </tr>
          <% }} %>   
          		</table>
   				</div>
   		</TD>
	   <td nowrap ALIGN="LEFT" valign="top" width="18%">
	     <Table id="tbAddInfo" width="100%">
	      <tr id="trclear"> 
	         <!--<TD ALIGN="LEFT" nowrap></TD> THIS IS USED WHEN ONLY DOING WHEN INNER HTML CELL EDIT-->
      	   <TD ALIGN="RIGHT" valign="middle" nowrap><b>Banco Debito : <br>Cuenta Debito : <br>Aplicante : <br>Beneficiario : <br>Cuenta Credito : <br>Fecha Operacion : <br>Operador : </b></TD>
       	  <TD ALIGN="LEFT" valign="middle" nowrap class="tdaddinfo"></TD>
	      </tr>
	     </Table>
	  </td>
   </TR>
 </TABLE>
<SCRIPT type="text/javascript">
	document.forms[0].totalRow.value="<%=appList.size()%>";
  	showChecked("ROW");  
</SCRIPT>

<%   		
	} 
 %>
</FORM>

</BODY>
</HTML>
