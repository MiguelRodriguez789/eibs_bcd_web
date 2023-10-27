<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<title>Payment and Receiving</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id="prBasic" class="datapro.eibs.beans.EPR200001Message"  scope="session" />
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
	 	via = Integer.parseInt(prBasic.getE01PRPVIA());
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
        
          <input type="text" name="E01PRPDAC" size="13" maxlength="12" value="<%= prBasic.getE01PRPDAC()%>" readonly>
        
        </td>
      	<td nowrap width="20%"> 
        <div align="right">Referencia : </div>
      	</td>
      	
      	<td nowrap width="40%" >
      	  <input type="text" name="E01PRPNUM" size="12" maxlength="11" value="<%= prBasic.getE01PRPNUM()%>" readonly>                              
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
                        <select name="E01PRPVIA" disabled>
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
                        <input type="text" name="E01PRPCOT" size="4" maxlength="3" value="<%= prBasic.getE01PRPCOT().trim()%>" readonly>                      
                      </td>
                    </tr>
                    <tr id="trclear"> 
                      <td nowrap width="31%"> 
                        <div align="right">Monto Transferencia :</div>
                      </td>
                      <td nowrap > 
                        <input type="text" name="E01PRPAMT" size="17" maxlength="17" value="<%= prBasic.getE01PRPAMT().trim()%>" readonly>
                      </td>
                      <td nowrap> 
                        <div align="right">Moneda :</div>
                      </td>
                      <td nowrap> 
                        <input type="text" name="E01PRPTCY" size="4" maxlength="3" value="<%= prBasic.getE01PRPTCY().trim()%>" readonly>
                      </td>
                    </tr>
                    <tr id="trdark" > 
                      <td nowrap width="31%"> 
                        <div align="right">Ref. Beneficiario :</div>
                      </td>
                      <td nowrap width="25%"> 
                        <input type="text" name="E01PRPTHF" size="16" maxlength="16" value="<%= prBasic.getE01PRPTHF().trim()%>" readonly>
                      </td>
                      <td nowrap width="27%"> 
                        <div align="right">Ref. Ordenante :</div>
                      </td>
                      <td nowrap width="17%"> 
                        <input type="text" name="E01PRPSRF" size="16" maxlength="16" value="<%= prBasic.getE01PRPSRF().trim()%>" readonly>
                      </td>
                    </tr>
                    <tr id="trclear" > 
                      <td nowrap width="31%" >
                      <div align="right">Ident.Recibidor :</div>
                      </td>
                      <td nowrap width="25%"> 
                        <input type="text" name="E01PRPRPD" size="25" maxlength="25" value="<%= prBasic.getE01PRPRPD().trim()%>" readonly>
                      </td>
                      <td nowrap width="27%"> 
                        <div align="right">Nombre Corto Recibidor :</div>
                      </td>
                      <td nowrap width="17%"> 
                        <input type="text" name="E01PRPRSH" size="25" maxlength="15" value="<%= prBasic.getE01PRPRSH().trim()%>" readonly>
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
                        <input type="text" name="E11PRPBCU" size="45" maxlength="35" value="<%= prBasic.getE11PRPBCU()%>" readonly><br>
                      	<input type="text" name="E21PRPBCU" size="45" maxlength="35" value="<%= prBasic.getE21PRPBCU()%>" readonly><br>
                      	<input type="text" name="E31PRPBCU" size="45" maxlength="35" value="<%= prBasic.getE31PRPBCU()%>" readonly><br>
                      	<input type="text" name="E41PRPBCU" size="45" maxlength="35" value="<%= prBasic.getE41PRPBCU()%>" readonly><br>
                      	<input type="text" name="E51PRPBCU" size="45" maxlength="35" value="<%= prBasic.getE51PRPBCU()%>" readonly>
                      	<div id="accTyp" style="display:block">
                		<select name="E01PRPBCO" id="E01PRPBCO" disabled>
                		<option value=" " <% if(prBasic.getE01PRPBCO().equals(" ")) out.print("selected");%>> </option>
                		<option value="S" <% if(prBasic.getE01PRPBCO().equals("S")) out.print("selected");%>>Ahorros</option>
                        <option value="C" <% if(prBasic.getE01PRPBCO().equals("C")) out.print("selected");%>>Cheques</option>
                    	</select>
                		</div>
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
                        <input type="text" name="E01PRPBBO" size="2" maxlength="1" value="<%= prBasic.getE01PRPBBO()%>" readonly>
                      </td>
                      
                      <td nowrap > 
                        <input type="text" name="E11PRPBBK" size="45" maxlength="35" value="<%= prBasic.getE11PRPBBK()%>" readonly><br>
                      	<input type="text" name="E21PRPBBK" size="45" maxlength="35" value="<%= prBasic.getE21PRPBBK()%>" readonly><br>
                      	<input type="text" name="E31PRPBBK" size="45" maxlength="35" value="<%= prBasic.getE31PRPBBK()%>" readonly><br>
                      	<input type="text" name="E41PRPBBK" size="45" maxlength="35" value="<%= prBasic.getE41PRPBBK()%>" readonly><br>
                      	<input type="text" name="E51PRPBBK" size="45" maxlength="35" value="<%= prBasic.getE51PRPBBK()%>" readonly>
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
                        <input type="text" name="E11PRPDTP" size="45" maxlength="45" value="<%= prBasic.getE11PRPDTP()%>" readonly><br>
                      	<input type="text" name="E21PRPDTP" size="45" maxlength="45" value="<%= prBasic.getE21PRPDTP()%>" readonly><br>
                      	<input type="text" name="E31PRPDTP" size="45" maxlength="45" value="<%= prBasic.getE31PRPDTP()%>" readonly><br>
                      	<input type="text" name="E41PRPDTP" size="45" maxlength="45" value="<%= prBasic.getE41PRPDTP()%>" readonly><br>
                      	<input type="text" name="E51PRPDTP" size="45" maxlength="45" value="<%= prBasic.getE51PRPDTP()%>" readonly>
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
                        <input type="text" name="E11PRPINB" size="45" maxlength="45" value="<%= prBasic.getE11PRPINB()%>" readonly><br>
                        <input type="text" name="E21PRPINB" size="45" maxlength="45" value="<%= prBasic.getE21PRPINB()%>" readonly><br>
                        <input type="text" name="E31PRPINB" size="45" maxlength="45" value="<%= prBasic.getE31PRPINB()%>" readonly><br>
                        <input type="text" name="E41PRPINB" size="45" maxlength="45" value="<%= prBasic.getE41PRPINB()%>" readonly><br>
                        <input type="text" name="E51PRPINB" size="45" maxlength="45" value="<%= prBasic.getE51PRPINB()%>" readonly>
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
                        <input type="text"  name="E01PRPDBK" size="3" maxlength="2" value="<%= prBasic.getE01PRPDBK()%>" readonly>
                      </td>
                      <td nowrap align="center"> 
                        <input type="text"  name="E01PRPDBR" size="4" maxlength="4" value="<%= prBasic.getE01PRPDBR()%>" readonly>
                      </td>
                      <td nowrap align="center"> 
                      	<input type="text"  name="E01PRPDCY" size="3" maxlength="3" value="<%= prBasic.getE01PRPDCY()%>" readonly>
                      </td>
                      <td nowrap align="center">
                        <input type="text"  name="E01PRPDGL" size="17" maxlength="16" value="<%= prBasic.getE01PRPDGL()%>" readonly>                        
                      </td>
                      <td nowrap align="center">
                        <input type="text" name="E01PRPDAC" size="13" maxlength="12" value="<%= prBasic.getE01PRPDAC()%>" readonly>
                      </td>
                      <td nowrap align="center">
                       <input type="text"  name="E01PRPDSA" size="6" maxlength="5" value="<%= prBasic.getE01PRPDSA()%>" readonly>
                      </td>
                      <td nowrap align="center">
                        <input type="text" name="E01PRPDCC" size="9" maxlength="8" value="<%= prBasic.getE01PRPDCC()%>" readonly>
                      </td>
                    </tr>
                    <tr id="trclear" > 
                      <td nowrap > 
                        <div align="right">Cuenta de Credito :</div>
                      </td>
                      <td nowrap align="center"> 
                        <input type="text" name="E01PRPCBK" size="3" maxlength="2" value="<%= prBasic.getE01PRPCBK()%>" readonly>
					  </td>
                      <td nowrap align="center"> 
                        <input type="text" name="E01PRPCBR" size="4" maxlength="4" value="<%= prBasic.getE01PRPCBR()%>" readonly>
                      </td>
                      <td nowrap align="center">
                        <input type="text" name="E01PRPCCY" size="3" maxlength="3" value="<%= prBasic.getE01PRPCCY()%>" readonly>
                      </td>
                      <td nowrap align="center">
                        <input type="text" name="E01PRPCGL" size="17" maxlength="16" value="<%= prBasic.getE01PRPCGL()%>" readonly>                     
                      </td>
                      <td nowrap align="center">
                        <input type="text" name="E01PRPCAC" size="13" maxlength="12" value="<%= prBasic.getE01PRPCAC()%>" readonly>
                      </td>
                      <td nowrap align="center">
                        <input type="text" name="E01PRPCSA" size="6" maxlength="5" value="<%= prBasic.getE01PRPCSA()%>" readonly>
                      </td>
                      <td nowrap align="center">
                       <input type="text" name="E01PRPCCC" size="9" maxlength="8" value="<%= prBasic.getE01PRPCCC()%>" readonly>
                      </td>
                    </tr>
                    <tr id="trdark" > 
                      <td nowrap > 
                        <div align="right">Descripcion :</div>
                      </td>
                      <td nowrap colspan=7> 
                        <input type="text" name="E01PRPDSC" size="65" maxlength="65" value="<%= prBasic.getE01PRPDSC()%>" readonly> 
					  </td>
					 </tr>	
                    <tr id="trclear"> 
                      <td nowrap > 
                        <div align="right">Frecuencia de Pago :</div>
                      </td>
                      <td nowrap colspan=7> 
                        <select name="E01PRPFRQ" disabled>
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
                        <input type="text" name="E01PRPPMD" size="3" maxlength="2" value="<%= prBasic.getE01PRPPMD()%>" readonly>
                        </td>
                    </tr>
                    <tr id="trclear"> 
                      <td nowrap > 
                        <div align="right"> o N&uacute;mero de D&iacute;as :</div>
                      </td>
                      <td nowrap colspan=7> 
                        <input type="text" name="E01PRPDYS" size="4" maxlength="3" value="<%= prBasic.getE01PRPDYS()%>" readonly>
                        (Para frecuencia de pagos variable solamente) </td>
                    </tr>
                    <tr id="trdark" > 
                      <td nowrap > 
                        <div align="right">N&uacute;mero de Pagos :</div>
                      </td>
                      <td nowrap colspan=7> 
                        <input type="text" name="E01PRPNPM" size="6" maxlength="4" value="<%= prBasic.getE01PRPNPM()%>" readonly>
                        (9999 = Indefinido) </td>
                    </tr>
                    <tr id="trclear" > 
                      <td nowrap > 
                        <div align="right">Tipo de Pago :</div>
                      </td>
                      <td nowrap colspan=7> 
                        <input type="radio" name="E01PRPPMT" value="F" disabled 
              <%if(!prBasic.getE01PRPPMT().equals("V")) out.print("checked");%>>
                        Fijo 
                        <input type="radio" name="E01PRPPMT" value="V" disabled  
              <%if(prBasic.getE01PRPPMT().equals("V")) out.print("checked");%>>
                        Variable </td>
                    </tr>
                    <tr id="trdark" > 
                      <td nowrap > 
                        <div align="right">Autoriza Sobregiros :</div>
                      </td>
                      <td nowrap colspan=7> 
                        <input type="radio" name="E01PRPODA" value="Y" disabled  
              <%if(prBasic.getE01PRPODA().equals("Y")) out.print("checked");%>>
                        S&iacute; 
                        <input type="radio" name="E01PRPODA" value="N" disabled  
              <%if(!prBasic.getE01PRPODA().equals("Y")) out.print("checked");%>>
                        No </td>
                    </tr>
                    <tr id="trclear"> 
                      <td nowrap > 
                        <div align="right">Suspender Pago :</div>
                      </td>
                      <td nowrap colspan=7> 
                        <input type="radio" name="E01PRPSPM" value="Y" disabled  
              <%if(prBasic.getE01PRPSPM().equals("Y")) out.print("checked");%>>
                        S&iacute; 
                        <input type="radio" name="E01PRPSPM" value="N" disabled  
              <%if(!prBasic.getE01PRPSPM().equals("Y")) out.print("checked");%>>
                        No </td>
                    </tr>
                    <tr id="trdark" > 
                      <td nowrap > 
                        <div align="right">Reflejado en estado :</div>
                      </td>
                      <td nowrap colspan=7> 
                        <input type="text" name="E01PRPDAS" size="6" maxlength="4" value="<%= prBasic.getE01PRPDAS()%>" readonly>
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
                        <input type="text" name="E01PRPLPD" size="3" maxlength="2" value="<%= prBasic.getE01PRPLPD().trim()%>" readonly>                        
                        <input type="text" name="E01PRPLPM" size="3" maxlength="2" value="<%= prBasic.getE01PRPLPM().trim()%>" readonly>
                        <input type="text" name="E01PRPLPY" size="5" maxlength="4" value="<%= prBasic.getE01PRPLPY().trim()%>" readonly>
                      </td>
                      <td nowrap> 
                        <div align="right">Monto :</div>
                      </td>
                      <td nowrap> 
                        <input type="text" name="E01PRPLPA" size="17" maxlength="15" value="<%= prBasic.getE01PRPLPA().trim()%>" readonly>
                      </td>
                    </tr>
                    <tr id="trclear" > 
                      <td nowrap width="31%"> 
                        <div align="right">No. Referencia :</div>
                      </td>
                      <td nowrap width="25%"> 
                        <input type="text" name="E01PRPLRF" size="13" maxlength="12" value="<%= prBasic.getE01PRPLRF().trim()%>" readonly>
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
  
  <p align="center"> 
  	<input id="EIBSBTN" type=button name="Submit" value="Consultar" onclick="javascript:showLetter(document.forms[0].E01PRPDAC.value,document.forms[0].E01PRPNUM.value)">
  </p>
  
<script>
	function showLetter(acc, ref){
 		var page = "${pageContext.request.contextPath}/servlet/datapro.eibs.transfer.JSEPR2040?account=" + acc + "&ref="+ref;
		CenterWindow(page, 600, 400, 2);
	}
</script>  
</form>
</body>
</html>
