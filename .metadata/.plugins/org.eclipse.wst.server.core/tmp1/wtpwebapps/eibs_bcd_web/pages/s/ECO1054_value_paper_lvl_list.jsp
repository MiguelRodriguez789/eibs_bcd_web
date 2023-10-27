<%@ page import="datapro.eibs.master.Util,datapro.eibs.beans.ECO105401Message"%>

<HTML>
<HEAD>
<TITLE>Lista de Niveles Adhesivos</TITLE>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "mtList" class= "datapro.eibs.beans.JBObjList"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "userPO" 	class= "datapro.eibs.beans.UserPos"  		scope="session"/>
<jsp:useBean id="currUser" class="datapro.eibs.beans.ESS0030DSMessage" scope="session" />

<SCRIPT type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>

<SCRIPT type="text/javascript">

function goAction(opt) {
    if (opt == "D") {
      ok = confirm("Esta seguro que desea eliminar el registro seleccionado?");
	  if (ok) document.forms[0].submit();
	} else if (opt == "M") { 
		var row = getElement("CURRENTROW").value;   
    	page = "<%=request.getContextPath()%>/pages/s/ECO1054_value_paper_lvl_maint.jsp?ROW=" + row;
  		CenterNamedWindow(page,'Information',550,300,2);
  	} else {
  	    page = "<%=request.getContextPath()%>/pages/s/ECO1054_value_paper_lvl_new.jsp?NEW=1";
  		CenterNamedWindow(page,'Information',550,300,2);
  	}
  }
  
</SCRIPT>

</HEAD>

<BODY>

<% 
 if ( !error.getERRNUM().equals("0")  ) {
     error.setERRNUM("0");
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors();");
     out.println("</SCRIPT>");
 } 
%>


<h3 align="center">Lista de Niveles de Adhesivos
	<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="value_paper_lvl_list.jsp,ECO1054">
</h3>
<hr size="4">
<FORM Method="post" Action="<%=request.getContextPath()%>/servlet/datapro.eibs.adhesives.JSECO1054" >
 <INPUT TYPE=HIDDEN NAME="CURRENTROW" id="CURRENTROW" VALUE="0"> 
 <INPUT TYPE=HIDDEN NAME="SCREEN" id="SCREEN" VALUE="200">

<% if ( mtList.getNoResult() ) { %> 

  <TABLE class="tbenter" width="60%" style="width: 1040px">
    <TR> 
      <TD class=TDBKG width="50%"> 
        <div align="center"><a href="javascript:goAction('N')">Crear</a> 
        </div>
      </TD>
      <TD class=TDBKG width="50%"> 
        <div align="center"><a href="javascript:checkClose()">Salir</a> </div>
      </TD>
    </TR>
  </TABLE>
  <TABLE class="tbenter" width=100% height=40%>
   	<TR>
      <TD> 
        <div align="center"> 
          <p>
            <b>No existen registros de niveles. Haga click en la opcion "Nuevo" para crear un nivel </b>
          </p>          
        </div>
      </TD>
     </TR>
   </TABLE>
<% } else { %>
         
 <TABLE class="tbenter" width="100%" style="width: 1040px">
    <TR> 
      <TD class=TDBKG width="25%"> 
        <div align="center"><a href="javascript:goAction('N')">Crear</a> 
        </div>
      </TD>
      <TD class=TDBKG width="25%"> 
        <div align="center"><a href="javascript:goAction('M')">Modificar</a> 
        </div>
      </TD>
      <TD class=TDBKG width="25%"> 
        <div align="center"><a href="javascript:goAction('D')">Borrar</a> 
        </div>
      </TD>
      <TD class=TDBKG width="25%"> 
        <div align="center"><a href="javascript:checkClose()">Salir</a> </div>
      </TD>
    </TR>
 </TABLE>
  
  <TABLE  id="mainTable" class="tableinfo" style="height:400px;">
    <tr  height="5%"> 
      <td NOWRAP valign="top" width="100%"> 
		<table id="headTable" width="100%">
			<tr id="trdark">
	  			<TH ALIGN=CENTER width="3%">&nbsp;</TH>
	    		<TH ALIGN=CENTER width="5%">Banco</TH>
	    		<TH ALIGN=CENTER width="5%">Oficina</TH>
	    		<TH ALIGN=CENTER width="5%">Cajero<BR>Solic.</TH>
	    		<TH ALIGN=CENTER width="5%">Tipo<BR>Adhesivos</TH>
	    		<TH ALIGN=CENTER width="26%">Descripcion Tipo</TH>
	    		<TH ALIGN=CENTER width="5%">Subtipo<BR>Adhesivos</TH>
	    		<TH ALIGN=CENTER width="21%">Descripcion Subtipo</TH>
	    		<TH ALIGN=CENTER width="25%">Usuario<BR>Fecha/Hora<BR>Actualizacion</TH> 
			</tr>
        </table>
      </td>
    </tr>    
		  <tr  height="95%">    
		    <td nowrap="nowrap">      
		       <div id="dataDiv1" style="height:400px; overflow:auto;"> 
		       <table id="dataTable" cellspacing="0" cellpadding="1" border="0" width="100%">         

     <%
                mtList.initRow(); 
				boolean firstTime = true;
				String chk = "";
                while (mtList.getNextRow()) {
					if (firstTime) {
						firstTime = false;
						chk = "checked";
					} else {
						chk = "";
					}
                   ECO105401Message msgMT = (ECO105401Message) mtList.getRecord();
     %>               
          <tr id="dataTable<%= mtList.getCurrentRow() %>"> 
            <td NOWRAP  align=CENTER width="3%"><input type="radio" name="ROW" value="<%= mtList.getCurrentRow() %>" <%=chk%> class="highlight" onClick="highlightRow('dataTable', <%= mtList.getCurrentRow() %>)" ></td>
			<TD NOWRAP ALIGN="CENTER" width="5%"><%=Util.formatCell(msgMT.getE01LVLBNK())%></TD>
			<TD NOWRAP ALIGN="CENTER" width="5%"><%=Util.formatCell(msgMT.getE01LVLBRN())%></TD>
			<TD NOWRAP ALIGN="CENTER" width="5%"><%=Util.formatCell(msgMT.getE01LVLCSN())%></TD>
			<TD NOWRAP ALIGN="CENTER" width="5%"><%=Util.formatCell(msgMT.getE01LVLTIP())%></TD>
			<TD NOWRAP ALIGN="LEFT" width="26%"><%=Util.formatCell(msgMT.getE01LVLTIN())%></TD>
			<TD NOWRAP ALIGN="CENTER" width="5%"><%=Util.formatCell(msgMT.getE01LVLSUB())%></TD>
			<TD NOWRAP ALIGN="LEFT" width="21%"><%=Util.formatCell(msgMT.getE01LVLSUN())%></TD>
			<TD NOWRAP ALIGN="left" width="25%"><%=Util.formatCell(msgMT.getE01LVLACU()) + "<br>" + 
														Util.formatCustomDate(currUser.getE01DTF(),
						            						msgMT.getBigDecimalE01LVLADM().intValue(),
						            						msgMT.getBigDecimalE01LVLADD().intValue(),
						            						msgMT.getBigDecimalE01LVLADY().intValue()) + "<br>" + 
						            										Util.formatCell(msgMT.getE01LVLACT()) %></TD>
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

<% } %>
</FORM>

</BODY>
</HTML>
