<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@page import="com.datapro.eibs.constants.ISOCodes"%>
<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@page import="com.datapro.constants.EibsFields"%>
<html>
<head>
<title>Payment and Receiving</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id="chgBasic" class="datapro.eibs.beans.EDD522001Message"  scope="session" />
<jsp:useBean id="currUser" class="datapro.eibs.beans.ESS0030DSMessage"  scope="session" />
<jsp:useBean id="error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos"  scope="session" />

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
 
<%--
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/CrossBrowserFunctions.jsp"> </SCRIPT>
--%>

<SCRIPT type="text/javascript">
  
   
</SCRIPT>

</head>

<body>

<% 
 if ( !error.getERRNUM().equals("0")  ) {
     out.println("<SCRIPT Language=\"Javascript\">");
	 error.setERRNUM("0");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
 }
 
 String title = "";
 title = (userPO.getPurpose().equals("NEW")) ? "Nuevo" : "Mantenimiento";
 String readOnly="readonly";
 if (userPO.getPurpose().equals("NEW") || userPO.getPurpose().equals("MAINTENANCE") ) readOnly="";
%>

<h3 align="center"><%=title%> Cargo Periodico <img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="pr_maint.jsp,EDD5220" ></h3>
<hr size="4">


<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDD5220">

  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="2">
  <table class="tableinfo" >
    <tr> 
      <td > 
      <table  cellspacing=0 cellpadding=0 width="100%">
      <tr id=trdark>
      	<td nowrap width="30%" > 
        <div align="right">Cuenta :</div>        
      	</td>
      	<td nowrap> 
        <div align="left"> 
        <% if (userPO.getPurpose().equals("NEW")) {%>
          <input type="text" name="E01CFMACC" size="13" maxlength="12" value="<%= chgBasic.getE01CFMACC().equals("0")?userPO.getAccNum(): chgBasic.getE01CFMACC()%>" readonly>
        <% } else {%>
          <input type="text" name="E01CFMACC" size="13" maxlength="12" value="<%= userPO.getAccNum()%>" readonly>
        <% } %>
        </div>
        </td>
      	<td nowrap width="20%" > 
        <div align="right">Referencia : </div>
      	</td>
      	<% if (userPO.getPurpose().equals("NEW")) {%>
      	<td nowrap width="40%" >
      	  <input type="hidden" name="E01CFMNUM" size="9" maxlength="9" value="999999999">
      	  <B>NUEVA</B>                              
      	</td>
      	<% } else {%>
      	<td nowrap width="40%">
      	  <input type="text" name="E01CFMNUM" size="9" maxlength="9" value="<%= chgBasic.getE01CFMNUM()%>" readonly>                              
      	</td>
      	<% } %>
  	  </table>
  	  </td>
    </tr>
   </table>
  <h4>Informaci&oacute;n B&aacute;sica </h4>
  <table class="tableinfo">
    <tr> 
      <td align="center"> 
  			<table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr id="trdark" > 
                      <td nowrap width="30%" > 
                        <div align="right">Cargo :</div>
                      </td>
                      <td nowrap colspan="2"> 
                        <input type="text" name="E01CFMTTP" size="4" maxlength="4" value="<%= chgBasic.getE01CFMTTP().trim()%>" readonly>                     
                        <input type="text" name="E01DESCAR" size="45" value="<%= chgBasic.getE01DESCAR().trim()%>" readonly>                     
                      </td>                      
                    </tr>
                    <tr id="trclear">
                      <td nowrap > 
                        <div align="right">Frecuencia de Cobro :</div>
                      </td>
                      <td nowrap colspan="2"> 
                        <select name="E01CFMFRE" <%if (readOnly.equals("readonly")) {out.println("disabled");} %> >
                          <option value="E" <% if(chgBasic.getE01CFMFRE().equals("E")) out.print("selected");%>>Eventual</option>
                          <option value="S" <% if(chgBasic.getE01CFMFRE().equals("S")) out.print("selected");%>>Semianual</option>
                          <option value="M" <% if(chgBasic.getE01CFMFRE().equals("M")) out.print("selected");%>>Mensual</option>
                          <option value="Q" <% if(chgBasic.getE01CFMFRE().equals("Q")) out.print("selected");%>>Trimestral</option>
                          <option value="Y" <% if(chgBasic.getE01CFMFRE().equals("Y")) out.print("selected");%>>Anual</option>
                        </select>
                        <img src="<%=request.getContextPath()%>/images/Check.gif" title="mandatory field" align="bottom" >
                       </td>
                    </tr>
                    <tr id="trdark"> 
                      <td nowrap> 
                        <div align="right">Moneda :</div>
                      </td>
                      <td nowrap colspan="2"> 
                        <input type="text" name="E01CFMCCY" size="4" maxlength="3" value="<%= chgBasic.getE01CFMCCY().trim()%>"  <%=readOnly%> >
              			<% if (!readOnly.equals("readonly")) {%>
              			  <a href="javascript:GetCurrency('E01CFMCCY','')"><img src="<%=request.getContextPath()%>/images/1b.gif" align="bottom" border="0"></a> 
              			<%}%> 
              			<img src="<%=request.getContextPath()%>/images/Check.gif" title="mandatory field" align="bottom" > 
            		  </td>
                    </tr>
                    <tr id="trclear"> 
                      <td nowrap> 
                        <div align="right">Monto del Cargo :</div>
                      </td>                      
                      <td nowrap colspan="2"> 
                         <input type="text" name="E01CFMVAL" size="17" maxlength="16" value="<%= chgBasic.getE01CFMVAL().trim()%>" onkeypress="enterDecimal()" <%=readOnly%> >
                         <img src="<%=request.getContextPath()%>/images/Check.gif" title="mandatory field" align="bottom" >
                      </td>
                    </tr>
                    <tr id="trdark"> 
                      <td nowrap> 
                        <div align="right">Cobro I.V.A :</div>
                      </td>
                      <td nowrap colspan="2"> 
                        <input type="radio" name="E01CFMIVA" value="2" <% if (!chgBasic.getE01CFMIVA().trim().equals("N")) out.print("checked");%> <%if (readOnly.equals("readonly")) out.println("disabled"); %> >SI
                        <input type="radio" name="E01CFMIVA" value="N" <% if (chgBasic.getE01CFMIVA().trim().equals("N")) out.print("checked");%> <%if (readOnly.equals("readonly")) out.println("disabled"); %> >NO
                        <%--<a href="javascript:GetLedger('E01CFMGLN','',document.forms[0].E01CFMCCY.value,'')"><img src="${pageContext.request.contextPath}/images/1b.gif" align="bottom" border="0" title="help" ></a> --%>                
                        <img src="<%=request.getContextPath()%>/images/Check.gif" title="mandatory field" align="bottom" >
                      </td>
                    </tr>
			
			  <tr id="trclear"> 
                      <td nowrap> 
                        <div align="right">Cuenta Contable :</div>
                      </td>
                      <td nowrap  colspan="2">
                      <INPUT type="text" name="E01CFMGLN" id="E01CFMGLN" size="17" maxlength="16"
				     	value="<%= chgBasic.getE01CFMGLN().trim()%>"
					    onkeypress="enterInteger(event)" 
					    onchange="document.getElementById('E01CFMCRE').value=''"  
					    <%=readOnly%>>
                      <A href="javascript:document.getElementById('E01CFMCRE').value='';GetLedger('E01CFMGLN','<%= currUser.getE01UBK() %>',document.forms[0].E01CFMCCY.value,'')"
                        >
					    <IMG src="<%=request.getContextPath()%>/images/1b.gif" align="bottom"
					      border="0" title="help">
					  </A>
					  <img src="<%=request.getContextPath()%>/images/Check.gif" title="mandatory field" align="bottom" >
					</td></tr>
			
					
			  <TR id="trclear">
				<TD nowrap align="right">Cuenta Detalle :</TD>
				
				<TD nowrap  colspan="2">
				<INPUT 	type="text" name="E01CFMCRE" id="E01CFMCRE" size="13" maxlength="12"
					value="<%=chgBasic.getE01CFMCRE().trim()%>"
					onkeypress="enterInteger(event)" 
					onchange="document.getElementById('E01CFMGLN').value=''"
				<%=readOnly%>>
				  <A href="javascript:document.getElementById('E01CFMGLN').value='';GetAccount('E01CFMCRE','','RT','')"><IMG
					src="<%=request.getContextPath()%>/images/1b.gif" title=""
					align="middle" border="0"></A>
					<img src="<%=request.getContextPath()%>/images/Check.gif" title="mandatory field" align="bottom" >
				</TD></TR>
		    			
			<tr id="trdark" > 
                      <td nowrap>
                      <div align="right">Fecha Proximo Pago:</div>
                      </td>
                      <td nowrap colspan="2"> 
						<eibsinput:date name="chgBasic" fn_year="E01CFMFPY" fn_month="E01CFMFPM" fn_day="E01CFMFPD" required="true" />
                      </td>                     
                    </tr>                   
                  </table>
      </td>
    </tr>
  </table>
  
  <p align="center"> 
  	<input id="EIBSBTN" type=submit name="Submit" value="Enviar">
  </p>
  </form>
    <%--
      <script type="text/javascript" >
       //util = new EventUtils();
       EventUtils.addEventListener(document.getElementById("ledger"),'change',selectAccount);
       EventUtils.addEventListener(document.getElementById("detail"),'change',selectAccount);
    </script>
    --%>
  
</body>
</html>
