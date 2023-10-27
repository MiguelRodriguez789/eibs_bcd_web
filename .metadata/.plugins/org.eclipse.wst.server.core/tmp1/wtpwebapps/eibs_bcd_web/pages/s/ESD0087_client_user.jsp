<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@ page import = "datapro.eibs.master.Util" %>

<html>
<head>
<title>Client User Detail</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet"> 

</head>

<jsp:useBean id="ESD0087Record" class="datapro.eibs.beans.ESD008701Message"  scope="session" /> 
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />
 
<body>

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript">

function chgTipo(p) {
 	if (p == '1') {
 		document.getElementById("fechaNac").innerHTML = "Fecha de Constituci&oacute;n :";
 		document.getElementById("tel1").innerHTML = "Telefono de Oficina 1 :";
 		document.getElementById("tel2").innerHTML = "Telefono de Oficina 2 :";
		JURIDICO.style.display='block' ;
		NATURAL.style.display='none' ;
	} else {
		document.getElementById("fechaNac").innerHTML = "Fecha de Nacimiento :";
 		document.getElementById("tel1").innerHTML = "Telefono Casa :";
 		document.getElementById("tel2").innerHTML = "Telefono de Oficina :";
		NATURAL.style.display='block' ;
		JURIDICO.style.display='none' ;
	}
 }
 
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
	document.forms[0].submit();
}

 function showInqOFAC(fieldValue) {
	page = "${pageContext.request.contextPath}/servlet/datapro.eibs.helps.JSEWD0092?shrAcc=" + fieldValue + "&shrCategory=ALL" + "&FromRecord=0&shrAction=INQ";
	CenterWindow(page,600,500,2);    
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
 	String disabled = "";
 	String mandatory = "<img src=\"" + request.getContextPath() + "/images/Check.gif\" title=\"campo obligatorio\" align=\"bottom\" border=\"0\" >";
 	String tf = "false";
 	
	if (!(userPO.getPurpose().equals("NEW") || userPO.getPurpose().equals("MAINTENANCE"))) 
		{ read = " readonly ";
		  disabled = " disabled";
		  tf = "true";
		  mandatory = "";
		}	
	
	String chkOfac = "";
	chkOfac = (ESD0087Record.getH01FLGWK3().equals("3") ? "<a href=\"javascript:showInqOFAC('"
								+ ESD0087Record.getE01CUN()
								+ "')\"><img src=\"../images/warning_16.jpg\" title=\"Lista de Control Posible Coincidencia\" align=\"middle\" border=\"0\" ></a>"
								: "");	
%>


<H3 align="center">Mantenimiento de Clientes Tipo Usuario<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="client_user.jsp, ESD0087"></H3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSESD0087" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="5">

  <table  class="tableinfo" width="100%">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
        <tr id="trdark"> 
            <td nowrap width="5%" align="right">Tipo :</td>
            <td nowrap width="10%" align="left">
            	<SELECT name="E01LGT" <%= disabled %> onChange="chgTipo(this.value)" onBlur="chgTipo(this.value)">
					<OPTION <%= ESD0087Record.getE01LGT().trim().equals("1")?"Selected":"" %> value="1">Moral </OPTION>
					<OPTION <%= ESD0087Record.getE01LGT().trim().equals("2")?"Selected":"" %> value="2">Físico  </OPTION>
				</SELECT>
            	<%=mandatory %>
            	 
			</td>
            <td nowrap width="5%" align="right"></td>
			<td nowrap width="40%" align="left">
			</td>
            <td nowrap width="5%" align="right"></td>
			<td nowrap width="35%" align="left">
			</td>
		</tr>
		<tr id="trclear"> 
            <td nowrap width="5%" align="right">Código :</td>
            <td nowrap width="10%" align="left"> 
                <INPUT type="text" name="E01CUN" size="10" readonly value="<%= ESD0087Record.getE01CUN().trim()%>">
                <%=chkOfac%>
			</td>
            <td nowrap width="5%" align="right">Nombre Legal :</td>
			<td nowrap width="40%" align="left">
				<%= ESD0087Record.getE01NA1().trim()%>
			</td>
            <td nowrap width="5%" align="right">Nombre Corto :</td>
			<td nowrap width="35%" align="left">
				<%= ESD0087Record.getE01SHN().trim()%>
			</td>
		</tr>
        </table>
      </td>
    </tr>
  </table>

		<jsp:include page="ESD0080_ident_template_generic.jsp" flush="true">
			<jsp:param name="messageName" value="ESD0087Record" />
			<jsp:param name="readOnly" value="<%=tf%>" />
			<jsp:param name="title" value="Identificaci&oacute;n" />
			<jsp:param name="suffix" value="01" />
			<jsp:param name="newC" value="true" />
			<jsp:param name="nbasic" value="false" />
		</jsp:include>

<div id="NATURAL" style="position:relative; display:none;">
  <h4>Información Básica</h4>  
  <table  class="tableinfo" width="100%">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          
          <tr id="trdark"> 
            <td nowrap width="15%" align="right">Primer Nombre :</td>
            <td nowrap width="35%" align="left"> 
               	<input type="text" name="E01FNA" size="35" maxlength="30" value="<%= ESD0087Record.getE01FNA().trim()%>" <%=read%>>
               	<%=mandatory %>
            </td>
            <td nowrap width="15%" align="right">Segundo Nombre :</td>
            <td nowrap width="35%" align="left">
            	<input type="text" name="E01FN2" size="35" maxlength="30" value="<%= ESD0087Record.getE01FN2().trim()%>" <%=read%>>
            </td>
         </tr>
         <tr id="trclear"> 
            <td nowrap width="15%" align="right">Primer Apellido :</td>
            <td nowrap width="35%" align="left">
                <input type="text" name="E01LN1" size="35" maxlength="30" value="<%= ESD0087Record.getE01LN1().trim()%>" <%=read%>>
                <%=mandatory %>
            </td>
            <td nowrap width="15%" align="right">Segundo Apellido :</td>
            <td nowrap width="35%" align="left">
                <input type="text" name="E01LN2" size="35" maxlength="30" value="<%= ESD0087Record.getE01LN2().trim()%>" <%=read%>>
            </td>
         </tr>
         <tr id="trdark"> 
            <td nowrap width="15%" align="right">Sexo :</td>
            <td nowrap width="35%" align="left">
                <p> 
                <input type="radio" name="E01SEX" value="F" <%if (ESD0087Record.getE01SEX().equals("F")) out.print("checked"); %> <%= disabled %>>
                Femenino 
                <input type="radio" name="E01SEX" value="M" <%if (!ESD0087Record.getE01SEX().equals("F")) out.print("checked"); %> <%= disabled %>>
                Masculino 
                </p>
            </td>
            <td nowrap width="15%" align="right">Estado Civil :</td>
            <td nowrap width="35%" align="left">
                <select name="E01MST" <%= disabled %>>
                	<option value=" " <% if (!(ESD0087Record.getE01MST().equals("1")||ESD0087Record.getE01MST().equals("2") || ESD0087Record.getE01MST().equals("3")||ESD0087Record.getE01MST().equals("4")||ESD0087Record.getE01MST().equals("5")||ESD0087Record.getE01MST().equals("6"))) out.print("selected"); %>> 
                    </option>
                    <option value="1" <% if (ESD0087Record.getE01MST().equals("1")) out.print("selected"); %>>Soltero(a)</option>
                    <option value="2" <% if (ESD0087Record.getE01MST().equals("2")) out.print("selected"); %>>Casado(a)</option>                   
                    <option value="3" <% if (ESD0087Record.getE01MST().equals("3")) out.print("selected"); %>>Divorciado(a)</option>
                    <option value="4" <% if (ESD0087Record.getE01MST().equals("4")) out.print("selected"); %>>Viudo(a)</option>
                    <option value="5" <% if (ESD0087Record.getE01MST().equals("5")) out.print("selected"); %>>Uniòn Libre</option>
                    <option value="6" <% if (ESD0087Record.getE01MST().equals("6")) out.print("selected"); %>>Otro</option>
                </select>
            </td>
         </tr>
         <tr id="trclear"> 
            <td nowrap width="15%" align="right"> Dependientes :</td>
            <td nowrap width="35%" align="left">
            	<input type="text" name="E01NSO" size="4" maxlength="2" value="<%= ESD0087Record.getE01NSO().trim()%>" <%=read%>>
            </td>
            <td nowrap width="15%" align="right">Nacionalidad :</td>
            <td nowrap width="35%" align="left">
                <input type="text" name="E01CCS" size="6" maxlength="4" value="<%= ESD0087Record.getE01CCS().trim()%>">
                <% if ((userPO.getPurpose().equals("NEW") || userPO.getPurpose().equals("MAINTENANCE"))) {%>
                <a href="javascript:GetCodeCNOFC('E01CCS','03')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="ayuda" align="bottom" border="0" ></a> 
                <% } %>
            </td>
         </tr>
       </table>
            
       </td>
       </tr>
    </table>

</div>   
   
<div id="JURIDICO" style="position:relative; display:none;">
  <h4>Información Básica</h4>  
  <table  class="tableinfo" width="100%">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          
          <tr id="trdark"> 
            <td nowrap width="15%" align="right">Nombre Legal :</td>
            <td nowrap width="35%" align="left"> 
               	<input type="text" name="E01NA1" size="62" maxlength="60" value="<%= ESD0087Record.getE01NA1().trim()%>" <%=read%>>
               	<%=mandatory %>
            </td>
            <td nowrap width="15%" align="right"></td>
            <td nowrap width="35%" align="left">
            </td>
         </tr>
       </table>
            
       </td>
       </tr>
    </table>
</div>

  <h4>Fechas</h4>
    
  <table  class="tableinfo" width="100%">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
        	<tr id="trdark"> 
              <td nowrap width="15%" align="right"><label id="fechaNac"></label></td>
              <td nowrap width="35%" align="left"> 
              <% if ((userPO.getPurpose().equals("NEW") || userPO.getPurpose().equals("MAINTENANCE"))) {%>
                <eibsinput:date name="ESD0087Record" fn_year="E01BDY" fn_month="E01BDM" fn_day="E01BDD" required="true"/> 
              <% } else { %>
				<%= datapro.eibs.master.Util.formatDate(ESD0087Record.getE01BDM(),ESD0087Record.getE01BDD(),ESD0087Record.getE01BDY())%>
              <% } %>  
              </td>
              <td nowrap width="15%" align="right">Fecha Diligenciamiento :</td>
              <td nowrap width="35%" align="left">
              <% if ((userPO.getPurpose().equals("NEW") || userPO.getPurpose().equals("MAINTENANCE"))) {%>
                <eibsinput:date name="ESD0087Record" fn_year="E01IDY" fn_month="E01IDM" fn_day="E01IDD" required="true"/>
              <% } else { %>
				<%= datapro.eibs.master.Util.formatDate(ESD0087Record.getE01IDM(),ESD0087Record.getE01IDD(),ESD0087Record.getE01IDY())%>
              <% } %> 
              </td>
            </tr>
          </table>
        </td>
      </tr>
    </table>

		<jsp:include page="ESD0080_address_template_basic_colombia.jsp" flush="true" >				
			<jsp:param name="title" value="Direcciòn" /> 
			<jsp:param name="messageName" value="ESD0087Record" />
			<jsp:param name="readOnly" value="<%=tf%>" />
			<jsp:param name="suffix" value="E01" />
			<jsp:param name="basic" value="true" />
		</jsp:include>		


  <h4>Tel&eacute;fonos</h4>
    
  <table  class="tableinfo" width="100%">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="trdark"> 
            <td nowrap width="15%" align="right"><label id="tel1"></label></td>
            <td nowrap width="35%" align="left">
              <input type="text" name="E01HPN" size="11" maxlength="10" value="<%= ESD0087Record.getE01HPN().trim()%>" <%=read%> onkeypress="enterInteger(event)">
              <%=mandatory %>
              <% 	if (ESD0087Record.getE01LGT().trim().equals("1")) { %>
              Ext : 
              <input type="text" name="E01HPNX" size="6" maxlength="5" value="<%= ESD0087Record.getE01HPNX().trim()%>" <%=read%> onkeypress="enterInteger(event)">
              <%} %>
            </td>
            <td nowrap width="15%" align="right"><label id="tel2"></label></td>
            <td nowrap width="35%" align="left">
              <input type="text" name="E01PHN" size="11" maxlength="10" value="<%= ESD0087Record.getE01PHN().trim()%>" <%=read%> onkeypress="enterInteger(event)">
              Ext : 
              <input type="text" name="E01PHNX" size="6" maxlength="5" value="<%= ESD0087Record.getE01PHNX().trim()%>" <%=read%> onkeypress="enterInteger(event)">
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="15%" align="right">Tel&eacute;fono Fax :</td>
            <td nowrap width="35%" align="left">
              <input type="text" name="E01FAX" size="11" maxlength="10" value="<%= ESD0087Record.getE01FAX().trim()%>" <%=read%> onkeypress="enterInteger(event)">
              Ext : 
              <input type="text" name="E01FAXX" size="11" maxlength="10" value="<%= ESD0087Record.getE01FAXX().trim()%>" <%=read%> onkeypress="enterInteger(event)">
            </td>
            <td nowrap width="15%"  align="right">Tel&eacute;fono Celular :</td>
            <td nowrap width="35%" align="left">
              <input type="text" name="E01PH1" size="16" maxlength="15" value="<%= ESD0087Record.getE01PH1().trim()%>" <%=read%> onkeypress="enterInteger(event)"> 
            </td>
          </tr>

        </table>
        </td>
    </tr>
  </table>

  <h4>C&oacute;digos de Clasificaci&oacute;n</h4>
    
  <table class="tableinfo">
    <tr > 
      <td nowrap > 
        <table cellspacing="0" cellpadding="2" width="100%" border="0"  align="center">
          <tr id="trclear"> 
            <td nowrap width="15%" align="right">Actividad Econòmica :</td>
            <td nowrap width="35%" align="left">
              <input type="text" name="E01BUC" size="5" maxlength="4" value="<%= ESD0087Record.getE01BUC().trim()%>" <%=read%>>
              <% if ((userPO.getPurpose().equals("NEW") || userPO.getPurpose().equals("MAINTENANCE"))) {%>
              <a href="javascript:GetCodeCNOFC('E01BUC','12')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="ayuda" align="bottom" border="0" ></a> 
              <% } %>
              <%=mandatory %>
            </td>
            <td nowrap width="15%" align="right">Tipo de Relaci&oacute;n :</td>
            <td nowrap width="35%" align="left">
              <input type="text" name="E01UC1" size="5" maxlength="4" value="<%= ESD0087Record.getE01UC1().trim()%>" <%=read%>>
              <% if ((userPO.getPurpose().equals("NEW") || userPO.getPurpose().equals("MAINTENANCE"))) {%>
              <a href="javascript:GetCodeCNOFC('E01UC1','2A')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="ayuda" align="bottom" border="0" ></a> 
              <% } %>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
 <br> 
	<table width="100%" border="0" cellspacing="0" cellpadding="0" bgcolor="#FFFFFF" bordercolor="#FFFFFF">
    	<tr bgcolor="#FFFFFF"> 
      		<td width="33%" align="center"><input type="checkbox" name="H01FLGWK2" value="1" >Aceptar con Avisos</td>
    	</tr>
  	</table>    
    
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

<% 	if (ESD0087Record.getE01LGT().trim().equals("1")) { %>
		document.getElementById("fechaNac").innerHTML = "Fecha de Constituci&oacute;n :";
 		document.getElementById("tel1").innerHTML = "Telefono de Oficina 1 :";
 		document.getElementById("tel2").innerHTML = "Telefono de Oficina 2 :";
		JURIDICO.style.display='block';
		NATURAL.style.display='none' ;
<% } else { %>
		document.getElementById("fechaNac").innerHTML = "Fecha de Nacimiento :";
 		document.getElementById("tel1").innerHTML = "Telefono de Casa :";
 		document.getElementById("tel2").innerHTML = "Telefono de Oficina :";
		NATURAL.style.display='block' ;
		JURIDICO.style.display='none' ;
<% } %>	   
</SCRIPT>
</html>
