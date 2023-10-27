<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>Transacciones Cajero</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Studio">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/jquery/plugins/contextMenu/css/jquery.contextMenu.css" rel="stylesheet" type="text/css" />

<jsp:useBean id="teller" class="datapro.eibs.beans.EDD032001Message"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>


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
<H3 align="center">Transacciones Cajero<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="teller_transactions_basic, EDD0320"></H3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.teller.JSEDD0320" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" value="200">
  <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
          <tr id="trdark"> 
            <td nowrap width="16%" > 
              <div align="right"><b>Código :</b></div>
            </td>
            <td nowrap width="20%" > 
              <div align="left"> 
                <input type="text" name="E01TDRTCD" id="E01TDRTCD" size="5" maxlength="4" value="<%= teller.getE01TDRTCD().trim()%>" readonly>
              </div>  
            </td>
            <td nowrap width="16%" > 
              <div align="right"><b>Descripción :</b></div>
            </td>
            <td nowrap  > 
              <div align="left"> 
                <input type="text" name="E01TDRITD" id="E01TDRITD" size="65" maxlength="60" readonly value="<%= teller.getE01TDRITD().trim()%>">
              </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>

  <H4>Información de Cuentas</H4>
  <TABLE class="tableinfo" align="center">
  <TR><TD>
  
   <table id="headTable1">
    <tr id="trdark"> 
      <td nowrap align="center" ></td>
      <td nowrap align="center" >Indicador Cuentas</td>
      <td nowrap align="center" >Banco </td>
      <td nowrap align="center" >Moneda</td>
      <td nowrap align="center" >Cuenta Contable</td>
      <td nowrap align="center" >Cuenta</td>
    </tr>
    </table> 
      
    <div id="dataDiv1"  >
     <table id="dataTable1" >
	    <tr id="trclear"> 
	      <td nowrap > 
	        <div align="right">Cuenta Débito :</div>
	      </td>
	      <td nowrap > 
	      	<div align="center"> 
              <select name="E01TDRDAF" id="E01TDRDAF">
                <option value=" " <% if (!(teller.getE01TDRDAF().equals("1") ||teller.getE01TDRDAF().equals("2")||teller.getE01TDRDAF().equals("3"))) out.print("selected"); %>></option>
                <option value="1" <% if(teller.getE01TDRDAF().equals("1")) out.print("selected");%>>Cuenta Contable Cajero</option>
                <option value="2" <% if(teller.getE01TDRDAF().equals("2")) out.print("selected");%>>Cuenta Cliente</option>
                <option value="3" <% if(teller.getE01TDRDAF().equals("3")) out.print("selected");%>>Cuenta Ingreso Manual</option>
              </select>
              </div>
	      </td>
	      <td nowrap > 
	        <div align="center"> 
	          <input type="text" name="E01TDRDBN" id="E01TDRDBN" size="3" maxlength="2" value="<%= teller.getE01TDRDBN().trim()%>" onkeypress="enterInteger(event)">
	        </div>
	      </td>
	      <td nowrap  > 
	        <div align="center"> 
	          <input type="text" name="E01TDRDCY" id="E01TDRDCY" size="4" maxlength="3" value="<%= teller.getE01TDRDCY().trim()%>"
	                class="context-menu-help" onmousedown="init(currencyHelp,this.name,document.getElementById('E01TDRDBN').value,'','','','')">
	        </div>
	      </td>
	      <td nowrap > 
	        <div align="center"> 
	          <input type="text" name="E01TDRDGL" id="E01TDRDGL" size="18" maxlength="16" value="<%= teller.getE01TDRDGL().trim()%>" onkeypress="enterInteger(event)"
	                 class="context-menu-help" onmousedown="init(ledgerHelp,this.name,document.getElementById('E01TDRDBN').value,document.getElementById('E01TDRDCY').value,'','','')" >
	        </div>
	      </td>
	      <td nowrap > 
	        <div align="center"> 
	          <input type="text" name="E01TDRDRA" id="E01TDRDRA" size="13" maxlength="12"  value="<%= teller.getE01TDRDRA().trim()%>" onkeypress="enterInteger(event)"
	                class="context-menu-help" onmousedown="init(openingWireHelp,this.name,document.getElementById('E01TDRDBN').value,'','','','RT')"  >
	        </div>
	      </td>
	    </tr>
	    <tr id="trclear"> 
	      <td nowrap > 
	        <div align="right">Cuenta Crédito :</div>
	      </td>
	      <td nowrap > 
	      	<div align="center">
              <select name="E01TDRCAF" id="E01TDRCAF">
                <option value=" " <% if (!(teller.getE01TDRCAF().equals("1") ||teller.getE01TDRCAF().equals("2")||teller.getE01TDRCAF().equals("3"))) out.print("selected"); %>></option>
                <option value="1" <% if(teller.getE01TDRCAF().equals("1")) out.print("selected");%>>Cuenta Contable Cajero</option>
                <option value="2" <% if(teller.getE01TDRCAF().equals("2")) out.print("selected");%>>Cuenta Cliente</option>
                <option value="3" <% if(teller.getE01TDRCAF().equals("3")) out.print("selected");%>>Cuenta Ingreso Manual</option>
              </select>
              </div>
	      </td>	      
	      <td nowrap > 
	        <div align="center"> 
	          <input type="text" name="E01TDRCBN" id="E01TDRCBN" size="3" maxlength="2" value="<%= teller.getE01TDRCBN().trim()%>" onkeypress="enterInteger(event)">
	        </div>
	      </td>
	      <td nowrap  > 
	        <div align="center"> 
	          <input type="text" name="E01TDRCCY" id="E01TDRCCY" size="4" maxlength="3" value="<%= teller.getE01TDRCCY().trim()%>"
	                class="context-menu-help" onmousedown="init(currencyHelp,this.name,document.getElementById('E01TDRCBN').value,'','','','')">
	        </div>
	      </td>
	      <td nowrap > 
	        <div align="center"> 
	          <input type="text" name="E01TDRCGL" id="E01TDRCGL" size="18" maxlength="16" value="<%= teller.getE01TDRCGL().trim()%>" onkeypress="enterInteger(event)"
	                 class="context-menu-help" onmousedown="init(ledgerHelp,this.name,document.getElementById('E01TDRCBN').value,document.getElementById('E01TDRCCY').value,'','','')" >
	        </div>
	      </td>
	      <td nowrap > 
	        <div align="center"> 
	          <input type="text" name="E01TDRCRA" id="E01TDRCRA" size="13" maxlength="12"  value="<%= teller.getE01TDRCRA().trim()%>" onkeypress="enterInteger(event)"
	                class="context-menu-help" onmousedown="init(openingWireHelp,this.name,document.getElementById('E01TDRCBN').value,'','','','RT')"  >
	        </div>
	      </td>
	    </tr>
     </table>
    </div>
  </TD>  
</TR>	
</TABLE>    

  <H4>Información Cheques</H4>
  <TABLE class="tableinfo" align="center">
  <TR><TD>
  
   <table id="headTable4">
    <tr id="trdark"> 
      <td nowrap align="center" ></td>
      <td nowrap align="center" >Indicador Cuentas</td>
      <td nowrap align="center" >Banco </td>
      <td nowrap align="center" >Moneda</td>
      <td nowrap align="center" >Cuenta Contable</td>
      <td nowrap align="center" >Días Retención</td>
    </tr>
    </table> 
      
    <div id="dataDiv4"  >
     <table id="dataTable4" >
	    <tr id="trclear"> 
	      <td nowrap > 
	        <div align="right">Propios No Retenidos :</div>
	      </td>
	      <td nowrap > 
	      	<div align="center">
              <select name="E01TDRONF" id="E01TDRONF">
                <option value=" " <% if(!teller.getE01TDRONF().equals("1")) out.print("selected");%>></option>
                <option value="1" <% if(teller.getE01TDRONF().equals("1")) out.print("selected");%>>Cuenta Contable Cajero</option>
              </select>
              </div>
	      </td>
	      <td nowrap > 
	        <div align="center"> 
	          <input type="text" name="E01TDRONB" id="E01TDRONB" size="3" maxlength="2" value="<%= teller.getE01TDRONB().trim()%>" onkeypress="enterInteger(event)">
	        </div>
	      </td>
	      <td nowrap  > 
	        <div align="center"> 
				<input type="text" name="E01TDRONC" id="E01TDRONC" size="4" maxlength="3" value="<%= teller.getE01TDRONC().trim()%>" 
					class="context-menu-help" onmousedown="init(currencyHelp,this.name,document.getElementById('E01TDRONB').value,'','','','')">	        
			</div>
	      </td>
	      <td nowrap > 
	        <div align="center"> 
	          <input type="text" name="E01TDRONG" id="E01TDRONG" size="18" maxlength="16" value="<%= teller.getE01TDRONG().trim()%>" onkeypress="enterInteger(event)" 
					class="context-menu-help" onmousedown="init(ledgerHelp,this.name,document.getElementById('E01TDRONB').value,document.getElementById('E01TDRONC').value,'','','')" >
	        </div>
	      </td>
	      <td nowrap > 
	        <div align="center"> 
	          
	        </div>
	      </td>
	    </tr>
	    <tr id="trclear"> 
	      <td nowrap > 
	        <div align="right">Propios Retenidos :</div>
	      </td>
	      <td nowrap > 
	      	<div align="center"> 
              <select name="E01TDROHF" id="E01TDROHF">
                <option value=" " <% if(!teller.getE01TDROHF().equals("1")) out.print("selected");%>></option>
                <option value="1" <% if(teller.getE01TDROHF().equals("1")) out.print("selected");%>>Cuenta Contable Cajero</option>
              </select>
              </div>
	      </td>	      
	      <td nowrap > 
	        <div align="center"> 
	          <input type="text" name="E01TDROHB" id="E01TDROHB" size="3" maxlength="2" value="<%= teller.getE01TDROHB().trim()%>" onkeypress="enterInteger(event)">
	        </div>
	      </td>
	      <td nowrap  > 
	        <div align="center"> 
	          <input type="text" name="E01TDROHC" id="E01TDROHC" size="4" maxlength="3" value="<%= teller.getE01TDROHC().trim()%>" 
					class="context-menu-help" onmousedown="init(currencyHelp,this.name,document.getElementById('E01TDROHB').value,'','','','')">
	        </div>
	      </td>
	      <td nowrap > 
	        <div align="center"> 
	         <input type="text" name="E01TDROHG" id="E01TDROHG" size="18" maxlength="16" value="<%= teller.getE01TDROHG().trim()%>" onkeypress="enterInteger(event)" 
					class="context-menu-help" onmousedown="init(ledgerHelp,this.name,document.getElementById('E01TDROHB').value,document.getElementById('E01TDROHC').value,'','','')" >
	        </div>
	      </td>
	      <td nowrap > 
	        <div align="center"> 
	          <input type="text" name="E01TDROHD" id="E01TDROHD" size="3" maxlength="2" value="<%= teller.getE01TDROHD().trim()%>" onkeypress="enterInteger(event)">
	        </div>
	      </td>
	    </tr>
	    <tr id="trclear"> 
	      <td nowrap > 
	        <div align="right">Bancos Locales :</div>
	      </td>
	      <td nowrap > 
	      	<div align="center"> 
              <select name="E01TDRLOF" id="E01TDRLOF">
                <option value=" " <% if(!teller.getE01TDRLOF().equals("1")) out.print("selected");%>></option>
                <option value="1" <% if(teller.getE01TDRLOF().equals("1")) out.print("selected");%>>Cuenta Contable Cajero</option>
              </select>
               </div>
	      </td>	      
	      <td nowrap > 
	        <div align="center"> 
	          <input type="text" name="E01TDRLOB" id="E01TDRLOB" size="3" maxlength="2" value="<%= teller.getE01TDRLOB().trim()%>" onkeypress="enterInteger(event)">
	        </div>
	      </td>
	      <td nowrap  > 
	        <div align="center"> 
	          <input type="text" name="E01TDRLOC" id="E01TDRLOC" size="4" maxlength="3" value="<%= teller.getE01TDRLOC().trim()%>" 
					class="context-menu-help" onmousedown="init(currencyHelp,this.name,document.getElementById('E01TDRLOB').value,'','','','')">
	        </div>
	      </td>
	      <td nowrap > 
	        <div align="center"> 
	         <input type="text" name="E01TDRLOG" id="E01TDRLOG" size="18" maxlength="16" value="<%= teller.getE01TDRLOG().trim()%>" onkeypress="enterInteger(event)" 
					class="context-menu-help" onmousedown="init(ledgerHelp,this.name,document.getElementById('E01TDRLOB').value,document.getElementById('E01TDRLOC').value,'','','')" >
	        </div>
	      </td>
	      <td nowrap > 
	        <div align="center"> 
	          <input type="text" name="E01TDRLOD" id="E01TDRLOD" size="3" maxlength="2" value="<%= teller.getE01TDRLOD().trim()%>" onkeypress="enterInteger(event)">
	        </div>
	      </td>
	    </tr>
	    <tr id="trclear"> 
	      <td nowrap > 
	        <div align="right">Bancos No-Locales :</div>
	      </td>
	      <td nowrap > 
	      	<div align="center"> 
              <select name="E01TDRNLF" id="E01TDRNLF">
                <option value=" " <% if(!teller.getE01TDRNLF().equals("1")) out.print("selected");%>></option>
                <option value="1" <% if(teller.getE01TDRNLF().equals("1")) out.print("selected");%>>Cuenta Contable Cajero</option>
              </select>
               </div>
	      </td>	      
	      <td nowrap > 
	        <div align="center"> 
	          <input type="text" name="E01TDRNLB" id="E01TDRNLB" size="3" maxlength="2" value="<%= teller.getE01TDRNLB().trim()%>" onkeypress="enterInteger(event)">
	        </div>
	      </td>
	      <td nowrap  > 
	        <div align="center"> 
	          <input type="text" name="E01TDRNLC" id="E01TDRNLC" size="4" maxlength="3" value="<%= teller.getE01TDRNLC().trim()%>" 
					class="context-menu-help" onmousedown="init(currencyHelp,this.name,document.getELementById('E01TDRNLB').value,'','','','')">
	        </div>
	      </td>
	      <td nowrap > 
	        <div align="center"> 
	         <input type="text" name="E01TDRNLG" id="E01TDRNLG" size="18" maxlength="16" value="<%= teller.getE01TDRNLG().trim()%>" onkeypress="enterInteger(event)" 
					class="context-menu-help" onmousedown="init(ledgerHelp,this.name,document.getELementById('E01TDRNLB').value,document.getElementById('E01TDRNLC').value,'','','')" >
	        </div>
	      </td>
	      <td nowrap > 
	        <div align="center"> 
	          <input type="text" name="E01TDRNLD" id="E01TDRNLD" size="3" maxlength="2" value="<%= teller.getE01TDRNLD().trim()%>" onkeypress="enterInteger(event)">
	        </div>
	      </td>
	    </tr>
	    
     </table>
    </div>
  </TD>  
</TR>	
</TABLE>    
   <H4>Commisiones</H4>
  <TABLE class="tableinfo" align="center">
  <TR><TD>
   <table id="headTable2">
    <tr id="trdark"> 
      <td nowrap align="center" >Banco</td>
      <td nowrap align="center" >Moneda</td>
      <td nowrap align="center" >Cuenta Contable</td>
      <td nowrap align="center" >Porcentaje</td>
      <td nowrap align="center" >Monto</td>
      <td nowrap align="center" >Máximo</td>
      <td nowrap align="center" >Mínimo</td>
    </tr>
    </table> 
      
    <div id="dataDiv2"  >
     <table id="dataTable2" >
	    <tr id="trclear"> 
	      <td nowrap > 
	        <div align="center"> 
	          <input type="text" name="E01TDRCMB" id="E01TDRCMB" size="3" maxlength="2" value="<%= teller.getE01TDRCMB().trim()%>" onkeypress="enterInteger(event)">
	        </div>
	      </td>
	      <td nowrap  > 
	        <div align="center"> 
	          <input type="text" name="E01TDRCMC" id="E01TDRCMC" size="4" maxlength="3" value="<%= teller.getE01TDRCMC().trim()%>"
	                class="context-menu-help" onmousedown="init(currencyHelp,this.name,document.getElementById('E01TDRCMB').value,'','','','')">
	        </div>
	      </td>
	      <td nowrap > 
	        <div align="center"> 
	          <input type="text" name="E01TDRCMG" id="E01TDRCMG" size="18" maxlength="16" value="<%= teller.getE01TDRCMG().trim()%>" onkeypress="enterInteger(event)"
	                 class="context-menu-help" onmousedown="init(ledgerHelp,this.name,document.getElementById('E01TDRCMB').value,document.getElementById('E01TDRCMC').value,'','','')" >
	        </div>
	      </td>
	      <td nowrap > 
	      	<div align="center"> 
              <input type="text" name="E01TDRCOP" id="E01TDRCOP" size="10" maxlength="10"  value="<%= teller.getE01TDRCOP().trim()%>" >
             </div>
	      </td>
	      <td nowrap > 
	        <div align="center"> 
	          <input type="text" name="E01TDRCOA" id="E01TDRCOA" size="17" maxlength="15"  value="<%= teller.getE01TDRCOA().trim()%>" onkeypress="enterDecimal()">
	        </div>
	      </td>
	      <td nowrap > 
	        <div align="center"> 
	          <input type="text" name="E01TDRCMX" id="E01TDRCMX" size="17" maxlength="15"  value="<%= teller.getE01TDRCMX().trim()%>" onkeypress="enterDecimal()">
	        </div>
	      </td>
	      <td nowrap > 
	        <div align="center"> 
	          <input type="text" name="E01TDRCMN" id="E01TDRCMN" size="17" maxlength="15"  value="<%= teller.getE01TDRCMN().trim()%>" onkeypress="enterDecimal()">
	        </div>
	      </td>	      
	    </tr>
     </table>
    </div>
  </TD>  
</TR>	
</TABLE>     
   <H4>Impuestos</H4>
  <TABLE class="tableinfo" align="center">
  <TR><TD>
   <table id="headTable3">
    <tr id="trdark"> 
      <td nowrap align="center" >Banco</td>
      <td nowrap align="center" >Moneda</td>
      <td nowrap align="center" >Cuenta Contable</td>
      <td nowrap align="center" >Porcentaje</td>
      <td nowrap align="center" >Monto</td>
      <td nowrap align="center" >Máximo</td>
      <td nowrap align="center" >Mínimo</td>
    </tr>
    </table> 
      
    <div id="dataDiv3"  >
     <table id="dataTable3" >
	    <tr id="trclear"> 
	      <td nowrap > 
	        <div align="center"> 
	          <input type="text" name="E01TDRTMB" id="E01TDRTMB" size="3" maxlength="2" value="<%= teller.getE01TDRTMB().trim()%>" onkeypress="enterInteger(event)">
	        </div>
	      </td>
	      <td nowrap  > 
	        <div align="center"> 
	          <input type="text" name="E01TDRTMC" id="E01TDRTMC" size="4" maxlength="3" value="<%= teller.getE01TDRTMC().trim()%>"
	                class="context-menu-help" onmousedown="init(currencyHelp,this.name,document.getElementById('E01TDRTMB').value,'','','','')">
	        </div>
	      </td>
	      <td nowrap > 
	        <div align="center"> 
	          <input type="text" name="E01TDRTGL" id="E01TDRTGL" size="18" maxlength="16" value="<%= teller.getE01TDRTGL().trim()%>" onkeypress="enterInteger(event)"
	                 class="context-menu-help" onmousedown="init(ledgerHelp,this.name,document.getElementById('E01TDRTMB').value,document.getElementById('E01TDRTMC').value,'','','')" >
	        </div>
	      </td>
	      <td nowrap > 
	      	<div align="center">
              <input type="text" name="E01TDRTAP" size="10" maxlength="10"  value="<%= teller.getE01TDRTAP().trim()%>" >
             </div>
	      </td>
	      <td nowrap > 
	        <div align="center"> 
	          <input type="text" name="E01TDRTAA" size="17" maxlength="15"  value="<%= teller.getE01TDRTAA().trim()%>" onkeypress="enterDecimal()">
	        </div>
	      </td>
	      <td nowrap > 
	        <div align="center"> 
	          <input type="text" name="E01TDRTMX" size="17" maxlength="15"  value="<%= teller.getE01TDRTMX().trim()%>" onkeypress="enterDecimal()">
	        </div>
	      </td>
	      <td nowrap > 
	        <div align="center"> 
	          <input type="text" name="E01TDRTMN" size="17" maxlength="15"  value="<%= teller.getE01TDRTMN().trim()%>" onkeypress="enterDecimal()">
	        </div>
	      </td>	      
	    </tr>
     </table>
    </div>
  </TD>  
</TR>	
</TABLE>     

<H4>Atributos Transacciones</H4>
  <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="trdark">
            <td nowrap width="20%" > 
              <div align="right">Es un Depósito :</div>
            </td>
            <td nowrap width="30%"> 
              <input type="radio" name="E01TDRDYN" value="Y" <%if(teller.getE01TDRDYN().equals("Y")) out.print("checked");%>>Si 
              <input type="radio" name="E01TDRDYN" value="N" <%if(!teller.getE01TDRDYN().equals("Y")) out.print("checked");%>>No           
            </td>
            <td nowrap width="20%" > 
              <div align="right">Depósito Mixto (Efectivo y Cheques) :</div>
            </td>
            <td nowrap width="30%" > 
              <input type="radio" name="E01TDRMYN" value="Y" <%if(teller.getE01TDRMYN().equals("Y")) out.print("checked");%>>Si 
              <input type="radio" name="E01TDRMYN" value="N" <%if(!teller.getE01TDRMYN().equals("Y")) out.print("checked");%>>No           
            </td>
          </tr> 
          <tr id="trclear">
            <td nowrap width="20%" > 
              <div align="right">Incluye Efectivo :</div>
            </td>
            <td nowrap width="30%"> 
              <select name="E01TDREFE">
                <option value=" " <% if(teller.getE01TDREFE().equals(" ")) out.print("selected");%>>Monto Transaccion</option>
                <option value="N" <% if(teller.getE01TDREFE().equals("N")) out.print("selected");%>>No incluye Efectivo</option>
                <option value="Y" <% if(teller.getE01TDREFE().equals("Y")) out.print("selected");%>>Incluye Efectivo</option>
              </select>
            </td>
            <td nowrap width="20%" > 
              <div align="right">Devolución Efectivo :</div>
            </td>
            <td nowrap width="30%" > 
              <input type="radio" name="E01TDRCYN" value="Y" <%if(teller.getE01TDRCYN().equals("Y")) out.print("checked");%>>Si 
              <input type="radio" name="E01TDRCYN" value="N" <%if(!teller.getE01TDRCYN().equals("Y")) out.print("checked");%>>No           
            </td>
          </tr> 
          <tr id="trdark">
            <td nowrap width="20%" > 
              <div align="right">Verificacion de Sobregiro :</div>
            </td>
            <td nowrap width="30%"> 
              <select name="E01TDRRSG">
                <option value="N" <% if(teller.getE01TDRRSG().equals("N")) out.print("selected");%>>No Verificar Sobregiro</option>
                <option value="Y" <% if(teller.getE01TDRRSG().equals("Y")) out.print("selected");%>>Si Sobregira, Aprobar Superv</option>
                <option value="R" <% if(teller.getE01TDRRSG().equals("R")) out.print("selected");%>>Rechazar Sobregiro</option>
              </select>
            </td>
            <td nowrap width="20%" > 
              <div align="right">Requiere Autorizacion :</div>
            </td>
            <td nowrap width="30%" > 
              <input type="radio" name="E01TDRSYN" value="Y" <%if(teller.getE01TDRSYN().equals("Y")) out.print("checked");%>>Sí 
              <input type="radio" name="E01TDRSYN" value="N" <%if(!teller.getE01TDRSYN().equals("Y")) out.print("checked");%>>No           
            </td>
          </tr> 
          <tr id="trclear">
            <td nowrap width="20%" > 
              <div align="right">Verificación Suspensión de Pagos :</div>
            </td>
            <td nowrap width="30%"> 
              <input type="radio" name="E01TDRRSP" value="Y" <%if(teller.getE01TDRRSP().equals("Y")) out.print("checked");%>>Sí 
              <input type="radio" name="E01TDRRSP" value="N" <%if(!teller.getE01TDRRSP().equals("Y")) out.print("checked");%>>No           
            </td>
            <td nowrap width="20%" > 
              <div align="right">Retencion de Fondos :</div>
            </td>
            <td nowrap width="30%" > 
              <input type="radio" name="E01TDRHYN" value="Y" <%if(teller.getE01TDRHYN().equals("Y")) out.print("checked");%>>Sí 
              <input type="radio" name="E01TDRHYN" value="N" <%if(!teller.getE01TDRHYN().equals("Y")) out.print("checked");%>>No           
            </td>
          </tr> 
          <tr id="trdark">
            <td nowrap width="20%" > 
              <div align="right">Mostrar en Pantalla de Cajero :</div>
            </td>
            <td nowrap width="30%"> 
              <input type="radio" name="E01TDRSHT" value="Y" <%if(teller.getE01TDRSHT().equals("Y")) out.print("checked");%>>Sí 
              <input type="radio" name="E01TDRSHT" value="N" <%if(!teller.getE01TDRSHT().equals("Y")) out.print("checked");%>>No           
            </td>
            <td nowrap width="20%" > 
              <div align="right">Imprimir Etiqueta de Cliente :</div>
            </td>
            <td nowrap width="30%" > 
              <input type="radio" name="E01TDRPCL" value="Y" <%if(teller.getE01TDRPCL().equals("Y")) out.print("checked");%>>Sí 
              <input type="radio" name="E01TDRPCL" value="N" <%if(!teller.getE01TDRPCL().equals("Y")) out.print("checked");%>>No           
            </td>
          </tr> 
          <tr id="trclear">
            <td nowrap width="20%" > 
              <div align="right">Código Transacción Débito :</div>
            </td>
            <td nowrap width="30%"> 
              <input type="text" name="E01TDRDIC" size="5" maxlength="4" value="<%= teller.getE01TDRDIC().trim()%>">
              <a href="javascript:GetCodeCNOFC('E01TDRDIC','20')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="bottom" border="0" ></a> 
            </td>
            <td nowrap width="20%" > 
              <div align="right">Código Transacción Crédito :</div>
            </td>
            <td nowrap width="30%" > 
              <input type="text" name="E01TDRCIC" size="5" maxlength="4" value="<%= teller.getE01TDRCIC().trim()%>">
              <a href="javascript:GetCodeCNOFC('E01TDRCIC','20')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="bottom" border="0" ></a> 
            </td>
          </tr> 
          <tr id="trdark">
            <td nowrap width="20%" > 
              <div align="right">Monto Usado para Comisión :</div>
            </td>
            <td nowrap width="30%"> 
              <select name="E01TDRBCC">
                <option value=" " <% if (!(teller.getE01TDRBCC().equals("1") ||teller.getE01TDRBCC().equals("2")||teller.getE01TDRBCC().equals("3")||teller.getE01TDRBCC().equals("4"))) out.print("selected"); %>></option>
                <option value="1" <% if(teller.getE01TDRBCC().equals("1")) out.print("selected");%>>Cheques Locales</option>
                <option value="2" <% if(teller.getE01TDRBCC().equals("2")) out.print("selected");%>>Cheques No Locales</option>
                <option value="3" <% if(teller.getE01TDRBCC().equals("3")) out.print("selected");%>>Cheques Locales + No Locales</option>
                <option value="4" <% if(teller.getE01TDRBCC().equals("4")) out.print("selected");%>>Monto Transacción</option>
              </select>
            </td>
            <td nowrap width="20%" > 
              <div align="right">Verifica Libreta :</div>
            </td>
            <td nowrap width="30%"> 
              <input type="radio" name="E01TDRVCB" value="Y" <%if(teller.getE01TDRVCB().equals("Y")) out.print("checked");%>>Sí 
              <input type="radio" name="E01TDRVCB" value="N" <%if(!teller.getE01TDRVCB().equals("Y")) out.print("checked");%>>No           
            </td>  
          </tr> 
        <tr id="clear">
            <td nowrap width="20%" > 
              <div align="right">Atributo Especial :</div>
            </td>
            <td nowrap width="30%" > 
              <input type="text" name="E01TDRCOC" size="5" maxlength="4" value="<%= teller.getE01TDRCOC().trim()%>">
              <a href="javascript:GetCodeCNOFC('E01TDRCOC','AE')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="bottom" border="0" ></a>
            </td>
              
            <td nowrap width="20%" > 
              <div align="right">Lavado de Dinero :</div>
            </td>
            <td nowrap width="30%"> 
              <input type="radio" name="E01TDRLVD" value="Y" <%if(teller.getE01TDRLVD().equals("Y")) out.print("checked");%>>Sí 
              <input type="radio" name="E01TDRLVD" value="N" <%if(!teller.getE01TDRLVD().equals("Y")) out.print("checked");%>>No           
            </td>  
          </tr> 
           <tr id="trdark">
            <td nowrap width="20%" > 
              <div align="right">Tipo de Cuenta Cliente :</div>
            </td>
            <td nowrap width="30%"> 
                <select name="E01TDRFL4">
                <option value=" " <% if (!(teller.getE01TDRFL4().equals("A") ||teller.getE01TDRFL4().equals("C")||teller.getE01TDRFL4().equals("1")||teller.getE01TDRFL4().equals("N"))) out.print("selected"); %>></option>
                <option value="A" <% if(teller.getE01TDRFL4().equals("A")) out.print("selected");%>>Solo Cuentas de Ahorros</option>
                <option value="C" <% if(teller.getE01TDRFL4().equals("C")) out.print("selected");%>>Solo Cuentas Corrientes</option>
                <option value="1" <% if(teller.getE01TDRFL4().equals("1")) out.print("selected");%>>No Valida Cuenta en Desglose</option>
                <option value="N" <% if(teller.getE01TDRFL4().equals("N")) out.print("selected");%>>No aplica exclusion</option>
              </select>
            </td>  
           <td nowrap width="20%" >
              <div align="right">Permite montos en Cero :</div>
           </td>
            <td nowrap width="30%" > 
              <input type="radio" name="E01TDRFL1" value="Y" <%if(teller.getE01TDRFL1().equals("Y")) out.print("checked");%>>Sí 
              <input type="radio" name="E01TDRFL1" value="N" <%if(!teller.getE01TDRFL1().equals("Y")) out.print("checked");%>>No  
            </td>
          </tr> 
          <tr id="trclear">
            <td nowrap width="20%" > 
              <div align="right">No generar cobro de GMF :</div>
            </td>
            <td nowrap width="30%"> 
              <input type="radio" name="E01TDRFL3" value="Y" <%if(teller.getE01TDRFL3().equals("Y")) out.print("checked");%>>Sí 
              <input type="radio" name="E01TDRFL3" value="N" <%if(!teller.getE01TDRFL3().equals("Y")) out.print("checked");%>>No           
            </td>
            <td nowrap width="20%" > 
              <div align="right"></div>
            </td>
            <td nowrap width="30%"> 
            </td>
          </tr> 
        </table>
      </td>
    </tr>
  </table>  

<H4>Atributos de Interfaz de Cajero</H4>
  <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="trdark">
            <td nowrap width="20%" > 
              <div align="right">Tipo Proceso Transacción :</div>
            </td>
            <td nowrap width="30%"> 
				<input type="text" name="E01TDRTYP" size="5" maxlength="4" value="<%= teller.getE01TDRTYP().trim()%>">
              <a href="javascript:GetCodeCNOFC('E01TDRTYP','T2')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="bottom" border="0" ></a>            
			</td>
            <td nowrap width="20%" > 
              <div align="right">Proceso Cámara Entrante :</div>
            </td>
            <td nowrap width="30%" > 
				<input type="text" name="E01TDRCNJ" size="3" maxlength="2" value="<%= teller.getE01TDRCNJ().trim()%>"> 
				<a href="javascript:GetCode('E01TDRCNJ','STATIC_teller_inclearing_process.jsp')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="bottom" border="0"></a>            
            </td>
          </tr> 
          <tr id="trdark">
            <td nowrap width="20%" > 
              <div align="right">Proceso de Libreta :</div>
            </td>
            <td nowrap width="30%"> 
              <select name="E01TDRVPB">
                <option value=" " <% if (!(teller.getE01TDRVPB().equals("N") ||teller.getE01TDRVPB().equals("Y")||teller.getE01TDRVPB().equals("P"))) out.print("selected"); %>></option>
                <option value="N" <% if(teller.getE01TDRVPB().equals("N")) out.print("selected");%>>Sin Libreta</option>
                <option value="Y" <% if(teller.getE01TDRVPB().equals("Y")) out.print("selected");%>>Imprimir en Linea</option>
                <option value="P" <% if(teller.getE01TDRVPB().equals("P")) out.print("selected");%>>Pendiente de Imprimir</option>
              </select>
			</td>
            <td nowrap width="20%" > 
              <div align="right">Proceso de Chequera/Cheque Oficial :</div>
            </td>
            <td nowrap width="30%" > 
              <select name="E01TDRVCK">
                <option value=" " <% if (!(teller.getE01TDRVCK().equals("N") ||teller.getE01TDRVCK().equals("Y")||teller.getE01TDRVCK().equals("E")||teller.getE01TDRVCK().equals("C"))) out.print("selected"); %>></option>
                <option value="N" <% if(teller.getE01TDRVCK().equals("N")) out.print("selected");%>>No Chequera</option>
                <option value="Y" <% if(teller.getE01TDRVCK().equals("Y")) out.print("selected");%>>Verificar Chequera</option>
                <option value="E" <% if(teller.getE01TDRVCK().equals("E")) out.print("selected");%>>Venta de Cheque Oficial</option>
                <option value="C" <% if(teller.getE01TDRVCK().equals("C")) out.print("selected");%>>Pago de Cheque Oficial</option>
              </select>
            </td>
          </tr> 
          <tr id="trclear">
            <td nowrap width="20%" > 
              <div align="right">Programa a Ejecutar :</div>
            </td>
            <td nowrap width="30%"> 
              <input type="text" name="E01FINPGM" size="11" maxlength="10" value="<%= teller.getE01FINPGM().trim()%>"> 
			</td>
            <td nowrap width="20%" > 
              <div align="right">Cola de Respuestas :</div>
            </td>
            <td nowrap width="30%" > 
               <input type="text" name="E01TDRDTQ" size="11" maxlength="10" value="<%= teller.getE01TDRDTQ().trim()%>"> 
            </td>
          </tr> 
         </table>
      </td>
    </tr>
  </table>   
  
<SCRIPT type="text/javascript">
    function tableresize() {
     adjustEquTables( getElement('headTable1'), getElement('dataTable1'), getElement('dataDiv1'),0,false);
     adjustEquTables( getElement('headTable2'), getElement('dataTable2'), getElement('dataDiv2'),0,false);
     adjustEquTables( getElement('headTable3'), getElement('dataTable3'), getElement('dataDiv3'),0,false);
     adjustEquTables( getElement('headTable4'), getElement('dataTable4'), getElement('dataDiv4'),0,false);
   }
  tableresize();
  window.onresize=tableresize;  
</SCRIPT>

 <div align="center"> 
	   <input id="EIBSBTN" type=submit name="Submit" value="Enviar">
  </div>
  </form>
</body>
</html>
