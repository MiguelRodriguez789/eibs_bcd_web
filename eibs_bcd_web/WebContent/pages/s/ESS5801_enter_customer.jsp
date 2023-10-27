<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
<HEAD>
<TITLE>
Customer List
</TITLE>
<META http-equiv="Content-Style-Type" content="text/css">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<%
java.util.Calendar now = java.util.Calendar.getInstance();
int mm = now.get(java.util.Calendar.MONTH) +1;
int dd = now.get(java.util.Calendar.DAY_OF_MONTH);
int yy = now.get(java.util.Calendar.YEAR);
%> 
</HEAD>
<BODY>
<FORM Method="post" Action="<%=request.getContextPath()%>/servlet/com.datapro.eibs.internet.JSESS5801">
<INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="0200">
<H3 align="center">Pagos de Navieras por Internet<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="enter_customer, ESS5801"></H3>
<hr size="4">  
 <table  id=cfTable class="tableinfo">
    <tr > 
      <td NOWRAP valign="top" width="100%"> 
        <table id="headTable" width="100%">
          <TR id="trdark">
				<TD width="224">CLIENTE :</TD>
				<TD width="997">
				   <input type="text" ID="MANDATORY" name="E01INPCUN" size="12" maxlength="9" value="" >
				   <a href="javascript:GetCustomerDescId('E01INPCUN','E01INPCUN','')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="help" align="bottom" border="0" ></a>
				</TD>
		  </TR>
		  <TR id="trclear">
		     <TD width="224">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</TD>
			 <TD width="997"></TD>
		  </TR>
          <TR id="trdark">
				<TD width="224">FECHAS DE PAGO</TD>
				<TD width="997">
				   <TABLE id="trdark">
				     <TR>
				        <TD>Desde : 
			             <INPUT NAME="SDD" TYPE="TEXT" value="<%= dd %>" maxlength="2" size="3" readonly="readonly">
  			             <INPUT NAME="SMM" TYPE="TEXT" value="<%= mm %>" maxlength="2" size="3" readonly="readonly">
			             <INPUT NAME="SYY" TYPE="TEXT" value="<%= yy %>" maxlength="4" size="5" readonly="readonly">	
			             <a href="javascript:DOBPicker(document.forms[0].SMM,document.forms[0].SDD,document.forms[0].SYY)"><img src="<%=request.getContextPath()%>/images/calendar.gif" title="ayuda" align="middle" border="0"></a>
            			    (DD-MM-AAAA) 		    
				        </TD>
				     </tr>
				     <tr>   
				        <TD>Hasta : 
			              <INPUT NAME="EDD" TYPE="TEXT" value="<%= dd %>" maxlength="2" size="3" readonly="readonly">
			              <INPUT NAME="EMM" TYPE="TEXT" value="<%= mm %>" maxlength="2" size="3" readonly="readonly">
			              <INPUT NAME="EYY" TYPE="TEXT" value="<%= yy %>" maxlength="4" size="5" readonly="readonly">	
			              <a href="javascript:DOBPicker(document.forms[0].EMM,document.forms[0].EDD,document.forms[0].EYY)"><img src="<%=request.getContextPath()%>/images/calendar.gif" title="ayuda" align="middle" border="0"></a>
             			    (DD-MM-AAAA) 		    
				        </TD>				        
				     </TR>
				   </TABLE>
				</TD>
			</TR>                 
 		</table>
  </table>
  	<table class="tbenter" width=100% align=center>
		<tr> 
	        <td><div align="center"><input id="EIBSBTN" type=submit name="Aceptar" value="Aceptar"></div></td>
	    </tr>
	</table>
  
</FORM>
</BODY>
</HTML>
