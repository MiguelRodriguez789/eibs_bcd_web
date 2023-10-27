<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@ page import = "datapro.eibs.master.Util" %>
<%@page import="com.datapro.constants.EibsFields"%>

<html>
<head>
<title>Cambio de Tasa de Certificados</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "cdRate" class= "datapro.eibs.beans.EDL013006Message"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>

<SCRIPT type="text/javascript">
	
   	builtNewMenu(cd_a_opt);

 //  Process according with user selection
 function goAction() {
		document.forms[0].submit();
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
 if ( !userPO.getPurpose().equals("NEW") ) {
    out.println("<SCRIPT> initMenu(); </SCRIPT>");
 }
 String blocked = "";
 if (!currUser.getE01STS().equals("I")) {
 	if (!currUser.getE01AUT().equals("B")) {
		blocked = "readonly disabled";
	}
 }
%>

<h3 align="center">Cambio de Tasa de Intereses<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="cd_ap_xchg_rate.jsp, EDL0140"></h3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEXEDL0130" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="20">
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
                <input type="text" name="E06DEACUN" size="10" maxlength="9" readonly value="<%= userPO.getCusNum().trim()%>">
              </div>
            </td>
            <td nowrap width="16%" > 
              <div align="right"><b>Nombre :</b> </div>
            </td>
            <td nowrap colspan="3" > 
              <div align="left"><font face="Arial"><font face="Arial"><font size="2">
                <input type="text" name="E06CUSNA1" size="45" maxlength="45" readonly value="<%= userPO.getCusName().trim()%>">
                </font></font></font></div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="16%"> 
              <div align="right"><b>Cuenta :</b></div>
            </td>
            <td nowrap width="20%"> 
              <div align="left">
                <input type="text" name="E06DEAACC" size="13" maxlength="12" value="<%= userPO.getAccNum().trim()%>" readonly>
              </div>
            </td>
            <td nowrap width="16%"> 
              <div align="right"><b>Moneda : </b></div>
            </td>
            <td nowrap width="16%"> 
              <div align="left"><b>
                <input type="text" name="E01DEACCY" size="4" maxlength="3" value="<%= userPO.getCurrency().trim()%>" readonly>
                </b> </div>
            </td>
            <td nowrap width="16%"> 
              <div align="right"><b>Producto : </b></div>
            </td>
            <td nowrap width="16%"> 
              <div align="left"><b>
                <input type="text" name="E06DEAPRO" size="5" maxlength="4" readonly value="<%= userPO.getProdCode().trim()%>">
                </b> </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
 
 <%int row = 0; %> 
 <br>
 <table class=tbenter>
   <tr > 
     <td nowrap> 
   		<h4>Informaci&oacute;n B&aacute;sica</h4>
      </td>
      <td nowrap align=right> 
   		<b><font color="#ff6600"><%= cdRate.getE06STATUS()%> &nbsp;&nbsp;&nbsp;</font></b>
      </td>
    </tr>
  </table>
  
  <table class="tableinfo">
    <tr bordercolor="#FFFFFF"> 
      <td> 
        <table cellspacing=0 cellpadding=2 width="100%" border="0">
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
          	 <td nowrap width="25%"> 
              <div align="right">Fecha Apertura :</div>
            </td>
            <td nowrap width="25%"> 
            	<eibsinput:date name="cdRate" fn_month="E06DEAODM" fn_day="E06DEAODD" fn_year="E06DEAODY" readonly="true"/>
            </td>
          	 <td nowrap width="25%"> 
              <div align="right">Fecha Vencimiento :</div>
            </td>
            <td nowrap width="25%"> 
            	<eibsinput:date name="cdRate" fn_month="E06DEAMAM" fn_day="E06DEAMAD" fn_year="E06DEAMAY" readonly="true"/>
            </td>
          </tr> 
         <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
           <td nowrap width="25%"> 
              <div align="right">T&eacute;rmino :</div>
            </td>
            <td nowrap width="25%" > 
              <input type="text" name="E06DEATRM" size="5" maxlength="5" value="<%= cdRate.getE06DEATRM().trim()%>" readonly>
              <input type="text" name="E06DEATRC" size="10" 
				  value="<% if (cdRate.getE06DEATRC().equals("D")) out.print("D&iacute;a(s)");
							else if (cdRate.getE06DEATRC().equals("M")) out.print("Mes(es)");
							else if (cdRate.getE06DEATRC().equals("Y")) out.print("A&ntilde;o(s)");
							else out.print("");%>" 
				readonly>
            </td>
            <td nowrap width="25%" >
       				<div align="right">Periodo Pago Intereses :</div>
       			</td> 
    			<td nowrap width="25%" >
                <input type="text" name="E06DEAROY" size="3" maxlength="3" value="<%= cdRate.getE06DEAROY().trim()%>" readonly>
                <input type="text" name="E06DEAODA" size="10" 
                  value ="<% if (cdRate.getE06DEAODA().equals("D")) out.print("D&iacute;a(s)");
							else if (cdRate.getE06DEAODA().equals("M")) out.print("De Cada Mes");
							else if (cdRate.getE06DEAODA().equals("Y")) out.print("A&ntilde;o(s)");
							else out.print(""); %>" readonly > 
                </td>
          </tr>   
        
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap width="25%"> 
              <div align="right">Tipo de Inter&eacute;s :</div>
            </td>
            <td nowrap width="25%"> 
              <input type="text" readonly name="E06DEAICT" size="40" maxlength="35" 
				value="<% if (cdRate.getE06DEAICT().equals("S")) out.print("Al Vencimiento Calendario");
							else if (cdRate.getE06DEAICT().equals("M")) out.print("Al Vencimiento Comercial");
							else if (cdRate.getE06DEAICT().equals("P")) out.print("Prepagados Calendario");
							else if (cdRate.getE06DEAICT().equals("A")) out.print("Prepagados Comerciales");
							else if (cdRate.getE06DEAICT().equals("D")) out.print("Descontados Calendario");
							else if (cdRate.getE06DEAICT().equals("T")) out.print("Descontados Comerciales");
							else if (cdRate.getE06DEAICT().equals("R")) out.print("Capitalizados(CD's)");
							else if (cdRate.getE06DEAICT().equals("1")) out.print("Al Vencimiento Calendario");
							else if (cdRate.getE06DEAICT().equals("2")) out.print("Al Vencimiento Comercial");
							else if (cdRate.getE06DEAICT().equals("3")) out.print("Prepagados Calendario");
							else if (cdRate.getE06DEAICT().equals("4")) out.print("Prepagados Comerciales");
							else if (cdRate.getE06DEAICT().equals("5")) out.print("Descontados Calendario");
							else if (cdRate.getE06DEAICT().equals("6")) out.print("Descontados Comerciales");
							else if (cdRate.getE06DEAICT().equals("7")) out.print("Capitalizados (CD's)");
							else if (cdRate.getE06DEAICT().equals("8")) out.print("Regla 78");
							else out.print("");%>" >
            </td>
            <td nowrap width="25%">
              <div align="right">Per&iacute;odo Base :</div>
            </td>
            <td nowrap width="25%"> 
              <input type="text" name="E06DEABAS" size="3" maxlength="3" value="<%= cdRate.getE06DEABAS().trim()%>" readonly>
            </td>
          </tr>
           <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap width="25%"> 
              <div align="right">Tabla de Tasa Flotante :</div>
            </td>
            <td nowrap width="25%"> 
              <input type="text" name="E06DEAFTB" size="3" maxlength="2" value="<%= cdRate.getE06DEAFTB().trim()%>" readonly>
              <input type="text" name="E06DEAFTY" size="10" 
				  value="<% if (cdRate.getE06DEAFTY().equals("FP")) out.print("Primaria");
							else if (cdRate.getE06DEAFTY().equals("FS")) out.print("Secundaria");
							else out.print("");%>"  readonly>
              <input type="text" readonly name="E06FLTDSC" size="40" maxlength="40" value="<%= cdRate.getE06FLTDSC().trim()%>">
            </td>
            <td width="25%" > 
              <div align="right">Tasa Flotante :</div>
            </td>
            <td width="25%" > 
              <input type="text" name="E06DEAFRT" id="E06DEAFRT" size="10" maxlength="9" value="<%= cdRate.getE06DEAFRT().trim()%>" readonly>
            </td>
          </tr>
         
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
          	<td nowrap width="25%"> 
              <div align="right">Tabla de Tasa :</div>
            </td>
            <td nowrap width="25%">
              <input type="text" name="E06DEARTB" size="2" maxlength="2" value="<%= cdRate.getE06DEARTB().trim()%>" readonly>
            </td>
            <td width="25%"> 
              <div align="right">Tasa Inter&eacute;s/Spread :</div>
            </td>
            <td width="25%"> 
        	   <eibsinput:text name="cdRate" property="E06DEARTE" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_RATE %>" readonly="true"/>
            </td>
          </tr>  
           <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
           <td nowrap width="25%"> 
              <div align="right">Tasa Nominal del Certificado:</div>
            </td>
            <td nowrap width="25%"> 
				<eibsinput:text property="E06OLDRTE" name="cdRate" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_RATE %>" readonly="true"/>
           </td>  
          	 <td nowrap width="25%"> 
              <div align="right">Tasa Efectiva Anual :</div>
            </td>
            <td nowrap width="25%"> 
        	   <eibsinput:text name="cdRate" property="E06DEASPR" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_RATE %>" readonly="true"/>
            </td>
          </tr>  
     </table>
  </td>
  </tr>
  </table>
  
<h4>Nueva Tasa</h4>
  <table class="tableinfo">
    <tr bordercolor="#FFFFFF"> 
      <td> 
        <table cellspacing=0 cellpadding=2 width="100%" border="0">
  		<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
           <td nowrap width="25%"  height="23"> 
              <div align="right">Tabla de Tasa Flotante :</div>
            </td>
            <td nowrap width="25%" > 
              <input type="text" name="E06NEWFTB" id="E06NEWFTB" size="3" maxlength="2" value="<%= cdRate.getE06NEWFTB().trim()%>" readonly>
              <select name="E06NEWFTY" id="E06NEWFTY" disabled>
                <option value=" " <% if (!(cdRate.getE06NEWFTY().equals("FP") ||cdRate.getE06NEWFTY().equals("FS"))) out.print("selected"); %>></option>
                <option value="FP" <% if (cdRate.getE06NEWFTY().equals("FP")) out.print("selected"); %>>Primaria</option>
                <option value="FS" <% if (cdRate.getE06NEWFTY().equals("FS")) out.print("selected"); %>>Secondaria</option>
              </select>
              <input type="text" name="E06NEWDSC" id="E06NEWDSC" size="40" maxlength="40" readonly value="<%= cdRate.getE06NEWDSC().trim()%>">
            </td>
            <td nowrap width="25%" > 
              <div align="right">Tasa Flotante Base :</div>
            </td>
            <td nowrap width="25%"> 
          	   <eibsinput:text name="cdRate" property="E06FLTORG" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_RATE %>" readonly="true"/>
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="25%">
              <div align="right"> Manejo Puntos Adicional :</div> 
            </td>
            <td nowrap width="25%"> 
	             <select name="E06DEAFLX" id="E06DEAFLX" disabled>
	              <OPTION value=" " <% if (!(cdRate.getE06DEAFLX().equals("B") ||cdRate.getE06DEAFLX().equals("E")||cdRate.getE06DEAFLX().equals("N"))) out.print("selected"); %>></OPTION>
	              <OPTION value="B" <% if(cdRate.getE06DEAFLX().equals("B")) out.print("selected");%>>+/- Tasa Base</OPTION>
	              <OPTION value="E" <% if(cdRate.getE06DEAFLX().equals("E")) out.print("selected");%>>+/- Tasa Efectiva</OPTION>
	              <OPTION value="N" <% if(cdRate.getE06DEAFLX().equals("N")) out.print("selected");%>>+/- Tasa Nominal</OPTION>
	             </select>
	      	</td>
            <td nowrap width="25%">
              <div align="right"> Valor Tasa Adicional :</div> 
            </td>
            <td nowrap width="25%" > 
              <eibsinput:text name="cdRate" property="E06DEARTX" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_RATE %>" readonly="true"/>
            </td> 
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
             <td nowrap width="25%" > 
              <div align="right">Tasa Flotante :</div>
            </td>
            <td  nowrap width="25%" > 
             <eibsinput:text name="cdRate" property="E06NEWFRT" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_RATE %>" readonly="true"/>
            </td>
            <td nowrap width="25%"> 
              <div align="right">Tasa Inter&eacute;s/Spread :</div>
            </td>
            <td nowrap width="25%"> 
        	   <eibsinput:text name="cdRate" property="E06NEWRTE" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_RATE %>" readonly="true"/>
            </td>
          </tr>
           <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="25%"> 
              <div align="right">Tasa Nominal del Certificado :</div>
            </td>
            <td nowrap width="25%"> 
            	<eibsinput:text name="cdRate" property="E06RATE" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_RATE %>" readonly="true"/>
            </td> 
            <td nowrap width="25%"> 
              <div align="right">Tasa Efectiva Anual :</div>
            </td>
            <td nowrap width="25%"> 
            	<eibsinput:text name="cdRate" property="E06NEWSPR" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_RATE %>" readonly="true"/>
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="25%" > 
              <div align="right">Fecha Valor :</div>
            </td>
            <td nowrap width="25%">
	              <eibsinput:date name="cdRate"  fn_month="E06TRNVDM" fn_day="E06TRNVDD" fn_year="E06TRNVDY" readonly="true"/> 
            </td>
              <td nowrap width="25%" > 
        	</td>
        	 <td nowrap width="25%" > 
        	</td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="25%" > 
              <div align="right">Descripci&oacute;n :</div>
            </td>
            <td nowrap width="25%" > 
        	   <eibsinput:text name="cdRate" property="E06DEANR1" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true"/>
            </td>
             <td nowrap width="25%" > 
        	</td>
        	 <td nowrap width="25%" > 
        	</td>
          </tr> 
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="25%"> 
              <div align="right"></div>
            </td>
            <td nowrap width="25%"> 
        	   <eibsinput:text name="cdRate" property="E06DEANR2" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true"/>
            </td>
             <td nowrap width="25%" > 
        	</td>
        	 <td nowrap width="25%" > 
        	</td>
          </tr>
		</table>
		</td>
	</tr>
</table>
  
  
</form>
</body>
</html>
