<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@page import="com.datapro.eibs.constants.ISOCodes"%>
<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@page import="com.datapro.constants.EibsFields"%>
<html>
<head>
<title>Inversiones Nocturnas</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Studio">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/jquery/plugins/contextMenu/css/jquery.contextMenu.css" rel="stylesheet" type="text/css" />

<jsp:useBean id="rtNight" class="datapro.eibs.beans.EDD043001Message"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>


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

<H3 align="center">Inversiones Nocturnas<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="rt_overnight,EDD0430"></H3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDD0430" >
  <input type=HIDDEN name="SCREEN" value="2">
 <table class="tableinfo">
    <tr> 
      <td nowrap>
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
          <tr id="trdark"> 
            <td nowrap> 
              <div align="right"><b>Cliente:</b></div>
            </td>
            <td nowrap> 
              <input type="text" name="E01ACMCUN" size="10" maxlength="9" value="<%= rtNight.getE01ACMCUN().trim()%>">
            </td>
            <td nowrap> 
              <div align="right"><b>Nombre:</b></div>
            </td>
            <td nowrap> 
              <input type="text" name="E01CUSNA1" size="45" maxlength="45" value="<%= rtNight.getE01CUSNA1().trim()%>">
            </td>            
          </tr>
          <tr id="trdark"> 
            <td nowrap> 
              <div align="right"><b>Cuenta:</b></div>
            </td>
            <td nowrap> 
              <input type="text" name="E01ACMACC" size="13" maxlength="12" value="<%= rtNight.getE01ACMACC().trim()%>">
            </td>
            <td nowrap> 
              <div align="right"><b>Producto:</b></div>
            </td>
            <td nowrap> 
              <input type="text" name="E01ACMPRO" size="4" maxlength="4" value="<%= rtNight.getE01ACMPRO().trim()%>">
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <br>
  <table class="tableinfo">
    <tr> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="trdark"> 
            <td nowrap> 
              <div align="right">Tabla Tasas de Inversi&oacute;n:</div>
            </td>
            <td nowrap> 
              <div align="left"> 
                <input type="text" name="E01INVRTB" size="3" maxlength="2" value="<%= rtNight.getE01INVRTB().trim()%>">
                <a href="javascript:GetOvernightTable('E01INVRTB','<%= rtNight.getE01INVRBK().trim()%>')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="middle" border="0" ></a></div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap> 
              <div align="right">Sobretasa de Inversi&oacute;n:</div>
            </td>
            <td nowrap> 
              <div align="left"> 
                <input type="text" name="E01INVOIS" size="9" maxlength="9" value="<%= rtNight.getE01INVOIS().trim()%>" onKeypress="enterSignDecimal(6)">
              </div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap> 
              <div align="right">Cuenta Contable de Inversi&oacute;n:</div>
            </td>
            <td nowrap>              
              <INPUT type="text" name="E01INVRBK" id="E01INVRBK" size="3" maxlength="2" value="<%= rtNight.getE01INVRBK().trim()%>">
              <INPUT type="text" name="E01INVRBR" id="E01INVRBR" size="5" maxlength="4" value="<%= rtNight.getE01INVRBR().trim()%>" 
                <% if (!userPO.getPurpose().equals("APPROVAL_INQ")) {%>class="context-menu-help" onmousedown="init(branchHelp,this.name,document.getElementById('E01INVRBK').value,'','','','')"<% } %>>
              <INPUT type="text" name="E01INVRCY" id="E01INVRCY" size="4" maxlength="3" value="<%= rtNight.getE01INVRCY().trim()%>" 
                <% if (!userPO.getPurpose().equals("APPROVAL_INQ")) {%>class="context-menu-help" onmousedown="init(currencyHelp,this.name,document.getElementById('E01INVRBK').value,'','','','')"<% } %>>              
              <input type="text" name="E01INVRGL" id="E01INVRGL" size="17" maxlength="16" value="<%= rtNight.getE01INVRGL().trim()%>" onKeypress="enterInteger(event)" 
                <% if (!userPO.getPurpose().equals("APPROVAL_INQ")) {%>class="context-menu-help" onmousedown="init(ledgerHelp,this.name,document.getElementById('E01INVRBK').value, document.getElementById('E01INVRCY').value,'','','')"<% } %>>              
            </td>
          </tr>
          <tr id="trclear">
            <td nowrap> 
              <div align="right">Cuenta de Detalle de Inversi&oacute;n:</div>
            </td>
            <td nowrap> 
              <div align="left"> 
                <input type="text" name="E01INVRAC" size="13" maxlength="12" value="<%= rtNight.getE01INVRAC().trim()%>" onKeypress="enterInteger(event)"
				 <% if (!userPO.getPurpose().equals("APPROVAL_INQ")) {%>
				 class="context-menu-help" 
				 onmousedown="init(accountHelp,this.name,document.getElementById('E01INVRBK').value,'','','','RT')" <% } %>>
			  </div>	 
            </td>             
          </tr>
          <tr id="trdark"> 
            <td nowrap> 
              <div align="right">Transferir en Multiplos de :</div>
            </td>
            <td nowrap> 
              <div align="left"> 
                <input type="text" name="E01INVMUL" size="17" maxlength="15" value="<%= rtNight.getE01INVMUL().trim()%>" onKeypress="enterInteger(event)">
              </div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="45%"> 
              <div align="right">Balance M&iacute;nimo en Cuenta:</div>
            </td>
            <td nowrap> 
              <div align="left"> 
                <input type="text" name="E01INVMIN" size="17" maxlength="15" value="<%= rtNight.getE01INVMIN().trim()%>" onKeypress="enterDecimal()">
              </div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap> 
              <div align="right">Fecha de Inicio Relaci&oacute;n :</div>
            </td>
            <td nowrap> 
				<eibsinput:date name="rtNight" fn_year="E01INVSDY" fn_month="E01INVSDM" fn_day="E01INVSDD" />
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap> 
              <div align="right">Fecha Vencimiento Relaci&oacute;n :</div>
            </td>
            <td nowrap> 
              <div align="left"> 
				<eibsinput:date name="rtNight" fn_year="E01INVMDY" fn_month="E01INVMDM" fn_day="E01INVMDD" />
              </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <% if (userPO.getPurpose().equals("APPROVAL_INQ")) {%>
 <SCRIPT type="text/javascript">
   var j=document.forms[0].elements.length;
    var felem=document.forms[0].elements;
    for(i=0;i< j;i++){
       if (felem[i].tagName!=="select"){
         if (felem[i].type=="text") felem[i].readOnly=true; else felem[i].disabled=true;
       } 
       else { felem[i].disabled=true;}
    }
    
</SCRIPT>
 
 <% } else { %> 
  
          <div align="center"> 
            <p><input id="EIBSBTN" type=submit name="Submit" value="Enviar"></p>
          </div>

 <% } %>  
  </form>
</body>
</html>
