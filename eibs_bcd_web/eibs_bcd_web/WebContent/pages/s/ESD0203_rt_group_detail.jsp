<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput"%>
<%@page import="com.datapro.constants.EibsFields"%>
<%@page import="com.datapro.eibs.constants.HelpTypes"%>
<html>
<head>

<META name="GENERATOR" content="IBM WebSphere Page Designer V4.0 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<title>Comisiones-Definición de Grupos Cargo</title>
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "Group" class= "datapro.eibs.beans.ESD020302Message"  scope="session" />
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
 
 
<h3 align="center">Comisiones-Definición de Grupos Cargo<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="rt_group_detail, ESD0203" ></h3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.params.JSESD0203">

    <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="203">
    <INPUT TYPE=HIDDEN NAME="E02DDGTYP" VALUE="N">    
    <INPUT TYPE=HIDDEN NAME="E02DDGMTH" VALUE="F">
    <INPUT TYPE=HIDDEN NAME="E02DDGNOM" VALUE="S">
    
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
                <input type="text" name="E02DDGBNK" readonly size="3" maxlength="2" value="<%=userPO.getBank().trim()%>">
              </div>
            </td>
            
            <td nowrap width="25%">
              <div align="right">Código de Grupo Cargo:</div>
            </td>
            <td nowrap>
                 <input type="text" name="E02DDGCDE" readonly size="4" maxlength="3" value="<%=Group.getE02DDGCDE().trim()%>">
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
            <td nowrap width="20%"> 
              <div align="right">Descripcion Grupo Cargo :</div>
            </td>
            <td nowrap colspan="3" >
              <div align="left"> 
                <input type="text" name="E02DDGDSC" size="65" maxlength="60" value="<%=Group.getE02DDGDSC()%>" readonly>
              </div>
            </td>
          </tr>

          <tr id="<%=(row % 2 == 1) ? "trclear" : "trdark"%><%row++;%>"> 
            <td nowrap width="20%"> 
              <div align="right">Cliente :</div>
            </td>
			<td nowrap width="30%">
			   <input type="text" name="E02DDGCUN" size="13" maxlength="12" value="<%=Group.getE02DDGCUN().trim()%>">
                <a href="javascript:GetCustomerDescId('E02DDGCUN','','')">
                <img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="bottom" border="0" ></a>
              <input type="text" name="E02CUSNA1" size="46" maxlength="45" readonly value="<%=Group.getE02CUSNA1().trim()%>" readonly>
			</td>
            <td nowrap width="20%"> 
              <div align="right">Estado Relación :</div>
            </td>
            <td nowrap width="30%" >
               	     <select name="E02DDGSTS" >
				           <option value=" " <% if (!(Group.getE02DDGSTS().equals("A") ||Group.getE02DDGSTS().equals("I")||Group.getE02DDGSTS().equals("C"))) 
				           out.print("selected"); %>>
				           </option>
                           <option value="A" <%if (Group.getE02DDGSTS().equals("A")) out.print("selected"); %>>Activa</option>
                           <option value="I" <%if (Group.getE02DDGSTS().equals("I")) out.print("selected"); %>>Inactiva</option>
                           <option value="C" <%if (Group.getE02DDGSTS().equals("C")) out.print("selected"); %>>Cerrada</option>
                       </select>
			</td>
          </tr>

          <tr id="<%=(row % 2 == 1) ? "trclear" : "trdark"%><%row++;%>"> 
            <td nowrap width="20%"> 
              <div align="right">Periodo en Días sin Nómina :</div>
            </td>
			<td width="30%">
              <input type="text" name="E02DDGPSN" size="3" maxlength="2" value="<%=Group.getE02DDGPSN()%>" onKeypress="enterInteger(event)">
			</td>
            <td nowrap width="20%"> 
              <div align="right">
                Cuenta de Ahorros/Corriente :
              </div>
            </td>
            <td nowrap width="30%" >
              <input type="text" name="E02DDGACC" size="13" maxlength="12" value="<%=Group.getE02DDGACC().trim()%>">
			  <a href="javascript:GetAccountCustomer('E02DDGACC',document.forms[0].E02DDGBNK.value,'RT',document.forms[0].E02DDGCUN.value,'N')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" border="0" ></a>
            </td>

          </tr>



          <tr id="<%=(row % 2 == 1) ? "trclear" : "trdark"%><%row++;%>"> 
            <td nowrap width="20%"> 
              <div align="right">Porcentaje de Absorción Empresa :</div>
            </td>
			<td width="30%">
			    <input type="text" name="E02DDGABS" size="7" maxlength="6" value="<%=Group.getE02DDGABS()%>" onKeypress="enterDecimal(event, 3)">
			</td>

            <td nowrap width="20%"> 
              <div align="right"> </div>
            </td>
            <td nowrap width="30%" >
              <div align="right"> </div>
			</td>

          </tr>


        </table>
      </td>
    </tr>
  </table>



  <h4>Transacciones Nomina</h4>
  <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" align="left" >
          <tr id="<%=(row % 2 == 1) ? "trclear" : "trdark"%><%row++;%>"> 
            <td nowrap width="20%"> 
              <div align="center">
                <input type="text" name="E02DDGTN1" size="3" maxlength="2" value="<%=Group.getE02DDGTN1().trim()%>">
			    <a href="javascript:GetCodeCNOFC('E02DDGTN1','20')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" border="0"></a>
              </div>
            </td>
            <td nowrap width="20%"> 
              <div align="center">
                <input type="text" name="E02DDGTN2" size="3" maxlength="2" value="<%=Group.getE02DDGTN2().trim()%>">
			    <a href="javascript:GetCodeCNOFC('E02DDGTN2','20')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" border="0"></a>
              </div>
            </td>
            <td nowrap width="20%"> 
              <div align="center">
                <input type="text" name="E02DDGTN3" size="3" maxlength="2" value="<%=Group.getE02DDGTN3().trim()%>">
                 <a href="javascript:GetCodeCNOFC('E02DDGTN3','20')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" border="0"></a>
              </div>
            </td>
            <td nowrap width="20%"> 
              <div align="center">
                <input type="text" name="E02DDGTN4" size="3" maxlength="2" value="<%=Group.getE02DDGTN4().trim()%>">
                 <a href="javascript:GetCodeCNOFC('E02DDGTN4','20')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" border="0"></a>
              </div>
            </td>
            <td nowrap width="20%"> 
              <div align="center">
                <input type="text" name="E02DDGTN5" size="3" maxlength="2" value="<%=Group.getE02DDGTN5().trim()%>">
                 <a href="javascript:GetCodeCNOFC('E02DDGTN5','20')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" border="0"></a>
              </div>
            </td>
         </tr>

          <tr id="<%=(row % 2 == 1) ? "trclear" : "trdark"%><%row++;%>"> 
            <td nowrap width="20%"> 
              <div align="center">
                <input type="text" name="E02DDGTN6" size="3" maxlength="2" value="<%=Group.getE02DDGTN6().trim()%>">
                 <a href="javascript:GetCodeCNOFC('E02DDGTN6','20')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" border="0"></a>
              </div>
            </td>
            <td nowrap width="20%"> 
              <div align="center">
                <input type="text" name="E02DDGTN7" size="3" maxlength="2" value="<%=Group.getE02DDGTN7().trim()%>">
                 <a href="javascript:GetCodeCNOFC('E02DDGTN7','20')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" border="0"></a>
              </div>
            </td>
            <td nowrap width="20%"> 
              <div align="center">
                <input type="text" name="E02DDGTN8" size="3" maxlength="2" value="<%=Group.getE02DDGTN8().trim()%>">
                 <a href="javascript:GetCodeCNOFC('E02DDGTN8','20')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" border="0"></a>
              </div>
            </td>
            <td nowrap width="20%"> 
              <div align="center">
                <input type="text" name="E02DDGTN9" size="3" maxlength="2" value="<%=Group.getE02DDGTN9().trim()%>">
                 <a href="javascript:GetCodeCNOFC('E02DDGTN9','20')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" border="0"></a>
              </div>
            </td>
            <td nowrap width="20%"> 
              <div align="center">
                <input type="text" name="E02DDGTN0" size="3" maxlength="2" value="<%=Group.getE02DDGTN0().trim()%>">
                 <a href="javascript:GetCodeCNOFC('E02DDGTN0','20')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" border="0"></a>
              </div>
            </td>
         </tr>

        
        </table>
      </td>
    </tr>
  </table>
  
  <p>
  <div align="center"> 
    <input id="EIBSBTN" type=submit name="Submit" value="Enviar"  onClick="javascript:CheckAcc(203)">
  </div>
</form>
</body>
</html>
