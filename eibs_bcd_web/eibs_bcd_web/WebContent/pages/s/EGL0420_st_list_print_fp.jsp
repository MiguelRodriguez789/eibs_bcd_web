<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@ page import = "datapro.eibs.master.Util" %>
<%@ page import="com.datapro.constants.EibsFields"%>
<HTML>
<HEAD>

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "glList" class= "datapro.eibs.beans.JBList"  scope="session" />
<jsp:useBean id="stGLBal" class="datapro.eibs.beans.EGL042002Message"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />

<TITLE>
Impresion de Estado de Cuentas
</TITLE>
<%
if ( userPO.getSource().equals("EXCEL")  ) {
	response.setContentType("application/vnd.ms-excel");
} else {
%>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<% } %>
</HEAD>



<BODY>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>

<SCRIPT type="text/javascript">

function doPrint(){
	if(!window.print){
       var msg ="Debe actualizar su navegador para imprimir";
	   alert(msg);
	   return;}
	
    window.focus();
	window.print();

	return;
}

function checkSubmit(){
  
  document.forms[0].submit();
}

</SCRIPT>
<% 
 if ( !error.getERRNUM().equals("0")  ) {
     error.setERRNUM("0");
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
 }
%> 

<FORM >
<%
	if ( glList.getNoResult() ) {
   		out.print("<h4>No hay resultados que correspondan a su criterio de b�squeda</h4>");
	}
	else {
%>
  <h3 align=""CENTER"">Transacciones de Cuentas Contables<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="st_list_print_fp.jsp,EGL0420"> 
  </h3>
  <hr size="4">
  <p>&nbsp;</p>
  <table class="tableinfo">
    <tr > 
      <td > 
        <table cellspacing=0 cellpadding=2 width="100%" border="0">
          <tr id="trdark">
            <td  width="31%" height="15" nowrap>
              <div align="right"><b>Cuenta Contable : </b></div>
            </td>
            <td colspan="3" height="15" nowrap><%= userPO.getBank().trim()%> <%= userPO.getCurrency().trim()%> 
              <%= userPO.getBranch().trim()%> <%= userPO.getAccNum().trim()%> 
              <%= stGLBal.getE02GLMDSC().trim()%> </td>
          </tr>
          <tr id="trdark"> 
            <td  width="31%" height="15" nowrap> 
              <div align="right"><b>Tipo de Cuenta : </b></div>
            </td>
            <td colspan="3" height="15"> 
              <div align="left">(<%= stGLBal.getE02GLMATY().trim()%>) <%= stGLBal.getE02DSCATY().trim()%></div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td  width="31%"> 
              <div align="right"><b>Clase de Cuenta : </b></div>
            </td>
            <td  width="19%" nowrap> 
              <div align="left">(<%= stGLBal.getE02GLMCLS().trim()%>) <%= stGLBal.getE02DSCCLS().trim()%></div>
            </td>
            <td  width="28%" nowrap> 
              <div align="right"><b>Cuenta Reconciliable : </b></div>
            </td>
            <td  width="22%"> 
              <div align="left"><% if (stGLBal.getE02GLMRCL().equals("Y")) out.print("Si"); else out.print("No"); %></div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td  width="31%" nowrap> 
              <div align="right"><b>Fecha de Apertura</b><b> : </b></div>
            </td>
            <td  width="19%"> 
              <div align="left">
              <%= Util.formatCustomDate(currUser.getE01DTF(),
												stGLBal.getBigDecimalE02GLBOPM().intValue(),
												stGLBal.getBigDecimalE02GLBOPD().intValue(),
												stGLBal.getBigDecimalE02GLBOPY().intValue())%> 
              </div>
            </td>
            <td  width="28%" nowrap> 
              <div align="right"><b>Requiere Centro de Costo : </b></div>
            </td>
            <td  width="22%"> 
              <div align="left"><% if (stGLBal.getE02GLMCCN().equals("Y")) out.print("Si"); else out.print("No"); %></div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td  width="31%" nowrap> 
              <div align="right"><b>Fecha de Ultima Transacci&oacute;n : </b></div>
            </td>
            <td  width="19%" nowrap> 
              <div align="left">
              <%= Util.formatCustomDate(currUser.getE01DTF(),
												stGLBal.getBigDecimalE02GLBLUM().intValue(),
												stGLBal.getBigDecimalE02GLBLUD().intValue(),
												stGLBal.getBigDecimalE02GLBLUY().intValue())%>               
              </div>
            </td>
            <td  width="28%" nowrap> 
              <div align="right"><b>Promedio del Mes : </b></div>
            </td>
            <td  width="22%"> 
              <div align="left" ><%= Util.fcolorCCY(stGLBal.getE02GLBAVG())%></div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td  width="31%"> 
              <div align="right"><b>Balance Actual : </b></div>
            </td>
            <td  width="19%" nowrap> 
              <div align="left"><%= Util.fcolorCCY(stGLBal.getE02GLBBAL())%></div>
            </td>
            <td  width="28%" nowrap> 
              <div align="right"><b> Saldo Inicial </b> <b>: </b></div>
            </td>
            <td  width="22%" nowrap> 
              <div align="left"><%= Util.fcolorCCY(userPO.getHeader5())%></div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <p>&nbsp;</p>
  <table class="tableinfo">
    <tr> 
      <th align="center" width="10%">Fecha Proceso</th>
      <th align="center" width="15%">Referencia</th>
      <th align="left" width="30%">Descripci&oacute;n</th>
      <th align="right" width="15%">D&eacute;bito</th>
      <th align="right" width="15%">Cr&eacute;dito</th>
      <th align="right" width="15%">Saldo</th>
    </tr>
<%
                glList.initRow();
                while (glList.getNextRow()) {
              		out.println(glList.getRecord());
                }
%> 
  </table>
  <p>&nbsp;</p>
  <table width="100%">
    <tr> 
      <td width="33%" nowrap align="left"> 
        <b>Total D&eacute;bitos : </b> (<%= userPO.getHeader22().trim()%>) : <%= userPO.getHeader19().trim()%>
      </td>
      <td width="34%" nowrap align="center">
      	<b>Total Cr&eacute;ditos :</b> (<%= userPO.getHeader23().trim()%>) : <%= userPO.getHeader20().trim()%>
      </td>
      <td width="33%" align="right"><b>Saldo Final :</b> <%= Util.fcolorCCY(userPO.getHeader21().trim())%></td>
    </tr>
  </table>
  
  <%
  }
%> 
</FORM>

</BODY>
</HTML>
