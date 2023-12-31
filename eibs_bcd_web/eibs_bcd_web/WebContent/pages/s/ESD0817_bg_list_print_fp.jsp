<%@ page import = "datapro.eibs.master.Util" %>

<HTML>
<HEAD>
<TITLE> Estado de Cuentas  </TITLE>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
</HEAD>

<jsp:useBean id= "cifList" class= "datapro.eibs.beans.JBList"  scope="session" />
<jsp:useBean id="lcBalances" class="datapro.eibs.beans.ESD081702Message"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />

<BODY>


<SCRIPT SRC="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>

<SCRIPT type="text/javascript">

function doPrint(){
	if(!window.print){
       var msg ="Debe actualizar su navegador para imprimir";
	   alert(msg);
	   return;}

    window.focus();
	window.print();

	return;
}

function checkSubmit(){
 document.forms[0].submit();
}

</SCRIPT>

<% 
 if ( !error.getERRNUM().equals("0")  ) {
     error.setERRNUM("0");
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
 }
%> 

<h3 align="center">Estado de Cuentas<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="lc_list_print_fp.jsp,ESD0817"> 
  </h3>
  <hr size="4">
  <FORM>
<%if ( cifList.getNoResult() ) {%>
	<TABLE class="tbenter" width=100% height=60%>
   	<TR>
      <TD> 
         <h4 style="text-align:center">No hay resultados que correspondan a su criterio de b�squeda</h4>
      </TD>
    </TR>
 	</TABLE>   		
<%	}else{ %>
  <%int row = 0; %>
  <table class="tableinfo">
    <tr > 
      <td > 
        <table cellspacing=0 cellpadding=2 width="100%" border="0">
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td  width="30%" height="15" nowrap> 
              <div align="right"><b>Nombre y Direcci&oacute;n :</b></div>
            </td>
            <td  width="32%" height="15"> 
              <div align="left"></div>
              <%= lcBalances.getE02CUMMA1().trim()%></td>
            <td  width="25%" height="15"> 
              <div align="right"><b>Boleta :</b></div>
            </td>
            <td  width="13%" height="15" nowrap> 
              <div align="right"><%= userPO.getIdentifier().trim()%></div>
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td  width="30%"> 
              <div align="right"></div>
            </td>
            <td  width="28%" height="15"> 
              <div align="left"><%= lcBalances.getE02CUMMA2().trim()%></div>
            </td>
            <td  width="25%" nowrap> 
              <div align="right"><b>Monto</b> <%= lcBalances.getE02CIFCCY().trim()%> 
                <b>Original :</b></div>
            </td>
            <td  width="13%"> 
              <div align="right"><%= Util.fcolorCCY(lcBalances.getE02AMOUN1().trim())%></div>
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td  width="30%" nowrap> 
              <div align="right"><b> </b></div>
            </td>
            <td  width="28%" nowrap> 
              <div align="left"><%= lcBalances.getE02CUMMA3().trim()%></div>
            </td>
            <td  width="25%" nowrap> 
              <div align="right"><b>Saldo :</b></div>
            </td>
            <td  width="15%"> 
              <div align="right"><%= Util.fcolorCCY(lcBalances.getE02AMOUN2().trim())%></div>
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td  width="30%" nowrap> 
              <div align="right"></div>
            </td>
            <td  width="28%"> 
              <div align="left"><%= lcBalances.getE02CUMMA4().trim()%></div>
            </td>
            <td  width="25%" nowrap> 
              <div align="right"><b>Saldo Negociado :</b></div>
            </td>
            <td  width="15%"> 
              <div align="right"><%= Util.fcolorCCY(lcBalances.getE02AMOUN3().trim())%></div>
            </td>
          </tr>
         <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td  width="32%" nowrap> 
              <div align="right"><b>Fecha de Emisi&oacute;n :</b></div>
            </td>
            <td  width="28%" nowrap> 
              <div align="left"><%= Util.formatCustomDate(currUser.getE01DTF(),
              											lcBalances.getBigDecimalE02DATEAM().intValue(),
              											lcBalances.getBigDecimalE02DATEAD().intValue(),
              											lcBalances.getBigDecimalE02DATEAY().intValue())%></div>
            </td>
            <td  width="25%" nowrap> 
              <div align="right"><b>Fecha de Expiraci&oacute;n :</b></div>
            </td>
            <td  width="15%"> 
              <div align="right"><%= Util.formatCustomDate(currUser.getE01DTF(),
              											lcBalances.getBigDecimalE02DATEBM().intValue(),
              											lcBalances.getBigDecimalE02DATEBD().intValue(),
              											lcBalances.getBigDecimalE02DATEBY().intValue())%></div>
            </td>
          </tr>
      <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td  width="30%"> 
              <div align="right"><b>Facsimil :</b></div>
            </td>
            <td  width="32%" nowrap> 
              <div align="left"><%= lcBalances.getE02CUSFAX().trim()%></div>
            </td>
            <td  width="25%" nowrap height="20"> 
              <div align="right"><b>Correo Electr&oacute;nico :</b></div>
            </td>
            <td  width="15%" nowrap height="20"> 
              <div align="right"><a href="mailto:<%= lcBalances.getE02CUSIAD().trim()%>" target="body"><%= lcBalances.getE02CUSIAD().trim()%></a></div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <p>&nbsp;</p>
  <TABLE  class="tableinfo">
    <tr id="trdark"> 
      <TH ALIGN=CENTER  >Fecha Proceso</TH>
      <TH ALIGN=CENTER  > Fecha Valor</TH>
      <TH ALIGN=CENTER  >TC</TH>
      <TH ALIGN=CENTER  >Descripci&oacute;n</TH>
      <TH ALIGN=CENTER  >D&eacute;bitos</TH>
      <TH ALIGN=CENTER  >Cr&eacute;ditos</TH>
      <TH ALIGN=CENTER  >Lote</TH>
    </TR>
    <%
                cifList.initRow();
                while (cifList.getNextRow()) {
                    if (cifList.getFlag().equals("")) {
                    		out.println(cifList.getRecord());
                    }
                }
              %> 
  </TABLE>

  
  <p>&nbsp;</p>
  <table width="100%">
    <tr> 
      <td width="20%"> 
        <div align="center"><b>Totales</b></div>
      </td>
      <td width="45%"><b>D&eacute;bitos</b> : <%= userPO.getHeader19().trim()%></td>
      <td width="35%"><b>Cr&eacute;ditos </b> : <%= userPO.getHeader20().trim()%></td>
    </tr>
  </table>
  

  <%
  }
%> 
  
</FORM>

</BODY>
</HTML>
