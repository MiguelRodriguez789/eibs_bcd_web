<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<%@page import="datapro.eibs.master.JSEIBSProp"%>
<HTML>
<HEAD>
<TITLE>
Lista de Documentos
</TITLE>

<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "listImg" class= "datapro.eibs.beans.JBListRec"  scope="session" />

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"></SCRIPT>

<SCRIPT type="text/javascript">
<% 
String imageViewer = null;
if ("true".equalsIgnoreCase(JSEIBSProp.getActiveX())) {
	imageViewer = request.getContextPath()+"/pages/s/EDI0010_doc_viewer_img_activex.jsp";
} else {
	imageViewer = request.getContextPath()+"/pages/s/EDI0010_doc_viewer_img_page.jsp";
}
%>

</SCRIPT>

</HEAD>

<BODY>

<h3 align="center">Imagen de Firma</h3>
<FORM >
<%	if ( listImg.getNoResult() ) { %>
   		<TABLE class="tbenter" width=100% height=60%>
   	<TR>
      <TD> 
        <div align="center">           
          <p>&nbsp;</p>
          <p><b>No existen Firmas asociadas</b></p>
          
        </div>
      </TD>
     </TR>
   		</TABLE>
<%   		
	} else {
		listImg.setCurrentRow(0);
%> 
  <TABLE width="190" border="0" class="tbenter" align="center">
    <%
		listImg.initRow();
		String imgName = "";
		String type = "";
		String uid = "";
		String seqnum = "";
		while (listImg.getNextRow()) {
			if (!seqnum.equals(listImg.getRecord(4))) {
				seqnum = listImg.getRecord(4);

    %> 
    <TR bgcolor="#bbbbbb" > 
      <TD ALIGN=LEFT> 
        <table width="100%" border="1" cellspacing="0" cellpadding="2">
          <tr>
            <td>Secuencia<b> <%= seqnum + "" %> </b>: <%= listImg.getRecord(3) %></td>
          </tr>
        </table>
      </TD>
    </TR>
    <%
			}
			if(listImg.getCurrentRow() == 0){
				type = listImg.getRecord(2);
    			uid = listImg.getRecord(5);
    			imgName = uid + "_" + seqnum + "." + type;
			}
		}
  %> 
  </TABLE>
  
  <iframe width="480" height="320"
  	src="<%=imageViewer%>?DOC_NAME=<%= request.getParameter("DOC_NAME")%>&PAGE_NAME=<%=imgName%>&TYPE=<%=type%>&IMG_SIZE=370"></iframe>
<%   		
	}
%> 
</FORM>
</BODY>
</HTML>
