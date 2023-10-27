<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@ page import = "datapro.eibs.master.Util" %>
<%@page import="com.datapro.constants.EibsFields"%>

<HTML>
<HEAD>
<TITLE>Devoluciones de Documentos</TITLE>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>
<jsp:useBean id= "msgList" class= "datapro.eibs.beans.EDD120001Message"  scope="session" />

<SCRIPT type="text/javascript" SRC="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>

<SCRIPT type="text/javascript">

function enter(){
	if (trim(document.form.E01NRODOC.value).length < 1){
		alert("Debe introducir Número Documento");
		return false;
	}
	if (document.form.E01MONTO.value.length < 1){
		alert("Debe introducir Monto Documento");
		return false;
	}
	if (trim(document.form.E01NROBCO.value).length < 1){
		alert("Debe introducir Banco Emisor");
		return false;
	}
	if (trim(document.form.E01CREOBR.value).length < 1){
		alert("Debe introducir Sucursal Digitadora");
		return false;
	}
	if (trim(document.form.E01MOTIVO.value).length < 1){
		alert("Debe introducir Motivo");
		return false;
	}
	return true;
}

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
<h3 align="center">Devoluciones Documentos en Deposito<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="ptt_dev_documentos.jsp , EDD1200"></h3>
<hr size="4">

<FORM Method="post" name="form" Action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDD1200" onsubmit="return(enter())">
<INPUT TYPE=HIDDEN NAME="SCREEN" id="SCREEN" VALUE="2">
<INPUT TYPE=HIDDEN NAME="opt" id="opt" VALUE="1">
<INPUT TYPE=HIDDEN NAME="totalRow" id="totalRow" VALUE="0"> 

<%int row = 0; %>
  <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
            <td nowrap width="16%" > 
              <div align="right"><b>Cliente :</b></div>
            </td>
            <td nowrap width="20%" > 
              <div align="left"><%= userPO.getHeader1().trim()%></div>
            </td>
            <td nowrap width="16%" > 
              <div align="right"><b>Nombre :</b> </div>
            </td>
            <td nowrap colspan="3" > 
              <div align="left"><%= userPO.getHeader5().trim()%></div>
            </td>
			
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
            <td nowrap width="16%"> 
              <div align="right"><b>Cuenta del Deposito :</b></div>
            </td>
            <td nowrap width="20%"> 
              <div align="left"><%= userPO.getIdentifier().trim()%></div>
            </td>
            <td nowrap width="16%"> 
              <div align="right"><b>Moneda : </b></div>
            </td>
            <td nowrap width="16%"> 
              <div align="left"><%= userPO.getCurrency().trim()%></div>
            </td>
            <td nowrap width="16%"> 
              <div align="right"><b>Producto: </b></div>
            </td>
            <td nowrap width="16%"> 
              <div align="left"><%= userPO.getHeader6().trim()%></div>
            </td>
          </tr>
		  
		  <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
            <td nowrap width="16%" > 
              <div align="right"><b>Ejecutivo :</b></div>
            </td>
            <td nowrap width="20%" > 
              <div align="left"><%= userPO.getHeader10().trim()%></div>
            </td>
            <td nowrap width="16%" > 
              <div align="right"><b>Nombre :</b> </div>
            </td>
            <td nowrap colspan="3" > 
              <div align="left"><%= userPO.getHeader11().trim()%></div>
            </td>
          </tr>
		  
		  <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
            <td nowrap width="16%"> 
              <div align="right"><b>Saldo Contable :</b></div>
            </td>
            <td nowrap width="20%"> 
              <div align="right"><% if ( userPO.getCurrency().trim().equals("USD")) {out.print("US$ ");} else {out.print("$ ");} %><%= Util.fcolorCCY(userPO.getHeader12().trim())%></div>
            </td>
            <td nowrap width="16%"> 
              <div align="right"><b>Saldo Disponible : </b></div>
            </td>
            <td nowrap width="20%"> 
              <div align="right"><% if ( userPO.getCurrency().trim().equals("USD")) {out.print("US$ ");} else {out.print("$ ");} %><%= Util.fcolorCCY(userPO.getHeader13().trim())%></div>
            </td>
            <td nowrap width="16%"> 
              <div align="right"><b>Retención : </b></div>
            </td>
            <td nowrap width="16%"> 
              <div align="right"><% if ( userPO.getCurrency().trim().equals("USD")) {out.print("US$ ");} else {out.print("$ ");} %><%= Util.fcolorCCY(userPO.getHeader14().trim())%></div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <BR>
  <table class="tableinfo" >
    <tr > 
      <td nowrap align="center"> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
         <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
            <td nowrap width="40%"> 
              <div align="right"><b>Fecha Deposito : </b></div>
            </td>
            <td nowrap width="60%"> 																						
              <div align="left"><b>
              	<eibsinput:date name="msgList" fn_year="E01RUNDTY" fn_month="E01RUNDTM" fn_day="E01RUNDTD" />
              </b></div>
            </td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap width="40%"> 
              <div align="right"><b>Dias Retenci&oacute;n :</b></div>
            </td>
            <td nowrap width="60%"> 
              <div align="left">
              	<eibsinput:text property="E01NRODIAS" name="msgList" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_INTEGER %>" size="2" maxlength="2" />
              <b>(Dias)</b></div>
            </td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
            <td nowrap width="40%" > 
              <div align="right"><b>Tipo Documento : </b></div>
            </td>
            <td nowrap width="60%">               
                <select name="E01TIPODO" id="E01TIPODO">
                 	<option value=" " <% if (msgList.getE01TIPODO().trim().equals("")) out.print("selected"); %>>Cheque Normal</option>
                	<option value="1" <% if (msgList.getE01TIPODO().trim().equals("1")) out.print("selected"); %>>Cheque Gerencia</option>
                	<option value="2" <% if (msgList.getE01TIPODO().trim().equals("2")) out.print("selected"); %>>Cheque Certificado</option>
                	<option value="3" <% if (msgList.getE01TIPODO().trim().equals("3")) out.print("selected"); %>>Certificado Deposito</option>
                	<option value="4" <% if (msgList.getE01TIPODO().trim().equals("4")) out.print("selected"); %>>Orden Pago INP</option>
                	<option value="5" <% if (msgList.getE01TIPODO().trim().equals("5")) out.print("selected"); %>>Cheque Fiscal</option>
                	<option value="6" <% if (msgList.getE01TIPODO().trim().equals("6")) out.print("selected"); %>>Vale Camara</option>
                </select>                 
            </td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
            <td nowrap width="40%" > 
              <div align="right"><b>Número Documento : </b></div>
            </td>
            <td nowrap width="60%"> 
               	<eibsinput:text property="E01NRODOC" name="msgList" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_INTEGER %>" size="9" maxlength="9" required="true" />                
            </td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap width="40%" > 
              <div align="right"><b>Monto : </b></div>
            </td>
            <td align="center" nowrap width="60%"> 
              <div align="left"><b><% if ( userPO.getCurrency().trim().equals("USD")) {out.print("US$ ");} else {out.print("$ ");} %></b>
                <eibsinput:text property="E01MONTO" name="msgList" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DECIMAL %>" size="12" maxlength="12" required="true" /> 
              </div>
            </td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
            <td nowrap width="40%" > 
              <div align="right"><b>Banco Emisor : </b></div>
            </td>
            <td nowrap width="60%"> 
              <div align="left"><b> 
                <input type="text" readonly="true" name="E01NROBCO" id="E01NROBCO" size="4" maxlength="4" onKeypress="enterInteger(event)" value="<%= msgList.getE01NROBCO().trim() %>" >
                <img src="<%=request.getContextPath()%>/images/Check.gif" title="mandatory field" align="bottom" border="0" > 
                 <a href="javascript:GetCodeCNOFC('E01NROBCO'','92')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="bottom" border="0" ></a> 
                </b> </div>
            </td>
          </tr>
		  <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
              <td NOWRAP width="40%"> 
                  
              <div align="right"><b>Sucursal Digitadora : </b></div>
               </td>
               <td NOWRAP width="60%"> 
                   <div align="left"> 
                   		<eibsinput:text property="E01CREOBR" name="msgList" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_BRANCH %>" required="true" /> 
					</div>
			   </td>
          </tr>
         <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap width="40%"> 
              <div align="right"><b>Motivo : </b></div>
            </td>
            <td nowrap width="60%">  
                <input type="text" name="E01MOTIVO" id="E01MOTIVO" size="5" maxlength="4" value="<%=msgList.getE01MOTIVO()%>">
				<img src="<%=request.getContextPath()%>/images/Check.gif" title="mandatory field" align="bottom" border="0" >
            	<A href="javascript:GetCasualTable('E01MOTIVO','')"><IMG src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="bottom" border="0"></A>
			</td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
            <td nowrap width="40%"> 
              <div align="right"><b>Narrativa : </b></div>
            </td>
            <td nowrap width="60%"> 
            	 <eibsinput:text property="E01NARRTV" name="msgList" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" required="true" /> 
			</td>
          </tr>          
        </table>
      </td>
    </tr>
  </table>
  
      
<p align="center"> 
  	<input id="EIBSBTN" type=submit name="Submit" value="Enviar">
  </p>

</FORM>

</BODY>
</HTML>
