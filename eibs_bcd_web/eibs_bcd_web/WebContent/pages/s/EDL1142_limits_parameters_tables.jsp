<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput"%>
<%@ page import="datapro.eibs.master.Util,datapro.eibs.beans.EDL114201Message"%>

<html>
<head>
<title>Tramos y Tasas Preferenciales</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

</head>

<jsp:useBean id= "list" class= "datapro.eibs.beans.JBObjList"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "prefere" class= "datapro.eibs.beans.EDL114201Message"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />
<%@ page import="datapro.eibs.master.Util"%>

<body>

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>

<SCRIPT type="text/javascript">
   
function goAction(op) {

	if(op == 1){
		getElement("SCREEN").value = 200;
	}
	if(op == 2){
		getElement("SCREEN").value = 300;
		getElement("E01TASTBL").value = getElement("totalRow").value;
	}
	document.forms[0].submit();
}

function closeHiddenDivNew(){
	setVisibility(document.getElementById("hiddenDivNew"), "hidden");
}

function showHiddenDivNew(evt) {
	evt = (evt) ? evt : ((window.event) ? window.event : "");
 	
	var hiddenDivNew = document.getElementById("hiddenDivNew");

	var y=evt.clientY + document.body.scrollTop;
	var x=evt.clientX + document.body.scrollLeft;
     
	cancelBub(evt);

	moveElement(hiddenDivNew, y, x);
	setVisibility(hiddenDivNew, "visible");
	 
}

addEventHandler(document, 'click', closeHiddenDivNew);

</SCRIPT>

<% 
    if ( !error.getERRNUM().equals("0")  ) {
        out.println("<SCRIPT Language=\"Javascript\">");
        error.setERRNUM("0");
        out.println("       showErrors()");
        out.println("</SCRIPT>");
    }
    
%>


<H3 align="center">Tablas de Tramos y Tasas Preferenciales<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="limits_parameters_tables.jsp, EDL1142"></H3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.params.JSEDL1142" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" id="SCREEN" VALUE="200">
  <INPUT TYPE=HIDDEN NAME="totalRow" id="totalRow" VALUE="0">
  
	<div id="hiddenDivNew" class="hiddenDiv">
	 <TABLE id=tbhelp style="border-top-width : 1px;border-right-width : 1px;border-bottom-width : 1px;border-left-width : 1px;
		border-color: #0b23b5;
		border-style : solid solid solid solid;
		filter:progid:DXImageTransform.Microsoft.dropshadow(OffX=3, OffY=3, Color='gray', Positive='true');">
		<tr id="trdark"> 
	      <td align=CENTER width="40%"> 
	        <div align="right">Tabla :</div>
	      </td>
	      <td align=CENTER width="60%"> 
	        <div align="left"> 
	          <input type="text" name="E01TASTBL" id="E01TASTBL" size="3" maxlength="2">
	        </div>
	      </td>
	    </tr>
		<tr id="trdark"> 
	      <td align=CENTER width="40%"> 
	        <div align="right">Descripción :</div>
	      </td>
	      <td align=CENTER width="60%"> 
	        <div align="left"> 
	          <input type="text" name="E01TASDSC" size="50" maxlength="45">
	        </div>
	      </td>
	    </tr>
	   <tr id="trclear">
	   
	   <TD ALIGN=center nowrap colspan="2">
		     <input id="EIBSBTN" type=button name="Submit" value="Enviar" onClick="goAction(1)"> 
	   </TD>
	   
	   </tr>
	 </TABLE>
	 </div>
  <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
          <tr id="trdark"> 
            <td nowrap width="16%" > 
              <div align="right">Banco :</div>
            </td>
            <td nowrap width="20%" > 
              <div align="left">
                <input type="text" name="E01TASBNK" size="3" maxlength="2" value="<%= prefere.getE01TASBNK().trim()%>">
              </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
 
  <br>
  
    <%
	if ( list.getNoResult() ) {
 	%>
  <p>&nbsp;</p>
  <p>&nbsp;</p>

  <TABLE class="tbenter" width="100%" >
    <TR>
      <TD > 
        <div align="center"> 
          <p><b>No hay resultados para su b&uacute;squeda</b></p>
          <table class="tbenter" width=100% align=center>
            <tr> 
              <td class=TDBKG width="30%"> 
                <div id="eibsNew" align="center" style="cursor:pointer"><a><b>Crear</b></a></div>              
              </td>
              <td class=TDBKG width="30%"> 
                <div align="center"><a href="<%=request.getContextPath()%>/pages/background.jsp"><b>Salir</b></a></div>
              </td>
            </tr>
          </table>
          <p>&nbsp;</p>
          
        </div>

	  </TD>
	</TR>
    </TABLE>
	
  <%  }	else { %>
  
  <table class="tbenter" width=100% align=center>
    <tr> 
      <td class=TDBKG width="34%"> 
		<div id="eibsNew" align="center" style="cursor:pointer"><a><b>Crear</b></a></div>
      </td>
		<td class=TDBKG width="33%"> 
        <div align="center"><a href="javascript:goAction(2)"><b>Modificar</b></a></div>
      </td>
      <td class=TDBKG width="33%"> 
        <div align="center"><a href="<%=request.getContextPath()%>/pages/background.jsp"><b>Salir</b></a></div>
      </td>
    </tr>
  </table>
	
  <TABLE  id=cfTable class="tableinfo" height="70%">
 <tr height="5%">  
    <td NOWRAP valign="top" width="95%">
      <TABLE id="headTable"  width="100%">
    <TR id="trdark"> 
      <TH ALIGN=CENTER width="5%" nowrap>&nbsp;</TH>
      <TH ALIGN=CENTER nowrap width="25%">Tabla</TH>
      <TH ALIGN=left nowrap width="45%">Descripción</TH>
      <TH ALIGN=CENTER nowrap width="25%">Fecha</TH>            
    </TR>
        </table>
       </td>
     </tr>
    
         	
         	<tr  height="100%"> 
          	<td nowrap="nowrap">     
          	<div id="dataDiv1" style="width:100%; height:100%; overflow:auto;">  
			<table id="dataTable" cellspacing="0" cellpadding="1" border="0" width="100%">

	<%
		list.initRow();
          		boolean firstTime = true;
          		String chk = "";
          		while (list.getNextRow()) {
          			if (firstTime) {
          				firstTime = false;
          				chk = "checked";
          			} else {
          				chk = "";
          			}
          			EDL114201Message msg = (EDL114201Message) list.getRecord();
	%>
            
              <tr id="dataTable<%=list.getCurrentRow()%>">
				<td nowrap align="center" width="5%"> <input type="radio" name="key" value="<%=list.getCurrentRow()%>" <%=chk%>
					onClick="highlightRow('dataTable', <%=list.getCurrentRow()%>)" /></td>
              <TD ALIGN=center NOWRAP width="25%"><%= Util.formatCell(msg.getE01TASTBL()) %></TD>              
              <TD ALIGN=left NOWRAP width="45%"><%= Util.formatCell(msg.getE01TASDSC()) %></TD>  
              <TD ALIGN=left NOWRAP width="25%"></TD>            
           </tr>
	<%             
         }        
    %>
    </table>
    </div>
      </td>
    </tr>
  </table>
  	<%              
         }        
    %>
  
  <SCRIPT type="text/javascript">
     showChecked("key");
	document.getElementById("hiddenDivNew").onclick=cancelBub;
	document.getElementById("eibsNew").onclick=showHiddenDivNew;
 </SCRIPT>
  </form>
</body>
</html>
