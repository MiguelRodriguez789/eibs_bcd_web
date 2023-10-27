<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<title>Instrucciones de Pago</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V4.0 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<%@ page import = "datapro.eibs.master.Util" %>

<jsp:useBean id="pymInst" class="datapro.eibs.beans.ESD008211Message"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>

<SCRIPT type="text/javascript">

  //builtNewMenu(client_corp_opt);

</SCRIPT>

<SCRIPT type="text/javascript">
  
  function showTab(index,name){
  if(index < 6) {
    getElement("Tab"+index).className="tabhighlightl";
	getElement("colTab").className="tabdataleft";
  }else {
	getElement("Tab"+index).className="tabhighlightr";
	getElement("colTab").className="tabdataright";
  }
  	getElement("dataTab"+index).style.display="";
  	getElement(name).focus();
  }
  
  function selectTabs(index,name){
    for(var i=3;i<6;i++){
		getElement("Tab"+i).className="tabnormalv";
		getElement("dataTab"+i).style.display="none";
	}
	showTab(index, name);
  }

  function selectCustomerTabs(index,name){
    for(var i=0;i<3;i++){
		getElement("Tab"+i).className="tabnormalv";
		getElement("dataTab"+i).style.display="none";
	}
	showTab(index, name);
  }
  
  function del() {
    document.forms[0].ACTION.value = 'D';
    document.forms[0].submit();
  }
 
</SCRIPT>

</head>

<body>

<% 
 if ( !error.getERRNUM().equals("0")  ) {
     error.setERRNUM("0");
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
 }
 
    //out.println("<SCRIPT> initMenu(); </SCRIPT>");
 
%> 

<h3 align="center">Instrucciones de Pago<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="client_corp_payment_inst.jsp,ESD0080"></h3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSESD0082">
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="64">
  <INPUT TYPE=HIDDEN NAME="E11CCY" VALUE="<%= pymInst.getE11CCY()%>">
  <INPUT TYPE=HIDDEN NAME="ACTION" VALUE="S">
  <input type=HIDDEN name="E11CUS" value="<%= pymInst.getE11CUS()%>">
  <input type=HIDDEN name="E11NA1" value="<%= pymInst.getE11NA1()%>">
  <input type=HIDDEN name="E11IDN" value="<%= pymInst.getE11IDN()%>">
  <input type=HIDDEN name="E11LN3" value="<%= pymInst.getE11LN3()%>">
  <input type=HIDDEN name="E11TYP" value="<%= pymInst.getE11TYP()%>">
  <div id="OtherOpt"> 
<table class="tableinfo">
  <tr > 
    <td> 
          <table cellspacing="0" cellpadding="2" class="tbhead" width="100%"  align="center">
            <tr> 
              <td nowrap width="10%" align="right">Cliente : </td>
              <td nowrap width="12%" align="left"><%= pymInst.getE11CUS()%> </td>
              <td nowrap width="6%" align="right">ID : </td>
              <td nowrap width="14%" align="left"> 
				<% out.print(pymInst.getE11IDN().trim()); %>
			  </td>
              <td nowrap width="8%" align="right">Nombre : </td>
              <td nowrap width="50%"align="left"> <%= pymInst.getE11NA1()%> </td>
            </tr>
            <tr>
              <td nowrap width="10%" align="right">Moneda :</td>
              <td nowrap width="12%" align="left"><%= pymInst.getE11CCY()%></td>
              <td nowrap width="6%" align="right">Tipo :</td>
              <td nowrap width="14%" align="left"><% if(pymInst.getE11TYP().equals("1")) out.print("Default");
   else if(pymInst.getE11TYP().equals("2")) out.print("Inversiones");
   else if(pymInst.getE11TYP().equals("3")) out.print("Moneda Extranjera");
   else if(pymInst.getE11TYP().equals("4")) out.print("FRA");
   else if(pymInst.getE11TYP().equals("0")) out.print("FED");
   else out.print("");%></td>
              <td nowrap width="8%" align="right">&nbsp;</td>
              <td nowrap width="50%"align="left">&nbsp;</td>
            </tr>
          </table>
    </td>
  </tr>
</table>
    <h4>Instrucciones del Beneficiario y/o Banco del Beneficiario o Receptor</h4>
    <table class="tableinfo" width="639">
      <tr > 
      <td > 
          <table cellspacing=0 cellpadding=2 width="100%" border="0">
            <tr id="trdark"> 
              <td colspan="5" align="center"> 
                <table id="TableTab" cellspacing=0 cellpadding=0 border="0" width="100%">
                  <tr id=trdark> 
                    <td nowrap valign="top" align="right" width="40%"> 
                      <table id="TableTabL" cellspacing=0 cellpadding=0 border="0">
                        <tr > 
                          <td nowrap id="Tab0" class="tabhighlightl" onClick="selectCustomerTabs(0,'E11BN1')"> 
                            <div nowrap >Beneficiario
                            <img src="<%=request.getContextPath()%>/images/Check.gif" alt="Campo Obligatorio" align="absbottom" border="0" >
                            </div>
                          <td> 
                        </tr>
                        <tr > 
                          <td nowrap id="Tab1" class="tabnormalv" onClick="selectCustomerTabs(1,'E11AW1')"> 
                            <div nowrap >Cuenta con 
                            <img src="<%=request.getContextPath()%>/images/Check.gif" alt="Campo Obligatorio" align="absbottom" border="0" ></div>
                          <td> 
                        </tr>
                        <tr> 
                          <td nowrap id="Tab2" class="tabnormalv" onClick="selectCustomerTabs(2,'E11RC1')"> 
                            <div nowrap >Corresponsal Receptor</div>
                          <td> 
                        </tr>
                      </table>
                    </td>
                    <td id="colTab" align="center" class="tabdataleft"> 
                      <div id="DataTab"> 
                        <div id="dataTab1" style="display: none"> 
                          <table width="94%" border="0">
                          	<tr> 
                              <td width="53%"> 
                                <div align=center>
		                          	C&oacute;digo Swift :  <a href="javascript:GetSwiftAll('E11AW1','E11AW2','E11AW4','','E11AW3')">
		                          	<img src="<%=request.getContextPath()%>/images/1b.gif" alt="Ayuda ID Swift" align="absmiddle" border="0"></a>
		                          	C&oacute;digo Fed   : <a href="javascript:GetFedAll('E11AW1','E11AW2','E11AW4','','E11AW3')">
		                          	<img src="<%=request.getContextPath()%>/images/1b.gif" alt="Ayuda Fed All" align="absmiddle" border="0"></a>
                                </div>
		                    </tr>  
                            <tr> 
                              <td width="53%"> 
                                <div align=center>
                                <input type="text" name="E11AW1" size="36" maxlength="35" value="<%= pymInst.getE11AW1()%>">
                                </div>
                              </td>
                            </tr>
                            <tr> 
                              <td width="53%"> 
                                <div align=center>
                                <input type="text" name="E11AW2" size="36" maxlength="35" value="<%= pymInst.getE11AW2()%>">
                                </div>
                              </td>
                            </tr>
                            <tr> 
                              <td width="53%"> 
                                <div align=center>
                                <input type="text" name="E11AW3" size="36" maxlength="35" value="<%= pymInst.getE11AW3()%>">
                                </div>
                              </td>
                            </tr>
                            <tr> 
                              <td width="53%"> 
                                <div align=center>
                                <input type="text" name="E11AW4" size="36" maxlength="35" value="<%= pymInst.getE11AW4()%>">
                                </div>
                              </td>
                            </tr>
                          </table>
                        </div>
                        <div id="dataTab0"> 
                          <table width="94%" border="0">
                            <tr> 
                              <td width="53%"> 
                                <div align=center>
                                  <input type="text" name="E11BN1" size="36" maxlength="35" value="<%= pymInst.getE11BN1()%>">
                                </div>
                              </td>
                            </tr>
                            <tr> 
                              <td width="53%"> 
                                <div align=center>
                                  <input type="text" name="E11BN2" size="36" maxlength="35" value="<%= pymInst.getE11BN2()%>">
                                </div>
                              </td>
                            </tr>
                            <tr> 
                              <td width="53%"> 
                                <div align=center>
                                  <input type="text" name="E11BN3" size="36" maxlength="35" value="<%= pymInst.getE11BN3()%>">
                                </div>
                              </td>
                            </tr>
                            <tr> 
                              <td width="53%"> 
                                <div align=center>
                                  <input type="text" name="E11BN4" size="36" maxlength="35" value="<%= pymInst.getE11BN4()%>">
                                </div>
                              </td>
                            </tr>
                          </table>
                        </div>
                        <div id="dataTab2" style="display: none"> 
                          <table width="94%" border="0">
                          	<tr> 
                              <td width="53%"> 
                                <div align=center>
		                          	C&oacute;digo Swift :  <a href="javascript:GetSwiftAll('E11RC1','E11RC2','E11RC4','','E11RC3')">
		                          	<img src="<%=request.getContextPath()%>/images/1b.gif" alt="Ayuda ID Swift" align="absmiddle" border="0"></a>
		                          	C&oacute;digo Fed   : <a href="javascript:GetFedAll('E11RC1','E11RC2','E11RC4','','E11RC3')">
		                          	<img src="<%=request.getContextPath()%>/images/1b.gif" alt="Ayuda Fed All" align="absmiddle" border="0"></a>
                                </div>
		                    </tr>  
                            <tr> 
                              <td width="53%"> 
                                <div align=center>
                                <input type="text" name="E11RC1" size="36" maxlength="35" value="<%= pymInst.getE11RC1()%>">
                                </div>
                              </td>
                            </tr>
                            <tr> 
                              <td width="53%"> 
                                <div align=center>
                                <input type="text" name="E11RC2" size="36" maxlength="35" value="<%= pymInst.getE11RC2()%>">
                                </div>
                              </td>
                            </tr>
                            <tr> 
                              <td width="53%"> 
                                <div align=center>
                                <input type="text" name="E11RC3" size="36" maxlength="35" value="<%= pymInst.getE11RC3()%>">
                                </div>
                              </td>
                            </tr>
                            <tr> 
                              <td width="53%"> 
                                <div align=center>
                                <input type="text" name="E11RC4" size="36" maxlength="35" value="<%= pymInst.getE11RC4()%>">
                                </div>
                              </td>
                            </tr>
                          </table>
                        </div>
                      </div>
                    </td>
                  </tr>
                </table>
              </td>
            </tr>
          </table>
      </TD>
 </tr>
</table>
    <h4>Instrucciones de otras Instituciones Financieras</h4>
    <table class="tableinfo" width="639">
      <tr > 
      <td > 
          <table cellspacing=0 cellpadding=2 width="100%" border="0">
            <tr id="trdark"> 
              <td colspan="5" align="center"> 
                <table id="TableTab" cellspacing=0 cellpadding=0 border="0" width="100%">
                  <tr id=trdark> 
                    <td nowrap valign="top" align="right" width="40%"> 
                      <table id="TableTabL" cellspacing=0 cellpadding=0 border="0">
                        <tr> 
                          <td nowrap id="Tab3" class="tabhighlightl" onClick="selectTabs(3,'E11PC1')"> 
                            <div nowrap >Corresponsal Emisor</div>
                          <td> 
                        </tr>
                        <tr > 
                          <td nowrap id="Tab4" class="tabnormalv" onClick="selectTabs(4,'E11PI1')"> 
                            <div >Pagador</div>
                          <td> 
                        </tr>
                        <tr > 
                          <td nowrap id="Tab5" class="tabnormalv" onClick="selectTabs(5,'E11RI1')"> 
                            <div nowrap >Intermediario</div>
                          <td> 
                        </tr>
                      </table>
                    </td>
                    <td id="colTab" align="center" class="tabdataleft"> 
                      <div id="DataTab"> 
                        <div id="dataTab3"> 
                          <table width="94%" border="0">
                          	<tr> 
                              <td width="53%"> 
                                <div align=center>
		                          	C&oacute;digo Swift :  <a href="javascript:GetSwiftAll('E11PC1','E11PC2','E11PC4','','E11PC3')">
		                          	<img src="<%=request.getContextPath()%>/images/1b.gif" alt="Ayuda ID Swift" align="absmiddle" border="0"></a>
		                          	C&oacute;digo Fed   : <a href="javascript:GetFedAll('E11PC1','E11PC2','E11PC4','','E11PC3')">
		                          	<img src="<%=request.getContextPath()%>/images/1b.gif" alt="Ayuda Fed All" align="absmiddle" border="0"></a>
                                </div>
		                    </tr>  
                            <tr> 
                              <td width="53%"> 
                                <div align=center>
                                <input type="text" name="E11PC1" size="36" maxlength="35" value="<%= pymInst.getE11PC1()%>">
                                </div>
                              </td>
                            </tr>
                            <tr> 
                              <td width="53%"> 
                                <div align=center>
                                <input type="text" name="E11PC2" size="36" maxlength="35" value="<%= pymInst.getE11PC2()%>">
                                </div>
                              </td>
                            </tr>
                            <tr> 
                              <td width="53%"> 
                                <div align=center>
                                <input type="text" name="E11PC3" size="36" maxlength="35" value="<%= pymInst.getE11PC3()%>">
                                </div>
                              </td>
                            </tr>
                            <tr> 
                              <td width="53%"> 
                                <div align=center>
                                <input type="text" name="E11PC4" size="36" maxlength="35" value="<%= pymInst.getE11PC4()%>">
                                </div>
                              </td>
                            </tr>
                          </table>
                        </div>
                        <div id="dataTab4" style="display: none"> 
                          <table width="94%" border="0">
                          	<tr> 
                              <td width="53%"> 
                                <div align=center>
		                          	C&oacute;digo Swift :  <a href="javascript:GetSwiftAll('E11PI1','E11PI2','E11PI4','','E11PI3')">
		                          	<img src="<%=request.getContextPath()%>/images/1b.gif" alt="Ayuda ID Swift" align="absmiddle" border="0"></a>
		                          	C&oacute;digo Fed   : <a href="javascript:GetFedAll('E11PI1','E11PI2','E11PI4','','E11PI3')">
		                          	<img src="<%=request.getContextPath()%>/images/1b.gif" alt="Ayuda Fed All" align="absmiddle" border="0"></a>
                                </div>
		                    </tr>  
                            <tr> 
                              <td width="53%"> 
                                <div align=center>
                                <input type="text" name="E11PI1" size="36" maxlength="35" value="<%= pymInst.getE11PI1()%>">
                                </div>
                              </td>
                            </tr>
                            <tr> 
                              <td width="53%"> 
                                <div align=center>
                                <input type="text" name="E11PI2" size="36" maxlength="35" value="<%= pymInst.getE11PI2()%>">
                                </div>
                              </td>
                            </tr>
                            <tr> 
                              <td width="53%"> 
                                <div align=center>
                                <input type="text" name="E11PI3" size="36" maxlength="35" value="<%= pymInst.getE11PI3()%>">
                                </div>
                              </td>
                            </tr>
                            <tr> 
                              <td width="53%"> 
                                <div align=center>
                                <input type="text" name="E11PI4" size="36" maxlength="35" value="<%= pymInst.getE11PI4()%>">
                                </div>
                              </td>
                            </tr>
                          </table>
                        </div>
                        <div id="dataTab5" style="display: none"> 
                          <table width="94%" border="0">
                          	<tr> 
                              <td width="53%"> 
                                <div align=center>
		                          	C&oacute;digo Swift :  <a href="javascript:GetSwiftAll('E11RI1','E11RI2','E11RI4','','E11RI3')">
		                          	<img src="<%=request.getContextPath()%>/images/1b.gif" alt="Ayuda ID Swift" align="absmiddle" border="0"></a>
		                          	C&oacute;digo Fed   : <a href="javascript:GetFedAll('E11RI1','E11RI2','E11RI4','','E11RI3')">
		                          	<img src="<%=request.getContextPath()%>/images/1b.gif" alt="Ayuda Fed All" align="absmiddle" border="0"></a>
                                </div>
		                    </tr>  
                            <tr> 
                              <td width="53%"> 
                                <div align=center>
                                <input type="text" name="E11RI1" size="36" maxlength="35" value="<%= pymInst.getE11RI1()%>">
                                </div>
                              </td>
                            </tr>
                            <tr> 
                              <td width="53%"> 
                                <div align=center>
                                <input type="text" name="E11RI2" size="36" maxlength="35" value="<%= pymInst.getE11RI2()%>">
                                </div>
                              </td>
                            </tr>
                            <tr> 
                              <td width="53%"> 
                                <div align=center>
                                <input type="text" name="E11RI3" size="36" maxlength="35" value="<%= pymInst.getE11RI3()%>">
                                </div>
                              </td>
                            </tr>
                            <tr> 
                              <td width="53%"> 
                                <div align=center>
                                <input type="text" name="E11RI4" size="36" maxlength="35" value="<%= pymInst.getE11RI4()%>">
                                </div>
                              </td>
                            </tr>
                          </table>
                        </div>
                      </div>
                    </td>
                  </tr>
                </table>
              </td>
            </tr>
          </table>
      </TD>
 </tr>
</table>
  <h4>Cuenta Contrapartida</h4>
   <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing=0 cellpadding=2 width="100%" border="0">
          <tr id="trdark"> 
            <td nowrap width="25%" > 
              <div align="right">N&uacute;mero de Cuenta:</div>
            </td>
             <td nowrap width="75%" colspan="3" > 
              <input type="text" name="E11CTA" size="12" maxlength="9" value="<% if (pymInst.getE11OFB().equals("")) {out.print(pymInst.getE11OFA().trim());}%>" onKeyPress="enterInteger(event)">
              <a href="javascript:GetAccount('E11CTA','','RT','')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="help" align="bottom" border="0" ></a> 
              </td>
          </tr> 
          <tr id="trclear">  
          	<td nowrap width="25%" colspan="4"><div align="center">O</div>
          	 </td>
          </tr> 
          <tr id="trdark"> 
            <td nowrap width="25%" > 
              <div align="right">Banco :</div>
            </td>
            <td nowrap width="25%" > 
              <input type="text"  name="E11OFB" size="3" maxlength="2" value="<%= pymInst.getE11OFB().trim()%>">
            </td>
            <td nowrap width="25%" > 
              <div align="right">N&uacute;mero de Cuenta Contable:</div>
            </td>
            <td nowrap width="25%" > 
              <input type="text"  name="E11GL" size="16" maxlength="16" value="<% if (!pymInst.getE11OFB().equals("")) {out.print(pymInst.getE11OFA().trim());}%>" onKeyPress="enterInteger(event)">
              <a href="javascript:GetLedger('E11GL',document.forms[0].E11OFB.value,'','')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="help" align="bottom" border="0" ></a></td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
    <p>&nbsp;</p>
<table width="100%">
 <tr>
  <td width="50%">
    <p align="center">
    	<input id="EIBSBTN" type=button name="Submit" value="Enviar" onClick="submit()"> 
    </p>
  </td>
  <td width="50%">
    <p align="center">
    	<input id="EIBSBTN" type=button name="Submit1" value="Eliminar" onClick="del()"> 
    </p>
  </td>
 </tr>
</table>

</div>

</form>
  

</body>
</html>
