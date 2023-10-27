<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<title>Ordenes de pago</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/jquery/plugins/contextMenu/css/jquery.contextMenu.css" rel="stylesheet" type="text/css" />

<jsp:useBean id="prBasic" class="datapro.eibs.beans.EDD067001Message"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>


<SCRIPT type="text/javascript">

function CheckACC(){
//if ( document.forms[0].E01ACMACC.value.length < 1) {
//  alert("A valid account number must be entered");
//  document.forms[0].E01ACMACC.value='';
//  document.forms[0].E01ACMACC.focus();
//}
//else {
  document.forms[0].submit();
//}
}

</SCRIPT>

<SCRIPT type="text/javascript">
  
  function showTab(index,name){
  
  if((document.getElementById("E01PODTYP").value == 2)&& index == 7 ){
  alert("Esta no es una opci�n valida para  Swift MT - 100");
  return;
  }
  if((document.getElementById("E01PODTYP").value == 3)&& ((index == 4 )||(index== 5)||(index== 7))){
  alert("Esta no es una opci�n valida para Swift MT - 200");
  return;
  }
  if((document.getElementById("E01PODTYP").value == 4)&& (index == 5)||(index== 7)){
  alert("Esta no es una opci�n valida para  Swift MT - 202");
  return;
  }
  if((document.getElementById("E01PODTYP").value == 5)&& ((index == 0 )||(index== 1)||(index== 2)||(index== 3)||(index== 6))){
  alert("Esta no es una opci�n valida para Telex");
  return;
  }
  if((document.getElementById("E01REFNUM").value == '0' || document.getElementById("E01REFNUM").value == '') && index == 8){
  alert("No es una orden de pago simple");
  return;
  }
  
  for(var i=0;i<9;i++){
   getElement("Tab"+i).className="tabnormalv";
   getElement("dataTab"+i).style.display="none";
   }
  if(index < 4) {
    getElement("Tab"+index).className="tabhighlightl";
	getElement("colTab").className="tabdataleft";
  }else {
	getElement("Tab"+index).className="tabhighlightr";
	getElement("colTab").className="tabdataright";
  }
  getElement("dataTab"+index).style.display="";
  getElement(name).focus();
  }

</script>

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

<h3 align="center">Ordenes de Pago <img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="pr_basic.jsp,EDD0670" ></h3>
<hr size="4">


<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.transfer.JSEDD0670">

    <INPUT TYPE=HIDDEN NAME="SCREEN" id="SCREEN" VALUE="200">
	<INPUT TYPE=HIDDEN NAME="E01POSPR1" id="E01POSPR1" VALUE="<%= prBasic.getE01POSPR1()%>">
    <INPUT TYPE=HIDDEN NAME="E01POSPR2" id="E01POSPR2" VALUE="<%= prBasic.getE01POSPR2()%>">
	<INPUT TYPE=HIDDEN NAME="E01POSCHB" id="E01POSCHB" VALUE="<%= prBasic.getE01POSCHB()%>">
    <INPUT TYPE=HIDDEN NAME="E01POSCHO" id="E01POSCHO" VALUE="<%= prBasic.getE01POSCHO()%>">

  <h4>Informaci&oacute;n B&aacute;sica</h4>
  
     
  <table class="tableinfo">
    <tr id="trdark"> 
      <td nowrap align="center" width="40%"> 
        <div align="right">C&oacute;digo de Banco :</div>
      </td>
      <td nowrap align="center" width="60%"> 
        <div align="left">
          <input type="text" name="E01BKNNUM" size="3" maxlength="2" onKeyPress="enterInteger(event)" value="<%= prBasic.getE01BKNNUM()%>">
          </div>
      </td>
    </tr>
    <tr id="trclear"> 
      <td nowrap align="center" width="40%"> 
        <div align="right">Moneda :</div>
      </td>
      <td nowrap align="center" width="60%"> 
        <div align="left">
          <input type="text" name="E01CCY" size="4" maxlength="3" value="<%= prBasic.getE01CCY()%>">
	   <a href="javascript:GetCurrency('E01CCY','')"> 
          <img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="middle" border="0" width="18" height="22">
	   </a> 
        </div>
      </td>
    </tr>
    <tr id="trdark"> 
      <td nowrap align="center" width="40%"> 
        <div align="right">N&uacute;mero de Cliente :</div>
      </td>
      <td nowrap align="center" width="60%"> 
        <div align="left"> 
          <input type="text" name="E01CUSNUM" size="10" maxlength="9" onKeyPress="enterInteger(event)" value="<%= prBasic.getE01CUSNUM()%>">
          <a href="javascript:GetCustomerDescId('E01CUSNUM','','')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="middle" border="0" width="18" height="22" ></a></div>
      </td>
    </tr>
    <tr id="trclear"> 
      <td nowrap align="center" width="40%"> 
        <div align="right">N&uacute;mero de Cuenta :</div>
      </td>
      <td nowrap align="center" width="60%"> 
        <div align="left"> 
          <input type="text" name="E01ACCNUM" size="13" maxlength="12" onKeyPress="enterInteger(event)" value="<%= prBasic.getE01ACCNUM()%>">
          <a href="javascript:GetAccount('E01ACMNUM','','','')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="bottom" border="0" ></a></div>
      </td>
    </tr>
    <tr id="trdark"> 
      <td nowrap align="center" width="40%"> 
        <div align="right">Tipo de Operaci&oacute;n :</div>
      </td>
      <td nowrap align="center" width="60%"> 
        <div align="left"> 
          <p> 
            <input type="text" name="E01OPTYPE" size="3" maxlength="1" onKeyPress="enterInteger(event)" value="<%= prBasic.getE01OPTYPE()%>">
            <a href="javascript:GetCode('E01OPTYPE','STATIC_pr_operation_types.jsp')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="bottom" border="0" ></a>
        </div>
      </td>
    </tr>
    <tr id="trclear"> 
      <td nowrap align="center" width="40%"> 
        <div align="right">Tipo de Pago :</div>
      </td>
      <td nowrap align="center" width="60%"> 
        <div align="left"> 
          <select name="E01PODTYP" id="E01PODTYP">
            <option value="2" <% if(prBasic.getE01PODTYP().equals("2")) out.print("selected");%>>Formato Swift 
           MT-100 </option>
            <option value="3" <% if(prBasic.getE01PODTYP().equals("3")) out.print("selected");%>>Formato Swift 
             MT-200</option>
            <option value="4" <% if(prBasic.getE01PODTYP().equals("4")) out.print("selected");%>>Formato Swift 
            MT-202</option>
            <option value="5" <% if(prBasic.getE01PODTYP().equals("5")) out.print("selected");%>>Telex</option>
          </select>
        </div>
      </td>
    </tr>
    <tr id="trdark"> 
      <td nowrap align="center" width="40%"> 
        <div align="right">Tipo de Comisi&oacute;n :</div>
      </td>
      <td nowrap align="center" width="60%"> 
        <div align="left"> 
          <input type="text" name="E01FEETYP" size="3" maxlength="2" onKeyPress="enterInteger(event)" value="<%= prBasic.getE01FEETYP()%>">
        </div>
      </td>
    </tr>
    <tr id="trclear"> 
      <td nowrap align="center" colspan="2"> 
        <div align="left"><b>Orden de Pago Simple</b></div>
      </td>
    </tr>
    <tr id="trdark"> 
      <td nowrap align="center" width="40%"> 
        <div align="right">N&uacute;mero de Referencia :</div>
      </td>
      <td nowrap align="center" width="60%"> 
        <div align="left"> 
          <input type="text" name="E01REFNUM" id="E01REFNUM" size="6" maxlength="4" onKeyPress="enterInteger(event)" value="<%= prBasic.getE01REFNUM()%>">
        </div>
      </td>
    </tr>
    <tr> 
      <td nowrap align="center" colspan="2"> 
        <p align="center">&nbsp; </p>
      </td>
    </tr>
  </table>
  
  <p>&nbsp;</p>
  <table class="tableinfo" >
    <tr id="trdark"> 
      <td nowrap width="30%" > 
        <div align="right">N&uacute;mero de Identificaci&oacute;n de Swift :</div>
      </td>
      <td nowrap width="10%" > 
        <div align="left"> 
          <input type="text" name="E01POSSID" size="12" maxlength="12" value="<%= prBasic.getE01POSSID()%>">
          <a href="javascript:GetSwiftId('E01POSSID')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="bottom" border="0"></a></div>
      </td>
      <td nowrap width="20%" > 
        <div align="right">Prioridad : </div>
      </td>
      <td nowrap colspan="3" width="40%" > 
        <div align="left"> 
          <input type="radio" name="CE01POSPR1" 
              <%if(prBasic.getE01POSPR1().equals("X")) out.print("checked");%> 
		onClick="document.getElementById('E01POSPR1').value = 'X';document.getElementById('E01POSPR2').value = ' '">
          01 
          <input type="radio" name="CE01POSPR1" value="X" 
              <%if(prBasic.getE01POSPR2().equals("X")) out.print("checked");%>
		 onClick="document.getElementById('E01POSPR1').value = ' ';document.getElementById('E01POSPR2').value = 'X'">
          02 </div>
      </td>
    </tr>
    <tr id="trclear"> 
      <td nowrap width="30%" > 
        <div align="right"></div>
      </td>
      <td nowrap width="10%" >&nbsp; </td>
      <td nowrap width="20%" > 
        <div align="right">Cargos :</div>
      </td>
      <td nowrap colspan="3" width="40%" > 
        <input type="radio" name="CE01POSCHB" value="X" 
			  onClick="document.getElementById('E01POSCHB').value='X';document.getElementById('E01POSCHO').value=' '"
              <%if(prBasic.getE01POSCHB().equals("X")) out.print("checked");%>>
        Beneficiario 
        <input type="radio" name="CE01POSCHB" value="X" 
			  onClick="document.getElementById('E01POSCHB').value=' ';document.getElementById('E01POSCHO').value='X'"
              <%if(prBasic.getE01POSCHO().equals("X")) out.print("checked");%>>
        Nuestro</td>
    </tr>
  </table>
  <p>&nbsp;</p>
  <table class="tableinfo">
    <tr> 
      <td align="center"> 
        <table id="TableTab" cellspacing=0 cellpadding=0 width="99%">
          <tr> 
            <td  valign="top" align="right" width="5%"> 
              <table id="TableTabL" cellspacing=0 cellpadding=0 border="0">
                <tr> 
                  <td  id="Tab0" class="tabhighlightl" onClick="showTab(0,'')"> 
                    <div  >Ordenante </div>
                  <td> 
                </tr>
                <tr> 
                  <td  id="Tab1" class="tabnormalv" onClick="showTab(1,'')"> 
                    <div  >Corresponsal</div>
                  <td> 
                </tr>
                <tr > 
                  <td  id="Tab2" class="tabnormalv" onClick="showTab(2,'')"> 
                    <div >Banco Intermediario</div>
                  <td> 
                </tr>
                <tr > 
                  <td  id="Tab3" class="tabnormalv" onClick="showTab(3,'')"> 
                    <div  >Cuenta con Banco</div>
                  <td> 
                </tr>
              </table>
            </td>
            <td id="colTab" align="center" class="tabdataleft"> 
              <div id="DataTab"> 
                <div id="dataTab0"> 
                  <table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr > 
                      <td nowrap width="14%" > 
                        <div align="right"> Cliente :</div>
                      </td>
                      <td nowrap width="21%"> 
                        <textarea name="E01POSORC" cols="35" rows="5"><%= prBasic.getE01POSORC()%></textarea>
                      </td>
                      <td nowrap width="23%">  
                        <div align="right">Banco : </div>
                      </td>
                      <td nowrap width="4%" valign="top"> 
                        <input type="text" name="E01POSOBO" size="2" maxlength="1" value="<%= prBasic.getE01POSOBO()%>" >
                      </td>
                      <td nowrap width="4%">&nbsp;</td>
                      <td nowrap width="34%"> 
                        <textarea name="E01POSOBK" cols="35" rows="5"><%= prBasic.getE01POSOBK()%></textarea>
                      </td>
                    </tr>
                  </table>
                </div>
                <div id="dataTab1" style="display: none"> 
                  <table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr > 
                      <td nowrap width="16%" > 
                        <div align="right">Banco Emisor :</div>
                      </td>
                      <td nowrap width="2%" valign="top" > 
                        <input type="text" name="E01POSSCO" size="2" maxlength="1" value="<%= prBasic.getE01POSSCO()%>" >
                      </td>
                      <td nowrap width="3%" valign="middle" >&nbsp;</td>
                      <td nowrap width="38%" valign="middle" > 
                        <textarea name="E01POSSCB" cols="35" rows="5"><%= prBasic.getE01POSSCB()%></textarea>
                      </td>
                      <td nowrap width="7%" > 
                        <div align="right">Recibidor :</div>
                      </td>
                      <td nowrap width="34%" > 
                        <textarea name="E01POSRCB" cols="35" rows="5"><%= prBasic.getE01POSRCB()%></textarea>
                      </td>
                    </tr>
                    <tr > 
                      <td nowrap width="16%" > 
                        <div align="right"></div>
                      </td>
                      <td nowrap colspan="3" >&nbsp; </td>
                      <td nowrap colspan="2" >&nbsp; </td>
                    </tr>
                  </table>
                </div>
                <div id="dataTab2" style="display: none"> 
                  <table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr > 
                      <td nowrap width="28%" > 
                        <div align="right"> Banco Intermediario :</div>
                      </td>
                      <td nowrap width="21%" > 
                        <textarea name="E01POSINB" cols="35" rows="5"><%= prBasic.getE01POSINB()%></textarea>
                      </td>
                      <td nowrap width="51%" >&nbsp; </td>
                    </tr>
                  </table>
                </div>
                <div id="dataTab3" style="display: none"> 
                  <table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr > 
                      <td nowrap width="28%" > 
                        <div align="right">Cuenta con Banco : </div>
                      </td>
                      <td nowrap width="2%" valign="top" > 
                        <input type="text" name="E01POSBBO" size="2" maxlength="1" value="<%= prBasic.getE01POSBBO()%>" >
                      </td>
                      <td nowrap width="4%" >&nbsp;</td>
                      <td nowrap width="66%" > 
                        <textarea name="E01POSBBK" cols="35" rows="5"><%= prBasic.getE01POSBBK()%></textarea>
                      </td>
                    </tr>
                  </table>
                </div>
                <div id="dataTab4" style="display: none"> 
                  <table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr > 
                      <td nowrap width="28%" > 
                        <div align="right"> Cliente :</div>
                      </td>
                      <td nowrap width="30%" > 
                        <textarea name="E01POSBCU" cols="35" rows="5"><%= prBasic.getE01POSBCU()%></textarea>
                      </td>
                      <td nowrap width="8%">
                        <div align="right">Banco : </div>
                      </td>
                      <td nowrap width="34%"> 
                        <textarea name="E01POSBCN" cols="35" rows="5"><%= prBasic.getE01POSBCN()%></textarea>
                      </td>
                    </tr>
                  </table>
                </div>
                <div id="dataTab5" style="display: none"> 
                  <table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr > 
                      <td nowrap width="44%" > 
                        <div align="right">Detalle de Pagos :</div>
                      </td>
                      <td nowrap width="2%" >&nbsp; </td>
                      <td nowrap width="54%"> 
                        <textarea name="E01POSDTP" cols="35" rows="5"><%= prBasic.getE01POSDTP()%></textarea>
                      </td>
                    </tr>
                  </table>
                </div>
                <div id="dataTab6" style="display: none"> 
                  <table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr > 
                      <td nowrap width="44%" > 
                        <div align="right">Informaci&oacute;n Banco a Banco :</div>
                      </td>
                      <td nowrap width="2%">&nbsp; </td>
                      <td nowrap width="54%"> 
                        <textarea name="E01POSBKB" cols="35" rows="5"><%= prBasic.getE01POSBKB()%></textarea>
                      </td>
                    </tr>
                  </table>
                </div>
                <div id="dataTab7" style="display: none"> 
                  <table width="100%">
                    <tr id="trclear" > 
                      <td nowrap width="31%" > 
                        <div align="right">Departamento Originador :</div>
                      </td>
                      <td nowrap width="25%"> 
                        <input type="text" name="E01POTORD" size="12" maxlength="12" value="<%= prBasic.getE01POTORD().trim()%>">
                      </td>
                      <td nowrap width="28%"> 
                        <div align="right">Referencia de Telex :</div>
                      </td>
                      <td nowrap width="16%"> 
                        <input type="text" name="E01POTLOG" size="12" maxlength="12" value="<%= prBasic.getE01POTLOG().trim()%>">
                      </td>
                    </tr>
                    <tr   > 
                      <td nowrap width="31%" height="23" > 
                        <div align="right">Banco Receptor :</div>
                      </td>
                      <td nowrap height="23" width="25%"> 
                        <input type="text" name="E01POTCNU" size="10" maxlength="9" value="<%= prBasic.getE01POSSID().trim()%>">
                      </td>
                      <td nowrap height="23" width="28%"> 
                        <div align="right">Nombre Corto :</div>
                      </td>
                      <td nowrap height="23" width="16%"> 
                        <input type="text" name="E01POTCSN" size="16" maxlength="15" value="<%= prBasic.getE01POTCSN().trim()%>">
                      </td>
                    </tr>
                    <tr id="trclear" > 
                      <td nowrap width="31%" height="23" > 
                        <div align="right">Nombre :</div>
                      </td>
                      <td nowrap height="23" width="25%"> 
                        <input type="text" name="E01POTTO1" size="45" maxlength="45" value="<%= prBasic.getE01POTTO1().trim()%>">
                      </td>
                      <td nowrap height="23" width="28%"> 
                        <div align="right">V&iacute;ia de Aviso :</div>
                      </td>
                      <td nowrap height="23" width="16%"> 
                        <input type="text" name="E01POTVIA" size="2" maxlength="1" value="<%= prBasic.getE01POTVIA().trim()%>">
                        ( /L/I/F) </td>
                    </tr>
                    <tr id="trclear" > 
                      <td nowrap width="31%" height="23" >&nbsp;</td>
                      <td nowrap height="23" width="25%">
                        <input type="text" name="E01POTTO2" size="45" maxlength="45" value="<%= prBasic.getE01POTTO2().trim()%>">
                      </td>
                      <td nowrap height="23" width="28%"> 
                        <div align="right">N&uacute;mero de Telex :</div>
                      </td>
                      <td nowrap height="23" width="16%"> 
                        <input type="text" name="E01POTNRO" size="20" maxlength="15" value="<%= prBasic.getE01POTNRO().trim()%>">
                      </td>
                    </tr>
                    <tr > 
                      <td nowrap width="31%" > 
                        <div align="right">Por Orden de :</div>
                      </td>
                      <td nowrap colspan="3"> 
                        <input type="text" name="E01POTBYO" size="30" maxlength="30" value="<%= prBasic.getE01POTBYO().trim()%>" >
                      </td>
                    </tr>
                    <tr id="trclear" > 
                      <td nowrap width="31%" > 
                        <div align="right"> Banco Originador :</div>
                      </td>
                      <td nowrap colspan="3"> 
                        <input type="text" name="E01POTORB" size="30" maxlength="30" value="<%= prBasic.getE01POTORB().trim()%>" >
                      </td>
                    </tr>
                    <tr   > 
                      <td nowrap width="31%" >&nbsp;</td>
                      <td nowrap colspan="3">&nbsp;</td>
                    </tr>
                    <tr   > 
                      <td nowrap width="31%" > 
                        <div align="right"> Acreditamos su Cuenta con Nosotros 
                          :</div>
                      </td>
                      <td nowrap width="25%"> 
                        <input type="text" name="E01POTOU1" size="15" maxlength="13" value="<%= prBasic.getE01POTOU1().trim()%>" >
                      </td>
                      <td nowrap width="28%"> 
                        <div align="right">Acreditamos Nuestra Cuenta con Ustedes:</div>
                      </td>
                      <td nowrap width="16%"> 
                        <input type="text" name="E01POTOUA" size="15" maxlength="12" value="<%= prBasic.getE01POTOUA().trim()%>" >
                      </td>
                    </tr>
                    <tr id="trclear" > 
                      <td nowrap width="31%" > 
                        <div align="right">Cobertura a traves de :</div>
                      </td>
                      <td nowrap width="25%"> 
                        <input type="text" name="E01POTCVP" size="35" maxlength="35" value="<%= prBasic.getE01POTCVP().trim()%>" >
                      </td>
                      <td nowrap colspan="2"> 
                        <input type="text" name="E01POTOTC" size="35" maxlength="35" value="<%= prBasic.getE01POTOTC().trim()%>" >
                      </td>
                    </tr>
                  </table>
                </div>
                <div id="dataTab8" style="display: none"> 
                  <table width="100%">
                    <tr id="trclear" > 
                      <td nowrap width="44%" > 
                        <div align="right">Monto :</div>
                      </td>
                      <td nowrap> 
                        <input type="text" name="E01POSAM1" size="14" maxlength="13" value="<%= prBasic.getE01POSAM1()%>" >
                      </td>
                    </tr>
                    <tr   > 
                      <td nowrap width="44%" > 
                        <div align="right">Cuenta de D&eacute;bito :</div>
                      </td>
                      <td nowrap> 
                          <input type="text" name="E01POSDBR" size="4" maxlength="3" value="<%= prBasic.getE01POSDBR()%>"
						  class="context-menu-help" onmousedown="init(branchHelp,'E01POSDBR','01','','','','')" >
                          <input type="text" name="E01POSDCY" size="4" maxlength="3" value="<%= prBasic.getE01POSDCY()%>" 
						  class="context-menu-help" onmousedown="init(currencyHelp,'E01POSDCY','01','','','','')"	>
                          <input type="text" name="E01POSDGL" size="14" maxlength="12" value="<%= prBasic.getE01POSDGL()%>" >
                        <br>
                          <input type="text" name="E01POSDAC" size="10" maxlength="9" value="<%= prBasic.getE01POSDAC()%>" 
						  class="context-menu-help" onmousedown="init(accountHelp,'E01POSDAC','01','','','','')">
                          <input type="text" name="E01POSDSB" size="6" maxlength="5" value="<%= prBasic.getE01POSDSB()%>" >
                          <input type="text" name="E01POSDCS" size="7" maxlength="6" value="<%= prBasic.getE01POSDCS()%>" >
                      </td>
                    </tr>
                    <tr id="trclear" > 
                      <td nowrap width="44%" > 
                        <div align="right">Cuenta de Cr&eacute;dito :</div>
                      </td>
                      <td nowrap> 
                        <input type="text" name="E01POSCBR" size="4" maxlength="3" value="<%= prBasic.getE01POSCBR()%>" 
						class="context-menu-help" onmousedown="init(branchHelp,'E01POSCBR','01','','','','')">
                        <input type="text" name="E01POSCCY" size="4" maxlength="3" value="<%= prBasic.getE01POSCCY()%>" 
						class="context-menu-help" onmousedown="init(currencyHelp,'E01POSCCY','01','','','','')"	>
                        <input type="text" name="E01POSCGL" size="14" maxlength="12" value="<%= prBasic.getE01POSCGL()%>" >
                        <br>
                        <input type="text" name="E01POSCAC" size="10" maxlength="9" value="<%= prBasic.getE01POSCAC()%>" 
						class="context-menu-help" onmousedown="init(accountHelp,'E01POSCAC','01','','','','')">
                        <input type="text" name="E01POSCSB" size="6" maxlength="5" value="<%= prBasic.getE01POSCSB()%>" >
                        <input type="text" name="E01POSCCS" size="7" maxlength="6" value="<%= prBasic.getE01POSCCS()%>" >
                      </td>
                    </tr>
                    <tr > 
                      <td nowrap width="44%" > 
                        <div align="right">Frecuencia de Pagos :</div>
                      </td>
                      <td nowrap> 
                        <select name="E01POSFRQ">
                          <option value="D" <% if(prBasic.getE01POSFRQ().equals("D")) out.print("selected");%>>Diaria</option>
                          <option value="W" <% if(prBasic.getE01POSFRQ().equals("W")) out.print("selected");%> selected>Semanal</option>
                          <option value="M" <% if(prBasic.getE01POSFRQ().equals("M")) out.print("selected");%>>Mensual</option>
                          <option value="V" <% if(prBasic.getE01POSFRQ().equals("V")) out.print("selected");%>>Variable</option>
                        </select>
                      </td>
                    </tr>
                    <tr id="trclear" > 
                      <td nowrap width="44%" > 
                        <div align="right"> D&iacute;a de Pago :</div>
                      </td>
                      <td nowrap> 
                        <input type="text" name="E01POSPMD" size="3" maxlength="2" value="<%= prBasic.getE01POSPMD()%>" >
                        <a href="javascript:GetCode('E01POSPMD','STATIC_rt_ciclo.jsp')"><img src="<%=request.getContextPath()%>/images/1b.gif" align="bottom" border="0" title="help" ></a> 
                      </td>
                    </tr>
                    <tr   > 
                      <td nowrap width="44%" > 
                        <div align="right"> o N&uacute;mero de D&iacute;as :</div>
                      </td>
                      <td nowrap> 
                        <input type="text" name="E01POSDYS" size="4" maxlength="3" value="<%= prBasic.getE01POSDYS()%>" >
                        (Para frecuencia variable de pagos solamente) </td>
                    </tr>
                    <tr id="trclear" > 
                      <td nowrap width="44%" > 
                        <div align="right">N&uacute;mero de Pagos :</div>
                      </td>
                      <td nowrap> 
                        <input type="text" name="E01POSNPM" size="6" maxlength="4" value="<%= prBasic.getE01POSNPM()%>" >
                        (9999 = Indefinido) </td>
                    </tr>
                    <tr > 
                      <td nowrap width="44%" > 
                        <div align="right">Tipo de pago :</div>
                      </td>
                      <td nowrap> 
                        <input type="radio" name="E01FLD001" value="F" 
              <%if(prBasic.getE01FLD001().equals("F")) out.print("checked");%> checked>
                        Fijo 
                        <input type="radio" name="E01FLD001" value="V" 
              <%if(prBasic.getE01FLD001().equals("V")) out.print("checked");%>>
                        Variable </td>
                    </tr>
                    <tr id="trclear" > 
                      <td nowrap width="44%" > 
                        <div align="right">Permite Sobregiros :</div>
                      </td>
                      <td nowrap> 
                        <input type="radio" name="E01POSODA" value="Y" 
              <%if(prBasic.getE01POSODA().equals("Y")) out.print("checked");%> checked>
                        S&iacute; 
                        <input type="radio" name="E01POSODA" value="N" 
              <%if(prBasic.getE01POSODA().equals("N")) out.print("checked");%>>
                        No </td>
                    </tr>
                    <tr > 
                      <td nowrap width="44%" > 
                        <div align="right">Pago Suspendido :</div>
                      </td>
                      <td nowrap> 
                        <input type="radio" name="E01POSSPM" value="Y" 
              <%if(prBasic.getE01POSSPM().equals("Y")) out.print("checked");%> checked>
                        Yes 
                        <input type="radio" name="E01POSSPM" value="N" 
              <%if(prBasic.getE01POSSPM().equals("N")) out.print("checked");%>>
                        No </td>
                    </tr>
                    <tr id="trclear" > 
                      <td nowrap width="44%"> 
                        <div align="right">Reflejado en el Estado :</div>
                      </td>
                      <td nowrap > 
                        <input type="text" name="E01FLD002" size="6" maxlength="4" value="<%= prBasic.getE01FLD002()%>" >
                        (D&iacute;as) </td>
                    </tr>
                  </table>
                </div>

              </div>
            </td>
            <td  valign=top width="5%"> 
              <table id="TableTabR" cellspacing=0 cellpadding=0 border="0">
                <tr > 
                  <td  id="Tab4" class="tabnormalv" onClick="showTab(4,'')"> 
                    <div  align="right" >Beneficiario</div>
                  <td> 
                </tr>
                <tr > 
                  <td  id="Tab5" class="tabnormalv" onClick="showTab(5,'')"> 
                    <div  align="right" >Detalle de Pagos</div>
                  <td> 
                </tr>
                <tr > 
                  <td  id="Tab6" class="tabnormalv" onClick="showTab(6,'')"> 
                    <div  align="right" >Informaci&oacute;n Banco a Banco</div>
                  <td> 
                </tr>
                <tr >
                  <td  id="Tab7" class="tabnormalv" onClick="showTab(7,'')">
                    <div align="right">Telex</div>
                  
                  <td>
                </tr>
                <tr > 
                  <td  id="Tab8" class="tabnormalv" onClick="showTab(8,'')"> 
                    <div  align="right" >Ordenes de Pago Simple</div>
                  <td> 
                </tr>
              </table>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>

  <p align="center"> 
    <input id="EIBSBTN" type=button name="Submit" OnClick="CheckACC()" value="Enviar">
  </p>
  
</form>
</body>
</html>
