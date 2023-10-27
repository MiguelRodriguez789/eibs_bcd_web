<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>Tasas de Prestamos</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Studio">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/jquery/plugins/contextMenu/css/jquery.contextMenu.css" rel="stylesheet" type="text/css" />

<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />
<jsp:useBean id="lnParam" class="datapro.eibs.beans.EDL051002Message"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>


<SCRIPT type="text/javascript">
       
     builtNewMenu(prd_loan_opt);
     initMenu();
       
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
<h3 align="center">Tabla de Parametros de Prestamos<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="Loans_parameters_maint.jsp"> 
</h3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.params.JSEDL0510" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" ID="SCREEN" value="200">
  <INPUT TYPE=HIDDEN NAME="OPT" ID="OPT" value="<%= request.getParameter("OPT") %>">
  <INPUT TYPE=HIDDEN NAME="SELTYP" ID="SELTYP" value="<%= request.getParameter("SELTYP") %>">
 
 <% int rw = 0;%>
  
  <table class="tableinfo">
    <tr> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
           <tr id="<%= (rw % 2 == 1) ? "trdark" : "trclear" %><%rw++;%>"> 
           <td nowrap width="20%" align=right> 
              <b>Banco :</b>
            </td>
            <td nowrap > 
               
              <input type="text" name="E02SELBNK" size="4" maxlength="2" value="<%= lnParam.getE02DLSBNK()%>" readonly>
            </td>
            <td nowrap width="20%" align=right> 
              <b>Producto :</b>
            </td>
            <td nowrap > 
               <input type="text" name="E02SELPRD" size="5" maxlength="4" value="<%= lnParam.getE02DLSTYP()%>" readonly>
            </td>
          </tr>
          <tr id="<%= (rw % 2 == 1) ? "trdark" : "trclear" %><%rw++;%>"> 
            <td nowrap width="20%" align=right> 
              <b>Tabla :</b>
            </td>
            <td nowrap colspan=3>  
               <input type="text" name="E02SELTBL" size="4" maxlength="2" value="<%= lnParam.getE02DLSTLN()%>">
               <input type="text" name="E02DLSDSC" size="48" maxlength="45" value="<%= lnParam.getE02DLSDSC()%>">
            </td>
          </tr>
		  <%if(!lnParam.getE02DLSCUN().equals("0")){%>
          <tr id="<%= (rw % 2 == 1) ? "trdark" : "trclear" %><%rw++;%>"> 
            <td nowrap width="20%" align=right> 
              <b>Cliente :</b>
            </td>
            <td nowrap colspan=3>  
               <input type="text" name="E02SELCUN" size="10" maxlength="9" value="<%= lnParam.getE02DLSCUN()%>" readonly>
               <input type="text" name="E02DSCCUN" size="48" maxlength="45" value="<%= lnParam.getE02CUSNA1()%>" readonly>
            </td>
          </tr>
          <%}%>
        </table>
      </td>
    </tr>
  </table>
  
  <H4>Datos B&aacute;sicos</H4>
  <table  class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="<%= (rw % 2 == 1) ? "trdark" : "trclear" %><%rw++;%>"> 
            <td nowrap> 
            </td>
            <td nowrap> 
            </td>
            <td nowrap> 
            </td>
            <td nowrap colspan=4> 
            </td>
            <td nowrap colspan=2> 
              Factor	        
            </td>
          </tr>
          <tr id="<%= (rw % 2 == 1) ? "trdark" : "trclear" %><%rw++;%>"> 
            <td nowrap> 
              <div align="right">Periodo Base (360/65/66) :</div>
            </td>
            <td nowrap> 
              <input type="text" name="E02DLSDAB" size="4" maxlength="3" value="<%= lnParam.getE02DLSDAB()%>" onkeypress="enterInteger(event)">	        
            </td>
            <td nowrap> 
              <div align="right">Tasa Base o Puntos :</div>
            </td>
            <td nowrap colspan=4> 
              <input type="text" name="E02DLSRTF" size="10" maxlength="10"	value="<%= lnParam.getE02DLSRTF()%>" onkeypress="enterInteger(event)">	        
            </td>
            <td nowrap colspan=2> 
              <input type="text" name="E02DLSRFT" size="2" maxlength="1"	value="<%= lnParam.getE02DLSRFT()%>" onkeypress="enterInteger(event)">
              <a href="javascript:GetCode('E02DLSRFT','STATIC_ln_tables_factor.jsp')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="ayuda" align="bottom" border="0"></a>	
            </td>
          </tr>
          <tr id="<%= (rw % 2 == 1) ? "trdark" : "trclear" %><%rw++;%>"> 
            <td nowrap> 
              <div align="right">Tasa Minima Permitida :</div>
            </td>
            <td nowrap> 
 	          <input type="text" name="E02DLSMIN" size="10" maxlength="10"	value="<%= lnParam.getE02DLSMIN()%>">
 	        </td>
 	        <td nowrap> 
              <div align="right">Tasa Maxima Permitida :</div>
            </td>
            <td nowrap colspan=4> 
 	          <input type="text" name="E02DLSMAX" size="10" maxlength="10"	value="<%= lnParam.getE02DLSMAX()%>">
 	        </td>
 	        <td nowrap colspan=2> 
              <input type="text" name="E02DLSMMT" size="2" maxlength="1"	value="<%= lnParam.getE02DLSMMT()%>" onkeypress="enterInteger(event)">
              <a href="javascript:GetCode('E02DLSMMT','STATIC_ln_tables_max_rate.jsp')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="ayuda" align="bottom" border="0"></a>	
            </td>
          </tr>
          <tr id="<%= (rw % 2 == 1) ? "trdark" : "trclear" %><%rw++;%>"> 
            <td nowrap>
              <div align="right">Tipo de Interes :</div>
            </td>
            <td nowrap>
            	<input type="text" name="E02DLSICT" size="2" maxlength="1"	value="<%= lnParam.getE02DLSICT()%>">
              <a href="javascript:GetCode('E02DLSICT','STATIC_cd_formula.jsp')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="ayuda" align="bottom" border="0"></a> 
            </td>
            <td nowrap> 
              <div align="right">Cargo o Tasa x Mora :</div>
            </td>
            <td nowrap colspan=4> 
 	          <input type="text" name="E02DLSIR1" size="10" maxlength="10"	value="<%= lnParam.getE02DLSIR1()%>">
 	        </td>
            <td nowrap colspan=2>        
              <input type="text" name="E02DLSFL2" size="2" maxlength="1" value="<%= lnParam.getE02DLSFL2()%>">
              <a href="javascript:GetCode('E02DLSFL2','STATIC_ln_tables_penalty_rate.jsp')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="ayuda" align="bottom" border="0"></a> 
            </td>
          </tr>
          <tr id="<%= (rw % 2 == 1) ? "trdark" : "trclear" %><%rw++;%>"> 
            <td nowrap>
              <div align="right">Permite Pagos Parciales :</div>
            </td>
            <td nowrap>
              <input type="text" name="E02DLSPPR" size="2" maxlength="1"	value="<%= lnParam.getE02DLSPPR()%>">
              <a href="javascript:GetCode('E02DLSPPR','STATIC_ln_tables_partial_payment.jsp')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="ayuda" align="bottom" border="0"></a> 
            </td>
            <td nowrap> 
              <div align="right">Cargo Minimo de Mora :</div>
            </td>
            <td nowrap colspan=6> 
 	          <input type="text" name="E02DLSMPA" size="15" maxlength="15"	value="<%= lnParam.getE02DLSMPA()%>">
 	        </td>            
          </tr>
          <tr id="<%= (rw % 2 == 1) ? "trdark" : "trclear" %><%rw++;%>"> 
            <td nowrap>
              <div align="right">Cntrl. Adelanto Capital :</div>
            </td>
			<td nowrap>
  				<input type="radio" name="E02DLSFL1" value="Y" <%if(lnParam.getE02DLSFL1().equals("Y")) out.print("checked");%>>Si
  				<input type="radio" name="E02DLSFL1" value="N" <%if(lnParam.getE02DLSFL1().equals("N")) out.print("checked");%>>No
			</td>
			<td nowrap>
              <div align="right">Gracia Mora :</div>
            </td>
			<td nowrap colspan=6>
  				<input type="text" name="E02DLSGR1" size="3" maxlength="2" value="<%=lnParam.getE02DLSGR1()%>">
  			</td>
		  </tr>
          <tr id="<%= (rw % 2 == 1) ? "trdark" : "trclear" %><%rw++;%>"> 
            <td nowrap>
            </td>
			<td nowrap>
  			</td>
			<td nowrap>
              <div align="right">Retiro Giro Custodia. :</div>
            </td>
			<td nowrap colspan=6>
  				<input type="text" name="E02DLSCUP" size="3" maxlength="2" value="<%=lnParam.getE02DLSCUP()%>">
  			</td>
		  </tr>
          <tr id="<%= (rw % 2 == 1) ? "trdark" : "trclear" %><%rw++;%>"> 
			<td nowrap>
              <div align="right">Vencimiento Feriados :</div>
            </td>
			<td nowrap>
  				<input type="text" name="E02DLSFCO" size="2" maxlength="1" value="<%=lnParam.getE02DLSFCO()%>">
              <a href="javascript:GetCode('E02DLSFCO','STATIC_ln_tables_holidays.jsp')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="ayuda" align="bottom" border="0"></a></td>
  			<td nowrap>
              <div align="right">Dias de Paso a Vencido :</div>
            </td>
			<td nowrap colspan=6>
  				<input type="text" name="E02DLSPMD" size="4" maxlength="4" value="<%=lnParam.getE02DLSPMD()%>">
  			</td>
          </tr>
          <tr id="<%= (rw % 2 == 1) ? "trdark" : "trclear" %><%rw++;%>"> 
			<td nowrap>
              <div align="right">Forma Cambio Contable :</div>
            </td>
			<td nowrap>
  				<input type="text" name="E02DLSTCG" size="2" maxlength="1" value="<%=lnParam.getE02DLSTCG()%>">
              <a href="javascript:GetCode('E02DLSTCG','STATIC_ln_tables_accounting_changes.jsp')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="ayuda" align="bottom" border="0"></a></td>
  			<td nowrap>
              <div align="right">Paso Castigo sin Garant. :</div>
            </td>
			<td nowrap colspan=6>
  				<input type="text" name="E02DLSPC1" size="4" maxlength="4" value="<%=lnParam.getE02DLSPC1()%>">
  			</td>
          </tr>
          <tr id="<%= (rw % 2 == 1) ? "trdark" : "trclear" %><%rw++;%>"> 
			<td nowrap>
              <div align="right">Moneda Cobro Cargos :</div>
            </td>
			<td nowrap>
  				<input type="text" name="E02DLSCCR" size="4" maxlength="3" value="<%=lnParam.getE02DLSCCR()%>">
              <a href="javascript:GetCurrency('E02DLSCCR','')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="help" align="middle" border="0" ></a> 
            </td>
  			<td nowrap>
              <div align="right">Paso Castigo con Garant. :</div>
            </td>
			<td nowrap colspan=6>
  				<input type="text" name="E02DLSPC2" size="4" maxlength="4" value="<%=lnParam.getE02DLSPC2()%>">
  			</td>
          </tr>
          <tr id="<%= (rw % 2 == 1) ? "trdark" : "trclear" %><%rw++;%>"> 
			<td nowrap> 
              <div align="right">Fecha Validez :</div>
              
            </td>
			<td nowrap> 
              	<input type="text" name="E02DLSMAM" size="3" maxlength="2" value="<%=lnParam.getE02DLSMAM()%>">
  				<input type="text" name="E02DLSMAD" size="3" maxlength="2" value="<%=lnParam.getE02DLSMAD()%>">
  				<input type="text" name="E02DLSMAY" size="5" maxlength="4" value="<%=lnParam.getE02DLSMAY()%>">
            </td>
  			<td nowrap>
              <div align="right"> Prioridad  en Pagos :</div>
            </td>
            <td nowrap>
  				<input type="text" name="E02DLSPP1" size="2" maxlength="1" value="<%=lnParam.getE02DLSPP1()%>" onkeypress="enterInteger(event)">
  			</td>
  			<td nowrap>
  				<input type="text" name="E02DLSPP2" size="2" maxlength="1" value="<%=lnParam.getE02DLSPP2()%>" onkeypress="enterInteger(event)">
  			</td>
  			<td nowrap>
  				<input type="text" name="E02DLSPP3" size="2" maxlength="1" value="<%=lnParam.getE02DLSPP3()%>" onkeypress="enterInteger(event)">
  			</td>
 			 <%if(currUser.getE01INT().equals("07")){%> 
 			<td nowrap>
  				<input type="text" name="E02DLSPP7" size="2" maxlength="1" value="<%=lnParam.getE02DLSPP7()%>" onkeypress="enterInteger(event)">
  			</td>
 			  <% } %>
  			<td nowrap>
  				<input type="text" name="E02DLSPP4" size="2" maxlength="1" value="<%=lnParam.getE02DLSPP4()%>" onkeypress="enterInteger(event)">
  			</td>
  			<td nowrap>
  				<input type="text" name="E02DLSPP5" size="2" maxlength="1" value="<%=lnParam.getE02DLSPP5()%>" onkeypress="enterInteger(event)">
  			</td>
  			<td nowrap>
  				<input type="text" name="E02DLSPP6" size="2" maxlength="1" value="<%=lnParam.getE02DLSPP6()%>" onkeypress="enterInteger(event)">
  			</td>	   
          </tr>
          <tr id="<%= (rw % 2 == 1) ? "trdark" : "trclear" %><%rw++;%>"> 
			<td nowrap>
            </td>
			<td nowrap>
  			</td>
  			<td nowrap>
            </td>
            <td nowrap>
  				<div align="center">P</div>
  			</td>
  			<td nowrap>
  				<div align="center">I</div>
  			</td>
  			<td nowrap>
  				<div align="center">M</div>
  			</td>
 			 <%if(currUser.getE01INT().equals("07")){%> 
	  			<td nowrap>
	  				<div align="center">F</div>
	  			</td>
 			  <% } %>
  			<td nowrap>
  				<div align="center">T</div>
  			</td>
  			<td nowrap>
  				<div align="center">C</div>
  			</td>
  			<td nowrap>
  				<div align="center">D</div>
  			</td>		
          </tr>
          <tr id="<%= (rw % 2 == 1) ? "trdark" : "trclear" %><%rw++;%>"> 
			<td nowrap colspan=9>
			   <table cellspacing="0" cellpadding="2" width="100%" border="0">
		          <tr id="trdark">
		            <td nowrap> 
		            	<div align="right">Dias Cambio Contable :</div>
		            </td>
		            <td nowrap> 
		                (1)<input type="text" name="E02DLSPL1" size="4" maxlength="4" value="<%=lnParam.getE02DLSPL1()%>">
		            </td>
		            <td nowrap> 
		            	(2)<input type="text" name="E02DLSPL2" size="4" maxlength="4" value="<%=lnParam.getE02DLSPL2()%>">
		            </td>
		            <td nowrap> 
		            	(3)<input type="text" name="E02DLSPL3" size="4" maxlength="4" value="<%=lnParam.getE02DLSPL3()%>">
		            </td>
		            <td nowrap> 
		              	(4)<input type="text" name="E02DLSPL4" size="4" maxlength="4" value="<%=lnParam.getE02DLSPL4()%>">
		            </td>
		            <td nowrap> 
		              	(5)<input type="text" name="E02DLSPL5" size="4" maxlength="4" value="<%=lnParam.getE02DLSPL5()%>">
		            </td>
		          </tr>
		          <tr id="trdark">
		            <td nowrap> 
		            	<div align="right">% Capital Vencido :</div>
		            </td>
		            <td nowrap> 
		                <input type="text" name="E02DLSPR1" size="10" maxlength="10" value="<%=lnParam.getE02DLSPR1()%>">
		            </td>
		            <td nowrap> 
		            	<input type="text" name="E02DLSPR2" size="10" maxlength="10" value="<%=lnParam.getE02DLSPR2()%>">
		            </td>
		            <td nowrap> 
		            	<input type="text" name="E02DLSPR3" size="10" maxlength="10" value="<%=lnParam.getE02DLSPR3()%>">
		            </td>
		            <td nowrap> 
		              	<input type="text" name="E02DLSPR4" size="10" maxlength="10" value="<%=lnParam.getE02DLSPR4()%>">
		            </td>
		            <td nowrap> 
		              	<input type="text" name="E02DLSPR5" size="10" maxlength="10" value="<%=lnParam.getE02DLSPR5()%>">
		            </td>
		          </tr>
			   </table>
            </td>			
          </tr>
         </table>
       </td>
    </tr>
  </table>
  <H4>Comisiones o Impuestos</H4>
  <table  class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="<%= (rw % 2 == 1) ? "trdark" : "trclear" %><%rw++;%>"> 
            <th nowrap >Descripcion</th>
            <th nowrap >Fac</th>
            <th nowrap >Monto</th>
            <th nowrap >Fre</th>
            <th nowrap >Minimo</th>
            <th nowrap >Maximo</th>
            <th nowrap >Mda</th>
            <th nowrap >Cta/Contable</th>
            <th nowrap >Iva</th>
          </tr>
          <%
  				   int amount = 9;
 				   String name; 				   
  					for ( int i=1; i<=amount; i++ ) {
   					 name = i + "";
   			%> 
          <tr id="<%= (rw % 2 == 1) ? "trdark" : "trclear" %><%rw++;%>"> 
            <td nowrap > 
              <div align="center" > 
                <input type="text" name="E02DLSDE<%= name %>" value="<%= lnParam.getField("E02DLSDE"+name).getString() %>" size="30" maxlength="30">
              </div>
            </td>
            <td nowrap > 
              <div align="left"> 
                <input type="text" name="E02DLSFA<%= name %>" size="2" maxlength="1" 
                 class="context-menu-help"
   				 onmousedown="init(documentsFeeCharges,this.name,'','','','','')"
				 value="<%= lnParam.getField("E02DLSFA"+name).getString()%>">
              </div>
            </td>
            <td nowrap > 
              <div align="left"> 
                <input type="text" name="E02DLSAM<%= name %>" size="15" maxlength="15" value="<%= lnParam.getField("E02DLSAM"+name).getString()%>">
              </div>
            </td>
            <td nowrap> 
              <div align="center"> 
                <input type="text" name="E02DLSAP<%= name %>" size="2" maxlength="1" 
                 class="context-menu-help"
			    onmousedown="init(documentsFrecCharges,this.name,'','','','','')" 
				value="<%= lnParam.getField("E02DLSAP"+name).getString()%>">
              </div>
            </td>
            <td nowrap > 
              <div align="center"> 
                <input type="text" name="E02DLSMN<%= name %>" size="15" maxlength="15" value="<%= lnParam.getField("E02DLSMN"+name).getString()%>">
              </div>
            </td>
            <td nowrap > 
              <div align="center"> 
                <input type="text" name="E02DLSMX<%= name %>" size="15" maxlength="15"  value="<%= lnParam.getField("E02DLSMX"+name).getString()%>">
              </div>
            </td>
            <td nowrap> 
              <div align="center"> 
                <input type="text" name="E02DLSGB<%= name %>" size="3" maxlength="3" 
                 class="context-menu-help"
			     onmousedown="init(paramByCurrency,this.name,'','','','','')"
				value="<%= lnParam.getField("E02DLSGB"+name).getString()%>" >
              </div>
            </td>
            <td nowrap> 
              <div align="center"> 
                <input type="text" name="E02DLSGL<%= name %>" size="18" maxlength="17"  
                 class="context-menu-help"
  			    onmousedown="init(ledgerHelp,this.name,'','','','','')"
				value="<%= lnParam.getField("E02DLSGL"+name).getString()%>" >
              </div>
            </td>
            
            <td nowrap> 
              <div align="center"> 
                <input type="text" name="E02DLSWH<%= name %>" size="2" maxlength="1"  value="<%= lnParam.getField("E02DLSWH"+name).getString()%>">
              </div>
            </td>
          </tr>
          <%
    		}
    		%> 
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
