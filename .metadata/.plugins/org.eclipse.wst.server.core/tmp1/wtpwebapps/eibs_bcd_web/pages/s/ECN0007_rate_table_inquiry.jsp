<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<%@ page import = "datapro.eibs.master.Util" %>
<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput"%>
<%@page import="com.datapro.constants.EibsFields"%>
<%@page import="com.datapro.eibs.constants.HelpTypes"%>
<html>
<head>
<%@ page import = "datapro.eibs.master.*,datapro.eibs.beans.*" %>
<title>Consulta de tasas</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "tbRate" class= "datapro.eibs.beans.ECN000703Message"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<SCRIPT type="text/javascript">

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

<h3 align="center">Consulta de Tasas <%	if(tbRate.getE73CDRSFL().equals(" ")){%>
	 de Plazo vs Monto
<%
	}
	else if(tbRate.getE73CDRSFL().equals("S")){%>
	 de Pizarra
	<%}%>

<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="rate_table_inquiry.jsp,ECN0007"></h3>
<hr size="4">

<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.params.JSECN0000A">

  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="20">
  <INPUT TYPE=HIDDEN NAME="E73CDRSFL" VALUE="<%= tbRate.getE73CDRSFL()%>">      

<%int row = 0; %>
<TABLE class="tableinfo">
    <TR>
    <TD>
		<TABLE width="100%">
			<tr id="trdark">
				<td>
				<div align="right">N&uacute;mero de Tabla :</div>
				</td>
				<td><input type="text" name="E73CDRRTB" size="3" maxlength="2"
					value="<%= tbRate.getE73CDRRTB()%>" <%if (userPO.getPurpose().equals("READONLY")) {%>readonly<%}%>></td>
				<td>
				<div align="right">Nombre de Tabla :</div>
				</td>
				<td width="339"><input type="text" name="E73CDRDSC" size="48"
					maxlength="45" value="<%= tbRate.getE73CDRDSC()%>" <%if (userPO.getPurpose().equals("READONLY")) {%>readonly<%}%>></td>
			</tr>
			<tr id="trdark">
				<td>
				<div align="right">Fecha Aplicaci&oacute;n :</div>
				</td>
				<td>
					<eibsinput:date name="tbRate" fn_year="E73CDRDT3" fn_month="E73CDRDT1" fn_day="E73CDRDT2" required="false" readonly="<%=readOnly%>"/>
			
				<td>
				<div align="right">Moneda :</div>
				</td>
				<td width="239"><input type="text" name="E73CDRCCY" size="3"
					maxlength="3" value="<%= tbRate.getE73CDRCCY()%>" <%if (userPO.getPurpose().equals("READONLY")) {%>readonly<%}%>>Expresados en cientos
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
			        	<input type="text" name="E73CDRMIR" size="10" maxlength="10" value="<%= tbRate.getE73CDRMIR()%>" <%if (userPO.getPurpose().equals("READONLY")) {%>readonly<%}%>>
			        </td>      
				  	<td nowrap width="20%"> 
			          <div align="center">Tasa M&aacute;xima : </div>
			        </td>
				  	<td>
				  	   <input type="text" name="E73CDRMXR" size="10" maxlength="10" value="<%= tbRate.getE73CDRMXR()%>" <%if (userPO.getPurpose().equals("READONLY")) {%>readonly<%}%>>
				  	</td>
	  			</tr>
	  			<tr id="trclear">
	  				<td nowrap> 
			          <div align="right">Periodo Base : </div>
			        </td>
			        <td>
			        	<input align="left" type="text" name="E73CDRBAS" size="4" maxlength="3" value="<%= tbRate.getE73CDRBAS()%>" <%if (userPO.getPurpose().equals("READONLY")) {%>readonly<%}%>>
			        </td>      
				  	<td nowrap> 
			          <div align="center">Puntos Base : </div>
			        </td>
				  	<td>
				  	   <input type="text" name="E73CDRBSE" size="10" maxlength="10" value="<%= tbRate.getE73CDRBSE()%>" <%if (userPO.getPurpose().equals("READONLY")) {%>readonly<%}%>>
				  	</td>
	  			</tr>
	  			<tr id="trclear">
	  				<td nowrap> 
			          <div align="right">Tasa Flotante : </div>
			        </td>
			        <td colspan=3>
			              <input type="text" name="E73CDRFTB" size="3" maxlength="2" value="<%= tbRate.getE73CDRFTB().trim()%>" <%if (userPO.getPurpose().equals("READONLY")) {%>readonly<%}%>>
			              <a href="javascript:GetFloating('E73CDRFTB')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="Tabla de Tasas Flotantes" align="middle" border="0" ></a> 
			              <select name="E73CDRFTY">
			                <option value=" " <% if (!(tbRate.getE73CDRFTY().equals("FP") ||tbRate.getE73CDRFTY().equals("FS"))) out.print("selected"); %> <%if (userPO.getPurpose().equals("READONLY")) {%>disabled="disabled"<%}%>></option>
			                <option value="FP" <% if (tbRate.getE73CDRFTY().equals("FP")) out.print("selected"); %>>FP</option>
			                <option value="FS" <% if (tbRate.getE73CDRFTY().equals("FS")) out.print("selected"); %>>FS</option>
			              </select>
				  	</td>      
	  			</tr>
	  			
	  
	  
	  	  			<tr>
	  				<td nowrap> 
			          <div align="right">Tipo de Tasas : </div>
			        </td>
			        <td colspan=3>
			            <p> 
                		<input type="radio" name="TYP" value="1" <%if (tbRate.getH73FLGWK1().trim().equals("1")) out.print("checked"); %>>
                		Efectiva 
                		<input type="radio" name="TYP" value=" " <%if (!tbRate.getH73FLGWK1().equals("1")) out.print("checked"); %>>
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
			        	<input type="text" name="E73CDRDPE" size="4" maxlength="3" value="<%= tbRate.getE73CDRDPE()%>" <%if (userPO.getPurpose().equals("READONLY")) {%>readonly<%}%>>
			        </td>      
				  	<td width="25%"> 
			          <div align="right">% : </div>
			        </td>
				  	<td width="25%">
				  	   <input type="text" name="E73CDRPRT" size="5" maxlength="5" value="<%= tbRate.getE73CDRPRT()%>" <%if (userPO.getPurpose().equals("READONLY")) {%>readonly<%}%>>
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
      <TH ALIGN=CENTER  nowrap colspan=7>Montos Hasta:</TH>   
    </TR>
    <TR id="trdark">
      <TH ALIGN=CENTER  nowrap >Plazo</TH>
      <%
      String name1= "";
      String name2= ""; 
      for(int i=1; i<8;i++) {
        name1= ""+i;
      %> 
      <TH ALIGN=CENTER  nowrap>
        <% if (userPO.getHeader1().equals("")) {%>
            <%= tbRate.getField("E73CDUA"+name1).getString().trim()%>
            <input type="hidden" name="E73CDUA<%=i%>" value="<%= tbRate.getField("E73CDUA"+name1).getString().trim()%>">
        <% } else {%>
      		<input type="text" name="E73CDUA<%=i%>" value="<%= tbRate.getField("E73CDUA"+name1).getString().trim()%>" size=12 maxlength=12 <%if (userPO.getPurpose().equals("READONLY")) {%>readonly<%}else{%>onkeypress="enterDecimal()"<%}%>>
      	<% } %>
      </TH> 
      <% } %>  
    </TR>
      <%
       for(int i=1;i<16; i++) { 
         name2=(i<10)? "0"+i: ""+i;                               
       %>             
                    
        <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
          <td align="center" >
           <% if (userPO.getHeader1().equals("")) {%>
            <%= tbRate.getField("E73CDD"+name2).getString().trim()%>
          	<input type="hidden" name="E73CDD<%=name2%>" size="5" maxlength="4" value="<%= tbRate.getField("E73CDD"+name2).getString().trim()%>">      	
		   <% } else {%>
		    <input type="text" name="E73CDD<%=name2%>" size="5" maxlength="4" value="<%= tbRate.getField("E73CDD"+name2).getString().trim()%>" <%if (userPO.getPurpose().equals("READONLY")) {%>readonly<%}else{%>onkeypress="enterInteger(event)"<%}%>>      			   
		   <% } %>
		  </td>
      	  <% 
      		for(int j=1; j<8;j++) {
      		  name1= ""+ j + name2;
     	  %>
          <td NOWRAP align=center>
          	<input type="text" name="E73CL<%=name1%>" size="10" maxlength="10" value="<%= tbRate.getField("E73CL"+name1).getString().trim()%>" <%if (userPO.getPurpose().equals("READONLY")) {%>readonly<%}else{%>onkeypress="enterRate(event)"<%}%>>      	
		  </td>		  
		  <% } %>
		</TR>
        <%}%> 
  </TABLE>
  <br>
  <TABLE class=tbenter>
  <tr>
  	<td align="center">         
      <div align="center"><a id="EIBSBTN" href="<%=request.getContextPath()%>/pages/background.jsp"><b>Salir</b></a></div>
  	</td>
  </tr>

  </TABLE>
  <%if (!userPO.getHeader1().equals("")) {%>
    <SCRIPT type="text/javascript">
   		document.forms[0].E73CDUA1.focus();
	    document.forms[0].E73CDUA1.select(); 	
    </SCRIPT>
  <%}%>
</form>
</body>
</html>
