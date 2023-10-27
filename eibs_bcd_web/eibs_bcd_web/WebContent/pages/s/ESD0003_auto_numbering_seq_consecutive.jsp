<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>   

<title>Lista</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="autoNum" class="datapro.eibs.beans.ESD000301Message"  scope="session" /> 
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>

<SCRIPT type="text/javascript">

function goProcess() {
	var num = 0;
	if (!document.autoNumber.E01NUMNEW.value == "") {
		num = document.autoNumber.E01NUMNEW.value;
	}
		
    if (num <= 0) {
    	alert("Ingrese Nueva Numeración");
        document.autoNumber.E01NUMNEW.focus();
        document.autoNumber.E01NUMNEW.select();
        return false;
    } else {
    	var acd = document.autoNumber.E01NUMACD.value;
    	var aty = document.autoNumber.E01NUMATY.value;
    	var dsc = document.autoNumber.E01NUMDSC.value;
    	var lst = document.autoNumber.E01NUMLST.value;
    	var num = document.autoNumber.E01NUMNEW.value;
    	var ang = document.autoNumber.E01CNTANG.value;  
    	var bnk = "";
    	var brn = "";  	
    	if (ang == "2" || ang == "4") {
	    	bnk = document.autoNumber.E01NUMBNK.value;
	    } 
	    if (ang == "3" || ang == "4") {
	      	brn = document.autoNumber.E01NUMBRN.value;
	    }
    	document.location.href = "<%=request.getContextPath()%>/servlet/datapro.eibs.params.JSESD0003?SCREEN=400&E01NUMACD=" + acd + "&E01NUMATY=" + aty + "&E01NUMDSC=" + dsc + "&E01NUMLST=" + lst + "&E01NUMNEW=" + num + "&E01NUMBNK=" + bnk + "&E01NUMBRN=" + brn;
		self.close();
		return true;		
   }
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

%>
<h3 align="center"> <%= autoNum.getE01NUMATY() %> - <%= autoNum.getE01NUMDSC() %> <img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="auto_numbering_seq_consecutive.jsp, ESD0003"> 
</h3>
<hr size="4">
<form name="autoNumber" method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.params.JSESD0003">

  <INPUT TYPE=HIDDEN NAME="SCREEN"    VALUE="400">
  <INPUT TYPE=HIDDEN NAME="E01NUMACD" VALUE="<%= autoNum.getE01NUMACD()%>">
  <INPUT TYPE=HIDDEN NAME="E01NUMATY" VALUE="<%= autoNum.getE01NUMATY()%>">
  <INPUT TYPE=HIDDEN NAME="E01NUMDSC" VALUE="<%= autoNum.getE01NUMDSC()%>">  
  <INPUT TYPE=HIDDEN NAME="E01CNTANG" VALUE="<%= autoNum.getE01CNTANG()%>">  
  
  <TABLE ALIGN="center" class="tableinfo">                      
  	<TR>
    	<td width="30%"><div align="right">Numero Anterior :</div></td>
    	<td width="20%">
    		<INPUT type="text" name="E01NUMLST" size="13" maxlength="12" value="<%= autoNum.getE01NUMLST().trim()%>" readonly>
    	</td>
    	<td width="20%"><div align="right">Nuevo Número :</div></td>
    	<% if (autoNum.getE01CNTANG().equals("2") && !autoNum.getE01NUMACD().equals("")) { // Prefix Bank %>
    	<td width="20%">
  			<div>  	
    		<INPUT type="text" name="E01NUMBNK" size="3" maxlength="2" value="<%= autoNum.getE01NUMBNK().trim()%>" readonly>
    		<INPUT type="text" name="E01NUMNEW" size="11" maxlength="10" value="<%= autoNum.getE01NUMNEW().trim()%>" onkeypress="enterInteger(event)">
    		</div>
    	</td>
    	<% } else { 
    	   if (autoNum.getE01CNTANG().equals("3")) { // Branch code Prefix %>   
    	   
    	      <%  if (!(currUser.getE01INT().trim().equals("11"))) {%> 
    	       	   
    	<td width="20%">
  			<div>  	
    		<INPUT type="text" name="E01NUMBRN" size="5" maxlength="4" value="<%= autoNum.getE01NUMBRN().trim()%>" readonly>
    		<INPUT type="text" name="E01NUMNEW" size="9" maxlength="8" value="<%= autoNum.getE01NUMNEW().trim()%>" onkeypress="enterInteger(event)">
    		</div>
    	</td> 
    	
    	<% } else {%>
    	
    	  <td width="20%">
  			<div>  	
    		<INPUT type="text" name="E01NUMBRN" size="4" maxlength="3" value="<%= autoNum.getE01NUMBRN().trim()%>" readonly>
    		<INPUT type="text" name="E01NUMNEW" size="10" maxlength="9" value="<%= autoNum.getE01NUMNEW().trim()%>" onkeypress="enterInteger(event)">
    		</div>
    	  </td> 
    	
    	 <% }%> 
    	
    	
    	   <% } else {
    	    if (autoNum.getE01CNTANG().equals("4")) { // Bank and Branch code Prefix %>    	    	   
    	<td width="30%">
  			<div>  	
	   	    <INPUT type="text" name="E01NUMBNK" size="3" maxlength="2" value="<%= autoNum.getE01NUMBNK().trim()%>" readonly>
    		<INPUT type="text" name="E01NUMBRN" size="5" maxlength="4" value="<%= autoNum.getE01NUMBRN().trim()%>" readonly>
    		<INPUT type="text" name="E01NUMNEW" size="7" maxlength="6" value="<%= autoNum.getE01NUMNEW().trim()%>" onkeypress="enterInteger(event)">
    		</div>
    	</td>     	    
    	   <% } else { // Consecutive %> 	
    	<td width="20%">
    		<INPUT type="text" name="E01NUMNEW" size="13" maxlength="12" value="<%= autoNum.getE01NUMNEW().trim()%>" onkeypress="enterInteger(event)">
    	<% } 
    	   } 
    	   } %>
    	</td>
	</TR>			
  </TABLE>
<div align="center">
	<input id="EIBSBTN" type="button" name="submit" value="Enviar" onClick="goProcess()">
</div>  

<SCRIPT type="text/javascript">
	document.forms[0].E01NUMNEW.focus();
	document.forms[0].E01NUMNEW.select();
</script>

</form>
</body>
</html>
