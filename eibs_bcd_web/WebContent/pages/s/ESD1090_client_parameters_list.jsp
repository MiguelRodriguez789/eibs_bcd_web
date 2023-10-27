<!DOCTYPE HTML">
<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@ page import = "datapro.eibs.master.Util" %>
<%@ page import="com.datapro.constants.EibsFields"%>
<%@ page import="com.datapro.eibs.constants.HelpTypes"%>
<html>
<head>
<%@ page import = "datapro.eibs.master.*,datapro.eibs.beans.*" %>
<title>Customers Parameters</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "list" class= "datapro.eibs.beans.JBObjList"  scope="session" />
<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />

<script src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<SCRIPT >

function goProcess() {
	document.forms[0].SCREEN.value="5"; 
	document.forms[0].submit();
}

function goNew() {
	document.forms[0].SCREEN.value="2";
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
 Boolean isReadOnly = false;
 String mandatory = "<img src=\"" + request.getContextPath() + "/images/Check.gif\" alt=\"campo obligatorio\" align=\"bottom\" border=\"0\" >";
 String help = "<img src=\"" + request.getContextPath() + "/images/1b.gif\" title=\"Ayuda\" align=\"bottom\" border=\"0\" style=\"cursor:hand\" >"; 
	if (!(userPO.getPurpose().equals("NEW") || userPO.getPurpose().equals("MAINTENANCE"))) 
		{ read = " readonly ";
		  disabled = " disabled"; 
		  isReadOnly = true;
	}	
%>

<h3 align="center">Parámetros de Clientes<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" 
	name="EIBS_GIF" title="client_parameters_list.jsp, ESD1090"></h3>
<hr size="4">


<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSESD1090">

  <INPUT TYPE=HIDDEN id="SCREEN" NAME="SCREEN" VALUE="5">
  <INPUT TYPE=HIDDEN NAME="actRow" VALUE="0">
  <INPUT TYPE=HIDDEN NAME="TOTROWS" VALUE="0">
  <INPUT TYPE=HIDDEN NAME="NEXTROWS" VALUE="0">
  <INPUT TYPE=HIDDEN NAME="CURRROWS" VALUE="0">
  

<% 
 if (userPO.getPurpose().equals("NEW") || userPO.getPurpose().equals("MAINTENANCE")){
%>
 
<TABLE class="tbenter"> 
	<TR>
		<TD align="CENTER" class="TDBKG" width="33%">
			<a href="javascript:goNew()"><b>Crear</b></a>
      	</TD>
		<TD align="CENTER" class="TDBKG" width="33%">
			<a href="javascript:goProcess()"><b>Someter<br>Actualizaciones</b></a>
      	</TD>
	  	<TD align="CENTER" class="TDBKG" width="34%">
			<a href="<%=request.getContextPath()%>/pages/background.jsp"><b>Salir</b></a>
	  	</TD>
	</TR>
</TABLE> 

<%      
  }
%>     


<% 
	if ( list.getNoResult() ) {
%>
 	<TABLE class="tbenter" width=100% height=30%">
 		<TR>
      <TD>         
      <div align="center"> <h4 style="text-align:center"> No hay Parámetros Definidos.</h4> 
      </div>
      </TD></TR>
   	</TABLE>
<%
	}
	else {
   	  int i = 0;
      list.initRow();    
      while (list.getNextRow()) {
        ESD109001Message msgList = (ESD109001Message) list.getRecord();		 	 
%>  
  <TABLE class="tableinfo" id="dataTable<%= list.getCurrentRow()%>">
    
    <TR id=trdark>
		<td NOWRAP align="center" width="5%"><b>Borrar</b></td>
		<td NOWRAP align="center" width="5%"><b>Banco<BR> </b></td>
		<td NOWRAP align="center" width="18%"><b>Causal Bloqueo</b></td>
		<td NOWRAP align="center" width="18%"><b>Causal Activación</b></td>
		<td NOWRAP align="center" width="18%"><b>Causal</b></td>
		<td NOWRAP align="center" width="18%"><b>Causal Inactivación</b></td>
		<td NOWRAP align="center" width="18%"><b>Causal</b></td>
	</TR>
    <TR id=trdark>
		<td NOWRAP align="center" width="5%"></td>
		<td NOWRAP align="center" width="5%"><b><%=mandatory%></b></td>
		<td NOWRAP align="center" width="18%"><b>Ley de Victimas</b><br><%=mandatory%></td>
		<td NOWRAP align="center" width="18%"><b>Ley de Victimas</b><br><%=mandatory%></td>
		<td NOWRAP align="center" width="18%"><b>Fallecimiento</b><br><%=mandatory%></td>
		<td NOWRAP align="center" width="18%"><b>Actualizacion Modeler</b><br><%=mandatory%></td>
		<td NOWRAP align="center" width="18%"><b>Embargo</b><br><%=mandatory%></td>
	</TR>
    <TR id=trclear>
		<td NOWRAP align="center" width="5%" valign="top">
			<INPUT type="checkbox" name="E01ACT_<%= list.getCurrentRow() %>" <%= disabled %>>
		</td>
		<td NOWRAP align="center" width="5%" valign="top">
			<input type="text" name="E01BNK_<%= list.getCurrentRow()%>" size="3" maxlength="2" onKeypress="enterInteger(event)" value="<%= msgList.getE01BNK().trim()%>" <%=read%>> 
		</td>
		<td NOWRAP align="center" width="18%" valign="top">
			<input type="text" name="E01LDV_<%= list.getCurrentRow()%>" size="5" maxlength="4" value="<%= msgList.getE01LDV().trim()%>" <%=read%>> 
            		<% if ( !isReadOnly) {%>
            		<a href="javascript:Get2FilterCodes('E01LDV_<%= list.getCurrentRow()%>','D01LDV_<%= list.getCurrentRow()%>','FU','','3');"> 
					<%=help%>
					</a> 
              		<% } %>
              		<br>
            	<input type="text" name="D01LDV_<%= list.getCurrentRow()%>" size="20" value="<%= msgList.getD01LDV().trim()%>" readonly> 
		</td>
		<td NOWRAP align="center" width="18%" valign="top">
			<input type="text" name="E01LDA_<%= list.getCurrentRow()%>" size="5" maxlength="4" value="<%= msgList.getE01LDA().trim()%>" <%=read%>> 
            		<% if ( !isReadOnly) {%>
            		<a href="javascript:Get2FilterCodes('E01LDA_<%= list.getCurrentRow()%>','D01LDA_<%= list.getCurrentRow()%>','FU','','2');"> 
					<%=help%>
					</a> 
              		<% } %>
              		<br>
            	<input type="text" name="D01LDA_<%= list.getCurrentRow()%>" size="20" value="<%= msgList.getD01LDA().trim()%>" readonly> 
		</td>
		<td NOWRAP align="center" width="18%" valign="top">
			<input type="text" name="E01KIL_<%= list.getCurrentRow()%>" size="5" maxlength="4" value="<%= msgList.getE01KIL().trim()%>" <%=read%> 
            		<% if ( !isReadOnly) {%>
            		<a href="javascript:Get2FilterCodes('E01KIL_<%= list.getCurrentRow()%>','D01KIL_<%= list.getCurrentRow()%>','FU','','3');"> 
					<%=help%>
					</a> 
              		<% } %>
              		<br>
            	<input type="text" name="D01KIL_<%= list.getCurrentRow()%>" size="20" value="<%= msgList.getD01KIL().trim()%>" readonly> 
		</td>
		<td NOWRAP align="center" width="18%" valign="top">
			<input type="text" name="E01TAV_<%= list.getCurrentRow()%>" size="5" maxlength="4" value="<%= msgList.getE01TAV().trim()%>" <%=read%>> 
            		<% if ( !isReadOnly) {%>
            		<a href="javascript:Get2FilterCodes('E01TAV_<%= list.getCurrentRow()%>','D01TAV_<%= list.getCurrentRow()%>','FU','','2');"> 
					<%=help%>
					</a> 
              		<% } %>
              		<br>
            <input type="text" name="D01TAV_<%= list.getCurrentRow()%>" size="20" value="<%= msgList.getD01TAV().trim()%>" readonly>
		</td>		
		<td NOWRAP align="center" width="18%" valign="top">
			<input type="text" name="E01EMB_<%= list.getCurrentRow()%>" size="5" maxlength="4" value="<%= msgList.getE01EMB().trim()%>" <%=read%>> 
            		<% if ( !isReadOnly) {%>
            		<a href="javascript:Get2FilterCodes('E01EMB_<%= list.getCurrentRow()%>','D01EMB_<%= list.getCurrentRow()%>','FU','','3');"> 
					<%=help%>
					</a> 
              		<% } %>
              		<br>
            	<input type="text" name="D01EMB_<%= list.getCurrentRow()%>" size="20" value="<%= msgList.getD01EMB().trim()%>" readonly> 
		</td>
	</TR>
	
	<TR id=trdark>
		<td NOWRAP align="center" width="5%"><b></b></td>
		<td NOWRAP align="center" width="5%"><b><BR> </b></td>
		<td NOWRAP align="center" width="18%"><b>Tipo Teléfono</b></td>
		<td NOWRAP align="center" width="18%"><b>Tipo Teléfono</b></td>
		<td NOWRAP align="center" width="18%"><b>Tipo Teléfono</b></td>
		<td NOWRAP align="center" width="18%"><b>En Calidad de</b></td>
		<td NOWRAP align="center" width="18%"><b>En Calidad de</b></td>
	</TR>
    <TR id=trdark>
		<td NOWRAP align="center" width="5%"></td>
		<td NOWRAP align="center" width="5%"><b></b></td>
		<td NOWRAP align="center" width="18%"><b>Residencia</b><br><%=mandatory%></td>
		<td NOWRAP align="center" width="18%"><b>Empresa</b><br><%=mandatory%></td>
		<td NOWRAP align="center" width="18%"><b>Celular</b><br><%=mandatory%></td>
		<td NOWRAP align="center" width="18%"><b>Empleado del Banco</b><br><%=mandatory%></td>
		<td NOWRAP align="center" width="18%"><b>Ingresos Grupo Familiar</b><br><%=mandatory%></td>
	</TR>
    <TR id=trclear>
		<td NOWRAP align="center" width="5%" valign="top">
		</td>
		<td NOWRAP align="center" width="5%" valign="top">
		</td>
		<td NOWRAP align="center" width="18%" valign="top">
			<input type="text" name="E01TTR_<%= list.getCurrentRow()%>" size="5" maxlength="4" value="<%= msgList.getE01TTR().trim()%>" <%=read%>> 
            		<% if ( !isReadOnly) {%>
            		<a href="javascript:GetCodeDescAuxCNOFC('E01TTR_<%= list.getCurrentRow()%>','D01TTR_<%= list.getCurrentRow()%>','DO','');">  
					<%=help%>
					</a> 
              		<% } %>
              		<br>
            	<input type="text" name="D01TTR_<%= list.getCurrentRow()%>" size="20" value="<%= msgList.getD01TTR().trim()%>" readonly> 
		</td>
		<td NOWRAP align="center" width="18%" valign="top">
			<input type="text" name="E01TTE_<%= list.getCurrentRow()%>" size="5" maxlength="4" value="<%= msgList.getE01TTE().trim()%>" <%=read%>> 
            		<% if ( !isReadOnly) {%>
            		<a href="javascript:GetCodeDescAuxCNOFC('E01TTE_<%= list.getCurrentRow()%>','D01TTE_<%= list.getCurrentRow()%>','DO','');"> 
					<%=help%>
					</a> 
              		<% } %>
              		<br>
            	<input type="text" name="D01TTE_<%= list.getCurrentRow()%>" size="20" value="<%= msgList.getD01TTE().trim()%>" readonly>
		</td>
		<td NOWRAP align="center" width="18%" valign="top">
			<input type="text" name="E01TTC_<%= list.getCurrentRow()%>" size="5" maxlength="4" value="<%= msgList.getE01TTC().trim()%>" <%=read%>> 
            		<% if ( !isReadOnly) {%> 
            		<a href="javascript:GetCodeDescAuxCNOFC('E01TTC_<%= list.getCurrentRow()%>','D01TTC_<%= list.getCurrentRow()%>','DO','');"> 
					<%=help%>
					</a> 
              		<% } %> 
              		<br>
            	<input type="text" name="D01TTC_<%= list.getCurrentRow()%>" size="20" value="<%= msgList.getD01TTC().trim()%>" readonly>
		</td>	
				<td NOWRAP align="center" width="18%" valign="top">
			<input type="text" name="E01EAD_<%= list.getCurrentRow()%>" size="5" maxlength="4" value="<%= msgList.getE01EAD().trim()%>" <%=read%>> 
            		<% if ( !isReadOnly) {%>
            		<a href="javascript:Get2FilterCodes('E01EAD_<%= list.getCurrentRow()%>','D01EAD_<%= list.getCurrentRow()%>','IN','','3');"> 
					<%=help%>
					</a> 
              		<% } %>
              		<br>
            	<input type="text" name="D01EAD_<%= list.getCurrentRow()%>" size="20" value="<%= msgList.getD01EAD().trim()%>" readonly> 
		</td>	
		<td NOWRAP align="center" width="18%" valign="top">
			<input type="text" name="E01TAI_<%= list.getCurrentRow()%>" size="5" maxlength="4" value="<%= msgList.getE01TAI().trim()%>" <%=read%>>
				<% if ( !isReadOnly) {%>
            		<a href="javascript:GetCodeDescAuxCNOFC('E01TAI_<%= list.getCurrentRow()%>','D01TAI_<%= list.getCurrentRow()%>','IN','');"> 
					<%=help%>
					</a> 
              		<% } %> 
              		<br>
            <input type="text" name="D01TAI_<%= list.getCurrentRow()%>" size="20" value="<%= msgList.getD01TAI().trim()%>" readonly>
		</td>
	</TR>

	<TR id=trdark>
		<td NOWRAP align="center" width="5%"><b></b></td>
		<td NOWRAP align="center" width="5%"><b><BR> </b></td>
		<td NOWRAP align="center" width="18%"><b>Formato Financiero</b></td>
		<td NOWRAP align="center" width="18%"><b>Formato Financiero</b></td>
		<td NOWRAP align="center" width="18%"><b>Formato Financiero</b></td>
		<td NOWRAP align="center" width="18%"><b>Inf. Adicional</b></td>
		<td NOWRAP align="center" width="18%"><b>Inf. Adicional</b></td>
	</TR>
    <TR id=trdark>
		<td NOWRAP align="center" width="5%"></td>
		<td NOWRAP align="center" width="5%"><b></b></td>
		<td NOWRAP align="center" width="18%"><b>Persona Detallado</b><br><%=mandatory%></td>
		<td NOWRAP align="center" width="18%"><b>Persona Fiscal</b><br><%=mandatory%></td>
		<td NOWRAP align="center" width="18%"><b>Persona General</b><br><%=mandatory%></td>
		<td NOWRAP align="center" width="18%"><b>Empresa Desde</b><br><%=mandatory%></td>
		<td NOWRAP align="center" width="18%"><b>Empresa Hasta</b><br><%=mandatory %></td>
	</TR>
    <TR id=trclear>
		<td NOWRAP align="center" width="5%" valign="top">
		</td>
		<td NOWRAP align="center" width="5%" valign="top">
		</td>
		<td NOWRAP align="center" width="18%" valign="top">
			<input type="text" name="E01PFD_<%= list.getCurrentRow()%>" size="5" maxlength="3" value="<%= msgList.getE01PFD().trim()%>" <%=read%> onKeypress="enterInteger(event)"> 
		</td>
		<td NOWRAP align="center" width="18%" valign="top">
			<input type="text" name="E01PFF_<%= list.getCurrentRow()%>" size="5" maxlength="4" value="<%= msgList.getE01PFF().trim()%>" <%=read%> onKeypress="enterInteger(event)"> 
		</td>
		<td NOWRAP align="center" width="18%" valign="top">
			<input type="text" name="E01PFG_<%= list.getCurrentRow()%>" size="5" maxlength="4" value="<%= msgList.getE01PFG().trim()%>" <%=read%> onKeypress="enterInteger(event)"> 
		</td>	
		<td NOWRAP align="center" width="18%" valign="top">
			<input type="text" name="E01TDO_<%= list.getCurrentRow()%>" size="5" maxlength="4" value="<%= msgList.getE01TDO().trim()%>" <%=read%>> 
            		<% if ( !isReadOnly) {%> 
            		<a href="javascript:GetCodeDescAuxCNOFC('E01TDO_<%= list.getCurrentRow()%>','D01TDO_<%= list.getCurrentRow()%>','C8','');"> 
					<%=help%>
					</a> 
              		<% } %> 
              		<br>
            	<input type="text" name="D01TDO_<%= list.getCurrentRow()%>" size="20" value="<%= msgList.getD01TDO().trim()%>" readonly>
		</td>	
		<td NOWRAP align="center" width="18%" valign="top">
			<input type="text" name="E01TDP_<%= list.getCurrentRow()%>" size="5" maxlength="4" value="<%= msgList.getE01TDP().trim()%>" <%=read%>> 
            		<% if ( !isReadOnly) {%> 
            		<a href="javascript:GetCodeDescAuxCNOFC('E01TDP_<%= list.getCurrentRow()%>','D01TDP_<%= list.getCurrentRow()%>','C8','');"> 
					<%=help%>
					</a> 
              		<% } %> 
              		<br>
            	<input type="text" name="D01TDP_<%= list.getCurrentRow()%>" size="20" value="<%= msgList.getD01TDP().trim()%>" readonly>
		</td>
	</TR>
	
		<TR id=trdark>
		<td NOWRAP align="center" width="5%"><b></b></td>
		<td NOWRAP align="center" width="5%"><b><BR> </b></td>
		<td NOWRAP align="center" width="18%"><b>Formato Financiero</b></td> 
		<td NOWRAP align="center" width="18%"><b>Formato Financiero</b></td>
		<td NOWRAP align="center" width="18%"><b>Formato Financiero</b></td>
		<td NOWRAP align="center" width="18%"><b>Inf. Adicional</b></td>
		<td NOWRAP align="center" width="18%"><b></b></td>
	</TR>
    <TR id=trdark>
		<td NOWRAP align="center" width="5%"></td>
		<td NOWRAP align="center" width="5%"><b></b></td>
		<td NOWRAP align="center" width="18%"><b>Juridica Detallado</b><br><%=mandatory%></td>
		<td NOWRAP align="center" width="18%"><b>Juridica Fiscal</b><br><%=mandatory%></td>
		<td NOWRAP align="center" width="18%"><b>Juridica General</b><br><%=mandatory%></td>
		<td NOWRAP align="center" width="18%"><b>Solicitud de Vivienda</b><br></td>
		<td NOWRAP align="center" width="18%"><b></b><br></td>
	</TR>
    <TR id=trclear>
		<td NOWRAP align="center" width="5%" valign="top">
		</td>
		<td NOWRAP align="center" width="5%" valign="top">
		</td>
		<td NOWRAP align="center" width="18%" valign="top">
			<input type="text" name="E01JFD_<%= list.getCurrentRow()%>" size="5" maxlength="3" value="<%= msgList.getE01JFD().trim()%>" <%=read%> onKeypress="enterInteger(event)"> 
		</td>
		<td NOWRAP align="center" width="18%" valign="top">
			<input type="text" name="E01JFF_<%= list.getCurrentRow()%>" size="5" maxlength="4" value="<%= msgList.getE01JFF().trim()%>" <%=read%> onKeypress="enterInteger(event)"> 
		</td>
		<td NOWRAP align="center" width="18%" valign="top">
			<input type="text" name="E01JFG_<%= list.getCurrentRow()%>" size="5" maxlength="4" value="<%= msgList.getE01JFG().trim()%>" <%=read%> onKeypress="enterInteger(event)"> 
		</td>	
		<td NOWRAP align="center" width="18%" valign="top">
			<input type="text" name="E01TTF_<%= list.getCurrentRow()%>" size="5" maxlength="4" value="<%= msgList.getE01TTF().trim()%>" <%=read%>> 
            		<% if ( !isReadOnly) {%> 
            		<a href="javascript:GetCodeDescAuxCNOFC('E01TTF_<%= list.getCurrentRow()%>','D01TTF_<%= list.getCurrentRow()%>','C8','');"> 
					<%=help%>
					</a> 
              		<% } %> 
              		<br>
            	<input type="text" name="D01TTF_<%= list.getCurrentRow()%>" size="20" value="<%= msgList.getD01TTF().trim()%>" readonly>
		</td>	
		<td NOWRAP align="center" width="18%" valign="top">
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
    	if ( list.getShowPrev() ) {
  			int pos = list.getFirstRec() - 21;
  			out.print("<A HREF=\""+request.getContextPath()+"/servlet/datapro.eibs.client.JSESD1090?SCREEN=1&FromRecord=" + pos + "\" > <img src=\""+request.getContextPath()+"/images/e/Regresar.gif\" border=0></A>");
    	} %>
      </TD>
 	  <TD WIDTH="50%" ALIGN=RIGHT height="25"> 
 	  	<%       
    	if (list.getShowNext()) {
  			int pos = list.getLastRec();
  			out.print("<A HREF=\""+request.getContextPath()+"/servlet/datapro.eibs.client.JSESD1090?SCREEN=1&FromRecord=" + pos +  "\" ><img src=\""+request.getContextPath()+"/images/e/Avanzar.gif\" border=0></A>");
	    } %>
  </TD>
 </TR>
 </TABLE>
  
<BR>
<SCRIPT>
	document.forms[0].TOTROWS.value = <%= i%>;
	document.forms[0].NEXTROWS.value = <%= list.getLastRec()%>;
	document.forms[0].CURRROWS.value = <%= list.getFirstRec()%>;
</SCRIPT>
<%      
  }
%> 
</form>
</body>
<% if (!(userPO.getPurpose().equals("NEW") || userPO.getPurpose().equals("MAINTENANCE"))) {%>
<script src="<%=request.getContextPath()%>/jquery/readOnlyPage.jsp"> </script>
<% } %>
<script src="<%=request.getContextPath()%>/jquery/markChangedFields.jsp?MSGOBJ=client"> </script>

</html>
