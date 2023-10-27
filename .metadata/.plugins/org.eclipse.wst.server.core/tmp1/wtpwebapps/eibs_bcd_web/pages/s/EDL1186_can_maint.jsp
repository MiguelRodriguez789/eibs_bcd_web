<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@page import="com.datapro.eibs.constants.ISOCodes"%>
<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@page import="com.datapro.constants.EibsFields"%>
<%@ page import = "datapro.eibs.beans.EDL118601Message" %>

<html>
<head>
<title>Mantenimiento Motivo de Cancelación de Créditos</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Studio">


<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.js"> </SCRIPT>

<jsp:useBean id="dlCast" class="datapro.eibs.beans.EDL118601Message"  scope="session" />
<jsp:useBean id= "extList" class= "datapro.eibs.beans.JBObjList"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>

</head>

<body nowrap>

<SCRIPT type="text/javascript">
   
function showLnsDatesInfo(obj){
	var DATESINFO = document.getElementById('DATESINFO');
	if (obj.checked) DATESINFO.style.display=""; else {
		DATESINFO.style.display="none";
	}
}

function showLnsBalancesInfo(obj){
	var BALINFO = document.getElementById('BALINFO');
	if (obj.checked) BALINFO.style.display=""; else {
		BALINFO.style.display="none";
	}
}

function showLnsRatesInfo(obj){
	var RATESINFO = document.getElementById('RATESINFO');
	if (obj.checked) RATESINFO.style.display=""; else {
		RATESINFO.style.display="none";
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


<h3 align="center">Mantenimiento Motivo de Cancelación de Créditos<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="can_maint.jsp, EDL1186"></h3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDL1186" id="form1">
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="4">
  <INPUT TYPE=HIDDEN NAME="OPT" VALUE="2">
  <INPUT TYPE=HIDDEN NAME="E01DLSSEQ" VALUE="99">            
  <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
          <tr id="trdark"> 
            <td nowrap width="20%" > 
              <div align="right"><b>Número de Crédito : </b></div>
            </td>
            <td nowrap width="30%" > 
              <div align="left"> 
                <input type="text" name="E01DEAACC" size="12" maxlength="12" value="<%= dlCast.getE01DEAACC().trim()%>" readonly>
              </div>
            </td>
            <td nowrap width="20%" > 
              <div align="right"><b>Cliente : </b></div>
            </td>
            <td nowrap width="5%" > 
              <div align="left"> 
                <input type="text" name="E01DEACUN" size="11" maxlength="9" value="<%= dlCast.getE01DEACUN().trim()%>" readonly>
              </div>
            </td>
            <td nowrap width="25%" > 
              <div align="left"> 
                <input type="text" name="D01PCMCUN" size="48" maxlength="45" value="<%= dlCast.getD01DEACUN().trim()%>" readonly>
              </div>
            </td>

          </tr>
        </table>
      </td>
    </tr>
  </table>




  <h4> Información Básica</h4> 
  <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellpadding=2 cellspacing=0 width="100%" border="0">

          <tr id="trdark"> 
            <td nowrap width="25%"> 
              <div align="right">Fecha de Apertura :</div>
            </td>
            <td nowrap width="23%"> 
				<eibsinput:date name="dlCast" fn_year="E01DEAODY" fn_month="E01DEAODM" fn_day="E01DEAODD" readonly="true"/>
            </td>
            <td nowrap width="25%"> 
              <div align="right">Fecha de Vencimiento :</div>
            </td>
            <td nowrap width="27%"> 
				<eibsinput:date name="dlCast" fn_year="E01DEAMDY" fn_month="E01DEAMDM" fn_day="E01DEAMDD" readonly="true"/>
            </td>
          </tr>



          <tr id="trclear"> 
            <td nowrap width="20%"> 
              <div align="right">Monto Original :</div>
            </td>
            <td nowrap width="35%"> 
              <input type="text" readonly name="E01DEAOAM" size="17" maxlength="15" value="<%= dlCast.getE01DEAOAM().trim()%>">
            </td>
            <td nowrap width="20%" height="37"> 
              <div align="right">Termino :</div>
            </td>
            <td nowrap width="35%" height="37"> 
             <input type="text" readonly name="E01DEATRM" size="4" maxlength="3" value="<%= dlCast.getE01DEATRM().trim()%>">
             <input type="text" readonly name="E01DEATRC" size="10" 
				  value="<% if (dlCast.getE01DEATRC().equals("D")) out.print("D&iacute;a(s)");
							else if (dlCast.getE01DEATRC().equals("M")) out.print("Mes(es)");
							else if (dlCast.getE01DEATRC().equals("Y")) out.print("A&ntilde;o(s)");
							else out.print("");%>" 
				>
            </td>
          </tr>

          <tr id="trdark"> 
            <td nowrap width="25%" > 
              <div align="right">Condición del Crédito :</div>
            </td>
            <td nowrap width="23%" > 
              <input type="text" readonly name="E01DEADLC" size="20" maxlength="18" 
				value="<% if (dlCast.getE01DEADLC().equals("1")) out.print("Vigente");
							else if (dlCast.getE01DEADLC().equals("2")) out.print("Vencido");
							else if (dlCast.getE01DEADLC().equals("3")) out.print("Castigado");
							else if (dlCast.getE01DEADLC().equals("4")) out.print("Litigio");
							else if (dlCast.getE01DEADLC().equals("5")) out.print("Litigio/Castigado");
							else if (dlCast.getE01DEADLC().equals("6")) out.print("En Recuperación");
							else if (dlCast.getE01DEADLC().equals(" ")) out.print("Vigente");
							else out.print("");%>" >

            <td nowrap width="25%"> 
              <div align="right">Motivo de Cancelación :</div>
            </td>
            <td nowrap width="27%">
              <input type="text" name="E01DEASUC" size="5" maxlength="4" value="<%= dlCast.getE01DEASUC().trim()%>">
              <input type="text" name="D01DEASUC" size="40" maxlength="35" value="<%= dlCast.getD01DEASUC().trim()%>" readonly>
              <a href="javascript:GetCodeDescCNOFC('E01DEASUC','D01DEASUC','MC')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="ayuda" align="bottom" border="0"></a> 
              <img src="<%=request.getContextPath()%>/images/Check.gif" title="campo obligatorio" align="bottom" border="0" > 
            </td>
          </tr>

        </table>
      </td>
    </tr>
  </table>  



  <p>
  <div align="center"> 
    <input id="EIBSBTN" type=submit name="Submit" value="Enviar">
  </div>
</form>
</body>
</html>
