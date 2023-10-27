<html>
<head>
<title>Maestro de Agencias</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "ESD059001Help" class= "datapro.eibs.beans.JBObjList"  scope="session" />
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

function goDelete(op) {

	if(confirm("Esta seguro que desea borrar esta Sucursal?")){
		document.getElementById("opt").value = op;
		document.forms[0].submit();
	}
}


function getParams(bank,branch) {

    document.getElementById("BANK").value = account;
    document.getElementById("BRANCH").value = branch;
}

function closeHiddenDivNew(){
	setVisibility(document.getElementById("hiddenDivNew"), "hidden");
    document.getElementById("E01BRNNUM").value="";
}


function showHiddenDivNew(evt) {
	evt = (evt) ? evt : ((window.event) ? window.event : "");
 	
	var hiddenDivNew = document.getElementById("hiddenDivNew");

	var y=evt.clientY + document.body.scrollTop;
	var x=evt.clientX + document.body.scrollLeft;
     
	cancelBub(evt);

	moveElement(hiddenDivNew, y, x);
	setVisibility(hiddenDivNew, "visible");
	 
	document.getElementById("E01BRNNUM").focus();
}

addEventHandler(document, 'click' , closeHiddenDivNew);

</SCRIPT>  

</head>

<BODY>
<h3 align="center">Maestro de Agencias <img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="branch_list.jsp, ESD0590"></h3>
<hr size="4">
<FORM name="form1" METHOD="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.params.JSESD0590" >
  <p> 
    <input type=HIDDEN name="SCREEN" id="SCREEN" value="800">
    <input type=HIDDEN name="totalRow" id="totalRow" value="0">
    <input type=HIDDEN name="BANK" id="BANK">
    <input type=HIDDEN name="BRANCH" id="BRANCH">
    <input type=HIDDEN name="opt" id="opt" value="1">
  </p>
<div id="hiddenDivNew" class="hiddenDiv">
 <TABLE id=tbhelp style="border-top-width : 1px;border-right-width : 1px;border-bottom-width : 1px;border-left-width : 1px;
	border-color: #0b23b5;
	border-style : solid solid solid solid;
	filter:progid:DXImageTransform.Microsoft.dropshadow(OffX=3, OffY=3, Color='gray', Positive='true');">
	<tr id="trdark"> 
      <td align=CENTER width="25%"> 
        <div align="right">Agencia :</div>
      </td>
      <td align=CENTER width="75%"> 
        <div align="left"> 
          <input type="text" name="E01BRNNUM" id="E01BRNNUM" size="5" maxlength="4">
          <img src="<%=request.getContextPath()%>/images/Check.gif" title="mandatory field" align="bottom"> 
        </div>
      </td>
    </tr>
   <tr id="trclear">
   
   <TD ALIGN=center nowrap colspan="2">
	     <input id="ESBSBTN" type=button name="Submit" value="Submit" onClick="goAction(1)"> 
   </TD>
   
   </tr>
 </TABLE>
 </div>
  <p> 
    <%
	if ( ESD059001Help.getNoResult() ) {
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
      <td class=TDBKG width="25%"> 
		<div id="eibsNew" align="center" style="cursor:pointer"><a><b>Crear</b></a></div>
      </td>
		<td class=TDBKG width="25%"> 
        <div align="center"><a href="javascript:goAction(2)"><b>Modificar</b></a></div>
      </td>
	  <td class=TDBKG width="25%"> 
        <div align="center"><a href="javascript:goDelete(3)"><b>Borrar</b></a></div>
      </td>
      <td class=TDBKG width="25%"> 
        <div align="center"><a href="<%=request.getContextPath()%>/pages/background.jsp"><b>Salir</b></a></div>
      </td>
    </tr>
  </table>
   
  <br>
  <table  id=cfTable class="tableinfo" height="70%">
    <tr  height="5%"> 
      <td NOWRAP valign="top" width="100%"> 
        <table id="headTable" width="98%">
          <tr id="trdark"> 
            <th align=center nowrap width="10%">&nbsp;</th>
            <th align=center nowrap width="10%">Banco</th>
            <th align=center nowrap width="10%">Agencia</th>
            <th align=left nowrap width="40%">Descripci&oacute;n </th>
            <th align=left nowrap width="30%">Ciudad </th>
          </tr>
        </table>
      </td>
    </tr>    
		  <tr  height="95%">    
		    <td valign="top">       
		       <div id="dataDiv1" style="height:400px;  overflow:auto;"> 
		       <table id="dataTable" cellspacing="0" cellpadding="1" border="0" width="100%">         
          <%
                boolean firstTime = true;
				String chk = "";
                ESD059001Help.initRow();
                while (ESD059001Help.getNextRow()) {
					if (firstTime) {
						firstTime = false;
						chk = "checked";
					} else {
						chk = "";
					}
                 
                  datapro.eibs.beans.ESD059001Message msgList = (datapro.eibs.beans.ESD059001Message) ESD059001Help.getRecord();
		 %>
          <tr id="dataTable<%= ESD059001Help.getCurrentRow() %>"> 
            <td NOWRAP  align=center width="10%"> 
              <input type="radio" name="CURRCODE" value="<%= ESD059001Help.getCurrentRow() %>" <%=chk%> class="highlight" onClick="highlightRow('dataTable', this.value)">
            </td>
            <td NOWRAP  align=center width="10%"><%= msgList.getE01BRNBNK() %></td>
            <td NOWRAP  align=center width="10%"><%= msgList.getE01BRNNUM() %></td>
            <td NOWRAP  align=left width="40%"><%= msgList.getE01BRNNME() %></td>
            <td NOWRAP  align=left width="30%"><%= msgList.getE01BRNCIT() %></td>
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
	<SCRIPT type="text/javascript">
	 	document.getElementById("hiddenDivNew").onclick=cancelBub;
		document.getElementById("eibsNew").onclick=showHiddenDivNew;
	</SCRIPT>

  </form>

</body>
</html>
