<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@ page import = "datapro.eibs.master.Util" %>
<%@page import="com.datapro.constants.EibsFields"%>
<%@page import="com.datapro.eibs.constants.HelpTypes"%>

<html>
<head>
<title>Maestro de Agencias</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

</head>

<jsp:useBean id="brnDetails" class="datapro.eibs.beans.ESD059001Message"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />

<body>

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>

<% 
    if ( !error.getERRNUM().equals("0")  ) {
        out.println("<SCRIPT Language=\"Javascript\">");
        error.setERRNUM("0");
        out.println("       showErrors()");
        out.println("</SCRIPT>");
    }
    String help = "<img src=\"" + request.getContextPath() + "/images/1b.gif\" title=\"Ayuda\" align=\"bottom\" border=\"0\" style=\"cursor:hand\" >";
%>


<H3 align="center">Mantenimiento del Maestro de Agencias <img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="branch_maintenance.jsp, ESD0590"></H3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.params.JSESD0590" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" ID="SCREEN" VALUE="600">
 
  <table  class="tableinfo">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
          <tr id="trdark"> 
            <td nowrap width="25%" > 
              <div align="right"><b>Banco :</b></div>
            </td>
            <td nowrap width="25%" > 
              <div align="left"> 
                <eibsinput:text name="brnDetails" property="E01BRNBNK" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_BANK %>" readonly="true"/>
             </div>
            </td>
            <td nowrap width="15%" > 
              <div align="right"><b>Agencia :</b></div>
            </td>
            <td nowrap width="35%"> 
              <div align="left"><font face="Arial"><font face="Arial"><font size="2"> 
                <eibsinput:text name="brnDetails" property="E01BRNNUM" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_BRANCH %>" readonly="true"/>
                </font></font></font></div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>

  <h4>Informaci&oacute;n de la Agencia</h4>  

  <%int row = 0; %>
  <table  class="tableinfo">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="30%"> 
              <div align="right">Nombre :</div>
            </td>
            <td nowrap width="70%" colspan="3"> 
                <eibsinput:text name="brnDetails" property="E01BRNNME" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" required="true" />
           </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="30%" height="23"> 
              <div align="right">Dirección :</div>
            </td>
            <td nowrap height="23" colspan="3"> 
                <eibsinput:text name="brnDetails" property="E01BRNADR" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" />
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="30%" height="23"> 
            </td>
            <td nowrap height="23" colspan="3"> 
                <eibsinput:text name="brnDetails" property="E01BRNAD2" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" />
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="30%" height="23"> 
            </td>
            <td nowrap height="23" colspan="3"> 
                <eibsinput:text name="brnDetails" property="E01BRNAD3" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" />
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="30%" height="19" align="right">País : </td>
            <td nowrap height="19" colspan="3"> 
               <eibsinput:cnofc name="brnDetails" flag="03" property="E01BRNCTR" fn_description="E01CTRNME" required="false"/>
               <eibsinput:text	name="brnDetails" property="E01CTRNME" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true"/>
           </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="30%" height="19" align="right">Departamento : </td>
            <td nowrap height="19" colspan="3"> 
               <input type="text" name="E01BRNCMC" size="5" maxlength="2" value="<%= brnDetails.getE01BRNCMC().trim()%>">
               <a href="javascript:Get2FilterCodes('E01BRNCMC','E01CMCNME','27', '',document.forms[0]['E01BRNCTR'].value)" ><%=help%></a>
               <eibsinput:text	name="brnDetails" property="E01CMCNME" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true"/>
           </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="30%" height="19" align="right">Ciudad : </td>
            <td nowrap height="19" colspan="3"> 
            	<input type="text" name="E01BRNCTC" size="5" maxlength="3" value="<%= brnDetails.getE01BRNCTC().trim()%>">
            	<a href="javascript:Get2FilterCodes('E01BRNCTC','E01BRNCIT','84', '',document.forms[0]['E01BRNCMC'].value)" ><%=help%></a>
                <eibsinput:text  name="brnDetails" property="E01BRNCIT" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true"/>
             </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="30%" height="19" align="right">Región : </td>
            <td nowrap height="19" colspan="3"> 
               <eibsinput:cnofc name="brnDetails" flag="07" property="E01BRNRGN" fn_description="E01RGNNME" required="false"/>
               <eibsinput:text	name="brnDetails" property="E01RGNNME" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true"/>
           </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="30%" height="19" align="right">Región Comercial : </td>
            <td nowrap height="19" colspan="3"> 
               <eibsinput:cnofc name="brnDetails" flag="TG" property="E01BRNUS1" fn_description="E01US1NME" required="false"/>
               <eibsinput:text	name="brnDetails" property="E01US1NME" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true"/>
           </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="30%" height="19" align="right">Zona Comercial : </td>
            <td nowrap height="19" colspan="3">
            	<input type="text" name="E01BRNSBR" size="5" maxlength="4" value="<%= brnDetails.getE01BRNSBR().trim()%>" >
              	<a href="javascript:Get2FilterCodes('E01BRNSBR','E01SBRNME','LC', '',document.forms[0]['E01BRNUS1'].value)" ><%=help%></a> 
              	<eibsinput:text name="brnDetails" property="E01SBRNME" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true"/>
              	
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="30%" height="19"> 
              <div align="right">Plaza :</div>
            </td>
            <td nowrap height="19" colspan="3"> 
               <eibsinput:cnofc name="brnDetails" flag="PA" property="E01BRNBK2" fn_description="E01BK2NME" required="false"/>
               <eibsinput:text
               		name="brnDetails" property="E01BK2NME" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true"/>
           </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="30%" height="19"> 
              <div align="right">Telef&oacute;no :</div>
            </td>
            <td nowrap width="30%" height="19" colspan="3"> 
                <eibsinput:text name="brnDetails" property="E01BRNPHN" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_PHONE %>" />
            </td>
          </tr>

          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="30%" height="19"> 
              <div align="right">Identificaci&oacute;n : </div>
            </td>
            <td nowrap width="28%" height="19" colspan="3"> 
               <eibsinput:text name="brnDetails" property="E01BRNDID" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_IDENTIFICATION %>" />
            </td>
          </tr>

          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="30%"> 
              <div align="right">Notario :</div>
            </td>
            <td nowrap width="28%" colspan="3"> 
              <eibsinput:help name="brnDetails" property="E01BRNBKC" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_BROKER%>" fn_param_one="E01BRNBKC" fn_param_two="E01BKCNME" fn_param_three="N"/>
               <eibsinput:text	name="brnDetails" property="E01BKCNME" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true"/>
 			</td>
          </tr>

          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="30%" height="19"> 
              <div align="right">Oficial Principal : </div>
            </td>
            <td nowrap width="28%" height="19" colspan="3"> 
               <eibsinput:cnofc name="brnDetails" flag="15" property="E01BRNOFC" fn_description="E01OFCNME" required="false"/>
               <eibsinput:text	name="brnDetails" property="E01OFCNME" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true"/>
 	        </td>
          </tr>

          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="30%" height="19"> 
              <div align="right">Sub-Oficial :</div>
            </td>
            <td nowrap width="70%" height="19" colspan="3"> 
               <eibsinput:cnofc name="brnDetails" flag="15" property="E01BRNOF2" fn_description="E01OF2NME" required="false"/>
               <eibsinput:text name="brnDetails" property="E01OF2NME" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true"/>
          </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="16%"> 
              <div align="right">Oficina Matriz :</div>
            </td>
	            <td nowrap width="28%"> 
             <eibsinput:help name="brnDetails" property="E01BRNMNB" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_BRANCH%>" required="false"
          	    	fn_param_one="E01BRNMNB" fn_param_two="document.getElementById('E01BRNBNK').value" fn_param_three="E01MNBNME"/>
              <eibsinput:text name="brnDetails" property="E01MNBNME" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true"/>
	        </td>
            <td nowrap width="16%" height="19"> 
              <div align="right">Tipo de Oficina :</div>
            </td>
            <td nowrap width="28%" height="19"> 
               	<SELECT name="E01BRNFL1" id="E01BRNFL1">
					<OPTION value="L"
						<%if (brnDetails.getE01BRNFL1().equals("L")) { out.print("selected"); }%>>Local
					</OPTION>
					<OPTION value="I"
						<%if (brnDetails.getE01BRNFL1().equals("I")) { out.print("selected"); }%>>Internacional
					</OPTION>
					<OPTION value="M"
						<%if (brnDetails.getE01BRNFL1().equals("M")) { out.print("selected"); }%>>Casa Matriz
					</OPTION>
					<OPTION value="O"
						<%if (brnDetails.getE01BRNFL1().equals("O")) { out.print("selected"); }%>>Otra
					</OPTION>
				</SELECT>
			</td>

          </tr>
          
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="20%" height="19"> 
              <div align="right">Cuenta Corriente Cheques de Gerencia :</div>
            </td>
            <td nowrap width="30%" height="19"> 
              <input type="text" name="E01BRNPH3" size="13" maxlength="12"  value="<%= brnDetails.getE01BRNPH3().trim()%>"onKeypress="enterInteger(event)">
              <a href="javascript:GetAccount('E01BRNPH3','','RA','')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="middle" border="0"  ></a> 
            </td>
            <td nowrap width="20%" height="19" align="right">Estado : </td>
            <td nowrap width="30%" height="19" align="left"> 
            	<select name="E01BRNFL6" id="E01BRNFL6">
                    <option value=" " <% if (!(brnDetails.getE01BRNFL6().equals("A")||brnDetails.getE01BRNFL6().equals("I"))) out.print("selected"); %>> 
                    </option>
                    <option value="A" <% if (brnDetails.getE01BRNFL6().equals("A")) out.print("selected"); %>>Activo</option>
                    <option value="I" <% if (brnDetails.getE01BRNFL6().equals("I")) out.print("selected"); %>>Inactivo</option>                   
                  </select>	
            </td>
          </tr>
          
        </table>
      </td>
    </tr>
  </table>
  
   
  
    <h4>Informaci&oacute;n del Canje</h4>  

  <table  class="tableinfo">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="16%" height="19"> 
              <div align="right">Centro de Canje :</div>
            </td>
            <td nowrap width="30%" height="19"> 
             <eibsinput:help name="brnDetails" property="E01BRNCLB" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_BRANCH%>" required="false"
          	    	fn_param_one="E01BRNCLB" fn_param_two="document.getElementById('E01BRNBNK').value" fn_param_three="E01CLRNME"/>
              <eibsinput:text name="brnDetails" property="E01CLRNME" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true"/>
            </td>
            <td nowrap width="20%" height="19"> 
              <div align="right">Tipos de Compensacion :</div>
            </td>
            <td nowrap width="30%" height="19"> 
            	<select name="E01BRNFL2" id="E01BRNFL2">
                    <option value="C" <% if (brnDetails.getE01BRNFL2().equals("C")) out.print("selected"); %>>Cedec</option>
                    <option value="R" <% if (brnDetails.getE01BRNFL2().equals("R")) out.print("selected"); %>>Republica</option>                   
                    <option value="B" <% if (brnDetails.getE01BRNFL2().equals("B")) out.print("selected"); %>>Banco Delegado</option>
                    <option value="D" <% if (brnDetails.getE01BRNFL2().equals("D")) out.print("selected"); %>>Directo</option>                   
                </select>	
          </tr>
            <td nowrap width="16%" height="19"> 
              <div align="right">Ruta de Compensacion :</div>
            </td>
            <td nowrap width="30%" height="19"> 
	            <eibsinput:cnofc name="brnDetails" flag="89" property="E01BRNUS2" fn_code="E01BRNUS2" fn_description="E01US2NME" readonly="false" />
                <eibsinput:text name="brnDetails" property="E01US2NME" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true"/>
            </td>
            <td nowrap width="20%" height="19"> 
              <div align="right"></div>
            </td>
            <td nowrap width="30%" height="19"> 
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
</HTML>
