<html>
<head>
<META HTTP-EQUIV="Pragma" CONTENT="No-cache">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<script src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>
<jsp:useBean id= "msgHelp" class= "datapro.eibs.beans.JBObjList"   scope="session"/>

<SCRIPT type="text/javascript">
	setTimeout("top.close()", <%= datapro.eibs.master.JSEIBSProp.getPopUpTimeOut() %>);
</SCRIPT>

<script language="Javascript">
//<!-- Hide from old browsers
function enter(bnf,adr,csz,ema,rou,acc,act) {
  	top.opener.document.forms[0][top.opener.fieldAux1].value = bnf; 
  	top.opener.document.forms[0][top.opener.fieldAux2].value = adr;
  	top.opener.document.forms[0][top.opener.fieldAux3].value = csz;
  	top.opener.document.forms[0][top.opener.fieldAux4].value = ema;
  	top.opener.document.forms[0][top.opener.fieldAux5].value = rou;
  	top.opener.document.forms[0][top.opener.fieldAux6].value = acc;
  	top.opener.document.forms[0][top.opener.fieldAux7].value = act;
  	top.opener.document.forms[0][top.opener.fieldAux1].focus();
  	top.close();
}

function goSearchCode() {
	cun = document.getElementById("selNew").value;
	pg = "<%=request.getContextPath()%>/servlet/datapro.eibs.ach.JSEWD0362?SCREEN=1&selNew=" + cun;
	window.location.href=pg;
}
function goSearchName() {
	nme = document.getElementById("NameSearch").value;
	pg = "<%=request.getContextPath()%>/servlet/datapro.eibs.ach.JSEWD0362?SCREEN=1&NameSearch=" + nme;
	window.location.href=pg;
}
//-->
</script>

<title>ACH Recipients Help</title>
</head>
<%@ page import="datapro.eibs.master.Util" %>

<body>
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.ach.JSEWD0362?SCREEN=1"> 

<input type="hidden" name="Type" value="<%=userPO.getType()%>">
			  <table id="TBHELP">
				<tr>
				<td nowrap><b>Posicionar en Cliente Número : </b></td>
			  	<td nowrap>
					<input type="text" name="selNew"  size=10 maxlength=9 value="<%=userPO.getHeader18()%>">
        			<a href="javascript:goSearchCode();"><img src="<%=request.getContextPath()%>/images/ico5.gif" align="bottom" border="0" ></a> 
      			</td>
      			<td nowrap><b>Posicionar en Beneficiario : </b></td>
			  	<td nowrap>
					<input type="text" name="NameSearch"  size=21 maxlength=20 value="<%=userPO.getHeader19()%>">
        			<a href="javascript:goSearchName('<%=userPO.getType()%>');"><img src="<%=request.getContextPath()%>/images/ico5.gif" align="bottom" border="0" ></a> 
      			</td>
    		  </tr>
			</table>

<%
	if ( msgHelp.getNoResult() ) {
%>
<TABLE class="tbenter" width=100% height="100%">
	<TR>
      <TD> 
      	<div align="center">
		 	<b>No hay resultados para su criterio de busqueda </b>
		</div>
      </TD>
    </TR>
</TABLE>
<%  
		}
	else {
%>	

<TABLE class="tableinfo" align="center" style="width:'95%'">
	<TR id="trdark"> 
    	<th>Cliente</th>
    	<th>Beneficiario</th>
    	<th>Direccion</th>
    	<th>Ciudad</th>
    	<th>Ruta</th>
    	<th>Cuenta</th>
    	<th>Tipo</th>
    	<th>mail</th>
  	</tr>
  <%
		msgHelp.initRow();
		  while (msgHelp.getNextRow()) {
			datapro.eibs.beans.EWD0362DSMessage msg = (datapro.eibs.beans.EWD0362DSMessage) msgHelp.getRecord();
			String fields = "javascript:enter('" + msg.getSWDNME().trim() + "','" +
												   msg.getSWDADD().trim() + "','" +
												   msg.getSWDCSZ().trim() + "','" +
												   msg.getSWDEMA().trim() + "','" +
												   msg.getSWDROU().trim() + "','" +
												   msg.getSWDACC().trim() + "','" +		
											       msg.getSWDACT().trim() + "')";
     	%>    
    <TR>
		<td nowrap align="right"><a href="<%= fields%>"><%= Util.formatCell(msg.getSWDCUN())%></a></td>    
		<td nowrap align="left"><a href="<%= fields%>"><%= Util.formatCell(msg.getSWDNME())%></a></td>
		<td nowrap align="left"><a href="<%= fields%>"><%= Util.formatCell(msg.getSWDADD())%></a></td>
		<td nowrap align="left"><a href="<%= fields%>"><%= Util.formatCell(msg.getSWDCSZ())%></a></td>
		<td nowrap align="left"><a href="<%= fields%>"><%= Util.formatCell(msg.getSWDROU())%></a></td>
		<td nowrap align="left"><a href="<%= fields%>"><%= Util.formatCell(msg.getSWDACC())%></a></td>
		<td nowrap align="center"><a href="<%= fields%>"><%= Util.formatCell(msg.getSWDACT())%></a></td>
		<td nowrap align="left"><a href="<%= fields%>"><%= Util.formatCell(msg.getSWDEMA())%></a></td>
	</TR>   	
		<%} %>	
</TABLE>


<TABLE  class="tbenter" WIDTH="98%" ALIGN=CENTER>
    <TR>
      <TD WIDTH="50%" ALIGN=LEFT height="25"> 
       <% if ( msgHelp.getShowPrev() ) {
       		int pos = msgHelp.getFirstRec() - 21;
      		out.print("<A HREF=\""+request.getContextPath()+"/servlet/datapro.eibs.ach.JSEWD0362?FromRecord=" + pos + "&type=" + userPO.getType() + "&SelNew=" + userPO.getHeader18() + "\" > <img src=\""+request.getContextPath()+ "/images/s/previous_records.gif\" border=0></A>");
        }
%> </TD>
 	  <TD WIDTH="50%" ALIGN=RIGHT height="25"> 
 	   <% if ( msgHelp.getShowNext() ) {
      		int pos = msgHelp.getLastRec();
      		out.print("<A HREF=\""+request.getContextPath()+"/servlet/datapro.eibs.ach.JSEWD0361?FromRecord=" + pos +  "&type=" + userPO.getType() + "&SelNew=" + userPO.getHeader18() + "\" ><img src=\""+request.getContextPath()+"/images/s/next_records.gif\" border=0></A>");

        }
%> </TD>
	 </TR>
	 </TABLE>
	 
<%
   }  
%>
</form>
</body>
