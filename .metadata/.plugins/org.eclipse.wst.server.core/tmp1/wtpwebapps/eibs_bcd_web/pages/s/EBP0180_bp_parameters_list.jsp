<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<%@ page import = "datapro.eibs.master.*,datapro.eibs.beans.*" %>
<title>BP Parametros</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "EBP0180List" class= "datapro.eibs.beans.JBObjList"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<SCRIPT type="text/javascript">

function goProcess() {
	document.getElementById("SCREEN").value="5"; 
	document.forms[0].submit();
}

function goNew() {
	document.getElementById("SCREEN").value="2";
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
 String read = "";
 String disabled = "";
	if (!(userPO.getPurpose().equals("NEW") || userPO.getPurpose().equals("MAINTENANCE"))) 
		{ read = " readonly ";
		  disabled = " disabled"; }	
%>

<h3 align="center">BP Parametros<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="bp_parameters_list.jsp, EBP0180"></h3>
<hr size="4">


<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.bap.JSEBP0180">

  <INPUT TYPE=HIDDEN NAME="SCREEN" id="SCREEN" VALUE="5">
  <INPUT TYPE=HIDDEN NAME="actRow" id="actRow" VALUE="0">
  <INPUT TYPE=HIDDEN NAME="TOTROWS" id="TOTROWS" VALUE="0">
  <INPUT TYPE=HIDDEN NAME="NEXTROWS" id="NEXTROWS" VALUE="0">
  <INPUT TYPE=HIDDEN NAME="CURRROWS" id="CURRROWS" VALUE="0">
  <INPUT TYPE=HIDDEN NAME="TYPE" id="TYPE" VALUE="O">
  <INPUT TYPE=HIDDEN NAME="OPEDSC" id="OPEDSC" VALUE="">

<% 
 if (userPO.getPurpose().equals("NEW") || userPO.getPurpose().equals("MAINTENANCE")){
%>
 
<TABLE class="tbenter"> 
	<TR>
		<TD align="CENTER" class="TDBKG" width="25%">
			<a href="javascript:goNew()"><b>Crear</b></a>
      	</TD>
		<TD align="CENTER" class="TDBKG" width="25%">
			<a href="javascript:goProcess()"><b>Actualizar</b></a>
      	</TD>
		<TD align="CENTER" class="TDBKG" width="25%">
			<a href="javascript:goProcess()"><b>Borrar</b></a>
      	</TD>
	  	<TD align="CENTER" class="TDBKG" width="25%">
			<a href="<%=request.getContextPath()%>/pages/background.jsp"><b>Salir</b></a>
	  	</TD>
	</TR>
</TABLE> 

<%      
  }
%>     


<% 
	if ( EBP0180List.getNoResult() ) {
%>
 	<TABLE class="tbenter" width=100% height=30%">
 		<TR>
      <TD>         
      <div align="center"> <h4 style="text-align:center">No hay parametros.</h4> 
      </div>
      </TD></TR>
   	</TABLE>
<%
	}
	else {
%>    
    
  <TABLE class="tableinfo" id="dataTable" width=100%>
  	<TR id=trdark>
		<td NOWRAP align="center" width="5%"></td>
		<td NOWRAP align="center" width="5%"></td>
		<td NOWRAP align="center" width="15%"></td>
		<td NOWRAP align="center" width="10%"></td>
		<td NOWRAP align="center" width="65%" colspan="5"><B>INF. CONTABILIDAD</B></td>
		
	</TR>
    
    <TR id=trdark>
    	<td NOWRAP align="center" width="5%"><b>Sel</b></td>
		<td NOWRAP align="center" width="5%"><b>Banco</b></td>
		<td NOWRAP align="center" width="15%"><b>Monto Máximo <BR>para Aprobacion <BR>Automática de Factuas<BR></b></td>
		<td NOWRAP align="center" width="10%"><b>Días Adelantados<BR>para Generación<BR>de Pagos</B></td>
		<td NOWRAP align="center" width="5%"><b>Código<BR>Transacción</b></td>
		<td NOWRAP align="center" width="5%"><b>Batch</b></td>
		<td NOWRAP align="center" width="20%" colspan=2><b>Retención</b></td>
		<td NOWRAP align="center" width="35%"><b>Cuentas Contables<BR>Para Forma de Pago</b></td>
		
		
	</TR>
    <TR id=trdark>
		<td NOWRAP align="center" width="5%"></td>
		<td NOWRAP align="center" width="5%">
			<IMG src="<%=request.getContextPath()%>/images/Check.gif" title="Campo Obligatorio" align="bottom">
		</td>
		<td NOWRAP align="center" width="15%"></td>
		<td NOWRAP align="center" width="10%">
			<IMG src="<%=request.getContextPath()%>/images/Check.gif" title="Campo Obligatorio" align="bottom">
		</td>
		<td NOWRAP align="center" width="5%"> 
			<IMG src="<%=request.getContextPath()%>/images/Check.gif" title="Campo Obligatorio" align="bottom">
		</td>
		<TD nowrap align="center" width="5%">
			<IMG src="<%=request.getContextPath()%>/images/Check.gif" title="Campo Obligatorio" align="bottom">
		</TD>
		<td NOWRAP align="center" width="10%">Cuenta Contable</td>
		<td NOWRAP align="center" width="10%">Porcentaje</td>
		<td NOWRAP align="center" width="35%"></td>
	</TR>
 
        <%
    	  int i = 0;
          EBP0180List.initRow();    
          while (EBP0180List.getNextRow()) {
               EBP018001Message msgList = (EBP018001Message) EBP0180List.getRecord();		 	 
         %>              
          <TR id=trclear>
		<td NOWRAP align="center" width="5%" valign="top">
			<INPUT type="checkbox" name="E01ACT_<%= EBP0180List.getCurrentRow() %>" <%= disabled %>>
		</td>

		<td NOWRAP align="center" width="5%" valign="top">
			<INPUT type="text" name="E01BPABNK_<%= EBP0180List.getCurrentRow() %>" size="3" maxlength="2"  value='<%= msgList.getE01BPABNK()%>' <%= read %>>
		</td>
		<td NOWRAP align="center" width="15%" valign="top">
			<INPUT type="text" name="E01BPAAMT_<%= EBP0180List.getCurrentRow() %>" value="<%= msgList.getE01BPAAMT() %>" size="14" maxlength="13"
 				onkeypress="enterInteger(event)"	<%= read %>>
		</td>
		<td NOWRAP align="center" width="10%" valign="top">
			<INPUT type="text" name="E01BPADAD_<%= EBP0180List.getCurrentRow() %>"
				onkeypress="enterInteger(event)"			
				value="<%= msgList.getE01BPADAD() %>" size="4" maxlength="3" <%= read %>>
		</td>
		<TD nowrap align="center" width="10%" valign="top">		
		<INPUT type="text" name="E01BPATCD_<%= EBP0180List.getCurrentRow() %>" value="<%= msgList.getE01BPATCD() %>" size="4" maxlength="4"
 				 	<%= read %>>
		</TD> 
		<td NOWRAP align="center" width="10%" valign="top">
		<INPUT type="text" name="E01BPABTH_<%= EBP0180List.getCurrentRow() %>" value="<%= msgList.getE01BPABTH() %>" size="6" maxlength="5"
 				onkeypress="enterInteger(event)"	<%= read %>>
		</td>
		<td NOWRAP align="center" width="10%" valign="top">
		<INPUT type="text" name="E01BPAGLW_<%= EBP0180List.getCurrentRow() %>" value="<%= msgList.getE01BPAGLW() %>" size="18" maxlength="16"
 				onkeypress="enterInteger(event)"	<%= read %>>
 			<A href="javascript:GetLedger('E01BPAGLW_<%= EBP0180List.getCurrentRow() %>',document.forms[0].E01BPABNK_<%=EBP0180List.getCurrentRow()%>.value,'','')">  
			<IMG src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" border="0" align="top"><BR>
			</A>    
		</td>
		<td NOWRAP align="center" width="10%" valign="top">
		<INPUT type="text" name="E01BPAPOW_<%= EBP0180List.getCurrentRow() %>" value="<%= msgList.getE01BPAPOW() %>" size="7" maxlength="5"
 				onkeypress="enterDecimal()"	<%= read %>>
		</td>
		<TD nowrap align="left" width="35%" valign="top">
			<INPUT type="text" name="E01BPAGLC_<%= EBP0180List.getCurrentRow() %>" 
				value="<%= msgList.getE01BPAGLC() %>" size="18" maxlength="16"  <%= read %>>
				<A href="javascript:GetLedger('E01BPAGLC_<%= EBP0180List.getCurrentRow() %>',document.forms[0].E01BPABNK_<%=EBP0180List.getCurrentRow()%>.value,'','')">
				<IMG src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" border="0" align="top">
				</A><B> Cheque Gerencia </B>
				<INPUT type="text" name="E01BPAFTY_<%= EBP0180List.getCurrentRow() %>" value="<%= msgList.getE01BPAFTY() %>" size="3" maxlength="2"
 				 	<%= read %>><b> Formato</b><BR>	
			<INPUT type="text" name="E01BPAGLP_<%= EBP0180List.getCurrentRow() %>"
				value="<%= msgList.getE01BPAGLP() %>" size="18" maxlength="16" <%= read %>>
				<A href="javascript:GetLedger('E01BPAGLP_<%= EBP0180List.getCurrentRow() %>',document.forms[0].E01BPABNK_<%=EBP0180List.getCurrentRow()%>.value,'','')"> 
				<IMG src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" border="0" align="top">
				</A><B> Transferencia</B><BR>  
			<INPUT type="text" name="E01BPAGLA_<%= EBP0180List.getCurrentRow() %>"
				value="<%= msgList.getE01BPAGLA() %>" size="18" maxlength="16" <%= read %>>
				<A href="javascript:GetLedger('E01BPAGLA_<%= EBP0180List.getCurrentRow() %>',document.forms[0].E01BPABNK_<%=EBP0180List.getCurrentRow()%>.value,'','')">  
				<IMG src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" border="0" align="top">
				</A><B> ACH</B><BR>   
			<INPUT type="text" name="E01BPAGLS_<%= EBP0180List.getCurrentRow() %>"
				value="<%= msgList.getE01BPAGLS() %>" size="18" maxlength="16" <%= read %>>
				<A href="javascript:GetLedger('E01BPAGLS_<%= EBP0180List.getCurrentRow() %>',document.forms[0].E01BPABNK_<%=EBP0180List.getCurrentRow()%>.value,'','')">  
				<IMG src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" border="0" align="top">
				</A><B> Swift</B><BR>   
			<INPUT type="text" name="E01BPAGLR_<%= EBP0180List.getCurrentRow() %>"
				value="<%= msgList.getE01BPAGLR() %>" size="18" maxlength="16" <%= read %>>
				<A href="javascript:GetLedger('E01BPAGLR_<%= EBP0180List.getCurrentRow() %>',document.forms[0].E01BPABNK_<%=EBP0180List.getCurrentRow()%>.value,'','')">  
				<IMG src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" border="0" align="top">
				</A><B> Cuenta Corriente</B><BR> 
			<INPUT type="text" name="E01BPAGLG_<%= EBP0180List.getCurrentRow() %>"
				value="<%= msgList.getE01BPAGLG() %>" size="18" maxlength="16" <%= read %>>
				<A href="javascript:GetLedger('E01BPAGLG_<%= EBP0180List.getCurrentRow() %>',document.forms[0].E01BPABNK_<%=EBP0180List.getCurrentRow()%>.value,'','')">  
				<IMG src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" border="0" align="top">
				</A><B> Cuenta Contable</B>
				<b>Cuentas Contable<BR>
		<BR>Cuenta Contable Para<BR>		
		<BR>Ingresos por Penalización<BR>
		</b>
			<INPUT type="text" name="E01BPAGLI_<%= EBP0180List.getCurrentRow() %>"
				value="<%= msgList.getE01BPAGLI() %>" size="18" maxlength="16" <%= read %>>
				<A href="javascript:GetLedger('E01BPAGLI_<%= EBP0180List.getCurrentRow() %>',document.forms[0].E01BPABNK_<%=EBP0180List.getCurrentRow()%>.value,'','')">  
				<IMG src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" border="0" align="top">
				</A><B> Cuenta Contable</B>	
				
		</TD>
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
    	if ( EBP0180List.getShowPrev() ) {
  			int pos = EBP0180List.getFirstRec() - 21;
  			out.print("<A HREF=\""+request.getContextPath()+"/servlet/datapro.eibs.bpa.JSEBP0180?SCREEN=1&FromRecord=" + pos + "\" > <img src=\""+request.getContextPath()+"/images/s/previous_records.gif\" border=0></A>");
    	} %>
      </TD>
 	  <TD WIDTH="50%" ALIGN=RIGHT height="25"> 
 	  	<%       
    	if (EBP0180List.getShowNext()) {
  			int pos = EBP0180List.getLastRec();
  			out.print("<A HREF=\""+request.getContextPath()+"/servlet/datapro.eibs.bpa.JSEBP0180?SCREEN=1&FromRecord=" + pos +  "\" ><img src=\""+request.getContextPath()+"/images/s/next_records.gif\" border=0></A>");
	    } %>
  </TD>
 </TR>
 </TABLE>
  
<BR>
<SCRIPT type="text/javascript">
	document.getElementById("TOTROWS").value = <%= i%>;
	document.getElementById("NEXTROWS").value = <%= EBP0180List.getLastRec()%>;
	document.getElementById("CURRROWS").value = <%= EBP0180List.getFirstRec()%>;
</SCRIPT>
<%      
  }
%> 
</form>
</body>
</html>
