<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@page import="com.datapro.eibs.constants.ISOCodes"%>
<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@page import="com.datapro.constants.EibsFields"%>
<html>
<head>
<title>Linea de Credito</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Studio">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/jquery/plugins/contextMenu/css/jquery.contextMenu.css" rel="stylesheet" type="text/css" />

<jsp:useBean id="rtOver" class="datapro.eibs.beans.EDD043005Message"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>


<SCRIPT type="text/javascript">
   
function verifyNum(elem){
   if (trim(elem.value)=="") elem.value="0.00";
  }
     
function restDecimal(val){
   var posi = val.indexOf(".");
   var rest = "0";
   if (posi != -1) {
 	 rest = val.substring(posi +1, val.length);
   }
   return rest;
}

function roundDecimal(val,maxlen){
   var posi = val.indexOf(".");
   var dec = val;
   var rest = "0";
   var intp ="0";
   var rnd;
   if (posi != -1) {
     intp = val.substring(0,posi + 1);     
 	 rest = val.substring(posi +1, val.length);
 	 if (rest.length > maxlen) {
 	    rnd = parseInt(rest.substring(0, maxlen)) + 1;
 	    dec = intp + rnd;
 	 }
   }
   return dec;
}
    
function UpdateRate(){
   
    var total; 
    var tmptotal;    
    var FLT ;
    var DEA ;
    try {
      FLT = formatFloat(document.getElementById("E05FLTRTE").value);
    }catch(e){
      FLT = 0.00;
    }
    try {
      DEA = formatFloat(document.getElementById("E05DEARTE").value);
    }catch(e){
      DEA = 0.00;
    }
          
    total= parseFloat(FLT);
    total += parseFloat(DEA);

    tmptotal = "" + total; 
    var lFLT = restDecimal(FLT).length;
    var lDEA = restDecimal(DEA).length;
	var ltotal = restDecimal(tmptotal).length; 

    if (lFLT > lDEA) {
    	if (ltotal > lFLT) {
    	   tmptotal = roundDecimal(tmptotal,lFLT);
    	}
    } else {
    	if (ltotal > lDEA) {
    	   tmptotal = roundDecimal(tmptotal,lDEA);
    	}   	
    }
    
    document.getElementById("E05DLSRTE").value = tmptotal;
   
  }

function UpdateTotal(){
   
   var total = 0.00;
   var val = 0.00;
   
   for ( var i=1; i<=5; i++ ) {        
    try{
     	val= parseFloat((getElement("E05DLAMT" + i).value));
    }
    catch(e){
     	val=0.00;
    }    
    total=total + val;
   } 
    
   document.getElementById("E05TOTAMT").value=formatCCY(total);
   
  }

function bloquea()
{ 
  if (document.getElementById("E05INVRTB").value == "1")
  {
  	  div1.style.display="";
   	  div2.style.display="";
  }
  else
  {
	  div1.style.display="none";
	  div2.style.display="none";
  }   
} 

function bloquea3()
{ 
  if (document.getElementById("E05INVPIF").value != "%" && document.getElementById("E05INVPIF").value != "F")
  {
  	  div3.style.display="none";
  	  div31.style.display="none";
  	  div4.style.display="none";
  }
  else
  {
  	if (document.getElementById("E05INVPIF").value == "F"){
  	  	div3.style.display="";
  	  	div31.style.display="none";
  	}else{
  		div3.style.display="none";
  		div31.style.display="";
  	}  
   	  
	  div4.style.display="";
  }   
} 

  
function UpdateFlag(val) {
  document.getElementById("E05RCLFLC").value = (val==true)?"X":"";
 }  

function setRecalculate() {
  document.getElementById("RECALC").checked = true;
  document.getElementById("RECALC").disabled = true;
  UpdateFlag(true);  
 }
  
</SCRIPT>

</head>

<body>
<% 
 if ( !error.getERRNUM().equals("0")  ) {
     out.println("<SCRIPT Language=\"Javascript\">");
     error.setERRNUM("0");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
 }

%>
<H3 align="center">Protección 
<%	if(userPO.getOption().equals("01")){
		if (!userPO.getAccOpt().equals("08")) 
			out.print(" Sobregiro - Contratado");
		else
			out.print(" Sobregiro - Ocasional");
	}else if(userPO.getOption().equals("02")){
		 out.print(" Corresponsales");
	}%>


<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="rt_overd_ln, EDD0430"></H3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDD0430" >
  <input type=HIDDEN name="SCREEN" value="10">
  <input type=HIDDEN name="E05INVPRD" id="E05INVPRD" value="<%= rtOver.getE05INVPRD().trim()%>">
  <INPUT TYPE=HIDDEN NAME="E05RCLFLC" id="E05RCLFLC" VALUE="<%= rtOver.getE05RCLFLC().trim()%>">
            			   
 <table class="tableinfo">
    <tr > 
      <td nowrap>
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
          <tr id="trdark"> 
            <td nowrap> 
              <div align="right"><b>Cliente :</b></div>
            </td>
            <td nowrap> 
              <input type="text" name="E05ACMCUN" size="10" maxlength="9" value="<%= rtOver.getE05ACMCUN().trim()%>" readonly>
            </td>
            <td nowrap> 
              <div align="right"><b>Nombre :</b></div>
            </td>
            <td nowrap> 
              <input type="text" name="E05CUSNA1" size="45" maxlength="45" value="<%= rtOver.getE05CUSNA1().trim()%>" readonly>
            </td>            
          </tr>
          <tr id="trdark"> 
            <td nowrap> 
              <div align="right"><b>Cuenta :</b></div>
            </td>
            <td nowrap> 
              <input type="text" name="E05ACMACC" size="13" maxlength="12" value="<%= rtOver.getE05ACMACC().trim()%>" readonly>
            </td>
            <td nowrap> 
              <div align="right"><b>Producto :</b></div>
            </td>
            <td nowrap> 
              <input type="text" name="E05ACMPRO" size="4" maxlength="4" value="<%= rtOver.getE05ACMPRO().trim()%>" readonly>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <br>
  <table class="tableinfo">
    <tr> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
        	<% int row = 1; %>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="20%" > 
              <div align="right">Numero del Prestamo :</div>
            </td>
            <td nowrap width="30%" > 
              <div align="left">
              	<% if (rtOver.getE05INVRAC().trim().equals("999999999999")) out.print("NUEVO PRESTAMO"); else out.print(rtOver.getE05INVRAC().trim()); %> 
                <!--<input type="text" name="E05INVRAC" size="12" maxlength="12" value="<%= rtOver.getE05INVRAC().trim()%>" onKeypress="enterInteger(event)" 
                <% if (!userPO.getPurpose().equals("APPROVAL_INQ")) {%> class="context-menu-help" onmousedown="init(accountHelp,this.name,'','','','','10')"<% } %>>-->
              </div>
            </td>
            <td nowrap width="20%" > 
              <div align="right">Producto del Prestamo :</div>
            </td>
            <td nowrap width="30%" > 
              <div align="left">
                <input type="text" name="E05INVPRD" size="5" maxlength="4" value="<%= rtOver.getE05INVPRD().trim()%>" readonly>
                <input type="text" name="E05DSCPRD" size="50" maxlength="45" value="<%= rtOver.getE05DSCPRD().trim()%>" readonly>
              </div>
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="20%" > 
              <div align="right">Estado :</div>
            </td>
            <td nowrap width="30%" > 
              <div align="left">
                <select name="E05INVSTS">
                  <option value=" " <% if (!(rtOver.getE05INVSTS().equals("1") || rtOver.getE05INVSTS().equals("2") || rtOver.getE05INVSTS().equals("3"))) out.print("selected"); %>></option>
                  <option value="1" <% if (rtOver.getE05INVSTS().equals("1")) out.print("selected"); %>>Activo</option>
                  <option value="2" <% if (rtOver.getE05INVSTS().equals("2")) out.print("selected"); %>>Suspendido</option>
                  <option value="3" <% if (rtOver.getE05INVSTS().equals("3")) out.print("selected"); %>>Cerrado</option>
                </select> 
              </div>
            </td>
            <td nowrap width="20%" > 
              <div align="right">Incluye Interes en Pago:</div>
            </td>
            <td nowrap width="30%" > 
              <INPUT type="radio" name="E05INVIIP" value="Y" <%if(rtOver.getE05INVIIP().equals("Y")) out.print("checked");%>=""> S&iacute; 
              <INPUT type="radio" name="E05INVIIP" value="N" <%if(!rtOver.getE05INVIIP().equals("Y")) out.print("checked");%>=""> No 
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="20%" > 
              <div align="right">Monto M&aacute;ximo  :</div>
            </td>
            <td nowrap width="30%" > 
              <input type="text" name="E05INVOAM" size="17" maxlength="15" value="<%= rtOver.getE05INVOAM().trim()%>" onKeypress="enterDecimal()" onchange="setRecalculate()" onblur="verifyNum(this)">
				<img src="<%= request.getContextPath() %>/images/Check.gif" title="campo obligatorio" align="bottom" border="0">
            </td>
            <td nowrap width="20%" > 
              <div align="right">Moneda Pago :</div>
            </td>
            <td nowrap width="30%" > 
              <input type="text" name="E05INVRCY" size="4" maxlength="3" value="<%= rtOver.getE05INVRCY().trim()%>"
              <% if (!userPO.getPurpose().equals("APPROVAL_INQ")) {%>class="context-menu-help" onmousedown="init(currencyHelp,this.name,'','','','','')"<% } %>> 
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="20%" > 
              <div align="right">Tipo de Pago :</div>
            </td>
            <td nowrap width="30%" > 
            	<SELECT name="E05INVPIF" id="E05INVPIF" onChange="bloquea3()">
                   <OPTION value=" " <% if (!(rtOver.getE05INVPIF().equals("F") && rtOver.getE05INVPIF().equals("%"))) out.print("selected"); %>>N/A</OPTION>
                   <OPTION value="F" <% if (rtOver.getE05INVPIF().equals("F")) out.print("selected"); %>="">Monto Fijo</OPTION>
                   <OPTION value="%" <% if (rtOver.getE05INVPIF().equals("%")) out.print("selected"); %>="">Porcentaje del Principal</OPTION>
             	</SELECT> 
            </td>
         
            <td nowrap width="20%" > 
              <div align="right">Tipo Amortización :</div>
            </td>
            <td nowrap width="30%" > 
            	<SELECT name="E05INVRTB" id="E05INVRTB" onChange="bloquea()">
                       <OPTION value=" " <% if (!(rtOver.getE05INVRTB().equals("0") ||rtOver.getE05INVRTB().equals("1")||rtOver.getE05INVRTB().equals("2"))) out.print("selected"); %>></OPTION>
                       <OPTION value="0" <% if (rtOver.getE05INVRTB().equals("0")) out.print("selected"); %>="">Discrecional-Manual</OPTION>
                	   <OPTION value="1" <% if (rtOver.getE05INVRTB().equals("1")) out.print("selected"); %>="">Automatico-En dia 'n'</OPTION>
                       <OPTION value="2" <% if (rtOver.getE05INVRTB().equals("2")) out.print("selected"); %>="">Automatico-Cierre</OPTION>
                </SELECT>
				<img src="<%= request.getContextPath() %>/images/Check.gif" title="campo obligatorio" align="bottom" border="0">
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
<!--             <td nowrap width="20%" >  -->
<!--               <div align="right">Monto M&iacute;nimo Pago :</div> -->
<!--             </td> -->
<!--             <td nowrap width="30%" >  -->
<!--               <div align="left">  -->
<%--                 <input type="text" name="E05INVMIN" size="17" maxlength="15" value="<%= rtOver.getE05INVMIN().trim()%>" onKeypress="enterDecimal()"> --%>
<!--               </div> -->
<!--             </td> -->
   			<td nowrap width="20%" > 
              <div id="div3" align="right">Monto a Amortizar :</div>
              <div id="div31" align="right">% a Amortizar :</div>
            </td>
            <td nowrap width="30%" > 
             <div id="div4" align="left" >
              <input type="text" name="E05INVPMT" size="17" maxlength="15" value="<%= rtOver.getE05INVPMT().trim()%>" onKeypress="enterDecimal()">
              <img src="<%= request.getContextPath() %>/images/Check.gif" title="campo obligatorio" align="bottom" border="0">
				</div>
            </td>
            <td nowrap width="20%" > 
              <div id="div1" align="right" >Dia a Amortizar : </div>
			</td>
            <td nowrap width="30%" > 
 			  <div id="div2" align="left" >
               <input type="text" name="E05PRIDAY" size="3" maxlength="2" value="<%= rtOver.getE05PRIDAY().trim()%>" onKeypress="enterInteger(event)">
               <img src="<%= request.getContextPath() %>/images/Check.gif" title="campo obligatorio" align="bottom" border="0">
               </div>
            </td>
          </tr>
<%--           <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> --%>
<!--             <td nowrap width="20%" >  -->
<!--               <div align="right">Transferir en Multiplos de :</div> -->
<!--             </td> -->
<!--             <td nowrap width="30%" >  -->
<!--               <div align="left">  -->
<%--                 <input type="text" name="E05INVMUL" size="17" maxlength="15" value="<%= rtOver.getE05INVMUL().trim()%>" onKeypress="enterInteger(event)"> --%>
<%-- 				<img src="<%= request.getContextPath() %>/images/Check.gif" title="campo obligatorio" align="bottom" border="0"> --%>
<!--               </div> -->
<!--             </td> -->
<!--             <td nowrap width="20%" >  -->
<!--               <div align="right">Tipo de Pago :</div> -->
<!--             </td> -->
<!--             <td nowrap width="30%" >  -->
<!--             	<SELECT name="E05INVPIF"> -->
<%--                    <OPTION value=" " <% if (!(rtOver.getE05INVPIF().equals("F")||rtOver.getE05INVPIF().equals("%"))) out.print("selected"); %>=""></OPTION> --%>
<%--                    <OPTION value="F" <% if (rtOver.getE05INVPIF().equals("F")) out.print("selected"); %>="">Monto Fijo</OPTION> --%>
<%--                    <OPTION value="%" <% if (rtOver.getE05INVPIF().equals("%")) out.print("selected"); %>="">Porcentaje del Principal</OPTION> --%>
<!--              	</SELECT>  -->
<!--             </td> -->
<!--           </tr> -->
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="20%" > 
              <div align="right">Balance M&iacute;nimo de la Cuenta :</div>
            </td>
            <td nowrap width="30%" > 
              <input type="text" name="E05INVBLS" size="17" maxlength="15" value="<%= rtOver.getE05INVBLS().trim()%>" onKeypress="enterDecimal()">
            </td>
            <td nowrap width="20%" > 
              <div align="right">Fecha de Inicio :</div>
            </td>
            <td nowrap width="30%" > 
 				<eibsinput:date name="rtOver" fn_year="E05INVSDY" fn_month="E05INVSDM" fn_day="E05INVSDD" required="true"/>
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="20%" > 
              <div align="right">Tipo de Cobertura :</div>
            </td>
            <td nowrap width="30%" > 
              <select name="E05INVGLT">
                <option value=" " <% if (!(rtOver.getE05INVGLT().equals("1")||rtOver.getE05INVGLT().equals("2"))) out.print("selected"); %>></option>
                <option value="1" <% if (rtOver.getE05INVGLT().equals("1")) out.print("selected"); %>>En Linea</option>
                <option value="2" <% if (rtOver.getE05INVGLT().equals("2")) out.print("selected"); %>>Cierre del Dia</option>
              </select>
            </td>
            <td nowrap width="20%" > 
              <div align="right">Fecha Vencimiento :</div>
            </td>
            <td nowrap width="30%" > 
              <div align="left"> 
 				<eibsinput:date name="rtOver" fn_year="E05INVMDY" fn_month="E05INVMDM" fn_day="E05INVMDD" required="true" />
              </div>
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="20%" > 
              <div align="right">Ciclo/Revision Tasa :</div>
            </td>
            <td nowrap width="30%" > 
              <div align="left"> 
                <input type="text" name="E05INVRPD" size="3" maxlength="2" value="<%= rtOver.getE05INVRPD().trim()%>">
                <select name="E05INVRFL">
                  <option value=" " <% if (!(rtOver.getE05INVRFL().equals("D") || rtOver.getE05INVRFL().equals("M") || rtOver.getE05INVRFL().equals("Y"))) out.print("selected"); %>>N/A</option>
                  <option value="D" <% if (rtOver.getE05INVRFL().equals("D")) out.print("selected"); %>>Diario</option>
                  <option value="M" <% if (rtOver.getE05INVRFL().equals("M")) out.print("selected"); %>>Mensual</option>
                  <option value="Y" <% if (rtOver.getE05INVRFL().equals("Y")) out.print("selected"); %>>Anual</option>
                </select>
              </div>
            </td>
            <td nowrap width="20%" > 
              <div align="right">Fecha Revisión :</div>
            </td>
            <td nowrap width="30%" > 
              <div align="left"> 
 				<eibsinput:date name="rtOver" fn_year="E05INVRDY" fn_month="E05INVRDM" fn_day="E05INVRDD" />
              </div>
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="20%" > 
              <div align="right">Tasa Flotante :</div>
            </td>
            <td nowrap width="30%" > 
              <input type="text" name="E05FLTRTE" id="E05FLTRTE" readonly size="12" maxlength="12" value="<%= rtOver.getE05FLTRTE().trim()%>" onKeypress="enterDecimal()"> 
            </td>
            <td nowrap width="20%" > 
              <div align="right">Tipo Tabla Flotante :</div>
            </td>
            <td nowrap width="30%" > 
              <input type="text" name="E05DEAFTB" readonly size="3" maxlength="2" value="<%= rtOver.getE05DEAFTB().trim()%>"> 
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="20%" > 
              <div align="right">Spread :</div>
            </td>
            <td nowrap width="30%" > 
              <input type="text" name="E05DEARTE" id="E05DEARTE" size="12" maxlength="12" value="<%= rtOver.getE05DEARTE().trim()%>" onKeypress="enterDecimal()" onChange="UpdateRate()" onblur="verifyNum(this)"> 
            </td>
            <td nowrap width="20%" > 
              <div align="right">Tipo Tasa Flotante :</div>
            </td>
            <td nowrap width="30%" > 
              <input type="text" readonly name="E05DEAFTY" size="3" maxlength="2" value="<%= rtOver.getE05DEAFTY().trim()%>"> 
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="20%" > 
              <div align="right">Tasa Interes Prestamo :</div>
            </td>
            <td nowrap width="30%" > 
              <input type="text" readonly name="E05DLSRTE" id="E05DLSRTE" size="12" maxlength="12" value="<%= rtOver.getE05DLSRTE().trim()%>" onKeypress="enterDecimal()">
            </td>
            <td nowrap width="20%" > 
              <div align="right">L&iacute;nea de Cr&eacute;dito :</div>
            </td>
            <td nowrap width="30%" > 
              <input type="text" name="E05DEACMC" size="9" maxlength="9" value="<%= rtOver.getE05DEACMC().trim()%>" >
              <input type="text" name="E05DEACMN" size="4" maxlength="4" value="<%= rtOver.getE05DEACMN().trim()%>" >
              <a href="javascript:GetCreditLine('E05DEACMN',document.forms[0].E05DEACMC.value)"><img src="<%=request.getContextPath()%>/images/1b.gif" title="ayuda" align="middle" border="0" ></a> 
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="20%" > 
              <div align="right">Renovacion Automatica :</div>
            </td>
            <td nowrap width="30%" > 
				<input type="radio" name="E05CONFG1" value="Y" <%if (rtOver.getE05CONFG1().equals("Y")) out.print("checked"); %>> Si 
				<input type="radio" name="E05CONFG1" value="N" <%if (rtOver.getE05CONFG1().equals("N")) out.print("checked"); %>> No
            </td>
            <td nowrap width="20%" > 
	          <div id="renovationAnswerDivTitle" align="right" style="display: <%= rtOver.getE05CHGREN().equals("") ? "none" : "" %>">
	          	Cargos por Renovacion Manual:
	          </div>
            </td>
            <td nowrap width="30%" > 
	          <div id="renovationAnswerDiv" style="display: <%= rtOver.getE05CHGREN().equals("") ? "none" : "" %>">
				<input type="radio"  name="E05CHGREN" value="Y"  <%if (rtOver.getE05CHGREN().equals("Y")) out.print("checked"); %> <%= rtOver.getE05CHGREN().equals("")  ? "disabled=disabled" : "" %> > Si 
				<input type="radio"  name="E05CHGREN" value="N"  <%if (rtOver.getE05CHGREN().equals("N")) out.print("checked"); %> <%= rtOver.getE05CHGREN().equals("")  ? "disabled=disabled" : "" %>> No
	          </div>
            </td>
          </tr>       
           <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 			
            <td nowrap width="20%" > 
              <div align="right">Ciclo Pago Interes :</div>
            </td>
            <td nowrap width="30%">  
              <input type="text" name="E05DEAIPD" size="4" readonly value="<%= rtOver.getE05DEAIPD().trim()%>"> 
            </td>
            <td nowrap width="20%" > 
              <div align="right">Ciclo Pago Capital :</div>
            </td>
            <td nowrap width="30%"> 
              <input type="text" name="E05DEAPPD" size="4" readonly value="<%= rtOver.getE05DEAPPD().trim()%>"> 
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  
 <h4>Cargos</h4>
  <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellpadding=2 cellspacing=0 width="100%" border="0">
          <tr id="trdark">             
            <td nowrap> 
              <div align="center"><b>Descripcion </b></div>
            </td>
            <td nowrap > 
              <div align="center"><b>Monto </b></div>
            </td>
            <td nowrap > 
            </td>
          </tr>   	   
          <%      
  			int amount = 5;
 		    String name;
  			for ( int i=1; i<=amount; i++ ) {
   				name = i + "";   				
   				if (!rtOver.getField("E05DLNME"+name).getString().trim().equals("")) {
   			
	      %> 
          <tr id="trclear">             
            <td nowrap> 
              <div align="right"><%= rtOver.getField("E05DLNME"+name).getString().trim() %> : </div>
            </td>
            <td nowrap colspan=2> 
              <input type="text" class="txtright" name="E05DLAMT<%=name%>" size="17" maxlength="15" value="<%= rtOver.getField("E05DLAMT"+name).getString().trim() %>" onKeypress="enterDecimal()" onChange="UpdateTotal()" onblur="verifyNum(this)">            
            </td>
          </tr>
          <%
                    }
           }
    	  %> 		
    	  <tr id="trdark"> 
            <td nowrap> 
              <div align="right"><b>Total Cargos :</b></div>
            </td>
            <td nowrap> 
              <input type="text" class="txtright" name="E05TOTAMT" id="E05TOTAMT" size="17" maxlength="15" value="<%= rtOver.getE05TOTAMT() %>" readonly>
            </td>
            <td nowrap> 
              <input type="checkbox" name="RECALC" id="RECALC" value="" onClick="UpdateFlag(this.checked)" <% if (rtOver.getE05RCLFLC().trim().equals("X")) out.print(" checked disabled");%>><b> Recalcular</b>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table> 
  
<div id="divRenovar" class="hiddenDiv">
    <table class="approvalSearch" style="width: 500px">
    	<caption>Cambio de Fecha de Vencimiento. <br> Aplicar Renovacion?</caption>
      <tr > 
        <td align=CENTER  > 
				<input type="radio" id="renovationAnswerYes" name="renovationAnswer" value="Y" > Si 
				<input type="radio" id="renovationAnswerNo" name="renovationAnswer" value="N" > No
        </td>
      </tr>
      <tr></tr>
</table>
</div>  
  
  <% if (userPO.getPurpose().equals("APPROVAL_INQ")) {%>
 <SCRIPT type="text/javascript">
	$("input[type='text']").attr("readonly", "readonly").prop("onchange",null).prop("change",null);  
	$("select").add("button").add("textarea").add("submit").add("input[type='radio']").add("input[type='checkbox']").attr("disabled", "disabled").prop("onchange",null).prop("change",null);  
	$("img[title='null']").add("img[src*='1b.gif']").add("img[src*='Check.gif']").add("img[src*='calendar.gif']").hide(); 	
	$("input.context-menu-help").removeAttr("onmousedown").removeClass();

</SCRIPT>
 
 <% } else { %> 
 
   
    <div align="center"> 
        <input id="submitBtn" class="EIBSBTN" type=submit name="Submit" value="Enviar">
    </div>
  
 <% } %>
 <SCRIPT type="text/javascript">
   UpdateRate();
   bloquea();
   bloquea3();
   
 </SCRIPT>
<%if(!"Y".equals(rtOver.getE05FLGNEW())) {%>
 <script type="text/javascript">
function closeHiddenDivs(){
	setVisibility(getElement('submitBtn'), "visible");
	closeHiddenDivDsc();
    
    if(getRadioVal("renovationAnswer")){
   		$("[name='E05CHGREN']").prop('disabled', false);
   		$("input[name=E05CHGREN][value=" + getRadioVal("renovationAnswer") + "]").prop('checked', true);
      	$("input[name=RECALC]").click();
		getElement("renovationAnswerYes").checked = false;
		getElement("renovationAnswerNo").checked = false;   		
   	}
}

function closeHiddenDivDsc(){
	setVisibility(getElement("divRenovar"), "hidden");
}

function showHiddenDiv(evt) {
	evt = (evt) ? evt : ((window.event) ? window.event : "");
 	var divName = "divRenovar"; var divElm;

	divElm = getElement(divName);
	setVisibility(divElm, "visible");
	setVisibility(getElement('submitBtn'), "hidden");

	var y= $(document.body).height()/2 - $(getElement(divName)).height()/2;
	var x= $(document.body).width()/2 - $(getElement(divName)).width()/2;
	cancelBub(evt);
	moveElement(divElm, y, x);
}	

function checkChgExp(){
	getElement("renovationAnswerYes").checked = false;
	getElement("renovationAnswerNo").checked = false;

	var orgExpMth = '<%= rtOver.getE05INVMDM()%>';
	var orgExpDay = '<%= rtOver.getE05INVMDD()%>';
	var orgExpYer = '<%= rtOver.getE05INVMDY()%>';
			
	var chgofExpDat = (orgExpMth != getElement("E05INVMDM").value) || (orgExpDay != getElement("E05INVMDD").value) || (orgExpYer != getElement("E05INVMDY").value);	
	if(chgofExpDat){
		closeHiddenDivs();
		showHiddenDiv(event);
		getElement('renovationAnswerDiv').style.display = "";
		getElement('renovationAnswerDivTitle').style.display = "";
	} 
}

addEventHandler(document, 'click', closeHiddenDivs);
addEventHandler(getElement("divRenovar"), 'click', function(){cancelBub(event);});
addEventHandler(getElement("E05INVMDY"), 'change', function(){ checkChgExp();});
addEventHandler(getElement("E05INVMDD"), 'change', function(){ checkChgExp();});
addEventHandler(getElement("E05INVMDM"), 'change', function(){ checkChgExp();});

addEventHandler(getElement("renovationAnswerYes"), 'change', function(){ closeHiddenDivs();});
addEventHandler(getElement("renovationAnswerNo"), 'change', function(){ closeHiddenDivs();});

</script>
<% } %>
 
  </form>
</body>
</html>
