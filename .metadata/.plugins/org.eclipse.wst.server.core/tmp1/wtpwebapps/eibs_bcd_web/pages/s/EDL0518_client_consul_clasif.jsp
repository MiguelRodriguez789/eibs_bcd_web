<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@ page import = "datapro.eibs.master.Util" %>
<%@page import="com.datapro.constants.EibsFields"%>
<%@page import="com.datapro.eibs.constants.HelpTypes"%>

<html>
<head>
<META name="GENERATOR" content="IBM WebSphere Page Designer V4.0 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<title>Consulta Calificación de Clientes</title>
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<jsp:useBean id= "clasif" class= "datapro.eibs.beans.EDL051802Message"  scope="session" />

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />

<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />

<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>


</head>

<body bgcolor="#FFFFFF">

<% 
 if ( !error.getERRNUM().equals("0")  ) {
     error.setERRNUM("0");
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
 }
 %> 
<h3 align="center">
Consulta Calificaciones Adicionales Cliente
<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="client_consul_clasif, EDL0518" ></h3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSEDL0518">
  	<table class="tableinfo">
      <tr > 
        <td nowrap>          
         <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="trdark"> 
            
            <td nowrap> 
              <div align="right">Nro Cliente :</div>            </td>
            <td nowrap> 
              <input type="text" readonly name="E02CUSCUN" size="10" maxlength="9" value="<%= clasif.getE02CUSCUN()%>">            </td>
			<td nowrap> 
              <div align="right">Identificaci&oacute;n :</div>            </td>
            <td nowrap> 
  			  <input type="text" readonly name="E02CUSTID" size="5" maxlength="4" value="<%= clasif.getE02CUSTID()%>">
              <input type="text" readonly name="E02CUSIDN" size="26" maxlength="25" value="<%= clasif.getE02CUSIDN()%>">            </td>
			 <td nowrap> 
              <div align="right">Nombre :</div>            </td>
            <td nowrap colspan="3"> 
              <input type="text" readonly name="E02CUSNA1" size="60" maxlength="60" value="<%= clasif.getE02CUSNA1().trim()%>">            </td>
          </tr>
   
		       
         </table>
        </td>
      </tr>
    </table>
<table border="0" cellspacing="0" cellpadding="0" width="100%" style="visibility: <%= clasif.getE02PENDAP().equals("") ? "hidden" : "visible" %>">
  	<tr>
  		<td align="right" valign="top" width="85%" style="color:red;font-size:12;"><b><%=clasif.getE02PENDAP()%></b></td>
  		<td width="5%"><h4>&nbsp;</h4></td>
  	</tr>
  </table>	
	  <h4>Calificaci&oacute;n Adcional Prestamos Modificados </h4> 
	  <table class="tableinfo">
      <tr > 
        <td nowrap> 
          <table cellspacing="2" cellpadding="2" width="100%" border="0" align="left">
            <tr id="trdark"> 
                <td nowrap width="20%"><div align="center"><b>Información Básica </b></div></td>
              <td nowrap width="20%" align=center><b>Modalidad Comercial  <br>                                            
              </b></td>
				<td nowrap width="20%" align=center><b>Modalidad Consumo </b></td>  
				<td nowrap width="20%" align=center><b>Modalidad Microcredito </b></td>  
				<td nowrap width="20%" align=center><b>Modalidad Vivienda </b></td>  
            </tr>
            <tr>
              <td nowrap id="trdark" align=right><B>Calificación :</B> </td> 
              <td nowrap > 
                <div align=left><%=clasif.getE02DLCCSU()%></div>              </td>
              <td nowrap > 
              <div align=left><%=clasif.getE021LCCSU()%></div>              </td>
			    <td nowrap > 
              <div align=left><%=clasif.getE022LCCSU()%></div>              </td>
			    <td nowrap > 
              <div align=left><%=clasif.getE023LCCSU()%></div>              </td>
            </tr>
            <tr >
              <td nowrap id="trdark" align=right><B>Motivo Calificación :
              </B></td> 
              <td nowrap > 
                <div align=left><%=clasif.getE02DLLMSU()%>:<%=clasif.getD02DLLMSU()%></div>              </td>
               <td nowrap > 
                <div align=left><%=clasif.getE021LLMSU()%>:<%=clasif.getD021LLMSU()%></div>              </td>
				 <td nowrap > 
                <div align=left><%=clasif.getE022LLMSU()%>:<%=clasif.getD022LLMSU()%></div>              </td>
				 <td nowrap > 
                <div align=left><%=clasif.getE023LLMSU()%>:<%=clasif.getD023LLMSU()%></div>              </td>
            </tr>
            <tr >
              <td nowrap id="trdark" align=right><B>Fecha Inicio de Calificaci&oacute;n  : </B></td>
              <td nowrap >
				  <%= Util.formatDate(clasif.getE02DLLSID(),clasif.getE02DLLSIM(),clasif.getE02DLLSIY())%>
				  
			  </td>
              <td nowrap >
				  <%= Util.formatDate(clasif.getE021LLSID(),clasif.getE021LLSIM(),clasif.getE021LLSIY())%>
				  
			  </td>
			   <td nowrap >
				  <%= Util.formatDate(clasif.getE022LLSID(),clasif.getE022LLSIM(),clasif.getE022LLSIY())%>
				  
			  </td>
			   <td nowrap >
				  <%= Util.formatDate(clasif.getE023LLSID(),clasif.getE023LLSIM(),clasif.getE023LLSIY())%>
				  
			  </td>
            </tr>
			 <tr >
              <td nowrap id="trdark" align=right><B>Fecha Fin de Calificaci&oacute;n  : </B></td>
              <td nowrap >
				  <%= Util.formatDate(clasif.getE02DLLSFD(),clasif.getE02DLLSFM(),clasif.getE02DLLSFY())%>
				  
			   </td>
              <td nowrap >
				  <%= Util.formatDate(clasif.getE021LLSFD(),clasif.getE021LLSFM(),clasif.getE021LLSFY())%>
				  
			   </td>
			    <td nowrap >
				  <%= Util.formatDate(clasif.getE022LLSFD(),clasif.getE022LLSFM(),clasif.getE022LLSFY())%>
				  
			   </td>
			    <td nowrap >
				  <%= Util.formatDate(clasif.getE023LLSFD(),clasif.getE023LLSFM(),clasif.getE023LLSFY())%>
				  
			   </td>
            </tr>
            <tr> 
              <td nowrap id="trdark" align=right><B>Usuario Calificaci&oacute;n :
              </B></td>
              <td nowrap > 
                <div align=left><%=clasif.getE02DLLUSU()%></div>              </td>
              <td nowrap > 
                <div align=left><%=clasif.getE021LLUSU()%></div>              </td>
				<td nowrap > 
                <div align=left><%=clasif.getE022LLUSU()%></div>              </td>
				<td nowrap > 
                <div align=left><%=clasif.getE023LLUSU()%></div>              </td>
            </tr>
            
          </table>
        </td>
      </tr>
    </table>
	 <h4>Calificaci&oacute;n Papeles </h4> 
<table class="tableinfo">
      <tr > 
        <td nowrap> 
          <table cellspacing="2" cellpadding="2" width="100%" border="0" align="left">
            <tr id="trdark"> 
               <td nowrap width="20%"><div align="center"><b>Información Básica </b></div></td>
              <td nowrap width="20%" align=center><b>Modalidad Comercial  <br>                                            
              </b></td>
				<td nowrap width="20%" align=center><b>Modalidad Consumo </b></td>
				<td nowrap width="20%" align=center><b>Modalidad Microcredito </b></td>
				<td nowrap width="20%" align=center><b>Modalidad Vivienda </b></td>  
            </tr>
            <tr>
              <td nowrap id="trdark" align=right><B>Calificación  :</B> </td> 
              <td nowrap > 
                <div align=left><%=clasif.getE02DLCCPA()%></div>              </td>
              <td nowrap ><div align=left><%=clasif.getE021LCCPA()%></div></td>
              <td nowrap ><div align=left><%=clasif.getE022LCCPA()%></div></td>
              <td nowrap >  
                <div align=left><%=clasif.getE023LCCPA()%></div>				              </td>
            </tr>
            <tr >
              <td nowrap id="trdark" align=right><B>Motivo Calificación :
              </B></td> 
              <td nowrap > 
                <div align=left><%=clasif.getE02DLLMPA()%>:<%=clasif.getD02DLLMPA()%></div>              </td>
              <td nowrap ><div align=left><%=clasif.getE021LLMPA()%>:<%=clasif.getD021LLMPA()%></div></td>
              <td nowrap ><div align=left><%=clasif.getE022LLMPA()%>:<%=clasif.getD022LLMPA()%></div></td>
              <td nowrap >  
                <div align=left><%=clasif.getE023LLMPA()%>:<%=clasif.getD023LLMPA()%></div>				              </td>
            </tr>
            <tr >
              <td nowrap id="trdark" align=right><B>Fecha Inicio de Calificaci&oacute;n  : </B></td>
              <td nowrap >
			  <div align=left> <%= Util.formatDate(clasif.getE02DLLPID(),clasif.getE02DLLPIM(),clasif.getE02DLLPIY())%></div>                   </td>
              <td nowrap ><div align=left> <%= Util.formatDate(clasif.getE021LLPID(),clasif.getE021LLPIM(),clasif.getE021LLPIY())%></div></td>
              <td nowrap ><div align=left> <%= Util.formatDate(clasif.getE022LLPID(),clasif.getE022LLPIM(),clasif.getE022LLPIY())%></div></td>
              <td nowrap ><div align=left> <%= Util.formatDate(clasif.getE023LLPID(),clasif.getE023LLPIM(),clasif.getE023LLPIY())%></div></td>
            </tr>
			<tr >
              <td nowrap id="trdark" align=right><B>Fecha Fin de Calificaci&oacute;n  :</B></td>
              <td nowrap >
			  <div align=left> <%= Util.formatDate(clasif.getE02DLLPFD(),clasif.getE02DLLPFM(),clasif.getE02DLLPFY())%></div>			  </td>
              <td nowrap ><div align=left> <%= Util.formatDate(clasif.getE021LLPFD(),clasif.getE021LLPFM(),clasif.getE021LLPFY())%></div></td>
              <td nowrap ><div align=left> <%= Util.formatDate(clasif.getE022LLPFD(),clasif.getE022LLPFM(),clasif.getE022LLPFY())%></div></td>
              <td nowrap ><div align=left> <%= Util.formatDate(clasif.getE023LLPFD(),clasif.getE023LLPFM(),clasif.getE023LLPFY())%></div></td>
			</tr>
			<tr >
              <td nowrap id="trdark" align=right><B>Fecha Vencimiento Papeles :</B></td>
              <td nowrap >
			  <div align=left> <%= Util.formatDate(clasif.getE02DLLVPD(),clasif.getE02DLLVPM(),clasif.getE02DLLVPY())%></div>			  </td>
              <td nowrap ><div align=left> <%= Util.formatDate(clasif.getE021LLVPD(),clasif.getE021LLVPM(),clasif.getE021LLVPY())%></div></td>
              <td nowrap ><div align=left> <%= Util.formatDate(clasif.getE022LLVPD(),clasif.getE022LLVPM(),clasif.getE022LLVPY())%></div></td>
              <td nowrap ><div align=left> <%= Util.formatDate(clasif.getE023LLVPD(),clasif.getE023LLVPM(),clasif.getE023LLVPY())%></div></td>
			</tr>
            <tr> 
              <td nowrap id="trdark" align=right><B>Usuario Calificaci&oacute;n :
              </B></td>
              <td nowrap > 
                <div align=left><%=clasif.getE02DLLUPA()%></div>              </td>
              <td nowrap ><div align=left><%=clasif.getE021LLUPA()%></div></td>
              <td nowrap ><div align=left><%=clasif.getE022LLUPA()%></div></td>
              <td nowrap ><div align=left><%=clasif.getE023LLUPA()%></div></td>
            </tr>
          </table>
        </td>
      </tr>
  </table>
 <h4>Calificaci&oacute;n Reestructurado </h4> 
<table class="tableinfo">
      <tr > 
        <td nowrap> 
          <table cellspacing="2" cellpadding="2" width="100%" border="0" align="left">
            <tr id="trdark"> 
               <td nowrap width="20%"><div align="center"><b>Información Básica </b></div></td>
              <td nowrap width="20%" align=center><b>Modalidad Comercial  <br>                                            
              </b></td>
				<td nowrap width="20%" align=center><b>Modalidad Consumo </b></td>
				<td nowrap width="20%" align=center><b>Modalidad Microcredito </b></td>
				<td nowrap width="20%" align=center><b>Modalidad Vivienda </b></td>  
            </tr>
            <tr>
              <td nowrap id="trdark" align=right><B>Calificaci&oacute;n Mejorada(Actual) :</B></td> 
              <td nowrap > 
                <div align=left><%=clasif.getE02DLCUS1()%></div>              </td>
              <td nowrap ><div align=left><%=clasif.getE021LCUS1()%></div></td>
              <td nowrap ><div align=left><%=clasif.getE022LCUS1()%></div></td>
              <td nowrap ><div align=left><%=clasif.getE023LCUS1()%></div></td>
            </tr>
            <tr>
              <td nowrap id="trdark" align=right><B>Calificaci&oacute;n Inicial Reestructurado :</B></td> 
              <td nowrap > 
                <div align=left><%=clasif.getE02DLLREI()%></div>              </td>
              <td nowrap ><div align=left><%=clasif.getE021LLREI()%></div></td>
              <td nowrap ><div align=left><%=clasif.getE022LLREI()%></div></td>
              <td nowrap ><div align=left><%=clasif.getE023LLREI()%></div></td>
            </tr>			
            <tr >
              <td nowrap id="trdark" align=right><B>Motivo Calificación :
              </B></td> 
              <td nowrap > 
                <div align=left><%=clasif.getE02DLLMRE()%>:<%=clasif.getD02DLLMRE()%></div>              </td>
              <td nowrap ><div align=left><%=clasif.getE021LLMRE()%>:<%=clasif.getD021LLMRE()%></div></td>
              <td nowrap ><div align=left><%=clasif.getE022LLMRE()%>:<%=clasif.getD022LLMRE()%></div></td>
              <td nowrap ><div align=left><%=clasif.getE023LLMRE()%>:<%=clasif.getD023LLMRE()%></div></td>
            </tr>
            <tr >
              <td nowrap id="trdark" align=right><B>Fecha Inicio de Calificaci&oacute;n  : </B></td>
              <td nowrap >
			  <div align=left> <%= Util.formatDate(clasif.getE02DLLRID(),clasif.getE02DLLRIM(),clasif.getE02DLLRIY())%></div>                   </td>
              <td nowrap ><div align=left> <%= Util.formatDate(clasif.getE021LLRID(),clasif.getE021LLRIM(),clasif.getE021LLRIY())%></div></td>
              <td nowrap ><div align=left> <%= Util.formatDate(clasif.getE022LLRID(),clasif.getE022LLRIM(),clasif.getE022LLRIY())%></div></td>
              <td nowrap ><div align=left> <%= Util.formatDate(clasif.getE023LLRID(),clasif.getE023LLRIM(),clasif.getE023LLRIY())%></div></td>
            </tr>
			<tr >
              <td nowrap id="trdark" align=right><B>Fecha Fin de Calificaci&oacute;n  :</B></td>
              <td nowrap >
			  <div align=left> <%= Util.formatDate(clasif.getE02DLLRFD(),clasif.getE02DLLRFM(),clasif.getE02DLLRFY())%></div>			  </td>
              <td nowrap ><div align=left> <%= Util.formatDate(clasif.getE021LLRFD(),clasif.getE021LLRFM(),clasif.getE021LLRFY())%></div></td>
              <td nowrap ><div align=left> <%= Util.formatDate(clasif.getE022LLRFD(),clasif.getE022LLRFM(),clasif.getE022LLRFY())%></div></td>
              <td nowrap ><div align=left> <%= Util.formatDate(clasif.getE023LLRFD(),clasif.getE023LLRFM(),clasif.getE023LLRFY())%></div></td>
			</tr>
            <tr> 
              <td nowrap id="trdark" align=right><B>Usuario Calificaci&oacute;n :
              </B></td>
              <td nowrap > 
                <div align=left><%=clasif.getE02DLLURE()%></div>              </td>
              <td nowrap ><div align=left><%=clasif.getE021LLURE()%></div></td>
              <td nowrap ><div align=left><%=clasif.getE022LLURE()%></div></td>
              <td nowrap ><div align=left><%=clasif.getE023LLURE()%></div></td>
            </tr>
          </table>
        </td>
      </tr>
  </table>
 <h4>Calificaci&oacute;n Otorgamiento </h4> 
<table class="tableinfo">
      <tr > 
        <td nowrap> 
          <table cellspacing="2" cellpadding="2" width="100%" border="0" align="left">
            <tr id="trdark"> 
               <td nowrap width="20%"><div align="center"><b>Información Básica </b></div></td>
              <td nowrap width="20%" align=center><b>Modalidad Comercial  <br>                                            
              </b></td>
				<td nowrap width="20%" align=center><b>Modalidad Consumo </b></td>
				<td nowrap width="20%" align=center><b>Modalidad Microcredito </b></td>
				<td nowrap width="20%" align=center><b>Modalidad Vivienda </b></td>  
            </tr>
            <tr>
              <td nowrap id="trdark" align=right><B>Calificación :</B> </td> 
              <td nowrap > 
                <div align=left><%=clasif.getE02DLCUS2()%></div>              </td>
              <td nowrap ><div align=left><%=clasif.getE021LCUS2()%></div></td>
              <td nowrap ><div align=left><%=clasif.getE022LCUS2()%></div></td>
              <td nowrap ><div align=left><%=clasif.getE023LCUS2()%></div></td>
            </tr>
            <tr >
              <td nowrap id="trdark" align=right><B>Motivo Calificación :
              </B></td> 
              <td nowrap > 
                <div align=left><%=clasif.getE02DLLMOT()%>:<%=clasif.getD02DLLMOT()%></div>              </td>
              <td nowrap ><div align=left><%=clasif.getE021LLMOT()%>:<%=clasif.getD021LLMOT()%></div></td>
              <td nowrap ><div align=left><%=clasif.getE022LLMOT()%>:<%=clasif.getD022LLMOT()%></div></td>
              <td nowrap ><div align=left><%=clasif.getE023LLMOT()%>:<%=clasif.getD023LLMOT()%></div></td>
            </tr>
            <tr >
              <td nowrap id="trdark" align=right><B>Fecha Inicio de Calificaci&oacute;n  : </B></td>
              <td nowrap >
			  <div align=left> <%= Util.formatDate(clasif.getE02DLLOID(),clasif.getE02DLLOIM(),clasif.getE02DLLOIY())%></div>                   </td>
              <td nowrap ><div align=left> <%= Util.formatDate(clasif.getE021LLOID(),clasif.getE021LLOIM(),clasif.getE021LLOIY())%></div></td>
              <td nowrap ><div align=left> <%= Util.formatDate(clasif.getE022LLOID(),clasif.getE022LLOIM(),clasif.getE022LLOIY())%></div></td>
              <td nowrap ><div align=left> <%= Util.formatDate(clasif.getE023LLOID(),clasif.getE023LLOIM(),clasif.getE023LLOIY())%></div></td>
            </tr>
			<tr >
              <td nowrap id="trdark" align=right><B>Fecha Fin de Calificaci&oacute;n  :</B></td>
              <td nowrap >
			  <div align=left> <%= Util.formatDate(clasif.getE02DLLOFD(),clasif.getE02DLLOFM(),clasif.getE02DLLOFY())%></div>			  </td>
              <td nowrap ><div align=left> <%= Util.formatDate(clasif.getE021LLOFD(),clasif.getE021LLOFM(),clasif.getE021LLOFY())%></div></td>
              <td nowrap ><div align=left> <%= Util.formatDate(clasif.getE022LLOFD(),clasif.getE022LLOFM(),clasif.getE022LLOFY())%></div></td>
              <td nowrap ><div align=left> <%= Util.formatDate(clasif.getE023LLOFD(),clasif.getE023LLOFM(),clasif.getE023LLOFY())%></div></td>
			</tr>
            <tr> 
              <td nowrap id="trdark" align=right><B>Usuario Calificaci&oacute;n :
              </B></td>
              <td nowrap > 
                <div align=left><%=clasif.getE02DLLUOT()%></div>              </td>
              <td nowrap ><div align=left><%=clasif.getE021LLUOT()%></div></td>
              <td nowrap ><div align=left><%=clasif.getE022LLUOT()%></div></td>
              <td nowrap ><div align=left><%=clasif.getE023LLUOT()%></div></td>
            </tr>
          </table>
        </td>
      </tr>
  </table>
 <h4>Calificaci&oacute;n Evaluación </h4> 
<table class="tableinfo">
      <tr > 
        <td nowrap> 
          <table cellspacing="2" cellpadding="2" width="100%" border="0" align="left">
            <tr id="trdark"> 
              <td nowrap width="20%"><div align="center"><b>Información Básica </b></div></td>
              <td nowrap width="20%" align=center><b>Modalidad Comercial  <br>                                            
              </b></td>
				<td nowrap width="20%" align=center><b>Modalidad Consumo </b></td>
				<td nowrap width="20%" align=center><b>Modalidad Microcredito </b></td>
				<td nowrap width="20%" align=center><b>Modalidad Vivienda </b></td>                                          
            </tr>
            <tr>
              <td nowrap id="trdark" align=right><B>Calificación :</B> </td> 
              <td nowrap > 
                <div align=left><%=clasif.getE02DLCUS3()%></div>              </td>
              <td nowrap ><div align=left><%=clasif.getE021LCUS3()%></div></td>
              <td nowrap ><div align=left><%=clasif.getE022LCUS3()%></div></td>
              <td nowrap ><div align=left><%=clasif.getE023LCUS3()%></div></td>
            </tr>
            <tr >
              <td nowrap id="trdark" align=right><B>Motivo Calificación :
              </B></td> 
              <td nowrap > 
                <div align=left><%=clasif.getE02DLLMEV()%>:<%=clasif.getD02DLLMEV()%></div>              </td>
              <td nowrap ><div align=left><%=clasif.getE021LLMEV()%>:<%=clasif.getD021LLMEV()%></div></td>
              <td nowrap ><div align=left><%=clasif.getE022LLMEV()%>:<%=clasif.getD022LLMEV()%></div></td>
              <td nowrap ><div align=left><%=clasif.getE023LLMEV()%>:<%=clasif.getD023LLMEV()%></div></td>
            </tr>
            <tr >
              <td nowrap id="trdark" align=right><B>Fecha Inicio de Calificaci&oacute;n  : </B></td>
              <td nowrap >
			  <div align=left> <%= Util.formatDate(clasif.getE02DLLEID(),clasif.getE02DLLEIM(),clasif.getE02DLLEIY())%></div>                   </td>
              <td nowrap ><div align=left> <%= Util.formatDate(clasif.getE021LLEID(),clasif.getE021LLEIM(),clasif.getE021LLEIY())%></div></td>
              <td nowrap ><div align=left> <%= Util.formatDate(clasif.getE022LLEID(),clasif.getE022LLEIM(),clasif.getE022LLEIY())%></div></td>
              <td nowrap ><div align=left> <%= Util.formatDate(clasif.getE023LLEID(),clasif.getE023LLEIM(),clasif.getE023LLEIY())%></div></td>
            </tr>
			<tr >
              <td nowrap id="trdark" align=right><B>Fecha Fin de Calificaci&oacute;n  :</B></td>
              <td nowrap >
			  <div align=left> <%= Util.formatDate(clasif.getE02DLLEFD(),clasif.getE02DLLEFM(),clasif.getE02DLLEFY())%></div>			  </td>
              <td nowrap ><div align=left> <%= Util.formatDate(clasif.getE021LLEFD(),clasif.getE021LLEFM(),clasif.getE021LLEFY())%></div></td>
              <td nowrap ><div align=left> <%= Util.formatDate(clasif.getE022LLEFD(),clasif.getE022LLEFM(),clasif.getE022LLEFY())%></div></td>
              <td nowrap ><div align=left> <%= Util.formatDate(clasif.getE023LLEFD(),clasif.getE023LLEFM(),clasif.getE023LLEFY())%></div></td>
			</tr>
            <tr> 
              <td nowrap id="trdark" align=right><B>Usuario Calificaci&oacute;n :
              </B></td>
              <td nowrap > 
                <div align=left><%=clasif.getE02DLLUEV()%></div>              </td>
              <td nowrap ><div align=left><%=clasif.getE021LLUEV()%></div></td>
              <td nowrap ><div align=left><%=clasif.getE022LLUEV()%></div></td>
              <td nowrap ><div align=left><%=clasif.getE023LLUEV()%></div></td>
            </tr>
          </table>
        </td>
      </tr>
  </table>
 <h4>Calificaci&oacute;n Excepci&oacute;n </h4> 
 <table class="tableinfo">
      <tr > 
        <td nowrap> 
          <table cellspacing="2" cellpadding="2" width="100%" border="0" align="left">
            <tr id="trdark"> 
              <td nowrap width="20%"><div align="center"><b>Información Básica </b></div></td>
              <td nowrap width="20%" align=center><b>Modalidad Comercial  <br>                                            
              </b></td>
				<td nowrap width="20%" align=center><b>Modalidad Consumo </b></td>
				<td nowrap width="20%" align=center><b>Modalidad Microcredito </b></td>
				<td nowrap width="20%" align=center><b>Modalidad Vivienda </b></td>                                          
            </tr>
            <tr>
              <td nowrap id="trdark" align=right><B>Calificación :</B> </td> 
              <td nowrap > 
                <div align=left><%=clasif.getE02DLCXS3()%></div>              </td>
              <td nowrap ><div align=left><%=clasif.getE021LCXS3()%></div></td>
              <td nowrap ><div align=left><%=clasif.getE022LCXS3()%></div></td>
              <td nowrap ><div align=left><%=clasif.getE023LCXS3()%></div></td>
            </tr>
            <tr >
              <td nowrap id="trdark" align=right><B>Motivo Calificación :
              </B></td> 
              <td nowrap > 
                <div align=left><%=clasif.getE02DLLMXV()%>:<%=clasif.getD02DLLMXV()%></div>              </td>
              <td nowrap ><div align=left><%=clasif.getE021LLMXV()%>:<%=clasif.getD021LLMXV()%></div></td>
              <td nowrap ><div align=left><%=clasif.getE022LLMXV()%>:<%=clasif.getD022LLMXV()%></div></td>
              <td nowrap ><div align=left><%=clasif.getE023LLMXV()%>:<%=clasif.getD023LLMXV()%></div></td>
            </tr>
            <tr >
              <td nowrap id="trdark" align=right><B>Fecha Inicio de Calificaci&oacute;n  : </B></td>
              <td nowrap >
			  <div align=left> <%= Util.formatDate(clasif.getE02DLLXID(),clasif.getE02DLLXIM(),clasif.getE02DLLXIY())%></div>                   </td>
              <td nowrap ><div align=left> <%= Util.formatDate(clasif.getE021LLXID(),clasif.getE021LLXIM(),clasif.getE021LLXIY())%></div></td>
              <td nowrap ><div align=left> <%= Util.formatDate(clasif.getE022LLXID(),clasif.getE022LLXIM(),clasif.getE022LLXIY())%></div></td>
              <td nowrap ><div align=left> <%= Util.formatDate(clasif.getE023LLXID(),clasif.getE023LLXIM(),clasif.getE023LLXIY())%></div></td>
            </tr>
			<tr >
              <td nowrap id="trdark" align=right><B>Fecha Fin de Calificaci&oacute;n  :</B></td>
              <td nowrap >
			  <div align=left> <%= Util.formatDate(clasif.getE02DLLXFD(),clasif.getE02DLLXFM(),clasif.getE02DLLXFY())%></div>			  </td>
              <td nowrap ><div align=left> <%= Util.formatDate(clasif.getE021LLXFD(),clasif.getE021LLXFM(),clasif.getE021LLXFY())%></div></td>
              <td nowrap ><div align=left> <%= Util.formatDate(clasif.getE022LLXFD(),clasif.getE022LLXFM(),clasif.getE022LLXFY())%></div></td>
              <td nowrap ><div align=left> <%= Util.formatDate(clasif.getE023LLXFD(),clasif.getE023LLXFM(),clasif.getE023LLXFY())%></div></td>
			</tr>
            <tr> 
              <td nowrap id="trdark" align=right><B>Usuario Calificaci&oacute;n :
              </B></td>
              <td nowrap > 
                <div align=left><%=clasif.getE02DLLUXV()%></div>              </td>
              <td nowrap ><div align=left><%=clasif.getE021LLUXV()%></div></td>
              <td nowrap ><div align=left><%=clasif.getE022LLUXV()%></div></td>
              <td nowrap ><div align=left><%=clasif.getE023LLUXV()%></div></td>
            </tr>
          </table>
        </td>
      </tr>
  </table>  
   <h4>Calificaci&oacute;n Score </h4> 
   <table class="tableinfo">
      <tr > 
        <td nowrap> 
          <table cellspacing="2" cellpadding="2" width="100%" border="0" align="left">
            <tr id="trdark"> 
              <td nowrap width="20%"><div align="center"><b>Información Básica </b></div></td>
              <td nowrap width="20%" align=center><b>Modalidad Comercial  <br>                                            
              </b></td>
				<td nowrap width="20%" align=center><b>Modalidad Consumo </b></td>
				<td nowrap width="20%" align=center><b>Modalidad Microcredito </b></td>
				<td nowrap width="20%" align=center><b>Modalidad Vivienda </b></td>                                          
            </tr>
            <tr>
              <td nowrap id="trdark" align=right><B>Calificación :</B> </td> 
              <td nowrap > 
                          <div align=left><%=clasif.getE02DLLESC()%></div>              </td>
              <td nowrap ><div align=left><%=clasif.getE021LLESC()%></div></td>
              <td nowrap ><div align=left><%=clasif.getE022LLESC()%></div></td>
              <td nowrap ><div align=left><%=clasif.getE023LLESC()%></div></td>
            </tr>
            <tr >
              <td nowrap id="trdark" align=right><B>Motivo Calificación :
              </B></td> 
              <td nowrap > 
                          <div align=left><%=clasif.getE02DLLMCV()%>:<%=clasif.getD02DLLMCV()%></div>              </td>
              <td nowrap ><div align=left><%=clasif.getE021LLMCV()%>:<%=clasif.getD021LLMCV()%></div></td>
              <td nowrap ><div align=left><%=clasif.getE022LLMCV()%>:<%=clasif.getD022LLMCV()%></div></td>
              <td nowrap ><div align=left><%=clasif.getE023LLMCV()%>:<%=clasif.getD023LLMCV()%></div></td>
            </tr>
            <tr >
              <td nowrap id="trdark" align=right><B>Fecha Inicio de Calificaci&oacute;n  : </B></td>
              <td nowrap >
			              <div align=left> <%= Util.formatDate(clasif.getE02DLLCID(),clasif.getE02DLLCIM(),clasif.getE02DLLCIY())%></div>                   </td>
              <td nowrap ><div align=left> <%= Util.formatDate(clasif.getE021LLCID(),clasif.getE021LLCIM(),clasif.getE021LLCIY())%></div></td>
              <td nowrap ><div align=left> <%= Util.formatDate(clasif.getE022LLCID(),clasif.getE022LLCIM(),clasif.getE022LLCIY())%></div></td>
              <td nowrap ><div align=left> <%= Util.formatDate(clasif.getE023LLCID(),clasif.getE023LLCIM(),clasif.getE023LLCIY())%></div></td>
            </tr>
			<tr >
              <td nowrap id="trdark" align=right><B>Fecha Fin de Calificaci&oacute;n  :</B></td>
              <td nowrap >
			  <div align=left>             <%= Util.formatDate(clasif.getE02DLLCFD(),clasif.getE02DLLCFM(),clasif.getE02DLLCFY())%></div>			  </td>
              <td nowrap ><div align=left> <%= Util.formatDate(clasif.getE021LLCFD(),clasif.getE021LLCFM(),clasif.getE021LLCFY())%></div></td>
              <td nowrap ><div align=left> <%= Util.formatDate(clasif.getE022LLCFD(),clasif.getE022LLCFM(),clasif.getE022LLCFY())%></div></td>
              <td nowrap ><div align=left> <%= Util.formatDate(clasif.getE023LLCFD(),clasif.getE023LLCFM(),clasif.getE023LLCFY())%></div></td>
			</tr>
            <tr> 
              <td nowrap id="trdark" align=right><B>Usuario Calificaci&oacute;n :
              </B></td>
              <td nowrap > 
                          <div align=left><%=clasif.getE02DLLUCV()%></div>              </td>
              <td nowrap ><div align=left><%=clasif.getE021LLUCV()%></div></td>
              <td nowrap ><div align=left><%=clasif.getE022LLUCV()%></div></td>
              <td nowrap ><div align=left><%=clasif.getE023LLUCV()%></div></td>
            </tr>
          </table>
        </td>
      </tr>
  </table>  
</form>
</body>
</html>
