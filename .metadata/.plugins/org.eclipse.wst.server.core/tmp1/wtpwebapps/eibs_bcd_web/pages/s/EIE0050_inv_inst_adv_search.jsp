<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session"/>

<script type="text/javascript">
function enter(){
	  document.forms[0].submit();
	 }
</script>

<META name="GENERATOR" content="IBM WebSphere Studio">
</head>
<body>

 
 <% 
 if ( !error.getERRNUM().equals("0")  ) {
     out.println("<SCRIPT Language=\"Javascript\">");
     error.setERRNUM("0");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
    }
%>
 <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/servlet/datapro.eibs.invest.JSEWD0308P" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="1">
  <center>
    <table class="tbenter" height="55%" width="100%" border="0">
      <tr> 
        <td nowrap align="center"> 
          <table class="tableinfo">
            <tr> 
              <td> 
                <table id="tbenter" width="100%" border="0" cellspacing="1" cellpadding="0">
                  <tr id="trdark"> 
                    <td valign="middle" align="center" colspan="3" height=33> 
                      <b>Administración Instrumentos - Búsqueda Avanzada</b></td>
                  </tr>
                  <tr id="trclear"> 
                    <td>&nbsp;</td>
                    <td width="20%" nowrap> 
                      <div align="right">Descripción :</div>
                    </td>
                    <td width="70%" nowrap> 
                      <input type="text" name="DESCRIPTION"  size=45 maxlength="35" >
                    </td>
                  </tr>
                  <tr id="trdark"> 
                    <td width="10%" align="center">&nbsp;</td>
                    <td width="20%" nowrap> 
                      <div align="right">Tipo Instrumento : </div>
                    </td>
                    <td width="70%" nowrap> 
                      <SELECT name="TYPE">
                      	<OPTION value="   " >Todos</OPTION>
						<OPTION value="ACD" >Productos(Commodities)</OPTION>
						<OPTION value="EQT" >Acciones</OPTION>
						<OPTION value="MUT" >Fondos Mutuales</OPTION>
						<OPTION value="BND" >Bonos</OPTION>
						<OPTION value="PFS" >Acciones Preferentes</OPTION>
					  </SELECT>
                    </td>
                  </tr>
                  <tr id="trclear"> 
                    <td width="10%" align="center">&nbsp;</td>
                    <td width="20%" nowrap> 
                      <div align="right"> Emisor : </div>
                    </td>
                    <td width="70%" nowrap> 
                      <input type="text" name="ISSUER"  size=19 maxlength="19" >
                    </td>
                  </tr>
                  <tr id="trdark"> 
                    <td width="10%" align="center">&nbsp;</td>
                    <td width="20%" nowrap > 
                      <div align="right">Código Interno del Instrumento : </div>
                    </td>
                    <td width="70%" nowrap > 
                      <input type="text" name="INSTCODE"  size=19 maxlength="19" >
                    </td>
                  </tr>
                  <tr id="trclear"> 
                    <td width="10%" align="center">&nbsp;</td>
                    <td width="20%" nowrap > 
                      <div align="right">Estado : </div>
                    </td>
                    <td width="70%" nowrap > 
                      <div align="left"> 
                        <input type=HIDDEN name="STATUS" value="A">
                        <input type="radio" name="CSTATUS" value="A" onClick="document.forms[0].STATUS.value='A'" checked>
                        Activo 
                        <input type="radio" name="CSTATUS" value="R" onClick="document.forms[0].STATUS.value='R'">
                        Redención 
                        <input type="radio" name="CSTATUS" value="C" onClick="document.forms[0].STATUS.value='C'">
                        Cancelado 
                        <input type="radio" name="CSTATUS" value="P" onClick="document.forms[0].STATUS.value='P'">
                        Pendiente </div>
                    </td>
                  </tr>
                  <tr id="trdark"> 
                    <td width="10%" align="center">&nbsp;</td>
                    <td width="20%" nowrap> 
                      <div align="right">Fecha Emisión : </div>
                    </td>
                    <td width="70%" nowrap> 
                      <div align="left"> 
                        <input type="text" size="2" maxlength="2" name="DATEF1" onKeyPress="enterInteger(event)">
                        <input type="text" size="2" maxlength="2" name="DATEF2" onKeyPress="enterInteger(event)">
                        <input type="text" size="2" maxlength="2" name="DATEF3" onKeyPress="enterInteger(event)">
                        Hasta 
                        <input type="text" size="2" maxlength="2" name="DATET1" onKeyPress="enterInteger(event)">
                        <input type="text" size="2" maxlength="2" name="DATET2" onKeyPress="enterInteger(event)">
                        <input type="text" size="2" maxlength="2" name="DATET3" onKeyPress="enterInteger(event)">
                      </div>
                    </td>
                  </tr>
                  <tr id="trclear"> 
                    <td width="10%" align="center">&nbsp;</td>
                    <td width="20%" nowrap> 
                      <div align="right">Listar Unicamente Instrumentos Complex ? 
                        : </div>
                    </td>
                    <td width="70%" nowrap> 
                      <input type=HIDDEN name="PREFINST" value="A">
                      <input type="radio" name="CPREFINST" value="Y" onClick="document.forms[0].PREFINST.value='Y'">
                      Si 
                      <input type="radio" name="CPREFINST" value="N" onClick="document.forms[0].PREFINST.value='N'" checked>
                      No </td>
                  </tr>
                </table>
              </td>
            </tr>
          </table>
          <br>
          <table width="100%" border="0" cellspacing="0" cellpadding="0" bgcolor="#FFFFFF" bordercolor="#FFFFFF">
            <tr bgcolor="#FFFFFF"> 
              <td width="33%"> 
                <div align="center"> 
                  <input id="EIBSBTN" type=submit name="Submit" value="Enviar">
                </div>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td> 
                <div align="center"> </div>
              </td>
            </tr>
          </table>
        </td>
      </tr>
    </table>
  </center>

          
  <p align="center">&nbsp; </p>
      
</form>
</body>
</html>
