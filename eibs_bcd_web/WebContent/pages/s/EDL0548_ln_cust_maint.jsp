<%@taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput"%>
<%@page import = "datapro.eibs.master.Util" %>
<%@page import="com.datapro.constants.EibsFields"%>
<%@page import="com.datapro.eibs.constants.HelpTypes"%>

<html>
<head>
<title>Cupos Contraparte</title>
<META name="GENERATOR" content="IBM WebSphere Page Designer V4.0 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/jquery/plugins/contextMenu/css/jquery.contextMenu.css" rel="stylesheet" type="text/css" />

<jsp:useBean id="currUser" class="datapro.eibs.beans.ESS0030DSMessage" scope="session" />
<jsp:useBean id="lnData" class="datapro.eibs.beans.EDL054801Message" scope="session" />
<jsp:useBean id="userPO" class="datapro.eibs.beans.UserPos" scope="session" />
<jsp:useBean id="error" class="datapro.eibs.beans.ELEERRMessage" scope="session" />

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>
<script src="<%=request.getContextPath()%>/pages/s/javascripts/jquery.jsp"> </script>
<script src="<%=request.getContextPath()%>/jquery/readOnlyPage.jsp"> </script>

<SCRIPT type="text/javascript">


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

<h3 align="center">Cupo Contraparte<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="ln_cust_maint.jsp,EDL0548"> 
</h3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDL0548" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" value="105">
  <INPUT TYPE=HIDDEN NAME="H01FLGMAS" >
  
  <%int row = 0; %>
  <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellpadding=2 cellspacing=0 width="100%" border="0">
          <tr id="trdark"> 
            <td nowrap  width="10%"><div align="right"><b>Convenio :</b> </div></td>
            <td nowrap  width="10%"> 
              <div align="left"> 
                <eibsinput:text name="lnData" property="E01CTPCNV" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_CNOFC %>" readonly="true" />
              </div>
            </td>
            <td nowrap  width="10%"><div align="right"><b>Nombre :</b> </div></td>
            <td nowrap  width="10%"> 
              <div align="left"> 
                <eibsinput:text name="lnData" property="E01DSCCNV" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_NAME %>" readonly="true"/>
              </div>
            </td>
            <td nowrap  width="10%"><div align="right"></div></td>
            <td nowrap  width="10%"> 
           </td>
         </tr>
         <tr id="trdark"> 
           <td nowrap  width="10%"><div align="right"><b>Tipo Convenio :</b> </div></td>
           <td nowrap  width="10%"> 
             <div align="left"> 
               <SELECT name="E01CTPTYP" disabled > 
                 <OPTION value="01" <%if (lnData.getE01CTPTYP().equals("01")) { out.print("selected"); }%>>Convenio Vivienda </OPTION>
                 <OPTION value="02" <%if (lnData.getE01CTPTYP().equals("02")) { out.print("selected"); }%>>Convenio Libranza </OPTION>
               </SELECT>
             </div>
           </td>
           <td nowrap  width="10%"><div align="right"><b></b> </div></td>
           <td nowrap  width="10%"><div align="left"></div></td>
           <td nowrap  width="10%"><div align="right"><b></b> </div></td>
           <td nowrap  width="10%"><div align="left"></div></td>
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
            <td nowrap width="25%"><div align="right">Numero Proyecto :</div></td>
            <td nowrap width="35%">
              <eibsinput:text name="lnData" property="E01CTPNUM" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_CUSTOMER %>" readonly="true" />						
            </td>
            <td nowrap width="25%"></td>
            <td nowrap width="35%"></td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
            <td nowrap width="25%"><div align="right">Nombre del Proyecto :</div></td>
            <td nowrap width="35%"> 
              <eibsinput:text name="lnData" property="E01CTPDSC" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_NAME %>"  />						
            </td>
            <td nowrap width="25%"></td>
            <td nowrap width="35%"></td>
          </tr>
        </table>
      </td>
    </tr>
  </table>

  <h4>Informaci&oacute;n </h4>
  <table class="tableinfo" >
    <tr>
      <td>
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td width="25%"><div align="right">Monto Contraparte Aprobado :</div></td>
            <td width="25%">
						  <eibsinput:text name="lnData" property="E01CTPAPV" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" />
            </td>
            <% if ( !lnData.getE01CTPTYP().equals("02")  ) {  %>
            <td width="25%"><div align="right">Nro. de Unidades Aprobado:</div></td>
            <td width="25%">
						  <eibsinput:text name="lnData" property="E01CTPUNI" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_TERM %>" />
            </td>
             <% } else { %>
            <td width="25%"><div align="right"></div></td>
            <td width="25%">
            </td>
            <% } %> 
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td width="25%"><div align="right">Fecha de Asignacion :</div></td>
            <td width="25%">
              <eibsinput:date name="lnData" fn_year="E01CTPOPY" fn_month="E01CTPOPM" fn_day="E01CTPOPD" required="true" />
            </td>
            <td width="25%"><div align="right"></div></td>
            <td width="25%">  
              
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td width="25%"><div align="right">Monto Contraparte Reservado :</div></td>
            <td width="25%">
              <eibsinput:text name="lnData" property="E01CTPRSV" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true" />
            </td>
            <% if ( !lnData.getE01CTPTYP().equals("02")  ) {  %>
            <td width="25%"><div align="right">Nro. de Unidades Reservado:</div></td>
            <td width="25%">
							<eibsinput:text name="lnData" property="E01CTPURV" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_TERM %>" readonly="true" />
            </td>
             <% } else { %>
            <td width="25%"><div align="right"></div></td>
            <td width="25%">
            </td>
            <% } %> 
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td width="25%"><div align="right">Monto Contraparte Utilizado :</div></td>
            <td width="25%">
						  <eibsinput:text name="lnData" property="E01CTPUTI" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true" />
            </td>
             <% if ( !lnData.getE01CTPTYP().equals("02")  ) {  %>
            <td width="25%"><div align="right">Nro. de Unidades Utilizado:</div></td>
            <td width="25%">
						  <eibsinput:text name="lnData" property="E01CTPUUT" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_TERM %>" readonly="true" />
            </td>
             <% } else { %>
            <td width="25%"><div align="right"></div></td>
            <td width="25%">
            </td>
            <% } %> 
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td width="25%"><div align="right">Monto Contraparte Disponible :</div></td>
            <td width="25%">
              <eibsinput:text name="lnData" property="E01CTPMDI" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true" />
            </td>
            <% if ( !lnData.getE01CTPTYP().equals("02")  ) {  %>
            <td width="25%"><div align="right">Nro. de Unidades Disponible:</div></td>
            <td width="25%">
						  <eibsinput:text name="lnData" property="E01CTPUDI" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_TERM %>" readonly="true" />
            </td>
            <% } else { %>
            <td width="25%"><div align="right"></div></td>
            <td width="25%">
            </td>
            <% } %> 
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
