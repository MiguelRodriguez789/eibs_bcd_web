<%@taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput"%>
<%@page import = "datapro.eibs.master.Util" %>
<%@page import="com.datapro.constants.EibsFields"%>
<%@page import="com.datapro.eibs.constants.HelpTypes"%>

<html>
<head>
<title>Negociacion Tabla de Usuarios</title>
<META name="GENERATOR" content="IBM WebSphere Page Designer V4.0 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/jquery/plugins/contextMenu/css/jquery.contextMenu.css" rel="stylesheet" type="text/css" />

<jsp:useBean id="currUser" class="datapro.eibs.beans.ESS0030DSMessage" scope="session" />
<jsp:useBean id="lnParam" class="datapro.eibs.beans.EDL055601Message" scope="session" />
<jsp:useBean id="userPO" class="datapro.eibs.beans.UserPos" scope="session" />
<jsp:useBean id="error" class="datapro.eibs.beans.ELEERRMessage" scope="session" />

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>
<script src="<%=request.getContextPath()%>/pages/s/javascripts/jquery.jsp"> </script>
<script src="<%=request.getContextPath()%>/jquery/readOnlyPage.jsp"> </script>

<SCRIPT type="text/javascript">

function ShowCastigo(TypeSel) {
	if (TypeSel == 'Y') {	
		divAddOpt.style.display = "";
	} else {
		divAddOpt.style.display = "none";
	}
}


</SCRIPT>

</head>
<body>

<% 
 if ( !error.getERRNUM().equals("0")  ) {
     error.setERRNUM("0");
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
 }       
%>

<h3 align="center">Negociacion Tabla de Usuarios<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="ln_user_new.jsp,EDL0556"> 
</h3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.params.JSEDL0556" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" value="100">
  <INPUT TYPE=HIDDEN NAME="H01FLGMAS" >
  
  <%int row = 0; %>
  <table class="tableinfo" >
    <tr> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
             <td nowrap width="20%" align=right><b>Usuario/Perfil :&nbsp;</b></td>
             <td nowrap width="5%">
              <input type="text" name="E01NUSUSR" size="12" maxlength="10" value="<%= lnParam.getE01NUSUSR()%>" > 
                	<a href="javascript:GetUser('E01NUSUSR','',document.forms[0].E01NUSUSR.value)">
        		    <img src="<%=request.getContextPath()%>/images/1b.gif" title="help" align="middle" border="0"></a> 
             </td>
            <td nowrap width="30%">
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  
  <H4>Datos B&aacute;sicos</H4>
  <table  class="tableinfo" >
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
            <td nowrap width="20%"><div align="right">Cargos :</div></td>
            <td nowrap width="30%"> 
              <SELECT name="E01NUSAUT">
                <OPTION value="1" <%if (lnParam.getE01NUSAUT().equals("1")) { out.print("selected"); }%>>Gestores/Consejeros</OPTION>
                <OPTION value="2" <%if (lnParam.getE01NUSAUT().equals("2")) { out.print("selected"); }%>>Supervisores </OPTION>
                <OPTION value="3" <%if (lnParam.getE01NUSAUT().equals("3")) { out.print("selected"); }%>>Coordinadores </OPTION>
                <OPTION value="4" <%if (lnParam.getE01NUSAUT().equals("4")) { out.print("selected"); }%>>Directores </OPTION>
                <OPTION value="5" <%if (lnParam.getE01NUSAUT().equals("5")) { out.print("selected"); }%>>Gerencia </OPTION>
              </SELECT>
            </td>
            <td nowrap width="20%"></td>
            <td nowrap width="30%"></td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
            <td nowrap width="20%"><div align="right"></div></td>
            <td nowrap width="30%"><div align="left"><b>Cartera Normal</b></div></td>
            <td nowrap width="20%"><div align="left"><b>Cartera Castigada</b></div></td>
            <td nowrap width="30%"><div align="right"></div></td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
            <td nowrap width="20%"><div align="right">Capital Total :</div></td>
            <td nowrap width="30%"> 
              <eibsinput:text name="lnParam" property="E01NUSAM1" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_PERCENTAGE %>"  required="false"/>
            </td>
            <td nowrap width="20%">
             <eibsinput:text name="lnParam" property="E01NUSAME" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_PERCENTAGE %>"  required="false"/>
            </td>
            <td nowrap width="30%"></td>
          </tr>
                    
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
            <td nowrap width="20%"><div align="right">Capital Vencido :</div></td>
            <td nowrap width="30%"> 
              <eibsinput:text name="lnParam" property="E01NUSAM2" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_PERCENTAGE %>"  required="false"/>
            </td>
            <td nowrap width="20%">
             <eibsinput:text name="lnParam" property="E01NUSAMF" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_PERCENTAGE %>"  required="false"/>
            </td>
            <td nowrap width="30%"></td>
          </tr>
           <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
            <td nowrap width="20%"><div align="right">Reintegro de Fondos :</div></td>
            <td nowrap width="30%"> 
              <eibsinput:text name="lnParam" property="E01NUSP01" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_PERCENTAGE %>"  required="false"/>
            </td>
            <td nowrap width="20%">
             <eibsinput:text name="lnParam" property="E01NUSP51" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_PERCENTAGE %>"  required="false"/>
            </td>
            <td nowrap width="30%"></td>
          </tr>
           <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
            <td nowrap width="20%"><div align="right">Interes Vigente :</div></td>
            <td nowrap width="30%"> 
              <eibsinput:text name="lnParam" property="E01NUSAM3" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_PERCENTAGE %>"  required="false"/>
            </td>
            <td nowrap width="20%">
             <eibsinput:text name="lnParam" property="E01NUSAMG" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_PERCENTAGE %>"  required="false"/>
            </td>
            <td nowrap width="30%"></td>
          </tr>
           <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
            <td nowrap width="20%"><div align="right">Interes Contingente :</div></td>
            <td nowrap width="30%"> 
              <eibsinput:text name="lnParam" property="E01NUSAM4" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_PERCENTAGE %>"  required="false"/>
            </td>
            <td nowrap width="20%">
             <eibsinput:text name="lnParam" property="E01NUSAMH" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_PERCENTAGE %>"  required="false"/>
            </td>
            <td nowrap width="30%"></td>
          </tr>
           <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
            <td nowrap width="20%"><div align="right">Mora Vigente :</div></td>
            <td nowrap width="30%"> 
              <eibsinput:text name="lnParam" property="E01NUSAM5" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_PERCENTAGE %>"  required="false"/>
            </td>
            <td nowrap width="20%">
             <eibsinput:text name="lnParam" property="E01NUSAMI" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_PERCENTAGE %>"  required="false"/>
            </td>
            <td nowrap width="30%"></td>
          </tr>
        
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
            <td nowrap width="20%"><div align="right">Mora Contingente :</div></td>
            <td nowrap width="30%"> 
              <eibsinput:text name="lnParam" property="E01NUSAM6" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_PERCENTAGE %>"/>
            </td>
            <td nowrap width="20%">
             <eibsinput:text name="lnParam" property="E01NUSAMJ" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_PERCENTAGE %>"  required="false"/>
            </td>
            <td nowrap width="30%"></td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
            <td nowrap width="20%"><div align="right">Comisiones :</div></td>
            <td nowrap width="30%"> 
              <eibsinput:text name="lnParam" property="E01NUSAM7" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_PERCENTAGE %>"  required="false"/>
            </td>
            <td nowrap width="20%">
             <eibsinput:text name="lnParam" property="E01NUSAMK" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_PERCENTAGE %>"  required="false"/>
            </td>
            <td nowrap width="30%"></td>
          </tr>
               
            <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
            <td nowrap width="20%"><div align="right">IVA Comisiones :</div></td>
            <td nowrap width="30%"> 
              <eibsinput:text name="lnParam" property="E01NUSAM8" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_PERCENTAGE %>" required="false"/>
            </td>
            <td nowrap width="20%">
             <eibsinput:text name="lnParam" property="E01NUSAML" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_PERCENTAGE %>"  required="false"/>
            </td>
            <td nowrap width="30%"></td>
         </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
            <td nowrap width="20%"><div align="right">Deducciones :</div></td>
            <td nowrap width="30%"> 
              <eibsinput:text name="lnParam" property="E01NUSAM9" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_PERCENTAGE %>"  required="false"/>
            </td>
            <td nowrap width="20%">
             <eibsinput:text name="lnParam" property="E01NUSAMM" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_PERCENTAGE %>"  required="false"/>
            </td>
            <td nowrap width="30%"></td>
          </tr>
           <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
            <td nowrap width="20%"><div align="right">IVA Deducciones :</div></td>
            <td nowrap width="30%"> 
              <eibsinput:text name="lnParam" property="E01NUSAM0" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_PERCENTAGE %>"  required="false"/>
            </td>
            <td nowrap width="20%">
             <eibsinput:text name="lnParam" property="E01NUSAMN" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_PERCENTAGE %>"  required="false"/>
            </td>
            <td nowrap width="30%"></td>
          </tr>
           <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
            <td nowrap width="20%"><div align="right">GAC :</div></td>
            <td nowrap width="30%"> 
              <eibsinput:text name="lnParam" property="E01NUSP02" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_PERCENTAGE %>"  required="false"/>
            </td>
            <td nowrap width="20%">
             <eibsinput:text name="lnParam" property="E01NUSP52" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_PERCENTAGE %>"  required="false"/>
            </td>
            <td nowrap width="30%"></td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
            <td nowrap width="20%"><div align="right">IVA GAC :</div></td>
            <td nowrap width="30%"> 
              <eibsinput:text name="lnParam" property="E01NUSP03" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_PERCENTAGE %>"  required="false"/>
            </td>
            <td nowrap width="20%">
             <eibsinput:text name="lnParam" property="E01NUSP53" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_PERCENTAGE %>"  required="false"/>
            </td>
            <td nowrap width="30%"></td>
          </tr>
           <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
            <td nowrap width="20%"><div align="right">Cobranzas :</div></td>
            <td nowrap width="30%"> 
              <eibsinput:text name="lnParam" property="E01NUSAMA" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_PERCENTAGE %>"  required="false"/>
            </td>
            <td nowrap width="20%">
             <eibsinput:text name="lnParam" property="E01NUSAMO" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_PERCENTAGE %>"  required="false"/>
            </td>
            <td nowrap width="30%"></td>
          </tr>
           <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
            <td nowrap width="20%"><div align="right">IVA Cobranzas :</div></td>
            <td nowrap width="30%"> 
              <eibsinput:text name="lnParam" property="E01NUSAMB" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_PERCENTAGE %>"  required="false"/>
            </td>
            <td nowrap width="20%">
             <eibsinput:text name="lnParam" property="E01NUSAMP" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_PERCENTAGE %>"  required="false"/>
            </td>
            <td nowrap width="30%"></td>
          </tr>
        </table>
      </td>
    </tr>
  </table>


 
  <p align="center"> 
    <input id="EIBSBTN" type="submit" name="Submit" value="Enviar">
  </p>

</form>

<script type="text/javascript">
</script>

</body>
</html>
