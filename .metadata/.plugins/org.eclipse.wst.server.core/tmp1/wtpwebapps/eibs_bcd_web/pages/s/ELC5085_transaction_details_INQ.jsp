<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput"%>
<%@page import="datapro.eibs.master.Util" %>
<%@page import="com.datapro.constants.EibsFields"%>

<html>
<head>
<title>Transacciones de Boletas</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/jquery/plugins/contextMenu/css/jquery.contextMenu.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>


<jsp:useBean id="bolgaran" class="datapro.eibs.beans.ELC508501Message" scope="session" />
<jsp:useBean id="error" class="datapro.eibs.beans.ELEERRMessage" scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session" />


<SCRIPT type="text/javascript">

  //builtNewMenu(bg_m_opt);
  //initMenu();

</SCRIPT>
</head>

<body>

<% 
 if ( !error.getERRNUM().equals("0")  ) {
     error.setERRNUM("0"); 
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
 }
%>

<h3 align="center">Transacciones de Documentarias<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="transaction_details_INQ.jsp, ELC5085"></h3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.bolgaran.JSELC5085" >
   
  <table class="tableinfo" style="width: 100%">
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
          <tr id="trdark"> 
            <td nowrap width="16%" > 
              <div align="right"><b>Cliente :</b></div>
            </td>
            <td nowrap width="20%" > 
              <div align="left"> 
              	<eibsinput:text property="E01LCMCUN" name="bolgaran" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_CUSTOMER%>" readonly="true" />
              </div>
            </td>
            <td nowrap width="16%" > 
              <div align="right"><b>Nombre :</b> </div>
            </td>
            <td nowrap colspan="3" > 
              <div align="left"><font face="Arial"><font face="Arial"><font size="2"> 
              	<eibsinput:text property="E01LCMCUN" name="bolgaran" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_NAME%>" readonly="true" />
               </font></font></font></div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="16%"> 
              <div align="right"><b>Cuenta :</b></div>
            </td>
            <td nowrap width="20%"> 
              <div align="left"> 
              	<eibsinput:text property="E01LCMACC" name="bolgaran" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_ACCOUNT%>" readonly="true" />
              </div>
            </td>
            <td nowrap width="16%"> 
              <div align="right"><b>Moneda : </b></div>
            </td>
            <td nowrap width="16%"> 
              <div align="left"><b> 
              	<eibsinput:text property="E01LCMCCY" name="bolgaran" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_CURRENCY%>" readonly="true" />
              </b> </div>
            </td>
            <td nowrap width="16%"> 
              <div align="right"><b>Producto : </b></div>
            </td>
            <td nowrap width="16%"> 
              <div align="left"><b> 
              	<eibsinput:text property="E01LCMPRO" name="bolgaran" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_CURRENCY%>" readonly="true" />
                </b> </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  
  <h4>Informaci&oacute;n Financiera</h4>
  <%int row = 0; %>
  <TABLE class="tableinfo" style="width: 100%">
     <TBODY>
        <TR> 
      <TD nowrap> 
        <TABLE cellspacing="2" cellpadding="2" width="100%" border="0">
          <TBODY>
             <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <TD nowrap width="40%" > 
              <DIV align="center"></DIV>
            </TD>
            <TD nowrap width="30%" > 
              <DIV align="center"><B>Antes</B></DIV>
            </TD>
            <TD nowrap width="30%" > 
              <DIV align="center"><B>Después</B></DIV>
            </TD>
          </TR>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <TD nowrap > 
              <DIV align="right">Saldo de Principal :</DIV>
            </TD>
            <TD nowrap align="center"> 
              	<eibsinput:text property="E01BEFPRI" name="bolgaran" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_AMOUNT%>" readonly="true" />
            </TD>
            <TD nowrap align="center"> 
              	<eibsinput:text property="E01AFTPRI" name="bolgaran" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_AMOUNT%>" readonly="true" />
            </TD>
          </TR>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <TD nowrap > 
              <DIV align="right">Saldo de Inter&eacute;s :</DIV>
            </TD>
            <TD nowrap align="center"> 
              	<eibsinput:text property="E01BEFINT" name="bolgaran" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_AMOUNT%>" readonly="true" />
            </TD>
            <TD nowrap align="center"> 
              	<eibsinput:text property="E01AFTINT" name="bolgaran" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_AMOUNT%>" readonly="true" />
            </TD>
          </TR>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <TD nowrap > 
              <DIV align="right">Saldo de Comisiones :</DIV>
            </TD>
            <TD nowrap align="center"> 
              	<eibsinput:text property="E01BEFCOM" name="bolgaran" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_AMOUNT%>" readonly="true" />
            </TD>
            <TD nowrap align="center"> 
              	<eibsinput:text property="E01AFTCOM" name="bolgaran" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_AMOUNT%>" readonly="true" />
            </TD>
          </TR>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <TD nowrap > 
              <DIV align="right">Saldo de Iva :</DIV>
            </TD>
            <TD nowrap align="center"> 
              	<eibsinput:text property="E01BEFIVA" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_AMOUNT%>" readonly="true" />
            </TD>
            <TD nowrap align="center"> 
              	<eibsinput:text property="E01BEFIVA" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_AMOUNT%>" readonly="true" />
            </TD>
          </TR>
          
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <TD nowrap > 
              <DIV align="right">Total :</DIV>
            </TD>
            <TD nowrap align="center"> 
              	<eibsinput:text property="E01BEFTOT" name="bolgaran" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_AMOUNT%>" readonly="true" />
            </TD>
            <TD nowrap align="center"> 
              	<eibsinput:text property="E01AFTTOT" name="bolgaran" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_AMOUNT%>" readonly="true" />
            </TD>
          </TR>
        	</TBODY>
            </TABLE>
      	</TD>
    </TR>
  </TBODY>
</TABLE>

  <h4>Datos de la Transacci&oacute;n</h4>
  <table class="tableinfo" style="width: 100%">
    <tr > 
      <td> 
        <table cellspacing=0 cellpadding=2 width="100%" border="0">
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td width="42%"> 
              <div align="right" style="font: bold;">Valor Documento :</div>
            </td>
            <td width="12%"> 
              	<eibsinput:text property="E01TRNPRI" name="bolgaran" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_AMOUNT%>" readonly ="true"/>
			</td>
            <td width="12%"> 
              <div align="right">Incremento </div>
			</td>
            <td width="2%"> 
				<input type="radio" name="E01TRNPRF" value="I" <%if (bolgaran.getE01TRNPRF().equals("I")) out.print("checked"); %> disabled>  
			</td>
            <td width="2%"> 
              <div align="right">Decremento </div>
			</td>
            <td width="30%"> 
				<input type="radio" name="E01TRNPRF" value="D" <%if (bolgaran.getE01TRNPRF().equals("D")) out.print("checked"); %> disabled>  
			</td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td width="42%"> 
              <div align="right" style="font: bold;">Ajuste Interes :</div>
            </td>
            <td width="12%"> 
              	<eibsinput:text property="E01TRNAIN" name="bolgaran" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_AMOUNT%>" readonly ="true"/>
			</td>
            <td width="12%"> 
              <div align="right">Incremento </div>
			</td>
            <td width="2%"> 
				<input type="radio" name="E01TRNAIF" value="I" <%if (bolgaran.getE01TRNAIF().equals("I")) out.print("checked"); %> disabled>  
			</td>
            <td width="2%"> 
              <div align="right">Decremento </div>
			</td>
            <td width="30%"> 
				<input type="radio" name="E01TRNAIF" value="D" <%if (bolgaran.getE01TRNAIF().equals("D")) out.print("checked"); %> disabled>  
			</td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td width="42%" height="27"> 
              <div align="right" style="font: bold;">Intereses :</div>
            </td>
            <td width="12%"> 
              	<eibsinput:text property="E01TRNINT" name="bolgaran" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_AMOUNT%>" readonly ="true"/>
			</td>
            <td width="12%"> 
              <div align="right">Reverso </div>
			</td>
            <td width="2%"> 
				<input type="radio" name="E01TRNINF" value="R" <%if (bolgaran.getE01TRNINF().equals("R")) out.print("checked"); %> disabled> 
			</td>
            <td width="2%"> 
              <div align="right">Pago </div>
			</td>
            <td width="30%"> 
				<input type="radio" name="E01TRNINF" value="P" <%if (bolgaran.getE01TRNINF().equals("P")) out.print("checked"); %> disabled> 
			</td>
          </tr>
      </table>
      </td>
    </tr>
  </table>

  <!-- Plan de Pagos -->
  <br>
  <iframe id="ifremppp" frameborder="0" scrolling="no" height="200" width="100%" src="<%=request.getContextPath()%>/servlet/datapro.eibs.bolgaran.JSELC5085?SCREEN=600&IFRAME=Y&E03DCCACC=<%=bolgaran.getE01LCMACC()%>"></iframe>
  
  <h4>Informacion adicional</h4>
  <table class="tableinfo" style="width: 100%">
    <tr > 
      <td> 
        <table cellspacing=0 cellpadding=2 width="100%" border="0">
          <tr id="trclear"> 
            <td width="40%"> 
              <div align="right">Fecha Valor :</div>
            </td>
            <td width="60%"> 
              <eibsinput:date name="bolgaran"  fn_month="E01TRNVDM" fn_day="E01TRNVDD" fn_year="E01TRNVDY" readonly="true"/> 
            </td>
          </tr>
          <tr id="trclear"> 
            <td width="40%"> 
              <div align="right">Descripci&oacute;n :</div>
            </td>
            <td width="60%"> 
              <eibsinput:text property="E01TRNNAR" name="bolgaran" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION%>" readonly="true"/>
            </td>
		  </tr>
		</table>
        <br>
        <table cellspacing=0 cellpadding=2 width="100%" border="0">
          <tr id="trdark"> 
            <td align="center"> <b>Cuenta Contrapartida</b> </td>
          </tr>
        </table>
        <table class="tableinfo" style="filter:''; border: 0px;" align="center">
          <tr id="trdark"> 
            <td width="31%"> 
              <div align="center">Concepto</div>
            </td>
            <td width="5%"> 
              <div align="center">Banco</div>
            </td>
            <td width="5%" > 
              <div align="center">Sucursal</div>
            </td>
            <td width="5%" > 
              <div align="center">Moneda</div>
            </td>
            <td width="21%" > 
              <div align="center">Referencia</div>
            </td>
            <td nowrap> 
              <div align="center">Titular</div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td width="31%" > 
              <div align="center" > 
                <input type=text name="E01TRNOPC" readonly value="<%= bolgaran.getE01TRNOPC().trim()%>" size="3" maxlength="3" > 
                <input type="text" name="E01TRNCON" size="25" maxlength="25" readonly value="<%= bolgaran.getE01TRNCON().trim()%>">
              </div>
            </td>
            <td width="5%" > 
              <div align="center"> 
                <input type="text" name="E01TRNBNK" size="2" maxlength="2" readonly value="<%= bolgaran.getE01TRNBNK().trim()%>">
              </div>
            </td>
            <td width="5%"> 
              <div align="center"> 
                <input type="text" name="E01TRNBRN" size="4" maxlength="4" readonly value="<%= bolgaran.getE01TRNBRN().trim()%>">
              </div>
            </td>
            <td width="5%" > 
              <div align="center">
                <input type="text" name="E01TRNCCY" size="3" maxlength="3" readonly value="<%= bolgaran.getE01TRNCCY().trim()%>"> 
              </div>
            </td>
            <td width="15%" > 
              <div align="center"> 
                <input type="text" name="E01TRNACC" size="16" maxlength="16" readonly value="<%= bolgaran.getE01TRNACC().trim()%>">
               </div>
            </td>
            <td width="5%" > 
              <div align="center"> 
                <input type="text" name="E01TRNCDS" size="35" maxlength="35" readonly value="<%= bolgaran.getE01TRNCDS().trim()%>">
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
