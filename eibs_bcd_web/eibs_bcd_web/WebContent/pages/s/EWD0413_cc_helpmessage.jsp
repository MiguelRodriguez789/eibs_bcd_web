<html>
<head>
<title>Tarjetas</title>
<link Href="<%=request.getContextPath()%>/pages/style.css"
	rel="stylesheet">

<jsp:useBean id="EWD0413Help" class="datapro.eibs.beans.JBList"
	scope="session" />

<SCRIPT type="text/javascript">
	setTimeout("top.close()", <%= datapro.eibs.master.JSEIBSProp.getPopUpTimeOut() %>);
</SCRIPT>

<script type="text/javascript">
	function enter(code) {
		var form = top.opener.document.forms[0];
		form[top.opener.fieldName].value = code;
	 	top.close();
	}
</script>
</head>

<body>
<% if ( EWD0413Help.getNoResult() ) { %>
  <h4 align="center">Tarjetas</h4>
  <TABLE class="tbenter" width=100% height=100%>
    <TR>
      <TD>
        <div align="center"><b> No hay resultados para su criterio de Búsqueda </b></div>
      </TD>
    </TR>
  </TABLE>
<% } else { %>
  <TABLE class="tableinfo" align="center" style="width: '95%'">
     <TR id="trdark">
       <th>Tarjeta</th>
       <th><div align="left">Fecha de Entrada</div></th>
       <th><div align="left">Fecha de Vencimiento</div></th>
     </tr>
<%

     String type = (String)request.getAttribute("type");
     String branch = (String)request.getAttribute("branch");
     String user = (String)request.getAttribute("user");
     String codeflag = (String)request.getAttribute("codeflag");
     String numcar = (String)request.getAttribute("numcar");
     if (type == null) type = "";
     if (branch == null) branch = "";
     if (user == null) user = "";
     if (codeflag == null) codeflag = "";
     //Type = "TC";
     //branch = "5000";
     //user = "";
     //codeflag = "1";
                
     String NameSearch = (String)request.getAttribute("NameSearch");
     String FromRecord = (String)request.getAttribute("FromRecord");
             
     EWD0413Help.initRow();
     while (EWD0413Help.getNextRow()) {
       if (EWD0413Help.getFlag().equals("")) {
         out.println(EWD0413Help.getRecord());
       }
     }
%> 
  </TABLE>
  <TABLE  class="tbenter" WIDTH="98%" ALIGN=CENTER>
    <TR>
      <TD WIDTH="50%" ALIGN=LEFT height="25"> 
      <%
          if ( EWD0413Help.getShowPrev() ) {
      	    int pos = EWD0413Help.getFirstRec() - 21;
      	    out.print("<A HREF=\""+request.getContextPath()+"/servlet/datapro.eibs.helps.JSEWD0413?type=" + type + "&branch=" + branch + "&user=" + user + "&codeflag=" + codeflag + "&FromRecord=" + pos + "\" ><img src=\""+request.getContextPath()+"/images/s/previous_records1.gif\" border=0></A>");
          }
      %>
      </TD>
 	  <TD WIDTH="50%" ALIGN=RIGHT height="25"> 
 	  <%       
         if ( EWD0413Help.getShowNext() ) {
      	   int pos = EWD0413Help.getLastRec();
      	   out.print("<A HREF=\""+request.getContextPath()+"/servlet/datapro.eibs.helps.JSEWD0413?type=" + type + "&branch=" + branch + "&user=" + user + "&codeflag=" + codeflag + "&FromRecord=" + pos + "\" ><img src=\""+request.getContextPath()+"/images/s/next_records1.gif\" border=0></A>");
         }
       %> 
       </TD>
	 </TR>
   </TABLE>
<% } %> 

</body>
</html>