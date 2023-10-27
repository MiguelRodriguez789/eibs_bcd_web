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
 
 function enter(code,numc,id,prod,card,apc,cust) {
		parent.query.enterAction(code,numc,id,prod,card,apc,cust);
 }
 
//-->
</script>
<TITLE></TITLE>
</head>
<jsp:useBean id= "ewd0005Help" class= "datapro.eibs.beans.JBObjList"  scope="session" />

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />

<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>
<body>
 
 <script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>


<FORM>
<%
	if ( ewd0005Help.getNoResult() ) {
%>
 		<TABLE class="tbenter" width=100% height=100%>
 		<TR>
      <TD> 
        
      <div align="center"><b>  No hay datos que correspondan con su criterio de busqueda </b> 
      </div>
      </TD></TR>
   		</TABLE>
<%
	}
	else {
%>
 
  <TABLE class="tableinfo" align="center" style="width:'95%'">
    <TR id="trdark"> 
      <TH ALIGN=CENTER  nowrap width="37%">Nombre Cliente</TH>
      <TH ALIGN=CENTER  nowrap width="20%">Cuenta</TH>
      <TH ALIGN=CENTER  nowrap width="10%">Agencia</TH>
      <TH ALIGN=CENTER  nowrap width="3%">Moneda</TH>
      <TH ALIGN=CENTER  nowrap width="3%">Tipo</TH>
      <TH ALIGN=CENTER  nowrap width="3%">Producto</TH>
      <TH ALIGN=CENTER  nowrap width="10%">Saldo</TH>
      <TH ALIGN=CENTER  nowrap width="7%">Observacion</TH>
      <TH ALIGN=CENTER  nowrap width="7%">Estado</TH>
    </TR>
    <%
                String shrBank = (String)session.getAttribute("shrBank");
                String NameSearch = (String)session.getAttribute("NameSearch");
                String shrAppCode = (String)session.getAttribute("shrAppCode");
                String shrSelect = (String)session.getAttribute("shrSelect");
                String shrAcc ="";         
                String shrClient = (String)session.getAttribute("shrClient");
                String shrType = (String)session.getAttribute("shrType");  
                String shrSTATUS = (String)session.getAttribute("shrSTATUS");              
                ewd0005Help.initRow();               
                while (ewd0005Help.getNextRow()) {
                    
                	out.println(ewd0005Help.getRecord());
                	    			 
				}
	%> 
  </TABLE>
  <TABLE  class="tbenter" WIDTH="98%" ALIGN=CENTER>
    <TR>
      <TD WIDTH="50%" ALIGN=LEFT height="25"> <%
        if ( ewd0005Help.getShowPrev() ) {
      			int pos =ewd0005Help.getFirstRec() - 21;
      			   out.print("<A HREF=\""+request.getContextPath()+"/servlet/datapro.eibs.helps.JSEWD0005Cust?NameSearch=" + NameSearch + "&FromRecord=" + pos +  "&shrBank=" + shrBank + "&shrAppCode=" + shrAppCode + "&shrSelect=" + shrSelect + "&shrSTATUS=" + shrSTATUS +"\" > <img src=\""+request.getContextPath()+"/images/e/previous_records.gif\" border=0></A>");
        }
%> </TD>
 	  <TD WIDTH="50%" ALIGN=RIGHT height="25"> <%       
        if ( ewd0005Help.getShowNext() ) {
      			int pos = ewd0005Help.getLastRec();
      			out.print("<A HREF=\""+request.getContextPath()+"/servlet/datapro.eibs.helps.JSEWD0005Cust?NameSearch=" + NameSearch + "&FromRecord=" + pos +  "&shrBank=" + shrBank + "&shrAppCode=" + shrAppCode + "&shrSelect=" + shrSelect + "&shrSTATUS=" + shrSTATUS + "\" ><img src=\""+request.getContextPath()+"/images/e/next_records.gif\" border=0></A>");

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