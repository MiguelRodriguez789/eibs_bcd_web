<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput"%>
<%@page import="com.datapro.constants.EibsFields"%>
<%@ page import = "datapro.eibs.master.Util" %>
<HTML>
<HEAD>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<TITLE>Razon de Cambio de Status</TITLE>

<jsp:useBean id="RecData" class="datapro.eibs.beans.EPV015307Message"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session" />

<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<script type="text/javascript">
</script>
</HEAD>
<BODY>
<FORM >
<table align=center width="100%" id="tbhelp">
  <TR> 
    <TH> 
      <div align="left">Comentario :
        <hr>
      </div>
    </TH>
  </TR>
  <TR> 
    <TD align="center">
		<textarea cols="50" rows="20" name="txtReason" readonly><%=Util.formatCell(RecData.getE07HEVRMK().trim())%></textarea>
    </TD>
  </TR>
  <TR>
    <TD align="center"">
	<div align="left" style="width: 60%">    
    	<br> Motivo : <b><%=Util.formatCell(RecData.getE07HEVMTV().trim())%></b>  <br> Descripcion : <b><%=Util.formatCell(RecData.getE07DSCMTV().trim())%></b>
	</div>
     </TD>
  </TR>
</table>
<P align="center">
</P>
</FORM>
</BODY>
</HTML>
