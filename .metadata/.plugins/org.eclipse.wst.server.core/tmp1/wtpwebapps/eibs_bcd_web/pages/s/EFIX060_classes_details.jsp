<html>
<head>
<title>Tablas de prevision</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

</head>

<jsp:useBean id="loc" class="datapro.eibs.beans.EFIX06001Message"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />

<body>

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>
<% 
    if ( !error.getERRNUM().equals("0")  ) {
        out.println("<SCRIPT Language=\"Javascript\">");
        error.setERRNUM("0");
        out.println("       showErrors()");
        out.println("</SCRIPT>");
    }
    
%>
<H3 align="center">Clases de Activos Fijos
	<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="classes_details.jsp, EFIX060"></H3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.amort.JSEFIX060" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="600">
  
  <%int row = 0; %>
  <table  class="tableinfo">
    <tr> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap width="50%" > 
              <div align="right">N&uacute;mero :</div>
            </td>
            <td nowrap width="50%" > 
              <div align="left"> 
                <%if (userPO.getPurpose().equals("NEW")) { %>
                <input type="text" name="E01CLSNUM" size="6" maxlength="5"  value="<%= loc.getE01CLSNUM().trim()%>" onkeypress="enterInteger(event)" >
                <% } else { %>
                <input type="text" name="E01CLSNUM" readonly size="6" maxlength="5"  value="<%= loc.getE01CLSNUM().trim()%>" >
				<% } %>                
              </div>
            </td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap width="50%" > 
              <div align="right">Descripción :</div>
            </td>
            <td nowrap width="50%" ><font face="Arial"><font face="Arial"><font size="2"> 
              <input type="text" name="E01CLSNME" size="48"  maxlength="45" value="<%= loc.getE01CLSNME().trim()%>">
              </font></font></font></td>
          </tr>
          
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap width="50%" > 
            	<div align="right">Categorías :</div>
            </td>
            <td nowrap width="50%" >
              <input type="text" name="E01CLSGRP" size="6" maxlength="4" value="<%= loc.getE01CLSGRP()%>">
              <a href="javascript:GetCodeCNOFC('E01CLSGRP','F1')">
              	<img src="<%=request.getContextPath()%>/images/1b.gif" title=". . ." align="bottom" border="0" ></a> 
            </td>
          </tr>
          
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
            <td nowrap width="16%" > 
              <div align="right">Cuenta Contable :</div>
            </td>
            <td nowrap width="20%" >
              <div align="left"> 
                <input type="text" name="E01CLSGLN" size="17" maxlength="16" value="<%= loc.getE01CLSGLN()%>" >
                <a href="javascript:GetLedger('E01CLSGLN','01','','')"><img src="<%=request.getContextPath()%>/images/1b.gif" title=". . ." align="bottom" border="0" ></a> 
                <input type="text" name="E01GLNDSC" size="50" maxlength="35" value="<%= loc.getE01GLNDSC()%>" >
              </div>
            </td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap width="16%" > 
              <div align="right">Vida Util (N&uacute;mero de Meses) :</div>
            </td>
            <td nowrap width="20%" >
              <input type="text" name="E01CLSMTH" size="4" maxlength="3"  value="<%= loc.getE01CLSMTH().trim()%>"  onkeypress="enterInteger(event)">
            </td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap width="16%" > 
              <div align="right">Porcentaje de depreciación :</div>
            </td>
            <td nowrap width="20%" >
              <input type="text" name="E01CLSPRT" size="6" maxlength="5"  value="<%= loc.getE01CLSPRT().trim()%>"  onkeypress="enterDecimal(event, 2)">
            </td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap width="16%" > 
              <div align="right">Tipo de Depreciación :</div>
            </td>
            <td nowrap width="20%" > 
              <div align="left">
                <input type="text" name="E01CLSDTY" size="2" maxlength="1" value="<%= loc.getE01CLSDTY().trim()%>">
                <a href="javascript:GetDepTyp('E01CLSDTY','STATIC_ln_dep_typ.jsp')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="ayuda" align="bottom" border="0" ></a> 
              </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <br>
  <p><br>
  </p>
  <div align="center"> 
	<input id="EIBSBTN" type=submit name="Submit" value="Enviar">
  </div>
  </form>
</body>
</html>
