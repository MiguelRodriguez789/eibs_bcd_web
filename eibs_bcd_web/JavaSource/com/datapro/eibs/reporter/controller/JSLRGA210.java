package com.datapro.eibs.reporter.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.datapro.eibs.reporter.forms.LRGA21001;
import com.datapro.eibs.reporter.forms.LRGA21002;
import com.datapro.eibs.reporter.forms.LRGA21003;
import com.datapro.eibs.reporter.forms.LRGA40001;
import com.datapro.eibs.reporter.model.DBColumnDTO;
import com.datapro.eibs.reporter.model.GlbprmDTO;
import com.datapro.eibs.reporter.service.dao.GlbprmDAO;
import com.datapro.eibs.reporter.service.dao.SchemaDAO;

import datapro.eibs.beans.ELEERRMessage;
import datapro.eibs.beans.ESS0030DSMessage;
import datapro.eibs.master.JSEIBSServlet;

/**
 * @author Luis Crosby
 * @date 6/2012
 * 
 */


/** GLBPRM ADMIN */


public class JSLRGA210 extends JSEIBSServlet {

	protected static final int REQ_SCHEMA_TABLES_LIST		=	10;
	protected static final int ACT_SCHEMA_TABLES_LIST		=	11;
	protected static final int REQ_RELATIONSHIP_LIST		=	20;
	protected static final int ACT_AJAX_COLUMNS				=	21;
	protected static final int REQ_AVAIL_COLUMN_LIST		=	30;
	protected static final int ACT_AVAIL_COLUMN_LIST		=	31;
	

	/**
	 * 
	 */

	protected void processRequest(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res,
			HttpSession session, int screen) throws ServletException,
			IOException {

		switch (screen) {
			case REQ_SCHEMA_TABLES_LIST :
				reqSchemaTablesList(user, req, res, session);
				break;
			case ACT_SCHEMA_TABLES_LIST : 
				actSchemaTablesList(user, req, res, session);
				break;
			case REQ_RELATIONSHIP_LIST :
				reqSetRelationshipsList(user, req, res, session);
				break;
			case ACT_AJAX_COLUMNS : 
				actAjaxColumns(user, req, res, session);
				break;			
			case REQ_AVAIL_COLUMN_LIST :
				reqAvailColumnList(user, req, res, session);
				break;
			case ACT_AVAIL_COLUMN_LIST :
				actAvailColumnList(user, req, res, session);
				break;				
			default:
				forward("MISC_not_available.jsp", req, res);
				break;
		}
	}
	
	private void reqSchemaTablesList(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session)
			throws ServletException {

		String PageToCall = "";
		LRGA21001 msg = new LRGA21001();
		try {
			req.setAttribute("msg", msg);
			PageToCall = "/pages/reporter/s/LRGA210_schema_tables_frameset.jsp";
			callPage(PageToCall, req, res);

		} catch (Exception e) {
			throw new ServletException(e.getClass().getName() + " --> "
					+ e.getMessage());
		}
	}	
	
	private void actSchemaTablesList(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException {
		
		String PageToCall = "";
		LRGA21001 msg = new LRGA21001();
		msg.setTextSearch(req.getParameter("textSearch").trim().toUpperCase());
		
		try {
			msg.setTables(SchemaDAO.getInstance().getTables(msg.getTextSearch()));

			req.setAttribute("msg", msg);
			PageToCall = "/pages/reporter/s/LRGA210_schema_tables_list.jsp";
			callPage(PageToCall, req, res);

		} catch (Exception e) {
			throw new ServletException(e.getClass().getName() + " --> "
					+ e.getMessage());
		}
	}
	
	private void reqSetRelationshipsList(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session)
			throws ServletException {

		String PageToCall = "";
		LRGA21002 msg = new LRGA21002();
		try {
			
			msg.setStrTables(req.getParameter("tables"));
			
			req.setAttribute("msg", msg);
			PageToCall = "/pages/reporter/s/LRGA210_relationship_list.jsp";
			callPage(PageToCall, req, res);

		} catch (Exception e) {
			throw new ServletException(e.getClass().getName() + " --> "
					+ e.getMessage());
		}
	}	
	
	private void actAjaxColumns(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException {
		
		String response = "<option>--seleccione--</option>";
		String tableName = req.getParameter("tableName");
		List columnList;
		String responseJson = "[";

		try {
			
			columnList = SchemaDAO.getInstance().getColumns(tableName);
			int x = 0; 
			for (Iterator i = columnList.iterator(); i.hasNext();) {
				DBColumnDTO column = (DBColumnDTO) i.next();
				response += "<option value=\"" + column.getCOLUMN_NAME() + "\" " +
						"class=\"" + column.getTYPE_NAME() + "\">" + column.getCOLUMN_NAME() + " (" + column.getTYPE_NAME() + ")" + "</column>\n";
				responseJson += "{ text: '" + column.getCOLUMN_NAME() + " (" + column.getTYPE_NAME() + ")', value: '" + column.getCOLUMN_NAME() + "' },";
				x++;
			}
			if (x > 0)
				responseJson = responseJson.substring(0, responseJson.length()-1);
			responseJson += "];";
			res.setContentType("text/plain");
			PrintWriter out = res.getWriter();
			//out.println("" + response + "");
			out.println("" + responseJson + "");
			out.flush();
			out.close();

		} catch (Exception e) {
			throw new ServletException(e.getClass().getName() + " --> "
					+ e.getMessage());
		}
	}
	
	private void reqAvailColumnList(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException {
		String PageToCall = "";
		LRGA21003 msg = new LRGA21003();
		try {
			
			msg.setStrTables(req.getParameter("tables"));
			
			req.setAttribute("msg", msg);
			PageToCall = "/pages/reporter/s/LRGA210_available_columns_list.jsp";
			callPage(PageToCall, req, res);

		} catch (Exception e) {
			throw new ServletException(e.getClass().getName() + " --> "
					+ e.getMessage());
		}
	}
	
	private void actAvailColumnList(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException {
		String PageToCall = "";
		LRGA21003 msg = new LRGA21003();
		msg.setSearchTable(req.getParameter("searchTable"));
		msg.setStrTables(req.getParameter("tables"));
		
		try {
			msg.setColumnList(SchemaDAO.getInstance().getColumns(msg.getSearchTable()));

			req.setAttribute("msg", msg);
			PageToCall = "/pages/reporter/s/LRGA210_available_columns_list.jsp";
			callPage(PageToCall, req, res);
		} catch (Exception e) {
			throw new ServletException(e.getClass().getName() + " --> "
					+ e.getMessage());
		}		
	}
}
