<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@page import="com.datapro.eibs.constants.ISOCodes"%>
<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@page import="com.datapro.constants.EibsFields"%>

<html>
<head>
<title>Ajuste de Documentos</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<%@ page import = "datapro.eibs.master.Util" %>

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>

<jsp:useBean id= "lnAdjustment" class= "datapro.eibs.beans.EDL087601Message"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>

<SCRIPT type="text/javascript">

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
    if (document.forms[0][sfield].value=="0") afval=bfval+trval;
    else if (document.forms[0][sfield].value=="5") afval=bfval-trval;
    else afval=bfval;
    document.forms[0][afield].value = formatCCY(afval);
  } 

 function Recalculate(){
    UpdateField('E01DEAPRI','E01TRNARE','AFTERPRI','E01TRNARF',false);
    UpdateField('E01DEAINT','E01TRNAIN','AFTERINT','E01TRNAIF',false);
    UpdateField('E01DEAMOR','E01TRNAMO','AFTERMOR','E01TRNAMF',false);
    UpdateTotal();
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
  
  function UpdateTotal(){
   
   var total;  
    try{
     total= parseFloat((document.forms[0].AFTERPRI.value));}
    catch(e){
     total=0.00;
    }
    try{
     total=total+parseFloat((document.forms[0].AFTERINT.value));}
    catch(e){
    }
    try{
     total=total+parseFloat((document.forms[0].AFTERMOR.value));}
    catch(e){
    }
   document.forms[0].AFTERTOT.value=formatCCY(total);
   
  }
</SCRIPT>
<SCRIPT type="text/javascript">

   builtNewMenu(ln_t_m_opt);
   initMenu();

</SCRIPT>
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

<SCRIPT type="text/javascript">

builtHPopUp();

function showPopUp(opth,field,bank,ccy,field1,field2,opcod) {
   init(opth,field,bank,ccy,field1,field2,opcod);
   showPopupHelp();
   }
   
</SCRIPT>

<h3 align="center">Ajuste de Documentos<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="ln_adjustment.jsp, EDL0876"></h3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDL0876">
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="6">
   <INPUT TYPE=HIDDEN NAME="E01DLDBNK" VALUE="<%= lnAdjustment.getE01DLDBNK().trim()%>">
  
  <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
          <tr id="trdark"> 
            <td nowrap width="16%" > 
              <div align="right"><b>Cliente :</b></div>
            </td>
            <td nowrap width="20%" > 
              <div align="left"> 
                <input type="text" name="E01CUSCUN" size="10" maxlength="9" value="<%= lnAdjustment.getE01CUSCUN().trim()%>" readonly>
              </div>
            </td>
            <td nowrap width="16%" > 
              <div align="right"><b>Nombre :</b> </div>
            </td>
            <td nowrap colspan="3" > 
              <div align="left"><font face="Arial"><font face="Arial"><font size="2"> 
                <input type="text" name="E01CUSNA1" size="45" maxlength="45" value="<%= lnAdjustment.getE01CUSNA1().trim()%>" readonly>
                </font></font></font></div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="16%"> 
              <div align="right"><b>Cuenta :</b></div>
            </td>
            <td nowrap width="20%"> 
              <div align="left"> 
                <input type="text" name="E01DLDNLN" size="13" maxlength="12" value="<%= lnAdjustment.getE01DLDNLN().trim()%>" readonly>
              </div>
            </td>
            <td nowrap width="16%"> 
              <div align="right"><b>Moneda : </b></div>
            </td>
            <td nowrap width="16%"> 
              <div align="left"><b> 
                <input type="text" name="E01DLDCCY" size="3" maxlength="3" value="<%= lnAdjustment.getE01DLDCCY().trim()%>" readonly>
                </b> </div>
            </td>
            <td nowrap width="16%"> 
              <div align="right"><b>Producto : </b></div>
            </td>
            <td nowrap width="16%"> 
              <div align="left"><b> 
                <input type="text" name="E01DEAPRO" size="4" maxlength="4" value="<%= lnAdjustment.getE01DEAPRO().trim()%>" readonly>
                </b> </div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="16%" > 
              <div align="right"><b>Deudor :</b></div>
            </td>
            <td nowrap width="20%" > 
              <div align="left"> 
                <input type="text" name="E01DLDDID" size="17" maxlength="15" value="<%= lnAdjustment.getE01DLDDID().trim()%>" readonly>
              </div>
            </td>
            <td nowrap width="16%" > 
              <div align="right"><b>Nombre :</b> </div>
            </td>
            <td nowrap colspan="3" > 
              <div align="left"><font face="Arial"><font face="Arial"><font size="2"> 
                <input type="text" name="E01DLDANM" size="45" maxlength="45" value="<%= lnAdjustment.getE01DLDANM().trim()%>" readonly>
                </font></font></font></div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  
  <h4>Informaci&oacute;n Financiera</h4>

<%int row = 0; %>
<TABLE class="tableinfo">
     <TBODY>
        <TR> 
      <TD nowrap> 
        <TABLE cellspacing="2" cellpadding="2" width="100%" border="0">
          <TBODY>
            <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <TD nowrap width="33%" > 
              <DIV align="center"></DIV>
            </TD>
            <TD nowrap width="33%" > 
              <DIV align="center"><B>Antes</B></DIV>
            </TD>
            <TD nowrap width="34%" > 
              <DIV align="center"><B>Después</B></DIV>
            </TD>
          </TR>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <TD nowrap > 
              <DIV align="right">Saldo de Principal :</DIV>
            </TD>
            <TD nowrap align="center"> 
              <INPUT class="txtright" type="text" readonly name="E01DEAPRI" size="15" maxlength="13" value="<%= Util.formatCCY(lnAdjustment.getE01DEAPRI())%>" onkeypress="enterDecimal()">
            </TD>
            <TD nowrap align="center"> 
              <INPUT class="txtright" type="text" readonly name="AFTERPRI" size="15" maxlength="13" value="" onkeypress="enterDecimal()">
            </TD>
          </TR>
          
          <% if(lnAdjustment.getH01FLGWK3().equals("R")){%>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">  
            <TD nowrap > 
              <div align="right">Valor Ajustado :</div>
            </TD>
            <TD nowrap align="center"> 
              <input class="txtright" type="text" name="E01DEAREA" size="15" maxlength="15" value="<%= lnAdjustment.getE01DEAREA().trim()%>" onKeypress="enterDecimal()">
            </TD>
            <TD nowrap align="center"> 
              <INPUT class="txtright" type="text" readonly name="AFTERREA" size="15" maxlength="13" value="" onkeypress="enterDecimal()">
            </TD>
          </TR>
          <%}%>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <TD nowrap> 
              <DIV align="right">Saldo de Inter&eacute;s ::</DIV>
            </TD>
            <TD nowrap align="center"> 
              <INPUT class="txtright" type="text" readonly name="E01DEAINT" size="15" maxlength="13" value="<%= Util.formatCCY(lnAdjustment.getE01DEAINT())%>" onkeypress="enterDecimal()">
            </TD>
            <TD nowrap align="center"> 
              <INPUT class="txtright" type="text" readonly name="AFTERINT" size="15" maxlength="13" value="" onkeypress="enterDecimal()">
            </TD>
          </TR>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">  
            <TD nowrap > 
              <DIV align="right">Cargo por Mora :</DIV>
            </TD>
            <TD nowrap align="center"> 
              <INPUT class="txtright" type="text" readonly name="E01DEAMOR" size="15" maxlength="13" value="<%= Util.formatCCY(lnAdjustment.getE01DEAMOR())%>" onkeypress="enterDecimal()">
            </TD>
            <TD nowrap align="center"> 
              <INPUT class="txtright" type="text" readonly name="AFTERMOR" size="15" maxlength="13" value="" onkeypress="enterDecimal()">
            </TD>
          </TR>
          
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <TD nowrap> 
              <DIV align="right">Total :</DIV>
            </TD>
            <TD nowrap align="center"> 
              <INPUT class="txtright" type="text" readonly name="E01DEATOT" size="15" maxlength="13" value="<%= Util.formatCCY(lnAdjustment.getE01DEATOT())%>" onkeypress="enterDecimal()">
            </TD>
            <TD nowrap align="center"> 
              <INPUT class="txtright" type="text" readonly name="AFTERTOT" size="15" maxlength="13" value="" onkeypress="enterDecimal()">
            </TD>
          </TR>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
          	<TD nowrap colspan="3"> 
              <DIV align="center">Fecha de Ultimo C&aacute;lculo :
				<eibsinput:date name="lnAdjustment" fn_year="E01DEALCY" fn_month="E01DEALCM" fn_day="E01DEALCD" readonly="true"/>
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
    <tr > 
      <td> 
        <table cellspacing=0 cellpadding=2 width="100%" border="0">
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td width="40%"> 
              <div align="right">Ajuste de Reajuste :</div>
            </td>
            <td width="60%"> 
              <input type="text" name="E01TRNARE" size="15" maxlength="15" value="<%= lnAdjustment.getE01TRNARE().trim()%>" onKeypress="enterDecimal()"
              onChange="changeField('CE01TRNARF')" onblur="verifyNum(this)">
              <input type="hidden" name="E01TRNARF" value="<%= lnAdjustment.getE01TRNAIF()%>">
              <input type="radio" name="CE01TRNARF" value="0" 
              onClick="document.forms[0].E01TRNARF.value='0';Recalculate();" 
			  <%if(lnAdjustment.getE01TRNARF().equals("0")) out.print("checked");%>>
              Aumento 
              <input type="radio" name="CE01TRNARF" value="5" 
              onClick="document.forms[0].E01TRNARF.value='5';Recalculate();" 
			  <%if(lnAdjustment.getE01TRNARF().equals("5")) out.print("checked");%>>
              Disminuci&oacute;n </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td width="40%"> 
              <div align="right">Ajuste de Intereses :</div>
            </td>
            <td width="60%"> 
              <input type="text" name="E01TRNAIN" size="15" maxlength="15" value="<%= lnAdjustment.getE01TRNAIN().trim()%>" onKeypress="enterDecimal()"
              onChange="changeField('CE01TRNAIF')" onblur="verifyNum(this)">
              <input type="hidden" name="E01TRNAIF" value="<%= lnAdjustment.getE01TRNAIF()%>">
              <input type="radio" name="CE01TRNAIF" value="0" 
              onClick="document.forms[0].E01TRNAIF.value='0';Recalculate();" 
			  <%if(lnAdjustment.getE01TRNAIF().equals("0")) out.print("checked");%>>
              Aumento 
              <input type="radio" name="CE01TRNAIF" value="5" 
              onClick="document.forms[0].E01TRNAIF.value='5';Recalculate();" 
			  <%if(lnAdjustment.getE01TRNAIF().equals("5")) out.print("checked");%>>
              Disminuci&oacute;n </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">   
            <td width="40%"> 
              <div align="right">Ajuste Mora :</div>
            </td>
            <td width="60%"> 
              <input type="text" name="E01TRNAMO" size="15" maxlength="15" value="<%= lnAdjustment.getE01TRNAMO().trim()%>" onKeypress="enterDecimal()"
              onChange="changeField('CE01TRNAMF')" onblur="verifyNum(this)">
              <input type="hidden" name="E01TRNAMF" value="<%= lnAdjustment.getE01TRNAMF()%>">
              <input type="radio" name="CE01TRNAMF" value="0" 
              onClick="document.forms[0].E01TRNAMF.value='0';Recalculate();" 
			  <%if(lnAdjustment.getE01TRNAMF().equals("0")) out.print("checked");%>>
              Aumento 
              <input type="radio" name="CE01TRNAMF" value="5" 
              onClick="document.forms[0].E01TRNAMF.value='5';Recalculate();" 
			  <%if(lnAdjustment.getE01TRNAMF().equals("5")) out.print("checked");%>>
              Disminuci&oacute;n </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">  
            <td width="40%"> 
              <div align="right">Total :</div>
            </td>
            <td width="60%"> 
              <input type="text" name="E01TRNTOT" size="15" maxlength="15" value="<%= lnAdjustment.getE01TRNTOT().trim()%>" onKeypress="enterDecimal()">
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td width="40%"> 
              <div align="right">Fecha Valor :</div>
            </td>
            <td width="60%"> 
				<eibsinput:date name="lnAdjustment" fn_year="E01TRNVDY" fn_month="E01TRNVDM" fn_day="E01TRNVDD" />
            </td>
          </tr>
           <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">  
            <td width="40%"> 
              <div align="right">Descripci&oacute;n :</div>
            </td>
            <td width="60%"> 
              <input type="text" name="E01TRNNAR" size="60" maxlength="60" value="<%= lnAdjustment.getE01TRNNAR().trim()%>">
            </td>
          </tr>
        </table>
        
      </td>
    </tr>
  </table>
  <SCRIPT type="text/javascript">
      Recalculate();
  </SCRIPT>

	<div align="center"> 
    	<input id="EIBSBTN" type=submit name="Submit" value="Enviar">
  	</div>
  
</form>
</body>
</html>
