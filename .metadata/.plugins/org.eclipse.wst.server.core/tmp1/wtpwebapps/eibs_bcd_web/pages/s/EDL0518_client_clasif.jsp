<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@ page import = "datapro.eibs.master.Util" %>
<%@page import="com.datapro.constants.EibsFields"%>
<%@page import="com.datapro.eibs.constants.HelpTypes"%>

<html>
<head>
<META name="GENERATOR" content="IBM WebSphere Page Designer V4.0 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<title>Calificación de Clientes</title>
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<jsp:useBean id= "clasif" class= "datapro.eibs.beans.EDL051801Message"  scope="session" />

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />

<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />

<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />

<jsp:useBean id= "lmParam" class= "datapro.eibs.beans.EDL051801Message"  scope="session" />

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
<% if (userPO.getOption().equals("ADICIO")){ %>
Calificacion Adicional Prestamos Modificados
<%}%>
<% if (userPO.getOption().equals("PAPELE")){ %>
 Calificación Por Papeles
 <%}%>
<% if (userPO.getOption().equals("REESTR")){ %>
 Calificación Reestructuración
<%}%>
<% if (userPO.getOption().equals("OTORGA")){ %>
 Calificación Por Otorgamiento
<%}%>
<% if (userPO.getOption().equals("EVALUA")){ %>
 Calificación Por Evaluación
<%}%>
<% if (userPO.getOption().equals("EXCEPC")){ %>
 Calificación Excepción
 <%}%>
<% if (userPO.getOption().equals("ESCORE")){ %>
 Calificación Score
 <%}%> 
<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="client_clasif, EDL0518" ></h3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSEDL0518">
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="2">
  
  	<table class="tableinfo">
      <tr > 
        <td nowrap>          
         <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="trdark"> 
            
            <td nowrap> 
              <div align="right">Nro Cliente :</div>
            </td>
            <td nowrap> 
              <input type="text" readonly name="E01CUSCUN" size="10" maxlength="9" value="<%= clasif.getE01CUSCUN()%>">
            </td>
			<td nowrap> 
              <div align="right">Identificaci&oacute;n :</div>
            </td>
            <td nowrap> 
  			  <input type="text" readonly name="E01CUSTID" size="5" maxlength="4" value="<%= clasif.getE01CUSTID()%>">
              <input type="text" readonly name="E01CUSIDN" size="26" maxlength="25" value="<%= clasif.getE01CUSIDN()%>">
            </td>
			 <td nowrap> 
              <div align="right">Nombre :</div>
            </td>
            <td nowrap colspan="3"> 
              <input type="text" readonly name="E01CUSNA1" size="60" maxlength="60" value="<%= clasif.getE01CUSNA1().trim()%>">
            </td>
          </tr>
   
		        <tr id="trclear"> 
            <td nowrap> 
              <div align="right">Modalidad :</div>
            </td>
            <td nowrap colspan="3"> 
              <input type="text" readonly name="D01DLCMOD" size="20" maxlength="20" value="<%= clasif.getD01DLCMOD().trim()%>">
            </td>
			<td nowrap> 
              <div align="right"></div>
            </td>
            <td nowrap colspan="3">&nbsp;</td>
			
          </tr>    
         </table>
        </td>
      </tr>
    </table>
		 <table border="0" cellspacing="0" cellpadding="0" width="100%" style="visibility: <%= clasif.getE01PENDAP().equals("") ? "hidden" : "visible" %>">
  	<tr>
  		<td align="right" valign="top" width="85%" style="color:red;font-size:12;"><b><%=clasif.getE01PENDAP()%></b></td>
  		<td width="5%"><h4>&nbsp;</h4></td>
  	</tr>
  </table>	
    <% if (userPO.getOption().equals("ADICIO")){ %>

    <br>
	<table class="tableinfo">
      <tr > 
        <td nowrap> 
          <table cellspacing="2" cellpadding="2" width="100%" border="0" align="left">
            <tr id="trdark"> 
              <td nowrap width="40%"><div align="center"><b>Informaci&oacute;n B&aacute;sica</b></div></td>
              <td nowrap width="20%" align=center><b>Situación <br>Actual</b></td>
              <td nowrap width="40%" align=center><b>Situación <br>Nueva</b></td>
            </tr>
            <tr>
              <td nowrap id="trdark" align=right><B>Calificación :</B> </td> 
              <td nowrap > 
                <div align=left><%=clasif.getB01DLCCSU()%></div>              </td>
              <td nowrap >  
                <input type="text" name="E01DLCCSU" size="3" maxlength="2" value="<%= clasif.getE01DLCCSU().trim()%>">
                <a href="javascript:GetCodeCNOFC('E01DLCCSU','K4')"><img src="<%=request.getContextPath()%>/images/1b.gif" title=". . ." align="bottom" border="0"  ></a>
				<img src="<%=request.getContextPath()%>/images/Check.gif" title="mandatory field" align="bottom" border="0" >
				              </td>
            </tr>
            <tr >
              <td nowrap id="trdark" align=right><B>Motivo Calificación :
              </B></td> 
              <td nowrap > 
                <div align=left><%=clasif.getB01DLLMSU()%>:<%=clasif.getD01DLLMSU()%></div>              </td>
              <td nowrap >  
                <input type="text" name="E01DLLMSU" size="5" maxlength="4" value="<%= clasif.getE01DLLMSU().trim()%>">
                <a href="javascript:GetCodeCNOFC('E01DLLMSU','K2')"><img src="<%=request.getContextPath()%>/images/1b.gif" title=". . ." align="bottom" border="0"  ></a>
				<img src="<%=request.getContextPath()%>/images/Check.gif" title="mandatory field" align="bottom" border="0" >
				              </td>
            </tr>
            <tr >
              <td nowrap id="trdark" align=right><B>Fecha Inicio de Calificaci&oacute;n  : </B></td>
              <td nowrap >
				  <%= Util.formatDate(clasif.getB01DLLSID(),clasif.getB01DLLSIM(),clasif.getB01DLLSIY())%>
				  
				  </td>
              <td nowrap ><eibsinput:date name="clasif"  fn_month="E01DLLSIM" fn_day="E01DLLSID" fn_year="E01DLLSIY" />              </td>
            </tr>
			 <tr >
              <td nowrap id="trdark" align=right><B>Fecha Fin de Calificaci&oacute;n  : </B></td>
              <td nowrap >
				  <%= Util.formatDate(clasif.getB01DLLSFD(),clasif.getB01DLLSFM(),clasif.getB01DLLSFY())%>
				  
				  </td>
              <td nowrap ><eibsinput:date name="clasif"  fn_month="E01DLLSFM" fn_day="E01DLLSFD" fn_year="E01DLLSFY" />              </td>
            </tr>
            <tr> 
              <td nowrap id="trdark" align=right><B>Usuario Calificaci&oacute;n :
              </B></td>
              <td nowrap > 
                <div align=left><%=clasif.getB01DLLUSU()%></div>              </td>
              <td nowrap >		  </td>
            </tr>
            
          </table>
        </td>
      </tr>
    </table>
<%} %>
<% if (userPO.getOption().equals("PAPELE")){ %>
<table class="tableinfo">
      <tr > 
        <td nowrap> 
          <table cellspacing="2" cellpadding="2" width="100%" border="0" align="left">
            <tr id="trdark"> 
              <td nowrap width="40%"><div align="center"><b>Información Básica </b></div></td>
              <td nowrap width="20%" align=center><b>Situación <br>Actual</b></td>
              <td nowrap width="40%" align=center><b>Situación <br>Nueva</b></td>
            </tr>
            <tr>
              <td nowrap id="trdark" align=right><B>Calificación :</B> </td> 
              <td nowrap > 
                <div align=left><%=clasif.getB01DLCCPA()%></div>              </td>
              <td nowrap >  
                <input type="text" name="E01DLCCPA" size="3" maxlength="2" value="<%= clasif.getE01DLCCPA().trim()%>">
                <a href="javascript:GetCodeCNOFC('E01DLCCPA','K4')"><img src="<%=request.getContextPath()%>/images/1b.gif" title=". . ." align="bottom" border="0"  ></a>
				<img src="<%=request.getContextPath()%>/images/Check.gif" title="mandatory field" align="bottom" border="0" >
				              </td>
            </tr>
            <tr >
              <td nowrap id="trdark" align=right><B>Motivo Calificación :
              </B></td> 
              <td nowrap > 
                <div align=left><%=clasif.getB01DLLMPA()%>:<%=clasif.getD01DLLMPA()%></div>              </td>
              <td nowrap >  
                <input type="text" name="E01DLLMPA" size="5" maxlength="4" value="<%= clasif.getE01DLLMPA().trim()%>">
                 <a href="javascript:GetCodeCNOFC('E01DLLMPA','K2')"><img src="<%=request.getContextPath()%>/images/1b.gif" title=". . ." align="bottom" border="0"  ></a>
				 <img src="<%=request.getContextPath()%>/images/Check.gif" title="mandatory field" align="bottom" border="0" >
				              </td>
            </tr>
            <tr >
              <td nowrap id="trdark" align=right><B>Fecha Inicio de Calificaci&oacute;n  : </B></td>
              <td nowrap >
			  <div align=left> <%= Util.formatDate(clasif.getB01DLLPID(),clasif.getB01DLLPIM(),clasif.getB01DLLPIY())%></div>
                   </td>
              <td nowrap ><eibsinput:date name="clasif"  fn_month="E01DLLPIM" fn_day="E01DLLPID" fn_year="E01DLLPIY" />              </td>
            </tr>
			<tr >
              <td nowrap id="trdark" align=right><B>Fecha Fin de Calificaci&oacute;n  :</B></td>
              <td nowrap >
			  <div align=left> <%= Util.formatDate(clasif.getB01DLLPFD(),clasif.getB01DLLPFM(),clasif.getB01DLLPFY())%></div>
			  </td>
              <td nowrap ><eibsinput:date name="clasif"  fn_month="E01DLLPFM" fn_day="E01DLLPFD" fn_year="E01DLLPFY" />              </td>
            </tr>
			<tr >
              <td nowrap id="trdark" align=right><B>Fecha Vencimiento Papeles :</B></td>
              <td nowrap >
			  <div align=left> <%= Util.formatDate(clasif.getB01DLLVPD(),clasif.getB01DLLVPM(),clasif.getB01DLLVPY())%></div>
			  </td>
              <td nowrap ><eibsinput:date name="clasif"  fn_month="E01DLLVPM" fn_day="E01DLLVPD" fn_year="E01DLLVPY" />              </td>
            </tr>
            <tr> 
              <td nowrap id="trdark" align=right><B>Usuario Calificaci&oacute;n :
              </B></td>
              <td nowrap > 
                <div align=left><%=clasif.getB01DLLUPA()%></div>              </td>
              <td nowrap >  
                		  </td>
            </tr>
            
          </table>
        </td>
      </tr>
    </table>
	<%} %>
<% if (userPO.getOption().equals("REESTR")){ %>
<table class="tableinfo">
      <tr > 
        <td nowrap> 
          <table cellspacing="2" cellpadding="2" width="100%" border="0" align="left">
            <tr id="trdark"> 
              <td nowrap width="40%"><div align="center"><b>Información Básica </b></div></td>
              <td nowrap width="20%" align=center><b>Situación <br>Actual</b></td>
              <td nowrap width="40%" align=center><b>Situación <br>Nueva</b></td>
            </tr>
            <tr>
              <td nowrap id="trdark" align=right><B>Calificación :</B> </td> 
              <td nowrap > 
                <div align=left><%=clasif.getB01DLCUS1()%></div>              </td>
              <td nowrap >  
                <input type="text" name="E01DLCUS1" size="3" maxlength="2" value="<%= clasif.getE01DLCUS1().trim()%>">
                <a href="javascript:GetCodeCNOFC('E01DLCUS1','K4')"><img src="<%=request.getContextPath()%>/images/1b.gif" title=". . ." align="bottom" border="0"  ></a>
				<img src="<%=request.getContextPath()%>/images/Check.gif" title="mandatory field" align="bottom" border="0" >
				              </td>
            </tr>
            <tr >
              <td nowrap id="trdark" align=right><B>Motivo Calificación :
              </B></td> 
              <td nowrap > 
                <div align=left><%=clasif.getB01DLLMRE()%>:<%=clasif.getD01DLLMRE()%></div>              </td>
              <td nowrap >  
                <input type="text" name="E01DLLMRE" size="5" maxlength="4" value="<%= clasif.getE01DLLMRE().trim()%>">
                 <a href="javascript:GetCodeCNOFC('E01DLLMRE','K2')"><img src="<%=request.getContextPath()%>/images/1b.gif" title=". . ." align="bottom" border="0"  ></a>
				 <img src="<%=request.getContextPath()%>/images/Check.gif" title="mandatory field" align="bottom" border="0" >
				              </td>
            </tr>
            <tr >
              <td nowrap id="trdark" align=right><B>Fecha Inicio de Calificaci&oacute;n  : </B></td>
              <td nowrap >
			  <div align=left> <%= Util.formatDate(clasif.getB01DLLRID(),clasif.getB01DLLRIM(),clasif.getB01DLLRIY())%></div>
                   </td>
              <td nowrap ><eibsinput:date name="clasif"  fn_month="E01DLLRIM" fn_day="E01DLLRID" fn_year="E01DLLRIY" />              </td>
            </tr>
			<tr >
              <td nowrap id="trdark" align=right><B>Fecha Fin de Calificaci&oacute;n  :</B></td>
              <td nowrap >
			  <div align=left> <%= Util.formatDate(clasif.getB01DLLRFD(),clasif.getB01DLLRFM(),clasif.getB01DLLRFY())%></div>
			  </td>
              <td nowrap ><eibsinput:date name="clasif"  fn_month="E01DLLRFM" fn_day="E01DLLRFD" fn_year="E01DLLRFY" />              </td>
            </tr>
            <tr> 
              <td nowrap id="trdark" align=right><B>Usuario Calificaci&oacute;n :
              </B></td>
              <td nowrap > 
                <div align=left><%=clasif.getB01DLLURE()%></div>              </td>
              <td nowrap >  
                		  </td>
            </tr>
            
          </table>
        </td>
      </tr>
    </table>
	<%} %>	
<% if (userPO.getOption().equals("OTORGA")){ %>
<table class="tableinfo">
      <tr > 
        <td nowrap> 
          <table cellspacing="2" cellpadding="2" width="100%" border="0" align="left">
            <tr id="trdark"> 
              <td nowrap width="40%"><div align="center"><b>Información Básica </b></div></td>
              <td nowrap width="20%" align=center><b>Situación <br>Actual</b></td>
              <td nowrap width="40%" align=center><b>Situación <br>Nueva</b></td>
            </tr>
            <tr>
              <td nowrap id="trdark" align=right><B>Calificación :</B> </td> 
              <td nowrap > 
                <div align=left><%=clasif.getB01DLCUS2()%></div>              </td>
              <td nowrap >  
                <input type="text" name="E01DLCUS2" size="3" maxlength="2" value="<%= clasif.getE01DLCUS2().trim()%>">
                <a href="javascript:GetCodeCNOFC('E01DLCUS2','K4')"><img src="<%=request.getContextPath()%>/images/1b.gif" title=". . ." align="bottom" border="0"  ></a>
				<img src="<%=request.getContextPath()%>/images/Check.gif" title="mandatory field" align="bottom" border="0" >
				              </td>
            </tr>
            <tr >
              <td nowrap id="trdark" align=right><B>Motivo Calificación :
              </B></td> 
              <td nowrap > 
                <div align=left><%=clasif.getB01DLLMOT()%>:<%=clasif.getD01DLLMOT()%></div>              </td>
              <td nowrap >  
                <input type="text" name="E01DLLMOT" size="5" maxlength="4" value="<%= clasif.getE01DLLMOT().trim()%>">
                 <a href="javascript:GetCodeCNOFC('E01DLLMOT','K2')"><img src="<%=request.getContextPath()%>/images/1b.gif" title=". . ." align="bottom" border="0"  ></a>
				 <img src="<%=request.getContextPath()%>/images/Check.gif" title="mandatory field" align="bottom" border="0" >
				              </td>
            </tr>
            <tr >
              <td nowrap id="trdark" align=right><B>Fecha Inicio de Calificaci&oacute;n  : </B></td>
              <td nowrap >
			  <div align=left> <%= Util.formatDate(clasif.getB01DLLOID(),clasif.getB01DLLOIM(),clasif.getB01DLLOIY())%></div>
                   </td>
              <td nowrap ><eibsinput:date name="clasif"  fn_month="E01DLLOIM" fn_day="E01DLLOID" fn_year="E01DLLOIY" />              </td>
            </tr>
			<tr >
              <td nowrap id="trdark" align=right><B>Fecha Fin de Calificaci&oacute;n  :</B></td>
              <td nowrap >
			  <div align=left> <%= Util.formatDate(clasif.getB01DLLOFD(),clasif.getB01DLLOFM(),clasif.getB01DLLOFY())%></div>
			  </td>
              <td nowrap ><eibsinput:date name="clasif"  fn_month="E01DLLOFM" fn_day="E01DLLOFD" fn_year="E01DLLOFY" />              </td>
            </tr>
            <tr> 
              <td nowrap id="trdark" align=right><B>Usuario Calificaci&oacute;n :
              </B></td>
              <td nowrap > 
                <div align=left><%=clasif.getB01DLLUOT()%></div>              </td>
              <td nowrap >  
                		  </td>
            </tr>
            
          </table>
        </td>
      </tr>
    </table>
	<%} %>		
<% if (userPO.getOption().equals("EVALUA")){ %>
<table class="tableinfo">
      <tr > 
        <td nowrap> 
          <table cellspacing="2" cellpadding="2" width="100%" border="0" align="left">
            <tr id="trdark"> 
              <td nowrap width="40%"><div align="center"><b>Información Básica </b></div></td>
              <td nowrap width="20%" align=center><b>Situación <br>Actual</b></td>
              <td nowrap width="40%" align=center><b>Situación <br>Nueva</b></td>
            </tr>
            <tr>
              <td nowrap id="trdark" align=right><B>Calificación :</B> </td> 
              <td nowrap > 
                <div align=left><%=clasif.getB01DLCUS3()%></div>              </td>
              <td nowrap >  
                <input type="text" name="E01DLCUS3" size="3" maxlength="2" value="<%= clasif.getE01DLCUS3().trim()%>">
                <a href="javascript:GetCodeCNOFC('E01DLCUS3','K4')"><img src="<%=request.getContextPath()%>/images/1b.gif" title=". . ." align="bottom" border="0"  ></a>
				<img src="<%=request.getContextPath()%>/images/Check.gif" title="mandatory field" align="bottom" border="0" >
				              </td>
            </tr>
            <tr >
              <td nowrap id="trdark" align=right><B>Motivo Calificación :
              </B></td> 
              <td nowrap > 
                <div align=left><%=clasif.getB01DLLMEV()%>:<%=clasif.getD01DLLMEV()%></div>              </td>
              <td nowrap >  
                <input type="text" name="E01DLLMEV" size="5" maxlength="4" value="<%= clasif.getE01DLLMEV().trim()%>">
                 <a href="javascript:GetCodeCNOFC('E01DLLMEV','K2')"><img src="<%=request.getContextPath()%>/images/1b.gif" title=". . ." align="bottom" border="0"  ></a>
				 <img src="<%=request.getContextPath()%>/images/Check.gif" title="mandatory field" align="bottom" border="0" >
				              </td>
            </tr>
            <tr >
              <td nowrap id="trdark" align=right><B>Fecha Inicio de Calificaci&oacute;n  : </B></td>
              <td nowrap >
			  <div align=left> <%= Util.formatDate(clasif.getB01DLLEID(),clasif.getB01DLLEIM(),clasif.getB01DLLEIY())%></div>
                   </td>
              <td nowrap ><eibsinput:date name="clasif"  fn_month="E01DLLEIM" fn_day="E01DLLEID" fn_year="E01DLLEIY" />              </td>
            </tr>
			<tr >
              <td nowrap id="trdark" align=right><B>Fecha Fin de Calificaci&oacute;n  :</B></td>
              <td nowrap >
			  <div align=left> <%= Util.formatDate(clasif.getB01DLLEFD(),clasif.getB01DLLEFM(),clasif.getB01DLLEFY())%></div>
			  </td>
              <td nowrap ><eibsinput:date name="clasif"  fn_month="E01DLLEFM" fn_day="E01DLLEFD" fn_year="E01DLLEFY" />              </td>
            </tr>
            <tr> 
              <td nowrap id="trdark" align=right><B>Usuario Calificaci&oacute;n :
              </B></td>
              <td nowrap > 
                <div align=left><%=clasif.getB01DLLUEV()%></div>              </td>
              <td nowrap >  
                		  </td>
            </tr>
            
          </table>
        </td>
      </tr>
    </table>
	<%} %>			
<% if (userPO.getOption().equals("EXCEPC")){ %>
<table class="tableinfo">
      <tr > 
        <td nowrap> 
          <table cellspacing="2" cellpadding="2" width="100%" border="0" align="left">
            <tr id="trdark"> 
              <td nowrap width="40%"><div align="center"><b>Información Básica </b></div></td>
              <td nowrap width="20%" align=center><b>Situación <br>Actual</b></td>
              <td nowrap width="40%" align=center><b>Situación <br>Nueva</b></td>
            </tr>
            <tr>
              <td nowrap id="trdark" align=right><B>Calificación :</B> </td> 
              <td nowrap > 
                <div align=left><%=clasif.getB01DLCXS3()%></div>              </td>
              <td nowrap >  
                <input type="text" name="E01DLCXS3" size="3" maxlength="2" value="<%= clasif.getE01DLCXS3().trim()%>">
                <a href="javascript:GetCodeCNOFC('E01DLCXS3','K4')"><img src="<%=request.getContextPath()%>/images/1b.gif" title=". . ." align="bottom" border="0"  ></a>
				<img src="<%=request.getContextPath()%>/images/Check.gif" title="mandatory field" align="bottom" border="0" >
				              </td>
            </tr>
            <tr >
              <td nowrap id="trdark" align=right><B>Motivo Calificación :
              </B></td> 
              <td nowrap > 
                <div align=left><%=clasif.getB01DLLMXV()%>:<%=clasif.getD01DLLMXV()%></div>              </td>
              <td nowrap >  
                <input type="text" name="E01DLLMXV" size="5" maxlength="4" value="<%= clasif.getE01DLLMXV().trim()%>">
                 <a href="javascript:GetCodeCNOFC('E01DLLMXV','K2')"><img src="<%=request.getContextPath()%>/images/1b.gif" title=". . ." align="bottom" border="0"  ></a>
				 <img src="<%=request.getContextPath()%>/images/Check.gif" title="mandatory field" align="bottom" border="0" >
				              </td>
            </tr>
            <tr >
              <td nowrap id="trdark" align=right><B>Fecha Inicio de Calificaci&oacute;n  : </B></td>
              <td nowrap >
			  <div align=left> <%= Util.formatDate(clasif.getB01DLLXID(),clasif.getB01DLLXIM(),clasif.getB01DLLXIY())%></div>
                   </td>
              <td nowrap ><eibsinput:date name="clasif"  fn_month="E01DLLXIM" fn_day="E01DLLXID" fn_year="E01DLLXIY" />              </td>
            </tr>
			<tr >
              <td nowrap id="trdark" align=right><B>Fecha Fin de Calificaci&oacute;n  :</B></td>
              <td nowrap >
			  <div align=left> <%= Util.formatDate(clasif.getB01DLLXFD(),clasif.getB01DLLXFM(),clasif.getB01DLLXFY())%></div>
			  </td>
              <td nowrap ><eibsinput:date name="clasif"  fn_month="E01DLLXFM" fn_day="E01DLLXFD" fn_year="E01DLLXFY" />              </td>
            </tr>
            <tr> 
              <td nowrap id="trdark" align=right><B>Usuario Calificaci&oacute;n :
              </B></td>
              <td nowrap > 
                <div align=left><%=clasif.getB01DLLUXV()%></div>              </td>
              <td nowrap >  
                		  </td>
            </tr>
            
          </table>
        </td>
      </tr>
    </table>
	<%} %>				
<% if (userPO.getOption().equals("ESCORE")){ %>
<table class="tableinfo">
      <tr > 
        <td nowrap> 
          <table cellspacing="2" cellpadding="2" width="100%" border="0" align="left">
            <tr id="trdark"> 
              <td nowrap width="40%"><div align="center"><b>Información Básica </b></div></td>
              <td nowrap width="20%" align=center><b>Situación <br>Actual</b></td>
              <td nowrap width="40%" align=center><b>Situación <br>Nueva</b></td>
            </tr>
            <tr>
              <td nowrap id="trdark" align=right><B>Calificación :</B> </td> 
              <td nowrap > 
                <div align=left><%=clasif.getB01DLLESC()%></div>              </td>
              <td nowrap >  
                <input type="text" name="E01DLLESC" size="3" maxlength="2" value="<%= clasif.getE01DLLESC().trim()%>">
                <a href="javascript:GetCodeCNOFC('E01DLLESC','K4')"><img src="<%=request.getContextPath()%>/images/1b.gif" title=". . ." align="bottom" border="0"  ></a>
				<img src="<%=request.getContextPath()%>/images/Check.gif" title="mandatory field" align="bottom" border="0" >
				              </td>
            </tr>
            <tr >
              <td nowrap id="trdark" align=right><B>Motivo Calificación :
              </B></td> 
              <td nowrap > 
                <div align=left><%=clasif.getB01DLLMCV()%>:<%=clasif.getD01DLLMCV()%></div>              </td>
              <td nowrap >  
                <input type="text" name="E01DLLMCV" size="5" maxlength="4" value="<%= clasif.getE01DLLMCV().trim()%>">
                 <a href="javascript:GetCodeCNOFC('E01DLLMCV','K2')"><img src="<%=request.getContextPath()%>/images/1b.gif" title=". . ." align="bottom" border="0"  ></a>
				 <img src="<%=request.getContextPath()%>/images/Check.gif" title="mandatory field" align="bottom" border="0" >
				              </td>
            </tr>
            <tr >
              <td nowrap id="trdark" align=right><B>Fecha Inicio de Calificaci&oacute;n  : </B></td>
              <td nowrap >
			  <div align=left> <%= Util.formatDate(clasif.getB01DLLCID(),clasif.getB01DLLCIM(),clasif.getB01DLLCIY())%></div>
                   </td>
              <td nowrap ><eibsinput:date name="clasif"  fn_month="E01DLLCIM" fn_day="E01DLLCID" fn_year="E01DLLCIY" />              </td>
            </tr>
			<tr >
              <td nowrap id="trdark" align=right><B>Fecha Fin de Calificaci&oacute;n  :</B></td>
              <td nowrap >
			  <div align=left> <%= Util.formatDate(clasif.getB01DLLCFD(),clasif.getB01DLLCFM(),clasif.getB01DLLCFY())%></div>
			  </td>
              <td nowrap ><eibsinput:date name="clasif"  fn_month="E01DLLCFM" fn_day="E01DLLCFD" fn_year="E01DLLCFY" />              </td>
            </tr>
            <tr> 
              <td nowrap id="trdark" align=right><B>Usuario Calificaci&oacute;n :
              </B></td>
              <td nowrap > 
                <div align=left><%=clasif.getB01DLLUXV()%></div>              </td>
              <td nowrap >  
                		  </td>
            </tr>
            
          </table>
        </td>
      </tr>
    </table>
	<%} %>			
	<div align="center"> 
    	<input id="EIBSBTN" type=submit name="Submit" value="Enviar">
  	</div>

</form>
</body>
</html>
