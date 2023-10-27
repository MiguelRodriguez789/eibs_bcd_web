<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@ page import = "datapro.eibs.master.Util" %>
<%@page import="com.datapro.constants.EibsFields"%>
<html>
<head>
<title>Mantenimiento Valuación</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<jsp:useBean id= "trans" class= "datapro.eibs.beans.ERA008401Message"  scope="session" /> 
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />
<jsp:useBean id= "transData" class= "datapro.eibs.beans.DataTransaction"  scope="session" /> 
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>
<%
	boolean b_read_only1 = "INQUIRY".equals(userPO.getPurpose())
								|| "APPROVE".equals(userPO.getPurpose());
	
	boolean list_1 = false;
	boolean list_2 = false;
	boolean list_3 = false;
	boolean list_4 = false;
	
	String read_only1 = "";
	String read_only2 = "false";
	String disabled1 = "";
	
	if (b_read_only1) {
		read_only1 = "readonly";
		disabled1 = "disabled";
	}
	
%>


<script type="text/javascript">
function initPage(){
	document.forms[0].E01HVAOBS.value = "<%=trans.getE01HVAOBS().trim()%>";
}

function submitThis(option) {
  document.forms[0].SCREEN.value = "2";
  document.forms[0].submit();		  	       	       
}

function hideDiv(fld, value){
 	if (value) {
   		fld.style.display = 'none';
   	} else {
   		fld.style.display = 'block';
   	}
}

function goList() {
  document.forms[0].SCREEN.value = "100";
  document.forms[0].submit();		  	       	       
}

</SCRIPT>  
</head>
<body onload="initPage()">

<h3 align="center">	<%if (!b_read_only1) {	%>
Mantenimiento Valuación
<%}else{	%>
Consulta Valuación
<%}%>
<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="valuation_maintenance, ERA0084"></h3>

<hr size="4">

<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSERA0084">
  <p> 
    <INPUT TYPE=HIDDEN NAME="CURRENTROW" id="CURRENTROW" VALUE="0"> 
    <INPUT TYPE=HIDDEN NAME="SCREEN" id="SCREEN" VALUE="2">
    <input type=HIDDEN name="opt" id="opt" >
    <INPUT TYPE=HIDDEN NAME="CONFIRM" VALUE="<%= userPO.getHeader12().trim() %>">
    <INPUT TYPE=HIDDEN NAME="E01HVAPRD" VALUE="<%=trans.getE01HVAPRD().trim()%>">
    <INPUT TYPE=HIDDEN NAME="D01HVAPRD" VALUE="<%=trans.getD01HVAPRD().trim()%>">
    <INPUT TYPE=HIDDEN NAME="E01HVATYP" VALUE="<%=trans.getE01HVATYP().trim()%>">
    <INPUT TYPE=HIDDEN NAME="D01HVATYP" VALUE="<%=trans.getD01HVATYP().trim()%>">
    <INPUT TYPE=HIDDEN NAME="H01FLGWK1" VALUE="<%=trans.getH01FLGWK1().trim()%>">
  </p>

<% 
String chk = "";

 if ( !error.getERRNUM().equals("0")  ) {
     error.setERRNUM("0");
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
     }

 	int row = 0;
%>

  <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
          <tr id="trdark">
            <td nowrap> 
              <div align="right"><b>Cliente : </b></div>
            </td>
            <td nowrap > 
              <div align="left"> 
                <input type="text" name="E01HVACUN" readonly size="11" maxlength="9" value="<%=trans.getE01HVACUN().trim()%>">
              </div>
            </td>
            <td nowrap> 
              <div align="right"><b>Nombre :</b> </div>
            </td>
            <td nowrap> 
              <div align="left">
                <input type="text" name="E01HVANA1" id="E01HVANA1" readonly size="60" maxlength="45" value="<%=trans.getE01HVANA1().trim()%>">
              </div>
            </td>
          </tr>
          <tr id="trclear">
            <td nowrap > 
              <div align="right"><b>No. Referencia : </b></div>
            </td>
            <td nowrap>
              <input type="text" name="E01HVAREF" id="E01HVAREF" size="14" maxlength="12" value="<%=trans.getE01HVAREF().trim()%>" readonly>
            </td> 
            <td nowrap> 
              <div align="right"><b>Moneda : </b></div>
            </td>
            <td nowrap> 
              <div align="left">
               <input type="text" name="E01HVACCY" id="E01HVACCY" size="4" maxlength="3" value="<%=trans.getE01HVACCY().trim()%>" readonly> 
              </div>
            </td>
           </tr>
          <tr id="trdark">             
            <td nowrap> 
              <div align="right"><b>Producto :</b> </div>
            </td>
            <td nowrap> 
              <div align="left">
                <input type="text" name="PRODUCT" size="38" value="<%=trans.getE01HVAPRD().trim()%> - <%=trans.getD01HVAPRD().trim()%>" readonly>                 
              </div>
            </td>
            <td nowrap> 
              <div align="right"><b>Tipo de Garantía :</b> </div>
            </td>
            <td nowrap> 
              <div align="left">
                <input type="text" name="TYPE" size="38" value="<%=trans.getE01HVATYP().trim()%> - <%=trans.getD01HVATYP().trim()%>" readonly>                 
              </div>
            </td>
          </tr>
          <tr id="trclear">             
            <td nowrap> 
              <div align="right"><b>Secuencia Bien :</b> </div>
            </td>
            <td nowrap> 
              <div align="left">
                <input type="text" name="E01HVASEQ" size="4" maxlength="4" value="<%=trans.getE01HVASEQ().trim()%>" readonly> 
              </div>
            </td>
            <td nowrap> 
              <div align="right"><b>Secuencia Avalúo :</b> </div>
            </td>
            <td nowrap> 
              <div align="left">
                <input type="text" name="E01HVASEA" size="4" maxlength="4" value="<%=trans.getE01HVASEA().trim()%>" readonly> 
              </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <br>
	<div id="Div1" style="display:'none'">
        <table cellspacing=0 cellpadding=2 width="100%" border="0" class="tbenter">
		  <tr>    
            <td nowrap align="center">
              <div align="center"><h3>Avalúo Actualizado. Pendiente de Aprobación.</h3></div>
            </td>
          </tr>
		</table>
	</div>          

  <h4>Informaci&oacute;n del Avalúo</h4>
      
  <table class="tableinfo" width="100%">
    <tr > 
      <td nowrap> 
        <table cellspacing=0 cellpadding=2 width="100%" border="0">
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap> 
              <div align="right">Fecha Vencimiento Actual del Avalúo : </div>
            </td>
            <td nowrap >
				<eibsinput:date name="trans" fn_year="E01HVAVAY" fn_month="E01HVAVAM" fn_day="E01HVAVAD" readonly="true"/>
            </td>
            <td nowrap> 
              <div align="right">Fecha Elaboración del Avalúo : </div>
            </td>
            <td nowrap >
				<eibsinput:date name="trans" fn_year="E01HVAFAY" fn_month="E01HVAFAM" fn_day="E01HVAFAD" required="true" 
					readonly="<%=b_read_only1%>"/>
            </td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap> 
              <div align="right">Próxima Fecha de Avalúo: </div>
            </td>
            <td nowrap >
				<eibsinput:date name="trans" fn_year="E01HVAFXY" fn_month="E01HVAFXM" fn_day="E01HVAFXD" required="true" 
					readonly="<%=b_read_only1%>"/>
            </td>
            <td nowrap >
              <div align="right">Coeficiente A Aplicar : </div>
            </td>
            <td nowrap >
             <eibsinput:text name="trans" property="E01HVACAP" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_RATE%>" 
             	readonly="<%=b_read_only1%>"/>
            </td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap> 
              <div align="right">Avalúo Anterior :</div>
            </td>
            <td nowrap >
             <eibsinput:text name="trans" property="E01HVAAPA" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT%>" readonly="true" />
            </td>
            <td nowrap> 
              <div align="right">Nuevo Avalúo :</div>
            </td>
            <td nowrap >
             <eibsinput:text name="trans" property="E01HVANAP" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT%>" required="true" 
             	readonly="<%=b_read_only1%>" />
            </td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap> 
              <div align="right">Avaluador : </div>
            </td>
            <td nowrap >

 				<%
 					if (!b_read_only1) {
 				%>
               <eibsinput:cnofc name="trans" flag="GU" property="E01HVACAV" fn_description="D01HVACAV" required="true"  
               	readonly="<%=b_read_only1%>"/>
				<%
					} else {
				%>
			   <eibsinput:text name="trans" property="E01HVACAV" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CNOFC%>" required="true" 
			   	readonly="<%=b_read_only1%>" />
				<%
					}
				%>
               <eibsinput:text name="trans" property="D01HVACAV" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_NAME_SHORT %>" readonly="true"/>
            </td>
            <td nowrap >
              <div align="right">Observaciones : </div>
            </td>
            <td nowrap >
				<TEXTAREA name="E01HVAOBS" rows="2" cols="55" onKeyDown="limitText(this.form.E01HVAOBS,200);"
				onKeyUp="limitText(this.form.E01HVAOBS,100);" <%=disabled1%> ><%=trans.getE01HVAOBS().trim() %>
			    </TEXTAREA>
            </td>
          </tr>
 				<%
 					if (b_read_only1) {
 				%>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap> 
              <div align="right">Usuario Operador :</div>
            </td>
            <td nowrap >
                <input type="text" name="E01HVAUSO" readonly size="12" maxlength="10" value="<%=trans.getE01HVAUSO().trim()%>">
            </td>
            <td nowrap> 
              <div align="right">Usuario Aprobador :</div>
            </td>
            <td nowrap >
                <input type="text" name="E01HVAUSA" readonly size="12" maxlength="10" value="<%=trans.getE01HVAUSA().trim()%>">
            </td>
          </tr>
				<%
					}
				%>
         </table>
      </td>
    </tr>
  </table>
  
  <table class="tbenter" width=100% align=center>
    <tr> 
	<%
	if (!b_read_only1) {
	%>
    <td class=TDBKG width="33%">
        <div align="center">
<%
	if (trans.getH01FLGWK1().trim().equals("1")) {
%>
        <a href="javascript:submitThis(7)"><b>Actualizar Avalúo</b></a>
<%
	} else {
%> 
        <a href="javascript:submitThis(7)"><b>Crear Avalúo</b></a>
	<%
	}
	%>
        </div> 
    </td> 
	<%
	}else{
	%>
      <td class=TDBKG width="33%"> 
        <div align="center">
        <a href="javascript:goList()"><b>Regresar</b></a>
		</div>
      </td>
	<%
	}
	%>
      <td class=TDBKG width="33%"> 
        <div align="center"><a href="<%=request.getContextPath()%>/pages/background.jsp"><b>Salir</b></a></div>
      </td>
    </tr>
  </table>
  

  <BR>

<SCRIPT type="text/javascript">
	hideDiv('Div1', <%=trans.getH01FLGWK1().trim().equals("0")%>) ;
</SCRIPT>

</form>
</body>
</html>