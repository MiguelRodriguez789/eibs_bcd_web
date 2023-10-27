<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<%@ page import="datapro.eibs.master.Util" %>
<HTML>
<HEAD>
<META http-equiv="Pragma" content="No-cache">
<META http-equiv="Pragma" content="No-cache">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript">
	
	function enter(code,type,apc ,dsc) {
		var form = top.opener.document.forms[0];
  		if (isValidObject(form[top.opener.fieldAux1])) {form[top.opener.fieldAux1].value = type;}
  		if (isValidObject(form[top.opener.fieldAux2])) {form[top.opener.fieldAux2].value = apc;}
		if (isValidObject(form[top.opener.fieldName])) {
			form[top.opener.fieldName].value = code;
			if (form[top.opener.fieldName].type != "hidden") 
				form[top.opener.fieldName].focus();
			else 
				form[top.opener.fieldAux1].focus();
			form[top.opener.fieldName].select();
  		}
		if (isValidObject(form[top.opener.fieldDesc])) {
			form[top.opener.fieldDesc].value = dsc;
		}		
		top.close();
	}
</script>
<TITLE></TITLE>
</HEAD>
<jsp:useBean id= "edp0743Help" class= "datapro.eibs.beans.JBObjList"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>
<BODY>


<FORM>
<%
	if ( edp0743Help.getNoResult() ) {
%>
 		<TABLE class="tbenter" width=100% height=100%>
 		<TR>
      <TD> 
        
      <div align="center"> <font size="3"><b> No hay datos que correspondan con su criterio de busqueda</b></font> 
      </div>
      </TD></TR>
   		</TABLE>
<%
	}
	else {
%>
 
  <TABLE class="tableinfo" style="width:95%" ALIGN=CENTER>
    <TR id="trdark"> 
      <TH ALIGN=CENTER  nowrap width="10%">Code</TH>
      <TH ALIGN=CENTER  nowrap width="20%">Tipo</TH>
      <TH ALIGN=CENTER  nowrap width="20%">Clasificación</TH>
      <TH ALIGN=CENTER  nowrap width="50%">Descripción</TH>
    </TR>
     	<%
        edp0743Help.initRow(); 
		boolean firstTime = true;
		String chk = "";
        while (edp0743Help.getNextRow()) {
			if (firstTime) {
				firstTime = false;
				chk = "checked";
			} else {
				chk = "";
			}
           datapro.eibs.beans.EDP074301Message msg = (datapro.eibs.beans.EDP074301Message) edp0743Help.getRecord();
     	%>               
        <TR>
			<td NOWRAP><a href="javascript:enter('<%=msg.getE01APCCDE()%>','<%=msg.getE01APCTYP()%>','<%=msg.getE01APCACD()%>' , '<%=msg.getE01APCDSC()%>')"><%=Util.formatCell(msg.getE01APCCDE())%></a></td>
			<td NOWRAP><a href="javascript:enter('<%=msg.getE01APCCDE()%>','<%=msg.getE01APCTYP()%>','<%=msg.getE01APCACD()%>' , '<%=msg.getE01APCDSC()%>')"><%=Util.formatCell(msg.getE01APCTYP())%></a></td>
			<td NOWRAP><a href="javascript:enter('<%=msg.getE01APCCDE()%>','<%=msg.getE01APCTYP()%>','<%=msg.getE01APCACD()%>' , '<%=msg.getE01APCDSC()%>')"><%=Util.formatCell(msg.getE01APCFL3())%></a></td>
			<td NOWRAP><a href="javascript:enter('<%=msg.getE01APCCDE()%>','<%=msg.getE01APCTYP()%>','<%=msg.getE01APCACD()%>' , '<%=msg.getE01APCDSC()%>')"><%=Util.formatCell(msg.getE01APCDSC())%></a></td>
			</TR>   		
    	<%}%>   
  </TABLE>
  <TABLE  class="tbenter" WIDTH="98%" ALIGN=CENTER>
    <TR>
 	<%
        if ( edp0743Help.getShowPrev() ) {
      			int pos = edp0743Help.getFirstRec() - 21;
	%>
	<TD WIDTH="50%" ALIGN=LEFT height="25">
		<A HREF="<%=request.getContextPath()%>/servlet/datapro.eibs.helps.JSEDP0743?FromRecord=<%=pos%>" > 
			<img src="<%=request.getContextPath()%>/images/s/previous_records.gif" border=0></A>		
	</TD>
	<%  }
        if ( edp0743Help.getShowNext() ) {
      			int pos = edp0743Help.getLastRec();        
	%> 
	<TD WIDTH="50%" ALIGN=LEFT height="25">
		<A HREF="<%=request.getContextPath()%>/servlet/datapro.eibs.helps.JSEDP0743?FromRecord=<%=pos%>" > 
			<img src="<%=request.getContextPath()%>/images/s/next_records.gif" border=0></A>		
	</TD>
	 </TR>
<%      }
  }
%> 
	 </TABLE>
</FORM>

</BODY>
</HTML>