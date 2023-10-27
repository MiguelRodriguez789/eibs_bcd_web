<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@ page import = "datapro.eibs.master.Util" %>
<%@page import="com.datapro.constants.EibsFields"%>
<%@page import="com.datapro.eibs.constants.HelpTypes"%>

<html>
<head>
<title>Tablas/Mejora Calificacion Prestamos Modificados/Reestructurados</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet"></head>

<jsp:useBean id="prevDetails" class="datapro.eibs.beans.EDL055401Message"  scope="session" />

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


<h3 align="center">
Tablas/Mejora Calificacion Prestamos 
<% if (userPO.getOption().equals("MODIF")){ %>
Modificados<%}%>
<% if (userPO.getOption().equals("REEST")){ %>
Reestructurados
 <%}%>
<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="prevision_detail.jsp, EDL0554"></H3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.params.JSEDL0554" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="600">
  <INPUT TYPE=HIDDEN NAME="E01MODTYP" value="<%= prevDetails.getE01MODTYP().trim()%>">
  
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
	                <input type="text" name="E01MODTBL" size="3" maxlength="2"  value="<%= prevDetails.getE01MODTBL().trim()%>" >
				<% } else { %>
	                <input type="text" name="E01MODTBL" size="3" maxlength="2"  value="<%= prevDetails.getE01MODTBL().trim()%>" readonly >
				<% } %>
              </div>
            </td>
            <td nowrap width="16%" > 
              <div align="right"><b>Descripci&oacute;n :</b></div>
            </td>
            <td nowrap colspan="3" > 
              <div align="left"><font face="Arial"><font face="Arial"><font size="2"> 
                <input type="text" name="E01MODDSC" size="48"  maxlength="45" value="<%= prevDetails.getE01MODDSC().trim()%>">
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
              <div align="center"><b>Calificación</b></div>            </td>
             
            <td nowrap width="10%"><div align="center"><b>Nueva <br>
              Calificaci&oacute;n</b></div></td>
            <td nowrap width="10%"><div align="center"><b>N. Meses o Cuotas </b></div></td>
            <td nowrap width="10%"><div align="center"><b>Operador<br>Y/O</b></div></td>
            <td nowrap width="10%"> 
              <div align="center"><b>
                Calificaci&oacute;n <br> Score </b></div>            </td>			
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap height="23"> 
              <div align="center"><b>1</b></div>            </td>
            <td nowrap height="23"> 
              <div align="center"> 
	              <input type="text" maxlength="2" size="3" value="<%= prevDetails.getE01MODCA1().trim()%>" name="E01MODCA1" >
              <a href="javascript:GetCodeCNOFC('E01MODCA1','SA')"><img src="<%=request.getContextPath()%>/images/1b.gif" title=". . ." align="bottom" border="0"  ></a>              </div>            </td>
            <td nowrap><div align="center">
                <input type="text" maxlength="2" size="3" value="<%= prevDetails.getE01MODNA1().trim()%>" name="E01MODNA1" >
            <a href="javascript:GetCodeCNOFC('E01MODNA1','SA')"><img src="<%=request.getContextPath()%>/images/1b.gif" title=". . ." align="bottom" border="0"  ></a> </div></td>
            <td nowrap><div align="center">
                <input type="text" maxlength="3" size="5" value="<%= prevDetails.getE01MODDM1().trim()%>" name="E01MODDM1" onKeypress="enterInteger(event)">
           </div></td>
            <td nowrap><div align="center">
                <input type="text" maxlength="1" size="3" value="<%= prevDetails.getE01MODOP1().trim()%>" name="E01MODOP1" >
            </div></td>
            <td nowrap height="23"> 
             <div align="center">
                <input type="text" maxlength="2" size="3" value="<%= prevDetails.getE01MODCH1().trim()%>" name="E01MODCH1" >
              <a href="javascript:GetCodeCNOFC('E01MODCH1','SA')"><img src="<%=request.getContextPath()%>/images/1b.gif" title=". . ." align="bottom" border="0"  ></a>              </div>         </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap  height="23"> 
              <div align="center"><b>2</b></div>            </td>
            <td nowrap height="23"> 
              <div align="center">
	                <input type="text" maxlength="2" size="3" value="<%= prevDetails.getE01MODCA2().trim()%>" name="E01MODCA2" >
              <a href="javascript:GetCodeCNOFC('E01MODCA2','SA')"><img src="<%=request.getContextPath()%>/images/1b.gif" title=". . ." align="bottom" border="0"  ></a>              </div>            </td>
            <td nowrap><div align="center">
                <input type="text" maxlength="2" size="3" value="<%= prevDetails.getE01MODNA2().trim()%>" name="E01MODNA2" >
            <a href="javascript:GetCodeCNOFC('E01MODNA2','SA')"><img src="<%=request.getContextPath()%>/images/1b.gif" title=". . ." align="bottom" border="0"  ></a> </div></td>
            <td nowrap><div align="center">
                <input type="text" maxlength="3" size="5" value="<%= prevDetails.getE01MODDM2().trim()%>" name="E01MODDM2" onKeypress="enterInteger(event)">
          </div></td>
            <td nowrap><div align="center">
                <input type="text" maxlength="1" size="3" value="<%= prevDetails.getE01MODOP2().trim()%>" name="E01MODOP2" >
            </div></td>
            <td nowrap height="23"> 
              <div align="center">
                <input type="text" maxlength="2" size="3" value="<%= prevDetails.getE01MODCH2().trim()%>" name="E01MODCH2" >
              <a href="javascript:GetCodeCNOFC('E01MODCH2','SA')"><img src="<%=request.getContextPath()%>/images/1b.gif" title=". . ." align="bottom" border="0"  ></a>              </div>          </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap  height="23"> 
              <div align="center"><b>3</b></div>            </td>
            <td nowrap  height="23"> 
              <div align="center">
	                  <input type="text" maxlength="2" size="3" value="<%= prevDetails.getE01MODCA3().trim()%>" name="E01MODCA3" >
              <a href="javascript:GetCodeCNOFC('E01MODCA3','SA')"><img src="<%=request.getContextPath()%>/images/1b.gif" title=". . ." align="bottom" border="0"  ></a>              </div>            </td>
            <td nowrap><div align="center">
                <input type="text" maxlength="2" size="3" value="<%= prevDetails.getE01MODNA3().trim()%>" name="E01MODNA3" >
            <a href="javascript:GetCodeCNOFC('E01MODNA3','SA')"><img src="<%=request.getContextPath()%>/images/1b.gif" title=". . ." align="bottom" border="0"  ></a> </div></td>
            <td nowrap><div align="center">
                <input type="text" maxlength="3" size="5" value="<%= prevDetails.getE01MODDM3().trim()%>" name="E01MODDM3" onKeypress="enterInteger(event)">
            </div></td>
            <td nowrap><div align="center">
                <input type="text" maxlength="1" size="3" value="<%= prevDetails.getE01MODOP3().trim()%>" name="E01MODOP3" >
           </div></td>
            <td nowrap height="23"> 
             <div align="center">
                <input type="text" maxlength="2" size="3" value="<%= prevDetails.getE01MODCH3().trim()%>" name="E01MODCH3" >
              <a href="javascript:GetCodeCNOFC('E01MODCH3','SA')"><img src="<%=request.getContextPath()%>/images/1b.gif" title=". . ." align="bottom" border="0"  ></a>              </div>              </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap  height="23"> 
              <div align="center"><b>4</b></div>            </td>
            <td nowrap  height="23"> 
              <div align="center">
	                 <input type="text" maxlength="2" size="3" value="<%= prevDetails.getE01MODCA4().trim()%>" name="E01MODCA4" >
              <a href="javascript:GetCodeCNOFC('E01MODCA4','SA')"><img src="<%=request.getContextPath()%>/images/1b.gif" title=". . ." align="bottom" border="0"  ></a>              </div>            </td>
            <td nowrap><div align="center">
                <input type="text" maxlength="2" size="3" value="<%= prevDetails.getE01MODNA4().trim()%>" name="E01MODNA4" >
            <a href="javascript:GetCodeCNOFC('E01MODNA4','SA')"><img src="<%=request.getContextPath()%>/images/1b.gif" title=". . ." align="bottom" border="0"  ></a> </div></td>
            <td nowrap><div align="center">
                <input type="text" maxlength="3" size="5" value="<%= prevDetails.getE01MODDM4().trim()%>" name="E01MODDM4" onKeypress="enterInteger(event)">
            </div></td>
            <td nowrap><div align="center">
                <input type="text" maxlength="1" size="3" value="<%= prevDetails.getE01MODOP4().trim()%>" name="E01MODOP4" >
            </div></td>
            <td nowrap height="23"> 
              <div align="center">
                <input type="text" maxlength="2" size="3" value="<%= prevDetails.getE01MODCH4().trim()%>" name="E01MODCH4" >
              <a href="javascript:GetCodeCNOFC('E01MODCH4','SA')"><img src="<%=request.getContextPath()%>/images/1b.gif" title=". . ." align="bottom" border="0"  ></a>              </div>            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap  height="23"> 
              <div align="center"><b>5</b></div>            </td>
            <td nowrap height="23"> 
              <div align="center">
	                  <input type="text" maxlength="2" size="3" value="<%= prevDetails.getE01MODCA5().trim()%>" name="E01MODCA5" >
              <a href="javascript:GetCodeCNOFC('E01MODCA5','SA')"><img src="<%=request.getContextPath()%>/images/1b.gif" title=". . ." align="bottom" border="0"  ></a>              </div>            </td>
            <td nowrap><div align="center">
                <input type="text" maxlength="2" size="3" value="<%= prevDetails.getE01MODNA5().trim()%>" name="E01MODNA5" >
            <a href="javascript:GetCodeCNOFC('E01MODNA5','SA')"><img src="<%=request.getContextPath()%>/images/1b.gif" title=". . ." align="bottom" border="0"  ></a> </div></td>
            <td nowrap><div align="center">
                <input type="text" maxlength="3" size="5" value="<%= prevDetails.getE01MODDM5().trim()%>" name="E01MODDM5" onKeypress="enterInteger(event)">
            </div></td>
            <td nowrap><div align="center">
                <input type="text" maxlength="1" size="3" value="<%= prevDetails.getE01MODOP5().trim()%>" name="E01MODOP5" >
            </div></td>
            <td nowrap  height="23"> 
              <div align="center">
                <input type="text" maxlength="2" size="3" value="<%= prevDetails.getE01MODCH5().trim()%>" name="E01MODCH5" >
              <a href="javascript:GetCodeCNOFC('E01MODCH5','SA')"><img src="<%=request.getContextPath()%>/images/1b.gif" title=". . ." align="bottom" border="0"  ></a>              </div>             </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap height="23"> 
              <div align="center"><b>6</b></div>            </td>
            <td nowrap  height="23"> 
              <div align="center">
	                  <input type="text" maxlength="2" size="3" value="<%= prevDetails.getE01MODCA6().trim()%>" name="E01MODCA6" >
              <a href="javascript:GetCodeCNOFC('E01MODCA6','SA')"><img src="<%=request.getContextPath()%>/images/1b.gif" title=". . ." align="bottom" border="0"  ></a>              </div>            </td>
            <td nowrap><div align="center">
                <input type="text" maxlength="2" size="3" value="<%= prevDetails.getE01MODNA6().trim()%>" name="E01MODNA6" >
            <a href="javascript:GetCodeCNOFC('E01MODNA6','SA')"><img src="<%=request.getContextPath()%>/images/1b.gif" title=". . ." align="bottom" border="0"  ></a> </div></td>
            <td nowrap><div align="center">
                <input type="text" maxlength="3" size="5" value="<%= prevDetails.getE01MODDM6().trim()%>" name="E01MODDM6" onKeypress="enterInteger(event)">
            </div></td>
            <td nowrap><div align="center">
                <input type="text" maxlength="1" size="3" value="<%= prevDetails.getE01MODOP6().trim()%>" name="E01MODOP6" >
            </div></td>
            <td nowrap  height="23"> 
              <div align="center">
                <input type="text" maxlength="2" size="3" value="<%= prevDetails.getE01MODCH6().trim()%>" name="E01MODCH6" >
              <a href="javascript:GetCodeCNOFC('E01MODCH6','SA')"><img src="<%=request.getContextPath()%>/images/1b.gif" title=". . ." align="bottom" border="0"  ></a>              </div>            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap  height="23"> 
              <div align="center"><b>7</b></div>            </td>
            <td nowrap  height="23"> 
              <div align="center">
	                <input type="text" maxlength="2" size="3" value="<%= prevDetails.getE01MODCA7().trim()%>" name="E01MODCA7" >
              <a href="javascript:GetCodeCNOFC('E01MODCA7','SA')"><img src="<%=request.getContextPath()%>/images/1b.gif" title=". . ." align="bottom" border="0"  ></a>              </div>            </td>
            <td nowrap><div align="center">
                <input type="text" maxlength="2" size="3" value="<%= prevDetails.getE01MODNA7().trim()%>" name="E01MODNA7" >
            <a href="javascript:GetCodeCNOFC('E01MODNA7','SA')"><img src="<%=request.getContextPath()%>/images/1b.gif" title=". . ." align="bottom" border="0"  ></a> </div></td>
            <td nowrap><div align="center">
                <input type="text" maxlength="3" size="5" value="<%= prevDetails.getE01MODDM7().trim()%>" name="E01MODDM7" onKeypress="enterInteger(event)">
            </div></td>
            <td nowrap><div align="center">
                <input type="text" maxlength="1" size="3" value="<%= prevDetails.getE01MODOP7().trim()%>" name="E01MODOP7" >
            </div></td>
            <td nowrap  height="23"> 
             <div align="center">
                <input type="text" maxlength="2" size="3" value="<%= prevDetails.getE01MODCH7().trim()%>" name="E01MODCH7" >
              <a href="javascript:GetCodeCNOFC('E01MODCH7','SA')"><img src="<%=request.getContextPath()%>/images/1b.gif" title=". . ." align="bottom" border="0"  ></a>              </div>            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap  height="23"> 
              <div align="center"><b>8</b></div>            </td>
            <td nowrap  height="23"> 
              <div align="center">
 	                  <input type="text" maxlength="2" size="3" value="<%= prevDetails.getE01MODCA8().trim()%>" name="E01MODCA8" >
              <a href="javascript:GetCodeCNOFC('E01MODCA8','SA')"><img src="<%=request.getContextPath()%>/images/1b.gif" title=". . ." align="bottom" border="0"  ></a>              </div>            </td>
            <td nowrap width="28%"><div align="center">
                <input type="text" maxlength="2" size="3" value="<%= prevDetails.getE01MODNA8().trim()%>" name="E01MODNA8" >
            <a href="javascript:GetCodeCNOFC('E01MODNA8','SA')"><img src="<%=request.getContextPath()%>/images/1b.gif" title=". . ." align="bottom" border="0"  ></a> </div></td>
            <td nowrap><div align="center">
                <input type="text" maxlength="3" size="5" value="<%= prevDetails.getE01MODDM8().trim()%>" name="E01MODDM8" onKeypress="enterInteger(event)">
            </div></td>
            <td nowrap><div align="center">
                <input type="text" maxlength="1" size="3" value="<%= prevDetails.getE01MODOP8().trim()%>" name="E01MODOP8" >
           </div></td>
            <td nowrap width="28%" height="23"> 
              <div align="center">
                <input type="text" maxlength="2" size="3" value="<%= prevDetails.getE01MODCH8().trim()%>" name="E01MODCH8" >
              <a href="javascript:GetCodeCNOFC('E01MODCH8','SA')"><img src="<%=request.getContextPath()%>/images/1b.gif" title=". . ." align="bottom" border="0"  ></a>              </div>            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap  height="23"> 
              <div align="center"><b>9</b></div>            </td>
            <td nowrap  height="23"> 
              <div align="center">
	                  <input type="text" maxlength="2" size="3" value="<%= prevDetails.getE01MODCA9().trim()%>" name="E01MODCA9" >
              <a href="javascript:GetCodeCNOFC('E01MODCA9','SA')"><img src="<%=request.getContextPath()%>/images/1b.gif" title=". . ." align="bottom" border="0"  ></a>              </div>            </td>
            <td nowrap><div align="center">
                <input type="text" maxlength="2" size="3" value="<%= prevDetails.getE01MODNA9().trim()%>" name="E01MODNA9" >
            <a href="javascript:GetCodeCNOFC('E01MODNA9','SA')"><img src="<%=request.getContextPath()%>/images/1b.gif" title=". . ." align="bottom" border="0"  ></a> </div></td>
            <td nowrap><div align="center">
                <input type="text" maxlength="3" size="5" value="<%= prevDetails.getE01MODDM9().trim()%>" name="E01MODDM9" onKeypress="enterInteger(event)">
            </div></td>
            <td nowrap><div align="center">
                <input type="text" maxlength="1" size="3" value="<%= prevDetails.getE01MODOP9().trim()%>" name="E01MODOP9" >
            </div></td>
            <td nowrap  height="23"> 
              <div align="center">
                <input type="text" maxlength="2" size="3" value="<%= prevDetails.getE01MODCH9().trim()%>" name="E01MODCH9" >
              <a href="javascript:GetCodeCNOFC('E01MODCH9','SA')"><img src="<%=request.getContextPath()%>/images/1b.gif" title=". . ." align="bottom" border="0"  ></a>              </div>           </td>
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
              <div align="left">
                Clase de Credito: 
                     <input type="text" name="E01MODTCR" maxlength="1" size="5" value="<%= prevDetails.getE01MODTCR()%>" >
                <a href="javascript:GetCode('E01MODTCR','STATIC_ln_prod_sup.jsp')"><img
					src="<%=request.getContextPath()%>/images/1b.gif" title=". . ."
					align="bottom" border="0"></a>
			  
			  </div>
            </td>
			 <td nowrap colspan="3" > 
              <div align="left">
                Días de Mora máximos: 
                        <input type="text" name="E01MODMOR" maxlength="5" size="5" value="<%= prevDetails.getE01MODMOR()%>" >
			 
			  </div>
            </td>
			
          </tr>
		  
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
