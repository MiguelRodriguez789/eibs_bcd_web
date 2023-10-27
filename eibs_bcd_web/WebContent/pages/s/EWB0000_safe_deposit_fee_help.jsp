<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<%@ page import ="datapro.eibs.master.Util" %>
<HTML>
<HEAD>
<TITLE>Cargos por Caja de Seguridad</TITLE>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "msgList" 	class= "datapro.eibs.beans.JBObjList"  			scope="session" />
<jsp:useBean id= "error" 	class= "datapro.eibs.beans.ELEERRMessage"  		scope="session" />
<jsp:useBean id= "userPO" 	class= "datapro.eibs.beans.UserPos"  			scope="session"/>

<SCRIPT type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<SCRIPT type="text/javascript">

function enter(name) {
	var form = top.opener.document.forms[0];
	form[top.opener.fieldName].value = name;
	top.close();
}

</SCRIPT>  

</HEAD>
<BODY>
<h3 align="center">Cargos por Caja de Seguridad<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="safe_deposit_locations, EWB0030"></H3>
<hr size="4">
<FORM Method="post" Action="<%=request.getContextPath()%>/servlet/datapro.eibs.safedeposit.JSESB0030" >

<%if ( msgList.getNoResult() ) {%>
  <TABLE class="tbenter" width=100% height=40%>
   	<TR>
      <TD> 
        <div align="center"> 
          <p>
            <b>No hay resultados para su criterio de búsqueda</b>
          </p>          
        </div>
      </TD>
     </TR>
   </TABLE>
<%}	else {%>

<CENTER>
<TABLE id="mainTable" class="tableinfo">
	<TBODY>
		<TR>
			<TD nowrap valign="top">
			<TABLE id="dataTable" width="100%">
				<TBODY>
					<TR id="trdark">
						<TH align="CENTER">Tabla</TH>
						<TH align="CENTER">Monto 1</TH>
						<TH align="CENTER">Cuenta Contable 1</TH>
					</TR>
					<%
        msgList.initRow(); 
		boolean firstTime = true;
		String chk = "";
        while (msgList.getNextRow()) {
			if (firstTime) {
				firstTime = false;
				chk = "checked";
			} else {
				chk = "";
			}
           datapro.eibs.beans.ESB000001Message msgPart = (datapro.eibs.beans.ESB000001Message) msgList.getRecord();
     	%>
					<TR>
						<TD nowrap align="CENTER"><a 
							href="javascript:enter('<%=Util.formatCell(msgPart.getE01SBFCOD())%>')">
							<%=Util.formatCell(msgPart.getE01SBFCOD())%></a>
						</TD>
						<TD nowrap align="CENTER"><a
							href="javascript:enter('<%=Util.formatCell(msgPart.getE01SBFCOD())%>')">
							<%=Util.formatCell(msgPart.getE01SBFAM1())%></a>
						</TD>
						<TD nowrap align="CENTER"><a
							href="javascript:enter('<%=Util.formatCell(msgPart.getE01SBFCOD())%>')">
							<%=Util.formatCell(msgPart.getE01SBFBK1() + "-" + msgPart.getE01SBFCY1() + "-" + msgPart.getE01SBFGL1())%></a>
						</TD>						
					</TR>
					<%}%>
				</TBODY>
			</TABLE>
			</TD>
		</TR>
	</TBODY>
</TABLE>
</CENTER>

<%}%>
</FORM>
</BODY>
</HTML>
