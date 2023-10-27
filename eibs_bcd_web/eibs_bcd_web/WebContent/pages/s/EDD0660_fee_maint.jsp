<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>Pagos y Recibos - Tablas de cargos</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Studio">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/jquery/plugins/contextMenu/css/jquery.contextMenu.css" rel="stylesheet" type="text/css" />

<jsp:useBean id="lnParam" class="datapro.eibs.beans.EDD066002Message"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "userPO" class="datapro.eibs.beans.UserPos"  scope="session" />

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>


<SCRIPT type="text/javascript">

function goBack(theForm) {
	theForm.SCREEN.value='1';
	theForm.submit(); 
}

function showFixPerField(fixAmountField, rateAmountField){
  var elem=event.srcElement;
  if (elem.value == 'F'){
    document.getElementById(fixAmountField).style.display="";
    document.getElementById(rateAmountField).style.display="none";
  }
  else{
    if (elem.value == '%'){
      document.getElementById(fixAmountField).style.display="none";
      document.getElementById(rateAmountField).style.display="";
    }
  }
  elem.focus();  
}

</SCRIPT>

<% 
 if ( !error.getERRNUM().equals("0")  ) {
     error.setERRNUM("0");
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
 }       
%>

</head>
<body>
<% String Title = "Estructura de Cargos de Pagos y Recibos";
   if (userPO.getHeader23().equals("DEJ")) Title = "Estructura de Cargos Dep&oacute;sitos Jur&iacute;dicos";
   if (userPO.getApplicationCode().equals("IT")) Title = "Estructura de Cargos Banca por Internet";
 %>
<h3 align="center"><%= Title %>
   <img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="fee_maint.jsp, EDD0660">
</h3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.params.JSEDD0660" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" id="SCREEN" value="200">
  <INPUT TYPE=HIDDEN NAME="OPT" id="OPT" value="<%= request.getParameter("OPT") %>">
   <INPUT TYPE=HIDDEN NAME="E02PRFACD" id="E02PRFACD" value="<%= userPO.getApplicationCode() %>">
  <table class="tableinfo">
    <tr> 
      <td nowrap> 
        <table cellspacing="0" width="100%" border="0" class="tbhead">
          <tr id="trdark"> 
            <td nowrap align=right> 
              <b>Banco :</b>
            </td>
            <td nowrap > 
              <input type="text" name="E02PRFBNK" size="3" maxlength="2" value="<%= lnParam.getE02PRFBNK()%>" readonly>
            </td>
            <td nowrap align=right> 
              <b>Estructura de Cargo :</b>
            </td>
            <td nowrap > 
               <input type="text" name="E02PRFTBL" size="4" maxlength="3" value="<%= lnParam.getE02PRFTBL()%>" readonly>
            </td>
            <td nowrap align=right> 
              <b>Moneda de Cargo :</b>
            </td>
            <td nowrap > 
               <input type="text" name="E02PRFFCY" size="4" maxlength="3" value="<%= lnParam.getE02PRFFCY()%>" >
			   <a href="javascript:GetCurrency('E02PRFFCY','')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="help" align="bottom" border="0"></a>
            </td>            
          </tr>
          <tr id="trdark"> 
            <td nowrap align=right> 
              <b>Cliente :</b>
            </td>
            <td nowrap > 
               <input type="text" name="E02PRFCUN" size="10" maxlength="9" value="<%= lnParam.getE02PRFCUN()%>" readonly>
            </td>
            <td nowrap align=right> 
              <b>Nombre :</b>
            </td>
            <td nowrap>  
               <input type="text" name="E02PRFDSC" size="35" maxlength="35" value="<%= lnParam.getE02PRFDSC()%>" >
            </td>
			<td>
			</td>
			<td>
			</td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <br>
  
 <h4>Cuentas de Suspenso</h4>
    <div align="left">         
    <table class="tableinfo" >
      <tr > 
          <td nowrap > 
            <div align="center"> 
            <table cellspacing="0" cellpadding="2" width="100%" border="0">
            <tr id="trdark"> 
                <td nowrap width="25%" > 
                  <div align="right">Cuenta Débito :</div>
                </td>
                <td nowrap colspan=4> 
                  <input type="text" name="E02PRFGPD" size="20" maxlength="16" value="<%= lnParam.getE02PRFGPD().trim()%>">
                  <input type="text" readonly name="D02GPDDSC" size="50" maxlength="45" value="<%= lnParam.getD02GPDDSC().trim()%>">
                  <a href="javascript:GetLedger('E02PRFGPD',document.forms[0].E02PRFBNK.value,document.forms[0].E02PRFFCY.value,'','D02GPDDSC','')">
                  <img src="<%=request.getContextPath()%>/images/1b.gif" alt="Ayuda" align="bottom" border="0"></a>
                </td>
              </tr>
              <tr id="trclear"> 
                <td nowrap width="25%" > 
                  <div align="right">Cuenta Crédito :</div>
                </td>
                <td nowrap colspan=4> 
                  <input type="text" name="E02PRFGPC" size="20" maxlength="16" value="<%= lnParam.getE02PRFGPC().trim()%>">
                  <input type="text" readonly name="D02GPCDSC" size="50" maxlength="45" value="<%= lnParam.getD02GPCDSC().trim()%>">
                  <a href="javascript:GetLedger('E02PRFGPC',document.forms[0].E02PRFBNK.value,document.forms[0].E02PRFFCY.value,'','D02GPCDSC','')">
                  <img src="<%=request.getContextPath()%>/images/1b.gif" alt="Ayuda" align="bottom" border="0"></a>
                </td>
              </tr>
          </table>
            
          </div>
          </td>
        </tr>
      </table>
   </div>
          
  <br>
  <table  class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="trdark"> 
            <th nowrap >Tipo<br>Cargo</th>
            <th nowrap >Monto<br>Cargo</th>
            <th nowrap >Rango<br>Inicial</th>
            <th nowrap >Rango<br>Final</th>
            <th nowrap >Monto<br>Máximo</th>
            <th nowrap >Monto<br>Mínimo</th>
            <th nowrap >Iva</th>
            <th nowrap >Moneda</th>
            <th nowrap >Cuenta</th>
            <th nowrap >Descripción</th>
          </tr>
          <tr id="trclear"> 
            <td nowrap > 
              <div align="center"> 
	              <select name="E02PRFFT1" id="E02PRFFT1" onchange="showFixPerField('E02PRFFA1','E02PRFRT1');" >
	                <option value=" " <% if (!(lnParam.getE02PRFFT1().equals("F") ||lnParam.getE02PRFFT1().equals("%"))) out.print("selected"); %>></option>
	                <option value="F" <% if (lnParam.getE02PRFFT1().equals("F")) out.print("selected"); %>>Monto Fijo</option>
	                <option value="%" <% if (lnParam.getE02PRFFT1().equals("%")) out.print("selected"); %>>Porcentaje</option>        
	              </select>                
              </div>
            </td>
            <td nowrap > 
              <div align="left" > 
              	<input type="text" name="E02PRFFA1" id="E02PRFFA1" value="<%= lnParam.getE02PRFFA1() %>" size="15" maxlength="9" onkeypress="enterDecimal()">              
              </div>
              <div align="left" > 
              	<input type="text" name="E02PRFRT1" id="E02PRFRT1" value="<%= lnParam.getE02PRFRT1() %>" size="15" maxlength="10" onkeypress="enterDecimal(6)">              
              </div>
            </td>

            <td nowrap > 
              <div align="right"> 
 				<input type="text" name="E02PRFRI1" id="E02PRFRI1" value="<%= lnParam.getE02PRFRI1() %>" size="16" maxlength="15" onkeypress="enterDecimal()">              
 			  </div>
            </td>

            <td nowrap > 
              <div align="right"> 
 				<input type="text" name="E02PRFRF1" id="E02PRFRF1" value="<%= lnParam.getE02PRFRF1() %>" size="16" maxlength="15" onkeypress="enterDecimal()">              
 			  </div>
            </td>



            <td nowrap > 
              <div align="right"> 
 				<input type="text" name="E02PRFFX1" id="E02PRFFX1" value="<%= lnParam.getE02PRFFX1() %>" size="15" maxlength="13" onkeypress="enterDecimal()">              
 			  </div>
            </td>
            <td nowrap > 
              <div align="right"> 
 				<input type="text" name="E02PRFFM1" id="E02PRFFM1" value="<%= lnParam.getE02PRFFM1() %>" size="15" maxlength="13" onkeypress="enterDecimal()">              
 			  </div>
            </td>
            <td nowrap > 
              <div align="center"> 
	              <select name="E02PRFIV1" id="E02PRFIV1">
	                <option value=" " <% if (!(lnParam.getE02PRFIV1().equals("Y") ||lnParam.getE02PRFIV1().equals("N"))) out.print("selected"); %>></option>
	                <option value="Y" <% if (lnParam.getE02PRFIV1().equals("Y")) out.print("selected"); %>>Si</option>
	                <option value="N" <% if (lnParam.getE02PRFIV1().equals("N")) out.print("selected"); %>>No</option>        
	              </select>                
              </div>
            </td>
            <td nowrap > 
              <div align="center"> 
 				<input type="text" name="E02PRFAC1" id="E02PRFAC1" value="<%= lnParam.getE02PRFAC1() %>" size="4" maxlength="3" class="context-menu-help" onmousedown="init(currencyHelp,this.name,'','','','','')">              
 			  </div>
            </td>
            <td nowrap> 
              <div align="center"> 
                <input type="text" name="E02PRFGL1" id="E02PRFGL1" size="20" maxlength="17" value="<%= lnParam.getE02PRFGL1()%>" class="context-menu-help" onmousedown="init(ledgerHelp,this.name,'','','','','')">
              </div>
            </td>
            <td nowrap> 
              <div align="center"> 
                <input type="text" name="D02GL1DSC" id="D02GL1DSC" size="35" maxlength="35" value="<%= lnParam.getD02GL1DSC()%>" >
              </div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap > 
              <div align="center"> 
	              <select name="E02PRFFT2" id="E02PRFFT2" onchange="showFixPerField('E02PRFFA2','E02PRFRT2');" >
	                <option value=" " <% if (!(lnParam.getE02PRFFT2().equals("F") ||lnParam.getE02PRFFT2().equals("%"))) out.print("selected"); %>></option>
	                <option value="F" <% if (lnParam.getE02PRFFT2().equals("F")) out.print("selected"); %>>Monto Fijo</option>
	                <option value="%" <% if (lnParam.getE02PRFFT2().equals("%")) out.print("selected"); %>>Porcentaje</option>        
	              </select>                
              </div>
            </td>
            <td nowrap > 
              <div align="left" > 
              	<input type="text" name="E02PRFFA2" id="E02PRFFA2" value="<%= lnParam.getE02PRFFA2() %>" size="15" maxlength="9" onkeypress="enterDecimal()">              
              </div>
              <div align="left" > 
              	<input type="text" name="E02PRFRT2" id="E02PRFRT2" value="<%= lnParam.getE02PRFRT2() %>" size="15" maxlength="10" onkeypress="enterDecimal(6)">              
              </div>
            </td>

            <td nowrap > 
              <div align="right"> 
 				<input type="text" name="E02PRFRI2" id="E02PRFRI2" value="<%= lnParam.getE02PRFRI2() %>" size="16" maxlength="15" onkeypress="enterDecimal()">              
 			  </div>
            </td>

            <td nowrap > 
              <div align="right"> 
 				<input type="text" name="E02PRFRF2" id="E02PRFRF2" value="<%= lnParam.getE02PRFRF2() %>" size="16" maxlength="15" onkeypress="enterDecimal()">              
 			  </div>
            </td>


            <td nowrap > 
              <div align="right"> 
 				<input type="text" name="E02PRFFX2" id="E02PRFFX2" value="<%= lnParam.getE02PRFFX2() %>" size="15" maxlength="13" onkeypress="enterDecimal()">              
 			  </div>
            </td>
            <td nowrap > 
              <div align="right"> 
 				<input type="text" name="E02PRFFM2" id="E02PRFFM2" value="<%= lnParam.getE02PRFFM2() %>" size="15" maxlength="13" onkeypress="enterDecimal()">              
 			  </div>
            </td>
            <td nowrap > 
              <div align="center"> 
	              <select name="E02PRFIV2" id="E02PRFIV2">
	                <option value=" " <% if (!(lnParam.getE02PRFIV2().equals("Y") ||lnParam.getE02PRFIV2().equals("N"))) out.print("selected"); %>></option>
	                <option value="Y" <% if (lnParam.getE02PRFIV2().equals("Y")) out.print("selected"); %>>Si</option>
	                <option value="N" <% if (lnParam.getE02PRFIV2().equals("N")) out.print("selected"); %>>No</option>        
	              </select>                
              </div>
            </td>
            <td nowrap > 
              <div align="center"> 
 				<input type="text" name="E02PRFAC2" id="E02PRFAC2" value="<%= lnParam.getE02PRFAC2() %>" size="4" maxlength="3" class="context-menu-help" onmousedown="init(currencyHelp,this.name,'','','','','')">              
 			  </div>
            </td>
            <td nowrap> 
              <div align="center"> 
                <input type="text" name="E02PRFGL2" id="E02PRFGL2" size="18" maxlength="17" value="<%= lnParam.getE02PRFGL2()%>" class="context-menu-help" onmousedown="init(ledgerHelp,this.name,'','','','','')">
              </div>
            </td>
            <td nowrap> 
              <div align="center"> 
                <input type="text" name="D02GL2DSC" id="D02GL2DSC" size="35" maxlength="35" value="<%= lnParam.getD02GL2DSC()%>" >
              </div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap > 
              <div align="center"> 
	              <select name="E02PRFFT3" id="E02PRFFT3" onchange="showFixPerField('E02PRFFA3','E02PRFRT3');" >
	                <option value=" " <% if (!(lnParam.getE02PRFFT3().equals("F") ||lnParam.getE02PRFFT3().equals("%"))) out.print("selected"); %>></option>
	                <option value="F" <% if (lnParam.getE02PRFFT3().equals("F")) out.print("selected"); %>>Monto Fijo</option>
	                <option value="%" <% if (lnParam.getE02PRFFT3().equals("%")) out.print("selected"); %>>Porcentaje</option>        
	              </select>                
              </div>
            </td>
            <td nowrap > 
              <div align="left" > 
              	<input type="text" name="E02PRFFA3" id="E02PRFFA3" value="<%= lnParam.getE02PRFFA3() %>" size="15" maxlength="9" onkeypress="enterDecimal()">              
              </div>
              <div align="left" > 
              	<input type="text" name="E02PRFRT3" id="E02PRFRT3" value="<%= lnParam.getE02PRFRT3() %>" size="15" maxlength="10" onkeypress="enterDecimal(6)">              
              </div>
            </td>
            
             <td nowrap > 
              <div align="right"> 
 				<input type="text" name="E02PRFRI3" value="<%= lnParam.getE02PRFRI3() %>" size="16" maxlength="15" onkeypress="enterDecimal()">              
 			  </div>
            </td>

            <td nowrap > 
              <div align="right"> 
 				<input type="text" name="E02PRFRF3" value="<%= lnParam.getE02PRFRF3() %>" size="16" maxlength="15" onkeypress="enterDecimal()">              
 			  </div>
            </td>
            
            
            <td nowrap > 
              <div align="right"> 
 				<input type="text" name="E02PRFFX3" value="<%= lnParam.getE02PRFFX3() %>" size="15" maxlength="13" onkeypress="enterDecimal()">              
 			  </div>
            </td>
            <td nowrap > 
              <div align="right"> 
 				<input type="text" name="E02PRFFM3" value="<%= lnParam.getE02PRFFM3() %>" size="15" maxlength="13" onkeypress="enterInteger(event)">              
 			  </div>
            </td>
            <td nowrap > 
              <div align="center"> 
	              <select name="E02PRFIV3">
	                <option value=" " <% if (!(lnParam.getE02PRFIV3().equals("Y") ||lnParam.getE02PRFIV3().equals("N"))) out.print("selected"); %>></option>
	                <option value="Y" <% if (lnParam.getE02PRFIV3().equals("Y")) out.print("selected"); %>>Si</option>
	                <option value="N" <% if (lnParam.getE02PRFIV3().equals("N")) out.print("selected"); %>>No</option>        
	              </select>                
              </div>
            </td>
            <td nowrap > 
              <div align="center"> 
 				<input type="text" name="E02PRFAC3" value="<%= lnParam.getE02PRFAC3() %>" size="4" maxlength="3" class="context-menu-help" onmousedown="init(currencyHelp,this.name,'','','','','')">              
 			  </div>
            </td>
            <td nowrap> 
              <div align="center"> 
                <input type="text" name="E02PRFGL3" size="18" maxlength="17" value="<%= lnParam.getE02PRFGL3()%>" class="context-menu-help" onmousedown="init(ledgerHelp,this.name,'','','','','')">
              </div>
            </td>
            <td nowrap> 
              <div align="center"> 
                <input type="text" name="D02GL3DSC" size="35" maxlength="35" value="<%= lnParam.getD02GL3DSC()%>" >
              </div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap > 
              <div align="center"> 
	              <select name="E02PRFFT4" id="E02PRFFT4" onchange="showFixPerField('E02PRFFA4','E02PRFRT4');" >
	                <option value=" " <% if (!(lnParam.getE02PRFFT4().equals("F") ||lnParam.getE02PRFFT4().equals("%"))) out.print("selected"); %>></option>
	                <option value="F" <% if (lnParam.getE02PRFFT4().equals("F")) out.print("selected"); %>>Monto Fijo</option>
	                <option value="%" <% if (lnParam.getE02PRFFT4().equals("%")) out.print("selected"); %>>Porcentaje</option>        
	              </select>                
              </div>
            </td>
            <td nowrap > 
              <div align="left" > 
              	<input type="text" name="E02PRFFA4"  id="E02PRFFA4" value="<%= lnParam.getE02PRFFA4() %>" size="15" maxlength="9" onkeypress="enterDecimal()">              
              </div>
              <div align="left" > 
              	<input type="text" name="E02PRFRT4" id="E02PRFRT4" value="<%= lnParam.getE02PRFRT4() %>" size="15" maxlength="10" onkeypress="enterDecimal(6)">              
              </div>
            </td>
            
             <td nowrap > 
              <div align="right"> 
 				<input type="text" name="E02PRFRI4" value="<%= lnParam.getE02PRFRI4() %>" size="16" maxlength="15" onkeypress="enterDecimal()">              
 			  </div>
            </td>

            <td nowrap > 
              <div align="right"> 
 				<input type="text" name="E02PRFRF4" value="<%= lnParam.getE02PRFRF4() %>" size="16" maxlength="15" onkeypress="enterDecimal()">              
 			  </div>
            </td>
            
            
            <td nowrap > 
              <div align="right"> 
 				<input type="text" name="E02PRFFX4" value="<%= lnParam.getE02PRFFX4() %>" size="15" maxlength="13" onkeypress="enterDecimal()">              
 			  </div>
            </td>
            <td nowrap > 
              <div align="right"> 
 				<input type="text" name="E02PRFFM4" value="<%= lnParam.getE02PRFFM4() %>" size="15" maxlength="13" onkeypress="enterInteger(event)">              
 			  </div>
            </td>
            <td nowrap > 
              <div align="center"> 
	              <select name="E02PRFIV4">
	                <option value=" " <% if (!(lnParam.getE02PRFIV4().equals("Y") ||lnParam.getE02PRFIV4().equals("N"))) out.print("selected"); %>></option>
	                <option value="Y" <% if (lnParam.getE02PRFIV4().equals("Y")) out.print("selected"); %>>Si</option>
	                <option value="N" <% if (lnParam.getE02PRFIV4().equals("N")) out.print("selected"); %>>No</option>        
	              </select>                
              </div>
            </td>
            <td nowrap > 
              <div align="center" > 
 				<input type="text" name="E02PRFAC4" value="<%= lnParam.getE02PRFAC4() %>" size="4" maxlength="3" class="context-menu-help" onmousedown="init(currencyHelp,this.name,'','','','','')">              
 			  </div>
            </td>
            <td nowrap> 
              <div align="center"> 
                <input type="text" name="E02PRFGL4" size="18" maxlength="17" value="<%= lnParam.getE02PRFGL4()%>" class="context-menu-help" onmousedown="init(ledgerHelp,this.name,'','','','','')">
              </div>
            </td>
            <td nowrap> 
              <div align="center"> 
                <input type="text" name="D02GL4DSC" size="35" maxlength="35" value="<%= lnParam.getD02GL4DSC()%>" >
              </div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap > 
              <div align="center"> 
	              <select name="E02PRFFT5" id="E02PRFFT5" onchange="showFixPerField('E02PRFFA5','E02PRFRT5');" >
	                <option value=" " <% if (!(lnParam.getE02PRFFT5().equals("F") ||lnParam.getE02PRFFT5().equals("%"))) out.print("selected"); %>></option>
	                <option value="F" <% if (lnParam.getE02PRFFT5().equals("F")) out.print("selected"); %>>Monto Fijo</option>
	                <option value="%" <% if (lnParam.getE02PRFFT5().equals("%")) out.print("selected"); %>>Porcentaje</option>        
	              </select>                
              </div>
            </td>
            <td nowrap > 
              <div align="left" > 
              	<input type="text" name="E02PRFFA5" id="E02PRFFA5" value="<%= lnParam.getE02PRFFA5() %>" size="15" maxlength="9" onkeypress="enterDecimal()">              
              </div>
              <div align="left" > 
              	<input type="text" name="E02PRFRT5" id="E02PRFRT5" value="<%= lnParam.getE02PRFRT5() %>" size="15" maxlength="10" onkeypress="enterDecimal(6)">              
              </div>
            </td>
            
              <td nowrap > 
              <div align="right"> 
 				<input type="text" name="E02PRFRI5" value="<%= lnParam.getE02PRFRI5() %>" size="16" maxlength="15" onkeypress="enterDecimal()">              
 			  </div>
            </td>

            <td nowrap > 
              <div align="right"> 
 				<input type="text" name="E02PRFRF5" value="<%= lnParam.getE02PRFRF5() %>" size="16" maxlength="15" onkeypress="enterDecimal()">              
 			  </div>
            </td>
            
            
            
            <td nowrap > 
              <div align="right"> 
 				<input type="text" name="E02PRFFX5" value="<%= lnParam.getE02PRFFX5() %>" size="15" maxlength="13" onkeypress="enterDecimal()">              
 			  </div>
            </td>
            <td nowrap > 
              <div align="right"> 
 				<input type="text" name="E02PRFFM5" value="<%= lnParam.getE02PRFFM5() %>" size="15" maxlength="13" onkeypress="enterDecimal()">              
 			  </div>
            </td>
            <td nowrap > 
              <div align="center"> 
	              <select name="E02PRFIV5">
	                <option value=" " <% if (!(lnParam.getE02PRFIV5().equals("Y") ||lnParam.getE02PRFIV5().equals("N"))) out.print("selected"); %>></option>
	                <option value="Y" <% if (lnParam.getE02PRFIV5().equals("Y")) out.print("selected"); %>>Si</option>
	                <option value="N" <% if (lnParam.getE02PRFIV5().equals("N")) out.print("selected"); %>>No</option>        
	              </select>                
              </div>
            </td>
            <td nowrap > 
              <div align="center"> 
 				<input type="text" name="E02PRFAC5" value="<%= lnParam.getE02PRFAC5() %>" size="4" maxlength="3" class="context-menu-help" onmousedown="init(currencyHelp,this.name,'','','','','')">              
 			  </div>
            </td>
            <td nowrap> 
              <div align="center"> 
                <input type="text" name="E02PRFGL5" size="18" maxlength="17" value="<%= lnParam.getE02PRFGL5()%>" class="context-menu-help" onmousedown="init(ledgerHelp,this.name,'','','','','')">
              </div>
            </td>
            <td nowrap> 
              <div align="center"> 
                <input type="text" name="D02GL5DSC" size="35" maxlength="35" value="<%= lnParam.getD02GL5DSC()%>" >
              </div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap > 
              <div align="center"> 
	              <select name="E02PRFFT6" id="E02PRFFT6" onchange="showFixPerField('E02PRFFA6','E02PRFRT6');">
	                <option value=" " <% if (!(lnParam.getE02PRFFT6().equals("F") ||lnParam.getE02PRFFT6().equals("%"))) out.print("selected"); %>></option>
	                <option value="F" <% if (lnParam.getE02PRFFT6().equals("F")) out.print("selected"); %>>Monto Fijo</option>
	                <option value="%" <% if (lnParam.getE02PRFFT6().equals("%")) out.print("selected"); %>>Porcentaje</option>        
	              </select>                
              </div>
            </td>
            <td nowrap > 
              <div align="left"  > 
              	<input type="text" name="E02PRFFA6" id="E02PRFFA6" value="<%= lnParam.getE02PRFFA6() %>" size="15" maxlength="9" onkeypress="enterDecimal()">              
              </div>
              <div align="left" > 
              	<input type="text" name="E02PRFRT6" id="E02PRFRT6" value="<%= lnParam.getE02PRFRT6() %>" size="15" maxlength="10" onkeypress="enterDecimal(6)">              
              </div>
            </td>
            
             <td nowrap > 
              <div align="right"> 
 				<input type="text" name="E02PRFRI6" value="<%= lnParam.getE02PRFRI6() %>" size="16" maxlength="15" onkeypress="enterDecimal()">              
 			  </div>
            </td>

            <td nowrap > 
              <div align="right"> 
 				<input type="text" name="E02PRFRF6" value="<%= lnParam.getE02PRFRF6() %>" size="16" maxlength="15" onkeypress="enterDecimal()">              
 			  </div>
            </td>
            
            
            <td nowrap > 
              <div align="right"> 
 				<input type="text" name="E02PRFFX6" value="<%= lnParam.getE02PRFFX6() %>" size="15" maxlength="13" onkeypress="enterDecimal()">              
 			  </div>
            </td>
            <td nowrap > 
              <div align="right"> 
 				<input type="text" name="E02PRFFM6" value="<%= lnParam.getE02PRFFM6() %>" size="15" maxlength="13" onkeypress="enterDecimal()">              
 			  </div>
            </td>
            <td nowrap > 
              <div align="center"> 
	              <select name="E02PRFIV6">
	                <option value=" " <% if (!(lnParam.getE02PRFIV6().equals("Y") ||lnParam.getE02PRFIV6().equals("N"))) out.print("selected"); %>></option>
	                <option value="Y" <% if (lnParam.getE02PRFIV6().equals("Y")) out.print("selected"); %>>Si</option>
	                <option value="N" <% if (lnParam.getE02PRFIV6().equals("N")) out.print("selected"); %>>No</option>        
	              </select>                
              </div>
            </td>
            <td nowrap > 
              <div align="center"> 
 				<input type="text" name="E02PRFAC6" value="<%= lnParam.getE02PRFAC6() %>" size="4" maxlength="3" class="context-menu-help" onmousedown="init(currencyHelp,this.name,'','','','','')">              
 			  </div>
            </td>
            <td nowrap> 
              <div align="center"> 
                <input type="text" name="E02PRFGL6" size="18" maxlength="17" value="<%= lnParam.getE02PRFGL6()%>" class="context-menu-help" onmousedown="init(ledgerHelp,this.name,'','','','','')">
              </div>
            </td>
            <td nowrap> 
              <div align="center"> 
                <input type="text" name="D02GL6DSC" size="35" maxlength="35" value="<%= lnParam.getD02GL6DSC()%>" >
              </div>
            </td>
          </tr>
          
          <tr id="trclear"> 
            <td nowrap > 
              <div align="center"> 
	              <select name="E02PRFFT7" id="E02PRFFT7" onchange="showFixPerField('E02PRFFA7','E02PRFRT7');">
	                <option value=" " <% if (!(lnParam.getE02PRFFT7().equals("F") ||lnParam.getE02PRFFT7().equals("%"))) out.print("selected"); %>></option>
	                <option value="F" <% if (lnParam.getE02PRFFT7().equals("F")) out.print("selected"); %>>Monto Fijo</option>
	                <option value="%" <% if (lnParam.getE02PRFFT7().equals("%")) out.print("selected"); %>>Porcentaje</option>        
	              </select>                
              </div>
            </td>
            <td nowrap > 
              <div align="left" > 
              	<input type="text" name="E02PRFFA7" id="E02PRFFA7" value="<%= lnParam.getE02PRFFA7() %>" size="15" maxlength="9" onkeypress="enterDecimal()">              
              </div>
              <div align="left" > 
              	<input type="text" name="E02PRFRT7" id="E02PRFRT7" value="<%= lnParam.getE02PRFRT7() %>" size="15" maxlength="10" onkeypress="enterDecimal(6)">              
              </div>
            </td>
            
            <td nowrap > 
              <div align="right"> 
 				<input type="text" name="E02PRFRI7" value="<%= lnParam.getE02PRFRI7() %>" size="16" maxlength="15" onkeypress="enterDecimal()">              
 			  </div>
            </td>

            <td nowrap > 
              <div align="right"> 
 				<input type="text" name="E02PRFRF7" value="<%= lnParam.getE02PRFRF7() %>" size="16" maxlength="15" onkeypress="enterDecimal()">              
 			  </div>
            </td>
            
            
            <td nowrap > 
              <div align="right"> 
 				<input type="text" name="E02PRFFX7" value="<%= lnParam.getE02PRFFX7() %>" size="15" maxlength="13" onkeypress="enterDecimal()">              
 			  </div>
            </td>
            <td nowrap > 
              <div align="right"> 
 				<input type="text" name="E02PRFFM7" value="<%= lnParam.getE02PRFFM7() %>" size="15" maxlength="13" onkeypress="enterDecimal()">              
 			  </div>
            </td>
            <td nowrap > 
              <div align="center"> 
	              <select name="E02PRFIV7">
	                <option value=" " <% if (!(lnParam.getE02PRFIV7().equals("Y") ||lnParam.getE02PRFIV7().equals("N"))) out.print("selected"); %>></option>
	                <option value="Y" <% if (lnParam.getE02PRFIV7().equals("Y")) out.print("selected"); %>>Si</option>
	                <option value="N" <% if (lnParam.getE02PRFIV7().equals("N")) out.print("selected"); %>>No</option>        
	              </select>                
              </div>
            </td>
            <td nowrap > 
              <div align="center"> 
 				<input type="text" name="E02PRFAC7" value="<%= lnParam.getE02PRFAC7() %>" size="4" maxlength="3" class="context-menu-help" onmousedown="init(currencyHelp,this.name,'','','','','')">              
 			  </div>
            </td>
            <td nowrap> 
              <div align="center"> 
                <input type="text" name="E02PRFGL7" size="18" maxlength="17" value="<%= lnParam.getE02PRFGL7()%>" class="context-menu-help" onmousedown="init(ledgerHelp,this.name,'','','','','')">
              </div>
            </td>
            <td nowrap> 
              <div align="center"> 
                <input type="text" name="D02GL7DSC" size="35" maxlength="35" value="<%= lnParam.getD02GL7DSC()%>" >
              </div>
            </td>
          </tr>
          

          <tr id="trclear"> 
            <td nowrap > 
              <div align="center"> 
	              <select name="E02PRFFT8" id="E02PRFFT8" onchange="showFixPerField('E02PRFFA8','E02PRFRT8');">
	                <option value=" " <% if (!(lnParam.getE02PRFFT8().equals("F") ||lnParam.getE02PRFFT8().equals("%"))) out.print("selected"); %>></option>
	                <option value="F" <% if (lnParam.getE02PRFFT8().equals("F")) out.print("selected"); %>>Monto Fijo</option>
	                <option value="%" <% if (lnParam.getE02PRFFT8().equals("%")) out.print("selected"); %>>Porcentaje</option>        
	              </select>                
              </div>
            </td>
            <td nowrap > 
              <div align="left" > 
              	<input type="text" name="E02PRFFA8" id="E02PRFFA8" value="<%= lnParam.getE02PRFFA8() %>" size="15" maxlength="9" onkeypress="enterDecimal()">              
              </div>
              <div align="left" > 
              	<input type="text" name="E02PRFRT8" id="E02PRFRT8" value="<%= lnParam.getE02PRFRT8() %>" size="15" maxlength="10" onkeypress="enterDecimal(6)">              
              </div>
            </td>
            
            <td nowrap > 
              <div align="right"> 
 				<input type="text" name="E02PRFRI8" value="<%= lnParam.getE02PRFRI8() %>" size="16" maxlength="15" onkeypress="enterDecimal()">              
 			  </div>
            </td>

            <td nowrap > 
              <div align="right"> 
 				<input type="text" name="E02PRFRF8" value="<%= lnParam.getE02PRFRF8() %>" size="16" maxlength="15" onkeypress="enterDecimal()">              
 			  </div>
            </td>
            
            
            
            
            
            <td nowrap > 
              <div align="right"> 
 				<input type="text" name="E02PRFFX8" value="<%= lnParam.getE02PRFFX8() %>" size="15" maxlength="13" onkeypress="enterDecimal()">              
 			  </div>
            </td>
            <td nowrap > 
              <div align="right"> 
 				<input type="text" name="E02PRFFM8" value="<%= lnParam.getE02PRFFM8() %>" size="15" maxlength="13" onkeypress="enterDecimal()">              
 			  </div>
            </td>
            <td nowrap > 
              <div align="center"> 
	              <select name="E02PRFIV8">
	                <option value=" " <% if (!(lnParam.getE02PRFIV8().equals("Y") ||lnParam.getE02PRFIV8().equals("N"))) out.print("selected"); %>></option>
	                <option value="Y" <% if (lnParam.getE02PRFIV8().equals("Y")) out.print("selected"); %>>Si</option>
	                <option value="N" <% if (lnParam.getE02PRFIV8().equals("N")) out.print("selected"); %>>No</option>        
	              </select>                
              </div>
            </td>
            <td nowrap > 
              <div align="center"> 
 				<input type="text" name="E02PRFAC8" value="<%= lnParam.getE02PRFAC8() %>" size="4" maxlength="3" class="context-menu-help" onmousedown="init(currencyHelp,this.name,'','','','','')">              
 			  </div>
            </td>
            <td nowrap> 
              <div align="center"> 
                <input type="text" name="E02PRFGL8" size="18" maxlength="17" value="<%= lnParam.getE02PRFGL8()%>" class="context-menu-help" onmousedown="init(ledgerHelp,this.name,'','','','','')">
              </div>
            </td>
            <td nowrap> 
              <div align="center"> 
                <input type="text" name="D02GL8DSC" size="35" maxlength="35" value="<%= lnParam.getD02GL8DSC()%>" >
              </div>
            </td>
          </tr>


          <tr id="trclear"> 
            <td nowrap > 
              <div align="center"> 
	              <select name="E02PRFFT9" id="E02PRFFT9" onchange="showFixPerField('E02PRFFA9','E02PRFRT9');">
	                <option value=" " <% if (!(lnParam.getE02PRFFT9().equals("F") ||lnParam.getE02PRFFT9().equals("%"))) out.print("selected"); %>></option>
	                <option value="F" <% if (lnParam.getE02PRFFT9().equals("F")) out.print("selected"); %>>Monto Fijo</option>
	                <option value="%" <% if (lnParam.getE02PRFFT9().equals("%")) out.print("selected"); %>>Porcentaje</option>        
	              </select>                
              </div>
            </td>
            <td nowrap > 
              <div align="left" > 
              	<input type="text" name="E02PRFFA9" id="E02PRFFA9" value="<%= lnParam.getE02PRFFA9() %>" size="15" maxlength="9" onkeypress="enterDecimal()">              
              </div>
              <div align="left" > 
              	<input type="text" name="E02PRFRT9" id="E02PRFRT9" value="<%= lnParam.getE02PRFRT9() %>" size="15" maxlength="10" onkeypress="enterDecimal(6)">              
              </div>
            </td>
            
            <td nowrap > 
              <div align="right"> 
 				<input type="text" name="E02PRFRI9" value="<%= lnParam.getE02PRFRI9() %>" size="16" maxlength="15" onkeypress="enterDecimal()">              
 			  </div>
            </td>

            <td nowrap > 
              <div align="right"> 
 				<input type="text" name="E02PRFRF9" value="<%= lnParam.getE02PRFRF9() %>" size="16" maxlength="15" onkeypress="enterDecimal()">              
 			  </div>
            </td>
            
            <td nowrap > 
              <div align="right"> 
 				<input type="text" name="E02PRFFX9" value="<%= lnParam.getE02PRFFX9() %>" size="15" maxlength="13" onkeypress="enterDecimal()">              
 			  </div>
            </td>
            <td nowrap > 
              <div align="right"> 
 				<input type="text" name="E02PRFFM9" value="<%= lnParam.getE02PRFFM9() %>" size="15" maxlength="13" onkeypress="enterDecimal()">              
 			  </div>
            </td>
            <td nowrap > 
              <div align="center"> 
	              <select name="E02PRFIV9">
	                <option value=" " <% if (!(lnParam.getE02PRFIV9().equals("Y") ||lnParam.getE02PRFIV9().equals("N"))) out.print("selected"); %>></option>
	                <option value="Y" <% if (lnParam.getE02PRFIV9().equals("Y")) out.print("selected"); %>>Si</option>
	                <option value="N" <% if (lnParam.getE02PRFIV9().equals("N")) out.print("selected"); %>>No</option>        
	              </select>                
              </div>
            </td>
            <td nowrap > 
              <div align="center"> 
 				<input type="text" name="E02PRFAC9" value="<%= lnParam.getE02PRFAC9() %>" size="4" maxlength="3" class="context-menu-help" onmousedown="init(currencyHelp,this.name,'','','','','')">              
 			  </div>
            </td>
            <td nowrap> 
              <div align="center"> 
                <input type="text" name="E02PRFGL9" size="18" maxlength="17" value="<%= lnParam.getE02PRFGL9()%>" class="context-menu-help" onmousedown="init(ledgerHelp,this.name,'','','','','')">
              </div>
            </td>
            <td nowrap> 
              <div align="center"> 
                <input type="text" name="D02GL9DSC" size="35" maxlength="35" value="<%= lnParam.getD02GL9DSC()%>" >
              </div>
            </td>
          </tr>

          
          <tr id="trclear"> 
            <td nowrap > 
              <div align="center"> 
	              <select name="E02PRFFT0" id="E02PRFFT0" onchange="showFixPerField('E02PRFFA0','E02PRFRT0');">
	                <option value=" " <% if (!(lnParam.getE02PRFFT0().equals("F") ||lnParam.getE02PRFFT0().equals("%"))) out.print("selected"); %>></option>
	                <option value="F" <% if (lnParam.getE02PRFFT0().equals("F")) out.print("selected"); %>>Monto Fijo</option>
	                <option value="%" <% if (lnParam.getE02PRFFT0().equals("%")) out.print("selected"); %>>Porcentaje</option>        
	              </select>                
              </div>
            </td>
            <td nowrap > 
              <div align="left" > 
              	<input type="text" name="E02PRFFA0" id="E02PRFFA0" value="<%= lnParam.getE02PRFFA0() %>" size="15" maxlength="9" onkeypress="enterDecimal()">              
              </div>
              <div align="left" > 
              	<input type="text" name="E02PRFRT0" id="E02PRFRT0" value="<%= lnParam.getE02PRFRT0() %>" size="15" maxlength="10" onkeypress="enterDecimal(6)">              
              </div>
            </td>
            
             <td nowrap > 
              <div align="right"> 
 				<input type="text" name="E02PRFRI0" value="<%= lnParam.getE02PRFRI0() %>" size="16" maxlength="15" onkeypress="enterDecimal()">              
 			  </div>
            </td>

            <td nowrap > 
              <div align="right"> 
 				<input type="text" name="E02PRFRF0" value="<%= lnParam.getE02PRFRF0() %>" size="16" maxlength="15" onkeypress="enterDecimal()">              
 			  </div>
            </td>
            
            
            <td nowrap > 
              <div align="right"> 
 				<input type="text" name="E02PRFFX0" value="<%= lnParam.getE02PRFFX0() %>" size="15" maxlength="13" onkeypress="enterDecimal()">              
 			  </div>
            </td>
            <td nowrap > 
              <div align="right"> 
 				<input type="text" name="E02PRFFM0" value="<%= lnParam.getE02PRFFM0() %>" size="15" maxlength="13" onkeypress="enterDecimal()">              
 			  </div>
            </td>
            <td nowrap > 
              <div align="center"> 
	              <select name="E02PRFIV0">
	                <option value=" " <% if (!(lnParam.getE02PRFIV0().equals("Y") ||lnParam.getE02PRFIV0().equals("N"))) out.print("selected"); %>></option>
	                <option value="Y" <% if (lnParam.getE02PRFIV0().equals("Y")) out.print("selected"); %>>Si</option>
	                <option value="N" <% if (lnParam.getE02PRFIV0().equals("N")) out.print("selected"); %>>No</option>        
	              </select>                
              </div>
            </td>
            <td nowrap > 
              <div align="center"> 
 				<input type="text" name="E02PRFAC0" value="<%= lnParam.getE02PRFAC0() %>" size="4" maxlength="3" class="context-menu-help" onmousedown="init(currencyHelp,this.name,'','','','','')">              
 			  </div>
            </td>
            <td nowrap> 
              <div align="center"> 
                <input type="text" name="E02PRFGL0" size="18" maxlength="17" value="<%= lnParam.getE02PRFGL0()%>" class="context-menu-help" onmousedown="init(ledgerHelp,this.name,'','','','','')">
              </div>
            </td>
            <td nowrap> 
              <div align="center"> 
                <input type="text" name="D02GL0DSC" size="35" maxlength="35" value="<%= lnParam.getD02GL0DSC()%>" >
              </div>
            </td>
          </tr>
          
          
         <tr id="trclear"> 
            <td nowrap colspan="7"> Cargo Fijo (7 enteros y 2 decimales), Porcentaje (3 enteros y 6 decimales) 
            </td>
          </tr>
     </table>
    </td>
    </tr>
  </table>
  <p align="center"> 
        <input id="EIBSBTN" type=submit name="Submit" value="Ingresar">
        <input id="EIBSBTN" type=button name="Regresar" value="Regresar" onclick="goBack(document.forms[0])">
  </p>
 
  </form>
</body>

<script type="text/javascript">
  if (document.getElementById("E02PRFFT1").value == '%'){
    document.getElementById("E02PRFFA1").style.display="none";
    document.getElementById("E02PRFRT1").style.display="";
  }else{
    document.getElementById("E02PRFFA1").style.display="";
    document.getElementById("E02PRFRT1").style.display="none";
  }
  
  if (document.getElementById("E02PRFFT2").value== '%'){
    document.getElementById("E02PRFFA2").style.display="none";
    document.getElementById("E02PRFRT2").style.display="";
  }else{
    document.getElementById("E02PRFFA2").style.display="";
    document.getElementById("E02PRFRT2").style.display="none";
  }
  
  if (document.getElementById("E02PRFFT3").value== '%'){
    document.getElementById("E02PRFFA3").style.display="none";
    document.getElementById("E02PRFRT3").style.display="";
  }else{
    document.getElementById("E02PRFFA3").style.display="";
    document.getElementById("E02PRFRT3").style.display="none";
  }
  
  if (document.getElementById("E02PRFFT4").value=='%'){
    document.getElementById("E02PRFFA4").style.display="none";
    document.getElementById("E02PRFRT4").style.display="";
  }else{
    document.getElementById("E02PRFFA4").style.display="";
    document.getElementById("E02PRFRT4").style.display="none";
  }
  
  if (document.getElementById("E02PRFFT5").value== '%'){
    document.getElementById("E02PRFFA5").style.display="none";
    document.getElementById("E02PRFRT5").style.display="";
  }else{
    document.getElementById("E02PRFFA5").style.display="";
    document.getElementById("E02PRFRT5").style.display="none";
  }
  
  if (document.getElementById("E02PRFFT6").value== '%'){
    document.getElementById("E02PRFFA6").style.display="none";
    document.getElementById("E02PRFRT6").style.display="";
  }else{
    document.getElementById("E02PRFFA6").style.display="";
    document.getElementById("E02PRFRT6").style.display="none";
  }
  
  if (document.getElementById("E02PRFFT7").value=='%'){
    document.getElementById("E02PRFFA7").style.display="none";
    document.getElementById("E02PRFRT7").style.display="";
  }else{
    document.getElementById("E02PRFFA7").style.display="";
    document.getElementById("E02PRFRT7").style.display="none";
  }


  if (document.getElementById("E02PRFFT8").value=='%'){
    document.getElementById("E02PRFFA8").style.display="none";
    document.getElementById("E02PRFRT8").style.display="";
  }else{
    document.getElementById("E02PRFFA8").style.display="";
    document.getElementById("E02PRFRT8").style.display="none";
  }

  if (document.getElementById("E02PRFFT9").value=='%'){
    document.getElementById("E02PRFFA9").style.display="none";
    document.getElementById("E02PRFRT9").style.display="";
  }else{
    document.getElementById("E02PRFFA9").style.display="";
    document.getElementById("E02PRFRT9").style.display="none";
  }
  
   if (document.getElementById("E02PRFFT0").value=='%'){
    document.getElementById("E02PRFFA0").style.display="none";
    document.getElementById("E02PRFRT0").style.display="";
  }else{
    document.getElementById("E02PRFFA0").style.display="";
    document.getElementById("E02PRFRT0").style.display="none";
  }
  
  
   
</script>


</html>
