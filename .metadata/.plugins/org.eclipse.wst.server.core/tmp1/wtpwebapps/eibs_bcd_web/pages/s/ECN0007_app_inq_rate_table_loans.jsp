<%@ page import = "datapro.eibs.master.Util" %>
<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput"%>
<%@page import="com.datapro.constants.EibsFields"%>
<%@page import="com.datapro.eibs.constants.HelpTypes"%>
<%@ page import = "datapro.eibs.master.*,datapro.eibs.beans.*" %>
<html>
<head>

<% 
String title = "";

if( null != request.getParameter("OPTION") && "P".equals(request.getParameter("OPTION")) ){
	title = "Tasas Para Prestamos";
} else if( null != request.getParameter("OPTION") && "X".equals(request.getParameter("OPTION")) ){
	title = "Tasas Para Seguros";
}

%>

<title><%=title %></title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "rateInfo" class= "datapro.eibs.beans.ECN000702Message"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>

<script src="<%=request.getContextPath()%>/jquery/readOnlyPage.jsp"> </script>
<script src="<%=request.getContextPath()%>/jquery/readOnlyPage.jsp"> </script>
<script src="<%=request.getContextPath()%>/jquery/markChangedFields.jsp?MSGOBJ=rateInfo"> </script>

<SCRIPT type="text/javascript">

$(document).ready(function(){
	readOnlyPage()
});

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
 
 boolean readOnly=false; 

 	
	if ( userPO.getPurpose().equals("READONLY") ) { 
		  readOnly=true; 
	}	
	
%>

<h3 align="center"><%=title %><img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="rate_table_maint_loans.jsp,ECN0000"></h3>
<hr size="4">

<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.params.JSECN0000">

  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="6">
  <INPUT TYPE=HIDDEN NAME="OPT" VALUE="P">
  <INPUT TYPE=HIDDEN NAME="E72CDRSFL" VALUE="<%= rateInfo.getE72CDRSFL()%>">      

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
					<eibsinput:text property="E72CDRRTB" name="rateInfo" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_INTEGER %>" size="3" maxlength="2" readonly="true"/>
				<td width="16%">
					<div align="right">Fecha Aplicaci&oacute;n :</div>
				</td>
				<td width="16%">
					<eibsinput:date name="rateInfo" fn_year="E72CDRDT3" fn_month="E72CDRDT1" fn_day="E72CDRDT2" readonly="true" />
				<td width="16%">
					<div align="right">Moneda :</div>
				</td>
				<td width="16%">
					<eibsinput:text property="E72CDRCCY" name="rateInfo" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_CURRENCY %>" readonly="true"/>
				</td>
			</tr>
			<tr id="trdark">
				<td width="16%">
					<div align="right">Nombre de Tabla :</div>
				</td>
				<td colspan="6">
					<eibsinput:text property="E72CDRDSC" name="rateInfo" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>"/>
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
      	<input type="hidden" name="E72FLGROW" value="<%= rateInfo.getE72FLGROW()%>" >
      	<% if (rateInfo.getE72FLGROW().equals("M")){%>
      		Monto
      	<% }else if(rateInfo.getE72FLGROW().equals("P")){ %>
      		Plazo
      	<% }else { %>
      		Edad 
      	<% } %>
        <% }else{ %>
         <select name="E72FLGROW">
           <option value="M" <% if (rateInfo.getE72FLGROW().equals("M")) out.print("selected"); %>>Monto</option>
           <option value="P" <% if (rateInfo.getE72FLGROW().equals("P")) out.print("selected"); %>>Plazo</option>
           <option value="E" <% if (rateInfo.getE72FLGROW().equals("E")) out.print("selected"); %>>Edad</option>
          </select>
        <% } %>
      </TH>   
    </TR>
    <TR id="trdark">
      <TH ALIGN=CENTER  nowrap >
	   <% if (userPO.getHeader1().equals("")) {%>  
      	<input type="hidden" name="E72FLGCOL" value="<%= rateInfo.getE72FLGCOL()%>" >
      	<% if (rateInfo.getE72FLGCOL().equals("M")){%>
      		Monto
      	<% }else if(rateInfo.getE72FLGCOL().equals("P")){ %>
      		Plazo
      	<% }else { %>
      		Edad 
      	<% } %>
       <% }else{ %>
        <select name="E72FLGCOL" >
          <option value="M" <% if (rateInfo.getE72FLGCOL().equals("M")) out.print("selected"); %>>Monto</option>
          <option value="P" <% if (rateInfo.getE72FLGCOL().equals("P")) out.print("selected"); %>>Plazo</option>
          <option value="E" <% if (rateInfo.getE72FLGCOL().equals("E")) out.print("selected"); %>>Edad</option>
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
        	<%if (rateInfo.getE72FLGROW().equals("M")){ %>
        		<%=Util.formatCCY(rateInfo.getField("E72CDUA"+name1).getString().trim())%>
        	<% }else{ %>
            	<%=rateInfo.getField("E72CDUA"+name1).getString().trim()%>
            <% } %>
            <input type="hidden" name="E72CDUA<%=i%>" value="<%= rateInfo.getField("E72CDUA"+name1).getString().trim()%>" >
        <% } else {%>
      		<input type="text" name="E72CDUA<%=i%>" value="<%= rateInfo.getField("E72CDUA"+name1).getString().trim()%>" size=12 maxlength=12 <%if (userPO.getPurpose().equals("READONLY")) {%>readonly<%}else{%>onkeypress="enterDecimal()"<%}%>>
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
           		<%if (rateInfo.getE72FLGCOL().equals("M")){ %>
           			<%= Util.formatCCY(rateInfo.getField("E72CDD"+name2).getString().trim())%>
         		<% }else{ %>
         			<%= rateInfo.getField("E72CDD"+name2).getString().trim()%>
       			<% } %>
          	<input type="hidden" name="E72CDD<%=name2%>" size="5" maxlength="4" value="<%= rateInfo.getField("E72CDD"+name2).getString().trim()%>">      	
		   <% } else {%>
		    <input type="text" name="E72CDD<%=name2%>" size="5" maxlength="4" value="<%= rateInfo.getField("E72CDD"+name2).getString().trim()%>" <%if (userPO.getPurpose().equals("READONLY")) {%>readonly<%}else{%>onkeypress="enterInteger(event)"<%}%>>      			   
		   <% } %>
		  </td>
      	  <% 
      		for(int j=1; j<8;j++) {
      		  name1= ""+ j + name2;
     	  %>
          <td NOWRAP align=center>
          	<input type="text" name="E72CL<%=name1%>" size="10" maxlength="10" value="<%= rateInfo.getField("E72CL"+name1).getString().trim()%>" <%if (userPO.getPurpose().equals("READONLY")) {%>readonly<%}else{%>onkeypress="enterRate(event)"<%}%>>      	
		  </td>		  
		  <%}%>
		</TR>
        <%}%> 
  </TABLE>
  <br>
  
</form>
</body>
</html>
