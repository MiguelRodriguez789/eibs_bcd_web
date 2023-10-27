<%@ page import = "datapro.eibs.beans.EPC017001Message" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>Calculo de Factores Proyecto de Constructor</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Studio">


<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>

<jsp:useBean id= "extList" class= "datapro.eibs.beans.JBObjList"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>

</head>

<body >



<% 
 if ( !error.getERRNUM().equals("0")  ) {
     error.setERRNUM("0"); 
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
 }
 	int row;
	try {
		row = Integer.parseInt(request.getParameter("ROW"));
	} 
	catch (Exception e) {
		row = 0;
	}
	extList.setCurrentRow(row);
	EPC017001Message msgPC = (EPC017001Message) extList.getRecord();
%>



<h3 align="center">Cálculo de Valuacion<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="pc_inq_sch.jsp, EPC0170"></h3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEPC0170" id="form1">
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="4">
  <INPUT TYPE=HIDDEN NAME="OPT" VALUE="2">
<%--  <INPUT TYPE=HIDDEN NAME="ROW" VALUE="<%=row%>">  --%>
  <INPUT TYPE=HIDDEN NAME="E01DLSSEQ" VALUE="99">            
  <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
          <tr id="trdark"> 
            <td nowrap width="20%" > 
              <div align="right"><b>Número de Proyecto : </b></div>
            </td>
            <td nowrap width="30%" > 
              <div align="left"> 
                <input type="text" name="E01ACCNUM" size="13" maxlength="12" value="<%= userPO.getIdentifier().trim()%>" readonly>
              </div>
            </td>
            <td nowrap width="20%" > 
              <div align="right"><b>Cliente : </b></div>
            </td>
            <td nowrap width="5%" > 
              <div align="left"> 
                <input type="text" name="E01DLLCUN" size="11" maxlength="9" value="<%= userPO.getCusNum().trim()%>" readonly>
              </div>
            </td>
            <td nowrap width="25%" > 
              <div align="left"> 
                <input type="text" name="D01PCDCUN" size="48" maxlength="45" value="<%= userPO.getCusName().trim()%>" readonly>
              </div>
            </td>

          </tr>
        </table>
      </td>
    </tr>
  </table>




<table class="tbenter">
<tr>
  <TD>   
   <b>Calculo de Valuación</b>
  </TD>
  </tr>
</table>
<table class="tbenter" cellpadding=3>
<tr>
 <TD valign=top>
  <h4>Valores</h4>
  <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing=0 cellpadding=2 width="100%" border="0">
          <tr id="trdark"> 
            <td nowrap width="40%"> 
              <div align="right">Obra Ejecutada :</div>
            </td>
            <td nowrap width="60%"> 
              <input type="text" readonly name="E01PCVOEJ" size="16" maxlength="15" value="<%= msgPC.getE01PCVOEJ().trim()%>" onKeypress="enterDecimal()">
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="40%"> 
              <div align="right">Periodo de Valuación :</div>
            </td>
            <td nowrap width="60%"> 
              <input type="text" readonly name="E01PCVVFM" size="3" maxlength="2" value="<%= msgPC.getE01PCVVFM().trim()%>" onkeypress="enterInteger(event)">
              <input type="text" readonly name="E01PCVVFD" size="3" maxlength="2" value="<%= msgPC.getE01PCVVFD().trim()%>" onkeypress="enterInteger(event)">
              <input type="text" readonly name="E01PCVVFY" size="5" maxlength="4" value="<%= msgPC.getE01PCVVFY().trim()%>" onkeypress="enterInteger(event)">
              Hasta 
              <input type="text" readonly name="E01PCVVTM" size="3" maxlength="2" value="<%= msgPC.getE01PCVVTM().trim()%>" onkeypress="enterInteger(event)">
              <input type="text" readonly name="E01PCVVTD" size="3" maxlength="2" value="<%= msgPC.getE01PCVVTD().trim()%>" onkeypress="enterInteger(event)">
              <input type="text" readonly name="E01PCVVTY" size="5" maxlength="4" value="<%= msgPC.getE01PCVVTY().trim()%>" onkeypress="enterInteger(event)">

            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="40%"> 
              <div align="right">Contrapartida :</div>
            </td>
            <td nowrap width="60%"> 
              <input type="text" readonly name="E01PCVOBK" size="3" maxlength="2" value="<%= msgPC.getE01PCVOBK().trim()%>">
              <input type="text" readonly name="E01PCVOBR" size="5" maxlength="4" value="<%= msgPC.getE01PCVOBR().trim()%>" onKeypress="enterDecimal()">
              <input type="text" readonly name="E01PCVOCY" size="4" maxlength="3" value="<%= msgPC.getE01PCVOCY().trim()%>">
              <input type="text" readonly name="E01PCVOGL" size="17" maxlength="16" value="<%= msgPC.getE01PCVOGL().trim()%>" onKeypress="enterDecimal()">
              <input type="text" readonly name="E01PCVOAC" size="13" maxlength="12" value="<%= msgPC.getE01PCVOAC().trim()%>" onKeypress="enterDecimal()">
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="40%"> 
              <div align="right">Inversión Previa :</div>
            </td>
            <td nowrap width="60%"> 
              <input type="text" readonly name="E01PCVIPR" size="16" maxlength="15" value="<%= msgPC.getE01PCVIPR().trim()%>" onKeypress="enterDecimal()">
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="40%"> 
              <div align="right">Valuación :</div>
            </td>
            <td nowrap width="60%"> 
              <input type="text" readonly name="E01PCVVAL" size="16" maxlength="15" value="<%= msgPC.getE01PCVVAL().trim()%>" onKeypress="enterDecimal()">
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="40%"> 
              <div align="right">Retención Fiel Cumplimiento :</div>
            </td>
            <td nowrap width="60%"> 
              <input type="text" readonly name="E01PCVRFC" size="16" maxlength="15" value="<%= msgPC.getE01PCVRFC().trim()%>" onKeypress="enterDecimal()">
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="40%"> 
              <div align="right">Deducciones :</div>
            </td>
            <td nowrap width="60%"> 
              <input type="text" readonly name="E01PCVDED" size="16" maxlength="15" value="<%= msgPC.getE01PCVDED().trim()%>" onKeypress="enterDecimal()">
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="40%"> 
              <div align="right">Amortización Anticipo :</div>
            </td>
            <td nowrap width="60%"> 
             <input type="text" readonly name="E01PCVAAN" size="16" maxlength="15" value="<%= msgPC.getE01PCVAAN().trim()%>" onKeypress="enterDecimal()">
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="40%"> 
              <div align="right">Intereses Saldo Anticipo :</div>
            </td>
            <td nowrap width="60%"> 
              <input type="text" readonly name="E01PCVISA" size="16" maxlength="15" value="<%= msgPC.getE01PCVISA().trim()%>" onKeypress="enterDecimal()">
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="40%"> 
              <div align="right">Honorarios Inspección :</div>
            </td>
            <td nowrap width="60%"> 
              <input type="text" readonly name="E01PCVHIN" size="16" maxlength="15" value="<%= msgPC.getE01PCVHIN().trim()%>" onKeypress="enterDecimal()">
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="40%"> 
              <div align="right">Asignación Básica Mensual :</div>
            </td>
            <td nowrap width="60%"> 
              <input type="text" readonly name="E01PCVABM" size="16" maxlength="15" value="<%= msgPC.getE01PCVABM().trim()%>" onKeypress="enterDecimal()">
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="40%"> 
              <div align="right">Comisión Flat Valuación :</div>
            </td>
            <td nowrap width="60%"> 
              <input type="text" readonly name="E01PCVCFV" size="16" maxlength="15" value="<%= msgPC.getE01PCVCFV().trim()%>" onKeypress="enterDecimal()">
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="40%"> 
              <div align="right">Intereses Saldo Valuación :</div>
            </td>
            <td nowrap width="60%"> 
              <input type="text" readonly name="E01PCVISV" size="16" maxlength="15" value="<%= msgPC.getE01PCVISV().trim()%>" onKeypress="enterDecimal()">
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="40%"> 
              <div align="right">Retención Prima Fondo Garantía :</div>
            </td>
            <td nowrap width="60%"> 
              <input type="text" readonly name="E01PCVRPG" size="16" maxlength="15" value="<%= msgPC.getE01PCVRPG().trim()%>" onKeypress="enterDecimal()">
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="40%"> 
              <div align="right">Importe Neto a Cobrar :</div>
            </td>
            <td nowrap width="60%"> 
              <input type="text" readonly name="E01PCVINC" size="16" maxlength="15" value="<%= msgPC.getE01PCVINC().trim()%>" onKeypress="enterDecimal()">
            </td>
          </tr>



        </table>
       </td>
      </tr>
    </table>
  </TD>
</table>
 

  <p>
</form>
</body>
</html>
