<%@ page import ="datapro.eibs.master.Util" %>
<html>
<head>
<title>Lista Codigos de Formatos</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "EDP074701Help" class= "datapro.eibs.beans.JBObjList"  scope="session" />
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
	 break;	
	case  2:  //ok = confirm(msg1 + " Actualizar " + msg2);
	          //    document.forms[0].SCREEN.value="600";
	 break;   
	case  3: ok = confirm(msg1 + " Eliminar " + msg2);
	             document.forms[0].SCREEN.value="700";
	 break;
	};
	// alert(document.forms[0].SCREEN.value);
	document.forms[0].submit();		  	
}


function getParams(currrow,cacti,dacti) {

	document.forms[0].CURRENTROW.value = currrow;
    //document.forms[0].cacti.value = cacti;
    //document.forms[0].dacti.value = dacti;
}


</SCRIPT>  

</head>

<BODY>
<h3 align="center">Parametros Propuesta</h3>
<P align="center">
	<IMG src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" alt="parametros_list1.jsp, EDP0747">
</P>
<HR size="4" width="100%" align="right">
<FORM name="form1" METHOD="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.creditproposal.JSEDP0747" >
  <p> 
    <INPUT TYPE=HIDDEN NAME="CURRENTROW" VALUE="0"> 
    <input type=HIDDEN name="SCREEN" value="800">
    <input type=HIDDEN name="totalRow" value="0">
    <input type=HIDDEN name="opt">
  </p>
  <p> 
    <%
	if ( EDP074701Help.getNoResult() ) {
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
      <td class=TDBKG width="20%"> 
        <div align="center"><a href="javascript:goAction(1)"><b>Crear</b></a></div>

     </td>
     <td class=TDBKG width="20%"> 
        <div align="center"><a href="javascript:goAction(5)"><b>Consultar</b></a></div>
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
            <th align=CENTER nowrap width="10%">&nbsp;</th>
            <th align=CENTER nowrap width="10%"> 
              <div align="center">Banco</div>
            </th>
            <th align=CENTER nowrap width="15%"> 
              <div align="center">Aplicaci&oacute;n C&oacute;digo</div>
            </th>
            <th align=CENTER nowrap width="10%"> 
              <div align="center">Tipo de Cuenta</div>
            </th>
            <th align=CENTER nowrap width="10%"> 
              <div align="center">Seguridad</div>
            </th>
            <th align=CENTER nowrap width="10%"> 
              <div align="center">Permanencia</div>
            </th>
            <th align=CENTER nowrap width="10%"> 
              <div align="center">Dias Vencimiento</div>
            </th>
            <th align=CENTER nowrap width="10%"> 
              <div align="center">Dias Aprobacion</div>
            </th>
            <th align=CENTER nowrap width="10%"> 
              <div align="center">Dias Desembolso</div>
            </th>
           </tr>
          <%
                EDP074701Help.initRow();
                chk = "checked";
                while (EDP074701Help.getNextRow()) {
                  datapro.eibs.beans.EDP074701Message msgList = (datapro.eibs.beans.EDP074701Message) EDP074701Help.getRecord();
		 %>
          <tr> 
            <td NOWRAP  align=CENTER width="10%"> 
              
                <input type="radio" name="CURRCODE2" value="<%= EDP074701Help.getCurrentRow() %>" <%=chk%> onClick="getParams(this.value);">
            </td>
            <td NOWRAP  align=CENTER width=\"10%\"><%= msgList.getE01DPRBNK() %></td>
			<td NOWRAP  align=CENTER width=\"35%\"><%= msgList.getE01DPRACD() %></td>
			<td NOWRAP  align=CENTER width=\"35%\"><%= msgList.getE01DPRATY() %></td> 
			<td NOWRAP  align=CENTER width=\"35%\"><%= msgList.getE01DPRSEQ() %></td> 
			<td NOWRAP  align=CENTER width=\"35%\"><%= msgList.getE01DPRONL() %></td> 
			<td NOWRAP  align=CENTER width=\"35%\"><%= msgList.getE01DPRDVE() %></td> 
			<td NOWRAP  align=CENTER width=\"35%\"><%= msgList.getE01DPRDAP() %></td> 
			<td NOWRAP  align=CENTER width=\"35%\"><%= msgList.getE01DPRDDE() %></td>
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
