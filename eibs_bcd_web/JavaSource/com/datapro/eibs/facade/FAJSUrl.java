package com.datapro.eibs.facade;

import java.util.logging.Logger;

import com.datapro.eibs.constants.General;
import com.datapro.eibs.exception.DatabaseAccessException;
import com.datapro.eibs.exception.ItemNotFoundException;
import com.datapro.eibs.parameters.dao.WEBURLDAO;
import com.datapro.eibs.parameters.key.WEBURLKEY;
import com.datapro.eibs.parameters.vo.WEBURL;

public class FAJSUrl extends FACommon{
	private Logger logger = Logger.getLogger(this.getClass().getName());

	public String getURL(String popUpID) throws DatabaseAccessException {
		super.setDbConnectionKey(General.IBS_SERVER);
		super.initDao(WEBURLDAO.class);
		WEBURL vo = new WEBURL();
		WEBURLKEY key = new WEBURLKEY();
		key.setID(popUpID);
		try {
			vo = (WEBURL) getValue(key);
		} catch (ItemNotFoundException e) {
			logger.info("\tURL not Found" + popUpID );
		}
		return vo.getURL();
	}
}
