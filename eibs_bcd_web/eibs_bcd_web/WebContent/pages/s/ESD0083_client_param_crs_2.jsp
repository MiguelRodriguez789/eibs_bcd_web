<html>
<head>
<title>Parametros Clientes - CRS</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@ page import = "datapro.eibs.master.Util" %>
<%@ page import="com.datapro.constants.EibsFields"%>
<%@ page import = "java.io.*,java.net.*,datapro.eibs.beans.*,datapro.eibs.master.*,java.math.*" %>


<jsp:useBean id= "client" class= "datapro.eibs.beans.ESD008302Message"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>

<SCRIPT Language="Javascript">


function goAction() {
    document.forms[0].EIBSBTN.disabled = true;
	document.forms[0].submit();
}


function finish(){
 self.window.location.href = "<%=request.getContextPath()%>/pages/background.jsp";
}

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
   
Boolean isReadOnly = false;
String disabled = "";
String read = "";
   
if (!(userPO.getPurpose().equals("NEW"))) { 
	read = " readonly ";
	disabled = " disabled";
	isReadOnly = true;
}

%> 
<h3 align="center">Parámetros Clientes - CRS


<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="client_param_crs_2.jsp, ESD0083"></h3>
<hr size="4">
 <FORM METHOD="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSESD0085" >
  <p>
    <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="202">
  </p>

<%int row = 0; %>


<H4>Información Básica </H4>
      <table  class="tableinfo">
         <tr bordercolor="#FFFFFF"> 
            <td nowrap> 
               <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
	           <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
                     <td nowrap width="40%"> 
                        <div align="right">Pais :</div>
                     </td>
                     <td nowrap width="60%"> 
                        <eibsinput:cnofc name="client" property="E02CFACTY" value="<%=client.getE02CFACTY()%>" required="false" flag="03" fn_code="E02CFACTY" fn_description="D02CFACTY" readonly="<%=isReadOnly %>" />
                        <eibsinput:text name="client" property="D02CFACTY" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true"/>
                   </td>
                  </tr> 
               </table>
            </td>
         </tr> 
      </table>

<H4>Información Básica CRS Personas Naturales</H4>
      <table  class="tableinfo">
         <tr bordercolor="#FFFFFF"> 
            <td nowrap> 
               <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
	           <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
                     <td nowrap colspan='4' align="center"><b>Clasificación CRS</b></td>
                  </tr> 
            
	           <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
                    <td nowrap width="20%"> 
                        <div align="right">Sin Indicia:</div>
                    </td>
                    <td nowrap width="30%">
                        <eibsinput:cnofc name="client" property="E02CRSNUN" value="<%=client.getE02CRSNUN()%>" required="false" flag="IF" fn_code="E02CRSNUN" fn_description="D02CRSNUN" readonly="false" />
                        <eibsinput:text name="client" property="D02CRSNUN" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true"/>
                    </td>

                    <td nowrap width="20%"> 
                       <div align="right">Clasificación :</div>
                    </td>
                    <td nowrap width="30%">
                        <input type="radio" name="E02CRSST1" value="2"
                        <%if (client.getE02CRSST1().equals("2")) out.print("checked"); %>> Definitiva
                        <input type="radio" name="E02CRSST1" value="3" 
                        <%if (client.getE02CRSST1().equals("3")) out.print("checked"); %>> Temporal
                   </td>
                  </tr>     
            
	           <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
                    <td nowrap width="20%"> 
                       <div align="right">Evaluación :</div>
                    </td>
                    <td nowrap width="30%">
                        <eibsinput:cnofc name="client" property="E02CRSEVN" value="<%=client.getE02CRSEVN()%>" required="false" flag="IF" fn_code="E02CRSEVN" fn_description="D02CRSEVN" readonly="false" />
                        <eibsinput:text name="client" property="D02CRSEVN" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true"/>
                    </td>
                    <td nowrap width="20%"> 
                       <div align="right">Clasificación :</div>
                    </td>
                    <td nowrap width="30%">
                        <input type="radio" name="E02CRSST3" value="2"
                        <%if (client.getE02CRSST3().equals("2")) out.print("checked"); %>> Definitiva
                        <input type="radio" name="E02CRSST3" value="3" 
                        <%if (client.getE02CRSST3().equals("3")) out.print("checked"); %>> Temporal
                   </td>
	           </tr>
	           <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
	           
                    <td nowrap width="20%"> 
                       <div align="right">Con Indicia:</div>
                    </td>
                    <td nowrap width="30%">
                        <eibsinput:cnofc name="client" property="E02CRSURN" value="<%=client.getE02CRSURN()%>" required="false" flag="IF" fn_code="E02CRSURN" fn_description="D02CRSURN" readonly="false" />
                        <eibsinput:text name="client" property="D02CRSURN" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true"/>
                    </td>
                    <td nowrap width="20%"> 
                       <div align="right">Clasificación :</div>
                    </td>
                    <td nowrap width="30%">
                        <input type="radio" name="E02CRSST2" value="2"
                        <%if (client.getE02CRSST2().equals("2")) out.print("checked"); %>> Definitiva
                        <input type="radio" name="E02CRSST2" value="3" 
                        <%if (client.getE02CRSST2().equals("3")) out.print("checked"); %>> Temporal
                   </td>
	           </tr>
               </table>
            </td>
         </tr> 
      </table>

<% if (client.getE02CFACTY().equals("CO")){%>

<H4>Información Básica CRS Personas Jurídicas</H4>

   <table  class="tableinfo">
      <tr bordercolor="#FFFFFF"> 
         <td nowrap> 
            <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
               <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
                  <td nowrap colspan='3' align="center"><b>Clasificación CRS</b></td>
               </tr> 
	           <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
                  <td nowrap width="20%"> 
                     <div align="right"><b>Condición 0 :</b></div>
                  </td>
                  <td nowrap width="30%">
                     <div align="right">Clasificacion CRS :</div>
                  </td>
                  <td nowrap width="50%">
                      <eibsinput:cnofc name="client" property="E02CRSCP0" value="<%=client.getE02CRSCP0()%>" required="false" flag="IF" fn_code="E02CRSCP0" fn_description="D02CRSCP0" readonly="false" />
                      <eibsinput:text name="client" property="D02CRSCP0" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true"/>
                  </td>
               </tr> 
	           <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
                  <td nowrap width="20%"> 
                     <div align="right"></div>
                  </td>
                  <td nowrap width="30%">
                     <div align="right">Clasificación :</div>
                  </td>
                  <td nowrap width="50%">
                        <input type="radio" name="E02CRSSP0" value="2"
                        <%if (client.getE02CRSSP0().equals("2")) out.print("checked"); %>> Definitiva
                        <input type="radio" name="E02CRSSP0" value="3" 
                        <%if (client.getE02CRSSP0().equals("3")) out.print("checked"); %>> Temporal
                  </td>
	           </tr>     
	           <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
                  <td nowrap width="20%"> 
                     <div align="right"><b>Condición 1 :</b></div>
                  </td>
                  <td nowrap width="30%">
                     <div align="right">Entidad Financiera :</div>
                  </td>
                  <td nowrap width="50%">
                        <input type="radio" name="E02CRSCF1" value="Y"
                        <%if (client.getE02CRSCF1().equals("Y")) out.print("checked"); %>> Si
                        <input type="radio" name="E02CRSCF1" value="N" 
                        <%if (client.getE02CRSCF1().equals("N")) out.print("checked"); %>> No
                        <input type="radio" name="E02CRSCF1" value="A" 
                        <%if (client.getE02CRSCF1().equals("A")) out.print("checked"); %>> N/A
                  </td>
               </tr> 
	           <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
                  <td nowrap width="20%"> 
                     <div align="right"></div>
                  </td>
                  <td nowrap width="30%"> 
                     <div align="right">Cotiza en bolsa :</div>
                  </td>
                  <td nowrap width="50%">                       
                        <input type="radio" name="E02CRSBO1" value="Y"
                        <%if (client.getE02CRSBO1().equals("Y")) out.print("checked"); %>> Si
                        <input type="radio" name="E02CRSBO1" value="N" 
                        <%if (client.getE02CRSBO1().equals("N")) out.print("checked"); %>> No
                         <input type="radio" name="E02CRSBO1" value="A" 
                        <%if (client.getE02CRSBO1().equals("A")) out.print("checked"); %>> N/A
                   </td>                    
               </tr> 
	           <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
                  <td nowrap width="20%"> 
                     <div align="right"></div>
                  </td>
                  <td nowrap width="30%"> 
                     <div align="right">Mas del 50% de sus ingresos provienen de<br> fuentes financieras?</div>
                  </td>
                  <td nowrap width="50%">
                        <input type="radio" name="E02CRSIN1" value="Y"
                        <%if (client.getE02CRSIN1().equals("Y")) out.print("checked"); %>> Si
                        <input type="radio" name="E02CRSIN1" value="N" 
                        <%if (client.getE02CRSIN1().equals("N")) out.print("checked"); %>> No
                        <input type="radio" name="E02CRSIN1" value="A" 
                        <%if (client.getE02CRSIN1().equals("A")) out.print("checked"); %>> N/A
                  </td>
               </tr> 
	           <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
                  <td nowrap width="20%"> 
                     <div align="right"></div>
                  </td>
                  <td nowrap width="30%"> 
                     <div align="right">Clasificación CRS:</div>
                  </td>
                  <td nowrap width="50%">
                     <eibsinput:cnofc name="client" property="E02CRSCP1" value="<%=client.getE02CRSCP1()%>" required="false" flag="IF" fn_code="E02CRSCP1" fn_description="D02CRSCP1" readonly="false" />
                     <eibsinput:text name="client" property="D02CRSCP1" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true"/>
                  </td>
	           </tr>
	           <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
                  <td nowrap width="20%"> 
                     <div align="right"></div>
                  </td>
                  <td nowrap width="30%">
                     <div align="right">Clasificación :</div>
                  </td>
                  <td nowrap width="50%">
                        <input type="radio" name="E02CRSSP1" value="2"
                        <%if (client.getE02CRSSP1().equals("2")) out.print("checked"); %>> Definitiva
                        <input type="radio" name="E02CRSSP1" value="3" 
                        <%if (client.getE02CRSSP1().equals("3")) out.print("checked"); %>> Temporal
                  </td>
	           </tr>     
	           <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
                  <td nowrap width="20%"> 
                     <div align="right"><b>Condición 2 :</b></div>
                  </td>
                  <td nowrap width="30%">
                     <div align="right">Entidad Financiera :</div>
                  </td>
                  <td nowrap width="50%">
                        <input type="radio" name="E02CRSCF2" value="Y"
                        <%if (client.getE02CRSCF2().equals("Y")) out.print("checked"); %>> Si
                        <input type="radio" name="E02CRSCF2" value="N" 
                        <%if (client.getE02CRSCF2().equals("N")) out.print("checked"); %>> No
                        <input type="radio" name="E02CRSCF2" value="A" 
                        <%if (client.getE02CRSCF2().equals("A")) out.print("checked"); %>> N/A
                  </td>
               </tr> 
	           <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
                  <td nowrap width="20%"> 
                     <div align="right"></div>
                  </td>
                  <td nowrap width="30%"> 
                     <div align="right">Cotiza en bolsa :</div>
                  </td>
                  <td nowrap width="50%">                       
                        <input type="radio" name="E02CRSBO2" value="Y"
                        <%if (client.getE02CRSBO2().equals("Y")) out.print("checked"); %>> Si
                        <input type="radio" name="E02CRSBO2" value="N" 
                        <%if (client.getE02CRSBO2().equals("N")) out.print("checked"); %>> No
                         <input type="radio" name="E02CRSBO2" value="A" 
                        <%if (client.getE02CRSBO2().equals("A")) out.print("checked"); %>> N/A
                   </td>                    
               </tr> 
	           <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
                  <td nowrap width="20%"> 
                     <div align="right"></div>
                  </td>
                  <td nowrap width="30%"> 
                     <div align="right">Mas del 50% de sus ingresos provienen de<br> fuentes financieras?</div>
                  </td>
                  <td nowrap width="50%">
                        <input type="radio" name="E02CRSIN2" value="Y"
                        <%if (client.getE02CRSIN2().equals("Y")) out.print("checked"); %>> Si
                        <input type="radio" name="E02CRSIN2" value="N" 
                        <%if (client.getE02CRSIN2().equals("N")) out.print("checked"); %>> No
                        <input type="radio" name="E02CRSIN2" value="A" 
                        <%if (client.getE02CRSIN2().equals("A")) out.print("checked"); %>> N/A
                  </td>
               </tr> 
	           <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
                  <td nowrap width="20%"> 
                     <div align="right"></div>
                  </td>
                  <td nowrap width="30%"> 
                     <div align="right">Clasificación CRS:</div>
                  </td>
                  <td nowrap width="50%">
                     <eibsinput:cnofc name="client" property="E02CRSCP2" value="<%=client.getE02CRSCP2()%>" required="false" flag="IF" fn_code="E02CRSCP2" fn_description="D02CRSCP2" readonly="false" />
                     <eibsinput:text name="client" property="D02CRSCP2" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true"/>
                  </td>
	           </tr>
	           <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
                  <td nowrap width="20%"> 
                     <div align="right"></div>
                  </td>
                  <td nowrap width="30%">
                     <div align="right">Clasificación :</div>
                  </td>
                  <td nowrap width="50%">
                        <input type="radio" name="E02CRSSP2" value="2"
                        <%if (client.getE02CRSSP2().equals("2")) out.print("checked"); %>> Definitiva
                        <input type="radio" name="E02CRSSP2" value="3" 
                        <%if (client.getE02CRSSP2().equals("3")) out.print("checked"); %>> Temporal
                  </td>
	           </tr>     
	           <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
                  <td nowrap width="20%"> 
                     <div align="right"><b>Condición 3 :</b></div>
                  </td>
                  <td nowrap width="30%">
                     <div align="right">Entidad Financiera :</div>
                  </td>
                  <td nowrap width="50%">
                        <input type="radio" name="E02CRSCF3" value="Y"
                        <%if (client.getE02CRSCF3().equals("Y")) out.print("checked"); %>> Si
                        <input type="radio" name="E02CRSCF3" value="N" 
                        <%if (client.getE02CRSCF3().equals("N")) out.print("checked"); %>> No
                        <input type="radio" name="E02CRSCF3" value="A" 
                        <%if (client.getE02CRSCF3().equals("A")) out.print("checked"); %>> N/A
                  </td>
               </tr> 
	           <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
                  <td nowrap width="20%"> 
                     <div align="right"></div>
                  </td>
                  <td nowrap width="30%"> 
                     <div align="right">Cotiza en bolsa :</div>
                  </td>
                  <td nowrap width="50%">                       
                        <input type="radio" name="E02CRSBO3" value="Y"
                        <%if (client.getE02CRSBO3().equals("Y")) out.print("checked"); %>> Si
                        <input type="radio" name="E02CRSBO3" value="N" 
                        <%if (client.getE02CRSBO3().equals("N")) out.print("checked"); %>> No
                         <input type="radio" name="E02CRSBO3" value="A" 
                        <%if (client.getE02CRSBO3().equals("A")) out.print("checked"); %>> N/A
                   </td>                    
               </tr> 
	           <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
                  <td nowrap width="20%"> 
                     <div align="right"></div>
                  </td>
                  <td nowrap width="30%"> 
                     <div align="right">Mas del 50% de sus ingresos provienen de<br> fuentes financieras?</div>
                  </td>
                  <td nowrap width="50%">
                        <input type="radio" name="E02CRSIN3" value="Y"
                        <%if (client.getE02CRSIN3().equals("Y")) out.print("checked"); %>> Si
                        <input type="radio" name="E02CRSIN3" value="N" 
                        <%if (client.getE02CRSIN3().equals("N")) out.print("checked"); %>> No
                        <input type="radio" name="E02CRSIN3" value="A" 
                        <%if (client.getE02CRSIN3().equals("A")) out.print("checked"); %>> N/A
                  </td>
               </tr> 
	           <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
                  <td nowrap width="20%"> 
                     <div align="right"></div>
                  </td>
                  <td nowrap width="30%"> 
                     <div align="right">Clasificación CRS:</div>
                  </td>
                  <td nowrap width="50%">
                     <eibsinput:cnofc name="client" property="E02CRSCP3" value="<%=client.getE02CRSCP3()%>" required="false" flag="IF" fn_code="E02CRSCP3" fn_description="D02CRSCP3" readonly="false" />
                     <eibsinput:text name="client" property="D02CRSCP3" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true"/>
                  </td>
	           </tr>
	           <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
                  <td nowrap width="20%"> 
                     <div align="right"></div>
                  </td>
                  <td nowrap width="30%">
                     <div align="right">Clasificación :</div>
                  </td>
                  <td nowrap width="50%">
                        <input type="radio" name="E02CRSSP3" value="2"
                        <%if (client.getE02CRSSP3().equals("2")) out.print("checked"); %>> Definitiva
                        <input type="radio" name="E02CRSSP3" value="3" 
                        <%if (client.getE02CRSSP3().equals("3")) out.print("checked"); %>> Temporal
                  </td>
	           </tr>     
	           <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
                  <td nowrap width="20%"> 
                     <div align="right"><b>Condición 4 :</b></div>
                  </td>
                  <td nowrap width="30%">
                     <div align="right">Entidad Financiera :</div>
                  </td>
                  <td nowrap width="50%">
                        <input type="radio" name="E02CRSCF4" value="Y"
                        <%if (client.getE02CRSCF4().equals("Y")) out.print("checked"); %>> Si
                        <input type="radio" name="E02CRSCF4" value="N" 
                        <%if (client.getE02CRSCF4().equals("N")) out.print("checked"); %>> No
                        <input type="radio" name="E02CRSCF4" value="A" 
                        <%if (client.getE02CRSCF4().equals("A")) out.print("checked"); %>> N/A
                  </td>
               </tr> 
	           <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
                  <td nowrap width="20%"> 
                     <div align="right"></div>
                  </td>
                  <td nowrap width="30%"> 
                     <div align="right">Cotiza en bolsa :</div>
                  </td>
                  <td nowrap width="50%">                       
                        <input type="radio" name="E02CRSBO4" value="Y"
                        <%if (client.getE02CRSBO4().equals("Y")) out.print("checked"); %>> Si
                        <input type="radio" name="E02CRSBO4" value="N" 
                        <%if (client.getE02CRSBO4().equals("N")) out.print("checked"); %>> No
                         <input type="radio" name="E02CRSBO4" value="A" 
                        <%if (client.getE02CRSBO4().equals("A")) out.print("checked"); %>> N/A
                   </td>                    
               </tr> 
	           <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
                  <td nowrap width="20%"> 
                     <div align="right"></div>
                  </td>
                  <td nowrap width="30%"> 
                     <div align="right">Mas del 50% de sus ingresos provienen de<br> fuentes financieras?</div>
                  </td>
                  <td nowrap width="50%">
                        <input type="radio" name="E02CRSIN4" value="Y"
                        <%if (client.getE02CRSIN4().equals("Y")) out.print("checked"); %>> Si
                        <input type="radio" name="E02CRSIN4" value="N" 
                        <%if (client.getE02CRSIN4().equals("N")) out.print("checked"); %>> No
                        <input type="radio" name="E02CRSIN4" value="A" 
                        <%if (client.getE02CRSIN4().equals("A")) out.print("checked"); %>> N/A
                  </td>
               </tr> 
	           <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
                  <td nowrap width="20%"> 
                     <div align="right"></div>
                  </td>
                  <td nowrap width="30%"> 
                     <div align="right">Clasificación CRS:</div>
                  </td>
                  <td nowrap width="50%">
                     <eibsinput:cnofc name="client" property="E02CRSCP4" value="<%=client.getE02CRSCP4()%>" required="false" flag="IF" fn_code="E02CRSCP4" fn_description="D02CRSCP4" readonly="false" />
                     <eibsinput:text name="client" property="D02CRSCP4" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true"/>
                  </td>
	           </tr>
	           <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
                  <td nowrap width="20%"> 
                     <div align="right"></div>
                  </td>
                  <td nowrap width="30%">
                     <div align="right">Clasificación :</div>
                  </td>
                  <td nowrap width="50%">
                        <input type="radio" name="E02CRSSP4" value="2"
                        <%if (client.getE02CRSSP4().equals("2")) out.print("checked"); %>> Definitiva
                        <input type="radio" name="E02CRSSP4" value="3" 
                        <%if (client.getE02CRSSP4().equals("3")) out.print("checked"); %>> Temporal
                  </td>
	           </tr>     
	           <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
                  <td nowrap width="20%"> 
                     <div align="right"><b>Condición 5 :</b></div>
                  </td>
                  <td nowrap width="30%">
                     <div align="right">Entidad Financiera :</div>
                  </td>
                  <td nowrap width="50%">
                        <input type="radio" name="E02CRSCF5" value="Y"
                        <%if (client.getE02CRSCF5().equals("Y")) out.print("checked"); %>> Si
                        <input type="radio" name="E02CRSCF5" value="N" 
                        <%if (client.getE02CRSCF5().equals("N")) out.print("checked"); %>> No
                        <input type="radio" name="E02CRSCF5" value="A" 
                        <%if (client.getE02CRSCF5().equals("A")) out.print("checked"); %>> N/A
                  </td>
               </tr> 
	           <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
                  <td nowrap width="20%"> 
                     <div align="right"></div>
                  </td>
                  <td nowrap width="30%"> 
                     <div align="right">Cotiza en bolsa :</div>
                  </td>
                  <td nowrap width="50%">                       
                        <input type="radio" name="E02CRSBO5" value="Y"
                        <%if (client.getE02CRSBO5().equals("Y")) out.print("checked"); %>> Si
                        <input type="radio" name="E02CRSBO5" value="N" 
                        <%if (client.getE02CRSBO5().equals("N")) out.print("checked"); %>> No
                         <input type="radio" name="E02CRSBO5" value="A" 
                        <%if (client.getE02CRSBO5().equals("A")) out.print("checked"); %>> N/A
                   </td>                    
               </tr> 
	           <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
                  <td nowrap width="20%"> 
                     <div align="right"></div>
                  </td>
                  <td nowrap width="30%"> 
                     <div align="right">Mas del 50% de sus ingresos provienen de<br> fuentes financieras?</div>
                  </td>
                  <td nowrap width="50%">
                        <input type="radio" name="E02CRSIN5" value="Y"
                        <%if (client.getE02CRSIN5().equals("Y")) out.print("checked"); %>> Si
                        <input type="radio" name="E02CRSIN5" value="N" 
                        <%if (client.getE02CRSIN5().equals("N")) out.print("checked"); %>> No
                        <input type="radio" name="E02CRSIN5" value="A" 
                        <%if (client.getE02CRSIN5().equals("A")) out.print("checked"); %>> N/A
                  </td>
               </tr> 
	           <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
                  <td nowrap width="20%"> 
                     <div align="right"></div>
                  </td>
                  <td nowrap width="30%"> 
                     <div align="right">Clasificación CRS:</div>
                  </td>
                  <td nowrap width="50%">
                     <eibsinput:cnofc name="client" property="E02CRSCP5" value="<%=client.getE02CRSCP5()%>" required="false" flag="IF" fn_code="E02CRSCP5" fn_description="D02CRSCP5" readonly="false" />
                     <eibsinput:text name="client" property="D02CRSCP5" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true"/>
                  </td>
	           </tr>
	           <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
                  <td nowrap width="20%"> 
                     <div align="right"></div>
                  </td>
                  <td nowrap width="30%">
                     <div align="right">Clasificación :</div>
                  </td>
                  <td nowrap width="50%">
                        <input type="radio" name="E02CRSSP5" value="2"
                        <%if (client.getE02CRSSP5().equals("2")) out.print("checked"); %>> Definitiva
                        <input type="radio" name="E02CRSSP5" value="3" 
                        <%if (client.getE02CRSSP5().equals("3")) out.print("checked"); %>> Temporal
                  </td>
	           </tr>     
	           <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
                  <td nowrap width="20%"> 
                     <div align="right"><b>Condición 6 :</b></div>
                  </td>
                  <td nowrap width="30%">
                     <div align="right">Entidad Financiera :</div>
                  </td>
                  <td nowrap width="50%">
                        <input type="radio" name="E02CRSCF6" value="Y"
                        <%if (client.getE02CRSCF6().equals("Y")) out.print("checked"); %>> Si
                        <input type="radio" name="E02CRSCF6" value="N" 
                        <%if (client.getE02CRSCF6().equals("N")) out.print("checked"); %>> No
                        <input type="radio" name="E02CRSCF6" value="A" 
                        <%if (client.getE02CRSCF6().equals("A")) out.print("checked"); %>> N/A
                  </td>
               </tr> 
	           <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
                  <td nowrap width="20%"> 
                     <div align="right"></div>
                  </td>
                  <td nowrap width="30%"> 
                     <div align="right">Cotiza en bolsa :</div>
                  </td>
                  <td nowrap width="50%">                       
                        <input type="radio" name="E02CRSBO6" value="Y"
                        <%if (client.getE02CRSBO6().equals("Y")) out.print("checked"); %>> Si
                        <input type="radio" name="E02CRSBO6" value="N" 
                        <%if (client.getE02CRSBO6().equals("N")) out.print("checked"); %>> No
                         <input type="radio" name="E02CRSBO6" value="A" 
                        <%if (client.getE02CRSBO6().equals("A")) out.print("checked"); %>> N/A
                   </td>                    
               </tr> 
	           <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
                  <td nowrap width="20%"> 
                     <div align="right"></div>
                  </td>
                  <td nowrap width="30%"> 
                     <div align="right">Mas del 50% de sus ingresos provienen de<br> fuentes financieras?</div>
                  </td>
                  <td nowrap width="50%">
                        <input type="radio" name="E02CRSIN6" value="Y"
                        <%if (client.getE02CRSIN6().equals("Y")) out.print("checked"); %>> Si
                        <input type="radio" name="E02CRSIN6" value="N" 
                        <%if (client.getE02CRSIN6().equals("N")) out.print("checked"); %>> No
                        <input type="radio" name="E02CRSIN6" value="A" 
                        <%if (client.getE02CRSIN6().equals("A")) out.print("checked"); %>> N/A
                  </td>
               </tr> 
	           <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
                  <td nowrap width="20%"> 
                     <div align="right"></div>
                  </td>
                  <td nowrap width="30%"> 
                     <div align="right">Clasificación CRS:</div>
                  </td>
                  <td nowrap width="50%">
                     <eibsinput:cnofc name="client" property="E02CRSCP6" value="<%=client.getE02CRSCP6()%>" required="false" flag="IF" fn_code="E02CRSCP6" fn_description="D02CRSCP6" readonly="false" />
                     <eibsinput:text name="client" property="D02CRSCP6" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true"/>
                  </td>
	           </tr>
	           <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
                  <td nowrap width="20%"> 
                     <div align="right"></div>
                  </td>
                  <td nowrap width="30%">
                     <div align="right">Clasificación :</div>
                  </td>
                  <td nowrap width="50%">
                        <input type="radio" name="E02CRSSP6" value="2"
                        <%if (client.getE02CRSSP6().equals("2")) out.print("checked"); %>> Definitiva
                        <input type="radio" name="E02CRSSP6" value="3" 
                        <%if (client.getE02CRSSP6().equals("3")) out.print("checked"); %>> Temporal
                  </td>
	           </tr>     
	           <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
                  <td nowrap width="20%"> 
                     <div align="right"><b>Si no cumple anteriores :</b></div>
                  </td>
                  <td nowrap width="30%">
                     <div align="right">Clasificacion CRS :</div>
                  </td>
                  <td nowrap width="50%">
                      <eibsinput:cnofc name="client" property="E02CRSCP7" value="<%=client.getE02CRSCP7()%>" required="false" flag="IF" fn_code="E02CRSCP7" fn_description="D02CRSCP7" readonly="false" />
                      <eibsinput:text name="client" property="D02CRSCP7" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true"/>
                  </td>
               </tr> 
	           <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
                  <td nowrap width="20%"> 
                     <div align="right"></div>
                  </td>
                  <td nowrap width="30%">
                     <div align="right">Clasificación :</div>
                  </td>
                  <td nowrap width="50%">
                        <input type="radio" name="E02CRSSP7" value="2"
                        <%if (client.getE02CRSSP7().equals("2")) out.print("checked"); %>> Definitiva
                        <input type="radio" name="E02CRSSP7" value="3" 
                        <%if (client.getE02CRSSP7().equals("3")) out.print("checked"); %>> Temporal
                  </td>
	           </tr>     
	           <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
                  <td nowrap width="20%"> 
                     <div align="right"><b>Controlling Person :</b></div>
                  </td>
                  <td nowrap width="30%">
                     <div align="right">Clasificacion Controlling Person :</div>
                  </td>
                  <td nowrap width="50%">
                      <eibsinput:cnofc name="client" property="E02CRSCON" value="<%=client.getE02CRSCON()%>" required="false" flag="IN" fn_code="E02CRSCON" fn_description="D02CRSCON" readonly="false" />
                      <eibsinput:text name="client" property="D02CRSCON" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true"/>
                  </td>
               </tr> 

            </table>
         </td>
      </tr> 
   </table>
<%}%>
                       
  <br>
          <div align="center"> 
            <input id="EIBSBTN" type="button" name="Submit" onClick="goAction();" value="Enviar">
            <input id="EIBSBTN" type=button name="Submit" value="Salir" onClick="finish();">
          </div>



</form>
</body>
</html>
