<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<%@ page import = "datapro.eibs.master.*,datapro.eibs.beans.*" %>
<META HTTP-EQUIV="Pragma" CONTENT="No-cache">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<script type="text/javascript">
//<!-- Hide from old browsers
 
 function enter(row) {
    page= "${pageContext.request.contextPath}/pages/s/EDEN000_ofac_inq.jsp?ROW=" + row;
    CenterWindow(page,700,450,1);
 }
//-->

function PrintPreviewPDF(typ,nam,con) {
  CenterWindow('<%=request.getContextPath()%>/servlet/datapro.eibs.tools.JSEDEN000?SCREEN=700&RWDTYP=' + typ + '&RWDNAM=' + nam + '&RWDCON=' + con,600,500,4);
}

</script>
<TITLE></TITLE>
</head>
<jsp:useBean id= "shrList" class= "datapro.eibs.beans.JBObjList"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>
<body>
 
 <script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>


<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/servlet/datapro.eibs.tools.JSEDEN000" target="_parent" >
 <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="700">
<%
	if ( shrList.getNoResult() ) {
%>
 		<TABLE class="tbenter" width=100% height=100%>
 		<TR>
      <TD> 
        
      <div align="center"><b>No hay datos que correspondan con su criterio de b�squeda</b> 
      </div>
      </TD></TR>
   		</TABLE>
<%
		
	}
	else {
%>
 
  <TABLE class="tableinfo" align="center" style="width:'95%'">
    <TR id="trdark"> 
      <TH ALIGN=CENTER  nowrap width="80%">Nombre</TH>
      <TH ALIGN=CENTER  nowrap width="20%">Cuenta</TH>
    </TR>
    <%
                String RWDTYP = (String)session.getAttribute("RWDTYP");
                String RWDNAM = (String)session.getAttribute("RWDNAM");
                String RWDCON = (String)session.getAttribute("RWDCON");
    
                shrList.initRow();               
                while (shrList.getNextRow()) {
                    EDEN011DSMessage msgHelp = (EDEN011DSMessage) shrList.getRecord();			 
                    
       %>             
                    
          <TR>
		  <td NOWRAP >
			<a href="javascript:enter('<%=shrList.getCurrentRow()%>')"><%=Util.formatCell(msgHelp.getSWDNAM())%></a>
		  </td>
		  <td NOWRAP ALIGN=RIGHT >
          	<a href="javascript:enter('<%=shrList.getCurrentRow()%>')"><%=Util.formatCell(msgHelp.getSWDCOU())%></a>
		  </td>

		</TR>
        <%        }
              %> 
  </TABLE>
  <TABLE  class="tbenter" WIDTH="98%" ALIGN=CENTER>
    <TR>
      <TD WIDTH="40%" ALIGN=LEFT height="25"> <%
        if ( shrList.getShowPrev() ) {
      			int pos =shrList.getFirstRec() - 21;
      			   out.print("<A HREF=\""+request.getContextPath()+"/servlet/datapro.eibs.tools.JSEDEN000?SCREEN=200&RWDNAM=" + RWDNAM + "&FromRecord=" + pos +  "&RWDTYP=" + RWDTYP + "&RWDCON=" + RWDCON +"\" > <img src=\""+request.getContextPath()+"/images/s/previous_records.gif\" border=0></A>");
        }
%> </TD>
	<TD WIDTH="20%" ALIGN=CENTER height="25">
  		<div id=DIVSUBMIT align="center"> 
  		  <p align=center>   
			<input id="EIBSBTN" type=button name="Print" value="Imprimir" onClick="javascript:PrintPreviewPDF('<%=RWDTYP%>','<%=RWDNAM%>','<%=RWDCON%>')">
  		   </p>
  		</div>	
	</TD>
 	  <TD WIDTH="40%" ALIGN=RIGHT height="25"> <%       
        if ( shrList.getShowNext() ) {
      			int pos = shrList.getLastRec();
      			out.print("<A HREF=\""+request.getContextPath()+"/servlet/datapro.eibs.tools.JSEDEN000?SCREEN=200&RWDNAM=" + RWDNAM + "&FromRecord=" + pos +  "&RWDTYP=" + RWDTYP + "&RWDCON=" + RWDCON + "\" ><img src=\""+request.getContextPath()+"/images/s/next_records.gif\" border=0></A>");

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