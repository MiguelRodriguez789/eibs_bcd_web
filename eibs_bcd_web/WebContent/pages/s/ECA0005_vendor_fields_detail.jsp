<%@ page import="datapro.eibs.master.Util" %>
<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@ page import="com.datapro.constants.EibsFields" %>
<%@ page import="com.datapro.eibs.constants.HelpTypes" %>

<html>
<head>
<title>Interfaces y Canales</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/jquery/plugins/contextMenu/css/jquery.contextMenu.css" rel="stylesheet" type="text/css" />
</head>

<jsp:useBean id="msgRcd" class="datapro.eibs.beans.ECA000501Message"  scope="session" />
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
 de Campos por Proveedor
<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="vendor_fields_detail.jsp, ECA0005"></H3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.interfaces.JSECA0005" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="5">
  <INPUT TYPE=HIDDEN NAME="file" VALUE="">
  
  <h4>Información Básica</h4>  
  <table  class="tableinfo" width="100%">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="trdark"> 
            <td nowrap width="15%" align="right">Canal / Interface : </td>
            <td nowrap align="left" width="35%">
            	<INPUT type="text" name="E01VNDNOI" maxlength="10" size="12" <%=readMnt%> value="<%= msgRcd.getE01VNDNOI().trim()%>">
           		<% if (!readMntB) { %>
            	<a href="javascript:GetInterfaz('E01VNDNOI','D01NOI','file')" >
                <img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="bottom" border="0" ></a>
                <% } %>
            	<%=mandatory %>
            	<INPUT type="text" name="D01NOI" size="47" readonly value="<%= msgRcd.getD01NOI().trim()%>">
			</td>
            <td nowrap width="15%" align="right">Campo : </td>
			<td nowrap align="left" width="35%">
            	<INPUT type="text" name="E01VNDFLD" maxlength="10" size="12" <%=readMnt%> value="<%= msgRcd.getE01VNDFLD().trim()%>">
            	<% if (!readMntB) { %>
            	<a href="javascript:GetFieldMst('E01VNDFLD','D01FLD', document.forms[0]['file'].value)" >
                <img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="bottom" border="0" ></a>
                <% } %>
            	<%=mandatory %>
			</td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="15%" align="right">Proveedor : </td>
            <td nowrap align="left" width="35%">
            	<eibsinput:cnofc name="msgRcd" property="E01VNDCOD" value="<%=msgRcd.getE01VNDCOD()%>" required="true" flag="BT" fn_code="E01VNDCOD" fn_description="D01COD" readonly="<%=readMntB%>" />
            	<INPUT type="text" name="D01COD" size="47" readonly value="<%= msgRcd.getD01COD().trim()%>">
			</td>
            <td nowrap width="15%" align="right">Descripción : </td>
			<td nowrap align="left" width="35%">
            	<INPUT type="text" name="D01FLD" size="47" readonly value="<%= msgRcd.getD01FLD().trim()%>">
			</td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="15%" align="right">Creación Permitida : </td>
			<td nowrap align="left" width="35%">
            	<SELECT name="E01VNDCRT" <%= disabled %>>
            		<OPTION <%= msgRcd.getE01VNDCRT().trim().equals("Y")?"Selected":"" %> value="Y">SI</OPTION>
					<OPTION <%= msgRcd.getE01VNDCRT().trim().equals("N")?"Selected":"" %> value="N">NO</OPTION>
				</SELECT>
				<%=mandatory %>
			</td>
            <td nowrap width="15%" align="right">Actualización Permitida : </td>
            <td nowrap width="35%" align="left"> 
              	<SELECT name="E01VNDUPD" <%= disabled %>>
					<OPTION <%= msgRcd.getE01VNDUPD().trim().equals("Y")?"Selected":"" %> value="Y">SI</OPTION>
					<OPTION <%= msgRcd.getE01VNDUPD().trim().equals("N")?"Selected":"" %> value="N">NO</OPTION>
				</SELECT>
				<%=mandatory %>
            </td>
          </tr>
          <tr id="trclear"  > 
             <td nowrap width="15%" align="right" colspan="1">Comentarios :</td>
              <td nowrap width="85%" align="left">
              	<textarea name="E01VNDRMK" cols="80" rows="4" <%=read%>><%=msgRcd.getE01VNDRMK()%></textarea>
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
            	<%= msgRcd.getE01VNDCUS()%>
			</td>
            <td nowrap width="15%" align="right">Usuario último Cambio : </td>
            <td nowrap width="35%" align="left">
            	<%= msgRcd.getE01VNDMUS()%>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="15%" align="right">Fecha de Proceso - Creación : </td>
			<td nowrap width="35%" align="left">
                <%= datapro.eibs.master.Util.formatCustomDate(currUser.getE01DTF(),Integer.parseInt(msgRcd.getE01VNDCDM()),Integer.parseInt(msgRcd.getE01VNDCDD()),Integer.parseInt(msgRcd.getE01VNDCDY()))%>
            </td>
            <td nowrap width="15%" align="right">Fecha de Proceso - Cambio : </td>
			<td nowrap width="35%" align="left">
                <%= datapro.eibs.master.Util.formatCustomDate(currUser.getE01DTF(),Integer.parseInt(msgRcd.getE01VNDRDM()),Integer.parseInt(msgRcd.getE01VNDRDD()),Integer.parseInt(msgRcd.getE01VNDRDY()))%>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="15%" align="right">Fecha / Hora - Creación : </td>
			<td nowrap width="35%" align="left">
				<%= msgRcd.getE01VNDCTM()%>
            </td>
            <td nowrap width="15%" align="right">Fecha / Hora - Cambio : </td>
			<td nowrap width="35%" align="left"> 
            	<%= msgRcd.getE01VNDMTM()%>
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
