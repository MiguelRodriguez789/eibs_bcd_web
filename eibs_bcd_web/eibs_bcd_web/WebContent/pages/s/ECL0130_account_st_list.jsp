<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<%@ page import = "datapro.eibs.master.Util" %>
<HTML>
<HEAD>
<TITLE> Consulta de Saldos </TITLE>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Studio">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
</HEAD>

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "cifList" class= "datapro.eibs.beans.JBList"  scope="session" />
<jsp:useBean id="stBalances" class="datapro.eibs.beans.ECIF03002Message"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>
<jsp:useBean id="currUser" class="datapro.eibs.beans.ESS0030DSMessage"  scope="session" />

<BODY >

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>

<% 
 if ( !error.getERRNUM().equals("0")  ) {
     out.println("<SCRIPT Language=\"Javascript\">");
     error.setERRNUM("0");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
 }
 
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
  <h3 align="center">Operaciones del Cliente<br>Consulta de Saldos - Movimientos<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="account_st_list.jsp, ECL0130"> 
  </h3>
  <hr size="4">
  <br>
  <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
          <tr id="trdark"> 
            <td nowrap width="14%" > 
              <div align="right"><b>Identificación del Cliente :</b></div>
            </td>
            <td nowrap width="20%" > 
              <div align="left"> 
              		<input type="text" name="CUSIDT" size="2" maxlength="1" value="<%= userPO.getHeader1().trim()%>" readonly>
              		<input type="text" name="CUSIDN" size="10" maxlength="9" value="<%= userPO.getHeader2().trim()%>" readonly>
              </div>
            </td>
            <td nowrap width="12%" > 
              <div align="right"><b>Nombre del Cliente :</b> </div>
            </td>
            <td nowrap width="12%"> 
              <div align="left"> 
					<input type="text" name="CUSNA1" size="45" maxlength="45" readonly value="<%= userPO.getCusName().trim()%>">
              </div>
            </td>
            <td nowrap > 
            </td>
            <td nowrap ></td>
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
            <td  width="21%" height="15" nowrap> 
              <div align="right"><b>Promedio en Libros :  </b></div>
            </td>
            <td  width="30%" height="15"> 
              <div align="right"><%= Util.fcolorCCY(stBalances.getE02ACMNAV().trim())%></div>
            </td>
            <td  width="1%" height="15">&nbsp;</td>
            <td  width="32%" height="15"> 
              <div align="right"> <b>Saldo</b> <%= stBalances.getE02ACMCCY().trim()%> 
                <b>en Libros :</b></div>
            </td>
            <td  width="16%" height="15" nowrap> 
              <div align="right"><%= Util.fcolorCCY(stBalances.getE02ACMMGB().trim())%></div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td  width="21%"> 
              <div align="right"><b>Promedio Neto : </b></div>
            </td>
            <td  width="30%" nowrap> 
             <div align="right"><%= Util.fcolorCCY(stBalances.getE02ACMGAV().trim())%></div>
            </td>
            <td  width="1%">&nbsp;</td>
            <td  width="32%" nowrap> 
              <div align="right"><b>Monto Diferido : </b></div>
            </td>
            <td  width="16%"> 
              <div align="right"><%= Util.fcolorCCY(stBalances.getE02UNCBAL().trim())%></div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td  width="21%" nowrap> 
              <div align="right"><b>Fax : </b></div>
            </td>
            <td  width="30%"> 
              <div align="right"><%= stBalances.getE02CUSFAX().trim()%></div>
            </td>
            <td  width="1%">&nbsp;</td>
            <td  width="32%" nowrap> 
              <div align="right"><b>Monto Retenido : </b></div>
            </td>
            <td  width="16%"> 
              <div align="right"><%= Util.fcolorCCY(stBalances.getE02ACMHAM().trim())%></div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td  width="21%" nowrap> 
              <div align="right"><b>Correo Electr&oacute;nico : </b></div>
            </td>
            <td  width="30%" nowrap> 
             <div align="right"><a href="mailto:<%= stBalances.getE02CUSIAD().trim()%>" target="body"><%= stBalances.getE02CUSIAD().trim()%></a></div>             
            </td>
            <td  width="1%">&nbsp;</td>
            <td  width="32%" nowrap> 
              <div align="right"><b>Saldo Disponible : </b></div>
            </td>
            <td  width="16%"> 
              <div align="right"><%= Util.fcolorCCY(stBalances.getE02AVALBL().trim())%></div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td  width="21%"> 
              <div align="right"><b></b></div>
            </td>
            <td  width="30%" nowrap> 
            </td>
            <td  width="1%">&nbsp;</td>
            <td  width="32%" nowrap> 
              <div align="right"><b> Saldo al </b><%= Util.formatCustomDate(currUser.getE01DTF(), stBalances.getE02LSSTMM().trim(),stBalances.getE02LSSTMD().trim(), stBalances.getE02LSSTMY().trim())%> 
                <b>: </b></div>
            </td>
            <td  width="16%" nowrap> 
              <div align="right"><%= Util.fcolorCCY(userPO.getHeader5().trim())%></div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <h4 align="left">Transacciones</h4>
  <table id=cfTable class="tableinfo">
    <tr> 
      <th align=CENTER width="53" nowrap>Fecha Valor</th>
      <th align=CENTER style="display:none" width="57" nowrap>Fecha de <BR> Registro</th>
      <th align=CENTER width="57" nowrap>Referencia</th>
      <th align=CENTER width="25" nowrap>TC</th>
      <th align=CENTER width="230" nowrap>Descripci&oacute;n </th>
      <th align=CENTER width="36" nowrap> 
        <div align="right">D&eacute;bito</div>
      </th>
      <th align=CENTER width="46" nowrap> 
        <div align="center">Cr&eacute;dito</div>
      </th>
      <th align=CENTER width="57" nowrap> 
        <div align="center">Saldo</div>
      </th>
      <th align=CENTER width="49" nowrap>Lote</th>
      <th align=CENTER width="43" nowrap>Fecha Proceso </th>
      <th align=CENTER width="39" nowrap>Hora</th>
      <th align=CENTER width="50" nowrap>Usuario </th>
    </tr>
    <%
                cifList.initRow();
                while (cifList.getNextRow()) {
                    if (cifList.getFlag().equals("")) {
                    		out.println(cifList.getRecord());
                    }
                }
              %> 
  </table>

  <%
  }
%> 
  <p>
       <TABLE class="tbenter" WIDTH="98%" ALIGN=CENTER>
       <TR>
       <TD WIDTH="50%" ALIGN=LEFT>
        <%
        if ( cifList.getShowPrev() ) {
      			int pos = cifList.getFirstRec() - 51;
      			out.println("<A HREF=\""+request.getContextPath()+"/servlet/datapro.eibs.misc.JSECL0130?SCREEN=5&Pos=" + pos +"\"><img src=\""+request.getContextPath()+"/images/s/previous_records.gif\" border=0></A>");
        }
        %>
        </TD>
 		  <TD WIDTH="50%" ALIGN=RIGHT>
 		   <%
         if ( cifList.getShowNext() ) {
      			int pos = cifList.getLastRec();
      			out.println("<A HREF=\""+request.getContextPath()+"/servlet/datapro.eibs.misc.JSECL0130?SCREEN=5&Pos=" + pos +"\"><img src=\""+request.getContextPath()+"/images/s/next_records.gif\" border=0></A>");
        }
         %>
         </TD>
 			</TR>
			</TABLE> 
  <SCRIPT type="text/javascript">
   if (typeof(cfTable) != "undefined"){
		var max=cfTable.rows.length;
     	for(i= 1; i < max; i++){
      		cfTable.rows[i].cells[1].style.display="none";
     	}
    }
  </SCRIPT>
</FORM>

</BODY>
</HTML>
