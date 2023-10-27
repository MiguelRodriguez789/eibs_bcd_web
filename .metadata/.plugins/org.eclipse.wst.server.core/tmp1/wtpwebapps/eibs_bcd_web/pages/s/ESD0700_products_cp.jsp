<html>
<head>
<title>Consulta de Productos Cuentas Cuotas de Participaci&oacute;n</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<SCRIPT SRC="<%=request.getContextPath()%>/pages/s/javascripts/dynlayer.js"> </SCRIPT>
<SCRIPT SRC="<%=request.getContextPath()%>/pages/s/javascripts/pop_out.js"> </SCRIPT>
<SCRIPT SRC="<%=request.getContextPath()%>/pages/s/javascripts/nav_aid.js"> </SCRIPT>

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>

</head>

<jsp:useBean id="prd" class="datapro.eibs.beans.ESD070001Message"  scope="session" />

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />

<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>

<body>
<P><BR>
</P>
<% 
 if ( !error.getERRNUM().equals("0")  ) {
     error.setERRNUM("0");
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     error.setERRNUM("0");
     out.println("</SCRIPT>");
     }
%>

<h3 align="center">Producto Cuotas de Participaci&oacute;n<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="products_cp.jsp, ESD0700"></h3>
<hr size="4">

<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSESD0700" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="1">
  <INPUT TYPE=HIDDEN NAME="E01APCACD" VALUE="<%= prd.getE01APCACD()%>">
  <table class="tableinfo">
    <tr > 
      <td> 
        <table cellspacing="0" cellpadding="2" width="100%"  class="tbhead"  align="center">
          <tr> 
            <td nowrap width="10%" align="right"> Banco: </td>
            <td nowrap width="12%" align="left"> 
              <input type="text"  name="E01APCBNK" size="3" maxlength="2" value="<%= prd.getE01APCBNK()%>" readonly>
            </td>
            <td nowrap width="6%" align="right">Producto: </td>
            <td nowrap width="14%" align="left"> 
              <input type="text"  name="E01APCCDE" size="6" maxlength="4" value="<%= prd.getE01APCCDE()%>" readonly>
            </td>
            <td nowrap width="8%" align="right"> Tipo de Producto : </td>
            <td nowrap width="50%"align="left"> 
              <input type="text"  name="E01APCTYP" size="6" maxlength="4" value="<%= prd.getE01APCTYP()%>" readonly>
              - 
              <input type="text"  name="E01DSCTYP" size="45" maxlength="45" value="<%= prd.getE01DSCTYP()%>" readonly>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <h4>Informaci&oacute;n General</h4>

  <table class="tableinfo">
    <tr > 
      <td > 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="trdark"> 
            <td > 
              <div align="right">Descripci&oacute;n :</div>
            </td>
            <td > 
              <input type="text"  name="E01APCDS1" size="50" maxlength="45" value="<%= prd.getE01APCDS1()%>">
            </td>
            <td > 
              <div align="right">Nombre de Mercadeo :</div>
            </td>
            <td > 
              <input type="text"  name="E01APCDS2" size="28" maxlength="25" value="<%= prd.getE01APCDS2()%>">
            </td>
			</tr>
          <tr id="trclear"> 
            <td > 
              <div align="right">C&oacute;digo de Moneda :</div>
            </td>
            <td > 
              <input type="text"  name="E01APCCCY" size="3" maxlength="3" value="<%= prd.getE01APCCCY()%>">
              <a href="javascript:GetCurrency('E01APCCCY','')"><img src="<%=request.getContextPath()%>/images/1b.gif" title=". . ." align="bottom" border="0" ></a> 
            </td>
          <td > 
            <div align="right">Ofrecimiento por :</div>
            </td>
            <td ><SELECT name="E01APCFTT">
					<OPTION value="1"
						<%if (prd.getE01APCFTT().equals("1")) { out.print("selected"); }%>>Internet</OPTION>
					<OPTION value="I"
						<%if (prd.getE01APCFTT().equals("I")) { out.print("selected"); }%>>Internacional</OPTION>
					<OPTION value="L"
						<%if (prd.getE01APCFTT().equals("L")) { out.print("selected"); }%>>Local</OPTION>
					<OPTION value="3"
						<%if (prd.getE01APCFTT().equals("3")) { out.print("selected"); }%>>Plataforma</OPTION>
					<OPTION value="5"
						<%if (prd.getE01APCFTT().equals("5")) { out.print("selected"); }%>>Cualquier
					Medio</OPTION>
					<OPTION value="N"
						<%if (prd.getE01APCFTT().equals("N")) { out.print("selected"); }%>>No
					Ofrecer</OPTION>
				</SELECT>
            </td>

			</tr>
          <tr id="trdark"> 
            <td > 
              <div align="right"> Cuenta Contable :</div>
            </td>
            <td > 
              <input type="text"  name="E01APCGLN" size="18" maxlength="16" value="<%= prd.getE01APCGLN().trim()%>">
              <a href="javascript:GetLedger('E01APCGLN',document.forms[0].E01APCBNK.value,document.forms[0].E01APCCCY.value,document.forms[0].E01APCACD.value,'','<%= prd.getE01APCTYP().trim()%>')">
				<img src="<%=request.getContextPath()%>/images/1b.gif" title=". . ." align="bottom" border="0" ></a> 
            </td>
            <td > 
              <div align="right">Retenci&oacute;n de Impuestos :</div>
            </td>
            <td > 
              <input type="text"  name="E01APCTAX" size="3" maxlength="2" value="<%= prd.getE01APCTAX()%>">
              <a href="javascript:GetCode('E01APCTAX','STATIC_ln_prod_tax_ret.jsp')"><img src="<%=request.getContextPath()%>/images/1b.gif" title=". . ." align="bottom" border="0"></a> 
            </td>
           </tr>
           <tr id="trclear"> 
            <td > 
              <div align="right">Tabla de Documentos :</div>
            </td>
            <td > 
              	<input type="text"  name="E01APCDOC" size="4" maxlength="2" value="<%= prd.getE01APCDOC().trim()%>">
            	<a href="javascript:GetDocInv('E01APCDOC')"><img src="<%=request.getContextPath()%>/images/1b.gif" title=". . ." align="bottom" border="0"></a> 
            </td>
            <td > 
              <div align="right">Tipo de Residencia :</div>
            </td>
            <td > 
              <select name="E01APCRES">
                <option value="" <%if (prd.getE01APCRES().equals(""))   { out.print("selected"); }%>>Cualquiera</option>
                <option value="1" <%if (prd.getE01APCRES().equals("1")) { out.print("selected"); }%>>Residentes</option>
                <option value="2" <%if (prd.getE01APCRES().equals("2")) { out.print("selected"); }%>>Extranjeros</option>
              </select>
            </td>
          </tr>
          <tr id="trdark">
            <td > 
           		<div align="right">C&oacute;digos Tabla de Cargos :</div>
            </td>
            <td > 
             	<input type="text"  name="E01APCTAR" size="3" maxlength="2" value="<%= prd.getE01APCTAR()%>">
            	<a href="javascript:GetRetCod('E01APCTAR','<%= prd.getE01APCTYP()%>')"><img src="<%=request.getContextPath()%>/images/1b.gif" title=". . ." align="bottom" border="0" ></a>  
            </td>
            <td> 
              <div align="right">Producto Familia :</div>
            </td>
            <td>   
              	<input type="text"  name="E01APCUC1" size="4" maxlength="4" value="<%= prd.getE01APCUC1().trim()%>">
            </td>  
          </tr>
          <tr id="trclear">
            <td>
            	<div align="right">Frecuencia Pagos Reajuste:</div>
            </td>
            <td>
              <select name="E01APCFRN">
             	  <option value="N" <%if (prd.getE01APCFRN().equals("N")) { out.print("selected"); }%>>No Aplica</option>
              	  <option value="M" <%if (prd.getE01APCFRN().equals("M")) { out.print("selected"); }%>>Mensual</option>
              	  <option value="Q" <%if (prd.getE01APCFRN().equals("Q")) { out.print("selected"); }%>>Trimestral</option>
              	  <option value="S" <%if (prd.getE01APCFRN().equals("S")) { out.print("selected"); }%>>Semestral</option>
              	  <option value="Y" <%if (prd.getE01APCFRN().equals("Y")) { out.print("selected"); }%>>Anual</option>
              </select>
            </td> 
            <td>
            	<div align="right">Frecuencia Pago de Intereses :</div>
            </td>
            <td>
              <select name="E01APCFL4">
              	  <option value="M" <%if (prd.getE01APCFL4().equals("M")) { out.print("selected"); }%>>Mensual</option>
              	  <option value="D" <%if (prd.getE01APCFL4().equals("D")) { out.print("selected"); }%>>Diario</option>
              	  <option value="Q" <%if (prd.getE01APCFL4().equals("Q")) { out.print("selected"); }%>>Trimestral</option>
              	  <option value="S" <%if (prd.getE01APCFL4().equals("S")) { out.print("selected"); }%>>Semestral</option>
             	  <option value="Y" <%if (prd.getE01APCFL4().equals("Y")) { out.print("selected"); }%>>Anual</option>
              </select>
            </td> 
          </tr>
          <tr id="trdark">
          <td> 
              <div align="right">Tipo de Cliente :</div>
            </td>
            <td > 
              <select name="E01APCFRA">
                <option value=" " <%if (prd.getE01APCFRA().equals(" ")) { out.print("selected"); }%>>Cualquiera</option>
                <option value="0" <%if (prd.getE01APCFRA().equals("0")) { out.print("selected"); }%>>Socio</option>
                <option value="1" <%if (prd.getE01APCFRA().equals("1")) { out.print("selected"); }%>>Empresa</option>
                <option value="2" <%if (prd.getE01APCFRA().equals("2")) { out.print("selected"); }%>>Persona</option>
                <option value="3" <%if (prd.getE01APCFRA().equals("3")) { out.print("selected"); }%>>Menor de Edad</option>
              </select>
            </td>
            <td>
              <div align="right">Producto al Fallecer :</div>
            </td>
            <td>
	            <input type="text"  name="E01APCUC3" size="4" maxlength="4" value="<%= prd.getE01APCUC3().trim()%>">
	            <a href="javascript:GetProduct('E01APCUC3','<%= prd.getE01APCACD()%>',document.forms[0].E01APCBNK.value,' ','<%= prd.getE01APCTYP().trim()%>')">
	            <img src="<%=request.getContextPath()%>/images/1b.gif" title="help" align="middle" border="0" ></a>
             </td>
          </tr>

          <tr id="trclear"> 
            <td > 
              <div align="right">Cuotas Minimas :</div>
            </td>
            <td > 
              <input type="text" name="E01APAFC1" size="6" maxlength="5" value="<%= prd.getE01APAFC1()%>"> 
            </td>
            <td> 
              <div align="right">Cuotas Maximas :</div>
            </td>
            <td > 
              <input type="text" name="E01APAFC2" size="6" maxlength="5" value="<%= prd.getE01APAFC2()%>"> 
            </td>     
 			</tr>
 			<tr id="trdark">
             <td > 
              <div align="right">Moneda de la Cuota :</div>
            </td>
            <td > 
              <input type="text"  name="E01APACY1" size="3" maxlength="3" value="<%= prd.getE01APACY1()%>">
              <a href="javascript:GetCurrency('E01APACY1','')"><img src="<%=request.getContextPath()%>/images/1b.gif" title=". . ." align="bottom" border="0" ></a> 
            </td>
            <td> 
              <div align="right">Periodo Acepta Pago Anticipado :</div>
            </td>
            <td > 
              <input type="text" name="E01APADY3" size="3" maxlength="3" value="<%= prd.getE01APADY3() %>"> (Meses)
            </td>     
 			</tr>
  			<tr id="trclear">
             <td > 
              <div align="right">Maximo Giros al Mes :</div>
            </td>
            <td > 
              <input type="text" name="E01APADY1" size="3" maxlength="2" value="<%= prd.getE01APADY1()%>">  
            </td>
            <td> 
              <div align="right">Antig. Minima Cambio Acuerdo :</div>
            </td>
            <td > 
              <input type="text" name="E01APADY2" size="3" maxlength="2" value="<%= prd.getE01APADY2()%>"> (Meses)
            </td>     
 			</tr>
 			<tr id="trdark">
             <td width="25%" align="right">Permite Clientes Simplificados : </td>
			 <td width="25%" >
					<input type="radio" name="E01APCTX9" value="Y" <%if (prd.getE01APCTX9().equals("Y")) out.print("checked"); %>> Si 
					<input type="radio" name="E01APCTX9" value="N" <%if (prd.getE01APCTX9().equals("N")) out.print("checked"); %>> No
			 </td>
             <td align="right">Producto Alternativo : </td>
             <td>   
	            <input type="text"  name="E01APCUC2" size="5" maxlength="4" value="<%= prd.getE01APCUC2().trim()%>">
	            <a href="javascript:GetProduct('E01APCUC2','<%= prd.getE01APCACD()%>',document.forms[0].E01APCBNK.value,' ','<%= prd.getE01APCTYP().trim()%>')">
	            <img src="<%=request.getContextPath()%>/images/1b.gif" title="help" align="middle" border="0" ></a>
            </td>       
 			</tr>	
        </table>
       </td>
    </tr>
  </table>
  
 
  <h4>Condiciones para Retiros Parciales</h4>
  <table class="tableinfo">
    <tr > 
      <td>
		<table cellspacing="0" cellpadding="2" width="100%" border="0">
			<tr id="trdark">
				<td>
				<div align="center">Numero de Retiro</div>
				</td>
				<td>
				<div align="center">Saldo Capital Minimo al Retiro</div>
				</td>
				<td>
				<div align="center">Antiguedad Minima</div>
				</td>
				<td>
				<div align="center">Porcentaje</div>
				</td>
				<td>
				<div align="center">Saldo Capital Residual</div>
				</td>
			</tr>
			<tr id="trclear">
				<td>
				<div align="center">Primero</div>
				</td>
				<td align="center"><input type="text" name="E01APAAC1" size="5"
					maxlength="6" value="<%= prd.getE01APAAC1() %>"></td>
				<td align="center"><input type="text" name="E01APAFC3" size="3"
					maxlength="4" value="<%= prd.getE01APAFC3() %>"> (Meses)</td>
				<td align="center"><input type="text" name="E01APAFC7" size="3"
					maxlength="4" value="<%= prd.getE01APAFC7() %>">%</td>
				<td align="center"><input type="text" name="E01APAAC2" size="5"
					maxlength="6" value="<%= prd.getE01APAAC2() %>"></td>
			</tr>
			<tr id="trdark">
				<td align="center"></td>
				<td align="center"></td>
				<td align="center"><input type="text" name="E01APAFC4" size="3"
					maxlength="4" value="<%= prd.getE01APAFC4() %>"> (Meses)</td>
				<td align="center"><input type="text" name="E01APAFC8" size="3"
					maxlength="4" value="<%= prd.getE01APAFC8() %>">%</td>
				<td align="center"></td>
			</tr>
			<tr id="trclear">
				<td align="center"></td>
				<td align="center"></td>
				<td align="center""><input type="text" name="E01APAFC5" size="3"
					maxlength="4" value="<%= prd.getE01APAFC5() %>"> (Meses)</td>
				<td align="center"><input type="text" name="E01APAFC9" size="3"
					maxlength="4" value="<%= prd.getE01APAFC9() %>">%</td>
				<td align="center"></td>
			</tr>
			<tr id="trdark">
				<td>
				<div align="center">Siguientes..</div>
				</td>
				<td align="center"><input type="text" name="E01APAAC3" size="5"
					maxlength="6" value="<%= prd.getE01APAAC3() %>"></td>
				<td align="center"><input type="text" name="E01APAFC6" size="3"
					maxlength="4" value="<%= prd.getE01APAFC6() %>"> (Meses)</td>
				<td align="center"><input type="text" name="E01APAFC0" size="3"
					maxlength="4" value="<%= prd.getE01APAFC0() %>">%</td>
				<td align="center"><input type="text" name="E01APAAC4" size="5"
					maxlength="6" value="<%= prd.getE01APAAC4() %>"></td>
			</tr>
		</table>
		</td>
    </tr>
  </table>



  <div align="center"> 
    <input id="EIBSBTN" type=button name="Submit" OnClick="submit()" value="Enviar">
  </div>
</form>
</body>
</html>
