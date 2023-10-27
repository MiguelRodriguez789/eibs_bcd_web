<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<title>Payment and Receiving</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id="prBasic" class="datapro.eibs.beans.EPR200002Message"  scope="session" />
<jsp:useBean id="error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos"  scope="session" />

<SCRIPT SRC="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>

<SCRIPT type="text/javascript">
  
  	function showTab(index){  
  		for (var i=0; i<4; i++){
   			document.getElementById("Tab"+i).className = "tabnormal";
   			document.getElementById("dataTab"+i).style.display = "none";
   		}
    	document.getElementById("Tab"+index).className = "tabhighlight";  
  		document.getElementById("dataTab"+index).style.display = "block";
  	}
    
</SCRIPT>

</head>

<body>

<% 
	 int via = 0;
	 try {
	 	via = Integer.parseInt(prBasic.getE02PRPVIA());
	 } catch (Exception e) {
	 	via = 7;
	 } 
%>

<h3 align="center">Consulta Ordenes de Pago 
	<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="pr_inquiry.jsp, EPR2000" ></h3>
<hr size="4">


<form >

  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="2">
  	
  <table class="tableinfo" >
    <tr> 
      <td > 
      <table  cellspacing=0 cellpadding=0 width="100%">
      <tr id=trdark>
      	<td nowrap width="30%" > 
        <div align="right">Cuenta :</div>
      	</td>
      	<td nowrap width="10%">  
        
          <input type="text" name="account" size="13" maxlength="12" value="<%= prBasic.getE02PRPDAC()%>" readonly>
        
        </td>
      	<td nowrap width="20%"> 
        <div align="right">Referencia : </div>
      	</td>
      	
      	<td nowrap width="40%" >
      	  <input type="text" name="E02PRPNUM" size="12" maxlength="11" value="<%= prBasic.getE02PRPNUM()%>" readonly>                              
      	</td>
      	
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
                        <select name="E02PRPVIA" disabled>
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
                        <input type="text" name="E02PRPCOT" size="4" maxlength="3" value="<%= prBasic.getE02PRPCOT().trim()%>" readonly>                      
                      </td>
                    </tr>
                    <tr id="trclear"> 
                      <td nowrap width="31%"> 
                        <div align="right">Monto Transferencia :</div>
                      </td>
                      <td nowrap > 
                        <input type="text" name="E02PRPAMT" size="17" maxlength="17" value="<%= prBasic.getE02PRPAMT().trim()%>" readonly>
                      </td>
                      <td nowrap> 
                        <div align="right">Moneda :</div>
                      </td>
                      <td nowrap> 
                        <input type="text" name="E02PRPTCY" size="4" maxlength="3" value="<%= prBasic.getE02PRPTCY().trim()%>" readonly>
                      </td>
                    </tr>
                    <tr id="trdark" > 
                      <td nowrap width="31%"> 
                        <div align="right">Ref. Beneficiario :</div>
                      </td>
                      <td nowrap width="25%"> 
                        <input type="text" name="E02PRPTHF" size="16" maxlength="16" value="<%= prBasic.getE02PRPTHF().trim()%>" readonly>
                      </td>
                      <td nowrap width="27%"> 
                        <div align="right">Ref. Ordenante :</div>
                      </td>
                      <td nowrap width="17%"> 
                        <input type="text" name="E02PRPSRF" size="16" maxlength="16" value="<%= prBasic.getE02PRPSRF().trim()%>" readonly>
                      </td>
                    </tr>
                    <tr id="trclear" > 
                      <td nowrap width="31%" >
                      <div align="right">Ident.Recibidor :</div>
                      </td>
                      <td nowrap width="25%"> 
                        <input type="text" name="E02PRPRPD" size="25" maxlength="25" value="<%= prBasic.getE02PRPRPD().trim()%>" readonly>
                      </td>
                      <td nowrap width="27%"> 
                        <div align="right">Nombre Corto Recibidor :</div>
                      </td>
                      <td nowrap width="17%"> 
                        <input type="text" name="E02PRPRSH" size="25" maxlength="15" value="<%= prBasic.getE02PRPRSH().trim()%>" readonly>
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
                  <td nowrap id="Tab0" class="tabhighlight" onClick="showTab(0)"> 
                    <div>Beneficiario</div>
                  </td> 
                
                  <td nowrap id="Tab1" class="tabnormal" onClick="showTab(1)"> 
                    <div>Banco Benef.</div>
                  </td> 
                 
                  <td nowrap id="Tab2" class="tabnormal" onClick="showTab(2)"> 
                    <div>Detalles Pago</div>
                  </td> 
                 
                  <td nowrap id="Tab3" class="tabnormal" onClick="showTab(3)"> 
                    <div>Banco Intermediario</div>
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
                <div id="dataTab0"> 
                  <table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr id="trdark" > 
                      <td nowrap width="40%" > 
                        <div align="right"> Cliente :</div>
                      </td>
                      <td nowrap> 
                        <input type="text" name="E12PRPBCU" size="45" maxlength="35" value="<%= prBasic.getE12PRPBCU()%>" readonly><br>
                      	<input type="text" name="E22PRPBCU" size="45" maxlength="35" value="<%= prBasic.getE22PRPBCU()%>" readonly><br>
                      	<input type="text" name="E32PRPBCU" size="45" maxlength="35" value="<%= prBasic.getE32PRPBCU()%>" readonly><br>
                      	<input type="text" name="E42PRPBCU" size="45" maxlength="35" value="<%= prBasic.getE42PRPBCU()%>" readonly><br>
                      	<input type="text" name="E52PRPBCU" size="45" maxlength="35" value="<%= prBasic.getE52PRPBCU()%>" readonly>
                      </td>                     
                    </tr>
                  </table>
                </div>
                
                <div id="dataTab1" style="display: none"> 
                  <table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr id="trdark" > 
                      <td nowrap width="40%" > 
                        <div align="right">Cuenta con Banco : </div>
                      </td>
                      <td nowrap width="2%" valign="top" > 
                        <input type="text" name="E02PRPBBO" size="2" maxlength="1" value="<%= prBasic.getE02PRPBBO()%>" readonly>
                      </td>
                      
                      <td nowrap > 
                        <input type="text" name="E12PRPBBK" size="45" maxlength="35" value="<%= prBasic.getE12PRPBBK()%>" readonly><br>
                      	<input type="text" name="E22PRPBBK" size="45" maxlength="35" value="<%= prBasic.getE22PRPBBK()%>" readonly><br>
                      	<input type="text" name="E32PRPBBK" size="45" maxlength="35" value="<%= prBasic.getE32PRPBBK()%>" readonly><br>
                      	<input type="text" name="E42PRPBBK" size="45" maxlength="35" value="<%= prBasic.getE42PRPBBK()%>" readonly><br>
                      	<input type="text" name="E52PRPBBK" size="45" maxlength="35" value="<%= prBasic.getE52PRPBBK()%>" readonly>
                      </td>
                    </tr>
                  </table>
                </div>
                
                <div id="dataTab2" style="display: none"> 
                  <table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr id="trdark" > 
                      <td nowrap width="40%" > 
                        <div align="right">Detalle de Pagos :</div>
                      </td>
                      
                      <td nowrap> 
                        <input type="text" name="E12PRPDTP" size="45" maxlength="35" value="<%= prBasic.getE12PRPDTP()%>" readonly><br>
                      	<input type="text" name="E22PRPDTP" size="45" maxlength="35" value="<%= prBasic.getE22PRPDTP()%>" readonly><br>
                      	<input type="text" name="E32PRPDTP" size="45" maxlength="35" value="<%= prBasic.getE32PRPDTP()%>" readonly><br>
                      	<input type="text" name="E42PRPDTP" size="45" maxlength="35" value="<%= prBasic.getE42PRPDTP()%>" readonly><br>
                      	<input type="text" name="E52PRPDTP" size="45" maxlength="35" value="<%= prBasic.getE52PRPDTP()%>" readonly>
                      </td>
                    </tr>
                  </table>
                </div>
                
                <div id="dataTab3" style="display: none"> 
                  <table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr id="trdark" > 
                      <td nowrap width="40%" > 
                        <div align="right"> Banco Intermediario :</div>
                      </td>
                      <td nowrap > 
                        <input type="text" name="E12PRPINB" size="45" maxlength="35" value="<%= prBasic.getE12PRPINB()%>" readonly><br>
                        <input type="text" name="E22PRPINB" size="45" maxlength="35" value="<%= prBasic.getE22PRPINB()%>" readonly><br>
                        <input type="text" name="E32PRPINB" size="45" maxlength="35" value="<%= prBasic.getE32PRPINB()%>" readonly><br>
                        <input type="text" name="E42PRPINB" size="45" maxlength="35" value="<%= prBasic.getE42PRPINB()%>" readonly><br>
                        <input type="text" name="E52PRPINB" size="45" maxlength="35" value="<%= prBasic.getE52PRPINB()%>" readonly>
                      </td>
                      
                    </tr>
                  </table>
                </div>
              
            </td>
            
    </tr>
  </table>
  <BR>
  <table class="tableinfo">
    <tr> 
      <td align="center"> 
  			<table width="100%" border="0" cellspacing="0" cellpadding="0"> 
  					<tr  id=trclear > 
                      <td nowrap > 
                        <div align="right"></div>
                      </td>
                      <th nowrap> 
                        <div align="center">Bco.</div>
                      </th>
                      <th nowrap> 
                        <div align="center">Suc.</div>
                      </th>
                      <th nowrap> 
                       <div align="center">MDA</div>
                      </th>
                      <th nowrap> <div align="center">GL</div>                        
                       </th>
                      <th nowrap> <div align="center">Cuenta</div>
                       </th>
                       <th nowrap> <div align="center">Sub Cuenta</div>
                      </th>
                      <th nowrap> <div align="center">C.Costo</div>
                      </th>
                    </tr>                     
                    <tr  id=trdark > 
                      <td nowrap > 
                        <div align="right">Cuenta de Debito :</div>
                      </td>
                      <td nowrap align="center"> 
                        <input type="text"  name="E02PRPDBK" size="3" maxlength="2" value="<%= prBasic.getE02PRPDBK()%>" readonly>
                      </td>
                      <td nowrap align="center"> 
                        <input type="text"  name="E02PRPDBR" size="4" maxlength="4" value="<%= prBasic.getE02PRPDBR()%>" readonly>
                      </td>
                      <td nowrap align="center"> 
                      	<input type="text"  name="E02PRPDCY" size="3" maxlength="3" value="<%= prBasic.getE02PRPDCY()%>" readonly>
                      </td>
                      <td nowrap align="center">
                        <input type="text"  name="E02PRPDGL" size="17" maxlength="16" value="<%= prBasic.getE02PRPDGL()%>" readonly>                        
                      </td>
                      <td nowrap align="center">
                        <input type="text" name="E02PRPDAC" size="13" maxlength="12" value="<%= prBasic.getE02PRPDAC()%>" readonly>
                      </td>
                      <td nowrap align="center">
                       <input type="text"  name="E02PRPDSA" size="6" maxlength="5" value="<%= prBasic.getE02PRPDSA()%>" readonly>
                      </td>
                      <td nowrap align="center">
                        <input type="text" name="E02PRPDCC" size="9" maxlength="8" value="<%= prBasic.getE02PRPDCC()%>" readonly>
                      </td>
                    </tr>
                    <tr id="trclear" > 
                      <td nowrap > 
                        <div align="right">Cuenta de Credito :</div>
                      </td>
                      <td nowrap align="center"> 
                        <input type="text" name="E02PRPCBK" size="3" maxlength="2" value="<%= prBasic.getE02PRPCBK()%>" readonly>
					  </td>
                      <td nowrap align="center"> 
                        <input type="text" name="E02PRPCBR" size="4" maxlength="4" value="<%= prBasic.getE02PRPCBR()%>" readonly>
                      </td>
                      <td nowrap align="center">
                        <input type="text" name="E02PRPCCY" size="3" maxlength="3" value="<%= prBasic.getE02PRPCCY()%>" readonly>
                      </td>
                      <td nowrap align="center">
                        <input type="text" name="E02PRPCGL" size="17" maxlength="16" value="<%= prBasic.getE02PRPCGL()%>" readonly>                     
                      </td>
                      <td nowrap align="center">
                        <input type="text" name="E02PRPCAC" size="13" maxlength="12" value="<%= prBasic.getE02PRPCAC()%>" readonly>
                      </td>
                      <td nowrap align="center">
                        <input type="text" name="E02PRPCSA" size="6" maxlength="5" value="<%= prBasic.getE02PRPCSA()%>" readonly>
                      </td>
                      <td nowrap align="center">
                       <input type="text" name="E02PRPCCC" size="9" maxlength="8" value="<%= prBasic.getE02PRPCCC()%>" readonly>
                      </td>
                    </tr>
                    <tr id="trdark" > 
                      <td nowrap > 
                        <div align="right">Descripcion :</div>
                      </td>
                      <td nowrap colspan=7> 
                        <input type="text" name="E02PRPDSC" size="65" maxlength="65" value="<%= prBasic.getE02PRPDSC()%>" readonly> 
					  </td>
					 </tr>	
                    <tr id="trclear"> 
                      <td nowrap > 
                        <div align="right">Frecuencia de Pago :</div>
                      </td>
                      <td nowrap colspan=7> 
                        <select name="E02PRPFRQ" disabled>
                          <option value="D" <% if(prBasic.getE02PRPFRQ().equals("D")) out.print("selected");%>>Diario</option>
                          <option value="W" <% if(prBasic.getE02PRPFRQ().equals("W")) out.print("selected");%>>Semanal</option>
                          <option value="M" <% if(prBasic.getE02PRPFRQ().equals("M")) out.print("selected");%>>Mensual</option>
                          <option value="V" <% if(prBasic.getE02PRPFRQ().equals("V")) out.print("selected");%>>Variable</option>
                          <option value="2" <% if(prBasic.getE02PRPFRQ().equals("2")) out.print("selected");%>>Cada 2 Meses</option>
                          <option value="3" <% if(prBasic.getE02PRPFRQ().equals("3")) out.print("selected");%>>Cada 3 Meses</option>
                        </select>
                      </td>
                    </tr>
                    <tr id=trdark> 
                      <td nowrap > 
                        <div align="right"> D&iacute;a de Pago :</div>
                      </td>
                      <td nowrap colspan=7> 
                        <input type="text" name="E02PRPPMD" size="3" maxlength="2" value="<%= prBasic.getE02PRPPMD()%>" readonly>
                        </td>
                    </tr>
                    <tr id="trclear"> 
                      <td nowrap > 
                        <div align="right"> o N&uacute;mero de D&iacute;as :</div>
                      </td>
                      <td nowrap colspan=7> 
                        <input type="text" name="E02PRPDYS" size="4" maxlength="3" value="<%= prBasic.getE02PRPDYS()%>" readonly>
                        (Para frecuencia de pagos variable solamente) </td>
                    </tr>
                    <tr id="trdark" > 
                      <td nowrap > 
                        <div align="right">N&uacute;mero de Pagos :</div>
                      </td>
                      <td nowrap colspan=7> 
                        <input type="text" name="E02PRPNPM" size="6" maxlength="4" value="<%= prBasic.getE02PRPNPM()%>" readonly>
                        (9999 = Indefinido) </td>
                    </tr>
                    <tr id="trclear" > 
                      <td nowrap > 
                        <div align="right">Tipo de Pago :</div>
                      </td>
                      <td nowrap colspan=7> 
                        <input type="radio" name="E02PRPPMT" value="F" disabled 
              <%if(!prBasic.getE02PRPPMT().equals("V")) out.print("checked");%>>
                        Fijo 
                        <input type="radio" name="E02PRPPMT" value="V" disabled  
              <%if(prBasic.getE02PRPPMT().equals("V")) out.print("checked");%>>
                        Variable </td>
                    </tr>
                    <tr id="trdark" > 
                      <td nowrap > 
                        <div align="right">Autoriza Sobregiros :</div>
                      </td>
                      <td nowrap colspan=7> 
                        <input type="radio" name="E02PRPODA" value="Y" disabled  
              <%if(prBasic.getE02PRPODA().equals("Y")) out.print("checked");%>>
                        S&iacute; 
                        <input type="radio" name="E02PRPODA" value="N" disabled  
              <%if(!prBasic.getE02PRPODA().equals("Y")) out.print("checked");%>>
                        No </td>
                    </tr>
                    <tr id="trclear"> 
                      <td nowrap > 
                        <div align="right">Suspender Pago :</div>
                      </td>
                      <td nowrap colspan=7> 
                        <input type="radio" name="E02PRPSPM" value="Y" disabled  
              <%if(prBasic.getE02PRPSPM().equals("Y")) out.print("checked");%>>
                        S&iacute; 
                        <input type="radio" name="E02PRPSPM" value="N" disabled  
              <%if(!prBasic.getE02PRPSPM().equals("Y")) out.print("checked");%>>
                        No </td>
                    </tr>
                    <tr id="trdark" > 
                      <td nowrap > 
                        <div align="right">Reflejado en estado :</div>
                      </td>
                      <td nowrap colspan=7> 
                        <input type="text" name="E02PRPDAS" size="6" maxlength="4" value="<%= prBasic.getE02PRPDAS()%>" readonly>
                        (D&iacute;as) </td>
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
                        <input type="text" name="E02PRPLPD" size="3" maxlength="2" value="<%= prBasic.getE02PRPLPD().trim()%>" readonly>                        
                        <input type="text" name="E02PRPLPM" size="3" maxlength="2" value="<%= prBasic.getE02PRPLPM().trim()%>" readonly>
                        <input type="text" name="E02PRPLPY" size="5" maxlength="4" value="<%= prBasic.getE02PRPLPY().trim()%>" readonly>
                      </td>
                      <td nowrap> 
                        <div align="right">Monto :</div>
                      </td>
                      <td nowrap> 
                        <input type="text" name="E02PRPLPA" size="17" maxlength="15" value="<%= prBasic.getE02PRPLPA().trim()%>" readonly>
                      </td>
                    </tr>
                    <tr id="trclear" > 
                      <td nowrap width="31%"> 
                        <div align="right">No. Referencia :</div>
                      </td>
                      <td nowrap width="25%"> 
                        <input type="text" name="E02PRPLRF" size="13" maxlength="12" value="<%= prBasic.getE02PRPLRF().trim()%>" readonly>
                      </td>
                      <td nowrap width="27%"> 
                        <div align="right">No. Pago :</div>
                      </td>
                      <td nowrap width="17%"> 
                        <input type="text" name="E02PRPLPN" size="5" maxlength="5" value="<%= prBasic.getE02PRPLPN().trim()%>" readonly>
                      </td>
                    </tr>
                                     
                  </table>
      </td>
    </tr>
  </table>
  
</form>
</body>
</html>
