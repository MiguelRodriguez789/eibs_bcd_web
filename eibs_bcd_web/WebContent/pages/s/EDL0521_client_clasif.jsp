<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@ page import = "datapro.eibs.master.Util" %>
<%@page import="com.datapro.constants.EibsFields"%>
<%@page import="com.datapro.eibs.constants.HelpTypes"%>

<html>
<head>
<META name="GENERATOR" content="IBM WebSphere Page Designer V4.0 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<title>Calificación de Clientes</title>
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<jsp:useBean id= "clasif" class= "datapro.eibs.beans.EDL052101Message"  scope="session" />

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />

<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>

<%
 String title="";
 if ( userPO.getOption().equals("CLIENT_C") ) {
    title="Jurídico";
%>

   <SCRIPT type="text/javascript">
       builtNewMenu(client_corp_opt);       
   </SCRIPT>

<%
} else if ( userPO.getOption().equals("CLIENT_P") ) { 
  title="Personal";
%>
	<SCRIPT type="text/javascript">
       builtNewMenu(client_personal_opt);       
   </SCRIPT>
<%
}  
%> 
</head>

<body bgcolor="#FFFFFF">

<% 
 if ( !error.getERRNUM().equals("0")  ) {
     error.setERRNUM("0");
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
 }
 if ( !userPO.getOption().equals("CLASIF") ) {
    out.println("<SCRIPT>initMenu();</SCRIPT>");
 }
 %> 
 
 <h3 align="center">Calificación de Cliente <%= title %>  <img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="client_clasif, EDL0521" ></h3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSEDL0521">
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="2">
  
  	<table class="tableinfo">
      <tr > 
        <td nowrap>          
         <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="trdark"> 
            <td nowrap> 
              <div align="right">Identificaci&oacute;n :</div>
            </td>
            <td nowrap> 
              <input type="text" readonly name="E01CUSIDN" size="26" maxlength="25" value="<%= clasif.getE01CUSIDN()%>">
            </td>
            <td nowrap> 
              <div align="right">Nro Cliente :</div>
            </td>
            <td nowrap> 
              <input type="text" readonly name="E01CUSCUN" size="10" maxlength="9" value="<%= clasif.getE01CUSCUN()%>">
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap> 
              <div align="right">Nombre :</div>
            </td>
            <td nowrap colspan="3"> 
              <input type="text" readonly name="E01CUSNA1" size="60" maxlength="60" value="<%= clasif.getE01CUSNA1().trim()%>">
            </td>
          </tr>          
         </table>
        </td>
      </tr>
    </table>
    
    <br>
	<table class="tableinfo">
      <tr > 
        <td nowrap> 
          <table cellspacing="2" cellpadding="2" width="100%" border="0" align="left">
            <tr id="trdark"> 
              <td nowrap width="40%"></td>
              <td nowrap width="20%" align=center><b>Actual</b></td>
              <td nowrap width="40%" align=center><b>Nueva</b></td>
            </tr>
            <tr>
              <td nowrap id="trdark" align=right><B>Calificación Subjetiva:</B> </td> 
              <td nowrap > 
                <div align=left><%=clasif.getB01CALSUB()%></div>
              </td>
              <td nowrap >  
                <input type="text" name="E01CALSUB" size="3" maxlength="2" value="<%= clasif.getE01CALSUB().trim()%>">
                <a href="javascript:GetCodeCNOFC('E01CALSUB','SA')"><img src="<%=request.getContextPath()%>/images/1b.gif" title=". . ." align="bottom" border="0"  ></a> 
              </td>
            </tr>
            <tr >
              <td nowrap id="trdark" align=right><B>Forma de Calificación :
              </B></td> 
              <td nowrap > 
                <div align=left><%=clasif.getB01FRMCAL()%></div>
              </td>
              <td nowrap >  
                <input type="text" name="E01FRMCAL" size="2" maxlength="1" value="<%= clasif.getE01FRMCAL().trim()%>">
                <a href="javascript:GetCode('E01FRMCAL','STATIC_client_help_qualification_type.jsp')"><img src="<%=request.getContextPath()%>/images/1b.gif" title=". . ." align="bottom" border="0"></a> 
              </td>
            </tr>
            <tr >
              <td nowrap id="trdark" align=right><B>Tabla de Previsiones :
              </B></td> 
              <td nowrap > 
                <div align=left><%=clasif.getB01TBLPRV()%></div>
              </td>
              <td nowrap >  
                <input type="text" name="E01TBLPRV" size="3" maxlength="2" value="<%= clasif.getE01TBLPRV().trim()%>">
                <a href="javascript:GetPrevTable('E01TBLPRV')"><img src="<%=request.getContextPath()%>/images/1b.gif" title=". . ." align="bottom" border="0"  ></a> 
			  </td>
            </tr>
            <tr> 
              <td nowrap id="trdark" align=right><B>Clasificación Comercial :
              </B></td>
              <td nowrap > 
                <div align=left><%=clasif.getB01CALCOM()%></div>
              </td>
              <td nowrap >  
                <input type="text" name="E01CALCOM" size="3" maxlength="2" value="<%= clasif.getE01CALCOM().trim()%>">
                <a href="javascript:GetCodeCNOFC('E01CALCOM','16')"><img src="<%=request.getContextPath()%>/images/1b.gif" title=". . ." align="bottom" border="0"  ></a> 
			  </td>
            </tr>
            <tr >
              <td nowrap id="trdark" align=right><B>Fecha de Clasificación Comercial :
              </B></td> 
              <td nowrap > 
                <div align=left> <eibsinput:date name="clasif" fn_year="B01COMDTY" fn_month="B01COMDTM" fn_day="B01COMDTD" readonly="true"/></div>
              </td>
              <td nowrap >  
				<eibsinput:date name="clasif" fn_year="E01COMDTY" fn_month="E01COMDTM" fn_day="E01COMDTD" />
              </td>
            </tr>
            <tr>
              <td nowrap id="trdark" align=right><B>Reclasificación SBIF :
              </B></td> 
              <td nowrap > 
                <div align=left><%=clasif.getB01RECLAS()%></div>
              </td>
              <td nowrap >  
                <input type="text" name="E01RECLAS" size="3" maxlength="2" value="<%= clasif.getE01RECLAS().trim()%>"> 
                <a href="javascript:GetCodeCNOFC('E01RECLAS','16')"><img src="<%=request.getContextPath()%>/images/1b.gif" title=". . ." align="bottom" border="0"  ></a> 
			  </td>
            </tr>
            <tr>
              <td nowrap id="trdark" align=right><B>Fecha Reclasificación SBIF :
              </B></td> 
              <td nowrap > 
                <div align=left> <eibsinput:date name="clasif" fn_year="B01RECDTY" fn_month="B01RECDTM" fn_day="B01RECDTD" readonly="true"/></div>
              </td>
              <td nowrap >  
				<eibsinput:date name="clasif" fn_year="E01RECDTY" fn_month="E01RECDTM" fn_day="E01RECDTD" />
              </td>
            </tr>
            <tr>
  			  <td nowrap id="trdark" align=right><B>Vigilancia Especial :
              </B></td>
              <td nowrap > 
                <div align=left><%=clasif.getB01CALESP()%></div>
              </td>
              <td nowrap >  
                <input type="text" name="E01CALESP" size="3" maxlength="2" value="<%= clasif.getE01CALESP().trim()%>">
                <a href="javascript:GetCodeCNOFC('E01CALESP','16')"><img src="<%=request.getContextPath()%>/images/1b.gif" title=". . ." align="bottom" border="0"  ></a> 
			  </td>
            </tr>
            <tr>
              <td nowrap id="trdark" align=right><B>Fecha Actualización Vigilancia :
              </B></td> 
              <td nowrap > 
                <div align=left> <eibsinput:date name="clasif" fn_year="B01ESPDTY" fn_month="B01ESPDTM" fn_day="B01ESPDTD" readonly="true"/></div>
              </td>
              <td nowrap >  
				<eibsinput:date name="clasif" fn_year="E01ESPDTY" fn_month="E01ESPDTM" fn_day="E01ESPDTD" />
              </td>
            </tr>
            <tr>
              <td nowrap id="trdark" align=right><B>Clasif. Riesgo Deudor :
              </B></td> 
              <td nowrap > 
                <div align=left><%=clasif.getB01CALRGO()%></div>
              </td>
              <td nowrap >  
                <input type="text" name="E01CALRGO" size="3" maxlength="2" value="<%= clasif.getE01CALRGO().trim()%>">
                <a href="javascript:GetCodeCNOFC('E01CALRGO','16')"><img src="<%=request.getContextPath()%>/images/1b.gif" title=". . ." align="bottom" border="0"  ></a> 
			  </td>
            </tr>
            <tr>
              
            <td nowrap id="trdark" align=right><B>Fecha Actulización Cr&eacute;dito 
              : </B></td> 
              <td nowrap > 
                <div align=left> <eibsinput:date name="clasif" fn_year="B01RGODTY" fn_month="B01RGODTM" fn_day="B01RGODTD" readonly="true"/></div>
              </td>
              <td nowrap >  
				<eibsinput:date name="clasif" fn_year="E01RGODTY" fn_month="E01RGODTM" fn_day="E01RGODTD" />
              </td>
            </tr>
            <tr>
              
            <td nowrap id="trdark" align=right><B>C&oacute;digo Usuario : </B></td> 
              <td nowrap > 
                <div align=left><%=clasif.getB01USRCOD()%></div>
              </td>
              <td nowrap >  
               <eibsinput:cnofc name="clasif" flag="21" property="E01USRCOD" fn_description="E01USRNME" required="false"/>
              </td>
            </tr>
            <tr>
              <td nowrap id="trdark" align=right><B>Nombre Usuario :
              </B></td> 
              <td nowrap > 
                <div align=left><%=clasif.getB01USRNME()%></div>
              </td>
              <td nowrap >  
               <eibsinput:text	name="clasif" property="E01USRNME" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true"/>
              </td>
            </tr>
            <tr>
              <td nowrap id="trdark" align=right><B>Fecha Ultima Actualización :
              </B></td> 
              <td nowrap > 
                 <div align=left> <eibsinput:date name="clasif" fn_year="B01USRUDY" fn_month="B01USRUDM" fn_day="B01USRUDD" readonly="true"/></div>
              </td>
              <td nowrap >  
				<eibsinput:date name="clasif" fn_year="E01USRUDY" fn_month="E01USRUDM" fn_day="E01USRUDD" />
              </td>
            </tr>
          </table>
        </td>
      </tr>
    </table>

	<div align="center"> 
    	<input id="EIBSBTN" type=submit name="Submit" value="Enviar">
  	</div>

</form>
</body>
</html>
