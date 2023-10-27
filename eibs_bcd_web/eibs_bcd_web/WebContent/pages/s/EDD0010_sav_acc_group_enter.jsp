<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>

<%@ page import = "datapro.eibs.master.Util" %>
<%@page import="com.datapro.constants.EibsFields"%>


<%@page import="com.datapro.eibs.constants.HelpTypes"%>

<html>
<head>
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session"/>
<jsp:useBean id= "userPO" 	class= "datapro.eibs.beans.UserPos" 	scope="session" />

<script type="text/javascript">
function enter(){
	  document.forms[0].submit();
	 }
	 
	 function GetProduct08(name,desc,app,bank)
{
	page= "${pageContext.request.contextPath}/pages/s/EWD0008_client_help_container.jsp"
	fieldName=name;
	fieldAux1 = desc; 
	AppCode = app;
	ProductBank = bank;				
	CenterWindow(page,600,400,1);
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
 <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDD0010" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="2">
  <h3 align="center"><%if(userPO.getPurpose().equals("M"))out.print("Mantenimiento "); else out.print("Consulta ");%> de Cuentas Asociadas<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="sav_acc_group_enter.jsp, EDD0010"> 
  </h3>
  <hr size="4">
  <p>&nbsp;</p>
  <p>&nbsp;</p>
  <p>&nbsp;</p>
  <p>&nbsp;</p>
  <p>&nbsp;</p>
  <table id="tbenter" align="center" style="width:85%" border="1">
    <tr> 
      <td> 
        <table id="tbenter" width="100%" border="0" cellspacing="1" cellpadding="0">
          <tr>
            <td width="20%" nowrap>&nbsp;</td>
            <td width="25%" nowrap> 
              <div align="right">Banco :</div>
            </td>
            <td nowrap width="55%"> 
               <input type="text" name="H01BNK" size="3" maxlength="2"  >
            </td>
          </tr>
          <tr>
            <td width="20%" nowrap>&nbsp;</td>
            <td width="25%" nowrap> 
              <div align="right">Moneda :</div>
            </td>
            <td nowrap width="55%"> 
              <input type="text" name="H01CCY" size="4" maxlength="3"  >
              <a href="javascript:GetCurrency('H01CCY','')">
              	<img src="<%=request.getContextPath()%>/images/1b.gif" title="help" align="middle" border="0" ></a> 
            </td>
          </tr>
          <tr>
            <td nowrap width="20%">&nbsp;</td>
            <td nowrap width="25%"> 
              <div align="right"></div>
              <div align="right">Producto :</div>
            </td>
            <td nowrap width="55%"> 
		        <input type="text" name="H01CDE" id="H01CDE"  size=5 maxlength="4" >
		        <a href="javascript:GetProduct08('H01CDE','','<%=userPO.getType()%>','')"> 
		       		 <img src="<%=request.getContextPath()%>/images/1b.gif" title="help" align="middle" border="0" ></a> 
		    </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <p align="center"> 
    <input id="EIBSBTN" type=submit name="Submit" value="Enviar">
  </p>
        <p>&nbsp;</p>
  <p><BR>
  </p>
  <p align="center">&nbsp; </p>
      
</form>
</body>
</html>
