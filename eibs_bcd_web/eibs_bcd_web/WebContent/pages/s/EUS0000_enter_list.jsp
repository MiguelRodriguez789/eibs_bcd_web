<%@ page import = "datapro.eibs.master.Util" %>
<html>
<head>
<title>Special User Codes</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "EUS000001Help" class= "datapro.eibs.beans.JBObjList"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>

<script type="text/javascript">

function goAction(op) {

	document.forms[0].opt.value = op;
	document.forms[0].submit();
  
}

function getParameters(tablecode) {

	document.forms[0].TABLECODE.value = tablecode;
  
}

</SCRIPT>  

</head>

<BODY>
<h3 align="center">Codigos Especiales de Usuario<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="enter_list.jsp, EUS0000"></h3>
<hr size="4">
<FORM name="form1" METHOD="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.params.JSEUS0000" >
  <p> 
    <input type=HIDDEN name="SCREEN" value="2">
    <input type=HIDDEN name="totalRow" value="0">
    <input type=HIDDEN name="opt">
    <input type=HIDDEN name="TABLECODE">
  </p>

  <p> 
    <%
	if ( EUS000001Help.getNoResult() ) {
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
          <p><b>No hay tablas con esta criteria</b></p>
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
  <p> 

          
  <table class="tbenter" width=100% align=center>
    <tr> 
      <td class=TDBKG width="30%"> 
        <div align="center"><a href="javascript:goAction(2)"><b>Modificar</b></a></div>
      </td>
      <td class=TDBKG width="30%"> 
        <div align="center"><a href="<%=request.getContextPath()%>/pages/background.jsp"><b>Exit</b></a></div>
      </td>
    </tr>
  </table>
   
  <br>
  <table  id=cfTable class="tableinfo" height="55%">
    <tr  height="5%"> 
      <td NOWRAP valign="top" width="100%"> 
		<table id="headTable" width="98%">
			<tr id="trdark">
            		<th align=CENTER nowrap width="10%">&nbsp;</th>
            		<th align=CENTER nowrap width="20%">Clasificacion</th>
            		<th align=CENTER nowrap width="70%">Descripcion </th>
			</tr>
        </table>
      </td>
    </tr>    
		  <tr  height="95%">    
		    <td nowrap="nowrap">      
		       <div id="dataDiv1" style="height:400px; overflow:auto;"> 
		       <table id="dataTable" cellspacing="0" cellpadding="1" border="0" width="100%">         
          <%
                EUS000001Help.initRow();
				boolean firstTime = true;
				String chk = "";
                while (EUS000001Help.getNextRow()) {
					if (firstTime) {
						firstTime = false;
						chk = "checked";
					} else {
						chk = "";
					}
                  datapro.eibs.beans.EUS000001Message msgList = (datapro.eibs.beans.EUS000001Message) EUS000001Help.getRecord();
		 %>
		<tr id="dataTable<%= EUS000001Help.getCurrentRow() %>">
			<td nowrap align="center" width="10%"><input type="radio" id="CURRCODE" name="CURRCODE" value="<%=EUS000001Help.getCurrentRow()%>" <%=chk%> class="highlight" onClick="highlightRow('dataTable', <%= EUS000001Help.getCurrentRow() %>)" onClick="javascript:getParameters('<%= msgList.getE01USTRTY() %>');"/></td>
            <td NOWRAP  align=CENTER width="20%"><%= msgList.getE01USTRTY() %></td>
            <td NOWRAP  align=LEFT width="75%"><%= msgList.getE01USTDES() %></td>
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
 		radioClick("CURRCODE", 0);
			
			function resizeDoc() {
     		 	divResize();
     		         	adjustEquTables(getElement('headTable'),getElement('dataTable'), getElement('dataDiv1'),1,false);
      		}
	 		resizeDoc();   			
     		window.onresize=resizeDoc;        
     </SCRIPT>
  
     


<%}%>


  </form>

</body>
</html>
