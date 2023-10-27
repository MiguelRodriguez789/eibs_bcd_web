<%@ page import ="datapro.eibs.master.Util" %>
<html>
<head>
<title>Tabla de Indices Valoración Inmobiliaria Urbana y Rural (IVIUR)</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<jsp:useBean id= "trans" class= "datapro.eibs.beans.ERA008301Message"  scope="session" /> 
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />
<jsp:useBean id= "transData" class= "datapro.eibs.beans.DataTransaction"  scope="session" /> 
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>

<script type="text/javascript">

function submitThis(option) {
  document.forms[0].SCREEN.value = "2";
  document.forms[0].submit();		  	       	       
}

function hideDiv(fld, value){
 if (value) {
   eval(fld+".style.display='none'");
   } else{
   eval(fld+".style.display=''");
   }
}

</SCRIPT>  
</head>
<BODY>

<h3 align="center">Tabla de Indices Valoración Inmobiliaria Urbana y Rural (IVIUR). Año <%= trans.getE01TB3YEA().trim() %><br>
<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="valuation_index_depto_list,ERA0083"></h3>

<hr size="4">

<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSERA0083">
  <p> 
    <INPUT TYPE=HIDDEN NAME="CURRENTROW" id="CURRENTROW" VALUE="0"> 
    <INPUT TYPE=HIDDEN NAME="SCREEN" id="SCREEN" VALUE="2">
    <input type=HIDDEN name="opt" id="opt" >
    <INPUT TYPE=HIDDEN NAME="E01TB3YEA" id="E01TB3YEA" VALUE="<%= trans.getE01TB3YEA().trim() %>">
    <INPUT TYPE=HIDDEN NAME="E01TB3DPT" id="E01TB3DPT" VALUE="<%= trans.getE01TB3DPT().trim() %>">
    <INPUT TYPE=HIDDEN NAME="E01TB3CTY" id="E01TB3CTY" VALUE="<%= trans.getE01TB3CTY().trim() %>">
    <INPUT TYPE=HIDDEN NAME="E01TB3CE1" id="E01TB3CE1" VALUE="<%= trans.getE01TB3CE1().trim() %>">
    <INPUT TYPE=HIDDEN NAME="E01TB3CE2" id="E01TB3CE2" VALUE="<%= trans.getE01TB3CE2().trim() %>">
    <INPUT TYPE=HIDDEN NAME="E01TB3CE3" id="E01TB3CE3" VALUE="<%= trans.getE01TB3CE3().trim() %>">
    <INPUT TYPE=HIDDEN NAME="E01TB3CE4" id="E01TB3CE4" VALUE="<%= trans.getE01TB3CE4().trim() %>">
    <INPUT TYPE=HIDDEN NAME="E01TB3CE5" id="E01TB3CE5" VALUE="<%= trans.getE01TB3CE5().trim() %>">
    <INPUT TYPE=HIDDEN NAME="E01TB3CE6" id="E01TB3CE6" VALUE="<%= trans.getE01TB3CE6().trim() %>">
    <INPUT TYPE=HIDDEN NAME="E01TB3CE7" id="E01TB3CE7" VALUE="<%= trans.getE01TB3CE7().trim() %>">
    <INPUT TYPE=HIDDEN NAME="E01TB3CE8" id="E01TB3CE8" VALUE="<%= trans.getE01TB3CE8().trim() %>">
    <INPUT TYPE=HIDDEN NAME="E01TB3CE9" id="E01TB3CE9" VALUE="<%= trans.getE01TB3CE9().trim() %>">
    <INPUT TYPE=HIDDEN NAME="E01TB3CE0" id="E01TB3CE0" VALUE="<%= trans.getE01TB3CE0().trim() %>">
    <INPUT TYPE=HIDDEN NAME="E01TB3ES1" id="E01TB3ES1" VALUE="<%= trans.getE01TB3ES1().trim() %>">
    <INPUT TYPE=HIDDEN NAME="E01TB3ES2" id="E01TB3ES2" VALUE="<%= trans.getE01TB3ES2().trim() %>">
    <INPUT TYPE=HIDDEN NAME="E01TB3ES3" id="E01TB3ES3" VALUE="<%= trans.getE01TB3ES3().trim() %>">
    <INPUT TYPE=HIDDEN NAME="E01TB3ES4" id="E01TB3ES4" VALUE="<%= trans.getE01TB3ES4().trim() %>">
    <INPUT TYPE=HIDDEN NAME="E01TB3ES5" id="E01TB3ES5" VALUE="<%= trans.getE01TB3ES5().trim() %>">
    <INPUT TYPE=HIDDEN NAME="E01TB3ES6" id="E01TB3ES6" VALUE="<%= trans.getE01TB3ES6().trim() %>">
    <INPUT TYPE=HIDDEN NAME="E01TB3ES7" id="E01TB3ES7" VALUE="<%= trans.getE01TB3ES7().trim() %>">
    <INPUT TYPE=HIDDEN NAME="E01TB3ES8" id="E01TB3ES8" VALUE="<%= trans.getE01TB3ES8().trim() %>">
    <INPUT TYPE=HIDDEN NAME="E01TB3ES9" id="E01TB3ES9" VALUE="<%= trans.getE01TB3ES9().trim() %>">
    <INPUT TYPE=HIDDEN NAME="E01TB3ES0" id="E01TB3ES0" VALUE="<%= trans.getE01TB3ES0().trim() %>">
    <INPUT TYPE=HIDDEN NAME="CONFIRM" id="CONFIRM" VALUE="<%= userPO.getHeader1().trim() %>">
  </p>
  <p> 
<% 
String chk = "";

 if ( !error.getERRNUM().equals("0")  ) {
     error.setERRNUM("0");
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
     }

%> 
  <p> 
	<div id="Div1" style="display:'none'">
        <table cellspacing=0 cellpadding=2 width="100%" border="0">
		  <tr>    
            <td nowrap >
              <div align="left">Tabla Actualizada. </div>
            </td>
          </tr>
		</table>
	</div>          
  
  <table class="tbenter" width=100% align=center>
    <tr> 
    <td class=TDBKG width="33%">
        <div align="center">
        <a href="javascript:submitThis(7)"><b>Actualizar Tabla IVIUR</b></a>
        </div> 
    </td> 
      <td class=TDBKG width="33%"> 
        <div align="center"><a href="<%=request.getContextPath()%>/pages/background.jsp"><b>Salir</b></a></div>
      </td>
    </tr>
  </table>
  
   <TABLE  id="mainTable" class="tableinfo" style="height:400px; width: 1000px ">
   <tr  height="33%"> 
      <td NOWRAP valign="top" width="100%"> 
		<table id="headTable" width="98%">
			<tr id="trdark">
	            <th align=CENTER nowrap width="33%"> <div align="center">Código</div> </th>
	            <th align=CENTER nowrap width="33%">Estrato</th>
	            <th align=CENTER nowrap width="33%"> <div align="center">Porcentaje </div> </th>
			</tr>
        </table>
      </td>
    </tr>
		  <tr>    
		    <td nowrap="nowrap">      
		       <div id="dataDiv1" style="height:400px; overflow:auto;"> 
		       <table id="dataTable" cellspacing="0" cellpadding="1" border="0" >         
		  <%if (!trans.getE01TB3CE1().trim().equals("")) {%>
          <tr> 
	      	<td align="center" nowrap width="33%">  
				<div ><%=trans.getE01TB3CE1().trim()%></DIV>
      		</td>
	      	<td align="center" nowrap width="33%">  
				<div ><%=trans.getE01TB3ES1().trim()%></DIV>
      		</td>
	      	<td align="center" nowrap width="33%">  
    	      <input type="text" name="E01TB3IN1"  size="6" maxlength="6"  value="<%= trans.getE01TB3IN1().trim() %>" onkeypress=enterDecimal() onChange="hideDiv('Div1',false)">
      		</td>
          </tr>
			<%} %>
		  <%if (!trans.getE01TB3CE2().trim().equals("")) {%>
          <tr> 
	      	<td align="center" nowrap width="33%">  
				<div ><%=trans.getE01TB3CE2().trim()%></DIV>
      		</td>
	      	<td align="center" nowrap width="33%">  
				<div ><%=trans.getE01TB3ES2().trim()%></DIV>
      		</td>
	      	<td align="center" nowrap width="33%">  
    	      <input type="text" name="E01TB3IN2"  size="6" maxlength="6"  value="<%= trans.getE01TB3IN2().trim() %>" onkeypress=enterDecimal() onChange="hideDiv('Div1',true)"> 
      		</td>
          </tr>
			<%} %>
		  <%if (!trans.getE01TB3CE3().trim().equals("")) {%>
          <tr> 
	      	<td align="center" nowrap width="33%">  
				<div ><%=trans.getE01TB3CE3().trim()%></DIV>
      		</td>
	      	<td align="center" nowrap width="33%">  
				<div ><%=trans.getE01TB3ES3().trim()%></DIV>
      		</td>
	      	<td align="center" nowrap width="33%">  
    	      <input type="text" name="E01TB3IN3"  size="6" maxlength="6"  value="<%= trans.getE01TB3IN3().trim() %>" onkeypress=enterDecimal() onChange="hideDiv('Div1',true)"> 
      		</td>
          </tr>
			<%} %>
		  <%if (!trans.getE01TB3CE4().trim().equals("")) {%>
          <tr> 
	      	<td align="center" nowrap width="33%">  
				<div ><%=trans.getE01TB3CE4().trim()%></DIV>
      		</td>
	      	<td align="center" nowrap width="33%">  
				<div ><%=trans.getE01TB3ES4().trim()%></DIV>
      		</td>
	      	<td align="center" nowrap width="33%">  
    	      <input type="text" name="E01TB3IN4"  size="6" maxlength="6"  value="<%= trans.getE01TB3IN4().trim() %>" onkeypress=enterDecimal() onChange="hideDiv('Div1',true)"> 
      		</td>
          </tr>
			<%} %>
		  <%if (!trans.getE01TB3CE5().trim().equals("")) {%>
          <tr> 
	      	<td align="center" nowrap width="33%">  
				<div ><%=trans.getE01TB3CE5().trim()%></DIV>
      		</td>
	      	<td align="center" nowrap width="33%">  
				<div ><%=trans.getE01TB3ES5().trim()%></DIV>
      		</td>
	      	<td align="center" nowrap width="33%">  
    	      <input type="text" name="E01TB3IN5"  size="6" maxlength="6"  value="<%= trans.getE01TB3IN5().trim() %>" onkeypress=enterDecimal() onChange="hideDiv('Div1',true)"> 
      		</td>
          </tr>
			<%} %>
		  <%if (!trans.getE01TB3CE6().trim().equals("")) {%>
          <tr> 
	      	<td align="center" nowrap width="33%">  
				<div ><%=trans.getE01TB3CE6().trim()%></DIV>
      		</td>
	      	<td align="center" nowrap width="33%">  
				<div ><%=trans.getE01TB3ES6().trim()%></DIV>
      		</td>
	      	<td align="center" nowrap width="33%">  
    	      <input type="text" name="E01TB3IN6"  size="6" maxlength="6"  value="<%= trans.getE01TB3IN6().trim() %>" onkeypress=enterDecimal() onChange="hideDiv('Div1',true)"> 
      		</td>
          </tr>
			<%} %>
		  <%if (!trans.getE01TB3CE7().trim().equals("")) {%>
          <tr> 
	      	<td align="center" nowrap width="33%">  
				<div ><%=trans.getE01TB3CE7().trim()%></DIV>
      		</td>
	      	<td align="center" nowrap width="33%">  
				<div ><%=trans.getE01TB3ES7().trim()%></DIV>
      		</td>
	      	<td align="center" nowrap width="33%">  
    	      <input type="text" name="E01TB3IN7"  size="6" maxlength="6"  value="<%= trans.getE01TB3IN7().trim() %>" onkeypress=enterDecimal() onChange="hideDiv('Div1',true)"> 
      		</td>
          </tr>
			<%} %>
		  <%if (!trans.getE01TB3CE8().trim().equals("")) {%>
          <tr> 
	      	<td align="center" nowrap width="33%">  
				<div ><%=trans.getE01TB3CE8().trim()%></DIV>
      		</td>
	      	<td align="center" nowrap width="33%">  
				<div ><%=trans.getE01TB3ES8().trim()%></DIV>
      		</td>
	      	<td align="center" nowrap width="33%">  
    	      <input type="text" name="E01TB3IN8"  size="6" maxlength="6"  value="<%= trans.getE01TB3IN8().trim() %>" onkeypress=enterDecimal() onChange="hideDiv('Div1',true)"> 
      		</td>
          </tr>
			<%} %>
		  <%if (!trans.getE01TB3CE9().trim().equals("")) {%>
          <tr> 
	      	<td align="center" nowrap width="33%">  
				<div ><%=trans.getE01TB3CE9().trim()%></DIV>
      		</td>
	      	<td align="center" nowrap width="33%">  
				<div ><%=trans.getE01TB3ES9().trim()%></DIV>
      		</td>
	      	<td align="center" nowrap width="33%">  
    	      <input type="text" name="E01TB3IN9"  size="6" maxlength="6"  value="<%= trans.getE01TB3IN9().trim() %>" onkeypress=enterDecimal() onChange="hideDiv('Div1',true)"> 
      		</td>
          </tr>
			<%} %>
		  <%if (!trans.getE01TB3CE0().trim().equals("")) {%>
          <tr> 
	      	<td align="center" nowrap width="33%">  
				<div ><%=trans.getE01TB3CE0().trim()%></DIV>
      		</td>
	      	<td align="center" nowrap width="33%">  
				<div ><%=trans.getE01TB3ES0().trim()%></DIV>
      		</td>
	      	<td align="center" nowrap width="33%">  
    	      <input type="text" name="E01TB3IN0"  size="6" maxlength="6"  value="<%= trans.getE01TB3IN0().trim() %>" onkeypress=enterDecimal() onChange="hideDiv('Div1',true)"> 
      		</td>
          </tr>
			<%} %>
			

		  <%if (!trans.getE01TB3CEA().trim().equals("")) {%>
          <tr> 
	      	<td align="center" nowrap width="33%">  
				<div ><%=trans.getE01TB3CEA().trim()%></DIV>
      		</td>
	      	<td align="center" nowrap width="33%">  
				<div ><%=trans.getE01TB3ESA().trim()%></DIV>
      		</td>
	      	<td align="center" nowrap width="33%">  
    	      <input type="text" name="E01TB3INA"  size="6" maxlength="6"  value="<%= trans.getE01TB3INA().trim() %>" onkeypress=enterDecimal() onChange="hideDiv('Div1',false)">
      		</td>
          </tr>
			<%} %>
		  <%if (!trans.getE01TB3CEB().trim().equals("")) {%>
          <tr> 
	      	<td align="center" nowrap width="33%">  
				<div ><%=trans.getE01TB3CEB().trim()%></DIV>
      		</td>
	      	<td align="center" nowrap width="33%">  
				<div ><%=trans.getE01TB3ESB().trim()%></DIV>
      		</td>
	      	<td align="center" nowrap width="33%">  
    	      <input type="text" name="E01TB3INB"  size="6" maxlength="6"  value="<%= trans.getE01TB3INB().trim() %>" onkeypress=enterDecimal() onChange="hideDiv('Div1',true)"> 
      		</td>
          </tr>
			<%} %>
		  <%if (!trans.getE01TB3CEC().trim().equals("")) {%>
          <tr> 
	      	<td align="center" nowrap width="33%">  
				<div ><%=trans.getE01TB3CEC().trim()%></DIV>
      		</td>
	      	<td align="center" nowrap width="33%">  
				<div ><%=trans.getE01TB3ESC().trim()%></DIV>
      		</td>
	      	<td align="center" nowrap width="33%">  
    	      <input type="text" name="E01TB3INC"  size="6" maxlength="6"  value="<%= trans.getE01TB3INC().trim() %>" onkeypress=enterDecimal() onChange="hideDiv('Div1',true)"> 
      		</td>
          </tr>
			<%} %>
		  <%if (!trans.getE01TB3CED().trim().equals("")) {%>
          <tr> 
	      	<td align="center" nowrap width="33%">  
				<div ><%=trans.getE01TB3CED().trim()%></DIV>
      		</td>
	      	<td align="center" nowrap width="33%">  
				<div ><%=trans.getE01TB3ESD().trim()%></DIV>
      		</td>
	      	<td align="center" nowrap width="33%">  
    	      <input type="text" name="E01TB3IND"  size="6" maxlength="6"  value="<%= trans.getE01TB3IND().trim() %>" onkeypress=enterDecimal() onChange="hideDiv('Div1',true)"> 
      		</td>
          </tr>
			<%} %>
		  <%if (!trans.getE01TB3CEE().trim().equals("")) {%>
          <tr> 
	      	<td align="center" nowrap width="33%">  
				<div ><%=trans.getE01TB3CEE().trim()%></DIV>
      		</td>
	      	<td align="center" nowrap width="33%">  
				<div ><%=trans.getE01TB3ESE().trim()%></DIV>
      		</td>
	      	<td align="center" nowrap width="33%">  
    	      <input type="text" name="E01TB3INE"  size="6" maxlength="6"  value="<%= trans.getE01TB3INE().trim() %>" onkeypress=enterDecimal() onChange="hideDiv('Div1',true)"> 
      		</td>
          </tr>
			<%} %>
		  <%if (!trans.getE01TB3CEF().trim().equals("")) {%>
          <tr> 
	      	<td align="center" nowrap width="33%">  
				<div ><%=trans.getE01TB3CEF().trim()%></DIV>
      		</td>
	      	<td align="center" nowrap width="33%">  
				<div ><%=trans.getE01TB3ESF().trim()%></DIV>
      		</td>
	      	<td align="center" nowrap width="33%">  
    	      <input type="text" name="E01TB3INF"  size="6" maxlength="6"  value="<%= trans.getE01TB3INF().trim() %>" onkeypress=enterDecimal() onChange="hideDiv('Div1',true)"> 
      		</td>
          </tr>
			<%} %>
		  <%if (!trans.getE01TB3CEG().trim().equals("")) {%>
          <tr> 
	      	<td align="center" nowrap width="33%">  
				<div ><%=trans.getE01TB3CEG().trim()%></DIV>
      		</td>
	      	<td align="center" nowrap width="33%">  
				<div ><%=trans.getE01TB3ESG().trim()%></DIV>
      		</td>
	      	<td align="center" nowrap width="33%">  
    	      <input type="text" name="E01TB3ING"  size="6" maxlength="6"  value="<%= trans.getE01TB3ING().trim() %>" onkeypress=enterDecimal() onChange="hideDiv('Div1',true)"> 
      		</td>
          </tr>
			<%} %>
		  <%if (!trans.getE01TB3CEH().trim().equals("")) {%>
          <tr> 
	      	<td align="center" nowrap width="33%">  
				<div ><%=trans.getE01TB3CEH().trim()%></DIV>
      		</td>
	      	<td align="center" nowrap width="33%">  
				<div ><%=trans.getE01TB3ESH().trim()%></DIV>
      		</td>
	      	<td align="center" nowrap width="33%">  
    	      <input type="text" name="E01TB3INH"  size="6" maxlength="6"  value="<%= trans.getE01TB3INH().trim() %>" onkeypress=enterDecimal() onChange="hideDiv('Div1',true)"> 
      		</td>
          </tr>
			<%} %>
		  <%if (!trans.getE01TB3CEI().trim().equals("")) {%>
          <tr> 
	      	<td align="center" nowrap width="33%">  
				<div ><%=trans.getE01TB3CEI().trim()%></DIV>
      		</td>
	      	<td align="center" nowrap width="33%">  
				<div ><%=trans.getE01TB3ESI().trim()%></DIV>
      		</td>
	      	<td align="center" nowrap width="33%">  
    	      <input type="text" name="E01TB3INI"  size="6" maxlength="6"  value="<%= trans.getE01TB3INI().trim() %>" onkeypress=enterDecimal() onChange="hideDiv('Div1',true)"> 
      		</td>
          </tr>
			<%} %>
		  <%if (!trans.getE01TB3CEJ().trim().equals("")) {%>
          <tr> 
	      	<td align="center" nowrap width="33%">  
				<div ><%=trans.getE01TB3CEJ().trim()%></DIV>
      		</td>
	      	<td align="center" nowrap width="33%">  
				<div ><%=trans.getE01TB3ESJ().trim()%></DIV>
      		</td>
	      	<td align="center" nowrap width="33%">  
    	      <input type="text" name="E01TB3INJ"  size="6" maxlength="6"  value="<%= trans.getE01TB3INJ().trim() %>" onkeypress=enterDecimal() onChange="hideDiv('Div1',true)"> 
      		</td>
          </tr>
			<%} %>

		  <%if (!trans.getE01TB3CEK().trim().equals("")) {%>
          <tr> 
	      	<td align="center" nowrap width="33%">  
				<div ><%=trans.getE01TB3CEK().trim()%></DIV>
      		</td>
	      	<td align="center" nowrap width="33%">  
				<div ><%=trans.getE01TB3ESK().trim()%></DIV>
      		</td>
	      	<td align="center" nowrap width="33%">  
    	      <input type="text" name="E01TB3INK"  size="6" maxlength="6"  value="<%= trans.getE01TB3INK().trim() %>" onkeypress=enterDecimal() onChange="hideDiv('Div1',true)"> 
      		</td>
          </tr>
			<%} %>
		  <%if (!trans.getE01TB3CEL().trim().equals("")) {%>
          <tr> 
	      	<td align="center" nowrap width="33%">  
				<div ><%=trans.getE01TB3CEL().trim()%></DIV>
      		</td>
	      	<td align="center" nowrap width="33%">  
				<div ><%=trans.getE01TB3ESL().trim()%></DIV>
      		</td>
	      	<td align="center" nowrap width="33%">  
    	      <input type="text" name="E01TB3INL"  size="6" maxlength="6"  value="<%= trans.getE01TB3INL().trim() %>" onkeypress=enterDecimal() onChange="hideDiv('Div1',true)"> 
      		</td>
          </tr>
			<%} %>
		  <%if (!trans.getE01TB3CEM().trim().equals("")) {%>
          <tr> 
	      	<td align="center" nowrap width="33%">  
				<div ><%=trans.getE01TB3CEM().trim()%></DIV>
      		</td>
	      	<td align="center" nowrap width="33%">  
				<div ><%=trans.getE01TB3ESM().trim()%></DIV>
      		</td>
	      	<td align="center" nowrap width="33%">  
    	      <input type="text" name="E01TB3INM"  size="6" maxlength="6"  value="<%= trans.getE01TB3INM().trim() %>" onkeypress=enterDecimal() onChange="hideDiv('Div1',true)"> 
      		</td>
          </tr>
			<%} %>
		  <%if (!trans.getE01TB3CEN().trim().equals("")) {%>
          <tr> 
	      	<td align="center" nowrap width="33%">  
				<div ><%=trans.getE01TB3CEN().trim()%></DIV>
      		</td>
	      	<td align="center" nowrap width="33%">  
				<div ><%=trans.getE01TB3ESN().trim()%></DIV>
      		</td>
	      	<td align="center" nowrap width="33%">  
    	      <input type="text" name="E01TB3INN"  size="6" maxlength="6"  value="<%= trans.getE01TB3INN().trim() %>" onkeypress=enterDecimal() onChange="hideDiv('Div1',true)"> 
      		</td>
          </tr>
			<%} %>
		  <%if (!trans.getE01TB3CEO().trim().equals("")) {%>
          <tr> 
	      	<td align="center" nowrap width="33%">  
				<div ><%=trans.getE01TB3CEO().trim()%></DIV>
      		</td>
	      	<td align="center" nowrap width="33%">  
				<div ><%=trans.getE01TB3ESO().trim()%></DIV>
      		</td>
	      	<td align="center" nowrap width="33%">  
    	      <input type="text" name="E01TB3INO"  size="6" maxlength="6"  value="<%= trans.getE01TB3INO().trim() %>" onkeypress=enterDecimal() onChange="hideDiv('Div1',true)"> 
      		</td>
          </tr>
			<%} %>
		  <%if (!trans.getE01TB3CEP().trim().equals("")) {%>
          <tr> 
	      	<td align="center" nowrap width="33%">  
				<div ><%=trans.getE01TB3CEP().trim()%></DIV>
      		</td>
	      	<td align="center" nowrap width="33%">  
				<div ><%=trans.getE01TB3ESP().trim()%></DIV>
      		</td>
	      	<td align="center" nowrap width="33%">  
    	      <input type="text" name="E01TB3INP"  size="6" maxlength="6"  value="<%= trans.getE01TB3INP().trim() %>" onkeypress=enterDecimal() onChange="hideDiv('Div1',true)"> 
      		</td>
          </tr>
			<%} %>
		  <%if (!trans.getE01TB3CEQ().trim().equals("")) {%>
          <tr> 
	      	<td align="center" nowrap width="33%">  
				<div ><%=trans.getE01TB3CEQ().trim()%></DIV>
      		</td>
	      	<td align="center" nowrap width="33%">  
				<div ><%=trans.getE01TB3ESQ().trim()%></DIV>
      		</td>
	      	<td align="center" nowrap width="33%">  
    	      <input type="text" name="E01TB3INQ"  size="6" maxlength="6"  value="<%= trans.getE01TB3INQ().trim() %>" onkeypress=enterDecimal() onChange="hideDiv('Div1',true)"> 
      		</td>
          </tr>
			<%} %>
		  <%if (!trans.getE01TB3CER().trim().equals("")) {%>
          <tr> 
	      	<td align="center" nowrap width="33%">  
				<div ><%=trans.getE01TB3CER().trim()%></DIV>
      		</td>
	      	<td align="center" nowrap width="33%">  
				<div ><%=trans.getE01TB3ESR().trim()%></DIV>
      		</td>
	      	<td align="center" nowrap width="33%">  
    	      <input type="text" name="E01TB3INR"  size="6" maxlength="6"  value="<%= trans.getE01TB3INR().trim() %>" onkeypress=enterDecimal() onChange="hideDiv('Div1',true)"> 
      		</td>
          </tr>
			<%} %>
		  <%if (!trans.getE01TB3CES().trim().equals("")) {%>
          <tr> 
	      	<td align="center" nowrap width="33%">  
				<div ><%=trans.getE01TB3CES().trim()%></DIV>
      		</td>
	      	<td align="center" nowrap width="33%">  
				<div ><%=trans.getE01TB3ESS().trim()%></DIV>
      		</td>
	      	<td align="center" nowrap width="33%">  
    	      <input type="text" name="E01TB3INS"  size="6" maxlength="6"  value="<%= trans.getE01TB3INS().trim() %>" onkeypress=enterDecimal() onChange="hideDiv('Div1',true)"> 
      		</td>
          </tr>
			<%} %>
		  <%if (!trans.getE01TB3CET().trim().equals("")) {%>
          <tr> 
	      	<td align="center" nowrap width="33%">  
				<div ><%=trans.getE01TB3CET().trim()%></DIV>
      		</td>
	      	<td align="center" nowrap width="33%">  
				<div ><%=trans.getE01TB3EST().trim()%></DIV>
      		</td>
	      	<td align="center" nowrap width="33%">  
    	      <input type="text" name="E01TB3INT"  size="6" maxlength="6"  value="<%= trans.getE01TB3INT().trim() %>" onkeypress=enterDecimal() onChange="hideDiv('Div1',false)">
      		</td>
          </tr>
			<%} %>
			
          </table>
        </div>
       </td>
     </tr>
</table>

  <BR>
<%
	if (userPO.getHeader1().equals("Y")) {
%>
<SCRIPT type="text/javascript">
	hideDiv('Div1',false) ;
</SCRIPT>
<%
	}
%> 

 <SCRIPT type="text/javascript">

     function resizeDoc() {
     	adjustEquTables( getElement("headTable"), getElement("dataTable"), getElement("dataDiv1"),1,false);
      }
     resizeDoc();
     window.onresize=resizeDoc;
</SCRIPT>
</form>
</body>
</html>