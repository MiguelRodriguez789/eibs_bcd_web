<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>

<html>
<head>
<title>Informacion Basica</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Studio">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>
 
<jsp:useBean id= "ebl0130Msg" class= "datapro.eibs.beans.EBL013002Message"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>


</head>

<body bgcolor="#FFFFFF">
<% 
 if ( !error.getERRNUM().equals("0")  ) {
     error.setERRNUM("0");
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
 }
 if ( !userPO.getPurpose().equals("NEW") ) {
    out.println("<SCRIPT> initMenu(); </SCRIPT>");
 }
 
 String Type = ebl0130Msg.getE02OPECOD(); 
 String NameSearch = (String) request.getAttribute("NameSearch");
%>

<h3 align="center">Consulta Hist&oacute;rico OFAC - Detalle
<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="ofac_blacklist_client_detail.jsp, EBL0130"  ></h3>
<hr size="4">
 <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/servlet/datapro.eibs.tools.JSEBL0130" >
    <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="2">
    <INPUT TYPE=HIDDEN NAME="Type" VALUE="<%= Type %>">
    <INPUT TYPE=HIDDEN NAME="NameSearch" VALUE="<%= (String) request.getAttribute("NameSearch") %>">
    <h4>Datos del Cliente</h4>
    <div align="left">
    <table class="tableinfo" >
      <tr> 
          <td nowrap > 
            <div align="center"> 
              
            <table cellspacing="0" cellpadding="2" width="100%" border="0">
              <tr id="trdark"> 
                <td nowrap width="20%" align="right">Tipo de Lista :</td>
                <td nowrap width="30%"><%= ebl0130Msg.getE02OFATLD().trim()%></td>
                <td nowrap width="20%" align="right">Proceso realizado :</td>
                <td nowrap width="30%"><%= ebl0130Msg.getE02OFAPRD().trim()%></td>
              </tr>
              <tr id="trclear"> 
                <td nowrap align="right">Tipo de Bloqueo :</td>
                <td nowrap><%= ebl0130Msg.getE02OFAWBD().trim()%></td>
                <td nowrap align="right">M&oacute;dulo :</td>
                <td nowrap><%= ebl0130Msg.getE02OFAMOD().trim()%> - <%= ebl0130Msg.getE02OFAMDD().trim()%></td>
              </tr>
              <tr id="trdark"> 
                <td nowrap align="right">Fecha del sistema :</td>
                <td nowrap>
                	<%
                	String sysDate = ebl0130Msg.getE02OFALMT().trim();
                	String dd = "", mm = "", yyyy = "";
                	if (sysDate.length() >= 10){
                		
                		sysDate = sysDate.substring(0, 10);
                		dd = sysDate.substring(8, 10);
                		mm = sysDate.substring(5, 7);
                		yyyy = sysDate.substring(0, 4);
                		}  
                	out.print(dd + "/" + mm + "/" + yyyy); %>
                </td>
                <td nowrap align="right">Cuenta :</td>
                <td nowrap><%= ebl0130Msg.getE02OFAACC() %></td>                
              </tr>    
              <tr id="trclear"> 
                <td nowrap align="right">Pa&iacute;s :</td>
                <td nowrap><%= ebl0130Msg.getE02OFAPID().trim()%></td>
                <td nowrap align="right">Tipo :</td>
                <td nowrap><%= ebl0130Msg.getE02OFATID().trim()%></td>
              </tr>
              <tr id="trdark"> 
                <td nowrap align="right">Identificaci&oacute;n :</td>
                <td nowrap><%= ebl0130Msg.getE02OFAIDN().trim()%></td>
                <td nowrap align="right">Cliente :</td>
                <td nowrap><%= ebl0130Msg.getE02OFACUN().trim()%></td>
              </tr>
              <tr id="trclear"> 
                <td nowrap align="right">Nombres :</td>
                <td nowrap colspan=3>
                	<%= ebl0130Msg.getE02OFANA1().trim()%>
                	<%= ebl0130Msg.getE02OFANA2().trim()%>
                    <%= ebl0130Msg.getE02OFANA3().trim()%>
                    <%= ebl0130Msg.getE02OFANA4().trim()%>
                </td>
              </tr>
              <tr id="trdark"> 
                <td nowrap align="right">Usuario :</td>
                <td nowrap><%= ebl0130Msg.getE02OFALMU().trim()%></td>
                <td nowrap align="right">Fecha de proceso :</td>
                <td nowrap><%= ebl0130Msg.getE02OFALMD()%>/<%=ebl0130Msg.getE02OFALMM()%>/<%=ebl0130Msg.getE02OFALMY() %></td>
              </tr>
            </table>
          </div>
          </td>
        </tr>
      </table>
  <TABLE  class="tbenter" WIDTH="98%" ALIGN=CENTER>
    <TR>
      <TD WIDTH="50%" ALIGN=LEFT height="25"> <%
      String datesStr = "";
		if (Type.equals("0005")) {
			datesStr = "&LMD=" + ebl0130Msg.getE02OFALMD() + "&LMM=" + ebl0130Msg.getE02OFALMM() + "&LMY=" + ebl0130Msg.getE02OFALMY() +
			"&SMD=" + ebl0130Msg.getE02OFASMD() + "&SMM=" + ebl0130Msg.getE02OFASMM() + "&SMY=" + ebl0130Msg.getE02OFASMY(); 
		}
      	out.print("<A HREF=\"" + request.getContextPath() + "/servlet/datapro.eibs.tools.JSEBL0130?SCREEN=3&NameSearch=" + NameSearch + "&Type=" + Type + "&HOPECOD=0002" + "&OFAIDN=" + ebl0130Msg.getE02OFAIDN() + "&OFACUN=" + ebl0130Msg.getE02OFACUN() + "&OFALMT=" + ebl0130Msg.getE02OFALMT() + datesStr + "&RecNum=minus\" > <img src=\""+request.getContextPath()+"/images/s/previous_records.gif\" border=0></A>");

%> </TD>
 	  <TD WIDTH="50%" ALIGN=RIGHT height="25"> <%       
		out.print("<A HREF=\"" + request.getContextPath() + "/servlet/datapro.eibs.tools.JSEBL0130?SCREEN=3&NameSearch=" + NameSearch + "&Type=" + Type + "&HOPECOD=0002" + "&OFAIDN=" + ebl0130Msg.getE02OFAIDN() + "&OFACUN=" + ebl0130Msg.getE02OFACUN() + "&OFALMT=" + ebl0130Msg.getE02OFALMT() + datesStr + "&RecNum=plus\" > <img src=\""+request.getContextPath()+"/images/s/next_records.gif\" border=0></A>");
%> </TD>
	 </TR>
	 </TABLE>      
      <br>
  </div>
</form>
</body>
</html>