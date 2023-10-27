<!DOCTYPE HTML">
<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@ page import = "datapro.eibs.master.Util" %>
<%@page import="com.datapro.constants.EibsFields"%>
<%@page import="com.datapro.eibs.constants.HelpTypes"%>

<html>
<head>
<title>Control validacion de Impuesto</title>

<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset="utf-8">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<link rel="stylesheet" href="<%=request.getContextPath()%>/jquery/themes/smoothness/jquery-ui.css"/> 

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/jquery/jquery-ui-1.10.4.min.js"> </SCRIPT>


<jsp:useBean id="msg" class="datapro.eibs.beans.ECO107201Message"  scope="session" />  
 
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />

</head>
 
<body>
<%
String mandatory = "<img src=\"" + request.getContextPath() + "/images/Check.gif\" alt=\"campo obligatorio\" align=\"bottom\" border=\"0\" >";

	Boolean isReadOnly = false;
	if (!(userPO.getPurpose().equals("NEW") || userPO.getPurpose().equals("MAINTENANCE"))) { 
		isReadOnly = true;
	}	
 %>
 
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript">
	
function goAction(op) {
	document.forms[0].SCREEN.value = op;
<%if (!isReadOnly){ %>	
	document.forms[0].Submit.disabled = true;
<%} %>	
	document.forms[0].Exit.disabled = true;		
	document.forms[0].submit();
}

</SCRIPT>  
 
 <% 
	if ( !error.getERRNUM().equals("0")  ) {
        out.println("<SCRIPT Language=\"Javascript\">");
        error.setERRNUM("0");
        out.println("       showErrors()");
        out.println("</SCRIPT>");
    }
%>

<H3 align="center">Control validacion de Impuesto<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="validacion_impuestos_maint.jsp;ECO1072"></H3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.adhesives.JSECO1072">
  
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="800">
  <INPUT TYPE=HIDDEN NAME="E01IMPSEQ" VALUE="<%=msg.getE01IMPSEQ() %>">
  
  
  <table  class="tableinfo" width="100%">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">                              
		<tr id="trdark"> 		
            <td nowrap align="right">Código Convenio: </td>
            <td nowrap align="left">
            	<input type="text" name="E01IMPCNV" maxlength="12" size="14" value="<%=userPO.getHeader1()%>" readonly="readonly" class="TXTRIGHT">         	 
            </td>         
   			<td align="right">
   				Descripción <br>Convenio:
   			</td>            
			<td nowrap align="left">
				<input type="text" name="E01IMPCND" maxlength="60" size="50" value="<%=userPO.getHeader2()%>" readonly="readonly" class="TXTBASE">				
			</td>		
		</tr>
		<tr id="trdark"> 		
            <td nowrap align="right">Formato: </td>
            <td nowrap align="left">
            	<input type="text" name="E01IMPTFR" maxlength="12" size="14" value="<%=userPO.getHeader3()%>" readonly="readonly" class="TXTRIGHT">         	 
            </td>         
   			<td align="right">
   				Descripción<br>Formato:
   			</td>            
			<td nowrap align="left">
				<input type="text" name="E01IMPTFD" maxlength="60" size="50" value="<%=userPO.getHeader4()%>" readonly="readonly" class="TXTBASE">				
			</td>		
		</tr>						
		<tr id="trclear"> 
            <td nowrap align="left" colspan="4">
            &nbsp;        	 
            </td>         		
		</tr>
    </table>
 
   <table  class="tableinfo" width="100%">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
         <tr id="trclear">
			<td nowrap  align="right" width="50%">
				DESCRIPCION
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			</td>
			<td nowrap align="left" width="50%">
			    Codigo &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			    Descricion&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;			    
			    <!-- Valor  -->&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			</td>                      
         </tr>
		<%if  (!msg.getE01IMPDS01().equals("")){ %>                 
         <tr id="trdark">
			<td nowrap  align="right" width="50%">
				<input type="text" name="E01IMPDS01" size="40" maxlength="40"  value="<%=msg.getE01IMPDS01()%>" readonly> :
			</td>
			<td nowrap align="left" width="50%">
			    <input type="text" name="E01IMPCR01" size="5" maxlength="4"  value="<%=msg.getE01IMPCR01()%>"  readonly="readonly"> 
				<input type="text" name="E01IMPDR01" size="35" maxlength="45"  value="<%=msg.getE01IMPDR01()%>"  readonly="readonly">
				<input type="hidden" name="E01IMPTB01" value="<%=msg.getE01IMPTB01()%>">
				<a id="linkHelp" href="javascript:GetCodeDescCNOFC('E01IMPCR01', 'E01IMPDR01','<%=msg.getE01IMPTB01()%>')">
				<img src="${pageContext.request.contextPath}/images/1b.gif" title="" align="bottom" border="0"/></a>
				<%if  (!msg.getE01IMPRF01().equals("")){ %> 
					<input type="text" name="E01IMPRF01" size="30" maxlength="40"  value="<%=msg.getE01IMPRF01()%>" readonly="readonly" >
				<%} %>						           
			</td>                      
         </tr> 
         <%} %>
		<%if  (!msg.getE01IMPDS02().equals("")){ %>                 
         <tr id="trclear">
			 <td nowrap  align="right">
				<input type="text" name="E01IMPDS02" size="40" maxlength="40"  value="<%=msg.getE01IMPDS02()%>" readonly > :
			</td>
			<td nowrap align="left">
			    <input type="text" name="E01IMPCR02" size="5" maxlength="4"  value="<%=msg.getE01IMPCR02()%>"  readonly="readonly"> 
				<input type="text" name="E01IMPDR02" size="35" maxlength="45"  value="<%=msg.getE01IMPDR02()%>"  readonly="readonly">				
				<input type="hidden" name="E01IMPTB02" value="<%=msg.getE01IMPTB02()%>">							    
				<a id="linkHelp" href="javascript:GetCodeDescCNOFC('E01IMPCR02', 'E01IMPDR02','<%=msg.getE01IMPTB02()%>')">
				<img src="${pageContext.request.contextPath}/images/1b.gif" title="" align="bottom" border="0"/></a>
				<%if  (!msg.getE01IMPRF02().equals("")){ %> 
					<input type="text" name="E01IMPRF02" size="30" maxlength="40"  value="<%=msg.getE01IMPRF02()%>" readonly="readonly" >
				<%} %>					     			          	       
			</td>     
         </tr>
		<%} %>
		<%if  (!msg.getE01IMPDS03().equals("")){ %>           
         <tr id="trdark">
			 <td nowrap  align="right">
				<input type="text" name="E01IMPDS03" size="40" maxlength="40"  value="<%=msg.getE01IMPDS03()%>" readonly > :
			</td>
			<td nowrap align="left">
			    <input type="text" name="E01IMPCR03" size="5" maxlength="4"  value="<%=msg.getE01IMPCR03()%>"  readonly="readonly"> 
				<input type="text" name="E01IMPDR03" size="35" maxlength="45"  value="<%=msg.getE01IMPDR03()%>"  readonly="readonly">
				<input type="hidden" name="E01IMPTB03" value="<%=msg.getE01IMPTB03()%>" >				    
				<a id="linkHelp" href="javascript:GetCodeDescCNOFC('E01IMPCR03', 'E01IMPDR03','<%=msg.getE01IMPTB03()%>')">
				<img src="${pageContext.request.contextPath}/images/1b.gif" title="" align="bottom" border="0"/></a>
				<%if  (!msg.getE01IMPRF03().equals("")){ %>				
				<input type="text" name="E01IMPRF03" size="30" maxlength="40"  value="<%=msg.getE01IMPRF03()%>" readonly="readonly" >
				<%} %>			     	       
			</td>            
         </tr> 
		<%} %>
		<%if  (!msg.getE01IMPDS04().equals("")){ %>           
         <tr id="trclear">
			 <td nowrap  align="right">
				<input type="text" name="E01IMPDS04" size="40" maxlength="40"  value="<%=msg.getE01IMPDS04()%>" readonly > :
			</td>
			<td nowrap align="left">
			    <input type="text" name="E01IMPCR04" size="5" maxlength="4"  value="<%=msg.getE01IMPCR04()%>"  readonly="readonly"> 
				<input type="text" name="E01IMPDR04" size="35" maxlength="45"  value="<%=msg.getE01IMPDR04()%>"  readonly="readonly">			    
				<input type="hidden" name="E01IMPTB04" value="<%=msg.getE01IMPTB04()%>" >	
				<a id="linkHelp" href="javascript:GetCodeDescCNOFC('E01IMPCR04', 'E01IMPDR04','<%=msg.getE01IMPTB04()%>')">
				<img src="${pageContext.request.contextPath}/images/1b.gif" title="" align="bottom" border="0"/></a>
				<%if  (!msg.getE01IMPRF04().equals("")){ %>					
				<input type="text" name="E01IMPRF04" size="30" maxlength="40"  value="<%=msg.getE01IMPRF04()%>" readonly="readonly" >
				<%} %>
			</td>           
         </tr> 
		<%} %>
		<%if  (!msg.getE01IMPDS05().equals("")){ %>           
         <tr id="trdark">
			 <td nowrap  align="right">
				<input type="text" name="E01IMPDS05" size="40" maxlength="40"  value="<%=msg.getE01IMPDS05()%>" readonly> :
			</td>
			<td nowrap align="left">
			    <input type="text" name="E01IMPCR05" size="5" maxlength="4"  value="<%=msg.getE01IMPCR05()%>"  readonly="readonly"> 
				<input type="text" name="E01IMPDR05" size="35" maxlength="45"  value="<%=msg.getE01IMPDR05()%>"  readonly="readonly">			    
				<input type="hidden" name="E01IMPTB05" value="<%=msg.getE01IMPTB05()%>" >	
				<a id="linkHelp" href="javascript:GetCodeDescCNOFC('E01IMPCR05', 'E01IMPDR05','<%=msg.getE01IMPTB05()%>')">
				<img src="${pageContext.request.contextPath}/images/1b.gif" title="" align="bottom" border="0"/></a>
				<%if  (!msg.getE01IMPRF05().equals("")){ %>				
				<input type="text" name="E01IMPRF05" size="30" maxlength="40"  value="<%=msg.getE01IMPRF05()%>" readonly="readonly" >
				<%} %>
			</td>            
         </tr>  
		<%} %>
		<%if  (!msg.getE01IMPDS06().equals("")){ %>               
         <tr id="trclear">
			 <td nowrap  align="right">
				<input type="text" name="E01IMPDS06" size="40" maxlength="40"  value="<%=msg.getE01IMPDS06()%>" readonly> :
			</td>
			<td nowrap align="left">
			    <input type="text" name="E01IMPCR06" size="5" maxlength="4"  value="<%=msg.getE01IMPCR06()%>"  readonly="readonly"> 
				<input type="text" name="E01IMPDR06" size="35" maxlength="45"  value="<%=msg.getE01IMPDR06()%>"  readonly="readonly">			    
				<input type="hidden" name="E01IMPTB06" value="<%=msg.getE01IMPTB06()%>" >	
				<a id="linkHelp" href="javascript:GetCodeDescCNOFC('E01IMPCR06', 'E01IMPDR06','<%=msg.getE01IMPTB06()%>')">
				<img src="${pageContext.request.contextPath}/images/1b.gif" title="" align="bottom" border="0"/></a>
				<%if  (!msg.getE01IMPRF06().equals("")){ %>				
				<input type="text" name="E01IMPRF06" size="30" maxlength="40"  value="<%=msg.getE01IMPRF06()%>" readonly="readonly" >
				<%} %>				
			</td>             
         </tr>          
		<%} %>
		<%if  (!msg.getE01IMPDS07().equals("")){ %>                
         <tr id="trdark">
			 <td nowrap  align="right">
				<input type="text" name="E01IMPDS07" size="40" maxlength="40"  value="<%=msg.getE01IMPDS07()%>" readonly> :
			</td>
			<td nowrap align="left">
			    <input type="text" name="E01IMPCR07" size="5" maxlength="4"  value="<%=msg.getE01IMPCR07()%>"  readonly="readonly"> 
				<input type="text" name="E01IMPDR07" size="35" maxlength="45"  value="<%=msg.getE01IMPDR07()%>"  readonly="readonly">	
				<input type="hidden" name="E01IMPTB07" value="<%=msg.getE01IMPTB07()%>" >		    
				<a id="linkHelp" href="javascript:GetCodeDescCNOFC('E01IMPCR07', 'E01IMPDR07','<%=msg.getE01IMPTB07()%>')">
				<img src="${pageContext.request.contextPath}/images/1b.gif" title="" align="bottom" border="0"/></a>
				<%if  (!msg.getE01IMPRF07().equals("")){ %>	
				<input type="text" name="E01IMPRF07" size="30" maxlength="40"  value="<%=msg.getE01IMPRF07()%>" readonly="readonly" >
				<%} %>					    
			</td>            
         </tr>
		<%} %>
		<%if  (!msg.getE01IMPDS08().equals("")){ %>               
         <tr id="trclear">
			 <td nowrap  align="right">
				<input type="text" name="E01IMPDS08" size="40" maxlength="40"  value="<%=msg.getE01IMPDS08()%>" readonly> :
			</td>
			<td nowrap align="left">
			    <input type="text" name="E01IMPCR08" size="5" maxlength="4"  value="<%=msg.getE01IMPCR08()%>"  readonly="readonly"> 
				<input type="text" name="E01IMPDR08" size="35" maxlength="45"  value="<%=msg.getE01IMPDR08()%>"  readonly="readonly">			    
				<input type="hidden" name="E01IMPTB08" value="<%=msg.getE01IMPTB08()%>" >
				<a id="linkHelp" href="javascript:GetCodeDescCNOFC('E01IMPCR08', 'E01IMPDR08','<%=msg.getE01IMPTB08()%>')">
				<img src="${pageContext.request.contextPath}/images/1b.gif" title="" align="bottom" border="0"/></a>
				<%if  (!msg.getE01IMPRF07().equals("")){ %>
				<input type="text" name="E01IMPRF08" size="30" maxlength="40"  value="<%=msg.getE01IMPRF08()%>" readonly="readonly" >
			  <%} %>			     
			</td>             
         </tr>
		<%} %>
		<%if  (!msg.getE01IMPDS09().equals("")){ %>      
        <tr id="trdark">
			 <td nowrap  align="right">
				<input type="text" name="E01IMPDS09" size="40" maxlength="40"  value="<%=msg.getE01IMPDS09()%>" readonly> :
			</td>
			<td nowrap align="left">
			    <input type="text" name="E01IMPCR09" size="5" maxlength="4"  value="<%=msg.getE01IMPCR09()%>"  readonly="readonly"> 
				<input type="text" name="E01IMPDR09" size="35" maxlength="45"  value="<%=msg.getE01IMPDR09()%>"  readonly="readonly">			    
				<input type="hidden" name="E01IMPTB09" value="<%=msg.getE01IMPTB09()%>" >
				<a id="linkHelp" href="javascript:GetCodeDescCNOFC('E01IMPCR09', 'E01IMPDR09','<%=msg.getE01IMPTB09()%>')">
				<img src="${pageContext.request.contextPath}/images/1b.gif" title="" align="bottom" border="0"/></a>
				<%if  (!msg.getE01IMPRF09().equals("")){ %>
					<input type="text" name="E01IMPRF09" size="30" maxlength="40"  value="<%=msg.getE01IMPRF09()%>" readonly="readonly" >
				<%} %>					      	       
			</td>     
         </tr>
		<%} %>
		<%if  (!msg.getE01IMPDS10().equals("")){ %>                
         <tr id="trclear">
			 <td nowrap  align="right">
				<input type="text" name="E01IMPDS10" size="40" maxlength="40"  value="<%=msg.getE01IMPDS10()%>" readonly> :
			</td>
			<td nowrap align="left">
			    <input type="text" name="E01IMPCR10" size="5" maxlength="4"  value="<%=msg.getE01IMPCR10()%>"  readonly="readonly"> 
				<input type="text" name="E01IMPDR10" size="35" maxlength="45"  value="<%=msg.getE01IMPDR10()%>"  readonly="readonly">			    
				<input type="hidden" name="E01IMPTB10" value="<%=msg.getE01IMPTB10()%>" >
				<a id="linkHelp" href="javascript:GetCodeDescCNOFC('E01IMPCR10', 'E01IMPDR10','<%=msg.getE01IMPTB10()%>')">
				<img src="${pageContext.request.contextPath}/images/1b.gif" title="" align="bottom" border="0"/></a>
				<%if  (!msg.getE01IMPRF10().equals("")){ %>
				<input type="text" name="E01IMPRF10" size="30" maxlength="40"  value="<%=msg.getE01IMPRF10()%>" readonly="readonly" >
				<%} %>						        	       
			</td>            
         </tr>
		<%} %>
		<%if  (!msg.getE01IMPDS11().equals("")){ %>                   	   
         <tr id="trdark">
			 <td nowrap  align="right">
				<input type="text" name="E01IMPDS11" size="40" maxlength="40"  value="<%=msg.getE01IMPDS11()%>" readonly> :
			</td>
			<td nowrap align="left">
			    <input type="text" name="E01IMPCR11" size="5" maxlength="4"  value="<%=msg.getE01IMPCR11()%>"  readonly="readonly"> 
				<input type="text" name="E01IMPDR11" size="35" maxlength="45"  value="<%=msg.getE01IMPDR11()%>"  readonly="readonly">			    
				<input type="hidden" name="E01IMPTB11" value="<%=msg.getE01IMPTB11()%>" >
				<a id="linkHelp" href="javascript:GetCodeDescCNOFC('E01IMPCR11', 'E01IMPDR11','<%=msg.getE01IMPTB11()%>')">
				<img src="${pageContext.request.contextPath}/images/1b.gif" title="" align="bottom" border="0"/></a>
				<%if  (!msg.getE01IMPRF11().equals("")){ %>
				<input type="text" name="E01IMPRF11" size="30" maxlength="40"  value="<%=msg.getE01IMPRF11()%>" readonly="readonly" >
				<%} %>					    	       
			</td>           
         </tr>
		<%} %>
		<%if  (!msg.getE01IMPDS12().equals("")){ %>                
         <tr id="trclear">
			 <td nowrap  align="right">
				<input type="text" name="E01IMPDS12" size="40" maxlength="40"  value="<%=msg.getE01IMPDS12()%>" readonly> :
			</td>
			<td nowrap align="left">
			    <input type="text" name="E01IMPCR12" size="5" maxlength="4"  value="<%=msg.getE01IMPCR12()%>"  readonly="readonly"> 
				<input type="text" name="E01IMPDR12" size="35" maxlength="45"  value="<%=msg.getE01IMPDR12()%>"  readonly="readonly">			    
				<input type="hidden" name="E01IMPTB12" value="<%=msg.getE01IMPTB12()%>" >
				<a id="linkHelp" href="javascript:GetCodeDescCNOFC('E01IMPCR12', 'E01IMPDR12','<%=msg.getE01IMPTB12()%>')">
				<img src="${pageContext.request.contextPath}/images/1b.gif" title="" align="bottom" border="0"/></a>
				<%if  (!msg.getE01IMPRF12().equals("")){ %>
				<input type="text" name="E01IMPRF12" size="30" maxlength="40"  value="<%=msg.getE01IMPRF12()%>" readonly="readonly" >
				<%} %>				           
			</td>            
         </tr>
		<%} %>
		<%if  (!msg.getE01IMPDS13().equals("")){ %>                 
         <tr id="trdark">
			 <td nowrap  align="right">
				<input type="text" name="E01IMPDS13" size="40" maxlength="40"  value="<%=msg.getE01IMPDS13()%>" readonly> :
			</td>
			<td nowrap align="left">
			    <input type="text" name="E01IMPCR13" size="5" maxlength="4"  value="<%=msg.getE01IMPCR13()%>"  readonly="readonly"> 
				<input type="text" name="E01IMPDR13" size="35" maxlength="45"  value="<%=msg.getE01IMPDR13()%>"  readonly="readonly">			    
				<input type="hidden" name="E01IMPTB13" value="<%=msg.getE01IMPTB13()%>" >
				<a id="linkHelp" href="javascript:GetCodeDescCNOFC('E01IMPCR13', 'E01IMPDR13','<%=msg.getE01IMPTB13()%>')">
				<img src="${pageContext.request.contextPath}/images/1b.gif" title="" align="bottom" border="0"/></a>
				<%if  (!msg.getE01IMPRF13().equals("")){ %>
				<input type="text" name="E01IMPRF13" size="30" maxlength="40"  value="<%=msg.getE01IMPRF13()%>" readonly="readonly" >
				<%} %>	
			</td>             
         </tr>
		<%} %>
		<%if  (!msg.getE01IMPDS14().equals("")){ %>                 
         <tr id="trclear">
			 <td nowrap  align="right">
				<input type="text" name="E01IMPDS14" size="40" maxlength="40"  value="<%=msg.getE01IMPDS14()%>" readonly> :
			</td>
			<td nowrap align="left">
			    <input type="text" name="E01IMPCR14" size="5" maxlength="4"  value="<%=msg.getE01IMPCR14()%>"  readonly="readonly"> 
				<input type="text" name="E01IMPDR14" size="35" maxlength="45"  value="<%=msg.getE01IMPDR14()%>"  readonly="readonly">
				<input type="hidden" name="E01IMPTB14" value="<%=msg.getE01IMPTB14()%>" >			    
				<a id="linkHelp" href="javascript:GetCodeDescCNOFC('E01IMPCR14', 'E01IMPDR14','<%=msg.getE01IMPTB14()%>')">
				<img src="${pageContext.request.contextPath}/images/1b.gif" title="" align="bottom" border="0"/></a>
				<%if  (!msg.getE01IMPRF14().equals("")){ %>
				<input type="text" name="E01IMPRF14" size="30" maxlength="40"  value="<%=msg.getE01IMPRF14()%>" readonly="readonly" >
				<%} %>	       
			</td>            
         </tr>
		<%} %>
		<%if  (!msg.getE01IMPDS15().equals("")){ %>                 
         <tr id="trdark">
			 <td nowrap  align="right">
				<input type="text" name="E01IMPDS15" size="40" maxlength="40"  value="<%=msg.getE01IMPDS15()%>" readonly> :
			</td>
			<td nowrap align="left">
			    <input type="text" name="E01IMPCR15" size="5" maxlength="4"  value="<%=msg.getE01IMPCR15()%>"  readonly="readonly"> 
				<input type="text" name="E01IMPDR15" size="35" maxlength="45"  value="<%=msg.getE01IMPDR15()%>"  readonly="readonly">			    
				<input type="hidden" name="E01IMPTB15" value="<%=msg.getE01IMPTB15()%>" >
				<a id="linkHelp" href="javascript:GetCodeDescCNOFC('E01IMPCR15', 'E01IMPDR15','<%=msg.getE01IMPTB15()%>')">
				<img src="${pageContext.request.contextPath}/images/1b.gif" title="" align="bottom" border="0"/></a>
				<%if  (!msg.getE01IMPRF15().equals("")){ %>
				<input type="text" name="E01IMPRF15" size="30" maxlength="40"  value="<%=msg.getE01IMPRF15()%>" readonly="readonly" >
				<%} %>        
			</td>             
         </tr>
		<%} %>
		<%if  (!msg.getE01IMPDS16().equals("")){ %>               
         <tr id="trclear">
			 <td nowrap  align="right">
				<input type="text" name="E01IMPDS16" size="40" maxlength="40"  value="<%=msg.getE01IMPDS16()%>" readonly> :
			</td>
			<td nowrap align="left">
			    <input type="text" name="E01IMPCR16" size="5" maxlength="4"  value="<%=msg.getE01IMPCR16()%>"  readonly="readonly"> 
				<input type="text" name="E01IMPDR16" size="35" maxlength="45"  value="<%=msg.getE01IMPDR16()%>"  readonly="readonly">			    
				<input type="hidden" name="E01IMPTB16" value="<%=msg.getE01IMPTB16()%>" >
				<a id="linkHelp" href="javascript:GetCodeDescCNOFC('E01IMPCR16', 'E01IMPDR16','<%=msg.getE01IMPTB16()%>')">
				<img src="${pageContext.request.contextPath}/images/1b.gif" title="" align="bottom" border="0"/></a>
				<%if  (!msg.getE01IMPRF16().equals("")){ %>
				<input type="text" name="E01IMPRF16" size="30" maxlength="40"  value="<%=msg.getE01IMPRF16()%>" readonly="readonly" >
				<%} %>       
			</td>            
         </tr> 
		<%} %>                          
          </table>
        </td>
      </tr>
          </table>
        </td>
      </tr>
    </table>     
    
    <br>
    <br>
    <table width="100%">		
	<tr>
  		<td width="50%">
  		  <div align="center"> 
		<%if (!isReadOnly){ %>  		  
     		<input id="EIBSBTN" type=button name="Submit" value="Guardar" onClick="goAction(800);">
		<%} %>     		
     	  </div>	
  		</td>
  		<td width="50%"> 
  		  <div align="center"> 
     		<input id="EIBSBTN" type=button name="Exit" value="Regresar" onClick="goAction(300);">
     	  </div>	
  		</td>
  	</tr>
	</table>

  
  </form>
</body> 

</html>
