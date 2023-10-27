<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@ page import="com.datapro.constants.EibsFields"%>
<%@ page import = "datapro.eibs.master.Util" %>
<html> 
<head>
<title>ACH Operators Detail</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<%-- CSS/JS --%>
<jsp:include page="include/header.jsp"/>

</head>

<SCRIPT src="<%=request.getContextPath()%>/pages/s/javascripts/Ajax.js"> </SCRIPT>
<script	src="<%=request.getContextPath()%>/pages/s/javascripts/json2.js" type="text/javascript"></script>

<jsp:useBean id="EACH300Record" class="datapro.eibs.beans.EACH30001Message"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />


<body>


<script type="text/javascript">

function ctaData(value) {
	var form = document.forms[0];
  	if (value != '' && value != '0' && form['E01ACAACC'].oldValue != value) {
	  	var url = "<%=request.getContextPath()%>/servlet/datapro.eibs.ach.JSACHJSON";
	  	PostXMLRequest(url, "FromRecord=0&shrAcc=" + value, fillFormFields, true);
	   	
	   	form['E01ACAACC'].oldValue = value;
	}   	
}  

function fillFormFields(res) {
	var form = document.forms[0];
   	var data = JSON.parse(res.responseText);
   	if (isValidObject(data.errmsg)) {
   		alert(data.errmsg);
   	} else {
	   	form['E01CUNDSC'].value = data.EWDNME;
	   	form['E01CUSIDN'].value = data.EWDIDN;
	   	form['E01ACACUN'].value = data.EWDCUN;
	   	form['E01DSCTYP'].value = (data.EWDATY == "CA") ? "Cuenta de Ahorros" : "Cuenta Corriente";
	}   	
}
 
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
    String read = "";
    String inq  = "N"; 	
 	String disabled = "";
	if (!(userPO.getPurpose().equals("NEW") || userPO.getPurpose().equals("MAINTENANCE"))) 
		{ read = " readonly ";
		  inq = "Y";
		  disabled = " disabled"; }	
%>

<jsp:include page="include/title.jsp">
  <jsp:param value="document.form[0].action" name="pageName"/>
  <jsp:param value="Autorizaciones de Cliente ACH" name="screenTitle"/>
</jsp:include>
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.ach.JSEACH300" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="5">
  <INPUT TYPE=HIDDEN NAME="TYPE" VALUE="O">

  <table  class="tableinfo" width="100%">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
        <tr id="trdark"> 
            <td nowrap width="15%" align="right">Número de Cliente/Identificación : </td>
            <td nowrap width="35%" align="left"> 
                <INPUT type="text" name="E01ACACUN" size="10"  maxlength="9" <%= read %> value="<%= EACH300Record.getE01ACACUN().trim()%>">
			<% if (userPO.getPurpose().equals("NEW") || userPO.getPurpose().equals("MAINTENANCE"))  { %>
					<A href="javascript:GetCustomerDescId('E01ACACUN','E01CUNDSC','')">
					<IMG src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="bottom" border="0">
				</A>
				<B><IMG src="<%=request.getContextPath()%>/images/Check.gif" title="Campo Obligatorio" align="bottom"></B>
			<% } %>
				<INPUT type="text" name="E01CUSIDN" size="25" value="<%= EACH300Record.getE01CUSIDN().trim()%>" readonly>
			</td>
            <td nowrap width="15%" align="right">Nombre del Cliente:</td>
			<td nowrap width="35%" align="left">
				<INPUT type="text" name="E01CUNDSC" size="40" value="<%= EACH300Record.getE01CUNDSC().trim()%>" readonly>
			</td>
		</tr>
        </table>
      </td>
    </tr>
  </table>

  <h4>Información Básica</h4>  
  <table  class="tableinfo" width="100%">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          
          <tr id="trdark"> 
            <td nowrap width="15%" align="right">Cuenta : </td>
            <td nowrap align="left" width="35%">
				<INPUT type="text" name="E01ACAACC" onBlur="ctaData(this.value)" size="13"  maxlength="12" <%= read %>  value="<%= EACH300Record.getE01ACAACC().trim()%>">
			<% if (userPO.getPurpose().equals("NEW") || userPO.getPurpose().equals("MAINTENANCE"))  { %>
				<A href="javascript:GetAccByClient('E01ACAACC','','RT','','');">
					<IMG src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="bottom" border="0">
				</A> 
		        <B><IMG src="<%=request.getContextPath()%>/images/Check.gif" title="Campo Obligatorio" align="bottom"></B>
			<% } %>
		    </td>
            <td nowrap width="15%" align="right">Tipo de Cuenta : </td>
			<td nowrap width="35%" align="left">
              <input type="text" readonly name="E01DSCTYP" size="20" 
				  value="<% if (EACH300Record.getE01ACAACD().equals("04")) out.print("Cuenta de Ahorros");
							else if (EACH300Record.getE01ACAACD().equals("")) out.print("");
							else out.print("Cuenta Corriente");%>" >
            </td>
          </tr>
          
          <tr id="trclear"> 
            <td nowrap width="15%" align="right">Originador / Compañía : </td>
			<td nowrap width="35%" align="left">
                <INPUT type="text" name="E01ACAOCD" size="11" <%= read %> maxlength="10" value="<%= EACH300Record.getE01ACAOCD().trim()%>">
			<% if (userPO.getPurpose().equals("NEW") || userPO.getPurpose().equals("MAINTENANCE"))  { %>
				<A href="javascript:GetAchOperator('E01ACAOCD','TYPE','E01OCDDSC','R')">
					<IMG src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" border="0" align="top">
				</A>
            	<B><IMG src="<%=request.getContextPath()%>/images/Check.gif" title="Campo Obligatorio" align="bottom"></B>
			<% } %>
            </td>
            <td nowrap width="15%" align="right">Nombre de Empresa : </td>
			<td nowrap width="35%" align="left">
                <INPUT type="text" name="E01OCDDSC" size="41" value="<%= EACH300Record.getE01OCDDSC().trim()%>" readonly>
            </td>
          </tr>
          
          <tr id="trdark"> 
            <td nowrap width="15%" align="right">Ruta y Tránsito : </td>
			<td nowrap width="35%" align="left">
                <INPUT type="text" name="E01ACOCDE" size="11" value="<%= EACH300Record.getE01ACOCDE().trim()%>" readonly>
            </td>
            <td nowrap width="15%" align="right">Tipo Transacción : </td>
			<td nowrap width="35%" align="left">
              <SELECT name="E01ACATYP" <%= disabled %>>
					<OPTION <%= EACH300Record.getE01ACATYP().trim().equals("D")?"Selected":"" %> value="D">Débito</OPTION>
					<OPTION <%= EACH300Record.getE01ACATYP().trim().equals("C")?"Selected":"" %> value="C">Crédito</OPTION>
					<OPTION <%= EACH300Record.getE01ACATYP().trim().equals("B")?"Selected":"" %> value="C">Ambos</OPTION>
				</SELECT>
            </td>
          </tr>

          <tr id="trclear"> 
            <td nowrap width="15%" align="right">Monto  : </td>
			<td nowrap width="35%" align="left"> 
				<INPUT type="text" name="E01ACAMAM" size="22" maxlength="20" <%= read %> value="<%= EACH300Record.getE01ACAMAM().trim()%>" onkeypress="enterSignDecimal()">            </td>
            <td nowrap width="15%" align="right">Estado : </td>
			<td nowrap width="35%" align="left"> 
              <SELECT name="E01ACASTS" <%= disabled %>>
					<OPTION <%= EACH300Record.getE01ACASTS().trim().equals("A")?"Selected":"" %> value="A">Activo</OPTION>
					<OPTION <%= !EACH300Record.getE01ACASTS().trim().equals("A")?"Selected":"" %> value="I">Inactivo</OPTION>
				</SELECT>
	 		</td>
          </tr>

          <tr id="trdark"> 
            <td nowrap width="15%" align="right">Monto Fijo : </td>
			<td nowrap width="35%" align="left"> 
              <SELECT name="E01ACAFIX" <%= disabled %>>
					<OPTION <%= EACH300Record.getE01ACAFIX().trim().equals("Y")?"Selected":"" %> value="Y">Sí</OPTION>
					<OPTION <%= EACH300Record.getE01ACAFIX().trim().equals("N")?"Selected":"" %> value="N">No</OPTION>
				</SELECT>
	 		</td>
            <td nowrap width="15%" align="right">Una transacción : </td>
			<td nowrap width="35%" align="left"> 
              <SELECT name="E01ACASGL" <%= disabled %>>
					<OPTION <%= EACH300Record.getE01ACASGL().trim().equals("Y")?"Selected":"" %> value="Y">Sí</OPTION>
					<OPTION <%= EACH300Record.getE01ACASGL().trim().equals("N")?"Selected":"" %> value="N">No</OPTION>
				</SELECT>
	 		</td>
          </tr>

          <tr id="trclear"> 
            <td nowrap width="15%" align="right">Fecha de Emisión : </td>
			<td nowrap width="35%" align="left">
			<% if (userPO.getPurpose().equals("NEW") || userPO.getPurpose().equals("MAINTENANCE"))  { %>
				<eibsinput:date name="EACH300Record" fn_month="E01ACAADM" fn_day="E01ACAADD" fn_year="E01ACAADY" />
			<% } else { %>
				<eibsinput:date name="EACH300Record" fn_month="E01ACAADM" fn_day="E01ACAADD" fn_year="E01ACAADY" readonly="true" />
			<% } %>            
            </td>
            <td nowrap width="15%" align="right">Fecha Expiración : </td>
			<td nowrap width="35%" align="left">
			<% if (userPO.getPurpose().equals("NEW") || userPO.getPurpose().equals("MAINTENANCE"))  { %>
				<eibsinput:date name="EACH300Record" fn_month="E01ACAXDM" fn_day="E01ACAXDD" fn_year="E01ACAXDY" />
			<% } else { %>
				<eibsinput:date name="EACH300Record" fn_month="E01ACAXDM" fn_day="E01ACAXDD" fn_year="E01ACAXDY" readonly="true"/>
			<% } %>            
			
			
            </td>
          </tr>


          <tr id="trdark"> 
            <td nowrap width="15%" align="right">Secuencia : </td>
			<td nowrap width="35%" align="left">
                <INPUT type="text" name="E01ACASEQ" size="11" value="<%= EACH300Record.getE01ACASEQ().trim()%>" readonly>
			</td>
            <td nowrap width="15%" align="right"></td> 
            <td nowrap width="35%" align="left"></td>
          </tr>

          <tr id="clear"> 
            <td nowrap width="15%" align="right"></td> 
            <td nowrap width="35%" align="left"></td>
            <td nowrap width="15%" align="right"></td> 
            <td nowrap width="35%" align="left"></td>
          </tr>

        </table> 

      </td>  
    </tr>
  </table>

<% if (userPO.getPurpose().equals("NEW") || userPO.getPurpose().equals("MAINTENANCE"))  { %>  
	<table  class="tableinfo" width="100%">		
	    <tr bordercolor="#FFFFFF">
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
     		<input id="EIBSBTN" type=submit name="Exit" value="Salir" onClick="goAction(1);">
     	  </div>	
  		</td>

  	</tr>	
  </table>	

<% } else { %>

	<table  class="tableinfo" width="100%">		
	    <tr bordercolor="#FFFFFF">
  		<td width="100%">
  		  <div align="center">
     		<input id="EIBSBTN" type=submit name="Exit" value="Salir" onClick="goAction(6);">
     	  </div>	
  		</td>

  	</tr>	
  </table>	


<% } %>
  
  <h4>Información de Auditoria</h4>  
  <table  class="tableinfo" width="100%">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="trdark"> 
            <td nowrap width="15%" align="right">Usuario Creador : </td>
            <td nowrap align="left" width="35%">
            	<%= EACH300Record.getE01ACACUS()%>
			</td>
            <td nowrap width="15%" align="right">Usuario último Cambio : </td>
            <td nowrap width="35%" align="left">
            	<%= EACH300Record.getE01ACAMUS()%>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="15%" align="right">Fecha de Proceso - Creación : </td>
			<td nowrap width="35%" align="left">
                <%= datapro.eibs.master.Util.formatCustomDate( currUser.getE01DTF(), EACH300Record.getE01ACACDM(),EACH300Record.getE01ACACDD(),EACH300Record.getE01ACACDY())%>
            </td>
            <td nowrap width="15%" align="right">Fecha de Proceso - Cambio : </td>
			<td nowrap width="35%" align="left">
                <%= datapro.eibs.master.Util.formatCustomDate( currUser.getE01DTF(), EACH300Record.getE01ACARDM(),EACH300Record.getE01ACARDD(),EACH300Record.getE01ACARDY())%>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="15%" align="right">Fecha / Hora - Creación : </td>
			<td nowrap width="35%" align="left">
				<%= EACH300Record.getE01ACACTM()%>
            </td>
            <td nowrap width="15%" align="right">Fecha / Hora - Cambio : </td>
			<td nowrap width="35%" align="left">
            	<%= EACH300Record.getE01ACAMTM()%>
            </td>
          </tr>
        </table> 
      </td>  
    </tr>
  </table>


  </form>
</body>
</html>
