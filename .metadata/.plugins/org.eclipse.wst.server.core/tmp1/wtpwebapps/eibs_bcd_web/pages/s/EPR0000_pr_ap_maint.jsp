<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<%@ page import = "datapro.eibs.master.Util" %>

<html>
<head>
<title>Transacciones Financieras</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id="prMant" class="datapro.eibs.beans.EPR010001Message"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>

<%!
boolean isOptionFSeq(String value, String selected) {
	return (value.startsWith("/"+selected) || value.startsWith(selected+"/"));
}
boolean isNotOptionFSeq(String value) {
	return  !( isOptionFSeq(value, "1") || isOptionFSeq(value, "2") || isOptionFSeq(value, "3") || isOptionFSeq(value, "4") 
			|| isOptionFSeq(value, "5") || isOptionFSeq(value, "6") || isOptionFSeq(value, "7") || isOptionFSeq(value, "8") );
}
boolean isOptionFAccount(String value) {
	return  !( isOptionFSeq(value, "ARNU") || isOptionFSeq(value, "CCPT") || isOptionFSeq(value, "CUST") || isOptionFSeq(value, "DRLC")
			|| isOptionFSeq(value, "EMPL") || isOptionFSeq(value, "NIDN") || isOptionFSeq(value, "SOSE") || isOptionFSeq(value, "TXID") );
}
%>

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/wireTransfers.js"></script>

<SCRIPT type="text/javascript">
function getLogs(){
	var refnum;
	refnum = document.forms[0].E01PRINUM.value;
	self.window.location.href = "<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEPR1060?SCREEN=7&REFNUM="+refnum;
	//page = "<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEPR1060?SCREEN=7&REFNUM="+refnum;
 	//CenterWindow(page,420,300,2);
}

  <% 
  if (userPO.getPurpose().equals("REVERSAL")) { 
  %> 
   builtNewMenu(pr_r_opt);
  <% } else {%>
   builtNewMenu(pr_a_opt);
  <%}%>
  initMenu();
 
</SCRIPT>
</head>

<% 
 int row = 1;

 if ( !error.getERRNUM().equals("0")  ) {
     error.setERRNUM("0");
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
 }
%>

<body>
<h3 align="center">Transacci&oacute;n Financiera<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="pr_ap_maint.jsp,EPR0000"></h3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEPR0000" >
<% 
  if (userPO.getPurpose().equals("NEW")) { 
%> 
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="2">
<% } else{ %>
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="4">
<% } %>

  <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
          <tr id="trdark"> 
            <td nowrap width="16%" > 
              <div align="right">Tipo :</div>
            </td>
            <td nowrap width="20%" >
			  <div align="left"> 
                <input type="hidden" id="E01PRITTP" name="E01PRITTP" size="2" maxlength="2" value="<%= prMant.getE01PRITTP().trim()%>">
                  
                <input type="text" readonly  id="TypeDesc" name="TypeDesc" size="40" maxlength="35" value="<% 	
                		if(prMant.getE01PRITTP().trim().equals("IT")){out.print("Transferencia Interna"); }
				   else if(prMant.getE01PRITTP().trim().equals("IW")){out.print("Transferencia Externa Recibida");}
				   else if(prMant.getE01PRITTP().trim().equals("OW")){out.print("Transferencia Externa Enviada"); }
				   else if(prMant.getE01PRITTP().trim().equals("IA")){out.print("Ajuste de Intereses"); }
                   else if(prMant.getE01PRITTP().trim().equals("IP")){out.print("Pago de Intereses"); }
                   else if(prMant.getE01PRITTP().trim().equals("RP")){out.print("Reversion de Penalidad"); }
                   else if(prMant.getE01PRITTP().trim().equals("LP")){out.print("Pago de Prestamos"); }
                   else if(prMant.getE01PRITTP().trim().equals("MR")){out.print("Reversion Miscelanea"); }
                   else if(prMant.getE01PRITTP().trim().equals("MP")){out.print("Ajuste Miscelaneo"); }
				   else {out.print(" ");}%>" >
              </div>
            </td>
   			<td nowrap align="right"> No. de Referencia : </td>
                <td nowrap align="left">
                  <input type="text" id="E01PRINUM" name="E01PRINUM" size="12" maxlength="11" value="<%= prMant.getE01PRINUM().trim()%>" readonly>
                </td>
			<td nowrap colspan="3" >
			</td>
          </tr>
          <% if(!prMant.getE01PRITTP().equals("IT")){ %>
          <tr id="trdark">
              <td nowrap> 
                <div align="right">V&iacute;a de Pago :</div>
              </td>
            <td nowrap > 
              <input type="text" readonly  id="E01PRIPVI" name="E01PRIPVI" size="30" maxlength="17" 
					value="<% if (prMant.getE01PRIPVI().equals("R")) {out.print("Cuenta de Detalle");}
               					 else if (prMant.getE01PRIPVI().equals("D")) {out.print("Certificado");}
                				 else if (prMant.getE01PRIPVI().equals("G")) {out.print("Cuenta Contable");}
                				 else if (prMant.getE01PRIPVI().equals("6")) {out.print("Cheques Oficiales");}
                				 else if (prMant.getE01PRIPVI().equals("1")) {out.print("FED");}
                				 else if (prMant.getE01PRIPVI().equals("2")) {out.print("Swift MT-205");}
                				 else if (prMant.getE01PRIPVI().equals("3")) {out.print("Swift MT-103");}
								 else if (prMant.getE01PRIPVI().equals("4")) {out.print("Swift MT-200");}
								 else if (prMant.getE01PRIPVI().equals("5")) {out.print("Swift MT-202");}
			  				     else if (prMant.getE01PRIPVI().equals("7")) {out.print("Swift MT-202 COV");}
								 else {out.print(" ");}%>" >
            </td>
            <% 	if(false){ %>
    		<td nowrap > 
                  <div align="right">Código :</div>
            </td>
                <td nowrap align="left" colspan="3">
                  <input type="text" id="E01PRITCD" name="E01PRITCD" size="11" maxlength="10" value="<%= prMant.getE01PRITCD().trim()%>" readonly>
                </td>
			<% 	} else { %>
            <td nowrap colspan="5" >
            </td>
          	</TR>          
		<% 		}
		} 
		%>
        </table>
      </td>
    </tr>
   </table>
<BR>
  <div id="mainParties"> 
    <table class="tableinfo">
    <tr > 
      <td nowrap height="132"> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
      	<tr id="trdark"> 
            <td nowrap colspan="2" align="center"> 
                <b>Ordenante </b>
					<SELECT id="SWF_50" name="SWF_50" class="swf_field_50" disabled="disabled" style="display:<%=!prMant.getE01PRIPVI().equals("5") ? "inline" : "none"%>">
						<OPTION value="K" <% if (!(prMant.getE01PRIORO().equals("A") ||prMant.getE01PRIORO().equals("F") || prMant.getE01PRIORO().equals("K"))) out.print("selected"); %>>K</OPTION>
						<OPTION value="A" <% if(prMant.getE01PRIORO().equals("A")) out.print("selected");%>>A</OPTION>
					</SELECT>
            </td>
            <td nowrap> 
                <div align="center"><b>Número de Cliente</b></div>
            </td>
            <td nowrap colspan="2" align="center">  
                <span id="LBL_58" style="font-weight: bold; display:<%=prMant.getE01PRIPVI().equals("7") ? "inline" : "none"%>">Banco Beneficiario</span>
             		<select id="SWF_58" name="SWF_58" class="swf_field_58" disabled="disabled" style="display:<%=(prMant.getE01PRIPVI().equals("5") || prMant.getE01PRIPVI().equals("7")) ? "inline" : "none"%>">
                    	<option value="D" <% if (!(prMant.getE01PRIBCO().equals("A") || prMant.getE01PRIBCO().equals("D") || prMant.getE01PRIBCO().equals("F"))) out.print("selected"); %>>D</option>
                        <option value="A" <% if(prMant.getE01PRIBCO().equals("A")) out.print("selected");%>>A</option>
					</select>
                <span id="LBL_59" style="font-weight: bold; display:<%=!prMant.getE01PRIPVI().equals("7") ? "inline" : "none"%>">Beneficiario</span>
             		<select id="SWF_59" name="SWF_59" class="swf_field_59" disabled="disabled" style="display:<%=!prMant.getE01PRIPVI().equals("5") ? "inline" : "none"%>">
                    	<option value="" <% if (!(prMant.getE01PRIBCO().equals("A") || prMant.getE01PRIBCO().equals("F"))) out.print("selected"); %>></option>
                        <option value="A" <% if(prMant.getE01PRIBCO().equals("A")) out.print("selected");%>>A</option>
					</select>
            </td>
		</tr>
		<tr id="trclear">
			<% 
			int cpos1 = prMant.getE11PRIORC().indexOf('/');
			int cpos2 = 0;
			if(cpos1 != -1){
				cpos2 = prMant.getE11PRIORC().indexOf('/', cpos1+1) + 1;
			} 
			%>
			<td nowrap width="10%" align="right"> 
				<span id="LBL_50A_1" class="swf_field_50" style="display:<%=prMant.getE01PRIORO().equals("A") ? "inline" : "none"%>">Cuenta :</span>
				<span id="LBL_50K_1" class="swf_field_50" style="display:<%=!prMant.getE01PRIORO().equals("A") && !prMant.getE01PRIORO().equals("F") ? "inline" : "none"%>">Cuenta :</span>
				<span id="LBL_50F_1" class="swf_field_50" style="display:<%=prMant.getE01PRIORO().equals("F") ? "inline" : "none"%>">
				<input type="text" readonly  name="SWF_50F_1_1" id="SWF_50F_1_1" class="swf_field_50" size="30" maxlength="17" 
					value="<% if (isOptionFSeq(prMant.getE11PRIORC(), "ARNU")) {out.print("Número de Extranjero");}
               					 else if (isOptionFSeq(prMant.getE11PRIORC(), "CCPT")) {out.print("Pasaporte");}
                				 else if (isOptionFSeq(prMant.getE11PRIORC(), "CUST")) {out.print("Id de Cliente");}
                				 else if (isOptionFSeq(prMant.getE11PRIORC(), "DRLC")) {out.print("Licencia de Conducir");}
                				 else if (isOptionFSeq(prMant.getE11PRIORC(), "EMPL")) {out.print("Número de Empleado");}
                				 else if (isOptionFSeq(prMant.getE11PRIORC(), "NIDN")) {out.print("Id Nacional");}
                				 else if (isOptionFSeq(prMant.getE11PRIORC(), "SOSE")) {out.print("No. Seguridad Social");}
								 else if (isOptionFSeq(prMant.getE11PRIORC(), "TXID")) {out.print("Id para Impuestos");}
								 else {out.print("Cuenta");}%>" > :
				</span>
			</td>
			<td nowrap width="35%">
				<input type="hidden" id="E11PRIORC" name="E11PRIORC" value="<%= prMant.getE11PRIORC() %>">
				<span id="SWB_50F" class="swf_field_50" style="display:<%=prMant.getE01PRIORO().equals("F") ? "inline" : "none"%>">
                <input readonly="readonly" type="text" id="SWF_50F_1_2" name="SWF_50F_1_2" size="6" maxlength="5" 
                	value="<%= cpos1 > -1 && cpos2 > cpos1 ? prMant.getE11PRIORC().substring(cpos1+1, cpos2-1) :  "" %>">
                <input readonly="readonly" type="text" id="SWF_50F_1_3" name="SWF_50F_1_3" class="swf_field_50" size="30" maxlength="27" 
                	value="<%= prMant.getE11PRIORC().substring(cpos2) %>" style="display:<%=prMant.getE01PRIORO().equals("F") ? "inline" : "none"%>">
              	</span>
                <input readonly="readonly" type="text" id="SWF_50_1" name="accountOriginator" class="swf_field_50" size="45" maxlength="35" 
                	value="<%= prMant.getE11PRIORC() %>" style="display:<%=!prMant.getE01PRIORO().equals("F") ? "inline" : "none"%>">
			</td>
            <td nowrap width="5%"> 
              <div align="center">
                <input type="text" id="E01PRIOCU" name="E01PRIOCU" size="12" maxlength="10" value="<%= prMant.getE01PRIOCU().trim()%>" readonly="readonly">
              </div>
            </td>
			<td nowrap width="10%"> 
                <div align="right">Cuenta :</div>
			</td>
			<td nowrap width="30%"> 
                <input readonly type="text" id="E11PRIBCU" name="E11PRIBCU" size="40" maxlength="35" value="<%= prMant.getE11PRIBCU().trim() %>">
			</td>
            </tr>  
      	<tr id="trclear"> 
            <td nowrap> 
                <div align="right">
                	<span id="LBL_50K_2" class="swf_field_50" style="display:<%=!prMant.getE01PRIORO().equals("A") && !prMant.getE01PRIORO().equals("F") ? "inline" : "none"%>">Nombre :</span>
					<span id="LBL_50A_2" class="swf_field_50" style="display:<%=prMant.getE01PRIORO().equals("A") ? "inline" : "none"%>">BIC/BEI :</span>
					<span id="LBL_50F_2" class="swf_field_50" style="display:<%=prMant.getE01PRIORO().equals("F") ? "inline" : "none"%>">
						value="<% if (isOptionFSeq(prMant.getE31PRIORC(), "1")) {out.print("Nombre");}
	                				 else if (isOptionFSeq(prMant.getE31PRIORC(), "3")) {out.print("País y Localidad");}
	                				 else if (isOptionFSeq(prMant.getE31PRIORC(), "4")) {out.print("Fecha de Nacimiento");}
	                				 else if (isOptionFSeq(prMant.getE31PRIORC(), "5")) {out.print("Lugar de Nacimiento");}
	                				 else if (isOptionFSeq(prMant.getE31PRIORC(), "6")) {out.print("Id del Cliente");}
	                				 else if (isOptionFSeq(prMant.getE31PRIORC(), "7")) {out.print("Id Nacional");}
									 else if (isOptionFSeq(prMant.getE31PRIORC(), "8")) {out.print("Info Adicional");}
									 else {out.print("Dirección");}%>" > :
					</span>
                </div>
            </td>
            <td nowrap colspan="2"> 
              <div align="left">
              	<input type="hidden" name="E21PRIORC" size="45" maxlength="35" value="<%= prMant.getE21PRIORC().trim()%>">

				<input type="text" readonly="readonly" id="SWF_50K_2_1" name="E21PRIORC_1" class="swf_field_50" style="display:<%=!prMant.getE01PRIORO().equals("F") ? "inline" : "none"%>"
					size="45" maxlength="35" value="<%= prMant.getE21PRIORC() %>">
				<input type="text" readonly="readonly" id="SWF_50F_2_2" name="SWF_50F_2_2" class="swf_field_50" style="display:<%=prMant.getE01PRIORO().equals("F") ? "inline" : "none"%>"
					size="45" maxlength="35" value="<%= isNotOptionFSeq(prMant.getE21PRIORC()) ? prMant.getE21PRIORC() : prMant.getE21PRIORC().substring(prMant.getE21PRIORC().indexOf("/")) %>">
              </div>
            </td>
            <td nowrap> 
                <div align="right">
                	<span id="LBL_59_2" class="swf_field_59" style="display:<%=!prMant.getE01PRIBCO().equals("A") && !prMant.getE01PRIBCO().equals("F") ? "inline" : "none"%>">Nombre :</span>
                	<span id="LBL_59A_2" class="swf_field_59" style="display:<%=prMant.getE01PRIBCO().equals("A") ? "inline" : "none"%>">BIC/BEI :</span>
                	<span id="LBL_59D_2" class="swf_field_59" style="display:<%=prMant.getE01PRIBCO().equals("D") ? "inline" : "none"%>">Nombre :</span>
					<span id="LBL_59F_2" class="swf_field_59" style="display:<%=prMant.getE01PRIBCO().equals("F") ? "inline" : "none"%>"></span>
				</div>
            </td>
            <td nowrap> 
              <div align="left"> 
              	<input type="text" id="E21PRIBCU" name="E21PRIBCU" size="45" maxlength="35" value="<%=prMant.getE21PRIBCU().trim()%>" readonly="readonly">
              </div>
            </td>
		</tr>
          <tr id="trclear">
      		<td nowrap valign="top" align="right"> 
     		<div> 
				<span id="LBL_50K_3" class="swf_field_50" style="display:<%=!prMant.getE01PRIORO().equals("A") && !prMant.getE01PRIORO().equals("F") ? "inline" : "none"%>">Dirección :</span>
				<span id="LBL_50F_3" class="swf_field_50" style="display:<%=prMant.getE01PRIORO().equals("F") ? "inline" : "none"%>">
					<input type="text" readonly  name="SWF_50F_3_1" id="SWF_50F_3_1" class="swf_field_50" size="30" maxlength="17" 
						value="<% if (isOptionFSeq(prMant.getE31PRIORC(), "1")) {out.print("Nombre");}
	                				 else if (isOptionFSeq(prMant.getE31PRIORC(), "3")) {out.print("País y Localidad");}
	                				 else if (isOptionFSeq(prMant.getE31PRIORC(), "4")) {out.print("Fecha de Nacimiento");}
	                				 else if (isOptionFSeq(prMant.getE31PRIORC(), "5")) {out.print("Lugar de Nacimiento");}
	                				 else if (isOptionFSeq(prMant.getE31PRIORC(), "6")) {out.print("Id del Cliente");}
	                				 else if (isOptionFSeq(prMant.getE31PRIORC(), "7")) {out.print("Id Nacional");}
									 else if (isOptionFSeq(prMant.getE31PRIORC(), "8")) {out.print("Info Adicional");}
									 else {out.print("Dirección");}%>" > :
					</span>
			</div>
      		<div> 
				<span id="LBL_50F_4" class="swf_field_50" style="display:<%=prMant.getE01PRIORO().equals("F") ? "inline" : "none"%>">
					<input type="text" readonly  name="SWF_50F_4_1" id="SWF_50F_4_1" class="swf_field_50" size="30" maxlength="17" 
						value="<% if (isOptionFSeq(prMant.getE41PRIORC(), "1")) {out.print("Nombre");}
	                				 else if (isOptionFSeq(prMant.getE41PRIORC(), "3")) {out.print("País y Localidad");}
	                				 else if (isOptionFSeq(prMant.getE41PRIORC(), "4")) {out.print("Fecha de Nacimiento");}
	                				 else if (isOptionFSeq(prMant.getE41PRIORC(), "5")) {out.print("Lugar de Nacimiento");}
	                				 else if (isOptionFSeq(prMant.getE41PRIORC(), "6")) {out.print("Id del Cliente");}
	                				 else if (isOptionFSeq(prMant.getE41PRIORC(), "7")) {out.print("Id Nacional");}
									 else if (isOptionFSeq(prMant.getE41PRIORC(), "8")) {out.print("Info Adicional");}
									 else {out.print("Dirección");}%>" > :
				</span>
			</div>
      		<div> 
				<span id="LBL_50F_5" class="swf_field_50" style="display:<%=prMant.getE01PRIORO().equals("F") ? "inline" : "none"%>">
					<input type="text" readonly  name="SWF_50F_5_1" id="SWF_50F_5_1" class="swf_field_50" size="30" maxlength="17" 
						value="<% if (isOptionFSeq(prMant.getE51PRIORC(), "1")) {out.print("Nombre");}
	                				 else if (isOptionFSeq(prMant.getE51PRIORC(), "3")) {out.print("País y Localidad");}
	                				 else if (isOptionFSeq(prMant.getE51PRIORC(), "4")) {out.print("Fecha de Nacimiento");}
	                				 else if (isOptionFSeq(prMant.getE51PRIORC(), "5")) {out.print("Lugar de Nacimiento");}
	                				 else if (isOptionFSeq(prMant.getE51PRIORC(), "6")) {out.print("Id del Cliente");}
	                				 else if (isOptionFSeq(prMant.getE51PRIORC(), "7")) {out.print("Id Nacional");}
									 else if (isOptionFSeq(prMant.getE51PRIORC(), "8")) {out.print("Info Adicional");}
									 else {out.print("Dirección");}%>" > :
					</span>
			</div>
			</td> 
            <td nowrap colspan="2"> 
              <div align="left"> 
              	<input type="hidden" readonly="readonly" name="E31PRIORC" size="45" maxlength="35" value="<%= prMant.getE31PRIORC().trim()%>">
				<input type="text" readonly="readonly" id="SWF_50K_3_2" name="E31PRIORC_3" class="swf_field_50" style="display:<%=!prMant.getE01PRIORO().equals("F") ? "inline" : "none"%>"
					size="45" maxlength="35" value="<%= prMant.getE31PRIORC() %>">
				<input type="text" readonly="readonly" id="SWF_50F_3_2" name="SWF_50F_3_2" class="swf_field_50" style="display:<%=prMant.getE01PRIORO().equals("F") ? "inline" : "none"%>"
					size="45" maxlength="35" value="<%= prMant.getE31PRIORC().indexOf('/', 1) != -1 ? prMant.getE31PRIORC().substring(2) : prMant.getE31PRIORC() %>">
              </div>
              <div align="left"> 
              	<input type="hidden" readonly="readonly" name="E41PRIORC" size="45" maxlength="35" value="<%= prMant.getE41PRIORC().trim()%>">
				<input type="text" readonly="readonly" id="SWF_50K_4_2" name="E41PRIORC_4" class="swf_field_50" style="display:<%=!prMant.getE01PRIORO().equals("F") ? "inline" : "none"%>"
					size="45" maxlength="35" value="<%= prMant.getE41PRIORC() %>">
				<input type="text" readonly="readonly" id="SWF_50F_4_2" name="SWF_50F_4_2" class="swf_field_50" style="display:<%=prMant.getE01PRIORO().equals("F") ? "inline" : "none"%>"
					size="45" maxlength="35" value="<%= prMant.getE41PRIORC().indexOf('/', 1) != -1 ? prMant.getE41PRIORC().substring(2) : prMant.getE41PRIORC() %>">
              </div>
              <div align="left"> 
              	<input type="hidden" readonly="readonly" name="E51PRIORC" size="45" maxlength="35" value="<%= prMant.getE51PRIORC().trim()%>">
				<input type="text" readonly="readonly" id="SWF_50K_5_2" name="E51PRIORC_5" class="swf_field_50" style="display:<%=!prMant.getE01PRIORO().equals("F") ? "inline" : "none"%>"
					size="45" maxlength="35" value="<%= prMant.getE51PRIORC() %>">
				<input type="text" readonly="readonly" id="SWF_50F_5_2" name="SWF_50F_5_2" class="swf_field_50" style="display:<%=prMant.getE01PRIORO().equals("F") ? "inline" : "none"%>"
					size="45" maxlength="35" value="<%= prMant.getE51PRIORC().indexOf('/', 1) != -1 ? prMant.getE51PRIORC().substring(2) : prMant.getE51PRIORC() %>">
              </div>
            </td>
      		<td nowrap valign="top" align="right">
				<span id="LBL_59_3" class="swf_field_59" style="display:<%=!prMant.getE01PRIBCO().equals("A") && !prMant.getE01PRIBCO().equals("F") ? "inline" : "none"%>">Dirección :</span>
				<span id="LBL_59A_3" class="swf_field_59" style="display:<%=prMant.getE01PRIBCO().equals("A") ? "inline" : "none"%>"></span>
				<span id="LBL_59F_3" class="swf_field_59" style="display:<%=prMant.getE01PRIBCO().equals("F") ? "inline" : "none"%>"></span>
			</td> 
            <td nowrap > 
              <div align="left"> 
                <input readonly="readonly" type="text" id="E31PRIBCU" name="E31PRIBCU" size="45" maxlength="35" value="<%=prMant.getE31PRIBCU().trim()%>">
              </div>
              <div align="left"> 
                <input readonly="readonly" type="text" id="E41PRIBCU" name="E41PRIBCU" size="45" maxlength="35" value="<%=prMant.getE41PRIBCU().trim()%>"><br>
              </div>
              <div align="left"> 
                <input readonly="readonly" type="text" id="E51PRIBCU" name="E51PRIBCU" size="45" maxlength="35" value="<%=prMant.getE51PRIBCU().trim()%>">
              </div>
            </td>
          </tr>
         </table>
      </td>
    </tr>
  </table>
</div>
<BR>
 <div id="divAccounting">
<table class="tableinfo">
    
    <tr > 
      <td nowrap> 
        <table cellspacing=0 cellpadding=2 width="100%" border="0">
          <tr id="trdark"> 
            <td nowrap > 
              <div align="right">Moneda / Monto a Transferir :</div>
            </td>
            <td nowrap > 
              <input type="text" readonly  name="E01PRITCY" size="3" maxlength="3" value="<%= prMant.getE01PRITCY().trim()%>" >
              <input type="text" readonly  name="E01PRIAMT" size="15" maxlength="13" value="<%= prMant.getE01PRIAMT().trim()%>" >
            </td>
            <td nowrap >Tasa de Cambio :</td>
            <td nowrap > 
              <input type="text" readonly  name="E01PRICXR" size="13" maxlength="13" value="<%= prMant.getE01PRICXR().trim()%>" onKeyPress="enterDecimal()" >
            </td>
            <td nowrap > 
              <div align="right">Fecha Pago :</div>
            </td>
            <td nowrap > 
              <input type="text" readonly  name="E01PRIVDM" size="2" maxlength="2" value="<%= prMant.getE01PRIVDM().trim()%>" >
              <input type="text" readonly  name="E01PRIVDD" size="2" maxlength="2" value="<%= prMant.getE01PRIVDD().trim()%>" >
              <input type="text" readonly  name="E01PRIVDY" size="2" maxlength="2" value="<%= prMant.getE01PRIVDY().trim()%>" >
            </td>
          </tr>
        </table>
      </td>
    </tr>
</table>

    <h4>Cuenta de D&eacute;bito</h4>
  <TABLE class="tableinfo" >
    <tr id="trdark"> 
        <td nowrap align="center" width="5%">Banco </td>
        <td nowrap align="center" width="5%">Agencia</td>
        <td nowrap align="center" width="5%">Moneda</td>
        <td nowrap align="center" width="20%">Cuenta Contable</td>
        <td nowrap align="center" width="20%">Cuenta</td>
        <td nowrap align="center" width="10%">Centro de Costo</td>
        <td nowrap align="center" width="20%">Monto</td>
        <td nowrap align="center" width="15%">Producto</td>
    </tr>
    <tr id="trclear"> 
      <td nowrap > 
        <div align="center"> 
          <input type="text" name="E01PRIDBK" size="2" maxlength="2" value="<%= prMant.getE01PRIDBK().trim()%>" readonly>
        </div>
      </td>
      <td nowrap > 
        <div align="center"> 
          <input type="text" name="E01PRIDBR" size="4" maxlength="4"  value="<%= prMant.getE01PRIDBR().trim()%>" readonly>
        </div>
      </td>
      <td nowrap > 
        <div align="center"> 
          <input type="text" name="E01PRIDCY" size="3" maxlength="3" value="<%= prMant.getE01PRIDCY().trim()%>" readonly>
        </div>
      </td>
      <td nowrap > 
        <div align="center"> 
          <input type="text" name="E01PRIDGL" size="17" maxlength="16" value="<%= prMant.getE01PRIDGL().trim()%>" readonly>
        </div>
      </td>
      <td nowrap  > 
        <div align="center"> 
          <input type="text" name="E01PRIDAC" size="13" maxlength="12" value="<%= prMant.getE01PRIDAC().trim()%>" readonly>
        </div>
      </td>
      <td nowrap > 
        <div align="center"> 
          <input type="text" name="E01PRIDCC" size="9" maxlength="9"  value="<%= prMant.getE01PRIDCC().trim()%>" readonly>
        </div>
      </td>
      <td nowrap > 
        <div align="center"> 
          <input type="text" name="E01PRIDAM" size="15" maxlength="13" value="<%= prMant.getE01PRIDAM().trim()%>" readonly>
        </div>
      </td>
      <td nowrap > 
        <div align="center"> 
          <input type="text" name="E01PRIDPD" size="15" maxlength="15"  value="<%= prMant.getE01PRIDPD().trim()%>" readonly>
        </div>
      </td>
    </tr>
      <tr id="trdark">
        <td nowrap colspan="5">
           <div align="right">Descripci&oacute;n :</div>
        </td>
        <td nowrap  colspan="2">
			<input type="text" id="E01TITDEB" name="E01TITDEB" size="50" maxlength="45" value="<%=prMant.getE01TITDEB().trim()%>" readonly>
        </td>
        <td>
        </td>
      </tr>
    </table>
    <h4>Cuenta de Cr&eacute;dito</h4>
    <table class="tableinfo" >
      <tr id="trdark"> 
        <td nowrap align="center" width="5%">Banco </td>
        <td nowrap align="center" width="5%">Agencia</td>
        <td nowrap align="center" width="5%">Moneda</td>
        <td nowrap align="center" width="20%">Cuenta Contable</td>
        <td nowrap align="center" width="20%">Cuenta</td>
        <td nowrap align="center" width="10%">Centro de Costo</td>
        <td nowrap align="center" width="20%">Monto</td>
        <td nowrap align="center" width="15%">Producto</td>
    </tr>
    <tr id="trclear"> 
      <td nowrap > 
        <div align="center"> 
          <input type="text" name="E01PRICBK" size="2" maxlength="2" value="<%= prMant.getE01PRICBK().trim()%>" readonly>
        </div>
      </td>
      <td nowrap > 
        <div align="center"> 
          <input type="text" name="E01PRICBR" size="4" maxlength="4"  value="<%= prMant.getE01PRICBR().trim()%>" readonly>
        </div>
      </td>
      <td nowrap > 
        <div align="center"> 
          <input type="text" name="E01PRICCY" size="3" maxlength="3" value="<%= prMant.getE01PRICCY().trim()%>" readonly>
        </div>
      </td>
      <td nowrap > 
        <div align="center"> 
          <input type="text" name="E01PRICGL" size="17" maxlength="16" value="<%= prMant.getE01PRICGL().trim()%>" readonly>
        </div>
      </td>
      <td nowrap  > 
        <div align="center"> 
          <input type="text" name="E01PRICAC" size="13" maxlength="12" value="<%= prMant.getE01PRICAC().trim()%>" readonly>
        </div>
      </td>
      <td nowrap > 
        <div align="center"> 
          <input type="text" name="E01PRICCC" size="9" maxlength="9"  value="<%= prMant.getE01PRICCC().trim()%>" readonly>
        </div>
      </td>
      <td nowrap > 
        <div align="center">
          <input type="text" name="E01PRICAM" size="15" maxlength="13" value="<%= prMant.getE01PRICAM().trim()%>" readonly>
        </div>
      </td>
      <td nowrap > 
        <div align="center"> 
          <input type="text" name="E01PRICPD" size="15" maxlength="15"  value="<%= prMant.getE01PRICPD().trim()%>" readonly>
        </div>
      </td>
    </tr>
	            <tr id="trdark">
					<td nowrap colspan="5">
					<div align="right">Descripci&oacute;n :</div>
					</td>
					<td nowrap colspan="2"><input type="text" id="E01TITCRE" name="E01TITCRE" readonly
						size="50" maxlength="45" value="<%=prMant.getE01TITCRE().trim()%>">
					</td>
					<td nowrap> 
                <div align="right"></div>
                <div align="right">D&iacute;as de Retenci&oacute;n : 
                  <input type="text" id="E01PRIHDY" name="E01PRIHDY" size="3" maxlength="3" value="<%=prMant.getE01PRIHDY().trim()%>" readonly>
                </div>
              </td>
            </tr>
    </table>
    
    <h4>Nuestras Comisiones</h4>
  <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing=0 cellpadding=2 width="100%" border="0">
          <tr id="trdark"> 
            <td nowrap width="24%" > 
              <div align="right">Tabla / Monto :</div>
            </td>
            <td nowrap width="30%" > 
              <input type="text" name="E01PRICOT" size="2" maxlength="2" value="<%= prMant.getE01PRICOT().trim()%>" readonly>
              <input type="text" name="E01PRICOM" size="15" maxlength="13" value="<%= prMant.getE01PRICOM().trim()%>" readonly>
            </td>
            <td nowrap width="17%" > 
              <div align="right">Cargos por :</div>
            </td>
            <td nowrap width="29%" > 
              <input type="text" name="E01PRICHG" value="<% if (prMant.getE01PRICHG().equals("A")) {out.print("Aplicante");} 
                else if (prMant.getE01PRICHG().equals("B")) { out.print("Beneficiario");} 
                else if (prMant.getE01PRICHG().equals("N")) {out.print("Ninguno");} 
                else if (prMant.getE01PRICHG().equals("O")) {out.print("Nuestro");}
				else out.print(" ");%>" readonly>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>

    <h4>Informaci&oacute;n B&aacute;sica</h4>
 <table class="tableinfo">
 <tr > 
      <td > 
          <table cellspacing=0 cellpadding=2 width="100%" border="0">
            <tr id="trdark"> 
              <td nowrap  > 
                <div align="right">Referencia :</div>
              </td>
              <td nowrap > 
                <div align="left"> 
                  <input readonly type="text" name="E01PRISRF" size="17" maxlength="16" value="<%= prMant.getE01PRISRF().trim()%>">
                </div>
              </td>
              <td nowrap > 
                <div align="right">Referencia Relacionada :</div>
              </td>
              <td nowrap > 
                <div align="left"> 
                  <input readonly type="text" name="E01PRITHF" size="17" maxlength="16" value="<%= prMant.getE01PRITHF().trim()%>">
                </div>
              </td>
            </tr>
            <tr id="trclear"> 
              <td nowrap  > 
                <div align="right">Motivo de Operaci&oacute;n :</div>
              </td>
              <td nowrap > 
                <div align="left"> 
                  <input readonly type="text" name="E01PRIUC2" size="5" maxlength="4" value="<%= prMant.getE01PRIUC2().trim()%>">
               </div>
              </td>
              <TD nowrap width="17%"> 
                <DIV align="right">Detalle de Cargos  :</DIV>
              </TD>
              <TD nowrap width="29%"> 
				<input type="text" name="E01PRITTC" size="3" maxlength="1" readonly value="<% 
                if (prMant.getE01PRITTC().equals("BEN")){ out.print("BEN"); }
                if (prMant.getE01PRITTC().equals("OUR")){ out.print("OUR"); }
                if (prMant.getE01PRITTC().equals("SHA")){ out.print("SHA"); }
                %>"/>
              </TD>
              
            </tr>

            <tr id="trdark"> 
              <td nowrap  > 
                <div align="right">Origen de Fondos :</div>
              </td>
              <td nowrap > 
                <div align="left">
                  <input readonly type="text" name="E01PRISOU" size="2" maxlength="2" value="<%= prMant.getE01PRISOU().trim()%>">
                 </div>
              </td>
              <td nowrap > 
                <div align="right">Destino de Fondos :</div>
              </td>
              <td nowrap >
                <input readonly type="text" name="E01PRIDIB" size="2" maxlength="2" value="<%= prMant.getE01PRIDIB().trim()%>">
		</td>
            </tr>
            <tr id="trclear"> 
              <td nowrap > 
                <div align="right">Instrucciones Recibidas Via :</div>
              </td>
              <td nowrap colspan="3">
		<input type="text" name="E01PRIIRV" size="10" maxlength="1" readonly value="<% 
                if (prMant.getE01PRIIRV().equals("1")){ out.print("Verbal"); }
                if (prMant.getE01PRIIRV().equals("2")){ out.print("Carta"); }
                if (prMant.getE01PRIIRV().equals("3")){ out.print("Fax"); }
                if (prMant.getE01PRIIRV().equals("4")){ out.print("e-Mail"); }
                if (prMant.getE01PRIIRV().equals("5")){ out.print("Swift"); }
                if (prMant.getE01PRIIRV().equals("6")){ out.print("Telex"); }
                if (prMant.getE01PRIIRV().equals("7")){ out.print("RBS"); }
                %>"/>
         
            </tr>
	</table>
	</td>
   </tr>
</table>
<br>
<% if(!prMant.getE01PRITTP().equals("IT")){ %>
<div id="externalInfo">
    <h4>Informaci&oacute;n Adicional</h4>
 <table class="tableinfo">
 <tr > 
      <td > 
          <table cellspacing=0 cellpadding=2 width="100%" border="0">
            <tr id="trdark"> 
              <td nowrap  > 
                <div align="right">Cod. Operación Bancaria :</div>
              </td>
              <td nowrap > 
                <div align="left"> 
                  <input readonly type="text" name="E01PRIBKO" size="6" maxlength="4" value="<%= prMant.getE01PRIBKO()%>">
               </div>
              </td>
              <td nowrap > 
                <div align="right">Código de Orden :</div>
              </td>
              <td nowrap > 
                <div align="left"> 
                  <input readonly type="text" name="E01PRIITC" size="6" maxlength="4" value="<%= prMant.getE01PRIITC()%>">
                  <input readonly type="text" name="E01PRIITA" size="11" maxlength="10" value="<%= prMant.getE01PRIITA()%>">
                </div>
              </td>
            </tr>
            <tr class="trclear"> 
              	<td nowrap>
              		<div align="right">Banco Remitente :</div> 
              	</td>
              	<td nowrap>
              	 	<input readonly type="text" name="E01PRISID" size="13" maxlength="12" value="<%= prMant.getE01PRISID().trim()%>" readonly> 
              	</td>
              <td nowrap > 
                <div align="right">Banco Receptor :</div>
              </td>
              <td nowrap > 
                <input readonly type="text" name="E01PRIRID" size="15" maxlength="15" value="<%= prMant.getE01PRIRID().trim()%>">
                </td>
            </tr>
            <% if(prMant.getE01PRIPVI().equals("1")){//FED %>
            <tr id="trclear"> 
              <td nowrap  > 
                <div align="right">FED Tipo / Subtipo :</div>
              </td>
              <td nowrap >
                <input type="text" name="E01FEDTYP" size="3" maxlength="2" value="<%= prMant.getE01FEDTYP().trim()%>" readonly>
		<input type="text" name="E01FEDSTY" size="3" maxlength="2" value="<%= prMant.getE01FEDSTY().trim()%>" readonly>
                </a> 
              </td>
              <td nowrap > 
                <div align="right">C&oacute;digo de Producto FED :</div>
              </td>
              <td nowrap >
		<input type="text" name="E01PRIPRC" size="3" maxlength="3" value="<%= prMant.getE01PRIPRC().trim()%>" readonly>
                </a> 
              </td>
            </tr>            
            <tr id="trdark"> 
              <td nowrap  > 
                <div align="right">Informe Regulatorio :</div>
              </td>
              <td nowrap colspan="3" > 
                <input type="text" name="E11PRIRTR" size="36" maxlength="35" value="<%= prMant.getE11PRIRTR().trim()%>" readonly>
              </td>
            </tr>
            <tr id="trclear"> 
              <td nowrap  >&nbsp;</td>
              <td nowrap colspan="3" > 
                <input type="text" name="E21PRIRTR" size="36" maxlength="35" value="<%= prMant.getE21PRIRTR().trim()%>" readonly>
              </td>
            </tr>
            <tr id="trdark"> 
              <td nowrap  >&nbsp;</td>
              <td nowrap colspan="3" > 
                <input type="text" name="E31PRIRTR" size="36" maxlength="35" value="<%= prMant.getE31PRIRTR().trim()%>" readonly>
              </td>
            </tr>
	    <% } %>
	</table>
	</td>
   </tr>
</table>
</div>
<br>
<div id="externalDiv">
	<table class="tabdata" width="100%">
    <tr>
     <td nowrap width="50%" colspan="2"> 
           <table id="TableTab0" cellspacing=0 cellpadding=2 border="0">
          		<tr>
                      <td nowrap id="Tab0" class="tabhighlight"> 
                        	<div nowrap >Banco Originador &nbsp; &nbsp; &nbsp;
							<input type="text" name="E01PRIOBO" readonly size="3" maxlength="2" value="<%= prMant.getE01PRIOBO() %>"/>
                        	</div>
                      </td> 
                 
                  <td class="tabempty" width="100%">&nbsp;                       
                  </td> 
                </tr>
        </table>
       </td>
       <td nowrap width="50%" colspan="2"> 
           <table id="TableTab1" cellspacing=0 cellpadding=2 border="0">
          		<tr> 

                  <td nowrap id="TabB0" class="tabhighlight"> 
                            <div nowrap >Banco de la Cuenta/Pagador &nbsp;
						<input type="text" name="E01PRIBBO" readonly size="3" maxlength="2" value="<%= prMant.getE01PRIBBO() %>"/>
						  </div>
                  </td>

                  <td class="tabempty" width="100%">&nbsp;                       
                  </td> 
                </tr>
        </table>
       </td>
    </tr>
    <tr>
		<td nowrap width="10%" align="right" valign="top" class="trdark"> 
				<span id="LBL_52_1" class="swf_field_52" style="display: inline">Identificador :</span>
				<br>
           		<span id="LBL_52D_2" class="swf_field_52" style="position: relative; top: 10px; display:<%=!prMant.getE01PRIOBO().equals("A") ? "inline" : "none"%>">Nombre :</span>
				<span id="LBL_52A_2" class="swf_field_52" style="position: relative; top: 10px; display:<%=prMant.getE01PRIOBO().equals("A") ? "inline" : "none"%>">BIC/BEI :</span>
				<br>
               	<span id="LBL_52D_3" class="swf_field_52" style="position: relative; top: 20px; display:<%=!prMant.getE01PRIOBO().equals("A") ? "inline" : "none"%>">Dirección :</span>
		</td>
     	<td nowrap width="40%">
                        <div id="dataTab0"> 
                        	<table width="100%" border="0" cellspacing="0" cellpadding="0">
                    		<tr id="trdark" >
							<td nowrap align="right"> 
            				</td>
                      			<td nowrap align="left"> 
		                  <div>
                          <input readonly type="text" name="E11PRIOBK" size="45" maxlength="35" value="<%= prMant.getE11PRIOBK().trim()%>">
                          <br>
                          <input readonly type="text" name="E21PRIOBK" size="45" maxlength="35" value="<%= prMant.getE21PRIOBK().trim()%>">
                          <br>
                          <input readonly type="text" name="E31PRIOBK" size="45" maxlength="35" value="<%= prMant.getE31PRIOBK().trim()%>">
                          <br>
                          <input readonly type="text" name="E41PRIOBK" size="45" maxlength="35" value="<%= prMant.getE41PRIOBK().trim()%>">
                          <br>
                          <input readonly type="text" name="E51PRIOBK" size="45" maxlength="35" value="<%= prMant.getE51PRIOBK().trim()%>">
                          </div>
                        	</td>
                        	<td width="20%">
                        	</td>
    						</tr>
 						 	</table>
                        </div>

        </td>
		<td nowrap width="10%" align="right" valign="top" class="trdark"> 
				<span id="LBL_57_1" class="swf_field_57" style="display: inline">Identificador :</span>
				<br>
                <span id="LBL_57D_2" class="swf_field_57" style="position: relative; top: 10px; display:<%=!prMant.getE01PRIBBO().equals("A") && !prMant.getE01PRIBBO().equals("B") ? "inline" : "none"%>">Nombre :</span>
				<span id="LBL_57A_2" class="swf_field_57" style="position: relative; top: 10px; display:<%=prMant.getE01PRIBBO().equals("A") ? "inline" : "none"%>">BIC :</span>
				<span id="LBL_57B_2" class="swf_field_57" style="position: relative; top: 10px; display:<%=prMant.getE01PRIBBO().equals("B") ? "inline" : "none"%>">Localización:</span>
				<br>
               	<span id="LBL_57D_3" class="swf_field_57" style="position: relative; top: 20px; display:<%=!prMant.getE01PRIBBO().equals("A") && !prMant.getE01PRIBBO().equals("B") ? "inline" : "none"%>">Dirección :</span>
		</td>
     <td nowrap width="40%" valign="top" align="left" class="trdark"> 

                        <div id="dataTabB0"> 
                        		<table width="100%" border="0" cellspacing="0" cellpadding="0">
                    		<tr id="trdark" > 
                      			<td nowrap align="left"> 
						  <div>
                          <input readonly type="text" name="E11PRIBBK" size="45" maxlength="35" value="<%= prMant.getE11PRIBBK().trim()%>">
                          <br>
                          <input readonly type="text" name="E21PRIBBK" size="45" maxlength="35" value="<%= prMant.getE21PRIBBK().trim()%>">
                          <br>
                          <input readonly type="text" name="E31PRIBBK" size="45" maxlength="35" value="<%= prMant.getE31PRIBBK().trim()%>">
                          <br>
                          <input readonly type="text" name="E41PRIBBK" size="45" maxlength="35" value="<%= prMant.getE41PRIBBK().trim()%>">
                          <br>
                          <input readonly type="text" name="E51PRIBBK" size="45" maxlength="35" value="<%= prMant.getE51PRIBBK().trim()%>">
                          </div>
                        	</td>
                        	<td width="20%">
                        	</td>
    						</tr>
 						 	</table>
                        </div>
                        
        </td>
            
    </tr>
  </table>
                 
   <BR>
                    
	<table class="tabdata" width="100%">
    <tr> 
       <td nowrap width="50%" colspan="2"> 
           <table id="TableTabA0" cellspacing="0" cellpadding="2" border="0">
                   <tr> 
               
                      <td nowrap id="TabA0" class="tabhighlight"> 
                        	<div nowrap >Banco Intermediario &nbsp;
							<input type="text" name="E01PRIINO" readonly size="3" maxlength="2" value="<%= prMant.getE01PRIINO() %>"/>
                        	</div>
                      </td> 
                    
					 <td class="tabempty" width="100%">&nbsp;</td>
                  </tr>
	      </table>
	    </td>
       <td nowrap width="50%" colspan="2"> 
           <table id="TableTabD1" cellspacing="0" cellpadding="2" border="0">
                   <tr>                
                      <td nowrap id="TabE0" class="tabhighlight" onClick="showTab('TabE', 0,'E11PRISCB', 2)"> 
                        	<div nowrap >Bco. Corresponsal Emisor &nbsp;
							<input type="text" name="E01PRISCO" readonly size="3" maxlength="2" value="<%= prMant.getE01PRISCO() %>"/>
                        	</div>
                      </td> 
                    
                      <td nowrap id="TabE1" class="tabnormal" onClick="showTab('TabE', 1,'E11PRIRCB', 2)"> 
                        	<div nowrap >Bco. Corresponsal Receptor &nbsp;
						<input type="text" name="E01PRIRBO" readonly size="3" maxlength="2" value="<%= prMant.getE01PRIRBO() %>"/>
                        	</div>
                      </td>

					 <td class="tabempty" width="100%">&nbsp;</td>
                  </tr>
	      </table>
	    </td>
	  </tr>
    	<tr>
		<td nowrap width="10%" align="right" valign="top" class="trdark"> 
			<span id="LBL_56_1" class="swf_field_56" style="position: relative; top: 3px; display: inline">Identificador :</span>
			<br>
            <span id="LBL_56D_2" class="swf_field_56" style="position: relative; top: 10px; display:<%=!prMant.getE01PRIINO().equals("A") && !prMant.getE01PRIINO().equals("C") ? "inline" : "none"%>">Nombre :</span>
			<span id="LBL_56A_2" class="swf_field_56" style="position: relative; top: 10px; display:<%=prMant.getE01PRIINO().equals("A") ? "inline" : "none"%>">BIC :</span>
			<br>
            <span id="LBL_56D_3" class="swf_field_56" style="position: relative; top: 20px; display:<%=!(prMant.getE01PRIINO().equals("A") || prMant.getE01PRIINO().equals("C")) ? "inline" : "none"%>">Dirección :</span>
		</td>
    		 <td nowrap width="40%" align="left" valign="top" class="trdark">                     
                        
                        <div id="dataTabA0"> 
                        	<table width="100%" border="0" cellspacing="0" cellpadding="0">
                    		<tr id="trdark" > 
                      			<td nowrap> 
		                  <div>
                          <input readonly type="text" name="E11PRIINB" size="45" maxlength="35" value="<%= prMant.getE11PRIINB().trim()%>">
                          <br>
                          <input readonly type="text" name="E21PRIINB" size="45" maxlength="35" value="<%= prMant.getE21PRIINB().trim()%>">
                          <br>
                          <input readonly type="text" name="E31PRIINB" size="45" maxlength="35" value="<%= prMant.getE31PRIINB().trim()%>">
                          <br>
                          <input readonly type="text" name="E41PRIINB" size="45" maxlength="35" value="<%= prMant.getE41PRIINB().trim()%>">
                          <br>
                          <input readonly type="text" name="E51PRIINB" size="45" maxlength="35" value="<%= prMant.getE51PRIINB().trim()%>">
                          </div>
                        	</td>
                        	<td width="20%">
                        	</td>
    						</tr>
 						 	</table>
                        </div>
                    </td>
		<td nowrap width="10%" align="right" valign="top" class="trdark"> 
			<div id="LBL_53" class="dataTabE">
			<span id="LBL_53_1" class="swf_field_53" style="position: relative; top: 3px; display: inline">Identificador :</span>
			<br>
			<span id="LBL_53D_2" class="swf_field_53" style="position: relative; top: 10px; display:<%=!(prMant.getE01PRISCO().equals("A") || prMant.getE01PRISCO().equals("B")) ? "inline" : "none"%>">Nombre :</span>
			<span id="LBL_53A_2" class="swf_field_53" style="position: relative; top: 10px; display:<%=prMant.getE01PRISCO().equals("A") ? "inline" : "none"%>">BIC :</span>
			<span id="LBL_53B_2" class="swf_field_53" style="position: relative; top: 10px; display:<%=prMant.getE01PRISCO().equals("B") ? "inline" : "none"%>">Localización :</span>
			<br>
            <span id="LBL_53D_3" class="swf_field_53" style="position: relative; top: 20px; display:<%=!(prMant.getE01PRISCO().equals("A") || prMant.getE01PRISCO().equals("B")) ? "inline" : "none"%>">Dirección :</span>
			</div>
			<div id="LBL_54" class="dataTabE" style="display: none"> 
			<span id="LBL_54_1" class="swf_field_54" style="position: relative; top: 3px; display: inline">Identificador :</span>
			<br>
			<span id="LBL_54D_2" class="swf_field_54" style="position: relative; top: 10px; display:<%=!prMant.getE01PRIRBO().equals("A") && !prMant.getE01PRIRBO().equals("B") ? "inline" : "none"%>">Nombre :</span>
			<span id="LBL_54A_2" class="swf_field_54" style="position: relative; top: 10px; display:<%=prMant.getE01PRIRBO().equals("A") ? "inline" : "none"%>">BIC :</span>
			<span id="LBL_54B_2" class="swf_field_54" style="position: relative; top: 10px; display:<%=prMant.getE01PRIRBO().equals("B") ? "inline" : "none"%>">Localización :</span>
			<br>
            <span id="LBL_54D_3" class="swf_field_54" style="position: relative; top: 20px; display:<%=!(prMant.getE01PRIRBO().equals("A") || prMant.getE01PRIRBO().equals("B")) ? "inline" : "none"%>">Dirección :</span>
            </div>
		</td>
    		 <td nowrap width="40%" align="left" class="trdark">
                        
                        <div id="dataTabE0" class="dataTabE">
                        	<table width="100%" border="0" cellspacing="0" cellpadding="0">
                    		<tr id="trdark" > 
                      			<td nowrap> 
		                  	<div>
                          <input readonly type="text" name="E11PRISCB" size="45" maxlength="35" value="<%= prMant.getE11PRISCB().trim()%>">
                          <br>
                          <input readonly type="text" name="E21PRISCB" size="45" maxlength="35" value="<%= prMant.getE21PRISCB().trim()%>">
                          <br>
                          <input readonly type="text" name="E31PRISCB" size="45" maxlength="35" value="<%= prMant.getE31PRISCB().trim()%>">
                          <br>
                          <input readonly type="text" name="E41PRISCB" size="45" maxlength="35" value="<%= prMant.getE41PRISCB().trim()%>">
                          <br>
                          <input readonly type="text" name="E51PRISCB" size="45" maxlength="35" value="<%= prMant.getE51PRISCB().trim()%>">
                          </div>
                       		</td>
                       		<td width="20%">
                       		</td>
    						</tr>
 						 	</table>
                        </div>
                        <div id="dataTabE1" class="dataTabE" style="display: none" > 
                        	<table width="100%" border="0" cellspacing="0" cellpadding="0">
                    		<tr id="trdark" > 
                      			<td nowrap> 
		                <div>
                          <input readonly type="text" name="E11PRIRCB" size="45" maxlength="35" value="<%= prMant.getE11PRIRCB().trim()%>">
                          <br>
                          <input readonly type="text" name="E21PRIRCB" size="45" maxlength="35" value="<%= prMant.getE21PRIRCB().trim()%>">
                          <br>
                          <input readonly type="text" name="E31PRIRCB" size="45" maxlength="35" value="<%= prMant.getE31PRIRCB().trim()%>">
                          <br>
                          <input readonly type="text" name="E41PRIRCB" size="45" maxlength="35" value="<%= prMant.getE41PRIRCB().trim()%>">
                          <br>
                          <input readonly type="text" name="E51PRIRCB" size="45" maxlength="35" value="<%= prMant.getE51PRIRCB().trim()%>">
                          </div>
                        	</td>
                        	<td width="20%">
                        	</td>
    						</tr>
 						 	</table>
                        </div>                      
                    </td>
  	</tr>
  </table>
   <BR>
	<table class="tabdata" width="100%">
    <tr> 
       <td nowrap width="100%"> 
           <table id="TableTabD1" cellspacing="0" cellpadding="2" border="0">
                   <tr> 
               
                  <td nowrap id="TabD0" class="tabhighlight" onClick="showTab('TabD', 0,'E11PRIDTO', 3)"> 
                            <div nowrap >Detalles para Ordenante </div>
                  </td> 
                
                  <td nowrap id="TabD1" class="tabnormal" onClick="showTab('TabD', 1,'E11PRIDTP', 3)"> 
                            <div nowrap >Detalles de Pago </div>
                  </td> 
                  
                      <td nowrap id="TabD2" class="tabnormal" onClick="showTab('TabD', 2,'E11PRIBKB', 3)"> 
                        	<div nowrap >Infor. Banco a Banco</div>
                      </td> 

					 <td class="tabempty" width="100%">&nbsp;</td>
                  </tr>
	      </table>
	    </td>
	  </tr>
    	<tr>
    		 <td nowrap width="50%" class="trdark">
                        
                        <div id="dataTabD0" align="right"> 
                        	<table width="100%" border="0" cellspacing="0" cellpadding="0">
                    		<tr id="trdark" > 
                      		<td nowrap align="center">  
		                          <input readonly type="text" name="E11PRIDTO" size="45" maxlength="35" value="<%= prMant.getE11PRIDTO().trim()%>">
		                          <br>
		                          <input readonly type="text" name="E21PRIDTO" size="45" maxlength="35" value="<%= prMant.getE21PRIDTO().trim()%>">
		                          <br>
		                          <input readonly type="text" name="E31PRIDTO" size="45" maxlength="35" value="<%= prMant.getE31PRIDTO().trim()%>">
		                          <br>
		                          <input readonly type="text" name="E41PRIDTO" size="45" maxlength="35" value="<%= prMant.getE41PRIDTO().trim()%>">
		                          <br>
		                          <input readonly type="text" name="E51PRIDTO" size="45" maxlength="35" value="<%= prMant.getE51PRIDTO().trim()%>">
                        		</td>
    						</tr>
 						 	</table>
                        </div>
                        <div id="dataTabD1" style="display: none" align=center>
							<table width="100%" border="0" cellspacing="0" cellpadding="0">
                    		<tr id="trdark" > 
                      			<td nowrap align="center"> 
                        <input readonly type="text" name="E11PRIDTP" size="45" maxlength="35" value="<%= prMant.getE11PRIDTP().trim()%>">
                        <br>
                        <input readonly type="text" name="E21PRIDTP" size="45" maxlength="35" value="<%= prMant.getE21PRIDTP().trim()%>">
                        <br>
                          <input readonly type="text" name="E31PRIDTP" size="45" maxlength="35" value="<%= prMant.getE31PRIDTP().trim()%>">
                          <br>
                          <input readonly type="text" name="E41PRIDTP" size="45" maxlength="35" value="<%= prMant.getE41PRIDTP().trim()%>">
                          <br>
                          <input readonly type="text" name="E51PRIDTP" size="45" maxlength="35" value="<%= prMant.getE51PRIDTP().trim()%>">
                        	</td>
    						</tr>
 						 	</table>
                        </div>
                        <div id="dataTabD2" style="display: none" align=center>
                       <table width="100%" border="0" cellspacing="0" cellpadding="0">
                    	<tr id="trdark" > 
                      	<td nowrap align="center"> 
                          <input readonly type="text" name="E11PRIBKB" size="45" maxlength="35" value="<%= prMant.getE11PRIBKB().trim()%>">
                          <br>
                          <input readonly type="text" name="E21PRIBKB" size="45" maxlength="35" value="<%= prMant.getE21PRIBKB().trim()%>">
                          <br>
                          <input readonly type="text" name="E31PRIBKB" size="45" maxlength="35" value="<%= prMant.getE31PRIBKB().trim()%>">
                          <br>
                          <input readonly type="text" name="E41PRIBKB" size="45" maxlength="35" value="<%= prMant.getE41PRIBKB().trim()%>">
                          <br>
                          <input readonly type="text" name="E51PRIBKB" size="45" maxlength="35" value="<%= prMant.getE51PRIBKB().trim()%>">
                          <br>
                          <input readonly type="text" name="E61PRIBKB" size="45" maxlength="35" value="<%= prMant.getE61PRIBKB().trim()%>">
                        	</td>
    						</tr>
 						 	</table>
                        </div>
                    </td>
  	</tr>
  </table>
 </div>
 <% } %>
 <% if (prMant.getE01PRIPVI().equals("7")){ %>
 <div id="otherTags">
	<% 
	String mSeq = "";
	for (int i = 0; i < 10; i++) {
		String tag = prMant.getField("E01PRATG"+i).getString().trim();
	  	String option = prMant.getField("E01PRAOP"+i).getString().trim();
		if (!tag.equals("")) {
			if (!mSeq.equals(prMant.getField("E01PRASQ"+i).getString().trim())) {
	%>
	<h4>Campos Adicionales - Secuencia <%= prMant.getField("E01PRASQ"+i).getString().trim()%></h4>
<TABLE class="tableinfo" id="dataTable">
	<%
			}
			mSeq = prMant.getField("E01PRASQ"+i).getString().trim();
			if(i == 0){
	%>
    <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td NOWRAP align="center" width="20%"></td>
		<td NOWRAP align="center" width="5%"><b>TAG</b></td>
		<td NOWRAP align="center" width="5%"><b>Opción</b></td>
		<td NOWRAP align="left" width="65%"><b>Valor</b></td>
	</TR>
	<%
			}
	%>
    <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td NOWRAP align="right" width="20%" valign="top">
			<b><%= prMant.getField("E01TAGDS"+i).getString().trim()%> :</b>
		</td>
		<td NOWRAP align="center" width="5%" valign="top">
			<%= prMant.getField("E01PRATG"+i).toString().trim()%>
		</td>
		<td NOWRAP align="center" width="5%" valign="top">
			<INPUT type="text" name="E01PRAOP<%= i %>" size="2" maxlength="1" value="<%= prMant.getField("E01PRAOP"+i).getString().trim()%>" readonly>
		</td>
		<td NOWRAP align="left" width="65%" valign="top">
			<INPUT type="hidden" name="E01PRAFL<%= i %>" value="<%= prMant.getField("E01PRAFL"+i).getString().trim()%>">		
	        <%
	        int seq = 1;
	        int lnt = Util.parseInt(prMant.getField("E01TAGLE"+i).getString().trim());
	        int ln = lnt;
	        if (lnt > 35) {
	          seq = lnt / 35;
	          ln = 35;
	        }  	
	        for (int ix = 1; ix <= seq; ix++) {
	          int posi = (ix * ln) - ln;
	          int posf = (ix * ln) - 1;
	          String vl = "";
	          try {
	            vl =  prMant.getField("E01PRAFL"+i).getString().substring(posi,posf);
	          } catch (Exception e) {
	          	if(posi <=  prMant.getField("E01PRAFL"+i).getString().length()) {
				  vl = prMant.getField("E01PRAFL"+i).getString().substring(posi);
				}
	          }
			%>
			  <INPUT type="text" name="E01PRAFL<%=i%>_<%=ix%>" size="40" maxlength="35" value="<%= vl %>"  readonly><BR> 
			<%}%>   
		</td>
	</TR>
	<%
		} 
	}
	%>
  </TABLE>
</div>
<% } %>
 <% if(false){ %>
 <div id="divDCV">
    <BR>
    <h4>Claves Confirmación DCV</h4>
    <table class="tableinfo">
      <tr > 
        <td nowrap> 
          <table cellspacing=0 cellpadding=2 width="100%" border="0">
            <tr id="trdark"> 
              <td nowrap width="24%" > 
                <input readonly type="text" name="E01PRUCR1" size="16" maxlength="15" value="<%= prMant.getE01PRUCR1().trim()%>">
              </td>
              <td nowrap width="30%" > 
                <input readonly type="text" name="E01PRUCR2" size="16" maxlength="15" value="<%= prMant.getE01PRUCR2().trim()%>">
                </td>
              <td nowrap width="17%" > 
                <input readonly type="text" name="E01PRUCR3" size="16" maxlength="15" value="<%= prMant.getE01PRUCR3().trim()%>">
              </td>
              <td nowrap width="29%" > 
                <input readonly type="text" name="E01PRUCR4" size="16" maxlength="15" value="<%= prMant.getE01PRUCR4().trim()%>">
              </td>
              <td nowrap width="29%" > 
                <input readonly type="text" name="E01PRUCR5" size="16" maxlength="15" value="<%= prMant.getE01PRUCR5().trim()%>">
              </td>
            </tr>

            <tr id="trclear"> 
              <td nowrap width="24%" > 
                <input readonly type="text" name="E01PRUCR6" size="16" maxlength="15" value="<%= prMant.getE01PRUCR6().trim()%>">
              </td>
              <td nowrap width="30%" > 
                <input readonly type="text" name="E01PRUCR7" size="16" maxlength="15" value="<%= prMant.getE01PRUCR7().trim()%>">
                </td>
              <td nowrap width="17%" > 
                <input readonly type="text" name="E01PRUCR8" size="16" maxlength="15" value="<%= prMant.getE01PRUCR8().trim()%>">
              </td>
              <td nowrap width="29%" > 
                <input readonly type="text" name="E01PRUCR9" size="16" maxlength="15" value="<%= prMant.getE01PRUCR9().trim()%>">
              </td>
              <td nowrap width="29%" > 
                <input readonly type="text" name="E01PRUC10" size="16" maxlength="15" value="<%= prMant.getE01PRUC10().trim()%>">
              </td>
            </tr>


          </table>
        </td>
      </tr>
    </table>
    </div>
<% } %>


</form>

</body>
</html>
