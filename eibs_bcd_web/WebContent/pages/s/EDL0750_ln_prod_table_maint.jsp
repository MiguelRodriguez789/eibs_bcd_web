<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>

<%@ page import = "datapro.eibs.master.Util" %>
<%@page import="com.datapro.constants.EibsFields"%>


<html>
<head>
<title>Tasas de Prestamos</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Studio">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">




<jsp:useBean id="lnParam" class="datapro.eibs.beans.EDL075001Message"  scope="session" /> 

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />


<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.js"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>

<SCRIPT type="text/javascript">
       
     //builtNewMenu(prd_loan_opt);
     //initMenu();
       
</SCRIPT>

<SCRIPT type="text/javascript">

   

	builtHPopUp();

  function showPopUp(opth,field,bank,ccy,field1,field2,opcod) {
   init(opth,field,bank,ccy,field1,field2,opcod);
   showPopupHelp();
   }


</SCRIPT>
<SCRIPT type="text/javascript">

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
<h3 align="center">Tabla de Desarrollo<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="Loans_parameters_maint.jsp"> 
</h3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.params.JSEDL0750" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" value="200">
  <INPUT TYPE=HIDDEN NAME="OPT" value="<%= request.getParameter("OPT") %>">
  <INPUT TYPE=HIDDEN NAME="SELTYP" value="<%= request.getParameter("SELTYP") %>">
  <INPUT TYPE=HIDDEN NAME="E01TDBCLS"  value="<%= lnParam.getE01TDBCLS().trim()%>">
  
  <table class="tableinfo">
    <tr> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
          <tr id="trdark"> 
            <td nowrap width="20%" align=right> 
              <b>Banco :</b>
            </td>
            <td nowrap width="20%" > 
              <input type="text" name="E01TDBBNK" size="4" maxlength="2" value="<%= lnParam.getE01TDBBNK()%>" readonly>
            </td>
            <td nowrap align=right width="20%"> 
              <b>Clase :</b>
            </td>
            <td nowrap width="20%" > 
              <input type="text" readonly name="E01TDBCLS" size="8" 
				  value="<% if (lnParam.getE01TDBCLS().equals("1")) out.print("Activo");
							else if (lnParam.getE01TDBCLS().equals("2")) out.print("Pasivo");
							else out.print(" ");%>" >
            </td>
            <td nowrap colspan=2> 
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="20%" align=right> 
              <b>Tabla :</b>
            </td>
            <td nowrap width="20%" >  
        	   <eibsinput:text name="lnParam" property="E01TDBTBL" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CNOFC %>" readonly="true"/>
            </td>
            <td nowrap align=right width="20%"> 
              <b>Comisión :</b>
            </td>
            <td nowrap width="20%" > 
        	   <eibsinput:text name="lnParam" property="E01TDBCMA" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_RATE %>" readonly="true"/>
            </td>
            <td nowrap colspan=2> 
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  
  <H4>Datos B&aacute;sicos</H4>
  <table  class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="trdark">
            <td nowrap colspan=2> 
            <div align="right">Descripción:</div>
            </td>
            <td nowrap colspan=7> 
        	   <eibsinput:text name="lnParam" property="E01TDBDSC" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" />
            </td>
          </tr>
          <tr id="trclear">
            <td nowrap colspan=2> 
            <div align="right">Tipo de Crédito:</div>
            </td>
            <td nowrap colspan=7> 
              <select name="E01TDBTPC">
					<option value=""></option>
					<option value="M" <%if (lnParam.getE01TDBTPC().equals("M")) { out.print("selected"); }%>>Mutuo</option>
					<option value="L" <%if (lnParam.getE01TDBTPC().equals("L")) { out.print("selected"); }%>>Letras</option>
				</select>
            </td>
          </tr>
          <tr id="trdark">
            <td nowrap colspan=2> 
            <div align="right">Crédito Endosable:</div>
            </td>
            <td nowrap colspan=7> 
               <input type="radio" name="E01TDBEND" value="Y"  <%if (lnParam.getE01TDBEND().equals("Y")) out.print("checked"); %>>
              Si 
              <input type="radio" name="E01TDBEND" value="N"  <%if (lnParam.getE01TDBEND().equals("N")) out.print("checked"); %>>
              No
            </td>
          </tr>
          <tr id="trclear">
            <td nowrap colspan=2> 
            <div align="right">Mes Exclusión:</div>
            </td>
            <td nowrap colspan=7> 
        	   <eibsinput:text name="lnParam" property="E01TDBMEX" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_INTEGER %>" size="3" maxlength="2" />
            </td>
          </tr>
          <tr id="trdark">
            <td nowrap colspan=2> 
            <div align="right">Meses de gracia:</div>
            </td>
            <td nowrap colspan=7> 
        	   <eibsinput:text name="lnParam" property="E01TDBMGR" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_INTEGER %>" size="3" maxlength="2" />
            </td>
          </tr>
          <tr id="trclear">
            <td nowrap colspan=2> 
            <div align="right">Mes Firma Escritura:</div>
            </td>
            <td nowrap colspan=7> 
        	   <eibsinput:text name="lnParam" property="E01TDBMES" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_INTEGER %>" size="3" maxlength="2" />
            </td>
          </tr>
          <tr id="trdark">
            <td nowrap colspan=2> 
            <div align="right">Frecuencia Dividendo:</div>
            </td>
            <td nowrap colspan=7> 
			<select name="E01TDBFRE">
				<option value="M" <%if (lnParam.getE01TDBFRE().equals("M")) { out.print("selected"); }%>>Mensual</option>
				<option value="Q" <%if (lnParam.getE01TDBFRE().equals("Q")) { out.print("selected"); }%>>Trimestral</option>
				<option value="S" <%if (lnParam.getE01TDBFRE().equals("S")) { out.print("selected"); }%>>Semestral</option>
				<option value="Y" <%if (lnParam.getE01TDBFRE().equals("Y")) { out.print("selected"); }%>>Anual</option>
			</select>
            </td>
          </tr>
          <tr id="trclear">
            <td nowrap colspan=2> 
            <div align="right">Estatus de la Tabla:</div>
            </td>
            <td nowrap colspan=7> 
			<select name="E01TDBSTS">
				<option value="" <%if (lnParam.getE01TDBSTS().trim().equals("")) { out.print("selected"); }%>>Vigente</option>
				<option value="B" <%if (lnParam.getE01TDBSTS().equals("B")) { out.print("selected"); }%>>Bloqueado</option>
				<option value="P" <%if (lnParam.getE01TDBSTS().equals("P")) { out.print("selected"); }%>>Pendiente</option>
			</select>
            
            </td>
          </tr>
          <tr id="trdark">
            <td nowrap colspan=2> 
            <div align="right">Plazo:</div>
            </td>
            <td nowrap colspan=7> 
        	   <eibsinput:text name="lnParam" property="E01TDBPLZ" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_INTEGER %>" size="6" maxlength="5" />
			<select name="E01TDBPLC">
				<option value="D" <%if (lnParam.getE01TDBPLC().equals("D")) { out.print("selected"); }%>>Días</option>
				<option value="M" <%if (lnParam.getE01TDBPLC().equals("M")) { out.print("selected"); }%>>Meses</option>
				<option value="Y" <%if (lnParam.getE01TDBPLC().equals("Y")) { out.print("selected"); }%>>Años</option>
			</select>
            </td>
          </tr>
          <tr id="trclear">
            <td nowrap colspan=2> 
            <div align="right">Plazo Tramo 2:</div>
            </td>
            <td nowrap colspan=7> 
        	   <eibsinput:text name="lnParam" property="E01TDBPL2" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_INTEGER %>" size="6" maxlength="5" />
            </td>
          </tr>
          <tr id="trdark">
            <td nowrap colspan=2> 
            <div align="right">Tasa Anual:</div>
            </td>
            <td nowrap colspan=7> 
        	   <eibsinput:text name="lnParam" property="E01TDBART" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_RATE %>" />
            </td>
          </tr>
          <tr id="tclear">
            <td nowrap colspan=2> 
            <div align="right">Tasa Anual Tramo 2:</div>
            </td>
            <td nowrap colspan=7> 
        	   <eibsinput:text name="lnParam" property="E01TDBAR2" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_RATE %>" />
            </td>
          </tr>
          <tr id="trdark">
            <td nowrap colspan=2> 
            <div align="right">Comisión Estandar:</div>
            </td>
            <td nowrap colspan=7> 
        	   <eibsinput:text name="lnParam" property="E01TDBCOS" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_RATE %>" />
            </td>
          </tr>
          <tr id="trclear">
            <td nowrap colspan=2> 
            <div align="right">Número Registro:</div>
            </td>
            <td nowrap colspan=7> 
            <input type="text" name="E01TDBNDP" size="28" maxlength="25" value="<%=lnParam.getE01TDBNDP()%>">
            </td>
          </tr>
          <tr id="trdark">
            <td nowrap colspan=2> 
            <div align="right">Notaría:</div>
            </td>
            <td nowrap colspan=7> 
  				<input type="text" name="E01TDBNDN" size="6" maxlength="4" value="<%=lnParam.getE01TDBNDN()%>">
                <A href="javascript:GetTypeBroker('E01TDBNDN', 'D01TDBNDN')">
                <IMG src="<%=request.getContextPath()%>/images/1b.gif" title="help" align="bottom" border="0">
                </A>
        	   <eibsinput:text name="lnParam" property="D01TDBNDN" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true"/>
            </td>
          </tr>


          
          <tr id="trclear">
			<td nowrap colspan=9>
			  
            </td>			
          </tr>
         </table>
       </td>
    </tr>
  </table>
  <p align="center"> 
        <input id="EIBSBTN" type=submit name="Submit" value="Enviar">
  </p>
 
  </form>
</body>
</html>
