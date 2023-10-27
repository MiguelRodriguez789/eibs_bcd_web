<html>
<head>
<title>FACTORES</title>
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
<h3 align="center">Factores</h3>
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
          <div align="right">Código de Tabla :</div>
        </td>
        <td align=CENTER width="34%"> 
          <div align="left"> 
            <input type="text" name="TABLE" size="6" maxlength="4" value="<%=TABLEN%>">
          </div>
        </td>
      </tr>
      <tr id="trclear"> 
        <td align=CENTER width="18%"> 
          <div align="right">Clase :</div>
        </td>
        <td align=CENTER width="34%"> 
          <div align="left"> 
            <input type="text" name="CLASE" size="3" maxlength="2" value="<%=CLASEN%>"  onkeypress="enterInteger(event)">
          </div>
        </td>
      </tr>
      <tr id="trdark"> 
        <td align=CENTER width="18%"> 
          <div align="right">Comisión :</div>
        </td>
        <td align=CENTER width="34%"> 
          <div align="left"> 
            <input type="text" name="COMISION"  size="12" maxlength="10" value="<%=COMISIONN%>"  onkeypress="enterDecimal()">
          </div>
        </td>
      </tr>
      <tr id="trclear"> 
        <td align=CENTER width="18%"> 
          <div align="right">Nro. Cupón :</div>
        </td>
        <td align=CENTER width="34%"> 
          <div align="left"> 
            <input type="text" name="NROCUPON"  size="7" maxlength="5"  onkeypress="enterInteger(event)">
          </div>
        </td>
      </tr>
      <tr id="trdark"> 
        <td align=center nowrap colspan="2"> 
          <input id="EIBSBTN" type=button name="Submit" value="Enviar" onClick="javascript:goAction(5)">
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
        <div align="center"><a href="javascript:goAction(6)"><b>Modificar</b></a></div>
      </td>
      <td class=TDBKG width="20%"> 
        <div align="center"><a href="javascript:eliminar(7)"><b>Eliminar</b></a></div>
      </td>
      <td class=TDBKG width="20%"> 
        <div align="center"><a href="javascript:goAction(8)"><b>Generar Factores</b></a></div>
      </td>
      <td class=TDBKG width="20%"> 
        <div align="center"><a href="<%=request.getContextPath()%>/pages/background.jsp"><b>Salir</b></a></div>
      </td>
    </tr>
  </table>
   
  <br>
<table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
          <tr id="trdark"> 
            <td nowrap width="20%" align=right> 
              <b>Banco :</b>
            </td>
            <td nowrap width="20%" > 
              <input type="text" name="E01TDBBNK" size="4" maxlength="2" value="<%=BANK%>" readonly>
            </td>
            <td nowrap align=right width="20%"> 
              <b>Clase :</b>
            </td>
            <td nowrap width="20%" > 
               <input type="text" name="E01TDBCLS" size="5" maxlength="4" value="<%=CLASEN%>" readonly>
            </td>
            <td nowrap colspan=2> 
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="20%" align=right> 
              <b>Tabla :</b>
            </td>
            <td nowrap width="20%" >  
               <input type="text" name="E01TDBTBL" size="4" maxlength="2" value="<%=TABLEN%>" readonly>
            </td>
            <td nowrap align=right width="20%"> 
              <b>Comisión :</b>
            </td>
            <td nowrap width="20%" > 
               <input type="text" name="E01TDBCMA" size="5" maxlength="4" value="<%=COMISIONN%>" readonly>
            </td>
            <td nowrap colspan=2> 
            </td>
          </tr>
</table> 
  <br>
  
  <TABLE  id=cfTable class="tableinfo">
 <TR > 
    <TD NOWRAP valign="top" width="100%">
        <table id="headTable" width="100%">
          <tr id="trdark"> 
            <th align=CENTER nowrap width="5%">&nbsp;</th>
            <th align=CENTER nowrap width="10%"><div align="center">Nro.Cupon</div></th>
            <th align=CENTER nowrap width="10%"><div align="center">Capital</div></th>
            <th align=CENTER nowrap width="10%"><div align="center">Intereses</div></th>
            <th align=CENTER nowrap width="10%"><div align="center">Comision</div></th>
            <th align=CENTER nowrap width="10%"><div align="center">Dividendo</div></th>
            <th align=CENTER nowrap width="10%"><div align="center">Acumulado</div></th>
            <th align=CENTER nowrap width="10%"><div align="center">Saldo</div></th>
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
