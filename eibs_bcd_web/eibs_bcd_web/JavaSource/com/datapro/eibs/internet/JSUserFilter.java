// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) 
// Source File Name:   JSUserFilter.java

package com.datapro.eibs.internet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.datapro.eibs.internet.beans.JBGroupItems;
import com.datapro.eibs.internet.beans.JBGroupItemsList;
import com.datapro.eibs.internet.beans.JBMenu;
import com.datapro.eibs.internet.databeans.DC_USRPROFILE;
import com.datapro.generic.beanutil.BeanList;

import datapro.eibs.beans.ESS0030DSMessage;
import datapro.eibs.master.SuperServlet;

public class JSUserFilter extends SuperServlet
{

	public JSUserFilter()
	{
	}

	public void service(HttpServletRequest req, HttpServletResponse resp)
		throws ServletException, IOException
	{
		BeanList lsUsers = new BeanList();
		DC_USRPROFILE usersdatabean = new DC_USRPROFILE();
		BeanList lsCards = new BeanList();
		ESS0030DSMessage msgUser = null;
		HttpSession session = req.getSession(false);
		String Path = SuperServlet.rootPath + "e/";
		try
		{
			msgUser = (ESS0030DSMessage)session.getAttribute("currUser");
			Path = SuperServlet.rootPath + msgUser.getE01LAN() + "/";
		}
		catch(Exception exception) { }
		String INTOK = "Y";
		String EXTOK = "Y";
		String THIOK = "Y";
		String BILLS = "Y";
		JBGroupItemsList grpitmlistbean = new JBGroupItemsList();
		JBMenu menulistbean = new JBMenu();
		lsUsers = (BeanList)session.getAttribute("lsUsers");
		String userID = req.getParameter("USERID");
		String PageToCall = "";
		String ACT = req.getParameter("PB").toUpperCase();
		usersdatabean.setOUSER("");
		usersdatabean.setVUSER("");
		usersdatabean.setACT(ACT);
		PageToCall = "DCIBS_user_add_delete.jsp";
		lsUsers.initRow();
		while(lsUsers.getNextRow()) 
		{
			usersdatabean = (DC_USRPROFILE)lsUsers.getRecord();
			if(userID.equals(usersdatabean.getUSERID().trim()))
				break;
		}
		JBGroupItems grpitm = new JBGroupItems();
		grpitm.getDBGroupItemsList(usersdatabean.getGRPID());
		grpitmlistbean = grpitm.getGroupItemsList();
		session.setAttribute("grpitmlistbean", grpitmlistbean);
		menulistbean.getDBMenu(INTOK, EXTOK, THIOK, BILLS);
		usersdatabean.setACT(ACT);
		session.setAttribute("menulistbean", menulistbean);
		session.setAttribute("usersdatabean", usersdatabean);
		session.setAttribute("lsUsers", lsUsers);
		resp.sendRedirect(SuperServlet.srctx + Path + PageToCall);
	}
}
