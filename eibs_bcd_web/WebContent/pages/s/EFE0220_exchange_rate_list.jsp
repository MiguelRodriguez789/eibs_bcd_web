<%@ page import = "datapro.eibs.master.Util" %>
<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@ page import="com.datapro.constants.EibsFields"%>
<html>
<head>
<title>Mantenimiento de Tasas de Cambio</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "EFE022001Help" class= "datapro.eibs.beans.JBObjList"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>

<script type="text/javascript">



function goAction(op) {

	document.forms[0].opt.value = op;
	document.forms[0].submit();
  
}
</SCRIPT>  

</head>

<BODY>
<h3 align="center">Mantenimiento de Tasas de Cambio<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="exchange_rate_list, EFE0220"></h3>
<hr size="4">
<FORM name="form1" METHOD="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.params.JSEFE0220" >
    <input type=HIDDEN name="SCREEN" value="800">
    <input type=HIDDEN name="totalRow" value="0">
    <input type=HIDDEN name="opt" value="1">


<div id="hiddenDiv" class="hiddenDiv">
    <table id=tbhelp style="border-top-width : 1px;border-right-width : 1px;border-bottom-width : 1px;border-left-width : 1px;
	border-color: #0b23b5;
	border-style : solid solid solid solid;
	filter:progid:DXImageTransform.Microsoft.dropshadow(OffX=3, OffY=3, Color='gray', Positive='true');">
      <tr id="trdark"> 
        <td align=CENTER width="18%"> 
          <div align="right">Banco :</div>
        </td>
        <td align=CENTER width="34%"> 
          <div align="left"> 
			<eibsinput:text property="E01RATBNK" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_BANK %>" />
          </div>
        </td>
      </tr>
      <tr id="trdark"> 
        <td align=CENTER width="18%"> 
          <div align="right">Moneda :</div>
        </td>
        <td align=CENTER width="34%"> 
          <div align="left"> 
			<eibsinput:text property="E01RATCCY" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CURRENCY %>" />
          </div>
        </td>
      </tr>
      <tr id="trclear"> 
        <td align=center nowrap colspan="2"> 
          <input id="EIBSBTN" type=button name="Submit" value="Enviar" onClick="javascript:goAction('1')">
        </td>
      </tr>
    </table>
</div>

  
    <%
	if ( EFE022001Help.getNoResult() ) {
 %>
  
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
            <% if( !"1".equals( currUser.getH01WK1() ) ){ %>
              <td class=TDBKG width="30%"> 
				<td align="center" id="eibsNew" class="tdbkg" width="20%"><b>Crear</b></td>
            <% } %>
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
 
          
  <table class="tbenter" width=100% align=center>
    <tr>
      <% if( "1".equals( currUser.getH01WK1() ) ){ %>
	      <td class=TDBKG width="25%"> 
	        <div align="center"><a href="javascript:goAction(2)"><b>Consultar</b></a></div>
	      </td>     
      <% } else { %>
  	      <td align="center" id="eibsNew" class="tdbkg" width="20%"><b>Crear</b></td>
	      <td class=TDBKG width="30%"> 
	        <div align="center"><a href="javascript:goAction(2)"><b>Modificar</b></a></div>
	      </td>
      <% } %>
	      <td class=TDBKG width="30%"> 
	        <div align="center"><a href="<%=request.getContextPath()%>/pages/background.jsp"><b>Salir</b></a></div>
	      </td>

    </tr>
  </table>
   
  <br>
  <TABLE  id="mainTable" class="tableinfo" ALIGN=CENTER style="width:'95%'">
 			   <TR> 
    			     
      <TD NOWRAP width="100%" height="73" > 
        <table id="headTable" style="width: 100%">
  				   <TR id="trdark">  
            		<th align=CENTER nowrap width="5%">&nbsp;</th>
            		
            <th align=center nowrap width="10%">Moneda</th>
            		
            <th align=center nowrap width="10%"> Ultimo <br>Cambio</th>
			<th align=right nowrap width="15%"> Tasa <br>Oficial</th> 	  
		   <th align=right nowrap width="15%"> Tasa de<br>Compra</th>
		   <th align=right nowrap width="15%"> Tasa de<br>Venta</th>
		   <th align=right nowrap width="15%"> Tasa <br> Eqv. USD</th>
		   <th align=right nowrap width="15%"> Tasa de<br> IVA</th>
		    </TR>
       			</TABLE>
  
   			    <div id="dataDiv1" class="scbarcolor">
    				<table id="dataTable" > 
          <%
				boolean firstTime = true;
				String chk = "";
                EFE022001Help.initRow();
                while (EFE022001Help.getNextRow()) {
				if (firstTime) {
					firstTime = false;
					chk = "checked";
				} else {
					chk = "";
				}                 
                datapro.eibs.beans.EFE022001Message msgList = (datapro.eibs.beans.EFE022001Message) EFE022001Help.getRecord();
		 %>
		 	<tr> 
            <td NOWRAP  align=CENTER width="5%"> 
              <input type="radio" name="CURRCODE" value="<%= EFE022001Help.getCurrentRow() %>" <%=chk%>  >
            </td>
            <td NOWRAP  align=center width="5%"><%= msgList.getE01RATCCY() %></td>
            <td NOWRAP  align=center width="10%"><%= Util.formatCustomDate(currUser.getE01DTF(),
            																msgList.getBigDecimalE01RATPUM().intValue(),
            																msgList.getBigDecimalE01RATPUD().intValue(),
            																msgList.getBigDecimalE01RATPUY().intValue()) %></td>
			<td NOWRAP  align=right width="10%"><%= msgList.getE01RATEXR() %></td>
			<td NOWRAP  align=right width="15%"><%= msgList.getE01RATCPR() %></td>
			<td NOWRAP  align=right width="15%"><%= msgList.getE01RATCSR() %></td>
			<td NOWRAP  align=right width="15%"><%= msgList.getE01RATUSD() %></td>
			<td NOWRAP  align=right width="15%"><%= msgList.getE01RATRF2() %></td>
          </tr>
          <%
                }
              %>
			 </table>
   			</div>
   			</TD>
   		      </TR>	
		    </TABLE>

	  
    				 
<SCRIPT type="text/javascript">
     showChecked("CURRCODE");

	function resizeDoc() {
 		adjustEquTables(getElement('headTable'),getElement('dataTable'), getElement('dataDiv1'),1,false);
    }
	function closeHiddenDivNew(){
		setVisibility(document.getElementById("hiddenDiv"), "hidden");
	}
	
	function showHiddenDivNew(evt) {
		evt = (evt) ? evt : ((window.event) ? window.event : "");
	 	
		var hiddenDiv = document.getElementById("hiddenDiv");
	
		var y=evt.clientY + document.body.scrollTop;
		var x=evt.clientX + document.body.scrollLeft;
	     
		cancelBub(evt);
	
		moveElement(hiddenDiv, y, x);
		setVisibility(hiddenDiv, "visible");
		 
	}     		

	resizeDoc();   			
   	window.onresize=resizeDoc;       
     		
	addEventHandler(document, 'click', closeHiddenDivNew);	  
 	if (isValidObject(document.getElementById("eibsNew"))){
 		addEventHandler(getElement("hiddenDiv"), 'click', cancelBub);	  
 		addEventHandler(getElement("eibsNew"), 'click', showHiddenDivNew);	  
 	}
     		 
     </SCRIPT>
  
     


<%}%>


</FORM>
</body>
</html>
