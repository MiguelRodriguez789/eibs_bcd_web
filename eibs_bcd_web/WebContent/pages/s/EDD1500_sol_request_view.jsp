<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@page import="com.datapro.constants.EibsFields"%>
<html>
<head>
<title>Consulta de Solicitudes</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="Microsoft FrontPage 4.0">

<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
</head>

<jsp:useBean id="solBasic" class="datapro.eibs.beans.EDD150001Message"  scope="session" />

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />

<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>

<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />

<body>

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>

<% 
 if ( !error.getERRNUM().equals("0")  ) 
 {
     error.setERRNUM("0");
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
 }


%> 
<H3 align="center"><% if(solBasic.getE01REQAPC().equals("FA")) out.print("Consulta Solicitud Fallecido");
   else if ((solBasic.getE01REQAPC().equals("RP")) &&  (solBasic.getE01REQACD().equals("04"))) out.print("Consulta Solicitud Giro Cuenta Ahorro");
   else if ((solBasic.getE01REQAPC().equals("RP")) &&  (solBasic.getE01REQACD().equals("06"))) out.print("Consulta Solicitud Retiro Parcial Cuota Participacion"); 
   else if ((solBasic.getE01REQAPC().equals("RE")) &&  (solBasic.getE01REQACD().equals("06"))) out.print("COnsulta Solicitud Renuncia Cuota Participacion");     
   else out.print("");%><img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="sol_request_view.jsp, EDD1500"></H3>

<H3 align="center">Consulta de Solicitudes<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="sol_request_view.jsp, EDD1500"></H3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDD1500" onsubmit="return(valida_contenido())">
  <INPUT TYPE=HIDDEN NAME="SCREEN" value="6">
  <table class="tableinfo" width="640">
          <tr id="trdark"> 
            <td nowrap width="16%" > 
              <div align="right"><b>Cliente :</b></div>
            </td>
            <td nowrap width="20%" > 
              <div align="left"> 
                <input type="text" name="E01REQCUN" size="10" maxlength="9" value="<%= userPO.getHeader1()%>" readonly>
			</div>
            </td>
            <td nowrap width="16%" > 
              <div align="right"><b>Nombre :</b> </div>
            </td>
            <td nowrap colspan="3" > 
              <div align="left"> 
                <input type="text" name="E01CUSNA1" size="45" maxlength="45" readonly value="<%= userPO.getHeader2()%>" readonly>
              </div>
            </td>
          </tr>
         <tr id="trclear"> 
          <td nowrap width="16%" > 
              <div align="right"><b>Identif. :</b></div>
            </td>
            <td nowrap width="20%" > 
              <div align="left"> 
                <input type="text" name="E01REQIDN" size="10" maxlength="9" value="<%= solBasic.getE01REQIDN()%>" readonly>
			</div>
            </td>
            <td nowrap width="16%" > 
              <div align="right"><b>Convenio :</b></div>
            </td>
            <td nowrap width="20%" > 
              <div align="left"> 
                <input type="text" name="E01REQCON" size="10" maxlength="9" value="<%= solBasic.getE01REQCON()%>" readonly>
			</div>
            </td>
            <td nowrap width="16%" > 
              <div align="right"><b>Fecha Ing. Socio :</b></div>
            </td>
            <td nowrap width="20%" > 
              <div align="left"> 
				<eibsinput:date name="solBasic" fn_year="E01REQIYY" fn_month="E01REQIMM" fn_day="E01REQIDD" readonly="true"/>
			</div>
            </td>        
            <td nowrap width="16%" > 
              <div align="right"><b> </b> </div>
            </td>
            <td nowrap colspan="3" > 
               <div align="right"><b> </b> </div>
            </td>
          </tr>                
  </table>
  <h4>Información de la Solicitud </h4>
  <table  class="tableinfo">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap>
		<table cellspacing="0" cellpadding="2" width="100%" border="0">
			<tr id="trdark">
				<td nowrap width="21%">
				<div align="right">Tipo de Solicitud :</div>
				</td>
				<td nowrap width="31%">
				<div align="left"><input type="text" name="E01REQTYP" size="5"
					maxlength="5" value="<%= solBasic.getE01REQTYP().trim()%>" readonly>
				<input type="text" name="D01REQTYP" size="30" maxlength="30"
					value="<%= solBasic.getD01REQTYP().trim()%>" readonly></div>
				</td>
				<td nowrap width="21%">
				<div align="right"></div>
				</td>
				<td nowrap width="26%">
				<div align="right"></div>
				</td>
			</tr>
			<tr id="trclear">
				<td nowrap width="16%">
				<div align="right">Causal :</div>
				</td>
				<td nowrap width="23%">
				<div align="left"><input type="text" name="E01REQCAU" size="5"
					maxlength="5" value="<%= solBasic.getE01REQCAU().trim()%>" readonly>
				<input type="text" name="D01REQCAU" size="30" maxlength="30"
					value="<%= solBasic.getD01REQCAU().trim()%>" readonly></div>
				</td>
				<% if(solBasic.getE01REQAPC().equals("FA")){%>
				<td nowrap width="16%">
				<div align="right">Fecha Defuncion :</div>
				</td>
				<td nowrap width="20%">
				<div align="left">
					<eibsinput:date name="solBasic" fn_year="E01REQFYY" fn_month="E01REQFMM" fn_day="E01REQFDD" readonly="true"/>
				</div>
				</td>
				<%} else {%>
				<td nowrap width="1%"></td>
				<td nowrap width="25%"></td>
				<% } %>
			</tr>
			<tr id="trdark">
				<td nowrap width="21%">
				<div align="right">Numero :</div>
				</td>
				<td nowrap width="31%">
				<div align="left"><input type="text" name="E01REQNUM"
					size="12" maxlength="12"
					value="<%= solBasic.getE01REQNUM().trim()%>" readonly></div>
				</td>
				<td nowrap width="21%">
				<div align="right"></div>
				</td>
				<td nowrap width="26%">
				<div align="right"></div>
				</td>
			</tr>
			<tr id="trclear">
				<td nowrap width="21%">
				<div align="right">Fecha Ingreso :</div>
				</td>
				<td nowrap width="31%">
				<div align="left">
					<eibsinput:date name="solBasic" fn_year="E01REQSYY" fn_month="E01REQSMM" fn_day="E01REQSDD" readonly="true"/>
				</div>
				</td>
				<td nowrap width="21%">
				<div align="right">Plazo :</div>
				</td>
				<td nowrap width="26%"><input type="text" name="E01REQP01"
					size="6" maxlength="6" value="<%= solBasic.getE01REQP01().trim()%>"
					readonly> Dias</td>
			</tr>
			<tr id="trdark">
				<td nowrap width="21%">
				<div align="right">Plazo Aprobacion :</div>
				</td>
				<td nowrap width="31%">
				<div align="left">
					<eibsinput:date name="solBasic" fn_year="E01REQMYY" fn_month="E01REQMMM" fn_day="E01REQMDD" readonly="true"/>
				</div>
				</td>
				<td nowrap width="21%">
				<div align="right">Plazo :</div>
				</td>
				<td nowrap width="26%"><input type="text" name="E01REQP02"
					size="6" maxlength="6" value="<%= solBasic.getE01REQP02().trim()%>"
					readonly> Dias</td>
			</tr>
			<tr id="trclear">
				<td nowrap width="21%">
				<div align="right">Plazo Vencmto. :</div>
				</td>
				<td nowrap width="31%">
				<div align="left">
					<eibsinput:date name="solBasic" fn_year="E01REQPYY" fn_month="E01REQPMM" fn_day="E01REQPDD" readonly="true"/>
				</div>
				</td>
				<td nowrap width="21%">
				<div align="right">Antiguedad Socio :</div>
				</td>
				<td nowrap width="26%">
				<div align="left"><input type="text" name="E01REQANT" size="6"
					maxlength="6" value="<%= solBasic.getE01REQANT().trim()%>" readonly>
				Meses</div>
				</td>
			</tr>
			<tr id="trdark">
				<td nowrap width="21%">
				<div align="right">Observaciones :</div>
				</td>
				<td nowrap width="31%">
				<div align="left"><input type="text" name="E01REQCOM"
					size="30" maxlength="30"
					value="<%= solBasic.getE01REQCOM().trim()%>" readonly></div>
				</td>
				<td nowrap width="21%">
				<div align="right">Estado :</div>
				</td>
				<td nowrap width="26%"><INPUT type="HIDDEN" name="E01REQSTS"
					size="1" value="<%=solBasic.getE01REQSTS().trim()%>" readonly>
				<%if (solBasic.getE01REQSTS().equals("I")) out.print("INGRESADA");
					 else if (solBasic.getE01REQSTS().equals("A")) out.print("APROBADA");
   					 else if (solBasic.getE01REQSTS().equals("O")) out.print("ING. CON OBS.");
   					 else if (solBasic.getE01REQSTS().equals("P")) out.print("PAGADA");
   					 else if (solBasic.getE01REQSTS().equals("R")) out.print("RECHAZADA");
   					 else if (solBasic.getE01REQSTS().equals("N")) out.print("ANULADA");
    				 else if (solBasic.getE01REQSTS().equals("V")) out.print("VENCIDA"); %>
				</td>
			</tr>
			<tr id="trdark">
				<td nowrap width="21%">
				<div align="right"></div>
				</td>
				<td nowrap width="31%">
					<div align="left">
					</div>
				</td>
				<td nowrap width="21%">
				<div align="right">Rechazo :</div>
				</td>
				<td nowrap width="26%">
					<% out.print(solBasic.getE01DESMOT());%>
				</td>
			</tr>
		</table>
		</td>
    </tr>
  </table>
<% if(solBasic.getE01REQACD().equals("06")){%>  
  <H4>Cuotas de Participacion</H4>
  <table  class="tableinfo">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
         <tr id="trdark"> 
            <td nowrap width="16%" >
              <div align="right">Numero de Cuenta : </div>
            </td>
            <td nowrap width="20%"> 
               <input type="text" name="E01REQACC" size="12" maxlength="13" value="<%= solBasic.getE01REQACC().trim()%>" readonly>
            </td> 
           <td nowrap width="16%" >
              <div align="right"> </div>
            </td>
            <td nowrap width="20%" > 
              <div align="right"> </div> 
            </td>                                 
          </tr>
          <tr id="trclear"> 
            <td nowrap width="16%" >
              <div align="right">Saldo en $ :</div>
            </td>
            <td nowrap width="20%" >
            <div align="left">   
              <eibsinput:text name="solBasic" property="E01REQSBL" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true" required="false"  />                             
              </div> 
             </td>
             <td nowrap width="16%">
              <div align="right">Saldo en Cuotas :</div>
            </td>
            <td nowrap width="20%"> 
            <div align="left">  
               <input type="text" name="E01REQCBL" size="6" maxlength="6" value="<%= solBasic.getE01REQCBL().trim()%>" readonly>
             </div>   
             </td>
            </tr>
<% if (solBasic.getE01REQAPC().equals("RP")) {%>             
          <tr id="trdark"> 
           <td nowrap width="16%" >
            <div align="right">Monto de Retiro en $ :</div>
            </td>
            <td nowrap width="20%" >
            <div align="left">   
              <eibsinput:text name="solBasic" property="E01REQGBL" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true" required="false"  />                             
              </div> 
             </td>
            <td nowrap width="16%" >
              <div align="right">Retiro en Cuotas :</div>
            </td>
            <td nowrap width="20%" > 
              <input type="text" name="E01REQGCP" size="6" maxlength="6" value="<%= solBasic.getE01REQGCP().trim()%>" readonly> 
            </td>
          </tr>
          <% } %>          
        </table>
      </td>
    </tr>
  </table>
<% } %>
<% if((solBasic.getE01REQACD().equals("04")) && (solBasic.getE01REQAPC().equals("RP"))){%>  
  <H4>Giro Cuentas de Ahorro </H4>
  <table  class="tableinfo">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="trdark"> 

            <td nowrap width="16%" >
              <div align="right">Numero de Cuenta : </div>
            </td>
            <td nowrap width="20%"> 
              <input type="text" name="E01REQACC" size="13" maxlength="12" value="<%= solBasic.getE01REQACC().trim()%>" readonly>                
            </td>  
            <td nowrap width="16%" >
              <div align="right">Monto del Giro :</div>
            </td>
            <td nowrap width="20%" > 
            <eibsinput:text name="solBasic" property="E01REQGBL" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true" required="false"  /> 
            </td>                    
          </tr>         
        </table>
      </td>
    </tr>
  </table>
<% } %>    
  
<SCRIPT type="text/javascript">

    function tableresize() {
     adjustEquTables(headTable,dataTable,dataDiv,0,true);
   }
  tableresize();
  window.onresize=tableresize; 

</SCRIPT> 
  
   <p align="center"> 
            <input id="EIBSBTN" type=submit name="Submit" value="Volver">
   </p> 
  </form>
</body>
</html>
