<!DOCTYPE HTML">
<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@ page import = "datapro.eibs.master.Util" %>
<%@page import="com.datapro.constants.EibsFields"%>
<%@page import="com.datapro.eibs.constants.HelpTypes"%>

<html>
<head>
<title>Customer Basic Info</title>

<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset="utf-8">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<script language="Javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script language="Javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>

<jsp:useBean id="client" class="datapro.eibs.beans.ESD108001Message"  scope="session" /> 
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />


</head>
 
<body>

<script src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script >

<%	 if (client.getE01LGT().trim().equals("1")) {%>
		builtNewMenu(client_inq_corp_opt);
		<%userPO.setOption("CLIENT_C");%>	
<%	} else { %>
		builtNewMenu(client_inq_personal_opt);
		<%userPO.setOption("CLIENT_P");%>	
<% 	} %>
	
 
 function age() {
 	var td = <%=currUser.getE01RDY()%> * 10000 + <%=currUser.getE01RDM()%> * 100 + <%=currUser.getE01RDD()%>;
 	<% 	if (client.getE01LGT().trim().equals("1")) { %>
 	  	var db = getElement("JBDY").value * 10000 + getElement("JBDM").value * 100 + getElement("JBDD").value * 1;
 	<% } else { %>
 		var db = getElement("PBDY").value * 10000 + getElement("PBDM").value * 100 + getElement("PBDD").value * 1;
 	<% } %>  
 	var today = td.toString();
 	var dob = db.toString();
 	var y1 = Number(today.substr(0,4));
	var m1 = Number(today.substr(4,2))-1;
	var d1 = Number(today.substr(6,2));
	var y2 = Number(dob.substr(0,4));
	var m2 = Number(dob.substr(4,2))-1;
	var d2 = Number(dob.substr(6,2));
	var age = y1 - y2;
	if(m1 < m2 || (m1 == m2 && d1 < d2)){age--;}
 	document.forms[0].JAGE.value = age;
 	document.forms[0].PAGE.value = age;
 }

</SCRIPT>  
 

<% 
	if ( !error.getERRNUM().equals("0")  ) {
        out.println("<SCRIPT Language=\"Javascript\">");
        error.setERRNUM("0");
        out.println("       showErrors()");
        out.println("</SCRIPT>");
    }
    
    if ( !userPO.getPurpose().equals("NEW") ) {
    	out.println("<SCRIPT> initMenu(); </SCRIPT>");
 	}
    
    String legtyp = (client.getE01LGT().equals("1")?"JURIDICO":"PERSONA");
    String tdir = (client.getE01LGT().equals("1")?"DIRECCION PRINCIPAL":"DIRECCION DE RESIDENCIA");
    String readNew = " readonly";
	String read = " readonly";
 	String disabled = " disabled";
 	String mandatory = "<img src=\"" + request.getContextPath() + "/images/Check.gif\" alt=\"campo obligatorio\" align=\"bottom\" border=\"0\" >";
 	String tf = "true";
 	Boolean isReadOnly = true;
 	Boolean isNew = false;
 	String readMnt = " readonly";
	
	boolean maintenance = client.getD01CRT().contains("Mantenimiento");
	int row = 0;
%>

<H3 align="center">Consulta Básica de Cliente<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="client_inq_basic.jsp, ESD1080"></H3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSESD1080">
  
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="5">
  <INPUT TYPE=HIDDEN NAME="E01MST" VALUE="<%= client.getE01MST()%>">
  <INPUT TYPE=HIDDEN NAME="E01CCS" VALUE="<%= client.getE01CCS()%>">
  <INPUT TYPE=HIDDEN NAME="E01GEC" VALUE="<%= client.getE01GEC()%>">
  <INPUT TYPE=HIDDEN NAME="E01BDY" VALUE="<%= client.getE01BDY()%>">
  <INPUT TYPE=HIDDEN NAME="E01BDM" VALUE="<%= client.getE01BDM()%>">
  <INPUT TYPE=HIDDEN NAME="E01BDD" VALUE="<%= client.getE01BDD()%>">
  <INPUT TYPE=HIDDEN NAME="E01FN2" VALUE="<%= client.getE01FN2()%>">
  <INPUT TYPE=HIDDEN NAME="E01LN1" VALUE="<%= client.getE01LN1()%>">
  <INPUT TYPE=HIDDEN NAME="E01FL8" VALUE="<%= client.getE01FL8()%>">
  <INPUT TYPE=HIDDEN NAME="E01CP1" VALUE="<%= client.getE01CP1()%>">
  <INPUT TYPE=HIDDEN NAME="E01RCP" VALUE="<%= client.getE01RCP()%>">
  <INPUT TYPE=HIDDEN NAME="E01SEX" VALUE="<%= client.getE01SEX()%>">
  <INPUT TYPE=HIDDEN NAME="OPE" VALUE="00">


  <table  class="tableinfo" width="100%">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
        <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="5%" align="right">Tipo Legal : </td>
            <td nowrap width="10%" align="left" > <%=legtyp%>
            	<INPUT TYPE=HIDDEN NAME="E01LGT" VALUE="<%= client.getE01LGT()%>" >
			</td>
            <td nowrap width="5%" align="right">Estado : </td>
			<td nowrap width="40%" align="left" style="color:red;font-size:12;">
				<input type="HIDDEN" name="E01STS" VALUE="<%= client.getE01STS()%>" > 
			  	<% if (client.getE01STS().equals("1")) { out.print("CLIENTE - INACTIVO"); }
					  	else if (client.getE01STS().equals("2")) { out.print("CLIENTE - ACTIVO");  }
						else if (client.getE01STS().equals("3")) { out.print("CLIENTE - BLOQUEADO"); }
						else if (client.getE01STS().equals("4")) { out.print("FALLECIDO"); }
						else if (client.getE01STS().equals("0")) { out.print("PROSPECTO"); }
						else { out.print(""); } 
				%>	
				<b>
					<%= client.getD01CRT().trim()%>
				</b>		
			</td>
            <td nowrap width="5%" align="right">Causal :</td>
			<td nowrap width="35%" align="center">
				<% if (!client.getE01OPE().equals("02")) { out.print(client.getD01FC1().trim() + " / " + client.getD01FC2().trim()); }%>
			</td>
		</tr>
		<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="5%" align="right">Código :</td>
            <td nowrap width="10%" align="left"> 
                <INPUT type="text" name="E01CUN" size="10" readonly value="<%= client.getE01CUN().trim()%>">
			</td>
            <td nowrap width="5%" align="right">Nombre Legal :</td>
			<td nowrap width="40%" align="left">
				<INPUT type="text" name="LEGNME" size="60" readonly value="<%= client.getE01NM6().trim()%>"
				<%=(client.getF01NA1().equals("Y"))?"id=\"txtchanged\"":"" %>>
			</td>
            <td nowrap width="5%" align="right">Nombre Corto :</td>
			<td nowrap width="35%" align="left">
				<eibsinput:text name="client" property="E01SHN" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CHAR %>" size="26" required="false" readonly="true" modified="F01SHN"/>
			</td>
		</tr>
		<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="5%" align="right">Tipo ID : </td>
            <td nowrap width="10%" align="left">
            	<eibsinput:text name="client" property="E01TID" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CNOFC %>" required="false" readonly="true" modified="F01TID"/> 
			</td>
            <td nowrap width="5%" align="right"><%= client.getD01TID().trim()%> : </td>
			<td nowrap width="40%" align="left">
				<eibsinput:text name="client" property="E01IDN" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_IDENTIFICATION %>" required="false" readonly="true" modified="F01IDN"/>
			</td>
            <td nowrap width="5%" align="right">País Identificación : </td>
			<td nowrap width="35%" align="left">
				<eibsinput:text name="client" property="E01PID" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CNOFC %>" required="false" readonly="true" modified="F01PID"/>
				<%= client.getD01PID().trim()%>
			</td>
		</tr>
		<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="5%" align="right"></td>
            <td nowrap width="10%" align="left"> 
			</td>
            <td nowrap width="5%" align="right"></td> 
			<td nowrap width="40%" align="left">
			</td>
            <td nowrap width="5%" align="right"></td>
			<td nowrap width="35%" align="left">
			</td>
		</tr>
        </table>
     

<div id="NATURAL" style="position:relative; display:none;">
  <table  class="tableinfo" width="100%">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="15%" align="right">Primer Nombre :</td>
            <td nowrap width="35%" align="left">
            	<eibsinput:text name="client" property="E01FNA" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CHAR %>" size="45" maxlength="40" required="true" readonly="<%=!isNew %>" modified="F01FNA"/> 
            </td>
            <td nowrap width="15%" align="right">Segundo Nombre :</td>
            <td nowrap width="35%" align="left">
            	<input type="text" name="PFN2" size="45" maxlength="40" value="<%= client.getE01FN2().trim()%>" <%= readMnt %>"
            	<%=(client.getF01FN2().equals("Y"))?"id=\"txtchanged\"":"" %>>
            </td>
         </tr>
         <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="15%" align="right">Primer Apellido :</td>
            <td nowrap width="35%" align="left">
                <input type="text" name="PLN1" size="45" maxlength="40" value="<%= client.getE01LN1().trim()%>" readonly>
                <%=mandatory %>
            </td>
            <td nowrap width="15%" align="right">Segundo Apellido :</td>
            <td nowrap width="35%" align="left">
            	<eibsinput:text name="client" property="E01LN2" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CHAR %>" size="45" maxlength="40" required="false" readonly="true" />
            </td>
         </tr>
         <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="15%" align="right">Genero :</td>
            <td nowrap width="35%" align="left" <%=(client.getF01SEX().equals("Y"))?"id=\"txtchanged\"":"" %>>
                <p> 
                <input type="radio" name="SEX" value="F" <%if (client.getE01SEX().equals("F")) out.print("checked"); %> disabled >
                Femenino 
                <input type="radio" name="SEX" value="M" <%if (!client.getE01SEX().equals("F")) out.print("checked"); %> disabled >
                Masculino 
                </p>
            </td>
            <td nowrap width="15%" align="right">Estado Civil :</td>
            <td nowrap width="35%" align="left">
                <select name="PMST" disabled>
                	<option value=" " <% if (!(client.getE01MST().equals("1")||client.getE01MST().equals("2") || client.getE01MST().equals("3")||client.getE01MST().equals("4")||client.getE01MST().equals("5")||client.getE01MST().equals("6"))) out.print("selected"); %>> 
                    </option>
                    <option value="1" <% if (client.getE01MST().equals("1")) out.print("selected"); %>>Soltero(a)</option>
                    <option value="2" <% if (client.getE01MST().equals("2")) out.print("selected"); %>>Casado(a)</option>                   
                    <option value="3" <% if (client.getE01MST().equals("3")) out.print("selected"); %>>Divorciado(a)</option>
                    <option value="4" <% if (client.getE01MST().equals("4")) out.print("selected"); %>>Viudo(a)</option>
                    <option value="5" <% if (client.getE01MST().equals("5")) out.print("selected"); %>>Unión Libre</option>
                    <option value="6" <% if (client.getE01MST().equals("6")) out.print("selected"); %>>Otro</option>
                </select>
                <%=mandatory %>
            </td>
         </tr>
         <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="15%" align="right">Nro. de Personas a Cargo :</td>
            <td nowrap width="35%" align="left">
            	<eibsinput:text name="client" property="E01NSO" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_INTEGER %>" size="4" maxlength="2" required="true" readonly="true" />
            </td>
            <td nowrap width="15%" align="right">Nacionalidad :</td>
            <td nowrap width="35%" align="left">
                <eibsinput:cnofc name="client" property="E01CCS" value="<%=client.getE01CCS()%>"  maxlength="2"  required="true" flag="03" fn_code="E01CCS" fn_description="D01CCS" readonly="true"/> 
				<input TYPE="text" NAME="D01CCS" value="<%=client.getD01CCS()%>" readonly>
            </td>
         </tr>
         <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="15%" align="right">Fecha de Nacimiento :</td>
              <td nowrap width="35%" align="left">
              	<INPUT type="text" name="PBDD" size="3" maxlength="2" value="<%= client.getE01BDD().trim()%>" readonly>
				<INPUT type="text" name="PBDM" size="3" maxlength="2" value="<%= client.getE01BDM().trim()%>" readonly>
				<INPUT type="text" name="PBDY" size="5" maxlength="4" value="<%= client.getE01BDY().trim()%>" readonly>
                 <label id="lAge"></label>
                <input TYPE="text" NAME="PAGE" size="3" readonly> 
              </td>
            <td nowrap width="15%" align="right">País de Residencia : </td>
            <td nowrap width="35%" align="left">
            	<eibsinput:cnofc name="client" property="PGEC" value="<%=client.getE01GEC()%>"  maxlength="2" required="true" flag="03" fn_code="PGEC" fn_description="PD01GEC" readonly="true" /> 
				<input TYPE="text" NAME="PD01GEC" value="<%=client.getD01GEC()%>" readonly>
            </td>
         </tr>
         <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="15%" align="right">Lugar de Nacimiento :<br>País / Dpto. / Ciudad</td>
            <td nowrap width="35%" align="left">
            	<eibsinput:cnofc name="client" property="E01N5P" value="<%=client.getE01N5P()%>" maxlength="2" required="false" flag="03" fn_code="E01N5P" fn_description="D01N5P" readonly="true"/>
            	<%=mandatory %>
            	<input type="text" name="D01N5P" size="20" value="<%= client.getD01N5P().trim()%>" readonly> <br>
            	<input type="text" name="E01N5D" size="5" maxlength="2" value="<%= client.getE01N5D().trim()%>" readonly> 
              		<%=mandatory %>
            	<input type="text" name="D01N5D" size="20" value="<%= client.getD01N5D().trim()%>" readonly><br>
            	<input type="text" name="E01N5C" size="5" maxlength="4" value="<%= client.getE01N5C().trim()%>" readonly> 
              		<%=mandatory %>
            	<input type="text" name="D01N5C" size="20" value="<%= client.getD01N5C().trim()%>" readonly> 
            </td>
            <td nowrap width="15%" align="right">Lugar Expedición de Identificación : <br>País / Dpto. / Ciudad</td>
            <td nowrap width="35%" align="left">
             	<eibsinput:cnofc name="client" property="E01N3P" value="<%=client.getE01N3P()%>" maxlength="2" required="false" flag="03" fn_code="E01N3P" fn_description="D01N3P" readonly="true" />
            	<%=mandatory %>
            	<input type="text" name="D01N3P" size="20" value="<%= client.getD01N3P().trim()%>" readonly> <br>
            	<input type="text" name="E01N3D" size="5" maxlength="2" value="<%= client.getE01N3D().trim()%>" readonly> 
          		<%=mandatory %>
            	<input type="text" name="D01N3D" size="20" value="<%= client.getD01N3D().trim()%>" readonly><br>
            	<input type="text" name="E01N3C" size="5" maxlength="4" value="<%= client.getE01N3C().trim()%>" readonly> 
           		<%=mandatory %>
            	<input type="text" name="D01N3C" size="20" value="<%= client.getD01N3C().trim()%>" readonly>
            </td>
         </tr>
         <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="15%" align="right">Nacionalidad : </td>
              <td nowrap width="35%" align="left">
              	<eibsinput:cnofc name="client" property="E01CCS" value="<%=client.getE01CCS()%>"  maxlength="2"  required="true" flag="03" fn_code="E01CCS" fn_description="D01CCS" readonly="true" styleId="F01CCS"/> 
				<input TYPE="text" NAME="D01CCS" value="<%=client.getD01CCS()%>" readonly>
              </td>
            <% 	if (!client.getE01LGT().trim().equals("1")) { %>    
            <td nowrap width="15%" align="right">Fecha de Expedición de Identificación : </td>
            <td nowrap width="35%" align="left">
            	<eibsinput:date name="client" fn_year="E01REY" fn_month="E01REM" fn_day="E01RED" required="true" readonly="true"/>
            </td>
            <% } else { %>
            <td nowrap width="15%" align="right"></td>
            <td nowrap width="35%" align="left">
            </td>
            <%} %>
         </tr>
         <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="15%" align="right">Nivel de Estudios : </td>
              <td nowrap width="35%" align="left"> 
              	<eibsinput:cnofc name="client" property="E01EDL" value="<%=client.getE01EDL()%>" required="true" flag="29" fn_code="E01EDL" fn_description="D01EDL" readonly="true"/> 
				<input TYPE="text" NAME="D01EDL" value="<%=client.getD01EDL()%>" readonly>
              </td>
            <td nowrap width="15%" align="right">Titulo Pregrado : </td>
            <td nowrap width="35%" align="left">
            	<eibsinput:cnofc name="client" property="E01UC9" value="<%=client.getE01UC9()%>" required="true" flag="49" fn_code="E01UC9" fn_description="D01UC9" readonly="true"/> 
				<input TYPE="text" NAME="D01UC9" value="<%=client.getD01UC9()%>" readonly>
            </td>
         </tr>
         
       </table>
            
       </td>
       </tr>
    </table>

</div>   
   
<div id="JURIDICO" style="position:relative; display:none;">
  
  <table  class="tableinfo" width="100%">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="15%" align="right">Razón Social :</td>
            <td nowrap width="85%" colspan="3"  align="left"> 
               	<input type="text" name="E01NM6" size="120" maxlength="160" value="<%= client.getE01NM6().trim()%>" readonly>
               	<%=mandatory %>
            </td>
         </tr>
         <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="15%" align="right">Nombre Comercial :</td>
            <td nowrap width="35%" align="left"> 
               	<input type="text" name="JFN2" size="45" maxlength="40" value="<%= client.getE01FN2().trim()%>" readonly><br>
               	<input type="text" name="JLN1" size="45" maxlength="40" value="<%= client.getE01LN1().trim()%>" readonly>
            </td>
            <td nowrap width="15%" align="right">Nombre Anterior : </td>
            <td nowrap width="35%" align="left">
            	<input type="text" name="JCP1" size="46" maxlength="45" value="<%= client.getE01CP1().trim()%>" readonly>
            </td>
         </tr>
         <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="15%" align="right">Tipo de Entidad :</td>
            <td nowrap width="35%" align="left">
              	<eibsinput:cnofc name="client" property="E01UC2" value="<%=client.getE01UC2()%>" required="true" flag="RI" fn_code="E01UC2" fn_description="D01UC2" readonly="true"/>
       	        <input type="text" name="D01UC2" size="20" value="<%= client.getD01UC2().trim()%>" readonly>	 	
            </td>
            <td nowrap width="15%" align="right">Empresa en <%= client.getD01GEC().trim()%> es : </td>
            <td nowrap width="35%" align="left">
            	<select name="JMST" disabled>
                	<option value=" " <% if (!(client.getE01MST().equals("P")||client.getE01MST().equals("A") || client.getE01MST().equals("S"))) out.print("selected"); %>> 
                    </option>
                    <option value="P" <% if (client.getE01MST().equals("P")) out.print("selected"); %>>Principal</option>
                    <option value="A" <% if (client.getE01MST().equals("A")) out.print("selected"); %>>Agencia</option>                   
                    <option value="S" <% if (client.getE01MST().equals("S")) out.print("selected"); %>>Sucursal</option>
                </select>
                <%=mandatory %>
            </td>
         </tr>
         <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="15%" align="right">Naturaleza Jurídica :</td>
              <td nowrap width="35%" align="left"> 
              	<eibsinput:cnofc name="client" property="E01UC3" value="<%=client.getE01UC3()%>" required="true" flag="RN" fn_code="E01UC3" fn_description="D01UC3" readonly="true"/>
       	        <input type="text" name="D01UC3" size="20" value="<%= client.getD01UC3().trim()%>" readonly>	 	
              </td>
            <td nowrap width="15%" align="right">Tipo de Negocio :</td>
            <td nowrap width="35%" align="left">
            	<eibsinput:cnofc name="client" property="E01UC4" value="<%=client.getE01UC4()%>" required="false" flag="C7" fn_code="E01UC4" fn_description="D01UC4" readonly="true"/>
       	        <input type="text" name="D01UC4" size="20" value="<%= client.getD01UC4().trim()%>" readonly>  
            </td>
         </tr>
         <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="15%" align="right">Fecha de Constitución :</td>
              <td nowrap width="35%" align="left">
              	<INPUT type="text" name="JBDD" size="3" maxlength="2" value="<%= client.getE01BDD().trim()%>" readonly>
				<INPUT type="text" name="JBDM" size="3" maxlength="2" value="<%= client.getE01BDM().trim()%>" readonly>
				<INPUT type="text" name="JBDY" size="5" maxlength="4" value="<%= client.getE01BDY().trim()%>" readonly>
			  	<%=mandatory %>
                 <label id="lAge"></label>
                <input TYPE="text" NAME="JAGE" size="3" readonly> 
              </td>
            <td nowrap width="15%" align="right">País : </td>
            <td nowrap width="35%" align="left">
            	<eibsinput:cnofc name="client" property="JGEC" value="<%=client.getE01GEC()%>"  maxlength="2" required="true" flag="03" fn_code="JGEC" fn_description="JD01GEC" readonly="true"/> 
				<input TYPE="text" NAME="JD01GEC" value="<%=client.getD01GEC()%>" readonly>
            </td>
         </tr>
         <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="15%" align="right">Forma de Constitución :</td>
              <td nowrap width="35%" align="left">
              	 <eibsinput:cnofc name="client" property="E01UC6" value="<%=client.getE01UC6()%>" required="true" flag="F3" fn_code="E01UC6" fn_description="D01UC6" readonly="true"/>
       	         <input type="text" name="D01UC6" size="20" value="<%= client.getD01UC6().trim()%>" readonly>
              </td>
            <% 	if (client.getE01LGT().trim().equals("1")) { %>    
            <td nowrap width="15%" align="right">Fecha de Inicio de Actividades : </td>
            <td nowrap width="35%" align="left">
            	<eibsinput:date name="client" fn_year="E01REY" fn_month="E01REM" fn_day="E01RED" required="true" readonly="true"/>
            </td>
            <% } else { %>
            <td nowrap width="15%" align="right"></td>
            <td nowrap width="35%" align="left">
            </td>
            <%} %>
         </tr>
         <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
         <td nowrap width="15%" align="right">Cantidad de Empleados :</td>
            <td nowrap width="35%" align="left">
              <eibsinput:text name="client" property="E01NEM" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_INTEGER %>" size="5" maxlength="4" required="false" readonly="true"/>
            </td>
            <td nowrap width="15%" align="right"></td>
            <td nowrap width="35%" align="left">
            </td>
         </tr>
       </table>
       </td>
       </tr>
    </table>
</div>

  <table  class="tableinfo" width="100%">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="15%" align="right">Sector Económico : </td>
              <td nowrap width="35%" align="left"> 
              	<eibsinput:cnofc name="client" property="E01INC" value="<%=client.getE01INC()%>" required="true" flag="09" fn_code="E01INC" fn_description="D01INC" readonly="true"/> 
				<input TYPE="text" NAME="D01INC" value="<%=client.getD01INC()%>" readonly>
              </td>
            <td nowrap width="15%" align="right">Actividad Económica (CIIU) : </td>
            <td nowrap width="35%" align="left">
            	<input type="text" name="E01BUC" size="5" maxlength="4" value="<%= client.getE01BUC().trim()%>" readonly>
                <%=mandatory %>  
				<input TYPE="text" NAME="D01BUC" value="<%=client.getD01BUC()%>" readonly>
            </td>
         </tr>
         <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="15%" align="right">Operaciones <br> Medios Electrónicos :</td>
            <td nowrap width="35%" align="left">
            	<%
              	boolean bACH = (client.getE01FL8().indexOf("A") > -1);
              	boolean bINT = (client.getE01FL8().indexOf("I") > -1);
              	boolean bCAJ = (client.getE01FL8().indexOf("C") > -1);
              	boolean bSEB = (client.getE01FL8().indexOf("S") > -1);
              	boolean bIVR = (client.getE01FL8().indexOf("V") > -1);
              	boolean bTES = (client.getE01FL8().indexOf("T") > -1);
              %>
              <INPUT type="checkbox" name="INT" value="I" <% if (bINT == true) out.print("checked"); %> disabled>Internet
              <INPUT type="checkbox" name="ACH" value="A" <% if (bACH == true) out.print("checked"); %> disabled>ACH
              <INPUT type="checkbox" name="CAJ" value="C" <% if (bCAJ == true) out.print("checked"); %> disabled>Caj. Autom.
              <INPUT type="checkbox" name="SEB" value="S" <% if (bSEB == true) out.print("checked"); %> disabled>SEBRA
              <INPUT type="checkbox" name="IVR" value="V" <% if (bIVR == true) out.print("checked"); %> disabled>IVR
              <INPUT type="checkbox" name="TES" value="T" <% if (bTES == true) out.print("checked"); %> disabled>Tesorería 
              <%=mandatory %>
            </td> 
            <% 	if (!client.getE01LGT().trim().equals("1")) { %>  
            <td nowrap width="15%" align="right">Ocupación :</td>
            <td nowrap width="35%" align="left">
            	<eibsinput:cnofc name="client" property="E01ALB" value="<%=client.getE01ALB()%>" required="true" flag="C4" fn_code="E01ALB" fn_description="D01ALB" readonly="true"/> 
				<input TYPE="text" NAME="D01ALB" value="<%=client.getD01ALB()%>" readonly>
            </td>
            <% } else { %>
            <td nowrap width="15%" align="right"></td>
            <td nowrap width="35%" align="left">
            </td>
            <% } %>
          </tr>
       </table>
            
       </td>
       </tr>
    </table>

	</td>
  	</tr>	
  </table>	
  
  </form>
</body> 

<SCRIPT Language="Javascript">

<% 	
	if (client.getE01LGT().trim().equals("1")) { %>
		getElement("lAge").innerHTML = "Años Constituida :";
 		JURIDICO.style.display='block';
		NATURAL.style.display='none' ;
<% } else { %>
		getElement("lAge").innerHTML = "Edad :";
 		NATURAL.style.display='block' ;
		JURIDICO.style.display='none' ; 
<% }  %>
	age();  
    
</SCRIPT>

</html>
