<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@ page import="com.datapro.constants.EibsFields"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>Participantes de Pool Asociados a Proyecto</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Studio">

<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/jquery/plugins/contextMenu/css/jquery.contextMenu.css" rel="stylesheet" type="text/css" />

<SCRIPT SRC="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<SCRIPT	SRC="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>


<jsp:useBean id= "msgPCA10" class= "datapro.eibs.beans.EPC001001Message"  scope="session" />
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
%>

<h3 align="center">Participantes de Pool Asociados a Proyecto - Adición<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="pc_new_sch.jsp, EPC0010"></h3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEPC0010" id="form1">
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="2">
  <INPUT TYPE=HIDDEN NAME="OPT" VALUE="1">
  <INPUT TYPE=HIDDEN NAME="E01DLSSEQ" VALUE="99">            
  <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
          <tr id="trdark"> 
            <td nowrap width="35%" > 
              <div align="right"><b>Número de Proyecto : </b></div>
            </td>
            <td nowrap width="15%" > 
              <div align="left"> 
                <input type="text" name="E01PCDACC" size="12" maxlength="12" value="<%= userPO.getIdentifier().trim()%>" readonly>
              </div>
            </td>
            <td nowrap width="5%" > 
              <div align="right"><b>Cliente : </b></div>
            </td>
            <td nowrap width="45%" > 
              <div align="left"> 
                <input type="text" name="E01PCDCUN" size="11" maxlength="9" value="<%= userPO.getCusNum().trim()%>" readonly>
                <input type="text" name="D01PCDCUN" size="48" maxlength="45" value="<%= userPO.getCusName().trim()%>" readonly>
              </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <h4>Informaci&oacute;n Básica</h4>
  
  <%int row = 0; %>
  <table class="tableinfo">
    <tr > 
      <td> 
        <table cellspacing=0 cellpadding=1 width="100%" border="0" id="INFOCHG">

          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td width="40%"> 
              <div align="right">Número de Participante :</div>
            </td>
            <td width="60%"> 
              <input type="text" name="E01PCPNUM" id="E01PCPNUM" size="5" maxlength="3" value="<%= msgPCA10.getE01PCPNUM().trim()%>">
              <a href="javascript:GetTypeBroker('E01PCPNUM','P')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="ayuda" align="middle" border="0"></a> 
              <img src="<%=request.getContextPath()%>/images/Check.gif" title="mandatory field" align="bottom" border="0" > 
            </td>
          </tr>

          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td width="40%"> 
              <div align="right">Nombre/Razón Social :</div>
            </td>
            <td width="60%"> 
              <input type="text" readonly name="E01PCPNM1" size="37" maxlength="35" value="<%= msgPCA10.getE01PCPNM1().trim()%>">
            </td>
          </tr>

          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td width="40%"> 
              <div align="right">Dirección :</div>
            </td>
            <td width="60%"> 
              <input type="text" readonly name="E01PCPNM2" size="37" maxlength="35" value="<%= msgPCA10.getE01PCPNM2().trim()%>">
            </td>
          </tr>

          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td width="40%"> 
              <div align="right"> </div>
            </td>
            <td width="60%"> 
              <input type="text" readonly name="E01PCPNM3" size="37" maxlength="35" value="<%= msgPCA10.getE01PCPNM3().trim()%>">
            </td>
          </tr>

          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td width="40%"> 
              <div align="right"> </div>
            </td>
            <td width="60%"> 
              <input type="text" readonly name="E01PCPNM4" size="37" maxlength="35" value="<%= msgPCA10.getE01PCPNM4().trim()%>">
            </td>
          </tr>


          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td NOWRAP width="40%"> 
              <div align="right">Participación (%) :</div>
            </td>
            <td NOWRAP width="60%"> 
              <input type="text" name="E01PCPPPR" size="19" maxlength="18" value="<%= msgPCA10.getE01PCPPPR().trim()%>" onkeypress="enterDecimal()">
              <img src="<%=request.getContextPath()%>/images/Check.gif" title="mandatory field" align="bottom" border="0" > 
            </td>
          </tr>

          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td NOWRAP width="10%"> 
              <div align="right">ó Valor :</div>
            </td>
            <td NOWRAP width="40%"> 
              <input type="text" name="E01PCPVPR" size="17" maxlength="15" value="<%= msgPCA10.getE01PCPVPR().trim()%>" onkeypress="enterDecimal()">
              <img src="<%=request.getContextPath()%>/images/Check.gif" title="mandatory field" align="bottom" border="0" > 
            </td>

          </tr>

          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td width="40%"> 
              <div align="right">Comisión Flat :</div>
            </td>
            <td width="60%"> 
              <input type="text" name="E01PCPFLT" size="19" maxlength="18" value="<%= msgPCA10.getE01PCPFLT().trim()%>" onkeypress="enterDecimal()">
            </td>
          </tr>

          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td NOWRAP width="40%"> 
              <div align="right">Fecha de Registro :</div>
            </td>
            <td NOWRAP width="60%"> 
            	<eibsinput:date name="msgPCA10" fn_month="E01PCPOPM" fn_day="E01PCPOPD" fn_year="E01PCPOPY" required="true" />
            </td>
          </tr>


          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td width="40%"> 
              <div align="right">Entidad Líder :</div>
            </td>
            <td width="60%"> 
              <select name="E01PCPLEA">
                <option value="Y" <% if (msgPCA10.getE01PCPLEA().equals("Y")) out.print("selected"); %>>Sí</option>
                <option value="N" <% if (msgPCA10.getE01PCPLEA().equals("N")) out.print("selected"); %>>No</option>
                <option value="C" <% if (msgPCA10.getE01PCPLEA().equals("C")) out.print("selected"); %>>Control</option>
              </select>
              <img src="<%=request.getContextPath()%>/images/Check.gif" title="mandatory field" align="bottom" border="0" > 
            </td>
          </tr>



        </table>                       
      </td>
    </tr>
  </table>


<table cellspacing=2 cellpadding=2 width="100%" border="0" class="tableinfo">
	<tr id="trdark">
		<td nowrap></td>
		<td nowrap align="CENTER" ><b>Banco</b></td>
		<td nowrap align="CENTER"><b>Suc.</b></td>
		<td nowrap align="CENTER" ><b>Mda.</b></td>
		<td nowrap align="CENTER" ><b>C.Contable</b></td>
		<td nowrap align="CENTER"><b>Referencia</b></td>
	</tr>
	<tr>
		<td id="trclear">
		<div align="right">Contrapartida :</div>
		</td>
		<td nowrap><input type="text" name="E01PCPOFB" id="E01PCPOFB" size="2"
			maxlength="2" value="<%= msgPCA10.getE01PCPOFB().trim()%>"></td>
		<td nowrap><input type="text" name="E01PCPOFR" size="4"
			maxlength="4" value="<%= msgPCA10.getE01PCPOFR().trim()%>"
			class="context-menu-help" onmousedown="init(branchHelp,this.name,document.getElementById('E01PCPOFB').value,'','','','')">
		</td>
		<td nowrap ><input type="text" name="E01PCPOFC" id="E01PCPOFC" size="3"
			maxlength="3" value="<%= msgPCA10.getE01PCPOFC().trim()%>"
			class="context-menu-help" onmousedown="init(currencyHelp,this.name,document.getElementById('E01PCPOFB').value,'','','','')">
		</td>
		<td nowrap ><input type="text" name="E01PCPOFG" size="17"
			maxlength="16" value="<%= msgPCA10.getE01PCPOFG().trim()%>"
			class="context-menu-help" onmousedown="init(ledgerHelp,this.name,document.getElementById('E01PCPOFB').value,document.getElementById('E01PCPOFC').value,'','','')">
		</td>
		<td nowrap><input type="text" name="E01PCPOFA" size="13"
			maxlength="12" value="<%= msgPCA10.getE01PCPOFA().trim()%>"
			class="context-menu-help" onmousedown="init(accountHelp,this.name,document.getElementById('E01PCPOFB').value,'','','','RT')">
		</td>
	</tr>
</table>

<script type="text/javascript">
	document.getElementById("E01PCPNUM").focus();
	document.getElementById("E01PCPNUM").select();
</script>
  
  
  
  
  <p>
  <div align="center"> 
    <input id="EIBSBTN" type=submit name="Submit" value="Enviar">
  </div>
</form>
</body>
</html>
