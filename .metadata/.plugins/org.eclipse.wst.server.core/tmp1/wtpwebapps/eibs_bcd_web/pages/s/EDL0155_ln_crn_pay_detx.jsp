<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@ page import="com.datapro.constants.EibsFields" %>
<%@ page import="datapro.eibs.master.*" %>
<%@ page import="datapro.eibs.master.Util" %>
<%@ page import="java.lang.Object" %>
<%@ page import="com.datapro.presentation.input.EibsInput" %>

<HTML>   
<HEAD>
<TITLE>Payment Details</TITLE>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/jquery/plugins/contextMenu/css/jquery.contextMenu.css" rel="stylesheet" type="text/css" />

<jsp:useBean id="record" class="datapro.eibs.beans.EDL015502Message" scope="session"/>
<jsp:useBean id="userPO" class="datapro.eibs.beans.UserPos" scope="session"/>
<jsp:useBean id="error" class="datapro.eibs.beans.ELEERRMessage" scope="session" />
<jsp:useBean id="currUser" class="datapro.eibs.beans.ESS0030DSMessage" scope="session"/>

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>

<SCRIPT type="text/javascript">

function goAction(opt) {
  var pnu = getElement("PNU").value;
  var amnt; var paid; var cond;
  amnt = 0.00; paid = 0.00; cond = 0.00;
  
  amnt = amnt + parseFloat(getElement("PYVG"+pnu).value);
  amnt = amnt + parseFloat(getElement("PYVN"+pnu).value);
  amnt = amnt + parseFloat(getElement("PYSU"+pnu).value);
  amnt = amnt + parseFloat(getElement("PYCS"+pnu).value);
  amnt = amnt + parseFloat(getElement("PYPC"+pnu).value);

  paid = paid + parseFloat(getElement("PDVG"+pnu).value);
  paid = paid + parseFloat(getElement("PDVN"+pnu).value);
  paid = paid + parseFloat(getElement("PDSU"+pnu).value);
  paid = paid + parseFloat(getElement("PDCS"+pnu).value);
  paid = paid + parseFloat(getElement("PDPC"+pnu).value);

  cond = cond + parseFloat(getElement("CDVG"+pnu).value);
  cond = cond + parseFloat(getElement("CDVN"+pnu).value);
  cond = cond + parseFloat(getElement("CDSU"+pnu).value);
  cond = cond + parseFloat(getElement("CDCS"+pnu).value);
  cond = cond + parseFloat(getElement("CDPC"+pnu).value);
  
  if (pnu == "02") {
    top.opener.document.forms[0].E02PYVG02.value = getElement("PYVG"+pnu).value;
    top.opener.document.forms[0].E02PYVN02.value = getElement("PYVN"+pnu).value;
    top.opener.document.forms[0].E02PYSU02.value = getElement("PYSU"+pnu).value;
    top.opener.document.forms[0].E02PYCS02.value = getElement("PYCS"+pnu).value;
    top.opener.document.forms[0].E02PYPC02.value = getElement("PYPC"+pnu).value;
    top.opener.document.forms[0].E02PDVG02.value = getElement("PDVG"+pnu).value;
    top.opener.document.forms[0].E02PDVN02.value = getElement("PDVN"+pnu).value;
    top.opener.document.forms[0].E02PDSU02.value = getElement("PDSU"+pnu).value;
    top.opener.document.forms[0].E02PDCS02.value = getElement("PDCS"+pnu).value;
    top.opener.document.forms[0].E02PDPC02.value = getElement("PDPC"+pnu).value;
    top.opener.document.forms[0].E02CDVG02.value = getElement("CDVG"+pnu).value;
    top.opener.document.forms[0].E02CDVN02.value = getElement("CDVN"+pnu).value;
    top.opener.document.forms[0].E02CDSU02.value = getElement("CDSU"+pnu).value;
    top.opener.document.forms[0].E02CDCS02.value = getElement("CDCS"+pnu).value;
    top.opener.document.forms[0].E02CDPC02.value = getElement("CDPC"+pnu).value;
    top.opener.document.forms[0].E02AMNT02.value = formatCCY(amnt);
    top.opener.document.forms[0].E02PAID02.value = formatCCY(paid);
    top.opener.document.forms[0].E02COND02.value = formatCCY(cond);
  }
  if (pnu == "03") {
    top.opener.document.forms[0].E02PYVG03.value = getElement("PYVG"+pnu).value;
    top.opener.document.forms[0].E02PYVN03.value = getElement("PYVN"+pnu).value;
    top.opener.document.forms[0].E02PYSU03.value = getElement("PYSU"+pnu).value;
    top.opener.document.forms[0].E02PYCS03.value = getElement("PYCS"+pnu).value;
    top.opener.document.forms[0].E02PYPC03.value = getElement("PYPC"+pnu).value;
    top.opener.document.forms[0].E02PDVG03.value = getElement("PDVG"+pnu).value;
    top.opener.document.forms[0].E02PDVN03.value = getElement("PDVN"+pnu).value;
    top.opener.document.forms[0].E02PDSU03.value = getElement("PDSU"+pnu).value;
    top.opener.document.forms[0].E02PDCS03.value = getElement("PDCS"+pnu).value;
    top.opener.document.forms[0].E02PDPC03.value = getElement("PDPC"+pnu).value;
    top.opener.document.forms[0].E02CDVG03.value = getElement("CDVG"+pnu).value;
    top.opener.document.forms[0].E02CDVN03.value = getElement("CDVN"+pnu).value;
    top.opener.document.forms[0].E02CDSU03.value = getElement("CDSU"+pnu).value;
    top.opener.document.forms[0].E02CDCS03.value = getElement("CDCS"+pnu).value;
    top.opener.document.forms[0].E02CDPC03.value = getElement("CDPC"+pnu).value;
    top.opener.document.forms[0].E02AMNT03.value = formatCCY(amnt);
    top.opener.document.forms[0].E02PAID03.value = formatCCY(paid);
    top.opener.document.forms[0].E02COND03.value = formatCCY(cond);
  }
  cerrarVentana();
}

function cerrarVentana(){
	window.open('','_parent','');
	window.close(); 
}

</SCRIPT>

</HEAD>

<BODY>
<% 
 if ( !error.getERRNUM().equals("0")  ) {
     error.setERRNUM("0");
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
 }
 String pnu = request.getParameter("pnu");
%>

<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDL0155" >
  <h3 align="center">Mantenimiento al Plan de Pagos y Deducciones<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="ln_crn_pay_detx.jsp , EDL0155"></h3>
  <hr size="4">
  <input type=HIDDEN name="PNU" value="<%=pnu%>">

  <h4></h4>

  <h4 align="left">DETALLE <%=record.getFieldString("E02DESC"+pnu) %></h4> 
  <table class="tableinfo">
    <tr> 
      <td nowrap> 
        <table id="infoTable" cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
          <tr id="trdark"> 
            <th align=center nowrap width="35%">Descripción</th>
            <th align=center nowrap width="15%">A Pagar</th>
            <th align=center nowrap width="15%">Pagado</th>
            <th align=center nowrap width="15%">Condonado</th>
          </tr>
          <tr id="trclear">  
            <td nowrap width="35%" align="center" >VIGENTE</td>
            <td nowrap width="15%" align="right"> 
              <input type="text" class="txtright" name="<%="PYVG"+pnu%>" size="19" maxlength="18" value="<%=request.getParameter("PYVG") %>" onclick="this.select();" onkeypress="enterDecimal(event,2)" onblur="this.value=formatCCY(this.value);" >
            </td>
            <td nowrap width="15%" align="right"> 
              <input type="text" class="txtright" name="<%="PDVG"+pnu%>" size="19" maxlength="18" value="<%=request.getParameter("PDVG") %>" onclick="this.select();" onkeypress="enterDecimal(event,2)" onblur="this.value=formatCCY(this.value);" >
            </td>
            <td nowrap width="15%" align="right"> 
              <input type="text" class="txtright" name="<%="CDVG"+pnu%>" size="19" maxlength="18" value="<%=request.getParameter("CDVG") %>" onclick="this.select();" onkeypress="enterDecimal(event,2)" onblur="this.value=formatCCY(this.value);" >            
            </td>
          </tr>
          <tr id="trclear">  
            <td nowrap width="35%" align="center" >VENCIDO</td>
            <td nowrap width="15%" align="right"> 
              <input type="text" class="txtright" name="<%="PYVN"+pnu%>" size="19" maxlength="18" value="<%=request.getParameter("PYVN")%>" onclick="this.select();" onkeypress="enterDecimal(event,2)" onblur="this.value=formatCCY(this.value);" >
            </td>
            <td nowrap width="15%" align="right"> 
              <input type="text" class="txtright" name="<%="PDVN"+pnu%>" size="19" maxlength="18" value="<%=request.getParameter("PDVN") %>" onclick="this.select();" onkeypress="enterDecimal(event,2)" onblur="this.value=formatCCY(this.value);" >
            </td>
            <td nowrap width="15%" align="right"> 
              <input type="text" class="txtright" name="<%="CDVN"+pnu%>" size="19" maxlength="18" value="<%=request.getParameter("CDVN") %>" onclick="this.select();" onkeypress="enterDecimal(event,2)" onblur="this.value=formatCCY(this.value);" >            
            </td>
          </tr>
          <tr id="trclear">  
            <td nowrap width="35%" align="center" >SUSPENDIDO</td>
            <td nowrap width="15%" align="right"> 
              <input type="text" class="txtright" name="<%="PYSU"+pnu%>" size="19" maxlength="18" value="<%=request.getParameter("PYSU") %>" onclick="this.select();" onkeypress="enterDecimal(event,2)" onblur="this.value=formatCCY(this.value);" >
            </td>
            <td nowrap width="15%" align="right"> 
              <input type="text" class="txtright" name="<%="PDSU"+pnu%>" size="19" maxlength="18" value="<%=request.getParameter("PDSU") %>" onclick="this.select();" onkeypress="enterDecimal(event,2)" onblur="this.value=formatCCY(this.value);" >
            </td>
            <td nowrap width="15%" align="right"> 
              <input type="text" class="txtright" name="<%="CDSU"+pnu%>" size="19" maxlength="18" value="<%=request.getParameter("CDSU") %>" onclick="this.select();" onkeypress="enterDecimal(event,2)" onblur="this.value=formatCCY(this.value);" >            
            </td>
          </tr>
          <tr id="trclear">  
            <td nowrap width="35%" align="center" >CASTIGADO</td>
            <td nowrap width="15%" align="right"> 
              <input type="text" class="txtright" name="<%="PYCS"+pnu%>" size="19" maxlength="18" value="<%=request.getParameter("PYCS") %>" onclick="this.select();" onkeypress="enterDecimal(event,2)" onblur="this.value=formatCCY(this.value);" >
            </td>
            <td nowrap width="15%" align="right"> 
              <input type="text" class="txtright" name="<%="PDCS"+pnu%>" size="19" maxlength="18" value="<%=request.getParameter("PDCS") %>" onclick="this.select();" onkeypress="enterDecimal(event,2)" onblur="this.value=formatCCY(this.value);" >
            </td>
            <td nowrap width="15%" align="right"> 
              <input type="text" class="txtright" name="<%="CDCS"+pnu%>" size="19" maxlength="18" value="<%=request.getParameter("CDCS") %>" onclick="this.select();" onkeypress="enterDecimal(event,2)" onblur="this.value=formatCCY(this.value);" >            
            </td>
          </tr>
          <tr id="trclear">  
            <td nowrap width="35%" align="center" >POST-CASTIGO</td>
            <td nowrap width="15%" align="right"> 
              <input type="text" class="txtright" name="<%="PYPC"+pnu%>" size="19" maxlength="18" value="<%=request.getParameter("PYPC") %>" onclick="this.select();" onkeypress="enterDecimal(event,2)" onblur="this.value=formatCCY(this.value);" >
            </td>
            <td nowrap width="15%" align="right"> 
              <input type="text" class="txtright" name="<%="PDPC"+pnu%>" size="19" maxlength="18" value="<%=request.getParameter("PDPC") %>" onclick="this.select();" onkeypress="enterDecimal(event,2)" onblur="this.value=formatCCY(this.value);" >
            </td>
            <td nowrap width="15%" align="right"> 
              <input type="text" class="txtright" name="<%="CDPC"+pnu%>" size="19" maxlength="18" value="<%=request.getParameter("CDPC") %>" onclick="this.select();" onkeypress="enterDecimal(event,2)" onblur="this.value=formatCCY(this.value);" >            
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>

  <!--  
  <br>
  <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
          <tr id="trdark"> 
            <td nowrap width="20%" height="18" ><b>Total</b></td>
            <td nowrap width="3%" height="18" >&nbsp;</td>
            <td nowrap width="37%" height="18" >A Pagar :&nbsp; <input type="text" name="E02TOAMNT" size="17" maxlength="16" value="<%=record.getE02TOAMNT()%>" readonly class="txtright"></td>
            <td nowrap width="4%" height="18" >&nbsp;</td>
            <td nowrap width="36%" height="18" > 
              <div align="left">Pagado :&nbsp;<input type="text" name="E02TOPAID" size="17" maxlength="16" value="<%=record.getE02TOPAID()%>" readonly class="txtright"></div>
            </td>
            <td nowrap width="36%" height="18" > 
              <div align="left">Condonado :&nbsp;<input type="text" name="E02TOCOND" size="17" maxlength="16" value="<%=record.getE02TOCOND()%>" readonly class="txtright"></div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  -->
  
  <br>
  <table width="100%" border="0" cellspacing="0" cellpadding="0" bgcolor="#FFFFFF" bordercolor="#FFFFFF">
    <tr bgcolor="#FFFFFF"> 
      <td width="33%" align="center"> 
        <input id="EIBSBTN" type=button name="Submit" value="Enviar" onClick="goAction();">
      </td>
    </tr>    
  </table>
    
</FORM>
</BODY>
</HTML>
