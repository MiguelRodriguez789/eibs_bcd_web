<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session"/>

<script type="text/javascript">
function advanceSearch(){
	  document.forms[0].SCREEN.value = 300;
	  document.forms[0].submit();
	 }

function Options(Type) {
	if (Type == 'S') {
	divShow.style.display = "none";
	divAddOpt.style.display = "";
	}
	else {
	divShow.style.display = "";
	divAddOpt.style.display = "none";
	};
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
	<INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="3">
 	<INPUT TYPE=HIDDEN NAME="SEARCHC" VALUE="">
    
     
  <h3 align="center">Consulta Instrumentos</h3>
  <table class="tbenter" height="55%" width="100%" border="0">
    <tr> 
      <td nowrap align="center"> 
        <table class="tableinfo" align="center" >
          <tr> 
            <td> 
            
              <table width="100%">
                <tr id="trdark"> 
                  <td valign="middle" align="center" colspan="3" height=33> 
                    <div align="left"><b>B�squeda por :</b></div>
                  </td>
                </tr>
                <tr id="trclear"> 
                  <td width="10%" align="center">&nbsp;</td>
                  <td width="20%" nowrap> 
                    <div align="right">C�digo Instrumento Interno : </div>
                  </td>
                  <td width="70%" nowrap> 
                    <input type="text" name="INSTCODE"  size=19 maxlength="19" 
					  onKeyPress="document.forms[0].SEARCHC.value='C'">
                  </td>
                </tr>
                <tr id="trclear"> 
                  <td width="10%" align="center">&nbsp;</td>
                  <td width="20%" nowrap> 
                    <div align="right">N�mero ISIN  / Serial : </div>
                  </td>
                  <td width="70%" nowrap> 
                    <input type="text" name="ISIN"  size=15 maxlength="15" onKeyPress="document.forms[0].SEARCHC.value='I'">
                    / 
                    <input type="text" name="SERIAL"  size=12 maxlength="12" onKeyPress="document.forms[0].SEARCHC.value='I'">
                  </td>
                </tr>
                <tr id="trclear"> 
                  <td width="10%" align="center">&nbsp;</td>
                  <td width="20%" nowrap > 
                    <div align="right">Descripci�n Instrumento :</div>
                  </td>
                  <td width="70%" nowrap > 
                    <div align="left"> 
                      <input type="text" name="DESCRIPTION"  size=45 maxlength="35" 
					 onKeyPress="document.forms[0].SEARCHC.value='N'">
                    </div>
                  </td>
                </tr>
                <tr id="trclear"> 
                  <td width="10%" align="center">&nbsp;</td>
                  <td width="20%" nowrap > 
                    <div align="right">Tipo Instrumento : </div>
                  </td>
                  <td width="70%" nowrap align="left"> 
                      <SELECT name="ITYPE">
                      	<OPTION value="   " >Todos</OPTION>
						<OPTION value="ACD" >Productos(Commodities)</OPTION>
						<OPTION value="EQT" >Acciones</OPTION>
						<OPTION value="MUT" >Fondos Mutuales</OPTION>
						<OPTION value="BND" >Bonos</OPTION>
						<OPTION value="PFS" >Acciones Preferentes</OPTION>
					  </SELECT>
                  </td>
                </tr>
              </table>
              
              <div id="divShow" >
			  <table width="100%">
                <tr id="trdark"> 
                  <td valign="middle" align="center" colspan="3" height=33> 
                    <div align="left"><a href="javascript:Options('S')">Opciones B�squeda Expandida</a></div>
                  </td>
                </tr>
              </table>            
              </div> 
              
                
              <div id="divAddOpt" style="display:none">  
              <table width="100%">
	              <tr id="trdark"> 
    	              <td valign="middle" align="center" colspan="3" height=33> 
        	          <div align="left"><b>Opciones B�squeda Adicional :&nbsp; &nbsp; &nbsp;</b>
        	          <a href="javascript:Options('H')">Ocultar</a>
        	          </div>
                  	  </td>
                  </tr>
                  <tr id="trclear"> 
                  <td align="center" width="10%">&nbsp;</td>
                  <td nowrap width="20%"> 
                    <div align="right">Simbolo :</div>
                  </td>
                  <td width="70%" nowrap> 
                    <input type="text" name="SYMBOL"  size=10 maxlength="12" 
					onKeyPress="document.forms[0].SEARCHC.value='S'">
                  </td>
                </tr>
                <tr id="trclear"> 
                  <td align="center" width="10%">&nbsp;</td>
                  <td nowrap width="20%"> 
                    <div align="right">CUSIP : </div>
                  </td>
                  <td width="70%" nowrap > 
                    <input type="text" name="CUSIP"  size=15 maxlength="15" onKeyPress="document.forms[0].SEARCHC.value='U'">
                  </td>
                </tr>
                <tr id="trclear"> 
                  <td align="center" width="10%">&nbsp;</td>
                  <td nowrap width="20%"> 
                    <div align="right">Emisor : </div>
                  </td>
                  <td width="70%" nowrap > 
                    <div align="left"> 
                      <input type="text" name="ISSUER"  size=45 maxlength="45" 
					  onKeyPress="document.forms[0].SEARCHC.value='E'">
                    </div>
                  </td>
                </tr>
                <tr id="trclear"> 
                  <td align="center" width="10%">&nbsp;</td>
                  <td nowrap width="20%"> 
                    <div align="right">Estado Interno : </div>
                  </td>
                  <td width="70%" nowrap > 
                    <div align="left"> 
                      <input type=HIDDEN name="STATUS" value="">
                      <input type="radio" name="CSTATUS" value="A" onClick="document.forms[0].STATUS.value='A'" checked>
                      Activo
                      <input type="radio" name="CSTATUS" value="I" onClick="document.forms[0].STATUS.value='I'">
                      Inactivo 
                      <input type="radio" name="CSTATUS" value="P" onClick="document.forms[0].STATUS.value='P'">
                      Pendiente 
                      <input type="radio" name="CSTATUS" value="" onClick="document.forms[0].STATUS.value=''" >
                      Todos </div>
                  </td>
                </tr>
                <tr id="trclear"> 
                  <td align="center" width="10%">&nbsp;</td>
                  <td nowrap width="20%"> 
                    <div align="right">Fecha Emisi�n : </div>
                  </td>
                  <td width="70%" nowrap > 
                    <input type="text" size="2" maxlength="2" name="DATEF1" 
					  onKeyPress="document.forms[0].SEARCHC.value='D'">
                    <input type="text" size="2" maxlength="2" name="DATEF2" onKeyPress="enterInteger(event)">
                    <input type="text" size="2" maxlength="2" name="DATEF3" onKeyPress="enterInteger(event)">
                    <a href="javascript:DatePicker(document.forms[0].DATEF1,document.forms[0].DATEF2,document.forms[0].DATEF3)"><img src="<%=request.getContextPath()%>/images/calendar.gif" title="help" align="middle" border="0"></a> 
                    Hasta 
                    <input type="text" size="2" maxlength="2" name="DATET1" 
					   onKeyPress="document.forms[0].SEARCHC.value='D'">
                    <input type="text" size="2" maxlength="2" name="DATET2" onKeyPress="enterInteger(event)">
                    <input type="text" size="2" maxlength="2" name="DATET3" onKeyPress="enterInteger(event)">
                    <a href="javascript:DatePicker(document.forms[0].DATET1,document.forms[0].DATET2,document.forms[0].DATET3)"><img src="<%=request.getContextPath()%>/images/calendar.gif" title="help" align="middle" border="0"></a> 
                  </td>
                </tr>
                <tr id="trclear"> 
                  <td align="center" width="10%">&nbsp;</td>
                  <td nowrap width="20%"> 
                    <div align="right">Fecha Vencimiento :</div>
                  </td>
                  <td width="70%" nowrap > 
                    <div align="left"> 
                      <input type="text" size="2" maxlength="2" name="DATEMF1" 
					  onKeyPress="document.forms[0].SEARCHC.value='D'">
                      <input type="text" size="2" maxlength="2" name="DATEMF2" 
					  onKeyPress="document.forms[0].SEARCHC.value='D'">
                      <input type="text" size="2" maxlength="2" name="DATEMF3" 
					  onKeyPress="document.forms[0].SEARCHC.value='D'">
                      <a href="javascript:DatePicker(document.forms[0].DATEMF1,document.forms[0].DATEMF2,document.forms[0].DATEMF3)"><img src="<%=request.getContextPath()%>/images/calendar.gif" title="help" align="middle" border="0"></a> 
                      To 
                      <input type="text" size="2" maxlength="2" name="DATEMT1" 
					  onKeyPress="document.forms[0].SEARCHC.value='D'">
                      <input type="text" size="2" maxlength="2" name="DATEMT2" 
					  onKeyPress="document.forms[0].SEARCHC.value='D'">
                      <input type="text" size="2" maxlength="2" name="DATEMT3" 
					  onKeyPress="document.forms[0].SEARCHC.value='D'">
                      <a href="javascript:DatePicker(document.forms[0].DATEMT1,document.forms[0].DATEMT2,document.forms[0].DATEMT3)"><img src="<%=request.getContextPath()%>/images/calendar.gif" title="help" align="middle" border="0"></a> 
                    </div>
                  </td>
                </tr>
                <tr id="trclear"> 
                  <td align="center" width="10%">&nbsp;</td>
                  <td nowrap width="20%"> 
                    <div align="right">Tasa Cup�n :</div>
                  </td>
                  <td width="70%" nowrap > 
                    <input type="text" name="RATE"  size=11 maxlength="11" 
					  onKeyPress="document.forms[0].SEARCHC.value='C'">
                    % </td>
                </tr>
                <tr id="trclear"> 
                  <td align="center" width="10%">&nbsp;</td>
                  <td nowrap width="20%"> 
                    <div align="right">Pa�s :</div>
                  </td>
                  <td width="70%" nowrap > 
                    <input type="text" name="COUNTRY"  size=25 maxlength="25" 
					  onKeyPress="document.forms[0].SEARCHC.value='C'">
                  </td>
                </tr>
                <tr id="trclear"> 
                  <td align="center" width="10%">&nbsp;</td>
                  <td nowrap width="20%"> 
                    <div align="right">Moneda Instrumento :</div>
                  </td>
                  <td width="70%" nowrap > 
                    <input type="text" name="CURRENCY"  size=4 maxlength="3" 
					  onKeyPress="document.forms[0].SEARCHC.value='C'">
                    <a href="javascript:GetCurrency('CURRENCY','')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="help" align="middle" border="0"></a> 
                  </td>
                </tr>
                <tr id="trclear"> 
                  <td align="center" width="10%">&nbsp;</td>
                  <td nowrap width="20%"> 
                    <div align="right">Rating Standard &amp; Poor's :</div>
                  </td>
                  <td width="70%" nowrap > 
                    <div align="left">
                      <input type="text" name="STANDARDR"  size=25 maxlength="25" 
					  onKeyPress="document.forms[0].SEARCHC.value=''">
                    </div>
                  </td>
                </tr>
                <tr id="trclear"> 
                  <td align="center" width="10%">&nbsp;</td>
                  <td nowrap width="20%"> 
                    <div align="right">Rating Moody's :</div>
                  </td>
                  <td width="70%" nowrap >
                    <input type="text" name="MOODYSR"  size=25 maxlength="25" 
					  onKeyPress="document.forms[0].SEARCHC.value=''">
                  </td>
                </tr>
                <tr id="trclear"> 
                  <td align="center" width="10%">&nbsp;</td>
                  <td nowrap width="20%" colspan="2">
						<div align="center">:</div>

						<DIV align="center"><INPUT type="HIDDEN" name="PREFINST" value=" ">
						<INPUT type="radio" name="CPREFINST"
							onclick="document.forms[0].PREFINST.value=' '" checked>TODOS <INPUT
							type="radio" name="CPREFINST"
							onclick="document.forms[0].PREFINST.value='Y'" value="Y"> Complex
						<INPUT type="radio" name="CPREFINST"
							onclick="document.forms[0].PREFINST.value='N'"  value="N">
						Non Complex</DIV>
						</td></tr>
              </table>
              </div>
            </td>
          </tr>
        </table>

        <table width="100%" border="0" cellspacing="0" cellpadding="0" bgcolor="#FFFFFF" bordercolor="#FFFFFF">
          <tr bgcolor="#FFFFFF"> 
            <td> 
              <div align="center"> </div>
            </td>
          </tr>
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

      
</form>
</body>
</html>
