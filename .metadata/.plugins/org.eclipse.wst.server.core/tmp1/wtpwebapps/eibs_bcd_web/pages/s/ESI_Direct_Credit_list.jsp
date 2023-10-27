<%@ page import = "datapro.eibs.master.Util" %>
<html>
<head>
<title>Codigos de Referencia Tarjetas de Cr�dito</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "ECC003002Help" class= "datapro.eibs.beans.JBObjList"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>

<script type="text/javascript">



function goAction(op) {

	document.forms[0].opt.value = op;
	document.forms[0].submit();
  
}

function goDelete() {

	if(confirm("Esta seguro que desea borrar este codigo?")){
		document.forms[0].opt.value = 3;
		document.forms[0].submit();
	}
	
	
  
}

</SCRIPT>  

</head>

<BODY>
<h3 align="center">C&oacute;digos de Referencia Tarjetas de Cr�dito<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="cnofc_cc_list.jsp, ECC0030"></h3>
<hr size="4">
<FORM name="form1" METHOD="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.params.JSECC0030" >
  <p> 
    <input type=HIDDEN name="SCREEN" value="800">
    <input type=HIDDEN name="totalRow" value="0">
    <input type=HIDDEN name="opt">
    <input type=HIDDEN name="REFCODE">
	<input type=HIDDEN name="TBLCODE">
  </p>
  
  <p> 
    <%
	if ( ECC003002Help.getNoResult() ) {
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
          <p><b>No hay resultados para su b&uacute;squeda</b></p>
          <table class="tbenter" width=100% align=center>
            <tr> 
              <td class=TDBKG width="30%"> 
                <div align="center"><a href="javascript:goAction(1)"><b>Crear</b></a></div>
              </td>
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
      <td class=TDBKG width="25%"> 
        <div align="center"><a href="javascript:goAction(1)"><b>Crear</b></a></div>
      </td>
      <td class=TDBKG width="25%"> 
        <div align="center"><a href="javascript:goAction(2)"><b>Modificar</b></a></div>
      </td>
		<td class=TDBKG width="25%"> 
        <div align="center"><a href="javascript:goDelete(3)"><b>Borrar</b></a></div>
      </td>      
      <td class=TDBKG width="25%"> 
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
            <th align=CENTER nowrap width="5%">&nbsp;</th>
            <th align=CENTER nowrap width="20%">C&oacute;digo</th>
            <th align=CENTER nowrap width="75%"> 
              <div align="center">Descripci&oacute;n</div>
            </th>
            <th align=CENTER nowrap width="20%">Referencia</th>
          </tr>
          <%
                ECC003002Help.initRow();
				boolean firstTime = true;
				String chk = "";
        		while (ECC003002Help.getNextRow()) {
					if (firstTime) {
						firstTime = false;
						chk = "checked";
					} else {
						chk = "";
					}
                  	datapro.eibs.beans.ECC003002Message msgList = (datapro.eibs.beans.ECC003002Message) ECC003002Help.getRecord();
		 %>
          <tr> 
            <td NOWRAP  align=CENTER width="5%"> 
              <input type="radio" name="CURRCODE" value="<%= ECC003002Help.getCurrentRow() %> "  <%=chk%> 
			  >
            </td>
            <td NOWRAP  align=CENTER width="20%"><%= msgList.getE02CCTCOD() %></td>
            <td NOWRAP  align=LEFT width="75%"><%= msgList.getE02CCTDSC() %></td>
            <td NOWRAP  align=LEFT width="75%"><%= msgList.getE02CCTREF() %></td>
          </tr>
          <%
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
