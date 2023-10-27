package com.datapro.presentation.taglib;

import java.io.IOException;
import java.lang.reflect.Method;
import java.util.Locale;
import java.util.logging.Level;
import java.util.logging.Logger;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.PageContext;
import javax.servlet.jsp.tagext.BodyTagSupport;
import javax.servlet.jsp.tagext.TagSupport;

import org.apache.commons.beanutils.BeanUtils;

import datapro.eibs.beans.ELEERRMessage;
import datapro.eibs.sockets.MessageField;
import datapro.eibs.sockets.MessageRecord;

public abstract class BaseHandlerTag extends BodyTagSupport {

    private static Logger log = Logger.getLogger(BaseHandlerTag.class.getName());
    protected static final Locale defaultLocale = Locale.getDefault();
    protected String accesskey;
    protected String tabindex;
    protected boolean indexed;
    private String onclick;
    private String ondblclick;
    private String onmouseover;
    private String onmouseout;
    private String onmousemove;
    private String onmousedown;
    private String onmouseup;
    private String onkeydown;
    private String onkeyup;
    private String onkeypress;
    private String onselect;
    private String onchange;
    private String onblur;
    private String onfocus;
    private boolean disabled;
    protected boolean doDisabled;
    private boolean readonly;
    protected boolean doReadonly;
    protected boolean capslock;
	private String style;
    private String styleClass;
    private String styleId;
    private String errorKey;
    private String errorStyle;
    private String errorStyleClass;
    private String errorStyleId;
    private String alt;
    private String altKey;
    private String bundle;
    private String locale;
    private String title;
    private String titleKey;
    private Class loopTagSupportClass;
    private Method loopTagSupportGetStatus;
    private Class loopTagStatusClass;
    private Method loopTagStatusGetIndex;
    private boolean triedJstlInit;
    private boolean triedJstlSuccess;

    public BaseHandlerTag() {
        accesskey = null;
        tabindex = null;
        indexed = false;
        onclick = null;
        ondblclick = null;
        onmouseover = null;
        onmouseout = null;
        onmousemove = null;
        onmousedown = null;
        onmouseup = null;
        onkeydown = null;
        onkeyup = null;
        onkeypress = null;
        onselect = null;
        onchange = null;
        onblur = null;
        onfocus = null;
        disabled = false;
        doDisabled = true;
        readonly = false;
        doReadonly = false;
        style = null;
        styleClass = null;
        styleId = null;
        errorKey = "error";
        errorStyle = null;
        errorStyleClass = null;
        errorStyleId = null;
        alt = null;
        altKey = null;
        bundle = null;
        locale = "locale";
        title = null;
        titleKey = null;
        loopTagSupportClass = null;
        loopTagSupportGetStatus = null;
        loopTagStatusClass = null;
        loopTagStatusGetIndex = null;
        triedJstlInit = false;
        triedJstlSuccess = false;
        capslock = false;
    }

    public void setAccesskey(String accessKey) {
        accesskey = accessKey;
    }

    public String getAccesskey() {
        return accesskey;
    }

    public void setTabindex(String tabIndex) {
        tabindex = tabIndex;
    }

    public String getTabindex() {
        return tabindex;
    }

    public void setIndexed(boolean indexed) {
        this.indexed = indexed;
    }

    public boolean getIndexed() {
        return indexed;
    }

    public void setOnclick(String onClick) {
        onclick = onClick;
    }

    public String getOnclick() {
        return onclick;
    }

    public void setOndblclick(String onDblClick) {
        ondblclick = onDblClick;
    }

    public String getOndblclick() {
        return ondblclick;
    }

    public void setOnmousedown(String onMouseDown) {
        onmousedown = onMouseDown;
    }

    public String getOnmousedown() {
        return onmousedown;
    }

    public void setOnmouseup(String onMouseUp) {
        onmouseup = onMouseUp;
    }

    public String getOnmouseup() {
        return onmouseup;
    }

    public void setOnmousemove(String onMouseMove) {
        onmousemove = onMouseMove;
    }

    public String getOnmousemove() {
        return onmousemove;
    }

    public void setOnmouseover(String onMouseOver) {
        onmouseover = onMouseOver;
    }

    public String getOnmouseover() {
        return onmouseover;
    }

    public void setOnmouseout(String onMouseOut) {
        onmouseout = onMouseOut;
    }

    public String getOnmouseout() {
        return onmouseout;
    }

    public void setOnkeydown(String onKeyDown) {
        onkeydown = onKeyDown;
    }

    public String getOnkeydown() {
        return onkeydown;
    }

    public void setOnkeyup(String onKeyUp) {
        onkeyup = onKeyUp;
    }

    public String getOnkeyup() {
        return onkeyup;
    }

    public void setOnkeypress(String onKeyPress) {
        onkeypress = onKeyPress;
    }

    public String getOnkeypress() {
        return onkeypress;
    }

    public void setOnchange(String onChange) {
        onchange = onChange;
    }

    public String getOnchange() {
        return onchange;
    }

    public void setOnselect(String onSelect) {
        onselect = onSelect;
    }

    public String getOnselect() {
        return onselect;
    }

    public void setOnblur(String onBlur) {
        onblur = onBlur;
    }

    public String getOnblur() {
        return onblur;
    }

    public void setOnfocus(String onFocus) {
        onfocus = onFocus;
    }

    public String getOnfocus() {
        return onfocus;
    }

    public void setDisabled(boolean disabled) {
        this.disabled = disabled;
    }

    public boolean getDisabled() {
        return disabled;
    }
    
    public boolean getCapslock() {
		return capslock;
	}

	public void setCapslock(boolean capslock) {
		this.capslock = capslock;
	}    

    public void setReadonly(boolean readonly) {
        this.readonly = readonly;
    }
    
    public void setReadonly(String readonly) {
        this.readonly = Boolean.valueOf(readonly);
    }

    public boolean getReadonly() {
        return readonly;
    }
    
    public void setStyle(String style) {
        this.style = style;
    }

    public String getStyle() {
        return style;
    }

    public void setStyleClass(String styleClass) {
        this.styleClass = styleClass;
    }

    public String getStyleClass() {
        return styleClass;
    }

    public void setStyleId(String styleId) {
        this.styleId = styleId;
    }

    public String getStyleId() {
        return styleId;
    }

    public String getErrorKey() {
        return errorKey;
    }

    public void setErrorKey(String errorKey) {
        this.errorKey = errorKey;
    }

    public String getErrorStyle() {
        return errorStyle;
    }

    public void setErrorStyle(String errorStyle) {
        this.errorStyle = errorStyle;
    }

    public String getErrorStyleClass() {
        return errorStyleClass;
    }

    public void setErrorStyleClass(String errorStyleClass) {
        this.errorStyleClass = errorStyleClass;
    }

    public String getErrorStyleId() {
        return errorStyleId;
    }

    public void setErrorStyleId(String errorStyleId) {
        this.errorStyleId = errorStyleId;
    }

    public String getAlt() {
        return alt;
    }

    public void setAlt(String alt) {
        this.alt = alt;
    }

    public String getAltKey() {
        return altKey;
    }

    public void setAltKey(String altKey) {
        this.altKey = altKey;
    }

    public String getBundle() {
        return bundle;
    }

    public void setBundle(String bundle) {
        this.bundle = bundle;
    }

    public String getLocale() {
        return locale;
    }

    public void setLocale(String locale) {
        this.locale = locale;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getTitleKey() {
        return titleKey;
    }

    public void setTitleKey(String titleKey) {
        this.titleKey = titleKey;
    }

    public void release() {
        super.release();
        accesskey = null;
        alt = null;
        altKey = null;
        bundle = null;
        errorKey = "error";
        errorStyle = null;
        errorStyleClass = null;
        errorStyleId = null;
        indexed = false;
        locale = "locale";
        onclick = null;
        ondblclick = null;
        onmouseover = null;
        onmouseout = null;
        onmousemove = null;
        onmousedown = null;
        onmouseup = null;
        onkeydown = null;
        onkeyup = null;
        onkeypress = null;
        onselect = null;
        onchange = null;
        onblur = null;
        onfocus = null;
        disabled = false;
        readonly = false;
        style = null;
        styleClass = null;
        styleId = null;
        tabindex = null;
        title = null;
        titleKey = null;
    }
    
    public int getScope(String scopeName) throws JspException {
        if(scopeName == null)
            throw new JspException("Scope should be provided");
        else
            if (scopeName.equals("page")) {
				return 1;
			} else if (scopeName.equals("request")) {
				return 2;
			} else if (scopeName.equals("session")) {
				return 3;
			} else if (scopeName.equals("application")) {
				return 4;
			} else {
	            throw new JspException(" Scope  " + scopeName + " not found");
			}
    }
    
    public Object lookup(PageContext pageContext, String name, String scopeName) throws JspException {
        if(scopeName == null)
            return pageContext.findAttribute(name);
        try {
            return pageContext.getAttribute(name, getScope(scopeName));
        }
        catch(JspException e) {
            throw e;
        }
    }
    
    public Object lookup(PageContext pageContext, String name, String property, String scope) throws JspException {
    	Object bean = null;
        try {
            bean = lookup(pageContext, name, scope);
            if(property == null)
                return null;
			if (bean instanceof MessageRecord) {
				MessageRecord message = (MessageRecord) bean;
				MessageField field = (MessageField) message.getField(property);
				return field.getString();
			} else
				return BeanUtils.getProperty(bean, property);
        }
        catch(Exception e) {
        	if (bean != null) {
                throw new JspException("On Bean " + bean.getClass().getName() + 
                		" : On property " + property + ": " + e.getMessage());				
			}
        }
        return bean;
    }
    
    public String filter(String value) {
        if(value == null || value.length() == 0)
            return value;
        StringBuffer result = null;
        String filtered = null;
        for(int i = 0; i < value.length(); i++) {
            filtered = null;
            switch(value.charAt(i)) {
            case 60: // '<'
                filtered = "&lt;";
                break;

            case 62: // '>'
                filtered = "&gt;";
                break;

            case 38: // '&'
                filtered = "&amp;";
                break;

            case 34: // '"'
                filtered = "&quot;";
                break;

            case 39: // '\''
                filtered = "&#39;";
                break;

            }
            if(result == null) {
                if(filtered != null) {
                    result = new StringBuffer(value.length() + 50);
                    if(i > 0)
                        result.append(value.substring(0, i));
                    result.append(filtered);
                }
            } else
            if(filtered == null)
                result.append(value.charAt(i));
            else
                result.append(filtered);
        }

        return result != null ? result.toString() : value;
    }
    
    public void write(PageContext pageContext, String text) throws JspException {
        JspWriter writer = pageContext.getOut();
        try {
            writer.print(text);
        }
        catch(IOException e) {
            throw new JspException(e.toString());
        }
    }

    protected String message(String literal, String key) throws JspException {
        if(literal != null)
            if(key != null) {
                JspException e = new JspException("common.both");
                throw e;
            } else {
                return literal;
            }
        if(key != null)
            return key;
        else
            return null;
    }

    private Integer getJstlLoopIndex() {
        if(!triedJstlInit) {
            triedJstlInit = true;
            try {
                //loopTagSupportClass = RequestUtils.applicationClass("javax.servlet.jsp.jstl.core.LoopTagSupport");
                loopTagSupportGetStatus = loopTagSupportClass.getDeclaredMethod("getLoopStatus", null);
                //loopTagStatusClass = RequestUtils.applicationClass("javax.servlet.jsp.jstl.core.LoopTagStatus");
                loopTagStatusGetIndex = loopTagStatusClass.getDeclaredMethod("getIndex", null);
                triedJstlSuccess = true;
            }
            catch(Exception ex) { }
        }
        if(triedJstlSuccess)
            try {
                Object loopTag = TagSupport.findAncestorWithClass(this, loopTagSupportClass);
                if(loopTag == null) {
                    return null;
                } else {
                    Object status = loopTagSupportGetStatus.invoke(loopTag, null);
                    return (Integer)loopTagStatusGetIndex.invoke(status, null);
                }
            }
            catch(Exception ex) {
                log.log(Level.SEVERE, ex.getMessage(), ex);
            }
        return null;
    }

    protected void prepareIndex(StringBuffer handlers, String name) throws JspException {
        if(name != null)
            handlers.append(name);
        handlers.append("[");
        handlers.append(getIndexValue());
        handlers.append("]");
        if(name != null)
            handlers.append(".");
    }

    protected int getIndexValue() throws JspException {
        Object iterateTag = null;
        if(iterateTag != null)
        	//return iterateTag.getIndex();
            return 0;
        Integer i = getJstlLoopIndex();
        if(i != null) {
            return i.intValue();
        } else {
            JspException e = new JspException("noEnclosingIterate");
            throw e;
        }
    }

    protected String prepareStyles() throws JspException {
        StringBuffer styles = new StringBuffer();
        boolean errorsExist = doErrorsExist();
        if(errorsExist && getErrorStyleId() != null)
            prepareAttribute(styles, "id", getErrorStyleId());
        else
            prepareAttribute(styles, "id", getStyleId());
        if(errorsExist && getErrorStyle() != null)
            prepareAttribute(styles, "style", getErrorStyle());
        else
            prepareAttribute(styles, "style", getStyle());
        if(errorsExist && getErrorStyleClass() != null)
            prepareAttribute(styles, "class", getErrorStyleClass());
        else
            prepareAttribute(styles, "class", getStyleClass());
        prepareAttribute(styles, "title", message(getTitle(), getTitleKey()));
        prepareAttribute(styles, "alt", message(getAlt(), getAltKey()));
        return styles.toString();
    }

    protected boolean doErrorsExist() throws JspException {
        boolean errorsExist = false;
        if(getErrorStyleId() != null || getErrorStyle() != null || getErrorStyleClass() != null) {
            String actualName = prepareName();
            if(actualName != null) {
                ELEERRMessage errors = (ELEERRMessage) pageContext.getSession().getAttribute("error");
                errorsExist = errors != null && errors.getBigDecimalERRNUM().intValue() > 0;
            }
        }
        return errorsExist;
    }

    protected String prepareName() throws JspException {
        return null;
    }

    protected String prepareEventHandlers() {
        StringBuffer handlers = new StringBuffer();
        prepareMouseEvents(handlers);
        prepareKeyEvents(handlers);
        prepareTextEvents(handlers);
        prepareFocusEvents(handlers);
        return handlers.toString();
    }

    protected void prepareMouseEvents(StringBuffer handlers) {
        prepareAttribute(handlers, "onclick", getOnclick());
        prepareAttribute(handlers, "ondblclick", getOndblclick());
        prepareAttribute(handlers, "onmouseover", getOnmouseover());
        prepareAttribute(handlers, "onmouseout", getOnmouseout());
        prepareAttribute(handlers, "onmousemove", getOnmousemove());
        prepareAttribute(handlers, "onmousedown", getOnmousedown());
        prepareAttribute(handlers, "onmouseup", getOnmouseup());
    }

    protected void prepareKeyEvents(StringBuffer handlers) {
        prepareAttribute(handlers, "onkeydown", getOnkeydown());
        prepareAttribute(handlers, "onkeyup", getOnkeyup());
        prepareAttribute(handlers, "onkeypress", getOnkeypress());
    }

    protected void prepareTextEvents(StringBuffer handlers) {
        prepareAttribute(handlers, "onselect", getOnselect());
        prepareAttribute(handlers, "onchange", getOnchange());
    }

    protected void prepareFocusEvents(StringBuffer handlers) {
        prepareAttribute(handlers, "onblur", getOnblur());
        prepareAttribute(handlers, "onfocus", getOnfocus());
        Object formTag = null;
        if(doDisabled && !getDisabled() || doReadonly && !getReadonly())
            formTag = pageContext.getAttribute("message", 2);
        if(doDisabled) {
            //boolean formDisabled = formTag != null ? formTag.isDisabled() : false;
        	boolean formDisabled = false;
            if(formDisabled || getDisabled())
                handlers.append(" disabled=\"disabled\"");
        }
        if(doReadonly) {
        	//boolean formReadOnly = formTag != null ? formTag.isReadonly() : false;
            boolean formReadOnly = false;
            if(formReadOnly || getReadonly())
                handlers.append(" readonly=\"readonly\"");
        }
    }

    protected void prepareOtherAttributes(StringBuffer stringbuffer) {
    }

    protected void prepareAttribute(StringBuffer handlers, String name, Object value) {
        if(value != null) {
            handlers.append(" ");
            handlers.append(name);
            handlers.append("=\"");
            handlers.append(value);
            handlers.append("\"");
        }
    }

    protected boolean isXhtml() {
        String xhtml = (String)pageContext.getAttribute("XHTML", 1);
        return "true".equalsIgnoreCase(xhtml);
    }

    protected String getElementClose() {
        return isXhtml() ? " />" : ">";
    }

    protected String lookupProperty(String beanName, String property) throws JspException {
        Object bean = null;
        try {
        	bean = lookup(pageContext, beanName, null);
			if (bean instanceof MessageRecord) {
				MessageRecord message = (MessageRecord) bean;
				MessageField field = (MessageField) message.getField(property);
				return field.getString();
			} else
				return BeanUtils.getProperty(bean, property);
        }
        catch(Exception e) {
            if(bean != null){
                throw new JspException("On Bean " + bean.getClass().getName() + 
                	" : On property " + property + ": " + e.getMessage());            	
            }
        }
        return "";
    }

    static Class class$(String x0) {
        try {
            return Class.forName(x0);
        }
        catch(ClassNotFoundException x1) {
            throw new NoClassDefFoundError(x1.getMessage());
        }
    }

}
