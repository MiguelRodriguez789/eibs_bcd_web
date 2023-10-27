<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@ page import = "datapro.eibs.master.Util" %>
<%@page import="com.datapro.constants.EibsFields"%>
<%@page import="com.datapro.eibs.constants.HelpTypes"%>

<html>
<head>
<title>Tablas de prevision</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet"></head>

<jsp:useBean id="prevDetails" class="datapro.eibs.beans.EDL054901Message"  scope="session" />

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />

<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />

<body>

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>

<% 
    if ( !error.getERRNUM().equals("0")  ) {
        out.println("<SCRIPT Language=\"Javascript\">");
        error.setERRNUM("0");
        out.println("       showErrors()");
        out.println("</SCRIPT>");
    }
    
%>


<H3 align="center">Tablas de Calificaci&oacute;n por Temporalidad<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="prevision_detail.jsp, EDL0549"></H3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.params.JSEDL0549" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="600">
  
  <%int row = 0; %>
  <table  class="tableinfo">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
          <tr id="trdark"> 
            <td nowrap width="16%" > 
              <div align="right"><b>Tabla :</b></div>
            </td>
            <td nowrap width="20%" > 
              <div align="left"> 
               <% if(userPO.getPurpose().equals("NEW")){ %>  
	                <input type="text" name="E01PRATBL" size="3" maxlength="2"  value="<%= prevDetails.getE01PRATBL().trim()%>" >
				<% } else { %>
	                <input type="text" name="E01PRATBL" size="3" maxlength="2"  value="<%= prevDetails.getE01PRATBL().trim()%>" readonly >
				<% } %>
              </div>
            </td>
            <td nowrap width="16%" > 
              <div align="right"><b>Descripci&oacute;n :</b></div>
            </td>
            <td nowrap colspan="3" > 
              <div align="left"><font face="Arial"><font face="Arial"><font size="2"> 
                <input type="text" name="E01PRADSC" size="48"  maxlength="45" value="<%= prevDetails.getE01PRADSC().trim()%>">
                </font></font></font></div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <br>  
  <table  class="tableinfo">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
     

          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="10%"> 
              <div align="center"><b>Nivel</b></div>            </td>
            <td nowrap width="10%"> 
              <div align="center"><b>D&iacute;as <br>
                Vencimiento</b></div>            </td>
             
            <td nowrap width="10%"> 
              <div align="center"><b>C&oacute;digo <br>
                Calificaci&oacute;n</b></div>            </td>			
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap height="23"> 
              <div align="center"><b>1</b></div>            </td>
            <td nowrap height="23"> 
              <div align="center"> 
	               <eibsinput:text	name="prevDetails" property="E01PRADY1" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_INTEGER %>" maxlength="5" size="6"/>
              </div>            </td>
            <td nowrap height="23"> 
             <div align="center">
                <input type="text" maxlength="2" size="3" value="<%= prevDetails.getE01PRACA1().trim()%>" name="E01PRACA1" >
               <a href="javascript:GetCodeCNOFC('E01PRACA1','K4')"><img src="<%=request.getContextPath()%>/images/1b.gif" title=". . ." align="bottom" border="0"  ></a> 
              </div>         </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap  height="23"> 
              <div align="center"><b>2</b></div>            </td>
            <td nowrap height="23"> 
              <div align="center">
	               <eibsinput:text	name="prevDetails" property="E01PRADY2" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_INTEGER %>" maxlength="5" size="6"/>
              </div>            </td>
            <td nowrap height="23"> 
              <div align="center">
                <input type="text" maxlength="2" size="3" value="<%= prevDetails.getE01PRACA2().trim()%>" name="E01PRACA2" >
               <a href="javascript:GetCodeCNOFC('E01PRACA2','K4')"><img src="<%=request.getContextPath()%>/images/1b.gif" title=". . ." align="bottom" border="0"  ></a> 
              </div>          </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap  height="23"> 
              <div align="center"><b>3</b></div>            </td>
            <td nowrap  height="23"> 
              <div align="center">
	               <eibsinput:text	name="prevDetails" property="E01PRADY3" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_INTEGER %>" maxlength="5" size="6"/>
              </div>            </td>
            <td nowrap height="23"> 
             <div align="center">
                <input type="text" maxlength="2" size="3" value="<%= prevDetails.getE01PRACA3().trim()%>" name="E01PRACA3" >
               <a href="javascript:GetCodeCNOFC('E01PRACA3','K4')"><img src="<%=request.getContextPath()%>/images/1b.gif" title=". . ." align="bottom" border="0"  ></a> 
              </div>              </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap  height="23"> 
              <div align="center"><b>4</b></div>            </td>
            <td nowrap  height="23"> 
              <div align="center">
	               <eibsinput:text	name="prevDetails" property="E01PRADY4" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_INTEGER %>" maxlength="5" size="6"/>
              </div>            </td>
            <td nowrap height="23"> 
              <div align="center">
                <input type="text" maxlength="2" size="3" value="<%= prevDetails.getE01PRACA4().trim()%>" name="E01PRACA4" >
               <a href="javascript:GetCodeCNOFC('E01PRACA4','K4')"><img src="<%=request.getContextPath()%>/images/1b.gif" title=". . ." align="bottom" border="0"  ></a> 
              </div>            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap  height="23"> 
              <div align="center"><b>5</b></div>            </td>
            <td nowrap height="23"> 
              <div align="center">
	               <eibsinput:text	name="prevDetails" property="E01PRADY5" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_INTEGER %>" maxlength="5" size="6"/>
              </div>            </td>
            <td nowrap  height="23"> 
              <div align="center">
                <input type="text" maxlength="2" size="3" value="<%= prevDetails.getE01PRACA5().trim()%>" name="E01PRACA5" >
               <a href="javascript:GetCodeCNOFC('E01PRACA5','K4')"><img src="<%=request.getContextPath()%>/images/1b.gif" title=". . ." align="bottom" border="0"  ></a> 
              </div>             </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap height="23"> 
              <div align="center"><b>6</b></div>            </td>
            <td nowrap  height="23"> 
              <div align="center">
	               <eibsinput:text	name="prevDetails" property="E01PRADY6" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_INTEGER %>" maxlength="5" size="6"/>
              </div>            </td>
            <td nowrap  height="23"> 
              <div align="center">
                <input type="text" maxlength="2" size="3" value="<%= prevDetails.getE01PRACA6().trim()%>" name="E01PRACA6" >
               <a href="javascript:GetCodeCNOFC('E01PRACA6','K4')"><img src="<%=request.getContextPath()%>/images/1b.gif" title=". . ." align="bottom" border="0"  ></a> 
              </div>            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap  height="23"> 
              <div align="center"><b>7</b></div>            </td>
            <td nowrap  height="23"> 
              <div align="center">
	               <eibsinput:text	name="prevDetails" property="E01PRADY7" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_INTEGER %>" maxlength="5" size="6"/>
              </div>            </td>
            <td nowrap  height="23"> 
             <div align="center">
                <input type="text" maxlength="2" size="3" value="<%= prevDetails.getE01PRACA7().trim()%>" name="E01PRACA7" >
               <a href="javascript:GetCodeCNOFC('E01PRACA7','K4')"><img src="<%=request.getContextPath()%>/images/1b.gif" title=". . ." align="bottom" border="0"  ></a> 
              </div>            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap  height="23"> 
              <div align="center"><b>8</b></div>            </td>
            <td nowrap  height="23"> 
              <div align="center">
 	               <eibsinput:text	name="prevDetails" property="E01PRADY8" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_INTEGER %>" maxlength="5" size="6"/>
              </div>            </td>
            <td nowrap width="28%" height="23"> 
              <div align="center">
                <input type="text" maxlength="2" size="3" value="<%= prevDetails.getE01PRACA8().trim()%>" name="E01PRACA8" >
               <a href="javascript:GetCodeCNOFC('E01PRACA8','K4')"><img src="<%=request.getContextPath()%>/images/1b.gif" title=". . ." align="bottom" border="0"  ></a> 
              </div>            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap  height="23"> 
              <div align="center"><b>9</b></div>            </td>
            <td nowrap  height="23"> 
              <div align="center">
	               <eibsinput:text	name="prevDetails" property="E01PRADY9" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_INTEGER %>" maxlength="5" size="6"/>
              </div>            </td>
            <td nowrap  height="23"> 
              <div align="center">
                <input type="text" maxlength="2" size="3" value="<%= prevDetails.getE01PRACA9().trim()%>" name="E01PRACA9" >
               <a href="javascript:GetCodeCNOFC('E01PRACA9','K4')"><img src="<%=request.getContextPath()%>/images/1b.gif" title=". . ." align="bottom" border="0"  ></a> 
              </div>           </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>



 
  <br>
  <table  class="tableinfo">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
		<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap colspan="3" > 
              <div align="left"><font face="Arial"><font face="Arial"><font size="2"> 
                Clase de Credito: 
                     <input type="text" name="E01PRATCR" maxlength="1" size="5" value="<%= prevDetails.getE01PRATCR()%>" >
                <a
					href="javascript:GetCode('E01PRATCR','STATIC_ln_prod_sup.jsp')"><img
					src="<%=request.getContextPath()%>/images/1b.gif" title=". . ."
					align="bottom" border="0"></a>
              
			  
			  </font></font></font>
			  </div>
			  
            </td>
			
          </tr>
		   <%if(!currUser.getE01INT().equals("05")){%>  
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap colspan="3" > 
              <div align="left"><font face="Arial"><font face="Arial"><font size="2"> 
                Calificaci&oacute;n que indica Previsi&oacute;n/Calificaci&oacute;n 
                Global Cliente : 
                <input type="text" maxlength="2" size="3" value="<%= prevDetails.getE01PRALMC().trim()%>" name="E01PRALMC" >
                <a href="javascript:GetCodeCNOFC('E01PRALMC','SA')"><img src="<%=request.getContextPath()%>/images/1b.gif" title=". . ." align="bottom" border="0"  ></a> 
                </font></font></font></div>
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap colspan="3" >(Si la Previsi&oacute;n es por Cr&eacute;ditos 
              Individuales, basados en su <b>n&uacute;mero de nivel</b>,</td>
          </tr>
          <tr id="trdark">
            <td nowrap colspan="3" >dejar el <b>campo en blanco</b>, si es por 
              Cliente/Calificaci&oacute;n, entre el<b> c&oacute;digo correspondiente</b>)</td>
          </tr>
		     <%}%>  
        </table>
      </td>
    </tr>
  </table>

  <p><br>
  </p>
  <div align="center"> 
            <input id="EIBSBTN" type=submit name="Submit" value="Enviar">
  </div>
</form>
</body>
</html>
