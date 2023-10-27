<html>
<head>
<title>Consulta Ajustes a Pr&eacute;stamos (F.E.C.I)</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<%@ page import = "datapro.eibs.master.Util" %>

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>

<jsp:useBean id= "lnTransac" class= "datapro.eibs.beans.EDL015203Message"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>

<SCRIPT type="text/javascript">

   builtNewMenu(ln_a_opt);
   initMenu();

</SCRIPT>
</head>

<body nowrap>

<% 
 if ( !error.getERRNUM().equals("0")  ) {
     error.setERRNUM("0"); 
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
 }
%>

<SCRIPT type="text/javascript">
builtHPopUp();

function showPopUp(opth,field,bank,ccy,field1,field2,opcod) {
   init(opth,field,bank,ccy,field1,field2,opcod);
   showPopupHelp();
   }
   
function Recalculate(){

}

</SCRIPT>

<h3 align="center">Consulta Ajustes a Pr&eacute;stamos (F.E.C.I)<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="ln_transac_feci_inquiry.jsp, EDL0150"></h3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDL0152">
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="16">
   <INPUT TYPE=HIDDEN NAME="E03DEABNK" VALUE="<%= lnTransac.getE03DEABNK().trim()%>">
  <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
          <tr id="trdark"> 
            <td nowrap width="16%" > 
              <div align="right"><b>Cliente :</b></div>
            </td>
            <td nowrap width="20%" > 
              <div align="left"> 
                <input type="text" name="E03DEACUN" size="10" maxlength="9" value="<%= lnTransac.getE03DEACUN().trim()%>" readonly>
              </div>
            </td>
            <td nowrap width="16%" > 
              <div align="right"><b>Nombre :</b> </div>
            </td>
            <td nowrap colspan="3" > 
              <div align="left"><font face="Arial"><font face="Arial"><font size="2"> 
                <input type="text" name="E03CUSNA1" size="45" maxlength="45" value="<%= lnTransac.getE03CUSNA1().trim()%>" readonly>
                </font></font></font></div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="16%"> 
              <div align="right"><b>Préstamo :</b></div>
            </td>
            <td nowrap width="20%"> 
              <div align="left"> 
                <input type="text" name="E03DEAACC" size="13" maxlength="12" value="<%= lnTransac.getE03DEAACC().trim()%>" readonly>
              </div>
            </td>
            <td nowrap width="16%"> 
              <div align="right"><b>Moneda : </b></div>
            </td>
            <td nowrap width="16%"> 
              <div align="left"><b> 
                <input type="text" name="E03DEACCY" size="3" maxlength="3" value="<%= lnTransac.getE03DEACCY().trim()%>" readonly>
                </b> </div>
            </td>
            <td nowrap width="16%"> 
              <div align="right"><b>Producto : </b></div>
            </td>
            <td nowrap width="16%"> 
              <div align="left"><b> 
                <input type="text" name="E03DEAPRO" size="4" maxlength="4" value="<%= lnTransac.getE03DEAPRO().trim()%>" readonly>
                </b> </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  
  <h4>Informaci&oacute;n del Préstamo</h4>
  
  <%int row = 0; %>
<TABLE class="tableinfo">
     <TBODY>
        <TR> 
      <TD nowrap> 
        <TABLE cellspacing="2" cellpadding="2" width="100%" border="0">
          <TBODY>
             <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <TD nowrap width="20%" > 
              <DIV align="center"></DIV>
            </TD>
            <TD nowrap width="40%" class="trdark"> 
              <DIV align="center"><B>Antes</B></DIV>
            </TD>
            <TD nowrap width="40%" class="trdark"> 
              <DIV align="center"><B>Después</B></DIV>
            </TD>
          </TR>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <TD nowrap > 
              <DIV align="right">F.E.C.I :</DIV>
            </TD>
            <TD nowrap align="center"> 
              <INPUT class="txtright" type="text" readonly name="E03DEAPRI" size="15" maxlength="13" 
              value="<%=Util.formatCCY(lnTransac.getE03DEAPRI())%>" >
            </TD>
            <TD nowrap align="center"> 
              <INPUT class="txtright" type="text" readonly name="AFTERPRI" size="15" maxlength="13" value="
              <% if (lnTransac.getE03TRNPRF().equals("5")) 
              		{
              			out.print(lnTransac.getBigDecimalE03DEAPRI().subtract(lnTransac.getBigDecimalE03TRNPRI()));
              		} 
              		if (lnTransac.getE03TRNPRF().equals("0")) 
              		{
              		 	out.print(lnTransac.getBigDecimalE03DEAPRI().add(lnTransac.getBigDecimalE03TRNPRI())); 
              		}
              	%>" >
            </TD>
          </TR>
         <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <TD nowrap > 
              <DIV align="right">F.E.C.I Vencido :</DIV>
            </TD>
            <TD nowrap align="center"> 
              <INPUT class="txtright" type="text" readonly name="E03DEAINT" size="15" maxlength="13" value="<%= Util.formatCCY(lnTransac.getE03DEAINT()) %>">
            </TD>
            <TD nowrap align="center"> 
              <INPUT class="txtright" type="text" readonly name="AFTERINT" size="15" maxlength="13" value="
              <% if(lnTransac.getE03TRNINF().equals("5")) 
              		{
              		    out.print(lnTransac.getBigDecimalE03DEAINT().subtract(lnTransac.getBigDecimalE03TRNINT()));
              		}
              		if(lnTransac.getE03TRNINF().equals("0")) 
              		{
              			out.print(lnTransac.getBigDecimalE03DEAINT().add(lnTransac.getBigDecimalE03TRNINT())); 
              		}
              	%>">
            </TD>
          </TR>
       	</TBODY>
        </TABLE>
      	</TD>
    </TR>
  </TBODY>
</TABLE>

  <h4>Datos de la Transacci&oacute;n</h4>
  <table class="tableinfo">
    <tr > 
      <td> 
        <table cellspacing=0 cellpadding=2 width="100%" border="0">
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td width="40%"> 
              <div align="right">F.E.C.I :</div>
            </td>
            <td width="60%"> 
              <input type="text" name="E03TRNPRI" size="15" maxlength="15" value="<%= lnTransac.getE03TRNPRI().trim()%>" readonly>
              <input type="hidden" name="E03TRNPRF" value="<%= lnTransac.getE03TRNPRF()%>">
              <input type="radio" name="CE03TRNPFL" value="0" <%if(lnTransac.getE03TRNPRF().equals("0")) out.print("checked");%> disabled>
              Aumento 
              <input type="radio" name="CE03TRNPFL" value="5" <%if(lnTransac.getE03TRNPRF().equals("5")) out.print("checked");%> disabled>
              Disminuci&oacute;n</td>
          </tr>
		  <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td width="40%" height="27"> 
              <div align="right">F.E.C.I Vencido :</div>
            </td>
            <td width="60%" height="27"> 
              <input type="text" name="E03TRNINT" size="15" maxlength="15" value="<%= lnTransac.getE03TRNINT().trim()%>" readonly>
              <input type="hidden" name="E03TRNINF" value="<%= lnTransac.getE03TRNINF()%>">
              <input type="radio" name="CE03TRNINF" value="0" <%if(lnTransac.getE03TRNINF().equals("0")) out.print("checked");%> disabled>
			   Aumento
			   <input type="radio" name="CE03TRNINF" value="5" <%if(lnTransac.getE03TRNINF().equals("5")) out.print("checked");%> disabled>
               Disminuci&oacute;n</td>
          </tr>
        </table>
        
      </td>
    </tr>
  </table>

</form>
</body>
</html>
