<%@page import="com.datapro.eibs.constants.ISOCodes"%>
<html>
<head>
<title>Consulta de Productos de Certificados</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>


</head>

<jsp:useBean id="cdProdInq" class="datapro.eibs.beans.ESD071111Message"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>
<jsp:useBean id="currUser" class="datapro.eibs.beans.ESS0030DSMessage" scope="session" />

<body>

<% 
	if ( !error.getERRNUM().equals("0")  ) {
    	error.setERRNUM("0");
     	out.println("<SCRIPT Language=\"Javascript\">");
     	out.println("       showErrors()");
     	out.println("</SCRIPT>");
    }
%>

<h3 align="center">Consulta de Producto de Certificado de Depósito
	<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="products_inq_cd.jsp, ESD0711"></h3>
<hr size="4">

<form>
  
<%int row = 0; %>	
  <h4>Clasificaci&oacute;n del Producto</h4>
  
  <table class="tableinfo">
    <tr > 
      <td > 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="trdark"> 
            <td width="50%"> 
              <div align="right">Tipo de Producto: </div>
            </td>
            <td width="50%">
              <input type="text" readonly name="E11APCTYP" size="6" maxlength="4" value="<%= cdProdInq.getE11APCTYP().trim()%>">
            </td>
          </tr> 
          <tr id="trclear"> 
            <td width="50%"> 
              <div align="right">C&oacute;digo de Producto: </div>
            </td>
            <td width="50%">
              <input type="text" readonly name="E11APCCDE" size="6" maxlength="4" value="<%= cdProdInq.getE11APCCDE().trim()%>">
            </td>
          </tr> 
          <tr id="trdark"> 
            <td width="50%"> 
              <div align="right">Descripci&oacute;n: </div>
            </td>
            <td width="50%">
              <input type="text" readonly name="E11DESCRI" size="50" maxlength="45" value="<%= cdProdInq.getE11DESCRI().trim()%>">
            </td>
          </tr> 
          <tr id="trclear"> 
            <td width="50%"> 
              <div align="right">Nombre de Mercadeo: </div>
            </td>
            <td width="50%">
              <input type="text" readonly name="E11MERCAD" size="28" maxlength="25" value="<%= cdProdInq.getE11MERCAD().trim()%>">
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
          <tr id="trdark"> 
            <td width="50%"> 
              <div align="right">C&oacute;digo de Banco: </div>
            </td>
            <td width="50%"> 
              <input type="text" readonly name="E11APCBNK" size="4" maxlength="2" value="<%= cdProdInq.getE11APCBNK().trim()%>">
            </td>
          </tr>
          <tr id="trclear"> 
            <td width="50%"> 
              <div align="right">C&oacute;digo de Moneda: </div>
            </td>
            <td width="50%"> 
              <input type="text" readonly name="E11APCCCY" size="5" maxlength="3" value="<%= cdProdInq.getE11APCCCY().trim()%>">
            </td>
          </tr>
          <tr id="trdark"> 
            <td width="50%"> 
              <div align="right">C&oacute;digo de Cuenta Contable: </div>
            </td>
            <td width="50%"> 
              <input type="text" readonly name="E11APCGLN" size="18" maxlength="16" value="<%= cdProdInq.getE11APCGLN().trim()%>">
            </td>
          </tr>
          <tr id="trclear"> 
            <td width="50%"> 
              <div align="right">Descripci&oacute;n de la Cuenta Contable: </div>
            </td>
            <td width="50%"> 
              <input type="text" readonly name="E11GLMDSC" size="45" maxlength="45" value="<%= cdProdInq.getE11GLMDSC().trim()%>">
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
				<select id="E11APCTX1" name="E11APCTX1" disabled>
				    <option value=" " selected> &nbsp; </option>
				    <option value="1" <% if(cdProdInq.getE11APCTX1().equals("1")) out.print("selected");%>> SI </option>
				    <option value="0" <% if(cdProdInq.getE11APCTX1().equals("0")) out.print("selected");%>> NO </option>
				</select>        
              </div>
            </td>
            <td nowrap width="10%"  > 
              <div align="center"> 
				<select id="E11APCTX2" name="E11APCTX2" disabled>
				    <option value=" " selected> &nbsp; </option>
				    <option value="1" <% if(cdProdInq.getE11APCTX2().equals("1")) out.print("selected");%>> SI </option>
				    <option value="0" <% if(cdProdInq.getE11APCTX2().equals("0")) out.print("selected");%>> NO </option>
				</select>        
              </div>
            </td>
            <td nowrap width="10%" > 
              <div align="center"> 
				<select id="E11APCTX3" name="E11APCTX3" disabled>
				    <option value=" " selected> &nbsp; </option>
				    <option value="1" <% if(cdProdInq.getE11APCTX3().equals("1")) out.print("selected");%>> SI </option>
				    <option value="0" <% if(cdProdInq.getE11APCTX3().equals("0")) out.print("selected");%>> NO </option>
				</select>        
              </div>
            </td>
            <td nowrap width="10%" > 
              <div align="center"> 
<%if(currUser.getE01INT().equals(ISOCodes.getIBSCountryCode("PA"))){ %> 
				<select id="E11APCTX4" name="E11APCTX4" disabled>
				    <option value=" " selected> &nbsp; </option>
				    <option value="1" <% if(cdProdInq.getE11APCTX4().equals("1")) out.print("selected");%>> SI </option>
				    <option value="0" <% if(cdProdInq.getE11APCTX4().equals("0")) out.print("selected");%>> NO </option>
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
          <tr id="trdark"> 
            <td width="50%"> 
              <div align="right">Tabla de la Tasa Variable y Tipo: </div>
            </td>
            <td width="50%"> 
              <input type="text" readonly name="E11APCFRT" size="4" maxlength="2" value="<%= cdProdInq.getE11APCFRT().trim()%>">
              <input type="text" readonly name="E11APCFTY" size="4" maxlength="2" value="<%= cdProdInq.getE11APCFTY().trim()%>">
            </td>
          </tr>
          <tr id="trclear"> 
            <td width="50%"> 
              <div align="right">Porcentaje de la Tasa Variable: </div>
            </td>
            <td width="50%"> 
              <input type="text" readonly name="E11VARRTE" size="11" maxlength="9" value="<%= cdProdInq.getE11VARRTE().trim()%>">
            </td>
          </tr>
          <tr id="trdark"> 
            <td width="50%"> 
              <div align="right">Ciclo de Revisi&oacute;n de la Tasa Variable: 
              </div>
            </td>
            <td width="50%"> 
              <input type="text" readonly name="E11APCRRD" size="5" maxlength="3" value="<%= cdProdInq.getE11APCRRD().trim()%>">
            </td>
          </tr>
          <tr id="trclear"> 
            <td width="50%"> 
              <div align="right">Tabla de Tasas: </div>
            </td>
            <td width="50%"> 
              <input type="text" readonly name="E11APCCDT" size="3" maxlength="1" value="<%= cdProdInq.getE11APCCDT().trim()%>">
              <a href="javascript:showCDRates('<%= cdProdInq.getE11APCCCY().trim()%>','<%= cdProdInq.getE11APCCDT().trim()%>');">
              	<img src="<%=request.getContextPath()%>/images/1b.gif" title=". . ." align="bottom" border="0" ></a> 
            </td>
          </tr>
          <tr id="trdark"> 
            <td width="50%"> 
              <div align="right">Per&iacute;ode Base de C&aacute;lculo: </div>
            </td>
            <td width="50%"> 
              <input type="text" readonly name="E11APCPPD" size="5" maxlength="3" value="<%= cdProdInq.getE11APCPPD().trim()%>">
            </td>
          </tr>
          <tr id="trclear"> 
            <td width="50%"> 
              <div align="right">Plazo M&iacute;nimo de Apertura: </div>
            </td>
            <td width="50%"> 
              <input type="text" readonly name="E11APCROY" size="5" maxlength="3" value="<%= cdProdInq.getE11APCROY().trim()%>">
            </td>
          </tr>
          <tr id="trdark"> 
            <td width="50%"> 
              <div align="right">N&uacute;mero de D&iacute;as para Certificado 
                Inactivo: </div>
            </td>
            <td width="50%"> 
              <input type="text" readonly name="E11APCIPD" size="5" maxlength="3" value="<%= cdProdInq.getE11APCIPD().trim()%>">
            </td>
          </tr>
          <tr id="trclear"> 
            <td width="50%"> 
              <div align="right">Excluir No Residentes: </div>
            </td>
            <td width="50%"> 
              <input type="text" readonly name="E11APCRES" size="4" maxlength="2"
			  value="<% if (cdProdInq.getE11APCRES().equals("1")) out.print("Si");
						else if (cdProdInq.getE11APCRES().equals("2")) out.print("No");
						else out.print(""); %>">
             </td>
          </tr>
          <tr id="trdark"> 
            <td width="50%"> 
              <div align="right">Tabla de Documentos: </div>
            </td>
            <td width="50%"> 
              <input type="text" readonly name="E11APCDOC" size="4" maxlength="2" value="<%= cdProdInq.getE11APCDOC().trim()%>">
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
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
              <input type="text" readonly name="E11APEAUD" size="82" maxlength="80" value="<%= cdProdInq.getE11APEAUD().trim()%>">
            </td>
          </tr>
          <tr id="trclear"> 
            <td width="50%"> 
              <div align="right">Video : </div>
            </td>
            <td width="50%"> 
              <input type="text" readonly name="E11APEVID" size="82" maxlength="80" value="<%= cdProdInq.getE11APEVID().trim()%>">
            </td>
          </tr>
          <tr id="trdark"> 
            <td width="50%"> 
              <div align="right">HTML : </div>
            </td>
            <td width="50%"> 
              <input type="text" readonly name="E11APEHTM" size="82" maxlength="80" value="<%= cdProdInq.getE11APEHTM().trim()%>">
            </td>
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
