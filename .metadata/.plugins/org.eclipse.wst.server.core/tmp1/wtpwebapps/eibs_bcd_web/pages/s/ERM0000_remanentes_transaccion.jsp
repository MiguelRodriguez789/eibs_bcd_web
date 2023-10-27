<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput"%>
<%@page import="com.datapro.constants.EibsFields"%>
<%@page import="com.datapro.eibs.constants.HelpTypes"%>
<%@page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="com.datapro.constants.Entities"%> 
<%@ page import = "datapro.eibs.master.Util" %>

<html>
<head>
<title>Remanentes</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/jquery/plugins/contextMenu/css/jquery.contextMenu.css" rel="stylesheet" type="text/css" />

<jsp:useBean id= "transaction" class= "datapro.eibs.beans.ERM000003Message"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>


<script type="text/javascript">

<%
	// Determina si es solo lectura
	boolean readOnly=false;
	if (request.getParameter("readOnly") != null ){
		if (request.getParameter("readOnly").toLowerCase().equals("true")){
			readOnly=true;
		} else {
			readOnly=false;
		}
	}
%>

 function UpdateField(bfield,trfield,afield,sfield,rep){
   var trval;
   var bfval;
   var afval=0.00;
    try{
     trval= parseFloat((document.forms[0][trfield].value));
     if (isNaN(trval)) trval=0.00;}
    catch(e){
     trval=0.00;
    }
    try{
     if (rep) bfval=parseFloat((document.forms[0][afield].value));
     else bfval=parseFloat((document.forms[0][bfield].value));}
    catch(e){
     bfval=0.00;
    }
    if (document.forms[0][sfield][0].checked) afval=bfval+trval;
    else if (document.forms[0][sfield][1].checked) afval=bfval-trval;
    else afval=bfval;
    document.forms[0][afield].value = formatCCY(afval);
  } 

 function Recalculate(){
    UpdateField('E03BEFAMT','E03TRNAMT','E03AFTAMT','E03TRNFLG',false);
 }
 
 function changeField(radio){
   var numval;
   var total;
   var newval; 
    if (!document.forms[0][radio][0].checked && !document.forms[0][radio][1].checked) {
      return;
    }
    Recalculate();
  }
  
  function verifyNum(elem){
   if (trim(elem.value)=="") elem.value="0.00";
  }
  
</SCRIPT>

</head>

<body>
<% 
 if ( !error.getERRNUM().equals("0")  ) {
    error.setERRNUM("0");
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
 }
%>

<h3 align="center">Transacciones de Remanentes<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="remanente_transaccion.jsp, ERM0000"></h3>
<hr size="4">
<form  method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSERM0000">
  <INPUT type="hidden" name="SCREEN" id="SCREEN" value="800">
  <INPUT TYPE=HIDDEN name="E03RMMBNK" id="E03RMMBNK" VALUE="<%= transaction.getE03RMMBNK().trim()%>">
  <input type=HIDDEN name="E03RMMACD" id="E03RMMACD" value="<%= transaction.getE03RMMACD().trim()%>">
  <input type=HIDDEN name="E03RMMBRN" id="E03RMMBRN" value="<%= transaction.getE03RMMBRN().trim()%>">
  <input type=HIDDEN name="E03RMMCUS" id="E03RMMCUS" value="<%= transaction.getE03RMMCUN().trim()%>">

 <% int row = 0;%>

  <table class="tableinfo">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
          <tr id="trdark"> 
            <td nowrap width="16%" > 
              <div align="right"><b>Cliente :</b></div>
            </td>
            <td nowrap width="20%" > 
              <div align="left">
				<eibsinput:text name="transaction" property="E03RMMCUN"  eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CUSTOMER %>" readonly="true" />
              </div>
            </td>
            <td nowrap width="16%" > 
              <div align="right"><b>Nombre :</b> </div>
            </td>
            <td nowrap colspan="3" > 
              <div align="left"><font face="Arial"><font face="Arial"><font size="2">
	  			<eibsinput:text name="transaction" property="E03CUSNA1" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_NAME_FULL %>" readonly="true"/>
                </font></font></font></div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="16%"> 
              <div align="right"><b>Certificado :</b></div>
            </td>
            <td nowrap width="20%"> 
              <div align="left">
      			<eibsinput:text name="transaction" property="E03RMMACC" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_ACCOUNT %>" readonly="true"/>
              </div>
            </td>
            <td nowrap width="16%"> 
              <div align="right"><b>Moneda : </b></div>
            </td>
            <td nowrap width="16%"> 
              <div align="left"><b> 
	  			<eibsinput:text name="transaction" property="E03RMMCCY" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CURRENCY %>" readonly="true"/>
                </b> </div>
            </td>
            <td nowrap width="16%"> 
              <div align="right"><b>Producto : </b></div>
            </td>
            <td nowrap width="16%"> 
              <div align="left"><b>
	  			<eibsinput:text name="transaction" property="E03RMMPRO" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CNOFC %>" readonly="true"/>
                </b> </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <h4>Saldos</h4>
  <TABLE class="tableinfo">
     <TBODY>
        <TR> 
      <TD nowrap> 
        <TABLE cellspacing="2" cellpadding="2" width="100%" border="0">
          <TBODY>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <TD nowrap width="20%" > 
              <DIV align="center"></DIV>
            </TD>
            <TD nowrap width="40%" > 
              <DIV align="center"><B>Antes </B></DIV>
            </TD>
            <TD nowrap width="40%" > 
              <DIV align="center"><B>Despues </B></DIV>
            </TD>
          </TR>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <TD nowrap > 
              <DIV align="right">Saldo :</DIV>
            </TD>
            <TD nowrap align="center">
 		        <eibsinput:text name="transaction" property="E03BEFAMT" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/>
	        </TD>
            <TD nowrap align="center"> 
 		        <eibsinput:text name="transaction" property="E03AFTAMT" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/>
            </TD>
          </TR>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
          	<TD nowrap colspan="3"> 
              <DIV align="center">Fecha de Ultimo C&aacute;lculo : 
    	        <eibsinput:date name="transaction" fn_year="E03RMMLTY" fn_month="E03RMMLTM" fn_day="E03RMMLTD" readonly="true"/>
			  </DIV>
            </TD>
           </TR>
        	</TBODY>
            </TABLE>
      	</TD>
    </TR>
  </TBODY>
</TABLE>
  
  <h4>Datos de la Transacci&oacute;n</h4>
  <table class="tableinfo">
    <tr bordercolor="#FFFFFF"> 
      <td> 
        <table cellspacing=0 cellpadding=2 width="100%" border="0">
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td width="40%"> 
              <div align="right">Principal :</div>
            </td>
            <td width="60%"> 
 		        <eibsinput:text name="transaction" property="E03TRNAMT" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="<%=readOnly%>"/>
              <input type="radio" name="E03TRNFLG" id="E03TRNFLG" value="0" <%=readOnly?"disabled":""%> onClick="Recalculate();"
              <%if(transaction.getE03TRNFLG().equals("0")) out.print("checked");%>>
              Aumento 
              <input type="radio" name="E03TRNFLG" id="E03TRNFLG" value="5"  <%=readOnly?"disabled":""%> onClick="Recalculate();"
              <%if(transaction.getE03TRNFLG().equals("5")) out.print("checked");%>> Disminuci&oacute;n</td>
          </tr>

          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td width="40%"> 
              <div align="right">Fecha Valor :</div>
            </td>
            <td width="60%"> 
    	        <eibsinput:date name="transaction" fn_year="E03TRNVDY" fn_month="E03TRNVDM" fn_day="E03TRNVDD" readonly="<%=readOnly%>"/>
            </td>
          </tr> 

          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td width="40%"> 
              <div align="right">Descripci&oacute;n :</div>
            </td>
            <td width="60%"> 
	  			<eibsinput:text name="transaction" property="E03RMMNR1" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_NARRATIVE %>" readonly="<%=readOnly%>"/>
            </td>
          </tr> 

        </table>

        <table cellspacing=0 cellpadding=2 width="100%" border="0">
          <tr>
            <td align="center">&nbsp;</td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td align="center"> <b>Forma de Pago</b> </td>
          </tr>
        </table>
        <table class="tableinfo" style="filter:''" >
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td  nowrap> 
              <div align="center">Concepto</div>
            </td>
            <td nowrap> 
              <div align="center">Banco</div>
            </td>
            <td nowrap> 
              <div align="center">Sucursal</div>
            </td>
            <td nowrap> 
              <div align="center">Moneda</div>
            </td>
            <td nowrap> 
              <div align="center">Referencia</div>
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td  nowrap> 
              <div align="center" >
                <input type="text" name="E03TRNOPC" id="E03TRNOPC" value="<%= transaction.getE03TRNOPC().trim()%>" size="3" maxlength="3" <%=readOnly?"readonly":""%>>
                <input type="hidden" name="E03TRNGLN" id="E03TRNGLN" value="<%= transaction.getE03TRNGLN().trim()%>">
                <input type="text" name="E03TRNCON" id="E03TRNCON" size="35" maxlength="35" readonly value="<%= transaction.getE03TRNCON().trim()%>"
                  class="context-menu-help"
                  onmousedown="init(conceptHelp,this.name,'','','E03TRNGLN','E03TRNOPC','<%= transaction.getE03RMMACD().trim()%>')">
              </div>
            </td>
            <td  nowrap> 
              <div align="center"> 
                <input type="text" name="E03TRNBNK" id="E03TRNBNK" size="2" maxlength="2" value="<%= transaction.getE03TRNBNK().trim()%>" <%=readOnly?"readonly":""%>>
              </div>
            </td>
            <td nowrap> 
              <div align="center"> 
                <input type="text" name="E03TRNBRN" id="E03TRNBRN" size="4" maxlength="4" value="<%= transaction.getE03TRNBRN().trim()%>" <%=readOnly?"readonly":""%>
                  class="context-menu-help"
                  onmousedown="init(branchHelp,this.name,getElement('E03RMMBNK').value,'','','','')">
              </div>
            </td>
            <td nowrap > 
              <div align="center">
                <input type="text" name="E03TRNCCY" id="E03TRNCCY" size="3" maxlength="3" value="<%= transaction.getE03TRNCCY().trim()%>" <%=readOnly?"readonly":""%>
                  class="context-menu-help"
                  onmousedown="init(currencyHelp,this.name,getElement('E03RMMBNK').value,'','','','')">
              </div>
            </td>
            <td nowrap > 
              <div align="center"> 
                <input type="text" name="E03TRNACC" id="E03TRNACC" size="16" maxlength="13" value="<%= transaction.getE03TRNACC().trim()%>" <%=readOnly?"readonly":""%>
                  class="context-menu-help"
                  onmousedown="init(accountCustomerHelp,this.name,document.getElementById('E03TRNBNK').value,'',document.getElementById('E03RMMCUS').value,'','RT')">
               </div>
            </td>
          </tr>
        </table>
        
      </td>
    </tr>
  </table>
  <SCRIPT type="text/javascript">
      Recalculate();
  </SCRIPT>
  <p align="center"> 
    <input id="EIBSBTN" type=submit name="Submit" value="Enviar">
  </p>
</form>
</body>
</html>
