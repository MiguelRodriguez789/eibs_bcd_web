<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput"%>
<%@page import="com.datapro.constants.EibsFields"%>
<%@page import="com.datapro.eibs.constants.HelpTypes"%>
<%@ page import = "datapro.eibs.master.Util" %>

<html>
<head>
<title>Mantenimiento de Plan de Fomento </title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id="RecData" class="datapro.eibs.beans.ECB001101Message"  scope="session" />
<jsp:useBean id="error" class="datapro.eibs.beans.ELEERRMessage" scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session" />
<jsp:useBean id="currUser" class="datapro.eibs.beans.ESS0030DSMessage" scope="session" />

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </script>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </script>


<script src="<%=request.getContextPath()%>/jquery/readOnlyPage.jsp"> </script>


<script type="text/javascript">

 function goAction(op) {
	
	getElement("SCREEN").value = op;
	document.forms[0].submit();
 }
 </script>
</head>

<%
	boolean maintenance=false;
	boolean readOnly = false;
%> 
          
<body>
<%
	if (!error.getERRNUM().equals("0")) {
		error.setERRNUM("0");
		out.println("<SCRIPT Language=\"Javascript\">");
		out.println("       showErrors()");
		out.println("</SCRIPT>");
	}
	if (!userPO.getPurpose().equals("NEW")) {
		maintenance = true;
		out.println("<SCRIPT> initMenu(); </SCRIPT>");
	}
%>

<h3 align="center">
<% if("1".equals( currUser.getH01WK1()) ){ %>      
	Consulta Porcentajes de Cobranza
<% 	readOnly = true;
 }else if (maintenance){ %>
	Mantenimiento Porcentajes de Cobranza
<%} else { %>
	Nuevo Porcentaje de Cobranza
<%} %>
 <img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="porcentajes_cobranza_detalles.jsp, ECB0011"></h3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.params.JSECB0011" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="600">
 
  <%int row = 0; %>
  <table  class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
		   <tr id="trdark">
             <td nowrap width="25%" align="right"> Codigo : 
               </td>          
             <td nowrap align="left" width="75%">
                <input type="text" name="E01PFMCOD" size="5" maxlength="4" value="<%= RecData.getE01PCZCDE()%>" readonly >
             </td> 
       	 </tr>
        </table>
      </td>
    </tr>
  </table>
  
  <h4>Informacion </h4>
  <table  class="tableinfo">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td width="15%"><div align="right">Descripci&oacute;n :</div></td>
            <td width="35%"> 
              <eibsinput:text name="RecData" property="E01PCZDSC" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DESCRIPTION%>" readonly="<%=readOnly%>"/>
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td width="15%"><div align="right">Estado :</div></td>
            <td width="35%"> 
              <select name="E01PCZSTS">
              <option value=" " <%if (!(RecData.getE01PCZSTS().equals("A") ||RecData.getE01PCZSTS().equals("C"))) out.print("selected"); %>></option>
              <option value="A" <%if (RecData.getE01PCZSTS().equals("A")) { out.print("selected"); }%>> Activo</option>
              <option value="C" <%if (RecData.getE01PCZSTS().equals("C")) { out.print("selected"); }%>> Inactivo</option>
              </select>  
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td width="15%"><div align="right">IVA :</div></td>
            <td width="35%"> 
              <input type="radio" name="E01PCZIVA" value="Y" <%if(RecData.getE01PCZIVA().equals("Y"))  out.print("checked");%>>Si
              <input type="radio" name="E01PCZIVA" value="N" <%if(!RecData.getE01PCZIVA().equals("Y")) out.print("checked");%>>No	
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>

  <h4>Rangos</h4>
  <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" align="left" >
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
            <td nowrap width="16%"> 
              <div align="center"><b>L&iacute;mite 1<br>D&iacute;as Hasta - Porcentaje</b></div>
            </td>
            <td nowrap width="16%"> 
              <div align="center"><b>L&iacute;mite 2<br>D&iacute;as Hasta - Porcentaje</b></div>
            </td>
            <td nowrap width="16%"> 
              <div align="center"><b>L&iacute;mite 3<br>D&iacute;as Hasta - Porcentaje</b></div>
            </td>
            <td nowrap width="16%" > 
              <div align="center"><b>L&iacute;mite 4<br>D&iacute;as Hasta - Porcentaje</b></div>
            </td>
            <td nowrap width="16%" > 
              <div align="center"><b>L&iacute;mite 5<br>D&iacute;as Hasta - Porcentaje</b></div>
            </td>
            <td nowrap width="16%" > 
              <div align="center"><b>L&iacute;mite 6<br>D&iacute;as Hasta - Porcentaje</b></div>
            </td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
            <td nowrap width="16%"> 
              <div align="center">
                <input type="text" class="txtright" name="E01PCZDM1" size="6" maxlength="5" value="<%= RecData.getE01PCZDM1()%>">
                <input type="text" class="txtright" name="E01PCZPR1" size="6" maxlength="5" value="<%= RecData.getE01PCZPR1()%>">
              </div>
            </td>
            <td nowrap width="16%"> 
              <div align="center"> 
                <input type="text" class="txtright" name="E01PCZDM2" size="6" maxlength="5" value="<%= RecData.getE01PCZDM2()%>">
                <input type="text" class="txtright" name="E01PCZPR2" size="6" maxlength="5" value="<%= RecData.getE01PCZPR2()%>">
              </div>
            </td>
            <td nowrap width="16%"> 
              <div align="center"> 
                <input type="text" class="txtright" name="E01PCZDM3" size="6" maxlength="5" value="<%= RecData.getE01PCZDM3()%>">
                <input type="text" class="txtright" name="E01PCZPR3" size="6" maxlength="5" value="<%= RecData.getE01PCZPR3()%>">
              </div>
            </td>
            <td nowrap width="16%"> 
              <div align="center"> 
                <input type="text" class="txtright" name="E01PCZDM4" size="6" maxlength="5" value="<%= RecData.getE01PCZDM4()%>">
                <input type="text" class="txtright" name="E01PCZPR4" size="6" maxlength="5" value="<%= RecData.getE01PCZPR4()%>">
              </div>
            </td>
            <td nowrap width="16%" > 
              <div align="center"> 
                <input type="text" class="txtright" name="E01PCZDM5" size="6" maxlength="5" value="<%= RecData.getE01PCZDM5()%>">
                <input type="text" class="txtright" name="E01PCZPR5" size="6" maxlength="5" value="<%= RecData.getE01PCZPR5()%>">
              </div>
            </td>
            <td nowrap width="16%" > 
              <div align="center"> 
                <input type="text" class="txtright" name="E01PCZDM6" size="6" maxlength="5" value="<%= RecData.getE01PCZDM6()%>">
                <input type="text" class="txtright" name="E01PCZPR6" size="6" maxlength="5" value="<%= RecData.getE01PCZPR6()%>">
              </div>
            </td>
          </tr>
        </table>
  </table>
    
  <% if(!"@GEN".equals( RecData.getE01PCZCDE()) ){ %>      
  <h4>Adicional </h4>
  <table  class="tableinfo">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td width="15%"> 
              <div align="right">Saldo a Capital :</div>
            </td>
            <td width="35%">
              <input type="text" name="E01PCZPRD" size="17" maxlength="15" value="<%= RecData.getE01PCZPRD() %>" onKeypress="enterDecimal(event, 2)" > 
              (Desde)&nbsp;&nbsp;
              <input type="text" name="E01PCZPRH" size="17" maxlength="15" value="<%= RecData.getE01PCZPRH() %>" onKeypress="enterDecimal(event, 2)" > 
              (Hasta) 
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td width="15%"><div align="right">Estado Prestamo :</div></td>
            <td width="35%"> 
              <select name="E01PCZDLI">
                <option value=" " <%if (!(RecData.getE01PCZDLI().equals("1") ||RecData.getE01PCZDLI().equals("2") ||RecData.getE01PCZDLI().equals("3") ||RecData.getE01PCZDLI().equals("4"))) out.print("selected"); %>></option>
                <option value="1" <%if (RecData.getE01PCZDLI().equals("1")) { out.print("selected"); }%>> VIGENTE</option>
                <option value="2" <%if (RecData.getE01PCZDLI().equals("2")) { out.print("selected"); }%>> VENCIDO</option>
                <option value="3" <%if (RecData.getE01PCZDLI().equals("3")) { out.print("selected"); }%>> CASTIGADO</option>
                <option value="4" <%if (RecData.getE01PCZDLI().equals("4")) { out.print("selected"); }%>> CASTIGADO NO INF</option>
              </select>
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td width="15%"><div align="right">Modalidad :</div></td>
            <td width="35%"> 
              <select name="E01PCZMOD">
                <option value=" " <% if (!(RecData.getE01PCZMOD().equals("M") ||RecData.getE01PCZMOD().equals("C") ||RecData.getE01PCZMOD().equals("L") ||RecData.getE01PCZMOD().equals("H"))) out.print("selected"); %>></option>
                <option value="M" <%if (RecData.getE01PCZMOD().equals("M")) { out.print("selected"); }%>> Microcredito</option>
                <option value="C" <%if (RecData.getE01PCZMOD().equals("C")) { out.print("selected"); }%>> Consumo</option>
                <option value="L" <%if (RecData.getE01PCZMOD().equals("L")) { out.print("selected"); }%>> Comercial</option>
                <option value="H" <%if (RecData.getE01PCZMOD().equals("H")) { out.print("selected"); }%>> Vivienda</option>
              </select>
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td width="15%"> 
              <div align="right">Tipo de Producto :</div>
            </td>
            <td width="35%"> 
              <input type="text" name="E01PCZATY" size="5" maxlength="4" value="<%= RecData.getE01PCZATY() %>" >
              <a href="javascript:GetProductRates('E01PCZATY','10')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="help" align="middle" border="0" ></a>
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td width="15%"><div align="right">Producto :</div></td>
            <td width="35%"> 
              <input type="text" name="E01PCZPRO" size="5" maxlength="4" value="<%= RecData.getE01PCZPRO() %>" >
              <a href="javascript:GetProduct('E01PCZPRO','10','<%=currUser.getE01UBK()%>','','E01PCZATY')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="help" align="middle" border="0" ></a> 
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td width="15%"> 
              <div align="right">Oficina :</div>
            </td>
            <td width="35%"> 
              <input type="text" name="E01PCZBRN" size="5" maxlength="4" value="<%= RecData.getE01PCZBRN() %>" >
              <a href="javascript:GetBranch('E01PCZBRN','')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" border="0"  ></a>
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td width="15%"> 
              <div align="right">Zona Comercial :</div>
            </td>
            <td width="35%"> 
              <eibsinput:cnofc name="RecData" flag="lC" property="E01PCZRGN" fn_code="E01PCZRGN" fn_description="" />
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td width="15%"><div align="right">Situacion de Cobranza: </div></td>
            <td width="35%"> 
              <input type="text" name="E01PCZCBZ" size="5" maxlength="4" value="<%= RecData.getE01PCZCBZ().trim()%>">
              <a href="javascript:GetCobranza('E01PCZCBZ','')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="bottom" border="0" ></a> 
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td width="15%"><div align="right">Gestor Responsable: </div></td>
            <td width="35%"> 
              <eibsinput:cnofc name="RecData" flag="Y9" property="E01PCZGCB" fn_code="E01PCZGCB" fn_description="" />
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td width="15%"> 
              <div align="right">Segmento :</div>
            </td>
            <td width="35%"> 
              <eibsinput:cnofc name="RecData" flag="S5" property="E01PCZSEG" fn_code="E01PCZSEG" fn_description="" />
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td width="15%"><div align="right">Ley Mipyme :</div></td>
            <td width="35%"> 
              <input type="radio" name="E01PCZPYM" value="Y" <%if(RecData.getE01PCZPYM().equals("Y")) out.print("checked");%>>Si
              <input type="radio" name="E01PCZPYM" value="N" <%if(RecData.getE01PCZPYM().equals("N")) out.print("checked");%>>No
              <input type="radio" name="E01PCZPYM" value=" " <%if(!RecData.getE01PCZPYM().equals("Y") && !RecData.getE01PCZPYM().equals("N")) out.print("checked");%>>No Aplica
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td width="15%"><div align="right">Reestructurado :</div></td>
            <td width="35%"> 
              <input type="radio" name="E01PCZREE" value="Y" <%if(RecData.getE01PCZREE().equals("Y")) out.print("checked");%>>Si
              <input type="radio" name="E01PCZREE" value="N" <%if(RecData.getE01PCZREE().equals("N")) out.print("checked");%>>No
              <input type="radio" name="E01PCZREE" value=" " <%if(!RecData.getE01PCZREE().equals("Y") && !RecData.getE01PCZREE().equals("N")) out.print("checked");%>>No Aplica	
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td width="15%"><div align="right">Acelerado :</div></td>
            <td width="35%"> 
              <input type="radio" name="E01PCZACE" value="Y" <%if(RecData.getE01PCZACE().equals("Y")) out.print("checked");%>>Si
              <input type="radio" name="E01PCZACE" value="N" <%if(RecData.getE01PCZACE().equals("N")) out.print("checked");%>>No
              <input type="radio" name="E01PCZACE" value=" " <%if(!RecData.getE01PCZACE().equals("Y") && !RecData.getE01PCZACE().equals("N")) out.print("checked");%>>No Aplica	
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <% } %>
  
<br>
  
      <div align="center" style="width:95%"> 
		<% if(!"1".equals( currUser.getH01WK1()) ){ %>      
          <input id="EIBSBTN" type=submit name="Submit" value="Enviar">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<% } %>
          <input id="EIBSBTN" type=button name="Cancel" value="Cancelar" onclick="javascript:goAction(500);">
      </div>
  </form>
</body>
</HTML>
