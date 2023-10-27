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

</head>

<body >

<SCRIPT type="text/javascript">

   builtNewMenu(pc_i_opt);
   
function showProductData(obj){
   if (obj.checked) PRODUCTDATA.style.display=""; else {
    PRODUCTDATA.style.display="none";
   }
}

  
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



<h3 align="center">Factores Proyecto de Constructor - Consulta<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="pc_maint_sch_inq.jsp, EPC0085"></h3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEPC0085" id="form1">
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="600">
  <INPUT TYPE=HIDDEN NAME="OPT" VALUE="2">
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
          <tr id="trdark"> 
            <td nowrap width="40%"> 
              <div align="right">Amortización Anticipo :</div>
            </td>
            <td nowrap width="60%"> 
              <input type="text" readonly name="E01PCMFAP" size="20" maxlength="18" value="<%= pcMant.getE01PCMFAP().trim()%>" onKeypress="enterDecimal()">
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="40%"> 
              <div align="right">Inversión Previa :</div>
            </td>
            <td nowrap width="60%"> 
              <input type="text" readonly name="E01PCMINP" size="16" maxlength="15" value="<%= pcMant.getE01PCMINP().trim()%>" onKeypress="enterDecimal()">
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="40%"> 
              <div align="right">Factor Inversión Previa :</div>
            </td>
            <td nowrap width="60%"> 
              <input type="text" readonly name="E01PCMFIP" size="20" maxlength="18" value="<%= pcMant.getE01PCMFIP().trim()%>" onKeypress="enterDecimal()">
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="40%"> 
              <div align="right">Honorarios Inspección :</div>
            </td>
            <td nowrap width="60%"> 
              <input type="text" readonly name="E01PCMTHO" size="16" maxlength="15" value="<%= pcMant.getE01PCMTHO().trim()%>" onKeypress="enterDecimal()">
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="40%"> 
              <div align="right">Asignación Básica Mensual :</div>
            </td>
            <td nowrap width="60%"> 
              <input type="text" readonly name="E01PCMABM" size="16" maxlength="15" value="<%= pcMant.getE01PCMABM().trim()%>" onKeypress="enterDecimal()">
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="40%"> 
              <div align="right">Factor Honorarios :</div>
            </td>
            <td nowrap width="60%"> 
              <input type="text" readonly name="E01PCMFHO" size="20" maxlength="18" value="<%= pcMant.getE01PCMFHO().trim()%>" onKeypress="enterDecimal()">
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="40%"> 
              <div align="right">Volumen Global de Ventas :</div>
            </td>
            <td nowrap width="60%"> 
              <input type="text" readonly name="E01PCMVGV" size="16" maxlength="15" value="<%= pcMant.getE01PCMVGV().trim()%>" onKeypress="enterDecimal()">
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="40%"> 
              <div align="right">Alícuota de Amortización :</div>
            </td>
            <td nowrap width="60%"> 
              <input type="text" readonly name="E01PCMALA" size="20" maxlength="18" value="<%= pcMant.getE01PCMALA().trim()%>" onKeypress="enterDecimal()">
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="40%"> 
              <div align="right">Monto a Descontar por Inmueble :</div>
            </td>
            <td nowrap width="60%"> 
              <input type="text" readonly name="E01PCMMDI" size="16" maxlength="15" value="<%= pcMant.getE01PCMMDI().trim()%>" onKeypress="enterDecimal()">
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
          <tr id="trdark"> 
            <td nowrap width="39%"> 
              <div align="right">Fondo Nacional de Vivienda :</div>
            </td>
            <td nowrap width="61%">
              <input type="text" readonly name="E01APACNV" size="16" maxlength="15" value="<%= pcMant.getE01APACNV().trim()%>" onKeypress="enterDecimal()">
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="39%">
              <div align="right">Anticipo :</div>
            </td>
            <td nowrap width="61%">
              <input type="text" readonly name="E01APAANT" size="16" maxlength="15" value="<%= pcMant.getE01APAANT().trim()%>" onKeypress="enterInteger(event)">
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="39%"> 
              <div align="right">Prima Fondo Garantía :</div>
            </td>
            <td nowrap width="61%">
              <input type="text" readonly name="E01APAPFG" size="16" maxlength="15" value="<%= pcMant.getE01APAPFG().trim()%>" onKeypress="enterDecimal()">
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="39%"> 
              <div align="right">Fianza Garantía :</div>
            </td>
            <td nowrap width="61%">
              <input type="text" readonly name="E01APAGRF" size="16" maxlength="15" value="<%= pcMant.getE01APAGRF().trim()%>" onKeypress="enterDecimal()">
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="39%"> 
              <div align="right">Honorarios Inspección :</div>
            </td>
            <td nowrap width="61%">
              <input type="text" readonly name="E01APAHOI" size="16" maxlength="15" value="<%= pcMant.getE01APAHOI().trim()%>" onKeypress="enterDecimal()">
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="39%"> 
              <div align="right">Comisión Valuación :</div>
            </td>
            <td nowrap width="61%">
              <input type="text" readonly name="E01APAFLA" size="16" maxlength="15" value="<%= pcMant.getE01APAFLA().trim()%>" onKeypress="enterDecimal()">
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="39%"> 
              <div align="right">Producto Crédito :</div>
            </td>
            <td nowrap width="61%">
              <input type="text" readonly name="E01APAPRD" size="5" maxlength="4" value="<%= pcMant.getE01APAPRD().trim()%>">
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="39%"> 
              <div align="right">Producto Anticipo :</div>
            </td>
            <td nowrap width="61%">
              <input type="text" readonly name="E01APAANP" size="5" maxlength="4" value="<%= pcMant.getE01APAANP().trim()%>">
            </td>
          </tr>
          <tr id="trdark"> 
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
</form>
</body>
</html>
