<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ page import = "datapro.eibs.master.Util" %>
<HTML>
<HEAD>
<TITLE> 
Lista de Clientes
</TITLE>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Studio">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
</HEAD>

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "cifList" class= "datapro.eibs.beans.JBList"  scope="session" />
<jsp:useBean id="stBalances" class="datapro.eibs.beans.ECIF03002Message"  scope="session" />
<jsp:useBean id="interestTable" class="java.util.Hashtable"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />

<BODY>


<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>

<SCRIPT type="text/javascript">
<%
if (userPO.getPurpose().equals("INQUIRY")){
%>

<%
if ( userPO.getOption().equals("RT") ) {
%>
	builtNewMenu(rt_i_opt);
<%   
}
else if ( userPO.getOption().equals("SV") ) {
%>
	builtNewMenu(sv_i_opt);
<%   
}
%>

<%
}
%>

function PrintPreview() {

  <% 
  int iniPos = cifList.getFirstRec() - 1;
  out.println("var pos = " + iniPos + ";");
  %>
	var pg = '<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSECIF030?SCREEN=4&Pos=' + pos;
	CenterWindow(pg,720,500,4);

}
function PrintPreviewPDF() {
 <% 
  iniPos = cifList.getFirstRec() - 1;
  out.println("var pos = " + iniPos + ";");
  %>
  CenterWindow('<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSECIF030?SCREEN=6&Pos=' + pos,600,500,4);
}
function PrintPreviewEMAIL() {
 <% 
  iniPos = cifList.getFirstRec() - 1;
  out.println("var pos = " + iniPos + ";");
  %>
  CenterWindow('<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSECIF030?SCREEN=7&Pos=' + pos,600,500,4);
}
function showGraph()
{
	var pg = "<%=request.getContextPath()%>/pages/s/ECIF030_st_balance_graph.jsp";
	CenterNamedWindow(pg,'graph',700,560,2);
}

</SCRIPT>

<% 
 if ( !error.getERRNUM().equals("0")  ) {
     out.println("<SCRIPT Language=\"Javascript\">");
     error.setERRNUM("0");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
 }
   if (userPO.getPurpose().equals("INQUIRY")){ 
   out.println("<SCRIPT> initMenu(); </SCRIPT>");}
%> 

<FORM>
<%
	if ( cifList.getNoResult() ) {
%>
 		<TABLE class="tbenter" width=100% height=100%>
 		<TR>
      <TD> 
        
      <div align="center"> <font size="3"><b> No hay datos que correspondan con su criterio de busqueda</b></font> 
      </div>
      </TD></TR>
   		</TABLE>
<%
	}
	else {
%>

  <h3 align="center">Estado de Cuentas<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="st_list_fp.jsp,ECIF030"> 
  </h3>
  <hr size="4">
  <br>
  <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
          <tr id="trdark"> 
            <td nowrap width="14%" > 
              <div align="right"><b>Cliente :</b></div>
            </td>
            <td nowrap width="9%" > 
              <div align="left"> 
                <input type="text" name="E02CUN2" size="11" maxlength="9" readonly value="<%= userPO.getHeader2().trim()%>">
              </div>
            </td>
            <td nowrap width="12%" > 
              <div align="right"><b>Nombre :</b> </div>
            </td>
            <td nowrap > 
              <div align="left"> 
                <input type="text" name="E02NA12" size="50" maxlength="45" readonly value="<%= userPO.getHeader3().trim()%>">
              </div>
            </td>
            <td nowrap > 
              <div align="right"><b>Producto : </b></div>
            </td>
            <td nowrap ><b> 
              <input type="text" name="E02PRO2" size="4" maxlength="4" readonly value="<%= userPO.getHeader1().trim()%>">
              </b></td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="14%"> 
              <div align="right"><b>Cuenta :</b></div>
            </td>
            <td nowrap width="9%"> 
              <div align="left"> 
                <input type="text" name="E02ACC" size="14" maxlength="12" value="<%= userPO.getIdentifier().trim()%>" readonly>
              </div>
            </td>
            <td nowrap width="12%"> 
              <div align="right"><b>Oficial :</b></div>
            </td>
            <td nowrap width="33%"> 
              <div align="left"><b> 
                <input type="text" name="E02NA122" size="50" maxlength="45" readonly value="<%= userPO.getOfficer().trim()%>">
                </b> </div>
            </td>
            <td nowrap width="11%"> 
              <div align="right"><b>Moneda : </b></div>
            </td>
            <td nowrap width="21%"> 
              <div align="left"><b> 
                <input type="text" name="E01DEACCY" size="3" maxlength="3" value="<%= userPO.getCurrency().trim()%>" readonly>
                </b> </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <h4>Datos del Oficial</h4>
  <table class="tableinfo">
    <tr> 
      <td > 
        <table cellspacing=0 cellpadding=2 width="100%" border="0">
          <tr id="trdark"> 
            <td nowrap width="25%"> 
              <div align="right"><b>Correo Electr&oacute;nico : </b></div>
            </td>
            <td width="25%"> 
              <div align="Left"><a href="mailto:<%= stBalances.getE02OFCEML().trim()%>" target="body"><%= stBalances.getE02OFCEML().trim()%></a></div>
            </td>
            <td width="25%"> 
              <div align="right"><b>Oficina :</b></div>
            </td>
            <td nowrap> 
              <div align="left"><%= stBalances.getE02OFCAOF().trim()%></div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td width="25%"> 
              <div align="right"><b>Telefono :</b></div>
            </td>
            <td width="25%"> 
              <div align="left"><%= stBalances.getE02OFCPHN()%></div>
            </td>
            <td nowrap width="25%"> 
              <div align="right"><b>Extension :</b></div>
            </td>
            <td> 
              <div align="left"><%= stBalances.getE02OFCPXT()%></div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <h4>Datos B&aacute;sicos de la Cuenta</h4>
  <table class="tableinfo">
    <tr> 
      <td > 
        <table cellspacing=0 cellpadding=2 width="100%" border="0">
          <tr id="trdark"> 
            <td  width="20%"  nowrap> 
              <div align="right"><b>Nombre :</b></div>
            </td>
            <td  width="40%" > 
              <div align="left"></div>
              <%= stBalances.getE02LGNA01().trim()%></td>
            <td  width="25%" > 
              <div align="right"><b>Saldo</b> <%= stBalances.getE02ACMCCY().trim()%> 
                <b>en Libros :</b></div>
            </td>
            <td  width="15%"  nowrap> 
              <div align="right"><%= Util.fcolorCCY(stBalances.getE02ACMMGB().trim())%></div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td  width="20%"> 
              <div align="right"><b>Direcci&oacute;n :</b></div>
            </td>
            <td  width="40%" nowrap> 
              <div align="left"></div>
              <%= stBalances.getE02CUMMA1().trim()%></td>
            <td  width="25%" nowrap> 
              <div align="right"><b>Monto Diferido :</b></div>
            </td>
            <td  width="15%"> 
              <div align="right"><%= Util.fcolorCCY(stBalances.getE02UNCBAL().trim())%></div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td  width="20%" nowrap> 
              <div align="right"><b> </b></div>
            </td>
            <td  width="40%"> 
              <div align="left"></div>
              <%= stBalances.getE02CUMMA2().trim()%></td>
            <td  width="25%" nowrap> 
              <div align="right"><b>Monto Retenido :</b></div>
            </td>
            <td  width="15%"> 
              <div align="right"><%= Util.fcolorCCY(stBalances.getE02ACMHAM().trim())%></div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td  width="20%" nowrap> 
              <div align="right"></div>
            </td>
            <td  width="40%" nowrap> 
              <div align="left"></div>
              <%= stBalances.getE02CUMMA3().trim()%></td>
            <td  width="25%" nowrap> 
              <div align="right"><b>Saldo Disponible :</b></div>
            </td>
            <td  width="15%"> 
              <div align="right"><%= Util.fcolorCCY(stBalances.getE02AVALBL().trim())%></div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td  width="20%" nowrap> 
              <div align="right"></div>
            </td>
            <td  width="40%" nowrap> 
              <div align="left"></div>
              <%= stBalances.getE02CUMMA4().trim()%></td>
            <td  width="25%" nowrap> 
              <div align="right"><b>Saldo al </b><%= Util.formatCustomDate(currUser.getE01DTF(), stBalances.getE02LSSTMM().trim(), stBalances.getE02LSSTMD().trim(), stBalances.getE02LSSTMY().trim())%> <b>:</b></div>
            </td>
            <td  width="15%"> 
              <div align="right"><%= Util.fcolorCCY(stBalances.getE02ACMLSB().trim())%></div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td  width="20%"> 
              <div align="right"><b>Telefonos :</b></div>
            </td>
            <td  width="40%" nowrap> 
              <div align="left"></div>
              <%= stBalances.getE02CUSPHN().trim()%> <%= stBalances.getE02CUSHPN().trim()%>
             </td>
            <td  width="25%" nowrap> 
              <div align="right"><b>Promedio en Libros :</b></div>
            </td>
            <td  width="15%" nowrap> 
              <div align="right"><%= Util.fcolorCCY(stBalances.getE02ACMNAV().trim())%></div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td  width="20%"> 
              <div align="right"><b>Numero Fax :</b></div>
            </td>
            <td  width="40%" nowrap> 
              <%= stBalances.getE02CUSFAX().trim()%>
            </td>
            <td  width="25%" nowrap> 
              <div align="right"><b>Promedio Neto :</b></div>
            </td>
            <td  width="15%" nowrap> 
             <div align="right"><%= Util.fcolorCCY(stBalances.getE02ACMGAV().trim())%></div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td  width="20%"> 
              <div align="right"><b>Pagina Web :</b></div>
            </td>
            <td  width="40%" nowrap> 
              <div align="left"><a href="mailto:<%= stBalances.getE02CUSWEB().trim()%>" target="body"><%= stBalances.getE02CUSWEB().trim()%></a></div>
            </td>
            <td  width="25%" nowrap> 
              <div align="right"><b>Fecha de Apertura :</b></div>
            </td>
            <td  width="15%" nowrap> 
           <div align="right"> <%= Util.formatCustomDate(currUser.getE01DTF(), stBalances.getE02ACMOPM().trim(), stBalances.getE02ACMOPD().trim(), stBalances.getE02ACMOPY().trim())%> </div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td  width="20%" nowrap > 
              <div align="right"><b>Correo Electr&oacute;nico :</b></div>
            </td>
            <td  width="40%" nowrap > 
              <div align="left"><a href="mailto:<%= stBalances.getE02CUSIAD().trim()%>" target="body"><%= stBalances.getE02CUSIAD().trim()%></a></div>
            </td>
            <td  width="25%" > 
              <div align="right"><b></b></div>
            </td>
            <td  width="15%" nowrap > 
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <% if(interestTable.size()>0){ %>
  <h4 align="left">Tasa de Inter&eacute;s</h4>
  <table class="tableinfo">
  	<thead>
  		<tr id ="trdark">
 			<th>Monto</th>
 			<th>Tasa</th> 
  		</tr>
  	</thead>
  	<%
  	
  	
  	for(int i= 0; i< ((java.util.ArrayList)interestTable.keys().nextElement()).size();i++){ %>
  		<tr>
  			<td style="text-align:center;"><%out.print(((java.util.ArrayList)interestTable.elements().nextElement()).get(i)); %></td>
  			<td style="text-align:center;"><%out.print(((java.util.ArrayList)interestTable.keys().nextElement()).get(i)); %></td>
  		</tr>
  		
  	<%} %>
  </table>
  <%} %>
  <h4 align="left">Transacciones</h4>
  <TABLE id=cfTable class="tableinfo">
    <TR> 
      <TH ALIGN=CENTER nowrap>Fecha<br>Proceso</TH>
      <TH ALIGN=CENTER style="display:none" nowrap>Fecha<br>Registro</TH>
      <TH ALIGN=CENTER nowrap>Referencia</TH>
      <TH ALIGN=CENTER nowrap>Cod<br>Trn</TH>
      <TH ALIGN=CENTER nowrap>Descripcion </TH>
      <TH ALIGN=CENTER nowrap>Debito</TH>
      <TH ALIGN=CENTER nowrap>Credito</TH>
      <TH ALIGN=CENTER nowrap>Saldo</TH>
      <TH ALIGN=CENTER nowrap>Lote</TH>
      <TH ALIGN=CENTER nowrap>Fecha<br>Valor </TH>
      <TH ALIGN=CENTER nowrap>Hora</TH>
      <TH ALIGN=CENTER nowrap>Usuario </TH>
      <TH ALIGN=CENTER nowrap>Banco<br>Origen</TH>
      <TH ALIGN=CENTER nowrap>Sucursal<br>Origen</TH>
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
      			out.println("<A HREF=\""+request.getContextPath()+"/servlet/datapro.eibs.client.JSECIF030?SCREEN=1&Pos=" + pos +"\"><img src=\""+request.getContextPath()+"/images/s/previous_records.gif\" border=0></A>");
        }
  %>
  </TD>
  <TD WIDTH="50%" ALIGN=RIGHT>
 
  <%      
        if ( cifList.getShowNext() ) {
      			int pos = cifList.getLastRec();
      			out.println("<A HREF=\""+request.getContextPath()+"/servlet/datapro.eibs.client.JSECIF030?SCREEN=1&Pos=" + pos +"\"><img src=\""+request.getContextPath()+"/images/s/next_records.gif\" border=0></A>");
        }
  %> 
 </TD>
 </TR>
 </TABLE>

  <p align=center>&nbsp; </p>

  <%
  }
 %> 

<div align="center"> 
	   <input id="EIBSBTN" type=button name="Submit" value="HTML"  OnClick="PrintPreview();">
	   <input id="EIBSBTN" type=button name="Submit" value="PDF"   OnClick="PrintPreviewPDF();">
	   <input id="EIBSBTN" type=button name="Submit" value="EMAIL" OnClick="PrintPreviewEMAIL();">
  </div>


  <SCRIPT type="text/javascript">
    if (typeof(cfTable) != "undefined"){
    	var max=cfTable.rows.length;
     	for (i=1;i<max ;i++){
      		cfTable.rows[i].cells[1].style.display="none";
     	}
     } 
  </SCRIPT>
</FORM>

</BODY>
</HTML>
