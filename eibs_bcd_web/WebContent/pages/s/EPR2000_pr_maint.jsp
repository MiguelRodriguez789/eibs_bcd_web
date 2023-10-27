<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<title>Payment and Receiving</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/jquery/plugins/contextMenu/css/jquery.contextMenu.css" rel="stylesheet" type="text/css" />

<jsp:useBean id="prBasic" class="datapro.eibs.beans.EPR200001Message"  scope="session" />
<jsp:useBean id="error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos"  scope="session" />

<SCRIPT SRC="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<SCRIPT SRC="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>


<SCRIPT type="text/javascript">
  
  	function showTab(index){  
  		for (var i=0; i<4; i++){
   			document.getElementById("Tab"+i).className = "tabnormal";
   			document.getElementById("dataTab"+i).style.display = "none";
   		}
    	document.getElementById("Tab"+index).className = "tabhighlight";  
  		document.getElementById("dataTab"+index).style.display = "block";
  	}

  	function setHelp(val) {
  		document.getElementById("accTyp").style.display = "none";
    	if (val=="1" ) {
    		document.getElementById("recivHelp").href = "javascript:GetFedId('E01PRPRPD')";
    		document.getElementById("recivHelp").style.display = "block";
    	} else if (val=="2" || val=="3") {
  			document.getElementById("recivHelp").href = "javascript:GetSwiftId('E01PRPRPD')";
  			document.getElementById("recivHelp").style.display = "block";
  		} else if (val=="5") {
  			document.getElementById("accTyp").style.display = "block";
  		} else 
  			document.getElementById("recivHelp").style.display = "none";
  	}
  
</SCRIPT>

</head>

<body>

<% 
 if ( !error.getERRNUM().equals("0")  ) {
     out.println("<SCRIPT Language=\"Javascript\">");
	 error.setERRNUM("0");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
 }
 
 String title = (userPO.getPurpose().equals("NEW")) ? "Apertura" : "Mantenimiento";

 int via = 0;
 try {
 	via = Integer.parseInt(prBasic.getE01PRPVIA());
 } catch (Exception e) {
 	via = 7;
 } 
%>

<h3 align="center"><%=title%> Ordenes de Pago 
	<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="pr_maint.jsp, EPR2000" ></h3>
<hr size="4">


<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.transfer.JSEPR2000">

  <INPUT TYPE=HIDDEN NAME="SCREEN" id="SCREEN" VALUE="2">
  	
  <table class="tableinfo" >
    <tr> 
      <td > 
      <table  cellspacing=0 cellpadding=0 width="100%">
      <tr id=trdark>
      	<td nowrap width="30%" > 
        <div align="right">Cuenta :</div>
      	</td>
      	<td nowrap width="10%">  
        <% if (userPO.getPurpose().equals("NEW")) {
        	prBasic.setE01PRPDAC(userPO.getAccNum());
        %>
        <% } %>
          <input type="text" name="account" id="account" size="13" maxlength="12" value="<%= prBasic.getE01PRPDAC()%>">
        </td>
      	<td nowrap width="20%"> 
        <div align="right">Referencia : </div>
      	</td>
      	<% if (userPO.getPurpose().equals("NEW")) {%>
      	<td nowrap width="40%" >
      	  <input type="hidden" name="E01PRPNUM" id="E01PRPNUM" size="12" maxlength="11" value="99999999999">
      	  <B>NUEVA</B>                              
      	</td>
      	<% } else {%>
      	<td nowrap width="40%" >
      	  <input type="text" name="E01PRPNUM" id="E01PRPNUM" size="12" maxlength="11" value="<%= prBasic.getE01PRPNUM()%>">                              
      	</td>
      	<% } %>
      	</tr>
  	  </table>
  	  </td>
    </tr>
  </table>
  <h4>Informaci&oacute;n B&aacute;sica </h4>
  <table class="tableinfo">
    <tr> 
      <td align="center"> 
  			<table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr id="trdark" > 
                      <td nowrap width="31%" > 
                        <div align="right">Via de Pago :</div>
                      </td>
                      <td nowrap width="25%"> 
                        <select name="E01PRPVIA" id="E01PRPVIA" onchange="setHelp(this.value)">
                          <option value="1" <%=via == 1 ? "selected" : ""%>>FED</option>
                          <option value="2" <%=via == 2 ? "selected" : ""%>>Swift MT-100/103</option>
                          <option value="3" <%=via == 3 ? "selected" : ""%>>Swift MT-200/202</option>
                          <option value="4" <%=via == 4 ? "selected" : ""%>>Chips</option>
                          <option value="5" <%=via == 5 ? "selected" : ""%>>ACH</option>
                          <option value="6" <%=via == 6 ? "selected" : ""%>>Cheque Gerencia</option>
                          <option value="7" <%=via == 7 ? "selected" : ""%>>Interna</option>                          
                        </select>
                      </td>
                      <td nowrap width="27%"> 
                        <div align="right">Tabla Comision :</div>
                      </td>
                      <td nowrap width="17%"> 
                        <input type="text" name="E01PRPCOT" id="E01PRPCOT" size="4" maxlength="3" value="<%= prBasic.getE01PRPCOT().trim()%>">                      
                        <input type="hidden" name="AMTCOT">                      
                        <a href="javascript:GetCNTRLPRF('E01PRPCOT','AMTCOT')"><img src="<%=request.getContextPath()%>/images/1b.gif" align="bottom" border="0" title="help" ></a>                  
                      </td>
                    </tr>
                    <tr id="trclear"> 
                      <td nowrap width="31%"> 
                        <div align="right">Monto Transferencia :</div>
                      </td>
                      <td nowrap > 
                        <input type="text" name="E01PRPAMT" size="17" maxlength="17" value="<%= prBasic.getE01PRPAMT().trim()%>" onkeypress="enterDecimal()">
                      </td>
                      <td nowrap> 
                        <div align="right">Moneda :</div>
                      </td>
                      <td nowrap> 
                        <input type="text" name="E01PRPTCY" size="4" maxlength="3" value="<%= prBasic.getE01PRPTCY().trim()%>">
                        <a href="javascript:GetCurrency('E01PRPTCY','')"><img src="<%=request.getContextPath()%>/images/1b.gif" align="bottom" border="0" title="help" ></a>                  
                      </td>
                    </tr>
                    <tr id="trdark" > 
                      <td nowrap width="31%"> 
                        <div align="right">Ref. Beneficiario :</div>
                      </td>
                      <td nowrap width="25%"> 
                        <input type="text" name="E01PRPTHF" size="16" maxlength="16" value="<%= prBasic.getE01PRPTHF().trim()%>">
                      </td>
                      <td nowrap width="27%"> 
                        <div align="right">Ref. Ordenante :</div>
                      </td>
                      <td nowrap width="17%"> 
                        <input type="text" name="E01PRPSRF" size="16" maxlength="16" value="<%= prBasic.getE01PRPSRF().trim()%>">
                      </td>
                    </tr>
                    <tr id="trclear" > 
                      <td nowrap width="31%" >
                      <div align="right">Ident.Recibidor :</div>
                      </td>
                      <td nowrap width="25%"> 
                        <input type="text" name="E01PRPRPD" size="25" maxlength="25" value="<%= prBasic.getE01PRPRPD().trim()%>">
                        <A href="javascript:GetAchOperator('E01PRPRPD','','E01PRPRSH','D')">
						<IMG src="<%=request.getContextPath()%>/images/1b.gif" alt="Ayuda ACH" border="0" align="top">
						</A>
						<a id="recivHelp" style="display:none">
						<img src="<%=request.getContextPath()%>/images/1b.gif" alt="Ayuda SWIFT" border="0" align="top" ></a>                  
                      </td>
                      <td nowrap width="27%"> 
                        <div align="right">Nombre Corto Recibidor :</div>
                      </td>
                      <td nowrap width="17%"> 
                        <input type="text" name="E01PRPRSH" size="25" maxlength="25" value="<%= prBasic.getE01PRPRSH().trim()%>">
                      </td>
                    </tr>                   
                  </table>
      </td>
    </tr>
  </table>
   <h4>Orden de Pago</h4>
  <table class="tableinfo">
    <tr> 
      <td align="center"> 
  			<table width="100%" border="0" cellspacing="0" cellpadding="0"> 
                    <tr id="trdark" > 
                      <td nowrap > 
                        <div align="right">Descripcion :</div>
                      </td>
                      <td nowrap colspan=7> 
                        <input type="text" name="E01PRPDSC" id="E01PRPDSC" size="65" maxlength="60" value="<%= prBasic.getE01PRPDSC()%>"> 
					  </td>
					 </tr>	
                    <tr id="trclear"> 
                      <td nowrap > 
                        <div align="right">Frecuencia de Pago :</div>
                      </td>
                      <td nowrap colspan=7> 
                        <select name="E01PRPFRQ">
                          <option value="D" <% if(prBasic.getE01PRPFRQ().equals("D")) out.print("selected");%>>Diario</option>
                          <option value="W" <% if(prBasic.getE01PRPFRQ().equals("W")) out.print("selected");%>>Semanal</option>
                          <option value="M" <% if(prBasic.getE01PRPFRQ().equals("M")) out.print("selected");%>>Mensual</option>
                          <option value="V" <% if(prBasic.getE01PRPFRQ().equals("V")) out.print("selected");%>>Variable</option>
                          <option value="2" <% if(prBasic.getE01PRPFRQ().equals("2")) out.print("selected");%>>Cada 2 Meses</option>
                          <option value="3" <% if(prBasic.getE01PRPFRQ().equals("3")) out.print("selected");%>>Cada 3 Meses</option>
                        </select>
                      </td>
                    </tr>
                    <tr id=trdark> 
                      <td nowrap > 
                        <div align="right"> D&iacute;a de Pago :</div>
                      </td>
                      <td nowrap colspan=7> 
                        <input type="text" name="E01PRPPMD" id="E01PRPPMD" size="3" maxlength="2" value="<%= prBasic.getE01PRPPMD()%>" >
                        <a href="javascript:GetCode('E01PRPPMD','STATIC_rt_ciclo.jsp')"><img src="<%=request.getContextPath()%>/images/1b.gif" align="bottom" border="0" title="help" ></a> 
                      </td>
                    </tr>
                    <tr id="trclear"> 
                      <td nowrap > 
                        <div align="right"> o N&uacute;mero de D&iacute;as :</div>
                      </td>
                      <td nowrap colspan=7> 
                        <input type="text" name="E01PRPDYS" id="E01PRPDYS" size="4" maxlength="3" value="<%= prBasic.getE01PRPDYS()%>" >
                        (Para frecuencia de pagos variable solamente) </td>
                    </tr>
                    <tr id="trdark" > 
                      <td nowrap > 
                        <div align="right">N&uacute;mero de Pagos :</div>
                      </td>
                      <td nowrap colspan=7> 
                        <input type="text" name="E01PRPNPM" id="E01PRPNPM" size="6" maxlength="4" value="<%= prBasic.getE01PRPNPM()%>" >
                        (9999 = Indefinido) </td>
                    </tr>
                    <tr id="trclear" > 
                      <td nowrap > 
                        <div align="right">Tipo de Pago :</div>
                      </td>
                      <td nowrap colspan=7> 
                        <input type="radio" name="E01PRPPMT" value="F" 
              <%if(!prBasic.getE01PRPPMT().equals("V")) out.print("checked");%>>
                        Fijo 
                        <input type="radio" name="E01PRPPMT" value="V" 
              <%if(prBasic.getE01PRPPMT().equals("V")) out.print("checked");%>>
                        Variable </td>
                    </tr>
                    <tr id="trdark" > 
                      <td nowrap > 
                        <div align="right">Autoriza Sobregiros :</div>
                      </td>
                      <td nowrap colspan=7> 
                        <input type="radio" name="E01PRPODA" value="Y" 
              <%if(prBasic.getE01PRPODA().equals("Y")) out.print("checked");%>>
                        S&iacute; 
                        <input type="radio" name="E01PRPODA" value="N" 
              <%if(!prBasic.getE01PRPODA().equals("Y")) out.print("checked");%>>
                        No </td>
                    </tr>
                    <tr id="trclear"> 
                      <td nowrap > 
                        <div align="right">Suspender Pago :</div>
                      </td>
                      <td nowrap colspan=7> 
                        <input type="radio" name="E01PRPSPM" value="Y" 
              <%if(prBasic.getE01PRPSPM().equals("Y")) out.print("checked");%>>
                        S&iacute; 
                        <input type="radio" name="E01PRPSPM" value="N" 
              <%if(!prBasic.getE01PRPSPM().equals("Y")) out.print("checked");%>>
                        No </td>
                    </tr>
             
                  </table>
  		 </td>            
    </tr>
  </table>
 <h4>Ultimo Pago</h4>
 <table class="tableinfo">
    <tr> 
      <td align="center"> 
  			<table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr id="trdark">                        
                      <td nowrap width="31%"> 
                        <div align="right">Fecha :</div>
                      </td>
                      <td nowrap > 
                        <input type="text" name="E01PRPLPD" size="3" maxlength="2" value="<%= prBasic.getE01PRPLPD().trim()%>" readonly>                        
                        <input type="text" name="E01PRPLPM" size="3" maxlength="2" value="<%= prBasic.getE01PRPLPM().trim()%>" readonly>
                        <input type="text" name="E01PRPLPY" size="5" maxlength="4" value="<%= prBasic.getE01PRPLPY().trim()%>" readonly>
                      </td>
                      <td nowrap> 
                        <div align="right">Monto :</div>
                      </td>
                      <td nowrap> 
                        <input type="text" name="E01PRPLPA" size="12" maxlength="12" value="<%= prBasic.getE01PRPLPA().trim()%>" readonly>
                      </td>
                    </tr>
                    <tr id="trclear" > 
                      <td nowrap width="31%"> 
                        <div align="right">No. Referencia :</div>
                      </td>
                      <td nowrap width="25%"> 
                        <input type="text" name="E01PRPLRF" size="10" maxlength="9" value="<%= prBasic.getE01PRPLRF().trim()%>" readonly>
                      </td>
                      <td nowrap width="27%"> 
                        <div align="right">No. Pago :</div>
                      </td>
                      <td nowrap width="17%"> 
                        <input type="text" name="E01PRPLPN" size="5" maxlength="5" value="<%= prBasic.getE01PRPLPN().trim()%>" readonly>
                      </td>
                    </tr>
                                     
                  </table>
      </td>
    </tr>
  </table>
    <h4>Cuenta de D&eacute;bito</h4>
    
    <TABLE class="tableinfo">
      <tr id="trdark"> 
        <td nowrap align="center" >Concepto</td>
        <td nowrap align="center" >Banco</td>
        <td nowrap align="center" >Agencia</td>
        <td nowrap align="center" >Moneda</td>
        <td nowrap align="center" >Cuenta Contable</td>
        <td nowrap align="center" >Cuenta</td>
        <td nowrap align="center" >Centro de Costo</td>
      </tr>
      <tr id="trclear"> 
        <td nowrap > 
          <div align="center"> 
            <input readonly type="text" name="E01PRPDRS" size="2" maxlength="2"  value="<%= prBasic.getE01PRPDRS().trim()%>" onkeypress="enterInteger(event)" readonly>
            <input readonly type="text" name="E01PRIDPD" size="25" maxlength="25"  value="<%= prBasic.getE01PRIDPD().trim()%>" readonly>
          </div>
        </td>
        <td nowrap > 
          <div align="center"> 
            <input readonly type="text" name="E01PRPDBK" size="2" maxlength="2" value="<%= prBasic.getE01PRPDBK().trim()%>" >
          </div>
        </td>
        <td nowrap > 
          <div align="center"> 
            <input readonly type="text" name="E01PRPDBR" size="5" maxlength="4"  value="<%= prBasic.getE01PRPDBR().trim()%>">
          </div>
        </td>
        <td nowrap > 
          <div align="center"> 
            <input readonly type="text" name="E01PRPDCY" size="3" maxlength="3" value="<%= prBasic.getE01PRPDCY().trim()%>">
          </div>
        </td>
        <td nowrap > 
          <div align="center"> 
            <input readonly type="text" name="E01PRPDGL" size="17" maxlength="16" value="<%= prBasic.getE01PRPDGL().trim()%>" onkeypress="enterInteger(event)">
          </div>
        </td>
        <td nowrap  > 
          <div align="center"> 
            <input readonly type="text" name="E01PRPDAC" size="13" maxlength="12" value="<%= prBasic.getE01PRPDAC().trim()%>">
          </div>
        </td>
        <td nowrap > 
          <div align="center"> 
            <input readonly type="text" name="E01PRPDCC" size="9" maxlength="8"  value="<%= prBasic.getE01PRPDCC().trim()%>">
          </div>
        </td>
      </tr>
    </table>
    <h4>Cuenta de Cr&eacute;dito</h4>
    <table class="tableinfo" >
      <tr id="trdark"> 
        <td nowrap align="center" >Concepto</td>
        <td nowrap align="center" >Banco </td>
        <td nowrap align="center" >Agencia</td>
        <td nowrap align="center" >Moneda</td>
        <td nowrap align="center" >Cuenta Contable</td>
        <td nowrap align="center" >Cuenta</td>
        <td nowrap align="center" >Centro de Costo</td>
      </tr>
      <tr id="trclear"> 
        <td nowrap > 
          <div align="center"> 
            <input type="text" name="E01PRPCRS" id="E01PRPCRS" size="2" maxlength="2"  value="<%= prBasic.getE01PRPCRS().trim()%>" onKeyPress="enterInteger(event)" readonly>
            <input type="text" name="E01PRICPD" id="E01PRICPD" size="25" maxlength="25"  value="<%= prBasic.getE01PRICPD().trim()%>" readonly
             class="context-menu-help"
			 onmousedown="init(conceptHelp,this.name,document.getElementById('E01PRPCBK').value, document.getElementById('E01PRPCCY').value,'E01PRPCGL','E01PRPCRS','93')">
          </div>
        </td>
        <td nowrap > 
          <div align="center"> 
            <input type="text" name="E01PRPCBK" id="E01PRPCBK" size="2" maxlength="2" value="<%= prBasic.getE01PRPCBK().trim()%>" >
          </div>
        </td>
        <td nowrap > 
          <div align="center"> 
            <input type="text" name="E01PRPCBR" id="E01PRPCBR" size="5" maxlength="4"  value="<%= prBasic.getE01PRPCBR().trim()%>"
            class="context-menu-help"
			onmousedown="init(branchHelp,this.name,document.getElementById('E01PRPCBK').value,'','','','')" onkeypress="enterInteger(event)">
          </div>
        </td>
        <td nowrap > 
          <div align="center"> 
            <input type="text" name="E01PRPCCY" id="E01PRPCCY" size="3" maxlength="3" value="<%= prBasic.getE01PRPCCY().trim()%>" 
            class="context-menu-help"
			onmousedown="init(currencyHelp,this.name,document.getElementById('E01PRPCBK').value,'','','','')">
          </div>
        </td>
        <td nowrap > 
          <div align="center"> 
            <input type="text" name="E01PRPCGL" id="E01PRPCGL" size="17" maxlength="16" value="<%= prBasic.getE01PRPCGL().trim()%>" onkeypress="enterInteger(event)"
            class="context-menu-help"
            onmousedown="init(ledgerHelp,this.name,document.getElementById('E01PRPCBK').value,document.getElementById('E01PRPCCY').value,'','','')">
          </div>
        </td>
        <td nowrap  > 
          <div align="center"> 
            <input type="text" name="E01PRPCAC" id="E01PRPCAC" size="13" maxlength="12" value="<%= prBasic.getE01PRPCAC().trim()%>"
          class="context-menu-help"
		  onmousedown="init(accountHelp,this.name,document.getElementById('E01PRPCBK').value,'','','','RT')"  onkeypress="enterInteger(event)">
          </div>
        </td>
        <td nowrap > 
          <div align="center"> 
            <input type="text" name="E01PRPCCC" id="E01PRPCCC" size="9" maxlength="8"  value="<%= prBasic.getE01PRPCCC().trim()%>"
            class="context-menu-help"
			onmousedown="init(costcenterHelp,this.name,document.getElementById('E01PRPCBK').value,'','','','')">
          </div>
        </td>
      </tr>
    </table>
    <BR>
   <h4>Participantes</h4>
    <table class="tableinfo">
    <tr > 
      <td nowrap height="132"> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
      	<tr id="trdark"> 
            <td nowrap colspan="2" align="center"> 
                <b>Ordenante </b>
             </td>
            <td nowrap> 
                <div align="center"><b>Cliente</b></div>
            </td>
            <td nowrap colspan="2" align="center">  
                <div align="center"><b>Beneficiario </b></div>
            </td>
		</tr>
      	<tr id="trclear"> 
            <td nowrap width="10%"> 
                <div align="right">Nombre :</div>
            </td>
            <td nowrap width="30%"> 
              <div align="left"> 
                <input type="text" id="E11PRPORC" name="E11PRPORC" size="45" maxlength="35" value="<%=prBasic.getE11PRPORC().trim()%>">
              </div>
            </td>
            <td nowrap width="5%" align="center">
              	<input type="hidden" id="customerName" name="customerName">
                <input type="text" id="E01PRPOCU" name="E01PRPOCU" size="10" maxlength="10" value="<%=prBasic.getE01PRPOCU().trim()%>">
                <a href="javascript:GetCustomerDescId('E01PRPOCU','customerName','')">
                <IMG src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="bottom" border="0"></a>
            </td>
            <td nowrap width="10%" align="right">Nombre :</td>
            <td nowrap width="30%"> 
              <div align="left"> 
              	<input type="text" id="E11PRPBCU" name="E11PRPBCU" size="45" maxlength="35" value="<%=prBasic.getE11PRPBCU().trim()%>">
              	<img src="<%=request.getContextPath()%>/images/Check.gif" title="campo obligatorio" align="bottom" border="0">
              </div>
            </td>
		</tr>
          <tr id="trclear">
      		<td nowrap valign="top" align="right">Direcci&oacute;n :</td> 
            <td nowrap colspan="2" align="left"> 
                <input type="text" id="E21PRPORC" name="E21PRPORC" size="45" maxlength="35" value="<%=prBasic.getE21PRPORC().trim()%>"><br>
                <input type="text" id="E31PRPORC" name="E31PRPORC" size="45" maxlength="35" value="<%=prBasic.getE31PRPORC().trim()%>"><br>
                <input type="text" id="E41PRPORC" name="E41PRPORC" size="45" maxlength="35" value="<%=prBasic.getE41PRPORC().trim()%>"><br>
            </td>
      		<td nowrap valign="top" align="right">Direcci&oacute;n :</td> 
            <td nowrap align="left"> 
                <input type="text" id="E21PRPBCU" name="E21PRPBCU" size="45" maxlength="35" value="<%=prBasic.getE21PRPBCU().trim()%>"><br>
                <input type="text" id="E31PRPBCU" name="E31PRPBCU" size="45" maxlength="35" value="<%=prBasic.getE31PRPBCU().trim()%>"><br>
                <input type="text" id="E41PRPBCU" name="E41PRPBCU" size="45" maxlength="35" value="<%=prBasic.getE41PRPBCU().trim()%>"><br>
            <td>
          </tr>
			<tr id="trclear">
			<td nowrap align="right">Cuenta :</td>
			<td nowrap colspan="2">
                <input type="text" id="E51PRPORC" name="E51PRPORC" size="45" maxlength="35" value="<%=prBasic.getE51PRPORC().trim()%>"><br>
			</td>
			<td nowrap align="right">Cuenta :</td>
			<td nowrap > 
                <input type="text" id="E51PRPBCU" name="E51PRPBCU" size="40" maxlength="35" value="<%=prBasic.getE51PRPBCU().trim()%>">
                <div id="accTyp" style="display:none">
                	<select name="E01PRPBCO" id="E01PRPBCO">
                		<option value="S" <% if(prBasic.getE01PRPBCO().equals("S")) out.print("selected");%>>Ahorros</option>
                        <option value="C" <% if(prBasic.getE01PRPBCO().equals("C")) out.print("selected");%>>Cheques</option>
                    </select>
                </div>
			</td>
            </tr>    
         </table>
      </td>
    </tr>
  </table>
  <br>
  <table class="tbenter" width="100%" border="0" cellspacing=0 cellpadding=0>
    <tr> 
       <td nowrap> 
           <table id="TableTab" cellspacing=0 cellpadding=2 border="0">
          		<tr> 

                      <td nowrap id="Tab0" class="tabnormal" onClick="showTab(0,'E11PRPINB')"> 
                        	<div  >Banco Intermediario</div>
                      </td> 

                  <td nowrap id="Tab1" class="tabnormal" onClick="showTab(1,'E11PRPBBK')"> 
                            <div  >Banco Pagador</div>
                  </td>
               
                  <td nowrap id="Tab2" class="tabnormal" onClick="showTab(2,'E11PRPDTP')"> 
                            <div  >Detalles de Pago </div>
                  </td> 
                 
                      <td nowrap id="Tab3" class="tabnormal" onClick="showTab(3,'E11PRPBKB')"> 
                        	<div  >Infor. Banco a Banco</div>
                      </td> 
                    
                 
                  <td class="tabempty" width="100%">&nbsp;                       
                  </td> 
                </tr>
        </table>
       </td>
    </tr>
  </table>
	<table class="tabdata" width="100%">
    <tr>
     <td nowrap>
                        <div id="dataTab0" align=center> 
                        	<table width="100%" border="0" cellspacing="0" cellpadding="0">
                    		<tr id="trdark" > 
                      			<td nowrap align=center> 
		                          	<div><a href="javascript:GetSwiftIdDesc('E11PRPINB','E21PRPINB','E31PRPINB','E41PRPINB')">
		                          	<img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="middle" border="0"></a></div>
                          <input type="text" name="E11PRPINB" size="50" maxlength="35" value="<%= prBasic.getE11PRPINB().trim()%>">
                          <br>
                          <input type="text" name="E21PRPINB" size="50" maxlength="35" value="<%= prBasic.getE21PRPINB().trim()%>">
                          <br>
                          <input type="text" name="E31PRPINB" size="50" maxlength="35" value="<%= prBasic.getE31PRPINB().trim()%>">
                          <br>
                          <input type="text" name="E41PRPINB" size="50" maxlength="35" value="<%= prBasic.getE41PRPINB().trim()%>">
                          <br>
                          <input type="text" name="E51PRPINB" size="50" maxlength="35" value="<%= prBasic.getE51PRPINB().trim()%>">
                        	</td>
    						</tr>
 						 	</table>
                        </div>

                        <div id="dataTab1" style="display: none" align=center> 
                        		<table width="100%" border="0" cellspacing="0" cellpadding="0">
                    		<tr id="trdark" > 
                      			<td nowrap align=center> 
		                          	<div><a href="javascript:GetSwiftIdDesc('E11PRPBBK','E21PRPBBK','E31PRPBBK','E41PRPBBK')">
		                          	<img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="middle" border="0"></a></div>
                          <input type="text" name="E11PRPBBK" size="50" maxlength="35" value="<%= prBasic.getE11PRPBBK().trim()%>">
                          <br>
                          <input type="text" name="E21PRPBBK" size="50" maxlength="35" value="<%= prBasic.getE21PRPBBK().trim()%>">
                          <br>
                          <input type="text" name="E31PRPBBK" size="50" maxlength="35" value="<%= prBasic.getE31PRPBBK().trim()%>">
                          <br>
                          <input type="text" name="E41PRPBBK" size="50" maxlength="35" value="<%= prBasic.getE41PRPBBK().trim()%>">
                          <br>
                          <input type="text" name="E51PRPBBK" size="50" maxlength="35" value="<%= prBasic.getE51PRPBBK().trim()%>">
                        	</td>
    						</tr>
 						 	</table>
                        </div>
                      
                        <div id="dataTab2" style="display: none" align=center>
							<table width="100%" border="0" cellspacing="0" cellpadding="0">
                    		<tr id="trdark" > 
                      			<td nowrap align=center> 
		                          	<div><a href="javascript:GetSwiftIdDesc('E11PRPDTP','E21PRPDTP','E31PRPDTP','E41PRPDTP')">
		                          	<img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="middle" border="0"></a></div>
                          <input type="text" name="E11PRPDTP" size="50" maxlength="35" value="<%= prBasic.getE11PRPDTP().trim()%>">
                          <br>
                          <input type="text" name="E21PRPDTP" size="50" maxlength="35" value="<%= prBasic.getE21PRPDTP().trim()%>">
                          <br>
                          <input type="text" name="E31PRPDTP" size="50" maxlength="35" value="<%= prBasic.getE31PRPDTP().trim()%>">
                          <br>
                          <input type="text" name="E41PRPDTP" size="50" maxlength="35" value="<%= prBasic.getE41PRPDTP().trim()%>">
                          <br>
                          <input type="text" name="E51PRPDTP" size="50" maxlength="35" value="<%= prBasic.getE51PRPDTP().trim()%>">
                        	</td>
    						</tr>
 						 	</table>
                        </div>
                        
                        <div id="dataTab3" style="display: none" align=center>
                       <table width="100%" border="0" cellspacing="0" cellpadding="0">
                    	<tr id="trdark" > 
                      	<td nowrap align=center>  
						<div><a href="javascript:GetSwiftIdDesc('E11PRPBKB','E21PRPBKB','E31PRPBKB','E41PRPBKB')">
		                  	<img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="middle" border="0"></a></div>
                          <input type="text" name="E11PRPBKB" size="50" maxlength="35" value="<%= prBasic.getE11PRPBKB().trim()%>">
                          <br>
                          <input type="text" name="E21PRPBKB" size="50" maxlength="35" value="<%= prBasic.getE21PRPBKB().trim()%>">
                          <br>
                          <input type="text" name="E31PRPBKB" size="50" maxlength="35" value="<%= prBasic.getE31PRPBKB().trim()%>">
                          <br>
                          <input type="text" name="E41PRPBKB" size="50" maxlength="35" value="<%= prBasic.getE41PRPBKB().trim()%>">
                          <br>
                          <input type="text" name="E51PRPBKB" size="50" maxlength="35" value="<%= prBasic.getE51PRPBKB().trim()%>">
                        	</td>
    						</tr>
 						 	</table>
                        </div>
                        
        </td>
            
    </tr>
  </table>
  
  <BR>
  <p align="center"> 
  	<input id="EIBSBTN" type=submit name="Submit" value="Enviar">
  </p>
  <SCRIPT type="text/javascript">
  	setHelp(<%=via%>);
  </SCRIPT>
</form>
</body>
</html>
