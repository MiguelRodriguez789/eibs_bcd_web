<html>
<head>
<title>Parametros Clientes - FATCA</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@ page import = "datapro.eibs.master.Util" %>
<%@ page import="com.datapro.constants.EibsFields"%>
<%@ page import = "java.io.*,java.net.*,datapro.eibs.beans.*,datapro.eibs.master.*,java.math.*" %>


<jsp:useBean id= "client" class= "datapro.eibs.beans.ESD008301Message"  scope="session" />
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
<h3 align="center">Parámetros Clientes - FATCA


<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="client_param_fatca_2.jsp, ESD0083"></h3>
<hr size="4">
 <FORM METHOD="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSESD0085" >
  <p>
    <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="102">
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
                        <eibsinput:cnofc name="client" property="E01CFACTY" value="<%=client.getE01CFACTY()%>" required="false" flag="03" fn_code="E01CFACTY" fn_description="D01CFACTY" readonly="<%=isReadOnly %>" />
                        <eibsinput:text name="client" property="D01CFACTY" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true"/>
                   </td>
                  </tr> 
               </table>
            </td>
         </tr> 
      </table>

<H4>Información Básica FATCA Personas Naturales</H4>
      <table  class="tableinfo">
         <tr bordercolor="#FFFFFF"> 
            <td nowrap> 
               <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
	           <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
                     <td nowrap colspan='4' align="center"><b>Clasificación FATCA</b></td>
                  </tr> 
            
	           <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
                    <td nowrap width="20%"> 
                        <div align="right">Sin Indicia:</div>
                    </td>
                    <td nowrap width="30%">
                        <eibsinput:cnofc name="client" property="E01CFANUN" value="<%=client.getE01CFANUN()%>" required="false" flag="ID" fn_code="E01CFANUN" fn_description="D01CFANUN" readonly="false" />
                        <eibsinput:text name="client" property="D01CFANUN" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true"/>
                    </td>

                    <td nowrap width="20%"> 
                       <div align="right">Clasificación :</div>
                    </td>
                    <td nowrap width="30%">
                        <input type="radio" name="E01CFAST1" value="2"
                        <%if (client.getE01CFAST1().equals("2")) out.print("checked"); %>> Definitiva
                        <input type="radio" name="E01CFAST1" value="3" 
                        <%if (client.getE01CFAST1().equals("3")) out.print("checked"); %>> Temporal
                   </td>
                  </tr>     
            
	           <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
                    <td nowrap width="20%"> 
                       <div align="right">Evaluación :</div>
                    </td>
                    <td nowrap width="30%">
                        <eibsinput:cnofc name="client" property="E01CFAEVN" value="<%=client.getE01CFAEVN()%>" required="false" flag="ID" fn_code="E01CFAEVN" fn_description="D01CFAEVN" readonly="false" />
                        <eibsinput:text name="client" property="D01CFAEVN" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true"/>
                    </td>
                    <td nowrap width="20%"> 
                       <div align="right">Clasificación :</div>
                    </td>
                    <td nowrap width="30%">
                        <input type="radio" name="E01CFAST2" value="2"
                        <%if (client.getE01CFAST2().equals("2")) out.print("checked"); %>> Definitiva
                        <input type="radio" name="E01CFAST2" value="3" 
                        <%if (client.getE01CFAST2().equals("3")) out.print("checked"); %>> Temporal
                   </td>
	           </tr>
	           <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
                    <td nowrap width="20%"> 
                       <div align="right">Con Indicia:</div>
                    </td>
                    <td nowrap width="30%">
                        <eibsinput:cnofc name="client" property="E01CFAURN" value="<%=client.getE01CFAURN()%>" required="false" flag="ID" fn_code="E01CFAURN" fn_description="D01CFAURN" readonly="false" />
                        <eibsinput:text name="client" property="D01CFAURN" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true"/>
                    </td>
                    <td nowrap width="20%"> 
                       <div align="right">Clasificación :</div>
                    </td>
                    <td nowrap width="30%">
                        <input type="radio" name="E01CFAST3" value="2"
                        <%if (client.getE01CFAST3().equals("2")) out.print("checked"); %>> Definitiva
                        <input type="radio" name="E01CFAST3" value="3" 
                        <%if (client.getE01CFAST3().equals("3")) out.print("checked"); %>> Temporal
                   </td>
	           </tr>
               </table>
            </td>
         </tr> 
      </table>

<% if (client.getE01CFACTY().equals("CO")){%>

<H4>Información Básica FATCA Personas Jurídicas</H4>
   <table  class="tableinfo">
      <tr bordercolor="#FFFFFF"> 
         <td nowrap> 
            <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
               <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
                  <td nowrap colspan='3' align="center"><b>Tipo de Entidad</b></td>
               </tr> 
	           <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
                  <td nowrap width="20%"> 
                     <div align="right"><b>Condición 0 :</b></div>
                  </td>
                  <td nowrap width="30%" align="right">Tipo de Entidad:
                  </td>
                  <td nowrap width="50%"> 
                     <eibsinput:cnofc name="client" property="E01CFATEP" value="<%=client.getE01CFATEP()%>" required="false" flag="IE" fn_code="E01CFATEP" fn_description="D01CFATEP" readonly="false" />
                     <eibsinput:text name="client" property="D01CFATEP" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true"/>
                     <br>Si Pais de Constitución o Dirección es de un pais con convenio FATCA
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
                        <input type="radio" name="E01CFAEN1" value="Y"
                        <%if (client.getE01CFAEN1().equals("Y")) out.print("checked"); %>> Si
                        <input type="radio" name="E01CFAEN1" value="N" 
                        <%if (client.getE01CFAEN1().equals("N")) out.print("checked"); %>> No
                        <input type="radio" name="E01CFAEN1" value="A" 
                        <%if (client.getE01CFAEN1().equals("A")) out.print("checked"); %>> N/A
                  </td>
	           </tr>     
	           <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
                  <td nowrap width="20%"> 
                     <div align="right"></div>
                  </td>
                  <td nowrap width="30%"> 
                     <div align="right">Tipo de Entidad :</div>
                  </td>
                  <td nowrap width="50%">                       
                     <eibsinput:cnofc name="client" property="E01CFATE1" value="<%=client.getE01CFATE1()%>" required="false" flag="IE" fn_code="E01CFATE1" fn_description="D01CFATE1" readonly="false" />
                     <eibsinput:text name="client" property="D01CFATE1" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true"/>
                   </td>                    
	           </tr>
	           <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
                   <td nowrap width="20%"> 
                      <div align="right"><b>Si no cumple anteriores :</b></div>
                   </td>
                   <td nowrap width="30%">
                      <div align="right">Tipo Entidad :</div>
                   </td>
                   <td nowrap width="50%">
                      <eibsinput:cnofc name="client" property="E01CFATE2" value="<%=client.getE01CFATE2()%>" required="false" flag="IE" fn_code="E01CFATE2" fn_description="D01CFATE2" readonly="false" />
                      <eibsinput:text name="client" property="D01CFATE2" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true"/>
                   </td>
	           </tr>
            </table>
         </td>
      </tr> 
   </table>
   <table  class="tableinfo">
      <tr bordercolor="#FFFFFF"> 
         <td nowrap> 
            <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
               <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
                  <td nowrap colspan='3' align="center"><b>Clasificación Entidad</b></td>
               </tr> 
	           <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
                  <td nowrap width="20%"> 
                     <div align="right"><b>Condición 0 :</b></div>
                  </td>
                  <td nowrap width="30%">
                     <div align="right">Tipo Entidad :</div>
                  </td>
                  <td nowrap width="50%">
                      <eibsinput:cnofc name="client" property="E01CFATE3" value="<%=client.getE01CFATE3()%>" required="false" flag="IE" fn_code="E01CFATE3" fn_description="D01CFATE3" readonly="false" />
                      <eibsinput:text name="client" property="D01CFATE3" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true"/>
                  </td>
               </tr> 
	           <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
                  <td nowrap width="20%"> 
                     <div align="right"></div>
                  </td>
                  <td nowrap width="30%"> 
                     <div align="right">Clasificación Entidad:</div>
                  </td>
                  <td nowrap width="50%">                       
                     <eibsinput:cnofc name="client" property="E01CFACE0" value="<%=client.getE01CFACE0()%>" required="false" flag="IC" fn_code="E01CFACE0" fn_description="D01CFACE0" readonly="false" />
                     <eibsinput:text name="client" property="D01CFACE0" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true"/>
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
                        <input type="radio" name="E01CFACF1" value="Y"
                        <%if (client.getE01CFACF1().equals("Y")) out.print("checked"); %>> Si
                        <input type="radio" name="E01CFACF1" value="N" 
                        <%if (client.getE01CFACF1().equals("N")) out.print("checked"); %>> No
                        <input type="radio" name="E01CFACF1" value="A" 
                        <%if (client.getE01CFACF1().equals("A")) out.print("checked"); %>> N/A
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
                        <input type="radio" name="E01CFABO1" value="Y"
                        <%if (client.getE01CFABO1().equals("Y")) out.print("checked"); %>> Si
                        <input type="radio" name="E01CFABO1" value="N" 
                        <%if (client.getE01CFABO1().equals("N")) out.print("checked"); %>> No
                         <input type="radio" name="E01CFABO1" value="A" 
                        <%if (client.getE01CFABO1().equals("A")) out.print("checked"); %>> N/A
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
                        <input type="radio" name="E01CFAIN1" value="Y"
                        <%if (client.getE01CFAIN1().equals("Y")) out.print("checked"); %>> Si
                        <input type="radio" name="E01CFAIN1" value="N" 
                        <%if (client.getE01CFAIN1().equals("N")) out.print("checked"); %>> No
                        <input type="radio" name="E01CFAIN1" value="A" 
                        <%if (client.getE01CFAIN1().equals("A")) out.print("checked"); %>> N/A
                  </td>
               </tr> 
	           <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
                  <td nowrap width="20%"> 
                     <div align="right"></div>
                  </td>
                  <td nowrap width="30%"> 
                     <div align="right">Clasificación Entidad:</div>
                  </td>
                  <td nowrap width="50%">
                     <eibsinput:cnofc name="client" property="E01CFACE1" value="<%=client.getE01CFACE1()%>" required="false" flag="IC" fn_code="E01CFACE1" fn_description="D01CFACE1" readonly="false" />
                     <eibsinput:text name="client" property="D01CFACE1" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true"/>
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
                        <input type="radio" name="E01CFACF2" value="Y"
                        <%if (client.getE01CFACF2().equals("Y")) out.print("checked"); %>> Si
                        <input type="radio" name="E01CFACF2" value="N" 
                        <%if (client.getE01CFACF2().equals("N")) out.print("checked"); %>> No
                        <input type="radio" name="E01CFACF2" value="A" 
                        <%if (client.getE01CFACF2().equals("A")) out.print("checked"); %>> N/A
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
                        <input type="radio" name="E01CFABO2" value="Y"
                        <%if (client.getE01CFABO2().equals("Y")) out.print("checked"); %>> Si
                        <input type="radio" name="E01CFABO2" value="N" 
                        <%if (client.getE01CFABO2().equals("N")) out.print("checked"); %>> No
                         <input type="radio" name="E01CFABO2" value="A" 
                        <%if (client.getE01CFABO2().equals("A")) out.print("checked"); %>> N/A
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
                        <input type="radio" name="E01CFAIN2" value="Y"
                        <%if (client.getE01CFAIN2().equals("Y")) out.print("checked"); %>> Si
                        <input type="radio" name="E01CFAIN2" value="N" 
                        <%if (client.getE01CFAIN2().equals("N")) out.print("checked"); %>> No
                        <input type="radio" name="E01CFAIN2" value="A" 
                        <%if (client.getE01CFAIN2().equals("A")) out.print("checked"); %>> N/A
                  </td>
               </tr> 
	           <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
                  <td nowrap width="20%"> 
                     <div align="right"></div>
                  </td>
                  <td nowrap width="30%"> 
                     <div align="right">Clasificación Entidad:</div>
                  </td>
                  <td nowrap width="50%">
                     <eibsinput:cnofc name="client" property="E01CFACE2" value="<%=client.getE01CFACE2()%>" required="false" flag="IC" fn_code="E01CFACE2" fn_description="D01CFACE2" readonly="false" />
                     <eibsinput:text name="client" property="D01CFACE2" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true"/>
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
                        <input type="radio" name="E01CFACF3" value="Y"
                        <%if (client.getE01CFACF3().equals("Y")) out.print("checked"); %>> Si
                        <input type="radio" name="E01CFACF3" value="N" 
                        <%if (client.getE01CFACF3().equals("N")) out.print("checked"); %>> No
                        <input type="radio" name="E01CFACF3" value="A" 
                        <%if (client.getE01CFACF3().equals("A")) out.print("checked"); %>> N/A
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
                        <input type="radio" name="E01CFABO3" value="Y"
                        <%if (client.getE01CFABO3().equals("Y")) out.print("checked"); %>> Si
                        <input type="radio" name="E01CFABO3" value="N" 
                        <%if (client.getE01CFABO3().equals("N")) out.print("checked"); %>> No
                         <input type="radio" name="E01CFABO3" value="A" 
                        <%if (client.getE01CFABO3().equals("A")) out.print("checked"); %>> N/A
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
                        <input type="radio" name="E01CFAIN3" value="Y"
                        <%if (client.getE01CFAIN3().equals("Y")) out.print("checked"); %>> Si
                        <input type="radio" name="E01CFAIN3" value="N" 
                        <%if (client.getE01CFAIN3().equals("N")) out.print("checked"); %>> No
                        <input type="radio" name="E01CFAIN3" value="A" 
                        <%if (client.getE01CFAIN3().equals("A")) out.print("checked"); %>> N/A
                  </td>
               </tr> 
	           <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
                  <td nowrap width="20%"> 
                     <div align="right"></div>
                  </td>
                  <td nowrap width="30%"> 
                     <div align="right">Clasificación Entidad:</div>
                 </td>
                  <td nowrap width="50%">
                     <eibsinput:cnofc name="client" property="E01CFACE3" value="<%=client.getE01CFACE3()%>" required="false" flag="IC" fn_code="E01CFACE3" fn_description="D01CFACE3" readonly="false" />
                     <eibsinput:text name="client" property="D01CFACE3" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true"/>
                   </td>
	           </tr>
	           <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
                  <td nowrap width="20%"> 
                     <div align="right"><b>Si no cumple anteriores :</b></div>
                  </td>
                  <td nowrap width="30%">
                     <div align="right">Clasificación Entidad:</div>
                  </td>
                  <td nowrap width="50%">
                     <eibsinput:cnofc name="client" property="E01CFACE4" value="<%=client.getE01CFACE4()%>" required="false" flag="IC" fn_code="E01CFACE4" fn_description="D01CFACE4" readonly="false" />
                     <eibsinput:text name="client" property="D01CFACE4" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true"/>
                  </td>
	           </tr>
            </table>
         </td>
      </tr> 
   </table>
   <table  class="tableinfo">
      <tr bordercolor="#FFFFFF"> 
         <td nowrap> 
            <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
               <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
                  <td nowrap colspan='3' align="center"><b>Clasificación FATCA</b></td>
               </tr> 
	           <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
                  <td nowrap width="20%"> 
                     <div align="right"><b>Condición 0:</b></div>
                  </td>
                  <td nowrap width="30%">
                     <div align="right">Clasificación Entidad:</div>
                  </td>
                  <td nowrap width="50%"> 
                     <eibsinput:cnofc name="client" property="E01CFACE5" value="<%=client.getE01CFACE5()%>" required="false" flag="IC" fn_code="E01CFACE5" fn_description="D01CFACE5" readonly="false" />
                     <eibsinput:text name="client" property="D01CFACE5" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true"/>
                  </td>
               </tr> 
	           <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
                  <td nowrap width="20%"> 
                     <div align="right"></div>
                  </td>
                  <td nowrap width="30%">
                     <div align="right">Clasificación FATCA :</div>
                  </td>
                  <td nowrap width="50%">
                        <eibsinput:cnofc name="client" property="E01CFACP0" value="<%=client.getE01CFACP0()%>" required="false" flag="ID" fn_code="E01CFACP0" fn_description="D01CFACP0" readonly="false" />
                        <eibsinput:text name="client" property="D01CFACP0" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true"/>
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
                        <input type="radio" name="E01CFAST4" value="2"
                        <%if (client.getE01CFAST4().equals("2")) out.print("checked"); %>> Definitiva
                        <input type="radio" name="E01CFAST4" value="3" 
                        <%if (client.getE01CFAST4().equals("3")) out.print("checked"); %>> Temporal
                  </td>
	           </tr>     
	           <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
                  <td nowrap width="20%"> 
                     <div align="right"><b>Condición 1:</b></div>
                  </td>
                  <td nowrap width="30%">
                     <div align="right">Clasificación Entidad:</div>
                  </td>
                  <td nowrap width="50%"> 
                     <eibsinput:cnofc name="client" property="E01CFACE6" value="<%=client.getE01CFACE6()%>" required="false" flag="IC" fn_code="E01CFACE6" fn_description="D01CFACE6" readonly="false" />
                     <eibsinput:text name="client" property="D01CFACE6" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true"/>
                  </td>
               </tr> 
	           <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
                  <td nowrap width="20%"> 
                     <div align="right"></div>
                  </td>
                  <td nowrap width="30%">
                     <div align="right">Clasificación FATCA :</div>
                  </td>
                  <td nowrap width="50%">
                        <eibsinput:cnofc name="client" property="E01CFACP1" value="<%=client.getE01CFACP1()%>" required="false" flag="ID" fn_code="E01CFACP1" fn_description="D01CFACP1" readonly="false" />
                        <eibsinput:text name="client" property="D01CFACP1" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true"/>
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
                        <input type="radio" name="E01CFAST5" value="2"
                        <%if (client.getE01CFAST5().equals("2")) out.print("checked"); %>> Definitiva
                        <input type="radio" name="E01CFAST5" value="3" 
                        <%if (client.getE01CFAST5().equals("3")) out.print("checked"); %>> Temporal
                  </td>
	           </tr>     

	           <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
                  <td nowrap width="20%"> 
                     <div align="right"><b>Si no cumple anteriores :</b></div>
                  </td>
                  <td nowrap width="30%">
                     <div align="right">Clasificación FATCA :</div>
                  </td>
                  <td nowrap width="50%">
                        <eibsinput:cnofc name="client" property="E01CFACP2" value="<%=client.getE01CFACP2()%>" required="false" flag="ID" fn_code="E01CFACP2" fn_description="D01CFACP2" readonly="false" />
                        <eibsinput:text name="client" property="D01CFACP2" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true"/>
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
                        <input type="radio" name="E01CFAST6" value="2"
                        <%if (client.getE01CFAST6().equals("2")) out.print("checked"); %>> Definitiva
                        <input type="radio" name="E01CFAST6" value="3" 
                        <%if (client.getE01CFAST6().equals("3")) out.print("checked"); %>> Temporal
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
