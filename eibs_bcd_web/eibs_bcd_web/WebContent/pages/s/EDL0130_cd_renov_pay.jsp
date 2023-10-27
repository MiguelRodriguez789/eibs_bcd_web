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

   builtNewMenu(cd_m_opt);


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

<h3 align="center">Distribucion de Pago en Renovacion<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="cd_renov_pay.jsp, EDL0130"></h3>
<hr size="4">
<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDL0132" >
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
              <div align="right"><b>Cuenta :</b></div>
            </td>
            <td nowrap width="20%"> 
              <input type="text" name="E12DEAACC" size="13" maxlength="12" value="<%= userPO.getAccNum().trim()%>" readonly>
            </td>
            <td nowrap width="16%"> 
              <div align="right"><b>Moneda : </b></div>
            </td>
            <td nowrap width="16%"> 
              <input type="text" name="E01DEACCY" size="4" maxlength="3" value="<%= userPO.getCurrency().trim()%>" readonly>
            </td>
            <td nowrap width="16%"> 
              <div align="right"><b>Producto : </b></div>
            </td>
            <td nowrap width="16%"> 
              <input type="text" name="E02PRO" size="5" maxlength="4" readonly value="<%= userPO.getProdCode().trim()%>">
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>

  <br>
<div id="dataDiv" align="center" style="height:100%; overflow-y:scroll; width:100%; padding-left:50; padding-right:10" class="scbarcolor">
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
 <table><tr>
 <td align="left"><h4>Primero</h4></td>
</tr></table>
<%          
           break;
        case 2 : 
%> 
<br>
 <table><tr>
 <td align="left"><h4>Segundo</h4></td>
</tr></table>
<%          
           break;
        case 3 : 
%> 
<br>
<table><tr>
<td align="left"><h4>Tercero</h4></td>
</tr></table>
<%          
           break;
        case 4 : 
%> 
<br>
<table><tr>
<td align="left"><h4>Cuarto</h4></td>
</tr></table>
<%          
           break;
        case 5 : 
%> 
<br>
<table><tr>
<td align="left"><h4>Quinto</h4></td>
</tr></table>
<%          
           break;
        case 6 : 
%> 
<br>
<table><tr>
<td align="left"><h4>Sexto</h4></td>
</tr></table>
<%          
           break;
        case 7 : 
%> 
<br>
<table><tr>
<td align="left"><h4>Séptimo</h4></td>
</tr></table>
<%          
           break;
        case 8 : 
%> 
<br>
<table><tr>
<td align="left"><h4>Octavo</h4></td>
</tr></table>
<%          
           break;
        case 9 : 
%> 
<br>
<table><tr>
<td align="left"><h4>Noveno</h4></td>
</tr></table>
<%          
           break;
        case 10 : 
%> 
<br>
<table><tr>
<td align="left"><h4>Décimo</h4></td>
</tr></table>
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
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td width="40%" nowrap> 
              <div align="right">Beneficiario :</div>
            </td>
            <td nowrap width="60%"> 
              <input type="text" name="E12D<%= name %>CUN" maxlength="10" size="12" value="<%= cdData.getField("E12D" + name + "CUN").getString().trim()%>">           
              <a href="javascript:GetCustomerDescId('E12D<%= name %>CUN','E12D<%= name %>BN1','')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="bottom" border="0" ></a>
              <input type="text" name="E12D<%= name %>BN1" maxlength="35" size="35" value="<%= cdData.getField("E12D" + name + "BN1").getString().trim()%>">
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="40%"> 
              <div align="right">Direcci&oacute;n :</div>
            </td>
            <td nowrap width="60%"> 
              <input type="text" name="E12D<%= name %>BN2" maxlength="35" size="35" value="<%= cdData.getField("E12D" + name + "BN2").getString().trim()%>">
              </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="40%"> 
              <div align="right"></div>
            </td>
            <td nowrap width="60%"> 
              <input type="text" name="E12D<%= name %>BN3" maxlength="35" size="35" value="<%= cdData.getField("E12D" + name + "BN3").getString().trim()%>">
              </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="40%"> 
              <div align="right"></div>
            </td>
            <td nowrap width="60%"> 
              <input type="text" name="E12D<%= name %>BN4" maxlength="35" size="35" value="<%= cdData.getField("E12D" + name + "BN4").getString().trim()%>">
              </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="40%"> 
              <div align="right"></div>
            </td>
            <td nowrap width="60%"> 
              <input type="text" name="E12D<%= name %>BN5" maxlength="35" size="35" value="<%= cdData.getField("E12D" + name + "BN5").getString().trim()%>">
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="40%"> 
              <div align="right">Monto/Porcentaje :</div>
            </td>
            <td nowrap width="60%"> 
              <input type="text" name="E12D<%= name %>AMP" maxlength="16" size="17" value="<%= cdData.getField("E12D" + name + "AMP").getString().trim()%>">
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="40%"> 
              <div align="right">Monto/Porc/Retenc. :</div>
            </td>
            <td nowrap width="60%"> 
              <input type="text" name="E12D<%= name %>FLG" maxlength="1" size="2" value="<%= cdData.getField("E12D" + name + "FLG").getString().trim()%>"> <b>(F,%,H)</b>
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="40%"> 
              <div align="right">Via de Pago :</div>
            </td>
            <td nowrap width="60%"> 
              <select name="E12D<%= name %>PVI">
                <option value="C" <% if (cdData.getField("E12D" + name + "PVI").getString().equals("C")) out.print("selected"); %>>Cheque Oficial</option>
                <option value="R" <% if ( !(cdData.getField("E12D" + name + "PVI").getString().equals("1") || cdData.getField("E12D" + name + "PVI").getString().equals("2") 
                || cdData.getField("E12D" + name + "PVI").getString().equals("3") || cdData.getField("E12D" + name + "PVI").getString().equals("C") 
                || cdData.getField("E12D" + name + "PVI").getString().equals("T") || cdData.getField("E12D" + name + "PVI").getString().equals("L"))) out.print("selected"); %>>Cta Detalle</option>
              	<option value="T" <% if (cdData.getField("E12D" + name + "PVI").getString().equals("T")) out.print("selected"); %>>Cert.Deposito</option>
                <option value="L" <% if (cdData.getField("E12D" + name + "PVI").getString().equals("L")) out.print("selected"); %>>Pago Prestamo</option>
                <option value="1" <% if (cdData.getField("E12D" + name + "PVI").getString().equals("1")) out.print("selected"); %>>Swift MT-100</option>
                <option value="2" <% if (cdData.getField("E12D" + name + "PVI").getString().equals("2")) out.print("selected"); %>>Swift MT-200</option>
                <option value="3" <% if (cdData.getField("E12D" + name + "PVI").getString().equals("3")) out.print("selected"); %>>Swift MT-202</option>
                </select>
              </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="40%"> 
              <div align="right">Cta.Credito :</div>
            </td>
            <td nowrap width="60%"> 
              <input type="text" name="E12D<%= name %>BAC" maxlength="15" size="12" value="<%= cdData.getField("E12D" + name + "BAC").getString().trim()%>">
              <a href="javascript:GetAccount('E12D<%= name %>BAC','','RT','')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="help" align="bottom" border="0" ></a> 
		    </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="40%"> 
              <div align="right">Pagar a :</div>
            </td>
            <td nowrap width="60%"> 
              <input type="radio" name="E12D<%= name %>PIN" value="P" <% if (cdData.getField("E12D" + name + "PIN").getString().equals("P")) out.print("checked"); %>>
              Principal 
              <input type="radio" name="E12D<%= name %>PIN" value="I" <% if (!cdData.getField("E12D" + name + "PIN").getString().equals("P")) out.print("checked"); %>>
              Interes </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="40%">  
              <div align="right">PO/ Referencia :</div>
            </td>
            <td nowrap width="60%"> 
              <input type="text" name="E12D<%= name %>COT" maxlength="11" size="12" value="<%= cdData.getField("E12D" + name + "COT").getString().trim()%>">
              </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="40%"> 
              <div align="right">Comentarios :</div>
            </td>
            <td nowrap width="60%"> 
              <input type="text" name="E12D<%= name %>RM1" maxlength="35" size="36" value="<%= cdData.getField("E12D" + name + "RM1").getString().trim()%>">
              </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="40%"> 
              <div align="right"></div>
            </td>
            <td nowrap width="60%"> 
              <input type="text" name="E12D<%= name %>RM2" maxlength="35" size="36" value="<%= cdData.getField("E12D" + name + "RM2").getString().trim()%>">
              </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="40%"> 
              <div align="right"></div>
            </td>
            <td nowrap width="60%"> 
              <input type="text" name="E12D<%= name %>RM3" maxlength="35" size="36" value="<%= cdData.getField("E12D" + name + "RM3").getString().trim()%>">
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
  
  
   <p align="center"> 
    <input id="EIBSBTN" type=submit name="Submit" value="Enviar">
  </p>
 	 
</form>
</body>
</html>
