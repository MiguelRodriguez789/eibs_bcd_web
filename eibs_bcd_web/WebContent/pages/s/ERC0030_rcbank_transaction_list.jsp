<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput"%>
<%@ page import="datapro.eibs.master.Util,datapro.eibs.beans.ERC000004Message"%>

<!doctype html public "-//w3c//dtd html 4.0 transitional//en">
<%@page import="com.datapro.constants.EibsFields"%>
<html>
<head>
<title>Reconciliacion Bancaria</title>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="<%=request.getContextPath()%>/pages/style.css"
	rel="stylesheet">

<jsp:useBean id="ERC000004List" class="datapro.eibs.beans.JBObjList" scope="session" />
<jsp:useBean id= "rcbank" class= "datapro.eibs.beans.ERC000003Message"  scope="session" />
<jsp:useBean id="error" class="datapro.eibs.beans.ELEERRMessage" scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </script>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>

<script type="text/javascript">


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

<h3 align="center">Bancos a Reconciliar<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="rcbank_transaction_list.jsp,ERC0030"></h3>
<hr size="4">
<form method="POST" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSERC0030">
<input type="hidden" name="SCREEN" value=""> 

<input type="hidden" id="E04RCIUID" name="E04RCIUID" value=""> 


<table  class="tableinfo">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
          <tr id="trdark">
             <td nowrap width="20%" align="right"> Codigo Banco : 
              </td>
             <td nowrap width="30%" align="left">
	  			<eibsinput:text name="rcbank" property="E03RCIRBK" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CNOFC %>" readonly="true"/>
             </td>
             <td nowrap width="20%" align="right"> Nombre : 
               </td>
             <td nowrap width="30%"align="left">
	  			<eibsinput:text name="rcbank" property="E03CUSNA1" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_NAME_FULL %>" readonly="true"/>
             </td>
         </tr>
          <tr id="trclear">
             <td nowrap width="20%" align="right"> Cuenta Banco : </td>
             <td nowrap width="30%" align="left">
	  			<eibsinput:text name="rcbank" property="E03RCICTA" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CHAR %>" size="20" readonly="true"/>
             </td>
             <td nowrap width="20%" align="right"> Cuenta IBS : </td>
             <td nowrap width="30%"align="left">
	  			<eibsinput:text name="rcbank" property="E03RCIACC" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_ACCOUNT %>" readonly="true"/>
             </td>
         </tr>
          <tr id="trdark">
             <td nowrap width="20%" align="right"> Numero Cartola : </td>
             <td nowrap width="30%" align="left">
                 <eibsinput:text name="rcbank" property="E03RCISTN" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_ACCOUNT%>" readonly="true"/>
             </td>
             <td nowrap width="20%" align="right"> Fecha Cartola : </td>
             <td nowrap width="30%"align="left">
    	        <eibsinput:date name="rcbank" fn_year="E03RCISDY" fn_month="E03RCISDM" fn_day="E03RCISDD" readonly="true"/>
             </td>
         </tr>
        </table>
      </td>
    </tr>
</table>

<%
	if (ERC000004List.getNoResult()) {
%>
<table class="tbenter" width=100% height=90%>
	<tr>
		<td>
		<div align="center">
			<font size="3">
				<b> No hay resultados que correspondan a su criterio de búsqueda. </b>
			</font>
		</div>
		</td>
	</tr>
</table>

<% 	} else { %>

	<table id="headTable" width="80%" align="center" cellspacing="0" cellpadding="2">
		<tr id="trclear">
			<th align="left" nowrap width="15%"></th>
			<th align="left" nowrap width="10%">Fecha</th>
			<th align="right" nowrap width="10%">Referencia</th>
			<th align="center" nowrap width="10%">Codigo</th>
			<th align="right" nowrap width="20%">Debito</th>
			<th align="right" nowrap width="20%">Credito</th>
			<th align="left" nowrap width="15%"></th>
		</tr>
		<%
			ERC000004List.initRow();
				int k = 0;
				boolean firstTime = true;
				String chk = "";
				while (ERC000004List.getNextRow()) {
					if (firstTime) {
						firstTime = false;
						chk = "checked";
					} else {
						chk = "";
					}
					ERC000004Message statement = (ERC000004Message) ERC000004List.getRecord();
		%>
		<tr id="trdark">
			<td nowrap align="left"><a></a></td>
			<td nowrap align="left"><a><%= Util.formatDate(statement.getE04RCIBDD(),statement.getE04RCIBDM(),statement.getE04RCIBDY()) %></a></td>
			<td nowrap align="right"><a><%=statement.getE04RCICKN()%></a></td>
			<td nowrap align="center"><a><%=statement.getE04RCICDE()%></a></td>
			<% if (statement.getE04RCIDCC().equals("D")) { %>
			<td nowrap align="right"><a><%=statement.getE04RCIAMT()%></a></td>
			<td nowrap align="left"><a></a></td>
			<% 	} else { %>
			<td nowrap align="left"><a></a></td>
			<td nowrap align="right"><a><%=statement.getE04RCIAMT()%></a></td>
			<% } %>
			<td nowrap align="left"><a></a></td>
		</tr>
		<% } %>
	</table>


<table class="tbenter" width="98%" align="center">
	<tr>
		<td width="50%" align="left">
		<%
			if (ERC000004List.getShowPrev()) {
					int pos = ERC000004List.getFirstRec() - 13;
					out
							.println("<A HREF=\""
									+ request.getContextPath()
									+ "/servlet/datapro.eibs.client.JSERC0340?SCREEN=100&codNum="
									+ request.getAttribute("codNum")
									+ "\"><IMG border=\"0\" src=\""
									+ request.getContextPath()
									+ "/images/s/previous_records.gif\" ></A>");
				}
		%>
		</td>
		<td width="50%" align="right">
		<%
			if (ERC000004List.getShowNext()) {
					int pos = ERC000004List.getLastRec();
					out
							.println("<A HREF=\""
									+ request.getContextPath()
									+ "/servlet/datapro.eibs.client.JSERC0340?SCREEN=100&codNum="
									+ request.getAttribute("codNum")
									+ "\"><IMG border=\"0\" src=\""
									+ request.getContextPath()
									+ "/images/s/previous_records.gif\" ></A>");
				}
		%>
		</td>
	</tr>
</table>
<%
	}
%>
</form>
<SCRIPT type="text/javascript">
	clickElement('NUMIDE', '0');
 	document.getElementById("hiddenDivNew").onclick=cancelBub;
	document.getElementById("eibsNew").onclick=showHiddenDivNew;  
</SCRIPT>
</body>
</html>

