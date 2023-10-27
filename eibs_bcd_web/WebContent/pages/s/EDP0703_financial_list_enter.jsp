<%@ page import ="datapro.eibs.master.Util" %>
<html>
<head>
<title>Lista Codigos de Formatos</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<jsp:useBean id= "EDP070201Help" class= "datapro.eibs.beans.JBObjList"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>
<script type="text/javascript">
function goAction(op) {
	if (op == "3") {
      ok = confirm("Esta seguro que desea eliminar el registro seleccionado?");
	  if (ok) 
	       {
	       getElement("opt").value = op;
	       document.forms[0].submit();
	       }  
	  
	} else 
	
			{
	       getElement("opt").value = op;
	       document.forms[0].submit();
	       }
}
function getParams(currrow,fmt,dsc) {
	getElement("CURRENTROW").value = currrow;
    getElement("FMT").value = fmt;
    getElement("DSC").value = dsc;
}
</SCRIPT>  
</head>
<BODY>
<h3 align="center">Mantenimiento Plan de Cuentas por Formato <img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="financial_list_enter.jsp, EDP0703"></h3>
<hr size="4">
<FORM name="form1" METHOD="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.creditproposal.JSEDP0703" >
  <p> 
    <INPUT TYPE=HIDDEN NAME="CURRENTROW" VALUE="0"> 
    <input type=HIDDEN name="SCREEN" value="400">
    <input type=HIDDEN name="totalRow" value="0">
    <input type=HIDDEN name="FMT" value=" " size=2 maxlength=1>
    <input type=HIDDEN name="DSC" id="DSC" value=" " size=36 maxlength=35>
    <input type=HIDDEN name="opt">
  </p>
  <p> 
    <%
	if ( EDP070201Help.getNoResult() ) {
 %>
  </p>
  <p>&nbsp;</p>
  <p>&nbsp;</p>
  <p>&nbsp;</p>
  <p>&nbsp;</p>
  <p>&nbsp;</p>
  <TABLE class="tbenter" width="100%" >
    <TR>
      <TD > 
        <div align="center"> 
          <p><b>No se han creado formatos para trabajar con plan de cuentas</b></p>
          <table class="tbenter" width=100% align=center>
            <tr> 
              <td class=TDBKG width="30%"> 
                <div align="center"><a href="<%=request.getContextPath()%>/pages/background.jsp"><b>Salir</b></a></div>
              </td>
            </tr>
          </table>
          <p>&nbsp;</p>
        </div>
	  </TD>
	</TR>
    </TABLE>
  <%  
		}
	else {
%> <% 

String chk = "";
 if ( !error.getERRNUM().equals("0")  ) {
     error.setERRNUM("0");
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
     }
%> 
  <p> 
  <table class="tbenter" width=100% align=center>
    <tr> 
      <td class=TDBKG width="30%"> 
        <div align="center"><a href="javascript:goAction(1)"><b>Trabajar con Formato</b></a></div>
     </td>
      <td class=TDBKG width="30%"> 
        <div align="center"><a href="<%=request.getContextPath()%>/pages/background.jsp"><b>Salir</b></a></div>
      </td>
    </tr>
  </table>
  <br>
  <table  id=cfTable class="tableinfo">
    <tr > 
      <td NOWRAP valign="top" width="100%"> 
        <table id="headTable" width="100%">
          <tr id="trdark"> 
            <th align=CENTER nowrap width="10%">&nbsp;</th>
            <th align=CENTER nowrap width="10%"> 
              <div align="center">C�digo</div>
            </th>
            <th align=CENTER nowrap width="80%"> 
              <div align="center">Descripci�n</div>
            </th>
            
           </tr>
          <%
                EDP070201Help.initRow();
                chk = "checked";
                while (EDP070201Help.getNextRow()) {
                 
                  datapro.eibs.beans.EDP070201Message msgList = (datapro.eibs.beans.EDP070201Message) EDP070201Help.getRecord();
		 %>
		<tr id="dataTable<%= EDP070201Help.getCurrentRow() %>">
            <td NOWRAP  align=CENTER width="10%"> 
              <input type="radio" name="CURRCODE" value="<%= EDP070201Help.getCurrentRow() %>" <%=chk%> onClick="getParams(this.value,'<%= msgList.getE01DPFFMT() %>','<%= msgList.getE01DPFDSC() %>');">
            </td>
            <td NOWRAP  align=CENTER width="10%"><%= msgList.getE01DPFFMT() %></td>
			<td NOWRAP  align=CENTER width="80%"><%= msgList.getE01DPFDSC() %></td>

         </tr>
          <%
              				chk = "";     
                }
              %>
        </table>
  </table>
  <SCRIPT type="text/javascript">
 showChecked("CURRCODE");
</SCRIPT>
<%}%>
</form>
</body>
</html>