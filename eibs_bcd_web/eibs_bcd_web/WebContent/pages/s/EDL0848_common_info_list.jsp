<%@ page import ="datapro.eibs.master.Util" %>
<html>
<head>
<title>Mantenimiento de Datos Comunes</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "EDL084801Help" class= "datapro.eibs.beans.JBObjList"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>

<script type="text/javascript">



function goAction(op) {
	if (op == "3") {
    	ok = confirm("¿Está seguro de que desea eliminar el registro seleccionado?");
		if (ok) 
	    {
	    	document.forms[0].opt.value = op;
	    	document.forms[0].submit();
	    }  
	}
	else {
		document.forms[0].opt.value = op;
		document.forms[0].submit();
	}
}

function getParams(currrow,code) {
	document.forms[0].CURRENTROW.value = currrow;
	document.forms[0].CODE.value = code;
}


</SCRIPT>  

</head>

<BODY>
<h3 align="center">Mantenimiento de Datos Comunes<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="common_info_list.jsp, EDL0848"></h3>
<hr size="4">
<FORM name="form1" METHOD="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDL0848" >
  <p> 
    <INPUT TYPE=HIDDEN NAME="CURRENTROW" VALUE="0"> 
    <INPUT TYPE=HIDDEN NAME="CODE" VALUE=""> 
  	<INPUT TYPE=HIDDEN NAME="E01DLRRTP" VALUE="<%= userPO.getHeader1() %>">
    <input type=HIDDEN name="SCREEN" value="800">
    <input type=HIDDEN name="totalRow" value="0">
    <input type=HIDDEN name="opt">
  </p>
  <p> 
    <%
	if ( EDL084801Help.getNoResult() ) {
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
              <td class=TDBKG width="50%"> 
                <div align="center"><a href="javascript:goAction(0)"><b>Crear</b></a></div>
              </td>
              <td class=TDBKG width="50%"> 
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
      <td class=TDBKG width="20%"> 
        <div align="center"><a href="javascript:goAction(0)"><b>Crear</b></a></div>
      </td>
	  <td class=TDBKG width="20%">
        <div align="center"><a href="javascript:goAction(2)"><b>Modificar</b></a></div> 
      </td> 
	  <td class=TDBKG width="20%"> 
        <div align="center"><a href="javascript:goAction(3)"><b>Borrar</b></a></div>
      </td>
      <td class=TDBKG width="20%"> 
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
            <th align=CENTER nowrap width="2%"></th>
            <th align=CENTER nowrap width="23%"><div align="center">Código</div></th>
            <th align=CENTER nowrap width="25%"><div align="center">Nombre</div></th>
            <th align=CENTER nowrap width="25%"><div align="center">Identificación</div></th>
            <th align=CENTER nowrap width="25%"><div align="center">Agencia</div></th>
           </tr>
          <%
          		String chk = "";
                EDL084801Help.initRow();
                chk = "checked";
                while (EDL084801Help.getNextRow()) {
                 
                  datapro.eibs.beans.EDL084801Message msgList = (datapro.eibs.beans.EDL084801Message) EDL084801Help.getRecord();
		 %>
          <tr> 
            <td NOWRAP  align=CENTER width="2%"> 
              <input type="radio" name="CURRCODE" value="<%= EDL084801Help.getCurrentRow() %>" <%=chk%> onClick="getParams(this.value,'<%= msgList.getE01DLRCOD() %>');">
            </td>
            <td NOWRAP  align=CENTER width="23%"><%= msgList.getE01DLRCOD() %></td>
			<td NOWRAP  align=CENTER width="25%"><%= msgList.getE01DLRNME() %></td>
            <td NOWRAP  align=CENTER width="25%"><%= msgList.getE01DLRIDN() %></td>
            <td NOWRAP  align=CENTER width="25%">[<%= msgList.getE01DLRBRN() %>] - <%= msgList.getD01DLRBRN() %></td>

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
