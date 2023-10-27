<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@ page import = "datapro.eibs.master.Util" %>
<%@page import="com.datapro.constants.EibsFields"%>

<html>
<head>
<title>Mantenimiento - Cajas de Seguridad Disponibles</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "msgPart" class= "datapro.eibs.beans.ESB020001Message" scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage" scope="session" />
<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos" scope="session"/>

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>

<SCRIPT type="text/javascript">
function enterAction(code,numc,id,prod,card,apc) {
	
	if (card =="") 
		document.forms[0].fieldName.value = code; 
	else 
		document.forms[0].fieldName.value = card;
 }
</SCRIPT>


<% 
if ( !error.getERRNUM().equals("0")  ) {
      error.setERRNUM("0");
%>
<SCRIPT type="text/javascript">
        showErrors();
</SCRIPT>
<%}%>

</head>
<body>
<%
String title = "";
if (userPO.getPurpose().equals("NEW")){
	title = "Nueva";
} else {
	title = "Mantenimiento";
}

 %>
<H3 align="center"><%=title %> Caja de Seguridad - Disponibles para Alquiler<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="safe_deposit_availables_maintenance, ESB0200"></H3>
<hr size="4">


<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.safedeposit.JSESB0200">
 
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="500">
   <INPUT TYPE=HIDDEN NAME="E01SBSBNK" VALUE="<%=msgPart.getE01SBSBNK()%>">
  
  <table class="tableinfo">
   <tr> 
   <td>
    <table cellspacing=0 cellpadding=2 width="100%" border="0">    
     	<tr id=trclear> 
	      <td nowrap width="40%"> 
	        <div align="right">Número : </div>
	      </td> 
		  <td nowrap width="60%" colspan="7">
		  	<input type="text" name="E01SBSCOD" size="15" maxlength="12" value="<%= msgPart.getE01SBSCOD() %>"  <%if (!userPO.getPurpose().equals("NEW")){out.print("readonly");}%> />
			<img src="<%=request.getContextPath()%>/images/Check.gif" title="mandatory field" align="bottom" border="0" > 
		  </td>
			</tr>
      	<tr id=trdark> 
	      <td nowrap> 
	        <div align="right">Tipo : </div>
	      </td>
				<td nowrap colspan="3">
					<div align="left">
						<input type="text" name="E01SBSTYP" size="5" maxlength="4" value="<%= msgPart.getE01SBSTYP() %>">
						<eibsinput:text property="D01SBTDSC" name="msgPart" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true"/>
						<a href="javascript:GetDepositType('E01SBSTYP','D01SBTDSC')"> 
						<img src="<%=request.getContextPath()%>/images/1b.gif" title="Help" align="bottom" border="0"></a> 
						<img src="<%=request.getContextPath()%>/images/Check.gif" title="mandatory field" align="bottom" border="0">
					</div>
				</td>
			</tr>
     	<TR id=trclear>
	      <td nowrap> 
	        <div align="right">Ubicación : </div>
	      </td>
				<td nowrap colspan="3">
					<div align="left">
						<input type="text" name="E01SBSLOC" size="4" maxlength="3" value="<%= msgPart.getE01SBSLOC() %>">
						<eibsinput:text property="D01LOCNME" name="msgPart" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true"/> 
						<A href="javascript:GetLocations('E01SBSLOC','D01LOCNME')">
						<IMG src="<%=request.getContextPath()%>/images/1b.gif" title="Help" align="bottom" border="0">
						</A> 
						<img src="<%=request.getContextPath()%>/images/Check.gif" title="mandatory field" align="bottom" border="0">
					</div>
				</td>
			</TR>
     	<tr id=trdark> 
	      <td nowrap> 
	        <div align="right">Descripción : </div>
	      </td>
				<td nowrap colspan="3">
					<div align="left">
						<eibsinput:text property="E01SBSDSC" name="msgPart" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="false"/> 
						<img src="<%=request.getContextPath()%>/images/Check.gif" title="mandatory field" align="bottom" border="0">
					</div>
				</td>
			</tr>
    	<tr id=trclear>
            <td nowrap width="17%" >
              <div align="right">Fecha Recepción :</div>
            </td>
              <td nowrap > 
                <div align="left">
					<%if (userPO.getPurpose().equals("NEW")){%>
                		<eibsinput:date name="msgPart" fn_month="E01SBSRCM" fn_day="E01SBSRCD" fn_year="E01SBSRCY" />
					<% } else {%>	                
                		<eibsinput:date name="msgPart" fn_month="E01SBSRCM" fn_day="E01SBSRCD" fn_year="E01SBSRCY" readonly="true" />
                	<% } %>
                </div>
              </td>
				<TD nowrap></TD>
				<TD nowrap></TD>
      	</tr>
      	<TR id=trdark>
		  <td nowrap> 
		     <div align="right">No. Serie Caja de Seguridad : </div>        
		  </td>
      	  <td nowrap> 
      	    <eibsinput:text property="E01SBSSER" name="msgPart" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_INTEGER %>" size="16" maxlength="13" />
      	  </td>
				<TD nowrap></TD>
				<TD nowrap></TD>
      	</TR>
      	<TR id=trclear>
		  <td nowrap> 
		     <div align="right">Cantidad de Llaves Disponibles : </div>        
		  </td>
      	  <td nowrap> 
      	    <input type="text" name="E01SBSKNU" size="5" maxlength="3" value="<%= msgPart.getE01SBSKNU() %>">
      	  </td>
				<TD nowrap></TD>
				<TD nowrap></TD>
      	</TR>
		</table>
    </td>
   </tr>
  </table>
  <br>

  <p align="center"> 
    <input id="ESBSBTN" type="submit" name="Submit" value="Enviar">
  </p>
</form>
</body>
</html>
