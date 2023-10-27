<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>Unidades de Vivienda Asociadas a Proyecto</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Studio">


<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.js"> </SCRIPT>

<jsp:useBean id= "msgPC" class= "datapro.eibs.beans.EPC000501Message"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>

</head>

<body >

<% 
 if ( !error.getERRNUM().equals("0")  ) {
     error.setERRNUM("0"); 
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
 }

 	int LastRow;
	try {
		LastRow = Integer.parseInt(request.getParameter("LASTROW"));
	} 
	catch (Exception e) {
		LastRow = 1;
	}
 
%>


<h3 align="center">Unidades de Vivienda Asociadas a Proyecto - Adición<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="pc_new_sch.jsp, EPC0005"></h3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEPC0005" id="form1">
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="2">
  <INPUT TYPE=HIDDEN NAME="OPT" VALUE="1">
  <INPUT TYPE=HIDDEN NAME="E01DLSSEQ" VALUE="99">            
  <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
          <tr id="trdark"> 
            <td nowrap width="35%" > 
              <div align="right"><b>Número de Proyecto : </b></div>
            </td>
            <td nowrap width="15%" > 
              <div align="left"> 
                <input type="text" name="E01PCDACC" size="12" maxlength="12" value="<%= userPO.getIdentifier().trim()%>" readonly>
              </div>
            </td>
            <td nowrap width="5%" > 
              <div align="right"><b>Cliente : </b></div>
            </td>
            <td nowrap width="45%" > 
              <div align="left"> 
                <input type="text" name="E01PCDCUN" size="11" maxlength="9" value="<%= userPO.getCusNum().trim()%>" readonly>
                <input type="text" name="D01PCDCUN" size="48" maxlength="45" value="<%= userPO.getCusName().trim()%>" readonly>
              </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <h4>Informaci&oacute;n Básica</h4>

  <%int row1 = 0; %>
  <table class="tableinfo">
    <tr > 
      <td> 
        <table cellspacing=0 cellpadding=1 width="100%" border="0" id="INFOCHG">

          <tr id="<%= (row1 % 2 == 1) ? "trdark" : "trclear" %><%row1++;%>"> 
            <td width="40%"> 
              <div align="right">Código de Unidad :</div>
            </td>
            <td width="60%"> 
              <input type="text" readonly name="E01PCDNUM" size="2" maxlength="2" value="<%= LastRow%>">
            </td>
          </tr>

          <tr id="<%= (row1 % 2 == 1) ? "trdark" : "trclear" %><%row1++;%>"> 
            <td width="40%"> 
              <div align="right">Dirección Principal :</div>
            </td>
            <td width="60%"> 
              <input type="text" name="E01PCDAD1" size="37" maxlength="35" value="<%= msgPC.getE01PCDAD1().trim()%>">
              <img src="<%=request.getContextPath()%>/images/Check.gif" title="mandatory field" align="bottom" border="0" > 
            </td>
          </tr>

          <tr id="<%= (row1 % 2 == 1) ? "trdark" : "trclear" %><%row1++;%>"> 
            <td width="40%"> 
              <div align="right"> </div>
            </td>
            <td width="60%"> 
              <input type="text" name="E01PCDAD2" size="37" maxlength="35" value="<%= msgPC.getE01PCDAD2().trim()%>">
            </td>
          </tr>

          <tr id="<%= (row1 % 2 == 1) ? "trdark" : "trclear" %><%row1++;%>"> 
            <td width="40%"> 
              <div align="right"> </div>
            </td>
            <td width="60%"> 
              <input type="text" name="E01PCDAD3" size="37" maxlength="35" value="<%= msgPC.getE01PCDAD3().trim()%>">
            </td>
          </tr>

          <tr id="<%= (row1 % 2 == 1) ? "trdark" : "trclear" %><%row1++;%>"> 
            <td width="40%"> 
              <div align="right"> </div>
            </td>
            <td width="60%"> 
              <input type="text" name="E01PCDAD4" size="37" maxlength="35" value="<%= msgPC.getE01PCDAD4().trim()%>">
            </td>
          </tr>

          <tr id="<%= (row1 % 2 == 1) ? "trdark" : "trclear" %><%row1++;%>"> 
            <td width="40%"> 
              <div align="right">Estado :</div>
            </td>
            <td width="60%"> 
				<input type="text" name="E01PCDSTE" size="5" maxlength="4" value="<%= msgPC.getE01PCDSTE().trim()%>">
              <img src="<%=request.getContextPath()%>/images/Check.gif" title="mandatory field" align="bottom" border="0" > 
              <a href="javascript:GetCodeCNOFC('E01PCDSTE','27')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="help" align="bottom" border="0"></a> 
            </td>
          </tr>

          <tr id="<%= (row1 % 2 == 1) ? "trdark" : "trclear" %><%row1++;%>">  
            <td width="40%"> 
              <div align="right">Código de Area :</div>
            </td>
            <td width="60%"> 
	  			<input type="text" name="E01PCDZPC" size="11" maxlength="10" value="<%= msgPC.getE01PCDZPC().trim()%>">
            </td>
          </tr>

          <tr id="<%= (row1 % 2 == 1) ? "trdark" : "trclear" %><%row1++;%>"> 
            <td width="40%"> 
              <div align="right">Apartado Postal :</div>
            </td>
            <td width="60%"> 
	  			<input type="text" name="E01PCDPOB" size="11" maxlength="10" value="<%= msgPC.getE01PCDPOB().trim()%>">
            </td>
          </tr>

          <tr id="<%= (row1 % 2 == 1) ? "trdark" : "trclear" %><%row1++;%>">  
            <td width="40%"> 
              <div align="right">Ciudad :</div>
            </td>
            <td width="60%"> 
	  			<input type="text" name="E01PCDCTY" size="31" maxlength="30" value="<%= msgPC.getE01PCDCTY().trim()%>">
              <img src="<%=request.getContextPath()%>/images/Check.gif" title="mandatory field" align="bottom" border="0" > 
            </td>
          </tr>

          <tr id="<%= (row1 % 2 == 1) ? "trdark" : "trclear" %><%row1++;%>"> 
            <td width="40%"> 
              <div align="right">Pais :</div>
            </td>
            <td width="60%"> 
	  			<input type="text" name="E01PCDCTR" size="21" maxlength="20" value="<%= msgPC.getE01PCDCTR().trim()%>">
              <img src="<%=request.getContextPath()%>/images/Check.gif" title="mandatory field" align="bottom" border="0" > 
            </td>
          </tr>

          <tr id="<%= (row1 % 2 == 1) ? "trdark" : "trclear" %><%row1++;%>"> 
            <td width="40%"> 
              <div align="right">Area de Unidad :</div>
            </td>
            <td width="60%"> 
              <input type="text" name="E01PCDARA" size="8" maxlength="7" value="<%= msgPC.getE01PCDARA().trim()%>" onkeypress="enterDecimal()">
              <img src="<%=request.getContextPath()%>/images/Check.gif" title="mandatory field" align="bottom" border="0" > 
            </td>
          </tr>


          <tr id="<%= (row1 % 2 == 1) ? "trdark" : "trclear" %><%row1++;%>"> 
            <td width="40%"> 
              <div align="right">Avalúo de Unidad :</div>
            </td>
            <td width="60%"> 
              <input type="text" name="E01PCDVPR" size="17" maxlength="15" value="<%= msgPC.getE01PCDVPR().trim()%>" onkeypress="enterDecimal()">
            </td>
          </tr>

          <tr id="<%= (row1 % 2 == 1) ? "trdark" : "trclear" %><%row1++;%>"> 
            <td width="40%"> 
              <div align="right">Precio de Unidad :</div>
            </td>
            <td width="60%"> 
              <input type="text" name="E01PCDVVE" size="17" maxlength="15" value="<%= msgPC.getE01PCDVVE().trim()%>" onkeypress="enterDecimal()">
            </td>
          </tr>

          <tr id="<%= (row1 % 2 == 1) ? "trdark" : "trclear" %><%row1++;%>"> 
            <td width="40%"> 
              <div align="right">Descripción General :</div>
            </td>
            <td width="60%"> 
              <input type="text" name="E01PCDDS1" size="37" maxlength="35" value="<%= msgPC.getE01PCDDS1().trim()%>">
              <img src="<%=request.getContextPath()%>/images/Check.gif" title="mandatory field" align="bottom" border="0" > 
            </td>
          </tr>

          <tr id="<%= (row1 % 2 == 1) ? "trdark" : "trclear" %><%row1++;%>"> 
            <td width="40%"> 
              <div align="right"> </div>
            </td>
            <td width="60%"> 
              <input type="text" name="E01PCDDS2" size="37" maxlength="35" value="<%= msgPC.getE01PCDDS2().trim()%>">
            </td>
          </tr>

          <tr id="<%= (row1 % 2 == 1) ? "trdark" : "trclear" %><%row1++;%>"> 
            <td width="40%"> 
              <div align="right"> </div>
            </td>
            <td width="60%"> 
              <input type="text" name="E01PCDDS3" size="37" maxlength="35" value="<%= msgPC.getE01PCDDS3().trim()%>">
            </td>
          </tr>

          <tr id="<%= (row1 % 2 == 1) ? "trdark" : "trclear" %><%row1++;%>"> 
            <td width="40%"> 
              <div align="right"> </div>
            </td>
            <td width="60%"> 
              <input type="text" name="E01PCDDS4" size="37" maxlength="35" value="<%= msgPC.getE01PCDDS4().trim()%>">
            </td>
          </tr>


        </table>                       
      </td>
    </tr>
  </table>
  <p>
  <div align="center"> 
    <input id="EIBSBTN" type=submit name="Submit" value="Enviar">
  </div>
</form>
</body>
</html>
