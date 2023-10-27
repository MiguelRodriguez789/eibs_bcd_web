<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@ page import = "datapro.eibs.master.Util" %>
<%@ page import="com.datapro.constants.EibsFields"%>

<html>
<head>
<title>Información Básica de Certificados de Depósito</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/jquery/plugins/contextMenu/css/jquery.contextMenu.css" rel="stylesheet" type="text/css" />

<jsp:useBean id="deduct" class="datapro.eibs.beans.EDL037101Message"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>


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
<h3 align="center">Deducciones<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="deductions_inquiry_main.jsp,EDL0371"></h3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDL0371" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="3000">
  <INPUT TYPE=HIDDEN NAME="E01DEABNK" id="E01DEABNK" value="<%= deduct.getE01DEABNK().trim()%>">
  <input type=HIDDEN NAME="E01DEAACD" id="E01DEAACD" value="<%= deduct.getE01DEAACD().trim()%>">
  <input type=HIDDEN NAME="E01DLITYP" id="E01DLITYP" value="<%= deduct.getE01DLITYP().trim()%>"> 
  <input type=HIDDEN NAME="E01DLIPAC" id="E01DLIPAC" value="<%= deduct.getE01DLIPAC().trim()%>">

  <% int row = 0;%>
 
  <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
          <tr id="trdark"> 
            <td nowrap width="16%" > 
              <div align="right"><b>Cliente :</b></div>
            </td>
            <td nowrap width="16%" > 
              <div align="left"> 
              	<eibsinput:text property="E01DEACUN" name="deduct" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CUSTOMER%>" readonly="true"/> 
              </div>
            </td>
            <td nowrap width="16%" > 
              <div align="right"><b>Nombre :</b></div>
            </td>
            <td nowrap colspan="3" > 
              <div align="left"> 
              	<eibsinput:text property="E01CUSNA1" name="deduct" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_NAME%>" readonly="true"/> 
              </div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="16%" > 
              <div align="right"><b>Cuenta :</b></div>
            </td>
            <td nowrap width="16%" > 
              <div align="left"> 
              	<eibsinput:text property="E01DEAACC" name="deduct" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_ACCOUNT%>" readonly="true"/> 
              </div>
            </td>
            <td nowrap width="16%" > 
              <div align="right"><b>Moneda :</b></div>
            </td>
            <td nowrap width="16%" > 
              <div align="left"> 
              	<eibsinput:text property="E01DEACCY" name="deduct" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CURRENCY%>" readonly="true"/> 
              </div>
            </td>
            <td nowrap width="16%" > 
              <div align="right"><b>Producto :</b></div>
            </td>
            <td nowrap width="17%" > 
              <div align="left">
              	<eibsinput:text property="E01DEAPRO" name="deduct" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_PRODUCT%>" readonly="true"/> 
              </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  
  <h4>Prestatario</h4>

  <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing=0 cellpadding=2 width="100%" border="0">
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
			<td width="12%" > 
              <div align="right">Deducci&oacute;n :</div>
            </td>
            <td nowrap width="38%"> 
              <eibsinput:text property="E01DLICDE" name="deduct" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CNOFC%>" readonly="true" modified="F01DLICDE" />
              <eibsinput:text property="E01DLIRMK" name="deduct" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DESCRIPTION%>" readonly="true" modified="F01DLIRMK" />
            </td>
			<td width="12%" > 
              <div align="right">Relaci&oacute;n :</div>
            </td>
            <td nowrap width="38%"> 
              <input type="text" name="E01DLIREF" size="20" maxlength="20" value="<%= deduct.getE01DLIREF().trim()%>" readonly <% if (deduct.getF01DLIREF().equals("Y")) out.print("class=\"txtchanged\""); %>> 
            </td>            
          </tr>        
	   	  <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
				<td width="12%" > 
					<div align="right">Plan de Seguro:</div>
				</td>
				<td width="38%" > 
    		         <eibsinput:text property="E01DLIPLN" name="deduct" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CNOFC%>" readonly="true" modified="F01DLIPLN" />
		             <eibsinput:text property="E01DSCPLN" name="deduct" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_NAME %>" readonly="true" modified="F01DLIPLN" /> 						
				</td>
				<td width="12%" > 
					<div align="right">Poliza Numero :</div>
				</td>             
				<td width="38%" > 
					<eibsinput:text name="deduct" property="E01DLIPLZ" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_REFERENCE%>" readonly="true" modified="F01DLIPLZ"/>
				</td>
			</tr>
			<tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
				<td width="12%" > 
 						  <div align="right">Compania :</div>
				</td>
				<td width="38%" nowrap="nowrap" > 
			        <eibsinput:text property="E01DLICIA" name="deduct" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CNOFC%>" readonly="true" modified="F01DLICIA" />
	                <eibsinput:text property="E01DSCCIA" name="deduct" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_NAME %>" readonly="true" modified="F01DLICIA"/> 					
              	</td>
				<td width="12%" > 
					<div align="right">Fecha Inicio :</div>
				</td>
				<td width="38%" > 
	                <eibsinput:date name="deduct" fn_month="E01DLIPIM" fn_day="E01DLIPID" fn_year="E01DLIPIY" readonly="true" modified="F01DLIPIM;F01DLIPID;F01DLIPIY" />
				</td>
			</tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
			<td width="12%" > 
					<div align="right">Tabla Factor :</div>
			</td>
			<td width="38%" > 
			         <eibsinput:text property="E01DLITBL" name="deduct" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CNOFC%>" readonly="true" modified="F01DLITBL" />
			</td>
           <td width="12%"> 
				<div align="right">Fecha Vencimiento :</div>
            </td>
            <td width="38%"> 
	              <eibsinput:date name="deduct" fn_month="E01DLIPFM" fn_day="E01DLIPFD" fn_year="E01DLIPFY" readonly="true" modified="F01DLIPFM;F01DLIPFD;F01DLIPFY"/>
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
				<td width="12%" > 
		           <div align="right">Cobro de I.V.A :</div>
				</td>
				<td width="38%" > 
	              <input type="radio" name="E01DLIIVA" value="Y" <%if(deduct.getE01DLIIVA().equals("Y")) out.print("checked");%> disabled="disabled"> Sí 
	              <input type="radio" name="E01DLIIVA" value="N" <%if(!deduct.getE01DLIIVA().equals("Y")) out.print("checked");%> disabled="disabled"> No				
				</td>
            <td width="12%" > 
					<div align="right">Numero de Meses :</div>
            </td>
            <td width="38%" > 
					<eibsinput:text name="deduct" property="E01DLINPM" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_INTEGER %>" size="4" maxlength="3" readonly="true" modified="F01DLINPM" />
	        </td> 
         </tr>
  <% if ( deduct.getH01FLGWK3().equals("3")) {%>        
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="12%"> 
              <div align="right">Año Fabricación :</div>
            </td>
				<td width="38%" > 
            	<eibsinput:text property="E01DLIYOP" name="deduct" size="5" maxlength="4" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_INTEGER %>" readonly="true" modified="F01DLIYOP"/> 
            </td>
            <td nowrap width="12%"> 
              <div align="right">Tabla Seguro :</div>
            </td>
				<td width="38%" > 
              <input type="text" name="E01DLITBL" size="2" maxlength="2" value="<%= deduct.getE01DLITBL().trim()%>" readonly <% if (deduct.getF01DLITBL().equals("Y")) out.print("class=\"txtchanged\""); %>>
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="12%"> 
              <div align="right">Meses de Seguro :</div>
            </td>
				<td width="38%" > 
            	<eibsinput:text property="E01DLIINM" name="deduct" size="3" maxlength="2"  eibsType="<%=EibsFields.EIBS_FIELD_TYPE_INTEGER %>" readonly="true" modified="F01DLIINM"/> 
            <td nowrap width="12%"> 
              <div align="right">Meses Incli.Princ.:</div>
            </td>
				<td width="38%" > 
            	<eibsinput:text property="E01DLIDDY" name="deduct" size="3" maxlength="2"  eibsType="<%=EibsFields.EIBS_FIELD_TYPE_INTEGER %>" readonly="true" modified="F01DLIDDY"/> 
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="12%"> 
              <div align="right">Pago 1er Año :</div>
            </td>
			<td width="38%" > 
              <input type="text" name="E01DLIBEG" size="17" maxlength="17" value="<%= deduct.getE01DLIBEG().trim()%>" onKeypress="enterDecimal(event, 2)" readonly <% if (deduct.getF01DLIBEG().equals("Y")) out.print("class=\"txtchanged\""); %>>
            </td>
            <td nowrap width="12%"> 
              <div align="right"></div>
            </td>
			<td width="38%" > 
            </td>
          </tr>
  <% } %>		
			<tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
	            <td nowrap width="12%"> 
	              <div align="right">Cuenta Acreditar :</div>
	            </td>
			  <td width="38%" > 
                <eibsinput:text property="F01DLIBNK" name="deduct" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_BANK %>" readonly="true" modified="F01DLIBNK"/>              
                <eibsinput:text property="F01DLIBRN" name="deduct" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_BRANCH %>" readonly="true" modified="F01DLIBRN"/>              
                <eibsinput:text property="F01DLICCY" name="deduct" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_CURRENCY %>" readonly="true" modified="F01DLICCY"/>              
                <eibsinput:text property="F01DLIGLN" name="deduct" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_GLEDGER %>" readonly="true" modified="F01DLIGLN"/>  			  
              </td>
	            <td width="12%" > 
						<div align="right"></div>
	            </td>
	            <td width="38%" > 
		        </td> 
			</tr>  
		<tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
				<td width="12%" > 
	               <div align="right">Monto Base Calculo :</div>
				</td>
				<td width="38%" > 
	              <select name="E01DLIBSE" disabled="disabled" >
	                <option value="O" <% if (deduct.getE01DLIBSE().equals("O")) out.print("selected"); %>>Monto Original</option>
	                <option value="B" <% if (deduct.getE01DLIBSE().equals("B")) out.print("selected"); %>>Saldo Capital</option>
	                <option value="I" <% if (deduct.getE01DLIBSE().equals("I")) out.print("selected"); %>>Saldo Teorico</option>
	                <option value="T" <% if (deduct.getE01DLIBSE().equals("T")) out.print("selected"); %>>Total Deuda</option>
	                <option value="C" <% if (deduct.getE01DLIBSE().equals("C")) out.print("selected"); %>>Valor Cuota</option>
	               </select>								
	             </td>
				<td width="12%" > 
					<div align="right"> Valor Compra : </div>
				</td>
				<td width="38%" > 
	                <eibsinput:text property="E01DLIPAM" name="deduct" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT%>" readonly="true" modified="F01DLIPAM" />
	             </td>
			</tr>
			<tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
				<td  width="12%" > 
       	           		 <div align="right">Factor :</div>
				</td>
				<td width="38%" > 
	              <select name="E01DLIFAC" disabled="disabled">
	                <option value="F" <% if (deduct.getE01DLIFAC().equals("F")) out.print("selected"); %>>Valor Fijo</option>
	                <option value="P" <% if (deduct.getE01DLIFAC().equals("P")) out.print("selected"); %>>Porcentaje</option>
	                <option value="1" <% if (deduct.getE01DLIFAC().equals("1")) out.print("selected"); %>>Tasa/Periodo</option>
	               </select>							
				</td>
				<td  width="12%" > 
					<div align="right" id="divFactorLabel">Monto Fijo a Pagar :</div>
				</td>
				<td width="38%" > 
	                <eibsinput:text property="E01DLIDPM" name="deduct" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT%>" readonly="true" modified="F01DLIDPM" />
				</td>
   	      </tr> 
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %>">
            <td width="12%" > 
              <div align="right">Medio de Pago :</div>
            </td>
            <td nowrap width="38%" >
                    <select name="E01DLIMPG" disabled="disabled">
                      <option value="L" <%if (deduct.getE01DLIMPG().equals("L")) { out.print("selected"); }%>>Con las Cuotas</option>
                      <option value="A" <%if (deduct.getE01DLIMPG().equals("A")) { out.print("selected"); }%>>Cuenta de Pago</option>
                      <option value="N" <%if (deduct.getE01DLIMPG().equals("N")) { out.print("selected"); }%>>Nuevo Credito</option>
                    </select>
			</td>
		  <td width="12%" > 
				<div id="nuevoPrestamo" style="display: none;" align="right"> Numero Prestamo : </div>
	            <div id="nuevaCuenta" style="display: none;" align="right"> Numero Cuenta :</div>
		  </td>
   		  <td width="38%" > 
			<div id="nuevoPrestamo2" style="display: none; vertical-align: middle; ;" align="left">		  
                          <input name="NROPRE" size="13" maxlength="12" readonly value="<%=deduct.getE01DLIPAC().trim()%>"  <% if (deduct.getF01DLIPAC().equals("Y")) out.print("class=\"txtchanged\""); %> > 
			</div>		  
           <div id="nuevaCuenta2" style="display: none; vertical-align: middle;" align="left" >
                          <input name="NROCTA" size="13" maxlength="12" readonly value="<%=deduct.getE01DLIPAC().trim()%>" <% if (deduct.getF01DLIPAC().equals("Y")) out.print("class=\"txtchanged\""); %> > 
		  	</div>			
		</td>
	  </tr>
	</table>
	</td>
	</tr>
  </table>                        
  <% if ( deduct.getH01FLGWK3().equals("3")) {%>
<h4>Contrapartida</h4>
  
  <TABLE id="mainTable" class="tableinfo">
  <TR>
  	<TD>
   		<table cellspacing=0 cellpadding=2 width="100%" border="0">
    		
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="40%"> 
              <div align="right">Bnc/Suc/Mnd/GL :</div>
            </td>
            <td nowrap width="60%">
                <eibsinput:text property="E01DLIBNK" name="deduct" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_BANK %>" readonly="true" modified="F01DLIBNK"/>              
                <eibsinput:text property="E01DLIBRN" name="deduct" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_BRANCH %>" readonly="true" modified="F01DLIBRN"/>              
                <eibsinput:text property="E01DLICCY" name="deduct" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_CURRENCY %>" readonly="true" modified="F01DLICCY"/>              
                <eibsinput:text property="E01DLIGLN" name="deduct" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_GLEDGER %>" readonly="true" modified="F01DLIGLN"/>              
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
<% } %>
 <br>
 <div align="center">
   <input id="EIBSBTN" type=submit name="Submit" value="Enviar">
 </div>

</form>


<script type="text/javascript">
  MedioPago();   
  showFactorLabel(getElement("E01DLIFAC").value,true);

  function showFactorLabel(payvalue,firstTime){
  	if(payvalue === "P" || payvalue === "1"){
  		getElement("divFactorLabel").innerHTML= 'Monto Prima % :';
  		if(firstTime != true){ getElement("E01DLIDPM").value = "0.000000" ;}
  	}else{
  		getElement("divFactorLabel").innerHTML= 'Monto Fijo a Pagar :';
  	}
  }

  function setMonto(){
  	var payType = getElement("E01DLIFAC").value ;
  	if(payType === "F"){
  		getElement("E01DLIDPM").value = formatCCY(getElement("E01DLIDPM").value);	
  	}
  }  
  
  function MedioPago() {
	  getElement("nuevoPrestamo").style.display = 'none';
	  getElement("nuevaCuenta").style.display   = 'none';
	  getElement("nuevoPrestamo2").style.display = 'none';
	  getElement("nuevaCuenta2").style.display   = 'none';
	  
	  if(getElement("E01DLIMPG").value == ('A')){
	    getElement("nuevaCuenta").style.display = 'block';
	    getElement("nuevaCuenta2").style.display   = 'block';
	  }
	  if(getElement("E01DLIMPG").value == ('N')){
	    getElement("nuevoPrestamo").style.display = 'block';
	    getElement("nuevoPrestamo2").style.display = 'block';
	  } 
	}
  
</script>

 

</body>
</html>
