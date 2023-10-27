<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@ page import = "datapro.eibs.master.Util" %>
<%@page import="com.datapro.constants.EibsFields"%>
<%@page import="com.datapro.eibs.constants.HelpTypes"%>

<html>
<head>
<title>Transacciones Contables </title>
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<link Href="<%=request.getContextPath()%>/fonts/css/font-awesome.min.css" rel="stylesheet">

<jsp:useBean id="currUser" class="datapro.eibs.beans.ESS0030DSMessage" scope="session" />
<jsp:useBean id="trans" class="datapro.eibs.beans.EGL001001Message" scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session"/>
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>


<script src="<%=request.getContextPath()%>/jquery/readOnlyPage.jsp"> </script>



<script type="text/javascript">

function goAction(op) {
	getElement("SCREEN").value = op;
	document.forms[0].submit();	
}

function cerrarVentana(){
//	window.open('','_parent','');
	window.opener.location.href = '<%=request.getContextPath()%>/servlet/datapro.eibs.accounting.JSEGL0010?SCREEN=300';	   	   
	window.close(); 
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

<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.accounting.JSEGL0010">
<input type="hidden" id="SCREEN" name="SCREEN" value="400">
	
<h3 align="center">
<% if (userPO.getOption().equals("NEW")){ %>
	Nuevo Registro Contable
<%} else { %>
	Actualizacion Registro Contable Sequencia : <%=trans.getE01SEQ() %>
<%} %>
<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="transaction_batch_maint.jsp,EGL0010"> </h3> 
<hr size="4">
    
  <%int row = 0; %>
  <table class="tableinfo">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
	       	<td width="15%"> 
           	 	<div align="right">Cuenta Contable :</div>
       		</td>
	       	<td width="35%"> 
           		<div align="left"> 
      	    		<eibsinput:text name="trans" property="E01BNK" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_BANK %>" />    
		 			<eibsinput:help name="trans" property="E01BRN" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_BRANCH %>" fn_param_one="E01BRN" fn_param_two="document.forms[0].E01BNK.value"  />
		 			<eibsinput:help name="trans" property="E01CCY" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CURRENCY %>" fn_param_one="E01CCY" fn_param_two="document.forms[0].E01BNK.value"  />
	 		        <eibsinput:help name="trans" property="E01GLN" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_GLEDGER %>" fn_param_one="E01GLN" fn_param_two="document.forms[0].E01BNK.value" fn_param_three="document.forms[0].E01CCY.value" required="true" />
           		</div>
           	</td>
	       	<td width="25%"> 
           	 	<div align="right">Referencia :</div>
       		</td>
	       	<td width="25%"> 
           		<div align="left"> 
	 				<eibsinput:help name="trans" property="E01ACC" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_ACCOUNT%>" fn_param_one="E01ACC" fn_param_two="document.forms[0].E01BNK.value" fn_param_three="RT" />
           		</div>
           	</td>
          </tr>
          
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
	       	<td width="20%"> 
           	 	<div align="right">Centro de Costos :</div>
       		</td>
	       	<td width="30%"> 
           		<div align="left"> 
		 			<eibsinput:help name="trans" property="E01CCN" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_COST_CENTER %>" fn_param_one="E01CCN" fn_param_two="document.forms[0].E01BNK.value"  />
           		</div>
           	</td>
	       	<td width="25%"> 
           	 	<div align="right">Numero Cheque :</div>
       		</td>
	       	<td width="25%"> 
           		<div align="left"> 
		       	    <eibsinput:text name="trans" property="E01CKN" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CHECK_NUMBER %>" />    
           		</div>
           	</td>
          </tr>

          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
	       	<td width="20%"> 
           	 	<div align="right">Descripcion Transaccion :</div>
       		</td>
	       	<td width="30%" nowrap="nowrap"> 
           		<div align="left"> 
					<eibsinput:cnofc name="trans" property="E01TCD" flag="20" fn_code="E01TCD" fn_description="E01TDS"  size="4" maxlength="4" />
					<eibsinput:text name="trans" property="E01TDS" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_NAME%>" size="45" maxlength="45" required="true"/>
 					<i class="fa fa-plus-square fa-fw plusIcon" id="moreDsc"> </i>					
           		</div>
           	</td>
	       	<td width="25%"> 
           	 	<div align="right">Numero Cliente :</div>
       		</td>
	       	<td width="25%"> 
           		<div align="left"> 
					<eibsinput:help name="trans" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CUSTOMER %>" property="E01CUN" fn_param_one="E01CUN"/>
           		</div>
           	</td>
          </tr>

          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
	       	<td width="20%"> 
           	 	<div align="right">Monto :</div>
       		</td>
	       	<td width="30%"> 
           		<div align="left"> 
					<eibsinput:text name="trans" property="E01AMT" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT%>" />
					<select name="E01DCC" >
						<option></option>
						<option value="D" <% if (trans.getE01DCC().equals("D")) out.print("selected");%>>Debito</option>
						<option value="C" <% if (trans.getE01DCC().equals("C")) out.print("selected");%>>Credito</option>
					</select>
           		</div>
           	</td>
	       	<td width="25%"> 
           	 	<div align="right">Tasa Cambio :</div>
       		</td>
	       	<td width="25%"> 
           		<div align="left"> 
					<eibsinput:text name="trans" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_EXCHANGE_RATE %>" property="E01FER" />
           		</div>
           	</td>
          </tr>

          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
	       	<td width="20%"> 
           	 	<div align="right">Fecha Valor :</div>
       		</td>
	       	<td width="30%"> 
           		<div align="left"> 
	    	        <eibsinput:date name="trans" fn_year="E01VDY" fn_month="E01VDM" fn_day="E01VDD" />
           		</div>
           	</td>
	       	<td width="25%"> 
           	 	<div align="right">Dias a Diferir :</div>
       		</td>
	       	<td width="25%"> 
           		<div align="left"> 
					<eibsinput:text name="trans" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_INTEGER %>" size="3" maxlength="2" property="E01DAY" />
           		</div>
           	</td>
          </tr>

          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
	       	<td width="20%"> 
           	 	<div align="right">Fecha Vencimiento :</div>
       		</td>
	       	<td width="30%"> 
           		<div align="left"> 
	    	        <eibsinput:date name="trans" fn_year="E01MDY" fn_month="E01MDM" fn_day="E01MDD" />
           		</div>
           	</td>
	       	<td width="25%"> 
           	 	<div align="right">Tasa Interes :</div>
       		</td>
	       	<td width="25%"> 
           		<div align="left"> 
					<eibsinput:text name="trans" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_RATE %>" property="E01RTE" />
           		</div>
           	</td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  
  
<div id="divDsc" class="hiddenDiv">
    <table class="approvalSearch" style="width: 500px">
    	<caption>Descripcion Adicional</caption>
      <tr > 
        <td align=CENTER  > 
          <div align="left">
			<textarea id="E01DSC" name="E01DSC" rows="9" cols="75">
          		<%= trans.getE01DSC() %>
          	</textarea>
          </div>
        </td>
      </tr>
      <tr></tr>
</table>
</div>  

  <div align="center">
    <input class="EIBSBTN" id="submitBtn" type=submit name="Submit" value="Enviar" >
  </div>
</form>
</body>
<% if (null != request.getAttribute("reload") && Boolean.valueOf(request.getAttribute("reload").toString())) { %>
<script type="text/javascript">
	top.opener.window.location.href = "<%=request.getContextPath()%>/pages/s/EGL0010_transaction_batch_list.jsp";
</script>
<% } %> 

<script type="text/javascript">
function closeHiddenDivs(){
	setVisibility(getElement('submitBtn'), "visible");
	closeHiddenDivDsc();
}

function closeHiddenDivDsc(){
	setVisibility(getElement("divDsc"), "hidden");
}

function showHiddenDsc(evt) {
	evt = (evt) ? evt : ((window.event) ? window.event : "");
 	var divName = "divDsc"; var divElm;

	divElm = getElement(divName);
	setVisibility(divElm, "visible");
	setVisibility(getElement('submitBtn'), "hidden");

	var y= $(document.body).height()/2 - $(getElement(divName)).height()/2;
	var x= $(document.body).width()/2 - $(getElement(divName)).width()/2;
	cancelBub(evt);
	moveElement(divElm, y, x);
}	

addEventHandler(document, 'click', closeHiddenDivs);
addEventHandler(getElement("divDsc"), 'click', function(){cancelBub(event);});
addEventHandler(getElement("moreDsc"), 'click', function(){ closeHiddenDivs();showHiddenDsc(event);});

</script>

 
</html>