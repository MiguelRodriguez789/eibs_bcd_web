<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<%@ page import = "datapro.eibs.master.Util" %>
<head>
<title>Cost Center Descriptions Maintenance</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V4.0 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id="msg" class="datapro.eibs.beans.EDL052801Message"  scope="session" />
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"   scope="session"/>
<jsp:useBean id="error" class="datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="userPO" class="datapro.eibs.beans.UserPos" scope="session" />

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>

</head>

<body bgcolor="#FFFFFF">

 <%
 if ( !error.getERRNUM().equals("0")  ) {
     error.setERRNUM("0") ;
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
 }
%>

<h3 align="center">Indicadores Metodología<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="ind_detail, JSEDL0528" ></h3>
<hr size="4">
 <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/servlet/datapro.eibs.params.JSEDL0528" >
  <p>
    <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="4">
    <INPUT TYPE=HIDDEN NAME="OPT" VALUE="<%= userPO.getPurpose()%>">
  </p>
  <table  class="tableinfo">
    <tr >
      <td nowrap>
        <table cellspacing="0" cellpadding="2" width="100%" border="0">

          <tr id="trdark">
            <td nowrap>
               <div align="right">Indicador :</div>
            </td>
            <td nowrap>
              <input type="text" name="E01TADIND" size="3" maxlength="2" value="<%= msg.getE01TADIND().trim()%>" <% if (!userPO.getPurpose().equals("N")) out.print("readonly");%>>
              <a href="javascript:GetCodeDescCNOFC('E01TADIND','E01TADDSC','AD')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt=". . ." align="absbottom" border="0"  ></a>
             </td>
            <td nowrap>
            	<div align="right">Descripción :</div>
            </td>
            <td nowrap>
            <input type="text" name="E01TADDSC" size="50" maxlength="45" value="<%= msg.getE01TADDSC().trim()%>" readonly></td>
          </tr>
          <tr id="trclear">
            <td nowrap>
              <div align="right">Año :</div>
            </td>
            <td nowrap>
		 		<INPUT type="text" name="E01TADCPY" size="5" maxlength="4" value="<%= "0".equals(msg.getE01TADCPY().trim())?currUser.getE01RDY():msg.getE01TADCPY() %>" readonly>
			 </td>
            <td nowrap>
           	  <div align="right">Mes :</div>
            </td>
            <td nowrap>
           		<INPUT type="text" name="E01TADCPM" size="3" maxlength="2" value="<%= "0".equals(msg.getE01TADCPM().trim())?currUser.getE01RDM():msg.getE01TADCPM() %>" readonly>
            </td>
          </tr>
          <tr id="trdark">
            <td nowrap>
              <div align="center"><b>Condición :</b></div>
            </td>
            <td nowrap>
			  <div align="center"><b>Descripción :</b></div>
            </td>
            <td nowrap>
			  <div align="center"><b></b></div>
            </td>
            <td nowrap>
			  <div align="center"><b>Valor :</b></div>
            </td>
          </tr>

          <tr id="trclear">
            <td nowrap align="center">
            <input type="text" name="E01TADCD1" size="3" maxlength="2" value="<%= msg.getE01TADCD1().trim()%>"></td>
            <td nowrap align="center">
            <input type="text" name="E01TADDD1" size="50" maxlength="45" value="<%= msg.getE01TADDD1().trim()%>" readonly></td>
            <td nowrap align="center">
            <a href="javascript:GetCodeDescCNOFC('E01TADCD1','E01TADDD1','CD')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt=". . ." align="absbottom" border="0"  ></a>
            </td>
            <td nowrap align="center">
            <input type="text" name="E01TADVL1" size="20" maxlength="18" value="<%= msg.getE01TADVL1().trim()%>"></td>
          </tr>
           <tr id="trclear">
            <td nowrap align="center">
            <input type="text" name="E01TADCD2" size="3" maxlength="2" value="<%= msg.getE01TADCD2().trim()%>"></td>
            <td nowrap align="center">
            <input type="text" name="E01TADDD2" size="50" maxlength="45" value="<%= msg.getE01TADDD2().trim()%>" readonly></td>
            <td nowrap align="center">
            <a href="javascript:GetCodeDescCNOFC('E01TADCD2','E01TADDD2','CD')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt=". . ." align="absbottom" border="0"  ></a>
            </td>
            <td nowrap align="center">
            <input type="text" name="E01TADVL2" size="20" maxlength="18" value="<%= msg.getE01TADVL2().trim()%>"></td>
          </tr>
           <tr id="trclear">
            <td nowrap align="center">
            <input type="text" name="E01TADCD3" size="3" maxlength="2" value="<%= msg.getE01TADCD3().trim()%>"></td>
            <td nowrap align="center">
            <input type="text" name="E01TADDD3" size="50" maxlength="45" value="<%= msg.getE01TADDD3().trim()%>" readonly></td>
            <td nowrap align="center">
            <a href="javascript:GetCodeDescCNOFC('E01TADCD3','E01TADDD3','CD')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt=". . ." align="absbottom" border="0"  ></a>
            </td>
            <td nowrap align="center">
            <input type="text" name="E01TADVL3" size="20" maxlength="18" value="<%= msg.getE01TADVL3().trim()%>"></td>
          </tr>
           <tr id="trclear">
            <td nowrap align="center">
            <input type="text" name="E01TADCD4" size="3" maxlength="2" value="<%= msg.getE01TADCD4().trim()%>"></td>
            <td nowrap align="center">
            <input type="text" name="E01TADDD4" size="50" maxlength="45" value="<%= msg.getE01TADDD4().trim()%>" readonly></td>
            <td nowrap align="center">
            <a href="javascript:GetCodeDescCNOFC('E01TADCD4','E01TADDD4','CD')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt=". . ." align="absbottom" border="0"  ></a>
            </td>
            <td nowrap align="center">
            <input type="text" name="E01TADVL4" size="20" maxlength="18" value="<%= msg.getE01TADVL4().trim()%>"></td>
          </tr>
           <tr id="trclear">
            <td nowrap align="center">
            <input type="text" name="E01TADCD5" size="3" maxlength="2" value="<%= msg.getE01TADCD5().trim()%>"></td>
            <td nowrap align="center">
            <input type="text" name="E01TADDD5" size="50" maxlength="45" value="<%= msg.getE01TADDD5().trim()%>" readonly></td>
            <td nowrap align="center">
            <a href="javascript:GetCodeDescCNOFC('E01TADCD5','E01TADDD5','CD')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt=". . ." align="absbottom" border="0"  ></a>
            </td>
            <td nowrap align="center">
            <input type="text" name="E01TADVL5" size="20" maxlength="18" value="<%= msg.getE01TADVL5().trim()%>"></td>
          </tr>
           <tr id="trclear">
            <td nowrap align="center">
            <input type="text" name="E01TADCD6" size="3" maxlength="2" value="<%= msg.getE01TADCD6().trim()%>"></td>
            <td nowrap align="center">
            <input type="text" name="E01TADDD6" size="50" maxlength="45" value="<%= msg.getE01TADDD6().trim()%>" readonly></td>
            <td nowrap align="center">
            <a href="javascript:GetCodeDescCNOFC('E01TADCD6','E01TADDD6','CD')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt=". . ." align="absbottom" border="0"  ></a>
            </td>
            <td nowrap align="center">
            <input type="text" name="E01TADVL6" size="20" maxlength="18" value="<%= msg.getE01TADVL6().trim()%>"></td>
          </tr>
           <tr id="trclear">
            <td nowrap align="center">
            <input type="text" name="E01TADCD7" size="3" maxlength="2" value="<%= msg.getE01TADCD7().trim()%>"></td>
            <td nowrap align="center">
            <input type="text" name="E01TADDD7" size="50" maxlength="45" value="<%= msg.getE01TADDD7().trim()%>" readonly></td>
            <td nowrap align="center">
            <a href="javascript:GetCodeDescCNOFC('E01TADCD7','E01TADDD7','CD')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt=". . ." align="absbottom" border="0"  ></a>
            </td>
            <td nowrap align="center">
            <input type="text" name="E01TADVL7" size="20" maxlength="18" value="<%= msg.getE01TADVL7().trim()%>"></td>
          </tr>
           <tr id="trclear">
            <td nowrap align="center">
            <input type="text" name="E01TADCD8" size="3" maxlength="2" value="<%= msg.getE01TADCD8().trim()%>"></td>
            <td nowrap align="center">
            <input type="text" name="E01TADDD8" size="50" maxlength="45" value="<%= msg.getE01TADDD8().trim()%>" readonly></td>
            <td nowrap align="center">
            <a href="javascript:GetCodeDescCNOFC('E01TADCD8','E01TADDD18','CD')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt=". . ." align="absbottom" border="0"  ></a>
            </td>
            <td nowrap align="center">
            <input type="text" name="E01TADVL8" size="20" maxlength="18" value="<%= msg.getE01TADVL8().trim()%>"></td>
          </tr>
           <tr id="trclear">
            <td nowrap align="center">
            <input type="text" name="E01TADCD9" size="3" maxlength="2" value="<%= msg.getE01TADCD9().trim()%>"></td>
            <td nowrap align="center">
            <input type="text" name="E01TADDD9" size="50" maxlength="45" value="<%= msg.getE01TADDD9().trim()%>" readonly></td>
            <td nowrap align="center">
            <a href="javascript:GetCodeDescCNOFC('E01TADCD9','E01TADDD9','CD')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt=". . ." align="absbottom" border="0"  ></a>
            </td>
            <td nowrap align="center">
            <input type="text" name="E01TADVL9" size=20 maxlength="9" value="<%= msg.getE01TADVL9().trim()%>"></td>
          </tr>
           <tr id="trclear">
            <td nowrap align="center">
            <input type="text" name="E01TADC10" size="3" maxlength="2" value="<%= msg.getE01TADC10().trim()%>"></td>
            <td nowrap align="center">
            <input type="text" name="E01TADD10" size="50" maxlength="45" value="<%= msg.getE01TADD10().trim()%>" readonly></td>
            <td nowrap align="center">
            <a href="javascript:GetCodeDescCNOFC('E01TADC10','E01TADD10','CD')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt=". . ." align="absbottom" border="0"  ></a>
            </td>
            <td nowrap align="center">
            <input type="text" name="E01TADP10" size="20" maxlength="9" value="<%= msg.getE01TADP10().trim()%>"></td>
          </tr>
           
    </table>
      </td>
    </tr>
  </table>

  <br>
   <p align="center">
    <input id="EIBSBTN" type=submit name="Submit" value="Enviar">
  </p>
</form>
</body>
</html>

