
<%@ page import = "datapro.eibs.master.Util" %>

<%@page import="datapro.eibs.beans.EDI001002Message"%>
<%@page import="datapro.eibs.beans.EDI011002Message"%>
<%@page import="datapro.eibs.beans.JBImageDetail"%><html>
<head>
<title>Documentos</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V4.0 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/Ajax.js"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/cnofc.js"> </SCRIPT>
<%@ taglib uri="/WEB-INF/datapro-dyntable.tld" prefix="dyntable" %>
<jsp:useBean id="lstScanDocuments" class="datapro.eibs.beans.JBObjList"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>

</head>
<body>
<%	if (!error.getERRNUM().equals("0")){
     error.setERRNUM("0");
%> 
	<SCRIPT type="text/javascript">
		showErrors();
	</SCRIPT>
<%	} %> 
<h3 align="center">Documentos Relacionados<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" alt="doc_list.jsp,EDI0110"></h3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.tools.JSEDI0110" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="3">
 <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
          <tr id="trdark"> 
            <td nowrap width="16%" > 
              <div align="right"><b>Cliente :</b></div>
            </td>
            <td nowrap width="20%" > 
              <div align="left">
                <INPUT type="text" name="E01DEACUN" size="9" maxlength="9" value="<%= userPO.getHeader2()%>" readonly>
                </div>
            </td>
            <td nowrap width="16%" > 
              <div align="right"><b>Nombre :</b> </div>
            </td>
            <td nowrap colspan="3" > 
              <div align="left"><font face="Arial"><font face="Arial"><font size="2">
                <INPUT type="text" name="E01CUSNA1" size="45" maxlength="45" value="<%= userPO.getHeader3() %>" readonly>
                </font></font></font></div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="16%"> 
              <div align="right"><b>Cuenta :</b></div>
            </td>
            <td nowrap width="20%"> 
              <div align="left">
                <INPUT type="text" name="E01DEAACC" size="12" maxlength="12" value="<%= userPO.getIdentifier() %>" readonly>
              </div>
            </td>
            <td nowrap width="16%"> 
              <div align="right"><b>Moneda : </b></div>
            </td>
            <td nowrap width="16%"> 
              <div align="left"><b> 
                <INPUT type="text" name="E01DEACCY" size="4" maxlength="3" value="<%= userPO.getCurrency() %>" readonly>
                </b> </div>
            </td>
            <td nowrap width="16%"> 
              <div align="right"><b>Producto : </b></div>
            </td>
            <td nowrap width="16%"> 
              <div align="left"><b>
                <INPUT type="text" name="E01DEAPRO" size="4" maxlength="4" value="<%= userPO.getHeader1() %>" readonly>
                </b> </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>  
<%
if ( false && lstScanDocuments.getNoResult() ) {
%>
  
  <TABLE class="tbenter" width=100% height=20%>
    <TR>
      <TD> 
        <div align="center">
          <font size="3"><b>
        	No hay documentos asignados
          </b></font>
        </div>
      </TD>
    </TR>
  </TABLE>

<%   		
} else {
	JBImageDetail imageHeader = (JBImageDetail)session.getAttribute("imageHeader");
	String urlDetail = "/servlet/datapro.eibs.tools.JSEDI0110?SCREEN=4&NUMBER=" + imageHeader.getNUMBER() + "&REFERENCE=" + imageHeader.getREFERENCE();
	String urlRelated = "/servlet/datapro.eibs.tools.JSEDI0110?SCREEN=6&NUMBER=" + imageHeader.getNUMBER() + "&REFERENCE=" + imageHeader.getREFERENCE(); 
%>
<dyntable:params list="lstScanDocuments" name="scanDoc" form="scanDoc" actionClone="false" width="600"
	urlDetail="<%= urlDetail %>" urlRelated="<%= urlRelated %>" >
		<dyntable:element fn_name='' fn_value='' fn_type='HIDDEN' 
			fn_nameD='E02DIDIS1' fn_nameM='E02DIDIS2' fn_nameY='E02DIDIS3' 
			fn_nameD_value='E02DIDIS1' fn_nameM_value='E02DIDIS2' fn_nameY_value='E02DIDIS3'>
			<dyntable:element-column-caption>Fecha</dyntable:element-column-caption>
		</dyntable:element>
		<dyntable:element fn_name='E02DIDTYP' fn_value='' fn_type='SELECT'>
			<dyntable:element-column-caption>Tipo</dyntable:element-column-caption>
			<dyntable:select onfocus="CNOFCSelect('FD').getFilters(this)" style="min-width: 160px; width: 180px;">
			</dyntable:select>			
		</dyntable:element>
		<dyntable:element fn_name='E02DIDDES' fn_value='' fn_type='TEXT' fn_label='' maxlength="35">
			<dyntable:element-column-caption>Descripción</dyntable:element-column-caption>
		</dyntable:element>
		<dyntable:element fn_name='E02DIDSTA' fn_value='' fn_type='SELECT'>
			<dyntable:element-column-caption>Estado</dyntable:element-column-caption>
			<dyntable:select onfocus="CNOFCSelect('17').getFilters(this)" style="min-width: 160px; width: 180px;">
			</dyntable:select>
		</dyntable:element>
</dyntable:params>
<%   		
} 
%>
<p></p>
  <div align="center"> 
			<input id="EIBSBTN" type=submit name="Submit" value="Enviar">
  </div>
</form>
<SCRIPT type="text/javascript">
setCenterSize(800,600);
</SCRIPT>
</body>
</html>
