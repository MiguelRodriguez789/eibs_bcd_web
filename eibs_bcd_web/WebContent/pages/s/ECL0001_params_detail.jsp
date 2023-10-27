<html>
<head>
<title>Parámetros de Call Center</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id="callDetail" class="datapro.eibs.beans.ECL0001DSMessage"  scope="session" />
<jsp:useBean id="error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />
<jsp:useBean id="currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>

<script type="text/javascript">

</SCRIPT>  

</head>

<% 
    if (!error.getERRNUM().equals("0")) {
        out.println("<SCRIPT Language=\"Javascript\">");
        error.setERRNUM("0");
        out.println("       showErrors()");
        out.println("</SCRIPT>");
    }
%>

<body>
<H3 align="center">Parámetros de Call Center<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="params_detail.jsp, ECL0001"></H3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.misc.JSECL0001">
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="600">
  <table  class="tableinfo">
    <tr >         
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="trdark"> 
            <td nowrap width="25%"> 
            	<div align="right">Banco :</div>
            </td>
            <td nowrap width="25%">
            	<input type="text" name="E01CATBNK" size="3" maxlength="2" value="<%= callDetail.getE01CATBNK()%>" onKeyPress="enterInteger(event)" <% if (userPO.getPurpose().equals("NEW")) { out.print(""); } else { out.print("readonly"); } %>>
			</td>
            <td nowrap width="25%">
            	<div align="right">Canal :</div>
            </td>
            <td nowrap width="25%">
            	<input type="text" name="E01CATCNL" size="3" maxlength="2" value="<%= callDetail.getE01CATCNL()%>" onKeyPress="enterInteger(event)" <% if (userPO.getPurpose().equals("NEW")) { out.print(""); } else { out.print("readonly"); } %>>	        
            	<% if (userPO.getPurpose().equals("NEW")) { %>
                <a href="javascript:GetCodeCNOFC('E01CATCNL','CN')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="ayuda" align="bottom" border="0" ></a> 
            	<% } %>
			</td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="25%"> 
            	<div align="right">Cantidad de Preguntas Tipo I :</div>
            </td>
            <td nowrap width="25%">
            	<input type="text" name="E01CATQT1" size="3" maxlength="2" value="<%= callDetail.getE01CATQT1()%>" onKeyPress="enterInteger(event)">	        
			</td>
            <td nowrap width="25%">
            	<div align="right">Cantidad de Preguntas Tipo II :</div>
            </td>
            <td nowrap width="25%">
            	<input type="text" name="E01CATQT2" size="3" maxlength="2" value="<%= callDetail.getE01CATQT2()%>" onKeyPress="enterInteger(event)">	        
			</td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="25%"> 
            	<div align="right">Cantidad de Respuestas Inválidas :</div>
            </td>
            <td nowrap width="25%">
            	<input type="text" name="E01CATERR" size="2" maxlength="1" value="<%= callDetail.getE01CATERR()%>" onKeyPress="enterInteger(event)">	        
			</td>
            <td nowrap width="25%">
            	<div align="right">Cantidad de Reintentos :</div>
            </td>
            <td nowrap width="25%">
            	<input type="text" name="E01CATINT" size="2" maxlength="1" value="<%= callDetail.getE01CATINT()%>" onKeyPress="enterInteger(event)">	        
			</td>
          </tr>
         </table>
       </td>
    </tr>
  </table>
  <br>
  <div align="center"> 
     <input id="EIBSBTN" type="submit" name="Submit" value="Enviar">
  </div>
 </form>

</body>
</html>
