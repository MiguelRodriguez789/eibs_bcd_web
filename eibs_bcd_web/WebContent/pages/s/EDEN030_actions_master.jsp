<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@ page import = "datapro.eibs.master.Util" %>
 
<html>
<head>
<title>Lista de Control</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet"> 

</head>

<jsp:useBean id="EDEN030Record" class="datapro.eibs.beans.EDEN03001Message"  scope="session" /> 
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />
 
<body>

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript">

function goAction(op) {
	document.forms[0].SCREEN.value = op;
	if (op == 4) {
		if (!confirm("Desea borrar este registro?")) {
			return;
		}
		document.forms[0].Delete.disabled = true;
	}
	if (op == 5) {
		document.forms[0].Submit.disabled = true;
	}
	submitForm();
}

</SCRIPT>  
 

<% 
    if ( !error.getERRNUM().equals("0")  ) {
        out.println("<SCRIPT Language=\"Javascript\">");
        error.setERRNUM("0");
        out.println("       showErrors()");
        out.println("</SCRIPT>");
    }
	String read = "";
	String readMnt = "";
 	String disabled = "";
 	String disabledS = "";
 	boolean readOnly = false;
 	boolean readOnlyS = false; 
 	String mandatory = "<img src=\"" + request.getContextPath() + "/images/Check.gif\" title=\"campo obligatorio\" align=\"bottom\" border=\"0\" >";
 	String tf = "false";
 	
	if (!(userPO.getPurpose().equals("NEW") || userPO.getPurpose().equals("MAINTENANCE"))) 
		{ read = " readonly ";
		  disabled = " disabled";
		  readOnly = true; 
		  mandatory = "";
		}	
	if (userPO.getPurpose().equals("MAINTENANCE")) 
		{ readMnt = " readonly";
		  disabledS = " disabled";
		  readOnlyS = true;
		}		
	
%>


<H3 align="center">Mantenimiento de Acciones<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="actions_master.jsp, EDEN030"></H3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.ofac.JSEDEN030" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="5">

<%int row = 0; %>
  <table  class="tableinfo" width="100%">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
        <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="15%" align="right">Fuente :</td>
            <td nowrap width="35%" align="left">
				<eibsinput:cnofc name="EDEN030Record" property="E01SRC" value="<%=EDEN030Record.getE01SRC()%>"  maxlength="4"  required="true" flag="DB" fn_code="E01SRC" fn_description="D01SRC" readonly="<%=readOnlyS %>"/> 
			</td>
            <td nowrap width="15%" align="right">Tipo de Coincidencia :</td>
			<td nowrap width="35%" align="left">
            	<SELECT name="E01TYP"  <%= disabledS %>>
					<OPTION <%= EDEN030Record.getE01TYP().trim().equals("I")?"Selected":"" %> value="I">Identificación</OPTION>
					<OPTION <%= EDEN030Record.getE01TYP().trim().equals("W")?"Selected":"" %> value="W">Palabra/Sonido</OPTION>
					<OPTION <%= EDEN030Record.getE01TYP().trim().equals("B")?"Selected":"" %> value="B">Cualquiera</OPTION>
				</SELECT>
            	<%=mandatory %>
			</td>
		</tr>
		<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="15%" align="right">Descripción de la Fuente :</td>
            <td nowrap width="35%" align="left"> 
				<INPUT type="text" name="D01SRC" id="D01SRC" size="60" value="<%= EDEN030Record.getD01SRC().trim()%>" readonly> 
			</td>
            <td nowrap width="15%" align="right"></td>
			<td nowrap width="35%" align="left">
			</td>
		</tr>
        </table>
      </td>
    </tr>
  </table>

  <h4>Acción a Tomar</h4>
    
  <table  class="tableinfo" width="100%">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
         	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            	<td nowrap width="15%" align="right">Acción :</td>
            	<td nowrap width="35%"> 
              		<SELECT name="E01ACC"  <%= disabled %>>
					<OPTION <%= EDEN030Record.getE01ACC().trim().equals("B")?"Selected":"" %> value="B">Bloquear</OPTION>
					<OPTION <%= EDEN030Record.getE01ACC().trim().equals("A")?"Selected":"" %> value="A">Alertar</OPTION>
				</SELECT>
            	<%=mandatory %>
            	</td>
            	<td nowrap width="15%" align="right"></td>
            	<td nowrap width="35%"> 
            	</td>
          	</tr>
         	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            	<td nowrap width="15%" align="right">Aprobar por Area :</td>
            	<td nowrap width="35%" align="left">
                	<eibsinput:cnofc name="EDEN030Record" property="E01ARE" value="<%=EDEN030Record.getE01ARE()%>"  maxlength="4"  required="true" flag="AR" fn_code="E01ARE" fn_description="D01ARE" readonly="<%=readOnly %>"/>
            	</td>
            	<td nowrap width="15%" align="right">Descripción del Area :</td>
            	<td nowrap width="35%" align="left">
            		<INPUT type="text" name="D01ARE" id="D01ARE" size="60" value="<%= EDEN030Record.getD01ARE().trim()%>" readonly>
            	</td>
         	</tr>
        	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
              	<td nowrap width="15%" align="right">Direcciones de Correo Electronico :</td>
              	<td nowrap width="35%" align="left"> 
              		<textarea name="E01EMA" cols="50" rows="10" <%=read%>><%=EDEN030Record.getE01EMA()%></textarea>  
              	</td>
              	<td nowrap width="15%" align="right"></td>
              	<td nowrap width="35%" align="left">
              	</td>
            </tr>

        </table>
        </td>
    </tr>
  </table>

 <br> 
    
    <table width="100%">		
  	<tr>
  		<td width="33%">
  		  <div align="center"> 
     		<input id="EIBSBTN" type=button name="Submit" value="Enviar" onClick="goAction(5);" <%= disabled %>>
     	  </div>	
  		</td>
  		<td width="33%"> 
  		  <div align="center"> 
     		<input id="EIBSBTN" type=button name="Delete" value="Borrar" onClick="goAction(4);" <%= disabled %>>
     	  </div>	
  		</td>
  		<td width="34%">
  		  <div align="center"> 
     		<input id="EIBSBTN" type=submit name="Exit" value="Salir" 
			<% if (userPO.getPurpose().equals("NEW") || userPO.getPurpose().equals("MAINTENANCE"))  { %>
			    onClick="goAction(1);" 
			<% } else { %>
				onClick="goAction(6);" 
			<% } %>>
     	  </div>	
  		</td>

  	</tr>	
  </table>	

  </form>
</body>

<SCRIPT type="text/javascript">

</SCRIPT>
</html>
