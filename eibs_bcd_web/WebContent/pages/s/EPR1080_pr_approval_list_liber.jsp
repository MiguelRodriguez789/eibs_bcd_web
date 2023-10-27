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
<jsp:useBean id= "currUser"      class= "datapro.eibs.beans.ESS0030DSMessage" scope="session" />
<jsp:useBean id= "Approv" class= "java.lang.String"  scope="session" />
<%datapro.eibs.beans.JBSortList lista = (datapro.eibs.beans.JBSortList)session.getAttribute("lista");%>
<%@ page import="datapro.eibs.beans.EPR012001Message"%>
<%@ page import="datapro.eibs.master.Util"%>


<TITLE>
Liberación
</TITLE>

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript">
 var reason = "";

 function showInqApprovalPR(refnum) {
   var formLength= document.forms[0].elements.length;
   for(n=0;n<formLength;n++)
     {
      	var elementName= document.forms[0].elements[n].name;
      	var elementValue= document.forms[0].elements[n].value;
      	if(elementName == "PRINUM" && elementValue== refnum) 
      	{
        		document.forms[0].elements[n].click();
        		break;
      	}
      }
     page = "${pageContext.request.contextPath}/servlet/datapro.eibs.approval.JSEPR1080A?SCREEN=100&REFNUM="+refnum;
 	 CenterWindow(page,600,500,2);
 }

 function showAddInfo(refernum,idxRow,wrg,ofa){
   var dataTable = getElement('dataTable');
   var tbAddInfo = getElement('tbAddInfo');
   tbAddInfo.rows[0].cells[1].style.color="white";
   tbAddInfo.rows[0].cells[1].innerHTML=getElement("TXTDATA"+idxRow).value;
   tbAddInfo.rows[0].cells[1].style.color="";
   for(var i=0;i<dataTable.rows.length;i++ ){
       dataTable.rows[i].className="trnormal";
    }
   dataTable.rows[idxRow].className="trhighlight";
   document.forms[0].REFNUM.value = refernum;
  adjustEquTables(getElement('headTable'), dataTable, getElement('dataDiv1'),1,false);
   document.forms[0].WRGFL.value = wrg;
   document.forms[0].OFAFL.value = ofa;
   document.forms[0].TRANSREFNUM.value = refernum;
   document.forms[0].idxRow.value = idxRow;
  } 
  
 function goApproval() {
	document.forms[0].action.value = "A";
	document.forms[0].submit();
 }

 function goAction(op) {
 	document.forms[0].action.value = op;
	document.forms[0].reason.value = reason;
	if(op == 'Z'){
		document.forms[0].action.value = 'A';
	}
	if (document.forms[0].action.value=="A"){
	    var fechasistema =document.forms[0].fechasistema.value;
		var formLength= document.forms[0].elements.length;
	
	
		var ok = false;
		for (n = 0; n < formLength; n++) {
			var elementName= document.forms[0].elements[n].name;
			if (elementName == "REFNUM") {
				if (document.forms[0].elements[n].checked) {
					var pos = n;
					break;
				}
			}
		}
	}
	if (document.forms[0].TRANSREFNUM.value.trim() !== "") {
		var accnum = document.forms[0].TRANSREFNUM.value;
	        if (document.forms[0].OFAFL.value.trim() !== "" && op != 'Z' && op != 'D' && op != '3') {
		     page = "${pageContext.request.contextPath}/servlet/datapro.eibs.helps.JSEWD0092?shrAcc=" + accnum + "&shrCategory=ALL" + "&FromRecord=0&shrAction=APV";
		     CenterWindow(page,600,500,2);
	        } else { 
	                document.forms[0].submit();
	          }
	}else{
		  alert("Seleccione una cuenta ");	   
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
      		if(elementName == "PRINUM" && elementValue== fieldValue) 
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

function lookAcc()
{
//	if (trim(document.forms[0].ACCNUM1.value).trim() != "") {
		document.forms[0].SCREEN.value="5";
		document.forms[0].submit();
//	}
}
  
var ATRAS = 0;
var ADELANTE = 1;

function navega(direccion)
{
	document.forms[0].SCREEN.value = 500 + direccion;
	document.forms[0].submit();
}

function ordena(fieldname){
	document.forms[0].SCREEN.value = "502";
	document.forms[0].FIELD.value = fieldname;
	document.forms[0].submit();
}

function ordenaFecha(dd,mm,yy){
	document.forms[0].SCREEN.value = "503";
	document.forms[0].DAY.value = dd;
	document.forms[0].MONTH.value = mm;
	document.forms[0].YEAR.value = yy;
	document.forms[0].submit();
}

</script>
</HEAD>
<%
String sMes = String.valueOf(currUser.getE01RDM());
String sAno = String.valueOf(currUser.getE01RDY());
String sDia = String.valueOf(currUser.getE01RDD());

if(sMes.length() < 2){
	sMes = "0" + sMes;
}

if(sDia.length()< 2){
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
String FechaSistema = sAno + sMes + sDia;

%>

<% 
 if ( !error.getERRNUM().equals("0")  ) {
     error.setERRNUM("0");
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
 }
 String opt = ""; 
%>

<BODY onload="MM_preloadImages('<%=request.getContextPath()%>/images/s/approve_over.gif','<%=request.getContextPath()%>/images/s/reject_over.gif')">
<h3 align="center">Liberaci&oacute;n de Pagos</h3>
<hr size="4">
<FORM Method="post" name="form1" Action="<%=request.getContextPath()%>/servlet/datapro.eibs.approval.JSEPR1080A">
<INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="2">
<INPUT TYPE=HIDDEN NAME="action" VALUE="A">
<INPUT TYPE=HIDDEN NAME="reason" VALUE="">
<INPUT TYPE=HIDDEN NAME="appCode" VALUE="">
<INPUT TYPE=HIDDEN NAME="filcod" VALUE="T">
<INPUT TYPE=HIDDEN NAME="totalRow" VALUE="0">
<INPUT TYPE=HIDDEN NAME="WRGFL" VALUE="">
<INPUT TYPE=HIDDEN NAME="OFAFL" VALUE="">
<INPUT TYPE=HIDDEN NAME="Pos" VALUE="0">
<input type=HIDDEN name="TRANSREFNUM" value="">
<input type=HIDDEN name="approv" value="B">
<input type=HIDDEN name="fechasistema" value="<%=FechaSistema%>">
<input type=HIDDEN name="idxRow" value="0">
<INPUT TYPE=HIDDEN NAME="FIELD" VALUE=""> 
<INPUT TYPE=HIDDEN NAME="DAY"   VALUE=""> 
<INPUT TYPE=HIDDEN NAME="MONTH" VALUE=""> 
<INPUT TYPE=HIDDEN NAME="YEAR"  VALUE=""> 

<TABLE class="tbenter" width="100%" align=center>   
    <TR>
      <TD class=TDBKG width="25%"> 
        <div align="center"><a href="javascript:goAction('A')" id="linkApproval"><b>Aprobar</b></a></div>
      </TD>
    <TD class=TDBKG width="25%"> 
        <div align="center"><a href="javascript:javascript:goMsgSwift()" id="linkSwift"><b>Msg SWIFT</b></a></div>
      </TD>
      <TD class=TDBKG width="25%"> 
        <div align="center"><a href="javascript:enterReason('R')" id="linkReject"><b>Rechazar</b></a></div>
      </TD>
      <TD class=TDBKG width="25%"> 
        <div align="center"><a href="javascript:goExit()" id="linkExit"><b>Salir</b></a></div>
      </TD>
    </TR>
  </TABLE>
  
  <table  id="mainTable" class="tableinfo">
    <tr > 
      <td NOWRAP valign="top" width="100%" > 

    <table id="headTable" style="width: 100%">
  	<TR id="trdark"> 
      		<TH ALIGN=CENTER NOWRAP></TH>
            <TH ALIGN=CENTER NOWRAP><a href="javascript:ordena('E01PRINUM')">Referencia</a>
               	<table border="0">
		    		<tr id="trdark">
		    			<td nowrap>
					    	<input type="text" size="6" name="ACCNUM1"  >
					    </td>
					    <td>
					    	<a href="javascript:lookAcc()"><img src="<%=request.getContextPath()%>/images/1b.gif" title=". . ." align="bottom" border="0"></a>
					    </td>
					</tr>
		    	</table>
            </TH>
            <TH ALIGN=CENTER NOWRAP><a href="javascript:ordena('E01PRITHF')">Referencia<BR>Original</a></TH>             
            <TH ALIGN=CENTER NOWRAP><a href="javascript:ordena('E01PRICCY')">Mda</a></TH>
            <TH ALIGN=CENTER NOWRAP><a href="javascript:ordena('E01PRIAMT')">Monto</a></TH>
            <th align=CENTER NOWRAP><a href="javascript:ordena('E01PRIFMT')">Tipo de Mensaje</a></th>
            <th align=CENTER NOWRAP><a href="javascript:ordena('E01PRIPTY')">Pri</a></th>
            <th align=CENTER NOWRAP><a href="javascript:ordena('E01REMARK')">Estado</a></th>  
            <TH ALIGN=CENTER NOWRAP><a href="javascript:ordena('E01PRICDD','E01PRICDM','E01PRICDY')">Fecha<br>Valor</a></TH>  
			<th align=CENTER NOWRAP><a href="javascript:ordenaFecha('E01PRIDPT')">Area</a></th>                        
    </TR>
    <TR id="trdark"> 
      		<TH ALIGN=CENTER NOWRAP height="2"></TH>
            <TH ALIGN=CENTER NOWRAP height="2"></TH>
            <TH ALIGN=CENTER NOWRAP height="2"></TH>             
            <TH ALIGN=CENTER NOWRAP height="2"></TH>
            <TH ALIGN=CENTER NOWRAP height="2"></TH>
            <th align=CENTER NOWRAP height="2"></th>
            <th align=CENTER NOWRAP height="2"></th>
            <th align=CENTER NOWRAP height="2"></th>  
			<th align=CENTER NOWRAP height="2"></th>  
			<th align=CENTER NOWRAP height="2"></th>  
    </TR>
    </TABLE>
    
        <div id="dataDiv1" class="scbarcolor"> 
          <table id="dataTable">
		<%int indexRow=0;
		  int i=0;
			String sMes2 = "";
			String sAno2 = "";
			String sDia2 = "";
	
			String marker = "";
			String myFlag = "";
			StringBuffer myRow = null;
			String chk = "";
			String warnImg= "";
			String txtAlt="";
			String warnFlag= "";
			String msgImg="";
			String ofacImg = "";
			String ofacFlag = "";

		  for (indexRow = lista.getBaseIdx(); indexRow < lista.getSize() && indexRow < lista.getBaseIdx() + lista.getDisplaySize(); indexRow++) { 
			EPR012001Message msgList = (EPR012001Message)lista.getData(indexRow);
			
			//if (indexRow == 0) chk = "checked";	else chk = "";
			
			if (msgList.getH01FLGWK2().trim().equals("A")) {
				warnImg= "<IMG border=\"0\" src=\""+request.getContextPath()+"/images/warning01.gif\" title=\""+txtAlt+"\" onClick=\"showWarnings('" + msgList.getE01PRINUM() + "','PRINUM')\">";
				warnFlag = msgList.getH01FLGWK2().trim();
			}else{
				warnImg= "";
				warnFlag = "";
			}

	        if (msgList.getH01FLGWK3().trim().equals("3")) {
				ofacImg= "<IMG border=\"0\" src=\""+request.getContextPath()+"/images/warning_16.jpg\" title=\"OFAC Match List\" onClick=\"showOfac('" + msgList.getE01PRINUM() + "')\">";
				ofacFlag = msgList.getH01FLGWK3().trim();
			}else{
				ofacImg= "";
				ofacFlag = "";
			}

			if (!Approv.equals("A") && !Approv.equals("B")){
				if (!msgList.getE01MSGTXT().trim().equals("")) {
					msgImg= "<IMG border=\"0\" src=\""+request.getContextPath()+"/images/ico1.gif\" title=\"TRX con observación\" onClick=\"viewMessage('" + indexRow + "')\">";
				}else{
					msgImg= "";
				}
			}


			if (Approv.equals("A") || Approv.equals("B")){
				warnImg= "";
			}	

			sMes2 = msgList.getE01PRICDM();
			sAno2 = msgList.getE01PRICDY();
			sDia2 = msgList.getE01PRICDD();

			if( sMes2.length() < 2){
				sMes2 = "0" + sMes2;
			}

			if(sDia2.length() < 2){
				sDia2= "0" + sDia2;
			}
			if(sAno2.length() < 2){
				sAno2= "0" + sAno2;
			}

			switch (sAno2.length()) 
			{
				case 1 : sAno2 = "000" + sAno2;break;
				case 2 : 
						if (Integer.parseInt(sAno2) < 52)
							sAno2 = "20" + sAno2;
						else
							sAno2 = "19" + sAno2;
				break;
				case 3 : sAno2 = "0"   + sAno2;break;
			}
					
			
			%>

					<TR>
					<TD NOWRAP>
						<INPUT TYPE=HIDDEN NAME="TXTMESSAGE<%=indexRow%>" VALUE="<%=msgList.getE01MSGTXT()%>">
						<INPUT TYPE=HIDDEN NAME="fecha<%=indexRow%>" VALUE="<%=sAno2%><%=sMes2%><%=sDia2%>">
						<input type="radio" name="REFNUM" value="<%=msgList.getE01PRINUM()%>" <%=chk%> onclick="showAddInfo('<%=msgList.getE01PRINUM()%>',<%=i%>,'<%=warnFlag%>','<%=ofacFlag%>')">
					</TD>
					<TD NOWRAP ALIGN="LEFT"><A HREF="javascript:showInqApprovalPR('<%= msgList.getE01PRINUM()%>')"><%= Util.formatCell(msgList.getE01PRINUM())%></A><%=warnImg+ofacImg+msgImg%></TD>
					<TD NOWRAP ALIGN="CENTER"><A HREF="javascript:showInqApprovalPR('<%= msgList.getE01PRINUM()%>')"><%= Util.formatCell(msgList.getE01PRITHF())%></A></TD>
					<TD NOWRAP ALIGN="CENTER"><A HREF="javascript:showInqApprovalPR('<%= msgList.getE01PRINUM()%>')"><%= Util.formatCell(msgList.getE01PRICCY())%></A></TD>
					<TD NOWRAP ALIGN="RIGHT"><A HREF="javascript:showInqApprovalPR('<%= msgList.getE01PRINUM()%>')"><%= Util.fcolorCCY(msgList.getE01PRIAMT())%></A></TD>
					<TD NOWRAP ALIGN="CENTER"><A HREF="javascript:showInqApprovalPR('<%=msgList.getE01PRINUM()%>')"><%= Util.formatCell(msgList.getE01PRIFMT())%></A></TD>
					<TD NOWRAP ALIGN="CENTER"><A HREF="javascript:showInqApprovalPR('<%=msgList.getE01PRINUM()%>')"><%= Util.formatCell(msgList.getE01PRIPTY())%></A></TD>
					<TD NOWRAP ALIGN="LEFT"><A HREF="javascript:showInqApprovalPR('<%=msgList.getE01PRINUM()%>')"><%= Util.formatCell(msgList.getE01REMARK())%></A></td>
					<TD NOWRAP ALIGN="CENTER"><A HREF="javascript:showInqApprovalPR('<%=msgList.getE01PRINUM()%>')"><%= Util.formatDate(msgList.getE01PRICDD(),msgList.getE01PRICDM(),msgList.getE01PRICDY())%></A></TD>
					<TD NOWRAP ALIGN="CENTER"><A HREF="javascript:showInqApprovalPR('<%=msgList.getE01PRINUM()%>')"><%= Util.formatCell(msgList.getE01PRIDPT())%></A>
					<INPUT TYPE=HIDDEN NAME="TXTDATA<%=i%>" VALUE="<%=Util.formatDate(msgList.getE01PRICDD(),msgList.getE01PRICDM(),msgList.getE01PRICDY())%><br>
					<%=Util.formatCell(msgList.getE01PRIOBN())%>/<%=Util.formatCell(msgList.getE01PRIOBR()) %><br><%=Util.formatCell(msgList.getE01BENFIC())%><br><%=Util.formatCell(msgList.getE01PRIRID())%><br>
					<%=Util.formatCell(msgList.getE01PRICNL())%><br><%=Util.formatCell(msgList.getE01PRIUSR())%>"></TD>
					</TR>
			<% i++;
			}%>
          </table>
        </div>
      </td>
      <td nowrap align="RIGHT" valign="top"> 
        <table id="tbAddInfoH" width="100%" >
          <tr id="trdark"> 
            <th align=CENTER nowrap >Informaci&oacute;n B&aacute;sica</th>
          </tr>
        </table>
        <table id="tbAddInfo" >
          <tr id="trclear" > 
            <td  align="RIGHT"  valign="middle" nowrap ><b>
              Fecha Valor : <br>
              Banco/Agencia : <br>
              Beneficiario : <br>
              Receptor : <br>
              Canal : <br>              
              Usuario : </b>
             </td>
            <td align="LEFT" valign="middle" nowrap class="tdaddinfo"></td>
          </tr>
        </table>
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
       divResize(true);
            	adjustEquTables(getElement('headTable'),getElement('dataTable'), getElement('dataDiv1'),1,false);
      }
	 //showChecked("REFNUM");
	 radioClick("REFNUM", 0);
     //resizeDoc();
     tbAddInfoH.rows[0].cells[0].height = headTable.rows[0].cells[0].clientHeight;
     window.onresize=resizeDoc;
     
</SCRIPT>  
<BR>



</FORM>

</BODY>
</HTML>
