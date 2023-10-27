<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
<HEAD>
<TITLE>Customer Portfolio Inquiry</TITLE>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">


<jsp:useBean id= "EWD0300Help" class= "datapro.eibs.beans.JBList"   scope="session"/>
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"   scope="session"/>
<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session"/>

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript">


	function goAction(op) {
		document.forms[0].opt.value = op;
		document.forms[0].submit();
	}


	function getParams(code, customer, idxRow) {

    	document.forms[0].CODE.value = code;
    	document.forms[0].CUSTOMER.value = customer;
		showAddInfo(idxRow);
	
	}

  
 	function goExit(){
    	window.location.href="<%=request.getContextPath()%>/pages/background.jsp";
  	}

 	function extraInfo(textfields, noField) {
 		var pos = 0;
 		var s = textfields;
 		for ( var i=0; i<noField ; i++ ) {
   			pos = textfields.indexOf("<br>", pos+1);
  		}
 		s = textfields.substring(0,pos);
 		return(s);
 	}
 
 	function showAddInfo(idxRow){
   		document.getElementById("tbAddInfo").rows[0].cells[1].innerHTML = document.forms[0]["TXTDATA"+idxRow].value; 
   		for ( var i=0; i<document.getElementById("dataTable").rows.length; i++ ) {
       		document.getElementById("dataTable").rows[i].className = "trnormal";
    	}
   		document.getElementById("dataTable").rows[idxRow].className = "trhighlight";
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
<FORM name="form1" METHOD="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.helps.JSEWD0300" >
  <input type=HIDDEN name="SCREEN" value="2">
  <input type=HIDDEN name="opt" value="1">
  <input type=HIDDEN name="totalRow" value="0">
  <input type=HIDDEN name="CODE">
  <input type=HIDDEN name="CUSTOMER">
  <h3 align="center">Consulta de Portafolios de Clientes</h3>
<hr size="4">
  <p><%
	if ( EWD0300Help.getNoResult() ) {
 %></p>
  <p>&nbsp;</p>
  <p>&nbsp;</p>
  <p>&nbsp;</p>
  <p>&nbsp;</p>
  <p>&nbsp;</p>
  <table class="tbenter" width="100%" >
    <tr> 
      <td > 
        <div align="center"> 
          <p><b>No existen Portafolios para ese criterio de busquedas.</b></p>
        </div>
      </td>
    </tr>
  </table>
  <%  
		}
	else {
%> <% 
 if ( !error.getERRNUM().equals("0")  ) {
     error.setERRNUM("0");
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
     }

%>
<table class="tbenter" width=100% align=center>
    <tr> 
      <td class=TDBKG width="30%"> 
        <div align="center"><a href="javascript:goAction(4)"><b>Consulta</b></a></div>
      </td>
      <td class=TDBKG width="30%"> 
        <div align="center"><a href="<%=request.getContextPath()%>/pages/background.jsp"><b>Salir</b></a></div>
      </td>
    </tr>
  </table>
<br>
 <TABLE  id="mainTable" class="tableinfo" height="70%">
 	<TR height="5%"> 
   		<TD NOWRAP valign="top" width="80%"> 
    		<TABLE id="headTable" width="100%">
    			<TR id="trdark">  
    				<TH ALIGN="CENTER" NOWRAP width="10%">&nbsp;</TH>  
            		<TH ALIGN="CENTER" NOWRAP width="20%">Portafolio<br>Number</TH>
            		<TH ALIGN="CENTER" NOWRAP width="30%">Descripción</TH>
            		<TH ALIGN="CENTER" NOWRAP width="10%">Cliente</TH>
            		<TH ALIGN="CENTER" NOWRAP width="20%">Fecha<br>Apertura</TH>
            		<TH ALIGN="CENTER" NOWRAP width="10%">Moneda</TH>
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
  	<TR height="95%"> 
    	<TD NOWRAP valign="top" width="80%">
  
   			<div id="dataDiv1" style="height:400px; overflow:auto;">  
   				<table id=dataTable cellspacing="0" cellpadding="1" border="0" width="100%" >
    <%
                EWD0300Help.initRow();
                int k=1;
                while (EWD0300Help.getNextRow()) {
                    if (EWD0300Help.getFlag().equals("")) {
                    		out.println(EWD0300Help.getRecord());
                    k++;
                    }        
                }
    %> 
   				</table>
   			</div>
   		</TD>
      	<TD nowrap ALIGN="RIGHT" valign="top" width="20%"> 
         	<%int row = 0; %>

     	<Table id="tbAddInfo" >
      		<tr id="trclear">
            	<TD  ALIGN="RIGHT"  nowrap >
              		<p><b>
					Código del Oficial : <br>
					Nombre del Oficial : <br><br>
                	Nombre Legal : 
					</b></p>
				</TD>
         		<TD ALIGN="LEFT" nowrap class="tdaddinfo"></TD>
      		</tr>
     	</Table>
  	</TD>
   	</TR>
   </TABLE>				

<TABLE  class="tbenter" WIDTH="98%" ALIGN=CENTER>
    <TR>
      <TD WIDTH="50%" ALIGN=LEFT height="25"> 
       <% if ( EWD0300Help.getShowPrev() ) {
       		int pos = EWD0300Help.getFirstRec() - 21;
			out.println("<A HREF=\""+request.getContextPath()+"/servlet/datapro.eibs.helps.JSEWD0300?SCREEN=1&FromRecord=" + pos + "&CUSTOMER=" + userPO.getCusNum() + "\"><img src=\""+request.getContextPath()+"/images/e/previous_records.gif\" border=0></A>");
        }
%> </TD>
 	  <TD WIDTH="50%" ALIGN=RIGHT height="25"> 
 	   <% if ( EWD0300Help.getShowNext() ) {
      		int pos = EWD0300Help.getLastRec();
      		out.print("<A HREF=\""+request.getContextPath()+"/servlet/datapro.eibs.helps.JSEWD0300?SCREEN=1&FromRecord=" + pos + "&CUSTOMER=" + userPO.getCusNum() + "\"><img src=\""+request.getContextPath()+"/images/e/next_records.gif\" border=0></A>");

        }
%> </TD>
	 </TR>
	 </TABLE>
	 
  <p> 
    <SCRIPT type="text/javascript">
     	document.forms[0].totalRow.value="<%= k %>";
     	function resizeDoc() {
       		divResize(true);
   			adjustEquTables(document.getElementById("headTable"), document.getElementById("dataTable"), document.getElementById("dataDiv1"), 1, false);
      	}
     	showChecked("PORTNUM");
     	//resizeDoc();
     	document.getElementById("tbAddInfoH").rows[0].cells[0].height = document.getElementById("headTable").rows[0].cells[0].clientHeight;
     	window.onresize = resizeDoc;
     
	</SCRIPT>
    <%}%> </p>
</FORM>

</BODY>
</HTML>
