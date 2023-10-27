<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@page import="com.datapro.eibs.constants.ISOCodes"%>
<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@page import="com.datapro.constants.EibsFields"%>

<%@ page import = "datapro.eibs.beans.EDL017001Message" %>
<html>
<head>
<title>Consulta detalle de documentos papel valor Plazo Fijo</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

</head>

<jsp:useBean id= "EDL017001" class= "datapro.eibs.beans.JBObjList"  scope="session" />

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />

<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />

<body>

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>
 
 


<SCRIPT type="text/javascript">
builtHPopUp();

function showPopUp(opth,field,bank,ccy,field1,field2,opcod) {
   init(opth,field,bank,ccy,field1,field2,opcod);
   showPopupHelp();
   }
   
</SCRIPT>

<% 
    if ( !error.getERRNUM().equals("0")  ) {
        out.println("<SCRIPT Language=\"Javascript\">");
        error.setERRNUM("0");
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
	EDL017001.setCurrentRow(row);
	EDL017001Message refCodes = (EDL017001Message) EDL017001.getRecord();
    
%>


<H3 align="center">Consulta detalle de documentos papel valor Plazo Fijo<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="inquiry_deatails.jsp, EDL0170"></H3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.params.JSEDL0170" id="form1" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="400">
  <INPUT TYPE=HIDDEN NAME="ACCION" VALUE="C">
  <input type="hidden" name="E01ACTION" size="1" maxlength="1">
   
  <h4>Informaci&oacute;n B&aacute;sica</h4>
  <table  class="tableinfo">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="trclear"> 
            <td nowrap width="16%"> 
              <div align="right">Banco :</div>
            </td>
            <td nowrap> 
              <div align="left"> 
                <input type="text" name="E01PFDBNK" size="02" maxlength="02" value="<%= refCodes.getE01PFDBNK().trim()%>" readonly>
              </div>
            </td>
            <td nowrap width="16%" height="23"> 
              <div align="right">Sucursal :</div>
            </td>
            <td nowrap height="23"> 
              <div align="left"> 
                <input type="text" name="E01PFDBRN" size="04" maxlength="04" value="<%= refCodes.getE01PFDBRN().trim()%>" readonly>
              </div>
            </td>
          </tr>

          <tr id="trdark"> 
            <td nowrap width="16%"> 
              <div align="right">Documento Inicial :</div>
            </td>
            <td nowrap> 
              <div align="left"> 
                <input type="text" name="E01PFDINI" size="13" maxlength="13" value="<%= refCodes.getE01PFDINI().trim()%>" readonly>
              </div>
            </td>
            <td nowrap width="16%" height="23"> 
              <div align="right">Documento Final :</div>
            </td>
            <td nowrap height="23"> 
              <div align="left"> 
                <input type="text" name="E01PFDFIN" size="13" maxlength="13" value="<%= refCodes.getE01PFDFIN().trim()%>" readonly>
              </div>
            </td>
          </tr>

          <tr id="trclear" >
            <td nowrap width="16%" height="23"> 
              <div align="right">Ultimo asignado :</div>
            </td>
            <td nowrap height="23"> 
              <div align="left"> 
                <input type="text" name="E01PFDLST" size="13" maxlength="13" value="<%= refCodes.getE01PFDLST().trim()%>" readonly>
              </div>
            </td>
            <td nowrap width="16%" height="23"> 
              <div align="right">Total documentos :</div>
            </td>
            <td nowrap height="23"> 
              <div align="left"> 
                <input type="text" name="E01PFDTOT" size="13" maxlength="13" value="<%= refCodes.getE01PFDTOT().trim()%>" readonly>
              </div>
            </td>
          </tr>

          <tr id="trdark"> 
            <td nowrap width="16%"> 
              <div align="right">Fecha alta :</div>
            </td>
            <td nowrap> 
              <div align="left"> 
				<eibsinput:date name="refCodes" fn_year="E01PFDCSY" fn_month="E01PFDCSM" fn_day="E01PFDCSD" readonly="true"/>
              </div>
            </td>
            <td nowrap width="16%"> 
              <div align="right">Hora alta :</div>
            </td>
            <td nowrap> 
              <div align="left"> 
                <input type="text" name="E01PFDCST" size="26" maxlength="26" value="<%= refCodes.getE01PFDCST().trim()%>" readonly>
              </div>
            </td>
          </tr>

          <tr id="trclear"> 
            <td nowrap width="16%"> 
              <div align="right">Fecha actualizacion :</div>
            </td>
            <td nowrap> 
              <div align="left"> 
				<eibsinput:date name="refCodes" fn_year="E01PFDASY" fn_month="E01PFDASM" fn_day="E01PFDASD" readonly="true"/>
              </div>
            </td>
            <td nowrap width="16%"> 
              <div align="right">Hora actualizacion :</div>
            </td>
            <td nowrap> 
              <div align="left"> 
                <input type="text" name="E01PFDAST" size="26" maxlength="26" value="<%= refCodes.getE01PFDAST().trim()%>" readonly>
              </div>
            </td>
          </tr>

          <tr id="trdark"> 
            <td nowrap width="16%"> 
              <div align="right">Usuario alta :</div>
            </td>
            <td nowrap> 
              <div align="left"> 
                <input type="text" name="E01PFDCRU" size="10" maxlength="10" value="<%= refCodes.getE01PFDCRU().trim()%>" readonly>
              </div>
            </td>
            <td nowrap width="16%"> 
              <div align="right">Usuario actualizacion :</div>
            </td>
            <td nowrap> 
              <div align="left"> 
                <input type="text" name="E01PFDARU" size="10" maxlength="10" value="<%= refCodes.getE01PFDARU().trim()%>" readonly>
              </div>
            </td>
          </tr>

          <tr id="trclear"> 
            <td nowrap width="16%"> 
              <div align="right">Balance lote :</div>
            </td>
            <td nowrap> 
              <div align="left"> 
                <input type="text" name="E01PFDBAL" size="13" maxlength="13" value="<%= refCodes.getE01PFDBAL().trim()%>" readonly>
              </div>
            </td>
            <td nowrap width="16%"> 
              <div align="right">Estatus Lote :</div>
            </td>
            <td nowrap> 
              <div align="left"> 
                <input type="text" name="E01PFDSTS" size="1" maxlength="1" value="<%= refCodes.getE01PFDSTS().trim()%>" readonly>
                <input type="text" name="D01PFDSTS" size="15" maxlength="15" value="<%= refCodes.getD01PFDSTS().trim()%>" readonly>
              </div>
            </td>
          </tr>

          <tr id="trdark"> 
            <td nowrap width="16%"> 
              <div align="right">Estatus por registro :</div>
            </td>
            <td nowrap> 
              <div align="left"> 
                <input type="text" name="E01PFDS01" size="1" maxlength="1" value="<%= refCodes.getE01PFDS01().trim()%>" readonly>
                <input type="text" name="E01PFDS02" size="1" maxlength="1" value="<%= refCodes.getE01PFDS02().trim()%>" readonly>
                <input type="text" name="E01PFDS03" size="1" maxlength="1" value="<%= refCodes.getE01PFDS03().trim()%>" readonly>
                <input type="text" name="E01PFDS04" size="1" maxlength="1" value="<%= refCodes.getE01PFDS04().trim()%>" readonly>
                <input type="text" name="E01PFDS05" size="1" maxlength="1" value="<%= refCodes.getE01PFDS05().trim()%>" readonly>
                <input type="text" name="E01PFDS06" size="1" maxlength="1" value="<%= refCodes.getE01PFDS06().trim()%>" readonly>
                <input type="text" name="E01PFDS07" size="1" maxlength="1" value="<%= refCodes.getE01PFDS07().trim()%>" readonly>
                <input type="text" name="E01PFDS08" size="1" maxlength="1" value="<%= refCodes.getE01PFDS08().trim()%>" readonly>
                <input type="text" name="E01PFDS09" size="1" maxlength="1" value="<%= refCodes.getE01PFDS09().trim()%>" readonly>
                <input type="text" name="E01PFDS10" size="1" maxlength="1" value="<%= refCodes.getE01PFDS10().trim()%>" readonly>
              </div>
            </td>
            <td nowrap width="16%"> 
              <div align="right"></div>
            </td>
            <td nowrap> 
              <div align="left"> 
              </div>
            </td>
          </tr>

          <tr id="trclear"> 
            <td nowrap width="16%"> 
              <div align="right"></div>
            </td>
            <td nowrap> 
              <div align="left"> 
                <input type="text" name="E01PFDS11" size="1" maxlength="1" value="<%= refCodes.getE01PFDS11().trim()%>" readonly>
                <input type="text" name="E01PFDS12" size="1" maxlength="1" value="<%= refCodes.getE01PFDS12().trim()%>" readonly>
                <input type="text" name="E01PFDS13" size="1" maxlength="1" value="<%= refCodes.getE01PFDS13().trim()%>" readonly>
                <input type="text" name="E01PFDS14" size="1" maxlength="1" value="<%= refCodes.getE01PFDS14().trim()%>" readonly>
                <input type="text" name="E01PFDS15" size="1" maxlength="1" value="<%= refCodes.getE01PFDS15().trim()%>" readonly>
                <input type="text" name="E01PFDS16" size="1" maxlength="1" value="<%= refCodes.getE01PFDS16().trim()%>" readonly>
                <input type="text" name="E01PFDS17" size="1" maxlength="1" value="<%= refCodes.getE01PFDS17().trim()%>" readonly>
                <input type="text" name="E01PFDS18" size="1" maxlength="1" value="<%= refCodes.getE01PFDS18().trim()%>" readonly>
                <input type="text" name="E01PFDS19" size="1" maxlength="1" value="<%= refCodes.getE01PFDS19().trim()%>" readonly>
                <input type="text" name="E01PFDS20" size="1" maxlength="1" value="<%= refCodes.getE01PFDS20().trim()%>" readonly>
              </div>
            </td>
            <td nowrap width="16%"> 
              <div align="right"></div>
            </td>
            <td nowrap> 
              <div align="left"> 
              </div>
            </td>

          <tr id="trdark"> 
            <td nowrap width="16%"> 
              <div align="right"></div>
            </td>
            <td nowrap> 
              <div align="left"> 
                <input type="text" name="E01PFDS21" size="1" maxlength="1" value="<%= refCodes.getE01PFDS21().trim()%>" readonly>
                <input type="text" name="E01PFDS22" size="1" maxlength="1" value="<%= refCodes.getE01PFDS22().trim()%>" readonly>
                <input type="text" name="E01PFDS23" size="1" maxlength="1" value="<%= refCodes.getE01PFDS23().trim()%>" readonly>
                <input type="text" name="E01PFDS24" size="1" maxlength="1" value="<%= refCodes.getE01PFDS24().trim()%>" readonly>
                <input type="text" name="E01PFDS25" size="1" maxlength="1" value="<%= refCodes.getE01PFDS25().trim()%>" readonly>
              </div>
            </td>
            <td nowrap width="16%"> 
              <div align="right"></div>
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
  </form>
  
<SCRIPT type="text/javascript" >

</SCRIPT>
  
</body>
</html>
