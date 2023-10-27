<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<%@ page import = "datapro.eibs.master.*,datapro.eibs.beans.*" %>
<title>Cargos Periodicos</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "chgList" class= "datapro.eibs.beans.JBObjList"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
 
<SCRIPT type="text/javascript"><!--

  function goAction(op) {
    var page = "";
    var params ="";
    getElement("opt").value=op;
    if (op == "D") {
    	ok = confirm("El Cargo seleccionado sera borrado");
    	if (ok) document.forms[0].submit();
    } else if (op == "N") {
        if (trim(document.forms[0].E01CFMTTP.value)=="") {
           alert("Teclee un Codigo de Cargo valido");
           document.forms[0].E01CFMTTP.focus();
           return;
        }
        CenterNamedWindow("","newwin",600,520,2);
        document.forms[0].target="newwin";
        document.forms[0].submit();
        closeEnterCharge();
        
    } else { 
    	
        var row = parseInt(getElement("actRow").value) - 1;   
	 	params = "&ROW=" + row; 	
		
		page = "<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDD5220?SCREEN=400&opt=" + op + params;	
		CenterWindow(page,600,520,2);
	}		 
  }

  function closeEnterCharge(){
      enterCHG.style.visibility="hidden";
  }


  function cancelBub(){
    event.cancelBubble = true;
  }

  function ShowEnterCharge() {	 
	 var y= event.clientY + document.body.scrollTop;
     var x= event.clientX + document.body.scrollLeft;
     cancelBub();
	 eval('enterCHG.style.pixelTop=' + y);
     eval('enterCHG.style.pixelLeft=' + x);
     enterCHG.style.visibility="visible";
	 document.forms[0].E01CFMTTP.focus();
  }
  
  addEventHandler(document, 'click', closeEnterCharge);
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

<h3 align="center">Cargos a la Cuenta<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="chg_list.jsp,EDD5220"></h3>
<hr size="4">

<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDD5220">

  <INPUT TYPE=HIDDEN NAME="SCREEN" id="SCREEN" VALUE="300">
  <INPUT TYPE=HIDDEN NAME="actRow" id="actRow" VALUE="0">
  <INPUT TYPE=HIDDEN NAME="opt" id="opt" VALUE="N">
  
  <div id="enterCHG" style="position:absolute; visibility:hidden; left:25px; top:-50px; z-index:3; filter:BlendTrans(duration=1)" onclick="cancelBub()">
  <TABLE class="tableinfo" style="width:0">
	<TR>
	  <TD ALIGN=right nowrap>
          Codigo de Cargo : 
          <input type="text" name="E01CFMTTP" size="4" maxlength="4" value="">                     
                        <a href="javascript:GetCodeCNOFC('E01CFMTTP','39')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="bottom" border="0"  ></a>	
      </TD>
      <TD ALIGN=Left nowrap>
	     <input type=button onclick="goAction('N')" value="Enviar"> 
	  </TD>
   </TR>
  </TABLE>
 </div>
 
  <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
          <tr id="trdark"> 
            <td nowrap> 
              <div align="right"><b>Cuenta : </b></div>
            </td>
            <td nowrap> 
              <div align="left"> 
                <input type="text" name="E01CFMACC" size="13" maxlength="12" value="<%= userPO.getAccNum()%>" readonly>
              </div>
            </td>
            
          </tr>
        </table>
      </td>
    </tr>
  </table>
      
<%
	if ( chgList.getNoResult() ) {
%>
 	<TABLE class="tbenter" width=100% height=30%">
 		<TR>
      <TD>         
      <div align="center"> <h4 style="text-align:center"> La cuenta seleccionada no posee cargos periodicos. <br>Seleccione la opci&oacute;n Nuevo para adicionar Cargos</h4> 
      </div>
      </TD></TR>
   	</TABLE>
   	<TABLE class="tbenter">
    <TR>
      <TD class="TDBKG" width="50%">
  		<a href="javascript:" onclick="ShowEnterCharge()">Crear</a>
      </TD>      
      <TD class="TDBKG" width="50%">
  		<a href="javascript:checkClose()">Salir</a>
      </TD>
    </TR>
  </TABLE>
<%
	}
	else {
%>
  
  <TABLE class="tbenter">
    <TR>
      <TD class="TDBKG" width="25%">
  		<a href="javascript:" onclick="ShowEnterCharge()">Crear</a>
      </TD>
      <TD class="TDBKG" width="25%">
  		<a href="javascript:goAction('M')">Modificar</a>
      </TD>
      <TD class="TDBKG" width="25%">
  		<a href="javascript:goAction('D')">Eliminar</a>
      </TD>      
      <TD class="TDBKG" width="25%">
  		<a href="javascript:checkClose()">Salir</a>
      </TD>
    </TR>
  </TABLE>
  
  <TABLE  id="mainTable" class="tableinfo">
    <tr  height="5%"> 
      <td NOWRAP valign="top" width="100%"> 
		<table id="headTable" width="98%">
			<tr id="trdark">
		      <TH ALIGN=CENTER width="5%" nowrap ></TH> 
		      <TH ALIGN=CENTER width="25%" nowrap >No. Ref</TH>
		      <TH ALIGN=CENTER width="10%" nowrap >Cargo</TH>
		      <TH ALIGN=CENTER width="10%" nowrap >Moneda</TH>
		      <TH ALIGN=CENTER width="25%" nowrap >Monto</TH>
		      <TH ALIGN=CENTER width="25%" nowrap >Frecuencia</TH>
			</tr>
        </table>
      </td>
    </tr>    
		  <tr  height="95%">    
		    <td nowrap="nowrap">      
		       <div id="dataDiv1" style="height:400px; overflow:auto;"> 
		       <table id="dataTable" cellspacing="0" cellpadding="1" border="0" width="100%">         
    <%
                
          chgList.initRow();               
		  boolean firstTime = true;
		  String chk = "";
          while (chgList.getNextRow()) {
				if (firstTime) {
					firstTime = false;
					chk = "checked";
				} else {
					chk = "";
				}          
          EDD522001Message msgList = (EDD522001Message) chgList.getRecord();			 
                    
       %>             
                    
		<tr id="dataTable<%= chgList.getCurrentRow() %>">
			<td nowrap align="center" width="5%"><input type="radio" id="ROW" name="ROW" value="<%=chgList.getCurrentRow()%>" <%=chk%> class="highlight" onClick="highlightRow('dataTable', <%= chgList.getCurrentRow() %>)" <% if (chgList.getCurrentRow() == 0) out.print("checked");%>/></td>
	          <td NOWRAP align="center" width="25%">
	          	<%=Util.formatCell(msgList.getE01CFMNUM())%>
			  </td>
			  <td NOWRAP align="center" width="10%">
	          	<%=Util.formatCell(msgList.getE01CFMTTP())%>
			  </td>
			  <td NOWRAP align="center" width="10%">
				<%=Util.formatCell(msgList.getE01CFMCCY())%>
			  </td>		  
			  <td NOWRAP align="center"  width="25%">
	          	<%=Util.fcolorCCY(msgList.getE01CFMVAL())%>
			  </td>
			  <td NOWRAP align="center"  width="25%">
				<% if(msgList.getE01CFMFRE().equals("E")) out.print("Eventual");
	                else if(msgList.getE01CFMFRE().equals("S")) out.print("Semianual");
	                else if(msgList.getE01CFMFRE().equals("M")) out.print("Mensual");
	                else if(msgList.getE01CFMFRE().equals("Q")) out.print("Trimestral");
	                else if(msgList.getE01CFMFRE().equals("Y")) out.print("Anual");%>
			  </td>	
		  
		</TR>
        <% } %> 
             </table>
             </div>
             </td>
             </tr>
</table>

  <SCRIPT type="text/javascript">     
	 showChecked("ROW");          
  </SCRIPT> 
<%      
  }
%> 
</form>
</body>
</html>
