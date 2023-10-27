<html>
7<head>
<title>Parametros Extractos Cuentas</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@ page import = "datapro.eibs.master.Util" %>
<%@ page import="com.datapro.constants.EibsFields"%>
<%@ page import = "java.io.*,java.net.*,datapro.eibs.beans.*,datapro.eibs.master.*,java.math.*" %>


<jsp:useBean id= "rtExtrac" class= "datapro.eibs.beans.ESD006002Message"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>

<SCRIPT type="text/javascript">

function showhidediv(){
	
	if(getElement("si").checked){
		getElement('infoTable').style.display = 'block';
	} else {
		getElement('infoTable').style.display = 'none';
	}
}


function goAction() {
    document.forms[0].EIBSBTN.disabled = true;
	document.forms[0].submit();
}

</SCRIPT>

</head>

<body onload="showhidediv(); ">
<% 
if ( !error.getERRNUM().equals("0")  ) {
     out.println("<SCRIPT Language=\"Javascript\">");
     error.setERRNUM("0");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
}
out.println("<SCRIPT> initMenu(); </SCRIPT>");
   
Boolean isReadOnly = false;
String disabled = "";
String read = "";
   
if (!(userPO.getPurpose().equals("NEW"))) { 
	read = " readonly ";
	disabled = " disabled";
	isReadOnly = true;
}

%> 
<h3 align="center">Parámetros Extractos Cuentas


<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="rt_bank_statements_2.jsp, ESD0060"></h3>
<hr size="4">
 <FORM METHOD="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.params.JSESD0031" >
  <p>
    <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="503">
  </p>
<%int row = 0; %>
<table  class="tableinfo">
   <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
         <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
            <tr id="trdark"> 
               <td nowrap width="10%" > 
                  <div align="right"><b>Cliente :</b></div>
               </td>
               <td nowrap width="30%"> 
                  <div align="left">
                     <input type="text" name="E02ACMCUN" size="9" maxlength="9" readonly value="<%= rtExtrac.getE02ACMCUN().trim()%>">
                  </div>
               </td>
               <td nowrap width="10%"> 
                  <div align="left">
                  </div>
               </td>
               <td nowrap width="10%"> 
                  <div align="left">
                  </div>
               </td>
               <td nowrap width="10%" > 
                  <div align="right"><b>Nombre :</b></div>
               </td>
               <td nowrap width="30%"> 
                  <div align="left">
                     <font face="Arial">
                        <font size="2">
                           <input type="text" name="D02CUSNA1" size="45" maxlength="45" readonly value="<%= rtExtrac.getD02CUSNA1().trim()%>">
                        </font>
                     </font>
                  </div>
               </td>
            </tr>
            <tr id="trdark"> 
               <td nowrap width="15%"> 
                  <div align="right"><b>Cuenta :</b></div>
               </td>
               <td nowrap width="25%"> 
                  <div align="left">
                     <input type="text" name="E02DDSACC" size="12" maxlength="12" readonly value="<%= rtExtrac.getE02DDSACC().trim()%>">
                  </div>
               </td>
               <td nowrap width="10%"> 
                  <div align="right"><b>Moneda : </b></div>
               </td>
               <td nowrap width="10%"> 
                  <div align="left">
                     <b><input type="text" name="E02ACMCCY" size="3" maxlength="3" readonly value="<%= rtExtrac.getE02ACMCCY().trim()%>"></b>
                  </div>
               </td>
               <td nowrap width="15%"> 
                  <div align="right"><b>Producto : </b></div>
               </td>
               <td nowrap width="25%"> 
                  <div align="left"><b><input type="text" name="E02ACMPRO" size="4" maxlength="4" readonly value="<%= rtExtrac.getE02ACMPRO().trim()%>"></b>
                  </div>
               </td>
            </tr>
         </table>
      </td>
   </tr>
</table>

<H4>Datos Generales</H4>
      <table  class="tableinfo">
         <tr bordercolor="#FFFFFF"> 
            <td nowrap> 
               <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
	           <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
                     <td nowrap width="20%"> 
                        <div align="right">Tipos de Extracto :</div>
                     </td>
                     <td nowrap width="30%"> 
                        <input type="text" name="E02DDSTYP" size="4" <%=read%> maxlength="5" value="<%= rtExtrac.getE02DDSTYP().trim()%>"> 
                        <% if (userPO.getPurpose().equals("NEW")){%>
                           <a href="javascript:GetStmDef('E02DDSTYP',' ','R')"><img src="<%=request.getContextPath()%>/images/1b.gif" title=". . ." align="bottom" border="0"></a>
                           <img src="<%=request.getContextPath()%>/images/Check.gif" title="campo obligatorio" border="0" >                         
                        <%}%>
                     </td>
                    <td nowrap width="20%"> 
                       <div align="right">Estado :</div>
                    </td>
                    <td nowrap width="30%">
                       <input type="radio" name="E02DDSSTS" value="A" <%if (rtExtrac.getE02DDSSTS().equals("A")) out.print("checked"); %>> Activo 	
                       <input type="radio" name="E02DDSSTS" value="I" <%if (rtExtrac.getE02DDSSTS().equals("I")) out.print("checked"); %>> Inactivo
                   </td>
                  </tr> 
            
	           <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
                    <td nowrap width="20%"> 
                        <div align="right">Frecuencia 1:</div>
                    </td>
                    <td nowrap width="30%">
                       <select name="E02DDSFRQ" >
			              <option value=" " <% if (!(rtExtrac.getE02DDSFRQ().equals("D") || rtExtrac.getE02DDSFRQ().equals("W") || 
			                                         rtExtrac.getE02DDSFRQ().equals("B") || rtExtrac.getE02DDSFRQ().equals("M") ||
			                                         rtExtrac.getE02DDSFRQ().equals("Y")))out.print("selected"); %>>
			              </option>
			              <option value="D" <%if (rtExtrac.getE02DDSFRQ().equals("D")) out.print("selected"); %>>Diario</option>
			              <option value="W" <%if (rtExtrac.getE02DDSFRQ().equals("W")) out.print("selected"); %>>Semanal</option>
			              <option value="B" <%if (rtExtrac.getE02DDSFRQ().equals("B")) out.print("selected"); %>>Quincenal</option>
			              <option value="M" <%if (rtExtrac.getE02DDSFRQ().equals("M")) out.print("selected"); %>>Mensual</option>
			              <option value="Y" <%if (rtExtrac.getE02DDSFRQ().equals("Y")) out.print("selected"); %>>Anual</option>
                       </select>
                       Ciclo/Día:
			              <input type="text" name="E02DDSSDY" size="3" maxlength="2" value="<%= rtExtrac.getE02DDSSDY().trim()%>">
			              <a href="javascript:GetCode('E02DDSSDY','STATIC_statement_cycle.jsp')"><img src="${pageContext.request.contextPath}/images/1b.gif" title="Ayuda" border="0" ></a>	              
                       Mes:
			              <input type="text" name="E02DDSSMY" size="3" maxlength="2" value="<%= rtExtrac.getE02DDSSMY().trim()%>">
                    </td>            
                    <td nowrap width="20%"> 
                       <div align="right">Frecuencia 2:</div>
                    </td>
                    <td nowrap width="30%">
                       <select name="E02DDSFR2" >
			              <option value=" " <% if (!(rtExtrac.getE02DDSFR2().equals("D") || rtExtrac.getE02DDSFR2().equals("W") || 
			                                         rtExtrac.getE02DDSFR2().equals("B") || rtExtrac.getE02DDSFR2().equals("M") ||
			                                         rtExtrac.getE02DDSFR2().equals("Y")))out.print("selected"); %>>
			              </option>
			              <option value="D" <%if (rtExtrac.getE02DDSFR2().equals("D")) out.print("selected"); %>>Diario</option>
			              <option value="W" <%if (rtExtrac.getE02DDSFR2().equals("W")) out.print("selected"); %>>Semanal</option>
			              <option value="B" <%if (rtExtrac.getE02DDSFR2().equals("B")) out.print("selected"); %>>Quincenal</option>
			              <option value="M" <%if (rtExtrac.getE02DDSFR2().equals("M")) out.print("selected"); %>>Mensual</option>
			              <option value="Y" <%if (rtExtrac.getE02DDSFR2().equals("Y")) out.print("selected"); %>>Anual</option>
                       </select>
                       Ciclo/Día:
                          <input type="text" name="E02DDSSD2" size="3" maxlength="2" value="<%= rtExtrac.getE02DDSSD2().trim()%>">
                          <a href="javascript:GetCode('E02DDSSD2','STATIC_statement_cycle.jsp')"><img src="${pageContext.request.contextPath}/images/1b.gif" title="Ayuda" border="0" ></a>	              
                       Mes:
                          <input type="text" name="E02DDSSM2" size="3" maxlength="2" value="<%= rtExtrac.getE02DDSSM2().trim()%>">
                    </td>
                  </tr>     
            
	           <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
                    <td nowrap width="20%"> 
                       <div align="right">Consolidacion :</div>
                    </td>
                    <td nowrap width="30%">
                       <input type="radio" name="E02DDSCON" value="Y" <%if (rtExtrac.getE02DDSCON().equals("Y")) out.print("checked"); %>> Si	
                       <input type="radio" name="E02DDSCON" value="N" <%if (rtExtrac.getE02DDSCON().equals("N")) out.print("checked"); %>> No
                    </td>
                    <td nowrap width="20%"> 
                       <div align="right">Comisiones :</div>
                    </td>
                    <td nowrap width="30%">
                       <input type="text" name="E02DDSCDE" size="4" maxlength="5" value="<%=rtExtrac.getE02DDSCDE().trim()%>" readonly>
                       <a href="javascript:GetCommDef('E02DDSCDE','D02DDSCDE')"><img src="<%=request.getContextPath()%>/images/1b.gif" align="bottom" border="0"></a>
                       <input type="text" name="D02DDSCDE" readonly size="60" maxlength="60" value="<%=rtExtrac.getD02DDSCDE().trim()%>">                    
                    </td>                    
                  </tr>


	           <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
                    <td nowrap width="20%"> 
                       <div align="right">Personalizacion Campo 86 :</div>
                    </td>
                    <td nowrap width="30%">
                       <input type="radio" name="E02DDSF86" id="si" onclick="showhidediv();" value="Y" <%if (rtExtrac.getE02DDSF86().equals("Y")) out.print("checked"); %>> Si 	
                       <input type="radio" name="E02DDSF86" id="no" onclick="showhidediv();" value="N" <%if (rtExtrac.getE02DDSF86().equals("N")) out.print("checked"); %>> No
                    </td>                    
                    <td nowrap width="20%"> 
                       <div align="right">Formato de Envio :</div>
                    </td>
                    <td nowrap width="30%">
                       <input type="radio" name="E02DDSFME" value="F" <%if (rtExtrac.getE02DDSFME().equals("F")) out.print("checked"); %>> Fin 	
                       <input type="radio" name="E02DDSFME" value="A" <%if (rtExtrac.getE02DDSFME().equals("A")) out.print("checked"); %>> FileAct
                    </td>
                  </tr>
            
<!--	           <tr > -->
<!--                    <td nowrap width="20%"> -->
<!--                       <div align="right">Incluye Transacciones Fecha Valor :</div>-->
<!--                    </td>-->
<!--                    <td nowrap width="30%">-->
<!--                       <input type="radio" name="E02DDSCHR" value="Y" <%if (rtExtrac.getE02DDSCHR().equals("Y")) out.print("checked"); %>> Si	-->
<!--                       <input type="radio" name="E02DDSCHR" value="N" <%if (!rtExtrac.getE02DDSCHR().equals("Y")) out.print("checked"); %>> No-->
<!--                    </td>-->
<!--                    <td nowrap width="20%"> -->
<!--                       <div align="right"> </div>-->
<!--                    </td>-->
<!--                    <td nowrap width="30%">-->
<!--                       <div align="right"> </div>-->
<!--                    </td>                    -->
<!--                  </tr>-->



               </table>
            </td>
         </tr> 
      </table>



<div id="infoTable" style="border: 0px; display: none;">
<H4>Personalizacion de Envio</H4>
      <table  class="tableinfo">
         <tr bordercolor="#FFFFFF"> 
            <td nowrap> 
               <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">

	           <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
                    <td nowrap width="20%"> 
                       <div align="right">Linea 1:</div>
                    </td>
                    <td nowrap width="80%">
                       <input type="text" name="E02DDSKW1" size="65" maxlength="65"  value="<%= rtExtrac.getE02DDSKW1().trim()%>">
                    </td>
                  </tr>

	           <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
                    <td nowrap width="20%"> 
                       <div align="right">Linea 2:</div>
                    </td>
                    <td nowrap width="80%">
                       <input type="text" name="E02DDSKW2" size="65" maxlength="65"  value="<%= rtExtrac.getE02DDSKW2().trim()%>">
                    </td>
                  </tr>

	           <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
                    <td nowrap width="20%"> 
                       <div align="right">Linea 3:</div>
                    </td>
                    <td nowrap width="80%">
                       <input type="text" name="E02DDSKW3" size="65" maxlength="65"  value="<%= rtExtrac.getE02DDSKW3().trim()%>">
                    </td>
                  </tr>

	           <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
                    <td nowrap width="20%"> 
                       <div align="right">Linea 4:</div>
                    </td>
                    <td nowrap width="80%">
                       <input type="text" name="E02DDSKW4" size="65" maxlength="65"  value="<%= rtExtrac.getE02DDSKW4().trim()%>">
                    </td>
                  </tr>

	           <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
                    <td nowrap width="20%"> 
                       <div align="right">Linea 5:</div>
                    </td>
                    <td nowrap width="80%">
                       <input type="text" name="E02DDSKW5" size="65" maxlength="65"  value="<%= rtExtrac.getE02DDSKW5().trim()%>">
                    </td>
                  </tr>

	           <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
                    <td nowrap width="20%"> 
                       <div align="right">Linea 6:</div>
                    </td>
                    <td nowrap width="80%">
                       <input type="text" name="E02DDSKW6" size="65" maxlength="65"  value="<%= rtExtrac.getE02DDSKW6().trim()%>">
                    </td>
                  </tr>
               </table>
            </td>
         </tr> 
      </table>
</div>



<H4>Datos de Envio</H4>
      <table  class="tableinfo">
         <tr bordercolor="#FFFFFF"> 
            <td nowrap> 
               <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">

	           <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
                    <td nowrap width="20%"> 
                       <div align="right">Uso de domicilio 1:</div>
                    </td>
                    <td nowrap width="30%">
                       <select name="E02DDSENV" >
			              <option value=" " <% if (!(rtExtrac.getE02DDSENV().equals("C") || rtExtrac.getE02DDSENV().equals("I") ||
			                                         rtExtrac.getE02DDSENV().equals("S") ||
			                                         rtExtrac.getE02DDSENV().equals("R") ))out.print("selected"); %>>
			              </option>
			              <option value="C" <%if (rtExtrac.getE02DDSENV().equals("C")) out.print("selected"); %>>Correo Electronico</option>
			              <option value="R" <%if (rtExtrac.getE02DDSENV().equals("R")) out.print("selected"); %>>Dirección Fisica</option>
			              <option value="I" <%if (rtExtrac.getE02DDSENV().equals("I")) out.print("selected"); %>>Internet(Portal)</option>
			              <option value="S" <%if (rtExtrac.getE02DDSENV().equals("S")) out.print("selected"); %>>Swift</option>
                       </select>
                           <input type="text" name="E02DDSMLA" size="3" maxlength="2" value="<%= rtExtrac.getE02DDSMLA().trim()%>">
                           <a href="javascript:GetMailing('E02DDSMLA',document.forms[0].E02ACMCUN.value,document.forms[0].E02DDSENV.value)">
                           <img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="middle" border="0"></a> 
                   </td>
                    <td nowrap width="20%"> 
                       <div align="right"></div>
                    </td>
                    <td nowrap width="30%">
                    </td>

                  </tr>

	           <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
                    <td nowrap width="20%"> 
                       <div align="right">Banco Corresponsal 1 Swift ID:</div>
                    </td>
                    <td nowrap width="30%">
                       <input type="text" name="E02DDSSW1" size="26" maxlength="25" value="<%= rtExtrac.getE02DDSSW1().trim() %>">
          			   <a href="javascript:GetSwiftId('E02DDSSW1')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="middle" border="0"></a> 
                       <input type="text" name="D02DDSSW1" size="80" maxlength="80" value="<%= rtExtrac.getD02DDSSW1().trim() %>" readonly>
                   </td>
                    <td nowrap width="20%"> 
                       <div align="right"></div>
                    </td>
                    <td nowrap width="30%">
                    </td>

                  </tr>

                  
	           <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
                    <td nowrap width="20%"> 
                       <div align="right">Uso de domicilio 2:</div>
                    </td>
                    <td nowrap width="30%">
                       <select name="E02DDSEN2" >
			              <option value=" " <% if (!(rtExtrac.getE02DDSEN2().equals("C") || rtExtrac.getE02DDSEN2().equals("I") ||
			                                         rtExtrac.getE02DDSEN2().equals("S") || rtExtrac.getE02DDSEN2().equals("O") ||
			                                         rtExtrac.getE02DDSEN2().equals("R") ))out.print("selected"); %>>
			              </option>
			              <option value="C" <%if (rtExtrac.getE02DDSEN2().equals("C")) out.print("selected"); %>>Correo Electronico</option>
			              <option value="O" <%if (rtExtrac.getE02DDSEN2().equals("O")) out.print("selected"); %>>Oficina</option>
			              <option value="R" <%if (rtExtrac.getE02DDSEN2().equals("R")) out.print("selected"); %>>Residencia</option>
			              <option value="I" <%if (rtExtrac.getE02DDSEN2().equals("I")) out.print("selected"); %>>Internet(Portal)</option>
			              <option value="S" <%if (rtExtrac.getE02DDSEN2().equals("S")) out.print("selected"); %>>Swift</option>
                       </select>
                           <input type="text" name="E02DDSML2" size="3" maxlength="2" value="<%= rtExtrac.getE02DDSML2().trim()%>">
                           <a href="javascript:GetMailing('E02DDSML2',document.forms[0].E02ACMCUN.value,document.forms[0].E02DDSEN2.value)">
                           <img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="middle" border="0"></a> 
                   </td>
                    <td nowrap width="20%"> 
                       <div align="right"></div>
                    </td>
                    <td nowrap width="30%">
                    </td>
                  </tr>


	           <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
                    <td nowrap width="20%"> 
                       <div align="right">Banco Corresponsal 2 Swift ID:</div>
                    </td>
                    <td nowrap width="30%">
                       <input type="text" name="E02DDSSW2" size="26" maxlength="25" value="<%= rtExtrac.getE02DDSSW2().trim() %>">
          			   <a href="javascript:GetSwiftId('E02DDSSW2')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="middle" border="0"></a> 
                       <input type="text" name="D02DDSSW2" size="80" maxlength="80" value="<%= rtExtrac.getD02DDSSW2().trim() %>" readonly>
                   </td>
                    <td nowrap width="20%"> 
                       <div align="right"></div>
                    </td>
                    <td nowrap width="30%">
                    </td>

                  </tr>

               </table>
            </td>
         </tr> 
      </table>


                       
  <br>
          <div align="center"> 
            <input id="EIBSBTN" type="button" name="Submit" onClick="goAction();" value="Enviar">
          </div>



</form>
</body>
</html>
