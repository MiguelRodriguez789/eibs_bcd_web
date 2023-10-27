<%@page import="com.datapro.eibs.constants.ISOCodes"%>
<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@ page import="com.datapro.constants.EibsFields"%>

<html>
<head>
<title>Productos para Negocios</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>

</head>

<jsp:useBean id="prd" class="datapro.eibs.beans.ESD070001Message"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>
<jsp:useBean id="currUser" class="datapro.eibs.beans.ESS0030DSMessage"  scope="session" />

<%
 boolean isReadOnly = false;
 %>
<body>

<script type="text/javascript">
<%    
   
  	if (userPO.getPurpose().equals("INQUIRY")) {
		%>
  			builtNewMenu(cd_i_opt);
  			initMenu();
		 <%
		isReadOnly = true;
	}	
%>
</script>

<% 
 if ( !error.getERRNUM().equals("0")  ) {
     error.setERRNUM("0");
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     error.setERRNUM("0");
     out.println("</SCRIPT>");
     }
%>

<h3 align="center">Producto para Negocios<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="products_tds.jsp, ESD0700"></h3>
<hr size="4">

<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSESD0700" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="1">
  <INPUT TYPE=HIDDEN NAME="E01APCACD" VALUE="<%= prd.getE01APCACD()%>">
  <INPUT TYPE="hidden" NAME="H01FLGMAS" value="A">

<%int row = 0; %>	  
  <table class="tableinfo">
    <tr > 
      <td> 
        <table cellspacing="0" cellpadding="2" width="100%"  class="tbhead"  align="center">
          <tr> 
            <td nowrap width="10%" align="right"> Banco : </td>
            <td nowrap width="12%" align="left"> 
              <input type="text"  name="E01APCBNK" size="3" maxlength="2" value="<%= prd.getE01APCBNK()%>" readonly>
            </td>
            <td nowrap width="6%" align="right">Producto : </td>
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
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td> 
              <div align="right">Descripci&oacute;n :</div>
            </td>
            <td> 
              <input type="text"  name="E01APCDS1" size="50" maxlength="45" value="<%= prd.getE01APCDS1()%>" <%if(isReadOnly) out.print("readonly");%>>
            </td>
            <td> 
              <div align="right">Nombre de Mercadeo :</div>
            </td>
            <td> 
              <input type="text"  name="E01APCDS2" size="28" maxlength="25" value="<%= prd.getE01APCDS2()%>" <%if(isReadOnly) out.print("readonly");%>>
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td > 
              <div align="right">C&oacute;digo de Moneda :</div>
            </td>
            <td > 
              <input type="text"  name="E01APCCCY" size="3" maxlength="3" value="<%= prd.getE01APCCCY()%>" <%if(isReadOnly) out.print("readonly");%>>
              <%if(!isReadOnly){%>
              <a href="javascript:GetCurrency('E01APCCCY','')"><img src="<%=request.getContextPath()%>/images/1b.gif" title=". . ." align="bottom" border="0" ></a>
              <%} %> 
            </td>
            <td > 
              <div align="right">Ofrecimiento por :</div>
            </td>
            <td ><SELECT name="E01APCFTT" <%if(isReadOnly) out.print("disabled");%>>
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
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
				<td width="25%" align="right">Tipo de Cliente :</td>
	            <td width="25%"> 
	              <select name="E01APCFRA" <%if(isReadOnly) out.print("disabled");%>>
	                <option value=" " <%if (prd.getE01APCFRA().equals(" ")) { out.print("selected"); }%>>Cualquiera</option>
	                <option value="0" <%if (prd.getE01APCFRA().equals("0")) { out.print("selected"); }%>>Socio</option>
	                <option value="1" <%if (prd.getE01APCFRA().equals("1")) { out.print("selected"); }%>>Empresa</option>
	                <option value="2" <%if (prd.getE01APCFRA().equals("2")) { out.print("selected"); }%>>Persona</option>
	                <option value="3" <%if (prd.getE01APCFRA().equals("3")) { out.print("selected"); }%>>Menor de Edad</option>
	                <option value="4" <%if (prd.getE01APCFRA().equals("4")) { out.print("selected"); }%>>Empleados</option>
	              </select>
	            </td>
				<td nowrap width=25% align="right" align="right">
				</td>
				<td width="25%">
				</td>
			</tr>  
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td > 
              <div align="right"> Cuenta Contable:</div>
            </td>
            <td > 
              <input type="text"  name="E01APCGLN" size="18" maxlength="16" value="<%= prd.getE01APCGLN().trim()%>" <%if(isReadOnly) out.print("readonly");%>>
               <%if(!isReadOnly){%>
               <a href="javascript:GetLedger('E01APCGLN',document.forms[0].E01APCBNK.value,document.forms[0].E01APCCCY.value,document.forms[0].E01APCACD.value,'','<%= prd.getE01APCTYP().trim()%>')">
				<img src="<%=request.getContextPath()%>/images/1b.gif" title=". . ." align="bottom" border="0" ></a>
				<%} %> 
           </td>
            <td > 
              <div align="right">Tipo de Residencia :</div>
            </td>
            <td > 
              <select name="E01APCRES" <%if(isReadOnly) out.print("disabled");%>>
                <option value=""  <%if (prd.getE01APCRES().equals(""))  { out.print("selected"); }%>>Cualquiera</option> 
                <option value="1" <%if (prd.getE01APCRES().equals("1")) { out.print("selected"); }%>>Residentes</option>
                <option value="2" <%if (prd.getE01APCRES().equals("2")) { out.print("selected"); }%>>Extranjeros</option>
              </select>
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td > 
              <div align="right">Tabla de Documentos :</div>
            </td>
            <td > 
              	<input type="text"  name="E01APCDOC" size="4" maxlength="2" value="<%= prd.getE01APCDOC().trim()%>" <%if(isReadOnly) out.print("readonly");%>>
            	<%if(!isReadOnly){%>
            	<a href="javascript:GetDocInv('E01APCDOC')"><img src="<%=request.getContextPath()%>/images/1b.gif" title=". . ." align="bottom" border="0"></a>
            	<%} %> 
            </td>
            <td > 
              <div align="right">Producto Familia :</div>
            </td>
            <td > 
              	<input type="text"  name="E01APCUC1" size="4" maxlength="2" value="<%= prd.getE01APCUC1().trim()%>" <%if(isReadOnly) out.print("readonly");%>>
            
            </td>            
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
          	<td>
          		<div align="right">Número de Registro RECA :</div>
          	</td>
          	<td>
          		<input type="text" name="E01APAD01" size="40" maxlength="35" value="<%= prd.getE01APAD01() %>" <%if(isReadOnly) out.print("readonly");%>>	
          	</td>
          	<td>  
          		<div align="right">Per&iacute;odo Base :</div>        		
          	</td>
          	<td>
          		<input type="text"  name="E01APCPPD" size="4" maxlength="3" value="<%= prd.getE01APCPPD().trim()%>" <%if(isReadOnly) out.print("readonly");%>>
          	</td>                
          </tr>
			<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
				<td>
					<div align="right">Comisiones :</div>
				</td>
				<td>
				    <input type="text" name="E01APAUC9" size="5" maxlength="4" value="<%= prd.getE01APAUC9().trim() %>" <%if(isReadOnly) out.print("readonly");%>>
				    <input type="hidden" name="DSCAPAUC9" size="5" maxlength="4" value="">
				     <%if(!isReadOnly){%>
				      <a href="javascript:GetCommission('E01APAUC9','DSCAPAUC9')" >
				      <img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="bottom" border="0" ></a>
				      <%} %>
				<td width="25%" align="right">Apertura con Aprobación Automatica : </td>
				<td width="25%" >
					<input type="radio" name="E01APCAPV" value="Y" <%if (prd.getE01APCAPV().equals("Y")) out.print("checked"); %>
					<%if(isReadOnly) out.print("disabled"); %>> Si 
					<input type="radio" name="E01APCAPV" value="N" <%if (prd.getE01APCAPV().equals("N")) out.print("checked"); %>
					<%if(isReadOnly) out.print("disabled"); %>> No
			 	</td>
			</tr>
 			<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
             	<td width="25%" align="right">Permite Clientes Simplificados : </td>
				<td width="25%" >
					<input type="radio" name="E01APCTX9" value="Y" <%if (prd.getE01APCTX9().equals("Y")) out.print("checked"); %> <%if(isReadOnly) out.print("disabled");%>> Si 
					<input type="radio" name="E01APCTX9" value="N" <%if (prd.getE01APCTX9().equals("N")) out.print("checked"); %> <%if(isReadOnly) out.print("disabled");%>> No
			 	</td>
			 	<td align="right">Relación con el Banco Si Simplificado 1 : </td>
				<td nowrap width="35%" align="left" >
                	<select name="E01APAFG1" <%if(isReadOnly) out.print("disabled");%>>
                	<option value=" " <% if (prd.getE01APAFG1().equals(" ")) out.print("selected"); %>>NO APLICA</option>
                    <option value="1" <% if (prd.getE01APAFG1().equals("1")) out.print("selected"); %>>CLIENTE REGULAR</option>
                    <option value="2" <% if (prd.getE01APAFG1().equals("2")) out.print("selected"); %>>CONTRAPARTE</option>
                    <option value="3" <% if (prd.getE01APAFG1().equals("3")) out.print("selected"); %>>EMPLEADO</option>
                    <option value="7" <% if (prd.getE01APAFG1().equals("7")) out.print("selected"); %>>CODEUDOR</option>
                    <option value="9" <% if (prd.getE01APAFG1().equals("9")) out.print("selected"); %>>CB</option>
                    <option value="I" <% if (prd.getE01APAFG1().equals("I")) out.print("selected"); %>>INTERVINIENTE</option>
                    <option value="T" <% if (prd.getE01APAFG1().equals("T")) out.print("selected"); %>>MERCADO SEGUNDARIO</option>
                    <option value="E" <% if (prd.getE01APAFG1().equals("E")) out.print("selected"); %>>USUARIO</option>
                    <option value="P" <% if (prd.getE01APAFG1().equals("P")) out.print("selected"); %>>PROVEEDOR</option>
                    <option value="C" <% if (prd.getE01APAFG1().equals("C")) out.print("selected"); %>>CONVENIO</option>
                    <option value="B" <% if (prd.getE01APAFG1().equals("B")) out.print("selected"); %>>BANCARIZACION</option>
                    <option value="L" <% if (prd.getE01APAFG1().equals("L")) out.print("selected"); %>>LIDER</option>
                    <option value="X" <% if (prd.getE01APAFG1().equals("X")) out.print("selected"); %>>CUALQUIERA</option>
                	</select>
				</td>
			</tr>
			<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
             	<td width="25%" align="right"> </td>
				<td width="25%" >
			 	</td>
			 	<td align="right">Relación con el Banco Si Simplificado 2 : </td>
				<td nowrap width="35%" align="left" >
                	<select name="E01APAFG2" <%if(isReadOnly) out.print("disabled");%>>
                	<option value=" " <% if (prd.getE01APAFG2().equals(" ")) out.print("selected"); %>>NO APLICA</option>
                    <option value="1" <% if (prd.getE01APAFG2().equals("1")) out.print("selected"); %>>CLIENTE REGULAR</option>
                    <option value="2" <% if (prd.getE01APAFG2().equals("2")) out.print("selected"); %>>CONTRAPARTE</option>
                    <option value="3" <% if (prd.getE01APAFG2().equals("3")) out.print("selected"); %>>EMPLEADO</option>
                    <option value="7" <% if (prd.getE01APAFG2().equals("7")) out.print("selected"); %>>CODEUDOR</option>
                    <option value="9" <% if (prd.getE01APAFG2().equals("9")) out.print("selected"); %>>CB</option>
                    <option value="I" <% if (prd.getE01APAFG2().equals("I")) out.print("selected"); %>>INTERVINIENTE</option>
                    <option value="T" <% if (prd.getE01APAFG2().equals("T")) out.print("selected"); %>>MERCADO SEGUNDARIO</option>
                    <option value="E" <% if (prd.getE01APAFG2().equals("E")) out.print("selected"); %>>USUARIO</option>
                    <option value="P" <% if (prd.getE01APAFG2().equals("P")) out.print("selected"); %>>PROVEEDOR</option>
                    <option value="C" <% if (prd.getE01APAFG2().equals("C")) out.print("selected"); %>>CONVENIO</option>
                    <option value="B" <% if (prd.getE01APAFG2().equals("B")) out.print("selected"); %>>BANCARIZACION</option>
                    <option value="L" <% if (prd.getE01APAFG2().equals("L")) out.print("selected"); %>>LIDER</option>
                    <option value="X" <% if (prd.getE01APAFG2().equals("X")) out.print("selected"); %>>CUALQUIERA</option>
                	</select>
				</td>
			</tr>
			<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
             	<td width="25%" align="right"></td>
				<td width="25%" >
			 	</td>
			 	<td align="right">Relación con el Banco Si Simplificado 3 : </td>
				<td nowrap width="35%" align="left" >
                	<select name="E01APAFG3" <%if(isReadOnly) out.print("disabled");%>>
                	<option value=" " <% if (prd.getE01APAFG3().equals(" ")) out.print("selected"); %>>NO APLICA</option>
                    <option value="1" <% if (prd.getE01APAFG3().equals("1")) out.print("selected"); %>>CLIENTE REGULAR</option>
                    <option value="2" <% if (prd.getE01APAFG3().equals("2")) out.print("selected"); %>>CONTRAPARTE</option>
                    <option value="3" <% if (prd.getE01APAFG3().equals("3")) out.print("selected"); %>>EMPLEADO</option>
                    <option value="7" <% if (prd.getE01APAFG3().equals("7")) out.print("selected"); %>>CODEUDOR</option>
                    <option value="9" <% if (prd.getE01APAFG3().equals("9")) out.print("selected"); %>>CB</option>
                    <option value="I" <% if (prd.getE01APAFG3().equals("I")) out.print("selected"); %>>INTERVINIENTE</option>
                    <option value="T" <% if (prd.getE01APAFG3().equals("T")) out.print("selected"); %>>MERCADO SEGUNDARIO</option>
                    <option value="E" <% if (prd.getE01APAFG3().equals("E")) out.print("selected"); %>>USUARIO</option>
                    <option value="P" <% if (prd.getE01APAFG3().equals("P")) out.print("selected"); %>>PROVEEDOR</option>
                    <option value="C" <% if (prd.getE01APAFG3().equals("C")) out.print("selected"); %>>CONVENIO</option>
                    <option value="B" <% if (prd.getE01APAFG3().equals("B")) out.print("selected"); %>>BANCARIZACION</option>
                    <option value="L" <% if (prd.getE01APAFG3().equals("L")) out.print("selected"); %>>LIDER</option>
                    <option value="X" <% if (prd.getE01APAFG3().equals("X")) out.print("selected"); %>>CUALQUIERA</option>
                	</select>
				</td>
			</tr>			
			<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
				<td width="25%" align="right">Verificar Biometr&iacute;a :</td>
				<td width="25%" >
					<input type="radio" name="E01APAF06" value="Y" <%if ( prd.getE01APAF06().equals("Y")) out.print("checked"); %>> Si 
					<input type="radio" name="E01APAF06" value="N" <%if (!prd.getE01APAF06().equals("Y")) out.print("checked"); %>> No
			 	</td>
				<td width="25%"><div align="right"></div></td>
				<td width="25%"></td>
			</tr>
        </table>
      </td>
    </tr>
  </table>

<h4>Impuestos </h4>
<table class="tableinfo">
    <tr > 
      <td nowrap > 
        <table cellspacing=0 cellpadding=2 width="100%" border="0">
        <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="10%" > 
              <div align="center"> </div>
            </td>
            <td nowrap width="10%" > 
              <div align="center">ISR</div>
            </td>
            <td nowrap width="10%" > 
              <div align="center">IVA/ITBMS</div>
            </td>
            <td nowrap width="10%" > 
              <div align="center">IDB/GMF</div>
            </td>
            <td nowrap width="10%" > 
              <div align="center"> <%if(currUser.getE01INT().equals(ISOCodes.getIBSCountryCode("PA"))){ %>  FECI <% } %></div>
            </td>
            <td nowrap width="10%" > 
              <div align="center"> </div>
            </td>
        </tr>        
         <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="10%" > 
              <div align="center"> </div>
            </td>
            <td nowrap width="10%"  > 
              <div align="center"> 
				<select id="E01APCTX1" name="E01APCTX1" <%if(isReadOnly) out.print("disabled");%>>
				    <option value=" " selected> &nbsp; </option>
				    <option value="1" <% if(prd.getE01APCTX1().equals("1")) out.print("selected");%>> SI </option>
				    <option value="0" <% if(prd.getE01APCTX1().equals("0")) out.print("selected");%>> NO </option>
				</select>        
              </div>
            </td>
            <td nowrap width="10%"  > 
              <div align="center"> 
				<select id="E01APCTX2" name="E01APCTX2" <%if(isReadOnly) out.print("disabled");%>>
				    <option value=" " selected> &nbsp; </option>
				    <option value="1" <% if(prd.getE01APCTX2().equals("1")) out.print("selected");%>> SI </option>
				    <option value="0" <% if(prd.getE01APCTX2().equals("0")) out.print("selected");%>> NO </option>
				</select>        
              </div>
            </td>
            <td nowrap width="10%" > 
              <div align="center"> 
				<select id="E01APCTX3" name="E01APCTX3" <%if(isReadOnly) out.print("disabled");%>>
				    <option value=" " selected> &nbsp; </option>
				    <option value="1" <% if(prd.getE01APCTX3().equals("1")) out.print("selected");%>> SI </option>
				    <option value="0" <% if(prd.getE01APCTX3().equals("0")) out.print("selected");%>> NO </option>
				</select>        
              </div>
            </td>
            <td nowrap width="10%" > 
              <div align="center"> 
<%if(currUser.getE01INT().equals(ISOCodes.getIBSCountryCode("PA"))){ %> 
				<select id="E01APCTX4" name="E01APCTX4" <%if(isReadOnly) out.print("disabled");%>>
				    <option value=" " selected> &nbsp; </option>
				    <option value="1" <% if(prd.getE01APCTX4().equals("1")) out.print("selected");%>> SI </option>
				    <option value="0" <% if(prd.getE01APCTX4().equals("0")) out.print("selected");%>> NO </option>
				</select>                 
<% } %>				
			</div>
            </td>
            <td nowrap width="10%" > 
              <div align="center"> </div>
            </td>
         </tr>
        </table>
      </td>
    </tr>
  </table>
  
  <h4>Informaci&oacute;n Adicional</h4>

  <table class="tableinfo">
    <tr > 
      <td > 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td>
          		<div align="right">D&iacute;as Cambio Vencido :</div>
          	</td>
          	<td>
          	 	<input type="text"  name="E01APCIPD" size="4" maxlength="2" value="<%= prd.getE01APCIPD().trim()%>" <%if(isReadOnly) out.print("readonly");%>>
            </td>   
            <td>
          		<div align="right">Proceso Camara  :</div>
          	</td>
          	<td width="18%">
              <input type="radio" name="E01APCFL2" value="Y"  <%if (prd.getE01APCFL2().equals("Y")) out.print("checked"); %> <%if(isReadOnly) out.print("disabled");%>>
              Si 
              <input type="radio" name="E01APCFL2" value="N"  <%if (prd.getE01APCFL2().equals("N")) out.print("checked"); %> <%if(isReadOnly) out.print("disabled");%>>
              No
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
         	 <td>
            	<div align="right">Tabla Tasa Captadora:</div>
          	 </td>
            <td>
             	<input type="text"  name="E01APCCDT" size="4" maxlength="2" value="<%= prd.getE01APCCDT()%>" <%if(isReadOnly) out.print("readonly");%>>
             	<%if(!isReadOnly){%>
             	<a href="javascript:GetRateTable('E01APCCDT')"><img src="<%=request.getContextPath()%>/images/1b.gif" title=". . ." align="bottom" border="0" ></a>
             	<%} %>
            </td>
             <td>
          		<div align="right">Tabla Tasa Pizarra :</div>
          	</td>
          	<td>
          	  	<input type="text"  name="E01APCTLN" size="4" maxlength="2" value="<%= prd.getE01APCTLN().trim()%>" <%if(isReadOnly) out.print("readonly");%>>  
              	<%if(!isReadOnly){%>
              	<a href="javascript:GetRateTablePizarra('E01APCTLN')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="help" align="middle" border="0"  ></a>
              	<%} %> 
          	</td> 
            
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
          	<td>
          		<div align="right">Calculo Interes :</div>
          	</td>
          	<td width="25%"> 
            	<input type="text"  name="E01APCMCI" size="4" maxlength="2" value="<%= prd.getE01APCMCI().trim()%>" <%if(isReadOnly) out.print("readonly");%>>                
            	<%if(!isReadOnly){%>
            	<a href="javascript:GetCode('E01APCMCI','STATIC_ln_prov.jsp')"><img src="<%=request.getContextPath()%>/images/1b.gif" title=". . ." align="bottom" border="0"></a>
            	<%} %>
            </td>
            <td>
          		<div align="right">Tipo de Interes :</div>
          	</td>
          	<td width="25%"> 
            	<input type="text"  name="E01APCMCP" size="4" maxlength="2" value="<%= prd.getE01APCMCP().trim()%>" <%if(isReadOnly) out.print("readonly");%>>
            	<%if(!isReadOnly){%>                
            	<a href="javascript:GetCode('E01APCMCP','STATIC_tds_typ_int.jsp')"><img src="<%=request.getContextPath()%>/images/1b.gif" title=". . ." align="bottom" border="0" ></a>
            	<%} %>
            </td>          
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
          	<td>
          		<div align="right">Tabla Tasa Flotante :</div>
          	</td>
          	<td>
          		<input type="text"  name="E01APCFRT" size="4" maxlength="2" value="<%= prd.getE01APCFRT().trim()%>" <%if(isReadOnly) out.print("readonly");%>>                
	             <%if(!isReadOnly){%> 
	              <a href="javascript:GetFloating('E01APCFRT')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="Tabla de Tasas Flotantes" align="middle" border="0" ></a>
	              <%} %> 
          		<select name="E01APCFTY" <%if(isReadOnly) out.print("disabled");%>>
	                <option value=" " <% if (!(prd.getE01APCFTY().equals("FP") ||prd.getE01APCFTY().equals("FS"))) out.print("selected"); %>></option>
                	<option value="FP" <%if (prd.getE01APCFTY().equals("FP")) { out.print("selected"); }%>>Primaria</option>
             		<option value="FS" <%if (prd.getE01APCFTY().equals("FS")) { out.print("selected"); }%>>Secundaria</option>
                </select>        
          	</td>
          	<td>
          		<div align="right">Ciclo Revision Tasa :</div>
          	</td>
          	<td>
          		<input type="text"  name="E01APCRRD" size="4" maxlength="3" value="<%= prd.getE01APCRRD().trim()%>" <%if(isReadOnly) out.print("readonly");%>>
          		<%if(!isReadOnly){%> 
          		<a href="javascript:GetCode('E01APCRRD','STATIC_cycle_rev_cd.jsp')"><img src="<%=request.getContextPath()%>/images/1b.gif" title=". . ." align="bottom" border="0" ></a>
          		<%} %>                
          	</td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
			<td>
				<div align="right">Tipo de Cliente :</div>
			</td>
            <td > 
				<select name="E01APCFL5" <%if(isReadOnly) out.print("disabled");%>>
					<option value="" <%if (!prd.getE01APCFL5().equals("1") && !prd.getE01APCFL5().equals("2")) { out.print("selected"); }%>>Cualquiera</option>
                	<option value="1" <%if (prd.getE01APCFL5().equals("1")) { out.print("selected"); }%>>Empresa</option>
             		<option value="2" <%if (prd.getE01APCFL5().equals("2")) { out.print("selected"); }%>>Persona</option>
                </select>   
            </td>
          	<td>
          		<div align="right">Permite Renovación :</div>
          	</td>
          	<td width="18%">
              <input type="radio" name="E01APCFL3" value="Y"  <%if (prd.getE01APCFL3().equals("Y")) out.print("checked"); %> <%if(isReadOnly) out.print("disabled");%>>
              Si 
              <input type="radio" name="E01APCFL3" value="N"  <%if (prd.getE01APCFL3().equals("N")) out.print("checked"); %> <%if(isReadOnly) out.print("disabled");%>>
              No
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
          	<td>
          		<div align="right">Permite Fracionamiento  :</div>
          	</td>
          	<td width="18%">
              <input type="radio" name="E01APCFL4" value="Y"  <%if (prd.getE01APCFL4().equals("Y")) out.print("checked"); %> <%if(isReadOnly) out.print("disabled");%>>
              Si 
              <input type="radio" name="E01APCFL4" value="N"  <%if (prd.getE01APCFL4().equals("N")) out.print("checked"); %> <%if(isReadOnly) out.print("disabled");%>> 
              No
            </td>
          	<td>
          		<div align="right">Genera Interfaz DCV :</div>
          	</td>
          	<td width="18%">
              <input type="radio" name="E01APCFL1" value="Y"  <%if (prd.getE01APCFL1().equals("Y")) out.print("checked"); %> <%if(isReadOnly) out.print("disabled");%>>
              Si 
              <input type="radio" name="E01APCFL1" value="N"  <%if (prd.getE01APCFL1().equals("N")) out.print("checked"); %> <%if(isReadOnly) out.print("disabled");%>>
              No
            </td>
       </tr>  
       <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
          	<td>
          		<div align="right">Tipo Papel Valor :</div>          	</td>
          	<td width="18%">
          	  <input type="text"  name="E01APAUC2" size="5" maxlength="4" value="<%= prd.getE01APAUC2().trim()%>" <%if(isReadOnly) out.print("readonly");%>>	
          	  <%if(!isReadOnly){%>
          	  <a href="javascript:GetCodeCNOFC('E01APAUC2','YJ')"><img
					src="<%=request.getContextPath()%>/images/1b.gif" title="ayuda"
					align="bottom" border="0"></a>
			<%} %>		            
			</td>
            <td>
          		<div align="right">SubTipo Papel Valor :</div>          	</td>
          	<td width="18%">
          	  <input type="text"  name="E01APAUC3" size="5" maxlength="4" value="<%= prd.getE01APAUC3().trim()%>" <%if(isReadOnly) out.print("readonly");%>>	
          	  <%if(!isReadOnly){%>
          	  <a href="javascript:GetCodeCNOFC('E01APAUC3','YI')"><img
					src="<%=request.getContextPath()%>/images/1b.gif" title="ayuda"
					align="bottom" border="0"></a>
			  <%} %>	        
			</td>
          </tr>        
        </table>
      </td>
    </tr>  
   
 </table>       
  
 <h4>Limites</h4>

  <table class="tableinfo">
    <tr > 
      <td > 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
           <td> 
              <div align="right">Plazo en dias Minimo : </div>
            </td>
            <td align="left" valign="middle" nowrap="nowrap">
           		<input type="text" name="E01APCROY" size="4" maxlength="3" value="<%= prd.getE01APCROY()%>" onKeyPress="enterInteger(event)" <%if(isReadOnly) out.print("readonly");%>>
			</td>
			<td> 
              <div align="right">Plazo en dias Maximo : </div>
            </td>
            <td>
              <INPUT type="text" name="E01APCUC2" size="5" maxlength="4" value="<%= prd.getE01APCUC2()%>" onKeyPress="enterInteger(event)" <%if(isReadOnly) out.print("readonly");%>>
			</td> 
            <td>
           </tr> 
           <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td>
            	<div align="right">Monto Minimo de Apertura:</div>
            </td>
            <td align="left" valign="middle" nowrap="nowrap">
            	<input type="text" name="E01APCAM1" size="16" maxlength="15" value="<%= prd.getE01APCAM1()%>" onKeyPress="enterDecimal(event,2)" <%if(isReadOnly) out.print("readonly");%>>
			</td>
			<td>
            	<div align="right">Monto Maximo de Apertura:</div>
            </td>
            <td align="left" valign="middle" nowrap="nowrap">
        		<INPUT type="text" name="E01APCAM2" size="16" maxlength="15" value="<%= prd.getE01APCAM2()%>" onKeyPress="enterDecimal(event,2)" <%if(isReadOnly) out.print("readonly");%>>
			</td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
         	 <td>
            	<div align="right">Factor Apertura:</div>
            </td>
            <td align="left" valign="middle" nowrap="nowrap">
            	<input type="text" name="E01APAMN0" size="16" maxlength="15" value="<%= prd.getE01APAMN0()%>" onKeyPress="enterDecimal(event,2)" <%if(isReadOnly) out.print("readonly");%>>
			</td>
            <td>
            </td>
            <td align="left" valign="middle" nowrap="nowrap">
          </td>
 
          </tr>
         </table>
      </td>
    </tr>  
 </table>        
 
    <p>
  <%if(!isReadOnly){%>  
  <div align="center"> 
    <input id="EIBSBTN" type="submit" name="Submit"  value="Enviar">
  </div>
  <%} %>
 </form>
</body>
</html>
