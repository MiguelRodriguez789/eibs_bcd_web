<%@page import="com.datapro.eibs.constants.ISOCodes"%>
<html>
<head>
<title>Productos</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

</head>

<jsp:useBean id="lnProdInq" class="datapro.eibs.beans.ESD071110Message"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>

<SCRIPT type="text/javascript">

<% if ( userPO.getHeader23().equals("G") ||  userPO.getHeader23().equals("V")){ %>
	builtNewMenu(ln_i_1_opt);
<% } else  { %>
	builtNewMenu(ln_i_2_opt);
<% } %>

</SCRIPT>
<body>

<% 
 if ( !error.getERRNUM().equals("0")  ) {
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
     }
    out.println("<SCRIPT> initMenu(); </SCRIPT>");
 
%> 

<h3 align="center">Consulta de Producto de Pr&eacute;stamos<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="products_inq_ln.jsp, EDL0160" width="32" height="32"></h3>
<hr size="4">

<form>
  <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
          <tr id="trdark"> 
            <td nowrap width="14%" > 
              <div align="right"><b>Cliente :</b></div>
            </td>
            <td nowrap width="9%" > 
              <div align="left"> 
                <input type="text" name="E02CUN2" size="10" maxlength="9" readonly value="<%= userPO.getCusNum().trim()%>">
              </div>
            </td>
            <td nowrap width="12%" > 
              <div align="right"><b>Nombre :</b></div>
            </td>
            <td nowrap > 
              <div align="left"> 
                <input type="text" name="E02NA12" size="45" maxlength="45" readonly value="<%= userPO.getCusName().trim()%>">
              </div>
            </td>
            <td nowrap > 
              <div align="right"><b>Producto : </b></div>
            </td>
            <td nowrap ><b> 
              <input type="text" name="E02PTYP" size="4" maxlength="4" readonly value="<%= userPO.getType().trim()%>">
              <input type="text" name="E02PRO2" size="4" maxlength="4" readonly value="<%= userPO.getProdCode().trim()%>">
              </b></td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="14%"> 
              <div align="right"><b>Cuenta :</b></div>
            </td>
            <td nowrap width="9%"> 
              <div align="left"> 
                <input type="text" name="E02ACC" size="13" maxlength="12" value="<%= userPO.getAccNum().trim()%>" readonly>
              </div>
            </td>
            <td nowrap width="12%"> 
              <div align="right"><b>Oficial :</b></div>
            </td>
            <td nowrap width="33%"> 
              <div align="left"> 
                <input type="text" name="E02NA122" size="45" maxlength="45" readonly value="<%= userPO.getOfficer().trim()%>">
              </div>
            </td>
            <td nowrap width="11%"> 
              <div align="right"><b>Moneda :</b></div>
            </td>
            <td nowrap width="21%"> 
              <div align="left"> 
                <input type="text" name="E01DEACCY" size="3" maxlength="3" value="<%= userPO.getCurrency().trim()%>" readonly>
              </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  
  <h4>Clasificaci&oacute;n del Producto</h4>
  
  <%int row = 0; %>
  <table class="tableinfo">
    <tr > 
      <td > 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td width="40%"> 
              <div align="right">Tipo de Producto: </div>
            </td>
            <td width="60%"> 
              <input type="text" readonly name="E10APCTYP" size="6" maxlength="4" value="<%= lnProdInq.getE10APCTYP().trim()%>">
              <input type="text" readonly name="E10TYPDES" size="37" maxlength="35" value="<%= lnProdInq.getE10TYPDES().trim()%>">
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">  
            <td width="40%"> 
              <div align="right">C&oacute;digo de Producto: </div>
            </td>
            <td width="60%"> 
              <input type="text" readonly name="E10APCCDE" size="6" maxlength="4" value="<%= lnProdInq.getE10APCCDE().trim()%>">
              <input type="text" readonly name="E10DESCRI" size="37" maxlength="63" value="<%= lnProdInq.getE10DESCRI().trim()%>">
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td width="40%"> 
              <div align="right">Nombre de Mercadeo: </div>
            </td>
            <td width="60%"> 
              <input type="text" readonly name="E10MERCAD" size="17" maxlength="15" value="<%= lnProdInq.getE10MERCAD().trim()%>">
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>

  <h4>Informaci&oacute;n Contable</h4>

  <table class="tableinfo">
    <tr > 
      <td > 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">  
            <td width="40%"> 
              <div align="right">C&oacute;digo de Banco: </div>
            </td>
            <td width="60%"> 
              <input type="text" readonly name="E10APCBNK" size="4" maxlength="2" value="<%= lnProdInq.getE10APCBNK().trim()%>">
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">  
            <td width="40%"> 
              <div align="right">C&oacute;digo de Moneda: </div>
            </td>
            <td width="60%"> 
              <input type="text" readonly name="E10APCCCY" size="5" maxlength="3" value="<%= lnProdInq.getE10APCCCY().trim()%>">
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">  
            <td width="40%"> 
              <div align="right">C&oacute;digo de Cuenta Contable: </div>
            </td>
            <td width="60%"> 
              <input type="text" readonly name="E10APCGLN" size="18" maxlength="16" value="<%= lnProdInq.getE10APCGLN().trim()%>">
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">  
            <td width="40%"> 
              <div align="right">Descripci&oacute;n de la Cuenta Contable: </div>
            </td>
            <td width="60%"> 
              <input type="text" readonly name="E10GLMDSC" size="37" maxlength="35" value="<%= lnProdInq.getE10GLMDSC().trim()%>">
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>

<h4>Impuestos </h4>
<table class="tableinfo" >
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
				<select id="E10APCTX1" name="E10APCTX1" disabled>
				    <option value=" " selected> &nbsp; </option>
				    <option value="1" <% if(lnProdInq.getE10APCTX1().equals("1")) out.print("selected");%>> SI </option>
				    <option value="0" <% if(lnProdInq.getE10APCTX1().equals("0")) out.print("selected");%>> NO </option>
				</select>        
              </div>
            </td>
            <td nowrap width="10%"  > 
              <div align="center"> 
				<select id="E10APCTX2" name="E10APCTX2" disabled>
				    <option value=" " selected> &nbsp; </option>
				    <option value="1" <% if(lnProdInq.getE10APCTX2().equals("1")) out.print("selected");%>> SI </option>
				    <option value="0" <% if(lnProdInq.getE10APCTX2().equals("0")) out.print("selected");%>> NO </option>
				</select>        
              </div>
            </td>
            <td nowrap width="10%" > 
              <div align="center"> 
				<select id="E10APCTX3" name="E10APCTX3" disabled>
				    <option value=" " selected> &nbsp; </option>
				    <option value="1" <% if(lnProdInq.getE10APCTX3().equals("1")) out.print("selected");%>> SI </option>
				    <option value="0" <% if(lnProdInq.getE10APCTX3().equals("0")) out.print("selected");%>> NO </option>
				</select>        
              </div>
            </td>
            <td nowrap width="10%" > 
              <div align="center"> 
<%if(currUser.getE01INT().equals(ISOCodes.getIBSCountryCode("PA"))){ %> 
				<select id="E10APCTX4" name="E10APCTX4" disabled>
				    <option value=" " selected> &nbsp; </option>
				    <option value="1" <% if(lnProdInq.getE10APCTX4().equals("1")) out.print("selected");%>> SI </option>
				    <option value="0" <% if(lnProdInq.getE10APCTX4().equals("0")) out.print("selected");%>> NO </option>
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

  <h4>Informaci&oacute;n Financiera</h4>

  <table class="tableinfo">
    <tr > 
      <td > 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td width="40%"> 
              <div align="right">Tipo de Prest&aacute;mo : </div>
            </td>
            <td width="60%"> 
              <input type="text" readonly name="E10APCFRN" size="3" maxlength="1" value="<%= lnProdInq.getE10APCFRN().trim()%>">
              <input type="text" readonly name="E10DSCFRN" size="35" maxlength="1"  
			   value="<% if (lnProdInq.getE10APCFRN().equals("A")) out.print("Arrendamiento Financiero");
			    		else if (lnProdInq.getE10APCFRN().equals("C")) out.print("Prestamos de Consumo");
						else if (lnProdInq.getE10APCFRN().equals("D")) out.print("Prestamos Sobre Saldo Disoluto");
						else if (lnProdInq.getE10APCFRN().equals("L")) out.print("Prestamos Regular");
						else if (lnProdInq.getE10APCFRN().equals("H")) out.print("Hipotecarios");
						else if (lnProdInq.getE10APCFRN().equals("P")) out.print("Politica Habitacional");
						else if (lnProdInq.getE10APCFRN().equals("G")) out.print("Factoring[Descuento documentos]");
						else if (lnProdInq.getE10APCFRN().equals("V")) out.print("Valores al Cobro");
						else if (lnProdInq.getE10APCFRN().equals("O")) out.print("Para Control de Sobregiros");
						else if (lnProdInq.getE10APCFRN().equals("R")) out.print("Prestamos para Refinanciar Otro");
						else if (lnProdInq.getE10APCFRN().equals("I")) out.print("Prestamo Credilinea");
						else out.print("Proyectos de Constructor");%>">
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">  
            <td width="40%"> 
              <div align="right">C&aacute;lculo de Inter&eacute;s : </div>
            </td>
            <td width="60%"> 
              <input type="text" readonly name="E10APCMCI" size="3" maxlength="1" value="<%= lnProdInq.getE10APCMCI().trim()%>">
              <input type="text" readonly name="E10DSCMCI" size="35" maxlength="1"  
			   value="<% if (lnProdInq.getE10APCMCI().equals("1")) out.print("Calculo sobre Capital Vigente");
			    		else if (lnProdInq.getE10APCMCI().equals("2")) out.print("Calculo sobre Capital Original");
						else if (lnProdInq.getE10APCMCI().equals("3")) out.print("Calculo sobre Capital Vigente menos Capital Vencido");
						else if (lnProdInq.getE10APCMCI().equals("N")) out.print("No Calcula Intereses");
						else out.print("");%>">
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">  
            <td width="40%"> 
              <div align="right">C&aacute;lculo de Mora : </div>
            </td>
            <td width="60%"> 
              <input type="text" readonly name="E10APCMCP" size="3" maxlength="1" value="<%= lnProdInq.getE10APCMCP().trim()%>">
              <input type="text" readonly name="E10DSCMCP" size="35" maxlength="1"  
			   value="<% if (lnProdInq.getE10APCMCP().equals("1")) out.print("Calculo sobre Capital Vencido");
			    		else if (lnProdInq.getE10APCMCP().equals("2")) out.print("Calculo sobre Capital Original");
						else if (lnProdInq.getE10APCMCP().equals("3")) out.print("Calculo sobre Capital Vigente");
						else if (lnProdInq.getE10APCMCP().equals("4")) out.print("Calculo sobre Capital + Intereses Vencidos");
						else if (lnProdInq.getE10APCMCP().equals("5")) out.print("Calculo sobre Capital + Intereses + Seguros Vencidos");
						else if (lnProdInq.getE10APCMCI().equals("N")) out.print("No Calcula Intereses");
						else out.print("");%>">
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">  
            <td width="40%"> 
              <div align="right">Ciclo de Pago Principal :</div>
            </td>
            <td width="60%"> 
              <input type="text" readonly name="E10APCPPD" size="4" maxlength="3" value="<%= lnProdInq.getE10APCPPD().trim()%>">
              <input type="text" readonly name="E10DSCPPD" size="45" maxlength="1"  
			   value="<% if (lnProdInq.getE10APCPPD().equals("030")) out.print("Pagos Ciclicos cada 030 dias");
			    		else if (lnProdInq.getE10APCPPD().equals("MAT")) out.print("Pago al Vencimiento del Prestamo");
						else if (lnProdInq.getE10APCPPD().equals("SCH")) out.print("Cuotas Irregulares [Creadas Manualmente]");
						else if (lnProdInq.getE10APCPPD().equals("SC1")) out.print("Cuotas Niveladas y Pagos Extraordinarios");
						else if (lnProdInq.getE10APCPPD().equals("SC2")) out.print("Doble Cuota Nivelada según % de Capital");
						else if (lnProdInq.getE10APCPPD().equals("SC3")) out.print("Cuota Nivelada para Prestamo de Consumo");
						else out.print("Pagos Ciclicos cada nnn dias [030,090,180]");%>">
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">  
            <td width="40%"> 
              <div align="right">Ciclo de Pago de Intereses :</div>
            </td>
            <td width="60%"> 
              <input type="text" readonly name="E10APCIPD" size="4" maxlength="3" value="<%= lnProdInq.getE10APCIPD().trim()%>">
              <input type="text" readonly name="E10DSCIPD" size="45" maxlength="1"  
			   value="<% if (lnProdInq.getE10APCIPD().equals("030")) out.print("Pagos Ciclicos cada 030 dias");
			    		else if (lnProdInq.getE10APCIPD().equals("MAT")) out.print("Pago al Vencimiento del Prestamo");
						else if (lnProdInq.getE10APCIPD().equals("SCH")) out.print("Cuotas Irregulares [Creadas Manualmente]");
						else if (lnProdInq.getE10APCIPD().equals("SC1")) out.print("Cuotas Niveladas y Pagos Extraordinarios");
						else if (lnProdInq.getE10APCIPD().equals("SC2")) out.print("Doble Cuota Nivelada según % de Capital");
						else if (lnProdInq.getE10APCIPD().equals("SC3")) out.print("Cuota Nivelada para Prestamo de Consumo");
						else out.print("Pagos Ciclicos cada nnn dias [030,090,180]");%>">
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">  
            <td width="40%"> 
              <div align="right">Tabla de Cargos : </div>
            </td>
            <td width="60%"> 
              <input type="text" readonly name="E10APCTLN" size="4" maxlength="2" value="<%= lnProdInq.getE10APCTLN().trim()%>">
              <input type="text" readonly name="E10TBLDSC" size="37" maxlength="35" value="<%= lnProdInq.getE10TBLDSC().trim()%>">
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td width="40%"> 
              <div align="right">Tabla de Cargos / Rangos : </div>
            </td>
            <td width="60%"> 
              <input type="text" readonly name="E10APCCDT" size="3" maxlength="1" value="<%= lnProdInq.getE10APCCDT().trim()%>">
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">  
            <td width="40%"> 
              <div align="right">Tipo de Cliente : </div>
            </td>
            <td width="60%"> 
              <input type="text" readonly name="E10APCFRA" size="15" maxlength="1"  
			   value="<% if (lnProdInq.getE10APCFRA().equals("0")) out.print("Socios");
			    		else if (lnProdInq.getE10APCFRA().equals("1")) out.print("Empresas");
			    		else if (lnProdInq.getE10APCFRA().equals("2")) out.print("Persona");
			    		else if (lnProdInq.getE10APCFRA().equals("3")) out.print("Menor de Edad");
			    		else if (lnProdInq.getE10APCFRA().equals("4")) out.print("Empleados");
						else out.print("Cualquiera");%>">
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">  
            <td width="40%"> 
              <div align="right">Tipo Residencia : </div>
            </td>
            <td width="60%"> 
              <input type="text" readonly name="E10APCRES" size="15" maxlength="1"  
			   value="<% if (lnProdInq.getE10APCRES().equals("1")) out.print("Residente");
			    		else if (lnProdInq.getE10APCRES().equals("2")) out.print("No Residente");
						else out.print("Cualquiera");%>">
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">  
            <td width="40%"> 
              <div align="right">Tabla de Tasa Flotante : </div>
            </td>
            <td width="60%"> 
              <input type="text" readonly name="E10APCFRT" size="4" maxlength="2" value="<%= lnProdInq.getE10APCFRT().trim()%>">
              <input type="text" readonly name="E10FLTDSC" size="37" maxlength="35" value="<%= lnProdInq.getE10FLTDSC().trim()%>">
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td width="40%"> 
              <div align="right">Tipo de Tasa Flotante : </div>
            </td>
            <td width="60%"> 
              <input type="text" readonly name="E10APCFTY" size="15" maxlength="2" 
				value="<% if (lnProdInq.getE10APCFTY().equals("FP")) out.print("Primaria");
			    		else if (lnProdInq.getE10APCFTY().equals("FS")) out.print("Secundaria");
						else out.print("");%>">
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td width="40%"> 
              <div align="right">Ciclo Cambio de Tasa :</div>
            </td>
            <td width="60%"> 
              <input type="text" readonly name="E10APCRRD" size="5" maxlength="3" value="<%= lnProdInq.getE10APCRRD().trim()%>">
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td width="40%"> 
              <div align="right">Tabla de Documentos: </div>
            </td>
            <td width="60%"> 
              <input type="text" readonly name="E10APCDOC" size="4" maxlength="2" value="<%= lnProdInq.getE10APCDOC().trim()%>">
              <input type="text" readonly name="E10DOCDSC" size="37" maxlength="35" value="<%= lnProdInq.getE10DOCDSC().trim()%>">
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
 
   <%if(currUser.getE01INT().equals("18") &&  lnProdInq.getE10APCFRN().equals("H")){%> 
  
  
  <h4>Creditos Hipotecarios</h4>

  <table class="tableinfo">
    <tr > 
      <td > 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td width="25%"> 
              <div align="right">Credito Preferencial :</div>
            </td>
            <td width="25%"> 
              <select name="E01APARFL" disabled="disabled">
					<option value=""></option>
					<option value="1" <%if (lnProdInq.getE10APARFL().equals("1")) { out.print("selected"); }%>>Vivienda Nueva</option>
					<option value="2" <%if (lnProdInq.getE10APARFL().equals("2")) { out.print("selected"); }%>>Forestal</option>
					<option value="3" <%if (lnProdInq.getE10APARFL().equals("3")) { out.print("selected"); }%>>Restauración</option>
				</select>
            </td>
            <td nowrap width=25% > 
              <div align="right">Utiliza Tabla de Desarrollo :</div>
            </td>	        
	        <td nowrap width="25%"> 
               <input type="radio" disabled="disabled" name="E10APATY1" value="Y"  <%if (lnProdInq.getE10APATY1().equals("Y")) out.print("checked"); %>>
              Si 
              <input type="radio" disabled="disabled" name="E10APATY1" value="N"  <%if (lnProdInq.getE10APATY1().equals("N")) out.print("checked"); %>>
              No
            </td>
          </tr>

          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">  
            <td nowrap width=25% align="right"> 
              <div align="right">M&aacute;ximo meses de gracia :</div>
			</td>	        
	        <td nowrap width="25%"> 
              <input type="text"  name="E10APAUS1" size="4" maxlength="3" value="<%= lnProdInq.getE10APAUS1() %>" readonly>
            </td>
            <td width="25%"> 
 	           <div align="right">Constitucion de Dividendos :</div> 
            </td>
            <td width="25%"> 
	            <input type="radio" disabled="disabled" name="E10APARTB" value="Y"  <%if (lnProdInq.getE10APARTB().equals("Y")) out.print("checked"); %>>
	              Si 
	              <input type="radio" disabled="disabled" name="E10APARTB" value="N"  <%if (lnProdInq.getE10APARTB().equals("N")) out.print("checked"); %>>
	              No         
	        </td>
          </tr>

          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">  
            <td nowrap width=25% > 
              <div align="right">Producto a generar del pasivo :</div>
			</td>	        
	        <td nowrap width="25%"> 
              <input type="text" name="E10APAPRD" size="6" maxlength="4" value="<%= lnProdInq.getE10APAPRD().trim()%>" readonly>
            </td>
            <td width="25%"> 
               <div align="right">Porcentaje m&aacute;ximo financiamiento : </div>
            </td>
            <td width="25%"> 
              <input type="text"  name="E10APAOIS" size="10" maxlength="9" value="<%= lnProdInq.getE10APAOIS() %>" readonly>
            </td>
          </tr>

          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">  
            <td nowrap width=25% > 
              <div align="right">Meses  Gracia para 1er Dividendo :</div>
			</td>	        
	        <td nowrap width="25%"> 
              <input type="text"  name="E10APAUS3" size="4" maxlength="3" value="<%= lnProdInq.getE10APAUS3() %>" readonly>
            </td>
            <td width="25%"> 
              <div align="right">Dias para aplicar 1er cambio  Tasa :</div>
            </td>
            <td width="25%"> 
              <input type="text"  name="E10APAANP" size="5" maxlength="4" value="<%= lnProdInq.getE10APAANP() %>" readonly>
            </td>
          </tr>

          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">  
            <td nowrap width=25% > 
              <div align="right">Opciones de prepago : </div>
			</td>	        
	        <td nowrap width="25%"> 
              <select name="E10APAPTY" disabled="disabled">
				<option value=""></option>
                <option value="A" <%if (lnProdInq.getE10APAPTY().equals("A")) { out.print("selected"); }%>>Adelgazamiento</option>
                <option value="D" <%if (lnProdInq.getE10APAPTY().equals("D")) { out.print("selected"); }%>>Disminuci&oacute;n plazo</option>
                <option value="B" <%if (lnProdInq.getE10APAPTY().equals("B")) { out.print("selected"); }%>>Ambos</option>
                <option value="N" <%if (lnProdInq.getE10APAPTY().equals("N")) { out.print("selected"); }%>>No permite</option> 
              </select>
            </td>
            <td width="25%"> 
              <div align="right">% Minimo de capital para prepago :</div>
				</td>
            <td width="25%"> 
              <input type="text"  name="E10APART1" size="10" maxlength="9" value="<%= lnProdInq.getE10APART1()%>" readonly>  
            </td>
          </tr>

          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width=25% > 
              <div align="right">D&iacute;as aceleracion autom&aacute;tica : </div>
			</td>	        
	        <td nowrap width="25%"> 
              <input type="text"  name="E10APAUS2" size="4" maxlength="3" value="<%= lnProdInq.getE10APAUS2() %>" readonly>  
            </td>
            <td width="25%"> 
              <div align="right">Exclusi&oacute;n no pago de dividendo : </div>
				</td>
            <td width="25%"> 
               <input type="radio" disabled="disabled" name="E10APATY5" value="Y"  <%if (lnProdInq.getE10APATY5().equals("Y")) out.print("checked"); %>>
              Si 
              <input type="radio" disabled="disabled" name="E10APATY5" value="N"  <%if (lnProdInq.getE10APATY5().equals("N")) out.print("checked"); %>>
              No
			</td>
          </tr>

          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">  
            <td nowrap width=25% > 
              <div align="right">Distribucci&oacute;n meses de no pago : </div>
			</td>	        
	        <td nowrap width="25%"> 
              <select name="E10APATY2" disabled="disabled" >
                <option value="C" <%if (lnProdInq.getE10APATY2().equals("C")) { out.print("selected"); }%>>Capitalizaci&oacute;n</option>
                <option value="D" <%if (lnProdInq.getE10APATY2().equals("D")) { out.print("selected"); }%>>Distribucci&oacute;n</option>
                <option value="" <%if (lnProdInq.getE10APATY2().equals("")) { out.print("selected"); }%>></option>
              </select>
            </td>
            <td width="25%"> 
              <div align="right">Cobro Seguro en meses de gracia : </div>
			</td>
            <td width="25%"> 
              <select name="E10APATY3" disabled="disabled">
                <option value="1" <%if (lnProdInq.getE10APATY3().equals("1")) { out.print("selected"); }%>>Primer dividendo</option>
                <option value="2" <%if (lnProdInq.getE10APATY3().equals("2")) { out.print("selected"); }%>>Capitalizarlo</option>
                <option value="3" <%if (lnProdInq.getE10APATY3().equals("3")) { out.print("selected"); }%>>Cobro en el Curce</option>
                <option value="N" <%if (lnProdInq.getE10APATY3().equals("N")) { out.print("selected"); }%>>No cobrarlo</option>
              </select>
			</td>
          </tr>

          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">  
            <td nowrap width=25% > 
              <div align="right">Metodo C&aacute;lculo comision prepago :</div>
			</td>	        
	        <td nowrap width="25%"> 
              <select name="E10APATY6" disabled="disabled">
                <option value="0" <%if (lnProdInq.getE10APATY6().equals("0")) { out.print("selected"); }%>>Cupon actual</option>
                <option value="1" <%if (lnProdInq.getE10APATY6().equals("1")) { out.print("selected"); }%>>Actual + proximo cupon</option>
                <option value="2" <%if (lnProdInq.getE10APATY6().equals("2")) { out.print("selected"); }%>>Actual + proximo 2 cupones</option>
                <option value="3" <%if (lnProdInq.getE10APATY6().equals("3")) { out.print("selected"); }%>>Actual + proximo 3 cupones</option>
                <option value="4" <%if (lnProdInq.getE10APATY6().equals("4")) { out.print("selected"); }%>>Actual + proximo 4 cupones</option>
                <option value="5" <%if (lnProdInq.getE10APATY6().equals("5")) { out.print("selected"); }%>>Actual + proximo 5 cupones</option>
                <option value="6" <%if (lnProdInq.getE10APATY6().equals("6")) { out.print("selected"); }%>>Actual + proximo 6 cupones</option>
                <option value="7" <%if (lnProdInq.getE10APATY6().equals("7")) { out.print("selected"); }%>>Actual + proximo 7 cupones</option>
                <option value="8" <%if (lnProdInq.getE10APATY6().equals("8")) { out.print("selected"); }%>>Actual + proximo 8 cupones</option>
                <option value="9" <%if (lnProdInq.getE10APATY6().equals("9")) { out.print("selected"); }%>>Actual + proximo 9 cupones</option>
                <option value="" <%if (lnProdInq.getE10APATY6().equals("")) { out.print("selected"); }%>>No calcula comision </option>   
              </select>
            </td>
            <td width="25%"> 
              <div align="right">Fecha Inicio Calculo Interes :</div>
			</td>
            <td width="25%"> 
            	<select name="E10APAF10" disabled="disabled">
              		<option value="0" <%if (lnProdInq.getE10APAF10().equals("0")) { out.print("selected"); }%>>Firma Escritura</option>
              		<option value="1" <%if (lnProdInq.getE10APAF10().equals("1")) { out.print("selected"); }%>>Fecha Apertura</option>
              	</select>
			</td>
          </tr>

        </table>
      </td>
    </tr>
  </table>

  <% } %>
  
  
  <h4>Direcciones de Acceso</h4>
  <table class="tableinfo">
    <tr> 
      <td > 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">  
            <td width="40%"> 
              <div align="right">Audio : </div>
            </td>
            <td width="60%"> 
              <input type="text" readonly name="E10APEAUD" size="82" maxlength="80" value="<%= lnProdInq.getE10APEAUD().trim()%>">
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">  
            <td width="40%"> 
              <div align="right">Video : </div>
            </td>
            <td width="60%"> 
              <input type="text" readonly name="E10APEVID" size="82" maxlength="80" value="<%= lnProdInq.getE10APEVID().trim()%>">
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td width="40%"> 
              <div align="right">HTML : </div>
            </td>
            <td width="60%"> 
              <input type="text" readonly name="E10APEHTM" size="82" maxlength="80" value="<%= lnProdInq.getE10APEHTM().trim()%>">
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  
     
  <p align="center">&nbsp;</p>
 
</form>
</body>
</html>
