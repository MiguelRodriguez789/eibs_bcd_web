<%@ page import = "datapro.eibs.master.Util" %>
<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput"%>
<%@page import="com.datapro.constants.EibsFields"%>
<%@page import="com.datapro.eibs.constants.HelpTypes"%>
<%@ page import = "datapro.eibs.master.*,datapro.eibs.beans.*" %>
<html>
<head>
<title>Tasas de Pizarra</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "tbRate" class= "datapro.eibs.beans.ECN000003Message"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />
<jsp:useBean id="lnParam" class="datapro.eibs.beans.ECN000002Message"  scope="session" />

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<SCRIPT type="text/javascript">

 function goAction(op) {
   var ok = true;
   if (op == "C") {
   	  ok = confirm("Desea cambiar los valores de Plazo o Montos?");
   }
   if (ok) {
   	document.forms[0].OPT.value = op;
   	document.forms[0].submit(); 
   }	 
 }

</SCRIPT>


<script src="<%=request.getContextPath()%>/jquery/readOnlyPage.jsp"> </script>

</head>

<body>

<% 
 if ( !error.getERRNUM().equals("0")  ) {
     out.println("<SCRIPT Language=\"Javascript\">");
	 error.setERRNUM("0");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
 }
 
 boolean readOnly=false; 

 	
	if ( userPO.getPurpose().equals("READONLY") ) { 
		  readOnly=true; 
	}	
	
%>

<h3 align="center">Tasas para Prestamos<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="rate_table_maint_loans.jsp,ECN0000"></h3>
<hr size="4">

<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.params.JSECN0000">

  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="6">
  <INPUT TYPE=HIDDEN NAME="OPT" VALUE="P">
  <INPUT TYPE=HIDDEN NAME="E03CDRSFL" VALUE="<%= tbRate.getE03CDRSFL()%>">      

<%int row = 0; %>
<TABLE class="tableinfo">
    <TR>
    <TD>
		<TABLE width="100%">
			<tr id="trdark">
				<td width="16%">
					<div align="right">N&uacute;mero de Tabla :</div>
				</td>
				<td width="16%">
					<eibsinput:text property="E03CDRRTB" name="tbRate" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_INTEGER %>" size="3" maxlength="2" readonly="true"/>
				<td width="16%">
					<div align="right">Fecha Aplicaci&oacute;n :</div>
				</td>
				<td width="16%">
					<eibsinput:date name="tbRate" fn_year="E03CDRDTY" fn_month="E03CDRDTM" fn_day="E03CDRDTD" readonly="true" />
				<td width="16%">
					<div align="right">Moneda :</div>
				</td>
				<td width="16%">
					<eibsinput:text property="E03CDRCCY" name="tbRate" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_CURRENCY %>" readonly="true"/>
				</td>
			</tr>
			<tr id="trdark">
				<td width="16%">
					<div align="right">Nombre de Tabla :</div>
				</td>
				<td colspan="3">
					<eibsinput:text property="E03CDRDSC" name="tbRate" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>"/>
				</td>
				<td width="16%">
					<div align="right">Moneda Referencial :</div>
				</td>
				<td width="16%">
					<select name="H03FLGWK2" >
						<option value=" " <%if (tbRate.getH03FLGWK2().equals(" ")) { out.print("selected"); }%>>Moneda del Producto</option>
						<option value="6" <%if (tbRate.getH03FLGWK2().equals("6")) { out.print("selected"); }%>>SMMLV </option>
					</select>
				</td>
			</tr>
		</TABLE>
		</TD>
  </TR>
</TABLE>	  

 <br> 
  <TABLE class="tableinfo">
    <TR id="trdark">
      <TH ALIGN=CENTER  nowrap width=3%></TH> 
      <TH ALIGN=CENTER  nowrap colspan=7>
      <% if (userPO.getHeader1().equals("")) {%>  
      	<input type="hidden" name="E03FLGROW" value="<%= tbRate.getE03FLGROW()%>" >
      	<% if (tbRate.getE03FLGROW().equals("M")){%>
      		Monto
      	<% }else if(tbRate.getE03FLGROW().equals("P")){ %>
      		Plazo
      	<% }else { %>
      		Edad 
      	<% } %>
        <% }else{ %>
         <select name="E03FLGROW">
           <option value="M" <% if (tbRate.getE03FLGROW().equals("M")) out.print("selected"); %>>Monto</option>
           <option value="P" <% if (tbRate.getE03FLGROW().equals("P")) out.print("selected"); %>>Plazo</option>
           <option value="E" <% if (tbRate.getE03FLGROW().equals("E")) out.print("selected"); %>>Edad</option>
          </select>
        <% } %>
      </TH>   
    </TR>
    <TR id="trdark">
      <TH ALIGN=CENTER  nowrap >
	   <% if (userPO.getHeader1().equals("")) {%>  
      	<input type="hidden" name="E03FLGCOL" value="<%= tbRate.getE03FLGCOL()%>" >
      	<% if (tbRate.getE03FLGCOL().equals("M")){%>
      		Monto
      	<% }else if(tbRate.getE03FLGCOL().equals("P")){ %>
      		Plazo
      	<% }else { %>
      		Edad 
      	<% } %>
       <% }else{ %>
        <select name="E03FLGCOL" >
          <option value="M" <% if (tbRate.getE03FLGCOL().equals("M")) out.print("selected"); %>>Monto</option>
          <option value="P" <% if (tbRate.getE03FLGCOL().equals("P")) out.print("selected"); %>>Plazo</option>
          <option value="E" <% if (tbRate.getE03FLGCOL().equals("E")) out.print("selected"); %>>Edad</option>
         </select>
        <% } %>
       </TH>
      <%
      String name1= "";
      String name2= ""; 
      for(int i=1; i<8;i++) {
        name1= ""+i;
      %> 
      <TH ALIGN=CENTER  nowrap>
        <% if (userPO.getHeader1().equals("")) {%>
        	<%if (tbRate.getE03FLGROW().equals("M")){ %>
        		<%=Util.formatCCY(tbRate.getField("E03CDUA"+name1).getString().trim())%>
        	<% }else{ %>
            	<%=tbRate.getField("E03CDUA"+name1).getString().trim()%>
            <% } %>
            <input type="hidden" name="E03CDUA<%=i%>" value="<%= tbRate.getField("E03CDUA"+name1).getString().trim()%>" >
        <% } else {%>
      		<input type="text" name="E03CDUA<%=i%>" value="<%= tbRate.getField("E03CDUA"+name1).getString().trim()%>" size=12 maxlength=12 <%if (userPO.getPurpose().equals("READONLY")) {%>readonly<%}else{%>onkeypress="enterDecimal()"<%}%>>
      	<% } %>
      </TH> 
      <% } %>  
    </TR>
      <%
       for(int i=1;i<16; i++) { 
         name2=(i<10)? "0"+i: ""+i;                               
       %>             
                    
        <tr id="trclear">
          <td align="center" >
           <% if (userPO.getHeader1().equals("")) {%>
           		<%if (tbRate.getE03FLGCOL().equals("M")){ %>
           			<%= Util.formatCCY(tbRate.getField("E03CDD"+name2).getString().trim())%>
         		<% }else{ %>
         			<%= tbRate.getField("E03CDD"+name2).getString().trim()%>
       			<% } %>
          	<input type="hidden" name="E03CDD<%=name2%>" size="5" maxlength="4" value="<%= tbRate.getField("E03CDD"+name2).getString().trim()%>">      	
		   <% } else {%>
		    <input type="text" name="E03CDD<%=name2%>" size="5" maxlength="4" value="<%= tbRate.getField("E03CDD"+name2).getString().trim()%>" <%if (userPO.getPurpose().equals("READONLY")) {%>readonly<%}else{%>onkeypress="enterInteger(event)"<%}%>>      			   
		   <% } %>
		  </td>
      	  <% 
      		for(int j=1; j<8;j++) {
      		  name1= ""+ j + name2;
     	  %>
          <td NOWRAP align=center>
          	<input type="text" name="E03CL<%=name1%>" size="10" maxlength="10" value="<%= tbRate.getField("E03CL"+name1).getString().trim()%>" <%if (userPO.getPurpose().equals("READONLY")) {%>readonly<%}else{%>onkeypress="enterRate(event)"<%}%>>      	
		  </td>		  
		  <%}%>
		</TR>
        <%}%> 
  </TABLE>
  <br>
  
  <TABLE class=tbenter>
  <%if (!userPO.getPurpose().equals("READONLY")) {%>
  <tr>
  	<td align="center">         
	      <input id="EIBSBTN" type=button name="Submit" value="Enviar" onclick="goAction('P')">
  	</td>
  	<td align="center">         
	      <input id="EIBSBTN" type=button name="Submit" value="Valores" onclick="goAction('C')">
    </td>
  </tr>
  <%}%>
  </TABLE>
  <%if (!userPO.getHeader1().equals("")) {%>
    <SCRIPT type="text/javascript">
   		document.forms[0].E03CDUA1.focus();
	    document.forms[0].E03CDUA1.select(); 	
    </SCRIPT>
  <%}%>
</form>
</body>
</html>
