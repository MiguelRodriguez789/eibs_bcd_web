<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css"> 
<TITLE>Información Financiera</TITLE>
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"></SCRIPT>

<script type="text/javascript">

function goCancel() {
document.forms[0].SCREEN.value="100";
document.forms[0].submit(); 
}
</script>

<jsp:useBean id= "optList3"  class= "datapro.eibs.beans.JBList"  scope="session" />
<jsp:useBean id= "error"     class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>
</HEAD>


<body bgcolor="#FFFFFF">

<h3 align="center">
  <% if(userPO.getOption().equals("1")) {out.print("Registro Garantia Detalle");} %>
  <% if(userPO.getOption().equals("2")) {out.print("Rutas Alternas");} %>
  <img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" alt="registros_filter,EDP0706"></h3>

<hr size="4">
 <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/servlet/datapro.eibs.creditproposal.JSEDP0706" >
  <CENTER>
    <p><INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="150">

  <input type=HIDDEN name="PRD" value=""> 
    
    </p>
    
    <table cellspacing="0" cellpadding="2" class="tbenter"  border=0  width=70% align="center" >
      
      <tr valign="middle"> 
        <td nowrap width=20% align="right" > 
          Producto : 
        </td>
        <td nowrap width=60% align="left">  
            <select name="E01PLPPRD">
             	<%
                optList3.initRow();
                int t=1;
                while (optList3.getNextRow()) {
                    if (optList3.getFlag().equals("")) {
                    		out.println(optList3.getRecord());
                    t++;
                    }        
                }                 
    			%> 
            </select>
        </td>
      </tr>
      
      
      <tr>
		<td nowrap colspan="2" valign="middle" height="146">
		<div align="center"><INPUT id="EIBSBTN" type="button" name="Submit"
			value="Enviar" onclick="goConfirm()"></div>
		</td>
	</tr>
      <tr>
		<td nowrap colspan="2" valign="middle" height="41">&nbsp;</td>
	</tr>
            	  
    </table>
  </CENTER>
</FORM>
<script type="text/javascript">

function goConfirm() {

	document.forms[0].PRD.value=document.forms[0].E01PLPPRD.value; 
	document.forms[0].submit();	  		  

}

</script>

<% 
 if ( !error.getERRNUM().equals("0")  ) {
      error.setERRNUM("0");
 %>
     <SCRIPT type="text/javascript">;
            showErrors();
     </SCRIPT>
 <%
 }
%>
</BODY>
</HTML>
 