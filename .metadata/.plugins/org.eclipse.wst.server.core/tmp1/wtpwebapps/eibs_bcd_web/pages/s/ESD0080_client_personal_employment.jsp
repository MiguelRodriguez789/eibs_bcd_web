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
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />

<SCRIPT type="text/javascript">

builtNewMenu(client_personal_opt);

 function enterVerifCode() {
  if ((event.keyCode < 48 || event.keyCode > 57)  && event.keyCode != 13 && event.keyCode != 75 && event.keyCode != 107)
   event.returnValue = false; 
 }

function FillZeroLeft(idField){
	if(idField.value.trim() != ''){
	    while (idField.value.length < idField.maxLength )
	      idField.value='0'+idField.value;
	}
}

</SCRIPT>

</head>

<body>
 
 <% 
 if ( !error.getERRNUM().equals("0")  ) {
     error.setERRNUM("0");
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
 }
  if ( !userPO.getPurpose().equals("NEW") ) {
    out.println("<SCRIPT> initMenu(); </SCRIPT>");
 }
%>


<h3 align="center">Datos Financieros y/o de Empleo <img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="client_personal_employment, ESD0080"></h3>
<hr size="4">
 <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSESD0080" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="6">
  <INPUT TYPE=HIDDEN NAME="FechaNow" VALUE="<%= employment.getH06TIM().trim()%>">

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
              <div align="right">Frecuencia de Ingresos :</div>
            </td>
            <td nowrap colspan="5">
               <SELECT name="E06SAT">
                       <OPTION value="M" <% if (!(employment.getE06SAT().equals("W") 
                       	|| employment.getE06SAT().equals("M") 
                       	|| employment.getE06SAT().equals("S") 
                       	|| employment.getE06SAT().equals("Y")
                       	|| employment.getE06SAT().equals("B"))) out.print("selected");%>>Mensual</OPTION>
                       <OPTION value="W" <% if (employment.getE06SAT().equals("W")) out.print("selected"); %>>Semanal</OPTION>
					   <OPTION value="B" <% if (employment.getE06SAT().equals("B")) out.print("selected"); %>>Quincenal</OPTION>
                       <OPTION value="S" <% if (employment.getE06SAT().equals("S")) out.print("selected"); %>>Semestral</OPTION>
                       <OPTION value="Y" <% if (employment.getE06SAT().equals("Y")) out.print("selected"); %>>Anual</OPTION>
               </SELECT>
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="25%"> 
              <div align="right">Ingresos :</div>
            </td>
            <td nowrap width="21%" colspan="3">
                 <eibsinput:text name="employment" property="E06CAI" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/>
            </td>
            <td nowrap width="20%"> 
              <div align="right">Egresos :</div>
			</td>
            <td nowrap width="30%">
			  <eibsinput:text name="employment" property="E06EOX" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/>
            </td> 
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="25%"> 
              <div align="right">Otros Ingresos :</div>
            </td>
            <td nowrap width="10%">
                 <eibsinput:text name="employment" property="E06CAS" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" required="false" />
            </td>
            <td nowrap width="5%"> 
              <div align="right">Origen  :</div>
            </td>
            <td nowrap width="15%"> 
               <eibsinput:cnofc name="employment" flag="30" property="E06ORI" required="false"/>
            </td>
            <td nowrap > 
              <div align="right">Otros Egresos :</div>
            </td>
            <td nowrap>
                 <eibsinput:text name="employment" property="E06AM4" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" required="false" />
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap > 
            </td>
            <td nowrap colspan="3">
			 </td>
            <td nowrap width="25%"> 
              <div align="right">Egreso en Educaci�n :</div>
            </td>
            <td nowrap width="20%">
                 <eibsinput:text name="employment" property="E06AM3" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" required="false" />
			 </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap > 
              <div align="right">Patrimonio Neto :</div>
            </td>
            <td nowrap colspan="3">
                <eibsinput:text name="employment" property="E06CAP" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" required="false" />
			 </td>
            <td nowrap > 
              <div align="right">Arriendo :</div>
            </td>
            <td nowrap>
                 <eibsinput:text name="employment" property="E06AM2" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" required="false" />
            </td>  
          </tr> 
		<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap> 
              <div align="right">Fecha Patrimonio :</div>
            </td>
            <td nowrap  colspan="3">
             <INPUT type="text" name="E06DP1" size="3" maxlength="2" value="<%= employment.getE06DP1().trim()%>" onkeypress="enterInteger(event)" class="txtright">
             <INPUT type="text" name="E06DP2" size="3" maxlength="2" value="<%= employment.getE06DP2().trim()%>" onkeypress="enterInteger(event)" class="txtright">
             <INPUT type="text" name="E06DP3" size="5" maxlength="4" value="<%= employment.getE06DP3().trim()%>" onkeypress="enterInteger(event)" class="txtright">
            </td>
            <td nowrap > 
              <div align="right">Tipo de Renta :</div>
            </td>
            <td nowrap>
            			<SELECT name="E06TYR">
                            <OPTION value=" " <% if (!(employment.getE06TYR().equals("1") || employment.getE06TYR().equals("2")) ) out.print("selected");%>=""></OPTION>
                            <OPTION value="1" <% if (employment.getE06TYR().equals("1")) out.print("selected"); %>="">Fija</OPTION>
                            <OPTION value="2" <% if (employment.getE06TYR().equals("2")) out.print("selected"); %>="">Variable</OPTION>
                        </SELECT> 
            </td>
          </tr>          
        </table>
      </td>
    </tr>
  </table>
  <h4>Datos del Empleo</h4>
 <table class="tableinfo" >
    <tr > 
      <td>
        <table cellspacing="0" cellpadding="2" width="100%" border="0" align="center">
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap > 
              <div align="right">Nombre Empresa :</div>
            </td>
            <td nowrap> 
                <eibsinput:text name="employment" property="E06CP1" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_NAME %>" required="true"/>
            </td>
            <td nowrap> 
              <div align="right">Salario Actual :</div>
            </td>
            <td nowrap colspan="2"> 
                <eibsinput:text name="employment" property="E06AMT" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" required="true" />
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap > 
              <div align="right">Direcci&oacute;n :</div>
            </td>
            <td nowrap> 
                <eibsinput:text name="employment" property="E06CP2" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_NAME %>" />
            </td>
            <td nowrap > 
              <div align="right">D�a de Pago en el Mes :</div>
            </td>
            <td nowrap>
               <SELECT name="E06MPA">
                       <OPTION value="1" <% if (employment.getE06MPA().equals("1")) out.print("selected"); %>>1</OPTION>
                       <OPTION value="2" <% if (employment.getE06MPA().equals("2")) out.print("selected"); %>>2</OPTION>
                       <OPTION value="3" <% if (employment.getE06MPA().equals("3")) out.print("selected"); %>>3</OPTION>
                       <OPTION value="4" <% if (employment.getE06MPA().equals("4")) out.print("selected"); %>>4</OPTION>
                       <OPTION value="5" <% if (employment.getE06MPA().equals("5")) out.print("selected"); %>>5</OPTION>
                       <OPTION value="6" <% if (employment.getE06MPA().equals("6")) out.print("selected"); %>>6</OPTION>
                       <OPTION value="7" <% if (employment.getE06MPA().equals("7")) out.print("selected"); %>>7</OPTION>
                       <OPTION value="8" <% if (employment.getE06MPA().equals("8")) out.print("selected"); %>>8</OPTION>
                       <OPTION value="9" <% if (employment.getE06MPA().equals("9")) out.print("selected"); %>>9</OPTION>
                       <OPTION value="10" <% if (employment.getE06MPA().equals("10")) out.print("selected"); %>>10</OPTION>
                       <OPTION value="11" <% if (employment.getE06MPA().equals("11")) out.print("selected"); %>>11</OPTION>
                       <OPTION value="12" <% if (employment.getE06MPA().equals("12")) out.print("selected"); %>>12</OPTION>
                       <OPTION value="13" <% if (employment.getE06MPA().equals("13")) out.print("selected"); %>>13</OPTION>
                       <OPTION value="14" <% if (employment.getE06MPA().equals("14")) out.print("selected"); %>>14</OPTION>
                       <OPTION value="15" <% if (employment.getE06MPA().equals("15")) out.print("selected"); %>>15</OPTION>
                       <OPTION value="16" <% if (employment.getE06MPA().equals("16")) out.print("selected"); %>>16</OPTION>
                       <OPTION value="17" <% if (employment.getE06MPA().equals("17")) out.print("selected"); %>>17</OPTION>
                       <OPTION value="18" <% if (employment.getE06MPA().equals("18")) out.print("selected"); %>>18</OPTION>
                       <OPTION value="19" <% if (employment.getE06MPA().equals("19")) out.print("selected"); %>>19</OPTION>
                       <OPTION value="20" <% if (employment.getE06MPA().equals("20")) out.print("selected"); %>>20</OPTION>
                       <OPTION value="21" <% if (employment.getE06MPA().equals("21")) out.print("selected"); %>>21</OPTION>
                       <OPTION value="22" <% if (employment.getE06MPA().equals("22")) out.print("selected"); %>>22</OPTION>
                       <OPTION value="23" <% if (employment.getE06MPA().equals("23")) out.print("selected"); %>>23</OPTION>
                       <OPTION value="24" <% if (employment.getE06MPA().equals("24")) out.print("selected"); %>>24</OPTION>
                       <OPTION value="25" <% if (employment.getE06MPA().equals("25")) out.print("selected"); %>>25</OPTION>
                       <OPTION value="26" <% if (employment.getE06MPA().equals("26")) out.print("selected"); %>>26</OPTION>
                       <OPTION value="27" <% if (employment.getE06MPA().equals("27")) out.print("selected"); %>>27</OPTION>
                       <OPTION value="28" <% if (employment.getE06MPA().equals("28")) out.print("selected"); %>>28</OPTION>
                       <OPTION value="29" <% if (employment.getE06MPA().equals("29")) out.print("selected"); %>>29</OPTION>
                       <OPTION value="30" <% if (employment.getE06MPA().equals("30")) out.print("selected"); %>>30</OPTION>
                       <OPTION value="31" <% if (employment.getE06MPA().equals("31")) out.print("selected"); %>>31</OPTION>
               </SELECT> 
	            <!--<INPUT type="text" name="E06MPA" size="2" maxlength="2" value="<%= employment.getE06MPA().trim()%>" onkeypress="enterInteger(event)">-->
            
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap > 
              <div align="right"></div>
            </td>
            <td nowrap> 
                <eibsinput:text name="employment" property="E06CP3" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_NAME %>" />
            </td>
            <td nowrap>
              <div align="right">Fecha Eval. Salario :</div>
            </td> 
            <td nowrap colspan="2">
             <INPUT type="text" name="E06LSM" size="3" maxlength="2" value="<%= employment.getE06LSM().trim()%>" onkeypress="enterInteger(event)" class="txtright">
             <INPUT type="text" name="E06LSD" size="3" maxlength="2" value="<%= employment.getE06LSD().trim()%>" onkeypress="enterInteger(event)" class="txtright">
             <INPUT type="text" name="E06LSY" size="5" maxlength="4" value="<%= employment.getE06LSY().trim()%>" onkeypress="enterInteger(event)" class="txtright">
             </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap > 
              <div align="right">Tipo Empresa :</div>
            </td>
            <td nowrap > 
               <eibsinput:cnofc name="employment" flag="46" property="E06EPT"  required="false"/>
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
               <eibsinput:cnofc name="employment" flag="12" property="E06UC5"  required="false"/>
            </td>
            <td nowrap>  
              <div align="right">Tiempo de Empleo(A�os) :</div>
            </td>
            <td nowrap > 
              <input type="text" name="E06TIM" size="6" maxlength="2" value="<%= employment.getE06TIM().trim()%>" class="txtright">
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap > 
              <div align="right">Cargo :</div>
            </td>
            <td nowrap > 
               <eibsinput:cnofc name="employment" flag="32" property="E06FC3"  required="false"/>
            </td>
            <td nowrap > 
              <div align="right">Fecha Ingreso Empleo Actual :</div>
            </td>
            <td nowrap >
             <input type="text" name="E06SWM" size="3" maxlength="2" value="<%= employment.getE06SWM().trim()%>" onkeypress="enterInteger(event)" class="txtright">
             <input type="text" name="E06SWD" size="3" maxlength="2" value="<%= employment.getE06SWD().trim()%>" onkeypress="enterInteger(event)" class="txtright">             
             <input type="text" name="E06SWY" size="5" maxlength="4" value="<%= employment.getE06SWY().trim()%>" onkeypress="enterInteger(event)" class="txtright">             

            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
			<td nowrap> 
              <div align="right">Tipo de Contrato :</div>
            </td>
            <td nowrap >
             <SELECT name="E06NEM">
                   <OPTION value=" " <% if (!(employment.getE06NEM().equals("1") || employment.getE06NEM().equals("2")||           							
                   							  employment.getE06NEM().equals("3"))) out.print("selected");%>></OPTION>
                   <OPTION value="1" <% if (employment.getE06NEM().equals("1")) out.print("selected"); %>="">Fijo</OPTION>
                   <OPTION value="2" <% if (employment.getE06NEM().equals("2")) out.print("selected"); %>="">Indefinido</OPTION>
                   <OPTION value="3" <% if (employment.getE06NEM().equals("3")) out.print("selected"); %>="">Temporal</OPTION>
                   
             </SELECT>
            </td>
            <td nowrap > 
              <div align="right">Fecha Ingreso Empleo Anterior :</div>
            </td>
            <td nowrap> 
             <input type="text" name="E06IA1" size="3" maxlength="2" value="<%= employment.getE06IA1().trim()%>" onkeypress="enterInteger(event)" class="txtright">
             <input type="text" name="E06IA2" size="3" maxlength="2" value="<%= employment.getE06IA2().trim()%>" onkeypress="enterInteger(event)" class="txtright">
             <input type="text" name="E06IA3" size="5" maxlength="4" value="<%= employment.getE06IA3().trim()%>" onkeypress="enterInteger(event)" class="txtright">                                       
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
             <input type="text" name="E06FA1" size="3" maxlength="2" value="<%= employment.getE06FA1().trim()%>" onkeypress="enterInteger(event)" class="txtright">
             <input type="text" name="E06FA2" size="3" maxlength="2" value="<%= employment.getE06FA2().trim()%>" onkeypress="enterInteger(event)" class="txtright">
             <input type="text" name="E06FA3" size="5" maxlength="4" value="<%= employment.getE06FA3().trim()%>" onkeypress="enterInteger(event)" class="txtright">                          
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
              <div align="right">N�mero de Empleado :</div>
            </td>
            <td nowrap> 
              <input type="text" name="E06TOM" size="9" maxlength="8" value="<%= employment.getE06TOM().trim()%>" onkeypress="enterInteger(event)" onblur="FillZeroLeft(this)">
            </td>
            <td nowrap>
              <div align="right">N�mero de Seguro Social :</div>
            </td>
            <td nowrap>
              <input type="text" name="E06NDO" size="13" maxlength="12" value="<%= employment.getE06NDO().trim()%>" onkeypress="enterInteger(event)" onblur="FillZeroLeft(this)">
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap > 
              <div align="right">Identificaci�n Contralor�a :</div>
            </td>
            <td nowrap >
              <input type="text" name="E06CD3" size="5" maxlength="4" value="<%= employment.getE06CD3().trim()%>" onblur="FillZeroLeft(this)">
              <input type="text" name="E06CD4" size="5" maxlength="4" value="<%= employment.getE06CD4().trim()%>" onkeypress="enterInteger(event)" onblur="FillZeroLeft(this)">
              <input type="text" name="E06F01" size="6" maxlength="5" value="<%= employment.getE06F01().trim()%>" onkeypress="enterInteger(event)" onblur="FillZeroLeft(this)">
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


  <p align=center>
    <input id="EIBSBTN" type=submit name="Submit" value="Enviar">
	</p>
 
</form>
</body>
</html>
