<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
<HEAD>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "appList" class= "datapro.eibs.beans.JBList"   scope="session"/>
<jsp:useBean id= "custList" class= "datapro.eibs.beans.JBList"   scope="session"/>
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"   scope="session"/>
<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session"/>
<jsp:useBean id= "Approv" class= "java.lang.String"  scope="session" />


<%datapro.eibs.beans.JBSortList lista = (datapro.eibs.beans.JBSortList)session.getAttribute("lista");%>
<%@ page import="datapro.eibs.beans.EPR012001Message"%>
<%@ page import="datapro.eibs.master.Util"%>

<TITLE>
Aprobación
</TITLE>




<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript">
 var reason = "";

 function showAddInfo(refernum,idxRow,wrg,ofa){

   document.forms[0].REFNUM.value = refernum;
   document.forms[0].WRGFL.value = wrg;
   document.forms[0].OFAFL.value = ofa;
   document.forms[0].TRANSREFNUM.value = refernum;
   document.forms[0].H02FLGWK1.value = "";	
  } 





 function showInqApprovalPR(refnum) {
   var formLength= document.forms[0].elements.length;
   for(n=0;n<formLength;n++)
     {
      	var elementName= document.forms[0].elements[n].name;
      	var elementValue= document.forms[0].elements[n].value;
      	if(elementName == "PRISID" && elementValue== refnum) 
      	{
        		document.forms[0].elements[n].click();
        		break;
      	}
      }
     page = "${pageContext.request.contextPath}/servlet/datapro.eibs.approval.JSEPR1080A?SCREEN=100&REFNUM="+refnum;
 	 CenterWindow(page,600,500,2);
 }

function viewMessage(idxRow) {
	var y=event.clientY + document.body.scrollTop;
	var x=event.clientX + document.body.scrollLeft;

	var text = getElement("TXTMESSAGE"+idxRow).value;
	page = "${pageContext.request.contextPath}/pages/s/MISC_message_viewer.jsp?MESSAGE=" + text;
	CenterWindow(page,300,200,2);
}


  
 function goApproval() {
	if (document.forms[0].ERWRNG.value == "S"){
		document.forms[0].H02FLGWK1.value = "A";	
	}
	document.forms[0].action.value = "A";
	document.forms[0].submit();
 }

 function goAction(op) {
 
     document.forms[0].action.value = op;
     document.forms[0].reason.value = reason;
     if (document.forms[0].TRANSREFNUM.value.trim() !== "") {
        if(op == 'Z'){
			document.forms[0].action.value = 'A';
		}
		var accnum = document.forms[0].TRANSREFNUM.value;
		
            if (document.forms[0].OFAFL.value.trim() !== "" && op != 'Z' && op != 'D') {
		     page = "${pageContext.request.contextPath}/servlet/datapro.eibs.helps.JSEWD0092?shrAcc=" + accnum + "&shrCategory=ALL" + "&FromRecord=0&shrAction=APV";
		     CenterWindow(page,600,500,2);
            } else { 
		      if (document.forms[0].WRGFL.value.trim() !== "" && op == 'A') {
			   page = "${pageContext.request.contextPath}/servlet/datapro.eibs.alerts.JSESD0000?ACCNUM=" + accnum+"&APP=1";
			   CenterWindow(page,420,300,2);
                  }
               else {

			ok = confirm("Esta seguro que desea procesar este Banco?");
	  			if (ok){
                        document.forms[0].submit();
                        }
                  }
              }
     }
     else {
		  alert("Seleccione un Banco...!! ");	   
     }
  }  
  
 function goExit(){
    window.location.href="<%=request.getContextPath()%>/pages/background.jsp";
  }
  
function showOfac(fieldValue){
       document.forms[0].REFNUM.value=fieldValue;

	var formLength= document.forms[0].elements.length;
   	for(n=0;n<formLength;n++)
     	{
      		var elementName= document.forms[0].elements[n].name;
      		var elementValue= document.forms[0].elements[n].value;
      		if(elementName == "PRISID" && elementValue== fieldValue) 
      			{
        		document.forms[0].elements[n].click();
        		break;
      		}
      	}
	page = "${pageContext.request.contextPath}/servlet/datapro.eibs.helps.JSEWD0092?shrAcc=" + fieldValue + "&shrCategory=ALL" + "&FromRecord=0&shrAction=INQ";
	CenterWindow(page,600,500,2);    
 }
  
function enter(recpos){
 document.forms[0].SCREEN.value = '5';
 document.forms[0].Pos.value = "" + recpos;
 document.forms[0].submit();
}
 function goMsgSwift() {
    
     
     if (form1.TRANSREFNUM.value.trim() !== "") {
         
		   var dx = 450;
		   var dy = 350;
		   var y0 = (screen.height - dy) / 2;
		   var x0 = (screen.width - dx) / 2;
		   var attr = 'toolbar=no,location=no,directories=no,menubar=no,scrollbars=yes,resizable=yes,copyhistory=no,left=' + x0 + ',top=' + y0 + ',height=' + dy + ',width=' + dx;

		   page = "${pageContext.request.contextPath}/servlet/datapro.eibs.approval.JSEPR1080A?SCREEN=8&TRANSREFNUM="+form1.TRANSREFNUM.value;
		   listin = window.open(page,'',attr);
         
     } else {
		  alert("Seleccione una cuenta ");	   
     }

 }

function getSwiftIDList(swiftID, flg)
{
	document.forms[0].SID.value = swiftID;
	document.forms[0].FLG.value = flg;
	document.forms[0].SCREEN.value="1";
	document.forms[0].submit();
}
  
var ATRAS = 0;
var ADELANTE = 1;

function navega(direccion)
{
	document.forms[0].SCREEN.value = 600 + direccion;
	document.forms[0].submit();
}


</script>
</HEAD>


<BODY onload="MM_preloadImages('<%=request.getContextPath()%>/images/s/approve_over.gif','<%=request.getContextPath()%>/images/s/reject_over.gif')">
<h3 align="center">Aprobaci&oacute;n por Banco</h3>
<hr size="4">
<FORM Method="post" name="form1" Action="<%=request.getContextPath()%>/servlet/datapro.eibs.approval.JSEPR1080A">
<INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="9">
<INPUT TYPE=HIDDEN NAME="action" VALUE="A">
<INPUT TYPE=HIDDEN NAME="reason" VALUE="">
<INPUT TYPE=HIDDEN NAME="appCode" VALUE="">
<INPUT TYPE=HIDDEN NAME="filcod" VALUE="T">
<INPUT TYPE=HIDDEN NAME="totalRow" VALUE="0">
<INPUT TYPE=HIDDEN NAME="WRGFL" VALUE="">
<INPUT TYPE=HIDDEN NAME="OFAFL" VALUE="">
<INPUT TYPE=HIDDEN NAME="Pos" VALUE="0">
<input type=HIDDEN name="TRANSREFNUM" value="">
<INPUT TYPE=HIDDEN NAME="H02FLGWK1" VALUE="">
<INPUT TYPE=HIDDEN NAME="FIELD" VALUE=""> 
<INPUT TYPE=HIDDEN NAME="DAY"   VALUE=""> 
<INPUT TYPE=HIDDEN NAME="MONTH" VALUE=""> 
<INPUT TYPE=HIDDEN NAME="YEAR"  VALUE=""> 
<INPUT TYPE=HIDDEN NAME="E02CUTDTD"   VALUE="<%= session.getAttribute("day") %>"> 
<INPUT TYPE=HIDDEN NAME="E02CUTDTM" VALUE="<%= session.getAttribute("month") %>"> 
<INPUT TYPE=HIDDEN NAME="E02CUTDTY"  VALUE="<%= session.getAttribute("year") %>"> 
<INPUT TYPE=HIDDEN NAME="E02CUTTIM"  VALUE="<%= session.getAttribute("time") %>"> 
<INPUT TYPE=HIDDEN NAME="SID" VALUE="">
<INPUT TYPE=HIDDEN NAME="FLG" VALUE="">


<%
String ERWRNG = "";
try { 
	ERWRNG=request.getParameter("ERWRNG").trim();
} catch (Exception e) {
	ERWRNG="";
}
%>
<INPUT TYPE=HIDDEN   NAME="ERWRNG" VALUE="<%=ERWRNG%>">

<TABLE class="tbenter" width="100%" align=center>   
    <TR>
      <TD class=TDBKG width="33%"> 
        <div align="center"><a href="javascript:goAction('A')" id="linkApproval"><b>Aprobar</b></a></div>
      </TD>
      <TD class=TDBKG width="33%"> 
        <div align="center"><a href="javascript:enterReason('R')" id="linkReject"><b>Rechazar</b></a></div>
      </TD>
      <TD class=TDBKG width="34%"> 
        <div align="center"><a href="javascript:goExit()" id="linkExit"><b>Salir</b></a></div>
      </TD>
    </TR>
  </TABLE>
  
  <table  id="mainTable" class="tableinfo">
    <tr > 
      <td NOWRAP valign="top" width="100%"> 

	    <table id="headTable" style="width: 100%"> 
	    
		  	<TR id="trdark">
		  	 
		      		<TH ALIGN=CENTER NOWRAP width="5%"></TH>
		            <TH ALIGN=CENTER NOWRAP width="10"><a>ID Swift</a></TH>
		            <TH ALIGN=CENTER NOWRAP width="37%"><a >Banco Remitente</a></TH>             
			        <TH ALIGN=CENTER NOWRAP width="3%"><a >Mda</a></TH>
		            <TH ALIGN=CENTER NOWRAP width="15%"><a >Monto</a></TH>
		            <th align=CENTER NOWRAP width="10%"><a >Cantidad <br> Mensajes</a></th>
		            <th align=CENTER NOWRAP width="20%"><a >Estado</a></th>  
		            					
		    </TR>
		    <TR id="trdark"> 
		      		<TH ALIGN=CENTER NOWRAP width="5%" height="2"></TH>
		            <TH ALIGN=CENTER NOWRAP width="10%" height="2"></TH>
		            <TH ALIGN=CENTER NOWRAP width="37%" height="2"></TH>             
		            <TH ALIGN=CENTER NOWRAP width="3%" height="2"></TH>
		            <TH ALIGN=CENTER NOWRAP width="15%" height="2"></TH>
		            <th align=CENTER NOWRAP width="10%" height="2"></th>
		            <th align=CENTER NOWRAP width="20%" height="2"></th>
		            
		         				
		    </TR>
	    </TABLE> 
    
        <div id="dataDiv1" class="scbarcolor"> 
          <table id="dataTable">

		<%int indexRow=0;
		  int i=0;
			String sMes = "";
			String sAno = "";
			String sDia = "";
	
			String marker = "";
			String myFlag = "";
			StringBuffer myRow = null;
			String chk = "";
			String warnImg= "";
			String txtAlt="";
			String warnFlag= "";
			String bklFlag="";
			String ofacImg = "";
			String ofacFlag = "";

		  for (indexRow = lista.getBaseIdx(); indexRow < lista.getSize() && indexRow < lista.getBaseIdx() + lista.getDisplaySize(); indexRow++) { 
			EPR012001Message msgList = (EPR012001Message)lista.getData(indexRow);

//			if (indexRow == 0) 
//			{
//			chk = "checked";
//			}
//			else 
//			{
//			chk = "";
//			}
			
			if (msgList.getH01FLGWK2().trim().equals("A")) {
				warnImg= "<IMG border=\"0\" src=\""+request.getContextPath()+"/images/warning01.gif\" title=\""+txtAlt+"\" onClick=\"showWarnings('" + msgList.getE01PRISID() + "','PRISID')\">";
				warnFlag = msgList.getH01FLGWK2().trim();
			}else{
				warnImg= "";
				warnFlag = "";
			}

	        if (msgList.getH01FLGWK3().trim().equals("3")) {
				ofacImg= "<IMG border=\"0\" src=\""+request.getContextPath()+"/images/warning_16.jpg\" title=\"OFAC Match List\" onClick=\"showOfac('" + msgList.getE01PRISID() + "')\">";
				ofacFlag = msgList.getH01FLGWK3().trim();
			}else{
				ofacImg= "";
				ofacFlag = "";
			}

			if (!Approv.equals("A") && !Approv.equals("B")){
				if (!msgList.getE01MSGTXT().trim().equals("")) {
					ofacImg= "<IMG border=\"0\" src=\""+request.getContextPath()+"/images/ico1.gif\" title=\"TRX con observación\" onClick=\"viewMessage('" + indexRow + "')\">";
					ofacFlag = "";
				}else{
					ofacImg= "";
					ofacFlag = "";
				}
			}


			if (Approv.equals("A") || Approv.equals("B")){
				warnImg= "";
			}	

			sMes = msgList.getE01PRICDM();
			sAno = msgList.getE01PRICDY();
			sDia = msgList.getE01PRICDD();

			if( sMes.length() < 2){
				sMes = "0" + sMes;
			}

			if(sDia.length() < 2){
				sDia= "0" + sDia;
			}
			if(sAno.length() < 2){
				sAno= "0" + sAno;
			}

			switch (sAno.length()) 
			{
				case 1 : sAno = "000" + sAno;break;
				case 2 : 
						if (Integer.parseInt(sAno) < 52)
							sAno = "20" + sAno;
						else
							sAno = "19" + sAno;
				break;
				case 3 : sAno = "0"   + sAno;break;
			}
					
			%>
					<TR>
					<TD NOWRAP>
						<INPUT TYPE=HIDDEN NAME="TXTMESSAGE<%=indexRow%>" VALUE="<%=msgList.getE01MSGTXT()%>">
						<INPUT TYPE=HIDDEN NAME="fecha<%=indexRow%>" VALUE="<%=sAno%><%=sMes%><%=sDia%>">
					</TD>
					<TD NOWRAP width="5%"><input type="radio" name="REFNUM" value="<%=msgList.getE01PRISID()%>" <%=chk%> onclick="showAddInfo('<%=msgList.getE01PRISID()%>',<%=i%>,'<%=warnFlag%>','<%=ofacFlag%>')"></TD>
					<TD NOWRAP ALIGN="CENTER" width="10%"><A HREF="javascript:getSwiftIDList('<%= msgList.getE01PRISID()%>', 'L')"><%= Util.formatCell(msgList.getE01PRISID())%></A></TD>
					<TD NOWRAP ALIGN="CENTER" width="30%"><A HREF="javascript:getSwiftIDList('<%= msgList.getE01PRISID()%>', 'L')"><%= Util.formatCell(msgList.getE01CUSNA1())%></A></TD>
					<TD NOWRAP ALIGN="CENTER" width="3%"><A><%= Util.formatCell(msgList.getE01PRICCY())%></A></TD>
					<TD NOWRAP ALIGN="CENTER" width="20%"><A><%= Util.fcolorCCY(msgList.getE01PRIAMT())%></A></TD>
					<TD NOWRAP ALIGN="CENTER" width="10%"><A><%= Util.formatCell(msgList.getE01PRIDAC())%></A></TD>
					<TD NOWRAP ALIGN="CENTER" width="22%"><A><%= Util.formatCell(msgList.getE01REMARK())%></A></td>
					</TR>
			<% i++;
			}%>

          </table>
        </div>
      </td>
    </tr>
  </table>
	<TABLE class="tbenter" WIDTH="100%" >
			<TR>
				<TD ALIGN=LEFT>
					<%if (lista.showPrev()) { %>
						<A  HREF="javascript:navega(0)"><IMG border="0" src="<%=request.getContextPath()%>/images/s/previous_records.gif"></A>
					<%}%>  
				</TD>
				<TD ALIGN=RIGHT>     
					<%if (lista.showNext()){ %>
						<A HREF="javascript:navega(1)"><IMG border="0" src="<%=request.getContextPath()%>/images/s/next_records.gif"></A>
					<%}%>
				</TD>
			</TR>
	</TABLE>


<SCRIPT type="text/javascript">
     document.forms[0].totalRow.value="<%= indexRow %>";
     function resizeDoc() {
       divResize(false);
            	adjustEquTables(getElement('headTable'),getElement('dataTable'), getElement('dataDiv1'),1,false);
      }
	 //showChecked("REFNUM");
	 radioClick("REFNUM", 0);
     //resizeDoc();
     window.onresize=resizeDoc;
     
</SCRIPT>  
<BR>

</FORM>

<%if(error.getERWRNG().equals("Y") && error.getERRNUM().equals("1")){%>
	<script type="text/javascript">
		showWarningsApp("<%= request.getParameter("ACCNUM").trim()%>");
	</SCRIPT>
<%}else if ( !error.getERRNUM().equals("0")){
	error.setERRNUM("0");
	out.println("<SCRIPT Language=\"Javascript\">");
    out.println("       showErrors()");
	out.println("</SCRIPT>");
}
String opt = ""; 
%>

</BODY>
</HTML>
