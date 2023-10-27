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

import com.datapro.eibs.exception.DAOException;
import com.datapro.eibs.internet.beans.JBUser;

import datapro.eibs.beans.ELEERRMessage;
import datapro.eibs.beans.ESS0030DSMessage;
import datapro.eibs.master.JSEIBSServlet;

public class JSDeletePassword extends JSEIBSServlet {

	protected void processRequest(
		ESS0030DSMessage user,
		HttpServletRequest req,
		HttpServletResponse res,
		HttpSession session,
		int screen)
		throws ServletException, IOException {
			
		switch (screen) {
			case 1 :
				JBUser userBean = new JBUser();
				String userID = req.getParameter("USERID");
				if (userID == null) userID = "";
			
				try {
					int rt = userBean.deleteUserPassword(userID);
					if (rt == 1) {
						forwardOnSuccess("DCIBS_user_delete_password_confirmation.jsp", req, res);			
					} else {
						ELEERRMessage error = new ELEERRMessage();
						error.setERRNUM("1");
						error.setERNU01("0001");
						error.setERDS01("No se ha podido eliminar el usuario especificado");
						session.setAttribute("error", error);
						forward("DCIBS_user_delete_password.jsp", req, res);
					}					
				} catch (DAOException e) {
					throw new ServletException(e);
				}

				break;
			case 10 :
				forwardOnSuccess("DCIBS_user_delete_password.jsp", req, res);
				break;
		}

	}
}
