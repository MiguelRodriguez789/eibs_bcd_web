<%@ page import = "datapro.eibs.master.Util" %>
<html>
<head>
<title>Canales</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "ESD036001Help" class= "datapro.eibs.beans.JBObjList"  scope="session" />
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

function showHiddenDivNew(evt) {
	evt = (evt) ? evt : ((window.event) ? window.event : "");
 	
	var hiddenDivNew = document.getElementById("hiddenDivNew");

	var y=evt.clientY + document.body.scrollTop;
	var x=evt.clientX + document.body.scrollLeft;
     
	cancelBub(evt);

	moveElement(hiddenDivNew, y, x);
	setVisibility(hiddenDivNew, "visible");
	 
}

addEventHandler(document, 'click' , closeHiddenDivNew);


</SCRIPT>  

</head>

<BODY>
<h3 align="center">Tabla de Definiciones de Canales <img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="canal_table_list.jsp, ESD0360"></h3>
<hr size="4">
<FORM name="form1" METHOD="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.params.JSESD0360" >
  <p> 
    <input type=HIDDEN name="SCREEN" id="SCREEN" value="800">
    <input type=HIDDEN name="totalRow" id="totalRow" value="0">
    <input type=HIDDEN name="opt" id="opt" >
  </p>
  
  <p> 
    <%
	if ( ESD036001Help.getNoResult() ) {
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
          <table class="tbenter" width=100% align=center>
            <tr> 
              <td class=TDBKG width="50%"> 
                <div align="center"><a href="javascript:goAction(1)"><b>Crear</b></a></div>
              </td>
              <td class=TDBKG width="50%"> 
                <div align="center"><a href="<%=request.getContextPath()%>/pages/background.jsp"><b>Salir</b></a></div>
              </td>
            </tr>
          </table>
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
            <input type="text" id="E01CNLCOD" name="E01CNLCOD" size="5" maxlength="6">
          </div>
        </td>
      </tr>
      <tr id="trclear"> 
        <td align=CENTER width="18%"> 
          <div align="right">Nuevo Centro Respons:</div>
        </td>
        <td align=CENTER width="34%"> 
          <div align="left"> 
            <input type="text" id="E01CNLRES" name="E01CNLRES" size="5" maxlength="6">
          </div>
        </td>
      <tr id="trclear"> 
        <td align=center nowrap colspan="2"> 
          <input id="EIBSBTN" type=button name="Submit" value="Enviar" onClick="javascript:goAction('1')">
        </td>
      </tr>
    </table>
  </div>



 
          
  <table class="tbenter" width=100% align=center height="8%">
    <tr> 
		<td align="center" id="eibsNew" class="tdbkg" width="25%"><b>Crear</b>
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
  
  <TABLE  id="mainTable" class="tableinfo" style="height:400px;">
    <tr  height="5%"> 
      <td NOWRAP valign="top" width="100%"> 
		<table id="headTable" width="98%">
			<tr id="trdark">
	            <th align=CENTER nowrap width="5%">&nbsp;</th>
	            <th align=CENTER nowrap width="20%">C&oacute;digo</th>
	            <th align=LEFT nowrap width="75%">Descripci&oacute;n</th>
			</tr>
        </table>
      </td>
    </tr>    
		  <tr  height="95%">    
		    <td nowrap="nowrap">      
		       <div id="dataDiv1" style="height:400px; overflow:auto;"> 
		       <table id="dataTable" cellspacing="0" cellpadding="1" border="0" width="100%">         
         <%
                ESD036001Help.initRow();
				boolean firstTime = true;
				String chk = "";
        		while (ESD036001Help.getNextRow()) {
					if (firstTime) {
						firstTime = false;
						chk = "checked";
					} else {
						chk = "";
					}
                  	datapro.eibs.beans.ESD036001Message msgList = (datapro.eibs.beans.ESD036001Message) ESD036001Help.getRecord();
		 %>
          <tr id="dataTable<%= ESD036001Help.getCurrentRow() %>"> 
            <td NOWRAP  align=CENTER width="5%"><input type="radio" name="CURRCODE" value="<%= ESD036001Help.getCurrentRow() %> "  <%=chk%> onClick="highlightRow('dataTable', <%= ESD036001Help.getCurrentRow() %>)"></td>
            <td NOWRAP  align=CENTER width="20%"><%= msgList.getE01CNLCOD() %></td>
            <td NOWRAP  align=LEFT width="75%"><%= msgList.getE01CNLDSC() %></td>
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
        	if ( ESD036001Help.getShowPrev() ) {
      			int pos = ESD036001Help.getFirstRec() - 51;
      		    out.print("<A HREF=\"" + request.getContextPath() + "/servlet/datapro.eibs.params.JSESD0360?SCREEN=100&FromRecord=" + pos + "\" ><img src=\""+request.getContextPath()+"/images/s/previous_records.gif\" border=0></A>");
        	}
  		 %>
  		 </TD>
  		 <TD WIDTH="50%" ALIGN=RIGHT height="25">
  		 <% 
        	if ( ESD036001Help.getShowNext() ) {
      			int pos = ESD036001Help.getLastRec();
      		    out.print("<A HREF=\"" + request.getContextPath() + "/servlet/datapro.eibs.params.JSESD0360?SCREEN=100&FromRecord=" + pos + "\" ><img src=\""+request.getContextPath()+"/images/s/next_records.gif\" border=0></A>");
        	}
  		 %>
  		 </TD>
  	</TR>
  </TABLE>
     
<SCRIPT type="text/javascript">
	showChecked("CURRCODE");
 	document.getElementById("hiddenDivNew").onclick=cancelBub;
	document.getElementById("eibsNew").onclick=showHiddenDivNew;  
</SCRIPT>
<%}%>

  </form>

</body>
</html>
