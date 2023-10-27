<%@page import="datapro.eibs.master.Util" %>
<%@taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@page import="com.datapro.constants.EibsFields"%>
<%@page import="datapro.eibs.master.Util" %>

<html>
<head>
<title>Transacciones de Boletas</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/jquery/plugins/contextMenu/css/jquery.contextMenu.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/Ajax.js"></script>


<jsp:useBean id= "bolgaran" class="datapro.eibs.beans.ELC508501Message" scope="session" />
<jsp:useBean id= "error" class="datapro.eibs.beans.ELEERRMessage" scope="session" />
<jsp:useBean id= "userPO" class="datapro.eibs.beans.UserPos" scope="session" />


<SCRIPT type="text/javascript">

  //builtNewMenu(bg_m_opt);
  //initMenu();

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

<h3 align="center">Transacciones de Documentarias<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="transaction_detail.jsp, ELC5085"></h3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.bolgaran.JSELC5085" >
   <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="200">
   <INPUT TYPE=HIDDEN NAME="E01LCMBNK" VALUE="<%=bolgaran.getE01LCMBNK().trim()%>">
   
  <table class="tableinfo" style="width: 100%">
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
          <tr id="trdark"> 
            <td nowrap width="16%" > 
              <div align="right"><b>Cliente :</b></div>
            </td>
            <td nowrap width="20%" > 
              <div align="left"> 
              	<eibsinput:text property="E01LCMCUN" name="bolgaran" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_CUSTOMER%>" readonly="true" />
              </div>
            </td>
            <td nowrap width="16%" > 
              <div align="right"><b>Nombre :</b> </div>
            </td>
            <td nowrap colspan="3" > 
              <div align="left"><font face="Arial"><font face="Arial"><font size="2"> 
              	<eibsinput:text property="E01LCMCUN" name="bolgaran" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_NAME%>" readonly="true" />
               </font></font></font></div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="16%"> 
              <div align="right"><b>Cuenta :</b></div>
            </td>
            <td nowrap width="20%"> 
              <div align="left"> 
              	<eibsinput:text property="E01LCMACC" name="bolgaran" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_ACCOUNT%>" readonly="true" />
              </div>
            </td>
            <td nowrap width="16%"> 
              <div align="right"><b>Moneda : </b></div>
            </td>
            <td nowrap width="16%"> 
              <div align="left"><b> 
              	<eibsinput:text property="E01LCMCCY" name="bolgaran" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_CURRENCY%>" readonly="true" />
              </b> </div>
            </td>
            <td nowrap width="16%"> 
              <div align="right"><b>Producto : </b></div>
            </td>
            <td nowrap width="16%"> 
              <div align="left"><b> 
              	<eibsinput:text property="E01LCMPRO" name="bolgaran" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_CURRENCY%>" readonly="true" />
                </b> </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  
  <h4>Informaci&oacute;n Financiera</h4>
<%int row = 0; %>
<TABLE class="tableinfo" style="width: 100%">
     <TBODY>
        <TR> 
      <TD nowrap> 
        <TABLE cellspacing="2" cellpadding="2" width="100%" border="0">
          <TBODY>
             <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <TD nowrap width="40%" > 
              <DIV align="center"></DIV>
            </TD>
            <TD nowrap width="30%" > 
              <DIV align="center"><B>Antes</B></DIV>
            </TD>
            <TD nowrap width="30%" > 
              <DIV align="center"><B>Después</B></DIV>
            </TD>
          </TR>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <TD nowrap > 
              <DIV align="right">Saldo de Principal :</DIV>
            </TD>
            <TD nowrap align="center"> 
              	<eibsinput:text property="E01BEFPRI" name="bolgaran" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_AMOUNT%>" readonly="true" />
            </TD>
            <TD nowrap align="center"> 
              	<eibsinput:text property="E01AFTPRI" name="bolgaran" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_AMOUNT%>" readonly="true" />
            </TD>
          </TR>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <TD nowrap > 
              <DIV align="right">Saldo de Inter&eacute;s :</DIV>
            </TD>
            <TD nowrap align="center"> 
              	<eibsinput:text property="E01BEFINT" name="bolgaran" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_AMOUNT%>" readonly="true" />
            </TD>
            <TD nowrap align="center"> 
              	<eibsinput:text property="E01AFTINT" name="bolgaran" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_AMOUNT%>" readonly="true" />
            </TD>
          </TR>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <TD nowrap > 
              <DIV align="right">Saldo de Comisiones :</DIV>
            </TD>
            <TD nowrap align="center"> 
              	<eibsinput:text property="E01BEFCOM" name="bolgaran" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_AMOUNT%>" readonly="true" />
            </TD>
            <TD nowrap align="center"> 
              	<eibsinput:text property="E01AFTCOM" name="bolgaran" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_AMOUNT%>" readonly="true" />
            </TD>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <TD nowrap > 
              <DIV align="right">Saldo de Iva :</DIV>
            </TD>
            <TD nowrap align="center"> 
              	<eibsinput:text property="E01BEFIVA" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_AMOUNT%>" readonly="true" />
            </TD>
            <TD nowrap align="center"> 
              	<eibsinput:text property="E01AFTIVA" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_AMOUNT%>" readonly="true" />
            </TD>
          </tr>
          
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <TD nowrap > 
              <DIV align="right">Total :</DIV>
            </TD>
            <TD nowrap align="center"> 
              	<eibsinput:text property="E01BEFTOT" name="bolgaran" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_AMOUNT%>" readonly="true" />
            </TD>
            <TD nowrap align="center"> 
              	<eibsinput:text property="E01AFTTOT" name="bolgaran" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_AMOUNT%>" readonly="true" />
            </TD>
          </TR>
        	</TBODY>
            </TABLE>
      	</TD>
    </TR>
  </TBODY>
</TABLE>

  <h4>Datos de la Transacci&oacute;n</h4>
  <table class="tableinfo" style="width: 100%">
    <tr > 
      <td> 
        <table cellspacing=0 cellpadding=2 width="100%" border="0">
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td width="42%"> 
              <div align="right" style="font-weight: bold;">Valor Documento :</div>
            </td>
            <td width="12%"> 
              	<eibsinput:text property="E01TRNPRI" name="bolgaran" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_AMOUNT%>" onchange="changeAfterFields()"/>
			</td>
            <td width="12%"> 
              <div align="right">Incremento </div>
			</td>
            <td width="2%"> 
				<input type="radio" name="E01TRNPRF" value="I" <%if (bolgaran.getE01TRNPRF().equals("I")) out.print("checked"); %> onclick="changeAfterFields()">  
			</td>
            <td width="2%"> 
              <div align="right">Decremento </div>
			</td>
            <td width="30%"> 
				<input type="radio" name="E01TRNPRF" value="D" <%if (bolgaran.getE01TRNPRF().equals("D")) out.print("checked"); %> onclick="changeAfterFields()">  
			</td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td width="42%"> 
              <div align="right" style="font-weight: bold;">Ajuste Interes :</div>
            </td>
            <td width="12%"> 
              	<eibsinput:text property="E01TRNAIN" name="bolgaran" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_AMOUNT%>" onchange="changeAfterFields()"/>
			</td>
            <td width="12%"> 
              <div align="right">Incremento </div>
			</td>
            <td width="2%"> 
				<input type="radio" name="E01TRNAIF" value="I" <%if (bolgaran.getE01TRNAIF().equals("I")) out.print("checked"); %> onclick="changeAfterFields()">  
			</td>
            <td width="2%"> 
              <div align="right">Decremento </div>
			</td>
            <td width="30%"> 
				<input type="radio" name="E01TRNAIF" value="D" <%if (bolgaran.getE01TRNAIF().equals("D")) out.print("checked"); %> onclick="changeAfterFields()">  
			</td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td width="42%" height="27"> 
              <div align="right" style="font-weight: bold;">Intereses :</div>
            </td>
            <td width="12%"> 
              	<eibsinput:text property="E01TRNINT" name="bolgaran" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_AMOUNT%>" onchange="changeAfterFields()"/>
			</td>
            <td width="12%"> 
              <div align="right">Reverso </div>
			</td>
            <td width="2%"> 
				<input type="radio" name="E01TRNINF" value="R" <%if (bolgaran.getE01TRNINF().equals("R")) out.print("checked"); %> onclick="changeAfterFields()"> 
			</td>
            <td width="2%"> 
              <div align="right">Pago </div>
			</td>
            <td width="30%"> 
				<input type="radio" name="E01TRNINF" value="P" <%if (bolgaran.getE01TRNINF().equals("P")) out.print("checked"); %> onclick="changeAfterFields()"> 
			</td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  
  <h4>Datos de las Comisiones</h4>
  <table class="tableinfo" style="width:100%" >
    <tr > 
      <td> 
        <table cellspacing=0 cellpadding=2 width="100%" border="0">
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td width="40%"> 
              <div align="right" style="font-weight: bold;"></div>
            </td>
            <td width="30%" align="center"> 
              <div align="center" style="font-weight: bold;">Comision</div>
            </td>
            <td width="30%" align="center"> 
              <div align="center" style="font-weight: bold;">Iva</div>
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td width="40%"> 
              <div align="right" style="font-weight: bold;">Reversar : </div>
            </td>
            <td width="30%" align="center"> 
              <input type="text" name="VLRREV" id="VLRREV" style="text-align: right" size="17" maxlength="15" value="0.00" readonly >
            </td>
            <td width="30%" align="center"> 
              <input type="text" name="IVAREV" id="IVAREV" style="text-align: right" size="17" maxlength="15" value="0.00" readonly >
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td width="40%"> 
              <div align="right" style="font-weight: bold;">Anular : </div>
            </td>
            <td width="30%" align="center"> 
              <input type="text" name="VLRANU" id="VLRANU" style="text-align: right" size="17" maxlength="15" value="0.00" readonly >
            </td>
            <td width="30%" align="center"> 
              <input type="text" name="IVAANU" id="IVAANU" style="text-align: right" size="17" maxlength="15" value="0.00" readonly >
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td width="40%"> 
              <div align="right" style="font-weight: bold;">Pagar : </div>
            </td>
            <td width="30%" align="center"> 
              <input type="text" name="VLRPAG" id="VLRPAG" style="text-align: right" size="17" maxlength="15" value="0.00" readonly >
            </td>
            <td width="30%" align="center"> 
              <input type="text" name="IVAPAG" id="IVAPAG" style="text-align: right" size="17" maxlength="15" value="0.00" readonly >
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td width="40%"> 
              <div align="right" style="font-weight: bold;">Pagado : </div>
            </td>
            <td width="30%" align="center"> 
              <input type="text" name="TOTPAG" id="TOTPAG" style="text-align: right" size="17" maxlength="15" value="0.00" readonly >
            </td>
            <td width="30%" align="center"> 
              <input type="text" name="TIVPAG" id="TIVPAG" style="text-align: right" size="17" maxlength="15" value="0.00" readonly >
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td width="40%"> 
              <div align="right" style="font-weight: bold;">Pendiente : </div>
            </td>
            <td width="30%" align="center"> 
              <input type="text" name="TOTPEN" id="TOTPEN" style="text-align: right" size="17" maxlength="15" value="0.00" readonly >
            </td>
            <td width="30%" align="center"> 
              <input type="text" name="TIVPEN" id="TIVPEN" style="text-align: right" size="17" maxlength="15" value="0.00" readonly >
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>

  <!-- Comisiones (Plan de Pagos) -->
  <br>
  <iframe id="ifremppp" frameborder="0" scrolling="no" height="200" width="100%" src="<%=request.getContextPath()%>/servlet/datapro.eibs.bolgaran.JSELC5085?SCREEN=600&IFRAME=Y&E03DCCACC=<%=bolgaran.getE01LCMACC()%>"></iframe>

  <h4>Informacion adicional</h4>
  <table class="tableinfo" style="width: 100%">
    <tr > 
      <td> 
        <table cellspacing=0 cellpadding=2 width="100%" border="0">
          <tr id="trclear"> 
            <td width="40%"> 
              <div align="right">Fecha Valor :</div>
            </td>
            <td width="60%"> 
              <eibsinput:date name="bolgaran"  fn_month="E01TRNVDM" fn_day="E01TRNVDD" fn_year="E01TRNVDY" /> 
            </td>
          </tr>
          <tr id="trclear"> 
            <td width="40%"> 
              <div align="right">Descripci&oacute;n :</div>
            </td>
            <td width="60%"> 
              <eibsinput:text property="E01TRNNAR" name="bolgaran" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION%>"/>
            </td>
		  </tr>
		</table>
        <br>
        <table cellspacing=0 cellpadding=2 width="100%" border="0">
          <tr id="trdark"> 
            <td align="center"> <b>Cuenta Contrapartida</b> </td>
          </tr>
        </table>
        <table class="tableinfo" style="filter:''; border: 0px;" align="center">
          <tr id="trdark"> 
            <td width="30%"> 
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
            <td width="15%" > 
              <div align="center">Referencia</div>
            </td>
            <td width="20%" > 
              <div align="center">Titular</div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td width="30%" > 
              <div align="center" > 
                <input type=text name="E01TRNOPC" value="<%= bolgaran.getE01TRNOPC().trim()%>" size="3" maxlength="3">
                <input type=HIDDEN name="E01TRNGLN" value="<%= bolgaran.getE01TRNGLN().trim()%>">
                <input type="text" name="E01TRNCON" size="35" maxlength="35" readonly value="<%= bolgaran.getE01TRNCON().trim()%>"
                   class="context-menu-help" onmousedown="init(conceptHelp,this.name,document.forms[0].E01LCMBNK.value,' ','E01TRNGLN','E01TRNOPC','43')">
              </div>
            </td>
            <td width="5%" > 
              <div align="center"> 
                <input type="text" name="E01TRNBNK" size="2" maxlength="2" value="<%= bolgaran.getE01TRNBNK().trim()%>">
              </div>
            </td>
            <td width="5%"> 
              <div align="center"> 
                <input type="text" name="E01TRNBRN" size="4" maxlength="4" value="<%= bolgaran.getE01TRNBRN().trim()%>"
						class="context-menu-help" onmousedown="init(branchHelp,this.name,document.forms[0].E01LCMBNK.value,'','','','')">
              </div>
            </td>
            <td width="5%" > 
              <div align="center">
                <input type="text" name="E01TRNCCY" size="3" maxlength="3" value="<%= bolgaran.getE01TRNCCY().trim()%>"
                class="context-menu-help" onmousedown="init(currencyHelp,this.name,document.forms[0].E01LCMBNK.value,'','','','')"> 
              </div>
            </td>
            <td width="15%" > 
              <div align="center"> 
                <input type="text" name="E01TRNACC" size="16" maxlength="16" value="<%= bolgaran.getE01TRNACC().trim()%>"
                 class="context-menu-help" onmousedown="init(accountHelp,this.name,document.forms[0].E01LCMBNK.value,'','','','RT')">
               </div>
            </td>
            <td width="5%" > 
              <div align="center"> 
                <input type="text" name="E01TRNCDS" size="35" maxlength="35" readonly value="<%= bolgaran.getE01TRNCDS().trim()%>">
              </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <div align="center"> 
    <input id="EIBSBTN" type=submit name="Submit" value="Enviar">
  </div>
  
  <SCRIPT type="text/javascript">
 var globalAmountArray = [];
 var afterFields = ["E01AFTPRI","E01AFTINT","E01AFTCOM"];
 
  function commisionObj(commisionTotal, commision, impuestos, operativeFlag){ //Object that contains Commision distribution
 	this.commisionTotal = getElement(commisionTotal);
 	this.commision = getElement(commision);
 	this.impuestos = getElement(impuestos);
 	this.operativeFlag = operativeFlag;
  	this.account = getElement('E01LCMACC').value;
 }
 
 function fieldAmount(amountName, operation, afterAmt, beforeAmt, type){ //Object that contains Amount to be added/subtracted to BeforeAmounts. 
 	this.amtInputed = getElement(amountName);
 	this.operation = document.getElementsByName(operation);
 	this.afterAmt = getElement(afterAmt);
	this.beforeAmt = getElement(beforeAmt);
	this.type = type;
 	this.totalAftAmt = getElement('E01AFTTOT');
 	globalAmountArray.push(this);
 	
 }

 function changeAfterFields(){
 	var tempOperation = 0;
 	var radioArray = [];
 	var objType;
 	var calculateTotal = false;
 	
 	for ( var i = 0; i < globalAmountArray.length; i++) {
 		radioArray = globalAmountArray[i].operation;
 		objType = globalAmountArray[i].type;
 		
		if (radioArray[0].checked || radioArray[1].checked){ //If Either Radio is Checked 
			if(radioArray[0].checked){//Addition Operation
				if("Saldo Interes" == objType){//Validation Adds Two Interest Fields together
					tempOperation = parseFloat(((globalAmountArray[i].afterAmt).value)) + parseFloat(((globalAmountArray[i].amtInputed).value));
				}else{//Adds From Befor Fields Value			
			    	tempOperation = parseFloat(((globalAmountArray[i].beforeAmt).value)) + parseFloat(((globalAmountArray[i].amtInputed).value));
				}
			}else if(radioArray[1].checked){//Subtraction Operation
				if("Saldo Interes" == objType){//Validation Adds Two Interest Fields together
					tempOperation = parseFloat(((globalAmountArray[i].afterAmt).value)) - parseFloat(((globalAmountArray[i].amtInputed).value));
				}else{//Adds From Befor Fields Value			
			    	tempOperation = parseFloat(((globalAmountArray[i].beforeAmt).value)) - parseFloat(((globalAmountArray[i].amtInputed).value));
				}
			}
			//Sets the AfterField value
			(globalAmountArray[i].afterAmt).value = formatCCY(String(tempOperation));
			calculateTotal = true;
		}
	}
	if(calculateTotal)updateTotal();
}	
  
  function updateTotal(){
 	var total = 0; 
	for ( var i = 0; i < afterFields.length; i++) {
		total += parseFloat((getElement(afterFields[i]).value)); //Adds the After Fields
	}
    (globalAmountArray[0].totalAftAmt).value = formatCCY(String(total));  //Sets Total of all AfterAmount fields.
  }
  
function commisionUpdate() {
	var parameters = "?SCREEN=1500";
	var commisionTotAJAX = commisionFields.commisionTotal.value; 
	var operativeFlagAJAX = $('input:radio[name='+commisionFields.operativeFlag+']:checked').val();
	operativeFlagAJAX = (operativeFlagAJAX == undefined) ? '' :operativeFlagAJAX;
	parameters += "&commisionTotAJAX=" + commisionTotAJAX;
	parameters += "&operativeFlagAJAX=" + operativeFlagAJAX;
	parameters += "&ACC=" + commisionFields.account;
	var url = "<%=request.getContextPath()%>/servlet/datapro.eibs.bolgaran.JSELC5085";
	url += parameters;
	commisionFields.commisionTotal.readOnly  = true;
	callWaiting("userWait", "<%=request.getContextPath()%>/images/throbber.gif", "Calculando");
	PostXMLRequest(url, parameters, fillCommisionFields,true);
}  

function fillCommisionFields(res){ //Object of AJAX response
   	var userWait = getElement("userWait"); //Removes Waiting Throbber gif 
   	userWait.innerHTML = "";
   	
   	var data = JSON.parse(res.responseText);
	if (data.type == "error") {
		showErrors();
	} else {
		 commisionFields.commision.value = data.E02TRNCOM;
		 commisionFields.impuestos.value = data.E02TRNIVA;
		 commisionFields.commision.onchange(); //Calls Function to Update After Amount Fields.
		 commisionFields.commisionTotal.readOnly  = false;
		 (commisionFields.commisionTotal).value = formatCCY((commisionFields.commisionTotal).value);
	}
}

  	var commisionFields = new commisionObj("E01TRNCHG","E01TRNCOM","E01TRNIVA","E01TRNCHF");

    new fieldAmount("E01TRNPRI","E01TRNPRF","E01AFTPRI","E01BEFPRI","Valor Trans");
    new fieldAmount("E01TRNAIN","E01TRNAIF","E01AFTINT","E01BEFINT","Ajuste Interes");
    new fieldAmount("E01TRNINT","E01TRNINF","E01AFTINT","E01BEFINT","Saldo Interes");

</SCRIPT>  
  
  
</form>
</body>
</html>
