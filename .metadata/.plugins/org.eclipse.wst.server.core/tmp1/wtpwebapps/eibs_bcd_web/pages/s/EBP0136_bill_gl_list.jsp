<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<%@ page import = "datapro.eibs.master.*,datapro.eibs.beans.*" %>
<title>Source Documents</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/jquery/plugins/contextMenu/css/jquery.contextMenu.css" rel="stylesheet" type="text/css" />

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "EBP0136List" class= "datapro.eibs.beans.JBObjList"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>

<script src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>

<SCRIPT type="text/javascript">

function goProcess(op) {
	getElement("SCREEN").value=op;
	getElement("DOCUMENTO").value=getElement("E01BPGNUM").value;
	document.forms[0].submit();
}

function setKey(num) {
	getElement("E01BPGNUM").value = num;
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
 String orgRead = "";
 String orgDisabled = "";
 String read = "";
 String disabled = "";
	if (!(userPO.getPurpose().equals("NEW") || userPO.getPurpose().equals("MAINTENANCE"))) 
		{ orgRead = " readonly ";
		  orgDisabled = " disabled"; }	
%>

<h3 align="center">Transacciones Contables para el Documento Nro. <%= userPO.getIdentifier().trim() %><img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" 
	name="EIBS_GIF" title="source_document_gl_list.jsp, EBP0136"></h3>
<hr size="4">


<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.bap.JSEBP0136">

  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="5">
  <INPUT TYPE=HIDDEN NAME="actRow" VALUE="0">
  <INPUT TYPE=HIDDEN NAME="TOTROWS" VALUE="0">
  <INPUT TYPE=HIDDEN NAME="NEXTROWS" VALUE="0">
  <INPUT TYPE=HIDDEN NAME="CURRROWS" VALUE="0">
  <INPUT TYPE=HIDDEN NAME="DOCUMENTO" VALUE="<%= userPO.getIdentifier().trim() %>">
  <INPUT TYPE=HIDDEN NAME="E01BPBNUM" VALUE="<%= userPO.getIdentifier().trim() %>">
  <INPUT TYPE=HIDDEN NAME="E01BPGNUM" VALUE="<%= userPO.getIdentifier().trim() %>">

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
	  	<TD align="CENTER" class="TDBKG" width="34%">
			<a href="<%=request.getContextPath()+"/servlet/datapro.eibs.bap.JSEBP0130?SCREEN=2" + 
  			"&E01REQTYP=" + userPO.getHeader1() + 
  			"&E01REQORD=" + userPO.getHeader2() +
  			"&E01REQSTS=" + userPO.getHeader3() +
  			"&E01REQFRM=" + userPO.getHeader4() +
  			"&E01REQPD1=" + userPO.getHeader5() +
  			"&E01REQPD2=" + userPO.getHeader6() +
  			"&E01REQPD3=" + userPO.getHeader7() +
  			"&QUEUE="     + userPO.getHeader9()%>">
			<b>Salir</b></a>
	  	</TD>
	</TR>
</TABLE> 

<%      
  }
%>     
 
<%	
	if ( EBP0136List.getNoResult() ) { 
%>
 	<TABLE class="tbenter" width=100% height=30%">
 	<TR>
      <TD align="center"> <h4 style="text-align:center"> No hay Transacciones</h4>
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
		<td NOWRAP align="center" width="10%"><B>Sel</B></td>
		<td NOWRAP align="center" width="10%"><B>Secuencia</B></td>
		<td NOWRAP align="center" width="10%"><B>DB/CR</B></td>
		<td NOWRAP align="center" width="10%"><B>Banco</B></td>
		<TD nowrap align="center" width="10%"><B>Oficina</B></TD>
		<TD nowrap align="center" width="10%"><B>Moneda</B></TD>
		<TD nowrap align="center" width="10%"><B>Cuenta Contable</B></TD>
		<TD nowrap align="center" width="10%"><B>Cuenta Detalle</B></TD>
		<TD nowrap align="center" width="10%"><B>Centro Costo</B></TD>
		<TD nowrap align="center" width="10%"><B>Monto</B></TD>
	</TR>
    <TR id=trdark>
		<td NOWRAP align="center" width="10%"></td>
		<td NOWRAP align="center" width="10%"></td>
		<TD nowrap align="center" width="10%"><IMG src="<%=request.getContextPath()%>/images/Check.gif"
			title="Campo Obligatorio" align="bottom"></TD>
		<TD nowrap align="center" width="10%"><IMG src="<%=request.getContextPath()%>/images/Check.gif"
			title="Campo Obligatorio" align="bottom"></TD>
		<TD nowrap align="center" width="10%"><IMG src="<%=request.getContextPath()%>/images/Check.gif"
			title="Campo Obligatorio" align="bottom"></TD>
		<TD nowrap align="center" width="10%"><IMG src="<%=request.getContextPath()%>/images/Check.gif"
			title="Campo Obligatorio" align="bottom"></TD>
		<TD nowrap align="center" width="10%"><IMG src="<%=request.getContextPath()%>/images/Check.gif"
			title="Campo Obligatorio" align="bottom"></TD>
		<TD nowrap align="center" width="10%"></TD>
		<TD nowrap align="center" width="10%"><IMG src="<%=request.getContextPath()%>/images/Check.gif"
			title="Campo Obligatorio" align="bottom"></TD>
		<TD nowrap align="center" width="10%"><IMG src="<%=request.getContextPath()%>/images/Check.gif"
			title="Campo Obligatorio" align="bottom"></TD>
	</TR>

        <%
    	  int i = 0;
          EBP0136List.initRow();    
          while (EBP0136List.getNextRow()) {
            EBP013601Message msgList = (EBP013601Message) EBP0136List.getRecord();	
            if (msgList.getE01BPGUPD().equals("N"))
            {
            	read = "readonly";
            	disabled = "disabled";
            }
            else
            {
            	read = orgRead;
            	disabled = orgDisabled;
            }
			
         %>   
                    
    <TR id=trclear>
		<td NOWRAP align="center" width="10%">
			<INPUT type="checkbox" name="E01ACT_<%= i %>" <%= disabled %>> 
		</td>
		<td NOWRAP align="center" width="10%" ><%= msgList.getE01BPGSEQ() %>
			<INPUT TYPE=HIDDEN name="E01BPGNUM_<%= i %>" value='<%= userPO.getIdentifier().trim() %>'>
			<INPUT TYPE=HIDDEN name="E01BPGSEQ_<%= i %>" value='<%= msgList.getE01BPGSEQ() %>'>	
			<INPUT TYPE=HIDDEN name="E01BPGTYP_<%= i %>" value='<%= msgList.getE01BPGTYP() %>'>	
		</td>
		<td NOWRAP align="center" width="10%" >
			<SELECT name="E01BPGDC_<%= i %>" <%= disabled %>>
			  <OPTION <%= msgList.getE01BPGDC().trim().equals("DB")?"Selected":""%> value="DB">DB</OPTION>
			  <OPTION <%= msgList.getE01BPGDC().trim().equals("CR")?"Selected":""%> value="CR">CR</OPTION>
			</SELECT>
		</td>
		<td NOWRAP align="center" width="10%" >
		<INPUT type="text" name="E01BPGBNK_<%= i %>" size="3" maxlength="2"
				value="<%= msgList.getE01BPGBNK() %>" <%= read %> >
		</td>
		<td NOWRAP align="center" width="10%" >
		<INPUT type="text" name="E01BPGBRN_<%= i %>" size="4" maxlength="4" onkeypress="enterInteger(event)"
				class="context-menu-help" onmousedown="init(branchHelp,this.name,document.forms[0].E01BPGBNK_<%= i %>.value,'','','','')"
				value='<%= msgList.getE01BPGBRN() %>' <%= read %> >
		</td>
		<td NOWRAP align="center" width="10%" >
		<INPUT type="text" name="E01BPGCCY_<%= i %>" size="4" maxlength="3"
				class="context-menu-help" onmousedown="init(currencyHelp,this.name,document.forms[0].E01BPGBNK_<%= i %>.value,'','','','')"
				value='<%= msgList.getE01BPGCCY() %>' <%= read %> >
		</td>
		<td NOWRAP align="center" width="10%" >
		<INPUT type="text" name="E01BPGGLN_<%= i %>" size="18" maxlength="16"
				class="context-menu-help" onmousedown="init(ledgerHelp,this.name,document.forms[0].E01BPGBNK_<%= i %>.value,document.forms[0].E01BPGCCY_<%= i %>.value,'','','')"
				value='<%= msgList.getE01BPGGLN() %>' <%= read %> >
		</td>
		<td NOWRAP align="center" width="10%" >
		<INPUT type="text" name="E01BPGACC_<%= i %>" size="14" maxlength="12"
				class="context-menu-help" onmousedown="init(accountHelp,this.name,document.forms[0].E01BPGBNK_<%= i %>.value,'document.forms[0].E01BDCCUN_<%= i %>.value','','','RT')"
				value='<%= msgList.getE01BPGACC() %>' <%= read %> >
		</td>
		<td NOWRAP align="center" width="10%" >
		<INPUT type="text" name="E01BPGCCN_<%= i %>" size="9" maxlength="8"
				class="context-menu-help" onmousedown="init(costcenterHelp,this.name,document.forms[0].E01BPGBNK_<%= i %>.value,'','','','')"
				value='<%= msgList.getE01BPGCCN() %>' <%= read %> >
		</td>
		<td NOWRAP align="center" width="10%" >
		<INPUT type="text" name="E01BPGAMT_<%= i %>" size="20" maxlength="15" onkeypress="enterDecimal(event, 2)"
				value='<%= msgList.getE01BPGAMT() %>' <%= read %> >
		</td>				
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
    	if ( EBP0136List.getShowPrev() ) {
  			int pos = EBP0136List.getFirstRec() - 21;
  			out.print("<A HREF=\""+request.getContextPath()+"/servlet/datapro.eibs.bap.JSEBP0136?SCREEN=1&DOCUMENTO=" + userPO.getProdCode() + "&FromRecord=" + pos + "&SEARCHCDE=" + userPO.getProdCode() + "\" > <img src=\""+request.getContextPath()+"/images/s/previous_records.gif\" border=0></A>");
    	} %>
      </TD>
 	  <TD WIDTH="50%" ALIGN=RIGHT height="25"> 
 	  	<%       
    	if (EBP0136List.getShowNext()) {
  			int pos = EBP0136List.getLastRec();
  			out.print("<A HREF=\""+request.getContextPath()+"/servlet/datapro.eibs.bap.JSEBP0136?SCREEN=1&DOCUMENTO=" + userPO.getProdCode() + "&FromRecord=" + pos + "&SEARCHCDE=" + userPO.getProdCode() + "\" ><img src=\""+request.getContextPath()+"/images/s/next_records.gif\" border=0></A>");
	    } %>
  </TD>
 </TR>
 </TABLE>
  
<BR>
<SCRIPT type="text/javascript">
	getElement("TOTROWS").value = <%= EBP0136List.getCurrentRow()%>;
	getElement("NEXTROWS").value = <%= EBP0136List.getLastRec()%>;
	getElement("CURRROWS").value = <%= EBP0136List.getFirstRec()%>;
</SCRIPT>
<%      
  }
%> 
</form>
</body>
</html>
