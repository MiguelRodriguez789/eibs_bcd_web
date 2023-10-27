<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>

<%@page import="com.datapro.constants.EibsFields"%>
<%@page import="com.datapro.constants.Entities"%>
<%@page import="datapro.eibs.sockets.MessageRecord"%>
<%@page import="datapro.eibs.beans.ESD401001Message"%>
<html>
<head>  
  
<title>Referencias</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "ESD401001List" class= "datapro.eibs.beans.JBObjList"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>

<script type="text/javascript">


   <% if (userPO.getPurpose().equals("APPROVAL_INQ")) {%>
		<% if ( userPO.getOption().equals("CLIENT_P") ) { %>
		     builtNewMenu(client_ap_personal_opt);
         <% } else {  %>
		     builtNewMenu(client_ap_corp_opt);
         <% } %>
   <% } else { %>

   <% if (userPO.getPurpose().equals("INQUIRY")) { %>
	    <% if ( userPO.getOption().equals("CLIENT_P") ) { %>
		     builtNewMenu(client_inq_personal_opt);
         <% } else {  %>
		     builtNewMenu(client_inq_corp_opt);
         <% } %>	 
   <%} else {%>
         <% if ( userPO.getOption().equals("CLIENT_P") ) { %>
		     builtNewMenu(client_personal_opt);
         <% } else {  %>
		     builtNewMenu(client_corp_opt);
         <% } %>
   <% } %> 
   <% } %>  
     

function goNew() {
	document.forms[0].SCREEN.value="300";
	document.forms[0].submit();
}

function goMant() {
	isCheck();
	if (!ok) {
		alert("Por Favor Seleccione Registro!");
		return;	 
	}
	document.forms[0].SCREEN.value="500";
	document.forms[0].submit();
}


function goInquiry() {
    isCheck();
	if (!ok) {
		alert("Por Favor Seleccione Registro!");
		return;	 
	}
	var row = document.forms[0].actRow.value;
	var pg = "";
	pg = "<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSESD4010?SCREEN=900&ROW="+row;  
	CenterWindow(pg,600,500,2);
}

function goApproval() {
    isCheck();
	if (!ok) {
		alert("Por Favor Seleccione Registro!");
		return;	 
	}
	var row = document.forms[0].actRow.value;
    var pg = "";
	pg = "<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSESD4010?SCREEN=500&ROW="+row;
	CenterWindow(pg,600,500,2);	
}

function goDelete() {

    isCheck();
	if ( !ok ) {
		alert("Por favor seleccione el registro!!!");
		return;	 
	}
	document.forms[0].SCREEN.value="700";
	document.forms[0].submit();
}

function isCheck() {
	var formLength= document.forms[0].elements.length;
   	ok = false;
	for(n=0;n<formLength;n++) {
     	var elementName= document.forms[0].elements[n].name;
      	if(elementName == "ROW") {
			if (document.forms[0].elements[n].checked == true) {
			    document.forms[0].actRow.value = document.forms[0].elements[n].value;
				ok = true;
				break;
			}
      	}
    }
}

<%  
String subtitle = "";
if (userPO.getHeader10().equals(Entities.ENTITY_TYPE_BANK_REFERENCES)){
	subtitle = " Bancarias";
} else if (userPO.getHeader10().equals(Entities.ENTITY_TYPE_COMMERCIAL_REFERENCES)){
	subtitle = " Comerciales";
} else if (userPO.getHeader10().equals(Entities.ENTITY_TYPE_CONTACT)){
	subtitle = " Contactos";
} else if (userPO.getHeader10().equals(Entities.ENTITY_TYPE_FAMILY_REFERENCES)){
	subtitle = " Familiares";
} else if (userPO.getHeader10().equals(Entities.ENTITY_TYPE_DEPENDENTS)){
	subtitle = " Dependientes";
} else {
	subtitle = " Personales";
}
%>
</SCRIPT>  

<% 
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
<h3 align="center"> Referencias <%= subtitle %> <img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="reference_list.jsp, ESD4010"></h3>
<hr size="4">
<FORM name="form1" METHOD="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSESD4010" >
  <p> 
	<input type=HIDDEN name="SCREEN" value="800">
    <input type=HIDDEN name="TOTROWS" value="0">
    <input type=HIDDEN name="opt" value="1">
	<INPUT TYPE=HIDDEN name="actRow" value="0">
	<INPUT TYPE=HIDDEN name="NEXTROWS" value="0">
	<INPUT TYPE=HIDDEN name="CURRROWS" value="0">
	<INPUT TYPE=HIDDEN name="FromRecord" value="0"> 
	<INPUT TYPE=HIDDEN name="num" value="0"> 
  </p>

 <table class="tableinfo">
  <tr > 
    <td nowrap> 
      <table cellspacing="0" cellpadding="2" width="100%" class="tbhead" bgcolor="#FFFFFF" bordercolor="#FFFFFF" align="center">
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
	if ( ESD401001List.getNoResult() ) {
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
                   <td class=TDBKG width="30%"> 
                     <div align="center"><a href="<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSESD0080?SCREEN=1"><b>Regresar</b></a></div>
                   </td>
               </tr>
            <%} else {%>
                  <%if  (userPO.getPurpose().equals("INQUIRY")) { %>
                    <tr>
                      <td class=TDBKG width="30%"> 
                        <div align="center"><a href="<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSESD0080?SCREEN=1"><b>Regresar</b></a></div>
                      </td>
                    </tr>
                   <%} else {%> 
                       <tr>
                         <td class=TDBKG width="30%"> 
                           <div align="center"><a href="<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSESD0080A?SCREEN=1"><b>Regresar</b></a></div>
                         </td>
                       </tr>
                   <%} %>  
            <%} %>	    
               
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
            <th align=center nowrap width="40%"> Referencia </th>
            <th align=center nowrap width="40%"> Datos de la Referencia</th>
            <th align=center nowrap width="10%"> Estado</th>
          </tr>
          
          <%
    	  int i = 0;
          ESD401001List.initRow();
          while (ESD401001List.getNextRow()) {
            ESD401001Message msgList = (ESD401001Message) ESD401001List.getRecord();	 
         %>   
             
          
          <tr> 
            
            <td NOWRAP align="center" width="5%">
           	  <INPUT TYPE="radio" name="ROW" value="<%= msgList.getE01MAN()%>" 
           	  	<% if (ESD401001List.getCurrentRow() == 0) out.print(" checked"); %>>
		    </td>
            <td NOWRAP  align=left width=\"40%\"><%= msgList.getE01CTY() %>, <%= msgList.getE01MA1() %></td>
            <td NOWRAP  align=left width=\"40%\"> <%= msgList.getE01MA3() %>, <%= msgList.getE01HPN() %><br>
            	<%= msgList.getE01BNC() %>, <%= msgList.getE01MA2() %><br>
            	<%= msgList.getE01DTD() %>/<%= msgList.getE01DTM() %>/<%= msgList.getE01DTY() %>  <%= msgList.getE01RTY() %> <br>
            </td>
            <td NOWRAP  align=left width=\"10%\"><%= msgList.getD01RTX() %></td>
            
          </tr>
          
            <% 
				i++; 
              } 
             %> 
        </table>
  </table>
     
<SCRIPT type="text/javascript">
    document.forms[0].TOTROWS.value = <%= i %>;
	document.forms[0].NEXTROWS.value = <%= ESD401001List.getLastRec()%>;
	document.forms[0].CURRROWS.value = <%= ESD401001List.getFirstRec()%>;
     
</SCRIPT>

<%}%>
	

  </form>

</body>
</html>
