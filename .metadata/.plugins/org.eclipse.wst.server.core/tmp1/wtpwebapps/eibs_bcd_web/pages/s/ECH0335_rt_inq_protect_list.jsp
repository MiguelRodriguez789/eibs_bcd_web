<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<%@ page import ="datapro.eibs.master.Util" %>
<HTML>
<HEAD>
<TITLE>
Lista de Garant�as
</TITLE>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "chkList" class= "datapro.eibs.beans.JBListRec"  scope="session" /> 
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/> 
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />


<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>


<script type="text/javascript">

 function setInfo(idxRow){
   for ( var i=0; i<dataTable.rows.length; i++ ) {
       dataTable.rows[i].className="trnormal";
    }
   dataTable.rows[idxRow].className="trhighlight";
   document.forms[0].actRow.value = idxRow;   
  }
   
<%
if ( userPO.getOption().equals("RT") ) {
%>
	builtNewMenu(rt_i_opt);
<%   
}
else if ( userPO.getOption().equals("SV") ) {
%>
	builtNewMenu(sv_i_opt);
<%   
}
%>

</script>
</head>

<body>
<% 
 if ( !error.getERRNUM().equals("0")  ) {
     error.setERRNUM("0");
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
 }

   out.println("<SCRIPT> initMenu(); </SCRIPT>");
%> 
<h3 align="center">Listado de Cheques
<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="rt_inq_protec_list.jsp,ECH0335">
</h3>
<hr size="4">
<FORM>
<INPUT TYPE=HIDDEN NAME="actRow" VALUE="">

<%
	if ( chkList.getNoResult() ) {

       String action = "";
	   try {
		action = userPO.getHeader20();
		userPO.setHeader20("");
       }
       catch (Exception e) {
       	action = "";
       }
       String pagename = "";
       try {
       	pagename = userPO.getHeader21();
       	userPO.setHeader21("");
       }
       catch (Exception e) {
       	pagename = "";
       }
               
       if ( action.equals("DO_MAINT") || action.equals("DO_NEW")) {
%>
       	<SCRIPT type="text/javascript">
<% 
            if ( !pagename.equals("") ) {
%>
	   			CenterWindow('<%= pagename %>',400,300,1);
<% 
             }
%>
         </SCRIPT>
<% 
		}
%> 

          <table class="tableinfo">
            <tr > 
              <td nowrap> 
                <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
                  <tr id="trdark"> 
                    <td nowrap> 
                      <div align="right"><b>Cuenta :</b></div>
                    </td>
                    <td nowrap> <%= userPO.getIdentifier().trim()%> </td>
                    <td nowrap > 
                      <div align="right"><b>Cliente :</b></div>
                    </td>
                    <td nowrap> 
                      <div align="left"> <%=userPO.getCusNum().trim()%> </div>
                    </td>
                    <td nowrap> 
                      <div align="right"><b>Nombre :</b> </div>
                    </td>
                    <td nowrap> 
                      <div align="left"> <%= userPO.getCusName().trim()%> </div>
                    </td>
                  </tr>
                </table>
              </td>
            </tr>
          </table>

          <p>&nbsp;</p>

   <TABLE class="tbenter" width=100% height=60%>
   	<TR>
      <TD> 
        <div align="center">
          <p><b>La cuenta seleccionada a&uacute;n no posee Cheques 
            asignados</b></p>
        </div>
      </TD>
     </TR>
   </TABLE>
  <%   		
	}
	else {
 
      	String action = "";
		try {
			action = userPO.getHeader20();
			userPO.setHeader20("");
        }
        catch (Exception e) {
       		action = "";
        }
        String pagename = "";
        try {
       	 	pagename = userPO.getHeader21();
       	 	userPO.setHeader21("");
        }
        catch (Exception e) {
       		pagename = "";
       	}
               
%> 

  <INPUT TYPE=HIDDEN NAME="totalRow" VALUE="0">
  <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
          <tr id="trdark">
			<td nowrap width="16%" > 
              <div align="right"><b>Cuenta :</b></div>
            </td>
            <td nowrap width="9%" > 
               <%= userPO.getIdentifier().trim()%>
            </td>
            <td nowrap width="11%" > 
              <div align="right"><b>Cliente :</b></div>
            </td>
            <td nowrap width="10%" > 
              <div align="left"> 
                <%=userPO.getCusNum().trim()%>
              </div>
            </td>
            <td nowrap width="12%" > 
              <div align="right"><b>Nombre :</b></div>
            </td>
            <td nowrap width="42%" > 
              <div align="left">
                <%= userPO.getCusName().trim()%>
              </div>
            </td>            
          </tr>
        </table>
      </td>
    </tr>
  </table>
 <TABLE  id="mainTable" class="tableinfo">
 <TR> 
   <TD NOWRAP valign="top">
        <table id="headTable" style="width: 100%">
          <TR id="trdark"> 
            <TH ALIGN=CENTER NOWRAP>No. Cheque</TH>
            <TH ALIGN=CENTER NOWRAP>Monto</TH>            
            <TH ALIGN=CENTER NOWRAP>Beneficiario</TH>
          </TR>
        </TABLE>
        
    <div id="dataDiv1" class="scbarcolor" style="padding:0" >
        <table id="dataTable" >
    <%
         int row;
		 try{row = Integer.parseInt(request.getParameter("ROW"));}catch(Exception e){row = 0;}
         chkList.initRow();
         int k=1;
         while (chkList.getNextRow()) {
     %> 
            <TR> 
              <TD ALIGN=CENTER NOWRAP><%= Util.formatCell(chkList.getRecord(0)) %></TD>
              <TD ALIGN=RIGHT NOWRAP><%= Util.fcolorCCY(chkList.getRecord(1)) %></TD>
              <TD ALIGN=LEFT NOWRAP><%= Util.formatCell(chkList.getRecord(2)) %></TD>
            </TR>
      <%
              k++;
         }        
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
            	adjustEquTables(getElement('headTable'),getElement('dataTable'), getElement('dataDiv1'),1,false);
  }
  showChecked("ROW");
  resizeDoc();
  window.onresize=resizeDoc;
     
</SCRIPT>


  <%
  }
%> 
</FORM>

</BODY>
</HTML>
