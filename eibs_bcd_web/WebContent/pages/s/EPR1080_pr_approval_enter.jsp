<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@ page import="com.datapro.constants.EibsFields"%>
<html>
<head>
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session"/>
<jsp:useBean id= "msgPR" class= "datapro.eibs.beans.EPR012001Message"  scope="session"/>

</head>
<body>
  <h3 align="center">Aprobación Masiva de Transferencias<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="pr_approval_enter.jsp, EPR1080"> 
  </h3>
  <hr size="4"> 
 <% 
 if ( !error.getERRNUM().equals("0")  ) {
     out.println("<SCRIPT Language=\"Javascript\">");
     error.setERRNUM("0");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
    }
%>
 <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/servlet/datapro.eibs.approval.JSEPR1080A" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="<%= request.getParameter("SCREEN")%>">
  <INPUT TYPE=HIDDEN NAME="ACCNUM" VALUE="<%= request.getParameter("ACCNUM")%>">
  <INPUT TYPE=HIDDEN NAME="approv" VALUE="<%= request.getParameter("approv")%>">

  <table id="tbenter" align="center" style="width:85%" border="1">
    <tr> 
      <td> 
        <table id="tbenter" width="100%" border="0" cellspacing="1" cellpadding="0">
          <tr class="trdark">
            <td width="22%" nowrap> 
              <div align="right">Fecha :</div>
            </td>
            <td nowrap width="60%"> 
            	<eibsinput:date fn_month="E01CUTDTM" fn_day="E01CUTDTD" fn_year="E01CUTDTY"/>
            </td>
          </tr>
          <tr class="trdark">
            <td width="22%" nowrap> 
              <div align="right">Hora :</div>
            </td>
            <td nowrap width="60%"> 
              <input type="text" name="E01CUTTIM" size="8" maxlength="6"  onKeypress="enterInteger(event)" >
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <p align="center"> 
    <input id="EIBSBTN" type=submit name="Submit" value="Enviar">
  </p>
        <p>&nbsp;</p>
  <p><BR>
  </p>
  <p align="center">&nbsp; </p>
      
</form>
</body>
</html>
