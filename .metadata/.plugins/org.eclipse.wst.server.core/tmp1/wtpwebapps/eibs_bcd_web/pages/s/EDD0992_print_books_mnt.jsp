<%@ page import = "datapro.eibs.master.Util" %>
<%@ page import="datapro.eibs.beans.EDL090002Message"%>
<%@ page import="datapro.eibs.beans.EDL090003Message"%>
<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput"%>
<%@page import="com.datapro.eibs.constants.HelpTypes"%>
<%@page import="com.datapro.constants.EibsFields"%>

<HTML>
<HEAD>
<TITLE>
Lineas de Impresion de Libretas de Ahorro
</TITLE>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "EDD0992DSHelp" class= "datapro.eibs.beans.JBObjList"  scope="session" />

<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
 
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>
 

<SCRIPT type="text/javascript">

function goAction(op) {

	if (op == "1") {
		document.forms[0].SCREEN.value="300";
		document.forms[0].H01OPECOD.value = "0005";
		document.forms[0].submit();
//        page= "${pageContext.request.contextPath}/pages/s/EDD0992_print_books_confirm.jsp"
//			CenterWindow(page,600,400,2);

//			ShowAMT();


	} 
	if (op == "2") {
		document.forms[0].SCREEN.value="300";
		document.forms[0].H01OPECOD.value = "0010";
		document.forms[0].submit();
	} 
}

function getParams(currrow,MM,DD,YY,TIM) {
	document.forms[0].CURRENTROW.value = currrow;
	document.forms[0].E01PBTDTM.value = MM;
	document.forms[0].E01PBTDTD.value = DD;
	document.forms[0].E01PBTDTY.value = YY;
	document.forms[0].E01PBTTIM.value = TIM;
}

 function ShowAMT() {	 
	 var y= opTable.offsetTop + 10;
     var x= opTable.offsetLeft + (AMT.clientWidth /2);
	 //cancelBub();
	 eval('AMT.style.pixelTop=' + y);
     eval('AMT.style.pixelLeft=' + x);
	 AMT.filters[0].apply();
     AMT.style.visibility="visible";
     AMT.filters[0].Play();
	 //document.forms[0].RUTNUM.focus();
 }

 function hideAMT(){
      AMT.style.visibility="hidden";
 }

 addEventHandler(document, 'click', hideAMT);



</SCRIPT>

</head>

<body>
<%-- 
<SCRIPT> initMenu(); </SCRIPT>
--%>

<h3 align="center">Lineas de Impresi&oacute;n de Libretas de Ahorro<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="print_books_inq.jsp,EDD0992"></h3>
<hr size="4">
<FORM Method="post" Action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDD0992" >
<INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="2">
<INPUT TYPE=HIDDEN NAME="CURRENTROW" VALUE="0"> 
<INPUT TYPE=HIDDEN NAME="E01PBTDTM"> 
<INPUT TYPE=HIDDEN NAME="E01PBTDTD"> 
<INPUT TYPE=HIDDEN NAME="E01PBTDTY"> 
<INPUT TYPE=HIDDEN NAME="E01PBTTIM"> 
<INPUT TYPE=HIDDEN NAME="H01OPECOD"> 





<%
	if ( EDD0992DSHelp.getNoResult() ) {
 %>
   		<TABLE class="tbenter" width=100% height=50%>
   		<TR>
      <TD> 
        <div align="center">
        		<font size="3"><b>
        				No hay resultados que correspondan a su criterio de búsqueda 
        		</b></font>
        	</div>
      </TD></TR>
   		</TABLE>

  <TABLE class="tbenter" width="100%" >
    <TR>
      <TD > 
        <div align="center"> 
          <table class="tbenter" width=100% align=center>
            <tr> 
              <td class=TDBKG width="100%"> 
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
	String chk = "";
 	if ( !error.getERRNUM().equals("0")  ) {
    	 error.setERRNUM("0");
     	out.println("<SCRIPT Language=\"Javascript\">");
     	out.println("       showErrors()");
     	out.println("</SCRIPT>");
     }
	
%> 
    <%
                EDD0992DSHelp.initRow();
                EDD0992DSHelp.getNextRow();                 
                  datapro.eibs.beans.EDD0992DSMessage msg0992c = (datapro.eibs.beans.EDD0992DSMessage) EDD0992DSHelp.getRecord();
		 %>


  <table class="tableinfo" >
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
          <tr id="trdark"> 
            <td nowrap width="16%" > 
              <div align="right"><b>Cliente :</b></div>
            </td>
            <td nowrap width="20%" > 
              <div align="left"> 
                <input type="text" name="CUSCUN" size="9" maxlength="9" value="<%= msg0992c.getE01CUSCUN().trim()%>" readonly>
              </div>
            </td>
            <td nowrap width="16%" > 
              <div align="right"><b>Nombre :</b> </div>
            </td>
            <td nowrap colspan="3" > 
              <div align="left"><font face="Arial"><font face="Arial"><font size="2"> 
                <input type="text" name="CUSNA1" size="45" readonly maxlength="45" value="<%= msg0992c.getE01CUSNA1().trim()%>" >
                </font></font></font></div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="16%"> 
              <div align="right"><b>Cuenta :</b></div>
            </td>
            <td nowrap width="20%"> 
              <div align="left"> 
                <input type="text" name="E01ACMACC" size="12" readonly maxlength="12" value="<%= msg0992c.getE01PBTACC().trim()%>" >
              </div>
            </td>
            <td nowrap width="16%"> 
              <div align="right"><b>Moneda : </b></div>
            </td>
            <td nowrap width="16%"> 
              <div align="left"> 
                <input type="text" name="PROCCY" size="4" readonly maxlength="4" value="<%= msg0992c.getE01ACMCCY().trim()%>">
              </div>
            </td>
            <td nowrap width="16%"> 
              <div align="right"><b>Producto : </b></div>
            </td>
            <td nowrap width="16%"> 
              <div align="left"> 
                <input type="text" name="PROCOD" size="4" readonly maxlength="4" value="<%= msg0992c.getE01ACMPRO().trim()%>">
              </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <TABLE class="tbenter" width="100%" >
    <TR>
      <TD > 
        <div align="center"> 
          <table class="tbenter" width=100% align=center>
            <tr> 
              <td class=TDBKG width="30%"> 
                <div align="center"><a href="javascript:goAction(1)"><b>Enviar</b></a></div>
              </td>
              <td class=TDBKG width="30%"> 
                <div align="center"><a href="<%=request.getContextPath()%>/pages/background.jsp"><b>Salir</b></a></div>
              </td>
            </tr>
          </table>
        </div>
	  </TD>
	</TR>
    </TABLE>
	<table class="tableinfo">
    <tr > 
      <td nowrap>
        
        <table cellspacing=0 cellpadding=2 width="100%" border="0">
          <tr id="trclear"> 
            <td > 
              <div align="right"><b>Saldo de Libreta : </b></div>
            </td>
            <td >
               <input type="text" name="E01BOKBAL" size="16" maxlength="15" value="<%= msg0992c.getE01BOKBAL().trim()%>" onKeypress="enterDecimal()">
			</td>
            <td >
		       <INPUT id="EIBSBTN" type="button" name="Actualizar" value="Actualizar Saldo de Libreta" onclick="goAction(2)">
			</td>
<%--
            <td > 
              <div align="right"><b>Total de D&eacute;bitos : </b></div>
            </td>
            <td >
               <input type="text" name="E01TOTDEB" size="12" maxlength="12" value="<%= msg0992c.getE01TOTDEB().trim()%>" readonly>
			</td>
            <td > 
              <div align="right"><b>Total de C&eacute;ditos : </b></div>
            </td>
            <td >
              <input type="text" name="E01TOTCRE" size="12" maxlength="12" value="<%= msg0992c.getE01TOTCRE().trim()%>" readonly>
			</td>
--%>
        </tr>
        </table>
      </td>
    </tr>
  </table>

  
  <TABLE class="tableinfo" id="opTable">
    <TR id="trdark"> 
      <TH align=CENTER nowrap width="5%">&nbsp;</th>
      <TH ALIGN=CENTER>Fecha</TH>
      <TH ALIGN=CENTER>Hora</TH>
      <TH ALIGN=CENTER>TR</TH>
      <TH ALIGN=CENTER>Descripción</TH>
      <TH ALIGN=CENTER>Monto</TH>
      <TH ALIGN=CENTER>Saldo</TH>
      <TH ALIGN=CENTER>Cajero</TH>
      <TH ALIGN=CENTER>DB/CR</TH>
      <TH ALIGN=CENTER>Referencia</TH>
    </TR>
    <%
                EDD0992DSHelp.initRow();
                chk = "checked";
                while (EDD0992DSHelp.getNextRow()) {
                 
                  datapro.eibs.beans.EDD0992DSMessage msg0992 = (datapro.eibs.beans.EDD0992DSMessage) EDD0992DSHelp.getRecord();
		 %>
          <tr> 
            <td NOWRAP  align=CENTER width="10%"> 
              <input type="radio" name="CURRCODE" value="<%= EDD0992DSHelp.getCurrentRow() %>" <%=chk%> onClick="getParams(this.value,'<%= msg0992.getE01PBTDTM() %>','<%= msg0992.getE01PBTDTD() %>','<%= msg0992.getE01PBTDTY() %>','<%= msg0992.getE01PBTTIM() %>');">
            </td>
			<td NOWRAP  align=CENTER width=\"10%\"><%= Util.formatCustomDate(currUser.getE01DTF(),
					msg0992.getBigDecimalE01PBTDTM().intValue(),
					msg0992.getBigDecimalE01PBTDTD().intValue(),
					msg0992.getBigDecimalE01PBTDTY().intValue())%></td>
			<td NOWRAP  align=CENTER width=\"10%\"><%= msg0992.getE01PBTTIM() %></td>
            <td NOWRAP  align=LEFT width=\"5%\"><%= msg0992.getE01PBTCDE() %></td>
			<td NOWRAP  align=CENTER width=\"25%\"><%= msg0992.getE01PBTNAR() %></td>
            <td NOWRAP  align=LEFT width=\"10%\"><%= msg0992.getE01PBTAMT() %></td>
            <td NOWRAP  align=LEFT width=\"10%\"><%= msg0992.getE01ENDBAL() %></td>
			<td NOWRAP  align=CENTER width=\"10%\"><%= msg0992.getE01PBTRLR() %></td>
			<td NOWRAP  align=CENTER width=\"10%\"><%= msg0992.getE01PBTDCC() %></td>
			<td NOWRAP  align=CENTER width=\"10%\"><%= msg0992.getE01PBTREF() %></td>
	        </tr>
     <%
			chk = "";     

       }
     %>
  </TABLE>
<div id="AMT" style="position:absolute; visibility:hidden; left : 0px; top : -50px; z-index:3; filter:progid:DXImageTransform.Microsoft.Fade(duration=1.0,overlap=1.0)}" onclick="cancelBub()">
 <TABLE id=tbhelp style="border-top-width : 1px;border-right-width : 1px;border-bottom-width : 1px;border-left-width : 1px;
	border-color: #0b23b5;
	border-style : solid solid solid solid;
	filter:progid:DXImageTransform.Microsoft.dropshadow(OffX=3, OffY=3, Color='gray', Positive='true');">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap width="500"> 
		
		<TABLE id="tbenter" align="center" style="width: 100%" border="0">
			<TBODY>
		  <tr> 
            <td nowrap width="50%"> 
              <div align="right">Fecha :</div>
            </td>
            <td nowrap width="50%"> 
              <input type="text" name="TIME" size="12" >
            </td>
          </tr>
<%--
		  <tr> 
            <td nowrap width="50%"> 
              <div align="right">Hora :</div>
            </td>
            <td nowrap width="50%"> 
              <input type="text" name="E01PBTTIM" value= "<%= document.forms[0].E01PBTTIM.value %>" size="10" >
            </td>
          </tr>
		  <tr> 
            <td nowrap width="50%"> 
              <div align="right">Transaccion :</div>
            </td>
            <td nowrap width="50%"> 
              <input type="text" name="E01PBTCDE" size="6" value= "<%= msg0992.getE01PBTCDE()%>" >
            </td>
          </tr>
		  <tr> 
            <td nowrap width="50%"> 
              <div align="right">Descripcion :</div>
            </td>
            <td nowrap width="50%"> 
              <input type="text" name="E01PBTNAR" size="40" value= "<%= msg0992.getE01PBTNAR()%>" >
            </td>
          </tr>
		  <tr> 
            <td nowrap width="50%"> 
              <div align="right">Monto :</div>
            </td>
            <td nowrap width="50%"> 
              <input type="text" name="E01PBTAMT" size="15" value= "<%= msg0992.getE01PBTAMT()%>" >
            </td>
          </tr>
--%>

			</TBODY>
		</TABLE>
	  <br>

	  <p align="center"> 
    	<input id="EIBSBTN" type=submit name="Submit" value="Enviar">
	  </p>
		
		
		</td>
    </tr>

 </TABLE>
</div>

  <BR>
  <TABLE class="tbenter" WIDTH="98%" ALIGN=CENTER>
  <TR>
  <TD WIDTH="50%" ALIGN=LEFT>
  <%
        if ( EDD0992DSHelp.getShowPrev() ) {
		int pos = EDD0992DSHelp.getFirstRec() - 20;
   			out.println("<A HREF=\""+request.getContextPath()+"/servlet/datapro.eibs.products.JSEDD0992?SCREEN=200&Pos=" + pos +"\"><img src=\""+request.getContextPath()+"/images/s/previous_records.gif\" border=0></A>");
        }
  %>
  </TD>
  <TD WIDTH="50%" ALIGN=RIGHT>
  <%
        if ( EDD0992DSHelp.getShowNext() ) {
		int pos = EDD0992DSHelp.getLastRec();
   			out.println("<A HREF=\""+request.getContextPath()+"/servlet/datapro.eibs.products.JSEDD0992?SCREEN=200&Pos=" + pos +"\"><img src=\""+request.getContextPath()+"/images/s/next_records.gif\" border=0></A>");
        }
  %> 
 </TD>
 </TR>
 </TABLE>

<%
  }
%>


</FORM>

</BODY>
</HTML>
