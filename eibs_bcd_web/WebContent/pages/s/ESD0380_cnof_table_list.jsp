<%@ page import = "datapro.eibs.master.Util" %>
<html>
<head>
<title>Table de Codigos del Sistema</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "ESD038001Help" class= "datapro.eibs.beans.JBObjList"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>
 
 


<script type="text/javascript">



function goAction(op) {

	document.getElementById("opt").value = op;
	document.forms[0].submit();
  
}

function goDelete() {

	if(confirm("Esta seguro que desea borrar este codigo?")){
		document.getElementById("opt").value = 3;
		document.forms[0].submit();
	}
}

</SCRIPT>  

</head>

<BODY>
<h3 align="center">Tablas de C&oacute;digos del Sistema<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="cnof_table_list.jsp, ESD0380"></h3>
<hr size="4">
<FORM name="form1" METHOD="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.params.JSESD0380" >
  <p> 
    <input type=HIDDEN name="SCREEN" value="800">
    <input type=HIDDEN name="totalRow" value="0">
    <input type=HIDDEN name="opt" id="opt">
  </p>
  
  <p> 
    <%
	if ( ESD038001Help.getNoResult() ) {
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
 
          
  <table class="tbenter" width=100% align=center height="8%">
    <tr> 
      <td class=TDBKG width="25%"> 
        <div align="center"><a href="javascript:goAction(1)"><b>Crear</b></a></div>
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
  <table  id=cfTable class="tableinfo" height="55%">
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
                ESD038001Help.initRow();
				boolean firstTime = true;
				String chk = "";
        		while (ESD038001Help.getNextRow()) {
					if (firstTime) {
						firstTime = false;
						chk = "checked";
					} else {
						chk = "";
					}
                  	datapro.eibs.beans.ESD038001Message msgList = (datapro.eibs.beans.ESD038001Message) ESD038001Help.getRecord();
		 %>
          <tr id="dataTable<%= ESD038001Help.getCurrentRow() %>"> 
            <td NOWRAP  align=CENTER width="5%"><input type="radio" name="CURRCODE" id="CURRCODE" value="<%= ESD038001Help.getCurrentRow() %>"  <%=chk%> class="highlightRow" onClick="highlightRow('dataTable', this.value)"></td>
            <td NOWRAP  align=CENTER width="25%"><%= msgList.getE01CNOTCN() %></td>
            <td NOWRAP  align=LEFT width="70%"><%= msgList.getE01CNODCN() %></td>
          </tr>
          <%
                }
              %>
              </table>
             </div>
             </td>
             </tr>
</table>
 
  <TABLE  class="tbenter" WIDTH="98%" ALIGN="center"  height="10%">
  	<TR>
  		 <TD WIDTH="50%" ALIGN=LEFT height="25">
  		 <% 
        	if ( ESD038001Help.getShowPrev() ) {
      			int pos = ESD038001Help.getFirstRec() - 201;
      		    out.print("<A HREF=\"" + request.getContextPath() + "/servlet/datapro.eibs.params.JSESD0380?SCREEN=100&FromRecord=" + pos + "\" ><img src=\""+request.getContextPath()+"/images/s/previous_records.gif\" border=0></A>");
        	}
  		 %>
  		 </TD>
  		 <TD WIDTH="50%" ALIGN=RIGHT height="25">
  		 <% 
        	if ( ESD038001Help.getShowNext() ) {
      			int pos = ESD038001Help.getLastRec();
      		    out.print("<A HREF=\"" + request.getContextPath() + "/servlet/datapro.eibs.params.JSESD0380?SCREEN=100&FromRecord=" + pos + "\" ><img src=\""+request.getContextPath()+"/images/s/next_records.gif\" border=0></A>");
        	}
  		 %>
  		 </TD>
  	</TR>
  </TABLE>
     
<SCRIPT type="text/javascript">
	showChecked("CURRCODE");
</SCRIPT>

<%}%>

  </form>

</body>
</html>
