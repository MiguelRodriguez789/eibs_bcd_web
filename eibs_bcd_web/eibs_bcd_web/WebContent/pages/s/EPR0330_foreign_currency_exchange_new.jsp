<%@ page import ="datapro.eibs.master.Util" %>

<html>  
<head>
<title>Compraventa Moneda Extranjera</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/jquery/plugins/contextMenu/css/jquery.contextMenu.css" rel="stylesheet" type="text/css" />

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>


<jsp:useBean id= "msgInst" 	class= "datapro.eibs.beans.EPR033002Message"  	scope="session" />
<jsp:useBean id= "error" 	class= "datapro.eibs.beans.ELEERRMessage"  		scope="session" />
<jsp:useBean id= "userPO" 	class= "datapro.eibs.beans.UserPos"  			scope="session"/>

<% 
String newBean = "";
try { newBean = request.getParameter("NEW");} catch (Exception e) {}
if (newBean.equals("yes")) {
 	msgInst = new datapro.eibs.beans.EPR033002Message();
}
if (msgInst == null) {
 	msgInst = new datapro.eibs.beans.EPR033002Message();
}
if ( !error.getERRNUM().equals("0")  ) {
      error.setERRNUM("0");
%>
<SCRIPT type="text/javascript">
        showErrors();
</SCRIPT>
<%}%>
<script type="text/javascript">
function checkFieldChange(oldvalue,newvalue) {
	if (oldvalue.toLowerCase() != newvalue.toLowerCase()) {
		document.forms[0].H02FLGWK2.value = "1";
	}
}

function goAction(opt) {
	document.forms[0].H02FLGWK1.value = opt;
	document.forms[0].submit();
}
function GetComission() {
	page = "<%=request.getContextPath()%>/pages/s/EPR0330_foreign_currency_exchange_comission.jsp";
  	CenterWindow(page,500,300,1);
}
</script>
</head>
<body>

<H3 align="center">Creacion de Solicitudes de Compraventa de Moneda Extranjera<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="foreign_currency_exchange_new, EPR0330"></H3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.forex.JSEPR0330">
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="400">
  <INPUT TYPE=HIDDEN NAME="H02FLGWK1" VALUE="V">
  <INPUT TYPE=HIDDEN NAME="H02FLGWK2" value="<%= msgInst.getH02FLGWK2() %>">
  <INPUT TYPE=HIDDEN NAME="MOTIVO" VALUE="  ">
  <table class="tableinfo">
  	<tr> 
    	<td>
    		<table cellspacing=0 cellpadding=2 width="100%" border="0">    
     			<tr id=trclear> 
	      			<td nowrap> 
	        			<div align="right">Operacion : </div>
	      			</td>
	      			<td nowrap>
	      				<select name="E02REQOPC">
          	  				<option value="Y*" selected <%if (msgInst.getE02REQOPC().equals("Y*")) { out.print("selected"); }%>>Compra</option>
                			<option value="Y!" <%if (msgInst.getE02REQOPC().equals("Y!")) { out.print("selected"); }%>>Venta</option>
           				</select>
		 			 </td>
     			</tr>
     			<tr id=trdark> 
	      			<td nowrap width="40%"> 
	        			<div align="right">Banco : </div>
	      			</td>
	      			<td nowrap width="60%"> 
	        			<input type="text" name="E02REQBNK" size="3" maxlength="2" value="<%= userPO.getBank() %>" readonly >
	     	 		</td>
     			</tr>
     			<tr id=trclear> 
	      			<td nowrap> 
	        			<div align="right">Oficina : </div>
	      			</td>
	      			<td nowrap>
	      				<input type="text" name="E02REQBRN" size="5" maxlength="4" value="<%= userPO.getBranch() %>" readonly >
		  			</td>
     			</tr>
     			<tr id=trdark> 
	      			<td nowrap> 
	        			<div align="right">Instrumento : </div>
	      			</td>
	      			<td nowrap>
	      				<input type="text" name="E02REQINS" size="5" maxlength="4" value="<%= msgInst.getE02REQINS() %>" 
	      						onChange="checkFieldChange('<%=msgInst.getE02REQINS()%>',document.forms[0].E02REQINS.value)"
	      						onselect="checkFieldChange('<%=msgInst.getE02REQINS()%>',document.forms[0].E02REQINS.value)">
	      				<input type="text" name="E02REQINN" size="35" maxlength="35" value="<%= msgInst.getE02REQINN() %>" readonly >
      	    			<a href="javascript:GetCodeDescCNOFC('E02REQINS','E02REQINN','YJ')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="bottom" border="0" ></a>
      	    			<img src="<%=request.getContextPath()%>/images/Check.gif" title="campo obligatorio" align="bottom" border="0" width="16" height="20">
		  			</td>
     			</tr>
     			<tr id=trclear> 
		  			<td> 
		     			<div align="right">Moneda : </div>        
		  			</td>
      	  			<td nowrap> 
      	    			<input type="text" name="E02REQCCY" size="5" maxlength="3" value="<%= msgInst.getE02REQCCY() %>" 
      	    				onChange="checkFieldChange('<%=msgInst.getE02REQCCY()%>',document.forms[0].E02REQCCY.value)" 
      	    				onselect="checkFieldChange('<%=msgInst.getE02REQCCY()%>',document.forms[0].E02REQCCY.value)" >
      	    			<a href="javascript:GetInstCurrency('E02REQCCY',document.forms[0].E02REQBNK.value,document.forms[0].E02REQINS.value)"><img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="bottom" border="0" ></a>
      	    			<img src="<%=request.getContextPath()%>/images/Check.gif" title="campo obligatorio" align="bottom" border="0" width="16" height="20">
      	  			</td>     
      			</tr>
      			<tr id=trdark>
          			<td nowrap>
              			<div align="right">Cliente : </div>
          			</td>
          			<td nowrap>
             			<input type="text" name="E02REQCUS" size="10" maxlength="9" value="<%= msgInst.getE02REQCUS() %>" 
              				onChange="checkFieldChange('<%=msgInst.getE02REQCUS()%>',document.forms[0].E02REQCUS.value)"
              				onselect="checkFieldChange('<%=msgInst.getE02REQCUS()%>',document.forms[0].E02REQCUS.value)">
             			<input type="text" name="E02REQCUN" size="35" maxlength="35" value="<%= msgInst.getE02REQCUN() %>" readonly > 
			 			<a href="javascript:GetCustomerDescId('E02REQCUS','E02REQCUN','')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="bottom" border="0" ></a>
			 			<img src="<%=request.getContextPath()%>/images/Check.gif" title="campo obligatorio" align="bottom" border="0" width="16" height="20">
          			</td>
       			 </tr>
     		</table>
    	</td>
   </tr>
  </table>
  <br>  
  <table class="tableinfo">
  	<tr> 
    	<td>
    		<table cellspacing=0 cellpadding=2 width="100%" border="0">    
				<tr>
					<td nowrap width="40%">
						<div align="right">Motivo de Operacion:</div>
				</td>
					<td nowrap width="60%">
						<input type="text" name="E02REQOPR" size="5" maxlength="4" value="<%= msgInst.getE02REQOPR() %>" 
							onChange="checkFieldChange('<%=msgInst.getE02REQOPR()%>',document.forms[0].E02REQOPR.value)"
							onselect="checkFieldChange('<%=msgInst.getE02REQOPR()%>',document.forms[0].E02REQOPR.value)"> 
						<input type="text"  name="E02REQORN" size="35" maxlength="35" value="<%= msgInst.getE02REQORN() %>" readonly>
						<a href="javascript:GetCodeDescCNOFC('E02REQOPR','E02REQORN',document.forms[0].E02REQOPC.value)"><img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="bottom" border="0" ></a>
						<img src="<%=request.getContextPath()%>/images/Check.gif" title="campo obligatorio" align="bottom" border="0" width="16" height="20">
					</td>
				</tr>
				<tr>
					<td nowrap width="40%">
						<div align="right">Corresponsal:</div>
					</td>
					<td nowrap width="60%">
						<input type="text" name="E02REQCOR" size="10" maxlength="9" value="<%= msgInst.getE02REQCOR() %>" 
							onChange="checkFieldChange('<%=msgInst.getE02REQCOR()%>',document.forms[0].E02REQCOR.value)"
							onselect="checkFieldChange('<%=msgInst.getE02REQCOR()%>',document.forms[0].E02REQCOR.value)"> 
	      				<input type="text" name="E02REQCON" readonly size="35" maxlength="35" value="<%= msgInst.getE02REQCON() %>" readonly>
						<a href="javascript:GetCorrespondentDescId('E02REQCOR','E02REQCON','')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="bottom" border="0" ></a>
					</td>
				</tr>
				<tr>
					<td nowrap width="40%">
						<div align="right">AAD:</div>
					</td>
					<td nowrap width="60%">
						<input type="text" name="E02REQAAD" size="12" maxlength="10" value="<%= msgInst.getE02REQAAD() %>" 
							onChange="checkFieldChange('<%=msgInst.getE02REQAAD()%>',document.forms[0].E02REQAAD.value)"
							onselect="checkFieldChange('<%=msgInst.getE02REQAAD()%>',document.forms[0].E02REQAAD.value)"> 
					</td>
				</tr>
				<tr>
					<td nowrap width="40%">
						<div align="right">ALD:</div>
					</td>
					<td nowrap width="60%">
						<input type="text" name="E02REQALD" size="12" maxlength="10" value="<%= msgInst.getE02REQALD() %>" 
							onChange="checkFieldChange('<%=msgInst.getE02REQALD()%>',document.forms[0].E02REQALD.value)"
							onselect="checkFieldChange('<%=msgInst.getE02REQALD()%>',document.forms[0].E02REQALD.value)"> 
					</td>
				</tr>
				<tr>
					<td nowrap width="40%">
						<div align="right">Fecha de Liquidacion SPOT:</div>
					</td>
					<td nowrap width="60%">
                		<input type="text" name="E02REQVD1" size="3" maxlength="2" value="<%= msgInst.getE02REQVD1() %>">
                		<input type="text" name="E02REQVD2" size="3" maxlength="2" value="<%= msgInst.getE02REQVD2() %>">
                		<input type="text" name="E02REQVD3" size="5" maxlength="4" value="<%= msgInst.getE02REQVD3() %>">
						<a href="javascript:DatePicker(document.forms[0].E02REQVD1,document.forms[0].E02REQVD2,document.forms[0].E02REQVD3)"><img src="<%=request.getContextPath()%>/images/calendar.gif" title=". . ." align="bottom" border="0" ></a>
					</td>
				</tr>
     		</table>
    	</td>
   	 </tr>
  </table>
  <br>
 
<table class="tableinfo">
	<tr> 
   		<td>
    		<table cellspacing=0 cellpadding=2 width="100%" border="0">    
				<tr>
					<td nowrap width="40%">
						<div align="right">Valor en Moneda Extranjera:</div>
					</td>
					<td nowrap width="60%">
						<input type="text" name="E02REQFEA" size="15" maxlength="15" value="<%= msgInst.getE02REQFEA() %>" onchange="checkFieldChange('<%=msgInst.getE02REQFEA()%>',document.forms[0].E02REQFEA.value)" 
						onselect="checkFieldChange('<%=msgInst.getE02REQFEA()%>',document.forms[0].E02REQFEA.value)">
						<img src="<%=request.getContextPath()%>/images/Check.gif" title="campo obligatorio" align="bottom" border="0" width="16" height="20"> 
					</td>
				</tr>
				<tr>
					<td nowrap width="40%">
						<div align="right">Valor Tasa de Cambio:</div>
					</td>
					<td nowrap width="60%">
						<input type="text" name="E02REQEXR" size="20" maxlength="15" value="<%= msgInst.getE02REQEXR() %>" onChange="checkFieldChange('<%=msgInst.getE02REQEXR()%>',document.forms[0].E02REQEXR.value)" 
						onselect="checkFieldChange('<%=msgInst.getE02REQEXR()%>',document.forms[0].E02REQEXR.value)"> 
					</td>
				</tr>
				<tr>
					<td nowrap width="40%">
						<div align="right">Valor en Moneda Local:</div>
					</td>
					<td nowrap width="60%">
						<input type="text" name="E02REQLCA" readonly size="20" maxlength="15" value="<%= msgInst.getE02REQLCA() %>" readonly> 
					</td>
				</tr>
				<tr>
					<td nowrap width="40%">
						<div align="right">Valor de Comision:</div>
					</td>
					<td nowrap width="60%">
						<input type="text" name="E02REQCOA" readonly size="20" maxlength="15" value="<%= msgInst.getE02REQCOA() %>" readonly>
						<%if (!msgInst.getE02REQCOA().equals("0.00")) {%>
						<a href="javascript:GetComission()"><img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="bottom" border="0" ></a>
						<%}%> 
					</td>
				</tr>
				<tr>
					<td nowrap>
						<div align="right">Valor Total:</div>
					</td>
					<td nowrap>
						<input type="text" name="E02REQTOA" size="20" maxlength="15" value="<%= msgInst.getE02REQTOA() %>" readonly > 
					</td>
				</tr>
    		 </table>
		</td>
	</tr>
</table>
<br>
 <TABLE  id="mainTable" class="tableinfo">
  	<TR>
  		<TD>
   			<table id="headTable" width="100%">
    			<tr id="trdark" align="center"> 
      				<td nowrap align="center" >Concepto</td>
      				<td nowrap align="center" >Banco</td>
      				<td nowrap align="center" >Sucursal</td>
      				<td nowrap align="center" >Moneda</td>
      				<td nowrap align="center" >Cuenta Cliente</td>
      				<td nowrap align="center" >Valor</td>
    			</tr>
   				<tr id="trclear" align="center"> 
      				<td nowrap > 
          				<div align="center" > 
          					<input type="text" name="E02OFFOP1" size="3" maxlength="2" value="<%= msgInst.getField("E02OFFOP1").getString().trim() %>" readonly>
          					<input type="hidden" name="E02OFFGL1" value="<%= msgInst.getField("E02OFFGL1").getString().trim() %>">
          					<input type="text" name="E02OFFCO1" size="25" maxlength="25" readonly value="<%= msgInst.getField("E02OFFCO1").getString().trim() %>" >
          				</div>
      				</td>
      				<td nowrap > 
          				<div align="center"> 
            				 <input type="text" name="E02OFFBK1" size="2" maxlength="2" value="<%= msgInst.getE02OFFBK1() %>">
          				</div>
      				</td>
      				<td nowrap> 
          				<div align="center"> 
             				<input type="text" name="E02OFFBR1" size="4" maxlength="4" value="<%= msgInst.getE02OFFBR1() %>"
            				 class="context-menu-help" onmousedown="init(branchHelp,this.name,document.forms[0].E02REQBNK.value,'','','','')">
         				</div>
       				</td>
       				<td nowrap> 
          				<div align="center"> 
             				<input type="text" name="E02OFFCY1" size="3" maxlength="3" value="<%= msgInst.getE02OFFCY1() %>"
             				class="context-menu-help" onmousedown="init(currencyHelp,this.name,document.forms[0].E02REQBNK.value,'','','','')">
          				</div>
       				</td>
       				<td nowrap > 
          				<div align="center"> 
             				<input type="text" name="E02OFFAC1" size="13" maxlength="12"  value="<%= msgInst.getE02OFFAC1() %>"
            				class="context-menu-help" onmousedown="init(lnreferHelp,this.name,document.forms[0].E02REQBNK.value,'',document.forms[0].E02REQCUS.value,'','RX')">
          				</div>
       				</td>
       				<td nowrap > 
          				<div align="center"> 
             				<input type="text" name="E02OFFVA1" size="18" maxlength="15" value="<%= msgInst.getE02OFFVA1() %>" onkeypress="enterDecimal()">
          				</div>
       				</td>
      			</tr>
      			<tr id="trdark" align="center"> 
      				<td nowrap > 
          				<div align="center" > 
          					<input type="text" name="E02OFFOP2" size="3" maxlength="2" value="<%= msgInst.getField("E02OFFOP2").getString().trim() %>" readonly>
          					<input type="hidden" name="E02OFFGL2" value="<%= msgInst.getField("E02OFFGL2").getString().trim() %>">
          					<input type="text" name="E02OFFCO2" size="25" maxlength="25" readonly value="<%= msgInst.getField("E02OFFCO2").getString().trim() %>" >
          				</div>
      				</td>
      				<td nowrap > 
          				<div align="center"> 
             				<input type="text" name="E02OFFBK2" size="2" maxlength="2" value="<%= msgInst.getE02OFFBK2() %>">
          				</div>
     				 </td>
      				<td nowrap> 
          				<div align="center"> 
             				<input type="text" name="E02OFFBR2" size="4" maxlength="4" value="<%= msgInst.getE02OFFBR2() %>"
             				class="context-menu-help" onmousedown="init(branchHelp,this.name,document.forms[0].E02REQBNK.value,'','','','')">
          				</div>
       				</td>
       				<td nowrap> 
          				<div align="center"> 
             				<input type="text" name="E02OFFCY2" size="3" maxlength="3" value="<%= msgInst.getE02OFFCY2() %>"
             				class="context-menu-help" onmousedown="init(currencyHelp,this.name,document.forms[0].E02REQBNK.value,'','','','')">
          				</div>
       				</td>
       				<td nowrap > 
         				 <div align="center"> 
             				<input type="text" name="E02OFFAC2" size="13" maxlength="12"  value="<%= msgInst.getE02OFFAC2() %>"
             				class="context-menu-help" onmousedown="init(lnreferHelp,this.name,document.forms[0].E02REQBNK.value,'',document.forms[0].E02REQCUS.value,'','RX')">
          				</div>
        			</td>
        			<td nowrap > 
          				<div align="center"> 
             				<input type="text" name="E02OFFVA2" size="18" maxlength="15" value="<%= msgInst.getE02OFFVA2() %>" onkeypress="enterDecimal()">
          				</div>
        			</td>
      			</tr>
      			<tr id="trclear" align="center"> 
      				<td nowrap > 
         				<div align="center" > 
          					<input type="text" name="E02OFFOP3" size="3" maxlength="2" value="<%= msgInst.getField("E02OFFOP3").getString().trim() %>" readonly>
          					<input type="hidden" name="E02OFFGL3" value="<%= msgInst.getField("E02OFFGL3").getString().trim() %>">
          					<input type="text" name="E02OFFCO3" size="25" maxlength="25" readonly value="<%= msgInst.getField("E02OFFCO3").getString().trim() %>" >
          				</div>
      				</td>
      				<td nowrap > 
          				<div align="center"> 
             				<input type="text" name="E02OFFBK3" size="2" maxlength="2" value="<%= msgInst.getE02OFFBK3() %>">
          				</div>
      				</td>
      				<td nowrap> 
          				<div align="center"> 
            				<input type="text" name="E02OFFBR3" size="4" maxlength="4" value="<%= msgInst.getE02OFFBR3() %>"
             				class="context-menu-help" onmousedown="init(branchHelp,this.name,document.forms[0].E02REQBNK.value,'','','','')">
          				</div>
       				</td>
       				<td nowrap> 
          				<div align="center"> 
             				<input type="text" name="E02OFFCY3" size="3" maxlength="3" value="<%= msgInst.getE02OFFCY3() %>"
             				class="context-menu-help" onmousedown="init(currencyHelp,this.name,document.forms[0].E02REQBNK.value,'','','','')">
          				</div>
       				</td>
       				<td nowrap > 
          				<div align="center"> 
             				<input type="text" name="E02OFFAC3" size="13" maxlength="12"  value="<%= msgInst.getE02OFFAC3() %>"
             				class="context-menu-help" onmousedown="init(lnreferHelp,this.name,document.forms[0].E02REQBNK.value,'',document.forms[0].E02REQCUS.value,'','RX')">
          				</div>
       				</td>
       				<td nowrap > 
          				<div align="center"> 
             				<input type="text" name="E02OFFVA3" size="18" maxlength="15" value="<%= msgInst.getE02OFFVA3() %>" onkeypress="enterDecimal()">
          				</div>
       				</td>
      			</tr>
      			<tr id="trdark" align="center"> 
      				<td nowrap > 
          				<div align="center" > 
          					<input type="text" name="E02OFFOP4" size="3" maxlength="2" value="<%= msgInst.getField("E02OFFOP4").getString().trim() %>" readonly>
          					<input type="hidden" name="E02OFFGL4" value="<%= msgInst.getField("E02OFFGL4").getString().trim() %>">
          					<input type="text" name="E02OFFCO4" size="25" maxlength="25" readonly value="<%= msgInst.getField("E02OFFCO4").getString().trim() %>" >
          				</div>
      				</td>
      				<td nowrap > 
          				<div align="center"> 
             				<input type="text" name="E02OFFBK4" size="2" maxlength="2" value="<%= msgInst.getE02OFFBK4() %>">
          				</div>
      				</td>
      				<td nowrap> 
          				<div align="center"> 
             				<input type="text" name="E02OFFBR4" size="4" maxlength="4" value="<%= msgInst.getE02OFFBR4() %>"
            				class="context-menu-help" onmousedown="init(branchHelp,this.name,document.forms[0].E02REQBNK.value,'','','','')">
          				</div>
       				</td>
       				<td nowrap> 
          				<div align="center"> 
             				<input type="text" name="E02OFFCY4" size="3" maxlength="3" value="<%= msgInst.getE02OFFCY4() %>"
             				class="context-menu-help" onmousedown="init(currencyHelp,this.name,document.forms[0].E02REQBNK.value,'','','','')">
          				</div>
       				</td>
       				<td nowrap > 
          				<div align="center"> 
             				<input type="text" name="E02OFFAC4" size="13" maxlength="12"  value="<%= msgInst.getE02OFFAC4() %>"
             				class="context-menu-help" onmousedown="init(lnreferHelp,this.name,document.forms[0].E02REQBNK.value,'',document.forms[0].E02REQCUS.value,'','RX')">
          				</div>
        			</td>
        			<td nowrap > 
          				<div align="center"> 
             				<input type="text" name="E02OFFVA4" size="18" maxlength="15" value="<%= msgInst.getE02OFFVA4() %>" onkeypress="enterDecimal()">
          				</div>
        			</td>
      			</tr>
      			<tr id="trclear" align="center"> 
      				<td nowrap > 
          				<div align="center" > 
          					<input type="text" name="E02OFFOP5" size="3" maxlength="2" value="<%= msgInst.getField("E02OFFOP5").getString().trim() %>" readonly>
          					<input type="hidden" name="E02OFFGL5" value="<%= msgInst.getField("E02OFFGL5").getString().trim() %>">
          					<input type="text" name="E02OFFCO5" size="25" maxlength="25" readonly value="<%= msgInst.getField("E02OFFCO5").getString().trim() %>" >
          				</div>
      				</td>
      				<td nowrap > 
          				<div align="center"> 
             				<input type="text" name="E02OFFBK5" size="2" maxlength="2" value="<%= msgInst.getE02OFFBK5() %>">
          				</div>
      				</td>
      				<td nowrap> 
          				<div align="center"> 
             				<input type="text" name="E02OFFBR5" size="4" maxlength="4" value="<%= msgInst.getE02OFFBR5() %>"
             				class="context-menu-help" onmousedown="init(branchHelp,this.name,document.forms[0].E02REQBNK.value,'','','','')">
          				</div>
       				</td>
       				<td nowrap> 
          				<div align="center"> 
             				<input type="text" name="E02OFFCY5" size="3" maxlength="3" value="<%= msgInst.getE02OFFCY5() %>"
             				class="context-menu-help" onmousedown="init(currencyHelp,this.name,document.forms[0].E02REQBNK.value,'','','','')">
          				</div>
       				</td>
       				<td nowrap > 
          				<div align="center"> 
             				<input type="text" name="E02OFFAC5" size="13" maxlength="12"  value="<%= msgInst.getE02OFFAC5() %>"
             				class="context-menu-help" onmousedown="init(lnreferHelp,this.name,document.forms[0].E02REQBNK.value,'',document.forms[0].E02REQCUS.value,'','RX')">
          				</div>
       				</td>
       				<td nowrap > 
          				<div align="center"> 
             				<input type="text" name="E02OFFVA5" size="18" maxlength="15" value="<%= msgInst.getE02OFFVA5() %>" onkeypress="enterDecimal()">
          				</div>
       				</td>
      			</tr>
     		</table>       
   		</TD>  
	</TR>	
</TABLE>    

  <p align="center"> 
    <input id="EIBSBTN" type="button" name="Submit" value="Preliquidar" onclick="goAction('V')">
    <input id="EIBSBTN" type="button" name="Submit" value="Salvar" onclick="goAction('P')">
    <input id="EIBSBTN" type="button" name="Submit" value="Extracupo" onclick="goAction('E')">
    <input id="EIBSBTN" type="button" name="Submit" value="Cancelar" onclick="top.close()">
  </p>
  
  <script type="text/javascript">
	  document.forms[0].E02REQOPC.focus();
  </script>
  
</form>
</body>
</html>