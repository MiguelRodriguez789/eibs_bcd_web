<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput"%>
<%@page import="com.datapro.constants.EibsFields"%>
<%@page import="com.datapro.eibs.constants.HelpTypes"%>
<%@page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="com.datapro.constants.Entities"%> 
<%@ page import="datapro.eibs.master.Util"%>


<%@page import="datapro.eibs.beans.ESD081701Message"%><html>
<head>
<title>Remanentes</title>
<META http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<jsp:useBean id="ESD0817List" class="datapro.eibs.beans.JBObjList" scope="session" />
<jsp:useBean id= "remanentes" class= "datapro.eibs.beans.ERM006001Message"  scope="session" /> 
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="currUser" class="datapro.eibs.beans.ESS0030DSMessage"  scope="session" />

<SCRIPT SRC="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<SCRIPT SRC="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>

<script type="text/javascript">

</script>

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

<h3 align="center">Consulta de Remanentes <img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="remanenetes_basic_inquiry.jsp,ERM0060"></h3>
<hr size="4">

<form  method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSERM0060">
<input type="hidden" name="SCREEN" value="400">

<input type="hidden" name="E01RMMACD" value="<%= remanentes.getField("E01RMMACD").getString().trim()%>">

 <% int row = 0;%>

 <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="16%" > 
              <div align="right"><b>Cliente :</b></div>
            </td>
            <td nowrap width="20%" > 
              <div align="left">
				<eibsinput:text name="remanentes" property="E01RMMCUN"  eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CUSTOMER %>" readonly="true" />
              </div>
            </td>
            <td nowrap width="16%" > 
              <div align="right"><b>Nombre :</b> </div>
            </td>
            <td nowrap colspan="3" > 
              <div align="left">
	  			<eibsinput:text name="remanentes" property="E01CUSNA1" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_NAME_FULL %>" readonly="true"/>
              </div>
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="16%"> 
              <div align="right"><b>Cuenta :</b></div>
            </td>
            <td nowrap width="20%"> 
              <div align="left">
      			<eibsinput:text name="remanentes" property="E01RMMACC" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_ACCOUNT %>" readonly="true"/>
              </div>
            </td>
            <td nowrap width="16%"> 
              <div align="right"><b>Moneda : </b></div>
            </td>
            <td nowrap width="16%"> 
              <div align="left"><b> 
	  			<eibsinput:text name="remanentes" property="E01RMMCCY" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CURRENCY %>" readonly="true"/>
                </b> </div>
            </td>
            <td nowrap width="16%"> 
              <div align="right"><b>Producto : </b></div>
            </td>
            <td nowrap width="16%"> 
              <div align="left"><b>
	  			<eibsinput:text name="remanentes" property="E01RMMTYP" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CNOFC %>" readonly="true"/>
	  			<eibsinput:text name="remanentes" property="E01RMMPRD" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CNOFC %>" readonly="true"/>
                </b> </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  
 <h4>Información Básica</h4>
 <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing=0 cellpadding=2 width="100%" border="0">
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="20%" > 
              <div align="right">Saldo Remanente :</div>
            </td>
            <td nowrap width="30%" > 
 		        <eibsinput:text name="remanentes" property="E01RMMAMT" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/>
            </td>
            <td nowrap width="20%" > 
              <div align="right">Ultima Transaccion :</div>
            </td>
            <td nowrap width="30%" > 
    	        <eibsinput:date name="remanentes" fn_year="E01RMMLTY" fn_month="E01RMMLTM" fn_day="E01RMMLTD" readonly="true"/>
            </td>
          </tr>

          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="20%" > 
              <div align="right">Total Debitos :</div>
            </td>
            <td nowrap width="30%" > 
 		        <eibsinput:text name="remanentes" property="E01RMMTDR" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/>
            </td>
            <td nowrap width="20%" > 
              <div align="right">Numero de Debitos :</div>
            </td>
            <td nowrap width="30%" > 
 		        <eibsinput:text name="remanentes" property="E01RMMNDR" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_INTEGER %>" size="6" readonly="true"/>
            </td>
          </tr>

          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="20%" > 
              <div align="right">Total Credito :</div>
            </td>
            <td nowrap width="30%" > 
 		        <eibsinput:text name="remanentes" property="E01RMMTCR" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/>
            </td>
            <td nowrap width="20%" > 
              <div align="right">Numero de Creditos :</div>
            </td>
            <td nowrap width="30%" > 
 		        <eibsinput:text name="remanentes" property="E01RMMNCR" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_INTEGER %>" size="6" readonly="true"/>
            </td>
          </tr>


          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="20%" > 
              <div align="right">Monto Inicial :</div>
            </td>
            <td nowrap width="30%" > 
 		        <eibsinput:text name="remanentes" property="E01RMMOAM" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/>
            </td>
            <td nowrap width="20%" > 
              <div align="right">Fecha Inicio :</div>
            </td>
            <td nowrap width="30%" > 
    	        <eibsinput:date name="remanentes" fn_year="E01RMMOPY" fn_month="E01RMMOPM" fn_day="E01RMMOPD" readonly="true"/>
            </td>
          </tr>

          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="20%" > 
              <div align="right">Cuenta Contable :</div>
            </td>
            <td nowrap width="30%" > 
 		        <eibsinput:text name="remanentes" property="E01RMMGLN" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_GLEDGER %>" readonly="true"/>
            </td>
            <td nowrap width="20%" > 
              <div align="right">Centro de Costos :</div>
            </td>
            <td nowrap width="30%" > 
 		        <eibsinput:text name="remanentes" property="E01RMMCCN" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_COST_CENTER %>"  readonly="true"/>
            </td>
          </tr>

          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="20%" > 
              <div align="right">Banco/Sucursal :</div>
            </td>
            <td nowrap width="30%" > 
		        <eibsinput:text name="remanentes" property="E01RMMBNK" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_BANK %>" readonly="true" />
	            <eibsinput:text name="remanentes" property="E01RMMBRN" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_BRANCH%>" readonly="true" />
            </td>
            <td nowrap width="20%" > 
              <div align="right">Fecha Ultimo Pago :</div>
            </td>
            <td nowrap width="30%" > 
    	        <eibsinput:date name="remanentes" fn_year="E01RMMPAY" fn_month="E01RMMPAM" fn_day="E01RMMPAD" readonly="true"/>
            </td>
          </tr>

          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="20%" > 
              <div align="right">Ejecutivo :</div>
            </td>
            <td nowrap width="30%" > 
                 <eibsinput:text name="remanentes" property="E01RMMOFC" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CNOFC%>" readonly="true"/>
                 <eibsinput:text name="remanentes" property="E01DSCOFC" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_NAME%>"  readonly="true"/>
            </td>
            <td nowrap width="20%" > 
              <div align="right">Referencia :</div>
            </td>
            <td nowrap width="30%" > 
 		        <eibsinput:text name="remanentes" property="E01RMMREF" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_ACCOUNT %>"  readonly="true"/>
            </td>
          </tr>

        </table>
      </td>
    </tr>
  </table>

  
 <h4>Información Adicional</h4>
 <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing=0 cellpadding=2 width="100%" border="0">
         <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="20%" > 
              <div align="right">Periodo :</div>
            </td>
            <td nowrap width="30%" > 
              <input type="text" name="E01RMMUTP" size="4" maxlength="4" value="<%= remanentes.getE01RMMUTP().trim() %>" readonly> 		        
            </td>
            <td nowrap width="20%" > 
              <div align="right">Origen :</div>
            </td>
            <td nowrap width="30%" > 
              <input type="text" name="E01DSCUC1" size="45" value="<%= remanentes.getE01DSCUC1().trim() %>" readonly>  
            </td>
         </tr>
         <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="20%" > 
              <div align="right">Cuenta de Pago :</div>
            </td>
            <td nowrap width="30%" > 
              <input type="text" name="E01RMMPAC" size="13" maxlength="12" value="<%= remanentes.getE01RMMPAC() %>" readonly>  	        
            </td>          
            <td nowrap width="20%" > 
              <div align="right">Forma de Pago :</div>
            </td>
            <td nowrap width="30%" > 
              <input type="text" readonly name="E01RMMMPA" size="25"  
				  value="<% if (remanentes.getE01RMMMPA().equals("E")) out.print("Efectivo");
							else if (remanentes.getE01RMMMPA().equals("C")) out.print("Cheque");
							else out.print("");%>" >
         	</td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
           <td nowrap width="20%" > 
              <div align="right">Tipo Cta. Otro Banco :</div>
            </td>
            <td nowrap width="30%" > 
               <input type="text" readonly name="E01RMMTYB" size="25"  
				  value="<% if (remanentes.getE01RMMTYB().equals("CCTE")) out.print("Cuenta Corriente");
							else if (remanentes.getE01RMMTYB().equals("CVIS")) out.print("Cuenta Vista");
							else if (remanentes.getE01RMMTYB().equals("AHOR")) out.print("Cuenta Ahorro");       					
							else out.print("");%>" >              
            </td>
            <td nowrap width="20%" > 
              <div align="right">Distribucion :</div>
            </td>
            <td nowrap width="30%" > 
               <input type="text" readonly name="E01RMMCDS" size="25"  
				  value="<% if (remanentes.getE01RMMCDS().equals("FA")) out.print("Fallecidos");
							else if (remanentes.getE01RMMCDS().equals("CP")) out.print("Capitalizacion");
							else if (remanentes.getE01RMMCDS().equals("MO")) out.print("Morosos");
							else if (remanentes.getE01RMMCDS().equals("PB")) out.print("PAC Banco");
         					else if (remanentes.getE01RMMCDS().equals("PM")) out.print("PAC Multibanco");
         					else if (remanentes.getE01RMMCDS().equals("OB")) out.print("Pago Otro Banco");         					
							else out.print("");%>" >           
            </td>            
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="20%" > 
              <div align="right">Codigo Otro Banco :</div>
            </td>
            <td nowrap width="30%" > 
		        <eibsinput:cnofc name="remanentes" property="E01RMMCDB" required="false" flag="X3" fn_code="E01RMMCDB" readonly="true"/>	        
            </td>
            <td nowrap width="20%" > 
              <div align="right">Cuenta Otro Banco :</div>
            </td>
            <td nowrap width="30%" > 
				<INPUT type="text" name="E01RMMCOB" size="22" maxlength="20" value="<%= remanentes.getE01RMMCOB() %>" readonly> 		        
 		    </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="20%" > 
              <div align="right">Cod. Banco Intermediario :</div>
            </td>
            <td nowrap width="30%" > 
		        <eibsinput:cnofc name="remanentes" property="E01RMMCDC" required="false" flag="X3" fn_code="E01RMMCDC" readonly="true"/>			        	        
            </td>
            <td nowrap width="20%" > 
              <div align="right">Cuenta Banco Intermediario :</div>
            </td>           
            <td nowrap width="30%" > 
              <input type="text" name="E01RMMCTC" size="13" maxlength="12" value="<%= remanentes.getE01RMMCTC().trim()%>" readonly>  	         		        
            </td>  
          </tr>   
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="20%" > 
              <div align="right">Num. Cuotas Participacion :</div>
            </td>
            <td nowrap width="30%" > 
		        <eibsinput:text name="remanentes" property="E01RMMNCU" size="10" maxlength="9" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_INTEGER %>" readonly="true"/>
            </td>
            <td nowrap width="20%" > 
              <div align="right">Valor Cuota :</div>
            </td>
            <td nowrap width="30%" > 
 		        <eibsinput:text name="remanentes" property="E01RMMVCU" size="16" maxlength="10" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT_FEE %>"  readonly="true"/>
            </td>          
          </tr>  
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="20%" > 
              <div align="right">Cuenta Contrapartida :</div>
            </td>
            <td nowrap width="30%" > 
              <input type="text"  name="E01RMMOGL" size="18" maxlength="16" value="<%= remanentes.getE01RMMOGL().trim()%>" readonly >					        
            </td>                      
            <td nowrap width="20%" > 
              <div align="right">Cuenta Rechazo :</div>
            </td>         
            <td nowrap width="30%" >  
              <input type="text"  name="E01RMMRGL" size="18" maxlength="16" value="<%= remanentes.getE01RMMRGL().trim()%>" readonly>          
            </td>  
          </tr>   
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="20%" > 
              <div align="right">Flag Exento Mora:</div>
            </td>
             <td nowrap width="30%" > 
               <input type="text" readonly name="E01RMMFL1" size="5"  
				  value="<% if (remanentes.getE01RMMFL1().equals("Y")) out.print("SI");
							else if (remanentes.getE01RMMTYB().equals("N")) out.print("NO");     					
							else out.print("");%>" >                 
                  </td>
            <td nowrap width="20%" > 
              <div align="right">Indicador Rechazo :</div>
            </td>
            <td nowrap width="30%" >
               <input type="text" readonly name="E01RMMIND" size="5"  
				  value="<% if (remanentes.getE01RMMIND().equals("Y")) out.print("SI");
							else if (remanentes.getE01RMMIND().equals("N")) out.print("NO");     					
							else out.print("");%>" >               		        
            </td>          
          </tr>                                             
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="20%" > 
              <div align="right">Estado del Pago :</div>
            </td>
            <td nowrap width="30%" > 
              <input type="text" readonly name="E01DSCSPA" size="25"  
				  value="<% if (remanentes.getE01RMMSPA().equals("")) out.print("Pendiente");
							else if (remanentes.getE01RMMSPA().equals("P")) out.print("Pago Parcial");
							else if (remanentes.getE01RMMSPA().equals("T")) out.print("Pago Total");
							else out.print("");%>" >
            </td>
            <td nowrap width="20%" > 
              <div align="right">Ultimo Cambio Estado :</div>
            </td>
            <td nowrap width="30%" > 
    	        <eibsinput:date name="remanentes" fn_year="E01RMMCEY" fn_month="E01RMMCEM" fn_day="E01RMMCED" readonly="true"/>
            </td>
          </tr>

        </table>
      </td>
    </tr>
  </table>

  
<h4>Transacciones</h4>

<% 
 int k = 0;
	if (ESD0817List.getNoResult()) {
%>
<TABLE class="tbenter" width=100% >
	<TR>
		<TD>
		<div align="center"><font size="3"><b> No hay Transacciones Registradas. </b></font></div>
		</TD>
	</TR>
</TABLE>
<%
	} else {
%>
 <table id="mainTable" class="tableinfo" align="center"  width=100%>
	<tr>
		<td nowrap valign="top">

		<TABLE id="headTable" width=100%>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
				<th align="center" nowrap width="10%">Fecha<br>Proceso</th>
				<th align="center" nowrap width="10%">Fecha<br>Valor</th>
				<th align="center" nowrap width="5%">CD<br>TR</th>
				<th align="center" nowrap width="30%">Descripcion</th>
				<th align="center" nowrap width="10%">Monto</th>
				<th align="center" nowrap width="5%"></th>
				<th align="center" nowrap width="5%">Lote</th>
				<th align="center" nowrap width="10%">Hora</th>
				<th align="center" nowrap width="5%">Usuario</th>
				<th align="center" nowrap width="5%">Banco<br>Origen</th>
				<th align="center" nowrap width="5%">Sucursal<br>Origen</th>

    		</TR>
			<%
				ESD0817List.initRow();
					k = 0;
					boolean firstTime = true;
					while (ESD0817List.getNextRow()) {
						if (firstTime) {
							firstTime = false;
						} else {
						ESD081701Message convObj = (ESD081701Message) ESD0817List.getRecord();
			%>
	          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
				<td nowrap align="center" width="10%">
					<a href="javascript:GetBatchDet('<%=convObj.getE01TRAVDM()%>', '<%=convObj.getE01TRAVDD()%>', '<%=convObj.getE01TRAVDY()%>', '<%=convObj.getE01TRABTH()%>', '<%=convObj.getE01TRAACR()%>')">
						<%=Util.formatCustomDate(currUser.getE01DTF(), convObj.getE01TRABDM(), convObj.getE01TRABDD(), convObj.getE01TRABDY())%>
					</a>
				</td>
				<td nowrap align="center" width="10%">
					<a href="javascript:GetBatchDet('<%=convObj.getE01TRAVDM()%>', '<%=convObj.getE01TRAVDD()%>', '<%=convObj.getE01TRAVDY()%>', '<%=convObj.getE01TRABTH()%>', '<%=convObj.getE01TRAACR()%>')">
						<%=Util.formatCustomDate(currUser.getE01DTF(), convObj.getE01TRAVDM(), convObj.getE01TRAVDD(), convObj.getE01TRAVDY())%>
					</a>
				</td>
				<td nowrap align="center" width="5%"><%= convObj.getE01TRACDE()%></td>
				<td nowrap align="left" width="30%"><%= convObj.getE01TRANAR()%></td>
				<td nowrap align="right" width="9%"><%= convObj.getE01TRAAMT()%></td>
				<% if (convObj.getE01TRADCC().equals("0")){%>
				<td nowrap align="left" width="1%">DB</td>
				<% } else {%>
				<td nowrap align="left" width="1%">CR</td>
				<% } %>
				<td nowrap align="center" width="5%">
					<a href="javascript:GetBatchDet('<%=convObj.getE01TRAVDM()%>', '<%=convObj.getE01TRAVDD()%>', '<%=convObj.getE01TRAVDY()%>', '<%=convObj.getE01TRABTH()%>', '<%=convObj.getE01TRAACR()%>')">
						<%= convObj.getE01TRABTH()%>
					</a>
				</td>
				<td nowrap align="left" width="10%"><%= convObj.getE01TRATIM()%></td>
				<td nowrap align="left" width="5%"><%= convObj.getE01TRAUSO()%></td>
				<td nowrap align="center" width="5%"><%= convObj.getE01TRAOBK()%></td>
				<td nowrap align="center" width="5%"><%= convObj.getE01TRAOBR()%></td>
    		</TR>
			<% 
						}
					k++;
					}
			%>
			 </table>
		</td>
	</tr>
</table>

<% } %>

	
</form>
</body>
</html>
