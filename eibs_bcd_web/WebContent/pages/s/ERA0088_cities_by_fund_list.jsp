<%@ page import ="datapro.eibs.master.Util" %>
<html>
<head>
<title>Tabla de Ciudades Beneficiarias por Fondo de Garantías</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<jsp:useBean id= "trans" class= "datapro.eibs.beans.JBListRec"  scope="session" /> 
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />
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
<%
	boolean b_read_only1 = false;
	String read_only1 = "";
	//PROTEGER CAMPOS PARA CONSULTA Y BORRADO
	if (userPO.getPurpose().trim().equals("APPROVAL_INQ")) {
		b_read_only1 = true;
		read_only1 = "readonly";
	}
%>
</head>
<BODY>

<SCRIPT type="text/javascript">

function hideDiv(fld, value){
 if (value) {
   eval(fld+".style.display='none'");
   } else{
   eval(fld+".style.display=''");
   }
}

function getParams(currrow,cacti,dacti) {
	getElement("CURRENTROW").value = currrow;
}

function submitThis(option) {
  var okdel = false;
  getElement("opt").value = option;
  getElement("SCREEN").value="2";
 	
   switch (option) {
            //lista ciudades del departamento seleccionado
    case 3 :{    
	         document.forms[0].CONFIRM.value = "";
	         document.forms[0].SCREEN.value = "100";
			 document.forms[0].submit();		  	       	       
            }
            break;
            //actualizacion
    case 7 :{
	         document.forms[0].SCREEN.value = "2";
			 document.forms[0].submit();		  	       	       
            }
            break;
    default : {
            }
            break;
    }
 	
 	
 	
}


function printMe() {
	document.getElementById("button_bar").style.display = 'none';
//	document.getElementById("button_bottom").style.display = 'none';
	window.print();
	document.getElementById("button_bar").style.display = 'block';
//	document.getElementById("button_bottom").style.display = 'block';
}
</SCRIPT>  
<script type="text/javascript">
$("#printLandscape").on('click',function () {
$('head').append('<link href="printLandscape.css" title="printLandscape" rel="stylesheet" />');
});
</script>

<h3 align="center">Tabla de Ciudades Beneficiarias para el Fondo <%= userPO.getHeader20().trim() %>-<%= userPO.getHeader21().trim() %>
<BR> Monto Cupo a Distribuir : <%= userPO.getHeader22().trim() %>
<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="cities_by_found_list,ERA0088"></h3>

<hr size="4">

<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSERA0088">
  <p> 
    <INPUT TYPE=HIDDEN NAME="CURRENTROW" id="CURRENTROW" VALUE="0"> 
    <INPUT TYPE=HIDDEN NAME="SCREEN" id="SCREEN" VALUE="2">
    <input type=HIDDEN name="opt" id="opt" >
    <INPUT TYPE=HIDDEN NAME="totalRow" id="totalRow" VALUE="<%= total_row %>">
    <INPUT TYPE=HIDDEN NAME="E01TB5CFG" id="E01TB5CFG" VALUE="<%= userPO.getHeader20().trim() %>">
    <INPUT TYPE=HIDDEN NAME="E01TB5MXD" id="E01TB5MXD" VALUE="<%= userPO.getHeader22().trim() %>">
    <INPUT TYPE=HIDDEN NAME="H01FLGWK1" id="H01FLGWK1" VALUE="C">
    <INPUT TYPE=HIDDEN NAME="CONFIRM" id="CONFIRM" VALUE="<%= userPO.getHeader12().trim() %>">
    <INPUT TYPE=HIDDEN NAME="PURPOSE" id="PURPOSE" VALUE="<%= userPO.getPurpose().trim() %>">
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
	<div id="Div1" style="display:'none'">
        <table cellspacing=0 cellpadding=2 width="100%" border="0">
		  <tr>    
            <td nowrap >
              <div align="left"> </div>
            </td>
          </tr>
		</table>
	</div>          

<div id="button_bar"> 
 
  <table class="tbenter" >
    <tr> 
	<%
	if (b_read_only1 == false) {
	%>
    <td class=TDBKG width="20%">
        <div align="center">
        <a href="javascript:submitThis(7)"><b>Actualizar Tabla Ciudades</b></a>
        </div> 
    </td> 
	<%
	};
	%>
      <td class=TDBKG width="20%"> 
        <div align="center"><a href="<%=request.getContextPath()%>/pages/background.jsp"><b>Salir</b></a></div>
      </td>
	<%
	if (b_read_only1 == false) {
	%>
      <td class=TDBKG width="20%" >
        <div align="center">
        <a href="javascript:printMe()" id="printLandscape"><b>Imprimir</b></a>
        </div> 
      </td>    
	<%
	};
	%>
    </tr>
  </table>
</div>          
   <TABLE  id="mainTable" class="tableinfo" style="height:400px;">
   <tr  height="5%"> 
      <td NOWRAP valign="top" width="100%"> 
      <div>
		<table id="headTable" >
			<tr id="trdark">
	            <td align="center" nowrap width="20%">DEPTO.</td> 
	            <td align="center" nowrap width="20%"></td>
	            <td align="center" nowrap width="20%">Ciudad</td>
	            <td align="center" nowrap width="20%"></td>
	            <%-- 
	            <td align=CENTER nowrap width="10%"> <div align="center">Monto Asignado </div> </td>
	            <td align=CENTER nowrap width="10%"> <div align="center">Monto Usado </div> </td>
--%>
			</tr>
        </table>
        </div>
      </td>
    </tr>    
		  <tr  height="95%">    
		    <td nowrap="nowrap">      
		       <div id="dataDiv1" style="height:500px; overflow:auto;"> 
		       <table id="dataTable">         
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
	      	<td align="center" nowrap width="20%">  
			  <INPUT TYPE="text" NAME="E01TB5DPT_<%= trans.getCurrentRow() %>"  VALUE="<%=trans.getRecord(0)%>" size="4" maxlength="4" onChange="hideDiv('Div1',true)" <%=read_only1%>>
 				<%
 					if (b_read_only1 == false) {
 				%>
   			  <a href="javascript:Get2FilterCodes('E01TB5DPT_<%= trans.getCurrentRow() %>','','27','','')">
				<img src="<%=request.getContextPath()%>/images/1b.gif" title="ayuda" align="bottom" border="0">
			  </a>
				<%
					};
				%>
      		</td>
	      	<td align="center" nowrap width="20%">  
			  <INPUT TYPE="text" NAME="D01TB5DPT_<%= trans.getCurrentRow() %>"  VALUE="<%=trans.getRecord(1)%>" size="25" maxlength="25" readonly>
      		</td>
	      	<td align="center" nowrap width="20%">  
			  <INPUT TYPE="text" NAME="E01TB5CTY_<%= trans.getCurrentRow() %>"  VALUE="<%=trans.getRecord(2)%>" size="4" maxlength="4" onChange="hideDiv('Div1',true)" <%=read_only1%>>
 				<%
 					if (b_read_only1 == false) {
 				%>
   			  <a href="javascript:Get2FilterCodes('E01TB5CTY_<%= trans.getCurrentRow() %>','','84',' ',document.forms[0].E01TB5DPT_<%= trans.getCurrentRow() %>.value)">
				<img src="<%=request.getContextPath()%>/images/1b.gif" title="ayuda" align="bottom" border="0">
			  </a>
				<%
					};
				%>
      		</td>
	      	<td align="center" nowrap width="20%">  
			  <INPUT TYPE="text" NAME="D01TB5CTY_<%= trans.getCurrentRow() %>"  VALUE="<%=trans.getRecord(3)%>" size="25" maxlength="25" readonly>
      		</td>
      		<%-- 
	      	<td align="center" nowrap width="8%">  
    	      <input type="text" name="E01TB5MCC_<%= trans.getCurrentRow() %>"  size="17" maxlength="15"  value="<%= trans.getRecord(4) %>" onkeypress=enterDecimal()  onChange="hideDiv('Div1',true)"> 
      		</td>
	      	<td align="center" nowrap width="8%">  
    	      <input type="text" name="E01TB5MUC_<%= trans.getCurrentRow() %>"  size="17" maxlength="15"  value="<%= trans.getRecord(5) %>" onkeypress=enterDecimal()  onChange="hideDiv('Div1',true)"> 
      		</td>
--%>
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
  <table class="tbenter" >
    <tr> 

      <td align="right" nowrap > 
	    <INPUT TYPE=HIDDEN NAME="ROW" id="ROW" VALUE="<%= i+1 %>">
      </td>

    </tr>
  </table>

<%
	if (userPO.getHeader16().equals("Y")) {
%>
<SCRIPT type="text/javascript">
	hideDiv('Div1',false) ;
</SCRIPT>
<%
	}
%> 

<SCRIPT type="text/javascript">

// showChecked("CURRCODE");
     function resizeDoc() {
//       	divResize();
//     	adjustEquTables(headTable, dataTable, dataDiv1,1,false);
      }
//     resizeDoc();
//     window.onresize=resizeDoc;

</SCRIPT>
</form>
</body>
</html>