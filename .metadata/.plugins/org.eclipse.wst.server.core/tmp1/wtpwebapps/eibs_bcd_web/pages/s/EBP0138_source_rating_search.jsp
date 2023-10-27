<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@ page import="com.datapro.constants.EibsFields"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css"> 

<TITLE>Pay Bills Selection</TITLE>
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>
<jsp:useBean id= "msgList" class= "datapro.eibs.beans.EBP013801Message"  scope="session" />
<jsp:useBean id="error" class="datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />

<SCRIPT src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script src="<%=request.getContextPath()%>/pages/s/javascripts/eIBSBillsP.jsp"> </SCRIPT>
<SCRIPT type="text/javascript">


function checkInfo(){
  	
   	document.forms[0].SCREEN.value = '2';
	document.forms[0].submit();
 }

</SCRIPT>

</HEAD>

<body>

 <h3 align="center">Selección de Documentos Origen a Calificar Servicio
    <%	if (msgList.getE01REQTYP().equals("V")) { 
		 	out.println(" Proveedor "); 
		} else if (msgList.getE01REQTYP().equals("C")) {
		    out.println(" Cliente "); 
		   	} else { out.println("  ");
		}  	
	%>
<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="source_rating_search, EBP0138"></h3>
<hr size="4">
 <FORM METHOD="POST" action="<%=request.getContextPath()%>/servlet/datapro.eibs.bap.JSEBP0138">	
    <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="2">
    <INPUT TYPE=HIDDEN NAME="E01REQTYP" VALUE="<%=msgList.getE01REQTYP()%>"> 
    
  <table id="tbenter" align="center" style="width:85%" border="1">
    <tr> 
      <td> 
        <table id="tbenter" width="100%" border="0" cellspacing="1" cellpadding="0">
          <tr>
            <td width="20%" align="left"> </td>
            <td width="30%" align="right"> Banco : </td>
            <td width="50%" align="left">
            	<INPUT type="text" name="E01REQBNK" size="3" maxlength="2" onkeypress="enterInteger(event)">
            </td>
          </tr>
          <tr> 
            <td width="20%" align="right"></td>
            <td width="30%" align="right"> Agencia : </td>
            <td width="50%" align="left">
            	<INPUT type="text" name="E01REQBRN" size="4" maxlength="4" onkeypress="enterInteger(event)">
                 <A href="javascript:GetBranch('E01REQBRN', document.forms[0].E01REQBNK.value)">
                 <IMG src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" border="0">
                 </A> (9999 = Todas las Oficinas)
            </td>
          </tr>
          <tr> 
            <td width="20%" align="right"></td>
            <td width="30%" align="right"> Tipo Documento Origen : </td>
            <td width="50%" align="left">
             	<input type="text" name="E01REQKIN"  size=5 maxlength="4" >
					<a href="javascript:GetCodeDescCNOFC('E01REQKIN','E01BDCKIND','V1')">
					<img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="bottom" border="0"></a> 
				<input type="text" name="E01BDCKIND" size="40" maxlength="35" readonly>
            </td>
          </tr>
          <tr>
            <td width="20%" align="center"> </td>
			<td width="30%" align="right">Vencimiento de Pagos desde : </td>
			<td width="50%" align="left">
				<eibsinput:date fn_month="E01REQDFM" fn_day="E01REQDFD" fn_year="E01REQDFY" />
			<B><%=currUser.getE01DTF()%></B></td>  
          </tr>
          <tr> 
            <td width="20%" align="center"></td>
				<td width="30%" align="right">Vencimiento de Pagos hasta : </td>
				<td width="50%" align="left"> 
					<eibsinput:date fn_month="E01REQDTM" fn_day="E01REQDTD" fn_year="E01REQDTY" />
            <B><%=currUser.getE01DTF()%></B></td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <table id="tbenter" align="center" style="width:85%">
   		<tr>
  			<td width="85%"> 
  		  		<div align="center"> 
     				<input id="EIBSBTN" type="Button" name="Process" value="Enviar" onClick="JavaScript:checkInfo()">
     	  		</div>	
  			</td>
  		</tr>	
  </table>

<SCRIPT type="text/javascript">

	getElement("E01REQDFM").value = '<%=currUser.getE01RDM()%>';
 	getElement("E01REQDFD").value = '<%=currUser.getE01RDD()%>';
    getElement("E01REQDFY").value = '<%=currUser.getE01RDY()%>';
   	getElement("E01REQDTM").value = '<%=currUser.getE01RDM()%>';
	getElement("E01REQDTD").value = '<%=currUser.getE01RDD()%>';
	getElement("E01REQDTY").value = '<%=currUser.getE01RDY()%>';

	getElement("E01REQBNK").value = '<%=currUser.getE01UBK()%>';
	getElement("E01REQBRN").value = '<%=currUser.getE01UBR()%>';
	getElement("E01REQKIN").value = '';
</SCRIPT>

 <% 
 if ( !error.getERRNUM().equals("0")  ) {
      error.setERRNUM("0");
 %> <SCRIPT type="text/javascript">
    showErrors();
    </SCRIPT> 
 <% }%>
</FORM>
</BODY>

</HTML>
 