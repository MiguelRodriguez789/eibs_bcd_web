<html>
<head>
<title>Groups</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

</head>


<body>

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<jsp:useBean id="groupID" class="java.lang.String" scope="session" />

<script type="text/javascript">

function goAction(type) {
    document.forms[0].TYPE.value=type;
	document.forms[0].submit();
}

</SCRIPT> 
<br><br><br>


<form NAME="form" method="post" target="detail" action="<%=request.getContextPath()%>/servlet/datapro.eibs.tools.JSEODPDF" >
  	<INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="10">
  	<INPUT TYPE=HIDDEN NAME="DATEFROM" VALUE="">
  	<INPUT TYPE=HIDDEN NAME="DATETO" VALUE="">
  	<INPUT TYPE=HIDDEN NAME="REPNAME" VALUE="">
  	<INPUT TYPE=HIDDEN NAME="TYPE" VALUE="">
  	
	<table cellspacing="0" cellpadding="2" width="100%" border="1">
		<tr>
	    	<td nowrap> 
	        	<table cellspacing="0" cellpadding="2" class="tbhead" width="100%" align="center">
					<tr>
						<td align=left colspan=5 > Grupo ID: <%= groupID %> </td>
					</tr>
	            </table>
	        </td>
		</tr>
	</table>
	<table cellspacing="0" cellpadding="2" width="100%" border="1">
		<tr>
	    	<td nowrap> 
	        	<table cellspacing="0" cellpadding="2" class="tbhead" width="100%" align="center">
					<tr>
						<td align=left colspan=5 > Usario ID: </td>
					</tr>
	            </table>
	        </td>
		</tr>
	</table>
  	
  
	<table align="center" border=1 CELLSPACING=0 CELLPADDING=0 width="100%" bordercolor="#6684A3" style="border-collapse: collapse" >
    	<tr>
			<td>
	        	<table cellspacing="0" cellpadding="2" class="tbhead" width="100%" align="center">
				  <tr>
  					<td> Usuario </TD>
  					<td> Nombre </TD>
  				   </tr>				
				</table> 
			</td>
		</tr>
	</table>	

	<br>

<SCRIPT type="text/javascript">
    document.forms[0].TYPE.value="Usuario ID";
	document.forms[0].submit();
</SCRIPT>
</form>
</body>
</html>
