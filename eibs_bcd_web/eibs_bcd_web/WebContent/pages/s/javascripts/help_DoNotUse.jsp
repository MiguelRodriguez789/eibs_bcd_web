<%@ page contentType="text/javascript"%>

	var optHelp;
	var fieldDesc;
	var fieldBank;
	var fieldCCY;
	var fieldOPCode;
	var fieldName;
	var fieldId;
	var fieldAux1;
	var fieldAux2;
	var fieldAux3;
	var fieldAux4;
	var fieldAux5;
	var fieldAux6;
	var fieldAux7;
	var fieldAux8;
	var fieldAux10;
	var fieldAux11;
	var fieldAux12;
	var fieldAux13;
	var fieldAux14;
	var fieldAux15;
	var fieldAux16;
	var fieldAux17;
	var fieldAux18;
	var fieldAux19;
	var fieldAux20;	
	var option;
	
	var Currency;
	var Bank;
	var AppCode;
	var Branch;
	var AccType;
	var Customer;
	
<%-- Help Menu Global Variables --%>
	var optHelp;
	var accountHelp = 1;
	var ledgerHelp = 2;
	var branchHelp = 3;
	var custdescidHelp = 4;
	var currencyHelp = 5;
	var conceptHelp = 6;
	var cnofHelp = 7;
	var costcenterHelp = 8;
	var accholdersHelp = 9;
	var codeDescCNOFC = 10;
	var causeHelp = 11;
	var conceptTransacHelp = 12;
	var staticFactHelp = 13;
	var staticFrecHelp = 14;
	var documentsFrecuencyHelp = 15;
	var documentsTypeHelp = 16;
	var documentsFeeCharges = 17;
	var documentsFrecCharges = 18;
	var concepttypeHelp = 19;
	var lnreferHelp = 20;
	var openingWireHelp = 21
	var paramByCurrency = 22;
	var scaleTableDefinition = 23;
	var accountCustomerHelp = 25;
	var accountCustomerNameHelp = 26;
	var brokerHelp = 27;
	var accountPlanHelp = 28;
	var officialCheckFormat = 29;
	var transferACH= 30;
	var commDef = 32;

<%-- lnreferHelp change help to  accountCustomerHelp. 
	 Accomplished at help level, to lessen the amount of jsps modified.
 --%>
	 lnreferHelp = accountCustomerHelp;

function getHelp() {
	switch (optHelp) {
	case 1:
		GetAccount(fieldName, fieldBank, fieldOPCode, '');
		break;
	case 2:
		GetLedger(fieldName, fieldBank, fieldCCY, '', fieldDesc, '');
		break;
	case 3:
		GetBranch(fieldName, fieldBank, '');
		break;
	case 4:
		GetCustomerDescId(fieldName, fieldAux1, fieldAux2);
		break;
	case 5:
		GetCurrency(fieldName, fieldBank);
		break;
	case 6:
		GetConcept(fieldName, fieldBank, fieldOPCode, fieldAux1, fieldAux2, fieldAux4, fieldAux5, fieldCCY, fieldAux6);
		break;
	case 7:
		GetCodeCNOFC(fieldName, fieldOPCode);
		break;
	case 8:
		GetCostCenter(fieldName, fieldBank);
		break;
	case 9:
		GetAccountHolders(fieldName);
		break;
	case 10:
		GetCodeDescCNOFC(fieldName, fieldAux1, fieldOPCode);
		break;
	case 11:
		GetCasualTable(fieldName, fieldDesc);
		break;
	case 12:
		GetConceptTr(fieldName, fieldBank, fieldOPCode, fieldAux1, fieldAux2);
		break;
	case 13:
		GetCode(fieldName, 'STATIC_inv_factor.jsp');
		break;
	case 14:
		GetCode(fieldName, 'STATIC_inv_frecuency.jsp');
		break;
	case 15:
		GetCode(fieldName, 'STATIC_doc_frecuency.jsp');
		break;
	case 16:
		GetCode(fieldName, 'STATIC_doc_type.jsp');
		break;
	case 17:
		GetCode(fieldName, 'STATIC_ln_tables_fee_charges.jsp');
		break;
	case 18:
		GetCode(fieldName, 'STATIC_ln_tables_frec_charges.jsp');
		break;
	case 19:
		GetCode(fieldName, 'STATIC_concepts_type.jsp');
		break;
	case 20:
		GetLNReference(fieldName, fieldBank, fieldOPCode, '', fieldAux1);
		break;
	case 21:
		if (fieldAux2 == "03") {
			GetWireOpening(fieldName, fieldAux1);
		} else {
			GetAccount(fieldName, fieldBank, fieldOPCode, '');
		}
		break;
	case 22:
		GetCode(fieldName, 'STATIC_par_pr_mda.jsp');
		break;
	case 23:
		GetScaleDef(fieldName, fieldBank, fieldOPCode, '', fieldAux1);
		break;
	case 25:
		GetAccByClient(fieldName, fieldBank, fieldOPCode, '', fieldAux1);
		break;
	case 26:
		GetAccountCustomer(fieldName, fieldBank, fieldOPCode, '', fieldDesc);
		break;
	case 27:
		GetBroker(fieldName, fieldDesc, fieldAux2);
		break;
	case 28:
		GetTablaSeguros(fieldName, fieldBank, fieldOPCode, fieldAux1, fieldAux2);
		break;
	case 29:
		GetOffChkPar(fieldName);
		break;
	case 30:
		GetAchTransaction(fieldName,fieldDesc);
		break;
	case 31:
		GetCodeDescRefCNOFC(fieldName, fieldAux1, fieldAux2, fieldOPCode);
		break;
	case 32:
		GetCommDef(fieldName, fieldBank,fieldAux1);
		break;
	}
}

function clearFields() {
	fieldName = '';
	fieldDesc = '';
	fieldCun = '';
	fieldId = '';
	fieldAux1 = '';
	fieldAux2 = '';
	fieldAux3 = '';
	fieldAux4 = '';
	fieldAux5 = '';
	fieldAux6 = '';
	fieldAux7 = '';
	fieldAux8 = '';
	fieldAux9 = '';
	fieldAux10 = '';
	fieldAux11 = '';
	fieldAux12 = '';
	fieldAux13 = '';
	fieldAux14 = '';
	fieldAux15 = '';
	fieldAux16 = '';
	fieldAux17 = '';
	fieldAux18 = '';
	fieldAux19 = '';
	fieldAux20 = '';
}

function init(opt, name, bank, ccy, fieldname1, fieldname2, opcode, fieldname3, fieldname4, fieldname5) {
	optHelp = opt;
	fieldName = name;
	fieldBank = bank;
	fieldCCY = ccy;
	//fieldAux3 = ccy;
	fieldAux1 = fieldname1;
	fieldDesc = fieldname1;
	fieldAux2 = fieldname2;
	fieldOPCode = opcode;
	fieldAux4 = fieldname3;
	fieldAux5 = fieldname4;
	fieldAux6 = fieldname5;
}

function GetCode(name, page) {
	page = EIBS.pagesPrefix() + page;
	fieldName = name;
	CenterWindow(page, 320, 300, 3);
}

function GetCodeDesc(name, desc, page) {
	page = "${pageContext.request.contextPath}/pages/s/" + page;
	fieldName = name;
	fieldDesc = desc;
	CenterWindow(page, 600, 450, 1);
}

function GetVendor(name) {
	page = "${pageContext.request.contextPath}/pages/s/EWD0030_vendor_help_container.jsp";
	fieldName = name;
	CenterWindow(page, 500, 500, 1);
}

function GetVendor(name, codeflag) {
	page = "${pageContext.request.contextPath}/pages/s/EWD0030_vendor_help_container.jsp?codeflag=" + codeflag;
	fieldName = name;
	CenterWindow(page, 500, 500, 1);
}

function GetCostCenter(name, bank) {
	fieldName = name;
	page = "${pageContext.request.contextPath}/servlet/datapro.eibs.helps.JSEWD0014?BankNumber=" + bank;
	CenterWindow(page, 400, 280, 3);
}

function GetLedger(name, bnk, ccy, apc, desc, prodType) {
   page = "${pageContext.request.contextPath}/pages/s/EWD0010_client_help_container.jsp";
   fieldName = name;
   fieldDesc = desc;
   AppCode = apc;
   Bank = bnk;
   Currency = ccy;
   AccType = isValidObject(prodType) ? prodType : "";
   CenterWindow(page, 800, 600, 1);
}

function GetLedgerExtras(name, bnk, ccy, apc, desc, prodType,ccyback,desccy,bnkback) {
	   page = "${pageContext.request.contextPath}/pages/s/EWD0007_client_help_container.jsp";
	   fieldName = name;
	   fieldDesc = desc;
	   AppCode = apc;
	   Bank = bnk;
	   Currency = ccy;
	   AccType = isValidObject(prodType) ? prodType : "";
	   //extras
	   fieldAux5 = ccyback;
	   fieldAux6 = desccy;
	   fieldAux7 = bnkback;
	   CenterWindow(page, 600, 550, 1);
	}

function GetCNTRLPRF(name,amt,type,customer,tamount,currency)
{
	var param = "";
	if (isValidObject(type)){
		param = param+"?type="+type;
	}
	if (isValidObject(customer)){
		param = param+"&customer="+customer;
	}
	if (isValidObject(tamount)){
		param = param+"&amount="+tamount;
	}
	if (isValidObject(currency)){
		param = param+"&currency="+currency;
	}
	page = "${pageContext.request.contextPath}/servlet/datapro.eibs.helps.JSEWD0108"+param;
	fieldName = name;
	fieldDesc = amt;
	CenterWindow(page, 430, 200, 3);
}

function GetTariffLC(name, searcher, EWDCUN) {
	fieldName = name;
	page = "${pageContext.request.contextPath}/servlet/datapro.eibs.helps.JSEWD0101?Search=" + searcher
			+ "&EWDCUN=" + EWDCUN;
	CenterWindow(page, 600, 150, 3);
}

function GetAccByClient(name, bnk, app, sel, cus) {
	page = "${pageContext.request.contextPath}/pages/s/EWD0005_client_help_container.jsp";
	fieldName = name;
	AppCode = app;
	Bank = bnk;
	Selection = sel;
	Customer = cus;
	CenterWindow(page, 1000, 450, 1);
}

function GetCustomerDescId(name, desc, id) {
	page = "${pageContext.request.contextPath}/pages/s/EWD0001_client_desc_id_help_container.jsp";
	fieldName = name;
	fieldDesc = desc;
	fieldId = id;
	fieldAux1 = "";
	CenterWindow(page, 1000, 550, 1);
}

function GetGblCustDescId(name, desc, id) {
	page = "${pageContext.request.contextPath}/pages/s/EWD0077_client_desc_id_help_container.jsp";
	fieldName = name;
	fieldDesc = desc;
	fieldId = id;
	CenterWindow(page, 800, 530, 1);
}

function GetAccount(name, bnk, app, sel) {
	page = "${pageContext.request.contextPath}/pages/s/EWD0005_client_help_container.jsp";
	fieldName = name;
	fieldDesc = "";
	fieldAux1 = "";
	fieldAux2 = "";
	fieldAux3 = "";
	fieldAux4 = "";
	AppCode = app;
	Bank = bnk;
	Selection = sel;
	CenterWindow(page, 1000, 550, 1);
}

function GetOldAccount(bnk, brn, ccy, aty, cun, oac, acc) {
   page= "${pageContext.request.contextPath}/pages/s/EWD0406_old_acc_help_container.jsp";
   Bank = bnk;
   Branch = brn;
   Currency = ccy;
   PrdType = aty;
   OldAcc = oac;
   NewAcc = acc,
   Custumer = cun;
   CenterWindow(page,1000,550,1);
}

function GetCodeCNOFC(name, flag) {
	page = "${pageContext.request.contextPath}/pages/s/EWD0002_helpfile_CNOFC.jsp?codeflag=" + flag;
	fieldName = name;
	CenterWindow(page, 600, 400, 1);
}

function GetCodeAuxCNOFC(name, flag, codeaux) {
	page= "${pageContext.request.contextPath}/pages/s/EWD0002_helpfile_CNOFC.jsp?codeflag=" + flag + "&codeaux="+codeaux;
	fieldName = name;
	CenterWindow(page, 600, 400, 1);
}

function GetCodeDescCNOFC(name, desc, flag) {
	page = "${pageContext.request.contextPath}/pages/s/EWD0002_helpfile_CNOFC_Desc.jsp?codeflag=" + flag;
	fieldName = name;
	fieldDesc = desc;
	CenterWindow(page, 600, 400, 1);
}

function GetCodeDescAuxCNOFC(name, desc, flag, codeaux) {
	page = "${pageContext.request.contextPath}/pages/s/EWD0002_helpfile_CNOFC_Desc.jsp?codeflag=" + flag + "&codeaux="+codeaux;
	fieldName = name;
	fieldDesc = desc;
	CenterWindow(page, 600, 400, 1);
}

function GetCodeDescRefCNOFC(name, desc, aux2, flag) {
	page = "${pageContext.request.contextPath}/pages/s/EWD0053_helpfile_CNOFC.jsp?codeflag=" + flag;
	fieldName = name;
	fieldDesc = desc;
	fieldAux2 = aux2;
	CenterWindow(page, 600, 400, 1);
}

function GetCNOFCFilteredCodes(name, desc, filter1, flag) {
	var filter = filter1;
    page = "${pageContext.request.contextPath}/pages/s/EWD0002_helpfile_CNOFC_DescF.jsp?filter="+filter+"&codeflag=" + flag;
  	fieldName = name;
	fieldDesc = desc;
	CenterWindow(page, 600, 400, 1);
}

function GetIdTypesCNOFC(code, typeF, idF  ) {
	page = "${pageContext.request.contextPath}/pages/s/EWD0601_helpfile_IdTypes.jsp?&codeflag=" + code ;
	fieldName = typeF ;
	fieldDesc = idF ;
	CenterWindow(page, 600, 400, 1);
}

function GetParroquiaCodes(name, desc, filter1, filter2, flag) {
	var filter = filter1.trim() != "" ? filter1 : filter2;
	page = "${pageContext.request.contextPath}/pages/s/EWD0002_helpfile_CNOFC_DescF.jsp?filter=EWDMID&EWDMID="+filter+"&codeflag=" + flag;
	fieldName = name;
	fieldDesc = desc;
	CenterWindow(page, 600, 400, 1);
}

function Get2FilterCodes(name, desc, flag, filter1, filter2) {
	var f1 = isValidObject(filter1) ? filter1 : "";
	var f2 = isValidObject(filter2) ? filter2 : "";
	page = "${pageContext.request.contextPath}/pages/s/EWD0002_helpfile_CNOFC_DescF.jsp?codeflag=" + flag + "&filter="+f1+"&filter2=" + f2;
	fieldName = name;
	fieldDesc = desc;
	CenterWindow(page, 600, 400, 1);
}

function GetAccountHolders(name) {
	page = "${pageContext.request.contextPath}/pages/s/EWD0002_helpfile_CNOFC.jsp?codeflag=T8"; 
	fieldName = name;
	CenterWindow(page, 600, 400, 1);
}

function GetCurrency(name, bank) {
	fieldName = name;
	page = "${pageContext.request.contextPath}/servlet/datapro.eibs.helps.JSEWD0012?BankNumber=" + bank;
	CenterWindow(page, 500, 250, 2);

}

function GetUserRegistry(code, name, pattern) {
	page = "${pageContext.request.contextPath}/servlet/datapro.eibs.security.JSUsersManagement?SCREEN=10&limit=30&pattern=" + pattern;
	fieldName = code;
	fieldAux1 = name;
	CenterWindow(page, 500, 450, 3);
}

function GetGroupId(code, name) {
	page = "${pageContext.request.contextPath}/servlet/datapro.eibs.helps.JSEWD0435";
	fieldName = code;
	fieldAux1 = isValidObject(name) ? name : "";
	CenterWindow(page, 500, 450, 3);
}

function GetUser(code, name, usr){
	if(typeof usr !== 'undefined' && usr.trim() != "") {
		page = "${pageContext.request.contextPath}/servlet/datapro.eibs.helps.JSEWD0430?USR=" + usr;
	} else { 
		page = "${pageContext.request.contextPath}/pages/s/EWD0430_user_help_helpmessage.jsp" 
	}	fieldName = code;
	fieldAux1 = name;
	CenterWindow(page, 500, 450, 3);
}

function GetBranch(name, bank, desc) {
	page = "${pageContext.request.contextPath}/servlet/datapro.eibs.helps.JSEWD0013?BankNumber=" + bank;
	fieldName = name;
	fieldDesc = desc;
	CenterWindow(page, 600, 270, 3);
}

function GetApplicationCode(code) {
	page = "${pageContext.request.contextPath}/servlet/datapro.eibs.helps.JSEWD0390";
	fieldName = code;
	CenterWindow(page, 600, 300, 3);
}

function GetCondicionesCode(code) {
	page = "${pageContext.request.contextPath}/servlet/datapro.eibs.helps.JSEWD0521";
	fieldName = code;
	CenterWindow(page, 400, 280, 3);
}

function GetReferenceCode(code) {
	page = "${pageContext.request.contextPath}/servlet/datapro.eibs.helps.JSEWD0710";
	fieldName = code;
	CenterWindow(page, 500, 450, 3);
}

function GetCNOFTables(code, desc) {
	page = "${pageContext.request.contextPath}/servlet/datapro.eibs.helps.JSEWD0710";
	fieldName = code;
	fieldDesc = desc;
	CenterWindow(page, 500, 450, 3);
}

function GetConcept(name, bank, app, desc, ledger, mode, type, currency, prdCode) {
	var currencyField;
    page = "${pageContext.request.contextPath}/servlet/datapro.eibs.helps.JSEWD0035?App=" + app + "&Bank=" + bank + "&Mode=" + mode  + "&prdCode=" + prdCode + "&CCY=" + currency;
	fieldName = name;
	fieldAux1 = desc;
	fieldAux2 = ledger;
	fieldAux3 = type;
	currencyField = currency;
	CenterWindow(page, 600, 230, 3);
}

function GetCasualTable(name, desc) {
	page = "${pageContext.request.contextPath}/servlet/datapro.eibs.helps.JSEWD0110";
	fieldName = name;
	fieldDesc = desc;
	CenterWindow(page, 600, 400, 3);
}


function GetLNReference(name, bnk, app, sel, client) {
   GetAccByClient(name, bnk, app, sel, client);
}

function GetAccountCustomer(name, bnk, app, sel, cust) {
   page = "${pageContext.request.contextPath}/pages/s/EWD0005_client_help_container.jsp";
   fieldName = name;
   AppCode = app;
   Bank = bnk;				
   Selection = sel;
   fieldDesc = cust;
   CenterWindow(page, 1000, 550, 1);
}

function GetAccountInfo(name, bnk, app, sel, id, cust, ccy, type, prod) {
   page = "${pageContext.request.contextPath}/pages/s/EWD0005_client_help_container.jsp";
   fieldName = name;
   fieldDesc = cust;
   fieldAux1 = id;
   fieldAux2 = ccy;
   fieldAux3 = type;
   fieldAux4 = prod;
   AppCode = app;
   Bank = bnk;
   Selection = sel;
   CenterWindow(page, 800, 550, 1);
}

function GetAccountInfoExtras(name, bnk, app, sel, id, cust, ccy, type, prod,brn,desbrn,desccy,bnkback) {
	   page = "${pageContext.request.contextPath}/pages/s/EWD0006_client_help_container.jsp";
	   fieldName = name;
	   fieldDesc = cust;
	   fieldAux1 = id;
	   fieldAux2 = ccy;
	   fieldAux3 = type;
	   fieldAux4 = prod;
	   AppCode = app;
	   Bank = bnk;
	   Selection = sel;
	   //extras
	   fieldAux5 = brn;
	   fieldAux6 = desbrn;
	   fieldAux7 = desccy;
	   fieldAux8 = bnkback;
	   CenterWindow(page, 800, 550, 1);
	}

function GetWireOpening(name, amount) {
	page = "${pageContext.request.contextPath}/servlet/datapro.eibs.helps.JSEPR0110?SCREEN=1";
	fieldName = name;
	fieldAux1 = amount;
	CenterWindow(page, 500, 230, 3);
}

function GetBeneficiaryId(name)
{
    page = "${pageContext.request.contextPath}/servlet/datapro.eibs.helps.JSEWD0141";
	fieldName=name;
	fieldAux1= 'none';
	CenterWindow(page,530,450,2);
}

function GetProduct(name, app, bank, desc, type) {
	page= "${pageContext.request.contextPath}/pages/s/EWD0008_client_help_container.jsp"
	fieldName = name;
	fieldAux1 = desc;
	fieldAux2 = type;
	AppCode = app;
	ProductBank = bank;
	CenterWindow(page, 800, 400, 1);
}


function showCDRates(ccy, tb) {
	page = "${pageContext.request.contextPath}/servlet/datapro.eibs.tables.JSECN0030?CCY=" + ccy + "&TABLE=" + tb;
	fieldName = name;
	CenterWindow(page, 560, 500, 2);
}

function showCOLServCharge(bnk, typ, tb) {
	page = "${pageContext.request.contextPath}/servlet/datapro.eibs.tables.JSESD0715?BANK=" + bnk + "&TYPE=" + typ + "&TABLE=" + tb;
	fieldName = name;
	CenterWindow(page, 600, 500, 2);
}

function showLNServCharge(bnk, typ, tb) {
	page = "${pageContext.request.contextPath}/servlet/datapro.eibs.tables.JSESD0713?BANK=" + bnk + "&TYPE=" + typ + "&TABLE=" + tb;
	fieldName = name;
	CenterWindow(page, 600, 500, 2);
}

function showLCServCharge(bnk, typ, tb) {
	page = "${pageContext.request.contextPath}/servlet/datapro.eibs.tables.JSESD0714?BANK=" + bnk + "&TYPE=" + typ + "&TABLE=" + tb;
	fieldName = name;
	CenterWindow(page, 600, 500, 2);
}

function showDDAServCharge(bnk, typ, tb) {
	page = "${pageContext.request.contextPath}/servlet/datapro.eibs.tables.JSESD0712?BANK=" + bnk + "&TYPE=" + typ + "&TABLE=" + tb;
	fieldName = name;
	CenterWindow(page, 560, 500, 2);
}

function GetDocInv(name) {
	page = "${pageContext.request.contextPath}/servlet/datapro.eibs.helps.JSEWD0165";
	fieldName = name;
	CenterWindow(page, 500, 350, 2);
}

function GetTariffColl(name, searcher, EWDCUN) {
	page = "${pageContext.request.contextPath}/servlet/datapro.eibs.helps.JSEWD0104?Search=" + searcher + "&EWDCUN=" + EWDCUN;
	fieldName = name;
	CenterWindow(page, 600, 350, 3);
}

function GetRetCod(name, searcher) {
    page = "${pageContext.request.contextPath}/servlet/datapro.eibs.helps.JSEWD0102?Search=" + searcher;
	fieldName = name;
	CenterWindow(page, 600, 350, 3);
}

function GetTypCHKBook(name, hideF1, hideF2, desc, prodtyp, ccy) {
	page = "${pageContext.request.contextPath}/servlet/datapro.eibs.helps.JSEWD0118?SCREEN=3&PRODTYP="+prodtyp+"&CCY="+ccy;
	fieldName = name;
	fieldAux1 = hideF1;
	fieldAux2 = hideF2;
	fieldDesc = desc;
	CenterWindow(page, 500, 250, 3);
}

function GetBroker(name, desc, type) {
   page = "${pageContext.request.contextPath}/pages/s/EWD0023_brkr_help_container.jsp";
   fieldName = name;
   fieldDesc = desc;
   fieldAux1 = type;
   CenterWindow(page, 700, 300, 1);
}

function GetTypeBroker(name, type) {
   page = "${pageContext.request.contextPath}/pages/s/EWD0023_brkr_help_container.jsp";
   fieldName = name;
   fieldAux1 = type;
   CenterWindow(page, 900, 400, 1);
}

function GetOfficialCheck(name, desc, type, ccy, sel) {
	   page = "${pageContext.request.contextPath}/pages/s/EWD0060_official_checks_container.jsp";
	   fieldName = name;
	   fieldDesc = desc;
	   fieldAux1 = type;
	   Currency = ccy;
	   Selection = sel;
	   CenterWindow(page, 900, 540, 1);
	}

function GetLoanTable(name, searcher) {
	page = "${pageContext.request.contextPath}/servlet/datapro.eibs.helps.JSEWD0105?Search=" + searcher;
	fieldName = name;
	CenterWindow(page, 600, 350, 3);
}

function GetLoanChargeTable(name, searcher) {
	page = "${pageContext.request.contextPath}/servlet/datapro.eibs.helps.JSEWD0058?Search=" + searcher;
	fieldName = name;
	CenterWindow(page, 600, 350, 3);
}

function GetPrevTable(name) {
	page = "${pageContext.request.contextPath}/servlet/datapro.eibs.helps.JSEWD0106";
	fieldName = name;
	CenterWindow(page, 600, 240, 3);
}

function GetRateTable(name, code) {
	page = "${pageContext.request.contextPath}/servlet/datapro.eibs.helps.JSEWD0032?&code=" + code;
	fieldName = name;
	CenterWindow(page, 430, 200, 3);
}

function GetTablaFactores(name, code) {
	page = "${pageContext.request.contextPath}/servlet/datapro.eibs.helps.JSEWD0212?&code=" + code;
	fieldName = name;
	CenterWindow(page, 500, 200, 1);
}

function GetFloating(name,type,dsc,primaryrte,secondaryrte,bseTyp) {
	page = "${pageContext.request.contextPath}/servlet/datapro.eibs.helps.JSEWD0100";
	fieldName = name;
	fieldType = type;
	fieldDscr = dsc;
	fieldPrrte = primaryrte;
	fieldSrrte = secondaryrte;
	fieldBsty = bseTyp;
	CenterWindow(page, 600, 275, 3);
}

function GetLimit(name, bank, code) {
	page = "${pageContext.request.contextPath}/servlet/datapro.eibs.helps.JSEWD0380?bnk=" + bank + "&tbl=" + code;
	fieldName = name;
	CenterWindow(page, 600, 400, 2);
}

function GetDescATMCard(name, desc) {
	page = "${pageContext.request.contextPath}/servlet/datapro.eibs.helps.JSEWD0135";
	fieldName = name;
	fieldDesc = desc;
	CenterWindow(page, 400, 300, 1);
}

function GetCodeTChannel(name, desc, aux1) {
	page = "${pageContext.request.contextPath}/pages/s/EPR0300_chanel_codes_helpfile.jsp";
	fieldName = name;
	fieldDesc = desc;
	fieldAux1 = aux1;
	CenterWindow(page, 450, 300, 2);
}

function GetCodeTransaction(name, desc, aux1) {
	page = "${pageContext.request.contextPath}/pages/s/EPR0300_transaction_codes_helpfile.jsp";
	fieldName = name;
	fieldDesc = desc;
	fieldAux1 = aux1;
	CenterWindow(page, 450, 300, 2);
}

function GetFeRef(name, typ, prd, desc) {
    page = "${pageContext.request.contextPath}/servlet/datapro.eibs.helps.JSEWD0325";
	fieldName = name;
	fieldAux1 = typ;
	fieldAux2 = prd;
	fieldAux3 = desc;
	CenterWindow(page, 700, 300, 3);
}

function GetFeRefNew(name, typ, prd){
    page = "${pageContext.request.contextPath}/servlet/datapro.eibs.helps.JSEWD0325";
	fieldName = name;
	fieldAux1 = typ;
	fieldAux2 = prd;
	CenterWindow(page, 700, 300, 3);
}

function GetUserTeller(code, name, pattern){
	page = "${pageContext.request.contextPath}/servlet/datapro.eibs.security.JSUsersTeller?SCREEN=5&limit=30&pattern=" + pattern;
	fieldName = code;
	fieldAux1 = name;
	CenterWindow(page, 500, 450, 3);
}

function GetTellerParameters(flag, code, name){
	page = "${pageContext.request.contextPath}/servlet/datapro.eibs.security.JSUsersTeller?SCREEN=100&limit=30&flag=" + flag;
	fieldName = code;
	fieldAux1 = name;
	CenterWindow(page, 500, 450, 3);
}

function GetTellerShifts(code, name, bank, branch){
	page = "${pageContext.request.contextPath}/servlet/datapro.eibs.security.JSUsersTeller?SCREEN=101&limit=30&CODEBANK=" + bank + "&CODEBRANCH=" + branch;
	fieldName = code;
	fieldAux1 = name;
	CenterWindow(page, 500, 450, 3);
}

function GetCloneTransfer(name) {
	page = "${pageContext.request.contextPath}/servlet/datapro.eibs.products.JSEPR1060H?SCREEN=1";
	fieldName = name;
	CenterWindow(page, 600, 350, 3);
}

function GetComission(ref) {
	page = "${pageContext.request.contextPath}/servlet/datapro.eibs.helps.JSEWD0530?Ref=" + ref;
	CenterWindow(page, 400, 280, 1);
}

function GetPlastic(num) {
	page = "${pageContext.request.contextPath}/servlet/datapro.eibs.helps.JSEWD0410";
	fieldName = num;
	CenterWindow(page, 600, 300, 2);
}

function GetCodeCreditCard(name, flag) {
	page = "${pageContext.request.contextPath}/servlet/datapro.eibs.helps.JSEWD0410?codeflag=" + flag;
	fieldName = name;
	CenterWindow(page, 600, 300, 1);
}

function GetPlastic2(num, type, codeflag) {
	page = "${pageContext.request.contextPath}/servlet/datapro.eibs.helps.JSEWD0411?type=" + type + "&codeflag=" + codeflag;
	fieldName = num;
	CenterWindow(page, 600, 300, 2);
}

function GetTableFeeCod(name, searcher) {
    page = "${pageContext.request.contextPath}/servlet/datapro.eibs.helps.JSEWD0412?Search=" + searcher;
	fieldName = name;
	CenterWindow(page, 600, 100, 3);
}

function GetPlastic3(num, type, branch, user, codeflag) {
	page = "${pageContext.request.contextPath}/servlet/datapro.eibs.helps.JSEWD0413?type=" + type + "&branch=" + branch + "&user=" + user + "&codeflag=" + codeflag;
	fieldName = num;
	CenterWindow(page, 600, 300, 2);
}

//*******************************************************************************************
//ESTA AYUDA TRAE EL NRO DE LA TARJETA DEBITO Y ACTUALIZA EN LA PANTALLA QUE LO ESTA LLAMANDO
//LOS CAMPOS NRO DE TARJETA FECHA DE EXPEDICION Y FECHA DE EXPIRACION

var monthEx ; 		// Mes Expiracion
var yearEx ;		// Anio Expiracion
var dayEm ;			// Day Emision
var monthEm ;		// Mes Emision
var yearEm ;		// Anio Emision

function GetPlastic4(num, mEx, yEx, dEm, mEm, yEm, type, branch, user, codeflag) {
	page = "${pageContext.request.contextPath}/servlet/datapro.eibs.helps.JSEWD0413A?type=" + type + "&branch=" + branch + "&user=" + user + "&codeflag=" + codeflag;
	fieldName=num;
	monthEx = mEx ;
	yearEx = yEx ;
	dayEm = dEm ;
	monthEm = mEm ;
	yearEm = yEm ;
	CenterWindow(page,600,300,2);
}
//**********************************************************************************************

function GetPlasticStatus(num, desc) {
	page = "${pageContext.request.contextPath}/servlet/datapro.eibs.helps.JSEWD0414";
	fieldName = num;
	fieldDesc = desc;
	CenterWindow(page, 600, 300, 2);
}

function GetTransactionType(num, desc) {
	page = "${pageContext.request.contextPath}/servlet/datapro.eibs.helps.JSEWD0415";
	fieldName = num;
	fieldDesc = desc;
	CenterWindow(page, 600, 300, 2);
}

function GetCommissionType(num, desc) {
	page = "${pageContext.request.contextPath}/servlet/datapro.eibs.helps.JSEWD0416";
	fieldName = num;
	fieldDesc = desc;
	CenterWindow(page, 600, 300, 2);
}

function GetPaymentPeriod(num, desc) {
	page = "${pageContext.request.contextPath}/servlet/datapro.eibs.helps.JSEWD0417";
	fieldName = num;
	fieldDesc = desc;
	CenterWindow(page, 600, 300, 2);
}

function GetCodeService(srv, srn, cia) {
	page = "${pageContext.request.contextPath}/servlet/datapro.eibs.helps.JSEWD0520?Cia=" + cia;
	fieldName = srv;
	fieldAux1 = srn;
	CenterWindow(page, 500, 350, 2);
}

function GetSequence(seq, cia, srv) {
	page = "${pageContext.request.contextPath}/servlet/datapro.eibs.helps.JSEWD0525?Cia=" + cia + "&Srv=" + srv;
	fieldName = seq;
	CenterWindow(page, 500, 350, 2);
}

function NewShortCust(cusnum, cusname, cusidn) {
	page = "${pageContext.request.contextPath}/pages/s/ESD0080_client_short_enter_identification.jsp";
	fieldName = cusnum;
	fieldDesc = cusname;
	fieldId = cusidn;
	CenterWindow(page, 600, 150, 2);
}

function NewUpdateShortCust(name, desc, cusnum, cusidn) {
	page = "${pageContext.request.contextPath}/servlet/datapro.eibs.client.JSESD0080?SCREEN=7&CUSNUM=" + cusnum + "&CUSIDN=" + cusidn;
	fieldName = name;
	fieldDesc = desc;
	CenterWindow(page, 600, 500, 2);
}

function getCodeAcpt(name, cod) {
	page = "${pageContext.request.contextPath}/pages/s/EWD0170_dft_hlp_acpt_container.jsp";
	fieldName = name;
	fieldAux1 = cod;
	CenterWindow(page, 600, 400, 2);
}

function showTRImg(cod) {
	page = "${pageContext.request.contextPath}/pages/s/ECIF030_rt_transaction_img.jsp?imgName=" + cod;
	CenterWindow(page, 600, 400, 2);
}

function showLCInq(cusnum) {
	page = "${pageContext.request.contextPath}/servlet/datapro.eibs.credit.JSELN0110?SCREEN=400&CUSNUM=" + cusnum;
	CenterWindow(page, 600, 500, 2);
}

function showTransfer(wtnum) {
	page = "${pageContext.request.contextPath}/servlet/datapro.eibs.transfer.JSEDD0610?SCREEN=2&E01SCHNUM=" + wtnum;
	CenterWindow(page, 600, 500, 2);
}

function checksStatus(chk) {
	page = "${pageContext.request.contextPath}/servlet/datapro.eibs.products.JSECH0565?SCREEN=3&chkNum=" + chk;
	CenterWindow(page, 600, 500, 2);
}

function showDeductionDetail(code, type, account) {
	page = "${pageContext.request.contextPath}/servlet/datapro.eibs.products.JSEDL0305?SCREEN=2&CODE=" + code + "&TYPE=" + type + "&ACCOUNT="+ account;
	CenterWindow(page, 600, 450, 2);
}

function showInqApproval(app, account, type) {
	page = "${pageContext.request.contextPath}/servlet/datapro.eibs.products.JSEDL0140?SCREEN=3&ACCNUM=" + account + "&appCode=" + app + "&typeCode=" + type;
	clickElement("ACCNUM", account);
	CenterWindow(page, 1100, 600, 2);
}

function showInqApprovalCredito(app, account, type) {
	page = "${pageContext.request.contextPath}/servlet/datapro.eibs.salesplatform.JSEPV1400?SCREEN=4&ACCNUM=" + account + "&appCode=" + app + "&typeCode=" + type;
	clickElement("ACCNUM", account);
	CenterWindow(page, 1000, 600, 2);
}

function showInqApprovalDDA(app, account,type) {
	page = "${pageContext.request.contextPath}/servlet/datapro.eibs.products.JSEDD1000?SCREEN=3&ACCNUM=" + account + "&appCode=" + app + "&typeCode=" + type;
	clickElement("ACCNUM", account);
	CenterWindow(page, 1000, 600, 2);
}

function showInqApprovalCL(app, account) {
	page = "${pageContext.request.contextPath}/servlet/datapro.eibs.credit.JSELN0040?SCREEN=3&ACCNUM=" + account + "&appCode=" + app;
	clickElement("ACCNUM", account);
	CenterWindow(page, 1000, 600, 2);
}

function showInqApprovalPC(account, type) {
	page = "${pageContext.request.contextPath}/servlet/datapro.eibs.products.JSEPC0000?SCREEN=600&E01PCMACC=" + account;
	CenterWindow(page, 1000, 600, 2);
}

function showInqApprovalClient(account) {
	page = "${pageContext.request.contextPath}/servlet/datapro.eibs.client.JSESD0100?SCREEN=3&ACCNUM=" + account;
	clickElement("ACCNUM", account);
	CenterWindow(page, 1000, 500, 2);
}

function showInqApprovalColl(app, account) {
	page = "${pageContext.request.contextPath}/servlet/datapro.eibs.client.JSERA0080?SCREEN=3&REFNUM=" + account + "&appCode=" + app;
	clickElement("REFNUM", account);
	CenterWindow(page, 1000, 600, 2);
}

function showInqApprovalForex(app, account, type) {
	page = "${pageContext.request.contextPath}/servlet/datapro.eibs.products.JSEDL9140?SCREEN=3&ACCNUM=" + account + "&appCode=30" + "&typeCode=" + type;
	clickElement("ACCNUM", account);
	CenterWindow(page, 1000, 600, 2);
}

function showInqApprovalCards(app, account, type, card) {
	page = "${pageContext.request.contextPath}/servlet/datapro.eibs.products.JSECC0140?SCREEN=3&ACCNUM=" + account + "&appCode=" + app + "&typeCode=" + type + "&CARDNUM=" + card;
	clickElement("ACCNUM", account);
	CenterWindow(page, 1000, 600, 2);
}

function showInqApprovalCC(app, account, type) {
	page = "${pageContext.request.contextPath}/servlet/datapro.eibs.products.JSECC0140?SCREEN=3&ACCNUM=" + account + "&appCode=" + app + "&typeCode=" + type;
	clickElement("ACCNUM", account);
	CenterWindow(page, 1000, 600, 2);
}

function GetCardAccounts() {
	try{
		var card = document.forms[0].CARD.value;
		window.location.href = "${pageContext.request.contextPath}/servlet/datapro.eibs.products.JSECC0080?SCREEN=800&E01CCANUM=" + card;
	} catch (e) {
		window.location.href = "${pageContext.request.contextPath}/servlet/datapro.eibs.products.JSECC0080?SCREEN=800";
	}
}

function GetCardAccountsInq() {
	try{
		var card = document.forms[0].CARD.value;
		window.location.href = "${pageContext.request.contextPath}/servlet/datapro.eibs.products.JSECC0080I?SCREEN=800&E01CCANUM=" + card;
	} catch (e) {
		window.location.href = "${pageContext.request.contextPath}/servlet/datapro.eibs.products.JSECC0080I?SCREEN=800";
	}
}

function showInqAcc(account) {
	page = "${pageContext.request.contextPath}/servlet/datapro.eibs.client.JSECIF010?SCREEN=400&opt=1&ACCNUM=" + account;
	CenterWindow(page, 600, 500, 2);
}

function showInqCollateral(account,apcod) {
	page = "${pageContext.request.contextPath}/servlet/datapro.eibs.client.JSERA0000?SCREEN=4&APPCODE="+ apcod +"&ACCNUM=" + account;
	CenterWindow(page,600,500,2);
}

function goGaBasic() {
	var client = "";
	var ref = getElementChecked("REFNUM");
	if ((typeof ref !== 'undefined') && (ref.value !== "")) {
		page = "${pageContext.request.contextPath}/servlet/datapro.eibs.client.JSERA0010?SCREEN=8&REF=" + ref.value + "&CLIENT=" + client;
		CenterWindow(page, 600, 500, 2);
	}
}

function showProdAcc(app, flg, typ, cde) {
	flg = "";
	page = "${pageContext.request.contextPath}/servlet/datapro.eibs.client.JSECIF010?SCREEN=9&appCode=" + app + "&flag=" + flg + "&prodType=" + typ + "&prodCode=" + cde;
	CenterWindow(page, 600, 500, 2);
}

function showServices(customer) {
    page = "${pageContext.request.contextPath}/servlet/datapro.eibs.products.JSECP0001?SCREEN=4&CUSTOMER=" + customer;
	CenterWindow(page, 530, 530, 2);
}

function showOffChkApproval(account, currency, purpose) {
	page = "${pageContext.request.contextPath}/servlet/datapro.eibs.products.JSEOF0115A?SCREEN=3&ACCNUM=" + account + "&Currency=" + currency + "&Purpose=" + purpose;
	CenterWindow(page, 600, 500, 2);
}

function getOffClass(name, page) {
	page = EIBS.pagesPrefix() + page;
	fieldName = name;
	CenterWindow(page, 320, 300, 2);
}

function showAccGrp(app, flg, grp) {
	page = "${pageContext.request.contextPath}/servlet/datapro.eibs.client.JSECIF010?SCREEN=19&appCode=" + app + "&flag=" + flg + "&STATUS=T" + "&Grupo=" + grp;
	CenterWindow(page, 600, 500, 2);
}

function showAcc(app, flg) {
	page = "${pageContext.request.contextPath}/servlet/datapro.eibs.client.JSECIF010?SCREEN=9&appCode=" + app + "&flag=" + flg + "&STATUS=T";
	CenterWindow(page, 600, 500, 2);
}

function showAcc2(app, flg, ofc) {
	page = "${pageContext.request.contextPath}/servlet/datapro.eibs.client.JSECIF010?SCREEN=9&appCode=" + app + "&flag=" + flg+ "&ofc=" + ofc + "&STATUS=T";
	CenterWindow(page, 600, 500, 2);
}


function lnGetOver(name, page) {
	GetCode(name, page);
}

function lnGetContr(name, page) {
	GetCode(name, page);
}

function lnGetFact(name, page) {
	GetCode(name, page);
}

function GetCredCond(name, page) {
	GetCode(name, page);
}

function GetRel1(name, page) {
	GetCode(name, page);
}

function GetRel2(name, page) {
	GetCode(name, page);
}

function GetClassCred(name, page) {
	GetCode(name, page);
}

function GetDepTyp(name, page) {
	GetCode(name, page);
}

function GetCodeDescDeal(name, desc) {
	page = "${pageContext.request.contextPath}/pages/s/EWD0158_Deal_Table_Container.jsp";
	fieldName = name;
	fieldDesc = desc;
	CenterWindow(page, 500, 300, 3);
}

function GetConvenio(code, desc, cus) {
	fieldName = code;
	fieldDesc = desc;
	page = "${pageContext.request.contextPath}/servlet/datapro.eibs.helps.JSEWD0208?EWDCUN=" + cus;
	CenterWindow(page, 500, 300, 3);
}

function GetFechaPlan(dateM, dateD, dateY) {
	fieldAux1 = dateM;
	fieldAux2 = dateD;
	fieldAux3 = dateY;
	page = "${pageContext.request.contextPath}/servlet/datapro.eibs.products.JSEDL0158?SCREEN=500";
	CenterWindow(page, 500, 500, 3);
}

function GetPagadurias(pag, con , dsc) {
	fieldName=pag;
	fieldDesc=dsc;
	page = "${pageContext.request.contextPath}/servlet/datapro.eibs.helps.JSEWD0159?EWDCNV=" + con;
	CenterWindow(page, 400, 280, 3);
}

function GetFomento(code, bank, product,dsc,cun,nme,prd,ftb,fty,bnk,brn,obk,obr,ocy,ogl, prddsc, floatType,floatDesc) {
	fieldCode = code;
	fieldDesc = dsc;
	fieldName = cun;
	fieldAux1 = nme;
	fieldAux2 = prd;
	fieldAux3 = ftb;
	fieldAux4 = fty;
	fieldAux5 = bnk;
	fieldAux6 = brn;
	fieldAux7 = obk;
	fieldAux8 = obr;
	fieldAux9 = ocy;
	fieldAux10 = ogl;
	fieldAux11 = prddsc;
	fieldAux12 = floatType;
	fieldAux13 = floatDesc;

	fieldBANK=bank;
	fieldPROD=product;
	
	page = "${pageContext.request.contextPath}/servlet/datapro.eibs.helps.JSEWD0395?BNK="+bank+"&PRD="+product;
	CenterWindow(page, 600, 280, 3);
}


function GetCobranza(code, dsc) {
	fieldCode = code;
	fieldDesc = dsc;
	page = "${pageContext.request.contextPath}/servlet/datapro.eibs.helps.JSEWD0612";
	CenterWindow(page, 600, 280, 3);
}

function GetCustomer(name) {
	GetCustomerDescId( name ,' ', ' ');
}

function GetCustomerDetails(cus, name, id, type, countrycode, add2, add3, add4, city, state, country, pob, zip, citizen, prof, gender, marital, phone) {
    page = "${pageContext.request.contextPath}/pages/s/EWD0001_client_desc_details_help_container.jsp";
	fieldAux1 = cus;
	fieldAux2 = name;
	fieldAux3 = id;
	fieldAux4 = type;
	fieldAux5 = countrycode;
	fieldAux6 = add2;
	fieldAux7 = add3;
	fieldAux8 = add4;
	fieldAux9 = city;
	fieldAux10 = state;
	fieldAux11 = country;
	fieldAux12 = pob;
	fieldAux13 = zip;
	fieldAux14 = citizen;
	fieldAux15 = prof;
	fieldAux16 = gender;
	fieldAux17 = marital;
	fieldAux18 = phone;
	CenterWindow(page, 750, 550, 1);
}

function GetCustomerDetails2(cus, nme, idn, idt, idc, ctr, ste, rgn, mun, cty, par, pob, urb, str, hom, flr, apt, ref, zip, ctz, prf, gnd, mst, phn, tpp, cip, nm1, nm2, ap1, ap2, gec, dst, mnc, dct, add, iad) {
    page = "${pageContext.request.contextPath}/pages/s/EWD0700_customer_details_help_container.jsp";
	fieldAux1 = cus;
	fieldAux2 = nme;
	fieldAux3 = idn;
	fieldAux4 = idt;
	fieldAux5 = idc;
	fieldAux6 = ctr;
	fieldAux7 = ste;
	fieldAux8 = rgn;
	fieldAux9 = mun;
	fieldAux10 = cty;
	fieldAux11 = par;
	fieldAux12 = pob;
	fieldAux13 = urb;
	fieldAux14 = str;
	fieldAux15 = hom;
	fieldAux16 = flr;
	fieldAux17 = apt;
	fieldAux18 = ref;
	fieldAux19 = zip;
	fieldAux20 = ctz;
	fieldAux21 = prf;
	fieldAux22 = gnd;
	fieldAux23 = mst;
	fieldAux24 = phn;
	fieldAux25 = tpp;
	fieldAux26 = cip;
	fieldAux27 = nm1;
	fieldAux28 = nm2;
	fieldAux29 = ap1;
	fieldAux30 = ap2;
	fieldAux31 = gec;
	fieldAux32 = dst;
	fieldAux33 = mnc;
	fieldAux34 = dct;
	fieldAux35 = add;
	fieldAux36 = iad;
	CenterWindow(page, 750, 550, 1);
}

function GetCustomerDetails3(cus, nme, idn, idt, dti, cpa, dpa, bth) {
    page = "${pageContext.request.contextPath}/pages/s/EWD0440_user_details_help_container.jsp";
	fieldAux1 = cus;
	fieldAux2 = nme;
	fieldAux3 = idn;
	fieldAux4 = idt;
	fieldAux5 = dti;
	fieldAux6 = cpa;
	fieldAux7 = dpa;
	fieldAux8 = bth;
	CenterWindow(page, 750, 550, 1);
}


function GetCustomerDetailsLC(cust, name, add2, add3, add4, state, zip, country, type) {
    page = "${pageContext.request.contextPath}/pages/s/EWD0001_client_lc_help_container.jsp";
	fieldAux1 = cust;
	fieldAux2 = name;
	fieldAux3 = add2;
	fieldAux4 = add3;
	fieldAux5 = add4;
	fieldAux6 = state;
	fieldAux7 = zip;
	fieldAux8 = country;
	fieldAux9 = type;
	CenterWindow(page, 750, 550, 1);
}

function GetCustomerId(name) {
	GetCustomerDescId('', '', name);
}

function GetDepositType(name, desc) {
	page = "${pageContext.request.contextPath}/servlet/datapro.eibs.helps.JSEWB0010";
	fieldName = name;
	fieldDesc = desc;
	CenterWindow(page, 500, 500, 1);
}

function GetLocations(name, desc) {
	page = "${pageContext.request.contextPath}/servlet/datapro.eibs.helps.JSEWB0030";
	fieldName = name;
	fieldDesc = desc;
	CenterWindow(page, 500, 500, 2);
}

function GetDepositNumber(name, type, loc, client) {
	page = "${pageContext.request.contextPath}/servlet/datapro.eibs.helps.JSEWB0110";
	fieldName = name;
	fieldAux1 = type;
	fieldAux2 = loc;
	fieldAux3 = client;
	CenterWindow(page, 500, 500, 1);
}

function GetAvailableSafeDeposits(name, desc, type, typeDsc, location, locDsc, serial, numKeys) {
	page = "${pageContext.request.contextPath}/servlet/datapro.eibs.helps.JSEWD0750";
	fieldName = name;
	fieldDesc = desc;
	fieldAux1 = type;
	fieldAux2 = typeDsc;
	fieldAux3 = location;
	fieldAux4 = locDsc;
	fieldAux5 = serial;
	fieldAux6 = numKeys;
	CenterWindow(page, 500, 500, 1);
}

function GetInternetVendor(name, codeflag) {
	page = "${pageContext.request.contextPath}/pages/s/EWD0705_vendor_help_container.jsp?codeflag=" + codeflag;
	fieldName = name;
	CenterWindow(page, 500, 500, 1);
}

function GetFeeTable(name) {
	page = "${pageContext.request.contextPath}/servlet/datapro.eibs.helps.JSEWB0000";
	fieldName = name;
	CenterWindow(page, 500, 500, 1);
}

function GetOfficer(name) {
	page = "${pageContext.request.contextPath}/pages/s/EWD0122_officer_help_container.jsp";
	fieldName = name;
	CenterWindow(page, 500, 500, 1);
}

function getOficial(cod, branch) {
	if (branch == "") branch = "999";
    page = "${pageContext.request.contextPath}/servlet/datapro.eibs.helps.JSEWD0123?Branch=" + branch;
	fieldCod = cod;
	CenterWindow(page, 500, 350, 2);
}

function GetCustomerDescId2(name, desc, id) {
	page = "${pageContext.request.contextPath}/pages/s/EWD0001B_client_desc_id_help_container.jsp";
	fieldName = name;
	fieldDesc = desc;
	fieldId = id;
	fieldAux1 = "";
	CenterWindow(page, 530, 560, 1);
}

function GetCorrespondentDescId(name, desc, id) {
	page = "${pageContext.request.contextPath}/pages/s/EWD0505_correspondent_desc_id_help_container.jsp";
	fieldName = name;
	fieldDesc = desc;
	fieldId = id;
	fieldAux1 = "";
	CenterWindow(page, 530, 530, 1);
}

function GetCorrespondentDescIdSwift(name, desc, id) {
	page = "${pageContext.request.contextPath}/pages/s/EWD0545_correspondent_desc_id_help_container.jsp";
	fieldName = name;
	fieldDesc = desc;
	fieldId = id;
	fieldAux1 = "";
	CenterWindow(page, 530, 530, 1);
}

function GetCustomerCorp(name, desc, id) {
	page = "${pageContext.request.contextPath}/pages/s/EWD0001_client_desc_id_help_container.jsp";
	fieldName = name;
	fieldDesc = desc;
	fieldId = id;
	fieldAux1 = "1";
	CenterWindow(page, 530, 530, 1);
}

function GetAcceptantId(name) {
	page = "${pageContext.request.contextPath}/pages/s/EWD0140_acceptant_help_container.jsp" ;
	fieldName = name;
	fieldAux1 = 'none';
	CenterWindow(page, 530, 450, 1);
}

function GetAcceptantIdNDA(name, ndaname) {
	page= "${pageContext.request.contextPath}/pages/s/EWD0140_acceptant_help_container.jsp" ;
	fieldName = name;
	fieldAux1 = ndaname;
	CenterWindow(page, 530, 450, 1);
}
function GetAcceptantAddr(name, ndaname, cust, rut, rua, man, type) {

//	page= "${pageContext.request.contextPath}/pages/s/EWD0140_acceptant_help_container.jsp" ;
	page = "${pageContext.request.contextPath}/servlet/datapro.eibs.helps.JSEWD0140?SCREEN=2&Type=" + type + "&Cust=" + cust + "&Rut=" + rut +"&Rua=" +rua + "&Man=" + man;
//	page = "${pageContext.request.contextPath}/servlet/datapro.eibs.helps.JSEWD0140?SCREEN=2&Type=" + type + "&Cust=" + cust + "&Rut=" + rut +"&Rua=" +rua + "&Man=" + man;
	fieldName = name;
	fieldAux1 = ndaname;
	fieldAux2 = cust;
	fieldAux3 = rut;
	fieldAux4 = rua;
	fieldAux5 = man;
	CenterWindow(page, 630, 450, 1);
}
function GetProductFamily(name, app, desc) {
	page = "${pageContext.request.contextPath}/pages/s/EWD0150_product_help_container.jsp"
	fieldName = name;
	AppCode = app;
	fieldAux1 = desc;
	CenterWindow(page, 800, 400, 1);
}

function GetProductModule(name) {
	page = "${pageContext.request.contextPath}/pages/s/EWD0150_process_help_container.jsp"
	fieldName = name;
	CenterWindow(page, 600, 325, 1);
}

function GetLedgerOrAccount(name, bnk, ccy, apc, sel) {
   Bank = trim(bnk);
   Currency = trim(ccy);
   fieldName = name;
   AppCode = apc;
   Selection = sel;
   
   if ((Bank.length > 0) && (Currency.length > 0)) {
	   AppCode = "";
	   GetLedger(fieldName, Bank, Currency, AppCode, '', '');
   } else {
	   var n = getElementIndex(fieldName);
	   if (n > 0) {
		   document.forms[0].elements[n-1].value = "";
		   document.forms[0].elements[n-3].value = "";
	   }
	   Bank = "";
	   GetAccount(fieldName, Bank, AppCode, Selection);
   }
}

function GetCurrencyDesc(name, desc, bank) {
    page = "${pageContext.request.contextPath}/servlet/datapro.eibs.helps.JSEWD0012?SCREEN=2&BankNumber=" + bank;
	fieldName = name;
	fieldDesc = desc;
	CenterWindow(page, 500, 250, 2);

}

function GetInstCurrency(name, bank, inst) {
    page = "${pageContext.request.contextPath}/servlet/datapro.eibs.helps.JSEWD0500?BankNumber=" + bank + "&Inst=" + inst;
	fieldName = name;
	CenterWindow(page, 500, 350, 2);
}

function GetCheckForeignExc(sub, name, lot, ini, fin, bal, chk, bank, branch, type, user) {
    page = "${pageContext.request.contextPath}/servlet/datapro.eibs.helps.JSEWD0510?Bank=" + bank + "&Branch=" + branch + "&Type=" + type + "&User=" + user;
	fieldSub = sub;
	fieldName = name;
	fieldLot = lot;
	fieldIni = ini;
	fieldFin = fin;
	fieldBal = bal;
	fieldChk = chk;
	CenterWindow(page, 500, 350, 2);
}

function GetValuePaper(lot, bal, ini, fin, bank, branch, type, sub) {
    page = "${pageContext.request.contextPath}/servlet/datapro.eibs.helps.JSEWD0535?Bank=" + bank + "&Branch=" + branch + "&Type=" + type + "&Sub=" + sub;
	fieldLot = lot;
	fieldBal = bal;
	fieldIni = ini;
	fieldFin = fin;
	CenterWindow(page, 500, 350, 2);
}

function GetAdhesivos(lot, bal, ini, fin, bank, branch, type, sub, balA, iniA, finA) {
    page = "${pageContext.request.contextPath}/servlet/datapro.eibs.helps.JSEWD0537?Bank=" + bank + "&Branch=" + branch + "&Type=" + type + "&Sub=" + sub;
	fieldLot = lot;
	fieldBal = bal;
	fieldIni = ini;
	fieldFin = fin;
	fieldBalA = balA;
	fieldIniA = iniA;
	fieldFinA = finA;
	CenterWindow(page, 500, 350, 2);
}

function GetBatchDet(date1, date2, date3, batch, acr) {
	var page = "${pageContext.request.contextPath}/servlet/datapro.eibs.client.JSEGL0421?SCREEN=1&DT1="+date1+"&DT2="+date2+"&DT3="+date3+"&BTH="+batch+"&ACR="+acr+"&Pos=0" ;
	CenterWindow(page, 1200, 550, 2);
}

function GetBudget(name, bank, currency) {
	page = "${pageContext.request.contextPath}/pages/s/EWD0011_client_help_container.jsp"
	fieldName = name;
	BankNumber = bank;
	Currency = currency;
	CenterWindow(page, 800, 300, 1);
}

function GetSwiftId(name) {
	page = "${pageContext.request.contextPath}/pages/s/EWD0130_bankid_help_container.jsp"
	fieldName = name;
	PVia = "S";
	CenterWindow(page, 830, 450, 1);
}

function GetFedId(name) {
	page = "${pageContext.request.contextPath}/pages/s/EWD0130_bankid_help_container.jsp"
	fieldName = name;
	PVia = "F";
	CenterWindow(page, 830, 450, 1);
}

function GetPortfolioNum(name, type) {
	page = "${pageContext.request.contextPath}/pages/s/EWD0302_portfolio_help_container.jsp"
	fieldName = name;
	fieldId = type;
	CenterWindow(page, 530, 450, 1);
}

function GetDocument(name, account, id, status) {
	page = "${pageContext.request.contextPath}/servlet/datapro.eibs.helps.JSEWD0145?Account=" + account + "&id=" + id + "&Status=" + status;
   	fieldName = name;
   	CenterWindow(page,600,450,1);
}

function GetCreditLine(name, custnum) {
	page = "${pageContext.request.contextPath}/servlet/datapro.eibs.helps.JSEWD0015?CustNum=" + custnum;
	fieldName = name;
	CenterWindow(page, 630, 350, 3);
}

function GetCreditLineGBL(name, custnum) {
	page = "${pageContext.request.contextPath}/servlet/datapro.eibs.helps.JSEWD0078?CustNum=" + custnum;
	fieldName = name;
	CenterWindow(page, 630, 350, 3);
}

function GetSubAcc(name, account) {
	page = "${pageContext.request.contextPath}/servlet/datapro.eibs.helps.JSEWD0016?AccountNum=" + account;
	fieldName = name;
	CenterWindow(page, 500, 100, 1);
}

function GetAct(name) {
	page = "${pageContext.request.contextPath}/pages/s/EWD0020_client_help_helpmessage.jsp"
	fieldName = name;
	CenterWindow(page, 500, 500, 2);
}

function GetMailing(name, custnum, type) {
    page = "${pageContext.request.contextPath}/servlet/datapro.eibs.helps.JSEWD0026?CustNum=" + custnum +"&type="+type;
	fieldName = name;
	CenterWindow(page, 450, 350, 3);
}

function GetEntityHelp(name, desc, id, cuscun, entityType) {
    page = "${pageContext.request.contextPath}/servlet/datapro.eibs.client.JSESD4000?SCREEN=105&RECTYP="+ entityType+"&CUSCUN=" + cuscun;
	fieldName = name;
	fieldDesc = desc;
	fieldId = id;	
	CenterWindow(page, 550, 450, 3);
}

function GetAddressList(nbr, addrln1, addrln2, addrln3, addrln4, cuscun) {
    page = "${pageContext.request.contextPath}/servlet/datapro.eibs.client.JSESD4000?SCREEN=105&RECTYP=1&CUSCUN=" + cuscun;
	fieldNbr = nbr;
	fieldAddrln1 = addrln1;
	fieldAddrln2 = addrln2;
	fieldAddrln3 = addrln3;
	fieldAddrln4 = addrln4;	
	CenterWindow(page, 450, 350, 3);
}

function GetTellTran(name) {
	page = "${pageContext.request.contextPath}/pages/s/EWD0029_teller_code_transac_helpmessage.jsp" ;
	fieldName = name;
	CenterWindow(page, 600, 400, 3);
}

function GetRateTablePizarra(name) {
	page = "${pageContext.request.contextPath}/servlet/datapro.eibs.helps.JSEWD0033";
	fieldName = name;
	CenterWindow(page, 430, 200, 3);
}

function GetBanksSuc(bank, suc) {
	page = "${pageContext.request.contextPath}/servlet/datapro.eibs.helps.JSEWD0702";
	fieldName = bank;
	fieldDesc = suc;
	CenterWindow(page, 600, 400, 3);
}

function GetOvernightTable(name, bnk) {
	page = "${pageContext.request.contextPath}/servlet/datapro.eibs.helps.JSEWD0045";
	fieldName = name;
	CenterWindow(page, 430, 200, 3);
}

function GetForExcFee(name) {
	page = "${pageContext.request.contextPath}/servlet/datapro.eibs.helps.JSEWD0111";
	fieldName = name;
	CenterWindow(page, 600, 100, 3);
}

function GetForExcPar(name) {
    page = "${pageContext.request.contextPath}/servlet/datapro.eibs.helps.JSEWD0112";
	fieldName = name;
	CenterWindow(page, 600, 100, 3);
}

function GetInsPar(name) {
	page = "${pageContext.request.contextPath}/servlet/datapro.eibs.helps.JSEWD0113";
	fieldName = name;
	CenterWindow(page, 600, 200, 3);
}

function GetOffChkPar(name) {
	page = "${pageContext.request.contextPath}/servlet/datapro.eibs.helps.JSEWD0115";
	fieldName = name;
	CenterWindow(page, 600, 250, 3);
}

function GetProductRates(name, app) {
	page = "${pageContext.request.contextPath}/servlet/datapro.eibs.helps.JSEWD0002P?App=" + app;
	fieldName = name;
	CenterWindow(page, 500, 230, 3);
}

function GetTypCHK(name, desc, prodtyp, ccy, ccy2, namccy) {
	if (ccy2 == null) {
		page = "${pageContext.request.contextPath}/servlet/datapro.eibs.helps.JSEWD0118?SCREEN=3&PRODTYP="+prodtyp+"&CCY="+ccy;
	} else {
		page = "${pageContext.request.contextPath}/servlet/datapro.eibs.helps.JSEWD0118?SCREEN=3&PRODTYP="+prodtyp+"&CCY="+ccy+"&CCY2="+ccy2;
	}
	fieldName = name;
	fieldDesc = desc;
	fieldAux1 = namccy;
	CenterWindow(page, 500, 250, 3);
}

function GetCheck(name, type, status,print) {
	page = "${pageContext.request.contextPath}/servlet/datapro.eibs.products.JSETL0510?SCREEN=1000&E01SELDTY="+type+"&E01SELSCH="+status;
	fieldName = name;
	if(print){
		page+="&H01FLGWK1="+print;
	}
	CenterWindow(page, 800, 500, 3);
}


function GetCheckAccount(check, account, type, status) {
	page = "${pageContext.request.contextPath}/servlet/datapro.eibs.products.JSETL0510?SCREEN=1000&E01SELDTY="+type+"&E01SELSCH="+status;
	fieldName = check;
	fieldAccount = account;
	CenterWindow(page, 640, 500, 3);
}

function GetCheckByAccount(name, account, type, status) {
	page = "${pageContext.request.contextPath}/servlet/datapro.eibs.products.JSETL0510?SCREEN=1000&E01SELACC="+account+"&E01SELDTY="+type+"&E01SELSCH="+status;
	fieldName = name;
	fieldAccount = "";
	CenterWindow(page, 640, 500, 3);
}

function GetBrokerI(name, desc) {
	page = "${pageContext.request.contextPath}/servlet/datapro.eibs.helps.JSEWD0306B";
	fieldName = name;
	fieldAux1 = desc;
	CenterWindow(page, 500, 230, 3);
}

function showPage(name) {
	var page = EIBS.pagesPrefix() + name;
	CenterWindow(page, 1000, 450, 2);
}

function showDedMaint() {
	showPage('EDL0150_ln_ded_det.jsp');
}

function showCollMaint(client) {
	showPage('EDL0150_ln_coll_det.jsp?client='+client);
}

function showPayMaint() {
	showPage('EDL0150_ln_pay_pln_det.jsp');
}

function showIrregPayMaint() {
	showPage('EDL0150_ln_pay_pln_irreg.jsp');
}

function showCDPayMaint() {
	page = "${pageContext.request.contextPath}/servlet/datapro.eibs.products.JSEXEDL0130?SCREEN=9";
	CenterWindow(page, 600, 500, 2);
}

function GetStatDesc(App, Desc, Dte, TC) {
	page = "${pageContext.request.contextPath}/pages/s/EWD0040_st_add_desc.jsp?AppCode=" + App + "&Desc=" + Desc + "&Dte=" + Dte + "&TC=" + TC;
	fieldName = name;
	CenterWindow(page, 500, 200, 3);
}

function showQuoteDetail(rowNum) {
	showPage("EDL0900_ln_crn_pay_det.jsp?Row=" + rowNum);
}

function showQuoteDetail2(rowNum) {
	showPage("EDL0900_ln_plan_de_pago_det.jsp?Row=" + rowNum);
}

function showQuoteDetailUF(rowNum) {
	showPage("EDL0900_ln_plan_de_pago_UF_det.jsp?Row=" + rowNum);
}
function showDocDesc() {
	page = "${pageContext.request.contextPath}/servlet/datapro.eibs.trade.JSELC0455?SCREEN=2";
	CenterWindow(page, 600, 500, 2);
}

function showDocDet(bank, branch, currency, amount, check) {
	page =  "${pageContext.request.contextPath}/servlet/datapro.eibs.products.JSETL0510?SCREEN=3&BNK=" + bank + "&BRN=" + branch + "&CCY=" + currency + "&AMT=" + amount + "&CHK=" + check;
	CenterWindow(page, 600, 500, 2);
}

function showChkDet(bank, branch, currency, amount, check) {
	page =  "${pageContext.request.contextPath}/servlet/datapro.eibs.products.JSETL0510?SCREEN=7&BNK=" + bank + "&BRN=" + branch + "&CCY=" + currency + "&AMT=" + amount + "&CHK=" + check;
	CenterWindow(page, 600, 500, 2);
}

function showChkCanDet(bank, branch, currency, amount, check) {
	page =  "${pageContext.request.contextPath}/servlet/datapro.eibs.products.JSETL0510?SCREEN=13&E02OFMBNK" + bank + "&E02OFMBRN=" + branch + "&E02OFMCCY=" + currency + "&E02OFMMCH=" + amount + "&E02OFMNCH=" + check;
	CenterWindow(page, 600, 500, 2);
}

function showDocDesC() {
	page = "${pageContext.request.contextPath}/servlet/datapro.eibs.trade.JSELC0455C?SCREEN=2";
	CenterWindow(page, 600, 500, 2);
}

function GetPortfolioNumDesc(port, cus, desc, cust) {
	if (trim(cust).length == 0) {
		alert("Please enter a valid Customer number.");
    } else {
		page = "${pageContext.request.contextPath}/servlet/datapro.eibs.helps.JSEWD0302?FromRecord=0&shrCust=" + cust;
		fieldName = port;
		fieldDesc = cus;
		fieldAux1 = desc;
		CenterWindow(page, 620, 400, 2);
	}
}

function showRetAccountInq(code) {
	page = "${pageContext.request.contextPath}/servlet/datapro.eibs.products.JSEDD0000I?SCREEN=1400&E01ACMACC=" + code;
	CenterWindow(page, 560, 500, 2);
}

function showRetAccountHolders(code) {
	page = "${pageContext.request.contextPath}/servlet/datapro.eibs.invest.JSEIE0010I?SCREEN=7&HOLDERS=" + code;
	CenterWindow(page, 560, 500, 2);
}

function showCustomerInq(code) {
	page = "${pageContext.request.contextPath}/servlet/datapro.eibs.client.JSESD0080?SCREEN=600&E01CUN=" + code;
	CenterWindow(page, 560, 500, 2);
}

function GetCommCustodyTable(name, type, cust, table) {
	page = "${pageContext.request.contextPath}/servlet/datapro.eibs.helps.JSEWD0312?FromRecord=0&shrCust=" + cust + "&shrType=" + type + "&shrTable=" + table;
	fieldName = name;
	CenterWindow(page, 530, 450, 1);
}

function showDetailsDebit(customer, debtyp, debsts) {
	page = "${pageContext.request.contextPath}/servlet/datapro.eibs.client.JSECIF200?SCREEN=500&E01CUSCUN=" + customer + "&DEBTYP=" + debtyp + "&DEBSTS=" + debsts;
	CenterWindow(page, 560, 500, 2);
}

function showInqApprovalRT(convm) {
	page = "${pageContext.request.contextPath}/servlet/datapro.eibs.misc.JSEDD1170?SCREEN=3&CONVM=" + convm;
	CenterWindow(page, 600, 500, 2);
}

function GetProfileTable(name, desc) {
    page = "${pageContext.request.contextPath}/servlet/datapro.eibs.helps.JSEWD0355";
	fieldName = name;
	fieldAux1 = desc;
	CenterWindow(page, 500, 230, 3);
}

function GetAmortID(name, bank, branch) {
    page = "${pageContext.request.contextPath}/servlet/datapro.eibs.helps.JSEWD0400?BNK=" + bank + "&BRN=" + branch;
	fieldName = name;
	CenterWindow(page, 700, 400, 2);
}

function GetAmortization(bnk, brn, ccy, gln, acc, acd) {
   page = "${pageContext.request.contextPath}/pages/s/EWD0405_amortization_help_container.jsp";
   bank = bnk;
   branch = brn;
   currency = ccy;
   glNumber = gln;
   account = acc;
   appCode = acd;
   CenterWindow(page, 600, 450, 1);
}

function showInqApprovalSwiftFree(user, ref) {
	page = "${pageContext.request.contextPath}/servlet/datapro.eibs.forex.JSESWF010?SCREEN=9&USERID=" + user +"&REFNUM=" + ref;
	CenterWindow(page, 560, 500, 2);
}

function GetSwiftIdDesc(name, desc, city, ctry) {
	var args = 2;
	if (null != city && city.lenght > 0) {
		fieldAux1 = city;
		args = 3;
	} else {
		fieldAux1 = null;
	}
	if (null != ctry && ctry.lenght > 0) {
		fieldAux2 = ctry;
		args = 4;
	} else {
		fieldAux2 = null;
	}
	page = "${pageContext.request.contextPath}/pages/s/EWD0130D_bankid_help_container.jsp?args=" + args;
	fieldName = name;
	fieldDesc = desc;
	PVia = "S";
	CenterWindow(page, 930, 500, 1);
}

function GetBanksAba(id, name, type) {
   	page = "${pageContext.request.contextPath}/pages/s/EWD0360_help_container.jsp"
	fieldName = id;
	fieldDesc = name;
	fieldAux1 = type;
	CenterWindow(page, 450, 300, 2);
}

function GetAll(id, name, desc, city, ctry, type) {
	page = "${pageContext.request.contextPath}/pages/s/EWD0130T_bankid_help_container.jsp";
	fieldName = id;
	fieldDesc = name;
	fieldAux1 = desc;
	fieldAux2 = city;
	fieldAux3 = ctry;
	PVia = type;
	CenterWindow(page, 930, 500, 1);
}

function GetSwiftAll(id, name, desc, city, ctry) {
	GetAll(id, name, desc, city, ctry, "S");
}

function GetAbaAll(id, name, desc, city, ctry) {
	GetAll(id, name, desc, city, ctry, "F");
}

function GetFedAll(id, name, desc, city, ctry) {
	GetAll(id, name, desc, city, ctry, "F");
}

function GetBeneficiary(customer, acc, bad1, bad2, bad3, bkid, bka1, bka2, bka3, bka4, ibid, iba1, iba2, iba3, iba4) {
	page = "${pageContext.request.contextPath}/servlet/datapro.eibs.helps.JSEWD0131?CUSTOMER=" + customer;
	fielName = customer;
	fieldAux1 = acc;
	fieldAux2 = bad1;
	fieldAux3 = bad2; 
	fieldAux4 = bad3;
	fieldAux5 = bkid;
	fieldAux6 = bka1;
	fieldAux7 = bka2;
	fieldAux8 = bka3;
	fieldAux9 = bka4;
	fieldAux10 = ibid;
	fieldAux11 = iba1;
	fieldAux12 = iba2;
	fieldAux13 = iba3;
	fieldAux14 = iba4;
	var widthsize = window.screen.availWidth - 25;
	CenterWindow(page, widthsize, 550, 2);
}

function DisabledRef(field1, field2, sel) {
	if (sel == "A") {
		GetSwiftIdDesc(field1, field2, null, null);
	}
}

function showAverageAndInquiryPages(op, account) {
	page =  "${pageContext.request.contextPath}/servlet/datapro.eibs.client.JSECIF170?SCREEN=4&opt=" + op + "&ACCNUM=" + account;
	CenterWindow(page, 600, 500, 2);
}

function showProdAcc2(offCode, typ, prod) {
	page = "${pageContext.request.contextPath}/servlet/datapro.eibs.client.JSECIF170?SCREEN=6&offCode=" + offCode + "&type=" + typ + "&prodType=" + prod ;
	CenterWindow(page, 600, 500, 2);
}

function GetCollDraft(name) {
	page = "${pageContext.request.contextPath}/pages/s/EWD0146_colldraft_help_container.jsp" ;
	fieldName = name;
	CenterWindow(page, 530, 450, 1);
}

function GetAccountAndProduct(name, product, bnk, app, sel) {
   page = "${pageContext.request.contextPath}/pages/s/EWD0005_client_help_container.jsp";
   fieldName = name;
   fieldProduct = product;
   AppCode = app;
   Bank = bnk;
   Selection = sel;
   CenterWindow(page, 800, 550, 1);
}

function GetProposalsProducts(name, typname, apcname, type , dsc) {
   	page = "${pageContext.request.contextPath}/servlet/datapro.eibs.helps.JSEDP0743?E01APCTYP=" + type;
	fieldName = name;
	fieldAux1 = typname;
	fieldAux2 = apcname;
	fieldDesc = dsc;
	CenterWindow(page, 600, 300, 2);
}

function CrtChk(name, loannbr, gln, seq, con) {
	page = "${pageContext.request.contextPath}/servlet/datapro.eibs.products.JSEOF0115?SCREEN=700&OPTION=1" + "&VAL=" + name + "&LNSACC=" + loannbr + "&SOURCE=FACT&GLNUMB=" + gln + "&SEQ=" + seq + "&CON=" + con;
	fieldName = name;
	CenterWindow(page, 1000, 900, 3);
}

function CrtCheck(name, loannbr) {
	page = "${pageContext.request.contextPath}/servlet/datapro.eibs.products.JSEOF0115?SCREEN=700&OPTION=Y" + "&VAL=" + name + "&LNSACC=" + loannbr;
	fieldName = name;
	CenterWindow(page, 1000, 900, 3);
}

function MntCheck(name, loannbr) {
	page = "${pageContext.request.contextPath}/servlet/datapro.eibs.products.JSEOF0115?SCREEN=1400&OPTION=Y" + "&CHK=" + name + "&LNSACC=" + loannbr;
	fieldName = name;
	CenterWindow(page, 1000, 900, 3);
}

function DelCheck(name, loannbr) {
	page = "${pageContext.request.contextPath}/servlet/datapro.eibs.products.JSEOF0115?SCREEN=1500&OPTION=Y" + "&CHK=" + name + "&LNSACC=" + loannbr;
	fieldName = name;
	CenterWindow(page, 1000, 900, 3);
}

function InqCheck(name,loannbr) {
	page = "${pageContext.request.contextPath}/servlet/datapro.eibs.products.JSEOF0115?SCREEN=1600&OPTION=Y" + "&CHK=" + name + "&LNSACC=" + loannbr;
	fieldName = name;
	CenterWindow(page, 1000, 900, 3);
}

function showInqColl(row) {
	page = "${pageContext.request.contextPath}/servlet/datapro.eibs.client.JSERA0011?SCREEN=4&opt=4&ROW=" + row;
	CenterWindow(page, 600, 500, 2);
}

function showInqPoliza(row) {
	page = "${pageContext.request.contextPath}/servlet/datapro.eibs.client.JSERA0011?SCREEN=6&opt=4&ROW=" + row;
	CenterWindow(page, 600, 500, 2);
}

function getClausula(type, screen, servlet) {
	var page = "${pageContext.request.contextPath}/servlet/datapro.eibs.products.JSEWP0010?TYPE=" + type + "&SCREEN=" + screen + "&SERVLET=" + servlet;
	CenterWindow(page, 500, 280, 3);
}

function GetCountryCodeOfac(name) {
    page = "${pageContext.request.contextPath}/servlet/datapro.eibs.helps.JSEWD0351";
	fieldName = name;
	CenterWindow(page, 500, 430, 3);
}

function GetDenialCodeOfac(name) {
    page = "${pageContext.request.contextPath}/servlet/datapro.eibs.helps.JSEWD0352";
	fieldName = name;
	CenterWindow(page, 500, 430, 3);
}

function GetInsuranceFormula(name) {
    page = "${pageContext.request.contextPath}/servlet/datapro.eibs.helps.JSEWD0370";
	fieldName = name;
	CenterWindow(page, 400, 300, 3);
}

function GetAchOperator(code, type, name, type1) {
	page = "${pageContext.request.contextPath}/servlet/datapro.eibs.ach.JSEWD0360?Type=" + type1;
	fieldName = code;
	fieldAux1 = type;
	fieldDesc = name;
	CenterWindow(page, 600, 450, 2);
}

function GetAchOriginador(code,type,name){
	fieldName=code;
	fieldAux1=type;
	fieldDesc=name;
	page =  "${pageContext.request.contextPath}/pages/s/EACH112_helpfile_Search.jsp";
	CenterWindow(page,600,450,2);
}

function GetExternalAccountACH(benename, beneaddress, benecsz, beneemail, routing, externalacc, type,customer)
{
	page= "${pageContext.request.contextPath}/servlet/datapro.eibs.ach.JSEWD0362?selNew=" + customer;
	fieldAux1=benename;
	fieldAux2=beneaddress;
	fieldAux3=benecsz;
	fieldAux4=beneemail;
	fieldAux5=routing;
	fieldAux6=externalacc;
	fieldAux7=type;

	CenterWindow(page,700,400,2);
}

function GetAchClass(code, name) {
	page = "${pageContext.request.contextPath}/servlet/datapro.eibs.ach.JSEWD0361";
	fieldName = code;
	fieldDesc = name;
	CenterWindow(page, 600, 450, 2);
}

function GetAchTransaction(code, name) {
	page = "${pageContext.request.contextPath}/servlet/datapro.eibs.ach.JSEWD0363";
	fieldName = code;
	fieldDesc = name;
	CenterWindow(page, 600, 450, 2);
}

function GetProductB(name, desc, app, bank) {
	page = "${pageContext.request.contextPath}/pages/s/EWD0008_client_help_container.jsp"
	fieldName = name;
	fieldAux1 = desc; 
	AppCode = app;
	ProductBank = bank;				
	CenterWindow(page, 600, 400, 1);
}

function showInqApprovalT(app, account, type, cus) {
	var formLength = document.forms[0].elements.length;
	for (n=0; n < formLength; n++) {
		var elementName = document.forms[0].elements[n].name;
	    var elementValue = document.forms[0].elements[n].value;
	    if (elementName == "ACCNUM" && elementValue == account)	{
	    	document.forms[0].elements[n].click();
	        break;
	    }
	}
	if ( app == '13' && type == '2') {
		page = "${pageContext.request.contextPath}/servlet/datapro.eibs.forex.JSEDL0108B?SCREEN=200&E02DEAACC=" + account + "&E02DEACUN=" + cus;
	} else {
		page = "${pageContext.request.contextPath}/servlet/datapro.eibs.forex.JSEDL0140T?SCREEN=3&ACCNUM=" + account + "&appCode=" + app + "&typeCode=" + type;
	}
	CenterWindow(page, 600, 500, 2);
}

function GetInstrumentParams(name, desc, currency, symbol, isin, cusip, product, rate, lcDate1, lcDate2, lcDate3, maDate1, maDate2, maDate3, aty) {
    page = "${pageContext.request.contextPath}/pages/s/EWD0308F_inst_help_container.jsp?INSTTYPE=" + product + "&ISINUM=" + isin;
	fieldName = name;
	fieldDesc = desc;
	fieldId = currency;
	fieldAux1 = symbol;
	fieldAux2 = isin;
	fieldDate1 = cusip;
	fieldDate2 = product;
	fieldAux3 = (rate == null) ? '' : rate;
	fieldAux4 = (lcDate1 == null) ? '' : lcDate1;
	fieldAux5 = (lcDate2 == null) ? '' : lcDate2;
	fieldAux6 = (lcDate3 == null) ? '' : lcDate3;
	fieldAux7 = (maDate1 == null) ? '' : maDate1;
	fieldAux8 = (maDate2 == null) ? '' : maDate2;
	fieldAux9 = (maDate3 == null) ? '' : maDate3;
	fieldAux10 = (aty == null) ? '' : aty;
	CenterWindow(page, 600, 400, 3);
}

function GetCodeCovenantForm(name) {
	page = "${pageContext.request.contextPath}/pages/s/EWD0205_covenant_form.jsp?firstCall=true";
	fieldName = name;
	CenterWindow(page, 600, 400, 1);
}

function GetCodeCovenantRequest(name, custnum) {
	page = "${pageContext.request.contextPath}/servlet/datapro.eibs.helps.JSEWD0200?CustNum=" + custnum;
	fieldName = name;
	CenterWindow(page, 500, 450, 3);
}

function GetCodeCollectDealRequest(name, custnum) {
	page = "${pageContext.request.contextPath}/servlet/datapro.eibs.helps.JSEWD0250?CustNum=" + custnum;
	fieldName = name;
	CenterWindow(page, 500, 450, 3);
}
function GetCustomerContactRequest(custnum,name,email,phone) {
	page = "${pageContext.request.contextPath}/servlet/datapro.eibs.helps.JSEWD0251?CustNum=" + custnum;
	fieldName = name;
	fieldAux1 = email;
	fieldAux2 = phone;
	CenterWindow(page, 500, 450, 3);
}
function GetCustomerGroupLevel(name, group, lvl) {
	page = "${pageContext.request.contextPath}/servlet/datapro.eibs.client.JSESD0092?SCREEN=600&Group=" + group + "&Level=" + lvl;
	fieldName = name;
	fieldAux1 = group;
	fieldAux2 = lvl;
	CenterWindow(page, 600, 450, 3);
}

function GetTellerRequest(name,desc,banco,oficina) {
	page = "${pageContext.request.contextPath}/servlet/datapro.eibs.helps.JSEWD0538?BNK="+banco+"&OFIC=" + oficina;
	fieldName = name;
	fieldDesc = desc;
	CenterWindow(page, 500, 450, 3);
}

function GetTablaSeguros(name, code, desc, fact, tblf) {
	page = "${pageContext.request.contextPath}/servlet/datapro.eibs.helps.JSEWD0215?Code=" + code;
	fieldName = name;
	fieldDesc = desc;
	fieldAux1 = fact;
	fieldAux2 = tblf;
	CenterWindow(page, 600, 270, 2);
}

function GetBankReconciliation(name,desc,aux1) {
	fieldName=name;
	fieldDesc=desc;
	fieldAux1=aux1;
	page = "${pageContext.request.contextPath}/servlet/datapro.eibs.helps.JSEWD0450";
	CenterWindow(page,600,270,2);
}

function GetSpecUsrTab(name, flag) {
	page = "${pageContext.request.contextPath}/pages/s/EWD0055_helpfile_USFL1.jsp?codeflag=" + flag;
	fieldName = name;
	CenterWindow(page, 450, 400, 1);
}

function showInqApprovalInstrument(account) {
	var formLength= document.forms[0].elements.length;
	for (n=0;n < formLength;n++) {
		var elementName = document.forms[0].elements[n].name;
	    var elementValue = document.forms[0].elements[n].value;
	    if (elementName == "ACCNUM" && elementValue == account) {
	    	document.forms[0].elements[n].click();
	        break;
	    }
	}
	page = "${pageContext.request.contextPath}/servlet/datapro.eibs.invest.JSEIE0050?SCREEN=1000&CODE=" + account;
	CenterWindow(page, 600, 500, 2);
}

function GetLoc(name) {
	page = "${pageContext.request.contextPath}/pages/s/EWD0021_client_help_helpmessage.jsp" ;
	fieldName = name;
	CenterWindow(page, 350, 170, 3);
}

function GetNomenclatura(name) {
	page = "${pageContext.request.contextPath}/pages/s/STATIC_address_nomenclatura_help_colombia.jsp" ;
	fieldName = name;
	CenterWindow(page, 600, 250, 2); 
}

function GetComplemento(name) {
	page = "${pageContext.request.contextPath}/pages/s/STATIC_address_complemento_help_colombia.jsp" ;
	fieldName = name;
	CenterWindow(page, 700, 150, 2);
}

function showInqSwift(fmt, ref, usr) {

	page =  "${pageContext.request.contextPath}/servlet/datapro.eibs.forex.JSESWF0200?SCREEN=3&FORMAT=" + fmt + "&REFERENCE=" + ref + "&USERID=" + usr;
	CenterWindow(page,600,500,2);

}

function showInqSwiftI(fmt, ref, usr) {

	page =  "${pageContext.request.contextPath}/servlet/datapro.eibs.forex.JSESWF0200I?SCREEN=3&FORMAT=" + fmt + "&REFERENCE=" + ref + "&USERID=" + usr;
	CenterWindow(page,600,700,2);

}

function GetPacks(name) {
	page = "${pageContext.request.contextPath}/servlet/datapro.eibs.helps.JSEWD0046";
	fieldName = name;
	CenterWindow(page, 430, 200, 3);
}

function GetCommDef(code, name,flag) {
	page = "${pageContext.request.contextPath}/servlet/datapro.eibs.helps.JSEWD0047?FLAG="+flag;
	fieldName = code;
	fieldDesc = name;
	CenterWindow(page, 600, 300, 3);
}

function GetCommDefEx(code, name,min,max,per) {
	page = "${pageContext.request.contextPath}/servlet/datapro.eibs.helps.JSEWD0047EX";
	fieldName = code;
	fieldDesc = name;
	fieldAux1 = min;
	fieldAux2 = max;
	fieldAux3 = per;	
	CenterWindow(page, 530, 300, 3);
}

function GetChannelDef(code, name) {
	page = "${pageContext.request.contextPath}/servlet/datapro.eibs.helps.JSEWD0048";
	fieldName = code;
	fieldDesc = name;
	CenterWindow(page, 430, 200, 3);
}

function GetScaleDef(code, name) {
	page = "${pageContext.request.contextPath}/servlet/datapro.eibs.helps.JSEWD0049";
	fieldName = code;
	fieldDesc = name;
	CenterWindow(page, 430, 200, 3);
}

function GetStmDef(name,flag,type) {
	page = "${pageContext.request.contextPath}/servlet/datapro.eibs.helps.JSEWD0051?TYPE="+type+"&FLAG="+flag;
	fieldName = name;
	CenterWindow(page, 400, 300, 2);
}

function GetInterfaz(code, name, file) {
	page = "${pageContext.request.contextPath}/servlet/datapro.eibs.interfaces.JSEWD9000";
	fieldName = code;
	fieldDesc = name;
	fieldAux = file;
	CenterWindow(page, 600, 450, 2);
}

function GetFieldMst(code, name, file) {
	page = "${pageContext.request.contextPath}/servlet/datapro.eibs.interfaces.JSEWD9010?file=" + file;
	fieldName = code;
	fieldDesc = name;
	CenterWindow(page, 600, 450, 2);
}

function GetTaxCode(code, name, bnk) {
	page = "${pageContext.request.contextPath}/servlet/datapro.eibs.taxes.JSEWD0595";
	fieldName = code;
	fieldDesc = name;
	fieldAux = bnk;
	CenterWindow(page, 600, 450, 2);
}

function GetPortfolioDescIdInvest(name, desc, id)
{
	page= "${pageContext.request.contextPath}/pages/s/EWD0001P_portf_desc_id_help_container.jsp";
	fieldName=name;
	fieldDesc=desc;
	fieldId=id;
	CenterWindow(page, 1000, 550, 1);
}

function GetReserva(name,bnk,app,sel,amt, cun) {
   Client = cun;
   page= "${pageContext.request.contextPath}/pages/s/EWD0037_client_help_container.jsp";
   fieldName = name;
   fieldDesc = "";
   fieldAux1 = "";
   fieldAux2 = "";
   fieldAux3 = "";
   fieldAux4 = "";
   fieldAux5 = amt;
   AppCode = app;
   Bank = bnk;
   Selection = sel;
   CenterWindow(page,850,500,1);
}

function showInqApprovalCport(customer, portfolio) {
	page = "${pageContext.request.contextPath}/servlet/datapro.eibs.client.JSESD0088?SCREEN=501&CUSTOMER=" + customer + "&PORTFOLIO=" + portfolio;
	CenterWindow(page,600,500,2);
}

function GetGeoNames(country, name, codes, descs, filters) {
	clearFields();
	fieldDesc = name;	
	fieldAux1 = codes[0];
	fieldAux2 = codes[1];
	fieldAux3 = codes[2];
	fieldAux4 = codes[3];
	fieldAux11 = descs[0];
	fieldAux12 = descs[1];
	fieldAux13 = descs[2];
	fieldAux14 = descs[3];

	page = "${pageContext.request.contextPath}/servlet/datapro.eibs.helps.JSEWD0610?SCREEN=1&EWDSELCTR="+country;
	for(var i = 0; i < filters.length; i++ ) {
	    if (isValidObject(filters[i])){
	    	if(i == 0){
	    		page=page+"&EWDSELFIP="+filters[i];
	    	} else {
	    		page=page+"&EWDSELDV"+i+"="+filters[i];
	    	}
	    }
	}
	scriptLog(page);
	CenterWindow(page, 720, 540, 3);
}

function GetGeoZIPCodes(country, zipcode, codes, descs, filters) {
	clearFields();
	fieldName = zipcode;
	fieldAux1 = codes[0];
	fieldAux2 = codes[1];
	fieldAux3 = codes[2];
	fieldAux4 = codes[3];
	fieldAux11 = descs[0];
	fieldAux12 = descs[1];
	fieldAux13 = descs[2];
	fieldAux14 = descs[3];

	page = "${pageContext.request.contextPath}/servlet/datapro.eibs.helps.JSEWD0620?SCREEN=1&EWDSELCTR="+country;
	for(var i = 0; i < filters.length; i++ ) {
	    if (isValidObject(filters[i])){
	    	if(i == 0){
	    		page=page+"&EWDSELFIP="+filters[i];
	    	} else {
	    		page=page+"&EWDSELDV"+i+"="+filters[i];
	    	}
	    }
	}
	scriptLog(page);
	CenterWindow(page, 720, 540, 3);		
}

function GetSEPOMEXData(postalCode, colony, town, city, state) {
	page = "${pageContext.request.contextPath}/servlet/datapro.eibs.helps.JSEWD0602?SCREEN=1";
	fieldName = postalCode;
	fieldAux1 = colony;
	fieldAux2 = town;
	fieldAux3 = city;
	fieldAux4 = state;
	CenterWindow(page, 700, 500, 3);
}

function GetCPortfolioNumDesc(port, cus, desc, cust) {
	page = "${pageContext.request.contextPath}/servlet/datapro.eibs.helps.JSEWD0300?SCREEN=11&FromRecord=0&Customer=" + cust ;
	fieldName = port;
	fieldDesc = cus;
	fieldAux1 = desc;
	CenterWindow(page, 620, 400, 2);
}

function GetCustomerDescIdNP(name, desc, id) {
	page = "${pageContext.request.contextPath}/pages/s/EWD0001_client_desc_id_help_NP_container.jsp";
	fieldName = name;
	fieldDesc = desc;
	fieldId = id;
	CenterWindow(page, 530, 530, 1);
}

function showErrors() {
	var page = "${pageContext.request.contextPath}/pages/s/error_viewer.jsp";
	if (errorwin != null) {
		errorwin.close();
	}
	addErrorMessages(EIBS.error.errorArray());
	errorwin = CenterNamedWindow(page, 'error', 600, 300, 2);
}


function checkClose() {
	if (window.name != "main") 
		top.close();
	else 
		window.location.href = "${pageContext.request.contextPath}/pages/background.jsp";
}


function enterReason(op) {
	option = op;
	var page = "${pageContext.request.contextPath}/pages/s/ESS0090_message_enter_text.jsp";
	CenterWindow(page, 500, 430, 3);
}


function showStatusReason(msg,cau,dscc, typ, mtv,dscm) {
	message = msg;
	motive = mtv;
	desmotive = dscm;
	causal = cau;
	descausal = dscc;
	var page = "";	
	
	message = message.replace(/\ /g,"_");
	desmotive = desmotive.replace(/\ /g,"_");
	descausal = descausal.replace(/\ /g,"_");
	
	
	if (typ == "credit"){
		page = "${pageContext.request.contextPath}/servlet/datapro.eibs.salesplatform.JSEPV0153DADC?SCREEN=350&MSG=" + message + "&MTV=" + motive +"&DSC=" +desmotive;
	}else{
		page = "${pageContext.request.contextPath}/servlet/datapro.eibs.products.JSEDL0135?SCREEN=450&MSG=" + message + "&MTV=" + motive +"&DSC=" +desmotive
							+ "&CAU=" + causal +"&DSCCAU=" + descausal;
	}
	CenterWindow(page, 500, 430, 3);
}


function showMsgViewer() {
	page = "${pageContext.request.contextPath}/pages/s/ESS0090_message_container.jsp";
	CenterWindow(page, 800, 480, 2);
}


function showWarnings(accnum, name) {
	clickElement(name, accnum);
	var page = "${pageContext.request.contextPath}/servlet/datapro.eibs.alerts.JSESD0000?ACCNUM=" + accnum;
	CenterNamedWindow(page, 'warnings', 520, 300, 2);
} 

function SayThis(s) {
	applet = document.applets.Speaker;
	s = "${pageContext.request.contextPath}/pages/s/media/" + s;
	if (isValidObject(applet))
		document.applets["Speaker"].SayThis(s);
}

function DatePicker(d1, d2, d3) {
	fieldDate1 = d1;
	fieldDate2 = d2;
	fieldDate3 = d3;
	fieldAux1 = true;
	page = "${pageContext.request.contextPath}/pages/s/STATIC_date_picker.jsp";
	CenterWindow(page, 270, 270, 5);
}

function DOBPicker(d1, d2, d3) {
    fieldDate1 = d1;
    fieldDate2 = d2;
    fieldDate3 = d3;
    fieldAux1 = false;
    page= "${pageContext.request.contextPath}/pages/s/STATIC_date_picker.jsp";
    CenterWindow(page, 270, 270, 5);
}

function GetCreditLineDeudor(name, type, custnum, relcust, relline) {
	page = "${pageContext.request.contextPath}/servlet/datapro.eibs.helps.JSEWD0015?CustNum=" + custnum + "&type=" + type + "&relCust=" + relcust + "&relLine=" + relline;
	fieldName = name;
	fieldAux1 = type;
	fieldAux2 = relcust;
	fieldAux3 = relline;
	CenterWindow(page, 630, 350, 3);
}

function showInqApprovalDespig(bank, account1,account2,type) {
	page = "${pageContext.request.contextPath}/servlet/datapro.eibs.client.JSERA0140?SCREEN=3&BNKNUM=" + bank + "&ACCNUMA=" + account1 + "&ACCNUMB=" + account2 + "&TYPE=" + type;
	CenterWindow(page,600,500,2);

}

function showCollateralList(collNum) {
	if(isNumeric(collNum)){
		if(collNum != "0"){
			var	page = "${pageContext.request.contextPath}/servlet/datapro.eibs.client.JSERA0000?SCREEN=8&COLLNUM=" + collNum;
			CenterWindow(page,800,800,2);
		}
	}
}

function showDetailMora(rowNum, account, mm, dd, yy) {
	page = "${pageContext.request.contextPath}/servlet/datapro.eibs.products.JSEDL0900?SCREEN=400&Row=" + rowNum + "&E05PMRACC=" + account + "&E05PMRPDM=" + mm + "&E05PMRPDD=" + dd + "&E05PMRPDY=" + yy;
	CenterWindow(page, 760, 380, 2);
}

function showDetailMoraUF(rowNum, account, mm, dd, yy) {
	page = "${pageContext.request.contextPath}/servlet/datapro.eibs.products.JSEDL0900?SCREEN=400&Row=" + rowNum + "&E05PMRACC=" + account + "&E05PMRPDM=" + mm + "&E05PMRPDD=" + dd + "&E05PMRPDY=" + yy + "&UF=Y";
	CenterWindow(page, 760, 380, 2);
}

function CsmShowInq(por, desc) {	
	page = "${pageContext.request.contextPath}/servlet/datapro.eibs.client.JSESD0088?SCREEN=401&E01PRFNUM=" + por + "&E01PRFDSC" + desc;
	clickElement("E01PRFNUM", por);
	CenterWindow(page, 1000, 600, 2);
}

function GetAccountCustomerEmbargos(name, filter, valname , valcust) {
	   page = "${pageContext.request.contextPath}/servlet/datapro.eibs.helps.JSEWD0085?shrAppCode=" + filter + "&FromRecord=0" + "&shrClient=" + valcust;
	   fieldName = name;	   
	   AppCode = filter;	   
	   Selection = valname;
	   fieldDesc = valcust;
	   CenterWindow(page, 1000, 550, 1);
}

function GetCodReferenceCollectDeal(custnum,convnum,cod,desc) {
	page = "${pageContext.request.contextPath}/servlet/datapro.eibs.helps.JSEWD0252?CustNum=" + custnum+"&ConvNum=" + convnum;
	fieldName = cod;
	fieldAux1 = desc;
	CenterWindow(page, 500, 450, 3);
}

function GetCrsCno(tbl, cod, dsc, crs) {
	page = "${pageContext.request.contextPath}/servlet/datapro.eibs.helps.JSEWD0054?tbl=" + tbl;
	fieldName = cod;
	fieldDesc = dsc;
	fieldAux = crs;
	CenterWindow(page, 600, 450, 2);
}

function GetNUDDet(acc, nud) {
	page = "${pageContext.request.contextPath}/servlet/datapro.eibs.cleaning.JSEDD0939?SCREEN=220&E02CJKACC="+acc+"&E02CJKNUD="+nud;
	CenterWindow(page, 1200, 550, 2);
}