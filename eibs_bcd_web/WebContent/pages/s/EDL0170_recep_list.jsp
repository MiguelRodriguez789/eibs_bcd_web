<%@ page import = "datapro.eibs.master.Util" %>
<html>
<head>
<title>Recepcion de documentos papel valor Plazo Fijo</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "EDL017001" class= "datapro.eibs.beans.JBObjList"  scope="session" />
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
	if(confirm("Esta seguro que desea eliminar este lote?")){
		document.forms[0].opt.value = 3;
		document.forms[0].submit();
	}		  
}

</SCRIPT>  
</head>

<BODY>
<h3 align="center">Recepcion de documentos papel valor Plazo Fijo<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="recep_list.jsp, EDL0170"></h3>
<hr size="4">
<FORM name="form1" METHOD="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.params.JSEDL0170" >
  <p> 
    <input type=HIDDEN name="SCREEN" value="800">
    <input type=HIDDEN name="totalRow" value="0">
    <input type=HIDDEN name="opt">
  </p>
  
  <p> 
    <%
	if ( EDL017001.getNoResult() ) {
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
                <div align="center"><a href="<%=request.getContextPath()%>/pages/background.jsp"><b>Salir</b></a></div>
              </td>
            </tr>
          </table>
          <p>&nbsp;</p>          
        </div>
	  </TD>
	</TR>
  </TABLE>	
  <%} else {
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
        <div align="center"><a href="javascript:goAction(2)"><b>Recibir</b></a></div>
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
            <th align=CENTER nowrap width="10%">Sucursal</th>
            <th align=CENTER nowrap width="10%">Inicio</th>
            <th align=CENTER nowrap width="10%">Final</th>
            <th align=CENTER nowrap width="10%">Total</th>
            <th align=CENTER nowrap width="10%">Estatus</th>
          </tr>
          <%    EDL017001.initRow();
				boolean firstTime = true;
				String chk = "";
        		while (EDL017001.getNextRow()) {
					if (firstTime) {
						firstTime = false;
						chk = "checked";
					} else {
						chk = "";
					}
                  	datapro.eibs.beans.EDL017001Message msgList = (datapro.eibs.beans.EDL017001Message) EDL017001.getRecord();
		 %>
          <tr> 
            <td NOWRAP  align=CENTER width="5%"> 
              <input type="radio" name="CURRCODE" value="<%= EDL017001.getCurrentRow() %> "  <%=chk%> 
			  >
            </td>
            <td NOWRAP  align=CENTER width="10%"><%= msgList.getE01PFDBRN() %></td>
            <td NOWRAP  align=CENTER width="10%"><%= msgList.getE01PFDINI() %></td>
            <td NOWRAP  align=CENTER width="10%"><%= msgList.getE01PFDFIN() %></td>
            <td NOWRAP  align=CENTER width="10%"><%= msgList.getE01PFDTOT() %></td>
            <td NOWRAP  align=CENTER width="10%"><%= msgList.getD01PFDSTS() %></td>
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
