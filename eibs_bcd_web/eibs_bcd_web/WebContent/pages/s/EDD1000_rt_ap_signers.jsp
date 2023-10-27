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

<SCRIPT type="text/javascript">
<% 
 
    int row = 0;
  
    try {		  	
	  	row = Integer.parseInt(request.getParameter("ROW")); 
	  	signersList.setCurrentRow(row);
        rtFirm = (datapro.eibs.beans.EDD550001Message ) signersList.getRecord();
        session.setAttribute("rtFirm", rtFirm);
	 } 
	 catch (Exception e) {
			row = 0;	    
	 }
	
 
 
%>

</SCRIPT>

</head>

<body>
<h3 align="center">Firmantes<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="EDD1000_rt_ap_signers.jsp, EDD1000"></h3>
<hr size="4">
<FORM METHOD="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDD0000F" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="20">  
  
  <INPUT TYPE=HIDDEN NAME="ROW" VALUE="<%= row %>">
  <INPUT TYPE=HIDDEN NAME="E01MAN" VALUE="<%= rtFirm.getE01MAN() %>">
  <INPUT TYPE=HIDDEN NAME="E01CUN" VALUE="<%= rtFirm.getE01CUN() %>">
  <INPUT TYPE=HIDDEN NAME="E01RTY" VALUE="<%= rtFirm.getE01RTY() %>">
  
  <table id="mainTable" class="tableinfo">
    	<tr id="trdark"> 
            <td width="13%" nowrap> 
              <div align="right">Número de Cliente : </div>
            </td>
            <td nowrap> 
               <input type="text" name="E01RCN" maxlength="12" size="12" value="<%= rtFirm.getE01RCN()%>" readonly>
            </td>
          </tr>

	     <tr id="trclear"> 
            <td width="13%" nowrap> 
              <div align="right">Nombre Legal : </div>
            </td>
            <td nowrap> 
              <input type="text" name="E01MA1" maxlength="45" size="46" value="<%= rtFirm.getE01MA1()%>" readonly>
            </td>
          </tr>
</table>
<h4>Datos de la Firma</h4>
<table id="mainTable3" class="tableinfo">

          <%
          int xrow = 1;
          
          if(!(currUser.getE01INT().equals("06"))){ %> 
             
          <tr id="<%= (xrow % 2 == 1) ? "trdark" : "trclear" %><%xrow++;%>">
            <td width="13%" nowrap> 
              <div align="right">Identificaci&oacute;n : </div>
            </td>
            <td width="23%" nowrap> 
              <input type="text" name="E01BNI" maxlength="28" size="25" value="<%= rtFirm.getE01BNI()%>">
            </td>
          </tr>
          <% } %>
    
          <tr id="<%= (xrow % 2 == 1) ? "trdark" : "trclear" %><%xrow++;%>">
            <td width="13%" nowrap> 
              <div align="right">Tipo de Firma: </div>
            </td>
            <td width="23%" nowrap> 
              <select name="E01FL1">
                <% if (!(rtFirm.getE01FL1().equals("1") || rtFirm.getE01FL1().equals("2") || rtFirm.getE01FL1().equals("3"))) out.print("<option value=\"\"></option>"); %>
                <% if (rtFirm.getE01FL1().equals("1")) out.print("<option value=\"1\">Firma Individual</option>"); %>
                <% if (rtFirm.getE01FL1().equals("2")) out.print("<option value=\"2\">Firma Mancomunada</option>"); %>
				<% if (rtFirm.getE01FL1().equals("3")) out.print("<option value=\"3\">Firma Indistinta</option>"); %>
			  </select>
            </td>
          </tr>         
         
          <tr id="<%= (xrow % 2 == 1) ? "trdark" : "trclear" %><%xrow++;%>">
            <td width="13%" nowrap> 
              <div align="right">Categoría de Firma : </div>
            </td>
            <td width="23%" nowrap> 
              <input type="text" name="E01FL3" maxlength="1" size="2" value="<%= rtFirm.getE01FL3()%>">
              <a href="javascript:GetCodeCNOFC('E01FL3','FI')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="bottom" border="0"></a>	
            </td>
          </tr>
</table>  

   <div  id="address01"  >
   </div> 
		       
  <br>
          <div align="center"> 
            <input id="EIBSBTN" type="button" name="Submit" value="Cerrar" onclick="window.close();">
          </div>
</form>
</body>
<script type="text/javascript">

$(document).ready(function(){
	
	   $.ajaxSettings.cache = false;
	   $.ajaxSettings.dataType= "html";
	   
	   changeAddressBlock('01', String('${sessionScope.rtFirm.E01ADC}').trim() , String('${sessionScope.rtFirm.E01DPCR}').trim(), false );
}); 


function changeAddressBlock(block, country, dCountry, clearData){
	
	if( country === undefined || country == "null" ){ country = "" ;}
	if( dCountry === undefined || dCountry == "null" ){ dCountry = ""; }
	
	<%
	   	Logger.getLogger(this.getClass().getName()).info("Using template: " + rtFirm.getE01ADC());
	%>
	$.ajax({
		  type: 'GET',
		  url: "${pageContext.request.contextPath}/servlet/datapro.eibs.client.JSAddress",
          cache: false,
          data: { messageName: "rtFirm",
        	  	  simple : false,
        	  	  countryHelp : false,
        	  	  index : block ,
        	  	  firstColor : "trdark" ,
        	  	  country : country ,
        	  	  dCountry : dCountry ,
        	  	  clearData : false,
				  title :  "Direccion", 
				  readOnly : true,
				  showWeb : false,
				  basic : false
          },
	  
          error: function(e) { 
  		    $( "#address01" ).html( "Error en la Comunicacion [" + String(e) + "]");
          },
          success : function(response){
				$( "#address01" ).html(response);
		 }
	});		
}

</script>


</html>
