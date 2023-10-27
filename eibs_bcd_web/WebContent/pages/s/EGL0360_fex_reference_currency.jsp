<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@ page import = "datapro.eibs.master.Util" %>
<%@page import="com.datapro.constants.EibsFields"%>
<%@page import="com.datapro.eibs.constants.HelpTypes"%>

<html>
<head>
<title>Archivo de Tarjetas</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/jquery/plugins/contextMenu/css/jquery.contextMenu.css" rel="stylesheet" type="text/css" />

<jsp:useBean id="refCCY" class="datapro.eibs.beans.EGL036001Message"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>


<% 
 if ( !error.getERRNUM().equals("0")  ) {
     error.setERRNUM("0"); 
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
 }
   
%>

</head>

<body>

<h3 align="center">Mantenimiento Referencias Moneda Extranjera<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="fex_reference_currency.jsp,EGL0360"> </h3> 
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.params.JSEGL0360" >
  <p>
    <INPUT TYPE=HIDDEN NAME="SCREEN" ID="SCREEN" VALUE="4">
  </p>
  <h4>Informaci&oacute;n B&aacute;sica</h4>
  
  <% int row = 0; %>
  <table  class="tableinfo">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" >
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="26%" >
              <div align="right">Banco :</div>
            </td>
            <td nowrap >
            <%if (userPO.getPurpose().equals("NEW")) { %>
              <input type="text" name="E01RATBNK" id="E01RATBNK" size="3" maxlength="2" value="<%= refCCY.getE01RATBNK()%>">
            <%}else{ %>
              <input type="text" name="E01RATBNK" id="E01RATBNK" readonly size="3" maxlength="2" value="<%= refCCY.getE01RATBNK()%>">
            <% } %>	
            </td>
          </tr>
           <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">  
            <td nowrap width="26%" > 
              <div align="right">Codigo de Moneda :</div>
            </td>
            <td nowrap > 
              <div align="left"> 
                <%if (userPO.getPurpose().equals("NEW")) { %>
        	        <input type="text" name="E01RATCCY" id="E01RATCCY" size="4" maxlength="3" value="<%= refCCY.getE01RATCCY()%>">
                <%}else{ %>
     	           <input type="text" name="E01RATCCY" id="E01RATCCY" readonly size="4" maxlength="3" value="<%= refCCY.getE01RATCCY()%>">
                <% } %> 
              </div>
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">  
            <td nowrap width="26%" > 
              <div align="right">Descripcion de Moneda :</div>
            </td>
            <td nowrap > 
              <div align="left"> 
                 <eibsinput:text name="refCCY" property="E01RATDSC" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" />
			  </div>
            </td>
          </tr>
           <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">  
            <td nowrap width="26%"> 
              <div align="right">Moneda Base :</div>
            </td>
            <td nowrap> 
              <input type="text" name="E01CNTBCU" id="E01CNTBCU" size="4" maxlength="3" value="<%= refCCY.getE01CNTBCU()%>" readonly>
            </td>
          </tr>
           <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">  
            <td nowrap width="26%"> 
              <div align="right">Fecha :</div>
            </td>
            <td nowrap> 
              <div align="left"> 
                <input type="text" name="E01CNTRD1" size="3" maxlength="2" value="<%= refCCY.getE01CNTRD1()%>" readonly>
                <input type="text" name="E01CNTRD2" size="3" maxlength="2" value="<%= refCCY.getE01CNTRD2()%>" readonly>
                <input type="text" name="E01CNTRD3" size="5" maxlength="4" value="<%= refCCY.getE01CNTRD3()%>" readonly>
              </div>
            </td>
          </tr>
           <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="26%"> 
              <div align="right">Tasa &quot;Spot&quot; Actual :</div>
            </td>
            <td nowrap> 
              <input type="text" name="E01RATEXR" size="11" maxlength="11" value="<%= refCCY.getE01RATEXR()%>">
            </td>
          </tr>
           <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="26%"> 
              <div align="right">Operaci&oacute;n :</div>
            </td>
            <td nowrap> 
              <select name="E01RATMUD" id="E01RATMUD">
                <% boolean flag = false; %>
                <option value="M" <%if (refCCY.getE01RATMUD().equals("M")) { flag = true; out.print("selected"); }%>>Multiplicar</option>
                <option value="D" <%if (refCCY.getE01RATMUD().equals("D")) { flag = true; out.print("selected"); }%>>Dividir</option>
                <option value=" " <%if ( flag == false ) out.print("selected");  %>></option>
              </select>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <h4>Informaci&oacute;n Adicional</h4>
  <table  class="tableinfo">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
           <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="25%"> 
              <div align="right">N&uacute;mero de Decimales :</div>
            </td>
            <td nowrap width="25%"> 
              <div align="left"> 
                <input type="text" name="E01RATDCP" size="2" maxlength="1" value="<%= refCCY.getE01RATDCP()%>" >
                (0,2)</div>
            </td>
            <td nowrap width="25%" > 
              <div align="right">Nombre Abreviado :</div>
            </td>
            <td nowrap width="25%"> 
              <div align="left"> 
                <input type="text" name="E01RATCYA" size="28" maxlength="25" value="<%= refCCY.getE01RATCYA()%>" >
              </div>
            </td>
          </tr>
           <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="25%" > 
              <div align="right">Referencia :</div>
            </td>
            <td nowrap width="25%"> 
              <div align="left"> 
                <input type="text" name="E01RATRNM" size="5" maxlength="4" value="<%= refCCY.getE01RATRNM()%>" >
              </div>
            </td>
            <td nowrap width="25%" > 
              <div align="right">Permite Contabilidad :</div>
            </td>
            <td nowrap width="25%"> 
              <div align="left"> 
                <input type="radio" name="E01RATACF" value=" " <%if (refCCY.getE01RATACF().equals(" ")) out.print("checked"); %>>
                Si 
                <input type="radio" name="E01RATACF" value="N" <%if (refCCY.getE01RATACF().equals("N")) out.print("checked"); %>>
                No</div>
            </td>
          </tr>
           <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">  
            <td nowrap width="25%" > 
              <div align="right">Tolerancia Tesorero :</div>
            </td>
            <td nowrap width="25%"> 
              <div align="left"> 
                 <eibsinput:text name="refCCY" property="E01RATTLR" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_PERCENTAGE %>" />
              </div>
            </td>
            <td nowrap width="25%" > 
              <div align="right">Codigo Moneda Swift :</div>
            </td>
            <td nowrap width="25%"> 
              <div align="left"> 
                <input type="text" name="E01RATSCY" size="4" maxlength="3" value="<%= refCCY.getE01RATSCY()%>" >
              </div>
            </td>
          </tr>
           <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="25%" > 
              <div align="right">Tolerancia Operativa :</div>
            </td>
            <td nowrap width="25%"> 
              <div align="left"> 
                 <eibsinput:text name="refCCY" property="E01RATTLO" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_PERCENTAGE %>" />
              </div>
            </td>
            <td nowrap width="25%"> 
              <div align="right">D&iacute;as Base :</div>
            </td>
            <td nowrap width="28%"> 
              <div align="left"> 
                <input type="text" name="E01RATBSE" maxlength="3" size="4" value="<%= refCCY.getE01RATBSE().trim()%>" >
              </div>
            </td>
          </tr>
           <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">  
            <td nowrap width="16%" height="19"> 
              <div align="right">Tipo de Cuenta :</div>
            </td>
            <td nowrap width="25%" > 
              <div align="left"> 
	              <select name="E01RATNAT" id="E01RATNAT">
		                <option value=" " <% if (!(refCCY.getE01RATNAT().equals("G") ||refCCY.getE01RATNAT().equals("R"))) out.print("selected"); %>></option>
						<option value="G" <%if (refCCY.getE01RATNAT().equals("G")) { out.print("selected"); }%>>Contable</option>
						<option value="R" <%if (refCCY.getE01RATNAT().equals("R")) { out.print("selected"); }%>>Detalle</option>
				  </select>
			 </div>
            </td>
            <td nowrap width="25%" > 
              <div align="right">Cuenta de M.E. :</div>
            </td>
            <td nowrap width="25%" > 
              <div align="left"> 
                <input type="text" name="E01RATNAC" id="E01RATNAC" size="17" maxlength="16" value="<%= refCCY.getE01RATNAC().trim()%>">
                <a href="javascript:GetLedger('E01RATNAC',document.getElementById('E01RATBNK').value,document.getElementById('E01RATCCY').value,'')"> 
                <img src="<%=request.getContextPath()%>/images/1b.gif" title=". . ." align=bottom" border="0" ></a></div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <H4>Referencias</H4>
<table  class="tableinfo">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
		  
           <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="15%"> 
              <div align="right"><b><b><b><b></b></b></b></b></div>
            </td>
            <td nowrap width="15%"> 
              <div align="center"><b>Cuenta Contable</b></div>
            </td>
            <td nowrap width="40%"> 
              <div align="left"><b>Descripci&oacute;n</b></div>
            </td>
          </tr>
		  <%if (userPO.getHeader10().equals("3")) {%>
           <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">  
            <td nowrap width="15%"> 
              <div align="right">Cuenta Posici&oacute;n :</div>
            </td>
            <td nowrap width="15%"> 
              <div align="left">
                <input type="text" name="E01RATPBK" id="E01RATPBK" size="2" maxlength="2" value="<%= refCCY.getE01RATPBK()%>">
                <input type="text" name="E01RATPCY" id="E01RATPCY" size="3" maxlength="3" value="<%= refCCY.getE01RATPCY()%>"
		              class="context-menu-help"
		              onmousedown="init(currencyHelp,this.name,document.getElementById('E01RATPBK').value,'','','','')">
                <input type="text" name="E01RATPGL" id="E01RATPGL" size="18" maxlength="16" value="<%= refCCY.getE01RATPGL()%>" 
		              class="context-menu-help"
		              onmousedown="init(ledgerHelp,this.name,document.getElementById('E01RATPBK').value,document.document.getElementById('E01RATPCY').value,'','','')" >
              </div>
            </td>
            <td nowrap width="40%"> 
              <div align="left">
                 <eibsinput:text name="refCCY" property="E01GLDSCP" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true"/>
              </div>
            </td>
          </tr>
           <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="15%"> 
              <div align="right">Contravalor (Moneda Base ) :</div>
            </td>
            <td nowrap width="15%"> 
              <div align="left">
                <input type="text" name="E01RATVBK" id="E01RATVBK" size="2" maxlength="2" value="<%= refCCY.getE01RATVBK()%>">
                <input type="text" name="E01RATVCY" id="E01RATVCY" size="3" maxlength="3" value="<%= refCCY.getE01RATVCY()%>"
		              class="context-menu-help"
		              onmousedown="init(currencyHelp,this.name,document.getElementById('E01RATPBK').value,'','','','')">
                <input type="text" name="E01RATVGL" id="E01RATVGL" size="18" maxlength="16" value="<%= refCCY.getE01RATVGL()%>" 
		              class="context-menu-help"
		              onmousedown="init(ledgerHelp,this.name,document.getElementById('E01RATVBK').value,document.getElementById('E01RATVCY').value,'','','')" >
              </div>
            </td>
            <td nowrap width="40%"> 
              <div align="left">
                 <eibsinput:text name="refCCY" property="E01GLDSCV" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true"/>
             </div>
            </td>
          </tr>
          <%}%>
           <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="15%"> 
              <div align="right">Ganancia / P&eacute;rdida :</div>
            </td>
            <td nowrap width="15%"> 
              <div align="left">
                <input type="text" name="E01RATBK1" id="E01RATBK1" size="2" maxlength="2" value="<%= refCCY.getE01RATBK1()%>">
                <input type="text" name="E01RATCY1" id="E01RATCY1" size="3" maxlength="3" value="<%= refCCY.getE01RATCY1()%>"
		              class="context-menu-help"
		              onmousedown="init(currencyHelp,this.name,document.getElementById('E01RATBK1').value,'','','','')">
                <input type="text" name="E01RATGL1" id="E01RATGL1" size="18" maxlength="16" value="<%= refCCY.getE01RATGL1()%>" 
		              class="context-menu-help"
		              onmousedown="init(ledgerHelp,this.name,document.getElementById('E01RATBK1').value,document.getElementById('E01RATCY1').value,'','','')" >
              </div>
            </td>
            <td nowrap width="40%"> 
              <div align="left">
                 <eibsinput:text name="refCCY" property="E01GLDSC1" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true"/>
              </div>
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">  
            <td nowrap width="15%"> 
              <div align="right">Ganancia / P&eacute;rdida IBF :</div>
            </td>
            <td nowrap width="15%"> 
              <div align="left"> 
                <input type="text" name="E01RATBK2" id="E01RATBK2" size="2" maxlength="2" value="<%= refCCY.getE01RATBK2()%>">
                <input type="text" name="E01RATCY2" id="E01RATCY2" size="3" maxlength="3" value="<%= refCCY.getE01RATCY2()%>"
		              class="context-menu-help"
		              onmousedown="init(currencyHelp,this.name,document.getElementById('E01RATBK2').value,'','','','')">
                <input type="text" name="E01RATGL2" id="E01RATGL2" size="18" maxlength="16" value="<%= refCCY.getE01RATGL2()%>" 
		              class="context-menu-help"
		              onmousedown="init(ledgerHelp,this.name,document.getElementById('E01RATBK2').value,document.getElementById('E01RATCY2').value,'','','')" >
              </div>
            </td>
            <td nowrap width="40%"> 
              <div align="left">
                 <eibsinput:text name="refCCY" property="E01GLDSC2" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true"/>
              </div>
            </td>
          </tr>
           <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">  
            <td nowrap width="15%"> 
              <div align="right">
					<%if (userPO.getHeader10().equals("3")) {%>Contrapartida G/P : <%}%>
					<%if (userPO.getHeader10().equals("1")) {%>Resultados Años Anteriores G/P : <%}%>
					</div>
            </td>
            <td nowrap width="15%"> 
              <div align="left"> 
                <input type="text" name="E01RATBK3" id="E01RATBK3" size="2" maxlength="2" value="<%= refCCY.getE01RATBK3()%>">
                <input type="text" name="E01RATCY3" id="E01RATCY3" size="3" maxlength="3" value="<%= refCCY.getE01RATCY3()%>"
		              class="context-menu-help"
		              onmousedown="init(currencyHelp,this.name,document.getElementById('E01RATBK3').value,'','','','')">
                <input type="text" name="E01RATGL3" id="E01RATGL3" size="18" maxlength="16" value="<%= refCCY.getE01RATGL3()%>" 
		              class="context-menu-help"
		              onmousedown="init(ledgerHelp,this.name,document.getElementById('E01RATBK3').value,document.getElementById('E01RATCY3').value,'','','')" >
              </div>
            </td>
            <td nowrap width="40%"> 
              <div align="left">
                 <eibsinput:text name="refCCY" property="E01GLDSC3" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true"/>
              </div>
            </td>
          </tr>
           <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">  
            <td nowrap width="15%"> 
              <div align="right">	
					<%if (userPO.getHeader10().equals("3")) {%>Contrapartida G/P IBF: <%}%>
					<%if (userPO.getHeader10().equals("1")) {%>Resultados Años Anteriores G/P IBF : <%}%>
			  </div>
            </td>
            <td nowrap width="15%"> 
              <div align="left"> 
                <input type="text" name="E01RATBK4" id="E01RATBK4" size="2" maxlength="2" value="<%= refCCY.getE01RATBK4()%>">
                <input type="text" name="E01RATCY4" id="E01RATCY4" size="3" maxlength="3" value="<%= refCCY.getE01RATCY4()%>"
		              class="context-menu-help"
		              onmousedown="init(currencyHelp,this.name,document.getElementById('E01RATBK4').value,'','','','')">
                <input type="text" name="E01RATGL4" id="E01RATGL4" size="18" maxlength="16" value="<%= refCCY.getE01RATGL4()%>" 
		              class="context-menu-help"
		              onmousedown="init(ledgerHelp,this.name,document.getElementById('E01RATBK4').value,document.getElementById('E01RATCY4').value,'','','')" >
              </div>
            </td>
            <td nowrap width="40%"> 
              <div align="left">
                 <eibsinput:text name="refCCY" property="E01GLDSC4" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true"/>
              </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <table width="100%" border="0" cellspacing="0" cellpadding="0" bgcolor="#FFFFFF" bordercolor="#FFFFFF">
    <tr bgcolor="#FFFFFF">
      <td width="33%">&nbsp;</td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="33%"> 
        <div align="center"> 
          <input id="EIBSBTN" type=submit name="Submit" value="Enviar">
        </div>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td> 
        <div align="center"> </div>
      </td>
    </tr>
  </table>
</form>
</body>
</html>
