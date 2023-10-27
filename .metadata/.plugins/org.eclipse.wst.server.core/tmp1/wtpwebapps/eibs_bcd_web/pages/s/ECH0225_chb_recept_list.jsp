<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<%@ page import ="datapro.eibs.master.Util" %>
<HTML>
<HEAD>
<TITLE>
Lista de Cuentas
</TITLE>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "chkbList" class= "datapro.eibs.beans.JBObjList"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>
<link href="<%=request.getContextPath()%>/jquery/plugins/contextMenu/css/jquery.contextMenu.css" rel="stylesheet" type="text/css" />

<SCRIPT type="text/javascript">
  var reason = '';
  
  function goAction(op) {
     	
     document.forms[0].action.value = op;
     document.forms[0].reason.value = reason;
     
     var formLength= document.forms[0].elements.length;
     var ok = false;
     for(var n=0;n<formLength;n++)
      {
      	var elementName= document.forms[0].elements[n].name;
      	if(elementName == "ROW" && document.forms[0].elements[n].checked) 
      	{
        		ok = true;
        		//alert(document.getElementsByName("E01CHUDBR_"+document.forms[0].elements[n].value)[0].value);
        		if(document.forms[0].OPTION.value == "E"){
        			document.forms[0].E01CHUDBR.value = document.getElementsByName("E01CHUDBR_"+document.forms[0].elements[n].value)[0].value;
        		}
        		break;
      	}
      }
      if ( ok ) {          
       document.forms[0].submit();
      }
      else {
 		alert("Seleccione una cuenta antes de realizar esta operacion");	   
      }

 }
  
 function goExit(){
    window.location.href="<%=request.getContextPath()%>/pages/background.jsp";
 }
 
 function showAddInfo(idxRow){
   
   //for ( var i=1; i<dataTable.rows.length; i++ ) {
   //    dataTable.rows[i].className="trnormal";
   // }
   var i = parseInt(getElement("ACTROW").value);
   var j = idxRow + 1;
   dataTable.rows[i].className="trnormal";
   dataTable.rows[j].className="trhighlight";
   getElement("ACTROW").value = "" + j;
  }   

	
</SCRIPT>

</HEAD>

<BODY>

<% 
 boolean firstTime = true;
 String chk = "";
 int row;
 try {
	  	row = Integer.parseInt(request.getParameter("ROW"));
	  	firstTime = false;
	} 
 catch (Exception e) {
		row = 0;
		firstTime = true;		
	}
	
 if ( !error.getERRNUM().equals("0")  ) {
     error.setERRNUM("0");
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
     //firstTime = false;
 } 
%>

<FORM Method="post" Action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSECH0225" >
<INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="5">
<INPUT TYPE=HIDDEN NAME="action" VALUE="A">
<INPUT TYPE=HIDDEN NAME="reason" VALUE="">
<INPUT TYPE=HIDDEN NAME="totalRow" VALUE="0">
<INPUT TYPE=HIDDEN NAME="ACTROW" VALUE="1">
<input type="hidden" name="E01CHUDBR" value="01" >
<input type="hidden" name="CHUBNK" value="01" >
<input type="hidden" name="OPTION" value="<%= userPO.getOption().trim() %>" >
<h3 align="center"><% if (userPO.getOption().equals("E")) out.print("Envio de Chequeras a Sucursales"); else out.print("Chequeras Recibidas en Sucursales"); %>	
<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="chb_recept_list.jsp,ECH0225">
</h3>
<hr size="4">
  
<%
	if ( chkbList.getNoResult() ) {
%> 

  <TABLE class="tbenter" width=100% height=40%>
   	<TR>
      <TD> 
        <div align="center"> 
          <p>
            <b>No hay resultados que correspondan a su criterio de búsqueda</b>
          </p>          
        </div>
      </TD>
     </TR>
   </TABLE>
  <%   		
	}
	else { 
  %>   
  <TABLE class="tbenter" width=100%>
    <TR> 
      <TD class=TDBKG> <a href="javascript:goAction('A')" id="linkApproval">Aceptar</a> 
      </TD>
      <TD class=TDBKG> <a href="javascript:enterReason('R')" id="linkReject">Rechazar</a> 
      </TD>
      <TD class=TDBKG> <a href="javascript:goExit()">Salir</a> 
      </TD>
    </TR>
  </TABLE>
  
 <TABLE  id="mainTable" class="tableinfo" >
 <TR> 
    <TD NOWRAP >
  <TABLE id="dataTable" width="100%">
  <TR id="trdark"> 
     <TH ALIGN=CENTER ></TH>
    <TH ALIGN=CENTER >Fecha<br>Solicitud</TH>
    <TH ALIGN=CENTER >Sucursal<br>Solicitud</TH>
    <TH ALIGN=CENTER >Tipo<br>Chequera</TH>
    <TH ALIGN=CENTER >Cheques</TH>    
    <TH ALIGN=CENTER >Número<br>
                        de Chequera</TH>
    <TH ALIGN=CENTER >Cheque<br>Inicial</TH>
    <TH ALIGN=CENTER >Cheque<br>Final</TH>
    <TH ALIGN=CENTER >Sucursal<br>Entrega</TH>
  </TR>
     <%
                chkbList.initRow();
                
                while (chkbList.getNextRow()) {
                  if (firstTime) {
						firstTime = false;
						chk = "checked";
				  }
				  else {
						if (chkbList.getCurrentRow() == row )
							chk = "checked";
						else 
							chk = "";
				  }
                  datapro.eibs.beans.ECH022501Message msgChkB = (datapro.eibs.beans.ECH022501Message) chkbList.getRecord();
     %>               
        <TR>
			<TD NOWRAP width="2%"><input type="radio" name="ROW" value="<%= chkbList.getCurrentRow()%>" <%=chk%>  onclick="showAddInfo(<%= chkbList.getCurrentRow()%>)"></TD>
			<TD NOWRAP ALIGN="CENTER"><%= Util.formatCustomDate(currUser.getE01DTF(), msgChkB.getE01CHURQM(), msgChkB.getE01CHURQD(), msgChkB.getE01CHURQY()) %></TD>
			<TD NOWRAP ALIGN="CENTER"><%= Util.formatCell(msgChkB.getE01CHUBRN())%></TD>
			<TD NOWRAP ALIGN="CENTER"><%= Util.formatCell(msgChkB.getE01CHUTCB())%></TD>
			<TD NOWRAP ALIGN="CENTER"><%= Util.formatCell(msgChkB.getE01CHUNTC()) %></TD>
			<TD NOWRAP ALIGN="CENTER"><%= Util.formatCell(msgChkB.getE01CHUNCB())%></TD>
			<TD NOWRAP ALIGN="CENTER"><%=Util.formatCell(msgChkB.getE01CHUICK())%></TD>
			<TD NOWRAP ALIGN="CENTER"><%=Util.formatCell(msgChkB.getE01CHUFCK())%></TD>
			<% if (userPO.getOption().equals("E")) {%>
			<TD NOWRAP ALIGN="CENTER"><input type="text" size="5" maxlength="4" name="E01CHUDBR_<%= chkbList.getCurrentRow()%>" value="<%=msgChkB.getE01CHUDBR()%>"
			  onKeypress="enterInteger(event)" 
			  class="context-menu-help" onmousedown="init(branchHelp,this.name,document.forms[0].CHUBNK.value,'','','','')"></TD>
			  <%}else{ %>
			<TD NOWRAP ALIGN="CENTER"><%= Util.formatCell(msgChkB.getE01CHUDBR()) %></TD>
			<%} %>
		</TR>    		
    <%                  
                }
    %> 
   
     </Table>
  </TD>
  </TR>	
</TABLE>

<SCRIPT type="text/javascript">
  showChecked("ROW");       
</SCRIPT>

<%   		
	} 
 %>
</FORM>

</BODY>
</HTML>
