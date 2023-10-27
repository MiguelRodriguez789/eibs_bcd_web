<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<%@ page import = "datapro.eibs.master.*" %>
<%@ page import = "datapro.eibs.master.Util" %>
<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@ page import="com.datapro.constants.EibsFields"%>

<html>
<head>
<title>Apertura de Creditos</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/jquery/plugins/contextMenu/css/jquery.contextMenu.css" rel="stylesheet" type="text/css" />

<jsp:useBean id="lnTrans" class="datapro.eibs.beans.EPV015030Message"  scope="session" /> 
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>


<SCRIPT type="text/javascript">
	builtNewMenu(pv_m_opt);
	initMenu();
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
%>

<h3 align="center"> Desembolso de Credito
<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="loans_disbursement.jsp,EPV0150"></h3>
<hr size="4">
<form method="POST" action="<%=request.getContextPath()%>/servlet/datapro.eibs.salesplatform.JSEPV0150">
  <input type="hidden" name="SCREEN" value="600"> 
  <INPUT TYPE=HIDDEN NAME="E30DEABNK" id="E30DEABNK" VALUE="<%=lnTrans.getE30DEABNK().trim()%>">
  
<%int row = 0; %>
 <table class="tableinfo" style="width: 1060px">
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
          <tr id="trdark">
            <td nowrap width="16%" > 
              <div align="right"><b>Cliente :</b></div>
            </td>
            <td nowrap width="20%" > 
              <div align="left">
              	<eibsinput:text property="E30DEACUN" name="lnTrans" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_CUSTOMER %>" readonly="true"/>
			  </div>
            </td>
            <td nowrap width="16%" > 
              <div align="right"><b>Nombre :</b> </div>
            </td>
            <td nowrap colspan="3" > 
              <div align="left">
              	<eibsinput:text property="E30CUSNA1" name="lnTrans" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_NAME %>" readonly="true"/>
              </div>
            </td>
          </tr>
          <tr id="trdark">
            <td nowrap width="16%"> 
              <div align="right"><b>Cuenta :</b></div>
            </td>
            <td nowrap width="20%"> 
              <div align="left"> 
              	<eibsinput:text property="E30DEAACC" name="lnTrans" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_ACCOUNT %>" readonly="true"/>
              </div>
            </td>
            <td nowrap width="16%"> 
              <div align="right"><b>Moneda : </b></div>
            </td>
            <td nowrap width="16%"> 
              <div align="left">
              	<eibsinput:text property="E30DEACCY" name="lnTrans" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_CURRENCY %>" readonly="true"/>
              </div>
            </td>
            <td nowrap width="16%"> 
              <div align="right"><b>Producto : </b></div>
            </td>
            <td nowrap width="16%"> 
              <div align="left">
              	<eibsinput:text property="E30DEATYP" name="lnTrans" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_PRODUCT %>" readonly="true"/>
              	<eibsinput:text property="E30DEAPRO" name="lnTrans" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_PRODUCT %>" readonly="true"/>
              </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
 </table>


<h4>Distribuci&oacute;n</h4> 
<table class="tableinfo" style="width: 1060px">
	<tr > 
		<td nowrap> 
			<table cellpadding=2 cellspacing=0 width="100%" border="0">
				<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            		<td nowrap width="20%"> 
              			<div align="right"></div>
            		</td>
            		<td nowrap width="10%">
            		</td>
		            <td nowrap width="10%"> 
		              <div align="right">Monto del Cr&eacute;dito :</div>
		            </td>
                    <td nowrap width="50%"> 
            			<eibsinput:text property="E30DEAOAM" name="lnTrans" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/> 
		            </td>
		          </tr>
		          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		            <td nowrap width="20%"> 
		              <div align="right"></div>
		            </td>
		            <td nowrap width="10%"> 
		            </td>
		            <td nowrap width="10%"> 
		              <div align="right">Cr&eacute;dito Renegociados :</div>
		            </td>
		            <td nowrap width="50%">
		            	 <eibsinput:text property="E30TOTCRN" name="lnTrans" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/>
		            </td>
		          </tr>
		          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		            <td nowrap width="20%%"> 
		              <div align="right"></div>
		            </td>
		            <td nowrap width="10%"> 
		            </td>
		            <td nowrap width="10%"> 
		              <div align="right">Cheques de Gerencia :</div>
		            </td>
		            <td nowrap width="50%">
		            	 <eibsinput:text property="E30TOTCHK" name="lnTrans" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/>
		            </td>
		          </tr>
		          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		            <td nowrap width="20%"> 
		              <div align="right"></div>
		            </td>
		            <td nowrap width="10%"> 
		            </td>
		            <td nowrap width="10%"> 
		              <div align="right">Impuestos :</div>
		            </td>
		            <td nowrap width="50%">
		            	 <eibsinput:text property="E30TOTIMP" name="lnTrans" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/>
		            </td>
		          </tr>
		          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		            <td nowrap width="20%"> 
		              <div align="right"></div>
		            </td>
		            <td nowrap width="10%"> 
		            </td>
		            <td nowrap width="10%"> 
		              <div align="right">Comisiones :</div>
		            </td>
		            <td nowrap width="50%">
		            	 <eibsinput:text property="E30TOTCOM" name="lnTrans" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/>
		            </td>
		          </tr>
		          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		            <td nowrap width="20%"> 
		              <div align="right"></div>
		            </td>
		            <td nowrap width="10%"> 
		            </td>
		            <td nowrap width="10%"> 
		              <div align="right">Deducciones :</div>
		            </td>
		            <td nowrap width="50%">
		            	 <eibsinput:text property="E30TOTDED" name="lnTrans" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/>
		            </td>
		          </tr>
		          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		            <td nowrap width="20%"> 
		              <div align="right"></div>
		            </td>
		            <td nowrap width="10%"> 
		            </td>
		            <td nowrap width="10%"> 
		              <div align="right">I.V.A. :</div>
		            </td>
		            <td nowrap width="50%">
		            	 <eibsinput:text property="E30TOTIVA" name="lnTrans" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/>
		            </td>
		          </tr>
		          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		            <td nowrap width="20%"> 
		              <div align="right"></div>
		            </td>
		            <td nowrap width="10%"> 
		            </td>
		            <td nowrap width="10%"> 
		              <div align="right">Otros Cargos :</div>
		            </td>
		            <td nowrap width="50%">
		            	 <eibsinput:text property="E30TOTOTH" name="lnTrans" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/>
		            </td>
		          </tr>
		          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		            <td nowrap width="20%"> 
		              <div align="right"></div>
		            </td>
		            <td nowrap width="10%"> 
		            </td>
		            <td nowrap width="10%"> 
		              <div align="right">Monto Neto(Desembolso) :</div>
		            </td>
		            <td nowrap width="50%">
		            	 <eibsinput:text property="E30BALNET" name="lnTrans" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/>
		            </td>
		          </tr>
	  		</table>
  		</td>
	</tr>
</table>


 
<h4>Cuenta de Desembolso</h4>
<TABLE id="mainTable" class="tableinfo" style="width: 1060px; ">
  <TR><TD>
  
   <table id="headTable" >
    <tr id="trdark">
      <td nowrap align="center" >Concepto</td>
      <td nowrap align="center" >Banco </td>
      <td nowrap align="center" >Sucursal</td>
      <td nowrap align="center" >Moneda</td>
      <td nowrap align="center" >Referencia</td>
      <td nowrap align="center" >Destino <br>Fondos</td>
      <td nowrap align="center" >Titular</td>
      <td nowrap align="center" >Monto</td>
    </tr>
    </table> 
      
    <div id="dataDiv" style="height: 150px; overflow-y :scroll; z-index:0" >
     <table id="dataTable" >
          <%
  				   int amount = 9;
 				   String name = "";
  					for ( int i=1; i<=amount; i++ ) {
   					  name = i + "";
   			%>			 
          <tr id="trclear">
            <td nowrap > 
              <div align="center" > 
              	<%= i %>
                <input type="text" name="E30OFFOP<%= name %>" id="E30OFFOP<%= name %>" value="<%= lnTrans.getField("E30OFFOP"+name).getString().trim()%>" size="3" maxlength="3">
                <input type="hidden" name="E30OFFGL<%= name %>" value="<%= lnTrans.getField("E30OFFGL"+name).getString().trim()%>">
                <input type="text" name="E30OFFCO<%= name %>" size="50" maxlength="45" readonly value="<%= lnTrans.getField("E30OFFCO"+name).getString().trim()%>" 
                  class="context-menu-help" onmousedown="init(conceptHelp,this.name,document.forms[0].E30DEABNK.value,'','E30OFFGL<%= name %>','E30OFFOP<%= name %>','10')">
              </div>
            </td>  
            <td nowrap > 
              <div align="center"> 
                <input type="text" name="E30OFFBK<%= name %>" size="2" maxlength="2" value="<%= lnTrans.getField("E30OFFBK"+name).getString().trim()%>">
              </div>
            </td>
            <td nowrap > 
              <div align="center"> 
                <input type="text" name="E30OFFBR<%= name %>" size="4" maxlength="4" value="<%= lnTrans.getField("E30OFFBR"+name).getString().trim()%>"
                class="context-menu-help" onmousedown="init(branchHelp,this.name,document.forms[0].E30DEABNK.value,'','','','')">
              </div>
            </td>
            <td nowrap  > 
              <div align="center"> 
                <input type="text" name="E30OFFCY<%= name %>" size="3" maxlength="3" value="<%= lnTrans.getField("E30OFFCY"+name).getString().trim()%>"
                class="context-menu-help" onmousedown="init(currencyHelp,this.name,document.forms[0].E30DEABNK.value,'','','','')">
               </div>
            </td>
            <td nowrap > 
              <div align="center"> 
                <input type="text" name="E30OFFAC<%= name %>" id="E30OFFAC<%= name %>" size="12" maxlength="12"  value="<%= lnTrans.getField("E30OFFAC"+name).getString().trim()%>"
                class="context-menu-help" onmousedown="init(accountHelp,this.name,document.forms[0].E30DEABNK.value,'','','','RT')">
               </div>
            </td>

            <td nowrap  > 
              <div align="center"> 
                <input type="text" name="E30OFFDF<%= name %>" id="E30OFFDF<%= name %>" size="5" maxlength="04"  value="<%= lnTrans.getField("E30OFFDF"+name).getString().trim()%>"
                class="context-menu-help" onmousedown="init(cnofHelp,this.name,'','','','','38')" >
              </div>
            </td>
            
            <td nowrap  > 
                <div align="center"> 
                  <input type="text" readonly  name="E30OFFNM<%= name %>" size="50" maxlength="45"  value="<%= lnTrans.getField("E30OFFNM"+name).getString().trim()%>">
                </div>
            </td>

            <td nowrap  > 
              <div align="center"> 
                <input type="text" name="E30OFFAM<%= name %>" size="15" maxlength="15"  value="<%= lnTrans.getField("E30OFFAM"+name).getString().trim()%>" onKeypress="enterDecimal(event, 2)">
              </div>
            </td>
          </tr>
          
    	<%}%>
    	</table>
        </div>
        
          <table id="footTable" style="width: 1060px;"> 
          <tr id="trdark"> 
            <td nowrap align="right"><b>Equivalente Moneda del Préstamo : </b>
            </td>
            <td nowrap align="center"><b><i><strong> 
                <input type="text" name="E30OFFEQV" size="15" maxlength="15" readonly value="<%= lnTrans.getE30OFFEQV().trim()%>">
                </strong></i></b>
            </td>
          </tr>
        </table>
        
        </TD>  
</TR>	
</TABLE>    
 <SCRIPT type="text/javascript">
    function tableresize() {
     adjustEquTables( getElement('headTable'), getElement('dataTable'), getElement('dataDiv'),0,true);
   }
  tableresize();
  window.onresize=tableresize; 
  </SCRIPT>

<table class="tbenter" style=" width: 1080px">
	<tr > 
	<td width="50%"> 
    	<div align="center"> 
  			<p> <input id="EIBSBTN" type="submit" name="Submit"   value="Enviar"> </p>
		</div>
	</td>
    </tr>
</table>

</form>

</body>
</html>
