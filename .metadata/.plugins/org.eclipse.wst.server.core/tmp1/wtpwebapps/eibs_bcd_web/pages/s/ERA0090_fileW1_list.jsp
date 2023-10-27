<%@ page import ="datapro.eibs.master.Util" %>
<html>
<head>
<title>Archivos de Interface para enviar a Credismart</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<jsp:useBean id= "appList" class= "datapro.eibs.beans.JBList"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>

</head>
<BODY>
<script type="text/javascript">

function hideDiv(fld, value){
 if (value) {
   eval(fld+".style.display='none'");
   } else{
   eval(fld+".style.display=''");
   }
}

function showAddInfo(ref) {
    document.forms[0].E02RW1REF.value = ref;
}

function submitThis(option) {
	if (document.forms[0].REF.value !='') {;
		document.forms[0].E02RW1REF.value=document.forms[0].REF.value;
	}   
	switch (option) {
            //lista registros del archivo seleccionado
    case 5 :{
		showMntW1(document.forms[0].E02RW1REF.value);
       }
		break;
            //
    case 7 :{
            }
            break;
    default : {
            }
            break;
    }
 }

  function goExit(){
     window.location.href="<%=request.getContextPath()%>/pages/background.jsp";
  }

function showMntW1(ref) {
	var SCREEN = "102";
	var OPECOD = "0005";
	var E02RW1REF = ref;
	page = "<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSERA0090?SCREEN="+SCREEN+"&OPECOD="+OPECOD+"&E02RW1REF="+E02RW1REF;
	CenterNamedWindow(page,'Information',1200,500,2);
}

function goRefresh() {
	if (isValidObject( getElement("E02NUMREG"))) {
		document.forms[0].Pos.value = document.forms[0].E02NUMREG.value-20;
	}
    document.forms[0].SCREEN.value = 101;
	document.forms[0].submit();
}

</SCRIPT>  

<h3 align="center">Mantenimiento Tabla Garant�a Mensual para Interface a CREDISMART 
<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="file_listW1,ERA0090"></h3>

<hr size="4">

<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSERA0090">
  <p> 
    <INPUT TYPE=HIDDEN NAME="CURRENTROW" id="CURRENTROW" VALUE="0"> 
    <INPUT TYPE=HIDDEN NAME="SCREEN" id="SCREEN" VALUE="2">
    <input type=HIDDEN name="opt" id="opt" >
    <input type=HIDDEN name="E02RW1REF" id="E02RW1REF" >
    <input type=HIDDEN name="Pos" id="Pos" >
  </p>
<% 
String chk = "";

 if ( !error.getERRNUM().equals("0")  ) {
     error.setERRNUM("0");
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
     }

%> 
<table class="tableinfo">
    <tr> 
 	<td nowrap width=25% align="right" height="17" >Ingrese el N&uacute;mero de Garant�a :
 			<input type=TEXT name="REF" value="" size=13 maxlength=12>
	</td>
    <td class=TDBKG width="25%">
        <div align="center">
        <a href="javascript:submitThis(5)"><b>Modificar Registro</b></a>
        </div> 
    </td> 
      <td class=TDBKG width="25%"> 
        <div align="center"><a href="<%=request.getContextPath()%>/pages/background.jsp"><b>Salir</b></a></div>
      </td>
    </tr>
</table>

<TABLE  id="mainTable" class="tableinfo" ALIGN=CENTER height="70%">
    <TR id="trdark"> 
      <TH ALIGN=CENTER nowrap>Sel</TH>
      <TH ALIGN=CENTER nowrap>N�mero<br>Garant�a</TH>
      <TH ALIGN=CENTER nowrap>Abierta<br>/Cerrada</TH>
      <TH ALIGN=CENTER nowrap>Tipo<br>Garant�a</TH>
      <TH ALIGN=CENTER nowrap>Moneda</TH>
      <TH ALIGN=CENTER nowrap>Vlr.Garant�a</TH>
      <TH ALIGN=CENTER nowrap>Ven-<br>cida</TH>
      <TH ALIGN=CENTER nowrap>Fecha<br>Vencim.</TH>
      <TH ALIGN=CENTER nowrap>Ido-<br>nea</TH>
      <TH ALIGN=CENTER nowrap>Admi-<br>sible</TH>
      <TH ALIGN=CENTER nowrap>Tenen-<br>cia</TH>
      <TH ALIGN=CENTER nowrap>%Cob-<br>ertura</TH>
      <TH ALIGN=CENTER nowrap>Estado</TH>
      <TH ALIGN=CENTER nowrap>Cod-<br>Estado</TH>
      <TH ALIGN=CENTER nowrap>Banca</TH>
      <TH ALIGN=CENTER nowrap>Reest.</TH>
      <TH ALIGN=CENTER nowrap>Vlr.Anterior</TH>
      <TH ALIGN=CENTER nowrap>Valor TRM</TH>
      <TH ALIGN=CENTER nowrap>Detalle<br>Completo</TH>
      <TH ALIGN=CENTER nowrap>Cod.Cliente</TH>
      <TH ALIGN=CENTER nowrap>Fecha<br>Cierre</TH>
      <TH ALIGN=CENTER nowrap>Resp.<br>Hipot.</TH>
      <TH ALIGN=CENTER nowrap>Identi-<br>ficador</TH>
    </TR>
    <%
    appList.initRow();
    int k=1;
    while (appList.getNextRow()) {
     if (appList.getFlag().equals("")) {
   		out.println(appList.getRecord());
        k++;
        }        
     }
    %>
</table>
<table >
<TR>
<TD WIDTH="50%" ALIGN=LEFT>
  <%
        if ( appList.getShowPrev() ) {
      			int pos = appList.getFirstRec() - 21;
      			out.println("<A HREF=\""+request.getContextPath()+"/servlet/datapro.eibs.client.JSERA0090?SCREEN=101&Pos=" + pos +"\"><IMG border=\"0\" src=\""+request.getContextPath()+"/images/s/previous_records.gif\" ></A>");
        }
   %>  
</TD>
<TD WIDTH="50%" ALIGN=RIGHT>     
 <% 
        if ( appList.getShowNext() ) {
      			int pos = appList.getLastRec();
      			out.println("<A HREF=\""+request.getContextPath()+"/servlet/datapro.eibs.client.JSERA0090?SCREEN=101&Pos=" + pos +"\"><IMG border=\"0\" src=\""+request.getContextPath()+"/images/s/next_records.gif\" ></A>");
        }
  %> 
</TD>
</TR>
</TABLE>
 	
<SCRIPT type="text/javascript">
  function resizeDoc() {
       divResize();
     adjustEquTables( getElement("headTable"), getElement("dataTable"), getElement("dataDiv1"),1,false);
}
  showChecked("REFNUM");
  resizeDoc();
  window.onresize=resizeDoc;
     
</SCRIPT>

  
</form>
</body>
</html>