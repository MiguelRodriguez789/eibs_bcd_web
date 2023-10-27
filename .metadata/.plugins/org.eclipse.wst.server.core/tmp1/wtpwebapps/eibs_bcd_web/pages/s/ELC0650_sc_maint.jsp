<%@page isELIgnored="false" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>Tablas de Cargos de Garantias Navieras</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Studio">
<link href="<%=request.getContextPath()%>/jquery/plugins/contextMenu/css/jquery.contextMenu.css" rel="stylesheet" type="text/css" />
<%-- CSS/JS --%>
<jsp:include page="include/header.jsp"></jsp:include>
<jsp:useBean id="lnParam" class="datapro.eibs.beans.ELC065002Message"  scope="session" /> 
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "userPO" class="datapro.eibs.beans.UserPos"  scope="session" />

<script src="<%=request.getContextPath()%>/pages/s/javascripts/jquery.jsp"> </script>

<SCRIPT type="text/javascript">


function checkValues() {
	return true;
}

function showFixPerField(fixAmountField, rateAmountField){
  var elem=event.srcElement;
  if (elem.value == 'F' || elem.value == 'S' || elem.value == 'A'){
    document.getElementById(fixAmountField).style.display="";
    document.getElementById(rateAmountField).style.display="none";
  }
  else{
    if (elem.value == '%'){
      document.getElementById(fixAmountField).style.display="none";
      document.getElementById(rateAmountField).style.display="";
    }
  }
  elem.focus();  
}

</SCRIPT>

<% 
 if ( !error.getERRNUM().equals("0")  ) {
     error.setERRNUM("0");
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
 }
 
	String ctrlReadonly = "";
	String ctrlDisabled = "";
	boolean isReadonly = false;

	if (userPO.getPurpose().equals("INQUIRY"))	{
		ctrlReadonly = "readonly";
		ctrlDisabled = "disabled";
		isReadonly = true;
	}
%>

</head>
<body>
<h3 align="center">Comisiones de Cartas de Cr&eacute;dito por Rangos de Monto<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="sc_maint.jsp, ELC0650">
</h3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSELC0650" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" value="200">
  <INPUT TYPE=HIDDEN NAME="OPT" value="<%= request.getParameter("OPT") %>">
  
  <table class="tableinfo">
    <tr> 
      <td nowrap> 
        <table cellspacing="0" width="100%" border="0" class="tbhead">
          <tr id="trdark"> 
            <td nowrap align=right> 
              <b>Banco :</b>
            </td>
            <td nowrap > 
              <input type="text" name="E02LCABNK" size="3" maxlength="2" value="<%= lnParam.getE02LCABNK()%>" readonly>
            </td>
            <td nowrap align=right> 
              <b>Tipo Prod./Tabla :</b>
            </td>
            <td nowrap > 
               <input type="text" name="E02LCAATY" size="6" maxlength="4" value="<%= lnParam.getE02LCAATY()%>" readonly>
               <input type="text" name="E02LCATAR" size="4" maxlength="3" value="<%= lnParam.getE02LCATAR()%>" readonly>
            </td>
            <td nowrap align=right> 
              <b>Moneda de Cargo :</b>
            </td>
            <td nowrap > 
               <input type="text" name="E02LCATCY" size="4" maxlength="3" value="<%= lnParam.getE02LCATCY()%>" readonly>
            </td>            
          </tr>
          <tr id="trdark"> 
            <td nowrap align=right> 
              <b>Cliente :</b>
            </td>
            <td nowrap > 
               <input type="text" name="E02LCACUN" size="10" maxlength="9" value="<%= lnParam.getE02LCACUN()%>" readonly>
            </td>
            <td nowrap align=right> 
              <b>Nombre :</b>
            </td>
            <td nowrap>  
               <input type="text" name="E02LCADSC" size="35" maxlength="35" value="<%= lnParam.getE02LCADSC()%>" readonly>
            </td>
			<td nowrap align=right>
			<b>Moneda Contable :</b></td>
			<td>
			<input type="text" name="E02LCAACY" size="4" maxlength="3"
					value="<%= lnParam.getE02LCAACY()%>" readonly>
			</td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <h3>Comisi&oacute;n de Apertura</h3>
  <table  class="tableinfo">
    <tr > 
      <td nowrap>
       
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="trdark"> 
            <th nowrap >Rango<br>Inicial</th>
            <th nowrap >Rango<br>Final</th>
            <th nowrap >Tipo<br>Cargo</th>
            <th nowrap >Monto<br>Cargo</th>
            <th nowrap >Periodo</th>
            <th nowrap >Monto<br>Máximo</th>
            <th nowrap >Monto<br>Mínimo</th>
            <th nowrap >ITMBS</th>
            <th nowrap >Cuenta Contable</th>
            <th nowrap >Descripción</th>
          </tr>
          <tr id="trclear"> 
            <td nowrap > 
              <div align="right"> 
 				<input type="text" name="E02ISSRI1" value="<%= lnParam.getE02ISSRI1() %>" size="14" maxlength="13" onkeypress="enterDecimal(event)" <%=ctrlReadonly %>>              
 			  </div>
            </td>

            <td nowrap > 
              <div align="right"> 
 				<input type="text" name="E02ISSRF1" value="<%= lnParam.getE02ISSRF1() %>" size="14" maxlength="13" onkeypress="enterDecimal(event)" <%=ctrlReadonly %>>              
 			  </div>
            </td>
          
            <td nowrap > 
              <div align="center"> 
	              <select name="E02ISSFT1" onchange="showFixPerField('E02ISSFA1','E02ISSRT1');"  <%=ctrlDisabled %>>
	                <option value=" " <% if (!(lnParam.getE02ISSFT1().equals("F") ||lnParam.getE02ISSFT1().equals("%"))) out.print("selected"); %>></option>
	                <option value="F" <% if (lnParam.getE02ISSFT1().equals("F")) out.print("selected"); %>>Monto Fijo</option>
	                <option value="%" <% if (lnParam.getE02ISSFT1().equals("%")) out.print("selected"); %>>Porcentaje</option>        
	              </select>                
              </div>
            </td>
            <td nowrap > 
              <div align="left" id="E2ISSFA1" > 
              	<input type="text" name="E02ISSFA1" value="<%= lnParam.getE02ISSFA1() %>" size="15" maxlength="9" onkeypress="enterDecimal(event)" <%=ctrlReadonly %>>              
              </div>
              <div align="left" id="E02ISSRT1"> 
              	<input type="text" name="E02ISSRT1" value="<%= lnParam.getE02ISSRT1() %>" size="15" maxlength="10" onkeypress="enterDecimal(6)" <%=ctrlReadonly %>>              
              </div>
            </td>
            <td nowrap > 
              <div align="right"> 
 				<input type="text" name="E02ISSPE1" value="<%= lnParam.getE02ISSPE1() %>" size="7" maxlength="3" onkeypress="enterInteger(event)" <%=ctrlReadonly %>>              
 			  </div>
            </td>

            <td nowrap > 
              <div align="right"> 
 				<input type="text" name="E02ISSFX1" value="<%= lnParam.getE02ISSFX1() %>" size="13" maxlength="13" onkeypress="enterDecimal(event)" <%=ctrlReadonly %>>              
 			  </div>
            </td>
            <td nowrap > 
              <div align="right"> 
 				<input type="text" name="E02ISSFM1" value="<%= lnParam.getE02ISSFM1() %>" size="13" maxlength="13" onkeypress="enterDecimal(event)" <%=ctrlReadonly %>>              
 			  </div>
            </td>
            <td nowrap > 
              <div align="center"> 
	              <select name="E02ISSIV1" <%=ctrlDisabled %>>
	                <option value=" " <% if (!(lnParam.getE02ISSIV1().equals("Y") ||lnParam.getE02ISSIV1().equals("N"))) out.print("selected"); %>></option>
	                <option value="Y" <% if (lnParam.getE02ISSIV1().equals("Y")) out.print("selected"); %>>Si</option>
	                <option value="N" <% if (lnParam.getE02ISSIV1().equals("N")) out.print("selected"); %>>No</option>        
	              </select>                
              </div>
            </td>
            <td nowrap> 
              <div align="center"> 
                <input type="text" name="E02ISSGL1" size="18" maxlength="17" value="<%= lnParam.getE02ISSGL1()%>" class="context-menu-help" onmousedown="init(ledgerHelp,this.name,'','','','','')" <%=ctrlReadonly %>>
              </div>
            </td>
            <td nowrap> 
              <div align="center"> 
                <input type="text" name="D02GL1ISS" size="35" maxlength="35" value="<%= lnParam.getD02GL1ISS()%>" <%=ctrlReadonly %>>
              </div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap > 
              <div align="right"> 
 				<input type="text" name="E02ISSRI2" value="<%= lnParam.getE02ISSRI2() %>" size="14" maxlength="13" onkeypress="enterDecimal(event)" <%=ctrlReadonly %>>              
 			  </div>
            </td>

            <td nowrap > 
              <div align="right"> 
 				<input type="text" name="E02ISSRF2" value="<%= lnParam.getE02ISSRF2() %>" size="14" maxlength="13" onkeypress="enterDecimal(event)" <%=ctrlReadonly %>>              
 			  </div>
            </td>

          
            <td nowrap > 
              <div align="center"> 
	              <select name="E02ISSFT2" onchange="showFixPerField('E02ISSFA2','E02ISSRT2');"  <%=ctrlDisabled %>>
	                <option value=" " <% if (!(lnParam.getE02ISSFT2().equals("F") ||lnParam.getE02ISSFT2().equals("%"))) out.print("selected"); %>></option>
	                <option value="F" <% if (lnParam.getE02ISSFT2().equals("F")) out.print("selected"); %>>Monto Fijo</option>
	                <option value="%" <% if (lnParam.getE02ISSFT2().equals("%")) out.print("selected"); %>>Porcentaje</option>  
	              </select>                
              </div>
            </td>
            <td nowrap > 
              <div align="left" id="E02ISSFA2"> 
              	<input type="text" name="E02ISSFA2" value="<%= lnParam.getE02ISSFA2() %>" size="15" maxlength="9" onkeypress="enterDecimal(event)" <%=ctrlReadonly %>>              
              </div>
              <div align="left" id="E02ISSRT2"> 
              	<input type="text" name="E02ISSRT2" value="<%= lnParam.getE02ISSRT2() %>" size="15" maxlength="10" onkeypress="enterDecimal(6)" <%=ctrlReadonly %>>              
              </div>
            </td>
            <td nowrap > 
              <div align="right"> 
 				<input type="text" name="E02ISSPE2" value="<%= lnParam.getE02ISSPE2() %>" size="7" maxlength="3" onkeypress="enterInteger(event)" <%=ctrlReadonly %>>              
 			  </div>
            </td>


            <td nowrap > 
              <div align="right"> 
 				<input type="text" name="E02ISSFX2" value="<%= lnParam.getE02ISSFX2() %>" size="13" maxlength="13" onkeypress="enterDecimal(event)" <%=ctrlReadonly %>>              
 			  </div>
            </td>
            <td nowrap > 
              <div align="right"> 
 				<input type="text" name="E02ISSFM2" value="<%= lnParam.getE02ISSFM2() %>" size="13" maxlength="13" onkeypress="enterDecimal(event)" <%=ctrlReadonly %>>              
 			  </div>
            </td>
            <td nowrap > 
              <div align="center"> 
	              <select name="E02ISSIV2" <%=ctrlDisabled %>>
	                <option value=" " <% if (!(lnParam.getE02ISSIV2().equals("Y") ||lnParam.getE02ISSIV2().equals("N"))) out.print("selected"); %>></option>
	                <option value="Y" <% if (lnParam.getE02ISSIV2().equals("Y")) out.print("selected"); %>>Si</option>
	                <option value="N" <% if (lnParam.getE02ISSIV2().equals("N")) out.print("selected"); %>>No</option>        
	              </select>                
              </div>
            </td>
            <td nowrap> 
              <div align="center"> 
                <input type="text" name="E02ISSGL2" size="18" maxlength="17" value="<%= lnParam.getE02ISSGL2()%>" class="context-menu-help" onmousedown="init(ledgerHelp,this.name,'','','','','')" <%=ctrlReadonly %>>
              </div>
            </td>
            <td nowrap> 
              <div align="center"> 
                <input type="text" name="D02GL2ISS" size="35" maxlength="35" value="<%= lnParam.getD02GL2ISS()%>" <%=ctrlReadonly %>>
              </div>
            </td>
          </tr>
          <tr id="trclear"> 
             <td nowrap > 
              <div align="right"> 
 				<input type="text" name="E02ISSRI3" value="<%= lnParam.getE02ISSRI3() %>" size="14" maxlength="13" onkeypress="enterDecimal(event)" <%=ctrlReadonly %>>              
 			  </div>
            </td>

            <td nowrap > 
              <div align="right"> 
 				<input type="text" name="E02ISSRF3" value="<%= lnParam.getE02ISSRF3() %>" size="14" maxlength="13" onkeypress="enterDecimal(event)" <%=ctrlReadonly %>>              
 			  </div>
            </td>
          
            <td nowrap > 
              <div align="center"> 
	              <select name="E02ISSFT3" onchange="showFixPerField('E02ISSFA3','E02ISSRT3');" <%=ctrlDisabled %>>
	                <option value=" " <% if (!(lnParam.getE02ISSFT3().equals("F") ||lnParam.getE02ISSFT3().equals("%"))) out.print("selected"); %>></option>
	                <option value="F" <% if (lnParam.getE02ISSFT3().equals("F")) out.print("selected"); %>>Monto Fijo</option>
	                <option value="%" <% if (lnParam.getE02ISSFT3().equals("%")) out.print("selected"); %>>Porcentaje</option>  
	              </select>                
              </div>
            </td>
            <td nowrap > 
              <div align="left" id="E02ISSFA3"> 
              	<input type="text" name="E02ISSFA3" value="<%= lnParam.getE02ISSFA3() %>" size="15" maxlength="9" onkeypress="enterDecimal(event)" <%=ctrlReadonly %>>              
              </div>
              <div align="left" id="E02ISSRT3"> 
              	<input type="text" name="E02ISSRT3" value="<%= lnParam.getE02ISSRT3() %>" size="15" maxlength="10" onkeypress="enterDecimal(6)" <%=ctrlReadonly %>>              
              </div>
            </td>
            
            <td nowrap > 
              <div align="right"> 
 				<input type="text" name="E02ISSPE3" value="<%= lnParam.getE02ISSPE3() %>" size="7" maxlength="3" onkeypress="enterInteger(event)" <%=ctrlReadonly %>>              
 			  </div>
            </td>
            
            
            <td nowrap > 
              <div align="right"> 
 				<input type="text" name="E02ISSFX3" value="<%= lnParam.getE02ISSFX3() %>" size="13" maxlength="13" onkeypress="enterDecimal(event)" <%=ctrlReadonly %>>              
 			  </div>
            </td>
            <td nowrap > 
              <div align="right"> 
 				<input type="text" name="E02ISSFM3" value="<%= lnParam.getE02ISSFM3() %>" size="13" maxlength="13" onkeypress="enterDecimal(event)" <%=ctrlReadonly %>>              
 			  </div>
            </td>
            <td nowrap > 
              <div align="center"> 
	              <select name="E02ISSIV3" <%=ctrlDisabled %>>
	                <option value=" " <% if (!(lnParam.getE02ISSIV3().equals("Y") ||lnParam.getE02ISSIV3().equals("N"))) out.print("selected"); %>></option>
	                <option value="Y" <% if (lnParam.getE02ISSIV3().equals("Y")) out.print("selected"); %>>Si</option>
	                <option value="N" <% if (lnParam.getE02ISSIV3().equals("N")) out.print("selected"); %>>No</option>        
	              </select>                
              </div>
            </td>
            <td nowrap> 
              <div align="center"> 
                <input type="text" name="E02ISSGL3" size="18" maxlength="17" value="<%= lnParam.getE02ISSGL3()%>" class="context-menu-help" onmousedown="init(ledgerHelp,this.name,'','','','','')" <%=ctrlReadonly %>>
              </div>
            </td>
            <td nowrap> 
              <div align="center"> 
                <input type="text" name="D02GL3ISS" size="35" maxlength="35" value="<%= lnParam.getD02GL3ISS()%>" <%=ctrlReadonly %>>
              </div>
            </td>
          </tr>
          <tr id="trclear"> 
             <td nowrap > 
              <div align="right"> 
 				<input type="text" name="E02ISSRI4" value="<%= lnParam.getE02ISSRI4() %>" size="14" maxlength="13" onkeypress="enterDecimal(event)" <%=ctrlReadonly %>>              
 			  </div>
            </td>

            <td nowrap > 
              <div align="right"> 
 				<input type="text" name="E02ISSRF4" value="<%= lnParam.getE02ISSRF4() %>" size="14" maxlength="13" onkeypress="enterDecimal(event)" <%=ctrlReadonly %>>              
 			  </div>
            </td>
          
            <td nowrap > 
              <div align="center"> 
	              <select name="E02ISSFT4" onchange="showFixPerField('E02ISSFA4','E02ISSRT4');" <%=ctrlDisabled %>>
	                <option value=" " <% if (!(lnParam.getE02ISSFT4().equals("F") ||lnParam.getE02ISSFT4().equals("%"))) out.print("selected"); %>></option>
	                <option value="F" <% if (lnParam.getE02ISSFT4().equals("F")) out.print("selected"); %>>Monto Fijo</option>
	                <option value="%" <% if (lnParam.getE02ISSFT4().equals("%")) out.print("selected"); %>>Porcentaje</option>   
	              </select>                
              </div>
            </td>
            <td nowrap > 
              <div align="left" id="E02ISSFA4"> 
              	<input type="text" name="E02ISSFA4" value="<%= lnParam.getE02ISSFA4() %>" size="15" maxlength="9" onkeypress="enterDecimal(event)" <%=ctrlReadonly %>>              
              </div>
              <div align="left" id="E02ISSRT4"> 
              	<input type="text" name="E02ISSRT4" value="<%= lnParam.getE02ISSRT4() %>" size="15" maxlength="10" onkeypress="enterDecimal(6)" <%=ctrlReadonly %>>              
              </div>
            </td>
            
            <td nowrap > 
              <div align="right"> 
 				<input type="text" name="E02ISSPE4" value="<%= lnParam.getE02ISSPE4() %>" size="7" maxlength="3" onkeypress="enterInteger(event)" <%=ctrlReadonly %>>              
 			  </div>
            </td>
            
            
            <td nowrap > 
              <div align="right"> 
 				<input type="text" name="E02ISSFX4" value="<%= lnParam.getE02ISSFX4() %>" size="13" maxlength="13" onkeypress="enterDecimal(event)" <%=ctrlReadonly %>>              
 			  </div>
            </td>
            <td nowrap > 
              <div align="right"> 
 				<input type="text" name="E02ISSFM4" value="<%= lnParam.getE02ISSFM4() %>" size="13" maxlength="13" onkeypress="enterDecimal(event)" <%=ctrlReadonly %>>              
 			  </div>
            </td>
            <td nowrap > 
              <div align="center"> 
	              <select name="E02ISSIV4" <%=ctrlDisabled %>>
	                <option value=" " <% if (!(lnParam.getE02ISSIV4().equals("Y") ||lnParam.getE02ISSIV4().equals("N"))) out.print("selected"); %>></option>
	                <option value="Y" <% if (lnParam.getE02ISSIV4().equals("Y")) out.print("selected"); %>>Si</option>
	                <option value="N" <% if (lnParam.getE02ISSIV4().equals("N")) out.print("selected"); %>>No</option>        
	              </select>                
              </div>
            </td>
            <td nowrap> 
              <div align="center"> 
                <input type="text" name="E02ISSGL4" size="18" maxlength="17" value="<%= lnParam.getE02ISSGL4()%>" class="context-menu-help" onmousedown="init(ledgerHelp,this.name,'','','','','')" <%=ctrlReadonly %>>
              </div>
            </td>
            <td nowrap> 
              <div align="center"> 
                <input type="text" name="D02GL4ISS" size="35" maxlength="35" value="<%= lnParam.getD02GL4ISS()%>" <%=ctrlReadonly %>>
              </div>
            </td>
          </tr>
          <tr id="trclear"> 
              <td nowrap > 
              <div align="right"> 
 				<input type="text" name="E02ISSRI5" value="<%= lnParam.getE02ISSRI5() %>" size="14" maxlength="13" onkeypress="enterDecimal(event)" <%=ctrlReadonly %>>              
 			  </div>
            </td>

            <td nowrap > 
              <div align="right"> 
 				<input type="text" name="E02ISSRF5" value="<%= lnParam.getE02ISSRF5() %>" size="14" maxlength="13" onkeypress="enterDecimal(event)" <%=ctrlReadonly %>>              
 			  </div>
            </td>
          
            <td nowrap > 
              <div align="center"> 
	              <select name="E02ISSFT5" onchange="showFixPerField('E02ISSFA5','E02ISSRT5');" <%=ctrlDisabled %>>
	                <option value=" " <% if (!(lnParam.getE02ISSFT5().equals("F") ||lnParam.getE02ISSFT5().equals("%"))) out.print("selected"); %>></option>
	                <option value="F" <% if (lnParam.getE02ISSFT5().equals("F")) out.print("selected"); %>>Monto Fijo</option>
	                <option value="%" <% if (lnParam.getE02ISSFT5().equals("%")) out.print("selected"); %>>Porcentaje</option>   
	              </select>                
              </div>
            </td>
            <td nowrap > 
              <div align="left" id="E02ISSFA5"> 
              	<input type="text" name="E02ISSFA5" value="<%= lnParam.getE02ISSFA5() %>" size="15" maxlength="9" onkeypress="enterDecimal(event)" <%=ctrlReadonly %>>              
              </div>
              <div align="left" id="E02ISSRT5"> 
              	<input type="text" name="E02ISSRT5" value="<%= lnParam.getE02ISSRT5() %>" size="15" maxlength="10" onkeypress="enterDecimal(6)" <%=ctrlReadonly %>>              
              </div>
            </td>
            
            <td nowrap > 
              <div align="right"> 
 				<input type="text" name="E02ISSPE5" value="<%= lnParam.getE02ISSPE5() %>" size="7" maxlength="3" onkeypress="enterInteger(event)" <%=ctrlReadonly %>>              
 			  </div>
            </td>
            
            
            
            <td nowrap > 
              <div align="right"> 
 				<input type="text" name="E02ISSFX5" value="<%= lnParam.getE02ISSFX5() %>" size="13" maxlength="13" onkeypress="enterDecimal(event)" <%=ctrlReadonly %>>              
 			  </div>
            </td>
            <td nowrap > 
              <div align="right"> 
 				<input type="text" name="E02ISSFM5" value="<%= lnParam.getE02ISSFM5() %>" size="13" maxlength="13" onkeypress="enterDecimal(event)" <%=ctrlReadonly %>>              
 			  </div>
            </td>
            <td nowrap > 
              <div align="center"> 
	              <select name="E02ISSIV5" <%=ctrlDisabled %>>
	                <option value=" " <% if (!(lnParam.getE02ISSIV5().equals("Y") ||lnParam.getE02ISSIV5().equals("N"))) out.print("selected"); %>></option>
	                <option value="Y" <% if (lnParam.getE02ISSIV5().equals("Y")) out.print("selected"); %>>Si</option>
	                <option value="N" <% if (lnParam.getE02ISSIV5().equals("N")) out.print("selected"); %>>No</option>        
	              </select>                
              </div>
            </td>
            <td nowrap> 
              <div align="center"> 
                <input type="text" name="E02ISSGL5" size="18" maxlength="17" value="<%= lnParam.getE02ISSGL5()%>" class="context-menu-help" onmousedown="init(ledgerHelp,this.name,'','','','','')" <%=ctrlReadonly %>>
              </div>
            </td>
            <td nowrap> 
              <div align="center"> 
                <input type="text" name="D02GL5ISS" size="35" maxlength="35" value="<%= lnParam.getD02GL5ISS()%>" <%=ctrlReadonly %>>
              </div>
            </td>
          </tr>
          <tr id="trclear"> 
             <td nowrap > 
              <div align="right"> 
 				<input type="text" name="E02ISSRI6" value="<%= lnParam.getE02ISSRI6() %>" size="14" maxlength="13" onkeypress="enterDecimal(event)" <%=ctrlReadonly %>>              
 			  </div>
            </td>

            <td nowrap > 
              <div align="right"> 
 				<input type="text" name="E02ISSRF6" value="<%= lnParam.getE02ISSRF6() %>" size="14" maxlength="13" onkeypress="enterDecimal(event)" <%=ctrlReadonly %>>              
 			  </div>
            </td>
          
            <td nowrap > 
              <div align="center"> 
	              <select name="E02ISSFT6" onchange="showFixPerField('E02ISSFA6','E02ISSRT6');" <%=ctrlDisabled %>>
	                <option value=" " <% if (!(lnParam.getE02ISSFT6().equals("F") ||lnParam.getE02ISSFT6().equals("%"))) out.print("selected"); %>></option>
	                <option value="F" <% if (lnParam.getE02ISSFT6().equals("F")) out.print("selected"); %>>Monto Fijo</option>
	                <option value="%" <% if (lnParam.getE02ISSFT6().equals("%")) out.print("selected"); %>>Porcentaje</option>  
	              </select>                
              </div>
            </td>
            <td nowrap > 
              <div align="left" id="E02ISSFA6" > 
              	<input type="text" name="E02ISSFA6" value="<%= lnParam.getE02ISSFA6() %>" size="15" maxlength="9" onkeypress="enterDecimal(event)" <%=ctrlReadonly %>>              
              </div>
              <div align="left" id="E02ISSRT6"> 
              	<input type="text" name="E02ISSRT6" value="<%= lnParam.getE02ISSRT6() %>" size="15" maxlength="10" onkeypress="enterDecimal(6)" <%=ctrlReadonly %>>              
              </div>
            </td>
            
            <td nowrap > 
              <div align="right"> 
 				<input type="text" name="E02ISSPE6" value="<%= lnParam.getE02ISSPE6() %>" size="7" maxlength="3" onkeypress="enterInteger(event)" <%=ctrlReadonly %>>              
 			  </div>
            </td>
            
            
            <td nowrap > 
              <div align="right"> 
 				<input type="text" name="E02ISSFX6" value="<%= lnParam.getE02ISSFX6() %>" size="13" maxlength="13" onkeypress="enterDecimal(event)" <%=ctrlReadonly %>>              
 			  </div>
            </td>
            <td nowrap > 
              <div align="right"> 
 				<input type="text" name="E02ISSFM6" value="<%= lnParam.getE02ISSFM6() %>" size="13" maxlength="13" onkeypress="enterDecimal(event)" <%=ctrlReadonly %>>              
 			  </div>
            </td>
            <td nowrap > 
              <div align="center"> 
	              <select name="E02ISSIV6" <%=ctrlDisabled %>>
	                <option value=" " <% if (!(lnParam.getE02ISSIV6().equals("Y") ||lnParam.getE02ISSIV6().equals("N"))) out.print("selected"); %>></option>
	                <option value="Y" <% if (lnParam.getE02ISSIV6().equals("Y")) out.print("selected"); %>>Si</option>
	                <option value="N" <% if (lnParam.getE02ISSIV6().equals("N")) out.print("selected"); %>>No</option>        
	              </select>                
              </div>
            </td>
            <td nowrap> 
              <div align="center"> 
                <input type="text" name="E02ISSGL6" size="18" maxlength="17" value="<%= lnParam.getE02ISSGL6()%>" class="context-menu-help" onmousedown="init(ledgerHelp,this.name,'','','','','')" <%=ctrlReadonly %>>
              </div>
            </td>
            <td nowrap> 
              <div align="center"> 
                <input type="text" name="D02GL6ISS" size="35" maxlength="35" value="<%= lnParam.getD02GL6ISS()%>"  <%=ctrlReadonly %>>
              </div>
            </td>
          </tr>
          
          <tr id="trclear"> 
            
            <td nowrap > 
              <div align="right"> 
 				<input type="text" name="E02ISSRI7" value="<%= lnParam.getE02ISSRI7() %>" size="14" maxlength="13" onkeypress="enterDecimal(event)" <%=ctrlReadonly %>>              
 			  </div>
            </td>

            <td nowrap > 
              <div align="right"> 
 				<input type="text" name="E02ISSRF7" value="<%= lnParam.getE02ISSRF7() %>" size="14" maxlength="13" onkeypress="enterDecimal(event)" <%=ctrlReadonly %>>              
 			  </div>
            </td>
            
          
            <td nowrap > 
              <div align="center"> 
	              <select name="E02ISSFT7" onchange="showFixPerField('E02ISSFA7','E02ISSRT7');" <%=ctrlDisabled %>>
	                <option value=" " <% if (!(lnParam.getE02ISSFT7().equals("F") ||lnParam.getE02ISSFT7().equals("%"))) out.print("selected"); %>></option>
	                <option value="F" <% if (lnParam.getE02ISSFT7().equals("F")) out.print("selected"); %>>Monto Fijo</option>
	                <option value="%" <% if (lnParam.getE02ISSFT7().equals("%")) out.print("selected"); %>>Porcentaje</option>
	              </select>                
              </div>
            </td>
            <td nowrap > 
              <div align="left" id="E02ISSFA7"> 
              	<input type="text" name="E02ISSFA7" value="<%= lnParam.getE02ISSFA7() %>" size="15" maxlength="9" onkeypress="enterDecimal(event)" <%=ctrlReadonly %>>              
              </div>
              <div align="left" id="E02ISSRT7"> 
              	<input type="text" name="E02ISSRT7" value="<%= lnParam.getE02ISSRT7() %>" size="15" maxlength="10" onkeypress="enterDecimal(6)" <%=ctrlReadonly %>>              
              </div>
            </td>
            <td nowrap > 
              <div align="right"> 
 				<input type="text" name="E02ISSPE7" value="<%= lnParam.getE02ISSPE7() %>" size="7" maxlength="3" onkeypress="enterInteger(event)" <%=ctrlReadonly %>>              
 			  </div>
            </td>
            
            <td nowrap > 
              <div align="right"> 
 				<input type="text" name="E02ISSFX7" value="<%= lnParam.getE02ISSFX7() %>" size="13" maxlength="13" onkeypress="enterDecimal(event)" <%=ctrlReadonly %>>              
 			  </div>
            </td>
            <td nowrap > 
              <div align="right"> 
 				<input type="text" name="E02ISSFM7" value="<%= lnParam.getE02ISSFM7() %>" size="13" maxlength="13" onkeypress="enterDecimal(event)" <%=ctrlReadonly %>>              
 			  </div>
            </td>
            <td nowrap > 
              <div align="center"> 
	              <select name="E02ISSIV7" <%=ctrlDisabled %>>
	                <option value=" " <% if (!(lnParam.getE02ISSIV7().equals("Y") ||lnParam.getE02ISSIV7().equals("N"))) out.print("selected"); %>></option>
	                <option value="Y" <% if (lnParam.getE02ISSIV7().equals("Y")) out.print("selected"); %>>Si</option>
	                <option value="N" <% if (lnParam.getE02ISSIV7().equals("N")) out.print("selected"); %>>No</option>        
	              </select>                
              </div>
            </td>
            <td nowrap> 
              <div align="center"> 
                <input type="text" name="E02ISSGL7" size="18" maxlength="17" value="<%= lnParam.getE02ISSGL7()%>" class="context-menu-help" onmousedown="init(ledgerHelp,this.name,'','','','','')" <%=ctrlReadonly %>>
              </div>
            </td>
            <td nowrap> 
              <div align="center"> 
                <input type="text" name="D02GL7ISS" size="35" maxlength="35" value="<%= lnParam.getD02GL7ISS	()%>"  <%=ctrlReadonly %>>
              </div>
            </td>
          </tr>
          
            
         <tr id="trclear"> 
            <td nowrap colspan="7"> Cargo Fijo (7 enteros y 2 decimales), Porcentaje (3 enteros y 6 decimales) 
            </td>
          </tr>
     </table>
  
</td>
</tr>
</table>

<h3>Comisi&oacute;n de Confirmaci&oacute;n</h3>
<table  class="tableinfo">
    <tr > 
      <td nowrap>
       
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="trdark"> 
            <th nowrap >Rango<br>Inicial</th>
            <th nowrap >Rango<br>Final</th>
            <th nowrap >Tipo<br>Cargo</th>
            <th nowrap >Monto<br>Cargo</th>
            <th nowrap >Periodo</th>
            <th nowrap >Monto<br>Máximo</th>
            <th nowrap >Monto<br>Mínimo</th>
            <th nowrap >ITMBS</th>
            <th nowrap >Cuenta Contable</th>
            <th nowrap >Descripción</th>
          </tr>
          <tr id="trclear"> 
            <td nowrap > 
              <div align="right"> 
 				<input type="text" name="E02CNFRI1" value="<%= lnParam.getE02CNFRI1() %>" size="14" maxlength="13" onkeypress="enterDecimal(event)" <%=ctrlReadonly %>>              
 			  </div>
            </td>

            <td nowrap > 
              <div align="right"> 
 				<input type="text" name="E02CNFRF1" value="<%= lnParam.getE02CNFRF1() %>" size="14" maxlength="13" onkeypress="enterDecimal(event)" <%=ctrlReadonly %>>              
 			  </div>
            </td>
          
            <td nowrap > 
              <div align="center"> 
	              <select name="E02CNFFT1" onchange="showFixPerField('E02CNFFA1','E02CNFRT1');" <%=ctrlDisabled %>>
	                <option value=" " <% if (!(lnParam.getE02CNFFT1().equals("F") ||lnParam.getE02CNFFT1().equals("%"))) out.print("selected"); %>></option>
	                <option value="F" <% if (lnParam.getE02CNFFT1().equals("F")) out.print("selected"); %>>Monto Fijo</option>
	                <option value="%" <% if (lnParam.getE02CNFFT1().equals("%")) out.print("selected"); %>>Porcentaje</option>        
	              </select>                
              </div>
            </td>
            <td nowrap > 
              <div align="left" id="E02CNFFA1" > 
              	<input type="text" name="E02CNFFA1" value="<%= lnParam.getE02CNFFA1() %>" size="15" maxlength="9" onkeypress="enterDecimal(event)" <%=ctrlReadonly %>>              
              </div>
              <div align="left" id="E02CNFRT1"> 
              	<input type="text" name="E02CNFRT1" value="<%= lnParam.getE02CNFRT1() %>" size="15" maxlength="10" onkeypress="enterDecimal(6)" <%=ctrlReadonly %>>              
              </div>
            </td>
            <td nowrap > 
              <div align="right"> 
 				<input type="text" name="E02CNFPE1" value="<%= lnParam.getE02CNFPE1() %>" size="7" maxlength="3" onkeypress="enterInteger(event)" <%=ctrlReadonly %>>              
 			  </div>
            </td>

            <td nowrap > 
              <div align="right"> 
 				<input type="text" name="E02CNFFX1" value="<%= lnParam.getE02CNFFX1() %>" size="13" maxlength="13" onkeypress="enterDecimal(event)" <%=ctrlReadonly %>>              
 			  </div>
            </td>
            <td nowrap > 
              <div align="right"> 
 				<input type="text" name="E02CNFFM1" value="<%= lnParam.getE02CNFFM1() %>" size="13" maxlength="13" onkeypress="enterDecimal(event)" <%=ctrlReadonly %>>              
 			  </div>
            </td>
            <td nowrap > 
              <div align="center"> 
	              <select name="E02CNFIV1" <%=ctrlDisabled %>>
	                <option value=" " <% if (!(lnParam.getE02CNFIV1().equals("Y") ||lnParam.getE02CNFIV1().equals("N"))) out.print("selected"); %>></option>
	                <option value="Y" <% if (lnParam.getE02CNFIV1().equals("Y")) out.print("selected"); %>>Si</option>
	                <option value="N" <% if (lnParam.getE02CNFIV1().equals("N")) out.print("selected"); %>>No</option>        
	              </select>                
              </div>
            </td>
            <td nowrap> 
              <div align="center"> 
                <input type="text" name="E02CNFGL1" size="18" maxlength="17" value="<%= lnParam.getE02CNFGL1()%>" class="context-menu-help" onmousedown="init(ledgerHelp,this.name,'','','','','')" <%=ctrlReadonly %>>
              </div>
            </td>
            <td nowrap> 
              <div align="center"> 
                <input type="text" name="D02GL1CNF" size="35" maxlength="35" value="<%= lnParam.getD02GL1CNF()%>" <%=ctrlReadonly %>>
              </div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap > 
              <div align="right"> 
 				<input type="text" name="E02CNFRI2" value="<%= lnParam.getE02CNFRI2() %>" size="14" maxlength="13" onkeypress="enterDecimal(event)" <%=ctrlReadonly %>>              
 			  </div>
            </td>

            <td nowrap > 
              <div align="right"> 
 				<input type="text" name="E02CNFRF2" value="<%= lnParam.getE02CNFRF2() %>" size="14" maxlength="13" onkeypress="enterDecimal(event)" <%=ctrlReadonly %>>              
 			  </div>
            </td>

          
            <td nowrap > 
              <div align="center"> 
	              <select name="E02CNFFT2" onchange="showFixPerField('E02CNFFA2','E02CNFRT2');"  <%=ctrlDisabled %>>
	                <option value=" " <% if (!(lnParam.getE02CNFFT2().equals("F") ||lnParam.getE02CNFFT2().equals("%"))) out.print("selected"); %>></option>
	                <option value="F" <% if (lnParam.getE02CNFFT2().equals("F")) out.print("selected"); %>>Monto Fijo</option>
	                <option value="%" <% if (lnParam.getE02CNFFT2().equals("%")) out.print("selected"); %>>Porcentaje</option>  
	              </select>                
              </div>
            </td>
            <td nowrap > 
              <div align="left" id="E02CNFFA2"> 
              	<input type="text" name="E02CNFFA2" value="<%= lnParam.getE02CNFFA2() %>" size="15" maxlength="9" onkeypress="enterDecimal(event)" <%=ctrlReadonly %>>              
              </div>
              <div align="left" id="E02CNFRT2"> 
              	<input type="text" name="E02CNFRT2" value="<%= lnParam.getE02CNFRT2() %>" size="15" maxlength="10" onkeypress="enterDecimal(6)" <%=ctrlReadonly %>>              
              </div>
            </td>
            <td nowrap > 
              <div align="right"> 
 				<input type="text" name="E02CNFPE2" value="<%= lnParam.getE02CNFPE2() %>" size="7" maxlength="3" onkeypress="enterInteger(event)" <%=ctrlReadonly %>>              
 			  </div>
            </td>


            <td nowrap > 
              <div align="right"> 
 				<input type="text" name="E02CNFFX2" value="<%= lnParam.getE02CNFFX2() %>" size="13" maxlength="13" onkeypress="enterDecimal(event)" <%=ctrlReadonly %>>              
 			  </div>
            </td>
            <td nowrap > 
              <div align="right"> 
 				<input type="text" name="E02CNFFM2" value="<%= lnParam.getE02CNFFM2() %>" size="13" maxlength="13" onkeypress="enterDecimal(event)" <%=ctrlReadonly %>>              
 			  </div>
            </td>
            <td nowrap > 
              <div align="center"> 
	              <select name="E02CNFIV2" <%=ctrlDisabled %>>
	                <option value=" " <% if (!(lnParam.getE02CNFIV2().equals("Y") ||lnParam.getE02CNFIV2().equals("N"))) out.print("selected"); %>></option>
	                <option value="Y" <% if (lnParam.getE02CNFIV2().equals("Y")) out.print("selected"); %>>Si</option>
	                <option value="N" <% if (lnParam.getE02CNFIV2().equals("N")) out.print("selected"); %>>No</option>        
	              </select>                
              </div>
            </td>
            <td nowrap> 
              <div align="center"> 
                <input type="text" name="E02CNFGL2" size="18" maxlength="17" value="<%= lnParam.getE02CNFGL2()%>" class="context-menu-help" onmousedown="init(ledgerHelp,this.name,'','','','','')" <%=ctrlReadonly %>>
              </div>
            </td>
            <td nowrap> 
              <div align="center"> 
                <input type="text" name="D02GL2CNF" size="35" maxlength="35" value="<%= lnParam.getD02GL2CNF()%>" <%=ctrlReadonly %>>
              </div>
            </td>
          </tr>
          <tr id="trclear"> 
             <td nowrap > 
              <div align="right"> 
 				<input type="text" name="E02CNFRI3" value="<%= lnParam.getE02CNFRI3() %>" size="14" maxlength="13" onkeypress="enterDecimal(event)" <%=ctrlReadonly %>>              
 			  </div>
            </td>

            <td nowrap > 
              <div align="right"> 
 				<input type="text" name="E02CNFRF3" value="<%= lnParam.getE02CNFRF3() %>" size="14" maxlength="13" onkeypress="enterDecimal(event)" <%=ctrlReadonly %>>              
 			  </div>
            </td>
          
            <td nowrap > 
              <div align="center"> 
	              <select name="E02CNFFT3" onchange="showFixPerField('E02CNFFA3','E02CNFRT3');" <%=ctrlDisabled %>>
	                <option value=" " <% if (!(lnParam.getE02CNFFT3().equals("F") ||lnParam.getE02CNFFT3().equals("%"))) out.print("selected"); %>></option>
	                <option value="F" <% if (lnParam.getE02CNFFT3().equals("F")) out.print("selected"); %>>Monto Fijo</option>
	                <option value="%" <% if (lnParam.getE02CNFFT3().equals("%")) out.print("selected"); %>>Porcentaje</option>  
	              </select>                
              </div>
            </td>
            <td nowrap > 
              <div align="left" id="E02CNFFA3"> 
              	<input type="text" name="E02CNFFA3" value="<%= lnParam.getE02CNFFA3() %>" size="15" maxlength="9" onkeypress="enterDecimal(event)" <%=ctrlReadonly %>>              
              </div>
              <div align="left" id="E02CNFRT3"> 
              	<input type="text" name="E02CNFRT3" value="<%= lnParam.getE02CNFRT3() %>" size="15" maxlength="10" onkeypress="enterDecimal(6)" <%=ctrlReadonly %>>              
              </div>
            </td>
            
            <td nowrap > 
              <div align="right"> 
 				<input type="text" name="E02CNFPE3" value="<%= lnParam.getE02CNFPE3() %>" size="7" maxlength="3" onkeypress="enterInteger(event)" <%=ctrlReadonly %>>              
 			  </div>
            </td>
            
            
            <td nowrap > 
              <div align="right"> 
 				<input type="text" name="E02CNFFX3" value="<%= lnParam.getE02CNFFX3() %>" size="13" maxlength="13" onkeypress="enterDecimal(event)" <%=ctrlReadonly %>>              
 			  </div>
            </td>
            <td nowrap > 
              <div align="right"> 
 				<input type="text" name="E02CNFFM3" value="<%= lnParam.getE02CNFFM3() %>" size="13" maxlength="13" onkeypress="enterInteger(event)" <%=ctrlReadonly %>>              
 			  </div>
            </td>
            <td nowrap > 
              <div align="center"> 
	              <select name="E02CNFIV3" <%=ctrlDisabled %>>
	                <option value=" " <% if (!(lnParam.getE02CNFIV3().equals("Y") ||lnParam.getE02CNFIV3().equals("N"))) out.print("selected"); %>></option>
	                <option value="Y" <% if (lnParam.getE02CNFIV3().equals("Y")) out.print("selected"); %>>Si</option>
	                <option value="N" <% if (lnParam.getE02CNFIV3().equals("N")) out.print("selected"); %>>No</option>        
	              </select>                
              </div>
            </td>
            <td nowrap> 
              <div align="center"> 
                <input type="text" name="E02CNFGL3" size="18" maxlength="17" value="<%= lnParam.getE02CNFGL3()%>" class="context-menu-help" onmousedown="init(ledgerHelp,this.name,'','','','','')" <%=ctrlReadonly %>>
              </div>
            </td>
            <td nowrap> 
              <div align="center"> 
                <input type="text" name="D02GL3CNF" size="35" maxlength="35" value="<%= lnParam.getD02GL3CNF()%>" <%=ctrlReadonly %>>
              </div>
            </td>
          </tr>
          <tr id="trclear"> 
             <td nowrap > 
              <div align="right"> 
 				<input type="text" name="E02CNFRI4" value="<%= lnParam.getE02CNFRI4() %>" size="14" maxlength="13" onkeypress="enterDecimal(event)" <%=ctrlReadonly %>>              
 			  </div>
            </td>

            <td nowrap > 
              <div align="right"> 
 				<input type="text" name="E02CNFRF4" value="<%= lnParam.getE02CNFRF4() %>" size="14" maxlength="13" onkeypress="enterDecimal(event)" <%=ctrlReadonly %>>              
 			  </div>
            </td>
          
            <td nowrap > 
              <div align="center"> 
	              <select name="E02CNFFT4" onchange="showFixPerField('E02CNFFA4','E02CNFRT4');" <%=ctrlDisabled %>>
	                <option value=" " <% if (!(lnParam.getE02CNFFT4().equals("F") ||lnParam.getE02CNFFT4().equals("%"))) out.print("selected"); %>></option>
	                <option value="F" <% if (lnParam.getE02CNFFT4().equals("F")) out.print("selected"); %>>Monto Fijo</option>
	                <option value="%" <% if (lnParam.getE02CNFFT4().equals("%")) out.print("selected"); %>>Porcentaje</option>   
	              </select>                
              </div>
            </td>
            <td nowrap > 
              <div align="left" id="E02CNFFA4"> 
              	<input type="text" name="E02CNFFA4" value="<%= lnParam.getE02CNFFA4() %>" size="15" maxlength="9" onkeypress="enterDecimal(event)" <%=ctrlReadonly %>>              
              </div>
              <div align="left" id="E02CNFRT4"> 
              	<input type="text" name="E02CNFRT4" value="<%= lnParam.getE02CNFRT4() %>" size="15" maxlength="10" onkeypress="enterDecimal(6)" <%=ctrlReadonly %>>              
              </div>
            </td>
            
                        <td nowrap > 
              <div align="right"> 
 				<input type="text" name="E02CNFPE4" value="<%= lnParam.getE02CNFPE4() %>" size="7" maxlength="3" onkeypress="enterInteger(event)" <%=ctrlReadonly %>>              
 			  </div>
            </td>
            
            
            <td nowrap > 
              <div align="right"> 
 				<input type="text" name="E02CNFFX4" value="<%= lnParam.getE02CNFFX4() %>" size="13" maxlength="13" onkeypress="enterDecimal(event)" <%=ctrlReadonly %>>              
 			  </div>
            </td>
            <td nowrap > 
              <div align="right"> 
 				<input type="text" name="E02CNFFM4" value="<%= lnParam.getE02CNFFM4() %>" size="13" maxlength="13" onkeypress="enterInteger(event)" <%=ctrlReadonly %>>              
 			  </div>
            </td>
            <td nowrap > 
              <div align="center"> 
	              <select name="E02CNFIV4" <%=ctrlDisabled %>>
	                <option value=" " <% if (!(lnParam.getE02CNFIV4().equals("Y") ||lnParam.getE02CNFIV4().equals("N"))) out.print("selected"); %>></option>
	                <option value="Y" <% if (lnParam.getE02CNFIV4().equals("Y")) out.print("selected"); %>>Si</option>
	                <option value="N" <% if (lnParam.getE02CNFIV4().equals("N")) out.print("selected"); %>>No</option>        
	              </select>                
              </div>
            </td>
            <td nowrap> 
              <div align="center"> 
                <input type="text" name="E02CNFGL4" size="18" maxlength="17" value="<%= lnParam.getE02CNFGL4()%>" class="context-menu-help" onmousedown="init(ledgerHelp,this.name,'','','','','')" <%=ctrlReadonly %>>
              </div>
            </td>
            <td nowrap> 
              <div align="center"> 
                <input type="text" name="D02GL4CNF" size="35" maxlength="35" value="<%= lnParam.getD02GL4CNF()%>" <%=ctrlReadonly %>>
              </div>
            </td>
          </tr>
          <tr id="trclear"> 
              <td nowrap > 
              <div align="right"> 
 				<input type="text" name="E02CNFRI5" value="<%= lnParam.getE02CNFRI5() %>" size="14" maxlength="13" onkeypress="enterDecimal(event)" <%=ctrlReadonly %>>              
 			  </div>
            </td>

            <td nowrap > 
              <div align="right"> 
 				<input type="text" name="E02CNFRF5" value="<%= lnParam.getE02CNFRF5() %>" size="14" maxlength="13" onkeypress="enterDecimal(event)" <%=ctrlReadonly %>>              
 			  </div>
            </td>
          
            <td nowrap > 
              <div align="center"> 
	              <select name="E02CNFFT5" onchange="showFixPerField('E02CNFFA5','E02CNFRT5');" <%=ctrlDisabled %>>
	                <option value=" " <% if (!(lnParam.getE02CNFFT5().equals("F") ||lnParam.getE02CNFFT5().equals("%"))) out.print("selected"); %>></option>
	                <option value="F" <% if (lnParam.getE02CNFFT5().equals("F")) out.print("selected"); %>>Monto Fijo</option>
	                <option value="%" <% if (lnParam.getE02CNFFT5().equals("%")) out.print("selected"); %>>Porcentaje</option>   
	              </select>                
              </div>
            </td>
            <td nowrap > 
              <div align="left" id="E02CNFFA5"> 
              	<input type="text" name="E02CNFFA5" value="<%= lnParam.getE02CNFFA5() %>" size="15" maxlength="9" onkeypress="enterDecimal(event)" <%=ctrlReadonly %>>              
              </div>
              <div align="left" id="E02CNFRT5"> 
              	<input type="text" name="E02CNFRT5" value="<%= lnParam.getE02CNFRT5() %>" size="15" maxlength="10" onkeypress="enterDecimal(6)" <%=ctrlReadonly %>>              
              </div>
            </td>
            
            <td nowrap > 
              <div align="right"> 
 				<input type="text" name="E02CNFPE5" value="<%= lnParam.getE02CNFPE5() %>" size="7" maxlength="3" onkeypress="enterInteger(event)" <%=ctrlReadonly %>>              
 			  </div>
            </td>
            
            
            
            <td nowrap > 
              <div align="right"> 
 				<input type="text" name="E02CNFFX5" value="<%= lnParam.getE02CNFFX5() %>" size="13" maxlength="13" onkeypress="enterDecimal(event)" <%=ctrlReadonly %>>              
 			  </div>
            </td>
            <td nowrap > 
              <div align="right"> 
 				<input type="text" name="E02CNFFM5" value="<%= lnParam.getE02CNFFM5() %>" size="13" maxlength="13" onkeypress="enterDecimal(event)" <%=ctrlReadonly %>>              
 			  </div>
            </td>
            <td nowrap > 
              <div align="center"> 
	              <select name="E02CNFIV5" <%=ctrlDisabled %>>
	                <option value=" " <% if (!(lnParam.getE02CNFIV5().equals("Y") ||lnParam.getE02CNFIV5().equals("N"))) out.print("selected"); %>></option>
	                <option value="Y" <% if (lnParam.getE02CNFIV5().equals("Y")) out.print("selected"); %>>Si</option>
	                <option value="N" <% if (lnParam.getE02CNFIV5().equals("N")) out.print("selected"); %>>No</option>        
	              </select>                
              </div>
            </td>
            <td nowrap> 
              <div align="center"> 
                <input type="text" name="E02CNFGL5" size="18" maxlength="17" value="<%= lnParam.getE02CNFGL5()%>" class="context-menu-help" onmousedown="init(ledgerHelp,this.name,'','','','','')" <%=ctrlReadonly %>>
              </div>
            </td>
            <td nowrap> 
              <div align="center"> 
                <input type="text" name="D02GL5CNF" size="35" maxlength="35" value="<%= lnParam.getD02GL5CNF()%>"  <%=ctrlReadonly %>>
              </div>
            </td>
          </tr>
          <tr id="trclear"> 
             <td nowrap > 
              <div align="right"> 
 				<input type="text" name="E02CNFRI6" value="<%= lnParam.getE02CNFRI6() %>" size="14" maxlength="13" onkeypress="enterDecimal(event)" <%=ctrlReadonly %>>              
 			  </div>
            </td>

            <td nowrap > 
              <div align="right"> 
 				<input type="text" name="E02CNFRF6" value="<%= lnParam.getE02CNFRF6() %>" size="14" maxlength="13" onkeypress="enterDecimal(event)" <%=ctrlReadonly %>>              
 			  </div>
            </td>
          
            <td nowrap > 
              <div align="center"> 
	              <select name="E02CNFFT6" onchange="showFixPerField('E02CNFFA6','E02CNFRT6');" <%=ctrlDisabled %>>
	                <option value=" " <% if (!(lnParam.getE02CNFFT6().equals("F") ||lnParam.getE02CNFFT6().equals("%"))) out.print("selected"); %>></option>
	                <option value="F" <% if (lnParam.getE02CNFFT6().equals("F")) out.print("selected"); %>>Monto Fijo</option>
	                <option value="%" <% if (lnParam.getE02CNFFT6().equals("%")) out.print("selected"); %>>Porcentaje</option>  
	              </select>                
              </div>
            </td>
            <td nowrap > 
              <div align="left" id="E02CNFFA6" > 
              	<input type="text" name="E02CNFFA6" value="<%= lnParam.getE02CNFFA6() %>" size="15" maxlength="9" onkeypress="enterDecimal(event)" <%=ctrlReadonly %>>              
              </div>
              <div align="left" id="E02CNFRT6"> 
              	<input type="text" name="E02CNFRT6" value="<%= lnParam.getE02CNFRT6() %>" size="15" maxlength="10" onkeypress="enterDecimal(6)" <%=ctrlReadonly %>>              
              </div>
            </td>
            
            <td nowrap > 
              <div align="right"> 
 				<input type="text" name="E02CNFPE6" value="<%= lnParam.getE02CNFPE6() %>" size="7" maxlength="3" onkeypress="enterInteger(event)" <%=ctrlReadonly %>>              
 			  </div>
            </td>
            
            
            <td nowrap > 
              <div align="right"> 
 				<input type="text" name="E02CNFFX6" value="<%= lnParam.getE02CNFFX6() %>" size="13" maxlength="13" onkeypress="enterDecimal(event)" <%=ctrlReadonly %>>              
 			  </div>
            </td>
            <td nowrap > 
              <div align="right"> 
 				<input type="text" name="E02CNFFM6" value="<%= lnParam.getE02CNFFM6() %>" size="13" maxlength="13" onkeypress="enterDecimal(event)" <%=ctrlReadonly %>>              
 			  </div>
            </td>
            <td nowrap > 
              <div align="center"> 
	              <select name="E02CNFIV6" <%=ctrlDisabled %>>
	                <option value=" " <% if (!(lnParam.getE02CNFIV6().equals("Y") ||lnParam.getE02CNFIV6().equals("N"))) out.print("selected"); %>></option>
	                <option value="Y" <% if (lnParam.getE02CNFIV6().equals("Y")) out.print("selected"); %>>Si</option>
	                <option value="N" <% if (lnParam.getE02CNFIV6().equals("N")) out.print("selected"); %>>No</option>        
	              </select>                
              </div>
            </td>
            <td nowrap> 
              <div align="center"> 
                <input type="text" name="E02CNFGL6" size="18" maxlength="17" value="<%= lnParam.getE02CNFGL6()%>" class="context-menu-help" onmousedown="init(ledgerHelp,this.name,'','','','','')" <%=ctrlReadonly %>>
              </div>
            </td>
            <td nowrap> 
              <div align="center"> 
                <input type="text" name="D02GL6CNF" size="35" maxlength="35" value="<%= lnParam.getD02GL6CNF()%>" <%=ctrlReadonly %>>
              </div>
            </td>
          </tr>
          
          <tr id="trclear"> 
            
            <td nowrap > 
              <div align="right"> 
 				<input type="text" name="E02CNFRI7" value="<%= lnParam.getE02CNFRI7() %>" size="14" maxlength="13" onkeypress="enterDecimal(event)" <%=ctrlReadonly %>>              
 			  </div>
            </td>

            <td nowrap > 
              <div align="right"> 
 				<input type="text" name="E02CNFRF7" value="<%= lnParam.getE02CNFRF7() %>" size="14" maxlength="13" onkeypress="enterDecimal(event)" <%=ctrlReadonly %>>              
 			  </div>
            </td>
            
          
            <td nowrap > 
              <div align="center"> 
	              <select name="E02CNFFT7" onchange="showFixPerField('E02CNFFA7','E02CNFRT7');" <%=ctrlDisabled%>>
	                <option value=" " <% if (!(lnParam.getE02CNFFT7().equals("F") ||lnParam.getE02CNFFT7().equals("%"))) out.print("selected"); %>></option>
	                <option value="F" <% if (lnParam.getE02CNFFT7().equals("F")) out.print("selected"); %>>Monto Fijo</option>
	                <option value="%" <% if (lnParam.getE02CNFFT7().equals("%")) out.print("selected"); %>>Porcentaje</option>
	              </select>                
              </div>
            </td>
            <td nowrap > 
              <div align="left" id="E02CNFFA7"> 
              	<input type="text" name="E02CNFFA7" value="<%= lnParam.getE02CNFFA7() %>" size="15" maxlength="9" onkeypress="enterDecimal(event)" <%=ctrlReadonly %>>              
              </div>
              <div align="left" id="E02CNFRT7"> 
              	<input type="text" name="E02CNFRT7" value="<%= lnParam.getE02CNFRT7() %>" size="15" maxlength="10" onkeypress="enterDecimal(6)" <%=ctrlReadonly %>>              
              </div>
            </td>
            <td nowrap > 
              <div align="right"> 
 				<input type="text" name="E02CNFPE7" value="<%= lnParam.getE02CNFPE7() %>" size="7" maxlength="3" onkeypress="enterInteger(event)" <%=ctrlReadonly %>>              
 			  </div>
            </td>
            
            <td nowrap > 
              <div align="right"> 
 				<input type="text" name="E02CNFFX7" value="<%= lnParam.getE02CNFFX7() %>" size="13" maxlength="13" onkeypress="enterDecimal(event)" <%=ctrlReadonly %>>              
 			  </div>
            </td>
            <td nowrap > 
              <div align="right"> 
 				<input type="text" name="E02CNFFM7" value="<%= lnParam.getE02CNFFM7() %>" size="13" maxlength="13" onkeypress="enterDecimal(event)" <%=ctrlReadonly %>>              
 			  </div>
            </td>
            <td nowrap > 
              <div align="center"> 
	              <select name="E02CNFIV7" <%=ctrlDisabled %>>
	                <option value=" " <% if (!(lnParam.getE02CNFIV7().equals("Y") ||lnParam.getE02CNFIV7().equals("N"))) out.print("selected"); %>></option>
	                <option value="Y" <% if (lnParam.getE02CNFIV7().equals("Y")) out.print("selected"); %>>Si</option>
	                <option value="N" <% if (lnParam.getE02CNFIV7().equals("N")) out.print("selected"); %>>No</option>        
	              </select>                
              </div>
            </td>
            <td nowrap> 
              <div align="center"> 
                <input type="text" name="E02CNFGL7" size="18" maxlength="17" value="<%= lnParam.getE02CNFGL7()%>" class="context-menu-help" onmousedown="init(ledgerHelp,this.name,'','','','','')" <%=ctrlReadonly %>>
              </div>
            </td>
            <td nowrap> 
              <div align="center"> 
                <input type="text" name="D02GL7CNF" size="35" maxlength="35" value="<%= lnParam.getD02GL7CNF	()%>"  <%=ctrlReadonly %>>
              </div>
            </td>
          </tr>
          
            
         <tr id="trclear"> 
            <td nowrap colspan="7"> Cargo Fijo (7 enteros y 2 decimales), Porcentaje (3 enteros y 6 decimales) 
            </td>
          </tr>
     </table>
</td>
</tr>
</table>
<h3>Extensi&oacute;n de Validez</h3>
<table  class="tableinfo">
    <tr > 
      <td nowrap>
       
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="trdark"> 
            <th nowrap >Rango<br>Inicial</th>
            <th nowrap >Rango<br>Final</th>
            <th nowrap >Tipo<br>Cargo</th>
            <th nowrap >Monto<br>Cargo</th>
            <th nowrap >Periodo</th>
            <th nowrap >Monto<br>Máximo</th>
            <th nowrap >Monto<br>Mínimo</th>
            <th nowrap >ITMBS</th>
            <th nowrap >Cuenta Contable</th>
            <th nowrap >Descripción</th>
          </tr>
          <tr id="trclear"> 
            <td nowrap > 
              <div align="right"> 
 				<input type="text" name="E02EOVRI1" value="<%= lnParam.getE02EOVRI1() %>" size="14" maxlength="13" onkeypress="enterDecimal(event)"<%=ctrlReadonly %>>              
 			  </div>
            </td>

            <td nowrap > 
              <div align="right"> 
 				<input type="text" name="E02EOVRF1" value="<%= lnParam.getE02EOVRF1() %>" size="14" maxlength="13" onkeypress="enterDecimal(event)"<%=ctrlReadonly %>>              
 			  </div>
            </td>
          
            <td nowrap > 
              <div align="center"> 
	              <select name="E02EOVFT1" onchange="showFixPerField('E02EOVFA1','E02EOVRT1');"<%=ctrlDisabled %>>
	                <option value=" " <% if (!(lnParam.getE02EOVFT1().equals("F") ||lnParam.getE02EOVFT1().equals("%"))) out.print("selected"); %>></option>
	                <option value="F" <% if (lnParam.getE02EOVFT1().equals("F")) out.print("selected"); %>>Monto Fijo</option>
	                <option value="%" <% if (lnParam.getE02EOVFT1().equals("%")) out.print("selected"); %>>Porcentaje</option>        
	              </select>                
              </div>
            </td>
            <td nowrap > 
              <div align="left" id="E2EOVFA1" > 
              	<input type="text" name="E02EOVFA1" value="<%= lnParam.getE02EOVFA1() %>" size="15" maxlength="9" onkeypress="enterDecimal(event)"<%=ctrlReadonly %>>              
              </div>
              <div align="left" id="E02EOVRT1"> 
              	<input type="text" name="E02EOVRT1" value="<%= lnParam.getE02EOVRT1() %>" size="15" maxlength="10" onkeypress="enterDecimal(6)"<%=ctrlReadonly %>>              
              </div>
            </td>
            <td nowrap > 
              <div align="right"> 
 				<input type="text" name="E02EOVPE1" value="<%= lnParam.getE02EOVPE1() %>" size="7" maxlength="3" onkeypress="enterInteger(event)"<%=ctrlReadonly %>>              
 			  </div>
            </td>

            <td nowrap > 
              <div align="right"> 
 				<input type="text" name="E02EOVFX1" value="<%= lnParam.getE02EOVFX1() %>" size="13" maxlength="13" onkeypress="enterDecimal(event)"<%=ctrlReadonly %>>              
 			  </div>
            </td>
            <td nowrap > 
              <div align="right"> 
 				<input type="text" name="E02EOVFM1" value="<%= lnParam.getE02EOVFM1() %>" size="13" maxlength="13" onkeypress="enterDecimal(event)"<%=ctrlReadonly %>>              
 			  </div>
            </td>
            <td nowrap > 
              <div align="center"> 
	              <select name="E02EOVIV1" <%=ctrlDisabled %>>
	                <option value=" " <% if (!(lnParam.getE02EOVIV1().equals("Y") ||lnParam.getE02EOVIV1().equals("N"))) out.print("selected"); %>></option>
	                <option value="Y" <% if (lnParam.getE02EOVIV1().equals("Y")) out.print("selected"); %>>Si</option>
	                <option value="N" <% if (lnParam.getE02EOVIV1().equals("N")) out.print("selected"); %>>No</option>        
	              </select>                
              </div>
            </td>
            <td nowrap> 
              <div align="center"> 
                <input type="text" name="E02EOVGL1" size="18" maxlength="17" value="<%= lnParam.getE02EOVGL1()%>" class="context-menu-help" onmousedown="init(ledgerHelp,this.name,'','','','','')"<%=ctrlReadonly %>>
              </div>
            </td>
            <td nowrap> 
              <div align="center"> 
                <input type="text" name="D02GL1EOV" size="35" maxlength="35" value="<%= lnParam.getD02GL1EOV()%>" <%=ctrlReadonly %>>
              </div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap > 
              <div align="right"> 
 				<input type="text" name="E02EOVRI2" value="<%= lnParam.getE02EOVRI2() %>" size="14" maxlength="13" onkeypress="enterDecimal(event)"<%=ctrlReadonly %>>              
 			  </div>
            </td>

            <td nowrap > 
              <div align="right"> 
 				<input type="text" name="E02EOVRF2" value="<%= lnParam.getE02EOVRF2() %>" size="14" maxlength="13" onkeypress="enterDecimal(event)"<%=ctrlReadonly %>>              
 			  </div>
            </td>

          
            <td nowrap > 
              <div align="center"> 
	              <select name="E02EOVFT2" onchange="showFixPerField('E02EOVFA2','E02EOVRT2');" <%=ctrlDisabled %>>
	                <option value=" " <% if (!(lnParam.getE02EOVFT2().equals("F") ||lnParam.getE02EOVFT2().equals("%"))) out.print("selected"); %>></option>
	                <option value="F" <% if (lnParam.getE02EOVFT2().equals("F")) out.print("selected"); %>>Monto Fijo</option>
	                <option value="%" <% if (lnParam.getE02EOVFT2().equals("%")) out.print("selected"); %>>Porcentaje</option>  
	              </select>                
              </div>
            </td>
            <td nowrap > 
              <div align="left" id="E02EOVFA2"> 
              	<input type="text" name="E02EOVFA2" value="<%= lnParam.getE02EOVFA2() %>" size="15" maxlength="9" onkeypress="enterDecimal(event)" <%=ctrlReadonly %>>              
              </div>
              <div align="left" id="E02EOVRT2"> 
              	<input type="text" name="E02EOVRT2" value="<%= lnParam.getE02EOVRT2() %>" size="15" maxlength="10" onkeypress="enterDecimal(6)" <%=ctrlReadonly %>>              
              </div>
            </td>
            <td nowrap > 
              <div align="right"> 
 				<input type="text" name="E02EOVPE2" value="<%= lnParam.getE02EOVPE2() %>" size="7" maxlength="3" onkeypress="enterInteger(event)" <%=ctrlReadonly %>>               
 			  </div>
            </td>


            <td nowrap > 
              <div align="right"> 
 				<input type="text" name="E02EOVFX2" value="<%= lnParam.getE02EOVFX2() %>" size="13" maxlength="13" onkeypress="enterDecimal(event)" <%=ctrlReadonly %>>              
 			  </div>
            </td>
            <td nowrap > 
              <div align="right"> 
 				<input type="text" name="E02EOVFM2" value="<%= lnParam.getE02EOVFM2() %>" size="13" maxlength="13" onkeypress="enterDecimal(event)" <%=ctrlReadonly %>>              
 			  </div>
            </td>
            <td nowrap > 
              <div align="center"> 
	              <select name="E02EOVIV2" <%=ctrlDisabled %>>
	                <option value=" " <% if (!(lnParam.getE02EOVIV2().equals("Y") ||lnParam.getE02EOVIV2().equals("N"))) out.print("selected"); %>></option>
	                <option value="Y" <% if (lnParam.getE02EOVIV2().equals("Y")) out.print("selected"); %>>Si</option>
	                <option value="N" <% if (lnParam.getE02EOVIV2().equals("N")) out.print("selected"); %>>No</option>        
	              </select>                
              </div>
            </td>
            <td nowrap> 
              <div align="center"> 
                <input type="text" name="E02EOVGL2" size="18" maxlength="17" value="<%= lnParam.getE02EOVGL2()%>" class="context-menu-help" onmousedown="init(ledgerHelp,this.name,'','','','','')" <%=ctrlReadonly %>>
              </div>
            </td>
            <td nowrap> 
              <div align="center"> 
                <input type="text" name="D02GL2EOV" size="35" maxlength="35" value="<%= lnParam.getD02GL2EOV()%>" <%=ctrlReadonly %>>
              </div>
            </td>
          </tr>
          <tr id="trclear"> 
             <td nowrap > 
              <div align="right"> 
 				<input type="text" name="E02EOVRI3" value="<%= lnParam.getE02EOVRI3() %>" size="14" maxlength="13" onkeypress="enterDecimal(event)" <%=ctrlReadonly %>>              
 			  </div>
            </td>

            <td nowrap > 
              <div align="right"> 
 				<input type="text" name="E02EOVRF3" value="<%= lnParam.getE02EOVRF3() %>" size="14" maxlength="13" onkeypress="enterDecimal(event)" <%=ctrlReadonly %>>              
 			  </div>
            </td>
          
            <td nowrap > 
              <div align="center"> 
	              <select name="E02EOVFT3" onchange="showFixPerField('E02EOVFA3','E02EOVRT3');" <%=ctrlDisabled %>>
	                <option value=" " <% if (!(lnParam.getE02EOVFT3().equals("F") ||lnParam.getE02EOVFT3().equals("%"))) out.print("selected"); %>></option>
	                <option value="F" <% if (lnParam.getE02EOVFT3().equals("F")) out.print("selected"); %>>Monto Fijo</option>
	                <option value="%" <% if (lnParam.getE02EOVFT3().equals("%")) out.print("selected"); %>>Porcentaje</option>  
	              </select>                
              </div>
            </td>
            <td nowrap > 
              <div align="left" id="E02EOVFA3"> 
              	<input type="text" name="E02EOVFA3" value="<%= lnParam.getE02EOVFA3() %>" size="15" maxlength="9" onkeypress="enterDecimal(event)" <%=ctrlReadonly %>>              
              </div>
              <div align="left" id="E02EOVRT3"> 
              	<input type="text" name="E02EOVRT3" value="<%= lnParam.getE02EOVRT3() %>" size="15" maxlength="10" onkeypress="enterDecimal(6)" <%=ctrlReadonly %>>              
              </div>
            </td>
            
            <td nowrap > 
              <div align="right"> 
 				<input type="text" name="E02EOVPE3" value="<%= lnParam.getE02EOVPE3() %>" size="7" maxlength="3" onkeypress="enterInteger(event)" <%=ctrlReadonly %>>              
 			  </div>
            </td>
            
            
            <td nowrap > 
              <div align="right"> 
 				<input type="text" name="E02EOVFX3" value="<%= lnParam.getE02EOVFX3() %>" size="13" maxlength="13" onkeypress="enterDecimal(event)" <%=ctrlReadonly %>>              
 			  </div>
            </td>
            <td nowrap > 
              <div align="right"> 
 				<input type="text" name="E02EOVFM3" value="<%= lnParam.getE02EOVFM3() %>" size="13" maxlength="13" onkeypress="enterInteger(event)" <%=ctrlReadonly %>>              
 			  </div>
            </td>
            <td nowrap > 
              <div align="center"> 
	              <select name="E02EOVIV3" <%=ctrlDisabled %>>
	                <option value=" " <% if (!(lnParam.getE02EOVIV3().equals("Y") ||lnParam.getE02EOVIV3().equals("N"))) out.print("selected"); %>></option>
	                <option value="Y" <% if (lnParam.getE02EOVIV3().equals("Y")) out.print("selected"); %>>Si</option>
	                <option value="N" <% if (lnParam.getE02EOVIV3().equals("N")) out.print("selected"); %>>No</option>        
	              </select>                
              </div>
            </td>
            <td nowrap> 
              <div align="center"> 
                <input type="text" name="E02EOVGL3" size="18" maxlength="17" value="<%= lnParam.getE02EOVGL3()%>" class="context-menu-help" onmousedown="init(ledgerHelp,this.name,'','','','','')" <%=ctrlReadonly %>>
              </div>
            </td>
            <td nowrap> 
              <div align="center"> 
                <input type="text" name="D02GL3EOV" size="35" maxlength="35" value="<%= lnParam.getD02GL3EOV()%>"  <%=ctrlReadonly %>>
              </div>
            </td>
          </tr>
          <tr id="trclear"> 
             <td nowrap > 
              <div align="right"> 
 				<input type="text" name="E02EOVRI4" value="<%= lnParam.getE02EOVRI4() %>" size="14" maxlength="13" onkeypress="enterDecimal(event)" <%=ctrlReadonly %>>              
 			  </div>
            </td>

            <td nowrap > 
              <div align="right"> 
 				<input type="text" name="E02EOVRF4" value="<%= lnParam.getE02EOVRF4() %>" size="14" maxlength="13" onkeypress="enterDecimal(event)" <%=ctrlReadonly %>>              
 			  </div>
            </td>
          
            <td nowrap > 
              <div align="center"> 
	              <select name="E02EOVFT4" onchange="showFixPerField('E02EOVFA4','E02EOVRT4');"  <%=ctrlDisabled %>>
	                <option value=" " <% if (!(lnParam.getE02EOVFT4().equals("F") ||lnParam.getE02EOVFT4().equals("%"))) out.print("selected"); %>></option>
	                <option value="F" <% if (lnParam.getE02EOVFT4().equals("F")) out.print("selected"); %>>Monto Fijo</option>
	                <option value="%" <% if (lnParam.getE02EOVFT4().equals("%")) out.print("selected"); %>>Porcentaje</option>   
	              </select>                
              </div>
            </td>
            <td nowrap > 
              <div align="left" id="E02EOVFA4"> 
              	<input type="text" name="E02EOVFA4" value="<%= lnParam.getE02EOVFA4() %>" size="15" maxlength="9" onkeypress="enterDecimal(event)" <%=ctrlReadonly %>>              
              </div>
              <div align="left" id="E02EOVRT4"> 
              	<input type="text" name="E02EOVRT4" value="<%= lnParam.getE02EOVRT4() %>" size="15" maxlength="10" onkeypress="enterDecimal(6)" <%=ctrlReadonly %>>              
              </div>
            </td>
            
                        <td nowrap > 
              <div align="right"> 
 				<input type="text" name="E02EOVPE4" value="<%= lnParam.getE02EOVPE4() %>" size="7" maxlength="3" onkeypress="enterInteger(event)" <%=ctrlReadonly %>>              
 			  </div>
            </td>
            
            
            <td nowrap > 
              <div align="right"> 
 				<input type="text" name="E02EOVFX4" value="<%= lnParam.getE02EOVFX4() %>" size="13" maxlength="13" onkeypress="enterDecimal(event)" <%=ctrlReadonly %>>              
 			  </div>
            </td>
            <td nowrap > 
              <div align="right"> 
 				<input type="text" name="E02EOVFM4" value="<%= lnParam.getE02EOVFM4() %>" size="13" maxlength="13" onkeypress="enterInteger(event)" <%=ctrlReadonly %>>              
 			  </div>
            </td>
            <td nowrap > 
              <div align="center"> 
	              <select name="E02EOVIV4" <%=ctrlDisabled %>>
	                <option value=" " <% if (!(lnParam.getE02EOVIV4().equals("Y") ||lnParam.getE02EOVIV4().equals("N"))) out.print("selected"); %>></option>
	                <option value="Y" <% if (lnParam.getE02EOVIV4().equals("Y")) out.print("selected"); %>>Si</option>
	                <option value="N" <% if (lnParam.getE02EOVIV4().equals("N")) out.print("selected"); %>>No</option>        
	              </select>                
              </div>
            </td>
            <td nowrap> 
              <div align="center"> 
                <input type="text" name="E02EOVGL4" size="18" maxlength="17" value="<%= lnParam.getE02EOVGL4()%>" class="context-menu-help" onmousedown="init(ledgerHelp,this.name,'','','','','')" <%=ctrlReadonly %>>
              </div>
            </td>
            <td nowrap> 
              <div align="center"> 
                <input type="text" name="D02GL4EOV" size="35" maxlength="35" value="<%= lnParam.getD02GL4EOV()%>" <%=ctrlReadonly %>>
              </div>
            </td>
          </tr>
          <tr id="trclear"> 
              <td nowrap > 
              <div align="right"> 
 				<input type="text" name="E02EOVRI5" value="<%= lnParam.getE02EOVRI5() %>" size="14" maxlength="13" onkeypress="enterDecimal(event)" <%=ctrlReadonly %>>              
 			  </div>
            </td>

            <td nowrap > 
              <div align="right"> 
 				<input type="text" name="E02EOVRF5" value="<%= lnParam.getE02EOVRF5() %>" size="14" maxlength="13" onkeypress="enterDecimal(event)" <%=ctrlReadonly %>>              
 			  </div>
            </td>
          
            <td nowrap > 
              <div align="center"> 
	              <select name="E02EOVFT5" onchange="showFixPerField('E02EOVFA5','E02EOVRT5');"  <%=ctrlDisabled %>>
	                <option value=" " <% if (!(lnParam.getE02EOVFT5().equals("F") ||lnParam.getE02EOVFT5().equals("%"))) out.print("selected"); %>></option>
	                <option value="F" <% if (lnParam.getE02EOVFT5().equals("F")) out.print("selected"); %>>Monto Fijo</option>
	                <option value="%" <% if (lnParam.getE02EOVFT5().equals("%")) out.print("selected"); %>>Porcentaje</option>   
	              </select>                
              </div>
            </td>
            <td nowrap > 
              <div align="left" id="E02EOVFA5"> 
              	<input type="text" name="E02EOVFA5" value="<%= lnParam.getE02EOVFA5() %>" size="15" maxlength="9" onkeypress="enterDecimal(event)" <%=ctrlReadonly %>>              
              </div>
              <div align="left" id="E02EOVRT5"> 
              	<input type="text" name="E02EOVRT5" value="<%= lnParam.getE02EOVRT5() %>" size="15" maxlength="10" onkeypress="enterDecimal(6)" <%=ctrlReadonly %>>              
              </div>
            </td>
            
            <td nowrap > 
              <div align="right"> 
 				<input type="text" name="E02EOVPE5" value="<%= lnParam.getE02EOVPE5() %>" size="7" maxlength="3" onkeypress="enterInteger(event)" <%=ctrlReadonly %>>              
 			  </div>
            </td>
            
            
            
            <td nowrap > 
              <div align="right"> 
 				<input type="text" name="E02EOVFX5" value="<%= lnParam.getE02EOVFX5() %>" size="13" maxlength="13" onkeypress="enterDecimal(event)" <%=ctrlReadonly %>>              
 			  </div>
            </td>
            <td nowrap > 
              <div align="right"> 
 				<input type="text" name="E02EOVFM5" value="<%= lnParam.getE02EOVFM5() %>" size="13" maxlength="13" onkeypress="enterDecimal(event)" <%=ctrlReadonly %>>              
 			  </div>
            </td>
            <td nowrap > 
              <div align="center"> 
	              <select name="E02EOVIV5" <%=ctrlDisabled %>>
	                <option value=" " <% if (!(lnParam.getE02EOVIV5().equals("Y") ||lnParam.getE02EOVIV5().equals("N"))) out.print("selected"); %>></option>
	                <option value="Y" <% if (lnParam.getE02EOVIV5().equals("Y")) out.print("selected"); %>>Si</option>
	                <option value="N" <% if (lnParam.getE02EOVIV5().equals("N")) out.print("selected"); %>>No</option>        
	              </select>                
              </div>
            </td>
            <td nowrap> 
              <div align="center"> 
                <input type="text" name="E02EOVGL5" size="18" maxlength="17" value="<%= lnParam.getE02EOVGL5()%>" class="context-menu-help" onmousedown="init(ledgerHelp,this.name,'','','','','')" <%=ctrlReadonly %>>
              </div>
            </td>
            <td nowrap> 
              <div align="center"> 
                <input type="text" name="D02GL5EOV" size="35" maxlength="35" value="<%= lnParam.getD02GL5EOV()%>"  <%=ctrlReadonly %>>
              </div>
            </td>
          </tr>
          <tr id="trclear"> 
             <td nowrap > 
              <div align="right"> 
 				<input type="text" name="E02EOVRI6" value="<%= lnParam.getE02EOVRI6() %>" size="14" maxlength="13" onkeypress="enterDecimal(event)" <%=ctrlReadonly %>>              
 			  </div>
            </td>

            <td nowrap > 
              <div align="right"> 
 				<input type="text" name="E02EOVRF6" value="<%= lnParam.getE02EOVRF6() %>" size="14" maxlength="13" onkeypress="enterDecimal(event)" <%=ctrlReadonly %>>              
 			  </div>
            </td>
          
            <td nowrap > 
              <div align="center"> 
	              <select name="E02EOVFT6" onchange="showFixPerField('E02EOVFA6','E02EOVRT6');" <%=ctrlDisabled %>>
	                <option value=" " <% if (!(lnParam.getE02EOVFT6().equals("F") ||lnParam.getE02EOVFT6().equals("%"))) out.print("selected"); %>></option>
	                <option value="F" <% if (lnParam.getE02EOVFT6().equals("F")) out.print("selected"); %>>Monto Fijo</option>
	                <option value="%" <% if (lnParam.getE02EOVFT6().equals("%")) out.print("selected"); %>>Porcentaje</option>  
	              </select>                
              </div>
            </td>
            <td nowrap > 
              <div align="left" id="E02EOVFA6" > 
              	<input type="text" name="E02EOVFA6" value="<%= lnParam.getE02EOVFA6() %>" size="15" maxlength="9" onkeypress="enterDecimal(event)" <%=ctrlReadonly %>>              
              </div>
              <div align="left" id="E02EOVRT6"> 
              	<input type="text" name="E02EOVRT6" value="<%= lnParam.getE02EOVRT6() %>" size="15" maxlength="10" onkeypress="enterDecimal(6)" <%=ctrlReadonly %>>              
              </div>
            </td>
            
            <td nowrap > 
              <div align="right"> 
 				<input type="text" name="E02EOVPE6" value="<%= lnParam.getE02EOVPE6() %>" size="7" maxlength="3" onkeypress="enterInteger(event)" <%=ctrlReadonly %>>              
 			  </div>
            </td>
            
            
            <td nowrap > 
              <div align="right"> 
 				<input type="text" name="E02EOVFX6" value="<%= lnParam.getE02EOVFX6() %>" size="13" maxlength="13" onkeypress="enterDecimal(event)" <%=ctrlReadonly %>>              
 			  </div>
            </td>
            <td nowrap > 
              <div align="right"> 
 				<input type="text" name="E02EOVFM6" value="<%= lnParam.getE02EOVFM6() %>" size="13" maxlength="13" onkeypress="enterDecimal(event)" <%=ctrlReadonly %>>              
 			  </div>
            </td>
            <td nowrap > 
              <div align="center"> 
	              <select name="E02EOVIV6" <%=ctrlDisabled %>>
	                <option value=" " <% if (!(lnParam.getE02EOVIV6().equals("Y") ||lnParam.getE02EOVIV6().equals("N"))) out.print("selected"); %>></option>
	                <option value="Y" <% if (lnParam.getE02EOVIV6().equals("Y")) out.print("selected"); %>>Si</option>
	                <option value="N" <% if (lnParam.getE02EOVIV6().equals("N")) out.print("selected"); %>>No</option>        
	              </select>                
              </div>
            </td>
            <td nowrap> 
              <div align="center"> 
                <input type="text" name="E02EOVGL6" size="18" maxlength="17" value="<%= lnParam.getE02EOVGL6()%>" class="context-menu-help" onmousedown="init(ledgerHelp,this.name,'','','','','')" <%=ctrlReadonly %>>
              </div>
            </td>
            <td nowrap> 
              <div align="center"> 
                <input type="text" name="D02GL6EOV" size="35" maxlength="35" value="<%= lnParam.getD02GL6EOV()%>"  <%=ctrlReadonly %>>
              </div>
            </td>
          </tr>
          
          <tr id="trclear"> 
            
            <td nowrap > 
              <div align="right"> 
 				<input type="text" name="E02EOVRI7" value="<%= lnParam.getE02EOVRI7() %>" size="14" maxlength="13" onkeypress="enterDecimal(event)" <%=ctrlReadonly %>>              
 			  </div>
            </td>

            <td nowrap > 
              <div align="right"> 
 				<input type="text" name="E02EOVRF7" value="<%= lnParam.getE02EOVRF7() %>" size="14" maxlength="13" onkeypress="enterDecimal(event)" <%=ctrlReadonly %>>              
 			  </div>
            </td>
            
          
            <td nowrap > 
              <div align="center"> 
	              <select name="E02EOVFT7" onchange="showFixPerField('E02EOVFA7','E02EOVRT7');" <%=ctrlDisabled %>>
	                <option value=" " <% if (!(lnParam.getE02EOVFT7().equals("F") ||lnParam.getE02EOVFT7().equals("%"))) out.print("selected"); %>></option>
	                <option value="F" <% if (lnParam.getE02EOVFT7().equals("F")) out.print("selected"); %>>Monto Fijo</option>
	                <option value="%" <% if (lnParam.getE02EOVFT7().equals("%")) out.print("selected"); %>>Porcentaje</option>
	              </select>                
              </div>
            </td>
            <td nowrap > 
              <div align="left" id="E02EOVFA7"> 
              	<input type="text" name="E02EOVFA7" value="<%= lnParam.getE02EOVFA7() %>" size="15" maxlength="9" onkeypress="enterDecimal(event)" <%=ctrlReadonly %>>              
              </div>
              <div align="left" id="E02EOVRT7"> 
              	<input type="text" name="E02EOVRT7" value="<%= lnParam.getE02EOVRT7() %>" size="15" maxlength="10" onkeypress="enterDecimal(6)" <%=ctrlReadonly %>>              
              </div>
            </td>
            <td nowrap > 
              <div align="right"> 
 				<input type="text" name="E02EOVPE7" value="<%= lnParam.getE02EOVPE7() %>" size="7" maxlength="3" onkeypress="enterInteger(event)" <%=ctrlReadonly %>>              
 			  </div>
            </td>
            
            <td nowrap > 
              <div align="right"> 
 				<input type="text" name="E02EOVFX7" value="<%= lnParam.getE02EOVFX7() %>" size="13" maxlength="13" onkeypress="enterDecimal(event)" <%=ctrlReadonly %>>              
 			  </div>
            </td>
            <td nowrap > 
              <div align="right"> 
 				<input type="text" name="E02EOVFM7" value="<%= lnParam.getE02EOVFM7() %>" size="13" maxlength="13" onkeypress="enterDecimal(event)" <%=ctrlReadonly %>>              
 			  </div>
            </td>
            <td nowrap > 
              <div align="center"> 
	              <select name="E02EOVIV7" <%=ctrlDisabled %>>
	                <option value=" " <% if (!(lnParam.getE02EOVIV7().equals("Y") ||lnParam.getE02EOVIV7().equals("N"))) out.print("selected"); %>></option>
	                <option value="Y" <% if (lnParam.getE02EOVIV7().equals("Y")) out.print("selected"); %>>Si</option>
	                <option value="N" <% if (lnParam.getE02EOVIV7().equals("N")) out.print("selected"); %>>No</option>        
	              </select>                
              </div>
            </td>
            <td nowrap> 
              <div align="center"> 
                <input type="text" name="E02EOVGL7" size="18" maxlength="17" value="<%= lnParam.getE02EOVGL7()%>" class="context-menu-help" onmousedown="init(ledgerHelp,this.name,'','','','','')" <%=ctrlReadonly %>>
              </div>
            </td>
            <td nowrap> 
              <div align="center"> 
                <input type="text" name="D02GL7EOV" size="35" maxlength="35" value="<%= lnParam.getD02GL7EOV	()%>"  <%=ctrlReadonly %>>
              </div>
            </td>
          </tr>
          
            
         <tr id="trclear"> 
            <td nowrap colspan="7"> Cargo Fijo (7 enteros y 2 decimales), Porcentaje (3 enteros y 6 decimales) 
            </td>
          </tr>
     </table>
     </td>
</tr>
</table>
<h3>Comisi&oacute;n de Pago/Negociaci&oacute;n</h3>
<table  class="tableinfo">
    <tr > 
      <td nowrap>
       
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="trdark"> 
            <th nowrap >Rango<br>Inicial</th>
            <th nowrap >Rango<br>Final</th>
            <th nowrap >Tipo<br>Cargo</th>
            <th nowrap >Monto<br>Cargo</th>
            <th nowrap >Periodo</th>
            <th nowrap >Monto<br>Máximo</th>
            <th nowrap >Monto<br>Mínimo</th>
            <th nowrap >ITMBS</th>
            <th nowrap >Cuenta Contable</th>
            <th nowrap >Descripción</th>
          </tr>
          <tr id="trclear"> 
            <td nowrap > 
              <div align="right"> 
 				<input type="text" name="E02NEGRI1" value="<%= lnParam.getE02NEGRI1() %>" size="14" maxlength="13" onkeypress="enterDecimal(event)" <%=ctrlReadonly %>>              
 			  </div>
            </td>

            <td nowrap > 
              <div align="right"> 
 				<input type="text" name="E02NEGRF1" value="<%= lnParam.getE02NEGRF1() %>" size="14" maxlength="13" onkeypress="enterDecimal(event)" <%=ctrlReadonly %>>              
 			  </div>
            </td>
          
            <td nowrap > 
              <div align="center"> 
	              <select name="E02NEGFT1" onchange="showFixPerField('E02NEGFA1','E02NEGRT1');"  <%=ctrlDisabled %>>
	                <option value=" " <% if (!(lnParam.getE02NEGFT1().equals("F") ||lnParam.getE02NEGFT1().equals("%"))) out.print("selected"); %>></option>
	                <option value="F" <% if (lnParam.getE02NEGFT1().equals("F")) out.print("selected"); %>>Monto Fijo</option>
	                <option value="%" <% if (lnParam.getE02NEGFT1().equals("%")) out.print("selected"); %>>Porcentaje</option>        
	              </select>                
              </div>
            </td>
            <td nowrap > 
              <div align="left" id="E2ACHFA1" > 
              	<input type="text" name="E02NEGFA1" value="<%= lnParam.getE02NEGFA1() %>" size="15" maxlength="9" onkeypress="enterDecimal(event)" <%=ctrlReadonly %>>              
              </div>
              <div align="left" id="E02NEGRT1"> 
              	<input type="text" name="E02NEGRT1" value="<%= lnParam.getE02NEGRT1() %>" size="15" maxlength="10" onkeypress="enterDecimal(6)" <%=ctrlReadonly %>>              
              </div>
            </td>
            <td nowrap > 
              <div align="right"> 
 				<input type="text" name="E02NEGPE1" value="<%= lnParam.getE02NEGPE1() %>" size="7" maxlength="3" onkeypress="enterInteger(event)" <%=ctrlReadonly %>>              
 			  </div>
            </td>

            <td nowrap > 
              <div align="right"> 
 				<input type="text" name="E02NEGFX1" value="<%= lnParam.getE02NEGFX1() %>" size="13" maxlength="13" onkeypress="enterDecimal(event)" <%=ctrlReadonly %>>              
 			  </div>
            </td>
            <td nowrap > 
              <div align="right"> 
 				<input type="text" name="E02NEGFM1" value="<%= lnParam.getE02NEGFM1() %>" size="13" maxlength="13" onkeypress="enterDecimal(event)" <%=ctrlReadonly %>>              
 			  </div>
            </td>
            <td nowrap > 
              <div align="center"> 
	              <select name="E02NEGIV1" <%=ctrlDisabled %>>
	                <option value=" " <% if (!(lnParam.getE02NEGIV1().equals("Y") ||lnParam.getE02NEGIV1().equals("N"))) out.print("selected"); %>></option>
	                <option value="Y" <% if (lnParam.getE02NEGIV1().equals("Y")) out.print("selected"); %>>Si</option>
	                <option value="N" <% if (lnParam.getE02NEGIV1().equals("N")) out.print("selected"); %>>No</option>        
	              </select>                
              </div>
            </td>
            <td nowrap> 
              <div align="center"> 
                <input type="text" name="E02NEGGL1" size="18" maxlength="17" value="<%= lnParam.getE02NEGGL1()%>" class="context-menu-help" onmousedown="init(ledgerHelp,this.name,'','','','','')" <%=ctrlReadonly %>>
              </div>
            </td>
            <td nowrap> 
              <div align="center"> 
                <input type="text" name="D02GL1NEG" size="35" maxlength="35" value="<%= lnParam.getD02GL1NEG()%>"  <%=ctrlReadonly %>>
              </div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap > 
              <div align="right"> 
 				<input type="text" name="E02NEGRI2" value="<%= lnParam.getE02NEGRI2() %>" size="14" maxlength="13" onkeypress="enterDecimal(event)" <%=ctrlReadonly %>>              
 			  </div>
            </td>

            <td nowrap > 
              <div align="right"> 
 				<input type="text" name="E02NEGRF2" value="<%= lnParam.getE02NEGRF2() %>" size="14" maxlength="13" onkeypress="enterDecimal(event)" <%=ctrlReadonly %>>              
 			  </div>
            </td>

          
            <td nowrap > 
              <div align="center"> 
	              <select name="E02NEGFT2" onchange="showFixPerField('E02NEGFA2','E02NEGRT2');"  <%=ctrlDisabled %>>
	                <option value=" " <% if (!(lnParam.getE02NEGFT2().equals("F") ||lnParam.getE02NEGFT2().equals("%"))) out.print("selected"); %>></option>
	                <option value="F" <% if (lnParam.getE02NEGFT2().equals("F")) out.print("selected"); %>>Monto Fijo</option>
	                <option value="%" <% if (lnParam.getE02NEGFT2().equals("%")) out.print("selected"); %>>Porcentaje</option>  
	              </select>                
              </div>
            </td>
            <td nowrap > 
              <div align="left" id="E02NEGFA2"> 
              	<input type="text" name="E02NEGFA2" value="<%= lnParam.getE02NEGFA2() %>" size="15" maxlength="9" onkeypress="enterDecimal(event)" <%=ctrlReadonly %>>              
              </div>
              <div align="left" id="E02NEGRT2"> 
              	<input type="text" name="E02NEGRT2" value="<%= lnParam.getE02NEGRT2() %>" size="15" maxlength="10" onkeypress="enterDecimal(6)" <%=ctrlReadonly %>>              
              </div>
            </td>
            <td nowrap > 
              <div align="right"> 
 				<input type="text" name="E02NEGPE2" value="<%= lnParam.getE02NEGPE2() %>" size="7" maxlength="3" onkeypress="enterInteger(event)" <%=ctrlReadonly %>>              
 			  </div>
            </td>


            <td nowrap > 
              <div align="right"> 
 				<input type="text" name="E02NEGFX2" value="<%= lnParam.getE02NEGFX2() %>" size="13" maxlength="13" onkeypress="enterDecimal(event)" <%=ctrlReadonly %>>              
 			  </div>
            </td>
            <td nowrap > 
              <div align="right"> 
 				<input type="text" name="E02NEGFM2" value="<%= lnParam.getE02NEGFM2() %>" size="13" maxlength="13" onkeypress="enterDecimal(event)" <%=ctrlReadonly %>>              
 			  </div>
            </td>
            <td nowrap > 
              <div align="center"> 
	              <select name="E02NEGIV2" <%=ctrlDisabled %>>
	                <option value=" " <% if (!(lnParam.getE02NEGIV2().equals("Y") ||lnParam.getE02NEGIV2().equals("N"))) out.print("selected"); %>></option>
	                <option value="Y" <% if (lnParam.getE02NEGIV2().equals("Y")) out.print("selected"); %>>Si</option>
	                <option value="N" <% if (lnParam.getE02NEGIV2().equals("N")) out.print("selected"); %>>No</option>        
	              </select>                
              </div>
            </td>
            <td nowrap> 
              <div align="center"> 
                <input type="text" name="E02NEGGL2" size="18" maxlength="17" value="<%= lnParam.getE02NEGGL2()%>" class="context-menu-help" onmousedown="init(ledgerHelp,this.name,'','','','','')" <%=ctrlReadonly %>>
              </div>
            </td>
            <td nowrap> 
              <div align="center"> 
                <input type="text" name="D02GL2NEG" size="35" maxlength="35" value="<%= lnParam.getD02GL2NEG()%>"  <%=ctrlReadonly %>>
              </div>
            </td>
          </tr>
          <tr id="trclear"> 
             <td nowrap > 
              <div align="right"> 
 				<input type="text" name="E02NEGRI3" value="<%= lnParam.getE02NEGRI3() %>" size="14" maxlength="13" onkeypress="enterDecimal(event)" <%=ctrlReadonly %>>              
 			  </div>
            </td>

            <td nowrap > 
              <div align="right"> 
 				<input type="text" name="E02NEGRF3" value="<%= lnParam.getE02NEGRF3() %>" size="14" maxlength="13" onkeypress="enterDecimal(event)" <%=ctrlReadonly %>>              
 			  </div>
            </td>
          
            <td nowrap > 
              <div align="center"> 
	              <select name="E02NEGFT3" onchange="showFixPerField('E02NEGFA3','E02NEGRT3');"  <%=ctrlDisabled %>>
	                <option value=" " <% if (!(lnParam.getE02NEGFT3().equals("F") ||lnParam.getE02NEGFT3().equals("%"))) out.print("selected"); %>></option>
	                <option value="F" <% if (lnParam.getE02NEGFT3().equals("F")) out.print("selected"); %>>Monto Fijo</option>
	                <option value="%" <% if (lnParam.getE02NEGFT3().equals("%")) out.print("selected"); %>>Porcentaje</option>  
	              </select>                
              </div>
            </td>
            <td nowrap > 
              <div align="left" id="E02NEGFA3"> 
              	<input type="text" name="E02NEGFA3" value="<%= lnParam.getE02NEGFA3() %>" size="15" maxlength="9" onkeypress="enterDecimal(event)" <%=ctrlReadonly %>>              
              </div>
              <div align="left" id="E02NEGRT3"> 
              	<input type="text" name="E02NEGRT3" value="<%= lnParam.getE02NEGRT3() %>" size="15" maxlength="10" onkeypress="enterDecimal(6)" <%=ctrlReadonly %>>              
              </div>
            </td>
            
            <td nowrap > 
              <div align="right"> 
 				<input type="text" name="E02NEGPE3" value="<%= lnParam.getE02NEGPE3() %>" size="7" maxlength="3" onkeypress="enterInteger(event)" <%=ctrlReadonly %>>              
 			  </div>
            </td>
            
            
            <td nowrap > 
              <div align="right"> 
 				<input type="text" name="E02NEGFX3" value="<%= lnParam.getE02NEGFX3() %>" size="13" maxlength="13" onkeypress="enterDecimal(event)" <%=ctrlReadonly %>>              
 			  </div>
            </td>
            <td nowrap > 
              <div align="right"> 
 				<input type="text" name="E02NEGFM3" value="<%= lnParam.getE02NEGFM3() %>" size="13" maxlength="13" onkeypress="enterInteger(event)" <%=ctrlReadonly %>>              
 			  </div>
            </td>
            <td nowrap > 
              <div align="center"> 
	              <select name="E02NEGIV3" <%=ctrlDisabled %>>
	                <option value=" " <% if (!(lnParam.getE02NEGIV3().equals("Y") ||lnParam.getE02NEGIV3().equals("N"))) out.print("selected"); %>></option>
	                <option value="Y" <% if (lnParam.getE02NEGIV3().equals("Y")) out.print("selected"); %>>Si</option>
	                <option value="N" <% if (lnParam.getE02NEGIV3().equals("N")) out.print("selected"); %>>No</option>        
	              </select>                
              </div>
            </td>
            <td nowrap> 
              <div align="center"> 
                <input type="text" name="E02NEGGL3" size="18" maxlength="17" value="<%= lnParam.getE02NEGGL3()%>" class="context-menu-help" onmousedown="init(ledgerHelp,this.name,'','','','','')" <%=ctrlReadonly %>>
              </div>
            </td>
            <td nowrap> 
              <div align="center"> 
                <input type="text" name="D02GL3NEG" size="35" maxlength="35" value="<%= lnParam.getD02GL3NEG()%>"  <%=ctrlReadonly %>>
              </div>
            </td>
          </tr>
          <tr id="trclear"> 
             <td nowrap > 
              <div align="right"> 
 				<input type="text" name="E02NEGRI4" value="<%= lnParam.getE02NEGRI4() %>" size="14" maxlength="13" onkeypress="enterDecimal(event)" <%=ctrlReadonly %>>              
 			  </div>
            </td>

            <td nowrap > 
              <div align="right"> 
 				<input type="text" name="E02NEGRF4" value="<%= lnParam.getE02NEGRF4() %>" size="14" maxlength="13" onkeypress="enterDecimal(event)" <%=ctrlReadonly %>>              
 			  </div>
            </td>
          
            <td nowrap > 
              <div align="center"> 
	              <select name="E02NEGFT4" onchange="showFixPerField('E02NEGFA4','E02NEGRT4');"  <%=ctrlDisabled %>>
	                <option value=" " <% if (!(lnParam.getE02NEGFT4().equals("F") ||lnParam.getE02NEGFT4().equals("%"))) out.print("selected"); %>></option>
	                <option value="F" <% if (lnParam.getE02NEGFT4().equals("F")) out.print("selected"); %>>Monto Fijo</option>
	                <option value="%" <% if (lnParam.getE02NEGFT4().equals("%")) out.print("selected"); %>>Porcentaje</option>   
	              </select>                
              </div>
            </td>
            <td nowrap > 
              <div align="left" id="E02NEGFA4"> 
              	<input type="text" name="E02NEGFA4" value="<%= lnParam.getE02NEGFA4() %>" size="15" maxlength="9" onkeypress="enterDecimal(event)" <%=ctrlReadonly %>>              
              </div>
              <div align="left" id="E02NEGRT4"> 
              	<input type="text" name="E02NEGRT4" value="<%= lnParam.getE02NEGRT4() %>" size="15" maxlength="10" onkeypress="enterDecimal(6)" <%=ctrlReadonly %>>              
              </div>
            </td>
            
                        <td nowrap > 
              <div align="right"> 
 				<input type="text" name="E02NEGPE4" value="<%= lnParam.getE02NEGPE4() %>" size="7" maxlength="3" onkeypress="enterInteger(event)" <%=ctrlReadonly %>>              
 			  </div>
            </td>
            
            
            <td nowrap > 
              <div align="right"> 
 				<input type="text" name="E02NEGFX4" value="<%= lnParam.getE02NEGFX4() %>" size="13" maxlength="13" onkeypress="enterDecimal(event)" <%=ctrlReadonly %>>              
 			  </div>
            </td>
            <td nowrap > 
              <div align="right"> 
 				<input type="text" name="E02NEGFM4" value="<%= lnParam.getE02NEGFM4() %>" size="13" maxlength="13" onkeypress="enterInteger(event)" <%=ctrlReadonly %>>              
 			  </div>
            </td>
            <td nowrap > 
              <div align="center"> 
	              <select name="E02NEGIV4" <%=ctrlDisabled%>>
	                <option value=" " <% if (!(lnParam.getE02NEGIV4().equals("Y") ||lnParam.getE02NEGIV4().equals("N"))) out.print("selected"); %>></option>
	                <option value="Y" <% if (lnParam.getE02NEGIV4().equals("Y")) out.print("selected"); %>>Si</option>
	                <option value="N" <% if (lnParam.getE02NEGIV4().equals("N")) out.print("selected"); %>>No</option>        
	              </select>                
              </div>
            </td>
            <td nowrap> 
              <div align="center"> 
                <input type="text" name="E02NEGGL4" size="18" maxlength="17" value="<%= lnParam.getE02NEGGL4()%>" class="context-menu-help" onmousedown="init(ledgerHelp,this.name,'','','','','')" <%=ctrlReadonly %>>
              </div>
            </td>
            <td nowrap> 
              <div align="center"> 
                <input type="text" name="D02GL4NEG" size="35" maxlength="35" value="<%= lnParam.getD02GL4NEG()%>"  <%=ctrlReadonly %>>
              </div>
            </td>
          </tr>
          <tr id="trclear"> 
              <td nowrap > 
              <div align="right"> 
 				<input type="text" name="E02NEGRI5" value="<%= lnParam.getE02NEGRI5() %>" size="14" maxlength="13" onkeypress="enterDecimal(event)" <%=ctrlReadonly %>>              
 			  </div>
            </td>

            <td nowrap > 
              <div align="right"> 
 				<input type="text" name="E02NEGRF5" value="<%= lnParam.getE02NEGRF5() %>" size="14" maxlength="13" onkeypress="enterDecimal(event)" <%=ctrlReadonly %>>              
 			  </div>
            </td>
          
            <td nowrap > 
              <div align="center"> 
	              <select name="E02NEGFT5" onchange="showFixPerField('E02NEGFA5','E02NEGRT5');"  <%=ctrlDisabled %>>
	                <option value=" " <% if (!(lnParam.getE02NEGFT5().equals("F") ||lnParam.getE02NEGFT5().equals("%"))) out.print("selected"); %>></option>
	                <option value="F" <% if (lnParam.getE02NEGFT5().equals("F")) out.print("selected"); %>>Monto Fijo</option>
	                <option value="%" <% if (lnParam.getE02NEGFT5().equals("%")) out.print("selected"); %>>Porcentaje</option>   
	              </select>                
              </div>
            </td>
            <td nowrap > 
              <div align="left" id="E02NEGFA5"> 
              	<input type="text" name="E02NEGFA5" value="<%= lnParam.getE02NEGFA5() %>" size="15" maxlength="9" onkeypress="enterDecimal(event)" <%=ctrlReadonly %>>              
              </div>
              <div align="left" id="E02NEGRT5"> 
              	<input type="text" name="E02NEGRT5" value="<%= lnParam.getE02NEGRT5() %>" size="15" maxlength="10" onkeypress="enterDecimal(6)" <%=ctrlReadonly %>>              
              </div>
            </td>
            
            <td nowrap > 
              <div align="right"> 
 				<input type="text" name="E02NEGPE5" value="<%= lnParam.getE02NEGPE5() %>" size="7" maxlength="3" onkeypress="enterInteger(event)" <%=ctrlReadonly %>>              
 			  </div>
            </td>
            
            
            
            <td nowrap > 
              <div align="right"> 
 				<input type="text" name="E02NEGFX5" value="<%= lnParam.getE02NEGFX5() %>" size="13" maxlength="13" onkeypress="enterDecimal(event)" <%=ctrlReadonly %>>              
 			  </div>
            </td>
            <td nowrap > 
              <div align="right"> 
 				<input type="text" name="E02NEGFM5" value="<%= lnParam.getE02NEGFM5() %>" size="13" maxlength="13" onkeypress="enterDecimal(event)" <%=ctrlReadonly %>>              
 			  </div>
            </td>
            <td nowrap > 
              <div align="center"> 
	              <select name="E02NEGIV5" <%=ctrlDisabled%>>
	                <option value=" " <% if (!(lnParam.getE02NEGIV5().equals("Y") ||lnParam.getE02NEGIV5().equals("N"))) out.print("selected"); %>></option>
	                <option value="Y" <% if (lnParam.getE02NEGIV5().equals("Y")) out.print("selected"); %>>Si</option>
	                <option value="N" <% if (lnParam.getE02NEGIV5().equals("N")) out.print("selected"); %>>No</option>        
	              </select>                
              </div>
            </td>
            <td nowrap> 
              <div align="center"> 
                <input type="text" name="E02NEGGL5" size="18" maxlength="17" value="<%= lnParam.getE02NEGGL5()%>" class="context-menu-help" onmousedown="init(ledgerHelp,this.name,'','','','','')" <%=ctrlReadonly %>>
              </div>
            </td>
            <td nowrap> 
              <div align="center"> 
                <input type="text" name="D02GL5NEG" size="35" maxlength="35" value="<%= lnParam.getD02GL5NEG()%>"  <%=ctrlReadonly %>>
              </div>
            </td>
          </tr>
          <tr id="trclear"> 
             <td nowrap > 
              <div align="right"> 
 				<input type="text" name="E02NEGRI6" value="<%= lnParam.getE02NEGRI6() %>" size="14" maxlength="13" onkeypress="enterDecimal(event)" <%=ctrlReadonly %>>              
 			  </div>
            </td>

            <td nowrap > 
              <div align="right"> 
 				<input type="text" name="E02NEGRF6" value="<%= lnParam.getE02NEGRF6() %>" size="14" maxlength="13" onkeypress="enterDecimal(event)" <%=ctrlReadonly %>>              
 			  </div>
            </td>
          
            <td nowrap > 
              <div align="center"> 
	              <select name="E02NEGFT6" onchange="showFixPerField('E02NEGFA6','E02NEGRT6');" <%=ctrlDisabled %>>
	                <option value=" " <% if (!(lnParam.getE02NEGFT6().equals("F") ||lnParam.getE02NEGFT6().equals("%"))) out.print("selected"); %>></option>
	                <option value="F" <% if (lnParam.getE02NEGFT6().equals("F")) out.print("selected"); %>>Monto Fijo</option>
	                <option value="%" <% if (lnParam.getE02NEGFT6().equals("%")) out.print("selected"); %>>Porcentaje</option>  
	              </select>                
              </div>
            </td>
            <td nowrap > 
              <div align="left" id="E02NEGFA6" > 
              	<input type="text" name="E02NEGFA6" value="<%= lnParam.getE02NEGFA6() %>" size="15" maxlength="9" onkeypress="enterDecimal(event)" <%=ctrlReadonly %>>              
              </div>
              <div align="left" id="E02NEGRT6"> 
              	<input type="text" name="E02NEGRT6" value="<%= lnParam.getE02NEGRT6() %>" size="15" maxlength="10" onkeypress="enterDecimal(6)" <%=ctrlReadonly %>>              
              </div>
            </td>
            
            <td nowrap > 
              <div align="right"> 
 				<input type="text" name="E02NEGPE6" value="<%= lnParam.getE02NEGPE6() %>" size="7" maxlength="3" onkeypress="enterInteger(event)" <%=ctrlReadonly %>>              
 			  </div>
            </td>
            
            
            <td nowrap > 
              <div align="right"> 
 				<input type="text" name="E02NEGFX6" value="<%= lnParam.getE02NEGFX6() %>" size="13" maxlength="13" onkeypress="enterDecimal(event)" <%=ctrlReadonly %>>              
 			  </div>
            </td>
            <td nowrap > 
              <div align="right"> 
 				<input type="text" name="E02NEGFM6" value="<%= lnParam.getE02NEGFM6() %>" size="13" maxlength="13" onkeypress="enterDecimal(event)" <%=ctrlReadonly %>>              
 			  </div>
            </td>
            <td nowrap > 
              <div align="center"> 
	              <select name="E02NEGIV6" <%=ctrlDisabled %>>
	                <option value=" " <% if (!(lnParam.getE02NEGIV6().equals("Y") ||lnParam.getE02NEGIV6().equals("N"))) out.print("selected"); %>></option>
	                <option value="Y" <% if (lnParam.getE02NEGIV6().equals("Y")) out.print("selected"); %>>Si</option>
	                <option value="N" <% if (lnParam.getE02NEGIV6().equals("N")) out.print("selected"); %>>No</option>        
	              </select>                
              </div>
            </td>
            <td nowrap> 
              <div align="center"> 
                <input type="text" name="E02NEGGL6" size="18" maxlength="17" value="<%= lnParam.getE02NEGGL6()%>" class="context-menu-help" onmousedown="init(ledgerHelp,this.name,'','','','','')" <%=ctrlReadonly %>>
              </div>
            </td>
            <td nowrap> 
              <div align="center"> 
                <input type="text" name="D02GL6NEG" size="35" maxlength="35" value="<%= lnParam.getD02GL6NEG()%>"  <%=ctrlReadonly %>>
              </div>
            </td>
          </tr>
          
          <tr id="trclear"> 
            
            <td nowrap > 
              <div align="right"> 
 				<input type="text" name="E02NEGRI7" value="<%= lnParam.getE02NEGRI7() %>" size="14" maxlength="13" onkeypress="enterDecimal(event)" <%=ctrlReadonly %>>              
 			  </div>
            </td>

            <td nowrap > 
              <div align="right"> 
 				<input type="text" name="E02NEGRF7" value="<%= lnParam.getE02NEGRF7() %>" size="14" maxlength="13" onkeypress="enterDecimal(event)" <%=ctrlReadonly %>>              
 			  </div>
            </td>
            
          
            <td nowrap > 
              <div align="center"> 
	              <select name="E02NEGFT7" onchange="showFixPerField('E02NEGFA7','E02NEGRT7');" <%=ctrlDisabled %>>
	                <option value=" " <% if (!(lnParam.getE02NEGFT7().equals("F") ||lnParam.getE02NEGFT7().equals("%"))) out.print("selected"); %>></option>
	                <option value="F" <% if (lnParam.getE02NEGFT7().equals("F")) out.print("selected"); %>>Monto Fijo</option>
	                <option value="%" <% if (lnParam.getE02NEGFT7().equals("%")) out.print("selected"); %>>Porcentaje</option>
	              </select>                
              </div>
            </td>
            <td nowrap > 
              <div align="left" id="E02NEGFA7"> 
              	<input type="text" name="E02NEGFA7" value="<%= lnParam.getE02NEGFA7() %>" size="15" maxlength="9" onkeypress="enterDecimal(event)" <%=ctrlReadonly %>>              
              </div>
              <div align="left" id="E02NEGRT7"> 
              	<input type="text" name="E02NEGRT7" value="<%= lnParam.getE02NEGRT7() %>" size="15" maxlength="10" onkeypress="enterDecimal(6)" <%=ctrlReadonly %>>              
              </div>
            </td>
            <td nowrap > 
              <div align="right"> 
 				<input type="text" name="E02NEGPE7" value="<%= lnParam.getE02NEGPE7() %>" size="7" maxlength="3" onkeypress="enterInteger(event)" <%=ctrlReadonly %>>              
 			  </div>
            </td>
            
            <td nowrap > 
              <div align="right"> 
 				<input type="text" name="E02NEGFX7" value="<%= lnParam.getE02NEGFX7() %>" size="13" maxlength="13" onkeypress="enterDecimal(event)" <%=ctrlReadonly %>>              
 			  </div>
            </td>
            <td nowrap > 
              <div align="right"> 
 				<input type="text" name="E02NEGFM7" value="<%= lnParam.getE02NEGFM7() %>" size="13" maxlength="13" onkeypress="enterDecimal(event)" <%=ctrlReadonly %>>              
 			  </div>
            </td>
            <td nowrap > 
              <div align="center"> 
	              <select name="E02NEGIV7" <%=ctrlDisabled %>>
	                <option value=" " <% if (!(lnParam.getE02NEGIV7().equals("Y") ||lnParam.getE02NEGIV7().equals("N"))) out.print("selected"); %>></option>
	                <option value="Y" <% if (lnParam.getE02NEGIV7().equals("Y")) out.print("selected"); %>>Si</option>
	                <option value="N" <% if (lnParam.getE02NEGIV7().equals("N")) out.print("selected"); %>>No</option>        
	              </select>                
              </div>
            </td>
            <td nowrap> 
              <div align="center"> 
                <input type="text" name="E02NEGGL7" size="18" maxlength="17" value="<%= lnParam.getE02NEGGL7()%>" class="context-menu-help" onmousedown="init(ledgerHelp,this.name,'','','','','')" <%=ctrlReadonly %>>
              </div>
            </td>
            <td nowrap> 
              <div align="center"> 
                <input type="text" name="D02GL7NEG" size="35" maxlength="35" value="<%= lnParam.getD02GL7NEG	()%>"  <%=ctrlReadonly %>>
              </div>
            </td>
          </tr>
          
            
         <tr id="trclear"> 
            <td nowrap colspan="7"> Cargo Fijo (7 enteros y 2 decimales), Porcentaje (3 enteros y 6 decimales) 
            </td>
          </tr>
     </table>
</td>
</tr>
</table>

<% if (!isReadonly) { %>
  <p align="center"> 
        <input id="EIBSBTN" type=submit name="Submit" value="Enviar">
  </p>
<% } %> 
  </form>
</body>

<script type="text/javascript">
  if (getElement("E02ISSFT1").value == '%'){
    getElement("E02ISSFA1").style.display="none";
    getElement("E02ISSRT1").style.display="";
  }else{
    getElement("E02ISSFA1").style.display="";
    getElement("E02ISSRT1").style.display="none";
  }
  
  if (getElement("E02ISSFT2").value== '%'){
    getElement("E02ISSFA2").style.display="none";
    getElement("E02ISSRT2").style.display="";
  }else{
    getElement("E02ISSFA2").style.display="";
    getElement("E02ISSRT2").style.display="none";
  }
  
  if (getElement("E02ISSFT3").value== '%'){
    getElement("E02ISSFA3").style.display="none";
    getElement("E02ISSRT3").style.display="";
  }else{
    getElement("E02ISSFA3").style.display=""
    getElement("E02ISSRT3").style.display="none";
  }
  
  if (getElement("E02ISSFT4").value=='%'){
    getElement("E02ISSFA4").style.display="none";
    getElement("E02ISSRT4").style.display="";
  }else{
    getElement("E02ISSFA4").style.display="";
    getElement("E02ISSRT4").style.display="none";
  }
  
  if (getElement("E02ISSFT5").value== '%'){
    getElement("E02ISSFA5").style.display="none";
    getElement("E02ISSRT5").style.display="";
  }else{
    getElement("E02ISSFA5").style.display="";
    getElement("E02ISSRT5").style.display="none";
  }
  
  if (getElement("E02ISSFT6").value== '%'){
    getElement("E02ISSFA6").style.display="none";
    getElement("E02ISSRT6").style.display="";
  }else{
    getElement("E02ISSFA6").style.display="";
    getElement("E02ISSRT6").style.display="none";
  }
  
  if (getElement("E02ISSFT7").value=='%'){
    getElement("E02ISSFA7").style.display="none";
    getElement("E02ISSRT7").style.display="";
  }else{
    getElement("E02ISSFA7").style.display="";
    getElement("E02ISSRT7").style.display="none";
  }

    
  if (getElement("E02CNFFT1").value == '%'){
    getElement("E02CNFFA1").style.display="none";
    getElement("E02CNFRT1").style.display="";
  }else{
    getElement("E02CNFFA1").style.display="";
    getElement("E02CNFRT1").style.display="none";
  }
  
  if (getElement("E02CNFFT2").value== '%'){
    getElement("E02CNFFA2").style.display="none";
    getElement("E02CNFRT2").style.display="";
  }else{
    getElement("E02CNFFA2").style.display="";
    getElement("E02CNFRT2").style.display="none";
  }
  
  if (getElement("E02CNFFT3").value== '%'){
    getElement("E02CNFFA3").style.display="none";
    getElement("E02CNFRT3").style.display="";
  }else{
    getElement("E02CNFFA3").style.display="";
    getElement("E02CNFRT3").style.display="none";
  }
  
  if (getElement("E02CNFFT4").value=='%'){
    getElement("E02CNFFA4").style.display="none";
    getElement("E02CNFRT4").style.display="";
  }else{
    getElement("E02CNFFA4").style.display="";
    getElement("E02CNFRT4").style.display="none";
  }
  
  if (getElement("E02CNFFT5").value== '%'){
    getElement("E02CNFFA5").style.display="none";
    getElement("E02CNFRT5").style.display="";
  }else{
    getElement("E02CNFFA5").style.display="";
    getElement("E02CNFRT5").style.display="none";
  }
  
  if (getElement("E02CNFFT6").value== '%'){
    getElement("E02CNFFA6").style.display="none";
    getElement("E02CNFRT6").style.display="";
  }else{
    getElement("E02CNFFA6").style.display="";
    getElement("E02CNFRT6").style.display="none";
  }
  
  if (getElement("E02CNFFT7").value=='%'){
    getElement("E02CNFFA7").style.display="none";
    getElement("E02CNFRT7").style.display="";
  }else{
    getElement("E02CNFFA7").style.display="";
    getElement("E02CNFRT7").style.display="none";
  }
  
  
    if (getElement("E02EOVFT1").value == '%'){
    getElement("E02EOVFA1").style.display="none";
    getElement("E02EOVRT1").style.display="";
  }else{
    getElement("E02EOVFA1").style.display="";
    getElement("E02EOVRT1").style.display="none";
  }
  
  if (getElement("E02EOVFT2").value== '%'){
    getElement("E02EOVFA2").style.display="none";
    getElement("E02EOVRT2").style.display="";
  }else{
    getElement("E02EOVFA2").style.display="";
    getElement("E02EOVRT2").style.display="none";
  }
  
  if (getElement("E02EOVFT3").value== '%'){
    getElement("E02EOVFA3").style.display="none";
    getElement("E02EOVRT3").style.display="";
  }else{
    getElement("E02EOVFA3").style.display="";
    getElement("E02EOVRT3").style.display="none";
  }
  
  if (getElement("E02EOVFT4").value=='%'){
    getElement("E02EOVFA4").style.display="none"
    getElement("E02EOVRT4").style.display="";
  }else{
    getElement("E02EOVFA4").style.display="";
    getElement("E02EOVRT4").style.display="none";
  }
  
  if (getElement("E02EOVFT5").value== '%'){
    getElement("E02EOVFA5").style.display="none";
    getElement("E02EOVRT5").style.display="";
  }else{
    getElement("E02EOVFA5").style.display="";
    getElement("E02EOVRT5").style.display="none";
  }
  
  if (getElement("E02EOVFT6").value== '%'){
    getElement("E02EOVFA6").style.display="none";
    getElement("E02EOVRT6").style.display="";
  }else{
    getElement("E02EOVFA6").style.display="";
    getElement("E02EOVRT6").style.display="none";
  }
  
  if (getElement("E02EOVFT7").value=='%'){
    getElement("E02EOVFA7").style.display="none";
    getElement("E02EOVRT7").style.display="";
  }else{
    getElement("E02EOVFA7").style.display="";
    getElement("E02EOVRT7").style.display="none";
  }
  
   
  if (getElement("E02NEGFT1").value == '%'){
    getElement("E02NEGFA1").style.display="none";
    getElement("E02NEGRT1").style.display="";
  }else{
    getElement("E02NEGFA1").style.display="";
    getElement("E02NEGRT1").style.display="none";
  }
  
  if (getElement("E02NEGFT2").value== '%'){
    getElement("E02NEGFA2").style.display="none";
    getElement("E02NEGRT2").style.display="";
  }else{
    getElement("E02NEGFA2").style.display="";
    getElement("E02NEGRT2").style.display="none";
  }
  
  if (getElement("E02NEGFT3").value== '%'){
    getElement("E02NEGFA3").style.display="none";
    getElement("E02NEGRT3").style.display="";
  }else{
    getElement("E02NEGFA3").style.display="";
    getElement("E02NEGRT3").style.display="none";
  }
  
  if (getElement("E02NEGFT4").value=='%'){
    getElement("E02NEGFA4").style.display="none";
    getElement("E02NEGRT4").style.display="";
  }else{
    getElement("E02NEGFA4").style.display="";
    getElement("E02NEGRT4").style.display="none";
  }
  
  if (getElement("E02NEGFT5").value== '%'){
    getElement("E02NEGFA5").style.display="none";
    getElement("E02NEGRT5").style.display="";
  }else{
    getElement("E02NEGFA5").style.display="";
    getElement("E02NEGRT5").style.display="none";
  }
  
  if (getElement("E02NEGFT6").value== '%'){
    getElement("E02NEGFA6").style.display="none";
    getElement("E02NEGRT6").style.display="";
  }else{
    getElement("E02NEGFA6").style.display="";
    getElement("E02NEGRT6").style.display="none";
  }
  
  if (getElement("E02NEGFT7").value=='%'){
    getElement("E02NEGFA7").style.display="none";
    getElement("E02NEGRT7").style.display="";
  }else{
    getElement("E02NEGFA7").style.display="";
    getElement("E02NEGRT7").style.display="none";
  }
   
</script>


</html>
