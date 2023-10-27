<html>
<head>
<title>TABLAS DE DOCUMENTOS</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "EDI010Help" class= "datapro.eibs.beans.JBList"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>
<script type="text/javascript">

function closeHiddenDivNew(){
	if (isValidObject(document.getElementById("hiddenDivNew"))) {
		setVisibility(document.getElementById("hiddenDivNew"), "hidden");
	}
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

function goAction(op) {

	document.getElementById("opt").value = op;
	document.forms[0].submit();
  
}


function getParams(code) {

    document.getElementById("TABLE").value = code;
    
}

addEventHandler(document, 'click', closeHiddenDivNew);

</SCRIPT>  

</head>

<BODY>
<h3 align="center">Tablas de Documentos<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="sel_tables, EDI010" ></h3>
<hr size="4">
<FORM name="form1" METHOD="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.params.JSEDI010" >
  <input type=HIDDEN name="SCREEN" id="SCREEN" value="2">
  <input type=HIDDEN name="opt" id="opt" value="1">
  <input type=HIDDEN name="totalRow" id="totalRow" value="0">
  <input type=HIDDEN name="TABLE" id="TABLE" >

 <div id="hiddenDivNew" class="hiddenDiv">
 <TABLE id=tbhelp style="border-top-width : 1px;border-right-width : 1px;border-bottom-width : 1px;border-left-width : 1px;
	border-color: #0b23b5;
	border-style : solid solid solid solid;
	filter:progid:DXImageTransform.Microsoft.dropshadow(OffX=3, OffY=3, Color='gray', Positive='true');">
	<tr id="trdark"> 
      <td align=CENTER width="18%"> 
        <div align="right">Codigo de Tabla :</div>
      </td>
      <td align=CENTER width="34%"> 
        <div align="left"> 
         <input type="text" name="TABLEN" id="TABLEN" size="3" maxlength="2">       
        </div>
      </td>
    </tr>
	<tr id="trclear"> 
      <td align=CENTER width="18%"> 
        <div align="right">Descripción :</div>
      </td>
      <td align=CENTER width="34%"> 
        <div align="left"> 
         <input type="text" name="DESCRIPTION" id="DESCRIPTION" size="65" maxlength="60">       
        </div>
      </td>
    </tr>

	<tr id="trdark"> 
      <td align=CENTER width="18%"> 
        <div align="right">A nivel de :</div>
      </td>
      <td align=CENTER width="34%"> 
          <div align="left"> 
            <select name="CODE" id="CODE">
			  <option value=""></option>
              <option value="AC">Cuenta</option>
              <option value="CC">Cliente Corporativo</option>
              <option value="CP">Cliente Personal</option>
              <option value="PC">Propuesta de Credito</option>
            </select>
          </div>
      </td>
    </tr>

   <tr id="trclear">
   
   <TD ALIGN=center nowrap colspan="2">
	     <input id="EIBSBTN" type=button name="Submit" value="Submit" onClick="javascript:goAction(1)"> 
   </TD>
   
   </tr>
 </TABLE>
</div>




  <%
	if ( EDI010Help.getNoResult() ) {
 %> 
  <p>&nbsp;</p><TABLE class="tbenter" width="100%" >
    <TR>
      <TD > 
        <div align="center"> 
          <p><b>No hay resultados para su b&uacute;squeda</b></p>
          <table class="tbenter" width=100% align=center>
           <tr>
            <td class=TDBKG>
                <div id="eibsNew" align="center" style="cursor:pointer"><a><b>Crear</b></a></div>
              </td>
              <td class=TDBKG>
                <div align="center"><a href="<%=request.getContextPath()%>/pages/background.jsp"><b>Salir</b></a></div>
              </td>
           </tr>
         </table>
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
      <td class=TDBKG width="33%"> 
        <div id="eibsNew" align="center" style="cursor:pointer"><a><b>Crear</b></a></div>
      </td>
      <td class=TDBKG width="33%"> 
        <div align="center"><a href="javascript:goAction(2)"><b>Modificar</b></a></div>
      </td>
      <td class=TDBKG width="33%"> 
        <div align="center"><a href="<%=request.getContextPath()%>/pages/background.jsp"><b>Salir</b></a></div>
      </td>
    </tr>
  </table>
   
  <br>
  
  <TABLE  id=cfTable class="tableinfo"  height="70%">
    <tr height="5%"> 
    <TD NOWRAP valign="top" width="100%">
        <table id="headTable" width="100%">
          <tr id="trdark"> 
            <th align=CENTER nowrap width="9%">&nbsp;</th>
            <th align=CENTER nowrap width="20%"> 
              <div align="center">Tabla</div>
            </th>
            <th align=CENTER nowrap width="30%"> 
              <div align="center">M&oacute;dulo</div>
            </th>
            <th align=CENTER nowrap width="41%"> 
              <div align="left">Descripci&oacute;n</div>
            </th>
          </tr>
        </table>
      </td>
    </tr>    
		  <tr height="95%">    
		    <td valign="top">       
		       <div id="dataDiv1" style="height:400px; overflow:auto;"> 
		       <table id="dataTable" cellspacing="0" cellpadding="1" border="0" width="100%">         
          		<%
                EDI010Help.initRow();
				int k=1;
                while (EDI010Help.getNextRow()) {
                 
                  out.println(EDI010Help.getRecord());
                  k++;   
                }
              %> 
          
        </table>
        </div>
        </td>
        </tr>
    </table>
     
  <%}%>
<SCRIPT type="text/javascript">
  
  showChecked("ACCNUM");
  
 	document.getElementById("hiddenDivNew").onclick=cancelBub;
	document.getElementById("eibsNew").onclick=showHiddenDivNew;
  
</SCRIPT>
  
</form>

</body>
</html>
