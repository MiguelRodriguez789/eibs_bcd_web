<html> 

<head>

<META HTTP-EQUIV="Pragma" CONTENT="No-cache">

<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">

<META http-equiv="Content-Style-Type" content="text/css">

<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">


<SCRIPT SRC="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>


<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>

<jsp:useBean id= "msgHelp" class= "datapro.eibs.beans.JBObjList"   scope="session"/>


<SCRIPT type="text/javascript">

	setTimeout("top.close()", <%= datapro.eibs.master.JSEIBSProp.getPopUpTimeOut() %>);

</SCRIPT>

<script type="text/javascript">

//<!-- Hide from old browsers

function enterFields(code, desc,type, typeDsc, location, locDsc, serial, numKeys  ) {

  	top.opener.document.forms[0][top.opener.fieldName].value = code;
 	top.opener.document.forms[0][top.opener.fieldDesc].value = desc;
  	top.opener.document.forms[0][top.opener.fieldAux1].value = type;
 	top.opener.document.forms[0][top.opener.fieldAux2].value = typeDsc;
  	top.opener.document.forms[0][top.opener.fieldAux3].value = location;
  	top.opener.document.forms[0][top.opener.fieldAux4].value = locDsc;
  	top.opener.document.forms[0][top.opener.fieldAux5].value = serial;
  	top.opener.document.forms[0][top.opener.fieldAux6].value = numKeys;

  	top.opener.document.forms[0][top.opener.fieldName].focus();

  	top.close();

 }



//-->

</script>


<title>Cajas de Seguridad Disponibles </title>

</head>

<%@ page import="datapro.eibs.master.Util" %>


<body>

<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.helps.JSEWD0370&SCREEN=1">

<H3 align="center">Cajas de Seguridad Disponibles</H3>

<%

	if ( msgHelp.getNoResult() ) {

%>

<TABLE class="tbenter" width=100% height="100%">

	<TR>

      <TD> 

      	<div align="center">

		 	<b>No hay resultados para su criterio de busqueda </b>

		</div>

      </TD>

    </TR>

</TABLE>

<%  

		}

	else {

%>	


<TABLE class="tableinfo" align="center" style="width:'95%'">

	<TR id="trdark"> 

    	<th>Número de Caja</th>

    	<th>Descripción</th>

    	<th>Ubicación</th>
    	
    	<th>No. Serie</th>

  	</tr>

  <%

		msgHelp.initRow();

        while (msgHelp.getNextRow()) {

			datapro.eibs.beans.EWD0750DSMessage msg = (datapro.eibs.beans.EWD0750DSMessage) msgHelp.getRecord();

     	%>    

    <TR>

		<td nowrap align="center"><a href="javascript:enterFields('<%= msg.getRBSCOD()%>','<%= msg.getRBSDSC()%>', '<%= msg.getRBSTYP()%>','<%= msg.getTYPDSC()%>','<%= msg.getRBSLOC()%>','<%= msg.getLOCDSC()%>', '<%= msg.getRBSSER()%>','<%= msg.getRBSKNU()%>' )"><%= Util.formatCell(msg.getRBSCOD())%></a></td>

		<td nowrap align="center"><a href="javascript:enterFields('<%= msg.getRBSCOD()%>','<%= msg.getRBSDSC()%>', '<%= msg.getRBSTYP()%>','<%= msg.getTYPDSC()%>','<%= msg.getRBSLOC()%>','<%= msg.getLOCDSC()%>', '<%= msg.getRBSSER()%>','<%= msg.getRBSKNU()%>')"><%= Util.formatCell(msg.getRBSDSC())%></a></td>

		<td nowrap align="left"><a href="javascript:enterFields('<%= msg.getRBSCOD()%>','<%= msg.getRBSDSC()%>', '<%= msg.getRBSTYP()%>','<%= msg.getTYPDSC()%>','<%= msg.getRBSLOC()%>','<%= msg.getLOCDSC()%>', '<%= msg.getRBSSER()%>','<%= msg.getRBSKNU()%>')"><%= Util.formatCell(msg.getRBSLOC())%></a></td>

		<td nowrap align="left"><a href="javascript:enterFields('<%= msg.getRBSCOD()%>','<%= msg.getRBSDSC()%>', '<%= msg.getRBSTYP()%>','<%= msg.getTYPDSC()%>','<%= msg.getRBSLOC()%>','<%= msg.getLOCDSC()%>', '<%= msg.getRBSSER()%>','<%= msg.getRBSKNU()%>')"><%= Util.formatCell(msg.getRBSSER())%></a></td>

	</TR>   	

		<%} %>	

</TABLE>

 

<%

   }  

%>

</form>

</body>

</html>