<%@ page import = "datapro.eibs.master.Util" %>
<html>
<head>
<title>Codigos de Referencia Tarjetas de Crédito</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "ESI000002Help" class= "datapro.eibs.beans.JBObjList"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>

</head>

<BODY>
<h3 align="center">Consulta Consolidada de Cliente - SICRI  
<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="cnofc_cc_list.jsp, ECC0030"></h3>

<hr size="4">
<FORM name="form1" METHOD="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.params.JSECC0030" >
 
    <%
	if ( ESI000002Help.getNoResult() ) {
 %>
  <p>&nbsp;</p>
  <p>&nbsp;</p>
  <p>&nbsp;</p>
  <p>&nbsp;</p>
  <p>&nbsp;</p>
  <TABLE class="tbenter" width="100%" >
    <TR>
      <TD > 
        <div align="center"> 
          <p><b>No hay resultados para su b&uacute;squeda</b></p>
          <table class="tbenter" width=100% align=center>
            <tr> 
              <td class=TDBKG width="30%"> 
                <div align="center"><a href="javascript:goAction(1)"><b>Crear</b></a></div>
              </td>
              <td class=TDBKG width="30%"> 
                <div align="center"><a href="<%=request.getContextPath()%>/pages/background.jsp"><b>Salir</b></a></div>
              </td>
            </tr>
          </table>
          <p>&nbsp;</p>
          
        </div>

	  </TD>
	</TR>
    </TABLE>
	
  <%  
		}
	else {
%> <% 
 if ( !error.getERRNUM().equals("0")  ) {
     error.setERRNUM("0");
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
     }

%> 
  <br>
  <table  id=cfTable class="tableinfo">
    <tr > 
      <td NOWRAP valign="top" width="100%"> 
        <table id="headTable" width="100%">
          <tr id="trdark"> 
            <th align=CENTER nowrap width="5%">Tipo Crédito</th>
            <th align=CENTER nowrap width="25%">Descripci&oacute;n</th>
            <th align=CENTER nowrap width="20%">Vigente</th>
            <th align=CENTER nowrap width="20%">Reestructura</th>
            <th align=CENTER nowrap width="15%">Vencido</th>
            <th align=CENTER nowrap width="15%">Litigio</th>
          </tr>
          <%
                ESI000002Help.initRow();
				boolean firstTime = true;
				String chk = "";
        		while (ESI000002Help.getNextRow()) {
					if (firstTime) {
						firstTime = false;
						chk = "checked";
					} else {
						chk = "";
					}
                  	datapro.eibs.beans.ESI000002Message msgList = (datapro.eibs.beans.ESI000002Message) ESI000002Help.getRecord();
		 %>
          <tr> 
            <td NOWRAP  align=CENTER width="5%"> 
              <input type="radio" name="CURRCODE" value="<%= ESI000002Help.getCurrentRow() %> "  <%=chk%>>
              <%= msgList.getE02WCUENT() %>
            </td>
            <td NOWRAP  align=LEFT width="25%"><%= msgList.getE02WDESCR() %></td>
            <td NOWRAP  align=LEFT width="20%"><%= msgList.getE02WVIGEN() %></td>
            <td NOWRAP  align=LEFT width="20%"><%= msgList.getE02WREEST() %></td>
            <td NOWRAP  align=LEFT width="15%"><%= msgList.getE02WVENCI() %></td>
            <td NOWRAP  align=LEFT width="15%"><%= msgList.getE02WLITIG() %></td>
          </tr>
          <%
                }
              %>
        </table>
  </table>
     
  <SCRIPT type="text/javascript">
 showChecked("CURRCODE");
     
</SCRIPT>

<%}%>


  </form>

</body>
</html>
