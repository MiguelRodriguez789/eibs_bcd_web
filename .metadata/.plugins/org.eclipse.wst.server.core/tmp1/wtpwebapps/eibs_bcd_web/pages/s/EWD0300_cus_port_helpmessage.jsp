<html>
<head>
<META HTTP-EQUIV="Pragma" CONTENT="No-cache">
<title>Customer Portfolio</title>
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "EWD0300Help" class= "datapro.eibs.beans.JBList"   scope="session"/>
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>

<SCRIPT type="text/javascript" SRC="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>

<SCRIPT type="text/javascript">
	setTimeout("top.close()", <%= datapro.eibs.master.JSEIBSProp.getPopUpTimeOut() %>)
</SCRIPT>

<script type="text/javascript">

	function enter(code1, code2) {
		var form = top.opener.document.forms[0];
  		if (isValidObject(form[top.opener.fieldName])) {
  			form[top.opener.fieldName].value = code1;
  			form[top.opener.fieldName].focus();
  		}
  		if (isValidObject(form[top.opener.fieldDesc])) {
  			form[top.opener.fieldDesc].value = code2;
  		}
  		top.close();
 	}

</script>
</head>
<body>
<h4 align="center">Lista de Protafolios de Clientes</h4>
<%
	if ( EWD0300Help.getNoResult() ) {
 %>
   		<TABLE class="tbenter" width=100% height=100%>
   		<TR>
      <TD> 
      <div align="center"> <b> No existen Portafolios para ese criterio de busquedas.</b></div>
      </TD></TR>
   		</TABLE>
<%  
		}
	else {
%>	
   
<TABLE class="tableinfo" align="center" style="width:'95%'">
  <TR id="trdark"> 
    <th> 
      <div align="center">Cliente<br>Principal </div>
    </th>
    <th> 
      <div align="center">Portafolio </div>
    </th>
    <th> 
      <div align="center">Descripción<br>Portafolio</div>
    </th>
    <th> 
      <div align="center">Nombre Legal</div>
    </th>
  </tr>
  <%
                EWD0300Help.initRow();
                while (EWD0300Help.getNextRow()) {
                    if (EWD0300Help.getFlag().equals("")) {
                    		out.println(EWD0300Help.getRecord());
                    }
                }
    %> 
</TABLE>

<TABLE  class="tbenter" WIDTH="98%" ALIGN=CENTER>
    <TR>
      <TD WIDTH="50%" ALIGN=LEFT height="25"> 
       <% if ( EWD0300Help.getShowPrev() ) {
       		int pos = EWD0300Help.getFirstRec() - 21;
			out.println("<A HREF=\""+request.getContextPath()+"/servlet/datapro.eibs.helps.JSEWD0300?SCREEN=11&FromRecord=" + pos + "&CUSTOMER=" + userPO.getCusNum() + "\"><img src=\""+request.getContextPath()+"/images/s/previous_records.gif\" border=0></A>");
        }
%> </TD>
 	  <TD WIDTH="50%" ALIGN=RIGHT height="25"> 
 	   <% if ( EWD0300Help.getShowNext() ) {
      		int pos = EWD0300Help.getLastRec();
      		out.print("<A HREF=\""+request.getContextPath()+"/servlet/datapro.eibs.helps.JSEWD0300?SCREEN=11&FromRecord=" + pos + "&CUSTOMER=" + userPO.getCusNum() + "\"><img src=\""+request.getContextPath()+"/images/s/next_records.gif\" border=0></A>");

        }
%> </TD>
	 </TR>
	 </TABLE>
	
<%
   }  
%>
</body>
</html>