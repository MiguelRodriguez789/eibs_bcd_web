<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@ page import = "datapro.eibs.master.Util" %>
<%@page import="com.datapro.constants.EibsFields"%>
<%@page import="com.datapro.eibs.constants.HelpTypes"%>

<html>
<head>
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>

<jsp:useBean id="holMsg" class="datapro.eibs.beans.ESD011001Message"  scope="session" />
<jsp:useBean id="currUser" class="datapro.eibs.beans.ESS0030DSMessage"  scope="session" />
<jsp:useBean id="error"  class="datapro.eibs.beans.ELEERRMessage"  scope="session"/>
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" 	scope="session" />

<script type="text/javascript">
function enter(){
	  document.forms[0].submit();
	 }
</script> 

</head>
<body>

 <% 
 if ( !error.getERRNUM().equals("0")  ) {
     out.println("<SCRIPT Language=\"Javascript\">");
     error.setERRNUM("0");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
    }
%>
 <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/servlet/datapro.eibs.params.JSESD0110" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="3">
  <input type=HIDDEN name="E01SELCTR" value="<%= holMsg.getE01SELCTR().trim()%>">
  <input type=HIDDEN name="E01SELRGN" value="<%= holMsg.getE01SELRGN().trim()%>">

  <h3 align="center">Mantenimiento Dias Feriados<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="hollidays_maint.jsp,ESD0110"> 
  </h3>
  <hr size="4">
<BR> 
<TABLE class="tableinfo" align="center" width="85%">
	<TBODY>
		<TR>
			<TD>
			<TABLE width="100%" border="0" cellspacing="1" cellpadding="0">
				<TBODY>
					<TR id="trdark">
						<TD nowrap width="16%" align="right">Pais :</TD>
						<TD nowrap width="16%" align="left">
  				            <eibsinput:text name="holMsg" property="E01HOLCTR" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CNOFC %>" readonly="true"/>
						</TD>
						<%
 						if (holMsg.getE01HOLRGN().trim().equals("")){
						%> 						
						<TD nowrap width="16%" align="right">Feriado Nacional</TD>
 						<%} else {%>
						<TD nowrap width="16%" align="right">Region :</TD>
						<TD nowrap width="16%" align="left">
  				            <eibsinput:text name="holMsg" property="E01HOLRGN" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CNOFC %>" readonly="true"/>
						</TD>
 						<%}%>
						<TD nowrap width="16%" align="right">Año :</TD>
						<TD nowrap width="16%" align="left">
  				            <eibsinput:text name="holMsg" property="E01SELYEAR" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_INTEGER %>" size="5" maxlength="4" readonly="true"/>
						</TD>
					</TR>
				</TBODY>
			</TABLE>
			</TD>
		</TR>
	</TBODY>
</TABLE>
<BR>
<TABLE class="tableinfo" align="center" >
	<TBODY>
		<TR align="center">
			<TD>
				<div style="height:400px; overflow-y: scroll">
			<TABLE width="100%" align="center" cellspacing="1" cellpadding="0">
				<tr id="trdark">
					<td  align="center" valign="top" width="50%">Fecha del Feriado &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  Eliminar</td>
				</tr>
				<tr>
				<td  align="center" width="50%">
					
		       		<% 	String seq="";
		       			String Readonly="";
		       			for (int i=1; i<180; i++) {
			            if (i < 10){
			             seq = "00"+i; 
			             } else if (i < 100) {
			             seq = "0"+i; 
			             } else {
			              seq = ""+i;
			             }
		       		%>
       			<tr id="trclear"> 
            		<td nowrap width="10%" align="center">
            			<%if (holMsg.getFieldString("E01HOY"+seq).equals("0")){
            				Readonly="";
            				 } else {
            				Readonly="readonly";
            				 } %>
					      <%if(currUser.getE01DTF().equals("YMD")){%>
				            			<input type=text name="<%="E01HOY"+seq%>" size="5" maxlength="4" value="<%=holMsg.getFieldString("E01HOY"+seq) %>" <%=Readonly %> onKeypress='enterInteger(event)'> 
				            			<input type=text name="<%="E01HOM"+seq%>" size="3" maxlength="2" value="<%=holMsg.getFieldString("E01HOM"+seq) %>" <%=Readonly %> onKeypress='enterInteger(event)'> 
				            			<input type=text name="<%="E01HOD"+seq%>" size="3" maxlength="2" value="<%=holMsg.getFieldString("E01HOD"+seq) %>" <%=Readonly %> onKeypress='enterInteger(event)'> 
					   		 	<%} else if(currUser.getE01DTF().equals("DMY")){%>
				            			<input type=text name="<%="E01HOD"+seq%>" size="3" maxlength="2" value="<%=holMsg.getFieldString("E01HOD"+seq) %>" <%=Readonly %> onKeypress='enterInteger(event)'> 
				            			<input type=text name="<%="E01HOM"+seq%>" size="3" maxlength="2" value="<%=holMsg.getFieldString("E01HOM"+seq) %>" <%=Readonly %> onKeypress='enterInteger(event)'> 
				            			<input type=text name="<%="E01HOY"+seq%>" size="5" maxlength="4" value="<%=holMsg.getFieldString("E01HOY"+seq) %>" <%=Readonly %> onKeypress='enterInteger(event)'> 
					   		 	<%} else {%>
				            			<input type=text name="<%="E01HOM"+seq%>" size="3" maxlength="2" value="<%=holMsg.getFieldString("E01HOM"+seq) %>" <%=Readonly %> onKeypress='enterInteger(event)'> 
				            			<input type=text name="<%="E01HOD"+seq%>" size="3" maxlength="2" value="<%=holMsg.getFieldString("E01HOD"+seq) %>" <%=Readonly %> onKeypress='enterInteger(event)'> 
				            			<input type=text name="<%="E01HOY"+seq%>" size="5" maxlength="4" value="<%=holMsg.getFieldString("E01HOY"+seq) %>" <%=Readonly %> onKeypress='enterInteger(event)'> 
					   		 	<%}%>
							<input size="2" maxlength="2" name="<%="E01HOW"+seq%>" value="<%=holMsg.getFieldString("E01HOW"+seq)%>" readonly>
							<%if(Readonly.equals("")){%>
							<input type="checkbox" name="<%="E01HOF"+seq%>"  value="" disabled>
							<%}else {%>
							<input type="checkbox" name="<%="E01HOF"+seq%>"  value="D" >
							<%} %> 
            		</td>
          		</tr> 
		   		 	<%}%>
			</TABLE>
		</div>
			
			</TD>
		</TR>
	</TBODY>
</TABLE>

<BR>

  
  <p align="center"> 
    <input id="EIBSBTN" type=submit name="Submit" value="Enviar">
  </p>
      
</form>
</body>
</html>
