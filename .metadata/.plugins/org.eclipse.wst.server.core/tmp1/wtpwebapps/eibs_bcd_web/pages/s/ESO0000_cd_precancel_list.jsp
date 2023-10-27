<html>
<head>
<title>Solicitud de Pre-Cancelaci�n</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<%@ page import = "datapro.eibs.master.Util" %>

<jsp:useBean id= "cdList" class= "datapro.eibs.beans.JBObjList"  scope="session" />
<jsp:useBean id= "msgCD" class= "datapro.eibs.beans.ESO000001Message"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" /> 

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
 
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>
 

<script type="text/javascript">

function goAction(op) {
	document.forms[0].opt.value = op;
	if (op == 4){
		if(confirm("�Est� seguro que desea eliminar esta solicitud?")){
			document.forms[0].submit();
		} 
	} else {
		document.forms[0].submit();
	}
}	

</SCRIPT>  

</head>

<BODY>
<h3 align="center">Solicitud de Pre-Cancelaci�n<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="cd_precancel_list.jsp, ESO0000"></h3>
<hr size="4">
<FORM name="form1" METHOD="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSESO0000" >
  <input type=HIDDEN name="SCREEN" value="200">
  <input type=HIDDEN name="opt" value="1">
  <input type=HIDDEN name="totalRow" value="0">
  
  <%
	if ( cdList.getNoResult() ) {
 %>
  <p>&nbsp;</p><TABLE class="tbenter" width="100%" >
    <TR>
      <TD > 
        <div align="center"> 
          <p><b>No hay resultados para su b&uacute;squeda</b></p>
          <table class="tbenter" width=100% align=center>
           <tr>
            <td class=TDBKG>
        		<div align="center"><a href="javascript:goAction(1)"><b>Crear</b></a></div>
              </td>
              <td class=TDBKG>
                <div align="center"><a href="<%=request.getContextPath()%>/pages/background.jsp"><b>Salir</b></a></div>
              </td>
           </tr>
         </table>
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
      <td class=TDBKG> 
        <div align="center"><a href="javascript:goAction(1)"><b>Crear</b></a></div>
      </td>
      <td class=TDBKG> 
        <div align="center"><a href="javascript:goAction(2)"><b>Modificar</b></a></div>
      </td>
      <td class=TDBKG> 
        <div align="center"><a href="javascript:goAction(4)"><b>Borrar</b></a></div>
      </td>
      <td class=TDBKG> 
        <div align="center"><a href="<%=request.getContextPath()%>/pages/background.jsp"><b>Salir</b></a></div>
      </td>
    </tr>
  </table>
   
  <br>
  
  <TABLE  id=cfTable class="tableinfo">
 <TR > 
    <TD NOWRAP valign="top" width="100%">
        <table id="headTable" width="100%">
          <tr id="trdark"> 
            <th align=CENTER nowrap width="2%">&nbsp;</th>
            <th align=CENTER nowrap width="18%"><div align="center">N�mero de Certificado</div></th>
            <th align=CENTER nowrap width="20%"><div align="center">Nombre del Cliente</div></th>
            <th align=CENTER nowrap width="20%"><div align="center">Capital</div></th>
            <th align=CENTER nowrap width="20%"><div align="center">Fecha de<br>Vencimiento</div></th>
            <th align=CENTER nowrap width="20%"><div align="center">Tipo de<br>Cancelaci�n</div></th>
          </tr>
     	<%
        cdList.initRow(); 
		boolean firstTime = true;
		String chk = "";
		String pvi = "";
        while (cdList.getNextRow()) {
			if (firstTime) {
				firstTime = false;
				chk = "checked";
			} else {
				chk = "";
			}
           datapro.eibs.beans.ESO000001Message msgPart = (datapro.eibs.beans.ESO000001Message) cdList.getRecord();
           
           if (msgPart.getE01SOLPVI().equals("A"))
           		pvi = "Acreditar en Cuenta";
           if (msgPart.getE01SOLPVI().equals("C"))
           		pvi = "Cheque de Gerencia";
           if (msgPart.getE01SOLPVI().equals("G"))
           		pvi = "Cuenta Puente";
           
     	%>               
        <TR>
			<TD NOWRAP width="2%"><input type="radio" name="ROW" value="<%= cdList.getCurrentRow()%>" <%=chk%> 
				onClick="document.forms[0].ROW.value = this.value;"></TD>
			<TD NOWRAP ALIGN="CENTER"><%=Util.formatCell(msgPart.getE01SOLACC())%></TD>
			<TD NOWRAP ALIGN="CENTER"><%=Util.formatCell(msgPart.getE01CUSNA1())%></TD>
			<TD NOWRAP ALIGN="CENTER"><%=Util.formatCell(msgPart.getE01SOLPRI())%></TD>
		  	<TD NOWRAP ALIGN="CENTER"><%=Util.formatCustomDate(currUser.getE01DTF(),
		  			msgPart.getBigDecimalE01DEAMAM().intValue(),
		  			msgPart.getBigDecimalE01DEAMAD().intValue(),
		  			msgPart.getBigDecimalE01DEAMAY().intValue()) %></TD>
			<TD NOWRAP ALIGN="CENTER"><%=Util.formatCell(pvi)%></TD>
		</TR>    		
    	<%}%>    
        </table>
    </table>
     
  <%}%>

<SCRIPT type="text/javascript">  
	showChecked("ROW"); 
</SCRIPT>
</form>

</body>
</html>
