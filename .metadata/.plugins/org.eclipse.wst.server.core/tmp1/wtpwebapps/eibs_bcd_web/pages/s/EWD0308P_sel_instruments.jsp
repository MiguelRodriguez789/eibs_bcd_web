<html>
<head>
<title>Instrumentos</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "EWD0308Help" class= "datapro.eibs.beans.JBList"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>

<script type="text/javascript">

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
	
	document.forms[0].TYPE.focus();
}

function goAction(op) {

	document.forms[0].opt.value = op;
	document.forms[0].submit();
  
}

function getParams(code) {
    document.forms[0].CODE.value = code;
}

</SCRIPT>  

</head>

<BODY>
<h3 align="center">Administración de Instrumentos<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="sel_instruments.jsp, EWD0308P"></h3>
<hr size="4">
<FORM name="form1" METHOD="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.invest.JSEWD0308P" >
  <input type=HIDDEN name="SCREEN" value="2">
  <input type=HIDDEN name="opt" value="1">
  <input type=HIDDEN name="totalRow" value="0">
  <input type=HIDDEN name="CODE">
  <input type=HIDDEN name="NEXTE" value="Y">
  
  <div id="hiddenDivNew" class="hiddenDiv">
 <TABLE id=tbhelp style="border-top-width : 1px;border-right-width : 1px;border-bottom-width : 1px;border-left-width : 1px;
	border-color: #0b23b5;
	border-style : solid solid solid solid;
	filter:progid:DXImageTransform.Microsoft.dropshadow(OffX=3, OffY=3, Color='gray', Positive='true');">
	<tr id="trdark"> 
      <td align=CENTER width="18%"> 
        <div align="right">Tipo de Instrumento :</div>
      </td>
      <td align=CENTER width="34%" align="left"> 
        <SELECT name="TYPE">
			<OPTION value="ACD" >Productos(Commodities)</OPTION>
			<OPTION value="EQT" >Acciones</OPTION>
			<OPTION value="MUT" >Fondos Mutuales</OPTION>
			<OPTION value="BND" >Bonos</OPTION>
			<OPTION value="PFS" >Acciones Preferentes</OPTION>
		</SELECT>
      </td>
    </tr>
   <tr id="trclear">
   <td align=center nowrap colspan=2>
	     <input id="EIBSBTN" type=button name="Submit" value="Enviar" onClick="javascript:goAction(1)"> 
	     <input id="EIBSBTN" type=button name="SalirEvt" value="Cerrar" onClick="javascript:closeHiddenDivNew()"> 
   </td>
   </tr>
 </TABLE>
</div>




  <%
	if ( EWD0308Help.getNoResult() ) {
 %> 
  <p>&nbsp;</p><TABLE class="tbenter" width="100%" >
    <TR>
      <TD > 
        <div align="center"> 
          <p><b>No hay resultados, por favor refine su criterio de búsqueda o seleccione una de las siguientes opciones</b></p>
          <table class="tbenter" width=100% align=center>
           <tr>
            <td class=TDBKG>
                <div align="center" style="cursor:hand" onClick="showHiddenDivNew()"><a><b>Nuevo</b></a></div>
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
        <div align="center" style="cursor:hand" onClick="showHiddenDivNew()"><a><b>Nuevo</b></a> 
        </div>
      </td>
      <td class=TDBKG width="33%"> 
        <div align="center"><a href="javascript:goAction(2)"><b>Mantenimiento</b></a></div>
      </td>
      <td class=TDBKG width="33%"> 
        <div align="center"><a href="<%=request.getContextPath()%>/pages/background.jsp"><b>Salir</b></a></div>
      </td>
    </tr>
  </table>
   
  <br>
  
  <TABLE  id="mainTable" class="tableinfo">
 <TR > 
    <TD NOWRAP valign="top" width="100%" >
        <table id="headTable" width="100%" >
          <tr id="trdark"> 
             <th align=CENTER nowrap >&nbsp;</th>
            <th align=CENTER nowrap>Código</th>
            <th align=CENTER nowrap>Descripción</th>
            <th align=CENTER nowrap>Tipo</th>
            <th align=CENTER nowrap>Moneda</th>
            <th align=CENTER nowrap>Símbolo</th>
            <th align=CENTER nowrap>ISIN</th>
            <th align=CENTER nowrap>CUSIP</th>
            <th align=CENTER nowrap>Estado<BR>Interno</th>
            <th align=CENTER nowrap>Fecha<br>Emisión</th>
          </tr>
        </table>
     <div id="dataDiv1" class="scbarcolor" >
    <table id="dataTable" > 
		<%
                EWD0308Help.initRow();
				int k=1;
                while (EWD0308Help.getNextRow()) {
                 
                  out.println(EWD0308Help.getRecord());
                  k++;   
                }
              %> 
    </table>
   </div>
</Table>
<SCRIPT type="text/javascript">
     document.forms[0].totalRow.value="<%= k %>";
     function resizeDoc() {    
       divResize(false);
          	adjustEquTables(getElement('headTable'),getElement('dataTable'), getElement('dataDiv1'),1,false);
      }

     resizeDoc();
    
     window.onresize=resizeDoc;
     
     try {
	     document.forms[0].index[0].click();
	 } catch (e) {
	     document.forms[0].index.click();
	 }
     
</SCRIPT>
<TABLE class="tbenter" WIDTH="98%" ALIGN=CENTER>
  <TR>
  <TD WIDTH="50%" ALIGN=LEFT>
  <%
        if ( EWD0308Help.getShowPrev() ) {
      			int pos = EWD0308Help.getFirstRec() - 51;
      			out.println("<A HREF=\""+request.getContextPath()+"/servlet/datapro.eibs.invest.JSEWD0308P?SCREEN=1&PREFINST="+userPO.getHeader9()+"&Pos=" + pos +"\"><IMG border=\"0\" src=\""+request.getContextPath()+"/images/s/previous_records.gif\" ></A>");
        }
   %>  
  </TD>
  <TD WIDTH="50%" ALIGN=RIGHT>     
 <% 
        if ( EWD0308Help.getShowNext() ) {
      			int pos = Integer.parseInt(userPO.getHeader8());
      			out.println("<A HREF=\""+request.getContextPath()+"/servlet/datapro.eibs.invest.JSEWD0308P?SCREEN=1&PREFINST="+userPO.getHeader9()+"&Pos=" + pos +"\"><IMG border=\"0\" src=\""+request.getContextPath()+"/images/s/next_records.gif\" ></A>");
        }
  %> 
   </TD>
 	</TR>
 	</TABLE>
<%}%>


  </form>

</body>
</html>
