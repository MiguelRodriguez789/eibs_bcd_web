<HTML>
<HEAD>
<TITLE>
Checks List
</TITLE>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/jquery/plugins/contextMenu/css/jquery.contextMenu.css" rel="stylesheet" type="text/css" />

<jsp:useBean id= "itemList" class= "datapro.eibs.beans.JBListRec"  scope="session" />
<jsp:useBean id= "reqList" class= "datapro.eibs.beans.JBListRec"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "dataNAV" class= "datapro.eibs.beans.DataNav"  scope="session" />

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>


<script type="text/javascript">

function closeDivs() {
	setVisibility(getElement("hiddenDivSearch"), "hidden");
	setVisibility(getElement("hiddenDivComments"), "hidden");
}

function showHiddenDivSearch(evt) {
	evt = (evt) ? evt : ((window.event) ? window.event : "");
 	
	var hiddenDivSearch = getElement("hiddenDivSearch");

	var y=evt.clientY + document.body.scrollTop - hiddenDivSearch.clientHeight;
	var x=evt.clientX + document.body.scrollLeft;
     
	cancelBub(evt);

	moveElement(hiddenDivSearch, y, x);
	setVisibility(hiddenDivSearch, "visible");
	 
	document.forms[0].BRANCH.focus();
}

function OkComments(){
	var idxacc =document.forms[0].ActAccRow.value;
	var idxchk =document.forms[0].ActChkRow.value;
	var dataT = getElement("dataTable"+idxacc);
	getElement("REMDATA"+idxacc+""+idxchk).value = trim(document.forms[0].txtComments.value);
	if (getElement("REMDATA"+idxacc+""+idxchk).value == ""){
	  getElementByNameAndId("IMGREM", ""+idxacc+""+idxchk).style.display="none";
    } else {
	  getElementByNameAndId("IMGREM", ""+idxacc+""+idxchk).style.display="";
	}
	adjustEquTables(
		getElement("headTable2"),
		getElement("dataT"),
		getElement("dataDiv2"), 1,false);
	
	setVisibility(getElement("hiddenDivComments"), "hidden");
}

function addComments() {
	var idxacc =document.forms[0].ActAccRow.value;
	var idxchk =document.forms[0].ActChkRow.value;	
	 
	var hiddenDivComments = getElement("hiddenDivComments");
	var mainTable2 = getElement("mainTable2");

	var y= mainTable2.offsetTop + 10;
    var x= mainTable2.offsetLeft  + (hiddenDivComments.clientWidth /2);
	 
	moveElement(hiddenDivComments, y, x);
	setVisibility(hiddenDivComments, "visible");
    
    document.forms[0].txtComments.value=getElement("REMDATA"+idxacc+""+idxchk).value;
	document.forms[0].txtComments.focus();
}

function ShowComments(idxacc,idxchk) {
	var hiddenDivComments = getElement("hiddenDivComments");
	
	var y=event.clientY + document.body.scrollTop - hiddenDivComments.clientHeight;
    var x=event.clientX + document.body.scrollLeft - 1;
	document.getElementsByName("RECNUM"+idxacc)[idxchk].click();
	 
	cancelBub(evt);
	
	moveElement(hiddenDivComments, y, x);
	setVisibility(hiddenDivComments, "visible");
     
    document.forms[0].txtComments.value=getElement("REMDATA"+idxacc+""+idxchk).value;
	document.forms[0].txtComments.focus();
}

function goAction(op) {
     var form = document.forms[0];
     var formLength= document.forms[0].elements.length;
     var ok = false;
     var num = "";
     var pg = "";
	
	num = form["ActAccRow"].value;
	switch (op) {
		
		case 1 :  // Summary
			pg = "<%=request.getContextPath()%>/servlet/datapro.eibs.approval.JSEDD0924?SCREEN=6&ACCNUM=" + form["CURACC_"+num].value;
			CenterWindow(pg,620,500,2);
			break;
		case 2 :  // Exceptions
		  	pg = "<%=request.getContextPath()%>/servlet/datapro.eibs.platform.JSEPV0140?SCREEN=5&ACCNUM=" + form["CURACC_"+num].value;
			CenterWindow(pg,600,400,2);
			break;
		case 3 :  // Notes
		  	pg = "<%=request.getContextPath()%>/servlet/datapro.eibs.platform.JSEPV0140?SCREEN=7&ACCNUM=" + form["CURACC_"+num].value;
			CenterWindow(pg,550,350,2);
			break;
	}
}

function showACC(){
 document.forms[0].FlagMov.value="0";
 document.forms[0].submit();
}

addEventHandler(document, 'click', closeDivs);

</script>

<script type="text/javascript">

function showAccInfo(idxRow){
  var i= parseInt(document.forms[0].ActAccRow.value);
  var dataT = getElement("dataTable"+idxRow);
  tbAddInfo.rows[0].cells[1].style.color="white";
  tbAddInfo.rows[0].cells[1].innerHTML=getElement("LNCRDATA"+idxRow).value;
  //tbAddInfo.rows[0].cells[1].filters[0].apply();
  tbAddInfo.rows[0].cells[1].style.color="";
  //tbAddInfo.rows[0].cells[1].filters[0].Play();
  getElement("dataTable"+i).style.display="none";
  getElement("dataTable"+idxRow).style.display="";
  getElement("dataTable").rows[i].className="trnormal";
  getElement("dataTable").rows[idxRow].className="trhighlight";
  adjustEquTables(
  	getElement("headTable1"), 
  	getElement("dataTable"), 
  	getElement("dataDiv1"), 1,false);
  adjustEquTables(
  	getElement("headTable2"),
  	getElement("dataT"),
  	getElement("dataDiv2"),1,false);
  showChecked("RECNUM"+idxRow);
  document.forms[0].ActAccRow.value=""+idxRow;
}    

function showChkInfo(idxTable,idxRow,idxAbsRow){
  var i= parseInt(document.forms[0].ActChkRow.value);
  if (document.forms[0].ActAccRow.value == idxTable) {
  getElement("dataTable"+idxTable).rows[i].className="trnormal";}
  getElement("dataTable"+idxTable).rows[idxRow].className="trhighlight";
  document.forms[0].ActChkRow.value=""+idxRow;
  document.forms[0].ActRow.value=""+idxAbsRow;
}

function GetInfo(currentrow){
  var form = document.forms[0];
  var maxrow = getElement("dataTable"+currentrow).rows.length;
  var optAcc = form["OPTION_"+currentrow];

  for(var n=0;n<maxrow;n++) {
   var optChk = form["OPTION_"+currentrow+""+n];
   var maxopt = optChk.length;    
   for(var i=0;i<maxopt;i++) {
    if (optChk[i].value == optAcc[optAcc.selectedIndex].value) {
     optChk.selectedIndex = i;}
   }
  }
  if (optAcc[optAcc.selectedIndex].value == "T") {GetTRFInfo(""+currentrow,"-"+maxrow);}
}

function GetTRFInfo(accIdx,selIdx){
  var form = document.forms[0];
  if (parseInt(selIdx) < 0) {
	var ofr = "";
	var cau = "";
	var Params = "?AccIdx="+ accIdx + "&SelIdx=" + selIdx + "&Ofr=" + ofr + "&Causal=" + cau;
	page= "${pageContext.request.contextPath}/pages/s/EPV0140_transfer_change.jsp" + Params; 
	CenterWindow(page, 510, 400, 3);
  } else if (form["OPTION_"+accIdx+selIdx].value == "T") {
	var ofr = form["TRFUSR"+accIdx+selIdx].value;
	var cau = form["MSGTXT"+accIdx+selIdx].value;
	var Params = "?AccIdx="+ accIdx + "&SelIdx=" + selIdx + "&Ofr=" + ofr + "&Causal=" + cau;
	page= "${pageContext.request.contextPath}/pages/s/EPV0140_transfer_change.jsp" + Params; 
	CenterWindow(page, 510, 400, 3);
  }  
}

function SendInfo(){
  document.forms[0].FlagMov.value="1";
  document.forms[0].submit();
}

function ShowPrev(){
  document.forms[0].FlagMov.value="-";
  document.forms[0].submit();
}

function ShowNext(){
  document.forms[0].FlagMov.value="+";
  document.forms[0].submit();
}
</script>

</HEAD>

<BODY>

<% 
 if ( !error.getERRNUM().equals("0")  ) {
      error.setERRNUM("0");
 %> 
<SCRIPT type="text/javascript">
      showErrors();
</SCRIPT>
 <%
 }
%>

<h3 align="center">Aprobación de Comité</h3>
<hr size="4">
<FORM Method="post" Action="<%=request.getContextPath()%>/servlet/datapro.eibs.platform.JSEPV0140">
<INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="2">
<INPUT TYPE=HIDDEN NAME="ActRow" VALUE="0">
<INPUT TYPE=HIDDEN NAME="ActAccRow" VALUE="0">
<INPUT TYPE=HIDDEN NAME="ActChkRow" VALUE="0">
<INPUT TYPE=HIDDEN NAME="FlagMov" VALUE="0">
 <h4 id="eibsSearch" style="text-align:center"> 
 	<a name="linkSA" href="javascript:">Oficina</a> : 
 		<%// if ( dataNAV.getOfficer().trim().equals("")) {out.print("Todas");} else {out.print(dataNAV.getOfficer());} %>
  </h4> 
<div id="hiddenDivSearch" class="hiddenDiv">
 <TABLE id=tbhelp style="border-top-width : 1px;border-right-width : 1px;border-bottom-width : 1px;border-left-width : 1px;
	border-color: #0b23b5;
	border-style : solid solid solid solid;
	filter:progid:DXImageTransform.Microsoft.dropshadow(OffX=3, OffY=3, Color='gray', Positive='true');">
	<TR>
	  <TD ALIGN=right nowrap>
          Buscar Oficina : 
          <input type="text" maxlength=3 size=4 name="BRANCH" onKeyPress="enterInteger(event)"
           class="context-menu-help" onmousedown="init(branchHelp,this.name,'','','','','')">
      </TD>
      <TD ALIGN=Left nowrap>
	     <a href="javascript:showACC()"><img name="Image1" border="0" src="<%=request.getContextPath()%>/images/search1.gif"></a> 
	  </TD>
   </TR>
 </TABLE>
</div>
<div id="hiddenDivComments" class="hiddenDiv">
 <TABLE id=tbhelp style="border-top-width : 1px;border-right-width : 1px;border-bottom-width : 1px;border-left-width : 1px;
	border-color: #0b23b5;
	border-style : solid solid solid solid;
	filter:progid:DXImageTransform.Microsoft.dropshadow(OffX=3, OffY=3, Color='gray', Positive='true');">
	<TR>
	  <TD ALIGN=Left nowrap>
          Comments :<BR> 
          <input type="text" maxlength=61 size=60 name="txtComments">
      </TD>
    </TR>
    <TR>
      <TD ALIGN=Center nowrap>
	     <a href="javascript:OkComments()">Ok</a> 
	  </TD>
   </TR>
 </TABLE>
</div>
<%
	if ( reqList.getNoResult() ) {
 %>
   		<TABLE class="tbenter" width=100% height=90%>
   		<TR>
      <TD> 
        
      <div align="center">
      <div align="center"> <font size="3"><b> No hay resultado que corresponda a su criterio de búsqueda. 
        </b></font></div>
      </div>
      </TD></TR>
   		</TABLE>
<%   		
	}
	else {
%>
  
  <TABLE class="tbenter" width="100%">
    <TR>
      <TD CLASS="TDBKG" ALIGN=CENTER > <a href="javascript:goAction(1)" >Sumario</a> 
      </TD>
      <TD CLASS="TDBKG" ALIGN=CENTER > <a href="javascript:goAction(2)">Excepciones</a> 
      </TD>
      <TD CLASS="TDBKG" ALIGN=CENTER > <a href="javascript:goAction(3)">Observaciones</a> 
      </TD>
      <TD CLASS="TDBKG" ALIGN=CENTER > <a href="<%=request.getContextPath()%>/pages/background.jsp" >Salir</a></TD>    
    </TR>
  </TABLE>
        
  
  <TABLE  id="mainTable" class="tableinfo" ALIGN=CENTER width="100%">
    <TR> 
      <TD NOWRAP valign="top" width="100%"> 
        <TABLE id="headTable1" >
          <TR id="trdark"> 
            <TH ALIGN=CENTER NOWRAP>Acción</TH>
            <TH ALIGN=CENTER NOWRAP>Número</TH>
            <TH ALIGN=CENTER NOWRAP>RUT</TH>
            <TH ALIGN=CENTER NOWRAP>Nombre</TH>
            <TH ALIGN=CENTER NOWRAP>Riesgo</TH>
          </TR>
        </TABLE>
  
   <div id="dataDiv1" class="scbarcolor">
    	<table id="dataTable">
  <%
                reqList.initRow();
                while (reqList.getNextRow()) {
                    if (!reqList.getFlag().equals("")) {	
  %> 
     		<TR> 
      			
                <TD ALIGN=Center NOWRAP>
            <div > 
                <input type="radio" name="RECNUM" value="<%= reqList.getCurrentRow() %>" onClick="showAccInfo('<%= reqList.getCurrentRow() %>')">
                <select name="OPTION_<%= reqList.getCurrentRow() %>"  onChange="GetInfo('<%= reqList.getCurrentRow() %>')" onClick="if (getElement('dataTable').rows.length > 1) {
	      			document.forms[0].RECNUM[<%= reqList.getCurrentRow() %>].click();
    				 } else {
       	  			document.forms[0].RECNUM.click();
     			}">
              <OPTION value="" <% if (reqList.getRecord(17).equals("")) out.print("selected"); %>></OPTION>
              <OPTION value="A" <% if (reqList.getRecord(17).equals("A")) out.print("selected"); %>>Aprueba</OPTION>
              <OPTION value="R" <% if (reqList.getRecord(17).equals("R")) out.print("selected"); %>>Rechaza</OPTION>
			  <OPTION value="T" <% if (reqList.getRecord(17).equals("T")) out.print("selected"); %>>Transfiere</OPTION>
            </select>
				<INPUT TYPE=HIDDEN NAME="LNCRDATA<%= reqList.getCurrentRow()%>" 
				VALUE="<%= datapro.eibs.master.Util.formatDate(reqList.getRecord(6),reqList.getRecord(7),reqList.getRecord(8)) %><BR>
				<%= reqList.getRecord(9)  %><BR>
				<%= reqList.getRecord(10) %>">
                <input type="HIDDEN" name="CURACC_<%= reqList.getCurrentRow() %>" value="<%= reqList.getRecord(0) %>">
				</DIV>
            </TD>
      			<TD ALIGN=CENTER NOWRAP><a href="javascript:document.forms[0].RECNUM[<%= reqList.getCurrentRow() %>].click()"><%= reqList.getRecord(0) %></a></TD>
      			<TD ALIGN=LEFT NOWRAP>
            <div ><a href="javascript:document.forms[0].RECNUM[<%= reqList.getCurrentRow() %>].click()"><%= datapro.eibs.master.Util.formatCell(reqList.getRecord(1)) %></a></DIV>
            </TD>      
      			<TD ALIGN=RIGHT NOWRAP><a href="javascript:document.forms[0].RECNUM[<%= reqList.getCurrentRow() %>].click()"><%= datapro.eibs.master.Util.formatCell(reqList.getRecord(4)) %></a></TD>
      			<TD ALIGN=RIGHT NOWRAP><a href="javascript:document.forms[0].RECNUM[<%= reqList.getCurrentRow() %>].click()"><%= datapro.eibs.master.Util.fcolorCCY(reqList.getRecord(5)) %></a></TD>
     		</TR>
  <% 
                    }
                }
  %>
 	</table>
   </div>
   </TD>
   <TD nowrap ALIGN="RIGHT" valign="top">
      <Table id="tbAddInfoH" width="100%" >
        <tr id="trdark">
         <TH ALIGN=CENTER nowrap >Información Adicional </TH>
        </tr>
      </Table>

     <Table id="tbAddInfo" >
      <tr id="trclear" >
            <TD  ALIGN="RIGHT"  align="center" nowrap >
              <p><b>Fecha. : <br>
                    Código Ejecutivo. :<br>
		      Nombre Ejecutivo. : <br> 
  	       </b></p>
            </TD>
         <TD ALIGN="RIGHT" align="center" nowrap class="tdaddinfo"></TD>
      </tr>
     </Table>
  </TD>
  </TR>	
</TABLE>

<TABLE class="tbenter" WIDTH="98%" ALIGN=CENTER>
  <TR>
  <TD WIDTH="25%" ALIGN=LEFT>
<%
        if ( reqList.getShowPrev() ) {
				out.println("<A HREF=\"javascript:ShowPrev()\"><IMG border=\"0\" src=\""+request.getContextPath()+"/images/s/previous_records.gif\" ></A>");
        }
  %>  
  </TD>
  <TD CLASS="TDBKG" ALIGN=CENTER > <a href="javascript:addComments()"  >Comentarios</a></TD>
  <TD WIDTH="25%" ALIGN=RIGHT>     
 <%      
        if ( reqList.getShowNext() ) {
      			out.println("<A HREF=\"javascript:ShowNext()\"><IMG border=\"0\" src=\""+request.getContextPath()+"/images/s/next_records.gif\" ></A>");
        }
   %> 
   </TD>
 	</TR>
 	</TABLE>
  
  <TABLE  id="mainTable2" class="tableinfo" ALIGN=CENTER width="100%">
    <TR> 
      <TD NOWRAP valign="top" width="100%" > 
        <TABLE id="headTable2" >
     		<TR id="trdark"> 
      			<TH ALIGN=CENTER NOWRAP>Acción</TH>
			<TH ALIGN=CENTER NOWRAP>Producto</TH>
      			<TH ALIGN=CENTER NOWRAP>Solicitado</TH>
      			<TH ALIGN=CENTER NOWRAP>Vendido</TH>
			<TH ALIGN=CENTER NOWRAP>Plazo</TH>
      			<TH ALIGN=CENTER NOWRAP>Tasa</TH> 
      			<TH ALIGN=CENTER NOWRAP>Cuota</TH>     
      			
     		</TR>
    	 </TABLE>
  
   <div id="dataDiv2" class="scbarcolor">
    <%
             reqList.initRow();
             int j=0;
			 
             int accChecked = 0;
			 boolean firstime = true;
			 String chk = "";
			 String acc = "";
			 int recnum = 0;
		  	 try { recnum = Integer.parseInt(request.getParameter("ROW")); } catch (Exception e) {};
			 itemList.setCurrentRow(recnum);
			 acc = itemList.getRecord(0);		
              while (reqList.getNextRow()) {
    %> 
   <table id="dataTable<%=j%>" class="scbarcolor" style="display:none;">
  <%
          	    itemList.initRow();
			    int k = 0;
				firstime = true;
                while (itemList.getNextRow()) {
                    if (itemList.getFlag().equals(reqList.getFlag())) {
						if (acc.equals(reqList.getRecord(0))) {
							accChecked = j;
						  	chk = (itemList.getCurrentRow()== recnum)?"checked":""; 
						}else {
							chk = (firstime)?"checked":"";
						}
						firstime = false;	
  %> 
     		<TR>       			
            <TD ALIGN=Left NOWRAP>
            <DIV align="Left" > 
                <INPUT type="radio" name="RECNUM<%=j%>" value="<%= itemList.getCurrentRow() %>" <%=chk%> onclick="showChkInfo('<%=j%>','<%=k%>','<%= itemList.getCurrentRow() %>')">
                <SELECT name="OPTION_<%=j%><%=k%>" onChange="GetTRFInfo('<%=j%>','<%=k%>')">
	              <OPTION value="" <% if (itemList.getRecord(17).equals("")) out.print("selected"); %>></OPTION>
	              <OPTION value="A" <% if (itemList.getRecord(17).equals("0002")) out.print("selected"); %>>Aprueba</OPTION>
	              <OPTION value="R" <% if (itemList.getRecord(17).equals("0003")) out.print("selected"); %>>Rechaza</OPTION>
				  <OPTION value="T" <% if (itemList.getRecord(17).equals("0004")) out.print("selected"); %>>Transfiere</OPTION>
            	</SELECT>
				<INPUT TYPE=HIDDEN NAME="REMDATA<%=j%><%=k%>" VALUE="<%= itemList.getRecord(22) %>">
				<INPUT TYPE=HIDDEN NAME="TRFUSR<%=j%><%=k%>" VALUE="">
				<INPUT TYPE=HIDDEN NAME="MSGTXT<%=j%><%=k%>" VALUE="">
				<IMG id="<%=j%><%=k%>" name="IMGREM" src="<%=request.getContextPath()%>/images/s/info.gif" title="Note de Rechazo" align="middle" border="0" 
					<% if (itemList.getRecord(22) == null || itemList.getRecord(22).trim().equals("")) out.print("style=\"display:none;\""); %>>
			</DIV>
            </TD>
      			<TD ALIGN=CENTER NOWRAP><a href="javascript:document.forms[0].RECNUM<%=j%>[<%= k %>].click()"><%= itemList.getRecord(0) %> - <%= itemList.getRecord(1) %></a></TD>
      			<TD ALIGN=RIGHT NOWRAP><a href="javascript:document.forms[0].RECNUM<%=j%>[<%= k %>].click()"><%= datapro.eibs.master.Util.fcolorCCY(itemList.getRecord(2)) %></a></TD>      
      			<TD ALIGN=RIGHT NOWRAP><a href="javascript:document.forms[0].RECNUM<%=j%>[<%= k %>].click()"><%= datapro.eibs.master.Util.fcolorCCY(itemList.getRecord(3)) %></a></TD>      
      			<TD ALIGN=CENTER NOWRAP><a href="javascript:document.forms[0].RECNUM<%=j%>[<%= k %>].click()"><%= itemList.getRecord(4) %> - <%= itemList.getRecord(5) %></a></TD>
      			<TD ALIGN=LEFT NOWRAP><a href="javascript:document.forms[0].RECNUM<%=j%>[<%= k %>].click()"><%= itemList.getRecord(6) %></a></TD>
      			<TD ALIGN=CENTER NOWRAP><a href="javascript:document.forms[0].RECNUM<%=j%>[<%= k %>].click()"><%= datapro.eibs.master.Util.fcolorCCY(itemList.getRecord(7))%></a></TD>
     		</TR>
  <% 
						k++;
                    }		
                }
  %>
 	</table>
  <%  
               j++;      
            }
   %>
   </div>
  </TR>	
</TABLE>

<SCRIPT type="text/javascript">
     
	 function resizeDoc() {
      var actvTb = document.forms[0].ActAccRow.value;
      var dataT = getElement("dataTable"+actvTb);
       adjustEquTables(
       	getElement("headTable1"),
		getElement("dataTable"),
		getElement("dataDiv1"), 1, false);
       adjustEquTables(
		getElement("headTable2"),
		getElement("dataT"),
		getElement("dataDiv2"), 1, false);
      }
	applyTrans(getElement("hiddenDivSearch"));
	applyTrans(getElement("hiddenDivComments"));
	
	 if (getElement("dataTable").rows.length > 1) {
	      document.forms[0].RECNUM[<%= accChecked %>].click();
     } else {
       	  document.forms[0].RECNUM.click();
     }
     resizeDoc();
     window.onresize=resizeDoc;
	 getElement("tbAddInfoH").rows[0].cells[0].height = getElement("headTable1").rows[0].cells[0].clientHeight;
	 
	function setComments(){
	    var list = document.getElementsByName("IMGREM");
	    if (! list)
	        return;
	    for (var i = 0; i < list.length; ++i)
	        if (!list[i].onclick) list[i].onclick = showHiddenCommentsDiv;
	}
	setComments();
	 
</SCRIPT>
  <div align="center"> 
    <input id="EIBSBTN" type=button name="Submit" OnClick="SendInfo()" value="Enviar">
  </div>

<%           
  }
%>

<SCRIPT type="text/javascript">
 	getElement("hiddenDivSearch").onclick=cancelBub;
	getElement("eibsSearch").onclick=showHiddenDivSearch;
	
 	getElement("hiddenDivComments").onclick=cancelBub;
	 
</SCRIPT>
</FORM>

</BODY>
</HTML>
