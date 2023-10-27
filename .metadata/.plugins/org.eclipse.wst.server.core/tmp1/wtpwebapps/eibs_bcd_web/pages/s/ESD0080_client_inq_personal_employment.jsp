<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"> 
<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@ page import = "datapro.eibs.master.Util" %>
<%@page import="com.datapro.constants.EibsFields"%>
<%@page import="com.datapro.eibs.constants.HelpTypes"%>

<html>
<head>
<title>Datos de Empleo</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Studio">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>
 
<jsp:useBean id= "employment" class= "datapro.eibs.beans.ESD008006Message"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>

<SCRIPT type="text/javascript">

  builtNewMenu(client_inq_personal_opt);
  initMenu();
</SCRIPT>

</head>




<body>


<h3 align="center">Datos del Empleo <img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="client_inq_personal_employment, ESD0080"></h3>
<hr size="4">
 <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSESD0080" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" id="SCREEN" VALUE="6">
<% int row = 1; %>
<table class="tableinfo">
  <tr > 
    <td nowrap> 
      <table cellspacing="0" cellpadding="2" width="100%" class="tbhead">
        <tr>
          <td nowrap align="right"> Cliente :</td>
          <td nowrap align="left"><%= userPO.getHeader1()%></td>
          <td nowrap align="right"> ID. :</td>
          <td nowrap align="left"><%= userPO.getHeader2()%></td>
          <td nowrap align="right"> Nombre :</td>
          <td nowrap align="left"><%= userPO.getHeader3()%></td>
        </tr>
      </table>
    </td>
  </tr>
</table>
  <h4>Datos Financieros</h4>
  <table class="tableinfo" >
    <tr > 
      <td nowrap > 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" align="center">
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap > 
              <div align="right">Frecuencia de Ingresos:</div>
            </td>
            <td nowrap colspan="4">
              <INPUT type="text" name="E06SAT" size="12" maxlength="5"
              	value="<% if (employment.getE06SAT().trim().equals("W")) out.print("Semanal"); 
               		else if (employment.getE06SAT().trim().equals("B")) out.print("Quincenal");
               		else if (employment.getE06SAT().trim().equals("M")) out.print("Mensual");
               		else if (employment.getE06SAT().trim().equals("S")) out.print("Semestral");
               		else if (employment.getE06SAT().trim().equals("Y")) out.print("Anual"); 
               		else out.print(""); %>">
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="25%"> 
              <div align="right">Ingresos :</div>
            </td>
            <td nowrap width="21%">
				<eibsinput:text name="employment" property="E06CAI" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/>
            </td>
            <td nowrap > 
              <div align="right">Egresos :</div>
            </td>
            <td nowrap>
            	<eibsinput:text name="employment" property="E06EOX" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/>
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap > 
              <div align="right">Otros Ingresos :</div>
            </td>
            <td nowrap >
				<eibsinput:text name="employment" property="E06CAS" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/>
				<%= employment.getD06ORI().trim()%>
            </td>
            <td nowrap > 
              <div align="right">Otros Egresos :</div>
            </td>
            <td nowrap>
				<eibsinput:text name="employment" property="E06AM4" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/>
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap colspan="2">
			 </td>
            <td nowrap > 
              <div align="right">Egreso en Educación :</div>
            </td>
            <td nowrap >
				<eibsinput:text name="employment" property="E06AM3" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/>
			</td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap > 
              <div align="right">Patrimonio Neto :</div>
            </td>
            <td nowrap >
            	<eibsinput:text name="employment" property="E06CAP" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/>
            </td>
            <td nowrap > 
              <div align="right">Arriendo :</div>
            </td>
            <td nowrap >
				<eibsinput:text name="employment" property="E06AM2" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/>
            </td>
          </tr>      
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
         	<td nowrap > 
              <div align="right">Fecha Patrimonio :</div>
            </td>
            <td nowrap >
             <INPUT type="text" name="E06DP1" size="3" maxlength="2" value="<%= employment.getE06DP1().trim()%>"  class="txtright">
             <INPUT type="text" name="E06DP2" size="3" maxlength="2" value="<%= employment.getE06DP2().trim()%>"  class="txtright">
             <INPUT type="text" name="E06DP3" size="5" maxlength="4" value="<%= employment.getE06DP3().trim()%>"  class="txtright">
            </td>
            <td nowrap > 
              <div align="right">Tipo de Renta :</div>
            </td>
            <td nowrap >
              <INPUT type="text" name="E06TYR" size="12" maxlength="5"
              	value="<% if (employment.getE06TYR().trim().equals("1")) out.print("Fija"); 
               		else if (employment.getE06TYR().trim().equals("2")) out.print("Variable"); 
               		else out.print(""); %>">
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
<h4>Datos de Empleo</h4>
<table class="tableinfo" >
    <tr > 
      <td nowrap >
        <table cellspacing="0" cellpadding="2" width="100%" border="0" align="center">
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap > 
              <div align="right">Nombre Empresa :</div>
            </td>
            <td nowrap> 
              <input type="text" name="E06CP1" size="50" maxlength="45" value="<%= employment.getE06CP1().trim()%>">
            </td>
            <td nowrap> 
              <div align="right">Salario Actual :</div>
            </td>
            <td nowrap> 
              <input type="text" name="E06AMT" size="16" maxlength="15" value="<%= employment.getE06AMT().trim()%>"  class="txtright">
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap > 
              <div align="right">Direcci&oacute;n :</div>
            </td>
            <td nowrap> 
              <input type="text" name="E06CP2" size="50"  maxlength="45" value="<%= employment.getE06CP2().trim()%>">
            </td>
            <td nowrap > 
              <div align="right">Día de Pago en el Mes :</div>
            </td>
            <td nowrap >
             <INPUT type="text" name="E06MPA" size="2" maxlength="2" value="<%= employment.getE06MPA().trim()%>"  >
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap > 
              <div align="right"></div>
            </td>
            <td nowrap> 
              <input type="text" name="E06CP3" size="50"  maxlength="45" value="<%= employment.getE06CP3().trim()%>">
            </td>
            <td nowrap>
              <div align="right">Fecha Eval. Salario :</div>
            </td>
            <td nowrap>
             <INPUT type="text" name="E06LSM" size="3" maxlength="2" value="<%= employment.getE06LSM().trim()%>"  class="txtright">
             <INPUT type="text" name="E06LSD" size="3" maxlength="2" value="<%= employment.getE06LSD().trim()%>"  class="txtright">
             <INPUT type="text" name="E06LSY" size="5" maxlength="4" value="<%= employment.getE06LSY().trim()%>"  class="txtright"> 
             </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap > 
              <div align="right">Tipo de Empresa :</div>
            </td>
            <td nowrap > 
              <input type="text" name="E06EPT" size="55" value="<%= employment.getD06EPT().trim()%>">
              </td>
            <td nowrap > 
              <div align="right">ID. Empresa :</div>
            </td>
            <td nowrap > 
              <input type="text" name="E06RUC" size="28" maxlength="25" value="<%= employment.getE06RUC().trim()%>">
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap > 
              <div align="right">Tipo de Negocio : </div>
            </td>
            <td nowrap > 
              <input type="text" name="E06UC5" value="<%= employment.getD06UC5().trim()%>" size="55">
            </td>
            <td nowrap>  
              <div align="right">Tiempo de Empleo(Años) :</div>
            </td>
            <td nowrap > 
              <input type="text" name="E06TIM" size="6" maxlength="2" value="<%= employment.getE06TIM().trim()%>">
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap > 
              <div align="right">Cargo :</div>
            </td>
            <td nowrap > 
              <input type="text" name="E06FC3" size="55" value="<%= employment.getD06FC3().trim()%>">
            </td>
            <td nowrap > 
              <div align="right">Fecha Ingreso Empleo Acual :</div>
            </td>
            <td nowrap >
             <input type="text" name="E06SWM" size="3" maxlength="2" value="<%= employment.getE06SWM().trim()%>" class="txtright">
             <input type="text" name="E06SWD" size="3" maxlength="2" value="<%= employment.getE06SWD().trim()%>" class="txtright">
             <input type="text" name="E06SWY" size="5" maxlength="4" value="<%= employment.getE06SWY().trim()%>" class="txtright">             
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
      		<td nowrap> 
              <div align="right">Tipo de Contrato :</div>
            </td>
            <td nowrap >
              <INPUT type="text" name="E06NEM" size="12" maxlength="5" value="<% if (employment.getE06NEM().trim().equals("1")) out.print("Fijo"); 
               else if (employment.getE06NEM().trim().equals("2")) out.print("Indefinido"); 
               else if (employment.getE06NEM().trim().equals("3")) out.print("Temporal"); %>">
            </td>
            <td nowrap > 
              <div align="right">Fecha Ingreso Empleo Anterior :</div>
            </td>
            <td nowrap> 
             <input type="text" name="E06IA1" size="3" maxlength="2" value="<%= employment.getE06IA1().trim()%>"  class="txtright">
             <input type="text" name="E06IA2" size="3" maxlength="2" value="<%= employment.getE06IA2().trim()%>"  class="txtright">
             <input type="text" name="E06IA3" size="5" maxlength="4" value="<%= employment.getE06IA3().trim()%>"  class="txtright">                          
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap colspan="2"> 
              <div align="right"></div>
            </td>
            <td nowrap > 
              <div align="right">Fecha Termino Empleo Anterior :</div>
            </td>
            <td nowrap > 
             <input type="text" name="E06FA1" size="3" maxlength="2" value="<%= employment.getE06FA1().trim()%>"  class="txtright">
             <input type="text" name="E06FA2" size="3" maxlength="2" value="<%= employment.getE06FA2().trim()%>"  class="txtright">
             <input type="text" name="E06FA3" size="5" maxlength="4" value="<%= employment.getE06FA3().trim()%>"  class="txtright">                          
            </td>
          </tr>
          
        </table>
      </td>
    </tr>
  </table>
    
  <br>
  <table class="tableinfo" >
    <tr > 
      <td nowrap > 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" align="center">
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap> 
              <div align="right">Número de Empleado :</div>
            </td>
            <td nowrap> 
              <input type="text" name="E06TOM" size="9" maxlength="8" value="<%= employment.getE06TOM().trim()%>">
            </td>
            <td nowrap>
              <div align="right">Número de Seguro Social :</div>
            </td>
            <td nowrap>
              <input type="text" name="E06NDO" size="13" maxlength="12" value="<%= employment.getE06NDO().trim()%>">
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap > 
              <div align="right">Identificación Contraloría :</div>
            </td>
            <td nowrap >
              <input type="text" name="E06CD3" size="5" maxlength="4" value="<%= employment.getE06CD3().trim()%>">
              <input type="text" name="E06CD4" size="5" maxlength="4" value="<%= employment.getE06CD4().trim()%>">
              <input type="text" name="E06F01" size="6" maxlength="5" value="<%= employment.getE06F01().trim()%>">
            </td>
            <td nowrap > 
              <div align="right"> </div>
            </td>
            <td nowrap >
              <div align="right"> </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  
  
  
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
</form>
</body>
</html>
