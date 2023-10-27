<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ page import = "datapro.eibs.master.Util" %>
<HTML><HEAD>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1"> 

<META name="GENERATOR" content="IBM WebSphere Studio">
<TITLE>Protección Sobregiros</TITLE>
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<SCRIPT type="text/javascript" SRC="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>

<jsp:useBean id= "heList" class= "datapro.eibs.beans.JBObjList"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>
<jsp:useBean id="currUser" class="datapro.eibs.beans.ESS0030DSMessage" scope="session" />

<SCRIPT type="text/javascript">

function enter(pos) {
	document.forms[0].PRODITEM.value = pos;
	document.forms[0].submit();
}
</SCRIPT>
</HEAD>
<body> 
<!--
<h3 align="center">Protección Sobregiros<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="tr_he_list.jsp,EDD0430"></h3>
<hr>
-->
 <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDD0430" target="_parent">
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="11">
  <INPUT TYPE=HIDDEN NAME="PRODCOD" VALUE="">
  <input TYPE=HIDDEN NAME="PRODITEM" value="">
  <% if (heList.getNoResult()) { %>
   <TABLE class="tbenter" height="60%">
   <TR>
      <TD ALIGN=CENTER VALIGN=MIDDLE>
  		 
        <H4 style="text-align: center">No hay resultados para la cuenta <%= userPO.getIdentifier()%>. 
          <br>
        </h4>
      </TD>
    </TR>
   </TABLE>
  <% } else {%>
  
 <H4 style="text-align: center">
 Seleccione un producto para asociarlo a la cuenta <%= userPO.getIdentifier()%>.
 </h4>
          
 <TABLE  id="mainTable" class="tableinfo">
 <TR > 
  <TD NOWRAP valign="top" width="100%" >
      
  <TABLE id="headTable1" >
  	<TR id="trdark"> 
      <TH ALIGN=CENTER NOWRAP>Cuenta</TH>
      <TH ALIGN=CENTER NOWRAP>Producto</TH>
	  <TH ALIGN=CENTER NOWRAP>Monto Original</TH>
	  <TH ALIGN=CENTER NOWRAP>Fecha Vencimiento</TH>
    </TR>
   </TABLE>
  
   <div id="dataDiv1" class="scbarcolor">                 
    <table id="dataTable1">
    <%
                int j=0;
                String itemChk="";
                boolean firstTime=true;
                heList.initRow();
                while (heList.getNextRow()) {
                    itemChk=(firstTime) ? "checked":"";
                    firstTime=false;
                    datapro.eibs.beans.EDD043011Message bean = (datapro.eibs.beans.EDD043011Message) heList.getRecord();
    %>
                <TR> 
      			    
			  	    <TD ALIGN=LEFT NOWRAP><div ><a href="javascript:enter(<%= j %>)"><%= bean.getE11INVRAC() %></a></DIV></TD>
      				<TD ALIGN=LEFT NOWRAP><div ><a href="javascript:enter(<%= j %>)"><%= bean.getE11INVPRD() + " " + bean.getE11PRDNME() %></a></DIV></TD>
      				<TD ALIGN=RIGHT NOWRAP><div ><a href="javascript:enter(<%= j %>)"><%= bean.getE11INVOAM() %></a></DIV></TD>      
      				<TD ALIGN=CENTER NOWRAP><div ><a href="javascript:enter(<%= j %>)"><%=Util.formatCustomDate(currUser.getE01DTF(),
      						bean.getBigDecimalE11INVMDM().intValue(),
      						bean.getBigDecimalE11INVMDD().intValue(),
      						bean.getBigDecimalE11INVMDY().intValue())%></a></DIV></TD>      
      			</TR>  
    <%                 
                     j++;       
                }
    %> 
   </table>
   </div>
   </TD>
   
  </TR>	
</TABLE>

<SCRIPT type="text/javascript">
     function resizeDoc() {
       adjustEquTables( getElement('headTable1'), getElement('dataTable1'), getElement('dataDiv1'),1,false);
      }
	 //showChecked("PRODITEM");
     resizeDoc();
     window.onresize=resizeDoc;
     
</SCRIPT> 
<% } %> 
 </FORM>
</BODY>
</HTML>
 