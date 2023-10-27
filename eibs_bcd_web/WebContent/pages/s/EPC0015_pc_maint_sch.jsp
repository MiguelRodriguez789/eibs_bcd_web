<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@ page import="com.datapro.constants.EibsFields"%>
<%@ page import = "datapro.eibs.beans.EPC001501Message" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>Inspectores Asociados a Proyecto</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Studio">

<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/jquery/plugins/contextMenu/css/jquery.contextMenu.css" rel="stylesheet" type="text/css" />

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.js"> </SCRIPT>
<SCRIPT SRC="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<SCRIPT SRC="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>


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
	EPC001501Message msgPCB = (EPC001501Message) extList.getRecord();
%>


<h3 align="center">Inspectores Asociados a Proyecto - Modificaci�n<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="pc_maint_sch.jsp, EPC0015"></h3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEPC0015" id="form1">
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="2">
  <INPUT TYPE=HIDDEN NAME="OPT" VALUE="2">
  <INPUT TYPE=HIDDEN NAME="ROW" VALUE="<%=row%>">  
  <INPUT TYPE=HIDDEN NAME="E01DLSSEQ" VALUE="99">            
  <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
          <tr id="trdark"> 
            <td nowrap width="20%" > 
              <div align="right"><b>N�mero de Proyecto : </b></div>
            </td>
            <td nowrap width="30%" > 
              <div align="left"> 
                <input type="text" name="E01PCDACC" size="12" maxlength="12" value="<%= userPO.getIdentifier().trim()%>" readonly>
              </div>
            </td>
            <td nowrap width="20%" > 
              <div align="right"><b>Cliente : </b></div>
            </td>
            <td nowrap width="5%" > 
              <div align="left"> 
                <input type="text" name="E01PCDCUN" size="11" maxlength="9" value="<%= userPO.getCusNum().trim()%>" readonly>
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

  <h4>Informaci&oacute;n B�sica</h4>
  <table class="tableinfo">
    <tr > 
      <td> 
        <table cellspacing=0 cellpadding=1 width="100%" border="0" id="INFOCHG">

          <tr id="trdark"> 
            <td width="30%"> 
              <div align="right">N�mero de Participante :</div>
            </td>
            <td width="70%"> 
              <input type="text" readonly name="E01PCPNUM" size="5" maxlength="3" value="<%= msgPCB.getE01PCPNUM().trim()%>">
            </td>
          </tr>

          <tr id="trclear"> 
            <td width="30%"> 
              <div align="right">Nombre/Raz�n Social :</div>
            </td>
            <td width="70%"> 
              <input type="text" readonly name="E01PCPNM1" size="37" maxlength="35" value="<%= msgPCB.getE01PCPNM1().trim()%>">
            </td>
          </tr>

          <tr id="trdark"> 
            <td width="30%"> 
              <div align="right">Direcci�n :</div>
            </td>
            <td width="70%"> 
              <input type="text" readonly name="E01PCPNM2" size="37" maxlength="35" value="<%= msgPCB.getE01PCPNM2().trim()%>">
            </td>
          </tr>

          <tr id="trclear"> 
            <td width="30%"> 
              <div align="right"> </div>
            </td>
            <td width="70%"> 
              <input type="text" readonly name="E01PCPNM3" size="37" maxlength="35" value="<%= msgPCB.getE01PCPNM3().trim()%>">
            </td>
          </tr>

          <tr id="trdark"> 
            <td width="30%"> 
              <div align="right"> </div>
            </td>
            <td width="70%"> 
              <input type="text" readonly name="E01PCPNM4" size="37" maxlength="35" value="<%= msgPCB.getE01PCPNM4().trim()%>">
            </td>
          </tr>


          <tr id="trclear"> 
            <td NOWRAP width="30%"> 
              <div align="right">Fecha de Registro :</div>
            </td>
            <td NOWRAP width="70%"> 
            	<eibsinput:date name="msgPCB" fn_month="E01PCPOPM" fn_day="E01PCPOPD" fn_year="E01PCPOPY" required="true"/>
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
		<td nowrap id="trdark">
		<div align="right">Contrapartida :</div>
		</td>
		<td nowrap><input type="text" name="E01PCPOFB" id="E01PCPOFB" size="2"
			maxlength="2" value="<%= msgPCB.getE01PCPOFB().trim()%>"></td>
		<td nowrap><input type="text" name="E01PCPOFR" size="4"
			maxlength="4" value="<%= msgPCB.getE01PCPOFR().trim()%>"
			class="context-menu-help" onmousedown="init(branchHelp,this.name,document.getElementById('E01PCPOFB').value,'','','','')">
		</td>
		<td nowrap ><input type="text" name="E01PCPOFC" id="E01PCPOFC" size="3"
			maxlength="3" value="<%= msgPCB.getE01PCPOFC().trim()%>"
			class="context-menu-help" onmousedown="init(currencyHelp,this.name,document.getElementById('E01PCPOFB').value,'','','','')">
		</td>
		<td nowrap ><input type="text" name="E01PCPOFG" size="17"
			maxlength="16" value="<%= msgPCB.getE01PCPOFG().trim()%>"
			class="context-menu-help" onmousedown="init(ledgerHelp,this.name,document.getElementById('E01PCPOFB').value,document.getElementById('E01PCPOFC').value,'','','')">
		</td>
		<td nowrap><input type="text" name="E01PCPOFA" size="13"
			maxlength="12" value="<%= msgPCB.getE01PCPOFA().trim()%>"
			class="context-menu-help" onmousedown="init(accountHelp,this.name,document.getElementById('E01PCPOFB').value,'','','','RT')">
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
