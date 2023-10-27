<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>

<%@ page import = "datapro.eibs.master.Util" %>
<%@page import="com.datapro.constants.EibsFields"%>

<html>
<head>
<title>Informacion Basica</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Studio">
<link href="<%=request.getContextPath()%>/pages/style.css" 	rel="stylesheet">

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>

<jsp:useBean id="bankOld" class="datapro.eibs.beans.ESD000502Message" 	scope="session" />
<jsp:useBean id="error" class="datapro.eibs.beans.ELEERRMessage" 	scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" 	scope="session" />
<jsp:useBean id="currUser" class="datapro.eibs.beans.ESS0030DSMessage"  scope="session" />

</head>

<body bgcolor="#FFFFFF">

<%if (!error.getERRNUM().equals("0")) {
	error.setERRNUM("0");
	out.println("<SCRIPT Language=\"Javascript\">");
	out.println("       showErrors()");
	out.println("</SCRIPT>");
	}
 
%>

<h3 align="center">Parametros Generales de Control Mantenimiento<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left"
	name="EIBS_GIF" title="bank_setup_basic_maint, ESD0005"></h3>
<hr size="4">
<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/servlet/datapro.eibs.params.JSESD0005M">
<INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="450"> 

<h4>Informaci&oacute;n Basica</h4>

<%int row = 0; %>
<table class="tableinfo" cellspacing="0" cellpadding="2" width="100%"border="0">


	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td nowrap width="25%">
		<div align="right">Numero del Banco:</div>
		</td>
		<td nowrap width="25%">
		<eibsinput:text name="bankOld" property="E02CNTBNK" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_BANK %>" readonly="true" />
	  </td>
		<td nowrap width="25%">
		<div align="right"></div>
		</td>
        <td nowrap width="25%">
           <p> </p>
        </td> 
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td nowrap width="25%">
		<div align="right">Nombre del Banco:</div>
		</td>
		<td nowrap width="25%">
			<eibsinput:text name="bankOld" property="E02CNTNME" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" />  
	  </td>
		<td nowrap width="25%">
		<div align="right">Multimoneda :</div>
		</td>
        <td nowrap width="25%">
           <p>
           <input type="radio" name="E02CNTMCU" value="Y"
	                 <%if (bankOld.getE02CNTMCU().equals("Y")) 	out.print("checked");%>> Si
           <input type="radio" name="E02CNTMCU" value="N" 
                     <%if (bankOld.getE02CNTMCU().equals("N")) 	out.print("checked");%>> No</p>
        </td> 
	</tr>

	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
	   <td nowrap width="25%">
		<div align="right">Direcci&oacute;n :</div>
		</td>
		<td nowrap width="25%">
		<eibsinput:text name="bankOld" property="E02CNTADR" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" />  
		</td>
		<td nowrap width="25%">
		<div align="right">Entidad Multibanco :</div>
		</td>

        <td nowrap width="25%">
           <p>
           <input type="radio" name="E02CNTMUL" value="Y"
	                              <%if (bankOld.getE02CNTMUL().equals("Y")) 	out.print("checked");%>> Si
           <input type="radio" name="E02CNTMUL" value="N" 
                                  <%if (bankOld.getE02CNTMUL().equals("N")) 	out.print("checked");%>> No</p>
        </td>
	</tr>

	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
	   <td nowrap width="25%">
		</td>
			<td nowrap width="25%">
			<eibsinput:text name="bankOld" property="E02CNTAD2" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" />  
		</td>
		<td nowrap width="25%">
			<div align="right">Entidad Multi-Agencia :</div>
		</td>
        <td nowrap width="25%">
           <p>
           <input type="radio" name="E02CNTMBR" value="Y" <%if (bankOld.getE02CNTMBR().equals("Y")) out.print("checked");%>> Si
           <input type="radio" name="E02CNTMBR" value="N" <%if (bankOld.getE02CNTMBR().equals("N")) out.print("checked");%>> No</p>
        </td>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
	   <td nowrap width="25%">
		</td>
		<td nowrap width="25%">
		 <eibsinput:text name="bankOld" property="E02CNTAD3" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" />  
		</td>

		<td nowrap width="25%">
			<div align="right">Lengua Nativa :</div>
		</td>
        <td nowrap width="25%">
        <select name="E02CNTLAN">
            <option value=" "
	           <% if (!(bankOld.getE02CNTLAN().equals("S")
                    	|| bankOld.getE02CNTLAN().equals("E")))
                	    out.print("selected"); %>>
            </option> 
            <option value="S" <%if (bankOld.getE02CNTLAN().equals("S"))  out.print("selected");%>>Espa&ntilde;ol</option>
		    <option value="E" <%if (bankOld.getE02CNTLAN().equals("E"))  out.print("selected");%>>Ingles</option>
        </select>
         </td>
	</tr>

	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
	    <td nowrap width="25%">
			<div align="right">Pais :</div>
		</td>
		<td nowrap width="25%">
            <eibsinput:cnofc name="bankOld" flag="03" property="E02CNTCTR" fn_description="E02CNTCTD" required="false"/>
            <eibsinput:text	name="bankOld" property="E02CNTCTD" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true"/>
		</td>
		<td nowrap width="25%">
			<div align="right">Telefono :</div>
		</td>
        <td nowrap width="25%">
			<eibsinput:text name="bankOld" property="E02CNTPHN" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_PHONE %>" />  
		</td>
	</tr>

	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td nowrap width="25%">
		<div align="right">Identificaci&oacute;n :</div>
		</td>
		<td nowrap width="25%">
		<eibsinput:text name="bankOld" property="E02CNTBID" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_IDENTIFICATION %>" />
		</td>
		<td nowrap width="25%">
		<div align="right">Facilidades de IBF :</div>
		</td>
        <td nowrap width="25%">
           <p>
           <input type="radio" name="E02CNTIBF" value="Y"  <%if (bankOld.getE02CNTIBF().equals("Y")) 	out.print("checked");%>> Si
           <input type="radio" name="E02CNTIBF" value="N"  <%if (bankOld.getE02CNTIBF().equals("N")) 	out.print("checked");%>> No</p>
        </td>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td nowrap width="25%">
		    <div align="right">Identificaci&oacute;n tributaria:</div>
		</td>
		<td nowrap width="25%">
		<eibsinput:text name="bankOld" property="E02CNTBI2" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_IDENTIFICATION %>" />
		</td>
		<td nowrap width="25%">
		<div align="right">Seguridad IBS activa :</div>
		</td>
        <td nowrap width="25%">
           <p>
           <input type="radio" name="E02CNTSEC" value="Y"   <%if (bankOld.getE02CNTSEC().equals("Y")) 	out.print("checked");%>> Si
           <input type="radio" name="E02CNTSEC" value="N"   <%if (bankOld.getE02CNTSEC().equals("N")) 	out.print("checked");%>> No</p>
        </td>
	</tr>

	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
	    <td nowrap width="25%">
			<div align="right">Direccion Internet :</div>
		</td>
		<td nowrap width="25%">
		<eibsinput:text name="bankOld" property="E02CNTWEB" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_WEB  %>" />  
		</td>
		<td nowrap width="25%">
		    <div align="right">Cierre Año Fiscal :</div>
		</td>
        <td nowrap width="25%">
			Mes &nbsp;<input type="text" name="E02CNTFYM" size="3" maxlength="2" value="<%=bankOld.getE02CNTFYM().trim()%>"  onKeyPress="enterInteger(event)">
		   &nbsp;&nbsp; A&ntilde;o &nbsp;<input type="text" name="E02CNTFYY" size="5" maxlength="4" value="<%=bankOld.getE02CNTFYY().trim()%>"  onKeyPress="enterInteger(event)">
        </td>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
	    <td nowrap width="25%">
			<div align="right">e-mail :</div>
		</td>
		<td nowrap width="25%">
		<eibsinput:text name="bankOld" property="E02CNTEMA" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_EMAIL %>" />  
		</td>
		<td nowrap width="25%">
			<div align="right">Tipo de Fecha :</div>
		</td>
        <td nowrap width="25%">
     	<select name="E02CNTDTF">
     		<option value=" "
				<% if (!(bankOld.getE02CNTDTF().equals("MDY")
                      || bankOld.getE02CNTDTF().equals("DMY")
                  	  || bankOld.getE02CNTDTF().equals("YMD")))
                	out.print("selected"); %>>                	
            </option>
          <option value="MDY" <%if (bankOld.getE02CNTDTF().equals("MDY"))  out.print("selected");%>>MDY=Mes Dia A&ntilde;o</option>
		  <option value="DMY" <%if (bankOld.getE02CNTDTF().equals("DMY"))  out.print("selected");%>>DMY=Dia Mes A&ntilde;o</option>
	      <option value="YMD" <%if (bankOld.getE02CNTDTF().equals("YMD"))  out.print("selected");%>>YMD=A&ntilde;o Mes Dia</option>  
        </select>
        </td>
	</tr>

	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td nowrap width="25%">
 			<div align="right">Nombre Oficial del Banco :</div>
 		</td>
		<td nowrap width="25%">
		<eibsinput:text name="bankOld" property="E02CNTONM" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" />  
		</td>	
		<td nowrap width="25%">
		   <div align="right">Provision Interes 1er Dia :</div>
		</td>
		<td nowrap width="25%">
    	<select name="E02CNTFLA">
			 <option value="F" <%if (bankOld.getE02CNTFLA().equals("F")) out.print("selected");%>>Incluye 1er Dia</option> 
             <option value=" " <%if (bankOld.getE02CNTFLA().equals("") || bankOld.getE02CNTFLA().equals(" ") )  out.print("selected");%>>Incluye Ultimo Dia</option> 	          	
        </select>   			
	    </td>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td nowrap width="25%">
		<div align="right">Acceso a los Clientes :</div>
		</td>
		<td nowrap width="25%">
		  <select name="E02CNTCAT">
		    <option value=" "
	           <% if (!(bankOld.getE02CNTCAT().equals("1")
                    	|| bankOld.getE02CNTCAT().equals("2")))
                	    out.print("selected"); %>>
            </option> 
            <option value="1" <%if (bankOld.getE02CNTCAT().equals("1"))  out.print("selected");%>>Numero del Cliente IBS</option>
		    <option value="2" <%if (bankOld.getE02CNTCAT().equals("2"))  out.print("selected");%>>Numero de Identidad del Cliente</option>		  
		  </select>
		</td>
		<td nowrap width="25%">
		<div align="right">Estructura Contable :</div>
		</td>
		<td nowrap width="25%">
		  <input type="text" name="E02CNTGLL" size="9" maxlength="8" value="<%=bankOld.getE02CNTGLL().trim()%>">
		</td>	
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td nowrap width="25%">
		<div align="right">Respaldo a Utilizar :</div>
		</td>
		<td nowrap width="25%">
		  	<input type="text" name="E02CNTBUM" size="11"  maxlength="10" value="<%=bankOld.getE02CNTBUM().trim()%>">  
		</td>	
	    <td nowrap width="25%">	 
		   <div align="right">Saldo C&aacute;lculo Sobregiro :</div>
		</td>
		<td nowrap width="25%">
		<select name="E02CNTOCT">  
		  <option value=" "
				<% if (!(bankOld.getE02CNTOCT().equals("G")
                	|| bankOld.getE02CNTOCT().equals("N")
                  	|| bankOld.getE02CNTOCT().equals("A")))
                	out.print("selected"); %>>
          </option> 
		  <option value="G" <%if (bankOld.getE02CNTOCT().equals("G"))  out.print("selected");%>>en Libros</option>
		  <option value="N" <%if (bankOld.getE02CNTOCT().equals("N"))  out.print("selected");%>>Disponible</option>
	      <option value="A" <%if (bankOld.getE02CNTOCT().equals("A"))  out.print("selected");%>>A Nivel de Cuenta</option>     
		</select>
		</td>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td nowrap width="25%">
		<div align="right">Microfichas/Reportes :</div>
		</td>
		<td nowrap width="25%">
		<select name="E02CNTMFP">  
		  <option value=" "
				<% if (!(bankOld.getE02CNTMFP().equals("M")
                	|| bankOld.getE02CNTMFP().equals("R")
                	|| bankOld.getE02CNTMFP().equals("B")
                  	|| bankOld.getE02CNTMFP().equals("P")
                  	|| bankOld.getE02CNTMFP().equals("F")
                  	|| bankOld.getE02CNTMFP().equals("N")))
                	out.print("selected"); %>>
          </option> 
		  <option value="M" <%if (bankOld.getE02CNTMFP().equals("M"))  out.print("selected");%>>Salva Microficha</option>
		  <option value="R" <%if (bankOld.getE02CNTMFP().equals("R"))  out.print("selected");%>>Salva Reportes del Cierre</option>
	      <option value="B" <%if (bankOld.getE02CNTMFP().equals("B"))  out.print("selected");%>>Microfichas y Reportes</option>  
	      <option value="P" <%if (bankOld.getE02CNTMFP().equals("P"))  out.print("selected");%>>PDF</option>  
	      <option value="F" <%if (bankOld.getE02CNTMFP().equals("F"))  out.print("selected");%>>PDF and Reports</option>  
          <option value="N" <%if (bankOld.getE02CNTMFP().equals("N"))  out.print("selected");%>>Ninguna</option>  
        </select>
		</td>
		<td nowrap width="25%">	 
		<div align="right">D&iacute;gito Chequeo Cuenta Nueva :</div>
		</td>
		<td nowrap width="25%">
		<select name="E02CNTMOD">
		  <option value=" "
				<% if (!(bankOld.getE02CNTMOD().equals("N")
                      || bankOld.getE02CNTMOD().equals("0")
                  	  || bankOld.getE02CNTMOD().equals("1")))
                	out.print("selected"); %>>
          </option>      	
		  <option value="N" <%if (bankOld.getE02CNTMOD().equals("N"))  out.print("selected");%>>No chequear</option>
		  <option value="0" <%if (bankOld.getE02CNTMOD().equals("0"))  out.print("selected");%>>Modulo-10</option>
	      <option value="1" <%if (bankOld.getE02CNTMOD().equals("1"))  out.print("selected");%>>Modulo-11</option>  
		</select>
		</td>
	</tr>
</table>

<h4>Informaci&oacute;n Adicional</h4>
<table class="tableinfo" cellspacing="0" cellpadding="2" width="100%"border="0">
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td nowrap width="25%">
		<div align="right">Tipos de Estados de Cuenta :</div>
		</td>
		<td nowrap width="25%">
		<select name="E02CNTSTN">
			<option value=" "
				<%if (!(bankOld.getE02CNTSTN().equals("1")
					|| bankOld.getE02CNTSTN().equals("01")	
					|| bankOld.getE02CNTSTN().equals("03")
					|| bankOld.getE02CNTSTN().equals("04")
					|| bankOld.getE02CNTSTN().equals("05")
					|| bankOld.getE02CNTSTN().equals("06")	
					|| bankOld.getE02CNTSTN().equals("07")	
					|| bankOld.getE02CNTSTN().equals("99")))
					out.print("selected");%>>
			</option>
			<option value="01" <%if (bankOld.getE02CNTSTN().equals("01")) out.print("selected");%>>Formato #1 IBS</option>
			<option value="03" <%if (bankOld.getE02CNTSTN().equals("03")) out.print("selected");%>>Formato #3 IBS</option>
			<option value="04" <%if (bankOld.getE02CNTSTN().equals("04")) out.print("selected");%>>Formato #4 IBS</option>
			<option value="05" <%if (bankOld.getE02CNTSTN().equals("05")) out.print("selected");%>>Formato #5 IBS</option>
			<option value="06" <%if (bankOld.getE02CNTSTN().equals("06")) out.print("selected");%>>Formato #6 IBS</option>
    	    <option value="07" <%if (bankOld.getE02CNTSTN().equals("07")) out.print("selected");%>>Consolidados por Laser</option>
		    <option value="99" <%if (bankOld.getE02CNTSTN().equals("99")) out.print("selected");%>>Crea Archivo Estados Ctas</option>
		</select></td>
		<td nowrap width="25%">
		<div align="right">Imprime Correo Retenido :</div>
		</td>
        <td nowrap width="25%">
           <p>
           <input type="radio" name="E02CNTPHS" value="Y" <%if (bankOld.getE02CNTPHS().equals("Y")) 	out.print("checked");%>> Si
           <input type="radio" name="E02CNTPHS" value="N" <%if (bankOld.getE02CNTPHS().equals("N")) 	out.print("checked");%>> No</p>
        </td>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td nowrap width="25%">
		<div align="right">Requiere Cupo Prestamo :</div>
		</td>
		<td nowrap width="25%">
           <p>
           <input type="radio" name="E02CNTCLN" value="Y"
	                 <%if (bankOld.getE02CNTCLN().equals("Y")) 	out.print("checked");%>> Si
           <input type="radio" name="E02CNTCLN" value="N" 
                     <%if (bankOld.getE02CNTCLN().equals("N")) 	out.print("checked");%>> No</p>
		</td>
		<td nowrap width="25%">
		<div align="right">Requiere Cupo Carta/Credito :</div>
		</td>
        <td nowrap width="25%">
           <p>
           <input type="radio" name="E02CNTCLC" value="Y"
	                 <%if (bankOld.getE02CNTCLC().equals("Y")) 	out.print("checked");%>> Si
           <input type="radio" name="E02CNTCLC" value="N" 
                     <%if (bankOld.getE02CNTCLC().equals("N")) 	out.print("checked");%>> No</p>
        </td>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td nowrap width="25%">
		<div align="right">Requiere Cupo Sobregiro :</div>
		</td>
		<td nowrap width="25%">
           <p>
           <input type="radio" name="E02CNTCOD" value="Y"
	                 <%if (bankOld.getE02CNTCOD().equals("Y")) 	out.print("checked");%>> Si
           <input type="radio" name="E02CNTCOD" value="N" 
                     <%if (bankOld.getE02CNTCOD().equals("N")) 	out.print("checked");%>> No</p>
		</td>
		<td nowrap width="25%">
		<div align="right">Apertura/Cierre de Ctas :</div>
		</td>
		<td nowrap width="25%"> 
		  <input type="text" name="E02CNTREA" size="2" maxlength="1" value="<%=bankOld.getE02CNTREA().trim()%>">
		  <A href="javascript:GetCode('E02CNTREA','STATIC_par_cierre_apertura_ctas.jsp')">
          <img src="<%=request.getContextPath()%>/images/1b.gif" title=". . ." align="bottom" border="0"  ></a> 
		</td> 
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td nowrap width="25%">
		<div align="right">M&aacute;ximo de Dias Fecha Valor :</div>
		</td>
		<td nowrap width="25%">
		    <input type="text" name="E02CNTMDB" size="4" maxlength="3" value="<%=bankOld.getE02CNTMDB().trim()%>">
		</td>
		<td nowrap  width="25%">
		<div align="right">M&aacute;ximo Dias Fecha Futura :</div>
		</td>
		<td nowrap  width="25%">
		     <input type="text" name="E02CNTMDF" size="4" maxlength="3" value="<%=bankOld.getE02CNTMDF().trim()%>">  
		</td>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td nowrap width="25%">
		<div align="right">Duplicacion en Libros :</div>
		</td>
		<td nowrap width="25%">
		   <INPUT type="text" name="E02CNTTDB" size="2" maxlength="1" value="<%= bankOld.getE02CNTTDB().trim()%>">
		   <A href="javascript:GetCode('E02CNTTDB','STATIC_par_dupl_book.jsp')">
		   <img src="<%=request.getContextPath()%>/images/1b.gif" title=". . ." align="bottom" border="0"  ></a> 				 
	    </td>
		<td nowrap  width="25%">
		<div align="right">Codigo Pais Instituci&oacute;n :</div>
		</td>
		<td nowrap  width="25%">
		   <input type="text" name="E02CNTINT" size="3" maxlength="2" 	value="<%= bankOld.getE02CNTINT().trim()%>">	    
          <A href="javascript:GetCode('E02CNTINT','STATIC_par_country.jsp')">
          <img src="<%=request.getContextPath()%>/images/1b.gif" title=". . ." align="bottom" border="0"  ></a> 				 
        </td>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td nowrap width="25%">
		<div align="right">Generar Numero Automatico</div>
		</td>
		<td nowrap width="25%">
		   <INPUT type="text" name="E02CNTANG" size="2" maxlength="1" value="<%= bankOld.getE02CNTANG().trim()%>">
		   <A href="javascript:GetCode('E02CNTANG','STATIC_par_gen_num.jsp')"><img src="<%=request.getContextPath()%>/images/1b.gif" title=". . ." align="bottom" border="0"  ></a> 		
		</td>
	    <td nowrap width="25%">
		<div align="right">M&oacute;dulo Desglose :</div>
		</td>
	    <td nowrap width="25%">
		<select name="E02CNTTLM">
			<option value=" "
				<%if (!(bankOld.getE02CNTTLM().equals("1")
	                 || bankOld.getE02CNTTLM().equals("2")	 
	                 || bankOld.getE02CNTTLM().equals("3")))
	              out.print("selected");%>>
			</option>
			<option value="1" <%if (bankOld.getE02CNTTLM().equals("1")) out.print("selected");%>>Diferidos del Deposito</option>
			<option value="2" <%if (bankOld.getE02CNTTLM().equals("2")) out.print("selected");%>>Desglose IBS Nativo</option>
			<option value="3" <%if (bankOld.getE02CNTTLM().equals("3")) out.print("selected");%>>Desglose IBSBRANCH</option> 
		</select>
	    </td>	
	</tr>

	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td nowrap width="25%">
		<div align="right">Aprobaci&oacute;n Cheques de Caja :</div>
		</td>
        <td nowrap width="25%">
           <p>
           <input type="radio" name="E02CNTFL1" value="1"
	                <%if (bankOld.getE02CNTFL1().equals("1")) 	out.print("checked");%>> Si
           <input type="radio" name="E02CNTFL1" value="0" 
                    <%if (bankOld.getE02CNTFL1().equals("0")) 	out.print("checked");%>> No</p>
        </td>
	    <td nowrap width="25%">
		<div align="right">P/Renovaci&oacute;n Prox D&iacute;a :</div>
		</td>
		<td nowrap width="25%"> 	
    		 <INPUT type="text" name="E02CNTGLR" size="2" maxlength="1" value="<%= bankOld.getE02CNTGLR().trim()%>" onKeyPress="enterInteger(event)">    
    		 <A href="javascript:GetCode('E02CNTGLR','STATIC_ren_pay_day.jsp')">
    		 <img src="<%=request.getContextPath()%>/images/1b.gif" title=". . ." align="bottom" border="0"  ></a>			
	    </td>        

	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td nowrap width="25%">
		<div align="right">Forma Contble Descuentos :</div>
		</td>
		<td nowrap width="25%"> 
			<INPUT type="text" name="E02CNTDTP" size="2" maxlength="1" value="<%= bankOld.getE02CNTDTP().trim()%>">
		    <A href="javascript:GetCode('E02CNTDTP','STATIC_par_contb_desc.jsp')"><img src="<%=request.getContextPath()%>/images/1b.gif" title=". . ." align="bottom" border="0"  ></a>			
	    </td>
	    <td nowrap width="25%">
		<div align="right">Dias de Gracia Renovaci&oacute;n :</div>
		</td>
		<td nowrap width="25%"><input type="text" name="E02CNTDEM" size="3" maxlength="2" value="<%=bankOld.getE02CNTDEM().trim()%>"  onKeyPress="enterInteger(event)">			
		</td>	
	</tr>
   <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
   	    <td nowrap width="25%">
		<div align="right"> Contabilizar Garantias :</div>
		</td>
		<td nowrap width="25%">
		<select name="E02CNTCOT">  
		  <option value=" "
				<% if (!(bankOld.getE02CNTCOT().equals("1") 
                      || bankOld.getE02CNTCOT().equals("2")))
                	out.print("selected"); %>>
          </option> 
		  <option value="1" <%if (bankOld.getE02CNTCOT().equals("1"))  out.print("selected");%>>Usando Saldo Disponible</option>
		  <option value="2" <%if (bankOld.getE02CNTCOT().equals("2"))  out.print("selected");%>>Usando Valor Elegible</option> 
        </select> 
		</td>
		<td nowrap  width="25%">
		<div align="right">Lista de Control :</div>
		</td>
		<td nowrap  width="25%">
			<select name="E02CNTFL2">
			<option value=" "
				<%if (!(bankOld.getE02CNTFL2().equals("1")
	                 || bankOld.getE02CNTFL2().equals("2")	
	                 || bankOld.getE02CNTFL2().equals("3") 
	                 || bankOld.getE02CNTFL2().equals("N")))
	              out.print("selected");%>>
			</option>
			<option value="1" <%if (bankOld.getE02CNTFL2().equals("1")) out.print("selected");%>>IBS - Proveedor Externo</option>
			<option value="2" <%if (bankOld.getE02CNTFL2().equals("2")) out.print("selected");%>>IBS - Lista Interna</option>
			<option value="3" <%if (bankOld.getE02CNTFL2().equals("3")) out.print("selected");%>>Servicio Externo</option>
			<option value="N" <%if (bankOld.getE02CNTFL2().equals("N")) out.print("selected");%>>Ninguno</option>
			</select>
        </td>
   </tr>		
   	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td nowrap width="25%">
		    <div align="right">Generar Facturaci&oacute;n :</div>
		</td>
		<td nowrap width="25%">
		   <input type="text" name="E02CNTFL3" size="2" maxlength="1" 	value="<%= bankOld.getE02CNTFL3().trim()%>">	    
          <A href="javascript:GetCode('E02CNTFL3','STATIC_par_gen_fact.jsp')">
          <img src="<%=request.getContextPath()%>/images/1b.gif" title=". . ." align="bottom" border="0"  ></a> 			
		</td>
		<td nowrap  width="25%">	
		  <div align="right">Rentabilidad de Clientes :</div>	
		</td>
		<td nowrap  width="25%">	
		   <input type="text" name="E02CNTCPF" size="2" maxlength="1" 	value="<%= bankOld.getE02CNTCPF().trim()%>">	    
          <A href="javascript:GetCode('E02CNTCPF','STATIC_par_prof_client.jsp')">
          <img src="<%=request.getContextPath()%>/images/1b.gif" title=". . ." align="bottom" border="0"  ></a>		
		</td>
   </tr>		
   	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td nowrap width="25%">
		    <div align="right">Control Papel Valor :</div>
		</td>
		<td nowrap width="25%">
			<div align="left">
				<SELECT name="E02CNTWF1">
					<OPTION value="0"  <%if(bankOld.getE02CNTWF1().trim().equals("0")){%> Selected <%}%>>No Controla</OPTION>
					<OPTION value="1" <%if(bankOld.getE02CNTWF1().trim().equals("1")){%> Selected <%}%>>Por Oficina</OPTION>
					<OPTION value="2" <%if(bankOld.getE02CNTWF1().trim().equals("2")){%> Selected <%}%>>Por Usuario</OPTION>
				</SELECT>
			</div>
		</td>		
		<td nowrap  width="25%">	
		  <div align="right">Oficina Central :</div>	
		</td>
		<td nowrap  width="25%">	
			<INPUT type="text" name="E02CNTMNB" size="5" maxlength="4" value="<%= bankOld.getE02CNTMNB().trim()%>">		
	    </td>
		
		
		
		
		</td>
   	</tr>		
</table>

 


	 

<div align="center"><input id="EIBSBTN" type=submit name="Submit" value="Enviar"></div>

</form>
</body>
</html>

