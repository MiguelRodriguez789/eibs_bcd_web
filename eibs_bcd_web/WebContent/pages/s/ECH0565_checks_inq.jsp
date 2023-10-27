<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput"%>
<%@ page import="datapro.eibs.master.Util,datapro.eibs.beans.ECH056502Message"%>


<%@page import="com.datapro.constants.EibsFields"%><HTML>
<HEAD>
<TITLE>Lista de Cheques</TITLE>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "checks" class= "datapro.eibs.beans.JBObjList" scope="session" />
<jsp:useBean id="rtBasic" class="datapro.eibs.beans.ECH056503Message"  scope="session" />
<jsp:useBean id="userPO" class= "datapro.eibs.beans.UserPos" scope="session" />
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" /> 
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage" scope="session" />

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>

</head>

<body>

<h3 align="center">Consulta de Chequeras<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="checks_inq.jsp,ECH0565"></h3>
<hr size="4">
<FORM Method="post" Action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSECH0565" >
<INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="2">

<% 	if ( checks.getNoResult() ) {  %>

   		<TABLE class="tbenter" width=100% height=100%>
   		<TR>
      <TD> 
        <div align="center">
        		<font size="3"><b>
        				No hay resultados que correspondan a su criterio de búsqueda 
        		</b></font>
        	</div>
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
  
  <br>
  
  <table class="tableinfo">
    <tr> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
         <tr id="trdark"> 
            <td nowrap width="16%" > 
              <div align="right"><b>Numero de Chequera :</b></div>
            </td>
            <td nowrap width="20%" > 
              <div align="left"> 
                <input type="text" name="BOOKNUM" size="13" maxlength="12" value="<%= userPO.getHeader9().trim()%>" readonly>
              </div>
            </td>
 		</tr>
 	</table>  
  </td>
  </tr>
  </table>
  
<h4></h4> 
  
 <table  id=cfTable class="tableinfo" height="55%">
    <tr  height="5%"> 
      <td NOWRAP valign="top" width="100%"> 
		<table id="headTable" width="98%">
		    <TR id ="trdark"> 
		      <TH ALIGN=CENTER width="10%">Cheque</TH>
		      <TH ALIGN=CENTER width="10%">Status</TH>
		      <TH ALIGN=CENTER width="10%">Cheque</TH>
		      <TH ALIGN=CENTER width="10%">Status</TH>
		      <TH ALIGN=CENTER width="10%">Cheque</TH>
		      <TH ALIGN=CENTER width="10%">Status</TH>
		      <TH ALIGN=CENTER width="10%">Cheque</TH>
		      <TH ALIGN=CENTER width="10%">Status</TH>
		      <TH ALIGN=CENTER width="10%">Cheque</TH>
		      <TH ALIGN=CENTER width="10%">Status</TH>
		    </TR>
	    </table>
    </td>
   </tr>

		  <tr  height="95%">    
		    <td nowrap="nowrap">       
		       <div id="dataDiv1" style="width:100%; height:100%; overflow:auto;"> 
		       <table id="dataTable" cellspacing="0" cellpadding="1" border="0" width="100%">         

    <%
                checks.initRow();
				boolean firstTime = true;
				String chk = "";
                while (checks.getNextRow()) {
 					if (firstTime) {
						firstTime = false;
						chk = "checked";
					} else {
						chk = "";
					}
					ECH056502Message menu = (ECH056502Message) checks.getRecord();
    %> 
 		<tr id="dataTable<%= checks.getCurrentRow() %>">
			<td nowrap align="center" width="10%"><%=menu.getE02CHMN01()%></td>
			<td nowrap align="center" width="10%"><%=menu.getE02CHMS01()%></td>
			<td nowrap align="center" width="10%"><%=menu.getE02CHMN02()%></td>
			<td nowrap align="center" width="10%"><%=menu.getE02CHMS02()%></td>
			<td nowrap align="center" width="10%"><%=menu.getE02CHMN03()%></td>
			<td nowrap align="center" width="10%"><%=menu.getE02CHMS03()%></td>
			<td nowrap align="center" width="10%"><%=menu.getE02CHMN04()%></td>
			<td nowrap align="center" width="10%"><%=menu.getE02CHMS04()%></td>
			<td nowrap align="center" width="10%"><%=menu.getE02CHMN05()%></td>
			<td nowrap align="center" width="10%"><%=menu.getE02CHMS05()%></td>
		</tr>
<% }%>
		  
        </table>
        </div>
        </td>
        </tr>
    </table>

<div align="center"><br>
	<input id="EIBSBTN" type="button" value="Regresar" onClick='window.history.go(-1)' name="button"> 
</div>
  
<% } %>

 
  
</FORM>

</BODY>
</HTML>
