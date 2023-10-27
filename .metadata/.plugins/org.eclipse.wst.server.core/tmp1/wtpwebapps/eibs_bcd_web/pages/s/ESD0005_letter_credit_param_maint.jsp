<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>Mantenimiento de Par�metros de Cartas de Cr�dito</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Studio">
<link href="<%=request.getContextPath()%>/pages/style.css"	rel="stylesheet">

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>
                                                  
<jsp:useBean id="bankOld" class="datapro.eibs.beans.ESD000505Message" 	scope="session" />
<jsp:useBean id="error" class="datapro.eibs.beans.ELEERRMessage" 	scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" 	scope="session" />
<jsp:useBean id="currUser" class="datapro.eibs.beans.ESS0030DSMessage"	scope="session" />

</head>

<body bgcolor="#FFFFFF">

<%if (!error.getERRNUM().equals("0")) {
	error.setERRNUM("0");
	out.println("<SCRIPT Language=\"Javascript\">");
	out.println("       showErrors()");
	out.println("</SCRIPT>");
	}
 
%>

<h3 align="center">Mantenimiento de Par�metros de Cartas de Cr�dito y Cobranzas<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" 
name="EIBS_GIF" title="letter_credit_param_maint, ESD0005"></h3>
<hr size="4">
<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/servlet/datapro.eibs.params.JSESD0005A">
<INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="600"> 
 
  <table class="tableinfo" >
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
          <tr id="trdark"> 
            <td nowrap width="25%" > 
              <div align="right"><b>Banco : </b></div>
            </td>
            <td nowrap width="25%" > 
              <div align="left">
					<input type="text" name="E05LCPBNK" size="3" readonly maxlength="2" value="<%=bankOld.getE05LCPBNK().trim()%>">
					</div></td>
            <td nowrap width="25%" > 
              <div align="right"><b>Nombre :</b> </div>
            </td>
            <td nowrap colspan="3" > 
              <div align="left">
                <input type="text" name="E05LCPNME" size="36" readonly maxlength="35" value="<%=bankOld.getE05LCPNME().trim()%>">
              </div>
            </td>
          </tr>
         </table>
      </td>
    </tr>
  </table>

<h4>Par�metros de Cartas de Cr�dito</h4>

<%int row = 0; %>
<table class="tableinfo" cellspacing="0" cellpadding="2" width="100%"border="0">
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td nowrap width="25%">
		<div align="right">Cta Contable CR Cesiones/Asignaciones :</div>
		</td>
		<td nowrap width="25%">
			<input type="text" name="E05LCPOCA" size="18" maxlength="16" value="<%=bankOld.getE05LCPOCA().trim()%>" onKeyPress="enterInteger(event)">
			<a href="javascript:GetLedger('E05LCPOCA',document.forms[0].E05LCPBNK.value,'','')">
			<img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" border="0" ></a> 
	   </td>
	    <td nowrap width="25%">
		   <div align="right">No.de D�as p/Canc.C/Cr�dito :</div>
		</td>
		<td nowrap width="25%">
		   <input type="text" name="E05LCPLCD" size="4" maxlength="3" value="<%=bankOld.getE05LCPLCD().trim()%>" onKeyPress="enterInteger(event)">  
		</td>  
	</tr>	
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td nowrap width="25%">
		<div align="right">Com/Apertura Fecha Emisi�n :</div>
		</td>
		<td nowrap width="25%">
           <p>
           <input type="radio" name="E05LCPISC" value="Y"  <%if (bankOld.getE05LCPISC().equals("Y")) 	out.print("checked");%>> S�
           <input type="radio" name="E05LCPISC" value="N"  <%if (bankOld.getE05LCPISC().equals("N")) 	out.print("checked");%>> No</p>
	   </td>
	    <td nowrap width="25%">
		   <div align="right">Com/Confirm.Fecha Emisi�n :</div>
		</td>
		<td nowrap width="25%">
           <p>
           <input type="radio" name="E05LCPCAC" value="Y"  <%if (bankOld.getE05LCPCAC().equals("Y")) 	out.print("checked");%>> S�
           <input type="radio" name="E05LCPCAC" value="N"  <%if (bankOld.getE05LCPCAC().equals("N")) 	out.print("checked");%>> No</p>
		</td>  
	</tr>	
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td nowrap width="25%">
		<div align="right">Com/Enmienda Fecha Emisi�n :</div>
		</td>
		<td nowrap width="25%">
           <p>
           <input type="radio" name="E05LCPAMC" value="Y"  <%if (bankOld.getE05LCPAMC().equals("Y")) 	out.print("checked");%>> S�
           <input type="radio" name="E05LCPAMC" value="N"  <%if (bankOld.getE05LCPAMC().equals("N")) 	out.print("checked");%>> No</p>			
	   </td>
	    <td nowrap width="25%">
		   <div align="right">Com/Apertura Ctas.x Cobrar :</div>
		</td>
		<td nowrap width="25%"> 
           <p>
           <input type="radio" name="E05LCPCRC" value="Y"  <%if (bankOld.getE05LCPCRC().equals("Y")) 	out.print("checked");%>> S�
           <input type="radio" name="E05LCPCRC" value="N"  <%if (bankOld.getE05LCPCRC().equals("N")) 	out.print("checked");%>> No</p>			
		</td>  
	</tr>		
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td nowrap width="25%">
		<div align="right">Com/Swift en Negociaci�n :</div>
		</td>
		<td nowrap width="25%">
           <p>
           <input type="radio" name="E05LCPWCL" value="Y"  <%if (bankOld.getE05LCPWCL().equals("Y")) 	out.print("checked");%>> S�
           <input type="radio" name="E05LCPWCL" value="N"  <%if (bankOld.getE05LCPWCL().equals("N")) 	out.print("checked");%>> No</p>			
	   </td>
	    <td nowrap width="25%">
		   <div align="right">Periodificaci�n Intereses C/Cr�dito :</div>
		</td>
		<td nowrap width="25%">
           <p>
           <input type="radio" name="E05LCPACL" value="Y"  <%if (bankOld.getE05LCPACL().equals("Y")) 	out.print("checked");%>> S�
           <input type="radio" name="E05LCPACL" value="N"  <%if (bankOld.getE05LCPACL().equals("N")) 	out.print("checked");%>> No</p>					   
		</td>  
	</tr>	
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td nowrap width="25%">
		<div align="right">Porcentaje de Aproximaci�n :</div>
		</td>
		<td nowrap width="25%">
			<input type="text" name="E05LCPACP" size="3" maxlength="2" value="<%=bankOld.getE05LCPACP().trim()%>" onKeyPress="enterInteger(event)">
	   </td>
	    <td nowrap width="25%">
		   <div align="right">Seguridad Clave Usuario? :</div>
		</td>
		<td nowrap width="25%">
           <p>
           <input type="radio" name="E05LCPLSA" value="Y"  <%if (bankOld.getE05LCPLSA().equals("Y")) 	out.print("checked");%>> S�
           <input type="radio" name="E05LCPLSA" value="N"  <%if (bankOld.getE05LCPLSA().equals("N")) 	out.print("checked");%>> No</p>					   		    
		</td>  
	</tr>		
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td nowrap width="25%">
		<div align="right">Cta Contable C/C Recibidas V�a Swift :</div>
		</td>
		<td nowrap width="25%">
			<input type="text" name="E05LCPISD" size="18" maxlength="16" value="<%=bankOld.getE05LCPISD().trim()%>" onKeyPress="enterInteger(event)">
			<a href="javascript:GetLedger('E05LCPISD',document.forms[0].E05LCPBNK.value,'','')">
			<img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" border="0" ></a> 
	   </td>
	    <td nowrap width="25%">
		   <div align="right">Cta Puente Aprobaci�n Ptmos. :</div>
		</td>
		<td nowrap width="25%">
		   <input type="text" name="E05LCPBRA" size="18" maxlength="16" value="<%=bankOld.getE05LCPBRA().trim()%>" onKeyPress="enterInteger(event)">  
		   <a href="javascript:GetLedger('E05LCPBRA',document.forms[0].E05LCPBNK.value,'','')">
		   <img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" border="0" ></a> 
		</td>  
	</tr>		
</table>

<h4>Par�metros de Cobranzas</h4>
<table class="tableinfo" cellspacing="0" cellpadding="2" width="100%"border="0">	
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td nowrap width="25%">
		<div align="right">C�digo del Pa�s :</div></td>

		<td nowrap width="25%">
		    <input type="text" name="E05LCPDCT" size="3" maxlength="2" value="<%=bankOld.getE05LCPDCT().trim()%>">
	   		<A href="javascript:GetCodeCNOFC('E05LCPDCT','03')">
	   		<IMG src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" border="0"></a>
	    </td>
	    <td nowrap width="25%">
		   <div align="right">No M�ximo de Avisos :</div>
		</td>
		<td nowrap width="25%">
		   <input type="text" name="E05LCPMXT" size="3" maxlength="2" value="<%=bankOld.getE05LCPMXT().trim()%>" onKeyPress="enterInteger(event)">  
		</td>  
	</tr>		
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td nowrap width="25%">
		<div align="right">D�as Primer Aviso Cob/Dom :</div>
		</td>
		<td nowrap width="25%">
			<input type="text" name="E05LCPDD1" size="3" maxlength="2" value="<%=bankOld.getE05LCPDD1().trim()%>" onKeyPress="enterInteger(event)">
	   </td>
	    <td nowrap width="25%">
		   <div align="right">D�as Primer Aviso Cob/Exterior :</div>
		</td>
		<td nowrap width="25%">
		   <input type="text" name="E05LCPFD1" size="3" maxlength="2" value="<%=bankOld.getE05LCPFD1().trim()%>" onKeyPress="enterInteger(event)">  
		</td>  
	</tr>	
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td nowrap width="25%">
		<div align="right">D�as Segundo Aviso Cob/Dom :</div>
		</td>
		<td nowrap width="25%">
			<input type="text" name="E05LCPDD2" size="3" maxlength="2" value="<%=bankOld.getE05LCPDD2().trim()%>" onKeyPress="enterInteger(event)">
	   </td>
	    <td nowrap width="25%">
		   <div align="right">D�as Segundo Aviso Cob/Exterior :</div>
		</td>
		<td nowrap width="25%">
		   <input type="text" name="E05LCPFD2" size="3" maxlength="2" value="<%=bankOld.getE05LCPFD2().trim()%>" onKeyPress="enterInteger(event)">  
		</td>  
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td nowrap width="25%">
		<div align="right">D�as Avisos Adic. Cob/Dom :</div>
		</td>
		<td nowrap width="25%">
			<input type="text" name="E05LCPDD3" size="3" maxlength="2" value="<%=bankOld.getE05LCPDD3().trim()%>" onKeyPress="enterInteger(event)">
	   </td>
	    <td nowrap width="25%">
		   <div align="right">D�as Avisos Adic. Cob/Exterior :</div>
		</td>
		<td nowrap width="25%">
		   <input type="text" name="E05LCPFD3" size="3" maxlength="2" value="<%=bankOld.getE05LCPFD3().trim()%>" onKeyPress="enterInteger(event)">  
		</td>  
	</tr>
</table>

<h4>Par�metros de Control Especiales</h4>
<table class="tableinfo" cellspacing="0" cellpadding="2" width="100%"border="0">
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td nowrap width="25%">
			<div align="right">Comisi�n de Negociaci�n :</div>
		</td>
		<td nowrap width="25%">
		  <input type="text" name="E05LCPP01" size="2" maxlength="1" value="<%=bankOld.getE05LCPP01().trim()%>">
		  <A href="javascript:GetCode('E05LCPP01','STATIC_par_special_control_1.jsp')">
          <img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" border="0"  ></a> 
	   </td>
	    <td nowrap width="25%">
		   <div align="right">Doble Asiento Contable de Aceptaciones Descontadas :</div>
		</td>
		<td nowrap width="25%">
		  <input type="text" name="E05LCPP02" size="2" maxlength="1" value="<%=bankOld.getE05LCPP02().trim()%>">
		  <A href="javascript:GetCode('E05LCPP02','STATIC_par_special_control_2.jsp')">
          <img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" border="0"  ></a> 		   
		</td>	   
	</tr>		           
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td nowrap width="25%">
			<div align="right">C�lculo de Comisi�n de Aceptaci�n :</div>
		</td>
		<td nowrap width="25%">
		  <input type="text" name="E05LCPP03" size="2" maxlength="1" value="<%=bankOld.getE05LCPP03().trim()%>">
		  <A href="javascript:GetCode('E05LCPP03','STATIC_par_special_control_3.jsp')">
          <img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" border="0"  ></a> 
	   </td>
	    <td nowrap width="25%">
		   <div align="right">Comisi�n por Extensi�n de Validez :</div>
		</td>
		<td nowrap width="25%">
		  <input type="text" name="E05LCPP04" size="2" maxlength="1" value="<%=bankOld.getE05LCPP04().trim()%>">
		  <A href="javascript:GetCode('E05LCPP04','STATIC_par_special_control_4.jsp')">
          <img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" border="0"  ></a> 		   
		</td>	   
	</tr>	    
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td nowrap width="25%">
			<div align="right">Comisi�n de Aviso para Cartas de Cr�dito Confirmadas :</div>
		</td>
		<td nowrap width="25%">
		  <input type="text" name="E05LCPP05" size="2" maxlength="1" value="<%=bankOld.getE05LCPP05().trim()%>">
		  <A href="javascript:GetCode('E05LCPP05','STATIC_par_special_control_5.jsp')">
          <img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" border="0"  ></a> 
	   </td>
	    <td nowrap width="25%">
		   <div align="right">Tablas de Cargos para Bancos Corresponsales :</div>
		</td>
		<td nowrap width="25%">
		  <input type="text" name="E05LCPP06" size="2" maxlength="1" value="<%=bankOld.getE05LCPP06().trim()%>">
		  <A href="javascript:GetCode('E05LCPP06','STATIC_par_special_control_6.jsp')">
          <img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" border="0"  ></a> 		   
		</td>	   
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td nowrap width="25%">
			<div align="right">C�lculo de la Comisi�n por Incremento de Valor :</div>
		</td>
		<td nowrap width="25%">
		  <input type="text" name="E05LCPP07" size="2" maxlength="1" value="<%=bankOld.getE05LCPP07().trim()%>">
		  <A href="javascript:GetCode('E05LCPP07','STATIC_par_special_control_7.jsp')">
          <img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" border="0"  ></a> 		   
	   </td>
	    <td nowrap width="25%">
		   <div align="right">Ciclos de Pago de Comisiones de Cartas de Cr�dito Standby :</div>
		</td>
		<td nowrap width="25%">
		  <input type="text" name="E05LCPP08" size="2" maxlength="1" value="<%=bankOld.getE05LCPP08().trim()%>">
		  <A href="javascript:GetCode('E05LCPP08','STATIC_par_special_control_8.jsp')">
          <img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" border="0"  ></a> 
		</td>	   
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td nowrap width="25%">
			<div align="right">D�bito(s) por las Comisiones de Apertura :</div>
		</td>
		<td nowrap width="25%">
		  <input type="text" name="E05LCPP09" size="2" maxlength="1" value="<%=bankOld.getE05LCPP09().trim()%>">
		  <A href="javascript:GetCode('E05LCPP09','STATIC_par_special_control_9.jsp')">
          <img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" border="0"  ></a> 		   
	   </td>
	    <td nowrap width="25%">
		   <div align="right">Tipos de Producto a Devengar Intereses :</div>
		</td>
		<td nowrap width="25%">
		  <input type="text" name="E05LCPP10" size="2" maxlength="1" value="<%=bankOld.getE05LCPP10().trim()%>">
		  <A href="javascript:GetCode('E05LCPP10','STATIC_par_special_control_10.jsp')">
          <img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" border="0"  ></a> 		   
		</td>	   
	</tr>	
</table>

<div align="center"><input id="EIBSBTN" type=submit name="Submit" value="Enviar"></div>

</form>
</body>
</html>

