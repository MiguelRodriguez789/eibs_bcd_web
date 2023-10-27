<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<HTML>

<%@ page import = "datapro.eibs.master.Util" %><META HTTP-EQUIV="Pragma" CONTENT="No-cache">
<META name="GENERATOR" content="IBM WebSphere Studio">
<head>
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<script language="javascript" >
	function enter(code,desc,id,f4,f5,f6,f7,f8) {
  		parent.query.enterAction(code,desc,id,f4,f5,f6,f7,f8); 
	   
 	}
</script>
</head>

<jsp:useBean id= "EWD0437Help" class= "datapro.eibs.beans.JBList"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />
<body>
 
 <script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>

<FORM>
<%
	if ( EWD0437Help.getNoResult() ) {
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
      <TH ALIGN=CENTER  nowrap width="30%">Marca Vehículo</TH>
      <TH ALIGN=CENTER  nowrap width="10%">Codigo</TH>
      <TH ALIGN=CENTER  nowrap width="15%">Clase Vehículo</TH>
      <TH ALIGN=CENTER  nowrap width="15%">Servicio</TH>
      <TH ALIGN=CENTER  nowrap width="10%">Estado</TH>
      <TH ALIGN=CENTER  nowrap width="10%">Tipo</TH>
      <TH ALIGN=CENTER  nowrap width="10%">Referencia 2</TH>
      <TH ALIGN=CENTER  nowrap width="10%">Avalúo</TH>
    </TR>
    <%
                String Type = (String)request.getAttribute("Type");
                String NameSearch = (String)request.getAttribute("NameSearch");
                String Model = (String)request.getAttribute("Model");
                EWD0437Help.initRow();
                while (EWD0437Help.getNextRow()) {
                    if (EWD0437Help.getFlag().equals("")) {
                    		out.println(EWD0437Help.getRecord());
                    }
                }
              %> 
  </TABLE>
  <TABLE  class="tbenter" WIDTH="88%" ALIGN=CENTER>
    <TR>
      <TD WIDTH="50%" ALIGN=LEFT height="25"> <%
        if ( EWD0437Help.getShowPrev() ) {
      			int pos =EWD0437Help.getFirstRec() - 21;
      			   out.print("<A HREF=\""+request.getContextPath()+"/servlet/datapro.eibs.helps.JSEWD0437?NameSearch=" + NameSearch + "&FromRecord=" + pos + "&Type=" + Type + "&Model=" + Model +  "\" > <img src=\""+request.getContextPath()+"/images/s/previous_records.gif\" border=0></A>");
        }
%> </TD>
 	  <TD WIDTH="50%" ALIGN=RIGHT height="25"> <%       
        if ( EWD0437Help.getShowNext() ) {
      			int pos = EWD0437Help.getLastRec();
      			out.print("<A HREF=\""+request.getContextPath()+"/servlet/datapro.eibs.helps.JSEWD0437?NameSearch=" + NameSearch + "&FromRecord=" + pos + "&Type=" + Type + "&Model=" + Model +  "\" ><img src=\""+request.getContextPath()+"/images/s/next_records.gif\" border=0></A>");

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

