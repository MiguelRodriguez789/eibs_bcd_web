<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<%@ page import = "datapro.eibs.master.Util" %>

<html>
<head>
<title>Transacciones Financieras</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V4.0 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/jquery/plugins/contextMenu/css/jquery.contextMenu.css" rel="stylesheet" type="text/css" />

<jsp:useBean id="msgPart" class="datapro.eibs.beans.EPR030001Message"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>


<SCRIPT type="text/javascript">

function enviar(){

	 if (document.getElementByID("E01PRAPTY").value == "") { 
		 alert("Debe Ingresar Prioridad");
		 return false;
	 }else{
		var pri= document.getElementByID("E01PRAPTY").value ;
		if (pri < 17 || pri > 99){
			 alert("Prioridad fuera de rango (17 - 99)");
			 return false;
		 }
	 }

 document.forms[0].Enviar.disabled = true;
 document.forms[0].submit();
}

</SCRIPT>


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
<h3 align="center">C&oacute;digo de Transacciones Financieras<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="transaction_codes_basic.jsp, EPR0300"></h3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.approval.JSEPR0300">
 
    <input type=HIDDEN name="SCREEN" value="500">

  <div id="OtherOpt">
    <table class="tableinfo"></table>
 <table class="tableinfo">
 <tr > 
      <td > 
          <table cellspacing=0 cellpadding=2 width="100%" border="0">
          	<tr id="trdark">
          		<td nowrap  width="25%">
          			<div align="right">Código de Transacción :</div>
          		</td>
              	<td nowrap width="25%"> 
                	<input type="text" name="E01PRATCD" size="6" maxlength="6" value="<%= msgPart.getE01PRATCD().trim()%>" >
                	<input type="text" name="E01PRADSC" size="30" maxlength="30" value="<%= msgPart.getE01PRADSC().trim()%>" >
              	</td>              
            </tr>
            <tr id="trclear"> 
              	<td nowrap  > 
                	<div align="right">Cuenta de Crédito :</div>
              	</td>
              	<td nowrap > 
                	<div align="left"> 
                  		<input type="text" name="E01PRADBK" id="E01PRADBK" size="2" maxlength="2" value="<%= msgPart.getE01PRADBK().trim()%>" >
                  		<input type="text" name="E01PRADBR" size="4" maxlength="4"  value="<%= msgPart.getE01PRADBR().trim()%>"
		                	class="context-menu-help" onmousedown="init(branchHelp,this.name,document.getElementById('E01PRADBK').value,'','','','')"onkeypress="enterInteger(event)">
                		<input type="text" name="E01PRADCY" id="E01PRADCY" size="3" maxlength="3" value="<%= msgPart.getE01PRADCY().trim()%>" 
							class="context-menu-help" onmousedown="init(currencyHelp,this.name,document.getElementById('E01PRADBK').value,'','','','')">
						<input type="text" name="E01PRADGL" size="17" maxlength="16" value="<%= msgPart.getE01PRADGL().trim()%>" onkeypress="enterInteger(event)"
							class="context-menu-help" onmousedown="init(ledgerHelp,this.name,document.getElementById('E01PRADBK').value,document.getElementById('E01PRADCY').value,'','','')">					
                	</div>
              	</td>
            </tr>   
            <tr id="trdark"> 
            	<td nowrap  > 
            		<div align="right">Contabiliza Cuenta ? :</div>
            	</td>
            	<TD nowrap>
					<div align="left"> 
              			<input type="radio" name="E01PRAACG" value="Y"
              			<%if(msgPart.getE01PRAACG().equals("Y") && msgPart.getE01PRAACG().equals("Y")) out.print("checked");%> >Sí 
						<input type="radio" name="E01PRAACG" value="N"
              			<%if(msgPart.getE01PRAACG().equals("N") && msgPart.getE01PRAACG().equals("N")) out.print("checked");%> >No
			        </div>
			    </TD>
            </tr>   
            <tr id="trclear"> 
              	<td nowrap  > 
                	<div align="right">Canal de Pago:</div>
              	</td>
              	<td nowrap > 
                	<div align="left"> 
                  		<input type="text" name="E01PRACNL" size="2" maxlength="1" value="<%= msgPart.getE01PRACNL().trim()%>">
		  				<a href="javascript:GetCodeTChannel('E01PRACNL','TMPPRACNL','')">
                  		<img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="bottom" border="0" ></a>                   
                  		<input	type="text" name="TMPPRACNL" size="30" maxlength="30" readonly>                  					                  	               					                  	
                	</div>
              	</td>
            </tr>   
            <tr id="trdark"> 
              	<td nowrap  > 
                	<div align="right">Prioridad por Defecto :</div>
              	</td>
              	<td nowrap > 
                	<div align="left"> 
                  		<input type="text" name="E01PRAPTY" id="E01PRAPTY" size="2" maxlength="2" value="<%= msgPart.getE01PRAPTY().trim()%>">
                	</div>
              	</td>                 
            </tr>             
            <tr id="trclear"> 
              	<td nowrap  > 
                	<div align="right">Mensaje Swift :</div>
              	</td>
              	<td nowrap > 
                	<div align="left"> 
		                <select name="E01PRAPVI">
		                  <option value=" " <% if (!(msgPart.getE01PRAPVI().equals("1") || msgPart.getE01PRAPVI().equals("2") || msgPart.getE01PRAPVI().equals("3") || 	msgPart.getE01PRAPVI().equals("R") || msgPart.getE01PRAPVI().equals("D") || msgPart.getE01PRAPVI().equals("G") || msgPart.getE01PRAPVI().equals("C") || msgPart.getE01PRAPVI().equals("4")|| msgPart.getE01PRAPVI().equals("5")|| msgPart.getE01PRAPVI().equals("6"))) out.print("selected"); %>></option>
		                  <option value="3" <% if (msgPart.getE01PRAPVI().equals("3")) out.print("selected"); %>>Swift MT-103</option>
		                  <option value="5" <% if (msgPart.getE01PRAPVI().equals("5")) out.print("selected"); %>>Swift MT-202</option>
		                  <option value="2" <% if (msgPart.getE01PRAPVI().equals("2")) out.print("selected"); %>>Swift MT-205</option>
		                </select>
                  	</div>
              	</td>                 
            </tr>                                               
            <tr id="trdark"> 
				<TD nowrap>
					<div align="right">Aprobación Finanzas : </div>
				</TD>
				<TD nowrap>
					<div align="left"> 
              			<input type="radio" name="E01PRAFAP" value="Y"
              			<%if(msgPart.getE01PRAFAP().equals("Y") && msgPart.getE01PRAFAP().equals("Y")) out.print("checked");%> >Sí 
              			<input type="radio" name="E01PRAFAP" value="N"
              			<%if(msgPart.getE01PRAFAP().equals("N") && msgPart.getE01PRAFAP().equals("N")) out.print("checked");%> >No
			        </div>
			    </TD>
			</tr>
			<tr id="trdark"> 
			    <td nowrap  > 
                	<div align="right"> Monto Mínimo  : </div>
                </td>
                <td nowrap > 
                	<div>
                  		<input type="text" name="E01PRACYF" size="3" maxlength="3" value="<%= msgPart.getE01PRACYF().trim()%>">
						<a href="javascript:GetCurrencyDesc('E01PRACYF','TMPPRACYF','')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="help" align="bottom" border="0"></a> 
                  		<input type="text" name="E01PRAMAF" size="17" maxlength="17" value="<%= msgPart.getE01PRAMAF().trim()%>" onKeyPress="enterDecimal()">                  
                	</div>
              	</td>
            </tr>
            <tr id="trclear"> 
				<TD nowrap>
					<div align="right">Liberación de Pagos : </div>
				</td>
				<TD nowrap>
					<div>
              			<input type="radio" name="E01PRAOAP" value="Y"
              			<%if(msgPart.getE01PRAOAP().equals("Y") && msgPart.getE01PRAOAP().equals("Y")) out.print("checked");%> >Sí 
              			<input type="radio" name="E01PRAOAP" value="N"
              			<%if(msgPart.getE01PRAOAP().equals("N") && msgPart.getE01PRAOAP().equals("N")) out.print("checked");%> >No
			         </div>
			    </TD>
			</tr>
			<tr id="trclear"> 
			    <td nowrap  > 
                	<div align="right">Monto Mínimo  :</div>
                </td>
                <td nowrap  >
                	<div>
                  		<input type="text" name="E01PRACYO" size="3" maxlength="3" value="<%= msgPart.getE01PRACYO().trim()%>">
						<a href="javascript:GetCurrencyDesc('E01PRACYO','TMPPRACYO','')">
						<img src="<%=request.getContextPath()%>/images/1b.gif" title="help" align="bottom" border="0"></a> 
                  		<input type="text" name="E01PRAMAO" size="17" maxlength="17" value="<%= msgPart.getE01PRAMAO().trim()%>" onKeyPress="enterDecimal()">                  	
                	</div>
              	</td>
            </tr>            
            <tr id="trdark"> 
              	<td nowrap > 
                	<div align="right">Clase de Producto :</div>
              	</td>
              	<td nowrap > 
                	<div align="left"> 
	                	<input type="text" name="E01PRAPRC" size="4" maxlength="4" value="<%= msgPart.getE01PRAPRC().trim()%>">
    	            	<a href="javascript:GetCodeDescCNOFC('E01PRAPRC','TMPPRAPRC','PC')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="middle" border="0"></a>
        	         	<input	type="text" name="TMPPRAPRC" size="30" maxlength="30" readonly>
                	</div>         	         
				</td>                 
            </tr>
            <tr id="trclear"> 
              	<td nowrap  > 
                	<div align="right">Area Responsable :</div>
              	</td>
              	<td nowrap > 
                	<div align="left"> 
                  		<input type="text" name="E01PRADPT" size="6" maxlength="4" value="<%= msgPart.getE01PRADPT()%>">
                		<a href="javascript:GetCodeDescCNOFC('E01PRADPT','TMPPRADPT','AR')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="middle" border="0"></a>
                 		<input	type="text" name="TMPPRADPT" size="30" maxlength="30" readonly>
                	</div>	
              	</td>
            </tr>   
            <tr id="trdark"> 
              	<td nowrap > 
                	<div align="right">Número de Firmas :</div>
              	</td>
              	<td nowrap > 
                	<div align="left"> 
                  		<input type="text" name="E01PRANFA" size="4" maxlength="2" value="<%= msgPart.getE01PRANFA()%>">
                	</div>
              	</td>
            </tr>                       
	</table>
	</td>
   </tr>
</table>
</div>

  
<p align="center"> 
<!--    <input id="EIBSBTN" type=SUBMIT name="Submit" value="Enviar" >-->
      	<INPUT id="EIBSBTN" type="button" name="Enviar" value="Enviar" onClick="enviar()">	
  </p>

</form>
  

</body>
</html>
