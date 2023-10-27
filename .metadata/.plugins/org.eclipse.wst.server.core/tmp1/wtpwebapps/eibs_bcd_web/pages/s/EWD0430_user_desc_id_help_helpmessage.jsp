<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<HTML>

<%@ page import = "datapro.eibs.master.Util" %><META HTTP-EQUIV="Pragma" CONTENT="No-cache">
<META name="GENERATOR" content="IBM WebSphere Studio">
<head>
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<script type="text/javascript" >
	function enter(code,desc,id) {
		if(typeof parent.query != 'undefined' && typeof parent.query.enterAction != 'undefined'){
  			parent.query.enterAction(code,desc,id);
  		} else {
  			var form = top.opener.document.forms[0];
			var fieldName = top.opener.fieldName; 
			var fieldAux1 = top.opener.fieldAux1;
			var fieldAux2 = top.opener.fieldAux2;
			
			if(isValidObject(form[fieldName])){
				setField(form[fieldName], code);		
				form[fieldName].select();
			}
			if(isValidObject(form[fieldAux1])){
				setField(form[fieldAux1], desc);		
			}
			if(isValidObject(form[fieldAux2])){
				setField(form[fieldAux2], desc);		
			} 
			self.close();
  		} 
 	}
</script>
</head>

<jsp:useBean id= "ewd0430Help" class= "datapro.eibs.beans.JBList"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>
<body>
 
 <script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>

<FORM>
<%
	if ( ewd0430Help.getNoResult() ) {
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
 
  <TABLE class="tableinfo" style="width:95%" ALIGN=CENTER >
    <TR id="trdark"> 
      <TH ALIGN=CENTER  nowrap width="10%"> Cod. Usuario</TH>
      <TH ALIGN=CENTER  nowrap width="50%">Nombre</TH>
    </TR>
    <%
                String Type = (String)request.getAttribute("Type");
                String NameSearch = (String)request.getAttribute("NameSearch");
                ewd0430Help.initRow();
                while (ewd0430Help.getNextRow()) {
                    if (ewd0430Help.getFlag().equals("")) {
                    		out.println(ewd0430Help.getRecord());
                    }
                }
              %> 
  </TABLE>
  <TABLE  class="tbenter" WIDTH="88%" ALIGN=CENTER>
    <TR>
      <TD WIDTH="50%" ALIGN=LEFT height="25"> <%
        if ( ewd0430Help.getShowPrev() ) {
      			int pos =ewd0430Help.getFirstRec() - 21;
      			   out.print("<A HREF=\""+request.getContextPath()+"/servlet/datapro.eibs.helps.JSEWD0430?NameSearch=" + NameSearch + "&FromRecord=" + pos + "&Type=" + Type +  "\" > <img src=\""+request.getContextPath()+"/images/s/previous_records.gif\" border=0></A>");
        }
%> </TD>
 	  <TD WIDTH="50%" ALIGN=RIGHT height="25"> <%       
        if ( ewd0430Help.getShowNext() ) {
      			int pos = ewd0430Help.getLastRec();
      			out.print("<A HREF=\""+request.getContextPath()+"/servlet/datapro.eibs.helps.JSEWD0430?NameSearch=" + NameSearch + "&FromRecord=" + pos + "&Type=" + Type +  "\" ><img src=\""+request.getContextPath()+"/images/s/next_records.gif\" border=0></A>");

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

