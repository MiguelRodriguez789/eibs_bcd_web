<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>

<%@ page import = "datapro.eibs.master.Util" %>
<%@page import="com.datapro.constants.EibsFields"%>

<html>
<head>
<title> Calculadora </title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id="calcLoans" class="datapro.eibs.beans.EDL029001Message"  scope="session" />

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session" />


<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>

<SCRIPT type="text/javascript">

<%
	if (!userPO.getHeader9().equals("S")) { 
		if ( userPO.getHeader23().equals("G") ||  userPO.getHeader23().equals("V")){
%>
			builtNewMenu(ln_i_1_opt);
<%   
		} else  {
%>
			builtNewMenu(ln_i_2_opt);
<%   
		}
	}
%>

</SCRIPT>
</head>

<body >
<% 
 if ( !error.getERRNUM().equals("0")  ) {
     error.setERRNUM("0");
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
     }
    out.println("<SCRIPT> initMenu(); </SCRIPT>");
 
%> 
<div align="center"></div>
<h3 align="center"> Calculadora de Intereses Depositos a Plazo
	<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="ln_cal.jsp, EDL0290"></h3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDL0290" >
  <input type=HIDDEN name="SCREEN" value="2">
  <input type=HIDDEN name="H01FLGWK2" value="<%= calcLoans.getH01FLGWK2().trim()%>">

<% int row = 0;%>
<%if (!userPO.getHeader9().equals("S")){ %>

   <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
          <tr id="trdark"> 
            <td nowrap width="14%" > 
              <div align="right"><b>Cliente :</b></div>
            </td>
            <td nowrap width="9%" > 
              <div align="left"> 
                <input type="text" name="E06CUN2" size="10" maxlength="9" readonly value="<%= userPO.getCusNum().trim()%>">
              </div>
            </td>
            <td nowrap width="12%" > 
              <div align="right"><b>Nombre :</b> </div>
            </td>
            <td nowrap > 
              <div align="left"> 
                <input type="text" name="E06NA12" size="48" maxlength="45" readonly value="<%= userPO.getCusName().trim()%>">
              </div>
            </td>
            <td nowrap > 
              <div align="right"><b>Producto : </b></div>
            </td>
            <td nowrap ><b>                
               <input type="text" name="E06PRO22" size="4" maxlength="4" readonly value="<%= userPO.getType().trim()%>">
               <input type="text" name="E06PRO2" size="4" maxlength="4" readonly value="<%= userPO.getProdCode().trim()%>">
              </b></td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="14%"> 
              <div align="right"><b>Cuenta :</b></div>
            </td>
            <td nowrap width="9%"> 
              <div align="left"> 
                <input type="text" name="E06ACC" size="13" maxlength="12" value="<%= userPO.getIdentifier().trim()%>" readonly>
              </div>
            </td>
            <td nowrap width="12%"> 
              <div align="right">Oficial :</div>
            </td>
            <td nowrap width="33%"> 
              <div align="left"><b> 
                <input type="text" name="E06NA122" size="48" maxlength="45" readonly value="<%= userPO.getOfficer().trim()%>">
                </b> </div>
            </td>
            <td nowrap width="11%"> 
              <div align="right"><b>Moneda : </b></div>
            </td>
            <td nowrap width="21%"> 
              <div align="left"><b> 
              <input type="text" name="E06CCY" size="4" maxlength="4" readonly value="<%= userPO.getCurrency().trim()%>">    
                </b> </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
<%} %>
  
  <h4>Informaci&oacute;n Opcional</h4>
  <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing=0 cellpadding=2 width="100%" border="0">

		<%if (!userPO.getHeader9().equals("S")){ %>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="19%" > 
              <div align="right">N&uacute;mero del Contrato :</div>
            </td>
            <td nowrap width="28%" > 
	              <eibsinput:help name="calcLoans" property="E01DEAACC" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_ACCOUNT %>" 
        	      		fn_param_one="E01DEAACC" fn_param_two="" fn_param_three="10" fn_param_four="" />
            </td>
            <td nowrap colspan="2" >N&uacute;mero de Cliente : 
	              <eibsinput:help name="calcLoans" property="E01DEACUN" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CUSTOMER %>"
	              		fn_param_one="E01DEACUN"/>
            </td>
          </tr>
          <% } else {%>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="19%" > 
              <div align="right">N&uacute;mero de Cliente :</div>
            </td>
            <td nowrap width="28%" > 
	              <eibsinput:help name="calcLoans" property="E01DEACUN" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CUSTOMER %>"
	              		fn_param_one="E01DEACUN"/>
            </td>
            <td nowrap colspan="2" > </td>
          </tr>
          <% } %>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="19%" > 
              <div align="right">Nombre :</div>
            </td>
            <td nowrap colspan="3" > 
                 <eibsinput:text name="calcLoans" property="E01CUMMA1" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_NAME_FULL %>" />
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="19%" > 
              <div align="right">Direcci&oacute;n :</div>
            </td>
            <td nowrap colspan="3" > 
                <eibsinput:text name="calcLoans" property="E01CUMMA2" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" />
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="19%" > 
              <div align="right"></div>
            </td>
            <td nowrap colspan="3" > 
                <eibsinput:text name="calcLoans" property="E01CUMMA3" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" />
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="19%" > 
              <div align="right"></div>
            </td>
            <td nowrap colspan="3" > 
                <eibsinput:text name="calcLoans" property="E01CUMMA4" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" />
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <h4>Informaci&oacute;n B&aacute;sica</h4>
  <table class="tableinfo">
    <tr > 
      <td nowrap > 
        <table cellspacing=0 cellpadding=2 width="100%" border="0">
		<%if (userPO.getHeader9().equals("S")){ %>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap > 
              <div align="right"> Producto :</div>
            </td>
				<td><input type="text" name="E01DEAPRO" size="5" maxlength="4"
					value="<%= calcLoans.getE01DEAPRO().trim()%>"> <a
					href="javascript:GetProduct('E01DEAPRO','CD','01','','')">
				<img src="<%=request.getContextPath()%>/images/1b.gif" title="help"
					align="middle" border="0"></a></td>

            <td nowrap > 
              <div align="right"></div>
            </td>
            <td nowrap >&nbsp; </td>
          </tr>
          <% } %>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap > 
              <div align="right"> Principal :</div>
            </td>
            <td nowrap > 
                <eibsinput:text name="calcLoans" property="E01DEAPRI" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" />
            </td>
            <td nowrap > 
              <div align="right"></div>
            </td>
            <td nowrap >&nbsp; </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap > 
              <div align="right"> Fecha Inicial :</div>
            </td>
            <td nowrap  bordercolor="#FFFFFF" > 
              <eibsinput:date name="calcLoans"  fn_month="E01DEAODM" fn_day="E01DEAODD" fn_year="E01DEAODY" /> 
      		</td>
            <td nowrap  bordercolor="#FFFFFF" > 
              <div align="right">Fecha Final :</div>
            </td>
            <td nowrap  bordercolor="#FFFFFF" > 
              <eibsinput:date name="calcLoans"  fn_month="E01DEAMDM" fn_day="E01DEAMDD" fn_year="E01DEAMDY" /> 
             </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap > 
              <div align="right"> Plazo :</div>
            </td>
            <td nowrap  bordercolor="#FFFFFF" > 
              <input type="text" name="E01DEATRM" size="5" maxlength="5" value="<%= calcLoans.getE01DEATRM().trim()%>">
              <select name="E01DEATRC">
                <option value=" " <% if (!(calcLoans.getE01DEATRC().equals("D") ||calcLoans.getE01DEATRC().equals("M")||calcLoans.getE01DEATRC().equals("Y"))) out.print("selected"); %>></option>
                <option value="D" <% if(calcLoans.getE01DEATRC().equals("D")) out.print("selected");%>>D&iacute;a(s)</option>
                <option value="M" <% if(calcLoans.getE01DEATRC().equals("M")) out.print("selected");%>>Mes(es)</option>
                <option value="Y" <% if(calcLoans.getE01DEATRC().equals("Y")) out.print("selected");%>>A&ntilde;o(s)</option>
              </select>
            </td>
            <td nowrap  bordercolor="#FFFFFF" > 
              <div align="right">Tasa de Inter&eacute;s :</div>
            </td>
            <td nowrap  bordercolor="#FFFFFF" > 
                <eibsinput:text name="calcLoans" property="E01DEARTE" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_RATE %>" />
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap  > 
              <div align="right">Per&iacute;odo Base :</div>
            </td>
            <td nowrap  bordercolor="#000000" > 
              <input type="text" name="E01DEABAS" size="3" maxlength="3" value="<%= calcLoans.getE01DEABAS().trim()%>" >
            </td>
            <td nowrap  bordercolor="#000000" > 
              <div align="right">Tipo de C&aacute;lculo :</div>
            </td>
            <td nowrap  bordercolor="#000000" > 
              <input type="text" name="E01DEAICT" size="2" maxlength="1" value="<%= calcLoans.getE01DEAICT().trim()%>" >
              <a href="javascript:GetCode('E01DEAICT','STATIC_cd_formula.jsp')"><img src="<%=request.getContextPath()%>/images/1b.gif" title=". . ." align="bottom" border="0" ></a> 
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap > 
              <div align="right"><b>RESULTADO</b></div>
            </td>
            <td nowrap  bordercolor="#000000">
              <div align="right"> </div>
            </td>
            <td nowrap  bordercolor="#000000"> 
              <div align="right"> </div>
            </td>
            <td nowrap  bordercolor="#000000"> 
              <div align="right"> </div>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap > 
              <div align="right">Principal :</div>
            </td>
            <td nowrap  bordercolor="#000000">
	           <input type="text" class="txtright"  name="E01DEAPRI1" size="22" maxlength="15" value="<%= calcLoans.getE01DEAPRI().trim()%>" readonly>
            </td>
            <td nowrap  bordercolor="#000000"> 
              <div align="right">Fecha de Vencimiento :</div>
            </td>
            <td nowrap  bordercolor="#000000"> 

              <eibsinput:date name="calcLoans"  fn_month="E01VENCIM" fn_day="E01VENCID" fn_year="E01VENCIY" readonly="true" /> 
             </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap > 
              <div align="right">Intereses :</div>
            </td>
            <td nowrap  bordercolor="#000000">
                <eibsinput:text name="calcLoans" property="E01DEAINT" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/>
            </td>
            <td nowrap  bordercolor="#000000"> 
              <div align="right">Vencimiento el dia :</div>
            </td>
            <td nowrap  bordercolor="#000000"> 
              <input type="text" name="E01DYSNME" size="10" maxlength="9" value="<%= calcLoans.getE01DYSNME().trim()%>" readonly >
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap > 
              <div align="right">Total :</div>
            </td>
            <td nowrap  bordercolor="#000000"> 
                <eibsinput:text name="calcLoans" property="E01TOTDUE" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/>
            </td>
           <td nowrap > 
              <div align="right">Tasa Equivalente :</div>
            </td>
            <td nowrap  bordercolor="#000000">
                <eibsinput:text name="calcLoans" property="E01APYRTE" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_RATE %>" readonly="true"/>
            </td>
           </tr>
        </table>
      </td>
    </tr>
  </table>

	<div align="center"> 
    	<input class="EIBSBTN" type=submit name="Submit" value="Enviar">
  	</div>
 
  </form>
</body>
</html>
