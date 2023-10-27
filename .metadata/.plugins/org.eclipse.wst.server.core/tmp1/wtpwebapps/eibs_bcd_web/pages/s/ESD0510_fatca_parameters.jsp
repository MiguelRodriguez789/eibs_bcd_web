<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<HTML>
<HEAD>
<TITLE>Informacion Basica</TITLE>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Studio">
<LINK href="<%=request.getContextPath()%>/pages/style.css"
	rel="stylesheet">


<SCRIPT type="text/javascript"
	src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> 
</SCRIPT>
<SCRIPT type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>
                                                  
<jsp:useBean id="fatca" class="datapro.eibs.beans.ESD051001Message" 	scope="session" />

<jsp:useBean id="error" class="datapro.eibs.beans.ELEERRMessage" 	scope="session" />

<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" 	scope="session" />

<jsp:useBean id="currUser" class="datapro.eibs.beans.ESS0030DSMessage"
	scope="session" />



</HEAD>

<BODY bgcolor="#FFFFFF">

<%if (!error.getERRNUM().equals("0")) {
	error.setERRNUM("0");
	out.println("<SCRIPT Language=\"Javascript\">");
	out.println("       showErrors()");
	out.println("</SCRIPT>");
}
 
%>

<script type="text/javascript">
function valMax(fld, max){
	if(fld.value > max)
		fld.value = max;
 }
</SCRIPT> 

<H3 align="center">Parametros de Control FATCA<IMG src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left"
	name="EIBS_GIF" title="bank_setup_basic_maint_add, ESD0005"></H3>
<HR size="4">
<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSESD0510">
<INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="600"> 
<INPUT TYPE=HIDDEN NAME="TYPBANK" VALUE="<%=request.getParameter("TYPBANK") %>">  
<H4>Informaci&oacute;n Basica</H4>

<TABLE class="tableinfo" cellspacing="0" cellpadding="2" width="100%" border="0">

           
            <tr id="trdark">
             <td nowrap width="40%"> 
                  <div align="right">Banco : </div>
             </td>
             <td nowrap width="60%" colspan="3"> 
                 <input type="text" name="E01FBNK" maxlength="21" size="20"  value="<%=fatca.getE01FBNK().trim()%>" readonly >
             </td>
           </tr>
           <tr>
           <td nowrap width="40%">
		    <div align="right">Modelo de Fatca:</div>
		   </td>
              <td nowrap width="60%">
          <select name="E01FCN1">
            <option value=" "
	           <% if (!(fatca.getE01FCN1().equals("N")	|| fatca.getE01FCN1().equals("1") 	|| fatca.getE01FCN1().equals("2") ))  out.print("selected"); %>>
            </option> 
            <option value="N" <%if (fatca.getE01FCN1().equals("N"))  out.print("selected");%>>Ninguno</option>
		    <option value="1" <%if (fatca.getE01FCN1().equals("1"))  out.print("selected");%>>FATCA modelo 1</option>
		    <option value="2" <%if (fatca.getE01FCN1().equals("2"))  out.print("selected");%>>FATCA modelo 2</option>
        </select>
        </td>
	</tr>
            <tr id="trdark">
             <td nowrap width="40%"> 
                  <div align="right">GIIN : </div>
             </td>
             <td nowrap width="60%" colspan="3"> 
                 <input type="text" name="E01FGIN" maxlength="21" size="20"  value="<%=fatca.getE01FGIN().trim()%>" >
             </td>
           </tr>
           <tr id="trclear">
             <td nowrap width="40%"> 
                  <div align="right">Porcentaje Limite de Acciones : </div>
             </td>
             <td nowrap width="60%" colspan="3"> 
                 <input type="text" name="E01FPCA" maxlength="4" size="3"  value="<%=fatca.getE01FPCA().trim()%>" onkeypress="enterInteger(event);" onkeyup="valMax(this,100);">
             </td>
           </tr>
           <tr id="trdark">
             <td nowrap width="40%"> 
                  <div align="right">Valor Monetario Limite : </div>
             </td>
             <td nowrap width="60%" colspan="3"> 
                 <input type="text" name="E01FVAL" maxlength="9" size="11"  value="<%=fatca.getE01FVAL().trim()%>" onkeypress="enterInteger(event);">
             </td>
           </tr>
           <tr id="trclear">
             <td nowrap width="40%"> 
                  <div align="right">Moneda : </div>
             </td>
             <td nowrap width="60%" colspan="3"> 
                <INPUT type="text" name="E01FCCY" size="4" maxlength="3" value="<%=fatca.getE01FCCY().trim()%>" readonly> 
		     <A href="javascript:GetCurrency('E01FCCY','')"><IMG src="<%=request.getContextPath()%>/images/1b.gif" title="ayuda" align="middle" border="0" ></A>  
             </td>
           </tr>
           
</TABLE>

<DIV align="center"> <INPUT id="EIBSBTN" type=submit name="Submit" 	value="Enviar" > </DIV>

</FORM>
</BODY>
</HTML>

