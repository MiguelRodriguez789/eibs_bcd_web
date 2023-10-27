<html>
<head>
<title>Titulares</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/jquery/plugins/contextMenu/css/jquery.contextMenu.css" rel="stylesheet" type="text/css" />

<jsp:useBean id= "rtTit" class= "datapro.eibs.beans.ESD000006Message"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>


<SCRIPT type="text/javascript">

<% if ( userPO.getOption().equals("RT") ) { %>
	builtNewMenu(rt_m_opt);
<% } else if ( userPO.getOption().equals("SV") ) { %>
	builtNewMenu(sv_m_opt);
<% } %>


</SCRIPT>

</head>


<body bgcolor="#FFFFFF">


<% 
 if ( !error.getERRNUM().equals("0")  ) {
     out.println("<SCRIPT Language=\"Javascript\">");
     error.setERRNUM("0");
     out.println("       showErrors();");
     out.println("</SCRIPT>");
 }
   out.println("<SCRIPT> initMenu(); </SCRIPT>");
%>

<h3 align="center">Informaci&oacute;n de Titulares<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="rt_tit.jsp,EDD0000"></h3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEXEDD0000" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" id="SCREEN" VALUE="18">
  <table  class="tableinfo">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
          <tr id="trdark"> 
            <td nowrap width="16%" > 
              <div align="right"><b>Cliente :</b></div>
            </td>
            <td nowrap width="20%" > 
              <div align="left"> 
                <input type="text" name="E06CUN" id="E06CUN" size="9" maxlength="9" readonly value="<%= userPO.getCusNum().trim() %>">
              </div>
            </td>
            <td nowrap width="16%" > 
              <div align="right"><b>Nombre :</b> </div>
            </td>
            <td nowrap colspan="3" > 
              <div align="left"> 
                <input type="text" name="E06NA1" id="E06NA1" size="45" maxlength="45" readonly value="<%= userPO.getCusName().trim()%>">
              </div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="16%"> 
              <div align="right"><b>Cuenta :</b></div>
            </td>
            <td nowrap width="20%"> 
              <div align="left"> 
                <input type="text" name="E06ACC" id="E06ACC" size="12" maxlength="12" value="<%= userPO.getAccNum().trim()%>" readonly >
              </div>
            </td>
            <td nowrap width="16%"> 
              <div align="right"><b>Moneda :</b></div>
            </td>
            <td nowrap width="16%"> 
              <div align="left"> 
                <input type="text" name="E06CCY" id="E06CCY" size="3" maxlength="3" value="<%= userPO.getCurrency().trim()%>" readonly>
              </div>
            </td>
            <td nowrap width="16%"> 
              <div align="right"><b>Producto :</b></div>
            </td>
            <td nowrap width="16%"> 
              <div align="left"> 
                <input type="text" name="E06PRO" id="E06PRO" size="5" maxlength="4" readonly value="<%= userPO.getProdCode().trim()%>">
              </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <h4>Titulares</h4>
  <table  class="tableinfo">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table id="headTable" width="100%">
          <tr id="trdark"> 
            <td nowrap> 
              <div align="center">N&uacute;mero</div>
            </td>
            <td nowrap> 
              <div align="center">Nombre y Apellidos</div>
            </td>
            <td nowrap> 
              <div align="center">Identificaci&oacute;n</div>
            </td>
            <td nowrap> 
              <div align="center">Tipo Relaci&oacute;n</div>
            </td>
            <td nowrap> 
              <div align="center">% Relaci&oacute;n</div>
            </td>
          </tr>
          <%
  				   int amount = 9;
 				   String name;
  					for ( int i=1; i<=amount; i++ ) {
   					  name = i + "";
   			%> 
          <tr id="trclear"> 
            <td nowrap> 
              <div align="center"> 
                <input type="text" name="E06CU<%= name %>" id="E06CU<%= name %>" size="9" maxlength="9" value="<%= rtTit.getField("E06CU"+name).getString().trim()%>" 
				class="context-menu-help" onmousedown="init(custdescidHelp,this.name,'','','E06MA<%= name %>','E06NM<%= name %>','')" onKeyPress="enterInteger(event)">
              </div>
            </td>
            <td nowrap> 
              <div align="center"> 
                <input type="text" name="E06MA<%= name %>" id="E06MA<%= name %>" size="40" maxlength="45" value="<%= rtTit.getField("E06MA"+name).getString().trim()%>" readonly>
              </div>
            </td>
            <td nowrap> 
              <div align="center"> 
	          	  <%if (!rtTit.getField("E06NM"+name).getString().equals("")){%> 
	              <input type="text" name="E06NM<%= name %>" id="E06NM<%= name %>" maxlength="30" size="31" value="<%= rtTit.getField("E06NM"+name).getString().trim()%>" readonly>
	          	  <%} else {%>
	              <input type="hidden" name="E06ID<%= name %>" id="E06ID<%= name %>" value="<%= rtTit.getField("E06ID"+name).getString().trim()%>">
	              <input type="text" name="E06NM<%= name %>" id="E06NM<%= name %>" maxlength="30" size="31" value="<%= rtTit.getField("E06ID"+name).getString().trim()%>" readonly>
	          	  <%}%>
              </div>
            </td>
            <td nowrap> 
              <div align="center"> 
                <input type="text" name="E06TY<%= name %>" id="E06TY<%= name %>" size="2"  maxlength="1"
				class="context-menu-help" onmousedown="init(accholdersHelp,this.name,'','','','','')"  value="<%= rtTit.getField("E06TY"+name).getString().trim()%>" >
              </div>
            </td>
            <td nowrap> 
              <div align="center"> 
                <input type="text" name="E06PR<%= name %>" id="E06PR<%= name %>" size="6" maxlength="5" onKeyPress="enterDecimal()" value="<%= rtTit.getField("E06PR"+name).getString().trim()%>">
              </div>
            </td>
          </tr>
          <%
    		}
    		%> 
        </table>
      </td>
    </tr>
  </table>
  <br>
          <div align="center"> 
            <input id="EIBSBTN" type=submit name="Submit" value="Enviar">
          </div>
</form>
</body>
</html>
