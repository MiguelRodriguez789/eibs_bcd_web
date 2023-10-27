<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>Tasas de Prestamos</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Studio">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">




<jsp:useBean id="lnParam" class="datapro.eibs.beans.EDL075002Message"  scope="session" />

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />


<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.js"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>

<SCRIPT type="text/javascript">

  function checkValues() {
       
       return true;
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

</head>
<body>
<h3 align="center">Factor<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="Loans_parameters_maint.jsp"> 
</h3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.params.JSEDL0750" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" value="201">
  <INPUT TYPE=HIDDEN NAME="OPT" value="<%= request.getParameter("OPT") %>">
  <INPUT TYPE=HIDDEN NAME="SELTYP" value="<%= request.getParameter("SELTYP") %>">
  
  <table class="tableinfo">
    <tr> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
          <tr id="trdark"> 
            <td nowrap width="20%" align=right> 
              <b>Banco :</b>
            </td>
            <td nowrap width="20%" > 
              <input type="text" name="E01TDBBNK" size="4" maxlength="2" value="<%= lnParam.getE02TDFBNK()%>" readonly>
            </td>
            <td nowrap align=right width="20%"> 
              <b>Clase :</b>
            </td>
            <td nowrap width="20%" > 
               <input type="text" name="E02TDFCLS" size="5" maxlength="4" value="<%= lnParam.getE02TDFCLS()%>" readonly>
            </td>
            <td nowrap colspan=2> 
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="20%" align=right> 
              <b>Tabla :</b>
            </td>
            <td nowrap width="20%" >  
               <input type="text" name="E02SELTBL" size="4" maxlength="2" value="<%= lnParam.getE02TDFTBL()%>">
               <input type="text" name="E02TDFTBL" size="35" maxlength="35" value="<%= lnParam.getE02TDFTBL()%>">
            </td>
            <td nowrap align=right width="20%"> 
              <b>Comisión :</b>
            </td>
            <td nowrap width="20%" > 
               <input type="text" name="E02TDFCMA" size="5" maxlength="4" value="" readonly>
            </td>
            <td nowrap colspan=2> 
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="20%" align=right> 
              <b>Número Cupón :</b>
            </td>
            <td nowrap width="20%" >  
               <input type="text" name="E02SELNCD" size="15" maxlength="15" value="<%= lnParam.getE02TDFNCD()%>">
            </td>
            <td nowrap align=right width="20%"> 
              <b></b>
            </td>
            <td nowrap width="20%" > 
               
            </td>
            <td nowrap colspan=2> 
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  
  <H4>Datos B&aacute;sicos</H4>
  <table  class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="trdark">
            <td nowrap colspan=2> 
            <div align="right">Factor Capital:</div>
            </td>
            <td nowrap colspan=7> 
            <input type="text" name="E02TDFCAP" size="8" maxlength="10" value="<%=lnParam.getE02TDFCAP()%>" onkeypress="enterDecimal()">
            </td>
          </tr>
          <tr id="trclear">
            <td nowrap colspan=2> 
            <div align="right">Factor Interés:</div>
            </td>
            <td nowrap colspan=7> 
            <input type="text" name="E02TDFINT" size="8" maxlength="10" value="<%=lnParam.getE02TDFINT()%>" onkeypress="enterDecimal()">
            </td>
          </tr>
          <tr id="trdark">
            <td nowrap colspan=2> 
            <div align="right">Factor Comisión:</div>
            </td>
            <td nowrap colspan=7> 
            <input type="text" name="E02TDFCOM" size="8" maxlength="10" value="<%=lnParam.getE02TDFCOM()%>" onkeypress="enterDecimal()">
            </td>
          </tr>
          <tr id="trclear">
            <td nowrap colspan=2> 
            <div align="right">Monto Cupón:</div>
            </td>
            <td nowrap colspan=7> 
            <input type="text" name="E02TDFTCD" size="8" maxlength="10" value="<%=lnParam.getE02TDFTCD()%>" onkeypress="enterDecimal()">
            </td>
          </tr>
          <tr id="trdark">
            <td nowrap colspan=2> 
            <div align="right">Amortización Acumulada:</div>
            </td>
            <td nowrap colspan=7> 
            <input type="text" name="E02TDFAMA" size="8" maxlength="10" value="<%=lnParam.getE02TDFAMA()%>" onkeypress="enterDecimal()">
            </td>
          </tr>
          <tr id="trclear">
            <td nowrap colspan=2> 
            <div align="right">Saldo Capital:</div>
            </td>
            <td nowrap colspan=7> 
            <input type="text" name="E02TDFSCA" size="8" maxlength="10" value="<%=lnParam.getE02TDFSCA()%>" onkeypress="enterDecimal()">
            </td>
          </tr>
          <tr id="trdark">
			<td nowrap colspan=9>
			  
            </td>			
          </tr>
         </table>
       </td>
    </tr>
  </table>
  <p align="center"> 
        <input id="EIBSBTN" type=submit name="Submit" value="Enviar">
  </p>
 
  </form>
</body>
</html>
