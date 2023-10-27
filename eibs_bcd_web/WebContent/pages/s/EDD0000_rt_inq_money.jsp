<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>

<%@ page import = "datapro.eibs.master.Util" %>
<%@page import="com.datapro.constants.EibsFields"%>


<%@page import="com.datapro.eibs.constants.HelpTypes"%>


<html>
<head>
<title>Control de Lavado de Dinero</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

</head>

<jsp:useBean id="rtMoney" class="datapro.eibs.beans.ELD000001Message"  scope="session" />

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />

<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>

<body>

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>

<SCRIPT type="text/javascript">

<%
if ( userPO.getOption().equals("RT") ) {
%>
	builtNewMenu(rt_i_opt);
<%   
}
else if ( userPO.getOption().equals("SV") ) {
%>
	builtNewMenu(sv_i_opt);
<%   
}
%>

 function CheckSubmit()
{
   if(userPO.getPurpose().equals("NEW")){
   document.forms[0].SCREEN.value=2;}
   else{
   document.forms[0].SCREEN.value=4;}
   document.forms[0].submit();
}
   
</SCRIPT>

<% 
 if ( !error.getERRNUM().equals("0")  ) {
     out.println("<SCRIPT Language=\"Javascript\">");
     error.setERRNUM("0");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
 }
    out.println("<SCRIPT> initMenu(); </SCRIPT>");

%>


<H3 align="center">Par&aacute;metros - Control de Lavado de Dinero<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="rt_inq_money.jsp, EDD0000"></H3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEXEDD0000" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="33">
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
                <input type="text" name="E02CUN2" size="10" maxlength="9" readonly value="<%= userPO.getCusNum().trim()%>">
              </div>
            </td>
            <td nowrap width="12%" > 
              <div align="right"><b>Nombre :</b> </div>
            </td>
            <td nowrap > 
              <div align="left"> 
                <input type="text" name="E02NA12" size="45" maxlength="45" readonly value="<%= userPO.getCusName().trim()%>">
              </div>
            </td>
            <td nowrap > 
              <div align="right"><b>Producto : </b></div>
            </td>
            <td nowrap ><b> 
              <input type="text" name="E02PRO2" size="4" maxlength="4" readonly value="<%= userPO.getProdCode().trim()%>">
              </b></td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="14%"> 
              <div align="right"><b>Cuenta :</b></div>
            </td>
            <td nowrap width="9%"> 
              <div align="left"> 
                <input type="text" name="E02ACC" size="13" maxlength="12" value="<%= userPO.getAccNum().trim()%>" readonly>
              </div>
            </td>
            <td nowrap width="12%"> 
              <div align="right">Oficial :</div>
            </td>
            <td nowrap width="33%"> 
              <div align="left"><b> 
                <input type="text" name="E02NA122" size="45" maxlength="45" readonly value="<%= userPO.getOfficer().trim()%>">
                </b> </div>
            </td>
            <td nowrap width="11%"> 
              <div align="right"><b>Moneda : </b></div>
            </td>
            <td nowrap width="21%"> 
              <div align="left"><b> 
                <input type="text" name="E01DEACCY" size="3" maxlength="3" value="<%= userPO.getCurrency().trim()%>" readonly>
                </b> </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  
  <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="trdark"> 
            <td nowrap width="38%"> 
              <div align="right">Tabla de Perfiles :</div>
            </td>
            <td nowrap width="62%"> 
               <eibsinput:text name="rtMoney" property="E06LDMPRF" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_TABLE%>" readonly="true" />
               <eibsinput:text name="rtMoney" property="E06DSCPRF" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DESCRIPTION%>" readonly="true" />
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  
  <p>&nbsp;</p><H4>Datos B&aacute;sicos de la Operaci&oacute;n</H4>
<table  class="tableinfo">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="trdark"> 
            <td nowrap width="29%">
              <div align="right"><B>Tipo de Actividad</B></div>
            </td>
            <td nowrap width="19%"> 
              <div align="center"><B>N&uacute;mero</B></div>
            </td>
            <td nowrap width="26%"> 
              <div align="center"><B>Monto</B></div>
            </td>
				<TD nowrap width="26%"></TD>
			</tr>
          <tr id="trclear"> 
            <td nowrap width="29%"> 
              <div align="right">Dep&oacute;sitos Efectivo:</div>
            </td>
            <td nowrap width="19%"> 
              <div align="center"> 
                  <eibsinput:text name="rtMoney" property="E06LDMCDP" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_INTEGER%>" size="6" maxlength="5" readonly="true" />
              </div>
            </td>
            <td nowrap width="26%"> 
              <div align="center"> 
                  <eibsinput:text name="rtMoney" property="E06LDMCDA" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DECIMAL%>" readonly="true" />
              </div>
            </td>
				<TD nowrap width="26%"></TD>
			</tr>
          <tr id="trdark"> 
            <td nowrap width="29%"> 
              <div align="right">Dep&oacute;sitos Otros:</div>
            </td>
            <td nowrap width="19%"> 
              <div align="center"> 
                  <eibsinput:text name="rtMoney" property="E06LDMKDP" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_INTEGER%>" size="6" maxlength="5" readonly="true" />
              </div>
            </td>
            <td nowrap width="26%"> 
              <div align="center"> 
                  <eibsinput:text name="rtMoney" property="E06LDMKDA" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DECIMAL%>" readonly="true" />
              </div>
            </td>
				<TD nowrap width="26%"></TD>
			</tr>
          <tr id="trclear"> 
            <td nowrap width="29%" height="23"> 
              <div align="right">Retiros en Efectivo:</div>
            </td>
            <td nowrap width="19%" height="23"> 
              <div align="center"> 
                  <eibsinput:text name="rtMoney" property="E06LDMCWD" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_INTEGER%>" size="6" maxlength="5" readonly="true" />
              </div>
            </td>
            <td nowrap width="26%" height="23"> 
              <div align="center"> 
                  <eibsinput:text name="rtMoney" property="E06LDMCWA" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DECIMAL%>" readonly="true" />
              </div>
            </td>
				<TD nowrap width="26%" height="23"></TD>
			</tr>
          <tr id="trdark"> 
            <td nowrap width="29%" height="19"> 
              <div align="right">Pagos de Cheques:</div>
            </td>
            <td nowrap width="19%" height="19"> 
              <div align="center"> 
                  <eibsinput:text name="rtMoney" property="E06LDMCPY" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_INTEGER%>" size="6" maxlength="5" readonly="true" />
              </div>
            </td>
            <td nowrap width="26%" height="19"> 
              <div align="center"> 
                  <eibsinput:text name="rtMoney" property="E06LDMCPA" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DECIMAL%>" readonly="true" />
              </div>
            </td>
				<TD nowrap width="26%" height="19"></TD>
			</tr>
          <tr id="trclear"> 
            <td nowrap width="29%" height="19"> 
              <div align="right">Transferencias Emitidas:</div>
            </td>
            <td nowrap width="19%" height="19"> 
              <div align="center"> 
                  <eibsinput:text name="rtMoney" property="E06LDMTIN" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_INTEGER%>" size="6" maxlength="5" readonly="true" />
              </div>
            </td>
            <td nowrap width="26%" height="19"> 
              <div align="center"> 
                  <eibsinput:text name="rtMoney" property="E06LDMTIA" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DECIMAL%>" readonly="true" />
              </div>
            </td>
				<TD nowrap width="26%" height="19"></TD>
			</tr>
          <tr id="trdark"> 
            <td nowrap width="29%" height="19"> 
              <div align="right">Transferencias Recibidas</div>
            </td>
            <td nowrap width="19%" height="19"> 
              <div align="center"> 
                  <eibsinput:text name="rtMoney" property="E06LDMTRV" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_INTEGER%>" size="6" maxlength="5" readonly="true" />
              </div>
            </td>
            <td nowrap width="26%" height="19"> 
              <div align="center"> 
                  <eibsinput:text name="rtMoney" property="E06LDMTRA" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DECIMAL%>" readonly="true" />
              </div>
            </td>
				<TD nowrap width="26%" height="19"></TD>
			</tr>
        </table>
      </td>
    </tr>
  </table>
  <H4>Saldos</H4>
  <table  class="tableinfo">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="trdark"> 
            <td nowrap width="38%"> 
              <div align="right">Saldo Promedio en Libros:</div>
            </td>
            <td nowrap width="62%"> 
                   <eibsinput:text name="rtMoney" property="E06LDMGAV" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DECIMAL%>" readonly="true" />
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="38%"> 
              <div align="right">Saldo Promedio Neto:</div>
            </td>
            <td nowrap width="62%"> 
                  <eibsinput:text name="rtMoney" property="E06LDMNAV" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DECIMAL%>" readonly="true" />
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
   <H4>Datos Adicionales</H4>
  <table  class="tableinfo">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="trdark"> 
            <td nowrap width="38%"> 
              <div align="right">Motivo Solicitud Servicio:</div>
            </td>
            <td nowrap width="62%"> 
               <eibsinput:text name="rtMoney" property="E06LDMMOT" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CNOFC%>" readonly="true" />
               <eibsinput:text name="rtMoney" property="D06LDMMOT" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DESCRIPTION%>" readonly="true" />
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="38%"> 
              <div align="right">Uso que la dara a Cuenta:</div>
            </td>
            <td nowrap width="62%"> 
               <eibsinput:text name="rtMoney" property="E06LDMUSO" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CNOFC%>" readonly="true" />
               <eibsinput:text name="rtMoney" property="D06LDMUSO" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DESCRIPTION%>" readonly="true" />
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="38%"> 
              <div align="right">Volumen Mensual de Ventas:</div>
            </td>
            <td nowrap width="62%"> 
               <eibsinput:text name="rtMoney" property="E06LDMVOL" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DECIMAL%>" readonly="true" />
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="38%"> 
              <div align="right">Monto Promedio Mensual de Depositos:</div>
            </td>
            <td nowrap width="62%"> 
               <eibsinput:text name="rtMoney" property="E06LDMDEP" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DECIMAL%>" readonly="true" />
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="38%"> 
              <div align="right">Porcentaje Mensual Deposito en Cheques:</div>
            </td>
            <td nowrap width="62%"> 
               <eibsinput:text name="rtMoney" property="E06LDMPMD" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_PERCENTAGE%>" readonly="true" />
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="38%"> 
              <div align="right">Se permitir&aacute;n Transferencias:</div>
            </td>
            <td nowrap width="62%"> 
             <input name="E06LDMTRF" type="hidden" value="<%= rtMoney.getE06LDMTRF()%>" readonly="readonly">
              <input name="CE06LDMTRF" type="radio" disabled onClick="document.forms[0].E06LDMTRF.value='Y'" value="Y" readonly="readonly"
			  <%if(rtMoney.getE06LDMTRF().equals("Y")) out.print("checked");%>>
              Si 
              <input name="CE06LDMTRF" type="radio" disabled onClick="document.forms[0].E06LDMTRF.value='N'" value="N" readonly="readonly"
			  <%if(!rtMoney.getE06LDMTRF().equals("Y")) out.print("checked");%>>
              No
             </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="38%"> 
              <div align="right">Pa&iacute;s de Transferencias 1:</div>
            </td>
            <td nowrap width="62%"> 
               <eibsinput:text name="rtMoney" property="E06LDMCN1" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CNOFC%>" readonly="true" />
               <eibsinput:text name="rtMoney" property="D06LDMCN1" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DESCRIPTION%>" readonly="true" />
              <input type="radio" disabled name="E06LDMFG1" value="1" <%if(rtMoney.getE06LDMFG1().equals("1")) out.print("checked");%>>Env. 
              <input type="radio" disabled name="E06LDMFG1" value="2" <%if(rtMoney.getE06LDMFG1().equals("2")) out.print("checked");%>>Rec.
              <input type="radio" disabled name="E06LDMFG1" value="B" <%if(rtMoney.getE06LDMFG1().equals("B")) out.print("checked");%>>Ambas
            </td>
            
          </tr>
          <tr id="trclear"> 
            <td nowrap width="38%"> 
              <div align="right">Pa&iacute;s de Transferencias 2:</div>
            </td>
            <td nowrap width="62%"> 
               <eibsinput:text name="rtMoney" property="E06LDMCN2" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CNOFC%>" readonly="true" />
               <eibsinput:text name="rtMoney" property="D06LDMCN2" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DESCRIPTION%>" readonly="true" />
              <input type="radio" disabled name="E06LDMFG2" value="1" <%if(rtMoney.getE06LDMFG2().equals("1")) out.print("checked");%>>Env. 
              <input type="radio" disabled name="E06LDMFG2" value="2" <%if(rtMoney.getE06LDMFG2().equals("2")) out.print("checked");%>>Rec.
              <input type="radio" disabled name="E06LDMFG2" value="B" <%if(rtMoney.getE06LDMFG2().equals("B")) out.print("checked");%>>Ambas
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="38%"> 
              <div align="right">Pa&iacute;s de Transferencias 3:</div>
            </td>
            <td nowrap width="62%"> 
                <eibsinput:text name="rtMoney" property="E06LDMCN3" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CNOFC%>" readonly="true" />
               <eibsinput:text name="rtMoney" property="D06LDMCN3" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DESCRIPTION%>" readonly="true" />
              <input type="radio" disabled name="E06LDMFG3" value="1" <%if(rtMoney.getE06LDMFG3().equals("1")) out.print("checked");%>>Env. 
              <input type="radio" disabled name="E06LDMFG3" value="2" <%if(rtMoney.getE06LDMFG3().equals("2")) out.print("checked");%>>Rec.
              <input type="radio" disabled name="E06LDMFG3" value="B" <%if(rtMoney.getE06LDMFG3().equals("B")) out.print("checked");%>>Ambas
            </td>
          </tr>

          <tr id="trclear"> 
            <td nowrap width="38%"> 
              <div align="right">Pa&iacute;s de Transferencias 4:</div>
            </td>
            <td nowrap width="62%"> 
               <eibsinput:text name="rtMoney" property="E06LDMCN4" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CNOFC%>" readonly="true" />
               <eibsinput:text name="rtMoney" property="D06LDMCN4" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DESCRIPTION%>" readonly="true" />
              <input type="radio" disabled name="E06LDMFG4" value="1" <%if(rtMoney.getE06LDMFG4().equals("1")) out.print("checked");%>>Env. 
              <input type="radio" disabled name="E06LDMFG4" value="2" <%if(rtMoney.getE06LDMFG4().equals("2")) out.print("checked");%>>Rec.
              <input type="radio" disabled name="E06LDMFG4" value="B" <%if(rtMoney.getE06LDMFG4().equals("B")) out.print("checked");%>>Ambas
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="38%"> 
              <div align="right">Modo de Apertura:</div>
            </td>
            <td nowrap width="62%">
               <eibsinput:text name="rtMoney" property="E06LDMUC1" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CNOFC%>" readonly="true" />
               <eibsinput:text name="rtMoney" property="D06LDMUC1" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DESCRIPTION%>" readonly="true" />
           </td>
          </tr>
          
          <tr id="trclear"> 
            <td nowrap width="38%"> 
              <div align="right">Origen de los Fondos:</div>
            </td>
            <td nowrap width="62%"> 
               <eibsinput:text name="rtMoney" property="E06LDMUC3" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CNOFC%>" readonly="true" />
               <eibsinput:text name="rtMoney" property="D06LDMUC3" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DESCRIPTION%>" readonly="true" />
           </td>
          </tr>

          <tr id="trdark"> 
            <td nowrap width="38%"> 
              <div align="right">Monto de Apertura:</div>
            </td>
            <td nowrap width="62%"> 
               <eibsinput:text name="rtMoney" property="E06LDMAM1" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DECIMAL%>" readonly="true" />
           </td>
          </tr>

        </table>
      </td>
    </tr>
  </table>
  
  </form>
</body>
</html>
