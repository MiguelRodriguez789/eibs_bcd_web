<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>

<%@page import="com.datapro.constants.EibsFields"%>

<%@page import="datapro.eibs.sockets.MessageRecord"%>
<%@page import="datapro.eibs.beans.EDD400701Message"%>

<html>
<head>
  
<title>Otras Exigencias CNBS</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "EDD400701List" class= "datapro.eibs.beans.JBObjList"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>

<script type="text/javascript">

  
         <% if ( userPO.getOption().equals("RT") ) { %>
		     builtNewMenu(rt_m_opt);
         <% } else {  %>
		     builtNewMenu(sv_m_opt);
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
			    //document.forms[0].E01MAN.value = document.forms[0].elements[n].value;
				ok = true;
				break;
			}
      	}
    }
}

<%  
 String title = "Otras Exigencias CNBS";
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
<h3 align="center"> <%= title %><img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="cnbs_list.jsp, EDD4007"></h3>
<hr size="4">
<FORM name="form1" METHOD="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDD4007" >
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
         <tr id="trdark"> 
            <td nowrap width="16%" > 
              <div align="right"><b>Cliente :</b></div>
            </td>
            <td nowrap width="20%" > 
              <div align="left"> 
                <input type="text" name="E04DEACUN" size="9" maxlength="9" readonly value="<%= userPO.getHeader2().trim() %>">
              </div>
            </td>
            <td nowrap width="16%" > 
              <div align="right"><b>Nombre :</b> </div>
            </td>
            <td nowrap colspan="3" > 
              <div align="left"> 
                <input type="text" name="E04CUSNA1" size="45" maxlength="45" readonly value="<%= userPO.getHeader3().trim()%>">
              </div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="16%"> 
              <div align="right"><b>Cuenta :</b></div>
            </td>
            <td nowrap width="20%"> 
              <div align="left"> 
                <input type="text" name="E06ACC" size="12" maxlength="12" value="<%= userPO.getIdentifier().trim()%>" readonly >
              </div>
            </td>
            <td nowrap width="16%"> 
              <div align="right"><b>Moneda :</b></div>
            </td>
            <td nowrap width="16%"> 
              <div align="left"> 
                <input type="text" name="E01DEACCY" size="3" maxlength="3" value="<%= userPO.getCurrency().trim()%>" readonly>
              </div>
            </td>
            <td nowrap width="16%"> 
              <div align="right"><b>Producto :</b></div>
            </td>
            <td nowrap width="16%"> 
              <div align="left"> 
                <input type="text" name="E04DEAPRO" size="5" maxlength="4" readonly value="<%= userPO.getHeader1().trim()%>">
              </div>
            </td>
          </tr>
      </table>
    </td>
  </tr>
 </table>

 
  <p> 
 <%
	if ( EDD400701List.getNoResult() ) {
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
                   <td class=TDBKG width="30%"> 
                     <div align="center"><a href="javascript:goNew()"><b>Crear</b></a></div>              
                   </td>
                   <td class=TDBKG width="30%"> 
                     <div align="center"><a href="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEXEDD0000?SCREEN=3"><b>Regresar</b></a></div>
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
  <p> 
          
  <table class="tbenter" width=100% align=center>
    
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
          <% if ( userPO.getOption().equals("RT") ) { %>
          <td class=TDBKG width="30%"> 
             <div align="center"><a href="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEXEDD0000?SCREEN=3"><b>Salir</b></a></div>
          </td>
          <% } %>
          <% if ( userPO.getOption().equals("SV") ) { %>
            <td class=TDBKG width="30%"> 
              <div align="center"><a href="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEXEDD0000?SCREEN=27"><b>Salir</b></a></div>
             </td>
          <% } %> 
         </tr>
    
        
  </table>
   
  <br>
  <table  id=cfTable class="tableinfo">
    <tr > 
      <td NOWRAP valign="top" width="100%"> 
        <table id="headTable" width="100%">
          <tr id="trdark"> 
            <th align=center nowrap width="5%">&nbsp;</th>
            <th align=center nowrap width="10%"> N&uacute;mero Exigencia</th>
            <th align=center nowrap width="10%"> Prop&oacute;sito</th>
            <th align=center nowrap width="10%"> Procedenc&iacute;a</th>
            <th align=center nowrap width="10%"> Status</th>
          </tr>
          
          <%
    	  int i = 0;
          EDD400701List.initRow();    
          while (EDD400701List.getNextRow()) {
            EDD400701Message msgList = (EDD400701Message) EDD400701List.getRecord();	 
         %>   
             
          
          <tr> 
            
            <td NOWRAP align="center" width="5%">
           	  <INPUT TYPE="radio" name="ROW"  value="<%= msgList.getE01MAN()%>"
           	  <% if (EDD400701List.getCurrentRow() == 0) out.print(" checked"); %>>
		    </td>
		    <td NOWRAP  align=center width=\"10%\"><%= msgList.getE01MAN() %></td>
            <td NOWRAP  align=center width=\"10%\"><%= msgList.getE01MA1() %></td>
            <td NOWRAP  align=center width=\"10%\"><%= msgList.getE01MA2() %></td>
            <td NOWRAP  align=left width=\"40%\"><%= msgList.getD01RTY() %></td>
            
          </tr>
          
            <% 
       	       i++; 
              } 
             %> 
        </table>
  </table>
     
<SCRIPT type="text/javascript">
    document.forms[0].TOTROWS.value = <%= i%>;
	document.forms[0].NEXTROWS.value = <%= EDD400701List.getLastRec()%>;
	document.forms[0].CURRROWS.value = <%= EDD400701List.getFirstRec()%>;
     
</SCRIPT>

<%}%>
	

  </form>

</body>
</html>
