<%@ page import = "datapro.eibs.master.Util" %>
<html>
<head>
<title>Entrada de Tiquetes</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<script src="<%=request.getContextPath()%>/pages/s/javascripts/eIBSTreasury.jsp"> </SCRIPT>
<script src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>

<script type="text/javascript">
	function analice() {
 		if (!document.forms[0].E01FESREF.value == "") {
    		document.forms[0].submit();
		}
	}

	function RefreshList() {
  		document.forms[0].action = "<%=request.getContextPath()%>/servlet/datapro.eibs.forex.JSEFE0000?SCREEN=3000";
  		document.forms[0].submit();
	}

	function getFields(opt, dsc, typ, pty) {
	document.forms[0].INPTOPT.value = opt;
	document.forms[0].INPTDSC.value = dsc;
	document.forms[0].INPTTYP.value = typ;
	document.forms[0].INPTPTY.value = pty;
}
</SCRIPT>
</head>

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>
<jsp:useBean id= "custList" class= "datapro.eibs.beans.JBList"   scope="session"/>
<jsp:useBean id= "trOption" class= "datapro.eibs.beans.TrOption"  scope="session" />
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />
<jsp:useBean id= "prdList" class= "datapro.eibs.beans.JBObjList"  scope="session" />
<jsp:useBean id= "currClient" class= "datapro.eibs.beans.ESD080001Message"  scope="session" />

<%
	String client = currClient != null ? currClient.getE01CUSCUN() : ""; 
	String name = currClient != null ? currClient.getE01CUSNA1() : ""; 
%>

<body bgcolor="#FFFFFF">
<H3 align="center"> Tesorer&iacute;a - Creación de Tiquetes
	<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="fe_enter_var_opt, EFE0000"></H3>

<hr size="4">

<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.forex.JSEFE0000">
<input type=HIDDEN name="SCREEN" value="200">
<input type=HIDDEN name="E01FESTYP">
<input type=HIDDEN name="INPTOPT" value="<%= trOption.getHeader1() == null ? "00" : Util.addLeftChar('0', 2, trOption.getHeader1()) %>">
<input type=HIDDEN name="INPTDSC" value="">
<input type=HIDDEN name="INPTTYP" value="">
<input type=HIDDEN name="INPTPTY" value="">


<table class="tableinfo" width="73%">
	<tr id="trintrot"> 
    	<td colspan="7"><%= currUser.getH01USR() %></td>
        <td width="20%"> 
          <div align="right"><%= datapro.eibs.master.Util.formatCustomDate(currUser.getE01DTF(), currUser.getE01RDM(),currUser.getE01RDD(),currUser.getE01RDY())%></div>
        </td>
	</tr>
      
<%
      	prdList.initRow();
      	int currentCol = 0;
      	String chk = "";
      	boolean firstTime = true;
      	
      	while (prdList.getNextRow()) {
      		datapro.eibs.beans.EWD0301DSMessage msgList = (datapro.eibs.beans.EWD0301DSMessage) prdList.getRecord();
      		if (currentCol == 0) { 
%>
      			<tr id="trintro">	
<%
			}
       	  	if (firstTime) {
       	  		if ("".equals(trOption.getHeader1().trim())) {
      				chk = "checked";
    				out.println("<SCRIPT Language=\"Javascript\">");
     				out.println("       getFields('" + msgList.getSWDACD() + "','" + msgList.getSWDDSC() + "','" + msgList.getSWDATY() + msgList.getRWDTYP() +"')");
     				out.println("</SCRIPT>");
      			}
       	  		firstTime = false;	
       	  	} else {
       	  		chk = "";
       	  	}
       	  	if (msgList.getSWDATY().equals(trOption.getHeader1())) {
       	  		chk = "checked";
				out.println("<SCRIPT Language=\"Javascript\">");
 				out.println("       getFields('" + msgList.getSWDACD() + "','" + "','" + msgList.getSWDDSC() + "','" + msgList.getSWDATY() + msgList.getRWDTYP() +"')");
 				out.println("</SCRIPT>");       	  		
       	  	}
       	  %>
        	<td width="5%" height="10">
        		<div align="center">	 
        			<input type="radio" name="CINPTOPT" value="<%=msgList.getSWDACD()%>" onClick="getFields('<%=msgList.getSWDACD()%>','<%=msgList.getSWDDSC()%>','<%=msgList.getSWDATY()%>','<%=msgList.getRWDTYP()%>')" <%=chk%>>
        		</div>
        	</td> 
        	<td width="20%" height="10">
        		<%= msgList.getSWDDSC()%>
        	</td>
          <% 
        	currentCol++;
        	if (currentCol == 4) {
        		currentCol = 0;	%>
        	</tr>
          <%}%>	
      <%}%>
      <tr id="trdark"> 
        <td colspan="8">&nbsp;</td>
      </tr>
      <tr id="trintro"> 
        <td colspan="2"> 
          <div align="right">Cliente : </div>
        </td>
        <td colspan="6"><div>
            <input type="text" name="CUNCOD" size="9" maxlength="9" value="<%= client %>">
            <input type="text" name="CUNDSC" size="50" maxlength="45" value="<%= name %>">
            <a href="javascript:GetCustomerDescId('CUNCOD','CUNDSC','')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="bottom" border="0" ></a></div>
        </td>
      </tr>
      <tr id="trintro"> 
        <td colspan="2"> 
          <div align="right">N&uacute;mero de Referencia: 
			</div>
        </td>
        <td colspan="6"><div>
          <input type="hidden" name="E01FESDID">
            <input type="hidden" name="E01FESTYPO">
            <input type="hidden" name="REFTYP" >
            <input type="text" name="E01FESREF" size="25" maxlength="20" onFocus="javascript:analice()" readonly>
          <a href="javascript:GetFeRef('E01FESDID','E01FESTYPO','REFTYP','E01FESREF')">
             <img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="middle" border="0" ></a>
          </div></td>
      </tr>      
    </table>
    <table width="100%" border="0" cellspacing="0" cellpadding="0" bgcolor="#FFFFFF" bordercolor="#FFFFFF">
      <tr bgcolor="#FFFFFF">
        <td colspan="2" width="33%">&nbsp;</td>
      </tr>
      <tr bgcolor="#FFFFFF"> 
        <td width="33%"> 
  			<div align="center"> 
	        	<input id="EIBSBTN" type=submit name="Submit" value="Enviar">
  			</div>        
  		</td>
        <td width="33%"> 
  			<div align="center"> 
	        	<input id="EIBSBTN" type=button name="Refresh" value="Refrescar" onClick="RefreshList()">
  			</div>        
  		</td>  		
      </tr>
      <tr bgcolor="#FFFFFF"> 
        <td> </td>
      </tr>
    </table>

  <%
	  String Type = (String) request.getAttribute("Type");
  %>
    <table class="tableinfo" width="28%" >
      <tr id="trintro"> 
        <td width="25%"> 
			<input type="radio" name="SOURCE" value="T" <%if (Type.equals("T")) out.print("checked");%>>Tesorería
        </td>
        <td width="25%"> 
			<input type="radio" name="SOURCE" value="F" <%if (Type.equals("F")) out.print("checked");%>>Fideicomiso
        </td>
        <td width="25%"> 
			<input type="radio" name="SOURCE" value="E" <%if (Type.equals("E")) out.print("checked");%>>FEM
        </td>
        <td width="25%"> 
			<input type="radio" name="SOURCE" value="R" <%if (Type.equals("R")) out.print("checked");%>>Terceros
        </td>
        
       </tr>      
  
  </table>
<br>
    <table  id="mainTable" class="tableinfo" height="30" width="14%">
      <tr> 
        <td nowrap valign="top" width="100%" height="60"> 
          <table id="headTable">
            <tbody> 
            <tr id="trintrot"> 
              <th align="CENTER" nowrap></th>
              <th align="CENTER" nowrap>Número</th>
              <th align="CENTER" nowrap>Nombre</th>
              <th align="CENTER" nowrap>Id</th>
            </tr>
            </tbody> 
          </table>
          <div id="dataDiv1" class="scbarcolor"  style="overflow-Y:scroll;height:100"> 
            <table id="dataTable"  style="font-size:7pt">
              <%
                custList.initRow();
                int k = 0;
                while (custList.getNextRow()) {
                    if (custList.getFlag().equals("")) {
                    		out.println(custList.getRecord());
                    k++;
                    }        
                }
            %>
            </table>
          </div>
        </td>
      </tr>
    </table>
    <p>&nbsp;</p>
    <p>&nbsp;</p>
      
  
<% 
 if ( !error.getERRNUM().equals("0")  ) {
      error.setERRNUM("0");
 %>
     <SCRIPT type="text/javascript">
            showErrors();
     </SCRIPT>
 <%
 }
%>
<input type=HIDDEN name="totalRow" value="<%= k %>">

<SCRIPT type="text/javascript">

     function resizeDoc() {
       adjustEquTables( getElement('headTable'), getElement('dataTable'), getElement('dataDiv1'), 1, false);
     }
     
     resizeDoc();
     window.onresize = resizeDoc;

</SCRIPT>
  

</form>
</body>
</html>
