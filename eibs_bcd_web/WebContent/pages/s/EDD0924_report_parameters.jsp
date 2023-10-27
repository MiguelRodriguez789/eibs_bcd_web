<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<%@ page import = "datapro.eibs.master.*,datapro.eibs.beans.*" %>
<title>Procesar Reportes</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />
<jsp:useBean id= "prList" class= "datapro.eibs.beans.JBObjList"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<SCRIPT type="text/javascript">


function goProcess() 
{
	var fD;
	var fH;
	var ok = true;
	var form = document.forms[0];
	if(form.FI.value!="") {
	   fD=new Date(form[form.FI.value + "_YY"].value, parseInt(form[form.FI.value + "_MM"].value)-1, form[form.FI.value + "_DD"].value);
   	   form[form.FI.value].value = addLeftChar('0', 2, String(fD.getDate())) + addLeftChar('0', 2, String(fD.getMonth()+1)) + String(fD.getFullYear());
	}
	
	if(form.FF.value!="" && ok == true) {
	   fH=new Date(form[form.FF.value + "_YY"].value, parseInt(form[form.FF.value + "_MM"].value)-1, form[form.FF.value + "_DD"].value);
	   form[form.FF.value].value = addLeftChar('0', 2, String(fH.getDate())) + addLeftChar('0', 2, String(fH.getMonth()+1)) + String(fH.getFullYear());
	}
	   
	if(form.FI.value!="" && form.FF.value!="" && ok == true) {
	   if (fD > fH) {
		   ok = false;
		   alert("La Fecha Final debe ser mayor o igual a la Fecha Inicial");	
	   }
	}
	
	if(ok)
	  document.forms[0].submit();
			 
}

</SCRIPT>
</head>

<body>

<% 
 if ( !error.getERRNUM().equals("0")  ) {
     out.println("<SCRIPT Language=\"Javascript\">");
	 error.setERRNUM("0");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
 }

%>

<h3 align="center">Procesar Reportes<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="report_parameters.jsp, EDD0924"></h3>
<hr size="4">

<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.approval.JSERPTSTD">

  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="27">
  <INPUT TYPE=HIDDEN NAME="actRow" VALUE="0">
  <INPUT TYPE=HIDDEN NAME="TOTROWS" VALUE="0">
  <INPUT TYPE=HIDDEN NAME="FI" VALUE="">
  <INPUT TYPE=HIDDEN NAME="FF" VALUE="">

<% if ( prList.getNoResult() ) { %>

 	<TABLE class="tbenter" width=100% height=30%">
 		<TR>
      <TD>         
      <div align="center"> <h4 style="text-align:center"> No existen parámetros a enviar.</h4> 
      </div>
      </TD></TR>
   	</TABLE>
   	
<% } else { %>
    
  <TABLE class="tbenter">
    <TR>
      <TD ALIGN=CENTER class="TDBKG" width="50%">
  		<a href="javascript:goProcess()">Procesar</a>
      </TD>
      <TD ALIGN=CENTER class="TDBKG" width="50%">
  		<a href="<%=request.getContextPath()%>/pages/background.jsp">Salir</a>
      </TD>
    </TR>
  </TABLE>
  
  <TABLE class="tableinfo" id="dataTable">
    
    <%
    	  int i = 0;
    	  boolean firstTime = true; 	
          prList.initRow();    
          while (prList.getNextRow()) {
               ERP001001Message msgList = (ERP001001Message) prList.getRecord();
               String value = msgList.getE01PMSVAL().trim();
               
               if (firstTime) {     
       %>        
          <TR id=trdark>
            <td NOWRAP align=center colspan="3">
          	  <b><%=msgList.getE01RPTDSC()%></b>
		    </td>		  
		  </TR>
          <TR id=trdark>
          <td NOWRAP align="center" ><b>Parámetro</b></td>		  
		  <td NOWRAP align="center" ><b>Valor</b></td>
          <td NOWRAP align="center" ><b>Comentario</b></td>		  		  		  
		</TR>
            
       <%
       			firstTime = false;
       			}
       %>             
          <TR id=trclear>
          <td NOWRAP align="right" >
          	<%=Util.formatCell(msgList.getE01PMSDSC())%>&nbsp;:
          	<INPUT TYPE=HIDDEN id="E01RPTNME_<%= prList.getCurrentRow() %>" NAME="E01RPTNME_<%= prList.getCurrentRow() %>" VALUE="<%= msgList.getE01RPTNME() %>">
          	<INPUT TYPE=HIDDEN id="E01RPTPRG_<%= prList.getCurrentRow() %>" NAME="E01RPTPRG_<%= prList.getCurrentRow() %>" VALUE="<%= msgList.getE01RPTPRG() %>">
          	<INPUT TYPE=HIDDEN id="E01RPTSEQ_<%= prList.getCurrentRow() %>" NAME="E01RPTSEQ_<%= prList.getCurrentRow() %>" VALUE="<%= msgList.getE01RPTSEQ() %>">
          	<INPUT TYPE=HIDDEN id="E01RPTCOD_<%= prList.getCurrentRow() %>" NAME="E01RPTCOD_<%= prList.getCurrentRow() %>" VALUE="<%= msgList.getE01RPTCOD() %>">
          	<INPUT TYPE=HIDDEN id="E01RPTINS_<%= prList.getCurrentRow() %>" NAME="E01RPTINS_<%= prList.getCurrentRow() %>" VALUE="<%= msgList.getE01RPTINS() %>">
          	<INPUT TYPE=HIDDEN id="E01PMSPLN_<%= prList.getCurrentRow() %>" NAME="E01PMSPLN_<%= prList.getCurrentRow() %>" VALUE="<%= msgList.getE01PMSPLN() %>">
          	<INPUT TYPE=HIDDEN id="E01PMSPTY_<%= prList.getCurrentRow() %>" NAME="E01PMSPTY_<%= prList.getCurrentRow() %>" VALUE="<%= msgList.getE01PMSPTY() %>">
          	<INPUT TYPE=HIDDEN id="E01PMSNDC_<%= prList.getCurrentRow() %>" NAME="E01PMSNDC_<%= prList.getCurrentRow() %>" VALUE="<%= msgList.getE01PMSNDC() %>">
 		  </td>		  
		  <td NOWRAP align="left" >
		  		<%if(msgList.getE01RPTCOD().equals("FI") || msgList.getE01RPTCOD().equals("FF")) 
		  		  {%>
		  			<INPUT TYPE=HIDDEN NAME="E01PMSVAL_<%= prList.getCurrentRow() %>" VALUE="<%= msgList.getE01PMSVAL() %>">
		  			<% if(currUser.getE01DTF().equals("DMY")){ %>
		  			<input type="text" size="2" maxlength="2" name="E01PMSVAL_<%= prList.getCurrentRow() %>_DD" onKeypress="enterInteger(event)" value="<%=value.length()>=2 ? value.substring(0,2) : currUser.getE01RDD()%>">
                    <input type="text" size="2" maxlength="2" name="E01PMSVAL_<%= prList.getCurrentRow() %>_MM" onKeypress="enterInteger(event)" value="<%=value.length()>=4 ? value.substring(2,4) : currUser.getE01RDM()%>">
                    <input type="text" size="5" maxlength="4" name="E01PMSVAL_<%= prList.getCurrentRow() %>_YY" onKeypress="enterInteger(event)" value="<%=value.length()>=8 ? value.substring(4,8) : currUser.getE01RDY()%>">
					<% } else if(currUser.getE01DTF().equals("MDY")){ %>
                    <input type="text" size="2" maxlength="2" name="E01PMSVAL_<%= prList.getCurrentRow() %>_MM" onKeypress="enterInteger(event)" value="<%=value.length()>=4 ? value.substring(2,4) : currUser.getE01RDM()%>">
		  			<input type="text" size="2" maxlength="2" name="E01PMSVAL_<%= prList.getCurrentRow() %>_DD" onKeypress="enterInteger(event)" value="<%=value.length()>=2 ? value.substring(0,2) : currUser.getE01RDD()%>">
                    <input type="text" size="5" maxlength="4" name="E01PMSVAL_<%= prList.getCurrentRow() %>_YY" onKeypress="enterInteger(event)" value="<%=value.length()>=8 ? value.substring(4,8) : currUser.getE01RDY()%>">
					<% } else if(currUser.getE01DTF().equals("YMD")){ %>
                    <input type="text" size="5" maxlength="4" name="E01PMSVAL_<%= prList.getCurrentRow() %>_YY" onKeypress="enterInteger(event)" value="<%=value.length()>=8 ? value.substring(4,8) : currUser.getE01RDY()%>">
                    <input type="text" size="2" maxlength="2" name="E01PMSVAL_<%= prList.getCurrentRow() %>_MM" onKeypress="enterInteger(event)" value="<%=value.length()>=4 ? value.substring(2,4) : currUser.getE01RDM()%>">
		  			<input type="text" size="2" maxlength="2" name="E01PMSVAL_<%= prList.getCurrentRow() %>_DD" onKeypress="enterInteger(event)" value="<%=value.length()>=2 ? value.substring(0,2) : currUser.getE01RDD()%>">
					<% } %>
                    <a href="javascript:DatePicker(document.forms[0].E01PMSVAL_<%= prList.getCurrentRow() %>_MM, document.forms[0].E01PMSVAL_<%= prList.getCurrentRow() %>_DD, document.forms[0].E01PMSVAL_<%= prList.getCurrentRow() %>_YY)">
                    <img src="<%=request.getContextPath()%>/images/calendar.gif" alt="help" align="middle" border="0"></a>
                    
                    <script>
                    	document.forms[0].<%=msgList.getE01RPTCOD()%>.value = "E01PMSVAL_<%= prList.getCurrentRow() %>";
                    </script>
				<%}
				  else{%>
					<input type="text" name="E01PMSVAL_<%= prList.getCurrentRow() %>" value="<%= msgList.getE01PMSVAL() %>" 
	  					size="<%= msgList.getE01PMSPLN() %>" maxlength="<%= msgList.getE01PMSPLN() %>" 
				  		<% if ( msgList.getE01PMSPTY().equals("N")) out.print("onKeypress=\"enterInteger(event)\""); 
	  		   			   else if ( msgList.getE01PMSPTY().equals("Z")) out.print("onKeypress=\"enterDecimal(event)\"");%>>
				<%}%>
		  		   			  
				<%if(msgList.getE01PMSDDS().equals("EWD0005DS")) {%>

				<% } %>
				
				<%if(msgList.getE01PMSDDS().equals("EWD0001R")) {%>

				<% } %>
				
				<%if(msgList.getE01PMSDDS().equals("EWD0010DS")) {%>

				<% } %>

				<%if(msgList.getE01PMSDDS().equals("EWD0430DS")) {%>
			        <a href="javascript:GetUser('E01PMSVAL_<%= prList.getCurrentRow() %>','','')"> 
					<IMG src="<%=request.getContextPath()%>/images/1b.gif" alt="Ayuda" align="bottom" border="0"></A>
				<% } %>

				<%if(!msgList.getE01PMSDDS().equals("")) {
					String pref=msgList.getE01PMSDDS();
					if(!pref.substring(0,2).equals("EW")){;
				%>


				<%if(msgList.getE01PMSDDS().equals("BR")) {%>
					<a href="javascript:GetBranch('E01PMSVAL_<%= prList.getCurrentRow() %>','')" >
					<img src="<%=request.getContextPath()%>/images/1b.gif" alt="Ayuda" align="bottom" border="0"  ></a> 
				<%}else{
					if(!msgList.getE01PMSDDS().equals("")) {%>
					<A href="javascript:GetCodeDescCNOFC('E01PMSVAL_<%= prList.getCurrentRow() %>','','<%= msgList.getE01PMSDDS().trim()%>')">
					<IMG src="<%=request.getContextPath()%>/images/1b.gif" alt="Ayuda" align="bottom" border="0"></A>
				<%  }	
					}	
					}	
					}	
				%>
		  </td>
          <td NOWRAP align="left" >
          	<%=Util.formatCell(msgList.getE01RPTINS())%>
		  </td>		  		  		  
		</TR>
       <% i++; } %> 
  </TABLE>
<BR>
<SCRIPT type="text/javascript">
	document.forms[0].TOTROWS.value = <%= i%>;
</SCRIPT>
<%      
  }
%> 
</form>
</body>
</html>
