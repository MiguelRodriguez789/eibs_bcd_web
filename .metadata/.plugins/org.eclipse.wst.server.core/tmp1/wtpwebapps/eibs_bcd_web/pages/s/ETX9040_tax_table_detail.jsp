<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@page import="com.datapro.eibs.constants.ISOCodes"%>
<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@ page import = "datapro.eibs.master.Util" %>
<%@ page import="com.datapro.constants.EibsFields"%>

<html>
<head>
<title>Detalle Bases UVT</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

</head>

<jsp:useBean id="ETX9040Record" class="datapro.eibs.beans.ETX904001Message"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />
 
<body>

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript">

function goAction(op) {
	document.forms[0].SCREEN.value = op;
	if (op == 4) {
		if (!confirm("Desea borrar el registro seleccionado??")) {
			return;
		}
	}
	document.forms[0].submit();
}

function chgTipo(p) {

 	if (p == "I"  || p == "T" || p == "G") {
		getElement("IV").style.display='block';
		getElement("RR").style.display='none';
		getElement("TAXGL1").innerHTML = " de Impuestos Recibidos :";
		getElement("TAXGL2").innerHTML = " de Impuestos Pagados :";
		getElement("TAXGCD").innerHTML = " Contigencia Débitos :";
		getElement("TAXGCC").innerHTML = " Contigencia Créditos :";
	} else if (p == "R" || p == "C" || p == "E") {
		getElement("IV").style.display='none';
		getElement("RR").style.display='block';
		getElement("TAXGL1").innerHTML = " de Retención por Pagar :";
		getElement("TAXGL2").innerHTML = " de Retención Pagada :"; 
	}
	if (p == "G") {
		getElement("GMF").style.display='block';
	} else {
		getElement("GMF").style.display='none';
	}
	
	if(p == "T"){
		getElement("ITE").style.display='table-row';
	} else {
		getElement("ITE").style.display='none';
	}
	
	
	
	getElement("TAXGLXACD").innerHTML = getElement("TAXGL1").innerHTML;
 }

function stopRKey(evt) {
  var evt = (evt) ? evt : ((event) ? event : null);
  var node = (evt.target) ? evt.target : ((evt.srcElement) ? evt.srcElement : null);
  if ((evt.keyCode == 13) && (node.type=="text"))  {return false;}
}

document.onkeypress = stopRKey; 
 
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
 	String mandatory = "<img src=\"" + request.getContextPath() + "/images/Check.gif\" alt=\"campo obligatorio\" align=\"bottom\" border=\"0\" >";
 	Boolean isReadOnly = false;
 	String readNew = (!userPO.getPurpose().equals("NEW")?"readonly":"");
 	Boolean readMnt = (!userPO.getPurpose().equals("NEW")?true:false);
 	 	
 	if (!(userPO.getPurpose().equals("NEW") || userPO.getPurpose().equals("MAINTENANCE"))) 
		{ read = " readonly ";
		  disabled = " disabled";
		  mandatory = "";
		  isReadOnly = true;
		}	
	
%>

<H3 align="center"> 
					<% if (userPO.getPurpose().equals("NEW")) { 
										out.println("   Nuevo - "); 
					   } 
					   else if (userPO.getPurpose().equals("MAINTENANCE")) {
					                               out.println("  Mantenimiento - "); 
					   }			  
					   else { out.println("  Consulta - ");
					   } 
				   %>Impuestos y Retenciones<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="tax_table_details.jsp, ETX9040">
</H3>

<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.taxes.JSETX9040" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="5">

<h4>Información Básica</h4>
<%int row = 0; %> 
<table width="100%"> <tr> <td nowrap> 
  	<table  width="100%" > <tr bordercolor="#FFFFFF"> <td nowrap> 
        <table class="tableinfo" cellspacing="0" width="100%" border="0">
			<tr class="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            	<td nowrap width="50%" align="right">Banco : </td>
            	<td nowrap width="50%" align="left">
					<eibsinput:text name="ETX9040Record" property="E01TAXBNK" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_BANK %>" required="true" readonly="<%=readMnt%>"/>
				</td>
			</tr>
			<tr class="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
				<td nowrap width="50%" align="right">Código : </td>
				<td nowrap width="50%" align="left">
					<input type="text" name="E01TAXCOD" size="4" maxlength="3" value="<%= ETX9040Record.getE01TAXCOD().trim()%>" <%=readNew%>>
					<%=mandatory%>
				</td>
			</tr> 
			<tr class="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            	<td nowrap width="50%" align="right">Descripción : </td>
            	<td nowrap width="50%" align="left">
            		<input type="text" name="E01TAXDSC" size="50" maxlength="45" value="<%= ETX9040Record.getE01TAXDSC().trim()%>" <%=read%>>
					<%=mandatory%>
				</td>
			</tr>       
        	<tr class="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
				<td nowrap width="50%" align="right">Tipo Impuesto : </td>
				<td nowrap width="50%" align="left"> 
              		<select name="E01TAXFL1" <%= disabled %> onchange="chgTipo(this.value)">
						<option <%= ETX9040Record.getE01TAXFL1().trim().equals("I")?"selected":"" %> value="I">IVA  </option>
						<option <%= ETX9040Record.getE01TAXFL1().trim().equals("G")?"selected":"" %> value="G">GMF</option>
						<option <%= ETX9040Record.getE01TAXFL1().trim().equals("C")?"selected":"" %> value="C">Retención ICA</option>
						<option <%= ETX9040Record.getE01TAXFL1().trim().equals("R")?"selected":"" %> value="R">Retención Renta</option>
						<option <%= ETX9040Record.getE01TAXFL1().trim().equals("E")?"selected":"" %> value="E">Retención IVA</option>
						<option <%= ETX9040Record.getE01TAXFL1().trim().equals("T")?"selected":"" %> value="T">Timbre</option>
					</select>
					<%=mandatory%>
				</td>
			</tr>
        	<tr class="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
				<td nowrap width="50%" align="right">Tarifa General :</td>
				<td nowrap width="50%" align="left">
					<eibsinput:text name="ETX9040Record" property="E01TAXPRC" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_RATE %>" required="false" readonly="<%=isReadOnly %>"/> 
					<select name="E01TAXEXP" <%= disabled %>>
						<option <%= ETX9040Record.getE01TAXEXP().trim().equals("P")?"selected":"" %> value="P">PORCENTAJE / TASA</option>
						<option <%= ETX9040Record.getE01TAXEXP().trim().equals("A")?"selected":"" %> value="A">MONTO</option>
						<option <%= ETX9040Record.getE01TAXEXP().trim().equals("U")?"selected":"" %> value="U">UVT</option>
					</select>
				</td>
			</tr>
			<tr class="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
				<td nowrap width="50%" align="right">Base :</td>
				<td nowrap width="50%" align="left">
					<eibsinput:text name="ETX9040Record" property="E01TAXBAS" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_RATE %>" required="false" readonly="<%=isReadOnly %>"/> 
					<select name="E01TAXTBS" <%= disabled %>>
						<option <%= ETX9040Record.getE01TAXTBS().trim().equals("A")?"selected":"" %> value="A">MONTO</option>
						<option <%= ETX9040Record.getE01TAXTBS().trim().equals("R")?"selected":"" %> value="R">PORCENTAJE / TASA</option>
						<option <%= ETX9040Record.getE01TAXTBS().trim().equals("U")?"selected":"" %> value="U">UVT</option>
						<option <%= ETX9040Record.getE01TAXTBS().trim().equals("D")?"selected":"" %> value="D">DOCUMENTO</option>
					</select>
				</td>
			</tr>
			<tr class="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            	<td nowrap width="50%" align="right">Cuenta Contable<label id="TAXGL1"></label></td>
            	<td nowrap width="50%" align="left">
					<eibsinput:text name="ETX9040Record" property="E01TAXGL1" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_GLEDGER %>" required="true" readonly="<%=isReadOnly %>" />
					<A href="javascript:GetLedger('E01TAXGL1',document.forms[0].E01TAXBNK.value,'<%=currUser.getE01BCU()%>','')"> 
						<IMG src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" border="0" align="top">
					</A>
					<%= ETX9040Record.getD01TAXGL1()%>
				</td>
			</tr>
			<tr class="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
				<td nowrap width="50%" align="right">Cuenta Contable<label id="TAXGL2"></label></td> 
				<td nowrap width="50%" align="left"> 
              		<eibsinput:text name="ETX9040Record" property="E01TAXGL2" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_GLEDGER %>" required="true" readonly="<%=isReadOnly %>"/>
					<A href="javascript:GetLedger('E01TAXGL2',document.forms[0].E01TAXBNK.value,'<%=currUser.getE01BCU()%>','')"> 
						<IMG src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" border="0" align="top">
					</A>
						<%= ETX9040Record.getD01TAXGL2() %>
				</td>
			</tr>
			<tr id="ITE" class="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>" style="display: <%= ETX9040Record.getE01TAXFL1().trim().equals("T") ? "table-row" : "none"%>">
				<td nowrap width="50%" align="right">Numero maximo de Meses a Calcular : </td> 
				<td nowrap width="50%" align="left"> 
              		<eibsinput:text name="ETX9040Record" property="E01TAXUS5" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DAYS%>" required="<%= currUser.getE01INT().equals(ISOCodes.getIBSCountryCode(\"CL\")) ? \"true\" : \"false\"%>" readonly="<%=isReadOnly %>"/>
				</td>
			</tr>
			</table>
		</table>
		
		
			
	<div id="RR" style="position:relative; display:none;">
		<table class="tableinfo" width=80% height=10%">
			<tr class="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
				<td nowrap width="50%" align="right">% de Retención menor al Límite : </td>
				<td nowrap width="50%" align="left">
					<eibsinput:text name="ETX9040Record" property="E01TAXART" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_PERCENTAGE %>" required="true" readonly="<%=isReadOnly %>"/>
				</td>
			</tr>
			<tr class="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
				<td nowrap width="50%" align="right">Tasa adicional para NO Residentes : </td>
				<td nowrap width="50%" align="left">
					<eibsinput:text name="ETX9040Record" property="E01TAXADR" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_RATE %>" required="true" readonly="<%=isReadOnly %>"/>
				</td>
			</tr>
		</table>
	</div>
				
	<div id="IV" style="position:relative; display:none;">
		<table class="tableinfo" width=80% height=10%">
			<tr class="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            	<td nowrap width="50%" align="right">Cuenta Contable<label id="TAXGCD"></label></td>
            	<td nowrap width="50%" align="left">
					<eibsinput:text name="ETX9040Record" property="E01TAXGCD" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_GLEDGER %>" required="false" readonly="<%=isReadOnly %>"/>
					<A href="javascript:GetLedger('E01TAXGCD',document.forms[0].E01TAXBNK.value,'<%=currUser.getE01BCU()%>','')"> 
						<IMG src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" border="0" align="top">
					</A>
					<%= ETX9040Record.getD01TAXGCD()%>
				</td>
			</tr>
			<tr class="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
				<td nowrap width="50%" align="right">Cuenta Contable<label id="TAXGCC"></label></td> 
				<td nowrap width="50%" align="left"> 
              		<eibsinput:text name="ETX9040Record" property="E01TAXGCC" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_GLEDGER %>" required="false" readonly="<%=isReadOnly %>"/>
					<A href="javascript:GetLedger('E01TAXGCC',document.forms[0].E01TAXBNK.value,'<%=currUser.getE01BCU()%>','')"> 
						<IMG src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" border="0" align="top">
					</A>
						<%= ETX9040Record.getD01TAXGCC() %>
				</td>
			</tr>
		</table>
	</div>



		<h4>Información Adicional</h4>
   			<TABLE  id="mainTable" class="tableinfo" style="height:100px;">
    			<tr  height="5%"> 
      				<td NOWRAP valign="top" width="100%"> 
						<table id="headTable" width="100%">
						<tr id="trdark">
							<td NOWRAP align="center" width="5%"><B>Tipo Producto<br>(si no aplica la Tarifa General, Base y/o Cuenta Contable)</B></td>
							<td NOWRAP align="center" width="5%"><B>Tarifa</B></td>
							<td NOWRAP align="center" width="5%"><B>Base</B></td>
							<td NOWRAP align="center" width="5%"><B>Cuenta Contable<br><label id="TAXGLXACD"></label></B></td>
						</tr>
        				</table>
      				</td>
    			</tr>    
		  		<tr  height="95%">    
		    		<td nowrap="nowrap">      
		       		<div id="dataDiv1" style="height:100; overflow:auto;"> 
		       		<table id="dataTable" cellspacing="0" cellpadding="1" border="0" width="100%">         
						<tr id="dataTable01">
							<td nowrap width="25%" align="center">
								<eibsinput:cnofc property="E01TAXAC1" name="ETX9040Record" flag="04" fn_code="E01TAXAC1" />
              					<a href="javascript:GetApplicationCode('E01TAXAC1')">
              					<img src="<%=request.getContextPath()%>/images/1b.gif" title="Código de Aplicación" align="bottom" border="0"></a>
							</td>
							<td nowrap width="25%" align="center">
								<eibsinput:text name="ETX9040Record" property="E01TAXPR1" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_RATE %>" required="false" readonly="<%=isReadOnly %>"/>
							</td>
							<td nowrap width="25%" align="center">
								<eibsinput:text name="ETX9040Record" property="E01TAXBA1"  eibsType="<%= EibsFields.EIBS_FIELD_TYPE_RATE %>" required="false" readonly="<%=isReadOnly %>"/>
							</td>
							<td nowrap width="25%" align="center">
								<eibsinput:help name="ETX9040Record" property="E01TAXGLA" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_GLEDGER%>" required="false" readonly="<%=isReadOnly %>"
               	    			fn_param_one="E01TAXGLA" fn_param_two="<%= ETX9040Record.getE01TAXBNK() %>" fn_param_three="<%= currUser.getE01BCU() %>"/> 
							</td>
						</tr>	
						<tr id="dataTable02">
							<td nowrap width="25%" align="center">
								<eibsinput:cnofc property="E01TAXAC2" name="ETX9040Record" flag="04" fn_code="E01TAXAC2" />
								<a href="javascript:GetApplicationCode('E01TAXAC2')">
              					<img src="<%=request.getContextPath()%>/images/1b.gif" title="Código de Aplicación" align="bottom" border="0"></a>
							</td>
							<td nowrap width="25%" align="center">
								<eibsinput:text name="ETX9040Record" property="E01TAXPR2" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_RATE %>" required="false" readonly="<%=isReadOnly %>"/>
							</td>
							<td nowrap width="25%" align="center">
								<eibsinput:text name="ETX9040Record" property="E01TAXBA2" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_RATE %>" required="false" readonly="<%=isReadOnly %>"/>
							</td>
							<td nowrap width="25%" align="center">
								<eibsinput:help name="ETX9040Record" property="E01TAXGLB" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_GLEDGER%>" required="false" readonly="<%=isReadOnly %>"
               	    			fn_param_one="E01TAXGLB" fn_param_two="<%= ETX9040Record.getE01TAXBNK() %>" fn_param_three="<%= currUser.getE01BCU() %>"/>
							</td>
						</tr>
						<tr id="dataTable03">	
							<td nowrap width="25%" align="center">
								<eibsinput:cnofc property="E01TAXAC3" name="ETX9040Record" flag="04" fn_code="E01TAXAC3" />
								<a href="javascript:GetApplicationCode('E01TAXAC3')">
              					<img src="<%=request.getContextPath()%>/images/1b.gif" title="Código de Aplicación" align="bottom" border="0"></a> 
							</td>
							<td nowrap width="25%" align="center">
								<eibsinput:text name="ETX9040Record" property="E01TAXPR3" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_RATE %>" required="false" readonly="<%=isReadOnly %>"/>
							</td>
							<td nowrap width="25%" align="center">
								<eibsinput:text name="ETX9040Record" property="E01TAXBA3" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_RATE %>" required="false" readonly="<%=isReadOnly %>"/>
							</td>
							<td nowrap width="25%" align="center">
								<eibsinput:help name="ETX9040Record" property="E01TAXGLC" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_GLEDGER%>" required="false" readonly="<%=isReadOnly %>"
               	    			fn_param_one="E01TAXGLC" fn_param_two="<%= ETX9040Record.getE01TAXBNK() %>" fn_param_three="<%= currUser.getE01BCU() %>"/>
							</td>
						</tr>
						<tr id="dataTable04">	
							<td nowrap width="25%" align="center">
								<eibsinput:cnofc property="E01TAXAC4" name="ETX9040Record" flag="04" fn_code="E01TAXAC4" />							
								<a href="javascript:GetApplicationCode('E01TAXAC4')">
              					<img src="<%=request.getContextPath()%>/images/1b.gif" title="Código de Aplicación" align="bottom" border="0"></a>
              				</td>	
							<td nowrap width="25%" align="center">
								<eibsinput:text name="ETX9040Record" property="E01TAXPR4" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_RATE %>" required="false" readonly="<%=isReadOnly %>"/>
							</td>
							<td nowrap width="25%" align="center">
								<eibsinput:text name="ETX9040Record" property="E01TAXBA4" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_RATE %>" required="false" readonly="<%=isReadOnly %>"/>
							</td>
							<td nowrap width="25%" align="center">
								<eibsinput:help name="ETX9040Record" property="E01TAXGLD" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_GLEDGER%>" required="false" readonly="<%=isReadOnly %>"
               	    			fn_param_one="E01TAXGLD" fn_param_two="<%= ETX9040Record.getE01TAXBNK() %>" fn_param_three="<%= currUser.getE01BCU() %>"/>
							</td>
							</tr>
						<tr id="dataTable05">	
							<td nowrap width="25%" align="center">
								<eibsinput:cnofc property="E01TAXAC5" name="ETX9040Record" flag="04" fn_code="E01TAXAC5" />
								<a href="javascript:GetApplicationCode('E01TAXAC5')">
              					<img src="<%=request.getContextPath()%>/images/1b.gif" title="Código de Aplicación" align="bottom" border="0"> </a>
							</td>
							<td nowrap width="25%" align="center">
								<eibsinput:text name="ETX9040Record" property="E01TAXPR5" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_RATE %>" required="false" readonly="<%=isReadOnly %>"/>
							</td>
							<td nowrap width="25%" align="center">
								<eibsinput:text name="ETX9040Record" property="E01TAXBA5" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_RATE %>" required="false" readonly="<%=isReadOnly %>"/>
							</td>
							<td nowrap width="25%" align="center">
								<eibsinput:help name="ETX9040Record" property="E01TAXGLE" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_GLEDGER%>" required="false" readonly="<%=isReadOnly %>"
               	    			fn_param_one="E01TAXGLE" fn_param_two="<%= ETX9040Record.getE01TAXBNK() %>" fn_param_three="<%= currUser.getE01BCU() %>"/>
							</td>
						</tr>
						<tr id="dataTable06">	
							<td nowrap width="25%" align="center">
								<eibsinput:cnofc property="E01TAXAC6" name="ETX9040Record" flag="04" fn_code="E01TAXAC6" />
								<a href="javascript:GetApplicationCode('E01TAXAC6')">
              					<img src="<%=request.getContextPath()%>/images/1b.gif" title="Código de Aplicación" align="bottom" border="0"></a> 
							</td>
							<td nowrap width="25%" align="center">
								<eibsinput:text name="ETX9040Record" property="E01TAXPR6" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_RATE %>" required="false" readonly="<%=isReadOnly %>"/>
							</td>
							<td nowrap width="25%" align="center">
								<eibsinput:text name="ETX9040Record" property="E01TAXBA6" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_RATE %>" required="false" readonly="<%=isReadOnly %>"/>
							</td>
							<td nowrap width="25%" align="center">
								<eibsinput:help name="ETX9040Record" property="E01TAXGLF" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_GLEDGER%>" required="false" readonly="<%=isReadOnly %>"
               	    			fn_param_one="E01TAXGLF" fn_param_two="<%= ETX9040Record.getE01TAXBNK() %>" fn_param_three="<%= currUser.getE01BCU() %>"/>
							</td>
						</tr>
						<tr id="dataTable07">	
							<td nowrap width="25%" align="center">
								<eibsinput:cnofc property="E01TAXAC7" name="ETX9040Record" flag="04" fn_code="E01TAXAC7" />
								<a href="javascript:GetApplicationCode('E01TAXAC7')">
              					<img src="<%=request.getContextPath()%>/images/1b.gif" title="Código de Aplicación" align="bottom" border="0"></a> 
							</td>
							<td nowrap width="25%" align="center">
								<eibsinput:text name="ETX9040Record" property="E01TAXPR7" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_RATE %>" required="false" readonly="<%=isReadOnly %>"/>
							</td>
							<td nowrap width="25%" align="center">
								<eibsinput:text name="ETX9040Record" property="E01TAXBA7" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_RATE %>" required="false" readonly="<%=isReadOnly %>"/>
							</td>
							<td nowrap width="25%" align="center">
								<eibsinput:help name="ETX9040Record" property="E01TAXGLG" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_GLEDGER%>" required="false" readonly="<%=isReadOnly %>"
               	    			fn_param_one="E01TAXGLG" fn_param_two="<%= ETX9040Record.getE01TAXBNK() %>" fn_param_three="<%= currUser.getE01BCU() %>"/>
							</td>
						</tr>
						<tr id="dataTable08">	
							<td nowrap width="25%" align="center">
								<eibsinput:cnofc property="E01TAXAC8" name="ETX9040Record" flag="04" fn_code="E01TAXAC8" />
								<a href="javascript:GetApplicationCode('E01TAXAC8')">
              					<img src="<%=request.getContextPath()%>/images/1b.gif" title="Código de Aplicación" align="bottom" border="0"></a> 
							</td>
							<td nowrap width="25%" align="center">
								<eibsinput:text name="ETX9040Record" property="E01TAXPR8" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_RATE %>" required="false" readonly="<%=isReadOnly %>"/>
							</td>
							<td nowrap width="25%" align="center">
								<eibsinput:text name="ETX9040Record" property="E01TAXBA8" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" required="false" readonly="<%=isReadOnly %>"/>
							</td>
							<td nowrap width="25%" align="center">
								<eibsinput:help name="ETX9040Record" property="E01TAXGLH" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_GLEDGER%>" required="false" readonly="<%=isReadOnly %>"
               	    			fn_param_one="E01TAXGLH" fn_param_two="<%= ETX9040Record.getE01TAXBNK() %>" fn_param_three="<%= currUser.getE01BCU() %>"/>
							</td>
						</tr>
						<tr id="dataTable09">	
							<td nowrap width="25%" align="center">
								<eibsinput:cnofc property="E01TAXAC9" name="ETX9040Record" flag="04" fn_code="E01TAXAC9" /> 
								<a href="javascript:GetApplicationCode('E01TAXAC9')">
              					<img src="<%=request.getContextPath()%>/images/1b.gif" title="Código de Aplicación" align="bottom" border="0"></a> 
							</td>
							<td nowrap width="25%" align="center">
								<eibsinput:text name="ETX9040Record" property="E01TAXPR9" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_RATE %>" required="false" readonly="<%=isReadOnly %>"/>
							</td>
							<td nowrap width="25%" align="center">
								<eibsinput:text name="ETX9040Record" property="E01TAXBA9" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" required="false" readonly="<%=isReadOnly %>"/>
							</td>
							<td nowrap width="25%" align="center">
								<eibsinput:help name="ETX9040Record" property="E01TAXGLI" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_GLEDGER%>" required="false" readonly="<%=isReadOnly %>"
               	    			fn_param_one="E01TAXGLI" fn_param_two="<%= ETX9040Record.getE01TAXBNK() %>" fn_param_three="<%= currUser.getE01BCU() %>"/>
							</td>
						</tr>
						<tr id="dataTable10">	
							<td nowrap width="25%" align="center">
								<eibsinput:cnofc property="E01TAXAC0" name="ETX9040Record" flag="04" fn_code="E01TAXAC0" />
								<a href="javascript:GetApplicationCode('E01TAXAC0')">
              					<img src="<%=request.getContextPath()%>/images/1b.gif" title="Código de Aplicación" align="bottom" border="0"></a> 
							</td>
							<td nowrap width="25%" align="center">
								<eibsinput:text name="ETX9040Record" property="E01TAXPR0" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_RATE %>" required="false" readonly="<%=isReadOnly %>"/>
							</td>
							<td nowrap width="25%" align="center">
								<eibsinput:text name="ETX9040Record" property="E01TAXBAA" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_RATE %>" required="false" readonly="<%=isReadOnly %>"/>
							</td>
							<td nowrap width="25%" align="center">
								<eibsinput:help name="ETX9040Record" property="E01TAXGLJ" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_GLEDGER%>" required="false" readonly="<%=isReadOnly %>"
               	    			fn_param_one="E01TAXGLJ" fn_param_two="<%= ETX9040Record.getE01TAXBNK() %>" fn_param_three="<%= currUser.getE01BCU() %>"/>
							</td>	
						</tr>	
             		</table>
             		</div>
             		</td>
             	</tr>
			</table>
			<table class="tableinfo" width=100% height=10%">
   			<tr class="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
				<td nowrap width="5%" align="right">Limites Expresados en : </td>
				<td nowrap width="25%" align="left">
					<select name="E01TAXEXL" <%= disabled %>>
						<option <%= ETX9040Record.getE01TAXEXL().trim().equals("A")?"selected":"" %> value="A">MONTO</option>
						<option <%= ETX9040Record.getE01TAXEXL().trim().equals("U")?"selected":"" %> value="U">UVT</option>
					</select>
				</td>
				<td nowrap width="5%" align="right">Impuesto Límite Inferior : </td>
				<td nowrap width="30%" align="left">
					<eibsinput:text name="ETX9040Record" property="E01TAXLLM" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" required="false" readonly="<%=isReadOnly %>"/>
				</td>
				<td nowrap width="5%" align="right">Impuesto Límite Superior : </td>
				<td nowrap width="30%" align="left">
					<eibsinput:text name="ETX9040Record" property="E01TAXUPL" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" required="false" readonly="<%=isReadOnly %>"/>
				</td>
			</tr> 
        	<tr class="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
				<td nowrap width="5%" align="right">Tasa Límite de Control : </td>
				<td nowrap width="25%" align="left">
					<eibsinput:text name="ETX9040Record" property="E01TAXRTL" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_PERCENTAGE %>" required="false" readonly="<%=isReadOnly %>"/>
				</td>
				<td nowrap width="5%" align="right">Código IBS de Transacción : </td>
				<td nowrap width="30%" align="left"> 
					<eibsinput:cnofc name="ETX9040Record" flag="20" property="E01TAXUS1" fn_code="E01TAXUS1" fn_description="D01TAXUS1" required="false" readonly="<%=isReadOnly %>"/>
					<eibsinput:text  name="ETX9040Record" property="D01TAXUS1" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true"/>			
				</td>
				<td nowrap width="5%" align="right"></td>
				<td nowrap width="30%" align="left"> 
				</td>
			</tr>
		</table>
		
		<div id="GMF" style="position:relative; display:none;">
		<table class="tableinfo" width=80% height=10%">       
			<tr class="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
				<td nowrap width="5%" align="right"></td>
				<td nowrap width="25%" align="left">
				</td>
				<td nowrap width="5%" align="right">Límite Acumulado Mes Exención GMF : </td>
				<td nowrap width="30%" align="left">
					<eibsinput:text name="ETX9040Record" property="E01TAXGMA" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" required="false" readonly="<%=isReadOnly %>"/>
				</td>
				<td nowrap width="5%" align="right"></td>
				<td nowrap width="30%" align="left">
				</td>
			</tr>   
		</table>
		</div>
</td> </tr></table>	
    
    <table width="100%">		
		<tr>
			<td width="33%" align="center"> 
				<input id="EIBSBTN" type=button name="Submit" value="Enviar" onClick="goAction(5);" <%= disabled %>>
			</td>
			<td width="33%" align="center"> 
				<input id="EIBSBTN" type=button name="Delete" value="Borrar" onClick="goAction(4);" <%= disabled %>>
			</td>
			<td width="34%" align="center"> 
				<input id="EIBSBTN" type=submit name="Exit" value="Salir" 
				<% if (userPO.getPurpose().equals("NEW") || userPO.getPurpose().equals("MAINTENANCE"))  { %>
			    	onClick="goAction(1);" 
				<% } else { %>
					onClick="goAction(6);" 
				<% } %>>
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
            	<%= ETX9040Record.getE01TAXCUS()%> 
			</td>
            <td nowrap width="15%" align="right">Usuario último Cambio : </td>
            <td nowrap width="35%" align="left">
            	<%= ETX9040Record.getE01TAXLMU()%>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="15%" align="right">Fecha de Proceso - Creación : </td>
			<td nowrap width="35%" align="left"> 
                <%= datapro.eibs.master.Util.formatCustomDate(currUser.getE01DTF(),Integer.parseInt(ETX9040Record.getE01TAXCDM()),Integer.parseInt(ETX9040Record.getE01TAXCDD()),Integer.parseInt(ETX9040Record.getE01TAXCDY()))%>
            </td>
            <td nowrap width="15%" align="right">Fecha de Proceso - Cambio : </td>
			<td nowrap width="35%" align="left">
                <%= datapro.eibs.master.Util.formatCustomDate(currUser.getE01DTF(),Integer.parseInt(ETX9040Record.getE01TAXLMM()),Integer.parseInt(ETX9040Record.getE01TAXLMD()),Integer.parseInt(ETX9040Record.getE01TAXLMY()))%>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="15%" align="right">Fecha / Hora - Creación : </td>
			<td nowrap width="35%" align="left">
				<%= ETX9040Record.getE01TAXCTM()%>
            </td>
            <td nowrap width="15%" align="right">Fecha / Hora - Cambio : </td>
			<td nowrap width="35%" align="left"> 
            	<%= ETX9040Record.getE01TAXLMT()%>
			</td>
          </tr>
        </table> 
      </td>  
    </tr>
  </table>

</form>
</body>

<SCRIPT type="text/javascript">
	chgTipo('<%= ETX9040Record.getE01TAXFL1().trim()%>');
</SCRIPT>


</html>
