<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@ page import = "datapro.eibs.master.Util" %>
<%@page import="com.datapro.constants.EibsFields"%>
<%@page import="com.datapro.eibs.constants.HelpTypes"%>

<html>
<head>
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>

<jsp:useBean id="holMsg" class="datapro.eibs.beans.ESD011001Message"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session"/>
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" 	scope="session" />

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

 <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/servlet/datapro.eibs.params.JSESD0110" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="2">
  <INPUT TYPE=HIDDEN NAME="APPCODE" VALUE="<%=request.getParameter("APPCODE")%>">
  <h3 align="center">Mantenimiento Dias Feriados<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="Hollidays_enter.jsp,ESD0110"> 
  </h3>
  <hr size="4">
<p></p>

<%int row = 0; %>
  <table class="tableinfo" align="center" width="85%">
    <tr> 
      <td> 
        <table width="100%" border="0" cellspacing="1" cellpadding="0">
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="34%" align="right">Codigo Pais :</td>
            <TD nowrap width="10%" align="center"> 
               <eibsinput:cnofc name="holMsg" flag="03" property="E01SELCTR" required="true"/>
            </TD>
			 <td nowrap width="33%" align="left"></td>	
		  </TR>
		  <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="34%" align="right">Codigo Region :</td>
            <td nowrap width="10%" align="center"> 
               <eibsinput:cnofc name="holMsg" flag="07" property="E01SELRGN" required="false"/>
            </td>
			 <td nowrap width="33%" align="left"> Blanco Feriado Nacional  / EOD = Actualizar Calendario de Cierres</td>	
 		  </tr>
 		  <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
				<TD nowrap width="34%" align="right">Año :</TD>
				<TD nowrap width="10%" align="center">
                <eibsinput:text name="holMsg" property="E01SELYEAR" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_INTEGER %>" size="5" maxlength="4" required="true"/>
			 <td nowrap width="33%" align="left">
			 	Genera : Sabados <input type="checkbox" name="E01HOF001"  value="Y" > 
			 	Domingos <input type="checkbox" name="E01HOF002"  value="Y" > 
			 </td>	
		  </tr>
		</table>
      </td>
    </tr>
  </table>
  
  <p align="center"> 
    <input id="EIBSBTN" type=submit name="Submit" value="Enviar">
  </p>
      
</form>
</body>
</html>
