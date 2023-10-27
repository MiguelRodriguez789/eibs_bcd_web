<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<%@ page import = "datapro.eibs.master.Util" %>
<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@ page import="com.datapro.constants.EibsFields" %>
<HTML>
<HEAD>
<TITLE> Estado de Cuentas </TITLE>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">

</HEAD>

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "cifList" class= "datapro.eibs.beans.JBList"  scope="session" />
<jsp:useBean id="stBalances" class="datapro.eibs.beans.EDL030002Message"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>
<jsp:useBean id="currUser" class="datapro.eibs.beans.ESS0030DSMessage" scope="session" />

<style>
<!--
BODY {
	background-color: #FFFFFF;
}
	
TABLE {
	font-family: Arial, Helvetica, sans-serif;
	font-size:8pt;
	background-color: #F0F0F0;
	border-color: #0b23b5;
	color: #0B23B5;
	
}
	
TH {font-family: Arial, Helvetica, sans-serif;
	font-size:8pt;
	color: #0B23B5;
	text-transform : uppercase;
        
}

#trdark{
	background-color: #D1D1D1;
	font-family: Arial, Helvetica, sans-serif;
	font-size: 8pt;
	color: #0B23B5;
	height:20pt;
}

#trclear{
	background-color: #F0F0F0;
	font-family: Arial, Helvetica, sans-serif;
	font-size: 8pt;
	color: #0B23B5;
	height:20pt;
	}
	
P {
	font-family: Arial, Helvetica, sans-serif;
	font-size: 8pt;
	color: #0B23B5;
} 

HR{
	color: #D1D1D1;
	height : 4pt;
}

H3 {font-family: "MS Sans Serif", Geneva, sans-serif;
	font-size:10pt;
	text-align: center;
	color: #0B23B5;
	}
 
 H4{font-family: "MS Sans Serif", Geneva, sans-serif;
	font-size: 8pt;
	text-align:left;
	color: #0B23B5;
}

.tableinfo{
	border-top-width : 1px;border-right-width : 1px;border-bottom-width : 1px;border-left-width : 1px;
	border-color: #0b23b5;
	border-style : solid solid solid solid;
	width:100%;
	filter:progid:DXImageTransform.Microsoft.dropshadow(OffX=3, OffY=3, Color='gray', Positive='true');  
}
-->
</style>
<BODY>


<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>

<SCRIPT type="text/javascript">

//window.onload = init;


</SCRIPT>
<% 
 if ( !error.getERRNUM().equals("0")  ) {
     error.setERRNUM("0"); 
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
 }
%> 

<FORM>
<%
	if ( cifList.getNoResult() ) {
   		out.print("<center><h4>No hay resultados que correspondan a su criterio de búsqueda</h4></center>");
	}
	else {
%>
  <h3 align="center">Estado de Cuentas<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="st_list_print_fp.jsp,EDL0300"> 
  </h3>
  <hr size="4">
  <br>
  
  <%int row = 0; %>
  <table class="tableinfo">
    <tr > 
      <td > 
        <table cellspacing=0 cellpadding=2 width="100%" border="0">
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td  width="25%" height="15" nowrap> 
              <div align="right"><b>Nombre :</b></div>
            </td>
            <td  width="25%" height="15"> 
              <div align="left"></div>
              <%= stBalances.getE02CUMMA1().trim()%></td>
            <td  width="25%" height="15"> 
              <div align="right"><b>Cuenta :</b></div>
            </td>
            <td  width="25%" height="15" nowrap> 
              <div align="right"><%= stBalances.getE02DEAACC().trim()%></div>
            </td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td  width="25%"> 
              <div align="right"><b>Direcci&oacute;n :</b></div>
            </td>
            <td  width="25%" nowrap> 
              <div align="left"></div>
              <%= stBalances.getE02CUMMA2().trim()%></td>
            <td  width="25%" nowrap> 
              <div align="right"><b>Saldo</b> <%= stBalances.getE02DEACCY().trim()%> 
                <b>Principal :</b></div>
            </td>
            <td  width="25%"> 
              <div align="right"><%= Util.fcolorCCY(stBalances.getE02DEAMEP().trim())%></div>
            </td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td  width="25%" nowrap> 
              <div align="right"><b> </b></div>
            </td>
            <td  width="25%"> 
              <div align="left"></div>
              <%= stBalances.getE02CUMMA3().trim()%></td>
            <td  width="25%" nowrap> 
              <div align="right"><b>Saldo Inter&eacute;s :</b></div>
            </td>
            <td  width="25%"> 
              <div align="right"><%= Util.fcolorCCY(stBalances.getE02DEAMEI().trim())%></div>
            </td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td  width="25%" nowrap> 
              <div align="right"></div>
            </td>
            <td  width="25%" nowrap> 
              <div align="left"></div>
              <%= stBalances.getE02CUMMA4().trim()%></td>
            <td  width="25%" nowrap> 
              <div align="right"><b>Saldo Total :</b></div>
            </td>
            <td  width="25%"> 
              <div align="right"><%= Util.fcolorCCY(stBalances.getE02TOTAMN().trim())%></div>
            </td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
            <td  width="25%">&nbsp;</td>
            <td  width="25%" nowrap>&nbsp;</td>
            <td  width="25%" nowrap> 
              <div align="right"><b>Tasa Inter&eacute;s :</b></div>
            </td>
            <td  width="25%" nowrap> 
              <div align="right"><%= stBalances.getE02DEARTE().trim()%></div>
            </td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td  width="25%"> 
              <div align="right"><b>Fecha Apertura :</b></div>
            </td>
            <td  width="25%" nowrap> 
              <div align="left"></div>
              <%= Util.formatCustomDate(currUser.getE01DTF(), stBalances.getE02OPENDM(),stBalances.getE02OPENDD(),stBalances.getE02OPENDY())%></td>
            <td  width="25%" nowrap> 
              <div align="right"><b>Fecha Vencimiento :</b></div>
            </td>
            <td  width="25%" nowrap> 
              <div align="right"> <%= Util.formatCustomDate(currUser.getE01DTF(), stBalances.getE02MATURM(), stBalances.getE02MATURD(), stBalances.getE02MATURY())%></div>
            </td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td  width="25%"> 
              <div align="right"><b>N&uacute;mero de Renovaciones :</b></div>
            </td>
            <td  width="25%" nowrap> 
              <div align="right"></div>
            </td>
            <td  width="25%" nowrap> 
              <div align="right"><b>Fecha Ultima Renovaci&oacute;n :</b></div>
            </td>
            <td  width="25%" nowrap> 
              <div align="right"></div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <p>&nbsp;</p>
  
  <TABLE  class=tableinfo>
    <TR> 
      <TH ALIGN=CENTER nowrap > Fecha <% if (userPO.getHeader8().trim().equals("B")) out.print("Proceso"); else out.print("Valor");%></TH>
      <TH ALIGN=CENTER nowrap > Fecha <% if (userPO.getHeader8().trim().equals("B")) out.print("Valor"); else out.print("Proceso");%></TH>
      <TH ALIGN=CENTER  >TC</TH>
      <TH ALIGN=CENTER  >Descripci&oacute;n</TH>
      <TH ALIGN=CENTER  >Principal</TH>
      <TH ALIGN=CENTER  >&nbsp;</TH>
      <TH ALIGN=CENTER  >Intereses</TH>
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
 

  <%
  }
%> 
  
</FORM>

</BODY>
</HTML>
