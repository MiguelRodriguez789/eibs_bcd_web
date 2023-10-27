<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<%@ page import = "datapro.eibs.master.Util" %>
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<title>Products Tree View</title>
<jsp:useBean id= "prodList" class= "datapro.eibs.beans.JBObjList"  scope="session" />
<jsp:useBean id= "subProdList" class= "datapro.eibs.beans.JBObjList"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>
<jsp:useBean id= "title" class= "java.lang.String"  scope="session" />
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/events.js"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.js"> </SCRIPT>

<SCRIPT type="text/javascript"> 
	function switchOpt(id) {	
	 var oldid = document.forms[0].ACTIVEOPT.value;
		if ( oldid.trim() != "") {
		  try{
			if ( oldid != id ) {
				getElement("subprod" + oldid).style.display = "none";
				getElement("td" + oldid).className = "iconProd";
				getElement("subprod" + id).style.display = "";
				getElement("subprod" + id).scrollIntoView(false);
				getElement("td" + id).className = "iconProdPlus";
				document.forms[0].ACTIVEOPT.value = id;
			} else {
			    if (getElement("subprod" + id).style.display == ""){
			    	getElement("subprod" + id).style.display = "none";
			    	getElement("td" + id).className = "iconProdSel";
			    } else {
			    	getElement("subprod" + id).style.display = "";
				    getElement("subprod" + id).scrollIntoView(false);
				    getElement("td" + id).className = "iconProdPlus";
			    }			    			
			}
		  } catch(e){
			document.forms[0].ACTIVEOPT.value = "";
		  }
		} else {
			getElement("subprod" + id).style.display = "";
			getElement("subprod" + id).scrollIntoView(false);
			getElement("td" + id).className = "iconProdPlus";
			document.forms[0].ACTIVEOPT.value = id;
		}
		
	}
	
	function setTableHeight() {
	  var h = document.body.clientHeight - 25;//document.all.prodtitle.clientHeight;
	  Container.style.height= h + ""; 
	}
	
</SCRIPT>

<STYLE>
BODY {
	margin-top: 12px;
	margin-bottom: 0px;
  	scrollbar-arrow-color : #d0122c;
  	scrollbar-base-color : #fae7ea;
  	scrollbar-darkshadow-color :#fae7ea;
  	scrollbar-face-color : #d0122c;
  	scrollbar-highlight-color :#fae7ea;
  	scrollbar-shadow-color :#fae7ea;
  	scrollbar-track-color :transparent;
 	}
 .prodItem {
 	font-family: verdana, arial, helvetica, sans-serif;
 	font-size:7.5pt;
 	padding:0;
 	background-Color:none;
 	color:#474747;
 	cursor:hand;
 	border: none;
 	}
 .highlightItem {
 	font-family: verdana, arial, helvetica, sans-serif;
 	font-size:7.5pt;
 	padding:0;
 	color:#d0122c;
 	cursor:hand;
 	border-top-color : none;
	padding-left:4px;
	font-style: normal;
	text-decoration: none;
}
 .selectedItem {
 	font-family: verdana, arial, helvetica, sans-serif;
 	font-size:7.5pt;
 	padding:0;
 	background-Color:#4682B4;
 	color:#d0122c;
 	cursor:hand;
 	border: none;
	padding-left:4px;
	}
 .iconSubProd {
	background:transparent url('<%=request.getContextPath()%>/images/options_button.gif') no-repeat fixed center left;
	background-Color:none;
	padding-left:6px;
 }
 .iconProd {
	background:transparent url('<%=request.getContextPath()%>/images/ico1.gif') no-repeat fixed center left;
	background-Color:none;
	padding-left:6px;
 }
 .iconProdSel {
	background:transparent url('<%=request.getContextPath()%>/images/ico3.gif') no-repeat fixed center left;
	background-Color:none;
	padding-left:6px;
 }
 .iconProdPlus {
	background:transparent url('<%=request.getContextPath()%>/images/ico5.gif') no-repeat fixed center left;
	background-Color:none;
	padding-left:6px;
 }
 .optSubProd {
	font-family: Verdana,Arial, Helvetica, sans-serif;
	font-size: 6.5pt;
	font-color: #000066;
}
 .optSubProd a:link {
	color: black;
	text-decoration: none;	
}
.optSubProd a:visited {
	color: #660066;
	text-decoration: none;
}
 .optSubProd a:hover {
	color: #d0122c;
	text-decoration: none;
}
 
</STYLE>
</head>
<body >
<form>
<input type=hidden name="ACTIVEOPT" value="0">
<table width="100%" id=mainTable cellspacing="0" cellpadding="0" class=tbenter>
	<tr id=prodtitle>
	    <td align="center">
	    	<b><%= title%></b>
	    </td>
	</tr>
    <tr>	    
        <td style="padding-right:3px;">
		<div id=Container style="overflow-y:auto; border:1px solid #474747;">
			<div id=Products>
			<%if(prodList.isEmpty()){%>
				<font>Tipo de Producto No Está Definido</font>
			<%}else{
			 prodList.initRow();
			 subProdList.initRow();
			 datapro.eibs.beans.JBObjList elemList = null;
			 boolean firstTime=true;
			 while (prodList.getNextRow()) {
			 	datapro.eibs.beans.ESD071101Message product = (datapro.eibs.beans.ESD071101Message) prodList.getRecord();
			 %>
			 	<div id="prod<%= prodList.getCurrentRow() %>">
					<table cellspacing="2" width="100%" class=tbenter>
						<tr> 
						    <td width=20 class="<% if (firstTime) out.print("iconProdPlus"); else out.print("iconProd");%>" id="td<%= prodList.getCurrentRow() %>"></td>  
							<td class="prodItem" onclick="switchOpt('<%= prodList.getCurrentRow() %>');">  												
						 	  <a href="<%=request.getContextPath()%>/pages/s/ESD0711_products_detail.jsp?appcode=<%=product.getE01APCACD().trim()%>&typecode=&generic=<%=product.getE01GENERI().trim()%>&title=<%=product.getE01DESCRI().trim()%>&bank=<%=product.getE01APCBNK()%>" target="detail">
						 	  <b>
						 	   <% if (product.getE01DESCRI().trim().equals("")) out.print("SIN DESCRIPCION"); else out.print(product.getE01DESCRI().trim());%>
						 	  </b></a>
							</td>
						</tr>
					</table>
                </div>
                <div id="subprod<%= prodList.getCurrentRow() %>" style="display:
                <% if (firstTime) {
                  out.print("");
                  firstTime= false;
                  } else out.print("none");%>">
			 		<table width="100%" cellspacing="0" class=tbenter>
			 <%
			  try {
			    subProdList.setCurrentRow(prodList.getCurrentRow());
			    elemList = (datapro.eibs.beans.JBObjList) subProdList.getRecord();
			 	elemList.initRow();
			 	String pageDet = "";
			 	if (userPO.getPurpose().equals("MAINTENANCE")) pageDet = "ESD0700_products_detail.jsp"; else pageDet = "ESD0711_products_detail.jsp";
			 	while (elemList.getNextRow()) {
			 		datapro.eibs.beans.ESD071101Message subProduct = (datapro.eibs.beans.ESD071101Message) elemList.getRecord();
			 %>
			 			<tr>
			 			    <td width=40></td>
			 			    <td class="iconSubProd"></td>
			 				<td class="optSubProd">  												
						 		<a href="<%=request.getContextPath()%>/pages/s/<%=pageDet%>?appcode=<%=subProduct.getE01APCACD().trim()%>&typecode=<%= subProduct.getE01APCTYP().trim()%>&generic=<%=subProduct.getE01GENERI().trim()%>&title=<%=subProduct.getE01DESCRI().trim()%>&bank=<%=subProduct.getE01APCBNK()%>" target="detail"><%= subProduct.getE01DESCRI().trim()%> (<%= subProduct.getE01APCTYP().trim()%>)</a>
							</td>
						</tr>
			 <%		
			 	}
			 %>
					</table>
                </div>
			 <%			 
			  } catch(Exception e){}
			 }
			}
			 %>
			</div>
		</div>
		</td>
	</tr>
  </table>
</form>
<SCRIPT type="text/javascript">
	setTableHeight();  
  	window.onresize = setTableHeight;  
</SCRIPT>
</body>
</html>
