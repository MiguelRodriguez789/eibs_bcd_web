<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<title>Detalle de Chequeras</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">


<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>

<jsp:useBean id= "msgChb" class= "datapro.eibs.beans.ECL0201DSMessage"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>

</head>
<body >
<h3 align="center">Operaciones del Cliente<br>Detalle de Chequeras<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="chb_detail.jsp, ECL0201"> 
</h3>
<hr size="4">
<% 
	String bnk = "";
	String brn = "";
	String dv = "";
	String acc = "";
	
	try {
		bnk = msgChb.getE01NROCTA().substring(0,4);
	}
	catch (Exception e) {}
	try {
		brn = "XXXX";
	}
	catch (Exception e) {}
	try {
		dv = "XX";
	}
	catch (Exception e) {}
	try {
		acc = "XXXX" + msgChb.getE01NROCTA().substring(16,20);
	}
	catch (Exception e) {}

	if ( !error.getERRNUM().equals("0")  ) {
		//error.setERRNUM("0");
		out.println("<SCRIPT Language=\"Javascript\">");
		out.println("       showErrors()");
		out.println("</SCRIPT>");
	}
 
%> 
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.misc.JSECL0201" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="">

  <h4>Información Básica</h4>
  <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="trdark"> 
            <td nowrap width="16%"> 
              <div align="right">Número de Cuenta :</div>
            </td>
            <td nowrap width="20%"> 
              <div align="left"> 
              	<input type="hidden" name="E01NROCTA" value="<%= msgChb.getE01NROCTA().trim()%>">
              	<input type="text" name="E01NROCTA1" size="3" maxlength="2" value="<%= bnk %>" readonly>
              	<input type="text" name="E01NROCTA2" size="5" maxlength="4" value="<%= brn %>" readonly>
              	<input type="text" name="E01NROCTA3" size="4" maxlength="3" value="<%= dv %>" readonly>
              	<input type="text" name="E01NROCTA4" size="13" maxlength="12" value="<%= acc %>" readonly>
              </div>
            </td>
            <td nowrap width="16%"> 
              <div align="right">Moneda :</div>
            </td>
            <td nowrap width="20%"> 
              <div align="left"> 
                <input type="text" name="E01MONEDA" size="4" maxlength="3" value="<%= msgChb.getE01MONEDA().trim()%>" readonly>
			  </div>
            </td>
          </tr>    
          <tr id="trclear"> 
            <td nowrap width="16%"> 
              <div align="right">Identificación del Cliente :</div>
            </td>
            <td nowrap width="16%"> 
              <div align="left"> 
              	<input type="text" name="E01TIIDCL" size="2" maxlength="1" value="<%= msgChb.getE01TIIDCL().trim()%>" readonly>
              	<input type="text" name="E01NRIDCL" size="10" maxlength="9" value="<%= msgChb.getE01NRIDCL().trim()%>" readonly>
              </div>
            </td>
            <td nowrap width="16%"> 
              <div align="right">Nombre del Cliente :</div>
            </td>
            <td nowrap width="16%"> 
              <div align="left"> 
                <input type="text" name="E01NOMCLI" size="36" maxlength="35" value="<%= msgChb.getE01NOMCLI().trim()%>" readonly>
              </div>
            </td>
          </tr>    
          <tr id="trdark"> 
            <td nowrap width="16%"> 
              <div align="right">Número de Chequera :</div>
            </td>
            <td nowrap width="16%"> 
				<DIV align="left">
					<INPUT type="text" name="E01NROSER" size="7" maxlength="6" value="<%= msgChb.getE01NROSER().trim()%>" readonly>
				</DIV>
            </td>
            <td nowrap width="16%"> 
            </td>
            <td nowrap width="16%"> 
            </td>
          </tr>    
        </table>
      </td>
    </tr>
  </table>

  <h4>Detalle de Cheques</h4>
  <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
        <%
        	String st1 = "";
        	String st2 = "";
        	String st3 = "";
        	String st4 = "";
        	String st5 = "";
        	String chk1 = "";
        	String chk2 = "";
        	String chk3 = "";
        	String chk4 = "";
        	String chk5 = "";
        	String cheini = msgChb.getE01CHEINI();
        	long chk = Long.parseLong(cheini);
        	chk--;
        	for (int i=0; i<5; i++) {
        		for (int j=0; j<5; j++) {
       				String field = "E01CHQ00" + ((i*5) + 1 + j);
       				String field2 = "E01CHQ0" + ((i*5) + 1 + j);
        			if (j == 0) {
		        		if (((i*5)+1+j) < 10) {
			        		if (msgChb.getField(field).getString().equals("S")) st1 = "[S]uspendido";
			        		else if (msgChb.getField(field).getString().equals("D")) st1 = "[D]isponible";
			        		else if (msgChb.getField(field).getString().equals("P")) st1 = "[P]agado";
			        		else if (msgChb.getField(field).getString().equals("C")) st1 = "[C]onformado";
			        		else if (msgChb.getField(field).getString().equals("A")) st1 = "[A]nulado";
			        		else if (msgChb.getField(field).getString().equals("F")) st1 = "Suspendido por Telé[F]ono";
			        		else if (msgChb.getField(field).getString().equals("T")) st1 = "Suspendido por [T]aquilla";
			        		else if (msgChb.getField(field).getString().equals("K")) st1 = "[K] En Proceso";
			        		else if (msgChb.getField(field).getString().equals("I")) st1 = "[I]nexistente";
			        		else if (msgChb.getField(field).getString().equals("X")) st1 = "[X] Protestado";
			        		else if (msgChb.getField(field).getString().equals("Z")) st1 = "[Z] Cheque Corresponsal Pagado y Suspendido";
			        	}
			        	else {
			        		if (msgChb.getField(field2).getString().equals("S")) st1 = "[S]uspendido";
			        		else if (msgChb.getField(field2).getString().equals("D")) st1 = "[D]isponible";
			        		else if (msgChb.getField(field2).getString().equals("P")) st1 = "[P]agado";
			        		else if (msgChb.getField(field2).getString().equals("C")) st1 = "[C]onformado";
			        		else if (msgChb.getField(field2).getString().equals("A")) st1 = "[A]nulado";
			        		else if (msgChb.getField(field2).getString().equals("F")) st1 = "Suspendido por Telé[F]ono";
			        		else if (msgChb.getField(field2).getString().equals("T")) st1 = "Suspendido por [T]aquilla";
			        		else if (msgChb.getField(field2).getString().equals("K")) st1 = "[K] En Proceso";
			        		else if (msgChb.getField(field2).getString().equals("I")) st1 = "[I]nexistente";
			        		else if (msgChb.getField(field2).getString().equals("X")) st1 = "[X] Protestado";
			        		else if (msgChb.getField(field2).getString().equals("Z")) st1 = "[Z] Cheque Corresponsal Pagado y Suspendido";
			        	}
			        }
			        else if (j == 1) {
		        		if (((i*5)+1+j) < 10) {
			        		if (msgChb.getField(field).getString().equals("S")) st2 = "[S]uspendido";
			        		else if (msgChb.getField(field).getString().equals("D")) st2 = "[D]isponible";
			        		else if (msgChb.getField(field).getString().equals("P")) st2 = "[P]agado";
			        		else if (msgChb.getField(field).getString().equals("C")) st2 = "[C]onformado";
			        		else if (msgChb.getField(field).getString().equals("A")) st2 = "[A]nulado";
			        		else if (msgChb.getField(field).getString().equals("F")) st2 = "Suspendido por Telé[F]ono";
			        		else if (msgChb.getField(field).getString().equals("T")) st2 = "Suspendido por [T]aquilla";
			        		else if (msgChb.getField(field).getString().equals("K")) st2 = "[K] En Proceso";
			        		else if (msgChb.getField(field).getString().equals("I")) st2 = "[I]nexistente";
			        		else if (msgChb.getField(field).getString().equals("X")) st2 = "[X] Protestado";
			        		else if (msgChb.getField(field).getString().equals("Z")) st2 = "[Z] Cheque Corresponsal Pagado y Suspendido";
			        	}
			        	else {
			        		if (msgChb.getField(field2).getString().equals("S")) st2 = "[S]uspendido";
			        		else if (msgChb.getField(field2).getString().equals("D")) st2 = "[D]isponible";
			        		else if (msgChb.getField(field2).getString().equals("P")) st2 = "[P]agado";
			        		else if (msgChb.getField(field2).getString().equals("C")) st2 = "[C]onformado";
			        		else if (msgChb.getField(field2).getString().equals("A")) st2 = "[A]nulado";
			        		else if (msgChb.getField(field2).getString().equals("F")) st2 = "Suspendido por Telé[F]ono";
			        		else if (msgChb.getField(field2).getString().equals("T")) st2 = "Suspendido por [T]aquilla";
			        		else if (msgChb.getField(field2).getString().equals("K")) st2 = "[K] En Proceso";
			        		else if (msgChb.getField(field2).getString().equals("I")) st2 = "[I]nexistente";
			        		else if (msgChb.getField(field2).getString().equals("X")) st2 = "[X] Protestado";
			        		else if (msgChb.getField(field2).getString().equals("Z")) st2 = "[Z] Cheque Corresponsal Pagado y Suspendido";
			        	}
			        }
			        else if (j == 2) {
		        		if (((i*5)+1+j) < 10) {
			        		if (msgChb.getField(field).getString().equals("S")) st3 = "[S]uspendido";
			        		else if (msgChb.getField(field).getString().equals("D")) st3 = "[D]isponible";
			        		else if (msgChb.getField(field).getString().equals("P")) st3 = "[P]agado";
			        		else if (msgChb.getField(field).getString().equals("C")) st3 = "[C]onformado";
			        		else if (msgChb.getField(field).getString().equals("A")) st3 = "[A]nulado";
			        		else if (msgChb.getField(field).getString().equals("F")) st3 = "Suspendido por Telé[F]ono";
			        		else if (msgChb.getField(field).getString().equals("T")) st3 = "Suspendido por [T]aquilla";
			        		else if (msgChb.getField(field).getString().equals("K")) st3 = "[K] En Proceso";
			        		else if (msgChb.getField(field).getString().equals("I")) st3 = "[I]nexistente";
			        		else if (msgChb.getField(field).getString().equals("X")) st3 = "[X] Protestado";
			        		else if (msgChb.getField(field).getString().equals("Z")) st3 = "[Z] Cheque Corresponsal Pagado y Suspendido";
			        	}
			        	else {
			        		if (msgChb.getField(field2).getString().equals("S")) st3 = "[S]uspendido";
			        		else if (msgChb.getField(field2).getString().equals("D")) st3 = "[D]isponible";
			        		else if (msgChb.getField(field2).getString().equals("P")) st3 = "[P]agado";
			        		else if (msgChb.getField(field2).getString().equals("C")) st3 = "[C]onformado";
			        		else if (msgChb.getField(field2).getString().equals("A")) st3 = "[A]nulado";
			        		else if (msgChb.getField(field2).getString().equals("F")) st3 = "Suspendido por Telé[F]ono";
			        		else if (msgChb.getField(field2).getString().equals("T")) st3 = "Suspendido por [T]aquilla";
			        		else if (msgChb.getField(field2).getString().equals("K")) st3 = "[K] En Proceso";
			        		else if (msgChb.getField(field2).getString().equals("I")) st3 = "[I]nexistente";
			        		else if (msgChb.getField(field2).getString().equals("X")) st3 = "[X] Protestado";
			        		else if (msgChb.getField(field2).getString().equals("Z")) st3 = "[Z] Cheque Corresponsal Pagado y Suspendido";
			        	}
			        }
			        else if (j == 3) {
		        		if (((i*5)+1+j) < 10) {
			        		if (msgChb.getField(field).getString().equals("S")) st4 = "[S]uspendido";
			        		else if (msgChb.getField(field).getString().equals("D")) st4 = "[D]isponible";
			        		else if (msgChb.getField(field).getString().equals("P")) st4 = "[P]agado";
			        		else if (msgChb.getField(field).getString().equals("C")) st4 = "[C]onformado";
			        		else if (msgChb.getField(field).getString().equals("A")) st4 = "[A]nulado";
			        		else if (msgChb.getField(field).getString().equals("F")) st4 = "Suspendido por Telé[F]ono";
			        		else if (msgChb.getField(field).getString().equals("T")) st4 = "Suspendido por [T]aquilla";
			        		else if (msgChb.getField(field).getString().equals("K")) st4 = "[K] En Proceso";
			        		else if (msgChb.getField(field).getString().equals("I")) st4 = "[I]nexistente";
			        		else if (msgChb.getField(field).getString().equals("X")) st4 = "[X] Protestado";
			        		else if (msgChb.getField(field).getString().equals("Z")) st4 = "[Z] Cheque Corresponsal Pagado y Suspendido";
			        	}
			        	else {
			        		if (msgChb.getField(field2).getString().equals("S")) st4 = "[S]uspendido";
			        		else if (msgChb.getField(field2).getString().equals("D")) st4 = "[D]isponible";
			        		else if (msgChb.getField(field2).getString().equals("P")) st4 = "[P]agado";
			        		else if (msgChb.getField(field2).getString().equals("C")) st4 = "[C]onformado";
			        		else if (msgChb.getField(field2).getString().equals("A")) st4 = "[A]nulado";
			        		else if (msgChb.getField(field2).getString().equals("F")) st4 = "Suspendido por Telé[F]ono";
			        		else if (msgChb.getField(field2).getString().equals("T")) st4 = "Suspendido por [T]aquilla";
			        		else if (msgChb.getField(field2).getString().equals("K")) st4 = "[K] En Proceso";
			        		else if (msgChb.getField(field2).getString().equals("I")) st4 = "[I]nexistente";
			        		else if (msgChb.getField(field2).getString().equals("X")) st4 = "[X] Protestado";
			        		else if (msgChb.getField(field2).getString().equals("Z")) st4 = "[Z] Cheque Corresponsal Pagado y Suspendido";
			        	}
			        }
			        else if (j == 4) {
		        		if (((i*5)+1+j) < 10) {
			        		if (msgChb.getField(field).getString().equals("S")) st5 = "[S]uspendido";
			        		else if (msgChb.getField(field).getString().equals("D")) st5 = "[D]isponible";
			        		else if (msgChb.getField(field).getString().equals("P")) st5 = "[P]agado";
			        		else if (msgChb.getField(field).getString().equals("C")) st5 = "[C]onformado";
			        		else if (msgChb.getField(field).getString().equals("A")) st5 = "[A]nulado";
			        		else if (msgChb.getField(field).getString().equals("F")) st5 = "Suspendido por Telé[F]ono";
			        		else if (msgChb.getField(field).getString().equals("T")) st5 = "Suspendido por [T]aquilla";
			        		else if (msgChb.getField(field).getString().equals("K")) st5 = "[K] En Proceso";
			        		else if (msgChb.getField(field).getString().equals("I")) st5 = "[I]nexistente";
			        		else if (msgChb.getField(field).getString().equals("X")) st5 = "[X] Protestado";
			        		else if (msgChb.getField(field).getString().equals("Z")) st5 = "[Z] Cheque Corresponsal Pagado y Suspendido";
			        	}
			        	else {
			        		if (msgChb.getField(field2).getString().equals("S")) st5 = "[S]uspendido";
			        		else if (msgChb.getField(field2).getString().equals("D")) st5 = "[D]isponible";
			        		else if (msgChb.getField(field2).getString().equals("P")) st5 = "[P]agado";
			        		else if (msgChb.getField(field2).getString().equals("C")) st5 = "[C]onformado";
			        		else if (msgChb.getField(field2).getString().equals("A")) st5 = "[A]nulado";
			        		else if (msgChb.getField(field2).getString().equals("F")) st5 = "Suspendido por Telé[F]ono";
			        		else if (msgChb.getField(field2).getString().equals("T")) st5 = "Suspendido por [T]aquilla";
			        		else if (msgChb.getField(field2).getString().equals("K")) st5 = "[K] En Proceso";
			        		else if (msgChb.getField(field2).getString().equals("I")) st5 = "[I]nexistente";
			        		else if (msgChb.getField(field2).getString().equals("X")) st5 = "[X] Protestado";
			        		else if (msgChb.getField(field2).getString().equals("Z")) st5 = "[Z] Cheque Corresponsal Pagado y Suspendido";
			        	}
			        }
		        }
		        
		        chk1 = "" + ((i*5)+1 + (chk));
		        if (chk1.length() == 8) chk1 = chk1.substring(0,2) + "XXXX" + chk1.substring(6,8);
		        else if (chk1.length() == 8) chk1 = chk1.substring(1,3) + "XXXX" + chk1.substring(7,9);
		        else chk1 = chk1.substring(2,4) + "XXXX" + chk1.substring(8,10);
		        
		        chk2 = "" + ((i*5)+2 + (chk));
		        if (chk2.length() == 8) chk2 = chk2.substring(0,2) + "XXXX" + chk2.substring(6,8);
		        else if (chk2.length() == 8) chk2 = chk2.substring(1,3) + "XXXX" + chk2.substring(7,9);
		        else chk2 = chk2.substring(2,4) + "XXXX" + chk2.substring(8,10);

		        chk3 = "" + ((i*5)+3 + (chk));
		        if (chk3.length() == 8) chk3 = chk3.substring(0,2) + "XXXX" + chk3.substring(6,8);
		        else if (chk3.length() == 8) chk3 = chk3.substring(1,3) + "XXXX" + chk3.substring(7,9);
		        else chk3 = chk3.substring(2,4) + "XXXX" + chk3.substring(8,10);

		        chk4 = "" + ((i*5)+4 + (chk));
		        if (chk4.length() == 8) chk4 = chk4.substring(0,2) + "XXXX" + chk4.substring(6,8);
		        else if (chk4.length() == 8) chk4 = chk4.substring(1,3) + "XXXX" + chk4.substring(7,9);
		        else chk4 = chk4.substring(2,4) + "XXXX" + chk4.substring(8,10);

		        chk5 = "" + ((i*5)+5 + (chk));
		        if (chk5.length() == 8) chk5 = chk5.substring(0,2) + "XXXX" + chk5.substring(6,8);
		        else if (chk5.length() == 8) chk5 = chk5.substring(1,3) + "XXXX" + chk5.substring(7,9);
		        else chk5 = chk5.substring(2,4) + "XXXX" + chk5.substring(8,10);
        %>
          <tr id="trdark"> 
            <td nowrap width="20%"> 
              <div align="center">Cheque <%= chk1 %></div>
            </td>
            <td nowrap width="20%"> 
              <div align="center">Cheque <%= chk2 %></div>
            </td>
            <td nowrap width="20%"> 
              <div align="center">Cheque <%= chk3 %></div>
            </td>
            <td nowrap width="20%"> 
              <div align="center">Cheque <%= chk4 %></div>
            </td>
            <td nowrap width="20%"> 
              <div align="center">Cheque <%= chk5 %></div>
            </td>
          </tr>    
          <tr id="trclear"> 
            <td nowrap width="20%"> 
              <div align="center"> 
              	<input type="text" name="E01CHQ00<%= (i*5)+1 %>" size="13" maxlength="11" value="<%= st1 %>" readonly>
              </div>
            </td>
            <td nowrap width="20%"> 
              <div align="center"> 
              	<input type="text" name="E01CHQ00<%= (i*5)+2 %>" size="13" maxlength="11" value="<%= st2 %>" readonly>
              </div>
            </td>
            <td nowrap width="20%"> 
              <div align="center"> 
              	<input type="text" name="E01CHQ00<%= (i*5)+3 %>" size="13" maxlength="11" value="<%= st3 %>" readonly>
              </div>
            </td>
            <td nowrap width="20%"> 
              <div align="center"> 
              	<input type="text" name="E01CHQ00<%= (i*5)+4 %>" size="13" maxlength="11" value="<%= st4 %>" readonly>
              </div>
            </td>
            <td nowrap width="20%"> 
              <div align="center"> 
              	<input type="text" name="E01CHQ00<%= (i*5)+5 %>" size="13" maxlength="11" value="<%= st5 %>" readonly>
              </div>
            </td>
          </tr>    
        <%
        	}
        %>
        </table>
      </td>
    </tr>
  </table>

</form>
</body>
</html>
