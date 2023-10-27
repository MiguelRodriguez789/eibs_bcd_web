<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
<HEAD>
<TITLE>
Cheques Sobregirados
</TITLE>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/jquery/plugins/contextMenu/css/jquery.contextMenu.css" rel="stylesheet" type="text/css" />

<jsp:useBean id= "chkList" class= "datapro.eibs.beans.JBListRec"  scope="session" />
<jsp:useBean id= "accList" class= "datapro.eibs.beans.JBListRec"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "dataCR" class= "datapro.eibs.beans.DataCheckReject"  scope="session" />

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>
<script src="<%=request.getContextPath()%>/pages/s/javascripts/jquery.jsp"> </script>

<script language="javascript">

function closeSearch(){
	setVisibility(schACC, "hidden");
}

function hideComments(){
	setVisibility(Comments, "hidden");
}

function closeDivs() {
  closeSearch();
  hideComments();
}

function cancelBub(){
  event.cancelBubble = true;
}

function ShowSearchAcc() {	 
	 var y=event.clientY + document.body.scrollTop - schACC.clientHeight;
     var x=event.clientX + document.body.scrollLeft - 1;
	 cancelBub();
	 eval('schACC.style.pixelTop=' + y);
     eval('schACC.style.pixelLeft=' + x);
	 setVisibility(schACC, "visible");
	 document.forms[0].ACCNUM.focus();
}

function OkComments(){
	var idxacc =document.forms[0].ActAccRow.value;
	var idxchk =document.forms[0].ActChkRow.value;
	var dataT = document.all["dataTable"+idxacc];
	document.forms[0]["REMDATA"+idxacc+""+idxchk].value = trim(document.forms[0].txtComments.value);
	if (document.forms[0]["REMDATA"+idxacc+""+idxchk].value == ""){
	  document.images["IMGREM"+idxacc+""+idxchk].style.display="none";
    } else {
      document.images["IMGREM"+idxacc+""+idxchk].style.display="";
	}
	adjustEquTables(headTable2, dataT, dataDiv2,1,false);
    setVisibility(Comments, "hidden");
}

function addComments() {
	 var idxacc =document.forms[0].ActAccRow.value;
	 var idxchk =document.forms[0].ActChkRow.value;	 
	 var y= mainTable2.offsetTop + 10;
     var x= mainTable2.offsetLeft  + (Comments.clientWidth /2);
	 
	 eval('Comments.style.pixelTop=' + y );
     eval('Comments.style.pixelLeft=' + x);
     setVisibility(Comments, "visible");
     document.forms[0].txtComments.value=document.forms[0]["REMDATA"+idxacc+""+idxchk].value;
	 document.forms[0].txtComments.focus();
}

function ShowComments(idxacc,idxchk) {	 
	 var y=event.clientY + document.body.scrollTop - Comments.clientHeight;
     var x=event.clientX + document.body.scrollLeft - 1;
	 document.forms[0]["RECNUM"+idxacc][idxchk].click();
	 cancelBub();
	 eval('Comments.style.pixelTop=' + y);
     eval('Comments.style.pixelLeft=' + x);
     setVisibility(Comments, "visible");
     document.forms[0].txtComments.value=document.forms[0]["REMDATA"+idxacc+""+idxchk].value;
	 document.forms[0].txtComments.focus();
}

function goAction(op) {
     var form = document.forms[0];
     var formLength= document.forms[0].elements.length;
     var ok = false;
     var num = "";
     var num1 = "";
     var pg = "";
	
     //for(var n=0;n<formLength;n++) {
     // 	var elementName= document.forms[0].elements[n].name;
     // 	if(elementName == "RECNUM") {
	//	if (document.forms[0].elements[n].checked == true) {
			num = form["ActAccRow"].value;
        		ok = true;
        	num1 = form["ActChkRow"].value;
        		ok = true;
        		
    //    		break;
	//	}
    //  	}
    //  }

<%-- alert(addLeftChar("0","8",form["CURCHK"+num+""+num1].value) + addLeftChar("0","20",form["FULACC_"+num].value)); --%>

    
      if ( ok ) {
	switch (op) {
		
		case 1 :  // Account Sumary Inquiry
			pg = "<%=request.getContextPath()%>/servlet/datapro.eibs.approval.JSEDD0924?SCREEN=6&ACCNUM=" + form["CURACC_"+num].value;
			break;
		case 2 :  // Account Inquiry
		  	pg = "<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSECIF010?SCREEN=400&opt=1&ACCNUM=" + form["CURACC_"+num].value;
			break;
		case 3 :  // Account Statement
		  	pg = "<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSECIF010?SCREEN=400&opt=2&ACCNUM=" + form["CURACC_"+num].value;
			break;
		case 4 :  // Account Average
		  	pg = "<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSECIF010?SCREEN=400&opt=3&ACCNUM=" + form["CURACC_"+num].value;
			break;
		case 5 :  // Signature Image Inquiry
			//VisorControl.ShowWin(addLeftChar("0","10",form["CURACC_"+num].value), '');		
		    break;
		
		case 6 :  // Check Image Inquiry
			//VisorEjecutivo.ShowWin(addLeftChar("0","8",form["CURCHK"+num+""+num1].value), addLeftChar("0","20",form["FULACC_"+num].value));
			break;
	}
	
		if (op < 5) 
		{
		CenterWindow(pg,620,500,2);
		}
      }
      else {
	alert("Favor seleccionar cuenta para continuar.");	   
      }

}

function showACC(){
//var acc = trim(document.forms[0].ACCNUM.value);
 document.forms[0].FlagMov.value="0";
 document.forms[0].submit();
}

document.onclick= closeDivs;

</script>

<script language="javascript">

function showAccInfo(idxRow){
  var i= parseInt(document.forms[0].ActAccRow.value);
  var dataT = document.all["dataTable"+idxRow];
  tbAddInfo.rows[0].cells[1].style.color="#d0122c";
  tbAddInfo.rows[0].cells[1].innerHTML=document.forms[0]["LNCRDATA"+idxRow].value;
  document.all["dataTable"+i].style.display="none";
  document.all["dataTable"+idxRow].style.display="";
  dataTable.rows[i].className="trnormal";
  dataTable.rows[idxRow].className="trhighlight";
  adjustEquTables(headTable1, dataTable, dataDiv1,1,false);
  adjustEquTables(headTable2, dataT, dataDiv2,1,false);
  showChecked("RECNUM"+idxRow);
  document.forms[0].ActAccRow.value=""+idxRow;
}    

function showChkInfo(idxTable,idxRow,idxAbsRow){
  var i= parseInt(document.forms[0].ActChkRow.value);
  if (document.forms[0].ActAccRow.value==idxTable) {
    document.all["dataTable"+idxTable].rows[i].className="trnormal";}
  document.all["dataTable"+idxTable].rows[idxRow].className="trhighlight";
  document.forms[0].ActChkRow.value=""+idxRow;
  document.forms[0].ActRow.value=""+idxAbsRow;
}

function GetInfo(currentrow){
  var form = document.forms[0];
  var maxrow = document.all["dataTable"+currentrow].rows.length;
  
  var optAcc = form["OPTION_"+currentrow];
  for(var n=0;n<maxrow;n++) {
   var optChk = form["OPTION_"+currentrow+""+n];
   var maxopt = optChk.length;    
   for(var i=0;i<maxopt;i++) {
    if (optChk[i].value == optAcc[optAcc.selectedIndex].value) {
     optChk.selectedIndex = i;}
   }
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
<SCRIPT Language="Javascript">

</SCRIPT>
<% 
 if ( !error.getERRNUM().equals("0")  ) {
      error.setERRNUM("0");
 %> 
<SCRIPT Language="Javascript">
      showErrors();
</SCRIPT>
 <%
 }
%>

<h3 align="center">Devoluci�n de Cheques<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="rejection_chk_nsf_list.jsp,EDD0924"></h3>
<hr size="4">
<FORM Method="post" Action="<%=request.getContextPath()%>/servlet/datapro.eibs.approval.JSEDD0924">
<INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="5">
<INPUT TYPE=HIDDEN NAME="ActRow" VALUE="0">
<INPUT TYPE=HIDDEN NAME="ActAccRow" VALUE="0">
<INPUT TYPE=HIDDEN NAME="ActChkRow" VALUE="0">
<INPUT TYPE=HIDDEN NAME="FlagMov" VALUE="0">
 <h4 style="text-align:center">Devoluci�n por Sobregiro de Cuentas -- Ejecutivo : <% if ( dataCR.getOfficer().trim().equals("")) {out.print("All");} else {out.print(dataCR.getOfficer());} %>
   </h4>
<div id="schACC" style="position:absolute; visibility:hidden; left:25px; top:-50px; z-index:3; filter:progid:DXImageTransform.Microsoft.Fade(duration=1.0,overlap=1.0)" onclick="cancelBub()">
 <TABLE id=tbhelp style="border-top-width : 1px;border-right-width : 1px;border-bottom-width : 1px;border-left-width : 1px;
	border-color: #0b23b5;
	border-style : solid solid solid solid;
	filter:progid:DXImageTransform.Microsoft.dropshadow(OffX=3, OffY=3, Color='gray', Positive='true');">
	<TR>
	  <TD ALIGN=right nowrap>
          Buscar Cuentas : 
          <input type="text" maxlength=13 size=12 name="ACCNUM" onKeyPress="enterInteger(event)"
			 class="context-menu-help" onmousedown="init(accountHelp,this.name,<%= dataCR.getBank() %>,'','','','RT')">  
	 </TD>
      <TD ALIGN=Left nowrap>
	     <a href="javascript:showACC()"><img name="Image1" border="0" src="<%=request.getContextPath()%>/images/search1.gif"></a> 
	  </TD>
   </TR>
 </TABLE>
</div>
<div id="Comments" style="position:absolute; visibility:hidden; left:25px; top:-100px; z-index:3; filter:progid:DXImageTransform.Microsoft.Fade(duration=1.0,overlap=1.0)" onclick="cancelBub()">
 <TABLE id=tbhelp style="border-top-width : 1px;border-right-width : 1px;border-bottom-width : 1px;border-left-width : 1px;
	border-color: #0b23b5;
	border-style : solid solid solid solid;
	filter:progid:DXImageTransform.Microsoft.dropshadow(OffX=3, OffY=3, Color='gray', Positive='true');">
	<TR>
	  <TD ALIGN=Left nowrap>
          Comentarios :<BR> 
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
	if ( accList.getNoResult() ) {
 %>
   		<TABLE class="tbenter" width=100% height=90%>
   		<TR>
      <TD> 
        
      <div align="center"> <font size="3"><b> No hay datos que correspondan con su criterio de busqueda 
        </b></font> </div>
      </TD></TR>
   		</TABLE>
<%   		
	}
	else {
%>
  
  <TABLE class="tbenter" width="100%">
    <TR>
      <TD class=TDBKG> 
        <div align="center"><a href="javascript:goAction(1)"><b>Sumario</b></a></div>
      </TD>
      <TD class=TDBKG> 
        <div align="center"><a href="javascript:goAction(2)"><b>Consulta</b></a></div>
      </TD>
      <TD class=TDBKG> 
        <div align="center"><a href="javascript:goAction(3)"><b>Estado de Cuentas</b></a></div>
      </TD>
      <TD class=TDBKG> 
        <div align="center"><a href="javascript:goAction(4)"><b>Promedio</b></a></div>
      </TD>
      <TD class=TDBKG width="16%"> 
        <div align="center"><a href="<%=request.getContextPath()%>/pages/background.jsp"><b>Salir</b></a></div>
      </TD>      
    </TR>
  </TABLE>


<TABLE id="mainTable" class="tableinfo" width="100%">
	<TR>
		<TD NOWRAP valign="top" width="100%">
		<TABLE id="headTable1">
			<TR id="trdark">
				<TH ALIGN=CENTER NOWRAP>Acci�n</TH>
				<TH ALIGN=CENTER NOWRAP onClick="ShowSearchAcc()"
					style="cursor: hand">Cuenta</TH>
				<TH ALIGN=CENTER NOWRAP>Nombre</TH>
				<TH ALIGN=CENTER NOWRAP>Saldo Contable</TH>
				<TH ALIGN=CENTER NOWRAP>Saldo Disponible</TH>
				<TH ALIGN=CENTER NOWRAP>Ejec</TH>
			</TR>
		</TABLE>

		<div id="dataDiv1" class="scbarcolor">
		<table id="dataTable">
			<%
                accList.initRow();
                while (accList.getNextRow()) {
                    if (!accList.getFlag().equals("")) {	
  %>
			<TR>

				<TD ALIGN=Center NOWRAP>
				<div >
					<input type="radio" name="RECNUM" value="<%= accList.getCurrentRow() %>"
						onClick="showAccInfo('<%= accList.getCurrentRow() %>')"> 
					<select name="OPTION_<%= accList.getCurrentRow() %>" onChange="GetInfo('<%= accList.getCurrentRow() %>')"
						onClick="radioClick('RECNUM',<%= accList.getCurrentRow() %>)">
						<option value="" <% if (accList.getRecord(17).equals("")) out.print("selected"); %>></option>
						<option value="0002" <% if (accList.getRecord(17).equals("0002")) out.print("selected"); %>>Insuficiencia Fondos</option>
						<option value="0058" <% if (accList.getRecord(17).equals("0058")) out.print("selected"); %>>Gira Fondos no Dispon.</option>
						<option value="0057" <% if (accList.getRecord(17).equals("0057")) out.print("selected"); %>>Presentar por Taquilla</option>
						<option value="0003" <% if (accList.getRecord(17).equals("0003")) out.print("selected"); %>>Pagar Todos</option>
					</select> 
					<INPUT TYPE=HIDDEN NAME="LNCRDATA<%= accList.getCurrentRow()%>"
						VALUE="<%= datapro.eibs.master.Util.fcolorCCY(accList.getRecord(5)) %><BR>
					<%= datapro.eibs.master.Util.fcolorCCY(accList.getRecord(6)) %><BR>
					<%= accList.getRecord(7)%><BR>	
					<%= datapro.eibs.master.Util.fcolorCCY(accList.getRecord(10)) %><BR>
					<%= datapro.eibs.master.Util.fcolorCCY(accList.getRecord(11)) %><BR>
					<%= datapro.eibs.master.Util.fcolorCCY(accList.getRecord(12)) %><BR>
					<%= datapro.eibs.master.Util.fcolorCCY(accList.getRecord(13)) %><BR>
					<%= datapro.eibs.master.Util.fcolorCCY(accList.getRecord(14)) %>">
					<input type="HIDDEN" name="CURACC_<%= accList.getCurrentRow() %>"
						value="<%= accList.getRecord(0) %>"></DIV>
		<%--			<input type="HIDDEN" name="CURCHK_<%= accList.getCurrentRow() %>"
					value="<%= accList.getRecord(2) %>"></DIV> --%>
				
					<input type="HIDDEN" name="FULACC_<%= accList.getCurrentRow() %>" value="<%= accList.getRecord(31) %>">	
					
				</TD>
				<TD ALIGN=CENTER NOWRAP><a
					href="javascript:radioClick('RECNUM',<%= accList.getCurrentRow() %>)"><%= accList.getRecord(0) %></a></TD>
				<TD ALIGN=LEFT NOWRAP><a
					href="javascript:radioClick('RECNUM',<%= accList.getCurrentRow() %>)">
				<div ><%= accList.getRecord(2) %></DIV>
				</a></TD>
				<TD ALIGN=RIGHT NOWRAP>
				<div ><a
					href="javascript:radioClick('RECNUM',<%= accList.getCurrentRow() %>)"><%= datapro.eibs.master.Util.fcolorCCY(accList.getRecord(3)) %></a></DIV>
				</TD>
				<TD ALIGN=RIGHT NOWRAP>
				<div ><a
					href="javascript:radioClick('RECNUM',<%= accList.getCurrentRow() %>)"><%= datapro.eibs.master.Util.fcolorCCY(accList.getRecord(4)) %></a></DIV>
				</TD>
				<TD ALIGN=CENTER NOWRAP>
				<div ><a
					href="javascript:radioClick('RECNUM',<%= accList.getCurrentRow() %>)"><%= accList.getRecord(15) %></a></DIV>
				</TD>
			</TR>
			<% 
                    }
                }
  %>
		</table>
		</div>
		</TD>
		<TD nowrap ALIGN="RIGHT" valign="top">
		<Table id="tbAddInfoH" width="100%">
			<tr id="trdark">
				<TH ALIGN=CENTER nowrap>Info. Adicional</TH>
			</tr>
		</Table>

		<Table id="tbAddInfo">
			<tr id="trclear">
				<TD ALIGN="RIGHT" valign="center" nowrap>
				<p><b>
				Monto Lin/Crdto:<br>
				Disp.Lin/Crdto:<br>
				Vcto.Lin/Crdto:<br>
				Diferido 1 Dia:<br>
				Diferido 2 Dias:<br>
				Diferido 3 Dias:<br>
				Diferido&gt;3 D�as:<br>
				Indefinido: <br>
				</b></p>

				</TD>
				<TD ALIGN="RIGHT" valign="center" nowrap class="tdaddinfo"></TD>
			</tr>
		</Table>
		</TD>
	</TR>
</TABLE>

<TABLE class="tbenter" WIDTH="98%">
	<TR>
		<TD WIDTH="25%" ALIGN=LEFT><%
        if ( accList.getShowPrev() ) {
				out.println("<A HREF=\"javascript:ShowPrev()\"><IMG border=\"0\" src=\""+request.getContextPath()+"/images/s/previous_records.gif\" ></A>");
        }
  %></TD>
      <TD class=TDBKG> 
        <div align="center"><a href="javascript:goAction(5)"><b>Firma</b></a></div>
      </TD>
      <TD class=TDBKG> 
        <div align="center"><a href="javascript:goAction(6)"><b>Imagen de Cheque</b></a></div>
      </TD>
      <TD class=TDBKG> 
        <div align="center"><a href="javascript:addComments()"><b>Comentarios</b></a> </div>
      </TD>
		<TD WIDTH="25%" ALIGN=RIGHT><%      
        if ( accList.getShowNext() ) {
      			out.println("<A HREF=\"javascript:ShowNext()\"><IMG border=\"0\" src=\""+request.getContextPath()+"/images/s/next_records.gif\" ></A>");
        }
   %></TD>
	</TR>
</TABLE>

<TABLE  id="mainTable2" class="tableinfo" width="100%">
    <TR> 
      <TD NOWRAP valign="top" width="100%" > 
        <TABLE id="headTable2" >
     		<TR id="trdark"> 
      			<TH ALIGN=CENTER NOWRAP>Acci�n</TH>
				<TH ALIGN=CENTER NOWRAP>No. Cheque</TH>
      			<TH ALIGN=CENTER NOWRAP>Monto</TH>
      			<TH ALIGN=CENTER NOWRAP>Estado</TH>
				<TH ALIGN=CENTER NOWRAP>Cod</TH>
      			<TH ALIGN=CENTER NOWRAP>Descripci�n</TH> 
      			<TH ALIGN=CENTER NOWRAP>Origen</TH>     
      			
     		</TR>
    	 </TABLE>
  
   <div id="dataDiv2" class="scbarcolor">
    <%
             accList.initRow();
             int j=0;
			 
             int accChecked = 0;
			 boolean firstime = true;
			 String chk = "";
			 String acc = "";
			 int recnum = 0;
		  	 try { recnum = Integer.parseInt(request.getParameter("ROW")); } catch (Exception e) {};
			 chkList.setCurrentRow(recnum);
			 acc = chkList.getRecord(0);		
              while (accList.getNextRow()) {
    %> 
   <table id="dataTable<%=j%>" class="scbarcolor" style="display:none;">
  <%
          	    chkList.initRow();
			    int k = 0;
				firstime = true;
                while (chkList.getNextRow()) {
                    if (chkList.getFlag().equals(accList.getFlag())) {
						if (acc.equals(accList.getRecord(0))) {
							accChecked = j;
						  	chk = (chkList.getCurrentRow()== recnum)?"checked":""; 
						}else {
							chk = (firstime)?"checked":"";
						}
						firstime = false;	
  %> 
     		<TR> 
      			
              <TD ALIGN=Left NOWRAP>
				<DIV ALIGN=Left NOWRAP> 
                <input type="radio" name="RECNUM<%=j%>" value="<%= chkList.getCurrentRow() %>" <%=chk%> onClick="showChkInfo('<%=j%>','<%=k%>','<%= chkList.getCurrentRow() %>')">
                <SELECT name="OPTION_<%=j%><%=k%>">
				<OPTION value="" <% if (chkList.getRecord(17).equals("")) out.print("selected"); %>></OPTION>
				
				<option value="0002" <% if (accList.getRecord(17).equals("0002")) out.print("selected"); %>>Insuficiencia Fondos</option>
			    <option value="0058" <% if (accList.getRecord(17).equals("0058")) out.print("selected"); %>>Gira Fondos no Dispon.</option>
				<option value="0057" <% if (accList.getRecord(17).equals("0057")) out.print("selected"); %>>Presentar por Taquilla</option>
				<OPTION value="0003" <% if (chkList.getRecord(17).equals("0003")) out.print("selected"); %>>Pagar</OPTION>
			    </SELECT>
				<INPUT TYPE=HIDDEN NAME="REMDATA<%=j%><%=k%>" VALUE="<%= chkList.getRecord(22) %>">
				<input type="HIDDEN" name="CURCHK<%=j%><%=k%>" value="<%= chkList.getRecord(2) %>"> 
				<img name="IMGREM<%=j%><%=k%>" src="<%=request.getContextPath()%>/images/s/info.gif" title="More Information" align="middle" border="0" onclick="ShowComments(<%=j%>,<%=k%>)"
				 <% if (chkList.getRecord(22) == null || chkList.getRecord(22).trim().equals("")) out.print("style=\"display:none;\""); %>>
				</DIV>
			  </TD>
      			<TD ALIGN=CENTER NOWRAP><div ><a href="javascript:radioClick('RECNUM<%=j%>',<%= k %>)"><%= chkList.getRecord(2) %></a></DIV></TD>
      			<TD ALIGN=RIGHT NOWRAP><div ><a href="javascript:radioClick('RECNUM<%=j%>',<%= k %>)"><%= datapro.eibs.master.Util.fcolorCCY(chkList.getRecord(3)) %></a></DIV></TD>      
      			<TD ALIGN=CENTER NOWRAP><div ><a href="javascript:radioClick('RECNUM<%=j%>',<%= k %>)">
				<% if (chkList.getRecord(4).equals("R")) out.print("Devuelto"); else out.print("Pagado"); %></a></DIV></TD>
      			<TD ALIGN=CENTER NOWRAP><div ><a href="javascript:radioClick('RECNUM<%=j%>',<%= k %>)"><%= chkList.getRecord(5) %></a></DIV></TD>
      			<TD ALIGN=LEFT NOWRAP><div ><a href="javascript:radioClick('RECNUM<%=j%>',<%= k %>)"><%= chkList.getRecord(6) %></a></DIV></TD>
      			<TD ALIGN=CENTER NOWRAP><div ><a href="javascript:radioClick('RECNUM<%=j%>',<%= k %>)"><% if (chkList.getRecord(7).equals("1")) { out.print("Camara Entrante");}
					else if (chkList.getRecord(7).equals("2")) { out.print("Cajas");}
					else if (chkList.getRecord(7).equals("3")) { out.print("Camara Saliente");}
					else if (chkList.getRecord(7).equals("4")) { out.print("Rechazo de Caja");} 
					else if (chkList.getRecord(7).equals("5")) { out.print("Fuera de Camara");}
					else {out.print("Devuelto otros Bancos");} %></a></DIV></TD>
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


<SCRIPT language="JavaScript">
     
	 function resizeDoc() {
      var actvTb = document.forms[0].ActAccRow.value;
      var dataT = document.all["dataTable"+actvTb];
       adjustEquTables(headTable1, dataTable, dataDiv1,1,false);
       adjustEquTables(headTable2, dataT, dataDiv2,1,false);
      }
     if ( getMSIEVer() < 5.5 ) {
		schACC.style.filter="blendTrans(duration=1)"; 
		Comments.style.filter="blendTrans(duration=1)"; 
	 }
	 if (document.all["dataTable"].rows.length > 1) {
	      document.forms[0].RECNUM[<%= accChecked %>].click();
     } else {
       	  document.forms[0].RECNUM.click();
     }
     resizeDoc();
     window.onresize=resizeDoc;
	 tbAddInfoH.rows[0].cells[0].height = headTable1.rows[0].cells[0].clientHeight;
	 
</SCRIPT>
  <p align="center"> 
      <input id="EIBSBTN" type=button name="Submit" OnClick="SendInfo()" value="Enviar">
    
  </p>

<%           
  }
%>
</FORM>


</BODY>
</HTML>
