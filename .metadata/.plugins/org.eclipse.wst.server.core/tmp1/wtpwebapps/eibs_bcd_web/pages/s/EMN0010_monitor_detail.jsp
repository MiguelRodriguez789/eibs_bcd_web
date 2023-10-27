<%@ page import="datapro.eibs.master.Util" %>
<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@ page import="com.datapro.constants.EibsFields" %>
<%@ page import="com.datapro.eibs.constants.HelpTypes" %>

<html>
<head>
<title>Monitoreo</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/jquery/plugins/contextMenu/css/jquery.contextMenu.css" rel="stylesheet" type="text/css" />
</head>

<jsp:useBean id="EMN0010Record" class="datapro.eibs.beans.EMN001001Message"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />

<body>
 
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>

<script type="text/javascript">
<%
	String read = "";
 	String disabled = "";
 	boolean readOnly = false;
 	String mandatory = "<img src=\"" + request.getContextPath() + "/images/Check.gif\" alt=\"Campo Obligatorio\" align=\"bottom\" border=\"0\" >";
 	if (!(userPO.getPurpose().equals("NEW") || userPO.getPurpose().equals("MAINTENANCE"))) 
		{ read = " readonly ";
		  disabled = " disabled"; 
		  mandatory = "";
		  readOnly = true;
	}	
 	boolean isInquiry = userPO.getPurpose().equals("INQUIRY");
 	boolean isReadOnly = isInquiry;
 	
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
 de Archivos y Campos para Monitoreo
<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="monitor_detail.jsp, EMN0010"></H3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.mntor.JSEMN0010" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="5">
  
  <h4>Información Básica</h4>  
  <table  class="tableinfo" width="100%">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="trdark"> 
            <td nowrap width="15%" align="right">Archivo : </td>
            <td nowrap align="left" width="35%">
            	<INPUT type="text" name="E01LOGFIL" maxlength="10" size="12" <%= read %> value="<%= EMN0010Record.getE01LOGFIL().trim()%>">
            	<%=mandatory %>
			</td>
            <td nowrap width="15%" align="right">Campo : </td>
			<td nowrap align="left" width="35%">
            	<INPUT type="text" name="E01LOGFLD" maxlength="10" size="12" <%= read %> value="<%= EMN0010Record.getE01LOGFLD().trim()%>">
            	<%=mandatory %>
			</td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="15%" align="right">Descripción DDS : </td>
            <td nowrap align="left" width="35%">
            	<INPUT type="text" name="E01LOGDDS" maxlength="80" size="40" <%= read %> value="<%= EMN0010Record.getE01LOGDDS().trim()%>">
            	<%=mandatory %>
			</td>
            <td nowrap width="15%" align="right">Descripción Funcional : </td>
			<td nowrap align="left" width="35%">
            	<INPUT type="text" name="E01LOGFNM" maxlength="80" size="40" <%= read %> value="<%= EMN0010Record.getE01LOGFNM().trim()%>">
			</td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="15%" align="right">Tipo : </td>
			<td nowrap align="left" width="35%">
            	<SELECT name="E01LOGTYP" <%= disabled %>>
            		<OPTION <%= EMN0010Record.getE01LOGTYP().trim().equals("A")?"Selected":"" %> value="A">ALFANUMERICO</OPTION>
					<OPTION <%= EMN0010Record.getE01LOGTYP().trim().equals("S")?"Selected":"" %> value="S">NUMERICO ZONA</OPTION>
					<OPTION <%= EMN0010Record.getE01LOGTYP().trim().equals("P")?"Selected":"" %> value="P">NUMERICO EMPAQUETADOO</OPTION>
					<OPTION <%= EMN0010Record.getE01LOGTYP().trim().equals("I")?"Selected":"" %> value="I">NUMERICO ENTERO</OPTION>
					<OPTION <%= EMN0010Record.getE01LOGTYP().trim().equals("B")?"Selected":"" %> value="B">BINARIO</OPTION>
				</SELECT>
			</td>
            <td nowrap width="15%" align="right">Monitorear : </td>
            <td nowrap width="35%" align="left"> 
              	<SELECT name="E01LOGMON" <%= disabled %>>
					<OPTION <%= EMN0010Record.getE01LOGMON().trim().equals("Y")?"Selected":"" %> value="Y">SI</OPTION>
					<OPTION <%= EMN0010Record.getE01LOGMON().trim().equals("N")?"Selected":"" %> value="N">NO</OPTION>
				</SELECT>
				<%=mandatory %>
            </td>
          </tr>
          <tr id="trclear"  > 
             <td nowrap width="15%" align="right" colspan="1">Comentarios :</td>
              <td nowrap width="85%" align="left">
              	<textarea name="E01LOGRMK" cols="80" rows="4" <%=read%>><%=EMN0010Record.getE01LOGRMK()%></textarea>
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
            	<%= EMN0010Record.getE01LOGCUS()%>
			</td>
            <td nowrap width="15%" align="right">Usuario último Cambio : </td>
            <td nowrap width="35%" align="left">
            	<%= EMN0010Record.getE01LOGMUS()%>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="15%" align="right">Fecha de Proceso - Creación : </td>
			<td nowrap width="35%" align="left">
                <%= datapro.eibs.master.Util.formatCustomDate(currUser.getE01DTF(),Integer.parseInt(EMN0010Record.getE01LOGCDM()),Integer.parseInt(EMN0010Record.getE01LOGCDD()),Integer.parseInt(EMN0010Record.getE01LOGCDY()))%>
            </td>
            <td nowrap width="15%" align="right">Fecha de Proceso - Cambio : </td>
			<td nowrap width="35%" align="left">
                <%= datapro.eibs.master.Util.formatCustomDate(currUser.getE01DTF(),Integer.parseInt(EMN0010Record.getE01LOGRDM()),Integer.parseInt(EMN0010Record.getE01LOGRDD()),Integer.parseInt(EMN0010Record.getE01LOGRDY()))%>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="15%" align="right">Fecha / Hora - Creación : </td>
			<td nowrap width="35%" align="left">
				<%= EMN0010Record.getE01LOGCTM()%>
            </td>
            <td nowrap width="15%" align="right">Fecha / Hora - Cambio : </td>
			<td nowrap width="35%" align="left"> 
            	<%= EMN0010Record.getE01LOGMTM()%>
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
