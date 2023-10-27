<html>
<head>
<title>Beneficiarios</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">


<jsp:useBean id= "bene" class= "datapro.eibs.beans.ESD000004Message"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/CrossBrowserFunctions.js"> </SCRIPT>

<SCRIPT type="text/javascript">

<%
if ( userPO.getOption().equals("RT") ) {
%>
	builtNewMenu(rt_m_opt);
<%   
}
else if ( userPO.getOption().equals("SV") ) {
%>
	builtNewMenu(sv_m_opt);
<%   
}
%>

 function enterInteger1 (idType) 
 {

 if (idType.value != 'P')
   enterInteger(event);
 
 }

 function joinID(idField, idType, idNum){

	  var strID = "";
	    while ((idNum.value.length < 9) && (idType.value!='P'))
	      idNum.value='0'+idNum.value;
	  strID = trim(idType.value) + trim(idNum.value);
      idField.value=strID.toUpperCase();
}

 function getIdTypeHelp(field){
   // Get the client type selected
   GetCode(field,'STATIC_client_help_id_type.jsp?clientType=PERSONAL');
 }
 
function showIdFields(country,fieldVE,fieldOT,fieldPA){

	if( country == "VENEZUELA" ){
		document.getElementById(fieldVE).style.display='block';
		document.getElementById(fieldOT).style.display='none';
		document.getElementById(fieldPA).style.display='none';
	} else if( country == "PANAMA"){
		document.getElementById(fieldVE).style.display='none';
		document.getElementById(fieldOT).style.display='none';
		document.getElementById(fieldPA).style.display='block';
	} else {
		document.getElementById(fieldVE).style.display='none';
		document.getElementById(fieldOT).style.display='block';
		document.getElementById(fieldPA).style.display='none';
	}

}
function fill0Left(idField){

	  //alert("**idFieldNAME: "+idField.name + " **Longitud: " + idField.value.length + " **MaxLongitud: " + idField.maxLength);
	    while (idField.value.length < idField.maxLength )
	      idField.value='0'+idField.value;	  	 
}
function joinPersonalIDFieldsPA(idField,pid0,pid1,pid2,pid3){

	var IDN2 = document.getElementById(idField);
	var PIDN0 = document.getElementById(pid0);
	var PIDN1 = document.getElementById(pid1);
	var PIDN2 = document.getElementById(pid2);
	var PIDN3 = document.getElementById(pid3);
	
	IDN2.value = PIDN0.value + "-" +
				 PIDN1.value + "-" +
				 PIDN2.value + "-" +
				 PIDN3.value ;
}

function stripZerosAtLeft( valObj ){

	if( valObj.value.trim() != "" && !isNaN(valObj.value) ){
		valObj.value = parseInt(valObj.value , 10) ;
	}

}

</SCRIPT>

</head>

<body bgcolor="#FFFFFF">

<% 
 if ( !error.getERRNUM().equals("0")  ) {
     error.setERRNUM("0");
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
 }
  
    out.println("<SCRIPT> initMenu(); </SCRIPT>");

%>

<h3 align="center">Beneficiarios
	<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="rt_bene.jsp, EDD0000"></h3>
<hr size="4">

<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDD0000" >
<INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="24">  

<table  class="tableinfo">
	<tr bordercolor="#FFFFFF"> 
    	<td nowrap> 
        	<table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
          		<tr id="trdark"> 
            		<td nowrap width="16%" ><div align="right"><b>Cliente :</b></div></td>
            		<td nowrap width="20%" > 
              			<div align="left"><input type="text" name="E02CUN" size="10" maxlength="9" readonly value="<%= userPO.getCusNum().trim()%>"></div>
            		</td>
            		<td nowrap width="16%" ><div align="right"><b>Nombre :</b> </div></td>
            		<td nowrap colspan="3" > 
              			<div align="left"><input type="text" name="E02NA1" size="45" maxlength="45" readonly value="<%= userPO.getCusName().trim()%>"></div>
            		</td>
          		</tr>
          		<tr id="trdark"> 
            		<td nowrap width="16%"><div align="right"><b>Cuenta :</b></div></td>
            		<td nowrap width="20%"> 
              			<div align="left"><input type="text" name="E04ACC" size="13" maxlength="12" value="<%= userPO.getAccNum().trim()%>" readonly></div>
            		</td>
            		<td nowrap width="16%"><div align="right"><b>Moneda : </b></div></td>
            		<td nowrap width="16%"> 
              			<div align="left"><b><input type="text" name="E01DEACCY" size="3" maxlength="3" value="<%= userPO.getCurrency().trim()%>" readonly></b> </div>
            		</td>
            		<td nowrap width="16%"><div align="right"><b>Producto : </b></div></td>
            		<td nowrap width="16%"> 
              			<div align="left"><b><input type="text" name="E02PRO" size="4" maxlength="4" readonly value="<%= userPO.getProdCode().trim()%>"></b> </div>
            		</td>
          		</tr>
        	</table>
      	</td>
	</tr>
</table>

<div id="dataDiv" align="center" style="height:351; overflow-y:scroll; width:90%; padding-left:50; padding-right:10" class="scbarcolor">
<%
	int bene_amount = 10;
  	String name;
  	String ctr = "";
  	String readonly = "";
  	
	//Define variables request
	String country="";  
	String idn="";
	String idn2=null;
	//Define variables de la identificacion Panameña
	String cProvincia="";
	String cLetra="";
	String cFolio="";
	String cAsiento="";
	String rRollo="";
	String rFolio="";
	String rAsiento="";
	String digVer="";
	int indexI=0;
	int indexF=0;
	int len=0;
  
  	for ( int i=1; i<=bene_amount; i++ ) {
    	if ( i == 10 ) {
      		name = "A"; 
    	} else {
      		name = i + "";
    	}
    
	if (bene.getField("E" + name + "4CTR").getString() != null && !bene.getField("E" + name + "4CTR").getString().equals("")) {
		country = bene.getField("E" + name + "4CTR").getString();
		if (country.equals("PANAMA")) { // Panamá
	        if (bene.getField("E" + name + "4NM4").getString() != null && !bene.getField("E" + name + "4NM4").getString().equals("")) {
            	idn2 = bene.getField("E" + name + "4NM4").getString();
            	// Obtiene la dirección panameña dependiendo del tipo de cliente
	      		indexI=(bene.getField("E" + name + "4NM4")).getString().indexOf("-",0);
	      		indexF=(bene.getField("E" + name + "4NM4")).getString().indexOf("-",indexI+1);

			    // 09-PI-00001-001277 70         
			    // Provincia-Letra-Folio-Asiento DV 
			    cProvincia = idn2.substring(0,indexI);
			    cLetra = idn2.substring(indexI+1,indexF);
			    indexI = indexF;
			    indexF = idn2.indexOf("-",indexI+1);
			    cFolio = idn2.substring(indexI+1,indexF);
			    indexI = indexF;
			    indexF = idn2.indexOf(" ",indexI+1);
			    if (indexF > 0) {
				    cAsiento = idn2.substring(indexI+1,indexF);
				    digVer = idn2.substring(indexF+1);			    
			    }
			    else {
			    	cAsiento = idn2.substring(indexI+1);
			    }
			}			
		}
	}

    out.println("<br>");
    out.println("<table class=\"tbenter\" border=\"0\" width=\"100%\">");
    out.println("<tr>");
    out.println("<td>");
    
    switch ( i ) {
        case 1 :     
%> 
 			<h4 align="left">Primero</h4>
<%          
           if (bene.getE14RCN().equals("0")) {
           		readonly = "false";
           } else {
           		readonly = "true";
           }
           break;
        case 2 : 
%> 
 			<h4 align="left">Segundo</h4>
<%          
           if (bene.getE24RCN().equals("0")) {
           		readonly = "false";
           } else {
           		readonly = "true";
           }
           break;
        case 3 : 
%> 
			<h4 align="left">Tercero</h4>
<%          
           if (bene.getE34RCN().equals("0")) {
           		readonly = "false";
           } else {
           		readonly = "true";
           }
           break;
        case 4 : 
%> 
			<h4 align="left">Cuarto</h4>
<%          
           if (bene.getE44RCN().equals("0")) {
           		readonly = "false";
           } else {
           		readonly = "true";
           }
           break;
        case 5 : 
%> 
			<h4 align="left">Quinto</h4>
<%          
           if (bene.getE54RCN().equals("0")) {
           		readonly = "false";
           } else {
           		readonly = "true";
           }
           break;
        case 6 : 
%> 
			<h4 align="left">Sexto</h4>
<%          
           if (bene.getE64RCN().equals("0")) {
           		readonly = "false";
           } else {
           		readonly = "true";
           }
           break;
        case 7 : 
%> 
			<h4 align="left">Séptimo</h4>
<%          
           if (bene.getE74RCN().equals("0")) {
           		readonly = "false";
           } else {
           		readonly = "true";
           }
           break;
        case 8 : 
%> 
			<h4 align="left">Octavo</h4>
<%          
           if (bene.getE84RCN().equals("0")) {
           		readonly = "false";
           } else {
           		readonly = "true";
           }
           break;
        case 9 : 
%> 
			<h4 align="left">Noveno</h4>
<%          
           if (bene.getE94RCN().equals("0")) {
           		readonly = "false";
           } else {
           		readonly = "true";
           }
           break;
        case 10 : 
%> 
			<h4 align="left">Décimo</h4>
<%          
           if (bene.getEA4RCN().equals("0")) {
           		readonly = "false";
           } else {
           		readonly = "true";
           }
           break;
     }
     
    out.println("</td>");

  	String READ_ONLY_TAG = (readonly.equals("true")) ? "readonly" : "";   
  	String DISABLED_TAG = (readonly.equals("true")) ? "disabled" : "";   

  	out.println("<td width=\"30%\" align=\"right\">");
  	out.println("<h4>");
  	out.print("<A href=\"javascript:go(1)\">1</A>,<A href=\"javascript:go(2)\">2</A>,<A href=\"javascript:go(3)\">3</A>,<A href=\"javascript:go(4)\">4</A>,<A href=\"javascript:go(5)\">5</A>,");
  	out.print("<A href=\"javascript:go(6)\">6</A>,<A href=\"javascript:go(7)\">7</A>,<A href=\"javascript:go(8)\">8</A>,<A href=\"javascript:go(9)\">9</A>,<A href=\"javascript:go(10)\">10</A>");
   	out.println("</h4>"); 
  	out.println("</td>");   
  	out.println("</tr>");
  	out.println("</table>"); 
  	
%>

  <table id="mainTable<%= name %>" class="tableinfo">
    <tr bgcolor="#FFFFFF" bordercolor="#FFFFFF"> 
      <td> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" title="TB_BENEFICIARY_CORP" bgcolor="#FFFFFF" bordercolor="#FFFFFF" align="center">
	  		<tr id="trdark"> 
	   			<td width="42%" nowrap>
	   				<div align="right">Número de Cliente : </div>
	   			</td>
	   			<td width="58%" nowrap> 
	     			<input type="text" name="E<%= name %>4RCN" maxlength="12" size="12" value="<%= bene.getField("E" + name + "4RCN").getString().trim()%>">
			  		<a href="javascript:GetCustomerDetails('E<%=name%>4RCN','E<%=name%>4MA1','E<%=name%>4BNI','','','','','','','','E<%=name%>4CTR','','','','','','','E<%=name%>4HPN')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="bottom" border="0" ></a>	
           		</td>
	  		</tr>
        	<tr id="trclear"> 
            	<td width="42%" nowrap> 
            		<div align="right">Nombre Legal :</div>
            	</td>
            	<td nowrap width="58%"> 
              		<input type="text" name="E<%= name %>4MA1" maxlength="45" size="46" value="<%= bene.getField("E" + name + "4MA1").getString().trim()%>">
            	</td>
        	</tr>
	  		<tr id="trdark"> 
	   			<td width="42%" nowrap>
	   				<div align="right">País : </div>
	   			</td>
	   			<td width="58%" nowrap> 
	        		<input type="hidden" name="CTYCode<%=name%>" id="CTYCode<%=name%>" value="">
	     			<input type="text" name="E<%= name %>4CTR" maxlength="21" size="20" value="<%= bene.getField("E" + name + "4CTR").getString().trim()%>" readonly onFocus="javascript:showIdFields(this.value,'IDVEN_<%= name %>','IDOTHER_<%= name %>','IDPAPERS_<%= name %>');">
					<a href="javascript:GetCodeDescCNOFC('CTYCode<%=name%>','E<%= name %>4CTR','03')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="bottom" border="0"></a> 
	   			</td>
	  		</tr>         
			<tr id="trclear">
				<td width="42%" nowrap>
					<div align="right">Identificación :</div>
				</td>
				<td width="58%" nowrap>
					<INPUT TYPE=HIDDEN NAME="E<%= name %>4BNI" value="<%= bene.getField("E" + name + "4BNI").getString().trim()%>"> 
					<INPUT TYPE=HIDDEN NAME="E<%= name %>4NM4" value="<%= bene.getField("E" + name + "4NM4").getString().trim()%>"> 
					<div id="IDVEN_<%= name %>" style="position:relative; display:none;">
						<input type="text" name="VIDN0_<%= name %>" value="<% if(!bene.getField("E" + name + "4BNI").getString().equals("")) { out.print(bene.getField("E" + name + "4BNI").getString().substring(0,1)); } %>" maxlength="1" size="1" readonly onchange="joinID(document.forms[0].E<%= name %>4BNI, document.forms[0].VIDN0_<%= name %>, document.forms[0].VIDN1_<%= name %>);">
						<a href="javascript:getIdTypeHelp('VIDN0_<%= name %>');"> 
						<img src="<%=request.getContextPath()%>/images/1b.gif" title=". . ." align="bottom" border="0">
						</a> 
						<input type="text" name="VIDN1_<%= name %>" value="<% if(!bene.getField("E" + name + "4BNI").getString().equals("")) { out.print(bene.getField("E" + name + "4BNI").getString().substring(1)); } %>" maxlength="14" size="17" onKeypress="enterInteger1(document.forms[0].VIDN0_<%= name %>)" onchange="joinID(document.forms[0].E<%= name %>4BNI, document.forms[0].VIDN0_<%= name %>, document.forms[0].VIDN1_<%= name %>);">
					</div>
					<div id="IDOTHER_<%= name %>" style="position:relative; display:none;">
						<input type="text" name="OIDN_<%= name %>" value="<%= bene.getField("E" + name + "4BNI").getString() %>" maxlength="15" size="17" onblur="document.forms[0].E<%= name %>4BNI.value=this.value" >
					</div>
					<div id="IDPAPERS_<%= name %>" style="position:relative; display:none;">
						<input type="text" name="PIDN0_<%= name %>" value="<% if(!bene.getField("E" + name + "4NM4").getString().equals("")) { out.print(cProvincia); } %>" maxlength="2" size="3" onKeyPress="enterInteger(event);" onblur="fill0Left(this);joinPersonalIDFieldsPA('E<%= name %>4NM4','PIDN0_<%= name %>','PIDN1_<%= name %>','PIDN2_<%= name %>','PIDN3_<%= name %>');" > - 
						<input type="text" name="PIDN1_<%= name %>" value="<% if(!bene.getField("E" + name + "4NM4").getString().equals("")) { out.print(cLetra); } %>" maxlength="2" size="3" onblur="this.value=this.value.replace(/ /ig,'');joinPersonalIDFieldsPA('E<%= name %>4NM4','PIDN0_<%= name %>','PIDN1_<%= name %>','PIDN2_<%= name %>','PIDN3_<%= name %>');" > - 
						<input type="text" name="PIDN2_<%= name %>" value="<% if(!bene.getField("E" + name + "4NM4").getString().equals("")) { out.print(cFolio); } %>" maxlength="5" size="6" onKeyPress="enterInteger(event);" onblur="fill0Left(this);joinPersonalIDFieldsPA('E<%= name %>4NM4','PIDN0_<%= name %>','PIDN1_<%= name %>','PIDN2_<%= name %>','PIDN3_<%= name %>');" > - 
						<input type="text" name="PIDN3_<%= name %>" value="<% if(!bene.getField("E" + name + "4NM4").getString().equals("")) { out.print(cAsiento); } %>" maxlength="6" size="7" onKeyPress="enterInteger(event);" onblur="fill0Left(this);joinPersonalIDFieldsPA('E<%= name %>4NM4','PIDN0_<%= name %>','PIDN1_<%= name %>','PIDN2_<%= name %>','PIDN3_<%= name %>');" >
					</div>
				</td>
			</tr>
	        <tr id="trdark"> 
	            <td width="42%" nowrap> 
	              <div align="right">Parentesco :</div>
	            </td>
	            <td width="58%" nowrap> 
                  <input type="text" name="E<%= name %>4RTL" maxlength="5" size="4" value="<%= bene.getField("E" + name + "4RTL").getString().trim()%>">
                  <a href="javascript:GetCodeCNOFC('E<%= name %>4RTL','9W')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="bottom" border="0" ></a> 
	            </td>
	        </tr>
	        <tr id="trclear"> 
	            <td width="42%" nowrap> 
	              <div align="right">Porcentaje de Relación :</div>
	            </td>
	            <td width="58%" nowrap> 
	              <input type="text" name="E<%= name %>4INC" maxlength="4" size="5" value="<%= bene.getField("E" + name + "4INC").getString().trim()%>">
	            </td>
	        </tr>
	        <tr id="trdark"> 
	            <td width="42%" nowrap> 
	              <div align="right">Teléfono :</div>
	            </td>
	            <td width="58%" nowrap> 
	              <input type="text" name="E<%= name %>4HPN" maxlength="15" size="16" value="<%= bene.getField("E" + name + "4HPN").getString().trim()%>">
	            </td>
	        </tr>
	        
	       <%  if (currUser.getE01INT().trim().equals("11")) {%>
              <tr id="trclear"> 
	             <td width="42%" nowrap> 
	               <div align="right">Dependiente :</div>
	             </td>
	             <td width="58%" nowrap > 
              	   <select name="E<%= name %>4FL1">
              	     <option value=" " <% if (!(bene.getField("E" + name + "4FL1").getString().equals("Y")) || (bene.getField("E" + name + "4FL1").getString().equals("N"))) out.print("selected"); %>></option>
				     <option value="Y" <% if (bene.getField("E" + name + "4FL1").getString().equals("Y")) out.print("selected"); %>>Si</option>
				     <option value="N" <% if (bene.getField("E" + name + "4FL1").getString().equals("N")) out.print("selected"); %>>No</option>
                    
                     
                   </select>		
                 </td>               
	            
	          </tr>   	       
	       <% }%> 
	        
        </table>
      </td>
    </tr>
  </table>
  
  
<SCRIPT type="text/javascript">
	<% if (bene.getField("E" + name + "4CTR").getString().equals("PANAMA")){ %>
		showIdFields("PANAMA",'IDVEN_<%= name %>','IDOTHER_<%= name %>','IDPAPERS_<%= name %>');
	<% } else if (bene.getField("E" + name + "4CTR").getString().equals("VENEZUELA")){%>        
		showIdFields("VENEZUELA",'IDVEN_<%= name %>','IDOTHER_<%= name %>','IDPAPERS_<%= name %>');
	<% } else {%>
		showIdFields("",'IDVEN_<%= name %>','IDOTHER_<%= name %>','IDPAPERS_<%= name %>');
	<% } %>        
</SCRIPT>
  
<% } %>
</div>

<SCRIPT type="text/javascript">
   getElement('dataDiv').style.height=  getElement("mainTable1").offsetTop + getElement("mainTable1").offsetHeight +"";
</SCRIPT>

<div align="center"><input id="EIBSBTN" type=submit name="Submit" value="Enviar"></div>

</form>
</body>
</html>
