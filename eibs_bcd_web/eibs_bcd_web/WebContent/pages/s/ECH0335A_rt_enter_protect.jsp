<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<HTML>
<HEAD>
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<TITLE>Proteccion de Cheques</TITLE>

<META name="GENERATOR" content="IBM WebSphere Studio">

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>

<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />

</HEAD>

<BODY>

<% 
 if ( !error.getERRNUM().equals("0")  ) {
      error.setERRNUM("0");
 %>
     <SCRIPT type="text/javascript">
            showErrors();
     </SCRIPT>
 <%
 }
%>

  <h3 align="center">Protección Automática de Cheques</h3>
<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="rt_enter_protec.jsp,ECH0335A">

<hr size="4">
<FORM METHOD="POST" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSECH0335A" ENCTYPE="multipart/form-data">
<INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="200">
  
  <% 
  if (userPO.getHeader1().equals("1")) {
  	userPO.setHeader1("");
  %>
	  <TABLE class="tbenter" width="100%">
	    <TR id="trdark"> 
	      <TD >Error :</TD>
	      <TD >
	        Archivo con formato invalido.
	      </TD>
	    </TR>
	  </TABLE>  
  <% 
  }
  %>

  
  <br>
  <br>
  
  <TABLE class="tableinfo">
    <TR id="trdark"> 
      <TD >Archivo :</TD>
      <TD >
        <INPUT TYPE="FILE" NAME="FILE1" SIZE="50" >
      </TD>
    </TR>
  </TABLE>  

  <br>

   <TABLE class="tbenter" width="100%">
   	<tr>
  	<TD ALIGN="CENTER"> 
        <input id="EIBSBTN" type=submit name="Submit" value="Enviar" >
      </TD>
    </tr>  
  </TABLE>

</FORM>
</BODY>
</HTML>
