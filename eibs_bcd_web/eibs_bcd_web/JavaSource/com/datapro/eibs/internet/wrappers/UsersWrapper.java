
package com.datapro.eibs.internet.wrappers;

import com.datapro.eibs.internet.databeans.DC_USRPROFILE;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.jsp.PageContext;
import org.apache.taglibs.display.Decorator;
import org.apache.taglibs.display.TableDecorator;

public class UsersWrapper extends TableDecorator
{

	public UsersWrapper()
	{
	}

	public String getUserid()
	{
		DC_USRPROFILE usersdatabean = (DC_USRPROFILE)getObject();
		String rt = "<INPUT TYPE=RADIO  NAME=\"USERID\" CHECKED VALUE='" + usersdatabean.getUSERID() + "'>";
		return rt;
	}

	public String getUsersts()
	{
		HttpServletRequest req = (HttpServletRequest)getPageContext().getRequest();
		javax.servlet.http.HttpSession session = req.getSession(false);
		DC_USRPROFILE usersdatabean = (DC_USRPROFILE)getObject();
		String rt = usersdatabean.getSTS();
		if(rt.equals("0"))
			rt = "Active";
		else
		if(rt.equals("3"))
			rt = "Inactive";
		else
		if(rt.equals("4"))
			rt = "Pending";
		return rt;
	}
}
