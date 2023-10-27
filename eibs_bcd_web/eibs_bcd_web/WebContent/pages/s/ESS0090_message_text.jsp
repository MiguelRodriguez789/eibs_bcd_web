<HTML>
<HEAD>
<TITLE>
Lista de Clientes
</TITLE>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
</HEAD>

<%@page import="datapro.eibs.beans.JBObjList"%>

<BODY>

   		<TABLE class="tbenter" width=100% height=100%>
   		<TR>
             <TD> 
               <div align="center">
               		<b>
               				<%
               					 JBObjList msgList = (JBObjList)request.getSession(false).getAttribute("msgList");
               					 int row = 0;
               					 try { row = Integer.parseInt(request.getParameter("row")); } catch (Exception e) {}
               					 msgList.setCurrentRow(row);
               					 datapro.eibs.beans.ESS009002Message msgPart = (datapro.eibs.beans.ESS009002Message) msgList.getRecord();
               					 out.print(msgPart.getE02MSGTXT());
               				%>
               		</b>
               	</div>
             </TD>
         </TR>
   		</TABLE>

</BODY>
</HTML>
