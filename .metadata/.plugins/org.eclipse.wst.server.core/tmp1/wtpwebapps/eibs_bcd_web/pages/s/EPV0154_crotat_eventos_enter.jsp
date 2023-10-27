<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@page import="com.datapro.eibs.constants.HelpTypes"%>
<%@ page import="com.datapro.constants.EibsFields"%>
<%@ page import = "datapro.eibs.master.Util" %>
<html>
<head>
<title>Table/List Eventos Cupo Rotativo</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "HeadInfo" class="datapro.eibs.beans.EPV015401Message" scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>

<script type="text/javascript">

	<%  if(userPO.getHeader22().equals("CreditLines")) {%>
		builtNewMenu(crotat_inq_opt);
		initMenu();
	<% } %>


function goAction(op) {
	getElement("opt").value = op;
	document.forms[0].submit();
}

</SCRIPT>  

</head>

<BODY>

<% 
 	if ( !error.getERRNUM().equals("0")  ) {
     	out.println("<SCRIPT Language=\"Javascript\">");
     	out.println("       showErrors()");
     	out.println("</SCRIPT>");
   	}
%>


<h3 align="center">Eventos Hist&oacute;ricos - Cupo Rotativo<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="crotat_eventos_enter.jsp, EPV0154"></h3>
<hr size="4">
<FORM name="form1" METHOD="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.salesplatform.JSEPV0154DADC" >
    <input type=HIDDEN name="SCREEN" id="SCREEN" value="700">
  <%int row = 0; %>
 <table class="tableinfo" >
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
          <tr id="trdark">
            <td nowrap width="15%" > 
              <div align="right"><b>Cliente :</b></div>
            </td>
            <td nowrap width="10%" > 
              <div align="left">
              	<eibsinput:text property="E01DEACUN" name="HeadInfo" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_CUSTOMER %>" readonly="true"/>
			  </div>
            </td>
            <td nowrap width="10%" > 
              <div align="right"><b>Nombre :</b> </div>
            </td>
            <td nowrap width="35%"> 
              <div align="left">
              	<eibsinput:text property="E01CUSNA1" name="HeadInfo" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_NAME %>" readonly="true"/>
              </div>
            </td>
            <td nowrap width="10%"> 
              <div align="right"><b>Tipo : </b></div>
            </td>
            <td nowrap width="20%"> 
              <div align="left">
              	<eibsinput:text property="E01DEATYP" name="HeadInfo" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_PRODUCT %>" readonly="true"/>
              </div>
            </td>
          </tr>
          <tr id="trdark">
            <td nowrap width="15%"> 
              <div align="right"><b>Cuenta :</b></div>
            </td>
            <td nowrap width="10%"> 
              <div align="left"> 
              	<eibsinput:text property="E01DEAACC" name="HeadInfo" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_ACCOUNT%>" readonly="true"/>
              </div>
            </td>
            <td nowrap width="10%"> 
              <div align="right"><b>Moneda : </b></div>
            </td>
            <td nowrap width="35%"> 
              <div align="left">
              	<eibsinput:text property="E01DEACCY" name="HeadInfo" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_CURRENCY %>" readonly="true"/>
              </div>
            </td>
            <td nowrap width="10%"> 
              <div align="right"><b>Producto : </b></div>
            </td>
            <td nowrap width="20%"> 
              <div align="left">
              	<eibsinput:text property="E01DEAPRO" name="HeadInfo" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_PRODUCT %>" readonly="true"/>
              </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
 </table>
  <br>
 <p></p>  

  <table class="tableinfo">
    <tr > 
      <td nowrap height="94"> 
        <table cellpadding=2 cellspacing=0 width="100%" border="0">
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">  
            <td nowrap width="15%"> 
              <div align="center"> <b>Seleccionar Fechas </b></div>
            </td>
            <td nowrap width="15%"><div align="right"><b>Desde : </b></div></td>
            <td nowrap width="15%"> 
              <div align="left"> 
                <eibsinput:date fn_month="E07FMDTMM" fn_day="E07FMDTDD" fn_year="E07FMDTYY"  />
              </div>
            </td>
            <td nowrap width="5%"> 
              <div align="right"><b>Hasta :</b></div>
            </td>
            <td nowrap width="47%"> 
              <div align="left"> 
                <eibsinput:date fn_month="E07TODTMM" fn_day="E07TODTDD" fn_year="E07TODTYY"  />
              </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  
  <br>
	<div align="center" style="width:95%"> 
    	<input id="EIBSBTN" type=submit name="Submit" value="Enviar">
  	</div>

</form>
</body>
</html>
