<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>Remesas Bancos</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Studio">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id="lnParam" class="datapro.eibs.beans.EDD070102Message"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>

<SCRIPT Language="Javascript">    

function checkValues() {
	return true;
}
</SCRIPT>

<% 
 if ( !error.getERRNUM().equals("0")  ) {
     error.setERRNUM("0");
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
 }       
%>

</head>
<body>
<h3 align="center">Remesas de Bancos<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="remesas_maint.jsp, EDD0701"></h3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.params.JSEDD0701" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" value="200">
  <INPUT TYPE=HIDDEN NAME="OPT" value="<%= request.getParameter("OPT") %>">
  
  <table class="tableinfo">
    <tr> 
      <td nowrap> 
        <table cellspacing="0" width="100%" border="0" class="tbhead">
          <tr id="trdark"> 
            <td nowrap align=right> 
              <b>Localidad :</b>
            </td>     
            <td nowrap > 
               <input type="text" name="E02REMLOC" size="5" maxlength="4" value="<%= lnParam.getE02REMLOC()%>" readonly>
            </td>
            <td nowrap align=right> 
              <b>Banco :</b>
            </td>
            <td nowrap > 
              <input type="text" name="E02REMBAN" size="5" maxlength="4" value="<%= lnParam.getE02REMBAN()%>" readonly>
            </td>            
          </tr>
          <tr id="trdark"> 
            <td nowrap align=right> 
              <b>Sucursal :</b>   
            </td>
            <td nowrap > 
               <input type="text" name="E02REMSUC" size="5" maxlength="4" value="<%= lnParam.getE02REMSUC()%>" readonly>
            </td>
            <td nowrap align=right> 
              <b>Moneda :</b>
            </td>
            <td nowrap > 
               <input type="text" name="E02REMCCY" size="4" maxlength="3" value="<%= lnParam.getE02REMCCY()%>" readonly>
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
         <table cellspacing="0" width="100%" border="0">
          <tr id="trdark"> 
            <td nowrap align=right> 
              Nombre del Banco :
            </td>
            <td nowrap > 
               <input type="text" name="E02REMNOM" size="46" maxlength="45" value="<%= lnParam.getE02REMNOM()%>">
            </td>
            <td nowrap align=right> 
              Local/No Local :    
            </td>
            <td nowrap > 
               <select name="E02REMLEX">
                <option value="L" <% if (lnParam.getE02REMLEX().equals("L")) out.print("selected"); %>>Local</option>
                <option value="F" <% if (lnParam.getE02REMLEX().equals("F")) out.print("selected"); %>>Extranjero</option>
                <option value="N" <% if (lnParam.getE02REMLEX().equals("N")) out.print("selected"); %>>Propio</option>
              </select>      
            </td>             
          </tr>
         
          <tr id="trclear"> 
            <td nowrap align=right> 
              Días a Compensar :
            </td>
            <td nowrap > 
               <input type="text" name="E02REMNDI" size="3" maxlength="2" value="<%= lnParam.getE02REMNDI()%>">
            </td>
            <td nowrap align=right> 
              Cuenta Contable :
            </td>
            <td nowrap > 
               <input type="text" name="E02REMLNU" onKeypress="enterInteger(event)" size="17" maxlength="16" value="<%= lnParam.getE02REMLNU().trim()%>">
               <a href="javascript:GetLedger('E02REMLNU','<%=currUser.getE01UBK()%>',document.forms[0].E02REMCCY.value,'')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="bottom" border="0" ></a> 
            </td>             
          </tr>
           
         <tr id="trdark"> 
            <td nowrap align=right> 
              Moneda de Comisión :
            </td>
            <td nowrap >        
              <input type="text" name="E02REMMCY" size="3" maxlength="3" value="<%= lnParam.getE02REMMCY().trim()%>">
              <a href="javascript:GetCurrency('E02REMMCY', document.forms[0].E02REMMCY.value)"><img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="bottom" border="0" ></a> 
            </td>
            <td nowrap align=right> 
              Monto de Comisión :
            </td>
            <td nowrap > 
               <input type="text" name="E02REMAMT" onKeypress="enterDecimal(event, 2)" size="17" maxlength="16" value="<%= lnParam.getE02REMAMT().trim()%>">
            </td>             
          </tr>
          
          <tr id="trclear"> 
            <td nowrap align=right> 
              Monto Mínimo :
            </td>
            <td nowrap > 
              <input type="text" name="E02REMMIN" onKeypress="enterDecimal(event, 2)" size="17" maxlength="16" value="<%= lnParam.getE02REMMIN().trim()%>">
            </td>
            <td nowrap align=right> 
              Monto Máximo :
            </td>
            <td nowrap > 
               <input type="text" name="E02REMMAX" onKeypress="enterDecimal(event, 2)" size="17" maxlength="16" value="<%= lnParam.getE02REMMAX().trim()%>">
            </td>             
          </tr>
          
           <tr id="trdark"> 
            <td nowrap align=right> 
              Porcentaje de Comisión :
            </td>
            <td nowrap > 
              <input type="text" name="E02REMCRT" onKeypress="enterDecimal(event, 2)" size="10" maxlength="9" value="<%= lnParam.getE02REMCRT().trim()%>">
            </td>
             <td nowrap align=right> 
              Cuenta Contable de Comisión :
            </td>
            <td nowrap > 
               <input type="text" name="E02REMCGL" onKeypress="enterInteger(event)" size="17" maxlength="16" value="<%= lnParam.getE02REMCGL().trim()%>">
               <a href="javascript:GetLedger('E02REMCGL','<%=currUser.getE01UBK()%>',document.forms[0].E02REMCCY.value,'')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="bottom" border="0" ></a> 
            </td>                
          </tr>       
          
         
          
         </table>   
      </td>
    </tr>
  </table>       
  
  <p align="center"> 
        <input id="EIBSBTN" type=submit name="Submit" value="Ingresar">
  </p>
 
  </form>
</body>
</html>
