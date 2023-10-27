<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"> 
<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@ page import = "datapro.eibs.master.Util" %>
<%@page import="com.datapro.constants.EibsFields"%>
<%@page import="com.datapro.eibs.constants.HelpTypes"%>

<html>
<head>
<title>Tramos y Tasas Preferenciales</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id="prefere" class="datapro.eibs.beans.EDL114201Message"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>

<SCRIPT type="text/javascript">
builtHPopUp();

function showPopUp(opth,field,bank,ccy,field1,field2,opcod) {
   init(opth,field,bank,ccy,field1,field2,opcod);
   showPopupHelp();
   }
   
</SCRIPT>
</head>

<body>
<% 
    if ( !error.getERRNUM().equals("0")  ) {
        out.println("<SCRIPT Language=\"Javascript\">");
        error.setERRNUM("0");
        out.println("       showErrors()");
        out.println("</SCRIPT>");
    }
    
%>


<H3 align="center">Tramos y Tasas Preferenciales<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="limits_parameters.jsp, EDL1142"></H3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.params.JSEDL1142" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="400">
  <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
          <tr id="trdark"> 
            <td nowrap width="16%" > 
              <div align="right"><b>Tabla :</b></div>
            </td>
            <td nowrap width="20%" > 
              <div align="left">
                <input type="text" name="E01TASTBL" size="3" maxlength="2" value="<%= prefere.getE01TASTBL().trim()%>" readonly>
               </div>
            </td>
            <td nowrap width="16%" > 
              <div align="right"><b>Descripción :</b></div>
            </td>
            <td nowrap width="20%" > 
              <div align="left">
                <input type="text" name="E01TASDSC" size="50" maxlength="45" value="<%= prefere.getE01TASDSC().trim()%>" readonly>
              </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  
  <h4>Definición de Límites Para Tramos y Tasas Préstamos Preferenciales</h4>
  
  <%int row = 0; %>
  <table  class="tableinfo">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">

          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
            <td nowrap width="5%"> 
              <div align="right"> </div>
            </td>
            <td nowrap width="19%"> 
              <div align="center">Mínimo</div>
            </td>
            <td nowrap width="19%"> 
              <div align="center">Máximo</div>
            </td>
            <td nowrap width="19%"> 
              <div align="center">Tasa en Referencia</div>
            </td>
            <td nowrap width="19%"> 
              <div align="center">Subsidio</div>
            </td>
            <td nowrap width="19%"> 
              <div align="center">Tasa Preferencial</div>
            </td>
           </tr>


          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
            <td nowrap width="5%"> 
              <div align="right">Rango 1 :</div>
            </td>
            <td nowrap width="19%"> 
              <div align="center"> 
                <eibsinput:text name="prefere" property="E01TASMI1" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" />
              </div>
            </td>
            <td nowrap width="19%"> 
              <div align="center"> 
                <eibsinput:text name="prefere" property="E01TASMX1" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" />
              </div>
            </td>
            <td nowrap width="19%"> 
              <div align="center"> 
                <eibsinput:text name="prefere" property="E01TASRE1" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_RATE %>" />
              </div>
            </td>
            <td nowrap width="19%"> 
              <div align="center"> 
                <eibsinput:text name="prefere" property="E01TASSB1" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_RATE %>" />
              </div>
            </td>
            <td nowrap width="19%"> 
              <div align="center"> 
                <eibsinput:text name="prefere" property="E01TASPF1" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_RATE %>" />
              </div>
            </td>
          </tr>

          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
            <td nowrap width="5%"> 
              <div align="right">Rango 2 :</div>
            </td>
            <td nowrap width="19%"> 
              <div align="center"> 
                <eibsinput:text name="prefere" property="E01TASMI2" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" />
              </div>
            </td>
            <td nowrap width="19%"> 
              <div align="center"> 
                <eibsinput:text name="prefere" property="E01TASMX2" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" />
              </div>
            </td>
            <td nowrap width="19%"> 
              <div align="center"> 
                <eibsinput:text name="prefere" property="E01TASRE2" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_RATE %>" />
              </div>
            </td>
            <td nowrap width="19%"> 
              <div align="center"> 
                <eibsinput:text name="prefere" property="E01TASSB2" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_RATE %>" />
              </div>
            </td>
            <td nowrap width="19%"> 
              <div align="center"> 
                <eibsinput:text name="prefere" property="E01TASPF2" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_RATE %>" />
              </div>
            </td>
          </tr>


          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
            <td nowrap width="5%"> 
              <div align="right">Rango 3 :</div>
            </td>
            <td nowrap width="19%"> 
              <div align="center"> 
                <eibsinput:text name="prefere" property="E01TASMI3" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" />
              </div>
            </td>
            <td nowrap width="19%"> 
              <div align="center"> 
                <eibsinput:text name="prefere" property="E01TASMX3" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" />
              </div>
            </td>
            <td nowrap width="19%"> 
              <div align="center"> 
                <eibsinput:text name="prefere" property="E01TASRE3" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_RATE %>" />
              </div>
            </td>
            <td nowrap width="19%"> 
              <div align="center"> 
                <eibsinput:text name="prefere" property="E01TASSB3" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_RATE %>" />
              </div>
            </td>
            <td nowrap width="19%"> 
              <div align="center"> 
                <eibsinput:text name="prefere" property="E01TASPF3" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_RATE %>" />
              </div>
            </td>
          </tr>

          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
            <td nowrap width="5%"> 
              <div align="right">Rango 4 :</div>
            </td>
            <td nowrap width="19%"> 
              <div align="center"> 
                <eibsinput:text name="prefere" property="E01TASMI4" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" />
              </div>
            </td>
            <td nowrap width="19%"> 
              <div align="center"> 
                <eibsinput:text name="prefere" property="E01TASMX4" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" />
              </div>
            </td>
            <td nowrap width="19%"> 
              <div align="center"> 
                <eibsinput:text name="prefere" property="E01TASRE4" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_RATE %>" />
              </div>
            </td>
            <td nowrap width="19%"> 
              <div align="center"> 
                <eibsinput:text name="prefere" property="E01TASSB4" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_RATE %>" />
              </div>
            </td>
            <td nowrap width="19%"> 
              <div align="center"> 
                <eibsinput:text name="prefere" property="E01TASPF4" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_RATE %>" />
              </div>
            </td>
          </tr>


          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
            <td nowrap width="5%"> 
              <div align="right">Rango 5 :</div>
            </td>
            <td nowrap width="19%"> 
              <div align="center"> 
                <eibsinput:text name="prefere" property="E01TASMI5" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" />
              </div>
            </td>
            <td nowrap width="19%"> 
              <div align="center"> 
                <eibsinput:text name="prefere" property="E01TASMX5" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" />
              </div>
            </td>
            <td nowrap width="19%"> 
              <div align="center"> 
                <eibsinput:text name="prefere" property="E01TASRE5" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_RATE %>" />
              </div>
            </td>
            <td nowrap width="19%"> 
              <div align="center"> 
                <eibsinput:text name="prefere" property="E01TASSB5" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_RATE %>" />
              </div>
            </td>
            <td nowrap width="19%"> 
              <div align="center"> 
                <eibsinput:text name="prefere" property="E01TASPF5" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_RATE %>" />
              </div>
            </td>
          </tr>

          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
            <td nowrap width="5%"> 
              <div align="right">Rango 6 :</div>
            </td>
            <td nowrap width="19%"> 
              <div align="center"> 
                <eibsinput:text name="prefere" property="E01TASMI6" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" />
              </div>
            </td>
            <td nowrap width="19%"> 
              <div align="center"> 
                <eibsinput:text name="prefere" property="E01TASMX6" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" />
              </div>
            </td>
            <td nowrap width="19%"> 
              <div align="center"> 
                <eibsinput:text name="prefere" property="E01TASRE6" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_RATE %>" />
              </div>
            </td>
            <td nowrap width="19%"> 
              <div align="center"> 
                <eibsinput:text name="prefere" property="E01TASSB6" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_RATE %>" />
              </div>
            </td>
            <td nowrap width="19%"> 
              <div align="center"> 
                <eibsinput:text name="prefere" property="E01TASPF6" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_RATE %>" />
              </div>
            </td>
          </tr>


          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
            <td nowrap width="5%"> 
              <div align="right">Rango 7 :</div>
            </td>
            <td nowrap width="19%"> 
              <div align="center"> 
                <eibsinput:text name="prefere" property="E01TASMI7" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" />
              </div>
            </td>
            <td nowrap width="19%"> 
              <div align="center"> 
                <eibsinput:text name="prefere" property="E01TASMX7" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" />
              </div>
            </td>
            <td nowrap width="19%"> 
              <div align="center"> 
                <eibsinput:text name="prefere" property="E01TASRE7" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_RATE %>" />
              </div>
            </td>
            <td nowrap width="19%"> 
              <div align="center"> 
                <eibsinput:text name="prefere" property="E01TASSB7" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_RATE %>" />
              </div>
            </td>
            <td nowrap width="19%"> 
              <div align="center"> 
                <eibsinput:text name="prefere" property="E01TASPF7" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_RATE %>" />
              </div>
            </td>
          </tr>

          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
            <td nowrap width="5%"> 
              <div align="right">Rango 8 :</div>
            </td>
            <td nowrap width="19%"> 
              <div align="center"> 
                <eibsinput:text name="prefere" property="E01TASMI8" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" />
              </div>
            </td>
            <td nowrap width="19%"> 
              <div align="center"> 
                <eibsinput:text name="prefere" property="E01TASMX8" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" />
              </div>
            </td>
            <td nowrap width="19%"> 
              <div align="center"> 
                <eibsinput:text name="prefere" property="E01TASRE8" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_RATE %>" />
              </div>
            </td>
            <td nowrap width="19%"> 
              <div align="center"> 
                <eibsinput:text name="prefere" property="E01TASSB8" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_RATE %>" />
              </div>
            </td>
            <td nowrap width="19%"> 
              <div align="center"> 
                <eibsinput:text name="prefere" property="E01TASPF8" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_RATE %>" />
              </div>
            </td>
          </tr>


          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
            <td nowrap width="5%"> 
              <div align="right">Rango 9 :</div>
            </td>
            <td nowrap width="19%"> 
              <div align="center"> 
                <eibsinput:text name="prefere" property="E01TASMI9" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" />
              </div>
            </td>
            <td nowrap width="19%"> 
              <div align="center"> 
                <eibsinput:text name="prefere" property="E01TASMX9" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" />
              </div>
            </td>
            <td nowrap width="19%"> 
              <div align="center"> 
                <eibsinput:text name="prefere" property="E01TASRE9" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_RATE %>" />
              </div>
            </td>
            <td nowrap width="19%"> 
              <div align="center"> 
                <eibsinput:text name="prefere" property="E01TASSB9" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_RATE %>" />
              </div>
            </td>
            <td nowrap width="19%"> 
              <div align="center"> 
                <eibsinput:text name="prefere" property="E01TASPF9" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_RATE %>" />
              </div>
            </td>
          </tr>

          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
            <td nowrap width="5%"> 
              <div align="right">Rango 10 :</div>
            </td>
            <td nowrap width="19%"> 
              <div align="center"> 
                <eibsinput:text name="prefere" property="E01TASMI0" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" />
              </div>
            </td>
            <td nowrap width="19%"> 
              <div align="center"> 
                <eibsinput:text name="prefere" property="E01TASMX0" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" />
              </div>
            </td>
            <td nowrap width="19%"> 
              <div align="center"> 
                <eibsinput:text name="prefere" property="E01TASRE0" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_RATE %>" />
              </div>
            </td>
            <td nowrap width="19%"> 
              <div align="center"> 
                <eibsinput:text name="prefere" property="E01TASSB0" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_RATE %>" />
              </div>
            </td>
            <td nowrap width="19%"> 
              <div align="center"> 
                <eibsinput:text name="prefere" property="E01TASPF0" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_RATE %>" />
              </div>
            </td>
          </tr>


        </table>
      </td>
    </tr>
  </table>
  <br>
  <div align="center">
    <input id="EIBSBTN" type=submit name="Submit" value="Enviar">
  </div>
  </form>
</body>
</html>
