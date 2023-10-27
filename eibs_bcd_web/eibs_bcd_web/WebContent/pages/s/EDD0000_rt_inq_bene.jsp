<html>
<head>
<title>Consulta de Beneficiarios</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">


<jsp:useBean id = "bene" class= "datapro.eibs.beans.ESD000004Message"   scope="session" />
<jsp:useBean id = "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos"  scope="session" />
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>

<SCRIPT type="text/javascript">

<%
if ( userPO.getOption().equals("RT") ) {
%>
	builtNewMenu(rt_i_opt);
<%   
}
else if ( userPO.getOption().equals("SV") ) {
%>
	builtNewMenu(sv_i_opt);
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

<body  bgcolor="#FFFFFF">
<% 
 if ( !error.getERRNUM().equals("0")  ) {
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
 }
  
    out.println("<SCRIPT> initMenu(); </SCRIPT>");

%> 
<h3 align="center">Beneficiarios<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="rt_inq_bene.jsp, EDD0000"></h3>
<hr size="4">
<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEXEDD0000" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="39">  
<p>
  <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
          <tr id="trdark"> 
            <td nowrap width="14%" > 
              <div align="right"><b>Cliente :</b></div>
            </td>
            <td nowrap width="9%" > 
              <div align="left"> 
                <input type="text" name="E02CUN2" size="10" maxlength="9" readonly value="<%= userPO.getCusNum().trim()%>">
              </div>
            </td>
            <td nowrap width="12%" > 
              <div align="right"><b>Nombre :</b> </div>
            </td>
            <td nowrap > 
              <div align="left"> 
                <input type="text" name="E02NA12" size="45" maxlength="45" readonly value="<%= userPO.getCusName().trim()%>">
              </div>
            </td>
            <td nowrap > 
              <div align="right"><b>Producto : </b></div>
            </td>
            <td nowrap ><b> 
              <input type="text" name="E02PRO2" size="4" maxlength="4" readonly value="<%= userPO.getProdCode().trim()%>">
              </b></td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="14%"> 
              <div align="right"><b>Cuenta :</b></div>
            </td>
            <td nowrap width="9%"> 
              <div align="left"> 
                <input type="text" name="E02ACC" size="13" maxlength="12" value="<%= userPO.getAccNum().trim()%>" readonly>
              </div>
            </td>
            <td nowrap width="12%"> 
              <div align="right">Oficial :</div>
            </td>
            <td nowrap width="33%"> 
              <div align="left"><b> 
                <input type="text" name="E02NA122" size="45" maxlength="45" readonly value="<%= userPO.getOfficer().trim()%>">
                </b> </div>
            </td>
            <td nowrap width="11%"> 
              <div align="right"><b>Moneda : </b></div>
            </td>
            <td nowrap width="21%"> 
              <div align="left"><b> 
                <input type="text" name="E01DEACCY" size="3" maxlength="3" value="<%= userPO.getCurrency().trim()%>" readonly>
                </b> </div>
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
    }
    else {
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

    out.println("<table class=\"tbenter\" border=\"0\" width=\"100%\">");
    out.println("<tr>");
    
    switch ( i ) {
        case 1 :     
%> 
<table>
<tr>
 <td align="left"><h4>Primero</h4></td>
</tr>
</table>
<%          
           break;
        case 2 : 
%> 
<table>
<tr>
 <td align="left"><h4>Segundo</h4></td>
</tr>
</table>
<%          
           break;
        case 3 : 
%> 
<table>
<tr>
<td align="left"><h4>Tercero</h4></td>
</tr>
</table>
<%          
           break;
        case 4 : 
%> 
<table>
<tr>
<td align="left"><h4>Cuarto</h4></td>
</tr>
</table>
<%          
           break;
        case 5 : 
%> 
<table>
<tr>
<td align="left"><h4>Quinto</h4></td>
</tr>
</table>
<%          
           break;
        case 6 : 
%> 
<table>
<tr>
<td align="left"><h4>Sexto</h4></td>
</tr>
</table>
<%          
           break;
        case 7 : 
%> 
<table>
<tr>
<td align="left"><h4>Séptimo</h4></td>
</tr>
</table>
<%          
           break;
        case 8 : 
%> 
<table>
<tr>
<td align="left"><h4>Octavo</h4></td>
</tr>
</table>
<%          
           break;
        case 9 : 
%> 
<table>
<tr>
<td align="left"><h4>Noveno</h4></td>
</tr>
</table>
<%          
           break;
        case 10 : 
%> 
<table>
<tr>
<td align="left"><h4>Décimo</h4></td>
</tr>
</table>
<%          
           break;
     }
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
	     			<input type="text" readonly name="E<%= name %>4RCN" maxlength="12" size="12" value="<%= bene.getField("E" + name + "4RCN").getString().trim()%>">
	   			</td>
	  		</tr>
        	<tr id="trclear"> 
            	<td width="42%" nowrap> 
            		<div align="right">Nombre Legal :</div>
           		</td>
            	<td nowrap width="58%"> 
            		<input type="text" readonly name="E<%= name %>4MA1" maxlength="45" size="46" value="<%= bene.getField("E" + name + "4MA1").getString().trim()%>">
            	</td>
        	</tr>
	  		<tr id="trdark"> 
	   			<td width="42%" nowrap>
	   				<div align="right">País : </div>
	   			</td>
	   			<td width="58%" nowrap> 
	        		<input type="hidden" name="CTYCode<%=name%>" id="CTYCode<%=name%>" value="">
	     			<input type="text" readonly name="E<%= name %>4CTR" maxlength="21" size="20" value="<%= bene.getField("E" + name + "4CTR").getString().trim()%>" onFocus="javascript:showIdFields(this.value,'IDVEN_<%= name %>','IDOTHER_<%= name %>','IDPAPERS_<%= name %>');">
	   			</td>
	  		</tr>         
			<tr id="trclear">
				<td width="42%" nowrap>
					<div align="right">Identificación :</div>
				</td>
				<td width="58%" nowrap>
					<div id="IDVEN_<%= name %>" style="position:relative; display:none;">
						<input type="text" readonly name="VIDN0_<%= name %>" value="<% if(!bene.getField("E" + name + "4BNI").getString().equals("")) { out.print(bene.getField("E" + name + "4BNI").getString().substring(0,1)); } %>" maxlength="1" size="1" readonly onchange="joinID(document.forms[0].IDN_<%= name %>, document.forms[0].VIDN0_<%= name %>, document.forms[0].VIDN1_<%= name %>);">
						<input type="text" readonly name="VIDN1_<%= name %>" value="<% if(!bene.getField("E" + name + "4BNI").getString().equals("")) { out.print(bene.getField("E" + name + "4BNI").getString().substring(1)); } %>" maxlength="14" size="17" onKeypress="enterInteger1(document.forms[0].VIDN0_<%= name %>)" onchange="joinID(document.forms[0].IDN_<%= name %>, document.forms[0].VIDN0_<%= name %>, document.forms[0].VIDN1_<%= name %>);">
					</div>
					<div id="IDOTHER_<%= name %>" style="position:relative; display:none;">
						<input type="text" readonly name="OIDN_<%= name %>" value="<%= bene.getField("E" + name + "4BNI").getString() %>" maxlength="15" size="17" onblur="document.forms[0].IDN_<%= name %>.value=this.value" >
					</div>
					<div id="IDPAPERS_<%= name %>" style="position:relative; display:none;">
						<input type="text" readonly name="PIDN0_<%= name %>" value="<% if(!bene.getField("E" + name + "4NM4").getString().equals("")) { out.print(cProvincia); } %>" maxlength="2" size="3" onKeyPress="enterInteger(event);" onblur="fill0Left(this);joinPersonalIDFieldsPA('IDN2_<%= name %>','PIDN0_<%= name %>','PIDN1_<%= name %>','PIDN2_<%= name %>','PIDN3_<%= name %>');" > - 
						<input type="text" readonly name="PIDN1_<%= name %>" value="<% if(!bene.getField("E" + name + "4NM4").getString().equals("")) { out.print(cLetra); } %>" maxlength="2" size="3" onblur="this.value=this.value.replace(/ /ig,'');joinPersonalIDFieldsPA('IDN2_<%= name %>','PIDN0_<%= name %>','PIDN1_<%= name %>','PIDN2_<%= name %>','PIDN3_<%= name %>');" > - 
						<input type="text" readonly name="PIDN2_<%= name %>" value="<% if(!bene.getField("E" + name + "4NM4").getString().equals("")) { out.print(cFolio); } %>" maxlength="5" size="6" onKeyPress="enterInteger(event);" onblur="fill0Left(this);joinPersonalIDFieldsPA('IDN2_<%= name %>','PIDN0_<%= name %>','PIDN1_<%= name %>','PIDN2_<%= name %>','PIDN3_<%= name %>');" > - 
						<input type="text" readonly name="PIDN3_<%= name %>" value="<% if(!bene.getField("E" + name + "4NM4").getString().equals("")) { out.print(cAsiento); } %>" maxlength="6" size="7" onKeyPress="enterInteger(event);" onblur="fill0Left(this);joinPersonalIDFieldsPA('IDN2_<%= name %>','PIDN0_<%= name %>','PIDN1_<%= name %>','PIDN2_<%= name %>','PIDN3_<%= name %>');" >
					</div>
				</td>
			</tr>
	        <tr id="trdark"> 
	            <td width="42%" nowrap> 
	              <div align="right">Parentesco :</div>
	            </td>
	            <td width="58%" nowrap> 
	              <input type="text" readonly name="D<%= name %>4RTL" maxlength="35" size="36" value="<%= bene.getField("D" + name + "4RTL").getString().trim()%>">
	            </td>
	        </tr>
	        <tr id="trclear"> 
	            <td width="42%" nowrap> 
	              <div align="right">Porcentaje de Relación :</div>
	            </td>
	            <td width="58%" nowrap> 
	              <input type="text" readonly name="E<%= name %>4INC" maxlength="4" size="5" value="<%= bene.getField("E" + name + "4INC").getString().trim()%>">
	            </td>
	        </tr>
	        <tr id="trdark"> 
	            <td width="42%" nowrap> 
	              <div align="right">Teléfono :</div>
	            </td>
	            <td width="58%" nowrap> 
	              <input type="text" readonly name="E<%= name %>4HPN" maxlength="11" size="12" value="<%= bene.getField("E" + name + "4HPN").getString().trim()%>">
	            </td>
	        </tr>
	        
	        
	        <%  if (currUser.getE01INT().trim().equals("11")) {%>
              <tr id="trclear"> 
	             <td width="42%" nowrap> 
	               <div align="right">Dependiente :</div>
	             </td>
	             <td width="58%" nowrap> 
                    <input type="text" readonly  name="E<%= name %>4FL1" size="4" maxlength="5" 
				       value="<% if (bene.getField("E" + name + "4FL1").getString().equals("Y")) out.print("Si");
							else if (bene.getField("E" + name + "4FL1").getString().equals("N")) out.print("No");
						    else out.print("");%>" 
				  >
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

 <%
  }
%>
</div>
<SCRIPT type="text/javascript">
   getElement('dataDiv').style.height=  getElement('mainTable1').offsetTop + getElement("mainTable1").offsetHeight +"";
</SCRIPT>

    </form>
</body>
</html>
