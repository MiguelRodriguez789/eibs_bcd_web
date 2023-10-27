<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@ page import="com.datapro.constants.EibsFields"%>
<%@page import="com.datapro.eibs.constants.HelpTypes"%>
<%@ page import="datapro.eibs.master.*"%>
<html>
<head>
<title>Cliente - Cambio de Estado </title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
</head>

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "client" class= "datapro.eibs.beans.ESD008201Message"  scope="session" />
<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session"/>

<body >


<h3 align="center">Cliente - Cambio de Estatus <img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="status_maint, ESD0082"></h3>
<hr size="4">
<p>&nbsp;</p>
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSEXESD0082" >
  <p> 
    <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="201">
  </p>

<%int row = 0; %>
 <table class="tableinfo" >
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
          <tr id="trdark">
            <td nowrap width="15%" > 
              <div align="right"><b>Cliente :</b></div>
            </td>
            <td nowrap width="10%" > 
              <div align="left">
              	<eibsinput:text property="E01CUSCUN" name="client" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_CUSTOMER %>" readonly="true"/>
			  </div>
            </td>
            <td nowrap width="10%" > 
              <div align="right"><b>Nombre :</b> </div>
            </td>
            <td nowrap width="35%"> 
              <div align="left">
              	<eibsinput:text property="E01CUSNA1" name="client" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_NAME %>" readonly="true"/>
              </div>
            </td>
            <td nowrap width="10%"> 
              <div align="right"><b>IDN : </b></div>
            </td>
            <td nowrap width="20%"> 
              <div align="left">
              	<eibsinput:text property="E01CUSIDN" name="client" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_IDENTIFICATION %>" readonly="true"/>
              </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
</table>
<br>
  <table class=tbenter>
   <tr > 
      <td nowrap style="width:8%">
   		<b>ESTADO ACTUAL:</b>
      </td>
      <td nowrap style="width:25%"> 
   		<div align="left"><b><font color="#ff6600"><% if(client.getE01OLDSTS().trim().equals("1")) { out.print(" Inactivo");}
   									if(client.getE01OLDSTS().trim().equals("2")) { out.print(" Activo") ;}  
   									if(client.getE01OLDSTS().trim().equals("3")) { out.print(" Lista de Control") ;} 
   									if(client.getE01OLDSTS().trim().equals("4")) { out.print(" Fallecido");} 
   									if(client.getE01OLDSTS().trim().equals("5")) { out.print(" Bloqueado permite Pagos");} 
   									if(client.getE01OLDSTS().trim().equals("6")) { out.print(" Bloqueado Total");} %>
   		</font></b></div>
      </td>
      <td nowrap> 
      </td>
      <td nowrap align=left> 
      </td>
    </tr>
  </table>
  <h4>Datos B&aacute;sicos de la Operaci&oacute;n</h4> 
<table class="tableinfo">
  <tr > 
    <td nowrap> 
      <table cellpadding=2 cellspacing=0 width="100%" border="0">
		<tr class="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
              <td nowrap width="15%" align="right">
              	Nuevo Estado :
              </td>
            <td nowrap width="35%" align="left">
              <select name="E01NEWSTS" id="E01NEWSTS" >
				<option value=" " <% if (!(client.getE01NEWSTS().equals("1")||client.getE01NEWSTS().equals("2")||client.getE01NEWSTS().equals("3") || client.getE01NEWSTS().equals("4") || client.getE01NEWSTS().equals("5") || client.getE01NEWSTS().equals("6"))) out.print("selected"); %>> </option>               
               <%if(!client.getE01OLDSTS().equals("1")) {%> 
               		<option value="1" <% if (client.getE01NEWSTS().equals("1")) out.print("selected"); %> >Inactivo</option>
    		   <% } %>
               <%if(!client.getE01OLDSTS().equals("2")) {%> 
	                <option value="2" <% if (client.getE01NEWSTS().equals("2")) out.print("selected"); %> >Activo</option>
    		   <% } %>
               <%if(!client.getE01OLDSTS().equals("3")) {%> 
	                <option value="3" <% if (client.getE01NEWSTS().equals("3")) out.print("selected"); %> >Lista de Control </option>
    		   <% } %>
               <%if(!client.getE01OLDSTS().equals("4")) {%> 
					<option value="4" <% if (client.getE01NEWSTS().equals("4")) out.print("selected"); %> >Fallecido/Difunto</option>
    		   <% } %>
               <%if(!client.getE01OLDSTS().equals("5")) {%> 
					<option value="5" <% if (client.getE01NEWSTS().equals("5")) out.print("selected"); %> >Bloqueado permite Pagos</option>
    		   <% } %>
               <%if(!client.getE01OLDSTS().equals("6")) {%> 
					<option value="6" <% if (client.getE01NEWSTS().equals("6")) out.print("selected"); %> >Bloqueado Total</option>
    		   <% } %>
			 </select>	
             </td>
		</tr>
		<tr class="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
              <td nowrap width="15%" align="right">
              	Causal :
              </td>
            	<td nowrap width="35%" align="left">
            	<eibsinput:help name ="client" fn_param_one="E01CODCAU" fn_param_two="E01DSCCAU" fn_param_three="FU" fn_param_four=" " help="<%=HelpTypes.TIME_DEPOSITS_REASON_STOP_PAYMENT%>" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_CNOFC%>" property="E01CODCAU" /> 
				<eibsinput:text name="client" property="E01DSCCAU" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DESCRIPTION%>" readonly="TRUE"/>
              </td>
		</tr>
        <tr class="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
              <td nowrap width="15%" align="right">
              	Motivo :
              </td>
            	<td nowrap width="35%" align="left">
            	<eibsinput:help name ="client" fn_param_one="E01CODMTV" fn_param_two="E01DSCMTV" fn_param_three="FM" fn_param_four="document.forms[0].E01CODCAU.value" help="<%=HelpTypes.TIME_DEPOSITS_REASON_STOP_PAYMENT%>" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_CNOFC%>"  property="E01CODMTV"/> 
				<eibsinput:text name="client" property="E01DSCMTV" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DESCRIPTION%>" readonly="TRUE"/>
              </td>
		</tr>            
          	<tr class="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
              <td nowrap width="15%" align="right">Comentarios :</td>
              <td nowrap width="35%" align="left">
              	<textarea name="E01REMARK" cols="64" rows="4" ><%=Util.formatCell(client.getE01REMARK().trim())%></textarea>
              </td>
		</tr>	
	</table>
   </td>
 </tr>
</table>    
  <% if(!(userPO.getPurpose().equals("INQUIRY") || userPO.getPurpose().equals("APPROVAL") || userPO.getPurpose().equals("APPROVAL_INQ"))) {%>
	<div align="center"> 
    	<input id="EIBSBTN" type=submit name="Submit" value="Enviar">
  	</div>
  <% } else { %>	
  	<script src="<%=request.getContextPath()%>/jquery/readOnlyPage.jsp"> </script>
  	<script type="text/javascript">
readOnlyPage();</script>

  <% } %>
<% 
 if ( !error.getERRNUM().equals("0")  ) {
      error.setERRNUM("0");
 %>
     <SCRIPT type="text/javascript">;
            showErrors();
     </SCRIPT>
 <%
 }
%>
</form>
</body>
</html>
