<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@ page import = "datapro.eibs.master.Util" %>
<%@ page import="com.datapro.constants.EibsFields"%>
<HTML>
<HEAD>
<TITLE>
Estado de Cuentas de Cuentas Contables
</TITLE>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
</HEAD>

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "glList" class= "datapro.eibs.beans.JBList"  scope="session" />
<jsp:useBean id="stGLBal" class="datapro.eibs.beans.EGL042002Message"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />

<BODY>

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>

<SCRIPT type="text/javascript">

function PrintPreview() {
	var empty = <%=glList.getNoResult()%>;
	if (empty) {
		alert("No hay transacciones para imprimir.]");
	}  else {
		var pg = '<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSEGL0420?SCREEN=3';
		CenterWindow(pg, 720, 500, 2);
	}
}

function goExcel() {
	var empty = <%=glList.getNoResult()%>;
	if (empty) {
		alert("No hay transacciones para mostrar en Excel.");
	}  else {
		var pg = '<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSEGL0420?SCREEN=5';
		CenterWindow(pg, 720, 500, 2);
	}
}

function PrintPreviewPDF() {
	var empty = <%=glList.getNoResult()%>;
	if (empty) {
		alert("No hay transacciones para generar PDF.");
	}  else {
		var pg = '<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSEGL0420?SCREEN=6';
		CenterWindow(pg, 720, 500, 2);
	}
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

<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSEGL0420">
	  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="300">
	
  <h3 align="center">Consulta de Transacciones de Cuentas Contables
  		<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="st_list_fv.jsp,EGL0420"> 
  </h3>
  <hr size="4">

  <p>&nbsp;</p>
<table class="tableinfo">
    <tr > 
      <td nowrap>
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
          <tr id="trdark">
            <td nowrap width="30%" > 
              <div align="right"><b>Cuenta Contable : </b></div>
            </td>
            <td nowrap width="70%" > 
              <input type="text" name="E02GLMBNK" size="3" maxlength="2" value="<%= userPO.getBank().trim()%>" readonly>
              <input type="text" name="E02GLMCCY" size="4" readonly maxlength="3" value="<%= userPO.getCurrency().trim()%>" >
              <input type="text" name="E02GLMBRN" size="4" readonly maxlength="3" value="<%= userPO.getBranch().trim()%>" >
              <input type="text" name="E02GLMGLN" size="20" readonly maxlength="16" value="<%= userPO.getAccNum().trim()%>" >
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="30%" > 
              <div align="right">Descripci&oacute;n : </div>
            </td>
            <td nowrap width="70%" > 
              <div align="left"> 
                <input type="text" name="E02GLMDSC" size="40" readonly maxlength="35" value="<%= stGLBal.getE02GLMDSC().trim()%>" >
              </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  
  <h4>Datos B&aacute;sicos de la Cuenta</h4>
  
  <table class="tableinfo">
    <tr > 
      <td > 
        <table cellspacing=0 cellpadding=2 width="100%" border="0">
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
              <div align="right"><b>Promedio del Mes al &uacute;ltimo cierre : </b></div>
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
  <h4 align="left">Transacciones</h4>
  <table id=cfTable class="tableinfolist">
    <tr id="trdark"> 
      <th align=CENTER width="53" nowrap>Fecha Valor</th>
	  <TH ALIGN=CENTER width="53" nowrap>Fecha Registro</TH>
      <th align=CENTER width="57" nowrap>Referencia</th>
      <th align=CENTER width="25" nowrap>TC</th>
      <th align=CENTER width="230" nowrap>Descripci&oacute;n </th>
      <th align=CENTER width="36" nowrap> 
        <div align="right">D&eacute;bito</div>
      </th>
      <th align=CENTER width="46" nowrap> 
        <div align="center">Cr&eacute;dito</div>
      </th>
      <th align=CENTER width="57" nowrap> 
        <div align="center">Saldo</div>
      </th>
      <th align=CENTER width="49" nowrap>Lote</th>
      <th align=CENTER width="43" nowrap>Fecha Proceso </th>
      <th align=CENTER width="39" nowrap>Hora</th>
      <th align=CENTER width="50" nowrap>Usuario </th>
      <th align=CENTER width="47" nowrap> 
        <p>Ban Originador</p>
      </th>
      <th align=CENTER width="43" nowrap>Sucursal Originadora</th>
    </tr>
<%
                glList.initRow();
                while (glList.getNextRow()) {
               		out.println(glList.getRecord());
                }
%> 
  </table>
  <BR>
  
  <TABLE class="tbenter" WIDTH="98%" ALIGN=CENTER>
  <TR>
  <TD WIDTH="50%" ALIGN=LEFT>
       <%
        if ( glList.getShowPrev() ) {
      			int pos = glList.getFirstRec() - 51;
      			out.println("<A HREF=\""+request.getContextPath()+"/servlet/datapro.eibs.client.JSEGL0420?SCREEN=1&Pos=" + pos +"\"><img src=\""+request.getContextPath()+"/images/s/previous_records.gif\" border=0></A>");
        }
        %> 
            </TD>
 				<TD WIDTH="50%" ALIGN=RIGHT>
        <%
        if ( glList.getShowNext() ) {
      			int pos = glList.getLastRec();
      			out.println("<A HREF=\""+request.getContextPath()+"/servlet/datapro.eibs.client.JSEGL0420?SCREEN=1&Pos=" + pos +"\"><img src=\""+request.getContextPath()+"/images/s/next_records.gif\" border=0></A>");
        }
        %> 
 </TD>
 </TR>
 </TABLE>      

  <div align="center"> 
    <input class="EIBSBTN" type=button name="Submit" OnClick="PrintPreview()" value="Imprimir">
	<input class="EIBSBTN" type=button name="Submit" value="PDF"   OnClick="PrintPreviewPDF();">
    <input class="EIBSBTN" type=button name="Submit" OnClick="goExcel()" value="Excel">
	<input class="EIBSBTN" type=submit name="Submit" value="Regresar">
  </div>

</FORM>

</BODY>
</HTML>
