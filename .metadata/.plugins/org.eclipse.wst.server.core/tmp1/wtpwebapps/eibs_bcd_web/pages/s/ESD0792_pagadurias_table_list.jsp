<%@ page import = "datapro.eibs.master.Util" %>
<html>
<head>
<title>Pagadurias</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "ESD079201Help" class= "datapro.eibs.beans.JBObjList"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>

<script type="text/javascript">

function goAction(op) {

	getElement("opt").value = op;
	document.forms[0].submit();
}

function goDelete() {

	if(confirm("Esta seguro que desea borrar este codigo?")){
		getElement("opt").value = 3;
		document.forms[0].submit();
	}
}

function closeHiddenDivNew(){
	setVisibility(document.getElementById("hiddenDivNew"), "hidden");
}

function HiddenDivNew(evt) {
	evt = (evt) ? evt : ((window.event) ? window.event : "");
 	
	var hiddenDivNew = document.getElementById("hiddenDivNew");

	var y=evt.clientY + document.body.scrollTop;
	var x=evt.clientX + document.body.scrollLeft;
     
	cancelBub(evt);

	moveElement(hiddenDivNew, y, x);
	setVisibility(hiddenDivNew, "visible");
	 
}

function hideMenu() {
	if (document.getElementById("menuPag").style.display == 'none') {
		document.getElementById("menuPag").style.display = 'none';
		resizeIFrame(false);
	} else {
		document.getElementById("menuPag").style.display = 'none';
		resizeIFrame(false);
	}


function resizeIFrame(lMenu) {
	var nHeight = 0;	
	var nMenu = 60;
	if (isValidObject(parent.document.getElementById("ifrempsg"))) {
		nHeight = parseInt(document.getElementById("IFRHEIGHT").value);
	}
	if (nHeight > 0) {
		nHeight = lMenu ? nHeight + nMenu : nHeight;
		parent.document.getElementById("ifrempsg").height = nHeight;
	}	

document.onclick= closeHiddenDivNew;


</SCRIPT>  

</head>

<BODY>
<% 
	if ( !error.getERRNUM().equals("0")  ) {
		error.setERRNUM("0");
		out.println("<SCRIPT Language=\"Javascript\">");
		out.println("	Errors()");
		out.println("</SCRIPT>");
	}
%>
<% 
	String emp = (String)session.getAttribute("EMPSG");
 	emp = (emp==null)?"":emp;//si es blanco viene llamado por menu, sino viene llamdo desde la pantalla EPV1010
%>
<FORM name="form1" METHOD="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSESD0792" >
  <p> 
    <input type=HIDDEN name="SCREEN" id="SCREEN" value="800">
	<input type="HIDDEN" name="IFRHEIGHT" id="IFRHEIGHT" value=""> 
    <input type=HIDDEN name="totalRow" id="totalRow" value="0">
    <input type=HIDDEN name="opt" id="opt" >
  </p>
  <p> 
<a href="#" onclick="hideMenu();"><b>Pagadurias</b></a>
  

<div id="hiddenDivNew" class="hiddenDiv">
    <table id=tbhelp style="border-top-width : 1px;border-right-width : 1px;border-bottom-width : 1px;border-left-width : 1px;
	border-color: #0b23b5;
	border-style : solid solid solid solid;
	filter:progid:DXImageTransform.Microsoft.dropshadow(OffX=3, OffY=3, Color='gray', Positive='true');">
      <tr id="trdark"> 
        <td align=CENTER width="18%"> 
          <div align="right">Nuevo Codigo :</div>
        </td>
        <td align=CENTER width="34%"> 
          <div align="left"> 
            <input type="text" id="E01COPCDE" name="E01COPCDE" size="5" maxlength="6">
          </div>
        </td>
      </tr>
      <tr id="trclear"> 
        <td align=CENTER width="18%"> 
          <div align="right">Nueva Secuencia:</div>
        </td>
        <td align=CENTER width="34%"> 
          <div align="left"> 
            <input type="text" id="E01COPSEQ" name="E01COPSEQ" size="5" maxlength="6">
          </div>
        </td>
      <tr id="trclear"> 
        <td align=center nowrap colspan="2"> 
          <input id="EIBSBTN" type=button name="Submit" value="Enviar" onClick="javascript:goAction(1)">
        </td>
      </tr>
    </table>
  </div>



 
          
  <table class="tbenter" id="menuPag" width=100% align=center height="8%">
<%if(!emp.equals("A")) { %>
    <tr> 
		<td align="center" class="tdbkg" width="25%"><b>Crear</b>
		</td>
      <td class=TDBKG width="25%"> 
        <div align="center"><a href="javascript:goAction(2)"><b>Modificar</b></a></div>
      </td>
		<td class=TDBKG width="25%"> 
        <div align="center"><a href="javascript:goDelete(3)"><b>Borrar</b></a></div>
      </td>      
      <td class=TDBKG width="25%"> 
        <div align="center"><a href="<%=request.getContextPath()%>/pages/background.jsp"><b>Salir</b></a></div>
      </td>
    </tr>
  </table>
  <br>
<% } %> 
  <TABLE  id="mainTable" class="tableinfo" style="height:400px;">
    <tr  height="5%"> 
      <td NOWRAP valign="top" width="100%"> 
		<table id="headTable" width="98%">
			<tr id="trdark">
	            <th align=CENTER nowrap width="5%">&nbsp;</th>
	            <th align=CENTER nowrap width="10%">C&oacute;digo</th>
	            <th align=CENTER nowrap width="10%">Secuencia</th>
	            <th align=LEFT nowrap width="25%">Descripci&oacute;n</th>
	            <th align=LEFT nowrap width="25%">Contacto Operativo</th>
	            <th align=LEFT nowrap width="25%">Contacto Comercial</th>
	            
	            
	            
			</tr>
        </table>
      </td>
    </tr>    
		  <tr  height="95%">    
		    <td nowrap="nowrap">      
		       <div id="dataDiv1" style="height:400px; overflow:auto;"> 
		       <table id="dataTable" cellspacing="0" cellpadding="1" border="0" width="100%">         
         <%
                ESD079201Help.initRow();
				boolean firstTime = true;
				String chk = "";
        		while (ESD079201Help.getNextRow()) {
					if (firstTime) {
						firstTime = false;
						chk = "checked";
					} else {
						chk = "";
					}
                  	datapro.eibs.beans.ESD079201Message msgList = (datapro.eibs.beans.ESD079201Message) ESD079201Help.getRecord();
		 %>
          <tr id="dataTable<%= ESD079201Help.getCurrentRow() %>"> 
            <td NOWRAP  align=CENTER width="5%"><input type="radio" name="CURRCODE" value="<%= ESD079201Help.getCurrentRow() %> "  <%=chk%> onClick="highlightRow('dataTable', <%= ESD079201Help.getCurrentRow() %>)"></td>
            <td NOWRAP  align=CENTER width="10%"><%= msgList.getE01COPCDE() %></td>
            <td NOWRAP  align=LEFT width="10%"><%= msgList.getE01COPSEQ() %></td>
            <td NOWRAP  align=LEFT width="25%"><%= msgList.getE01COPDES() %></td>
            <td NOWRAP  align=LEFT width="25%"><%= msgList.getE01COPCOP() %></td>
            <td NOWRAP  align=LEFT width="25%"><%= msgList.getE01COPCCO() %></td>
          </tr>
          <% } %>
             </table>
             </div>
             </td>
             </tr>
</table>
  
  <TABLE  class="tbenter" WIDTH="98%" ALIGN="center"  height="10%">
  	<TR>
  		 <TD WIDTH="50%" ALIGN=LEFT height="25">
  		 <% 
        	if ( ESD079201Help.getShowPrev() ) {
      			int pos = ESD079201Help.getFirstRec() - 51;
      		    out.print("<A HREF=\"" + request.getContextPath() + "/servlet/datapro.eibs.products.JSESD0792?SCREEN=100&FromRecord=" + pos + "\" ><img src=\""+request.getContextPath()+"/images/s/previous_records.gif\" border=0></A>");
        	}
  		 %>
  		 </TD>
  		 <TD WIDTH="50%" ALIGN=RIGHT height="25">
  		 <% 
        	if ( ESD079201Help.getShowNext() ) {
      			int pos = ESD079201Help.getLastRec();
      		    out.print("<A HREF=\"" + request.getContextPath() + "/servlet/datapro.eibs.products.JSESD0792?SCREEN=100&FromRecord=" + pos + "\" ><img src=\""+request.getContextPath()+"/images/s/next_records.gif\" border=0></A>");
        	}
  		 %>
  		 </TD>
  	</TR>
  </TABLE>

<SCRIPT type="text/javascript">
	showChecked("CURRCODE");  
 	document.getElementById("hiddenDivNew").onclick= cancelBub;
	document.getElementById("menuPag").style.display = 'none';
	if (isValidObject(parent.document.getElementById("ifrempsg"))) {
		document.getElementById("IFRHEIGHT").value = parent.document.getElementById("ifrempsg").height;
	}	
</SCRIPT>

  </form>

</body>
</html>
