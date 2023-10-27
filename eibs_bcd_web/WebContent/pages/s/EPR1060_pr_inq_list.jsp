<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
<HEAD>
<TITLE>Lista de Transferencias</TITLE>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "appList" class= "datapro.eibs.beans.JBList"   scope="session"/>
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"   scope="session"/>
<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session"/>

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>

<script type="text/javascript">
	function goAction(refnum) {
		if (refnum.length == 0) refnum = document.forms[0].REFNUM.value;
     	var page = "${pageContext.request.contextPath}/servlet/datapro.eibs.products.JSEPR1060?SCREEN=3&REFNUM=" + refnum;
	 	CenterWindow(page, 800, 500, 2);
  	}

 	function showAddInfo(refernum, idxRow){
		document.getElementById("tbAddInfo").rows[0].cells[1].style.color = "#d0122c";
		document.getElementById("tbAddInfo").rows[0].cells[1].innerHTML = getElement("TXTDATA"+idxRow).value;
   
		for(var i=0; i<document.getElementById("dataTable").rows.length; i++){
			document.getElementById("dataTable").rows[i].className="trnormal";
		}
		document.getElementById("dataTable").rows[idxRow].className="trhighlight";
		document.forms[0].REFNUM.value = refernum;
  }
  
 	function enter(recpos){ 	
 		document.forms[0].Pos.value = "" + recpos;
 		document.forms[0].submit();
 	}
   
</script>
</HEAD>
<BODY>
<% 
 if ( !error.getERRNUM().equals("0")  ) {
     error.setERRNUM("0");
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
 }
%>
<h3 align="center"> Consulta de Transferencias
	<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="pr_inq_list.jsp,EPR1060"> 
</h3>
<hr size="4">
<FORM Method="post" Action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEPR1060">
<INPUT TYPE=HIDDEN NAME="SCREEN" ID="SCREEN" VALUE="2">
<INPUT TYPE=HIDDEN NAME="REFNUM" ID="REFNUM" VALUE="">
<INPUT TYPE=HIDDEN NAME="totalRow" ID="totalRow" VALUE="0">
<INPUT TYPE=HIDDEN NAME="Pos" ID="Pos" VALUE="0">
  <TABLE class="tbenter">
    <TR>
      <TD class=TDBKG width="50%"> 
        <div align="center" style="cursor:hand" onClick="goAction('')"><a><b>Consulta</b></a></div>
      </TD>      
      <TD class=TDBKG width="50%"> 
        <div align="center" style="cursor:hand" onClick="checkClose()"><a><b>Salir</b></a></div>
      </TD>       
    </TR>
  </TABLE>
  
  <TABLE  id="mainTable" class="tableinfo" width="100%">
    <TR > 
    <TD NOWRAP valign="top" width="80%" >
        <TABLE id="headTable" width="100%" >
          <TR id="trdark"> 
            <TH ALIGN=CENTER NOWRAP width="5%">&nbsp;</TH>
            <TH ALIGN=CENTER NOWRAP width="10%">Referencia<br>N&uacute;mero</TH>
            <TH ALIGN=CENTER NOWRAP width="15%">Referencia<BR>Original</TH>            
            <TH ALIGN=CENTER NOWRAP width="10%">Mda</TH>				
            <TH ALIGN=CENTER NOWRAP width="15%">Monto</TH>
            <TH ALIGN=CENTER NOWRAP width="15%">Estado</TH>
            <TH ALIGN=CENTER NOWRAP width="15%">Fecha<BR>Valor</TH>
            <TH ALIGN=CENTER NOWRAP width="15%">Tipo<BR>Transacción</TH>
          </TR>
        </TABLE>
  
   <div id="dataDiv1" class="scbarcolor">              
    <table id="dataTable" width="100%">
    <%
                appList.initRow();
                int k=1;
                while (appList.getNextRow()) {
                    if (appList.getFlag().equals("")) {
                    		out.println(appList.getRecord());
                    k++;
                    }        
                }
    %> 
   </table>
   </div>
   </TD>
   <TD nowrap ALIGN="RIGHT" valign="top" width="20%">
      <Table id="tbAddInfoH" width="100%" >
        <tr id="trdark">
            <TH ALIGN=CENTER nowrap >Informaci&oacute;n B&aacute;sica</TH>
        </tr>
      </Table>

     <Table id="tbAddInfo" >
      <tr id="trclear" >
            <TD  ALIGN="RIGHT"  valign="middle" nowrap >
              <b>Cuenta de D&eacute;bito: <br>
              Cuenta de Cr&eacute;dito: <br>
              Por Orden : <br>
              Beneficiario : <br>
              Banco Beneficiario :<br>
              Instituci&oacute;n Ordenante : </b></TD>
         <TD ALIGN="LEFT" valign="middle" nowrap class="tdaddinfo"></TD>
      </tr>
     </Table>
  </TD>
  </TR>	
</TABLE>

<SCRIPT type="text/javascript">
     document.forms[0].totalRow.value="<%= k %>";
     function resizeDoc() {
       divResize(true);
       adjustEquTables(getElement("headTable"), getElement("dataTable"), getElement("dataDiv1"), 1, false);
      }
	 showChecked("PRINUM");
     document.getElementById("tbAddInfoH").rows[0].cells[0].height = document.getElementById("headTable").rows[0].cells[0].clientHeight;
     window.onresize=resizeDoc;
     
</SCRIPT>

<TABLE class="tbenter" WIDTH="98%" ALIGN=CENTER>
  <TR>
  <TD WIDTH="50%" ALIGN=LEFT>
<%
        if ( appList.getShowPrev() ) {
      			int pos = appList.getFirstRec() - 21;
      			out.println("<A HREF=\"javascript:enter(" + pos + ")\"><IMG border=\"0\" src=\""+request.getContextPath()+"/images/s/previous_records.gif\" ></A>");
        }
  %>  
  </TD>
  <TD WIDTH="50%" ALIGN=RIGHT>     
 <%      
        if ( appList.getShowNext() ) {
      			int pos = appList.getLastRec();
      			out.println("<A HREF=\"javascript:enter(" + pos + ")\"><IMG border=\"0\" src=\""+request.getContextPath()+"/images/s/next_records.gif\" ></A>");
        }
   %> 
   </TD>
 </TR>
</TABLE>

</FORM>

</BODY>
</HTML>
