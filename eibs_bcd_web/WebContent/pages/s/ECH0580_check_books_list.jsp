<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput"%>
<%@page import="com.datapro.constants.EibsFields"%>
<%@ page import="datapro.eibs.master.Util,datapro.eibs.beans.ECH056501Message"%>

<HTML>
<HEAD>
<TITLE>Checkbook Avoid</TITLE>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "checkBooks" class= "datapro.eibs.beans.JBObjList"  scope="session" />
<jsp:useBean id="rtBasic" class="datapro.eibs.beans.ECH056503Message"  scope="session" />
<jsp:useBean id="error" class="datapro.eibs.beans.ELEERRMessage" scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" /> 

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>

<script type="text/javascript">
 
 function goAction(op, bn) { 
	getElement("SCREEN").value = op;
	getElement("BOOKNUM").value = bn;
	document.forms[0].submit();
}

</script> 
</head>

<body>

<%  if ( !error.getERRNUM().equals("0")  ) {
     error.setERRNUM("0");
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
 }
%>

<h3 align="center">Anulacion de Cheques y Chequera<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="check_books_list.jsp, ECH0580"></h3>
<hr size="4">
<FORM Method="post" Action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSECH0580"  onsubmit="return FSubmitValidation()">
<INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="1">
<INPUT TYPE=HIDDEN NAME="BOOKNUM" VALUE="">

<% 	if ( checkBooks.getNoResult() ) {  %>
   		<TABLE class="tbenter" width=100% height=100%>
   		<TR>
      <TD> 
        <div align="center"> <font size="3"><b> No hay resultados para esta cuenta </b></font></div>
      </TD></TR>
   		</TABLE>
 
<% } else { %> 

 <table class="tableinfo">
    <tr> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
          <tr id="trdark"> 
            <td nowrap width="15%" > 
              <div align="right"><b>Cliente :</b></div>
            </td>
            <td nowrap width="15%" > 
              <div align="left"> 
                <input type="text" name="E03ACMCUN" size="9" maxlength="9" value="<%= userPO.getCusNum().trim()%>" readonly>
              </div>
            </td>
            <td nowrap width="10%" > 
              <div align="right"><b>Nombre :</b></div>
            </td>
            <td nowrap width="30%" > 
              <div align="left">
              <eibsinput:text property="E03CUSNA1" name="rtBasic" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_NAME_FULL %>" readonly="true"></eibsinput:text>
              </div>
            </td>
            <td nowrap width="15%" > 
            </td>
            <td nowrap width="15%" > 
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="15%"> 
              <div align="right"><b>Cuenta :</b></div>
            </td>
            <td nowrap width="15%"> 
              <div align="left"> 
                <input type="text" name="E03ACMACC" size="12" readonly maxlength="12" value="<%= userPO.getAccNum().trim()%>" >
              </div>
            </td>
            <td nowrap width="10%"> 
              <div align="right"><b>Moneda : </b></div>
            </td>
            <td nowrap width="30%"> 
              <div align="left"> 
                <input type="text" name="E03ACMCCY" size="4" readonly maxlength="4" value="<%= userPO.getCurrency().trim()%>">
              </div>
            </td>
            <td nowrap width="15%"> 
              <div align="right"><b>Producto : </b></div>
            </td>
            <td nowrap width="15%"> 
              <div align="left"> 
                <input type="text" name="E03ACMPRO" size="4" readonly maxlength="4" value="<%= userPO.getProdCode().trim()%>">
              </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
<BR> 
<h4></h4> 

<table class="tbenter" width="100%" height="10%">
	<tr>
		<td align="center" class="tdbkg" width="20%"><a href="javascript:goAction('1')"><b>Anular <br> Chequera</b></a></td>
		<td align="center" class="tdbkg" width="20%"><a href="javascript:goAction('2')"><b>Anular <br> Cheques</b> </a></td>
	</tr>
</table>
	
  
  <table  id=cfTable class="tableinfo" height="55%">
    <tr  height="5%"> 
      <td NOWRAP valign="top" width="100%"> 
		<table id="headTable" width="98%">
			<tr id="trdark">
		      <TH ALIGN=CENTER rowspan="2" width="4%">&nbsp;</TH>
		      <TH ALIGN=CENTER rowspan="2" width="8%">Numero Chequera</TH>
		      <TH ALIGN=CENTER colspan="2">Fecha</TH>
		      <TH ALIGN=CENTER rowspan="2" width="8%">Estatus Chequera</TH>
		      <TH ALIGN=CENTER rowspan="2" width="8%">Numero de Cheques</TH>
		      <TH ALIGN=CENTER rowspan="2" width="8%">Cheque Inicial</TH>
		      <TH ALIGN=CENTER rowspan="2" width="8%">Cheque Final</TH>
		      <TH ALIGN=CENTER rowspan="2" width="8%">Solicitud Proveedor</TH>
		      <TH ALIGN=CENTER rowspan="2" width="8%">Recibido Proveedor</TH>
		      <TH ALIGN=CENTER rowspan="2" width="8%">Enviado Oficina</TH>
		      <TH ALIGN=CENTER rowspan="2" width="8%">Recibido Oficina</TH>
		      <TH ALIGN=CENTER rowspan="2" width="8%">Entregado Cliente</TH>
   	  	    </tr>
		    <tr id=trdark> 
		      <TH ALIGN=CENTER width="8%">Recibida</TH>
		      <TH ALIGN=CENTER width="8%">Enviada</TH>
			</tr>
        </table>
      </td>
    </tr>    
		  <tr  height="95%">    
		    <td nowrap="nowrap">       
		       <div id="dataDiv1" style="width:100%; height:100%; overflow:auto;"> 
		       <table id="dataTable" cellspacing="0" cellpadding="1" border="0" width="100%">         
    <%
                checkBooks.initRow();
				boolean firstTime = true;
				String chk = "";
                while (checkBooks.getNextRow()) {
					if (firstTime) {
						firstTime = false;
						chk = "checked";
					} else {
						chk = "";
					}
					ECH056501Message list = (ECH056501Message) checkBooks.getRecord();
    %> 
       	<% String answer1 = " ";
   		   String answer2 = " ";
   		   String answer3 = " ";
   		   String answer4 = " ";
   		   String answer5 = " ";
   		   String status = " ";
   		   
   		   if(list.getE01STSSOL().equals("Y")){
   		   		answer1 = "Si";
   		   }else{
   		   		answer1 = "No";
   		   }

   		   if(list.getE01STSRCV().equals("Y")){
   		   		answer2 = "Si";
   		   }else{
   		   		answer2 = "No";
   		   }

   		   if(list.getE01STSENV().equals("Y")){
   		   		answer3 = "Si";
   		   }else{
   		   		answer3 = "No";
   		   }

   		   if(list.getE01STSSUC().equals("Y")){
   		   		answer4 = "Si";
   		   }else{
   		   		answer4 = "No";
   		   }

   		   if(list.getE01STSENT().equals("Y")){
   		   		answer5 = "Si";
   		   }else{
   		   		answer5 = "No";
   		   }

   		   if(list.getE01CHMSTS().equals("A")){
   		   		status = "Anulado";
   		   } else if(list.getE01CHMSTS().equals("1")) {
   		    	status = "1";
	    	} else {
	    		status = " ";
	    	}
 		    	

   		 %>
		<tr id="dataTable<%= checkBooks.getCurrentRow() %>">
			<td nowrap align="center" width="4%"><input type="radio" name="key"	value="<%=checkBooks.getCurrentRow()%>" <%=chk%> onClick="highlightRow('dataTable', <%= checkBooks.getCurrentRow() %>)"/></td>
			<td nowrap align="center" width="8%"><%=list.getE01CHMNCB()%></td>
			<td nowrap align="center" width="8%"><%= Util.formatCustomDate(currUser.getE01DTF(), list.getBigDecimalE01CHMRQM().intValue(), list.getBigDecimalE01CHMRQD().intValue(), list.getBigDecimalE01CHMRQY().intValue())%></td>
			<td nowrap align="center" width="8%"><%=Util.formatCustomDate(currUser.getE01DTF(), list.getBigDecimalE01CHMACM().intValue(), list.getBigDecimalE01CHMACD().intValue(), list.getBigDecimalE01CHMACY().intValue())%></td>
			<td nowrap align="center" width="8%"><%=status%></td>
			<td nowrap align="center" width="8%"><%=list.getE01CHMNTC()%></td>
			<td nowrap align="center" width="8%"><%=list.getE01CHMICK()%></td>
			<td nowrap align="center" width="8%"><%=list.getE01CHMFCK()%></td>
			<td nowrap align="center" width="8%"><%=answer1%></td>
			<td nowrap align="center" width="8%"><%=answer2%></td>
			<td nowrap align="center" width="8%"><%=answer3%></td>
			<td nowrap align="center" width="8%"><%=answer4%></td>
			<td nowrap align="center" width="8%"><%=answer5%></td>
		</tr>
<%} %>
             </table>
             </div>
             </td>
             </tr>
</table>
<% } %>
</FORM>
<SCRIPT type="text/javascript">
	showChecked("key"); 
</SCRIPT>

</BODY>
</HTML>
