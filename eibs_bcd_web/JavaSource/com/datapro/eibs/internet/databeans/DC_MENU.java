

package com.datapro.eibs.internet.databeans;

import java.io.Serializable;

public class DC_MENU
	implements Serializable
{

	public DC_MENU()
	{
		MMID = 0;
		CMID = 0;
		NAME = "";
		URL = "";
		TARGET = "";
		STS_DC = "";
		STS_D = "";
		ADM = "";
		CHK = "";
		FLG_LMT_AMNT = "";
		TRANSCODE = "";
		LOG_ADM = "";
		LOG_D = "";
		LOG_DC = "";
	}

	public int getMMID()
	{
		return MMID;
	}

	public void setMMID(int MMID)
	{
		this.MMID = MMID;
	}

	public int getCMID()
	{
		return CMID;
	}

	public void setCMID(int CMID)
	{
		this.CMID = CMID;
	}

	public String getNAME()
	{
		return NAME.toUpperCase().trim();
	}

	public void setNAME(String NAME)
	{
		this.NAME = NAME;
	}

	public String getURL()
	{
		return URL.toUpperCase().trim();
	}

	public void setURL(String URL)
	{
		this.URL = URL;
	}

	public String getTARGET()
	{
		return TARGET.toUpperCase().trim();
	}

	public void setTARGET(String TARGET)
	{
		this.TARGET = TARGET;
	}

	public String getSTS_DC()
	{
		return STS_DC.toUpperCase().trim();
	}

	public void setSTS_DC(String STS_DC)
	{
		this.STS_DC = STS_DC;
	}

	public String getSTS_D()
	{
		return STS_D.toUpperCase().trim();
	}

	public void setSTS_D(String STS_D)
	{
		this.STS_D = STS_D;
	}

	public String getADM()
	{
		return ADM.toUpperCase().trim();
	}

	public void setADM(String ADM)
	{
		this.ADM = ADM;
	}

	public String getCHK()
	{
		return CHK.toUpperCase().trim();
	}

	public void setCHK(String CHK)
	{
		this.CHK = CHK;
	}

	public String getFLG_LMT_AMNT()
	{
		return FLG_LMT_AMNT.toUpperCase().trim();
	}

	public void setFLG_LMT_AMNT(String FLG_LMT_AMNT)
	{
		this.FLG_LMT_AMNT = FLG_LMT_AMNT;
	}

	public String getTRANSCODE()
	{
		return TRANSCODE.toUpperCase().trim();
	}

	public void setTRANSCODE(String TRANSCODE)
	{
		this.TRANSCODE = TRANSCODE;
	}

	public String getLOG_ADM()
	{
		return LOG_ADM.toUpperCase().trim();
	}

	public void setLOG_ADM(String LOG_ADM)
	{
		this.LOG_ADM = LOG_ADM;
	}

	public String getLOG_D()
	{
		return LOG_D.toUpperCase().trim();
	}

	public void setLOG_D(String LOG_D)
	{
		this.LOG_D = LOG_D;
	}

	public String getLOG_DC()
	{
		return LOG_DC.toUpperCase().trim();
	}

	public void setLOG_DC(String LOG_DC)
	{
		this.LOG_DC = LOG_DC;
	}

	public String toString()
	{
		StringBuffer results = new StringBuffer();
		results.append(getClass().getName() + "\n");
		results.append("\tMMID=" + MMID + "\n");
		results.append("\tCMID=" + CMID + "\n");
		results.append("\tNAME=" + NAME + "\n");
		results.append("\tURL=" + URL + "\n");
		results.append("\tTARGET=" + TARGET + "\n");
		results.append("\tSTS_DC=" + STS_DC + "\n");
		results.append("\tSTS_D=" + STS_D + "\n");
		results.append("\tADM=" + ADM + "\n");
		results.append("\tCHK=" + CHK + "\n");
		results.append("\tFLG_LMT_AMNT=" + FLG_LMT_AMNT + "\n");
		results.append("\tTRANSCODE=" + TRANSCODE + "\n");
		results.append("\tLOG_ADM=" + LOG_ADM + "\n");
		results.append("\tLOG_D=" + LOG_D + "\n");
		results.append("\tLOG_DC=" + LOG_DC + "\n");
		return results.toString();
	}

	protected int MMID;
	protected int CMID;
	protected String NAME;
	protected String URL;
	protected String TARGET;
	protected String STS_DC;
	protected String STS_D;
	protected String ADM;
	protected String CHK;
	protected String FLG_LMT_AMNT;
	protected String TRANSCODE;
	protected String LOG_ADM;
	protected String LOG_D;
	protected String LOG_DC;
}
