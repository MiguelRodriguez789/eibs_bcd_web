<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<%@taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@page import = "datapro.eibs.master.Util" %>
<%@page import="com.datapro.constants.EibsFields"%>
<%@page import="com.datapro.eibs.constants.HelpTypes"%>

<html>
<head>
<title>Transacciones de Certificados</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/jquery/plugins/contextMenu/css/jquery.contextMenu.css" rel="stylesheet" type="text/css" />

<jsp:useBean id= "cdTransac" class= "datapro.eibs.beans.EDL013003Message"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>


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
    if (document.forms[0][sfield][0].checked) afval=bfval+trval;
    else if (document.forms[0][sfield][1].checked) afval=bfval-trval;
    else afval=bfval;
    document.forms[0][afield].value = formatCCY(afval);
  } 

 function Recalculate(){
    UpdateField('E03DEAMEP','E03TRNPRI','AFTERPRI','E03TRNPRF',false);
    <% if(cdTransac.getH03FLGWK3().equals("R")){%>
    UpdateField('E03DEAREA','E03TRNREA','AFTERREA','E03TRNREF',false);
    <% } %>
    UpdateField('E03DEAMEI','E03TRNINT','AFTERINT','E03TRNINF',false);
    UpdateField('E03DEAMEI','E03TRNADJ','AFTERINT','E03TRNADF',true);
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
     total= parseFloat((document.getElementById("AFTERPRI").value));}
    catch(e){
     total=0.00;
    }
    <% if(cdTransac.getH03FLGWK3().equals("R")){%>
    try{
     total=total+parseFloat((document.getElementById("AFTERREA").value));}
    catch(e){
    }
    <% } %>
    try{
     total=total+parseFloat((document.getElementById("AFTERINT").value));}
    catch(e){
    }
    
   document.getElementById("AFTERTOT").value=formatCCY(total);
   
  }
  
  
</SCRIPT>

<SCRIPT type="text/javascript">

   builtNewMenu(cd_t_m_opt);
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

<h3 align="center">Transacciones de Certificados de Dep&oacute;sito<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="cd_transac.jsp, EDL0130"></h3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEXEDL0130">
  <INPUT TYPE=HIDDEN NAME="SCREEN" id="SCREEN" VALUE="6">
   <INPUT TYPE=HIDDEN NAME="E03DEABNK" id="E03DEABNK" VALUE="<%= cdTransac.getE03DEABNK().trim()%>">
  <input type=HIDDEN name="E03DEAACD" id="E03DEAACD" value="<%= cdTransac.getE03DEAACD().trim()%>">
  <input type=HIDDEN name="E03DEABRN" id="E03DEABRN" value="<%= cdTransac.getE03DEABRN().trim()%>">
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
                <input type="text" name="E03DEACUN" size="10" maxlength="9" value="<%= cdTransac.getE03DEACUN().trim()%>" readonly>
              </div>
            </td>
            <td nowrap width="16%" > 
              <div align="right"><b>Nombre :</b> </div>
            </td>
            <td nowrap colspan="3" > 
              <div align="left"><font face="Arial"><font face="Arial"><font size="2">
                <input type="text" name="E03CUSNA1" size="45" maxlength="45" value="<%= cdTransac.getE03CUSNA1().trim()%>" readonly>
                </font></font></font></div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="16%"> 
              <div align="right"><b>Cuenta :</b></div>
            </td>
            <td nowrap width="20%"> 
              <div align="left">
                <input type="text" name="E03DEAACC" size="13" maxlength="12" value="<%= cdTransac.getE03DEAACC().trim()%>" readonly>
              </div>
            </td>
            <td nowrap width="16%"> 
              <div align="right"><b>Moneda : </b></div>
            </td>
            <td nowrap width="16%"> 
              <div align="left"><b> 
                <input type="text" name="E03DEACCY" size="4" maxlength="3" value="<%= cdTransac.getE03DEACCY().trim()%>" readonly>
                </b> </div>
            </td>
            <td nowrap width="16%"> 
              <div align="right"><b>Producto : </b></div>
            </td>
            <td nowrap width="16%"> 
              <div align="left"><b>
                <input type="text" name="E03DEAPRO" size="5" maxlength="4" value="<%= cdTransac.getE03DEAPRO().trim()%>" readonly>
                </b> </div>
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
            <TD nowrap width="20%"> 
              <DIV align="center"></DIV>
            </TD>
            <TD nowrap width="40%"> 
              <DIV align="center"><B>Antes </B></DIV>
            </TD>
            <TD nowrap width="40%"> 
              <DIV align="center"><B>Despues </B></DIV>
            </TD>
          </TR>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <TD nowrap > 
              <DIV align="right">Saldo de Principal :</DIV>
            </TD>
            <TD nowrap align="center">
             <INPUT type="text" name="E03DEAMEP" class="txtright" size="23" maxlength="13" value="<%= Util.formatCCY(cdTransac.getE03DEAMEP())%>" readonly></TD>
            <TD nowrap align="center"> 
              <INPUT type="text" class="txtright" readonly name="AFTERPRI" id="AFTERPRI" size="23" maxlength="13" value="" onkeypress="enterDecimal()">
            </TD>
          </TR>
          <%if(cdTransac.getH03FLGWK3().equals("R")){%>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td > 
              <div align="right">Saldo de Reajuste :</div>
            </td>
            <td nowrap align="center"> 
              <input type="text" class="txtright" name="E03DEAREA" size="23" maxlength="15" value="<%= cdTransac.getE03DEAREA().trim()%>" readonly>
            </td>
            <TD nowrap align="center"> 
              <INPUT type="text" class="txtright" readonly name="AFTERREA" id="AFTERREA" size="23" maxlength="13" value="" onkeypress="enterDecimal()">
            </TD>
          </tr> 
           <%}%>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <TD nowrap> 
              <DIV align="right">Saldo de Inter�s :</DIV>
            </TD>
            <TD nowrap align="center">
            <INPUT type="text" name="E03DEAMEI" class="txtright" size="23" maxlength="13" value="<%= Util.formatCCY(cdTransac.getE03DEAMEI())%>" readonly></TD>
            <TD nowrap align="center"> 
              <INPUT class="txtright" type="text" readonly name="AFTERINT" id="AFTERINT" size="23" maxlength="13" value="" onkeypress="enterDecimal()">
            </TD>
          </TR>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <TD nowrap> 
              <DIV align="right">Retenciones :</DIV>
            </TD>
            <TD nowrap align="center"><INPUT type="text" name="E03DEAWHL" class="txtright" size="23" maxlength="13" value="<%= Util.formatCCY(cdTransac.getE03DEAWHL())%>" readonly></TD>
            <TD nowrap align="center"></TD>
          </TR>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <TD nowrap> 
              <DIV align="right">Impuestos :</DIV>
            </TD>
            <TD nowrap align="center"><INPUT type="text" name="E03DEATAX" class="txtright" size="23" maxlength="13" value="<%= Util.formatCCY(cdTransac.getE03DEATAX())%>" readonly></TD>
            <TD nowrap align="center"></TD>
          </TR>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <TD nowrap> 
              <DIV align="right">Total :</DIV>
            </TD>
            <TD nowrap align="center"><INPUT type="text" name="E03DEATOT" class="txtright" size="23" maxlength="13" value="<%= Util.formatCCY(cdTransac.getE03DEATOT())%>" readonly></TD>
            <TD nowrap align="center"> 
              <INPUT class="txtright" type="text" readonly name="AFTERTOT" id="AFTERTOT" size="23" maxlength="13" value="" onkeypress="enterDecimal()">
            </TD>
          </TR>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
          	<TD nowrap colspan="3"> 
              <DIV align="center">Fecha de Ultimo C&aacute;lculo : 
                 <eibsinput:date name="cdTransac"  fn_month="E03DEALCM" fn_day="E03DEALCD" fn_year="E03DEALCY" readonly="True" /> 
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
              <input class="txtright" type="text" name="E03TRNPRI" size="15" maxlength="15" value="<%= cdTransac.getE03TRNPRI().trim()%>" onKeypress="enterDecimal()"
              onChange="changeField('E03TRNPRF')" onblur="verifyNum(this)">
              <input type="radio" name="E03TRNPRF" value="0" onClick="Recalculate();"
              <%if(cdTransac.getE03TRNPRF().equals("0")) out.print("checked");%>>
              Aumento 
              <input type="radio" name="E03TRNPRF" value="5" onClick="Recalculate();"
              <%if(cdTransac.getE03TRNPRF().equals("5")) out.print("checked");%>> Disminuci&oacute;n</td>
          </tr>
			<%if(cdTransac.getH03FLGWK3().equals("R")){%>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td width="40%">
              <div align="right">Reajuste :</div>
            </td>
            <td width="60%">
              <input class="txtright" type="text" name="E03TRNREA" size="15" maxlength="15" value="<%= cdTransac.getE03TRNREA().trim()%>" onKeyPress="enterDecimal()"
              onChange="changeField('E03TRNREF')" onblur="verifyNum(this)">
              <input type="radio" name="E03TRNREF" value="0" onClick="Recalculate();" <%if(cdTransac.getE03TRNREF().equals("0")) out.print("checked");%>>
              Aumento 
              <input type="radio" name="E03TRNREF" value="5" onClick="Recalculate();" <%if(cdTransac.getE03TRNREF().equals("5")) out.print("checked");%>>
              Disminuci&oacute;n </td>
          </tr> 
		  <%}%>	
		<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">            
            <td width="40%"> 
              <div align="right">Intereses :</div>
            </td>
            <td width="60%"> 
              <input class="txtright" type="text" name="E03TRNINT" size="15" maxlength="15" value="<%= cdTransac.getE03TRNINT().trim()%>" onKeypress="enterDecimal()"
              onChange="changeField('E03TRNINF')" onblur="verifyNum(this)">
              <input type="radio" name="E03TRNINF" value="0" onClick="Recalculate();"
  	       <%if(cdTransac.getE03TRNINF().equals("0")) out.print("checked");%>> Reversar <input type="radio" name="E03TRNINF" value="5" onClick="Recalculate();"
	       <%if(cdTransac.getE03TRNINF().equals("5")) out.print("checked");%>> Pagar </td>
          </tr> 
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">             
            <td width="40%" > 
              <div align="right">Ajustes de Intereses :</div>
            </td>
            <td width="60%" height="27"> 
              <input class="txtright" type="text" name="E03TRNADJ" size="15" maxlength="15" value="<%= cdTransac.getE03TRNADJ().trim()%>" onKeypress="enterDecimal()"
              onChange="changeField('E03TRNADF')" onblur="verifyNum(this)">
              <input type="radio" name="E03TRNADF" value="0" onClick="Recalculate();"
		<%if(cdTransac.getE03TRNADF().equals("0")) out.print("checked");%>>
              Aumento 
              <input type="radio" name="E03TRNADF" value="5" onClick="Recalculate();"
	       <%if(cdTransac.getE03TRNADF().equals("5")) out.print("checked");%>>
              Disminuci&oacute;n </td>
          </tr> 
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">           
            <td width="40%"> 
              <div align="right">Retenciones :</div>
            </td>
            <td width="60%"> 
              <input class="txtright" type="text" name="E03TRNWHL" size="15" maxlength="15" value="<%= cdTransac.getE03TRNWHL().trim()%>" onKeypress="enterDecimal()">
            </td>
          </tr> 
           <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td width="40%"> 
              <div align="right">Impuestos :</div>
            </td>
            <td width="60%"> 
              <input class="txtright" type="text" name="E03TRNTAX" size="15" maxlength="15" value="<%= cdTransac.getE03TRNTAX().trim()%>" onKeypress="enterDecimal()">
            </td>
          </tr> 
            <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td width="40%"> 
              <div align="right">Fecha Valor :</div>
            </td>
            <td width="60%"> 
	              <eibsinput:date name="cdTransac"  fn_month="E03TRNVDM" fn_day="E03TRNVDD" fn_year="E03TRNVDY" /> 
            </td>
          </tr> 
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">            
            <td width="40%"> 
              <div align="right">Tasa de Cambio :</div>
            </td>
            <td width="60%"> 
              <input class="txtright" type="text" name="E03DEAEXR" size="11" maxlength="11" value="<%= cdTransac.getE03DEAEXR().trim()%>" onKeypress="enterDecimal()">
            </td>
          </tr> 
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">           
            <td width="40%"> 
              <div align="right">Descripci&oacute;n :</div>
            </td>
            <td width="60%"> 
              <input type="text" name="E03DEANR1" size="60" maxlength="60" value="<%= cdTransac.getE03DEANR1().trim()%>">
            </td>
          </tr> 
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">             
            <td width="40%"> 
              <div align="right"></div>
            </td>
            <td width="60%"> 
              <input type="text" name="E03DEANR2" size="60" maxlength="60" value="<%= cdTransac.getE03DEANR2().trim()%>">
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
                <input type="text" name="E03TRNOPC" value="<%= cdTransac.getE03TRNOPC().trim()%>" size="3" maxlength="3">
                <input type=HIDDEN name="E03TRNGLN" value="<%= cdTransac.getE03TRNGLN().trim()%>">
                <input type="text" name="E03TRNCON" size="45" maxlength="45" readonly value="<%= cdTransac.getE03TRNCON().trim()%>"
                class="context-menu-help" onmousedown="init(conceptHelp,this.name,document.forms[0].E03DEABNK.value, document.forms[0].E03TRNCCY.value,'E03TRNGLN','E03TRNOPC',document.forms[0].E03DEAACD.value, '05')"> 
              </div>
            </td>
            <td  nowrap> 
              <div align="center"> 
                <input type="text" name="E03TRNBNK" size="2" maxlength="2" value="<%= cdTransac.getE03TRNBNK().trim()%>" readonly>
              </div>
            </td>
            <td nowrap> 
              <div align="center"> 
                <input type="text" name="E03TRNBRN" size="4" maxlength="4" value="<%= cdTransac.getE03TRNBRN().trim()%>"
                class="context-menu-help" onmousedown="init(branchHelp,this.name,document.getElementById('E03DEABNK').value,'','','','')">
              </div>
            </td>
            <td nowrap > 
              <div align="center">
                <input type="text" name="E03TRNCCY" size="3" maxlength="3" value="<%= cdTransac.getE03TRNCCY().trim()%>"
                class="context-menu-help" onmousedown="init(currencyHelp,this.name,document.getElementById('E03DEABNK').value,'','','','')">
              </div>
            </td>
            <td nowrap > 
              <div align="center"> 
                <input type="text" name="E03TRNACC" size="16" maxlength="13" value="<%= cdTransac.getE03TRNACC().trim()%>"
                  class="context-menu-help" onmousedown="init(accountHelp,this.name,document.getElementById('E03DEABNK').value,'','','','RT')">
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
<!--     <input id="EIBSBTN" type="button" name="Submit" value="Enviar" onclick="vergln()"> -->
  </p>
</form>
</body>
</html>
