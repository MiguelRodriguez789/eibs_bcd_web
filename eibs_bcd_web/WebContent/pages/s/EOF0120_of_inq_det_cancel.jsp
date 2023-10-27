<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<%@ page import = "datapro.eibs.master.Util" %>
<%@ page import = "java.lang.Object" %>
<HTML>
<HEAD>
<TITLE>
Official Checks
</TITLE>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id="dvDocDet" class= "datapro.eibs.beans.EOF012001Message"  scope="session"/>
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session"/>
<jsp:useBean id="currUser" class="datapro.eibs.beans.ESS0030DSMessage" scope="session" />

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>


</head>

<BODY>
<% 
 if ( !error.getERRNUM().equals("0")  ) {
     error.setERRNUM("0");
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
     }

%> 
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEOF0120" >
  <input type=HIDDEN name="SCREEN" value="14">

<!--  <h3 align="center">Cheques oficiales - Cancelacion<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="of_inq_det_cancel.jsp, EOF0120"></h3> -->
  <h3 align="center">
  <% if (userPO.getOption().equals("3"))
  		 out.print("Anulacion Orden de Pago");
 	 else if (userPO.getOption().equals("4")) 	 
 	   		 out.print("Anulacion Cheques de Terceros");
  	 else out.print("Anulacion Cheques Oficiales");
  %>
  <% if (userPO.getHeader1().equals("24"))
  		 out.print(" - Impresion");
  %>
  <img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="of_inq_det_cancel.jsp, EOF0120"></h3>
  <hr size="4">
  <BR>
  <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
          <tr id="trdark"> 
            <td nowrap width="28%" > 
              <div align="right">
				  <% if (userPO.getOption().equals("3"))
				  		 out.print("Numero de Orden :");
				 	 else if (userPO.getOption().equals("4")) 	 
				 	   		 out.print("Numero Referencia :");
				  	 else out.print("Numero Cheque :");
				  %>
   			  </div>
            </td>
            <td nowrap width="20%" > 
              <div > 
                <input type="hidden" name="E01OFMCKN"  value="<%= dvDocDet.getE01OFMCKN()%>" readonly>
                <%= dvDocDet.getE01OFMCKN().trim()%></div>
            </td>
            <td nowrap width="28%" > 
              <div align="right"></div>
            </td>
            <td nowrap width="24%" > 
              <div align="right"></div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="28%"> 
              <div align="right">Banco / Sucursal :</div>
            </td>
            <td nowrap width="20%"> 
              <div >
                <input type="hidden" name="E01OFMBNK"  value="<%= dvDocDet.getE01OFMBNK()%>" readonly>
                <%= dvDocDet.getE01OFMBNK().trim()%> /
                <input type="hidden" name="E01OFMBRN"  value="<%= dvDocDet.getE01OFMBRN()%>" readonly>
                <%= dvDocDet.getE01OFMBRN().trim()%></div>
            </td>
            <td nowrap width="28%"> 
              <div align="right">Cuenta Contable :</div>
            </td>
            <td nowrap width="24%" > 
              <div >
                <input type="hidden" name="E01DEBGLN"  value="<%= dvDocDet.getE01DEBGLN()%>" readonly>
                <%= dvDocDet.getE01DEBGLN().trim()%></div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="28%"> 
              <div align="right">Moneda :</div>
            </td>
            <td nowrap width="20%"> 
              <div >
                <input type="hidden" name="E01OFMCCY"  value="<%= dvDocDet.getE01OFMCCY()%>" readonly>
                <%= dvDocDet.getE01OFMCCY().trim()%></div>
            </td>
            <td nowrap width="28%"> 
              <div align="right">Monto :</div>
            </td>
            <td nowrap width="24%" > 
              <div >
                <input type="hidden" name="E01OFMAMT" value="<%= dvDocDet.getE01OFMAMT()%>" readonly>
                <%= Util.fcolorCCY(dvDocDet.getE01OFMAMT().trim())%></div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <BR>
  <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
          <tr id="trdark"> 
            <td nowrap width="28%"> 
              <div align="right">Aplicante :</div>
            </td>
            <td nowrap width="20%"> 
              <div>
                <input type="hidden" name="E01OFMAPL"  value="<%= dvDocDet.getE01OFMAPL()%>" readonly>
                <%= dvDocDet.getE01OFMAPL().trim()%></div>
            </td>
            <td nowrap width="26%"> 
              <div align="right">Beneficiario :</div>
            </td>
            <td nowrap width="26%" > 
              <div >
                <input type="hidden" name="E01OFMBNF"  value="<%= dvDocDet.getE01OFMAPL()%>" readonly>
                <%= dvDocDet.getE01OFMBNF().trim()%></div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="28%" > 
              <div align="right">Detalle Pago :</div>
            </td>
            <td nowrap width="20%" > 
              <div ><%= dvDocDet.getE01OFMCO1().trim()%></div>
            </td>
            <td nowrap width="26%" > 
              <div align="right">Sucursal de Pago :</div>
            </td>
            <td nowrap width="26%" > 
              <div ><%= dvDocDet.getE01DEBBRN().trim()%></div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="20%">
              <div align="right"><%= dvDocDet.getE01OFMAP2().trim()%></div>
            </td>
            <td nowrap width="26%"> 
              <div align="right"></div>
            </td>
            <td nowrap width="26%">
              <div align="right"></div>
            </td>
            <td nowrap width="26%">
              <div align="right"></div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="28%"> 
              <div align="right">Emitido Por :</div>
            </td>
            <td nowrap width="20%"> 
              <div ><%= dvDocDet.getE01OFMUSR().trim()%></div>
            </td>
            <td nowrap width="26%"> 
              <div align="right">Fecha Emision :</div>
            </td>
            <td nowrap width="26%"> 
              <div > <%= Util.formatCustomDate(currUser.getE01DTF(), dvDocDet.getE01OFMEMM(),dvDocDet.getE01OFMEMD(),dvDocDet.getE01OFMEMY())%> </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <p align="center"> 
    <input id="EIBSBTN" type=submit name="Submit" value="Enviar">
  </p>

  </FORM>

</BODY>
</HTML>
