<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
<HEAD>
<TITLE>User Reports Details</TITLE>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<%@ page import = "java.io.*,java.net.*,datapro.eibs.sockets.*,datapro.eibs.beans.*,datapro.eibs.master.*,java.math.*" %>
<LINK HREF="<%=request.getContextPath()%>/pages/style.css" REL="stylesheet">
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage" scope="session" />
<jsp:useBean id= "beanList" class= "datapro.eibs.beans.JBList" scope="session" />
<jsp:useBean id= "beanListRepGrp" class= "datapro.eibs.beans.JBList" scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>

<script type="text/javascript">

function goAction(s) {
//	  SCREEN Variables check
      var ok = false;

   	  switch ( s ) {
      	case 8 : //New
	 	   		document.forms[0].SCREENACT.value = s;
	 	   		document.forms[0].SCREEN.value = 9;
                document.forms[0].target="detail";
                document.forms[0].submit();
                break;

      	case 4 : //Delete
      	        var counter = 0;
		   		formLength= document.forms[0].elements.length;
		   		var selected = new Array();
		   		var index = 0;
                for(n=0;n<formLength;n++) {
      	        	var elemt = document.forms[0].elements[n];
      	            if(elemt.name == 'REPNAME' ) {
        				if ( elemt.checked ) {
			  				//ok = true;
                       		//break;
                       		index = selected.length;
                       		selected[index] = new Object;
                       		selected[index].value = elemt.value; 
                       		selected[index].index = n;
                       		counter++; 	
                       	}	
      		     	}
                 }
		   		if (counter > 0) {
	   		
	   		    	document.forms[0].AREPNAME.value = "";
	   		    	for (var item in selected) {
	   		    	    if (document.forms[0].AREPNAME.value.trim() != "") document.forms[0].AREPNAME.value += "_";
	   		    		document.forms[0].AREPNAME.value += selected[item].value;
	   		    	}
	   		    	document.forms[0].totalRow.value = counter;
		   		    if (confirm("Usted tiene seleccionado " + counter + " reportes. Desea continuar?")) {
		           		document.forms[0].SCREENACT.value = s;
	   		    		document.forms[0].SCREEN.value = 9;
	                  	document.forms[0].target="detail";
	                  	document.forms[0].submit();
		   		    }
                  	break;
		   		} else { 
          			alert('No tiene ningun elemento seleccionado !');
                  	break;
                }
                
		case 6 : //Update
		   		formLength= document.forms[0].elements.length;
     		   	var ok = false;
                for(n=0;n<formLength;n++) {
      	        	var elemt = document.forms[0].elements[n];
      	            if(elemt.name == 'REPNAME' ) {
        				if ( elemt.checked ) {
			  				ok = true;
                       		break; 	
                       	}	
      		     	}
                }
		   		if (ok) {
                    document.forms[0].SCREENACT.value = s;
	 	      		document.forms[0].SCREEN.value = 9;
                    document.forms[0].target="detail";
                    document.forms[0].submit();
                    break;
		   		} else { 
                    alert('No tiene ningun elemento seleccionado !');
                    break;
                }
                
	   	case 13 :
       	case 14 : 
				document.forms[0].SCREEN.value = 9;
                document.forms[0].target="detail";
                document.forms[0].submit();
                break;
                
      	case 16 : 
        		parent.window.location.href="<%=request.getContextPath()%>/pages/background.jsp";
                break;
                
        case 17 :
		   		window.location.href="<%=request.getContextPath()%>/pages/background.jsp";
                break;
                
       	default : 
	}
}

function openFile(nameOfFile) {
	<%	if(JSEIBSProp.getEODDirectUrl()){ %>
	var pg = "<%=JSEIBSProp.getEODPDFURL()%>/" + nameOfFile;
	<% 	} else { %>
	var pg = "<%=request.getContextPath()%>/servlet/datapro.eibs.tools.JSPDFParserSend?FORMAT=pdf&REPNAME=" + nameOfFile ;
	<% 	} %>
	CenterWindow(pg,600,500,2);
}

function openCSVFile(nameOfFile) {
   pg = "<%=request.getContextPath()%>/servlet/datapro.eibs.tools.JSPDFParserSend?REPNAME=" + nameOfFile;
   CenterWindow(pg,600,500,2);
}
</script>

</HEAD>
<BODY>
<FORM Method="post" Action="<%=request.getContextPath()%>/servlet/datapro.eibs.tools.JSEODPDF" >
<INPUT TYPE=HIDDEN NAME="totalRow" VALUE="0">
<INPUT TYPE=HIDDEN NAME="AREPNAME" VALUE="">
<%
	// Parameter entries
	ESS0030DSMessage msgUser = null;
  	String usercode = request.getParameter("usercode");
	boolean vOnlyAdm = true;
	session = (HttpSession)request.getSession(false);
	if (usercode.trim().equals("null")) {
             vOnlyAdm = false;
             msgUser = (datapro.eibs.beans.ESS0030DSMessage)session.getAttribute("currUser");
             usercode = msgUser.getH01USR();
	}
	String reportName = request.getParameter("REPNAME");
	String screen = request.getParameter("SCREEN");
	String type = request.getParameter("TYPE");
	String screenAct = "";
	int k = 0;
	int jScriptAction = (vOnlyAdm?16:17);
	// Products Detail
%>
<INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="<%= screen %>">
<INPUT TYPE=HIDDEN NAME="SCREENACT" VALUE="<%= screenAct %>">
<INPUT TYPE=HIDDEN NAME="usercode" VALUE="<%= usercode %>">

<table class="tbenter" width=100% align=center>
	<tr>
    	<td width="2%"></td>
		<% if (vOnlyAdm) { %>
		 		<td width="16%"><div align="center"><a href="javascript:goAction(8)"><img src="<%=request.getContextPath()%>/images/s/new.gif" align="middle" border="0"></a></div></td>
 				<td width="16%"><div align="center"><a href="javascript:goAction(4)"><img src="<%=request.getContextPath()%>/images/s/delete.gif" align="middle" border="0"></a></div></td>
 				<td width="16%"><div align="center"><a href="javascript:goAction(6)"><img src="<%=request.getContextPath()%>/images/s/update.gif" align="middle" border="0"></a></div></td>
              	<td width="16%"><div align="center"><a href="javascript:goAction(<%=jScriptAction %>)"><img src="<%=request.getContextPath()%>/images/s/exit.gif" align="middle" border="0"></a></div></td>
		<%  } %>
		<td width="2%"></td>
	</tr>
</table>
<table cellspacing="0" cellpadding="2" width="100%" border="1">
	<tr>
    	<td nowrap> 
        	<table cellspacing="0" cellpadding="2" class="tbhead" width="100%" align="center">
				<tr>
					<td align=left colspan=5 ><%= type == null ? "" : type %> <%= usercode %> </td>
				</tr>
            </table>
        </td>
	</tr>
</table>
<TABLE  id="mainTable" class="tableinfo" ALIGN=CENTER >
	<TR> 
  		<TD NOWRAP>
  			<TABLE id="headTable" width="100%">
 			 <TR id="trdark">  
				<td align=center width="3%" NOWRAP> </td>
				<td align=center width="8%" NOWRAP>Reporte</td>
				<td align=center width="65%" >Descripción</td>
				<td align=center width="10%" NOWRAP>Excel</td>
			 </tr>
		   </TABLE>
  
   <div id="dataDiv1" class="scbarcolor"  >
    <table id="dataTable" width="100%" >
<%
 if ( !error.getERRNUM().equals("0")  ) {
 	 error.setERRNUM("0");
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
}
/* } else {*/
       try {
         if (session != null) 
           {
	     boolean firstItem = true;
	     String chk = "checked";
	     String col = "";
	     int colValue = 0;
	     String rowData = "";	
	     String rowDataGrp = "";
	     String dsb = "";
            if (reportName.equals(null)) reportName = " ";
            beanList.initRow();
	        if (vOnlyAdm) {
	            beanListRepGrp.initRow();	
	        }
            while (beanList.getNextRow()){
                  if (vOnlyAdm){
                      beanListRepGrp.getNextRow();
		              rowDataGrp = beanListRepGrp.getRecord();
                  }
        	      out.println("<tr id=\"trclear\">");
		          if (beanList.getFlag().equals("")) rowData = beanList.getRecord();
		          if (vOnlyAdm) {
		               if (firstItem) 
                          {
    	   	               chk = "checked";
           	               firstItem = false;
        	              } else if ( reportName.trim().equals(rowData.substring(11,21))) chk = "checked";
            	            else chk = "";
                       }
                       if (vOnlyAdm) {
	                      if (!usercode.trim().equals(rowDataGrp.trim())) {
		                      dsb = "disabled";chk = "";
		                  } else { dsb = "";}
                       }

                       if (vOnlyAdm) {
			       	       out.println("<td nowrap width=\"5%\"><input type=\"checkbox\" " + chk + " name=\"REPNAME\" value=\"" + rowData.substring(11,21).trim() + "\" " + dsb + "  ></td>"); // radio button
                       } else {
                           out.println("<td nowrap width=\"5%\"></td>"); 
                       }
  	                   out.println(rowData);

					   int firstIndex = rowData.indexOf("'");
					   int lastIndex = rowData.lastIndexOf(".pdf");
					   if(lastIndex != -1){
						   String url = rowData.substring(firstIndex,lastIndex+5);
						   out.println("<td nowrap align\"center\" width=\"8%\"><a href=\"javascript:openCSVFile("+url+")\"><img src=\""+ request.getContextPath()+ "/images/calendar.gif\" align=\"center\" vspace=\"0\" hspace=\"0\" border=\"0\"></a></td>"); 
						}else{
							out.println("<td nowrap align\"center\" width=\"8%\"></td>"); 
						}
		               out.println("</tr>");
		               colValue++;
	            }
                k = colValue;
	        }
             else 
            {
	         out.println("Read error ");
            }
        }
        catch (Exception e){
           out.println("Exception : " + e);
	 }
/* } */
%>
</table>
   </div>
   
  </TD>
  </TR>	
</TABLE>

<SCRIPT type="text/javascript">
     document.forms[0].totalRow.value="<%= k %>";
     function resizeDoc() {
       divResize();
     	//     	adjustEquTables(getElement('headTable'),getElement('dataTable'), getElement('dataDiv1'),1,false);
      }
     resizeDoc();
     window.onresize=resizeDoc;
</SCRIPT>
<% if (!vOnlyAdm) { %>
<TABLE border="0" width="607" class="TBENTER">
  <TBODY>
    <TR>
      <TD></TD>
      <TD align="center">NOTA : Para ver los reportes necesita  <A href="http://www.acrobat.com" target="_blank">Acrobat Reader </A>instalado</TD>
      <TD></TD>
    </TR>
    <TR>
      <TD></TD>
      <TD valign="middle" align="center"><A href="http://www.acrobat.com" target="_blank"><IMG src="<%=request.getContextPath()%>/images/s/getacro.gif" width="88" height="31" border="0"></A></TD>
      <TD></TD>
    </TR>
  </TBODY>
</TABLE>
<% } %>
</FORM>
</BODY>
</HTML>
