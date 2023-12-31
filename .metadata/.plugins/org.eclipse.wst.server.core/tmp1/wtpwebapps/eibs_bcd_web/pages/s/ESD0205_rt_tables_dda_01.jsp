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
	if (!error.getERRNUM().equals("0")) {
		error.setERRNUM("0");
		out.println("<SCRIPT Language=\"Javascript\">");
		out.println("       showErrors()");
		out.println("</SCRIPT>");
	}
%> 
 
 
<h3 align="center">Cuentas Corrientes Sin Intereses<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="ESD0205_rt_tables_dda_01, ESD0205" ></h3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.params.JSESD0205">

    <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="200">
    <input type=HIDDEN name= "E02RTEACD" value="<%=charges.getE02RTEACD()%>">
    
  <h4>Informaci�n B�sica</h4>
  
  <% int row = 0; %>
  <table class="tableinfo">
          <tr > 
        <td nowrap> 
          
        <table cellspacing="0" cellpadding="2" width="100%" border="0" align="left" >

          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap width="22%"> 
              <div align="right">N&uacute;mero de Tabla :</div>
            </td>
            <td nowrap> 
              <div align="left"> 
                <input type="text" name="E02RTETAR" size="3" maxlength="2" value="<%=charges.getE02RTETAR()%>">
                <input type="text" name="E02RTEDSC" size="48" maxlength="45" value="<%=charges.getE02RTEDSC()%>">
              </div>
            </td>
            
            <td nowrap width="25%">
              <div align="right">Producto :</div>
            </td>
            <td nowrap>
              <input type="text" name="E02RTEATY" size="5" maxlength="4" value="<%=charges.getE02RTEATY()%>">
              <a href="javascript:GetProductRates('E02RTEATY','RT')">
				<img src="<%=request.getContextPath()%>/images/1b.gif" alt="help" align="middle" border="0" ></a> 
            </td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap width="22%"> 
              <div align="right">Moneda Comisi&oacute;n :</div>
            </td>
            <td nowrap width="18%"> 
              <input type="text" name="E02RTEFCY" size="4" maxlength="3" value="<%=charges.getE02RTEFCY()%>">
              <a href="javascript:GetCurrency('E02RTEFCY','')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="help" align="absmiddle" border="0" ></a> 
               </td>
            <td nowrap width="29%"> 
              <div align="right">L&iacute;mite Balance :</div>
            </td>
            <td nowrap width="31%"> 
              <input type="text" name="E02RTEMBM" size="10" maxlength="9" value="<%=charges.getE02RTEMBM()%>">
            </td>
          </tr>
		  <%if(!charges.getE02RTECUN().equals("0")){%>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap width="20%" align=right> 
              Cliente :
            </td>
            <td nowrap colspan=3>  
               
              <input type="text" name="E02RTECUN" size="10" maxlength="9" value="<%=charges.getE02RTECUN()%>">
              <a href="javascript:GetCustomer('E02RTECUN')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Ayuda" align="absbottom" border="0" ></a> 
            </td>
          </tr>
          <%}%>

        </table>
        </td>
      </tr>


</table>
  <h4>Cargos Por Servicios</h4>
 
  <table class="tableinfo">
      <tr > 
        <td nowrap> 
          
        <table cellspacing="0" cellpadding="2" width="100%" border="0" align="left" >
          <tr id="trdark"> 
            <td nowrap width="22%"> 
              <div align="right">Cargo por Envio de Correo :</div>
            </td>
            <td nowrap width="18%"> 
              <div align="left"> 
                <input type="text" name="E02RTESTC" size="10" maxlength="9" value="<%=charges.getE02RTESTC()%>">
              </div>
            </td>
            <td nowrap width="29%"> 
              <div align="right"> Tipo de Balance :</div>
            </td>
            <td nowrap width="31%"> 
              <div align="left"> 
                <select name="E02RTEBT1">
                  <option value=" " <% if (!(charges.getE02RTEBT1().equals("NT")
                  	||charges.getE02RTEBT1().equals("GR")
                  	||charges.getE02RTEBT1().equals("AN")
                  	||charges.getE02RTEBT1().equals("AG"))) out.print("selected"); %>></option>
                  <option value="NT" <%if (charges.getE02RTEBT1().equals("NT")) { out.print("selected"); }%>>
                  	Balance Neto</option>
                  <option value="GR" <%if (charges.getE02RTEBT1().equals("GR")) { out.print("selected"); }%>>
                  	Balance Global</option>
                  <option value="AN" <%if (charges.getE02RTEBT1().equals("AN")) { out.print("selected"); }%>>
                  	Promedio Neto</option>
                  <option value="AG" <%if (charges.getE02RTEBT1().equals("AG")) { out.print("selected"); }%>>Promedio 
                  Global</option>
                </select>
              </div>
            </td>
          </tr>
         <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap width="22%" height="34"> 
              <div align="right">Cargo Saldo M&iacute;nimo en Libros :</div>
            </td>
            <td nowrap width="18%" height="34"> 
              <div align="left"> 
                <input type="text" name="E02RTECH1" size="10" maxlength="9" value="<%=charges.getE02RTECH1()%>">
              </div>
            </td>
            <td nowrap width="29%" height="34"> 
              <div align="right">Saldo M&iacute;nimo en Libros :</div>
            </td>
            <td nowrap width="31%" height="34" > 
              <div align="left"> 
                <input type="text" name="E02RTEBL1" size="15" maxlength="13" value="<%=charges.getE02RTEBL1()%>">
              </div>
            </td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap width="22%"> 
              <div align="right">Cargo Saldo M&iacute;nimo Disponible :</div>
            </td>
            <td nowrap width="18%"> 
              <div align="left"> 
                <input type="text" name="E02RTECH2" size="10" maxlength="9" value="<%=charges.getE02RTECH2()%>">
              </div>
            </td>
            <td nowrap width="29%"> 
              <div align="right">Saldo M&iacute;nimo Disponible :</div>
            </td>
            <td nowrap width="31%" > 
              <div align="left"> 
                <input type="text" name="E02RTEBL2" size="15" maxlength="13" value="<%=charges.getE02RTEBL2()%>">
              </div>
            </td>
          </tr>
         <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
            <td nowrap width="22%"> 
              <div align="right">Cargo Saldo M&iacute;n. Prom. Libros :</div>
            </td>
            <td nowrap width="18%" > 
              <div align="left"> 
                <input type="text" name="E02RTECH3" size="10" maxlength="9" value="<%=charges.getE02RTECH3()%>">
              </div>
            </td>
            <td nowrap width="29%"> 
              <div align="right">Saldo M&iacute;n. Prom. Libros :</div>
            </td>
            <td nowrap width="31%" > 
              <div align="left"> 
                <input type="text" name="E02RTEBL3" size="15" maxlength="13" value="<%=charges.getE02RTEBL3()%>">
              </div>
            </td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap width="22%"> 
              <div align="right">Cargo Saldo M&iacute;n. Prom. Disp. :</div>
            </td>
            <td nowrap width="18%" > 
              <div align="left"> 
                <input type="text" name="E02RTECH4" size="10" maxlength="9" value="<%=charges.getE02RTECH4()%>">
              </div>
            </td>
            <td nowrap width="29%"> 
              <div align="right">Saldo M&iacute;n. Prom. Disp. :</div>
            </td>
            <td nowrap width="31%" > 
              <div align="left"> 
                <input type="text" name="E02RTEBL4" size="15" maxlength="13" value="<%=charges.getE02RTEBL4()%>">
              </div>
            </td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap width="22%"> 
              <div align="right">Cargo de Timbres x Cheque :</div>
            </td>
            <td nowrap width="18%" > 
              <div align="left"> 
                <input type="text" name="E02RTEMKC" size="10" maxlength="9" value="<%=charges.getE02RTEMKC()%>">
              </div>
            </td>
            <td nowrap width="29%"> 
              <div align="right">Nro. Cheques Sin Cargo de Timbre :</div>
            </td>
            <td nowrap width="31%" > 
              <div align="left"> 
                <input type="text" name="E02RTEMKK" size="4" maxlength="3" value="<%=charges.getE02RTEMKK()%>">
              </div>
            </td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap width="22%"> 
              <div align="right">Cargo x Cuenta Inactiva :</div>
            </td>
            <td nowrap width="18%" > 
              <div align="left"> 
                <input type="text" name="E02RTEICH" size="10" maxlength="9" value="<%=charges.getE02RTEICH()%>">
              </div>
            </td>
            <td nowrap width="29%"> 
              <div align="right">Nro. D�as Para Inactividad :</div>
            </td>
            <td nowrap width="31%" > 
              <div align="left"> 
                <input type="text" name="E02RTEIDL" size="5" maxlength="4" value="<%=charges.getE02RTEIDL()%>">
              </div>
            </td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap width="22%"> 
              <div align="right">Cargo M&aacute;x. x Cheque N Local :</div>
            </td>
            <td nowrap width="18%" > 
              <div align="left"> 
                <input type="text" name="E02RTENCX" size="10" maxlength="9" value="<%=charges.getE02RTENCX()%>">
              </div>
            </td>
            <td nowrap width="29%"> 
              <div align="right">Comisi&oacute;n Cheques N. Locales :</div>
            </td>
            <td nowrap width="31%" > 
              <div align="left"> 
                <input type="text" name="E02RTENCP" size="4" maxlength="3" value="<%=charges.getE02RTENCP()%>">
                %</div>
            </td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap width="22%"> 
              <div align="right">Cargo M&iacute;n. x Cheque N Local :</div>
            </td>
            <td nowrap width="18%" > 
              <div align="left"> 
                <input type="text" name="E02RTENCM" size="10" maxlength="9" value="<%=charges.getE02RTENCM()%>">
              </div>
            </td>
            <td nowrap width="29%"> 
              <div align="right">Cargo Mensual de Servicios :</div>
            </td>
            <td nowrap width="31%" > 
              <div align="left"> 
                <input type="text" name="E02RTEYRC" size="15" maxlength="15" value="<%=charges.getE02RTEYRC()%>">
              </div>
            </td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap width="22%"> 
              <div align="right">Cargo Aprobaci&oacute;n Sobregiros :</div>
            </td>
            <td nowrap width="18%" > 
              <div align="left"> 
                <input type="text" name="E02RTENSC" size="10" maxlength="9" value="<%=charges.getE02RTENSC()%>">
              </div>
            </td>
            <td nowrap width="29%"> 
              <div align="right">Cargo Aprobaci&oacute;n Diferidos :</div>
            </td>
            <td nowrap width="31%" > 
              <div align="left"> 
                <input type="text" name="E02RTEUNC" size="10" maxlength="9" value="<%=charges.getE02RTEUNC()%>">
              </div>
            </td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap width="22%"> 
              <div align="right">Comisi&oacute;n de Apertura :</div>
            </td>
            <td nowrap width="18%" > 
              <div align="left"> 
                <input type="text" name="E02RTEOPC" size="10" maxlength="9" value="<%=charges.getE02RTEOPC()%>">
              </div>
            </td>
            <td nowrap width="29%"> 
              <div align="right">Cargo x Cheques Depositados :</div>
            </td>
            <td nowrap width="31%" > 
              <div align="left"> 
                <input type="text" name="E02RTEPDC" size="10" maxlength="9" value="<%=charges.getE02RTEPDC()%>">
              </div>
            </td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap width="22%"> 
              <div align="right">Suspensi&oacute;n de Pagos Cheques :</div>
            </td>
            <td nowrap width="18%" > 
              <div align="left"> 
                <input type="text" name="E02RTESPC" size="10" maxlength="9" value="<%=charges.getE02RTESPC()%>">
              </div>
            </td>
            <td nowrap width="29%"> 
              <div align="right">Cargo x Retenci&oacute;n de Correo :</div>
            </td>
            <td nowrap width="31%" > 
              <div align="left"> 
                <input type="text" name="E02RTEHCH" size="10" maxlength="9" value="<%=charges.getE02RTEHCH()%>">
              </div>
            </td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap width="22%"> 
              <div align="right">D&iacute;as Retener x Confirmaci&oacute;n :</div>
            </td>
            <td nowrap width="18%" > 
              <div align="left"> 
                <input type="text" name="E02RTENDH" size="3" maxlength="2" value="<%=charges.getE02RTENDH()%>">
              </div>
            </td>
            <td nowrap width="29%"> 
              <div align="right">Balance M&iacute;nimo Confirmaci&oacute;n :</div>
            </td>
            <td nowrap width="31%" > 
              <div align="left"> 
                <input type="text" name="E02RTEMAC" size="10" maxlength="9" value="<%=charges.getE02RTEMAC()%>">
              </div>
            </td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap width="22%"> 
              <div align="right">Importe M&iacute;nimo de Cheques :</div>
            </td>
            <td nowrap width="18%" > 
              <div align="left"> 
                <input type="text" name="E02RTEMAK" size="10" maxlength="9" value="<%=charges.getE02RTEMAK()%>">
              </div>
            </td>
            <td nowrap width="29%"> 
              <div align="right">Monto M&iacute;n. Apertura Cuentas :</div>
            </td>
            <td nowrap width="31%" > 
              <div align="left"> 
                <input type="text" name="E02RTEMOA" size="10" maxlength="9" value="<%=charges.getE02RTEMOA()%>">
              </div>
            </td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap width="22%"> 
              <div align="right">Cargo M&iacute;n. x Sobregiro :</div>
            </td>
            <td nowrap width="18%" > 
              <div align="left"> 
                <input type="text" name="E02RTEOMC" size="10" maxlength="9" value="<%=charges.getE02RTEOMC()%>">
              </div>
            </td>
            <td nowrap width="29%"> 
              <div align="right">D&iacute;as Dif. Local/No Local :</div>
            </td>
            <td nowrap width="31%" > 
              <div align="left"> 
                <input type="text" name="E02RTEWLC" size="2" maxlength="1" value="<%=charges.getE02RTEWLC()%>">
                / 
                <input type="text" name="E02RTEWNL" size="2" maxlength="1" value="<%=charges.getE02RTEWNL()%>">
              </div>
            </td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap width="22%"> 
              <div align="right">N&uacute;mero Unidades Cr&eacute;dito :</div>
            </td>
            <td nowrap width="18%" > 
              <div align="left"> 
                <input type="text" name="E02RTESCU" size="6" maxlength="5" value="<%=charges.getE02RTESCU()%>">
              </div>
            </td>
            <td nowrap width="29%"> 
              <div align="right">M&iacute;n. D&iacute;as x Cancelaci&oacute;n 
                :</div>
            </td>
            <td nowrap width="31%" > 
              <div align="left"> 
                <input type="text" name="E02RTENDC" size="4" maxlength="3" value="<%=charges.getE02RTENDC()%>">
              </div>
            </td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap width="22%"> 
              <div align="right">Monto de Unidades Cr&eacute;dito :</div>
            </td>
            <td nowrap width="18%" > 
              <div align="left"> 
                <input type="text" name="E02RTESCA" size="6" maxlength="5" value="<%=charges.getE02RTESCA()%>">
              </div>
            </td>
            <td nowrap width="29%"> 
              <div align="right">Balance Usado x Unid Cr&eacute;dito :</div>
            </td>
            <td nowrap width="31%" > 
              <div align="left"> 
                <select name="E02RTEBUS">
                  <option value=" " <% if (!(charges.getE02RTEBUS().equals("NT") ||charges.getE02RTEBUS().equals("GR")||charges.getE02RTEBUS().equals("AN")||charges.getE02RTEBUS().equals("AG"))) out.print("selected"); %>></option>
                  <option value="NT" <%if (charges.getE02RTEBUS().equals("NT")) { out.print("selected"); }%>>Balance Neto</option>
                  <option value="GR" <%if (charges.getE02RTEBUS().equals("GR")) { out.print("selected"); }%>>Balance Global</option>
                  <option value="AN" <%if (charges.getE02RTEBUS().equals("AN")) { out.print("selected"); }%>>Promedio Neto</option>
                  <option value="AG" <%if (charges.getE02RTEBUS().equals("AG")) { out.print("selected"); }%>>Promedio Global</option>
                </select>
              </div>
            </td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap width="22%"> 
              <div align="right">D&iacute;as Vigencia Cheq. Certificados :</div>
            </td>
            <td nowrap width="18%" > 
              <div align="left"> 
                <input type="text" name="E02RTECAB" size="4" maxlength="3" value="<%=charges.getE02RTECAB()%>">
              </div>
            </td>
            <td nowrap width="29%"> 
              <div align="right">Meses de Historia :</div>
            </td>
            <td nowrap width="31%" > 
              <div align="left"> 
                <input type="text" name="E02RTEHIS" size="3" maxlength="2" value="<%=charges.getE02RTEHIS()%>">
              </div>
            </td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap colspan="4"> 
              <div align="right"></div>
              <div align="left"></div>
              <div align="right"></div>
              <div align="left"></div>
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
              <div align="right">Saldo en Cuenta para Traslado: </div>
            </td>
            <td nowrap width="25%"> 
                <input type="text" class="txtright"  name="E02RTEDCH" size="10" maxlength="9" value="<%= charges.getE02RTEDCH()%>">
              <input type="text" readonly name="E02RTEP01" size="5" maxlength="4" value="<%= charges.getE02RTEP01().trim()%>">
              <a href="javascript:GetCurrency('E02RTEP01', '<%=charges.getE02RTEBNK().trim()%>' )"><img src="<%=request.getContextPath()%>/images/1b.gif" title="ayuda" align="bottom" border="0"></a> 
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
  <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" align="left" >
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap colspan="4"> 
              <div align="center"><b>Tasas Activas</b></div>
            </td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap width="22%"> 
              <div align="right">Tasa de Sobregiros 1 :</div>
            </td>
            <td nowrap width="18%"> 
              <div align="left"> 
                <input type="text" name="E02RTEOR1" size="10" maxlength="9" value="<%=charges.getE02RTEOR1()%>">
              </div>
            </td>
            <td nowrap width="29%"> 
              <div align="right">D&iacute;as L&iacute;mite 1 :</div>
            </td>
            <td nowrap width="31%" > 
              <div align="left"> 
                <input type="text" name="E02RTEDO1" size="4" maxlength="3" value="<%=charges.getE02RTEDO1()%>">
              </div>
            </td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap width="22%"> 
              <div align="right">Tasa de Sobregiros 2 :</div>
            </td>
            <td nowrap width="18%"> 
              <div align="left"> 
                <input type="text" name="E02RTEOR2" size="10" maxlength="9" value="<%=charges.getE02RTEOR2()%>">
              </div>
            </td>
            <td nowrap width="29%"> 
              <div align="right">D&iacute;as L&iacute;mite 2 :</div>
            </td>
            <td nowrap width="31%"> 
              <div align="left"> 
                <input type="text" name="E02RTEDO2" size="4" maxlength="3" value="<%=charges.getE02RTEDO2()%>">
              </div>
            </td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap width="22%"> 
              <div align="right">Tasa de Sobregiros 3 :</div>
            </td>
            <td nowrap width="18%"> 
              <div align="left"> 
                <input type="text" name="E02RTEOR3" size="10" maxlength="9" value="<%=charges.getE02RTEOR3()%>">
              </div>
            </td>
            <td nowrap width="29%"> 
              <div align="right">D&iacute;as L&iacute;mite 3 :</div>
            </td>
            <td nowrap width="31%" > 
              <div align="left"> 
                <input type="text" name="E02RTEDO3" size="4" maxlength="3" value="<%=charges.getE02RTEDO3()%>">
              </div>
            </td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
            <td nowrap width="22%"> 
              <div align="right">Tasa de Sobregiros 4 :</div>
            </td>
            <td nowrap width="18%"> 
              <div align="left"> 
                <input type="text" name="E02RTEOR4" size="10" maxlength="9" value="<%=charges.getE02RTEOR4()%>">
              </div>
            </td>
            <td nowrap width="29%"> 
              <div align="right">D&iacute;as L&iacute;mite 4 :</div>
            </td>
            <td nowrap width="31%" > 
              <div align="left"> 
                <input type="text" name="E02RTEDO4" size="4" maxlength="3" value="<%=charges.getE02RTEDO4()%>">
              </div>
            </td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap width="22%"> 
              <div align="right">Tasa Mora Sobregiros :</div>
            </td>
            <td nowrap width="18%" > 
              <div align="left"> 
                <input type="text" name="E02RTER07" size="10" maxlength="9" value="<%=charges.getE02RTER07()%>">
              </div>
            </td>
            <td nowrap width="29%"> 
              <div align="right">D&iacute;as Lim. Mora :</div>
            </td>
            <td nowrap width="31%" > 
              <div align="left"> 
                <input type="text" name="E02RTEMST" size="5" maxlength="4" value="<%=charges.getE02RTEMST()%>">
              </div>
            </td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap width="22%"> 
              <div align="right">Tipo Calc. Interes :</div>
            </td>
            <td nowrap width="18%" > 
              <div align="left"> 
                <select name="E02RTECAM">
                  <option value=" " <% if (!(charges.getE02RTECAM().equals("S") ||charges.getE02RTECAM().equals("1"))) out.print("selected"); %>></option>
                  <option value="S" <%if (charges.getE02RTECAM().equals("S")) { out.print("selected"); }%>>Simple</option>
                  <option value="1" <%if (charges.getE02RTECAM().equals("1")) { out.print("selected"); }%>>Tasa 
                  Exponencial</option>
                </select>
              </div>
            </td>
            <td nowrap width="29%"> 
              <div align="right">D&iacute;as S/Giro Suspenso :</div>
            </td>
            <td nowrap width="31%" > 
              <div align="left"> 
                <input type="text" name="E02RTEC01" size="5" maxlength="4" value="<%=charges.getE02RTEC01()%>">
              </div>
            </td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap width="22%"> 
              <div align="right">Periodo Base S/Giro:</div>
            </td>
            <td nowrap width="18%" > 
              <div align="left"> 
                <input type="text" name="E02RTEC03" size="4" maxlength="3" value="<%=charges.getE02RTEC03()%>">
              </div>
            </td>
            <td nowrap width="29%"> 
              <div align="right"></div>
            </td>
            <td nowrap width="31%" > 
              <div align="left"></div>
            </td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap width="22%"> 
              <div align="right">Comisi&oacute;n de S/Giro :</div>
            </td>
            <td nowrap width="18%" > 
              <div align="left"> 
                <input type="text" name="E02RTEODC" size="10" maxlength="9" value="<%=charges.getE02RTEODC()%>">
              </div>
            </td>
            <td nowrap width="29%"> 
              <div align="right">Tipo de Comisi&oacute;n :</div>
            </td>
            <td nowrap > 
              <div align="left"> 
                <select name="E02RTEODF">
                  <option value=" " <% if (!(charges.getE02RTEODF().equals("S") ||charges.getE02RTEODF().equals("1")||charges.getE02RTEODF().equals("2"))) out.print("selected"); %>></option>
                  <option value="S" <%if (charges.getE02RTEODF().equals("S")) { out.print("selected"); }%>>Fija 
                  por Total Ciclo</option>
                  <option value="1" <%if (charges.getE02RTEODF().equals("1")) { out.print("selected"); }%>>% 
                  Saldo Maximo de Sobregiro</option>
                  <option value="2" <%if (charges.getE02RTEODF().equals("2")) { out.print("selected"); }%>>% 
                  Saldo de Sobregiro</option>
                </select>
              </div>
            </td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap width="22%"> 
              <div align="right">Tasa Flotante :</div>
            </td>
            <td nowrap colspan="3" > 
              <div align="left"> 
                <input type="text" name="E02RTEFTA" size="3" maxlength="2" value="<%=charges.getE02RTEFTA()%>">
                <a href="javascript:GetFloating('E02RTEFTA')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="Tabla de Tasas Flotantes" align="middle" border="0" ></a> 
                <select name="E02RTEFYA">
                  <option value=" " <% if (!(charges.getE02RTEFYA().equals("FP") ||charges.getE02RTEFYA().equals("FS"))) out.print("selected"); %>></option>
                  <option value="FP" <%if (charges.getE02RTEFYA().equals("FP")) { out.print("selected"); }%>>FP</option>
                  <option value="FS" <%if (charges.getE02RTEFYA().equals("FS")) { out.print("selected"); }%>>FS</option>
                </select>
                Factor: 
                <input type="text" name="E02RTEFCA" size="5" maxlength="5" value="<%=charges.getE02RTEFCA()%>">
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
            <td nowrap colspan="4"> 
              <div align="right"></div>
              <div align="left"></div>
              <div align="right"></div>
              <div align="center"><b>Tasas Pasivas</b></div>
            </td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap width="22%"> 
              <div align="right">Tasa Interes Inversiones (24 h) :</div>
            </td>
            <td nowrap width="18%" > 
              <div align="left"> 
                <input type="text" name="E02RTECIR" size="10" maxlength="9" value="<%=charges.getE02RTECIR()%>">
              </div>
            </td>
            <td nowrap width="29%"> 
              <div align="right">Periodo Base :</div>
            </td>
            <td nowrap width="31%" > 
              <div align="left"> 
                <input type="text" name="E02RTEABA" size="4" maxlength="3" value="<%=charges.getE02RTEABA()%>">
              </div>
            </td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap width="22%"> 
              <div align="right">Tasa Flotante :</div>
            </td>
            <td nowrap colspan="3" > 
              <div align="left"> 
                <input type="text" name="E02RTEFTL" size="3" maxlength="2" value="<%=charges.getE02RTEFTL()%>">
                <a href="javascript:GetFloating('E02RTEFTL')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="Tabla de Tasas Flotantes" align="middle" border="0" ></a> 
                <select name="E02RTEFYL">
                  <option value=" " <% if (!(charges.getE02RTEFYL().equals("FP") ||charges.getE02RTEFYL().equals("FS"))) out.print("selected"); %>></option>
                  <option value="FP" <%if (charges.getE02RTEFYL().equals("FP")) { out.print("selected"); }%>>FP</option>
                  <option value="FS" <%if (charges.getE02RTEFYL().equals("FS")) { out.print("selected"); }%>>FS</option>
                </select>
                Factor : 
                <input type="text" name="E02RTEFCL" size="5" maxlength="5" value="<%=charges.getE02RTEFCL()%>">
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
              </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <p>
  <div align="center"> 
    <input id="EIBSBTN" type=submit name="Submit" value="Enviar">
  </div>
</form>
</body>
</html>
