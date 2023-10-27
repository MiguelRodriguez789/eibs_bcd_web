<html>
<head>
<title>Remesas Bancos</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "EDD0701Help" class= "datapro.eibs.beans.JBList"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>

<script language="JavaScript">

function closeEnter(){
   	  //enterFee.filters[0].apply();
      enterFee.style.visibility="hidden";
      //enterFee.filters[0].Play();
}

function ShowEnterCod() {	 
	 var y=event.clientY + document.body.scrollTop;
     var x=event.clientX + document.body.scrollLeft;
	 cancelBub();
	 eval('enterFee.style.pixelTop=' + y);
     eval('enterFee.style.pixelLeft=' + x);
	 //enterFee.filters[0].apply();
     enterFee.style.visibility="visible";
     //enterFee.filters[0].Play();
	 
}


function goAction(op,bnew) {

	if (bnew == true) {    
		document.getElementById("LOC").value = document.getElementById("LOC1").value;
		document.getElementById("BAN").value = document.getElementById("BAN1").value;
		document.getElementById("SUC").value = document.getElementById("SUC1").value;
		document.getElementById("CCY").value = document.getElementById("CCY1").value;
	}
	
	document.getElementById("opt").value = op;
	document.forms[0].submit();
  
}


function getParams(loc, ban, suc, ccy) {

	document.getElementById("LOC").value = loc;
	document.getElementById("BAN").value = ban;
    document.getElementById("SUC").value = suc;
    document.getElementById("CCY").value = ccy;
    
}

function cancelBub(){
  event.cancelBubble = true;
}

document.onclick= closeEnter;


</SCRIPT>  

</head>

<BODY>
<h3 align="center">Remesas de Bancos<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="remesas_list.jsp, EDD0701"></h3>
<hr size="4">
<FORM name="form1" METHOD="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.params.JSEDD0701" >
  <input type=HIDDEN name="SCREEN" id="SCREEN" value="2">
  <input type=HIDDEN name="opt" id="opt" value="1">
  <input type=HIDDEN name="totalRow" id="totalRow" value="0">
  <input type=HIDDEN name="LOC" id="LOC" value=""> 
  <input type=HIDDEN name="BAN" id="BAN" value="">
  <input type=HIDDEN name="SUC" id="SUC" value="">
  <input type=HIDDEN name="CCY" id="CCY" value="">
  
  <div id="enterFee" style="position:absolute; visibility:hidden; left:25px; top:-50px; z-index:3; filter:progid:DXImageTransform.Microsoft.Fade(duration=1.0,overlap=1.0)" onClick="cancelBub()"> 
    <table id=tbhelp style="border-top-width : 1px;border-right-width : 1px;border-bottom-width : 1px;border-left-width : 1px;
	border-color: #0b23b5;
	border-style : solid solid solid solid;
	filter:progid:DXImageTransform.Microsoft.dropshadow(OffX=3, OffY=3, Color='gray', Positive='true');">
      <tr id="trdark"> 
        <td align=CENTER width="18%"> 
          <div align="right">Localidad :</div>
        </td>
        <td align=CENTER width="34%"> 
          <div align="left"> 
            <input type="text" name="LOC1" id="LOC1" size="5" maxlength="4" value="">
            <a href="javascript:GetCodeCNOFC('LOC1','89')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="ayuda" align="bottom" border="0" ></a> 
          </div>
        </td>
      </tr>
	  <tr id="trclear"> 
        <td align=CENTER width="18%"> 
          <div align="right">Banco :</div>
        </td>
        <td align=CENTER width="34%"> 
          <div align="left"> 
            <input type="text" name="BAN1" id="BAN1" size="5" maxlength="4" value="">
            <a href="javascript:GetCodeCNOFC('BAN1','92')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="bottom" border="0" ></a> 
          </div>
        </td>
      </tr>
      <tr id="trdark"> 
        <td align=CENTER width="18%"> 
          <div align="right">Sucursal :</div>
        </td>
        <td align=CENTER width="34%"> 
          <div align="left"> 
            <input type="text" name="SUC1" id="SUC1" size="5" maxlength="4" value="">
            <a href="javascript:GetBranch('SUC1','')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="bottom" border="0"  ></a>
          </div>
        </td>
      </tr>
	  <tr id="trclear"> 
        <td align=CENTER width="18%"> 
          <div align="right">Moneda :</div>
        </td>
        <td align=CENTER width="34%"> 
          <div align="left"> 
            <input type="text" name="CCY1" id="CCY1" size="4" maxlength="3" value="">
          <a href="javascript:GetCurrency('CCY1', ' ')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="bottom" border="0" ></a> 
          </div>
        </td>
      </tr>
       <tr id="trdark"> 
        <td align=center nowrap colspan="2"> 
          <input id="EIBSBTN" type=button name="Submit" value="Ingresar" onClick="javascript:goAction(1,true)">
        </td>
      </tr>
    </table>
  </div>

  <%
	if ( EDD0701Help.getNoResult() ) {
 %>
  <p>&nbsp;</p><TABLE class="tbenter" width="100%" >
    <TR>
      <TD > 
        <div align="center"> 
          <p><b>No hay registros para su criterio de búsqueda</b></p>
          <table class="tbenter" width=100% align=center>
           <tr>
           <td class=TDBKG>
                <div align="center" style="cursor:hand" onClick="ShowEnterCod()"><a><b>Crear</b></a></div>
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
	
  <% } else {%>

<% 
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
        <div align="center" style="cursor:hand" onClick="ShowEnterCod()"><a><b>Crear</b></a></div>
      </td>
      <td class=TDBKG width="25%"> 
        <div align="center"><a href="javascript:goAction(2, false)"><b>Modificar</b></a></div>
      </td>
      <td class=TDBKG width="25%"> 
        <div align="center"><a href="javascript:goAction(3, false)"><b>Eliminar</b></a></div>
      </td>
      <td class=TDBKG width="25%"> 
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
            <th align=CENTER nowrap width="10%">Localidad</th>
            <th align=CENTER nowrap width="10%"> 
              <div align="center">Banco</div>
            </th>
            <th align=CENTER nowrap width="10%"> 
              <div align="center">Sucursal</div>
            </th>
            <th align=CENTER nowrap width="40%"> 
              <div align="center">Nombre</div>
            </th>
            <th align=CENTER nowrap width="10%">Moneda</th>
          </tr>
          <%
                EDD0701Help.initRow();
				int k=1;
                while (EDD0701Help.getNextRow()) {
                 
                  out.println(EDD0701Help.getRecord());
                  k++;   
                }
              %>
        </table>
    </table>
     
  <%}%>

<SCRIPT language="JavaScript">
  
  showChecked("ACCNUM");
  
</SCRIPT>
</form>

</body>
</html>
