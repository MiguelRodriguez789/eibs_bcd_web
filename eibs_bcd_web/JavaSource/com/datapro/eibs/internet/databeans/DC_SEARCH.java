package com.datapro.eibs.internet.databeans;

import java.io.Serializable;

public class DC_SEARCH
	implements Serializable
{

	public DC_SEARCH()
	{
		ENTITYID = "";
		SEARCH = "";
		TRANSCODE = "";
		FD1 = "";
		FD2 = "";
		FD3 = "";
		ED1 = "";
		ED2 = "";
		ED3 = "";
	}

	public String getENTITYID()
	{
		return ENTITYID.toUpperCase().trim();
	}

	public void setENTITYID(String ENTITYID)
	{
		this.ENTITYID = ENTITYID;
	}

	public String getSEARCH()
	{
		return SEARCH.toUpperCase().trim();
	}

	public void setSEARCH(String SEARCH)
	{
		this.SEARCH = SEARCH;
	}

	public String getTRANSCODE()
	{
		return TRANSCODE.toUpperCase().trim();
	}

	public void setTRANSCODE(String TRANSCODE)
	{
		this.TRANSCODE = TRANSCODE;
	}

	public String getFD1()
	{
		return FD1.toUpperCase().trim();
	}

	public void setFD1(String TDATE)
	{
		FD1 = TDATE;
	}

	public String getFD2()
	{
		return FD2.toUpperCase().trim();
	}

	public void setFD2(String TDATE)
	{
		FD2 = TDATE;
	}

	public String getFD3()
	{
		return FD3.toUpperCase().trim();
	}

	public void setFD3(String TDATE)
	{
		FD3 = TDATE;
	}

	public String getED1()
	{
		return ED1.toUpperCase().trim();
	}

	public void setED1(String TDATE)
	{
		ED1 = TDATE;
	}

	public String getED2()
	{
		return ED2.toUpperCase().trim();
	}

	public void setED2(String TDATE)
	{
		ED2 = TDATE;
	}

	public String getED3()
	{
		return ED3.toUpperCase().trim();
	}

	public void setED3(String TDATE)
	{
		ED3 = TDATE;
	}

	protected String ENTITYID;
	protected String SEARCH;
	protected String TRANSCODE;
	protected String FD1;
	protected String FD2;
	protected String FD3;
	protected String ED1;
	protected String ED2;
	protected String ED3;
}
