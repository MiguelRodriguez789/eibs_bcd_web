<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
<HEAD>
<TITLE>Transacciones Financieras</TITLE>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">


<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"   scope="session"/>
<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session"/>
<jsp:useBean id= "lista" class= "datapro.eibs.beans.JBSortList"   scope="session"/>
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />

<%@ page import="datapro.eibs.beans.EPR012001Message"%>
<%@ page import="datapro.eibs.master.Util"%>

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>

</HEAD>

<% 
 if ( !error.getERRNUM().equals("0")  ) {
     error.setERRNUM("0");
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
 }
%>

<BODY onload="MM_preloadImages('<%=request.getContextPath()%>/images/s/maintenance_over.gif')">
<h3 align="center">Transacciones Financieras</h3>
<hr size="4">

<FORM Method="post" Action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEPR1080">
<INPUT TYPE=HIDDEN NAME="SCREEN" ID="SCREEN" VALUE="3">
<INPUT TYPE=HIDDEN NAME="REFNUM" ID="REFNUM" VALUE="">
<INPUT TYPE=HIDDEN NAME="totalRow" ID="totalRow" VALUE="0">
<INPUT TYPE=HIDDEN NAME="FIELD" ID="FIELD" VALUE=""> 
<INPUT TYPE=HIDDEN NAME="TYP" ID="TYP" VALUE="<%= request.getParameter("TYP")%>"> 
<INPUT TYPE=HIDDEN NAME="DAY" ID="DAY" VALUE=""> 
<INPUT TYPE=HIDDEN NAME="MONTH" ID="MONTH" VALUE=""> 
<INPUT TYPE=HIDDEN NAME="YEAR" ID="YEAR" VALUE=""> 

	  <TABLE class="tbenter">
	    <TR>
	      <TD class="TDBKG" width="50%"> 
	        <div align="center"><a href="javascript:goAction(document.forms[0].REFNUM.value)" id="linkMaintenance"><b>Modificar</b></a></div>
	      </TD>
	      <TD class="TDBKG" width="50%"> 
	        <div align="center"><a href="javascript:checkClose()" id="linkExit"><b>Salir</b></a></div>
	      </TD>
	    </TR>
	  </TABLE>
	  
 <TABLE  id="mainTable" class="tableinfo">
 	<TR height="5%"> 
   		<TD NOWRAP valign="top" width="80%"> 
    		<TABLE id="headTable" width="95%">
    			<TR id="trdark">  
	      		<TH ALIGN="center" NOWRAP width="2%"></TH>
	            <TH ALIGN="center" NOWRAP width="10%"><a href="javascript:ordena('E01PRINUM')">Referencia</a>
	            	<table border="0">
    					<tr id="trdark">
    						<td nowrap align="center">
			    				<input type="text" size="6" name="ACCNUM1" id="ACCNUM1"  >
			    			</td>
			    			<td>
			    				<a href="javascript:lookAcc()"><img src="<%=request.getContextPath()%>/images/1b.gif" title=". . ." align="bottom" border="0"></a>
			    			</td>
						</tr>
    				</table>
	            </TH>
	            <TH ALIGN="center" NOWRAP width="10%"><a href="javascript:ordena('E01PRITHF')">Referencia<BR>Original</a></TH>             
	            <TH ALIGN="center" NOWRAP width="10%"><a href="javascript:ordena('E01PRICCY')">Mda</a></TH>
	            <TH ALIGN="center" NOWRAP width="10%"><a href="javascript:ordena('E01PRIAMT')">Monto</a></TH>
	            <th align="center" NOWRAP width="15%"><a href="javascript:ordena('E01PRIFMT')">Tipo de Mensaje</a></th>
	            <th align="center" NOWRAP width="8%"><a href="javascript:ordena('E01PRIPTY')">Pri</a></th>
	            <th align="center" NOWRAP width="25%"><a href="javascript:ordena('E01REMARK')">Estado</a></th>  
				<th align="center" NOWRAP width="10%"><a href="javascript:ordena('E01PRIDPT')">Area <BR>Responsable</a></th>                        
   			</TR>
       		</TABLE>
  		</TD>
  		<TD nowrap ALIGN="RIGHT" valign="top" width="20%">
	        <Table id="tbAddInfoH"  width="100%" >
	        <tr id="trdark">
	            <TH ALIGN=CENTER nowrap > Informaci&oacute;n B&aacute;sica</TH>
	        </tr>
	      	</Table>
  		</TD>
  	</TR>	
  	<TR> 
    	<TD NOWRAP valign="top" width="80%">
  
   <div id="dataDiv1" style="overflow:auto;">  
   <table id="dataTable" cellspacing="0" cellpadding="1" border="0" width="60%" >
	
		<%int indexRow=0;
		  int i=0;
		  String msgImg = "";
		  for (indexRow = lista.getBaseIdx(); indexRow < lista.getSize() && indexRow < lista.getBaseIdx() + lista.getDisplaySize(); indexRow++) { 
			EPR012001Message msgList = (EPR012001Message)lista.getData(indexRow);
			
			String chk = "";
			if (indexRow == 0) chk = "checked";	else chk = "";
			
			if (!msgList.getE01MSGTXT().trim().equals("")) {
				msgImg= "<IMG border=\"0\" src=\""+request.getContextPath()+"/images/ico1.gif\" title=\"TRX con observación\" onClick=\"viewMessage('"+ indexRow + "')\">";
			}else{
				msgImg= "";
			}%>
				<TR>
				<TD NOWRAP width="2%">
					<INPUT TYPE="HIDDEN" NAME="TXTMESSAGE<%=indexRow%>" VALUE="<%= msgList.getE01MSGTXT()%>">
					<input type="radio" name="PRINUM" id="PRINUM" value="<%= msgList.getE01PRINUM()%>" <%=chk%> class="highlight"  onclick="showAddInfo('<%= msgList.getE01PRINUM()%>',<%=i%>)">
				</TD>
				<TD NOWRAP ALIGN="CENTER" width="10%"><A HREF="javascript:goAction('<%=msgList.getE01PRINUM()%>')"><%= Util.formatCell(msgList.getE01PRINUM()) %></A><%= msgImg %></TD>
				<TD NOWRAP ALIGN="CENTER" width="10%"><A HREF="javascript:goAction('<%=msgList.getE01PRINUM()%>')"><%= Util.formatCell(msgList.getE01PRITHF()) %></A></TD>
				<TD NOWRAP ALIGN="CENTER" width="10%"><A HREF="javascript:goAction('<%=msgList.getE01PRINUM()%>')"><%= Util.formatCell(msgList.getE01PRICCY()) %></A></TD>
				<TD NOWRAP ALIGN="RIGHT" width="10%"><A HREF="javascript:goAction('<%=msgList.getE01PRINUM()%>')"> <%=Util.fcolorCCY(msgList.getE01PRIAMT())   %></A></TD>
				<TD NOWRAP ALIGN="CENTER" width="15%"><A HREF="javascript:goAction('<%=msgList.getE01PRINUM()%>')"><%= Util.formatCell(msgList.getE01PRIFMT()) %></A></TD>
				<TD NOWRAP ALIGN="CENTER" width="10%"><A HREF="javascript:goAction('<%=msgList.getE01PRINUM()%>')"><%= Util.formatCell(msgList.getE01PRIPTY()) %></A></TD>
				<TD NOWRAP ALIGN="LEFT" width="25%"><A HREF="javascript:goAction('<%= msgList.getE01PRINUM()%>')"><%= Util.formatCell(msgList.getE01REMARK())  %></A></TD>
				<TD NOWRAP ALIGN="CENTER" width="10%"><A HREF="javascript:goAction('<%=msgList.getE01PRINUM()%>')"><%= Util.formatCell(msgList.getE01PRIDPT()) %></A>
				<INPUT TYPE=HIDDEN NAME="TXTDATA<%=i%>" VALUE=" <%=Util.formatCustomDate(currUser.getE01DTF(), msgList.getE01PRIVDM(),msgList.getE01PRIVDD(),msgList.getE01PRIVDY())%>
				<br><%=Util.formatCell(msgList.getE01PRIOBN())%>/<%=Util.formatCell(msgList.getE01PRIOBR())%><br><%=Util.formatCell(msgList.getE01BENFIC()) %>
				<br><%=Util.formatCell(msgList.getE01PRIRID())%><br><%=Util.formatCell(msgList.getE01PRICNL())%><br><%=Util.formatCell(msgList.getE01PRIUSR())%>"></TD>
				</TR>
	
	
		<% i++;
		}%>
   </table>
   </div>
   </TD>
      <TD nowrap ALIGN="RIGHT" valign="top" width="20%"> 
         <%int row = 0; %>

     <Table id="tbAddInfo" >
      <tr id="trclear">
            <TD  ALIGN="RIGHT"  nowrap >
	              <b> Fecha de Transferencia : <br>
	              Banco/Agencia : <br>
	              Beneficiario : <br>
	              Receptor : <br>
	              Canal : <br>
	              Usuario : </b>
	             </td>
         <TD ALIGN="LEFT" nowrap class="tdaddinfo"></TD>
      </tr>
     </Table>
  </TD>
  </TR>	
</TABLE>
	<TABLE class="tbenter" WIDTH="100%" >
			<TR>
				<TD ALIGN=LEFT>
					<%if (lista.showPrev()) { %>
						<A  HREF="javascript:navega(0)"><IMG border="0" src="<%=request.getContextPath()%>/images/s/previous_records.gif"></A>
					<%}%>  
				</TD>
				<TD ALIGN=RIGHT>     
					<%if (lista.showNext()){ %>
						<A HREF="javascript:navega(1)"><IMG border="0" src="<%=request.getContextPath()%>/images/s/next_records.gif"></A>
					<%}%>
				</TD>
			</TR>
	</TABLE>

<script type="text/javascript">

 	function goAction(refnum) {
    	var page = "${pageContext.request.contextPath}/servlet/datapro.eibs.products.JSEPR0000?SCREEN=3&REFNUM="+refnum;
	 	CenterWindow(page, 600, 500, 2);
  	}

 	function showAddInfo(refernum, idxRow) {
		var tbAddInfo = document.getElementById("tbAddInfo");
		//tbAddInfo.rows[0].cells[1].style.color = "white";
   		tbAddInfo.rows[0].cells[1].innerHTML = getElement("TXTDATA"+idxRow).value;
   
   		var dataTable = document.getElementById("dataTable");
   		for(var i=0; i<dataTable.rows.length; i++ ){
       		dataTable.rows[i].className="trnormal";
    	}
   		dataTable.rows[idxRow].className="trhighlight";
   		document.forms[0].REFNUM.value = refernum;
   		
		//adjustEquTables(getElement("headTable"), getElement("dataTable"), getElement("dataDiv1"), 1,false);
  	}   
  
	function viewMessage(idxRow) {
		var text = getElement("TXTMESSAGE"+idxRow).value;

		var page = "${pageContext.request.contextPath}/pages/s/MISC_message_viewer.jsp?MESSAGE=" + text;
		CenterWindow(page, 300, 200, 2);
	}

	function lookAcc() {
		document.getElementById("SCREEN").value = "1";
		document.forms[0].submit();
	}
  

	function navega(direccion) {
		document.getElementById("SCREEN").value = 500 + direccion;
		document.forms[0].submit();
	}

	function ordena(fieldname){
		document.getElementById("SCREEN").value = "502";
		document.getElementById("FIELD").value = fieldname;
		document.forms[0].submit();
	}
	
	function ordenaFecha(dd,mm,yy){
		document.getElementById("SCREEN").value = "506";
		document.getElementById("DAY").value = dd;
		document.getElementById("MONTH").value = mm;
		document.getElementById("YEAR").value = yy;
		document.forms[0].submit();
	}

    document.getElementById("totalRow").value="<%= lista.getSize() %>";
     
    function resizeDoc() {
    	divResize(true);
	   	adjustEquTables(document.getElementById("headTable"), document.getElementById("dataTable"), document.getElementById("dataDiv1"), 1, false);
    }
	 
	 radioClick("PRINUM", 0);
     //resizeDoc();
     document.getElementById("tbAddInfoH").rows[0].cells[0].height = document.getElementById("headTable").rows[0].cells[0].clientHeight;
     window.onresize = resizeDoc;
    
</SCRIPT>

</FORM>

</BODY>
</HTML>
