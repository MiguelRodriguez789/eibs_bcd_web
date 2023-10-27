<%@ page contentType="application/x-javascript" %>

// Global variable for english
var fieldName;
var fieldDesc;
var fieldVid;
var fieldNum;
var fieldCod;

function GetVendorBP(code,name)
{
	page = "${pageContext.request.contextPath}/servlet/datapro.eibs.bap.JSEWD0560";
	fieldName=code;
	fieldDesc=name;
	CenterWindow(page,500,500,2);
}


function GetSourceDoc(num,name)
{
	page = "${pageContext.request.contextPath}/servlet/datapro.eibs.bap.JSEWD0580";
	fieldNum=num;
	fieldDesc=name;
	CenterWindow(page,500,500,7);
}

function GetVendorBPid(code,name,vid)
{
	page = "${pageContext.request.contextPath}/servlet/datapro.eibs.bap.JSEWD0560";
	fieldName=code;
	fieldDesc=name;
	fieldVid=vid;
	CenterWindow(page,500,500,2);
}


function GetCustomerDetailsVendor(customer,name,idnumber,idtype,Idcontry,address2,address3,address4,city,state,country,pob,zip,shortnam,ema,gender,marital,phone){

    page= "${pageContext.request.contextPath}/pages/s/EWD0001_client_desc_ven_help_container.jsp";
	fieldAux1=customer;
	fieldAux2=name;
	fieldAux3=idnumber;
	fieldAux4=idtype;
	fieldAux5=Idcontry;
	fieldAux6=address2;
	fieldAux7=address3;
	fieldAux8=address4;
	fieldAux9=city;
	fieldAux10=state;
	fieldAux11=country;
	fieldAux12=pob;
	fieldAux13=zip;
	fieldAux14=shortnam;
	fieldAux15=ema;
	fieldAux16=gender;
	fieldAux17=marital;
	fieldAux18=phone;

	CenterWindow(page,750,550,1);
}
