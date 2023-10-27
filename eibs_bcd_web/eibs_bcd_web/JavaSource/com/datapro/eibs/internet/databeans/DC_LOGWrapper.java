
package com.datapro.eibs.internet.databeans;

import datapro.eibs.master.Util;
import org.apache.taglibs.display.Decorator;
import org.apache.taglibs.display.TableDecorator;


public class DC_LOGWrapper extends TableDecorator
{

	public DC_LOGWrapper()
	{
	}

	public String getDate()
	{
		DC_LOG msg = (DC_LOG)getObject();
		String rt = Util.formatDate(msg.getTDATE());
		return rt;
	}

	public String getTime()
	{
		DC_LOG msg = (DC_LOG)getObject();
		String rt = Util.formatTime(msg.getDTTM());
		return rt;
	}
}
