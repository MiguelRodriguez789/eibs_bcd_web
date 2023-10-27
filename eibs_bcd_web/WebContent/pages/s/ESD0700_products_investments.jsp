<%@page import="com.datapro.eibs.constants.ISOCodes"%>
<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>

<%@ page import = "datapro.eibs.master.Util" %>
<%@page import="com.datapro.constants.EibsFields"%>
<%@page import="com.datapro.eibs.constants.HelpTypes"%>
<html> 
<head>
<title>Productos para Papel Commercial</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<SCRIPT SRC="<%=request.getContextPath()%>/pages/s/javascripts/dynlayer.js"> </SCRIPT>
<SCRIPT SRC="<%=request.getContextPath()%>/pages/s/javascripts/pop_out.js"> </SCRIPT>
<SCRIPT	SRC="<%=request.getContextPath()%>/pages/s/javascripts/nav_aid.js"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>

</head>

<jsp:useBean id="prd" class="datapro.eibs.beans.ESD070001Message"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>
<jsp:useBean id="currUser" class="datapro.eibs.beans.ESS0030DSMessage" scope="session" />

<body>

<% 
 if ( !error.getERRNUM().equals("0")  ) {
     error.setERRNUM("0");
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
     }
%>

<h3 align="center">Producto para Papel Commercial<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" alt="products_investments.jsp, ESD0700"></h3>
<hr size="4">

<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSESD0700" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="1">
  <INPUT TYPE=HIDDEN NAME="E01APCACD" VALUE="<%= prd.getE01APCACD()%>">
  <INPUT TYPE=HIDDEN NAME="DSCTYPINV" VALUE="">
  <table class="tableinfo">
    <tr > 
      <td> 
        <table cellspacing="0" cellpadding="2" width="100%"  class="tbhead"  align="center">
          <tr> 
            <td nowrap width="10%" align="right"> Banco: </td>
            <td nowrap width="12%" align="left"> 
              <input type="text"  name="E01APCBNK" size="3" maxlength="2" value="<%= prd.getE01APCBNK()%>" readonly>
            </td>
            <td nowrap width="6%" align="right"> Producto: </td>
            <td nowrap width="14%" align="left"> 
              <input type="text"  name="E01APCCDE" size="6" maxlength="4" value="<%= prd.getE01APCCDE()%>" readonly>
            </td>
            <td nowrap width="8%" align="right"> Tipo de Producto : </td>
            <td nowrap width="50%"align="left"> 
              <input type="text"  name="E01APCTYP" size="6" maxlength="4" value="<%= prd.getE01APCTYP()%>" readonly>
              - 
              <input type="text"  name="E01DSCTYP" size="25" maxlength="25" value="<%= prd.getE01DSCTYP()%>" readonly>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
 
 <%int row = 1; %> 
  <h4>Información General</h4>

  <table class="tableinfo">
    <tr > 
      <td > 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="trdark"> 
            <td> 
              <div align="right">Descripci&oacute;n :</div>
            </td>
            <td> 
              <input type="text"  name="E01APCDS1" size="40" maxlength="40" value="<%= prd.getE01APCDS1()%>">
            </td>
            <td> 
              <div align="right">Nombre de Mercadeo :</div>
            </td>
            <td> 
              <input type="text"  name="E01APCDS2" size="17" maxlength="15" value="<%= prd.getE01APCDS2()%>">
            </td>
          </tr>
          <tr id="trclear"> 
            <td > 
              <div align="right">Código de Moneda :</div>
            </td>
            <td > 
              <input type="text"  name="E01APCCCY" size="3" maxlength="3" value="<%= prd.getE01APCCCY()%>">
              <a href="javascript:GetCurrency('E01APCCCY','')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt=". . ." align="bottom" border="0" ></a> 
            </td>
            <td > 
              <div align="right">Ofrecimiento por :</div>
            </td>
            <td ><SELECT name="E01APCFTT">
					<OPTION value="1"
						<%if (prd.getE01APCFTT().equals("1")) { out.print("selected"); }%>>Internet</OPTION>
					<OPTION value="I"
						<%if (prd.getE01APCFTT().equals("I")) { out.print("selected"); }%>>Internacional</OPTION>
					<OPTION value="L"
						<%if (prd.getE01APCFTT().equals("L")) { out.print("selected"); }%>>Local</OPTION>
					<OPTION value="3"
						<%if (prd.getE01APCFTT().equals("3")) { out.print("selected"); }%>>Plataforma</OPTION>
					<OPTION value="5"
						<%if (prd.getE01APCFTT().equals("5")) { out.print("selected"); }%>>Cualquier Medio</OPTION>
					<OPTION value="N"
						<%if (prd.getE01APCFTT().equals("N")) { out.print("selected"); }%>>No Ofrecer</OPTION>
				</SELECT>
            </td>
          </tr>
          <tr id="trdark"> 
            <td > 
              <div align="right"> Cuenta Contable:</div>
            </td>
            <td > 
              <input type="text"  name="E01APCGLN" size="18" maxlength="16" value="<%= prd.getE01APCGLN().trim()%>">
              <a href="javascript:GetLedger('E01APCGLN',document.forms[0].E01APCBNK.value,document.forms[0].E01APCCCY.value,'')">
              <img src="<%=request.getContextPath()%>/images/1b.gif" alt=". . ." align="bottom" border="0" ></a> 
            </td>
            <td align="right"></td>
          	<td width="25%"> 
            </td>
          </tr>                   
        </table>
      </td>
    </tr>
  </table>

<h4>Impuestos </h4>
<table class="tableinfo">
    <tr > 
      <td nowrap > 
        <table cellspacing=0 cellpadding=2 width="100%" border="0">
        <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="10%" > 
              <div align="center"> </div>
            </td>
            <td nowrap width="10%" > 
              <div align="center">ISR</div>
            </td>
            <td nowrap width="10%" > 
              <div align="center">IVA/ITBMS</div>
            </td>
            <td nowrap width="10%" > 
              <div align="center">IDB/GMF</div>
            </td>
            <td nowrap width="10%" > 
              <div align="center"> <%if(currUser.getE01INT().equals(ISOCodes.getIBSCountryCode("PA"))){ %>  FECI <% } %></div>
            </td>
            <td nowrap width="10%" > 
              <div align="center"> </div>
            </td>
        </tr>        
         <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="10%" > 
              <div align="center"> </div>
            </td>
            <td nowrap width="10%"  > 
              <div align="center"> 
				<select id="E01APCTX1" name="E01APCTX1" >
				    <option value=" " selected> &nbsp; </option>
				    <option value="1" <% if(prd.getE01APCTX1().equals("1")) out.print("selected");%>> SI </option>
				    <option value="0" <% if(prd.getE01APCTX1().equals("0")) out.print("selected");%>> NO </option>
				</select>        
              </div>
            </td>
            <td nowrap width="10%"  > 
              <div align="center"> 
				<select id="E01APCTX2" name="E01APCTX2" >
				    <option value=" " selected> &nbsp; </option>
				    <option value="1" <% if(prd.getE01APCTX2().equals("1")) out.print("selected");%>> SI </option>
				    <option value="0" <% if(prd.getE01APCTX2().equals("0")) out.print("selected");%>> NO </option>
				</select>        
              </div>
            </td>
            <td nowrap width="10%" > 
              <div align="center"> 
				<select id="E01APCTX3" name="E01APCTX3" >
				    <option value=" " selected> &nbsp; </option>
				    <option value="1" <% if(prd.getE01APCTX3().equals("1")) out.print("selected");%>> SI </option>
				    <option value="0" <% if(prd.getE01APCTX3().equals("0")) out.print("selected");%>> NO </option>
				</select>        
              </div>
            </td>
            <td nowrap width="10%" > 
              <div align="center"> 
<%if(currUser.getE01INT().equals(ISOCodes.getIBSCountryCode("PA"))){ %> 
				<select id="E01APCTX4" name="E01APCTX4" >
				    <option value=" " selected> &nbsp; </option>
				    <option value="1" <% if(prd.getE01APCTX4().equals("1")) out.print("selected");%>> SI </option>
				    <option value="0" <% if(prd.getE01APCTX4().equals("0")) out.print("selected");%>> NO </option>
				</select>                 
<% } %>
			</div>
            </td>
            <td nowrap width="10%" > 
              <div align="center"> </div>
            </td>
         </tr>
        </table>
      </td>
    </tr>
  </table>
  
  <h4>Información Adicional</h4>

  <table class="tableinfo">
    <tr> 
      <td> 
      	<table cellspacing="0" cellpadding="2" width="100%" border="0">  
       	  <tr id="trdark">
       			<td nowrap align="center"> </td>
          		<td nowrap align="center"> </td>
           		<td nowrap align="right"><b>SOLO PARA BONOS</b></td>
           		<td nowrap  align="center"><td>
       	  </tr>
          <tr id="trdark"> 
            <td align="right">Tipo de Inversion : </td>
          	<td>
            	<input type="text"  name="E01APCINV" size="4" maxlength="2" value="<%= prd.getE01APCINV()%>">
            	<a href="javascript:GetCodeCNOFC('E01APCINV','TI')">
            	<img src="<%=request.getContextPath()%>/images/1b.gif" alt=". . ." align="bottom" border="0" ></a>
            </td>   
            <td align="right">Periodo de Pago Cupon : </td>
            <td>
            	<input type="text"  name="E01APCROY" size="4" maxlength="3" value="<%= prd.getE01APCROY()%>">
            </td>
          </tr>
          <tr id="trclear">
         	 <td align="right">Tipo de Portafolio : </td>
            <td>
            	<input type="text"  name="E01APCITP" size="4" maxlength="2" value="<%= prd.getE01APCITP().trim()%>">                
            	<a href="javascript:GetCode('E01APCITP','STATIC_pc_prod_typ_port.jsp')">
            	<img src="<%=request.getContextPath()%>/images/1b.gif" alt=". . ." align="bottom" border="0" ></a>
            </td>
            <td align="right">Tipo de Amortización : </td>
            <td>
            	<select name="E01APCAMO">
                	<option value="S" <%if (prd.getE01APCAMO().equals("S")) { out.print("selected"); }%>>StraightLine</option>
               	 	<option value="L" <%if (prd.getE01APCAMO().equals("L")) { out.print("selected"); }%>>Level Yield</option>
                </select>
            </td> 
          </tr>
          <tr id="trdark">
          	<td align="right">Tabla Documentos : </td>
          	<td width="25%"> 
            	<input type="text"  name="E01APCDOC" size="4" maxlength="2" value="<%= prd.getE01APCFTF().trim()%>">                
          		<a href="javascript:GetDocInv('E01APCDOC')">
          		<img src="<%=request.getContextPath()%>/images/1b.gif" alt=". . ." align="bottom" border="0"></a>
          	</td>	 
            <td align="right">Tipo de Revaluación : </td>
          	<td width="25%"> 
            	<input type="text"  name="E01APCFRN" size="4" maxlength="2" value="<%= prd.getE01APCFRN().trim()%>">                
            	<a href="javascript:GetCode('E01APCFRN','STATIC_pc_prod_typ_rev.jsp')">
            	<img src="<%=request.getContextPath()%>/images/1b.gif" alt=". . ." align="bottom" border="0" ></a>
            </td>            
          </tr>
          <tr id="trclear">
          	<td align="right">Calculo de Interes : </td>
          	<td>
            	<input type="text"  name="E01APCICT" size="4" maxlength="2" value="<%= prd.getE01APCICT().trim()%>">                
            	<a href="javascript:GetCode('E01APCICT','STATIC_pc_prod_calc_int.jsp')">
            	<img src="<%=request.getContextPath()%>/images/1b.gif" alt=". . ." align="bottom" border="0"></a> 
          	</td>
          	<td align="right">Producto Familia : </td>
          	<td>
          		<input type="text"  name="E01APCUC1" size="4" maxlength="2" value="<%= prd.getE01APCUC1().trim()%>">                
          	</td>
          </tr>
          <tr id="trdark">
          	<td align="right">Días Cambio Vencido : </td>
          	<td>
          		<input type="text"  name="E01APCIPD" size="4" maxlength="2" value="<%= prd.getE01APCIPD().trim()%>">          		
          	</td>
          	<td align="right"></td>
          	<td>
          	</td>
          </tr>          
        </table>
      </td>
    </tr>  
 </table>            
<p>
  <div align="center"> 
    <input id="EIBSBTN" type=button name="Submit" OnClick="submit()" value="Enviar">
  </div>
</p>
 </form>
</body>
</html>
