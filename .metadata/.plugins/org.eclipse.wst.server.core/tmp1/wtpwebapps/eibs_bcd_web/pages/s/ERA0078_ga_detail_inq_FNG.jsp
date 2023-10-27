<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>

<%@ page import = "datapro.eibs.master.Util" %>
<%@page import="com.datapro.constants.EibsFields"%>

<html>
<head>
<title>Información Detalle de Garantias Fondo Agropecuario de Garantías </title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/jquery/plugins/contextMenu/css/jquery.contextMenu.css" rel="stylesheet" type="text/css" />

<jsp:useBean id="gaDetail" class= "datapro.eibs.beans.ERA007801Message"  scope="session"/>
<jsp:useBean id= "listRec" class= "datapro.eibs.beans.JBListRec"  scope="session" /> 
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session"/>
<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session"/>
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>


<%
	boolean b_read_only1 = true;
	boolean b_warning = true;
	boolean b_read_onlyAlw = true;
%>
<%
	String read_only1 = "readonly";
%>
<%
	String disabled1 = "disabled";
%>
<%
	String read_only_mnt = "readonly style='background-color:#F2F1F1'";
%>

<SCRIPT type="text/javascript">

function initPage(){
}

</script>

<SCRIPT type="text/javascript">
//MENU AQUI   

    
</SCRIPT>

</head>

<body onload=javascript:initPage()>
<%
	if (!error.getERRNUM().equals("0")) {
		error.setERRNUM("0");
		out.println("<SCRIPT Language=\"Javascript\">");
		out.println("       showErrors()");
		out.println("</SCRIPT>");
	}
%> 
<%
 	int row = 0;
 %>
 <h3 align="center"> Consulta Información para Confecamaras<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="ERA0061_ga_detail_inq_FNG.jsp,ERA0078"> 
</h3>

<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSERA0050" >
<input type=HIDDEN name="PURPOSE" value="<%= userPO.getPurpose()%>">
                                        
  <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
          <tr id="trdark">
            <td nowrap> 
              <div align="right"><b>Cliente : </b></div>
            </td>
            <td nowrap > 
              <div align="left"> 
                <input type="text" name="E01ROCCUN" readonly size="11" maxlength="9" value="<%=gaDetail.getE01ROCCUN().trim()%>">
              </div>
            </td>
            <td nowrap> 
              <div align="right"><b>Nombre :</b> </div>
            </td>
            <td nowrap> 
              <div align="left">
                <input type="text" name="E01CUSNA1" id="E01CUSNA1" readonly size="60" maxlength="45" value="<%=gaDetail.getE01CUSNA1().trim()%>" >
              </div>
            </td>
          </tr>
          <tr id="trdark">
            <td nowrap > 
              <div align="right"><b>No. Referencia : </b></div>
            </td>
            <td nowrap>
              <input type="text" name="E01ROCREF" id="E01ROCREF" size="14" maxlength="12" value="<%=gaDetail.getE01ROCREF().trim()%>" readonly>
            </td> 
            <td nowrap> 
              <div align="right"><b>Moneda : </b></div>
            </td>
            <td nowrap> 
              <div align="left">
               <input type="text" name="E01ROCCCY" id="E01ROCCCY" size="4" maxlength="3" value="<%=gaDetail.getE01ROCCCY().trim()%>" readonly> 
              </div>
            </td>
           </tr>
          <tr id="trdark">             
            <td nowrap> 
              <div align="right"><b>Producto :</b> </div>
            </td>
            <td nowrap> 
              <div align="left">
                <input type="text" name="PRODUCT" size="38" value="<%=gaDetail.getE01ROCPRD().trim()%> - <%=gaDetail.getD01ROCPRD().trim()%>" readonly>                 
              </div>
            </td>
            <td nowrap> 
              <div align="right"><b>Tipo de Garantía :</b> </div>
            </td>
            <td nowrap> 
              <div align="left">
                <input type="text" name="TYPE" size="38" value="<%=gaDetail.getE01ROCTYP().trim()%> - <%=gaDetail.getD01ROCTYP().trim()%>" readonly>                 
              </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>

  <h4>Informaci&oacute;n Confecamaras</h4>
      
  <table class="tableinfo" width="100%">
    <tr > 
      <td nowrap> 
		<TABLE id="mainTable2" class="tableinfo" ALIGN=CENTER NOWRAP>

			<TD NOWRAP width="100%" style="vertical-align: top;">

			<div id="dataDiv2" >
    	<%
    		int i = 0;
    		int iw = 5;
    	%> 

	    <table id="dataTable2" NOWRAP> 

    		<%
     			listRec.initRow();
     			boolean firstTime = true;
     			while (listRec.getNextRow()) {
     				if (firstTime) {
     					firstTime = false;
     					iw = iw - 5;
     				}
     		%> 
			<%
				if (listRec.getRecord(4).equals("G")){ 
			%>
   		<tr id="trdark"> 
      		<th align=CENTER width="100%"> <div align="left"><%=Util.formatCell(listRec.getRecord(5))%></div> </th>
    	</tr>
   	 	<%
   	 		}
				if (listRec.getRecord(4).equals("H")){ 
			%>
   		<tr id="trdark"> 
			<td align="left" nowrap  width="100%"><pre><font face="Courier New"><%=Util.formatCell(listRec.getRecord(5))%></font></pre></td>   	 	
    	</tr>
   	 	<%
   	 		}
			if (listRec.getRecord(4).equals("D")){ 
   	 	%> 
   		<tr id="trclear"> 
			<td align="left" nowrap  width="100%"><pre><font face="Courier New"><%=Util.formatCell(listRec.getRecord(5))%></font></pre></td>   	 	
    	</tr>
		<%
   	 		}
   	 	%> 
   	 	<%
   	 		}
   	 	%> 

	  </table>
	  	<input type="HIDDEN" name="RECNUMDB" value="<%=i%>">
	 </div>
	 </TD>

   </table>
      </td>
    </tr>
  </table>

  <table width="100%">		
	<tr>
		<td width="100%" align="center" colspan="3">
		<INPUT id="EIBSBTN" type="button" name="Cancel" value="Cerrar" onclick="top.close()">
	</td>
	</tr>
  </table>	
  <SCRIPT type="text/javascript">
	
//     initPage();
</SCRIPT>



  </FORM>
 </BODY>
<SCRIPT type="text/javascript">
</SCRIPT>

 </html>