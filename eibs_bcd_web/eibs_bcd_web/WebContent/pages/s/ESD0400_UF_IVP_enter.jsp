<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@ page import = "datapro.eibs.master.Util" %>
<%@page import="com.datapro.constants.EibsFields"%>
<%@page import="com.datapro.eibs.constants.HelpTypes"%>

<html>
<head>
<title>Tasa de Reajuste</title>
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id="msg" class="datapro.eibs.beans.ESD040001Message"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session"/>
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" 	scope="session" />
<jsp:useBean id="currUser" class="datapro.eibs.beans.ESS0030DSMessage" scope="session" />

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>

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
 <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/servlet/datapro.eibs.params.JSESD0400" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" id="SCREEN" VALUE="2">
  <INPUT TYPE=HIDDEN NAME="APPCODE" VALUE="<%=request.getParameter("APPCODE")%>">
  <h3 align="center">Tasa de Reajuste
  	<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="UF_IVP_enter.jsp,ESD0400"> 
  </h3>
  <hr size="4">
  <br>
  <table class="tableinfo" align="center" width="85%">
    <tr> 
      <td> 
        <table width="100%" border="0" cellspacing="1" cellpadding="0">
          <TR id="trclear">
            <td nowrap width="50%" align="right">Moneda :</td>
           <td nowrap width="50%">
              <select name="E01SELMONE">
                <option value=" " <% if (!(msg.getE01SELMONE().equals("2") ||msg.getE01SELMONE().equals("3"))) out.print("selected"); %>></option>
				<%if(currUser.getE01INT().equals("05")){%>
                <option value="2" <% if (msg.getE01SELMONE().equals("2")) out.print("selected"); %>>Reajuste UVR</option>
				<% } else { %>
                <option value="2" <% if (msg.getE01SELMONE().equals("2")) out.print("selected"); %>>Reajuste UFS</option>
				<% }%>
                <option value="3" <% if (msg.getE01SELMONE().equals("3")) out.print("selected"); %>>Reajuste IPV/Chile</option>
                <option value="4" <% if (msg.getE01SELMONE().equals("4")) out.print("selected"); %>>Reajuste USD/Chile</option>
                <option value="5" <% if (msg.getE01SELMONE().equals("5")) out.print("selected"); %>>Valor Ajuste/PERU</option>
              </select>
            </TD>
		  </TR>
		  <tr id="trclear">
            <td nowrap width="50%" align="right">Mes :</td>
            <td nowrap width="50%" align="left"> 
                <eibsinput:text name="msg" property="E01SELMONT" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_MONTH %>" />
            </td>
 		  </tr>
 		  <tr id="trclear">
			<TD nowrap width="50%" align="right">Año :</TD>
			<TD nowrap width="50%" align="left">
                <eibsinput:text name="msg" property="E01SELYEAR" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_YEAR %>" />
            </TD>
		  </tr>	  
		</table>
      </td>
    </tr>
  </table>
  
  <p align="center"> 
    <input id="EIBSBTN" type=submit name="Submit" value="Enviar">
  </p>
      
</form>
</body>
</html>
