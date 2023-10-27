<%@ page import = "datapro.eibs.beans.EPC030001Message" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>Mantenimiento Presupuesto/Ejecución de Obra</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Studio">


<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.js"> </SCRIPT>

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
	EPC030001Message msgPCC = (EPC030001Message) extList.getRecord();
%>

<SCRIPT type="text/javascript">

 builtHPopUp();

 function showPopUp(opth,field,bank,ccy,field1,field2,opcod) {
   init(opth,field,bank,ccy,field1,field2,opcod);
   showPopupHelp();
 }
 
</SCRIPT>

<h3 align="center">Mantenimiento Presupuesto de Obra - Ejecución<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="pc_budget_sch.jsp, EPC0300"></h3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEPC0300" id="form1">
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="2">
  <INPUT TYPE=HIDDEN NAME="OPT" VALUE="5">
  <INPUT TYPE=HIDDEN NAME="ROW" VALUE="<%=row%>">  
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
                <input type="text" name="E01PCBACC" size="12" maxlength="12" value="<%= userPO.getIdentifier().trim()%>" readonly>
              </div>
            </td>
            <td nowrap width="20%" > 
              <div align="right"><b>Cliente : </b></div>
            </td>
            <td nowrap width="5%" > 
              <div align="left"> 
                <input type="text" name="E01PCBCUN" size="11" maxlength="9" value="<%= userPO.getCusNum().trim()%>" readonly>
              </div>
            </td>
            <td nowrap width="25%" > 
              <div align="left"> 
                <input type="text" name="D01PCMCUN" size="48" maxlength="45" value="<%= userPO.getCusName().trim()%>" readonly>
              </div>
            </td>

          </tr>
        </table>
      </td>
    </tr>
  </table>
  <h4>Informaci&oacute;n Básica</h4>
  <table class="tableinfo">
    <tr > 
      <td> 
        <table cellspacing=0 cellpadding=2 width="100%" border="0" id="INFOCHG">


          <tr id="trdark"> 
            <td width="30%"> 
              <div align="right">Código de Presupuesto :</div>
            </td>
            <td width="70%"> 
              <input type="text" readonly name="E01PCBRCD" size="5" maxlength="4" value="<%= msgPCC.getE01PCBRCD().trim()%>">
            </td>
          </tr>

          <tr id="trclear"> 
            <td width="30%"> 
              <div align="right">Valor de Presupuesto :</div>
            </td>
            <td width="70%"> 
              <input type="text" readonly name="E01PCBAMT" size="17" maxlength="15" value="<%= msgPCC.getE01PCBAMT().trim()%>" onkeypress="enterDecimal()">
            </td>
          </tr>


          <tr id="trdark"> 
            <td width="30%"> 
              <div align="right">Valor Obra Ejecutada :</div>
            </td>
            <td width="70%"> 
              <input type="text" name="E01PCBXAM" size="17" maxlength="15" value="<%= msgPCC.getE01PCBXAM().trim()%>" onkeypress="enterDecimal()">
            </td>
          </tr>


          <tr id="trclear"> 
            <td width="30%"> 
              <div align="right">ó Porcentaje :</div>
            </td>
            <td width="70%"> 
              <input type="text" name="E01PCBXPR" size="19" maxlength="18" value="<%= msgPCC.getE01PCBXPR().trim()%>" onkeypress="enterDecimal()">
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
