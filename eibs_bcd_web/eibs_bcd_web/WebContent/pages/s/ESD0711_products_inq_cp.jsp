<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<title>Consulta de Producto Cuotas de Participaci&oacute;n</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id="cpProdInq" class="datapro.eibs.beans.ESD071106Message"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>

<SCRIPT type="text/javascript">
<%
if (userPO.getPurpose().equals("INQUIRY")){
%>
  builtNewMenu(cpar_i_opt);
<%   
}
%>
</SCRIPT>

</head>

<body>
<%@ page import = "datapro.eibs.master.Util" %>

<% 
 if ( !error.getERRNUM().equals("0")  ) {
     error.setERRNUM("0"); 
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     error.setERRNUM("0");
     out.println("</SCRIPT>");
  }
  if (userPO.getPurpose().equals("INQUIRY")){ 
   	out.println("<SCRIPT> initMenu(); </SCRIPT>");
  }
%>

<h3 align="center">Consulta de Producto Cuotas de Participaci&oacute;n<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="products_inq_cp.jsp, ESD0711"></h3>
<hr size="4">

<form>
  <p></p>
  <table class="tableinfo">
    <tr > 
      <td > 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="trdark"> 
            <td width="37%"> 
              <div align="right">N&uacute;mero de Banco: </div>
            </td>
            <td width="63%"> 
              <input type="text" readonly name="E06APCBNK" size="4" maxlength="2" value="<%= cpProdInq.getE06APCBNK().trim()%>">
            </td>
          </tr>
          <tr id="trclear"> 
            <td width="37%"> 
              <div align="right">Tipo de Producto: </div>
            </td>
            <td width="63%"> 
              <input type="text" readonly name="E06APCTYP" size="6" maxlength="4" value="<%= cpProdInq.getE06APCTYP().trim()%>">
              <input type="text" readonly name="E06TYPDSC" size="45" maxlength="45" value="<%= cpProdInq.getE06TYPDES().trim()%>">
            </td>
          </tr>
          <tr id="trdark"> 
            <td width="37%"> 
              <div align="right">C&oacute;digo de Producto: </div>
            </td>
            <td width="63%"> 
              <input type="text" readonly name="E06APCCDE" size="6" maxlength="4" value="<%= cpProdInq.getE06APCCDE().trim()%>">
            </td>
          </tr>
          <tr id="trclear"> 
            <td width="37%"> 
              <div align="right">Descripci&oacute;n: </div>
            </td>
            <td width="63%"> 
              <input type="text" readonly name="E06DESCRI" size="50" maxlength="45" value="<%= cpProdInq.getE06DESCRI().trim()%>">
            </td>
          </tr>
          <tr id="trdark"> 
            <td width="37%"> 
              <div align="right">Nombre de Mercadeo: </div>
            </td>
            <td width="63%"> 
              <input type="text" readonly name="E06MERCAD" size="28" maxlength="25" value="<%= cpProdInq.getE06MERCAD().trim()%>">
            </td>
          </tr>
          <tr id="trclear"> 
            <td width="37%"> 
              <div align="right">Moneda: </div>
            </td>
            <td width="63%"> 
              <input type="text" readonly name="E06APCCCY" size="5" maxlength="3" value="<%= cpProdInq.getE06APCCCY().trim()%>">
              <input type="text" readonly name="E06CCYDSC" size="37" maxlength="35" value="<%= cpProdInq.getE06CCYDSC().trim()%>">
            </td>
          </tr>
          <tr id="trdark"> 
            <td width="37%"> 
              <div align="right">Cuenta Contable: </div>
            </td>
            <td width="63%"> 
              <input type="text" readonly name="E06APCGLN" size="18" maxlength="16" value="<%= cpProdInq.getE06APCGLN().trim()%>">
            </td>
          </tr>
          <tr id="trclear"> 
            <td width="37%"> 
              <div align="right">Descripci&oacute;n de Cuenta Contable: </div>
            </td>
            <td width="63%"> 
              <input type="text" readonly name="E06GLMDSC" size="45" maxlength="45" value="<%= cpProdInq.getE06GLMDSC().trim()%>">
            </td>
          </tr>
          <tr id="trdark"> 
            <td width="37%"> 
              <div align="right">Calificaci&oacute;n de Cuentas: </div>
            </td>
            <td width="63%"> 
              <input type="text" readonly name="E06APCTAR" size="4" maxlength="2" value="<%= cpProdInq.getE06APCTAR().trim()%>">
              <input type="text" readonly name="E06TARDSC" size="45" maxlength="45" value="<%= cpProdInq.getE06TARDSC().trim()%>">
			  <a href="javascript:showDDAServCharge('<%= cpProdInq.getE06APCBNK().trim()%>','<%= cpProdInq.getE06APCTYP().trim()%>','<%= cpProdInq.getE06APCTAR().trim()%>');"></a> 
            </td>
          </tr>
          <tr id="trclear"> 
            <td width="37%"> 
				<div align="right">Retenci&oacute;n Impuestos :</div>
          	</td>
          	<td>
          	<input type="text"  name="E06APCTAX" size="2" maxlength="1" value="<%= cpProdInq.getE06APCTAX() %>" readonly>
            </td>
          </tr>
          <tr id="trdark"> 
            <td width="37%"> 
              <div align="right">Tipo de Cliente: </div>
            </td>
            <td width="63%"> 
           <input type="text"  name="E06APCFRA" size="2" maxlength="1" value="<%= cpProdInq.getE06APCFRA() %>" readonly>
            </td>
          </tr>
          <tr id="trclear"> 
            <td width="37%"> 
              <div align="right">Tipo de Residencia: </div>
            </td>
            <td width="63%"> 
              <input type="text" readonly name="E06APCRES" size="2" maxlength="1" value="<%= cpProdInq.getE06APCRES().trim()%>">
            </td>
          </tr>
          <tr id="trdark"> 
            <td width="37%"> 
              <div align="right">Tabla de Documentos: </div>
            </td>
            <td width="63%"> 
              <input type="text" readonly name="E06APCDOC" size="3" maxlength="2" value="<%= cpProdInq.getE06APCDOC().trim()%>">
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
   
  <h4>Informaci&oacute;n Suscripci&oacute;n Cuotas</h4>
  
  <table class="tableinfo">
          <tr id="trclear">
          	<td>
				<div align="right">Producto Familia </div>
          	</td>
          	<td>
          		<input type="text"  name="E06APCUC1" size="5" maxlength="4" value="<%= cpProdInq.getE06APCUC1() %>" readonly>
          	</td>
          	<td>
          		<div align="right">Producto al Fallecer :</div>
          	</td>
          	<td>
          		<input type="text"  name="E06APCUC3" size="5" maxlength="4" value="<%= cpProdInq.getE06APCUC3() %>" readonly>
          	</td>
          </tr>             
          <tr id="trdark">
          	<td>
          		<div align="right">Frecuencia Pago Interes :</div>
          	</td>
          	<td>
          		<input type="text"  name="E06APCFL4" size="2" maxlength="1" value="<%= cpProdInq.getE06APCFL4() %>" readonly>
          	</td>
          	<td>
          		<div align="right">Frecuecia Pago Reajuste :</div>
          	</td>
          	<td>
          		<input type="text"  name="E06APCFRN" size="2" maxlength="1" value="<%= cpProdInq.getE06APCFRN() %>" readonly>
          	</td>
          </tr>
          <tr id="trclear">
          	<td>
          		<div align="right">Cuotas Minimas :</div>
          	</td>
          	<td>
          		<input type="text" align="right" name="E06APAFC1" size="6" maxlength="5" value="<%= cpProdInq.getE06APAFC1() %>" readonly>
          	</td>
          	<td>
          		<div align="right">Cuotas Maximas :</div>
          	</td>
          	<td>
          		<input type="text" align="right" name="E06APAFC2" size="6" maxlength="5" value="<%= cpProdInq.getE06APAFC2() %>" readonly>
          	</td>
          </tr>
          <tr id="trdark">
          	<td>
          		<div align="right">Moneda de la Cuota :</div>
          	</td>
          	<td>
          		<input type="text"  name="E06APACY1" size="3" maxlength="3" value="<%= cpProdInq.getE06APACY1() %>" readonly>
          	</td>
          	<td>
          		<div align="right">Periodo Acepta Pago Anticipado :</div>
          	</td>
          	<td>
          		<input type="text" align="right" name="E06APADY3" size="3" maxlength="3" value="<%= cpProdInq.getE06APADY3() %>" readonly> (Meses)
          	</td>
          </tr>
          <tr id="trclear">
          	<td>
          		<div align="right">Maximo Giros al mes :</div>
          	</td>
          	<td>
          		<input type="text" align="right" name="E06APADY1" size="2" maxlength="2" value="<%= cpProdInq.getE06APADY1() %>" readonly>
          	</td>
          	<td>
       		<div align="right">Antig. Minima Cambio Acuerdo :</div>
          	</td>
          	<td>
          		<input type="text" align="right" name="E06APADY2" size="3" maxlength="3" value="<%= cpProdInq.getE06APADY2() %>" readonly> (Meses)
          	</td>
           </tr>
            			<tr id="trdark">
             <td > 
              <div align="right"> </div>
            </td>
            <td > 
              <div align="right"> </div>
            </td>
            <td> 
             <div align="right">Producto Alternativo :</div>
            </td>
            <td>   
	            <input type="text"  name="E06APCUC2" size="5" maxlength="4" value="<%= cpProdInq.getE06APCUC2().trim()%>">
            </td>       
 			</tr>
        </table>

  <div id="tableinfo">  
  <h4>Condiciones para Retiros Parciales</h4>
  <table class="tableinfo">
  	<tr id="trdark">
  		<td align="center"> Numero de Retiro </td>
  		<td align="center">Saldo Capital Minimo al Retiro</td>
  		<td align="center">Antiguedad Minima</td>
  		<td align="center">Porcentaje</td>
  		<td align="center">Saldo Capital Residual</td>
  	</tr>
  	<tr id="trclear">
  		<td align="center"> Primero 
		</td>
         	<td align="center">
          		<input type="text" align="right" name="E06APAAC1" size="5" maxlength="6" value="<%= cpProdInq.getE06APAAC1() %>" readonly> 
          	</td>
          	<td align="center">
          		<input type="text" align="right" name="E06APAFC3" size="3" maxlength="3" value="<%= cpProdInq.getE06APAFC3() %>" readonly> (Meses)
          	</td>
          	<td align="center">
          		<input type="text" align="right" name="E06APAFC7" size="3" maxlength="3" value="<%= cpProdInq.getE06APAFC7() %>" readonly>%
          	</td>
          	<td align="center">
          		<input type="text" align="right" name="E06APAAC2" size="5" maxlength="6" value="<%= cpProdInq.getE06APAAC2() %>" readonly>
          	</td>
  	</tr>
  	<tr id="trdark">
  	<td align="center"> 
		</td>
         	<td align="center"> 
             	</td>
          	<td align="center">
          		<input type="text" align="right" name="E06APAFC4" size="3" maxlength="3" value="<%= cpProdInq.getE06APAFC4() %>" readonly> (Meses)
          	</td>
          	<td align="center">
          		<input type="text" align="right" name="E06APAFC8" size="3" maxlength="3" value="<%= cpProdInq.getE06APAFC8() %>" readonly>%
          	</td>
          	<td align="center">
          	</td>
  	</tr>
  	<tr id="trclear">
  	<td align="center"> 
		</td>
         	<td align="center"> 
             	</td>
          	<td align="center">
          		<input type="text" align="right" name="E06APAFC5" size="3" maxlength="3" value="<%= cpProdInq.getE06APAFC5() %>" readonly> (Meses)
          	</td>
          	<td align="center">
          		<input type="text" align="right" name="E06APAFC9" size="3" maxlength="3" value="<%= cpProdInq.getE06APAFC9() %>" readonly>%
          	</td>
          	<td align="center">
          	</td>
  	</tr>
  	  	<tr id="trdark">
  		<td align="center"> Siguientes... 
		</td>
         	<td align="center">
          		<input type="text"  align="right" name="E06APAAC3" size="5" maxlength="6" value="<%= cpProdInq.getE06APAAC3() %>" readonly> 
          	</td>
          	<td align="center">
          		<input type="text"  align="right" name="E06APAFC6" size="3" maxlength="3" value="<%= cpProdInq.getE06APAFC6() %>" readonly> (Meses)
          	</td>
          	<td align="center">
          		<input type="text"  align="right" name="E06APAFC0" size="3" maxlength="3" value="<%= cpProdInq.getE06APAFC0() %>" readonly>%
          	</td>
          	<td align="center">
          		<input type="text"  align="right" name="E06APAAC4" size="5" maxlength="6" value="<%= cpProdInq.getE06APAAC4() %>" readonly>
          	</td>
  	</tr>
  	
   </table>
  </div>
 
  
  <h4>Direcciones de Acceso</h4>
  <table class="tableinfo">
    <tr > 
      <td > 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="trdark"> 
            <td width="50%"> 
              <div align="right">Audio : </div>
            </td>
            <td width="50%"> 
              <input type="text" readonly name="E06APEAUD" size="82" maxlength="80" value="<%= cpProdInq.getE06APEAUD().trim()%>">
            </td>
          </tr>
          <tr id="trclear"> 
            <td width="50%"> 
              <div align="right">Video : </div>
            </td>
            <td width="50%"> 
              <input type="text" readonly name="E06APEVID" size="82" maxlength="80" value="<%= cpProdInq.getE06APEVID().trim()%>">
            </td>
          </tr>
          <tr id="trdark"> 
            <td width="50%"> 
              <div align="right">HTML : </div>
            </td>
            <td width="50%"> 
              <input type="text" readonly name="E06APEHTM" size="82" maxlength="80" value="<%= cpProdInq.getE06APEHTM().trim()%>">
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
 <p>
</p>
</form>
</body>
</html>
