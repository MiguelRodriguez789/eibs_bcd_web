<%@ page import ="datapro.eibs.master.Util" %>
<html>
<head>
<title>Lista Cuentas para Cambio Producto</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "ESD090001Help" class= "datapro.eibs.beans.JBObjList"  scope="session" />
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
	       document.forms[0].opt.value = op;
	       document.forms[0].submit();
	       }  
	  
	} else 
	
			{
	       document.forms[0].opt.value = op;
	       document.forms[0].submit();
	       }
	
	  
}


function getParams(currrow,acc,bank,apl,prod) {

	document.forms[0].CURRENTROW.value = currrow;
    document.forms[0].ACC.value = acc;
    document.forms[0].BANK.value = bank;
    document.forms[0].APL.value = apl;
    document.forms[0].PROD.value = prod;
}


</SCRIPT>  

</head>

<BODY>
<h3 align="center">Cambio de Productos <img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="branch_list.jsp, ESD0900"></h3>
<hr size="4">
<FORM name="form1" METHOD="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSESD0900" >
  <p> 
    <INPUT TYPE=HIDDEN NAME="CURRENTROW" VALUE="0"> 
    <input type=HIDDEN name="SCREEN" value="800">
    <input type=HIDDEN name="totalRow" value="0">
    <input type=HIDDEN name="ACC" value="             " size=13 maxlength=12>
    <input type=HIDDEN name="APL" value="   " size=3 maxlength=2>
    <input type=HIDDEN name="BANK" value="  " size=3 maxlength=2>
    <input type=HIDDEN name="PROD" value="    " size=5 maxlength=4>
    <input type=HIDDEN name="opt">
  </p>
  <p> 
    <%
	if ( ESD090001Help.getNoResult() ) {
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
                <div align="center"><a href="javascript:goAction(1)"><b>Nueva</b></a></div>
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
      <td class=TDBKG width="30%"> 
        <div align="center"><a href="javascript:goAction(1)"><b>Nueva</b></a></div>
<% //     </td> %>
<% //		<td class=TDBKG width="30%"> %>
<% //        <div align="center"><a href="javascript:goAction(2)"><b>Mantenimiento</b></a></div> %>
<% //      </td> %>

     </td>
		<td class=TDBKG width="30%">
        <div align="center"><a href="javascript:goAction(2)"><b>Mantenimiento</b></a></div> 
     </td> 

	  <td class=TDBKG width="30%"> 
        <div align="center"><a href="javascript:goAction(3)"><b>Borrado</b></a></div>
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
            <th align=CENTER nowrap width="10%">Modulo</th>
            <th align=CENTER nowrap width="10%"> 
              <div align="center">Descripcion</div>
            </th>
            <th align=CENTER nowrap width="10%"> 
              <div align="center">Cuenta</div>
            </th>
            <th align=CENTER nowrap width="35%"> 
              <div align="center">Cliente</div>
            </th>
            <th align=CENTER nowrap width="5%"> 
              <div align="center">Banco</div>
            </th>
            <th align=CENTER nowrap width="10%"> 
              <div align="center">T.Prod.</div>
            </th>
            <th align=CENTER nowrap width="10%"> 
              <div align="center">Prod.Ant.</div>
            </th>
            <th align=CENTER nowrap width="10%"> 
              <div align="center">Prod.Nuevo</div>
            </th>
            <th align=CENTER nowrap width="25%"> 
              <div align="center">Descripcion</div>
            </th>
            
           </tr>
          <%
                ESD090001Help.initRow();
                chk = "checked";
                while (ESD090001Help.getNextRow()) {
                 
                  datapro.eibs.beans.ESD090001Message msgList = (datapro.eibs.beans.ESD090001Message) ESD090001Help.getRecord();
		 %>
          <tr> 
            <td NOWRAP  align=CENTER width="10%"> 
              <input type="radio" name="CURRCODE" value="<%= ESD090001Help.getCurrentRow() %>" <%=chk%> onClick="getParams(this.value,'<%= msgList.getE01CHGACC() %>','<%= msgList.getE01CHGBNK() %>','<%= msgList.getE01CHGACD() %>','<%= msgList.getE01CHGPRC() %>');">
            </td>
            <td NOWRAP  align=CENTER width=\"10%\"><%= msgList.getE01CHGACD() %></td>
			<td NOWRAP  align=CENTER width=\"25%\"><%= msgList.getE01MODDSC() %></td>
            <td NOWRAP  align=CENTER width=\"10%\"><%= msgList.getE01CHGACC() %></td>
            <td NOWRAP  align=CENTER width=\"35%\"><%= msgList.getE01CUSNA1() %></td>
            <td NOWRAP  align=CENTER width=\"5%\"><%= msgList.getE01CHGBNK() %></td>
            <td NOWRAP  align=CENTER width=\"10%\"><%= msgList.getE01CHGPRT() %></td>
            <td NOWRAP  align=CENTER width=\"10%\"><%= msgList.getE01CHGPRO() %></td>
            <td NOWRAP  align=CENTER width=\"10%\"><%= msgList.getE01CHGPRC() %></td>
            <td NOWRAP  align=CENTER width=\"25%\"><%= msgList.getE01PRDDSC() %></td>

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
