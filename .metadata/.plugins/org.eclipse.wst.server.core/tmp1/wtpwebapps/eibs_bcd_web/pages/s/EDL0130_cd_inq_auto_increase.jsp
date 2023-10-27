<html>
<head>
<title>Beneficiarios</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "cdData" class= "datapro.eibs.beans.EDL013012Message"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>

<SCRIPT type="text/javascript">

<% if (userPO.getPurpose().equals("INQUIRY")) {%>
   	builtNewMenu(cd_i_opt);
<% } else {%>
 	builtNewMenu(cd_a_opt);
<% } %>

</SCRIPT>

</head>

<body>

 <% 
 if ( !error.getERRNUM().equals("0")  ) {
     out.println("<SCRIPT Language=\"Javascript\">");
     error.setERRNUM("0");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
 }
  
    out.println("<SCRIPT> initMenu(); </SCRIPT>");
 
%>

<h3 align="center">Incremento Automatico<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="cd_outo_increase.jsp, EDL0130"></h3>
<hr size="4">
<FORM >
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="300">  
  <INPUT TYPE=HIDDEN NAME="H12FLGWK1" VALUE="<%= cdData.getH12FLGWK1() %>">
  
  <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
          <tr id="trdark"> 
            <td nowrap width="16%" > 
              <div align="right"><b>Cliente :</b></div>
            </td>
            <td nowrap width="20%" > 
              <input type="text" name="E02CUN" size="10" maxlength="9" readonly value="<%= userPO.getCusNum().trim()%>">
            </td>
            <td nowrap width="16%" > 
              <div align="right"><b>Nombre :</b> </div>
            </td>
            <td nowrap colspan="3" > 
              <input type="text" name="E02NA1" size="45" maxlength="45" readonly value="<%= userPO.getCusName().trim()%>">
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="16%"> 
              <div align="right"><b>Certificado :</b></div>
            </td>
            <td nowrap width="20%"> 
              <input type="text" name="E12DEAACC" size="13" maxlength="12" value="<%= userPO.getAccNum().trim()%>" readonly>
            </td>
            <td nowrap width="16%"> 
              <div align="right"><b>Moneda : </b></div>
            </td>
            <td nowrap width="16%"> 
              <input type="text" name="E01DEACCY" size="3" maxlength="3" value="<%= userPO.getCurrency().trim()%>" readonly>
            </td>
            <td nowrap width="16%"> 
              <div align="right"><b>Producto : </b></div>
            </td>
            <td nowrap width="16%"> 
              <input type="text" name="E02PTYP" size="5" maxlength="4" readonly value="<%= userPO.getType().trim()%>">
              <input type="text" name="E02PRO2" size="5" maxlength="4" readonly value="<%= userPO.getProdCode().trim()%>">
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>

  <br>
<div id="dataDiv" align="center" style="height:404; overflow-y:scroll; width:90%; padding-left:50; padding-right:10" class="scbarcolor">
<%
  int maxc = 10;
  String name;
  for ( int i=1; i<=maxc; i++ ) {
    if ( i == 10 ) {
      name = i + ""; 
    }
    else {
      name = "0" + i;
    }
    
    out.println("<table class=\"tbenter\" border=\"0\" width=\"100%\">");
    out.println("<tr>");
    
    switch ( i ) {
        case 1 :     
%>
<br>
<table>
<tr> 
 <td align="left"><h4>Primero</h4></td>
</tr>
</table>
<%          
           break;
        case 2 : 
%>
<br> 
<table>
<tr> 
 <td align="left"><h4>Segundo</h4></td>
</tr>
</table>
<%          
           break;
        case 3 : 
%> 
<br>
<table>
<tr> 
<td align="left"><h4>Tercero</h4></td>
</tr>
</table>
<%          
           break;
        case 4 : 
%> 
<br>
<table>
<tr> 
<td align="left"><h4>Cuarto</h4></td>
</tr>
</table>
<%          
           break;
        case 5 : 
%> 
<br>
<table>
<tr> 
<td align="left"><h4>Quinto</h4></td>
</tr>
</table>
<%          
           break;
        case 6 : 
%> 
<br>
<table>
<tr> 
<td align="left"><h4>Sexto</h4></td>
</tr>
</table>
<%          
           break;
        case 7 : 
%> 
<br>
<table>
<tr> 
<td align="left"><h4>S&eacute;ptimo</h4></td>
</tr>
</table>
<%          
           break;
        case 8 : 
%> 
<br>
<table>
<tr> 
<td align="left"><h4>Octavo</h4></td>
</tr>
</table>
<%          
           break;
        case 9 : 
%> 
<br>
<table>
<tr> 
<td align="left"><h4>Noveno</h4></td>
</tr>
</table>
<%          
           break;
        case 10 : 
%> 
<br>
<table>
<tr> 
<td align="left"><h4>D&eacute;cimo</h4></td>
</tr>
</table>
<%          
           break;
     }
  out.println("<td width=\"30%\" align=\"right\">");
  out.println("<h4>");
  out.print("<A href=\"javascript:go(1)\">1</A>,<A href=\"javascript:go(2)\">2</A>,<A href=\"javascript:go(3)\">3</A>,<A href=\"javascript:go(4)\">4</A>,<A href=\"javascript:go(5)\">5</A>,");
  out.print("<A href=\"javascript:go(6)\">6</A>,<A href=\"javascript:go(7)\">7</A>,<A href=\"javascript:go(8)\">8</A>,<A href=\"javascript:go(9)\">9</A>,<A href=\"javascript:go(10)\">10</A>");
   out.println("</h4>"); 
  out.println("</td>");   
  out.println("</tr>");
  out.println("</table>"); 
%>

<%int row = 0; %>
  <table id="mainTable<%= name %>" class="tableinfo">
    <tr> 
      <td> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" title="TB_BENEFICIARY_CORP" bgcolor="#FFFFFF" bordercolor="#FFFFFF" align="center">
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td width="40%" nowrap> 
              <div align="right">Beneficiario :</div>
            </td>
            <td nowrap width="60%"> 
              <input type="text" name="E12D<%= name %>CUN" maxlength="10" size="12" value="<%= cdData.getField("E12D" + name + "CUN").getString().trim()%>" readonly>           
              <input type="text" name="E12D<%= name %>BN1" maxlength="35" size="35" value="<%= cdData.getField("E12D" + name + "BN1").getString().trim()%>" readonly>
            </td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap width="40%"> 
              <div align="right">Direcci&oacute;n :</div>
            </td>
            <td nowrap width="60%"> 
              <input type="text" name="E12D<%= name %>BN2" maxlength="35" size="35" value="<%= cdData.getField("E12D" + name + "BN2").getString().trim()%>" readonly>
              </td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap width="40%"> 
              <div align="right"></div>
            </td>
            <td nowrap width="60%"> 
              <input type="text" name="E12D<%= name %>BN3" maxlength="35" size="35" value="<%= cdData.getField("E12D" + name + "BN3").getString().trim()%>" readonly>
              </td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap width="40%"> 
              <div align="right"></div>
            </td>
            <td nowrap width="60%"> 
              <input type="text" name="E12D<%= name %>BN4" maxlength="35" size="35" value="<%= cdData.getField("E12D" + name + "BN4").getString().trim()%>" readonly>
              </td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap width="40%"> 
              <div align="right"></div>
            </td>
            <td nowrap width="60%"> 
              <input type="text" name="E12D<%= name %>BN5" maxlength="35" size="35" value="<%= cdData.getField("E12D" + name + "BN5").getString().trim()%>" readonly>
            </td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap width="40%"> 
              <div align="right">Monto/Porcentaje :</div>
            </td>
            <td nowrap width="60%"> 
              <input type="text" name="E12D<%= name %>AMP" maxlength="16" size="17" value="<%= cdData.getField("E12D" + name + "AMP").getString().trim()%>" readonly>
             </td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap width="40%"> 
              <div align="right">Indicador de Calculo :</div>
            </td>
            <td nowrap width="60%"> 
              <input type="text" name="E12D<%= name %>FLG" maxlength="1" size="2" value="<%= cdData.getField("E12D" + name + "FLG").getString().trim()%>" readonly> <b>(F,%)</b>
            </td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap width="40%"> 
              <div align="right">Cta.Inversion :</div>
            </td>
            <td nowrap width="60%"> 
              <input type="text" name="E12D<%= name %>BAC" maxlength="15" size="12" value="<%= cdData.getField("E12D" + name + "BAC").getString().trim()%>" readonly>
            </td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap width="40%"> 
              <div align="right">Base de Calculo :</div>
            </td>
            <td nowrap width="60%"> 
              <input type="text" name="E12D<%= name %>PIN" maxlength="1" size="2" value="<%= cdData.getField("E12D" + name + "PIN").getString().trim()%>" readonly>  <b>(1,2,3)</b>            
              </td>
		  </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap width="40%"> 
              <div align="right">Periodo en Dias :</div>
            </td>
            <td nowrap width="60%"> 
              <input type="text" name="E12D<%= name %>COT" maxlength="5" size="6" value="<%= cdData.getField("E12D" + name + "COT").getString().trim()%>" readonly>
              </td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap width="40%"> 
              <div align="right">Comentarios :</div>
            </td>
            <td nowrap width="60%"> 
              <input type="text" name="E12D<%= name %>RM1" maxlength="35" size="36" value="<%= cdData.getField("E12D" + name + "RM1").getString().trim()%>" readonly>
              </td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap width="40%"> 
              <div align="right"></div>
            </td>
            <td nowrap width="60%"> 
              <input type="text" name="E12D<%= name %>RM2" maxlength="35" size="36" value="<%= cdData.getField("E12D" + name + "RM2").getString().trim()%>" readonly>
              </td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap width="40%"> 
              <div align="right"></div>
            </td>
            <td nowrap width="60%"> 
              <input type="text" name="E12D<%= name %>RM3" maxlength="35" size="36" value="<%= cdData.getField("E12D" + name + "RM3").getString().trim()%>" readonly>
              </td>
          </tr>
        </table>
        
      </td>
    </tr>
  </table>
  
  <%
  }
%>
</div>
<SCRIPT type="text/javascript">
   getElement('dataDiv').style.height=  getElement('mainTable1').offsetTop + getElement("mainTable1").offsetHeight +"";
</SCRIPT>
  
 	 
</form>
</body>
</html>
