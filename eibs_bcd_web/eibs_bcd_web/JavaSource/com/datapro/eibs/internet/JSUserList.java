package com.datapro.eibs.internet;

import com.datapro.eibs.internet.beans.JBUser;
import com.datapro.generic.beanutil.BeanList;
import datapro.eibs.beans.ESS0030DSMessage;
import datapro.eibs.master.SuperServlet;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.http.*;

public class JSUserList extends SuperServlet
{

	public JSUserList()
	{
	}

	public void service(HttpServletRequest req, HttpServletResponse resp)
		throws ServletException, IOException
	{
		BeanList lsUsers = new BeanList();
		HttpSession session = req.getSession(false);
		ESS0030DSMessage msgUser = null;
		String Path = SuperServlet.rootPath + "s/";
		try
		{
			msgUser = (ESS0030DSMessage)session.getAttribute("currUser");
			Path = SuperServlet.rootPath + msgUser.getE01LAN() + "/";
		}
		catch(Exception exception) { }
		JBUser userbean = new JBUser();
		String Flag = req.getParameter("PB").toUpperCase();
		String UserEntityJSP = req.getParameter("ENTITYID").toUpperCase();
		lsUsers = userbean.getListUsers(UserEntityJSP);
		String PageToCall = "";
		PageToCall = "DCIBS_user_add_delete_list.jsp?ENTITYID=" + UserEntityJSP;
		session.setAttribute("lsUsers", lsUsers);
		resp.sendRedirect(SuperServlet.srctx + Path + PageToCall);
	}
}
