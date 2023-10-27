<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<%@ page import = "datapro.eibs.master.Util" %>
<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput"%>
<%@page import="com.datapro.constants.EibsFields"%>
<%@page import="com.datapro.eibs.constants.HelpTypes"%>

<%@ page import = "datapro.eibs.master.*,datapro.eibs.beans.*" %>
<title>Tabla de Renovaci&oacute;n de Certificados de Dep&oacute;sitos</title>
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

<h3 align="center">Tasas de Interes por Plazo vs. Monto<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="rate_table_maint.jsp,ECN0000"></h3>
<hr size="4">

<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.params.JSECN0000">

  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="2">
  <INPUT TYPE=HIDDEN NAME="OPT" VALUE="S">
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
  	  
<h4>Datos B&aacute;sicos</h4>	  
<TABLE class="tableinfo">
    <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
    <TD> 
   <TABLE width=100%>	  
	  <tr id=trdark>
	    <td width=50% align=center><b>Datos</b></td>
	    <td width=50% align=center><b>Penalidad x Precancelaci&oacute;n</b></td>
	  </tr>
	  <tr> 
	    <td valign=top>
	    	 <TABLE>	  
	  			<tr id="trclear">
	  				<td nowrap width="30%"> 
			          <div align="right">Tasa M&iacute;nima : </div>
			        </td>
			        <td >
			        	<input type="text" name="E72CDRMIR" size="10" maxlength="10" value="<%= rateInfo.getE72CDRMIR()%>" <%if (userPO.getPurpose().equals("READONLY")) {%>readonly<%}%>>
			        </td>      
				  	<td nowrap width="20%"> 
			          <div align="center">Tasa M&aacute;xima : </div>
			        </td>
				  	<td>
				  	   <input type="text" name="E72CDRMXR" size="10" maxlength="10" value="<%= rateInfo.getE72CDRMXR()%>" <%if (userPO.getPurpose().equals("READONLY")) {%>readonly<%}%>>
				  	</td>
	  			</tr>
	  			<tr id="trclear">
	  				<td nowrap> 
			          <div align="right">Periodo Base : </div>
			        </td>
			        <td>
			        	<input align="left" type="text" name="E72CDRBAS" size="4" maxlength="3" value="<%= rateInfo.getE72CDRBAS()%>" <%if (userPO.getPurpose().equals("READONLY")) {%>readonly<%}%>>
			        </td>      
				  	<td nowrap> 
			          <div align="center">Puntos Base : </div>
			        </td>
				  	<td>
				  	   <input type="text" name="E72CDRBSE" size="10" maxlength="10" value="<%= rateInfo.getE72CDRBSE()%>" <%if (userPO.getPurpose().equals("READONLY")) {%>readonly<%}%>>
				  	</td>
	  			</tr>
	  			<tr id="trclear">
	  				<td nowrap> 
			          <div align="right">Tasa Flotante : </div>
			        </td>
			        <td colspan=3>
			              <input type="text" name="E72CDRFTB" size="3" maxlength="2" value="<%= rateInfo.getE72CDRFTB().trim()%>" <%if (userPO.getPurpose().equals("READONLY")) {%>readonly<%}%>>
			              <a href="javascript:GetFloating('E72CDRFTB')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="Tabla de Tasas Flotantes" align="middle" border="0" ></a> 
			              <select name="E72CDRFTY">
			                <option value=" " <% if (!(rateInfo.getE72CDRFTY().equals("FP") ||rateInfo.getE72CDRFTY().equals("FS"))) out.print("selected"); %> <%if (userPO.getPurpose().equals("READONLY")) {%>disabled="disabled"<%}%>></option>
			                <option value="FP" <% if (rateInfo.getE72CDRFTY().equals("FP")) out.print("selected"); %>>FP</option>
			                <option value="FS" <% if (rateInfo.getE72CDRFTY().equals("FS")) out.print("selected"); %>>FS</option>
			              </select>
				  	</td>      
	  			</tr>
	  			
	  
	  
	  	  			<tr>
	  				<td nowrap> 
			          <div align="right">Tipo de Tasas : </div>
			        </td>
			        <td colspan=3>
			            <p> 
                		<input type="radio" name="H72FLGWK1" value="1" <%if (rateInfo.getH72FLGWK1().trim().equals("1")) out.print("checked"); %>>
                		Efectiva 
                		<input type="radio" name="H72FLGWK1" value=" " <%if (!rateInfo.getH72FLGWK1().equals("1")) out.print("checked"); %>>
                		Nominal 
                		</p>
				  	</td>      
	  			</tr>
	  			
	  	     </TABLE>
	    </td>
	    <td valign=top>
	    	 <TABLE>	  
	  			<tr id="trclear">
	  				<td width="25%"> 
			          <div align="right">Dias : </div>
			        </td>
			        <td width="10%">
			        	<input type="text" name="E72CDRDPE" size="4" maxlength="3" value="<%= rateInfo.getE72CDRDPE()%>" <%if (userPO.getPurpose().equals("READONLY")) {%>readonly<%}%>>
			        </td>      
				  	<td width="25%"> 
			          <div align="right">% : </div>
			        </td>
				  	<td width="25%">
				  	   <input type="text" name="E72CDRPRT" size="5" maxlength="5" value="<%= rateInfo.getE72CDRPRT()%>" <%if (userPO.getPurpose().equals("READONLY")) {%>readonly<%}%>>
				  	</td>
	  			</tr>
	  	     </TABLE>	
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
      	<input type="hidden" name="E72FLGROW" value="<%= rateInfo.getE72FLGROW()%>" >
      	<% if (rateInfo.getE72FLGROW().equals("M")){%>
      		Monto
      	<% }else if(rateInfo.getE72FLGROW().equals("P")){ %>
      		Plazo
      	<% }else { %>
      		Edad 
      	<% } %>
      </TH>   
    </TR>
    <TR id="trdark">
      <TH ALIGN=CENTER  nowrap >
      	<input type="hidden" name="E72FLGCOL" value="<%= rateInfo.getE72FLGCOL()%>" >
      	<% if (rateInfo.getE72FLGCOL().equals("M")){%>
      		Monto
      	<% }else if(rateInfo.getE72FLGCOL().equals("P")){ %>
      		Plazo
      	<% }else { %>
      		Edad 
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
      		<input type="text" name="E72CDUA<%=i%>" value="<%= rateInfo.getField("E72CDUA"+name1).getString().trim()%>" size=12 maxlength=12 <%if (userPO.getPurpose().equals("READONLY")) {%>readonly<%}else{%>onkeypress="enterInteger(event)"<%}%>>
        	<% }else{ %>
      		<input type="text" name="E72CDUA<%=i%>" value="<%= rateInfo.getField("E72CDUA"+name1).getString().trim()%>" size=12 maxlength=12 <%if (userPO.getPurpose().equals("READONLY")) {%>readonly<%}else{%>onkeypress="enterInteger(event)"<%}%>>
            <% } %>
        <% } else {%>
      		<input type="text" name="E72CDUA<%=i%>" value="<%= rateInfo.getField("E72CDUA"+name1).getString().trim()%>" size=12 maxlength=12 <%if (userPO.getPurpose().equals("READONLY")) {%>readonly<%}else{%>onkeypress="enterInteger(event)"<%}%>>
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
		  <% } %>
		</TR>
        <%}%> 
  </TABLE>
  
  <br>

  <%if (!userPO.getHeader1().equals("")) {%>
    <SCRIPT type="text/javascript">
   		document.forms[0].E72CDUA1.focus();
	    document.forms[0].E72CDUA1.select(); 	
    </SCRIPT>
  <%}%>
</form>
</body>
</html>
