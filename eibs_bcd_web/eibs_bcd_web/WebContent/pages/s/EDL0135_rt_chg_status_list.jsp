<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput"%>
<%@ page import="datapro.eibs.master.Util,datapro.eibs.beans.EDL013503Message"%>

<!doctype html public "-//w3c//dtd html 4.0 transitional//en">
<%@page import="com.datapro.constants.EibsFields"%>
<html>
<head>
<title>Historia Cambios de Estados</title>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="<%=request.getContextPath()%>/pages/style.css"
	rel="stylesheet">

<jsp:useBean id="loans" class="datapro.eibs.beans.EDL013503Message"  scope="session" />
<jsp:useBean id="EDL013503List" class="datapro.eibs.beans.JBObjList" scope="session" />
<jsp:useBean id="error" class="datapro.eibs.beans.ELEERRMessage" scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </script>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>

<script type="text/javascript">

<%
if ( userPO.getOption().equals("RT") ) {
%>
	builtNewMenu(rt_i_opt);
<%   
}
else if ( userPO.getOption().equals("SV") ) {
%>
	builtNewMenu(sv_i_opt);
<%   
}
else if ( userPO.getOption().equals("CP") ) {
%>
	builtNewMenu(cpar_i_opt);
<%   
}
%>
</SCRIPT>  

</head>

<body>
<% 

 if ( !error.getERRNUM().equals("0")  ) {
     error.setERRNUM("0");
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
 }
 out.println("<SCRIPT> initMenu(); </SCRIPT>");
%>

<h3 align="center">Historia Cambios de Estados<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="rt_chg_status_list.jsp,EDL0135"></h3>
<hr size="4">
<form method="POST" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDL0135">
<input type="hidden" name="SCREEN" value="500"> 

  <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
          <tr id="trdark"> 
            <td nowrap width="16%" > 
              <div align="right"><b>Cliente :</b></div>
            </td>
            <td nowrap width="20%" > 
              <div align="left">
                <input type="text" name="E03DEACUN" size="10" maxlength="9" value="<%= loans.getE03DEACUN().trim()%>" readonly>
              </div>
              </td>
            <td nowrap width="16%" > 
              <div align="right"><b>Nombre :</b> </div>
            </td>
            <td nowrap colspan="3" > 
              <div align="left">
                <input type="text" name="E03CUSNA1" size="45" maxlength="45" value="<%= loans.getE03CUSNA1().trim()%>" readonly>
              </div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="16%"> 
              <div align="right"><b>Cuenta :</b></div>
            </td>
            <td nowrap width="20%"> 
              <div align="left"> 
                <input type="text" name="E03DEAACC" size="13" maxlength="12" value="<%= loans.getE03DEAACC().trim() %>" readonly>
              </div>
            </td>
            <td nowrap width="16%"> 
              <div align="right"><b>Moneda : </b></div>
            </td>
            <td nowrap width="16%"> 
              <div align="left"><b> 
                <input type="text" name="E03DEACCY" size="4" maxlength="3" value="<%= loans.getE03DEACCY().trim()%>" readonly>
                </b> </div>
            </td>
            <td nowrap width="16%"> 
              <div align="right"><b>Producto : </b></div>
            </td>
            <td nowrap width="16%"> 
              <div align="left">
                <input type="text" name="E03DEAACD" size="4" maxlength="4" value="<%= loans.getE03DEAACD().trim()%>" readonly>
                <input type="text" name="E03DEAPRO" size="4" maxlength="4" value="<%= loans.getE03DEAPRO().trim()%>" readonly>
              </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>


<%
	if (EDL013503List.getNoResult()) {
%>
<table class="tbenter" width=100% height=90%>
	<tr>
		<td>
		<div align="center">
			<font size="3">
				<b> No hay resultados que correspondan a su criterio de búsqueda. </b>
			</font>
		</div>
		</td>
	</tr>
</table>
<%
	} else {
%>

	<table id="headTable" width="100%">
		<tr id="trdark">
			<th align="center" nowrap width="10%">Fecha</th>
			<th align="center" nowrap width="20%">Anterior</th>
			<th align="center" nowrap width="20%">Nuevo</th>
			<th align="center" nowrap width="20%">Usuario</th>
		</tr>
		<%
			EDL013503List.initRow();
				int k = 0;
				boolean firstTime = true;
				String chk = "";
				while (EDL013503List.getNextRow()) {
					if (firstTime) {
						firstTime = false;
						chk = "checked";
					} else {
						chk = "";
					}
					EDL013503Message dlsts = (EDL013503Message) EDL013503List.getRecord();
		%>
		<tr>
			<td nowrap align="center"> <%=Util.formatCell(dlsts.getE03DLSDTD() + "/" + dlsts.getE03DLSDTM() + "/" + dlsts.getE03DLSDTY())%></td>
			<td nowrap align="left"> <%=Util.formatCell(dlsts.getE03DLSOST() + "-" + dlsts.getE03DSCOST())%></td>
			<td nowrap align="left"> <%=Util.formatCell(dlsts.getE03DLSNST() + "-" + dlsts.getE03DSCNST())%></td>
			<td nowrap align="left"> <%=Util.formatCell(dlsts.getE03DLSUSR() + "-" + dlsts.getE03DSCUSR())%></td>
		</tr>
		<%
			}
		%>
	<%
		}
	%>
   </table>

  </form>
</body>
</html>

