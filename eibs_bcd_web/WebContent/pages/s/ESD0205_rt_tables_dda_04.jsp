<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput"%>
<%@page import="com.datapro.constants.EibsFields"%>
<%@page import="com.datapro.eibs.constants.HelpTypes"%>
<html>
<head>
<META name="GENERATOR" content="IBM WebSphere Page Designer V4.0 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<title>Cargos x Servicios</title>
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "charges" class= "datapro.eibs.beans.ESD020502Message"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>
 
</head>

<body bgcolor="#FFFFFF">

<% 
 if ( !error.getERRNUM().equals("0")  ) {
     error.setERRNUM("0");
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
 }
 
 %> 
 
 
<h3 align="center">Cuentas de Ahorro<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="rt_tables_dda_04, ESD0205" ></h3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.params.JSESD0205">
  <p>
    <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="200">
    <input type=HIDDEN name= "E02RTEACD" value="<%=charges.getE02RTEACD()%>">
  </p>
  <h4>Informaci�n B�sica</h4>
  
  
  <table class="tableinfo">
          <tr > 
        <td nowrap> 
        <%int row = 0; %> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" align="left" >

          <tr id="trdark"> 
            <td nowrap width="25%"> 
              <div align="right">Banco :</div>
            </td>
            <td nowrap> 
              <div align="left"> 
                <input type="text" name="E02RTEBNK" readonly size="3" maxlength="2" value="<%=charges.getE02RTEBNK().trim()%>">
              </div>
            </td>
            
            <td nowrap width="25%">
              <div align="right">Producto :</div>
            </td>
            <td nowrap>
              <input type="text" name="E02RTEATY" readonly size="5" maxlength="4" value="<%=charges.getE02RTEATY().trim()%>">
             </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="25%"> 
              <div align="right">Tabla :</div>
            </td>
            <td nowrap> 
              <div align="left"> 
                <input type="text" name="E02RTETAR" readonly size="3" maxlength="2" value="<%=charges.getE02RTETAR().trim()%>">
              </div>
            </td>
            
            <td nowrap width="25%" align=right> 
              Cliente :
            </td>
            <td nowrap colspan=3>  
              <input type="text" name="E02RTECUN" readonly size="10" maxlength="9" value="<%=charges.getE02RTECUN().trim()%>">
             </td>
          </tr>


        </table>
        </td>
      </tr>


</table>
  <h4>Cargos Por Servicios</h4>
  <table class="tableinfo">
      <tr > 
        <td nowrap> 
          
        <table cellspacing="0" cellpadding="2" width="100%" border="0" align="left" >
           <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
	           	<td nowrap width="25%">
					<div align="right">Moneda Comisi&oacute;n :</div>
				</td>
				<td nowrap width="25%">
	 	 			<eibsinput:help name="charges" property="E02RTEFCY" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CURRENCY %>" fn_param_one="E02RTEFCY" fn_param_two="document.forms[0].E02RTEBNK.value"  required="true" />
				</td>
        	    <td nowrap width="25%">
				    <div align="right">Descripci&oacute;n :</div>
			    </td>
			    <td nowrap width="25%">
 		            <eibsinput:text name="charges" property="E02RTEDSC" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_NAME %>" required="true"/>
			    </td>			  
		  </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap width="25%"> 
              <div align="right">Cargo por Envio de Correo :</div>
            </td>
            <td nowrap width="25%"> 
              <div align="left"> 
                <input type="text" class="txtright"  name="E02RTESTC" size="10" maxlength="9" value="<%= charges.getE02RTESTC()%>">
              </div>
            </td>
            <td nowrap width="25%"> 
              <div align="right">Valor L&iacute;mite :</div>
            </td>
            <td nowrap width="25%"> 
              <div align="left"> 
                <input type="text" class="txtright"  name="E02RTEMBM" size="15" maxlength="13" value="<%= charges.getE02RTEMBM()%>">
                <select name="E02RTEBT1">
                  <option value=" " <% if (!(charges.getE02RTEBT1().equals("NT") ||charges.getE02RTEBT1().equals("GR")||charges.getE02RTEBT1().equals("AN")||charges.getE02RTEBT1().equals("AG"))) out.print("selected"); %>></option>
                  <option value="NT" <%if (charges.getE02RTEBT1().equals("NT")) { out.print("selected"); }%>>Balance 
                  Neto</option>
                  <option value="GR" <%if (charges.getE02RTEBT1().equals("GR")) { out.print("selected"); }%>>Balance 
                  Global</option>
                  <option value="AN" <%if (charges.getE02RTEBT1().equals("AN")) { out.print("selected"); }%>>Promedio 
                  Neto</option>
                  <option value="AG" <%if (charges.getE02RTEBT1().equals("AG")) { out.print("selected"); }%>>Promedio 
                  Global</option>
                </select>
              </div>
            </td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap width="25%"> 
              <div align="right">Cargo x Debajo M&iacute;nimo 1 :</div>
            </td>
            <td nowrap width="25%"> 
              <div align="left"> 
                <input type="text" class="txtright"  name="E02RTECH3" size="10" maxlength="9" value="<%= charges.getE02RTECH3()%>">
              </div>
            </td>
            <td nowrap width="25%"> 
              <div align="right">Valor L&iacute;mite :</div>
            </td>
            <td nowrap width="25%" > 
              <div align="left"> 
                <input type="text" class="txtright"  name="E02RTEBL3" size="15" maxlength="13" value="<%= charges.getE02RTEBL3()%>">
                <select name="E02RTEBUS">
                  <option value=" " <% if (!(charges.getE02RTEBUS().equals("NT") ||charges.getE02RTEBUS().equals("GR")||charges.getE02RTEBUS().equals("AN")||charges.getE02RTEBUS().equals("AG"))) out.print("selected"); %>></option>
                  <option value="NT" <%if (charges.getE02RTEBUS().equals("NT")) { out.print("selected"); }%>>Balance 
                  Neto</option>
                  <option value="GR" <%if (charges.getE02RTEBUS().equals("GR")) { out.print("selected"); }%>>Balance 
                  Global</option>
                  <option value="AN" <%if (charges.getE02RTEBUS().equals("AN")) { out.print("selected"); }%>>Promedio 
                  Neto</option>
                  <option value="AG" <%if (charges.getE02RTEBUS().equals("AG")) { out.print("selected"); }%>>Promedio 
                  Global</option>
                </select>
              </div>
            </td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap width="25%" height="34"> 
              <div align="right">Cargo x Debajo M&iacute;nimo 2 :</div>
            </td>
            <td nowrap width="25%" height="34"> 
              <div align="left"> 
                <input type="text" class="txtright"  name="E02RTEMMC" size="10" maxlength="9" value="<%= charges.getE02RTEMMC()%>">
              </div>
            </td>
            <td nowrap width="25%" height="34"> 
              <div align="right">Valor L&iacute;mite :</div>
            </td>
            <td nowrap width="25%" height="34" > 
              <div align="left"> 
                <input type="text" class="txtright"  name="E02RTEMBR" size="15" maxlength="13" value="<%= charges.getE02RTEMBR()%>">
                <select name="E02RTEBT2">
                  <option value=" " <% if (!(charges.getE02RTEBT2().equals("NT") ||charges.getE02RTEBT2().equals("GR")||charges.getE02RTEBT2().equals("AN")||charges.getE02RTEBT2().equals("AG"))) out.print("selected"); %>></option>
                  <option value="NT" <%if (charges.getE02RTEBT2().equals("NT")) { out.print("selected"); }%>>Balance 
                  Neto</option>
                  <option value="GR" <%if (charges.getE02RTEBT2().equals("GR")) { out.print("selected"); }%>>Balance 
                  Global</option>
                  <option value="AN" <%if (charges.getE02RTEBT2().equals("AN")) { out.print("selected"); }%>>Promedio 
                  Neto</option>
                  <option value="AG" <%if (charges.getE02RTEBT2().equals("AG")) { out.print("selected"); }%>>Promedio 
                  Global</option>
                </select>
              </div>
            </td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap width="25%"> 
              <div align="right">Cargo x Exceso de Retiros :</div>
            </td>
            <td nowrap width="25%" > 
              <div align="left"> 
                <input type="text" class="txtright"  name="E02RTEMCD" size="10" maxlength="9" value="<%= charges.getE02RTEMCD()%>">
              </div>
            </td>
            <td nowrap width="25%"> 
              <div align="right">N&uacute;mero de Retiros :</div>
            </td>
            <td nowrap width="25%" > 
              <div align="left"> 
                <input type="text" class="txtright"  name="E02RTEMDA" size="4" maxlength="3" value="<%= charges.getE02RTEMDA()%>">
              </div>
            </td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap width="25%"> 
              <div align="right">Cargo x Cuenta Inactiva :</div>
            </td>
            <td nowrap width="25%" > 
              <div align="left"> 
                <input type="text" class="txtright"  name="E02RTEICH" size="10" maxlength="9" value="<%= charges.getE02RTEICH()%>">
              </div>
            </td>
            <td nowrap width="25%"> 
              <div align="right">Nro. D�as Para Inactividad :</div>
            </td>
            <td nowrap width="25%" > 
              <div align="left"> 
                <input type="text" class="txtright"  name="E02RTEIDL" size="5" maxlength="4" value="<%= charges.getE02RTEIDL()%>">
              </div>
            </td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap width="25%"> 
              <div align="right">Cargo M&aacute;x. x Cheque N Local :</div>
            </td>
            <td nowrap width="25%" > 
              <div align="left"> 
                <input type="text" class="txtright"  name="E02RTENCX" size="10" maxlength="9" value="<%= charges.getE02RTENCX()%>">
              </div>
            </td>
            <td nowrap width="25%"> 
              <div align="right">Comisi&oacute;n Cheques N. Locales :</div>
            </td>
            <td nowrap width="25%" > 
              <div align="left"> 
                <input type="text" class="txtright"  name="E02RTENCP" size="4" maxlength="3" value="<%= charges.getE02RTENCP()%>">
                % </div>
            </td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap width="25%"> 
              <div align="right">Cargo M&iacute;n. x Cheque N Local :</div>
            </td>
            <td nowrap width="25%" > 
              <div align="left"> 
                <input type="text" class="txtright"  name="E02RTENCM" size="10" maxlength="9" value="<%= charges.getE02RTENCM()%>">
              </div>
            </td>
            <td nowrap width="25%"> 
              <div align="right">D&iacute;as de Gracia (Provision Int) :</div>
            </td>
            <td nowrap width="25%" > 
              <div align="left"> 
                <input type="text" class="txtright"  name="E02RTEGPS" size="4" maxlength="3" value="<%= charges.getE02RTEGPS()%>">
              </div>
            </td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap width="25%"> 
              <div align="right">Cargo Aprobaci&oacute;n Sobregiros :</div>
            </td>
            <td nowrap width="25%" > 
              <div align="left"> 
                <input type="text" class="txtright"  name="E02RTENSC" size="10" maxlength="9" value="<%= charges.getE02RTENSC()%>">
              </div>
            </td>
            <td nowrap width="25%"> 
              <div align="right">Cargo Aprobaci&oacute;n Diferidos :</div>
            </td>
            <td nowrap width="25%" > 
              <div align="left"> 
                <input type="text" class="txtright"  name="E02RTEUNC" size="10" maxlength="9" value="<%= charges.getE02RTEUNC()%>">
              </div>
            </td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
            <td nowrap width="25%"> 
              <div align="right">Cargo x Suspensi&oacute;n de Pagos :</div>
            </td>
            <td nowrap width="25%" > 
              <div align="left"> 
                <input type="text" class="txtright"  name="E02RTESPC" size="10" maxlength="9" value="<%= charges.getE02RTESPC()%>">
              </div>
            </td>
            <td nowrap width="25%"> 
              <div align="right">Cargo x Retenci&oacute;n de Correo :</div>
            </td>
            <td nowrap width="25%" > 
              <div align="left"> 
                <input type="text" class="txtright"  name="E02RTEHCH" size="10" maxlength="9" value="<%= charges.getE02RTEHCH()%>">
              </div>
            </td>
          </tr>
         <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
            <td nowrap width="25%"> 
              <div align="right">Cargo x Apertura de Cuenta :</div>
            </td>
            <td nowrap width="25%" > 
              <div align="left"> 
                <input type="text" class="txtright"  name="E02RTEOPC" size="10" maxlength="9" value="<%= charges.getE02RTEOPC()%>">
              </div>
            </td>
            <td nowrap width="25%"> 
              <div align="right">Cargo Mensual de Servicios :</div>
            </td>
            <td nowrap width="25%" > 
              <div align="left"> 
                <input type="text" class="txtright"  name="E02RTEYRC" size="10" maxlength="9" value="<%= charges.getE02RTEYRC()%>">
              </div>
            </td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
            <td nowrap width="25%" height="33"> 
              <div align="right">Retiro M&iacute;nimo Permitido :</div>
            </td>
            <td nowrap width="25%" height="33" > 
              <div align="left"> 
                <input type="text" class="txtright"  name="E02RTEMAK" size="10" maxlength="9" value="<%= charges.getE02RTEMAK()%>">
              </div>
            </td>
            <td nowrap width="25%" height="33"> 
              <div align="right">Monto M&iacute;n. Apertura Cuentas :</div>
            </td>
            <td nowrap width="25%" height="33" > 
              <div align="left"> 
                <input type="text" class="txtright"  name="E02RTEMOA" size="10" maxlength="9" value="<%= charges.getE02RTEMOA()%>">
              </div>
            </td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
            <td nowrap width="25%"> 
              <div align="right">D&iacute;as Retener Confirmaci&oacute;n :</div>
            </td>
            <td nowrap width="25%" > 
              <div align="left"> 
                <input type="text" class="txtright"  name="E02RTENDH" size="3" maxlength="2" value="<%= charges.getE02RTENDH()%>">
              </div>
            </td>
            <td nowrap width="25%"> 
              <div align="right">Monto M&aacute;ximo a Confirmar :</div>
            </td>
            <td nowrap width="25%" > 
              <div align="left"> 
                <input type="text" class="txtright"  name="E02RTEMAC" size="10" maxlength="9" value="<%= charges.getE02RTEMAC()%>">
              </div>
            </td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
            <td nowrap width="25%"> 
              <div align="right">D&iacute;as para Cancelar :</div>
            </td>
            <td nowrap width="25%" > 
              <div align="left"> 
                <input type="text" class="txtright"  name="E02RTENDC" size="6" maxlength="5" value="<%= charges.getE02RTENDC()%>">
              </div>
            </td>
            <td nowrap width="25%"> 
              <div align="right">Meses de Historia :</div>
            </td>
            <td nowrap width="25%" > 
              <div align="left"> 
                <input type="text" class="txtright"  name="E02RTEHIS" size="3" maxlength="2" value="<%= charges.getE02RTEHIS()%>">
              </div>
            </td>
          </tr>
         <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap width="25%"> 
              <div align="right">Cargo M&iacute;n. x Sobregiro :</div>
            </td>
            <td nowrap width="25%" > 
              <div align="left"> 
                <input type="text" class="txtright"  name="E02RTEOMC" size="10" maxlength="9" value="<%= charges.getE02RTEOMC()%>">
              </div>
            </td>
            <td nowrap width="25%"> 
              <div align="right">D&iacute;as Dif. Local/No Local :</div>
            </td>
            <td nowrap width="25%" > 
              <div align="left"> 
                <input type="text" name="E02RTEWLC" size="2" maxlength="1" value="<%= charges.getE02RTEWLC()%>">
                / 
                <input type="text" name="E02RTEWNL" size="2" maxlength="1" value="<%= charges.getE02RTEWNL()%>">
              </div>
            </td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap width="25%"> 
              <div align="right">Manejo de Libreta :</div>
            </td>
            <td nowrap width="25%" > 
              <div align="left"> 
                <select name="E02RTEPSB">
                  <option value=" " <% if (!(charges.getE02RTEPSB().equals("Y") ||charges.getE02RTEPSB().equals("N"))) out.print("selected"); %>></option>
                  <option value="Y" <%if (charges.getE02RTEPSB().equals("Y")) { out.print("selected"); }%>>Si</option>
                  <option value="N" <%if (charges.getE02RTEPSB().equals("N")) { out.print("selected"); }%>>No</option>
                </select>
              </div>
            </td>
            <td nowrap width="25%"> 
              <div align="right">Gracia Mora :</div>
            </td>
            <td nowrap width="25%" > 
              <div align="left"> 
                <input type="text" class="txtright"  name="E02RTEC02" size="5" maxlength="5" value="<%= charges.getE02RTEC02()%>">
              </div>
            </td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap width="25%"> 
              <div align="right">D&iacute;as para Giros Diferidos :</div>
            </td>
            <td nowrap width="25%" > 
              <div align="left"> 
                <input type="text" class="txtright"  name="E02RTECAB" size="4" maxlength="3" value="<%= charges.getE02RTECAB()%>">
              </div>
            </td>
            <td nowrap width="25%"> 
              <div align="right">Dias para Suspender Cargos:</div>
            </td>
            <td nowrap width="25%" > 
              <div align="left"><input type="text" class="txtright"  name="E02RTEDY1" size="4" maxlength="3" value="<%= charges.getE02RTEDY1()%>"> </div>
            </td>
          </tr>
        </table>
        </td>
      </tr>
    </table>
    
   <h4>Traslado a la Direcci�n Nacional del Tesoro</h4>
    <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" align="left" >
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
            <td nowrap width="25%" colspan="2"> 
              <div align="right">Numero de D�as a Partir de Inactividad :</div>
            </td>
            <td nowrap width="25%"> 
              <div align="left"> 
                <input type="text" class="txtright"  name="E02RTEDDL" size="5" maxlength="4" value="<%= charges.getE02RTEDDL()%>">
              </div>
            </td>
            <td nowrap width="25%"> 
              <div align="right">Saldo en Cuenta para Traslado : </div>
            </td>
            <td nowrap width="25%"> 
                <input type="text" class="txtright"  name="E02RTEDCH" size="10" maxlength="9" value="<%= charges.getE02RTEDCH()%>">
              <input type="text" readonly name="E02RTEP0X" size="5" maxlength="4" value="<%= charges.getE02RTEP0X().trim()%>">
              <a href="javascript:GetCurrency('E02RTEP0X', '<%=charges.getE02RTEBNK().trim()%>' )"><img src="<%=request.getContextPath()%>/images/1b.gif" title="ayuda" align="bottom" border="0"></a> 
            </td>
          </tr>
        </table>
  </table>
    
  <h4>Traslado a ICETEX</h4>
    <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" align="left" >
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
            <td nowrap width="25%" colspan="2"> 
              <div align="right">Numero de D�as a Partir de Inactividad :</div>
            </td>
            <td nowrap width="25%"> 
              <div align="left"> 
                <input type="text" class="txtright"  name="E02RTECX1" size="5" maxlength="4" value="<%= charges.getE02RTECX1()%>" onkeypress="enterInteger(event)">
              </div>
            </td>
            <td nowrap width="25%"> 
              <div align="right">Saldo en Cuenta para Traslado : </div>
            </td>
            <td nowrap width="25%"> 
                <input type="text" class="txtright"  name="E02RTECO2" size="10" maxlength="9" value="<%= charges.getE02RTECO2()%>">
              <input type="text" readonly name="E02RTEP0Y" size="5" maxlength="4" value="<%= charges.getE02RTEP0Y().trim()%>">
              <a href="javascript:GetCurrency('E02RTEP0Y', '<%=charges.getE02RTEBNK().trim()%>' )"><img src="<%=request.getContextPath()%>/images/1b.gif" title="ayuda" align="bottom" border="0"></a> 
            </td>
          </tr>
        </table>
  </table>  
    
  <h4>Tasas de Interes</h4>
  <br>
  <h4>Tasas Pasivas</h4>
  <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" align="left" >
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
            <td nowrap width="15%"> 
              <div align="center"><b>L&iacute;mite</b></div>
            </td>
            <td nowrap width="10%"> 
              <div align="center"><b>Balance</b></div>
            </td>
            <td nowrap width="10%"> 
              <div align="center"><b>Tasa</b></div>
            </td>
            <td nowrap width="11%" > 
              <div align="center"><b>L&iacute;mite</b></div>
            </td>
            <td nowrap width="5%" > 
              <div align="center"><b>Balance</b></div>
            </td>
            <td nowrap width="20%" > 
              <div align="center"><b>Tasa</b></div>
            </td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
            <td nowrap width="10%"> 
              <div align="center"><b>(1)</b></div>
            </td>
            <td nowrap width="10%"> 
              <div align="center"> 
                <input type="text" class="txtright" name="E02RTEMKL" size="14" maxlength="13" value="<%= charges.getE02RTEMKL()%>">
              </div>
            </td>
            <td nowrap width="9%"> 
              <div align="center"> 
                <input type="text" class="txtright" name="E02RTEMKR" size="10" maxlength="9" value="<%= charges.getE02RTEMKR()%>">
              </div>
            </td>
            <td nowrap width="11%"> 
              <div align="center"><b>(2)</b></div>
            </td>
            <td nowrap width="5%" > 
              <div align="center"> 
                <input type="text" class="txtright" name="E02RTEMB1" size="14" maxlength="13" value="<%= charges.getE02RTEMB1()%>">
              </div>
            </td>
            <td nowrap width="20%" > 
              <div align="center"> 
                <input type="text" class="txtright" name="E02RTEMR1" size="10" maxlength="9" value="<%= charges.getE02RTEMR1()%>">
              </div>
            </td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
            <td nowrap width="10%"> 
              <div align="center"><b>(3)</b></div>
            </td>
            <td nowrap width="10%"> 
              <div align="center"> 
                <input type="text" class="txtright" name="E02RTEMB2" size="14" maxlength="13" value="<%= charges.getE02RTEMB2()%>">
              </div>
            </td>
            <td nowrap width="9%"> 
              <div align="center"> 
                <input type="text" class="txtright" name="E02RTEMR2" size="10" maxlength="9" value="<%= charges.getE02RTEMR2()%>">
              </div>
            </td>
            <td nowrap width="11%"> 
              <div align="center"><b>(4)</b></div>
            </td>
            <td nowrap width="5%"> 
              <div align="center"> 
                <input type="text" class="txtright" name="E02RTEMB3" size="14" maxlength="13" value="<%= charges.getE02RTEMB3()%>">
              </div>
            </td>
            <td nowrap width="20%"> 
              <div align="center"> 
                <input type="text" class="txtright" name="E02RTEMR3" size="10" maxlength="9" value="<%= charges.getE02RTEMR3()%>">
              </div>
            </td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap width="10%"> 
              <div align="center"><b>(5)</b></div>
            </td>
            <td nowrap width="10%"> 
              <div align="center"> 
                <input type="text" class="txtright" name="E02RTEMB4" size="14" maxlength="13" value="<%= charges.getE02RTEMB4()%>">
              </div>
            </td>
            <td nowrap width="9%"> 
              <div align="center"> 
                <input type="text" class="txtright" name="E02RTEMR4" size="10" maxlength="9" value="<%= charges.getE02RTEMR4()%>">
              </div>
            </td>
            <td nowrap width="11%"> 
              <div align="center"><b>(6)</b></div>
            </td>
            <td nowrap width="5%" > 
              <div align="center"> 
                <input type="text" class="txtright" name="E02RTEMB5" size="14" maxlength="13" value="<%= charges.getE02RTEMB5()%>">
              </div>
            </td>
            <td nowrap width="20%" > 
              <div align="center"> 
                <input type="text" class="txtright" name="E02RTEMR5" size="10" maxlength="9" value="<%= charges.getE02RTEMR5()%>">
              </div>
            </td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
            <td nowrap width="10%"> 
              <div align="center"><b>(7)</b></div>
            </td>
            <td nowrap width="10%"> 
              <div align="center"> 
                <input type="text" class="txtright" name="E02RTEMB6" size="14" maxlength="13" value="<%= charges.getE02RTEMB6()%>">
              </div>
            </td>
            <td nowrap width="9%"> 
              <div align="center"> 
                <input type="text" class="txtright" name="E02RTEMR6" size="10" maxlength="9" value="<%= charges.getE02RTEMR6()%>">
              </div>
            </td>
            <td nowrap width="11%"> 
              <div align="center"><b>(8)</b></div>
            </td>
            <td nowrap width="5%" > 
              <div align="center"> 
                <input type="text" class="txtright" name="E02RTEMB7" size="14" maxlength="13" value="<%= charges.getE02RTEMB7()%>">
              </div>
            </td>
            <td nowrap width="20%" > 
              <div align="center"> 
                <input type="text" class="txtright" name="E02RTEMR7" size="10" maxlength="9" value="<%= charges.getE02RTEMR7()%>">
              </div>
            </td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap width="10%"> 
              <div align="center"><b>(9)</b></div>
            </td>
            <td nowrap width="10%" > 
              <div align="center"> 
                <input type="text" class="txtright" name="E02RTEMB8" size="14" maxlength="13" value="<%= charges.getE02RTEMB8()%>">
              </div>
            </td>
            <td nowrap width="9%"> 
              <div align="center"> 
                <input type="text" class="txtright" name="E02RTEMR8" size="10" maxlength="9" value="<%= charges.getE02RTEMR8()%>">
              </div>
            </td>
            <td nowrap width="11%"> 
              <div align="center"><b>(10)</b></div>
            </td>
            <td nowrap width="5%" > 
              <div align="center"> 
                <input type="text" class="txtright" name="E02RTEMB9" size="14" maxlength="13" value="<%= charges.getE02RTEMB9()%>">
              </div>
            </td>
            <td nowrap width="20%" > 
              <div align="center"> 
                <input type="text" class="txtright" name="E02RTEMR9" size="10" maxlength="9" value="<%= charges.getE02RTEMR9()%>">
              </div>
            </td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap width="15%"> 
              <div align="center"><b>(11)</b></div>
            </td>
            <td nowrap width="10%" > 
              <div align="center"> 
                <input type="text" class="txtright" name="E02RTEMBX" size="14" maxlength="13" value="<%= charges.getE02RTEMBX()%>">
              </div>
            </td>
            <td nowrap width="9%"> 
              <div align="center"> 
                <input type="text" class="txtright" name="E02RTEMRX" size="10" maxlength="9" value="<%= charges.getE02RTEMRX()%>">
              </div>
            </td>
            <td nowrap width="11%"> 
              <div align="center"><b>(12)</b></div>
            </td>
            <td nowrap width="5%" > 
              <div align="center"> 
                <input type="text" class="txtright" name="E02RTEMBY" size="14" maxlength="13" value="<%= charges.getE02RTEMBY()%>">
              </div>
            </td>
            <td nowrap width="20%" > 
              <div align="center"> 
                <input type="text" class="txtright" name="E02RTEMRY" size="10" maxlength="9" value="<%= charges.getE02RTEMRY()%>">
              </div>
            </td>
          </tr>
        </table>
  </table>
<br>
    <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" align="left" >
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
            <td nowrap width="25%" colspan="2"> 
              <div align="right">Tipo de Balance :</div>
            </td>
            <td nowrap width="25%"> 
              <div align="left"> 
                <select name="E02RTEBTY">
                  <option value=" " <% if (!(charges.getE02RTEBTY().equals("NT") ||charges.getE02RTEBTY().equals("GR")||charges.getE02RTEBTY().equals("AN")||charges.getE02RTEBTY().equals("AG")||charges.getE02RTEBTY().equals("MG")
				||charges.getE02RTEBTY().equals("MN")||charges.getE02RTEBTY().equals("RG")||charges.getE02RTEBTY().equals("RN"))) out.print("selected"); %>></option>
                  <option value="NT" <%if (charges.getE02RTEBTY().equals("NT")) { out.print("selected"); }%>>Balance 
                  Neto</option>
                  <option value="GR" <%if (charges.getE02RTEBTY().equals("GR")) { out.print("selected"); }%>>Balance 
                  Global</option>
                  <option value="AN" <%if (charges.getE02RTEBTY().equals("AN")) { out.print("selected"); }%>>Promedio 
                  Neto</option>
                  <option value="AG" <%if (charges.getE02RTEBTY().equals("AG")) { out.print("selected"); }%>>Promedio 
                  Global</option>
                  <option value="MG" <%if (charges.getE02RTEBTY().equals("MG")) { out.print("selected"); }%>>Minimo 
                  Bruto</option>
                  <option value="MN" <%if (charges.getE02RTEBTY().equals("MN")) { out.print("selected"); }%>>Minimo 
                  Neto</option>
                  <option value="RG" <%if (charges.getE02RTEBTY().equals("RG")) { out.print("selected"); }%>>Reversion 
                  Global</option>
                  <option value="RN" <%if (charges.getE02RTEBTY().equals("RN")) { out.print("selected"); }%>>Reversion 
                  Neto</option>

                </select>

              </div>
            </td>
            <td nowrap width="25%"> 
              <div align="right">C&aacute;lculo Interes : </div>
            </td>
            <td nowrap width="25%"> 
              <input type="text" name="E02RTECAM" size="2" maxlength="1" value="<%= charges.getE02RTECAM()%>">
              <a href="javascript:GetCode('E02RTECAM','STATIC_rt_tables_calc_int.jsp')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="ayuda" align="bottom" border="0"></a> 
            </td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap width="25%" colspan="2"> 
              <div align="right">Base : </div>
            </td>
            <td nowrap width="25%"> 
              <div align="left">
                <input type="text" class="txtright" name="E02RTEABA" size="4" maxlength="3" value="<%= charges.getE02RTEABA()%>">
              </div>
            </td>
            <td nowrap width="25%"> 
              <div align="right">Reversi&oacute;n Intereses :</div>
            </td>
            <td nowrap width="25%"> 
              <div align="left">
                <input type="text" name="E02RTEOMP" size="4" maxlength="3" value="<%= charges.getE02RTEOMP()%>">
                <a href="javascript:GetCode('E02RTEOMP','STATIC_rt_tables_rever_int.jsp')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="ayuda" align="bottom" border="0"></a></div>
            </td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap width="25%" colspan="2"> 
              <div align="right">Tasa de Bonificacion : </div>
            </td>
            <td nowrap width="25%"> 
              <div align="left">
                <input type="text" class="txtright" name="E02RTER07" size="10" maxlength="9" value="<%= charges.getE02RTER07()%>" >
              </div>
            </td>
            <td nowrap width="25%"> 
              <div align="right">Numero de Giros :</div>
            </td>
            <td nowrap width="25%"> 
              <div align="left">
                <input type="text" class="txtright" name="E02RTEDY2" size="4" maxlength="3" value="<%= charges.getE02RTEDY2()%>" >
               </div>
            </td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
            <td nowrap width="25%" colspan="2"> 
              <div align="right">Tasa Flotante :</div>
            </td>
            <td nowrap colspan="3"> 
              <div align="left"></div>
              <div align="right"></div>
              <div align="left"> </div>
              <input type="text" name="E02RTEFTL" size="3" maxlength="2" value="<%= charges.getE02RTEFTL()%>">
              <a href="javascript:GetFloating('E02RTEFTL')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="Tabla de Tasas Flotantes" align="middle" border="0" ></a> 
              <select name="E02RTEFYL">
                <option value=" " <% if (!(charges.getE02RTEFYL().equals("FP") ||charges.getE02RTEFYL().equals("FS"))) out.print("selected"); %>></option>
                <option value="FP" <%if (charges.getE02RTEFYL().equals("FP")) { out.print("selected"); }%>>FP</option>
                <option value="FS" <%if (charges.getE02RTEFYL().equals("FS")) { out.print("selected"); }%>>FS</option>
              </select>
              Factor : 
              <input type="text" name="E02RTEFCL" size="5" maxlength="5" value="<%= charges.getE02RTEFCL()%>">
              Operaci&oacute;n : 
              <select name="E02RTEFFL">
                <option value=" " <% if (!(charges.getE02RTEFFL().equals("A") ||charges.getE02RTEFFL().equals("S")||charges.getE02RTEFFL().equals("M"))) out.print("selected"); %>></option>
                <option value="A" <%if (charges.getE02RTEFFL().equals("A")) { out.print("selected"); }%>>+ 
                Tasa</option>
                <option value="S" <%if (charges.getE02RTEFFL().equals("S")) { out.print("selected"); }%>>% 
                - Tasa</option>
                <option value="M" <%if (charges.getE02RTEFFL().equals("M")) { out.print("selected"); }%>>% 
                * Tasa</option>
              </select>
            </td>
          </tr>
        </table>
  </table>
  
  <h4>Tasas Activas</h4>
  <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" align="left" >
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap colspan="2"> 
              <div align="right">Tasa Base :</div>
            </td>
            <td nowrap width="9%"> 
              <div align="left"> 
                <input type="text" class="txtright" name="E02RTEOR1" size="10" maxlength="9" value="<%= charges.getE02RTEOR1()%>">
              </div>
            </td>
            <td nowrap > 
              <div align="right">Periodo Base S/Giro:</div>
            </td>
            <td nowrap width="23%"> 
              <input type="text" name="E02RTEC03" size="4" maxlength="3" value="<%= charges.getE02RTEC03()%>">
            </td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap colspan="2"> 
              <div align="right">Comisi&oacute;n :</div>
            </td>
            <td nowrap width="9%"> 
              <div align="left"></div>
              <div align="right"></div>
              <div align="right"></div>
              <input type="text" class="txtright" name="E02RTEODC" size="10" maxlength="9" value="<%= charges.getE02RTEODC()%>">
            </td>
            <td nowrap width="39%"> 
              <div align="right">Tipo de Comisi&oacute;n : </div>
            </td>
            <td nowrap colspan="2">
              <select name="E02RTEODF">
                <option value=" " <% if (!(charges.getE02RTEODF().equals("S") ||charges.getE02RTEODF().equals("1")||charges.getE02RTEODF().equals("2"))) out.print("selected"); %>></option>
                <option value="S" <%if (charges.getE02RTEODF().equals("S")) { out.print("selected"); }%>>Fija 
                por Total Ciclo</option>
                <option value="1" <%if (charges.getE02RTEODF().equals("1")) { out.print("selected"); }%>>% 
                Saldo Maximo de Sobregiro</option>
                <option value="2" <%if (charges.getE02RTEODF().equals("2")) { out.print("selected"); }%>>% 
                Saldo de Sobregiro</option>
              </select>
            </td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
            <td nowrap colspan="2"> 
              <div align="right">Tasa Flotante :</div>
            </td>
            <td nowrap colspan="4"> 
              <div align="left"></div>
              <div align="right"></div>
              <div align="left"> 
                <input type="text" name="E02RTEFTA" size="3" maxlength="2" value="<%= charges.getE02RTEFTA()%>">
                <a href="javascript:GetFloating('E02RTEFTA')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="Tabla de Tasas Flotantes" align="middle" border="0" ></a> 
                <select name="E02RTEFYA">
                  <option value=" " <% if (!(charges.getE02RTEFYA().equals("FP") ||charges.getE02RTEFYA().equals("FS"))) out.print("selected"); %>></option>
                  <option value="FP" <%if (charges.getE02RTEFYA().equals("FP")) { out.print("selected"); }%>>FP</option>
                  <option value="FS" <%if (charges.getE02RTEFYA().equals("FS")) { out.print("selected"); }%>>FS</option>
                </select>
                Factor : 
                <input type="text" name="E02RTEFCA" size="5" maxlength="5" value="<%= charges.getE02RTEFCA()%>">
                Operaci&oacute;n : 
                <select name="E02RTEFFA">
                  <option value=" " <% if (!(charges.getE02RTEFFA().equals("A") ||charges.getE02RTEFFA().equals("S")||charges.getE02RTEFFA().equals("M"))) out.print("selected"); %>></option>
                  <option value="A" <%if (charges.getE02RTEFFA().equals("A")) { out.print("selected"); }%>>+ 
                  Tasa</option>
                  <option value="S" <%if (charges.getE02RTEFFA().equals("S")) { out.print("selected"); }%>>% 
                  - Tasa</option>
                  <option value="M" <%if (charges.getE02RTEFFA().equals("M")) { out.print("selected"); }%>>% 
                  * Tasa</option>
                </select>
              </div>
            </td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap colspan="2"> 
              <div align="right">Tasa Mora :</div>
            </td>
            <td nowrap colspan="4"> 
              <div align="left"> 
                <input type="text" class="txtright" name="E02RTER01" size="10" maxlength="9" value="<%= charges.getE02RTER01()%>">
                D&iacute;as Cobro : 
                <input type="text" class="txtright" name="E02RTEMST" size="5" maxlength="4" value="<%= charges.getE02RTEMST()%>">
                Plazo Financiamiento : 
                <input type="text" class="txtright" name="E02RTEC01" size="5" maxlength="5" value="<%= charges.getE02RTEC01()%>">
              </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>

  </table>
  
  <div align="center"> 
    <input id="EIBSBTN" type=submit name="Submit" value="Enviar">
  </div>
</form>
</body>
</html>
