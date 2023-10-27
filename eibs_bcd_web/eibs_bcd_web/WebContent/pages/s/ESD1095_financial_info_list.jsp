<!DOCTYPE HTML>
<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@ page import = "datapro.eibs.master.Util" %>
<%@ page import="com.datapro.constants.EibsFields"%>
<%@ page import="com.datapro.eibs.constants.HelpTypes"%>
<%@ page import = "datapro.eibs.master.*,datapro.eibs.beans.*" %>
<html>
<head>
<title>Customers Financial Info</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "list" class= "datapro.eibs.beans.JBObjList"  scope="session" />
<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />
<jsp:useBean id="currUser" class="datapro.eibs.beans.ESS0030DSMessage" scope="session" />

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<SCRIPT type="text/javascript">
<%
		  int row = 0;
    	  int i = 0;
          list.initRow();
          list.getNextRow();
          ESD109502Message msgRcd = (ESD109502Message) list.getRecord();
%> 

function goUpdate() {
	document.forms[0].SCREEN.value="15"; 
	submitForm();
} 

function goCalcular() {
	document.forms[0].SCREEN.value="25"; 
	submitForm();
} 

function goExit() {
	document.forms[0].SCREEN.value="11"; 
	submitForm();
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

<h3 align="center">Informacion Financiera de Clientes<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" 
    name="EIBS_GIF" title="financial_info_list.jsp, ESD1095"></h3>
<hr size="4">

<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSESD1095">

  <INPUT TYPE=HIDDEN id="SCREEN" NAME="SCREEN" VALUE="15">
  <INPUT TYPE=HIDDEN NAME="actRow" VALUE="0">
  <INPUT TYPE=HIDDEN NAME="TOTROWS" VALUE="0">
  <INPUT TYPE=HIDDEN NAME="NEXTROWS" VALUE="0">
  <INPUT TYPE=HIDDEN NAME="CURRROWS" VALUE="0">
  <INPUT TYPE=HIDDEN NAME="E02IFIRDT" VALUE="<%= msgRcd.getE02IFIRDT().trim()%>">
  <table  class="tableinfo" width="100%">
    <tr bordercolor="#FFFFFF"> 
    <td nowrap> 
	<table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="<%=(row % 2 == 1) ? "trclear" : "trdark"%><%row++;%>"> 
            <td nowrap width="15%" align="right">Formato / Tipo : </td>
            <td nowrap align="left" width="35%">
            	<INPUT type="text" name="E02IFIRPN" maxlength="5" size="3" readonly value="<%= msgRcd.getE02IFIRPN().trim()%>" > / 
            	<select name="E02IFITIN" disabled>
                	<option value=" " <% if (!(msgRcd.getE02IFITIN().equals("IFG")||msgRcd.getE02IFITIN().equals("IFD") || msgRcd.getE02IFITIN().equals("IFF"))) out.print("selected"); %>> 
                    </option>
                    <option value="IFD" <% if (msgRcd.getE02IFITIN().equals("IFD")) out.print("selected"); %>>Detallado</option>                   
                    <option value="IFF" <% if (msgRcd.getE02IFITIN().equals("IFF")) out.print("selected"); %>>Fiscal</option>
                    <option value="IFG" <% if (msgRcd.getE02IFITIN().equals("IFG")) out.print("selected"); %>>General</option>
                </select>
			</td>
            <td nowrap width="15%" align="right">Fuente : </td>
			<td nowrap align="left" width="35%">
				<select name="E02IFIDOC" <%=disabled%>>
                    <option value="OT" <% if (msgRcd.getE02IFIDOC().equals("OT") || msgRcd.getE02IFIDOC().equals("")) out.print("selected"); %>>Levantamiento de Información</option>
                    <option value="FS" <% if (msgRcd.getE02IFIDOC().equals("FS")) out.print("selected"); %>>Estados Financieros</option>                   
                    <option value="TX" <% if (msgRcd.getE02IFIDOC().equals("TX")) out.print("selected"); %>>Declaración de Renta</option>
                </select>
			</td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trclear" : "trdark"%><%row++;%>">
			<td nowrap width="15%" align="right">Descripción : </td>
			<td nowrap align="left" width="35%">
            	<INPUT type="text" name="E02IFILID" maxlength="65" size="60" value="<%= msgRcd.getE02IFILID().trim()%>" readonly>
			</td>
            <td nowrap width=10% align="right">Fecha de Estado Financiero : </td>
            <td  nowrap width=40% align="left">
            	<%= Util.formatCustomDate(currUser.getE01DTF(),	msgRcd.getBigDecimalE02IFIMDM().intValue(),
					     				  msgRcd.getBigDecimalE02IFIMDD().intValue(), msgRcd.getBigDecimalE02IFIMDY().intValue())%>
       		</td>
	     </tr>
        <tr id="<%=(row % 2 == 1) ? "trclear" : "trdark"%><%row++;%>">
			<td nowrap width=10% align="right">Cliente :</td>
			<td  nowrap width=40% align="left">
				<INPUT type="text" name="E02IFICUN" maxlength="9" size="10" readonly value="<%= msgRcd.getE02IFICUN().trim()%>" >
				<INPUT type="text" name="D02IFINA1" maxlength="45" size="50" readonly value="<%= msgRcd.getD02IFINA1().trim()%>" >
			</td>
            <td nowrap width=10% align="right">Fecha de Caducidad Estado Financiero : </td>
            <td  nowrap width=40% align="left">
            	<%= Util.formatCustomDate(currUser.getE01DTF(),	msgRcd.getBigDecimalE02IFIMDM().intValue(),
					     				  msgRcd.getBigDecimalE02IFIMDD().intValue(), msgRcd.getBigDecimalE02IFIMDY().intValue() + 1)%>
       		</td>
		<tr id="<%=(row % 2 == 1) ? "trclear" : "trdark"%><%row++;%>">
			<td nowrap width=10% align="right">Estado : </td>
			<td  nowrap width=40% align="left">
				<input type="text" name="D02IFIERRD" size="62" maxlength="60" value="<%= msgRcd.getD02IFIERRD().trim()%>" readonly
			      style=<%=(!msgRcd.getD02IFIERR().equals("")? "color:red;font-size:12;" : "color:green;font-size:12;")%>
			</td>
            <td nowrap width=10% align="right">Corte Información (AAAA/MM) : </td>
            <td  nowrap width=40% align="left">
            	<eibsinput:text name="msgRcd" property="E02IFIIFY" value="<%= msgRcd.getE02IFIIFY().trim()%>" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_INTEGER %>" size="5" maxlength="4" required="false" readonly="<%=isReadOnly %>" />
            	/ 
            	<eibsinput:text name="msgRcd" property="E02IFIIFM" value="<%= msgRcd.getE02IFIIFM().trim()%>" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_INTEGER %>" size="3" maxlength="2" required="false" readonly="<%=isReadOnly %>" />
       		</td>
	    </tr>	       		
	  </table>
	</td>	   
	</tr>
</table>	
	  
<TABLE class="tbenter"> 
	<TR>
		<% if (userPO.getPurpose().equals("NEW") || userPO.getPurpose().equals("MAINTENANCE")){	%>
		<TD align="CENTER" class="TDBKG" width="33%">
			<a href="javascript:goUpdate()"><b>Enviar<br>Actualizaciones</b></a>
      	</TD>
      	<TD align="CENTER" class="TDBKG" width="33%">
			<a href="javascript:goCalcular()"><b>Recalculo<br>Total</b></a>
      	</TD>
      	<% } %>
      	<TD align="CENTER" class="TDBKG" width="34%">
			<a href="javascript:window.close()"><b>Salir</b></a>
	  	</TD>
	</TR>
</TABLE> 

<% 
	if ( list.getNoResult() ) {
%>
 	<TABLE class="tbenter" width=100% height=30%">
 		<TR>
      <TD>         
      <div align="center"> <h4 style="text-align:center"> No hay Formato Financiero.</h4> 
      </div>
      </TD></TR>
   	</TABLE>

<% 	} else { %>

<TABLE class="tableinfo" id="dataTable<%= list.getCurrentRow()%>">
    
    <TR id=trdark>
		<td NOWRAP align="center" width="10%"><b>Linea<BR> </b></td>
		<td NOWRAP align="center" width="40%"><b>Descripción</b></td>
		<td NOWRAP align="center" width="20%"><b>Monto</b></td>
		<td NOWRAP align="center" width="5%"><b>Obligatorio</b></td>
		<td NOWRAP align="center" width="25%"><b>Estado</b></td>
	</TR>
    <TR id=trdark>
		<td NOWRAP align="center" width="10%"><b></b></td>
		<td NOWRAP align="center" width="40%"><b></b></td>
		<td NOWRAP align="center" width="20%"><b></b></td>
		<td NOWRAP align="center" width="5%"><b></b></td>
		<td NOWRAP align="center" width="25%"><b></b></td>
	</TR>

<%
      while (list.getNextRow()) {
        msgRcd = (ESD109502Message) list.getRecord();		 	 
%>  
    
    <TR id=trclear>
		<td NOWRAP align="center" width="10%" valign="top">
			<input type="text" name="E02IFILIN_<%= list.getCurrentRow()%>" size="5" maxlength="3" value="<%= msgRcd.getE02IFILIN().trim()%>" readonly> 
		</td>
		<td NOWRAP align="center" width="40%" valign="top">
			<input type="text" name="E02IFILID_<%= list.getCurrentRow()%>" size="62" maxlength="60" value="<%= msgRcd.getE02IFILID().trim()%>" readonly
			 style=<%=(msgRcd.getE02IFTLIT().equals("T")? "color:green;font-size:12;" : "")%>
			> 
		</td>
		<td NOWRAP align="center" width="20%" valign="top">
			<input name="E02IFIAMT_<%= list.getCurrentRow()%>" size="25" maxlength="20" value="<%= msgRcd.getE02IFIAMT().trim()%>" onKeypress="enterDecimal(event)"
			 type=<%=(msgRcd.getE02IFTLIT().equals("I") || msgRcd.getE02IFTLIT().equals("C") || msgRcd.getE02IFTLIT().equals("B")? "text" : "hidden")%>
			 <%=(msgRcd.getE02IFTLIT().equals("C") || isReadOnly ? "readonly" : "")%>
			> 
		</td>
		<td NOWRAP align="center" width="5%" valign="top">
			<INPUT TYPE=HIDDEN NAME="E02IFTZER_<%= list.getCurrentRow()%>" VALUE="<%= msgRcd.getE02IFTZER().trim()%>">
			<% if (msgRcd.getE02IFTZER().equals("N") && !msgRcd.getE02IFTLIT().equals("T")  ) { %>
				<%=mandatory%>
			<% } %>
		</td>
		<td NOWRAP align="center" width="25%" valign="top">
			<INPUT TYPE=HIDDEN NAME="E02IFTLIT_<%= list.getCurrentRow()%>" VALUE="<%= msgRcd.getE02IFTLIT().trim()%>">
			<INPUT TYPE=HIDDEN NAME="E02IFTNEG_<%= list.getCurrentRow()%>" VALUE="<%= msgRcd.getE02IFTNEG().trim()%>">
			<% if (msgRcd.getE02IFTLIT().equals("C")) { out.print("Calculado"); }
					  	else if (msgRcd.getE02IFTLIT().equals("B")) { out.print("Calculado o Ingresado");  }
						else { out.print(""); } 
			%>
			<% if (!msgRcd.getD02IFIERR().equals("")) { out.print(" - " + msgRcd.getD02IFIERR() + " " + msgRcd.getD02IFIERRD());} %>	
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
  			int pos = list.getFirstRec() - 1000;
  			out.print("<A HREF=\""+request.getContextPath()+"/servlet/datapro.eibs.client.JSESD1095?SCREEN=12&FromRecord=" + pos + "\" > <img src=\""+request.getContextPath()+"/images/e/Regresar.gif\" border=0></A>");
    	} %>
      </TD>
 	  <TD WIDTH="50%" ALIGN=RIGHT height="25"> 
 	  	<%       
    	if (list.getShowNext()) {
  			int pos = list.getLastRec();
  			out.print("<A HREF=\""+request.getContextPath()+"/servlet/datapro.eibs.client.JSESD1095?SCREEN=12&FromRecord=" + pos +  "\" ><img src=\""+request.getContextPath()+"/images/e/Avanzar.gif\" border=0></A>");
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
