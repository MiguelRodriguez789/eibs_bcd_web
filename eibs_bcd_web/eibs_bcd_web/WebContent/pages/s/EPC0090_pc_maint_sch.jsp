<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ page import = "datapro.eibs.beans.EPC009001Message" %>
<%@ page import = "datapro.eibs.master.*" %>
<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@ page import = "datapro.eibs.master.Util" %>
<%@page import="com.datapro.constants.EibsFields"%>

<html>
<head>
<title>Calculo de Factores Proyecto de Constructor</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Studio">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>

<jsp:useBean id="pcMant" class="datapro.eibs.beans.EPC009001Message"  scope="session" />
<jsp:useBean id= "extList" class= "datapro.eibs.beans.JBObjList"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>

</head>

<body >

<SCRIPT type="text/javascript">
   
function showProductData(obj){
   if (obj.checked) PRODUCTDATA.style.display=""; else {
    PRODUCTDATA.style.display="none";
   }
}

   
function showFactorData(obj){
   if (obj.checked) FACTORDATA.style.display=""; else {
    FACTORDATA.style.display="none";
   }
}

   
function showDoneData(obj){
   if (obj.checked) DONEDATA.style.display=""; else {
    DONEDATA.style.display="none";
   }
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



<h3 align="center">Calculo de Factores Proyecto de Constructor<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="pc_maint_sch.jsp, EPC0090"></h3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEPC0090" id="form1">
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="4">
  <INPUT TYPE=HIDDEN NAME="OPT" VALUE="2">
<%--  <INPUT TYPE=HIDDEN NAME="ROW" VALUE="<%=row%>">  --%>
  <INPUT TYPE=HIDDEN NAME="E01DLSSEQ" VALUE="99">            
  <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
          <tr id="trdark"> 
            <td nowrap width="25%" > 
              <div align="right"><b>Número de Proyecto : </b></div>
            </td>
            <td nowrap width="15%" > 
              <div align="left">
              	<eibsinput:text name="pcMant" property="E01PCMACC" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_ACCOUNT %>" readonly="true" /> 
              </div>
            </td>
            <td nowrap width="15%" > 
              <div align="right"><b>Cliente : </b></div>
            </td>
            <td nowrap width="45%" > 
              <div align="left"> 
                <eibsinput:text name="pcMant" property="E01PCMCUN" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CUSTOMER %>" readonly="true" />
                 <eibsinput:text name="pcMant" property="D01PCMCUN" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_NAME %>" readonly="true" />
               </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>



  <h4> Información Proyecto</h4> 
  
  <%int row1 = 0; %>
  <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellpadding=2 cellspacing=0 width="100%" border="0">
          <tr id="<%= (row1 % 2 == 1) ? "trdark" : "trclear" %><%row1++;%>"> 
            <td nowrap width="25%"> 
              <div align="right">Nombre de Proyecto :</div>
            </td>
            <td nowrap width="25%"> 
               <eibsinput:text name="pcMant" property="E01PCMNME" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_NAME %>" readonly="true" />
            </td>
            <td nowrap width="25%" >
			</td>
            <td nowrap width="25%" >
			</td>
            <td nowrap width="25%" >
			</td>
            <td nowrap width="25%" >
			</td>
          </tr>
          <tr id="<%= (row1 % 2 == 1) ? "trdark" : "trclear" %><%row1++;%>"> 
            <td nowrap width="25%"> 
              <div align="right">Direccion Principal :</div>
            </td>
            <td nowrap width="25%"> 
                   <eibsinput:text name="pcMant" property="E01PCMAD1" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true" />
            </td>
            <td nowrap width="25%" >
			</td>
            <td nowrap width="25%" >
			</td>
            <td nowrap width="25%" >
			</td>
            <td nowrap width="25%" >
			</td>
          </tr>
          <tr id="<%= (row1 % 2 == 1) ? "trdark" : "trclear" %><%row1++;%>"> 
            <td nowrap width="25%"> 
              <div align="right"> </div>
            </td>
            <td nowrap width="25%"> 
                    <eibsinput:text name="pcMant" property="E01PCMAD2" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true" />
            </td>
            <td nowrap width="25%" >
			</td>
            <td nowrap width="25%" >
			</td>
            <td nowrap width="25%" >
			</td>
            <td nowrap width="25%" >
			</td>
          </tr>
          <tr id="<%= (row1 % 2 == 1) ? "trdark" : "trclear" %><%row1++;%>"> 
            <td nowrap width="25%"> 
              <div align="right"> </div>
            </td>
            <td nowrap width="25%"> 
                    <eibsinput:text name="pcMant" property="E01PCMAD3" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true" />
            </td>
            <td nowrap width="25%" >
			</td>
            <td nowrap width="25%" >
			</td>
            <td nowrap width="25%" >
			</td>
            <td nowrap width="25%" >
			</td>
          </tr>

          <tr id="<%= (row1 % 2 == 1) ? "trdark" : "trclear" %><%row1++;%>"> 
            <td nowrap width="13%"> 
              <div align="right">Estado :</div>
            </td>
            <td nowrap width="25%"> 
              <input type="text" readonly name="E01PCMSTE" size="5" maxlength="4" value="<%= pcMant.getE01PCMSTE().trim()%>">
            </td>
            <td nowrap width="13%"> 
              <div align="right">Codigo Area :</div>
            </td>
            <td nowrap width="25%"> 
                     <eibsinput:text name="pcMant" property="E01PCMZPC" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_ZIPCODE %>" readonly="true" />
            </td>
            <td nowrap width="13%"> 
              <div align="right">Apartado Postal :</div>
            </td>
            <td nowrap width="25%"> 
                     <eibsinput:text name="pcMant" property="E01PCMPOB" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_PO_BOX %>" readonly="true" />
            </td>
          </tr>


          <tr id="<%= (row1 % 2 == 1) ? "trdark" : "trclear" %><%row1++;%>"> 
            <td nowrap width="15%"> 
              <div align="right">Ciudad :</div>
            </td>
            <td nowrap width="25%"> 
              <input type="text" readonly name="E01PCMCTY" size="31" maxlength="30" value="<%= pcMant.getE01PCMCTY().trim()%>">
            </td>
            <td nowrap width="15%"> 
              <div align="right">Pais :</div>
            </td>
            <td nowrap width="25%"> 
              <input type="text" readonly name="E01PCMCTR" size="21" maxlength="20" value="<%= pcMant.getE01PCMCTR().trim()%>">
            </td>
            <td nowrap width="25%" >
			</td>
            <td nowrap width="25%" >
			</td>
            <td nowrap width="25%" >
			</td>
          </tr>


        </table>
      </td>
    </tr>
  </table>  



  <h4> Información Básica</h4> 
  <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellpadding=2 cellspacing=0 width="100%" border="0">
          <tr id="<%= (row1 % 2 == 1) ? "trdark" : "trclear" %><%row1++;%>"> 
            <td nowrap width="25%"> 
              <div align="right">Fecha de Apertura :</div>
            </td>
            <td nowrap width="23%"> 
              <input type="text" readonly name="E01PCMOPM" size="3" maxlength="2" value="<%= pcMant.getE01PCMOPM().trim()%>" onkeypress="enterInteger(event)">
              <input type="text" readonly name="E01PCMOPD" size="3" maxlength="2" value="<%= pcMant.getE01PCMOPD().trim()%>" onkeypress="enterInteger(event)">
              <input type="text" readonly name="E01PCMOPY" size="5" maxlength="4" value="<%= pcMant.getE01PCMOPY().trim()%>" onkeypress="enterInteger(event)">
            </td>
            <td nowrap width="25%"> 
              <div align="right">Fecha Limite Solicitud :</div>
            </td>
            <td nowrap width="27%"> 
              <input type="text" readonly name="E01PCMMAM" size="3" maxlength="2" value="<%= pcMant.getE01PCMMAM().trim()%>" onkeypress="enterInteger(event)">
              <input type="text" readonly name="E01PCMMAD" size="3" maxlength="2" value="<%= pcMant.getE01PCMMAD().trim()%>" onkeypress="enterInteger(event)">
              <input type="text" readonly name="E01PCMMAY" size="5" maxlength="4" value="<%= pcMant.getE01PCMMAY().trim()%>" onkeypress="enterInteger(event)">
            </td>
          </tr>
          <tr id="<%= (row1 % 2 == 1) ? "trdark" : "trclear" %><%row1++;%>"> 
            <td nowrap width="20%"> 
              <div align="right">Valor Presupuesto :</div>
            </td>
            <td nowrap width="35%"> 
                   <eibsinput:text name="pcMant" property="E01PCMVPR" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true" />
            </td>
            <td nowrap width="20%" height="37"> 
              <div align="right">Termino :</div>
            </td>
            <td nowrap width="35%" height="37"> 
             <input type="text" readonly name="E01PCMTRM" size="6" maxlength="5" value="<%= pcMant.getE01PCMTRM().trim()%>" onkeypress="enterInteger(event)">
             <input type="text" readonly name="E01PCMTRC" size="10" 
				  value="<% if (pcMant.getE01PCMTRC().equals("D")) out.print("D&iacute;a(s)");
							else if (pcMant.getE01PCMTRC().equals("M")) out.print("Mes(es)");
							else if (pcMant.getE01PCMTRC().equals("Y")) out.print("A&ntilde;o(s)");
							else out.print("");%>" 
				>
            </td>
          </tr>
          <tr id="<%= (row1 % 2 == 1) ? "trdark" : "trclear" %><%row1++;%>"> 
            <td nowrap width="25%" > 
              <div align="right">Valor Solicitado :</div>
            </td>
            <td nowrap width="23%" > 
                  <eibsinput:text name="pcMant" property="E01PCMVSL" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true" />
            <td nowrap width="25%" >
              <div align="right">Unidades a Construir :</div>
            </td>
            <td nowrap width="27%" >
 				<input type="text" readonly name="E01PCMUNI" size="5" maxlength="4" value="<%= pcMant.getE01PCMUNI().trim()%>" onKeypress="enterInteger(event)">
                <input type="text" readonly name="E01PCMTUN" size="5" maxlength="4" value="<%= pcMant.getE01PCMTUN().trim()%>" >
            </td>
          </tr>
          <tr id="<%= (row1 % 2 == 1) ? "trdark" : "trclear" %><%row1++;%>"> 
            <td nowrap width="25%" > 
              <div align="right">Precio Promedio de Venta :</div>
            </td>
            <td nowrap width="23%" > 
                 <eibsinput:text name="pcMant" property="E01PCMPPV" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true" />
            <td nowrap width="25%" >
              <div align="right">Porcentaje de Anticipo :</div>
            </td>
            <td nowrap width="27%" >
                <eibsinput:text name="pcMant" property="E01PCMPPR" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_PERCENTAGE %>" readonly="true" />
			</td>
          </tr>
          <tr id="<%= (row1 % 2 == 1) ? "trdark" : "trclear" %><%row1++;%>"> 
            <td nowrap width="25%" > 
              <div align="right">Participantes de Pool :</div>
            </td>
            <td nowrap width="23%" > 
              <input type="text" readonly name="E01PCMPOL" size="3" maxlength="2" value="<%= pcMant.getE01PCMPOL().trim()%>" onkeypress="enterInteger(event)"></td>
            <td nowrap width="25%" >
              <div align="right">Tasa de Cambio :</div>
            </td>
            <td nowrap width="27%" >
                <eibsinput:text name="pcMant" property="E01PCMEXR" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_RATE %>" readonly="true" />
             </td>
          </tr>
          <tr id="<%= (row1 % 2 == 1) ? "trdark" : "trclear" %><%row1++;%>"> 
            <td nowrap width="25%" > 
              <div align="right">Centro de Costo :</div>
            </td>
            <td nowrap width="23%" > 
              <input type="text" readonly name="E01PCMCN" size="9" maxlength="8" value="<%= pcMant.getE01PCMCCN().trim()%>" onkeypress="enterInteger(event)"></td>
            <td nowrap width="25%" >
              <div align="right">Producto Para Credito :</div>
            </td>
            <td nowrap width="27%" >
              <input type="text" readonly name="E01PCMPRD" size="5" maxlength="4" value="<%= pcMant.getE01PCMPRD().trim()%>" >
            </td>
          </tr>
          <tr id="<%= (row1 % 2 == 1) ? "trdark" : "trclear" %><%row1++;%>"> 
            <td nowrap width="25%" > 
              <div align="right">Producto Para Anticipo :</div>
            </td>
            <td nowrap width="23%" > 
              <input type="text" readonly name="E01PCMANP" size="5" maxlength="4" value="<%= pcMant.getE01PCMANP().trim()%>" >
            </td>
            <td nowrap width="25%" >
              <div align="right">Producto Para Ampliación :</div>
            </td>
            <td nowrap width="27%" >
              <input type="text" readonly name="E01PCMAMP" size="5" maxlength="4" value="<%= pcMant.getE01PCMAMP().trim()%>" >
            </td>
          </tr>

        </table>
      </td>
    </tr>
  </table>  

<table class="tbenter">
<tr>
  <TD>   
   <b>Calculo de Valuación</b>
  </TD>
  <TD>
   <b>Ejecutado</b><input type="checkbox" name="DONEDAT" value="" onclick="showDoneData(this)">    
   <b>Factores</b><input type="checkbox" name="FACTOR" value="" onclick="showFactorData(this)">    
   <b>Producto</b><input type="checkbox" name="PRODUCT" value="" onclick="showProductData(this)">    
  </TD>
  </tr>
</table>
<table class="tbenter" cellpadding=3>
<tr>
 <TD valign=top>
  <h4>Valuación Actual</h4>
  <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing=0 cellpadding=2 width="100%" border="0">
          <tr id="<%= (row1 % 2 == 1) ? "trdark" : "trclear" %><%row1++;%>"> 
            <td nowrap width="40%"> 
              <div align="right">Obra Ejecutada :</div>
            </td>
            <td nowrap width="60%"> 
                <eibsinput:text name="pcMant" property="E01OBREJ1" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="false" />
            </td>
          </tr>
          <tr id="<%= (row1 % 2 == 1) ? "trdark" : "trclear" %><%row1++;%>"> 
            <td nowrap width="40%"> 
              <div align="right">Periodo de Valuación :</div>
            </td>
            <td nowrap width="60%"> 
            	<eibsinput:date name="pcMant" fn_month="E01SCRDFM" fn_day="E01SCRDFD" fn_year="E01SCRDFY" />
				-
            	<eibsinput:date name="pcMant" fn_month="E01SCRDTM" fn_day="E01SCRDTD" fn_year="E01SCRDTY" required="true" />

            </td>
          </tr>
          <tr id="<%= (row1 % 2 == 1) ? "trdark" : "trclear" %><%row1++;%>"> 
            <td nowrap width="40%"> 
              <div align="right">Contrapartida :</div>
            </td>
            <td nowrap width="60%"> 
              <input type="text" name="E01SCROBK" id="E01SCROBK" size="3" maxlength="2" value="<%= pcMant.getE01SCROBK().trim()%>">
              <input type="text" name="E01SCROBR" size="5" maxlength="4" value="<%= pcMant.getE01SCROBR().trim()%>" class="context-menu-help" onKeypress="enterInteger(event)"  onmousedown="init(branchHelp,this.name,document.getElementById('E01SCROBK').value,'','','','')">
              <input type="text" name="E01SCROCY" id="E01SCROCY" size="4" maxlength="3" value="<%= pcMant.getE01SCROCY().trim()%>" class="context-menu-help" onmousedown="init(currencyHelp,this.name,document.getElementById('E01SCROBK').value,'','','','')">
              <input type="text" name="E01SCROGL" size="17" maxlength="16" value="<%= pcMant.getE01SCROGL().trim()%>" onKeypress="enterInteger(event)"  class="context-menu-help" onmousedown="init(ledgerHelp,this.name,document.fgetElementById('E01SCROBK').value,document.getElementById('E01SCROCY').value,'','','')">
              <input type="text" name="E01SCROAC" size="13" maxlength="12" value="<%= pcMant.getE01SCROAC().trim()%>" onKeypress="enterInteger(event)"  class="context-menu-help" onmousedown="init(accountHelp,this.name,document.getElementById('E01SCROBK').value,'','','','RT')">
            </td>
          </tr>
          <tr id="<%= (row1 % 2 == 1) ? "trdark" : "trclear" %><%row1++;%>"> 
            <td nowrap width="40%"> 
              <div align="right">Inversión Previa :</div>
            </td>
            <td nowrap width="60%"> 
                <eibsinput:text name="pcMant" property="E01INVPR1" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="false" />
            </td>
          </tr>
          <tr id="<%= (row1 % 2 == 1) ? "trdark" : "trclear" %><%row1++;%>"> 
            <td nowrap width="40%"> 
              <div align="right">Valuación :</div>
            </td>
            <td nowrap width="60%"> 
               <eibsinput:text name="pcMant" property="E01VALUA1" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="false" />
            </td>
          </tr>
          <tr id="<%= (row1 % 2 == 1) ? "trdark" : "trclear" %><%row1++;%>"> 
            <td nowrap width="40%"> 
              <div align="right">Retención Fiel Cumplimiento :</div>
            </td>
            <td nowrap width="60%"> 
               <eibsinput:text name="pcMant" property="E01RETCU1" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="false" />

              <input type="hidden" name="E01RETCUF" id="E01RETCUF" value="<%= pcMant.getE01RETCUF()%>">
              <input type="radio" name="CE01RETCUF" value="Y" onClick="document.getElementById('E01RETCUF').value='Y'"
			  <%if(pcMant.getE01RETCUF().equals("Y")) out.print("checked");%>>S&iacute; 
              <input type="radio" name="CE01RETCUF" value="" onClick="document.getElementById('E01RETCUF').value='N'"
			  <%if(pcMant.getE01RETCUF().equals("N")) out.print("checked");%>>No

            </td>
          </tr>
          <tr id="<%= (row1 % 2 == 1) ? "trdark" : "trclear" %><%row1++;%>"> 
            <td nowrap width="40%"> 
              <div align="right">Deducciones :</div>
            </td>
            <td nowrap width="60%"> 
                <eibsinput:text name="pcMant" property="E01DEDUC1" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="false" /></td>
          </tr>
          <tr id="<%= (row1 % 2 == 1) ? "trdark" : "trclear" %><%row1++;%>"> 
            <td nowrap width="40%"> 
              <div align="right">Amortización Anticipo :</div>
            </td>
            <td nowrap width="60%"> 
               <eibsinput:text name="pcMant" property="E01AMOAN1" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="false" />
            </td>
          </tr>
          <tr id="<%= (row1 % 2 == 1) ? "trdark" : "trclear" %><%row1++;%>"> 
            <td nowrap width="40%"> 
              <div align="right">Intereses Saldo Anticipo :</div>
            </td>
            <td nowrap width="60%"> 
               <eibsinput:text name="pcMant" property="E01INTAN1" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="false" />
            </td>
          </tr>
          <tr id="<%= (row1 % 2 == 1) ? "trdark" : "trclear" %><%row1++;%>"> 
            <td nowrap width="40%"> 
              <div align="right">Honorarios Inspección :</div>
            </td>
            <td nowrap width="60%"> 
               <eibsinput:text name="pcMant" property="E01HONIN1" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="false" />

              <input type="hidden" name="E01HONINF" id="E01HONINF" value="<%= pcMant.getE01HONINF()%>">
              <input type="radio" name="CE01HONINF" value="Y" onClick="document.getElementById('E01HONINF').value='Y'"
			  <%if(pcMant.getE01HONINF().equals("Y")) out.print("checked");%>>S&iacute; 
              <input type="radio" name="CE01HONINF" value="" onClick="document.getElementById('E01HONINF').value='N'"
			  <%if(pcMant.getE01HONINF().equals("N")) out.print("checked");%>>No

            </td>
          </tr>
          <tr id="<%= (row1 % 2 == 1) ? "trdark" : "trclear" %><%row1++;%>"> 
            <td nowrap width="40%"> 
              <div align="right">Asignación Básica Mensual :</div>
            </td>
            <td nowrap width="60%"> 
                <eibsinput:text name="pcMant" property="E01ASIME1" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="false" />

              <input type="hidden" name="E01ASIMEF" id="E01ASIMEF" value="<%= pcMant.getE01ASIMEF()%>">
              <input type="radio" name="CE01ASIMEF" value="Y" onClick="document.getElementById('E01ASIMEF').value='Y'"
			  <%if(pcMant.getE01ASIMEF().equals("Y")) out.print("checked");%>>S&iacute; 
              <input type="radio" name="CE01ASIMEF" value="" onClick="document.getElementById('E01ASIMEF').value='N'"
			  <%if(pcMant.getE01ASIMEF().equals("N")) out.print("checked");%>>No

            </td>
          </tr>
          <tr id="<%= (row1 % 2 == 1) ? "trdark" : "trclear" %><%row1++;%>"> 
            <td nowrap width="40%"> 
              <div align="right">Comisión Flat Valuación :</div>
            </td>
            <td nowrap width="60%"> 
               <eibsinput:text name="pcMant" property="E01COFLA1" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="false" />

              <input type="hidden" name="E01COFLAF" id="E01COFLAF" value="<%= pcMant.getE01COFLAF()%>">
              <input type="radio" name="CE01COFLAF" value="Y" onClick="document.getElementById('E01COFLAF').value='Y'"
			  <%if(pcMant.getE01COFLAF().equals("Y")) out.print("checked");%>>S&iacute; 
              <input type="radio" name="CE01COFLAF" value="" onClick="document.getElementById('E01COFLAF').value='N'"
			  <%if(pcMant.getE01COFLAF().equals("N")) out.print("checked");%>>No

            </td>
          </tr>
          <tr id="<%= (row1 % 2 == 1) ? "trdark" : "trclear" %><%row1++;%>"> 
            <td nowrap width="40%"> 
              <div align="right">Intereses Saldo Valuación :</div>
            </td>
            <td nowrap width="60%"> 
                <eibsinput:text name="pcMant" property="E01INTVA1" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="false" />
            </td>
          </tr>
          <tr id="<%= (row1 % 2 == 1) ? "trdark" : "trclear" %><%row1++;%>"> 
            <td nowrap width="40%"> 
              <div align="right">Retención Prima Fondo Garantía :</div>
            </td>
            <td nowrap width="60%"> 
               <eibsinput:text name="pcMant" property="E01RETPF1" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="false" />

              <input type="hidden" name="E01RETPFF" id="E01RETPFF" value="<%= pcMant.getE01RETPFF()%>">
              <input type="radio" name="CE01RETPFF" value="Y" onClick="document.getElementById('E01RETPFF').value='Y'"
			  <%if(pcMant.getE01RETPFF().equals("Y")) out.print("checked");%>>S&iacute; 
              <input type="radio" name="CE01RETPFF" value="" onClick="document.getElementById('E01RETPFF').value='N'"
			  <%if(pcMant.getE01RETPFF().equals("N")) out.print("checked");%>>No


            </td>
          </tr>
          <tr id="<%= (row1 % 2 == 1) ? "trdark" : "trclear" %><%row1++;%>"> 
            <td nowrap width="40%"> 
              <div align="right">Importe Neto a Cobrar :</div>
            </td>
            <td nowrap width="60%"> 
               <eibsinput:text name="pcMant" property="E01IMPNE1" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="false" />
            </td>
          </tr>



        </table>
       </td>
      </tr>
    </table>
  </TD>

  <TD valign=top>
    <div id="DONEDATA" style="display:none">
    <h4>Ejecutado Valuaciones</h4>
    <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing=0 cellpadding=2 width="100%" border="0">
          <tr id="<%= (row1 % 2 == 1) ? "trdark" : "trclear" %><%row1++;%>"> 
            <td nowrap width="40%"> 
              <div align="right">Obra Ejecutada :</div>
            </td>
            <td nowrap width="60%"> 
             <eibsinput:text name="pcMant" property="E01OBREJ2" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true" />
            </td>
          </tr>
          <tr id="<%= (row1 % 2 == 1) ? "trdark" : "trclear" %><%row1++;%>"> 
            <td nowrap width="40%"> 
              <div align="right">Hasta :</div>
            </td>
            <td nowrap width="60%"> 
              <input type="text" readonly name="E01SCRFFM" size="3" maxlength="2" value="<%= pcMant.getE01SCRFFM().trim()%>" onkeypress="enterInteger(event)">
              <input type="text" readonly name="E01SCRFFD" size="3" maxlength="2" value="<%= pcMant.getE01SCRFFD().trim()%>" onkeypress="enterInteger(event)">
              <input type="text" readonly name="E01SCRFFY" size="5" maxlength="4" value="<%= pcMant.getE01SCRFFY().trim()%>" onkeypress="enterInteger(event)">
            </td>
          </tr>
          <tr id="<%= (row1 % 2 == 1) ? "trdark" : "trclear" %><%row1++;%>"> 
            <td nowrap width="100%"> 
              <div align="right"> </div>
            </td>
          </tr>
          <tr id="<%= (row1 % 2 == 1) ? "trdark" : "trclear" %><%row1++;%>"> 
            <td nowrap width="40%"> 
              <div align="right">Inversión Previa :</div>
            </td>
            <td nowrap width="60%"> 
              <eibsinput:text name="pcMant" property="E01INVPR2" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true" />
            </td>
          </tr>
          <tr id="<%= (row1 % 2 == 1) ? "trdark" : "trclear" %><%row1++;%>"> 
            <td nowrap width="40%"> 
              <div align="right">Valuación :</div>
            </td>
            <td nowrap width="60%"> 
               <eibsinput:text name="pcMant" property="E01VALUA2" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true" />
            </td>
          </tr>
          <tr id="<%= (row1 % 2 == 1) ? "trdark" : "trclear" %><%row1++;%>"> 
            <td nowrap width="40%"> 
              <div align="right">Retención Fiel Cumplimiento :</div>
            </td>
            <td nowrap width="60%"> 
              <eibsinput:text name="pcMant" property="E01RETCU2" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true" />
            </td>
          </tr>
          <tr id="<%= (row1 % 2 == 1) ? "trdark" : "trclear" %><%row1++;%>"> 
            <td nowrap width="40%"> 
              <div align="right">Deducciones :</div>
            </td>
            <td nowrap width="60%"> 
               <eibsinput:text name="pcMant" property="E01DEDUC2" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true" />
            </td>
          </tr>
          <tr id="<%= (row1 % 2 == 1) ? "trdark" : "trclear" %><%row1++;%>"> 
            <td nowrap width="40%"> 
              <div align="right">Amortización Anticipo :</div>
            </td>
            <td nowrap width="60%"> 
              <eibsinput:text name="pcMant" property="E01AMOAN2" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true" /></td>
          </tr>
          <tr id="<%= (row1 % 2 == 1) ? "trdark" : "trclear" %><%row1++;%>"> 
            <td nowrap width="40%"> 
              <div align="right">Intereses Saldo Anticipo :</div>
            </td>
            <td nowrap width="60%"> 
              <eibsinput:text name="pcMant" property="E01INTAN2" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true" />
            </td>
          </tr>
          <tr id="<%= (row1 % 2 == 1) ? "trdark" : "trclear" %><%row1++;%>"> 
            <td nowrap width="40%"> 
              <div align="right">Honorarios Inspección :</div>
            </td>
            <td nowrap width="60%"> 
              <eibsinput:text name="pcMant" property="E01HONIN2" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true" />
            </td>
          </tr>
          <tr id="<%= (row1 % 2 == 1) ? "trdark" : "trclear" %><%row1++;%>"> 
            <td nowrap width="40%"> 
              <div align="right">Asignación Básica Mensual :</div>
            </td>
            <td nowrap width="60%"> 
              <eibsinput:text name="pcMant" property="E01ASIME2" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true" />
            </td>
          </tr>
          <tr id="<%= (row1 % 2 == 1) ? "trdark" : "trclear" %><%row1++;%>"> 
            <td nowrap width="40%"> 
              <div align="right">Comisión Flat Valuación :</div>
            </td>
            <td nowrap width="60%"> 
              <eibsinput:text name="pcMant" property="E01COFLA2" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true" />
            </td>
          </tr>
          <tr id="<%= (row1 % 2 == 1) ? "trdark" : "trclear" %><%row1++;%>"> 
            <td nowrap width="40%"> 
              <div align="right">Intereses Saldo Valuación :</div>
            </td>
            <td nowrap width="60%"> 
               <eibsinput:text name="pcMant" property="E01INTVA2" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true" />
            </td>
          </tr>
          <tr id="<%= (row1 % 2 == 1) ? "trdark" : "trclear" %><%row1++;%>"> 
            <td nowrap width="40%"> 
              <div align="right">Retención Prima Fondo Garantía :</div>
            </td>
            <td nowrap width="60%"> 
                <eibsinput:text name="pcMant" property="E01RETPF2" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true" />
            </td>
          </tr>
          <tr id="<%= (row1 % 2 == 1) ? "trdark" : "trclear" %><%row1++;%>"> 
            <td nowrap width="40%"> 
              <div align="right">Importe Neto a Cobrar :</div>
            </td>
            <td nowrap width="60%"> 
               <eibsinput:text name="pcMant" property="E01IMPNE2" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true" />
            </td>
          </tr>



        </table>
       </td>
      </tr>
  	</table>
   <p>
   </div>
  </TD>




<TR>
  <TD valign=top>
    <div id="FACTORDATA" style="display:none">
    <h4>Cálculo de Factores</h4>
    <table class="tableinfo">
     <tr > 
      <td nowrap>    
        <table cellspacing=0 cellpadding=2 width="100%" border="0">
          <tr id="<%= (row1 % 2 == 1) ? "trdark" : "trclear" %><%row1++;%>"> 
            <td nowrap width="40%"> 
              <div align="right">Amortización Anticipo :</div>
            </td>
            <td nowrap width="60%"> 
      			<eibsinput:text name="pcMant" property="E01PCMFAP" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT_REVAL %>" readonly="true" />
            </td>
          </tr>
          <tr id="<%= (row1 % 2 == 1) ? "trdark" : "trclear" %><%row1++;%>"> 
            <td nowrap width="40%"> 
              <div align="right">Inversión Previa :</div>
            </td>
            <td nowrap width="60%"> 
       			<eibsinput:text name="pcMant" property="E01PCMINP" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true" />
            </td>
          </tr>
          <tr id="<%= (row1 % 2 == 1) ? "trdark" : "trclear" %><%row1++;%>"> 
            <td nowrap width="40%"> 
              <div align="right">Factor Inversión Previa :</div>
            </td>
            <td nowrap width="60%"> 
      			<eibsinput:text name="pcMant" property="E01PCMFIP" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT_REVAL %>" readonly="true" />
            </td>
          </tr>
          <tr id="<%= (row1 % 2 == 1) ? "trdark" : "trclear" %><%row1++;%>"> 
            <td nowrap width="40%"> 
              <div align="right">Honorarios Inspección :</div>
            </td>
            <td nowrap width="60%"> 
       			<eibsinput:text name="pcMant" property="E01PCMTHO" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true" />
            </td>
          </tr>
          <tr id="<%= (row1 % 2 == 1) ? "trdark" : "trclear" %><%row1++;%>"> 
            <td nowrap width="40%"> 
              <div align="right">Asignación Básica Mensual :</div>
            </td>
            <td nowrap width="60%"> 
       			<eibsinput:text name="pcMant" property="E01PCMABM" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true" />
            </td>
          </tr>
          <tr id="<%= (row1 % 2 == 1) ? "trdark" : "trclear" %><%row1++;%>"> 
            <td nowrap width="40%"> 
              <div align="right">Factor Honorarios :</div>
            </td>
            <td nowrap width="60%"> 
       			<eibsinput:text name="pcMant" property="E01PCMFHO" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT_REVAL %>" readonly="true" />
            </td>
          </tr>
          <tr id="<%= (row1 % 2 == 1) ? "trdark" : "trclear" %><%row1++;%>"> 
            <td nowrap width="40%"> 
              <div align="right">Volumen Global de Ventas :</div>
            </td>
            <td nowrap width="60%"> 
       			<eibsinput:text name="pcMant" property="E01PCMVGV" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true" /></td>
          </tr>
          <tr id="<%= (row1 % 2 == 1) ? "trdark" : "trclear" %><%row1++;%>"> 
            <td nowrap width="40%"> 
              <div align="right">Alícuota de Amortización :</div>
            </td>
            <td nowrap width="60%"> 
      			<eibsinput:text name="pcMant" property="E01PCMALA" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT_REVAL %>" readonly="true" />
            </td>
          </tr>
          <tr id="<%= (row1 % 2 == 1) ? "trdark" : "trclear" %><%row1++;%>"> 
            <td nowrap width="40%"> 
              <div align="right">Monto a Descontar por Inmueble :</div>
            </td>
            <td nowrap width="60%"> 
      			<eibsinput:text name="pcMant" property="E01PCMMDI" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true" />
            </td>
          </tr>

        </table>
                
      	</td>
      </tr>
  	</table>
   <p>
   </div>
  </TD>

  <TD valign=top>
    <div id="PRODUCTDATA" style="display:none">
    <h4>Información Adicional de Productos</h4>
    <table class="tableinfo">
     <tr > 
      <td nowrap>    
        <table cellspacing=0 cellpadding=2 width="100%" border="0">
          <tr id="<%= (row1 % 2 == 1) ? "trdark" : "trclear" %><%row1++;%>"> 
            <td nowrap width="39%"> 
              <div align="right">Fondo Nacional de Vivienda :</div>
            </td>
            <td nowrap width="61%">
         			<eibsinput:text name="pcMant" property="E01APACNV" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_INTEREST %>" readonly="true" />
            </td>
          </tr>
          <tr id="<%= (row1 % 2 == 1) ? "trdark" : "trclear" %><%row1++;%>"> 
            <td nowrap width="39%">
              <div align="right">Anticipo :</div>
            </td>
            <td nowrap width="61%">
       			<eibsinput:text name="pcMant" property="E01APAANT" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_INTEREST %>" readonly="true" />
            </td>
          </tr>
          <tr id="<%= (row1 % 2 == 1) ? "trdark" : "trclear" %><%row1++;%>"> 
            <td nowrap width="39%"> 
              <div align="right">Prima Fondo Garantía :</div>
            </td>
            <td nowrap width="61%">
        			<eibsinput:text name="pcMant" property="E01APAPFG" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_INTEREST %>" readonly="true" />
            </td>
          </tr>
          <tr id="<%= (row1 % 2 == 1) ? "trdark" : "trclear" %><%row1++;%>"> 
            <td nowrap width="39%"> 
              <div align="right">Fianza Garantía :</div>
            </td>
            <td nowrap width="61%">
       			<eibsinput:text name="pcMant" property="E01APAGRF" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_INTEREST %>" readonly="true" />
            </td>
          </tr>
          <tr id="<%= (row1 % 2 == 1) ? "trdark" : "trclear" %><%row1++;%>"> 
            <td nowrap width="39%"> 
              <div align="right">Honorarios Inspección :</div>
            </td>
            <td nowrap width="61%">
         			<eibsinput:text name="pcMant" property="E01APAHOI" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_INTEREST %>" readonly="true" />
            </td>
          </tr>
          <tr id="<%= (row1 % 2 == 1) ? "trdark" : "trclear" %><%row1++;%>"> 
            <td nowrap width="39%"> 
              <div align="right">Comisión Valuación :</div>
            </td>
            <td nowrap width="61%">
       			<eibsinput:text name="pcMant" property="E01APAFLA" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_INTEREST %>" readonly="true" />
            </td>
          </tr>
          <tr id="<%= (row1 % 2 == 1) ? "trdark" : "trclear" %><%row1++;%>"> 
            <td nowrap width="39%"> 
              <div align="right">Producto Crédito :</div>
            </td>
            <td nowrap width="61%">
        			<eibsinput:text name="pcMant" property="E01APAPRD" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_PRODUCT %>" readonly="true" />
            </td>
          </tr>
          <tr id="<%= (row1 % 2 == 1) ? "trdark" : "trclear" %><%row1++;%>"> 
            <td nowrap width="39%"> 
              <div align="right">Producto Anticipo :</div>
            </td>
            <td nowrap width="61%">
        			<eibsinput:text name="pcMant" property="E01APAANP" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_PRODUCT %>" readonly="true" />
            </td>
          </tr>
          <tr id="<%= (row1 % 2 == 1) ? "trdark" : "trclear" %><%row1++;%>"> 
            <td nowrap width="39%"> 
              <div align="right">Producto Ampliación :</div>
            </td>
            <td nowrap width="61%">
          			<eibsinput:text name="pcMant" property="E01APAAMP" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_PRODUCT %>" readonly="true" />
            </td>
          </tr>

        </table>
                
      	</td>
      </tr>
  	</table>
   <p>
   </div>
  </TD>
</TR>


 
</table>
  


  <p>
  <div align="center"> 
    <input id="EIBSBTN" type=submit name="Submit" value="Enviar">
  </div>
</form>
</body>
</html>
