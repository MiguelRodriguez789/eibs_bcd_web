<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"> 
<%@ page import = "datapro.eibs.master.Util" %>
<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@ page import="com.datapro.constants.EibsFields"%>
<%@page import="datapro.eibs.sockets.MessageRecord"%>
<%@page import="datapro.eibs.beans.EDL209002Message"%>

<html>
<head>
<title>Renovación de Certificados de Depósito</title>

<%@ page import = "datapro.eibs.master.Util" %>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Studio">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/jquery/plugins/contextMenu/css/jquery.contextMenu.css" rel="stylesheet" type="text/css" />

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>
<script src="<%=request.getContextPath()%>/pages/s/javascripts/jquery.jsp"> </script>


<jsp:useBean id= "entity" class= "datapro.eibs.beans.EDL209001Message"  scope="session" />
<jsp:useBean id= "EDL209002List" class= "datapro.eibs.beans.JBObjList"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />
<jsp:useBean id="currUser" class="datapro.eibs.beans.ESS0030DSMessage" scope="session" />

<% 
 boolean isInquery = entity.getH01FLGWK2().equals("Y") ? true:false;	
 String isReadOnly = entity.getH01FLGWK2().equals("Y") ? "readonly":"";
 String isDisabled = entity.getH01FLGWK2().equals("Y") ? "disabled":"";
 boolean emptyListFr = EDL209002List.getNoResult();
 
 if ( !error.getERRNUM().equals("0")  ) {
     error.setERRNUM("0");
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
 }
%>

</head>

<SCRIPT LANGUAGE="JavaScript">

function showCancelData(obj){
   if (obj.checked) CANCELDATA.style.display=""; else {
    CANCELDATA.style.display="none";
    <% if(entity.getH01FLGWK3().equals("R")){%>
      document.forms[0]['E01PENREA'].value="0.00";
    <% } %>
    document.forms[0]['E01PENINT'].value="0.00";
    document.forms[0]['E01PENRTE'].value="0.00";
    document.forms[0]['E01PENDYS'].value="0";
    Recalculate();
   }
}

function doCalculate(){
 document.getElementById("opt").value=2;
 document.forms[0].submit();     
}

 function UpdateField(bfield,trfield,afield,cancelfield){
   var trval;
   var bfval;
   var afval=0.00;
   var clval;
    try{
     trval= parseFloat(formatFloat(document.forms[0][trfield].value));
     if (isNaN(trval)) trval=0.00;}
    catch(e){
     trval=0.00;
    }
    try{
     bfval=parseFloat(formatFloat(document.forms[0][bfield].value));}
    catch(e){
     bfval=0.00;
    }
    if (cancelfield=="") { clval=0.00;}
    else {
    	try{
     		clval=parseFloat(formatFloat(document.forms[0][cancelfield].value));}
    	catch(e){
     		clval=0.00;
    	}
    }
    afval=bfval-trval - clval;
    document.forms[0][afield].value = formatCCY(""+afval);
  } 

 function Recalculate(){
    UpdateField('E01DEAMEP','E01TRNPRI','AFTERPRI','');
    <% if(entity.getH01FLGWK3().equals("R")){%>
      UpdateField('E01DEAREA','E01TRNREA','AFTERREA','E01PENREA');
    <% } %>
    UpdateField('E01DEAMEI','E01TRNINT','AFTERINT','E01PENINT');
    UpdateField('E01DEAWHL','E01TRNWHL','AFTERWHL','');  
    UpdateTotal();
 }
  
  function verifyNum(elem){
   if (trim(elem.value)=="") elem.value="0.00";
  }
  
  function UpdateTotal(){
   
   var total;
   var totalCancel;
     
    try{
     total= parseFloat(formatFloat(document.getElementById("AFTERPRI").value));}
    catch(e){
     total=0.00;
    }
    try{
     totalCancel= parseFloat(formatFloat(document.getElementById("E01PENINT").value));}
    catch(e){
     totalCancel=0.00;
    }
    <% if(entity.getH01FLGWK3().equals("R")){%>
    try{
     total=total+parseFloat(formatFloat(document.getElementById("AFTERREA").value));}
    catch(e){
    }
    try{
     totalCancel=totalCancel+parseFloat(formatFloat(document.getElementById("E01PENREA").value));}
    catch(e){
    }
    <% } %>
    try{
     total=total+parseFloat(formatFloat(document.getElementById("AFTERINT").value));}
    catch(e){
    }
    try{
     total=total+parseFloat(formatFloat(document.getElementById("AFTERWHL").value));}
    catch(e){
    }
    
   document.getElementById("AFTERTOT").value=formatCCY(""+total);
   //document.getElementById("E01PENTOT").value=formatCCY(""+totalCancel);
  }   
  
  function GetTotalRen(){
 
 	var total;
  	var capital;
  	var intereses;
  	var taxes;
  	
  		try{
     		capital= parseFloat(formatFloat(document.getElementById("E01DEAMEP").value));}
    	catch(e){
     		capital=0.00;
    	}
    	try{
     		intereses= parseFloat(formatFloat(document.getElementById("E01DEAMEI").value));}
    	catch(e){
     		intereses=0.00;
    	}
    	try{
     		taxes= parseFloat(formatFloat(document.getElementById("E01DEAWHL").value));}
    	catch(e){
     		taxes=0.00;
    	}
    	total = capital + intereses - taxes;
    	
    	try{
     		total= parseFloat(formatFloat(document.getElementById("E01DEATOT").value));}
    	catch(e){
     		total=0.00;
    	}
    	
    	if(getElement("E01OPTION").value == "2"){
    		total = capital;
    	}
    	
    	return total;
 
 }
  
  
  function chgConcept(val){
  
  	document.getElementById('E01OPTION').value=val;
	document.getElementById("cap").style.display = 'none';
	document.getElementById("int").style.display = 'none';
	UpdateFrac();
	
	if (getElement("E01OPTION").value == ("2")) {					
		document.getElementById("int").style.display = 'block';
		UpdateFrac();
	} else if(getElement("E01OPTION").value == ("3")) {
		document.getElementById("cap").style.display = 'block';
		var elements = document.getElementsByName('CE01FLGFRC');
		for (var i=0;i<elements.length;i++) {
  			if(elements[i].value == "N") {
    			elements[i].checked = true;
    			chgFrac("N");
 			 }
		}
	} else if(getElement("E01OPTION").value == ("4") || getElement("E01OPTION").value == ("5")) {
		document.getElementById("cap").style.display = 'block';
		document.getElementById("int").style.display = 'block';
		var elements = document.getElementsByName('CE01FLGFRC');
		for (var i=0;i<elements.length;i++) {
  			if(elements[i].value == "N") {
    			elements[i].checked = true;
    			chgFrac("N");
 			 }
		}
	}
}

 function chgFrac(val){
  
  	document.getElementById('E01FLGFRC').value=val;
	document.getElementById("tit").style.display = 'none';
	if (getElement("E01OPTION").value != "1" && getElement("E01OPTION").value != "2"
		&& val == "Y") {
		alert("Opcion NO Valida para el Tipo de Renovación seleccionado!");
		var elements = document.getElementsByName('CE01FLGFRC');
		for (var i=0;i<elements.length;i++) {
  			if(elements[i].value == "N") {
    			elements[i].checked = true;
 			 }
		}
		return;
	}
	if (getElement("E01FLGFRC").value == ("Y")) {					
		document.getElementById("tit").style.display = 'block';
		document.getElementById("spTotal").innerHTML = formatCCY(""+GetTotalRen());
	} 
}

 
function UpdateFrac() {
	
	var total = 0.00;	
    var totalList = 0.00;	
  	var ntotal = 0.00;
  	var elem;
  	var elemcun;
  	var amount = 0.00;
  
    for (var i = 1; i <= 5; i++){
    	elemcun = "E01NEWCU"+i;	
    	if(document.getElementById(elemcun).value != "" && document.getElementById(elemcun).value != "0"){
    		elem = "AMOUNT"+i;
    		try{
				amount = parseFloat(formatFloat(document.getElementById(elem).value));
			}catch(e){
        		amount=0.00;
    		}
    		totalList = totalList + amount;  	
    	}
	}
   
    total = GetTotalRen() - totalList;
    total = total.toFixed(2);
	
    // Aquí valido si hay un valor previo, si no hay datos, le pongo un cero "0".
   total = (total == null || total == undefined || total == "") ? 0.00 : total;
	
    /* Esta es la suma. */
   if (total < 0){
		alert("Monto Apertura mayor a Disponible para Fraccionamiento!");
		return;
	}
    // Colocar el resultado de la suma en el control "span".
    document.getElementById('spTotal').innerHTML = formatCCY(""+total);
    
}

function GoSubmit(){
	

	if(getElement("E01FLGFRC").value == "Y"){ 
		var total = 0.00;	
    	var totalList = 0.00;	
  		var ntotal = 0.00;
  		var elem;
  		var elemcun;
  		var amount = 0.00;
    	
    	for (var i = 1; i <= 5; i++){
    	  elemcun = "E01NEWCU"+i;	
    	  if(document.getElementById(elemcun).value != "" && document.getElementById(elemcun).value != "0"){	
    		elem = "AMOUNT"+i;
    		try{
				amount = parseFloat(formatFloat(document.getElementById(elem).value));
			}catch(e){
        		amount=0.00;
    		}
    		totalList = totalList + amount; 
    	  }	 	
		}
    
   		 total = GetTotalRen() - totalList;
		 total = total.toFixed(2);
		 
   		 total = (total == null || total == undefined || total == "") ? 0.00 : total;
	
   		if (total < 0){
   			alert("Monto Apertura mayor a Disponible para Fraccionamiento!");
			return;
   		}else if(total > 0){
   			
			alert("Saldo Para Fraccionamiento es Mayor que Cero!");
			return;
   	   	}
   	 }	
   	 document.forms[0].submit();
}

 function finish(){
 	document.getElementById('SCREEN').value = 1;
 	document.forms[0].submit();
 }
</SCRIPT>

<body>

<H3 align="center">Renovación de Certificados de Depósito
<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="cd_renova.jsp, EDL2090" width="35" height="35"> </H3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.timedeposits.JSEDL2090">
  <INPUT TYPE=HIDDEN NAME="SCREEN" id="SCREEN" VALUE="4">
  <INPUT TYPE=HIDDEN NAME="opt" id="opt" VALUE="1">
  <INPUT TYPE=HIDDEN NAME="E01DEABNK" id="E01DEABNK" VALUE="<%= entity.getE01DEABNK().trim()%>">
  <input type=HIDDEN name="E01DEAACD" id="E01DEAACD" value="<%= entity.getE01DEAACD().trim()%>">
  <INPUT TYPE=HIDDEN NAME="E01FLGIDB" id="E01FLGIDB" VALUE="N">
  <INPUT TYPE=HIDDEN NAME="E01BASIMP" id="E01BASIMP">
  <INPUT TYPE=HIDDEN NAME="E01DEAEXR" id="E01DEAEXR">
  <INPUT TYPE=HIDDEN NAME="E01TRNVDM" id="E01TRNVDM">
  <INPUT TYPE=HIDDEN NAME="E01TRNVDD" id="E01TRNVDD">
  <INPUT TYPE=HIDDEN NAME="E01TRNVDY" id="E01TRNVDY">
  <INPUT TYPE=HIDDEN NAME="AFTERPRI" id="AFTERPRI">
  <INPUT TYPE=HIDDEN NAME="AFTERREA" id="AFTERREA">
  <INPUT TYPE=HIDDEN NAME="AFTERINT" id="AFTERINT">
  <INPUT TYPE=HIDDEN NAME="AFTERWHL" id="AFTERWHL">
  <INPUT TYPE=HIDDEN NAME="AFTERTOT" id="AFTERTOT">
   <input type="hidden" name="E01OPTION" id="E01OPTION" value="<%= entity.getE01OPTION()%>" >
    <input type="hidden" name="E01FLGFRC" id="E01FLGFRC" value="<%= entity.getE01FLGFRC()%>" >

  
  <table class="tableinfo">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
          <tr id="trdark"> 
            <td nowrap width="16%" > 
              <div align="right"><b>Cliente :</b></div>
            </td>
            <td nowrap width="20%" > 
              <div align="left">
                <input type="text" size="10" maxlength="9" name="E01DEACUN" value="<%= entity.getE01DEACUN().trim()%>" readonly>
              </div>
            </td>
            <td nowrap width="16%" > 
              <div align="right"><b>Nombre :</b></div>
            </td>
            <td nowrap colspan="3" > 
              <div align="left">
                <input type="text" size="45" maxlength="45" name="E01CUSNA1" value="<%= entity.getE01CUSNA1().trim()%>" readonly>
              </div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="16%"> 
              <div align="right"><b>Certificado :</b></div>
            </td>
            <td nowrap width="20%"> 
              <div align="left">
                <input type="text" size="13" maxlength="12" name="E01DEAACC" value="<%= entity.getE01DEAACC().trim()%>" readonly>
              </div>
            </td>
            <td nowrap width="16%"> 
              <div align="right"><b>Moneda : </b></div>
            </td>
            <td nowrap width="16%"> 
              <div align="left"><b> 
                <input type="text" name="E01DEACCY" size="3" maxlength="3" value="<%= entity.getE01DEACCY().trim()%>" readonly>
                </b> </div>
            </td>
            <td nowrap width="16%"> 
              <div align="right"><b>Producto : </b></div>
            </td>
            <td nowrap width="16%"> 
              <div align="left"><b>
                <input type="text" size="4" maxlength="4" name="E01DEAPRO" value="<%= entity.getE01DEAPRO().trim()%>" readonly>
                </b> </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  
  <% if(isInquery){ %>

<h4>Renovación en Aprobación</h4>
 
<table class="tableinfo">
  <tr > 
    <td> 
      <p align="center">La renovación del Certificado de Deposito n&uacute;mero <b><%= datapro.eibs.master.Util.justifyRight(entity.getE01DEAACC(),12)%></b> 
        ha sido satisfactoriamente procesada y enviada a aprobación..
      </p>
   
    </td>
  </tr>
  <tr > 
    <td><p> Los nuevos Certificados son :</p></td>
  </tr>
  <tr>
  
  <table  id="mainTable" class="tableinfo" style="height:100px;">
    <tr  height="5%"> 
      <td NOWRAP valign="top" width="100%"> 
		<table id="headTable" width="98%">
			<tr id="trdark">
            <th align=center nowrap width="10%"> Certificado</th>
            <th align=center nowrap width="10%"> Cliente</th>
            <th align=center nowrap width="50%"> Nombre</th>
            <th align=center nowrap width="30%"> Monto Apertura</th>
		</tr>
        </table>
      </td>
    </tr>    
  	<% if (emptyListFr) { %>
      <tr id="dataTable"> 
		<TD ALIGN="CENTER" nowrap width="35%" style="color:#d0122c" colspan="5">
			<br><br><br><br> <font size=3>No hay Renovaciones para el Certificado Origen.</font>
		</TD>          
	 </tr>
	 <% } else {%>     
    
		 <tr  height="95%">    
		    <td nowrap="nowrap">      
		       <div id="dataDiv1" style="height:98px; overflow:auto;"> 
		       <table id="datos" cellspacing="0" cellpadding="1" border="0" width="100%">  
          <%
    	  int i = 0;
          EDL209002List.initRow();
				boolean firstTime = true;
				String chk = "";
          while (EDL209002List.getNextRow()) {
					if (firstTime) {
						firstTime = false;
						chk = "checked";
					} else {
						chk = "";
					}
            EDL209002Message msgList = (EDL209002Message) EDL209002List.getRecord();
            	 
			i++;
			
         %>   
			<tr id="dataTable<%= EDL209002List.getCurrentRow() %>">
				<td NOWRAP  align='left' width="10%"> <%= msgList.getE02FRCACC()%> </td>
	            <td NOWRAP  align='center' width="10%"> <%= msgList.getE02FRCCUN() %> </td>
	            <td NOWRAP  align='center' width="50%"> <%= msgList.getE02FRCNA1()%> </td>
	            <td NOWRAP  align='center' width="30%"> <%= msgList.getE02FRCAMT()%> </td>
	          </tr>
	        <% 
	           }%> 
	             </table>
	        	</div>
	    	</td>
		</tr>
	<% } %>
</table>
  
  </tr>
  
</table>


<%} %>
  
  <h4>Informaci&oacute;n Financiera</h4>
  
  <%int row = 0; %>
<TABLE class="tableinfo">
	<TBODY>
    	<TR> 
        	<TD nowrap> 
            	<TABLE cellspacing="2" cellpadding="2" width="100%" border="0">
                <TBODY>
                	<tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
                    	<TD nowrap width="20%"> 
              				<DIV align="center"></DIV>
            			</TD>
            			<TD nowrap width="40%" > 
              				<DIV align="left"><B>Valores al Ultimo Cierre</B></DIV>
            			</TD>
          			</TR>
					
					<tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
			          <TD nowrap> 
			            <DIV align="right">Saldo de Principal :</DIV>
			          </TD>
			          <TD nowrap align="left">
			           <INPUT type="text" name="E01DEAMEP" id="E01DEAMEP"  class="txtright" size="23" maxlength="13" value="<%= Util.formatCCY(entity.getE01DEAMEP())%>" readonly></TD>
			        </tr>
			        
		          <%if(entity.getH01FLGWK3().equals("R")){%>
		          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
		            <td nowrap> 
		              <div align="right">Saldo de Reajuste :</div>
		            </td>
		            <td nowrap align="left"> 
		              <input type="text" class="txtright" name="E01DEAREA" id="E01DEAREA" size="23" maxlength="15" value="<%= entity.getE01DEAREA().trim()%>" readonly>
		            </td>
		          </tr> 
		           <%}%>
          
		          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
		            <TD nowrap> 
		              <DIV align="right">Saldo de Interés :</DIV>
		            </TD>
		            <TD nowrap align="left">
		            <INPUT type="text" name="E01DEAMEI" id="E01DEAMEI" class="txtright" size="23" maxlength="13" value="<%= Util.formatCCY(entity.getE01DEAMEI())%>" readonly></TD>
		          </TR>
		          
		          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
		            <TD nowrap> 
		              <DIV align="right">Impuestos :</DIV>
		            </TD>
		            <TD nowrap align="left">
		              <INPUT type="text" name="E01TRNTAX" id="E01TRNTAX" class="txtright" size="23" maxlength="13" value="<%= Util.formatCCY(entity.getE01TRNTAX())%>" readonly></TD>
		          </TR>
          
		          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
		            <TD nowrap> 
		              <DIV align="right">Total :</DIV>
		            </TD>
		            <TD nowrap align="left"><INPUT type="text"  class="txtright" name="E01DEATOT" id="E01DEATOT" size="23" maxlength="13" value="<%= Util.formatCCY(entity.getE01DEATOT())%>" readonly></TD>
		          </TR>
           	</TBODY>
        </TABLE>

	<%if(entity.getH01FLGWK3().equals("R")){%>

        <TABLE cellspacing="2" cellpadding="2" width="100%" border="0">
           <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
             <TD nowrap width="16%"> 
              <DIV align="right">Fecha de Ultimo C&aacute;lculo :</DIV>
             </TD>
             <TD nowrap width="17%">  
				<eibsinput:date name="entity" fn_month="E01DEALCM" fn_day="E01DEALCD" fn_year="E01DEALCY" readonly="true" /> 
            </TD>
             <TD nowrap width="16%"> 
              <DIV align="right">Tasa Interés :</DIV>
             </TD>
             <TD nowrap width="16%">  
              <INPUT type="text" name="E01DEARTE" size="11" maxlength="11" value="<%= entity.getE01DEARTE().trim()%>" readonly>
             </TD>
             <TD nowrap width="16%"> 
              <DIV align="right">Días Interés :</DIV>
             </TD>
             <TD nowrap width="16%">  
              <INPUT type="text" name="E01INTDYS" size="3" maxlength="3" value="<%= entity.getE01INTDYS().trim()%>" readonly>
             </TD>
           </TR>
        </TABLE>
	<%}%>

      </TD>
    </TR>
  </TBODY>
</TABLE>
<h4> Tipos de Renovación</h4>
<TABLE class="tableinfo">
	<TBODY>
    	<TR> 
        	<TD nowrap> 
            	<TABLE cellspacing="2" cellpadding="2" width="100%" border="0">
                <TBODY>
                	<tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
                    	<TD nowrap width="20%"> 
              				<DIV align="center">Renovación del Capital + Intereses : </DIV>
            			</TD>
            			<TD nowrap width="40%" > 
            				<input type="radio" name="CE01OPTION" value="1" onClick="chgConcept('1')" <%if (entity.getE01OPTION().equals("1")) out.print("checked");  %> />
            			</TD>
          			</TR>
					
					<tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
                    	<TD nowrap width="20%"> 
              				<DIV align="center">Renovación del Capital y Pago de Intereses : </DIV>
            			</TD>
            			<TD nowrap width="40%" > 
              				<input type="radio" name="CE01OPTION" value="2" onClick="chgConcept('2')" <%if (entity.getE01OPTION().equals("2")) out.print("checked"); %>/>
            			</TD>
          			</TR>
			        
		          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
                    	<TD nowrap width="20%"> 
              				<DIV align="center">Renovación del Capital + Intereses con <b>Aumento</b> de Capital : </DIV>
            			</TD>
            			<TD nowrap width="40%" > 
              				<input type="radio" name="CE01OPTION" value="3" onClick="chgConcept('3')" <%if (entity.getE01OPTION().equals("3")) out.print("checked"); %>/>
            			</TD>
          			</TR>
          
		         <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
                    	<TD nowrap width="20%"> 
              				<DIV align="center">Renovación con <b>Disminución</b> de Capital actual y Pago de Intereses : </DIV>
            			</TD>
            			<TD nowrap width="40%" > 
              				<input type="radio" name="CE01OPTION" value="4" onClick="chgConcept('4')" <%if (entity.getE01OPTION().equals("4")) out.print("checked"); %>/>
            			</TD>
          			</TR>
		          
		          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
                    	<TD nowrap width="20%"> 
              				<DIV align="center">Renovación con <b>Aumento</b> de Capital y Pago de Intereses : </DIV>
            			</TD>
            			<TD nowrap width="40%" > 
              				<input type="radio" name="CE01OPTION" value="5" onClick="chgConcept('5')" <%if (entity.getE01OPTION().equals("5")) out.print("checked"); %>/>
            			</TD>
          			</TR>
          
		          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
                    	<TD nowrap width="20%"> 
              				<DIV align="center">Constitución varios CDTs : </DIV>
            			</TD>
            			<TD nowrap width="40%" > 
            				Si :
              				<input type="radio" name="CE01FLGFRC" value="Y" onClick="chgFrac('Y')" <%if (entity.getE01FLGFRC().equals("Y")) out.print("checked"); %>/>
              				No : 
              				<input type="radio" name="CE01FLGFRC" value="N" onClick="chgFrac('N')" <%if (entity.getE01FLGFRC().equals("N")) out.print("checked"); %> />
            			</TD>
          			</TR>
           	</TBODY>
        </TABLE>
      </TD>
    </TR>
  </TBODY>
</TABLE>
<br>


<div id="tit">
<P>
<table class="tbenter">
<tr>
  <TD>   
   <b>FRACCIONAMIENTO del Certificado</b>
  </TD>
  <TD>
   <div><b><font color="#ff6600">Saldo Disponible para Fraccionamiento:</font> <span id="spTotal"></span></b></div>
  
   </TD>
  </tr>
</table>
<br>
  <table  id="mainTable" class="tableinfo" style="height:100px;">
    <tr  height="5%"> 
      <td NOWRAP valign="top" width="100%"> 
		<table id="headTable" width="98%">
			<tr id="trdark">
            <th align=center nowrap width="10%"> Cliente</th>
            <th align=center nowrap width="10%"> Identificacion</th>
            <th align=center nowrap width="50%"> Nombre</th>
            <th align=center nowrap width="30%"> Monto Apertura</th>
		</tr>
        </table>
      </td>
    </tr>    
  	
		 <tr  height="95%">    
		    <td nowrap="nowrap">      
		       <div id="dataDiv1" style="height:98px; overflow:auto;"> 
		       <table id="datos" cellspacing="0" cellpadding="1" border="0" width="100%">  
          <%
    	  for(int i=1;i<=5;i++){
			
         %>   
			<tr id="dataTable<%= i %>">
				<td NOWRAP  align='center' width="10%">
				<%= i %>
					<input type="text" name=<%="E01NEWCU"+i%> size="9" id=<%="E01NEWCU"+i%> onKeypress="enterInteger(event)" onchange="UpdateFrac();"
						class="context-menu-help" onmousedown="init(custdescidHelp,this.name,'','','<%="E01NEWNA"+i%>','<%="E01NEWID"+i%>','')" onKeyPress="enterInteger(event)"/>
				 </td>
				<td NOWRAP  align='center' width="10%"> <input type="text" name=<%="E01NEWID"+i%> size="15" readonly/> </td>
				<td NOWRAP  align='center' width="55%"> <input type="text" name=<%="E01NEWNA"+i%> size="60" readonly/> </td>
	            <td NOWRAP  align='center' width="30%"> <input type ="text" name=<%="AMOUNT"+i %> id =<%="AMOUNT"+i %> size="16" maxlength="15" onchange="UpdateFrac();" > </td>
	          </tr>
	        
	        <% 
	           }%> 
	             </table>
	        	</div>
	    	</td>
		</tr>
</table>
<br>
</div>


<div id="cap">
<P>
<table class="tbenter">
<tr>
  <TD>   
   <b>Datos de la Transacci&oacute;n CAPITAL</b>
  </TD>
  <TD>
   <!--<b>PreCancelar </b><input type="checkbox" name="PRECANCEL" value="" onclick="showCancelData(this)">    
  --></TD>
  </tr>
</table>
<table class="tbenter" cellpadding=3>
<tr>
 <TD valign=top>
  <h4>A Pagar</h4>
  <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing=0 cellpadding=2 width="100%" border="0">
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap width="40%"> 
              <div align="right">Monto Capital :</div>
            </td>
            <td nowrap width="60%"> 
              <input type="text" name="E01TRNPRI" id="E01TRNPRI" size="15" maxlength="15" value="<%= entity.getE01TRNPRI().trim()%>" onKeypress="enterDecimal(event, 2)"
                onChange="Recalculate()" onblur="verifyNum(this)">
            </td>
          </tr>
          
        </table>
       </td>
      </tr>
    </table>
  </TD>
 </tr>
 </table> 
  
  <h4>Forma de Pago</h4>
  <TABLE id="mainTable" class="tableinfo">
  <TR><TD>

    <table class="tableinfo" style="filter:''" >
    <tr id="trdark"> 
      <td nowrap align="center" width="40%">Concepto</td>
      <td nowrap align="center" width="10%">Banco </td>
      <td nowrap align="center" width="10%">Sucursal</td>
      <td nowrap align="center" width="10%">Moneda</td>
      <td nowrap align="center" width="30%">Referencia</td>
    </tr>
    </table> 
      
     <div id="dataDiv"> 
     <table class="tableinfo" style="filter:''" >
          <%
  				   int amount = 1;
  				   String name;
  					for ( int i=1; i<=amount; i++ ) {
   					  name = i + "";
   			%> 
          
          <tr id="trclear"> 
            <td nowrap width="40%"> 
              <div align="center"> 
                <input type="text" name="E01OFFOP<%= name %>" id="E01OFFOP<%= name %>" value="<%= entity.getField("E01OFFOP"+name).getString().trim()%>" size="3" maxlength="3" >
                <input type="hidden" name="E01OFFGL<%= name %>" value="<%= entity.getField("E01OFFGL"+name).getString().trim()%>">
                <input type="text" name="E01OFFCO<%= name %>" size="45" maxlength="45" readonly value="<%= entity.getField("E01OFFCO"+name).getString().trim()%>"  
                  class="context-menu-help" onmousedown="init(conceptHelp,this.name,document.forms[0].E01DEABNK.value,document.forms[0].E01OFFCY<%= name %>.value,'E01OFFGL<%= name %>','E01OFFOP<%= name %>',document.forms[0].E01DEAACD.value,'04')">
              </div>
            </td>
            <td nowrap width="10%"> 
              <div align="center"> 
                <input type="text" name="E01OFFBK<%= name %>" size="2" maxlength="2" value="<%= entity.getField("E01OFFBK"+name).getString().trim()%>" readonly>
              </div>
            </td>
            <td nowrap width="10%"> 
              <div align="center"> 
                <input type="text" name="E01OFFBR<%= name %>" size="4" maxlength="4" value="<%= entity.getField("E01OFFBR"+name).getString().trim()%>" 
                class="context-menu-help" onmousedown="init(branchHelp,this.name,document.forms[0].E01DEABNK.value,'','','','')">
              </div>
            </td>
            <td nowrap width="10%"> 
              <div align="center"> 
                <input type="text" name="E01OFFCY<%= name %>" size="3" maxlength="3" value="<%= entity.getField("E01OFFCY"+name).getString().trim()%>" 
                class="context-menu-help" onmousedown="init(currencyHelp,this.name,document.forms[0].E01DEABNK.value,'','','','')">
              </div>
            </td>
            <td nowrap width="40%"> 
              <div align="center"> 
                <input type="text" name="E01OFFAC<%= name %>" id="E01OFFAC<%= name %>" size="12" maxlength="12"  value="<%= entity.getField("E01OFFAC"+name).getString().trim()%>"
                 class="context-menu-help" onmousedown="init(accountHelp,this.name,document.forms[0].E01DEABNK.value,'','','','RM')">
              </div>
            </td>
           </tr>
          <%
    		}
    		%> 
    	  </table>
        </div>
    
</TD>  
</TR>	
</TABLE>
   
</div>
 
 <div id="int">
 
<P>
<table class="tbenter">
<tr>
  <TD>   
   <b>Datos de la Transacci&oacute;n INTERESES</b>
  </TD>
  <TD>
  </TD>
  </tr>
</table>
<table class="tbenter" cellpadding=3>
<tr>
 <TD valign=top>
  <h4>A Pagar</h4>
  <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing=0 cellpadding=2 width="100%" border="0">
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap width="40%"> 
              <div align="right"> Saldo Intereses :</div>
            </td>
            <td nowrap width="60%"> 
              <input type="text" name="E01TRNINT" id="E01TRNINT" size="15" maxlength="15" value="<%= entity.getE01TRNINT().trim()%>" onKeypress="enterDecimal(event, 2)"
                readonly onblur="verifyNum(this)">
            </td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap width="40%"> 
              <div align="right"> Impuestos :</div>
            </td>
            <td nowrap width="60%"> 
              <input type="text" name="E01DEAWHL" id="E01DEAWHL" size="15" maxlength="15" value="<%= entity.getE01DEAWHL().trim()%>" onKeypress="enterDecimal(event, 2)"
                readonly onblur="verifyNum(this)">
            </td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap width="40%"> 
              <div align="right"> Total a Pagar :</div>
            </td>
            <td nowrap width="60%"> 
              <input type="text" name="E01INTTOT" id="E01INTTOT" size="15" maxlength="15" value="<%= entity.getE01INTTOT().trim()%>" onKeypress="enterDecimal(event, 2)"
                readonly onblur="verifyNum(this)">
            </td>
          </tr>
        </table>
       </td>
      </tr>
    </table>
  </TD>
 </tr>
 </table> 
  
  <h4>Forma de Pago</h4>
  <table class="tableinfo">
    <tr bordercolor="#FFFFFF"> 
      <td> 
   <table class="tableinfo" style="filter:''" >
    <tr id="trdark"> 
      <td nowrap align="center" width="40%">Concepto</td>
      <td nowrap align="center" width="10%">Banco </td>
      <td nowrap align="center" width="10%">Sucursal</td>
      <td nowrap align="center" width="10%">Moneda</td>
      <td nowrap align="center" width="30%">Referencia</td>
    </tr>
    </table> 
      
     <div id="dataDiv1"> 
     <table class="tableinfo" style="filter:''" >
          <%
  				   int amount1 = 2;
  				   String name1;
  					for ( int i=2; i<=amount1; i++ ) {
   					  name1 = i + "";
   			%> 
          
          <tr id="trclear"> 
            <td nowrap width="40%"> 
            
              <div align="center"> 
                <input type="text" name="E01OFFOP<%= name1 %>" id="E01OFFOP<%= name1 %>" value="<%= entity.getField("E01OFFOP"+name1).getString().trim()%>" size="3" maxlength="3">
                <input type="hidden" name="E01OFFGL<%= name1 %>" value="<%= entity.getField("E01OFFGL"+name1).getString().trim()%>">
                <input type="text" name="E01OFFCO<%= name1 %>" size="45" maxlength="45" readonly value="<%= entity.getField("E01OFFCO"+name1).getString().trim()%>" 
                  class="context-menu-help" onmousedown="init(conceptHelp,this.name,document.forms[0].E01DEABNK.value,document.forms[0].E01OFFCY<%= name1 %>.value,'E01OFFGL<%= name1 %>','E01OFFOP<%= name1 %>',document.forms[0].E01DEAACD.value,'04')">
              </div>
            </td>
            <td nowrap width="10%"> 
              <div align="center"> 
                <input type="text" name="E01OFFBK<%= name1 %>" size="2" maxlength="2" value="<%= entity.getField("E01OFFBK"+name1).getString().trim()%>" readonly>
              </div>
            </td>
            <td nowrap width="10%"> 
              <div align="center"> 
                <input type="text" name="E01OFFBR<%= name1 %>" size="4" maxlength="4" value="<%= entity.getField("E01OFFBR"+name1).getString().trim()%>"
                class="context-menu-help" onmousedown="init(branchHelp,this.name,document.forms[0].E01DEABNK.value,'','','','')" >
              </div>
            </td>
            <td nowrap width="10%"> 
              <div align="center"> 
                <input type="text" name="E01OFFCY<%= name1 %>" size="3" maxlength="3" value="<%= entity.getField("E01OFFCY"+name1).getString().trim()%>"
                class="context-menu-help" onmousedown="init(currencyHelp,this.name,document.forms[0].E01DEABNK.value,'','','','')" >
              </div>
            </td>
            <td nowrap width="40%"> 
              <div align="center"> 
                <input type="text" name="E01OFFAC<%= name1 %>" id="E01OFFAC<%= name1 %>" size="12" maxlength="12"  value="<%= entity.getField("E01OFFAC"+name1).getString().trim()%>"
                class="context-menu-help" onmousedown="init(accountHelp,this.name,document.forms[0].E01DEABNK.value,'','','','RM')" >
              </div>
            </td>
          </tr>
          <%
    		}
    		%> 
    	  </table>
        </div>
  </td>
  </tr>
  </table> 
  </div> 

  <SCRIPT language="JavaScript">

   chgConcept(<%=entity.getE01OPTION()%>);  
    chgFrac('<%=entity.getE01FLGFRC()%>');
  
    function tableresize() {
     adjustEquTables(document.getElementById("headTable"), document.getElementById("dataTable"), document.getElementById("dataDiv"), 0, true);
   }
  tableresize();
  window.onresize=tableresize;


  </SCRIPT>
  
  <div align="center"> 
    <input id="EIBSBTN" type="button" name="Submit" value="Enviar" onclick="GoSubmit()">
  </div>

</form>
</body>
</html>
