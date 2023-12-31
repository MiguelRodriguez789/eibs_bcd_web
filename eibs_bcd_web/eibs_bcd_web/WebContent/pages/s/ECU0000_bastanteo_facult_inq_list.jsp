<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
 
<%@ page import ="datapro.eibs.master.Util" %>
<HTML>
<HEAD>
<TITLE>
Consulta de Facultades Limitadas
</TITLE>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "mtListFac" class= "datapro.eibs.beans.JBObjList"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "userPO" 	class= "datapro.eibs.beans.UserPos"  		scope="session"/>

<SCRIPT type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>


<SCRIPT type="text/javascript">
  
  function goAction(opt,typ) {
    
    if (opt == "I") { 
		var row = document.forms[0].CURRENTROW.value;   
    	page = "<%=request.getContextPath()%>/pages/s/ECU0000_bastanteo_facult_inq.jsp?ROW=" + row;
    	CenterNamedWindow(page,'Information',650,500,2);
  	} else if (opt == "R") { 
  		if (typ == "Y") {
  			page = "<%=request.getContextPath()%>/pages/s/ECU0000_bastanteo_attorney_inq.jsp?ROW=" + <%= userPO.getHeader5()%>;
    		CenterNamedWindow(page,'Information',650,500,2);  
    	} else {
    		page = "<%=request.getContextPath()%>/pages/s/ECU0000_bastanteo_members_inq.jsp?ROW=" + <%= userPO.getHeader5()%>;
    		CenterNamedWindow(page,'Information',650,500,2);
    	}
   	}
  }
  
</SCRIPT>

</HEAD>

<BODY>

<% 
 String chk = "";
 	
 if ( !error.getERRNUM().equals("0")  ) {
     error.setERRNUM("0");
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors();");
     out.println("</SCRIPT>");
 } 
%>


<h3 align="center">Sistema de Bastanteo - Consulta de Facultades Limitadas
<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="bastanteo_facult_inq_list.jsp,ECU0000">
</h3>
<hr size="4">
<FORM Method="post" Action="<%=request.getContextPath()%>/servlet/datapro.eibs.bastanteo.JSECU0000" >

<%
	if ( mtListFac.getNoResult() ) {
%> 

  <TABLE class="tbenter" width="60%" align=center>
    <TR>
      <TD class=TDBKG width="50%"> 
        <div align="center"><a href="javascript:goAction('R','<%=userPO.getHeader3()%>')">Regresar</a> 
        </div>
      </TD> 
      <TD class=TDBKG width="50%"> 
        <div align="center"><a href="javascript:checkClose()">Salir</a> </div>
      </TD>
    </TR>
  </TABLE>
  <TABLE class="tbenter" width=100% height=40%>
   	<TR>
      <TD> 
        <div align="center"> 
          <p>
            <b>No existen registros de facultades.</b>
          </p>          
        </div>
      </TD>
     </TR>
   </TABLE>
  <%   		
	}
	else { 
	
  %>
     
 <INPUT TYPE=HIDDEN NAME="CURRENTROW" VALUE="0"> 
  
 <TABLE cellspacing=0 cellpadding=2 width="100%" border="0">    
	<TR>
		<TD nowrap width="40%">
			<DIV align="right">C&oacute;digo de Cliente :</DIV>
		</TD>
		<TD nowrap width="60%">
			<INPUT type="text" name="E07CULCUN" size="10" maxlength="9" value="<%= userPO.getHeader16() %>" readonly> 
		</TD>
	</TR>
	<TR>
		<TD nowrap width="40%">
			<DIV align="right">Nombre o Denominaci&oacute;n Social :</DIV>
		</TD>
		<TD nowrap width="60%">
			<INPUT type="text" name="E07CUSNA1" size="40" maxlength="35" value="<%= userPO.getHeader17() %>" readonly>  
		</TD>
	</TR>
	<% 
 	if (!userPO.getHeader3().equals("Y")) {
	%>
	<TR>
		<TD nowrap width="40%">
			<DIV align="right">Integrante :</DIV>
		</TD>
		<TD nowrap width="60%">
			<INPUT type="text" name="E07CULMAN" size="3" maxlength="2" value="<%= userPO.getHeader18() %>" readonly>
			<INPUT type="text" name="E07CULMA1" size="40" maxlength="35" value="<%= userPO.getHeader19() %>" readonly> 
		</TD>
	</TR>
	<% } else { %>
	<TR>
		<TD nowrap width="40%">
			<DIV align="right">Apoderado :</DIV>
		</TD>
		<TD nowrap width="60%">
			<INPUT type="text" name="E07CULMA1" size="40" maxlength="35" value="<%= userPO.getHeader19() %>" readonly> 
		</TD>
	</TR>
	<% } %>
	<% 
 		if (!userPO.getHeader3().equals("Y")  ) {
	%>
	<TR>
		<TD nowrap width="40%">
			<DIV align="right">Cargo :</DIV>
		</TD>
		<TD nowrap width="60%">
			<INPUT type="text" name="E07CUMUC5" size="5" maxlength="4" value="<%= userPO.getHeader20() %>" readonly>
			<INPUT type="text" name="E07CUMUCN" size="40" maxlength="35" value="<%= userPO.getHeader21() %>" readonly> 
		</TD>
	</TR>
	<% } %>
 </TABLE>
    
 <TABLE class="tbenter" width="100%" align=center>
    <TR> 
      <TD class=TDBKG width="33%"> 
        <div align="center"><a href="javascript:goAction('I')">Consultar</a> 
        </div>
      </TD>
      <TD class=TDBKG width="33%"> 
        <div align="center"><a href="javascript:goAction('R','<%=userPO.getHeader3()%>')">Regresar</a> 
        </div>
      </TD>
      <TD class=TDBKG width="33%"> 
        <div align="center"><a href="javascript:checkClose()">Salir</a> </div>
      </TD>
    </TR>
 </TABLE>
  
 <TABLE  id="mainTable" class="tableinfo" >
  <TR> 
    <TD NOWRAP valign=top>
  	 <TABLE id="dataTable" width="100%">
  		<TR id="trdark"> 
  			<TH ALIGN=CENTER ></TH>
    		<TH ALIGN=CENTER >Facultad</TH>
    		<TH ALIGN=CENTER >Monto<BR>Autorizado</TH>
    		<TH ALIGN=CENTER >Fecha Ultima<BR>Actualizacion</TH>
    		<TH ALIGN=CENTER >Usuario Ultima<BR>Actualizacion</TH> 
  		</TR>
     <%
                mtListFac.initRow(); 
                chk = "checked";               
                while (mtListFac.getNextRow()) {
                   datapro.eibs.beans.ECU000007Message msgMT = (datapro.eibs.beans.ECU000007Message) mtListFac.getRecord();
     %>               
        <TR>
			<TD NOWRAP width="2%"><input type="radio" name="ROW" value="<%= mtListFac.getCurrentRow()%>" <%=chk%> onClick="document.forms[0].CURRENTROW.value = this.value;"></TD>
			<TD NOWRAP ALIGN="CENTER"><%=Util.formatCell(msgMT.getE07CULFAN())%></TD>
			<TD NOWRAP ALIGN="CENTER"><%=Util.formatCell(msgMT.getE07CULAMT())%></TD>
			<TD NOWRAP ALIGN="CENTER"><%=Util.formatDate(msgMT.getE07CULAC1(),msgMT.getE07CULAC2(),msgMT.getE07CULAC3())  + " - " + msgMT.getE07CULACT()%></TD>
			<TD NOWRAP ALIGN="CENTER"><%=Util.formatCell(msgMT.getE07CULACU())%></TD>
		</TR>    		
    <%             
    				chk = "";     
                }
    %>    
     </TABLE>
    </TD>
   </TR>	
</TABLE>

<SCRIPT type="text/javascript">
  showChecked("ROW");       
</SCRIPT>

<%   		
	} 
 %>
</FORM>

</BODY>
</HTML>
