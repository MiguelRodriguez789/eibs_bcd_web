<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<%@page import="datapro.eibs.beans.IdentificationData"%>
<%@page import="com.datapro.eibs.constants.ISOCodes"%>
<%@page import="java.util.logging.*"%>
<%@page import="com.datapro.constants.EibsFields"%>
<%@page import="datapro.eibs.beans.DataAddress"%>
<%@page import="datapro.eibs.services.ParametersServices"%>
<%@page import="datapro.eibs.master.*"%>
<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<html>
<head>
<title>Informacion Basica</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Studio">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">


<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>
 
<jsp:useBean id= "client" class= "datapro.eibs.beans.ESD008002Message"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />

   <SCRIPT type="text/javascript">
<% 
	String titcli = (client.getE02TYP().equals("U")?"Usuario":"Cliente");
	if (!client.getE02TYP().equals("U")) { %>             
   		builtNewMenu(client_inq_corp_opt);
<% } %>

   </SCRIPT>

</head>

<body>

<% 
 if ( !error.getERRNUM().equals("0")  ) {
     error.setERRNUM("0");
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
 }
 if ( !userPO.getPurpose().equals("NEW") && !client.getE02TYP().equals("U") ) {
    out.println("<SCRIPT> initMenu(); </SCRIPT>");
 }
 
%> 

 <h3 align="center">Informaci&oacute;n <%=titcli%> Empresa  <img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="client_inq_corp_basic, ESD0080" ></h3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSESD0080">
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="12">
  
    <%if( client.getH02SCR().equals("07")){%> 	
		<jsp:include page="ESD0080_ident_template_panama.jsp" flush="true">
			<jsp:param name="messageName" value="client" />
			<jsp:param name="readOnly" value="true" />
			<jsp:param name="title" value="Identificaci&oacute;n" />
			<jsp:param name="suffix" value="02" />
		</jsp:include>
	
	<%} else {%> 
		<jsp:include page="ESD0080_ident_template_generic.jsp" flush="true">
			<jsp:param name="messageName" value="client" />
			<jsp:param name="readOnly" value="true" />
			<jsp:param name="title" value="Identificaci&oacute;n" />
			<jsp:param name="suffix" value="02" />

		</jsp:include>
	<%} %>   
  
  <br/>
  <%int row = 0; %>
	<h4>Raz&oacute;n Social</h4>
  <div align="center">
    <table class="tableinfo" >
      <tr > 
        <td nowrap > 
          <table cellspacing="0" cellpadding="2" width="100%" border="0" align="left" class="fixed2col">
            <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
              <td nowrap  width="23%" align="right"><b>No <%=titcli%> : <%= client.getE02CUN()%> </b></td>
			  <td align="center" valign="top" style="color:red;font-size:12;">
                	<b><%= client.getD02CRT().trim()%></b> 
              </td>
              <td nowrap> 
              </td>
            </tr>
            <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
              <td nowrap width="44%" align="right">Nombre Legal :</td>
              <td nowrap   width="56%">  
                <input type="text" readonly name="E02NA1" size="62" value="<%= client.getE02NA1().trim()%>">
                </td>
            </tr>
            <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
              <td nowrap  width="44%"> 
                <p align="right">Nombre Anterior 
                  :</p>
              </td>
              <td nowrap  width="56%">  
                <input type="text" readonly name="E02CP1" size="31" value="<%= client.getE02CP1().trim()%>">
                </td>
            </tr>
            <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
              <td nowrap  width="44%"> 
                <div align="right">Nombre Corto 
                  :</div>
              </td>
              <td nowrap  width="56%">  
                <input type="text" readonly name="E02SHN" size="28" value="<%= client.getE02SHN().trim()%>">
                </td>
            </tr>
            <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
              <td nowrap  width="44%"> 
                <div align="right">Nombre Comercial :</div>
              </td>
              <td nowrap  width="56%">  
                <input type="text" readonly name="E02FN2" size="31" value="<%= client.getE02FN2().trim()%>">
                </td>
            </tr>
           <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
              <td nowrap  width="44%"> 
                <div align="right"></div>
              </td>
              <td nowrap  width="56%">  
                <input type="text" readonly name="E02LN1" size="31" value="<%= client.getE02LN1().trim()%>">
                </td>
            </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="39%">  
              <div align="right">Pagina WEB :</div>
            </td>
            <td nowrap colspan="3"> 
               	<eibsinput:text property="E02WEB" name="client" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_WEB %>" readonly="true"/>
            </td>
          </tr>
            
<%-- 
	        <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
	            <td nowrap="nowrap" width="20%" align="right">RFC :</td>
	            <td nowrap="nowrap" width="30%" colspan="3" > 
	            	<eibsinput:text name="client" property="E02RFC01" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_CHAR %>" size="6" maxlength="3" readonly="true" />
	            	<eibsinput:text name="client" property="E02RFC02" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_INTEGER %>" size="8" maxlength="6" readonly="true"  />
	            	<eibsinput:text name="client" property="E02RFC03" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_CHAR %>" size="4" maxlength="2" readonly="true"  />
	            	<eibsinput:text name="client" property="E02RFC04" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_CHAR %>" size="2" maxlength="1" readonly="true"  />

	 	        </td>
	        </tr>
--%>
            
			<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
              <td nowrap width="30%"> 
                <div align="right">Pa&iacute;s de Origen :</div>
              </td>
              <td nowrap width="70%" >  
                <input type="text" readonly name="D02GEC" size="45" maxlength="45" value="<%= client.getD02GEC().trim()%>">
                </td>
			</tr>
            <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
              <td nowrap  width="30%"> 
                <div align="right">Tipo de Empresa :</div>
              </td>
              <td nowrap  width="70%">  
                <input type="text" readonly name="E02EDL" size="50" maxlength="45" value="<%= client.getD02EDL().trim()%>">
                </td>
            </tr>
            <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
              <td nowrap  width="30%"> 
                <div align="right">SUPER - Naturaleza Jurídica :</div>
              </td>
              <td nowrap  width="70%">  
                <input type="text" readonly name="E02PI4" size="50" maxlength="45" value="<%= client.getD02PI4().trim()%>">
                </td>
            </tr>
            <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
              <td nowrap  width="30%"> 
                <div align="right">SUPER - Tipo de Entidad :</div>
              </td>
              <td nowrap  width="70%">  
                <input type="text" readonly name="E02TI4" size="50" maxlength="45" value="<%= client.getD02TI4().trim()%>">
                </td>
            </tr>
            <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
              <td nowrap  width="30%"> 
                <div align="right">SUPER - Código de Entidad :</div>
              </td>
              <td nowrap  width="70%">  
                <input type="text" readonly name="E02ID4" size="50" maxlength="45" value="<%= client.getE02ID4().trim()%>">
                </td>
            </tr>
			<% if(client.getH02SCR().equals("03")){ %>
            <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
				<td nowrap align="right">No. de Registro :
				</td>
	            <td nowrap colspan="3">
	            <input type="text" readonly name="E02REN" size="30" maxlength="25" value="<%= client.getE02REN().trim()%>">
				</td>
	          </tr>
			<% } %>
			<% if(client.getH02SCR().equals("07")){ %>
            <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
	          	<td nowrap> 
	                 <div align="right">Reglamento Único :</div>
	            </td>
	            <td nowrap colspan="2"> 
				<input type="text" readonly name="E02FL5" size="3" maxlength="3" value="<% if (client.getE02FL5().equals("Y")) { out.print("Sí"); } else { out.print("No"); } %>" >
	            </td>
	            </tr>
			<% }  %>
          </table>
        </td>
      </tr>
    </table>
  </div>
  
  <div align="center" class="print">
    <h4>Fechas</h4>
    <table class="tableinfo">
      <tr > 
        <td nowrap> 
          <table cellspacing="0" cellpadding="2" width="100%" border="0" align="left">
            <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
              <td nowrap width="25%" align="right">Fecha de Constituci&oacute;n :</td>
              <td nowrap width="25%">  
                <eibsinput:date name="client" fn_year="E02BDY" fn_month="E02BDM" fn_day="E02BDD" readonly="true"/>
              </td>
              <td nowrap width="25%" align="right">Fecha de Diligenciamiento :</td>
              <td nowrap width="25%">  
                <eibsinput:date name="client" fn_year="E02IDY" fn_month="E02IDM" fn_day="E02IDD" readonly="true"/>
              </td>
            </tr>
            <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
              <td nowrap align="right">Fecha Inicio de Operaciones :</td>
              <td nowrap>  
                <eibsinput:date name="client" fn_year="E02IEY" fn_month="E02IEM" fn_day="E02IED" readonly="true"/>
              </td>
              <td nowrap align="right">Fecha de Registro :</td>
              <td nowrap>  
                <eibsinput:date name="client" fn_year="E02REY" fn_month="E02REM" fn_day="E02RED" readonly="true"/>
              </td>
            </tr>
          </table>
        </td>
      </tr>
    </table>
    
    
    <div  id="address01"  class="print">
    
	        <% 	String country = client.getE02CUMADC().trim();
	        	String pageName = DataAddress.getTemplatePage(request,ISOCodes.getIBSCountryCode(country).trim(), client);
	        	Logger.getLogger(this.getClass().getName()).log(Level.FINE, "Using template: " + pageName);
	        %>	<jsp:include page="<%= pageName %>" flush="true">
		<jsp:param name="index" value="01" />
		<jsp:param name="suffix" value="E02CUM" />
		<jsp:param name="title" value="Direcci&oacute;n" />
		<jsp:param name="messageName"  value="client" />
		<jsp:param name="readOnly"  value="true" />
		<jsp:param name="basic"  value="true" />
		<jsp:param name="simple" value="false" />
		<jsp:param name="showWeb" value="false" />
	</jsp:include>
	
	</div>	
  </div>
  <div align="center" class="print">
    <h4>Tel&eacute;fonos</h4>
    <table class="tableinfo">
      <tr > 
        <td nowrap> 
          <table cellspacing="0" cellpadding="2" width="100%" border="0" align="left">
          <tr id="trdark"> 
            <td nowrap width="27%"> 
              <div align="right">Tel&eacute;fono Oficina 1 :</div>
            </td>
            <td nowrap width="21%"> 
	           <input type="text" name="E02HPN" size="15" readonly value="<%= client.getE02HPN().trim()%>">
             </td>
            <td nowrap width="29%"> 
              <div align="right">Tel&eacute;fono Oficina 2 :</div>
            </td>
            <td nowrap width="23%"> 
              <input type="text" name="E02PHN" size="15" readonly value="<%= client.getE02PHN().trim()%>" >
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="27%" >  
              <div align="right">Tel&eacute;fono Fax :</div>
            </td>
            <td nowrap width="21%" > 
              <input type="text" name="E02FAX" size="15" readonly value="<%= client.getE02FAX().trim()%>">
            </td>
            <td nowrap width="29%" > 
              <div align="right">Tel&eacute;fono Celular :</div>
            </td>
            <td nowrap width="23%" > 
              <input type="text" name="E02PH1" size="15" readonly value="<%= client.getE02PH1().trim()%>"> 
            </td>
          </tr>
          </table>
        </td>
      </tr>
    </table>
    
  </div>
  
  <div align="center" class="print">
  <h4>Perfil de Negocios</h4>
    <table class="tableinfo">
      <tr > 
        <td nowrap> 
          <table cellspacing="0" cellpadding="2" width="100%" border="0" align="left">
            <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
              <td nowrap width="20%"> 
                <div align="right">Tama&ntilde;o de la Empresa :</div>
              </td>
              <td nowrap width="30%"> 
                <input type="text" name="E02SEX" readonly size="11" 
                	<% if (client.getF02SEX().equals("Y")) out.print("class=\"txtchanged\""); %>
              		value="<% if (client.getE02SEX().equals("1")) { out.print("Microempresa"); }
						else if (client.getE02SEX().equals("2")) { out.print("Pequeña"); }
						else if (client.getE02SEX().equals("3")) { out.print("Mediana"); }
						else if (client.getE02SEX().equals("4")) { out.print("Grande"); }
						else { out.print(""); } %>" >
              </td>
              <td nowrap> 
                <DIV align="right">Fuente de Ingresos :</DIV>
              </TD>
              <td nowrap>  
                <input type="text" name="D02SOI" size="55" value="<%= client.getD02SOI().trim()%>" readonly>
                </TD>
            </tr>
			<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
              <td nowrap width="20%" width="22%"> 
                <div align="right">Capital Inicial :</div>
              </td>
              <td nowrap width="30%"> 
                <input type="text" readonly name="E02CAI" size="16" maxlength="15" value="<%= client.getE02CAI().trim()%>"></td>
              <td nowrap width="20%"> 
                <div align="right">Capital Suscrito :</div>
              </td>
              <td nowrap  width="30%"> 
                <input type="text" readonly name="E02CAS" size="16" maxlength="15" value="<%= client.getE02CAS().trim()%>">
              </td>
            </tr>
            <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
              <td nowrap width="20%"> 
                <div align="right">Capital Pagado :</div>
              </td>
              <td nowrap width="30%"> 
                <input type="text" readonly name="E02CAP" size="16" maxlength="15" value="<%= client.getE02CAP().trim()%>">
              </td>
              <td nowrap width="20%"> 
                <div align="right">Nivel de Ventas :</div>
              </td>
              <td nowrap width="30%"> 
                <input type="text" readonly name="E02INL" size="2" maxlength="1" value="<%= client.getE02INL().trim()%>">
              </td>
            </tr>
            
            <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
              <td nowrap width="20%"> 
                <div align="right">Número de Empleados :</div>
              </td>
              <td nowrap width="30%"   > 
                <input type="text" name="E02FCT5" size="8" value="<%= client.getE02FCT5().trim()%>" readonly="readonly" >
              </td>
              <td nowrap align="right"> 
                <div align="right">Ventas o Ingresos Netos :</div>
              </td>
              <td nowrap  > 
                <input type="text" name="E02AM5" size="17" value="<%= client.getE02AM5().trim()%>" readonly="readonly" >
              </td>
              
            </tr>

            
            <%--
            <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
              <td nowrap  width="20%"> 
                <div align="right">No. de Acciones :</div>
              </td>
              <td nowrap width="30%"> 
                <input type="text" readonly name="E02NST" size="8" maxlength="7" value="<%= client.getE02NST().trim()%>">
              </td>
              <td nowrap width="20%" width="18%"> 
                <div align="right">No. de Accionistas :</div>
              </td>
              <td nowrap width="30%"> 
                <input type="text" readonly name="E02NSH" size="8" maxlength="7" value="<%= client.getE02NSH().trim()%>">
              </td>
            </tr>
            --%>
          </table>
        </td>
      </tr>
    </table>
</div>
  <div align="center" class="print">
    <h4>C&oacute;digo de Clasificaci&oacute;n</h4>
    <table class="tableinfo">
      <tr > 
        <td nowrap> 
          <table cellspacing="0" cellpadding="2" width="100%" border="0" align="left" class="fixed2col" >
            <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
              <td nowrap width="30%"> 
                <div align="right">Oficial Principal :</div>
              </td>
              <td nowrap width="70%" >  
	            <input type="text" readonly name="E02OFC" size="5" value="<%= client.getE02OFC().trim()%>">
                <input type="text" readonly name="D02OFC" size="55" value="<%= client.getD02OFC().trim()%>">
                </td>
            </tr>
            <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
              <td nowrap width="30%"> 
				<div align="right"><%= ParametersServices.getCnofTableDesc(request, "10") %> :</div>
              </td>
              <td nowrap width="70%" > 
	            <input type="text" readonly name="E02OF2" size="5" value="<%= client.getE02OFC().trim()%>">
                <input type="text" readonly name="D02OF2" size="55" value="<%= client.getD02OF2().trim()%>">
                </td>
            </tr>
            <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
              <td nowrap width="30%"> 
                <div align="right"><%= ParametersServices.getCnofTableDesc(request, "09") %> :</div>
              </td>
              <td nowrap width="70%" >  
	            <input type="text" readonly name="E02INC" size="5" value="<%= client.getE02INC().trim()%>">
                <input type="text" readonly name="D02INC" size="55" value="<%= client.getD02INC().trim()%>">
                </td>
            </tr>
            <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
              <td nowrap width="30%"> 
                <div align="right"><%= ParametersServices.getCnofTableDesc(request, "12") %> :</div>
              </td>
              <td nowrap width="70%" > 
	            <input type="text" readonly name="E02BUC" size="5" value="<%= client.getE02BUC().trim()%>">
                <input type="text" readonly name="D02BUC" size="55" value="<%= client.getD02BUC().trim()%>" >
                </td>
            </tr>
            <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
              <td nowrap width="30%"> 
                <div align="right"><%= ParametersServices.getCnofTableDesc(request, "1A") %> :</div>
              </td>
              <td nowrap  width="70%" > 
	            <input type="text" readonly name="E02UC1" size="5" value="<%= client.getE02UC1().trim()%>">
                <input type="text" readonly name="D02UC1" size="55" value="<%= client.getD02UC1().trim()%>">
                </td>
            </tr>
            <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
              <td nowrap width="30%"> 
                <div align="right"><%= ParametersServices.getCnofTableDesc(request, "1B") %> :</div>
              </td>
              <td nowrap width="70%" >  
	            <input type="text" readonly name="E02UC2" size="5" value="<%= client.getE02UC2().trim()%>">
                <input type="text" readonly name="D02UC2" size="55" value="<%= client.getD02UC2().trim()%>">
                </td>
            </tr>
            <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
              <td nowrap width="30%"> 
                <div align="right">
				<div align="right">
				<div align="right"><%= ParametersServices.getCnofTableDesc(request, "1C") %> :</div>
				</div>
				</div>
              </td>
              <td nowrap width="70%" > 
	            <input type="text" readonly name="E02UC3" size="5" value="<%= client.getE02UC3().trim()%>">
                <input type="text" readonly name="D02UC3" size="55" value="<%= client.getD02UC3().trim()%>">
                </td>
            </tr>
            <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
              <td nowrap width="30%"> 
                <div align="right"><%= ParametersServices.getCnofTableDesc(request, "1D") %> :</div>
              </td>
              <td nowrap width="70%" > 
	            <input type="text" readonly name="E02UC4" size="5" value="<%= client.getE02UC4().trim()%>">
                <input type="text" readonly name="D02UC4" size="55" value="<%= client.getD02UC4().trim()%>">
                </td>
            </tr>
            <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
              <td nowrap width="30%"> 
                <div align="right"><div align="right">
				<div align="right"><%= ParametersServices.getCnofTableDesc(request, "1E") %> :</div>
				</div>
				</div>
              </td>
              <td nowrap width="70%" >  
	            <input type="text" readonly name="E02UC5" size="5" value="<%= client.getE02UC5().trim()%>">
                <input type="text" readonly name="D02UC5" size="55" value="<%= client.getD02UC5().trim()%>">
                </td>
            </tr>
            <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
              <td nowrap width="30%"> 
                <div align="right"><%= ParametersServices.getCnofTableDesc(request, "1F") %> :</div>
              </td>
              <td nowrap width="70%" >  
	            <input type="text" readonly name="E02UC6" size="5" value="<%= client.getE02UC6().trim()%>">
                <input type="text" readonly name="D02UC6" size="55" value="<%= client.getD02UC6().trim()%>">
                </td>
            </tr>
          </table>
        </td>
      </tr>
    </table>
  </div>
  
<%if(Boolean.valueOf(JSEIBSProp.getProperty("eIBS.showFatca"))) {%>  
    <h4>Fatca</h4>
     <table class="tableinfo">
      <tr> 
        <td nowrap> 
    <table cellspacing="0" cellpadding="2" width="100%" border="0">
    <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
              <TD nowrap width="22%" align="right"> 
                 <div align="right"> Origen:</div>
               </td>
               <td > 
                <INPUT type="radio" onclick="showFields('C')" disabled="disabled" name="F02L08" value="C" <% if (client.getF02L08().equals("C")) out.print("checked"); %>> Corporación Estadounidense
                <INPUT type="radio" onclick="showFields('N')" disabled="disabled" name="F02L08" value="N" <% if (!client.getF02L08().equals("C")) out.print("checked"); %>> Ninguno
               </td>
              </tr>
    <tr name="fatcaRow" class="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>" style="<%if (!client.getF02L08().equals("C")) out.print("display:none"); %>"> 
         <td  nowrap>
         <div align="right">Autoriza  FATCA Reporting (N/Y)?</div>
         </td>
         <td  nowrap align="left"> 
 
             <INPUT type="radio" name="F02L09" disabled="disabled" value="Y"  <% if (client.getF02L09().equals("Y")) out.print("checked"); %>>  Si
             <INPUT type="radio" name="F02L09" disabled="disabled" value="N"  <% if (client.getF02L09().equals("N")) out.print("checked"); %> <% if (client.getF02L09().equals("")) out.print("checked"); %> > No
         </td>    
         </tr>

    <tr name="fatcaRow" class="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>" style="<%if (!client.getF02L08().equals("C")) out.print("display:none"); %>"> 
		<td nowrap>
			<div align="right"> TIN:</div>
		</td>
		<td nowrap> 
			<eibsinput:text property="E02FIDU" name="client" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_IDENTIFICATION %>" readonly="true" />
		</td>
	</tr>
	<%if(Boolean.valueOf(JSEIBSProp.getProperty("eIBS.showFatcaExpiration"))) {%>  
	    <tr name="fatcaRow" class="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>" style="<%if (!client.getF02L08().equals("C")) out.print("display:none"); %>"> 
			<td nowrap="nowrap" >
				<div align="right">Fecha de Vencimiento(Fatca) :</div>
			</td>
			<td nowrap="nowrap" >
				<eibsinput:date name="client" fn_day="E02CUFD2D" fn_month="E02CUFD2M" fn_year="E02CUFD2Y" readonly="true"/>
			</td>
		</tr>	
	<% } %>	
	</table>
     </td>
     </tr>
   </table>
<% } %>
    


  <div align="center" class="print">
  <h4>Datos Operativos</h4>
    <table class="tableinfo">
      <tr > 
        <td  nowrap> 
          <table cellspacing="0" cellpadding="2" width="100%" border="0" align="left">
            <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
              <td nowrap width="28%"> 
                <div align="right">Estado del Cliente  :</div>
              </td>
              <td nowrap  width="28%" bordercolor="#FFFFFF">  
                <input type="text" readonly name="E02STS" size="25" 
				value="<% if (client.getE02STS().equals("1")) { out.print("Inctivo"); }
                    	  else if (client.getE02STS().equals("2")) { out.print("Activo"); }
                          else if (client.getE02STS().equals("3")) { out.print("Lista de Control"); }
  						  else if (client.getE02STS().equals("4")) { out.print("Disuelta"); }
  						  else if (client.getE02STS().equals("5")) { out.print("Bloqueo Permite Pagos"); }
  						  else if (client.getE02STS().equals("6")) { out.print("Bloqueo Total"); }
                          else { out.print(""); } %>">
                </td>
              <td nowrap  width="22%"> 
                <div align="right">Clase de Cliente 
                  :</div>
              </td>
              <td nowrap  width="22%" >  
                <input type="text" readonly name="E02CCL" size="55" value="<%= client.getD02CCL().trim()%>">
                </td>
            </tr>
            <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
              <td nowrap  width="28%"> 
                <div align="right">Tipo de Cliente 
                  :</div>
              </td>
              <td nowrap width="28%" bordercolor="#FFFFFF">  
              <input type="text" readonly name="E02TYP" size="10"  
    		  value="<% if (client.getE02TYP().equals("R")) { out.print("Regular"); }
						else if (client.getE02TYP().equals("M")) { out.print("Master"); }
		                else if (client.getE02TYP().equals("G")) { out.print("Grupo"); }
						else { out.print(""); } %>">
		  	</td>
              <td nowrap  width="22%"> 
                <div align="right">No. de Grupo :</div>
              </td>
              <td nowrap  width="22%">  
                <input type="text" readonly name="E02GRP" size="10" value="<%= client.getE02GRP().trim()%>">
                </td>
            </tr>
            <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
              <td nowrap  width="28%"> 
                <div align="right">Lenguaje :</div>
              </td>
              <td nowrap width="28%" bordercolor="#FFFFFF">  
                <input type="text" readonly name="E02LIF" size="10"  
			  value="<% if (client.getE02LIF().equals("E")) { out.print("Ingles"); } 
                		else if (client.getE02LIF().equals("S")) { out.print("Español"); }
						else { out.print(""); } %>" >
              </td>
              <td nowrap  width="22%" align="right">Forma de Calificaci&oacute;n :</td>
              <td nowrap width="22%">  
                <input type="text" readonly name="E02FL2" size="2" value="<%= client.getE02FL2().trim()%>">
                </td>
            </tr>
        	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="23%" align="right">Impuestos :</td>
            <td nowrap width="36%"> 
				<input type="radio" name="E02TAX" value="1" <%if (client.getE02TAX().equals("1")) out.print("checked"); %> disabled="disabled"> Si 
				<input type="radio" name="E02TAX" value="N" <%if (client.getE02TAX().equals("N")) out.print("checked"); %> disabled="disabled"> No
            </td>
            <td nowrap width="25%" align="right">Tabla de Provisi&oacute;n :</td>
            <td nowrap width="16%">
                <input type="text" name="E02PRV" size="4" readonly value="<%= client.getE02PRV().trim()%>">
            </td>
        	</tr>
        <tr class="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap="nowrap" width="20%"> 
				<div align="right">Nivel de Riesgo :</div>
            </td>
            <td nowrap="nowrap"  width="30%"> 
                <input type="text" readonly name="D02RSL" size="55" maxlength="45" value="<%= client.getD02RSL().trim()%>">
            </td>
            <td nowrap="nowrap"  width="20%"> 
				<%if(Boolean.valueOf(JSEIBSProp.getProperty("eIBS.showRiskExpiration"))) {%>
					<div align="right">Fecha de Vencimiento(Riesgo) :</div>
				<% } %>
            </td>
            <td nowrap="nowrap" width="30%"> 
				<%if(Boolean.valueOf(JSEIBSProp.getProperty("eIBS.showRiskExpiration"))) {%>
					<eibsinput:date name="client" fn_month="E02CUFD1M" fn_day="E02CUFD1D" fn_year="E02CUFD1Y" readonly="true"/>
				<% } %>
            </td>
		</tr>           	
            <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
              
            <td nowrap width="18%"> 
              <div align="right">Fuente :</div>
              </td>
              
            <td nowrap > 
               <%
              	boolean bTesoreria = (client.getE02FL8().indexOf("T") > -1);
              	boolean bFideicomiso = (client.getE02FL8().indexOf("F") > -1);
              	boolean bFEM = (client.getE02FL8().indexOf("E") > -1);
              	boolean bTerceros = (client.getE02FL8().indexOf("R") > -1);
              %>
              <INPUT type="checkbox" disabled name="E02FL8_TES" value="1" <% if (bTesoreria == true) out.print("checked"); %> >Tesoreria
              <INPUT type="checkbox" disabled name="E02FL8_FID" value="1" <% if (bFideicomiso == true) out.print("checked"); %> >Fideicomiso
              <INPUT type="checkbox" disabled name="E02FL8_FEM" value="1" <% if (bFEM == true) out.print("checked"); %> >FEM
              <INPUT type="checkbox" disabled name="E02FL8_TER" value="1" <% if (bTerceros == true) out.print("checked"); %> >Terceros
             </td>
             <td nowrap="nowrap">
                <div align="right">Nivel de Consulta </div>
             </td>
             <td nowrap="nowrap">
				<input type="text" readonly name="E02ILV" size="1" value="<%= client.getE02ILV().trim()%>">
             </td>
          </tr>  

          </table>
        </td>
      </tr>
    
    </table>
  </div>

  <div align="center" class="print">
    <h4>Datos Adicionales</h4>

    <table class="tableinfo">
      <tr > 
        <td  nowrap> 
          <table cellspacing="0" cellpadding="2" width="100%" border="0" align="left">
            <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
              <td nowrap  width="18%"> 
                <div align="right">Referido por :</div>
              </td>
              <td nowrap  width="39%">  
                <input type="text" readonly name="E02RBY" size="5" maxlength="4" value="<%= client.getE02RBY().trim()%>">
                <input type="text" readonly name="E02RBN" size="45" maxlength="45" value="<%= client.getE02RBN().trim()%>">
              </td>
<%--
               <td nowrap> 
                <div align="right">Tipo de Rel. Familiar :</div>
              </td>
              <td nowrap>  
                <input type="text" name="E02FL3" readonly size="5" maxlength="4" 
              		value="<% if (client.getE02FL3().equals("1")) { out.print("Ninguno"); }
						else if (client.getE02FL3().equals("2")) { out.print("Primo(a)"); }
						else if (client.getE02FL3().equals("3")) { out.print("Padre"); }
						else if (client.getE02FL3().equals("4")) { out.print("Madre"); }
               			else if (client.getE02FL3().equals("5")) { out.print("Hermano(a)"); }
						else if (client.getE02FL3().equals("6")) { out.print("Esposo(a)"); }
               			else if (client.getE02FL3().equals("7")) { out.print("Abuelo(a)"); }
						else { out.print(""); } %>" >
              </td> 
--%>

            </tr>         
          </table>
        </td>
      </tr>
    </table> 
  </div>
	<div align="center"> 
		<input id="PRINTBTN" class="EIBSBTN" type=button name="Submit" OnClick="doPrint()" value="Imprimir">
	</div>  
 </form>

<script type="text/javascript">
function doPrint(){
	document.getElementById('PRINTBTN').style.visibility = 'hidden';
    window.focus();
    if (document.queryCommandSupported("print")) {
    	document.execCommand('print', false, null);
    } else {
		window.print();
	}
	document.getElementById('PRINTBTN').style.visibility = 'visible';
	return;
}
</script>
  
</body>
</html>
