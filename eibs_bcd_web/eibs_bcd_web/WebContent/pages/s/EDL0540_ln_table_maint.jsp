<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput"%>
<%@ page import ="datapro.eibs.master.Util" %>
<%@ page import="com.datapro.constants.EibsFields"%>
<%@ page import="com.datapro.eibs.constants.HelpTypes"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>

<html>
<head>
<title>Cuentas de Revelacion</title>
<META name="GENERATOR" content="IBM WebSphere Page Designer V4.0 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/jquery/plugins/contextMenu/css/jquery.contextMenu.css" rel="stylesheet" type="text/css" />

<jsp:useBean id="currUser" class= "datapro.eibs.beans.ESS0030DSMessage" scope="session" />
<jsp:useBean id="lnParam" class="datapro.eibs.beans.EDL054002Message" scope="session" />
<jsp:useBean id="error" class="datapro.eibs.beans.ELEERRMessage" scope="session" />
<jsp:useBean id="userPO" class="datapro.eibs.beans.UserPos" scope="session" />

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </script>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </script>

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

<h3 align="center">Tablas de Cuentas de Revelacion<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="ln_table_maint.jsp,EDL0540"> 
</h3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.params.JSEDL0540" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" value="200">
  <INPUT TYPE=HIDDEN NAME="H02FLGMAS" >
  
  <%int row = 0; %>
  <table class="tableinfo" >
    <tr> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
          <tr id="trdark"> 
            <td nowrap width="20%" align=right> 
              <b>Banco :&nbsp;</b>
            </td>
            <td nowrap >                
              <eibsinput:text name="lnParam" property="E02DLVBNK" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_BANK %>" readonly="true"/>
            </td>
            <td nowrap width="20%" align=right> 
              <b>Codigo de Tabla :&nbsp;</b>
            </td>
            <td nowrap >
            <eibsinput:text name="lnParam" property="E02DLVTLN"
									eibsType="<%= EibsFields.EIBS_FIELD_TYPE_TABLE %>"
									readonly="true" />
							</td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="20%" align=right> 
              <b>Moneda</b>
            </td>
            <td nowrap>
            <eibsinput:text name="lnParam" property="E02DLVTYP"
									eibsType="<%= EibsFields.EIBS_FIELD_TYPE_TABLE %>"
									readonly="true" />
            </td>
            <td nowrap width="20%" align=right> 
            </td>
            <td nowrap>  
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
            <td nowrap width="25%"> 
              <div align="right">Descripci&oacute;n :</div>
            </td>
            <td nowrap width="25%"> 
              <eibsinput:text name="lnParam" property="E02DLVDSC" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_NAME %>" required="true"/>
            </td>
            <td nowrap width="20%">
            </td>
            <td nowrap width="10%"></td>
            <td nowrap  width="20%"></td>
          </tr>
        </table>
      </td>
    </tr>
  </table>

  <H4>Vivienda</H4>
  <table  class="tableinfo" >
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="trclear">
            <td nowrap> 
              <div align="right">Terminos :</div>
            </td>
            <td nowrap> 
               (1)<eibsinput:text name="lnParam" property="E02DLVVN1" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_INTEGER %>" size="5" maxlength="5" />
           		 <select name="E02DLVVT1" >
                            <OPTION value=" " <% if (!(lnParam.getE02DLVVT1().equals("D") ||lnParam.getE02DLVVT1().equals("M")||lnParam.getE02DLVVT1().equals("Y"))) out.print("selected"); %>></OPTION>
                            <OPTION value="M" <% if(lnParam.getE02DLVVT1().equals("M")) out.print("selected");%>>Mes(es)</OPTION>
                
                        </select>
            </td>
            <td nowrap> 
               (2)<eibsinput:text name="lnParam" property="E02DLVVN2" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_INTEGER %>" size="5" maxlength="5" />
            	 <select name="E02DLVVT2" >
                            <OPTION value=" " <% if (!(lnParam.getE02DLVVT2().equals("D") ||lnParam.getE02DLVVT2().equals("M")||lnParam.getE02DLVVT2().equals("Y"))) out.print("selected"); %>></OPTION>
                            <OPTION value="M" <% if(lnParam.getE02DLVVT2().equals("M")) out.print("selected");%>>Mes(es)</OPTION>
                          
                        </select>
            </td>
            <td nowrap> 
               (3)<eibsinput:text name="lnParam" property="E02DLVVN3" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_INTEGER %>" size="5" maxlength="5" />
            	 <select name="E02DLVVT3" >
                            <OPTION value=" " <% if (!(lnParam.getE02DLVVT3().equals("D") ||lnParam.getE02DLVVT3().equals("M")||lnParam.getE02DLVVT3().equals("Y"))) out.print("selected"); %>></OPTION>
                            <OPTION value="M" <% if(lnParam.getE02DLVVT3().equals("M")) out.print("selected");%>>Mes(es)</OPTION>
                          
                        </select>
            </td>
            <td nowrap> 
               (4)<eibsinput:text name="lnParam" property="E02DLVVN4" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_INTEGER %>" size="5" maxlength="5" />
            	 <select name="E02DLVVT4" >
                            <OPTION value=" " <% if (!(lnParam.getE02DLVVT4().equals("D") ||lnParam.getE02DLVVT4().equals("M")||lnParam.getE02DLVVT4().equals("Y"))) out.print("selected"); %>></OPTION>
                            <OPTION value="M" <% if(lnParam.getE02DLVVT4().equals("M")) out.print("selected");%>>Mes(es)</OPTION>
                           
                        </select>
            </td>
            <td nowrap> 
               (5)<eibsinput:text name="lnParam" property="E02DLVVN5" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_INTEGER %>" size="5" maxlength="5" />
            	 <select name="E02DLVVT5" >
                            <OPTION value=" " <% if (!(lnParam.getE02DLVVT5().equals("D") ||lnParam.getE02DLVVT5().equals("M")||lnParam.getE02DLVVT5().equals("Y"))) out.print("selected"); %>></OPTION>
                            <OPTION value="M" <% if(lnParam.getE02DLVVT5().equals("M")) out.print("selected");%>>Mes(es)</OPTION>
                           
                        </select>
            </td>
            <td nowrap> 
               (6)<eibsinput:text name="lnParam" property="E02DLVVN6" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_INTEGER %>" size="5" maxlength="5" />
            	 <select name="E02DLVET6" >
                            <OPTION value=" " <% if (!(lnParam.getE02DLVVT6().equals("D") ||lnParam.getE02DLVVT6().equals("M")||lnParam.getE02DLVVT6().equals("Y"))) out.print("selected"); %>></OPTION>
                            <OPTION value="M" <% if(lnParam.getE02DLVVT6().equals("M")) out.print("selected");%>>Mes(es)</OPTION>
                           
                        </select>
            </td>
          </tr>
          <tr id="trdark">
            <td nowrap> 
              <div align="right">G/L Cap. Gar. Idonea :</div>
            </td>
            <td nowrap> 
                <input type="text" name="E02DLVVA1" size="17" maxlength="16" value="<%= lnParam.getE02DLVVA1() %>"
            	class="context-menu-help" onmousedown="init(ledgerHelp,this.name,'','','','','')" >
            </td>
            <td nowrap> 
            	 <input type="text" name="E02DLVVA2" size="17" maxlength="16" value="<%= lnParam.getE02DLVVA2() %>" 
            	class="context-menu-help" onmousedown="init(ledgerHelp,this.name,'','','','','')" >
             
            </td>
            <td nowrap>
            	 <input type="text" name="E02DLVVA3" size="17" maxlength="16" value="<%= lnParam.getE02DLVVA3() %>" 
            	class="context-menu-help" onmousedown="init(ledgerHelp,this.name,'','','','','')" > 
           
            </td>
            <td nowrap> 
            	 <input type="text" name="E02DLVVA4" size="17" maxlength="16" value="<%= lnParam.getE02DLVVA4() %>" 
            	class="context-menu-help" onmousedown="init(ledgerHelp,this.name,'','','','','')" >
            
            </td>
            <td nowrap> 
            	 <input type="text" name="E02DLVVA5" size="17" maxlength="16" value="<%= lnParam.getE02DLVVA5() %>" 
            	class="context-menu-help" onmousedown="init(ledgerHelp,this.name,'','','','','')" >
            
            </td>
            <td nowrap> 
            	 <input type="text" name="E02DLVVA6" size="17" maxlength="16" value="<%= lnParam.getE02DLVVA6() %>" 
            	class="context-menu-help" onmousedown="init(ledgerHelp,this.name,'','','','','')" >
           
            </td>
          </tr>
           <tr id="trclear">
            <td nowrap> 
              <div align="right"> G/L Int. Gar. Idonea :</div>
            </td>
            <td nowrap> 
            	 <input type="text" name="E02DLVVB1" size="17" maxlength="16" value="<%= lnParam.getE02DLVVB1() %>" 
            	class="context-menu-help" onmousedown="init(ledgerHelp,this.name,'','','','','')" >
             
            </td>
            <td nowrap>
            	 <input type="text" name="E02DLVVB2" size="17" maxlength="16" value="<%= lnParam.getE02DLVVB2() %>" 
            	class="context-menu-help" onmousedown="init(ledgerHelp,this.name,'','','','','')" > 
            
            </td>
            <td nowrap>
            	 <input type="text" name="E02DLVVB3" size="17" maxlength="16" value="<%= lnParam.getE02DLVVB3() %>" 
            	class="context-menu-help" onmousedown="init(ledgerHelp,this.name,'','','','','')" > 
            
            </td>
            <td nowrap> 
            	 <input type="text" name="E02DLVVB4" size="17" maxlength="16" value="<%= lnParam.getE02DLVVB4() %>" 
            	class="context-menu-help" onmousedown="init(ledgerHelp,this.name,'','','','','')" >
             
            </td>
            <td nowrap>
            	 <input type="text" name="E02DLVVB5" size="17" maxlength="16" value="<%= lnParam.getE02DLVVB5() %>" 
            	class="context-menu-help" onmousedown="init(ledgerHelp,this.name,'','','','','')" > 
             
            </td>
            <td nowrap> 
            	 <input type="text" name="E02DLVVB6" size="17" maxlength="16" value="<%= lnParam.getE02DLVVB6() %>" 
            	class="context-menu-help" onmousedown="init(ledgerHelp,this.name,'','','','','')" >
              
            </td>
          </tr>
           <tr id="trdark">
            <td nowrap> 
              <div align="right">G/L Otr. Gar. Idonea :</div>
            </td>
            <td nowrap> 
            	 <input type="text" name="E02DLVVC1" size="17" maxlength="16" value="<%= lnParam.getE02DLVVC1() %>" 
            	class="context-menu-help" onmousedown="init(ledgerHelp,this.name,'','','','','')" >
             
            </td>
            <td nowrap> 
            	 <input type="text" name="E02DLVVC2" size="17" maxlength="16" value="<%= lnParam.getE02DLVVC2() %>" 
            	class="context-menu-help" onmousedown="init(ledgerHelp,this.name,'','','','','')" >
             
            </td>
            <td nowrap> 
            	 <input type="text" name="E02DLVVC3" size="17" maxlength="16" value="<%= lnParam.getE02DLVVC3() %>" 
            	class="context-menu-help" onmousedown="init(ledgerHelp,this.name,'','','','','')" >
         
            </td>
            <td nowrap> 
            	 <input type="text" name="E02DLVVC4" size="17" maxlength="16" value="<%= lnParam.getE02DLVVC4() %>" 
            	class="context-menu-help" onmousedown="init(ledgerHelp,this.name,'','','','','')" >
             
            </td>
            <td nowrap> 
            	 <input type="text" name="E02DLVVC5" size="17" maxlength="16" value="<%= lnParam.getE02DLVVC5() %>" 
            	class="context-menu-help" onmousedown="init(ledgerHelp,this.name,'','','','','')" >
            
            </td>
            <td nowrap> 
            	 <input type="text" name="E02DLVVC6" size="17" maxlength="16" value="<%= lnParam.getE02DLVVC6() %>" 
            	class="context-menu-help" onmousedown="init(ledgerHelp,this.name,'','','','','')" >
            
            </td>
          </tr>
           <tr id="trclear">
            <td nowrap> 
              <div align="right">G/L Cap. Gar. Otras :</div>
            </td>
            <td nowrap>
            	<input type="text" name="E02DLVVD1" size="17" maxlength="16" value="<%= lnParam.getE02DLVVD1() %>" 
            	class="context-menu-help" onmousedown="init(ledgerHelp,this.name,'','','','','')" > 
            
            </td>
            <td nowrap> 
            	<input type="text" name="E02DLVVD2" size="17" maxlength="16" value="<%= lnParam.getE02DLVVD2() %>" 
            	class="context-menu-help" onmousedown="init(ledgerHelp,this.name,'','','','','')" > 
             
            </td>
            <td nowrap> 
          	  <input type="text" name="E02DLVVD3" size="17" maxlength="16" value="<%= lnParam.getE02DLVVD3() %>" 
            	class="context-menu-help" onmousedown="init(ledgerHelp,this.name,'','','','','')" > 
             
            </td>
            <td nowrap> 
            	<input type="text" name="E02DLVVD4" size="17" maxlength="16" value="<%= lnParam.getE02DLVVD4() %>" 
            	class="context-menu-help" onmousedown="init(ledgerHelp,this.name,'','','','','')" > 
             
            </td>
            <td nowrap> 
           		 <input type="text" name="E02DLVVD5" size="17" maxlength="16" value="<%= lnParam.getE02DLVVD5() %>" 
            	class="context-menu-help" onmousedown="init(ledgerHelp,this.name,'','','','','')" > 
             </td>
            <td nowrap> 
            	<input type="text" name="E02DLVVD6" size="17" maxlength="16" value="<%= lnParam.getE02DLVVD6() %>" 
            	class="context-menu-help" onmousedown="init(ledgerHelp,this.name,'','','','','')" > 
             
            </td>
          </tr>
           <tr id="trdark">
            <td nowrap> 
              <div align="right"> G/L Int. Gar. Otras :</div>
            </td>
            <td nowrap>
            	<input type="text" name="E02DLVVE1" size="17" maxlength="16" value="<%= lnParam.getE02DLVVE1() %>" 
            	class="context-menu-help" onmousedown="init(ledgerHelp,this.name,'','','','','')" >  
              
            </td>
            <td nowrap> 
            	<input type="text" name="E02DLVVE2" size="17" maxlength="16" value="<%= lnParam.getE02DLVVE2() %>" 
            	class="context-menu-help" onmousedown="init(ledgerHelp,this.name,'','','','','')" > 
             
            </td>
            <td nowrap> 
            	<input type="text" name="E02DLVVE3" size="17" maxlength="16" value="<%= lnParam.getE02DLVVE3() %>" 
            	class="context-menu-help" onmousedown="init(ledgerHelp,this.name,'','','','','')" > 
            
            </td>
            <td nowrap> 
            	<input type="text" name="E02DLVVE4" size="17" maxlength="16" value="<%= lnParam.getE02DLVVE4() %>" 
            	class="context-menu-help" onmousedown="init(ledgerHelp,this.name,'','','','','')" > 
             
            </td>
            <td nowrap> 
            	<input type="text" name="E02DLVVE5" size="17" maxlength="16" value="<%= lnParam.getE02DLVVE5() %>" 
            	class="context-menu-help" onmousedown="init(ledgerHelp,this.name,'','','','','')" > 
             
            </td>
            <td nowrap> 
            	<input type="text" name="E02DLVVE6" size="17" maxlength="16" value="<%= lnParam.getE02DLVVE6() %>" 
            	class="context-menu-help" onmousedown="init(ledgerHelp,this.name,'','','','','')" > 
             
            </td>
          </tr>
           <tr id="trclear">
            <td nowrap> 
              <div align="right"> G/L Otr. Gar. Otras :</div>
            </td>
            <td nowrap>
              <input type="text" name="E02DLVVF1" size="17" maxlength="16" value="<%= lnParam.getE02DLVVF1() %>" 
            	class="context-menu-help" onmousedown="init(ledgerHelp,this.name,'','','','','')" >  
             
            </td>
            <td nowrap> 
            	<input type="text" name="E02DLVVF2" size="17" maxlength="16" value="<%= lnParam.getE02DLVVF2() %>" 
            	class="context-menu-help" onmousedown="init(ledgerHelp,this.name,'','','','','')" > 
              
            </td>
            <td nowrap> 
            	<input type="text" name="E02DLVVF3" size="17" maxlength="16" value="<%= lnParam.getE02DLVVF3() %>" 
            	class="context-menu-help" onmousedown="init(ledgerHelp,this.name,'','','','','')" > 
             
            </td>
            <td nowrap> 
            	<input type="text" name="E02DLVVF4" size="17" maxlength="16" value="<%= lnParam.getE02DLVVF4() %>" 
            	class="context-menu-help" onmousedown="init(ledgerHelp,this.name,'','','','','')" > 
              
            </td>
            <td nowrap> 
            	<input type="text" name="E02DLVVF5" size="17" maxlength="16" value="<%= lnParam.getE02DLVVF5() %>" 
            	class="context-menu-help" onmousedown="init(ledgerHelp,this.name,'','','','','')" > 
              
            </td>
            <td nowrap> 
            	<input type="text" name="E02DLVVF6" size="17" maxlength="16" value="<%= lnParam.getE02DLVVF6() %>" 
            	class="context-menu-help" onmousedown="init(ledgerHelp,this.name,'','','','','')" > 
              
            </td>
          </tr>
          <tr id="trdark">
            <td nowrap> 
              <div align="right"> Contrapartida :</div>
            </td>
            <td nowrap> 
            	<input type="text" name="E02DLVXC1" size="17" maxlength="16" value="<%= lnParam.getE02DLVXC1() %>" 
            	class="context-menu-help" onmousedown="init(ledgerHelp,this.name,'','','','','')" > 
             
            </td>
            <td nowrap> 
             
            </td>
            <td nowrap> 
             
            </td>
            <td nowrap> 
             
            </td>
            <td nowrap> 
              
            </td>
            <td nowrap> 
             
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
   <H4>Consumo</H4>
  <table  class="tableinfo" >
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="trclear">
            <td nowrap> 
              <div align="right">Terminos :</div>
            </td>
            <td nowrap> 
               (1)<eibsinput:text name="lnParam" property="E02DLVCN1" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_INTEGER %>" size="5" maxlength="5" />
           		 <select name="E02DLVCT1" >
                            <OPTION value=" " <% if (!(lnParam.getE02DLVCT1().equals("D") ||lnParam.getE02DLVCT1().equals("M")||lnParam.getE02DLVCT1().equals("Y"))) out.print("selected"); %>></OPTION>
                            
                            <OPTION value="M" <% if(lnParam.getE02DLVCT1().equals("M")) out.print("selected");%>>Mes(es)</OPTION>
                           
                        </select>
            </td>
            <td nowrap> 
               (2)<eibsinput:text name="lnParam" property="E02DLVCN2" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_INTEGER %>" size="5" maxlength="5" />
            	 <select name="E02DLVCT2" >
                            <OPTION value=" " <% if (!(lnParam.getE02DLVCT2().equals("D") ||lnParam.getE02DLVCT2().equals("M")||lnParam.getE02DLVCT2().equals("Y"))) out.print("selected"); %>></OPTION>
                            
                            <OPTION value="M" <% if(lnParam.getE02DLVCT2().equals("M")) out.print("selected");%>>Mes(es)</OPTION>
                          
                        </select>
            </td>
            <td nowrap> 
               (3)<eibsinput:text name="lnParam" property="E02DLVCN3" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_INTEGER %>" size="5" maxlength="5" />
            	 <select name="E02DLVCT3" >
                            <OPTION value=" " <% if (!(lnParam.getE02DLVCT3().equals("D") ||lnParam.getE02DLVCT3().equals("M")||lnParam.getE02DLVCT3().equals("Y"))) out.print("selected"); %>></OPTION>
                          
                            <OPTION value="M" <% if(lnParam.getE02DLVCT3().equals("M")) out.print("selected");%>>Mes(es)</OPTION>
                          
                        </select>
            </td>
            <td nowrap> 
               (4)<eibsinput:text name="lnParam" property="E02DLVCN4" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_INTEGER %>" size="5" maxlength="5" />
            	 <select name="E02DLVCT4" >
                            <OPTION value=" " <% if (!(lnParam.getE02DLVCT4().equals("D") ||lnParam.getE02DLVCT4().equals("M")||lnParam.getE02DLVCT4().equals("Y"))) out.print("selected"); %>></OPTION>
                            
                            <OPTION value="M" <% if(lnParam.getE02DLVCT4().equals("M")) out.print("selected");%>>Mes(es)</OPTION>
                            
                        </select>
            </td>
            <td nowrap> 
               (5)<eibsinput:text name="lnParam" property="E02DLVCN5" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_INTEGER %>" size="5" maxlength="5" />
            	 <select name="E02DLVCT5" >
                            <OPTION value=" " <% if (!(lnParam.getE02DLVCT5().equals("D") ||lnParam.getE02DLVCT5().equals("M")||lnParam.getE02DLVCT5().equals("Y"))) out.print("selected"); %>></OPTION>
                            
                            <OPTION value="M" <% if(lnParam.getE02DLVCT5().equals("M")) out.print("selected");%>>Mes(es)</OPTION>
                           
                        </select>
            </td>
            <td nowrap> 
               (6)<eibsinput:text name="lnParam" property="E02DLVCN6" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_INTEGER %>" size="5" maxlength="5" />
            	 <select name="E02DLVCT6" >
                            <OPTION value=" " <% if (!(lnParam.getE02DLVCT6().equals("D") ||lnParam.getE02DLVCT6().equals("M")||lnParam.getE02DLVCT6().equals("Y"))) out.print("selected"); %>></OPTION>
                            
                            <OPTION value="M" <% if(lnParam.getE02DLVCT6().equals("M")) out.print("selected");%>>Mes(es)</OPTION>
                            
                        </select>
            </td>
          </tr>
          <tr id="trdark">
            <td nowrap> 
              <div align="right">G/L Cap. Gar. Idonea :</div>
            </td>
            <td nowrap> 
            	 <input type="text" name="E02DLVCA1" size="17" maxlength="16" value="<%= lnParam.getE02DLVCA1() %>"
            	class="context-menu-help" onmousedown="init(ledgerHelp,this.name,'','','','','')" >
          
            </td>
            <td nowrap>
            	 <input type="text" name="E02DLVCA2" size="17" maxlength="16" value="<%= lnParam.getE02DLVCA2() %>"
            	class="context-menu-help" onmousedown="init(ledgerHelp,this.name,'','','','','')" > 
           
            </td>
            <td nowrap> 
            	 <input type="text" name="E02DLVCA3" size="17" maxlength="16" value="<%= lnParam.getE02DLVCA3() %>"
            	class="context-menu-help" onmousedown="init(ledgerHelp,this.name,'','','','','')" >
          
            </td>
            <td nowrap> 
            	 <input type="text" name="E02DLVCA4" size="17" maxlength="16" value="<%= lnParam.getE02DLVCA4() %>"
            	class="context-menu-help" onmousedown="init(ledgerHelp,this.name,'','','','','')" >
             
            </td>
            <td nowrap> 
            	 <input type="text" name="E02DLVCA5" size="17" maxlength="16" value="<%= lnParam.getE02DLVCA5() %>"
            	class="context-menu-help" onmousedown="init(ledgerHelp,this.name,'','','','','')" >
             
            </td>
            <td nowrap> 
            	 <input type="text" name="E02DLVCA6" size="17" maxlength="16" value="<%= lnParam.getE02DLVCA6() %>"
            	class="context-menu-help" onmousedown="init(ledgerHelp,this.name,'','','','','')" >
              
            </td>
          </tr>
           <tr id="trclear">
            <td nowrap> 
              <div align="right"> G/L Int. Gar. Idonea :</div>
            </td>
            <td nowrap> 
            	 <input type="text" name="E02DLVCB1" size="17" maxlength="16" value="<%= lnParam.getE02DLVCB1() %>"
            	class="context-menu-help" onmousedown="init(ledgerHelp,this.name,'','','','','')" >
              
            </td>
            <td nowrap> 
            	 <input type="text" name="E02DLVCB2" size="17" maxlength="16" value="<%= lnParam.getE02DLVCB2() %>"
            	class="context-menu-help" onmousedown="init(ledgerHelp,this.name,'','','','','')" >
              
            </td>
            <td nowrap> 
            	 <input type="text" name="E02DLVCB3" size="17" maxlength="16" value="<%= lnParam.getE02DLVCB3() %>"
            	class="context-menu-help" onmousedown="init(ledgerHelp,this.name,'','','','','')" >
              
            </td>
           <td nowrap> 
            	 <input type="text" name="E02DLVCB4" size="17" maxlength="16" value="<%= lnParam.getE02DLVCB4() %>"
            	class="context-menu-help" onmousedown="init(ledgerHelp,this.name,'','','','','')" >
            
            </td>
            <td nowrap> 
            	 <input type="text" name="E02DLVCB5" size="17" maxlength="16" value="<%= lnParam.getE02DLVCB5() %>"
            	class="context-menu-help" onmousedown="init(ledgerHelp,this.name,'','','','','')" >
             
            </td>
            <td nowrap> 
            	 <input type="text" name="E02DLVCB6" size="17" maxlength="16" value="<%= lnParam.getE02DLVCB6() %>"
            	class="context-menu-help" onmousedown="init(ledgerHelp,this.name,'','','','','')" >
            
            </td>
          </tr>
          <tr id="trdark">
            <td nowrap> 
              <div align="right">G/L Otr. Gar. Idonea :</div>
            </td>
            <td nowrap> 
            	 <input type="text" name="E02DLVCC1" size="17" maxlength="16" value="<%= lnParam.getE02DLVCC1() %>"
            	class="context-menu-help" onmousedown="init(ledgerHelp,this.name,'','','','','')" >
             
            </td>
            <td nowrap> 
            	 <input type="text" name="E02DLVCC2" size="17" maxlength="16" value="<%= lnParam.getE02DLVCC2() %>"
            	class="context-menu-help" onmousedown="init(ledgerHelp,this.name,'','','','','')" >
            
            </td>
            <td nowrap> 
            	 <input type="text" name="E02DLVCC3" size="17" maxlength="16" value="<%= lnParam.getE02DLVCC3() %>"
            	class="context-menu-help" onmousedown="init(ledgerHelp,this.name,'','','','','')" >
            
            </td>
            <td nowrap> 
            	 <input type="text" name="E02DLVCC4" size="17" maxlength="16" value="<%= lnParam.getE02DLVCC4() %>"
            	class="context-menu-help" onmousedown="init(ledgerHelp,this.name,'','','','','')" >
            
            </td>
            <td nowrap> 
            	 <input type="text" name="E02DLVCC5" size="17" maxlength="16" value="<%= lnParam.getE02DLVCC5() %>"
            	class="context-menu-help" onmousedown="init(ledgerHelp,this.name,'','','','','')" >
            
            </td>
            <td nowrap> 
            	 <input type="text" name="E02DLVCC6" size="17" maxlength="16" value="<%= lnParam.getE02DLVCC6() %>"
            	class="context-menu-help" onmousedown="init(ledgerHelp,this.name,'','','','','')" >
            
            </td>
          </tr>
           <tr id="trclear">
            <td nowrap> 
              <div align="right">G/L Cap. Gar. Otras :</div>
            </td>
            <td nowrap> 
            	 <input type="text" name="E02DLVCD1" size="17" maxlength="16" value="<%= lnParam.getE02DLVCD1() %>"
            	class="context-menu-help" onmousedown="init(ledgerHelp,this.name,'','','','','')" >

            </td>
            <td nowrap> 
            	 <input type="text" name="E02DLVCD2" size="17" maxlength="16" value="<%= lnParam.getE02DLVCD2() %>"
            	class="context-menu-help" onmousedown="init(ledgerHelp,this.name,'','','','','')" >
        
            </td>
            <td nowrap> 
            	 <input type="text" name="E02DLVCD3" size="17" maxlength="16" value="<%= lnParam.getE02DLVCD3() %>"
            	class="context-menu-help" onmousedown="init(ledgerHelp,this.name,'','','','','')" >

            </td>
            <td nowrap> 
            	 <input type="text" name="E02DLVCD4" size="17" maxlength="16" value="<%= lnParam.getE02DLVCD4() %>"
            	class="context-menu-help" onmousedown="init(ledgerHelp,this.name,'','','','','')" >
           
            </td>
            <td nowrap> 
                <input type="text" name="E02DLVCD5" size="17" maxlength="16" value="<%= lnParam.getE02DLVCD5() %>"
            	class="context-menu-help" onmousedown="init(ledgerHelp,this.name,'','','','','')" >	
          
            </td>
            <td nowrap> 
            	 <input type="text" name="E02DLVCD6" size="17" maxlength="16" value="<%= lnParam.getE02DLVCD6() %>"
            	class="context-menu-help" onmousedown="init(ledgerHelp,this.name,'','','','','')" >
             
            </td>
          </tr>
           <tr id="trdark">
            <td nowrap> 
              <div align="right"> G/L Int. Gar. Otras :</div>
            </td>
            <td nowrap> 
            	 <input type="text" name="E02DLVCE1" size="17" maxlength="16" value="<%= lnParam.getE02DLVCE1() %>"
            	class="context-menu-help" onmousedown="init(ledgerHelp,this.name,'','','','','')" >
             
            </td>
            <td nowrap> 
            	 <input type="text" name="E02DLVCE2" size="17" maxlength="16" value="<%= lnParam.getE02DLVCE2() %>"
            	class="context-menu-help" onmousedown="init(ledgerHelp,this.name,'','','','','')" >
           
            </td>
            <td nowrap> 
            	 <input type="text" name="E02DLVCE3" size="17" maxlength="16" value="<%= lnParam.getE02DLVCE3() %>"
            	class="context-menu-help" onmousedown="init(ledgerHelp,this.name,'','','','','')" >
             
            </td>
            <td nowrap> 
            	 <input type="text" name="E02DLVCE4" size="17" maxlength="16" value="<%= lnParam.getE02DLVCE4() %>"
            	class="context-menu-help" onmousedown="init(ledgerHelp,this.name,'','','','','')" >
      
            </td>
            <td nowrap> 
            	 <input type="text" name="E02DLVCE5" size="17" maxlength="16" value="<%= lnParam.getE02DLVCE5() %>"
            	class="context-menu-help" onmousedown="init(ledgerHelp,this.name,'','','','','')" >
       
            </td>
            <td nowrap> 
            	 <input type="text" name="E02DLVCE6" size="17" maxlength="16" value="<%= lnParam.getE02DLVCE6() %>"
            	class="context-menu-help" onmousedown="init(ledgerHelp,this.name,'','','','','')" >
         
            </td>
          </tr>
           <tr id="trclear">
            <td nowrap> 
              <div align="right"> G/L Otr. Gar. Otras :</div>
            </td>
            <td nowrap> 
            	 <input type="text" name="E02DLVCF1" size="17" maxlength="16" value="<%= lnParam.getE02DLVCF1() %>"
            	class="context-menu-help" onmousedown="init(ledgerHelp,this.name,'','','','','')" >
        
            </td>
            <td nowrap> 
            	 <input type="text" name="E02DLVCF2" size="17" maxlength="16" value="<%= lnParam.getE02DLVCF2() %>"
            	class="context-menu-help" onmousedown="init(ledgerHelp,this.name,'','','','','')" >
             
            </td>
            <td nowrap> 
            	 <input type="text" name="E02DLVCF3" size="17" maxlength="16" value="<%= lnParam.getE02DLVCF3() %>"
            	class="context-menu-help" onmousedown="init(ledgerHelp,this.name,'','','','','')" >
            
            </td>
            <td nowrap> 
            	 <input type="text" name="E02DLVCF4" size="17" maxlength="16" value="<%= lnParam.getE02DLVCF4() %>"
            	class="context-menu-help" onmousedown="init(ledgerHelp,this.name,'','','','','')" >
        
            </td>
            <td nowrap> 
            	 <input type="text" name="E02DLVCF5" size="17" maxlength="16" value="<%= lnParam.getE02DLVCF5() %>"
            	class="context-menu-help" onmousedown="init(ledgerHelp,this.name,'','','','','')" >
              
            </td>
            <td nowrap> 
            	 <input type="text" name="E02DLVCF6" size="17" maxlength="16" value="<%= lnParam.getE02DLVCF6() %>"
            	class="context-menu-help" onmousedown="init(ledgerHelp,this.name,'','','','','')" >
             
            </td>
          </tr>
          <tr id="trdark">
            <td nowrap> 
              <div align="right"> Contrapartida :</div>
            </td>
            <td nowrap> 
            	 <input type="text" name="E02DLVXC2" size="17" maxlength="16" value="<%= lnParam.getE02DLVXC2() %>"
            	class="context-menu-help" onmousedown="init(ledgerHelp,this.name,'','','','','')" >
           
            </td>
            <td nowrap> 
             
            </td>
            <td nowrap> 
             
            </td>
            <td nowrap> 
             
            </td>
            <td nowrap> 
              
            </td>
            <td nowrap> 
             
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <H4>Microcredito</H4>
  <table  class="tableinfo" >
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="trclear">
            <td nowrap> 
              <div align="right">Terminos :</div>
            </td>
            <td nowrap> 
               (1)<eibsinput:text name="lnParam" property="E02DLVMN1" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_INTEGER %>" size="5" maxlength="5" />
           		 <select name="E02DLVMT1" >
                            <OPTION value=" " <% if (!(lnParam.getE02DLVMT1().equals("D") ||lnParam.getE02DLVMT1().equals("M")||lnParam.getE02DLVMT1().equals("Y"))) out.print("selected"); %>></OPTION>
                            
                            <OPTION value="M" <% if(lnParam.getE02DLVMT1().equals("M")) out.print("selected");%>>Mes(es)</OPTION>
                            
                        </select>
            </td>
            <td nowrap> 
               (2)<eibsinput:text name="lnParam" property="E02DLVMN2" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_INTEGER %>" size="5" maxlength="5" />
            	 <select name="E02DLVMT2" >
                            <OPTION value=" " <% if (!(lnParam.getE02DLVMT2().equals("D") ||lnParam.getE02DLVMT2().equals("M")||lnParam.getE02DLVMT2().equals("Y"))) out.print("selected"); %>></OPTION>
                           
                            <OPTION value="M" <% if(lnParam.getE02DLVMT2().equals("M")) out.print("selected");%>>Mes(es)</OPTION>
                          
                        </select>
            </td>
            <td nowrap> 
               (3)<eibsinput:text name="lnParam" property="E02DLVMN3" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_INTEGER %>" size="5" maxlength="5" />
            	 <select name="E02DLVMT3" >
                            <OPTION value=" " <% if (!(lnParam.getE02DLVMT3().equals("D") ||lnParam.getE02DLVMT3().equals("M")||lnParam.getE02DLVMT3().equals("Y"))) out.print("selected"); %>></OPTION>
                            
                            <OPTION value="M" <% if(lnParam.getE02DLVMT3().equals("M")) out.print("selected");%>>Mes(es)</OPTION>
                           
                        </select>
            </td>
            <td nowrap> 
               (4)<eibsinput:text name="lnParam" property="E02DLVMN4" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_INTEGER %>" size="5" maxlength="5" />
            	 <select name="E02DLVMT4" >
                            <OPTION value=" " <% if (!(lnParam.getE02DLVMT4().equals("D") ||lnParam.getE02DLVMT4().equals("M")||lnParam.getE02DLVMT4().equals("Y"))) out.print("selected"); %>></OPTION>
                           
                            <OPTION value="M" <% if(lnParam.getE02DLVMT4().equals("M")) out.print("selected");%>>Mes(es)</OPTION>
                           
                        </select>
            </td>
            <td nowrap> 
               (5)<eibsinput:text name="lnParam" property="E02DLVMN5" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_INTEGER %>" size="5" maxlength="5" />
            	 <select name="E02DLVMT5" >
                            <OPTION value=" " <% if (!(lnParam.getE02DLVMT5().equals("D") ||lnParam.getE02DLVMT5().equals("M")||lnParam.getE02DLVMT5().equals("Y"))) out.print("selected"); %>></OPTION>
                            
                            <OPTION value="M" <% if(lnParam.getE02DLVMT5().equals("M")) out.print("selected");%>>Mes(es)</OPTION>
                           
                        </select>
            </td>
            <td nowrap> 
               (6)<eibsinput:text name="lnParam" property="E02DLVMN6" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_INTEGER %>" size="5" maxlength="5" />
            	 <select name="E02DLVMT6" >
                            <OPTION value=" " <% if (!(lnParam.getE02DLVMT6().equals("D") ||lnParam.getE02DLVMT6().equals("M")||lnParam.getE02DLVMT6().equals("Y"))) out.print("selected"); %>></OPTION>
                            
                            <OPTION value="M" <% if(lnParam.getE02DLVMT6().equals("M")) out.print("selected");%>>Mes(es)</OPTION>
                           
                        </select>
            </td>
          </tr>
          <tr id="trdark">
            <td nowrap> 
              <div align="right">G/L Cap. Gar. Idonea :</div>
            </td>
            <td nowrap> 
            	 <input type="text" name="E02DLVMA1" size="17" maxlength="16" value="<%= lnParam.getE02DLVMA1() %>"
            	class="context-menu-help" onmousedown="init(ledgerHelp,this.name,'','','','','')" >

            </td>
            <td nowrap> 
            	 <input type="text" name="E02DLVMA2" size="17" maxlength="16" value="<%= lnParam.getE02DLVMA2() %>"
            	class="context-menu-help" onmousedown="init(ledgerHelp,this.name,'','','','','')" >

            </td>
            <td nowrap> 
            	 <input type="text" name="E02DLVMA3" size="17" maxlength="16" value="<%= lnParam.getE02DLVMA3() %>"
            	class="context-menu-help" onmousedown="init(ledgerHelp,this.name,'','','','','')" >
            
            </td>
            <td nowrap> 
            	 <input type="text" name="E02DLVMA4" size="17" maxlength="16" value="<%= lnParam.getE02DLVMA4() %>"
            	class="context-menu-help" onmousedown="init(ledgerHelp,this.name,'','','','','')" >
              
            </td>
            <td nowrap> 
            	 <input type="text" name="E02DLVMA5" size="17" maxlength="16" value="<%= lnParam.getE02DLVMA5() %>"
            	class="context-menu-help" onmousedown="init(ledgerHelp,this.name,'','','','','')" >
           
            </td>
            <td nowrap> 
            	 <input type="text" name="E02DLVMA6" size="17" maxlength="16" value="<%= lnParam.getE02DLVMA6() %>"
            	class="context-menu-help" onmousedown="init(ledgerHelp,this.name,'','','','','')" >
 
            </td>
          </tr>
           <tr id="trclear">
            <td nowrap> 
              <div align="right"> G/L Int. Gar. Idonea :</div>
            </td>
            <td nowrap> 
            	 <input type="text" name="E02DLVMB1" size="17" maxlength="16" value="<%= lnParam.getE02DLVMB1() %>"
            	class="context-menu-help" onmousedown="init(ledgerHelp,this.name,'','','','','')" >
         
            </td>
            <td nowrap> 
            	 <input type="text" name="E02DLVMB2" size="17" maxlength="16" value="<%= lnParam.getE02DLVMB2() %>"
            	class="context-menu-help" onmousedown="init(ledgerHelp,this.name,'','','','','')" >
   
            </td>
            <td nowrap> 
            	 <input type="text" name="E02DLVMB3" size="17" maxlength="16" value="<%= lnParam.getE02DLVMB3() %>"
            	class="context-menu-help" onmousedown="init(ledgerHelp,this.name,'','','','','')" >
             
            </td>
            <td nowrap> 
            	 <input type="text" name="E02DLVMB4" size="17" maxlength="16" value="<%= lnParam.getE02DLVMB4() %>"
            	class="context-menu-help" onmousedown="init(ledgerHelp,this.name,'','','','','')" >
      
            </td>
            <td nowrap> 
            	 <input type="text" name="E02DLVMB5" size="17" maxlength="16" value="<%= lnParam.getE02DLVMB5() %>"
            	class="context-menu-help" onmousedown="init(ledgerHelp,this.name,'','','','','')" >
             
            </td>
            <td nowrap> 
            	 <input type="text" name="E02DLVMB6" size="17" maxlength="16" value="<%= lnParam.getE02DLVMB6() %>"
            	class="context-menu-help" onmousedown="init(ledgerHelp,this.name,'','','','','')" >
            
            </td>
          </tr>
           <tr id="trdark">
            <td nowrap> 
              <div align="right">G/L Otr. Gar. Idonea :</div>
            </td>
            <td nowrap> 
            	 <input type="text" name="E02DLVMC1" size="17" maxlength="16" value="<%= lnParam.getE02DLVMC1() %>"
            	class="context-menu-help" onmousedown="init(ledgerHelp,this.name,'','','','','')" >
        
            </td>
            <td nowrap> 
            	 <input type="text" name="E02DLVMC2" size="17" maxlength="16" value="<%= lnParam.getE02DLVMC2() %>"
            	class="context-menu-help" onmousedown="init(ledgerHelp,this.name,'','','','','')" >
            
            </td>
            <td nowrap> 
            	 <input type="text" name="E02DLVMC3" size="17" maxlength="16" value="<%= lnParam.getE02DLVMC3() %>"
            	class="context-menu-help" onmousedown="init(ledgerHelp,this.name,'','','','','')" >
     
            </td>
            <td nowrap> 
            	 <input type="text" name="E02DLVMC4" size="17" maxlength="16" value="<%= lnParam.getE02DLVMC4() %>"
            	class="context-menu-help" onmousedown="init(ledgerHelp,this.name,'','','','','')" >
       
            </td>
            <td nowrap> 
            	 <input type="text" name="E02DLVMC5" size="17" maxlength="16" value="<%= lnParam.getE02DLVMC5() %>"
            	class="context-menu-help" onmousedown="init(ledgerHelp,this.name,'','','','','')" >
          
            </td>
            <td nowrap> 
            	 <input type="text" name="E02DLVMC6" size="17" maxlength="16" value="<%= lnParam.getE02DLVMC6() %>"
            	class="context-menu-help" onmousedown="init(ledgerHelp,this.name,'','','','','')" >
              
            </td>
          </tr>
           <tr id="trclear">
            <td nowrap> 
              <div align="right">G/L Cap. Gar. Otras :</div>
            </td>
            <td nowrap> 
            	 <input type="text" name="E02DLVMD1" size="17" maxlength="16" value="<%= lnParam.getE02DLVMD1() %>"
            	class="context-menu-help" onmousedown="init(ledgerHelp,this.name,'','','','','')" >
     
            </td>
            <td nowrap> 
            	 <input type="text" name="E02DLVMD2" size="17" maxlength="16" value="<%= lnParam.getE02DLVMD2() %>"
            	class="context-menu-help" onmousedown="init(ledgerHelp,this.name,'','','','','')" >
              
            </td>
            <td nowrap> 
            	 <input type="text" name="E02DLVMD3" size="17" maxlength="16" value="<%= lnParam.getE02DLVMD3() %>"
            	class="context-menu-help" onmousedown="init(ledgerHelp,this.name,'','','','','')" >
       
            </td>
            <td nowrap> 
            	 <input type="text" name="E02DLVMD4" size="17" maxlength="16" value="<%= lnParam.getE02DLVMD4() %>"
            	class="context-menu-help" onmousedown="init(ledgerHelp,this.name,'','','','','')" >
           
            </td>
            <td nowrap> 
            	 <input type="text" name="E02DLVMD5" size="17" maxlength="16" value="<%= lnParam.getE02DLVMD5() %>"
            	class="context-menu-help" onmousedown="init(ledgerHelp,this.name,'','','','','')" >
             
            </td>
            <td nowrap> 
            	 <input type="text" name="E02DLVMD6" size="17" maxlength="16" value="<%= lnParam.getE02DLVMD6() %>"
            	class="context-menu-help" onmousedown="init(ledgerHelp,this.name,'','','','','')" >
    
            </td>
          </tr>
           <tr id="trdark">
            <td nowrap> 
              <div align="right"> G/L Int. Gar. Otras :</div>
            </td>
            <td nowrap> 
            	 <input type="text" name="E02DLVME1" size="17" maxlength="16" value="<%= lnParam.getE02DLVME1() %>"
            	class="context-menu-help" onmousedown="init(ledgerHelp,this.name,'','','','','')" >
             
            </td>
            <td nowrap> 
            	 <input type="text" name="E02DLVME2" size="17" maxlength="16" value="<%= lnParam.getE02DLVME2() %>"
            	class="context-menu-help" onmousedown="init(ledgerHelp,this.name,'','','','','')" >
             
            </td>
            <td nowrap> 
            	 <input type="text" name="E02DLVME3" size="17" maxlength="16" value="<%= lnParam.getE02DLVME3() %>"
            	class="context-menu-help" onmousedown="init(ledgerHelp,this.name,'','','','','')" >

            </td>
            <td nowrap> 
            	 <input type="text" name="E02DLVME4" size="17" maxlength="16" value="<%= lnParam.getE02DLVME4() %>"
            	class="context-menu-help" onmousedown="init(ledgerHelp,this.name,'','','','','')" >
             
            </td>
            <td nowrap> 
            	 <input type="text" name="E02DLVME5" size="17" maxlength="16" value="<%= lnParam.getE02DLVME5() %>"
            	class="context-menu-help" onmousedown="init(ledgerHelp,this.name,'','','','','')" >	
             
            </td>
            <td nowrap> 
            	 <input type="text" name="E02DLVME6" size="17" maxlength="16" value="<%= lnParam.getE02DLVME6() %>"
            	class="context-menu-help" onmousedown="init(ledgerHelp,this.name,'','','','','')" >
             
            </td>
          </tr>
           <tr id="trclear">
            <td nowrap> 
              <div align="right"> G/L Otr. Gar. Otras :</div>
            </td>
            <td nowrap> 
            	 <input type="text" name="E02DLVMF1" size="17" maxlength="16" value="<%= lnParam.getE02DLVMF1() %>"
            	class="context-menu-help" onmousedown="init(ledgerHelp,this.name,'','','','','')" >
             
            </td>
            <td nowrap> 
            	 <input type="text" name="E02DLVMF2" size="17" maxlength="16" value="<%= lnParam.getE02DLVMF2() %>"
            	class="context-menu-help" onmousedown="init(ledgerHelp,this.name,'','','','','')" >
             
            </td>
            <td nowrap> 
            	 <input type="text" name="E02DLVMF3" size="17" maxlength="16" value="<%= lnParam.getE02DLVMF3() %>"
            	class="context-menu-help" onmousedown="init(ledgerHelp,this.name,'','','','','')" >
             
            </td>
            <td nowrap> 
            	 <input type="text" name="E02DLVMF4" size="17" maxlength="16" value="<%= lnParam.getE02DLVMF4() %>"
            	class="context-menu-help" onmousedown="init(ledgerHelp,this.name,'','','','','')" >
             
            </td>
            <td nowrap> 
            	 <input type="text" name="E02DLVMF5" size="17" maxlength="16" value="<%= lnParam.getE02DLVMF5() %>"
            	class="context-menu-help" onmousedown="init(ledgerHelp,this.name,'','','','','')" >
        
            </td>
            <td nowrap> 
            	 <input type="text" name="E02DLVMF6" size="17" maxlength="16" value="<%= lnParam.getE02DLVMF6() %>"
            	class="context-menu-help" onmousedown="init(ledgerHelp,this.name,'','','','','')" >
            
            </td>
          </tr>
          <tr id="trdark">
            <td nowrap> 
              <div align="right"> Contrapartida :</div>
            </td>
            <td nowrap> 
            	 <input type="text" name="E02DLVXC3" size="17" maxlength="16" value="<%= lnParam.getE02DLVXC3() %>"
            	class="context-menu-help" onmousedown="init(ledgerHelp,this.name,'','','','','')" >
           
            </td>
            <td nowrap> 
             
            </td>
            <td nowrap> 
             
            </td>
            <td nowrap> 
             
            </td>
            <td nowrap> 
              
            </td>
            <td nowrap> 
             
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
   <H4>Comercial</H4>
  <table  class="tableinfo" >
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="trclear">
            <td nowrap> 
              <div align="right">Terminos :</div>
            </td>
            <td nowrap> 
               (1)<eibsinput:text name="lnParam" property="E02DLVEN1" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_INTEGER %>" size="5" maxlength="5" />
           		 <select name="E02DLVET1" >
                            <OPTION value=" " <% if (!(lnParam.getE02DLVET1().equals("D") ||lnParam.getE02DLVET1().equals("M")||lnParam.getE02DLVET1().equals("Y"))) out.print("selected"); %>></OPTION>
                          
                            <OPTION value="M" <% if(lnParam.getE02DLVET1().equals("M")) out.print("selected");%>>Mes(es)</OPTION>
                           
                        </select>
            </td>
            <td nowrap> 
               (2)<eibsinput:text name="lnParam" property="E02DLVEN2" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_INTEGER %>" size="5" maxlength="5" />
            	 <select name="E02DLVET2" >
                            <OPTION value=" " <% if (!(lnParam.getE02DLVET2().equals("D") ||lnParam.getE02DLVET2().equals("M")||lnParam.getE02DLVET2().equals("Y"))) out.print("selected"); %>></OPTION>
                           
                            <OPTION value="M" <% if(lnParam.getE02DLVET2().equals("M")) out.print("selected");%>>Mes(es)</OPTION>
                           
                        </select>
            </td>
            <td nowrap> 
               (3)<eibsinput:text name="lnParam" property="E02DLVEN3" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_INTEGER %>" size="5" maxlength="5" />
            	 <select name="E02DLVET3" >
                            <OPTION value=" " <% if (!(lnParam.getE02DLVET3().equals("D") ||lnParam.getE02DLVET3().equals("M")||lnParam.getE02DLVET3().equals("Y"))) out.print("selected"); %>></OPTION>
                            
                            <OPTION value="M" <% if(lnParam.getE02DLVET3().equals("M")) out.print("selected");%>>Mes(es)</OPTION>
                            
                        </select>
            </td>
            <td nowrap> 
               (4)<eibsinput:text name="lnParam" property="E02DLVEN4" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_INTEGER %>" size="5" maxlength="5" />
            	 <select name="E02DLVET4" >
                            <OPTION value=" " <% if (!(lnParam.getE02DLVET4().equals("D") ||lnParam.getE02DLVET4().equals("M")||lnParam.getE02DLVET4().equals("Y"))) out.print("selected"); %>></OPTION>
                            
                            <OPTION value="M" <% if(lnParam.getE02DLVET4().equals("M")) out.print("selected");%>>Mes(es)</OPTION>
                            
                        </select>
            </td>
            <td nowrap> 
               (5)<eibsinput:text name="lnParam" property="E02DLVEN5" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_INTEGER %>" size="5" maxlength="5" />
            	 <select name="E02DLVET5" >
                            <OPTION value=" " <% if (!(lnParam.getE02DLVET5().equals("D") ||lnParam.getE02DLVET5().equals("M")||lnParam.getE02DLVET5().equals("Y"))) out.print("selected"); %>></OPTION>
                            
                            <OPTION value="M" <% if(lnParam.getE02DLVET5().equals("M")) out.print("selected");%>>Mes(es)</OPTION>
                            
                        </select>
            </td>
            <td nowrap> 
               (6)<eibsinput:text name="lnParam" property="E02DLVEN6" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_INTEGER %>" size="5" maxlength="5" />
            	 <select name="E02DLVET6" >
                            <OPTION value=" " <% if (!(lnParam.getE02DLVET6().equals("D") ||lnParam.getE02DLVET6().equals("M")||lnParam.getE02DLVET6().equals("Y"))) out.print("selected"); %>></OPTION>
                            
                            <OPTION value="M" <% if(lnParam.getE02DLVET6().equals("M")) out.print("selected");%>>Mes(es)</OPTION>
                            
                        </select>
            </td>
          </tr>
          <tr id="trdark">
            <td nowrap> 
              <div align="right">G/L Cap. Gar. Idonea :</div>
            </td>
            <td nowrap> 
            	 <input type="text" name="E02DLVEA1" size="17" maxlength="16" value="<%= lnParam.getE02DLVEA1() %>"
            	class="context-menu-help" onmousedown="init(ledgerHelp,this.name,'','','','','')" >
            	
            </td>
            <td nowrap> 
            	 <input type="text" name="E02DLVEA2" size="17" maxlength="16" value="<%= lnParam.getE02DLVEA2() %>"
            	class="context-menu-help" onmousedown="init(ledgerHelp,this.name,'','','','','')" >
            	
            </td>
            <td nowrap>
            	 <input type="text" name="E02DLVEA3" size="17" maxlength="16" value="<%= lnParam.getE02DLVEA3() %>"
            	class="context-menu-help" onmousedown="init(ledgerHelp,this.name,'','','','','')" >
            	 
            </td>
            <td nowrap>
            	 <input type="text" name="E02DLVEA4" size="17" maxlength="16" value="<%= lnParam.getE02DLVEA4() %>"
            	class="context-menu-help" onmousedown="init(ledgerHelp,this.name,'','','','','')" >
            	 
            </td>
            <td nowrap>
            	 <input type="text" name="E02DLVEA5" size="17" maxlength="16" value="<%= lnParam.getE02DLVEA5() %>"
            	class="context-menu-help" onmousedown="init(ledgerHelp,this.name,'','','','','')" >
            	 
            </td>
            <td nowrap>
            	 <input type="text" name="E02DLVEA6" size="17" maxlength="16" value="<%= lnParam.getE02DLVEA6() %>"
            	class="context-menu-help" onmousedown="init(ledgerHelp,this.name,'','','','','')" >
            	 
            </td>
          </tr>
           <tr id="trclear">
            <td nowrap> 
              <div align="right"> G/L Int. Gar. Idonea :</div>
            </td>
            <td nowrap>
            	 <input type="text" name="E02DLVEB1" size="17" maxlength="16" value="<%= lnParam.getE02DLVEB1() %>"
            	class="context-menu-help" onmousedown="init(ledgerHelp,this.name,'','','','','')" >
            	 
            </td>
            <td nowrap>
            	 <input type="text" name="E02DLVEB2" size="17" maxlength="16" value="<%= lnParam.getE02DLVEB2() %>"
            	class="context-menu-help" onmousedown="init(ledgerHelp,this.name,'','','','','')" >
            	 
            </td>
            <td nowrap> 
            	 <input type="text" name="E02DLVEB3" size="17" maxlength="16" value="<%= lnParam.getE02DLVEB3() %>"
            	class="context-menu-help" onmousedown="init(ledgerHelp,this.name,'','','','','')" >
            	
            </td>
            <td nowrap>
            	 <input type="text" name="E02DLVEB4" size="17" maxlength="16" value="<%= lnParam.getE02DLVEB4() %>"
            	class="context-menu-help" onmousedown="init(ledgerHelp,this.name,'','','','','')" >
            	 
            </td>
            <td nowrap> 
            	 <input type="text" name="E02DLVEB5" size="17" maxlength="16" value="<%= lnParam.getE02DLVEB5() %>"
            	class="context-menu-help" onmousedown="init(ledgerHelp,this.name,'','','','','')" >
            	
            </td>
            <td nowrap>
            	 <input type="text" name="E02DLVEB6" size="17" maxlength="16" value="<%= lnParam.getE02DLVEB6() %>"
            	class="context-menu-help" onmousedown="init(ledgerHelp,this.name,'','','','','')" >
            	 
            </td>
          </tr>
           <tr id="trdark">
            <td nowrap> 
              <div align="right">G/L Otr. Gar. Idonea :</div>
            </td>
            <td nowrap>
            	 <input type="text" name="E02DLVEC1" size="17" maxlength="16" value="<%= lnParam.getE02DLVEC1() %>"
            	class="context-menu-help" onmousedown="init(ledgerHelp,this.name,'','','','','')" >
            	 
            </td>
            <td nowrap> 
            	 <input type="text" name="E02DLVEC2" size="17" maxlength="16" value="<%= lnParam.getE02DLVEC2() %>"
            	class="context-menu-help" onmousedown="init(ledgerHelp,this.name,'','','','','')" >
            	
            </td>
            <td nowrap>
            	 <input type="text" name="E02DLVEC3" size="17" maxlength="16" value="<%= lnParam.getE02DLVEC3() %>"
            	class="context-menu-help" onmousedown="init(ledgerHelp,this.name,'','','','','')" >
            	 
            </td>
            <td nowrap>
             <input type="text" name="E02DLVEC4" size="17" maxlength="16" value="<%= lnParam.getE02DLVEC4() %>"
            	class="context-menu-help" onmousedown="init(ledgerHelp,this.name,'','','','','')" >
             
            </td>
            <td nowrap> 
            	 <input type="text" name="E02DLVEC5" size="17" maxlength="16" value="<%= lnParam.getE02DLVEC5() %>"
            	class="context-menu-help" onmousedown="init(ledgerHelp,this.name,'','','','','')" >
            	
            </td>
            <td nowrap>
            	 <input type="text" name="E02DLVEC6" size="17" maxlength="16" value="<%= lnParam.getE02DLVEC6() %>"
            	class="context-menu-help" onmousedown="init(ledgerHelp,this.name,'','','','','')" >
            	 
            </td>
          </tr>
           <tr id="trclear">
            <td nowrap> 
              <div align="right">G/L Cap. Gar. Otras :</div>
            </td>
            <td nowrap>
            	 <input type="text" name="E02DLVED1" size="17" maxlength="16" value="<%= lnParam.getE02DLVED1() %>"
            	class="context-menu-help" onmousedown="init(ledgerHelp,this.name,'','','','','')" >
            	 
            </td>
            <td nowrap>
            	 <input type="text" name="E02DLVED2" size="17" maxlength="16" value="<%= lnParam.getE02DLVED2() %>"
            	class="context-menu-help" onmousedown="init(ledgerHelp,this.name,'','','','','')" >
            	 
            </td>
            <td nowrap> 
            	 <input type="text" name="E02DLVED3" size="17" maxlength="16" value="<%= lnParam.getE02DLVED3() %>"
            	class="context-menu-help" onmousedown="init(ledgerHelp,this.name,'','','','','')" >
            	
            </td>
            <td nowrap> 
            	 <input type="text" name="E02DLVED4" size="17" maxlength="16" value="<%= lnParam.getE02DLVED4() %>"
            	class="context-menu-help" onmousedown="init(ledgerHelp,this.name,'','','','','')" >
            	
            </td>
            <td nowrap> 
            	 <input type="text" name="E02DLVED5" size="17" maxlength="16" value="<%= lnParam.getE02DLVED5() %>"
            	class="context-menu-help" onmousedown="init(ledgerHelp,this.name,'','','','','')" >
            	
            </td>
            <td nowrap>
            	 <input type="text" name="E02DLVED6" size="17" maxlength="16" value="<%= lnParam.getE02DLVED6() %>"
            	class="context-menu-help" onmousedown="init(ledgerHelp,this.name,'','','','','')" >
            	 
            </td>
          </tr>
           <tr id="trdark">
            <td nowrap> 
              <div align="right"> G/L Int. Gar. Otras :</div>
            </td>
            <td nowrap>
            	 <input type="text" name="E02DLVEE1" size="17" maxlength="16" value="<%= lnParam.getE02DLVEE1() %>"
            	class="context-menu-help" onmousedown="init(ledgerHelp,this.name,'','','','','')" >
            	 
            </td>
            <td nowrap>
            	 <input type="text" name="E02DLVEE2" size="17" maxlength="16" value="<%= lnParam.getE02DLVEE2() %>"
            	class="context-menu-help" onmousedown="init(ledgerHelp,this.name,'','','','','')" >
            	 
            </td>
            <td nowrap> 
            	 <input type="text" name="E02DLVEE3" size="17" maxlength="16" value="<%= lnParam.getE02DLVEE3() %>"
            	class="context-menu-help" onmousedown="init(ledgerHelp,this.name,'','','','','')" >
            	
            </td>
            <td nowrap>
            	 <input type="text" name="E02DLVEE4" size="17" maxlength="16" value="<%= lnParam.getE02DLVEE4() %>"
            	class="context-menu-help" onmousedown="init(ledgerHelp,this.name,'','','','','')" >
            	 
            </td>
            <td nowrap> 
            	 <input type="text" name="E02DLVEE5" size="17" maxlength="16" value="<%= lnParam.getE02DLVEE5() %>"
            	class="context-menu-help" onmousedown="init(ledgerHelp,this.name,'','','','','')" >
            	
            </td>
            <td nowrap>	
            	 <input type="text" name="E02DLVEE6" size="17" maxlength="16" value="<%= lnParam.getE02DLVEE6() %>"
            	class="context-menu-help" onmousedown="init(ledgerHelp,this.name,'','','','','')" >
            	 
            </td>
          </tr>
           <tr id="trclear">
            <td nowrap> 
              <div align="right"> G/L Otr. Gar. Otras :</div>
            </td>
            <td nowrap>
            	 <input type="text" name="E02DLVEF1" size="17" maxlength="16" value="<%= lnParam.getE02DLVEF1() %>"
            	class="context-menu-help" onmousedown="init(ledgerHelp,this.name,'','','','','')" >
            	 
            </td>
            <td nowrap>
            	 <input type="text" name="E02DLVEF2" size="17" maxlength="16" value="<%= lnParam.getE02DLVEF2() %>"
            	class="context-menu-help" onmousedown="init(ledgerHelp,this.name,'','','','','')" >
            	 
            </td>
            <td nowrap>
            	 <input type="text" name="E02DLVEF3" size="17" maxlength="16" value="<%= lnParam.getE02DLVEF3() %>"
            	class="context-menu-help" onmousedown="init(ledgerHelp,this.name,'','','','','')" >
            	 
            </td>
            <td nowrap>
            	 <input type="text" name="E02DLVEF4" size="17" maxlength="16" value="<%= lnParam.getE02DLVEF4() %>"
            	class="context-menu-help" onmousedown="init(ledgerHelp,this.name,'','','','','')" >
            	 
            </td>
            <td nowrap>
            	 <input type="text" name="E02DLVEF5" size="17" maxlength="16" value="<%= lnParam.getE02DLVEF5() %>"
            	class="context-menu-help" onmousedown="init(ledgerHelp,this.name,'','','','','')" >
            	 
            </td>
            <td nowrap>
            	 <input type="text" name="E02DLVEF6" size="17" maxlength="16" value="<%= lnParam.getE02DLVEF6() %>"
            	class="context-menu-help" onmousedown="init(ledgerHelp,this.name,'','','','','')" >
            	
            </td>
          </tr>
          <tr id="trdark">
            <td nowrap> 
              <div align="right"> Contrapartida :</div>
            </td>
            <td nowrap> 
            	 <input type="text" name="E02DLVXC4" size="17" maxlength="16" value="<%= lnParam.getE02DLVXC4() %>"
            	class="context-menu-help" onmousedown="init(ledgerHelp,this.name,'','','','','')" >
            	
            </td>
            <td nowrap> 
             
            </td>
            <td nowrap> 
             
            </td>
            <td nowrap> 
             
            </td>
            <td nowrap> 
              
            </td>
            <td nowrap> 
             
            </td>
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
