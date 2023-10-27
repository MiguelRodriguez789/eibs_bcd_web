<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ page import = "datapro.eibs.beans.EPC004501Message" %>
<%@ page import = "datapro.eibs.master.*" %>
<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@ page import = "datapro.eibs.master.Util" %>
<%@page import="com.datapro.constants.EibsFields"%>


<html>
<head>
<title>Cambio de Status de Proyecto</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Studio">


<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.js"> </SCRIPT>

<jsp:useBean id= "extList" class= "datapro.eibs.beans.JBObjList"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>

</head>

<body>

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
	EPC004501Message pcMant = (EPC004501Message) extList.getRecord();
	request.setAttribute("pcMant",pcMant);
%>


<h3 align="center">Cambio de Status de Proyecto<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="pc_maint_sch.jsp, EPC0045"></h3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEPC0045" id="form1">
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="2">
  <INPUT TYPE=HIDDEN NAME="OPT" VALUE="2">
  <INPUT TYPE=HIDDEN NAME="ROW" VALUE="<%=row%>">  
  <INPUT TYPE=HIDDEN NAME="E01DLSSEQ" VALUE="99">            
  <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
          <tr id="trdark"> 
            <td nowrap width="25%" > 
              <div align="right"><b>Número de Proyecto : </b></div>
            </td>
            <td nowrap width="15%" > 
              <div align="left"> 
                <input type="text" name="E01PCDACC" size="12" maxlength="12" value="<%= userPO.getIdentifier().trim()%>" readonly>
              </div>
            </td>
            <td nowrap width="5%" > 
              <div align="right"><b>Cliente : </b></div>
            </td>
            <td nowrap width="45%" > 
              <div align="left"> 
                <input type="text" name="E01PCDCUN" size="11" maxlength="9" value="<%= userPO.getCusNum().trim()%>" readonly>
                <input type="text" name="D01PCDCUN" size="48" maxlength="45" value="<%= userPO.getCusName().trim()%>" readonly>
              </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>



  <h4> Información Proyecto</h4> 
  
  <%int row1 = 0; %>
  <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellpadding=2 cellspacing=0 width="100%" border="0">
          <tr id="<%= (row1 % 2 == 1) ? "trdark" : "trclear" %><%row1++;%>"> 
            <td nowrap width="25%"> 
              <div align="right">Nombre de Proyecto :</div>
            </td>
            <td nowrap width="25%"> 
               <eibsinput:text name="pcMant" property="E01PCMNME" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_NAME %>" readonly="true" />
            </td>
            <td nowrap width="25%" >
			</td>
            <td nowrap width="25%" >
			</td>
            <td nowrap width="25%" >
			</td>
            <td nowrap width="25%" >
			</td>
          </tr>
          <tr id="<%= (row1 % 2 == 1) ? "trdark" : "trclear" %><%row1++;%>"> 
            <td nowrap width="25%"> 
              <div align="right">Direccion Principal :</div>
            </td>
            <td nowrap width="25%"> 
                   <eibsinput:text name="pcMant" property="E01PCMAD1" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true" />
            </td>
            <td nowrap width="25%" >
			</td>
            <td nowrap width="25%" >
			</td>
            <td nowrap width="25%" >
			</td>
            <td nowrap width="25%" >
			</td>
          </tr>
          <tr id="<%= (row1 % 2 == 1) ? "trdark" : "trclear" %><%row1++;%>"> 
            <td nowrap width="25%"> 
              <div align="right"> </div>
            </td>
            <td nowrap width="25%"> 
                    <eibsinput:text name="pcMant" property="E01PCMAD2" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true" />
            </td>
            <td nowrap width="25%" >
			</td>
            <td nowrap width="25%" >
			</td>
            <td nowrap width="25%" >
			</td>
            <td nowrap width="25%" >
			</td>
          </tr>
          <tr id="<%= (row1 % 2 == 1) ? "trdark" : "trclear" %><%row1++;%>"> 
            <td nowrap width="25%"> 
              <div align="right"> </div>
            </td>
            <td nowrap width="25%"> 
                    <eibsinput:text name="pcMant" property="E01PCMAD3" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true" />
            </td>
            <td nowrap width="25%" >
			</td>
            <td nowrap width="25%" >
			</td>
            <td nowrap width="25%" >
			</td>
            <td nowrap width="25%" >
			</td>
          </tr>

          <tr id="<%= (row1 % 2 == 1) ? "trdark" : "trclear" %><%row1++;%>"> 
            <td nowrap width="13%"> 
              <div align="right">Estado :</div>
            </td>
            <td nowrap width="25%"> 
              <input type="text" readonly name="E01PCMSTE" size="5" maxlength="4" value="<%= pcMant.getE01PCMSTE().trim()%>">
            </td>
            <td nowrap width="13%"> 
              <div align="right">Codigo Area :</div>
            </td>
            <td nowrap width="25%"> 
                     <eibsinput:text name="pcMant" property="E01PCMZPC" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_ZIPCODE %>" readonly="true" />
            </td>
            <td nowrap width="13%"> 
              <div align="right">Apartado Postal :</div>
            </td>
            <td nowrap width="25%"> 
                     <eibsinput:text name="pcMant" property="E01PCMPOB" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_PO_BOX %>" readonly="true" />
            </td>
          </tr>


          <tr id="<%= (row1 % 2 == 1) ? "trdark" : "trclear" %><%row1++;%>"> 
            <td nowrap width="15%"> 
              <div align="right">Ciudad :</div>
            </td>
            <td nowrap width="25%"> 
              <input type="text" readonly name="E01PCMCTY" size="31" maxlength="30" value="<%= pcMant.getE01PCMCTY().trim()%>">
            </td>
            <td nowrap width="15%"> 
              <div align="right">Pais :</div>
            </td>
            <td nowrap width="25%"> 
              <input type="text" readonly name="E01PCMCTR" size="21" maxlength="20" value="<%= pcMant.getE01PCMCTR().trim()%>">
            </td>
            <td nowrap width="25%" >
			</td>
            <td nowrap width="25%" >
			</td>
            <td nowrap width="25%" >
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
          <tr id="<%= (row1 % 2 == 1) ? "trdark" : "trclear" %><%row1++;%>"> 
            <td nowrap width="25%" height="33"> 
              <div align="right">Fecha de Apertura :</div>
            </td>
            <td nowrap width="25%" height="33"> 
              <input type="text" readonly name="E01PCMOPM" size="3" maxlength="2" value="<%= pcMant.getE01PCMOPM().trim()%>" onkeypress="enterInteger(event)">
              <input type="text" readonly name="E01PCMOPD" size="3" maxlength="2" value="<%= pcMant.getE01PCMOPD().trim()%>" onkeypress="enterInteger(event)">
              <input type="text" readonly name="E01PCMOPY" size="5" maxlength="4" value="<%= pcMant.getE01PCMOPY().trim()%>" onkeypress="enterInteger(event)">
            </td>
            <td nowrap width="25%" height="33"> 
              <div align="right">Fecha Limite Solicitud :</div>
            </td>
            <td nowrap width="25%" height="33"> 
              <input type="text" readonly name="E01PCMMAM" size="3" maxlength="2" value="<%= pcMant.getE01PCMMAM().trim()%>" onkeypress="enterInteger(event)">
              <input type="text" readonly name="E01PCMMAD" size="3" maxlength="2" value="<%= pcMant.getE01PCMMAD().trim()%>" onkeypress="enterInteger(event)">
              <input type="text" readonly name="E01PCMMAY" size="5" maxlength="4" value="<%= pcMant.getE01PCMMAY().trim()%>" onkeypress="enterInteger(event)">
            </td>
          </tr>
          <tr id="<%= (row1 % 2 == 1) ? "trdark" : "trclear" %><%row1++;%>"> 
            <td nowrap width="25%" height="30"> 
              <div align="right">Valor Presupuesto :</div>
            </td>
            <td nowrap width="25%" height="30"> 
                   <eibsinput:text name="pcMant" property="E01PCMVPR" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true" />
            </td>
            <td nowrap width="25%" height="30"> 
              <div align="right">Termino :</div>
            </td>
            <td nowrap width="25%" height="30"> 
             <input type="text" readonly name="E01PCMTRM" size="6" maxlength="5" value="<%= pcMant.getE01PCMTRM().trim()%>" onkeypress="enterInteger(event)">
             <input type="text" readonly name="E01PCMTRC" size="10" 
				  value="<% if (pcMant.getE01PCMTRC().equals("D")) out.print("D&iacute;a(s)");
							else if (pcMant.getE01PCMTRC().equals("M")) out.print("Mes(es)");
							else if (pcMant.getE01PCMTRC().equals("Y")) out.print("A&ntilde;o(s)");
							else out.print("");%>" 
				>
            </td>
          </tr>
          <tr id="<%= (row1 % 2 == 1) ? "trdark" : "trclear" %><%row1++;%>"> 
            <td nowrap width="25%" > 
              <div align="right">Valor Solicitado :</div>
            </td>
            <td nowrap width="25%" > 
                   <eibsinput:text name="pcMant" property="E01PCMVSL" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true" />
            </td>       
            <td nowrap width="25%" >
              <div align="right">Unidades a Construir :</div>
            </td>
            <td nowrap width="25%" >
 				<input type="text" readonly name="E01PCMUNI" size="5" maxlength="4" value="<%= pcMant.getE01PCMUNI().trim()%>" onKeypress="enterInteger(event)">
                <input type="text" readonly name="E01PCMTUN" size="5" maxlength="4" value="<%= pcMant.getE01PCMTUN().trim()%>" >
            </td>
          </tr>
          <tr id="<%= (row1 % 2 == 1) ? "trdark" : "trclear" %><%row1++;%>"> 
            <td nowrap width="25%" > 
              <div align="right">Precio Promedio de Venta :</div>
            </td>
            <td nowrap width="25%" > 
                   <eibsinput:text name="pcMant" property="E01PCMPPV" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true" />
            </td>       
            <td nowrap width="25%" >
              <div align="right">Porcentaje de Anticipo :</div>
            </td>
            <td nowrap width="25%" >
	      		  <eibsinput:text name="pcMant" property="E01PCMPPR" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_PERCENTAGE%>" readonly="true" />
			</td>
          </tr>
          <tr id="<%= (row1 % 2 == 1) ? "trdark" : "trclear" %><%row1++;%>"> 
            <td nowrap width="25%" > 
              <div align="right">Participantes de Pool :</div>
            </td>
            <td nowrap width="25%" > 
              <input type="text" readonly name="E01PCMPOL" size="3" maxlength="2" value="<%= pcMant.getE01PCMPOL().trim()%>" onkeypress="enterInteger(event)">
            </td>
            <td nowrap width="25%" >
              <div align="right">Tasa de Cambio :</div>
            </td>
            <td nowrap width="25%" >
 	         	<eibsinput:text name="pcMant" property="E01PCMEXR" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_RATE%>" readonly="true" />
             </td>
          </tr>
          <tr id="<%= (row1 % 2 == 1) ? "trdark" : "trclear" %><%row1++;%>"> 
            <td nowrap width="25%" > 
              <div align="right">Centro de Costo :</div>
            </td>
            <td nowrap width="25%" > 
              <input type="text" readonly name="E01PCMCN" size="9" maxlength="8" value="<%= pcMant.getE01PCMCCN().trim()%>" onkeypress="enterInteger(event)">
            </td>
            <td nowrap width="25%" >
              <div align="right">Producto Para Credito :</div>
            </td>
            <td nowrap width="25%" >
              <input type="text" readonly name="E01PCMPRD" size="5" maxlength="4" value="<%= pcMant.getE01PCMPRD().trim()%>" >
            </td>
          </tr>
          <tr id="<%= (row1 % 2 == 1) ? "trdark" : "trclear" %><%row1++;%>"> 
            <td nowrap width="25%" > 
              <div align="right">Producto Para Anticipo :</div>
            </td>
            <td nowrap width="25%" > 
              <input type="text" readonly name="E01PCMANP" size="5" maxlength="4" value="<%= pcMant.getE01PCMANP().trim()%>" >
            </td>
            <td nowrap width="25%" >
              <div align="right">Producto Para Ampliación :</div>
            </td>
            <td nowrap width="25%" >
              <input type="text" readonly name="E01PCMAMP" size="5" maxlength="4" value="<%= pcMant.getE01PCMAMP().trim()%>" >
            </td>
          </tr>

        </table>
      </td>
    </tr>
  </table>  


  <h4>Actualizacion de Status</h4>
  <table class="tableinfo">
    <tr > 
      <td> 
        <table cellspacing=0 cellpadding=2 width="100%" border="0" id="INFOCHG">

          <tr id="<%= (row1 % 2 == 1) ? "trdark" : "trclear" %><%row1++;%>"> 
            <td width="30%"> 
              <div align="right">Status Actual :</div>
            </td>
            <td width="70%"> 

             <input type="text" readonly name="E01PCMSTA" size="16" 
				  value="<% if 		(pcMant.getE01PCMSTA().equals("01")) out.print("Solicitud")		;
							else if (pcMant.getE01PCMSTA().equals("02")) out.print("En Trámite")		;
							else if (pcMant.getE01PCMSTA().equals("03")) out.print("Aprobado")		;
							else if (pcMant.getE01PCMSTA().equals("04")) out.print("Rechazado")		;	
							else if (pcMant.getE01PCMSTA().equals("06")) out.print("Programado")		;
							else if (pcMant.getE01PCMSTA().equals("12")) out.print("Protocolizado")	;
							else out.print("");%>" 
				>
							
							
            </td>
          </tr>

          <tr id="<%= (row1 % 2 == 1) ? "trdark" : "trclear" %><%row1++;%>"> 
            <td width="30%"> 
              <div align="right">Nuevo Status :</div>
            </td>
            <td width="70%"> 
              <select name="E01PCMNEW">
  				<option value=" " <% if (!(pcMant.getE01PCMNEW().equals("01")||pcMant.getE01PCMNEW().equals("02")||pcMant.getE01PCMNEW().equals("03")||pcMant.getE01PCMNEW().equals("04")||pcMant.getE01PCMNEW().equals("06")||pcMant.getE01PCMNEW().equals("12"))) out.print("selected"); %>></option>
                <option value="01" <% if(pcMant.getE01PCMNEW().equals("01")) out.print("selected");%>>Solicitud</option>
                <option value="02" <% if(pcMant.getE01PCMNEW().equals("02")) out.print("selected");%>>En Trámite</option>
                <option value="03" <% if(pcMant.getE01PCMNEW().equals("03")) out.print("selected");%>>Aprobado</option>
                <option value="04" <% if(pcMant.getE01PCMNEW().equals("04")) out.print("selected");%>>Rechazado</option>
                <option value="06" <% if(pcMant.getE01PCMNEW().equals("06")) out.print("selected");%>>Programado</option>
                <option value="12" <% if(pcMant.getE01PCMNEW().equals("12")) out.print("selected");%>>Protocolizado</option>
              </select>

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
