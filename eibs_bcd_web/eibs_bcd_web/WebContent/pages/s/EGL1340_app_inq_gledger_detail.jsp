<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<%@taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@page import="datapro.eibs.master.Util" %>
<%@page import="com.datapro.constants.EibsFields"%>
<html>
   <head>
      <title>Contabilidad</title>
      <jsp:useBean id="GLedger" class="datapro.eibs.beans.EGL134002Message" scope="session" />
      <jsp:useBean id="error" class="datapro.eibs.beans.ELEERRMessage" scope="session" />
      <jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session" />
      <jsp:useBean id="currUser" class="datapro.eibs.beans.ESS0030DSMessage" scope="session" />
      <link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
      
      <style type="text/css">
         td {
         white-space: nowrap ;
         }
         #tab2 table tr td:first-child,
         #tab1 table tr td:first-child,
         #tab1 table tr td:nth-child(3)
         {
         text-align:right; 
         width: 20%;
         }  
         #tab2 table tr td:nth-child(2) {
         text-align:left;
         width: 70%; 
         }
         #tab1 table tr td:nth-child(2).
         #tab1 table tr td:nth-child(4)
         {
         text-align:left; 
         width: 30%;
         }  
      </style>
	  <link rel="stylesheet" href="<%=request.getContextPath()%>/jquery/themes/smoothness/jquery-ui.css"/>
            
      <script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </script>
      <script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </script>
	  <script type="text/javascript" src="<%=request.getContextPath()%>/jquery/jquery-ui-1.10.4.min.js"> </SCRIPT>
      <script type="text/javascript" src="<%=request.getContextPath()%>/jquery/readOnlyPage.jsp"> </script>
      <script type="text/javascript">
         $(document).ready(function(){
         	readOnlyPage();
         });
         
         
         $(function() {
         	$( "#tabs" ).tabs();
         });
         
         
         $(document).ready(function () {
         
         	    var currentTabIndex = "0";
         
         	    $tab = $("#tabs").tabs({
         	         activate : function (e, ui) {
         	            currentTabIndex = ui.newTab.index().toString();
         	            sessionStorage.setItem('tab-index', currentTabIndex);
         	         }
         	    });
         
         
         	    $('#btn-sub').on('click', function () {
         	        sessionStorage.setItem("tab-index", currentTabIndex);
         	    });
         	   
         	   
         	    $(":input, select").focus( function(){
         	    	console.log("FOCUSED ON");
         	    });
         	    
         	    
         });
         
         
         function enableTab(obj, num){
             obj.tabs("enable", num);
         }
         
      </script>
      <%! 
         int row = 0 ;
         String getRowClass(){
         String rowClass = "";
         	rowClass = (row % 2 == 1) ? "trdark" : "trclear" ;	
         	row++;
         	return rowClass ;
         }
         String getModifiedClass( String fieldValue ){
         	return ( "Y".equals( fieldValue )?"class=\"txtchanged\"":"" );
         }
         %>
   </head>
   <body>
      <H3 align="center">
         Aprobación de Cuenta Contable
         <img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="app_inq_gledger_detail.jsp, EGL1340">
      </H3>
      <hr size="4">
      <form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEGL0340">
         <INPUT TYPE=HIDDEN NAME="SCREEN" value="3">
         <div id="tabs">
            <ul>
               <li><a href="#tab1">Información Básica</a></li>
               <li><a href="#tab2">Referencias Cruzadas</a></li>
            </ul>
            <div id="tab1">
               <jsp:include page="EGL1340_app_inq_gledger_tab1.jsp" flush="true"/>
            </div>
            <div id="tab2">
               <jsp:include page="EGL1340_app_inq_gledger_tab2.jsp" flush="true"/>
            </div>
         </div>
         <br>
      </form>
   </body>
</html>