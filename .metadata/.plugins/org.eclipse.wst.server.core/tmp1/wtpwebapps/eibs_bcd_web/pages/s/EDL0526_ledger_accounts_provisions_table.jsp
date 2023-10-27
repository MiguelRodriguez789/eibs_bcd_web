<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@ page import = "datapro.eibs.master.Util" %>
<%@ page import="com.datapro.constants.EibsFields" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<html>
<head>
<title>Tabla de Provision Cuentas Contables</title>
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="GENERATOR" content="Rational Software Architect">

<jsp:useBean id="EDL0526Record" class="datapro.eibs.beans.EDL052601Message"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>

<%
		if (!error.getERRNUM().equals("0")) {
		error.setERRNUM("0");
		out.println("<SCRIPT Language=\"Javascript\">");
		out.println("       showErrors()");
		out.println("</SCRIPT>");
	}
%>

</head>
<body>
<H3 align="center">Tabla de Provision Cuentas Contables<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="ledger_accounts_provisions_table.jsp, EDL0526"></H3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.params.JSEDL0526" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="4">
  <INPUT TYPE=HIDDEN NAME="D01PCCTGA" VALUE=" ">
 <% 
if (!(userPO.getPurpose().equals("MAINT"))) {  %>
  <table  class="tableinfo">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
          <tr id="trdark"> 
            <td nowrap width="16%" > 
              <div align="right"><b>Clase de Cr&eacute;dito:</b></div>
            </td>
            <td nowrap colspan="3" > 
              <div align="left"><font face="Arial"><font face="Arial"><font size="2"> 
              	<input type="text" name="E01PCCTPC" maxlength="1" size="5" value="<%= EDL0526Record.getE01PCCTPC()%>" >
              	 	<a
					href="javascript:GetCode('E01PCCTPC','STATIC_ln_prod_sup.jsp')"><img
					src="<%=request.getContextPath()%>/images/1b.gif" title=". . ."
					align="bottom" border="0"></a>
            
              	</font></font></font>
              </div>
            </td>
			<% if('a' != 'a') { %>
            <td nowrap width="16%" > 
              <div align="right"><b>Tipo de Garant&iacute;a:</b></div>
            </td>
            <td nowrap colspan="3" > 
              <div align="left"><font face="Arial"><font face="Arial"><font size="2"> 
              	<input type="text" name="E01PCCTGA" maxlength="4" size="5" value="<%= EDL0526Record.getE01PCCTGA()%>" >
                	<a href="javascript:GetCodeDescCNOFC('E01PCCTGA','D01PCCTGA','K5')"><img
					src="<%=request.getContextPath()%>/images/1b.gif" title="ayuda"
					align="bottom" border="0"></a>
            
              
              	</font></font></font>
              </div>
            </td>
			<% } %>
            <td nowrap width="16%" > 
              <div align="right"><b>Categor&iacute;a de Riesgo:</b></div>
            </td>
            <td nowrap colspan="3" > 
              <div align="left"><font face="Arial"><font face="Arial"><font size="2"> 
              	<input type="text" name="E01PCCCRG" maxlength="2" size="5" value="<%= EDL0526Record.getE01PCCCRG()%>" >
              	<a href="javascript:GetCodeCNOFC('E01PCCCRG','K4')"><img src="<%=request.getContextPath()%>/images/1b.gif" title=". . ." align="bottom" border="0"  ></a>
              	</font></font></font>
              </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <% } else {%>
  
    <table  class="tableinfo">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
          <tr id="trdark"> 
            <td nowrap width="16%" > 
              <div align="right"><b>Clase de Cr&eacute;dito:</b></div>
            </td>
            <td nowrap colspan="3" > 
              <div align="left"><font face="Arial"><font face="Arial"><font size="2"> 
              	<input type="text" name="E01PCCTPC" maxlength="1" size="5" value="<%= EDL0526Record.getE01PCCTPC()%>" readonly>
              	</font></font></font>
              </div>
            </td>
			<% if('a' != 'a') { %>
            <td nowrap width="16%" > 
              <div align="right"><b>Tipo de Garant&iacute;a:</b></div>
            </td>
            <td nowrap colspan="3" > 
              <div align="left"><font face="Arial"><font face="Arial"><font size="2"> 
              	<input type="text" name="E01PCCTGA" maxlength="4" size="5" value="<%= EDL0526Record.getE01PCCTGA()%>"  readonly>
              	</font></font></font>
              </div>
            </td>
			<% } %>
            <td nowrap width="16%" > 
              <div align="right"><b>Categor&iacute;a de Riesgo:</b></div>
            </td>
            <td nowrap colspan="3" > 
              <div align="left"><font face="Arial"><font face="Arial"><font size="2"> 
              	<input type="text" name="E01PCCCRG" maxlength="2" size="5" value="<%= EDL0526Record.getE01PCCCRG()%>" readonly>
              	</font></font></font>
              </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <% } %>
  <br>  
  <table  class="tableinfo">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="trdark"> 
            <td nowrap width="15%" align = "right"> 
              <b>Tipo de Provision</b>
            </td>
			<%if ((userPO.getPurpose().equals("MAINT"))) {  %>
             <td nowrap width="5%">
      	    <INPUT TYPE=HIDDEN NAME="E01PCCTPP" value="<%= EDL0526Record.getE01PCCTPP()%>">
            <input type="text" readonly name="tipo" size="40" maxlength="40" 
				value="<% 
				
				if (EDL0526Record.getE01PCCTPP().equals("1")) out.print("Proc&iacute;clico");
							else if (EDL0526Record.getE01PCCTPP().equals("3")) out.print("Individual(Microcredito Vivienda)");
							else if (EDL0526Record.getE01PCCTPP().equals("2")) out.print("Contrac&iacute;clico");
							else if (EDL0526Record.getE01PCCTPP().equals("0")) out.print("Provision General Microcredito/Vivienda");%>" >
             </td>
			 <% } else {%>
			 <td nowrap width="5%">
            <select name="E01PCCTPP">
                <option value="0">Provision General Microcredito/Vivienda</option>
                <option value="1">Proc&iacute;clico</option>
                <option value="2">Contrac&iacute;clico</option>
                <option value="3">Individual(Microcredito Vivienda)</option>
              </select>
             </td>			 
			 
 			 <% } %>
            <td nowrap width="25%"> 
              <div align="right"><b>Cuenta de Debito Capital</b></div>
            </td>
            <td nowrap width="55%"> 
              <div align="left" >
                <eibsinput:text name="EDL0526Record" property="E01PCCCDP" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_GLEDGER %>" />
                <a href="javascript:GetLedger('E01PCCCDP','','','')">
                <img src="<%=request.getContextPath()%>/images/1b.gif" title="Help" border="0" ></a>
              </div>
            </td>
			
			<td nowrap width="25%"> 
              <div align="right"><b></b></div>
            </td>
            <td nowrap width="55%"> 
              <div align="left" >

              </div>
            </td>
			
        </tr>
         <tr id="trclear"> 
           <td nowrap width="15%"> 
           </td>
           <td nowrap width="5%"> 
           </td>
            <td nowrap width="25%"> 
              <div align="right"><b>Cuenta de Credito Capital</b></div>
            </td>
            <td nowrap width="55%"> 
              <div align="left" >
               <eibsinput:text name="EDL0526Record" property="E01PCCCCP" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_GLEDGER %>" />
                <a href="javascript:GetLedger('E01PCCCCP','','','')">
                <img src="<%=request.getContextPath()%>/images/1b.gif" title="Help" border="0" ></a>
              </div>
            </td>
			<td nowrap width="25%"> 
              <div align="right"><b>Cuenta de Reintegro Capital</b></div>
            </td>
            <td nowrap width="55%"> 
              <div align="left" >
               <eibsinput:text name="EDL0526Record" property="E01PCCCRC" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_GLEDGER %>" />
                <a href="javascript:GetLedger('E01PCCCRC','','','')">
                <img src="<%=request.getContextPath()%>/images/1b.gif" title="Help" border="0" ></a>
              </div>
            </td>
          </tr>
          <tr id="trdark"> 
          <td nowrap width="15%"> 
           </td>
           <td nowrap width="5%"> 
           </td>
           	<td nowrap width="25%"> 
              <div align="right"><b>Cuenta de Debito Intereses</b></div>
            </td>
            <td nowrap width="55%"> 
              <div align="left" >
                <eibsinput:text name="EDL0526Record" property="E01PCCCDI" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_GLEDGER %>" />
                <a href="javascript:GetLedger('E01PCCCDI','','','')">
                <img src="<%=request.getContextPath()%>/images/1b.gif" title="Help" border="0" ></a>
              </div>
            </td>
			<td nowrap width="25%"> 
              <div align="right"><b></b></div>
            </td>
            <td nowrap width="55%"> 
              <div align="left" >

              </div>
            </td>
         </tr>
          <tr id="trclear"> 
          	<td nowrap width="15%"> 
           </td>
           <td nowrap width="5%"> 
           </td>
            <td nowrap width="25%"> 
              <div align="right"><b>Cuenta de Credito Intereses</b></div>
            </td>
            <td nowrap width="55%"> 
              <div align="left" >
                <eibsinput:text name="EDL0526Record" property="E01PCCCCI" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_GLEDGER %>" />
                <a href="javascript:GetLedger('E01PCCCCI','','','')">
                <img src="<%=request.getContextPath()%>/images/1b.gif" title="Help" border="0" ></a>
              </div>
            </td>
			<td nowrap width="25%"> 
              <div align="right"><b>Cuenta de Reintegro Intereses </b></div>
            </td>
            <td nowrap width="55%"> 
              <div align="left" >
               <eibsinput:text name="EDL0526Record" property="E01PCCCRI" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_GLEDGER %>" />
                <a href="javascript:GetLedger('E01PCCCRI','','','')">
                <img src="<%=request.getContextPath()%>/images/1b.gif" title="Help" border="0" ></a>
              </div>
            </td>
          </tr>
        	<tr id="trdark"> 
        	<td nowrap width="15%"> 
           </td>
           <td nowrap width="5%"> 
           </td>
        	 <td nowrap width="25%"> 
              <div align="right"><b>Cuenta de Debito Otros Gastos</b></div>
            </td>
             <td nowrap width="55%"> 
              <div align="left" >
                <eibsinput:text name="EDL0526Record" property="E01PCCCDO" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_GLEDGER %>" />
                <a href="javascript:GetLedger('E01PCCCDO','','','')">
                <img src="<%=request.getContextPath()%>/images/1b.gif" title="Help" border="0" ></a>
              </div>
              </td>
			  <td nowrap width="25%"> 
              <div align="right"><b></b></div>
            </td>
            <td nowrap width="55%"> 
              <div align="left" >

              </div>
            </td>
          </tr>
             <tr id="trclear">  
             <td nowrap width="15%"> 
           </td>
           <td nowrap width="5%"> 
           </td>
            <td nowrap width="25%"> 
              <div align="right"><b>Cuenta de Credito Otros Gastos</b></div>
            </td>
            <td nowrap width="55%"> 
              <div align="left" >
                <eibsinput:text name="EDL0526Record" property="E01PCCCCO" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_GLEDGER %>" />
                <a href="javascript:GetLedger('E01PCCCCO','','','')">
                <img src="<%=request.getContextPath()%>/images/1b.gif" title="Help" border="0" ></a>
              </div>
              </td>
			  <td nowrap width="25%"> 
              <div align="right"><b>Cuenta de Reintegro Otros Gastos </b></div>
            </td>
            <td nowrap width="55%"> 
              <div align="left" >
               <eibsinput:text name="EDL0526Record" property="E01PCCCRO" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_GLEDGER %>" />
                <a href="javascript:GetLedger('E01PCCCRO','','','')">
                <img src="<%=request.getContextPath()%>/images/1b.gif" title="Help" border="0" ></a>
              </div>
            </td>
          </tr>
<% if ((EDL0526Record.getE01PCCTPC().equals("M"))) {  %>
<tr id="trdark"> 
        	<td nowrap width="15%"> 
           </td>
           <td nowrap width="5%"> 
           </td>
        	 <td nowrap width="25%"> 
              <div align="right"><b>Cuenta de Debito Comision Ley Mipyme </b></div>
            </td>
             <td nowrap width="55%"> 
              <div align="left" >
                <eibsinput:text name="EDL0526Record" property="E01PCCCD1" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_GLEDGER %>" />
                <a href="javascript:GetLedger('E01PCCCD1','','','')">
                <img src="<%=request.getContextPath()%>/images/1b.gif" title="Help" border="0" ></a>
              </div>
              </td>
			  <td nowrap width="25%"> 
              <div align="right"><b></b></div>
            </td>
            <td nowrap width="55%"> 
              <div align="left" >

              </div>
            </td>
          </tr>
             <tr id="trclear">  
             <td nowrap width="15%"> 
           </td>
           <td nowrap width="5%"> 
           </td>
            <td nowrap width="25%"> 
              <div align="right"><b>Cuenta de Credito Comisi&oacute;n Ley Mipyme</b></div>
            </td>
            <td nowrap width="55%"> 
              <div align="left" >
                <eibsinput:text name="EDL0526Record" property="E01PCCCC1" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_GLEDGER %>" />
                <a href="javascript:GetLedger('E01PCCCC1','','','')">
                <img src="<%=request.getContextPath()%>/images/1b.gif" title="Help" border="0" ></a>
              </div>
              </td>
			  <td nowrap width="25%"> 
              <div align="right"><b>Cuenta de Reintegro Otros Gastos </b></div>
            </td>
            <td nowrap width="55%"> 
              <div align="left" >
               <eibsinput:text name="EDL0526Record" property="E01PCCCR1" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_GLEDGER %>" />
                <a href="javascript:GetLedger('E01PCCCR1','','','')">
                <img src="<%=request.getContextPath()%>/images/1b.gif" title="Help" border="0" ></a>
              </div>
            </td>
          </tr>		 
		  <% } %> 
  		</table>
  </td>
  </tr>
  </table>
  <br>
  <p>
  <br>
  </p>
  <div align="center"> 
  	<input id="EIBSBTN" type=submit name="Submit" value="Enviar">
  </div>
</form>
</body>
</html>