package com.datapro.eibs.teller.dao;

import com.datapro.eibs.access.DAOSuper;
import com.datapro.eibs.teller.vo.ATTELLUSERSExtBasic;
import com.datapro.generic.tool.Util;

public class ATTELLUSERSDAOExtBasic extends DAOSuper {

	protected void initAuditFields(Object vo) {
		ATTELLUSERSExtBasic bean = (ATTELLUSERSExtBasic) vo;
		bean.setUSERDATE(""+Util.dateToInt(this.year, this.month, this.day));
		//bean.setUSERTMS(this.timestamp);
	}

	protected boolean checkRecordLock(Object vo, Object dbVo) {
		//setUnModifiableFields(vo, dbVo);
		//return (((ATTELLUSERS)dbVo).getUSERTMS() != null) &&
		//(((ATTELLUSERS)dbVo).getUSERTMS().equals(((ATTELLUSERS)vo).getUSERTMS()));
		return true;
	}
	
	/**
	protected void setUnModifiableFields(Object vo, Object dbVo){
		ATTELLUSERSExtBasic bean = (ATTELLUSERSExtBasic)vo;
		ATTELLUSERSExtBasic dbBean = (ATTELLUSERSExtBasic)dbVo;
	}
	
	public void setLockingField(ValueObject vo, Object value) {
		if(vo != null)((ATTELLUSERS)vo).setUSERTMS((Timestamp) value);
	}
	
	public Object getLockingField(ValueObject vo) {
		return (vo == null) ? null : ((ATTELLUSERS)vo).getUSERTMS();
	}
	*/	
}