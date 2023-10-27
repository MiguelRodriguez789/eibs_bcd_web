<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@ page import = "datapro.eibs.master.Util" %>
<%@page import="com.datapro.constants.EibsFields"%>
<%@page import="com.datapro.eibs.constants.HelpTypes"%>

<html>
<title>Tasa de Reajuste</title>
<head>
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>

<jsp:useBean id="msgList" class="datapro.eibs.beans.ESD040001Message"  scope="session" />
<jsp:useBean id="error"  class="datapro.eibs.beans.ELEERRMessage"  scope="session"/>
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" 	scope="session" />
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />
<%
	boolean readOnly=false;
	String READ_ONLY_TAG=""; 
%> 

<%
	if (userPO.getOption().equals("C")){
		readOnly=true;
		READ_ONLY_TAG="readonly";
	} else {
		readOnly=false;
		READ_ONLY_TAG="";
	}
%>


<script src="<%=request.getContextPath()%>/jquery/readOnlyPage.jsp"> </script>


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
 <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/servlet/datapro.eibs.params.JSESD0400" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" id="SCREEN" VALUE="3">
  <input type=HIDDEN name="E01SELMONT" value="<%= msgList.getE01SELMONT().trim()%>">
  <input type=HIDDEN name="E01SELYEAR" value="<%= msgList.getE01SELYEAR().trim()%>">
  <input type=HIDDEN name="E01SELMONE" value="<%= msgList.getE01SELMONE().trim()%>">  
  <INPUT TYPE="hidden" NAME="H01FLGMAS" value="A">

  <h3 align="center">
  <% if (userPO.getOption().equals("M")) out.print("Mantenimiento Tasa de Reajuste");
      else out.print("Tasa de Reajuste");%> 
     <img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="UF_IVP_maint.jsp,ESD0400"> 
  </h3>
  <hr size="4">
  
<BR> 
<TABLE class="tableinfo" align="center" >
	<TR>
		<TD>
			<TABLE width="100%" border="0" cellspacing="1" cellpadding="0">
         	 <TR id="trclear">
            <td nowrap width="50%" align="right">Moneda :</td>
            <TD nowrap width="50%" align="left"> 
              <select id="E01SELMONE" name="E01SELMONE" disabled>
                <option value=" " <% if (!(msgList.getE01SELMONE().equals("2") ||msgList.getE01SELMONE().equals("3"))) out.print("selected"); %>></option>
				<%if(currUser.getE01INT().equals("05")){%>
                <option value="2" <% if (msgList.getE01SELMONE().equals("2")) out.print("selected"); %>>Reajuste UVR</option>
				<% } else { %>
                <option value="2" <% if (msgList.getE01SELMONE().equals("2")) out.print("selected"); %>>Reajuste UFS</option>
				<% }%>
                <option value="3" <% if (msgList.getE01SELMONE().equals("3")) out.print("selected"); %>>Reajuste IPV/Chile</option>
                <option value="4" <% if (msgList.getE01SELMONE().equals("4")) out.print("selected"); %>>Reajuste USD/Chile</option>
                <option value="5" <% if (msgList.getE01SELMONE().equals("5")) out.print("selected"); %>>Valor Ajuste/PERU</option>
                 </select>
            </TD>
		  	</TR>
		 	 <tr id="trclear">
            <td nowrap width="50%" align="right">Mes :</td>
            <td nowrap width="50%" align="left"> 
                <eibsinput:text id="E01SELMONT" name="msgList" property="E01SELMONT" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_MONTH %>" readonly = "true"/>
            </td>
 		  </tr>
 		  <tr id="trclear">
		   <TD nowrap width="50%" align="right">Año :</TD>
			<TD nowrap width="50%" align="left">
               <eibsinput:text id="E01SELYEAR" name="msgList" property="E01SELYEAR" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_YEAR %>" readonly="true"/>
            </TD>
		     </tr>
			</TABLE>
			</TD>
		</TR>
</TABLE>
<BR>
<%	if (!READ_ONLY_TAG.equals("") &&   msgList.getE01UFIVM01().equals("0"))  { %>  
          <p>
            <b>No existen registros para su seleccion.</b>
          </p>
<%	} else {	%>
  <TABLE  id="mainTable" class="tableinfo" style="height:353px; width: 330px;" align="center">
    <tr  height="5%"> 
      <td NOWRAP valign="top" width="100%"> 
		<table id="headTable" width="100%">
			<tr id="trdark">
		      <th align="center" nowrap width="15%" >Fecha</th>
		      <th align="center" nowrap width="70%" >Valor</th>
		      <th align="center" nowrap width="15%" >Variaci&oacute;n</th>
			</tr>
        </table>
      </td>
    </tr>    
		  <tr  height="95%">    
		    <td nowrap="nowrap">      
		       <div id="dataDiv1" style="height:353px; overflow:auto; width: 330px"> 
		       <table id="dataTable" cellspacing="0" cellpadding="1" border="0" width="100%">         
					<%
					String index = "0" ;
					for(int i = 1; i <= 31; i++){
					   if (i< 10) index="0"+i; else index="" +i;
					   if (!msgList.getField("E01UFIVD"+index).getString().trim().equals("0")) {
					%>	
					<tr>
						<td style="visibility:hidden">
							<input type=HIDDEN name="<%="E01UFIVD"+index %>" value="<%= msgList.getField("E01UFIVD"+index).getString().trim()%>">
						</td>
						<td align="center" width="15%">
							<% if (currUser.getE01DTF().equals("DMY")){ %>
								<%= msgList.getField("E01UFIVD"+index).getString().trim()%>/<%=msgList.getE01SELMONT()%>/<%=msgList.getE01SELYEAR()%>
							<% } else if(currUser.getE01DTF().equals("MDY")){ %>
								<%=msgList.getE01SELMONT()%>/<%= msgList.getField("E01UFIVD"+index).getString().trim()%>/<%=msgList.getE01SELYEAR()%>
							<% } else {  %>
								<%=msgList.getE01SELYEAR()%>/<%=msgList.getE01SELMONT()%>/<%=msgList.getField("E01UFIVD"+index).getString()%>
							<% } %>
						</td>
						<td align="center"  nowrap width="70%">
							<%if (msgList.getField("E01UFIVF"+index).getString().trim().equals("B")) {%>
								<input size="18" maxlength="12" name="<%="E01UFIVM"+index %>" value="<%= msgList.getField("E01UFIVM"+index).getString().trim()%>" class="TXTRIGHT" <%= READ_ONLY_TAG %> readonly>
								<br>	
							<% } else { %>	
						 		<input size="18" maxlength="12" name="<%="E01UFIVM"+index %>" value="<%= msgList.getField("E01UFIVM"+index).getString().trim()%>" class="TXTRIGHT" <%= READ_ONLY_TAG %> onkeypress="enterDecimal()">
								<br>
							<%  }  %>	
						</td>
						<td align="center"  nowrap width="15%">
							<%if (msgList.getField("E01UFIVF"+index).getString().trim().equals("B")) {%>
								<input size="9" maxlength="7" name="<%="E01UFIVA"+index %>" value="<%= msgList.getField("E01UFIVA"+index).getString().trim()%>" class="TXTRIGHT" <%= READ_ONLY_TAG %> readonly>
								<br>	
							<% } else { %>	
						 		<input size="9" maxlength="7" name="<%="E01UFIVA"+index %>" value="<%= msgList.getField("E01UFIVA"+index).getString().trim()%>" class="TXTRIGHT" <%= READ_ONLY_TAG %> onkeypress="enterDecimal()">
								<br>
							<%  }  %>	
						</td>					
					</tr>			
					<% }
					  }%>
             </table>
             </div>
             </td>
             </tr>
</table>

<%	if (READ_ONLY_TAG.equals("")) { %>  
  <div align="center"> 
    <input id="EIBSBTN" type=submit name="Submit" value="Enviar">
  </div>
<%	} 	%> 
<%	} 	%>     
</form>
</body>
</html>
