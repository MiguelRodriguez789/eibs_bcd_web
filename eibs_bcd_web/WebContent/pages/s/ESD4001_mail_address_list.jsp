<%@page import="com.datapro.constants.EntitiesHtml"%>
<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@page import="com.datapro.constants.EibsFields"%>
<%@page import="com.datapro.constants.Entities"%>
<%@page import="datapro.eibs.sockets.MessageRecord"%>
<%@page import="datapro.eibs.beans.ESD400101Message"%>

<html>
<head>  

<style type="text/css">
ul.addressList{
	list-style-type: none;
}


ul.addressList{
	font-weight: bold;
	font-style : italic;
	cursor: pointer;
}

ul.addressList:HOVER{
	font-weight: normal;
	cursor: pointer;
	font-style: normal;
}
</style>
  
<title>Direcciones</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/fonts/css/font-awesome.min.css" rel="stylesheet">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "ESD400101List" class= "datapro.eibs.beans.JBObjList"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>

<script type="text/javascript">

   <% String menu = EntitiesHtml.getMenu(userPO);%>
   builtNewMenu(<%=menu%>);

function goNew() {
	document.getElementById("SCREEN").value="300";
	document.forms[0].submit();
}

function goMant() {
	document.getElementById("SCREEN").value="500";
	document.forms[0].submit();
}


function goInquiry() {
	var pg = "<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSESD4001?SCREEN=900&ROW="+getElementChecked('ROW').value;  
	CenterWindow(pg,600,500,2);
}

function goApproval() {
    var pg = "<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSESD4001?SCREEN=500&ROW="+getElementChecked('ROW').value;
	CenterWindow(pg,600,500,2);	
}

function goDelete() {
	document.getElementById("SCREEN").value="700";
	document.forms[0].submit();
}

<%  
String title = EntitiesHtml.getTitle(userPO.getHeader10());
%>

</SCRIPT>  

<% 
 boolean isPerson = userPO.getOption().equals("CLIENT_P");
 if ( !error.getERRNUM().equals("0")  ) {
     error.setERRNUM("0");
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
 }
    out.println("<SCRIPT> initMenu(); </SCRIPT>");
%>

</head>

<BODY>
<h3 align="center"> <%= title %><img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="mail_address_list.jsp, ESD4001"></h3>
<hr size="4">
<FORM name="form1" METHOD="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSESD4001" >
  <p> 
	<input type=HIDDEN name="SCREEN" id="SCREEN" value="800">
    <input type=HIDDEN name="TOTROWS" id="TOTROWS" value="0">
    <input type=HIDDEN name="opt" id="opt" value="1">
	<INPUT TYPE=HIDDEN name="actRow" id="actRow" value="0">
	<INPUT TYPE=HIDDEN name="NEXTROWS" id="NEXTROWS" value="0">
	<INPUT TYPE=HIDDEN name="CURRROWS" id="CURRROWS" value="0">
	<INPUT TYPE=HIDDEN name="FromRecord" id="FromRecord" value="0"> 
	<INPUT TYPE=HIDDEN name="num" id="num" value="0"> 
  </p>

 <table class="tableinfo">
  <tr > 
    <td nowrap> 
      <table cellspacing="0" cellpadding="2" width="100%" class="tbhead" align="center">
        <tr>
             <td nowrap width="10%" align="right"> Cliente: 
               </td>
          <td nowrap width="12%" align="left">
      			<%= userPO.getHeader1()%>
          </td>
            <td nowrap width="6%" align="right">ID:  
            </td>
          <td nowrap width="14%" align="left">
      			<%= userPO.getHeader2()%>
          </td>
            <td nowrap width="8%" align="right"> Nombre: 
               </td>
          <td nowrap width="50%"align="left">
      			<%= userPO.getHeader3()%>
          </td>
        </tr>
      </table>
    </td>
  </tr>
 </table>

 
  <p> 
 <%
	if ( ESD400101List.getNoResult() ) {
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
             <%if  (userPO.getPurpose().equals("MAINTENANCE")) { %>
            
               <tr>
                   <td class=TDBKG width="30%"> 
                     <div align="center"><a href="javascript:goNew()"><b>Crear</b></a></div>              
                   </td>
               </tr>
            <%} %>	    
               
          </table>
          <p>&nbsp;</p>
          
        </div>

	  </TD>
	</TR>
    </TABLE>
	
  <% } else { %>
<% 
 if ( !error.getERRNUM().equals("0")  ) {
     error.setERRNUM("0");
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
     }

%> 
  <p> 
          
  <table class="tbenter" width=100% align=center>
      <%if  (userPO.getPurpose().equals("MAINTENANCE")) { %>
   
        <tr> 
          <td class=TDBKG width="30%"> 
		     <div align="center"><a href="javascript:goNew()"><b>Crear</b></a></div>
          </td>
		  <td class=TDBKG width="30%"> 
             <div align="center"><a href="javascript:goMant()"><b>Modificar</b></a></div>
          </td>
	      <td class=TDBKG width="30%"> 
            <div align="center"><a href="javascript:goDelete()"><b>Borrar</b></a></div>
          </td>
        </tr>
     <%} else {%>
          <%if  (userPO.getPurpose().equals("INQUIRY")) { %>
            <tr> 
              <td class=TDBKG width="30%"> 
		        <div align="center"><a href="javascript:goInquiry()"><b>Consultar</b></a></div>
              </td>
            </tr>       
          <%} else {%>
            <tr> 
              <td class=TDBKG width="30%"> 
		        <div align="center"><a href="javascript:goApproval()"><b>Visualizar</b></a></div>
              </td>
            </tr>
          <%} %>   
     <%} %> 
        
  </table>
   
  <br>
  <table  id=cfTable class="tableinfo">
    <tr > 
      <td NOWRAP valign="top" width="100%"> 
        <table id="headTable" width="100%">
          <tr id="trdark"> 
            <th align=center nowrap width="5%">&nbsp;</th>
            <th align=center nowrap width="5%"> Numero</th>
            <th align=center nowrap width="20%"> Nombre</th>
            <th align=center nowrap width="20%"> Pais</th>
            <th align=center nowrap width="40%"> Direcci&oacute;n</th>
            <th align=center nowrap width="10%"> Estado</th>  
			</tr>
        </table>
      </td>
    </tr>    
		  <tr>    
		    <td nowrap="nowrap">      
		       <div id="dataDiv1" style="height:300px; overflow:auto;"> 
		       <table id="dataTable" cellspacing="0" cellpadding="1" border="0" width="100%">
          
          <%
    	  int i = 0;
          ESD400101List.initRow();
				boolean firstTime = true;
				String chk = "";
          while (ESD400101List.getNextRow()) {
					if (firstTime) {
						firstTime = false;
						chk = "checked";
					} else {
						chk = "";
					}
            ESD400101Message msgList = (ESD400101Message) ESD400101List.getRecord();	 
            
         %>   
             
          
		<tr id="dataTable<%= ESD400101List.getCurrentRow() %>" style="vertical-align: top;">
			<td nowrap align="center" width="5%"><input type="radio" name="ROW" value="<%=ESD400101List.getCurrentRow()%>" <%=chk%> class="highlight" onClick="highlightRow('dataTable', <%= ESD400101List.getCurrentRow() %>)"/></td>
            <td NOWRAP  align="center" width="5%"> <%= msgList.getE01CUMMAN() %></td>
            <td NOWRAP  align="left" width="20%"><%= msgList.getE01CUMMA1() %></td>
            <td NOWRAP  align="left" width="20%"><%= msgList.getE01CUMADC() %>-<%= msgList.getE01CUMCTR() %></td>
            <td NOWRAP  align=left width="40%">
				<ul class="addressList"> 
					<li><%= msgList.getE01CUMAD1() %> 
						<% if( !"".equals(msgList.getE01CUMAD1().trim())){ %>
						 <i class="fa fa-plus-square fa-fw plusIcon" > ...</i>
						 <% } %>
					</li>
					<% if( !"".equals(msgList.getE01CUMAD2().trim())){ %><li><%= msgList.getE01CUMAD2() %></li> <% } %>
					<% if( !"".equals(msgList.getE01CUMAD3().trim())){ %><li><%= msgList.getE01CUMAD3() %></li> <% } %>
					<% if( !"".equals(msgList.getE01CUMAD4().trim())){ %><li><%= msgList.getE01CUMAD4() %></li> <% } %>
				</ul>           
            </td>
            <td NOWRAP  align=left width="10%"><%= msgList.getD01CUMRTY() %></td> 
          </tr>
          
            <% i++; } %> 
             </table>
             </div>
             </td>
             </tr>
</table>
     
<SCRIPT type="text/javascript">
	showChecked("ROW");
    document.getElementById("TOTROWS").value = <%= i %>;
	document.getElementById("NEXTROWS").value = <%= ESD400101List.getLastRec()%>;
	document.getElementById("CURRROWS").value = <%= ESD400101List.getFirstRec()%>;

	var hideAddress = function(){
		$(".addressList ").each(function(index) {
			$(this).find('li').each(function(index){
				if(index >= 1){
		    		$(this).hide();
				}
			});
		});
		$('.plusIcon').show();
	};
	
	var showAddress = function(){
		$(this).find('li').show();
		$(this).find('.plusIcon').hide();
	};
	
	
     
	$().ready(function(){   
		hideAddress();
		$('.plusIcon').show();
		$(".addressList").hover(showAddress, hideAddress);
	}); 
</SCRIPT>

<%}%>
	

  </form>

</body>
</html>
