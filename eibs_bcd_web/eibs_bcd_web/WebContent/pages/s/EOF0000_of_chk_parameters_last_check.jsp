<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput"%>
<%@ page import="datapro.eibs.master.Util,datapro.eibs.beans.EOF000002Message"%>
<%@page import="com.datapro.constants.EibsFields"%>

<html>
<head>
<title>Parametros de Cheques Oficiales</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "EOF000002Help" class= "datapro.eibs.beans.JBObjList"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>

  
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

<SCRIPT>
function goBack(){
	document.forms[0].SCREEN.value = "100";
	document.forms[0].submit();
}
</SCRIPT>

 <% int row = 0;%>

<H3 align="center">

<% if (userPO.getHeader3().equals("4")) {%>
	Parametros de Control de Cuentas de Terceros
<% } else { %>
	Parametros de Control de Cheques de Gerencia
 <% } %>
 
<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="of_chk_parameters_last_check.jsp, EOF0000"></H3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.params.JSEOF0000" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="1000">
  <input type="hidden" name="E02OFCNXO" value="<%=userPO.getHeader1().trim()%>" >
  <input type="hidden" name="E02OFCDTY" value="<%=userPO.getHeader3().trim()%>" >
  
 <% if (!userPO.getHeader1().trim().equals("3") && !userPO.getHeader3().trim().equals("4") ) {%>
 
  <table  class="tableinfo">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="16%"> 
              <div align="right">Banco :</div>
            </td>
            <td nowrap> 
              <input type="text" name="E02OFNBNK" size="3" maxlength="2" value="<%= userPO.getBank()%>">
            </td>
            <td nowrap> 
              <div align="right">Ultimo N&uacute;mero de Cheques del Banco :</div>
            </td>
            <td nowrap> 
              <input type="text" name="E02OFNNUM" size="12" maxlength="11" value="<%= userPO.getHeader2()%>">
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  
  <%} else {%>
  
 <TABLE  id="mainTable" class="tableinfo"  height="55%" width="80%">
 <tr height="5%"> 
   <td NOWRAP valign="top" width="80%" >
        <table id="headTable" width="100%">
          <tr id="trdark"> 
            <th align=CENTER nowrap width="10%"><b>Agencia</b></th>
             <th align=left nowrap width="20%"><b>Nombre</b></th> 
            <% if (userPO.getHeader3().equals("4")) {%>
             <th align=left nowrap width="20%"><b>Primera Cuenta</b></th>
             <th align=left nowrap width="20%"><b>Segunda Cuenta</b></th>
            <% } else { %>
<!--              <th align=CENTER nowrap width="20%"><b>Cuenta de Cheques</b></th> -->
             <th align=CENTER nowrap width="20%"><b>Número de Cheque</b></th>
            <% } %>
          </tr>
        </table>
       </td>
     </tr>

          	<tr  height="100%"> 
          	<td >     
			<div id="dataDiv1" class="scbarcolor" style="width:100%; height:100%; overflow:auto;">
			<table id="dataTable" width="100%">
          
          <%
                EOF000002Help.initRow();
				boolean firstTime = true;
				String chk = "";
                while (EOF000002Help.getNextRow()) {
					if (firstTime) {
						firstTime = false;
						chk = "checked";
					} else {
						chk = "";
					}
                 
				EOF000002Message msgList= (EOF000002Message) EOF000002Help.getRecord();
		 %>
		 
		<tr id="dataTable<%= EOF000002Help.getCurrentRow() %>">
           <td NOWRAP  align=center width="10%"><%= Util.addLeftChar('0',3,msgList.getE02OFNBRN()) %></td>
			<td NOWRAP  align=left width="20%"><%= msgList.getE02BRNNME() %> </td>
            <% if (msgList.getE02OFCDTY().equals("4")) {%>
			<td NOWRAP  align=center width="20%">
				<input type="text" name="E02OFNBN1_<%= EOF000002Help.getCurrentRow() %>" size="5" maxlength="4" value="<%= msgList.getE02OFNBN1() %>" readonly>
				<input type="text" name="E02DSCBN1_<%= EOF000002Help.getCurrentRow() %>" size="45" maxlength="45" value="<%= msgList.getE02DSCBN1() %>" readonly>
	              <a href="javascript:GetCodeDescCNOFC('E02OFNBN1_<%= EOF000002Help.getCurrentRow() %>','E02DSCBN1_<%= EOF000002Help.getCurrentRow() %>','X3')">
	              <img src="<%=request.getContextPath()%>/images/1b.gif" title="ayuda" align="bottom" border="0" ></a>             
            </td>					
			<td NOWRAP  align=center width="20%">
				<input type="text" name="E02OFNBN2_<%= EOF000002Help.getCurrentRow() %>" size="5" maxlength="4" value="<%= msgList.getE02OFNBN2() %>" readonly>
				<input type="text" name="E02DSCBN2_<%= EOF000002Help.getCurrentRow() %>" size="45" maxlength="45" value="<%= msgList.getE02DSCBN2() %>" readonly>
	              <a href="javascript:GetCodeDescCNOFC('E02OFNBN2_<%= EOF000002Help.getCurrentRow() %>','E02DSCBN2_<%= EOF000002Help.getCurrentRow() %>','X3')">
	              <img src="<%=request.getContextPath()%>/images/1b.gif" title="ayuda" align="bottom" border="0" ></a>             
            </td>					
            <% } else { %>
<!-- 			<td NOWRAP  align=center width="20%"> -->
<%-- 				<input type="text" name="E02CNDPHN_<%= EOF000002Help.getCurrentRow() %>" size="14" maxlength="12" value="<%= msgList.getE02CNDPHN() %>" readonly> --%>
<!--             </td>					 -->
			<td NOWRAP  align=center width="20%">
				<input type="text" name="E02OFNNUM_<%= EOF000002Help.getCurrentRow() %>" size="12" maxlength="11" value="<%= msgList.getE02OFNNUM() %>">
            </td>					

            <% } %>
         </tr>
          <% } %>
		</table>
		</div>
      </td>
    </tr>
  </table>
  <%}%>
  
 <div align="center">
    <input id="EIBSBTN" type=submit name="Submit" value="Enviar">
     <span><input id="EIBSBTN_BACK" class="EIBSBTN" type="button" name="Back" value="Regresar" onclick="goBack()"></span>
  </div>
  
  </form>
  
  <SCRIPT type="text/javascript">
  getElement("hiddenDivNew").onclick=cancelBub;
  getElement("eibsNew").onclick=showHiddenDivNew; 
     
</SCRIPT>



</body>
</html>
