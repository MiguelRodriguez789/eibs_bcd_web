package com.ibm._jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;


public final class _error extends com.ibm.ws.jsp.runtime.HttpJspBase
     implements com.ibm.ws.jsp.runtime.JspClassInformation {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory()  ;

  private static String[] _jspx_dependants;
  static {
    _jspx_dependants = new String[0];
  }

  public String[] getDependants() {
    return _jspx_dependants;
  }

  private com.ibm.wsspi.webcontainer.annotation.AnnotationHelper _jspx_iaHelper;

  private static String _jspx_classVersion;
  private static boolean _jspx_isDebugClassFile;
  static {
    _jspx_classVersion = new String("unknown");
    _jspx_isDebugClassFile = false;
  }

  public String getVersionInformation() {
    return _jspx_classVersion;
  }
  public boolean isDebugClassFile() {
    return _jspx_isDebugClassFile;
  }

  private boolean _jspx_isJspInited = false;

  private final static char[] _jsp_string1 = "<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.0 Transitional//EN\">\r\n<html>\r\n<head>\r\n<LINK HREF=\"".toCharArray();
  private final static char[] _jsp_string2 = "/pages/style.css\" REL=\"stylesheet\">\r\n<title>Error</title>\r\n<META HTTP-EQUIV=\"Content-Type\" CONTENT=\"text/html; charset=ISO-8859-1\">\r\n<META name=\"GENERATOR\" content=\"IBM WebSphere Page Designer V3.5.2 for Windows\">\r\n<META http-equiv=\"Content-Style-Type\" content=\"text/css\">\r\n\r\n</head>\r\n<body>\r\n<H3 align=\"center\"><img src=\"".toCharArray();
  private final static char[] _jsp_string3 = "/images/e_ibs.gif\" align=\"left\" name=\"EIBS_GIF\" title=\"error\"></H3>\r\n<p/>\r\n<table id=\"tbhelp\" width=100% align=center>\r\n<tr>\r\n    <td align=center colspan=2 >\r\n      \r\n      <table width=\"100%\" border=\"0\" cellspacing=\"2\" cellpadding=\"2\" class=\"tbenter\">\r\n        <tr>\r\n          <td width=\"75\"> \r\n            <div align=\"right\"><font color=\"red\"><img src=\"".toCharArray();
  private final static char[] _jsp_string4 = "/images/warning.gif\"></font></div>\r\n          </td>\r\n          <td>\r\n            <div align=\"center\"><font color=\"#FF3333\" face=\"Arial, Helvetica, sans-serif\" size=\"3\"><b>Error irrecuperable en la aplicación</b></font></div>\r\n          </td>\r\n          <td width=\"75\"><font color=\"red\"><img src=\"".toCharArray();
  private final static char[] _jsp_string5 = "/images/warning.gif\"></font></td>\r\n        </tr>\r\n      </table>\r\n      \r\n      <br>\r\n    \r\n   </td>\r\n</tr>\r\n<tr>\r\n  <td align=\"center\">Un error irrecuperable ha surgido en la aplicación.\r\n  Por favor repórtelo al administrador del sistema.</td>\r\n</tr>\r\n</table>\r\n\r\n<SCRIPT type=\"text/javascript\" >\r\n\tself.focus();\r\n</SCRIPT>\r\n</body>\r\n</html>\r\n\r\n".toCharArray();

  static {
  }

  private javax.el.ExpressionFactory _el_expressionfactory;
  public void _jspInit() {
    _el_expressionfactory = _jspxFactory.getJspApplicationContext(getServletConfig().getServletContext()).getExpressionFactory();

    com.ibm.wsspi.webcontainer.annotation.AnnotationHelperManager _jspx_aHelper = com.ibm.wsspi.webcontainer.annotation.AnnotationHelperManager.getInstance (getServletConfig()    .getServletContext());
    _jspx_iaHelper = _jspx_aHelper.getAnnotationHelper();
    _jspx_isJspInited = true;
  }

  private static org.apache.jasper.runtime.ProtectedFunctionMapper _jspx_fnmap = null;


  public void _jspService(HttpServletRequest request, HttpServletResponse  response)
      throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;

    JspWriter _jspx_out = null;


    if(!_jspx_isJspInited){
      this._jspInit();
    }


    try {

      response.setContentType("text/html");
      pageContext = _jspxFactory.getPageContext(this, request, response, null, true, 8192, true);

      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      pageContext.setAttribute("_jspx_ExpressionFactoryImplObject", _el_expressionfactory);
      out.write(_jsp_string1);
      out.print(request.getContextPath());
      out.write(_jsp_string2);
      out.print(request.getContextPath());
      out.write(_jsp_string3);
      out.print(request.getContextPath());
      out.write(_jsp_string4);
      out.print(request.getContextPath());
      out.write(_jsp_string5);

    } catch (Throwable t) {
      if (!(t instanceof javax.servlet.jsp.SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
        out.clearBuffer();
        if (pageContext != null) pageContext.handlePageException(t);
      }
      else if (t instanceof com.ibm.ws.jsp.runtime.WsSkipPageException){
        ((com.ibm.ws.jsp.runtime.WsSkipPageException)t).printStackTraceIfTraceEnabled();
      }
    } finally {
      _jspxFactory.releasePageContext(pageContext);
    }
  }
}
