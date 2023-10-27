package com.datapro.eibs.teller.key;

import com.datapro.eibs.access.KeySuper;

public class ATTELLUSERSKEYViewLastBranchSeq extends KeySuper {

	private static final long serialVersionUID = 6291831309620872877L;
	
	//Field type CHAR(4)
	private String CODEBANK = null;
	//Field type CHAR(6)
	private String CODEBRANCH = null;
	
	public String getCODEBANK() {
		return CODEBANK;
	}
	public void setCODEBANK(String codebank) {
		CODEBANK = codebank;
	}
	public String getCODEBRANCH() {
		return CODEBRANCH;
	}
	public void setCODEBRANCH(String codebranch) {
		CODEBRANCH = codebranch;
	}
	
	
	
}