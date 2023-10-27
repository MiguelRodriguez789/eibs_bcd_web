<%@ page import = "datapro.eibs.master.*,datapro.eibs.beans.*,java.util.Iterator" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@ page import = "datapro.eibs.master.Util" %>
<%@page import="com.datapro.constants.EibsFields"%>

<HTML>
<HEAD>
<TITLE>Estadisticas Cartas de Crédito</TITLE>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR"
	content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id="error" class="datapro.eibs.beans.ELEERRMessage" scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session" />
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript">

function showGraph()
{
 var bnk = document.getElementById("E01LCYBNK").value;
 var acd = document.getElementById("E01LCYACD").value;
 var typ = document.getElementById("E01LCYTYP").value;
 var dty = document.getElementById("E01SCHDTY").value;

 var screen = '2';
 
	var pg= "<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSELC0900?SCREEN=" + screen
																				 + "&E01LCYBNK=" + bnk
																				 + "&E01LCYACD=" + acd
																				 + "&E01LCYTYP=" + typ
																				 + "&E01SCHDTY=" + dty;
																				 
	if(acd == '40') {															
		CenterNamedWindow(pg,'graph',900,350,2);
	} else {
		CenterNamedWindow(pg,'graph',650,350,2);
	}
}

</script>
</HEAD>
<BODY>

<%if (!error.getERRNUM().equals("0")) {
	out.println("<SCRIPT Language=\"Javascript\">");
	out.println("       showErrors()");
	out.println("</SCRIPT>");
}

	String year = currUser.getE01RDY();
	if(year.length() == 2){
		int ry = Integer.valueOf(year).intValue();
		if(ry < 90) {
			year = "20" + year;
		} else {
			year = "19" + year;
		}
	}
%>

<H3 align="center">Estadísticas de Cartas de Crédito<IMG src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="lc_stats.jsp, ELC0900"></H3>
<HR size="4">

<FORM Method="post" Action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSELC0900">
<INPUT TYPE=HIDDEN NAME="SCREEN" id="SCREEN" VALUE="2">

<h4>Estadisticas de Cartas de Credito</h4>

<%int row = 0; %>
<table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" >
        <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
            <td width="50%" nowrap>
              <div align="right">Banco : </div>
            </td>
            <td width="50%" nowrap>
            	<eibsinput:text property="E01LCYBNK" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_BANK %>" />
            </td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
            <td width="50%" nowrap>
              <div align="right">Tipo de Cuenta : </div>
            </td>
            <td width="50%" nowrap>
				<SELECT name="E01LCYACD" id="E01LCYACD">
					<OPTION value="40">Carta de Crédito</OPTION>
					<OPTION value="41">Aceptación</OPTION>
					<OPTION value="42">Pago Diferido</OPTION>
				</SELECT>
            </td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
            <td width="50%" nowrap>
              <div align="right">Tipo de Carta de Crédito : </div>
            </td>
            <td width="50%" nowrap>
				<SELECT name="E01LCYTYP" id="E01LCYTYP">
					<OPTION value=""></OPTION>
					<OPTION value="O">Importación</OPTION>
					<OPTION value="I">Exportación</OPTION>
					<OPTION value="L">Local</OPTION>
					<OPTION value="S">Garantía Emitida</OPTION>
					<OPTION value="R">Garantía Recibida</OPTION>
				</SELECT>
            </td>
          </tr>
          
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
            <td width="50%" nowrap>
              <div align="right">Año : </div>
            </td>
            <td width="50%" nowrap>
              <input type="text" name="E01SCHDTY" id="E01SCHDTY" size="5" maxlength="4" value="<%=year %>">
            </td>
          </tr>
         </table>
      </td>
    </tr>
  </table>
<br>
  <DIV align="center"> 
	<INPUT id="EIBSBTN" type="button" name="Submit" value="Enviar" onclick="showGraph();">
	</DIV> 
</FORM>
</BODY>
</HTML>
