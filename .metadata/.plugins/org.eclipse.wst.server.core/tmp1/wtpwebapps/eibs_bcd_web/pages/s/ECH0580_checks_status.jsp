<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput"%>
<%@ page import="datapro.eibs.master.Util,datapro.eibs.beans.ECH056502Message"%>
<%@page import="com.datapro.constants.EibsFields"%>

<HTML>
<HEAD>
<TITLE> Checks List </TITLE>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "checks" class= "datapro.eibs.beans.JBObjList" scope="session" />
<jsp:useBean id="rtBasic" class="datapro.eibs.beans.ECH056503Message"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" /> 

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script>
  function ValidateF(){
	 if(document.forms[0].ACTION.value == "02"){
 		if( document.forms[0].E01CHMICK.value == "" || document.forms[0].E01CHMFCK.value == ""){
    	    alert("Favor ingresar Rango de cheques a modificar");
        	return false; 		
 		} 
	    var chki = parseInt(document.forms[0].E01CHMICK.value);
 		var chkf = parseInt(document.forms[0].E01CHMFCK.value);	
	    if(!confirm("Esta Seguro que desea cambiar el estado de estos cheques")){
	       return false;
	    } 
 	    if(chki< parseInt(document.forms[0].FCHK.value) || chkf> parseInt(document.forms[0].TCHK.value)){
    	    alert("Rango de cheques no pertenece a esta chequera");
        	return false;
     	}          
     	if(chki>chkf){
       		alert("Cheque inicial debe de ser menor a Cheque Final");
        	return false;
     	}
     }else{
	    if(!confirm("Esta Seguro que desea Anular esta Chequera")){
	       return false;
	    }         
     }	
     return true;
  }
</script>
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

<h3 align="center">Anulacion de Cheques y Chequera<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="checks_status.jsp,ECH0580"></h3>
<hr size="4">
<FORM Method="post" Action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSECH0580"  >
<INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="300">

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

 <table class="tableinfo" width="80%">
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
<h4></h4> 

  <br>
  
  <table class="tableinfo" width = "40%">
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

  <br>
 <table  id=cfTable class="tableinfo" height="40%">
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
					ECH056502Message list = (ECH056502Message) checks.getRecord();
    %> 
    	<tr id="dataTable<%= checks.getCurrentRow() %>">
			<td nowrap align="center" width="10%"><%=list.getE02CHMN01()%></td>
			<td nowrap align="center" width="10%"><%=list.getE02CHMS01()%></td>
			<td nowrap align="center" width="10%"><%=list.getE02CHMN02()%></td>
			<td nowrap align="center" width="10%"><%=list.getE02CHMS02()%></td>
			<td nowrap align="center" width="10%"><%=list.getE02CHMN03()%></td>
			<td nowrap align="center" width="10%"><%=list.getE02CHMS03()%></td>
			<td nowrap align="center" width="10%"><%=list.getE02CHMN04()%></td>
			<td nowrap align="center" width="10%"><%=list.getE02CHMS04()%></td>
			<td nowrap align="center" width="10%"><%=list.getE02CHMN05()%></td>
			<td nowrap align="center" width="10%"><%=list.getE02CHMS05()%></td>
		</tr>
<%} %>
             </table>
             </div>
             </td>
             </tr>
</table>


<br>

<% if(userPO.getPurpose().equals("CHEQUES")){ %>
  <TABLE width="30%" align="center" class="tableinfo">
    <tr>
       <td id="trdark" align="right" width="50%">Cheque Inicial :</td>
       <td id="trdark"><input name="E01CHMICK" type="text" size="13" maxlength="11" ></td>
    </tr>
    <tr>
       <td id="trdark" align="right"> Cheque Final :</td>
       <td id="trdark"><input name="E01CHMFCK" type="text" size="13" maxlength="11" ></td>
    </tr>
    <tr>
       <td id="trdark" align="right"> Nuevo Status :</td>
    	   <td id="trdark">
 	    	  <SELECT name="E01CHMSTS">
				<OPTION value="D">Disponible</OPTION>
				<OPTION value="A">Anulado</OPTION>
				<OPTION value="F">Certificado</OPTION>
				<OPTION value="P">Pagado</OPTION>
				<OPTION value="S">Suspendido</OPTION>
				<OPTION value="C">Conformado</OPTION>
<!-- 				<OPTION value="X">Protestado</OPTION> -->
				<OPTION value="X">Devuelto</OPTION>
				<OPTION value="T">Suspendido por Caja</OPTION>
				<OPTION value="I">Inexistente</OPTION>
			</select>	
       </td>
    </tr>    
  </table>

<% } else { %>
  <TABLE width="30%" align="center" class="tableinfo">
    <tr id="trdark" > <td colspan="2" align="center"  >Esta seguro de Anular esta chequera?</td> </tr>    
  </table>
<% } %>  
 


<div align="center"> <br>
	<input id="EIBSBTN" type="submit" value="Anular" name="button">
</div>

<% } %>
</FORM>

</BODY>
</HTML>
