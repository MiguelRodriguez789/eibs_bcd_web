<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput"%>
<%@page import="com.datapro.constants.EibsFields"%>
<%@page import="com.datapro.eibs.constants.HelpTypes"%>
<html>
<head>

<META name="GENERATOR" content="IBM WebSphere Page Designer V4.0 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<title>Comisiones-Definición de Canales</title>
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "Channel" class= "datapro.eibs.beans.ESD020303Message"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>


<script type="text/javascript">

function CheckAcc(screen){

	document.forms[0].SCREEN.value = screen;
	document.forms[0].submit();
}

</SCRIPT>  


<script src="<%=request.getContextPath()%>/jquery/readOnlyPage.jsp"> </script>

 
</head>

<body bgcolor="#FFFFFF">

<%
	if (!error.getERRNUM().equals("0")) {
		error.setERRNUM("0");
		out.println("<SCRIPT Language=\"Javascript\">");
		out.println("       showErrors()");
		out.println("</SCRIPT>");
	}
%> 
 
 
<h3 align="center">Comisiones-Definición de Canales<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="rt_channel_detail, ESD0203" ></h3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.params.JSESD0203">

    <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="303">
    
  <h4> </h4>
  
  <% int row = 0; %>
  <table class="tableinfo">
          <tr > 
        <td nowrap> 
          
        <table cellspacing="0" cellpadding="2" width="100%" border="0" align="left" >

          <tr id="<%=(row % 2 == 1) ? "trclear" : "trdark"%><%row++;%>"> 
            <td nowrap width="25%"> 
              <div align="right">Banco :</div>
            </td>
            <td nowrap> 
              <div align="left"> 
                <input type="text" name="E03DDHBNK" readonly size="3" maxlength="2" value="<%=userPO.getBank().trim()%>">
              </div>
            </td>
            
            <td nowrap width="25%">
            </td>
            <td nowrap>
            </td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trclear" : "trdark"%><%row++;%>"> 
            <td nowrap width="25%"> 
              <div align="right">Código de Canal :</div>
            </td>
            <td nowrap> 
              <div align="left"> 
            <% if(userPO.getPurpose().equals("NEW")) {%>
                <input type="text" name="E03DDHCHN" size="4" maxlength="5" value="<%=Channel.getE03DDHCHN().trim()%>">
                <a href="javascript:GetChannelDef('E03DDHCHN','E03DDHDSC')"><img src="<%=request.getContextPath()%>/images/1b.gif" align="bottom" border="0"></a>

                     <%}else {%>
                <input type="text" name="E03DDHCHN" readonly size="4" maxlength="5" value="<%=Channel.getE03DDHCHN().trim()%>">
             <%}%>   
              </div>
            </td>
            
            <td nowrap width="25%">
              <div align="right">Descripcion Canal :</div>
            </td>
            <td nowrap width="25%">
                <input type="text" name="E03DDHDSC" readonly size="45" maxlength="45" value="<%=Channel.getE03DDHDSC().trim()%>">
            </td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trclear" : "trdark"%><%row++;%>"> 
            <td nowrap width="25%"> 
              <div align="right">Código de Proveedor :</div>
            </td>
            <td nowrap> 
              <div align="left"> 
            <% if(userPO.getPurpose().equals("NEW")) {%>
                <input type="text" name="E03DDHPRV" size="4" maxlength="5" value="<%=Channel.getE03DDHPRV().trim()%>">
                <a href="javascript:GetCodeDescCNOFC('E03DDHPRV','E03DDHPRD','BT')"><img src="<%=request.getContextPath()%>/images/1b.gif" align="bottom" border="0"></a>
                     <%}else {%>
                <input type="text" name="E03DDHPRV" size="4" maxlength="5" value="<%=Channel.getE03DDHPRV().trim()%>" readonly>
             <%}%>   

              </div>
            </td>
            
            <td nowrap width="25%">
              <div align="right">Descripcion Proveedor :</div>
            </td>
            <td nowrap width="25%">
                <input type="text" name="E03DDHPRD" readonly size="60" maxlength="60" value="<%=Channel.getE03DDHPRD().trim()%>">

            </td>
          </tr>

          <tr id="<%=(row % 2 == 1) ? "trclear" : "trdark"%><%row++;%>"> 
            <td nowrap width="25%"> 
              <div align="right">Código de Comision :</div>
            </td>
            <td nowrap> 
              <div align="left"> 
            <% if(userPO.getPurpose().equals("NEW")) {%>
                <input type="text" name="E03DDHCDE" size="4" maxlength="5" value="<%=Channel.getE03DDHCDE().trim()%>">
                <a href="javascript:GetCommDef('E03DDHCDE','E03DDHCDD')"><img src="<%=request.getContextPath()%>/images/1b.gif" align="bottom" border="0"></a>
                     <%}else {%>
                <input type="text" name="E03DDHCDE" readonly size="4" maxlength="5" value="<%=Channel.getE03DDHCDE().trim()%>">
             <%}%>   
              </div>
            </td>
            
            <td nowrap width="25%">
              <div align="right">Descripcion Comision :</div>
            </td>
            <td nowrap width="25%">
                <input type="text" name="E03DDHCDD" readonly size="60" maxlength="60" value="<%=Channel.getE03DDHCDD().trim()%>">

            </td>
          </tr>


        </table>
        </td>
      </tr>


</table>
    
    
  <h4><b>Información Básica</b></h4>
  <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" align="left" >
          <tr id="<%=(row % 2 == 1) ? "trclear" : "trdark"%><%row++;%>"> 
            <td nowrap width="22%"> 
              <div align="right">Tarifa :</div>
            </td>
            <td nowrap width="18%"> 
              <div align="left"> 
                 <input type="text" name="E03DDHCOA" size="13" maxlength="13" value="<%=Channel.getE03DDHCOA()%>" onKeypress="enterDecimal(event, 2)">
              </div>
            </td>
            <td nowrap width="29%"> 
              <div align="right">Porcentaje de Descuento :</div>
            </td>
            <td nowrap width="31%" >
              <input type="text" name="E03DDHCOP" size="10" maxlength="9" value="<%=Channel.getE03DDHCOP()%>" onKeypress="enterDecimal(event, 3)">
			</td>

          </tr>

          <tr id="<%=(row % 2 == 1) ? "trclear" : "trdark"%><%row++;%>"> 
            <td nowrap width="22%"> 
              <div align="right">Numero de Transacciones con Excepcion :</div>
            </td>
			<td width="18%">
			 <input type="text" name="E03DDHNTE" size="6" maxlength="5" value="<%=Channel.getE03DDHNTE()%>" onKeypress="enterInteger(event)">
			</td>
            <td nowrap width="29%"> 
              <div align="right">Numero de Periodo :</div>
            </td>
            <td nowrap width="31%" >
              <input type="text" name="E03DDHNPE" size="6" maxlength="5" value="<%=Channel.getE03DDHNPE()%>" onKeypress="enterInteger(event)">
			</td>
          </tr>



          <tr id="<%=(row % 2 == 1) ? "trclear" : "trdark"%><%row++;%>"> 
            <td nowrap width="22%"> 
              <div align="right">Frecuencia Periodo :</div>
            </td>
			<td width="18%"><select name="E03DDHTPE" >
			  <option value=" " <% if (!(Channel.getE03DDHTPE().equals("D")||Channel.getE03DDHTPE().equals("W")||Channel.getE03DDHTPE().equals("B")||
			                             Channel.getE03DDHTPE().equals("C")||Channel.getE03DDHTPE().equals("M")))out.print("selected"); %>>
			  </option>
              <option value="D" <%if (Channel.getE03DDHTPE().equals("D")) out.print("selected"); %>>Diario</option>
              <option value="W" <%if (Channel.getE03DDHTPE().equals("W")) out.print("selected"); %>>Semanal</option>
              <option value="B" <%if (Channel.getE03DDHTPE().equals("B")) out.print("selected"); %>>Bisemanal 01-15</option>
              <option value="C" <%if (Channel.getE03DDHTPE().equals("C")) out.print("selected"); %>>Bisemanal 16-31</option>
              <option value="M" <%if (Channel.getE03DDHTPE().equals("M")) out.print("selected"); %>>Mensual</option>
             </select>
			</td>
            <td nowrap width="29%"> 
              <div align="right">Estado :</div>
            </td>
            <td nowrap width="31%" >
               	     <select name="E03DDHSTS" >
				           <option value=" " <% if (!(Channel.getE03DDHSTS().equals("A") ||Channel.getE03DDHSTS().equals("I")||Channel.getE03DDHSTS().equals("C"))) 
				           out.print("selected"); %>>
				           </option>
                           <option value="A" <%if (Channel.getE03DDHSTS().equals("A")) out.print("selected"); %>>Activo</option>
                           <option value="I" <%if (Channel.getE03DDHSTS().equals("I")) out.print("selected"); %>>Inactivo</option>
                           <option value="C" <%if (Channel.getE03DDHSTS().equals("C")) out.print("selected"); %>>Cerrado</option>
                       </select>
			</td>
          </tr>

        </table>
      </td>
    </tr>
  </table>



  <p>
  <div align="center"> 
    <input id="EIBSBTN" type=submit name="Submit" value="Enviar"  onClick="javascript:CheckAcc(303)">
    <input id="EIBSBTN" type=button name="Submit" OnClick="checkClose()" value="Salir">
  </div>
</form>
</body>
</html>
