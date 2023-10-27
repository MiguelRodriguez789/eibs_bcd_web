package com.datapro.presentation.taglib;

import javax.servlet.jsp.JspException;

public abstract class BaseFieldTag extends BaseInputTag {

    protected String accept;
    protected boolean redisplay;
    protected String type;

    public BaseFieldTag() {
        accept = null;
        redisplay = true;
        type = null;
    }

    public String getAccept() {
        return accept;
    }

    public void setAccept(String accept) {
        this.accept = accept;
    }

    public boolean getRedisplay() {
        return redisplay;
    }

    public void setRedisplay(boolean redisplay) {
        this.redisplay = redisplay;
    }

    public int doStartTag() throws JspException {
    	try {
            write(pageContext, renderInputElement());
            return 2;			
		} catch (JspException e) {
			throw e;
		} catch (Exception e) {
            throw new JspException("With property " + property + ": " + e.getMessage());
		}
    }

    protected String renderInputElement() throws JspException {
        StringBuffer results = new StringBuffer("<input");
        prepareAttribute(results, "type", type);
        prepareAttribute(results, "id", getId());
        prepareAttribute(results, "name", prepareName());
        prepareAttribute(results, "accesskey", getAccesskey());
        prepareAttribute(results, "accept", getAccept());
        prepareAttribute(results, "maxlength", getMaxlength());
        prepareAttribute(results, "size", getCols());
        prepareAttribute(results, "tabindex", getTabindex());
        prepareValue(results);
        results.append(prepareEventHandlers());
        results.append(prepareStyles());
        prepareOtherAttributes(results);
        results.append(getElementClose());
        return results.toString();
    }

    protected void prepareValue(StringBuffer results) throws JspException {
        results.append(" value=\"");
        if(super.value != null)
            results.append(formatValue(super.value));
        else
        if(redisplay || !"password".equals(type)) {
            Object value = lookup(pageContext, name, property, null);
            results.append(formatValue(value));
        }
        results.append('"');
    }

    protected String formatValue(Object value) throws JspException {
        if(value == null)
            return "";
        else
            return filter(value.toString());
    }

    public void release() {
        super.release();
        accept = null;
        name = "message";
        redisplay = true;
    }
}
