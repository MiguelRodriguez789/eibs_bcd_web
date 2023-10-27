<!-- saved from url=(0022)http://internet.e-mail -->
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<%@ page import = "datapro.eibs.master.*" %>
<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>

<%@ page import = "datapro.eibs.master.Util" %>
<%@page import="com.datapro.constants.EibsFields"%>

<html>
<head>
<title>Mantenimiento Proyectos de Constructor</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<jsp:useBean id="pcMant" class="datapro.eibs.beans.EPC000001Message"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>
<jsp:useBean id= "currClient" class= "datapro.eibs.beans.ESD080001Message"  scope="session" />

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>


<SCRIPT type="text/javascript">

   builtNewMenu(pc_m_opt);



 function CheckSubmit(act)
{
   document.forms[0].ACTION.value=act;
   document.forms[0].submit();
}


</SCRIPT>


<% 
 String CUSCUN = "";
 String CUSNA1 = "";
 
 if (currClient != null && error.getERRNUM().equals("0")) {
    CUSCUN = currClient.getE01CUSCUN().trim();
    CUSNA1 = currClient.getE01CUSNA1().trim();
 } else {
    CUSCUN = pcMant.getE01PCMCUN().trim();
    CUSNA1 = pcMant.getD01PCMCUN().trim();
 }
 
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
<h3 align="center">Mantenimiento Proyectos de Constructor<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="pc_maint.jsp,EPC0000"> 
</h3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEPC0000" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="4">
  <INPUT TYPE=HIDDEN NAME="ACTION" VALUE="F">  
  <INPUT TYPE=HIDDEN NAME="SCRPCMBNK" value="<%= pcMant.getE01PCMBNK().trim()%>">
  <input type=HIDDEN name="E01PCMACD" value="<%= pcMant.getE01PCMACD().trim()%>">
  <input type=HIDDEN name="E01PCMGLN" value="<%= pcMant.getE01PCMGLN().trim()%>"">
  <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
          <tr id="trdark"> 
            <td nowrap width="10%" > 
              <div align="right"><b>No. de Cliente :</b></div>
            </td>
            <td nowrap width="30%"> 
              <div align="left"> 
                <eibsinput:text name="pcMant" property="E01PCMCUN" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CUSTOMER %>" readonly="true" />
               </div>
            </td>
            <td nowrap width="10%" > 
              <div align="right"><b>Nombre:</b></div>
            </td>
            <td nowrap colspan="3" width="50%"> 
              <div align="left"> 
                <eibsinput:text name="pcMant" property="D01PCMCUN" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true" />
              </div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap> 
              <div align="right"><b>Proyecto : </b></div>
            </td>
            <td nowrap> 
              <div align="left"> 
                <input type="text" readonly name="E01PCMACC" size="13" maxlength="12" value="<% if (pcMant.getE01PCMACC().trim().equals("999999999999")) out.print("CUENTA NUEVA"); else out.print(pcMant.getE01PCMACC().trim()); %>">
              </div>
            </td>
            <td nowrap> 
              <div align="right"><b>Moneda :</b></div>
            </td>
            <td nowrap width="20%"> 
              <div align="left"><b> 
                <eibsinput:text name="pcMant" property="E01PCMCCY" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CURRENCY %>" readonly="true"/>
          </b> </div>
            </td>
            <td nowrap width="10%"> 
              <div align="right"><b>Producto : </b></div>
            </td>
            <td nowrap width="20%"> 
              <div align="left"><b> 
                 <eibsinput:text name="pcMant" property="E01PCMPRO" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_PRODUCT%>" readonly="true" />
     	           </b> </div>
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
                <eibsinput:text name="pcMant" property="E01PCMNME" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_NAME_FULL %>" readonly="false" required="true"/>
         </td>
         <td nowrap width="25%"><div align="right"></div> 
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
                 <eibsinput:text name="pcMant" property="E01PCMAD1" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="false" required="true"/>

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
                 <eibsinput:text name="pcMant" property="E01PCMAD2" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="false" required="false"/>
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
               <eibsinput:text name="pcMant" property="E01PCMAD3" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="false" required="false"/>
            </td>
              <td nowrap width="25%"> 
            </td>
            <td nowrap width="25%"> 
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
               <eibsinput:cnofc name="pcMant" flag="27" property="E01PCMSTE" fn_description="" required="false"/>

            </td>
            <td nowrap width="13%"> 
              <div align="right">Codigo Area :</div>
            </td>
            <td nowrap width="20%"> 
                <eibsinput:text name="pcMant" property="E01PCMZPC" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_ZIPCODE %>" readonly="false" required="false"/>
           </td>
            <td nowrap width="13%"> 
              <div align="right">Apartado Postal :</div>
            </td>
            <td nowrap width="20%"> 
               <eibsinput:text name="pcMant" property="E01PCMPOB" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_PO_BOX%>" readonly="false" required="false"/>
           </td>
          </tr>


          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="25%"> 
              <div align="right">Ciudad :</div>
            </td>
            <td nowrap width="25%"> 
                <input type="text" name="E01PCMCTY" size="31" maxlength="30" value="<%= pcMant.getE01PCMCTY().trim()%>">
            </td>
            <td nowrap width="25%"> 
              <div align="right">Pais :</div>
            </td>
            <td nowrap width="25%"> 
              <input type="text" name="E01PCMCTR" size="21" maxlength="20" value="<%= pcMant.getE01PCMCTR().trim()%>">
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
            	<eibsinput:date name="pcMant" fn_month="E01PCMOPM" fn_day="E01PCMOPD" fn_year="E01PCMOPY" required="true"/>
            </td>
            <td nowrap width="25%"> 
              <div align="right">Fecha Limite Solicitud :</div>
            </td>
            <td nowrap width="27%"> 
            	<eibsinput:date name="pcMant" fn_month="E01PCMMAM" fn_day="E01PCMMAD" fn_year="E01PCMMAY" required="true"/>
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="20%"> 
              <div align="right">Valor Presupuesto :</div>
            </td>
            <td nowrap width="35%"> 
              <eibsinput:text name="pcMant" property="E01PCMVPR" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="false" required="true"/>
           </td>
            <td nowrap width="20%" height="37"> 
              <div align="right">Termino :</div>
            </td>
            <td nowrap width="35%" height="37"> 
             <input type="text" name="E01PCMTRM" size="6" maxlength="5" value="<%= pcMant.getE01PCMTRM().trim()%>" onkeypress="enterInteger(event)">
              <select name="E01PCMTRC">
                <option value=" " <% if (!(pcMant.getE01PCMTRC().equals("D") ||pcMant.getE01PCMTRC().equals("M")||pcMant.getE01PCMTRC().equals("Y"))) out.print("selected"); %>></option>
                <option value="D" <% if(pcMant.getE01PCMTRC().equals("D")) out.print("selected");%>>Día(s)</option>
                <option value="M" <% if(pcMant.getE01PCMTRC().equals("M")) out.print("selected");%>>Mes(s)</option>
                <option value="Y" <% if(pcMant.getE01PCMTRC().equals("Y")) out.print("selected");%>>Año(s)</option>
              </select>
              <img src="<%=request.getContextPath()%>/images/Check.gif" title="mandatory field" align="bottom" border="0" > 
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="25%" > 
              <div align="right">Valor Solicitado :</div>
            </td>
            <td nowrap width="23%" > 
              <eibsinput:text name="pcMant" property="E01PCMVSL" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="false" required="true"/>
           <td nowrap width="25%" >
              <div align="right">Unidades a Construir :</div>
            </td>
            <td nowrap width="27%" >
 				<input type="text" name="E01PCMUNI" size="5" maxlength="4" value="<%= pcMant.getE01PCMUNI().trim()%>" onKeypress="enterInteger(event)">
                <input type="text" name="E01PCMTUN" size="5" maxlength="4" value="<%= pcMant.getE01PCMTUN().trim()%>" >
                <a href="javascript:GetCodeCNOFC('E01PCMTUN','3D')"><img src="<%=request.getContextPath()%>/images/1b.gif" title=". . ." align="bottom" border="0" ></a> 
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="25%" > 
              <div align="right">Precio Promedio de Venta :</div>
            </td>
            <td nowrap width="23%" > 
            <eibsinput:text name="pcMant" property="E01PCMPPV" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="false" required="true"/>
            <td nowrap width="25%" >
              <div align="right">Porcentaje de Anticipo :</div>
            </td>
            <td nowrap width="27%" >
           <eibsinput:text name="pcMant" property="E01PCMPPR" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_PERCENTAGE %>" readonly="false" required="false"/>
 			</td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="25%" > 
              <div align="right">Participantes de Pool :</div>
            </td>
            <td nowrap width="23%" > 
              <input type="text" name="E01PCMPOL" size="3" maxlength="2" value="<%= pcMant.getE01PCMPOL().trim()%>" onkeypress="enterInteger(event)"></td>
            <td nowrap width="25%" >
              <div align="right">Tasa de Cambio :</div>
            </td>
            <td nowrap width="27%" >
           <eibsinput:text name="pcMant" property="E01PCMEXR" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_RATE%>" readonly="false" required="false"/>
 	         </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="25%" > 
              <div align="right">Centro de Costo :</div>
            </td>
            <td nowrap width="23%" > 
              <input type="text" name="E01PCMCCN" size="9" maxlength="8" value="<%= pcMant.getE01PCMCCN().trim()%>" onkeypress="enterInteger(event)">
              <a href="javascript:GetCostCenter('E01PCMCCN','01')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="ayuda" align="bottom" border="0" ></a>
			</td>
            <td nowrap width="25%" >
              <div align="right">Producto Para Credito :</div>
            </td>
            <td nowrap width="27%" >
              <input type="text" name="E01PCMPRD" size="5" maxlength="4" value="<%= pcMant.getE01PCMPRD().trim()%>" >
                <a href="javascript:GetProduct('E01PCMPRD','10','')"><img src="<%=request.getContextPath()%>/images/1b.gif" title=". . ." align="bottom" border="0" ></a> 
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="25%" > 
              <div align="right">Producto Para Anticipo :</div>
            </td>
            <td nowrap width="23%" > 
              <input type="text" name="E01PCMANP" size="5" maxlength="4" value="<%= pcMant.getE01PCMANP().trim()%>" >
                <a href="javascript:GetProduct('E01PCMANP','10','')"><img src="<%=request.getContextPath()%>/images/1b.gif" title=". . ." align="bottom" border="0" ></a> 
            </td>
            <td nowrap width="25%" >
              <div align="right">Producto Para Ampliación :</div>
            </td>
            <td nowrap width="27%" >
              <input type="text" name="E01PCMAMP" size="5" maxlength="4" value="<%= pcMant.getE01PCMAMP().trim()%>" >
                <a href="javascript:GetProduct('E01PCMAMP','10','')"><img src="<%=request.getContextPath()%>/images/1b.gif" title=". . ." align="bottom" border="0" ></a> 
            </td>
          </tr>

        </table>
      </td>
    </tr>
  </table>  

<%-- <SCRIPT type="text/javascript">
    function tableresize() {
     adjustEquTables(headTable,dataTable,dataDiv,0,true);
     adjustEquTables(headTable1,dataTable1,dataDiv1,0,false);
   }
  tableresize();
  window.onresize=tableresize;  
  </SCRIPT>
--%>
  <% 
		if (error.getERWRNG().equals("Y")) { 
				error.setERWRNG(" ");
	%>
			<h4 style="text-align:center"><input type="checkbox" name="H01FLGWK2" value="A">
      		Aceptar con Advertencias</h4>
	<% 
		} 
	%>
  <br>
  <div align="center"> 
	   <input id="EIBSBTN" type=button name="Submit" value="Enviar" onClick="CheckSubmit('F')">
  </div>  
  
  
  
  
</form>
</body>
</html>
