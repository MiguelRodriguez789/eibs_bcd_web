<%@ page import ="datapro.eibs.master.Util" %> 
<html>
<head>
<title>Propuesta de Credito</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<link Href="<%=request.getContextPath()%>/fonts/css/font-awesome.min.css" rel="stylesheet">

<jsp:useBean id="EDP072101Help" class="datapro.eibs.beans.JBObjList" scope="session" />
<jsp:useBean id="EDP072601Help" class="datapro.eibs.beans.JBObjList" scope="session" />

<jsp:useBean id="msgRT" class="datapro.eibs.beans.EDP072001Message"  scope="session" />
<jsp:useBean id="msgRTC" class="datapro.eibs.beans.EDP072201Message"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />

<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>

<SCRIPT type="text/javascript">
//       builtNewMenu(pc_docs);  
       
       
	function goCancel() {
	document.forms[0].SCREEN.value="200";
	document.forms[0].submit(); 
	  		  
}
	function callEntid() {
	var customer = getElement("E01CUSCUN").value;    
    	page = "<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSESD2080?SCREEN=500&E01CUN="+customer;
    	CenterNamedWindow(page,'Information',650,500,2);
	}

</SCRIPT>



<%
if (!error.getERRNUM().equals("0")) {
      error.setERRNUM("0");
%>
	<SCRIPT type="text/javascript">
		showErrors();
		</SCRIPT>
<%}
 out.println("<SCRIPT> initMenu(); </SCRIPT>");

%>

</head>
<body >
<% 
    if ( !error.getERRNUM().equals("0")  ) {
        out.println("<SCRIPT Language=\"Javascript\">");
        error.setERRNUM("0");
        out.println("       showErrors()");
        out.println("</SCRIPT>");
    }   
%>

<H3 align="center">Nueva Propuesta de Cr&eacute;dito
	<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="proposals_enter_maintenance.jsp, EDP0720">
</H3>
<hr size="4">

<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.creditproposal.JSEDP0720" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="302">

  <input type=HIDDEN name="E01PLPBNK" value="<%= currUser.getE01UBK().trim()%>"> 
  <input type=HIDDEN name="E01PLPBRN" value="<%= currUser.getE01UBR().trim()%>"> 

  <input type=HIDDEN name="E01DPPPXX" value="0001"> 
  <input type=HIDDEN name="E01PLPPTY" value="1"> 
  <input type=HIDDEN name="E01DPPDXX" value="APERTURA PROPUESTA"> 

   <h4>Datos del Cliente</h4>
 <table class="tableinfo">
    <tr > 
      <td> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="trdark"> 
            <td width="15%"> 
              <div align="right">N&uacute;mero Cliente :</div>
            </td>
            <td width="30%">
	            <input type=TEXT name="E01CUSCUN" size=10 maxlength=9 value="<%=userPO.getCusNum()%>" onKeypress="enterInteger(event)" >
        		<a href="javascript:showHiddenDivNew('')" id="eibsNew">
        		<img src="<%=request.getContextPath()%>/images/1b.gif" title=". . ." align="middle" border="0" ></a> 
				<img src="<%=request.getContextPath()%>/images/Check.gif" title="campo obligatorio" align="bottom" border="0" width="16" height="20"  >
            </td>
            <td width="60%"> 
              Nombre Cliente :
               		<input type="text" name="E01CUSNA1" size="50" maxlength="40" value="<%=userPO.getCusName()%>" readonly>
            </td>
          </tr>

          <tr id="trdark"> 
            <td width="15%"> 
              <div align="right">Sujeto de Crédito :</div>
            </td>
            <td width="30%">
	   				<input type="text" name="E01PLPCN2" size="5" maxlength="4" value="<%= msgRT.getE01PLPCN2().trim()%>" 
					<% if(userPO.getHeader16().equals("5")){out.print("readonly");}%>
   					>
       		
	   				<% if(!userPO.getHeader16().equals("5")) {%>
					<A href="javascript:GetCodeDescCNOFC('E01PLPCN2','E01PLPRE2','PD')">
					<IMG src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="bottom" border="0">
					<img src="<%=request.getContextPath()%>/images/Check.gif" title="campo obligatorio" align="bottom" border="0" width="16" height="20"  >
					</A>
					<% } %>
					<INPUT type="text" name="E01PLPRE2" size="18" maxlength="15" value="<%= msgRT.getE01PLPRE2().trim()%>" readonly> 
		    </td>
            <td width="60%"> 
              Destino de Crédito :
	   				<input type="text" name="E01PLPCN3" size="5" maxlength="4" value="<%= msgRT.getE01PLPCN3().trim()%>" 
					<% if(userPO.getHeader16().equals("5")){out.print("readonly");}%>
   					>
       		
	   				<% if(!userPO.getHeader16().equals("5")) {%>
					<A href="javascript:GetCodeDescCNOFC('E01PLPCN3','E01PLPRE3','XB')">
					<IMG src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="bottom" border="0">
					<img src="<%=request.getContextPath()%>/images/Check.gif" title="campo obligatorio" align="bottom" border="0" width="16" height="20"  >
					</A>
					<% } %>
					<INPUT type="text" name="E01PLPRE3" size="28" maxlength="15" value="<%= msgRT.getE01PLPRE3().trim()%>" readonly> 
		    </td>
          </tr>
         
        </table>
      </td>
    </tr>
  </table>
  
<div align="center"> 
    <INPUT class="EIBSBTN" type="submit" name="Submit" value="Enviar" >
	<INPUT class="EIBSBTN" type="button" name="Cancel" value="Cancelar" onclick="goCancel()">
</div>
        
	<div id="hiddenDivNew" class="hiddenDiv">
	<table class="approvalSearch" style="width: 400px; table-layout: fixed;">
	    	<caption>Criterio de Seleccion :</caption>
	      <tr > 
	        <td align="LEFT" nowrap="nowrap"> 
				 <div id="entity_type">
				        <input type="radio" id="entity_type_client" name="form[entity]" value="C" checked="checked"/>
					    <label for="entity_type_client" style="font-weight: bold;"> Cliente </label><br>
					    <input type="radio" id="entity_type_noclient" name="form[entity]" value="E"/>
						<label for="entity_type_noclient" style="font-weight: bold;"> 
						Entidad <i class="fa fa-plus-square fa-fw reveal-if-entity" style="display: none" onclick="newEntity()"></i>
						</label>
			     </div>
	        </td>
            <td style="vertical-align: top; ">
				<div id="DIVNAME" align="left" >
					<input type="text" id="REFNUM" name="REFNUM" maxlength="9" size="11" value="0" onkeypress=" enterInteger(event)" class="txtright">	
					<a id="refNumHelp" href="javascript:GetCustomerDescId('REFNUM','','')"><img src="<%=request.getContextPath()%>/images/1b.gif" align="bottom" border="0"></a>
        		</div>
        	</td> 	        
	      </tr>
	      <tr> 
	        <td align=center nowrap colspan="2"> 
	        	<br>
				<input class="styled-button-Search" id="newButton" type=button value="Enviar" onclick="goSelectCus()">
			</td>
	      </tr>       
	      <tr></tr>
	</table>
	</div>	    
<p> 
<SCRIPT type="text/javascript">
 	
function closeHiddenDivNew(){
	setVisibility(getElement("hiddenDivNew"), "hidden");
}

function showHiddenDivNew(evt) {
	evt = (evt) ? evt : ((window.event) ? window.event : "");
 	
	var hiddenDivNew = getElement("hiddenDivNew");

	var y=evt.clientY + document.body.scrollTop;
	var x=evt.clientX + document.body.scrollLeft+100;
     
	cancelBub(evt);

	moveElement(hiddenDivNew, y, x);
	setVisibility(hiddenDivNew, "visible");
	 
}

	addEventHandler(getElement("hiddenDivNew"), 'click' , cancelBub);	
	addEventHandler(getElement("eibsNew"), 'click' , showHiddenDivNew);	
	addEventHandler(document, 'click' , closeHiddenDivNew);	

$("input[name='form[entity]']:radio").change(function () {
	$this = $(this);
	if($this.val() === 'E'){
		$('.reveal-if-entity').first().css('display' ,'inline');
		$('#refNumHelp').attr('href', 'javascript:GetEntity("REFNUM","","")' );
	} else {
		$('.reveal-if-entity').first().css('display' ,'none');
		$('#refNumHelp').attr('href', 'javascript:GetCustomerDescId("REFNUM","","")' );
	}
	getElement('TYPE').value = $this.val() === 'E' ? "N" : "C"; // N - Entity , C-Customer
	getElement('REFNUM').value = '';
	getElement('REFNUM').focus();
});

function newEntity(){
	var page = '${pageContext.request.contextPath}/servlet/datapro.eibs.client.JSESD2080?SCREEN=100&source=';
	CenterWindow(page, 1000, 550, 2);
}
function goSelectCus(){
    document.forms[0].E01CUSCUN.value = document.forms[0].REFNUM.value;
	closeHiddenDivNew();
}
</SCRIPT>
          
  </form>
</body>
</html>
