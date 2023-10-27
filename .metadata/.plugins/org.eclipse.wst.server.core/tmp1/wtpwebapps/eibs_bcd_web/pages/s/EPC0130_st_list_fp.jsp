<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<%@ page import = "datapro.eibs.master.Util" %>
<HTML>
<HEAD>
<TITLE>Transacciones de Proyectos</TITLE>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
</HEAD>

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />

<jsp:useBean id= "cifList" class= "datapro.eibs.beans.JBList"  scope="session" />

<jsp:useBean id="pcMant" class="datapro.eibs.beans.EPC013002Message"  scope="session" />

<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>


<SCRIPT type="text/javascript">
	builtNewMenu(pc_i_opt);
</SCRIPT>

<BODY>

<% 
 if ( !error.getERRNUM().equals("0")  ) {
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
 }

   out.println("<SCRIPT> initMenu(); </SCRIPT>");
%> 


<SCRIPT type="text/javascript">
function PrintPreview() {
  <% 
  int iniPos = cifList.getFirstRec() - 1;
  out.println("var pos = " + iniPos + ";");
  %>
	var pg = '<%=request.getContextPath()%>/servlet/datapro.eibs.productS.JSEPC0130?SCREEN=4&Pos=' + pos;
	CenterWindow(pg,720,500,2);

}

</SCRIPT>


<FORM>
<%
	if ( cifList.getNoResult() ) {
   		out.print("<center><h3>No hay resultados que correspondan a su criterio de búsqueda</h3></center>");
	}
	else {
%>
  <h3 align="center">Transacciones de Proyectos<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="st_list_fp.jsp,EPC0130"> 
  </h3>
  <hr size="4">
  <br>
  <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
          <tr id="trdark"> 
            <td nowrap width="10%" > 
              <div align="right"><b>No. de Cliente :</b></div>
            </td>
            <td nowrap width="30%"> 
              <div align="left"> 
                <input type="text" readonly name="E01PCMCUN" size="9" maxlength="9" value="<%= pcMant.getE01PCMCUN().trim()%>">
                </div>
            </td>
            <td nowrap width="10%" > 
              <div align="right"><b>Nombre:</b></div>
            </td>
            <td nowrap colspan="3" width="50%"> 
              <div align="left"> 
                <input type="text" readonly name="D01PCMCUN" size="45" maxlength="45" value="<%= pcMant.getD01PCMCUN().trim()%>">
              </div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap> 
              <div align="right"><b>Proyecto : </b></div>
            </td>
            <td nowrap> 
              <div align="left"> 
                <input type="text" readonly name="E01PCMACC" size="13" maxlength="9" value="<%= userPO.getIdentifier().trim()%>">
              </div>
            </td>
            <td nowrap> 
              <div align="right"><b>Moneda :</b></div>
            </td>
            <td nowrap width="20%"> 
              <div align="left"><b> 
                <input type="text" name="E01PCMCCY" size="3" maxlength="3" value="<%= pcMant.getE01PCMCCY().trim()%>" readonly>
                </b> </div>
            </td>
            <td nowrap width="10%"> 
              <div align="right"><b>Producto : </b></div>
            </td>
            <td nowrap width="20%"> 
              <div align="left"><b> 
                <input type="text" readonly name="E01PCMPRO" size="4" maxlength="4" value="<%= pcMant.getE01PCMPRO().trim()%>">
                </b> </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>  


  <h4> Información Proyecto</h4> 
  <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellpadding=2 cellspacing=0 width="100%" border="0">
          <tr id="trdark"> 
            <td nowrap width="25%"> 
              <div align="right">Nombre de Proyecto :</div>
            </td>
            <td nowrap width="75%"> 
              <input type="text" readonly name="E01PCMNME" size="47" maxlength="45" value="<%= pcMant.getE01PCMNME().trim()%>">
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="25%"> 
              <div align="right">Direccion Principal :</div>
            </td>
            <td nowrap width="75%"> 
              <input type="text" readonly name="E01PCMAD1" size="37" maxlength="35" value="<%= pcMant.getE01PCMAD1().trim()%>">
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="25%"> 
              <div align="right"> </div>
            </td>
            <td nowrap width="75%"> 
              <input type="text" readonly name="E01PCMAD2" size="37" maxlength="35" value="<%= pcMant.getE01PCMAD2().trim()%>">
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="25%"> 
              <div align="right"> </div>
            </td>
            <td nowrap width="75%"> 
              <input type="text" readonly name="E01PCMAD3" size="37" maxlength="35" value="<%= pcMant.getE01PCMAD3().trim()%>">
            </td>
          </tr>

          <tr id="trdark"> 
            <td nowrap width="13%"> 
              <div align="right">Estado :</div>
            </td>
            <td nowrap width="20%"> 
              <input type="text" readonly name="E01PCMSTE" size="5" maxlength="4" value="<%= pcMant.getE01PCMSTE().trim()%>">
            </td>
            <td nowrap width="13%"> 
              <div align="right">Codigo Area :</div>
            </td>
            <td nowrap width="20%"> 
              <input type="text" readonly name="E01PCMZPC" size="11" maxlength="10" value="<%= pcMant.getE01PCMZPC().trim()%>">
            </td>
            <td nowrap width="13%"> 
              <div align="right">Apartado Postal :</div>
            </td>
            <td nowrap width="20%"> 
              <input type="text" readonly name="E01PCMPOB" size="11" maxlength="10" value="<%= pcMant.getE01PCMPOB().trim()%>">
            </td>
          </tr>


          <tr id="trclear"> 
            <td nowrap width="15%"> 
              <div align="right">Ciudad :</div>
            </td>
            <td nowrap width="35%"> 
              <input type="text" readonly name="E01PCMCTY" size="31" maxlength="30" value="<%= pcMant.getE01PCMCTY().trim()%>">
            </td>
            <td nowrap width="15%"> 
              <div align="right">Pais :</div>
            </td>
            <td nowrap width="35%"> 
              <input type="text" readonly name="E01PCMCTR" size="21" maxlength="20" value="<%= pcMant.getE01PCMCTR().trim()%>">
            </td>
          </tr>


        </table>
      </td>
    </tr>
  </table>  



  <h4> Información Básica</h4> 
  <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellpadding=2 cellspacing=0 width="100%" border="0">
          <tr id="trdark"> 
            <td nowrap width="25%"> 
              <div align="right">Fecha de Apertura :</div>
            </td>
            <td nowrap width="23%"> 
              <input type="text" readonly name="E01PCMOPM" size="3" maxlength="2" value="<%= pcMant.getE01PCMOPM().trim()%>" onkeypress="enterInteger(event)">
              <input type="text" readonly name="E01PCMOPD" size="3" maxlength="2" value="<%= pcMant.getE01PCMOPD().trim()%>" onkeypress="enterInteger(event)">
              <input type="text" readonly name="E01PCMOPY" size="5" maxlength="4" value="<%= pcMant.getE01PCMOPY().trim()%>" onkeypress="enterInteger(event)">
            </td>
            <td nowrap width="25%"> 
              <div align="right">Fecha Limite Solicitud :</div>
            </td>
            <td nowrap width="27%"> 
              <input type="text" readonly name="E01PCMMAM" size="3" maxlength="2" value="<%= pcMant.getE01PCMMAM().trim()%>" onkeypress="enterInteger(event)">
              <input type="text" readonly name="E01PCMMAD" size="3" maxlength="2" value="<%= pcMant.getE01PCMMAD().trim()%>" onkeypress="enterInteger(event)">
              <input type="text" readonly name="E01PCMMAY" size="5" maxlength="4" value="<%= pcMant.getE01PCMMAY().trim()%>" onkeypress="enterInteger(event)">
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="20%"> 
              <div align="right">Valor Presupuesto :</div>
            </td>
            <td nowrap width="35%"> 
              <input type="text" readonly name="E01PCMVPR" size="17" maxlength="15" value="<%= pcMant.getE01PCMVPR().trim()%>" onkeypress="enterDecimal()">
            </td>
            <td nowrap width="20%" height="37"> 
              <div align="right">Termino :</div>
            </td>
            <td nowrap width="35%" height="37"> 
             <input type="text" readonly name="E01PCMTRM" size="6" maxlength="5" value="<%= pcMant.getE01PCMTRM().trim()%>" onkeypress="enterInteger(event)">
             <input type="text" readonly name="E01PCMTRC" size="10" 
				  value="<% if (pcMant.getE01PCMTRC().equals("D")) out.print("D&iacute;a(s)");
							else if (pcMant.getE01PCMTRC().equals("M")) out.print("Mes(es)");
							else if (pcMant.getE01PCMTRC().equals("Y")) out.print("A&ntilde;o(s)");
							else out.print("");%>" 
				>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="25%" > 
              <div align="right">Valor Solicitado :</div>
            </td>
            <td nowrap width="23%" > 
              <input type="text" readonly name="E01PCMVSL" size="17" maxlength="15" value="<%= pcMant.getE01PCMVSL().trim()%>" onkeypress="enterDecimal()">
            <td nowrap width="25%" >
              <div align="right">Unidades a Construir :</div>
            </td>
            <td nowrap width="27%" >
 				<input type="text" readonly name="E01PCMUNI" size="5" maxlength="4" value="<%= pcMant.getE01PCMUNI().trim()%>" onKeypress="enterInteger(event)">
                <input type="text" readonly name="E01PCMTUN" size="5" maxlength="4" value="<%= pcMant.getE01PCMTUN().trim()%>" >
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="25%" > 
              <div align="right">Precio Promedio de Venta :</div>
            </td>
            <td nowrap width="23%" > 
              <input type="text" readonly name="E01PCMPPV" size="17" maxlength="15" value="<%= pcMant.getE01PCMPPV().trim()%>" onkeypress="enterDecimal()">
            <td nowrap width="25%" >
              <div align="right">Porcentaje de Anticipo :</div>
            </td>
            <td nowrap width="27%" >
				<input type="text" readonly name="E01PCMPPR" size="9" maxlength="8" value="<%= pcMant.getE01PCMPPR().trim()%>" onKeypress="enterDecimal()">
			</td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="25%" > 
              <div align="right">Participantes de Pool :</div>
            </td>
            <td nowrap width="23%" > 
              <input type="text" readonly name="E01PCMPOL" size="3" maxlength="2" value="<%= pcMant.getE01PCMPOL().trim()%>" onkeypress="enterInteger(event)"></td>
            <td nowrap width="25%" >
              <div align="right">Tasa de Cambio :</div>
            </td>
            <td nowrap width="27%" >
              <input type="text" readonly name="E01PCMEXR" size="10" maxlength="9" value="<%= pcMant.getE01PCMEXR().trim()%>" onkeypress="enterDecimal()">
             </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="25%" > 
              <div align="right">Centro de Costo :</div>
            </td>
            <td nowrap width="23%" > 
              <input type="text" readonly name="E01PCMCN" size="9" maxlength="8" value="<%= pcMant.getE01PCMCCN().trim()%>" onkeypress="enterInteger(event)"></td>
            <td nowrap width="25%" >
              <div align="right">Producto Para Credito :</div>
            </td>
            <td nowrap width="27%" >
              <input type="text" readonly name="E01PCMPRD" size="5" maxlength="4" value="<%= pcMant.getE01PCMPRD().trim()%>" >
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="25%" > 
              <div align="right">Producto Para Anticipo :</div>
            </td>
            <td nowrap width="23%" > 
              <input type="text" readonly name="E01PCMANP" size="5" maxlength="4" value="<%= pcMant.getE01PCMANP().trim()%>" >
            </td>
            <td nowrap width="25%" >
              <div align="right">Producto Para Ampliación :</div>
            </td>
            <td nowrap width="27%" >
              <input type="text" readonly name="E01PCMAMP" size="5" maxlength="4" value="<%= pcMant.getE01PCMAMP().trim()%>" >
            </td>
          </tr>

        </table>
      </td>
    </tr>
  </table>  




  <h4 align="left">Transacciones</h4>
  <TABLE id=cfTable class="tableinfo">
    <TR id=trclear> 
      <TH ALIGN=CENTER nowrap > Fecha <% if (userPO.getHeader8().trim().equals("B")) out.print("Proceso"); else out.print("Valor");%></TH>
      <TH ALIGN=CENTER nowrap > Fecha <% if (userPO.getHeader8().trim().equals("B")) out.print("Valor"); else out.print("Proceso");%></TH>
      <TH ALIGN=CENTER nowrap >Fecha de<br> Registro</TH>
      <TH ALIGN=CENTER nowrap > TC </TH>
      <TH ALIGN=CENTER nowrap > Descripci&oacute;n </TH>
      <TH ALIGN=CENTER nowrap > Monto Transacción </TH>
      <TH ALIGN=CENTER nowrap > </TH>
      <TH ALIGN=CENTER nowrap > </TH>
      <TH ALIGN=CENTER nowrap > </TH>      
      <TH ALIGN=CENTER nowrap > Lote </TH>
      <TH ALIGN=CENTER nowrap > Hora </TH>
      <TH ALIGN=CENTER nowrap > Usuario </TH>
      <TH ALIGN=CENTER nowrap > Banco Org.</TH>
      <TH ALIGN=CENTER nowrap > Sucursal  Org.</TH>
    </TR>
    <%
                cifList.initRow();
                while (cifList.getNextRow()) {
                    if (cifList.getFlag().equals("")) {
                    		out.println(cifList.getRecord());
                    }
                }
              %> 
  </TABLE>
  
  <BR>
  
  <TABLE class="tbenter" WIDTH="98%" ALIGN=CENTER>
  <TR>
  <TD WIDTH="50%" ALIGN=LEFT>

<%
        if ( cifList.getShowPrev() ) {
      			int pos = cifList.getFirstRec() - 51;
      			out.println("<A HREF=\""+request.getContextPath()+"/servlet/datapro.eibs.client.JSEPC0130?SCREEN=1&Pos=" + pos +"\"><img src=\""+request.getContextPath()+"/images/s/previous_records.gif\" border=0></A>");
        }
 %> 
 	</TD>
 	<TD WIDTH="50%" ALIGN=RIGHT>
 <%      
        if ( cifList.getShowNext() ) {
      			int pos = cifList.getLastRec();
      			out.println("<A HREF=\""+request.getContextPath()+"/servlet/datapro.eibs.client.JSEPC0130?SCREEN=1&Pos=" + pos +"\"><img src=\""+request.getContextPath()+"/images/s/next_records.gif\" border=0></A>");
        }
%>
   </TD>
 	</TR>
 	</TABLE>

    

  <div align="center"> 
    <input id="EIBSBTN" type=button name="Submit" OnClick="PrintPreview()" value="Imprimir">
  </div>

<%
  }
%>
<SCRIPT type="text/javascript">
   var max=cfTable.rows.length;
     for(i= 0; i < max; i++){
      cfTable.rows[i].cells[2].style.display="none";
     }
  </SCRIPT> 
</FORM>

</BODY>
</HTML>
