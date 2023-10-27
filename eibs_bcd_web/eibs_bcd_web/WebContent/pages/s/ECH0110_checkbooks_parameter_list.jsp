<%@ page import = "datapro.eibs.master.Util" %>
<html>
<head>
<title>Maestro de Agencias</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "ECH011001Help" class= "datapro.eibs.beans.JBObjList"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>

<script type="text/javascript">



function goAction(op) {
	if(op=="3"){
		if (!confirm("Desea borrar el Registro seleccionado?")) {
		return;
		}
	}
	document.forms[0].opt.value = op;
	document.forms[0].submit();
  
}


function getParams(bank,branch) {

    document.forms[0].BANK.value = account;
    document.forms[0].BRANCH.value = branch;
}


</SCRIPT>  

</head>

<BODY>
<h3 align="center">Parametros de Control de Chequeras<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="checkbooks_parameter_list.jsp, ECH0110"></h3>
<hr size="4">
<FORM name="form1" METHOD="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.params.JSECH0110" >
  <p> 
    <input type=HIDDEN name="SCREEN" value="800">
    <input type=HIDDEN name="totalRow" value="0">
    <input type=HIDDEN name="BANK">
    <input type=HIDDEN name="BRANCH">
   
    <input type=HIDDEN name="opt">
  </p>
  <p> 
    <%
	if ( ECH011001Help.getNoResult() ) {
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
      <td class=TDBKG width="30%"> 
        <div align="center"><a href="javascript:goAction(1)"><b>Crear</b></a></div>
      </td>
       <td class=TDBKG width="30%"> 
        <div align="center"><a href="javascript:goAction(2)"><b>Modificar</b></a></div>
      </td>
      <td align="center" class="tdbkg" width="20%">
           <div align="center"><a href="javascript:goAction('3')"><b>Borrar </b></a></div>
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
            <th align=CENTER nowrap width="10%">Tipo</th>
            <th align=CENTER nowrap width="40%"> 
              <div align="center">Nombre</div>
            </th>
            <th align=CENTER nowrap width="10%"> 
              <div align="center">N&uacute;mero <br>de Cheques</div>
            </th>
            <th align=CENTER nowrap width="10%">Cobro <br>Comisión</th>
            <th align=CENTER nowrap width="10%">Cobro <br>Timbre</th>
            <th align=CENTER nowrap width="10%">Clase<br> Chequera</th>
          </tr>
          <%
                ECH011001Help.initRow();
				boolean firstTime = true;
				String chk = "";
        		while (ECH011001Help.getNextRow()) {
					if (firstTime) {
						firstTime = false;
						chk = "checked";
					} else {
						chk = "";
					}
                  datapro.eibs.beans.ECH011001Message msgList = (datapro.eibs.beans.ECH011001Message) ECH011001Help.getRecord();
		 %>
          <tr> 
            <td NOWRAP  align=CENTER width="10%"> 
              <input type="radio" name="CURRCODE" value="<%= ECH011001Help.getCurrentRow() %>"  <%=chk%> >
            </td>
            <td NOWRAP  align="CENTER" width="10%"><%= msgList.getE01CHKTCB() %></td>
            <td NOWRAP  align="LEFT" width="40%"><%= msgList.getE01CHKDES() %></td>
            <td NOWRAP  align=CENTER width="10%"><%= msgList.getE01CHKNCK() %></td>
            <td NOWRAP  align=CENTER width="10%"><% if(!msgList.getE01CHKUC1().equals("") && !msgList.getE01CHKUC1().equals("0000")) out.print("SI"); else out.print("NO"); %></td>
            <td NOWRAP  align=CENTER width="10%"><% if(msgList.getE01CHKFL3().equals("Y")) out.print("SI"); else out.print("NO"); %></td>
            <td NOWRAP  align=CENTER width="10%"><% if(msgList.getE01CHKRQD().equals("Y")) out.print("Universal"); else out.print("Personalizada"); %></td>
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
