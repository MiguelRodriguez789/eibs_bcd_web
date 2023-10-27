package com.datapro.presentation.taglib;

import javax.servlet.jsp.JspException;

public class RadioTag extends BaseHandlerTag {

    protected String name;
    protected String property;
    protected String text;
    protected String value;
    protected String idName;

    public RadioTag() {
        name = null;
        property = null;
        text = null;
        value = null;
        idName = null;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getProperty() {
        return property;
    }

    public void setProperty(String property) {
        this.property = property;
    }

    public String getValue() {
        return value;
    }

    public void setValue(String value) {
        this.value = value;
    }

    public String getIdName() {
        return idName;
    }

    public void setIdName(String idName) {
        this.idName = idName;
    }
    
    public int doStartTag() throws JspException {
        String radioTag = renderRadioElement(serverValue(), currentValue());
        write(pageContext, radioTag);
        text = null;
        return 2;
    }

    private String serverValue() throws JspException {
        if(idName == null) {
            return value;
        } else {
            String serverValue = lookupProperty(idName, value);
            return serverValue != null ? serverValue : "";
        }
    }

    private String currentValue() throws JspException {
        String current = lookupProperty(name, property);
        return current != null ? current : "";
    }

    protected String renderRadioElement(String serverValue, String checkedValue) throws JspException {
        StringBuffer results = new StringBuffer("<input type=\"radio\"");
        prepareAttribute(results, "name", prepareName());
        prepareAttribute(results, "accesskey", getAccesskey());
        prepareAttribute(results, "tabindex", getTabindex());
        prepareAttribute(results, "value", serverValue);
        if(serverValue.equals(checkedValue))
            results.append(" checked=\"checked\"");
        results.append(prepareEventHandlers());
        results.append(prepareStyles());
        prepareOtherAttributes(results);
        results.append(getElementClose());
        return results.toString();
    }

    public int doAfterBody() throws JspException {
        if(bodyContent != null) {
            String value = bodyContent.getString().trim();
            if(value.length() > 0)
                text = value;
        }
        return 0;
    }

    public int doEndTag() throws JspException {
        if(text != null)
        	write(pageContext, text);
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
            return property;
        }
    }

    public void release() {
        super.release();
        idName = null;
        name = null;
        property = null;
        text = null;
        value = null;
    }

}
