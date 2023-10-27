<!-- saved from url=(0022)http://internet.e-mail -->
<%@ page import = "datapro.eibs.beans.EPC008501Message" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>Calculo de Factores Proyecto de Constructor</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Studio">


<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>

<jsp:useBean id="pcMant" class="datapro.eibs.beans.EPC008501Message"  scope="session" />
<jsp:useBean id= "extList" class= "datapro.eibs.beans.JBObjList"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>



<SCRIPT type="text/javascript">
   builtNewMenu(pc_m_opt);
</SCRIPT>

<% 
 if ( !error.getERRNUM().equals("0")  ) {
     error.setERRNUM("0"); 
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
 }
  out.println("<SCRIPT> initMenu(); </SCRIPT>");

%>


</head>


<body>

<SCRIPT type="text/javascript">
   
function showProductData(obj){
   if (obj.checked) PRODUCTDATA.style.display=""; else {
    PRODUCTDATA.style.display="none";
   }
}
 
</SCRIPT>

<h3 align="center">Calculo de Factores Proyecto de Constructor<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="pc_maint_sch.jsp, EPC0085"></h3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEPC0085" id="form1">
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="4">
  <INPUT TYPE=HIDDEN NAME="OPT" VALUE="2">
<%--  <INPUT TYPE=HIDDEN NAME="ROW" VALUE="<%=row%>">  --%>
  <INPUT TYPE=HIDDEN NAME="E01DLSSEQ" VALUE="99">            
  <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
          <tr id="trdark"> 
            <td nowrap width="20%" > 
              <div align="right"><b>Número de Proyecto : </b></div>
            </td>
            <td nowrap width="30%" > 
              <div align="left"> 
                <input type="text" name="E01PCMACC" size="13" maxlength="12" value="<%= pcMant.getE01PCMACC().trim()%>" readonly>
              </div>
            </td>
            <td nowrap width="20%" > 
              <div align="right"><b>Cliente : </b></div>
            </td>
            <td nowrap width="5%" > 
              <div align="left"> 
                <input type="text" name="E01PCMCUN" size="11" maxlength="9" value="<%= pcMant.getE01PCMCUN().trim()%>" readonly>
              </div>
            </td>
            <td nowrap width="25%" > 
              <div align="left"> 
                <input type="text" name="D01PCMCUN" size="48" maxlength="45" value="<%= pcMant.getD01PCMCUN().trim()%>" readonly>
              </div>
            </td>

          </tr>
        </table>
      </td>
    </tr>
  </table>



  <h4> Información Proyecto</h4>
  
  <%int row = 0; %> 
  <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellpadding=2 cellspacing=0 width="100%" border="0">
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="25%"> 
              <div align="right">Nombre de Proyecto :</div>
            </td>
            <td nowrap width="25%"> 
              <input type="text" readonly name="E01PCMNME" size="47" maxlength="45" value="<%= pcMant.getE01PCMNME().trim()%>">
            </td>
            <td nowrap width="25%"> 
            </td>
            <td nowrap width="25%"> 
            </td>
            <td nowrap width="25%"> 
            </td>
            <td nowrap width="25%"> 
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="25%"> 
              <div align="right">Direccion Principal :</div>
            </td>
            <td nowrap width="25%"> 
              <input type="text" readonly name="E01PCMAD1" size="37" maxlength="35" value="<%= pcMant.getE01PCMAD1().trim()%>">
            </td>
            <td nowrap width="25%"> 
            </td>
            <td nowrap width="25%"> 
            </td>
            <td nowrap width="25%"> 
            </td>
            <td nowrap width="25%"> 
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="25%"> 
              <div align="right"> </div>
            </td>
            <td nowrap width="25%"> 
              <input type="text" readonly name="E01PCMAD2" size="37" maxlength="35" value="<%= pcMant.getE01PCMAD2().trim()%>">
            </td>
            <td nowrap width="25%"> 
            </td>
            <td nowrap width="25%"> 
            </td>
            <td nowrap width="25%"> 
            </td>
            <td nowrap width="25%"> 
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="25%"> 
              <div align="right"> </div>
            </td>
            <td nowrap width="25%"> 
              <input type="text" readonly name="E01PCMAD3" size="37" maxlength="35" value="<%= pcMant.getE01PCMAD3().trim()%>">
            </td>
            <td nowrap width="25%"> 
            </td>
            <td nowrap width="25%"> 
            </td>
            <td nowrap width="25%"> 
            </td>
            <td nowrap width="25%"> 
            </td>
          </tr>

          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="13%"> 
              <div align="right">Estado :</div>
            </td>
            <td nowrap width="20%"> 
              <input type="text" readonly name="E01PCMSTE" size="5" maxlength="4" value="<%= pcMant.getE01PCMSTE().trim()%>">
            </td>
            <td nowrap width="13%"> 
              <div align="right">Codigo Area :</div>
            </td>
            <td nowrap width="20%"> 
              <input type="text" readonly name="E01PCMZPC" size="11" maxlength="10" value="<%= pcMant.getE01PCMZPC().trim()%>">
            </td>
            <td nowrap width="13%"> 
              <div align="right">Apartado Postal :</div>
            </td>
            <td nowrap width="20%"> 
              <input type="text" readonly name="E01PCMPOB" size="11" maxlength="10" value="<%= pcMant.getE01PCMPOB().trim()%>">
            </td>
          </tr>


          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="15%"> 
              <div align="right">Ciudad :</div>
            </td>
            <td nowrap width="35%"> 
              <input type="text" readonly name="E01PCMCTY" size="31" maxlength="30" value="<%= pcMant.getE01PCMCTY().trim()%>">
            </td>
            <td nowrap width="15%"> 
              <div align="right">Pais :</div>
            </td>
            <td nowrap width="35%"> 
              <input type="text" readonly name="E01PCMCTR" size="21" maxlength="20" value="<%= pcMant.getE01PCMCTR().trim()%>">
            </td>
            <td nowrap width="25%"> 
            </td>
            <td nowrap width="25%"> 
            </td>
            <td nowrap width="25%"> 
            </td>

          </tr>


        </table>
      </td>
    </tr>
  </table>  



  <h4> Información Básica</h4> 
  <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellpadding=2 cellspacing=0 width="100%" border="0">
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="25%"> 
              <div align="right">Fecha de Apertura :</div>
            </td>
            <td nowrap width="23%"> 
              <input type="text" readonly name="E01PCMOPM" size="3" maxlength="2" value="<%= pcMant.getE01PCMOPM().trim()%>" onkeypress="enterInteger(event)">
              <input type="text" readonly name="E01PCMOPD" size="3" maxlength="2" value="<%= pcMant.getE01PCMOPD().trim()%>" onkeypress="enterInteger(event)">
              <input type="text" readonly name="E01PCMOPY" size="5" maxlength="4" value="<%= pcMant.getE01PCMOPY().trim()%>" onkeypress="enterInteger(event)">
            </td>
            <td nowrap width="25%"> 
              <div align="right">Fecha Limite Solicitud :</div>
            </td>
            <td nowrap width="27%"> 
              <input type="text" readonly name="E01PCMMAM" size="3" maxlength="2" value="<%= pcMant.getE01PCMMAM().trim()%>" onkeypress="enterInteger(event)">
              <input type="text" readonly name="E01PCMMAD" size="3" maxlength="2" value="<%= pcMant.getE01PCMMAD().trim()%>" onkeypress="enterInteger(event)">
              <input type="text" readonly name="E01PCMMAY" size="5" maxlength="4" value="<%= pcMant.getE01PCMMAY().trim()%>" onkeypress="enterInteger(event)">
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="20%"> 
              <div align="right">Valor Presupuesto :</div>
            </td>
            <td nowrap width="35%"> 
              <input type="text" readonly name="E01PCMVPR" size="17" maxlength="15" value="<%= pcMant.getE01PCMVPR().trim()%>" onkeypress="enterDecimal()">
            </td>
            <td nowrap width="20%" height="37"> 
              <div align="right">Termino :</div>
            </td>
            <td nowrap width="35%" height="37"> 
             <input type="text" readonly name="E01PCMTRM" size="6" maxlength="5" value="<%= pcMant.getE01PCMTRM().trim()%>" onkeypress="enterInteger(event)">
             <input type="text" readonly name="E01PCMTRC" size="10" 
				  value="<% if (pcMant.getE01PCMTRC().equals("D")) out.print("D&iacute;a(s)");
							else if (pcMant.getE01PCMTRC().equals("M")) out.print("Mes(es)");
							else if (pcMant.getE01PCMTRC().equals("Y")) out.print("A&ntilde;o(s)");
							else out.print("");%>" 
				>
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="25%" > 
              <div align="right">Valor Solicitado :</div>
            </td>
            <td nowrap width="23%" > 
              <input type="text" readonly name="E01PCMVSL" size="17" maxlength="15" value="<%= pcMant.getE01PCMVSL().trim()%>" onkeypress="enterDecimal()">
            <td nowrap width="25%" >
              <div align="right">Unidades a Construir :</div>
            </td>
            <td nowrap width="27%" >
 				<input type="text" readonly name="E01PCMUNI" size="5" maxlength="4" value="<%= pcMant.getE01PCMUNI().trim()%>" onKeypress="enterInteger(event)">
                <input type="text" readonly name="E01PCMTUN" size="5" maxlength="4" value="<%= pcMant.getE01PCMTUN().trim()%>" >
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="25%" > 
              <div align="right">Precio Promedio de Venta :</div>
            </td>
            <td nowrap width="23%" > 
              <input type="text" readonly name="E01PCMPPV" size="17" maxlength="15" value="<%= pcMant.getE01PCMPPV().trim()%>" onkeypress="enterDecimal()">
            <td nowrap width="25%" >
              <div align="right">Porcentaje de Anticipo :</div>
            </td>
            <td nowrap width="27%" >
				<input type="text" readonly name="E01PCMPPR" size="9" maxlength="8" value="<%= pcMant.getE01PCMPPR().trim()%>" onKeypress="enterDecimal()">
			</td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="25%" > 
              <div align="right">Participantes de Pool :</div>
            </td>
            <td nowrap width="23%" > 
              <input type="text" readonly name="E01PCMPOL" size="3" maxlength="2" value="<%= pcMant.getE01PCMPOL().trim()%>" onkeypress="enterInteger(event)"></td>
            <td nowrap width="25%" >
              <div align="right">Tasa de Cambio :</div>
            </td>
            <td nowrap width="27%" >
              <input type="text" readonly name="E01PCMEXR" size="10" maxlength="9" value="<%= pcMant.getE01PCMEXR().trim()%>" onkeypress="enterDecimal()">
             </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="25%" > 
              <div align="right">Centro de Costo :</div>
            </td>
            <td nowrap width="23%" > 
              <input type="text" readonly name="E01PCMCN" size="9" maxlength="8" value="<%= pcMant.getE01PCMCCN().trim()%>" onkeypress="enterInteger(event)"></td>
            <td nowrap width="25%" >
              <div align="right">Producto Para Credito :</div>
            </td>
            <td nowrap width="27%" >
              <input type="text" readonly name="E01PCMPRD" size="5" maxlength="4" value="<%= pcMant.getE01PCMPRD().trim()%>" >
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="25%" > 
              <div align="right">Producto Para Anticipo :</div>
            </td>
            <td nowrap width="23%" > 
              <input type="text" readonly name="E01PCMANP" size="5" maxlength="4" value="<%= pcMant.getE01PCMANP().trim()%>" >
            </td>
            <td nowrap width="25%" >
              <div align="right">Producto Para Ampliación :</div>
            </td>
            <td nowrap width="27%" >
              <input type="text" readonly name="E01PCMAMP" size="5" maxlength="4" value="<%= pcMant.getE01PCMAMP().trim()%>" >
            </td>
          </tr>

        </table>
      </td>
    </tr>
  </table>  

<table class="tbenter">
<tr>
  <TD>   
   <b>Calculo de Factores                   </b>
  </TD>
  <TD>
   <b>Información Adicional de Producto</b><input type="checkbox" name="PRODUCT" value="" onclick="showProductData(this)">    
  </TD>
  </tr>
</table>
<table class="tbenter" cellpadding=3>
<tr>
 <TD valign=top>
  <h4> </h4>
  <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing=0 cellpadding=2 width="100%" border="0">
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="40%"> 
              <div align="right">Amortización Anticipo :</div>
            </td>
            <td nowrap width="60%"> 
              <input type="text" name="E01PCMFAP" size="20" maxlength="18" value="<%= pcMant.getE01PCMFAP().trim()%>" onKeypress="enterDecimal()">
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="40%"> 
              <div align="right">Inversión Previa :</div>
            </td>
            <td nowrap width="60%"> 
              <input type="text" name="E01PCMINP" size="16" maxlength="15" value="<%= pcMant.getE01PCMINP().trim()%>" onKeypress="enterDecimal()">
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="40%"> 
              <div align="right">Factor Inversión Previa :</div>
            </td>
            <td nowrap width="60%"> 
              <input type="text" name="E01PCMFIP" size="20" maxlength="18" value="<%= pcMant.getE01PCMFIP().trim()%>" onKeypress="enterDecimal()">
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="40%"> 
              <div align="right">Honorarios Inspección :</div>
            </td>
            <td nowrap width="60%"> 
              <input type="text" name="E01PCMTHO" size="16" maxlength="15" value="<%= pcMant.getE01PCMTHO().trim()%>" onKeypress="enterDecimal()">
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="40%"> 
              <div align="right">Asignación Básica Mensual :</div>
            </td>
            <td nowrap width="60%"> 
              <input type="text" name="E01PCMABM" size="16" maxlength="15" value="<%= pcMant.getE01PCMABM().trim()%>" onKeypress="enterDecimal()">
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="40%"> 
              <div align="right">Factor Honorarios :</div>
            </td>
            <td nowrap width="60%"> 
              <input type="text" name="E01PCMFHO" size="20" maxlength="18" value="<%= pcMant.getE01PCMFHO().trim()%>" onKeypress="enterDecimal()">
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="40%"> 
              <div align="right">Volumen Global de Ventas :</div>
            </td>
            <td nowrap width="60%"> 
              <input type="text" name="E01PCMVGV" size="16" maxlength="15" value="<%= pcMant.getE01PCMVGV().trim()%>" onKeypress="enterDecimal()">
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="40%"> 
              <div align="right">Alícuota de Amortización :</div>
            </td>
            <td nowrap width="60%"> 
              <input type="text" name="E01PCMALA" size="20" maxlength="18" value="<%= pcMant.getE01PCMALA().trim()%>" onKeypress="enterDecimal()">
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="40%"> 
              <div align="right">Monto a Descontar por Inmueble :</div>
            </td>
            <td nowrap width="60%"> 
              <input type="text" name="E01PCMMDI" size="16" maxlength="15" value="<%= pcMant.getE01PCMMDI().trim()%>" onKeypress="enterDecimal()">
            </td>
          </tr>

        </table>
       </td>
      </tr>
    </table>
  </TD>
  <TD valign=top>
    <div id="PRODUCTDATA" style="display:none">
    <h4> </h4>
    <table class="tableinfo">
     <tr > 
      <td nowrap>    
        <table cellspacing=0 cellpadding=2 width="100%" border="0">
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="39%"> 
              <div align="right">Fondo Nacional de Vivienda :</div>
            </td>
            <td nowrap width="61%">
              <input type="text" readonly name="E01APACNV" size="16" maxlength="15" value="<%= pcMant.getE01APACNV().trim()%>" onKeypress="enterDecimal()">
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="39%">
              <div align="right">Anticipo :</div>
            </td>
            <td nowrap width="61%">
              <input type="text" readonly name="E01APAANT" size="16" maxlength="15" value="<%= pcMant.getE01APAANT().trim()%>" onKeypress="enterInteger(event)">
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="39%"> 
              <div align="right">Prima Fondo Garantía :</div>
            </td>
            <td nowrap width="61%">
              <input type="text" readonly name="E01APAPFG" size="16" maxlength="15" value="<%= pcMant.getE01APAPFG().trim()%>" onKeypress="enterDecimal()">
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="39%"> 
              <div align="right">Fianza Garantía :</div>
            </td>
            <td nowrap width="61%">
              <input type="text" readonly name="E01APAGRF" size="16" maxlength="15" value="<%= pcMant.getE01APAGRF().trim()%>" onKeypress="enterDecimal()">
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="39%"> 
              <div align="right">Honorarios Inspección :</div>
            </td>
            <td nowrap width="61%">
              <input type="text" readonly name="E01APAHOI" size="16" maxlength="15" value="<%= pcMant.getE01APAHOI().trim()%>" onKeypress="enterDecimal()">
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="39%"> 
              <div align="right">Comisión Valuación :</div>
            </td>
            <td nowrap width="61%">
              <input type="text" readonly name="E01APAFLA" size="16" maxlength="15" value="<%= pcMant.getE01APAFLA().trim()%>" onKeypress="enterDecimal()">
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="39%"> 
              <div align="right">Producto Crédito :</div>
            </td>
            <td nowrap width="61%">
              <input type="text" readonly name="E01APAPRD" size="5" maxlength="4" value="<%= pcMant.getE01APAPRD().trim()%>">
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="39%"> 
              <div align="right">Producto Anticipo :</div>
            </td>
            <td nowrap width="61%">
              <input type="text" readonly name="E01APAANP" size="5" maxlength="4" value="<%= pcMant.getE01APAANP().trim()%>">
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="39%"> 
              <div align="right">Producto Ampliación :</div>
            </td>
            <td nowrap width="61%">
              <input type="text" readonly name="E01APAAMP" size="5" maxlength="4" value="<%= pcMant.getE01APAAMP().trim()%>">
            </td>
          </tr>

        </table>
                
      	</td>
      </tr>
  	</table>
   <p>
   </div>
  </TD>
 </tr>
</table>
  


  <p>
  <div align="center"> 
    <input id="EIBSBTN" type=submit name="Submit" value="Enviar">
  </div>
</form>
</body>
</html>
