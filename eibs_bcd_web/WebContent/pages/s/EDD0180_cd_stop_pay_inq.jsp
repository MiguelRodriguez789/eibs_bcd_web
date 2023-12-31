<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@ page import = "datapro.eibs.master.Util" %>
<%@page import="com.datapro.constants.EibsFields"%>
<%@page import="com.datapro.eibs.constants.HelpTypes"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<title>Emision de Ordenes de No Pago</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />

<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>

<jsp:useBean id= "cdStop" class= "datapro.eibs.beans.EDD018001Message"  scope="session" />

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>

<SCRIPT type="text/javascript">
  builtNewMenu(cd_i_opt);
  initMenu();
</SCRIPT>

</head>

<body>


<H3 align="center">Emisi&oacute;n de Ordenes de No Pago
<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="cd_stop_pay_det.jsp , EDD0180"></H3> 
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDD0180" >
  
 <% 
  if ( !error.getERRNUM().equals("0")  ) {
     error.setERRNUM("0");
 %>
   	<TABLE class="tbenter" width=50% height=100%>
   		<TR>
      <TD> 
        <div align="center">
        		<font size="3"><b>
        				No existe Orden de No Pago para el Contrato : <%= userPO.getIdentifier()%>  
        		</b></font>
        	</div>
      </TD></TR>
   	</TABLE>  
 <% } else { %>
  
  <input type=HIDDEN name="SCREEN" value="11">
  <INPUT TYPE=HIDDEN NAME="opt" VALUE="2">

  <input type=HIDDEN name="E01STPBNK" value="<%= cdStop.getE01STPBNK().trim()%>">
  <input type=HIDDEN name="E01STPGLN" value="<%= cdStop.getE01STPGLN().trim()%>">
  <table class="tableinfo">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
          <tr id="trdark"> 
            <td nowrap width="16%" > 
              <div align="right"><b>Cliente :</b></div>
            </td>
            <td nowrap width="20%" > 
              <div align="left"><b> 
                <input type="text" readonly name="E01STPCUN" size="9" maxlength="9" value="<%= cdStop.getE01STPCUN().trim()%>" >
                </b> </div>
            </td>
            <td nowrap width="16%" > 
              <div align="right"><b>Nombre :</b> </div>
            </td>
            <td nowrap colspan="3" > 
              <div align="left"> 
                <input type="text" name="E01CUSNA1" size="45" maxlength="45" readonly value="<%= cdStop.getE01CUSNA1().trim()%>">
                </div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="16%"> 
              <div align="right"><b>Cuenta :</b></div>
            </td>
            <td nowrap width="20%"> 
              <div align="left"> 
                <input type="text" name="E01STPACC" size="12" maxlength="12" value="<%= cdStop.getE01STPACC().trim()%>" readonly>
              </div>
            </td>
            <td nowrap width="16%"> 
              <div align="right"><b>Moneda : </b></div>
            </td>
            <td nowrap width="16%"> 
              <div align="left"><b> 
                <input type="text" name="E01STPCCY" size="3" maxlength="3" value="<%= cdStop.getE01STPCCY().trim()%>" readonly>
                </b> </div>
            </td>
            <td nowrap width="16%"> 
              <div align="right"><b>Producto : </b></div>
            </td>
            <td nowrap width="16%"> 
              <div align="left"><b> 
                <input type="text" name="E01STPPRO" size="4" maxlength="4" readonly value="<%= cdStop.getE01STPPRO().trim()%>">
                </b> </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <br>
  <table class="tableinfo">
    <tr> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          
          <tr id="trclear"> 
            <td nowrap width="46%"> 
              <div align="right">Fecha :</div>
            </td>
            <td nowrap width="54%"> 
              <div align="left"> 
    	        <eibsinput:date name="cdStop" fn_year="E01STPCKY" fn_month="E01STPCKM" fn_day="E01STPCKD" readonly="true" />
              </div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="46%"> 
              <div align="right">Importe :</div>
            </td>
            <td nowrap width="54%"> 
              <div align="left"> 
 		        <eibsinput:text name="cdStop" property="E01STPAMT" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DECIMAL %>" readonly="true" />
              </div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="46%"> 
              <div align="right">Comentarios :</div>
            </td>
            <td nowrap width="54%"> 
 		        <eibsinput:text name="cdStop" property="E01STPRMK" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_NARRATIVE %>" readonly="true" />
           </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="46%"> 
              <div align="right">Eliminaci&oacute;n en 180 D&iacute;as :</div>
            </td>
            <td nowrap width="54%">
              <input type="radio" name="E01STPF04" value="Y" <%if(!cdStop.getE01STPF04().equals("N")) out.print("checked");%> disabled>
              S&iacute; 
              <input type="radio" name="E01STPF04" value="N" <%if(cdStop.getE01STPF04().equals("N")) out.print("checked");%> disabled>
              No </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="46%" > 
              <div align="right">Motivo :</div>
            </td>
            <td nowrap width="54%" > 
                <eibsinput:text name="cdStop" property="E01STPF02" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CNOFC%>" readonly="true" />
                <eibsinput:text property="D01DSCCAU" name="cdStop" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_NAME%>" readonly="true"/>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <% } %>
  </form>
</body>
</html>
