<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@ page import = "datapro.eibs.master.Util" %>
<%@ page import="com.datapro.constants.EibsFields"%>
<html>
<head>
<title>Propuesta</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V4.0 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<%@ page import = "datapro.eibs.master.Util" %>

<jsp:useBean id="proposal" class="datapro.eibs.beans.EPV500001Message"  scope="session" />

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />

<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>

<SCRIPT type="text/javascript">
  
  function showTab(index,name){
  
  for(var i=0;i<6;i++){
     getElement("Tab"+i).className="tabnormal";
     getElement("dataTab"+i).style.display="none";
    }
  
   getElement("Tab"+index).className="tabhighlight";  
   getElement("dataTab"+index).style.display="";

   getElement(name).focus();
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
%> 
<h3 align="center">Propuesta de Cr&eacute;dito<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="proposal_details.jsp,EPV5000"></h3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.credprop.JSEPV5000">
  
    <input type=HIDDEN name="SCREEN" value="800">

  <div id="OtherOpt"> 
    <table class="tableinfo">
      <tr id="trdark"> 
        <td nowrap width="25%"> 
          <div align="right">No Propuesta :</div>
        </td>
        <td nowrap colspan="3"> 
          <input type="text" name="E01PVMNUM" size="19" maxlength="19" value="<%= proposal.getE01PVMNUM().trim()%>">
        </td>
      </tr>
      <tr id="trclear"> 
        <td nowrap width="25%"> 
          <div align="right">Estado de la Propuesta :</div>
        </td>
        <td nowrap width="39%"> 
          <select name="E01PVMSTS">
            <option value=" " <% if (!(proposal.getE01PVMSTS().equals("A")||proposal.getE01PVMSTS().equals("B")||proposal.getE01PVMSTS().equals("C")||proposal.getE01PVMSTS().equals("D") 
				|| proposal.getE01PVMSTS().equals("E")||proposal.getE01PVMSTS().equals("F") || proposal.getE01PVMSTS().equals("H")||proposal.getE01PVMSTS().equals("I") )) out.print("selected"); %>> 
            </option>
            <option value="A" <% if (proposal.getE01PVMSTS().equals("A")) out.print("selected"); %>>Ingresada</option>
            <option value="B" <% if (proposal.getE01PVMSTS().equals("B")) out.print("selected"); %>>Ofertada</option>
            <option value="C" <% if (proposal.getE01PVMSTS().equals("C")) out.print("selected"); %>>Evaluada</option>
            <option value="D" <% if (proposal.getE01PVMSTS().equals("D")) out.print("selected"); %>>Aceptada 
            Oferta</option>
            <option value="E" <% if (proposal.getE01PVMSTS().equals("E")) out.print("selected"); %>>Aprobada</option>
            <option value="F" <% if (proposal.getE01PVMSTS().equals("F")) out.print("selected"); %>>En 
            curso</option>
            <option value="G" <% if (proposal.getE01PVMSTS().equals("G")) out.print("selected"); %>>Rechazada/Cambios</option>
            <option value="H" <% if (proposal.getE01PVMSTS().equals("H")) out.print("selected"); %>>Eliminada</option>
            <option value="I" <% if (proposal.getE01PVMSTS().equals("I")) out.print("selected"); %>>Eliminada 
            por Plazo</option>
          </select>
        </td>
        <td nowrap width="19%"> 
          <div align="right"></div>
        </td>
        <td nowrap width="17%">&nbsp; </td>
      </tr>
      <tr id="trdark"> 
        <td nowrap width="25%" > 
          <div align="right">Fecha de Propuesta :</div>
        </td>
        <td nowrap  width="39%"> 
          <p> 
			<eibsinput:date name="proposal" fn_month="E01PVMOPM" fn_day="E01PVMOPD" fn_year="E01PVMOPY" />
          </p>
        </td>
        <td nowrap width="19%" > 
          <div align="right">Necesita Garant&iacute;a :</div>
        </td>
        <td nowrap width="17%" > 
          <input type="radio" name="E01PVMCOL" value="1" <%if (proposal.getE01PVMCOL().equals("1")) out.print("checked"); %>>
          S&iacute; 
          <input type="radio" name="E01PVMCOL" value="0" <%if (proposal.getE01PVMCOL().equals("0")) out.print("checked"); %>>
          No </td>
      </tr>
      <tr id="trclear"> 
        <td nowrap width="25%" > 
          <div align="right">Monto Solicitado : </div>
        </td>
        <td nowrap  width="39%"> 
          <input type="text" name="E01PVMSA1" size="16" maxlength="15" value="<%= proposal.getE01PVMSA1().trim()%>" onkeypress="enterDecimal(event, 2)">
        </td>
        <td nowrap width="19%" > 
          <div align="right">Moneda :</div>
        </td>
        <td nowrap width="17%" > 
          <input type="text" name="E01PVMCCY" size="4" maxlength="3" value="<%= proposal.getE01PVMCCY().trim()%>">
        </td>
      </tr>
      <tr id="trdark"> 
        <td nowrap width="25%" > 
          <div align="right">N&uacute;mero de Cuotas :</div>
        </td>
        <td nowrap width="39%"> 
          <div align="left"> 
            <input type="text" name="E01PVMST1" size="5" maxlength="4" value="<%= proposal.getE01PVMST1().trim()%>" onkeypress="enterInteger(event)">
          </div>
        </td>
        <td nowrap width="19%"> 
          <div align="right">Valor de la Cuota :</div>
        </td>
        <td nowrap width="17%"> 
          <div align="left"> 
            <input type="text" name="E01PVMSA2" size="16" maxlength="15" value="<%= proposal.getE01PVMSA2().trim()%>" onkeypress="enterDecimal(event, 2)">
          </div>
        </td>
      </tr>
    </table>
  </div>
 <h4>Cliente</h4>
  <table class="tbenter" width="100%" border="0" cellspacing=0 cellpadding=0>
    <tr> 
       <td nowrap> 
           <table id="TableTab" cellspacing=0 cellpadding=2 border="0">
					<tr> 
                          <td nowrap id="Tab0" class="tabhighlight" " onClick="showTab(0,'E01PVMFNA')"> 
                            <div>Info. B&aacute;sica</div>
                          
                          </td> 
                        
                          <td nowrap id="Tab1" class="tabnormal" onClick="showTab(1,'E01PVRFNAC')"> 
                            <div>Conyuge</div>
                          
                          </td> 
                        
                          <td nowrap id="Tab2" class="tabnormal" onClick="showTab(2,'E01PVRFNA1')"> 
                            <div >Referencias</div>
                          
                          </td>
                           
                      
                          <td nowrap id="Tab3" class="tabnormal" onClick="showTab(3,'E01PVMCP1')"> 
                            <div>Empleo</div>
                          
                          </td> 
                        
                          <td nowrap id="Tab4" class="tabnormal" onClick="showTab(4,'E01PVMICU')"> 
                            <div>Info. Financiera</div>
                          </td> 
                        
                          <td nowrap id="Tab5" class="tabnormal" onClick="showTab(5,'E01PVRFNA5')"> 
                            <div>Seguros</div>
                          </td> 
                        
                          <td class="tabempty" width="100%">&nbsp;                  
                    	  </td> 
                          
                        </tr>
            </table>
       </td>
    </tr>
  </table>
  <table class="tabdata" width="100%">
    <tr>
     <td nowrap>        

                      <div id="dataTab0"> 
                          <table width="100%" border="0" cellspacing="0" cellpadding="0">
                            <tr id="trdark"> 
                              <td nowrap width="25%"> 
                                
                              <div align="right">No Cliente :</div>
                              </td>
                              <td nowrap colspan="3"> <%= proposal.getE01PVMCUN().trim()%> 
                              </td>
                            </tr>
                            <tr id="trclear"> 
                              <td nowrap width="25%"> 
                                <div align="right">Nombres :</div>
                              </td>
                              <td nowrap colspan=3> 
                                <input type="text" name="E01PVMFNA" size="35" maxlength="30" value="<%= proposal.getE01PVMFNA().trim()%>">
                                <input type="text" name="E01PVMFN2" size="35" maxlength="30" value="<%= proposal.getE01PVMFN2().trim()%>">
                              </td>
                            </tr>
                            <tr id="trdark"> 
                              <td nowrap width="25%" > 
                                <div align="right">Apellidos :</div>
                              </td>
                              <td nowrap colspan=3> 
                                <input type="text" name="E01PVMLN1" size="35" maxlength="30" value="<%= proposal.getE01PVMLN1().trim()%>">
                                <input type="text" name="E01PVMLN2" size="35" maxlength="30" value="<%= proposal.getE01PVMLN2().trim()%>">
                              </td>
                            </tr>
                            <tr id="trclear"> 
                              <td nowrap width="25%"> 
                                <div align="right">Sexo :</div>
                              </td>
                              <td nowrap> 
                                <input type="radio" name="E01PVMSEX" value="F" <%if (proposal.getE01PVMSEX().equals("F")) out.print("checked"); %>>
                                Femenino 
                                <input type="radio" name="E01PVMSEX" value="M" <%if (proposal.getE01PVMSEX().equals("M")) out.print("checked"); %>>
                                Masculino </td>
                              <td nowrap> 
                                <div align="right">Estado Civil :</div>
                              </td>
                              <td nowrap> 
                                <div align="left"> 
                                  <select name="E01PVMMST">
                                    <option value=" " <% if (!(proposal.getE01PVMMST().equals("1")||proposal.getE01PVMMST().equals("2") || proposal.getE01PVMMST().equals("3")||proposal.getE01PVMMST().equals("4")||proposal.getE01PVMMST().equals("5"))) out.print("selected"); %>> 
                                    </option>
                                    <option value="1" <% if (proposal.getE01PVMMST().equals("1")) out.print("selected"); %>>Soltero(a)</option>
                                    <option value="2" <% if (proposal.getE01PVMMST().equals("2")) out.print("selected"); %>>Casado(a)</option>
                                    <option value="3" <% if (proposal.getE01PVMMST().equals("3")) out.print("selected"); %>>Divorciado(a)</option>
                                    <option value="4" <% if (proposal.getE01PVMMST().equals("4")) out.print("selected"); %>>Viudo(a)</option>
                                    <option value="5" <% if (proposal.getE01PVMMST().equals("5")) out.print("selected"); %>>Cohabitante</option>
                                  </select>
                                </div>
                              </td>
                            </tr>
                            <tr id="trdark"> 
                              <td nowrap width="25%" > 
                                <div align="right">Nacionalidad :</div>
                              </td>
                              <td nowrap  width="31%"> 
                                <p> 
                                  <input type="text" name="E01PVMCCS" size="6" maxlength="4" value="<%= proposal.getE01PVMCCS().trim()%>">
                                  <a href="javascript:GetCodeCNOFC('E01PVMCCS','03')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="ayuda" align="bottom" border="0" ></a> 
                                </p>
                              </td>
                              <td nowrap width="21%" > 
                                <div align="right">Dependientes :</div>
                              </td>
                              <td nowrap width="23%" > 
                                <input type="text" name="E01PVMNSO" size="4" maxlength="2" value="<%= proposal.getE01PVMNSO().trim()%>">
                              </td>
                            </tr>
                            <tr id="trclear"> 
                              <td nowrap width="25%" > 
                                <div align="right">Identificaci&oacute;n : </div>
                              </td>
                              <td nowrap  width="31%"> 
                                <input type="text" name="E01PVMIDN" size="20" maxlength="15" value="<%= proposal.getE01PVMIDN().trim()%>">
                              </td>
                              <td nowrap width="21%" > 
                                <div align="right">Tipo de Identificaci&oacute;n 
                                  : </div>
                              </td>
                              <td nowrap width="23%" > 
                                <input type="text" name="E01PVMIDT" size="8" maxlength="4" value="<%= proposal.getE01PVMIDT().trim()%>">
                                <a href="javascript:GetCodeCNOFC('E01PVMIDT','34')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="ayuda" align="bottom" border="0"></a> 
                              </td>
                            </tr>
                            <tr id="trdark"> 
                              <td nowrap width="25%" > 
                                <div align="right">Pa&iacute;s Identificaci&oacute;n 
                                  : </div>
                              </td>
                              <td nowrap> 
                                <div align="left"> 
                                  <input type="text" name="E01PVMIDP" size="5" maxlength="4" value="<%= proposal.getE01PVMIDP().trim()%>">
                                  <a href="javascript:GetCodeCNOFC('E01PVMIDP','03')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="ayuda" align="bottom" border="0" ></a> 
                                </div>
                              </td>
                              <td nowrap> 
                                <div align="right">Fecha de Nacimiento :</div>
                              </td>
                              <td nowrap> 
                                <div align="left"> 
								  <eibsinput:date name="proposal" fn_month="E01PVMBDM" fn_day="E01PVMBDD" fn_year="E01PVMBDY" />
                                </div>
                              </td>
                            </tr>
                            <tr id="trclear"> 
                              <td nowrap width="25%" > 
                                <div align="right">Direcci&oacute;n :</div>
                              </td>
                              <td nowrap colspan="3"> 
                                <div align="left"> 
                                  <input type="text" name="E01PVMNA2" size="45" maxlength="35" value="<%= proposal.getE01PVMNA2().trim()%>">
                                </div>
                              </td>
                            </tr>
                            <tr id="trdark"> 
                              <td nowrap width="25%" > 
                                <div align="right"></div>
                              </td>
                              <td nowrap colspan="3"> 
                                <div align="left"> </div>
                                <div align="right"></div>
                                <div align="left"> 
                                  <input type="text" name="E01PVMNA3" size="45" maxlength="35" value="<%= proposal.getE01PVMNA3().trim()%>">
                                </div>
                              </td>
                            </tr>
                            <tr id="trclear"> 
                              <td nowrap width="25%" > 
                                <div align="right">Ciudad :</div>
                              </td>
                              <td nowrap  width="31%"> 
                                <div align="left"> 
                                  <input type="text" name="E01PVMCTY" size="31" maxlength="30" value="<%= proposal.getE01PVMCTY().trim()%>">
                                </div>
                              </td>
                              <td nowrap width="21%" > 
                                <div align="right">Provincia :</div>
                              </td>
                              <td nowrap width="23%" > 
                                <div align="left"> 
                                  <input type="text" name="E01PVMCCI" size="5" maxlength="5" value="<%= proposal.getE01PVMCCI().trim()%>">
                                </div>
                              </td>
                            </tr>
                            <tr id="trdark"> 
                              <td nowrap width="25%" > 
                                <div align="right">Cant&oacute;n :</div>
                              </td>
                              <td nowrap  width="31%"> 
                                <div align="left"> 
                                  <input type="text" name="E01PVMCCO" size="5" maxlength="5" value="<%= proposal.getE01PVMCCO().trim()%>">
                                </div>
                              </td>
                              <td nowrap width="21%" > 
                                <div align="right">Parroquia :</div>
                              </td>
                              <td nowrap width="23%" > 
                                <div align="left">
                                  <input type="text" name="E01PVMUC2" size="5" maxlength="5" value="<%= proposal.getE01PVMUC2().trim()%>">
                                </div>
                              </td>
                            </tr>
                            <tr id="trclear">
                              <td nowrap width="25%" >
                                <div align="right">Tel&eacute;fono Casa :</div>
                              </td>
                              <td nowrap  width="31%">
                                <div align="left">
                                  <input type="text" name="E01PVMHPN" size="12" maxlength="11" value="<%= proposal.getE01PVMHPN().trim()%>">
                                </div>
                              </td>
                              <td nowrap width="21%" >
                                <div align="right">Tel&eacute;fono Negocio :</div>
                              </td>
                              <td nowrap width="23%" >
                                <div align="left">
                                  <input type="text" name="E01PVMPHN" size="12" maxlength="11" value="<%= proposal.getE01PVMPHN().trim()%>">
                                </div>
                              </td>
                            </tr>
                            <tr id="trdark"> 
                              <td nowrap width="25%" > 
                                <div align="right"> Direcci&oacute;n de eMail 
                                  :</div>
                              </td>
                              <td nowrap  width="31%"> 
                                <div align="left"> 
                                  <input type="text" name="E01PVMIAD" size="40" maxlength="40" value="<%= proposal.getE01PVMIAD().trim()%>">
                                </div>
                              </td>
                              <td nowrap width="21%" > 
                                <div align="right"></div>
                              </td>
                              <td nowrap width="23%" > 
                                <div align="left"> </div>
                              </td>
                            </tr>
                          </table>

  </div>
                        

<div id="dataTab1" style="display: none"> 
                          <table width="100%" border="0" cellspacing="0" cellpadding="0">
                            <tr id="trdark"> 
                              <td nowrap width="25%"> 
                                <div align="right">Nombres :</div>
                              </td>
                              <td nowrap colspan=3> 
                                <input type="text" name="E01PVRFNAC" size="35" maxlength="30" value="<%= proposal.getE01PVRFNAC().trim()%>">
                                <input type="text" name="E01PVRFN2C" size="35" maxlength="30" value="<%= proposal.getE01PVRFN2C().trim()%>">
                              </td>
                            </tr>
                            <tr id="trclear"> 
                              <td nowrap width="25%" > 
                                <div align="right">Apellidos :</div>
                              </td>
                              <td nowrap colspan=3> 
                                <input type="text" name="E01PVRLN1C" size="35" maxlength="30" value="<%= proposal.getE01PVRLN1C().trim()%>">
                                <input type="text" name="E01PVRLN2C" size="35" maxlength="30" value="<%= proposal.getE01PVRLN2C().trim()%>">
                              </td>
                            </tr>
                            <tr id="trdark"> 
                              <td nowrap width="25%" > 
                                <div align="right">Tel&eacute;fono Casa :</div>
                              </td>
                              <td nowrap  width="31%"> 
                                <div align="left"> 
                                  <input type="text" name="E01PVRHPNC" size="12" maxlength="11" value="<%= proposal.getE01PVRHPNC().trim()%>">
                                </div>
                              </td>
                              <td nowrap width="21%" > 
                                <div align="right">Tel&eacute;fono Negocio :</div>
                              </td>
                              <td nowrap width="23%" > 
                                <div align="left"> 
                                  <input type="text" name="E01PVRPHNC" size="12" maxlength="11" value="<%= proposal.getE01PVRPHNC().trim()%>">
                                </div>
                              </td>
                            </tr>
                          </table>                        

			 </div>
             <div id="dataTab2" style="display: none"> 
                    <% for (int i=1 ; i<5; i++) {
                          switch (i) {
                           case 1 : out.print("<H4>Primera Referencia</H4>");
                           			break;
                           case 2 : out.print("<H4>Segunda Referencia</H4>");
                           			break;
                           case 3 : out.print("<H4>Tercera Referencia</H4>");
                           			break;
                           case 4 : out.print("<H4>Cuarta Referencia</H4>");
                           			break;
                          }
                          %>
                          <table width="100%" border="0" cellspacing="0" cellpadding="0">
                            <tr id="trdark"> 
                              <td nowrap width="25%"> 
                                <div align="right">Nombres :</div>
                              </td>
                              <td nowrap colspan=3> 
                                <input type="text" name="E01PVRFNA<%=i%>" size="35" maxlength="30" value="<%= proposal.getField("E01PVRFNA" +i).getString().trim()%>">
                                <input type="text" name="E01PVRFN2<%=i%>" size="35" maxlength="30" value="<%= proposal.getField("E01PVRFN2" +i).getString().trim()%>">
                              </td>
                            </tr>
                            <tr id="trdark"> 
                              <td nowrap width="25%" > 
                                <div align="right">Apellidos :</div>
                              </td>
                              <td nowrap colspan=3> 
                                <input type="text" name="E01PVRLN1<%=i%>" size="35" maxlength="30" value="<%= proposal.getField("E01PVRLN1" +i).getString().trim()%>">
                                <input type="text" name="E01PVRLN2<%=i%>" size="35" maxlength="30" value="<%= proposal.getField("E01PVRLN2" +i).getString().trim()%>">
                              </td>
                            </tr>
                            <tr id="trdark"> 
                              <td nowrap width="25%" > 
                                <div align="right">Tel&eacute;fono Casa :</div>
                              </td>
                              <td nowrap  width="31%"> 
                                <div align="left"> 
                                  <input type="text" name="E01PVRHPN<%=i%>" size="12" maxlength="11" value="<%= proposal.getField("E01PVRHPN" +i).getString().trim()%>">
                                </div>
                              </td>
                              <td nowrap width="21%" > 
                                <div align="right">Tel&eacute;fono Negocio :</div>
                              </td>
                              <td nowrap width="23%" > 
                                <div align="left"> 
                                  <input type="text" name="E01PVRPHN<%=i%>" size="12" maxlength="11" value="<%= proposal.getField("E01PVRPHN" +i).getString().trim()%>">
                                </div>
                              </td>
                            </tr>
                            <tr id="trdark"> 
                              <td nowrap width="25%" > 
                                <div align="right">Tipo de Relaci&oacute;n :</div>
                              </td>
                              <td nowrap colspan="3">
                                <div align="left">
								<select name="E01PVRRLT<%=i%>">
                                    <option value="1" <% if (proposal.getField("E01PVRRLT" +i).getString().equals("1")) out.print("selected"); %>>Conyuge</option>
                                    <option value="2" <% if (proposal.getField("E01PVRRLT" +i).getString().equals("2")) out.print("selected"); %>>Padre/Madre</option>
                                    <option value="3" <% if (proposal.getField("E01PVRRLT" +i).getString().equals("3")) out.print("selected"); %>>Hermano(a)</option>
                                    <option value="4" <% if (proposal.getField("E01PVRRLT" +i).getString().equals("4")) out.print("selected"); %>>Hijo(a)</option>
                                    <option value="5" <% if (!(proposal.getField("E01PVRRLT" +i).getString().equals("1")||proposal.getField("E01PVRRLT" +i).getString().equals("2") || proposal.getField("E01PVRRLT" +i).getString().equals("3")||proposal.getField("E01PVRRLT" +i).getString().equals("4"))) out.print("selected"); %>>No Relacion</option>
                                  </select>
								</div>
                              </td>
                            </tr>
                          </table>
					<% } %>       

        	 </div>
             <div id="dataTab3" style="display: none"> 
					<table width="100%" border="0" cellspacing="0" cellpadding="0">
					    		  <tr id="trdark"> 
                                    <td nowrap colspan="2"> 
                                      <div align="right">Nombre de la Empresa 
                                        :</div>
                                    </td>
                                    <td nowrap colspan="2"> 
                                      <input type="text" name="E01PVMCP1" size="31" maxlength="30" value="<%= proposal.getE01PVMCP1().trim()%>">
                                    </td>
                                  </tr>
                                  <tr id="trclear"> 
                                    <td nowrap colspan="2"> 
                                      <div align="right">Direcci&oacute;n :</div>
                                    </td>
                                    <td nowrap colspan="2"> 
                                      <input type="text" name="E01PVMCP2" size="31" maxlength="30" value="<%= proposal.getE01PVMCP2().trim()%>">
                                    </td>
                                  </tr>
                                  <tr id="trdark"> 
                                    <td nowrap colspan="2" > 
                                      <div align="right">ID. Empresa :</div>
                                    </td>
                                    <td nowrap colspan="2" > 
                                      <div align="left"> 
                                        <input type="text" name="E01PVMCPR" size="15" maxlength="15" value="<%= proposal.getE01PVMCPR().trim()%>">
                                      </div>
                                    </td>
                                  </tr>
                                  <tr id="trclear"> 
                                    <td nowrap colspan="2" > 
                                      <div align="right">Cargo :</div>
                                    </td>
                                    <td nowrap colspan="2" > 
                                      <input type="text" name="E01PVMCP3" size="31" maxlength="30" value="<%= proposal.getE01PVMCP3().trim()%>">
                                    </td>
                                  </tr>
                                  <tr id="trdark"> 
                                    <td nowrap > 
                                      <div align="right">Antiguedad :</div>
                                    </td>
                                    <td nowrap > 
                                      <input type="text" name="E01PVMTIM" size="3" maxlength="2" value="<%= proposal.getE01PVMTIM().trim()%>">
                                    </td>
                                    <td nowrap > 
                                      <div align="right">Fecha Ingreso Empleo 
                                        Actual :</div>
                                    </td>
                                    <td nowrap > 
									  <eibsinput:date name="proposal" fn_month="E01PVMSWM" fn_day="E01PVMSWD" fn_year="E01PVMSWY" />
                                    </td>
                                  </tr>
                                  <tr id="trclear"> 
                                    <td nowrap > 
                                      <div align="right">Tipo de Salario :</div>
                                    </td>
                                    <td nowrap > 
                                      <select name="E01PVMSAT">
                                        <option value=" " <% if (!(proposal.getE01PVMSAT().equals("W") || proposal.getE01PVMSAT().equals("B") || proposal.getE01PVMSAT().equals("M") || proposal.getE01PVMSAT().equals("S") || proposal.getE01PVMSAT().equals("Y")) ) out.print("selected");%>></option>
                                        <option value="W" <% if (proposal.getE01PVMSAT().equals("W")) out.print("selected"); %>>Semanal</option>
                                        <option value="B" <% if (proposal.getE01PVMSAT().equals("B")) out.print("selected"); %>>Quincenal</option>
                                        <option value="M" <% if (proposal.getE01PVMSAT().equals("M")) out.print("selected"); %>>Mensual</option>
                                        <option value="S" <% if (proposal.getE01PVMSAT().equals("S")) out.print("selected"); %>>Semestral</option>
                                        <option value="Y" <% if (proposal.getE01PVMSAT().equals("Y")) out.print("selected"); %>>Anual</option>
                                      </select>
                                    </td>
                                    <td nowrap > 
                                      <div align="right">Relaci&oacute;n :</div>
                                    </td>
                                    <td nowrap > 
                                      <select name="E01PVMRWT">
                                        <option value=" " <% if (!(proposal.getE01PVMRWT().equals("1") || proposal.getE01PVMRWT().equals("2")) ) out.print("selected");%>></option>
                                        <option value="1" <% if (proposal.getE01PVMRWT().equals("1")) out.print("selected"); %>="">Autonomo</option>
                                        <option value="2" <% if (proposal.getE01PVMRWT().equals("2")) out.print("selected"); %>="">Dependiente</option>
                                      </select>
                                    </td>
                                  </tr>
                                  <tr id="trdark"> 
                                    <td nowrap > 
                                      <div align="right">Dia de Pago Salario :</div>
                                    </td>
                                    <td nowrap > 
                                      <input type="text" name="E01PVMDPG" size="3" maxlength="2" value="<%= proposal.getE01PVMDPG().trim()%>">
                                    </td>
                                    <td nowrap > 
                                      <div align="right">C&oacute;digo Industria 
                                        :</div>
                                    </td>
                                    <td nowrap > 
                                      <input type="text" name="E01PVMICD" size="4" maxlength="4" value="<%= proposal.getE01PVMICD().trim()%>" onKeyPress="enterInteger(event)">
                                    </td>
                                  </tr>
                                </table>
                          
</div>
          <div id="dataTab4" style="display: none"> 
					<table width="100%" border="0" cellspacing="0" cellpadding="0">
								<tr id="trclear"> 
                                    <td nowrap colspan="4"> 
                                      <div align="left"><b>Ingresos</b></div>
                                    </td>
                                  </tr>
                                  <tr id="trdark"> 
                                    <td nowrap> 
                                      <div align="right">Ingreso L&iacute;quido:</div>
                                    </td>
                                    <td nowrap> 
                                      <input type="text" name="E01PVMICU" size="17" maxlength="15" value="<%= proposal.getE01PVMICU().trim()%>" onKeypress="enterDecimal(event, 2)">
                                    </td>
                                    <td nowrap> 
                                      <div align="right">Otros Ingresos :</div>
                                    </td>
                                    <td nowrap> 
                                      <input type="text" name="E01PVMAM2" size="17" maxlength="15" value="<%= proposal.getE01PVMAM2().trim()%>" onKeyPress="enterDecimal(event, 2)">
                                    </td>
                                  </tr>
                                  <tr id="trclear"> 
                                    <td nowrap colspan="4" > 
                                      <div align="left"><b>Egresos</b></div>
                                    </td>
                                  </tr>
                                  <tr id="trdark"> 
                                    <td nowrap > 
                                      <div align="right">Egresos :</div>
                                    </td>
                                    <td nowrap > 
                                      <INPUT type="text" name="E01PVMECU" size="17" maxlength="15" value="<%= proposal.getE01PVMECU().trim()%>" onkeypress="enterDecimal(event, 2)">
                                    </td>
                                    <td nowrap > 
                                      <div align="right">Otros Egresos :</div>
                                    </td>
                                    <td nowrap > 
                                      <input type="text" name="E01PVMEWF" size="17" maxlength="15" value="<%= proposal.getE01PVMEWF().trim()%>" onKeyPress="enterDecimal(event, 2)">
                                    </td>
                                  </tr>
                                  <tr id="trdark"> 
                                    <td nowrap > 
                                      <div align="right">Pr&eacute;stamos Empresa 
                                        : </div>
                                    </td>
                                    <td nowrap > 
                                      <div align="left">
                                        <input type="text" name="E01PVMAM4" size="17" maxlength="15" value="<%= proposal.getE01PVMAM4().trim()%>" onKeyPress="enterDecimal(event, 2)">
                                      </div>
                                    </td>
                                    <td nowrap > 
                                      <div align="right">Pr&eacute;stamos IESS 
                                        : </div>
                                    </td>
                                    <td nowrap > 
                                      <div align="left">
                                        <input type="text" name="E01PVMAM5" size="17" maxlength="15" value="<%= proposal.getE01PVMAM5().trim()%>" onKeyPress="enterDecimal(event, 2)">
                                      </div>
                                    </td>
                                  </tr>
                                  <tr id="trdark"> 
                                    <td nowrap > 
                                      <div align="right"> Central de Riesgos :</div>
                                    </td>
                                    <td nowrap > 
                                      <div align="left">
                                        <input type="text" name="E01PVMAM7" size="17" maxlength="15" value="<%= proposal.getE01PVMAM7().trim()%>" onKeyPress="enterDecimal(event, 2)">
                                      </div>
                                    </td>
                                    <td nowrap > 
                                      <div align="right">Coop. Pr&eacute;stamos 
                                        : </div>
                                    </td>
                                    <td nowrap > 
                                      <div align="left">
                                        <input type="text" name="E01PVMAM6" size="17" maxlength="15" value="<%= proposal.getE01PVMAM6().trim()%>" onKeyPress="enterDecimal(event, 2)">
                                      </div>
                                    </td>
                                  </tr>
                                  
                                </table>
                             
                          
                        </div>
             <div id="dataTab5" style="display: none"> 
					<% for (int i=5 ; i<9; i++) {
                          switch (i) {
                           case 5 : out.print("<H4>Primer Beneficiario de Seguro</H4>");
                           			break;
                           case 6 : out.print("<H4>Segundo Beneficiario de Seguro</H4>");
                           			break;
                           case 7 : out.print("<H4>Tercero Beneficiario de Seguro</H4>");
                           			break;
                           case 8 : out.print("<H4>Cuarto Beneficiario de Seguro</H4>");
                           			break;
                          }
                          %>
                          <table width="100%" border="0" cellspacing="0" cellpadding="0">
                            <tr id="trdark"> 
                              <td nowrap width="25%"> 
                                <div align="right">Nombres :</div>
                              </td>
                              <td nowrap colspan=3> 
                                <input type="text" name="E01PVRFNA<%=i%>" size="35" maxlength="30" value="<%= proposal.getField("E01PVRFNA" +i).getString().trim()%>">
                                <input type="text" name="E01PVRFN2<%=i%>" size="35" maxlength="30" value="<%= proposal.getField("E01PVRFN2" +i).getString().trim()%>">
                              </td>
                            </tr>
                            <tr id="trdark"> 
                              <td nowrap width="25%" > 
                                <div align="right">Apellidos :</div>
                              </td>
                              <td nowrap colspan=3> 
                                <input type="text" name="E01PVRLN1<%=i%>" size="35" maxlength="30" value="<%= proposal.getField("E01PVRLN1" +i).getString().trim()%>">
                                <input type="text" name="E01PVRLN2<%=i%>" size="35" maxlength="30" value="<%= proposal.getField("E01PVRLN2" +i).getString().trim()%>">
                              </td>
                            </tr>
                            <tr id="trdark"> 
                              <td nowrap width="25%" > 
                                <div align="right">Tel&eacute;fono Casa :</div>
                              </td>
                              <td nowrap  width="31%"> 
                                <div align="left"> 
                                  <input type="text" name="E01PVRHPN<%=i%>" size="12" maxlength="11" value="<%= proposal.getField("E01PVRHPN" +i).getString().trim()%>">
                                </div>
                              </td>
                              <td nowrap width="21%" > 
                                <div align="right">Tel&eacute;fono Negocio :</div>
                              </td>
                              <td nowrap width="23%" > 
                                <div align="left"> 
                                  <input type="text" name="E01PVRPHN<%=i%>" size="12" maxlength="11" value="<%= proposal.getField("E01PVRPHN" +i).getString().trim()%>">
                                </div>
                              </td>
                            </tr>
                            <tr id="trdark"> 
                              <td nowrap width="25%" > 
                                <div align="right">Tipo de Relaci&oacute;n :</div>
                              </td>
                              <td nowrap>
                                <select name="E01PVRRLT<%=i%>">
                                    <option value="1" <% if (proposal.getField("E01PVRRLT" +i).getString().equals("1")) out.print("selected"); %>>Conyuge</option>
                                    <option value="2" <% if (proposal.getField("E01PVRRLT" +i).getString().equals("2")) out.print("selected"); %>>Padre/Madre</option>
                                    <option value="3" <% if (proposal.getField("E01PVRRLT" +i).getString().equals("3")) out.print("selected"); %>>Hermano(a)</option>
                                    <option value="4" <% if (proposal.getField("E01PVRRLT" +i).getString().equals("4")) out.print("selected"); %>>Hijo(a)</option>
                                    <option value="5" <% if (!(proposal.getField("E01PVRRLT" +i).getString().equals("1")||proposal.getField("E01PVRRLT" +i).getString().equals("2") || proposal.getField("E01PVRRLT" +i).getString().equals("3")||proposal.getField("E01PVRRLT" +i).getString().equals("4"))) out.print("selected"); %>>No Relacion</option>
                                  </select>
							  </td>
							  <td nowrap > 
                                  <div align="right">Monto :</div>
                              </td>
                              <td nowrap > 
                                 <input type="text" name="E01PVRAMT<%=i%>" size="17" maxlength="15" value="<%= proposal.getField("E01PVRAMT" +i).getString().trim()%>" onKeyPress="enterDecimal(event, 2)">
                              </td>
                            </tr>
                          </table>
					<% } %>
             </div>
                   
	</td>
    </tr>
  </table>
<p align="center"> 
    <input id="EIBSBTN" type=SUBMIT name="Submit" value="Enviar" >
  </p>

</form>
  

</body>
</html>
