package com.datapro.presentation.tree;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspTagException;
import javax.servlet.jsp.tagext.TagSupport;

import com.datapro.generic.beanutil.BeanList;
import com.datapro.generic.beanutil.BeanProxy;

/**
 * @author ogarcia
 *
 */

public class TLIcon  extends TagSupport {
	
// attribute to be assigned by field name mapping
	private String fn_fileName="";
	private String fn_fileNameRollOver="";
	private String fn_alt="";
	private String fn_url="";
	private String fn_target="";
	private String fn_otherProperties="";
	private String fn_appendToOnClick="";
	private String fn_appendToOnMouseOver="";
	private String fn_appendToOnMouseOut="";
	
// attribute filled by value
	private String v_fileName="";
	private String v_fileNameRollOver="";
	private String v_alt="";
	private String v_url="";
	private String v_target="";
	private String v_otherProperties="";
	private String v_appendToOnClick="";
	private String v_appendToOnMouseOver="";
	private String v_appendToOnMouseOut="";

	/**
	 * @see javax.servlet.jsp.tagext.Tag#doStartTag()
	 */
	public int doStartTag() throws JspException {
		TLTree parentTagObject = (TLTree)findAncestorWithClass(this,TLTree.class);
		if(parentTagObject==null){
			throw new JspTagException("Improper use of <icon> tag.");
		}
		else{
			try{
				BeanList iconMappingList = parentTagObject.getIconMappingList();
				JBIconMetaData iconMD = new JBIconMetaData();
					if(!fn_fileName.equals(""))
						iconMD.setFn_fileName(fn_fileName);
					else if(!v_fileName.equals(""))
						iconMD.setV_fileName(v_fileName);
					if(!fn_fileNameRollOver.equals(""))
						iconMD.setFn_fileNameRollOver(fn_fileNameRollOver);
					else if(!v_fileNameRollOver.equals(""))
						iconMD.setV_fileNameRollOver(v_fileNameRollOver);
					if(!fn_alt.equals(""))
						iconMD.setFn_alt(fn_alt);
					else if(!v_alt.equals(""))
						iconMD.setV_alt(v_alt);
					if(!fn_url.equals(""))
						iconMD.setFn_url(fn_url);
					else if(!v_url.equals(""))
						iconMD.setV_url(v_url);
					if(!fn_target.equals(""))
						iconMD.setFn_target(fn_target);
					else if(!v_target.equals(""))
						iconMD.setV_target(v_target);
					if(!fn_otherProperties.equals(""))
						iconMD.setFn_otherProperties(fn_otherProperties);
					else if(!v_otherProperties.equals(""))
						iconMD.setV_otherProperties(v_otherProperties);
					if(!fn_appendToOnClick.equals(""))
						iconMD.setFn_appendToOnClick(fn_appendToOnClick);
					else if(!v_appendToOnClick.equals(""))
						iconMD.setV_appendToOnClick(v_appendToOnClick);
					if(!fn_appendToOnMouseOver.equals(""))
						iconMD.setFn_appendToOnMouseOver(fn_appendToOnMouseOver);
					else if(!v_appendToOnMouseOver.equals(""))
						iconMD.setV_appendToOnMouseOver(v_appendToOnMouseOver);
					if(!fn_appendToOnMouseOut.equals(""))
						iconMD.setFn_appendToOnMouseOut(fn_appendToOnMouseOut);
					else if(!v_appendToOnMouseOut.equals(""))
						iconMD.setV_appendToOnMouseOut(v_appendToOnMouseOut);
				iconMappingList.addRow(iconMD);
			}catch(Exception e){
				System.out.println("Error icon-tag process.");
			}
		}
		return (EVAL_BODY_INCLUDE);
	}

	/**
	 * @see javax.servlet.jsp.tagext.Tag#doEndTag()
	 */
	public int doEndTag() throws JspException {
		return (EVAL_PAGE);
	}


// getters and setters

	/**
	 * Returns the fn_alt.
	 * @return String
	 */
	public String getFn_alt() {
		return fn_alt;
	}

	/**
	 * Returns the fn_appendToOnClick.
	 * @return String
	 */
	public String getFn_appendToOnClick() {
		return fn_appendToOnClick;
	}

	/**
	 * Returns the fn_appendToOnMouseOut.
	 * @return String
	 */
	public String getFn_appendToOnMouseOut() {
		return fn_appendToOnMouseOut;
	}

	/**
	 * Returns the fn_appendToOnMouseOver.
	 * @return String
	 */
	public String getFn_appendToOnMouseOver() {
		return fn_appendToOnMouseOver;
	}

	/**
	 * Returns the fn_fileName.
	 * @return String
	 */
	public String getFn_fileName() {
		return fn_fileName;
	}

	/**
	 * Returns the fn_fileNameRollOver.
	 * @return String
	 */
	public String getFn_fileNameRollOver() {
		return fn_fileNameRollOver;
	}

	/**
	 * Returns the fn_otherProperties.
	 * @return String
	 */
	public String getFn_otherProperties() {
		return fn_otherProperties;
	}

	/**
	 * Returns the fn_target.
	 * @return String
	 */
	public String getFn_target() {
		return fn_target;
	}

	/**
	 * Returns the fn_url.
	 * @return String
	 */
	public String getFn_url() {
		return fn_url;
	}

	/**
	 * Returns the v_alt.
	 * @return String
	 */
	public String getV_alt() {
		return v_alt;
	}

	/**
	 * Returns the v_appendToOnClick.
	 * @return String
	 */
	public String getV_appendToOnClick() {
		return v_appendToOnClick;
	}

	/**
	 * Returns the v_appendToOnMouseOut.
	 * @return String
	 */
	public String getV_appendToOnMouseOut() {
		return v_appendToOnMouseOut;
	}

	/**
	 * Returns the v_appendToOnMouseOver.
	 * @return String
	 */
	public String getV_appendToOnMouseOver() {
		return v_appendToOnMouseOver;
	}

	/**
	 * Returns the v_fileName.
	 * @return String
	 */
	public String getV_fileName() {
		return v_fileName;
	}

	/**
	 * Returns the v_fileNameRollOver.
	 * @return String
	 */
	public String getV_fileNameRollOver() {
		return v_fileNameRollOver;
	}

	/**
	 * Returns the v_otherProperties.
	 * @return String
	 */
	public String getV_otherProperties() {
		return v_otherProperties;
	}

	/**
	 * Returns the v_target.
	 * @return String
	 */
	public String getV_target() {
		return v_target;
	}

	/**
	 * Returns the v_url.
	 * @return String
	 */
	public String getV_url() {
		return v_url;
	}

	/**
	 * Sets the fn_alt.
	 * @param fn_alt The fn_alt to set
	 */
	public void setFn_alt(String fn_alt) {
		this.fn_alt = fn_alt;
	}

	/**
	 * Sets the fn_appendToOnClick.
	 * @param fn_appendToOnClick The fn_appendToOnClick to set
	 */
	public void setFn_appendToOnClick(String fn_appendToOnClick) {
		this.fn_appendToOnClick = fn_appendToOnClick;
	}

	/**
	 * Sets the fn_appendToOnMouseOut.
	 * @param fn_appendToOnMouseOut The fn_appendToOnMouseOut to set
	 */
	public void setFn_appendToOnMouseOut(String fn_appendToOnMouseOut) {
		this.fn_appendToOnMouseOut = fn_appendToOnMouseOut;
	}

	/**
	 * Sets the fn_appendToOnMouseOver.
	 * @param fn_appendToOnMouseOver The fn_appendToOnMouseOver to set
	 */
	public void setFn_appendToOnMouseOver(String fn_appendToOnMouseOver) {
		this.fn_appendToOnMouseOver = fn_appendToOnMouseOver;
	}

	/**
	 * Sets the fn_fileName.
	 * @param fn_fileName The fn_fileName to set
	 */
	public void setFn_fileName(String fn_fileName) {
		this.fn_fileName = fn_fileName;
	}

	/**
	 * Sets the fn_fileNameRollOver.
	 * @param fn_fileNameRollOver The fn_fileNameRollOver to set
	 */
	public void setFn_fileNameRollOver(String fn_fileNameRollOver) {
		this.fn_fileNameRollOver = fn_fileNameRollOver;
	}

	/**
	 * Sets the fn_otherProperties.
	 * @param fn_otherProperties The fn_otherProperties to set
	 */
	public void setFn_otherProperties(String fn_otherProperties) {
		this.fn_otherProperties = fn_otherProperties;
	}

	/**
	 * Sets the fn_target.
	 * @param fn_target The fn_target to set
	 */
	public void setFn_target(String fn_target) {
		this.fn_target = fn_target;
	}

	/**
	 * Sets the fn_url.
	 * @param fn_url The fn_url to set
	 */
	public void setFn_url(String fn_url) {
		this.fn_url = fn_url;
	}

	/**
	 * Sets the v_alt.
	 * @param v_alt The v_alt to set
	 */
	public void setV_alt(String v_alt) {
		this.v_alt = v_alt;
	}

	/**
	 * Sets the v_appendToOnClick.
	 * @param v_appendToOnClick The v_appendToOnClick to set
	 */
	public void setV_appendToOnClick(String v_appendToOnClick) {
		this.v_appendToOnClick = v_appendToOnClick;
	}

	/**
	 * Sets the v_appendToOnMouseOut.
	 * @param v_appendToOnMouseOut The v_appendToOnMouseOut to set
	 */
	public void setV_appendToOnMouseOut(String v_appendToOnMouseOut) {
		this.v_appendToOnMouseOut = v_appendToOnMouseOut;
	}

	/**
	 * Sets the v_appendToOnMouseOver.
	 * @param v_appendToOnMouseOver The v_appendToOnMouseOver to set
	 */
	public void setV_appendToOnMouseOver(String v_appendToOnMouseOver) {
		this.v_appendToOnMouseOver = v_appendToOnMouseOver;
	}

	/**
	 * Sets the v_fileName.
	 * @param v_fileName The v_fileName to set
	 */
	public void setV_fileName(String v_fileName) {
		this.v_fileName = v_fileName;
	}

	/**
	 * Sets the v_fileNameRollOver.
	 * @param v_fileNameRollOver The v_fileNameRollOver to set
	 */
	public void setV_fileNameRollOver(String v_fileNameRollOver) {
		this.v_fileNameRollOver = v_fileNameRollOver;
	}

	/**
	 * Sets the v_otherProperties.
	 * @param v_otherProperties The v_otherProperties to set
	 */
	public void setV_otherProperties(String v_otherProperties) {
		this.v_otherProperties = v_otherProperties;
	}

	/**
	 * Sets the v_target.
	 * @param v_target The v_target to set
	 */
	public void setV_target(String v_target) {
		this.v_target = v_target;
	}

	/**
	 * Sets the v_url.
	 * @param v_url The v_url to set
	 */
	public void setV_url(String v_url) {
		this.v_url = v_url;
	}

}