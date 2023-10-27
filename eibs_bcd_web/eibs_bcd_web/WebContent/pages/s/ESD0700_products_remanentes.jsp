<html>
<head>
<title>Consulta de Productos para Remanentes</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id="prd" class="datapro.eibs.beans.ESD070001Message"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>

<SCRIPT SRC="<%=request.getContextPath()%>/pages/s/javascripts/dynlayer.js"> </SCRIPT>
<SCRIPT SRC="<%=request.getContextPath()%>/pages/s/javascripts/pop_out.js"> </SCRIPT>
<SCRIPT SRC="<%=request.getContextPath()%>/pages/s/javascripts/nav_aid.js"> </SCRIPT>

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>


<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />

<script src="<%=request.getContextPath()%>/jquery/readOnlyPage.jsp"> </script>


</head>


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

<h3 align="center">Producto para Remanentes (Miscelaneos)<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="products_remanentes.jsp, ESD0700"></h3>
<hr size="4">

<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSESD0700" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="1">
  <INPUT TYPE=HIDDEN NAME="E01APCACD" VALUE="<%= prd.getE01APCACD()%>">
  <INPUT TYPE="hidden" NAME="H01FLGMAS" >

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
            <td nowrap width="6%" align="right"> Producto : </td>
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
          <tr id="trdark"> 
            <td><div align="right">Descripci&oacute;n :</div></td>
            <td> 
              <input type="text"  name="E01APCDS1" size="50" maxlength="45" value="<%= prd.getE01APCDS1()%>">
            </td>
            <td><div align="right">Nombre de Mercadeo :</div></td>
            <td> 
              <input type="text"  name="E01APCDS2" size="28" maxlength="25" value="<%= prd.getE01APCDS2()%>">
            </td>
          </tr>
          <tr id="trclear"> 
            <td ><div align="right">C&oacute;digo de Moneda :</div></td>
            <td > 
              <input type="text"  name="E01APCCCY" size="3" maxlength="3" value="<%= prd.getE01APCCCY()%>">
              <a href="javascript:GetCurrency('E01APCCCY','')"><img src="<%=request.getContextPath()%>/images/1b.gif" title=". . ." align="bottom" border="0" ></a> 
            </td>
            <td ><div align="right">Ofrecimiento por :</div></td>
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
                <%if (prd.getE01APCFTT().equals("5")) { out.print("selected"); }%>>Cualquier Medio</OPTION>
                <OPTION value="N"
                <%if (prd.getE01APCFTT().equals("N")) { out.print("selected"); }%>>No Ofrecer</OPTION>
              </SELECT>
            </td>
          </tr>
          <tr id="trdark"> 
            <td ><div align="right"> Cuenta Contable:</div></td>
            <td > 
              <input type="text"  name="E01APCGLN" size="18" maxlength="16" value="<%= prd.getE01APCGLN().trim()%>">
              <a href="javascript:GetLedger('E01APCGLN',document.forms[0].E01APCBNK.value,document.forms[0].E01APCCCY.value,document.forms[0].E01APCACD.value,'','<%= prd.getE01APCTYP().trim()%>')">
              <img src="<%=request.getContextPath()%>/images/1b.gif" title=". . ." align="bottom" border="0" ></a> 
            </td>
            <td><div align="right">Permite Aumento de Saldo :</div></td>
            <td width="25%">
              <input type="radio" name="E01APCICT" value="Y" <% if (!prd.getE01APCICT().equals("N")) out.print("checked"); %>>Si   
              <input type="radio" name="E01APCICT" value="N" <%if (prd.getE01APCICT().equals("N")) out.print("checked"); %>>No
            </td>
          </tr> 
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td width="25%" align="right">Tipo de Cliente :</td>
            <td width="25%"> 
              <select name="E01APCFRA">
                <option value=" " <%if (prd.getE01APCFRA().equals(" ")) { out.print("selected"); }%>>Cualquiera</option>
                <option value="0" <%if (prd.getE01APCFRA().equals("0")) { out.print("selected"); }%>>Socio</option>
                <option value="1" <%if (prd.getE01APCFRA().equals("1")) { out.print("selected"); }%>>Empresa</option>
                <option value="2" <%if (prd.getE01APCFRA().equals("2")) { out.print("selected"); }%>>Persona</option>
                <option value="3" <%if (prd.getE01APCFRA().equals("3")) { out.print("selected"); }%>>Menor de Edad</option>
                <option value="4" <%if (prd.getE01APCFRA().equals("4")) { out.print("selected"); }%>>Empleados</option>
              </select>
            </td>
            <td width="25%" align="right">Permite Clientes Simplificados : </td>
            <td width="25%" >
              <input type="radio" name="E01APCTX9" value="Y" <%if (prd.getE01APCTX9().equals("Y")) out.print("checked"); %>> Si 
              <input type="radio" name="E01APCTX9" value="N" <%if (prd.getE01APCTX9().equals("N")) out.print("checked"); %>> No
            </td>
          </tr>                  
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td width="25%" align="right">Origen :</td>
            <td width="25%"> 
              <select name="E01APCTAR" id="E01APCTAR" >
                <option value=" " <% if (!(prd.getE01APCTAR().equals("RM")||prd.getE01APCTAR().equals("RV") ||prd.getE01APCTAR().equals("RP") || prd.getE01APCTAR().equals("PD") || prd.getE01APCTAR().equals("LS") || prd.getE01APCTAR().equals("MS") || prd.getE01APCTAR().equals("PN") || prd.getE01APCTAR().equals("DP"))) out.print("selected"); %>> </option>
                <option value="RM" <% if (prd.getE01APCTAR().equals("RM")) out.print("selected"); %>>prd</option>
                <option value="RV" <% if (prd.getE01APCTAR().equals("RV")) out.print("selected"); %>>Rechazos Varios</option>                   
                <option value="RP" <% if (prd.getE01APCTAR().equals("RP")) out.print("selected"); %>>Rechazo Planilla</option>                   
                <option value="PD" <% if (prd.getE01APCTAR().equals("PD")) out.print("selected"); %>>Primas Devueltas</option> 
                <option value="LS" <% if (prd.getE01APCTAR().equals("LS")) out.print("selected"); %>>Liquidacion Seguros</option>  
                <option value="MS" <% if (prd.getE01APCTAR().equals("MS")) out.print("selected"); %>>Miscelaneos</option>                                     
                <option value="PN" <% if (prd.getE01APCTAR().equals("PN")) out.print("selected"); %>>Prestamos Negociados</option> 
                <option value="DP" <% if (prd.getE01APCTAR().equals("DP")) out.print("selected"); %>>Depositos a Plazo</option>                                    
              </select>             
            </td>
            <td width="25%" align="right">Sub Origen</td>
            <td width="25%" >
            	<input type="text"  name="E01APCINV" size="5" maxlength="4" value="<%= prd.getE01APCINV().trim()%>">	
          	  <a href="javascript:GetCodeCNOFC('E01APCINV','OR')">
          	  <img 	src="<%=request.getContextPath()%>/images/1b.gif" title="ayuda" align="bottom" border="0">
          	  </a>
            </td>
          </tr>                  
        </table>
      </td>
    </tr>
  </table>

<div align="center"><input id="EIBSBTN" type=Submit name="Submit" value="Enviar"></div>

 </form>
</body>
</html>
