package com.datapro.eibs.reporter.controller;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.URL;
import java.net.URLConnection;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.datapro.eibs.reporter.master.JSEIBSPropLRG;
import com.datapro.eibs.reporter.resources.ResourceManager;

import datapro.eibs.beans.ESS0030DSMessage;
import datapro.eibs.master.JSEIBSServlet;

/**
 * @author Luis Crosby
 * @date 2/2012
 * 
 */

public class JSLRG0000 extends JSEIBSServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = -3872556310307267665L;
	protected static final int R_REPGEN = 100;

	protected void processRequest(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res,
			HttpSession session, int screen) throws ServletException,
			IOException {

		switch (screen) {
		// Request
		case R_REPGEN:
			procReqRepGen(user, req, res, session);
			break;
		default:
			forward("MISC_not_available.jsp", req, res);
			break;
		}
	}

	private void procReqRepGen(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session) throws IOException {

		flexLog("Connecting to report generator...");
		OutputStream output = null;
		try {

			String http = ResourceManager.getString("eIBS.RepGen.URL") 
					+ "?rgid=" + ResourceManager.getString("eIBS.RepGen.ID") 
					+ "&unm=" + user.getH01USR()
					+ "&bnkid=" + user.getE01UBK()
					+ "&ctxtRoot=" + JSEIBSPropLRG.getWebAppPath() 
					+ "&aut=" + user.getE01AUT() 
					+ "&lib=" + ResourceManager.getString("working.library");
			
			URL url = new URL(http);
			res.reset();
			output = res.getOutputStream();
			int size = openConnection(url, output, getLanguage(user.getE01LAN()));
			res.setContentType("text/html");
			res.setContentLength(size);
			output.flush();
			flexLog("Report Generator sent to screen.");
		} catch (Exception e) {
			flexLog("Exception e : " + e.getClass().getName() + " "
					+ e.getMessage());
		} finally {
			if (output != null)
				output.close();
		}

	}

	private String getLanguage(String e01lan) {
		String lang = "en"; 
		if (e01lan.equals("e"))
			lang = "en";
		if (e01lan.equals("s"))
			lang = "es";
		return lang;
	}

	private int readBinaryResponse(URLConnection conn, OutputStream os)
			throws IOException {
		// Write the binary data to the output stream return read bytes
		int result = 0;
		InputStream is = null;
		try {
			is = conn.getInputStream();
			int len;
			byte buf[] = new byte[1024];
			while ((len = is.read(buf)) > 0) {
				os.write(buf, 0, len);
				result += len;
			}
		} finally {
			if (is != null)
				is.close();
		}
		return result;
	}

	private int openConnection(URL url, OutputStream os, String lang) throws Exception {
		try {

			URLConnection conn = url.openConnection();
			conn.setRequestProperty("Accept-Language", lang);
			conn.setDoOutput(true);

			return readBinaryResponse(conn, os);

		} catch (Exception e) {
			throw e;
		}
	}

}
