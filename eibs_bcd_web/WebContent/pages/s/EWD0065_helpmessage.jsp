<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<HTML>

<%@ page import = "datapro.eibs.master.Util" %><META HTTP-EQUIV="Pragma" CONTENT="No-cache">
<META name="GENERATOR" content="IBM WebSphere Studio">
<head>
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<script type="text/javascript" >
	function enter(code,desc,id) {
  		parent.query.enterAction(code,desc,id); 
	   
 	}
</script>
</head>

<jsp:useBean id= "ewd0001Help" class= "datapro.eibs.beans.JBList"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>
<body>
 
 <script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
 <script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/sortTables.js"> </SCRIPT>

<FORM>
<%
	if ( ewd0001Help.getNoResult() ) {
%>
 		<TABLE class="tbenter" width=100% height=100%>
 		<TR>
      <TD> 
        
      <div align="center"> <font size="3"><b> No hay datos que correspondan con su criterio de busqueda</b></font> 
      </div>
      </TD></TR>
   		</TABLE>
<%
	} else {
%>
 
  <TABLE class="tableinfoList sortable" style="width:95%" ALIGN=CENTER >
    <TR id="trdark"> 
      <TH ALIGN=CENTER  nowrap width="10%">No Entidad</TH>
      <TH ALIGN=CENTER  nowrap width="50%">Nombre</TH>
      <TH ALIGN=CENTER  nowrap width="25%">Identificacion</TH>
      <TH ALIGN=CENTER  nowrap width="15%">Tipo</TH>
      <TH ALIGN=CENTER  nowrap width="15%">Estado</TH>
    </TR>
    <%
                String Type = (String)request.getAttribute("Type");
                String NameSearch = (String)request.getAttribute("NameSearch");
                String CusType = (String)request.getAttribute("CusType");
                ewd0001Help.initRow();
                while (ewd0001Help.getNextRow()) {
                    if (ewd0001Help.getFlag().equals("")) {
                    		out.println(ewd0001Help.getRecord());
                    }
                }
              %> 
  </TABLE>
  <TABLE  class="tbenter" WIDTH="88%" ALIGN=CENTER>
    <TR>
      <TD WIDTH="50%" ALIGN=LEFT height="25"> <%
        if ( ewd0001Help.getShowPrev() ) {
      			int pos =ewd0001Help.getFirstRec() - 21;
      			   out.print("<A HREF=\""+request.getContextPath()+"/servlet/datapro.eibs.helps.JSEWD0065?NameSearch=" + NameSearch + "&FromRecord=" + pos + "&Type=" + Type + "&CusType=" + CusType + "\" > <img src=\""+request.getContextPath()+"/images/s/previous_records.gif\" border=0></A>");
        }
%> </TD>
 	  <TD WIDTH="50%" ALIGN=RIGHT height="25"> <%       
        if ( ewd0001Help.getShowNext() ) {
      			int pos = ewd0001Help.getLastRec();
      			out.print("<A HREF=\""+request.getContextPath()+"/servlet/datapro.eibs.helps.JSEWD0065?NameSearch=" + NameSearch + "&FromRecord=" + pos + "&Type=" + Type + "&CusType=" + CusType + "\" ><img src=\""+request.getContextPath()+"/images/s/next_records.gif\" border=0></A>");

        }
%> </TD>
	 </TR>
	 </TABLE>
<%      
  }
%> 
</FORM>

</BODY>
</HTML>

