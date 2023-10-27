package com.datapro.eibs.facade;

import java.util.List;

import com.datapro.eibs.constants.General;
import com.datapro.eibs.exception.DatabaseAccessException;
import com.datapro.eibs.exception.ItemNotFoundException;
import com.datapro.eibs.parameters.dao.CNOFCDAO;
import com.datapro.eibs.parameters.dao.CNOFTDAO;
import com.datapro.eibs.parameters.key.CNOFCKEY;
import com.datapro.eibs.parameters.key.CNOFTKEY;
import com.datapro.eibs.parameters.vo.CNOFC;

public class FAParameters extends FACommon {
	
	public List getCNOFTables() throws DatabaseAccessException {
		super.setDbConnectionKey(General.IBS_SERVER);
		super.initDao(CNOFTDAO.class);
		CNOFTKEY key = new CNOFTKEY();
		key.setCNOLAN(getSessionUser().getE01LAN());
		return (List) getList(key).getList();
	}
	
	public List getCNOFCodes(String table) throws DatabaseAccessException {
		super.setDbConnectionKey(General.IBS_SERVER);
		super.initDao(CNOFCDAO.class);
		CNOFCKEY key = new CNOFCKEY();
		key.setCNOCFL(table);
		return (List) getList(key).getList();
	}
	
	public CNOFC getCNOFCode(String tbl, String cde) 
		throws DatabaseAccessException, ItemNotFoundException {
	
		super.setDbConnectionKey(General.DBID_CURRENT_YEAR);
		super.initDao(CNOFCDAO.class);
		
		CNOFCKEY key = new CNOFCKEY();
		key.setCNOCFL(tbl);
		key.setCNORCD(cde);
		
		return (CNOFC) super.getValue(key);
	}

}
