<%@ page import ="datapro.eibs.master.Util" %>
<HTML>
<HEAD>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<TITLE>Incoming Swift Message</TITLE>
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "msgSwift" class= "datapro.eibs.beans.JBObjList"  scope="session" />

<script type="text/javascript">
//<!-- Hide from old browsers
function ok() {
	top.close();
 }
//-->
</script>
</HEAD>
<BODY>
<FORM  action="javascript:ok()">
 <%
 	String txt = ""; 
	if ( !msgSwift.getNoResult() ) {
		 
		 msgSwift.initRow();
		 while (msgSwift.getNextRow()) {
                 
         	datapro.eibs.beans.ELC051502Message msgLC = (datapro.eibs.beans.ELC051502Message) msgSwift.getRecord();
         	txt = txt + msgLC.getE02SWIMLN() + "\n";
         }
	}
 %>


<table align=center width="100%" id="tbhelp">
  <TR> 
    <TH> 
      <div align="left">Incoming Swift Message :
        <hr>
      </div>
    </TH>
  </TR>
  <TR> 
    <TD align="center">
		<textarea cols="81" rows="30" name="txtMsg" readonly ><%= txt%></textarea>
    </TD>
  </TR>
</table>
<P align="center">
<a href="javascript:ok()"><b> Cerrar </b></a>
</P>
</FORM>
</BODY>
</HTML>
