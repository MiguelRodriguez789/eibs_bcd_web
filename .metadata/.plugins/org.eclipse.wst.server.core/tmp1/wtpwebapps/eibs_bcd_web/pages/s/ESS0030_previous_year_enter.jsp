<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
<HEAD>
<META name="GENERATOR" content="IBM WebSphere Page Designer V4.0 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<LINK HREF="<%=request.getContextPath()%>/pages/style.css" REL="stylesheet">
<TITLE>eIBS Log In</TITLE>

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" /> 
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>

<SCRIPT type="text/javascript">
	function setLayout() {
		setCenterSize(310, 200);
	}  
</SCRIPT>
</HEAD>
<BODY>
<h3 align="center">Período Anterior<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="previous_year_enter, ESS0030"></h3>
<hr size="4">
<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/servlet/datapro.eibs.menu.JSESS0030PYC">
	<INPUT TYPE="hidden" NAME="SCREEN" VALUE="2">
  <h4>Selección del Período Anterior</h4>
 
  <table class="tableinfo">
      	<TR>
        	<TD ALIGN=right width="40%" valign="middle"><B>Año :</B> </TD>
			<TD nowrap width="70%"> 
            	<select name="PYEAR">
            	<%	int years = currUser.getBigDecimalE01PYN().intValue()+1;
            		//TODO Configure, for now 4 Years
            		for(int i=1; i<years;i++){
            			String year = datapro.eibs.master.Util.formatYear(
            				currUser.getBigDecimalE01RDY().intValue()-i);
	                  	out.print("<option value=\"" + i + "\">" + year + "</option>");
    	            }
     			%>
				</select>
			</TD>
   	 	</TR>
   	</TABLE>
  
   	<BR>
     
   	<TABLE class="tbenter" WIDTH="100%" BORDER=0>
    	<TR> 
        	<TD vALIGN=middle> 
			 <p align="center"> 
			    <input id="EIBSBTN" type="submit" name="Submit" value="Enviar">
			  </p>  
        	</TD>
      	</TR>
    </TABLE>

		 
 </FORM>  

</BODY>
</HTML>
