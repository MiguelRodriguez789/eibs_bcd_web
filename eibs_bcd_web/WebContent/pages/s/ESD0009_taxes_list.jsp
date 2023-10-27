<%@ page import = "datapro.eibs.master.Util" %>
<html>
<head>
<title>Mantenimiento de Retenciones e Impuestos</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "ESD000901Help" class= "datapro.eibs.beans.JBObjList"  scope="session" />
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

function getParameters(taxcode) {

	document.forms[0].TAXCODE.value = taxcode;
  
}

function closeHiddenDivNew(){
	setVisibility(document.getElementById("hiddenDivNew"), "hidden");
}

function showHiddenDivNew(evt) {
	evt = (evt) ? evt : ((window.event) ? window.event : "");
 	
	var hiddenDivNew = document.getElementById("hiddenDivNew");

	var y=evt.clientY + document.body.scrollTop;
	var x=evt.clientX + document.body.scrollLeft;
     
	cancelBub(evt);

	moveElement(hiddenDivNew, y, x);
	setVisibility(hiddenDivNew, "visible");
	 
}

addEventHandler(document, 'click' , closeHiddenDivNew);


</SCRIPT>  

</head>

<BODY>
<h3 align="center">Mantenimiento de Retenciones e Impuestos<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="taxes_list.jsp, ESD0009"></h3>
<hr size="4">
<FORM name="form1" METHOD="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.params.JSESD0009" >
  <p> 
    <input type=HIDDEN name="SCREEN" value="800">
    <input type=HIDDEN name="totalRow" value="0">
    <input type=HIDDEN name="opt" id="opt" value="1">
  </p>
  
<div id="hiddenDivNew" class="hiddenDiv">
 <TABLE id=tbhelp style="border-top-width : 1px;border-right-width : 1px;border-bottom-width : 1px;border-left-width : 1px;
	border-color: #0b23b5;
	border-style : solid solid solid solid;
	filter:progid:DXImageTransform.Microsoft.dropshadow(OffX=3, OffY=3, Color='gray', Positive='true');">
	<tr id="trdark"> 
      <td align=CENTER width="18%"> 
        <div align="right">Código de Impuesto :</div>
      </td>
      <td align=CENTER width="34%"> 
        <div align="left"> 
         <input type="text" name="TAXCODE" id="TAXCODE" size="4" maxlength="3" > 
        </div>
      </td>
    </tr>
   <tr id="trclear">
   
   <TD ALIGN=center nowrap colspan="2">
	     <input id="EIBSBTN" type=button name="Submit" value="Submit" onClick="goAction(1)"> 
   </TD>
   
   </tr>
 </TABLE>
</div>
  
  <p> 
    <%
	if ( ESD000901Help.getNoResult() ) {
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
                <div id="eibsNew" align="center" style="cursor:pointer"><a><b>Crear</b></a></div>
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
	
  <%  
		}
	else {

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
   <!--   <td class=TDBKG width="30%"> 
      	<div id="eibsNew" align="center" style="cursor:pointer"><a><b>Crear</b></a></div> 
      </td> -->
      <td class=TDBKG width="30%"> 
        <div align="center"><a href="javascript:goAction(2)"><b>Modificar</b></a></div>
      </td>
      <td class=TDBKG width="30%"> 
        <div align="center"><a href="<%=request.getContextPath()%>/pages/background.jsp"><b>Salir</b></a></div>
      </td>
    </tr>
  </table>
   
  <br>
  <table  id="mainTable" class="tableinfo" height="70%">
    <tr  height="5%"> 
      <td NOWRAP valign="top" width="100%"> 
        <table id="headTable" width="98%">
          <tr id="trdark"> 
            		<th align=CENTER nowrap width="5%">&nbsp;</th>
            		<th align=CENTER nowrap width="20%">C&oacute;digo</th>
            		<th align=LEFT nowrap width="75%"> Descripci&oacute;n </th>
          </tr>
        </table>
      </td>
    </tr>    
		  <tr  height="95%">    
		    <td>       
		       <div id="dataDiv1" style="height:100%;  overflow:auto;"> 
		       <table id="dataTable" cellspacing="0" cellpadding="1" border="0" width="100%">         
          <%
                ESD000901Help.initRow();
				boolean firstTime = true;
				String chk = "";
                while (ESD000901Help.getNextRow()) {
					if (firstTime) {
						firstTime = false;
						chk = "checked";
					} else {
						chk = "";
					}
                  datapro.eibs.beans.ESD000901Message msgList = (datapro.eibs.beans.ESD000901Message) ESD000901Help.getRecord();
		 %>
          <tr id="dataTable<%= ESD000901Help.getCurrentRow() %>"> 
            <td NOWRAP  align=center width="10%"> 
              <input type="radio" name="CURRCODE" value="<%= ESD000901Help.getCurrentRow() %>" <%=chk%> class="highlight" onClick="highlightRow('dataTable', this.value)" onClick="getParameters('<%= msgList.getE01TAXTTP() %>')">
            </td>
            <td NOWRAP  align=CENTER width="20%"><%= msgList.getE01TAXTTP() %></td>
            <td NOWRAP  align=LEFT width="75%"><%= msgList.getE01TAXDSC() %></td>
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
			
		function resizeDoc() {
      	 	divResize();
     	    adjustEquTables(document.getElementById("headTable"),document.getElementById("dataTable"),document.getElementById("dataDiv1"),1,false);
      	}
	 	resizeDoc();   			
     	window.onresize=resizeDoc;
	</SCRIPT>

<%}%>
	<SCRIPT type="text/javascript">
		document.getElementById("hiddenDivNew").onclick=cancelBub;
		if (isValidObject(document.getElementById("eibsNew"))) {
			document.getElementById("eibsNew").onclick=showHiddenDivNew;
		}	
	</SCRIPT>

  </form>

</body>
</html>
