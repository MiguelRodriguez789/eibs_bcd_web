<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput"%>
<%@ page import="datapro.eibs.master.Util,datapro.eibs.beans.EDL052201Message"%>
<%@page import="com.datapro.constants.EibsFields"%>

<html>
<head>
<title>Tablas de Presvisiones</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "EDL052201Help" class= "datapro.eibs.beans.JBObjList"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>

<script language="JavaScript">



function goAction(op) {

	getElement("opt").value = op;
	if (op == '3') {
    	if (confirm("Desea eliminar este registro seleccionado?")) {
			document.forms[0].submit();		
    	}
  	} else {
		document.forms[0].submit();		
	}	
  
}

function getParams(bank,branch) {

    getElement("BANK").value = account;
    getElement("BRANCH").value = branch;
}


</SCRIPT>  

</head>

<BODY>
<h3 align="center">Tablas de Previsiones<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="previsions_list.jsp, EDL0522"></h3>
<hr size="4">
<FORM name="form1" METHOD="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.params.JSEDL0522" >
  <p> 
    <input type=HIDDEN name="SCREEN" id="SCREEN" value="800">
    <input type=HIDDEN name="totalRow" id="totalRow" value="0">
    <input type=HIDDEN name="BANK" id="BANK" >
    <input type=HIDDEN name="BRANCH" id="BRANCH" >
    <input type=HIDDEN name="opt" id="opt" >
  </p>
  <p> 
<% if ( EDL052201Help.getNoResult() ) { %>
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
              <td class=TDBKG width="30%"> 
                <div align="center"><a href="javascript:goAction(1)"><b>Crear</b></a></div>
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
	
  <% } else { %> 
  <% if ( !error.getERRNUM().equals("0")  ) {
     error.setERRNUM("0");
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
     }
  %> 
  <p> 

          
  <table class="tbenter" width=100% align=center>
    <tr> 
      <td class=TDBKG width="25%"> 
        <div align="center"><a href="javascript:goAction(1)"><b>Crear</b></a></div>
      </td>
      <td class=TDBKG width="25%"> 
        <div align="center"><a href="javascript:goAction(2)"><b>Modificar</b></a></div>
      </td>
      <td class=TDBKG width="25%"> 
        <div align="center"><a href="javascript:goAction(3)"><b>Borrar</b></a></div>
      </td>
      <td class=TDBKG width="25%"> 
        <div align="center"><a href="<%=request.getContextPath()%>/pages/background.jsp"><b>Salir</b></a></div>
      </td>
    </tr>
  </table>
   
  <br>
  
  <%int row = 0; %>
  <table  id=cfTable class="tableinfo" height="55%">
    <tr  height="5%"> 
      <td NOWRAP valign="top" width="100%"> 
		<table id="headTable" width="98%">
			<tr id="trdark">
	            <th align=CENTER nowrap width="2%">&nbsp;</th>
	            <th align=CENTER nowrap width="10%">Tabla</th>
	            <th align=CENTER nowrap width="40%"> 
	              <div align="left">Descripci&oacute;n</div>
	            </th>
			</tr>
        </table>
      </td>
    </tr>    
		  <tr  height="95%">    
		    <td nowrap="nowrap">      
		       <div id="dataDiv1" style="height:400px; overflow:auto;"> 
		       <table id="dataTable" cellspacing="0" cellpadding="1" border="0" width="100%">         

          <%
                EDL052201Help.initRow();
				boolean firstTime = true;
				String chk = "";
                while (EDL052201Help.getNextRow()) {
					if (firstTime) {
						firstTime = false;
						chk = "checked";
					} else {
						chk = "";
					}
					EDL052201Message msgList = (EDL052201Message) EDL052201Help.getRecord();
          %>
          <tr id="dataTable<%= EDL052201Help.getCurrentRow() %>"> 
            <td NOWRAP  align=CENTER width="2%"> 
              <input type="radio" name="CURRCODE" id="CURRCODE" value="<%= EDL052201Help.getCurrentRow() %>" <%=chk%> class="highlight" onClick="highlightRow('dataTable', <%= EDL052201Help.getCurrentRow() %>)" >
            </td>
            <td NOWRAP  align=CENTER width="10%"><%= msgList.getE01PRVTBL() %></td>
            <td NOWRAP  align=left width="40%"><%= msgList.getE01PRVDSC() %></td>
          </tr>
          <%
                }
              %>
             </table>
             </div>
             </td>
             </tr>
</table>
     
<SCRIPT language="JavaScript">
 	showChecked("CURRCODE");
</SCRIPT>

<%}%>


  </form>

</body>
</html>
