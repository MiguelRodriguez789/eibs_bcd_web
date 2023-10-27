<HTML>
<HEAD>
<TITLE>Lista de Cheques a Aprobar </TITLE>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "dvList" class= "datapro.eibs.beans.JBList"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>

<script type="text/javascript">
  var reason = '';
 
  function goAction(op) {
     getElement("action").value = op;
     getElement("reason").value = reason;
     document.forms[0].submit();
   }

function showInqOFAC(fieldValue) {
		var formLength = document.forms[0].elements.length;
   		for (n=0; n<formLength; n++) {
      		var elementName = document.forms[0].elements[n].name;
      		var elementValue = document.forms[0].elements[n].value;
      		if (elementName == "ACCNUM" && elementValue == fieldValue) {
        		document.forms[0].elements[n].click();
        		break;
      		}
      	}
		var page = "${pageContext.request.contextPath}/servlet/datapro.eibs.helps.JSEWD0092?shrAcc=" + fieldValue + "&shrCategory=ALL" + "&FromRecord=0&shrAction=INQ";
		CenterWindow(page, 600, 500, 2);    
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

<FORM Method="post" Action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEOF0115A">
<INPUT TYPE=HIDDEN NAME="SCREEN" id="SCREEN" VALUE="2">
<INPUT TYPE=HIDDEN NAME="action" id="action" VALUE="A">
<INPUT TYPE=HIDDEN NAME="reason" id="reason" VALUE="">
<INPUT TYPE=HIDDEN NAME="totalRow" id="totalRow" VALUE="0">
<INPUT TYPE=HIDDEN NAME="OPTION" id="OPTION" VALUE="<% if (userPO.getOption().equals("3")) out.print("3"); else if (userPO.getOption().equals("4")) out.print("4"); else out.print("1"); %>">
         
<h3 align="center">
  <% if (userPO.getOption().equals("3"))
  		 out.print("Aprobación de Orden de Pago");
 	 else if (userPO.getOption().equals("4")) 	 
 	   		 out.print("Aprobación de Cheques de Terceros");
  	 else out.print("Aprobación de Cheques de Gerencia");
  %>
  </h3>
<hr size="4">
	<TABLE class="tbenter" width="100%" align=center>   
    <TR>
      <TD class=TDBKG width="33%"> 
        <div align="center"><a href="javascript:goAction('A')" id="linkApproval"><b>Aprobar</b></a></div>
      </TD>
      <TD class=TDBKG width="33%"> 
        <div align="center"><a href="javascript:enterReason('D')" id="linkDelete"><b>Eliminar</b></a></div>
      </TD>
      <TD class=TDBKG width="34%"> 
        <div align="center"><a href="javascript:checkClose()" id="linkExit"><b>Salir</b></a></div>
      </TD>
    </TR>
  </TABLE>
  
  
  <TABLE  id="mainTable" class="tableinfo">
    <tr  height="5%"> 
      <td NOWRAP valign="top" width="100%"> 
		<table id="headTable" width="100%">
			<tr id="trdark">
		      <th align=CENTER  nowrap width="5%">&nbsp;</th>
		      <th align=CENTER  nowrap width="10%">Referencia</th>
		      <th align=CENTER  nowrap width="7%">Moneda</th>
		      <th align=CENTER  nowrap width="8%">Sucursal</th>
		      <th align=CENTER  nowrap width="30%">Beneficiario</th>
		      <th align=CENTER  nowrap width="10%">Monto</th>
		      <th align=CENTER  nowrap width="20%">Estado</th> 
		      <th align=CENTER  nowrap width="10%">Fecha</th>
			</tr>
        </table>
      </td>
    </tr>    
		  <tr  height="95%">    
		    <td nowrap="nowrap">      
		       <div id="dataDiv1" style="height:450px; overflow:auto;"> 
		       <table id="dataTable" cellspacing="0" cellpadding="1" border="0" width="100%">         
    <%
                dvList.initRow();
                 int k=1;
                while (dvList.getNextRow()) {
                    if (dvList.getFlag().equals("")) {
                    		out.println(dvList.getRecord());
                    		k++;
                    }
                }
                 if ( k > 10 ) {
               }
              %> 
             </table>
             </div>
             </td>
             </tr>
</table>
  
  <TABLE class="tbenter" WIDTH="98%" ALIGN=CENTER>
  <TR>
  <TD WIDTH="50%" ALIGN=LEFT>
<%
        if ( dvList.getShowPrev() ) {
      			int pos = dvList.getFirstRec() - 51;
      			out.println("<A HREF=\""+request.getContextPath()+"/servlet/datapro.eibs.products.JSEOF0115A?SCREEN=9&OPTION=1&Pos=" + pos +"\"><img src=\""+request.getContextPath()+"/images/s/previous_records.gif\" border=0></A>");
        }
%> 
	</TD>
 	<TD WIDTH="50%" ALIGN=RIGHT>
<%       
        if ( dvList.getShowNext() ) {
      			int pos = dvList.getLastRec();
      			out.println("<A HREF=\""+request.getContextPath()+"/servlet/datapro.eibs.products.JSEOF0115A?SCREEN9&OPTION=1&Pos=" + pos +"\"><img src=\""+request.getContextPath()+"/images/s/next_records.gif\" border=0></A>");
        }
%> 
 	</TD>
	 </TR>
	 </TABLE>

<SCRIPT type="text/javascript">

	radioClick("ACCNUM", 0);

   	getElement("totalRow").value="<%= k %>";

  	function resizeDoc() {
       divResize();
       adjustEquTables(getElement('headTable'),getElement('dataTable'), getElement('dataDiv1'),1,false); 
    }
	//resizeDoc();
  	window.onresize = resizeDoc;
     
</SCRIPT>
  
</FORM>

</BODY>
</HTML>

