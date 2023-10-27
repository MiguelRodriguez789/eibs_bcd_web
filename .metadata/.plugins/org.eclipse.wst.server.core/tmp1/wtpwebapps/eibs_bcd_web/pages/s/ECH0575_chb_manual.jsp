<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<HTML>
<HEAD>
<TITLE>
Consulta de Chequera/Talonario
</TITLE>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Studio">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id="rtBasic" class="datapro.eibs.beans.ECH057502Message" scope="session"/>
<jsp:useBean id="chbBasic" class="datapro.eibs.beans.ECH057501Message" scope="session"/>
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>
<jsp:useBean id="error" class="datapro.eibs.beans.ELEERRMessage" scope="session"/>
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" /> 


<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>


</head>

<body>

<h3 align="center">Ingreso Manual de Chequera/Talonario <img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="chb_manual.jsp, ECH0575"></h3>
<hr size="4">
<% 
 if ( !error.getERRNUM().equals("0")  ) 
 {
     error.setERRNUM("0");
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
 }
 
%>


<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSECH0575">


<INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="1">

<INPUT TYPE="HIDDEN" NAME="E01CHMRQD" VALUE=<%= currUser.getE01RDD()%>>
<INPUT TYPE="HIDDEN" NAME="E01CHMRQM" VALUE=<%= currUser.getE01RDM()%>>
<INPUT TYPE="HIDDEN" NAME="E01CHMRQY" VALUE=<%= currUser.getE01RDY()%>>

  <% int row = 0;%>
  <table class="tableinfo">
    <tr> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
          <tr id="trdark"> 
            <td nowrap width="16%" > 
              <div align="right"><b>Cliente :</b></div>
            </td>
            <td nowrap width="20%" > 
              <div align="left"> 
                <input type="text" name="E02ACMCUN" size="10" maxlength="9" value="<%= rtBasic.getE02ACMCUN().trim()%>" readonly>
              </div>
            </td>
            <td nowrap width="16%" > 
              <div align="right"><b>Nombre :</b></div>
            </td>
            <td nowrap colspan="3" > 
              <div align="left">
                <input type="text" name="E02CUSNA1" size="45"  maxlength="45" value="<%= rtBasic.getE02CUSNA1().trim()%>" readonly>
              </div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="16%"> 
              <div align="right"><b>Cuenta :</b></div>
            </td>
            <td nowrap width="20%"> 
              <div align="left"> 
                <input type="text" name="E01CHMACC" size="13" readonly maxlength="12" value="<%= rtBasic.getE02ACMACC().trim()%>" >
              </div>
            </td>
            <td nowrap width="16%"> 
              <div align="right"><b>Moneda : </b></div>
            </td>
            <td nowrap width="16%"> 
              <div align="left"> 
                <input type="text" name="E02ACMCCY" size="4" readonly maxlength="4" value="<%= rtBasic.getE02ACMCCY().trim()%>">
              </div>
            </td>
            <td nowrap width="16%"> 
              <div align="right"><b>Producto : </b></div>
            </td>
            <td nowrap width="16%"> 
              <div align="left"> 
                <input type="text" name="E02ACMPRO" size="4" readonly maxlength="4" value="<%= rtBasic.getE02ACMPRO().trim()%>">
              </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
<BR>
<table  class="tableinfo">
	<tr> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
          
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td align=right width=50%>
            <b>Nombre Personalizado :</b></td>
            <td nowrap>
            <INPUT type="text" name="E02CHPNO1" size="35" maxlength="35" value="<%= rtBasic.getE02CHPNO1().trim()%>" readonly></td>
          </tr>                    
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap align="right">
              <SELECT name="E02CHPRE1" disabled>
                <OPTION value="Y" <%if (!rtBasic.getE02CHPRE1().equals("O")) out.print("selected"); %>>Y</OPTION>
                <% if (currUser.getE01INT().equals("07")) { %>
                <OPTION value="O" <%if (rtBasic.getE02CHPRE1().equals("O")) out.print("selected"); %>>O</OPTION>
                <%} else { %>
                <OPTION value="O" <%if (rtBasic.getE02CHPRE1().equals("O")) out.print("selected"); %>>Y/O</OPTION>
                <%} %>
              </SELECT>
            </td>
            <td nowrap >
              <INPUT type="text" name="E02CHPNO2" size="35" maxlength="35" value="<%= rtBasic.getE02CHPNO2().trim()%>" readonly>
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap align=right>
              <b>Sucursal de Entrega : </b>
            </td>
            <td nowrap>
              <input type="text" name="E01CHMDBR" size="5" maxlength="4" value="<%= chbBasic.getE01CHMDBR().trim()%>">
              <a href="javascript:GetBranch('E01CHMDBR','')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="bottom" border="0"  ></a>
           </td>
          </tr>
          
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap align=right> 
              <b>Cobro de Cargos por Chequeras :</b>
            </td>
            <td nowrap >
              <INPUT type="radio" name="E02ACMCBC" value="Y" <% if(!rtBasic.getE02ACMCBC().equals("N")) out.print("checked");%> readonly disabled>
              S&iacute; 
              <INPUT type="radio" name="E02ACMCBC" value="N" <% if(rtBasic.getE02ACMCBC().equals("N")) out.print("checked");%> readonly disabled>
               No
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap align=right> 
              <b>Restricción de Entregas de Chequeras :</b>
            </td>
            <td nowrap >
              <INPUT type="radio" name="E02CHPCON" value="Y" <% if(rtBasic.getE02CHPCON().equals("Y")) out.print("checked");%> readonly disabled>
              S&iacute; 
              <INPUT type="radio" name="E02CHPCON" value="N" <% if(!rtBasic.getE02CHPCON().equals("Y")) out.print("checked");%> readonly disabled>
              No
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap align=right> 
              <b>Tipo de Chequera :</b>
            </td>
            <td nowrap align=left>
              <INPUT type="text" name="E01CHMTCB" size="3" maxlength="2" value="<%= rtBasic.getE02ACMTCB().trim()%>" onkeypress="enterInteger(event)" >
              <A href="javascript:GetTypCHK('E01CHMTCB','','<%= rtBasic.getE02ACMATY().trim()%>','<%= rtBasic.getE02ACMCCY().trim()%>','<%= rtBasic.getE02APCCCY().trim()%>','E01CHMCCY')">
              <IMG src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="middle" border="0"></A> 
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">  
            <td nowrap align=right> 
              <b>Stock Mínimo de Chequeras :</b>
            </td>
            <td nowrap><INPUT type="text" name="E02ACMMSK" size="3" maxlength="2" value="<%= rtBasic.getE02ACMMSK().trim()%>" readonly> </td>
            
          </tr>          
        </table>
      </td>
   </tr>
  </table>
<BR>
<table  class="tableinfo">
	<tr> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
         
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		<td nowrap align="right" width=50%>
    		<b>Cantidad de Cheques:</b>
   		</td>
 		<td nowrap>
 			<INPUT type="text" name="E01CHMNTC" size="10" maxlength="10" onkeypress="enterInteger(event)" value="<%= chbBasic.getE01CHMNTC().trim()%>">
 		</td>
		</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
   		<td nowrap align="right">
      		<b>Nro. de Cheque inicial:</b>
   		</td>
    	<td nowrap >
       		<INPUT type="text" name="E01CHMICK" size="13" maxlength="11" onkeypress="enterInteger(event)" value="<%= chbBasic.getE01CHMICK().trim()%>">
     	</td>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
	<td nowrap align="right">
      		<b>Moneda:</b>
   		</td>
            <td nowrap>
            <INPUT type="text" name="E01CHMCCY"  maxlength="4" size="3" readonly="readonly" value=<%= rtBasic.getE02ACMCCY().trim()%>>
              
            </td>            
          </tr>
	
	</table>
      </td>
   </tr>
  
</Table>

 <p align="center">
   <input id="EIBSBTN" type=submit name="Submit" value="Enviar">
 </p>

</FORM>

</BODY>
</HTML>
