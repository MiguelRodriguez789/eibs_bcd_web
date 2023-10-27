<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<%@ page import="datapro.eibs.master.Util" %>

<html>
<head>
<title>Placement of Collaterals</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>

<jsp:useBean id="gaBasic" class="datapro.eibs.beans.ERA000501Message"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />

<SCRIPT type="text/javascript">
   
 function CheckSubmit() {
  document.forms[0].submit();
 }

 function getAmount(num) {
  if (num == 1) {
   if (trim(document.forms[0].E01OFFAM1.value)=="0.00" || trim(document.forms[0].E01OFFAM1.value)=="") {
    document.forms[0].E01OFFAM1.value = document.forms[0].E01DEAOAM.value;
   }
  }
 }

</SCRIPT>

</head>

<body ="">
<% 
 if ( !error.getERRNUM().equals("0")  ) {
  error.setERRNUM("0");
  out.println("<SCRIPT Language=\"Javascript\">");
  out.println("       showErrors()");
  out.println("</SCRIPT>");
 }
%>
<h3 align="center">
<%
			if (gaBasic.getE01RCLINDE().equals("5")) {
		%>
		 	   Pignoracion		  			 
		<%
			}
			else {
		%>
			    Despignoracion
		<%
			}		 
%>
           de Garantias a Cuentas del Cliente<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="ga_confirm_pigdes_era0005"> 
</h3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSERA0005P" >
  <p> 
  
    <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="100">
    <INPUT TYPE=HIDDEN NAME="E01RCLTIPO" VALUE="<%= gaBasic.getE01RCLTIPO()%>">
  </p>
  <h4>Operaciones a Garantizar</h4>
  <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
          <tr id="trdark"> 
            <td nowrap width="16%" > 
              <div align="right">Cliente<b> :</b></div>
            </td>
            <td nowrap width="20%" > 
              <div align="left"> <%= gaBasic.getE01RCLACUN()%> </div>
            </td>
            <td nowrap width="16%" > 
              <div align="right">Nombre :</div>
            </td>
            <td nowrap > 
              <div align="left"> <%= gaBasic.getE01CUSNA1A()%> </div>
            </td>
          </tr>
          <tr id="trclear">
            <td nowrap width="16%" height="17"> 
              <div align="right">Cuenta : </div>
            </td>
            <td nowrap width="20%" height="17"> <%= gaBasic.getE01RCLAACC()%> 
            </td>
            <td nowrap width="16%" height="17"> 
              <div align="right">Moneda :</div>
            </td>
            <td nowrap width="16%" height="17"> <%= gaBasic.getE01RCLACCY()%> 
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="16%"> 
              <div align="right">Typo de Producto :</div>
            </td>
            <td nowrap width="20%"> <%= gaBasic.getE01RCLATYP()%> </td>
            <td nowrap width="16%"> 
              <div align="right">Monto Original :</div>
            </td>
            <td nowrap width="16%"> <%= Util.fcolorCCY(gaBasic.getE01RCLAORA())%> </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="16%"> 
              <div align="right">Fecha de Apertura :</div>
            </td>
            <td nowrap width="20%"> 
              <div align="left"> <%= Util.formatCustomDate(currUser.getE01DTF(),
              								gaBasic.getBigDecimalE01RCLAODM().intValue(),
              								gaBasic.getBigDecimalE01RCLAODD().intValue(),
              								gaBasic.getBigDecimalE01RCLAODY().intValue())%> </div>
            </td>
            <td nowrap width="16%"> 
              <div align="right">Monto Actual :</div>
            </td>
            <td nowrap width="16%"> 
              <div align="left"> <%= Util.fcolorCCY(gaBasic.getE01RCLABAL())%> </div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="16%"> 
              <div align="right">Fecha de Vencimiento :</div>
            </td>
            <td nowrap width="20%"><%= Util.formatCustomDate(currUser.getE01DTF(),
              								gaBasic.getBigDecimalE01RCLAMDM().intValue(),
              								gaBasic.getBigDecimalE01RCLAMDD().intValue(),
              								gaBasic.getBigDecimalE01RCLAMDY().intValue())%> </td>
            <td nowrap width="16%"> 
              <div align="right">Monto Garantizado :</div>
            </td>
            <td nowrap width="16%"> <%= Util.fcolorCCY(gaBasic.getE01RCLAGAN())%> </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="16%"> 
              <div align="right"></div>
            </td>
            <td nowrap width="20%">&nbsp; </td>
            <td nowrap width="16%"> 
              <div align="right">Monto Pendiente :</div>
            </td>
            <td nowrap width="16%"> <%= Util.fcolorCCY(gaBasic.getE01RCLAAVL())%> </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <h4>Asignación de Garantias</h4> 
  <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellpadding=2 cellspacing=0 width="100%" border="0">
          <tr id="trdark"> 
            <td nowrap width="20%"> 
              <div align="right">Número de Garantía :</div>
            </td>
            <td nowrap width="30%"> <%= gaBasic.getE01RCLBACC()%> </td>
            <td nowrap width="22%"> 
              <div align="right">Typo de Cuenta :</div>
            </td>
            <td nowrap width="7%"> <%= gaBasic.getE01RCLBTYP()%> </td>
            <td nowrap width="9%"> 
              <div align="right">Estado :</div>
            </td>
            <td nowrap width="12%"> <%= gaBasic.getE01RCLBSTA()%> </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="20%" height="37"> 
              <div align="right">Cliente :</div>
            </td>
            <td nowrap width="30%" height="37"> <%= gaBasic.getE01RCLBCUN()%> 
            </td>
            <td nowrap width="22%" height="37"> 
              <div align="right">Nombre :</div>
            </td>
            <td nowrap height="37" colspan="3"> 
              <div align="left"> <%= gaBasic.getE01CUSNA1B()%> </div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="20%" > 
              <div align="right">Monto :</div>
            </td>
            <td nowrap width="30%" > <%= Util.fcolorCCY(gaBasic.getE01RCLBOPE())%> 
              <input type=HIDDEN name="E01RCLINDE" value="<%= gaBasic.getE01RCLINDE()%>">
              <input type="radio" name="CE01RCLINDE" value="5" onClick="document.forms[0].E01RCLINDE.value='5'"
			  <%if(gaBasic.getE01RCLINDE().equals("5")) out.print("checked");%> disabled>
              Aumento 
              <input type="radio" name="CE01RCLINDE" value="0" onClick="document.forms[0].E01RCLINDE.value='0'"
			  <%if(gaBasic.getE01RCLINDE().equals("0")) out.print("checked");%> disabled>
              Disminución </td>
            <td nowrap width="22%" > 
              <div align="right">Monto de la Garantía :</div>
            </td>
            <td nowrap colspan="3" > <%= Util.fcolorCCY(gaBasic.getE01RCLBALT())%> </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="20%" > 
              <div align="right">Vencimiento Garantía :</div>
            </td>
            <td nowrap width="30%" > <%= Util.formatCustomDate(currUser.getE01DTF(),
              								gaBasic.getBigDecimalE01RCLEXPM().intValue(),
              								gaBasic.getBigDecimalE01RCLEXPD().intValue(),
              								gaBasic.getBigDecimalE01RCLEXPY().intValue())%> </td>
            <td nowrap width="22%" > 
              <div align="right">Monto no Elegible :</div>
            </td>
            <td nowrap colspan="3" > <%= Util.fcolorCCY(gaBasic.getE01RCLBEAM())%> </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="20%" > 
              <div align="right">Código Moneda:</div>
            </td>
            <td nowrap width="30%" > <%= gaBasic.getE01RCLBCCY()%> </td>
            <td nowrap width="22%" > 
              <div align="right">Monto Dado en Garantía :</div>
            </td>
            <td nowrap colspan="3" > <%= Util.fcolorCCY(gaBasic.getE01RCLBAUS())%> </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="20%" > 
              <div align="right">Tasa de Cambio :</div>
            </td>
            <td nowrap width="30%" > <%= gaBasic.getE01RCLEXR ()%> </td>
            <td nowrap width="22%" > 
              <div align="right">Monto Disponible :</div>
            </td>
            <td nowrap colspan="3" > <%= Util.fcolorCCY(gaBasic.getE01RCLBAVL())%> </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="20%" > 
              <div align="right">Comentarios :</div>
            </td>
            <td nowrap width="30%" > <%= gaBasic.getE01RCLSP1()%> </td>
            <td nowrap width="22%" > 
              <div align="right">Monto de esta Operación :</div>
            </td>
            <td nowrap colspan="3" > <%= Util.fcolorCCY(gaBasic.getE01RCLBOPE())%> </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="20%" > 
              <div align="right"></div>
            </td>
            <td nowrap width="30%" > <%= gaBasic.getE01RCLSP2()%> </td>
            <td nowrap width="22%" > 
              <div align="right">Saldo Final a Garantizar:</div>
            </td>
            <td nowrap colspan="3" > <%= Util.fcolorCCY(gaBasic.getE01RCLBFIN())%> </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <p>&nbsp;</p><table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellpadding=2 cellspacing=0 width="100%" border="0">
          <tr id="trdark"> 
            <td nowrap width="20%"> 
              <div align="center">Esta Operación ha sido exitosamente procesada.Esta pantalla no es valida como un recibo Oficial.</div>
            </td>
          </tr>
          <tr >
         	<TD class=TDBKG> 
        		<div align="center"><a href="<%=request.getContextPath()%>/pages/background.jsp"><b>Continuar</b></a></div>
      		</TD>  
      	  <tr >
        </table>
      </td>
    </tr>
  </table>
  <h4> </h4>
  <p align="center">&nbsp;</p>
  <p align="center">&nbsp; </p>
  </form>
</body>
</html>
