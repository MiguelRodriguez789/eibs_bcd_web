<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput"%>
<%@page import="com.datapro.constants.EibsFields"%>
<%@page import="com.datapro.eibs.constants.HelpTypes"%>
<html>
<head>

<META name="GENERATOR" content="IBM WebSphere Page Designer V4.0 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<title>Comisiones-Definición de Escalas/Tramos</title>
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "Scale" class= "datapro.eibs.beans.ESD020301Message"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>


<script type="text/javascript">

function CheckAcc(){
	//document.forms[0].SCREEN.value = screen;
	document.forms[0].submit();
}


function ShowTitles() {
	if (document.forms[0].E01DDTTYP.value == 'N') {	

		document.getElementById("qty1").style.display = 'table-cell';
		document.getElementById("amt1").style.display = 'none';
		document.getElementById("cob1").style.display = 'none';
		document.getElementById("plz1").style.display = 'none';
		document.getElementById("qty2").style.display = 'table-cell';
		document.getElementById("amt2").style.display = 'none';
		document.getElementById("cob2").style.display = 'none';
		document.getElementById("plz2").style.display = 'none';

	} else if (document.forms[0].E01DDTTYP.value == 'A') {

		document.getElementById("qty1").style.display = 'none';
		document.getElementById("amt1").style.display = 'table-cell';
		document.getElementById("cob1").style.display = 'none';
		document.getElementById("plz1").style.display = 'none';
		document.getElementById("qty2").style.display = 'none';
		document.getElementById("amt2").style.display = 'table-cell';
		document.getElementById("cob2").style.display = 'none';
		document.getElementById("plz2").style.display = 'none';

	} else if (document.forms[0].E01DDTTYP.value == 'C') {

		document.getElementById("qty1").style.display = 'none';
		document.getElementById("amt1").style.display = 'none';
		document.getElementById("cob1").style.display = 'table-cell';
		document.getElementById("plz1").style.display = 'none';
		document.getElementById("qty2").style.display = 'none';
		document.getElementById("amt2").style.display = 'none';
		document.getElementById("cob2").style.display = 'table-cell';
		document.getElementById("plz2").style.display = 'none';

	} else {

		document.getElementById("qty1").style.display = 'none';
		document.getElementById("amt1").style.display = 'none';
		document.getElementById("cob1").style.display = 'none';
		document.getElementById("plz1").style.display = 'table-cell';
		document.getElementById("qty2").style.display = 'none';
		document.getElementById("amt2").style.display = 'none';
		document.getElementById("cob2").style.display = 'none';
		document.getElementById("plz2").style.display = 'table-cell';

	}

}

 
function ShowTitles1(tit) {
	if (tit == 'N') {	

		document.getElementById("qty1").style.display = 'table-cell';
		document.getElementById("amt1").style.display = 'none';
		document.getElementById("cob1").style.display = 'none';
		document.getElementById("plz1").style.display = 'none';
		document.getElementById("qty2").style.display = 'table-cell';
		document.getElementById("amt2").style.display = 'none';
		document.getElementById("cob2").style.display = 'none';
		document.getElementById("plz2").style.display = 'none';

	} else if (tit == 'A') {

		document.getElementById("qty1").style.display = 'none';
		document.getElementById("amt1").style.display = 'table-cell';
		document.getElementById("cob1").style.display = 'none';
		document.getElementById("plz1").style.display = 'none';
		document.getElementById("qty2").style.display = 'none';
		document.getElementById("amt2").style.display = 'table-cell';
		document.getElementById("cob2").style.display = 'none';
		document.getElementById("plz2").style.display = 'none';

	} else if (tit == 'C') {

		document.getElementById("qty1").style.display = 'none';
		document.getElementById("amt1").style.display = 'none';
		document.getElementById("cob1").style.display = 'table-cell';
		document.getElementById("plz1").style.display = 'none';
		document.getElementById("qty2").style.display = 'none';
		document.getElementById("amt2").style.display = 'none';
		document.getElementById("cob2").style.display = 'table-cell';
		document.getElementById("plz2").style.display = 'none';

	} else {

		document.getElementById("qty1").style.display = 'none';
		document.getElementById("amt1").style.display = 'none';
		document.getElementById("cob1").style.display = 'none';
		document.getElementById("plz1").style.display = 'table-cell';
		document.getElementById("qty2").style.display = 'none';
		document.getElementById("amt2").style.display = 'none';
		document.getElementById("cob2").style.display = 'none';
		document.getElementById("plz2").style.display = 'table-cell';
	}
}

 
function ShowFields() {
	if (document.forms[0].E01DDTMTH.value == 'F') {	
		document.getElementById("subtitle1").style.display = 'block';
		document.getElementById("E01DDTAM1").style.display = 'block';
		document.getElementById("E01DDTAM2").style.display = 'block';
		document.getElementById("E01DDTAM3").style.display = 'block';
		document.getElementById("E01DDTAM4").style.display = 'block';
		document.getElementById("E01DDTAM5").style.display = 'block';
		document.getElementById("E01DDTAM6").style.display = 'block';
		document.getElementById("E01DDTAM7").style.display = 'block';
		document.getElementById("E01DDTAM8").style.display = 'block';
		document.getElementById("E01DDTAM9").style.display = 'block';
		document.getElementById("E01DDTAM0").style.display = 'block';
		document.getElementById("subtitle2").style.display = 'none';
		document.getElementById("E01DDTPO1").style.display = 'none';
		document.getElementById("E01DDTPO2").style.display = 'none';
		document.getElementById("E01DDTPO3").style.display = 'none';
		document.getElementById("E01DDTPO4").style.display = 'none';
		document.getElementById("E01DDTPO5").style.display = 'none';
		document.getElementById("E01DDTPO6").style.display = 'none';
		document.getElementById("E01DDTPO7").style.display = 'none';
		document.getElementById("E01DDTPO8").style.display = 'none';
		document.getElementById("E01DDTPO9").style.display = 'none';
		document.getElementById("E01DDTPO0").style.display = 'none';

	} else {
		document.getElementById("subtitle1").style.display = 'none';
		document.getElementById("E01DDTAM1").style.display = 'none';
		document.getElementById("E01DDTAM2").style.display = 'none';
		document.getElementById("E01DDTAM3").style.display = 'none';
		document.getElementById("E01DDTAM4").style.display = 'none';
		document.getElementById("E01DDTAM5").style.display = 'none';
		document.getElementById("E01DDTAM6").style.display = 'none';
		document.getElementById("E01DDTAM7").style.display = 'none';
		document.getElementById("E01DDTAM8").style.display = 'none';
		document.getElementById("E01DDTAM9").style.display = 'none';
		document.getElementById("E01DDTAM0").style.display = 'none';
		document.getElementById("subtitle2").style.display = 'block';
		document.getElementById("E01DDTPO1").style.display = 'block';
		document.getElementById("E01DDTPO2").style.display = 'block';
		document.getElementById("E01DDTPO3").style.display = 'block';
		document.getElementById("E01DDTPO4").style.display = 'block';
		document.getElementById("E01DDTPO5").style.display = 'block';
		document.getElementById("E01DDTPO6").style.display = 'block';
		document.getElementById("E01DDTPO7").style.display = 'block';
		document.getElementById("E01DDTPO8").style.display = 'block';
		document.getElementById("E01DDTPO9").style.display = 'block';
		document.getElementById("E01DDTPO0").style.display = 'block';
	}
	ShowTitles();
}

 
function ShowFields1(val) {
	if (val == 'F') {	
		document.getElementById("subtitle1").style.display = 'block';
		document.getElementById("E01DDTAM1").style.display = 'block';
		document.getElementById("E01DDTAM2").style.display = 'block';
		document.getElementById("E01DDTAM3").style.display = 'block';
		document.getElementById("E01DDTAM4").style.display = 'block';
		document.getElementById("E01DDTAM5").style.display = 'block';
		document.getElementById("E01DDTAM6").style.display = 'block';
		document.getElementById("E01DDTAM7").style.display = 'block';
		document.getElementById("E01DDTAM8").style.display = 'block';
		document.getElementById("E01DDTAM9").style.display = 'block';
		document.getElementById("E01DDTAM0").style.display = 'block';
		document.getElementById("subtitle2").style.display = 'none';
		document.getElementById("E01DDTPO1").style.display = 'none';
		document.getElementById("E01DDTPO2").style.display = 'none';
		document.getElementById("E01DDTPO3").style.display = 'none';
		document.getElementById("E01DDTPO4").style.display = 'none';
		document.getElementById("E01DDTPO5").style.display = 'none';
		document.getElementById("E01DDTPO6").style.display = 'none';
		document.getElementById("E01DDTPO7").style.display = 'none';
		document.getElementById("E01DDTPO8").style.display = 'none';
		document.getElementById("E01DDTPO9").style.display = 'none';
		document.getElementById("E01DDTPO0").style.display = 'none';

	} else {
		document.getElementById("subtitle1").style.display = 'none';
		document.getElementById("E01DDTAM1").style.display = 'none';
		document.getElementById("E01DDTAM2").style.display = 'none';
		document.getElementById("E01DDTAM3").style.display = 'none';
		document.getElementById("E01DDTAM4").style.display = 'none';
		document.getElementById("E01DDTAM5").style.display = 'none';
		document.getElementById("E01DDTAM6").style.display = 'none';
		document.getElementById("E01DDTAM7").style.display = 'none';
		document.getElementById("E01DDTAM8").style.display = 'none';
		document.getElementById("E01DDTAM9").style.display = 'none';
		document.getElementById("E01DDTAM0").style.display = 'none';
		document.getElementById("subtitle2").style.display = 'block';
		document.getElementById("E01DDTPO1").style.display = 'block';
		document.getElementById("E01DDTPO2").style.display = 'block';
		document.getElementById("E01DDTPO3").style.display = 'block';
		document.getElementById("E01DDTPO4").style.display = 'block';
		document.getElementById("E01DDTPO5").style.display = 'block';
		document.getElementById("E01DDTPO6").style.display = 'block';
		document.getElementById("E01DDTPO7").style.display = 'block';
		document.getElementById("E01DDTPO8").style.display = 'block';
		document.getElementById("E01DDTPO9").style.display = 'block';
		document.getElementById("E01DDTPO0").style.display = 'block';
	}
}

</SCRIPT>  


<script src="<%=request.getContextPath()%>/jquery/readOnlyPage.jsp"> </script>

 
</head>

<body  onload="ShowFields();" bgcolor="#FFFFFF">

<%
	if (!error.getERRNUM().equals("0")) {
		error.setERRNUM("0");
		out.println("<SCRIPT Language=\"Javascript\">");
		out.println("       showErrors()");
		out.println("</SCRIPT>");
	}
%> 
 
 
<h3 align="center">Comisiones-Definición de Escalas/Tramos<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="rt_scale_detail, ESD0203" ></h3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.params.JSESD0203">

    <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="103">
    
  <h4> </h4>
  
  <% int row = 0; %>
  <table class="tableinfo">
          <tr > 
        <td nowrap> 
          
        <table cellspacing="0" cellpadding="2" width="100%" border="0" align="left" >

          <tr id="<%=(row % 2 == 1) ? "trclear" : "trdark"%><%row++;%>"> 
            <td nowrap width="25%"> 
              <div align="right">Banco :</div>
            </td>
            <td nowrap> 
              <div align="left"> 
                <input type="text" name="E01DDTBNK" readonly size="3" maxlength="2" value="<%=userPO.getBank().trim()%>">
              </div>
            </td>
            
            <td nowrap width="25%">
              <div align="right">Código de Escala:</div>
            </td>
            <td nowrap>
            <% if(userPO.getPurpose().equals("NEW")) {%>
                <input type="text" name="E01DDTCDE" size="5" maxlength="4" value="<%=Scale.getE01DDTCDE().trim()%>">
                   <%}else {%>
                <input type="text" name="E01DDTCDE" readonly size="5" maxlength="4" value="<%=Scale.getE01DDTCDE().trim()%>">
             <%}%>   
            </td>
            <td nowrap width="25%">
              <div align="right">Sucursal:</div>
            </td>
            <td nowrap>
            <% if(userPO.getPurpose().equals("NEW")) {%>
                <input type="text" name="E01DDTBRN" size="5" maxlength="4" value="<%=Scale.getE01DDTBRN().trim()%>">
                 <a href="javascript:GetBranch('E01DDTBRN','')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="bottom" border="0" ></a>
                     <%}else {%>
                <input type="text" name="E01DDTBRN" readonly size="5" maxlength="4" value="<%=Scale.getE01DDTBRN().trim()%>">
             <%}%>   
            </td>
          </tr>


        </table>
        </td>
      </tr>


</table>
    
    
  <h4><b>Información Básica</b></h4>
  <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" align="left" >
          <tr id="<%=(row % 2 == 1) ? "trclear" : "trdark"%><%row++;%>"> 
            <td nowrap width="20%"> 
              <div align="right">Descripcion :</div>
            </td>
            <td nowrap width="30%">
              <div align="left"> 
                <input type="text" name="E01DDTDSC" size="65" maxlength="60" value="<%=Scale.getE01DDTDSC()%>">
              </div>
            </td>
            <td nowrap width="20%"> 
              <div align="right">Estado :</div>
            </td>
			<td width="30%">
               	     <select name="E01DDTSTS" >
				           <option value=" " <% if (!(Scale.getE01DDTSTS().equals("A") ||Scale.getE01DDTSTS().equals("I")||Scale.getE01DDTSTS().equals("C"))) 
				           out.print("selected"); %>>
				           </option>
                           <option value="A" <%if (Scale.getE01DDTSTS().equals("A")) out.print("selected"); %>>Activo</option>
                           <option value="I" <%if (Scale.getE01DDTSTS().equals("I")) out.print("selected"); %>>Inactivo</option>
                           <option value="C" <%if (Scale.getE01DDTSTS().equals("C")) out.print("selected"); %>>Cerrado</option>
                       </select>
			</td>
          </tr>


          <tr id="<%=(row % 2 == 1) ? "trclear" : "trdark"%><%row++;%>"> 
            <td nowrap width="20%"> 
              <div align="right">Valores :</div>
            </td>
			<td width="30%">
                <select name="E01DDTTYP"  onclick="ShowTitles()">
                  <option value=" " <% if (!(Scale.getE01DDTTYP().equals("N") || Scale.getE01DDTTYP().equals("A")|| Scale.getE01DDTTYP().equals("C") || Scale.getE01DDTTYP().equals("P")))
                   out.print("selected"); %>></option>
                  <option value="N" <% if(Scale.getE01DDTTYP().equals("N")) out.print("selected");%>>Cantidad</OPTION>
                  <option value="A" <% if(Scale.getE01DDTTYP().equals("A")) out.print("selected");%>>Montos</OPTION>
                  <option value="C" <% if(Scale.getE01DDTTYP().equals("C")) out.print("selected");%>>% Cobertura</OPTION>
                  <option value="P" <% if(Scale.getE01DDTTYP().equals("P")) out.print("selected");%>>Plazo (Dias)</OPTION>
                </select>
			</td>
            <td nowrap width="20%"> 
              <div align="right">Metodo de cobro :</div>
            </td>
            <td nowrap width="30%" >
				<input type="radio" name="E01DDTMTH" value="F" onClick="ShowFields1('F')"<%if (Scale.getE01DDTMTH().equals("F")) out.print("checked"); %> > Monto Fijo  
				<input type="radio" name="E01DDTMTH" value="%" onClick="ShowFields1('%')"<%if (Scale.getE01DDTMTH().equals("%")) out.print("checked"); %> > Porcentaje
			</td>
          </tr>

        </table>
      </td>
    </tr>
  </table>



  <h4>Tramos/Escala</h4>
  <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" align="left" >

          <tr id="title1" class="<%=(row % 2 == 1) ? "trclear" : "trdark"%><%row++;%>"> 

            <td nowrap width="25%" id="qty1"> 
              <div align="center"><b>Cantidad Inicial</b></div>
            </td>
            <td nowrap width="25%" id="qty2"> 
              <div align="center"><b>Cantidad Final</b></div>
            </td>

            <td nowrap width="25%" id="amt1"> 
              <div align="center"><b>Valor Inicial</b></div>
            </td>
            <td nowrap width="25%" id="amt2"> 
              <div align="center"><b>Valor Final</b></div>
            </td>

            <td nowrap width="25%" id="cob1"> 
              <div align="center"><b>% Cobertura Inicial</b></div>
            </td>
            <td nowrap width="25%" id="cob2"> 
              <div align="center"><b>% Cobertura Final</b></div>
            </td>

            <td nowrap width="25%" id="plz1"> 
              <div align="center"><b>Plazo Inicial</b></div>
            </td>
            <td nowrap width="25%" id="plz2"> 
              <div align="center"><b>Plazo Final</b></div>
            </td>

            <td nowrap width="25%" id="subtitle1"  style="display: none;"> 
              <div align="center"><b>Monto Comision</b></div>
            </td>
            <td nowrap width="25%" id="subtitle2"  style="display: none;"> 
              <div align="center"><b>Porcentaje Comision</b></div>
            </td>
          </tr>


          <tr id="<%=(row % 2 == 1) ? "trclear" : "trdark"%><%row++;%>"> 
            <td nowrap width="25%"> 
              <div align="center"> 
<%--                 <input type="text" name="E01DDTMI1" size="18" maxlength="17" value="<%=Scale.getE01DDTMI1()%>" onKeypress="enterDecimal(event, 2)"> --%>
                <eibsinput:text property="E01DDTMI1" name="Scale" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" />
              </div>
            </td>
            <td nowrap width="25%"> 
              <div align="center"> 
<%--                 <input type="text" name="E01DDTMX1" size="14" maxlength="13" value="<%=Scale.getE01DDTMX1()%>" onKeypress="enterDecimal(event, 2)"> --%>
                <eibsinput:text property="E01DDTMX1" name="Scale" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" />
              </div>
            </td>
            <td nowrap width="25%" id="E01DDTAM1"  style="display: none;"> 
              <div align="center"> 
<%--                 <input type="text" name="E01DDTAM1" size="14" maxlength="13" value="<%=Scale.getE01DDTAM1()%>" onKeypress="enterDecimal(event, 2)"> --%>
                <eibsinput:text property="E01DDTAM1" name="Scale" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" />
              </div>
            </td>
            <td nowrap width="25%" id="E01DDTPO1"  style="display: none;"> 
              <div align="center"> 
<%--                 <input type="text" name="E01DDTPO1" size="7" maxlength="6" value="<%=Scale.getE01DDTPO1()%>" onKeypress="enterDecimal(event, 3)"> --%>
                <eibsinput:text property="E01DDTPO1" name="Scale" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_PERCENTAGE %>" />
              </div>
            </td>
          </tr>


          <tr id="<%=(row % 2 == 1) ? "trclear" : "trdark"%><%row++;%>"> 
            <td nowrap width="25%"> 
              <div align="center"> 
<%--                 <input type="text" name="E01DDTMI2" size="14" maxlength="13" value="<%=Scale.getE01DDTMI2()%>" onKeypress="enterDecimal(event, 2)"> --%>
                <eibsinput:text property="E01DDTMI2" name="Scale" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" />
              </div>
            </td>
            <td nowrap width="25%"> 
              <div align="center"> 
<%--                 <input type="text" name="E01DDTMX2" size="14" maxlength="13" value="<%=Scale.getE01DDTMX2()%>" onKeypress="enterDecimal(event, 2)"> --%>
                <eibsinput:text property="E01DDTMX2" name="Scale" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" />
              </div>
            </td>
            <td nowrap width="25%" id="E01DDTAM2"  style="display: none;"> 
              <div align="center"> 
<%--                 <input type="text" name="E01DDTAM2" size="14" maxlength="13" value="<%=Scale.getE01DDTAM2()%>" onKeypress="enterDecimal(event, 2)"> --%>
                <eibsinput:text property="E01DDTAM2" name="Scale" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" />
              </div>
            </td>
            <td nowrap width="25%" id="E01DDTPO2"  style="display: none;"> 
              <div align="center"> 
<%--                 <input type="text" name="E01DDTPO2" size="7" maxlength="6" value="<%=Scale.getE01DDTPO2()%>" onKeypress="enterDecimal(event, 3)"> --%>
                <eibsinput:text property="E01DDTPO2" name="Scale" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_PERCENTAGE %>" />
              </div>
            </td>
          </tr>


          <tr id="<%=(row % 2 == 1) ? "trclear" : "trdark"%><%row++;%>"> 
            <td nowrap width="25%"> 
              <div align="center"> 
<%--                 <input type="text" name="E01DDTMI3" size="14" maxlength="13" value="<%=Scale.getE01DDTMI3()%>" onKeypress="enterDecimal(event, 2)"> --%>
                <eibsinput:text property="E01DDTMI3" name="Scale" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" />
              </div>
            </td>
            <td nowrap width="25%"> 
              <div align="center"> 
<%--                 <input type="text" name="E01DDTMX3" size="14" maxlength="13" value="<%=Scale.getE01DDTMX3()%>" onKeypress="enterDecimal(event, 2)"> --%>
                <eibsinput:text property="E01DDTMX3" name="Scale" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" />
              </div>
            </td>
            <td nowrap width="25%" id="E01DDTAM3"  style="display: none;"> 
              <div align="center"> 
<%--                 <input type="text" name="E01DDTAM3" size="14" maxlength="13" value="<%=Scale.getE01DDTAM3()%>" onKeypress="enterDecimal(event, 2)"> --%>
                <eibsinput:text property="E01DDTAM3" name="Scale" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" />
              </div>
            </td>
            <td nowrap width="25%" id="E01DDTPO3"  style="display: none;"> 
              <div align="center"> 
<%--                 <input type="text" name="E01DDTPO3" size="7" maxlength="6" value="<%=Scale.getE01DDTPO3()%>" onKeypress="enterDecimal(event, 3)"> --%>
                <eibsinput:text property="E01DDTPO3" name="Scale" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_PERCENTAGE %>" />
              </div>
            </td>
          </tr>

          <tr id="<%=(row % 2 == 1) ? "trclear" : "trdark"%><%row++;%>"> 
            <td nowrap width="25%"> 
              <div align="center"> 
<%--                 <input type="text" name="E01DDTMI4" size="14" maxlength="13" value="<%=Scale.getE01DDTMI4()%>" onKeypress="enterDecimal(event, 2)"> --%>
                <eibsinput:text property="E01DDTMI4" name="Scale" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" />
              </div>
            </td>
            <td nowrap width="25%"> 
              <div align="center"> 
<%--                 <input type="text" name="E01DDTMX4" size="14" maxlength="13" value="<%=Scale.getE01DDTMX4()%>" onKeypress="enterDecimal(event, 2)"> --%>
                <eibsinput:text property="E01DDTMX4" name="Scale" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" />
              </div>
            </td>
            <td nowrap width="25%" id="E01DDTAM4"  style="display: none;"> 
              <div align="center"> 
<%--                 <input type="text" name="E01DDTAM4" size="14" maxlength="13" value="<%=Scale.getE01DDTAM4()%>" onKeypress="enterDecimal(event, 2)"> --%>
                <eibsinput:text property="E01DDTAM4" name="Scale" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" />
              </div>
            </td>
            <td nowrap width="25%" id="E01DDTPO4"  style="display: none;"> 
              <div align="center"> 
<%--                 <input type="text" name="E01DDTPO4" size="7" maxlength="6" value="<%=Scale.getE01DDTPO4()%>" onKeypress="enterDecimal(event, 3)"> --%>
                <eibsinput:text property="E01DDTPO4" name="Scale" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_PERCENTAGE %>" />
              </div>
            </td>
          </tr>


          <tr id="<%=(row % 2 == 1) ? "trclear" : "trdark"%><%row++;%>"> 
            <td nowrap width="25%"> 
              <div align="center"> 
<%--                 <input type="text" name="E01DDTMI5" size="14" maxlength="13" value="<%=Scale.getE01DDTMI5()%>" onKeypress="enterDecimal(event, 2)"> --%>
                <eibsinput:text property="E01DDTMI5" name="Scale" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" />
              </div>
            </td>
            <td nowrap width="25%"> 
              <div align="center"> 
<%--                 <input type="text" name="E01DDTMX5" size="14" maxlength="13" value="<%=Scale.getE01DDTMX5()%>" onKeypress="enterDecimal(event, 2)"> --%>
                <eibsinput:text property="E01DDTMX5" name="Scale" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" />
              </div>
            </td>
            <td nowrap width="25%" id="E01DDTAM5"  style="display: none;"> 
              <div align="center"> 
<%--                 <input type="text" name="E01DDTAM5" size="14" maxlength="13" value="<%=Scale.getE01DDTAM5()%>" onKeypress="enterDecimal(event, 2)"> --%>
                <eibsinput:text property="E01DDTAM5" name="Scale" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" />
              </div>
            </td>
            <td nowrap width="25%" id="E01DDTPO5"  style="display: none;"> 
              <div align="center"> 
<%--                 <input type="text" name="E01DDTPO5" size="7" maxlength="6" value="<%=Scale.getE01DDTPO5()%>" onKeypress="enterDecimal(event, 3)"> --%>
                <eibsinput:text property="E01DDTPO5" name="Scale" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_PERCENTAGE %>" />
              </div>
            </td>
          </tr>


          <tr id="<%=(row % 2 == 1) ? "trclear" : "trdark"%><%row++;%>"> 
            <td nowrap width="25%"> 
              <div align="center"> 
<%--                 <input type="text" name="E01DDTMI6" size="14" maxlength="13" value="<%=Scale.getE01DDTMI6()%>" onKeypress="enterDecimal(event, 2)"> --%>
                <eibsinput:text property="E01DDTMI6" name="Scale" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" />
              </div>
            </td>
            <td nowrap width="25%"> 
              <div align="center"> 
<%--                 <input type="text" name="E01DDTMX6" size="14" maxlength="13" value="<%=Scale.getE01DDTMX6()%>" onKeypress="enterDecimal(event, 2)"> --%>
                <eibsinput:text property="E01DDTMX6" name="Scale" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" />
              </div>
            </td>
            <td nowrap width="25%" id="E01DDTAM6"  style="display: none;"> 
              <div align="center"> 
<%--                 <input type="text" name="E01DDTAM6" size="14" maxlength="13" value="<%=Scale.getE01DDTAM6()%>" onKeypress="enterDecimal(event, 2)"> --%>
                <eibsinput:text property="E01DDTAM6" name="Scale" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" />
              </div>
            </td>
            <td nowrap width="25%" id="E01DDTPO6"  style="display: none;"> 
              <div align="center"> 
<%--                 <input type="text" name="E01DDTPO6" size="7" maxlength="6" value="<%=Scale.getE01DDTPO6()%>" onKeypress="enterDecimal(event, 3)"> --%>
                <eibsinput:text property="E01DDTPO6" name="Scale" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_PERCENTAGE %>" />
              </div>
            </td>
          </tr>


          <tr id="<%=(row % 2 == 1) ? "trclear" : "trdark"%><%row++;%>"> 
            <td nowrap width="25%"> 
              <div align="center"> 
<%--                 <input type="text" name="E01DDTMI7" size="14" maxlength="13" value="<%=Scale.getE01DDTMI7()%>" onKeypress="enterDecimal(event, 2)"> --%>
                <eibsinput:text property="E01DDTMI7" name="Scale" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" />
              </div>
            </td>
            <td nowrap width="25%"> 
              <div align="center"> 
<%--                 <input type="text" name="E01DDTMX7" size="14" maxlength="13" value="<%=Scale.getE01DDTMX7()%>" onKeypress="enterDecimal(event, 2)"> --%>
                <eibsinput:text property="E01DDTMX7" name="Scale" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" />
              </div>
            </td>
            <td nowrap width="25%" id="E01DDTAM7"  style="display: none;"> 
              <div align="center"> 
<%--                 <input type="text" name="E01DDTAM7" size="14" maxlength="13" value="<%=Scale.getE01DDTAM7()%>" onKeypress="enterDecimal(event, 2)"> --%>
                <eibsinput:text property="E01DDTAM7" name="Scale" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" />
              </div>
            </td>
            <td nowrap width="25%" id="E01DDTPO7"  style="display: none;"> 
              <div align="center"> 
<%--                 <input type="text" name="E01DDTPO7" size="7" maxlength="6" value="<%=Scale.getE01DDTPO7()%>" onKeypress="enterDecimal(event, 3)"> --%>
                <eibsinput:text property="E01DDTPO7" name="Scale" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_PERCENTAGE %>" />
              </div>
            </td>
          </tr>


          <tr id="<%=(row % 2 == 1) ? "trclear" : "trdark"%><%row++;%>"> 
            <td nowrap width="25%"> 
              <div align="center"> 
<%--                 <input type="text" name="E01DDTMI8" size="14" maxlength="13" value="<%=Scale.getE01DDTMI8()%>" onKeypress="enterDecimal(event, 2)"> --%>
                <eibsinput:text property="E01DDTMI8" name="Scale" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" />
              </div>
            </td>
            <td nowrap width="25%"> 
              <div align="center"> 
<%--                 <input type="text" name="E01DDTMX8" size="14" maxlength="13" value="<%=Scale.getE01DDTMX8()%>" onKeypress="enterDecimal(event, 2)"> --%>
                <eibsinput:text property="E01DDTMX8" name="Scale" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" />
              </div>
            </td>
            <td nowrap width="25%" id="E01DDTAM8"  style="display: none;"> 
              <div align="center"> 
<%--                 <input type="text" name="E01DDTAM8" size="14" maxlength="13" value="<%=Scale.getE01DDTAM8()%>" onKeypress="enterDecimal(event, 2)"> --%>
                <eibsinput:text property="E01DDTAM8" name="Scale" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" />
              </div>
            </td>
            <td nowrap width="25%" id="E01DDTPO8"  style="display: none;"> 
              <div align="center"> 
<%--                 <input type="text" name="E01DDTPO8" size="7" maxlength="6" value="<%=Scale.getE01DDTPO8()%>" onKeypress="enterDecimal(event, 3)"> --%>
                <eibsinput:text property="E01DDTPO8" name="Scale" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_PERCENTAGE %>" />
              </div>
            </td>
          </tr>


          <tr id="<%=(row % 2 == 1) ? "trclear" : "trdark"%><%row++;%>"> 
            <td nowrap width="25%"> 
              <div align="center"> 
<%--                 <input type="text" name="E01DDTMI9" size="14" maxlength="13" value="<%=Scale.getE01DDTMI9()%>" onKeypress="enterDecimal(event, 2)"> --%>
                <eibsinput:text property="E01DDTMI9" name="Scale" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" />
              </div>
            </td>
            <td nowrap width="25%"> 
              <div align="center"> 
<%--                 <input type="text" name="E01DDTMX9" size="14" maxlength="13" value="<%=Scale.getE01DDTMX9()%>" onKeypress="enterDecimal(event, 2)"> --%>
                <eibsinput:text property="E01DDTMX9" name="Scale" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" />
              </div>
            </td>
            <td nowrap width="25%" id="E01DDTAM9"  style="display: none;"> 
              <div align="center"> 
<%--                 <input type="text" name="E01DDTAM9" size="14" maxlength="13" value="<%=Scale.getE01DDTAM9()%>" onKeypress="enterDecimal(event, 2)"> --%>
                <eibsinput:text property="E01DDTAM9" name="Scale" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" />
              </div>
            </td>
            <td nowrap width="25%" id="E01DDTPO9"  style="display: none;"> 
              <div align="center"> 
<%--                 <input type="text" name="E01DDTPO9" size="7" maxlength="6" value="<%=Scale.getE01DDTPO9()%>" onKeypress="enterDecimal(event, 3)"> --%>
                <eibsinput:text property="E01DDTPO9" name="Scale" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_PERCENTAGE %>" />
              </div>
            </td>
          </tr>


          <tr id="<%=(row % 2 == 1) ? "trclear" : "trdark"%><%row++;%>"> 
            <td nowrap width="25%"> 
              <div align="center"> 
<%--                 <input type="text" name="E01DDTMI0" size="14" maxlength="13" value="<%=Scale.getE01DDTMI0()%>" onKeypress="enterDecimal(event, 2)"> --%>
                <eibsinput:text property="E01DDTMI0" name="Scale" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" />
              </div>
            </td>
            <td nowrap width="25%"> 
              <div align="center"> 
<%--                 <input type="text" name="E01DDTMX0" size="14" maxlength="13" value="<%=Scale.getE01DDTMX0()%>" onKeypress="enterDecimal(event, 2)"> --%>
                <eibsinput:text property="E01DDTMX0" name="Scale" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" />
              </div>
            </td>
            <td nowrap width="25%" id="E01DDTAM0"  style="display: none;"> 
              <div align="center"> 
<%--                 <input type="text" name="E01DDTAM0" size="14" maxlength="13" value="<%=Scale.getE01DDTAM0()%>" onKeypress="enterDecimal(event, 2)"> --%>
                <eibsinput:text property="E01DDTAM0" name="Scale" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" />
              </div>
            </td>
            <td nowrap width="25%" id="E01DDTPO0"  style="display: none;"> 
              <div align="center"> 
<%--                 <input type="text" name="E01DDTPO0" size="7" maxlength="6" value="<%=Scale.getE01DDTPO0()%>" onKeypress="enterDecimal(event, 3)"> --%>
                <eibsinput:text property="E01DDTPO0" name="Scale" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_PERCENTAGE %>" />
              </div>
            </td>
          </tr>




        
        </table>
      </td>
    </tr>
  </table>
  
  <p>
  <div align="center"> 
    <input id="EIBSBTN" type=submit name="Submit" value="Enviar"  onClick="javascript:CheckAcc()">
    <input id="EIBSBTN" type=button name="Submit" OnClick="checkClose()" value="Salir">
  </div>
</form>
</body>
</html>
