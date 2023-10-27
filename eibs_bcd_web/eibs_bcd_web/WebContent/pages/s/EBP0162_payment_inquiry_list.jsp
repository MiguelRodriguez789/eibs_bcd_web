<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<%@ page import = "datapro.eibs.master.*,datapro.eibs.beans.*" %>
<title>Source Documents</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "EBP0162List" class= "datapro.eibs.beans.JBObjList"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />

<script src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>
<SCRIPT type="text/javascript">

builtHPopUp();

function showPopUp(opth,field,bank,ccy,field1,field2,opcod) {
	init(opth,field,bank,ccy,field1,field2,opcod);
   		showPopupHelp();
}

function goNew() {
	document.getElementById("SCREEN").value="2"
	document.getElementById("DOCUMENTO").value=document.getElementById("E01BDCNUM").value;
	document.forms[0].submit();
}

function goProcess() {
	document.getElementById("SCREEN").value="5";
	document.getElementById("DOCUMENTO").value=document.getElementById("E01BDCNUM").value;
	document.forms[0].submit();
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

<h3 align="center">Pagos para la Factura Nro. <%= userPO.getIdentifier().trim() %><img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" 
	name="EIBS_GIF" title="payment_inquiry_list.jsp, EBP0162"></h3>
<hr size="4">


<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.bap.JSEBP0162">

  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="5">
  <INPUT TYPE=HIDDEN NAME="actRow" VALUE="0">
  <INPUT TYPE=HIDDEN NAME="TOTROWS" VALUE="0">
  <INPUT TYPE=HIDDEN NAME="NEXTROWS" VALUE="0">
  <INPUT TYPE=HIDDEN NAME="CURRROWS" VALUE="0">
  <INPUT TYPE=HIDDEN NAME="DOCUMENTO" VALUE="<%= userPO.getIdentifier() %>">
  <INPUT TYPE=HIDDEN NAME="E01BDCNUM" VALUE="<%= userPO.getIdentifier() %>">
  <INPUT TYPE=HIDDEN NAME="E01BDPNUM" VALUE="<%= userPO.getIdentifier() %>">

<TABLE class="tbenter"> 
	<TR>
		<TD align="CENTER" class="TDBKG" width="100%">
			<a href="<%=request.getContextPath()+"/servlet/datapro.eibs.bap.JSEBP0160?SCREEN=2&FromRecord=0" +
						"&E01REQBNK=" + userPO.getBank() +
						"&E01REQBRN=" + userPO.getBranch() +
				        "&E01REQTYP=" + userPO.getType() +
				        "&E01REQDTE=" + userPO.getHeader1() +
			  			"&E01REQDFM=" + userPO.getHeader2() +
			  			"&E01REQDFD=" + userPO.getHeader3() +
			  			"&E01REQDFY=" + userPO.getHeader4() +
			  			"&E01REQDTM=" + userPO.getHeader5() +
			  			"&E01REQDTD=" + userPO.getHeader6() +
			  			"&E01REQDTY=" + userPO.getHeader7() %>">
			<b>Salir</b></a>
	  	</TD>
	</TR>
</TABLE>      
 
<%	
	if ( EBP0162List.getNoResult() ) { 
%>
 	<TABLE class="tbenter" width=100% height=30%">
 	<TR>
      <TD align="center"> <h4 style="text-align:center"> No hay Pagos </h4>
      </TD>
	</TR>
   	</TABLE>
<%
	}
	else 
	{
%>    
    
  <TABLE class="tableinfo" id="dataTable">
    <TR id=trdark> 
		<td NOWRAP align="center" width="9%"><B>Numero Interno</B></td>
		<td NOWRAP align="center" width="9%"><B>Secuencia</B></td>
		<td NOWRAP align="center" width="9%"><B>Fecha Pago</B></td>
		<td NOWRAP align="center" width="9%"><B>Valor Pagado</B></td>
		<td NOWRAP align="center" width="9%"><B>Valor Retenido</B></td>
		<td NOWRAP align="center" width="9%"><B>Valor Impuestos</B></td>
		<td NOWRAP align="center" width="9%"><B>Valor Otros</B></td>
		<td NOWRAP align="center" width="9%"><B>Vía de Pago</B></td>
		<td NOWRAP align="center" width="9%"><B>Referencia Pago</B></td>
		<td NOWRAP align="center" width="9%"><B>Número Pago</B></td>
		<td NOWRAP align="center" width="10%"><B>Estado</B></td>
	</TR>

        <%
    	  int i = 0;
          EBP0162List.initRow();    
          while (EBP0162List.getNextRow()) {
            EBP016201Message msgList = (EBP016201Message) EBP0162List.getRecord();	
			
         %>   
                    
    <TR id=trclear>
		<td NOWRAP align="center" width="9%" ><%= msgList.getE01BPPNUM() %> </td>
		<td NOWRAP align="center" width="9%" ><%= msgList.getE01BPPSEQ() %></td>
		<td NOWRAP align="center" width="9%" ><%= datapro.eibs.master.Util.formatCustomDate( currUser.getE01DTF(), msgList.getE01BPPPDM(),msgList.getE01BPPPDD(),msgList.getE01BPPPDY())%></td>
		<td NOWRAP align="center" width="9%" ><%= msgList.getE01BPPAMT() %></td>
		<td NOWRAP align="center" width="9%" ><%= msgList.getE01BPPHLD() %></td>
		<td NOWRAP align="center" width="9%" ><%= msgList.getE01BPPTAX() %></td>
		<td NOWRAP align="center" width="9%" ><%= msgList.getE01BPPOTH() %></td>
		<td NOWRAP align="center" width="9%" ><%= msgList.getE01BPPPVID() %></td>
		<td NOWRAP align="center" width="9%" ><%= msgList.getE01BPPREF() %></td>
		<td NOWRAP align="center" width="9%" ><%= msgList.getE01BPPPYM() %></td>
		<td NOWRAP align="center" width="10%" ><%= msgList.getE01BPPSTSD() %></td>				
	</TR>
       <% 
       	 i++; 
        } 
       %> 
  </TABLE> 

  <TABLE  class="tbenter" WIDTH="88%" ALIGN=CENTER>
   	 <TR>
      <TD WIDTH="50%" ALIGN=LEFT>
       <%
    	if ( EBP0162List.getShowPrev() ) {
  			int pos = EBP0162List.getFirstRec() - 21;
  			out.print("<A HREF=\""+request.getContextPath()+"/servlet/datapro.eibs.bap.JSEBP0162?SCREEN=1&DOCUMENTO=" + userPO.getProdCode() + "&FromRecord=" + pos + "&SEARCHCDE=" + userPO.getProdCode() + "\" > <img src=\""+request.getContextPath()+"/images/s/previous_records.gif\" border=0></A>");
    	} %>
      </TD>
 	  <TD WIDTH="50%" ALIGN=RIGHT> 
 	  	<%       
    	if (EBP0162List.getShowNext()) {
  			int pos = EBP0162List.getLastRec();
  			out.print("<A HREF=\""+request.getContextPath()+"/servlet/datapro.eibs.bap.JSEBP0162?SCREEN=1&DOCUMENTO=" + userPO.getProdCode() + "&FromRecord=" + pos + "&SEARCHCDE=" + userPO.getProdCode() + "\" ><img src=\""+request.getContextPath()+"/images/s/next_records.gif\" border=0></A>");
	    } %>
  </TD>
 </TR>
 </TABLE>
  
<BR>
<SCRIPT type="text/javascript">
	document.forms[0].TOTROWS.value = <%= EBP0162List.getCurrentRow()%>;
	document.forms[0].NEXTROWS.value = <%= EBP0162List.getLastRec()%>;
	document.forms[0].CURRROWS.value = <%= EBP0162List.getFirstRec()%>;
</SCRIPT>
<%      
  }
%> 
</form>
</body>
</html>
