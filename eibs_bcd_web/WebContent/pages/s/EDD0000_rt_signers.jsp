<%@page import="com.datapro.eibs.constants.ISOCodes"%>
<%@page import="datapro.eibs.beans.DataAddress"%>
<%@page import="java.util.logging.Logger"%>
<html>
<head>
<title>Firmantes</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />
<jsp:useBean id= "signersList" class= "datapro.eibs.beans.JBObjList"  scope="session" />
<jsp:useBean id= "rtFirm" class= "datapro.eibs.beans.EDD550001Message"  scope="session" />

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/Ajax.js"> </SCRIPT>

<SCRIPT type="text/javascript">
<% 
 boolean newSigner = true;
 int row = 0;
 String opt = request.getParameter("OPTION").trim();
 
 if ( error.getERRNUM().equals("0")  ) {
 
	 if (opt.equals("1")) { //new
	     String pos = "";
	     rtFirm = new datapro.eibs.beans.EDD550001Message();
	     pos = (signersList.getNoResult()) ? "01" : "" + (signersList.getLastRec() + 1);
     	 if (pos.length() == 1) pos = "0" + pos;
     	 rtFirm.setE01MAN(pos);
     	 rtFirm.setE01CUN(userPO.getIdentifier().trim());
     	 rtFirm.setE01RTY("N");
     	 rtFirm.setE01CTR("");
     	 session.setAttribute("rtFirm", rtFirm);
	 } else {
	 
	    try {		  	
		  	row = Integer.parseInt(request.getParameter("ROW")); 
	        rtFirm = (datapro.eibs.beans.EDD550001Message) signersList.get(row); 
	        session.setAttribute("rtFirm", rtFirm);
	        newSigner = false;
		 } 
		 catch (Exception e) {
				row = 0;	    
		 }
	 }
 	//datapro.eibs.beans.EDD550001Message rtFirm = new datapro.eibs.beans.EDD550001Message();

 } else {
     error.setERRNUM("0");
     out.println("       showErrors()");
 }
 
%>



</SCRIPT>

</head>

<body>
<h3 align="center">Firmantes<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="rt_signers.jsp, EDD0000"></h3>
<hr size="4">
<FORM METHOD="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDD5500" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="20">  
  <INPUT TYPE=HIDDEN NAME="OPTION" VALUE="<%= opt %>">
  <INPUT TYPE=HIDDEN NAME="ROW" VALUE="<%= row %>">
  <INPUT TYPE=HIDDEN NAME="E01MAN" VALUE="<%= rtFirm.getE01MAN() %>">
  <INPUT TYPE=HIDDEN NAME="E01CUN" VALUE="<%= rtFirm.getE01CUN() %>">
  <INPUT TYPE=HIDDEN NAME="E01RTY" VALUE="<%= rtFirm.getE01RTY() %>">
  <INPUT TYPE=HIDDEN NAME="E01UC7" VALUE="">
  <INPUT TYPE=HIDDEN NAME="E01MLC" VALUE="<%= rtFirm.getE01MLC() %>">
  <INPUT TYPE=HIDDEN NAME="E01BNI" VALUE="<%= rtFirm.getE01BNI() %>">
  
  <table id="mainTable" class="tableinfo">
    	<tr id="trdark"> 
            <td width="25%" nowrap> 
              <div align="right">Número de Cliente : </div>
            </td>
            <td nowrap> 
            <% if (opt.equals("1")) { //new %>
               <input type="text" name="E01RCN" id="E01RCN" maxlength="12" size="12" value="<%= rtFirm.getE01RCN()%>">
			   <a href="javascript:GetCustomerDetails('E01RCN','E01MA1','E01BNI','','','E01MA2','E01MA3','E01MA4','','','E01CTR','E01POB','E01ZPC','','','','','E01HPN')">
			   <img src="<%=request.getContextPath()%>/images/1b.gif" title=". . ." align="bottom" border="0" >
			   </a>
            <% } else {%>
               <input type="text" name="E01RCN" id="E01RCN" maxlength="12" size="12" value="<%= rtFirm.getE01RCN()%>" readonly>
            <% }%>
            </td>
          </tr>

	     <tr id="trclear"> 
            <td width="25%" nowrap> 
              <div align="right">Nombre Legal : </div>
            </td>
            <td nowrap> 
              <input type="text" name="E01MA1" maxlength="60" size="60" value="<%= rtFirm.getE01MA1()%>" >
            </td>
          </tr>
</table>


   <div  id="address01"  >
   </div> 

<h4>Datos de la Firma</h4>

<table class="tableinfo">
          <tr id="trclear"> 
            <td width="25%" nowrap> 
              <div align="right">Tipo de Firma : </div>
            </td>
            <td  nowrap> 
              <select name="E01FL1">
                <option value=" " <% if (!(rtFirm.getE01FL1().equals("1") || rtFirm.getE01FL1().equals("2") || rtFirm.getE01FL1().equals("3"))) out.print("selected"); %>></option>
                <option value="1" <% if (rtFirm.getE01FL1().equals("1")) out.print("selected"); %>>Firma Individual</option>
                <option value="2" <% if (rtFirm.getE01FL1().equals("2")) out.print("selected"); %>>Firma Mancomunada</option>
				<option value="3" <% if (rtFirm.getE01FL1().equals("3")) out.print("selected"); %>>Firma Indistinta</option>
			  </select>
            </td>
          </tr>         
          <tr id="trdark"> 
            <td width="25%" nowrap> 
              <div align="right">Categoría de Firma : </div>
            </td>
            <td nowrap> 
              <input type="text" name="E01FL3" maxlength="1" size="2" value="<%= rtFirm.getE01FL3()%>">
              <a href="javascript:GetCodeCNOFC('E01FL3','FI')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="bottom" border="0"></a>	
            </td>
          </tr>
</table>  
       
  <br>
          <div align="center"> 
            <input id="EIBSBTN" type=submit name="Submit" value="Enviar">
          </div>
</form>


<script type="text/javascript">
$(document).ready(function(){
	   addEventListner();
		
	   $.ajaxSettings.cache = false;
	   
	   changeAddressBlock('01', String('${sessionScope.rtFirm.E01ADC}').trim() == "" ? "null" :  String('${sessionScope.rtFirm.E01ADC}').trim(), String('${sessionScope.rtFirm.E01DPCR}').trim(), false );
	  
	   $("#address01").on('change', '#E01ADC', function(){
			changeAddressBlock('01', $( "#E01ADC" ).val(), $( "#E01DPCR" ).val(), true ); 
		});
}); 

function addEventListner (){
	$('#E01RCN').change(function(){
		addWaitCursor();
		$.ajax({
			  type: 'GET',
    		  dataType: "json",
			  url: "${pageContext.request.contextPath}/servlet/datapro.eibs.client.JSESD4001",
	          cache: false,
	          data: { SCREEN : "950",
	        		  CUSCUN : $("#E01RCN").val(),
	        		  RECTYP : "1",
	        		  ReturnOBJ : "JSON",
	          },
		  
	          error: function(e) { 
	  		    $( "#address01" ).html( "Error en la Comunicacion [" + String(e) + "]");
	  		    removeWaitCursor();
	          },
	          success : function(response){
	        		if (response.type == "error") {
	        			//showErrors();
	        		} else {
	    	        	putDataFromJson(response, true);
	    	  		    removeWaitCursor();
	        		}
	          }
		});		
	});
}



function changeAddressBlock(block, country, dCountry, clearData){
	
	addWaitCursor();
	
	if( country === undefined || country == "null" ){ country = "<%= ISOCodes.getISOCountryCode(currUser.getE01INT(), ISOCodes.EIBS_CODE_TO_ISO_ALFHA_2) %>" ;}
	if( dCountry === undefined || dCountry == "null" ){ dCountry = ""; }
	
	<%
	   	Logger.getLogger(this.getClass().getName()).info("Using template: " + rtFirm.getE01ADC());
	%>
	$.ajax({
		  type: 'GET',
		  dataType: "html",
		  url: "${pageContext.request.contextPath}/servlet/datapro.eibs.client.JSAddress",
          cache: false,
          data: { messageName: "rtFirm",
        	  	  simple : false,
        	  	  countryHelp : true,
        	  	  index : block ,
        	  	  firstColor : "trdark" ,
        	  	  country : country ,
        	  	  dCountry : dCountry ,
        	  	  clearData : clearData,
				  title :  "Direccion"       	  	  
          },
	  
          error: function(e) { 
  		    $( "#address01" ).html( "Error en la Comunicacion [" + String(e) + "]");
  		    removeWaitCursor();
          },
          success : function(response){
				$( "#address01" ).html(response);
	  		    removeWaitCursor();
		 }
	});		
}


</script>

</body>
</html>
