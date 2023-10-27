<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<%@ page import="datapro.eibs.master.Util,datapro.eibs.beans.ESD208501Message" %>
<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@page import="com.datapro.constants.EibsFields"%>

<HTML>
<HEAD>
<TITLE> Lista de Cuentas a Aprobar </TITLE>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "searchParameters" class= "datapro.eibs.beans.ESD208501Message"  scope="session" />
<jsp:useBean id= "ESD2085List" class= "datapro.eibs.beans.JBObjList"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />


<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>


<script type="text/javascript">
  	var reason = '';
  	function goAction(op,row) {
  		
  		if(row == undefined){
  			row = getElement("CURROW").value;
  		}
      	getElement("reason").value = reason;
  		if(!isNaN(row) && typeof(row) != "undefined"){
	    	if (op == "R"){
	    		if (confirm("Desea rechazar este registro seleccionado?")) {
					getElement("opt").value = 2;
					document.forms[0].submit();		
	    		}
	  		} else if (op == "A") {
	  			if (confirm("Desea aprobar este registro seleccionado?")) {
					getElement("opt").value = 1;
					document.forms[0].submit();		
	    		}
			} else if (op == "I") {
				clickElement("CURROW", row);
				var url = "<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSESD2085?SCREEN=300&CURROW=" + getElementChecked('CURROW').value;
				CenterWindow(url, 1000, 600, 2);
		 	}else if (op == 'Search'){
				getElement('SCREEN').value = 100; //Request Filtered List
	        	document.getElementsByTagName('body')[0].className = 'waiting';		        	
	        	document.forms[0].submit();				
		 	}
				
  		}else{
	 		if (op == 'Search'){
				getElement('SCREEN').value = 100; //Request Filtered List
        		document.getElementsByTagName('body')[0].className = 'waiting';		        	
        		document.forms[0].submit();				
	 		}else{  			
				alert("Debe seleccionar un registro.");
	 		}
	 	}
	 }
 	
	 function goDelete() {
		if( getElement("CURROW") != null){
			if(confirm("Desea eliminar este registro seleccionado?")){
				getElement("opt").value = 3;
				document.forms[0].submit();
			}
			
		}else{
			alert("Debe seleccionar un registro.");
		}
	}
	
 	function extraInfo(textfields, noField) {
 		var pos = 0;
 		var s = "";
 		for ( var i=0; i<noField ; i++ ) {
   			s += "<br>"+textfields[i]+" ";
  		}
 		return s;
 	}	
	
	 function updateSideInfo(textField) {
   		getElement("infobasica").rows[0].cells[1].innerHTML = extraInfo(textField, textField.length);   
	}	
	
</script>

</HEAD>

<BODY onload="MM_preloadImages('<%=request.getContextPath()%>/images/s/approve_over.gif')">

<% 
 	if ( !error.getERRNUM().equals("0")  ) {
     	out.println("<SCRIPT Language=\"Javascript\">");
     	out.println("       showErrors()");
     	out.println("</SCRIPT>");
 	} 
   	userPO.setHeader1("APPROVAL");
%>


<FORM Method="post" Action="<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSESD2085" >
<INPUT TYPE=HIDDEN NAME="SCREEN" id="SCREEN" VALUE="800">
<INPUT TYPE=HIDDEN NAME="totalRow" id="totalRow" VALUE="0">
<INPUT TYPE=HIDDEN NAME="reason" id="reason" VALUE="">

<input type=HIDDEN name="opt" id="opt" >

<h3 align="center">
		Aprobación de Entidades </h3>
<hr size="4">
  <TABLE class="tbenter" width="100%" align=center>
    <TR> 
      <TD class=TDBKG width="25%"> 
        <div align="center"><a id="linkApproval" name="linkApproval" href="javascript:goAction('A')"><b>Aprobar</b></a></div>
      </TD>
      <TD class=TDBKG width="25%"> 
        <div align="center"><a id="linkReject" name="linkReject" href="javascript:enterReason('R')"><b>Rechazar</b></a></div>
      </TD>
      <TD class=TDBKG width="25%"> 
        <div align="center"><a href="javascript:goDelete()"><b>Eliminar</b></a></div>
      </TD>
      <TD class=TDBKG width="25%"> 
        <div align="center"><a href="<%=request.getContextPath()%>/pages/background.jsp"><b>Salir</b></a></div>
      </TD>  
    </TR>
  </TABLE>
  
 <TABLE  id="mainTable" class="tableinfo" height="70%">
 <tr height="5%">
	<td NOWRAP valign="top" width="82%">
  		<TABLE id="headTable" width="100%" >
		  <TR id="trdark"> 
		    <TH ALIGN=CENTER rowspan="1" nowrap width="5%"></TH>
       		<TH ALIGN=CENTER NOWRAP rowspan="1" width="10%">Número</TH>
       		<TH ALIGN=CENTER NOWRAP rowspan="1" width="10%">Entidad</TH>
       		<TH ALIGN=CENTER NOWRAP rowspan="1" width="50%">Nombre</TH>
       		<TH ALIGN=CENTER NOWRAP rowspan="1" width="10%">Tipo</TH>
       		<TH ALIGN=CENTER NOWRAP rowspan="1" width="15%">Identificación</TH>
		  </TR>
 		 </TABLE>
  	</TD>
	<td NOWRAP valign="top" width="18%">
      <Table id="tbAddInfoH"  width="100%">
      <tr id="trdark">
          <TH ALIGN=CENTER rowspan="1"> Informaci&oacute;n B&aacute;sica </TH>
      </tr>
      </Table>
	</TD>
  </TR>	
  	<TR height="95%"> 
    	<TD NOWRAP valign="top" width="82%" >
			  	<div id="dataDiv1" style=" height:400px; overflow:auto;">  
			    <table id=dataTable cellspacing="0" cellpadding="1" border="0" width="100%" >
		<%
			if (ESD2085List.isEmpty()){
		%>		 
          <tr id="dataTable"> 
			<TD ALIGN="CENTER" nowrap width="35%" style="color:#d0122c" colspan="5">
				<br><br><br><br> <font size=3>No hay Registros para la Aparobaci&oacute;n con esta criteria. </font>
			</TD>          
		 </tr>
		 <%}else{ 			    
                ESD2085List.initRow();
				boolean firstTime = true;
				String chk = "";
        		while (ESD2085List.getNextRow()) {
					if (firstTime) {
						firstTime = false;
						chk = "checked";
					} else {
						chk = "";
					}
              	datapro.eibs.beans.ESD208501Message msgList = (datapro.eibs.beans.ESD208501Message) ESD2085List.getRecord();
		 %>

          <tr id="dataTable<%= ESD2085List.getCurrentRow() %>"> 
            <td NOWRAP  align=CENTER width="5%"><input type="radio" name="CURROW" value="<%= ESD2085List.getCurrentRow() %>"  <%=chk%> onClick="highlightRow('dataTable', <%= ESD2085List.getCurrentRow() %>);
            			 updateSideInfo(['<%= msgList.getE01CUERMK().trim() %>','<%= msgList.getE01CUEDIB().trim()%>', '<%= msgList.getE01CUEUSR().trim() %>']);" >   
            </td>
            <td NOWRAP  align=CENTER width="10%"><a href="javascript:goAction('I',<%= ESD2085List.getCurrentRow()%>);"><%= msgList.getE01CUENUM()%></a></td>
            <td NOWRAP  align=CENTER width="10%"><a href="javascript:goAction('I',<%= ESD2085List.getCurrentRow()%>);"><%= msgList.getE01DSCLGT()%></a></td>
            <td NOWRAP  align=LEFT width="50%"><a href="javascript:goAction('I',<%= ESD2085List.getCurrentRow()%>);"><%= msgList.getE01CUENME() %></a></td>
            <td NOWRAP  align=CENTER width="10%"><a href="javascript:goAction('I',<%= ESD2085List.getCurrentRow()%>);"><%= msgList.getE01CUETID() %></a></td>
            <td NOWRAP  align=LEFT width="15%"><a href="javascript:goAction('I',<%= ESD2085List.getCurrentRow()%>);"><%= msgList.getE01CUEIDN() %></a></td>
          </tr>
          <% }} %>   
          		</table>
   				</div>
   		</TD>
	   <td nowrap ALIGN="LEFT" valign="top" width="18%">
	     <Table id="infobasica" width="100%">
	      <tr id="trclear"> 
	         <!--<TD ALIGN="LEFT" nowrap></TD> THIS IS USED WHEN ONLY DOING WHEN INNER HTML CELL EDIT-->
	         <TD ALIGN="RIGHT" nowrap width="50%"><br><b>Comentario : <br>Lote : <br>Operador : </b><br></TD>
    	     <TD ALIGN="LEFT" nowrap width="50%" style="color:#d0122c"> </TD>
	      </tr>
	     </Table>
	  </td>
   </TR>
</table>

  <TABLE  class="tbenter" WIDTH="98%" ALIGN="center"  height="10%">
  	<TR>
  		 <TD WIDTH="50%" ALIGN=LEFT height="25">
  		 <% 
        	if ( ESD2085List.getShowPrev() ) {
      			int pos = ESD2085List.getFirstRec() - 51;
      		    out.print("<A HREF=\"" + request.getContextPath() + "/servlet/datapro.eibs.client.JSESD2085?SCREEN=100&FromRecord=" + pos + "\" ><img src=\""+request.getContextPath()+"/images/s/previous_records.gif\" border=0></A>");
        	}
  		 %>
  		 </TD>
  		 <TD WIDTH="50%" ALIGN=RIGHT height="25">
  		 <% 
        	if ( ESD2085List.getShowNext() ) {
      			int pos = ESD2085List.getLastRec();
      		    out.print("<A HREF=\"" + request.getContextPath() + "/servlet/datapro.eibs.client.JSESD2085?SCREEN=100&FromRecord=" + pos + "\" ><img src=\""+request.getContextPath()+"/images/s/next_records.gif\" border=0></A>");
        	}
  		 %>
  		 </TD>
  	</TR>
  </TABLE>

   				

<SCRIPT type="text/javascript">
	showChecked("CURROW");
</SCRIPT>
</FORM>

</BODY>
</HTML>
