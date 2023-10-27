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
<jsp:useBean id= "EBP0128List" class= "datapro.eibs.beans.JBObjList"  scope="session" />
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

function goProcess(op) {
	document.getElementById("SCREEN").value=op;
	document.getElementById("DOCUMENTO").value=document.getElementById("E01BDCNUM").value;
	document.forms[0].submit();
}

function setKey(num) {
	document.getElementById("E01BDPNUM").value = num;
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
 String read = "";
 String disabled = "";
	if (!(userPO.getPurpose().equals("NEW") || userPO.getPurpose().equals("MAINTENANCE"))) 
		{ read = " readonly ";
		  disabled = " disabled"; }	
%>

<h3 align="center">Plan de Pagos para el Documento Nro. <%= userPO.getIdentifier().trim() %><img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" 
	name="EIBS_GIF" title="source_document_pp_list.jsp, EBP0128"></h3>
<hr size="4">


<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.bap.JSEBP0128">

  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="5">
  <INPUT TYPE=HIDDEN NAME="actRow" VALUE="0">
  <INPUT TYPE=HIDDEN NAME="TOTROWS" VALUE="0">
  <INPUT TYPE=HIDDEN NAME="NEXTROWS" VALUE="0">
  <INPUT TYPE=HIDDEN NAME="CURRROWS" VALUE="0">
  <INPUT TYPE=HIDDEN NAME="DOCUMENTO" VALUE="<%= userPO.getIdentifier().trim() %>">
  <INPUT TYPE=HIDDEN NAME="E01BDCNUM" VALUE="<%= userPO.getIdentifier().trim() %>">
  <INPUT TYPE=HIDDEN NAME="E01BDPNUM" VALUE="<%= userPO.getIdentifier().trim() %>">

<% 
 if (userPO.getPurpose().equals("NEW") || userPO.getPurpose().equals("MAINTENANCE")){
%>

<TABLE class="tbenter"> 
	<TR>
		<TD align="CENTER" class="TDBKG" width="20%">
			<a href="javascript:goProcess(6)"><b>Duplicar</b></a>
      	</TD>
      	<TD align="CENTER" class="TDBKG" width="20%">
			<a href="javascript:goProcess(2)"><b>Crear</b></a>
      	</TD>
      	<TD align="CENTER" class="TDBKG" width="20%">
			<a href="javascript:goProcess(4)"><b>Borrar</b></a>
      	</TD>
		<TD align="CENTER" class="TDBKG" width="20%">
			<a href="javascript:goProcess(5)"><b>Actualizar</b></a>
      	</TD>
	  	<TD align="CENTER" class="TDBKG" width="20%">
			<a href="<%=request.getContextPath()+"/servlet/datapro.eibs.bap.JSEBP0120?SCREEN=2" + 
  			"&E01REQTYP=" + userPO.getHeader1() + 
  			"&E01REQORD=" + userPO.getHeader2() +
  			"&E01REQSTS=" + userPO.getHeader3() +
  			"&E01REQFRM=" + userPO.getHeader4() +
  			"&E01REQPD1=" + userPO.getHeader5() +
  			"&E01REQPD2=" + userPO.getHeader6() +
  			"&E01REQPD3=" + userPO.getHeader7() +
  			"&E01REQKIN=" + userPO.getHeader8() %>">
			<b>Salir</b></a>
	  	</TD>
	</TR>
</TABLE> 

<%      
  }
%>     
 
<%	
	if ( EBP0128List.getNoResult() ) { 
%>
 	<TABLE class="tbenter" width=100% height=30%">
 	<TR>
      <TD align="center"> <h4 style="text-align:center"> No hay Plan de Pagos</h4>
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
		<td NOWRAP align="center" width="10%"><B>Borrar</B></td>
		<td NOWRAP align="center" width="30%"><B>Secuencia</B></td>
		<td NOWRAP align="center" width="30%"><B>Fecha Pago</B></td>
		<td NOWRAP align="center" width="30%"><B>Valor a Pagar</B></td>
		
	</TR>
    <TR id=trdark>
		<td NOWRAP align="center" width="10%"></td>
		<td NOWRAP align="center" width="30%"></td>
		<TD nowrap align="center" width="30%"><IMG src="<%=request.getContextPath()%>/images/Check.gif"
			title="Campo Obligatorio" align="bottom">
			<B><%=currUser.getE01DTF()%></B>
		</TD>
		<TD nowrap align="center" width="30%"><IMG src="<%=request.getContextPath()%>/images/Check.gif"
			title="Campo Obligatorio" align="bottom"></TD>
	</TR>

        <%
    	  int i = 0;
          EBP0128List.initRow();    
          while (EBP0128List.getNextRow()) {
            EBP012801Message msgList = (EBP012801Message) EBP0128List.getRecord();	
			
         %>   
                    
    <TR id=trclear>
		<td NOWRAP align="center" width="10%">
			<INPUT type="checkbox" name="E01ACT_<%= i %>" <%= disabled %>> 
		</td>
		<td NOWRAP align="center" width="30%" ><%= msgList.getE01BDPSEQ() %>
			<INPUT TYPE=HIDDEN name="E01BDPNUM_<%= i %>" value='<%= userPO.getIdentifier().trim() %>'>
			<INPUT TYPE=HIDDEN name="E01BDPSEQ_<%= i %>" value='<%= msgList.getE01BDPSEQ() %>'>	
		</td>
		<td NOWRAP align="center" width="30%" >
			<% if(currUser.getE01DTF().equals("YMD")) { %>
				<input type="text" size="4" maxlength="4" name="E01BDPPD3_<%= i %>" onKeyPress="enterInteger(event)" value="<%= msgList.getE01BDPPD3() %>" <%= read %>>
				<input type="text" size="2" maxlength="2" name="E01BDPPD1_<%= i %>" onKeyPress="enterInteger(event)" value="<%= msgList.getE01BDPPD1() %>" <%= read %>>
				<input type="text" size="2" maxlength="2" name="E01BDPPD2_<%= i %>" onKeypress="enterInteger(event)" value="<%= msgList.getE01BDPPD2() %>" <%= read %>>
				<a href="javascript:DatePicker(document.forms[0].E01BDPPD3_<%= i %>,document.forms[0].E01BDPPD1_<%= i %>,document.forms[0].E01BDPPD2_<%= i %>)">
					<img src="<%=request.getContextPath()%>/images/calendar.gif" title="Ayuda" align="middle" border="0">
				</a>
			<% } else if(currUser.getE01DTF().equals("MDY")) { %>
					<input type="text" size="2" maxlength="2" name="E01BDPPD1_<%= i %>" onKeyPress="enterInteger(event)" value="<%= msgList.getE01BDPPD1() %>" <%= read %>>
					<input type="text" size="2" maxlength="2" name="E01BDPPD2_<%= i %>" onKeypress="enterInteger(event)" value="<%= msgList.getE01BDPPD2() %>" <%= read %>>
					<input type="text" size="4" maxlength="4" name="E01BDPPD3_<%= i %>" onKeyPress="enterInteger(event)" value="<%= msgList.getE01BDPPD3() %>" <%= read %>>
					<a href="javascript:DatePicker(document.forms[0].E01BDPPD1_<%= i %>,document.forms[0].E01BDPPD2_<%= i %>,document.forms[0].E01BDPPD3_<%= i %>)">
						<img src="<%=request.getContextPath()%>/images/calendar.gif" title="Ayuda" align="middle" border="0">
					</a>
			<% } else { %>
					<input type="text" size="2" maxlength="2" name="E01BDPPD2_<%= i %>" onKeypress="enterInteger(event)" value="<%= msgList.getE01BDPPD2() %>" <%= read %>>
					<input type="text" size="2" maxlength="2" name="E01BDPPD1_<%= i %>" onKeyPress="enterInteger(event)" value="<%= msgList.getE01BDPPD1() %>" <%= read %>>
					<input type="text" size="4" maxlength="4" name="E01BDPPD3_<%= i %>" onKeyPress="enterInteger(event)" value="<%= msgList.getE01BDPPD3() %>" <%= read %>>
					<a href="javascript:DatePicker(document.forms[0].E01BDPPD2_<%= i %>,document.forms[0].E01BDPPD1_<%= i %>,document.forms[0].E01BDPPD3_<%= i %>)">
						<img src="<%=request.getContextPath()%>/images/calendar.gif" title="Ayuda" align="middle" border="0">
					</a>
			<% } %>
		</td>
		<td NOWRAP align="center" width="30%" >
			<INPUT type="text" name="E01BDPAMT_<%= i %>" size="20" maxlength="15" onkeypress="enterDecimal()"
				value='<%= msgList.getE01BDPAMT() %>' <%= read %>>
		</td>				
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
    	if ( EBP0128List.getShowPrev() ) {
  			int pos = EBP0128List.getFirstRec() - 21;
  			out.print("<A HREF=\""+request.getContextPath()+"/servlet/datapro.eibs.bap.JSEBP0128?SCREEN=1&DOCUMENTO=" + userPO.getProdCode() + "&FromRecord=" + pos + "&SEARCHCDE=" + userPO.getProdCode() + "\" > <img src=\""+request.getContextPath()+"/images/s/previous_records.gif\" border=0></A>");
    	} %>
      </TD>
 	  <TD WIDTH="50%" ALIGN=RIGHT> 
 	  	<%       
    	if (EBP0128List.getShowNext()) {
  			int pos = EBP0128List.getLastRec();
  			out.print("<A HREF=\""+request.getContextPath()+"/servlet/datapro.eibs.bap.JSEBP0128?SCREEN=1&DOCUMENTO=" + userPO.getProdCode() + "&FromRecord=" + pos + "&SEARCHCDE=" + userPO.getProdCode() + "\" ><img src=\""+request.getContextPath()+"/images/s/next_records.gif\" border=0></A>");
	    } %>
  </TD>
 </TR>
 </TABLE>
  
<BR>
<SCRIPT type="text/javascript">
	document.forms[0].TOTROWS.value = <%= EBP0128List.getCurrentRow()%>;
	document.forms[0].NEXTROWS.value = <%= EBP0128List.getLastRec()%>;
	document.forms[0].CURRROWS.value = <%= EBP0128List.getFirstRec()%>;
</SCRIPT>
<%      
  }
%> 
</form>
</body>
</html>
