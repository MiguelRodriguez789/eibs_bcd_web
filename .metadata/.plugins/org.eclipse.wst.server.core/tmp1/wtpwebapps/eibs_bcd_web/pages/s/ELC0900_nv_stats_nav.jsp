<%@ page import = "datapro.eibs.master.*,datapro.eibs.beans.*,java.util.Iterator" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
<HEAD>
<TITLE>Estadisticas de Comisiones Cartas de Crédito</TITLE>
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
 var bnk = document.forms[0].E01LCYBNK.value;
 var acd = document.forms[0].E01LCYACD.value;
 var typ = document.forms[0].E01LCYTYP.value;
 var dty = document.forms[0].E01SCHDTY.value;
 var screen = '16';
 
	var pg= "<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSELC0900?SCREEN=" + screen
																				 + "&E01LCYBNK=" + bnk
																				 + "&E01LCYACD=" + acd
																				 + "&E01LCYTYP=" + typ
																				 + "&E01SCHDTY=" + dty;
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

<H3 align="center">Estadísticas de Transacciones de Navieras<IMG src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="nv_stats_nav.jsp, ELC0900"></H3>
<HR size="4">

<FORM Method="post" Action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSELC0900">
<INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="16">
<INPUT TYPE=HIDDEN NAME="E01LCYTYP" VALUE="N">
<INPUT TYPE=HIDDEN NAME="E01LCYACD" VALUE="45">

<h4>Estadisticas de Transacciones de Navieras</h4>
<table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" >
        <tr id="trdark">
            <td width="30%" nowrap>
              <div align="right">Banco : </div>
            </td>
            <td width="70%" nowrap>
              <input type="text" name="E01LCYBNK" size="3" maxlength="2" value="<%=currUser.getE01UBK() %>">
            </td>
          </tr>
<!--
          <tr id="trclear">
            <td width="30%" nowrap>
              <div align="right">Tipo de Cuenta : </div>
            </td>
            <td width="70%" nowrap>
				<SELECT name="E01LCYACD">
					<OPTION value="45">Naviera</OPTION>
				</SELECT>
            </td>
          </tr>
          <tr id="trdark">
            <td width="30%" nowrap>
              <div align="right">Tipo de Cobranza : </div>
            </td>
            <td width="70%" nowrap>
				<SELECT name="E01LCYTYP">
					<OPTION value=""></OPTION>
					<OPTION value="N">NAVIERA</OPTION>
				</SELECT>
            </td>
          </tr>
-->
          
          <tr id="trclear">
            <td width="30%" nowrap>
              <div align="right">Año : </div>
            </td>
            <td width="70%" nowrap>
              <input type="text" name="E01SCHDTY" size="5" maxlength="4" value="<%=year %>">
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
