<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>

<%@ page import = "datapro.eibs.master.Util" %>
<%@page import="com.datapro.constants.EibsFields"%>
<html>
<head>
<title>Consulta de Garantías</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<jsp:useBean id= "collBasic" class= "datapro.eibs.beans.ERA010001Message"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>
<SCRIPT type="text/javascript">
   builtNewMenu(colla_i_opt); 
 function  hidePoliza(value){
 if (value) {
   Poliza.style.display="";}
 else{
   Poliza.style.display="none"; }
}
function  hideDepreciar(value){
 if (value) {
   Depreciar.style.display="";}
 else{
   Depreciar.style.display="none"; }
}
</SCRIPT>
</head>
<body>
 <%@ page import = "datapro.eibs.master.Util" %>
<% 
 if ( !error.getERRNUM().equals("0")  ) {
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
 }
%>
<SCRIPT> initMenu(); </SCRIPT>
<h3 align="center">Consulta de Garantías<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="collateral_none_acc_basic.jsp, ERA0100" width="32" height="32"></h3>
<hr size="4">
 <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSERA0100" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="2">
  <INPUT TYPE=HIDDEN NAME="BNKNUM" VALUE="<%= collBasic.getE01ROCBNK().trim()%>">
  <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">

          <tr id="trdark"> 
            <td nowrap width="16%" > 
              <div align="right"><b>Cliente : </b></div>
            </td>
            <td nowrap width="20%" > 
              <div align="left"> 
                <input type="text" name="CUSCUN" size="11" maxlength="9" value="<%= userPO.getCusNum().trim()%>" readonly>
              </div>
            </td>
            <td nowrap width="16%" > 
              <div align="right"><b>Nombre :</b> </div>
            </td>
            <td nowrap colspan="3" > 
              <div align="left">
                <input type="text" name="CUSNA1" size="47" readonly maxlength="45" value="<%= userPO.getCusName().trim() %>" >
              </div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap> 
              <div align="right"><b>Referencia : </b></div>
            </td>
            <td nowrap> 
              <div align="left"> 
                <input type="text" name="ACCNUM" size="15" readonly maxlength="13" value="<%= userPO.getIdentifier().trim()%>" >
              </div>
            </td>
            <td nowrap> 
              <div align="right"><b>Moneda : </b></div>
            </td>
            <td nowrap> 
              <div align="left"> 
                <input type="text" name="PROCCY" size="5" readonly maxlength="4" value="<%= userPO.getCurrency().trim()%>">
              </div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap> 
              <div align="right"><b>Producto :</b> </div>
            </td>
            <td nowrap> 
              <div align="left">
                <input type="text" name="PRODUCT" size="38" value="<%= collBasic.getE01ROCPRD().trim()%> - <%= collBasic.getE01ROCDPR().trim()%>" readonly>                 
                <input type="hidden" name="E01ROCPRD" size="6" maxlength="4" value="<%= collBasic.getE01ROCPRD().trim()%>" readonly> 
                <input type="hidden" name="E01ROCDPR" size="32" maxlength="30" value="<%= collBasic.getE01ROCDPR().trim()%>" readonly> 
              </div>
            </td>
            <td nowrap> 
              <div align="right"><b>Bien :</b> </div>
            </td>
            <td nowrap> 
              <div align="left">
                <input type="text" name="BIEN" size="38" value="<%= collBasic.getE01ROCCGT().trim()%> - <%= collBasic.getE01ROCDGT().trim()%>" readonly>                 
                <input type="hidden" name="E01ROCCGT" size="6" maxlength="4" value="<%= collBasic.getE01ROCCGT().trim()%>" readonly> 
                <input type="hidden" name="E01ROCDGT" size="32" maxlength="30" value="<%= collBasic.getE01ROCDGT().trim()%>" readonly> 
                <% 
                	String bien = collBasic.getE01ROCCGT().trim() + " - " + collBasic.getE01ROCDGT().trim();
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
            		<td nowrap width="100" >
						<div align="center">Código</div>
					</td>
            		<td nowrap width="150" >
						<div align="center">Identificación</div>
					</td>
            		<td nowrap width="250">
						<div align="center">Nombre</div>
					</td>            		            
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
							name="E01ROWN<%= name %>" readonly size="11" maxlength="9"
							value="<%= collBasic.getField("E01ROWN"+name).getString().trim()%>">
						</div>
					</td>
            		<td nowrap >
						<div align="center"><input type="text"
							name="E01RUTO<%= name %>" readonly size="31" maxlength="30"
							value="<%= collBasic.getField("E01RUTO"+name).getString().trim()%>">
						</div>
					</td>
            		<td nowrap width="250">
						<div align="center"><input type="text" readonly name="E01RNAM<%= name %>"
							size="37" maxlength="35"
							value="<%= collBasic.getField("E01RNAM"+name).getString().trim()%>">
						</div>
					</td>            		            
          		</tr>
          		<%	}	%> 
       			</table>
     		 </div>
            </td>            
          </tr>
          <tr id="trclear">  
            <td nowrap> 
              <div align="right">Fecha Apertura : </div>
            </td>
            <td nowrap >
             <%= datapro.eibs.master.Util.formatCustomDate(currUser.getE01DTF(),collBasic.getBigDecimalE01ROCOPM().intValue(),collBasic.getBigDecimalE01ROCOPD().intValue(),collBasic.getBigDecimalE01ROCOPY().intValue())%>
            </td>
            <td nowrap >
              <div align="right">Fecha Vencimiento : </div>
            </td>
            <td nowrap >
                <%= datapro.eibs.master.Util.formatCustomDate(currUser.getE01DTF(),collBasic.getBigDecimalE01ROCMTM().intValue(),collBasic.getBigDecimalE01ROCMTD().intValue(),collBasic.getBigDecimalE01ROCMTY().intValue())%>
            </td>
          </tr>
   		  <tr id="trdark"> 
			<td nowrap> 
              <div align="right">Estado del Bien : </div>
            </td>
            <td nowrap>            	 
              <INPUT type="text" name="E01ROCEST" size="2" maxlength="1" value="<%= collBasic.getE01ROCEST().trim()%>" readonly>
            </td>
            <td nowrap> 
              <div align="right">Origen de la Garantía : </div>
            </td>
            <td nowrap>            	 
              <INPUT type="text" name="E01ROCUC1" size="2" maxlength="1" value="<%= collBasic.getE01ROCUC1().trim()%>"  readonly>
			</td>
          </tr>
                   
   		  <tr id="trclear"> 
            <td nowrap> 
              <div align="right">Banco/Sucursal :</div>
            </td>
            <td nowrap>            	 
	       	  <div align="left"> 
              	<input type="text" name="E01ROCBNK" readonly size="4" maxlength="2" value="<%= collBasic.getE01ROCBNK().trim()%>">
              	<input type="text" name="E01ROCBRN" readonly size="5" maxlength="3" value="<%= collBasic.getE01ROCBRN().trim()%>">
              </div>
            </td>
            <td nowrap> 
              <div align="right">Cuenta Contable :</div>
            </td>
            <td nowrap>            	 
              <div align="left">
              	<input type="text" name="E01ROCGLN" readonly size="20" maxlength="16" value="<%= collBasic.getE01ROCGLN().trim()%>">
              </div>
            </td>
          </tr>			
   		  <tr id="trdark"> 
			<td nowrap> 
              <div align="right">Tabla de Depreciación : </div>
            </td>
            <td nowrap>            	 
              <INPUT type="text" name="E01ROCUC9" size="5" maxlength="4" value="<%= collBasic.getE01ROCUC9().trim()%>"  readonly>
            </td>
            <td nowrap> 
              <div align="right">Contenido de la Garantía : </div>
            </td>
            <td nowrap>            	 
              <INPUT type="text" name="E01ROCAYR" size="5" maxlength="4" value="<%= collBasic.getE01ROCAYR().trim()%>"  readonly>
			</td>
          </tr>
                   
   		  <tr id="trclear"> 
   		   <%  if (currUser.getE01INT().trim().equals("11")) {%> 
   		    <td nowrap> 
              <div align="right"><b>Porcentaje Disponible :</b></div>
            </td>
            <td nowrap>            	 
	       	  <div align="left"> 
              	<input type="text" name="E01ROCPRS" readonly size="10" maxlength="9" value="<%= collBasic.getE01ROCPRS().trim()%>">
              </div>
            </td>
            <% } else    {%> 
            <td nowrap> 
              <div align="right"><b>Máxima Responsabilidad Crediticia :</b></div>
            </td>
            <td nowrap>            	 
	       	  <div align="left"> 
              	<input type="text" name="E01ROCPRS" readonly size="11" maxlength="7" value="<%= collBasic.getE01ROCPRS().trim()%>">
              </div>
            </td>
             <% }%>  
            <td nowrap> 
              <div align="right"><b>Total Cuentas Garantizadas :</b></div>
            </td>
            <td nowrap>            	 
              <div align="left">
              	<input type="text" name="E01ROCIAL" readonly size="17" maxlength="15" value="<%= collBasic.getE01ROCIAL().trim()%>">
              </div>
            </td>
          </tr>			
                   
   		  <tr id="trdark"> 
            <td nowrap> 
              <div align="right">Descripción :</div>
            </td>
            <td nowrap colspan="3">            	 
              <input type="text" name="E01ROCSP1" size="58" maxlength="56" value="<%= collBasic.getE01ROCSP1().trim()%>" readonly>
            </td>
          </tr>			
          <tr id="trclear">  
			<td nowrap> 
              <div align="right"> </div>
            </td>
            <td nowrap colspan="3">            	 
              <input type="text" name="E01ROCSP2" size="58" maxlength="56" value="<%= collBasic.getE01ROCSP2().trim()%>" readonly>
            </td>
          </tr>
   		  <tr id="trdark"> 
            <td nowrap> 
              <div align="right"> </div>
            </td>
            <td nowrap colspan="3">            	 
              <input type="text" name="E01ROCSP3" size="58" maxlength="56" value="<%= collBasic.getE01ROCSP3().trim()%>" readonly>
            </td>
          </tr>			
          <tr id="trclear">  
			<td nowrap> 
              <div align="right"> </div>
            </td>
            <td nowrap colspan="3">            	 
              <input type="text" name="E01ROCSP4" size="58" maxlength="56" value="<%= collBasic.getE01ROCSP4().trim()%>" readonly>
            </td>
          </tr>
   		  <tr id="trdark"> 
            <td nowrap> 
              <div align="right"> </div>
            </td>
            <td nowrap colspan="3">            	 
              <input type="text" name="E01ROCSP5" size="58" maxlength="56" value="<%= collBasic.getE01ROCSP5().trim()%>" readonly>
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
   
        <%if( collBasic.getH01SCRCOD().equals("07")){%> 
			<tr id="trdark">
            <td nowrap> 
              <div align="right">Calle : </div>
            </td>
            <td nowrap> 
              <input type="text" readonly name="E01NA2"  size="37" maxlength="35" value="<%=collBasic.getE01NA2().trim()%>">
           	</td>
				<TD nowrap align="right">Provincia : </TD>
				<TD nowrap><INPUT type="text" readonly name="D01STE" size="37" maxlength="35"
					value="<%= collBasic.getD01STE().trim()%>" readonly> 
				</TD>
			</tr>
          <tr id="trclear">  
            <td nowrap> 
              <div align="right">Residencial/edificio : </div>
            </td>
				<td nowrap><input readonly type="text" name="E01NA3" size="37"
					maxlength="35" value="<%= collBasic.getE01NA3().trim()%>"></td>
				<TD nowrap align="right">Distrito : </TD>
				<TD nowrap><INPUT type="text" readonly name="D01TID" size="37" maxlength="35"
					value="<%= collBasic.getD01TID().trim()%>" readonly> 
				</TD>
			</tr>
          <tr id="trdark"> 
            <td nowrap> 
              <div align="right">No. Casa/Apto :</div>
            </td>
				<td nowrap><input type="text" readonly name="E01NA4" size="37"
					maxlength="35" value="<%= collBasic.getE01NA4().trim()%>"></td>
				<TD nowrap align="right">Corregimiento : </TD>
				<TD nowrap><INPUT type="text" readonly name="D01PID" size="37" maxlength="35"
					value="<%= collBasic.getD01PID().trim()%>" readonly>
				</TD>
			</tr>
          <tr id="trclear">  
            <td nowrap> 
              <div align="right">Apartado Postal : </div>
            </td>
				<td nowrap><input type="hidden" readonly name="E01STE" size="6"
					maxlength="4" value="<%= collBasic.getE01STE().trim()%>"  readonly>
					<INPUT
					type="text" readonly name="E01POB" size="11" maxlength="10"
					value="<%= collBasic.getE01POB().trim()%>" readonly>
				</td>
				<TD nowrap align="right">País : </TD>
				<TD nowrap><INPUT type="text" readonly name="E01CTR" size="21" maxlength="20"
					value="<%= collBasic.getE01CTR().trim()%>" readonly>
				</TD>
			</tr>
          <tr id="trdark">  
            <td nowrap> 
              <div align="right"></div>
            </td>
				<td nowrap ><input type="hidden" readonly name="E01TID" size="6"
					maxlength="4" value="<%= collBasic.getE01TID().trim()%>" readonly>
				</td>
				<TD nowrap align="right">Código Postal : </TD>
				<TD nowrap>
				<INPUT type="hidden" readonly name="E01ZPC" size="17" maxlength="15"
					value='<%= (collBasic.getE01ZPC() != null && !collBasic.getE01ZPC().trim().equals("") && collBasic.getE01ZPC().trim().length() > 4 )
              	?collBasic.getE01ZPC().substring(0,3):""%>'>
				<INPUT type="text" readonly name="D01ZPC" size="17" maxlength="15"
					value='<%= (collBasic.getE01ZPC() != null && !collBasic.getE01ZPC().trim().equals("") && collBasic.getE01ZPC().trim().length() > 5 )
              	?collBasic.getE01ZPC().substring(4):""%>' readonly>
				</TD>
			</tr>
			<%} else {%>
 
            <tr id="trdark"> 
              <td nowrap> 
                <div align="right">Dirección Principal :</div>
              </td>
				<td nowrap ><input type="text" readonly name="E01NA2" size="36"
					maxlength="35" value="<%= collBasic.getE01NA2().trim()%>" readonly>
				</td>
				<TD nowrap align="right">Ciudad : </TD>
				<TD nowrap><INPUT type="text" readonly name="E01CTY" size="31" maxlength="30"
					value="<%= collBasic.getE01CTY().trim()%>" readonly>
				</TD>
			</tr>
          <tr id="trclear">  
              <td nowrap> 
                <div align="right"></div>
              </td>
				<td nowrap ><input type="text" readonly name="E01NA3" size="36"
					maxlength="35" value="<%= collBasic.getE01NA3().trim()%>" readonly>
				</td>
				<TD nowrap align="right">Estado : </TD>
				<TD nowrap><INPUT type="text" readonly name="E01STE" size="5" maxlength="4"
					value="<%= collBasic.getE01STE().trim()%>" readonly>
				</TD>
			</tr>
            <tr id="trdark"> 
              <td nowrap> 
                <div align="right"></div>
              </td>
				<td nowrap ><input type="text" readonly name="E01NA4" size="36"
					maxlength="35" value="<%= collBasic.getE01NA4().trim()%>">
				</td>
				<TD nowrap align="right">País : </TD>
				<TD nowrap><INPUT type="text" readonly name="E01CTR" size="21"
					maxlength="20" value="<%= collBasic.getE01CTR().trim()%>" readonly>
				</TD>
			</tr>
          <tr id="trclear">  
              <td nowrap> 
                <div align="right">Apartado Postal : </div>
              </td>
				<td nowrap><INPUT type="text" readonly name="E01POB" size="11"
					maxlength="10" value="<%= collBasic.getE01POB().trim()%>" readonly>
				</td>
				<TD nowrap align="right">Código Postal : </TD>
				<TD nowrap><INPUT type="text" readonly name="E01ZPC" size="16"
					maxlength="15" value="<%= collBasic.getE01ZPC().trim()%>" readonly>
				</TD>
			</tr>
         <%} %>   
         </table>
      </td>
    </tr>
  </table>
<%-- A. BIENES MUEBLES --%>
<% if (collBasic.getE01ROCTYP().equals("A")) { %>
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
            <INPUT type="text" name="E01ROCAM1" size="17" maxlength="17" value="<%= collBasic.getE01ROCAM1().trim()%>" readonly>
            </td>
			<td nowrap> 
              <div align="right">Valor Actual :</div>
            </td>
            <td nowrap colspan="3">            	 
            <INPUT type="text" name="E01ROCFAA" size="17" maxlength="17" value="<%= collBasic.getE01ROCFAA().trim()%>"  readonly>
            </td>
          </tr>
   		  <tr id="trclear"> 
            <td nowrap> 
              <div align="right">Número de Póliza :</div>
            </td>
            <td nowrap colspan="3">            	 
              <input type="text" name="E01ROCLOC" size="37" maxlength="35" value="<%= collBasic.getE01ROCLOC().trim()%>" >
            </td>
			<td nowrap> 
              <div align="right">Valor de Cobertura :</div>
            </td>
            <td nowrap colspan="3">            	 
	            <INPUT type="text" name="E01ROCAM2" size="17" maxlength="17" value="<%= collBasic.getE01ROCAM2().trim()%>" readonly>
            </td>
          </tr>
   		  <tr id="trdark"> 
            <td nowrap> 
              <div align="right">Fecha Renovación Póliza :</div>
            </td>
            <td nowrap colspan="3"> 
               <%= datapro.eibs.master.Util.formatCustomDate(currUser.getE01DTF(),collBasic.getBigDecimalE01ROCPDM().intValue(),collBasic.getBigDecimalE01ROCPDD().intValue(),collBasic.getBigDecimalE01ROCPDY().intValue())%>        
            </td>
			<td nowrap> 
              <div align="right">Aseguradora :</div>
            </td>
            <td nowrap colspan="3">            	 
              <input type="text" name="E01ROCAIN" size="5" maxlength="4" value="<%= collBasic.getE01ROCAIN().trim()%>" readonly>
            </td>
          </tr>
   		  <tr id="trclear"> 
            <td nowrap> 
              <div align="right">Fecha de Avalúo :</div>
            </td>
            <td nowrap colspan="3">   
               <%= datapro.eibs.master.Util.formatCustomDate(currUser.getE01DTF(),collBasic.getBigDecimalE01ROCAPM().intValue(),collBasic.getBigDecimalE01ROCAPD().intValue(),collBasic.getBigDecimalE01ROCAPY().intValue())%>        
            </td>
			<td nowrap> 
              <div align="right">Fiduciaria :</div>
            </td>
            <td nowrap colspan="3">            	 
              <input type="text" name="E01ROCU10" size="5" maxlength="4" value="<%= collBasic.getE01ROCU10().trim()%>" readonly>
            </td>
          </tr>
   		  <tr id="trdark"> 
            <td nowrap> 
              <div align="right">Fecha Adquisición :</div>
            </td>
            <td nowrap colspan="3">   
                 <%= datapro.eibs.master.Util.formatCustomDate(currUser.getE01DTF(),collBasic.getBigDecimalE01ROCIDM().intValue(),collBasic.getBigDecimalE01ROCIDD().intValue(),collBasic.getBigDecimalE01ROCIDY().intValue())%>        
            </td>
			<td nowrap> 
              <div align="right">Identificación Fideicomiso :</div>
            </td>
            <td nowrap colspan="3">            	 
             <INPUT type="text" name="E01ROCRF4" size=32 maxlength=30 value="<%= collBasic.getE01ROCRF4()%>">
            </td>
          </tr>
   		  <tr id="trdark"> 
            <td nowrap> 
              <div align="right">Número de Serie :</div>
            </td>
            <td nowrap colspan="3">            	 
             <INPUT type="text" name="E01ROCRF2" size=22 maxlength=20 value="<%= collBasic.getE01ROCRF2()%>" readonly>
            </td>
			<td nowrap> 
              <div align="right">Modelo :</div>
            </td>
            <td nowrap colspan="3">            	 
             <INPUT type="text" name="E01ROCRF3" size=12 maxlength=10 value="<%= collBasic.getE01ROCRF3()%>" readonly>
            </td>
          </tr>
   		  <tr id="trclear"> 
            <td nowrap> 
              <div align="right">Marca :</div>
            </td>
            <td nowrap colspan="3">            	 
             <INPUT type="text" name="E01ROCNPH" size=17 maxlength=15 value="<%= collBasic.getE01ROCNPH()%>" readonly>
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
              <div align="right">Vencimiento en : </div>
            </td>
            <td nowrap colspan="2">            	 
            <INPUT type="text" name="E01ROCYPH" size="5" maxlength="4" value="<%= collBasic.getE01ROCYPH().trim()%>" readonly>
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
<% if (collBasic.getE01ROCTYP().equals("B")) { %>
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
            <INPUT type="text" name="E01ROCNUN" size="11" maxlength="9" value="<%= collBasic.getE01ROCNUN().trim()%>" readonly>
            </td>
			<td nowrap> 
              <div align="right">Metros :</div>
            </td>
            <td nowrap>            	 
            <INPUT type="text" name="E01ROCNCO" size="6" maxlength="5" value="<%= collBasic.getE01ROCNCO().trim()%>" readonly>
            </td>
			<td nowrap> 
              <div align="right">Hectareas :</div>
            </td>
            <td nowrap>            	 
            <INPUT type="text" name="E01ROCAIN" size="5" maxlength="4" value="<%= collBasic.getE01ROCAIN().trim()%>" readonly>
            </td>
          </tr>
   		  <tr id="trclear"> 
            <td nowrap> 
              <div align="right">Inscripción Registro Público :</div>
            </td>
            <td nowrap colspan="3">            	 
              <input type="text" name="E01ROCLOC" size="37" maxlength="35" value="<%= collBasic.getE01ROCLOC().trim()%>" readonly>
            </td>
			<td nowrap> 
              <div align="right">Tomo :</div>
            </td>
            <td nowrap>            	 
        	    <INPUT type="text" name="E01ROCFPH" size="10" maxlength="8" value="<%= collBasic.getE01ROCFPH().trim()%>" readonly>
            </td>
			<td nowrap> 
              <div align="right">Folio/Imagen :</div>
            </td>
            <td nowrap>            	 
    	        <INPUT type="text" name="E01ROCNPH" size="10" maxlength="8" value="<%= collBasic.getE01ROCNPH().trim()%>" readonly>
            </td>
          </tr>
   		  <tr id="trdark"> 
            <td nowrap> 
              <div align="right">Ficha/Asiento :</div>
            </td>
            <td nowrap colspan="3">            	 
	            <INPUT type="text" name="E01ROCCPH" size="10" maxlength="8" value="<%= collBasic.getE01ROCCPH().trim()%>" readonly>
	        </td>
			<td nowrap> 
              <div align="right">Tipo de Vivienda :</div>
            </td>
            <td nowrap colspan="3">            	 
              <input type="text" name="E01ROCUC2" size="5" maxlength="3" value="<%= collBasic.getE01ROCUC2().trim()%>" readonly>
            </td>
          </tr>
   		  <tr id="trclear"> 
            <td nowrap> 
              <div align="right">Valor Inicial :</div>
            </td>
            <td nowrap colspan="3">            	 
	            <INPUT type="text" name="E01ROCAM1" size="17" maxlength="17" value="<%= collBasic.getE01ROCAM1().trim()%>" readonly>
            </td>
			<td nowrap> 
              <div align="right">Valor Terreno :</div>
            </td>
            <td nowrap colspan="3">            	 
	            <INPUT type="text" name="E01ROCFAA" size="17" maxlength="17" value="<%= collBasic.getE01ROCFAA().trim()%>" readonly>
            </td>
          </tr>
   		  <tr id="trdark"> 
            <td nowrap> 
              <div align="right">Valor Mejoras :</div>
            </td>
            <td nowrap colspan="3">            	 
	            <INPUT type="text" name="E01ROCAM2" size="17" maxlength="17" value="<%= collBasic.getE01ROCAM2().trim()%>" readonly>
	        </td>
			<td nowrap> 
              <div align="right">Fecha Avaluo Inicial :</div>
            </td>
            <td nowrap colspan="3">     
               <%= datapro.eibs.master.Util.formatCustomDate(currUser.getE01DTF(),collBasic.getBigDecimalE01ROCAPM().intValue(),collBasic.getBigDecimalE01ROCAPD().intValue(),collBasic.getBigDecimalE01ROCAPY().intValue())%>
            </td>
          </tr>
   		  <tr id="trclear"> 
            <td nowrap> 
              <div align="right">Fiduciaria :</div>
            </td>
            <td nowrap colspan="3">            	 
              <input type="text" name="E01ROCU10" size="5" maxlength="4" value="<%= collBasic.getE01ROCUC7().trim()%>" readonly>
            </td>
			<td nowrap> 
              <div align="right">Fecha Ultimo Avaluo FCA :</div>
            </td>
            <td nowrap colspan="3">   
               <%= datapro.eibs.master.Util.formatCustomDate(currUser.getE01DTF(),collBasic.getBigDecimalE01ROCSTM().intValue(),collBasic.getBigDecimalE01ROCSTD().intValue(),collBasic.getBigDecimalE01ROCSTY().intValue())%>                     	  
            </td>
          </tr>
   		  <tr id="trdark"> 
            <td nowrap> 
              <div align="right">Código de Avaluador :</div>
            </td>
            <td nowrap colspan="3">            	 
              <input type="text" name="E01ROCUC3" size="5" maxlength="3" value="<%= collBasic.getE01ROCUC3().trim()%>" readonly>
            </td>
			<td nowrap> 
              <div align="right">Fecha Adquisición :</div>
            </td>
            <td nowrap colspan="3">    
               <%= datapro.eibs.master.Util.formatCustomDate(currUser.getE01DTF(),collBasic.getBigDecimalE01ROCIDM().intValue(),collBasic.getBigDecimalE01ROCIDD().intValue(),collBasic.getBigDecimalE01ROCIDY().intValue())%>                     	                      	 
            </td>
          </tr>
   		  <tr id="trclear"> 
            <td nowrap> 
              <div align="right">Condición de la Hipoteca :</div>
            </td>
            <td nowrap colspan="3">            	 
             <INPUT type="text" name="E01ROCNC1" size=4 maxlength=2 value="<%= collBasic.getE01ROCNC1()%>" readonly>
            </td>
			<td nowrap> 
              <div align="right">Identificación Fideicomiso :</div>
            </td>
            <td nowrap colspan="3">            	 
             <INPUT type="text" name="E01ROCRF4" size=32 maxlength=30 value="<%= collBasic.getE01ROCRF4()%>" readonly>
            </td>
          </tr>
   		  <tr id="trdark"> 
			<td nowrap> 
              <div align="right">Fecha de Escritura :</div>
            </td>
            <td nowrap colspan="3">  
               <%= datapro.eibs.master.Util.formatCustomDate(currUser.getE01DTF(),collBasic.getBigDecimalE01ROCNDM().intValue(),collBasic.getBigDecimalE01ROCNDD().intValue(),collBasic.getBigDecimalE01ROCNDY().intValue())%>                     	                      	 
            </td>
			<td nowrap> 
              <div align="right">Número de Escritura :</div>
            </td>
            <td nowrap colspan="3">            	 
             <INPUT type="text" name="E01ROCRF5" size=10 maxlength=8 value="<%= collBasic.getE01ROCRF5()%>" readonly>
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
            <INPUT type="text" name="E01ROCYPH" size="5" maxlength="4" value="<%= collBasic.getE01ROCYPH().trim()%>" readonly>
            </td>
            <td nowrap>            	 
              <div align="left">días</div>
            </td>
--%>

			<td nowrap> 
              <div align="right"></div>
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
<% if (collBasic.getE01ROCTYP().equals("C")) { %>
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
            <INPUT type="text" name="E01ROCFAA" size="17" maxlength="17" value="<%= collBasic.getE01ROCFAA().trim()%>" readonly>
            </td>
			<td nowrap> 
              <div align="right">Valor de lo Pignorado :</div>
            </td>
            <td nowrap colspan="3">            	 
            <INPUT type="text" name="E01ROCAM1" size="17" maxlength="17" value="<%= collBasic.getE01ROCAM1().trim()%>" readonly>
            </td>
          </tr>
   		  <tr id="trclear"> 
            <td nowrap> 
              <div align="right">Fecha de Renovación del Plazo :</div>
            </td>
            <td nowrap colspan="3"> 
               <%= datapro.eibs.master.Util.formatCustomDate(currUser.getE01DTF(),collBasic.getBigDecimalE01ROCAPM().intValue(),collBasic.getBigDecimalE01ROCAPD().intValue(),collBasic.getBigDecimalE01ROCAPY().intValue())%>                     	                      	                       	             
            </td>
			<td nowrap> 
              <div align="right">Fiduciaria :</div>
            </td>
            <td nowrap colspan="3">            	 
              <input type="text" name="E01ROCU10" size="5" maxlength="4" value="<%= collBasic.getE01ROCUC7().trim()%>" readonly>
            </td>
          </tr>
   		  <tr id="trdark"> 
			<td nowrap> 
              <div align="right">Fecha de Retención :</div>
            </td>
            <td nowrap colspan="3">    
               <%= datapro.eibs.master.Util.formatCustomDate(currUser.getE01DTF(),collBasic.getBigDecimalE01ROCNDM().intValue(),collBasic.getBigDecimalE01ROCNDD().intValue(),collBasic.getBigDecimalE01ROCNDY().intValue())%>                     	                      	                       	                                 	 
            </td>
			<td nowrap> 
              <div align="right">Identificación Fideicomiso :</div>
            </td>
            <td nowrap colspan="3">            	 
             <INPUT type="text" name="E01ROCRF4" size=32 maxlength=30 value="<%= collBasic.getE01ROCRF4()%>" readonly>
            </td>
          </tr>
   		  <tr id="trclear"> 
            <td nowrap> 
              <div align="right">Número de la Garantía o Contrato :</div>
            </td>
            <td nowrap colspan="3">            	 
              <input type="text" name="E01ROCLOC" size="37" maxlength="35" value="<%= collBasic.getE01ROCLOC().trim()%>" readonly>
            </td>
			<td nowrap> 
              <div align="right">Código de Banco :</div>
            </td>
            <td nowrap colspan="3">            	 
              <INPUT type="text" name="E01ROCUC2" size="5" maxlength="4" value="<%= collBasic.getE01ROCUC2().trim()%>" readonly>
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
            <INPUT type="text" name="E01ROCYPH" size="5" maxlength="4" value="<%= collBasic.getE01ROCYPH().trim()%>" readonly>
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
<% if (collBasic.getE01ROCTYP().equals("D")) { %>
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
            <INPUT type="text" name="E01ROCAM1" size="17" maxlength="17" value="<%= collBasic.getE01ROCAM1().trim()%>" readonly>
            </td>
			<td nowrap> 
              <div align="right">Valor de Mercado :</div>
            </td>
            <td nowrap colspan="3">            	 
            <INPUT type="text" name="E01ROCFAA" size="17" maxlength="17" value="<%= collBasic.getE01ROCFAA().trim()%>" readonly>
            </td>
          </tr>
   		  <tr id="trclear"> 
            <td nowrap> 
              <div align="right">Fecha Ultima Cotización del Instrumento :</div>
            </td>
            <td nowrap colspan="3"> 
               <%= datapro.eibs.master.Util.formatCustomDate(currUser.getE01DTF(),collBasic.getBigDecimalE01ROCAPM().intValue(),collBasic.getBigDecimalE01ROCAPD().intValue(),collBasic.getBigDecimalE01ROCAPY().intValue())%>                     	                      	                       	                                 	                        	 
            </td>
			<td nowrap> 
              <div align="right">Fiduciaria :</div>
            </td>
            <td nowrap colspan="3">            	 
              <input type="text" name="E01ROCU10" size="5" maxlength="4" value="<%= collBasic.getE01ROCUC7().trim()%>" readonly>
            </td>
          </tr>
   		  <tr id="trdark"> 
			<td nowrap> 
              <div align="right">Código de la Carta de Crédito o del Cedente :</div>
            </td>
            <td nowrap colspan="3">            	 
              <INPUT type="text" name="E01ROCUC2" size="5" maxlength="4" value="<%= collBasic.getE01ROCUC2().trim()%>" readonly>
            </td>
			<td nowrap> 
              <div align="right">Identificación Fideicomiso :</div>
            </td>
            <td nowrap colspan="3">            	 
             <INPUT type="text" name="E01ROCRF4" size=32 maxlength=30 value="<%= collBasic.getE01ROCRF4()%>" readonly>
            </td>
          </tr>
   		  <tr id="trclear"> 
			<td nowrap> 
              <div align="right">País de Emisión :</div>
            </td>
            <td nowrap colspan="3">            	 
				<INPUT type="text" name="E01ROCGRK" size="5" maxlength="4" value="<%= collBasic.getE01ROCGRK().trim()%>" readonly>
            </td>
			<td nowrap> 
              <div align="right">Cantidad :</div>
            </td>
            <td nowrap colspan="3">            	 
	            <INPUT type="text" name="E01ROCNUN" size="11" maxlength="9" value="<%= collBasic.getE01ROCNUN().trim()%>" readonly>
            </td>
          </tr>
   		  <tr id="trdark"> 
			<td nowrap> 
              <div align="right">Calificación de la Emisión :</div>
            </td>
            <td nowrap colspan="3">            	 
             <INPUT type="text" name="E01ROCNC1" size=4 maxlength=2 value="<%= collBasic.getE01ROCNC1()%>" readonly>
            </td>
			<td nowrap> 
              <div align="right">Calificación del Emisor :</div>
            </td>
            <td nowrap colspan="3">            	 
             <INPUT type="text" name="E01ROCNC2" size=4 maxlength=2 value="<%= collBasic.getE01ROCNC2()%>" readonly>
            </td>
          </tr>
   		  <tr id="trclear"> 
			<td nowrap> 
              <div align="right">Tipo de Instrumento Financiero :</div>
            </td>
            <td nowrap colspan="3">            	 
              <INPUT type="text" name="E01ROCUC3" size="5" maxlength="4" value="<%= collBasic.getE01ROCUC3().trim()%>" readonly>
            </td>
			<td nowrap> 
              <div align="right">Instr.Financi/Prenda Agraria ó Ganadera :</div>
            </td>
            <td nowrap colspan="3">            	 
              <input type="text" name="E01ROCLOC" size="37" maxlength="35" value="<%= collBasic.getE01ROCLOC().trim()%>" readonly>
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
            <INPUT type="text" name="E01ROCYPH" size="5" maxlength="4" value="<%= collBasic.getE01ROCYPH().trim()%>" readonly>
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
<% if (collBasic.getE01ROCTYP().equals("E")) { %>
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
            <INPUT type="text" name="E01ROCAM1" size="17" maxlength="17" value="<%= collBasic.getE01ROCAM1().trim()%>" readonly>
            </td>
			<td nowrap> 
              <div align="right">Valor en Libro :</div>
            </td>
            <td nowrap colspan="3">            	 
            <INPUT type="text" name="E01ROCFAA" size="17" maxlength="17" value="<%= collBasic.getE01ROCFAA().trim()%>" readonly>
            </td>
          </tr>
   		  <tr id="trclear"> 
            <td nowrap> 
              <div align="right">Fecha Renovación Carta de Crédito o Avales/Fianzas :</div>
            </td>
            <td nowrap colspan="3"> 
               <%= datapro.eibs.master.Util.formatCustomDate(currUser.getE01DTF(),collBasic.getBigDecimalE01ROCAPM().intValue(),collBasic.getBigDecimalE01ROCAPD().intValue(),collBasic.getBigDecimalE01ROCAPY().intValue())%>                     	                      	                       	                                 	                        	                        	  
            </td>
			<td nowrap> 
              <div align="right">Fecha de Emisión :</div>
            </td>
            <td nowrap colspan="3"> 
               <%= datapro.eibs.master.Util.formatCustomDate(currUser.getE01DTF(),collBasic.getBigDecimalE01ROCIDM().intValue(),collBasic.getBigDecimalE01ROCIDD().intValue(),collBasic.getBigDecimalE01ROCIDY().intValue())%>                     	                      	                       	                                 	                        	                        	  
            </td>
          </tr>
   		  <tr id="trdark"> 
			<td nowrap> 
              <div align="right">Fiduciaria :</div>
            </td>
            <td nowrap colspan="3">            	 
              <input type="text" name="E01ROCU10" size="5" maxlength="4" value="<%= collBasic.getE01ROCUC7().trim()%>" readonly>
            </td>
			<td nowrap> 
              <div align="right">Identificación Fideicomiso :</div>
            </td>
            <td nowrap colspan="3">            	 
             <INPUT type="text" name="E01ROCRF4" size=32 maxlength=30 value="<%= collBasic.getE01ROCRF4()%>" readonly>
            </td>
          </tr>
   		  <tr id="trclear"> 
			<td nowrap> 
              <div align="right">Número C/C o Cesiones Sobre Pagarés/Cartera :</div>
            </td>
            <td nowrap colspan="3">            	 
              <input type="text" name="E01ROCLOC" size="37" maxlength="35" value="<%= collBasic.getE01ROCLOC().trim()%>" readonly>
            </td>
			<td nowrap> 
              <div align="right">Código de la Carta de Crédito o del Cedente :</div>
            </td>
            <td nowrap colspan="3">            	 
              <INPUT type="text" name="E01ROCUC2" size="5" maxlength="4" value="<%= collBasic.getE01ROCUC2().trim()%>" readonly>
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
            <INPUT type="text" name="E01ROCYPH" size="5" maxlength="4" value="<%= collBasic.getE01ROCYPH().trim()%>" readonly>
            </td>
            <td nowrap>            	 
              <div align="left">días</div>
            </td>
--%>

			<td nowrap> 
              <div align="right"></div>
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
<% if (collBasic.getE01ROCTYP().equals("F")) { %>
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
               <%= datapro.eibs.master.Util.formatCustomDate(currUser.getE01DTF(),collBasic.getBigDecimalE01ROCIDM().intValue(),collBasic.getBigDecimalE01ROCIDD().intValue(),collBasic.getBigDecimalE01ROCIDY().intValue())%>                     	                      	                       	                                 	                        	                        	       
            </td>
            <td nowrap> 
              <div align="right">Monto del Aval :</div>
            </td>
            <td nowrap colspan="3">            	 
            <INPUT type="text" name="E01ROCAM1" size="17" maxlength="17" value="<%= collBasic.getE01ROCAM1().trim()%>" readonly>
            </td>
          </tr>
   		  <tr id="trclear"> 
			<td nowrap> 
              <div align="right">Saldo :</div>
            </td>
            <td nowrap colspan="3">            	 
            <INPUT type="text" name="E01ROCAM2" size="17" maxlength="17" value="<%= collBasic.getE01ROCAM2().trim()%>" readonly>
            </td>
			<td nowrap> 
              <div align="right">Tabla de Provisión :</div>
            </td>
            <td nowrap colspan="3">            	 
             <INPUT type="text" name="E01ROCNC1" size=4 maxlength=2 value="<%= collBasic.getE01ROCNC1()%>" readonly>
            </td>
          </tr>
   		  <tr id="trdark"> 
            <td nowrap> 
              <div align="right">Monto de la Garantía :</div>
            </td>
            <td nowrap colspan="3">            	 
            <INPUT type="text" name="E01ROCFAA" size="17" maxlength="17" value="<%= collBasic.getE01ROCFAA().trim()%>" readonly>
            </td>
			<td nowrap> 
              <div align="right">Provisión Establecida :</div>
            </td>
            <td nowrap colspan="3">            	 
            <INPUT type="text" name="E01ROCINA" size="17" maxlength="17" value="<%= collBasic.getE01ROCINA().trim()%>" readonly>
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
            <INPUT type="text" name="E01ROCYPH" size="5" maxlength="4" value="<%= collBasic.getE01ROCYPH().trim()%>" readonly>
            </td>
            <td nowrap>            	 
              <div align="left">días</div>
            </td>
--%>

			<td nowrap> 
              <div align="right">Clasificación de Riesgo :</div>
            </td>
            <td nowrap colspan="3">            	 
             <INPUT type="text" name="E01ROCFL1" size=4 maxlength=2 value="<%= collBasic.getE01ROCFL1()%>" readonly>
            </td>
          </tr>
        </table>          
      </td> 
    </tr> 
    </table>
<% } %>

<% if (collBasic.getE01ROCTYP().equals("H")) { %>

  <h4>Detalle de Garantía</h4>

    <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing=0 cellpadding=2 width="100%" border="0">          

   		  <tr id="trdark"> 
   		    <td nowrap> 
              <div align="right">Valor Actual :</div>
            </td>
            <td nowrap>            	 
              <INPUT type="text" name="E01ROCFAA" size="17" readonly maxlength="17" value="<%= collBasic.getE01ROCFAA().trim()%>" onkeypress="enterDecimal(event, 2)">
              
            </td>
            <td nowrap> 
            </td>
            <td nowrap>            	 
            </td>
          </tr>
          
      </table>          
      </td> 
    </tr> 
    </table>
<% } %>

<% if (collBasic.getE01ROCTYP().equals("I")) { %>

  <h4>Detalle de Garantía</h4>

    <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing=0 cellpadding=2 width="100%" border="0">          

   		  <tr id="trdark"> 
   		    <td nowrap> 
              <div align="right">Valor Actual :</div>
            </td>
            <td nowrap>            	 
              <INPUT type="text" name="E01ROCFAA" size="17" readonly maxlength="17" value="<%= collBasic.getE01ROCFAA().trim()%>" onkeypress="enterDecimal(event, 2)">
            </td>
            <td nowrap> 
            </td>
            <td nowrap>            	 
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
               <input type="text" name="E01ROCAM1" readonly size="17" maxlength="15" value="<%= collBasic.getE01ROCAM1().trim()%>">            </td>
            <td nowrap> 
              <div align="right">Valor a Depreciar :</div>
            </td>
            <td nowrap colspan="3">            	 
	           <INPUT type="text" name="E01ROCCOP" readonly size="17" maxlength="17" value="<%= collBasic.getE01ROCCOP().trim()%>">
            </td>
          </tr>
   		  <tr id="trclear"> 
			<td nowrap> 
              <div align="right">Fecha de Adquisición :</div>
            </td>
            <td nowrap colspan="3">
                 <%= datapro.eibs.master.Util.formatCustomDate(currUser.getE01DTF(),collBasic.getBigDecimalE01ROCIDM().intValue(),collBasic.getBigDecimalE01ROCIDD().intValue(),collBasic.getBigDecimalE01ROCIDY().intValue())%>        
            </td>
            <td nowrap> 
              <div align="right">Fecha Ultima Depreciación :</div>
            </td>
            <td nowrap colspan="3">
               <%= datapro.eibs.master.Util.formatCustomDate(currUser.getE01DTF(),collBasic.getBigDecimalE01ROCNXM().intValue(),collBasic.getBigDecimalE01ROCNXD().intValue(),collBasic.getBigDecimalE01ROCNXY().intValue())%>                     	                      	                       	                                 	                        	                        	       
            </td>
          </tr>
   		  <tr id="trdark"> 
			<td nowrap> 
              <div align="right">Tiempo Transcurrido :</div>
            </td>
            <td nowrap colspan="3">            	 
               <input type="text" name="E01ROCTCU" readonly size="8" maxlength="7" value="<%= collBasic.getE01ROCTCU().trim()%>">            </td>
            <td nowrap> 
              <div align="right">Meses a Depreciar :</div>
            </td>
            <td nowrap colspan="3">            	 
	           <INPUT type="text" name="E01ROCCYC" readonly size="4" maxlength="3" value="<%= collBasic.getE01ROCCYC().trim()%>">
            </td>
          </tr>
   		  <tr id="trclear"> 
			<td nowrap> 
              <div align="right">Tabla/Porcentaje de Depreciación :</div>
            </td>
            <td nowrap colspan="3">            	 
                <INPUT type="text" name="E01ROCUC9" readonly size="5" maxlength="4" value="<%= collBasic.getE01ROCUC9().trim()%>">
           		<input type="text" name="E01ROCRAT" readonly size="6" maxlength="5" value="<%= collBasic.getE01ROCRAT().trim()%>">
            <td nowrap> 
              <div align="right">Depreciación Acumulada :</div>
            </td>
            <td nowrap colspan="3">            	 
	           <INPUT type="text" name="E01ROCINA" size="17" readonly maxlength="17" value="<%= collBasic.getE01ROCINA().trim()%>">
            </td>
          </tr>
   		  <tr id="trdark"> 
			<td nowrap> 
              <div align="right">Valor  Garantía :</div>
            </td>
            <td nowrap colspan="3">            	 
           		<input type="text" name="E01ROCFAA" readonly size="17" maxlength="15" value="<%= collBasic.getE01ROCFAA().trim()%>">
			<% if (collBasic.getE01ROCTYP().equals("B")) { %>
            <td nowrap> 
              <div align="right">Valor Mejoras :</div>
            </td>
            <td nowrap colspan="3">            	 
	           <INPUT type="text" name="E01ROCAM2" readonly size="17" maxlength="17" value="<%= collBasic.getE01ROCAM2().trim()%>">
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

<h4>Sumario</h4>
    <table class="tableinfo">
      <tr > 
        <td >
          <table cellspacing="0" cellpadding="2" width="100%" border="0" >
            <tr id="trdark"> 
              	<td width=25%><div align="right">Valor Tasado : </div></td>
            	<td width=22%> 
              		<div align="left">
                  		<input type="text" class="txtright" name="E01ROCAPA" readonly size="17" maxlength="15" value="<%= collBasic.getE01ROCAPA().trim()%>">
                	</div>
              	</td>
            </tr>
            <tr id="trclear"> 
              	<td width=25%><div align="right">Valor Elegible : </div></td>
            	<td width=22%> 
              		<div align="left">
                		<input type="text" class="txtright" name="E01ROCLIV" readonly size="17" maxlength="15" value="<%= collBasic.getE01ROCLIV().trim()%>">
              		</div>
              	</td>
            </tr>
            <tr id="trdark"> 
              	<td width=25%><div align="right">Valor Inelegible : </div></td>
            	<td width=22%> 
              		<div align="left">
                		<input type="text" class="txtright" name="E01ROCINA" readonly size="17" maxlength="15" value="<%= collBasic.getE01ROCINA().trim()%>">
              		</div>
              	</td>
            </tr>
            <tr id="trclear"> 
              	<td width=25%><div align="right">Valor Actual : </div></td>
           		<td width=22%> 
              		<div align="left">
                		<input type="text" class="txtright" name="E01ROCFAA" readonly size="17" maxlength="15" value="<%= collBasic.getE01ROCFAA().trim()%>">
              		</div>
              	</td>
            </tr>
            <tr id="trdark"> 
              	<td width=25%><div align="right">Valor Inicial : </div></td>
           		<td width=22%> 
              		<div align="left">
                		<input type="text" class="txtright" name="E01ROCAM1" readonly size="17" maxlength="15" value="<%= collBasic.getE01ROCAM1().trim()%>">
              		</div>
              	</td>
            </tr>  	
            <tr id="trclear"> 
              	<td width=25%><div align="right">Valor en Libros : </div></td>
            	<td width=22%> 
              		<div align="left">
                		<input type="text" class="txtright" name="E01ROCCOP" readonly size="17" maxlength="15" value="<%= collBasic.getE01ROCCOP().trim()%>">
              		</div>
              	</td>
            </tr>
            <tr id="trdark"> 
              	<td width=25%><div align="right">Valor Utilizado : </div></td>
            	<td width=22%> 
              		<div align="left">
                		<input type="text" class="txtright" name="E01ROCUSE" readonly size="17" maxlength="15" value="<%= collBasic.getE01ROCUSE().trim()%>">
              		</div>
              	</td>
            </tr>
            <tr id="trclear"> 
              	<td width=25%><div align="right">Valor Disponible : </div></td>
            	<td width=22%> 
              		<div align="left">
                		<input type="text" class="txtright" name="E01ROCBAL" readonly size="17" maxlength="15" value="<%= collBasic.getE01ROCBAL().trim()%>">
              		</div>
              	</td>
            </tr>
          </table>
        </td>
      </tr>
    </table>

<div id="Poliza">

<h4>Poliza de Seguro de Garantía</h4>

<table class="tableinfo" >
    <tr > 
      <td > 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" >

          <tr id="trdark"> 
            <td width=22%> 
              <div align="right">Aseguradora : </div>
            </td>
            <td width=23%> 
              <div align="left"> 
                  <input type="text" name="E01ROCICM" readonly size="37" maxlength="35" value="<%= collBasic.getE01ROCICM().trim()%>">
              </div>
            </td>
            <td width=29%> 
              <div align="right">N&uacute;mero : </div>
            </td>
            <td width=26% nowrap> 
              <div align="left"> 
                  <input type="text" name="E01ROCICN" readonly size="7" maxlength="5" value="<%= collBasic.getE01ROCICN().trim()%>">
              </div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td width=22%> 
              <div align="right">Descripci&oacute;n : </div>
            </td>
            <td width=23%> 
              <div align="left"> 
                  <input type="text" name="E01ROCIPD" readonly size="32" maxlength="30" value="<%= collBasic.getE01ROCIPD().trim()%>">
              </div>
            </td>
            <td width=29%> 
              <div align="right">Poliza : </div>
            </td>
            <td width=26% nowrap> 
              <div align="left"> 
                  <input type="text" name="E01ROCCIN" readonly size="41" maxlength="40" value="<%= collBasic.getE01ROCCIN().trim()%>">
              </div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td width=22%> 
              <div align="right">Moneda : </div>
            </td>
            <td width=23%> 
              <div align="left"> 
                  <input type="text" name="E01ROCICY" readonly size="5" maxlength="3" value="<%= collBasic.getE01ROCICY().trim()%>">
              </div>
            </td>
            <td width=29%> 
              <div align="right">Fecha de Emisi&oacute;n : </div>
            </td>
            <td width=26% nowrap> 
              <div align="left"> 
               <%= datapro.eibs.master.Util.formatCustomDate(currUser.getE01DTF(),collBasic.getBigDecimalE01ROCEMM().intValue(),collBasic.getBigDecimalE01ROCEMD().intValue(),collBasic.getBigDecimalE01ROCEMY().intValue())%>                     	                      	                       	                                 	                        	                        	       
              </div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td width=22%> 
              <div align="right">Valor Poliza : </div>
            </td>
            <td width=23%> 
              <div align="left"> 
                  <input type="text" class="txtright" name="E01ROCIPA" readonly size="17" maxlength="15" value="<%= collBasic.getE01ROCIPA().trim()%>">
              </div>
            </td>
            <td width=29%> 
              <div align="right">Fecha de Vencimiento : </div>              
            </td>
            <td width=26% nowrap> 
              <div align="left"> 
               <%= datapro.eibs.master.Util.formatCustomDate(currUser.getE01DTF(),collBasic.getBigDecimalE01ROCMDM().intValue(),collBasic.getBigDecimalE01ROCMDD().intValue(),collBasic.getBigDecimalE01ROCMDY().intValue())%>                     	                      	                       	                                 	                        	                        	                                     
              </div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td width=22%> 
              <div align="right">Excepci&oacute;n : </div>
            </td>
            <td width=23%> 
              <div align="left"> 
                  <input type="text" name="E01ROCRGK" readonly size="3" maxlength="1" value="<%= collBasic.getE01ROCRGK().trim()%>">
              </div>
            </td>
            <td width=29%> 
              <div align="right">Aviso de Vencimiento : </div>
            </td>
            <td width=26%> 
              <div align="left"> 
                  <input type="text" name="E01ROCCLF" readonly size="3" maxlength="1" value="<%= collBasic.getE01ROCCLF().trim()%>">
              </div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td width=22%> 
              <div align="right">Emitido por : </div>
            </td>
            <td width=23%> 
              <div align="left"> 
                  <input type="text" name="E01ROCEMB" readonly size="6" maxlength="4" value="<%= collBasic.getE01ROCEMB().trim()%>">
              </div>
            </td>
            <td width=29%> 
              <div align="right">C&oacute;digo de Usuario : </div>
            </td>
            <td width=26% nowrap> 
              <div align="left"> 
                  <input type="text" name="E01ROCUSC" readonly size="6" maxlength="4" value="<%= collBasic.getE01ROCUSC().trim()%>">
              </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
 </div>

<SCRIPT type="text/javascript">
	<% if(collBasic.getE01ROCINF().equals("Y")){ %>
 	 hidePoliza(true);
	<%} else { %>
 	 hidePoliza(false);
	<%}%>
	<% if (!collBasic.getE01ROCUC9().equals(" ")) { %>
 	 hideDepreciar(true);
	<%} else { %>
 	 hideDepreciar(false);
	<%}%>

</SCRIPT>

  <p>&nbsp;</p>
</form>
</body>
</html>


