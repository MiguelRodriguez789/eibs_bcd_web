<HTML>
<HEAD>
<TITLE>
Listado de Garantías
</TITLE>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
</HEAD>

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>

<script type="text/javascript">
 function goAction(op) {
 var delok= false;

  	with  ( parent.results ){  
    	    	if (op == 1) {
    	    	    document.forms[0].SCREEN.value = '300';
          		document.forms[0].submit();
	 	     }
	 	      if (op == 2) {
	 	     			delok = confirm("Esta seguro que desea borrar la Garantía seleccionada"); 
	 	      	if ( delok) {
	 	      	document.forms[0].SCREEN.value = '600';
	 	      	document.forms[0].submit()
	 	      	 }
	 	    }      
  	}
 }
  function goExit(){
  parent.window.location.href="<%=request.getContextPath()%>/pages/background.jsp";

  }
</script>

<BODY onload="MM_preloadImages('<%=request.getContextPath()%>/images/s/approve_over.gif','<%=request.getContextPath()%>/images/s/delete_over.gif','<%=request.getContextPath()%>/images/s/nueva_over.gif')">
<h3 align="center"> Lista de Garantías de No-Dep&oacute;sito</h3>
<hr size="4">
  
  
<TABLE class="tbenter">
  <TR> 
    <TD CLASS="TDBKG" ALIGN=CENTER width="25%"> <a href="javascript:goAction('1')" >Nueva</a> </TD>
    <TD CLASS="TDBKG" ALIGN=CENTER width="25%"><a href="javascript:goGaBasic()">Modificar</a>
    </TD>
    <TD CLASS="TDBKG" ALIGN=CENTER width="25%"> <a href="javascript:goAction('2')">Borrar </a> 
    </TD>
    <TD CLASS="TDBKG" ALIGN=CENTER width="25%"> <a href="javascript:goExit()" >Salir</a> 
    </TD>
  </TR>
</TABLE>
        
 </BODY>
</HTML>
