<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<%@ page import = "datapro.eibs.master.Util" %>
<head>
<title>Cost Center Descriptions Maintenance</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V4.0 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id="msg" class="datapro.eibs.beans.EDL152901Message"  scope="session" />
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"   scope="session"/>
<jsp:useBean id="error" class="datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="userPO" class="datapro.eibs.beans.UserPos" scope="session" />

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>

</head>

<body bgcolor="#FFFFFF">

 <%
 if ( !error.getERRNUM().equals("0")  ) {
     error.setERRNUM("0") ;
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
 }
%>

<h3 align="center">Cambio Metodología<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="chg_met, JSEDL1529" ></h3>
<hr size="4">
 <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/servlet/datapro.eibs.params.JSEDL1529" >
  <p>
    <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="2">
    <INPUT TYPE=HIDDEN NAME="OPT" VALUE="<%= userPO.getPurpose()%>">
  </p>
  <table  class="tableinfo">
    <tr>
      <td nowrap width="25%">
      </td>
	<td nowrap width="25%">
	        <table cellspacing="0" cellpadding="2" width="100%" border="0">

          <tr id="trclear">
            <td nowrap >
              <div align="right">Año :</div>
            </td>
            <td nowrap>
		 		<INPUT type="text" name="E02TADCPY" size="5" maxlength="4" value="<%= "0".equals(msg.getE02TADCPY().trim())?currUser.getE01RDY():msg.getE02TADCPY() %>">
			 </td>
            <td nowrap>
           	  <div align="right">Mes :</div>
            </td>
            <td nowrap>
           		<INPUT type="text" name="E02TADCPM" size="3" maxlength="2" value="<%= "0".equals(msg.getE02TADCPM().trim())?currUser.getE01RDM():msg.getE02TADCPM() %>">
            </td>
          </tr>
           
    </table>
     </td>
     <td nowrap width="25%">
     </td>
     <td nowrap width="25%">
     </td>
    </tr>
     <% if ( !"".equals(msg.getE02TADMCL().trim())  ) { %>
    <tr>
      <td nowrap width="25%">
      </td>
	<td nowrap width="25%">
		<table cellspacing="0" cellpadding="2" width="100%" border="0">

			<tr id="trclear">
				<td nowrap>
				<div align="right">Metodología Calculada :</div>
				</td>
				<td nowrap><input disabled type="radio" name="E02TADMCL" value="A"
					<%if(msg.getE02TADMCL().equals("A")) out.print("checked");%>>Acumulativa
				<input disabled type="radio" name="E02TADMCL" value="D"
					<%if(msg.getE02TADMCL().equals("D")) out.print("checked");%>>Desacumulativa
				</td>
			</tr>

		</table>
		</td>
     <td nowrap width="25%">
     </td>
     <td nowrap width="25%">
     </td>
    </tr>
         <% } %>
    <tr>
      <td nowrap width="25%">
      </td>
	<td nowrap width="25%">
		<table cellspacing="0" cellpadding="2" width="100%" border="0">

			<tr id="trclear">
				<td nowrap>
				<div align="right">Metodología Definitiva :</div>
				</td>
				<td nowrap><input type="radio" name="E02TADMDF" value="A"
					<%if(msg.getE02TADMDF().equals("A")) out.print("checked");%>>Acumulativa
				<input type="radio" name="E02TADMDF" value="D"
					<%if(msg.getE02TADMDF().equals("D")) out.print("checked");%>>Desacumulativa
				</td>
			</tr>

		</table>
		</td>
     <td nowrap width="25%">
     </td>
     <td nowrap width="25%">
     </td>
    </tr>
  </table>
  
  <br>
   <p align="center">
    <input id="EIBSBTN" type=submit name="Submit" value="Enviar">
  </p>
</form>
</body>
</html>

