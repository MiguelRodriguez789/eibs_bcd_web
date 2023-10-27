<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<%@ page import = "datapro.eibs.master.Util" %>
<html>
<head>
<title>Emisión de Cheques</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">

<jsp:useBean id= "dvDocDet" class= "datapro.eibs.beans.ETL051002Message"  scope="session" />

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />

<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
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
<H3 align="center">Consulta de Cheques de Gerencia<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="chk_off_inq_det.jsp, ETL0510"> 
</H3>
<hr size="4">
<form >
  
 <h4>Informacion Basica</h4> 
 <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing=0 cellpadding=2 width="100%" border="0">
          <tr id="trdark"> 
            <td nowrap> 
              <div align="right">Cheque No. :</div>
            </td>
            <td nowrap> 
              <%= dvDocDet.getE02OFMNCH().trim()%>
            </td>
            <td nowrap> 
              <div align="right">Fecha :</div>
            </td>
            <td nowrap>
              <%= Util.formatDate(dvDocDet.getE02OFMEDD(),dvDocDet.getE02OFMEDM(),dvDocDet.getE02OFMEDY())%> 
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap> 
              <div align="right">Banco / Sucursal : </div>
            </td>
            <td nowrap>
              <%= dvDocDet.getE02OFMBNK().trim()%> 
              / 
              <%= dvDocDet.getE02OFMBRN().trim()%>
            </td>
            <td nowrap>
              <div align="right">Moneda : </div>
            </td>
            <td nowrap>
              <%= dvDocDet.getE02OFMCCY().trim()%>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap> 
              <div align="right">Pagar a la Orden de :</div>
            </td>
				<td nowrap colspan="3">
   				  <DIV align="left">
   				    <%= dvDocDet.getE02OFMBNF().trim()%>
   				  </DIV>
				</td>
			</tr>
			  <tr id="trclear"> 
	            <td nowrap > 
	              <div align="right">Direccion : </div>
	            </td>
	            <td nowrap colspan="3"> 
	              <%= dvDocDet.getE02OFMBN1().trim()%>
	            </td>
	          </tr>
			  <tr id="trdark"> 
	            <td nowrap > 
	              <div align="right"> </div>
	            </td>
	            <td nowrap colspan="3"> 
	              <%= dvDocDet.getE02OFMBN2().trim()%>
	            </td>
	          </tr>
          <tr id="trclear"> 
            <td nowrap> 
              <div align="right">Identificacion :</div>
            </td>
            <td nowrap  colspan="3">
            <%= dvDocDet.getE02OFMBID().trim()%></td>
          </tr>
          <tr id="trdark"> 
            <td nowrap > 
              <div align="right">La suma de :</div>
            </td>
            <td nowrap colspan="3"> 
              <%= dvDocDet.getE02OFMMCH().trim()%>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap > 
              <div align="right">Clase de Cheque :</div>
            </td>
            <td nowrap colspan="3"> 
              <%= dvDocDet.getE02OFMFL1().trim()%>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <h4>Datos de la Transacci&oacute;n</h4>
<table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing=0 cellpadding=2 width="100%" border="0">
          <tr id="trdark"> 
            <td nowrap > 
              <div align="right">Medio de Pago :</div>
            </td>
            <td nowrap colspan=3> 
              <div align="left">
              	
                <% if(dvDocDet.getE02FRMPAG().equals("0")) out.print("Efectivo");
                 else if(dvDocDet.getE02FRMPAG().equals("1")) out.print("Documento del Banco");
                 else if(dvDocDet.getE02FRMPAG().equals("2")) out.print("Documento Otros Bancos misma Localidad");
              	 else if(dvDocDet.getE02FRMPAG().equals("4")) out.print("Documento Otros Bancos Otras Localidades");
                 else if(dvDocDet.getE02FRMPAG().equals("5")) out.print("Cheque Gerencia");
                 else out.print("");%></div>
              </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap > 
              <div align="right">Identificacion del Aplicante :</div>
            </td>
            <td nowrap >
              <%= dvDocDet.getE02OFMAID().trim()%>
            </td>
            <td nowrap > 
              <div align="right">Cliente :</div>
            </td>
            <td nowrap> 
              <%= dvDocDet.getE02OFMCUN().trim()%>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap > 
              <div align="right">Nombre del Aplicante :</div>
            </td>
            <td nowrap colspan="3">
              <%= dvDocDet.getE02OFMAPL().trim()%>
            </td>
          </tr>
		  <tr id="trclear"> 
            <td nowrap > 
              <div align="right"> </div>
            </td>
            <td nowrap colspan="3"> 
              <%= dvDocDet.getE02OFMAP1().trim()%>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap > 
              <div align="right">Descripcion :</div>
            </td>
            <td nowrap colspan="3"> 
              <%= dvDocDet.getE02OFMCO1().trim()%>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap > 
              <div align="right"></div>
            </td>
            <td nowrap colspan="3"> 
              <%= dvDocDet.getE02OFMCO2().trim()%>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap > 
              <div align="right"></div>
            </td>
            <td nowrap colspan="3"> 
              <%= dvDocDet.getE02OFMCO3().trim()%>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap > 
              <div align="right">Direcci&oacute;n :</div>
            </td>
            <td nowrap colspan="3">
              <%= dvDocDet.getE02OFMAD1().trim()%>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap> 
              <div align="right"></div>
            </td>
            <td nowrap colspan="3">
              <%= dvDocDet.getE02OFMAD2().trim()%>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap > 
              <div align="right"></div>
            </td>
            <td nowrap colspan="3">
              <%= dvDocDet.getE02OFMAD3().trim()%>
            </td>
          </tr>
          <tr id="trdark"> 
            	<td nowrap> 
              		<div align="right">Impreso Por :</div>
            	</td>
            	<td nowrap > 
              		<%= dvDocDet.getE02OFMPBY().trim()%>
              	</td>
            	<td nowrap> 
              		<div align="right">Fecha Impresión :</div>
            	</td>
            	<td nowrap > 
              		<%= datapro.eibs.master.Util.formatDate( dvDocDet.getE02OFMPDD().trim(), dvDocDet.getE02OFMPDM().trim(), dvDocDet.getE02OFMPDY().trim() )%>
              		&nbsp;
              		<%= datapro.eibs.master.Util.formatCell( dvDocDet.getE02OFMPTM() ) %>
              	</td>
           </tr>
          <tr id="trclear"> 
            	<td nowrap> 
              		<div align="right">Cuenta de Pago :</div>
            	</td>	  
          	  <td nowrap colspan="3"> 
          	  <table class="tableinfo" style="filter:''">
          		<tr id="trdark"> 
            		<td width="31%"> 
              		<div align="center">Concepto</div>
            		</td>
            		<td width="5%"> 
              		<div align="center">Banco</div>
            		</td>
            		<td width="13%" > 
              		<div align="center">Sucursal</div>
            		</td>
            		<td width="12%" > 
              		<div align="center">Moneda</div>
            		</td>
            		<td width="21%" > 
              		<div align="center">Referencia</div>
            		</td>
          		</tr>
          		<tr id="trclear"> 
            		<td width="31%" > 
              		<div align="center" > 
                		<%= dvDocDet.getE02DEBOPC().trim()%> - <%= dvDocDet.getE02DEBCON().trim()%>
              		</div>
            		</td>
            		<td width="5%" > 
              		<div align="center"> 
                		<%= dvDocDet.getE02DEBBNK().trim()%>
              		</div>
            		</td>
            		<td width="13%"> 
              		<div align="center"> 
                		<%= dvDocDet.getE02DEBBRN().trim()%>
              		</div>
            		</td>
            		<td width="12%" > 
              		<div align="center">
                		<%= dvDocDet.getE02DEBCCY().trim()%>
              		</div>
            		</td>
            		<td width="21%" > 
              		<div align="center"> 
                		<%= dvDocDet.getE02DEBACC().trim()%>
              		 </div>
            		</td>
          		</tr>
        	</table>
        	</td>
           </tr>
        </table>
        
      </td>
    </tr>
  </table>
  <BR>
  <table class="tableinfo">
    <tr> 
      <td nowrap> 
        <table cellspacing=0 cellpadding=2 width="100%" border="0">
          <tr id="trdark">
          	<td nowrap > 
              <div align="right">Estado del Cheque :</div>
            </td>
            <td nowrap> 
              <%= dvDocDet.getE02OFMSTS().trim()%>
          	</td>
          	<td nowrap > 
              <div align="right">Referencia Emision :</div>
            </td>
            <td nowrap colspan> 
              <%= dvDocDet.getE02OFMACC().trim()%>
          	</td>
          </tr>
          <tr id="trdark"> 
            <td nowrap> 
              <div align="right">Emitido por :</div>
            </td>
            <td nowrap> 
              <%= dvDocDet.getE02OFMUSR().trim()%></td>
            <td nowrap> 
              <div align="right">Fecha Emisi&oacute;n :</div>
            </td>
            <td nowrap> 
              <%= Util.formatDate(dvDocDet.getE02OFMEDD(),dvDocDet.getE02OFMEDM(),dvDocDet.getE02OFMEDY())%></td>
          </tr>
          <tr id="trdark"> 
            <td nowrap> 
              <div align="right">Pagado por:</div>
            </td>
            <td nowrap> 
              <%= dvDocDet.getE02OFMUCN().trim()%></td>
            <td nowrap> 
              <div align="right">Fecha Pago :</div>
            </td>
            <td nowrap> 
              <%= Util.formatDate(dvDocDet.getE02OFMMDD(),dvDocDet.getE02OFMMDM(),dvDocDet.getE02OFMMDY())%></td>
          </tr>
          <tr id="trdark"> 
            <td nowrap> 
              <div align="right">Monto I.V.A:</div>
            </td>
            <td nowrap> 
              <%= dvDocDet.getE02OFMIVA().trim()%></td>
            <td nowrap> 
              <div align="right">Monto Comision :</div>
            </td>
            <td nowrap> 
              <%= dvDocDet.getE02OFMCOM().trim()%></td>
          </tr>
        </table>
      </td>
    </tr>
  </table>

 <p align="center">
    <input id="EIBSBTN" type="button" name="Close" OnClick="checkClose()" value="Cerrar">
</p>
  
</form>
</body>
</html>
