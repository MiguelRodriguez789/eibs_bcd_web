<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<%@ page import = "datapro.eibs.master.Util" %>
<html>
<head>
<title>Inversiones</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">


<jsp:useBean id="invBrok" class="datapro.eibs.beans.EIE000501Message"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>

</head>

<body >
<% 
 if ( !error.getERRNUM().equals("0")  ) {
     error.setERRNUM("0");
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
     }


%>
<div align="center"> 
  <h3>Consulta de Brokers <img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="inv_brokers_basic.jsp,EIE0005"> 
  </h3>
</div>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.invest.JSEIE0005" >
  <h4>Informaci�n B�sica 
    <input type="hidden" name="SCREEN"  value="2" >
    <input type="hidden" name="E01FEBTYP"  value="2" >
  </h4>
  <table  class="tableinfo" width="715">
    <tr > 
      <td nowrap> 
        <table cellpadding=2 cellspacing=0 width="100%" border="0">
          <tr id="trdark"> 
            <td nowrap width="17%" > 
              <div align="right">C�digo :</div>
            </td>
            <td nowrap width="36%" > 
              <input type="text" readonly  name="E01FEBNUM" size="5" maxlength="4" value="<%= invBrok.getE01FEBNUM()%>">
            </td>
            <td nowrap width="14%" > 
              <div align="right">N�mero de Impuestos :</div>
            </td>
            <td nowrap width="33%" > 
              <input type="text" readonly  name="E01FEBBID" size="27" maxlength="25" value="<%= invBrok.getE01FEBBID()%>">
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="17%" > 
              <div align="right">Nombre :</div>
            </td>
            <td nowrap width="36%" > 
              <input type="text" readonly  name="E01FEBNM1" size="48" maxlength="45" value="<%= invBrok.getE01FEBNM1()%>">
            </td>
            <td nowrap width="14%" > 
              <div align="right">Nombre Corto :</div>
            </td>
            <td nowrap width="33%" > 
              <input type="text" readonly  name="E01FEBSNM" size="27" maxlength="25" value="<%= invBrok.getE01FEBSNM()%>">
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="17%" > 
              <div align="right">Direcci�n :</div>
            </td>
            <td nowrap width="36%" > 
              <input type="text" readonly  name="E01FEBNM2" size="48" maxlength="45" value="<%= invBrok.getE01FEBNM2()%>">
            </td>
            <td nowrap width="14%" > 
              <div align="right">Ciudad :</div>
            </td>
            <td nowrap width="33%" > 
              <input type="text" readonly  name="E01FEBCTY" size="37" maxlength="35" value="<%= invBrok.getE01FEBCTY()%>">
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="17%" > 
              <div align="right"> </div>
            </td>
            <td nowrap width="36%" > 
              <input type="text" readonly  name="E01FEBNM3" size="48" maxlength="45" value="<%= invBrok.getE01FEBNM3()%>">
            </td>
            <td nowrap width="14%" > 
              <div align="right">Estado :</div>
            </td>
            <td nowrap width="33%" > 
              <input type="text" readonly  name="E01FEBSTE" size="5" maxlength="4" value="<%= invBrok.getE01FEBSTE()%>">
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="17%" > 
              <div align="right"></div>
            </td>
            <td nowrap width="36%" > 
              <input type="text" readonly  name="E01FEBNM4" size="48" maxlength="45" value="<%= invBrok.getE01FEBNM4()%>">
            </td>
            <td nowrap width="14%" > 
              <div align="right">Pa�s :</div>
            </td>
            <td nowrap width="33%" > 
              <input type="text" readonly  name="E01FEBCTR" size="5" maxlength="4" value="<%= invBrok.getE01FEBCTR()%>">
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="17%" > 
              <div align="right">Apartado Postal :</div>
            </td>
            <td nowrap width="36%" > 
              <input type="text" readonly  name="E01FEBZPC" size="17" maxlength="15" value="<%= invBrok.getE01FEBZPC()%>">
            </td>
            <td nowrap width="14%" > 
              <div align="right">C�digo Postal :</div>
            </td>
            <td nowrap width="33%" > 
              <input type="text" readonly  name="E01FEBZIP" size="17" maxlength="15" value="<%= invBrok.getE01FEBZIP()%>">
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="17%" > 
              <div align="right">Telefono 1 :</div>
            </td>
            <td nowrap width="36%" > 
              <input type="text" readonly  name="E01FEBPH1" size="17" maxlength="15" value="<%= invBrok.getE01FEBPH1()%>">
            </td>
            <td nowrap width="14%" > 
              <div align="right">Telefono 2 :</div>
            </td>
            <td nowrap width="33%" > 
              <input type="text" readonly  name="E01FEBPH2" size="17" maxlength="15" value="<%= invBrok.getE01FEBPH2()%>">
            </td>
          </tr>
          <tr id="trclear">
            <td nowrap width="17%" > 
              <div align="right">Correo Electronico 1 :</div>
            </td>
            <td nowrap width="36%" > 
              <input type="text" readonly  name="E01FEBIA1" size="60" maxlength="60" value="<%= invBrok.getE01FEBIA1()%>">
            </td>
            <td nowrap width="14%" >
              <div align="right">Facsimil :</div>
            </td>
            <td nowrap width="333%" >
              <input type="text" readonly  name="E01FEBFA1" size="17" maxlength="15" value="<%= invBrok.getE01FEBFA1()%>">
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="17%" > 
              <div align="right">Correo Electronico 2 :</div>
            </td>
            <td nowrap width="36%" > 
              <input type="text" readonly  name="E01FEBIA2" size="60" maxlength="60" value="<%= invBrok.getE01FEBIA2()%>">
            </td>
            <td nowrap width="14%" > 
            </td>
            <td nowrap width="33%" > 
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <h4>Informaci�n Adicional</h4>
  <table  class="tableinfo" width="546">
    <tr > 
      <td nowrap> 
        <table cellpadding=2 cellspacing=0 width="100%" border="0">
          <tr id="trdark"> 
            <td nowrap width="34%" > 
              <div align="right">Retenciones :</div>
            </td>
            <td nowrap width="34%" > 
              <input type="text" name="E01FEBWTH" size="16" 
				  value="<% if (invBrok.getE01FEBWTH().equals("W")) out.print("Retenciones");
							else if (invBrok.getE01FEBWTH().equals("F")) out.print("Forma 1099");
							else if (invBrok.getE01FEBWTH().equals("B")) out.print("Ambas");
							else out.print("Ninguna");%>" 
				readonly>
            </td>
            <td nowrap width="34%" > 
              <div align="right">Via de Pago :</div>
            </td>
            <td nowrap width="66%" > 
              <input type="text" name="E01FEBPVI" size="25" 
				  value="<% if (invBrok.getE01FEBPVI().equals("A")) out.print("Cuenta de Detalle");
							else if (invBrok.getE01FEBPVI().equals("G")) out.print("Cuenta Contable");
							else if (invBrok.getE01FEBPVI().equals("F")) out.print("Transferencia Via FED");
						    else if (invBrok.getE01FEBPVI().equals("T")) out.print("Transferencia Via Telex");
							else if (invBrok.getE01FEBPVI().equals("1")) out.print("Swift MT-100");
							else if (invBrok.getE01FEBPVI().equals("2")) out.print("Swift MT-200");
							else out.print("Ninguno");%>" 
				readonly>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="34%" > 
              <div align="right">Cuenta de Pago :</div>
            </td>
            <td nowrap > 
              <div align="left"> 
                <input type="text" readonly  name="E01FEBCBK" size="2" maxlength="2" value="<%= invBrok.getE01FEBCBK()%>">
                <input type="text" readonly  name="E01FEBCBR" size="4" maxlength="4" value="<%= invBrok.getE01FEBCBR()%>">
                <input type="text" readonly  name="E01FEBCCY" size="3" maxlength="3" value="<%= invBrok.getE01FEBCCY()%>">
                <input type="text" readonly  name="E01FEBCGL" size="17" maxlength="16" value="<%= invBrok.getE01FEBCGL()%>" >
                <input type="text" readonly  name="E01FEBCAC" size="13" maxlength="12" value="<%= invBrok.getE01FEBCAC().trim()%>">
              </div>
            </td>
            <td nowrap > 
              <div align="right">Centro de Costo :</div>
            </td>
            <td nowrap > 
              <input type="text" readonly  name="E01FEBCCN" size="9" maxlength="8"  value="<%= invBrok.getE01FEBCCN().trim()%>">
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="34%" > 
              <div align="right">Cargos Fijos :</div>
            </td>
            <td nowrap width="34%" > 
              <input type="text" readonly  name="E01FEBFFA" size="13" maxlength="11" value="<%= invBrok.getE01FEBFFA()%>">
            </td>
            <td nowrap width="34%" > 
              <div align="right">Tasa de Cargos Fijos :</div>
            </td>
            <td nowrap width="66%" > 
              <input type="text" readonly  name="E01FEBPRC" size="13" maxlength="11" value="<%= invBrok.getE01FEBPRC()%>">
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="34%" > 
              <div align="right">Tipo de C�lculo de Cargos :</div>
            </td>
            <td nowrap width="34%" >
              <input type="hidden" name="E01FEBFCT" value="<%= invBrok.getE01FEBFCT()%>">
              <input type="radio" name="CE01FEBFCT" value="F" onClick="document.forms[0].E01FEBFCT.value='F'"
			  <%if(invBrok.getE01FEBFCT().equals("F")) out.print("checked");%> disabled>
              Cargos Fijos 
              <input type="radio" name="CE01FEBFCT" value="P" onClick="document.forms[0].E01FEBFCT.value='P'"
			  <%if(invBrok.getE01FEBFCT().equals("P")) out.print("checked");%> disabled>
              Porciento </td>
            <td nowrap width="34%" > 
              <div align="right"></div>
            </td>
            <td nowrap width="66%" >&nbsp; </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="34%" > 
              <div align="right">Monto Pagado :</div>
            </td>
            <td nowrap width="34%" > 
              <input type="text" readonly  name="E01FEBPYT" size="16" maxlength="15" value="<%= invBrok.getE01FEBPYT()%>" 
			onKeyPress="enterDecimal()">
            </td>
            <td nowrap width="34%" > 
              <div align="right">Monto Retenido :</div>
            </td>
            <td nowrap width="66%" > 
              <input type="text" readonly  name="E01FEBWYT" size="16" maxlength="15" value="<%= invBrok.getE01FEBWYT()%>" 
			onKeyPress="enterDecimal()">
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  
  </form>
</body>
</html>
