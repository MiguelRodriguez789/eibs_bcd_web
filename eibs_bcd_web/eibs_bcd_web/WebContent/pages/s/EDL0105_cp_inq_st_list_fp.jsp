<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<%@ page import = "datapro.eibs.master.Util" %>
<HTML>
<HEAD>
<TITLE>
Account Statement
</TITLE>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V4.0 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
</HEAD>

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "cifList" class= "datapro.eibs.beans.JBList"  scope="session" />
<jsp:useBean id="stBalances" class="datapro.eibs.beans.EDL030002Message"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>
<jsp:useBean id="currUser" class="datapro.eibs.beans.ESS0030DSMessage" scope="session" />

<BODY>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>

<SCRIPT type="text/javascript">

	   builtNewMenu(cp_i_opt);

function PrintPreview() {

  <% 
  int iniPos = cifList.getFirstRec() - 1;
  out.println("var pos = " + iniPos + ";");
  %>
    CenterWindow('<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSEDL0300?SCREEN=4&Pos=' + pos,600,500,4);
}

</SCRIPT>

<% 
 if ( !error.getERRNUM().equals("0")  ) {
     error.setERRNUM("0");
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
 }
 
   out.println("<SCRIPT> initMenu();  </SCRIPT>");
%> 

<FORM>
<h3 align="center">Estado de Cuenta<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="cp_inq_st_list_fp.jsp,EDL0300"> 
  </h3>
  <hr size="4">
<BR>
<%
	if ( cifList.getNoResult() ) {
%>
   <table class="tbenter" width="100%" height="75%">
          <tr > 
            <td  align="center"> 
              <b>No hay datos que correspondan con su criterio de busqueda</b>
            </td>
          </tr>
   </table>           
  <%	
	}
	else {
%> 
  <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
          <tr id="trdark"> 
            <td nowrap width="16%" > 
              <div align="right"><b>No. Cliente :</b></div>
            </td>
            <td nowrap width="20%" > 
              <div align="left"> 
                <input type="text" name="E12DEACUN" size="9" maxlength="9" readonly value="<%= userPO.getCusNum().trim()%>">
              </div>
            </td>
            <td nowrap width="16%" > 
              <div align="right"><b>Nombre :</b> </div>
            </td>
            <td nowrap colspan="3" > 
              <div align="left"> 
                <input type="text" name="E12CUSNA1" size="45" maxlength="45" readonly value="<%= userPO.getCusName().trim()%>">
              </div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="16%"> 
              <div align="right"><b>Cuenta :</b></div>
            </td>
            <td nowrap width="20%"> 
              <div align="left"> 
                <input type="text" name="E12DEAACC" size="12" maxlength="9" value="<%= userPO.getIdentifier().trim()%>" readonly>
              </div>
            </td>
            <td nowrap width="16%"> 
              <div align="right"><b>Moneda : </b></div>
            </td>
            <td nowrap width="16%"> 
              <div align="left"><b> 
                <input type="text" name="E12DEACCY" size="3" maxlength="3" value="<%= userPO.getCurrency().trim()%>" readonly>
                </b> </div>
            </td>
            <td nowrap width="16%"> 
              <div align="right"><b>Producto : </b></div>
            </td>
            <td nowrap width="16%"> 
              <div align="left"><b> 
                <input type="text" name="E12DEAPRO" size="4" maxlength="4" readonly value="<%= userPO.getProdCode().trim()%>">
                </b> </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <h4>Informaci�n B�sica de la Cuenta</h4>
  <table class="tableinfo">
    <tr > 
      <td > 
        <table cellspacing=0 cellpadding=2 width="100%" border="0">
          <tr id="trdark"> 
            <td  width="32%"  nowrap> 
              <div align="right"><b>Nombre :</b></div>
            </td>
            <td  width="28%" > 
              <div align="left"></div>
              <%= stBalances.getE02CUSNA1().trim()%></td>
            <td  width="25%" > 
              <div align="right"><b>Gross Balance :</b><b></b></div>
            </td>
            <td  width="15%"  nowrap> 
              <div align="right"><%= Util.fcolorCCY(stBalances.getE02DEAMEP().trim())%></div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td  width="32%"> 
              <div align="right"><b>Direcci�n :</b></div>
            </td>
            <td  width="28%" nowrap> 
              <div align="left"></div>
              <%= stBalances.getE02CUMMA1().trim()%></td>
            <td  width="25%" nowrap> 
              <div align="right"><b>Interest Balance :</b></div>
            </td>
            <td  width="15%"> 
              <div align="right"><%= Util.fcolorCCY(stBalances.getE02DEAMEI().trim())%></div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td  width="32%" nowrap> 
              <div align="right"><b> </b></div>
            </td>
            <td  width="28%"> 
              <div align="left"></div>
              <%= stBalances.getE02CUMMA2().trim()%></td>
            <td  width="25%" nowrap> 
              <div align="right"><b>Total Balance :</b></div>
            </td>
            <td  width="15%"> 
              <div align="right"><%= Util.fcolorCCY(stBalances.getE02TOTAMN().trim())%></div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td  width="32%" nowrap> 
              <div align="right"></div>
            </td>
            <td  width="28%" nowrap> 
              <div align="left">
              <%= stBalances.getE02CUMMA3().trim()%>
		</div>
              <div align="left">
              <%= stBalances.getE02CUMMA4().trim()%>
		</div>
		</td>
            <td  width="25%" nowrap> 
              <div align="right"><b>Tasa de Inter�s  :</b></div>
            </td>
            <td  width="15%"> 
              <div align="right"><%= stBalances.getE02DEARTE().trim()%></div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td  width="32%"> 
              <div align="right"><b>Fecha de Apertura :</b></div>
            </td>
            <td  width="28%" nowrap> 
              <div align="left">
              <%= Util.formatCustomDate(currUser.getE01DTF(), stBalances.getE02OPENDM(),stBalances.getE02OPENDD(),stBalances.getE02OPENDY())%>
		</div>
	     </td>
            <td  width="25%" nowrap> 
              <div align="right"><b>Maturity Date :</b></div>
            </td>
            <td  width="15%" nowrap> 
              <div align="right"> <%= Util.formatCustomDate(currUser.getE01DTF(), stBalances.getE02MATURM(),stBalances.getE02MATURD(),stBalances.getE02MATURY())%> </div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td  width="32%"> 
              <div align="right"><b>Fecha de Ultima Renovaci�n  :</b></div>
            </td>
            <td  width="28%" nowrap> 
              <div align="left">
			  <%= Util.formatCustomDate(currUser.getE01DTF(), stBalances.getE02LSTRDM(),stBalances.getE02LSTRDD(),stBalances.getE02LSTRDY())%>              
		</div>
            </td>
            <td  width="25%" nowrap> 
              <div align="right"><b>Renewal Times :</b></div>
            </td>
            <td  width="15%" nowrap> 
              <div align="left"><%= stBalances.getE02DEARON().trim()%></div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td  width="32%"> 
              <div align="right"><b>Accrued Through :</b></div>
            </td>
            <td  width="28%" nowrap > 
              <div align="left"></div>
			  <%= Util.formatCustomDate(currUser.getE01DTF(), stBalances.getE02LSTCLM(),stBalances.getE02LSTCLD(),stBalances.getE02LSTCLY())%>              
			</td>
            <td  width="25%" nowrap > 
              <div align="right"><b>E-Mail :</b></div>
            </td>
            <td  width="15%" nowrap > 
              <div align="right"><a href="mailto:<%= stBalances.getE02CUSIAD().trim()%>" target="body"><%= stBalances.getE02CUSIAD().trim()%></a></div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <h4 align="left">Transacciones</h4>
  <TABLE class="tableinfo">
    <TR id="trclear"> 
      <TH ALIGN=CENTER nowrap width="10%" >Fecha de Proceso</TH>
      <TH ALIGN=CENTER  nowrap width="11%" >Fecha Valor</TH>
      <TH ALIGN=CENTER  nowrap width="11%" >Posting Date</TH>
      <TH ALIGN=CENTER  nowrap width="3%" >TC</TH>
      <TH ALIGN=CENTER  nowrap width="10%" >Descripci�n</TH>
      <TH ALIGN=CENTER  nowrap colspan="2" > Principal</TH>
      <TH ALIGN=CENTER  nowrap colspan="2" >Inter�s </TH>
      <TH ALIGN=CENTER nowrap width="5%" >Batch</TH>
      <TH ALIGN=CENTER nowrap width="5%" > Hora</TH>
      <TH ALIGN=CENTER nowrap width="5%" >Usuario</TH>
      <TH ALIGN=CENTER nowrap width="7%" >O/ Banco</TH>
      <TH ALIGN=CENTER nowrap width="9%" >O/ Agencia</TH>
      <TH ALIGN=CENTER nowrap width="8%" >Trans.ID</TH>
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
      			out.println("<A HREF=\""+request.getContextPath()+"/servlet/datapro.eibs.client.JSEDL0300?SCREEN=1&Pos=" + pos +"\"><IMG border=\"0\" src=\""+request.getContextPath()+"/images/e/previous_records.gif\" ></A>");
        }
 %>  
  </TD>
  <TD WIDTH="50%" ALIGN=RIGHT>     
 <%
        if ( cifList.getShowNext() ) {
      			int pos = cifList.getLastRec();
      			out.println("<A HREF=\""+request.getContextPath()+"/servlet/datapro.eibs.client.JSEDL0300?SCREEN=1&Pos=" + pos +"\"><IMG border=\"0\" src=\""+request.getContextPath()+"/images/e/next_records.gif\" ></A>");
        }
%>
</TD>
</TR>
</TABLE>

 <br>
  <div align="center"> 
	   <input id="EIBSBTN" type=button name="Submit" value="Imprimir" OnClick="PrintPreview();">
  </div>

  <%
  }
%> 
  
</FORM>

</BODY>
</HTML>
