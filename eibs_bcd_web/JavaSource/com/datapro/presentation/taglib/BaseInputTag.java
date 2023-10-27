package com.datapro.presentation.taglib;

import javax.servlet.jsp.JspException;

public abstract class BaseInputTag extends BaseHandlerTag {

    protected String cols;
    protected String maxlength;
    protected String property;
    protected String rows;
    protected String value;
    protected String id;
    protected String name;

	public BaseInputTag() {
        cols = null;
        maxlength = null;
        property = null;
        rows = null;
        value = null;
        id = null;
        name = null;
    }

    public String getId() {
		 String temp = id == null ? getProperty() : id;
		 return super.getCapslock() ? temp.toUpperCase() : temp ;
	}

	public void setId(String id) {
		this.id = id;
	}

    public String getName() {
        return name ;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getCols() {
        return cols;
    }

    public void setCols(String cols) {
        this.cols = cols;
    }

    public String getMaxlength() {
        return maxlength;
    }

    public void setMaxlength(String maxlength) {
        this.maxlength = maxlength;
    }

    public String getProperty() {
        return property; 
    }

    public void setProperty(String property) {
        this.property = property;
    }

    public String getRows() {
        return rows;
    }

    public void setRows(String rows) {
        this.rows = rows;
    }

    public String getSize() {
        return getCols();
    }

    public void setSize(String size) {
        setCols(size);
    }

    public String getValue() {
        return value;
    }

    public void setValue(String value) {
        this.value = value;
    }

    public int doStartTag() throws JspException {
        return 2;
    }

    public int doEndTag() throws JspException {
        return 6;
    }
    
    protected String prepareName() throws JspException {
        if(property == null)
            return null;
        if(indexed) {
            StringBuffer results = new StringBuffer();
            prepareIndex(results, name);
            results.append(property);
            return results.toString();
        } else {
            return super.getCapslock() ? property.toUpperCase() : property;
        }
    }

    public void release() {
        super.release();
        id = null;
        name = null;
        cols = null;
        maxlength = null;
        property = null;
        rows = null;
        value = null;
    }

}
