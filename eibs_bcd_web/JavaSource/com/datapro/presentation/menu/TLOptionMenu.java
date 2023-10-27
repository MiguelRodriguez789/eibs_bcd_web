package com.datapro.presentation.menu;

import java.util.List;
import java.util.Map;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.TagSupport;

import com.datapro.eibs.security.vo.WEBCO;

import datapro.eibs.master.Util;

/**
 * @author fhernandez
 *
 */

public class TLOptionMenu extends TagSupport {

	private static final long serialVersionUID = -7866992043161781692L;
	private String name = "";
	private String style = "";
	
	/**
	 * @see javax.servlet.jsp.tagext.Tag#doStartTag()
	 */
	public int doStartTag() throws JspException {
		try {
			JspWriter out = pageContext.getOut();
			ServletRequest pageRequest = pageContext.getRequest();
			
			if (getName() == null || getName().equals("")) {
				if (pageRequest instanceof HttpServletRequest) {
					HttpServletRequest request = (HttpServletRequest) pageRequest;
					WEBCO menuOption = currentOption(request);
					
					if (menuOption != null) {
						setName(menuOption.getCMOCDE());
					}
				}				
			}			
			out.println(
					"<script type=\"text/javascript\" src=\""+ pageContext.getServletContext().getContextPath() 
						+ "/pages/s/javascripts/optMenu.jsp\"></script>");
			out.println("<script type=\"text/javascript\">");
			out.println("builtNewMenu(\'" + getName() + "\');");
			out.println("initMenu();");
			out.println("</script>");

		} catch (Exception ex) {
		}
		return (SKIP_BODY);
	}
	
	private WEBCO currentOption(HttpServletRequest request) throws Exception {
		HttpSession session = request.getSession(false);
		
		WEBCO menuOption = null;
		if (request.getParameter("optMenuId") != null 
			&& request.getParameter("index") != null) {
			List options = currentMenu(request);
			if (options != null) {
				menuOption = (WEBCO) options.get(Util.parseInt(request.getParameter("index")));
				if (session.getAttribute("optionMenuRequested") == null) {
					session.setAttribute("optionMenuRequested", menuOption);
				}
			}
		} else {
			menuOption = (WEBCO) session.getAttribute("optionMenuRequested");
		}
		return menuOption;
	}
	
	private List currentMenu(HttpServletRequest request) throws Exception {
		HttpSession session = request.getSession(false);
		Map optionMenu = (Map) session.getAttribute("optionMenu");
		if (optionMenu == null) {
			optionMenu = (Map) pageContext.getServletContext().getAttribute("optionMenu");
		}
		List options = (List) optionMenu.get(request.getParameter("optMenu"));
		return options;
	}
	
	/**
	 * @see javax.servlet.jsp.tagext.Tag#doEndTag()
	 */
	public int doEndTag() {
		return (EVAL_PAGE);
	}

	/**
	 * Returns the name.
	 * @return String
	 */
	public String getName() {
		return name;
	}

	/**
	 * Sets the name.
	 * @param name The name to set
	 */
	public void setName(String name) {
		this.name = name;
	}

	/**
	 * @return Returns the style.
	 */
	public String getStyle() {
		return (style == null || style.equals(""))? "" : style;
	}
	/**
	 * @param style The style to set.
	 */
	public void setStyle(String style) {
		this.style = style;
	}
	
	public void release() {
		super.release();
		name = "";
		style = "";
	}
}