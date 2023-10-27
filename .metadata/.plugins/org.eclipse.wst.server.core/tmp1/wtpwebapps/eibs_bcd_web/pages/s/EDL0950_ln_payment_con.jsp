<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<%@ page import = "datapro.eibs.master.Util" %>
<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@ page import="com.datapro.constants.EibsFields"%>

<html>
<head>
<title>Pago de Prest&aacute;mos</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>

<jsp:useBean id= "lnCancel" class= "datapro.eibs.beans.EDL095003Message"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />
</head>
<body>
<% 
 if ( !error.getERRNUM().equals("0")  ) {
     error.setERRNUM("0");
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
 }
 	
	java.math.BigDecimal resto = lnCancel.getBigDecimalE03DLCNC1();
	resto = resto.subtract(lnCancel.getBigDecimalE03DLCCP1()); 
    java.math.BigDecimal resto1 = lnCancel.getBigDecimalN03DLCNC1(); 
	resto1 = resto1.subtract(lnCancel.getBigDecimalN03DLCCP1());
%> 
<H3 align="center">Plan de Pago <img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="ln_payment_con.jsp, EDL0950"> 
</H3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEXEDL0950" >
  
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="500">
  
  <table class="tableinfo">
    <tr> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
          <tr id="trdark"> 
            <td nowrap width="16%" > 
              <div align="right"><b>Cliente :</b></div>
            </td>
            <td nowrap width="20%" > 
              <div align="left">
                <input type="text" size="10" maxlength="9" name="E03DEACUN" value="<%= lnCancel.getE03DEACUN().trim()%>" readonly>
              </div>
            </td>
            <td nowrap width="16%" > 
              <div align="right"><b>Nombre :</b> </div>
            </td>
            <td nowrap colspan="3" > 
              <div align="left">
                <input type="text" size="45" maxlength="45" name="E03CUSNA1" value="<%= lnCancel.getE03CUSNA1().trim()%>" readonly>
              </div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="16%"> 
              <div align="right"><b>Cuenta :</b></div>
            </td>
            <td nowrap width="20%"> 
              <div align="left">
                <input type="text" size="13" maxlength="12" name="E03DEAACC" value="<%= lnCancel.getE03DEAACC().trim()%>" readonly>
              </div>
            </td>
            <td nowrap width="16%"> 
              <div align="right"><b>Moneda : </b></div>
            </td>
            <td nowrap width="16%"> 
              <div align="left"><b> 
                <input type="text" name="E03DEACCY" size="3" maxlength="3" value="<%= lnCancel.getE03DEACCY().trim()%>" readonly>
                </b> </div>
            </td>
            <td nowrap width="16%"> 
              <div align="right"><b>Producto : </b></div>
            </td>
            <td nowrap width="16%"> 
              <div align="left"><b>
                <input type="text" size="4" maxlength="4" name="E03DEAPRO" value="<%= lnCancel.getE03DEAPRO().trim()%>" readonly>
                </b> </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
<br>

<%int row = 0; %>
 <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing=0 cellpadding=2 width="100%" border="0">
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="40%"> 
              <div align="right"><b></b></div>
            </td>
            <td nowrap width="30%"> 
              <div align="right"><b>Actual</b></div>
            </td>
            <td nowrap width="30%"> 
              <div align="right"><b>Nuevo</b></div>
            </td>
          </tr>

          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap> 
              <div align="right">Total Cuotas :</div>
            </td>
            <td nowrap> 
              <div align="right"><%= lnCancel.getE03DLCNC1()%></div>
            </td>
            <td nowrap> 
              <div align="right"><%= lnCancel.getN03DLCNC1()%></div>
            </td>
          </tr>

          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap> 
              <div align="right">Cuotas Pagadas :</div>
            </td>
            <td nowrap> 
              <div align="right"><%= lnCancel.getE03DLCCP1()%></div>
            </td>
            <td nowrap> 
              <div align="right"><%= lnCancel.getN03DLCCP1()%></div>
            </td>
          </tr>	 

          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap> 
              <div align="right">Cuotas Pendientes :</div>
            </td>
            <td nowrap> 
              <div align="right"><%=resto%></div>
            </td>
            <td nowrap> 
              <div align="right"><%=resto1%></div>
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap> 
              <div align="right">Fecha Proximo Pago:</div>
            </td>
            <td nowrap> 
              <div align="right"><%=Util.formatCustomDate(currUser.getE01DTF(),
						              lnCancel.getBigDecimalE03DLCXM1().intValue(),
						              lnCancel.getBigDecimalE03DLCXD1().intValue(),
						              lnCancel.getBigDecimalE03DLCXY1().intValue())%></div>
            </td>
            <td nowrap> 
               <div align="right"><%=Util.formatCustomDate(currUser.getE01DTF(),
						              lnCancel.getBigDecimalN03DLCXM1().intValue(),
						              lnCancel.getBigDecimalN03DLCXD1().intValue(),
						              lnCancel.getBigDecimalN03DLCXY1().intValue())%></div>
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap> 
              <div align="right">Valor cuota:</div>
            </td>
            <td nowrap> 
              <div align="right"><%= Util.fcolorCCY(lnCancel.getE03DLCVA1())%></div>
            </td>
            <td nowrap> 
              <div align="right"><%= Util.fcolorCCY(lnCancel.getN03DLCVA1())%></div>
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap> 
              <div align="right">Frecuencia :</div>
            </td>
            <td nowrap> 
              <div align="right"><%= lnCancel.getE03DLCFP1().trim()%>/<%= lnCancel.getE03DLCTP1().trim()%></div>
            </td>
            <td nowrap> 
              <div align="right"><%= lnCancel.getN03DLCFP1().trim()%>/<%= lnCancel.getN03DLCTP1().trim()%></div>
            </td>
          </tr>
		  <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap> 
              <div align="right">Fecha Vencimiento :</div>
            </td>
            <td nowrap> 
              <div align="right">
                 <eibsinput:date name="lnCancel"  fn_month="E03DEAMDM" fn_day="E03DEAMDD" fn_year="E03DEAMDY" /> 
                 

              </div>
            </td>
            <td nowrap> 
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap> 
              <div align="right">Saldo Capital :</div>
            </td>
            <td nowrap> 
               <div align="right"><%=Util.fcolorCCY(lnCancel.getE03DEAPRI())%></div>
            </td>
            <td nowrap> 
               <div align="right"><%=Util.fcolorCCY(lnCancel.getE03SALPRI())%></div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>

  <p align="center"> 
    <input id="EIBSBTN" type=button name="Submit" value="Cerrar" onclick="checkClose()">
  </p>

</form>
</body>
</html>
