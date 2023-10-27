<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@page import="datapro.eibs.master.Util"%>
<html>
<head>
<title>Solicitudes</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "EDD1500Help" class= "datapro.eibs.beans.JBObjList"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>
<jsp:useBean id="currUser" class="datapro.eibs.beans.ESS0030DSMessage" scope="session" />

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<jsp:useBean id="solBasic" class="datapro.eibs.beans.EDD150001Message" scope="session" />

<script type="text/javascript">


function goAction(op) {

	document.forms[0].opt.value = op;
	document.forms[0].submit();
  
}


</SCRIPT>  

</head>

<BODY>
<h3 align="center">Aprobacion Solicitudes de Clientes<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" alt="sol_request_list_aprob.jsp,EDD1500"> 
<hr size="4">
<FORM name="form1" METHOD="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDD1500" >
  <input type=HIDDEN name="SCREEN" value="2">
  <input type=HIDDEN name="opt" value="3">
  <input type=HIDDEN name="totalRow" value="0">
  <input type=HIDDEN name="CCY" value="">
  <input type=HIDDEN name="BNK" value="">
   
  <%
	if ( EDD1500Help.getNoResult() ) {
 %>
  
  <TABLE class="tbenter" width="100%" >
    <TR>
      <TD > 
        <div align="center"> 
          <p><b>No hay resultados para su b&uacute;squeda</b></p>
          <table class="tbenter" width=100% align=center>
           <tr>
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


          
  <table class="tbenter" width=100% align=center>
    <tr> 
      <td class=TDBKG width="15%"> 
        <div align="center" style="cursor:hand" ><a href="javascript:goAction(5)"><b>Aprobar</b></a></div>
      </td>
      <td class=TDBKG width="15%"> 
        <div align="center" style="cursor:hand" ><a href="javascript:goAction(6)"><b>Rechazar</b></a></div>
      </td>
      <td class=TDBKG width="15%"> 
        <div align="center" style="cursor:hand" ><a href="javascript:goAction(7)"><b>Anular</b></a></div>
      </td>
      <td class=TDBKG width="15%"> 
        <div align="center" style="cursor:hand" ><a href="javascript:goAction(8)"><b>Eliminar</b></a></div>
      </td>
      <td class=TDBKG width="15%"> 
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
            <th align=CENTER nowrap width="10%">&nbsp;</th>
            <th align=CENTER nowrap width="10%"> 
              <div align="center">Cliente</div>
            </th>
            <th align=CENTER nowrap width="10%"> 
              <div align="center">Numero </div>
            </th>
            <th align=CENTER nowrap width="30%"> 
              <div align="center"> Tipo Solicitud </div>
            </th>
            <th align=CENTER nowrap width="30%"> 
              <div align="center"> Motivo </div>
            </th>
            <th align=CENTER nowrap width="10%"> 
              <div align="center"> Fecha Ingreso </div>
            </th>
             <th align=CENTER nowrap width="10%"> 
              <div align="center"> Fecha Vencimiento </div>
            </th>
            <th align=CENTER nowrap width="10%"> 
              <div align="center">  Estado </div>
            </th>
          </tr>
          <%
                EDD1500Help.initRow();
				boolean firstTime = true;
				String chk = "";
				int idx = 0;
				String valStyle = "";
        		while (EDD1500Help.getNextRow()) {
					if (firstTime) {
						firstTime = false;
						chk = "checked";
					} else {
						chk = "";
					}
					if (idx++ % 2 != 0)
						valStyle = "trdark";
					else
						valStyle = "trclear";
                  	datapro.eibs.beans.EDD150001Message msgList = (datapro.eibs.beans.EDD150001Message) EDD1500Help.getRecord();
		 %>
				<TR id="<%= valStyle %>">
						
					<TD NOWRAP  ALIGN=CENTER width="10%">
					<input type="radio" name="CURRCODE" value="<%= EDD1500Help.getCurrentRow() %>"  <%=chk%> ></TD>
					<TD NOWRAP  ALIGN=left width=\"10%\"><%= msgList.getE01REQCUN() %>   <%= msgList.getE01REQNAM() %></td>
					<TD NOWRAP  ALIGN=CENTER width=\"10%\"><%= msgList.getE01REQNUM() %></td>
					<TD NOWRAP  ALIGN=left width=\"10%\"><%= msgList.getD01REQTYP() %></td>
					<TD NOWRAP  ALIGN=left width=\"10%\"><%= msgList.getD01REQCAU() %></td>
			        <TD NOWRAP align="center" width=\"10%\" ><%= Util.formatCustomDate(currUser.getE01DTF(),
			        		msgList.getBigDecimalE01REQSMM().intValue(),
			        		msgList.getBigDecimalE01REQSDD().intValue(),
			        		msgList.getBigDecimalE01REQSYY().intValue())%></td>
			        <TD NOWRAP align="center" width=\"10%\" ><%= Util.formatCustomDate(currUser.getE01DTF(),
			        		msgList.getBigDecimalE01REQMMM().intValue(),
			        		msgList.getBigDecimalE01REQMDD().intValue(),
			        		msgList.getBigDecimalE01REQMYY().intValue())%></td>
			        <TD nowrap width="35%" align="left">
				        <INPUT type="HIDDEN" name="E01REQSTS" size="1" value="<%= msgList.getE01REQSTS().trim()%>">
							<% if (msgList.getE01REQSTS().equals("I")) out.print("INGRESADA");
			   					 else if (msgList.getE01REQSTS().equals("A")) out.print("APROBADA");
			   					 else if (msgList.getE01REQSTS().equals("O")) out.print("ING. CON OBS.");
			   					 else if (msgList.getE01REQSTS().equals("P")) out.print("PAGADA");
			   					 else if (msgList.getE01REQSTS().equals("R")) out.print("RECHAZADA");
		    					 else if (msgList.getE01REQSTS().equals("N")) out.print("ANULADA");
			    				 else if (msgList.getE01REQSTS().equals("V")) out.print("VENCIDA"); %>
	 		       </TD>
 				</TR>
		 <%
                }
              %>
        </table>
    </table>
     
  <%}%>

<SCRIPT type="text/javascript">
  
  showChecked("CURRCODE"); 

 function tableresize() {
    adjustEquTables(headTable,dataTable,dataDiv,0,true);
   }
  tableresize();
  window.onresize=tableresize;  

</SCRIPT>

</form>

</body>
</html>
