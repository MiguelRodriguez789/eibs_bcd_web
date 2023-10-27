<%@ page import = "datapro.eibs.master.*,datapro.eibs.beans.*,java.util.Iterator" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
<HEAD>
<TITLE>Estadisticas de Comisiones Cartas de Cr�dito</TITLE>
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
 var bnk = document.forms[0].E02LCYBNK.value;
 var acd = document.forms[0].E02LCYACD.value;
 var typ = document.forms[0].E02LCYTYP.value;
 var dty = document.forms[0].E02SCHDTY.value;
 var screen = '4';
 
	var pg= "<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSELC0900?SCREEN=" + screen
																				 + "&E02LCYBNK=" + bnk
																				 + "&E02LCYACD=" + acd
																				 + "&E02LCYTYP=" + typ
																				 + "&E02SCHDTY=" + dty;
	CenterNamedWindow(pg,'graph',1200,800,2);
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

<H3 align="center">Estad�sticas de Comisiones Cartas de Cr�dito<IMG src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="lc_stats.jsp, ELC0900"></H3>
<HR size="4">

<FORM Method="post" Action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSELC0900">
<INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="4">

<h4>Estadisticas de Comisiones Cartas de Credito</h4>
<table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" >
        <tr id="trdark">
            <td width="30%" nowrap>
              <div align="right">Banco : </div>
            </td>
            <td width="70%" nowrap>
              <input type="text" name="E02LCYBNK" size="3" maxlength="2" value="<%=currUser.getE01UBK() %>">
            </td>
          </tr>
          <tr id="trclear">
            <td width="30%" nowrap>
              <div align="right">Tipo de Cuenta : </div>
            </td>
            <td width="70%" nowrap>
				<SELECT name="E02LCYACD">
					<OPTION value="40">Carta de Cr�dito</OPTION>
					<OPTION value="41">Aceptaci�n</OPTION>
					<OPTION value="42">Pago Diferido</OPTION>
				</SELECT>
            </td>
          </tr>
          <tr id="trdark">
            <td width="30%" nowrap>
              <div align="right">Tipo de Carta de Cr�dito : </div>
            </td>
            <td width="70%" nowrap>
				<SELECT name="E02LCYTYP">
					<OPTION value=""></OPTION>
					<OPTION value="O">Importaci�n</OPTION>
					<OPTION value="I">Exportaci�n</OPTION>
					<OPTION value="L">Local</OPTION>
					<OPTION value="S">Garant�a Emitida</OPTION>
					<OPTION value="R">Garant�a Recibida</OPTION>
				</SELECT>
            </td>
          </tr>
          
          <tr id="trclear">
            <td width="30%" nowrap>
              <div align="right">A�o : </div>
            </td>
            <td width="70%" nowrap>
              <input type="text" name="E02SCHDTY" size="5" maxlength="4" value="<%=year %>">
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
