<%@ page import = "datapro.eibs.master.Util" %>
<html>
<head>
<title>Codigos de Referencia del Sistema</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "msgtable" class= "datapro.eibs.beans.ESD003001Message"  scope="session" />
<jsp:useBean id= "ESD003002Help" class= "datapro.eibs.beans.JBObjList"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>
 
 


<script type="text/javascript">



function goAction(op) {

	document.getElementById("opt").value = op;
	if (op == 9 ) {
		document.forms[0].SCREEN.value = '150';
	}
	document.forms[0].submit();
  
}
function getParameters(idx) {
	for ( var i=0; i<dataTable.rows.length; i++ ) {
       dataTable.rows[i].className="trnormal";
	}
    dataTable.rows[idx].className="trhighlight";
  
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
<h3 align="center">C&oacute;digos de Referencia del Sistema <br> <%= msgtable.getE01CNOTCN().trim()%> - <%= msgtable.getE01CNODCN().trim()%>
	<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="cnof_reference_list.jsp, ESD0030"> 
	 </h3>

<hr size="4">
<FORM name="form1" METHOD="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.params.JSESD0030" >
  <p> 
    <input type=HIDDEN name="SCREEN" id="SCREEN" value="800">
    <input type=HIDDEN name="totalRow" id="totalRow" value="0">
    <input type=HIDDEN name="opt" id="opt">
    <input type=HIDDEN name="REFCODE" id="REFCODE">
	<input type=HIDDEN name="TBLCODE" id="TBLCODE" value="<%= msgtable.getE01CNOTCN().trim()%>">
	<input type=HIDDEN name="TBLDESC" id="TBLDESC" value="<%= msgtable.getE01CNODCN().trim()%>">
	<input type=HIDDEN name="E01CNOFLD" id="E01CNOFLD" value="<%=(request.getParameter("E01CNOFLD")!=null?request.getParameter("E01CNOFLD"):"4")%>">
  </p>
  
  <p> 
    <%
	if ( ESD003002Help.getNoResult() ) {
 %>
  </p>
  <p>&nbsp;</p>
  <p>&nbsp;</p>
  <p>&nbsp;</p>
  <p>&nbsp;</p>
  <p>&nbsp;</p>
  

  <TABLE class="tbenter" width="100%" align=center height="8%">
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
                <div align="center"><a href="javascript:goAction(9)"><b>Salir</b></a></div>
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
        <div align="center"><a href="javascript:goAction(9)"><b>Salir</b></a></div>
      </td>
    </tr>
  </table>
  <br>

 <table  id="mainTable" class="tableinfo" ALIGN=CENTER style="width:'100%'" height="70%">
    <tr height="5%"> 
    	<td NOWRAP valign="top" width="100%"> 
        	<table id="headTable" width="100%">
           <tr id="trdark"> 
            		<th align=CENTER nowrap width="5%">&nbsp;</th>
            		<th align=CENTER nowrap width="20%">C&oacute;digo</th>
            		<th align=CENTER nowrap width="75%">Descripci&oacute;n</th>
          		</tr>
        	</table>
      	</td>
    </tr>    
    <tr height="95%">    
     <td valign="top">       
	    <div id="dataDiv1" class="scbarcolor" style="height:400px;  overflow:auto;">
    		<table id="dataTable" width="100%" > 
<%
                ESD003002Help.initRow();
				boolean firstTime = true;
				String chk = "";
        		while (ESD003002Help.getNextRow()) {
					if (firstTime) {
						firstTime = false;
						chk = "checked";
					} else {
						chk = "";
					}
                  	datapro.eibs.beans.ESD003002Message msgList = (datapro.eibs.beans.ESD003002Message) ESD003002Help.getRecord();
%>
          <tr id="dataTable<%= ESD003002Help.getCurrentRow() %>"> 
            <td NOWRAP  align=CENTER width="5%"> 
              <input type="radio" name="CURRCODE" id="CURRCODE" value="<%= ESD003002Help.getCurrentRow() %> "  <%=chk%> class="highlight" 
				onClick="javascript:getParameters(<%= ESD003002Help.getCurrentRow() %>);"
			  >
            </td>
            <td NOWRAP  align=CENTER width="20%"><%= msgList.getE02SETRCD() %></td>
            <td NOWRAP  align=LEFT width="75%"><%= msgList.getE02CNODSC() %></td>
          </tr>
          <%
                }
              %>
              </table>
        	</div>
    	</td>
    </tr>
  </table>
     
  <SCRIPT type="text/javascript">
 showChecked("CURRCODE");
     
</SCRIPT>

<%}%>


  </form>

</body>
</html>
