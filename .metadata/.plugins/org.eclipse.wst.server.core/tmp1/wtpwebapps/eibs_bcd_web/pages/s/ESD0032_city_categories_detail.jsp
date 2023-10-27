<%@ page import="datapro.eibs.master.Util" %>
<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@ page import="com.datapro.constants.EibsFields" %>
<%@ page import="com.datapro.eibs.constants.HelpTypes" %>

<html>
<head>
<title>City Categories</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/jquery/plugins/contextMenu/css/jquery.contextMenu.css" rel="stylesheet" type="text/css" />
</head>

<jsp:useBean id="msgRcd" class="datapro.eibs.beans.ESD003201Message"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />

<body>
 
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>


<script type="text/javascript">
<%
	String read = "";
 	String disabled = "";
 	boolean readOnly = false;
 	String mandatory = "<img src=\"" + request.getContextPath() + "/images/Check.gif\" alt=\"Campo Obligatorio\" align=\"bottom\" border=\"0\" >";
 	String help = "<img src=\"" + request.getContextPath() + "/images/1b.gif\" title=\"Ayuda\" align=\"bottom\" border=\"0\" style=\"cursor:hand\" >";
 	
 	if (!(userPO.getPurpose().equals("NEW") || userPO.getPurpose().equals("MAINTENANCE"))) 
		{ read = " readonly ";
		  disabled = " disabled"; 
		  mandatory = "";
		  readOnly = true;
	}	
 	boolean isInquiry = userPO.getPurpose().equals("INQUIRY");
 	boolean isReadOnly = isInquiry;
 	String readMnt = (userPO.getPurpose().equals("NEW")?"":" readonly");
 	boolean readMntB = (userPO.getPurpose().equals("NEW")?false:true);
%>


function goAction(op) {
	document.forms[0].SCREEN.value = op;
	if (op == 4) {
		if (!confirm("Desea borrar este registro?")) {
			return;
		}
	}
		
	document.forms[0].submit();
}

</SCRIPT>  

<% 
    if ( !error.getERRNUM().equals("0")  ) {
        out.println("<SCRIPT Language=\"Javascript\">");
        error.setERRNUM("0");
        out.println("       showErrors()");
        out.println("</SCRIPT>");
    }
%>  

<H3 align="center">
<% if (userPO.getPurpose().equals("NEW") || userPO.getPurpose().equals("MAINTENANCE"))  { %>
Mantenimiento
<% } else {%>
Consulta
<% } %>
 de Categorías y SubCategorías de Ciudades
<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="city_categories_detail.jsp, ESD0032"></H3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSESD0032" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="5">
  
  <% int row = 0; %>  
  <h4>Información Básica</h4>  
  <table  class="tableinfo" width="100%">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="<%=(row % 2 == 1) ? "trclear" : "trdark"%><%row++;%>"> 
            <td nowrap width="15%" align="right">País : </td>
            <td nowrap align="left" width="35%">
            	<eibsinput:cnofc name="msgRcd" property="E01CDRCTR" value="<%=msgRcd.getE01CDRCTR()%>" required="true" flag="03" fn_code="E01CDRCTR" fn_description="D01CDRCTR" readonly="<%=readMntB%>" />
            	<INPUT type="text" name="D01CDRCTR" size="47" readonly value="<%= msgRcd.getD01CDRCTR().trim()%>">
			</td>
            <td nowrap width="15%" align="right"></td>
			<td nowrap align="left" width="35%">
			</td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trclear" : "trdark"%><%row++;%>"> 
            <td nowrap width="15%" align="right">Estado / Departamento : </td>
            <td nowrap align="left" width="35%">
            	<input type="text" name="E01CDRSTE" size="5" maxlength="2" value="<%= msgRcd.getE01CDRSTE().trim()%>" <%=read%> >
            	<% if ( !isReadOnly) {%>
            		<a href="javascript:Get2FilterCodes('E01CDRSTE','D01CDRSTE','27', '',document.forms[0]['E01CDRCTR'].value)" ><%=help%></a>
              	<% } %>
              	<%=mandatory %>
            	<INPUT type="text" name="D01CDRSTE" size="47" readonly value="<%= msgRcd.getD01CDRSTE().trim()%>">
     			</td>
            <td nowrap width="15%" align="right"></td>
			<td nowrap align="left" width="35%">
			</td>
          </tr>
        <tr id="<%=(row % 2 == 1) ? "trclear" : "trdark"%><%row++;%>"> 
            <td nowrap width="15%" align="right">Ciudad : </td>
            <td nowrap align="left" width="35%">
            	<input type="text" name="E01CDRCTY" size="5" maxlength="4" value="<%= msgRcd.getE01CDRCTY().trim()%>" <%=read%> >
            	<% if ( !isReadOnly) {%>
            		<a href="javascript:Get2FilterCodes('E01CDRCTY','D01CDRCTY','84', '',document.forms[0]['E01CDRSTE'].value)" ><%=help%></a>
              	<% } %>
              	<%=mandatory %>
            	<INPUT type="text" name="D01CDRCTY" size="47" readonly value="<%= msgRcd.getD01CDRCTY().trim()%>">
			</td>
            <td nowrap width="15%" align="right"></td>
			<td nowrap align="left" width="35%">
			</td>
        </tr> 
        <tr id="<%=(row % 2 == 1) ? "trclear" : "trdark"%><%row++;%>"> 
            <td nowrap width="15%" align="right">Categoría : </td>
            <td nowrap align="left" width="35%">
            	<input type="text" name="E01CDRCTG" size="5" maxlength="3" value="<%= msgRcd.getE01CDRCTG().trim()%>" <%=read%> >
            	<%=mandatory %> 
           </td>
            <td nowrap width="15%" align="right">Descripción : </td>
			<td nowrap align="left" width="35%">
				<input type="text" name="E01CDRCTGD" size="60" maxlength="60" value="<%= msgRcd.getE01CDRCTGD().trim()%>" <%=read%> >
            	<%=mandatory %> 
			</td>
        </tr>
        <tr id="<%=(row % 2 == 1) ? "trclear" : "trdark"%><%row++;%>"> 
            <td nowrap width="15%" align="right">SubCategoría : </td>
            <td nowrap align="left" width="35%">
            	<input type="text" name="E01CDRSCT" size="5" maxlength="4" value="<%= msgRcd.getE01CDRSCT().trim()%>" <%=read%> >
            	<%=mandatory %> 
           </td>
            <td nowrap width="15%" align="right">Descripción : </td>
			<td nowrap align="left" width="35%">
				<input type="text" name="E01CDRSCTD" size="60" maxlength="60" value="<%= msgRcd.getE01CDRSCTD().trim()%>" <%=read%> >
            	<%=mandatory %> 
			</td>
        </tr>   
        <tr id="<%=(row % 2 == 1) ? "trclear" : "trdark"%><%row++;%>">
			<td nowrap width=10% align="right">Tipo de Uso : </td>
			<td  nowrap width=40% align="left">
				<select name="E01CDRTYP" <%=disabled%>>
          		<option value="U" <% if (msgRcd.getE01CDRTYP().equals("U")) out.print("selected");%>>URBANO</option>
               	<option value="R" <% if (msgRcd.getE01CDRTYP().equals("R")) out.print("selected");%>>RURAL</option>
           		</select><%=mandatory %>
			</td>
            <td nowrap width=10% align="right">Estado : </td>
            <td  nowrap width=40% align="left">
            	<select name="E01CDREST" <%=disabled%>>
          		<option value="A" <% if (msgRcd.getE01CDREST().equals("A")) out.print("selected");%>>ACTIVA</option>
               	<option value="I" <% if (msgRcd.getE01CDREST().equals("I")) out.print("selected");%>>INACTIVA</option>
           		</select><%=mandatory %>
       		</td>
	    </tr>	
	   </table> 
      </td>  
    </tr>
  </table>  
  
    <table width="100%">		
  	<tr>
  		<td width="33%">
  		  <div align="center"> 
     		<input id="EIBSBTN" type="button" name="Submit" value="Enviar" onClick="goAction(5);" <%= disabled %>>
     	  </div>	
  		</td>
  		<td width="33%"> 
  		  <div align="center"> 
     		<input id="EIBSBTN" type="button" name="Delete" value="Borrar" onClick="goAction(4);" <%= disabled %>>
     	  </div>	
  		</td>
  		<td width="34%">
  		  <div align="center"> 
     		<input id="EIBSBTN" type="button" name="Exit" value="Salir" 
			<% if (userPO.getPurpose().equals("NEW") || userPO.getPurpose().equals("MAINTENANCE"))  { %>
			    onClick="goAction(1);" 
			<% } else { %>
				onClick="goAction(6);" 
			<% } %>>
     	  </div>	
  		</td>
  	</tr>	
  </table>	
  
  <h4>Información de Auditoria</h4>  
  <table  class="tableinfo" width="100%">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="trdark"> 
            <td nowrap width="15%" align="right">Usuario Creador : </td>
            <td nowrap align="left" width="35%">
            	<%= msgRcd.getE01CDRCUS()%>
			</td>
            <td nowrap width="15%" align="right">Usuario último Cambio : </td>
            <td nowrap width="35%" align="left">
            	<%= msgRcd.getE01CDRMUS()%>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="15%" align="right">Fecha de Proceso - Creación : </td>
			<td nowrap width="35%" align="left">
                <%= datapro.eibs.master.Util.formatCustomDate(currUser.getE01DTF(),Integer.parseInt(msgRcd.getE01CDRCDM()),Integer.parseInt(msgRcd.getE01CDRCDD()),Integer.parseInt(msgRcd.getE01CDRCDY()))%>
            </td>
            <td nowrap width="15%" align="right">Fecha de Proceso - Cambio : </td>
			<td nowrap width="35%" align="left">
                <%= datapro.eibs.master.Util.formatCustomDate(currUser.getE01DTF(),Integer.parseInt(msgRcd.getE01CDRRDM()),Integer.parseInt(msgRcd.getE01CDRRDD()),Integer.parseInt(msgRcd.getE01CDRRDY()))%>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="15%" align="right">Fecha / Hora - Creación : </td>
			<td nowrap width="35%" align="left">
				<%= msgRcd.getE01CDRCTM()%>
            </td>
            <td nowrap width="15%" align="right">Fecha / Hora - Cambio : </td>
			<td nowrap width="35%" align="left"> 
            	<%= msgRcd.getE01CDRMTM()%>
			</td>
          </tr>
        </table> 
      </td>  
    </tr>
  </table>

  </form>
</body>

	<SCRIPT type="text/javascript">
		
	</SCRIPT>


</html>
