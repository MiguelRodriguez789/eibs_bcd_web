<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<%@ page  import = "datapro.eibs.master.Util" %>
<html>
<head>
<title>Consulta de Tasas de Interes por Plazo vs Monto</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>


</head>

<jsp:useBean id="cdRenRat" class="datapro.eibs.beans.ECN0030DSMessage"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session"/>
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />

<body>
<% 
 if ( !error.getERRNUM().equals("0")  ) {
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors();");
     error.setERRNUM("0");
     out.println("  	 top.close();");
     out.println("</SCRIPT>");
     }
%> 
<h3 align="center">Consulta de Tasas de Interes por Plazo vs Monto  (En Cientos)<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="rate_table.jsp, ECN0030"></h3>
<hr size="4">

<form>

  <h4>Informacion General</h4>
  <table class="tableinfo">
    <tr > 
      <td > 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="trdark"> 
            <td width="24%"> 
              <div align="right"><b>Fecha de Proceso :</b></div>
            </td>
            <td width="15%"> 
            	<%= Util.formatCustomDate(currUser.getE01DTF(), cdRenRat.getE02CDRDTM(), cdRenRat.getE02CDRDTD(), cdRenRat.getE02CDRDTY()) %>
			</td>
            <td width="28%"> 
              <div align="right"><b>Moneda :</b></div>
            </td>
            <td width="15%"> <%= cdRenRat.getE02CDRCCY().trim()%></td>
          </tr>
          <tr id="trclear"> 
            <td width="24%"> 
              <div align="right"><b>Tasa Minima :</b></div>
            </td>
            <td width="33%"> <%= cdRenRat.getE02CDRMIR().trim()%> </td>
            <td width="28%"> 
              <div align="right"><b>Dias de Penalidad :</b></div>
            </td>
            <td width="33%"> <%= cdRenRat.getE02CDRDPE().trim()%> </td>
          </tr>
          <tr id="trdark"> 
            <td width="24%"> 
              <div align="right"><b>Tasa Maxima :</b></div>
            </td>
            <td width="15%"> <%= cdRenRat.getE02CDRMXR().trim()%> </td>
            <td width="28%"> 
              <div align="right"><b>Tasa de Penalidad :</b></div>
            </td>
            <td width="33%"> <%= cdRenRat.getE02CDRPRT().trim()%> </td>
          </tr>
          <tr id="trclear">
            <td width="28%"> 
              <div align="right"><b>Tabla Tasa Flotante:</b></div>
            </td>
            <td width="33%"><%= cdRenRat.getE02CDRFTB().trim()%> / <%= cdRenRat.getE02CDRFTY().trim()%> </td>
            <td width="28%">
              <div align="right"><b>Periodo Base :</b></div>
			</td>
            <td width="33%"> <%= cdRenRat.getE02CDRBAS().trim()%> </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>

  <h4>Terminos y Tasas</h4>
  <table class="tableinfo">
    <tr > 
      <td > 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="trclear"> 
            <td width="13%" height="22"> 
              <div align="center"></div>
            </td>
            <td width="13%" height="22"> 
              <div align="center"><b>Hasta :</b></div>
            </td>
            <td width="13%" height="22"> 
              <div align="center"><b>Hasta :</b></div>
            </td>
            <td width="13%" height="22"> 
              <div align="center"><b>Hasta :</b></div>
            </td>
            <td width="13%" height="22"> 
              <div align="center"><b>Hasta :</b></div>
            </td>
            <td width="13%" height="22"> 
              <div align="center"><b>Hasta :</b></div>
            </td>
            <td width="13%" height="22"> 
              <div align="center"><b>Hasta :</b></div>
            </td>
            <td width="13%" height="22"> 
              <div align="center"><b>Hasta :</b></div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td width="13%"> 
              <div align="center"><b>Terminos</b></div>
            </td>
            <td width="13%"> 
              <div align="center" <% if (cdRenRat.getE02CDBRTN().equals("1")) out.print("id=\"txtbase\""); %>> <%= Util.fcolorCCY(cdRenRat.getE02CDUA1().trim())%> </div>
            </td>
            <td width="13%"> 
              <div align="center" <% if (cdRenRat.getE02CDBRTN().equals("2")) out.print("id=\"txtbase\""); %>> <%= Util.fcolorCCY(cdRenRat.getE02CDUA2().trim())%> </div>
            </td>
            <td width="13%"> 
              <div align="center" <% if (cdRenRat.getE02CDBRTN().equals("3")) out.print("id=\"txtbase\""); %>> <%= Util.fcolorCCY(cdRenRat.getE02CDUA3().trim())%> </div>
            </td>
            <td width="13%"> 
              <div align="center" <% if (cdRenRat.getE02CDBRTN().equals("4")) out.print("id=\"txtbase\""); %>> <%= Util.fcolorCCY(cdRenRat.getE02CDUA4().trim())%> </div>
            </td>
            <td width="13%"> 
              <div align="center" <% if (cdRenRat.getE02CDBRTN().equals("5")) out.print("id=\"txtbase\""); %>> <%= Util.fcolorCCY(cdRenRat.getE02CDUA5().trim())%> </div>
            </td>
            <td width="13%"> 
              <div align="center" <% if (cdRenRat.getE02CDBRTN().equals("6")) out.print("id=\"txtbase\""); %>> <%= Util.fcolorCCY(cdRenRat.getE02CDUA6().trim())%> </div>
            </td>
            <td width="13%"> 
              <div align="center" <% if (cdRenRat.getE02CDBRTN().equals("7")) out.print("id=\"txtbase\""); %>> <%= Util.fcolorCCY(cdRenRat.getE02CDUA7().trim())%> </div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td width="13%"> 
              <div align="center"> <%= cdRenRat.getE02CDD01().trim()%> </div>
            </td>
            <td width="13%"> 
              <div align="center" <% if (cdRenRat.getE02CDBRTN().equals("1")) out.print("id=\"txtbase\""); %>> <%= cdRenRat.getE02CL101().trim()%> </div>
            </td>
            <td width="13%"> 
              <div align="center" <% if (cdRenRat.getE02CDBRTN().equals("2")) out.print("id=\"txtbase\""); %>> <%= cdRenRat.getE02CL201().trim()%> </div>
            </td>
            <td width="13%"> 
              <div align="center" <% if (cdRenRat.getE02CDBRTN().equals("3")) out.print("id=\"txtbase\""); %>> <%= cdRenRat.getE02CL301().trim()%> </div>
            </td>
            <td width="13%"> 
              <div align="center" <% if (cdRenRat.getE02CDBRTN().equals("4")) out.print("id=\"txtbase\""); %>> <%= cdRenRat.getE02CL401().trim()%> </div>
            </td>
            <td width="13%"> 
              <div align="center" <% if (cdRenRat.getE02CDBRTN().equals("5")) out.print("id=\"txtbase\""); %>> <%= cdRenRat.getE02CL501().trim()%> </div>
            </td>
            <td width="13%"> 
              <div align="center" <% if (cdRenRat.getE02CDBRTN().equals("6")) out.print("id=\"txtbase\""); %>> <%= cdRenRat.getE02CL601().trim()%> </div>
            </td>
            <td width="13%"> 
              <div align="center" <% if (cdRenRat.getE02CDBRTN().equals("7")) out.print("id=\"txtbase\""); %>> <%= cdRenRat.getE02CL701().trim()%> </div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td width="13%"> 
              <div align="center"> <%= cdRenRat.getE02CDD02().trim()%> </div>
            </td>
            <td width="13%"> 
              <div align="center" <% if (cdRenRat.getE02CDBRTN().equals("1")) out.print("id=\"txtbase\""); %>> <%= cdRenRat.getE02CL102().trim()%> </div>
            </td>
            <td width="13%"> 
              <div align="center" <% if (cdRenRat.getE02CDBRTN().equals("2")) out.print("id=\"txtbase\""); %>> <%= cdRenRat.getE02CL202().trim()%> </div>
            </td>
            <td width="13%"> 
              <div align="center" <% if (cdRenRat.getE02CDBRTN().equals("3")) out.print("id=\"txtbase\""); %>> <%= cdRenRat.getE02CL302().trim()%> </div>
            </td>
            <td width="13%"> 
              <div align="center" <% if (cdRenRat.getE02CDBRTN().equals("4")) out.print("id=\"txtbase\""); %>> <%= cdRenRat.getE02CL402().trim()%> </div>
            </td>
            <td width="13%"> 
              <div align="center" <% if (cdRenRat.getE02CDBRTN().equals("5")) out.print("id=\"txtbase\""); %>> <%= cdRenRat.getE02CL502().trim()%> </div>
            </td>
            <td width="13%"> 
              <div align="center" <% if (cdRenRat.getE02CDBRTN().equals("6")) out.print("id=\"txtbase\""); %>> <%= cdRenRat.getE02CL602().trim()%> </div>
            </td>
            <td width="13%"> 
              <div align="center" <% if (cdRenRat.getE02CDBRTN().equals("7")) out.print("id=\"txtbase\""); %>> <%= cdRenRat.getE02CL702().trim()%> </div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td width="13%"> 
              <div align="center"> <%= cdRenRat.getE02CDD03().trim()%> </div>
            </td>
            <td width="13%"> 
              <div align="center" <% if (cdRenRat.getE02CDBRTN().equals("1")) out.print("id=\"txtbase\""); %>> <%= cdRenRat.getE02CL103().trim()%> </div>
            </td>
            <td width="13%"> 
              <div align="center" <% if (cdRenRat.getE02CDBRTN().equals("2")) out.print("id=\"txtbase\""); %>> <%= cdRenRat.getE02CL203().trim()%> </div>
            </td>
            <td width="13%"> 
              <div align="center" <% if (cdRenRat.getE02CDBRTN().equals("3")) out.print("id=\"txtbase\""); %>> <%= cdRenRat.getE02CL303().trim()%> </div>
            </td>
            <td width="13%"> 
              <div align="center" <% if (cdRenRat.getE02CDBRTN().equals("4")) out.print("id=\"txtbase\""); %>> <%= cdRenRat.getE02CL403().trim()%> </div>
            </td>
            <td width="13%"> 
              <div align="center" <% if (cdRenRat.getE02CDBRTN().equals("5")) out.print("id=\"txtbase\""); %>> <%= cdRenRat.getE02CL503().trim()%> </div>
            </td>
            <td width="13%"> 
              <div align="center" <% if (cdRenRat.getE02CDBRTN().equals("6")) out.print("id=\"txtbase\""); %>> <%= cdRenRat.getE02CL603().trim()%> </div>
            </td>
            <td width="13%"> 
              <div align="center" <% if (cdRenRat.getE02CDBRTN().equals("7")) out.print("id=\"txtbase\""); %>> <%= cdRenRat.getE02CL703().trim()%> </div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td width="13%"> 
              <div align="center"> <%= cdRenRat.getE02CDD04().trim()%> </div>
            </td>
            <td width="13%"> 
              <div align="center" <% if (cdRenRat.getE02CDBRTN().equals("1")) out.print("id=\"txtbase\""); %>> <%= cdRenRat.getE02CL104().trim()%> </div>
            </td>
            <td width="13%"> 
              <div align="center" <% if (cdRenRat.getE02CDBRTN().equals("2")) out.print("id=\"txtbase\""); %>> <%= cdRenRat.getE02CL204().trim()%> </div>
            </td>
            <td width="13%"> 
              <div align="center" <% if (cdRenRat.getE02CDBRTN().equals("3")) out.print("id=\"txtbase\""); %>> <%= cdRenRat.getE02CL304().trim()%> </div>
            </td>
            <td width="13%"> 
              <div align="center" <% if (cdRenRat.getE02CDBRTN().equals("4")) out.print("id=\"txtbase\""); %>> <%= cdRenRat.getE02CL404().trim()%> </div>
            </td>
            <td width="13%"> 
              <div align="center" <% if (cdRenRat.getE02CDBRTN().equals("5")) out.print("id=\"txtbase\""); %>> <%= cdRenRat.getE02CL504().trim()%> </div>
            </td>
            <td width="13%"> 
              <div align="center" <% if (cdRenRat.getE02CDBRTN().equals("6")) out.print("id=\"txtbase\""); %>> <%= cdRenRat.getE02CL604().trim()%> </div>
            </td>
            <td width="13%"> 
              <div align="center" <% if (cdRenRat.getE02CDBRTN().equals("7")) out.print("id=\"txtbase\""); %>> <%= cdRenRat.getE02CL704().trim()%> </div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td width="13%"> 
              <div align="center"> <%= cdRenRat.getE02CDD05().trim()%> </div>
            </td>
            <td width="13%"> 
              <div align="center" <% if (cdRenRat.getE02CDBRTN().equals("1")) out.print("id=\"txtbase\""); %>> <%= cdRenRat.getE02CL105().trim()%> </div>
            </td>
            <td width="13%"> 
              <div align="center" <% if (cdRenRat.getE02CDBRTN().equals("2")) out.print("id=\"txtbase\""); %>> <%= cdRenRat.getE02CL205().trim()%> </div>
            </td>
            <td width="13%"> 
              <div align="center" <% if (cdRenRat.getE02CDBRTN().equals("3")) out.print("id=\"txtbase\""); %>> <%= cdRenRat.getE02CL305().trim()%> </div>
            </td>
            <td width="13%"> 
              <div align="center" <% if (cdRenRat.getE02CDBRTN().equals("4")) out.print("id=\"txtbase\""); %>> <%= cdRenRat.getE02CL405().trim()%> </div>
            </td>
            <td width="13%"> 
              <div align="center" <% if (cdRenRat.getE02CDBRTN().equals("5")) out.print("id=\"txtbase\""); %>> <%= cdRenRat.getE02CL505().trim()%> </div>
            </td>
            <td width="13%"> 
              <div align="center" <% if (cdRenRat.getE02CDBRTN().equals("6")) out.print("id=\"txtbase\""); %>> <%= cdRenRat.getE02CL605().trim()%> </div>
            </td>
            <td width="13%"> 
              <div align="center" <% if (cdRenRat.getE02CDBRTN().equals("7")) out.print("id=\"txtbase\""); %>> <%= cdRenRat.getE02CL705().trim()%> </div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td width="13%"> 
              <div align="center"> <%= cdRenRat.getE02CDD06().trim()%> </div>
            </td>
            <td width="13%"> 
              <div align="center" <% if (cdRenRat.getE02CDBRTN().equals("1")) out.print("id=\"txtbase\""); %>> <%= cdRenRat.getE02CL106().trim()%> </div>
            </td>
            <td width="13%"> 
              <div align="center" <% if (cdRenRat.getE02CDBRTN().equals("2")) out.print("id=\"txtbase\""); %>> <%= cdRenRat.getE02CL206().trim()%> </div>
            </td>
            <td width="13%"> 
              <div align="center" <% if (cdRenRat.getE02CDBRTN().equals("3")) out.print("id=\"txtbase\""); %>> <%= cdRenRat.getE02CL306().trim()%> </div>
            </td>
            <td width="13%"> 
              <div align="center" <% if (cdRenRat.getE02CDBRTN().equals("4")) out.print("id=\"txtbase\""); %>> <%= cdRenRat.getE02CL406().trim()%> </div>
            </td>
            <td width="13%"> 
              <div align="center" <% if (cdRenRat.getE02CDBRTN().equals("5")) out.print("id=\"txtbase\""); %>> <%= cdRenRat.getE02CL506().trim()%> </div>
            </td>
            <td width="13%"> 
              <div align="center" <% if (cdRenRat.getE02CDBRTN().equals("6")) out.print("id=\"txtbase\""); %>> <%= cdRenRat.getE02CL606().trim()%> </div>
            </td>
            <td width="13%"> 
              <div align="center" <% if (cdRenRat.getE02CDBRTN().equals("7")) out.print("id=\"txtbase\""); %>> <%= cdRenRat.getE02CL706().trim()%> </div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td width="13%"> 
              <div align="center" > <%= cdRenRat.getE02CDD07().trim()%> </div>
            </td>
            <td width="13%"> 
              <div align="center" <% if (cdRenRat.getE02CDBRTN().equals("1")) out.print("id=\"txtbase\""); %>> <%= cdRenRat.getE02CL107().trim()%> </div>
            </td>
            <td width="13%"> 
              <div align="center" <% if (cdRenRat.getE02CDBRTN().equals("2")) out.print("id=\"txtbase\""); %>> <%= cdRenRat.getE02CL207().trim()%> </div>
            </td>
            <td width="13%"> 
              <div align="center" <% if (cdRenRat.getE02CDBRTN().equals("3")) out.print("id=\"txtbase\""); %>> <%= cdRenRat.getE02CL307().trim()%> </div>
            </td>
            <td width="13%"> 
              <div align="center" <% if (cdRenRat.getE02CDBRTN().equals("4")) out.print("id=\"txtbase\""); %>> <%= cdRenRat.getE02CL407().trim()%> </div>
            </td>
            <td width="13%"> 
              <div align="center" <% if (cdRenRat.getE02CDBRTN().equals("5")) out.print("id=\"txtbase\""); %>> <%= cdRenRat.getE02CL507().trim()%> </div>
            </td>
            <td width="13%"> 
              <div align="center" <% if (cdRenRat.getE02CDBRTN().equals("6")) out.print("id=\"txtbase\""); %>> <%= cdRenRat.getE02CL607().trim()%> </div>
            </td>
            <td width="13%"> 
              <div align="center" <% if (cdRenRat.getE02CDBRTN().equals("7")) out.print("id=\"txtbase\""); %>> <%= cdRenRat.getE02CL707().trim()%> </div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td width="13%"> 
              <div align="center"> <%= cdRenRat.getE02CDD08().trim()%> </div>
            </td>
            <td width="13%"> 
              <div align="center" <% if (cdRenRat.getE02CDBRTN().equals("1")) out.print("id=\"txtbase\""); %>> <%= cdRenRat.getE02CL108().trim()%> </div>
            </td>
            <td width="13%"> 
              <div align="center" <% if (cdRenRat.getE02CDBRTN().equals("2")) out.print("id=\"txtbase\""); %>> <%= cdRenRat.getE02CL208().trim()%> </div>
            </td>
            <td width="13%"> 
              <div align="center" <% if (cdRenRat.getE02CDBRTN().equals("3")) out.print("id=\"txtbase\""); %>> <%= cdRenRat.getE02CL308().trim()%> </div>
            </td>
            <td width="13%"> 
              <div align="center" <% if (cdRenRat.getE02CDBRTN().equals("4")) out.print("id=\"txtbase\""); %>> <%= cdRenRat.getE02CL408().trim()%> </div>
            </td>
            <td width="13%"> 
              <div align="center" <% if (cdRenRat.getE02CDBRTN().equals("5")) out.print("id=\"txtbase\""); %>> <%= cdRenRat.getE02CL508().trim()%> </div>
            </td>
            <td width="13%"> 
              <div align="center" <% if (cdRenRat.getE02CDBRTN().equals("6")) out.print("id=\"txtbase\""); %>> <%= cdRenRat.getE02CL608().trim()%> </div>
            </td>
            <td width="13%"> 
              <div align="center" <% if (cdRenRat.getE02CDBRTN().equals("7")) out.print("id=\"txtbase\""); %>> <%= cdRenRat.getE02CL708().trim()%> </div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td width="13%"> 
              <div align="center"> <%= cdRenRat.getE02CDD09().trim()%> </div>
            </td>
            <td width="13%"> 
              <div align="center" <% if (cdRenRat.getE02CDBRTN().equals("1")) out.print("id=\"txtbase\""); %>> <%= cdRenRat.getE02CL109().trim()%> </div>
            </td>
            <td width="13%"> 
              <div align="center" <% if (cdRenRat.getE02CDBRTN().equals("2")) out.print("id=\"txtbase\""); %>> <%= cdRenRat.getE02CL209().trim()%> </div>
            </td>
            <td width="13%"> 
              <div align="center" <% if (cdRenRat.getE02CDBRTN().equals("3")) out.print("id=\"txtbase\""); %>> <%= cdRenRat.getE02CL309().trim()%> </div>
            </td>
            <td width="13%"> 
              <div align="center" <% if (cdRenRat.getE02CDBRTN().equals("4")) out.print("id=\"txtbase\""); %>> <%= cdRenRat.getE02CL409().trim()%> </div>
            </td>
            <td width="13%"> 
              <div align="center" <% if (cdRenRat.getE02CDBRTN().equals("5")) out.print("id=\"txtbase\""); %>> <%= cdRenRat.getE02CL509().trim()%> </div>
            </td>
            <td width="13%"> 
              <div align="center" <% if (cdRenRat.getE02CDBRTN().equals("6")) out.print("id=\"txtbase\""); %>> <%= cdRenRat.getE02CL609().trim()%> </div>
            </td>
            <td width="13%"> 
              <div align="center" <% if (cdRenRat.getE02CDBRTN().equals("7")) out.print("id=\"txtbase\""); %>> <%= cdRenRat.getE02CL709().trim()%> </div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td width="13%"> 
              <div align="center"> <%= cdRenRat.getE02CDD10().trim()%> </div>
            </td>
            <td width="13%"> 
              <div align="center" <% if (cdRenRat.getE02CDBRTN().equals("1")) out.print("id=\"txtbase\""); %>> <%= cdRenRat.getE02CL110().trim()%> </div>
            </td>
            <td width="13%"> 
              <div align="center" <% if (cdRenRat.getE02CDBRTN().equals("2")) out.print("id=\"txtbase\""); %>> <%= cdRenRat.getE02CL210().trim()%> </div>
            </td>
            <td width="13%"> 
              <div align="center" <% if (cdRenRat.getE02CDBRTN().equals("3")) out.print("id=\"txtbase\""); %>> <%= cdRenRat.getE02CL310().trim()%> </div>
            </td>
            <td width="13%"> 
              <div align="center" <% if (cdRenRat.getE02CDBRTN().equals("4")) out.print("id=\"txtbase\""); %>> <%= cdRenRat.getE02CL410().trim()%> </div>
            </td>
            <td width="13%"> 
              <div align="center" <% if (cdRenRat.getE02CDBRTN().equals("5")) out.print("id=\"txtbase\""); %>> <%= cdRenRat.getE02CL510().trim()%> </div>
            </td>
            <td width="13%"> 
              <div align="center" <% if (cdRenRat.getE02CDBRTN().equals("6")) out.print("id=\"txtbase\""); %>> <%= cdRenRat.getE02CL610().trim()%> </div>
            </td>
            <td width="13%"> 
              <div align="center" <% if (cdRenRat.getE02CDBRTN().equals("7")) out.print("id=\"txtbase\""); %>> <%= cdRenRat.getE02CL710().trim()%> </div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td width="13%"> 
              <div align="center"> <%= cdRenRat.getE02CDD11().trim()%> </div>
            </td>
            <td width="13%"> 
              <div align="center" <% if (cdRenRat.getE02CDBRTN().equals("1")) out.print("id=\"txtbase\""); %>> <%= cdRenRat.getE02CL111().trim()%> </div>
            </td>
            <td width="13%"> 
              <div align="center" <% if (cdRenRat.getE02CDBRTN().equals("2")) out.print("id=\"txtbase\""); %>> <%= cdRenRat.getE02CL211().trim()%> </div>
            </td>
            <td width="13%"> 
              <div align="center" <% if (cdRenRat.getE02CDBRTN().equals("3")) out.print("id=\"txtbase\""); %>> <%= cdRenRat.getE02CL311().trim()%> </div>
            </td>
            <td width="13%"> 
              <div align="center" <% if (cdRenRat.getE02CDBRTN().equals("4")) out.print("id=\"txtbase\""); %>> <%= cdRenRat.getE02CL411().trim()%> </div>
            </td>
            <td width="13%"> 
              <div align="center" <% if (cdRenRat.getE02CDBRTN().equals("5")) out.print("id=\"txtbase\""); %>> <%= cdRenRat.getE02CL511().trim()%> </div>
            </td>
            <td width="13%"> 
              <div align="center" <% if (cdRenRat.getE02CDBRTN().equals("6")) out.print("id=\"txtbase\""); %>> <%= cdRenRat.getE02CL611().trim()%> </div>
            </td>
            <td width="13%"> 
              <div align="center" <% if (cdRenRat.getE02CDBRTN().equals("7")) out.print("id=\"txtbase\""); %>> <%= cdRenRat.getE02CL711().trim()%> </div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td width="13%" height="22"> 
              <div align="center"> <%= cdRenRat.getE02CDD12().trim()%> </div>
            </td>
            <td width="13%" height="22"> 
              <div align="center" <% if (cdRenRat.getE02CDBRTN().equals("1")) out.print("id=\"txtbase\""); %>> <%= cdRenRat.getE02CL112().trim()%> </div>
            </td>
            <td width="13%" height="22"> 
              <div align="center" <% if (cdRenRat.getE02CDBRTN().equals("2")) out.print("id=\"txtbase\""); %>> <%= cdRenRat.getE02CL212().trim()%> </div>
            </td>
            <td width="13%" height="22"> 
              <div align="center" <% if (cdRenRat.getE02CDBRTN().equals("3")) out.print("id=\"txtbase\""); %>> <%= cdRenRat.getE02CL312().trim()%> </div>
            </td>
            <td width="13%" height="22"> 
              <div align="center" <% if (cdRenRat.getE02CDBRTN().equals("4")) out.print("id=\"txtbase\""); %>> <%= cdRenRat.getE02CL412().trim()%> </div>
            </td>
            <td width="13%" height="22"> 
              <div align="center" <% if (cdRenRat.getE02CDBRTN().equals("5")) out.print("id=\"txtbase\""); %>> <%= cdRenRat.getE02CL512().trim()%> </div>
            </td>
            <td width="13%" height="22"> 
              <div align="center" <% if (cdRenRat.getE02CDBRTN().equals("6")) out.print("id=\"txtbase\""); %>> <%= cdRenRat.getE02CL612().trim()%> </div>
            </td>
            <td width="13%" height="22"> 
              <div align="center" <% if (cdRenRat.getE02CDBRTN().equals("7")) out.print("id=\"txtbase\""); %>> <%= cdRenRat.getE02CL712().trim()%> </div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td width="13%"> 
              <div align="center"> <%= cdRenRat.getE02CDD13().trim()%> </div>
            </td>
            <td width="13%"> 
              <div align="center" <% if (cdRenRat.getE02CDBRTN().equals("1")) out.print("id=\"txtbase\""); %>> <%= cdRenRat.getE02CL113().trim()%> </div>
            </td>
            <td width="13%"> 
              <div align="center" <% if (cdRenRat.getE02CDBRTN().equals("2")) out.print("id=\"txtbase\""); %>> <%= cdRenRat.getE02CL213().trim()%> </div>
            </td>
            <td width="13%"> 
              <div align="center" <% if (cdRenRat.getE02CDBRTN().equals("3")) out.print("id=\"txtbase\""); %>> <%= cdRenRat.getE02CL313().trim()%> </div>
            </td>
            <td width="13%"> 
              <div align="center" <% if (cdRenRat.getE02CDBRTN().equals("4")) out.print("id=\"txtbase\""); %>> <%= cdRenRat.getE02CL413().trim()%> </div>
            </td>
            <td width="13%"> 
              <div align="center" <% if (cdRenRat.getE02CDBRTN().equals("5")) out.print("id=\"txtbase\""); %>> <%= cdRenRat.getE02CL513().trim()%> </div>
            </td>
            <td width="13%"> 
              <div align="center" <% if (cdRenRat.getE02CDBRTN().equals("6")) out.print("id=\"txtbase\""); %>> <%= cdRenRat.getE02CL613().trim()%> </div>
            </td>
            <td width="13%"> 
              <div align="center" <% if (cdRenRat.getE02CDBRTN().equals("7")) out.print("id=\"txtbase\""); %>> <%= cdRenRat.getE02CL713().trim()%> </div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td width="13%"> 
              <div align="center"> <%= cdRenRat.getE02CDD14().trim()%> </div>
            </td>
            <td width="13%"> 
              <div align="center" <% if (cdRenRat.getE02CDBRTN().equals("1")) out.print("id=\"txtbase\""); %>> <%= cdRenRat.getE02CL114().trim()%> </div>
            </td>
            <td width="13%"> 
              <div align="center" <% if (cdRenRat.getE02CDBRTN().equals("2")) out.print("id=\"txtbase\""); %>> <%= cdRenRat.getE02CL214().trim()%> </div>
            </td>
            <td width="13%"> 
              <div align="center" <% if (cdRenRat.getE02CDBRTN().equals("3")) out.print("id=\"txtbase\""); %>> <%= cdRenRat.getE02CL314().trim()%> </div>
            </td>
            <td width="13%"> 
              <div align="center" <% if (cdRenRat.getE02CDBRTN().equals("4")) out.print("id=\"txtbase\""); %>> <%= cdRenRat.getE02CL414().trim()%> </div>
            </td>
            <td width="13%"> 
              <div align="center" <% if (cdRenRat.getE02CDBRTN().equals("5")) out.print("id=\"txtbase\""); %>> <%= cdRenRat.getE02CL514().trim()%> </div>
            </td>
            <td width="13%"> 
              <div align="center" <% if (cdRenRat.getE02CDBRTN().equals("6")) out.print("id=\"txtbase\""); %>> <%= cdRenRat.getE02CL614().trim()%> </div>
            </td>
            <td width="13%"> 
              <div align="center" <% if (cdRenRat.getE02CDBRTN().equals("7")) out.print("id=\"txtbase\""); %>> <%= cdRenRat.getE02CL714().trim()%> </div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td width="13%"> 
              <div align="center"> <%= cdRenRat.getE02CDD15().trim()%> </div>
            </td>
            <td width="13%"> 
              <div align="center" <% if (cdRenRat.getE02CDBRTN().equals("1")) out.print("id=\"txtbase\""); %>> <%= cdRenRat.getE02CL115().trim()%> </div>
            </td>
            <td width="13%"> 
              <div align="center" <% if (cdRenRat.getE02CDBRTN().equals("2")) out.print("id=\"txtbase\""); %>> <%= cdRenRat.getE02CL215().trim()%> </div>
            </td>
            <td width="13%"> 
              <div align="center" <% if (cdRenRat.getE02CDBRTN().equals("3")) out.print("id=\"txtbase\""); %>> <%= cdRenRat.getE02CL315().trim()%> </div>
            </td>
            <td width="13%"> 
              <div align="center" <% if (cdRenRat.getE02CDBRTN().equals("4")) out.print("id=\"txtbase\""); %>> <%= cdRenRat.getE02CL415().trim()%> </div>
            </td>
            <td width="13%"> 
              <div align="center" <% if (cdRenRat.getE02CDBRTN().equals("5")) out.print("id=\"txtbase\""); %>> <%= cdRenRat.getE02CL515().trim()%> </div>
            </td>
            <td width="13%"> 
              <div align="center" <% if (cdRenRat.getE02CDBRTN().equals("6")) out.print("id=\"txtbase\""); %>> <%= cdRenRat.getE02CL615().trim()%> </div>
            </td>
            <td width="13%"> 
              <div align="center" <% if (cdRenRat.getE02CDBRTN().equals("7")) out.print("id=\"txtbase\""); %>> <%= cdRenRat.getE02CL715().trim()%> </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  </form>
</body>
</html>
