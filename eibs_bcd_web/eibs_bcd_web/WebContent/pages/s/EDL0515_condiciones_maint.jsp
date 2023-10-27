<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@ page import = "datapro.eibs.master.Util" %>
<%@page import="com.datapro.constants.EibsFields"%>


<html>
<head>
<title>Tabla de Menu</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

</head>

<jsp:useBean id="Param" class="datapro.eibs.beans.EDL051501Message"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />

<body>

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>

<SCRIPT type="text/javascript">

function cancel() {
	getElement("SCREEN").value = 200;
	document.forms[0].submit();
}
   
</SCRIPT>

<% 
    if ( !error.getERRNUM().equals("0")  ) {
        out.println("<SCRIPT Language=\"Javascript\">");
        error.setERRNUM("0");
        out.println("       showErrors()");
        out.println("</SCRIPT>");
    }
    
%>


<H3 align="center">Mantenimiento <img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="condiciones_maint.jsp, EDL0515"></H3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.params.JSEDL0515" >
  <INPUT TYPE=HIDDEN id="SCREEN" NAME="SCREEN" VALUE="300">
  
 <%int row = 0; %>
  <table  class="tableinfo">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="30%" > 
              <div align="right">Condici&oacute;n :</div>
            </td>
            <td nowrap width="70%" > 
              <div align="left"> 
           		<eibsinput:text property="E01CDLDLC" name="Param" size="2" maxlength="1" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_INTEGER %>" readonly="true" />
              </div>
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="30%" height="23"> 
              <div align="right">D&iacute;as Desde :</div>
            </td>
            <td nowrap width="70%"> 
              <div align="left"> 
              	<eibsinput:text property="E01CDLDYS" name="Param" size="6" maxlength="5" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_INTEGER %>" />
              </div>
            </td>
          </tr>

          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
          	<td nowrap width="30%"> 
              <div align="right">Descripci&oacute;n :</div>
            </td>
            <td nowrap width="70%"> 
              <div align="left"> 
              	<eibsinput:text property="E01CDLDSC" name="Param" size="5" maxlength="4" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" />
              </div>
            </td>
          </tr>

          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
          	<td nowrap width="30%"> 
              <div align="right">Condici&oacute;n Interna :</div>
            </td>
            <td nowrap width="70%"> 
              <div align="left"> 
	              <select name="E01CDLDLI">
	                <option value=" "></option>
	                <option value="1" <% if (Param.getE01CDLDLI().equals("1")) out.print("selected"); %>>Vigente</option>
	                <option value="2" <% if (Param.getE01CDLDLI().equals("2")) out.print("selected"); %>>Vencido</option>
	                <option value="3" <% if (Param.getE01CDLDLI().equals("3")) out.print("selected"); %>>Castigado</option>
	                <option value="4" <% if (Param.getE01CDLDLI().equals("4")) out.print("selected"); %>>Castigo N/Inf-Anulación</option>
	              </select>
              </div>
            </td>
          </tr>

          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
          	<td nowrap width="30%"> 
              <div align="right">Suspension de Devengo :</div>
            </td>
            <td nowrap width="70%"> 
              <div align="left"> 
				<input type="radio" name="E01CDLFLI" value="Y" <%if (Param.getE01CDLFLI().equals("Y")) out.print("checked"); %>> Si 
				<input type="radio" name="E01CDLFLI" value="N" <%if (Param.getE01CDLFLI().equals("N")) out.print("checked"); %>> No
              </div>
            </td>
          </tr>

          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
          	<td nowrap width="30%"> 
              <div align="right">Proceso Aceleraci&oacute;n :</div>
            </td>
            <td nowrap width="70%"> 
              <div align="left"> 
				<input type="radio" name="E01CDLFLA" value="Y" <%if (Param.getE01CDLFLA().equals("Y")) out.print("checked"); %>> Si 
				<input type="radio" name="E01CDLFLA" value="N" <%if (Param.getE01CDLFLA().equals("N")) out.print("checked"); %>> No
              </div>
            </td>
			
          </tr>
          <%--
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
          	<td nowrap width="30%"> 
              <div align="right">Judicializado :</div>
            </td>
            <td nowrap width="70%"> 
              <div align="left"> 
				<input type="radio" name="E01CDLJUD" value="Y" <%if (Param.getE01CDLJUD().equals("Y")) out.print("checked"); %>> Si 
				<input type="radio" name="E01CDLJUD" value="N" <%if (Param.getE01CDLJUD().equals("N")) out.print("checked"); %>> No
              </div>
            </td>
			
          </tr>
          --%>
         </table>
      </td>
    </tr>
  </table>
  <div align="center">
    <input id="EIBSBTN" type=submit name="Submit" value="Enviar">
    <input id="EIBSBTN" type="button" name="Cancel" value="Cancelar" onClick="cancel()">
  </div>
  </form>
</body>
</html>

