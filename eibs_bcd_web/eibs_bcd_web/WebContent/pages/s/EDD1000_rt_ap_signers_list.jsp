<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<%@ page import ="datapro.eibs.master.Util" %>

<HTML>
<HEAD>
<TITLE>
Signers List
</TITLE>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Studio">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
 
<jsp:useBean id= "signersList" class= "datapro.eibs.beans.JBObjList"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>

<SCRIPT type="text/javascript">

<%
if ( userPO.getOption().equals("RT") ) {
%>
	builtNewMenu(rt_a_opt);
	initMenu();
<%   
} else if ( userPO.getOption().equals("SV") ) {
%>
	builtNewMenu(sv_a_opt);
	initMenu();
<%   
} else if ( userPO.getOption().equals("CD") ) {
%>
	builtNewMenu(cd_a_opt);
	initMenu();
<%   
}
%>
	
	function setInfo(idx) {
	   document.forms[0].selRow.value = idx;
	}
    
    function showInfo(idx) {
	   page= "${pageContext.request.contextPath}/pages/s/EDD1000_rt_ap_signers.jsp?ROW=" + idx;
	   CenterWindow(page,600,600,1);
	}

	function goAction(opt) {
     	
       document.forms[0].OPTION.value = opt;            
	   
	  		if (opt == "4") { //Condiciones especiales de firmas	
				document.forms[0].action = "<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDD5700"
				document.forms[0].SCREEN.value="19";
				document.forms[0].submit();		  	       	       
	  		}
	}
	
    
    
</SCRIPT>

</HEAD>

<BODY>


 <h3 align="center">
  Firmantes - Aprobación
 <img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="rt_ap_signers_list.jsp,EDD1000"> 
    </h3>
   <hr size="4">
<FORM Method="post" Action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDD0000F" >

<INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="20">
<INPUT TYPE=HIDDEN NAME="OPTION" VALUE="">
<INPUT TYPE=HIDDEN NAME="totalRow" VALUE="0">
<INPUT TYPE=HIDDEN NAME="selRow" VALUE="0">   


  <table class="tableinfo">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
          <tr id="trdark"> 
            <td nowrap width="16%" > 
              <div align="right"><b>Cliente :</b></div>
            </td>
            <td nowrap width="20%" > 
              <div align="left"> 
                <input type="text" name="E02CUN" size="10" maxlength="9" readonly value="<%= userPO.getCusNum().trim()%>">
              </div>
            </td>
            <td nowrap width="16%" > 
              <div align="right"><b>Nombre :</b> </div>
            </td>
            <td nowrap colspan="3" > 
              <div align="left"> 
                <input type="text" name="E02NA1" size="45" maxlength="45" readonly value="<%= userPO.getCusName().trim()%>">
              </div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="16%"> 
              <div align="right"><b>Cuenta :</b></div>
            </td>
            <td nowrap width="20%"> 
              <div align="left"> 
                <input type="text" name="E02CUN" size="13" maxlength="12" value="<%= userPO.getAccNum().trim()%>" readonly>
              </div>
            </td>
            <td nowrap width="16%"> 
              <div align="right"><b>Moneda : </b></div>
            </td>
            <td nowrap width="16%"> 
              <div align="left"><b> 
                <input type="text" name="E02CCY" size="3" maxlength="3" value="<%= userPO.getCurrency().trim()%>" readonly>
                </b> </div>
            </td>
            <td nowrap width="16%"> 
              <div align="right"><b>Producto : </b></div>
            </td>
            <td nowrap width="16%"> 
              <div align="left"><b> 
                <input type="text" name="E02PRO" size="4" maxlength="4" readonly value="<%= userPO.getProdCode().trim()%>">
                </b> </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  
<%
	if ( signersList.getNoResult() ) {
 %>
   		<TABLE class="tbenter" width=100% height=60%>
   	<TR>
      <TD> 
        <div align="center">           
          <p>&nbsp;</p>
          <p><b>No existen Firmantes asociados a esta cuenta</b></p>
          
        </div>
      </TD>
     </TR>
   	</TABLE>	
<%   		
	}
	else {
	
	boolean firstTime = true;
 	String chk = "";
%>

 <INPUT TYPE=HIDDEN NAME="totalRow" VALUE="0">
 <H4>Listado de Firmantes</H4>  
 <TABLE  id="mainTable" class="tableinfo">
 <TR> 
   <TD NOWRAP valign="top">
        <TABLE id="headTable" width="100%">
          <TR id="trdark"> 
            <TH ALIGN=CENTER nowrap></TH>
      		<TH ALIGN=CENTER NOWRAP>N&uacute;mero</TH>
            <TH ALIGN=CENTER NOWRAP>Cliente</TH>
            <TH ALIGN=CENTER NOWRAP>Acci&oacute;n</TH>
          </TR>
        </TABLE>
        
    <div id="dataDiv1" class="scbarcolor" style="padding:0" >
        <table id="dataTable" >
    <%
         signersList.initRow();
         int k=1;
         while (signersList.getNextRow()) {
         
         	datapro.eibs.beans.EDD550001Message dds = (datapro.eibs.beans.EDD550001Message) signersList.getRecord();
     		     		
            if (firstTime) {
						firstTime = false;
						chk = "checked";
				  }
				  else {
							chk = "";
				  }
		    
            
     		
     %> 
            <TR> 
              <TD ALIGN=CENTER NOWRAP> 
                <INPUT TYPE="radio" NAME="ROW" VALUE="<%= signersList.getCurrentRow() %>" <%=chk%> onclick="setInfo('<%= signersList.getCurrentRow()%>')">
              </TD>
              <TD ALIGN=LEFT NOWRAP><A HREF="javascript:showInfo('<%= signersList.getCurrentRow()%>')"><%= Util.formatCell(dds.getE01RCN()) %></A></TD>
              <TD ALIGN=LEFT NOWRAP><A HREF="javascript:showInfo('<%= signersList.getCurrentRow()%>')"><%= Util.formatCell(dds.getE01MA1()) %></A></TD>
              <TD ALIGN=CENTER NOWRAP><% if (dds.getE01RTY().equals("D")) out.print("Borrado");
                else if (dds.getE01RTY().equals("N")) out.print("Nuevo");
                else if (dds.getE01RTY().equals("M")) out.print("Modificado");%></TD>
             </TR>
      <%
              k++;
         }        
    %> 
          </table>
   </div>
   </TD>
  </TR>	
</TABLE>
      
<SCRIPT type="text/javascript">

  document.forms[0].totalRow.value="<%= k %>";
  function resizeDoc() {
       divResize();
       adjustEquTables(getElement('headTable'), getElement('dataTable'), getElement('dataDiv1'),1,false);
  }
  showChecked("ROW");
  resizeDoc();
  window.onresize=resizeDoc;
     
</SCRIPT>

  <%
   
  }
%> 

</FORM>
</BODY>
</HTML>
