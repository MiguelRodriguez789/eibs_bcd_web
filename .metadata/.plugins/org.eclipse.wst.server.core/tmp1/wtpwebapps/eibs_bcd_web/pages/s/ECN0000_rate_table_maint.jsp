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
<jsp:useBean id= "tbRate" class= "datapro.eibs.beans.ECN000003Message"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />
<jsp:useBean id="lnParam" class="datapro.eibs.beans.ECN000002Message"  scope="session" />

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<SCRIPT type="text/javascript">

 function goAction(op) {
   var ok = true;
   if (op == "C") {
   	  ok = confirm("Desea cambiar los valores de Plazo o Montos");
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

<h3 align="center">Tasas de Interes por Plazo vs. Monto<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="rate_table_maint.jsp,ECN0000"></h3>
<hr size="4">

<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.params.JSECN0000">

  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="2">
  <INPUT TYPE=HIDDEN NAME="OPT" VALUE="S">
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
				<td colspan="6">
					<eibsinput:text property="E03CDRDSC" name="tbRate" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>"/>
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
			        	<input type="text" name="E03CDRMIR" size="10" maxlength="10" value="<%= tbRate.getE03CDRMIR()%>" <%if (userPO.getPurpose().equals("READONLY")) {%>readonly<%}%>>
			        </td>      
				  	<td nowrap width="20%"> 
			          <div align="center">Tasa M&aacute;xima : </div>
			        </td>
				  	<td>
				  	   <input type="text" name="E03CDRMXR" size="10" maxlength="10" value="<%= tbRate.getE03CDRMXR()%>" <%if (userPO.getPurpose().equals("READONLY")) {%>readonly<%}%>>
				  	</td>
	  			</tr>
	  			<tr id="trclear">
	  				<td nowrap> 
			          <div align="right">Periodo Base : </div>
			        </td>
			        <td>
			        	<input align="left" type="text" name="E03CDRBAS" size="4" maxlength="3" value="<%= tbRate.getE03CDRBAS()%>" <%if (userPO.getPurpose().equals("READONLY")) {%>readonly<%}%>>
			        </td>      
				  	<td nowrap> 
			          <div align="center">Puntos Base : </div>
			        </td>
				  	<td>
				  	   <input type="text" name="E03CDRBSE" size="10" maxlength="10" value="<%= tbRate.getE03CDRBSE()%>" <%if (userPO.getPurpose().equals("READONLY")) {%>readonly<%}%>>
				  	</td>
	  			</tr>
	  			<tr id="trclear">
	  				<td nowrap> 
			          <div align="right">Tasa Flotante : </div>
			        </td>
			        <td colspan=3>
			              <input type="text" name="E03CDRFTB" size="3" maxlength="2" value="<%= tbRate.getE03CDRFTB().trim()%>" <%if (userPO.getPurpose().equals("READONLY")) {%>readonly<%}%>>
			              <a href="javascript:GetFloating('E03CDRFTB')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="Tabla de Tasas Flotantes" align="middle" border="0" ></a> 
			              <select name="E03CDRFTY">
			                <option value=" " <% if (!(tbRate.getE03CDRFTY().equals("FP") ||tbRate.getE03CDRFTY().equals("FS"))) out.print("selected"); %> <%if (userPO.getPurpose().equals("READONLY")) {%>disabled="disabled"<%}%>></option>
			                <option value="FP" <% if (tbRate.getE03CDRFTY().equals("FP")) out.print("selected"); %>>FP</option>
			                <option value="FS" <% if (tbRate.getE03CDRFTY().equals("FS")) out.print("selected"); %>>FS</option>
			              </select>
				  	</td>      
	  			</tr>
	  			
	  
	  
	  	  			<tr>
	  				<td nowrap> 
			          <div align="right">Tipo de Tasas : </div>
			        </td>
			        <td colspan=3>
			            <p> 
                		<input type="radio" name="H03FLGWK1" value="1" <%if (tbRate.getH03FLGWK1().trim().equals("1")) out.print("checked"); %>>
                		Efectiva 
                		<input type="radio" name="H03FLGWK1" value=" " <%if (!tbRate.getH03FLGWK1().equals("1")) out.print("checked"); %>>
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
			        	<input type="text" name="E03CDRDPE" size="4" maxlength="3" value="<%= tbRate.getE03CDRDPE()%>" <%if (userPO.getPurpose().equals("READONLY")) {%>readonly<%}%>>
			        </td>      
				  	<td width="25%"> 
			          <div align="right">% : </div>
			        </td>
				  	<td width="25%">
				  	   <input type="text" name="E03CDRPRT" size="5" maxlength="5" value="<%= tbRate.getE03CDRPRT()%>" <%if (userPO.getPurpose().equals("READONLY")) {%>readonly<%}%>>
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
      	<input type="hidden" name="E03FLGROW" value="<%= tbRate.getE03FLGROW()%>" >
      	<% if (tbRate.getE03FLGROW().equals("M")){%>
      		Monto
      	<% }else if(tbRate.getE03FLGROW().equals("P")){ %>
      		Plazo
      	<% }else { %>
      		Edad 
      	<% } %>
      </TH>   
    </TR>
    <TR id="trdark">
      <TH ALIGN=CENTER  nowrap >
      	<input type="hidden" name="E03FLGCOL" value="<%= tbRate.getE03FLGCOL()%>" >
      	<% if (tbRate.getE03FLGCOL().equals("M")){%>
      		Monto
      	<% }else if(tbRate.getE03FLGCOL().equals("P")){ %>
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
        	<%if (tbRate.getE03FLGROW().equals("M")){ %>
            <%=Util.formatCCY(tbRate.getField("E03CDUA"+name1).getString().trim())%> 
        	<% }else{ %>
        	<%= tbRate.getField("E03CDUA"+name1).getString().trim()%>
            <% } %>
            <input type="hidden" name="E03CDUA<%=name1%>" size="5" maxlength="13" value="<%= tbRate.getField("E03CDUA"+name1).getString().trim()%>">      	
        <% } else {%>
            <input type="text" name="E03CDUA<%=name1%>" size="5" maxlength="13" value="<%= tbRate.getField("E03CDUA"+name1).getString().trim()%>" <%if (userPO.getPurpose().equals("READONLY")) {%>readonly<%}else{%>onkeypress="enterInteger(event)"<%}%>>      			   
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
		  <% } %>
		</TR>
        <%}%> 
  </TABLE>
  <br>
  <TABLE class=tbenter>
  <%if (!userPO.getPurpose().equals("READONLY")) {%>
  <tr>
  	<td align="center">         
	      <input id="EIBSBTN" type=button name="Submit" value="Enviar" onclick="goAction('S')">
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
