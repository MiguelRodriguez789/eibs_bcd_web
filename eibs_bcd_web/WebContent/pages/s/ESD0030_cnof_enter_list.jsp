<%@ page import = "datapro.eibs.master.Util" %>
<html>
<head>
<title>Codigos de Referencia del Sistema</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "ESD003001Help" class= "datapro.eibs.beans.JBObjList"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>

<script type="text/javascript">



function goAction(op) {

	document.getElementById("opt").value = op;
	if (op == 1 ) {
		document.forms[0].SCREEN.value = '150';
	}
	document.forms[0].submit();
  
}

function getParameters(tablecode, fld, idx) {
	document.getElementById("TABLECODE").value = tablecode;
	document.getElementById("E01CNOFLD").value = fld;	
	highlightRow('dataTable', idx);
}

function closeHiddenDivSearch(){
	setVisibility(document.getElementById("hiddenDivSearch"), "hidden");
}

function showHiddenDivSearch(evt) {
	evt = (evt) ? evt : ((window.event) ? window.event : "");
 	
	var hiddenDivSearch = document.getElementById("hiddenDivSearch");

	var y=evt.clientY + document.body.scrollTop;
	var x=evt.clientX + document.body.scrollLeft;
     
	cancelBub(evt);

	moveElement(hiddenDivSearch, y, x);
	setVisibility(hiddenDivSearch, "visible");
	 
}

addEventHandler(document, 'click' , closeHiddenDivSearch);


</SCRIPT>  

</head>

<BODY>
<h3 align="center">Tablas de Codigos de Referencia<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="cnof_enter_list.jsp, ESD0030"></h3>
<hr size="4">
<FORM name="form1" METHOD="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.params.JSESD0030" >
  <p> 
    <input type=HIDDEN name="SCREEN" id="SCREEN" value="400">
    <input type=HIDDEN name="totalRow" id="totalRow" value="0">
    <input type=HIDDEN name="E01CNOFLD" id="E01CNOFLD" value="">
    <input type=HIDDEN name="opt" id="opt">
  </p>
<div id="hiddenDivSearch" class="hiddenDiv">

 <%int row = 0; %>
 <TABLE id=tbhelp style="border-top-width : 1px;border-right-width : 1px;border-bottom-width : 1px;border-left-width : 1px;
	border-color: #0b23b5;
	border-style : solid solid solid solid;
	filter:progid:DXImageTransform.Microsoft.dropshadow(OffX=3, OffY=3, Color='gray', Positive='true');">
     <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
      <td align=CENTER width="10%"> 
        <div align="right">Tabla :</div>
      </td>
      <td align=CENTER width="10%"> 
        <div align="left"> 
         <input type="text" name="TABLECODE" id="TABLECODE" size="3" maxlength="2" > 
        </div>
      </td>
      <td align=CENTER width="10%"> 
        <div align="right">Descripción :</div>
      </td>      
      <td align=CENTER width="40%"> 
        <div align="left"> 
         <input type="text" name="TABLEDESC" id="TABLEDESC" size="48" maxlength="45" > 
        </div>
      </td>
    </tr>
  <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
   
   <TD ALIGN=center nowrap colspan='5'>
	     <input id="EIBSBTN" type=button name="Submit" value="Enviar" onClick="goAction(2)"> 
   </TD>
   
   </tr>
 </TABLE>
</div>
  <p> 
    <%
	if ( ESD003001Help.getNoResult() ) {
 %>
  </p>
  <p>&nbsp;</p>
  <p>&nbsp;</p>
  <p>&nbsp;</p>
  <p>&nbsp;</p>
  <p>&nbsp;</p>
  <TABLE class="tbenter" width="100%" >
    <TR>
      <TD > 
        <div align="center"> 
          <p><b>No hay resultados para su b&uacute;squeda</b></p>
          <p>&nbsp;</p>
          
        </div>

	  </TD>
	</TR>
    </TABLE>
	
  <%  
		}
	else {
%> <% 
 if ( !error.getERRNUM().equals("0")  ) {
     error.setERRNUM("0");
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
     }

%> 
 
          
  <table class="tbenter" width=100% align=center height="8%">
    <tr> 
      <td class=TDBKG width="30%"> 
        <div align="center"><a href="javascript:goAction(2)"><b>Modificar</b></a></div>
      </td>
      <td class=TDBKG width="30%"> 
		<div id="eibsSearch" align="center" style="cursor:pointer"><a><b>Buscar</b></a></div>
      </td>
      <td class=TDBKG width="30%"> 
        <div align="center"><a href="javascript:goAction(1)"><b>Salir</b></a></div>
      </td>
    </tr>
  </table>
   
  <br>
  
	<table  id="mainTable" class="tableinfo" ALIGN=CENTER style="width:'100%'" height="70%">
    	<tr height="5%"> 
    		<TD NOWRAP width="100%" >
  				<TABLE id="headTable" width="100%" >
         			 <TR id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            			<th align=CENTER nowrap width="5%">&nbsp;</th>
            			<th align=CENTER nowrap width="15%">C&oacute;digo</th>
            			<th align=LEFT nowrap width="80%"> Descripci&oacute;n </th>
          			</TR>
       			</TABLE>
      		</td>
    	</tr>    
		<tr height="95%">    
			<td NOWRAP width="100%" valign="top">       
  
   			    <div id="dataDiv1" class="scbarcolor" style="height:400px;  overflow:auto;">
    				<table id="dataTable" width="100%" > 
<%
		                ESD003001Help.initRow();
						boolean firstTime = true;
						String chk = "";
		        		while (ESD003001Help.getNextRow()) {
							if (firstTime) {
								firstTime = false;
								chk = "checked";
							} else {
								chk = "";
							}
		                  datapro.eibs.beans.ESD003001Message msgList = (datapro.eibs.beans.ESD003001Message) ESD003001Help.getRecord();
%>
		 				<tr id="dataTable<%= ESD003001Help.getCurrentRow() %>"> 
            				<td align=CENTER width="5%"> 
              					<input type="radio" name="CURRCODE" id="CURRCODE" value="<%= msgList.getE01CNOTCN() %> "  <%=chk%> class="highlight" 
									onClick="javascript:getParameters('<%= msgList.getE01CNOTCN() %>','<%= msgList.getE01CNOFLD() %>', <%= ESD003001Help.getCurrentRow() %>);">
            				</td>
            				<td align=CENTER width="15%"><%= msgList.getE01CNOTCN().trim() %></td>
            				<td align=LEFT width="80%"><%= msgList.getE01CNODCN().trim() %></td>
          				</tr>
<%
                		}
%>
					</table>
   				</div>
   			</TD>
		</TR>	
	</TABLE>

	  
    				 
  <SCRIPT type="text/javascript">
		showChecked("CURRCODE");
  </SCRIPT>
  
     


<%}%>
  <SCRIPT type="text/javascript">
	 	document.getElementById("hiddenDivSearch").onclick=cancelBub;
		if(document.getElementById("eibsSearch"))
			document.getElementById("eibsSearch").onclick=showHiddenDivSearch; 
     </SCRIPT>

  </form>

</body>
</html>
