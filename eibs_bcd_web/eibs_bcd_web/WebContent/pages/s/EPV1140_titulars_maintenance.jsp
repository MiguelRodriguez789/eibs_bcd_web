<%@taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput"%>
<%@page import="com.datapro.constants.EibsFields"%>
<%@page import="com.datapro.eibs.constants.HelpTypes"%>
<%@page import="com.datapro.constants.Entities"%>

 
<html>
<head>
<title>Titulares</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/jquery/plugins/contextMenu/css/jquery.contextMenu.css" rel="stylesheet" type="text/css" />

<jsp:useBean id="datarec" class="datapro.eibs.beans.EPV114001Message"  scope="session" />
<jsp:useBean id="error" class="datapro.eibs.beans.ELEERRMessage" scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session" />
<jsp:useBean id="currUser" class="datapro.eibs.beans.ESS0030DSMessage" scope="session" />

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </script>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBSBillsP.jsp"> </script>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </script>


<script type="text/javascript">

function goAction(op) {
	getElement("SCREEN").value = op;
	document.forms[0].submit();		
 }

function chgTipo(p) {
 	if (!p) {
		HOLDERINFO.style.display='block';
		BASICINFO.style.display='block';
		CUSTOMER.style.display='none';
		isCustomer = false;
		getElement("E01PVTTCU").value = '0';
		getElement("PVTNME").value = '<%=datarec.getE01PVTNME().trim()%>';
		getElement("PVTIDN").value = '<%=datarec.getE01PVTIDN().trim()%>';
	} else {
		HOLDERINFO.style.display='block';
		BASICINFO.style.display='none';
		CUSTOMER.style.display='block';	
		isCustomer = true;
		getElement("E01PVTTCU").value = '<%=datarec.getE01PVTTCU().trim()%>';
	}	
 }

function cerrarVentana(){
	window.open('','_parent','');
	window.close(); 
}

</script>

</head>

<%
	boolean readOnly=false;
	boolean maintenance=false;
	boolean newOnly=false;
	boolean isCustomer = !datarec.getField("E01PVTTCU").getString().trim().equals("0");
	if (request.getParameter("readOnly") != null ){
		if (request.getParameter("readOnly").toLowerCase().equals("true")){
			readOnly=true;
		} else {
			readOnly=false;
		}
	}
	if (userPO.getHeader20().equals("NEW")){
		newOnly=true;
	} else {
		newOnly=false;		
	}
%>

<body>
<%
	if (!error.getERRNUM().equals("0")) {
		error.setERRNUM("0");
		out.println("<SCRIPT Language=\"Javascript\">");
		out.println("       showErrors()");
		out.println("</SCRIPT>");
	}
%>

<h3 align="center">
<%if (readOnly){ %>
	CONSULTA DE AVALADOS
<%} else if (newOnly){ %>
	NUEVO AVALADO
<%} else { %>
	MANTENIMIENTO DE AVALADOS
<%} %>

<% 
	String emp = (String)session.getAttribute("EMPAV");
	emp = (emp==null) ? "" : emp;
%>

<%if ("".equals(emp)){ %>
 <img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="titulars_maintenance.jsp, EPV1140"></h3>
 <hr size="4">
<%}%>

<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.salesplatform.JSEPV1140" >
	<INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="600">
	<input type=HIDDEN name="BANCO"  value="<%= currUser.getE01UBK().trim()%>">
	<input type=HIDDEN name="H01FLGMAS"  value="<%= datarec.getH01FLGMAS().trim()%>">

	<%int row=1;%>
 
	<%if ("".equals(emp)) { %>
	<table  class="tableinfo">
		<tr bordercolor="#FFFFFF"> 
			<td nowrap> 
				<table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
						<td nowrap width="10%" align="right"> Cliente : </td>
						<td nowrap width="10%" align="left">
							<eibsinput:text name="datarec" property="E01PVTCUN" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CUSTOMER %>" readonly="true"/>
						</td>
						<td nowrap width="10%" align="right"> Propuesta : </td>
						<td nowrap width="50%"align="left">
							<eibsinput:text name="datarec" property="E01PVTNUM" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_ACCOUNT %>" readonly="true"/>
						</td>
						<td nowrap width="10%" align="right">Sequencia :  </td>
						<td nowrap width="10%" align="left">
							<eibsinput:text name="datarec" property="E01PVTSEQ" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_INTEGER %>" size="3" maxlength="2" readonly="true"/>
						</td>
				 </tr>
			 </table>
			</td>
		</tr>
	</table>
	<%}else{%>
		<input type="hidden" name="E01PVTCUN" value="<%=datarec.getE01PVTCUN()%>">
		<input type="hidden" name="E01PVTNUM" value="<%=datarec.getE01PVTNUM()%>">
	<%} %>
	
	<%if ("".equals(emp)){ %>  
		<h4>Avalados</h4>
	<%} %>    

	<table  class="tableinfo" width="100%">
		<tr bordercolor="#FFFFFF"> 
			<td nowrap> 
				<table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
						<td width="100%" align="left" colspan="4">
							<h4><input type="checkbox" id="type" name="E01TYP" value="1" onclick="chgTipo(this.checked);" <% if (isCustomer) { out.print("checked"); } %> <%=newOnly ? "" : "disabled"%> >Es Cliente del Banco</h4>
						</td>
						<td colspan="2">
							<div id="CUSTOMER" style="position:relative; display:block;">	
								<table cellspacing="0" cellpadding="2" width="100%" border="0">       
									<tr id="trdark" align="left"> 
										<td nowrap width="50%" colspan=4 align="right">Número de Cliente :</td>
										<td nowrap width="50%">
											<eibsinput:text name="datarec" property="E01PVTTCU" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_INTEGER %>" />
										</td>
									</tr> 
								</table>
							</div> 
						</td>			
					</tr>	    
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
						<td nowrap width="5%" align="right">Consecutivo :</td>
						<td nowrap width="10%" align="left"> 
							<input type="text" name="E01PVTSEQ" size="3" value="<%=datarec.getE01PVTSEQ().trim()%>" readonly >
						</td>
						<td nowrap width="5%" align="right">Nombre :</td>
						<td nowrap width="40%" align="left">
							<input type="text" name="PVTNME" size="46" value="<%= datarec.getE01PVTNME().trim()%>" disabled >
						</td>
						<td nowrap width="5%" align="right">Identificación :</td>
						<td nowrap width="35%" align="left">
							<input type="text" name="PVTIDN" size="20" value="<%= datarec.getE01PVTIDN().trim()%>" disabled >
						</td>
					</tr>
				</table>
			</td>
		</tr>
	</table>
	
	<div id="BASICINFO" style="position:relative; display:none;">

		<h4>Identificación</h4>
		<table class="tableinfo">
			<tr > 
				<td nowrap > 
					<table cellspacing="0" cellpadding="2" width="100%" border="0">
						<tr id="trdark"> 
							<td nowrap width="15%"> 
								<div align="right">Ident. No. :</div>
							</td>
							<td nowrap width="18%"> 
								<input type="text" name="E01PVTIDN" size="28" maxlength="25" value="<%=datarec.getE01PVTIDN().trim()%>" >
								<img src="<%=request.getContextPath()%>/images/Check.gif" title="mandatory field" align="bottom" >
							</td>
							<td nowrap width="11%"> 
								<div align="right">Tipo :</div>
							</td>
							<td nowrap width="20%"> 
								<input type="text" name="E01PVTTID" size="5" maxlength="4" value="<%=datarec.getE01PVTTID().trim()%>" >
								<% if( !readOnly){ %>
								<a href="javascript:GetCodeAuxCNOFC('E01PVTTID','34','')">
								  <img src="<%=request.getContextPath()%>/images/1b.gif" title="ayuda" align="bottom" border="0">
								</a> 
								<img src="<%=request.getContextPath()%>/images/Check.gif" title="mandatory field" align="bottom" >  	     		
								<% }%>
							</td>
							<td nowrap width="11%"> 
								<div align="right">Pa&iacute;s :</div>
							</td>
							<td nowrap width="25%"> 
								<input type="text" name="E01PVTPID" size="5" maxlength="4" value="<%=datarec.getE01PVTPID().trim()%>" >
								<% if( !readOnly){ %>
								<a href="javascript:GetCodeCNOFC('E01PVTPID','03')">
								 <img src="<%=request.getContextPath()%>/images/1b.gif" title="ayuda" align="bottom" border="0" >
								</a> 
								<img src="<%=request.getContextPath()%>/images/Check.gif" title="mandatory field" align="bottom" >  	     		
								<% } %>
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
						<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
							<td nowrap width="15%" align="right">Nombre :</td>
							<td nowrap width="35%" align="left"> 
								<eibsinput:text property="E01PVTNME" name="datarec" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_NAME_FULL%>" required="true" size="60" maxlength="60" readonly="<%=readOnly %>"/>
							</td>
							<td nowrap width="15%" align="right">Teléfono :</td>
							<td nowrap width="35%" align="left">
								<eibsinput:text name="datarec" property="E01PVTPHO" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_PHONE%>" size="16" maxlength="15" readonly="<%=readOnly%>"/>
							</td>
						 </tr>
						 <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
							<td nowrap width="15%" align="right">Género :</td>
							<td nowrap width="35%" align="left">
								<select name="E01PVTSEX" <%=readOnly ? "disabled" : ""%> >
									<option value="F" <% if (!datarec.getE01PVTSEX().equals("M")) out.print("selected"); %>>Femenino</option>
									<option value="M" <% if (datarec.getE01PVTSEX().equals("M"))  out.print("selected"); %>>Masculino</option>
								</select>
							</td>
							<td nowrap width="15%" align="right">Estado Civil :</td>
							<td nowrap width="35%" align="left">
								<select name="E01PVTMST" <%=readOnly ? "disabled" : ""%> >
									<option value=" " <% if (!(datarec.getE01PVTMST().equals("1")||datarec.getE01PVTMST().equals("2")||datarec.getE01PVTMST().equals("3")||datarec.getE01PVTMST().equals("4")||datarec.getE01PVTMST().equals("5")||datarec.getE01PVTMST().equals("6"))) out.print("selected"); %>></option>
									<option value="1" <% if (datarec.getE01PVTMST().equals("1")) out.print("selected"); %> >Soltero(a)</option>
									<option value="2" <% if (datarec.getE01PVTMST().equals("2")) out.print("selected"); %> >Casado(a)</option>
									<option value="3" <% if (datarec.getE01PVTMST().equals("3")) out.print("selected"); %> >Divorciado(a)</option>
									<option value="4" <% if (datarec.getE01PVTMST().equals("4")) out.print("selected"); %> >Viudo(a)</option>
									<option value="5" <% if (datarec.getE01PVTMST().equals("5")) out.print("selected"); %> >Unión Libre</option>
									<option value="6" <% if (datarec.getE01PVTMST().equals("6")) out.print("selected"); %> >Otro</option>
								</select>
							</td>
						 </tr>
						 <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
							<td nowrap width="15%" align="right">Fecha Nacimiento :</td>
							<td nowrap width="35%" align="left">
								<eibsinput:date name="datarec" fn_year="E01PVTBDY" fn_month="E01PVTBDM" fn_day="E01PVTBDD" readonly="<%=readOnly%>"/>
							</td>
							<td nowrap width="15%" align="right">Ciudad Nacimiento :</td>
							<td nowrap width="35%" align="left">
								<eibsinput:text name="datarec" property="E01PVTBCT" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_NAME%>" size="35" maxlength="35" readonly="<%=readOnly %>"/>
							</td>
						 </tr>
						 <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
							<td nowrap width="15%" align="right">Direccion Residencia :</td>
							<td nowrap width="35%" align="left">
								<eibsinput:text name="datarec" property="E01PVTADD" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_NAME_FULL%>" size="60" maxlength="60" readonly="<%=readOnly %>"/>
							</td>
							<td nowrap width="15%" align="right">Ciudad Residencia :</td>
							<td nowrap width="35%" align="left">
								<eibsinput:text name="datarec" property="E01PVTCTY" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_NAME%>" size="35" maxlength="35" readonly="<%=readOnly %>"/>
							</td>
						 </tr>
				 	</table>
				</td>
			</tr>
		</table>
	</div>
	
	<div id="HOLDERINFO" style="position:relative; display:none;">
		<h4>Información Universidad</h4>  
		<table  class="tableinfo" style="width :100%">
			<tr bordercolor="#FFFFFF"> 
				<td nowrap> 
					<table cellspacing="0" cellpadding="2" style="width :100%" border="0">
						<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
							<td nowrap width="15%" align="right">Universidad :</td>
							<td nowrap width="35%" align="left"> 
								<eibsinput:text name="datarec" property="E01PVTUNI" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_NAME_FULL%>" required="true" size="60" maxlength="60" readonly="<%=readOnly %>"/>
							</td>
							<td nowrap width="15%" align="right">Carrera :</td>
							<td nowrap width="35%" align="left">
								<eibsinput:text name="datarec" property="E01PVTCRA" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_NAME_FULL%>" size="60" maxlength="60" readonly="<%=readOnly %>"/>
							</td>
						</tr>
						<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
							<td nowrap width="15%" align="right">Facultad :</td>
							<td nowrap width="35%" align="left">
								<eibsinput:text name="datarec" property="E01PVTFAC" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_NAME_FULL%>" size="60" maxlength="60" readonly="<%=readOnly %>"/>
							</td>
							<td nowrap width="15%" align="right">Semestre :</td>
							<td nowrap width="35%" align="left">
								<eibsinput:text name="datarec" property="E01PVTSEM" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_TEXT%>" size="4" maxlength="4" readonly="<%=readOnly %>"/>
							</td>
						</tr>
						<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
							<td nowrap width="15%" align="right">Codigo Estudiante :</td>
							<td nowrap width="35%" align="left">
								<eibsinput:text name="datarec" property="E01PVTCES" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_TEXT%>" size="15" maxlength="15" readonly="<%=readOnly %>"/>
							</td>
							<td nowrap width="15%" align="right">Referencia Pago :</td>
							<td nowrap width="35%" align="left">
								<eibsinput:text name="datarec" property="E01PVTRFU" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_TEXT%>" size="15" maxlength="15" readonly="<%=readOnly %>"/>
							</td>
						</tr>
						<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
							<td nowrap width="15%" align="right"></td>
							<td nowrap width="35%" align="left">
							<td nowrap width="15%" align="right">Valor Semestre :</td>
							<td nowrap width="35%" align="left">
								<eibsinput:text name="datarec" property="E01PVTVLS" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT%>" readonly="<%=readOnly%>"/>
							</td>
						</tr>

				 	</table>
				</td>
			</tr>
		</table>
	</div>

	<%if (!readOnly) { %>
		<div align="center"> 
			<input id="EIBSBTN" type=submit name="Submit" value="Enviar">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input id="EIBSBTN" type=button name="Cancel" value="Cancelar" onclick="javascript:cerrarVentana();">
		</div>
	<% } else { %>
		<div align="center"> 
			<input id="EIBSBTN" type=button name="Cancel" value="Cancelar" onclick="javascript:cerrarVentana();">
		</div>     
	<% } %>  

</form>
	
<script type="text/javascript">
<% if ("S".equals(request.getAttribute("ACT"))){ %>
	   window.opener.location.href = '<%=request.getContextPath()%>/servlet/datapro.eibs.salesplatform.JSEPV1140?SCREEN=101&E01PVTCUN=<%=userPO.getCusNum()%>&E01PVTNUM=<%=userPO.getPorfNum()%>';	   	   
	   cerrarVentana();
<% } %>  
<% if (datarec.getE01PVTTCU().trim().equals("0")) { %>
	   chgTipo(false);
<% } else { %>
	   chgTipo(true);
<% } %>	   

</script>


</body>
</HTML>
