<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@ page import="com.datapro.constants.EibsFields" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>Gastos Extras</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Studio">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/jquery/plugins/contextMenu/css/jquery.contextMenu.css" rel="stylesheet" type="text/css" />

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>


<jsp:useBean id= "lnExtChg" class= "datapro.eibs.beans.EDL015801Message"  scope="session" />
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

<SCRIPT type="text/javascript">
 
 function showTypeChg(typval){
   var state="";
   if (typval == "4") state="";
   else state="none";
   INFOCHG.rows[INFOCHG.rows.length -2].style.display=state;
   INFOCHG.rows[INFOCHG.rows.length -1].style.display=state;
 }  
</SCRIPT>

<h3 align="center">Nuevo Gasto<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="ln_new_extrachg.jsp, EDL0158"></h3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDL0158">
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="2">
  <INPUT TYPE=HIDDEN NAME="OPT" VALUE="1">
  <INPUT TYPE=HIDDEN NAME="E01DLSSEQ" VALUE="99">            
  <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
          <tr id="trdark"> 
            <td nowrap width="40%" > 
              <div align="right"><b>Cuenta :</b></div>
            </td>
            <td nowrap width="60%" > 
              <div align="left"> 
                <input type="text" name="E01DLSACC" size="13" maxlength="12" value="<%= userPO.getIdentifier().trim()%>" readonly>
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
              <div align="right">Tipo Gasto :</div>
            </td>
            <td > 
              <input type="radio" name="E01DLSTYP" value="5" <% if (!(lnExtChg.getE01DLSTYP().equals("4"))) out.print("checked"); %> onclick="showTypeChg(this.value)">Cargo   
              <input type="radio" name="E01DLSTYP" value="4" <% if (lnExtChg.getE01DLSTYP().equals("4")) out.print("checked"); %> onclick="showTypeChg(this.value)">I.V.A
            </td>
          </tr>
          <tr id="trclear"> 
            <td width="30%"> 
              <div align="right">Fecha Aplicación :</div>
            </td>
            <td >
             <eibsinput:date name="lnExtChg" fn_month="E01DLSPDM" fn_day="E01DLSPDD" fn_year="E01DLSPDY" /> 
            </td>
          </tr>
          <tr id="trdark">  
            <td width="30%" nowrap> 
              <div align="right">Monto :</div>
            </td>
            <td nowrap width="25%"> 
            <div align="left">
				<input type="text" name="E01DLSAMT" size="17" maxlength="17" value="<%= lnExtChg.getE01DLSAMT().trim()%>" onkeypress="enterDecimal(event, 2)">
			</div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td width="30%"> 
              <div align="right">Concepto :</div>
            </td>
            <td> 
              <input type="text" name="E01DLSNAR" size="60" maxlength="60" value="<%= lnExtChg.getE01DLSNAR().trim()%>">
            </td>
          </tr>
          <tr id="trdark"> 
            <td width="30%"> 
              <div align="right">Cuenta Credito :</div>
            </td>
            <td> 
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
                			<input type="text" name="E01DLSOBK" size="2" maxlength="2" value="<%= lnExtChg.getE01DLSOBK().trim()%>">
              				</div>
            			</td>
            			<td width="13%"> 
              				<div align="center"> 
                			<input type="text" name="E01DLSOBR" size="4" maxlength="4" value="<%= lnExtChg.getE01DLSOBR().trim()%>"
							class="context-menu-help" onmousedown="init(branchHelp,this.name,document.forms[0].E01DLSOBK.value,'','','','')">
              				</div>
            			</td>
            			<td width="12%" > 
              				<div align="center">
                			<input type="text" name="E01DLSOCY" size="3" maxlength="3" value="<%= lnExtChg.getE01DLSOCY().trim()%>"
                			class="context-menu-help" onmousedown="init(currencyHelp,this.name,document.forms[0].E01DLSOBK.value,'','','','')"> 
              				</div>
            			</td>
            			<td width="25%" > 
              				<div align="center"> 
                			<input type="text" name="E01DLSOGL" size="16" maxlength="16" value="<%= lnExtChg.getE01DLSOGL().trim()%>"
                 			class="context-menu-help" onmousedown="init(ledgerHelp,this.name,document.forms[0].E01DLSOBK.value,document.forms[0].E01DLSOCY.value,'','','')">
               				</div>
            			</td>
            			<td width="25%" > 
              				<div align="center"> 
                			<input type="text" name="E01DLSOAC" size="16" maxlength="16" value="<%= lnExtChg.getE01DLSOAC().trim()%>"
                 			class="context-menu-help" onmousedown="init(accountHelp,this.name,document.forms[0].E01DLSOBK.value,'','','','RT')">
               				</div>
            			</td>
          			</tr>
        		</table>
            </td>
          </tr>
		  <tr id="trclear"> 
            <td width="30%"> 
              <div align="right">Porcentaje I.V.A :</div>
            </td>
            <td > 
              <input type="text" name="E01DLSIVP" size="8" maxlength="8" value="<%= lnExtChg.getE01DLSIVP().trim()%>" onKeypress="enterInteger(event)">
            </td>
          </tr>
          <tr id="trdark"> 
            <td width="30%"> 
              <div align="right">Monto Base :</div>
            </td>
            <td > <div align="left">
              <input type="text" name="E01DLSIVB" size="17" maxlength="17" value="<%= lnExtChg.getE01DLSIVB().trim()%>" onKeypress="enterDecimal(event, 2)">
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
  showTypeChg("<%= lnExtChg.getE01DLSTYP().trim()%>"); 
  </SCRIPT>
</form>
</body>
</html>
