
<%@ page import = "datapro.eibs.master.Util" %>
<HTML>
<HEAD>
<TITLE>Plan de Ahorro Programado</TITLE>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="msgHeader" class="datapro.eibs.beans.EDD000007Message"  scope="session" />
<jsp:useBean id= "savList" class= "datapro.eibs.beans.JBList"  scope="session" />

<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>

<SCRIPT Language="Javascript">
  function goAction(op) {

     getElement("opt").value = op;
     var formLength= document.forms[0].elements.length;
     var ok = false;
     for(n=0;n<formLength;n++)
     {
      	var elementName= document.forms[0].elements[n].name;
      	if(elementName == "EWDRAC") 
      	{
        		ok = true;
        		break;
      	}
      }
	 if ( ok || (op == 3) ) {
          document.forms[0].submit();
     }
     else {
			alert("Seleccione una cuenta antes de realizar esta operación");	   
     }

  }
 
function PrintPreviewPDF() {
 <% 
  int iniPos = 1;
  out.println("var pos = " + iniPos + ";");
  %>
  var mod = document.forms[0].mod.value;
  CenterWindow('<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDD0000?SCREEN=9&mod='+mod+'&Pos=' + pos,600,500,4);
} 
  
function doPrint(){
	if(!window.print){
       var msg ="This browser doesn't allow print";
	   alert(msg);
	   return;}
	
    window.focus();
	window.print();

	return;
}

</SCRIPT>
</HEAD>


<BODY>

<h3 align="center">Plan de Ahorro Programado<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="sv_sched_plan.jsp,EDD0000"> 
  </h3>
  <hr size="4">

<form method="post"  action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDD0000">
  <input TYPE=HIDDEN name="SCREEN" id="SCREEN" value="600">
  <INPUT TYPE=HIDDEN NAME="opt" id="opt" VALUE="1">
  <INPUT TYPE=HIDDEN NAME="mod" id="mod" VALUE="<%=msgHeader.getH07SCRCOD()%>">


<%
	if ( savList.getNoResult() ) {
%>

<table class="tableinfo" style="width: 1040px">
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
          <tr id="trdark"> 
            <td nowrap > 
              <div align="right"><b>Cliente:</b></div>
            </td>
            <td nowrap > 
              <input type="text" name="E02ACMCUN" size="9" maxlength="9" value="<%= userPO.getHeader2().trim()%>" readonly>
            </td>
            <td nowrap> 
              <div align="right"><b>Nombre:</b></div>
            </td>
            <td nowrap> 
              <input type="text" name="E02CUSNA1" size="45" maxlength="45" value="<%= userPO.getHeader3().trim()%>" readonly>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap >               
              <div align="right"><b>Cuenta:</b></div>
            </td>
            <td nowrap > 
              <input type="text" name="E02ACMACC" size="12" maxlength="12" value="<%= userPO.getIdentifier().trim()%>" readonly>
            </td>
            <td nowrap> 
              <div align="right"><b>Producto:</b></div>
            </td>
            <td nowrap> 
              <input type="text" name="E02ACMPRO" size="4" maxlength="4" value="<%= userPO.getHeader1().trim()%>" readonly>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>

  <% int row = 0; %>
 		
<TABLE class="tbenter" height=60% width="100%">
  <TR>      
    <TD> 
      <div align="center"> 
        <p>No existen resultados que correspondan a su criterio de búsqueda, por 
          favor escoja entre las siguientes opciones<font size="3"><b> </b></font> 
        </p>
        <table class="tbenter" width="100%">
        </table>
      </div>
    </TD>
  </TR>
</TABLE>
<%
	}
	else {
%> 

<BR> 
<table class="tableinfo" style="width: 1040px">
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
			<tr id="trdark">
				<td nowrap width="16%">
				<div align="right"><b>Cliente :</b></div>
				</td>
				<td nowrap width="20%">
				<div align="left"><input type="text" name="E01ACMCUN"
					size="10" maxlength="9" value="<%=userPO.getHeader16().trim()%>" readonly></div>
				</td>
				<td nowrap width="16%">
				<div align="right"><b>Nombre :</b></div>
				</td>
				<td nowrap colspan="3">
				<div align="left"><font face="Arial"><font face="Arial"><font
					size="2"> <input type="text" name="E01CUSNA1" size="45"
					maxlength="45" value="<%=userPO.getHeader17().trim()%>" readonly>
				</font></font></font></div>
				</td>
				<td nowrap> 
            	 <div align="right"><b>IDN Cliente:</b></div>
            </td>
            <td nowrap> 
            	<input type="text" name="E02CUSIDN" size="15" maxlength="16" value="<%= userPO.getHeader19().trim()%>" readonly>
            </td>
			</tr>
			<tr id="trdark">
				<td nowrap width="16%">
				<div align="right"><b>Cuenta :</b></div>
				</td>
				<td nowrap width="20%">
				<div align="left"><input type="text" name="E01ACMACC"
					size="13" maxlength="12"
					value="<%=userPO.getIdentifier().trim()%>" readonly></div>
				</td>
				<td nowrap width="16%">
				<div align="right"><b>Moneda : </b></div>
				</td>
				<td nowrap width="16%">
				<div align="left"><b> <input type="text" name="E01DEACCY"
					size="3" maxlength="3" value="<%=userPO.getCurrency().trim()%>"
					readonly> </b></div>
				</td>
				<td nowrap width="16%">
				</td>
				<td nowrap width="16%">
				</td>
				<td nowrap >
				<div align="right"><b>Producto : </b></div>
				</td>
				<td nowrap width="16%">
				<div align="left"><b> <input type="text" name="E01ACMPRO"
					size="4" maxlength="4" value="<%=userPO.getHeader18().trim()%>" readonly>
				</b></div>
				</td>
			</tr>
			<tr id="trdark">
				<td nowrap width="29%"> 
              		<div align="right">Fecha de Apertura :</div>
            	</td>
            	<td nowrap width="22%"> 
		   		  <input type="text" size="2" maxlength="2" readonly value="<%=userPO.getHeader20().trim()%>"/>
		   		  <input type="text" size="2" maxlength="2" readonly value="<%=userPO.getHeader21().trim()%>"/>
		   		  <input type="text" size="4" maxlength="4" readonly value="<%=userPO.getHeader22().trim()%>"/>
            	</td>
				<td nowrap width="16%">
				<div align="right"><b>Estado de la Cuenta : </b></div>
				</td>
				<td nowrap width="16%">
				<div align="left"><b> <input type="text" name="E01DEACCY"
					size="60" maxlength="60" value="<%=userPO.getHeader23().trim()%>"
					readonly> </b></div>
				</td>
				<td nowrap>
				</td>
				<td nowrap>
				</td>
				<td nowrap width="16%">
				</td>
				<td nowrap width="16%">
				</td>
			</tr>
        </table>
      </td>
    </tr>
  </table>

<TABLE class="tbenter">
</TABLE>

   <TABLE  id="mainTable" class="tableinfo" style="height:400px; width:1040px;">
   <tr  height="5%"> 
      <td NOWRAP valign="top" width="100%"> 
		<table id="headTable" width="98%">
			<tr id="trdark">
		      <TH ALIGN=CENTER nowrap width="10%">Nro Cuota</TH>
		      <TH ALIGN=CENTER nowrap width="10%">Fecha Corte</TH>
		      <TH ALIGN=CENTER nowrap width="20%">Monto Ahorro</TH>
		      <TH ALIGN=CENTER nowrap width="20%">Monto Consignado</TH>			
		      <TH ALIGN=CENTER nowrap width="20%">Diferencia</TH>
		      <TH ALIGN=CENTER nowrap width="25%">Observaciones</TH>
			</tr>
        </table>
      </td>
    </tr>    
		  <tr  height="95%">    
		    <td nowrap="nowrap">      
		       <div id="dataDiv1" style="height:400px; overflow:auto;"> 
		       <table id="dataTable" cellspacing="0" cellpadding="1" border="0" width="100%" 
		       			style="height: 100px; overflow-y: auto; overflow-x: hidden;">         

    <%			int cuota=0;
                savList.initRow();
                while (savList.getNextRow()) {
                    if (savList.getFlag().equals("")) {
                    		out.println(savList.getRecord());
                    		cuota++;
                    }
                }
              %> 
             </table>
             </div>
             </td>
             </tr>
</table>
<h4>Totales</h4>
<TABLE  id="mainTable" class="tableinfo" style="height:20px; width:1040px;">
   <tr  height="5%"> 
      <td NOWRAP valign="top" width="100%"> 
		<table id="headTable" width="98%">
			<tr id="trdark">
			  <TH ALIGN=CENTER nowrap width="10%">Cuotas</TH>
		      <TH ALIGN=CENTER nowrap width="20%">Monto Ahorro</TH>
		      <TH ALIGN=CENTER nowrap width="20%">Monto Consignado</TH>
		      <TH ALIGN=CENTER nowrap width="20%">Diferencia</TH>
		      <TH ALIGN=CENTER nowrap width="25%">Observaciones</TH>			
			</tr>
			<tr id="trclear">
				<td align="center"><%=cuota %></td>
				<td align="center"><%=userPO.getHeader13() %></td>
				<td align="center"><%=userPO.getHeader14() %></td>
				<td align="center"><%=userPO.getHeader15() %></td>
				<td align="center"><%=userPO.getHeader12() %></td>
			</tr>
        </table>
      </td>
    </tr>    
</TABLE>		  

  <%
  }
%>

	<div align="center"> 
		<input id="EIBSBTN" type=button name="Submit" value="Imprimir" OnClick="PrintPreviewPDF()">
		<input id="EIBSBTN" type=button name="Submit" value="Salir" OnClick="checkClose()">
	</div>

 
</FORM>

</BODY>
</HTML>
