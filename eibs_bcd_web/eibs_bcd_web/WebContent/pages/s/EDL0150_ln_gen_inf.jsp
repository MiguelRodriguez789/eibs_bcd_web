<html>
<head>
<title>Información General</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id="lnGenInf" class="datapro.eibs.beans.EDL015001Message"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>

<SCRIPT type="text/javascript">

   builtNewMenu(ln_m_opt);

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
  out.println("<SCRIPT> initMenu(); </SCRIPT>");
%> 
<h3 align="center">Informaci&oacute;n General <%= lnGenInf.getE01DSCPRO().trim()%><img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="ln_gen_inf.jsp,EDL0150"></h3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEXEDL0150" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="24">
  <INPUT TYPE=HIDDEN NAME="E01DEABNK"  value="<%= lnGenInf.getE01DEABNK().trim()%>">
  <input type=HIDDEN name="E01DEATYP"  value="<%= lnGenInf.getE01DEATYP().trim()%>">
  
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
                <input type="text" name="E01DEACUN" size="10" maxlength="9" value="<%= lnGenInf.getE01DEACUN().trim()%>">
              </div>
            </td>
            <td nowrap width="16%" > 
              <div align="right"><b>Nombre :</b> </div>
            </td>
            <td nowrap colspan="3" > 
              <div align="left"><font face="Arial"><font face="Arial"><font size="2">
                <input type="text" name="E01CUSNA1" size="45" maxlength="45" value="<%= lnGenInf.getE01CUSNA1().trim()%>" >
                </font></font></font></div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="16%"> 
              <div align="right"><b>Cuenta :</b></div>
            </td>
            <td nowrap width="20%"> 
              <div align="left">
                <input type="text" name="E01DEAACC" size="13" maxlength="12" value="<%= lnGenInf.getE01DEAACC().trim()%>" >
              </div>
            </td>
            <td nowrap width="16%"> 
              <div align="right"><b>Moneda : </b></div>
            </td>
            <td nowrap width="16%"> 
              <div align="left"><b>
                <input type="text" name="E01DEACCY2" size="3" maxlength="3" value="<%= lnGenInf.getE01DEACCY().trim()%>" >
                </b> </div>
            </td>
            <td nowrap width="16%"> 
              <div align="right"><b>Producto : </b></div>
            </td>
            <td nowrap width="16%"> 
              <div align="left"><b>
                <input type="text" name="E01DEAPRO" size="4" maxlength="4" value="<%= lnGenInf.getE01DEAPRO().trim()%>" >
                </b> </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <h4>&nbsp;</h4>
      
  <h4>Informaci&oacute;n General</h4>
  
  <%int row = 0; %>
  <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing=0 cellpadding=2 width="100%" border="0">
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="32%" >
              <div align="right">Tipo de Inter&eacute;s :</div>
            </td>
            <td nowrap width="17%" >
              <input type="text" name="E01DEAICT" size="2" maxlength="1" value="<%= lnGenInf.getE01DEAICT().trim()%>">
              <a href="javascript:GetCode('E01DEAICT','STATIC_cd_formula.jsp')"><img src="<%=request.getContextPath()%>/images/1b.gif" title=". . ." align="bottom" border="0" ></a></td>
            <td nowrap width="24%" >
              <div align="right">Per&iacute;odo Base :</div>
            </td>
            <td nowrap width="27%" >
              <input type="text" name="E01DEABAS" size="4" maxlength="3" value="<%= lnGenInf.getE01DEABAS().trim()%>">
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="32%" > 
              <div align="right">C&aacute;lculo de Inter&eacute;s Normal :</div>
            </td>
            <td nowrap width="17%" >
              <input type="text" name="E01DEAIFL" size="2" maxlength="1" value="<%= lnGenInf.getE01DEAIFL().trim()%>">
              <a href="javascript:lnGetOver('E01DEAIFL','STATIC_ln_prov.jsp')"><img src="<%=request.getContextPath()%>/images/1b.gif" title=". . ." align="bottom" border="0" ></a> 
            </td>
            <td nowrap width="24%" > 
              <div align="right">C&aacute;lculo de Inter&eacute;s Mora :</div>
            </td>
            <td nowrap width="27%" >
              <input type="text" name="E01DEAPCL" size="2" maxlength="1" value="<%= lnGenInf.getE01DEAPCL().trim()%>" >
              <a href="javascript:lnGetOver('E01DEAPCL','STATIC_ln_mor.jsp')"><img src="<%=request.getContextPath()%>/images/1b.gif" title=". . ." align="bottom" border="0"  ></a> 
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="32%" > 
              <div align="right">Retenci&oacute;n de Impuestos :</div>
            </td>
            <td nowrap width="17%" >
              <input type="text" name="E01DEAWHF" size="2" maxlength="1" value="<%= lnGenInf.getE01DEAWHF().trim()%>">
              <a href="javascript:GetCode('E01DEAWHF','STATIC_cd_taxes.jsp')"><img src="<%=request.getContextPath()%>/images/1b.gif" title=". . ." align="bottom" border="0" ></a> 
            </td>
            <td nowrap width="24%" > 
              <div align="right">Per&iacute;odo de Gracia :</div>
            </td>
            <td nowrap width="27%" >
              <input type="text" name="E01DEAGPD" size="3" maxlength="2" value="<%= lnGenInf.getE01DEAGPD().trim()%>" >
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="32%" > 
              <div align="right">Comisionista :</div>
            </td>
            <td nowrap width="17%" >
              <input type="text" name="E01DEABRK" size="4" maxlength="3" value="<%= lnGenInf.getE01DEABRK().trim()%>">
              <a href="javascript:GetBroker('E01DEABRK')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="help" align="middle" border="0"></a> 
            </td>
            <td nowrap width="24%" > 
              <div align="right">Direcci&oacute;n de Correos :</div>
            </td>
            <td nowrap width="27%" >
              <input type="text" name="E01DEAMLA" size="2" maxlength="2" value="<%= lnGenInf.getE01DEAMLA().trim()%>">
              <a href="javascript:GetMailing('E01DEAMLA',document.forms[0].E01DEACUN.value)"><img src="<%=request.getContextPath()%>/images/1b.gif" title="Direcciones de Correo del Cliente" align="middle" border="0"></a> 
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="32%" > 
              <div align="right">Tasa del Comisionista :</div>
            </td>
            <td nowrap width="17%" >
              <input type="text" name="E01DEABCP" size="10" maxlength="9" value="<%= lnGenInf.getE01DEABCP().trim()%>" >
            </td>
            <td nowrap width="24%" > 
              <div align="right">Vencimiento en Feriados :</div>
            </td>
            <td nowrap width="27%" > 
              <input type="hidden" name="E01DEAHFQ" value="<%= lnGenInf.getE01DEAHFQ()%>">
              <input type="radio" name="CE01DEAHFQ" value="1" onClick="document.forms[0].E01DEAHFQ.value='1'"
			  <%if(lnGenInf.getE01DEAHFQ().equals("1")) out.print("checked");%>>
              S&iacute; 
              <input type="radio" name="CE01DEAHFQ" value="2" onClick="document.forms[0].E01DEAHFQ.value='2'"
			  <%if(lnGenInf.getE01DEAHFQ().equals("2")) out.print("checked");%>>
              No </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="32%" > 
              <div align="right">Tabla Cargos :</div>
            </td>
            <td nowrap width="17%" >
              <input type="text" name="E01DEATLN" size="2" maxlength="2" value="<%= lnGenInf.getE01DEATLN().trim()%>">
              <a href="javascript:GetLoanTable('E01DEATLN',document.forms[0].E01DEATYP.value)"><img src="<%=request.getContextPath()%>/images/1b.gif" title="help" align="middle" border="0" width="25" height="25"></a> 
            </td>
            <td nowrap width="24%" > 
              <div align="right">C&oacute;digo de Obligaci&oacute;n :</div>
            </td>
            <td nowrap width="27%" >
              <input type="text" name="E01DEAOBL" size="3" maxlength="2" value="<%= lnGenInf.getE01DEAOBL().trim()%>">
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="32%" > 
              <div align="right">Tabla Tasas :</div>
            </td>
            <td nowrap width="17%" >
              <input type="text" name="E01DEARTB" size="2" maxlength="2" value="<%= lnGenInf.getE01DEARTB().trim()%>">
              <a href="javascript:GetRateTable('E01DEATRB')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="help" align="middle" border="0"></a> 
            </td>
            <td nowrap width="24%" > 
              <div align="right">C&oacute;digo de Usuario :</div>
            </td>
            <td nowrap width="27%" >
              <input type="text" name="E01DEARRC" size="3" maxlength="2" value="<%= lnGenInf.getE01DEARRC().trim()%>">
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="32%" > 
              <div align="right">Tipo de Relaciones 1 :</div>
            </td>
            <td nowrap width="17%" >
              <input type="text" name="E01DEAPAR" size="2" maxlength="1" value="<%= lnGenInf.getE01DEAPAR().trim()%>">
              <a href="javascript:GetRel1('E01DEAPAR','STATIC_ln_rel1.jsp')"><img src="<%=request.getContextPath()%>/images/1b.gif" title=". . ." align="bottom" border="0" ></a> 
            </td>
            <td nowrap width="24%" > 
              <div align="right">Clase de Cr&eacute;dito :</div>
            </td>
            <td nowrap width="27%" >
              <input type="text" name="E01DEACLF" size="2" maxlength="1" value="<%= lnGenInf.getE01DEACLF().trim()%>">
              <a href="javascript:GetClassCred('E01DEACLF','STATIC_ln_cred_class.jsp')"><img src="<%=request.getContextPath()%>/images/1b.gif" title=". . ." align="bottom" border="0" ></a> 
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="32%" > 
              <div align="right">Cuenta de Relaciones 1 :</div>
            </td>
            <td nowrap width="17%" >
              <input type="text" name="E01DEAPAC" size="12" maxlength="12" value="<%= lnGenInf.getE01DEAPAC().trim()%>">
              <a href="javascript:GetAccount('E01DEAPAC',document.forms[0].E01DEABNK.value,'','')"><img src="<%=request.getContextPath()%>/images/1b.gif" title=". . ." align="middle" border="0" ></a> 
            </td>
            <td nowrap width="24%" > 
              <div align="right">Condici&oacute;n del Cr&eacute;dito :</div>
            </td>
            <td nowrap width="27%" >
              <input type="text" name="E01DEADLC" size="2" maxlength="1" value="<%= lnGenInf.getE01DEACLF().trim()%>">
              <a href="javascript:GetCredCond('E01DEADLC','STATIC_ln_cred_cond.jsp')"><img src="<%=request.getContextPath()%>/images/1b.gif" title=". . ." align="bottom" border="0" ></a> 
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="32%" > 
              <div align="right">Tipo de Relaciones 2 :</div>
            </td>
            <td nowrap width="17%" >
              <input type="text" name="E01DEARET" size="2" maxlength="1" value="<%= lnGenInf.getE01DEARET().trim()%>">
              <a href="javascript:GetRel2('E01DEARET','STATIC_ln_rel2.jsp')"><img src="<%=request.getContextPath()%>/images/1b.gif" title=". . ." align="bottom" border="0" ></a> 
            </td>
            <td nowrap width="24%" > 
              <div align="right">Pr&eacute;stamo a Demanda :</div>
            </td>
            <td nowrap width="27%">
              <input type="hidden" name="E01DEALNC" value="<%= lnGenInf.getE01DEALNC()%>">
              <input type="radio" name="CE01DEALNC" value="Y" onClick="document.forms[0].E01DEALNC.value='Y'"
			  <%if(lnGenInf.getE01DEALNC().equals("Y")) out.print("checked");%>>
              S&iacute; 
              <input type="radio" name="CE01DEALNC" value="N" onClick="document.forms[0].E01DEALNC.value='N'"
			  <%if(lnGenInf.getE01DEALNC().equals("N")) out.print("checked");%>>
              No </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="32%" > 
              <div align="right">Cuenta de Relaciones 2 : </div>
            </td>
            <td nowrap width="17%" >
              <input type="text" name="E01DEAREA" size="12" maxlength="12" value="<%= lnGenInf.getE01DEAREA().trim()%>">
              <a href="javascript:GetAccount('E01DEAREA',document.forms[0].E01DEABNK.value,'10','')"><img src="<%=request.getContextPath()%>/images/1b.gif" title=". . ." align="middle" border="0" ></a> 
            </td>
            <td nowrap width="24%" > 
              <div align="right"> Porciento de Participaciones :</div>
            </td>
            <td nowrap width="27%"> 
              <input type="text" name="E01DEACCF" size="4" maxlength="3" value="<%= lnGenInf.getE01DEACCF().trim()%>">
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  
  <h4>Prioridad de Pagos </h4>
  <table class="tableinfo">
    <tr > 
      <td nowrap > 
        <table cellspacing=0 cellpadding=2 width="100%" border="0">
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="16%"  > 
              <div align="center">
                <input type="text" name="E01DEAPP1" size="2" maxlength="1" value="<%= lnGenInf.getE01DEAPP1().trim()%>">
              </div>
            </td>
            <td nowrap width="14%"  > 
              <div align="center"> 
                <input type="text" name="E01DEAPP2" size="2" maxlength="1" value="<%= lnGenInf.getE01DEAPP2().trim()%>">
              </div>
            </td>
            <td nowrap width="16%" > 
              <div align="center"> 
                <input type="text" name="E01DEAPP3" size="2" maxlength="1" value="<%= lnGenInf.getE01DEAPP3().trim()%>">
              </div>
            </td>
            <td nowrap width="22%"  > 
              <div align="center"> 
                <input type="text" name="E01DEAPP4" size="2" maxlength="1" value="<%= lnGenInf.getE01DEAPP4().trim()%>">
              </div>
            </td>
            <td nowrap width="17%" > 
              <div align="center"> 
                <input type="text" name="E01DEAPP5" size="2" maxlength="1" value="<%= lnGenInf.getE01DEAPP5().trim()%>">
              </div>
            </td>
            <td nowrap width="15%"  > 
              <div align="center"> 
                <input type="text" name="E01DEAPP6" size="2" maxlength="1" value="<%= lnGenInf.getE01DEAPP6().trim()%>">
              </div>
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="16%" > 
              <div align="center">Principal</div>
            </td>
            <td nowrap width="14%" > 
              <div align="center">Intereses</div>
            </td>
            <td nowrap width="16%" > 
              <div align="center">Mora</div>
            </td>
            <td nowrap width="22%" > 
              <div align="center">Impuestos / Comisiones</div>
            </td>
            <td nowrap width="17%" > 
              <div align="center">Deducciones</div>
            </td>
            <td nowrap width="15%" > 
              <div align="center">I.V.A.</div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>

  	<div align="center"> 
    	<input id="EIBSBTN" type=submit name="Submit"  value="Enviar">
  	</div>

  <h4>&nbsp;</h4>
  </form>
</body>
</html>
