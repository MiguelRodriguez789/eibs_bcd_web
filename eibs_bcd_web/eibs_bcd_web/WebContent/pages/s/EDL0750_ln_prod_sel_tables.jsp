<html>
<head>
<title>TABLAS DE ESTRUCTURAS DE PRESTAMOS</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "EDL0750Help" class= "datapro.eibs.beans.JBList"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "TABLEN" class= "java.lang.String"  scope="session" />
<jsp:useBean id= "BANK" class= "java.lang.String"  scope="session" />
<jsp:useBean id= "CLASEN" class= "java.lang.String"  scope="session" />
<jsp:useBean id= "COMISIONN" class= "java.lang.String"  scope="session" />

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>

<SCRIPT type="text/javascript">
       
     //builtNewMenu(prd_loan_opt);
     //initMenu();
       
</SCRIPT>

<script type="text/javascript">
function showProd () {
	document.getElementById("hiddenDivNew").style.display="";
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

function goAction(op) {

	document.forms[0].opt.value = op;
	document.forms[0].submit();
  
}

function eliminar(op) {
	if (confirm("¿Esta seguro que desea eliminar la Tabla?")==true){
		document.forms[0].opt.value = op;
		document.forms[0].submit();
	}
}


function getParams(bnk,tab,cls,cma) {

    document.forms[0].BANK.value = bnk;
	document.forms[0].TABLEN.value = tab;
	document.forms[0].CLASEN.value = cls;
	document.forms[0].COMISIONN.value = cma;
    
}

addEventHandler(document, 'click', closeHiddenDivNew);

</SCRIPT>  

</head>

<BODY>
<h3 align="center">Tablas de Desarrollo</h3>
<hr size="4">
<FORM name="form1" METHOD="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.params.JSEDL0750" >
  <input type=HIDDEN name="SCREEN" value="2">
  <input type=HIDDEN name="opt" value="1">
  <input type=HIDDEN name="totalRow" value="0">
  <input type=HIDDEN name="BANK" value="">
  <input type=HIDDEN name="ACD" value="">
  <input type=HIDDEN name="TABLEN" value="">
  <input type=HIDDEN name="CLASEN" value="">
  <input type=HIDDEN name="COMISIONN" value="">
  <div id="hiddenDivNew" title="hiddenDivNew" class="hiddenDiv" style="display:none">
    <table id=tbhelp style="border-top-width : 1px;border-right-width : 1px;border-bottom-width : 1px;border-left-width : 1px;
	border-color: #0b23b5;
	border-style : solid solid solid solid;
	filter:progid:DXImageTransform.Microsoft.dropshadow(OffX=3, OffY=3, Color='gray', Positive='true');">
      <tr id="trdark"> 
        <td align=CENTER width="18%"> 
          <div align="right">Codigo de Tabla :</div>
        </td>
        <td align=CENTER width="34%"> 
          <div align="left"> 
            <input type="text" name="TABLE" size="5" maxlength="4">
          </div>
        </td>
      </tr>
      <tr id="trclear"> 
        <td align=CENTER width="18%"> 
          <div align="right">Clase :</div>
        </td>
        <td align=CENTER width="34%"> 
          <div align="left"> 
              <select name="CLASE">
                <option value="01">Activo</option>
                <option value="02">Pasivo</option>
              </select>
          </div>
        </td>
      </tr>
      <tr id="trdark"> 
        <td align=CENTER width="18%"> 
          <div align="right">Comisión :</div>
        </td>
        <td align=CENTER width="34%"> 
          <div align="left"> 
            <input type="text" name="COMISION"  size="10" maxlength="6" onKeypress="enterDecimal()" >
          </div>
        </td>
      </tr>
      <tr id="trclear"> 
        <td align=center nowrap colspan="2"> 
          <input id="EIBSBTN" type=button name="Submit" value="Enviar" onClick="javascript:goAction(1)">
        </td>
      </tr>
    </table>
  </div>
  <%
	if ( EDL0750Help.getNoResult() ) {
 %>
  <p>&nbsp;</p><TABLE class="tbenter" width="100%" >
    <TR>
      <TD > 
        <div align="center"> 
          <p><b>No hay resultados para su b&uacute;squeda</b></p>
          <table class="tbenter" width=100% align=center>
           <tr>
            <td class=TDBKG>
                <div id="eibsNew" align="center" style="cursor:pointer"><a  href="javascript:showProd();"><b>Nueva</b></a></div>
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
      <td class=TDBKG width="20%"> 
      	<div id="eibsNew" align="center" style="cursor:pointer"><a  href="javascript:showProd();"><b>Nuevo</b></a></div>
      </td>
      <td class=TDBKG width="20%"> 
        <div align="center"><a href="javascript:goAction(2)"><b>Modificar</b></a></div>
      </td>
      <td class=TDBKG width="20%"> 
        <div align="center"><a href="javascript:eliminar(3)"><b>Eliminar</b></a></div>
      </td>
      <td class=TDBKG width="20%"> 
        <div align="center"><a href="javascript:goAction(4)"><b>Factores</b></a></div>
      </td>
      <td class=TDBKG width="20%"> 
        <div align="center"><a href="<%=request.getContextPath()%>/pages/background.jsp"><b>Salir</b></a></div>
      </td>
    </tr>
  </table>
   
  <br>
 
  <TABLE  id=cfTable class="tableinfo">
 <TR > 
    <TD NOWRAP valign="top" width="100%">
        <table id="headTable" width="100%">
          <tr id="trdark"> 
            <th align=CENTER nowrap width="10%">&nbsp;</th>
            <th align=CENTER nowrap width="15%"><div align="center">Tabla</div></th>
            <th align=CENTER nowrap width="15%"><div align="center">Clase</div></th>
            <th align=CENTER nowrap width="15%"><div align="center">Comision</div></th>
            <th align=CENTER nowrap width="30%"><div align="center">Descripcion</div></th>
            <th align=CENTER nowrap width="15%"><div align="center">Estado</div></th>
          </tr>
          <%
                EDL0750Help.initRow();
				int k=1;
                while (EDL0750Help.getNextRow()) {
                 
                  out.println(EDL0750Help.getRecord());
                  k++;   
                }
              %>
        </table>
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
