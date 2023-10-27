<%@ page import = "datapro.eibs.master.Util" %>
<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@ page import="com.datapro.constants.EibsFields"%>
<%@ page import = "datapro.eibs.master.Util" %>
<%@page import="com.datapro.eibs.constants.HelpTypes"%>

<html>
<head>
<title>Cambio de Tasa</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/jquery/plugins/contextMenu/css/jquery.contextMenu.css" rel="stylesheet" type="text/css" />

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>


<jsp:useBean id= "data" class= "datapro.eibs.beans.EPV015601Message"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />

<script type="text/javascript">
<%if(userPO.getPurpose().equalsIgnoreCase("APPROVAL_INQ")){ %>
   builtNewMenu(pv_a_opt);
<%}else if(userPO.getPurpose().equalsIgnoreCase("confirmation")){ %>

<%}else{%>
   builtNewMenu(ln_a_opt);
<%}%>

</SCRIPT>

<script type="text/javascript">

function rateDisplay(){
		if((getElement("E01NEWFTB").value == null) || (getElement("E01NEWFTB").value.trim() == "")){ 
			document.getElementById("FLOATINGTABLE").style.display = 'none';
			document.getElementById("FLOATINGTABLE2").style.display = 'none';
		}else if( (getElement("E01FLGFLT").value != null) && (parseInt(getElement("E01FLGFLT").value) == 2) ){
			document.getElementById("FLOATINGTABLE").style.display = 'table-row';
			document.getElementById("FLOATINGTABLE2").style.display = 'table-row';
		/* 	getElement("E01NEWRTE").readOnly = true;  */	
		}else{
			document.getElementById("FLOATINGTABLE").style.display = 'none';
			document.getElementById("FLOATINGTABLE2").style.display = 'none';
		/* getElement("E01NEWRTE").readOnly = false; */
		}
		changeTRClass(); 	
		
		if("FS" == getElement("E01NEWFTY").value && (parseInt(getElement("E01FLGFLT").value) == 2)){
			getElement("E01FLTORG").value = getElement("SECONDARYRATE").value;
		}else if ("FP" == getElement("E01NEWFTY").value && (parseInt(getElement("E01FLGFLT").value) == 2)){
			getElement("E01FLTORG").value = getElement("PRIMARYRATE").value;
		}else if ("FS" == getElement("E01NEWFTY").value && (parseInt(getElement("E01FLGFLT").value) != 2)){
			getElement("E01NEWFRT").value = getElement("SECONDARYRATE").value;
		}else{
			getElement("E01NEWFRT").value = getElement("PRIMARYRATE").value;
		}
}

var TRCLASScounter = 0;
var orgTRCLEAR ;
var orgTRDARK ;

function changeTRClass(){
	var testClear = document.getElementsByClassName('trclear');
	var testDark  = document.getElementsByClassName('trdark');
	if( TRCLASScounter <1){
		orgTRCLEAR = Array.prototype.slice.call(testClear,0);
		orgTRDARK = Array.prototype.slice.call(testDark,0);
	}
	wrkTRCLEAR = orgTRCLEAR.slice();
	wrkTRDARK =  orgTRDARK.slice();
	if( (getElement("E01FLGFLT").value != null) && (parseInt(getElement("E01FLGFLT").value) != 2) ){
		for (var i = 0; i < wrkTRCLEAR.length; ++i){
		   wrkTRCLEAR[i].className = "trdark";	
		}
		for (var i = 0; i < wrkTRDARK.length; ++i){
		   wrkTRDARK[i].className = "trclear";	
		}		
   	}else{
		for (var i = 0; i < wrkTRCLEAR.length; ++i){
		   wrkTRCLEAR[i].className = "trclear";	
		}
		for (var i = 0; i < wrkTRDARK.length; ++i){
		   wrkTRDARK[i].className = "trdark";	
		}		
   	}
   	TRCLASScounter ++;
}

function newTasa(){

	var total = 0.00;
	var rate = 0.00;
	var spread = 0.00;
	var effective = 0.00;
	var fbase = 0.00;
	var adicional = 0.00;
	
	if(getElement("E01NEWFRT").value != null){
		rate = parseFloat((getElement("E01NEWFRT").value));
	}
	
	if(getElement("E01NEWRTE").value != null){
		spread = parseFloat((getElement("E01NEWRTE").value));
	}
	
	if(getElement("E01NEWSPR").value != null){
		effective = parseFloat((getElement("E01NEWSPR").value));
	}
	
	if(getElement("E01DEARTX").value != null){
		fbase = parseFloat((getElement("E01DEARTX").value));
	}
	
	if(getElement("E01FLTORG").value != null){
		adicional = parseFloat((getElement("E01FLTORG").value));
	}
		
	if(getElement("E01FLGFLT").value == 1){
		total = rate + spread;
		
	}else if(getElement("E01FLGFLT").value == 2){
		total = rate + spread;
		
	}else{
		total = rate + spread;
	} 	
	getElement("E01LNSNEW").value = String(total.toFixed(<%=EibsFields.EIBS_FIELD_RATE_LENGTH_PART_DECIMAL%>));
}
</SCRIPT>

</head>

<body onload="rateDisplay(); newTasa();">

<% 
 if ( !error.getERRNUM().equals("0")  ) {
     error.setERRNUM("0");
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
 }

    out.println("<SCRIPT> initMenu(); </SCRIPT>");

%> 

<h3 align="center">Cambio de Tasa<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="ap_cambio_tasa.jsp, EPV0156"></h3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.salesplatform.JSEPV0156">
   <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="200">
   <INPUT TYPE=HIDDEN NAME="E01FLGFLT" id="E01FLGFLT" VALUE="<%=data.getE01FLGFLT().trim()%>">
   
   
  <table class="tableinfo" >
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
          <tr id="trdark"> 
            <td nowrap width="16%" > 
              <div align="right"><b>Cliente :</b></div>
            </td>
            <td nowrap width="20%" > 
              <div align="left"> 
                <input type="text" name="E01DEACUN" size="10" maxlength="9" value="<%= data.getE01DEACUN().trim()%>" readonly>
              </div>
            </td>
            <td nowrap width="16%" > 
              <div align="right"><b>Nombre :</b> </div>
            </td>
            <td nowrap colspan="3" > 
              <div align="left"><font face="Arial"><font face="Arial"><font size="2"> 
                <input type="text" name="E01CUSNA1" size="45" maxlength="45" value="<%= data.getE01CUSNA1().trim()%>" readonly>
                </font></font></font></div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="16%"> 
              <div align="right"><b>Cuenta :</b></div>
            </td>
            <td nowrap width="20%"> 
              <div align="left"> 
                <input type="text" name="E01DEAACC" size="13" maxlength="12" value="<%= data.getE01DEAACC().trim()%>" readonly>
              </div>
            </td>
            <td nowrap width="16%"> 
              <div align="right"><b>Moneda : </b></div>
            </td>
            <td nowrap width="16%"> 
              <div align="left"><b> 
                <input type="text" name="E01DEACCY" size="3" maxlength="3" value="<%= data.getE01DEACCY().trim()%>" readonly>
                </b> </div>
            </td>
            <td nowrap width="16%"> 
              <div align="right"><b>Producto : </b></div>
            </td>
            <td nowrap width="16%"> 
              <div align="left"><b> 
                <input type="text" name="E01DEAPRO" size="4" maxlength="4" value="<%= data.getE01DEAPRO().trim()%>" readonly>
                </b> </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  
<%int row = 0; %>
<br>
 <table class=tbenter>
   <tr > 
     <td nowrap> 
   		<h4>Informaci&oacute;n B&aacute;sica</h4>
      </td>
      <td nowrap align=right> 
   		<b><font color="#ff6600"><%= data.getE01STATUS()%></font></b>
      </td>
    </tr>
  </table>
  
  
  <table class="tableinfo">
    <tr > 
      <td> 
        <table cellspacing=0 cellpadding=2 width="100%" border="0" >
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
          	 <td nowrap width="25%"> 
              <div align="right">Fecha Apertura :</div>
            </td>
            <td nowrap width="25%"> 
            	<eibsinput:date name="data" fn_month="E01DEAODM" fn_day="E01DEAODD" fn_year="E01DEAODY" readonly="true"/>
            </td>
          	 <td nowrap width="25%"> 
              <div align="right">Fecha Vencimiento :</div>
            </td>
            <td nowrap width="25%"> 
            	<eibsinput:date name="data" fn_month="E01DEAMAM" fn_day="E01DEAMAD" fn_year="E01DEAMAY" readonly="true"/>
            </td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
          	 <td nowrap width="25%"> 
              <div align="right">Saldo Principal :</div>
            </td>
            <td nowrap width="25%"> 
            	<eibsinput:text name="data" property="E01SALPRI" type="<%=EibsFields.EIBS_FIELD_TYPE_SIGN_DECIMAL%>" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_AMOUNT %>"  readonly="true"/>
            </td>
            <td nowrap width="25%"> 
              <div align="right">Tabla Tasa Flotante :</div>
            </td>
            <td nowrap width="25%"> 
            	<eibsinput:text name="data" property="E01DEAFTB" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_TABLE %>"  readonly="true"/>
                <select name="E01DEATY" disabled="disabled">
	                <option value=" " <%if (data.getE01DEAFTY().equals(" ")) { out.print("selected"); }%>></option>
	                <option value="FP" <%if (data.getE01DEAFTY().equals("FP")) { out.print("selected"); }%>>Primary</option>
	                <option value="FS" <%if (data.getE01DEAFTY().equals("FS")) {  out.print("selected"); }%>>Secondary</option>
                </select>
            </td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
          	<td nowrap width="25%"> 
              <div align="right">Saldo Interes :</div>
            </td>
            <td nowrap width="25%"> 
            	<eibsinput:text name="data" property="E01SALINT" type="<%=EibsFields.EIBS_FIELD_TYPE_SIGN_DECIMAL%>" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_AMOUNT %>"  readonly="true"/>
            </td>
            <td nowrap width="25%"> 
              <div align="right">Tasa Flotante Rate :</div>
            </td>
            <td nowrap width="25%"> 
            	<eibsinput:text name="data" property="E01DEAFRT" type="<%=EibsFields.EIBS_FIELD_TYPE_SIGN_DECIMAL%>" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_RATE %>"  readonly="true"/>                
            </td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
          	<td nowrap width="25%"> 
              <div align="right">Mora :</div>
            </td>
            <td nowrap width="25%"> 
            	<eibsinput:text name="data" property="E01SALMOR" type="<%=EibsFields.EIBS_FIELD_TYPE_SIGN_DECIMAL%>" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_AMOUNT %>"  readonly="true"/>
            </td>
            <td nowrap width="25%"> 
              <div align="right">Tasa Efectiva :</div>
            </td>
            <td nowrap width="25%"> 
            	<eibsinput:text name="data" property="E01DEASPR" type="<%=EibsFields.EIBS_FIELD_TYPE_SIGN_DECIMAL%>" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_RATE %>"  readonly="true"/>
            </td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
          	<td nowrap width="25%"> 
              <div align="right">Otro Cargos :</div>
            </td>
            <td nowrap width="25%"> 
            	<eibsinput:text name="data" property="E01SALOTH" type="<%=EibsFields.EIBS_FIELD_TYPE_SIGN_DECIMAL%>" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_AMOUNT %>"  readonly="true"/>
            </td>
            <td nowrap width="25%"> 
              <div align="right">Tasa Base/Spread :</div>
            </td>
            <td nowrap width="25%"> 
            	<eibsinput:text name="data" property="E01DEARTE" type="<%=EibsFields.EIBS_FIELD_TYPE_SIGN_DECIMAL%>" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_RATE %>"  readonly="true"/>
            </td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
          	 <td nowrap width="25%"> 
              <div align="right">Total Deuda :</div>
            </td>
            <td nowrap width="25%"> 
            	<eibsinput:text name="data" property="E01SALDUE" type="<%=EibsFields.EIBS_FIELD_TYPE_SIGN_DECIMAL%>" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_AMOUNT %>"  readonly="true"/>
            </td>
            <td nowrap width="25%"> 
              <div align="right">Total Tasa :</div>
            </td>
            <td nowrap width="25%"> 
            	<eibsinput:text name="data" property="E01LNSRTE" type="<%=EibsFields.EIBS_FIELD_TYPE_SIGN_DECIMAL%>" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_RATE %>"  readonly="true"/>
            </td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
          	 <td nowrap width="25%"> 
              <div align="right">Tipo Calculo Interes :</div>
            </td>
            <td nowrap width="25%"> 
                <input type="text" name="E01DEAICT" size="2" maxlength="1" value="<%= data.getE01DEAICT().trim()%>" readonly>
            	<eibsinput:text name="data" property="E01DSCICT" type="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION%>" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true"/>
            </td>
            <td nowrap width="25%"> 
              <div align="right">Periodo Base :</div>
            </td>
            <td nowrap width="25%"> 
            	<eibsinput:text name="data" property="E01DEABAS" type="<%=EibsFields.EIBS_FIELD_TYPE_INTEGER%>" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_INTEGER %>" size ="3" readonly="true"/>
            </td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
          	 <td nowrap width="25%"> 
              <div align="right">Tasa Minima :</div>
            </td>
            <td nowrap width="25%"> 
            	<eibsinput:text name="data" property="E01DEAMXR" type="<%=EibsFields.EIBS_FIELD_TYPE_SIGN_DECIMAL%>" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_RATE %>" readonly="true"/>
            </td>
            <td nowrap width="25%"> 
              <div align="right">Tasa Maxima :</div>
            </td>
            <td nowrap width="25%"> 
            	<eibsinput:text name="data" property="E01DEAMIR" type="<%=EibsFields.EIBS_FIELD_TYPE_SIGN_DECIMAL%>" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_RATE %>" readonly="true"/>
            </td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
			<td nowrap width=25%>
				<div align="right">Acci&oacute;n por Cambio de Tasa :</div>
			</td>
			<td nowrap width="25%">
				<select name="E01DEAXRF" disabled="disabled" >
					<option value=""></option>
						<option value="T" <%if (data.getE01DEAXRF().equals("T")) { out.print("selected"); }%>>Cambiar el Plazo</option>
						<option value="P" <%if (data.getE01DEAXRF().equals("P")) { out.print("selected"); }%>>Cambiar la Cuota</option>
				</select>
			</td>
            <td nowrap width="25%" >
            </td>
            <td nowrap width="25%"> 
            </td>
          </tr>
        </table>                       
      </td>
    </tr>
  </table>
  
<h4>Nueva Tasa</h4>
  <table class="tableinfo">
    <tr > 
      <td> 
        <table cellspacing=0 cellpadding=2 width="100%" border="0" >
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
          	<td nowrap width="25%"> 
              <div align="right">Fecha Valor :</div>
            </td>
            <td nowrap width="25%"> 
            	<eibsinput:date name="data" fn_month="E01DEAVDM" fn_day="E01DEAVDD" fn_year="E01DEAVDY" readonly="true"/>
            </td>
          	<td nowrap width="25%"> 
              <div align="right">Tabla Tasa Flotante :</div>
            </td>
            <td nowrap width="25%">      
            	<eibsinput:help name="data" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_BANK%>" 
            	                fn_param_one="E01NEWFTB" 
            	                fn_param_two="E01FLGFLT" 
            	                fn_param_three="E01FLTDSC" 
            	                fn_param_four="PRIMARYRATE" 
            	                fn_param_five="SECONDARYRATE" 
            	                fn_param_six="E01NEWFTY" 
            	                property="E01NEWFTB" help="<%=HelpTypes.FLOATING_RATE_TABLES%>" readonly="true"/>       	
                <select name="E01NEWFTY" disabled="disabled">
	                <option value=" " <%if (data.getE01NEWFTY().equals(" ")) { out.print("selected"); }%>></option>
	                <option value="FP" <%if (data.getE01NEWFTY().equals("FP")) { out.print("selected"); }%>>Primary</option>
	                <option value="FS" <%if (data.getE01NEWFTY().equals("FS")) {  out.print("selected"); }%>>Secondary</option>
                </select>
            </td>
          </tr>
          <tr id="FLOATINGTABLE2" class="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>" style="display: none">
            <td> 
              <div align="right">Descripcion Tabla Flotante :</div>
            </td>
            <td nowrap width="25%"> 
            	<eibsinput:text property="E01FLTDSC" name="data" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_NAME%>" readonly="true" />  
            </td>
            <td> 
              <div align="right">Tasa Flotante Base :</div>
            </td>
            <td nowrap width="25%">
				<%if(data.getE01FLGFLT().equals("2")){%>
  					<INPUT TYPE=HIDDEN NAME="PRIMARYRATE" id="PRIMARYRATE" VALUE="<%=data.getE01FLTORG().trim()%>">
			  		<INPUT TYPE=HIDDEN NAME="SECONDARYRATE" id="SECONDARYRATE" VALUE="<%=data.getE01FLTORG().trim()%>">
			  	<%}else{%>
  					<INPUT TYPE=HIDDEN NAME="PRIMARYRATE" id="PRIMARYRATE" VALUE="<%=data.getE01NEWFRT().trim()%>">
			  		<INPUT TYPE=HIDDEN NAME="SECONDARYRATE" id="SECONDARYRATE" VALUE="<%=data.getE01NEWFRT().trim()%>">
			  	<%}%>
            	<eibsinput:text property="E01FLTORG" name="data" type="<%=EibsFields.EIBS_FIELD_TYPE_SIGN_DECIMAL%>" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_RATE %>" readonly="true" />
            </td>
          </tr>
          <tr id="FLOATINGTABLE" class="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>" style="display: none"> 
            <td> 
              <div align="right">Manejo Puntos Adicional  :</div>
            </td>
            <td nowrap width="25%" > 
	             <select name="E01DEAFLX" disabled="disabled" >
	              <OPTION value=" " <% if (!(data.getE01DEAFLX().equals("B") ||data.getE01DEAFLX().equals("E")||data.getE01DEAFLX().equals("N"))) out.print("selected"); %>></OPTION>
	              <OPTION value="B" <% if(data.getE01DEAFLX().equals("B")) out.print("selected");%>>+/- Tasa Base</OPTION>
	              <OPTION value="E" <% if(data.getE01DEAFLX().equals("E")) out.print("selected");%>>+/- Tasa Efectiva</OPTION>
	              <OPTION value="N" <% if(data.getE01DEAFLX().equals("N")) out.print("selected");%>>+/- Tasa Nominal</OPTION>
	             </select>
	      	</td>
	      	<td> 
              <div align="right">Valor Tasa Adicional :</div>
            </td>
            <td nowrap width="25%"> 
            	<eibsinput:text property="E01DEARTX" name="data" type="<%=EibsFields.EIBS_FIELD_TYPE_SIGN_DECIMAL%>" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_RATE %>" readonly="true"/>
            </td>
	      </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
	         <td nowrap width="25%"> 
               <div align="right">Tasa Efectiva :</div>
             </td>
             <td nowrap width="25%">               	
            	<eibsinput:text name="data" property="E01NEWSPR" type="<%=EibsFields.EIBS_FIELD_TYPE_SIGN_DECIMAL%>" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_RATE %>" readonly="true"/>               
             </td>
          	 <td nowrap width="25%"> 
              <div align="right">Tasa Flotante Rate :</div>
            </td>
            <td nowrap width="25%"> 
            	<eibsinput:text name="data" property="E01NEWFRT" type="<%=EibsFields.EIBS_FIELD_TYPE_SIGN_DECIMAL%>" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_RATE %>"  readonly="true"/>
            </td>          	 
          </tr>           
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
          	 <td nowrap width="25%"> 
              <div align="right">Tasa Base/Spread :</div>
            </td>
            <td nowrap width="25%">               	
            	<eibsinput:text name="data" property="E01NEWRTE" type="<%=EibsFields.EIBS_FIELD_TYPE_SIGN_DECIMAL%>" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_RATE %>"  readonly="true"/>
            </td>
            <td nowrap width="25%"> 
              <div align="right">Nueva Tasa :</div>
            </td>
            <td nowrap width="25%"> 
            	<eibsinput:text name="data" property="E01LNSNEW" type="<%=EibsFields.EIBS_FIELD_TYPE_SIGN_DECIMAL%>" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_RATE %>"  readonly="true"/>
            </td>
          </tr>

        </table>                       
      </td>
    </tr>
  </table>
  <%if(userPO.getPurpose().equalsIgnoreCase("confirmation")){ %>
  	<div align="center"> 
    	<input id="EIBSBTN" type=submit name="Submit" value="Regresar" onclick="goAction('101')">
    	<input id="EIBSBTN" type=submit name="Submit" value="Enviar" onclick="goAction('100')">
  	</div>
<% } %>
</form>
</body>

<script type="text/javascript">

	function goAction(op){
			getElement('SCREEN').value = op;
			document.forms[0].submit();
	}

</script>

</html>
