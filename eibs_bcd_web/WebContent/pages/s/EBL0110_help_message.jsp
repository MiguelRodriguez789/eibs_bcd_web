<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
<HEAD>
<META http-equiv="Pragma" content="No-cache">
<META http-equiv="Pragma" content="No-cache">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<script type="text/javascript">
//<!-- Hide from old browsers
function enter(country,type,id,client,name) 
{
    parent.query.enterAction(country,type,id,client,name);
}
//-->
</script>
<TITLE></TITLE>
</HEAD>
<jsp:useBean id= "ebl0110Help" class= "datapro.eibs.beans.JBObjList"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>
<BODY>

<%@ page import="datapro.eibs.master.Util" %>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>

<FORM>
<%
    if ( ebl0110Help.getNoResult() ) {
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
      <TH ALIGN=CENTER  nowrap width="20%">Pais</TH>
      <TH ALIGN=CENTER  nowrap width="20%">Tipo</TH>
      <TH ALIGN=CENTER  nowrap width="20%">Identificación</TH>
      <TH ALIGN=CENTER  nowrap width="20%">Cliente</TH>
      <TH ALIGN=CENTER  nowrap width="20%">Nombre</TH>
    </TR>
        <%
        ebl0110Help.initRow(); 
        boolean firstTime = true;
        String chk = "";
        while (ebl0110Help.getNextRow()) {
            if (firstTime) {
                firstTime = false;
                chk = "checked";
            } else {
                chk = "";
            }
           datapro.eibs.beans.EBL011001Message msg = (datapro.eibs.beans.EBL011001Message) ebl0110Help.getRecord();
        %>               
        <TR>
            <td NOWRAP><a href="javascript:enter('<%=msg.getE01CURPID()%>','<%=msg.getE01CURTID()%>','<%=msg.getE01CURIDN()%>','<%=msg.getE01CURCUN()%>','<%=msg.getE01CURNA1()%>')"><%=Util.formatCell(msg.getE01CURPID())%></a></td>
            <td NOWRAP><a href="javascript:enter('<%=msg.getE01CURPID()%>','<%=msg.getE01CURTID()%>','<%=msg.getE01CURIDN()%>','<%=msg.getE01CURCUN()%>','<%=msg.getE01CURNA1()%>')"><%=Util.formatCell(msg.getE01CURTID())%></a></td>
            <td NOWRAP><a href="javascript:enter('<%=msg.getE01CURPID()%>','<%=msg.getE01CURTID()%>','<%=msg.getE01CURIDN()%>','<%=msg.getE01CURCUN()%>','<%=msg.getE01CURNA1()%>')"><%=Util.formatCell(msg.getE01CURIDN())%></a></td>
            <td NOWRAP><a href="javascript:enter('<%=msg.getE01CURPID()%>','<%=msg.getE01CURTID()%>','<%=msg.getE01CURIDN()%>','<%=msg.getE01CURCUN()%>','<%=msg.getE01CURNA1()%>')"><%=Util.formatCell(msg.getE01CURCUN())%></a></td>
            <td NOWRAP><a href="javascript:enter('<%=msg.getE01CURPID()%>','<%=msg.getE01CURTID()%>','<%=msg.getE01CURIDN()%>','<%=msg.getE01CURCUN()%>','<%=msg.getE01CURNA1()%>')"><%=Util.formatCell(msg.getE01CURNA1())%></a></td>
            </TR>           
        <%}%>   
  </TABLE>
  <TABLE  class="tbenter" WIDTH="98%" ALIGN=CENTER>
    <TR>
        <TD WIDTH="50%" ALIGN=LEFT height="25">
    <%
        if ( ebl0110Help.getShowPrev() ) {
                int pos = ebl0110Help.getFirstRec() - 51;
    %>
            <A HREF="<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSEBL0110?FromRecord=<%=pos%>&prevNext=1&SCREEN=7" > 
            <img src="<%=request.getContextPath()%>/images/s/previous_records.gif" border=0></A>        
    <%  }
    %> </TD>
       <TD WIDTH="50%" ALIGN="right" height="25">
    <%
        if ( ebl0110Help.getShowNext() ) {
                int pos = ebl0110Help.getLastRec();        
    %> 
           <A HREF="<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSEBL0110?FromRecord=<%=pos%>&prevNext=1&SCREEN=7"> 
            <img src="<%=request.getContextPath()%>/images/s/next_records.gif" border=0></A>        
    <%  }
%>      </TD>
     </TR>
   <%  }
%>   
     </TABLE>
</FORM>

</BODY>
</HTML>