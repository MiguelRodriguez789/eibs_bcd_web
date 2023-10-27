<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<%@ page import = "datapro.eibs.master.*,datapro.eibs.beans.*" %>
<title>Tabla Tasa Maxima Convencional</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "tbRate" class= "datapro.eibs.beans.EUU001002Message"  scope="session" />
<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<SCRIPT Language="javascript">
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
%>

<h3 align="center"><% if (userPO.getPurpose().equals("DELETE  ")) out.print("Eliminacion "); else out.print("Mantencion "); %>Tasa Maxima Convencional<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="rate_table_maint.jsp,EUU0010"></h3>
<hr size="4">

<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.params.JSEUU0010">

  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="2">
 
<TABLE class="tableinfo">
    <TR>
    <TD>
		<TABLE width="102%">
			<tr id="trdark">
				<td>
				<div align="right">Banco :</div>
				</td>
				<td><input type="text" name="E02USUBNK" size="3" maxlength="2" readonly
					value="<%= tbRate.getE02USUBNK()%>"></td>
				<td>
				<div align="right">Moneda :</div>
				</td>
				<td><input type="text" name="E02USUCCY" size="3" maxlength="3" readonly
					value="<%= tbRate.getE02USUCCY()%>"></td>					
			</tr>	
			<tr id="trclear">
				<td>
				<div align="right">Fecha Aplicaci&oacute;n :</div>
				</td>
				<td><input type="text" name="E02USUDDD" size="3" maxlength="2" readonly
					onkeypress="enterInteger(event)" value="<%= tbRate.getE02USUDDD()%>"> 
					<input type="text" name="E02USUDMM" size="3" maxlength="2" readonly
					onkeypress="enterInteger(event)" value="<%= tbRate.getE02USUDMM()%>"> 
					<input type="text" name="E02USUDYY" size="5" maxlength="4" readonly
					onkeypress="enterInteger(event)" value="<%= tbRate.getE02USUDYY()%>"></td>

				<td>
				<div align="right">Plazo :</div> 
				</td>
				<td width="239"><input type="text" name="E02USUPZO" size="5" readonly
					maxlength="5" value="<%= tbRate.getE02USUPZO()%>" >
				</td>
			</tr>	
			<tr id="trdark">  
				<td>
				<div align="right">Moneda Monto :</div>
				</td>
				<td><input type="text" name="E02USURCY" size="3" maxlength="3" readonly
					value="<%= tbRate.getE02USURCY()%>" ></td>
				<td>
				<div align="right">Dias Base :</div>
				</td>
				<td width="339"><input type="text" name="E02USUBSE" size="4" readonly
					maxlength="4" value="<%= tbRate.getE02USUBSE()%>" ></td>
			</tr>

		</TABLE>
		</TD>
  </TR>
  </TABLE>	  
<% if (userPO.getPurpose().equals("MAINTENANCE")) { %>
  <TABLE class="tableinfo">
    <TR id="trclear">
      <TH ALIGN=CENTER  nowrap width="5%">Secuencia</TH>
      <TH ALIGN=CENTER  nowrap >Montos Desde:</TH> 
      <TH ALIGN=CENTER  nowrap >Montos Hasta:</TH>
      <TH ALIGN=CENTER  nowrap >Tasa Minima:</TH> 
      <TH ALIGN=CENTER  nowrap >Tasa Maxima:</TH> 
    </TR>  
     <TR align="center" id=trdark>                           <%-- Secuencia 01  align="right"--%>
     <td >
      <input size="3" maxlength="2" value="01" readonly>
      </td>
      <td >
	  <input type="text" name="E02MMI01" size="15" maxlength="15" value="<%= tbRate.getE02MMI01().trim()%>" onkeypress="enterInteger(event)">
	  </td>
	  <td >   
	  <input type="text" name="E02MMA01" size="15" maxlength="15" value="<%= tbRate.getE02MMA01().trim()%>" onkeypress="enterInteger(event)">
	  </td>
	  <td >   
	  <input type="text" name="E02TMI01" size="10" maxlength="10" value="<%= tbRate.getE02TMI01().trim()%>" onkeypress="enterRate()">
	  </td>
	  <td >    
	  <input type="text" name="E02TMA01" size="10" maxlength="10" value="<%= tbRate.getE02TMA01().trim()%>" onkeypress="enterRate()">    	  	  	   			   
      </td>
     </TR>
     <TR align="center" id=trdark>                           <%-- Secuencia 02 --%>
     <td >
      <input size="3" maxlength="2" value="02" readonly>
      </td>
      <td >
	  <input type="text" name="E02MMI02" size="15" maxlength="15" value="<%= tbRate.getE02MMI02().trim()%>" onkeypress="enterInteger(event)">
	  </td>
	  <td >   
	  <input type="text" name="E02MMA02" size="15" maxlength="15" value="<%= tbRate.getE02MMA02().trim()%>" onkeypress="enterInteger(event)">
	  </td>
	  <td >    
	  <input type="text" name="E02TMI02" size="10" maxlength="10" value="<%= tbRate.getE02TMI02().trim()%>" onkeypress="enterRate()">
	  </td>
	  <td >    
	  <input type="text" name="E02TMA02" size="10" maxlength="10" value="<%= tbRate.getE02TMA02().trim()%>" onkeypress="enterRate()">    	  	  	   			   
     </td>
     </TR>
     <TR align="center" id=trdark>                           <%-- Secuencia 03 --%>
     <td >
      <input size="3" maxlength="2" value="03" readonly>
      </td>
      <td >
	  <input type="text" name="E02MMI03" size="15" maxlength="15" value="<%= tbRate.getE02MMI03().trim()%>" onkeypress="enterInteger(event)">
	  </td>
	  <td >   
	  <input type="text" name="E02MMA03" size="15" maxlength="15" value="<%= tbRate.getE02MMA03().trim()%>" onkeypress="enterInteger(event)">
	  </td>
	  <td >    
	  <input type="text" name="E02TMI03" size="10" maxlength="10" value="<%= tbRate.getE02TMI03().trim()%>" onkeypress="enterRate()">
	  </td>
	  <td >    
	  <input type="text" name="E02TMA03" size="10" maxlength="10" value="<%= tbRate.getE02TMA03().trim()%>" onkeypress="enterRate()">    	  	  	   			   
     </td>
     </TR>
     <TR align="center" id=trdark>                           <%-- Secuencia 04 --%>
     <td>
      <input size="3" maxlength="2" value="04" readonly>
      </td>
      <td >
	  <input type="text" name="E02MMI04" size="15" maxlength="15" value="<%= tbRate.getE02MMI04().trim()%>" onkeypress="enterInteger(event)">
	  </td>
	  <td >   
	  <input type="text" name="E02MMA04" size="15" maxlength="15" value="<%= tbRate.getE02MMA04().trim()%>" onkeypress="enterInteger(event)">
	  </td>
	  <td >    
	  <input type="text" name="E02TMI04" size="10" maxlength="10" value="<%= tbRate.getE02TMI04().trim()%>" onkeypress="enterRate()">
	  </td>
	  <td >    
	  <input type="text" name="E02TMA04" size="10" maxlength="10" value="<%= tbRate.getE02TMA04().trim()%>" onkeypress="enterRate()">    	  	  	   			   
     </td>
     </TR>
                                
  </TABLE>
<% } else { %>
  <TABLE class="tableinfo">
    <TR id="trclear">
      <TH ALIGN=CENTER  nowrap width="5%">Secuencia</TH>
      <TH ALIGN=CENTER  nowrap >Montos Desde:</TH> 
      <TH ALIGN=CENTER  nowrap >Montos Hasta:</TH>
      <TH ALIGN=CENTER  nowrap >Tasa Minima:</TH> 
      <TH ALIGN=CENTER  nowrap >Tasa Maxima:</TH> 
    </TR>                              
     <TR align="center" id=trdark>                           <%-- Secuencia 01  align="right"--%>
     <td >
      <input size="3" maxlength="2" value="01" readonly>
      </td>
      <td >
	  <input type="text" name="E02MMI01" size="15" maxlength="15" value="<%= tbRate.getE02MMI01().trim()%>" readonly>
	  </td>
	  <td >   
	  <input type="text" name="E02MMA01" size="15" maxlength="15" value="<%= tbRate.getE02MMA01().trim()%>" readonly>
	  </td>
	  <td >   
	  <input type="text" name="E02TMI01" size="10" maxlength="10" value="<%= tbRate.getE02TMI01().trim()%>" readonly>
	  </td>
	  <td >    
	  <input type="text" name="E02TMA01" size="10" maxlength="10" value="<%= tbRate.getE02TMA01().trim()%>" readonly>    	  	  	   			   
      </td>
     </TR>
     <TR align="center" id=trdark>                           <%-- Secuencia 02 --%>
     <td >
      <input size="3" maxlength="2" value="02" readonly>
      </td>
      <td >
	  <input type="text" name="E02MMI02" size="15" maxlength="15" value="<%= tbRate.getE02MMI02().trim()%>" readonly>
	  </td>
	  <td >   
	  <input type="text" name="E02MMA02" size="15" maxlength="15" value="<%= tbRate.getE02MMA02().trim()%>" readonly>
	  </td>
	  <td >    
	  <input type="text" name="E02TMI02" size="10" maxlength="10" value="<%= tbRate.getE02TMI02().trim()%>" readonly>
	  </td>
	  <td >    
	  <input type="text" name="E02TMA02" size="10" maxlength="10" value="<%= tbRate.getE02TMA02().trim()%>" readonly>    	  	  	   			   
     </td>
     </TR>
     <TR align="center" id=trdark>                           <%-- Secuencia 03 --%>
     <td >
      <input size="3" maxlength="2" value="03" readonly>
      </td>
      <td >
	  <input type="text" name="E02MMI03" size="15" maxlength="15" value="<%= tbRate.getE02MMI03().trim()%>" readonly>
	  </td>
	  <td >   
	  <input type="text" name="E02MMA03" size="15" maxlength="15" value="<%= tbRate.getE02MMA03().trim()%>" readonly>
	  </td>
	  <td >    
	  <input type="text" name="E02TMI03" size="10" maxlength="10" value="<%= tbRate.getE02TMI03().trim()%>" readonly>
	  </td>
	  <td >    
	  <input type="text" name="E02TMA03" size="10" maxlength="10" value="<%= tbRate.getE02TMA03().trim()%>" readonly>    	  	  	   			   
     </td>
     </TR>
     <TR align="center" id=trdark>                           <%-- Secuencia 04 --%>
     <td>
      <input size="3" maxlength="2" value="04" readonly>
      </td>
      <td >
	  <input type="text" name="E02MMI04" size="15" maxlength="15" value="<%= tbRate.getE02MMI04().trim()%>" readonly>
	  </td>
	  <td >   
	  <input type="text" name="E02MMA04" size="15" maxlength="15" value="<%= tbRate.getE02MMA04().trim()%>" readonly>
	  </td>
	  <td >    
	  <input type="text" name="E02TMI04" size="10" maxlength="10" value="<%= tbRate.getE02TMI04().trim()%>" readonly>
	  </td>
	  <td >    
	  <input type="text" name="E02TMA04" size="10" maxlength="10" value="<%= tbRate.getE02TMA04().trim()%>" readonly>    	  	  	   			   
     </td>
     </TR>
     
  </TABLE>
<% } %>  
  <br>
  <TABLE class=tbenter>
	    <div align="center"> 
    	  <input id="EIBSBTN" type=submit name="Submit" value="Enviar">
  <%--  	  	      <input id="EIBSBTN" type=button name="Submit" value="Enviar" onclick="goAction('S')"> --%>
   		</div>
  </TABLE>
  <%if (!tbRate.getE02MMI01().equals("")) {%>
    <SCRIPT Language="javascript">
   		document.forms[0].E02MMI01.focus(); 	
    </SCRIPT>
  <%}%>
</form>
</body>
</html>
