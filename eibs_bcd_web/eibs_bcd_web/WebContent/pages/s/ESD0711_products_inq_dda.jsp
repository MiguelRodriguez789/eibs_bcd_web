<%@page import="com.datapro.eibs.constants.ISOCodes"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<%@page import="com.datapro.eibs.constants.ISOCodes"%>
<html>
<head>
<title>Consulta de Productos de Certificados</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id="ddaProdInq" class="datapro.eibs.beans.ESD071103Message"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>
<jsp:useBean id="currUser" class="datapro.eibs.beans.ESS0030DSMessage" scope="session" />

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>

<SCRIPT type="text/javascript">
<%
	if (userPO.getPurpose().equals("INQUIRY")) {
		if (userPO.getOption().equals("RT")) {
%>
  			builtNewMenu(rt_i_opt);
<%   
		} else if ( userPO.getOption().equals("SV") ) {
%>
			builtNewMenu(sv_i_opt);
<%   
		}
		boolean isReadOnly = true;
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
     	out.println("</SCRIPT>");
  	}
  	if (userPO.getPurpose().equals("INQUIRY")) { 
   		out.println("<SCRIPT> initMenu(); </SCRIPT>");
  	}
%>

<%int row = 0; %>	
<h3 align="center">Consulta de Producto de Cuentas Corrientes
	<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="products_inq_dda.jsp, ESD0711"></h3>
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
              <input type="text" readonly name="E03APCBNK" size="4" maxlength="2" value="<%= ddaProdInq.getE03APCBNK().trim()%>">
            </td>
          </tr>
          <tr id="trclear"> 
            <td width="37%"> 
              <div align="right">Tipo de Producto: </div>
            </td>
            <td width="63%"> 
              <input type="text" readonly name="E03APCTYP" size="6" maxlength="4" value="<%= ddaProdInq.getE03APCTYP().trim()%>">
              <input type="text" readonly name="E03TYPDSC" size="45" maxlength="45" value="<%= ddaProdInq.getE03TYPDES().trim()%>">
            </td>
          </tr>
          <tr id="trdark"> 
            <td width="37%"> 
              <div align="right">C&oacute;digo de Producto: </div>
            </td>
            <td width="63%"> 
              <input type="text" readonly name="E03APCCDE" size="6" maxlength="4" value="<%= ddaProdInq.getE03APCCDE().trim()%>">
            </td>
          </tr>
          <tr id="trclear"> 
            <td width="37%"> 
              <div align="right">Descripci&oacute;n: </div>
            </td>
            <td width="63%"> 
              <input type="text" readonly name="E03DESCRI" size="50" maxlength="45" value="<%= ddaProdInq.getE03DESCRI().trim()%>">
            </td>
          </tr>
          <tr id="trdark"> 
            <td width="37%"> 
              <div align="right">Nombre de Mercadeo: </div>
            </td>
            <td width="63%"> 
              <input type="text" readonly name="E03MERCAD" size="28" maxlength="25" value="<%= ddaProdInq.getE03MERCAD().trim()%>">
            </td>
          </tr>
          <tr id="trclear"> 
            <td width="37%"> 
              <div align="right">Moneda: </div>
            </td>
            <td width="63%"> 
              <input type="text" readonly name="E03APCCCY" size="5" maxlength="3" value="<%= ddaProdInq.getE03APCCCY().trim()%>">
              <input type="text" readonly name="E03CCYDSC" size="37" maxlength="35" value="<%= ddaProdInq.getE03CCYDSC().trim()%>">
            </td>
          </tr>
          <tr id="trdark"> 
            <td width="37%"> 
              <div align="right">Cuenta Contable: </div>
            </td>
            <td width="63%"> 
              <input type="text" readonly name="E03APCGLN" size="18" maxlength="16" value="<%= ddaProdInq.getE03APCGLN().trim()%>">
            </td>
          </tr>
          <tr id="trclear"> 
            <td width="37%"> 
              <div align="right">Descripci&oacute;n de Cuenta Contable: </div>
            </td>
            <td width="63%"> 
              <input type="text" readonly name="E03GLMDSC" size="45" maxlength="45" value="<%= ddaProdInq.getE03GLMDSC().trim()%>">
            </td>
          </tr>
          <tr id="trdark"> 
            <td width="37%"> 
              <div align="right">Tabla de Cargos : </div>
            </td>
            <td width="63%"> 
              <input type="text" readonly name="E03APCTAR" size="4" maxlength="2" value="<%= ddaProdInq.getE03APCTAR().trim()%>">
              <input type="text" readonly name="E03TARDSC" size="45" maxlength="45" value="<%= ddaProdInq.getE03TARDSC().trim()%>">
			  <a href="javascript:showDDAServCharge('<%= ddaProdInq.getE03APCBNK().trim()%>','<%= ddaProdInq.getE03APCTYP().trim()%>','<%= ddaProdInq.getE03APCTAR().trim()%>');"><img src="<%=request.getContextPath()%>/images/1b.gif" title=". . ." align="bottom" border="0" ></a> 
            </td>
          </tr>
          <tr id="trclear"> 
            <td width="37%"> 
              <div align="right">Tipo de Residencia: </div>
            </td>
            <td width="63%"> 
              <input type="text" readonly name="E03APCRES" size="3" maxlength="1" value="<%= ddaProdInq.getE03APCRES().trim()%>">
            </td>
          </tr>
          <tr id="trdark"> 
            <td width="37%"> 
              <div align="right">Sobregiro Permitido: </div>
            </td>
            <td width="63%"> 
              <input type="text" readonly name="E03APCAMO" size="3" maxlength="1" value="<%= ddaProdInq.getE03APCAMO().trim()%>">
            </td>
          </tr>
          <tr id="trclear"> 
            <td width="37%"> 
              <div align="right">Tabla de Documentos: </div>
            </td>
            <td width="63%"> 
              <input type="text" readonly name="E03APCDOC" size="4" maxlength="2" value="<%= ddaProdInq.getE03APCDOC().trim()%>">
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
            <td nowrap width="15%" > 
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
              <div align="center"> 
              	<%if(currUser.getE01INT().equals(ISOCodes.getIBSCountryCode("PA"))){ %>  
              		FECI 
              	<% } else if(currUser.getE01INT().equals(ISOCodes.getIBSCountryCode("CL"))) {%>
              		ITE
              	<% } %>
               </div>     
			</td>
            <td nowrap width="10%" > 
              <div align="center"> </div>
            </td>
        </tr>        
         <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="15%" > 
              <div align="center"> </div>
            </td>
            <td nowrap width="10%"  > 
              <div align="center"> 
				<select id="E03APCTX1" name="E03APCTX1" disabled>
				    <option value=" " selected> &nbsp; </option>
				    <option value="1" <% if(ddaProdInq.getE03APCTX1().equals("1")) out.print("selected");%>> SI </option>
				    <option value="0" <% if(ddaProdInq.getE03APCTX1().equals("0")) out.print("selected");%>> NO </option>
				</select>        
              </div>
            </td>
            <td nowrap width="10%"  > 
              <div align="center"> 
				<select id="E03APCTX2" name="E03APCTX2" disabled>
				    <option value=" " selected> &nbsp; </option>
				    <option value="1" <% if(ddaProdInq.getE03APCTX2().equals("1")) out.print("selected");%>> SI </option>
				    <option value="0" <% if(ddaProdInq.getE03APCTX2().equals("0")) out.print("selected");%>> NO </option>
				</select>        
              </div>
            </td>
            <td nowrap width="10%" > 
              <div align="center"> 
				<select id="E03APCTX3" name="E03APCTX3" disabled>
				    <option value=" " selected> &nbsp; </option>
				    <option value="1" <% if(ddaProdInq.getE03APCTX3().equals("1")) out.print("selected");%>> SI </option>
				    <option value="0" <% if(ddaProdInq.getE03APCTX3().equals("0")) out.print("selected");%>> NO </option>
				</select>        
              </div>
            </td>
            <td nowrap width="10%" > 
              <div align="center"> 
<%if(currUser.getE01INT().equals(ISOCodes.getIBSCountryCode("PA")) || currUser.getE01INT().equals(ISOCodes.getIBSCountryCode("CL"))){ %> 
				<select id="E03APCTX4" name="E03APCTX4" disabled>
				    <option value=" " selected> &nbsp; </option>
				    <option value="1" <% if(ddaProdInq.getE03APCTX4().equals("1")) out.print("selected");%>> SI </option>
				    <option value="0" <% if(ddaProdInq.getE03APCTX4().equals("0")) out.print("selected");%>> NO </option>
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
   
  <h4>Informaci&oacute;n Sobre Proteccion Sobregiros</h4>
  
  <table class="tableinfo">
  	<tr>
  	  <td>
  		<table cellspacing="0" cellpadding="2" width="100%" border="0">
  		  <tr id="trdark">
  			<td>
  			  <div align="right"><b>Proteccion de Sobregiro :</B></div>
  		    </td>
  		    <td colspan="3">
  			  <input type="radio" name="E03APCREL" disabled value="5"  <%if (ddaProdInq.getE03APCREL().equals("5")) out.print("checked"); %>>
              <b>Si</b> 
              <input type="radio" name="E03APCREL" disabled value="N"  <%if (ddaProdInq.getE03APCREL().equals("N")) out.print("checked"); %>>
              <b>No</b>
            </td>
          </tr>
          <tr id="trclear">
          	<td>
				<div align="right">Producto Credito Relacion :</div>
          	</td>
          	<td>
          		<input type="text"  name="E03APAPRD" size="3" maxlength="4" value="<%= ddaProdInq.getE03APARPD() %>" readonly>
          	</td>
          	<td>
          		<div align="right">Monto Maximo del Prestamo :</div>
          	</td>
          	<td>
          		<input type="text"  name="E03APAOAM" size="18" maxlength="16" value="<%= ddaProdInq.getE03APAOAM() %>" readonly>
          	</td>
          </tr>
          <tr id="trdark">
          	<td>
          		<div align="right">Tipo de Amortizacion :</div>
          	</td>
          	<td>
          		<input type="text"  name="E03APAPCR" size="3" maxlength="1" value="<%= ddaProdInq.getE03APAPCR() %>" readonly>
          	</td>
          	<td>
          		<div align="right">Monto a Amortizar :</div>
          	</td>
          	<td>
          		<input type="text"  name="E03APAPMT" size="18" maxlength="16" value="<%= ddaProdInq.getE03APAPMT() %>" readonly>
          	</td>
          </tr>
          <tr id="trclear">
          	<td>
          		<div align="right">Moneda del Pago :</div>
          	</td>
          	<td>
          		<input type="text"  name="E03APARCY" size="3" maxlength="3" value="<%= ddaProdInq.getE03APARCY() %>" readonly>
          	</td>
          	<td>
          		<div align="right">Tipo de Pago :</div>
          	</td>
          	<td>
          		<select name="E03APAPIF" disabled>
					<option value="" <%if (!ddaProdInq.getE03APAPIF().equals("F") && !ddaProdInq.getE03APAPIF().equals("%")) { out.print("selected"); }%>>N/A</option>
                	<option value="F" <%if (ddaProdInq.getE03APAPIF().equals("F")) { out.print("selected"); }%>>Fijo</option>
                	<option value="%" <%if (ddaProdInq.getE03APAPIF().equals("%")) { out.print("selected"); }%>> % del principal</option>
                </select>
          	</td>
          </tr>
          <tr id="trdark">
          	<td>
          		<div align="right">Incluye Interes en Pago :</div>
          	</td>
          	<td>
          		<input type="radio" name="E03APAIIP" disabled value="Y"  <%if (ddaProdInq.getE03APAIIP().equals("Y")) out.print("checked"); %>>
              	Si 
              	<input type="radio" name="E03APAIIP" disabled value="N"  <%if (ddaProdInq.getE03APAIIP().equals("N")) out.print("checked"); %>>
              	No
          	</td>
          	<td>
          		<div align="right">Transferir en Multiplos de :</div>
          	</td>
          	<td>
          		
              <input type="text"  name="E03APAMUL" size="18" maxlength="16" value="<%= ddaProdInq.getE03APAMUL() %>" readonly>
          	</td>
          </tr>
          <tr id="trclear">
          	<td>
          		<div align="right">Balance Minimo en Cuenta :</div>
          	</td>
          	<td>
          		
              <input type="text"  name="E03APAMIN" size="18" maxlength="16" value="<%= ddaProdInq.getE03APAMIN() %>" readonly>
          	</td>
          	<td>
          		<div align="right">Tipo de Cobertura :</div>
          	</td>
          	<td>
          		<select name="E03APAGLT" disabled>
                	<option value="1" <%if (ddaProdInq.getE03APAGLT().equals("1")) { out.print("selected"); }%>>Linea</option>
                	<option value="2" <%if (ddaProdInq.getE03APAGLT().equals("2")) { out.print("selected"); }%>>Cierre Dia</option>
                </select>
          	</td>
          </tr>
          <tr id="trclear">
          	<td>
          		<div align="right">Ciclo de Revision :</div>
          	</td>
          	<td colspan="3"> 
              <input type="text"  name="E03APARPD" size="4" maxlength="3" value="<%= ddaProdInq.getE03APARPD()%>" readonly>
              <select name="E03APARFL" disabled>
                	<option value="D" <%if (ddaProdInq.getE03APARFL().equals("D")) { out.print("selected"); }%>>Diario</option>
                	<option value="M" <%if (ddaProdInq.getE03APARFL().equals("M")) { out.print("selected"); }%>>Mes</option>
                	<option value="Y" <%if (ddaProdInq.getE03APARFL().equals("Y"))   { out.print("selected"); }%>>Anual</option>
              	</select>
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
              <input type="text" readonly name="E03APEAUD" size="82" maxlength="80" value="<%= ddaProdInq.getE03APEAUD().trim()%>">
            </td>
          </tr>
          <tr id="trclear"> 
            <td width="50%"> 
              <div align="right">Video : </div>
            </td>
            <td width="50%"> 
              <input type="text" readonly name="E03APEVID" size="82" maxlength="80" value="<%= ddaProdInq.getE03APEVID().trim()%>">
            </td>
          </tr>
          <tr id="trdark"> 
            <td width="50%"> 
              <div align="right">HTML : </div>
            </td>
            <td width="50%"> 
              <input type="text" readonly name="E03APEHTM" size="82" maxlength="80" value="<%= ddaProdInq.getE03APEHTM().trim()%>">
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  
</form>
</body>
</html>
