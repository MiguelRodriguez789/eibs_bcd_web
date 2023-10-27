<%@ page import = "datapro.eibs.master.Util" %>
<%@ page import = "datapro.eibs.beans.*" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN"> 
<html>
<head>
<title>Grupos Económicos</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<%--<jsp:useBean id="grpTotal" class="datapro.eibs.beans.ECIF01201Message" scope="session" />--%>

<jsp:useBean id= "ECIF01201Help" class= "datapro.eibs.beans.JBObjList"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>

<SCRIPT Language="Javascript">

function showGraph() {
 	var pg= "<%=request.getContextPath()%>/pages/s/ECIF012_groups_total_graph.jsp?ROW=" + document.forms[0].ROW.value;
	CenterNamedWindow(pg,'graph',700,560,2);
}

function showAccInq(app,flg)
{
	page = webapp + "/servlet/datapro.eibs.client.JSECIF012?SCREEN=1&appCode=" + app + "&flag=" + flg + "&customer=" + document.forms[0].CUSTOMER.value;
	CenterWindow(page,600,500,2);
}

</SCRIPT>


</head>

<body>

 <% 
 if ( !error.getERRNUM().equals("0")  ) {
     out.println("<SCRIPT Language=\"Javascript\">");
     error.setERRNUM("0");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
 }

	int row;
	try {
		row = Integer.parseInt(request.getParameter("ROW"));
	} 
	catch (Exception e) {
		row = 0;
	}

	ECIF01201Help.setCurrentRow(row);
	ECIF01201Message grpTotal = (ECIF01201Message) ECIF01201Help.getRecord();

%>

<h3 align="center">Resumen de Operaciones por Grupo<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="groups_total.jsp, ECIF012"></h3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSECIF012" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" value="6">
  <INPUT TYPE=HIDDEN NAME="ROW" VALUE="<%=row%>">
  <INPUT TYPE=HIDDEN NAME="CUSTOMER" value="<%= grpTotal.getE01GEMMST().trim() %>">
  <h4> </h4>
 <table class="tableinfo">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap>
        <table cellspacing=0 cellpadding=2 width="100%" border="0">
          <tr id="trdark"> 
            <td nowrap width="22%" height="31"> 
              <div align="right">Relación : :</div>
            </td>
            <td nowrap width="18%" height="31"> 
                <input type="text" readonly name="E01GEMGRP" size="6" maxlength="4" value="<%= grpTotal.getE01GEMGRP().trim()%>">
            </td>
            <td nowrap width="21%" height="31"> 
              <div align="right">Nombre :</div>
            </td>
            <td nowrap width="39%" height="31"> 
                <input type="text" readonly name="E01GEMNA1" size="61" maxlength="60" value="<%= grpTotal.getE01GEMNA1().trim()%>" >
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <h4>Operaciones Registradas</h4>
  <table  id="tbhelp">
    <tr> 
      <td width="12%" nowrap>Gr&aacute;fica</td>
      <td width="88%"><a href="javascript:showGraph()"><img src="<%=request.getContextPath()%>/images/graphic.gif" border="0" width="32" height="32"></a></td>
    </tr>
  </table>
  <table class="tableinfo">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap height="36"> 
        <table cellspacing=0 cellpadding=2 width="100%" border="0">
          <tr id="trdark"> 
            <td nowrap height="31" bordercolor="#000000" colspan=2> 
              <div align="center"><b>A Favor del Banco</b></div>
            </td>
            <td nowrap height="31" bordercolor="#000000" colspan=2> 
              <div align="center"><b>A Favor del Grupo</b></div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="28%" bordercolor="#000000" height="31"> 
              <div align="right">Cuentas Sobregiradas :</div>
            </td>
            <td nowrap width="21%" bordercolor="#000000" height="31"> 
              <div align="center"> 
                <input type="text" class="txtright" readonly name="E01OVDRFT" size="17" maxlength="15" value="<%=  grpTotal.getE01OVDRFT()%>">
              </div>
            </td>
            <td nowrap width="25%" bordercolor="#000000" height="31"> 
              <div align="right">Cuentas sin Intereses :</div>
            </td>
            <td nowrap width="26%" height="31" bordercolor="#000000" > 
              <div align="center">
                <input type="text" class="txtright" readonly name="E01CTACTE" size="17" maxlength="15" value="<%=  grpTotal.getE01CTACTE()%>">
              </div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="28%" bordercolor="#000000"> 
              <div align="right">Préstamos Hipotecarios : </div>
            </td>
            <td nowrap width="21%" bordercolor="#000000"> 
              <div align="center"> 
                <input type="text" class="txtright" readonly name="E01LNSMOR" size="17" maxlength="15" value="<%=  grpTotal.getE01LNSMOR()%>">
              </div>
            </td>
            <td nowrap width="25%" bordercolor="#000000"> 
              <div align="right">Cuentas con Intereses :</div>
            </td>
            <td nowrap width="26%" height="22" bordercolor="#000000" > 
              <div align="center">
                <input type="text" class="txtright" readonly name="E01CTAMMK" size="17" maxlength="15" value="<%=  grpTotal.getE01CTAMMK()%>">
              </div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="28%" bordercolor="#000000" height="35"> 
              <div align="right">Arrendamiento Financiero : </div>
            </td>
            <td nowrap width="21%" bordercolor="#000000" height="35"> 
              <div align="center"> 
                <input type="text" class="txtright" readonly name="E01LNSLSG" size="17" maxlength="15" value="<%=  grpTotal.getE01LNSLSG()%>">
              </div>
            </td>
            <td nowrap width="25%" bordercolor="#000000" height="35"> 
              <div align="right">Cuentas de Ahorro : </div>
            </td>
            <td nowrap width="26%" height="35" bordercolor="#000000" > 
              <div align="center"> 
                <input type="text" class="txtright" readonly name="E01CTAAHO" size="17" maxlength="15" value="<%=  grpTotal.getE01CTAAHO()%>">
              </div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="28%" bordercolor="#000000"> 
              <div align="right">Cr&eacute;dito de Consumo :</div>
            </td>
            <td nowrap width="21%" bordercolor="#000000"> 
              <div align="center"> 
                <input type="text" class="txtright" readonly name="E01LNSCON" size="17" maxlength="15" value="<%=  grpTotal.getE01LNSCON()%>">
              </div>
            </td>
            <td nowrap width="25%" bordercolor="#000000"> 
              <div align="right">Certificados : </div>
            </td>
            <td nowrap width="26%" height="22" bordercolor="#000000" > 
              <div align="center"> 
                <input type="text" class="txtright" readonly name="E01CDTDPO" size="17" maxlength="15" value="<%=  grpTotal.getE01CDTDPO()%>">
              </div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="28%" bordercolor="#000000"> 
              <div align="right">Prest&aacute;mos :</div>
            </td>
            <td nowrap width="21%" bordercolor="#000000"> 
              <div align="center"> 
                <input type="text" class="txtright" readonly name="E01LNSGRL" size="17" maxlength="15" value="<%= grpTotal.getE01LNSGRL()%>">
              </div>
            </td>
            <td nowrap width="25%" bordercolor="#000000"> 
              <div align="right">Inversiones :</div>
            </td>
            <td nowrap width="26%" height="22" bordercolor="#000000" > 
              <div align="center"> 
                <input type="text" class="txtright" readonly name="E01INVERP" size="17" maxlength="15" value="<%= grpTotal.getE01INVERP()%>">
              </div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="28%" bordercolor="#000000"> 
              <div align="right">Facturas Descontadas :</div>
            </td>
            <td nowrap width="21%" bordercolor="#000000"> 
              <div align="center"> 
                <input type="text" class="txtright" readonly name="E01DESDOC" size="17" maxlength="15" value="<%= grpTotal.getE01DESDOC()%>">
              </div>
            </td>
            <td nowrap width="25%" bordercolor="#000000"> 
              <div align="right">Participaciones :</div>
            </td>
            <td nowrap width="26%" height="22" bordercolor="#000000" > 
              <div align="center"> 
                <input type="text" class="txtright" readonly name="E01PARTIC" size="17" maxlength="15" value="<%= grpTotal.getE01PARTIC()%>">
              </div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="28%" bordercolor="#000000"> 
              <div align="right">Inversiones :</div>
            </td>
            <td nowrap width="21%" bordercolor="#000000"> 
              <div align="center"> 
                <input type="text" class="txtright" readonly name="E01INVERA" size="17" maxlength="15" value="<%= grpTotal.getE01INVERA()%>">
              </div>
            </td>
            <td nowrap width="25%" bordercolor="#000000"> 
              <div align="right">Aceptaciones : </div>
            </td>
            <td nowrap width="26%" height="22" bordercolor="#000000" > 
              <div align="center"> 
                <input type="text" class="txtright" readonly name="E01ACEPTP" size="17" maxlength="15" value="<%= grpTotal.getE01ACEPTP()%>">
              </div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="28%" bordercolor="#000000"> 
              <div align="right">Aceptaciones :</div>
            </td>
            <td nowrap width="21%" bordercolor="#000000"> 
              <div align="center"> 
                <input type="text" class="txtright" readonly name="E01ACEPTA" size="17" maxlength="15" value="<%= grpTotal.getE01ACEPTA()%>">
              </div>
            </td>
            <td nowrap width="25%" bordercolor="#000000"> 
              <div align="right">C. de C. en Proceso :</div>
            </td>
            <td nowrap width="26%" height="22" bordercolor="#000000" > 
              <div align="center"> 
                <input type="text" class="txtright" readonly name="E01LCPROC" size="17" maxlength="15" value="<%= grpTotal.getE01LCPROC()%>">
              </div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="28%" bordercolor="#000000"> 
              <div align="right">C. de C. Confirmadas :</div>
            </td>
            <td nowrap width="21%" bordercolor="#000000"> 
              <div align="center"> 
                <input type="text" class="txtright" readonly name="E01LCCONF" size="17" maxlength="15" value="<%= grpTotal.getE01LCCONF()%>">
              </div>
            </td>
            <td nowrap width="25%" bordercolor="#000000"> 
              <div align="right">Spot Vendidos :</div>
            </td>
            <td nowrap width="26%" height="22" bordercolor="#000000" > 
              <div align="center"> 
                <input type="text" class="txtright" readonly name="E01SPTSAL" size="17" maxlength="15" value="<%= grpTotal.getE01SPTSAL()%>">
              </div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="28%" bordercolor="#000000"> 
              <div align="right">Spot Comprados :</div>
            </td>
            <td nowrap width="21%" bordercolor="#000000"> 
              <div align="center"> 
                <input type="text" class="txtright" readonly name="E01SPTPUR" size="17" maxlength="15" value="<%= grpTotal.getE01SPTPUR()%>">
              </div>
            </td>
            <td nowrap width="25%" bordercolor="#000000"> 
              <div align="right">Forward Vendidos :</div>
            </td>
            <td nowrap width="26%" height="22" bordercolor="#000000" > 
              <div align="center"> 
                <input type="text" class="txtright" readonly name="E01FRWSAL" size="17" maxlength="15" value="<%= grpTotal.getE01FRWSAL()%>">
              </div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="28%" bordercolor="#000000"> 
              <div align="right">Forward Comprados :</div>
            </td>
            <td nowrap width="21%" bordercolor="#000000"> 
              <div align="center"> 
                <input type="text" class="txtright" readonly name="E01FRWPUR" size="17" maxlength="15" value="<%= grpTotal.getE01FRWPUR()%>">
              </div>
            </td>
            <td nowrap width="25%" bordercolor="#000000" align="right">Remanentes :</td>
            <td nowrap width="26%" height="22" bordercolor="#000000" > 
              <div align="center">
              	<input type="text" class="txtright" readonly name="E01FRASAL" size="17" maxlength="15" value="<%= grpTotal.getE01FRASAL()%>">
              </div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="28%" bordercolor="#000000">&nbsp;</td>
            <td nowrap width="21%" bordercolor="#000000"> 
              <div align="center"></div>
            </td>
            <td nowrap width="25%" bordercolor="#000000">&nbsp;</td>
            <td nowrap width="26%" height="22" bordercolor="#000000" > 
              <div align="center"></div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="28%" bordercolor="#000000"> 
              <div align="right"><b>Total Activo :</b></div>
            </td>
            <td nowrap width="21%" bordercolor="#000000"> 
              <div align="center"> 
                <input type="text" class="txtright" readonly name="E01TOTASS" size="17" maxlength="15" value="<%= Util.formatCCY(grpTotal.getE01TOTASS())%>">
              </div>
            </td>
            <td nowrap width="25%" bordercolor="#000000"> 
              <div align="right"><b>Total Pasivo :</b></div>
            </td>
            <td nowrap width="26%" height="22" bordercolor="#000000" > 
              <div align="center"> 
                <input type="text" class="txtright" readonly name="E01TOTLIA" size="17" maxlength="15" value="<%= Util.formatCCY(grpTotal.getE01TOTLIA())%>">
              </div>
            </td>
          </tr>
        </table>
        
      </td>
    </tr>
  </table>
  <h4>Lineas de Crédito</h4>
  <table class="tableinfo">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap height="36"> 
        <table cellspacing=0 cellpadding=2 width="100%" border="0">
          <tr id="trdark"> 
            <td nowrap width="21%" height="31" bordercolor="#000000"> 
        <div align="center">Monto Aprobado</div>
      </td>
      <td width="23%"> 
        <div align="center">Monto Utilizado</div>
      </td>
      <td width="20%"> 
              <div align="center">Monto Disponible</div>
      </td>
      <td width="20%"> 
              <div align="center">Participaciones</div>
      </td>
      <td width="20%"> 
        <div align="center">Solicitudes de Hoy</div>
      </td>
    </tr>
    <tr>
      <td width="17%"> 
        <div align="center">
          <input type="text" class="txtright" readonly name="E01LNEAMT"  size="17" maxlength="15" value="<%= grpTotal.getE01LNEAMT()%>" >
        </div>
      </td>
      <td width="23%"> 
        <div align="center">
          <input type="text" class="txtright" readonly name="E01LNEUSE"  size="17" maxlength="15" value="<%= grpTotal.getE01LNEUSE()%>">
        </div>
      </td>
      <td width="20%"> 
              <div align="center"> 
                <input type="text" class="txtright" readonly name="E01LNEAVA"  size="17" maxlength="15" value="<%= grpTotal.getE01LNEAVA()%>">
              </div>
      </td>
      <td width="20%"> 
              <div align="center">
                <input type="text" class="txtright" readonly name="E01PARVEN"  size="17" maxlength="15" value="<%= grpTotal.getE01PARVEN()%>">
              </div>
      </td>
      <td width="20%"> 
        <div align="center">
          <input type="text" class="txtright" readonly name="E01LNETDY"  size="17" maxlength="15" value="<%= grpTotal.getE01LNETDY()%>">
        </div>
      </td>
    </tr>
  </table>
        
      </td>
    </tr>
  </table>
  <h4>Operaciones Contingentes</h4>
  <table class="tableinfo">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap height="36"> 
        <table cellspacing=0 cellpadding=2 width="100%" border="0">
          <tr id="trdark"> 
            <td nowrap height="31" bordercolor="#000000" colspan=2> 
              <div align="center"><b>A Favor del Banco</b></div>
            </td>
            <td nowrap height="31" bordercolor="#000000" colspan=2> 
              <div align="center"><b>A Favor del Grupo</b></div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="28%" bordercolor="#000000"> 
              <div align="right">Garant&iacute;a en Documento : </div>
            </td>
            <td nowrap width="22%" bordercolor="#000000"> 
              <div align="center"> 
                <input type="text" class="txtright" readonly name="E01GARPAG" size="17" maxlength="15" value="<%=  grpTotal.getE01GARPAG()%>">
              </div>
            </td>
            <td nowrap width="26%" bordercolor="#000000"> 
              <div align="right">Garant&iacute;a en Efectivo : </div>
            </td>
            <td nowrap width="24%" height="22" bordercolor="#000000" > 
              <div align="center"> 
                <input type="text" class="txtright" readonly name="E01GAREFE" size="17" maxlength="15" value="<%=  grpTotal.getE01GAREFE()%>">
              </div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="28%" bordercolor="#000000"> 
              <div align="right">Seguros Adquiridos : </div>
            </td>
            <td nowrap width="22%" bordercolor="#000000"> 
              <div align="center">
                <input type="text" class="txtright" readonly name="E01SEGGRL" size="17" maxlength="15" value="<%=  grpTotal.getE01SEGGRL()%>">
               </div>
            </td>
            <td nowrap width="26%" bordercolor="#000000"> 
              <div align="right">Cobranzas Internacionales : </div>
            </td>
            <td nowrap width="24%" height="22" bordercolor="#000000" > 
              <div align="center"> 
                <input type="text" class="txtright" readonly name="E01CBZINT" size="17" maxlength="15" value="<%=  grpTotal.getE01CBZINT()%>">
              </div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="28%" bordercolor="#000000"> 
              <div align="right">Aceptaciones Descontadas : </div>
            </td>
            <td nowrap width="22%" bordercolor="#000000"> 
              <div align="center"> 
                <input type="text" class="txtright" readonly name="E01ACPDES" size="17" maxlength="15" value="<%=  grpTotal.getE01ACPDES()%>">
              </div>
            </td>
            <td nowrap width="26%" bordercolor="#000000"> 
              <div align="right">Cobranzas Locales : </div>
            </td>
            <td nowrap width="24%" height="22" bordercolor="#000000" > 
              <div align="center"> 
                <input type="text" class="txtright" readonly name="E01CBZLOC" size="17" maxlength="15" value="<%=  grpTotal.getE01CBZLOC()%>">
              </div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="28%" bordercolor="#000000"> 
              <div align="right">Cartas Cred. No Confirmadas : </div>
            </td>
            <td nowrap width="22%" bordercolor="#000000"> 
              <div align="center"> 
                <input type="text" class="txtright" readonly name="E01LCNCON" size="17" maxlength="15" value="<%=  grpTotal.getE01LCNCON()%>">
              </div>
            </td>
            <td nowrap width="26%" bordercolor="#000000"> 
              <div align="right">Garant&iacute;as en Custodio : </div>
            </td>
            <td nowrap width="24%" height="22" bordercolor="#000000" > 
              <div align="center"> 
                <input type="text" class="txtright" readonly name="E01COLATE" size="17" maxlength="15" value="<%=  grpTotal.getE01COLATE()%>">
              </div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="28%" bordercolor="#000000"> 
              <div align="right">Cobranzas Recibidas : </div>
            </td>
            <td nowrap width="22%" bordercolor="#000000"> 
              <div align="center"> 
                <input type="text" class="txtright" readonly name="E01COLREC" size="17" maxlength="15" value="<%=  grpTotal.getE01COLREC()%>">
              </div>
            </td>
            <td nowrap width="26%" bordercolor="#000000"> 
              <div align="right">Certificados Pignorados : </div>
            </td>
            <td nowrap width="24%" height="22" bordercolor="#000000" > 
              <div align="center"> 
                <input type="text" class="txtright" readonly name="E01CDTPIG" size="17" maxlength="15" value="<%=  grpTotal.getE01CDTPIG()%>">
              </div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="28%" bordercolor="#000000">&nbsp;</td>
            <td nowrap width="22%" bordercolor="#000000">&nbsp;</td>
            <td nowrap width="26%" bordercolor="#000000"> 
              <div align="right"></div>
            </td>
            <td nowrap width="24%" height="22" bordercolor="#000000" > 
              <div align="center"> </div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="28%" bordercolor="#000000"> 
              <div align="right"><b>Total D&eacute;bito : </b></div>
            </td>
            <td nowrap width="22%" bordercolor="#000000"> 
              <div align="center"> 
                <input type="text" class="txtright" readonly name="E01TOTCDB" size="17" maxlength="15" value="<%=  grpTotal.getE01TOTCDB()%>">
              </div>
            </td>
            <td nowrap width="26%" bordercolor="#000000"> 
              <div align="right"><b>Total Cr&eacute;dito : </b></div>
            </td>
            <td nowrap width="24%" height="22" bordercolor="#000000" > 
              <div align="center"> 
                <input type="text" class="txtright" readonly name="E01TOTCCR" size="17" maxlength="15" value="<%=  grpTotal.getE01TOTCCR()%>">
              </div>
            </td>
          </tr>
        </table>
        
      </td>
    </tr>
  </table>
  </form>
</body>
</html>
