<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>

<%@ page import = "datapro.eibs.master.Util" %>
<%@page import="com.datapro.constants.EibsFields"%>


<%@ page import = "datapro.eibs.master.Util" %>
<html>
<head>
<title>Detalle Proveedores</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

</head>

<jsp:useBean id="EBP0110Record" class="datapro.eibs.beans.EBP011001Message"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />
 
<body>

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBSBillsP.jsp"> </SCRIPT>
<script type="text/javascript">

function goAction(op) {
	document.forms[0].SCREEN.value = op;
	if (op == 4) {
		if (!confirm("Esta seguro que desea borrar este registro??")) {
			return;
		}
	}
	document.forms[0].submit();
}

function goCustIns() {
    var pg = "";
    var ccy = "<%=currUser.getE01BCU()%>";
    var customer = document.getElementById("E01BPVCUN").value;
    if (customer == 0) {
		alert("Por favor ingrese un Número de Cliente para este Proveedor");
		return;
	}
 	pg = "<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSESD1080?SCREEN=8&E01CUN=" + customer + 
 	"&E11CCY=" + ccy + "&E11TYP=1";
 	CenterWindow(pg,900,600,2);
}

function changecus() {
    document.getElementById('E01BPVSNM').value=' ';
    document.getElementById('E01BPVCNT').value=' ';
    document.getElementById('E01BPVCNT').value=' ';
    document.getElementById('E01BPVIDF').value=' ';
    document.getElementById('E01BPVEMA').value=' ';
    document.getElementById('E01BPVTID').value=' ';
    document.getElementById('E01BPVTDS').value=' ';
    document.getElementById('E01BPVNM2').value=' '; 
    document.getElementById('E01BPVCDS').value=' ';
}
</SCRIPT>  
 

<% 
    if ( !error.getERRNUM().equals("0")  ) {
        out.println("<SCRIPT Language=\"Javascript\">");
        error.setERRNUM("0");
        out.println("       showErrors()");
        out.println("</SCRIPT>");
    }   
	String read = "";
 	String disabled = "";
	if (!(userPO.getPurpose().equals("NEW") || userPO.getPurpose().equals("MAINTENANCE"))) 
		{ read = " readonly ";
		  disabled = " disabled"; }	
%>


<H3 align="center"> 
					<% if (userPO.getPurpose().equals("NEW")) { 
										out.println("   Nuevo - "); 
					   } 
					   else if (userPO.getPurpose().equals("MAINTENANCE")) {
					                               out.println("  Mantenimiento - "); 
					   }			  
					   else { out.println("  Consulta - ");
					   } 
				   %>Proveedor				
		<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="vendors_details.jsp, EBP0110">
</H3>

<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.bap.JSEBP0110" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="5">
  <INPUT TYPE=HIDDEN NAME="TYPE" VALUE="O">
  <INPUT TYPE=HIDDEN name="E01BPVCOD" value="<%= EBP0110Record.getE01BPVCOD().trim()%>"> 

<table width="100%"> <tr> <td nowrap> 
  	<table  width="100%" > <tr bordercolor="#FFFFFF"> <td nowrap> 
        <table class="tableinfo" cellspacing="0" width="100%" border="0">
        	<tr id="trdark"> 
            	<td nowrap width="10%" align="right">Código : </td>
            	<td nowrap width="20%" align="left"><%= EBP0110Record.getE01BPVCOD()%></td>
				<td nowrap width="10%" align="right">Número Cliente : </td>
				<td nowrap width="10%" align="left"> 
              		<INPUT type="text" name="E01BPVCUN" maxlength="9" size="10" value="<%= EBP0110Record.getE01BPVCUN().trim()%>" onkeypress="enterInteger(event)"
			    		onblur = "changecus();" onchange = "changecus();">
			    		<a href="javascript:GetCustomerDetailsVendor('E01BPVCUN','E01BPVNM1', 'E01BPVIDF', 'E01BPVTID','',
               	    	'E01BPVNM3', 'E01BPVNM4', 'E01BPVNM5', '', 'E01BPVSTE' ,'E01BPVCNT', '', 'E01BPVZIP', 'E01BPVSNM', 'E01BPVEMA' ,'', '' ,'E01BPVPH1')">
			    		<IMG src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="bottom" border="0"></a></td>
				<td nowrap width="20%"> Fecha Creación : <%= datapro.eibs.master.Util.formatCustomDate(currUser.getE01DTF(), EBP0110Record.getE01BPVCMM(),EBP0110Record.getE01BPVCDD(),EBP0110Record.getE01BPVCYY())%></td>
				<td nowrap width="30%">Fecha Última Actualización: <%= datapro.eibs.master.Util.formatCustomDate(currUser.getE01DTF(),EBP0110Record.getE01BPVMMM(),EBP0110Record.getE01BPVMDD(),EBP0110Record.getE01BPVMYY())%></td>
			</tr>
		</table>
	</td> </tr></table>
  <h4> Información Básica</h4>  
  <table width="100%" > <tr bordercolor="#FFFFFF"> <td width="100%" nowrap> 		
		<table class="tableinfo" cellspacing="0" width="100%" border="0"> 
          <tr id="trdark"> 
          	<td nowrap width="10%" align="right">Nombre Proveedor :</td>
			<td nowrap width="40%" align="left">
              <eibsinput:text name="EBP0110Record" property="E01BPVNM1" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_NAME %>" required="true"/>
			</td>
			 <td nowrap width="10%" align="right">Dirección Proveedor : </td>
          	<td nowrap width="40%" align="left">
               <eibsinput:text name="EBP0110Record" property="E01BPVNM3" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_NAME %>" required="false"/>
           </td>
          </tr>
          <tr id="trclear"> 
 			<td nowrap width="10%" align="right"></td>
			<td nowrap width="40%" align="left">
              <eibsinput:text name="EBP0110Record" property="E01BPVNM2" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_NAME %>" required="false"/>
			</td>
			<td nowrap width="10%" align="right"></td>
          	<td nowrap width="40%" align="left">
               <eibsinput:text name="EBP0110Record" property="E01BPVNM4" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_NAME %>" required="false"/>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="10%" align="right">Nombre Corto : </td>
            <td nowrap align="left" width="40%">
              <eibsinput:text name="EBP0110Record" property="E01BPVSNM" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_NAME_SHORT %>" required="true"/>
			</td>	  
			<td nowrap width="10%" align="right"> </td>
            <td nowrap width="40%" align="left">
                <eibsinput:text name="EBP0110Record" property="E01BPVNM5" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_NAME %>" required="false"/>
          </td>
          </tr>
          <tr id="trclear"> 
        	<td nowrap width="10%" align="right">País : </td>
			<td nowrap width="40%" align="left">
				<eibsinput:cnofc name="EBP0110Record" flag="03" property="E01BPVCNT" fn_code="E01BPVCNT" fn_description="E01BPVCDS"  required="false"/>
				<eibsinput:text name="EBP0110Record" property="E01BPVCDS" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" required="true" readonly="true"/>
          </td>    
            <td nowrap width="10%" align="right">Estado/Depto. : </td>
			<td nowrap width="40%" align="left">
            	<eibsinput:cnofc name="EBP0110Record" flag="27" property="E01BPVSTE" fn_code="E01BPVSTE" fn_description=""  required="false"/>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="10%" align="right">Código Postal : </td>
			<td nowrap width="40%" align="left"> 
              <eibsinput:text name="EBP0110Record" property="E01BPVZIP" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_ZIPCODE %>" required="false"/>
     		</td>
			<td nowrap width="10%" align="right">Número Telefono : </td>
			<td nowrap width="40%" align="left"> 
                <eibsinput:text name="EBP0110Record" property="E01BPVPH1" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_PHONE %>" required="false"/>
		</td>
          </tr>
          <tr id="trclear"> 
        	<td nowrap width="10%" align="right">e-Mail : </td>
			<td nowrap width="40%" align="left">
              <eibsinput:text name="EBP0110Record" property="E01BPVEMA" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_EMAIL %>" required="false"/>
         </td>    
            <td nowrap width="10%" align="right">Identificación Impuestos : </td>
			<td nowrap width="40%" align="left">
                <eibsinput:text name="EBP0110Record" property="E01BPVIDF" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_IDENTIFICATION %>" required="true"/>
        </td>
    	  </tr>
		  <tr id="trdark"> 
            <td nowrap width="10%" align="right">Tipo Proveedor : </td>
			<td nowrap width="40%" align="left"> 
              <SELECT name="E01BPVTNJ" <%= disabled %>>
				<OPTION <%= EBP0110Record.getE01BPVTNJ().trim().equals("N")?"Selected":"" %> value="N">Persona</OPTION>
				<OPTION <%= EBP0110Record.getE01BPVTNJ().trim().equals("J")?"Selected":"" %> value="J">Empresa</OPTION>
			  </SELECT>
			  <B><IMG src="<%=request.getContextPath()%>/images/Check.gif" title="Campo Obligatorio" align="bottom"></B>
			</td>
			<td nowrap width="10%" align="right">Tipo de Identificación : </td>
			<td nowrap width="40%" align="left">
				<eibsinput:cnofc name="EBP0110Record" flag="34" property="E01BPVTID" fn_code="E01BPVTID"  fn_description="E01BPVTDS"  required="true"/>
            	<eibsinput:text name="EBP0110Record" property="E01BPVTDS" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true"/>
			</td>
          </tr>     
          <tr id="trclear"> 
            <td nowrap width="10%" align="right">Tipo de Proveedor : </td>
			<td nowrap width="40%" align="left"> 
			    <SELECT name="E01BPVTYP">
			       <OPTION value=" " <%= !EBP0110Record.getE01BPVTYP().trim().equals("I")?"selected":" " %>>Regular</OPTION>
			       <OPTION value="I" <%= EBP0110Record.getE01BPVTYP().trim().equals("I")?"selected":" " %>>Banca por Internet</OPTION>
			    </SELECT>
			</td>
			<td nowrap width="10%" align="right">Clasificación : </td>
			<td nowrap width="40%" align="left"> 
            	<eibsinput:cnofc name="EBP0110Record" flag="BA" property="E01BPVCLS" fn_code="E01BPVCLS" fn_description="E01BPVCLSD"  required="false"/>
				<eibsinput:text name="EBP0110Record" property="E01BPVCLSD" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true"/>
			</td>
          </tr>
	</table> 
</td> </tr> </table>

  <h4> Información de Contacto</h4>  
    <table width="100%" > <tr bordercolor="#FFFFFF"> <td width="100%" nowrap> 		
		<table class="tableinfo" cellspacing="0" width="100%" border="0">
          <tr id="trdark"> 
          	<td nowrap width="10%" align="right">Nombre de Contacto:</td>
			<td nowrap width="40%" align="left">
              <input type="text" name="E01BPVCNM" size="50" maxlength="35" value="<%= EBP0110Record.getE01BPVCNM().trim()%>" <%=read%>>
			</td>
			 <td nowrap width="10%" align="right"></td>
          	<td nowrap width="40%" align="left">
            </td>
          </tr>
         <tr id="trclear" align="left"> 
				<td nowrap width="10%" align="right">Dirección del Contacto  </td>
				<td nowrap width="40%" align="left">  
				</td>	
				<td nowrap width="10%" align="right"></td>
				<td nowrap width="40%" align="left" >
				</td>
			</tr>
			<tr id="trdark" align="left"> 
				<td nowrap width="10%" align="right">Calle : </td>
				<td nowrap width="40%" align="left">  
              <eibsinput:text name="EBP0110Record" property="E01BPVDA2" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_NAME %>" required="false"/>
			</td>	
				<td nowrap width="10%" align="right">Residencial/Edificio  : </td>
				<td nowrap width="40%" align="left" >
             <eibsinput:text name="EBP0110Record" property="E01BPVDA3" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_NAME %>" required="false"/>
			</td>
			</tr>
			<tr id="trclear" align="left"> 
				<td nowrap width="10%" align="right">Número Casa/Apartamento: </td>
				<td nowrap width="40%" align="left">  
             <eibsinput:text name="EBP0110Record" property="E01BPVDA4" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_NAME %>" required="false"/>
			</td>	
				<td nowrap width="10%" align="right">Pais : </td>
				<td nowrap width="40%" align="left">  
                   <eibsinput:cnofc name="EBP0110Record" flag="03" property="E01BPVDPE" fn_code="E01BPVDPE" fn_description="E01BPVDPED"  required="false"/>
        	       <eibsinput:text  name="EBP0110Record" property="E01BPVDPED" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true"/>
			</td>
			</tr>
			<tr id="trdark" align="left"> 
				<td nowrap width="10%" align="right">Estado/Dpto : </td>
				<td nowrap width="40%" align="left" >
                  <eibsinput:cnofc name="EBP0110Record" flag="27" property="E01BPVCST" fn_code="E01BPVCST" fn_description="E01BPVCSTD"  required="false"/>
        	       <eibsinput:text name="EBP0110Record" property="E01BPVCSTD" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true"/>
 				</td>	
				<td nowrap width="10%" align="right">Ciudad  : </td>
				<td nowrap width="40%" align="left" >
                	<eibsinput:cnofc name="EBP0110Record" flag="84" property="E01BPVDPI" fn_code="E01BPVDPI" fn_description="E01BPVDPID"  required="false"/>
        	    	<eibsinput:text  name="EBP0110Record" property="E01BPVDPID" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true"/>
				</td>
			</tr>
          <tr id="trclear"> 
           	<td nowrap width="10%" align="right">Número Teléfono : </td>
			<td nowrap width="40%" align="left"> 
             <eibsinput:text name="EBP0110Record" property="E01BPVCP1" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_PHONE %>" required="false"/>
			</td>
			<td nowrap width="10%" align="right">Número Fax : </td>
			<td nowrap width="40%" align="left"> 
              <eibsinput:text name="EBP0110Record" property="E01BPVFAX" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_PHONE %>" required="false"/>
 			</td>
          </tr>
          </table> 
      </td></tr></table> 
   <h4>Información para Pagos</h4>  
     <table width="100%" > <tr bordercolor="#FFFFFF"> <td width="100%" nowrap> 		
		<table class="tableinfo" cellspacing="0" width="100%" border="0">
            <tr id="trdark"> 
            <td nowrap width="10%" align="right">Forma de Pago por Omisión : </td>
			<td nowrap width="40%" align="left"> 
              <SELECT name="E01BPVPVI" <%= disabled %>>
				<OPTION <%= EBP0110Record.getE01BPVPVI().trim().equals("A")?"Selected":"" %> value="A">ACH</OPTION>
				<OPTION <%= EBP0110Record.getE01BPVPVI().trim().equals("R")?"Selected":"" %> value="R">Cuenta Corriente</OPTION>
				<OPTION <%= EBP0110Record.getE01BPVPVI().trim().equals("G")?"Selected":"" %> value="G">Cuenta Contable</OPTION>
				<OPTION <%= EBP0110Record.getE01BPVPVI().trim().equals("C")?"Selected":"" %> value="C">Cheque Oficial/Gerencia</OPTION>
				<OPTION <%= EBP0110Record.getE01BPVPVI().trim().equals("S")?"Selected":"" %> value="S">Swift</OPTION>
				<OPTION <%= EBP0110Record.getE01BPVPVI().trim().equals("F")?"Selected":"" %> value="F">Transferencia</OPTION>
			  </SELECT>
			  <B><IMG src="<%=request.getContextPath()%>/images/Check.gif" title="Campo Obligatorio" align="bottom"></B>
			</td>
            <td nowrap width="10%" align="right">Metodo de Pago : </td>
            <td nowrap width="40%" align="left"> 
              <SELECT name="E01BPVPMT" <%= disabled %>>
				<OPTION <%= EBP0110Record.getE01BPVPMT().trim().equals("S")?"Selected":"" %> value="S">Un solo Pago</OPTION>
				<OPTION <%= EBP0110Record.getE01BPVPMT().trim().equals("M")?"Selected":"" %> value="M">Múltiples Facturas en un Pago</OPTION>
			  </SELECT>
			  <B><IMG src="<%=request.getContextPath()%>/images/Check.gif" title="Campo Obligatorio" align="bottom"></B>
			 </td>
           </tr> 
		   <tr id="trclear"> 
             <td nowrap width="10%" align="left"><B>Información pago por ACH </B></td>
	         <td nowrap width="40%" align="left"> </td>
             <td nowrap width="10%" align="right"> </td> 
             <td nowrap width="40%" align="left"> 
			 </td>
		   </tr>	
           <tr id="trdark"> 
             <td nowrap width="10%" align="right">Nombre Beneficiario : </td>
	         <td nowrap width="40%" align="left">
             <eibsinput:text name="EBP0110Record" property="E01BPVNME" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_NAME %>" required="false"/>
            </td>
             <td nowrap width="10%" align="right">Dirección : </td> 
             <td nowrap width="40%" align="left"> 
             <eibsinput:text name="EBP0110Record" property="E01BPVADD" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_NAME %>" required="false"/>
 			 </td>
		   </tr>	
		   <tr id="trclear"> 
             <td nowrap width="10%" align="right">Ciudad, Estado, Cód. Postal : </td>
	         <td nowrap width="40%" align="left">
             <eibsinput:text name="EBP0110Record" property="E01BPVCSZ" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_NAME %>" required="false"/>
           </td>
             <td nowrap width="10%" align="right">Número Ruta : </td> 
             <td nowrap width="40%" align="left"> 
			   <INPUT type="text" name="E01BPVROU" maxlength="9" size="10" <%= read %> value="<%= EBP0110Record.getE01BPVROU().trim()%>" onkeypress="enterInteger(event)">
		     </td>
		   </tr>	
           <tr id="trdark"> 
             <td nowrap width="10%" align="right">Tipo </td>
	         <td nowrap width="40%" align="left">
	           <SELECT name="E01BPVACT" <%= disabled %>>
			     <OPTION <%= EBP0110Record.getE01BPVACT().trim().equals("C")?"Selected":"" %> value="C">Corriente</OPTION>
			     <OPTION <%= EBP0110Record.getE01BPVACT().trim().equals("S")?"Selected":"" %> value="S">Ahorros</OPTION>
			   </SELECT>
             </td>
             <td nowrap width="10%" align="right">Cuenta Beneficiario  : </td> 
             <td nowrap width="40%" align="left"> 
               <INPUT type="text" name="E01BPVACC1" maxlength="17" size="18" <%= read %> value="<%= EBP0110Record.getE01BPVACC1().trim()%>">
             </td>
		   </tr>	
		   <tr id="trclear"> 
             <td nowrap width="10%" align="left"><B>Información para Pago en Cuenta Corriente </B> </td>
             <td nowrap width="10%" align="left"></td>             
	         <td nowrap width="40%" align="left"></td>
             <td nowrap width="10%" align="right"> </td> 
             <td nowrap width="40%" align="left"> 
			 </td>
		   </tr>	
           <tr id="trdark"> 
             <td nowrap width="10%" align="right">Número de Cuenta : </td>
	         <td nowrap width="40%" align="left">
	           <INPUT type="text" name="E01BPVACC2" maxlength="12" size="15" <%= read %> value="<%= EBP0110Record.getE01BPVACC2().trim()%>">
               <A href="javascript:GetAccount('E01BPVACC2','','','')">
                	<IMG src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda Cuenta" border="0" align="top"></A>
             </td>
             <td nowrap width="10%" align="right"></td> 
             <td nowrap width="40%" align="left"></td>
		   </tr>		
		   <tr id="trclear"> 
             <td nowrap width="10%" align="left"><B>Información para pago en Cuenta Contable </B></td>
             <td nowrap width="10%" align="left"></td>             
	         <td nowrap width="40%" align="left"></td>
             <td nowrap width="10%" align="right"></td> 
             <td nowrap width="40%" align="left"> 
			 </td>
		   </tr>	
           <tr id="trdark"> 
             <td nowrap width="10%" align="right">Número de Cuenta : </td>
	         <td nowrap width="40%" align="left">
             	<INPUT type="text" name="E01BPVACC3" maxlength="16" size="18" <%= read %> value="<%= EBP0110Record.getE01BPVACC3().trim()%>">
               <A href="javascript:GetLedger('E01BPVACC3','','','')"> 
               		<IMG src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda Cuenta GL" border="0" align="top"></A>
             </td>
             <td nowrap width="10%" align="right"></td> 
             <td nowrap width="40%" align="left"> 
             </td>
		   </tr>		

		   <tr id="trclear"> 
             <td nowrap width="10%" align="left"><B>Información para pago por SWIFT </B></td>
	         <td nowrap width="40%" align="left"> </td>
             <td nowrap width="10%" align="right"> </td> 
             <td nowrap width="40%" align="left"> </td>
		   </tr>	
           <tr id="trdark"> 
             <td nowrap width="10%" align="right">Instrucciones : </td>
	         <td nowrap width="40%" align="left">
             	<A href="javascript:goCustIns()">
             		<IMG src="<%=request.getContextPath()%>/images/1bori.gif" title="Instrucciones de Pago del Cliente" align="middle" border="0">
				</A>
			</td>
             <td nowrap width="10%" align="right"> </td> 
             <td nowrap width="40%" align="left"> </td>
		    </tr>	

      </table>
	 </td></tr></table>  
   <h4>Información de Impuestos</h4>
     <table width="100%" > <tr bordercolor="#FFFFFF"> <td width="100%" nowrap> 		
		<table class="tableinfo" cellspacing="0" width="100%" border="0">
        <tr id="trdark"> 
          <td nowrap width="10%" align="right">Excepción de Impuestos : </td>
	      <td nowrap width="40%" align="left"> 
            <input type="radio" name="E01BPVFTX" value="Y" <% if (EBP0110Record.getE01BPVFTX().equals("Y")) out.print("checked"); %>>
             Si 
            <input type="radio" name="E01BPVFTX" value="N" <% if (EBP0110Record.getE01BPVFTX().equals("N")) out.print("checked"); %>>
             No          
            <B><IMG src="<%=request.getContextPath()%>/images/Check.gif" title="Campo Obligatorio" align="bottom"></B></td>
          <td nowrap width="10%" align="right"></td> 
          <td nowrap width="40%" align="left"></td>
        </tr>
        <tr id="trclear"> 
          <td nowrap width="10%" align="right">Forma : </td>
          <td nowrap width="40%" align="left" >
			<SELECT name="E01BPVWTH" <%= disabled %>>
	          <OPTION <%= EBP0110Record.getE01BPVWTH().trim().equals("N")?"Selected":"" %> value="N">N/A</OPTION>		
			  <OPTION <%= EBP0110Record.getE01BPVWTH().trim().equals("B")?"Selected":"" %> value="B">Ambos</OPTION>
			  <OPTION <%= EBP0110Record.getE01BPVWTH().trim().equals("F")?"Selected":"" %> value="F">Forma 1099</OPTION>
			  <OPTION <%= EBP0110Record.getE01BPVWTH().trim().equals("W")?"Selected":"" %> value="W">Retención</OPTION>
			</SELECT>
		  </td>	
          <td nowrap width="10%" align="right"></td> 
          <td nowrap width="40%" align="left"></td>
        </tr>
      </table>
     </td></tr></table>
  <h5></h5>
	<table width="100%" > <tr bordercolor="#FFFFFF"> <td width="100%" nowrap> 		
	  <table class="tableinfo" cellspacing="0" width="100%" border="0">
        <tr id="trdark"> 
          <td nowrap width="10%" align="right">Estado : </td>
	      <td nowrap width="40%" align="left">
	        <SELECT name="E01BPVSTA" <%= disabled %>>
			  <OPTION <%= EBP0110Record.getE01BPVSTA().trim().equals("A")?"Selected":"" %> value="A">Activo</OPTION>
			  <OPTION <%= EBP0110Record.getE01BPVSTA().trim().equals("I")?"Selected":"" %> value="I">Inactivo</OPTION>
			</SELECT>
			<B><IMG src="<%=request.getContextPath()%>/images/Check.gif" title="Campo Obligatorio" align="bottom"></B>
          </td>
            <td nowrap width="10%" align="right"> </td> 
            <td nowrap width="40%" align="left"> 
			</td>
		</tr>
       </table>
	</td> </tr></table> 
    <h5></h5>
    <table width="100%">		
  	<tr>
  		<td width="33%">
  		  <div align="center"> 
     		<input id="EIBSBTN" type=button name="Submit" value="Enviar" onClick="goAction(5);" <%= disabled %>>
     	  </div>	
  		</td>
  		<td width="33%"> 
  		  <div align="center"> 
     		<input id="EIBSBTN" type=button name="Delete" value="Borrar" onClick="goAction(4);" <%= disabled %>>
     	  </div>	
  		</td>
  		<td width="34%">
  		  <div align="center"> 
     		<input id="EIBSBTN" type=submit name="Exit" value="Salir" 
			<% if (userPO.getPurpose().equals("NEW") || userPO.getPurpose().equals("MAINTENANCE"))  { %>
			    onClick="goAction(1);" 
			<% } else { %>
				onClick="goAction(6);" 
			<% } %>>
     	  </div>	
  		</td>

  	</tr>	
  </table>	
</td> </tr> </table>
</form>
</body>
</html>
