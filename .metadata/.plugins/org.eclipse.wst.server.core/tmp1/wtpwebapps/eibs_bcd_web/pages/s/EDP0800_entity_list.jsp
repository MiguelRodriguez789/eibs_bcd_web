<%@ page import ="datapro.eibs.master.Util" %>
<html>
<head>
<title>Operaciones Activas con Otras Instituciones Financieras</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<jsp:useBean id= "EDP080001Help" class= "datapro.eibs.beans.JBObjList"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>
<script type="text/javascript">
function goAction(op) {	
	var msg1 = "Esta seguro que desea ";
	var msg2 = "el registro seleccionado";
	document.forms[0].opt.value = op;

	switch (op) { 
	case  1:  
       document.forms[0].SCREEN.value="300";
       document.forms[0].PURPOSE.value="NEW";
	   document.forms[0].submit();		  	       	       
	 break;	
	}


	if (document.forms[0].CURRCODE2 != null) {
	switch (op) { 
	case  2:
       document.forms[0].SCREEN.value="400";
       document.forms[0].PURPOSE.value="INQUIRY";
	   document.forms[0].submit();		  	       	       
	 break;   
	case  3:
       document.forms[0].SCREEN.value="400";
       document.forms[0].PURPOSE.value="MAINTENANCE";
       document.forms[0].submit();		  	       	       
	 break;   
	case  4: //ok = confirm(msg1 + " Eliminar " + msg2);
       document.forms[0].SCREEN.value="400";
       document.forms[0].PURPOSE.value="DELETE";
	   document.forms[0].submit();		  	       	       
	 break;
	}
	}
}


</SCRIPT>  
</head>
<BODY>
<h3 align="center">Operaciones Activas con Otras Instituciones Financieras </h3>
<H3> <%= userPO.getCusNum().trim() + " : " + userPO.getCusName().trim()%>
	<IMG src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="entity_list.jsp, EDP0800">
</H3><HR size="4" width="100%" align="right">
<FORM name="form1" METHOD="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.creditproposal.JSEDP0800" >
  <p> 
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="">
    <input type=HIDDEN name="opt">
    <input type=HIDDEN name="PURPOSE">
  </p>
  <p> 
 <%
	if (EDP080001Help.getNoResult() ) {
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
	<% if(!userPO.getPurpose().equals("INQUIRY")) { %>
      <td class=TDBKG width="20%"> 
        <div align="center"><a href="javascript:goAction(1)"><b>Crear</b></a></div>
     </td>
	<%};%>
     <td class=TDBKG width="20%"> 
        <div align="center"><a href="javascript:goAction(2)"><b>Consultar</b></a></div>
     </td>
	<% if(!userPO.getPurpose().equals("INQUIRY")) { %>
	<td class=TDBKG width="20%">
        <div align="center"><a href="javascript:goAction(3)"><b>Modificar</b></a></div> 
	</td> 
	<td class=TDBKG width="20%"> 
		<div align="center"><a href="javascript:goAction(4)"><b>Borrar</b></a></div>
	</td>
	<%};%>
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
            <th align=CENTER nowrap width="5%">&nbsp;</th>
            <th align=CENTER nowrap width="10%"> <div align="center">Institución</div> </th>
            <th align=CENTER nowrap width="10%">Tipo de Credito</th>
            <th align=CENTER nowrap width="8%"> <div align="center">Monto Otorgado</div> </th>
            <th align=CENTER nowrap width="8%"> <div align="center">Saldo Actual</div> </th>
            <th align=CENTER nowrap width="8%"> <div align="center">Valor Cuota</div> </th>
            <th align=CENTER nowrap width="8%"> <div align="center">Tasa</div> </th>
            <th align=CENTER nowrap width="8%"> <div align="center">Fecha <BR> Otorgamiento</div> </th>
            <th align=CENTER nowrap width="8%"> <div align="center">Fecha <BR> Vencimiento</div> </th>
            <th align=CENTER nowrap width="8%"> <div align="center">Pago<BR>Capital</div> </th>
            <th align=CENTER nowrap width="8%"> <div align="center">Pago<BR>Intereses</div> </th>
            <th align=CENTER nowrap width="8%"> <div align="center">Tipo Garantía</div> </th>
            <th align=CENTER nowrap width="5%"> <div align="center">% Part.</div> </th>
           </tr>
          <%
                EDP080001Help.initRow();
                chk = "checked";
                while (EDP080001Help.getNextRow()) {
                 
                  datapro.eibs.beans.EDP080001Message msgList = (datapro.eibs.beans.EDP080001Message) EDP080001Help.getRecord();
		 %>
		<% if (!msgList.getD01DUEINS().equals("TOTAL")) { %>
          <tr> 
            <td NOWRAP  align=CENTER width="5%"> 
                <input type="radio" name="CURRCODE2" value="<%= EDP080001Help.getCurrentRow() %>" <%=chk%> onClick="getParams(this.value);">
            </td>
            <td NOWRAP  align=CENTER width=\"10%\"><%= msgList.getD01DUEINS() %></td>
            <td NOWRAP  align=CENTER width=\"10%\"><%= msgList.getE01DUEPDS() %></td>
            <td NOWRAP  align=CENTER width=\"8%\"><%= msgList.getE01DUEAMT() %></td>
            <td NOWRAP  align=CENTER width=\"8%\"><%= msgList.getE01DUEBAL() %></td>
            <td NOWRAP  align=CENTER width=\"8%\"><%= msgList.getE01DUEPYM() %></td>
            <td NOWRAP  align=CENTER width=\"5%\"><%= msgList.getE01DUERTE() %></td>
            <td NOWRAP  align=CENTER width=\"8%\"><%= msgList.getE01DUEOPD()%>/<%= msgList.getE01DUEOPM()%>/<%= msgList.getE01DUEOPY()%></td>	
            <td NOWRAP  align=CENTER width=\"8%\"><%= msgList.getE01DUEMAD()%>/<%= msgList.getE01DUEMAM()%>/<%= msgList.getE01DUEMAY()%></td>	
            <td NOWRAP  align=CENTER width=\"8%\"><%= msgList.getD01DUEPPR() %></td>
            <td NOWRAP  align=CENTER width=\"8%\"><%= msgList.getD01DUEPIN() %></td>
            <td NOWRAP  align=CENTER width=\"8%\"><%= msgList.getD01DUETYG() %></td>
            <td NOWRAP  align=CENTER width=\"5%\"><%= msgList.getE01DUEPPA() %></td>
          </tr>
 	        <% } else { %>
          <tr id="trdark"> 
            <th NOWRAP  align=CENTER width="5%"> 
            </th>
            <th NOWRAP  align=CENTER width=\"10%\"><%= msgList.getD01DUEINS() %></th>
            <th NOWRAP  align=CENTER width=\"10%\"></th>
            <th NOWRAP  align=CENTER width=\"8%\"><%= msgList.getE01DUEAMT() %></th>
            <th NOWRAP  align=CENTER width=\"8%\"><%= msgList.getE01DUEBAL() %></th>
            <th NOWRAP  align=CENTER width=\"8%\"><%= msgList.getE01DUEPYM() %></th>
            <th NOWRAP  align=CENTER width=\"5%\"></th>
            <th NOWRAP  align=CENTER width=\"8%\"></th>	
            <th NOWRAP  align=CENTER width=\"8%\"></th>	
            <th NOWRAP  align=CENTER width=\"8%\"></th>
            <th NOWRAP  align=CENTER width=\"8%\"></th>
            <th NOWRAP  align=CENTER width=\"8%\"></th>
            <th NOWRAP  align=CENTER width=\"5%\"></th>
          </tr>
          <%};
              				chk = "";     
                }
              %>
        </table>
  </table>
  
  <BR>
  <TABLE class="tbenter" WIDTH="98%" ALIGN=CENTER>
  <TR>
  <TD WIDTH="50%" ALIGN=LEFT>
  <%
        if ( EDP080001Help.getShowPrev() ) {
		int pos = EDP080001Help.getFirstRec() - 20;
   			out.println("<A HREF=\""+request.getContextPath()+"/servlet/datapro.eibs.creditproposal.JSEDP0800?SCREEN=200&Pos=" + pos +"\"><img src=\""+request.getContextPath()+"/images/s/previous_records.gif\" border=0></A>");
        }
  %>
  </TD>
  <TD WIDTH="50%" ALIGN=RIGHT>
  <%
        if ( EDP080001Help.getShowNext() ) {
		int pos = EDP080001Help.getLastRec();
   			out.println("<A HREF=\""+request.getContextPath()+"/servlet/datapro.eibs.creditproposal.JSEDP0800?SCREEN=200&Pos=" + pos +"\"><img src=\""+request.getContextPath()+"/images/s/next_records.gif\" border=0></A>");
        }
  %> 
 </TD>
 </TR>
 </TABLE>
  
  
  <SCRIPT type="text/javascript">
 showChecked("CURRCODE");
</SCRIPT>
<%}%>
</form>
</body>
</html>