<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<META HTTP-EQUIV="Pragma" CONTENT="No-cache">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<script type="text/javascript"
	src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript">
	function enter(code,desc) {
		var form= top.opener.document.forms[0];
 		if (isValidObject(form[top.opener.fieldName])) form[top.opener.fieldName].value = code;
 		if (isValidObject(form[top.opener.fieldAux1])) form[top.opener.fieldAux1].value = desc;
		top.close();
 	}
</script>
<TITLE></TITLE>
</head>
<jsp:useBean id= "EWD0355Help" class= "datapro.eibs.beans.JBList"  scope="session" />

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />

<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>
<body>
 
 <script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>


<FORM>
<%
	if ( EWD0355Help.getNoResult() ) {
%>
 		<TABLE class="tbenter" width=100% height=100%>
 		<TR>
      <TD> 
        
      <div align="center"><b> No hay resultados que correspondan con su criterio de b�squeda</b> 
      </div>
      </TD></TR>
   		</TABLE>
<%
} else {
%>
 
  <TABLE class="tableinfo" align="center" style="width:'95%'">
    <TR id="trdark"> 
      <TH ALIGN=CENTER  nowrap width="20%">
        <div align="center">Tabla</div>
      </TH>
      <TH ALIGN=CENTER  nowrap width="40%"> 
        <div align="center">Descripci�n</div>
      </TH>
     </TR>
    <%
		String shrBank = (String)session.getAttribute("shrBank");
                String NameSearch = (String)session.getAttribute("NameSearch");
                String shrAppCode = (String)session.getAttribute("shrAppCode");
                String shrSelect = (String)session.getAttribute("shrSelect");
                EWD0355Help.initRow();
                while (EWD0355Help.getNextRow()) {
                    if (EWD0355Help.getFlag().equals("")) {
                    		out.println(EWD0355Help.getRecord());
                   }
                }
     %> 
  </TABLE>
  <%      
  }
%>
</FORM>

</BODY>
</HTML>