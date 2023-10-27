<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<%@ page import = "datapro.eibs.master.Util" %>
<html>
<head>
<title>Swift Free Format Maintenance</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">



<jsp:useBean id="lcqa" class="datapro.eibs.beans.ESWF40002Message"  scope="session" />

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />

<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>
<SCRIPT type="text/javascript">

 function Validate(){
   document.forms[0].SCREEN.value = "926";
   document.forms[0].submit();
}
 function SubmitAcc(){
   document.forms[0].SCREEN.value = "908";
   document.forms[0].submit();
}

</SCRIPT>
</head>

<% 
	boolean isReadonly = userPO.getPurpose().equals("INQUIRY");
	String ctrlDisabled = isReadonly ? "disabled" : "";
	String ctrlReadonly = isReadonly ? "readonly" : "";

	String typ = "", titTypeSing = "Carta de Cr&eacute;dito", titTypePlu = "Cartas de Cr&eacute;dito";
	if (request.getAttribute("typ")!=null)
		typ = (String) request.getAttribute("typ");  
	if (typ.equals("COLL"))
	{
		titTypeSing = "Cobranza";
		titTypePlu = "Cobranzas";
	}
%>

<body >
<% 
 if ( !error.getERRNUM().equals("0")  ) {
     error.setERRNUM("0");
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
     }

%>
<h3 align="center">Formato Libre Swift <%= titTypePlu %><img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="lc_ff_format_maint.jsp,ESWF400"> 
</h3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSESWF400" >
  <p> 
    <input type=HIDDEN name="SCREEN" value="908">
    <input type=HIDDEN name="typ" value="<%=typ %>">
    
    <input type="hidden" name="E02LCOSEQ" value="<%= lcqa.getE02LCOSEQ()%>">
  </p>
  <table  class="tableinfo" width="545">
    <tr > 
      <td nowrap> 
        <table cellpadding=2 cellspacing=0 width="100%" border="0">
        
           <tr id="trdark"> 
            <td nowrap width="27%" > 
              <div align="right"><%= titTypeSing %> :</div>
            </td>
            <td nowrap width="27%" > 
              <input type="text" name="E02LCOACC" size="14" maxlength="12" value="<%= lcqa.getE02LCOACC()%>" <%=ctrlReadonly %>>
            </td>
            <td nowrap width="26%" > 
              <div align="right">Formato Swift :</div>
            </td>
            <td nowrap>
              <SELECT name="E02LCOFMT" <%=ctrlDisabled %>>
				<% if (isReadonly && !lcqa.getE02LCOFMT().equals("")) {%>
				<OPTION value="<%= lcqa.getE02LCOFMT()%>" selected>MT<%= lcqa.getE02LCOFMT()%></OPTION>
              	<% } else if (!typ.equals("COLL")) {%>
		  		<OPTION value="" <%= lcqa.getE02LCOFMT().equals("")?"selected":"" %>> </OPTION>
		  		<OPTION value="799" <%= lcqa.getE02LCOFMT().equals("799")?"selected":"" %>>MT799</OPTION>
               	<OPTION value="792" <%= lcqa.getE02LCOFMT().equals("792")?"selected":"" %>>MT792</OPTION>
               	<% } else { %>
		  		<OPTION value="" <%= lcqa.getE02LCOFMT().equals("")?"selected":"" %>> </OPTION>
		  		<OPTION value="499" <%= lcqa.getE02LCOFMT().equals("499")?"selected":"" %>>MT499</OPTION>
               	<OPTION value="492" <%= lcqa.getE02LCOFMT().equals("492")?"selected":"" %>>MT492</OPTION>
               	<% } %>
              </SELECT>
            </td>
          </tr>
          
           <tr id="trclear"> 
            <td nowrap width="27%" > 
              <div align="right">N&uacute;mero de Referencia:</div>
            </td>
            <td nowrap width="27%" > 
              <input type="text" name="E02LCOREF" size="18" maxlength="16" value="<%= lcqa.getE02LCOREF()%>" <%=ctrlReadonly %>>
            </td>
            <td nowrap width="26%" > 
              <div align="right">Referencia Relacionada :</div>
            </td>
            <td nowrap >
            <INPUT type="text" name="E02LCORLR" size="18" maxlength="16" value="<%= lcqa.getE02LCORLR()%>" <%=ctrlReadonly %>></td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="27%" > 
              <div align="right">Mensaje :</div>
            </td>
            <td nowrap width="27%" > 
              <input type="text" name="E02LCOOMF" size="5" maxlength="3" value="<%= lcqa.getE02LCOOMF()%>" <%=ctrlReadonly %>>
            </td>
            <td nowrap width="26%" > 
              <div align="right">Fecha del Mensaje (YYMMDD) :</div>
            </td>
            <td nowrap>
              <INPUT type="text" name="E02LCOOMD" value="<%=lcqa.getE02LCOOMD()%>" size="8" maxlength="6" <%=ctrlReadonly %>>  
			</td>
          </tr>
           <tr id="trclear"> 
            <td nowrap width="27%" colspan="2"> 
              <div align="right">Banco Receptor del Mensaje :</div>
            </td>
            <td nowrap colspan="2">
              <INPUT type="text" name="E02LCOSRI" value="<%=lcqa.getE02LCOSRI()%>" size="14" maxlength="12" <%=ctrlReadonly %>>
              
              <% if (!isReadonly)  {%>
	              <A href="javascript:GetSwiftId('E02LCOSRI')">
			      <IMG src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda"  border="0"></A>
		      <% } %>
		      
			</td>
          </tr>          
           
          <tr id="trdark"> 
            <td nowrap colspan="4" > 
              <div align="center">Narrativa (79)</div>
            </td>
          </tr>        
          <tr id="trclear"> 
            <td nowrap colspan="4" align="center"> 
            <div style="height:200px; overflow-y: scroll">
                <input type="text" name="E02LCOML1" size="80" maxlength="50" value="<%= lcqa.getE02LCOML1()%>" <%=ctrlReadonly %>><br>
                <input type="text" name="E02LCOML2" size="80" maxlength="50" value="<%= lcqa.getE02LCOML2()%>" <%=ctrlReadonly %>><br>
                <input type="text" name="E02LCOML3" size="80" maxlength="50" value="<%= lcqa.getE02LCOML3()%>" <%=ctrlReadonly %>><br>
                <input type="text" name="E02LCOML4" size="80" maxlength="50" value="<%= lcqa.getE02LCOML4()%>" <%=ctrlReadonly %>><br>
                <input type="text" name="E02LCOML5" size="80" maxlength="50" value="<%= lcqa.getE02LCOML5()%>" <%=ctrlReadonly %>><br>
                <input type="text" name="E02LCOML6" size="80" maxlength="50" value="<%= lcqa.getE02LCOML6()%>" <%=ctrlReadonly %>><br>
                <input type="text" name="E02LCOML7" size="80" maxlength="50" value="<%= lcqa.getE02LCOML7()%>" <%=ctrlReadonly %>><br>
                <input type="text" name="E02LCOML8" size="80" maxlength="50" value="<%= lcqa.getE02LCOML8()%>" <%=ctrlReadonly %>><br>
                <input type="text" name="E02LCOML9" size="80" maxlength="50" value="<%= lcqa.getE02LCOML9()%>" <%=ctrlReadonly %>><br>
                <input type="text" name="E02LCOM10" size="80" maxlength="50" value="<%= lcqa.getE02LCOM10()%>" <%=ctrlReadonly %>><br>
                <input type="text" name="E02LCOM11" size="80" maxlength="50" value="<%= lcqa.getE02LCOM11()%>" <%=ctrlReadonly %>><br>
                <input type="text" name="E02LCOM12" size="80" maxlength="50" value="<%= lcqa.getE02LCOM12()%>" <%=ctrlReadonly %>><br>
                <input type="text" name="E02LCOM13" size="80" maxlength="50" value="<%= lcqa.getE02LCOM13()%>" <%=ctrlReadonly %>><br>
                <input type="text" name="E02LCOM14" size="80" maxlength="50" value="<%= lcqa.getE02LCOM14()%>" <%=ctrlReadonly %>><br>
                <input type="text" name="E02LCOM15" size="80" maxlength="50" value="<%= lcqa.getE02LCOM15()%>" <%=ctrlReadonly %>><br>
                <input type="text" name="E02LCOM16" size="80" maxlength="50" value="<%= lcqa.getE02LCOM16()%>" <%=ctrlReadonly %>><br>
               <input type="text" name="E02LCOM17" size="80" maxlength="50" value="<%= lcqa.getE02LCOM17()%>" <%=ctrlReadonly %>><br>
                <input type="text" name="E02LCOM18" size="80" maxlength="50" value="<%= lcqa.getE02LCOM18()%>" <%=ctrlReadonly %>><br>
                <input type="text" name="E02LCOM19" size="80" maxlength="50" value="<%= lcqa.getE02LCOM19()%>" <%=ctrlReadonly %>><br>
                <input type="text" name="E02LCOM20" size="80" maxlength="50" value="<%= lcqa.getE02LCOM20()%>" <%=ctrlReadonly %>><br>
                <input type="text" name="E02LCOM21" size="80" maxlength="50" value="<%= lcqa.getE02LCOM21()%>" <%=ctrlReadonly %>><br>
                <input type="text" name="E02LCOM22" size="80" maxlength="50" value="<%= lcqa.getE02LCOM22()%>" <%=ctrlReadonly %>><br>
                <input type="text" name="E02LCOM23" size="80" maxlength="50" value="<%= lcqa.getE02LCOM23()%>" <%=ctrlReadonly %>><br>
                <input type="text" name="E02LCOM24" size="80" maxlength="50" value="<%= lcqa.getE02LCOM24()%>" <%=ctrlReadonly %>><br>
                <input type="text" name="E02LCOM25" size="80" maxlength="50" value="<%= lcqa.getE02LCOM25()%>" <%=ctrlReadonly %>><br>
                <input type="text" name="E02LCOM26" size="80" maxlength="50" value="<%= lcqa.getE02LCOM26()%>" <%=ctrlReadonly %>><br>
                <input type="text" name="E02LCOM27" size="80" maxlength="50" value="<%= lcqa.getE02LCOM27()%>" <%=ctrlReadonly %>><br>
                <input type="text" name="E02LCOM28" size="80" maxlength="50" value="<%= lcqa.getE02LCOM28()%>" <%=ctrlReadonly %>><br>
                <input type="text" name="E02LCOM29" size="80" maxlength="50" value="<%= lcqa.getE02LCOM29()%>" <%=ctrlReadonly %>><br>
                <input type="text" name="E02LCOM30" size="80" maxlength="50" value="<%= lcqa.getE02LCOM30()%>" <%=ctrlReadonly %>><br>
                <input type="text" name="E02LCOM31" size="80" maxlength="50" value="<%= lcqa.getE02LCOM31()%>" <%=ctrlReadonly %>><br>
                <input type="text" name="E02LCOM32" size="80" maxlength="50" value="<%= lcqa.getE02LCOM32()%>" <%=ctrlReadonly %>><br>
                <input type="text" name="E02LCOM33" size="80" maxlength="50" value="<%= lcqa.getE02LCOM33()%>" <%=ctrlReadonly %>><br>
                <input type="text" name="E02LCOM34" size="80" maxlength="50" value="<%= lcqa.getE02LCOM34()%>" <%=ctrlReadonly %>><br>
                <input type="text" name="E02LCOM35" size="80" maxlength="50" value="<%= lcqa.getE02LCOM35()%>" <%=ctrlReadonly %>>
              </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <br>
  
  <% if (!isReadonly) { %>
  
  <h4 style="text-align:center"><input type="checkbox" name="H02FLGWK2" value="A" <% if(lcqa.getH02FLGWK2().equals("A")){ out.print("checked");} %>>
      Aceptar con Advertencias</h4>  
  
  <table width="100%" border="0" cellspacing="0" cellpadding="0" bgcolor="#FFFFFF" bordercolor="#FFFFFF">
    <tr bgcolor="#FFFFFF"> 
      <td width="33%"> 
        <div align="center"> 
          <input id="EIBSBTN" type=button name="Submit" value="Finalizar" onClick="SubmitAcc();">
        </div>
      </td>
      <td width="33%">
        <div align="center">
          <input id="EIBSBTN" type=button name="Submit2" value="Validar" onClick="Validate();">
        </div>
      </td>
    </tr>
  </table>
  <% } %>
  
  </form>
</body>
</html>
