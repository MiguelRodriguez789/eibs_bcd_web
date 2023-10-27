<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@ page import = "datapro.eibs.master.Util" %>
<%@page import="com.datapro.constants.EibsFields"%>

<HTML>
<HEAD>
<TITLE> Impresión de Estado de Cuentas </TITLE>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
</HEAD>

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "cifList" class= "datapro.eibs.beans.JBList"  scope="session" />
<jsp:useBean id="stBalances" class="datapro.eibs.beans.EDL030002Message"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />

<BODY>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>

<SCRIPT type="text/javascript">
function doPrint(){
	if(!window.print){
       var msg ="Debe actualizar su navegador para imprimir";
	   alert(msg);
	   return;
	}
	
	document.getElementById('EIBSBTN').style.visibility = 'hidden';
	
    window.focus();
	window.print();

	document.getElementById('EIBSBTN').style.visibility = 'visible';
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

<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSEDL0300L" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="200">
  <h3 align="center">Estado de Cuentas<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="ln_list_print_fp.jsp,EDL0160"> 
  </h3>
  <hr size="4">
  <br>
  
  <%int row = 0; %>
  <table class="tableinfo">
    <tr > 
      <td > 
        <table cellspacing=0 cellpadding=2 width="100%" border="0">
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td  width="25%" height="15" nowrap> 
              <div align="right"><b>Nombre :</b></div>
            </td>
            <td  width="25%" height="15"> 
              <div align="left"><%= stBalances.getE02CUMNME().trim()%></div>
            </td>
            <td  width="25%" height="15"> 
              <div align="right"><b>Cuenta :</b></div>
            </td>
            <td  width="25%" height="15" nowrap> 
              <div align="right"><%= stBalances.getE02DEAACC().trim()%></div>
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td  width="25%"> 
              <div align="right"><b>Direcci&oacute;n :</b></div>
            </td>
            <td  width="25%" nowrap> 
              <div align="left"><%= stBalances.getE02CUMMA1().trim()%></div>
            </td>
            <td  width="25%" nowrap> 
              <div align="right"><b>Saldo</b> <%= stBalances.getE02DEACCY().trim()%> 
                <b>Principal :</b></div>
            </td>
            <td  width="25%"> 
              <div align="right"><%= Util.fcolorCCY(stBalances.getE02DEAMEP().trim())%></div>
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td  width="25%" nowrap>&nbsp;</td>
            <td  width="25%"><%= stBalances.getE02CUMMA2().trim()%></td>
            <td  width="25%" nowrap> 
              <div align="right"><b>Saldo Inter&eacute;s : </b></div>
            </td>
            <td  width="25%"> 
              <div align="right"><%= Util.fcolorCCY(stBalances.getE02DEAMEI().trim())%></div>
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td  width="25%" nowrap>&nbsp;</td>
            <td  width="25%"><%= stBalances.getE02CUMMA3().trim()%></td>
            <td  width="25%" nowrap> 
              <div align="right"><b>Mora :</b></div>
            </td>
            <td  width="25%"> 
              <div align="right"><%= Util.fcolorCCY(stBalances.getE02DEAMEM().trim())%></div>
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td  width="25%" nowrap> 
              <div align="right"></div>
            </td>
            <td  width="25%"> 
              <div align="left"><%= stBalances.getE02CUMMA4().trim()%></div>
            </td>
            <td  width="25%" nowrap> 
              <div align="right"><b>Otros Cargos :</b></div>
            </td>
            <td  width="25%"> 
              <div align="right"><%= Util.fcolorCCY(stBalances.getE02DEAOTH().trim())%></div>
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td  width="25%" nowrap> 
              <div align="right"><b>Fecha de Apertura :</b></div>
            </td>
            <td  width="25%" nowrap> 
              <div align="left"><%= datapro.eibs.master.Util.formatCustomDate(currUser.getE01DTF(),
         	                                                				  stBalances.getBigDecimalE02OPENDM().intValue(),
         	                                                				  stBalances.getBigDecimalE02OPENDD().intValue(),
         	                                                				  stBalances.getBigDecimalE02OPENDY().intValue())%>
              
              </div>
            </td>
            <td  width="25%" nowrap> 
              <div align="right"><b>Saldo Total :</b></div>
            </td>
            <td  width="25%"> 
              <div align="right"><%= Util.fcolorCCY(stBalances.getE02TOTAMN().trim())%></div>
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td  width="25%"> 
              <div align="right"><b>Fecha de Vencimiento :</b></div>
            </td>
            <td  width="25%" nowrap> 
              <div align="left"><%= datapro.eibs.master.Util.formatCustomDate(currUser.getE01DTF(),
         	                                                				  stBalances.getBigDecimalE02MATURM().intValue(),
         	                                                				  stBalances.getBigDecimalE02MATURD().intValue(),
         	                                                				  stBalances.getBigDecimalE02MATURY().intValue())%>
              
              </div>
            </td>
            <td  width="25%" nowrap> 
              <div align="right"><b>Tasa de Inter&eacute;s :</b></div>
            </td>
            <td  width="25%" nowrap> 
              <div align="right"><%= stBalances.getE02DEARTE().trim()%></div>
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td  width="25%" height="20"> 
              <div align="right"><b>Ultima Fecha de Renovaci&oacute;n :</b></div>
            </td>
            <td  width="25%" nowrap height="20"> 
              <div align="left"><%= datapro.eibs.master.Util.formatCustomDate(currUser.getE01DTF(),
         	                                                				  stBalances.getBigDecimalE02LSTRDM().intValue(),
         	                                                				  stBalances.getBigDecimalE02LSTRDD().intValue(),
         	                                                				  stBalances.getBigDecimalE02LSTRDY().intValue())%>
              
              </div>
            </td>
            <td  width="25%" nowrap height="20"> 
              <div align="right"><b>N&uacute;mero de Renovaciones :</b></div>
            </td>
            <td  width="25%" nowrap height="20"> 
              <div align="right"><%= stBalances.getE02DEARON().trim()%></div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  
<%
	if ( cifList.getNoResult() ) {
   		out.print("<center><h4>No hay resultados que correspondan a su criterio de búsqueda</h4></center>");
	}
	else {
%>  
  <p>&nbsp;</p>
  <TABLE class="tableinfo" >
    <TR> 
      <TH ALIGN=CENTER  >Fecha Proceso</TH>
      <TH ALIGN=CENTER  > Fecha Valor</TH>
      <TH ALIGN=CENTER  >TC</TH>
      <TH ALIGN=CENTER  >Descripci&oacute;n</TH>
      <TH ALIGN=CENTER  >Principal</TH>
      <TH ALIGN=CENTER  >&nbsp;</TH>
      <TH ALIGN=CENTER  >Intereses</TH>
      <TH ALIGN=CENTER  >&nbsp;</TH>
      <TH ALIGN=CENTER  >Mora</TH>
      <TH ALIGN=CENTER  >&nbsp;</TH>
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
      <td width="45%"><b>Principal</b> : <%= userPO.getHeader19().trim()%></td>
      <td width="35%"><b>Inter&eacute;s </b> : <%= userPO.getHeader20().trim()%></td>
    </tr>
  </table>
  <h4>&nbsp;</h4>
  <p>&nbsp;</p>
  <p align="left">&nbsp;</p>
  <p>&nbsp;</p>
  <p align=left>&nbsp; </p>

  <%
  }
%> 
  
</FORM>
<script type="text/javascript">
if(!EIBS.BrowserDetect.isFIREFOX()){
	addEventHandler(document, 'DOMContentLoaded', function() {
		function printWin(){
			if($('.wait-div').first().is(":visible")){
				setTimeout(printWin, '500');
			}else{
				window.print();			
			}
		}
		printWin();
		//window.onfocus=function(){ window.close();}
	});
}

</script>

</BODY>
</HTML>
