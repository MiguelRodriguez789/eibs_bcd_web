<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@ page import="datapro.eibs.master.Util" %>
<%@ page import="com.datapro.constants.EibsFields" %>

<html>
<head>
<title>Boleta de Garantia</title>
<META http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "bolgaran" class= "datapro.eibs.beans.ELC500001Message"  scope="session" /> 
<jsp:useBean id= "garantizaBean" class= "datapro.eibs.beans.ELC500006Message"  scope="session" />
<jsp:useBean id= "planDis" class= "datapro.eibs.beans.ELC500005Message"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />

<SCRIPT SRC="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<SCRIPT SRC="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>

<SCRIPT type="text/javascript">
  <%if (userPO.getPurpose().equals("MAINTENANCE")){%>

   builtNewMenu(bg_m_opt);
   initMenu();
   			
  <%}%>
  
   function enviar(n){
		f=document.forms[0];
		f.elements["E01LCMFCO"].value = f.elements["E01LCMFCO2"].value;
   		document.forms[0].SCREEN.value = n;
   		document.forms[0].submit();
   }
   
	function frecDis(n){
		if(n){
			document.forms[0].elements["E01LCMFCO2"].disabled = true;
			document.forms[0].elements["E01LCMFCO2"].selectedIndex = 0;
			document.forms[0].elements["E01LCMFCO2"].value = 0;
		}else{
			document.forms[0].elements["E01LCMFCO2"].disabled = false;
		}
	}

	function renAuto(n){
		if(n){
			document.forms[0].elements["E01LCMRDY"].disabled = true;
			document.forms[0].elements["E01LCMFL1"].disabled = true;
			document.forms[0].elements["E01LCMRDY"].value = "";
			document.forms[0].elements["E01LCMFL1"].selectedIndex = 0;
		}else{
			document.forms[0].elements["E01LCMRDY"].disabled = false;
			document.forms[0].elements["E01LCMFL1"].disabled = false;
		}
	}

	function planDisminDis(n){
		if(n){
			document.forms[0].elements["actualizar"].disabled = false;
		}else{
			document.forms[0].elements["actualizar"].disabled = true;
		}
	}
		
	function cuenta(){
		field = document.forms[0].elements["E06SPIM01"];
		//count = 3000;
		max   = 3000;
		if (field.value.length > max) field.value = field.value.substring(0, max);
		/*else
			count.value = max - field.value.length;*/
//		document.forms[0].caracteres.value=document.forms[0].texto.value.length
	}

	</script>

</head>
<body>

<% 
 if ( !error.getERRNUM().equals("0")  ) {
     error.setERRNUM("0");
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
 }    
 %> 

<h3 align="center">Boleta de Garantia<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="bg_basic.jsp,ELC5000"></h3>
<hr size="4">

<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/servlet/datapro.eibs.bolgaran.JSELC5000">

  <input type="hidden" name="SCREEN" value="5"> 
  <input type="hidden" name="E01LCMACC" value="<%=bolgaran.getE01LCMACC()%>">
  <% 
  	String fPlanDis = request.getParameter("flagPlanDis");
	if(userPO.getPurpose().equals("MAINTENANCE") && planDis!=null){
		if(planDis.getE05L01EXA().equals("0") && 
		   planDis.getE05L01EXM().equals("0") && 
		   planDis.getE05L01EXD().equals("0") && 
		   planDis.getE05L01DIS().equals("0") ){
		   	fPlanDis = "0";
		}else{
			fPlanDis = "1";
		}
	}
  
  %>
  
  
  <input type="hidden" name="flagPlanDis" value="<%= (fPlanDis==null?"0":fPlanDis) %>">
  <!--input type="hidden" name="E01LCMBNK" value="<%=bolgaran.getE01LCMBNK()%>"-->      
  <table class=tableinfo>
  <tr>
   <td>
  <table width="100%" border="0" cellspacing="0" cellpadding="0">
    <tr id=trdark>
 	     <td align=right width="15%">Boleta :</td>
	     <td width="35%">
	      <input size="15" type="text" name="LCMACC" value="<% if(userPO.getPurpose().equals("MAINTENANCE")) {out.print(bolgaran.getE01LCMACC().trim());} else { 
					if (bolgaran.getE01LCMACC().trim().equals("999999999999")) out.print("NUEVA CUENTA"); else out.print(bolgaran.getE01LCMACC().trim());} %>" readonly>	     
	     </td>
		<%if(userPO.getPurpose().equals("MAINTENANCE")){	%>
          <%String cambio="";
            if(!bolgaran.getH01FLGMAS().trim().equals("N"))
          		cambio = "readonly";
          %>
            <td align=right width="15%">
              <div align="right">Banco/Sucursal :</div>
            </td>
            <td width="35%">
              <input  <%=cambio%> type="text" size="2" maxlength="2" value="<%= bolgaran.getE01LCMBNK().trim()%>" name="E01LCMBNK">
              <input <%=cambio%> type="text" name="E01LCMBRN" size="5" maxlength="4" value="<%= bolgaran.getE01LCMBRN().trim()%>">
          <%
            if(bolgaran.getH01FLGMAS().trim().equals("N")){
          %>
              
              <a href="javascript:GetBranch('E01LCMBRN','')"><img src="<%=request.getContextPath()%>/images/1b.gif" title=". . ." border="0"  ></a>
          <%
            }
          %>
              <img src="<%=request.getContextPath()%>/images/Check.gif" title="mandatory field" border="0" >
            </td>
			<%
            }else{
            %>
            <td width="15%" >
              <div align="right">Banco/Sucursal :</div>
            </td>
            <td width="35%" >
              <input type="text" size="2" maxlength="2" value="<%= bolgaran.getE01LCMBNK().trim()%>" name="E01LCMBNK">
              <input type="text" name="E01LCMBRN" size="5" maxlength="4" value="<%= bolgaran.getE01LCMBRN().trim()%>">
              <a href="javascript:GetBranch('E01LCMBRN','')"><img src="<%=request.getContextPath()%>/images/1b.gif" title=". . ." border="0"  ></a>
              <img src="<%=request.getContextPath()%>/images/Check.gif" title="mandatory field" border="0" >
            </td>
		 <%} %>
	</tr>
    <tr id=trclear>
         <td align=right width="15%">Producto :</td>
         <td width="35%">
         	<input size="5" type="text" name="E01LCMPRO" readonly value="<%= bolgaran.getE01LCMPRO()%>">
            <input size="40" type="text" name="E01PRDNME" readonly value="<%= bolgaran.getE01PRDNME()%>">
         </td>
         <td align=right width="15%">Moneda :</td>
         <td width="35%"><input size="5" type="text" name="E01LCMCCY" readonly value="<%= bolgaran.getE01LCMCCY()%>"></td>
    </tr>
  
  <% if (userPO.getPurpose().trim().equals("MAINTENANCE") && !bolgaran.getH01FLGMAS().trim().equals("N")) { %>

    	<tr id=trdark>
	      <td align=right width="15%">Fecha Emisión :</td>
	      <td width="35%">
	          <eibsinput:date name="bolgaran" fn_year="E01LCMIDY" fn_month="E01LCMIDM" fn_day="E01LCMIDD"  readonly="True"/>
		  </td>
	      <td align=right width="15%">Fecha Valor :</td>
          <td width="35%">	
              <eibsinput:date name="bolgaran" fn_year="E01FECVAY" fn_month="E01FECVAM" fn_day="E01FECVAD"  readonly="True"/>
          </td>
    	</tr>    
        <tr id=trclear >
         <td align=right width="15%">Plazo en D&iacute;as :</td>
         <td width="35%" >
             <input size="5" type="text" name="E01TRMNUM" maxlength="4" value="<%=bolgaran.getE01TRMNUM()%>" readonly>
         <SELECT name="E01TRMFLG" disabled>
 		         <OPTION value="" selected></OPTION>
				<OPTION value="S" <%= bolgaran.getE01TRMFLG().equals("S")?"selected":"" %>>Dias Calendario</OPTION>
				<OPTION value="W" <%= bolgaran.getE01TRMFLG().equals("W")?"selected":"" %>>Dias Habiles</OPTION>
				</SELECT></td>
         <td align=right width="15%">Fecha Vencimiento :</td>
         <td nowrap>
             <eibsinput:date name="bolgaran" fn_year="E01LCMEXY" fn_month="E01LCMEXM" fn_day="E01LCMEXD" readonly="true"/>
 				     	
         </td>
        </tr>
   <% } else { %>

	    <tr id=trdark>
	      <td align=right width="15%">Fecha Emisión :</td>
	      <td width="35%">
	          <eibsinput:date name="bolgaran" fn_year="E01LCMIDY" fn_month="E01LCMIDM" fn_day="E01LCMIDD" />
		  </td>
	      <td align=right width="15%">Fecha Valor :</td>
          <td width="35%">	
              <eibsinput:date name="bolgaran" fn_year="E01FECVAY" fn_month="E01FECVAM" fn_day="E01FECVAD" />
          </td>
    	</tr>    

        <tr id=trclear >
         <td align=right width="15%">Plazo en D&iacute;as :</td>
         <td width="35%" >
             <input size="5" type="text" name="E01TRMNUM" maxlength="4" value="<%=bolgaran.getE01TRMNUM()%>">
         <SELECT name="E01TRMFLG">
 		         <OPTION value="" selected></OPTION>
				<OPTION value="S" <%= bolgaran.getE01TRMFLG().equals("S")?"selected":"" %>>Dias Calendario</OPTION>
				<OPTION value="W" <%= bolgaran.getE01TRMFLG().equals("W")?"selected":"" %>>Dias Habiles</OPTION>
				</SELECT></td>
         <td align=right width="15%">Fecha Vencimiento :</td>
         <td nowrap>
             <eibsinput:date name="bolgaran" fn_year="E01LCMEXY" fn_month="E01LCMEXM" fn_day="E01LCMEXD" />
 				     	
         </td>
        </tr>
   
   <% } %>     
    
  </table>
  </td>
  </tr>
 </table>
  <h4>Por Orden</h4>
 <table class=tableinfo>
  <tr>
  <td> 
  <table width="100%" border="0" cellspacing="0" cellpadding="0">
    <tr id=trdark>
        <td align=right width="15%">N&uacute;mero :</td>
        <td width="35%"> 
    		<input size="15" type="text" name="E01LCMCUN" maxlength="10" value="<%=bolgaran.getE01LCMCUN()%>">
    		<a href="javascript:GetCustomerDescId('E01LCMCUN','E01APLNME','E01APLRUT')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" border="0" ></a>
    	</td>
        <td align=right width="15%">Identificaci&oacute;n :</td>
        <td width="35%"> 
           <input size="28" type="text" name="E01APLRUT" maxlength="25" value="<%=bolgaran.getE01APLRUT()%>">
    	</td>
    </tr>
    <tr id=trclear>
    		 <td align=right width="15%">Nombre :</td>
            <td  colspan=3> 
               <input size="50" type="text" name="E01APLNME" maxlength="45" value="<%=bolgaran.getE01APLNME()%>"> 
      		</td>                      
    </tr>
    <tr id=trdark>
       <td align=right width="15%">Cta. Corriente :</td>
       <td width="35%">           
           <input type="text" name="E01LCMAPA" size="12" maxlength="12"  value="<%= bolgaran.getE01LCMAPA().trim()%>">
           <a href="javascript:GetAccByClient('E01LCMAPA',document.forms[0].E01LCMBNK.value,'RT','',document.forms[0].E01LCMCUN.value)"><img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" border="0" ></a> 
       </td>
       <td width="15%"> 
           <div align="right" >Linea de Cr&eacute;dito :</div>
       </td>
       <td width="35%"> 
           <input type="text" name="E01LCMLNR" size="9" maxlength="9" value="<%= bolgaran.getE01LCMLNR().trim()%>" >
           <input type="text" name="E01LCMCMN" size="4" maxlength="4" value="<%= bolgaran.getE01LCMCMN().trim()%>" >
           <a href="javascript:GetCreditLine('E01LCMCMN',document.forms[0].E01LCMLNR.value)"><img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" border="0" ></a> 
       </td>                       
    </tr>
  </table>
 </td>
 </tr>
 </table>
  <h4>Datos Por Cuenta de</h4>
  <table class=tableinfo>
  <tr>
   <td>
  <table width="100%" border="0" cellspacing="0" cellpadding="0">
    <tr id=trdark>
            <td align=right width="15%">Identificaci&oacute;n :</td>
            <td> 
        		<input size="15" type="text" name="E01LCMCBC" maxlength="10" value="<%=bolgaran.getE01LCMCBC()%>">
      		    <a href="javascript:GetCustomerDescId('E01LCMCBC','E01LCMCA1','')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" border="0" ></a>
      		</td>
    </tr>
    <tr id=trclear>
            <td align=right width="15%">Nombre :</td>
            <td colspan=3> 
        		<input size="45" type="text" name="E01LCMCA1" maxlength="45" value="<%=bolgaran.getE01LCMCA1()%>"> 
      		</td>
    </tr>
  </table>
</td>
  </tr>
 </table>
  <h4>Datos Beneficiario</h4>
  <table class=tableinfo>
  <tr>
   <td>
  <table width="100%" border="0" cellspacing="0" cellpadding="0">
    <tr id=trdark>
            <td align=right width="15%">N&uacute;mero :</td>
            <td width="35%"> 
        		<input size="15" type="text" name="E01LCMBCU" maxlength="10" value="<%=bolgaran.getE01LCMBCU()%>">
      		    <a href="javascript:GetCustomerDescId('E01LCMBCU','E01BNFNME','E01BNFRUT')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" border="0" ></a>
      		</td>
            <td align=right width="15%">Identificaci&oacute;n :</td>
            <td width="35%"> 
        		<input size="28" type="text" name="E01BNFRUT" maxlength="10" value="<%=bolgaran.getE01BNFRUT()%>">
      		</td>
    </tr>
    <tr id=trclear>
            <td align=right width="15%">Nombre :</td>
            <td colspan=3> 
        		<input size="45" type="text" name="E01BNFNME" maxlength="45" value="<%=bolgaran.getE01BNFNME()%>"> 
      		</td>
    </tr>
    <tr id=trdark>
            <td align=right width="15%">:</td>
            <td colspan=3> 
        		<input size="45" type="text" name="E01BNFNM2" maxlength="45" value="<%=bolgaran.getE01BNFNM2()%>"> 
      		</td>
    </tr>
    <tr id=trclear>
            <td align="right" width="15%">Direccion :</td>
            <td colspan=3> 
        		<input size="45" type="text" name="E01BNFAD1" maxlength="45" value="<%=bolgaran.getE01BNFAD1()%>"> 
      		</td>
    </tr>
    <tr id=trdark>
            <td align=right width="15%"></td>
            <td colspan=3> 
        		<input size="40" type="text" name="E01BNFAD2" maxlength="45" value="<%=bolgaran.getE01BNFAD2()%>"> 
      		</td>
    </tr>
    <tr id=trclear>
            <td align=right width="15%"></td>
            <td colspan=3> 
        		<input size="30" type="text" name="E01BNFAD3" maxlength="45" value="<%=bolgaran.getE01BNFAD3()%>"> 
      		</td>
    </tr>
    <tr id=trdark>
            <td align=right width="15%">Garantiza :</td>
            <td colspan=3> 
        		<%--<input size="80" type="text" name="E01SPINS1" maxlength="80" value="<%=bolgaran.getE01SPINS1()%>">--%>
        		<textarea name="E06SPIM01" cols="45" rows="8" onKeyDown="cuenta()" onKeyUp="cuenta()"><%= garantizaBean.getE06SPIM01() %></textarea>
        	</td>            
     </tr>
     <tr id=trclear>
       <td align=right width="15%">Cta. Corriente :</td>
       <td width="35%">
            <input type="text" name="E01LCMBAC" size="12" maxlength="12"  value="<%= bolgaran.getE01LCMBAC().trim()%>">
            <a href="javascript:GetAccByClient('E01LCMBAC',document.forms[0].E01LCMBNK.value,'RT','',document.forms[0].E01LCMBCU.value)"><img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" border="0" ></a> 
       </td> 
      <td align=right width="15%">Pago :</td>
      <td width="35%">
      		<SELECT name="E01PAGFLG">
                 <!-- OPTION value="1" <% if (bolgaran.getE01PAGFLG().equals("1")) out.print("selected");%>>30 días plazo</OPTION -->
                 <OPTION value="2" <% if (bolgaran.getE01PAGFLG().equals("2")) out.print("selected");%>>Vista</OPTION>
            </SELECT>
      </td>                      
    </tr>
  </table>
  </td>
  </tr>
 </table>  
 <h4>Datos Emisión</h4>
 <% String readonlyflg = userPO.getPurpose().equals("MAINTENANCE")?"readonly":"" ;  %>
  <table class=tableinfo>
  <tr>
   <td>
  <table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr id=trdark>
      <td align=right width="15%">Monto Origen :</td>
      <td><INPUT type="text" name="E01LCMOAM" maxlength="15" size="16" onkeypress="enterDecimal(event, 2)" value="<%=bolgaran.getE01LCMOAM()%>" <%= readonlyflg %>> </td>
      <td align=right width="15%">Gastos Notaría :</td>
      <td><INPUT type="text" name="E01LCMC12" onkeypress="enterDecimal(event, 2)" maxlength="15" size="16" value="<%=bolgaran.getE01LCMC12()%>" ></td>
    </tr>
    <tr id=trclear>
      <td align=right width="15%">Monto Boleta :</td>
      <td><INPUT type="text" name="E01LCMC10" maxlength="15" size="16" onkeypress="enterDecimal(event, 2)" value="<%=bolgaran.getE01LCMC10()%>"  readonly  > </td>
      <td align=right width="15%">Tasa Interes :</td>
      <td><INPUT type="text" name="E01LCMIRT" onkeypress="enterDecimal(event, 2)" maxlength="9" size="10" value="<%=bolgaran.getE01LCMIRT()%>" <%= readonlyflg %>> </td>
    </tr>
    <tr id=trdark>
      <td align=right width="15%">Monto Comision :</td>
      <td><INPUT type="text" name="E01LCMC11" onkeypress="enterDecimal(event, 2)" maxlength="15" size="16" value="<%=bolgaran.getE01LCMC11()%>"></td>
      <td align=right width="15%">Tipo Cambio :</td>
      <td><INPUT type="text" name="E01LCMOFX" onkeypress="enterDecimal(event, 2)" maxlength="11" size="12" value="<%=bolgaran.getE01LCMOFX()%>"></td>
    </tr>
    <tr id=trclear>
      <td align=right width="15%">Timbres :</td>
      <td><INPUT type="text" name="E01LCMAM1" onkeypress="enterDecimal(event, 2)" maxlength="15" size="16" value="<%=bolgaran.getE01LCMAM1()%>"></td>
      <td align=right width="15%"></td>
      <td></td>
    </tr>
    
    
<%--    <tr id=trclear>
      <td align=right nowrap>Financiamiento :</td>
      <td colspan=3>
         <INPUT type="radio" name="E01CAPFLG" value="1" <% if (bolgaran.getE01CAPFLG().equals("1")) out.print("checked");%>>Cuenta Corriente
         <INPUT type="radio" name="E01CAPFLG" value="2" <% if (bolgaran.getE01CAPFLG().equals("2")) out.print("checked");%>>Caja 
      	 <INPUT type="radio" name="E01CAPFLG" value="3" <% if (bolgaran.getE01CAPFLG().equals("3")) out.print("checked");%>>Pagare 
      </td>
    </tr>
    <tr id=trdark>
      <td align=right nowrap>Cobros Iniciales :</td>
      <td colspan=3>
          <INPUT type="radio" name="E01CBRFLG" value="1" <% if (bolgaran.getE01CBRFLG().equals("1")) out.print("checked");%>>Cuenta Corriente
          <INPUT type="radio" name="E01CBRFLG" value="2" <% if (bolgaran.getE01CBRFLG().equals("2")) out.print("checked");%>>Caja
      </td>
    </tr>
--%>
  </table>
</td>
  </tr>
 </table>
  <h4>Datos Comisi&oacute;n</h4>
  <table class=tableinfo>
  <tr>
   <td>
  <table width="100%" border="0" cellspacing="0" cellpadding="0">
    <tr id=trdark>
      <td align=right width="20%" rowspan="2">Frecuencias :</td>
      <td align=left width="15%" nowrap><input type="radio" name="frecuencia" value="I" onClick="frecDis(1)" <% if (bolgaran.getE01LCMFCO().equals("0")) out.print("checked"); %>> Al Inicio</td>
      <td width="15%"></td>
      <td width="50%">Tarifa :&nbsp;&nbsp;&nbsp;
      <INPUT type="text" name="E01LCMTAR" size="2" maxlength="2" value="<%= bolgaran.getE01LCMTAR().trim()%>">
				<A href="javascript:GetTariffLC('E01LCMTAR','<%=bolgaran.getE01LCMATY()%>','<%=bolgaran.getE01LCMCUN()%>','')">
				<IMG src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="bottom" border="0"></A> 
            <IMG src="<%=request.getContextPath()%>/images/Check.gif" title="campo obligatorio" border="0">
       </td>
    </tr>
    <tr id=trdark>
      <td align=left width="15%"><input type="radio" name="frecuencia" value="P" onClick="frecDis(0)" <% if (!bolgaran.getE01LCMFCO().equals("0")) out.print("checked"); %> > Periodo <select
					name="E01LCMFCO2">
					<option value="0">-----</option>
					<option value="030"
						<% if (bolgaran.getE01LCMFCO().equals("30")) out.print("selected");%>>30
					Dias</option>
					<option value="060"
						<% if (bolgaran.getE01LCMFCO().equals("60")) out.print("selected");%>>60
					Dias</option>
					<option value="090"
						<% if (bolgaran.getE01LCMFCO().equals("90")) out.print("selected");%>>90
					Dias</option>
					<option value="120"
						<% if (bolgaran.getE01LCMFCO().equals("120")) out.print("selected");%>>120
					Dias</option>
					<option value="180"
						<% if (bolgaran.getE01LCMFCO().equals("180")) out.print("selected");%>>180
					Dias</option>
					<option value="360"
						<% if (bolgaran.getE01LCMFCO().equals("360")) out.print("selected");%>>360
					Dias</option>
				</select></td>
      <td align=left width="15%">
      <input type="hidden" name="E01LCMFCO" value="<%= bolgaran.getE01LCMFCO() %>">
      </td>
      <td align=right nowrap width="50%"><% if (bolgaran.getE01LCMFCO().equals("0")){ %>
      <script>
      	document.forms[0].elements["E01LCMFCO2"].disabled = true;
      </script>
      <% } %>
      </td>
    </tr>
    <tr id=trclear>
      <td align=right width="20%">Permite Renovaci&oacute;n Autom&aacute;tica :</td>
      <td align=left width="15%">
      		<INPUT type="radio" name="E01LCMEVF" value="Y" onClick="renAuto(0)" <% if (bolgaran.getE01LCMEVF().equals("Y")) out.print("checked"); %>> Si
			<INPUT type="radio" name="E01LCMEVF" value="N" onClick="renAuto(1)" <% if (bolgaran.getE01LCMEVF().equals("N")) out.print("checked"); %>> No
      </td>
      <td width="15%"><input type="text" name="E01LCMRDY" size="3" maxlength="10" value="<%= bolgaran.getE01LCMRDY() %>" >
      			 <select name="E01LCMFL1">
      			 	<option value="">----</option>
      			 	<option value="D"<%= ((bolgaran.getE01LCMFL1().equals("D"))?" Selected":"") %>>Dias</option>
      			 	<option value="M"<%= ((bolgaran.getE01LCMFL1().equals("M"))?" Selected":"") %>>Meses</option>
      			 	<option value="A"<%= ((bolgaran.getE01LCMFL1().equals("A"))?" Selected":"") %>>Años</option>
      			 </select>
      </td>
      <td width="50%">Días de aviso de No renovación : &nbsp; &nbsp;   <input type="text" name="E01LCMNRD" size="3" maxlength="3" value="<%= bolgaran.getE01LCMNRD() %>" ></td>
    </tr>
    <tr id=trdark>
      <td align=right width="20%">Financiamiento :</td>
      <td colspan=3>
         <INPUT type="radio" name="E01CAPFLG" value="1" <% if (bolgaran.getE01CAPFLG().equals("1")) out.print("checked");%>>Cuenta Corriente
         <INPUT type="radio" name="E01CAPFLG" value="2" <% if (bolgaran.getE01CAPFLG().equals("2")) out.print("checked");%>>Caja 
      	 <INPUT type="radio" name="E01CAPFLG" value="3" <% if (bolgaran.getE01CAPFLG().equals("3")) out.print("checked");%>>Pagare 
      </td>
    </tr>
    <tr id=trclear>
      <td align=right width="20%">Cobros Iniciales :</td>
      <td colspan=3>
          <INPUT type="radio" name="E01CBRFLG" value="1" <% if (bolgaran.getE01CBRFLG().equals("1")) out.print("checked"); %>>Cuenta Corriente
          <INPUT type="radio" name="E01CBRFLG" value="2" <% if (bolgaran.getE01CBRFLG().equals("2")) out.print("checked"); %>>Caja
		  <INPUT type="radio" name="E01CBRFLG" value="3" <% if (bolgaran.getE01CBRFLG().equals("3")) out.print("checked"); %>>Cuentas por Cobrar
		  <INPUT type="radio" name="E01CBRFLG" value="4" <% if (bolgaran.getE01CBRFLG().equals("4")) out.print("checked"); %>>No tiene Cobros
      </td>
    </tr>
  </table>
</td>
  </tr>
 </table>
   <% if (userPO.getPurpose().equals("MAINTENANCE")){%>
  <H4>Tipo de Operaci&oacute;n</H4>
  <TABLE class="tableinfo">
    <TBODY>
      <TR>
        <TD nowrap><TABLE cellspacing="0" cellpadding="2" width="100%" border="0"
				class="tbhead">
            <TBODY>
              <TR id="trdark0">
                <TD nowrap width="16%"align="right">Incremento / Decremento:</TD>
                <TD nowrap width="20%" align="left"><SELECT name="E01LCMIDF">
                  <OPTION value=""> </OPTION>
                  <OPTION value="I" <% if(bolgaran.getE01LCMIDF().equals("I")) out.print("selected");%>>Incremento</OPTION>
                  <OPTION value="D" <% if(bolgaran.getE01LCMIDF().equals("D")) out.print("selected");%>>Decremento</OPTION>
                </SELECT></TD>
                <TD nowrap width="16%"align="right">Monto</TD>
                <TD nowrap width="16%"><INPUT name="E01LCMIDA" type="text" onKeyPress="enterDecimal(event, 2)" value="<%= bolgaran.getE01LCMIDA().trim()%>" size="17" maxlength="16"></TD>
              </TR>
            </TBODY>
        </TABLE></TD>
      </TR>
    </TBODY>
  </TABLE>
  <% } %>
 
 
 
 
 <% if (userPO.getPurpose().equals("MAINTENANCE")){
 %>
<jsp:include page="ESD0840_reevaluation_inquiry.jsp" flush="true">
	<jsp:param name="flag" value="<%=bolgaran.getH01FLGWK3()%>" />
</jsp:include>
 <% } %>

	<P align="center"><INPUT type="button" value="enviar" id="EIBSBTN" onClick="enviar(5)"></P>
	
</FORM>
</BODY>
</html>
