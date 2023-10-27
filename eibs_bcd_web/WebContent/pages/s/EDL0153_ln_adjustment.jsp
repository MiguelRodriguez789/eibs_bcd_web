<html>
<head>
<title>Ajustes a Intereses - Porcion DGI</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/jquery/plugins/contextMenu/css/jquery.contextMenu.css" rel="stylesheet" type="text/css" />

<%@ page import = "datapro.eibs.master.Util" %>

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>


<jsp:useBean id= "lnTransac" class= "datapro.eibs.beans.EDL015301Message"  scope="session" />

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
    UpdateField('E01DEAINT','E01TRNINT','AFTERINT','E01TRNINF',false);
    UpdateTotal();
 }
 function Recalculate1(){
    UpdateField('E01DEAINT','E01TRNAIN','AFTERINT','E01TRNAIF',false);
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
    Recalculate1();     
  }
  
    
  function verifyNum(elem){
   if (trim(elem.value)=="") elem.value="0.00";
  }
  
  function UpdateTotal(){
   
   var total;  
    try{
     total=total+parseFloat((document.forms[0].AFTERINT.value));}
    catch(e){
    }
   document.forms[0].AFTERTOT.value="";
   document.forms[0].AFTERTOT.value=formatCCY(total);
   
  }
</SCRIPT>
<SCRIPT type="text/javascript">

   builtNewMenu(ln_t_m_opt);
   initMenu();


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

<h3 align="center">Ajustes a Intereses - Porción DGI<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="ln_adjustment.jsp, EDL0150"></h3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDL0153">
   <INPUT TYPE=HIDDEN NAME="SCREEN" ID="SCREEN" VALUE="6">
   <INPUT TYPE=HIDDEN NAME="E01DEABNK" ID="E01DEABNK" VALUE="<%= lnTransac.getE01DEABNK().trim()%>">
   
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
                <input type="text" name="E01DEACUN" id="E01DEACUN" size="10" maxlength="9" value="<%= lnTransac.getE01DEACUN().trim()%>" readonly>
              </div>
            </td>
            <td nowrap width="16%" > 
              <div align="right"><b>Nombre :</b> </div>
            </td>
            <td nowrap colspan="3" > 
              <div align="left"><font face="Arial"><font face="Arial"><font size="2"> 
                <input type="text" name="E01CUSNA1" size="45" maxlength="45" value="<%= lnTransac.getE01CUSNA1().trim()%>" readonly>
                </font></font></font></div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="16%"> 
              <div align="right"><b>Cuenta :</b></div>
            </td>
            <td nowrap width="20%"> 
              <div align="left"> 
                <input type="text" name="E01DEAACC" id="E01DEAACC" size="13" maxlength="12" value="<%= lnTransac.getE01DEAACC().trim()%>" readonly>
              </div>
            </td>
            <td nowrap width="16%"> 
              <div align="right"><b>Moneda : </b></div>
            </td>
            <td nowrap width="16%"> 
              <div align="left"><b> 
                <input type="text" name="E01DEACCY" id="E01DEACCY" size="3" maxlength="3" value="<%= lnTransac.getE01DEACCY().trim()%>" readonly>
                </b> </div>
            </td>
            <td nowrap width="16%"> 
              <div align="right"><b>Producto : </b></div>
            </td>
            <td nowrap width="16%"> 
              <div align="left"><b> 
                <input type="text" name="E01DEAPRO" id="E01DEAPRO" size="4" maxlength="4" value="<%= lnTransac.getE01DEAPRO().trim()%>" readonly>
                </b> </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <h4>Informaci&oacute;n Financiera</h4>
<TABLE class="tableinfo">
     <TBODY>
        <TR> 
      <TD nowrap> 
        <TABLE cellspacing="2" cellpadding="2" width="100%" border="0">
          <TBODY>
          <tr id="trdark"> 
            <TD nowrap width="20%"> 
              <DIV align="center"></DIV>
            </TD>
            <TD nowrap width="40%"> 
              <DIV align="center"><B>Antes</B></DIV>
            </TD>
            <TD nowrap width="40%"> 
              <DIV align="center"><B>Después</B></DIV>
            </TD>
          </TR>

          <tr id="trclear"> 
            <TD nowrap> 
              <DIV align="right">Saldo de Inter&eacute;s ::</DIV>
            </TD>
            <TD nowrap align="center"> 
              <INPUT class="txtright" type="text" readonly name="E01DEAINT" size="15" maxlength="13" value="<%= Util.formatCCY(lnTransac.getE01DEAINT())%>" onkeypress="enterDecimal()">
            </TD>
            <TD nowrap align="center"> 
              <INPUT class="txtright" type="text" readonly name="AFTERINT" size="15" maxlength="13" value="" onkeypress="enterDecimal()">
            </TD>
          </TR>

<%--          
          <tr id="trdark"> 
            <TD nowrap id="trdark"> 
              <DIV align="right">Total :</DIV>
            </TD>
            <TD nowrap align="center"> 
              <INPUT class="txtright" type="text" readonly name="E01DEATOT" size="15" maxlength="13" value="<%= Util.formatCCY(lnTransac.getE01DEATOT())%>" onkeypress="enterDecimal()">
            </TD>
            <TD nowrap align="center"> 
              <INPUT class="txtright" type="text" readonly name="AFTERTOT" size="15" maxlength="13" value="" onkeypress="enterDecimal()">
            </TD>
          </TR>

          <tr id="trclear"> 
          <TD nowrap> 
          	<TD nowrap colspan="3"> 
              <DIV align="center">Fecha de Ultimo C&aacute;lculo : 
			  <INPUT type="text" name="E01DEALC1" size="2" maxlength="2" value="<%= lnTransac.getE01DEALC1().trim()%>" onkeypress="enterInteger(event)">
              <INPUT type="text" name="E01DEALC2" size="2" maxlength="2" value="<%= lnTransac.getE01DEALC2().trim()%>" onkeypress="enterInteger(event)">
              <INPUT type="text" name="E01DEALC3" size="2" maxlength="2" value="<%= lnTransac.getE01DEALC3().trim()%>" onkeypress="enterInteger(event)">
              </DIV>
            </TD>
           </TR>
--%>
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

          <tr id="trdark"> 
            <td width="40%" height="27"> 
              <div align="right">Intereses :</div>
            </td>
            <td width="60%" height="27"> 
              <input type="text" name="E01TRNINT" size="15" maxlength="15" value="<%= lnTransac.getE01TRNINT().trim()%>" onKeypress="enterDecimal()"
              onChange="changeField('CE01TRNINF')" onblur="verifyNum(this)">
              <input type="hidden" name="E01TRNINF" value="<%= lnTransac.getE01TRNINF()%>">
              <input type="radio" name="CE01TRNINF" value="0"
			   onClick="document.forms[0].E01TRNINF.value='0';Recalculate();"
			   <%if(lnTransac.getE01TRNINF().equals("0")) out.print("checked");%>> Reversar <input type="radio" name="CE01TRNINF" value="5"
			   onClick="document.forms[0].E01TRNINF.value='5';Recalculate();"
			   <%if(lnTransac.getE01TRNINF().equals("5")) out.print("checked");%>> Pago </td>
          </tr>

          <tr id="trclear"> 
            <td width="40%"> 
              <div align="right">Ajuste de Intereses :</div>
            </td>
            <td width="60%"> 
              <input type="text" name="E01TRNAIN" size="15" maxlength="15" value="<%= lnTransac.getE01TRNAIN().trim()%>" onKeypress="enterDecimal()"
              onChange="changeField('CE01TRNAIF')" onblur="verifyNum(this)">
              <input type="hidden" name="E01TRNAIF" value="<%= lnTransac.getE01TRNAIF()%>">
              <input type="radio" name="CE01TRNAIF" value="0" 
              onClick="document.forms[0].E01TRNAIF.value='0';Recalculate1();" 
			  <%if(lnTransac.getE01TRNAIF().equals("0")) out.print("checked");%>>
              Aumento 
              <input type="radio" name="CE01TRNAIF" value="5" 
              onClick="document.forms[0].E01TRNAIF.value='5';Recalculate1();" 
			  <%if(lnTransac.getE01TRNAIF().equals("5")) out.print("checked");%>>
              Disminuci&oacute;n </td>
          </tr>

          <tr id="trdark"> 
            <td width="40%"> 
              <div align="right">Total :</div>
            </td>
            <td width="60%"> 
              <input type="text" name="E01TRNTOT" size="15" maxlength="15" value="<%= lnTransac.getE01TRNTOT().trim()%>" onKeypress="enterDecimal()">
            </td>
          </tr>

        </table>
      </td>
    </tr>
  </table>

  <h4>Informacion adicional</h4>
  <table class="tableinfo">
    <tr > 
      <td> 
        <table cellspacing=0 cellpadding=2 width="100%" border="0">
          <tr id="trclear"> 
            <td width="40%"> 
              <div align="right">Fecha Valor :</div>
            </td>
            <td width="60%"> 
              <input type="text" name="E01TRNVD1" size="3" maxlength="2" value="<%= lnTransac.getE01TRNVD1().trim()%>">
              <input type="text" name="E01TRNVD2" size="3" maxlength="2" value="<%= lnTransac.getE01TRNVD2().trim()%>">
              <input type="text" name="E01TRNVD3" size="5" maxlength="4" value="<%= lnTransac.getE01TRNVD3().trim()%>">
            </td>
          </tr>
          <tr id="trdark"> 
            <td width="40%"> 
              <div align="right">Descripci&oacute;n :</div>
            </td>
            <td width="60%"> 
              <input type="text" name="E01DEANR1" size="60" maxlength="60" value="<%= lnTransac.getE01DEANR1().trim()%>">
            </td>
          </tr>
          <tr id="trclear"> 
            <td width="40%"> 
              <div align="right"></div>
            </td>
            <td width="60%"> 
              <input type="text" name="E01DEANR2" size="60" maxlength="60" value="<%= lnTransac.getE01DEANR2().trim()%>">
            </td>
          </tr>
        </table>
        <table cellspacing=0 cellpadding=2 width="100%" border="0">
          <tr id="trdark"> 
            <td align="center"> <b>Cuenta Contrapartida</b> </td>
          </tr>
        </table>
        <table class="tableinfo" style="filter:''">
          <tr id="trdark"> 
            <td width="31%"> 
              <div align="center">Concepto</div>
            </td>
            <td width="5%"> 
              <div align="center">Banco</div>
            </td>
            <td width="5%" > 
              <div align="center">Sucursal</div>
            </td>
            <td width="5%" > 
              <div align="center">Moneda</div>
            </td>
            <td width="21%" > 
              <div align="center">Referencia</div>
            </td>
            <td nowrap> 
              <div align="center">Titular</div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td width="31%" > 
              <div align="center" > 
                <input type=text name="E01TRNOPC" id="E01TRNOPC" value="<%= lnTransac.getE01TRNOPC().trim()%>" size="3" maxlength="3">
                <input type=HIDDEN name="E01TRNGLN" id="E01TRNGLN" value="<%= lnTransac.getE01TRNGLN().trim()%>">
                <input type="text" name="E01TRNCON" id="E01TRNCON" size="45" maxlength="45" readonly value="<%= lnTransac.getE01TRNCON().trim()%>"
                  class="context-menu-help"
				  onmousedown="init(conceptHelp,this.name,document.getElementById('E01DEABNK').value, document.forms[0].E01TRNCCY.value,'E01TRNGLN','E01TRNOPC','10')">
              </div>
            </td>
            <td width="5%" > 
              <div align="center"> 
                <input type="text" name="E01TRNBNK" id="E01TRNBNK" size="2" maxlength="2" value="<%= lnTransac.getE01TRNBNK().trim()%>">
              </div>
            </td>
            <td width="5%"> 
              <div align="center"> 
                <input type="text" name="E01TRNBRN" id="E01TRNBRN" size="4" maxlength="4" value="<%= lnTransac.getE01TRNBRN().trim()%>"
                  class="context-menu-help"
				  onmousedown="init(branchHelp,this.name,document.getElementById('E01DEABNK').value,'','','','')">
              </div>
            </td>
            <td width="5%" > 
              <div align="center">
                <input type="text" name="E01TRNCCY" id="E01TRNCCY" size="3" maxlength="3" value="<%= lnTransac.getE01TRNCCY().trim()%>"
                  class="context-menu-help"
				  onmousedown="init(currencyHelp,this.name,document.getElementById('E01DEABNK').value,'','','','')"> 
              </div>
            </td>
            <td width="15%" > 
              <div align="center"> 
                <input type="text" name="E01TRNACC" id="E01TRNACC" size="16" maxlength="16" value="<%= lnTransac.getE01TRNACC().trim()%>"
                  class="context-menu-help"
				  onmousedown="init(accountHelp,this.name,document.getElementById('E01DEABNK').value,'','','','RT')">
               </div>
            </td>
            
			<td nowrap width="21%" > 
              <div align="center"> 
                <input type="text" readonly name="E01TRNNA1" id="E01TRNNA1" size="25" maxlength="25" value="<%= lnTransac.getE01TRNNA1().trim()%>">
              </div>
            </td>
			
          </tr>
        </table>
        
      </td>
    </tr>
  </table>
  <SCRIPT type="text/javascript">
      Recalculate();
      Recalculate1();
  </SCRIPT>

  <div align="center"> 
    <input id="EIBSBTN" type=submit name="Submit" value="Enviar">
  </div>
  
</form>
</body>
</html>
