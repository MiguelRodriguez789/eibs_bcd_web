<%@ page import ="datapro.eibs.master.Util" %>
<html>
<head>
<title>Archivos de Interface para enviar a Credismart</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<jsp:useBean id= "trans" class= "datapro.eibs.beans.JBListRec"  scope="session" /> 
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />
<jsp:useBean id= "transData" class= "datapro.eibs.beans.DataTransaction"  scope="session" /> 
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>
<%
	 trans.initRow();
    int blank_row = Integer.parseInt(transData.getTrNum());
    int max_row = 9999;
    int row;
    int total_row;
    try {
      row = Integer.parseInt(request.getParameter("ROW"));
    }
    catch (Exception e) {
      row = 0;
    }
    if ( (row == 0) || (row < trans.getLastRow()) ) {
      total_row = trans.getLastRow() + 1 + blank_row;
    }
    else {
		total_row = row;       
    }
%> 
</head>
<BODY>
<script type="text/javascript">

function hideDiv(fld, value){
 if (value) {
   eval(fld+".style.display='none'");
   } else{
   eval(fld+".style.display=''");
   }
}

function getParams(cod,name) {
    document.forms[0].E02CODFIL.value = cod;
    document.forms[0].E02NOMFIL.value = name;
}

function submitThis5() {
  var okdel = false;
	   switch (document.forms[0].E02CODFIL.value) {
    	case 'RA0051W1' :{    
	    	     document.forms[0].SCREEN.value = 101;
				 document.forms[0].submit();		  	       	       
            	}
            	break;
	    case 'RA0051W2' :{
		         document.forms[0].SCREEN.value = 103;
				 document.forms[0].submit();		  	       	       
    	        }
        	    break;
	    case 'RA0051W3' :{
		         document.forms[0].SCREEN.value = 105;
				 document.forms[0].submit();		  	       	       
	            }
  	          break;
	    case 'RA0051W4' :{
		         document.forms[0].SCREEN.value = 107;
				 document.forms[0].submit();		  	       	       
  	          }
   	         break;
	    case 'RA0051W8' :{
		         document.forms[0].SCREEN.value = 109;
				 document.forms[0].submit();		  	       	       
   	         }
   	         break;
    	default : {
       	     }
            break;
	    }
 }
function submitThis7() {
	document.forms[0].H01FLGWK1.value = "G";
	document.forms[0].SCREEN.value = "100";
	document.forms[0].submit();		  	       	       
}

</SCRIPT>  

<h3 align="center">Mantenimiento Tablas de Interface Garantías a CREDISMART 
<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="file_list,ERA0090"></h3>

<hr size="4">

<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSERA0090">
  <p> 
    <INPUT TYPE=HIDDEN NAME="CURRENTROW" id="CURRENTROW" VALUE="0"> 
    <INPUT TYPE=HIDDEN NAME="SCREEN" id="SCREEN" VALUE="">
    <input type=HIDDEN name="opt" id="opt" >
    <INPUT TYPE=HIDDEN NAME="E02CODFIL" id="E02CODFIL" VALUE="">
    <INPUT TYPE=HIDDEN NAME="H01FLGWK1" id="H01FLGWK1" VALUE="">
  </p>
  <p> 
<% 
String chk = "";

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
    <td class=TDBKG width="33%">
        <div align="center">
        <a href="javascript:submitThis5()"><b>Seleccionar Archivo</b></a>
        </div> 
    </td> 
    <td class=TDBKG width="33%">
        <div align="center">
        <a href="javascript:submitThis7()"><b>Generar Archivos de Interface para CREDISMART</b></a>
        </div> 
    </td> 
      <td class=TDBKG width="33%"> 
        <div align="center"><a href="<%=request.getContextPath()%>/pages/background.jsp"><b>Salir</b></a></div>
      </td>
    </tr>
  </table>
  
   <TABLE  id="mainTable" class="tableinfo" style="height:400px; width: 1000px ">
   <tr  height="5%"> 
      <td NOWRAP valign="top" width="100%"> 
		<table id="headTable" width="98%">
			<tr id="trdark">
	            <th align=CENTER nowrap width="5%">&nbsp;</th>
	            <th align=CENTER nowrap width="80%">Nombre Archivo</th>
			</tr>
        </table>
      </td>
    </tr>    
		  <tr  height="95%">    
		    <td nowrap="nowrap">      
		       <div id="dataDiv1" style="height:400px; overflow:auto;"> 
		       <table id="dataTable" cellspacing="0" cellpadding="1" border="0" >         
    <%
		int i = 0;
    %> 

          <%
				boolean firstTime = true;
          		chk = "";
	 			trans.initRow();
                while (trans.getNextRow()) {
                if (firstTime) {
          				firstTime = false;
          				chk = "checked";
          			} else {
          				chk = "";
          			}  
				i++;
		 %>
          <tr> 
			<INPUT TYPE=HIDDEN NAME="E01CODFIL_<%= trans.getCurrentRow() %>"  VALUE="<%=trans.getRecord(0)%>">
	        <td align="center" nowrap width="5%"> 
                <input type="radio" name="CURROW" value="" <%=chk%> onClick="getParams('<%= trans.getRecord(0) %>','<%= trans.getRecord(1) %>')">
            </td>
	      	<td align="left" nowrap width="80%">  
				<div ><%=trans.getRecord(1)%></DIV>
      		</td>
          </tr>
    <%
                }
    %> 
          </table>
        </div>
       </td>
     </tr>
</table>

    <input type="HIDDEN" name="RECNUM" id="RECNUM" value="<%=i%>">
  <BR>
  <table class="tbenter" width="100%" >
    <tr> 
      <td align="right" nowrap > 
	    <INPUT TYPE=HIDDEN NAME="ROW" id="ROW" VALUE="<%= i+1 %>">
      </td>
    </tr>
  </table>

<%
	if (userPO.getHeader12().equals("Y")) {
%>
<SCRIPT type="text/javascript">
	hideDiv('Div1',false) ;
</SCRIPT>
<%
	}
%> 

 <SCRIPT type="text/javascript">

     function resizeDoc() {
     	adjustEquTables( getElement("headTable"), getElement("dataTable"), getElement("dataDiv1"),1,false);
      }
	 showChecked("CURROW");
     resizeDoc();
     window.onresize=resizeDoc;

</SCRIPT>
</form>
</body>
</html>