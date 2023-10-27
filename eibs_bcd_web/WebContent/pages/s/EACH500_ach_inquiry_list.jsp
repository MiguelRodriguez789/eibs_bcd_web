<%@ page import = "datapro.eibs.master.Util" %>
<html>
<head>
<%@ page import = "datapro.eibs.master.*,datapro.eibs.beans.*" %>
<title>ACH Inquiry</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "EACH500List" class= "datapro.eibs.beans.JBObjList"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>
<jsp:useBean id="currUser" class="datapro.eibs.beans.ESS0030DSMessage" scope="session" />

<script src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<SCRIPT>
var ok = false;
 
function goDetail() {
	isCheck();
	if (!ok) {
		alert("Favor seleccionar una transaccion ACH!!!");
		return;	 
	}
	achnum = getElement("E01ACHNRO").value;
	reqtyp = getElement("E01REQTYP").value;
	reqsts = getElement("E01REQSTS").value;
	page = "${pageContext.request.contextPath}/servlet/datapro.eibs.ach.JSEACH500?E01ACHNRO=" + achnum + "&E01REQTYP=" + reqtyp + "&E01REQSTS=" + reqsts + "&SCREEN=3";
	CenterWindow(page,600,500,2);
}

function goPage(p) {
	document.forms[0].FromRecord.value = p;
	document.forms[0].SCREEN.value = '2';
	document.forms[0].submit();
}


function isCheck() {
	var formLength= document.forms[0].elements.length;
   	ok = false;
	for(n=0;n<formLength;n++) {
     	var elementName= document.forms[0].elements[n].name;
      	if(elementName == "ROW") {
			if (document.forms[0].elements[n].checked == true) {
				ok = true;
				break;
			}
      	}
    }
}

function setKey(num) {
	document.forms[0].E01ACHNRO.value = num;
}

</SCRIPT>

</head>

<body>

<% 
 if ( !error.getERRNUM().equals("0")  ) { 
     out.println("<SCRIPT Language=\"Javascript\">");
	 error.setERRNUM("0");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
 }
%>

<h3 align="center">Consulta de Transaciones ACH <% if (userPO.getType().equals("I")) { 
										out.println("ENTRANTES"); 
									  } else { out.println("SALIENTES");
									  } 
									%>. 
    <img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" 
	name="EIBS_GIF" title="ach_inquiry_list.jsp, EACH500">
</h3>
<hr size="4">


<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.ach.JSEACH500">

  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="2">
  <INPUT TYPE=HIDDEN NAME="actRow" VALUE="0">
  <INPUT TYPE=HIDDEN NAME="TOTROWS" VALUE="0">
  <INPUT TYPE=HIDDEN NAME="NEXTROWS" VALUE="0">
  <INPUT TYPE=HIDDEN NAME="CURRROWS" VALUE="0">
  <INPUT TYPE=HIDDEN NAME="FromRecord" VALUE="0"> 
  <INPUT TYPE=HIDDEN NAME="E01ACHNRO" VALUE="0"> 
  <INPUT TYPE="HIDDEN" name="E01REQTYP" value="<%= userPO.getType().trim() %>">
  <INPUT TYPE="HIDDEN" name="E01REQORD" value="<%= userPO.getHeader1().trim() %>">
  <INPUT TYPE="HIDDEN" name="E01REQSTS" value="<%= userPO.getHeader2().trim() %>">
  <INPUT TYPE="HIDDEN" name="E01REQFRM" value="<%= userPO.getHeader3().trim() %>">
  <INPUT TYPE="HIDDEN" name="E01REQPDM" value="<%= userPO.getHeader4().trim() %>">
  <INPUT TYPE="HIDDEN" name="E01REQPDD" value="<%= userPO.getHeader5().trim() %>">
  <INPUT TYPE="HIDDEN" name="E01REQPDY" value="<%= userPO.getHeader6().trim() %>">

<TABLE class="tbenter" width="100%"> 
	<TR>
		<TD align="right" width="34%"></TD>
		<TD align="right" width="33%"><B><U>Criterio de Busqueda</U></B></TD>
	  	<TD align="CENTER" width="33%"></TD>	  	
	</TR>
	<TR>
		<TD align="CENTER" width="34%"></TD>
		<TD align="right" width="33%"><B>Ordenado por :</B></TD>
		<TD align="left" width="33%"><% if (userPO.getHeader1().equals("C")) { 
				out.println("Desde Cliente "  + userPO.getHeader3()); 
			   } else if (userPO.getHeader1().equals("N")) { 
				out.println("Desde ACH Numero "  + userPO.getHeader3()); 
			   } else if (userPO.getHeader1().equals("D")) { 
				out.println("Desde Fecha " + datapro.eibs.master.Util.formatCustomDate(currUser.getE01DTF(), userPO.getHeader4(),userPO.getHeader5(),userPO.getHeader6()));
			   } else if (userPO.getHeader1().equals("A")) { 
				out.println("Desde Cuenta " + userPO.getHeader3());  	
			   } else  { out.println("Desde Lote ACH " + userPO.getHeader3());
			   }%> 
			  
		</TD>
	</TR>
    <TR>
		<TD align="CENTER" width="34%"></TD>
		<TD align="right" width="33%"><B>Con Estado :</B></TD>
		<TD align="left" width="33%"><% if (userPO.getHeader2().equals("P")) { 
				out.println("Pendiente de Aprobacion"); 
			   } else if (userPO.getHeader2().equals("A")) { 
				out.println("Aprobada"); 
			   } else if (userPO.getHeader2().equals("*")) { 
				out.println("Procesada");
			   } else if (userPO.getHeader2().equals("R")) { 
				out.println("En Proceso de Retorno");  	
			   } %></TD>
	</TR>
	
</TABLE> 

<%	if ( EACH500List.getNoResult() ) { %>
 	<TABLE class="tbenter" width=100% height=30%">
 	<TR>
      <TD>         
      <div align="center"> <h4 style="text-align:center"> No hay resultado para su criterio de busqueda.</h4></div>
      </TD>
	</TR>
	<TR>
	  	<TD align="CENTER" class="TDBKG" width="100%">
			<a href="<%=request.getContextPath()%>/servlet/datapro.eibs.ach.JSEACH500?SCREEN=1"><b>Volver a la<BR>Busquedad</b></a>
      	</TD>
	</TR>
	
   	</TABLE>
<%
	} else {
%>    

<TABLE class="tbenter"> 
	<TR>
		<TD align="CENTER" class="TDBKG" width="50%">
			<a href="javascript:goDetail()"><b>Ver<br>Transaccion</b></a>
      	</TD>
	  	<TD align="CENTER" class="TDBKG" width="50%">
			<a href="<%=request.getContextPath()%>/servlet/datapro.eibs.ach.JSEACH500?SCREEN=1"><b>Volver a la<BR>Busquedad</b></a>
      	</TD>
	</TR>
</TABLE> 
    
  <TABLE class="tableinfo" id="dataTable">
    <TR id=trdark> 
		<td NOWRAP align="center" width="5%"><B>Sel</B></td>
		<td NOWRAP align="center" width="5%"><B>Numero<BR>ACH</B></td>
		<TD nowrap align="center" width="10%"><B>Fecha de<BR>Proceso</B></TD>
		<td NOWRAP align="center" width="10%"><B>Fecha<BR>Valor</B></td>
		<TD nowrap align="center" width="10%"><B>Cuenta</B></TD>
		<TD nowrap align="center" width="10%"><B>Numero<BR>Cliente</B></TD>
		<TD nowrap align="center" width="20%"><B>Nombre de Receptor</B></TD>
		<TD nowrap align="center" width="10%"><B>Monto</B></TD>
		<TD nowrap align="center" width="5%"><B>Clase de<BR>Entrada</B></TD>
		<TD nowrap align="center" width="5%"><B>TR</B></TD>
		<TD nowrap align="center" width="5%"><B>Estado</B></TD>
		<TD nowrap align="center" width="5%"><B>Referencia</B></TD>				
	</TR>
 
        <%
          String ofacImg = "";
    	  int i = 0;
          EACH500List.initRow();    
          while (EACH500List.getNextRow()) {
            EACH50001Message msgList = (EACH50001Message) EACH500List.getRecord();	
			if (msgList.getH01FLGWK3().trim().equals("3")) {
					ofacImg = "<IMG border=\"0\" src=\"../images/warning_16.jpg\" title=\"Coincidencia OFAC\" onClick=\"showOfac('" + msgList.getE01ACHNRO() + "')\">";
			} 
         %>   
                    
    <TR id=trclear>
		<td NOWRAP align="center" width="5%">
           	<INPUT TYPE="radio" name="ROW"  value="<%= EACH500List.getCurrentRow()%>" onClick="setKey('<%=msgList.getE01ACHNRO()%>')">
			<%=ofacImg%>
		</td>
		
		<td NOWRAP align="center" width="5%" ><%= msgList.getE01ACHNRO() %></td>
		<td NOWRAP align="center" width="10%" ><%= Util.formatCustomDate(currUser.getE01DTF(),
															msgList.getBigDecimalE01ACHRDM().intValue(),
															msgList.getBigDecimalE01ACHRDD().intValue(),
															msgList.getBigDecimalE01ACHRDY().intValue()) %></td>
															
		<td NOWRAP align="center" width="10%" ><%= Util.formatCustomDate(currUser.getE01DTF(),
															msgList.getBigDecimalE01ACHVDM().intValue(),
															msgList.getBigDecimalE01ACHVDD().intValue(),
															msgList.getBigDecimalE01ACHVDY().intValue()) %></td>	
		<td NOWRAP align="left" width="10%" ><%= msgList.getE01ACHACC() %></td>
		<td NOWRAP align="right" width="10%" ><%= msgList.getE01ACHCUN() %></td>
		<td NOWRAP align="left" width="20%" ><%= msgList.getE01CUNDSC() %></td>
		<td NOWRAP align="right" width="10%" ><%= msgList.getE01ACHAMT() %></td>
		<td NOWRAP align="center" width="5%" ><%= msgList.getE01ACHECD() %></td>
		<td NOWRAP align="center" width="5%" ><%= msgList.getE01ACHCDE() %>-<%= msgList.getE01ACHDC() %></td>
		<td NOWRAP align="left" width="5%" ><%= msgList.getE01ACHSTS() %></td>
		<td NOWRAP align="right" width="5%" ><%= msgList.getE01ACHREF() %></td>
	</TR>
       <% 
       	 i++; 
        } 
       %> 
  </TABLE> 

  <TABLE  class="tbenter" WIDTH="88%" ALIGN=CENTER>
   	 <TR>
      <TD WIDTH="50%" ALIGN=LEFT height="25">
       <%
    	if ( EACH500List.getShowPrev() ) {
  			int pos = EACH500List.getFirstRec() - 21;
  			out.print("<img src=\""+request.getContextPath()+"/images/s/previous_records.gif\" border=0 onclick=\"goPage(" + pos + ")\">");
    	} %>
      </TD>
 	  <TD WIDTH="50%" ALIGN=RIGHT height="25"> 
 	  	<%       
    	if (EACH500List.getShowNext()) {
  			int pos = EACH500List.getLastRec();
  			out.print("<img src=\""+request.getContextPath()+"/images/s/next_records.gif\" border=0 onclick=\"goPage(" + pos + ")\">");
	    } %>
      </TD>
     </TR>
 </TABLE>
  
<BR>

<SCRIPT type="text/javascript">
	document.forms[0].TOTROWS.value = <%= i%>;
	document.forms[0].NEXTROWS.value = <%= EACH500List.getLastRec()%>;
	document.forms[0].CURRROWS.value = <%= EACH500List.getFirstRec()%>;
</SCRIPT>
<% } %>    
</form>
</body>
</html>
