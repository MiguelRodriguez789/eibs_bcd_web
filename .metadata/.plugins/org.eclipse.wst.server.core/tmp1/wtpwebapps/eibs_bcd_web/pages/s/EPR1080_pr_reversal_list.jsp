<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@ page import="com.datapro.constants.EibsFields"%>
<HTML>
<HEAD>
<TITLE>
Customer List
</TITLE>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">


<jsp:useBean id= "appList" class= "datapro.eibs.beans.JBObjList"   scope="session"/>
<jsp:useBean id= "custList" class= "datapro.eibs.beans.JBList"   scope="session"/>
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"   scope="session"/>
<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session"/>
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript">

	var reason = "";

 	function showInqApprovalPR(refnum) {
 		clickElement("REFNUM", refnum);
     	var page = webapp + "/servlet/datapro.eibs.approval.JSEPR1080A?SCREEN=100&REFNUM="+refnum;
 	 	CenterWindow(page, 600, 500, 2);
 	}

 	function showAddInfo(refernum, idxRow) {
   		document.getElementById("tbAddInfo").rows[0].cells[1].style.color = "#d0122c";
   		document.getElementById("tbAddInfo").rows[0].cells[1].innerHTML = getElement("TXTDATA"+idxRow).value;
   
   		for (var i=0; i<document.getElementById("dataTable").rows.length; i++) {
       		document.getElementById("dataTable").rows[i].className = "trnormal";
    	}
   		document.getElementById("dataTable").rows[idxRow].className = "trhighlight";
   		
   		document.forms[0].ActRow.value = idxRow;
  		document.forms[0].REFNUM.value = refernum;
  	} 

 	function goAction(op) {
    	document.forms[0].SCREEN.value = "7";
    	document.forms[0].action.value = op;
     	document.forms[0].reason.value = reason;
	 	document.forms[0].submit();
  	}  
  	
  	function goFilter() {
  		document.getElementById("filter").disabled = true;
	 	document.forms[0].submit();
  	}
  
 	function goExit(){
    	window.location.href="<%=request.getContextPath()%>/pages/background.jsp";
  	}
  	
  	function enterFilter(recpos) {
  		document.forms[0].Pos.value = "" + recpos;
  		document.forms[0].submit();
  	}

</SCRIPT>
</HEAD>

<% 
 if (!error.getERRNUM().equals("0")) {
     error.setERRNUM("0");
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("   showErrors()");
     out.println("</SCRIPT>");
}%>

<BODY onload="MM_preloadImages('<%=request.getContextPath()%>/images/s/approve_over.gif','<%=request.getContextPath()%>/images/s/reject_over.gif','<%=request.getContextPath()%>/images/s/reversal_over.gif','<%=request.getContextPath()%>/images/s/exit_over.gif','<%=request.getContextPath()%>/images/s/applicar_on.gif')">
<h3 align="center">Reversión de Transferencias	</h3>
<hr size="4">
<FORM Method="post" Action="<%=request.getContextPath()%>/servlet/datapro.eibs.approval.JSEPR1080A">
<INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="6">
<INPUT TYPE=HIDDEN NAME="action" VALUE="X">
<INPUT TYPE=HIDDEN NAME="reason" VALUE="">
<INPUT TYPE=HIDDEN NAME="appCode" VALUE="">
<INPUT TYPE=HIDDEN NAME="filcod" VALUE="T">
<INPUT TYPE=HIDDEN NAME="totalRow" VALUE="0">
<INPUT TYPE=HIDDEN NAME="ActRow" VALUE="0">
<INPUT TYPE=HIDDEN NAME="Pos" VALUE="0">
  <INPUT TYPE=HIDDEN NAME="OPT">
  <input type=HIDDEN name="DATES" value="">
  <TABLE class="tbenter">
    <TR> 
      <TD CLASS="TDBKG" ALIGN=CENTER width="50%"> 
      	<a href="javascript:enterReason('X')" >Reversal</a> 
      </TD>
      <TD CLASS="TDBKG" ALIGN=CENTER width="50%"> 
      	<a href="javascript:checkClose()" >Salir</a> 
      </TD>
    </TR>
  </TABLE>
  
  <table class="tbenter" width="100%">
    <tr> 
      <td colspan="2" valign="middle"> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="trdark"> 
            <td nowrap width="25%"> 
              <div align="right">Número de Operación :</div>
            </td>
            <td nowrap width="25%"> 
              <div align="left"> 
                <input type="text" name="E01SCHNUM" size="15" maxlength="12" value="<%= userPO.getAccNum().trim()%>">
              </div>
            </td>
            <td nowrap width="25%"> 
              <div align="right">Moneda :</div>
            </td>
            <td nowrap width="25%"> 
              <div align="left"> 
                <input type="text" name="E01SCHCCY" size="4" maxlength="3" value="<%= userPO.getCurrency().trim()%>">
                <a href="javascript:GetCurrency('E01SCHCCY','')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="help" align="bottom" border="0"></a>
              </div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="25%"> 
              <div align="right">Cliente Ordenante :</div>
            </td>
            <td nowrap width="25%"> 
              <div align="left"> 
                <input type="text" name="E01SCHOCU" size="10" maxlength="9" value="<%=userPO.getHeader9()%>">
        		<a href="javascript:GetCustomerDescId('E01SCHOCU','','')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="bottom" border="0"></a>
              </div>
            </td>
            <td nowrap width="25%"> 
              <div align="right">Banco Corresponsal :</div>
            </td>
            <td nowrap width="25%"> 
              <div align="left"> 
                <input type="text" name="E01SCHRID" size="10" maxlength="9" value="<%=userPO.getHeader10()%>">
        		<a href="javascript:GetSwiftId('E01SCHRID')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="bottom" border="0"></a>
              </div>
            </td>
            </tr>
          <tr id="trdark">
            <td nowrap width="25%">
              <div align="right">Fecha Desde :</div>
            </td>
            <td nowrap width="25%">
              <div align="left">
              <%if(currUser.getE01DTF().equals("DMY")) { %>
				<INPUT name="E01SCHDFD" value="<%=userPO.getHeader2()%>" size="4" maxlength="2" >
				<INPUT name="E01SCHDFM" value="<%=userPO.getHeader1()%>" size="4" maxlength="2" >
				<INPUT name="E01SCHDFY" value="<%=userPO.getHeader3()%>" size="6" maxlength="4" >
				<A href="javascript:DatePicker(document.forms[0].E01SCHDFD,document.forms[0].E01SCHDFM,document.forms[0].E01SCHDFY)">
				<IMG src="<%=request.getContextPath()%>/images/calendar.gif" title="Ayuda" align="middle" border="0"></A>
			  <%} else if(currUser.getE01DTF().equals("MDY")){%>
				<INPUT name="E01SCHDFM" value="<%=userPO.getHeader1()%>" size="4" maxlength="2" >
				<INPUT name="E01SCHDFD" value="<%=userPO.getHeader2()%>" size="4" maxlength="2" >
				<INPUT name="E01SCHDFY" value="<%=userPO.getHeader3()%>" size="6" maxlength="4" >
				<A href="javascript:DatePicker(document.forms[0].E01SCHDFM,document.forms[0].E01SCHDFD,document.forms[0].E01SCHDFY)">
				<IMG src="<%=request.getContextPath()%>/images/calendar.gif" title="Ayuda" align="middle" border="0"></A>
			  <% } else {%>
				<INPUT name="E01SCHDFY" value="<%=userPO.getHeader3()%>" size="6" maxlength="4" >
				<INPUT name="E01SCHDFM" value="<%=userPO.getHeader1()%>" size="4" maxlength="2" >
				<INPUT name="E01SCHDFD" value="<%=userPO.getHeader2()%>" size="4" maxlength="2" >
				<A href="javascript:DatePicker(document.forms[0].E01SCHDFY,document.forms[0].E01SCHDFM,document.forms[0].E01SCHDFD)">
				<IMG src="<%=request.getContextPath()%>/images/calendar.gif" title="Ayuda" align="middle" border="0"></A>
			  <% } %>
              </div>
            </td>
            <td nowrap width="25%">
              <div align="right">Fecha Hasta :</div>
            </td>
            <td nowrap width="25%">
              <div align="left"> 
              <%if(currUser.getE01DTF().equals("DMY")) { %>
				<INPUT name="E01SCHDTD" value="<%=userPO.getHeader7()%>" size="4" maxlength="2" >
				<INPUT name="E01SCHDTM" value="<%=userPO.getHeader6()%>" size="4" maxlength="2" >
				<INPUT name="E01SCHDTY" value="<%=userPO.getHeader8()%>" size="6" maxlength="4" >
				<A href="javascript:DatePicker(document.forms[0].E01SCHDTD,document.forms[0].E01SCHDTM,document.forms[0].E01SCHDTY)">
				<IMG src="<%=request.getContextPath()%>/images/calendar.gif" title="Ayuda" align="middle" border="0"></A>
			  <%} else if(currUser.getE01DTF().equals("MDY")){%>
				<INPUT name="E01SCHDTM" value="<%=userPO.getHeader6()%>" size="4" maxlength="2" >
				<INPUT name="E01SCHDTD" value="<%=userPO.getHeader7()%>" size="4" maxlength="2" >
				<INPUT name="E01SCHDTY" value="<%=userPO.getHeader8()%>" size="6" maxlength="4" >
				<A href="javascript:DatePicker(document.forms[0].E01SCHDTM,document.forms[0].E01SCHDTD,document.forms[0].E01SCHDTY)">
				<IMG src="<%=request.getContextPath()%>/images/calendar.gif" title="Ayuda" align="middle" border="0"></A>
			  <% } else {%>
				<INPUT name="E01SCHDTY" value="<%=userPO.getHeader8()%>" size="6" maxlength="4" >
				<INPUT name="E01SCHDTM" value="<%=userPO.getHeader6()%>" size="4" maxlength="2" >
				<INPUT name="E01SCHDTD" value="<%=userPO.getHeader7()%>" size="4" maxlength="2" >
				<A href="javascript:DatePicker(document.forms[0].E01SCHDTY,document.forms[0].E01SCHDTM,document.forms[0].E01SCHDTD)">
				<IMG src="<%=request.getContextPath()%>/images/calendar.gif" title="Ayuda" align="middle" border="0"></A>
			  <% } %>
              </div>
            </td>
          </tr>
          <tr id="trclear">
            <td nowrap width="25%">
              <div align="right">Monto Desde :</div>
            </td>
            <td nowrap width="25%">
              <div align="left"> 
                <input type="text" name="E01SCHAMF" size="20" maxlength="19" value="<%= userPO.getHeader4().trim()%>" onKeyPress="enterDecimal(event, 0)">
              </div>
            </td>
            <td nowrap width="25%">
              <div align="right">Monto Hasta :</div>
            </td>
            <td nowrap width="25%">
              <div align="left"> 
                <input type="text" name="E01SCHAMT" size="20" maxlength="19" value="<%= userPO.getHeader5().trim()%>" onKeyPress="enterDecimal(event, 0)">
              </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <br>
  <div align="center">
    <input class="EIBSBTN" type="button" id="filter" name="Submit" value="Filtrar" onclick="goFilter()">
  </div>
  <br>

 <TABLE  id="mainTable" class="tableinfo" style="height:400px; width: 100%">
 	<TR height="5%"> 
   		<TD NOWRAP valign="top" width="80%"> 
    		<TABLE id="headTable" width="100%">
		         <tr id="trdark"> 
		            <td align=CENTER width="5%" NOWRAP>&nbsp; &nbsp;</td>
		            <td align=CENTER width="15%" NOWRAP>Referencia</td>
		            <td align=CENTER width="15%" NOWRAP>Cliente</td>
		            <td align=CENTER width="30%" NOWRAP >Nombre</td>
		            <td align=CENTER width="35%" NOWRAP>Descripción</td>
		          </tr> 
		   </TABLE>
		</TD>
  		<TD nowrap ALIGN="RIGHT" valign="top" width="20%">
	        <Table id="tbAddInfoH"  width="100%" >
	        <tr id="trdark">
	            <TH ALIGN=CENTER nowrap > Informaci&oacute;n B&aacute;sica</TH>
	        </tr>
	      	</Table>
  		</TD>
	</TR>	          
  	<TR height="95%"> 
    	<TD NOWRAP valign="top" width="80%">
		   <div id="dataDiv1" style="height:400px; overflow:auto;">  
		   <table id=dataTable cellspacing="0" cellpadding="1" border="0" width="100%" >
            <%
                appList.initRow();
                int k = 1;
                while (appList.getNextRow()) {
               		out.println(appList.getRecord());
                    k++;
                }
    %> 
          </table>
        </div>
      </td>
      <td nowrap align="RIGHT" valign="top" width="20%"> 
        <table id="tbAddInfo" >
          <tr id="trclear" > 
            <td  align="RIGHT"  align="center" nowrap >
            	<b>Fecha de Transferencia : <br>
              	Cuenta de Débito : <br>        
              	Monto : <br>
              	Moneda : <br>
              	Banco : <br>
              	Agencia : <br>
              	Lote : <br>
              	Usuario : </b></td>
            <td align="LEFT" align="center" nowrap class="tdaddinfo"></td>
          </tr>
        </table>
      </td>
    </tr>
  </table>

<BR>

<TABLE class="tbenter" WIDTH="98%" ALIGN=CENTER>
  <TR>
  <TD WIDTH="50%" ALIGN=LEFT>
<%
        if ( appList.getShowPrev() ) {
      			int pos = appList.getFirstRec() - 21;
      			out.println("<A HREF=\"javascript:enterFilter(" + pos + ")\"><IMG border=\"0\" src=\""+request.getContextPath()+"/images/e/previous_records.gif\" ></A>");
        }
%>  
  </TD>
  <TD WIDTH="50%" ALIGN=RIGHT>     
 <%      
        if ( appList.getShowNext() ) {
      			int pos = appList.getLastRec();
      			out.println("<A HREF=\"javascript:enterFilter(" + pos + ")\"><IMG border=\"0\" src=\""+request.getContextPath()+"/images/e/next_records.gif\" ></A>");
        }
   %> 
   </TD>
 	</TR>
 	</TABLE>

</FORM>
<SCRIPT type="text/javascript">
	document.forms[0].totalRow.value = "<%= k %>";
    function resizeDoc() {
    	divResize(true);
       	adjustEquTables(document.getElementById("headTable"), document.getElementById("dataTable"), document.getElementById("dataDiv1"), 1, false);
    }
	showChecked("REFNUM");
    //resizeDoc();
    document.getElementById("tbAddInfoH").rows[0].cells[0].height = document.getElementById("headTable").rows[0].cells[0].clientHeight;
    window.onresize = resizeDoc;
</SCRIPT>  
</BODY>
</HTML>
