<html>
<head>
<title>Lista de Control</title>

<!-- frames -->
</head>
<%
  String shrAcc = request.getParameter("shrAcc");
  String shrCategory = request.getParameter("shrCategory"); 
  String shrAction = request.getParameter("shrAction"); %>

<frameset  rows="100,*" cols="*"> 
  <FRAME name="query" <% out.println("src=\""+request.getContextPath()+"/pages/s/EWD0092_ofac_help_helpmessage.jsp?shrAcc="+shrAcc+"&shrCategory="+shrCategory+"&FromRecord=0&shrAction="+shrAction+" \""); %> marginwidth="0" marginheight="0" scrolling="no" frameborder="0">
  <FRAME name="results" <% out.println("src=\""+request.getContextPath()+"/pages/s/EWD0092_ofac_help_blank.jsp?shrAcc="+shrAcc+"&shrCategory="+shrCategory+"&FromRecord=0&shrAction="+shrAction+" \""); %> marginwidth="0" marginheight="0" scrolling="auto" frameborder="0">
<NOFRAMES><P>To view this page, you need a browser that supports frames.</P></NOFRAMES></frameset>
<noframes></noframes>







</html>



