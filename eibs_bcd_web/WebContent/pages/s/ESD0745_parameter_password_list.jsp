<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<%@ page import = "datapro.eibs.master.*,datapro.eibs.beans.*" %>
<title>Control Parámetros de Subsistema eIBS</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "ppList" class= "datapro.eibs.beans.JBObjList"  scope="session" />
<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<SCRIPT Language="javascript">


function goAction(op) {
    getElement("opt").value = op;
    document.forms[0].submit();
}

function setInfo(dsc, bnk, exp, psl, rpc, let, etm, dpi, chg, sk1, sk2, sk3, tou, trc, fg1, fg2, fg3) {
    getElement("DSC").value = dsc;
    getElement("BNK").value = bnk;
    getElement("EXP").value = exp;
    getElement("PSL").value = psl;
    getElement("RPC").value = rpc;
	getElement("LET").value = let;
	getElement("ETM").value = etm;
	getElement("DPI").value = dpi;
	getElement("CHG").value = chg;
	getElement("SK1").value = sk1;
	getElement("SK2").value = sk2;
	getElement("SK3").value = sk3;
	getElement("TOU").value = tou;
	getElement("TRC").value = trc;
	getElement("FG1").value = fg1;
	getElement("FG2").value = fg2;
	getElement("FG3").value = fg3;
}


</SCRIPT>
</head>

<body>

<% 
 if ( !error.getERRNUM().equals("0")  ) {
     out.println("<SCRIPT Language=\"Javascript\">");
	 error.setERRNUM("0");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
 }

%>

<h3 align="center">
<% 
if (userPO.getType().equals("PWD")) out.print("Control Parámetros Clave de Acceso"); else out.print("Control Parámetros de Subsistema eIBS");
%>
<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="parameter_password_list.jsp, ESD0745"></h3>
<hr size="4">

<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.security.JSESD0745">

  <INPUT TYPE=HIDDEN NAME="SCREEN" id="SCREEN" VALUE="2">
  <INPUT TYPE=HIDDEN NAME="opt" id="opt" VALUE="">
  <INPUT TYPE=HIDDEN NAME="BNK" id="BNK" VALUE="">
  <INPUT TYPE=HIDDEN NAME="DSC" id="DSC" VALUE="">
  <INPUT TYPE=HIDDEN NAME="EXP" id="EXP" VALUE="">
  <INPUT TYPE=HIDDEN NAME="PSL" id="PSL" VALUE="">
  <INPUT TYPE=HIDDEN NAME="RPC" id="RPC" VALUE="">
  <INPUT TYPE=HIDDEN NAME="LET" id="LET" VALUE="">
  <INPUT TYPE=HIDDEN NAME="ETM" id="ETM" VALUE="">
  <INPUT TYPE=HIDDEN NAME="DPI" id="DPI" VALUE="">
  <INPUT TYPE=HIDDEN NAME="CHG" id="CHG" VALUE="">
  <INPUT TYPE=HIDDEN NAME="SK1" id="SK1" VALUE="">
  <INPUT TYPE=HIDDEN NAME="SK2" id="SK2" VALUE="">
  <INPUT TYPE=HIDDEN NAME="SK3" id="SK3" VALUE="">
  <INPUT TYPE=HIDDEN NAME="TOU" id="TOU" VALUE="">
  <INPUT TYPE=HIDDEN NAME="TRC" id="TRC" VALUE="">
  <INPUT TYPE=HIDDEN NAME="FG1" id="FG1" VALUE="">
  <INPUT TYPE=HIDDEN NAME="FG2" id="FG2" VALUE="">
  <INPUT TYPE=HIDDEN NAME="FG3" id="FG3" VALUE="">
  <INPUT TYPE=HIDDEN NAME="actRow" id="actRow" VALUE="0">
  <INPUT TYPE=HIDDEN NAME="totalRow" id="totalRow" VALUE="0">
         
<%
	if ( ppList.getNoResult() ) {
%>
 	<TABLE class="tbenter" width=100% height=30%">
 		<TR>
      <TD>         
      <div align="center"> <h4 style="text-align:center"> No hay Resultados para su criterio de Búsqueda. <br>Click Nuevo para Añadir uno</h4> 
      </div>
      </TD></TR>
   	</TABLE>
   	<TABLE class="tbenter">
    <TR>
      <TD ALIGN=CENTER class="TDBKG" width="50%">
   		<a href="javascript:goAction('N')">Nuevo</a>
      </TD>      
      <TD ALIGN=CENTER class="TDBKG" width="50%">
  		<a href="<%=request.getContextPath()%>/pages/background.jsp">Salir</a>
      </TD>
    </TR>
  </TABLE>
<%
	}
	else {
%>
  
  <TABLE class="tbenter">
    <TR>
      <TD ALIGN=CENTER class="TDBKG" width="33%">
  		<a href="javascript:goAction('N')">Nuevo</a>
      </TD>
      <TD ALIGN=CENTER class="TDBKG" width="33%">
  		<a href="javascript:goAction('M')">Mantenimiento</a>
      </TD>      
      <TD ALIGN=CENTER class="TDBKG" width="34%">
  		<a href="<%=request.getContextPath()%>/pages/background.jsp">Salir</a>
      </TD>
    </TR>
  </TABLE>
  
   <TABLE  id="mainTable" class="tableinfo" style="height:400px; width:1040px;">
   <tr  height="5%"> 
      <td NOWRAP valign="top" width="100%"> 
		<table id="headTable" width="98%">
			<tr id="trdark">
		      <TH ALIGN="center"  nowrap width="5%"></TH> 
		      <TH ALIGN="center"  nowrap width="10%">Banco</TH>
		      <TH ALIGN="center"  nowrap width="40%">Descripcion</TH>
		      <TH ALIGN="center"  nowrap width="15%">Puerto<br>Inicial eIBS</TH>
		      <TH ALIGN="center"  nowrap width="15%">Puerto<br>Monitor para dIBS</TH>
		      <TH ALIGN="center"  nowrap width="15%">Puerto<br>Inicial dIBS</TH>      
			</tr>
        </table>
      </td>
    </tr>    
		  <tr  height="95%">    
		    <td nowrap="nowrap">      
		       <div id="dataDiv1" style="height:400px; overflow:auto;"> 
		       <table id="dataTable" cellspacing="0" cellpadding="1" border="0" width="100%">         
    <%
          boolean firstTime = true;  
          String chk = "";  
          ppList.initRow(); 
          int k=1;              
          while (ppList.getNextRow()) {
               ESD074501Message msgList = (ESD074501Message) ppList.getRecord();		
               if (firstTime) {
	               	chk = "checked";
	               	firstTime = false;
               } else {
               		chk = "";
                }	 
       %>             
          <tr id="dataTable<%= ppList.getCurrentRow() %>"> 
            <td NOWRAP  align="center" width="5%"><input type="radio" name="ROW1" id="ROW1" value="<%= ppList.getCurrentRow() %>" <%=chk%> class="highlight" onClick="highlightRow('dataTable', <%= ppList.getCurrentRow() %>); setInfo('<%= msgList.getE01EPRDSC()%>', '<%= msgList.getE01EPRBNK()%>', '<%= msgList.getE01EPREXP()%>', 
        						 '<%= msgList.getE01EPRPSL()%>', '<%= msgList.getE01EPRRPC()%>', '<%= msgList.getE01EPRLET()%>',
        						 '<%= msgList.getE01EPRETM()%>', '<%= msgList.getE01EPRDPI()%>', '<%= msgList.getE01EPRCHG()%>',
        						 '<%= msgList.getE01EPRSK1()%>', '<%= msgList.getE01EPRSK2()%>', '<%= msgList.getE01EPRSK3()%>',
        						 '<%= msgList.getE01EPRTOU()%>', '<%= msgList.getE01EPRTRC()%>', '<%= msgList.getE01EPRFG1()%>',
        						 '<%= msgList.getE01EPRFG2()%>', '<%= msgList.getE01EPRFG3()%>' )" ></td>
          <td NOWRAP align="center" width="10%">
          	<%=Util.formatCell(msgList.getE01EPRBNK())%>
		  </td>		  
		  <td NOWRAP align="left" width="40%">
			<%=Util.formatCell(msgList.getE01EPRDSC())%>
		  </td>		  
		  <td NOWRAP align="center" width="15%">
          	<%=Util.formatCell(msgList.getE01EPRSK1())%>
		  </td>
		  <td NOWRAP align="center" width="15%">
          	<%=Util.formatCell(msgList.getE01EPRSK2())%>          	
		  </td>
		  <td NOWRAP align="center" width="15%">
          	<%=Util.formatCell(msgList.getE01EPRSK3())%>          	
		  </td>
		  
		</TR>
		
        <% 
        	k++;
         }
         %> 
             </table>
             </div>
             </td>
             </tr>
</table>

  <SCRIPT language="JavaScript">     
  	getElement("totalRow").value="<%= k %>";
	 showChecked("ROW1");          
  </SCRIPT> 
<%      
  }
%> 
</form>
</body>
</html>
