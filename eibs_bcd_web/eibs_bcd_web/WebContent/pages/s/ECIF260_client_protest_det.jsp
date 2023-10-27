<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<title>Protestos</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<%@ page import = "datapro.eibs.master.Util,datapro.eibs.beans.*" %>

<jsp:useBean id="userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />
<jsp:useBean id="currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>


<SCRIPT type="text/javascript">

<%
	String typ1 = request.getParameter("TYP1");
	String typ2 = request.getParameter("TYP2");
	String title = "";
	JBObjList list = null;
	
	if (typ1.equals("S")) {
	    if(typ2.equals("A")) {
	       list = (JBObjList) session.getAttribute("listProtSisAcl");
	       title="Protestos Aclarados en Sistema";
	    } else {
	       list = (JBObjList) session.getAttribute("listProtSisVig");
	       title="Protestos Vigentes en Sistema";
	    }	    
	} else {
	    if(typ2.equals("A")) {
	       list = (JBObjList) session.getAttribute("listProtIntAcl");
	       title="Protestos Internos Aclarados";
	    } else {
	       list = (JBObjList) session.getAttribute("listProtIntVig");
	       title="Protestos Internos Vigentes";
	    }
	}
%>	


</SCRIPT>

</head>

<body>
<h3 align="center"><%=title%><img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="averages_rt.jsp,ECIF250"></h3>
<hr size="4">
<form method="post">
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="2">
  <INPUT TYPE=HIDDEN NAME="ACCIDX" VALUE="0">
  <table class="tableinfo">
    <tr > 
      <td nowrap > 
        <table cellspacing="0" cellpadding="2" width="100%" class="tbhead" align="center">
          <tr id=trdark> 
            <td nowrap width="9%" align="right"> Cliente : </td>
            <td nowrap width="15%" align="left"> <%= userPO.getCusNum()%> </td>
            <td nowrap width="11%" align="right"> 
              <div align="right">RUT : </div>
            </td>
            <td nowrap width="10%" align="left"> <%= userPO.getID()%> </td>
            <td nowrap width="14%" align="right"> 
              <div align="right">Nombre: </div>
            </td>
            <td nowrap width="41%"align="left"> <%= userPO.getCusName()%> </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <BR>
  <% if (list.getNoResult()) {%>
      <h3 align=center>No existen protestos para este cliente</h3>
  <% } else { %>
  
  <table class="tableinfo">
    <tr > 
      <td nowrap>
        <table id="headTable" style="width: 100%">
		    <TR id="trdark">  
		      <TH ALIGN=CENTER nowrap>Nro Boletin</TH>
		      <TH ALIGN=CENTER nowrap>Fec. Boletin</TH>
		      <TH ALIGN=CENTER nowrap>Fecha Vto.</TH>
		      <TH ALIGN=CENTER nowrap>Moneda</TH>
		      <TH ALIGN=CENTER nowrap>Mto. Protesto</TH>
		      <TH ALIGN=CENTER nowrap>Cod. Motivo</TH>
		    </TR>
		</TABLE>  
   		<div id="dataDiv1" class="scbarcolor" style="padding:0" >
    		<table id="dataTable"  >
               <%             
          		
          		list.initRow();
   		  		while (list.getNextRow()) {
          			ECIF26001Message protBean = (ECIF26001Message) list.getRecord();
          		%>    		
          			  <tr> 
				          <td nowrap><%= protBean.getE01BOLNUM()%></td>
				          <td nowrap><%= Util.formatCustomDate(currUser.getE01DTF(), protBean.getE01BOLDTM(),protBean.getE01BOLDTD(),protBean.getE01BOLDTY())%></td>
				          <td nowrap><%= Util.formatCustomDate(currUser.getE01DTF(), protBean.getE01PRODTD(),protBean.getE01PRODTM(),protBean.getE01PRODTY())%></td>
				          <td nowrap><%= protBean.getE01CURCCY()%></td>
				     	  <td nowrap><%= Util.formatCCY(protBean.getE01CHQAMT())%></td>
				     	  <td nowrap><%= protBean.getE01PROTSN()%></td>
				     </tr>
				 <%
          		   }         
                %>         
		     </table>   
  		</div>	
          		 
      </td>
    </tr>
  </table>
  <SCRIPT type="text/javascript">
    function resizeDoc() {
            	adjustEquTables(getElement('headTable'),getElement('dataTable'), getElement('dataDiv1'),1,false);
    }
  	resizeDoc();
  	window.onresize=resizeDoc;
  </SCRIPT>
  <% } %>
  </form>
</body>
</html>
