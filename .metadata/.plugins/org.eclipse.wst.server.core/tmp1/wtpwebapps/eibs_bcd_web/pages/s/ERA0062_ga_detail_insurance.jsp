<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@ page import = "datapro.eibs.master.Util" %>
<%@page import="com.datapro.constants.EibsFields"%>
<html>
<head>
<title>Detalle Póliza de Seguro</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "gaPoliza" class= "datapro.eibs.beans.ERA006203Message"  scope="session"/>
<jsp:useBean id= "currClient" class= "datapro.eibs.beans.ESD080001Message"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>
<jsp:useBean id= "collList" class= "datapro.eibs.beans.JBObjList"  scope="session" />

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<%
	boolean b_read_only1 = false;
	String read_only1 = "";
	String disabled1 = "";
	String client = currClient != null ? currClient.getE01CUSCUN() : "";
	String curname = currClient != null ? currClient.getE01CUSNA1()
			.trim() : "";
	String iopecod = gaPoliza != null ? gaPoliza.getH03OPECOD().trim()
			: "";
	String oopecod = "";
	if (iopecod.equals("0005")) {
		oopecod = "0002";
	} else if (iopecod.equals("0001")) {
		oopecod = "0002";
	} else if (iopecod.equals("0002")) {
		oopecod = "0002";
	} else if (iopecod.equals("0006")) {
		oopecod = "0003";
	}
	//PROTEGER CAMPOS PARA CONSULTA Y BORRADO
	if (iopecod.equals("0004") || iopecod.equals("0006")) {
		read_only1 = "readonly";
		b_read_only1 = true;
		disabled1 = "disabled";
	}
	if (userPO.getPurpose().equals("INQUIRY")) {
		b_read_only1 = true;
		read_only1 = "readonly";
		disabled1 = "disabled";
	}
%>

</head>

<body>


<%
	if (!error.getERRNUM().equals("0")) {
		error.setERRNUM("0");
		out.println("<SCRIPT Language=\"Javascript\">");
		out.println("       showErrors()");
		out.println("</SCRIPT>");
	}
	int row;
	try {
		row = Integer.parseInt(request.getParameter("ROW"));
	} catch (Exception e) {
		row = -1;
	}
%>

<SCRIPT type="text/javascript">

function hidePoliza(value){
 if (value) {
   Poliza.style.display="none";}
 else{
   Poliza.style.display=""; }
}

</SCRIPT>


<H3 align="center">Póliza de Seguro<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="ga_detail_insurance.jsp , ERA0062"></H3> 
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSERA0050" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" ID="SCREEN" VALUE="211">
  <input type=HIDDEN name="IOPECOD" value="<%=iopecod%>"> 
  <input type=HIDDEN name="OPECOD" value="<%=oopecod%>"> 
  <input type=hidden name="E03ROCREF" value="<%=gaPoliza.getE03ROCREF().trim()%>">
  <input type=hidden name="E03ROCBNK" value="<%=gaPoliza.getE03ROCBNK().trim()%>">
  <input type=hidden name="E03ROCCUN" value="<%=gaPoliza.getE03ROCCUN().trim()%>">
  <input type=hidden name="H03FLGWK3" value="<%=userPO.getHeader22().trim()%>">
  <input type=hidden name="PURPOSE" value="<%=userPO.getPurpose().trim()%>">
  <input type=hidden name="ROW" value="<%=row%>">
  <input type=HIDDEN name="E01ROCREF" value="<%=gaPoliza.getE03ROCREF().trim()%>" readonly>                 
  <input type=HIDDEN name="SEQBIEN" value="<%=gaPoliza.getE03ROCSQR().trim()%>" readonly>                 
  <input type=HIDDEN name="POLIZA" value="<%=gaPoliza.getE03ROCCIN().trim()%>" readonly>                 
  
<%
	String readonly = row >= 0 ? "readonly" : "";
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
                <input type="text" name="E03R0CCUN" readonly size="11" maxlength="9" value="<%=gaPoliza.getE03ROCCUN().trim()%>">
              </div>
            </td>
            <td nowrap> 
              <div align="right"><b>Nombre :</b> </div>
            </td>
            <td nowrap> 
              <div align="left">
                <input type="text" name="E01R01NA1" id="E01R01NA1" readonly size="60" maxlength="45" value="<%=gaPoliza.getE03ROCNA1().trim().equals("") ? curname
					: gaPoliza.getE03ROCNA1().trim()%>" >
              </div>
            </td>
          </tr>
          <tr id="trdark">
            <td nowrap > 
              <div align="right"><b>No. Referencia : </b></div>
            </td>
            <td nowrap>
              <input type="text" name="E01R01REF" id="E01R01REF" size="14" maxlength="12" value="<%=gaPoliza.getE03ROCREF().trim()%>" readonly>
            </td> 
            <td nowrap> 
              <div align="right"><b>Moneda : </b></div>
            </td>
            <td nowrap> 
              <div align="left">
               <input type="text" name="E01R01CCY" id="E01R01CCY" size="4" maxlength="3" value="<%=gaPoliza.getE03ROCCCY().trim()%>" readonly> 
              </div>
            </td>
           </tr>
          <tr id="trdark">             
            <td nowrap> 
              <div align="right"><b>Producto :</b> </div>
            </td>
            <td nowrap> 
              <div align="left">
                <input type="text" name="PRODUCT" size="38" value="<%=gaPoliza.getE03ROCPRD().trim()%> - <%=gaPoliza.getD03ROCPRD().trim()%>" readonly>                 
              </div>
            </td>
            <td nowrap> 
              <div align="right"><b>Tipo de Garantía :</b> </div>
            </td>
            <td nowrap> 
              <div align="left">
                <input type="text" name="TYPE" size="38" value="<%=gaPoliza.getE03ROCTYP().trim()%> - <%=gaPoliza.getD03ROCTYP().trim()%>" readonly>                 
              </div>
            </td>
          </tr>
          <tr id="trclear">             
            <td nowrap> 
              <div align="right"><b>Secuencia Bien :</b> </div>
            </td>
            <td nowrap> 
              <div align="left">
                <input type="text" name="E03ROCSQR" size="4" maxlength="4" value="<%=gaPoliza.getE03ROCSQR().trim()%>" readonly> 
              </div>
            </td>
            <td nowrap> 
            </td>
            <td nowrap> 
              <div align="left">
              </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  
  <div id="Poliza">
   <h4>Datos Seguro</h4>
   <table class="tableinfo">
    <tr > 
      <td nowrap>
        <table cellspacing=0 cellpadding=2 width="100%" border="0">
          <tr id="trclear"> 
            <td nowrap> 
              <div align="right">N&uacute;mero P&oacute;liza :</div>
            </td>
            <td nowrap colspan=2>
              <%
              	if (iopecod.equals("0001")) {
              %> 
                 <INPUT type="text" name="E03ROCCIN" size="25" maxlength="20" value="<%=gaPoliza.getE03ROCCIN().trim()%>" <% if (gaPoliza.getF03ROCCIN().equals("Y")) out.print("class=\"txtchanged\""); %>>
                 <img src="<%=request.getContextPath()%>/images/Check.gif" title="campo obligatorio" align="bottom" border="0" width="16" height="20"  >             
              <%
                           	} else {
                           %> 
                 <INPUT type="text" readonly name="E03ROCCIN" size="25" maxlength="20" value="<%=gaPoliza.getE03ROCCIN().trim()%>" <% if (gaPoliza.getF03ROCCIN().equals("Y")) out.print("class=\"txtchanged\""); %>>
              <%
              	}
              %>
            </td>
            <td nowrap> 
                <div align="right">Tipo de Bien :</div>
            </td>
            <td nowrap colspan=2>
              	<eibsinput:text name="gaPoliza" property="E03ROCIPD" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="<%=b_read_only1%>" modified="F03ROCIPD"/>
                <img src="<%=request.getContextPath()%>/images/Check.gif" title="campo obligatorio" align="bottom" border="0" width="16" height="20"  >
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap> 
              <div align="right">Aseguradora :</div>
            </td>
            <td nowrap colspan=2> 
              <input type="text" name="E03ROCICN" size="6" maxlength="4" value="<%=gaPoliza.getE03ROCICN().trim()%>" <%=read_only1%> <% if (gaPoliza.getF03ROCICN().equals("Y")) out.print("class=\"txtchanged\""); %>>
              <%if (read_only1.equals("")) {%> 
              <a href="javascript:GetCodeDescCNOFC('E03ROCICN','E03ROCICM','IT')"><img src="<%=request.getContextPath()%>/images/1b.gif" title=". . ." align="bottom" border="0"  ></a>
              <%}%>
               <img src="<%=request.getContextPath()%>/images/Check.gif" title="campo obligatorio" align="bottom" border="0" width="16" height="20"  > 
            </td>
            <td nowrap> 
                <div align="right">Nombre:</div>
            </td>
            <td nowrap colspan=2>
             	<eibsinput:text name="gaPoliza" property="E03ROCICM" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_NAME %>" readonly="true" modified="F03ROCICM"/>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap> 
              <div align="right">Tipo de P&oacute;liza:</div>
            </td>
            <td nowrap colspan=3>
              <input type="text" name="E03ROCUSC" size="6" maxlength="4" value="<%=gaPoliza.getE03ROCUSC().trim()%>" <%=read_only1%> <% if (gaPoliza.getF03ROCUSC().equals("Y")) out.print("class=\"txtchanged\""); %>>
              <%if (read_only1.equals("")) {%> 
              <a href="javascript:GetBroker('E03ROCUSC','D03ROCUSC','')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="ayuda" align="middle" border="0"></a> 
			  <%} %>
               <img src="<%=request.getContextPath()%>/images/Check.gif" title="campo obligatorio" align="bottom" border="0" width="16" height="20"  > 
             	<eibsinput:text name="gaPoliza" property="D03ROCUSC" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_NAME %>" readonly="true" modified="F03ROCUSC"/>
            </td>
            <td nowrap> 
                <div align="right"></div>
            </td>
            <td nowrap colspan=1>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap> 
              <div align="right">Valor Suma Asegurada:</div>
            </td>
            <td nowrap colspan=2>
            	<eibsinput:text name="gaPoliza" property="E03ROCIPA" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="<%=b_read_only1%>" modified="F03ROCIPA"/>
            	   <img src="<%=request.getContextPath()%>/images/Check.gif" title="campo obligatorio" align="bottom" border="0" width="16" height="20"  >
            </td>
            <td nowrap > 
            </td>
            <td nowrap colspan=2>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap> 
              <div align="right">Fecha Emisi&oacute;n:</div>
            </td>
            <td nowrap colspan=2> 
	           	<eibsinput:date name="gaPoliza" fn_month="E03ROCEMM" fn_day="E03ROCEMD" fn_year="E03ROCEMY" required="true" readonly="<%=b_read_only1%>" modified="F03ROCEMY;F03ROCEMM;F03ROCEMD" />
            </td>
            <td nowrap> 
            </td>
              <td nowrap colspan=2>
              </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap> 
              <div align="right">Fecha Vencimiento:</div>
            </td>
            <td nowrap colspan=2> 
	           	<eibsinput:date name="gaPoliza" fn_month="E03ROCMDM" fn_day="E03ROCMDD" fn_year="E03ROCMDY" required="true" readonly="<%=b_read_only1%>" modified="F03ROCMDY;F03ROCMDM;F03ROCMDD" />
            </td>
            <td nowrap> 
                <div align="right">Renovación Automatica :</div>
            </td>
              <td nowrap colspan=2>
              <div <% if (gaPoliza.getF03ROCRGK().equals("Y")) out.print("class=\"txtchanged\""); %>>
              <input type="hidden" name="E03ROCRGK" value="<%=gaPoliza.getE03ROCRGK()%>">
              <input type="radio" name="CE03ROCRGK" value="Y" onClick="document.forms[0].E03ROCRGK.value='Y'"
			  <%if (gaPoliza.getE03ROCRGK().equals("Y"))
				out.print("checked");%> <%=disabled1%>>
                Sí 
                <input type="radio" name="CE03ROCRGK" value="N" onClick="document.forms[0].E03ROCRGK.value='N'"
			  <%if (gaPoliza.getE03ROCRGK().equals("N"))
				out.print("checked");%> <%=disabled1%>>
                No 
                <img src="<%=request.getContextPath()%>/images/Check.gif" title="campo obligatorio" align="bottom" border="0" width="16" height="20"  >
			  </div>
             </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap> 
                <div align="right">Constancia de Pago de la Prima:</div>
            </td>
            <td nowrap colspan=2>
              <div <% if (gaPoliza.getF03ROCEDO().equals("Y")) out.print("class=\"txtchanged\""); %>>
                <input type="radio" name="E03ROCEDO" value="1" <%if (gaPoliza.getE03ROCEDO().equals("1"))
				out.print("checked");%> <%=disabled1%>>
                Sí 
                <input type="radio" name="E03ROCEDO" value="2" <%if (gaPoliza.getE03ROCEDO().equals("2"))
				out.print("checked");%> <%=disabled1%>>
                No
                <img src="<%=request.getContextPath()%>/images/Check.gif" title="campo obligatorio" align="bottom" border="0" width="16" height="20"  >
			  </div>
            </td>
            <td nowrap> 
            </td>
              <td nowrap colspan=2>
             </td>
          </tr>
          <tr id="trdark">
            <TD align="right">Corredora :</TD>
            <TD colspan=2>
               <INPUT type="text" name="E03ROCCRR" size="5" maxlength="4" value="<%=gaPoliza.getE03ROCCRR().trim()%>" <%=read_only1%> <% if (gaPoliza.getF03ROCCRR().equals("Y")) out.print("class=\"txtchanged\""); %>>
              <%if (read_only1.equals("")) {%> 
                <a href="javascript:GetCodeDescCNOFC('E03ROCCRR','E03ROCDSC','2M')"><img src="<%=request.getContextPath()%>/images/1b.gif" title=". . ." align="bottom" border="0"  ></a>
				<%} %>
               <img src="<%=request.getContextPath()%>/images/Check.gif" title="campo obligatorio" align="bottom" border="0" width="16" height="20"  >
            </TD>
            
            <td nowrap> 
                <div align="right">Nombre :</div>
            </td>
            <td nowrap colspan=2>
               <INPUT type="text" readonly name="E03ROCDSC" size="35" value="<%=gaPoliza.getE03ROCDSC().trim()%>" readonly <% if (gaPoliza.getF03ROCDSC().equals("Y")) out.print("class=\"txtchanged\""); %>>
            </td>
          </tr>
          <tr id="trdark">
            <TD align="right">Comentarios :</TD>
            <TD colspan=5>
               <INPUT type="text" name="E03ROCBN1" size="70" maxlength="75" value="<%=gaPoliza.getE03ROCBN1().trim()%>" <%=read_only1%> <% if (gaPoliza.getF03ROCBN1().equals("Y")) out.print("class=\"txtchanged\""); %>>
               <img src="<%=request.getContextPath()%>/images/Check.gif" title="campo obligatorio" align="bottom" border="0" width="16" height="20"  >
            </TD>
          </tr>
         </table>         
      </td>
    </tr>
  </table>
  </div>
 
<%
	if (userPO.getOption().equals("Y")) { 
%>
	<br>
  	<h4>Campos de Confecamara</h4>
	<table cellspacing="0" width="100%" border="0">
    	<tr bordercolor="#FFFFFF"> 
      		<td nowrap colspan=4> 
				<table cellspacing="0" width="100%" border="0">
          			<tr id="trclear"> 
            			<td nowrap width="40%"> 
		  					<jsp:include page="ERA0076_ga_confecamaras_template.jsp" flush="true" >				
		  					<jsp:param name="title" value="Información Confecamaras" /> 
		  					<jsp:param name="messageName" value="gaConfFld" />
		  					<jsp:param name="readOnly" value="<%=b_read_only1%>" /> 
		  					<jsp:param name="basic" value="false" />
		  					</jsp:include>     
  		    			</td> 
          			</tr> 
        		</table>
      		</td>
    	</tr>
  </table>
  
<%	}	
	if (userPO.getSource().equals("x")) { 
%>
	<br>
  	<h4>Campos Dinámicos</h4>
	<table cellspacing="0" width="100%" border="0">
    	<tr bordercolor="#FFFFFF"> 
      	<td nowrap colspan=4> 
			<table cellspacing="0" width="100%" border="0">
          		<tr id="trclear"> 
            		<td nowrap width="40%"> 
					  <jsp:include page="ERA0072_ga_user_template.jsp" flush="true" >				
					  <jsp:param name="title" value="Campos de Usuario" /> 
					  <jsp:param name="messageName" value="gaUserFld" />
					  <jsp:param name="readOnly" value="<%=b_read_only1%>" /> 
					  <jsp:param name="suffix" value="E01EXT" />
					  <jsp:param name="basic" value="false" />
					  </jsp:include>     
  		    		</td> 
          		</tr> 
        	</table>
      	</td>
    	</tr>
	</table>
  
<%	} %>
 	
  <table width="100%">		

    <tr>
		<td width="100%" align="center" colspan="3">
	<%
		if (iopecod.equals("0005") || iopecod.equals("0006")
				|| iopecod.equals("0001")) {
			if (oopecod.equals("0003")) {
	%>
	  	<input class="EIBSBTN" id="EIBSBTN" type=submit name="Submit" value="Borrar">

	<%
		} else {
	%>

	  	<input class="EIBSBTN" id="EIBSBTN" type=submit name="Submit" value="Enviar">
	<%
		}
	%>
		<INPUT id="EIBSBTN" type="button" name="Cancel" value="Cancelar" onclick="top.close()">
	<%
		}
	%>
	</td>
    </tr>

  </table>
  
</form>
</body>
</html>
