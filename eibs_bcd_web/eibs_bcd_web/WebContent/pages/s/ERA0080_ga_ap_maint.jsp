<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@ page import = "datapro.eibs.master.Util" %>
<%@page import="com.datapro.constants.EibsFields"%>
<%@page import="com.datapro.eibs.constants.HelpTypes"%>

<html>
<head>
<title>Información  Básica de Garantías</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id="gaMant" class= "datapro.eibs.beans.ERA001101Message"  scope="session"/>
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session"/>
<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session"/>
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>
 
<SCRIPT type="text/javascript">

function setOptMenu(purpose) {
	if (purpose == "INQUIRY") {
    	builtNewMenu(colla_i_opt);
	} else {
    	builtNewMenu(colla_A_opt);
    }	
    initMenu();
}

function  hideDepreciar(value){
 if (value) {
   Depreciar.style.display="";}
 else{
   Depreciar.style.display="none"; }
}

</SCRIPT>

<SCRIPT type="text/javascript">
	setOptMenu("<%= userPO.getPurpose() %>");
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
   
%> 
<h3 align="center">Garant&iacute;as - Informaci&oacute;n B&aacute;sica
<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="ga_ap_maint.jsp,ERA0080"></h3> 
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSERA0011" >

<% if ( !userPO.getPurpose().equals("NEW") ) { %>
  		<INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="2">
<% } else { %>
   		<INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="500">
<% } %>

    
   <input type="hidden" name="E01ROCBNK" size="2" maxlength="2" value="<%= gaMant.getE01ROCBNK().trim()%>" >               
   <input type="hidden" name="E01ROCBRN" size="4" maxlength="3" value="<%= gaMant.getE01ROCBRN().trim()%>" >
   <input type="hidden" name="E01ROCGLN" size="16" maxlength="16" value="<%= gaMant.getE01ROCGLN().trim()%>" >
   <input type="hidden" name="E01ROCTYP" readonly size="2" maxlength="2" value="<%= gaMant.getE01ROCTYP().trim()%>">
   <input type="hidden" name="E01ROCUC9" readonly size="4" maxlength="4" value="<%= gaMant.getE01ROCUC9().trim()%>" >
                                     
  <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
          <tr id="trdark">
            <td nowrap> 
              <div align="right"><b>Cliente : </b></div>
            </td>
            <td nowrap > 
              <div align="left"> 
                <% if ( userPO.getPurpose().equals("NEW") ) { %>  
                		<input type="text" name="E01ROCCUN" size="11" maxlength="9" value="<%= gaMant.getE01ROCCUN().trim()%>" readonly >
                		<a href="javascript:GetCustomerDescId('E01ROCCUN','E01CUSNA1','')"></a>
                <% } else {	%> 
                		<input type="text" name="E01ROCCUN" readonly size="11" maxlength="9" value="<%= gaMant.getE01ROCCUN().trim()%>">
              	<% }%>
              </div>
            </td>
            <td nowrap> 
              <div align="right"><b>Nombre :</b> </div>
            </td>
            <td nowrap> 
              <div align="left">
                <input type="text" name="E01CUSNA1" readonly size="47" maxlength="45" value="<%= gaMant.getE01CUSNA1().trim()%>" >
              </div>
            </td>
          </tr> 
          <tr id="trdark">
            <td nowrap > 
              <div align="right"><b>No. Referencia : </b></div>
            </td>
            <td nowrap>
             <%	if ( userPO.getPurpose().equals("NEW") ) {	%> 
              		<input type="hidden" name="E01ROCREF" size="15" maxlength="13" value="<%= gaMant.getE01ROCREF().trim()%>">
              		<input type="text" name="TMPREF" size="15" maxlength="13" value="<% if (gaMant.getE01ROCREF().trim().equals("999999999999")) out.print("NUEVA CUENTA"); else out.print(gaMant.getE01ROCREF().trim()); %>" readonly>
              <% } else { %> 
              		<input type="text" name="E01ROCREF" size="15" maxlength="13" value="<%= gaMant.getE01ROCREF().trim()%>" readonly>
              <% } 	%>
            </td> 
            <td nowrap> 
              <div align="right"><b>Moneda : </b></div>
            </td>
            <td nowrap> 
              <div align="left">
               <input type="text" name="E01ROCCCY" size="4" maxlength="3" value="<%= gaMant.getE01ROCCCY().trim()%>" readonly> 
              </div>
            </td>
           </tr>
          <tr id="trdark">             
            <td nowrap> 
              <div align="right"><b>Producto :</b> </div>
            </td>
            <td nowrap> 
              <div align="left">
                <input type="text" name="PRODUCT" size="38" value="<%= gaMant.getE01ROCPRD().trim()%> - <%= gaMant.getE01ROCDPR().trim()%>" readonly>                 
                <input type="hidden" name="E01ROCPRD" size="6" maxlength="4" value="<%= gaMant.getE01ROCPRD().trim()%>" readonly> 
                <input type="hidden" name="E01ROCDPR" size="32" maxlength="30" value="<%= gaMant.getE01ROCDPR().trim()%>" readonly> 
              </div>
            </td>
            <td nowrap> 
              <div align="right"><b>Bien :</b> </div>
            </td>
            <td nowrap> 
              <div align="left">
                <input type="text" name="BIEN" size="38" value="<%= gaMant.getE01ROCCGT().trim()%> - <%= gaMant.getE01ROCDGT().trim()%>" readonly>                 
                <input type="hidden" name="E01ROCCGT" size="6" maxlength="4" value="<%= gaMant.getE01ROCCGT().trim()%>" readonly> 
                <input type="hidden" name="E01ROCDGT" size="32" maxlength="30" value="<%= gaMant.getE01ROCDGT().trim()%>" readonly> 
                <% 
                	String bien = gaMant.getE01ROCCGT().trim() + " - " + gaMant.getE01ROCDGT().trim();
                	int idxTaxi = bien.indexOf("TAXI");
                	int idxBus = bien.indexOf("BUS");
                %> 
              </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  
  
  <h4>Informaci&oacute;n B&aacute;sica</h4>
      
  <table class="tableinfo" width="100%">
    <tr > 
      <td nowrap> 
        <table cellspacing=0 cellpadding=2 width="100%" border="0">
          <tr id="trdark"> 
            <td nowrap> 
              <div align="right"> Propietario : </div>
            </td>
            <td nowrap colspan=3 width="100%">
             
              <table id="headTable" >
    			<tr id="trdark">
    			    <td nowrap align="center" >Codigo</td> 
      				<td nowrap align="center" >ID</td>
      				<td nowrap align="center" >Nombre</td>
    			</tr>
    		  </table>
    
    		  <div id="dataDiv" style="height:60; overflow-y :scroll; z-index:0" >
    		    <table id="dataTable" width="100%">
          		<%
  			 		int amount = 25;
 			 		String name;
  			 		for ( int i=1; i<=amount; i++ ){
   				  		if (i<10) name = "0" + i; else name= "" + i;
   				%> 
          		<tr id="trclear"> 
            		<td nowrap>
						<div align="center"><input type="text"
							readonly name="E01ROWN<%= name %>" size="11" maxlength="9"
							value="<%= gaMant.getField("E01ROWN"+name).getString().trim()%>">
						</div>
						</td>
            		<td nowrap >
						<div align="center"><input type="text"
							readonly name="E01RUTO<%= name %>" size="31" maxlength="30"
							value="<%= gaMant.getField("E01RUTO"+name).getString().trim()%>">
						</div>
						</td>
            		<td nowrap width="250">
						<div align="center"><input type="text" readonly name="E01RNAM<%= name %>"
							size="37" maxlength="35"
							value="<%= gaMant.getField("E01RNAM"+name).getString().trim()%>">
						</div>
					</td>            		            
          		</tr>
          		<%	}	%> 
       			</table>
     		 </div>
            </td>            
          </tr>


          <tr id="trdark">  
            <td nowrap> 
              <div align="right">Fecha Apertura : </div>
            </td>
            <td nowrap >
			  <eibsinput:date name="gaMant" fn_month="E01ROCOPM" fn_day="E01ROCOPD" fn_year="E01ROCOPY" readonly="TRUE" required="false"/>
            </td>
            <td nowrap >
              <div align="right">Fecha Vencimiento : </div>
            </td>
            <td nowrap >
			  <eibsinput:date name="gaMant" fn_month="E01ROCMTM" fn_day="E01ROCMTD" fn_year="E01ROCMTY" readonly="TRUE" required="false"/>
            </td>
          </tr>

   		  <tr id="trclear"> 
			<td nowrap> 
              <div align="right">Estado del Bien : </div>
            </td>
            <td nowrap>            	 
              <INPUT type="text" name="E01ROCEST" size="2" maxlength="1" value="<%= gaMant.getE01ROCEST().trim()%>" readonly>
            </td>
            <td nowrap> 
              <div align="right">Origen de la Garantía : </div>
            </td>
            <td nowrap>            	 
              <INPUT type="text" name="E01ROCUC1" size="5" maxlength="4" value="<%= gaMant.getE01ROCUC1().trim()%>"  readonly>
			</td>

          </tr>

   		  <tr id="trdark"> 
			<td nowrap> 
              <div align="right">Tabla de Depreciación : </div>
            </td>
            <td nowrap>            	 
              <INPUT type="text" name="E01ROCUC9" size="5" maxlength="4" value="<%= gaMant.getE01ROCUC9().trim()%>"  readonly>
            </td>
            <td nowrap> 
              <div align="right">Contenido de la Garantía : </div>
            </td>
            <td nowrap>            	 
              <INPUT type="text" name="E01ROCAYR" size="5" maxlength="4" value="<%= gaMant.getE01ROCAYR().trim()%>"  readonly>
			</td>

          </tr>

                   
   		  <tr id="trclear">
   		  <%  if (currUser.getE01INT().trim().equals("11")) {%> 
   		  <td nowrap> 
              <div align="right"><b>Porcentaje Disponible :</b></div>
            </td>
            <td nowrap>            	 
	       	  <div align="left"> 
              	<input type="text" name="E01ROCPRS" readonly size="10" maxlength="9" value="<%= gaMant.getE01ROCPRS().trim()%>">
              </div>
            </td>
   		  <% } else    {%> 
            <td nowrap> 
              <div align="right"><b>Máxima Responsabilidad Crediticia :</b></div>
            </td>
            <td nowrap>            	 
	       	  <div align="left"> 
              	<input type="text" name="E01ROCPRS" readonly size="11" maxlength="7" value="<%= gaMant.getE01ROCPRS().trim()%>">
              </div>
            </td>
          <% }%>   
            <td nowrap> 
              <div align="right"><b>Total Cuentas Garantizadas :</b></div>
            </td>
            <td nowrap>            	 
              <div align="left">
              	<input type="text" name="E01ROCIAL" readonly size="17" maxlength="15" value="<%= gaMant.getE01ROCIAL().trim()%>">
              </div>
            </td>
          </tr>			

                   
   		  <tr id="trdark"> 
            <td nowrap> 
              <div align="right">Descripción :</div>
            </td>
            <td nowrap colspan="3">            	 
              <eibsinput:text name="gaMant" property="E01ROCSP1" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true"/>
            </td>
          </tr>			
          <tr id="trclear">  
			<td nowrap> 
              <div align="right"> </div>
            </td>
            <td nowrap colspan="3">            	 
              <eibsinput:text name="gaMant" property="E01ROCSP2" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true"/>
            </td>
          </tr>
   		  <tr id="trdark"> 
            <td nowrap> 
              <div align="right"> </div>
            </td>
            <td nowrap colspan="3">            	 
              <eibsinput:text name="gaMant" property="E01ROCSP3" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true"/>
            </td>
          </tr>			
          <tr id="trclear">  
			<td nowrap> 
              <div align="right"> </div>
            </td>
            <td nowrap colspan="3">            	 
              <eibsinput:text name="gaMant" property="E01ROCSP4" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true"/>
            </td>
          </tr>
   		  <tr id="trdark"> 
            <td nowrap> 
              <div align="right"> </div>
            </td>
            <td nowrap colspan="3">            	 
              <eibsinput:text name="gaMant" property="E01ROCSP5" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true"/>              
            </td>
          </tr>			
         </table>
      </td>
    </tr>
  </table>

  <h4>Ubicación</h4>
      
  <table class="tableinfo" width="100%">
    <tr > 
      <td nowrap> 
        <table cellspacing=0 cellpadding=2 width="100%" border="0">

   
        <%if( gaMant.getH01SCRCOD().equals("07")){%> 
			<tr id="trdark">
            <td nowrap> 
              <div align="right">Calle : </div>
            </td>
            <td nowrap> 
              <eibsinput:text name="gaMant" property="E01NA2" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true"/>
           	</td>
				<TD nowrap align="right">Provincia : </TD>
				<TD nowrap>
					<eibsinput:text name="gaMant" property="D01STE" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true"/>
				</TD>
			</tr>
          <tr id="trclear">  
            <td nowrap> 
              <div align="right">Residencial/edificio : </div>
            </td>
				<td nowrap>
					<eibsinput:text name="gaMant" property="E01NA3" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true"/>
				</td>
				<TD nowrap align="right">Distrito : </TD>
				<TD nowrap>
					<eibsinput:text name="gaMant" property="D01TID" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true"/>
				</TD>
			</tr>
          <tr id="trdark"> 
            <td nowrap> 
              <div align="right">No. Casa/Apto :</div>
            </td>
				<td nowrap>
					<eibsinput:text name="gaMant" property="E01NA4" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true"/>
				</TD>
				<TD nowrap>
					<eibsinput:text name="gaMant" property="D01PID" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true"/>
				</TD>
			</tr>
          <tr id="trclear">  
            <td nowrap> 
              <div align="right">Apartado Postal : </div>
            </td>
				<td nowrap>
				<input type="hidden" readonly name="E01STE" size="6"
					maxlength="4" value="<%= gaMant.getE01STE().trim()%>"  readonly>
					<INPUT
					type="text" readonly name="E01POB" size="11" maxlength="10"
					value="<%= gaMant.getE01POB().trim()%>" readonly>
				</td>
				<TD nowrap align="right">País : </TD>
				<TD nowrap>
				<INPUT type="text" readonly name="E01CTR" size="21" maxlength="20"
					value="<%= gaMant.getE01CTR().trim()%>" readonly>
				</TD>
			</tr>
          <tr id="trdark">  
            <td nowrap> 
              <div align="right"></div>
            </td>
				<td nowrap ><input type="hidden" readonly name="E01TID" size="6"
					maxlength="4" value="<%= gaMant.getE01TID().trim()%>" readonly>
				</td>
				<TD nowrap align="right">Código Postal : </TD>
				<TD nowrap>
				<INPUT type="hidden" readonly name="E01ZPC" size="17" maxlength="15"
					value='<%= (gaMant.getE01ZPC() != null && !gaMant.getE01ZPC().trim().equals("") && gaMant.getE01ZPC().trim().length() > 4 )
              	?gaMant.getE01ZPC().substring(0,3):""%>'>
				<INPUT type="text" readonly name="D01ZPC" size="17" maxlength="15"
					value='<%= (gaMant.getE01ZPC() != null && !gaMant.getE01ZPC().trim().equals("") && gaMant.getE01ZPC().trim().length() > 5 )
              	?gaMant.getE01ZPC().substring(4):""%>' readonly>
				</TD>
			</tr>

			<%} else {%>
 
            <tr id="trdark"> 
              <td nowrap> 
                <div align="right">Dirección Principal :</div>
              </td>
				<td nowrap >
					<eibsinput:text name="gaMant" property="E01NA2" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true"/>
				</td>
				<TD nowrap align="right">Ciudad : </TD>
				<TD nowrap><INPUT type="text" readonly name="E01CTY" size="31" maxlength="30"
					value="<%= gaMant.getE01CTY().trim()%>" readonly>
				</TD>
			</tr>
          <tr id="trclear">  
              <td nowrap> 
                <div align="right"></div>
              </td>
				<td nowrap >
					<eibsinput:text name="gaMant" property="E01NA3" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true"/>
				</td>
				<TD nowrap align="right">Estado : </TD>
				<TD nowrap><INPUT type="text" readonly name="E01STE" size="5" maxlength="4"
					value="<%= gaMant.getE01STE().trim()%>" readonly>
				</TD>
			</tr>
            <tr id="trdark"> 
              <td nowrap> 
                <div align="right"></div>
              </td>
				<td nowrap >
					<eibsinput:text name="gaMant" property="E01NA4" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true"/>
				</td>
				<TD nowrap align="right">País : </TD>
				<TD nowrap><INPUT type="text" readonly name="E01CTR" size="21"
					maxlength="20" value="<%= gaMant.getE01CTR().trim()%>" readonly>
				</TD>
			</tr>
          <tr id="trclear">  
              <td nowrap> 
                <div align="right">Apartado Postal : </div>
              </td>
				<td nowrap><INPUT type="text" readonly name="E01POB" size="11"
					maxlength="10" value="<%= gaMant.getE01POB().trim()%>" readonly>
				</td>
				<TD nowrap align="right">Código Postal : </TD>
				<TD nowrap><INPUT type="text" readonly name="E01ZPC" size="16"
					maxlength="15" value="<%= gaMant.getE01ZPC().trim()%>" readonly>
				</TD>
			</tr>

         <%} %>   
         </table>
      </td>
    </tr>
  </table>



<%-- A. BIENES MUEBLES --%>

<% if (gaMant.getE01ROCTYP().equals("A")) { %>

  <h4>Detalle de Garantía</h4>

    <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing=0 cellpadding=2 width="100%" border="0">          

   		  <tr id="trdark"> 
            <td nowrap> 
              <div align="right">Valor Inicial :</div>
            </td>
            <td nowrap colspan="3">            	 
            	<eibsinput:text name="gaMant" property="E01ROCAM1" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/>
            </td>
			<td nowrap> 
              <div align="right">Valor Actual :</div>
            </td>
            <td nowrap colspan="3">            	 
            	<eibsinput:text name="gaMant" property="E01ROCFAA" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/>
            </td>
          </tr>
   		  <tr id="trclear"> 
            <td nowrap> 
              <div align="right">Número de Póliza :</div>
            </td>
            <td nowrap colspan="3">            	 
              <input type="text" name="E01ROCLOC" size="37" maxlength="35" value="<%= gaMant.getE01ROCLOC().trim()%>" readonly >
            </td>
			<td nowrap> 
              <div align="right">Valor de Cobertura :</div>
            </td>
            <td nowrap colspan="3">            	 
	            <eibsinput:text name="gaMant" property="E01ROCAM2" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/>
            </td>
          </tr>
   		  <tr id="trdark"> 
            <td nowrap> 
              <div align="right">Fecha Renovación Póliza :</div>
            </td>
            <td nowrap colspan="3">            	 
             <INPUT type="text" name="E01ROCPDM" size=2 maxlength=2 value="<%= gaMant.getE01ROCPDM()%>" readonly>
             <INPUT type="text" name="E01ROCPDD" size=2 maxlength=2 value="<%= gaMant.getE01ROCPDD()%>" readonly>
             <INPUT type="text" name="E01ROCPDY" size=5 maxlength=4 value="<%= gaMant.getE01ROCPDY()%>" readonly>
            </td>
			<td nowrap> 
              <div align="right">Aseguradora :</div>
            </td>
            <td nowrap colspan="3">            	 
              <input type="text" name="E01ROCAIN" size="5" maxlength="4" value="<%= gaMant.getE01ROCAIN().trim()%>" readonly>
            </td>
          </tr>

   		  <tr id="trclear"> 
            <td nowrap> 
              <div align="right">Fecha de Avalúo :</div>
            </td>
            <td nowrap colspan="3">            	 
			  <eibsinput:date name="gaMant" fn_month="E01ROCAPM" fn_day="E01ROCAPD" fn_year="E01ROCAPY" readonly="TRUE" required="false"/>
            </td>
			<td nowrap> 
              <div align="right">Fiduciaria :</div>
            </td>
            <td nowrap colspan="3">            	 
              <input type="text" name="E01ROCU10" size="5" maxlength="4" value="<%= gaMant.getE01ROCU10().trim()%>" readonly>
            </td>
          </tr>
   		  <tr id="trdark"> 
            <td nowrap> 
              <div align="right">Fecha Adquisición :</div>
            </td>
            <td nowrap colspan="3">   
			  <eibsinput:date name="gaMant" fn_month="E01ROCIDM" fn_day="E01ROCIDD" fn_year="E01ROCIDY" readonly="TRUE" required="false"/>
            </td>
			<td nowrap> 
              <div align="right">Identificación Fideicomiso :</div>
            </td>
            <td nowrap colspan="3">            	 
             <INPUT type="text" name="E01ROCRF4" size=32 maxlength=30 value="<%= gaMant.getE01ROCRF4()%>">
            </td>
          </tr>
   		  <tr id="trdark"> 
            <td nowrap> 
              <div align="right">Número de Serie :</div>
            </td>
            <td nowrap colspan="3">            	 
             <INPUT type="text" name="E01ROCRF2" size=22 maxlength=20 value="<%= gaMant.getE01ROCRF2()%>" readonly>
            </td>
			<td nowrap> 
              <div align="right">Modelo :</div>
            </td>
            <td nowrap colspan="3">            	 
             <INPUT type="text" name="E01ROCRF3" size=12 maxlength=10 value="<%= gaMant.getE01ROCRF3()%>" readonly>
            </td>
          </tr>
   		  <tr id="trclear"> 
            <td nowrap> 
              <div align="right">Marca :</div>
            </td>
            <td nowrap colspan="3">            	 
             <INPUT type="text" name="E01ROCNPH" size=17 maxlength=15 value="<%= gaMant.getE01ROCNPH()%>" readonly>
            </td>

			<td nowrap> 
              <div align="right"> </div>
            </td>
            <td nowrap colspan="2">            	 
              <div align="right"> </div>
            </td>
            <td nowrap>            	 
              <div align="right"> </div>
            </td>


<%--
			<td nowrap> 
              <div align="right">Vencimiento en :</div>
            </td>
            <td nowrap colspan="2">            	 
            <INPUT type="text" name="E01ROCYPH" size="5" maxlength="4" value="<%= gaMant.getE01ROCYPH().trim()%>" readonly>
            </td>
            <td nowrap>            	 
              <div align="left">días</div>
            </td>
--%>
          </tr>

        </table>          
      </td> 
    </tr> 
    </table>
<% } %> 


<%-- B. BIENES INMUEBLES --%>

<% if (gaMant.getE01ROCTYP().equals("B")) { %>

  <h4>Detalle de Garantía</h4>

    <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing=0 cellpadding=2 width="100%" border="0">          
   		  <tr id="trdark"> 
            <td nowrap> 
              <div align="right">Finca :</div>
            </td>
            <td nowrap colspan="3">            	 
            <INPUT type="text" name="E01ROCNUN" size="11" maxlength="9" value="<%= gaMant.getE01ROCNUN().trim()%>" readonly>
            </td>
			<td nowrap> 
              <div align="right">Metros :</div>
            </td>
            <td nowrap>            	 
            <INPUT type="text" name="E01ROCNCO" size="6" maxlength="5" value="<%= gaMant.getE01ROCNCO().trim()%>" readonly>
            </td>
			<td nowrap> 
              <div align="right">Hectareas :</div>
            </td>
            <td nowrap>            	 
            <INPUT type="text" name="E01ROCAIN" size="5" maxlength="4" value="<%= gaMant.getE01ROCAIN().trim()%>" readonly>
            </td>
          </tr>
   		  <tr id="trclear"> 
            <td nowrap> 
              <div align="right">Inscripción Registro Público :</div>
            </td>
            <td nowrap colspan="3">            	 
              <input type="text" name="E01ROCLOC" size="37" maxlength="35" value="<%= gaMant.getE01ROCLOC().trim()%>" readonly>
            </td>
			<td nowrap> 
              <div align="right">Tomo :</div>
            </td>
            <td nowrap>            	 
        	    <INPUT type="text" name="E01ROCFPH" size="10" maxlength="8" value="<%= gaMant.getE01ROCFPH().trim()%>" readonly>
            </td>
			<td nowrap> 
              <div align="right">Folio/Imagen :</div>
            </td>
            <td nowrap>            	 
    	        <INPUT type="text" name="E01ROCNPH" size="10" maxlength="8" value="<%= gaMant.getE01ROCNPH().trim()%>" readonly>
            </td>
          </tr>
   		  <tr id="trdark"> 
            <td nowrap> 
              <div align="right">Ficha/Asiento :</div>
            </td>
            <td nowrap colspan="3">            	 
	            <INPUT type="text" name="E01ROCCPH" size="10" maxlength="8" value="<%= gaMant.getE01ROCCPH().trim()%>" readonly>
	        </td>
			<td nowrap> 
              <div align="right">Tipo de Vivienda :</div>
            </td>
            <td nowrap colspan="3">            	 
              <INPUT type="text" name="E01ROCUC2" size="5" maxlength="4" value="<%= gaMant.getE01ROCUC2().trim()%>" readonly>
            </td>
          </tr>
   		  <tr id="trclear"> 
            <td nowrap> 
              <div align="right">Valor Inicial :</div>
            </td>
            <td nowrap colspan="3">            	 
	            <eibsinput:text name="gaMant" property="E01ROCAM1" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/>
            </td>
			<td nowrap> 
              <div align="right">Valor Terreno :</div>
            </td>
            <td nowrap colspan="3">            	 
	            <eibsinput:text name="gaMant" property="E01ROCFAA" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/>
            </td>
          </tr>
   		  <tr id="trdark"> 
            <td nowrap> 
              <div align="right">Valor Mejoras :</div>
            </td>
            <td nowrap colspan="3">            	 
	            <eibsinput:text name="gaMant" property="E01ROCAM2" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/>
	        </td>
			<td nowrap> 
              <div align="right">Fecha Avaluo Inicial :</div>
            </td>
            <td nowrap colspan="3">            	 
			  <eibsinput:date name="gaMant" fn_month="E01ROCAPM" fn_day="E01ROCAPD" fn_year="E01ROCAPY" readonly="TRUE" required="false"/>
            </td>
          </tr>
   		  <tr id="trclear"> 
            <td nowrap> 
              <div align="right">Fiduciaria :</div>
            </td>
            <td nowrap colspan="3">            	 
              <input type="text" name="E01ROCU10" size="5" maxlength="4" value="<%= gaMant.getE01ROCUC7().trim()%>" readonly>
            </td>
			<td nowrap> 
              <div align="right">Fecha Ultimo Avaluo FCA :</div>
            </td>
            <td nowrap colspan="3">            	 
			  <eibsinput:date name="gaMant" fn_month="E01ROCSTM" fn_day="E01ROCSTD" fn_year="E01ROCSTY" readonly="TRUE" required="false"/>
            </td>
          </tr>
   		  <tr id="trdark"> 
            <td nowrap> 
              <div align="right">Código de Avaluador :</div>
            </td>
            <td nowrap colspan="3">            	 
              <input type="text" name="E01ROCUC3" size="5" maxlength="3" value="<%= gaMant.getE01ROCUC3().trim()%>" readonly>
            </td>
			<td nowrap> 
              <div align="right">Fecha Adquisición :</div>
            </td>
            <td nowrap colspan="3">            	 
			  <eibsinput:date name="gaMant" fn_month="E01ROCIDM" fn_day="E01ROCIDD" fn_year="E01ROCIDY" readonly="TRUE" required="false"/>
            </td>
          </tr>
   		  <tr id="trclear"> 
            <td nowrap> 
              <div align="right">Condición de la Hipoteca :</div>
            </td>
            <td nowrap colspan="3">            	 
             <INPUT type="text" name="E01ROCNC1" size=4 maxlength=2 value="<%= gaMant.getE01ROCNC1()%>" readonly>
            </td>
			<td nowrap> 
              <div align="right">Identificación Fideicomiso :</div>
            </td>
            <td nowrap colspan="3">            	 
             <INPUT type="text" name="E01ROCRF4" size=32 maxlength=30 value="<%= gaMant.getE01ROCRF4()%>" readonly>
            </td>
          </tr>
   		  <tr id="trdark"> 
			<td nowrap> 
              <div align="right">Fecha de Escritura :</div>
            </td>
            <td nowrap colspan="3">            	 
             <INPUT type="text" name="E01ROCNDM" size=2 maxlength=2 value="<%= gaMant.getE01ROCNDM()%>" readonly>
             <INPUT type="text" name="E01ROCNDD" size=2 maxlength=2 value="<%= gaMant.getE01ROCNDD()%>" readonly>
             <INPUT type="text" name="E01ROCNDY" size=5 maxlength=4 value="<%= gaMant.getE01ROCNDY()%>" readonly>
            </td>
			<td nowrap> 
              <div align="right">Número de Escritura :</div>
            </td>
            <td nowrap colspan="3">            	 
             <INPUT type="text" name="E01ROCRF5" size=10 maxlength=8 value="<%= gaMant.getE01ROCRF5()%>" readonly>
            </td>
          </tr>
   		  <tr id="trdark"> 

			<td nowrap> 
              <div align="right"> </div>
            </td>
            <td nowrap colspan="2">            	 
              <div align="right"> </div>
            </td>
            <td nowrap>            	 
              <div align="right"> </div>
            </td>


<%--
			<td nowrap> 
              <div align="right">Vencimiento en :</div>
            </td>
            <td nowrap colspan="2">            	 
            <INPUT type="text" name="E01ROCYPH" size="5" maxlength="4" value="<%= gaMant.getE01ROCYPH().trim()%>" readonly>
            </td>
            <td nowrap>            	 
              <div align="left">días</div>
            </td>
--%>

			<td nowrap> 
              <div align="right"> </div>
            </td>
            <td nowrap colspan="3">            	 
            </td>
          </tr>

        </table>          
      </td> 
    </tr> 
    </table>
<% } %> 

<%-- C. DEPOSITOS EN EL BANCO/OTROS BANCOS --%>

<% if (gaMant.getE01ROCTYP().equals("C")) { %>

  <h4>Detalle de Garantía</h4>

    <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing=0 cellpadding=2 width="100%" border="0">          
   		  <tr id="trdark"> 
            <td nowrap> 
              <div align="right">Valor Inicial :</div>
            </td>
            <td nowrap colspan="3">            	 
            	<eibsinput:text name="gaMant" property="E01ROCFAA" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/>
            </td>
			<td nowrap> 
              <div align="right">Valor de lo Pignorado :</div>
            </td>
            <td nowrap colspan="3">            	 
            	<eibsinput:text name="gaMant" property="E01ROCAM1" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/>
            </td>
          </tr>
   		  <tr id="trclear"> 
            <td nowrap> 
              <div align="right">Fecha de Renovación del Plazo :</div>
            </td>
            <td nowrap colspan="3">            	 
			  <eibsinput:date name="gaMant" fn_month="E01ROCAPM" fn_day="E01ROCAPD" fn_year="E01ROCAPY" readonly="TRUE" required="false"/>
            </td>
			<td nowrap> 
              <div align="right">Fiduciaria :</div>
            </td>
            <td nowrap colspan="3">            	 
              <input type="text" name="E01ROCU10" size="5" maxlength="4" value="<%= gaMant.getE01ROCUC7().trim()%>" readonly>
            </td>
          </tr>
   		  <tr id="trdark"> 
			<td nowrap> 
              <div align="right">Fecha de Retención :</div>
            </td>
            <td nowrap colspan="3">            	 
             <INPUT type="text" name="E01ROCNDM" size=2 maxlength=2 value="<%= gaMant.getE01ROCNDM()%>" readonly>
             <INPUT type="text" name="E01ROCNDD" size=2 maxlength=2 value="<%= gaMant.getE01ROCNDD()%>" readonly>
             <INPUT type="text" name="E01ROCNDY" size=5 maxlength=4 value="<%= gaMant.getE01ROCNDY()%>" readonly>
            </td>
			<td nowrap> 
              <div align="right">Identificación Fideicomiso :</div>
            </td>
            <td nowrap colspan="3">            	 
             <INPUT type="text" name="E01ROCRF4" size=32 maxlength=30 value="<%= gaMant.getE01ROCRF4()%>" readonly>
            </td>
          </tr>
   		  <tr id="trclear"> 
            <td nowrap> 
              <div align="right">Número de la Garantía o Contrato :</div>
            </td>
            <td nowrap colspan="3">            	 
              <input type="text" name="E01ROCLOC" size="37" maxlength="35" value="<%= gaMant.getE01ROCLOC().trim()%>" readonly >
            </td>
			<td nowrap> 
              <div align="right">Código de Banco :</div>
            </td>
            <td nowrap colspan="3">            	 
              <INPUT type="text" name="E01ROCUC2" size="5" maxlength="4" value="<%= gaMant.getE01ROCUC2().trim()%>" readonly>
            </td>
          </tr>
   		  <tr id="trdark"> 

			<td nowrap> 
              <div align="right"> </div>
            </td>
            <td nowrap colspan="2">            	 
              <div align="right"> </div>
            </td>
            <td nowrap>            	 
              <div align="right"> </div>
            </td>


<%--
			<td nowrap> 
              <div align="right">Vencimiento en :</div>
            </td>
            <td nowrap colspan="2">            	 
            <INPUT type="text" name="E01ROCYPH" size="5" maxlength="4" value="<%= gaMant.getE01ROCYPH().trim()%>" readonly>
            </td>
            <td nowrap>            	 
              <div align="left">días</div>
            </td>
--%>

			<td nowrap> 
              <div align="right"> </div>
            </td>
            <td nowrap colspan="3">            	 
            </td>
          </tr>

        </table>          
      </td> 
    </tr> 
    </table>
<% } %> 

<%-- D. GARANTIAS PRENDARIAS --%>

<% if (gaMant.getE01ROCTYP().equals("D")) { %>

  <h4>Detalle de Garantía</h4>

    <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing=0 cellpadding=2 width="100%" border="0">          
   		  <tr id="trdark"> 
            <td nowrap> 
              <div align="right">Valor Inicial :</div>
            </td>
            <td nowrap colspan="3">            	 
            	<eibsinput:text name="gaMant" property="E01ROCAM1" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/>
            </td>
			<td nowrap> 
              <div align="right">Valor de Mercado :</div>
            </td>
            <td nowrap colspan="3">            	 
            	<eibsinput:text name="gaMant" property="E01ROCFAA" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/>
            </td>
          </tr>
   		  <tr id="trclear"> 
            <td nowrap> 
              <div align="right">Fecha Ultima Cotización del Instrumento :</div>
            </td>
            <td nowrap colspan="3">            	 
			  <eibsinput:date name="gaMant" fn_month="E01ROCAPM" fn_day="E01ROCAPD" fn_year="E01ROCAPY" readonly="TRUE" required="false"/>
            </td>
			<td nowrap> 
              <div align="right">Fiduciaria :</div>
            </td>
            <td nowrap colspan="3">            	 
              <input type="text" name="E01ROCU10" size="5" maxlength="4" value="<%= gaMant.getE01ROCUC7().trim()%>" readonly>
            </td>
          </tr>
   		  <tr id="trdark"> 
			<td nowrap> 
              <div align="right">Código de la Carta de Crédito o del Cedente :</div>
            </td>
            <td nowrap colspan="3">            	 
              <INPUT type="text" name="E01ROCUC2" size="5" maxlength="4" value="<%= gaMant.getE01ROCUC2().trim()%>" readonly>
            </td>
			<td nowrap> 
              <div align="right">Identificación Fideicomiso :</div>
            </td>
            <td nowrap colspan="3">            	 
             <INPUT type="text" name="E01ROCRF4" size=32 maxlength=30 value="<%= gaMant.getE01ROCRF4()%>" readonly>
            </td>
          </tr>
   		  <tr id="trclear"> 
			<td nowrap> 
              <div align="right">País de Emisión :</div>
            </td>
            <td nowrap colspan="3">            	 
				<INPUT type="text" name="E01ROCGRK" size="5" maxlength="4" value="<%= gaMant.getE01ROCGRK().trim()%>" readonly>
            </td>
			<td nowrap> 
              <div align="right">Cantidad :</div>
            </td>
            <td nowrap colspan="3">            	 
	            <INPUT type="text" name="E01ROCNUN" size="11" maxlength="9" value="<%= gaMant.getE01ROCNUN().trim()%>" readonly>
            </td>
          </tr>
   		  <tr id="trdark"> 
			<td nowrap> 
              <div align="right">Calificación de la Emisión :</div>
            </td>
            <td nowrap colspan="3">            	 
             <INPUT type="text" name="E01ROCNC1" size=4 maxlength=2 value="<%= gaMant.getE01ROCNC1()%>" readonly>
            </td>
			<td nowrap> 
              <div align="right">Calificación del Emisor :</div>
            </td>
            <td nowrap colspan="3">            	 
             <INPUT type="text" name="E01ROCNC2" size=4 maxlength=2 value="<%= gaMant.getE01ROCNC2()%>" readonly>
            </td>
          </tr>
   		  <tr id="trclear"> 
			<td nowrap> 
              <div align="right">Tipo de Instrumento Financiero :</div>
            </td>
            <td nowrap colspan="3">            	 
              <INPUT type="text" name="E01ROCUC3" size="5" maxlength="4" value="<%= gaMant.getE01ROCUC3().trim()%>" readonly>
            </td>
			<td nowrap> 
              <div align="right">Instr.Financi/Prenda Agraria ó Ganadera :</div>
            </td>
            <td nowrap colspan="3">            	 
              <input type="text" name="E01ROCLOC" size="37" maxlength="35" value="<%= gaMant.getE01ROCLOC().trim()%>" readonly>
            </td>
          </tr>
   		  <tr id="trdark"> 

			<td nowrap> 
              <div align="right"> </div>
            </td>
            <td nowrap colspan="2">            	 
              <div align="right"> </div>
            </td>
            <td nowrap>            	 
              <div align="right"> </div>
            </td>


<%--
			<td nowrap> 
              <div align="right">Vencimiento en :</div>
            </td>
            <td nowrap colspan="2">            	 
            <INPUT type="text" name="E01ROCYPH" size="5" maxlength="4" value="<%= gaMant.getE01ROCYPH().trim()%>" readonly>
            </td>
            <td nowrap>            	 
              <div align="left">días</div>
            </td>
--%>

			<td nowrap> 
              <div align="right"> </div>
            </td>
            <td nowrap colspan="3">            	 
            </td>
          </tr>

        </table>          
      </td> 
    </tr> 
    </table>
<% } %> 

<%-- E. OTROS TIPOS DE GARANTIA --%>

<% if (gaMant.getE01ROCTYP().equals("E")) { %>

  <h4>Detalle de Garantía</h4>

    <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing=0 cellpadding=2 width="100%" border="0">          
   		  <tr id="trdark"> 
            <td nowrap> 
              <div align="right">Valor Inicial :</div>
            </td>
            <td nowrap colspan="3">            	 
            	<eibsinput:text name="gaMant" property="E01ROCAM1" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/>
            </td>
			<td nowrap> 
              <div align="right">Valor en Libro :</div>
            </td>
            <td nowrap colspan="3">            	 
            	<eibsinput:text name="gaMant" property="E01ROCFAA" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/>
            </td>
          </tr>
   		  <tr id="trclear"> 
            <td nowrap> 
              <div align="right">Fecha Renovación Carta de Crédito o Avales/Fianzas :</div>
            </td>
            <td nowrap colspan="3">            	 
			  <eibsinput:date name="gaMant" fn_month="E01ROCAPM" fn_day="E01ROCAPD" fn_year="E01ROCAPY" readonly="TRUE" required="false"/>
            </td>
			<td nowrap> 
              <div align="right">Fecha de Emisión :</div>
            </td>
            <td nowrap colspan="3">           
			  <eibsinput:date name="gaMant" fn_month="E01ROCIDM" fn_day="E01ROCIDD" fn_year="E01ROCIDY" readonly="TRUE" required="false"/>
            </td>
          </tr>
   		  <tr id="trdark"> 
			<td nowrap> 
              <div align="right">Fiduciaria :</div>
            </td>
            <td nowrap colspan="3">            	 
              <input type="text" name="E01ROCU10" size="5" maxlength="4" value="<%= gaMant.getE01ROCUC7().trim()%>" readonly>
            </td>
			<td nowrap> 
              <div align="right">Identificación Fideicomiso :</div>
            </td>
            <td nowrap colspan="3">            	 
             <INPUT type="text" name="E01ROCRF4" size=32 maxlength=30 value="<%= gaMant.getE01ROCRF4()%>" readonly>
            </td>
          </tr>
   		  <tr id="trclear"> 
			<td nowrap> 
              <div align="right">Número C/C o Cesiones Sobre Pagarés/Cartera :</div>
            </td>
            <td nowrap colspan="3">            	 
              <input type="text" name="E01ROCLOC" size="37" maxlength="35" value="<%= gaMant.getE01ROCLOC().trim()%>" readonly>
            </td>
			<td nowrap> 
              <div align="right">Código de la Carta de Crédito o del Cedente :</div>
            </td>
            <td nowrap colspan="3">            	 
              <INPUT type="text" name="E01ROCUC2" size="5" maxlength="4" value="<%= gaMant.getE01ROCUC2().trim()%>" readonly>
            </td>
          </tr>
   		  <tr id="trdark"> 

			<td nowrap> 
              <div align="right"> </div>
            </td>
            <td nowrap colspan="2">            	 
              <div align="right"> </div>
            </td>
            <td nowrap>            	 
              <div align="right"> </div>
            </td>


<%--
			<td nowrap> 
              <div align="right">Vencimiento en :</div>
            </td>
            <td nowrap colspan="2">            	 
            <INPUT type="text" name="E01ROCYPH" size="5" maxlength="4" value="<%= gaMant.getE01ROCYPH().trim()%>" readonly>
            </td>
            <td nowrap>            	 
              <div align="left">días</div>
            </td>
--%>

			<td nowrap> 
              <div align="right"> </div>
            </td>
            <td nowrap colspan="3">            	 
            </td>
          </tr>

        </table>          
      </td> 
    </tr> 
    </table>
<% } %> 

<%-- F. AVALES --%>

<% if (gaMant.getE01ROCTYP().equals("F")) { %>

  <h4>Detalle de Garantía</h4>

    <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing=0 cellpadding=2 width="100%" border="0">          
   		  <tr id="trdark"> 
			<td nowrap> 
              <div align="right">Fecha de Emisión :</div>
            </td>
            <td nowrap colspan="3">            	 
			  <eibsinput:date name="gaMant" fn_month="E01ROCIDM" fn_day="E01ROCIDD" fn_year="E01ROCIDY" readonly="TRUE" required="false"/>
            </td>
            <td nowrap> 
              <div align="right">Monto del Aval :</div>
            </td>
            <td nowrap colspan="3">            	 
            <INPUT type="text" name="E01ROCAM1" size="17" maxlength="17" value="<%= gaMant.getE01ROCAM1().trim()%>" readonly>
            </td>
          </tr>
   		  <tr id="trclear"> 
			<td nowrap> 
              <div align="right">Saldo :</div>
            </td>
            <td nowrap colspan="3">            	 
            <INPUT type="text" name="E01ROCAM2" size="17" maxlength="17" value="<%= gaMant.getE01ROCAM2().trim()%>" readonly>
            </td>
			<td nowrap> 
              <div align="right">Tabla de Provisión  :</div>
            </td>
            <td nowrap colspan="3">            	 
             <INPUT type="text" name="E01ROCNC1" size=4 maxlength=2 value="<%= gaMant.getE01ROCNC1()%>" readonly>
            </td>
          </tr>
   		  <tr id="trdark"> 
            <td nowrap> 
              <div align="right">Monto de la Garantía :</div>
            </td>
            <td nowrap colspan="3">            	 
            <INPUT type="text" name="E01ROCFAA" size="17" maxlength="17" value="<%= gaMant.getE01ROCFAA().trim()%>" readonly>
            </td>
			<td nowrap> 
              <div align="right">Provisión Establecida :</div>
            </td>
            <td nowrap colspan="3">            	 
            <INPUT type="text" name="E01ROCINA" size="17" maxlength="17" value="<%= gaMant.getE01ROCINA().trim()%>" readonly>
            </td>
          </tr>
   		  <tr id="trclear"> 

			<td nowrap> 
              <div align="right"> </div>
            </td>
            <td nowrap colspan="2">            	 
              <div align="right"> </div>
            </td>
            <td nowrap>            	 
              <div align="right"> </div>
            </td>


<%--
			<td nowrap> 
              <div align="right">Vencimiento en :</div>
            </td>
            <td nowrap colspan="2">            	 
            <INPUT type="text" name="E01ROCYPH" size="5" maxlength="4" value="<%= gaMant.getE01ROCYPH().trim()%>" readonly>
            </td>
            <td nowrap>            	 
              <div align="left">días</div>
            </td>
--%>

			<td nowrap> 
              <div align="right">Clasificación de Riesgo :</div>
            </td>
            <td nowrap colspan="3">            	 
             <INPUT type="text" name="E01ROCFL1" size=4 maxlength=2 value="<%= gaMant.getE01ROCFL1()%>" readonly>
            </td>
          </tr>

        </table>          
      </td> 
    </tr> 
    </table>
<% } %>


<% if (gaMant.getE01ROCTYP().equals("H")) { %>

  <h4>Detalle de Garantía</h4>

    <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing=0 cellpadding=2 width="100%" border="0">          

   		  <tr id="trdark"> 
   		    <td nowrap> 
              <div align="right">Valor Actual :</div>
            </td>
            <td nowrap >            	 
              <INPUT type="text" name="E01ROCFAA" size="17" readonly maxlength="17" value="<%= gaMant.getE01ROCFAA().trim()%>" onkeypress="enterDecimal(event, 2)">
              
            </td>
            <td nowrap> 
            </td>
            <td nowrap >            	 
            </td>
          </tr>
          
      </table>          
      </td> 
    </tr> 
    </table>
<% } %>

<% if (gaMant.getE01ROCTYP().equals("I")) { %>

  <h4>Detalle de Garantía</h4>

    <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing=0 cellpadding=2 width="100%" border="0">          

   		  <tr id="trdark"> 
   		    <td nowrap> 
              <div align="right">Valor Actual :</div>
            </td>
            <td nowrap >            	 
              <INPUT type="text" name="E01ROCFAA" size="17" readonly maxlength="17" value="<%= gaMant.getE01ROCFAA().trim()%>" onkeypress="enterDecimal(event, 2)">
            </td>
            <td nowrap> 
            </td>
            <td nowrap >            	 
            </td>
          </tr>
          
      </table>          
      </td> 
    </tr> 
    </table>
<% } %>

<div id="Depreciar">

<h4>Información Sobre Depreciación</h4>
    <table class="tableinfo">
      <tr > 
        <td >
          <table cellspacing="0" cellpadding="2" width="100%" border="0" >

   		  <tr id="trdark"> 
			<td nowrap> 
              <div align="right">Valor Original :</div>
            </td>
            <td nowrap colspan="3">            	 
               <eibsinput:text name="gaMant" property="E01ROCAM1" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/>    
            </td>
            <td nowrap> 
              <div align="right">Valor a Depreciar :</div>
            </td>
            <td nowrap colspan="3">            	 
	           <eibsinput:text name="gaMant" property="E01ROCCOP" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/>	           
            </td>
          </tr>

   		  <tr id="trclear"> 
			<td nowrap> 
              <div align="right">Fecha de Adquisición :</div>
            </td>
            <td nowrap colspan="3">            	 
			  <eibsinput:date name="gaMant" fn_month="E01ROCIDM" fn_day="E01ROCIDD" fn_year="E01ROCIDY" readonly="TRUE" required="false"/>
            </td>
            <td nowrap> 
              <div align="right">Fecha Ultima Depreciación :</div>
            </td>
            <td nowrap colspan="3">
			  <eibsinput:date name="gaMant" fn_month="E01ROCNXM" fn_day="E01ROCNXD" fn_year="E01ROCNXY" readonly="TRUE" required="false"/>
            </td>
          </tr>


   		  <tr id="trdark"> 
			<td nowrap> 
              <div align="right">Tiempo Transcurrido :</div>
            </td>
            <td nowrap colspan="3">            	 
               <input type="text" name="E01ROCTCU" readonly size="8" maxlength="7" value="<%= gaMant.getE01ROCTCU().trim()%>">
            </td>
            <td nowrap> 
              <div align="right">Meses a Depreciar :</div>
            </td>
            <td nowrap colspan="3">            	 
	           <INPUT type="text" name="E01ROCCYC" readonly size="4" maxlength="3" value="<%= gaMant.getE01ROCCYC().trim()%>">
            </td>
          </tr>


   		  <tr id="trclear"> 
			<td nowrap> 
              <div align="right">Tabla/Porcentaje de Depreciación :</div>
            </td>
            <td nowrap colspan="3">            	 
                <INPUT type="text" name="E01ROCUC9" readonly size="5" maxlength="4" value="<%= gaMant.getE01ROCUC9().trim()%>">
           		<input type="text" name="E01ROCRAT" readonly size="6" maxlength="5" value="<%= gaMant.getE01ROCRAT().trim()%>">
            <td nowrap> 
              <div align="right">Depreciación Acumulada :</div>
            </td>
            <td nowrap colspan="3">            	 
	           <INPUT type="text" name="E01ROCINA" size="17" readonly maxlength="17" value="<%= gaMant.getE01ROCINA().trim()%>">
            </td>
          </tr>


   		  <tr id="trdark"> 
			<td nowrap> 
              <div align="right">Valor  Garantía :</div>
            </td>
            <td nowrap colspan="3">            	 
           		<input type="text" name="E01ROCFAA" readonly size="17" maxlength="15" value="<%= gaMant.getE01ROCFAA().trim()%>">
			<% if (gaMant.getE01ROCTYP().equals("B")) { %>

            <td nowrap> 
              <div align="right">Valor Mejoras :</div>
            </td>
            <td nowrap colspan="3">            	 
	           <INPUT type="text" name="E01ROCAM2" readonly size="17" maxlength="17" value="<%= gaMant.getE01ROCAM2().trim()%>">
            </td>

			<% } else {%>

            <td nowrap> 
              <div align="right"> </div>
            </td>
            <td nowrap colspan="3">            	 
              <div align="right"> </div>
            </td>

			<% } %>
          </tr>



          </table>
        </td>
      </tr>
    </table>
</div>



  
  
  <SCRIPT type="text/javascript">


	<% if (!gaMant.getE01ROCUC9().equals(" ")){ %>
 	 hideDepreciar(true);
	<%} else { %>
 	 hideDepreciar(false);
	<%}%>




   function waitSimulate() {
     document.body.style.cursor = "wait";
   }
   document.forms[0].onsubmit= waitSimulate;

  function tableresize() {
     adjustEquTables( getElement("headTable"), getElement("dataTable"), getElement("dataDiv"),0,false);
     <% if (gaMant.getE01ROCTYP().equals("05")) { %>
     	adjustEquTables( getElement("headTable1"), getElement("dataTable1"), getElement("dataDiv1"),0,false);
     <%    } %>
   }
  tableresize();
  window.onresize=tableresize;

  </SCRIPT> 
  </FORM>
 </BODY>
 </html>