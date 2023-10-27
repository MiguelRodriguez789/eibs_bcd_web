<%@ page import ="datapro.eibs.master.Util" %>
<html>
<head>
<title>Tabla de Indices de Avalúos para Bienes Inmuebles. Ciudades Referentes DANE</title>
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

function asigAll(clas) {
	var n = document.forms[0].RECNUM.value;
	var DPUBCHK = "document.forms[0].ALL"+clas+".checked" ;
   for (i = 0; i < n; i++) {
		if (eval(DPUBCHK) == true) {
			eval("document.forms[0].E01TB2ST"+clas+"_"+i+".checked = true");
		} else {
			eval("document.forms[0].E01TB2ST"+clas+"_"+i+".checked = false");
		}
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

<h3 align="center">Tabla de Indices de Avalúos para Bienes Inmuebles. Ciudades Referentes DANE. Año <%= userPO.getHeader20().trim() %><br><%= userPO.getHeader22().trim() %>
<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="valuation_index_city_refere,ERA0087"></h3>

<hr size="4">

<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSERA0087">
  <p> 
    <INPUT TYPE=HIDDEN NAME="CURRENTROW" id="CURRENTROW" VALUE="0"> 
    <INPUT TYPE=HIDDEN NAME="SCREEN" id="SCREEN" VALUE="2">
    <input type=HIDDEN name="opt" id="opt" >
    <INPUT TYPE=HIDDEN NAME="totalRow" id="totalRow" VALUE="<%= total_row %>">
    <INPUT TYPE=HIDDEN NAME="E01TB2YEA" id="E01TB2YEA" VALUE="<%= userPO.getHeader20().trim() %>">
    <INPUT TYPE=HIDDEN NAME="E01TB2DPT" id="E01TB2DPT" VALUE="<%= userPO.getHeader21().trim() %>">
    <INPUT TYPE=HIDDEN NAME="D01TB2DPT" id="D01TB2DPT" VALUE="<%= userPO.getHeader22().trim() %>">
    <INPUT TYPE=HIDDEN NAME="H01FLGWK1" id="H01FLGWK1" VALUE="C">
    <INPUT TYPE=HIDDEN NAME="CONFIRM" id="CONFIRM" VALUE="<%= userPO.getHeader12().trim() %>">
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
    <td class=TDBKG width="20%">
        <div align="center">
        <a href="javascript:submitThis(3)"><b>Regresar</b></a>
        </div> 
    </td> 
    <td class=TDBKG width="20%">
        <div align="center">
        <a href="javascript:submitThis(7)"><b>Actualizar Tabla Ciudades</b></a>
        </div> 
    </td> 
      <td class=TDBKG width="20%"> 
        <div align="center"><a href="<%=request.getContextPath()%>/pages/background.jsp"><b>Salir</b></a></div>
      </td>
      <td class=TDBKG width="20%" >
        <div align="center">
        <a href="javascript:printMe()" id="printLandscape"><b>Imprimir</b></a>
        </div> 
      </td>    
    </tr>
  </table>
</div>          
   <TABLE  id="mainTable" class="tableinfo" style="height:400px; width: 1000px ">
   <tr  height="5%"> 
      <td NOWRAP valign="top" width="100%"> 
		<table id="headTable" >
			<tr id="trdark">
	            <th align=CENTER nowrap width="10%"> <div align="center">DEPTO.</div> </th>
	            <th align=CENTER nowrap width="10%">Ciudad</th>
	            <th align=CENTER nowrap width="10%"> <div align="center"><%= userPO.getHeader1().trim() %> </div> </th>
	            <th align=CENTER nowrap width="10%"> <div align="center"><%= userPO.getHeader2().trim() %> </div> </th>
	            <th align=CENTER nowrap width="10%"> <div align="center"><%= userPO.getHeader3().trim() %> </div> </th>
	            <th align=CENTER nowrap width="10%"> <div align="center"><%= userPO.getHeader4().trim() %> </div> </th>
	            <th align=CENTER nowrap width="10%"> <div align="center"><%= userPO.getHeader5().trim() %> </div> </th>
	            <th align=CENTER nowrap width="10%"> <div align="center"><%= userPO.getHeader6().trim() %> </div> </th>
	            <th align=CENTER nowrap width="10%"> <div align="center"><%= userPO.getHeader7().trim() %> </div> </th>
	            <th align=CENTER nowrap width="10%"> <div align="center"><%= userPO.getHeader8().trim() %> </div> </th>
	            <th align=CENTER nowrap width="10%"> <div align="center"><%= userPO.getHeader9().trim() %> </div> </th>
	            <th align=CENTER nowrap width="10%"> <div align="center"><%= userPO.getHeader10().trim() %> </div> </th>
	            <th align=CENTER nowrap width="10%"> <div align="center"><%= userPO.getHeader11().trim() %> </div> </th>
	            <th align=CENTER nowrap width="10%"> <div align="center"><%= userPO.getHeader12().trim() %> </div> </th>
	            <th align=CENTER nowrap width="10%"> <div align="center"><%= userPO.getHeader13().trim() %> </div> </th>
	            <th align=CENTER nowrap width="10%"> <div align="center"><%= userPO.getHeader14().trim() %> </div> </th>
	            <th align=CENTER nowrap width="10%"> <div align="center"><%= userPO.getHeader15().trim() %> </div> </th>
			</tr>
			<tr id="trdark">
	            <th align=CENTER nowrap width="10%"> </th>
	            <th align=CENTER nowrap width="10%"></th>
	            <th align=CENTER nowrap width="10%">Act./Inact.: <div align="right">
	            <INPUT type="checkbox" name="ALL1" value="N" width="5%" onClick="asigAll('1');" ></div> </th>
	            <th align=CENTER nowrap width="10%">Act./Inact.: <div align="right">
	            <INPUT type="checkbox" name="ALL2" value="N" width="5%" onClick="asigAll('2');" ></div> </th>
	            <th align=CENTER nowrap width="10%">Act./Inact.: <div align="right">
	            <INPUT type="checkbox" name="ALL3" value="N" width="5%" onClick="asigAll('3');" ></div> </th>
	            <th align=CENTER nowrap width="10%">Act./Inact.: <div align="right">
	            <INPUT type="checkbox" name="ALL4" value="N" width="5%" onClick="asigAll('4');" ></div> </th>
	            <th align=CENTER nowrap width="10%">Act./Inact.: <div align="right">
	            <INPUT type="checkbox" name="ALL5" value="N" width="5%" onClick="asigAll('5');" ></div> </th>
	            <th align=CENTER nowrap width="10%">Act./Inact.: <div align="right">
	            <INPUT type="checkbox" name="ALL6" value="N" width="5%" onClick="asigAll('6');" ></div> </th>
	            <th align=CENTER nowrap width="10%">Act./Inact.: <div align="right">
	            <INPUT type="checkbox" name="ALL7" value="N" width="5%" onClick="asigAll('7');" ></div> </th>
	            <th align=CENTER nowrap width="10%">Act./Inact.: <div align="right">
	            <INPUT type="checkbox" name="ALL8" value="N" width="5%" onClick="asigAll('8');" ></div> </th>
	            <th align=CENTER nowrap width="10%">Act./Inact.: <div align="right">
	            <INPUT type="checkbox" name="ALL9" value="N" width="5%" onClick="asigAll('9');" ></div> </th>
	            <th align=CENTER nowrap width="10%">Act./Inact.: <div align="right">
	            <INPUT type="checkbox" name="ALL0" value="N" width="5%" onClick="asigAll('0');" ></div> </th>
	            <th align=CENTER nowrap width="10%">Act./Inact.: <div align="right">
	            <INPUT type="checkbox" name="ALLA" value="N" width="5%" onClick="asigAll('A');" ></div> </th>
	            <th align=CENTER nowrap width="10%">Act./Inact.: <div align="right">
	            <INPUT type="checkbox" name="ALLB" value="N" width="5%" onClick="asigAll('B');" ></div> </th>
	            <th align=CENTER nowrap width="10%">Act./Inact.: <div align="right">
	            <INPUT type="checkbox" name="ALLC" value="N" width="5%" onClick="asigAll('C');" ></div> </th>
	            <th align=CENTER nowrap width="10%">Act./Inact.: <div align="right">
	            <INPUT type="checkbox" name="ALLD" value="N" width="5%" onClick="asigAll('D');" ></div> </th>
	            <th align=CENTER nowrap width="10%">Act./Inact.: <div align="right">
	            <INPUT type="checkbox" name="ALLE" value="N" width="5%" onClick="asigAll('E');" ></div> </th>
			</tr>
        </table>
      </td>
    </tr>    
		  <tr  height="95%">    
		    <td nowrap="nowrap">      
		       <div id="dataDiv1" style="height:1000px; overflow:auto;"> 
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
	      	<td align="center" nowrap width="10%">  
			  <INPUT TYPE="text" NAME="E01TB2DPT_<%= trans.getCurrentRow() %>"  VALUE="<%=trans.getRecord(1)%>" size="4" maxlength="4" onChange="hideDiv('Div1',true)">
   			  <a href="javascript:Get2FilterCodes('E01TB2DPT_<%= trans.getCurrentRow() %>','','27','','')">
				<img src="<%=request.getContextPath()%>/images/1b.gif" title="ayuda" align="bottom" border="0">
			  </a>
      		</td>
	      	<td align="center" nowrap width="10%">  
			  <INPUT TYPE="text" NAME="E01TB2CTY_<%= trans.getCurrentRow() %>"  VALUE="<%=trans.getRecord(18)%>" size="4" maxlength="4" onChange="hideDiv('Div1',true)">
   			  <a href="javascript:Get2FilterCodes('E01TB2CTY_<%= trans.getCurrentRow() %>','','84',' ',document.forms[0].E01TB2DPT_<%= trans.getCurrentRow() %>.value)">
				<img src="<%=request.getContextPath()%>/images/1b.gif" title="ayuda" align="bottom" border="0">
			  </a>
      		</td>
	      	<td align="center" nowrap width="8%">  
    	      <input type="text" name="E01TB2IN1_<%= trans.getCurrentRow() %>"  size="6" maxlength="6"  value="<%= trans.getRecord(3) %>" onkeypress=enterDecimal()  onChange="hideDiv('Div1',true)"> 
      		<INPUT type="checkbox" name="E01TB2ST1_<%=trans.getCurrentRow()%>" value="Y"  <%if (trans.getRecord(20).trim().equals("Y")) out.print("checked");%> >
      		</td>
	      	<td align="center" nowrap width="8%">  
    	      <input type="text" name="E01TB2IN2_<%= trans.getCurrentRow() %>"  size="6" maxlength="6"  value="<%= trans.getRecord(4) %>" onkeypress=enterDecimal()  onChange="hideDiv('Div1',true)"> 
      		<INPUT type="checkbox" name="E01TB2ST2_<%=trans.getCurrentRow()%>" value="Y" <%if (trans.getRecord(21).trim().equals("Y")) out.print("checked");%> >
      		</td>
	      	<td align="center" nowrap width="8%">  
    	      <input type="text" name="E01TB2IN3_<%= trans.getCurrentRow() %>"  size="6" maxlength="6"  value="<%= trans.getRecord(5) %>" onkeypress=enterDecimal() onChange="hideDiv('Div1',true)" > 
      		<INPUT type="checkbox" name="E01TB2ST3_<%=trans.getCurrentRow()%>" value="Y" <%if (trans.getRecord(22).trim().equals("Y")) out.print("checked");%> >
      		</td>
	      	<td align="center" nowrap width="8%">  
    	      <input type="text" name="E01TB2IN4_<%= trans.getCurrentRow() %>"  size="6" maxlength="6"  value="<%= trans.getRecord(6) %>" onkeypress=enterDecimal()  onChange="hideDiv('Div1',true)"> 
      		<INPUT type="checkbox" name="E01TB2ST4_<%=trans.getCurrentRow()%>" value="Y" <%if (trans.getRecord(23).trim().equals("Y")) out.print("checked");%> >
      		</td>
	      	<td align="center" nowrap width="8%">  
    	      <input type="text" name="E01TB2IN5_<%= trans.getCurrentRow() %>"  size="6" maxlength="6"  value="<%= trans.getRecord(7) %>" onkeypress=enterDecimal()  onChange="hideDiv('Div1',true)"> 
      		<INPUT type="checkbox" name="E01TB2ST5_<%=trans.getCurrentRow()%>" value="Y" <%if (trans.getRecord(24).trim().equals("Y")) out.print("checked");%> >
      		</td>
	      	<td align="center" nowrap width="8%">  
    	      <input type="text" name="E01TB2IN6_<%= trans.getCurrentRow() %>"  size="6" maxlength="6"  value="<%= trans.getRecord(8) %>" onkeypress=enterDecimal()  onChange="hideDiv('Div1',true)"> 
      		<INPUT type="checkbox" name="E01TB2ST6_<%=trans.getCurrentRow()%>" value="Y" <%if (trans.getRecord(25).trim().equals("Y")) out.print("checked");%> >
      		</td>
	      	<td align="center" nowrap width="7%">  
    	      <input type="text" name="E01TB2IN7_<%= trans.getCurrentRow() %>"  size="6" maxlength="6"  value="<%= trans.getRecord(9) %>" onkeypress=enterDecimal()  onChange="hideDiv('Div1',true)"> 
      		<INPUT type="checkbox" name="E01TB2ST7_<%=trans.getCurrentRow()%>" value="Y" <%if (trans.getRecord(26).trim().equals("Y")) out.print("checked");%> >
      		</td>
	      	<td align="center" nowrap width="8%">  
    	      <input type="text" name="E01TB2IN8_<%= trans.getCurrentRow() %>"  size="6" maxlength="6"  value="<%= trans.getRecord(10) %>" onkeypress=enterDecimal()  onChange="hideDiv('Div1',true)"> 
      		<INPUT type="checkbox" name="E01TB2ST8_<%=trans.getCurrentRow()%>" value="Y" <%if (trans.getRecord(27).trim().equals("Y")) out.print("checked");%> >
      		</td>
	      	<td align="center" nowrap width="8%">  
    	      <input type="text" name="E01TB2IN9_<%= trans.getCurrentRow() %>"  size="6" maxlength="6"  value="<%= trans.getRecord(11) %>" onkeypress=enterDecimal()  onChange="hideDiv('Div1',true)"> 
      		<INPUT type="checkbox" name="E01TB2ST9_<%=trans.getCurrentRow()%>" value="Y" <%if (trans.getRecord(28).trim().equals("Y")) out.print("checked");%> >
      		</td>
	      	<td align="center" nowrap width="8%">  
    	      <input type="text" name="E01TB2IN0_<%= trans.getCurrentRow() %>"  size="6" maxlength="6"  value="<%= trans.getRecord(12) %>" onkeypress=enterDecimal()  onChange="hideDiv('Div1',true)"> 
      		<INPUT type="checkbox" name="E01TB2ST0_<%=trans.getCurrentRow()%>" value="Y" <%if (trans.getRecord(29).trim().equals("Y")) out.print("checked");%> >
      		</td>
	      	<td align="center" nowrap width="8%">  
    	      <input type="text" name="E01TB2INA_<%= trans.getCurrentRow() %>"  size="6" maxlength="6"  value="<%= trans.getRecord(13) %>" onkeypress=enterDecimal()  onChange="hideDiv('Div1',true)"> 
      		<INPUT type="checkbox" name="E01TB2STA_<%=trans.getCurrentRow()%>" value="Y" <%if (trans.getRecord(30).trim().equals("Y")) out.print("checked");%> >
      		</td>
	      	<td align="center" nowrap width="8%">  
    	      <input type="text" name="E01TB2INB_<%= trans.getCurrentRow() %>"  size="6" maxlength="6"  value="<%= trans.getRecord(14) %>" onkeypress=enterDecimal()  onChange="hideDiv('Div1',true)"> 
      		<INPUT type="checkbox" name="E01TB2STB_<%=trans.getCurrentRow()%>" value="Y" <%if (trans.getRecord(31).trim().equals("Y")) out.print("checked");%> >
      		</td>
	      	<td align="center" nowrap width="8%">  
    	      <input type="text" name="E01TB2INC_<%= trans.getCurrentRow() %>"  size="6" maxlength="6"  value="<%= trans.getRecord(15) %>" onkeypress=enterDecimal()  onChange="hideDiv('Div1',true)"> 
      		<INPUT type="checkbox" name="E01TB2STC_<%=trans.getCurrentRow()%>" value="Y" <%if (trans.getRecord(32).trim().equals("Y")) out.print("checked");%> >
      		</td>
	      	<td align="center" nowrap width="8%">  
    	      <input type="text" name="E01TB2IND_<%= trans.getCurrentRow() %>"  size="6" maxlength="6"  value="<%= trans.getRecord(16) %>" onkeypress=enterDecimal()  onChange="hideDiv('Div1',true)"> 
      		<INPUT type="checkbox" name="E01TB2STD_<%=trans.getCurrentRow()%>" value="Y" <%if (trans.getRecord(33).trim().equals("Y")) out.print("checked");%> >
      		</td>
	      	<td align="center" nowrap width="8%">  
    	      <input type="text" name="E01TB2INE_<%= trans.getCurrentRow() %>"  size="6" maxlength="6"  value="<%= trans.getRecord(17) %>" onkeypress=enterDecimal()  onChange="hideDiv('Div1',true)"> 
      		<INPUT type="checkbox" name="E01TB2STE_<%=trans.getCurrentRow()%>" value="Y" <%if (trans.getRecord(34).trim().equals("Y")) out.print("checked");%> >
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
  <table class="tbenter" >
    <tr> 
<%--
      <td align="right" nowrap width="20%"  >Total Registros 
        :</td>
      <td align="right" nowrap width="20%" > 
        <div align="left"> 
          <input type="text" name="ROW" size="5" maxlength="5" id="txtright" readonly value="<%= i+1 %>">
--%>
      <td align="right" nowrap > 
	    <INPUT TYPE=HIDDEN NAME="ROW" id="ROW" VALUE="<%= i+1 %>">
      </td>
<%--
        </div>
      </td>
--%>
<%--
      <td   width="60%"> 
        <div align="right">Cantidad de Registros a A&ntilde;adir : 
          <input type="text" name="TEMP_ROW" size="4" maxlength="4" value="0" onkeypress="enterInteger(event)" onBlur="checkRowValue()">
        </div>
      </td>
      <td bordercolor="#FFFFFF"  class="TDBKG" width="8%"><a href="javascript:submitThis(3)">Adicionar</a></td>
--%>
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