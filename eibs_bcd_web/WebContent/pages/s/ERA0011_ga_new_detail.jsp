<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@ page import = "datapro.eibs.master.Util" %>
<%@page import="com.datapro.constants.EibsFields"%>
<%@page import="com.datapro.eibs.constants.HelpTypes"%>
<html>
<head>
<title>Nuevo Detalle de Garant�as</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id="collDet" class= "datapro.eibs.beans.ERA001102Message"  scope="session"/>
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>

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


<H3 align="center">Otras Inscripciones<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="ga_new_detail.jsp , ERA0011"></H3> 
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSERA0011" >
  <input type=HIDDEN name="SCREEN" value="5">
  <INPUT TYPE=HIDDEN NAME="opt" VALUE="1">
  <input type=hidden name="E02RODREF" value="<%= userPO.getIdentifier().trim()%>">
  <input type=hidden name="E02RODBNK" value="<%= userPO.getBank().trim()%>">
  <input type=hidden name="E02RODSEQ" value="1">
                        
  <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
          <tr id="trdark"> 
            <td nowrap> 
              <div align="right"><b>Cliente :</b></div>
            </td>
            <td nowrap> 
              <div align="left"> 
                <%=userPO.getCusNum().trim()%>
              </div>
            </td>
            <td nowrap> 
              <div align="right"><b>Nombre :</b> </div>
            </td>
            <td nowrap> 
              <div align="left">
              <%= userPO.getCusName().trim()%>
              </div>
            </td>
            <td nowrap> 
              <div align="right"><b>Referencia :</b></div>
            </td>
            <td nowrap>
            <div align="left">
              <%= userPO.getIdentifier().trim()%>
             </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <h4>Informaci&oacute;n B&aacute;sica</h4>
  <table class="tableinfo">
    <tr> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="trdark"> 
            <td nowrap > 
              <div align="right">Cliente :</div>
            </td>
            <td nowrap>
              <INPUT type="text" name="E02RODCUN" size="11" maxlength="10" value="<%= collDet.getE02RODCUN().trim()%>">
              <A href="javascript:GetCustomerDescId('E02RODCUN','E02RODDSC','')"><IMG src="<%=request.getContextPath()%>/images/1b.gif" title=". . ." align="bottom" border="0"></A>
            </td>
            <td nowrap > 
              <div align="right">Nombre :</div>
            </td>
            <td nowrap >
              <INPUT type="text" name="E02RODDSC" size="36" maxlength="35" value="<%= collDet.getE02RODDSC().trim()%>">
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap > 
              <div align="right">Valor Limite :</div>
            </td>
            <td nowrap > 
              <div align="left"> 
                <input type="text" name="E02RODAMT" size="15" maxlength="15" onKeypress="enterDecimal(event, 2)" value="<%= collDet.getE02RODAMT() %>">
              </div>
            </td>
            <td nowrap > 
              <div align="right">Grado :</div>
            </td>
            <td nowrap>
              <input type="text" name="E02RODUC1" size="6" maxlength="4" value="<%= collDet.getE02RODUC1() %>">
              <A href="javascript:GetCodeCNOFC('E02RODUC1','X0')"><IMG src="<%=request.getContextPath()%>/images/1b.gif" title=". . ." align="bottom" border="0"></A> </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap> 
              <div align="right">Limitaciones :</div>
            </td>
            <td nowrap >
              <input type="text" name="E02RODUC2" size="6" maxlength="4" onKeyPress="enterDecimal(event, 2)" value="<%= collDet.getE02RODUC2() %>">
              <a href="javascript:GetCodeCNOFC('E02RODUC2','2J')"><IMG src="<%=request.getContextPath()%>/images/1b.gif" title=". . ." align="bottom" border="0"></A>
            </td>
            <td nowrap > 
              <div align="right">Estado del Beneficiario :</div>
            </td>
            <td nowrap > 
              <div align="left"> 
                <input type="text" name="E02RODEST" size="2" maxlength="1" value="<%= collDet.getE02RODEST() %>">
                <A href="javascript:GetCode('E02RODEST','STATIC_coll_help_benef.jsp')"><img src="<%=request.getContextPath()%>/images/1b.gif" title=". . ." align="bottom" border="0"  ></a>            
              </div>
            </td>
          </tr>
          <tr id="trclear">
            <td nowrap > 
              <div align="right">Oficina Propietaria : </div>
            </td>
            <td nowrap colspan=3>
              <INPUT type="text" name="E02RODOFN" size="6" maxlength="4" value="<%= collDet.getE02RODOFN().trim()%>">
              <a href="javascript:GetBranch('E02RODOFN','')"><img src="<%=request.getContextPath()%>/images/1b.gif" title=". . ." align="bottom" border="0"  ></a>                         
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  
  <% if (!userPO.getType().equals("04")) { %>
   <h4>Datos Notaria / Conservador</h4>
    <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing=0 cellpadding=2 width="100%" border="0">          
   		  <tr id="trdark"> 
            <td nowrap> 
              <div align="right">Fecha Ecritura :</div>
            </td>
            <td nowrap > 
			  <eibsinput:date name="collDet" fn_month="E02RODODM" fn_day="E02RODODD" fn_year="E02RODODY" readonly="FALSE" required="true"/>
            </td>
            <td nowrap> 
              <div align="right">Notaria :</div>
            </td>
            <td nowrap> 
              <input type="text" name="E02RODRF4" size="4" maxlength="3" value="<%= collDet.getE02RODRF4() %>">
              <a href="javascript:GetTypeBroker('E02RODRF4','N')"><img src="<%=request.getContextPath()%>/images/1b.gif" title=". . ." align="bottom" border="0"  ></a>                        
            </td>
          </tr>
        <% if (!userPO.getType().equals("05")) { %>
          <tr id="trclear"> 
            <td nowrap > 
              <div align="right">Folio de Constituci�n :</div>
            </td>
            <td nowrap >               
              <INPUT type="text" name="E02RODRF2" size="20" maxlength="20" value="<%= collDet.getE02RODRF2().trim()%>" onKeyPress="enterInteger(event)"> 
            </td>
            <td nowrap > 
              <div align="right">N�mero Constituci�n :</div>
            </td>
            <td nowrap >               
              <INPUT type="text" name="E02RODNBR" size="20" maxlength="20" value="<%= collDet.getE02RODNBR().trim()%>" onKeyPress="enterInteger(event)"> 
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap > 
              <div align="right">A�o Constituci�n :</div>
            </td>
            <td nowrap >               
              <INPUT type="text" name="E02RODAIN" size="5" maxlength="4" value="<%= collDet.getE02RODAIN().trim()%>" onKeyPress="enterInteger(event)"> 
            </td>
            <td nowrap > 
              <div align="right">Conserv. Constituci�n :</div>
            </td>
            <td nowrap> 
              <input type="text" name="E02RODUC7" size="5" maxlength="4" value="<%= collDet.getE02RODUC7().trim()%>" >
              <a href="javascript:GetCodeCNOFC('E02RODUC7','2K')"><img src="<%=request.getContextPath()%>/images/1b.gif" title=". . ." align="bottom" border="0"  ></a> 
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap > 
              <div align="right">Folio de Prohibici�n :</div>
            </td>
            <td nowrap >               
              <INPUT type="text" name="E02RODFPH" size="30" maxlength="30" value="<%= collDet.getE02RODFPH().trim()%>"> 
            </td>
            <td nowrap > 
              <div align="right">N�mero Prohibici�n :</div>
            </td>
            <td nowrap >               
              <INPUT type="text" name="E02RODNPH" size="20" maxlength="20" value="<%= collDet.getE02RODNPH().trim()%>"> 
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap > 
              <div align="right">A�o Prohibici�n :</div>
            </td>
            <td nowrap >               
              <INPUT type="text" name="E02RODYPH" size="5" maxlength="4" value="<%= collDet.getE02RODYPH().trim()%>"> 
            </td>
            <td nowrap > 
              <div align="right">Conserv. Prohibici�n :</div>
            </td>
            <td nowrap >               
              <INPUT type="text" name="E02RODCPH" size="5" maxlength="4" value="<%= collDet.getE02RODCPH().trim()%>">             
              <a href="javascript:GetCodeCNOFC('E02RODCPH','2K')"><img src="<%=request.getContextPath()%>/images/1b.gif" title=". . ." align="bottom" border="0"  ></a> 
            </td>
          </tr>
		  <TR id="trclear">
				<TD nowrap align="right"></TD>
				<TD nowrap></TD>
				<TD nowrap align="right">Rollo :</TD>
				<TD nowrap>
					<INPUT type="text" name="E02RODSP1" size="30" maxlength="28" value="<%= collDet.getE02RODSP1().trim()%>">
				</TD>
		  </TR>
		  <tr id="trdark"> 
            <td nowrap > 
              <div align="right">Finca :</div>
            </td>
				<td nowrap>
					<INPUT type="text" name="E02RODSP5" size="56" maxlength="56" value="<%= collDet.getE02RODSP5().trim()%>">
				</td>
			<td nowrap > 
              <div align="right">Documento (Imagen) :</div>
            </td>
            <td nowrap>               
            	<INPUT type="text" name="E02RODSP6" size="30" maxlength="28" value="<%= collDet.getE02RODSP6().trim()%>">
			</td>
          </tr>
          
         <% }%>

          <%if( collDet.getH02SCRCOD().equals("07")){%> 
			<tr id="trclear">
            <td nowrap> 
              <div align="right">Calle : </div>
            </td>
            <td nowrap colspan="3"> 
              <input type="text" name="E02NA2"  size="37" maxlength="35" value="<%=collDet.getE02NA2().trim()%>">
           	</td>
				<TD nowrap align="right">Provincia : </TD>
				<TD nowrap><INPUT type="text" name="D02STE" size="37" maxlength="35"
					value="<%= collDet.getD02STE().trim()%>"> <A
					href="javascript:GetCodeDescCNOFC('E02STE','D02STE','PV')"> <IMG
					src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda"
					align="bottom" border="0" style="cursor:hand"></A></TD>
			</tr>
           <tr id="trdark">
            <td nowrap> 
              <div align="right">Residencial/edificio : </div>
            </td>
				<td nowrap colspan="3"><input type="text" name="E02NA3" size="37"
					maxlength="35" value="<%= collDet.getE02NA3().trim()%>"></td>
				<TD nowrap align="right">Distrito : </TD>
				<TD nowrap><INPUT type="text" name="D02TID" size="37" maxlength="35"
					value="<%= collDet.getD02TID().trim()%>"> <IMG
					src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda"
					align="bottom" border="0" style="cursor:hand"
					onclick="javascript:GetCodeDescCNOFC('E02TID','D02TID','PI')"></TD>
			</tr>
          <tr id="trclear"> 
            <td nowrap> 
              <div align="right">No. Casa/Apto :</div>
            </td>
				<td nowrap colspan="3"><input type="text" name="E02NA4" size="37"
					maxlength="35" value="<%= collDet.getE02NA4().trim()%>"></td>
				<TD nowrap align="right">Corregimiento : </TD>
				<TD nowrap><INPUT type="text" name="D02PID" size="37" maxlength="35"
					value="<%= collDet.getD02PID().trim()%>"> <A
					href="javascript:GetCodeDescCNOFC('E02PID','D02PID','PE')"> <IMG
					src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda"
					align="bottom" border="0" style="cursor:hand"></A></TD>
			</tr>
           <tr id="trdark">
            <td nowrap> 
              <div align="right">Apartado Postal : </div>
            </td>
				<td nowrap colspan="3"><input type="hidden" name="E02STE" size="6"
					maxlength="4" value="<%= collDet.getE02STE().trim()%>"> <A
					href="javascript:GetCodeDescCNOFC('E02STE','D02STE','PV')"> </A><INPUT
					type="text" name="E02POB" size="11" maxlength="10"
					value="<%= collDet.getE02POB().trim()%>"></td>
				<TD nowrap align="right">Pa�s : </TD>
				<TD nowrap><INPUT type="text" name="E02CTR" size="21" maxlength="20"
					value="<%= collDet.getE02CTR().trim()%>"></TD>
			</tr>
          <tr id="trclear"> 
            <td nowrap> 
              <div align="right"></div>
            </td>
				<td nowrap colspan="3"><input type="hidden" name="E02TID" size="6"
					maxlength="4" value="<%= collDet.getE02TID().trim()%>"> </td>
				<TD nowrap align="right">C�digo Postal : </TD>
				<TD nowrap>
				<INPUT type="hidden" name="E02ZPC" size="17" maxlength="15"
					value='<%= (collDet.getE02ZPC() != null && !collDet.getE02ZPC().trim().equals("") && collDet.getE02ZPC().trim().length() > 4 )
              	?collDet.getE02ZPC().substring(0,3):""%>'>
				<INPUT type="text" name="D02ZPC" size="17" maxlength="15"
					value='<%= (collDet.getE02ZPC() != null && !collDet.getE02ZPC().trim().equals("") && collDet.getE02ZPC().trim().length() > 5 )
              	?collDet.getE02ZPC().substring(4):""%>'>
				<IMG src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda"
					align="bottom" border="0" style="cursor:hand"
					onclick="javascript:GetCodeDescCNOFC('E02ZPC','D02ZPC' ,'59')"></TD>
			</tr>

			<%} else {%>
 
            <tr id="trclear"> 
              <td nowrap> 
                <div align="right">Direcci�n Principal :</div>
              </td>
				<td nowrap colspan="3"><input type="text" name="E02NA2" size="36"
					maxlength="35" value="<%= collDet.getE02NA2().trim()%>"></td>
				<TD nowrap align="right">Ciudad : </TD>
				<TD nowrap><INPUT type="text" name="E02CTY" size="31" maxlength="30"
					value="<%= collDet.getE02CTY().trim()%>"></TD>
			</tr>
            <tr id="trdark"> 
              <td nowrap> 
                <div align="right"></div>
              </td>
				<td nowrap colspan="3"><input type="text" name="E02NA3" size="36"
					maxlength="35" value="<%= collDet.getE02NA3().trim()%>"></td>
				<TD nowrap align="right">Estado : </TD>
				<TD nowrap><INPUT type="text" name="E02STE" size="5" maxlength="4"
					value="<%= collDet.getE02STE().trim()%>"> <A
					href="javascript:GetCodeCNOFC('E02STE','27')"> <IMG
					src="<%=request.getContextPath()%>/images/1b.gif" title="ayuda"
					align="bottom" border="0"></A></TD>
			</tr>
            <tr id="trclear"> 
              <td nowrap> 
                <div align="right"></div>
              </td>
				<td nowrap colspan="3"><input type="text" name="E02NA4" size="36"
					maxlength="35" value="<%= collDet.getE02NA4().trim()%>"></td>
				<TD nowrap align="right">Pa�s : </TD>
				<TD nowrap><INPUT type="text" name="E02CTR" size="21"
					maxlength="20" value="<%= collDet.getE02CTR().trim()%>"></TD>
			</tr>

            <tr id="trdark"> 
              <td nowrap> 
                <div align="right">Apartado Postal : </div>
              </td>
				<td nowrap colspan="3"><INPUT type="text" name="E02POB" size="11"
					maxlength="10" value="<%= collDet.getE02POB().trim()%>"></td>
				<TD nowrap align="right">C�digo Postal : </TD>
				<TD nowrap><INPUT type="text" name="E02ZPC0" size="16"
					maxlength="15" value="<%= collDet.getE02ZPC().trim()%>"></TD>
			</tr>

         <%} %>   

         <% if (userPO.getType().equals("03")) { %>
           <tr id="trclear"> 
            <td nowrap > 
              <div align="right">Fecha Pub. Diaria :</div>
            </td>
            <td nowrap >               
			  <eibsinput:date name="collDet" fn_month="E02RODPDY" fn_day="E02RODPDD" fn_year="E02RODPDY" readonly="FALSE" required="true"/>
            </td>
            <td nowrap > 
              <div align="right">Fecha Notificaci�n :</div>
            </td>
            <td nowrap >               
			  <eibsinput:date name="collDet" fn_month="E02RODNDM" fn_day="E02RODNDD" fn_year="E02RODNDY" readonly="FALSE" required="true"/>
            </td>
          </tr>
         <% }%>
   </table>
      </td>
    </tr>
  </table>
  <% }%>

  <div align="center"> 
    <input id="EIBSBTN" type=submit name="Submit" value="Enviar">
  </div>
  
  </form>
</body>
</html>
