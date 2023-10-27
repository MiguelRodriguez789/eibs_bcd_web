<html>
<head>
<title>Mercadeo</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "marketing" class= "datapro.eibs.beans.ESD008009Message"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>
 
 


<SCRIPT type="text/javascript">

     <% 
   if ( userPO.getOption().equals("CLIENT_P") ) {
   %>
		builtNewMenu(client_personal_opt);
  <%      
   }
   else
   {
   %>
		builtNewMenu(client_corp_opt);
   <%
   }
   %>

</SCRIPT>

</head>

<body bgcolor="#FFFFFF">

<% 
 if ( !error.getERRNUM().equals("0")  ) {
     error.setERRNUM("0");
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
 }
 if ( !userPO.getPurpose().equals("NEW") ) {
    out.println("<SCRIPT> initMenu(); </SCRIPT>");
 }
%> 

<form METHOD="post" ACTION="<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSESD0080" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="48">
  <h3 align="center">Mercadeo</h3>
  <h4 align="left">¿ Le gustar&iacute;a Invertir ? </h4>
<table class="tableinfo">
    <tr > 
      <td nowrap wrap >
        <table  cellpadding="3" cellspacing="0" width="100%" border="0" align="center">
          <tr id="trdark"> 
            <td nowrap width="50%"> 
              <div align="right">¿ Te gustar&iacute;a invertir en nuestro Banco ? </div>
            </td>
            <td nowrap width="50%">&nbsp;</td>
          </tr>
          <tr> 
            <td nowrap width="50%"> 
              <div align="right"></div>
            </td>
            <td nowrap width="50%"> 
              <input type="hidden" name="E09INV" value="<%= marketing.getE09INV()%>">
              <input type="radio" name="CE09INV" value="1" onClick="document.forms[0].E09INV.value='1'"
			  <%if(marketing.getE09INV().equals("1")) out.print("checked");%>>
              SI </td>
          </tr>
          <tr> 
            <td nowrap width="50%"> 
              <div align="right"></div>
            </td>
            <td nowrap width="50%"> 
              <input type="radio" name="CE09INV" value="2" onClick="document.forms[0].E09INV.value='2'"
			  <%if(marketing.getE09INV().equals("2")) out.print("checked");%>>
              NO </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="50%"> 
              <div align="right"> De cuanto es el aproximado de t&uacute; disponsible mensual :</div>
            </td>
            <td nowrap width="50%">&nbsp;</td>
          </tr>
          <tr> 
            <td nowrap width="50%"> 
              <div align="right"></div>
            </td>
            <td nowrap width="50%"> 
              <input type="hidden" name="E09RSG" value="<%= marketing.getE09RSG()%>">
              <input type="radio" name="CE09RSG" value="1" onClick="document.forms[0].E09RSG.value='1'"
			  <%if(marketing.getE09RSG().equals("1")) out.print("checked");%>>
              $500 mil <%= currUser.getE01BCU() %></td>
          </tr>
          <tr> 
            <td nowrap width="50%"> 
              <div align="right"></div>
            </td>
            <td nowrap width="50%"> 
              <input type="radio" name="CE09RSG" value="2" onClick="document.forms[0].E09RSG.value='2'"
			  <%if(marketing.getE09RSG().equals("2")) out.print("checked");%>>
              $1 mill&oacute;n <%= currUser.getE01BCU() %> </td>
          </tr>
          <tr> 
            <td nowrap width="50%"> 
              <div align="right"></div>
            </td>
            <td nowrap width="50%"> 
              <input type="radio" name="CE09RSG" value="3" onClick="document.forms[0].E09RSG.value='3'"
			  <%if(marketing.getE09RSG().equals("3")) out.print("checked");%>>
              $5 mill&oacute;nes <%= currUser.getE01BCU() %></td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <h4>Estas afiliado a C&aacute;maras</h4>
  <table class="tableinfo">
    <tr > 
      <td nowrap wrap >
        <table cellpadding="3" cellspacing="0" width="100%" border="0" align="center">
          <tr id="trdark"> 
            <td nowrap width="25%"> 
              <div align="right">CANACINTRA :</div>
            </td>
            <td nowrap width="25%"> 
              <input type="text" name="E09CTV" value="<%= marketing.getE09CTV().trim()%>" size="20" maxlength="20">
            </td>
            <td nowrap width="25%"> 
              <div align="right">OTROS 1:</div>
            </td>
            <td nowrap width="25%"> 
              <input type="text" name="E09DPA" size="20" maxlength="20" value="<%= marketing.getE09DPA().trim()%>">
            </td>
          </tr>
          <tr> 
            <td nowrap width="25%"> 
              <div align="right">CANIRAC :</div>
            </td>
            <td nowrap width="25%"> 
              <input type="text" name="E09CNT" size="20" maxlength="20" value="<%= marketing.getE09CNT().trim()%>">
            </td>
            <td nowrap width="25%"> 
              <div align="right">2 :</div>
            </td>
            <td nowrap width="25%"> 
              <input type="text" name="E09DPP" size="20" maxlength="20" value="<%= marketing.getE09DPP().trim()%>">
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="25%"> 
              <div align="right">CMIC :</div>
            </td>
            <td nowrap width="25%"> 
              <input type="text" name="E09RD1" value="<%= marketing.getE09RD1().trim()%>" size="20" maxlength="20">
            </td>
            <td nowrap width="25%"> 
              <div align="right">3 :</div>
            </td>
            <td nowrap width="25%"> 
              <input type="text" name="E09PER" size="20" maxlength="20" value="<%= marketing.getE09PER().trim()%>">
            </td>
          </tr>
          <tr> 
            <td nowrap width="25%"> 
              <div align="right">CANACO :</div>
            </td>
            <td nowrap width="25%"> 
              <input type="text" name="E09RD2" value="<%= marketing.getE09RD2().trim()%>" size="20" maxlength="20">
            </td>
            <td nowrap width="25%"> 
              <div align="right">4 :</div>
            </td>
            <td nowrap width="25%"> 
              <input type="text" name="E09CLB" size="20" maxlength="20" value="<%= marketing.getE09CLB().trim()%>">
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="25%"> 
              <div align="right">CONCAMIN :</div>
            </td>
            <td nowrap width="25%"> 
              <input type="text" name="E09PTP" value="<%= marketing.getE09PTP().trim()%>" size="20" maxlength="20">
            </td>
            <td nowrap width="25%"> 
              <div align="right">5 :</div>
            </td>
            <td nowrap width="25%"> 
              <input type="text" name="E09EVC" size="20" maxlength="20" value="<%= marketing.getE09EVC().trim()%>">
            </td>
          </tr>
<%--           <tr> 
            <td nowrap width="25%" rowspan="4"> 
              <div align="right">Obras de Caridad :</div>
            </td>
            <td nowrap width="25%" rowspan="4"> 
              <input type="text" name="E09OBR" size="20" maxlength="20" value="<%= marketing.getE09OBR().trim()%>">
            </td>
            <td nowrap width="25%" rowspan="4"> 
              <div align="right">Idiomas Conocidos :</div>
            </td>
            <td nowrap width="25%"> 
              <input type="text" name="E09LN1" size="20" maxlength="15" value="<%= marketing.getE09LN1().trim()%>">
            </td>
          </tr>
          <tr>
            <td nowrap width="25%">
              <input type="text" name="E09LN2" size="20" maxlength="15" value="<%= marketing.getE09LN2().trim()%>">
            </td>
          </tr>
          <tr>
            <td nowrap width="25%">
              <input type="text" name="E09LN3" size="20" maxlength="15" value="<%= marketing.getE09LN3().trim()%>">
            </td>
          </tr>
          <tr>
            <td nowrap width="25%">
              <input type="text" name="E09LN4" size="20" maxlength="15" value="<%= marketing.getE09LN4().trim()%>">
            </td>
          </tr> --%>
        </table>
      </td>
    </tr>
  </table>
  <h4>Preferencias en Internet</h4>
  <table class="tableinfo">
    <tr > 
      <td nowrap wrap >
        <table cellpadding="3" cellspacing="0" width="100%" border="0" align="center">
          <tr id="trdark"> 
            <td nowrap width="48%"> 
              <div align="right">¿Tiene conexi&oacute;n a Internet en la actualidad 
                ? :</div>
            </td>
            <td nowrap width="26%"> 
              <input type="hidden" name="E09INT" value="<%= marketing.getE09INT()%>">
              <input type="radio" name="CE09INT" value="Y" onClick="document.forms[0].E09INT.value='Y'"
			  <%if(marketing.getE09INT().equals("Y")) out.print("checked");%>>
              S&iacute; 
              <input type="radio" name="CE09INT" value="N" onClick="document.forms[0].E09INT.value='N'"
			  <%if(marketing.getE09INT().equals("N")) out.print("checked");%>>
              No </td>
            <td nowrap width="26%">&nbsp;</td>
          </tr>
          <tr> 
            <td nowrap width="48%"> 
              <div align="right">¿Qué navegador de Internet utiliza ? :</div>
            </td>
            <td nowrap width="26%"> 
              <select name="E09NVG">
                <option value=" " <% if (!(marketing.getE09NVG().equals("1") ||marketing.getE09NVG().equals("2")||marketing.getE09NVG().equals("3"))) out.print("selected"); %>></option>
                <option value="1" <% if (marketing.getE09NVG().equals("1")) out.print("selected"); %>>Microsoft Internet Explorer</option>
                <option value="2" <% if (marketing.getE09NVG().equals("2")) out.print("selected"); %>>Netscape Navigator</option>
                <option value="3" <% if (marketing.getE09NVG().equals("3")) out.print("selected"); %>>Otro</option>
              </select>
            </td>
            <td nowrap width="26%">&nbsp;</td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="48%"> 
              <div align="right">¿Ha hecho compra por Internet anteriormente ? :</div>
            </td>
            <td nowrap width="26%"> 
              <input type="hidden" name="E09CIN" value="<%= marketing.getE09CIN()%>">
              <input type="radio" name="CE09CIN" value="Y" onClick="document.forms[0].E09CIN.value='Y'"
			  <%if(marketing.getE09CIN().equals("Y")) out.print("checked");%>>
              S&iacute; 
              <input type="radio" name="CE09CIN" value="N" onClick="document.forms[0].E09CIN.value='N'"
			  <%if(marketing.getE09CIN().equals("N")) out.print("checked");%>>
              No </td>
            <td nowrap width="26%">&nbsp;</td>
          </tr>
          <tr> 
            <td nowrap width="48%"> 
              <div align="right">¿ Le interesar&iacute;a hacer operaciones por Internet? :</div>
            </td>
            <td nowrap width="26%"> 
              <input type="hidden" name="E09DCI" value="<%= marketing.getE09DCI()%>">
              <input type="radio" name="CE09DCI" value="Y" onClick="document.forms[0].E09DCI.value='Y'"
			  <%if(marketing.getE09DCI().equals("Y")) out.print("checked");%>>
              S&iacute; 
              <input type="radio" name="CE09DCI" value="N" onClick="document.forms[0].E09DCI.value='N'"
			  <%if(marketing.getE09DCI().equals("N")) out.print("checked");%>>
              No </td>
            <td nowrap width="26%">&nbsp;</td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="48%"> 
              <div align="right">P&aacute;ginas preferidas que visita en Internet 
                : </div>
            </td>
            <td nowrap width="26%">&nbsp; </td>
            <td nowrap width="26%">&nbsp; </td>
          </tr>
          <tr> 
            <td nowrap width="48%"> 
              <div align="right"></div>
            </td>
            <td nowrap width="26%"> 
              <input type="checkbox" name="E09PFI"  value="<%= marketing.getE09PFI()%>" onClick="document.forms[0].E09PFI.value='X'"
				<%if(marketing.getE09PFI().equals("X")) out.print("checked");%>>
              Finanzas </td>
            <td nowrap width="26%"> 
              <input type="checkbox" name="E09PCE"  value="<%= marketing.getE09PCE()%>"   onClick="document.forms[0].E09PCE.value='X'"
				<%if(marketing.getE09PCE().equals("X")) out.print("checked");%>>
              Ciencia </td>
          </tr>
          <tr> 
            <td nowrap width="48%"> 
              <div align="right"></div>
            </td>
            <td nowrap width="26%"> 
              <input type="checkbox" name="E09PTE"    value="<%= marketing.getE09PTE()%>" onClick="document.forms[0].E09PTE.value='X'"
				<%if(marketing.getE09PTE().equals("X")) out.print("checked");%>>
              Tecnolog&iacute;a </td>
            <td nowrap width="26%"> 
              <input type="checkbox" name="E09PCO"  value="<%= marketing.getE09PCO()%>"   onClick="document.forms[0].E09PCO.value='X'"
				<%if(marketing.getE09PCO().equals("X")) out.print("checked");%>>
              Computaci&oacute;n </td>
          </tr>
          <tr> 
            <td nowrap width="48%"> 
              <div align="right"></div>
            </td>
            <td nowrap width="26%"> 
              <input type="checkbox" name="E09PEL"  value="<%= marketing.getE09PEL()%>"   onClick="document.forms[0].E09PEL.value='X'"
				<%if(marketing.getE09PEL().equals("X")) out.print("checked");%>>
              Electr&oacute;nica </td>
            <td nowrap width="26%"> 
              <input type="checkbox" name="E09PNE"    value="<%= marketing.getE09PNE()%>" onClick="document.forms[0].E09PNE.value='X'"
				<%if(marketing.getE09PNE().equals("X")) out.print("checked");%>>
              Negocios </td>
          </tr>
          <tr> 
            <td nowrap width="48%"> 
              <div align="right"></div>
            </td>
            <td nowrap width="26%"> 
              <input type="checkbox" name="E09PCI"    value="<%= marketing.getE09PCI()%>" onClick="document.forms[0].E09PCI.value='X'"
				<%if(marketing.getE09PCI().equals("X")) out.print("checked");%>>
              Cine y Televisi&oacute;n</td>
            <td nowrap width="26%"> 
              <input type="checkbox" name="E09PAU"    value="<%= marketing.getE09PAU()%>" onClick="document.forms[0].E09PAU.value='X'"
				<%if(marketing.getE09PAU().equals("X")) out.print("checked");%>>
              Automovilismo </td>
          </tr>
          <tr> 
            <td nowrap width="48%"> 
              <div align="right"></div>
            </td>
            <td nowrap width="26%"> 
              <input type="checkbox" name="E09PDE"    value="<%= marketing.getE09PDE()%>" onClick="document.forms[0].E09PDE.value='X'"
				<%if(marketing.getE09PDE().equals("X")) out.print("checked");%>>
              Deportes </td>
            <td nowrap width="26%"> 
              <input type="checkbox" name="E09PFO"    value="<%= marketing.getE09PFO()%>" onClick="document.forms[0].E09PFO.value='X'"
				<%if(marketing.getE09PFO().equals("X")) out.print("checked");%>>
              Foros de Opini&oacute;n </td>
          </tr>
          <tr> 
            <td nowrap width="48%"> 
              <div align="right"></div>
            </td>
            <td nowrap width="26%"> 
              <input type="checkbox" name="E09PFA"    value="<%= marketing.getE09PFA()%>" onClick="document.forms[0].E09PFA.value='X'"
				<%if(marketing.getE09PFA().equals("X")) out.print("checked");%>>
              Familia </td>
            <td nowrap width="26%"> 
              <input type="checkbox" name="E09PMU"    value="<%= marketing.getE09PMU()%>" onClick="document.forms[0].E09PMU.value='X'"
				<%if(marketing.getE09PMU().equals("X")) out.print("checked");%>>
              M&uacute;sica </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="48%"> 
              <div align="right">Prefiere utilizar internet para comprar :</div>
            </td>
            <td nowrap width="26%">&nbsp;</td>
            <td nowrap width="26%">&nbsp;</td>
          </tr>
          <tr> 
            <td nowrap width="48%"> 
              <div align="right"></div>
            </td>
            <td nowrap width="26%"> 
              <input type="checkbox" name="E09CIV"   value="<%= marketing.getE09CIV()%>"  onClick="document.forms[0].E09CIV.value='X'"
				<%if(marketing.getE09CIV().equals("X")) out.print("checked");%>>
              Inversiones </td>
            <td nowrap width="26%"> 
              <input type="checkbox" name="E09CLI"  value="<%= marketing.getE09CLI()%>"   onClick="document.forms[0].E09CLI.value='X'"
				<%if(marketing.getE09CLI().equals("X")) out.print("checked");%>>
              Libros </td>
          </tr>
          <tr> 
            <td nowrap width="48%"> 
              <div align="right"></div>
            </td>
            <td nowrap width="26%"> 
              <input type="checkbox" name="E09CTE"    value="<%= marketing.getE09CTE()%>" onClick="document.forms[0].E09CTE.value='X'"
				<%if(marketing.getE09CTE().equals("X")) out.print("checked");%>>
              Tecnolog&iacute;a </td>
            <td nowrap width="26%"> 
              <input type="checkbox" name="E09CPA"    value="<%= marketing.getE09CPA()%>" onClick="document.forms[0].E09CPA.value='X'"
				<%if(marketing.getE09CPA().equals("X")) out.print("checked");%>>
              Pasajes A&eacute;reos</td>
          </tr>
          <tr> 
            <td nowrap width="48%"> 
              <div align="right"></div>
            </td>
            <td nowrap width="26%"> 
              <input type="checkbox" name="E09CRE"    value="<%= marketing.getE09CRE()%>" onClick="document.forms[0].E09CRE.value='X'"
				<%if(marketing.getE09CRE().equals("X")) out.print("checked");%>>
              Revistas </td>
            <td nowrap width="26%"> 
              <input type="checkbox" name="E09CVI"    value="<%= marketing.getE09CVI()%>" onClick="document.forms[0].E09CVI.value='X'"
				<%if(marketing.getE09CVI().equals("X")) out.print("checked");%>>
              Videos </td>
          </tr>
          <tr> 
            <td nowrap width="48%" height="26">&nbsp;</td>
            <td nowrap width="26%" height="26"> 
              <input type="checkbox" name="E09CAU"    value="<%= marketing.getE09CAU()%>" onClick="document.forms[0].E09CAU.value='X'"
				<%if(marketing.getE09CAU().equals("X")) out.print("checked");%>>
              Autom&oacute;viles </td>
            <td nowrap width="26%" height="26"> 
              <input type="checkbox" name="E09CTR"    value="<%= marketing.getE09CTR()%>" onClick="document.forms[0].E09CTR.value='X'"
				<%if(marketing.getE09CTR().equals("X")) out.print("checked");%>>
              Otros </td>
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
