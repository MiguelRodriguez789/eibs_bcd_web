<%@page import="datapro.eibs.master.Util"%>
<%@page import="datapro.eibs.beans.*"%>
<html>
<head><title>Fomento Help Page</title>
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "ewd0395help" class= "datapro.eibs.beans.JBObjList"   scope="session"/>
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>

<SCRIPT>
	setTimeout("top.close()", <%= datapro.eibs.master.JSEIBSProp.getPopUpTimeOut() %>);
</SCRIPT>

<script>

function enterFields(code,dsc,cun,nme,prd,ftb,fty,bnk,brn,obk,obr,ocy,ogl, prddsc, floatType, floatDesc) {
	var form = top.opener.document.forms[0];
	if (isValidObject(form[top.opener.fieldCode])) form[top.opener.fieldCode].value = code; 	//Fomento Code
	if (isValidObject(form[top.opener.fieldDesc])) form[top.opener.fieldDesc].value = dsc;		//Fomento Desc
	if (isValidObject(form[top.opener.fieldName])) form[top.opener.fieldName].value = cun;		//CUS NO
	if (isValidObject(form[top.opener.fieldAux1])) form[top.opener.fieldAux1].value = nme;		//CUS NME
	if (isValidObject(form[top.opener.fieldAux2])) form[top.opener.fieldAux2].value = prd;		//CUS PRD
	if (isValidObject(form[top.opener.fieldAux3])) form[top.opener.fieldAux3].value = ftb;		//FLOAT TABLE
	if (isValidObject(form[top.opener.fieldAux4])) form[top.opener.fieldAux4].value = fty;		//FLOAT TYPE
	if (isValidObject(form[top.opener.fieldAux5])) form[top.opener.fieldAux5].value = bnk;		//BANK
	if (isValidObject(form[top.opener.fieldAux6])) form[top.opener.fieldAux6].value = brn;		//BRANCH	
	if (isValidObject(form[top.opener.fieldAux7])) form[top.opener.fieldAux7].value = obk;		//GL BANK
	if (isValidObject(form[top.opener.fieldAux8])) form[top.opener.fieldAux8].value = obr;		//GL BRANCH		
	if (isValidObject(form[top.opener.fieldAux9])) form[top.opener.fieldAux9].value = ocy;		//GL CURRENCY
	if (isValidObject(form[top.opener.fieldAux10])) form[top.opener.fieldAux10].value = ogl;	//GENERAL LEDGER
	if (isValidObject(form[top.opener.fieldAux11])) form[top.opener.fieldAux11].value = prddsc;	//PRODUCT DESCRIPTION
	if (isValidObject(form[top.opener.fieldAux12])) form[top.opener.fieldAux12].value = floatType;	//Float Type
	if (isValidObject(form[top.opener.fieldAux13])) form[top.opener.fieldAux13].value = floatDesc;	//Float Description
	
	if (typeof form[top.opener.fieldCode].onchange === "function" )form[top.opener.fieldCode].onchange();
	
	top.close();
 }

</script>
</head>
<body>

<%if ( ewd0395help.getNoResult() ) {%>
   		<TABLE class="tbenter" width=100% height=100%>
   		<TR>
      <TD> 
      <div align="center"> <font size="3"><b> No hay resultados para su criterio de busqueda  </b></font></div>
      </TD></TR>
   		</TABLE>
<% }else { %>	

      <table class="tableinfo" style="width:98%" ALIGN=CENTER>
			 <tr id="trdark">
			  <th align="center" width="5%">C&oacute;digo</th>
			  <th align="center" width="20%">No. Cliente</th>
			  <th align="center" width="25%">Nombre</th>
			  <th align="center" width="30%" >Descripci&oacute;n</th>
			  <th align="center" width="10%">Tasa Fomento</th>
			  <th align="center" width="10%">Monto Disponible</th>
			 </tr>
		
	<%		
				String arguments;
		        StringBuilder sb = new StringBuilder();
				
				ewd0395help.initRow();
                while (ewd0395help.getNextRow()) {
        	        EWD0395DSMessage msg = (EWD0395DSMessage)ewd0395help.getRecord(); 
		            sb.append("'").append(msg.getEWDCOD()).append("',");
		            sb.append("'").append(msg.getEWDDSC()).append("',");
		            sb.append("'").append(msg.getEWDCUN()).append("',");
		            sb.append("'").append(msg.getEWDNME()).append("',");
		            sb.append("'").append(msg.getEWDPRD()).append("',");
		            sb.append("'").append(msg.getEWDFTB()).append("',");
		            sb.append("'").append(msg.getEWDFTY()).append("',");
		            sb.append("'").append(msg.getEWDBNK()).append("',");
		            sb.append("'").append(msg.getEWDBRN()).append("',");
		            sb.append("'").append(msg.getEWDOBK()).append("',");
		            sb.append("'").append(msg.getEWDOBR()).append("',");
		            sb.append("'").append(msg.getEWDOCY()).append("',");
		            sb.append("'").append(msg.getEWDOGL()).append("',");
		            sb.append("'").append(msg.getEWDDPR()).append("',");
		            sb.append("'").append(msg.getEWDTYP()).append("',");
		            sb.append("'").append(msg.getEWDDTB()).append("'");
		            arguments = sb.toString();
    %> 
    <tr>
    	<td nowrap align="center">
			<a href="javascript:enterFields(<%= arguments%>)">
				<%= Util.formatCell(msg.getEWDCOD())%>
			</a>
		</td>
    	<td nowrap align="center">
			<a href="javascript:enterFields(<%= arguments%>)">
				<%= Util.formatCell(msg.getEWDCUN())%>
			</a>
		</td>
    	<td nowrap align="left">
			<a href="javascript:enterFields(<%= arguments%>)">
				<%= Util.formatCell(msg.getEWDNME())%>
			</a>
		</td>
    	<td nowrap align="left">
			<a href="javascript:enterFields(<%= arguments%>)">
				<%= Util.formatCell(msg.getEWDDSC())%>
			</a>
		</td>
    	<td nowrap align="left">
			<a href="javascript:enterFields(<%= arguments%>)">
				<%= Util.formatCell(msg.getEWDRTE())%>
			</a>
		</td>
    	<td nowrap align="right">
			<a href="javascript:enterFields(<%= arguments%>)">
				<%= Util.formatCell(msg.getEWDBAL())%>
			</a>
		</td>
	</tr>
	<% 
	 sb.setLength(0); // set length of buffer to 0
	 sb.trimToSize(); // trim the underlying buffer
		}
	%> 
  </TABLE>

<%
   }
%>
</body>
</html>					
		