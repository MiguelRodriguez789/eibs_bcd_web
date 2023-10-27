<%@page import="com.datapro.eibs.constants.ISOCodes"%>
<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>

<%@ page import = "datapro.eibs.master.Util" %>
<%@page import="com.datapro.constants.EibsFields"%>
<%@page import="com.datapro.eibs.constants.HelpTypes"%>
<html>
<head>
<title>Productos para Portafolio</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<SCRIPT SRC="<%=request.getContextPath()%>/pages/s/javascripts/dynlayer.js"> </SCRIPT>
<SCRIPT SRC="<%=request.getContextPath()%>/pages/s/javascripts/pop_out.js"> </SCRIPT>
<SCRIPT	SRC="<%=request.getContextPath()%>/pages/s/javascripts/nav_aid.js"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>

</head>

<jsp:useBean id="prd" class="datapro.eibs.beans.ESD070001Message"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />

<body>

<% 
 if ( !error.getERRNUM().equals("0")  ) {
     error.setERRNUM("0");
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     error.setERRNUM("0");
     out.println("</SCRIPT>");
     }
%>

<h3 align="center">Mantenimiento Producto Portafolio<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" alt="products_portfolio.jsp, ESD0700"></h3>
<hr size="4">

<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSESD0700" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="1">
  <INPUT TYPE=HIDDEN NAME="E01APCACD" VALUE="<%= prd.getE01APCACD()%>">
  <INPUT TYPE=HIDDEN NAME="PRDDSC" VALUE="">
  <table class="tableinfo">
    <tr > 
      <td> 
        <table cellspacing="0" cellpadding="2" width="100%"  class="tbhead"  align="center">
          <tr> 
            <td nowrap width="10%" align="right"> Banco: </td>
            <td nowrap width="12%" align="left"> 
              <input type="text"  name="E01APCBNK" size="3" maxlength="2" value="<%= prd.getE01APCBNK()%>" readonly>
            </td>
            <td nowrap width="6%" align="right"> Producto : </td>
            <td nowrap width="14%" align="left"> 
              <input type="text"  name="E01APCCDE" size="6" maxlength="4" value="<%= prd.getE01APCCDE()%>" readonly>
            </td>
            <td nowrap width="8%" align="right"> Tipo Producto : </td>
            <td nowrap width="50%"align="left"> 
              <input type="text"  name="E01APCTYP" size="6" maxlength="4" value="<%= prd.getE01APCTYP()%>" readonly>
              - 
              <input type="text"  name="E01DSCTYP" size="25" maxlength="25" value="<%= prd.getE01DSCTYP()%>" readonly>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <h4>Información General</h4>
<table class="tableinfo">
    <tr > 
      <td > 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="trdark"> 
            <td > 
              <div align="right">Descripción :</div>
            </td>
            <td > 
              <input type="text"  name="E01APCDS1" size="40" maxlength="40" value="<%= prd.getE01APCDS1()%>">
            </td>
            <td > 
              <div align="right">Nombre de Mercadeo :</div>
            </td>
            <td > 
              <input type="text"  name="E01APCDS2" size="30" maxlength="25" value="<%= prd.getE01APCDS2()%>">
            </td>
          </tr>
          <tr id="trclear"> 
            <td > 
              <div align="right">Código de Moneda :</div>
            </td>
            <td > 
              <input type="text"  name="E01APCCCY" size="3" maxlength="3" value="<%= prd.getE01APCCCY()%>">
              <a href="javascript:GetCurrency('E01APCCCY','')">
              <img src="<%=request.getContextPath()%>/images/1b.gif" alt=". . ." align="bottom" border="0" ></a> 
            </td>
            <td > 
              <div align="right">Ofrecimiento por :</div>
            </td>
            <td > 
            <SELECT name="E01APCFTT">
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
				</SELECT><td >
            </td>
          </tr>
          <tr id="trdark"> 
            <td > 
              <div align="right"> Cuenta Contable :</div>
            </td>
            <td > 
              <input type="text"  name="E01APCGLN" size="17" maxlength="16" value="<%= prd.getE01APCGLN().trim()%>">
              <a href="javascript:GetLedger('E01APCGLN',document.forms[0].E01APCBNK.value,document.forms[0].E01APCCCY.value,'')">
              <img src="<%=request.getContextPath()%>/images/1b.gif" alt=". . ." align="bottom" border="0" ></a> 
            </td>
            <td > 
              <div align="right">Tabla de Documentos :</div>
            </td>
            <td ><INPUT type="text" name="E01APCFTF" size="4" maxlength="2" value="<%= prd.getE01APCFTF().trim()%>">
            <a href="javascript:GetDocInv('E01APCFTF')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt=". . ." align="bottom" border="0"></a> 
            </td>
          </tr>
          <tr id="trclear"> 
            <td > 
              <div align="right"> Corporación/Personal :</div>
            </td>
            <td > 
               <select name="E01APCFL4">
                <option value="1" <%if (prd.getE01APCFL4().equals("1")) { out.print("selected"); }%>>Corporación</option>
                <option value="2" <%if (prd.getE01APCFL4().equals("2")) { out.print("selected"); }%>>Personal</option>
                <option value="" <%if (prd.getE01APCFL4().equals(""))   { out.print("selected"); }%>>No Aplica</option>
              </select>
             </td>
            <td > 
              <div align="right">Producto Compra/Venta :</div>
            </td>
            <td >
            	<INPUT type="text" name="E01APCINV" size="5" maxlength="4" value="<%= prd.getE01APCINV().trim()%>">
            	<a href="javascript:GetProduct('E01APCINV','IV','','PRDDSC',document.forms[0].E01APCTYP.value,'N')">
                <img src="<%=request.getContextPath()%>/images/1b.gif" alt="Ayuda" align="bottom" border="0" ></a>
            </td>
          </tr>          
        </table>
      </td>
    </tr>
  </table>
  <h4>Información Adicional</h4>

  <table class="tableinfo">
    <tr > 
      <td >
            <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="trdark">
                        <td width="354"> 
              <div align="right">Tabla de Comisiones :</div>
            </td>
            <td width="330"><INPUT type="text" name="E01APCTLN" size="3" maxlength="3" value="<%= prd.getE01APCTLN().trim()%>">
              	<a href="javascript:GetCommCustodyTable('E01APCTLN',document.forms[0].E01APCTYP.value,document.forms[0].E01APCTYP.value,'',document.forms[0].E01APCBNK.value)">
              	<img src="<%=request.getContextPath()%>/images/1b.gif" alt="help" align="bottom" border="0"></a> 
            </td>
                    </tr>
          <tr id="trclear">
                        <td width="354"> 
              <div align="right">Soporta Pago de Intereses :</div>
            </td>
                        <td width="330"><INPUT type="radio" name="E01APCFRN" value="Y" <%if (prd.getE01APCFRN().equals("Y")) out.print("checked"); %>="">
              Yes 
              <INPUT type="radio" name="E01APCFRN" value="N" <%if (prd.getE01APCFRN().equals("N")) out.print("checked"); %>=""> No </td>
                    </tr>
          <tr id="trdark">
                        <td width="354"> 
              <div align="right">Soporta Pago de Capital :</div>
            </td>
                        <td width="330"><INPUT type="radio" name="E01APCMCI" value="Y" <%if (prd.getE01APCMCI().equals("Y")) out.print("checked"); %>="">
              Yes 
              <INPUT type="radio" name="E01APCMCI" value="N" <%if (prd.getE01APCMCI().equals("N")) out.print("checked"); %>=""> No </td>
                    </tr>                   
          <tr id="trclear">
                        <td width="354"> 
              <div align="right">Soporta Pago de Dividendos :</div>
            </td>
                        <td width="330"><INPUT type="radio" name="E01APCMCP" value="Y" <%if (prd.getE01APCMCP().equals("Y")) out.print("checked"); %>="">
              Yes 
              <INPUT type="radio" name="E01APCMCP" value="N" <%if (prd.getE01APCMCP().equals("N")) out.print("checked"); %>="">
              No
          	</td>
                    </tr>                   
          <tr id="trdark">
                        <td width="354"> 
              <div align="right">Tipo Productos Banco :</div>
            </td>
                        <td width="330"><SELECT name="E01APCICT">
                            <OPTION value="1" <%if (prd.getE01APCICT().equals("1")) { out.print("selected"); }%>="">Certificados/Depositos</OPTION>
                            <OPTION value="2" <%if (prd.getE01APCICT().equals("2")) { out.print("selected"); }%>="">Inversiones Interbancarias</OPTION>
                            <OPTION value="3" <%if (prd.getE01APCICT().equals("3")) { out.print("selected"); }%>="">Inversiones 24 Horas</OPTION>
                            <OPTION value="N" <%if (prd.getE01APCICT().equals("N")) { out.print("selected"); }%>="">Ninguna</OPTION>
                        </SELECT></td>
                    </tr>                   
          <tr id="trclear">
                        <td width="354"> 
              <div align="right">Frecuencia Revaluación :</div>
            </td>
                        <td width="330"><SELECT name="E01APCAMO">
                            <OPTION value="D" <%if (prd.getE01APCAMO().equals("D")) { out.print("selected"); }%>="">Diaria</OPTION>
                            <OPTION value="M" <%if (prd.getE01APCAMO().equals("M")) { out.print("selected"); }%>="">Mensual</OPTION>
                            <OPTION value="Q" <%if (prd.getE01APCAMO().equals("Q")) { out.print("selected"); }%>="">Trimestral</OPTION>
                            <OPTION value="S" <%if (prd.getE01APCAMO().equals("S")) { out.print("selected"); }%>="">Semestral</OPTION>
                            <OPTION value="Y" <%if (prd.getE01APCAMO().equals("Y")) { out.print("selected"); }%>="">Anual</OPTION>
                        </SELECT></td>
                    </tr>                   
          <tr id="trdark">
                        <td width="354"> 
              <div align="right">Uso de Cuenta Margen :</div>
            </td>
                        <td width="330"><INPUT type="radio" name="E01APCCHR" value="Y" <%if (prd.getE01APCCHR().equals("Y")) out.print("checked"); %>="">
              Si 
              <INPUT type="radio" name="E01APCCHR" value="N" <%if (prd.getE01APCCHR().equals("N")) out.print("checked"); %>="">
              No
          	</td>
                    </tr>                   

          <tr id="trclear">
                        <td width="354"> 
              <div align="right">Cartera Propia :</div>
            </td>
                        <td width="430"><SELECT name="E01APCFL3">
                            <OPTION value="N" <%if (prd.getE01APCFL3().equals("N")) { out.print("selected"); }%>="">No Aplica</OPTION>
                            <OPTION value="1" <%if (prd.getE01APCFL3().equals("1")) { out.print("selected"); }%>="">Disponible para la Venta</OPTION>
                            <OPTION value="2" <%if (prd.getE01APCFL3().equals("2")) { out.print("selected"); }%>="">Mantener hasta su Vencimiento</OPTION>
                            <OPTION value="3" <%if (prd.getE01APCFL3().equals("3")) { out.print("selected"); }%>="">Para negociar</OPTION>
                        </SELECT></td>
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
