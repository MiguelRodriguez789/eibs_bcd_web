<%@ page import = "datapro.eibs.beans.EPC006501Message" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>Otorgamiento de Créditos Sobre Proyecto</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Studio">


<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.js"> </SCRIPT>

<jsp:useBean id= "extList" class= "datapro.eibs.beans.JBObjList"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>

</head>

<body >

<% 
 if ( !error.getERRNUM().equals("0")  ) {
     error.setERRNUM("0"); 
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
 }
 	int row;
	try {
		row = Integer.parseInt(request.getParameter("ROW"));
	} 
	catch (Exception e) {
		row = 0;
	}
	extList.setCurrentRow(row);
	EPC006501Message pcMant = (EPC006501Message) extList.getRecord();
%>



<h3 align="center">Otorgamiento de Anticipo Sobre Proyecto<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="pc_maint_sch.jsp, EPC0065"></h3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEPC0065" id="form1">
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="2">
  <INPUT TYPE=HIDDEN NAME="OPT" VALUE="2">
  <INPUT TYPE=HIDDEN NAME="ROW" VALUE="<%=row%>">  
  <INPUT TYPE=HIDDEN NAME="E01DLSSEQ" VALUE="99">            
  <table class="tableinfo">
          <tr id="trdark"> 
            <td nowrap width="20%" > 
              <div align="right"><b>Número de Proyecto : </b></div>
            </td>
            <td nowrap width="30%" > 
              <div align="left"> 
                <input type="text" name="E01PCMACC" size="12" maxlength="12" value="<%= pcMant.getE01PCMACC().trim()%>" readonly>
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


  <h4> Información Proyecto</h4> 
  <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellpadding=2 cellspacing=0 width="100%" border="0">
          <tr id="trdark"> 
            <td nowrap width="25%"> 
              <div align="right">Nombre de Proyecto :</div>
            </td>
            <td nowrap width="75%"> 
              <input type="text" readonly name="E01PCMNME" size="47" maxlength="45" value="<%= pcMant.getE01PCMNME().trim()%>">
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="25%"> 
              <div align="right">Direccion Principal :</div>
            </td>
            <td nowrap width="75%"> 
              <input type="text" readonly name="E01PCMAD1" size="37" maxlength="35" value="<%= pcMant.getE01PCMAD1().trim()%>">
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="25%"> 
              <div align="right"> </div>
            </td>
            <td nowrap width="75%"> 
              <input type="text" readonly name="E01PCMAD2" size="37" maxlength="35" value="<%= pcMant.getE01PCMAD2().trim()%>">
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="25%"> 
              <div align="right"> </div>
            </td>
            <td nowrap width="75%"> 
              <input type="text" readonly name="E01PCMAD3" size="37" maxlength="35" value="<%= pcMant.getE01PCMAD3().trim()%>">
            </td>
          </tr>

          <tr id="trdark"> 
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


          <tr id="trclear"> 
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
          <tr id="trdark"> 
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
          <tr id="trclear"> 
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
          <tr id="trdark"> 
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
          <tr id="trclear"> 
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
          <tr id="trdark"> 
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
          <tr id="trclear"> 
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
          <tr id="trdark"> 
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


  <h4>Confirmación</h4>
  <table class="tableinfo">
    <tr > 
      <td> 
        <table cellspacing=0 cellpadding=2 width="100%" border="0" id="INFOCHG">

          <tr id="trdark"> 
            <td width="30%"> 
              <div align="right">Otorgar Anticipo :</div>
            </td>
            <td width="70%">
              <input type="hidden" name="E01PROYON">
              <input type="radio" name="CE01PROYON" value="Y" onClick="document.forms[0].E01PROYON.value='Y'"
			  <%if(pcMant.getE01PROYON().equals("Y")) out.print("checked");%>>S&iacute; 
              <input type="radio" name="CE01PROYON" value="N" onClick="document.forms[0].E01PROYON.value='N'"
			  <%if(pcMant.getE01PROYON().equals("N")) out.print("checked");%>>No             
            </td>
          </tr>

        </table>                       
      </td>
    </tr>
  </table>

  <p>
  <div align="center"> 
    <input id="EIBSBTN" type=submit name="Submit" value="Enviar">
  </div>
</form>
</body>
</html>
