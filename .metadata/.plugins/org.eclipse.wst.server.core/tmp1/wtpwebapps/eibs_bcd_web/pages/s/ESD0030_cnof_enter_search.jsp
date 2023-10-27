<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@page import="com.datapro.constants.EibsFields"%>
<HTML><HEAD>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css"> 
<TITLE>Referencias</TITLE>
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
 
<jsp:useBean id= "cnof" class= "datapro.eibs.beans.ESD003001Message"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>
 
<script type="text/javascript">

</script>

</HEAD>
<body > 
<h3 align="center">Tablas de Codigos de Referencia<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="cnof_enter_search,ESD0030"></h3>
<hr size="4">
<FORM name="form1" METHOD="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.params.JSESD0030">

  <input type=HIDDEN name="SCREEN" value="150">  
  
    <%int row = 0; 
      String help = "<img src=\"" + request.getContextPath() + "/images/1b.gif\" title=\"Ayuda\" align=\"bottom\" border=\"0\" style=\"cursor:hand\" >"; 
    %>
    <table  class="tableinfo">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
   	        <td nowrap width="10%">&nbsp;</td>
            <td nowrap width="10%"> 
              <div align="right"><b>B&uacute;squeda por: </b></div>
            </td>
            <td nowrap width="5%">&nbsp;</td>
            <td nowrap width="10%">&nbsp;</td>
            <td nowrap width="40%">&nbsp;</td>                      
            </tr>
            
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
	         <td nowrap>&nbsp;</td>            
            <td nowrap> 
              <div align="right"><b>Tabla : </b></div>
            </td>
            <td nowrap width="5%">
                <input type="text" name="E01CNOTCN" size="3" maxlength="2" value="<%= cnof.getE01CNOTCN().trim()%>" >
                <a href="javascript:GetCNOFTables('E01CNOTCN','E01CNODCN')"><%=help%></a>
             </td>
             <td nowrap> 
              <div align="right"><b>Descripci&oacute;n : </b></div>
            </td>
            <td nowrap width="40%">
                <input type="text" name="E01CNODCN" size="48" maxlength="45" value="<%= cnof.getE01CNODCN().trim()%>" >
             </td>
			</tr> 
		</table>
      </td>
    </tr>
  </table>
  <br>
          <div align="center"> 
            <input id="EIBSBTN" type=submit name="Submit" value="Enviar">
          </div>


</FORM>
</BODY>
</HTML>
 