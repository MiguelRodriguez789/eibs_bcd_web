
package com.datapro.eibs.internet;

import com.datapro.eibs.internet.beans.JBUser;
import com.datapro.generic.beanutil.BeanList;
import datapro.eibs.beans.ESS0030DSMessage;
import datapro.eibs.master.SuperServlet;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.http.*;

public class JSEntityInquiry extends SuperServlet
{

	public JSEntityInquiry()
	{
	}

	public void service(HttpServletRequest req, HttpServletResponse resp)
		throws ServletException, IOException
	{
		HttpSession session = req.getSession(false);
		ESS0030DSMessage msgUser = null;
		String UserIdJSP = (String)session.getAttribute("UserIdJSP");
		String Path = SuperServlet.rootPath + "e/";
		try
		{
			msgUser = (ESS0030DSMessage)session.getAttribute("currUser");
			Path = SuperServlet.rootPath + msgUser.getE01LAN() + "/";
		}
		catch(Exception exception) { }
		int SCREEN = Integer.parseInt(req.getParameter("SCREEN"));
		switch(SCREEN)
		{
		case 1: // '\001'
			procReqGetCPA(Path, resp);
			break;

		case 100: // 'd'
			procReqGetUSR(Path, resp, session);
			break;

		case 200: 
			procReqGetTRA(Path, resp, session);
			break;

		default:
			resp.sendRedirect(SuperServlet.srctx + Path + SuperServlet.devPage);
			break;
		}
	}

	public void procReqGetCPA(String Path, HttpServletResponse resp)
		throws ServletException, IOException
	{
		String PageToCall = "";
		PageToCall = "body_adm_change_password.jsp";
		resp.sendRedirect(SuperServlet.srctx + Path + PageToCall);
	}

	public void procReqGetUSR(String Path, HttpServletResponse resp, HttpSession session)
		throws ServletException, IOException
	{
		BeanList lsEntity = new BeanList();
		JBUser userbean = new JBUser();
		lsEntity = userbean.getListEntitydif();
		session.setAttribute("lsEntity", lsEntity);
		String PageToCall = "";
		PageToCall = "DCIBS_helpdesk_users.jsp";
		resp.sendRedirect(SuperServlet.srctx + Path + PageToCall);
	}

	public void procReqGetTRA(String Path, HttpServletResponse resp, HttpSession session)
		throws ServletException, IOException
	{
		BeanList lsEntity = new BeanList();
		JBUser userbean = new JBUser();
		lsEntity = userbean.getListEntitydif();
		session.setAttribute("lsEntity", lsEntity);
		String PageToCall = "";
		PageToCall = "DCIBS_helpdesk_transactions.jsp";
		resp.sendRedirect(SuperServlet.srctx + Path + PageToCall);
	}
}
