<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@ page import = "datapro.eibs.master.Util" %>
<%@page import="com.datapro.constants.EibsFields"%>

<html>
<head>
<title></title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
</head>

<jsp:useBean id= "clBalance" class= "datapro.eibs.beans.ELN006001Message"  scope="session" />

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />

<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>

<SCRIPT type="text/javascript">

   builtNewMenu(cl_i_opt);

</SCRIPT>

<body>

 <%@ page import = "datapro.eibs.master.Util" %>

 <% 
 if ( !error.getERRNUM().equals("0")  ) {
     error.setERRNUM("0");
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
 }
%>

<SCRIPT> initMenu(); </SCRIPT>

<h3 align="center">Saldo de Línea de Crédito<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="cl_inq_balance.jsp, ELN0060"></h3>
<hr size="4">
 <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSESD0080" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="32">
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
                <input type="text" name="CUSCUN" size="10" maxlength="9" value="<%= userPO.getCusNum().trim()%>" readonly>
              </div>
            </td>
            <td nowrap width="12%" > 
              <div align="right"><b>Nombre :</b> </div>
            </td>
            <td nowrap > 
              <div align="left"> 
                <input type="text" name="CUSNA1" size="45" readonly maxlength="45" value="<%= userPO.getCusName().trim()%>" >
              </div>
            </td>
            <td nowrap > 
              <div align="right"><b>Tipo de Linea : </b></div>
            </td>
            <td nowrap ><b> 
              <input type="text" name="PROCOD" size="4" readonly maxlength="4" value="<%= userPO.getCreditLineType().trim()%>">
              </b></td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="14%"> 
              <div align="right"><b>N&uacute;mero de Linea :</b></div>
            </td>
            <td nowrap width="9%"> 
              <div align="left"> 
                <input type="text" name="ACCNUM" size="6" readonly maxlength="4" value="<%= userPO.getCreditLineNum().trim()%>" >
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
                <input type="text" name="PROCCY" size="4" readonly maxlength="4" value="<%= userPO.getCurrency().trim()%>">
                </b> </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <h4>Sumario</h4>
    <table class="tableinfo">
      <tr > 
        <td >
          <table cellspacing="0" cellpadding="2" width="100%" border="0" >
            <tr id="trdark"> 
              <td width=25%> 
                <div align="right">Monto Aprobado : </div>
              </td>
              
            <td width=22%> 
              <div align="left">
                  <eibsinput:text name="clBalance" property="E01LNEAMN" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/>                  
                </div>
              </td>
              
            <td width=24%> 
              <div align="right">Fecha de Apertura : </div>
              </td>
              
            <td width=29% nowrap> 
              <div align="left">
				<eibsinput:date name="clBalance" fn_year="E01LNEOPY" fn_month="E01LNEOPM" fn_day="E01LNEOPD" readonly="true" />
              </div>
              </td>
            </tr>
            <tr id="trclear"> 
              <td width=25%> 
                <div align="right">Monto Reasignado : </div>
              </td>
              
            <td width=22%> 
              <div align="left">
                  <eibsinput:text name="clBalance" property="E01LNEREA" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/>                  
                </div>
              </td>
              
            <td width=24%> 
              <div align="right">Fecha de Vencimiento : </div>
              </td>
              
            <td width=29% nowrap> 
              <div align="left">
				<eibsinput:date name="clBalance" fn_year="E01LNEMTY" fn_month="E01LNEMTM" fn_day="E01LNEMTD" readonly="true" />
              </div>
              </td>
            </tr>
            <tr id="trdark"> 
              <td width=25%> 
                <div align="right">Monto Utilizado : </div>
              </td>
              
            <td width=22%> 
              <div align="left">
                  <eibsinput:text name="clBalance" property="E01LNEAMU" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/>
                </div>
              </td>
              
            <td width=24%> 
              <div align="right">Fecha de Revisi&oacute;n : </div>
              </td>
              
            <td width=29% nowrap> 
              <div align="left">
				<eibsinput:date name="clBalance" fn_year="E01LNERVY" fn_month="E01LNERVM" fn_day="E01LNERVD" readonly="true"/>
              </div>
              </td>
            </tr>
            <tr id="trclear"> 
              <td width=25%> 
                <div align="right">Solicitudes del D&iacute;a : </div>
              </td>
              
            <td width=22%> 
              <div align="left">
                  <eibsinput:text name="clBalance" property="E01LNEOFA" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/>
                </div>
              </td>
              
            <td width=24%> 
              <div align="right">Fecha de Reasignaci&oacute;n : </div>
              </td>
              
            <td width=29% nowrap> 
              <div align="left">
				<eibsinput:date name="clBalance" fn_year="E01LNEREY" fn_month="E01LNEREM" fn_day="E01LNERED" readonly="true" />
              </div>
              </td>
            </tr>
            <tr id="trdark"> 
              <td width=25%> 
                <div align="right">Saldo de la Linea : </div>
              </td>
              
            <td width=22%> 
              <div align="left">
                  <eibsinput:text name="clBalance" property="E01LNEBAL" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/>
                </div>
              </td>
              
            <td width=24%> 
              <div align="right">Monto de Garant&iacute;a : </div>
              </td>
              
            <td width=29%> 
              <div align="left">
                  <eibsinput:text name="clBalance" property="E01LNEOCM" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/>                  
                </div>
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
          
        <table cellspacing="0" cellpadding="2" width="100%" border="0" >
          <tr id="trdark"> 
            <td width=30%> 
              <div align="right">Promedio no Utilizado : </div>
            </td>
            <td width=20%> 
              <div align="left"> 
                <eibsinput:text name="clBalance" property="E01LNEAVN" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/>
              </div>
            </td>
            <td width=25%> 
              <div align="right">Total de Comisi&oacute;n : </div>
            </td>
            <td width=25%> 
              <div align="left"> 
                <eibsinput:text name="clBalance" property="E01LNECLT" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/>                
              </div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td width=30%> 
              <div align="right">Promedio Monto Utilizado : </div>
            </td>
            <td width=20%> 
              <div align="left"> 
                <eibsinput:text name="clBalance" property="E01LNEAVU" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/>
              </div>
            </td>
            <td width=25%> 
              <div align="right">Comisiones del A&ntilde;o : </div>
            </td>
            <td width=25%> 
              <div align="left"> 
                <eibsinput:text name="clBalance" property="E01LNECYT" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/>                
              </div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td> 
              <div align="right"> Prop&oacute;sito de la Linea : </div>
            </td>
            <td colspan="3"> 
              <div align="right"></div>
              <div align="left"> 
                <eibsinput:text name="clBalance" property="E01LNEPUR" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true"/>
              </div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td> 
              <div align="right">Autorizado por : </div>
            </td>
            <td colspan="3"> 
              <div align="left"> 
                <eibsinput:text name="clBalance" property="E01LNEABY" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true"/>                
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

