<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<%@ page import = "datapro.eibs.master.Util" %>
<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@ page import="com.datapro.constants.EibsFields"%>

<html>
<head>
<title>Anulación Certificados de Depósito</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">

<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/jquery/plugins/contextMenu/css/jquery.contextMenu.css" rel="stylesheet" type="text/css" />

<jsp:useBean id= "cdTransac" class= "datapro.eibs.beans.EDL013003Message"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />
<jsp:useBean id="currUser" class="datapro.eibs.beans.ESS0030DSMessage" scope="session" />

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>
<script src="<%=request.getContextPath()%>/pages/s/javascripts/jquery.jsp"> </script>

<SCRIPT Language="Javascript">

 function UpdateField(bfield,trfield,afield,sfield,rep){
   var trval;
   var bfval;
   var afval=0.00;
    try{
     trval= parseFloat(formatFloat(document.forms[0][trfield].value));
     if (isNaN(trval)) trval=0.00;}
    catch(e){
     trval=0.00;
    }
    try{
     if (rep) bfval=parseFloat(formatFloat(document.forms[0][afield].value));
     else bfval=parseFloat(formatFloat(document.forms[0][bfield].value));}
    catch(e){
     bfval=0.00;
    }
    if (document.forms[0][sfield][0].checked) afval=bfval+trval;
    else if (document.forms[0][sfield][1].checked) afval=bfval-trval;
    else afval=bfval;
    document.forms[0][afield].value = formatCCY(""+afval);
  } 

 function Recalculate(){
    UpdateField('E03DEAMEP','E03TRNPRI','AFTERPRI','E03TRNPRF',false);
    <% if(cdTransac.getH03FLGWK3().equals("R")){%>
    UpdateField('E03DEAREA','E03TRNREA','AFTERREA','E03TRNREF',false);
    <% } %>
    UpdateField('E03DEAMEI','E03TRNINT','AFTERINT','E03TRNINF',false);
    UpdateField('E03DEAMEI','E03TRNADJ','AFTERINT','E03TRNADF',true);
    UpdateTotal();
 }
 
 function changeField(radio){
   var numval;
   var total;
   var newval; 
    if (!document.forms[0][radio][0].checked && !document.forms[0][radio][1].checked) {
      return;
    }
    Recalculate();
  }
  
  function verifyNum(elem){
   if (trim(elem.value)=="") elem.value="0.00";
  }
  
  function UpdateTotal(){
   
   var total;  
    try{
     total= parseFloat(formatFloat(document.getElementById("AFTERPRI").value));}
    catch(e){
     total=0.00;
    }
    <% if(cdTransac.getH03FLGWK3().equals("R")){%>
    try{
     total=total+parseFloat(formatFloat(document.getElementById("AFTERREA").value));}
    catch(e){
    }
    <% } %>
    try{
     total=total+parseFloat(formatFloat(document.getElementById("AFTERINT").value));}
    catch(e){
    }
    
   document.getElementById("AFTERTOT").value=formatCCY(""+total);
   
  }
</SCRIPT>

<SCRIPT Language="Javascript">

   //builtNewMenu(cd_t_m_opt);
   //initMenu();


</SCRIPT>


</head>

<body >

<% 
 if ( !error.getERRNUM().equals("0")  ) {
    error.setERRNUM("0");
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
 }
%>
<%
String titletxt = "Anulación Certificados de Depósito";
String prd = "Certificado: ";
if (userPO.getOption().equals("12")) {
	titletxt = "Anulación de Bonos";
	prd = "Bono: ";
}

%>

<h3 align="center"><%=titletxt %><img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="cd_anull.jsp, EDL0130"></h3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEXEDL0130">
  <INPUT TYPE=HIDDEN NAME="SCREEN" id="SCREEN" VALUE="62">
  <input type=hidden name="E03DEANR2" size="60" maxlength="60" value="<%= cdTransac.getE03DEANR2().trim()%>"> 
  <INPUT TYPE=HIDDEN NAME="E03DEABNK" id="E03DEABNK" VALUE="<%= cdTransac.getE03DEABNK().trim()%>">
  <input type=HIDDEN name="E03DEAACD" id="E03DEAACD" value="<%= cdTransac.getE03DEAACD().trim()%>">
  <input type=HIDDEN name="E03DEABRN" id="E03DEABRN" value="<%= cdTransac.getE03DEABRN().trim()%>">
  <input type=HIDDEN name="E03TRNPRI" id="E03TRNPRI" value="<%= cdTransac.getE03DEAMEP().trim()%>">
  <input type=HIDDEN name="E03TRNINT" id="E03TRNINT" value="<%= cdTransac.getE03DEAMEI().trim()%>">  
  <input type=HIDDEN name="E03TRNREA" id="E03TRNREA" value="<%= cdTransac.getE03TRNREA().trim()%>">
  <input type=HIDDEN name="E03TRNADJ" id="E03TRNADJ" value="<%= cdTransac.getE03TRNADJ().trim()%>">
  <input type=HIDDEN name="E03TRNWHL" id="E03TRNWHL" value="<%= cdTransac.getE03DEAWHL().trim()%>">
  <input type=HIDDEN name="E03TRNTAX" id="E03TRNTAX" value="<%= cdTransac.getE03DEATAX().trim()%>">
  <input type=HIDDEN name="E03TRNOPC" id="E03TRNOPC" value="<%= cdTransac.getE03TRNOPC().trim()%>">
  <input type=HIDDEN name="E03TRNCON" id="E03TRNCON" value="<%= cdTransac.getE03TRNCON().trim()%>">
  <input type=HIDDEN name="E03TRNBNK" id="E03TRNBNK" value="<%= cdTransac.getE03TRNBNK().trim()%>">
  <input type=HIDDEN name="E03TRNBRN" id="E03TRNBRN" value="<%= cdTransac.getE03TRNBRN().trim()%>">
  <input type=HIDDEN name="E03TRNCCY" id="E03TRNCCY" value="<%= cdTransac.getE03TRNCCY().trim()%>">
  <input type=HIDDEN name="E03TRNGLN" id="E03TRNGLN" value="<%= cdTransac.getE03TRNGLN().trim()%>">
  <input type=HIDDEN name="E03TRNACC" id="E03TRNACC" value="<%= cdTransac.getE03TRNACC().trim()%>">
  <input type=HIDDEN name="E03AFTPRI" id="E03AFTPRI" >
  <input type=HIDDEN name="E03AFTINT" id="E03AFTINT" >  
  <input type=HIDDEN name="E03AFTREA" id="E03AFTREA" >
  <input type=HIDDEN name="E03AFTADJ" id="E03AFTADJ" >
  <input type=HIDDEN name="E03AFTWHL" id="E03AFTWHL" >
  <input type=HIDDEN name="E03AFTTAX" id="E03AFTTAX" >
  <input type=HIDDEN name="AFTERTOT" id="AFTERTOT" >
  <input type=HIDDEN name="E03TRNVDM" id="E03TRNVDM" value="<%= cdTransac.getE03TRNVDM().trim()%>">
  <input type=HIDDEN name="E03TRNVDD" id="E03TRNVDD" value="<%= cdTransac.getE03TRNVDD().trim()%>">
  <input type=HIDDEN name="E03TRNVDY" id="E03TRNVDY" value="<%= cdTransac.getE03TRNVDY().trim()%>">


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
                <input type="text" name="E03DEACUN" size="10" maxlength="9" value="<%= cdTransac.getE03DEACUN().trim()%>" readonly>
              </div>
            </td>
            <td nowrap width="16%" > 
              <div align="right"><b>Nombre :</b> </div>
            </td>
            <td nowrap colspan="3" > 
              <div align="left"><font face="Arial"><font face="Arial"><font size="2">
                <input type="text" name="E03CUSNA1" size="45" maxlength="45" value="<%= cdTransac.getE03CUSNA1().trim()%>" readonly>
                </font></font></font></div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="16%"> 
              <div align="right"><b><%=prd %></b></div>
            </td>
            <td nowrap width="20%"> 
              <div align="left">
                <input type="text" name="E03DEAACC" size="13" maxlength="12" value="<%= cdTransac.getE03DEAACC().trim()%>" readonly>
              </div>
            </td>
            <td nowrap width="16%"> 
              <div align="right"><b>Moneda : </b></div>
            </td>
            <td nowrap width="16%"> 
              <div align="left"><b> 
                <input type="text" name="E03DEACCY" size="4" maxlength="3" value="<%= cdTransac.getE03DEACCY().trim()%>" readonly>
                </b> </div>
            </td>
            <td nowrap width="16%"> 
              <div align="right"><b>Producto : </b></div>
            </td>
            <td nowrap width="16%"> 
              <div align="left"><b>
                <input type="text" name="E03DEAPRO" size="5" maxlength="4" value="<%= cdTransac.getE03DEAPRO().trim()%>" readonly>
                </b> </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  
  <h4>Informaci&oacute;n Financiera</h4>
  
  <%int row = 0; %>
  <TABLE class="tableinfo">
     <TBODY>
        <TR> 
      <TD nowrap> 
        <TABLE cellspacing="2" cellpadding="2" width="100%" border="0">
          <TBODY>
           <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <TD nowrap width="20%"> 
              <DIV align="center"></DIV>
            </TD>
            <TD nowrap width="40%"> 
              <DIV align="left"><B>Valores Actuales</B></DIV>
            </TD>
          </TR>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <TD nowrap > 
              <DIV align="right">Saldo de Capital :</DIV>
            </TD>
            <TD nowrap align="left">
             <INPUT type="text" readonly name="E03DEAMEP" size="23" maxlength="13" value="<%= Util.formatCCY(cdTransac.getE03DEAMEP())%>" readonly></TD>
          </TR>
          
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <TD nowrap> 
              <DIV align="right">Saldo de Interés :</DIV>
            </TD>
            <TD nowrap align="left">
            <INPUT type="text" readonly name="E03DEAMEI" size="23" maxlength="13" value="<%= Util.formatCCY(cdTransac.getE03DEAMEI())%>" readonly>
            </TD>
          </TR>
          
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <TD nowrap> 
              <DIV align="right">Retenciones :</DIV>
            </TD>
            <TD nowrap align="left">
            <INPUT type="text" readonly name="E03DEAWHL" size="23" maxlength="13" value="<%= Util.formatCCY(cdTransac.getE03DEAWHL())%>" readonly>
            </TD>
          </TR>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <TD nowrap> 
              <DIV align="right">Impuestos :</DIV>
            </TD>
            <TD nowrap align="left">
            <INPUT type="text" readonly name="E03DEATAX"  size="23" maxlength="13" value="<%= Util.formatCCY(cdTransac.getE03DEATAX())%>" readonly>
            </TD>
          </TR>

          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <TD nowrap> 
              <DIV align="right">Total :</DIV>
            </TD>
            <TD nowrap align="left">
            <INPUT type="text" readonly name="E03DEATOT"  size="23" maxlength="13" value="<%= Util.formatCCY(cdTransac.getE03DEATOT())%>" readonly>
            </TD>
          </TR>
 
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">           
            <td width="40%"> 
              <div align="right">Descripci&oacute;n :</div>
            </td>
            <td width="60%"> 
              <input type="text" name="E03DEANR1" size="60" maxlength="60" value="<%= cdTransac.getE03DEANR1().trim()%>">
            </td>
          </tr> 

        	</TBODY>
            </TABLE>
      	</TD>
    </TR>
  </TBODY>
</TABLE>

<!--


  <SCRIPT language="JavaScript">
      Recalculate();
  </SCRIPT>
  -->
  
  <p align="center"> 
    <input id="EIBSBTN" type=submit name="Submit" value="Enviar">
  </p>
</form>
</body>
</html>
