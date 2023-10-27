<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@page import="com.datapro.eibs.constants.ISOCodes"%>
<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@page import="com.datapro.constants.EibsFields"%>

<html>
<head>
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session"/>
<jsp:useBean id="msgParam" class="datapro.eibs.beans.ESD000503Message" scope="session"/>
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>

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
 
 <h3 align="center">Parametros de Generales de Control<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="msg_parameters_enter.jsp,ESD0005"> 
 </h3>
 <hr size="4">
 <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/servlet/datapro.eibs.params.JSESD0005" >
 <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="4">
  
  <table class="tableinfo" width="100%">
	  <tr> 
	      <td nowrap> 
	        <table class=tbhead cellspacing="0" cellpadding="2" width="100%" align="center">
		        <tr>
		          <td nowrap width="30%" align="right"> Banco: </td>
		          <td nowrap width="70%" align="left">
		            <input type="text" name="E03MSGBNK" size="4" maxlength="2" value="<%= msgParam.getE03MSGBNK()%>" readonly>
		          </td>
		        </tr>
	        </table>
	      </td>
	   </tr>
  </table>

  <h4>Mensaje</h4>
   
  <table class="tableinfo">
      <tr > 
        <td nowrap>
          <table cellspacing="0" cellpadding="2" width="100%" border="0">
            <tr  id=trdark> 
              <td nowrap width="30%"> 
                <div align="right">Fecha Expiracion :</div>
              </td>
              <td nowrap width="70%"> 
				<eibsinput:date name="msgParam" fn_year="E03MSGEXY" fn_month="E03MSGEXM" fn_day="E03MSGEXD" />
              </td>
            </tr>
            <tr id=trclear> 
              <td nowrap width="30%"> 
                <div align="right">Ingles :</div>
              </td>
              <td nowrap width="70%"> 
                <input type="text" name="E03MSGONE" size="70" maxlength="50" value="<%= msgParam.getE03MSGONE()%>">
              </td>
            </tr>
            <tr id=trdark> 
              <td nowrap width="30%"> 
                <div align="right"></div>
              </td>
              <td nowrap width="70%"> 
                <input type="text" name="E03MSGTWO" size="70" maxlength="50" value="<%= msgParam.getE03MSGTWO()%>">
              </td>
            </tr>
            <tr id=trclear> 
              <td nowrap width="30%"> 
                <div align="right"></div>
              </td>
              <td nowrap width="70%"> 
                <input type="text" name="E03MSGTHR" size="70" maxlength="50" value="<%= msgParam.getE03MSGTHR()%>">
              </td>
            </tr>
            <tr id=trdark> 
              <td nowrap width="30%"> 
                <div align="right">Español :</div>
              </td>
              <td nowrap width="70%"> 
                 <input type="text" name="E03MSGFOU" size="70" maxlength="50" value="<%= msgParam.getE03MSGFOU()%>">
              </td>
            </tr>
            <tr id=trclear> 
              <td nowrap width="30%"> 
                <div align="right"></div>
              </td>
              <td nowrap width="70%"> 
				<input type="text" name="E03MSGFIV" size="70" maxlength="50" value="<%= msgParam.getE03MSGFIV()%>">
              </td>
            </tr>
            <tr id=trdark> 
              <td nowrap width="30%"> 
                <div align="right"></div>
              </td>
              <td nowrap width="70%"> 
                <input type="text" name="E03MSGSIX" size="70" maxlength="50" value="<%= msgParam.getE03MSGSIX()%>">
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
</body>
</html>
