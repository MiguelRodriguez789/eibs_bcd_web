<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@page import="com.datapro.eibs.constants.ISOCodes"%>
<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@page import="com.datapro.constants.EibsFields"%>

<html>

<head>

<title>Cotizador de Préstamos</title>

<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">

<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">

<META http-equiv="Content-Style-Type" content="text/css">

<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">



<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>


<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />

<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>

<jsp:useBean id= "lnBasic" class= "datapro.eibs.beans.EDL600101Message"  scope="session" />


<SCRIPT type="text/javascript">


 function CheckSubmit()

{

   document.forms[0].submit();

}



</SCRIPT>


</head>



<body bgcolor="#FFFFFF">


<h3 align="center">Cotizador de Préstamos<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="sim_values,EDL6001"></h3>

<hr size="4">


<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDL6001">

  <p> 

    <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="100">

  </p>

  <table class="tableinfo">

    <tr > 

      <td nowrap> 

        <table cellpadding=2 cellspacing=0 width="100%" border="0">



          <tr id="trdark"> 

            <td nowrap width="25%"> 

              <div align="right">Banco :</div>

            </td>

            <td nowrap width="23%"> 

              <input type="text" name="E01CDBANK" size="3" maxlength="2" value="<%= lnBasic.getE01CDBANK().trim()%>"></td>

            <td nowrap width="25%" > 

              <div align="right">Código de Empresa :</div>

            </td>

            <td nowrap width="27%" > 

              <input type="text" name="E01ENTCDE" size="8" maxlength="6" value="<%= lnBasic.getE01ENTCDE().trim()%>">

              <a href="javascript:GetCodeDescCNOFC('E01ENTCDE',' ','2D')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="help" align="bottom" border="0"></a> 


<%--              <img src="<%=request.getContextPath()%>/images/Check.gif" title="campo obligatorio" align="bottom" border="0"  > --%>

            </td>

          </tr>



          <tr id="trclear"> 

            <td nowrap width="25%"> 

              <div align="right">Producto :</div>

            </td>

            <td nowrap width="23%"> 

              <input type="text" name="E01DEAPRO" size="5" maxlength="4" value="<%= lnBasic.getE01DEAPRO().trim()%>">

	            <a href="javascript:GetProduct('E01DEAPRO','10','01','','')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="help" align="bottom" border="0"></a> 

            </td>

            <td nowrap width="25%" > 

              <div align="right">Cliente :</div>

            </td>

            <td nowrap width="27%" > 

              <input type="text" name="E01DEACUN" size="10" maxlength="9" value="<%= lnBasic.getE01DEACUN().trim()%>">

                <a href="javascript:GetCustomerDescId('E01DEACUN','','')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="ayuda" align="bottom" border="0" ></a>

            </td>

          </tr>



          <tr id="trdark"> 

            <td nowrap width="25%"> 

              <div align="right">Fecha de Nacimiento :</div>

            </td>

            <td nowrap width="23%"> 
				<eibsinput:date name="lnBasic" fn_year="E01FNACOY" fn_month="E01FNACOM" fn_day="E01FNACOD" readonly="true"/>
            </td>

            <td nowrap width="25%" > 

              <div align="right">Edad :</div>

            </td>

            <td nowrap width="27%" > 

              <input type="text" name="E01EDADTI" size="3" maxlength="2" value="<%= lnBasic.getE01EDADTI().trim()%>" onKeypress="enterInteger(event)">

            </td>

          </tr>



          <tr id="trclear"> 

            <td nowrap width="25%"> 

              <div align="right">Titulares :</div>

            </td>

            <td nowrap width="23%"> 

              <input type="text" name="E01NTITUL" size="3" maxlength="2" value="<%= lnBasic.getE01NTITUL().trim()%>">

            </td>

            <td nowrap width="25%" > 

              <div align="right">Sexo : </div>

            </td>

            <td nowrap width="27%" > 

             <input type="text" name="E01CLISEX" size="3" maxlength="2" value="<%= lnBasic.getE01CLISEX().trim()%>">

            </td>

          </tr>



          <tr id="trdark"> 

            <td nowrap width="25%"> 

              <div align="right">Tipo de Calculo de Interes :</div>

            </td>

            <td nowrap width="23%"> 

              <input type="text" name="E01INFECI" size="15" maxlength="15" value="<%= lnBasic.getE01INFECI().trim()%>" onKeypress="enterDecimal()"></td>

            <td nowrap width="25%" > 

              <div align="right">Tasa :</div>

            </td>

            <td nowrap width="27%" > 

              <input type="text" name="E01TASAPR" size="12" maxlength="10" value="<%= lnBasic.getE01TASAPR().trim()%>" onKeypress="enterRate(event)" onKeypress="enterSignDecimal()">

            </td>

          </tr>


          <tr id="trclear"> 

            <td nowrap width="25%"> 

              <div align="right">Monto del Préstamo :</div>

            </td>

            <td nowrap width="23%"> 

              <input type="text" name="E01MONPRE" size="15" maxlength="15" value="<%= lnBasic.getE01MONPRE().trim()%>" onKeypress="enterDecimal()"></td>

            <td nowrap width="25%" > 

              <div align="right">Tasa Efectiva :</div>

            </td>

            <td nowrap width="27%" > 

              <input type="text" name="E01EFERTE" size="12" maxlength="10" value="<%= lnBasic.getE01EFERTE().trim()%>" onKeypress="enterRate(event)" onKeypress="enterSignDecimal()">

            </td>

          </tr>


		<tr id="trdark"> 

            <td nowrap width="100%" colspan="4"> 

              <H3>DETALLE</H3>

            </td>

          </tr>


		<tr id="trclear"> 

            <td nowrap width="25%"> 

              <div align="right"><%= lnBasic.getE01DEDD01().trim()%>:</div>

            </td>

            <td nowrap width="23%"> 

              <input type="text" name="E01DEDA01" size="15" maxlength="15" value="<%= lnBasic.getE01DEDA01().trim()%>" onKeypress="enterDecimal()">

            <td nowrap width="25%" > 

              <div align="right"><%= lnBasic.getE01DEDD02().trim()%>:</div>

            </td>

            <td nowrap width="27%" > 

              <input type="text" name="E01DEDA02" size="15" maxlength="15" value="<%= lnBasic.getE01DEDA02().trim()%>" onKeypress="enterDecimal()">

            </td>

          </tr>

		<tr id="trdark"> 

            <td nowrap width="25%"> 

              <div align="right"><%= lnBasic.getE01DEDD03().trim()%>:</div>

            </td>

            <td nowrap width="23%"> 

              <input type="text" name="E01DEDA03" size="15" maxlength="15" value="<%= lnBasic.getE01DEDA03().trim()%>" onKeypress="enterDecimal()">

            <td nowrap width="25%" > 

              <div align="right"><%= lnBasic.getE01DEDD04().trim()%>:</div>

            </td>

            <td nowrap width="27%" > 

              <input type="text" name="E01DEDA04" size="15" maxlength="15" value="<%= lnBasic.getE01DEDA04().trim()%>" onKeypress="enterDecimal()">

            </td>

          </tr>

		<tr id="trclear"> 

            <td nowrap width="25%"> 

              <div align="right"><%= lnBasic.getE01DEDD05().trim()%>:</div>

            </td>

            <td nowrap width="23%"> 

              <input type="text" name="E01DEDA05" size="15" maxlength="15" value="<%= lnBasic.getE01DEDA05().trim()%>" onKeypress="enterDecimal()">

            <td nowrap width="25%" > 

              <div align="right"><%= lnBasic.getE01DEDD06().trim()%>:</div>

            </td>

            <td nowrap width="27%" > 

              <input type="text" name="E01DEDA06" size="15" maxlength="15" value="<%= lnBasic.getE01DEDA06().trim()%>" onKeypress="enterDecimal()">

            </td>

          </tr>


		<tr id="trdark"> 

            <td nowrap width="25%"> 

              <div align="right"><%= lnBasic.getE01DEDD07().trim()%>:</div>

            </td>

            <td nowrap width="23%"> 

              <input type="text" name="E01DEDA07" size="15" maxlength="15" value="<%= lnBasic.getE01DEDA07().trim()%>" onKeypress="enterDecimal()">

            <td nowrap width="25%" > 

              <div align="right"><%= lnBasic.getE01DEDD08().trim()%>:</div>

            </td>

            <td nowrap width="27%" > 

              <input type="text" name="E01DEDA08" size="15" maxlength="15" value="<%= lnBasic.getE01DEDA08().trim()%>" onKeypress="enterDecimal()">

            </td>

          </tr>


		  <tr id="trclear"> 

            <td nowrap width="25%"> 

              <div align="right"><%= lnBasic.getE01DEDD09().trim()%>:</div>

            </td>

            <td nowrap width="23%"> 

              <input type="text" name="E01DEDA09" size="15" maxlength="15" value="<%= lnBasic.getE01DEDA09().trim()%>" onKeypress="enterDecimal()">

            <td nowrap width="25%">              

            </td>

            <td nowrap width="27%">             

            </td>

          </tr>	


          <tr id="trdark"> 

            <td nowrap width="25%"> 

              <div align="right">Gastos de Cierre :</div>

            </td>

            <td nowrap width="23%"> 

              <input type="text" name="E01GASCIE" size="15" maxlength="15" value="<%= lnBasic.getE01GASCIE().trim()%>" onKeypress="enterDecimal()"></td>

            <td nowrap width="25%" > 

              <div align="right">Número de Pagos :</div>

            </td>

            <td nowrap width="27%" > 

              <input type="text" name="E01NCUOTA" size="4" maxlength="3" value="<%= lnBasic.getE01NCUOTA().trim()%>" onKeypress="enterRate(event)" onKeypress="enterInteger(event)">

            </td>

          </tr>


          <tr id="trclear"> 

            <td nowrap width="25%"> 

              <div align="right">Servicio de Descuento :</div>

            </td>

            <td nowrap width="23%"> 

              <input type="text" name="E01SRVDES" size="15" maxlength="15" value="<%= lnBasic.getE01SRVDES().trim()%>" onKeypress="enterDecimal()"></td>

            <td nowrap width="25%" > 

              <div align="right">Plazo Propuesto :</div>

            </td>

            <td nowrap width="27%" > 

              <input type="text" name="E01PLAZOP" size="4" maxlength="3" value="<%= lnBasic.getE01PLAZOP().trim()%>" onKeypress="enterInteger(event)">

            </td>

          </tr>



	<tr id="trdark"> 

           <td nowrap width="25%" > 

              <div align="right"> Aplica Pago FECI: </div>

            </td>

            <td nowrap width="27%" > 

              <input type="text" name="E01DEAWHF" size="3" maxlength="1" value="<%= lnBasic.getE01DEAWHF().trim()%>" onKeypress="enterInteger(event)"> 

            </td>

            <td nowrap width="25%" > 

              <div align="right">Fecha de Primer Pago :</div>

            </td>

            <td nowrap width="27%" > 
				<eibsinput:date name="lnBasic" fn_year="E01PPAGOY" fn_month="E01PPAGOM" fn_day="E01PPAGOD" readonly="true"/>
			</td>

              

          </tr>


			<tr id="trclear"> 

            <td nowrap width="25%"> 

              <div align="right">Fecha de Vencimiento :</div>

            </td>

            <td nowrap width="23%"> 
				<eibsinput:date name="lnBasic" fn_year="E01MATDTY" fn_month="E01MATDTM" fn_day="E01MATDTD" readonly="true"/>
			</td>
            <td nowrap width="25%" >

				<div align="right">Comisiones :</div> 

            </td>

            <td nowrap width="27%" > 

				<input type="text" name="E01COMISI" size="15" maxlength="15" value="<%= lnBasic.getE01COMISI().trim()%>" onKeypress="enterDecimal()">		 

			</td>               

          </tr>



		<tr id="trdark"> 

            <td nowrap width="25%"> 

              <div align="right">Monto Neto a Recibir :</div>

            </td>

            <td nowrap width="23%"> 

              <input type="text" name="E01PAGTOT" size="15" maxlength="15" value="<%= lnBasic.getE01PAGTOT().trim()%>" onKeypress="enterDecimal()"></td>

            <td nowrap width="25%" > 

              <div align="right">Periodo de Gracia :</div>

            </td>

            <td nowrap width="27%" > 

              <input type="text" name="E01GRACIA" size="4" maxlength="3" value="<%= lnBasic.getE01GRACIA().trim()%>" onKeypress="enterInteger(event)"></td>

          </tr>



          <tr id="trclear"> 

            <td nowrap width="25%"> 

              <div align="right">Monto Total (Total de Cuotas) :</div>

            </td>

            <td nowrap width="23%"> 

              <input type="text" name="E01VLNETO" size="15" maxlength="15" value="<%= lnBasic.getE01VLNETO().trim()%>" onKeypress="enterDecimal()"></td>

            <td nowrap width="25%" > 

              <div align="right">Mes de No Pago :</div>

            </td>

            <td nowrap width="27%" > 

              <input type="text" name="E01NOPAGO" size="3" maxlength="2" value="<%= lnBasic.getE01NOPAGO().trim()%>" onKeypress="enterInteger(event)"></td>

          </tr>


		<tr id="trdark"> 

            <td nowrap width="25%" > 

              <div align="right">Desglose de Mensualidad</div>

            </td>

            <td nowrap width="23%" > 

              <div align="right"> </div>

            </td>

            <td nowrap width="25%" > 

              <div align="right"> </div>

            </td>

            <td nowrap width="27%" > 

              <div align="right"> </div>

            </td>

          </tr>


          <tr id="trclear"> 

            <td nowrap width="25%"> 

              <div align="right">Capital e Intereses:</div>

            </td>

            <td nowrap width="23%"> 

              <input type="text" name="E01PAGPRI" size="15" maxlength="15" value="<%= lnBasic.getE01PAGPRI().trim()%>" onKeypress="enterDecimal()"></td>

            <td nowrap width="25%" > 

              <div align="right">Seguro de Vida :</div>

            </td>

            <td nowrap width="27%" > 

              <input type="text" name="E01PAGSEG" size="15" maxlength="15" value="<%= lnBasic.getE01PAGSEG().trim()%>" onKeypress="enterDecimal()"></td>

          </tr>



		<tr id="trdark"> 

            <td nowrap width="25%"> 

              <div align="right">FECI :</div>

            </td>

            <td nowrap width="23%"> 

              <input type="text" name="E01PAGFEC" size="15" maxlength="15" value="<%= lnBasic.getE01PAGFEC().trim()%>" onKeypress="enterDecimal()"></td>

            <td nowrap width="25%" > 

              <div align="right">Mensualidad Total :</div>

            </td>

            <td nowrap width="27%" > 

              <input type="text" name="E01VCUOTA" size="15" maxlength="15" value="<%= lnBasic.getE01VCUOTA().trim()%>" onKeypress="enterDecimal()"></td>

          </tr>


		<tr id="trclear"> 

            <td nowrap width="25%"> 

              <div align="right">Interes (Primer Pago) :</div>

            </td>

            <td nowrap width="23%"> 

              <input type="text" name="E01PAGINT" size="15" maxlength="15" value="<%= lnBasic.getE01PAGINT().trim()%>" onKeypress="enterDecimal()"></td>

            <td nowrap width="25%" > 


            </td>

            <td nowrap width="27%" > 

          

          </tr>



        </table>

      </td>

    </tr>

  </table>

  


  <div align="center"> 

    <input id="EIBSBTN" type=button name="Submit" value="Iniciar Datos" onClick="CheckSubmit()">

  </div>


  

<% 

 if ( !error.getERRNUM().equals("0")  ) {

      error.setERRNUM("0");

 %>

     <SCRIPT type="text/javascript">;

            showErrors();

     </SCRIPT>

 <%

 }

%>

</form>

</body>

</html>

