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

/* Help Menu Global Variables */
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
var transferACH = 30;
var commDef = 32;
var staticCoFactHelp = 33;
var staticCoTypHelp = 34;
var staticCsmPerHelp = 35;
var staticCsmTypHelp = 36;
var staticCsmTxHelp = 37;

var inqAccount = 100;
var inqGL = 105;

/*
 * lnreferHelp change help to accountCustomerHelp. Accomplished at help level,
 * to lessen the amount of jsps modified.
 */
lnreferHelp = accountCustomerHelp;

function getHelp() {
	switch (optHelp) {
	case 0:
		GetAccountCustomer(fieldName, fieldBank, fieldOPCode, '', fieldAux4);
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
		GetConcept(fieldName, fieldBank, fieldOPCode, fieldAux1, fieldAux2,
				fieldAux4, fieldAux5, fieldCCY, fieldAux6);
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
		GetTablaSeguros(fieldName, fieldBank, fieldOPCode, fieldAux1, fieldAux2, fieldAux2);
		break;
	case 29:
		GetOffChkPar(fieldName);
		break;
	case 30:
		GetAchTransaction(fieldName, fieldDesc);
		break;
	case 31:
		GetCodeDescRefCNOFC(fieldName, fieldAux1, fieldAux2, fieldOPCode);
		break;
	case 32:
		GetCommDef(fieldName, fieldBank, fieldAux1);
		break;
	case 33:
		GetCode(fieldName, 'STATIC_interface_factor.jsp');
		break;
	case 34:
		GetCode(fieldName, 'STATIC_interface_tipo.jsp');
		break;
	case 35:
		GetCode(fieldName, 'STATIC_commissions_period_cash_management.jsp');
		break;
	case 36:
		GetCode(fieldName, 'STATIC_commissions_type_cash_management.jsp');
		break;
	case 37:
		GetCode(fieldName, 'STATIC_commissions_tax_cash_management.jsp');
		break;

	case 100:
		showInqAcc(fieldName);
		break;
	case 105:
		consultGL(fieldName, fieldBank, fieldOPCode);
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

function init(opt, name, bank, ccy, fieldname1, fieldname2, opcode, fieldname3,
		fieldname4, fieldname5) {
	optHelp = opt;
	fieldName = name;
	fieldBank = bank;
	fieldCCY = ccy;
	// fieldAux3 = ccy;
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
	page = EIBS.goURL("GetCodeDesc", page);
	fieldName = name;
	fieldDesc = desc;
	CenterWindow(page, 600, 450, 1);
}

function GetVendor(name) {
	page = EIBS.goURL("GetVendor");
	fieldName = name;
	CenterWindow(page, 500, 500, 1);
}

function GetVendor(name, codeflag) {
	page = EIBS.goURL("GetVendor2", codeflag);
	fieldName = name;
	CenterWindow(page, 500, 500, 1);
}

function GetCostCenter(name, bank) {
	fieldName = name;
	page = EIBS.goURL("GetCostCenter", bank);
	CenterWindow(page, 400, 280, 3);
}

function GetLedger(name, bnk, ccy, apc, desc, prodType) {
	page = EIBS.goURL("GetLedger");
	fieldName = name;
	fieldDesc = desc;
	AppCode = apc;
	Bank = bnk;
	Currency = ccy;
	AccType = isValidObject(prodType) ? prodType : "";
	CenterWindow(page, 800, 600, 1);
}

function GetLedgerExtras(name, bnk, ccy, apc, desc, prodType, ccyback, desccy,
		bnkback) {
	page = EIBS.goURL("GetLedgerExtras");
	fieldName = name;
	fieldDesc = desc;
	AppCode = apc;
	Bank = bnk;
	Currency = ccy;
	AccType = isValidObject(prodType) ? prodType : "";
	// extras
	fieldAux5 = ccyback;
	fieldAux6 = desccy;
	fieldAux7 = bnkback;
	CenterWindow(page, 600, 550, 1);
}

function GetCNTRLPRF(name, amt, type, customer, tamount, currency) {
	page = EIBS.goURL("GetCNTRLPRF", type, customer, tamount, currency);
	fieldName = name;
	fieldDesc = amt;
	CenterWindow(page, 430, 200, 3);
}

function GetTariffLC(name, searcher, EWDCUN) {
	fieldName = name;
	page = EIBS.goURL("GetTariffLC", searcher, EWDCUN);
	CenterWindow(page, 600, 150, 3);
}

function GetAccByClient(name, bnk, app, sel, cus, ccy) {
	page = EIBS.goURL("GetAccount");
	fieldName = name;
	AppCode = app;
	Bank = bnk;
	Selection = sel;
	Customer = cus;
	fieldAux2 = ccy;
	CenterWindow(page, 1000, 450, 1);
}

function GetCustomerDescId(name, desc, id, tid) {
	page = EIBS.goURL("GetCustomerDescId");
	fieldName = name;
	fieldDesc = desc;
	fieldId = id;
	fieldAux1 = tid;
	CenterWindow(page, 1000, 550, 1);
}

function GetGblCustDescId(name, desc, id) {
	page = EIBS.goURL("GetGblCustDescId");
	fieldName = name;
	fieldDesc = desc;
	fieldId = id;
	CenterWindow(page, 800, 530, 1);
}

function GetAccount(name, bnk, app, sel) {
	page = EIBS.goURL("GetAccount");
	fieldName = name;
	fieldDesc = "";
	fieldAux1 = "";
	fieldAux2 = "";
	fieldAux3 = "";
	fieldAux4 = "";
	Customer = null;
	AppCode = app;
	Bank = bnk;
	Selection = sel;
	CenterWindow(page, 1000, 550, 1);
}

function GetOldAccount(bnk, brn, ccy, aty, cun, oac, acc) {
	page = EIBS.goURL("GetOldAccount");
	Bank = bnk;
	Branch = brn;
	Currency = ccy;
	PrdType = aty;
	OldAcc = oac;
	NewAcc = acc, Custumer = cun;
	CenterWindow(page, 1000, 550, 1);
}

function GetCodeCNOFC(name, flag) {
	page = EIBS.goURL("GetCodeCNOFC", flag);
	fieldName = name;
	CenterWindow(page, 600, 400, 1);
}

function GetCodeAuxCNOFC(name, flag, codeaux) {
	page = EIBS.goURL("GetCodeAuxCNOFC", flag, codeaux);
	fieldName = name;
	CenterWindow(page, 600, 400, 1);
}

function GetCodeDescCNOFC(name, desc, flag) {
	page = EIBS.goURL("GetCodeDescCNOFC", flag);
	fieldName = name;
	fieldDesc = desc;
	CenterWindow(page, 600, 400, 1);
}

function GetCodeDescAuxCNOFC(name, desc, flag, aux) {
	page = EIBS.goURL("GetCodeDescAuxCNOFC", flag, aux);
	fieldName = name;
	fieldDesc = desc;
	CenterWindow(page, 600, 400, 1);
}

function GetCodeDescRefCNOFC(name, desc, aux2, flag) {
	page = EIBS.goURL("GetCodeDescRefCNOFC", flag);
	fieldName = name;
	fieldDesc = desc;
	fieldAux2 = aux2;
	CenterWindow(page, 600, 400, 1);
}

function GetCNOFCFilteredCodes(name, desc, filter1, flag) {
	var filter = filter1;
	page = EIBS.goURL("GetCNOFCFilteredCodes", filter, flag);
	fieldName = name;
	fieldDesc = desc;
	CenterWindow(page, 600, 400, 1);
}

function GetIdTypesCNOFC(code, typeF, idF) {
	page = EIBS.goURL("GetIdTypesCNOFC", code);
	fieldName = typeF;
	fieldDesc = idF;
	CenterWindow(page, 600, 400, 1);
}

function GetParroquiaCodes(name, desc, filter1, filter2, flag) {
	var filter = filter1.trim() != "" ? filter1 : filter2;
	page = EIBS.goURL("GetParroquiaCodes", filter, flag);
	fieldName = name;
	fieldDesc = desc;
	CenterWindow(page, 600, 400, 1);
}

function Get2FilterCodes(name, desc, flag, filter1, filter2) {
	var f1 = isValidObject(filter1) ? filter1 : "";
	var f2 = isValidObject(filter2) ? filter2 : "";
	page = EIBS.goURL("Get2FilterCodes", flag, f1, f2);
	fieldName = name;
	fieldDesc = desc;
	CenterWindow(page, 600, 400, 1);
}

function GetAccountHolders(name) {
	page = EIBS.goURL("GetAccountHolders");
	fieldName = name;
	CenterWindow(page, 600, 400, 1);
}

function GetCurrency(name, bank) {
	fieldName = name;
	page = EIBS.goURL("GetCurrency", bank);
	CenterWindow(page, 500, 250, 2);
}

function GetUserRegistry(code, name, pattern) {
	page = EIBS.goURL("GetUserRegistry", pattern);
	fieldName = code;
	fieldAux1 = name;
	CenterWindow(page, 500, 450, 3);
}

function GetGroupId(code, name) {
	page = EIBS.goURL("GetGroupId");
	fieldName = code;
	fieldAux1 = isValidObject(name) ? name : "";
	CenterWindow(page, 500, 450, 3);
}

function GetUser(code, name, usr) {
	if (typeof usr !== 'undefined' && usr.trim() != "") {
		page = EIBS.goURL("GetUser", usr);
	} else {
		page = EIBS.goURL("GetUser2", usr);
	}
	fieldName = code;
	fieldAux1 = name;
	fieldAux2 = usr;
	CenterWindow(page, 500, 450, 3);
}

function GetBranch(name, bank, desc) {
	page = EIBS.goURL("GetBranch", bank);
	fieldName = name;
	fieldDesc = desc;
	CenterWindow(page, 600, 270, 2);
}

function GetApplicationCode(code, desc) {
	page = EIBS.goURL("GetApplicationCode");
	fieldName = code;
	fieldDesc = desc;
	CenterWindow(page, 600, 300, 3);
}

function GetCondicionesCode(code) {
	page = EIBS.goURL("GetCondicionesCode");
	fieldName = code;
	CenterWindow(page, 400, 280, 3);
}

function GetReferenceCode(code) {
	page = EIBS.goURL("GetReferenceCode");
	fieldName = code;
	CenterWindow(page, 500, 450, 3);
}

function GetCNOFTables(code, desc) {
	page = EIBS.goURL("GetReferenceCode");
	fieldName = code;
	fieldDesc = desc;
	CenterWindow(page, 500, 450, 3);
}

function GetConcept(name, bank, app, desc, ledger, mode, type, currency,
		prdCode, ccyField) {
	page = EIBS.goURL("GetConcept", app, bank, mode, prdCode, currency);
	fieldName = name;
	fieldAux1 = desc;
	fieldAux2 = ledger;
	fieldAux3 = type;
	fieldCCY = ccyField;
	CenterWindow(page, 600, 230, 3);
}

function GetCasualTable(name, desc) {
	page = EIBS.goURL("GetCasualTable");
	fieldName = name;
	fieldDesc = desc;
	CenterWindow(page, 600, 400, 3);
}

function GetLNReference(name, bnk, app, sel, client) {
	GetAccByClient(name, bnk, app, sel, client);
}

function GetAccountCustomer(name, bnk, app, sel, cust) {
	page = EIBS.goURL("GetAccount");
	fieldName = name;
	AppCode = app;
	Bank = bnk;
	Selection = sel;
	fieldDesc = cust;
	CenterWindow(page, 1000, 550, 1);
}

function GetAccountInfo(name, bnk, app, sel, id, cust, ccy, type, prod) {
	page = EIBS.goURL("GetAccount");
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

function GetAccountInfoExtras(name, bnk, app, sel, id, cust, ccy, type, prod,
		brn, desbrn, desccy, bnkback) {
	page = EIBS.goURL("GetAccountInfoExtras");
	fieldName = name;
	fieldDesc = cust;
	fieldAux1 = id;
	fieldAux2 = ccy;
	fieldAux3 = type;
	fieldAux4 = prod;
	AppCode = app;
	Bank = bnk;
	Selection = sel;
	// extras
	fieldAux5 = brn;
	fieldAux6 = desbrn;
	fieldAux7 = desccy;
	fieldAux8 = bnkback;
	CenterWindow(page, 800, 550, 1);
}

function GetWireOpening(name, amount) {
	page = EIBS.goURL("GetWireOpening");
	fieldName = name;
	fieldAux1 = amount;
	CenterWindow(page, 500, 230, 3);
}

function GetBeneficiaryId(name) {
	page = EIBS.goURL("GetBeneficiaryId");
	fieldName = name;
	fieldAux1 = 'none';
	CenterWindow(page, 530, 450, 2);
}

function GetProduct(name, app, bank, desc, type) {
	page = EIBS.goURL("GetProduct");
	fieldName = name;
	fieldAux1 = desc;
	fieldAux2 = type;
	AppCode = app;
	ProductBank = bank;
	CenterWindow(page, 800, 400, 1);
}

function showCDRates(ccy, tb) {
	page = EIBS.goURL("showCDRates", ccy, tb);
	fieldName = name;
	CenterWindow(page, 560, 500, 2);
}

function showCOLServCharge(bnk, typ, tb) {
	page = EIBS.goURL("showCOLServCharge", bnk, typ, tb);
	fieldName = name;
	CenterWindow(page, 600, 500, 2);
}

function showLNServCharge(bnk, typ, tb) {
	page = EIBS.goURL("showLNServCharge", bnk, typ, tb);
	fieldName = name;
	CenterWindow(page, 600, 500, 2);
}

function showLCServCharge(bnk, typ, tb) {
	page = EIBS.goURL("showLCServCharge", bnk, typ, tb);
	fieldName = name;
	CenterWindow(page, 600, 500, 2);
}

function showDDAServCharge(bnk, typ, tb) {
	page = EIBS.goURL("showLCServCharge", bnk, typ, tb);
	fieldName = name;
	CenterWindow(page, 560, 500, 2);
}

function GetDocInv(name) {
	page = EIBS.goURL("GetDocInv");
	fieldName = name;
	CenterWindow(page, 500, 350, 2);
}

function GetTariffColl(name, searcher, cun) {
	page = EIBS.goURL("GetTariffColl", searcher, cun);
	fieldName = name;
	CenterWindow(page, 600, 350, 3);
}

function GetRetCod(name, searcher) {
	page = EIBS.goURL("GetRetCod", searcher);
	fieldName = name;
	CenterWindow(page, 600, 350, 3);
}

function GetTypCHKBook(name, hideF1, hideF2, desc, prodtyp, ccy) {
	page = EIBS.goURL("GetTypCHKBook", prodtyp, ccy);
	fieldName = name;
	fieldAux1 = hideF1;
	fieldAux2 = hideF2;
	fieldDesc = desc;
	CenterWindow(page, 500, 250, 3);
}

function GetBroker(name, desc, type) {
	page = EIBS.goURL("GetBroker");
	fieldName = name;
	fieldDesc = desc;
	fieldAux1 = type;
	CenterWindow(page, 700, 300, 1);
}

function GetTypeBroker(name, type) {
	page = EIBS.goURL("GetBroker");
	fieldName = name;
	fieldAux1 = type;
	CenterWindow(page, 900, 400, 1);
}

function GetOfficialCheck(name, desc, type, ccy, sel) {
	page = EIBS.goURL("GetOfficialCheck");
	fieldName = name;
	fieldDesc = desc;
	fieldAux1 = type;
	Currency = ccy;
	Selection = sel;
	CenterWindow(page, 900, 540, 1);
}

function GetLoanTable(name, searcher) {
	page = EIBS.goURL("GetLoanTable", searcher);
	fieldName = name;
	CenterWindow(page, 600, 350, 3);
}

function GetLoanTablePDI(name, searcher) {
	page = EIBS.goURL("GetLoanTablePDI", searcher);
	fieldName = name;
	CenterWindow(page, 600, 350, 3);
}

function GetLoanChargeTable(name, searcher) {
	page = EIBS.goURL("GetLoanChargeTable", searcher);
	fieldName = name;
	CenterWindow(page, 600, 350, 3);
}

function GetPrevTable(name) {
	page = EIBS.goURL("GetPrevTable");
	fieldName = name;
	CenterWindow(page, 600, 240, 3);
}

function GetRateTable(name, code) {
	page = EIBS.goURL("GetRateTable", code);
	fieldName = name;
	CenterWindow(page, 430, 200, 3);
}

function GetTablaFactores(name, code) {
	page = EIBS.goURL("GetTablaFactores", code);
	fieldName = name;
	CenterWindow(page, 500, 200, 1);
}

function GetFloating(name, type, dsc, primaryrte, secondaryrte, bseTyp) {
	page = EIBS.goURL("GetFloating");
	fieldName = name;
	fieldType = type;
	fieldDscr = dsc;
	fieldPrrte = primaryrte;
	fieldSrrte = secondaryrte;
	fieldBsty = bseTyp;
	CenterWindow(page, 600, 275, 3);
}

function GetLimit(name, bank, code) {
	page = EIBS.goURL("GetLimit", bank, code);
	fieldName = name;
	CenterWindow(page, 600, 400, 2);
}

function GetDescATMCard(name, desc) {
	page = EIBS.goURL("GetDescATMCard");
	fieldName = name;
	fieldDesc = desc;
	CenterWindow(page, 400, 300, 1);
}

function GetCodeTChannel(name, desc, aux1) {
	page = EIBS.goURL("GetCodeTChannel");
	fieldName = name;
	fieldDesc = desc;
	fieldAux1 = aux1;
	CenterWindow(page, 450, 300, 2);
}

function GetCodeTransaction(name, desc, aux1) {
	page = EIBS.goURL("GetCodeTransaction");
	fieldName = name;
	fieldDesc = desc;
	fieldAux1 = aux1;
	CenterWindow(page, 450, 300, 2);
}

function GetFeRef(name, typ, prd, desc) {
	page = EIBS.goURL("GetFeRef");
	fieldName = name;
	fieldAux1 = typ;
	fieldAux2 = prd;
	fieldAux3 = desc;
	CenterWindow(page, 700, 300, 3);
}

function GetFeRefNew(name, typ, prd) {
	page = EIBS.goURL("GetFeRef");
	fieldName = name;
	fieldAux1 = typ;
	fieldAux2 = prd;
	CenterWindow(page, 700, 300, 3);
}

function GetUserTeller(code, name, pattern) {
	page = EIBS.goURL("GetUserTeller", pattern);
	fieldName = code;
	fieldAux1 = name;
	CenterWindow(page, 500, 450, 3);
}

function GetTellerParameters(flag, code, name) {
	page = EIBS.goURL("GetTellerParameters", flag);
	fieldName = code;
	fieldAux1 = name;
	CenterWindow(page, 500, 450, 3);
}

function GetTellerShifts(code, name, bank, branch) {
	page = EIBS.goURL("GetTellerShifts", bank, branch);
	fieldName = code;
	fieldAux1 = name;
	CenterWindow(page, 500, 450, 3);
}

function GetCloneTransfer(name) {
	page = EIBS.goURL("GetCloneTransfer");
	fieldName = name;
	CenterWindow(page, 600, 350, 3);
}

function GetComission(ref) {
	page = EIBS.goURL("GetComission", ref);
	CenterWindow(page, 400, 280, 1);
}

function GetPlastic(num) {
	page = EIBS.goURL("GetPlastic");
	fieldName = num;
	CenterWindow(page, 600, 300, 2);
}

function GetCodeCreditCard(name, flag) {
	page = EIBS.goURL("GetCodeCreditCard", flag);
	fieldName = name;
	CenterWindow(page, 600, 300, 1);
}

function GetPlastic2(num, type, codeflag) {
	page = EIBS.goURL("GetPlastic2", type, codeflag);
	fieldName = num;
	CenterWindow(page, 600, 300, 2);
}

function GetTableFeeCod(name, searcher) {
	page = EIBS.goURL("GetTableFeeCod", searcher);
	fieldName = name;
	CenterWindow(page, 600, 100, 3);
}
function GetPlastic3(num, type, branch, user, codeflag) {
	page = EIBS.goURL("GetPlastic3", type, branch, user, codeflag);
	fieldName = num;
	CenterWindow(page, 600, 300, 2);
}

// *******************************************************************************************
// ESTA AYUDA TRAE EL NRO DE LA TARJETA DEBITO Y ACTUALIZA EN LA PANTALLA QUE LO
// ESTA LLAMANDO
// LOS CAMPOS NRO DE TARJETA FECHA DE EXPEDICION Y FECHA DE EXPIRACION

var monthEx; // Mes Expiracion
var yearEx; // Anio Expiracion
var dayEm; // Day Emision
var monthEm; // Mes Emision
var yearEm; // Anio Emision

function GetPlastic4(num, mEx, yEx, dEm, mEm, yEm, type, branch, user, codeflag) {
	page = EIBS.goURL("GetPlastic4", type, branch, user, codeflag);
	fieldName = num;
	monthEx = mEx;
	yearEx = yEx;
	dayEm = dEm;
	monthEm = mEm;
	yearEm = yEm;
	CenterWindow(page, 600, 300, 2);
}
// **********************************************************************************************

function GetPlasticStatus(num, desc) {
	page = EIBS.goURL("GetPlasticStatus");
	fieldName = num;
	fieldDesc = desc;
	CenterWindow(page, 600, 300, 2);
}

function GetTransactionType(num, desc) {
	page = EIBS.goURL("GetTransactionType");
	fieldName = num;
	fieldDesc = desc;
	CenterWindow(page, 600, 300, 2);
}

function GetCommissionType(num, desc) {
	page = EIBS.goURL("GetCommissionType");
	fieldName = num;
	fieldDesc = desc;
	CenterWindow(page, 600, 300, 2);
}

function GetPaymentPeriod(num, desc) {
	page = EIBS.goURL("GetPaymentPeriod");
	fieldName = num;
	fieldDesc = desc;
	CenterWindow(page, 600, 300, 2);
}

function GetCodeService(srv, srn, cia) {
	page = EIBS.goURL("GetCodeService", cia);
	fieldName = srv;
	fieldAux1 = srn;
	CenterWindow(page, 500, 350, 2);
}

function GetSequence(seq, cia, srv) {
	page = EIBS.goURL("GetSequence", cia, srv);
	fieldName = seq;
	CenterWindow(page, 500, 350, 2);
}

function NewShortCust(cusnum, cusname, cusidn) {
	page = EIBS.goURL("NewShortCust");
	fieldName = cusnum;
	fieldDesc = cusname;
	fieldId = cusidn;
	CenterWindow(page, 600, 150, 2);
}

function NewUpdateShortCust(name, desc, cusnum, cusidn) {
	page = EIBS.goURL("NewUpdateShortCust", cusnum, cusidn);
	fieldName = name;
	fieldDesc = desc;
	CenterWindow(page, 600, 500, 2);
}

function getCodeAcpt(name, cod) {
	page = EIBS.goURL("getCodeAcpt");
	fieldName = name;
	fieldAux1 = cod;
	CenterWindow(page, 600, 400, 2);
}

function showTRImg(cod) {
	page = EIBS.goURL("showTRImg", cod);
	CenterWindow(page, 600, 400, 2);
}

function showLCInq(cusnum) {
	page = EIBS.goURL("showLCInq", cusnum);
	CenterWindow(page, 600, 500, 2);
}

function showTransfer(wtnum) {
	page = EIBS.goURL("showTransfer", wtnum);
	CenterWindow(page, 600, 500, 2);
}

function checksStatus(chk) {
	page = EIBS.goURL("checksStatus", chk);
	CenterWindow(page, 600, 500, 2);
}

function showDeductionDetail(code, type, account) {
	page = EIBS.goURL("showDeductionDetail", code, type, account);
	CenterWindow(page, 600, 450, 2);
}

function showInqApproval(app, account, type) {
	page = EIBS.goURL("showInqApproval", account, app, type);
	clickElement("ACCNUM", account);
	CenterWindow(page, 1100, 600, 2);
}

function showInqApprovalCredito(app, account, type) {
	page = EIBS.goURL("showInqApprovalCredito", account, app, type);
	clickElement("ACCNUM", account);
	CenterWindow(page, 1000, 600, 2);
}

function showInqApprovalDDA(app, account, type) {
	page = EIBS.goURL("showInqApprovalDDA", account, app, type);
	clickElement("ACCNUM", account);
	CenterWindow(page, 1000, 600, 2);
}

function showInqApprovalCL(app, account) {
	page = EIBS.goURL("showInqApprovalCL", account, app);
	clickElement("ACCNUM", account);
	CenterWindow(page, 1000, 600, 2);
}

function showInqApprovalPC(account, type) {
	page = EIBS.goURL("showInqApprovalPC", account);
	CenterWindow(page, 1000, 600, 2);
}

function showInqApprovalClient(cun, ope) {
	page = EIBS.goURL("showInqApprovalClient", cun, ope);
	clickElement("E01CUN", cun);
	CenterWindow(page, 1000, 600, 2);
}

function showInqApprovalColl(app, account) {
	page = EIBS.goURL("showInqApprovalColl", account, app);
	clickElement("REFNUM", account);
	CenterWindow(page, 1000, 600, 2);
}

function showInqApprovalForex(app, account, type) {
	page = EIBS.goURL("showInqApprovalForex", account, type);
	clickElement("ACCNUM", account);
	CenterWindow(page, 1000, 600, 2);
}

function showInqApprovalCards(app, account, type, card) {
	page = EIBS.goURL("showInqApprovalCards", account, app, type, card);
	clickElement("ACCNUM", account);
	CenterWindow(page, 1000, 600, 2);
}

function showInqApprovalCC(app, account, type) {
	page = EIBS.goURL("showInqApprovalCC", account, app, type);
	clickElement("ACCNUM", account);
	CenterWindow(page, 1000, 600, 2);
}

function GetCardAccounts() {
	try {
		var card = document.forms[0].CARD.value;
		window.location.href = EIBS.goURL("GetCardAccounts", card);
	} catch (e) {
		window.location.href = EIBS.goURL("GetCardAccounts2");
	}
}

function GetCardAccountsInq() {
	try {
		var card = document.forms[0].CARD.value;
		window.location.href = EIBS.goURL("GetCardAccountsInq", card);
	} catch (e) {
		window.location.href = EIBS.goURL("GetCardAccountsInq2");
	}
}

function showInqAcc(account) {
	page = EIBS.goURL("showInqAcc", account);

	if (typeof account != 'undefined ' && isNumeric(account) && account > 0)
		CenterWindow(page, 600, 500, 2);
}

function showInqCollateral(account) {
	page = EIBS.goURL("showInqCollateral", account);
	CenterWindow(page, 600, 500, 2);
}

function goGaBasic() {
	var client = "";
	var ref = getElementChecked("REFNUM");
	if ((typeof ref !== 'undefined') && (ref.value !== "")) {
		page = EIBS.goURL("goGaBasic", ref.value, client);
		CenterWindow(page, 600, 500, 2);
	}
}

function showProdAcc(app, flg, typ, cde) {
	flg = "";
	page = EIBS.goURL("showProdAcc", app, flg, typ, cde);
	CenterWindow(page, 600, 500, 2);
}

function showServices(customer) {
	page = EIBS.goURL("showServices", customer);
	CenterWindow(page, 530, 530, 2);
}

function showOffChkApproval(account, currency, purpose) {
	page = EIBS.goURL("showOffChkApproval", account, currency, purpose);
	CenterWindow(page, 800, 500, 2);
}

function getOffClass(name, page) {
	page = EIBS.pagesPrefix() + page;
	fieldName = name;
	CenterWindow(page, 320, 300, 2);
}

function showAccGrp(app, flg, grp) {
	page = EIBS.goURL("showAccGrp", app, flg, grp);
	CenterWindow(page, 600, 500, 2);
}

function showAcc(app, flg) {
	page = EIBS.goURL("showAcc", app, flg);
	CenterWindow(page, 600, 500, 2);
}

function showAcc2(app, flg, ofc) {
	page = EIBS.goURL("showAcc2", app, flg, ofc);
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

function GetCodeDescDeal(name, desc, flg1) {
	page = EIBS.goURL("GetCodeDescDeal");
	fieldName = name;
	fieldDesc = desc;
	fieldAux1 = flg1;
	CenterWindow(page, 500, 300, 3);
}

function GetConvenio(code, desc, cus, flg1) {
	fieldName = code;
	fieldDesc = desc;
	fieldAux1 = flg1;
	page = EIBS.goURL("GetConvenio", cus);
	CenterWindow(page, 500, 300, 3);
}

function GetFechaPlan(dateM, dateD, dateY) {
	fieldAux1 = dateM;
	fieldAux2 = dateD;
	fieldAux3 = dateY;
	page = EIBS.goURL("GetFechaPlan");
	CenterWindow(page, 500, 500, 3);
}

function GetPagadurias(pag, con, dsc) {
	fieldName = pag;
	fieldDesc = dsc;
	page = EIBS.goURL("GetPagadurias", con);
	CenterWindow(page, 400, 280, 3);
}

function GetFomento(code, bank, product, dsc, cun, nme, prd, ftb, fty, bnk,
		brn, obk, obr, ocy, ogl, prddsc, floatType, floatDesc) {
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

	fieldBANK = bank;
	fieldPROD = product;
	page = EIBS.goURL("GetFomento", bank, product);
	CenterWindow(page, 600, 280, 3);
}

function GetCobranza(code, dsc) {
	fieldCode = code;
	fieldDesc = dsc;
	page = EIBS.goURL("GetCobranza");
	CenterWindow(page, 600, 280, 3);
}

function GetCustomer(name) {
	GetCustomerDescId(name, ' ', ' ');
}

function GetCustomerDetails(cus, name, id, type, countrycode, add2, add3, add4,
		city, state, country, pob, zip, citizen, prof, gender, marital, phone) {
	page = EIBS.goURL("GetCustomerDetails");
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

function GetCustomerDetails2(cus, nme, idn, idt, idc, ctr, ste, rgn, mun, cty,
		par, pob, urb, str, hom, flr, apt, ref, zip, ctz, prf, gnd, mst, phn,
		tpp, cip, nm1, nm2, ap1, ap2, gec, dst, mnc, dct, add, iad) {
	page = EIBS.goURL("GetCustomerDetails2");
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
	page = EIBS.goURL("GetCustomerDetails3");
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

function GetCustomerDetailsLC(cust, name, add2, add3, add4, state, zip,
		country, type) {
	page = EIBS.goURL("GetCustomerDetailsLC");
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
	page = EIBS.goURL("GetDepositType");
	fieldName = name;
	fieldDesc = desc;
	CenterWindow(page, 500, 500, 1);
}

function GetLocations(name, desc) {
	page = EIBS.goURL("GetLocations");
	fieldName = name;
	fieldDesc = desc;
	CenterWindow(page, 500, 500, 2);
}

function GetDepositNumber(name, type, loc, client) {
	page = EIBS.goURL("GetDepositNumber");
	fieldName = name;
	fieldAux1 = type;
	fieldAux2 = loc;
	fieldAux3 = client;
	CenterWindow(page, 500, 500, 1);
}

function GetAvailableSafeDeposits(name, desc, type, typeDsc, location, locDsc,
		serial, numKeys) {
	page = EIBS.goURL("GetAvailableSafeDeposits");
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
	page = EIBS.goURL("GetInternetVendor", codeflag);
	fieldName = name;
	CenterWindow(page, 500, 500, 1);
}

function GetFeeTable(name) {
	page = EIBS.goURL("GetFeeTable");
	fieldName = name;
	CenterWindow(page, 500, 500, 1);
}

function GetOfficer(name) {
	page = EIBS.goURL("GetOfficer");
	fieldName = name;
	CenterWindow(page, 500, 500, 1);
}

function getOficial(cod, branch) {
	if (branch == "")
		branch = "999";
	page = EIBS.goURL("getOficial", branch);
	fieldCod = cod;
	CenterWindow(page, 500, 350, 2);
}

function GetCustomerDescId2(name, desc, id) {
	page = EIBS.goURL("GetCustomerDescId2");
	fieldName = name;
	fieldDesc = desc;
	fieldId = id;
	fieldAux1 = "";
	CenterWindow(page, 530, 560, 1);
}

function GetCorrespondentDescId(name, desc, id) {
	page = EIBS.goURL("GetCorrespondentDescId");
	fieldName = name;
	fieldDesc = desc;
	fieldId = id;
	fieldAux1 = "";
	CenterWindow(page, 530, 530, 1);
}

function GetCorrespondentDescIdSwift(name, desc, id) {
	page = EIBS.goURL("GetCorrespondentDescIdSwift");
	fieldName = name;
	fieldDesc = desc;
	fieldId = id;
	fieldAux1 = "";
	CenterWindow(page, 530, 530, 1);
}

function GetCustomerCorp(name, desc, id) {
	page = EIBS.goURL("GetCustomerCorp");
	fieldName = name;
	fieldDesc = desc;
	fieldId = id;
	fieldAux1 = "1";
	CenterWindow(page, 530, 530, 1);
}

function GetAcceptantId(name) {
	page = EIBS.goURL("GetAcceptantId");
	fieldName = name;
	fieldAux1 = 'none';
	CenterWindow(page, 530, 450, 1);
}

function GetAcceptantIdNDA(name, ndaname) {
	page = EIBS.goURL("GetAcceptantId");
	fieldName = name;
	fieldAux1 = ndaname;
	CenterWindow(page, 530, 450, 1);
}
function GetAcceptantAddr(name, ndaname, cust, rut, rua, man, type) {

	page = EIBS.goURL("GetAcceptantAddr", type, cust, rut, rua, man);
	fieldName = name;
	fieldAux1 = ndaname;
	fieldAux2 = cust;
	fieldAux3 = rut;
	fieldAux4 = rua;
	fieldAux5 = man;
	CenterWindow(page, 630, 450, 1);
}
function GetProductFamily(name, app, desc) {
	page = EIBS.goURL("GetProductFamily");
	fieldName = name;
	AppCode = app;
	fieldAux1 = desc;
	CenterWindow(page, 800, 400, 1);
}

function GetProductModule(name) {
	page = EIBS.goURL("GetProductModule");
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
			document.forms[0].elements[n - 1].value = "";
			document.forms[0].elements[n - 3].value = "";
		}
		Bank = "";
		GetAccount(fieldName, Bank, AppCode, Selection);
	}
}

function GetCurrencyDesc(name, desc, bank) {
	page = EIBS.goURL("GetCurrencyDesc", bank);
	fieldName = name;
	fieldDesc = desc;
	CenterWindow(page, 500, 250, 2);

}

function GetInstCurrency(name, bank, inst) {
	page = EIBS.goURL("GetInstCurrency", bank, inst);
	fieldName = name;
	CenterWindow(page, 500, 350, 2);
}

function GetCheckForeignExc(sub, name, lot, ini, fin, bal, chk, bank, branch,
		type, user) {
	page = EIBS.goURL("GetCheckForeignExc", bank, branch, type, user);
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
	page = EIBS.goURL("GetValuePaper", bank, branch, type, sub);
	fieldLot = lot;
	fieldBal = bal;
	fieldIni = ini;
	fieldFin = fin;
	CenterWindow(page, 500, 350, 2);
}

function GetAdhesivos(lot, bal, ini, fin, bank, branch, type, sub, balA, iniA,
		finA) {
	page = EIBS.goURL("GetAdhesivos", bank, branch, type, sub);
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
	page = EIBS.goURL("GetBatchDet", date1, date2, date3, batch, acr);
	CenterWindow(page, 1200, 550, 2);
}

function GetBudget(name, bank, currency) {
	page = EIBS.goURL("GetBudget");
	fieldName = name;
	BankNumber = bank;
	Currency = currency;
	CenterWindow(page, 800, 300, 1);
}

function GetSwiftId(name) {
	page = EIBS.goURL("GetSwiftId");
	fieldName = name;
	PVia = "S";
	CenterWindow(page, 830, 450, 1);
}

function GetFedId(name) {
	page = EIBS.goURL("GetSwiftId");
	fieldName = name;
	PVia = "F";
	CenterWindow(page, 830, 450, 1);
}

function GetPortfolioNum(name, type) {
	page = EIBS.goURL("GetPortfolioNum");
	fieldName = name;
	fieldId = type;
	CenterWindow(page, 530, 450, 1);
}

function GetDocument(name, account, id, status) {
	page = EIBS.goURL("GetDocument", account, id, status);
	fieldName = name;
	CenterWindow(page, 600, 450, 1);
}

function GetCreditLine(name, custnum) {
	page = EIBS.goURL("GetCreditLine", custnum);
	fieldName = name;
	CenterWindow(page, 630, 190, 3);
}

function GetCreditLineGBL(name, custnum) {
	page = EIBS.goURL("GetCreditLineGBL", custnum);
	fieldName = name;
	CenterWindow(page, 630, 190, 3);
}

function GetSubAcc(name, account) {
	page = EIBS.goURL("GetSubAcc", account);
	fieldName = name;
	CenterWindow(page, 500, 100, 1);
}

function GetAct(name, desc) {
	page = EIBS.goURL("GetAct");
	fieldName = name;
	fieldDesc = desc;
	CenterWindow(page, 500, 500, 2);
}

function GetMailing(name, custnum, type) {
	page = EIBS.goURL("GetMailing", custnum, type);
	fieldName = name;
	CenterWindow(page, 450, 350, 3);
}

function GetAddressList(nbr, addrln1, addrln2, addrln3, addrln4, cuscun) {
	page = EIBS.goURL("GetAddressList", cuscun);
	fieldNbr = nbr;
	fieldAddrln1 = addrln1;
	fieldAddrln2 = addrln2;
	fieldAddrln3 = addrln3;
	fieldAddrln4 = addrln4;
	CenterWindow(page, 450, 350, 3);
}

function GetTellTran(name) {
	page = EIBS.goURL("GetTellTran");
	fieldName = name;
	CenterWindow(page, 600, 400, 3);
}

function GetRateTablePizarra(name) {
	page = EIBS.goURL("GetRateTablePizarra");
	fieldName = name;
	CenterWindow(page, 430, 200, 3);
}

function GetBanksSuc(bank, suc) {
	page = EIBS.goURL("GetBanksSuc");
	fieldName = bank;
	fieldDesc = suc;
	CenterWindow(page, 600, 400, 3);
}

function GetOvernightTable(name, bnk) {
	page = EIBS.goURL("GetOvernightTable");
	fieldName = name;
	CenterWindow(page, 430, 200, 3);
}

function GetForExcFee(name) {
	page = EIBS.goURL("GetForExcFee");
	fieldName = name;
	CenterWindow(page, 600, 100, 3);
}

function GetForExcPar(name) {
	page = EIBS.goURL("GetForExcPar");
	fieldName = name;
	CenterWindow(page, 600, 100, 3);
}

function GetInsPar(name) {
	page = EIBS.goURL("GetInsPar");
	fieldName = name;
	CenterWindow(page, 600, 200, 3);
}

function GetOffChkPar(name, codMotivo) {
	page = EIBS.goURL("GetOffChkPar");
	fieldName = name;
	if (typeof codMotivo !== 'undefined')
		fieldDesc = codMotivo;
	CenterWindow(page, 600, 250, 3);
}

function GetProductRates(name, app) {
	page = EIBS.goURL("GetProductRates", app);
	fieldName = name;
	CenterWindow(page, 500, 230, 3);
}

function GetTypCHK(name, desc, prodtyp, ccy, ccy2, namccy) {
	if (ccy2 == null) {
		page = EIBS.goURL("GetTypCHK", prodtyp, ccy);
	} else {
		page = EIBS.goURL("GetTypCHK2", prodtyp, ccy, ccy2);
	}
	fieldName = name;
	fieldDesc = desc;
	fieldAux1 = namccy;
	CenterWindow(page, 500, 250, 3);
}

function GetCheck(name, type, status, print) {
	page = EIBS.goURL("GetCheck", type, status);
	fieldName = name;
	if (print) {
		page = EIBS.goURL("GetCheck2", type, status, print);
	}
	CenterWindow(page, 800, 500, 3);
}

function GetCheckAccount(check, account, type, status) {
	page = EIBS.goURL("GetCheckAccount", type, status);
	fieldName = check;
	fieldAccount = account;
	CenterWindow(page, 640, 500, 3);
}

function GetCheckByAccount(name, account, type, status) {
	page = EIBS.goURL("GetCheckByAccount", account, type, status);
	fieldName = name;
	fieldAccount = "";
	CenterWindow(page, 640, 500, 3);
}

function GetBrokerI(name, desc) {
	page = EIBS.goURL("GetBrokerI");
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
	showPage('EDL0150_ln_coll_det.jsp?client=' + client);
}

function showPayMaint() {
	showPage('EDL0150_ln_pay_pln_det.jsp');
}

function showIrregPayMaint() {
	showPage('EDL0150_ln_pay_pln_irreg.jsp');
}

function showCDPayMaint() {
	page = EIBS.goURL("showCDPayMaint");
	CenterWindow(page, 600, 500, 2);
}

function showCDPayInq() {
	page = EIBS.goURL("showCDPayInq");
	CenterWindow(page, 600, 500, 2);
}

function GetStatDesc(App, Desc, Dte, TC) {
	page = EIBS.goURL("GetStatDesc", App, Desc, Dte, TC);
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
	page = EIBS.goURL("showDocDesc");
	CenterWindow(page, 600, 500, 2);
}

function showDocDet(bank, branch, currency, amount, check) {
	page = EIBS.goURL("showDocDet", bank, branch, currency, amount, check);
	CenterWindow(page, 600, 500, 2);
}

function showChkDet(bank, branch, currency, amount, check) {
	page = EIBS.goURL("showChkDet", bank, branch, currency, amount, check);
	CenterWindow(page, 600, 500, 2);
}

function showChkCanDet(bank, branch, currency, amount, check) {
	page = EIBS.goURL("showChkCanDet", bank, branch, currency, amount, check);
	CenterWindow(page, 600, 500, 2);
}

function showDocDesC() {
	page = EIBS.goURL("showDocDesC");
	CenterWindow(page, 600, 500, 2);
}

function GetPortfolioNumDesc(port, cus, desc, cust) {
	if (trim(cust).length == 0) {
		alert("Please enter a valid Customer number.");
	} else {
		page = EIBS.goURL("GetPortfolioNumDesc", cust);
		fieldName = port;
		fieldDesc = cus;
		fieldAux1 = desc;
		CenterWindow(page, 620, 400, 2);
	}
}

function showRetAccountInq(code) {
	page = EIBS.goURL("showRetAccountInq", code);
	CenterWindow(page, 560, 500, 2);
}

function showRetAccountHolders(code) {
	page = EIBS.goURL("showRetAccountHolders", code);
	CenterWindow(page, 560, 500, 2);
}

function showCustomerInq(code) {
	page = EIBS.goURL("showCustomerInq", code);
	CenterWindow(page, 560, 500, 2);
}

function GetCommCustodyTable(name, type, cust, table) {
	page = EIBS.goURL("GetCommCustodyTable", cust, type, table);
	fieldName = name;
	CenterWindow(page, 530, 450, 1);
}

function showDetailsDebit(customer, debtyp, debsts) {
	page = EIBS.goURL("showDetailsDebit", customer, debtyp, debsts);
	CenterWindow(page, 560, 500, 2);
}

function showInqApprovalRT(convm) {
	page = EIBS.goURL("showInqApprovalRT", convm);
	CenterWindow(page, 600, 500, 2);
}

function GetProfileTable(name, desc) {
	page = EIBS.goURL("GetProfileTable");
	fieldName = name;
	fieldAux1 = desc;
	CenterWindow(page, 500, 230, 3);
}

function GetAmortID(name, bank, branch) {
	page = EIBS.goURL("GetAmortID", bank, branch);
	fieldName = name;
	CenterWindow(page, 700, 400, 2);
}

function GetAmortization(bnk, brn, ccy, gln, acc, acd) {
	page = EIBS.goURL("GetAmortization");
	bank = bnk;
	branch = brn;
	currency = ccy;
	glNumber = gln;
	account = acc;
	appCode = acd;
	CenterWindow(page, 600, 450, 1);
}

function showInqApprovalSwiftFree(user, ref) {
	page = EIBS.goURL("showInqApprovalSwiftFree", user, ref);
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
	page = EIBS.goURL("GetSwiftIdDesc", args);
	fieldName = name;
	fieldDesc = desc;
	PVia = "S";
	CenterWindow(page, 930, 500, 1);
}

function GetBanksAba(id, name, type) {
	page = EIBS.goURL("GetBanksAba");
	fieldName = id;
	fieldDesc = name;
	fieldAux1 = type;
	CenterWindow(page, 450, 300, 2);
}

function GetAll(id, name, desc, city, ctry, type) {
	page = EIBS.goURL("GetAll");
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

function GetBeneficiary(customer, acc, bad1, bad2, bad3, bkid, bka1, bka2,
		bka3, bka4, ibid, iba1, iba2, iba3, iba4) {
	page = EIBS.goURL("GetBeneficiary", customer);
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
	page = EIBS.goURL("showAverageAndInquiryPages", op, account);
	CenterWindow(page, 600, 500, 2);
}

function showProdAcc2(offCode, typ, prod) {
	page = EIBS.goURL("showProdAcc2", offCode, typ, prod);
	CenterWindow(page, 600, 500, 2);
}

function GetCollDraft(name) {
	page = EIBS.goURL("GetCollDraft");
	fieldName = name;
	CenterWindow(page, 530, 450, 1);
}

function GetAccountAndProduct(name, product, bnk, app, sel) {
	page = EIBS.goURL("GetAccountAndProduct");
	fieldName = name;
	fieldProduct = product;
	AppCode = app;
	Bank = bnk;
	Selection = sel;
	CenterWindow(page, 800, 550, 1);
}

function GetProposalsProducts(name, typname, apcname, type, dsc, filter) {
	page = EIBS.goURL("GetProposalsProducts", type, filter);
	fieldName = name;
	fieldAux1 = typname;
	fieldAux2 = apcname;
	fieldDesc = dsc;
	CenterWindow(page, 600, 300, 2);
}

function CrtChk(name, loannbr, gln, seq, con) {
	page = EIBS.goURL("CrtChk", name, loanbr, gln, seq, con);
	fieldName = name;
	CenterWindow(page, 1000, 900, 3);
}

function CrtCheck(name, loannbr) {
	page = EIBS.goURL("CrtCheck", name, loanbr);
	fieldName = name;
	CenterWindow(page, 1000, 900, 3);
}

function MntCheck(name, loannbr) {
	page = EIBS.goURL("MntCheck", name, loanbr);
	fieldName = name;
	CenterWindow(page, 1000, 900, 3);
}

function DelCheck(name, loannbr) {
	page = EIBS.goURL("DelCheck", name, loanbr);
	fieldName = name;
	CenterWindow(page, 1000, 900, 3);
}

function InqCheck(name, loannbr) {
	page = EIBS.goURL("InqCheck", name, loanbr);
	fieldName = name;
	CenterWindow(page, 1000, 900, 3);
}

function showInqColl(row) {
	page = EIBS.goURL("showInqColl", row);
	CenterWindow(page, 600, 500, 2);
}

function showInqPoliza(row) {
	page = EIBS.goURL("showInqPoliza", row);
	CenterWindow(page, 600, 500, 2);
}

function getClausula(type, screen, servlet) {
	page = EIBS.goURL("getClausula", type, screen, servlet);
	CenterWindow(page, 500, 280, 3);
}

function GetCountryCodeOfac(name) {
	page = EIBS.goURL("GetCountryCodeOfac");
	fieldName = name;
	CenterWindow(page, 500, 430, 3);
}

function GetDenialCodeOfac(name) {
	page = EIBS.goURL("GetDenialCodeOfac");
	fieldName = name;
	CenterWindow(page, 500, 430, 3);
}

function GetInsuranceFormula(name) {
	page = EIBS.goURL("GetInsuranceFormula");
	fieldName = name;
	CenterWindow(page, 400, 300, 3);
}

function GetAchOperator(code, type, name, type1) {
	page = EIBS.goURL("GetAchOperator", type1);
	fieldName = code;
	fieldAux1 = type;
	fieldDesc = name;
	CenterWindow(page, 600, 450, 2);
}

function GetAchOriginador(code, type, name) {
	fieldName = code;
	fieldAux1 = type;
	fieldDesc = name;
	page = EIBS.goURL("GetAchOriginador");
	CenterWindow(page, 600, 450, 2);
}

function GetExternalAccountACH(benename, beneaddress, benecsz, beneemail,
		routing, externalacc, type, customer) {
	page = EIBS.goURL("GetExternalAccountACH", customer);
	fieldAux1 = benename;
	fieldAux2 = beneaddress;
	fieldAux3 = benecsz;
	fieldAux4 = beneemail;
	fieldAux5 = routing;
	fieldAux6 = externalacc;
	fieldAux7 = type;

	CenterWindow(page, 700, 400, 2);
}

function GetAchClass(code, name) {
	page = EIBS.goURL("GetAchClass");
	fieldName = code;
	fieldDesc = name;
	CenterWindow(page, 600, 450, 2);
}

function GetAchTransaction(code, name) {
	page = EIBS.goURL("GetAchTransaction");
	fieldName = code;
	fieldDesc = name;
	CenterWindow(page, 600, 450, 2);
}

function GetProductB(name, desc, app, bank) {
	page = EIBS.goURL("GetProductB");
	fieldName = name;
	fieldAux1 = desc;
	AppCode = app;
	ProductBank = bank;
	CenterWindow(page, 600, 400, 1);
}

function showInqApprovalT(app, account, type, cus) {
	var formLength = document.forms[0].elements.length;
	for (n = 0; n < formLength; n++) {
		var elementName = document.forms[0].elements[n].name;
		var elementValue = document.forms[0].elements[n].value;
		if (elementName == "ACCNUM" && elementValue == account) {
			document.forms[0].elements[n].click();
			break;
		}
	}
	if (app == '13' && type == '2') {
		page = EIBS.goURL("showInqApprovalT", account, cus);
	} else {
		page = EIBS.goURL("showInqApprovalT2", account, app, type);
	}
	CenterWindow(page, 600, 500, 2);
}

function GetInstrumentParams(name, desc, currency, symbol, isin, cusip,
		product, rate, lcDate1, lcDate2, lcDate3, maDate1, maDate2, maDate3,
		aty) {
	page = EIBS.goURL("GetInstrumentParams", product, isin);
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
	page = EIBS.goURL("GetCodeCovenantForm");
	fieldName = name;
	CenterWindow(page, 600, 400, 1);
}

function GetCodeCovenantRequest(name, custnum) {
	page = EIBS.goURL("GetCodeCovenantRequest", custnum);
	fieldName = name;
	CenterWindow(page, 500, 450, 3);
}

function GetCodeCollectDealRequest(name, custnum) {
	page = EIBS.goURL("GetCodeCollectDealRequest", custnum);
	fieldName = name;
	CenterWindow(page, 500, 450, 3);
}
function GetCustomerContactRequest(custnum, name, email, phone) {
	page = EIBS.goURL("GetCustomerContactRequest", custnum);
	fieldName = name;
	fieldAux1 = email;
	fieldAux2 = phone;
	CenterWindow(page, 500, 450, 3);
}
function GetCustomerGroupLevel(name, group, lvl) {
	page = EIBS.goURL("GetCustomerGroupLevel", group, lvl);
	fieldName = name;
	fieldAux1 = group;
	fieldAux2 = lvl;
	CenterWindow(page, 600, 450, 3);
}

function GetTellerRequest(name, desc, banco, oficina) {
	page = EIBS.goURL("GetTellerRequest", banco, oficina);
	fieldName = name;
	fieldDesc = desc;
	CenterWindow(page, 500, 450, 3);
}

function GetTablaSeguros(name, code, desc, fact, tblf, pbse) {
	page = EIBS.goURL("GetTablaSeguros", code);
	fieldName = name;
	fieldDesc = desc;
	fieldAux1 = fact;
	fieldAux2 = tblf;
	fieldAux3 = pbse;
	CenterWindow(page, 600, 270, 2);
}

function GetBankReconciliation(name, desc, aux1) {
	fieldName = name;
	fieldDesc = desc;
	fieldAux1 = aux1;
	page = EIBS.goURL("GetBankReconciliation");
	CenterWindow(page, 600, 270, 2);
}

function GetSpecUsrTab(name, flag) {
	page = EIBS.goURL("GetSpecUsrTab", flag);
	fieldName = name;
	CenterWindow(page, 450, 400, 1);
}

function showInqApprovalInstrument(account) {
	var formLength = document.forms[0].elements.length;
	for (n = 0; n < formLength; n++) {
		var elementName = document.forms[0].elements[n].name;
		var elementValue = document.forms[0].elements[n].value;
		if (elementName == "ACCNUM" && elementValue == account) {
			document.forms[0].elements[n].click();
			break;
		}
	}
	page = EIBS.goURL("showInqApprovalInstrument", account);
	CenterWindow(page, 600, 500, 2);
}

function GetLoc(name) {
	page = EIBS.goURL("GetLoc");
	fieldName = name;
	CenterWindow(page, 350, 170, 3);
}

function GetNomenclatura(name) {
	page = EIBS.goURL("GetNomenclatura");
	fieldName = name;
	CenterWindow(page, 600, 250, 2);
}

function GetComplemento(name) {
	page = EIBS.goURL("GetComplemento");
	fieldName = name;
	CenterWindow(page, 700, 150, 2);
}

function showInqSwift(fmt, ref, usr) {
	page = EIBS.goURL("showInqSwift", fmt, ref, usr);
	CenterWindow(page, 600, 500, 2);

}

function showInqSwiftI(fmt, ref, usr) {
	page = EIBS.goURL("showInqSwiftI", fmt, ref, usr);
	CenterWindow(page, 600, 700, 2);

}

function GetPacks(name) {
	page = EIBS.goURL("GetPacks");
	fieldName = name;
	CenterWindow(page, 430, 200, 3);
}

function GetCommDef(code, name, flag) {
	page = EIBS.goURL("GetCommDef", flag);
	fieldName = code;
	fieldDesc = name;
	CenterWindow(page, 600, 300, 3);
}

function GetCommDefEx(code, name, min, max, per) {
	page = EIBS.goURL("GetCommDefEx");
	fieldName = code;
	fieldDesc = name;
	fieldAux1 = min;
	fieldAux2 = max;
	fieldAux3 = per;
	CenterWindow(page, 530, 300, 3);
}

function GetChannelDef(code, name) {
	page = EIBS.goURL("GetChannelDef");
	fieldName = code;
	fieldDesc = name;
	CenterWindow(page, 430, 200, 3);
}

function GetScaleDef(code, name) {
	page = EIBS.goURL("GetScaleDef");
	fieldName = code;
	fieldDesc = name;
	CenterWindow(page, 430, 200, 3);
}

function GetStmDef(name, flag, type) {
	page = EIBS.goURL("GetStmDef", type, flag);
	fieldName = name;
	CenterWindow(page, 400, 300, 2);
}

function GetInterfaz(code, name, file) {
	page = EIBS.goURL("GetInterfaz");
	fieldName = code;
	fieldDesc = name;
	fieldAux = file;
	CenterWindow(page, 600, 450, 2);
}

function GetFieldMst(code, name, file) {
	page = EIBS.goURL("GetFieldMst", file);
	fieldName = code;
	fieldDesc = name;
	CenterWindow(page, 600, 450, 2);
}

function GetTaxCode(code, name, bnk) {
	page = EIBS.goURL("GetTaxCode");
	fieldName = code;
	fieldDesc = name;
	fieldAux = bnk;
	CenterWindow(page, 600, 450, 2);
}

function GetTaxCode2(code, name, bnk) {
	page = EIBS.goURL("GetTaxCode2");
	fieldName = code;
	fieldDesc = name;
	fieldAux = bnk;
	CenterWindow(page, 600, 450, 2);
}

function GetPortfolioDescIdInvest(name, desc, id) {
	page = EIBS.goURL("GetPortfolioDescIdInvest");
	fieldName = name;
	fieldDesc = desc;
	fieldId = id;
	CenterWindow(page, 1000, 550, 1);
}

function GetReserva(name, bnk, app, sel, amt, cun) {
	Client = cun;
	page = EIBS.goURL("GetReserva");
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
	CenterWindow(page, 850, 500, 1);
}

function showInqApprovalCport(customer, portfolio) {
	page = EIBS.goURL("showInqApprovalCport", customer, portfolio);
	CenterWindow(page, 600, 500, 2);
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
	page = EIBS.goURL("GetGeoNames", country);

	if (isValidObject(filters)) {
		for (var i = 0; i < filters.length; i++) {
			if (isValidObject(filters[i])) {
				if (i == 0) {
					page = page + "&EWDSELFIP=" + filters[i];
				} else {
					page = page + "&EWDSELDV" + i + "=" + filters[i];
				}
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
	page = EIBS.goURL("GetGeoZIPCodes", country);
	if (isValidObject(filters)) {
		for (var i = 0; i < filters.length; i++) {
			if (isValidObject(filters[i])) {
				if (i == 0) {
					page = page + "&EWDSELFIP=" + filters[i];
				} else {
					page = page + "&EWDSELDV" + i + "=" + filters[i];
				}
			}
		}
	}
	scriptLog(page);
	CenterWindow(page, 720, 540, 3);
}

function GetSEPOMEXData(postalCode, colony, town, city, state) {
	page = EIBS.goURL("GetSEPOMEXData");
	fieldName = postalCode;
	fieldAux1 = colony;
	fieldAux2 = town;
	fieldAux3 = city;
	fieldAux4 = state;
	CenterWindow(page, 700, 500, 3);
}

function GetCPortfolioNumDesc(port, cus, desc, cust) {
	page = EIBS.goURL("GetCPortfolioNumDesc", cust);
	fieldName = port;
	fieldDesc = cus;
	fieldAux1 = desc;
	CenterWindow(page, 620, 400, 2);
}

function GetCustomerDescIdNP(name, desc, id) {
	page = EIBS.goURL("GetCustomerDescIdNP");
	fieldName = name;
	fieldDesc = desc;
	fieldId = id;
	CenterWindow(page, 530, 530, 1);
}

function showErrors() {
	page = getNSValue("error", "page");
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
		window.location.href = EIBS.goURL("GetBackground");
}

function enterReason(op) {
	option = op;
	var page = EIBS.goURL("enterReason");
	CenterWindow(page, 500, 430, 3);
}

function showStatusReason(msg, cau, dscc, typ, mtv, dscm) {
	message = msg;
	motive = mtv;
	desmotive = dscm;
	causal = cau;
	descausal = dscc;
	var page = "";

	message = message.replace(/\ /g, "_");
	desmotive = desmotive.replace(/\ /g, "_");
	descausal = descausal.replace(/\ /g, "_");

	if (typ == "credit") {
		page = EIBS.goURL("showStatusReason", message, motive, desmotive);
	} else {
		page = EIBS.goURL("showStatusReason2", message, motive, desmotive,
				causal, descausal);
	}
	CenterWindow(page, 500, 430, 3);
}

function showMsgViewer() {
	page = EIBS.goURL("showMsgViewer");
	CenterWindow(page, 800, 480, 2);
}

function showWarnings(accnum, name) {
	clickElement(name, accnum);
	page = EIBS.goURL("showWarnings", accnum);
	CenterNamedWindow(page, 'warnings', 520, 300, 2);
}

function SayThis(s) {
	applet = document.applets.Speaker;
	s = EIBS.goURL("SayThis", s);
	if (isValidObject(applet))
		document.applets["Speaker"].SayThis(s);
}

function DatePicker(d1, d2, d3) {
	fieldDate1 = d1;
	fieldDate2 = d2;
	fieldDate3 = d3;
	fieldAux1 = true;
	page = EIBS.goURL("DatePicker");
	CenterWindow(page, 270, 270, 5);
}

function DOBPicker(d1, d2, d3) {
	fieldDate1 = d1;
	fieldDate2 = d2;
	fieldDate3 = d3;
	fieldAux1 = false;
	page = EIBS.goURL("DatePicker");
	CenterWindow(page, 270, 270, 5);
}

function GetCreditLineDeudor(name, type, custnum, relcust, relline) {
	page = EIBS.goURL("GetCreditLineDeudor", custnum, type, relcust, relline);
	fieldName = name;
	fieldAux1 = type;
	fieldAux2 = relcust;
	fieldAux3 = relline;
	CenterWindow(page, 630, 190, 3);
}

function showInqApprovalDespig(bank, account1, account2, type) {
	page = EIBS.goURL("showInqApprovalDespig", bank, account1, account2, type);
	CenterWindow(page, 600, 500, 2);

}

function showCollateralList(collNum) {
	if (isNumeric(collNum)) {
		if (collNum != "0") {
			var page = EIBS.goURL("showCollateralList", collNum);
			CenterWindow(page, 800, 800, 2);
		}
	}
}

function GetDepositRef(code, name) {
	var page = EIBS.goURL("GetDepositRef");
	fieldName = code;
	fieldAux1 = name;
	CenterWindow(page, 500, 450, 3);
}

function GetAccountCustomerEmbargos(name, filter, valname, valcust) {
	page = EIBS.goURL("GetAccountCustomerEmbargos", filter, valcust);
	fieldName = name;
	AppCode = filter;
	Selection = valname;
	fieldDesc = valcust;
	CenterWindow(page, 1000, 550, 1);
}

function showDetailMora(rowNum, account, mm, dd, yy) {
	page = EIBS.goURL("showDetailMora", rowNum, account, mm, dd, yy);
	CenterWindow(page, 760, 380, 2);
}

function showDetailMoraUF(rowNum, account, mm, dd, yy) {
	page = EIBS.goURL("showDetailMoraUF", rowNum, account, mm, dd, yy);
	CenterWindow(page, 760, 380, 2);
}

function GetCodReferenceCollectDeal(custnum, convnum, cod, desc) {
	page = EIBS.goURL("GetCodReferenceCollectDeal", custnum, convnum);
	fieldName = cod;
	fieldAux1 = desc;
	CenterWindow(page, 500, 450, 3);
}

function CsmGetDef(name, desc) {
	page = EIBS.goURL("CsmGetDef");
	fieldName = name;
	fieldDesc = desc;
	CenterWindow(page, 500, 300, 2);
}

function CsmShowInq(por, desc) {
	page = EIBS.goURL("CsmShowInq", por, desc);
	clickElement("E01PRFNUM", por);
	CenterWindow(page, 1000, 600, 2);
}

function GetCrsCno(tbl, cod, dsc, crs) {
	page = EIBS.goURL("GetCrsCno", tbl);
	fieldName = cod;
	fieldDesc = dsc;
	fieldAux = crs;
	CenterWindow(page, 600, 450, 2);
}

function GetNUDDet(acc, nud) {
	page = EIBS.goURL("GetNUDDet", acc, nud);
	CenterWindow(page, 1200, 550, 2);
}

function GetFieldRpt(code, name, lang) {
	page = EIBS.goURL("GetFieldRpt", lang);
	fieldName = code;
	fieldDesc = name;
	CenterWindow(page, 600, 450, 2);
}

function GetModRpt(code, name, lang) {
	page = EIBS.goURL("GetModRpt", lang);
	fieldName = code;
	fieldDesc = name;
	CenterWindow(page, 600, 450, 2);
}

function GetWebUrl(code, name) {
	page = EIBS.goURL("GetWebUrl");
	fieldName = code;
	fieldDesc = name;
	CenterWindow(page, 600, 450, 2);
}

function GetWebMnu(code, name) {
	page = EIBS.goURL("GetWebMnu");
	fieldName = code;
	fieldDesc = name;
	CenterWindow(page, 600, 450, 2);
}

function GetWebMnuOpt(filter, code, name) {
	page = EIBS.goURL("GetWebMnuOpt", filter);
	fieldName = code;
	fieldDesc = name;
	CenterWindow(page, 600, 450, 2);
}

function GetEntity(name, desc, id) {
	page = EIBS.goURL("GetEntity");
	fieldName = name;
	fieldDesc = desc;
	fieldId = id;
	fieldAux1 = "";
	CenterWindow(page, 1000, 550, 1);
}

function GetEntityRelations(name, desc, id, cuscun, entityType, searchType) {
	page = EIBS.goURL("GetEntityRelations", entityType, cuscun, searchType);
	fieldName = name;
	fieldDesc = desc;
	fieldId = id;
	CenterWindow(page, 1000, 550, 3);
}

function GetCustodian(name, desc) {
	page = EIBS.goURL("GetCustodian");
	fieldName = name;
	fieldAux1 = desc;
	CenterWindow(page, 500, 230, 3);
}
function GetTransaction(code, name) {
	page = EIBS.goURL("GetTransaction");
	fieldName = code;
	fieldDesc = name;
	CenterWindow(page, 430, 200, 3);
}

function GetCommission(code, name) {
	page = EIBS.goURL("GetCommission");
	fieldName = code;
	fieldDesc = name;
	CenterWindow(page, 430, 200, 3);
}

function GetCsmCommission(code, name) {
	page = EIBS.goURL("GetCsmCommission");
	fieldName = code;
	fieldDesc = name;
	CenterWindow(page, 430, 200, 3);
}

function GetTrmTeller(code, name) {
	page = EIBS.goURL("GetTrmTeller");
	fieldName = code;
	fieldDesc = name;
	CenterWindow(page, 430, 200, 3);
}

function GetTellLevel(code, name, lvl) {
	page = EIBS.goURL("GetTellLevel");
	fieldName = code;
	fieldDesc = name;
	fieldAux = lvl;
	CenterWindow(page, 500, 350, 2);
}

function GetLneCorr(code, cus, vrd, vra, vrc) {
	page = EIBS.goURL("GetLneCorr", cus);
	fieldName = code;
	fieldAux1 = vrd;
	fieldAux2 = vra;
	fieldAux3 = vrc;
	CenterWindow(page, 630, 190, 3);
}


function GetTlmTeller(code, brn, dsc, bth) {
	page = EIBS.goURL("GetTlmTeller");
	fieldName = code;
	fieldAux1 = brn;
	fieldAux2 = dsc;
	fieldAux3 = bth;
	CenterWindow(page, 430, 200, 3);
}

function GetAtm(code) {
	page = EIBS.goURL("GetAtm");
	fieldName = code;
	CenterWindow(page, 600, 450, 2);
}

function GetCca(code,dsc) {
	page = EIBS.goURL("GetCca");
	fieldName = code;
	fieldAux2 = dsc;
	CenterWindow(page, 430, 200, 3);
}

function GetCov(code) {
	page = EIBS.goURL("GetCov");
	fieldName = code;
	CenterWindow(page, 1600, 400, 3);
}

function GetPanVirtual(code) {
	page = EIBS.goURL("GetPanVirtual");
	fieldName = code;
	CenterWindow(page, 430, 200, 3);
}


function GetCityCategory(ctrfilter, stefilter, ctyfilter, ctgfilter, typfilter,
		ctr, ste, cty, ctg, ctgd, sct, sctd) {

	if (ctrfilter == " " || stefilter == " " || ctyfilter == " " || typfilter == " ") {
		alert('Favor revisar y diligenciar Pais, Estado, Ciudad y Uso de Direccion antes de usar esta ayuda !!! ')
		return;
	}
	if (ctgfilter == " ") {
		ctgfilter = "0"
	}
	page = EIBS.goURL("GetCityCategory", ctrfilter, stefilter, ctyfilter, ctgfilter, typfilter);
	fieldCtr = ctr;
	fieldSte = ste;
	fieldCty = cty;
	fieldCtg = ctg;
	fieldCtgd = ctgd;
	fieldSct = sct;
	fieldSctd = sctd;

	CenterWindow(page, 800, 600, 2);
}

function GetPaqRedescuento(code, name) {
	page = EIBS.goURL("GetPaqRedescuento");
	fieldCode = code;
	fieldDesc = name;
	CenterWindow(page, 430, 200, 3);
}

function GetContraparte(code, name, cnv) {
	page = EIBS.goURL("GetContraparte", cnv);
	fieldCode = code;
	fieldDesc = name;
	fieldId = cnv;
	CenterWindow(page, 530, 300, 3);
}

function GetFasec(code, name, id, amount) {
	page = EIBS.goURL("GetFasec");
	fieldName = code;
	fieldAux1 = name;
	fieldAux2 = id;
	fieldAux3 = amount;
	CenterWindow(page, 800, 550, 3);
}

function GetDocImg(name, tbltyp, tblnum, tbldty) {
	page = EIBS.goURL("GetDocImg", tbltyp, tblnum, tbldty);
	fieldName = name;
	CenterWindow(page, 1050, 400, 1);
}

function GetSignImg(tblnum, numchk) {
	page = EIBS.goURL("GetSignImg", tblnum, numchk);
	CenterWindow(page, 1050, 600, 2);
}

function GetFormType(name) {
	page = EIBS.goURL("GetFormType");
	fieldName = name;
	CenterWindow(page, 200, 200, 2);
}
