<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@page import="com.datapro.eibs.constants.HelpTypes"%>
<%@ page import="com.datapro.constants.EibsFields"%>
<%@ page import = "datapro.eibs.master.Util" %>
<html>
<head>
<title>Table/List Cupo Rotativo</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "HeadInfo" class="datapro.eibs.beans.EPV015402Message" scope="session" />
<jsp:useBean id= "EPV015403List" class= "datapro.eibs.beans.JBObjList"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>

<script type="text/javascript">

function goAction(op,row) {
	clickElement("CURROW", row);
	if(op == 1){
		getElement("SCREEN").value = 250;	
	
	}else{
		getElement("opt").value = op;
	}
	document.forms[0].submit();
  
}

/*  function closeHiddenDivNew(){
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

addEventHandler(document, 'click', closeHiddenDivNew);  */


</SCRIPT>  

</head>

<BODY>

<% 
 	if ( !error.getERRNUM().equals("0")  ) {
     	out.println("<SCRIPT Language=\"Javascript\">");
     	out.println("       showErrors()");
     	out.println("</SCRIPT>");
 	} else if ("DO_PRINT".equals(userPO.getRedirect())) {
     	out.println("<SCRIPT Language=\"Javascript\">");
     	out.println("       showReceipt('" + userPO.getOption() + "')");
     	out.println("</SCRIPT>");     
   	}
   	userPO.setSource("INGRESSO");
	userPO.setHeader1("INGRESSO");   	
%>


<h3 align="center">Lista Cupo Rotativo<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="crotat_list.jsp, EPV0154"></h3>
<hr size="4">
<FORM name="form1" METHOD="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.salesplatform.JSEPV0154" >
    <input type=HIDDEN name="SCREEN" id="SCREEN" value="800">
    <input type=HIDDEN name="totalRow" id="totalRow" value="0">
    <input type=HIDDEN name="opt" id="opt" >
<table class="tableinfo">
	<tr>
	<td nowrap>
		<table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
		 <tr id="trdark">
			<td nowrap>
				<div align="right"><b> Cliente Numero :</b></div>
			</td>
			<td nowrap>
				<div align="left"><eibsinput:text name="HeadInfo" property="E02DEACUN" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_CUSTOMER%>" /></div>
			</td>
			<td nowrap>
				<div align="right"><b> Nombre :</b></div>
			</td>
			<td nowrap>
				<div align="left"><eibsinput:text name="HeadInfo" property="E02CUSNA1" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_NAME%>"></eibsinput:text> </div>
			</td>
		 </tr>			
		</table>
	</td>
	</tr>
</table>

<div id="hiddenDivNew" class="hiddenDiv">
    <table id=tbhelp style="border-top-width : 1px;border-right-width : 1px;border-bottom-width : 1px;border-left-width : 1px;
	border-color: #0b23b5;
	border-style : solid solid solid solid;
	filter:progid:DXImageTransform.Microsoft.dropshadow(OffX=3, OffY=3, Color='gray', Positive='true');">
      <tr id="trdark"> 
        <td align=CENTER width="18%"> 
          <div align="right">Producto :</div>
        </td>
        <td align=LEFT width="34%"> 
			<input type="text" name="E03DEAPRO" size="5" maxlength="4" onchange="javascript:goAction('1')" > 
			<a href="javascript:GetProduct('E03DEAPRO','L2','<%=currUser.getE01UBK().trim()%>', ' ', ' ')">
				<img src="<%=request.getContextPath()%>/images/1b.gif" title="help" align="middle" border="0"></a>        
		</td>
      </tr>
      <tr id="trclear"> 
        <td align=center nowrap colspan="2"> 
          <input id="EIBSBTN" type=button name="Submit" value="Enviar" onClick="javascript:goAction('1')">
        </td>
      </tr>
    </table>
  </div> 
 
          
  <table class="tbenter" width=100% align=center height="8%">
    <tr> 
		<td align="center" id="eibsNew" class="tdbkg" width="25%"><a href="javascript:goAction(1)"><b>Crear</b></a>
		</td>
<%
	if ( !EPV015403List.getNoResult()) {
%>		
      <td class=TDBKG width="25%"> 
        <div align="center"><a href="javascript:goAction(2)"><b>Modificar</b></a></div>
      </td>
<%}%>      
      
      <td class=TDBKG width="25%"> 
        <div align="center"><a href="<%=request.getContextPath()%>/pages/background.jsp"><b>Salir</b></a></div>
      </td>
    </tr>
  </table>
  <br>

<%
	if ( !EPV015403List.getNoResult()) {
%>
  <TABLE  id="mainTable" class="tableinfo" style="height:400px;">
    <tr  height="5%"> 
      <td NOWRAP valign="top" width="100%"> 
		<table id="headTable" width="100%" >
			<tr id="trdark">
	            <th align=CENTER nowrap width="2%"></th>
	            <th align=CENTER nowrap width="10%">N&uacute;mero</th>
	            <th align=CENTER nowrap width="10%">Producto</th>
	            <th align=LEFT nowrap width="28%">Descripci&oacute;n</th>
	            <th align=LEFT nowrap width="25%">Monto Cupo</th>
	            <th align=LEFT nowrap width="25%">Vencimiento</th>
			</tr>
        </table>
      </td>
    </tr>    
		  <tr  height="100%">    
		    <td nowrap="nowrap">      
		       <div id="dataDiv1" style="height:400px; overflow:auto;"> 
		       <table id="dataTable" cellspacing="0" cellpadding="1" border="0" width="100%">         
         <%
                EPV015403List.initRow();
				boolean firstTime = true;
				String chk = "";
        		while (EPV015403List.getNextRow()) {
					if (firstTime) {
						firstTime = false;
						chk = "checked";
					} else {
						chk = "";
					}
                  	datapro.eibs.beans.EPV015403Message msgList = (datapro.eibs.beans.EPV015403Message) EPV015403List.getRecord();
		 %>
          <tr id="dataTable<%= EPV015403List.getCurrentRow() %>"> 
            <td NOWRAP  align=CENTER width="2%"><input type="radio" name="CURROW" value="<%= EPV015403List.getCurrentRow() %> "  <%=chk%> onClick="highlightRow('dataTable', <%= EPV015403List.getCurrentRow() %>)"></td>
            <td NOWRAP  align=CENTER width="10%"><a href="javascript:goAction('2',<%= EPV015403List.getCurrentRow()%>);"><%= msgList.getE03DEAACC() %></a></td>
            <td NOWRAP  align=CENTER width="10%"><a href="javascript:goAction('2',<%= EPV015403List.getCurrentRow()%> );"><%= msgList.getE03DEAPRO() %></a></td>
            <td NOWRAP  align=LEFT width="28%"><a href="javascript:goAction('2',<%= EPV015403List.getCurrentRow()%> );"><%= msgList.getE03DSCPRO() %></a></td>
            <td NOWRAP  align=LEFT width="25%"><a href="javascript:goAction('2',<%= EPV015403List.getCurrentRow()%> );"><%= msgList.getE03DEAOAM()%></a></td>            
            <td NOWRAP  align=LEFT width="25%"><a href="javascript:goAction('2',<%= EPV015403List.getCurrentRow()%> );"><%= Util.formatCustomDate(currUser.getE01DTF(),msgList.getE03DEAMAM(),msgList.getE03DEAMAD(),msgList.getE03DEAMAY()) %></a></td>            
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
        	if ( EPV015403List.getShowPrev() ) {
      			int pos = EPV015403List.getFirstRec() - 51;
      		    out.print("<A HREF=\"" + request.getContextPath() + "/servlet/datapro.eibs.salesplatform.JSEPV0154?SCREEN=200&FromRecord=" + pos + "\" ><img src=\""+request.getContextPath()+"/images/s/previous_records.gif\" border=0></A>");
        	}
  		 %>
  		 </TD>
  		 <TD WIDTH="50%" ALIGN=RIGHT height="25">
  		 <% 
        	if ( EPV015403List.getShowNext() ) {
      			int pos = EPV015403List.getLastRec();
      		    out.print("<A HREF=\"" + request.getContextPath() + "/servlet/datapro.eibs.salesplatform.JSEPV0154?SCREEN=200&FromRecord=" + pos + "\" ><img src=\""+request.getContextPath()+"/images/s/next_records.gif\" border=0></A>");
        	}
  		 %>
  		 </TD>
  	</TR>
  </TABLE>
<%}else{%>

<table class="tbenter" width=100% height=80%>
	<tr>
		<td>
		<div align="center">
			<font size="3">
				<b> No hay resultados que correspondan a su criterio de búsqueda. </b>
			</font>
		</div>
		</td>
	</tr>
</table>
<%} %>  
  
     
<SCRIPT type="text/javascript">
	showChecked("CURROW");
/*  	document.getElementById("hiddenDivNew").onclick=cancelBub;
	document.getElementById("eibsNew").onclick=showHiddenDivNew;    */
</SCRIPT>

  </form>

</body>
</html>
