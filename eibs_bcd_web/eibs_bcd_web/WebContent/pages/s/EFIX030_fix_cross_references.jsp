<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@page import="com.datapro.constants.EibsFields"%>

<html>
<head>
<title>Activos Fijos</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/jquery/plugins/contextMenu/css/jquery.contextMenu.css" rel="stylesheet" type="text/css" />

<jsp:useBean id="fix" class="datapro.eibs.beans.EFIX03001Message"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>



</head>

<body >
<% 
 if ( !error.getERRNUM().equals("0")  ) {
     error.setERRNUM("0");
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
     }

%>
<h3 align="center">Referencias Cruzadas de Activos Fijos y Amortizaciones<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="fix_cross_reference.jsp, EFIX030"> 
</h3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.amort.JSEFIX030" >
  <input type=HIDDEN name="SCREEN" id="SCREEN" value="400">
  
  <%int row = 0; %>
  <table class="tableinfo" width="100%" >
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" >
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
            <td nowrap width="15%" >
              <div align="right">N&uacute;mero de Cuenta Contable :</div>
            </td>
            <td nowrap colspan="3" width="85%" > 
              <div align="left"> 
              	<eibsinput:text name="fix" property="E01FIXBNK" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_BANK %>" readonly="true" />
              	<eibsinput:text name="fix" property="E01FIXCCY" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CURRENCY %>" readonly="true" />
              	<eibsinput:text name="fix" property="E01FIXGLN" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_GLEDGER %>" readonly="true" />
              	<eibsinput:text name="fix" property="E01GLNDSC" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true" />
              </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  
  <h4>Afectaci&oacute;n por baja de Activo</h4>
  <table class="tableinfo" width="100%" >
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" >
          
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
            <td nowrap width="15%" > 
              <div align="right">Cuenta Contable a Debitar :</div>
            </td>
            <td nowrap colspan="3" width="85%" > 
              <div align="left">
                <input type="text" id="E01FIXBAJ" name="E01FIXBAJ" size="17" maxlength="16" value = "<%= fix.getE01FIXBAJ() %>" onkeypress="enterInteger(event)"
                 class="context-menu-help" onmousedown="init(ledgerHelp,this.name,document.getElementById('E01FIXBNK').value,document.getElementById('E01FIXCCY').value,'E01BAJDSC','','')">
                <eibsinput:text name="fix" property="E01BAJDSC" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true"/>
              </div>
            </td>
          </tr>
          
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
            <td nowrap width="15%" >
              <div align="right">Cuenta Contable Ganancia/P&eacute;rdida :</div>
            </td>
            <td nowrap colspan="3" width="85%" > 
              <div align="left">
                <input type="text" id="E01FIXDRI" name="E01FIXDRI" size="17" maxlength="16" value = "<%= fix.getE01FIXDRI() %>" onkeypress="enterInteger(event)"
                 class="context-menu-help" onmousedown="init(ledgerHelp,this.name,document.getElementById('E01FIXBNK').value,document.getElementById('E01FIXCCY').value,'E01DRIDSC','','')">
                <eibsinput:text name="fix" property="E01DRIDSC" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true"/>
              </div>
            </td>
          </tr>
          
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
            <td nowrap width="15%" >
              <div align="right">Contrapartida Ganancia/P&eacute;rdida :</div>
            </td>
            <td nowrap colspan="3" width="85%" > 
              <div align="left">
                <input type="text" id="E01FIXCRI" name="E01FIXCRI" size="17" maxlength="16" value = "<%= fix.getE01FIXCRI() %>" onkeypress="enterInteger(event)"
                 class="context-menu-help" onmousedown="init(ledgerHelp,this.name,document.getElementById('E01FIXBNK').value,document.getElementById('E01FIXCCY').value,'E01CRIDSC','','')">
                <eibsinput:text name="fix" property="E01CRIDSC" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true"/>
              </div>
            </td>
          </tr>
          
        </table>
      </td>
    </tr>
  </table>

  <h4>Depreciaci&oacute;n Acumulada</h4>
  <table class="tableinfo" width="100%" >
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" >
          
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
            <td nowrap width="15%" > 
              <div align="right">Cuenta Contable a Debitar :</div>
            </td>
            <td nowrap colspan="3" width="85%" > 
              <div align="left">
              <input type="text" id="E01FIXDRA" name="E01FIXDRA" size="17" maxlength="16" value = "<%= fix.getE01FIXDRA() %>" onkeypress="enterInteger(event)"
          		class="context-menu-help"
                onmousedown="init(ledgerHelp,this.name,document.getElementById('E01FIXBNK').value,document.getElementById('E01FIXCCY').value,'E01DRADSC','','')">
       		 <eibsinput:text name="fix" property="E01DRADSC" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true"/>
             </div>
            </td>
          </tr>
          
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
            <td nowrap width="15%" >
              <div align="right">Cuenta Contable a Acreditar :</div>
            </td>
            <td nowrap colspan="3" width="85%" >
              <input type="text" id="E01FIXCRA" name="E01FIXCRA" size="17" maxlength="16" value = "<%= fix.getE01FIXCRA() %>" onkeypress="enterInteger(event)" 
          		class="context-menu-help"
                onmousedown="init(ledgerHelp,this.name,document.getElementById('E01FIXBNK').value,document.getElementById('E01FIXCCY').value,'E01CRADSC','','')">
 			 <eibsinput:text name="fix" property="E01CRADSC" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true"/>
             </td>
          </tr>
          
        </table>
      </td>
    </tr>
  </table>
  
  <h4>Ajuste Costo por Inflaci&oacute;n </h4>
  <table class="tableinfo" width="100%" >
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" >
          
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
            <td nowrap width="15%" > 
              <div align="right">Cuenta Contable a Debitar :</div>
            </td>            
            <td nowrap colspan="3" width="85%" > 
              <div align="left"> 
                <input type="text" id="E01FIXDAI" name="E01FIXDAI" size="17" maxlength="16" value = "<%= fix.getE01FIXDAI() %>" onkeypress="enterInteger(event)"
          		class="context-menu-help"
                onmousedown="init(ledgerHelp,this.name,document.getElementById('E01FIXBNK').value,document.getElementById('E01FIXCCY').value,'E01DAIDSC','','')">
       		    <eibsinput:text name="fix" property="E01DAIDSC" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true"/>
              </div>              
            </td>
          </tr>
          
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">	
            <td nowrap width="15%" > 
              <div align="right">Cuenta Contable a Acreditar :</div>
            </td>
            <td nowrap colspan="3" width="85%" > 
             <input type="text" id="E01FIXCAI" name="E01FIXCAI" size="17" maxlength="16" value = "<%= fix.getE01FIXCAI() %>" onkeypress="enterInteger(event)"
          		class="context-menu-help"
                onmousedown="init(ledgerHelp,this.name,document.getElementById('E01FIXBNK').value,document.getElementById('E01FIXCCY').value,'E01CAIDSC','','')">
       		 <eibsinput:text name="fix" property="E01CAIDSC" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true"/>
            </td>
          </tr>
        
        </table>
      </td>
    </tr>      
  </table>
  
  <h4>Ajuste Depreciaci&oacute;n Acumulada por Inflaci&oacute;n </h4>
  <table class="tableinfo" width="100%" >
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" >
          
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
            <td nowrap width="15%" > 
              <div align="right">Cuenta Contable a Debitar :</div>
            </td>
            <td nowrap colspan="3" width="85%" > 
              <div align="left"> 
                <input type="text" id="E01FIXADD" name="E01FIXADD" size="17" maxlength="16" value = "<%= fix.getE01FIXADD() %>" onkeypress="enterInteger(event)"
          		class="context-menu-help"
                onmousedown="init(ledgerHelp,this.name,document.getElementById('E01FIXBNK').value,document.getElementById('E01FIXCCY').value,'E01ADDDSC','','')">
       		    <eibsinput:text name="fix" property="E01ADDDSC" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true"/>                              
              </div>
            </td>
          </tr>
         
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap width="15%" > 
              <div align="right">Cuenta Contable a Acreditar :</div>
            </td>
            <td nowrap colspan="3" width="85%" > 
                <input type="text" id="E01FIXADC" name="E01FIXADC" size="17" maxlength="16" value = "<%= fix.getE01FIXADC() %>" onkeypress="enterInteger(event)"
          		class="context-menu-help"
                onmousedown="init(ledgerHelp,this.name,document.getElementById('E01FIXBNK').value,document.getElementById('E01FIXCCY').value,'E01ADCDSC','','')">
       		    <eibsinput:text name="fix" property="E01ADCDSC" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true"/>	  
            </td>
          </tr>
          
        </table>
      </td>
    </tr>            
  </table>

 <h4>Activos en Arrendamiento</h4>
 <table class="tableinfo" width="100%" >
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" >
          
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
            <td nowrap width="15%" > 
              <div align="right">Per Contra Activo Fijo :</div>
            </td>
            <td nowrap colspan="3" width="85%" > 
              <div align="left"> 
                <input type="text" id="E01FIXALD" name="E01FIXALD" size="17" maxlength="16" value = "<%= fix.getE01FIXALD() %>" onkeypress="enterInteger(event)"
          		class="context-menu-help"
                onmousedown="init(ledgerHelp,this.name,document.getElementById('E01FIXBNK').value,document.getElementById('E01FIXCCY').value,'E01ALDDSC','','')">
       		    <eibsinput:text name="fix" property="E01ALDDSC" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true"/>	                  
              </div>
            </td>
          </tr>
          
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
            <td nowrap width="15%" > 
              <div align="right">Contra Depreciaci&oacute;n :</div>
            </td>
            <td nowrap colspan="3" width="85%" > 
                <input type="text" id="E01ALCDSC" name="E01FIXALC" size="17" maxlength="16" value = "<%= fix.getE01FIXALC() %>" onkeypress="enterInteger(event)"
          		class="context-menu-help"
                onmousedown="init(ledgerHelp,this.name,document.getElementById('E01FIXBNK').value,document.getElementById('E01FIXCCY').value,'E01ALCDSC','','')">
       		    <eibsinput:text name="fix" property="E01ALCDSC" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true"/>	              
            </td>
          </tr>
          
        </table>
      </td>
    </tr>
  </table> 


 
  <p>&nbsp;</p>
  <table width="100%" border="0" cellspacing="0" cellpadding="0" bgcolor="#FFFFFF" bordercolor="#FFFFFF">
    <tr bgcolor="#FFFFFF"> 
      <td width="33%">
 <div align="center"> 
	      <input id="EIBSBTN" type=submit name="Submit" value="Enviar">
  </div>      </td>
    </tr>
  </table>
  </form>
</body>
</html>
