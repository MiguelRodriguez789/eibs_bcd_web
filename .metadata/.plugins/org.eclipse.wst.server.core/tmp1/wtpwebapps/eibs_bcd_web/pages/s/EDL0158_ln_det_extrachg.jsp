<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@ page import = "datapro.eibs.master.Util" %>
<%@page import="com.datapro.constants.EibsFields"%>
<%@page import="com.datapro.eibs.constants.HelpTypes"%>

<html>
<head>
<title>Gastos Extras</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Studio">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/jquery/plugins/contextMenu/css/jquery.contextMenu.css" rel="stylesheet" type="text/css" />

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>


<jsp:useBean id= "EDL0158code" class= "datapro.eibs.beans.EDL015801Message"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>

<script type="text/javascript">

function regresar() {
	getElement("SCREEN").value = "200";
	document.forms[0].submit();		
}
</script>

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


<h3 align="center">
<% if (userPO.getCusNum().trim().equals("NEW")) { %> 
	Nuevo Gasto
<% } else { %>
	Mantenimiento de Gastos	
<% } %>
<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="ln_det_extrachg.jsp, EDL0158"></h3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDL0158">
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="300">
  <INPUT TYPE=HIDDEN NAME="OPT" VALUE="1">
  <INPUT TYPE=HIDDEN NAME="E01DLSACC" VALUE= "<%= EDL0158code.getE01DLSACC()%>">
  <INPUT TYPE=HIDDEN NAME="E01DLSCDE" VALUE= "<%= EDL0158code.getE01DLSCDE()%>">
  
  <%int row = 0; %>
  <table class="tableinfo">
    <tr > 
      <td nowrap> 
          <table class="tableinfo">
            <tr > 
              <td nowrap> 
                <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
                  <tr id="trdark"> 
                    <td nowrap width="16%" > 
                      <div align="right"><b>Cliente :</b></div>
                    </td>
                    <td nowrap width="20%" > 
                      <div align="left"><b> 
                        <input type="text" readonly name="E02DEACUN" size="10" maxlength="9" value="<%= userPO.getCusNum().trim()%>" >
                        </b> </div>
                    </td>
                    <td nowrap width="16%" > 
                      <div align="right"><b>Nombre :</b> </div>
                    </td>
                    <td nowrap width="16%" > 
                      <div align="left"><font face="Arial"><font face="Arial"><font size="2"> 
                        <input type="text" name="E02DEANA1" size="50" maxlength="45" readonly value="<%= userPO.getCusName().trim()%>">
                        </font></font></font></div>
                    </td>
                    <td nowrap width="16%" > 
                      <div align="right"><b></b> </div>
                    </td>
                    <td nowrap width="16%" > 
                      <div align="left"></div>
                    </td>
                  </tr>
                  <tr id="trdark"> 
                    <td nowrap width="16%"> 
                      <div align="right"><b>Cuenta :</b></div>
                    </td>
                    <td nowrap width="20%"> 
                      <div align="left"> 
                        <input type="text" name="E02DEAACC" size="13" maxlength="12" value="<%= userPO.getAccNum().trim()%>" readonly>
                      </div>
                    </td>
                    <td nowrap width="16%"> 
                      <div align="right"><b>Moneda : </b></div>
                    </td>
                    <td nowrap width="16%"> 
                      <div align="left"><b> 
                        <input type="text" name="E02DEACCY" size="3" maxlength="3" value="<%= userPO.getCurrency().trim()%>" readonly>
                        </b> </div>
                    </td>
                    <td nowrap width="16%"> 
                      <div align="right"><b>Producto: </b></div>
                    </td>
                    <td nowrap width="16%"> 
                      <div align="left"><b> 
                        <input type="text" name="E02DEAPRO" size="4" maxlength="4" readonly value="<%= userPO.getProdCode().trim()%>">
                        </b> </div>
                    </td>
                  </tr>
                </table>
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
          <tr class="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
          	 <td nowrap width="30%"> 
              <div align="right">Secuencia :</div>
            </td>
            <td nowrap width="70%"> 
 		        <eibsinput:text name="EDL0158code" property="E01DLSSEQ" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_INTEGER %>" size="4" maxlength="3" readonly="FALSE" />
            </td>
          </tr>
          <tr class="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td width="30%"> 
              <div align="right">Tipo Gasto :</div>
            </td>
		 	<td width="70%"> 
            	<select  name="E01DLSTYP" onchange="showTypeChg(this.value);">
            		<option  value="5" <% if (EDL0158code.getE01DLSTYP().equals("5")) out.print("selected"); %>> COBRANZA</option>
            		<option  value="4" <% if (EDL0158code.getE01DLSTYP().equals("4")) out.print("selected"); %>> IVA</option>
            		<option  value="3" <% if (EDL0158code.getE01DLSTYP().equals("3")) out.print("selected"); %>> DEDUCCION</option>
            		<option  value="2" <% if (EDL0158code.getE01DLSTYP().equals("2")) out.print("selected"); %>> COMISION</option>
            		<option  value="1" <% if (EDL0158code.getE01DLSTYP().equals("1")) out.print("selected"); %>> IMPUESTO </option>
           		</select>
            </td>
          </tr>
          <tr class="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td width="30%"> 
              <div align="right">Fecha Aplicaci&oacute;n :</div>
            </td>
            <td width="70%"> 
			  <eibsinput:date name="EDL0158code" fn_year="E01DLSPDY" fn_month="E01DLSPDM" fn_day="E01DLSPDD"  readonly="true"/>
			  <a href="javascript:GetFechaPlan('E01DLSPDM','E01DLSPDD', 'E01DLSPDY')"><img src="<%=request.getContextPath()%>/images/calendar.gif" title="Ayuda" align="bottom" border="0" ></a>
            </td>
          </tr>
          <tr class="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">  
            <td width="30%" nowrap> 
              <div align="right">Monto :</div>
            </td>
            <td nowrap width="70%"> 
            <div align="left">
            	<eibsinput:text name="EDL0158code" property="E01DLSAMT" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT%>"/>
			</div>
            </td>
          </tr>
          <tr class="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>" id="ivaRow"> 
            <td width="30%"> 
              <div align="right">Aplica IVA :</div>
            </td>
            <td width="70%"> 
              <input type="radio" name="E01DLSIVA" value="Y" <%if(EDL0158code.getE01DLSIVA().equals("Y")) out.print("checked");%>>S&iacute; 
              <input type="radio" name="E01DLSIVA" value="N" <%if(EDL0158code.getE01DLSIVA().equals("N")) out.print("checked");%>>No
            </td>
          </tr>
		  <tr id="ivaRow%" class="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td width="30%"> 
              <div align="right">Porcentaje I.V.A :</div>
            </td>
            <td width="70%"> 
              <input type="text" name="E01DLSIVP" size="8" maxlength="8" value="<%= EDL0158code.getE01DLSIVP().trim()%>" onKeypress="enterInteger(event)">
            </td>
          </tr>
          <tr id="ivaRowMonto" class="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td width="30%"> 
              <div align="right">Monto Base IVA :</div>
            </td>
            <td width="70%"> 
              <div align="left">
              <eibsinput:text name="EDL0158code" property="E01DLSIVB" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DECIMAL %>"/>
              </div>
            </td>
          </tr>          
          <tr class="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td width="30%"> 
              <div align="right">Concepto :</div>
            </td>
            <td width="70%"> 
              <input type="text" name="E01DLSNAR" size="60" maxlength="60" value="<%= EDL0158code.getE01DLSNAR().trim()%>">
            </td>
          </tr>
          <tr class="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td width="30%"> 
              <div align="right">Cuenta Credito :</div>
            </td>
            <td width="70%"> 
               <table class="tableinfo" style="filter:''">
          			<tr id="trdark"> 
            			<td width="5%"> 
              				<div align="center">Banco</div>
            			</td>
            			<td width="13%" > 
              				<div align="center">Sucursal</div>
            			</td>
            			<td width="12%" > 
              				<div align="center">Moneda</div>
            			</td>
            			<td width="25%" > 
              				
                    <div align="center">Cuenta Contable</div>
            			</td>
            			<td width="25%" > 
              				<div align="center">Referencia</div>
            			</td>
          			</tr>
          			<tr id="trclear"> 
            			<td width="5%" > 
              				<div align="center">
              				<input type="text" name="E01DLSOBK" size="2" maxlength="2" value="<%= EDL0158code.getE01DLSOBK().trim()%>"> 
              				</div>
            			</td>
            			<td width="13%"> 
              				<div align="center"> 
                			<input type="text" name="E01DLSOBR" size="5" maxlength="4" value="<%= EDL0158code.getE01DLSOBR().trim()%>"
							class="context-menu-help" onmousedown="init(branchHelp,this.name,document.forms[0].E01DLSOBK.value,'','','','')">
              				</div>
            			</td>
            			<td width="12%" > 
              				<div align="center">
                			<input type="text" name="E01DLSOCY" size="4" maxlength="3" value="<%= EDL0158code.getE01DLSOCY().trim()%>"
                			class="context-menu-help" onmousedown="init(currencyHelp,this.name,document.forms[0].E01DLSOBK.value,'','','','')"> 
              				</div>
            			</td>
            			<td width="25%" > 
              				<div align="center"> 
                			<input type="text" name="E01DLSOGL" size="18" maxlength="16" value="<%= EDL0158code.getE01DLSOGL().trim()%>"
                 			class="context-menu-help" onmousedown="init(ledgerHelp,this.name,document.forms[0].E01DLSOBK.value,document.forms[0].E01DLSOCY.value,'','','')">
               				</div>
            			</td>
            			<td width="25%" > 
              				<div align="center"> 
                			<input type="text" name="E01DLSOAC" size="14" maxlength="12" value="<%= EDL0158code.getE01DLSOAC().trim()%>"
                 			class="context-menu-help" onmousedown="init(accountHelp,this.name,document.forms[0].E01DLSOBK.value,'','','','RT')">
               				</div>
            			</td>
          			</tr>
        		</table>
            </td>
          </tr>
        </table>                       
      </td>
    </tr>
  </table>

	<div align="center"> 
    	<input id="EIBSBTN" type=submit name="Submit" value="Enviar">
    	<input id="EIBSBTN" type="button" name="Return" value="Regresar" onclick="regresar();">
  	</div>

<script type="text/javascript">



function setRowColors(table){
    $('#'+table+ ' tr:visible:odd').removeClass().addClass('trclear');
	$('#'+table+ ' tr:visible:even').removeClass().addClass('trdark'); 
}



function showTypeChg(gastoType){
   getElement("INFOCHG").rows[getElement("INFOCHG").rows.length -2].style.display = "table-row";
   getElement("INFOCHG").rows[getElement("INFOCHG").rows.length -1].style.display = "table-row";
   getElement("ivaRow").style.display = "none";
   getElement("ivaRow%").style.display = "none";
   getElement("ivaRowMonto").style.display = "none";
	
	switch (gastoType) {
	case "5": //Cobranza
	case "2": //Comission
			getElement("ivaRow").style.display = "table-row";
			setRowColors("INFOCHG");
		break;
	case "4": //IVA
		   getElement("ivaRow%").style.display = "table-row";
		   getElement("ivaRowMonto").style.display = "table-row";	
		   setRowColors("INFOCHG");
		
	default:
			setRowColors("INFOCHG");
		break;
	} 
}

</script>


  <SCRIPT type="text/javascript">
  	$().ready(function(){
	    showTypeChg('<%= EDL0158code.getE01DLSTYP().trim()%>');
  	});
  </SCRIPT>

</form>
</body>
</html>
