<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput"%>
<%@ page import="datapro.eibs.master.Util,datapro.eibs.beans.ECH020501Message"%>
<%@page import="com.datapro.constants.EibsFields"%>

<HTML>
<HEAD>
<TITLE>Checkbook Avoid</TITLE>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "checkBooks" class= "datapro.eibs.beans.JBObjList"  scope="session" />
<jsp:useBean id="msgMT" class="datapro.eibs.beans.ECH020501Message"  scope="session" />
<jsp:useBean id="rtBasic" class="datapro.eibs.beans.ECH056503Message"  scope="session" />
<jsp:useBean id="error" class="datapro.eibs.beans.ELEERRMessage" scope="session" />
<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" /> 

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>

<script type="text/javascript">
 

function validar(){
            
    var key=document.getElementsByName("key");
	var stmin= 0.00;
	var stmax = 0.00;
	var error = 0;
	for(var i=0;i<key.length;i++){
        stmin = document.getElementsByName("E01CHLMSK_"+i)[0].value;
       	stmax = document.getElementsByName("E01CHLTSK_"+i)[0].value;
       	if(parseInt(stmin) > parseInt(stmax)){
       		error = 1;
       	}
     }  
     if (error == 1){
     	alert("Stock minimo invalido.!");
     }else{
     	document.forms[0].SCREEN.value = 1;
       	document.forms[0].submit();
     }
            		
   }


function capturar(){
	
	var valor="";
	var key=document.getElementsByName("key");
	for(var i=0;i<key.length;i++)
        {
            if(key[i].checked){
                valor=key[i].value;
                break;
             }
        }
    var tr=document.getElementById("dataTable"+valor);
    var td=tr.getElementsByTagName("td");
    
    document.forms[0].CHLTCB.value=td.item(1).firstChild.nodeValue;
	document.forms[0].CHLCDS.value=td.item(2).firstChild.nodeValue;
	document.forms[0].CHLMSK.value=td.item(3).firstChild.nodeValue;
	document.forms[0].CHLTSK.value=td.item(4).firstChild.nodeValue;
	
	var CHLtcb=td.item(1).firstChild.nodeValue;
	var CHLcds=td.item(2).firstChild.nodeValue;
	var CHLmsk=td.item(3).firstChild.nodeValue;
	var CHLtsk=td.item(4).firstChild.nodeValue;
	
	var page = "<%=request.getContextPath()%>/pages/s/ECH0205_stock_checks_main.jsp?CHLTCB=" + CHLtcb +"&CHLCDS="+ CHLcds+"&CHLMSK="+ CHLmsk+"&CHLTSK="+ CHLtsk;
  	CenterNamedWindow(page,'Information',500,275,2);
  
}

function goAction(op){
	
		
	var CHLtcb="";
	var CHLcds="";
	var CHLmsk=0;
	var CHLtsk=0;
	
	if (op==1){
	   var page = "<%=request.getContextPath()%>/pages/s/ECH0205_stock_checks_main.jsp?CHLTCB=" + CHLtcb +"&CHLCDS="+ CHLcds+"&CHLMSK="+ CHLmsk+"&CHLTSK="+ CHLtsk;
  		CenterNamedWindow(page,'Information',500,275,2);
	}else if(op==2){
			goDelete();
	}

}

function goDelete() {
	isCheck();
	
	if ( !ok ) {
		alert("Favor seleccione el Registro a borrar!!!");
		return;	 
	}
	
	document.forms[0].SCREEN.value="4";
	
	if (!confirm("Desea borrar el Registro seleccionado?")) {
		return;
	}
	document.forms[0].submit();
} 

function isCheck() {
	ok=false;
	var valor="";
	var key=document.getElementsByName("key");
	for(var i=0;i<key.length;i++)
        {
            if(key[i].checked){
				valor=key[i].value;
                ok=true;
                break;
             }
			
        }
		var tr=document.getElementById("dataTable"+valor);
		var td=tr.getElementsByTagName("td");
		document.forms[0].E01CHLTCB.value=td.item(1).firstChild.nodeValue;
}

function setKey(cnl) {
	getElement("E01CHLTCB").value = cnl;
}


function closeHiddenDivNew(){
	setVisibility(getElement("hiddenDivNew"), "hidden");
}

function showHiddenDivNew(evt) {
	evt = (evt) ? evt : ((window.event) ? window.event : "");
 	
	var hiddenDivNew = getElement("hiddenDivNew");

	var y=evt.clientY + document.body.scrollTop;
	var x=evt.clientX + document.body.scrollLeft;
     
	cancelBub(evt);

	moveElement(hiddenDivNew, y, x);
	setVisibility(hiddenDivNew, "visible");
	 
}

document.onclick= closeHiddenDivNew;

</script> 
</head>

<body>

<%  if ( !error.getERRNUM().equals("0")  ) {
     error.setERRNUM("0");
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
 }



%>

<h3 align="center">Mantenimiento de Stock - Chequeras Universal<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="stock_checks_list.jsp, ECH0205"></h3>
<hr size="4">
<FORM Method="post" Action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSECH0205">
  <p> 
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="">
 	<INPUT TYPE=HIDDEN NAME="CHLTCB" VALUE="">
    <INPUT TYPE=HIDDEN NAME="CHLCDS" VALUE="">
    <INPUT TYPE=HIDDEN NAME="CHLMSK" VALUE="">
    <INPUT TYPE=HIDDEN NAME="CHLTSK" VALUE="">
	<INPUT TYPE=HIDDEN NAME="E01CHLTCB" VALUE="">
  </p>

 <table class="tableinfo">
    <tr> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
          <tr id="trdark"> 
            <td nowrap width="15%" > 
              <div align="right"><b>Banco :</b></div>
            </td>
            <td nowrap width="15%" > 
              <div align="left"> 
                <input type="text" name="E01CHLBNK" size="3" value="<%= msgMT.getE01CHLBNK()%>" readonly> 
              </div>
            </td>
            <td nowrap width="15%" > 
            </td>
            <td nowrap width="15%" > 
             </td>
            <td nowrap width="15%" > 
            </td>
            <td nowrap width="15%" > 
            </td>
             <td nowrap width="15%" > 
            </td>
          </tr>  	
          <tr id="trdark"> 
            <td nowrap width="15%" > 
              <div align="right"><b>Agencia :</b></div>
            </td>
            <td nowrap width="15%" > 
              <div align="left"> 
                <input type="text" name="E01CHLBRN" size="4" value="<%= msgMT.getE01CHLBRN()%>" readonly> 
                <input type="text" name="E01CHLBDS" size="44" value="<%= msgMT.getE01CHLBDS()%>" readonly>
              </div>
            </td>
            <td nowrap width="15%"> 
<!--               <div align="right"><b>Stock Actual : </b></div> -->
            </td>
            <td nowrap width="15%"> 
              <div align="left"> 
<%--                 <input type="text" name="E01CHLBSK" size="6" readonly value="<%= msgMT.getE01CHLBSK()%>"> --%>
              </div>
            </td>
           <td nowrap width="15%"> 
<!--               <div align="right"><b>Imprenta : </b></div> -->
            </td>
            <td nowrap width="15%"> 
              <div align="left"> 
<%--                 <input type="text" name="E01CHLBIM" size="6" readonly value="<%= msgMT.getE01CHLBIM()%>"> --%>
              </div>
            </td>
             <td nowrap width="15%"> 
              <div align="left"> 
<%--                 <input type="text" name="E01CHLBIM" size="6" readonly value="<%= msgMT.getE01CHLBIM()%>"> --%>
              </div>
            </td>
            
          </tr>
        </table>
      </td>
    </tr>
  </table>
<BR> 
<h4></h4> 

<!-- <table class="tbenter" width="100%" height="10%"> -->
<!-- 	<tr> -->
<!-- 		<td align="center" class="tdbkg" width="20%"><a href="javascript:goAction('1')"><b>Crear </b></a></td> -->
<!-- 		<td align="center" class="tdbkg" width="20%"><a href="javascript:capturar()"><b>Modificar</b> </a></td> -->
<!-- 		<td align="center" class="tdbkg" width="20%"><a href="javascript:goAction('2')"><b>Borrar </b></a></td> -->
<!-- 	</tr> -->
<!-- </table> -->
<BR>
<TABLE  id="mainTable" class="tableinfo"  height="55%" width="80%">
    <tr  height="5%"> 
     <td NOWRAP valign="top" width="80%" >
        <table id="headTable" width="100%">
			<tr id="trdark">
<!-- 			  <TH ALIGN=CENTER rowspan="2" width="1%">&nbsp;</TH>	 -->
		      <TH ALIGN=CENTER rowspan="2" width="2%">Tipo <br> Chequera</TH>
		      <TH ALIGN=CENTER colspan="2" width="8%">Descripción</TH>
		      <TH ALIGN=CENTER rowspan="2" width="5%" >Stock Minimo</TH>
		      <TH ALIGN=CENTER rowspan="2" width="5%" >Stock Maximo</TH>
<!-- 		      <TH ALIGN=CENTER rowspan="2" width="6%">Stock Actual</TH> -->
<!-- 		      <TH ALIGN=CENTER rowspan="2" width="6%">Imprenta</TH> -->
		    </tr>
	    </table>
    </td>
   </tr>
   
		  <tr  height="60%">    
		    <td nowrap="nowrap">       
		      <div id="dataDiv1" class="scbarcolor" style="width:100%; height:100%; overflow:auto;">
			<table id="dataTable" width="100%">
          
		     
		       <% 	if ( checkBooks.getNoResult() ) {  %>
		       <br>
		       <br>
   				<TR>
    			  <TD> 
      				  <div align="center"> <font size="3"><b> No hay resultados para esta Oficina </b></font></div>
    			  </TD>
    			</TR>
   		
	<% }else{
		       
          checkBooks.initRow();
				boolean firstTime = true;
				String chk = "";
                while (checkBooks.getNextRow()) {
 					if (firstTime) {
						firstTime = false;
						chk = "checked";
					} else {
						chk = "";
					}
					ECH020501Message ech020501List = (ECH020501Message)checkBooks.getRecord();

   %>  
   		
 		
 		<tr id="dataTable<%= checkBooks.getCurrentRow() %>">
			<td nowrap align="center" width="1%"><input type="hidden" name="key"	value="<%=checkBooks.getCurrentRow()%>" <%=chk%> class="highlight" onClick="highlightRow('dataTable', <%= checkBooks.getCurrentRow() %>)"/></td>
			<td nowrap align="center" width="2%"><%= ech020501List.getE01CHLTCB()%></td>
			<td nowrap align="left" width="7%"><%= ech020501List.getE01CHLCDS()%></td>
<%-- 			<td nowrap align="center" width="5%"><%= ech020501List.getE01CHLMSK()%></td> --%>
			<td nowrap align="center" width="5%">
				<input type="text" name="E01CHLMSK_<%= checkBooks.getCurrentRow() %>" size="12" maxlength="11" value="<%= ech020501List.getE01CHLMSK() %>" onKeypress="enterInteger(event)">
			</td>
<%-- 			<td nowrap align="center" width="5%"><%=ech020501List.getE01CHLTSK()%></td> --%>
			<td nowrap align="center" width="5%">
				<input type="text" name="E01CHLTSK_<%= checkBooks.getCurrentRow() %>" size="12" maxlength="11" value="<%= ech020501List.getE01CHLTSK() %>" onKeypress="enterInteger(event)">
			</td>
<%-- 			<td nowrap align="center" width="6%"><%=ech020501List.getE01CHLASK()%></td> --%>
<%-- 			<td nowrap align="center" width="6%"><%=ech020501List.getE01CHLCIM()%></td> --%>
		</tr>
<%  }
   }%>
		  
        </table>
        </div>
        </td>
        </tr>
    </table>

</FORM>

<div align="center"><br>
	<input id="EIBSBTN" type="button" value="Actualizar" onClick='validar()' name="Actualizar"> 
	<input id="EIBSBTN" type="button" value="Salir" onClick='window.history.go(-1)' name="button"> 
</div>
<SCRIPT language="JavaScript">
	showChecked("key");
 	getElement("hiddenDivNew").onclick=cancelBub;
	getElement("eibsNew").onclick=showHiddenDivNew;  
</SCRIPT>

</BODY>
</HTML>

				