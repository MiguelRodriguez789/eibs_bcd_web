<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<title>Transacciones </title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V4.0 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<%@ page import = "datapro.eibs.master.*" %>

<jsp:useBean id="prMant" class="datapro.eibs.beans.EPR010001Message"  scope="session" />

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />

<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>

<SCRIPT type="text/javascript">
  
	function showTab(index, name) {  
	  	for (var i=0; i<3; i++) {
	   		document.getElementById("Tab" + i).className = "tabnormal";
	   		document.getElementById("dataTab" + i).style.display = "none";
	   	}
		document.getElementById("Tab" + index).className = "tabhighlight";
	   	document.getElementById("dataTab" + index).style.display = "block";
	  	getElement(name).focus();
	}
	  
	function showTabB(index, name){  
	  	for (var i=0; i<4; i++) {
	   		document.getElementById("TabB" + i).className = "tabnormal";
	   		document.getElementById("dataTabB" + i).style.display = "none";
	   	}
		document.getElementById("TabB" + index).className = "tabhighlight";
	   	document.getElementById("dataTabB" + index).style.display = "block";
	  	getElement(name).focus();
	}
 
    builtNewMenu(pr_inq_opt);

 </SCRIPT>
</head>

<body>

<%String lectura =" ";
  	String lectura2=" "; 
  	boolean mostrar=true;
%>

<% 
 if ( !error.getERRNUM().equals("0")  ) {
     error.setERRNUM("0");
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
     }
 out.println("<SCRIPT> initMenu();  </SCRIPT>");
%> 

<h3 align="center">Transacciones Financieras<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="pr_inq_maint.jsp,EPR0000"></h3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEPR0000" >
    <input type=HIDDEN id="REFNUM"  name="REFNUM"  value="<%= prMant.getE01PRINUM().trim()%>">
<% 
  if (userPO.getPurpose().equals("NEW")) { 
%> 
  <INPUT TYPE=HIDDEN ID="SCREEN" NAME="SCREEN" VALUE="2">
<% } else{ %>
  <INPUT TYPE=HIDDEN ID="SCREEN" NAME="SCREEN" VALUE="4">
<% } %>

  <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
          <tr id="trdark"> 
            <td nowrap width="16%" > 
              <div align="right">Tipo :</div>
            </td>
            <td nowrap width="20%" >
			  <div align="left"> 
                <input type="hidden" id="E01PRITTP" name="E01PRITTP" size="2" maxlength="2" value="<%= prMant.getE01PRITTP().trim()%>">
                  
                <input type="text" readonly  id="TypeDesc" name="TypeDesc" size="45" maxlength="35" value="<% if(prMant.getE01PRITTP().trim().equals("IW")){out.print("Transferencias Externas Recibidas");}
				   else if(prMant.getE01PRITTP().trim().equals("OW")){out.print("Transferencias Externas Enviadas"); }
				   else if(prMant.getE01PRITTP().trim().equals("IT")){out.print("Transferencias Internas"); }
				   else if(prMant.getE01PRITTP().trim().equals("IA")){out.print("Ajuste de Intereses"); }
                   else if(prMant.getE01PRITTP().trim().equals("IP")){out.print("Pago de Intereses"); }
                   else if(prMant.getE01PRITTP().trim().equals("RP")){out.print("Reversion de Penalidad"); }
                   else if(prMant.getE01PRITTP().trim().equals("LP")){out.print("Pago de Prestamos"); }
                   else if(prMant.getE01PRITTP().trim().equals("MR")){out.print("Reversion Miscelanea"); }
                   else if(prMant.getE01PRITTP().trim().equals("MP")){out.print("Ajuste Miscelaneo"); }
				   else {out.print(" ");}%>" >
              </div>
            </td>
              <td nowrap> 
                <div align="right">V&iacute;a de Pago :</div>
              </td>
            <td nowrap colspan="3"> 
              <input type="text" readonly  id="E01PRIPVI" name="E01PRIPVI" size="30" maxlength="17" 
					value="<% if (prMant.getE01PRIPVI().equals("R")) {out.print("Cuenta de Detalle");}
               					 else if (prMant.getE01PRIPVI().equals("D")) {out.print("Certificado");}
                				 else if (prMant.getE01PRIPVI().equals("G")) {out.print("Cuenta Contable");}
                				 else if (prMant.getE01PRIPVI().equals("6")) {out.print("Cheques Oficiales");}
                				 else if (prMant.getE01PRIPVI().equals("1")) {out.print("FED");}
                				 else if (prMant.getE01PRIPVI().equals("2")) {out.print("Swift MT-205");}
                				 else if (prMant.getE01PRIPVI().equals("3")) {out.print("Swift MT-103");}
								 else if (prMant.getE01PRIPVI().equals("4")) {out.print("Swift MT-200");}
								 else if (prMant.getE01PRIPVI().equals("7")) {out.print("Swift MT-202 COV");}								 
								 else {out.print(" ");}%>" >
            </td>
          </tr>
          <tr id="trdark"> 
                <td nowrap align="right"> N&uacute;mero de Referencia : </td>
                <td nowrap align="left">
                  <input type="text" id="E01PRINUM" name="E01PRINUM" size="12" maxlength="11" value="<%= prMant.getE01PRINUM().trim()%>" readonly>
                </td>
             <td nowrap align="right">Canal: 
             </td>
              <td nowrap align="left">
                  <input	type="text" id="TMPPRACNL" name="TMPPRACNL" size="27" maxlength="26" readonly>
                </td>     
            <TD nowrap> 
                  <DIV align="right">Código de Transacci&oacute;n :</DIV>
            </TD>
            <TD nowrap align="left">
                  <input type="text" id="E01PRITCD" name="E01PRITCD" size="11" maxlength="10" value="<%= prMant.getE01PRITCD().trim()%>" readonly>
            </TD>
          </tr>
          
        </table>
      </td>
    </tr>
   </table>
   <BR>
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
                <input readonly type="text" id="E11PRIORC" name="E11PRIORC" size="45" maxlength="35" value="<%=prMant.getE11PRIORC().trim()%>">
              </div>
            </td>
            <td nowrap width="5%"> 
              <div align="center">
              	<input type="hidden" id="customerName" name="customerName" onchange="setCustomer()">
                <input readonly type="text" id="E01PRIOCU" name="E01PRIOCU" size="10" maxlength="10" value="<%=prMant.getE01PRIOCU().trim()%>">
              </div>
            </td>
            <td nowrap width="10%"> 
                <div align="right">Nombre :</div>
            </td>
            <td nowrap width="30%"> 
              <div align="left"> 
              	<input readonly type="text" id="E11PRIBCU" name="E11PRIBCU" size="45" maxlength="35" value="<%=prMant.getE11PRIBCU().trim()%>">
              </div>
            </td>
		</tr>
          <tr id="trclear">
      		<td nowrap valign="top" align="right"> 
                  Direcci&oacute;n :
			</td> 
            <td nowrap colspan="2"> 
              <div align="left"> 
                <input readonly type="text" id="E21PRIORC" name="E21PRIORC" size="45" maxlength="35" value="<%=prMant.getE21PRIORC().trim()%>"><br>
                <input readonly type="text" id="E31PRIORC" name="E31PRIORC" size="45" maxlength="35" value="<%=prMant.getE31PRIORC().trim()%>"><br>
                <input readonly type="text" id="E41PRIORC" name="E41PRIORC" size="45" maxlength="35" value="<%=prMant.getE41PRIORC().trim()%>"><br>
                <input readonly type="text" id="E51PRIORC" name="E51PRIORC" size="45" maxlength="35" value="<%=prMant.getE51PRIORC().trim()%>">
              </div>
            </td>
      		<td nowrap valign="top" align="right"> 
                  Direcci&oacute;n :
			</td> 
            <td nowrap > 
              <div align="left"> 
                <input readonly type="text" id="E21PRIBCU" name="E21PRIBCU" size="45" maxlength="35" value="<%=prMant.getE21PRIBCU().trim()%>"><br>
                <input readonly type="text" id="E31PRIBCU" name="E31PRIBCU" size="45" maxlength="35" value="<%=prMant.getE31PRIBCU().trim()%>"><br>
                <input readonly type="text" id="E41PRIBCU" name="E41PRIBCU" size="45" maxlength="35" value="<%=prMant.getE41PRIBCU().trim()%>"><br>
                <input readonly type="text" id="E51PRIBCU" name="E51PRIBCU" size="45" maxlength="35" value="<%=prMant.getE51PRIBCU().trim()%>"><br>
              </div>
            </td>
          </tr>
          <tr id="trclear">
			<td nowrap> 
                <div align="right">Identificaci&oacute;n :</div>
			</td>
			<td nowrap > 
                <div align="left"> 
                  <input readonly type="text" id="E01PRIBID" name="E01PRIBID" size="15" maxlength="15" value="<%=prMant.getE01PRIBID()%>">
                 </div>
			</td>
			</tr>
			<tr id="trclear">
			<td nowrap> 
                <div align="right">Cuenta :</div>
			</td>
			<td nowrap colspan="2">
				<input readonly type="text" id="XXXPRIDAC" name="XXXPRIDAC" size="40" maxlength="35" value="<%= prMant.getE01PRITTP().equals("OW") ? prMant.getE01PRIDAC() : "" %>" 
					onchange="if(document.getElementById('E01PRITTP').value != 'IW') document.getElementById('E01PRIDAC').value=this.value;">
                <span id="accountOrdenante" align="left"> 
                </span>
			</td>
			<td nowrap  > 
                <div align="right">Cuenta :</div>
			</td>
			<td nowrap > 
                <input readonly type="text" id="E01PRIBAC" name="E01PRIBAC" size="40" maxlength="35" value="<%=prMant.getE01PRIBAC()%>"
                onchange="if(document.getElementById('E01PRITTP').value != 'OW') document.getElementById('E01PRICAC').value=this.value;">
                <span id="accountBene" align="left" style="display: <%=prMant.getE01PRITTP().equals("OW") ? "none" : "inline"%>">
                </span>
			</td>
            </tr>    
         </table>
      </td>
    </tr>
  </table>
<BR>
<table class="tableinfo">
    
    <tr > 
      <td nowrap> 
        <table cellspacing=0 cellpadding=2 width="100%" border="0">
          <tr id="trdark"> 
            <td nowrap > 
              <div align="right">Moneda /Monto a Transferir :</div>
            </td>
            <td nowrap > 
              <input type="text" readonly  id="E01PRITCY" name="E01PRITCY" size="3" maxlength="3" value="<%= prMant.getE01PRITCY().trim()%>" >
              <input type="text" readonly  id="E01PRIAMT" name="E01PRIAMT" size="15" maxlength="13" value="<%= prMant.getE01PRIAMT().trim()%>" >
            </td>
            <td nowrap >Tasa de Cambio :</td>
            <td nowrap >
              <input type="text" readonly  id="E01PRICXR" name="E01PRICXR" size="13" maxlength="13" value="<%= prMant.getE01PRICXR().trim()%>" onKeyPress="enterDecimal()" >
            </td>
          </tr>
        </table>
      </td>
    </tr>
  
</table>
  <h4>Cuenta de D&eacute;bito</h4>
  <TABLE class="tableinfo" >
    <tr id="trdark"> 
      <td nowrap align="center" >Banco</td>
      <td nowrap align="center" >Agencia</td>
      <td nowrap align="center" >Moneda</td>
      <td nowrap align="center" >Cuenta Contable</td>
      <td nowrap align="center" >Cuenta</td>
      <td nowrap align="center" >Centro de Costo</td>
      <td nowrap align="center" >Monto</td>

    </tr>
    <tr id="trclear"> 
      <td nowrap > 
        <div align="center"> 
          <input type="text" readonly  id="E01PRIDBK" name="E01PRIDBK" size="2" maxlength="2" value="<%= prMant.getE01PRIDBK().trim()%>" >
        </div>
      </td>
      <td nowrap > 
        <div align="center"> 
          <input type="text" readonly  id="E01PRIDBR" name="E01PRIDBR" size="4" maxlength="4"  value="<%= prMant.getE01PRIDBR().trim()%>" >
        </div>
      </td>
      <td nowrap > 
        <div align="center"> 
          <input type="text" readonly  id="E01PRIDCY" name="E01PRIDCY" size="3" maxlength="3" value="<%= prMant.getE01PRIDCY().trim()%>" >
        </div>
      </td>
      <td nowrap > 
        <div align="center"> 
          <input type="text" readonly  id="E01PRIDGL" name="E01PRIDGL" size="17" maxlength="16" value="<%= prMant.getE01PRIDGL().trim()%>" >
        </div>
      </td>
      <td nowrap  > 
        <div align="center"> 
          <input type="text" readonly  id="E01PRIDAC" name="E01PRIDAC" size="13" maxlength="12" value="<%= prMant.getE01PRIDAC().trim()%>" >
        </div>
      </td>
      <td nowrap > 
        <div align="center"> 
          <input type="text" readonly  id="E01PRIDCC" name="E01PRIDCC" size="9" maxlength="9"  value="<%= prMant.getE01PRIDCC().trim()%>" >
        </div>
      </td>
      <td nowrap > 
        <div align="center"> 
          <input type="text" readonly  id="E01PRIDAM" name="E01PRIDAM" size="15" maxlength="13" value="<%= prMant.getE01PRIDAM().trim()%>">
        </div>
      </td>
    </tr>
  </table>
  <h4>Cuenta de Cr&eacute;dito</h4>
  <table class="tableinfo" >
    <tr id="trdark"> 
      <td nowrap align="center" >Banco </td>
      <td nowrap align="center" >Agencia</td>
      <td nowrap align="center" >Moneda</td>
      <td nowrap align="center" >Cuenta Contable</td>
      <td nowrap align="center" >Cuenta</td>
      <td nowrap align="center" >Centro de Costo</td>
      <td nowrap align="center" >Monto</td>
    </tr>
    <tr id="trclear"> 
      <td nowrap > 
        <div align="center"> 
          <input type="text" readonly  id="E01PRICBK" name="E01PRICBK" size="2" maxlength="2" value="<%= prMant.getE01PRICBK().trim()%>" >
        </div>
      </td>
      <td nowrap > 
        <div align="center"> 
          <input type="text" readonly  id="E01PRICBR" name="E01PRICBR" size="4" maxlength="4"  value="<%= prMant.getE01PRICBR().trim()%>" >
        </div>
      </td>
      <td nowrap > 
        <div align="center"> 
          <input type="text" readonly  id="E01PRICCY" name="E01PRICCY" size="3" maxlength="3" value="<%= prMant.getE01PRICCY().trim()%>" >
        </div>
      </td>
      <td nowrap > 
        <div align="center"> 
          <input type="text" readonly  id="E01PRICGL" name="E01PRICGL" size="17" maxlength="16" value="<%= prMant.getE01PRICGL().trim()%>" >
        </div>
      </td>
      <td nowrap  > 
        <div align="center"> 
          <input type="text" readonly  id="E01PRICAC" name="E01PRICAC" size="13" maxlength="12" value="<%= prMant.getE01PRICAC().trim()%>" >
        </div>
      </td>
      <td nowrap > 
        <div align="center"> 
          <input type="text" readonly  id="E01PRICCC" name="E01PRICCC" size="9" maxlength="9"  value="<%= prMant.getE01PRICCC().trim()%>" >
        </div>
      </td>
      <td nowrap >
        <div align="center">
          <input type="text" readonly  name="E01PRICAM" size="15" maxlength="13" value="<%= prMant.getE01PRICAM().trim()%>">
        </div>
      </td>
    </tr>
  </table>
  <h4>Nuestras Comisiones</h4>
  <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing=0 cellpadding=2 width="100%" border="0">
          <tr id="trdark"> 
            <td nowrap width="24%" > 
              <div align="right">Tabla / Monto :</div>
            </td>
            <td nowrap width="30%" > 
              <input type="text" readonly  id="E01PRICOT" name="E01PRICOT" size="2" maxlength="2" value="<%= prMant.getE01PRICOT().trim()%>" >
              <input type="text" readonly  id="E01PRICOM" name="E01PRICOM" size="15" maxlength="13" value="<%= prMant.getE01PRICOM().trim()%>" >
            </td>
            <td nowrap width="17%" > 
              <div align="right">Cargos por :</div>
            </td>
            <td nowrap width="29%" > 
			  <input type="text" readonly  id="E01PRICHG" name="E01PRICHG" value="<% if (prMant.getE01PRICHG().equals("A")) {out.print("Aplicante");} 
                else if (prMant.getE01PRICHG().equals("B")) { out.print("Beneficiario");} 
                else if (prMant.getE01PRICHG().equals("N")) {out.print("Ninguno");} 
                else if (prMant.getE01PRICHG().equals("O")) {out.print("Nuestro");}
				else out.print(" ");%>" >
            </td>
          </tr>
            <tr id="trclear">
              <td nowrap width="24%" >&nbsp;</td>
              <td nowrap width="30%" >&nbsp;</td>
              <td nowrap width="17%" >
                <div align="right">Moneda / Monto :</div>
              </td>
              <td nowrap width="29%" >
                <input type="text" id="E01PRIRCC" name="E01PRIRCC" size="4" maxlength="3" value="<%= prMant.getE01PRIRCC().trim()%>" readonly>
                <input type="text" id="E01PRIRRA" name="E01PRIRRA" size="15" maxlength="13" value="<%= prMant.getE01PRIRRA().trim()%>" readonly>
              </td>
            </tr>
        </table>
      </td>
    </tr>
  </table>
  
  <H4>Comisiones Banco Receptor</H4>
    <table class="tableinfo">
      <tr > 
        <td nowrap> 
          <table cellspacing=0 cellpadding=2 width="100%" border="0">
            <tr id="trdark"> 
              <td nowrap width="24%" > 
                <div align="right">Moneda / Monto :</div>
              </td>
              <td nowrap width="30%" > 
                <input type="text" readonly id="E01PRIRCC" name="E01PRIRCC" size="2" maxlength="2" value="<%= prMant.getE01PRIRCC().trim()%>" >
                <input type="text" readonly id="E01PRIRRA" name="E01PRIRRA" size="15" maxlength="13" value="<%= prMant.getE01PRIRRA().trim()%>" >
              </td>
              <td nowrap width="17%" > 
                <div align="right">Cargos por :</div>
              </td>
              <td nowrap width="29%" > 
			  <input type="text" readonly  id="E01PRIFL4" name="E01PRIFL4" value="<% if (prMant.getE01PRIFL4().equals("A")) {out.print("Aplicante");} 
                else if (prMant.getE01PRIFL4().equals("B")) { out.print("Beneficiario");} 
				else out.print(" ");%>" >

              </td>
            </tr>
          </table>
        </td>
      </tr>
    </table>

  
  <h4>Informaci&oacute;n Adicional</h4>
<br>
<table class="tableinfo">
 <tr > 
      <td > 
          <table cellspacing=0 cellpadding=2 width="100%" border="0">
            <tr id="trdark"> 
              <td nowrap > 
                <div align="right">Receptor :</div>
              </td>
              <td nowrap> 
                <input type="text" id="E01PRIRID" name="E01PRIRID" size="15" maxlength="15" value="<%= prMant.getE01PRIRID().trim()%>" readonly>
             </td>
              <td nowrap > 
              		<div align="right">Banco Remitente :</div> 
              	</td>
              	<td nowrap>
              	 	<input type="text" id="E01PRISID" name="E01PRISID" size="13" maxlength="12" value="<%=prMant.getE01PRISID().trim()%>" readonly> 
              	</td>
            </tr>
            <tr id="trclear">
              <td nowrap > 
                <div align="right">Instrucciones Recibidas Via :</div>
              </td>
              <td nowrap >
                <input type="text" id="E01PRIIRV" name="E01PRIIRV" size="3" maxlength="1" value="<%= prMant.getE01PRIIRV().trim()%>" readonly>
                </td>
              <td nowrap  > 
                <div align="right">Formato de Cheque :</div>
              </td>
              <td nowrap > 
                <input type="text" id="E01PRIFL3" name="E01PRIFL3" size="2" maxlength="1" value="<%= prMant.getE01PRIFL3().trim()%>" readonly>
            </tr>
            <tr id="trdark"> 
              <td nowrap  > 
                <div align="right">Motivo de Operaci&oacute;n :</div>
              </td>
              <td nowrap > 
                <div align="left"> 
                  <input type="text" id="E01PRIDPT" name="E01PRIDPT" size="5" maxlength="4" value="<%= prMant.getE01PRIDPT().trim()%>" readonly>
                  <a href="javascript:GetCodeCNOFC('E01PRIDPT','YL')"></a></div>
              </td>
              <TD nowrap width="17%"> 
                <DIV align="right">Detalle de Cargos  :</DIV>
              </TD><TD nowrap width="29%"> 
              	<input type="text" readonly  id="E01PRITTC"  name="E01PRITTC" value="<%= prMant.getE01PRITTC().trim() %>" > 
              </TD>

            </tr>
            <tr id="trclear"> 
              <td nowrap  > 
                <div align="right">Nuestra Referencia :</div>
              </td>
              <td nowrap > 
                <div align="left"> 
                  <input type="text" id="E01PRISRF" name="E01PRISRF" size="17" maxlength="16" value="<%= prMant.getE01PRISRF().trim()%>" readonly>
                </div>
              </td>
              <td nowrap > 
                <div align="right">Referencia Relacionada :</div>
              </td>
              <td nowrap > 
                <div align="left"> 
                  <input type="text" id="E01PRITHF" name="E01PRITHF" size="17" maxlength="16" value="<%= prMant.getE01PRITHF().trim()%>" readonly>
                </div>
              </td>
            </tr>
            
            <tr id="trdark"> 
              <td nowrap  > 
                <div align="right">Cod. Operación Bancaria :</div>
              </td>
              <td nowrap > 
                <div align="left"> 
                  <input type="text" id="E01PRIBKO" name="E01PRIBKO" size="6" maxlength="4" value="<%= prMant.getE01PRIBKO()%>" readonly >
               </div>
              </td>
              <td nowrap > 
                <div align="right">Código de Orden :</div>
              </td>
              <td nowrap > 
                <div align="left"> 
                  <input type="text" id="E01PRIITC" name="E01PRIITC" size="6" maxlength="4" value="<%= prMant.getE01PRIITC()%>" readonly >
                  <input type="text" id="E01PRIITA" name="E01PRIITA" size="11" maxlength="10" value="<%= prMant.getE01PRIITA()%>" readonly >
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
                      	<td nowrap id="Tab0" class="tabhighlight" onClick="showTab(0,'E11PRIINB')"> 
                        	<div >Banco Intermediario(56A,C,D)</div>
                      	</td> 
                  		<td nowrap id="Tab1" class="tabnormal" onClick="showTab(1,'E11PRIBBK')"> 
                            <div >Banco Pagador(57A,B,C,D)</div>
                  		</td>
                      	<td nowrap id="Tab2" class="tabnormal" onClick="showTab(2,'E11PRIBKB')"> 
                        	<div >Infor. Banco a Banco(72)</div>
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
                          		<input readonly type="text" id="E11PRIINB" name="E11PRIINB" size="45" maxlength="35" value="<%= prMant.getE11PRIINB().trim()%>"><br>
                          		<input readonly type="text" id="E21PRIINB" name="E21PRIINB" size="45" maxlength="35" value="<%= prMant.getE21PRIINB().trim()%>"><br>
                          		<input readonly type="text" id="E31PRIINB" name="E31PRIINB" size="45" maxlength="35" value="<%= prMant.getE31PRIINB().trim()%>"><br>
                          		<input readonly type="text" id="E41PRIINB" name="E41PRIINB" size="45" maxlength="35" value="<%= prMant.getE41PRIINB().trim()%>"><br>
                          		<input readonly type="text" id="E51PRIINB" name="E51PRIINB" size="45" maxlength="35" value="<%= prMant.getE51PRIINB().trim()%>">
                        	</td>
    					</tr>
 					</table>
             	</div>

                <div id="dataTab1" style="display: none" align=center> 
                	<table width="100%" border="0" cellspacing="0" cellpadding="0">
                    	<tr id="trdark" > 
                      		<td nowrap align=center> 
                          		<input readonly type="text" id="E11PRIBBK" name="E11PRIBBK" size="45" maxlength="35" value="<%= prMant.getE11PRIBBK().trim()%>"><br>
                          		<input readonly type="text" id="E21PRIBBK" name="E21PRIBBK" size="45" maxlength="35" value="<%= prMant.getE21PRIBBK().trim()%>"><br>
                          		<input readonly type="text" id="E31PRIBBK" name="E31PRIBBK" size="45" maxlength="35" value="<%= prMant.getE31PRIBBK().trim()%>"><br>
                          		<input readonly type="text" id="E41PRIBBK" name="E41PRIBBK" size="45" maxlength="35" value="<%= prMant.getE41PRIBBK().trim()%>"><br>
                          		<input readonly type="text" id="E51PRIBBK" name="E51PRIBBK" size="45" maxlength="35" value="<%= prMant.getE51PRIBBK().trim()%>">
                        	</td>
    					</tr>
 					</table>
             	</div>
                        
                  <div id="dataTab2" style="display: none" align=center>
                	<table width="100%" border="0" cellspacing="0" cellpadding="0">
                    	<tr id="trdark" > 
                      		<td nowrap align=center>  
                          		<input readonly type="text" id="E11PRIBKB" name="E11PRIBKB" size="45" maxlength="35" value="<%= prMant.getE11PRIBKB().trim()%>"><br>
                          		<input readonly type="text" id="E21PRIBKB" name="E21PRIBKB" size="45" maxlength="35" value="<%= prMant.getE21PRIBKB().trim()%>"><br>
                          		<input readonly type="text" id="E31PRIBKB" name="E31PRIBKB" size="45" maxlength="35" value="<%= prMant.getE31PRIBKB().trim()%>"><br>
                          		<input readonly type="text" id="E41PRIBKB" name="E41PRIBKB" size="45" maxlength="35" value="<%= prMant.getE41PRIBKB().trim()%>"><br>
                          		<input readonly type="text" id="E51PRIBKB" name="E51PRIBKB" size="45" maxlength="35" value="<%= prMant.getE51PRIBKB().trim()%>"><br>
                          		<input readonly type="text" id="E61PRIBKB" name="E61PRIBKB" size="45" maxlength="35" value="<%= prMant.getE61PRIBKB().trim()%>">
                        	</td>
    					</tr>
 					</table>
				  </div>
			</td>        
		</tr>
	</table>
	<BR>
	
  	<table class="tbenter" width="100%"  border="0" cellspacing=0 cellpadding=0> 
    	<tr> 
       		<td nowrap> 
           		<table id="TableTab" cellspacing=0 cellpadding=2 border="0">
          			<tr> 
	                  <td nowrap id="TabB0" class="tabhighlight" onClick="showTabB(0,'E11PRIDTO')"> 
	                            <div >Detalles para Ordenante</div>
	                  </td> 	                
	                  <td nowrap id="TabB1" class="tabnormal" onClick="showTabB(1,'E11PRIDTP')"> 
	                            <div >Detalles de Pago(70)</div>
	                  </td> 
                      <td nowrap id="TabB2" class="tabnormal" onClick="showTabB(2,'E11PRISCB')"> 
                        	<div >Bco. Corresponsal Emisor(53A,B,C,D)</div>
                      </td>                     
                      <td nowrap id="TabB3" class="tabnormal" onClick="showTabB(3,'E11PRIRCB')"> 
                        	<div >Bco. Corresponsal Receptor(54A,B,C,D)</div>
                      </td>
                	</tr>
        		</table>
       		</td>
    	</tr>
  	</table>

 
	<table class="tabdata" width="100%">
    	<tr>
    		<td nowrap>
                    <div id="dataTabB0" align=center> 
                      <table width="100%" border="0" cellspacing="0" cellpadding="0">
                    	<tr id="trdark" > 
                      	 <td nowrap align=center> 
		                   <input type="text" id="E11PRIDTO" name="E11PRIDTO" size="45" maxlength="35" value="<%= prMant.getE11PRIDTO().trim()%>" readonly><br>
		                   <input type="text" id="E21PRIDTO" name="E21PRIDTO" size="45" maxlength="35" value="<%= prMant.getE21PRIDTO().trim()%>" readonly><br>
		                   <input type="text" id="E31PRIDTO" name="E31PRIDTO" size="45" maxlength="35" value="<%= prMant.getE31PRIDTO().trim()%>" readonly><br>
		                   <input type="text" id="E41PRIDTO" name="E41PRIDTO" size="45" maxlength="35" value="<%= prMant.getE41PRIDTO().trim()%>" readonly><br>
		                   <input type="text" id="E51PRIDTO" name="E51PRIDTO" size="45" maxlength="35" value="<%= prMant.getE51PRIDTO().trim()%>" readonly>
                        </td>
    					</tr>
 					  </table>
                    </div>
                  <div id="dataTabB1" style="display: none" align=center>
					<table width="100%" border="0" cellspacing="0" cellpadding="0">
                     <tr id="trdark" > 
                     	<td nowrap align=center> 
                          <input type="text" id="E11PRIDTP" name="E11PRIDTP" size="45" maxlength="35" value="<%= prMant.getE11PRIDTP().trim()%>" readonly><br>
                          <input type="text" id="E21PRIDTP" name="E21PRIDTP" size="45" maxlength="35" value="<%= prMant.getE21PRIDTP().trim()%>" readonly><br>
                          <input type="text" id="E31PRIDTP" name="E31PRIDTP" size="45" maxlength="35" value="<%= prMant.getE31PRIDTP().trim()%>" readonly><br>
                          <input type="text" id="E41PRIDTP" name="E41PRIDTP" size="45" maxlength="35" value="<%= prMant.getE41PRIDTP().trim()%>" readonly><br>
                          <input type="text" id="E51PRIDTP" name="E51PRIDTP" size="45" maxlength="35" value="<%= prMant.getE51PRIDTP().trim()%>" readonly>
                       	</td>
    			  	 </tr>
 				 	</table>
                  </div>

                 <div id="dataTabB2" style="display: none"  align=center> 
                   	<table width="100%" border="0" cellspacing="0" cellpadding="0">
                   		<tr id="trdark" > 
                   			<td nowrap align=center>  
	                          <input type="text" id="E11PRISCB" name="E11PRISCB" size="45" maxlength="35" value="<%= prMant.getE11PRISCB().trim()%>" readonly><br>
	                          <input type="text" id="E21PRISCB" name="E21PRISCB" size="45" maxlength="35" value="<%= prMant.getE21PRISCB().trim()%>" readonly><br>
	                          <input type="text" id="E31PRISCB" name="E31PRISCB" size="45" maxlength="35" value="<%= prMant.getE31PRISCB().trim()%>" readonly><br>
	                          <input type="text" id="E41PRISCB" name="E41PRISCB" size="45" maxlength="35" value="<%= prMant.getE41PRISCB().trim()%>" readonly><br>
	                          <input type="text" id="E51PRISCB" name="E51PRISCB" size="45" maxlength="35" value="<%= prMant.getE51PRISCB().trim()%>" readonly>
	                   		</td>
    					</tr>
 				 	</table>
                 </div>

                 <div id="dataTabB3"    align=center>  
                    <table width="100%"  border="0" cellspacing="0" cellpadding="0">
                    	<tr id="trdark" > 
                      	 <td nowrap align=center> 
                          <input readonly type="text" id="E11PRIRCB" name="E11PRIRCB" size="45" maxlength="35" value="<%= prMant.getE11PRIRCB().trim()%>"><br>
                          <input readonly type="text" id="E21PRIRCB" name="E21PRIRCB" size="45" maxlength="35" value="<%= prMant.getE21PRIRCB().trim()%>"><br>
                          <input readonly type="text" id="E31PRIRCB" name="E31PRIRCB" size="45" maxlength="35" value="<%= prMant.getE31PRIRCB().trim()%>"><br>
                          <input readonly type="text" id="E41PRIRCB" name="E41PRIRCB" size="45" maxlength="35" value="<%= prMant.getE41PRIRCB().trim()%>"><br>
                          <input readonly type="text" id="E51PRIRCB" name="E51PRIRCB" size="45" maxlength="35" value="<%= prMant.getE51PRIRCB().trim()%>">
                       	 </td>
    					</tr>
 					</table>
				</div>  
                 
			</td>        
		</tr>
	</table>

 

 <BR>
    <h4>Claves Confirmación DCV</h4>
<br>
     <table class="tableinfo">
      <tr> 
        <td nowrap> 
          <table cellspacing="0" cellpadding="2" width="100%" border="0">
            <tr id="trdark"> 
              <td nowrap width="20%"> 
                <input type="text" id="E01PRUCR1" name="E01PRUCR1" size="16" maxlength="15" value="<%= prMant.getE01PRUCR1().trim()%>" readonly>
              </td>
              <td nowrap width="20%" > 
                <input type="text" id="E01PRUCR2" name="E01PRUCR2" size="16" maxlength="15" value="<%= prMant.getE01PRUCR2().trim()%>" readonly>
                </td>
              <td nowrap width="20%" > 
                <input type="text" id="E01PRUCR3" name="E01PRUCR3" size="16" maxlength="15" value="<%= prMant.getE01PRUCR3().trim()%>" readonly>
              </td>
              <td nowrap width="20%" > 
                <input type="text" id="E01PRUCR4" name="E01PRUCR4" size="16" maxlength="15" value="<%= prMant.getE01PRUCR4().trim()%>" readonly>
              </td>
              <td nowrap width="20%" > 
                <input type="text" id="E01PRUCR5" name="E01PRUCR5" size="16" maxlength="15" value="<%= prMant.getE01PRUCR5().trim()%>" readonly>
              </td>
            </tr>
            <tr id="trclear"> 
              <td nowrap width="20%" > 
                <input type="text" id="E01PRUCR6" name="E01PRUCR6" size="16" maxlength="15" value="<%= prMant.getE01PRUCR6().trim()%>" readonly>
              </td>
              <td nowrap width="20%" > 
                <input type="text" id="E01PRUCR7" name="E01PRUCR7" size="16" maxlength="15" value="<%= prMant.getE01PRUCR7().trim()%>" readonly>
                </td>
              <td nowrap width="20%" > 
                <input type="text" id="E01PRUCR8" name="E01PRUCR8" size="16" maxlength="15" value="<%= prMant.getE01PRUCR8().trim()%>" readonly>
              </td>
              <td nowrap width="20%" > 
                <input type="text" id="E01PRUCR9" name="E01PRUCR9" size="16" maxlength="15" value="<%= prMant.getE01PRUCR9().trim()%>" readonly>
              </td>
              <td nowrap width="20%" > 
                <input type="text" id="E01PRUC10" name="E01PRUC10" size="16" maxlength="15" value="<%= prMant.getE01PRUC10().trim()%>" readonly>
              </td>
            </tr>
          </table>
        </td>

      </tr>
    </table>
<BR>
 
   
<h4>Campos Adicionales</h4>
<BR>

<TABLE class="tableinfo" id="dataTable">
    
    <TR id=trdark>
		<td NOWRAP align="center" width="5%"><b>Seq</b></td>
		<td NOWRAP align="center" width="5%"><b>TAG</b></td>
		<td NOWRAP align="center" width="20%"><b>Descripcion</b></td>
		<td NOWRAP align="center" width="5%"><b>Opcion</b></td>
		<td NOWRAP align="left" width="65%"><b>Campo</b></td>
	</TR> 
	<% 
	  if (!prMant.getE01PRATG0().trim().equals("")) { 
	%>
    <TR id=trclear>
		<td NOWRAP align="center" width="5%" valign="top">
			<INPUT type="text" id="E01PRASQ0" name="E01PRASQ0" size="2" maxlength="1" value="<%= prMant.getE01PRASQ0().trim()%>" readonly >
		</td>
		<td NOWRAP align="center" width="5%" valign="top">
			<INPUT type="text" id="E01PRATG0" name="E01PRATG0" size="5" maxlength="4" value="<%= prMant.getE01PRATG0().trim()%>" readonly >
		</td>
		<td NOWRAP align="center" width="20%" valign="top">
			<INPUT type="text" id="E01TAGDS0" name="E01TAGDS0" size="31" maxlength="30" value="<%= prMant.getE01TAGDS0().trim()%>" readonly >
		</td>
		<td NOWRAP align="center" width="5%" valign="top">
			<INPUT type="text" id="E01PRAOP0" name="E01PRAOP0" size="2" maxlength="1" value="<%= prMant.getE01PRAOP0().trim()%>" >
		</td>
		<td NOWRAP align="left" width="65%" valign="top">
	        <%
	        int row = 1;
	        int col = 42;
	        int ln = Integer.parseInt(prMant.getE01TAGLE0().trim());
	        if (ln <= 35) {
	          col = ln + 7;
	        } else {
	          row = ln / 35;
	        }  	
	        %>
			<TEXTAREA id="E01PRAFL0" name="E01PRAFL0" cols="<%=col%>" rows="<%=row%>" style="overflow:hidden"
			 onkeypress="textCounter(this,<%=prMant.getE01TAGLE0().trim()%>)"
			 ><%= prMant.getE01PRAFL0().trim()%></TEXTAREA>  
		</td>
	</TR>
	<% } %>
	<% 
	  if (!prMant.getE01PRATG1().trim().equals("")) { 
	%>
    <TR id=trclear>
		<td NOWRAP align="center" width="5%" valign="top">
			<INPUT type="text" id="E01PRASQ1" name="E01PRASQ1" size="2" maxlength="1" value="<%= prMant.getE01PRASQ1().trim()%>" readonly >
		</td>
		<td NOWRAP align="center" width="5%" valign="top">
			<INPUT type="text" id="E01PRATG1" name="E01PRATG1" size="5" maxlength="4" value="<%= prMant.getE01PRATG1().trim()%>" readonly >
		</td>
		<td NOWRAP align="center" width="20%" valign="top">
			<INPUT type="text" id="E01TAGDS1" name="E01TAGDS1" size="31" maxlength="30" value="<%= prMant.getE01TAGDS1().trim()%>" readonly >
		</td>
		<td NOWRAP align="center" width="5%" valign="top">
			<INPUT type="text" id="E01PRAOP1" name="E01PRAOP1" size="2" maxlength="1" value="<%= prMant.getE01PRAOP1().trim()%>" >
		</td>
		<td NOWRAP align="left" width="65%" valign="top">
			<%
	        int row = 1;
	        int col = 42;
	        int ln = Integer.parseInt(prMant.getE01TAGLE1().trim());
	        if (ln <= 35) {
	          col = ln + 7;
	        } else {
	          row = ln / 35;
	        }  	
	        %>
			<TEXTAREA id="E01PRAFL1" name="E01PRAFL1" cols="<%=col%>" rows="<%=row%>" style="overflow:hidden"
			 onkeypress="textCounter(this,<%=prMant.getE01TAGLE1().trim()%>)"
			 ><%= prMant.getE01PRAFL1().trim()%></TEXTAREA>  
		</td>
	</TR>
	<% } %>  
	<% 
	  if (!prMant.getE01PRATG2().trim().equals("")) { 
	%>
    <TR id=trclear>
		<td NOWRAP align="center" width="5%" valign="top">
			<INPUT type="text" id="E01PRASQ2" name="E01PRASQ2" size="2" maxlength="1" value="<%= prMant.getE01PRASQ2().trim()%>" readonly >
		</td>
		<td NOWRAP align="center" width="5%" valign="top">
			<INPUT type="text" id="E01PRATG2" name="E01PRATG2" size="5" maxlength="4" value="<%= prMant.getE01PRATG2().trim()%>" readonly >
		</td>
		<td NOWRAP align="center" width="20%" valign="top">
			<INPUT type="text" id="E01TAGDS2" name="E01TAGDS2" size="31" maxlength="30" value="<%= prMant.getE01TAGDS2().trim()%>" readonly >
		</td>
		<td NOWRAP align="center" width="5%" valign="top">
			<INPUT type="text" id="E01PRAOP2" name="E01PRAOP2" size="2" maxlength="1" value="<%= prMant.getE01PRAOP2().trim()%>" >
		</td>
		<td NOWRAP align="left" width="65%" valign="top">
			<%
	        int row = 1;
	        int col = 42;
	        int ln = Integer.parseInt(prMant.getE01TAGLE2().trim());
	        if (ln <= 35) {
	          col = ln + 7;
	        } else {
	          row = ln / 35;
	        }  	
	        %>
			<TEXTAREA id="E01PRAFL2" name="E01PRAFL2" cols="<%=col%>" rows="<%=row%>" style="overflow:hidden"
			 onkeypress="textCounter(this,<%=prMant.getE01TAGLE2().trim()%>)"
			 ><%= prMant.getE01PRAFL2().trim()%></TEXTAREA>  
		</td>
	</TR>
	<% } %>  
	<% 
	  if (!prMant.getE01PRATG3().trim().equals("")) { 
	%>
    <TR id=trclear>
		<td NOWRAP align="center" width="5%" valign="top">
			<INPUT type="text" id="E01PRASQ3" name="E01PRASQ3" size="2" maxlength="1" value="<%= prMant.getE01PRASQ3().trim()%>" readonly >
		</td>
		<td NOWRAP align="center" width="5%" valign="top">
			<INPUT type="text" id="E01PRATG3" name="E01PRATG3" size="5" maxlength="4" value="<%= prMant.getE01PRATG3().trim()%>" readonly >
		</td>
		<td NOWRAP align="center" width="20%" valign="top">
			<INPUT type="text" id="E01TAGDS3" name="E01TAGDS3" size="31" maxlength="30" value="<%= prMant.getE01TAGDS3().trim()%>" readonly >
		</td>
		<td NOWRAP align="center" width="5%" valign="top">
			<INPUT type="text" id="E01PRAOP3" name="E01PRAOP3" size="2" maxlength="1" value="<%= prMant.getE01PRAOP3().trim()%>" >
		</td>
		<td NOWRAP align="left" width="65%" valign="top">
			<%
	        int row = 1;
	        int col = 42;
	        int ln = Integer.parseInt(prMant.getE01TAGLE3().trim());
	        if (ln <= 35) {
	          col = ln + 7;
	        } else {
	          row = ln / 35;
	        }  	
	        %>
			<TEXTAREA id="E01PRAFL3" name="E01PRAFL3" cols="<%=col%>" rows="<%=row%>" style="overflow:hidden"
			 onkeypress="textCounter(this,<%=prMant.getE01TAGLE3().trim()%>)"
			 ><%= prMant.getE01PRAFL3().trim()%></TEXTAREA>  
		</td>
	</TR>
	<% } %>  
	<% 
	  if (!prMant.getE01PRATG4().trim().equals("")) { 
	%>
    <TR id=trclear>
		<td NOWRAP align="center" width="5%" valign="top">
			<INPUT type="text" id="E01PRASQ4" name="E01PRASQ4" size="2" maxlength="1" value="<%= prMant.getE01PRASQ4().trim()%>" readonly >
		</td>
		<td NOWRAP align="center" width="5%" valign="top">
			<INPUT type="text" id="E01PRATG4" name="E01PRATG4" size="5" maxlength="4" value="<%= prMant.getE01PRATG4().trim()%>" readonly >
		</td>
		<td NOWRAP align="center" width="20%" valign="top">
			<INPUT type="text" id="E01TAGDS4" name="E01TAGDS4" size="31" maxlength="30" value="<%= prMant.getE01TAGDS4().trim()%>" readonly >
		</td>
		<td NOWRAP align="center" width="5%" valign="top">
			<INPUT type="text" id="E01PRAOP4" name="E01PRAOP4" size="2" maxlength="1" value="<%= prMant.getE01PRAOP4().trim()%>" >
		</td>
		<td NOWRAP align="left" width="65%" valign="top">
			<%
	        int row = 1;
	        int col = 42;
	        int ln = Integer.parseInt(prMant.getE01TAGLE4().trim());
	        if (ln <= 35) {
	          col = ln + 7;
	        } else {
	          row = ln / 35;
	        }  	
	        %>
			<TEXTAREA id="E01PRAFL4" name="E01PRAFL4" cols="<%=col%>" rows="<%=row%>" style="overflow:hidden" 
			 onkeypress="textCounter(this,<%=prMant.getE01TAGLE4().trim()%>)" 
			 ><%= prMant.getE01PRAFL4().trim()%></TEXTAREA>  
		</td>
	</TR>
	<% } %>  
	<% 
	  if (!prMant.getE01PRATG5().trim().equals("")) { 
	%>
    <TR id=trclear>
		<td NOWRAP align="center" width="5%" valign="top">
			<INPUT type="text" id="E01PRASQ5" name="E01PRASQ5" size="2" maxlength="1" value="<%= prMant.getE01PRASQ5().trim()%>" readonly >
		</td>
		<td NOWRAP align="center" width="5%" valign="top">
			<INPUT type="text" id="E01PRATG5" name="E01PRATG5" size="5" maxlength="4" value="<%= prMant.getE01PRATG5().trim()%>" readonly >
		</td>
		<td NOWRAP align="center" width="20%" valign="top">
			<INPUT type="text" id="E01TAGDS5" name="E01TAGDS5" size="31" maxlength="30" value="<%= prMant.getE01TAGDS5().trim()%>" readonly >
		</td>
		<td NOWRAP align="center" width="5%" valign="top">
			<INPUT type="text" id="E01PRAOP5" name="E01PRAOP5" size="2" maxlength="1" value="<%= prMant.getE01PRAOP5().trim()%>" >
		</td>
		<td NOWRAP align="left" width="65%" valign="top">
			<%
	        int row = 1;
	        int col = 42;
	        int ln = Integer.parseInt(prMant.getE01TAGLE5().trim());
	        if (ln <= 35) {
	          col = ln + 7;
	        } else {
	          row = ln / 35;
	        }  	
	        %>
			<TEXTAREA id="E01PRAFL5" name="E01PRAFL5" cols="<%=col%>" rows="<%=row%>" style="overflow:hidden"
			 onkeypress="textCounter(this,<%=prMant.getE01TAGLE5().trim()%>)"
			 ><%= prMant.getE01PRAFL5().trim()%></TEXTAREA>  
		</td>
	</TR>
	<% } %>  
	<% 
	  if (!prMant.getE01PRATG6().trim().equals("")) { 
	%>
    <TR id=trclear>
		<td NOWRAP align="center" width="5%" valign="top">
			<INPUT type="text" id="E01PRASQ6" name="E01PRASQ6" size="2" maxlength="1" value="<%= prMant.getE01PRASQ6().trim()%>" readonly >
		</td>
		<td NOWRAP align="center" width="5%" valign="top">
			<INPUT type="text" id="E01PRATG6" name="E01PRATG6" size="5" maxlength="4" value="<%= prMant.getE01PRATG6().trim()%>" readonly >
		</td>
		<td NOWRAP align="center" width="20%" valign="top">
			<INPUT type="text" id="E01TAGDS6" name="E01TAGDS6" size="31" maxlength="30" value="<%= prMant.getE01TAGDS6().trim()%>" readonly >
		</td>
		<td NOWRAP align="center" width="5%" valign="top">
			<INPUT type="text" id="E01PRAOP6" name="E01PRAOP6" size="2" maxlength="1" value="<%= prMant.getE01PRAOP6().trim()%>" >
		</td>
		<td NOWRAP align="left" width="65%" valign="top">
			<%
	        int row = 1;
	        int col = 42;
	        int ln = Integer.parseInt(prMant.getE01TAGLE6().trim());
	        if (ln <= 35) {
	          col = ln + 7;
	        } else {
	          row = ln / 35;
	        }  	
	        %>
			<TEXTAREA id="E01PRAFL6" name="E01PRAFL6" cols="<%=col%>" rows="<%=row%>" style="overflow:hidden"
			 onkeypress="textCounter(this,<%=prMant.getE01TAGLE6().trim()%>)"
			 ><%= prMant.getE01PRAFL6().trim()%></TEXTAREA>  
		</td>
	</TR>
	<% } %>  
	<% 
	  if (!prMant.getE01PRATG7().trim().equals("")) { 
	%>
    <TR id=trclear>
		<td NOWRAP align="center" width="5%" valign="top">
			<INPUT type="text" id="E01PRASQ7" name="E01PRASQ7" size="2" maxlength="1" value="<%= prMant.getE01PRASQ7().trim()%>" readonly >
		</td>
		<td NOWRAP align="center" width="5%" valign="top">
			<INPUT type="text" id="E01PRATG7" name="E01PRATG7" size="5" maxlength="4" value="<%= prMant.getE01PRATG7().trim()%>" readonly >
		</td>
		<td NOWRAP align="center" width="20%" valign="top">
			<INPUT type="text" id="E01TAGDS7" name="E01TAGDS7" size="31" maxlength="30" value="<%= prMant.getE01TAGDS7().trim()%>" readonly >
		</td>
		<td NOWRAP align="center" width="5%" valign="top">
			<INPUT type="text" id="E01PRAOP7" name="E01PRAOP7" size="2" maxlength="1" value="<%= prMant.getE01PRAOP7().trim()%>" >
		</td>
		<td NOWRAP align="left" width="65%" valign="top">
			<%
	        int row = 1;
	        int col = 42;
	        int ln = Integer.parseInt(prMant.getE01TAGLE7().trim());
	        if (ln <= 35) {
	          col = ln + 7;
	        } else {
	          row = ln / 35;
	        }  	
	        %>
			<TEXTAREA id="E01PRAFL7" name="E01PRAFL7" cols="<%=col%>" rows="<%=row%>" style="overflow:hidden"
			 onkeypress="textCounter(this,<%=prMant.getE01TAGLE7().trim()%>)"
			 ><%= prMant.getE01PRAFL7().trim()%></TEXTAREA>  
		</td>
	</TR>
	<% } %>  
	<% 
	  if (!prMant.getE01PRATG8().trim().equals("")) { 
	%>
    <TR id=trclear>
		<td NOWRAP align="center" width="5%" valign="top">
			<INPUT type="text" id="E01PRASQ8" name="E01PRASQ8" size="2" maxlength="1" value="<%= prMant.getE01PRASQ8().trim()%>" readonly >
		</td>
		<td NOWRAP align="center" width="5%" valign="top">
			<INPUT type="text" id="E01PRATG8" name="E01PRATG8" size="5" maxlength="4" value="<%= prMant.getE01PRATG8().trim()%>" readonly >
		</td>
		<td NOWRAP align="center" width="20%" valign="top">
			<INPUT type="text" id="E01TAGDS8" name="E01TAGDS8" size="31" maxlength="30" value="<%= prMant.getE01TAGDS8().trim()%>" readonly >
		</td>
		<td NOWRAP align="center" width="5%" valign="top">
			<INPUT type="text" id="E01PRAOP8" name="E01PRAOP8" size="2" maxlength="1" value="<%= prMant.getE01PRAOP8().trim()%>" >
		</td>
		<td NOWRAP align="left" width="65%" valign="top">
			<%
	        int row = 1;
	        int col = 42;
	        int ln = Integer.parseInt(prMant.getE01TAGLE8().trim());
	        if (ln <= 35) {
	          col = ln + 7;
	        } else {
	          row = ln / 35;
	        }  	
	        %>
			<TEXTAREA id="E01PRAFL8" name="E01PRAFL8" cols="<%=col%>" rows="<%=row%>" style="overflow:hidden"
			 onkeypress="textCounter(this,<%=prMant.getE01TAGLE8().trim()%>)"
			 ><%= prMant.getE01PRAFL8().trim()%></TEXTAREA>  
		</td>
	</TR>
	<% } %>  
	<% 
	  if (!prMant.getE01PRATG9().trim().equals("")) { 
	%>
    <TR id=trclear>
		<td NOWRAP align="center" width="5%" valign="top">
			<INPUT type="text" id="E01PRASQ9" name="E01PRASQ9" size="2" maxlength="1" value="<%= prMant.getE01PRASQ9().trim()%>" readonly >
		</td>
		<td NOWRAP align="center" width="5%" valign="top">
			<INPUT type="text" id="E01PRATG9" name="E01PRATG9" size="5" maxlength="4" value="<%= prMant.getE01PRATG9().trim()%>" readonly >
		</td>
		<td NOWRAP align="center" width="20%" valign="top">
			<INPUT type="text" id="E01TAGDS9" name="E01TAGDS9" size="31" maxlength="30" value="<%= prMant.getE01TAGDS9().trim()%>" readonly >
		</td>
		<td NOWRAP align="center" width="5%" valign="top">
			<INPUT type="text" id="E01PRAOP9" name="E01PRAOP9" size="2" maxlength="1" value="<%= prMant.getE01PRAOP9().trim()%>" >
		</td>
		<td NOWRAP align="left" width="65%" valign="top">
			<%
	        int row = 1;
	        int col = 42;
	        int ln = Integer.parseInt(prMant.getE01TAGLE9().trim());
	        if (ln <= 35) {
	          col = ln + 7;
	        } else {
	          row = ln / 35;
	        }  	
	        %>
			<TEXTAREA id="E01PRAFL9" name="E01PRAFL9" cols="<%=col%>" rows="<%=row%>" style="overflow:hidden"
			 onkeypress="textCounter(this,<%=prMant.getE01TAGLE9().trim()%>)"
			 ><%= prMant.getE01PRAFL9().trim()%></TEXTAREA>  
		</td>
	</TR>
	<% } %>  













  </TABLE>
<br>  
  
  
<p align="center"> 
	
	<input id="EIBSBTN" type=button name="Pdf" value="Pdf" OnClick="showPdf();" >

  </p>

</form>

</body>
</html>
