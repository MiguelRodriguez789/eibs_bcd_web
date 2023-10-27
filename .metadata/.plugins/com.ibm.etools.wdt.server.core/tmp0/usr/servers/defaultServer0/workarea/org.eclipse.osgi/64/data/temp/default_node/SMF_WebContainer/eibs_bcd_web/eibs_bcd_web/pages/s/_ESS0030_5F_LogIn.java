package com.ibm._jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

import java.util.logging.*;

public final class _ESS0030_5F_LogIn extends com.ibm.ws.jsp.runtime.HttpJspBase
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

  private final static char[] _jsp_string1 = "\r\n".toCharArray();
  private final static char[] _jsp_string2 = "\r\n\r\n".toCharArray();
  private final static char[] _jsp_string3 = "\r\n\r\n<!DOCTYPE html>\r\n<html>\r\n<title>Login Page</title>\r\n<head>\r\n<meta http-equiv=\"Cache-Control\" content=\"no-cache, no-store, must-revalidate\" />\r\n<meta http-equiv=\"Pragma\" content=\"no-cache\" />\r\n<meta http-equiv=\"Expires\" content=\"0\" />\r\n\r\n<SCRIPT SRC=\"".toCharArray();
  private final static char[] _jsp_string4 = "/pages/s/javascripts/eIBS.js\"> </SCRIPT>\r\n<SCRIPT SRC=\"".toCharArray();
  private final static char[] _jsp_string5 = "/pages/s/javascripts/events.js\"> </SCRIPT>\r\n\t\r\n<style>\r\n/* Basics */\r\nhtml, body {\r\n    /*background: url(\"".toCharArray();
private final static char[] _jsp_string6 = "/images/background2.png\");\r\n  \tbackground-size: 657px 445px;\r\n  \tbackground-repeat: no-repeat;\r\n  \tbackground-attachment: fixed;\r\n    background-position: center; */\r\n}\r\nh2{\r\n  font-family: \"Arial\", Helvetica, sans-serif;\r\n  font-size: 13px;\r\n  color: #d0122d;\r\n  font-weight: bold;\r\n  background: #dbdbdb;\r\n  text-align: center;\r\n  margin: 0;\r\n  padding: 15px;\r\n}\r\n#container {\r\n  background: url(\"".toCharArray();
private final static char[] _jsp_string7 = "/images/background2.png\");\r\n    background-size: 657px 445px;\r\n    background-repeat: no-repeat;\r\n    /*background-attachment: fixed;*/\r\n    background-position: center; \r\n    position: absolute;\r\n    top: 0;\r\n    left: 0;\r\n    right: 0;\r\n    bottom: 0;\r\n    margin: auto;\r\n    width: 657px;\r\n    height: 445px;\r\n    /*width: 340px;\r\n    height: 220px;*/\r\n    /*top: 75%;\r\n    left: 50%;\r\n    margin-top: -140px;\r\n    margin-left: -170px;*/\r\n    \r\n/*    border-radius: 3px;\r\n    border: 1px solid #d0122d;\r\n    box-shadow: 0 1px 2px rgba(0, 0, 0, .1);*/\r\n\r\n}\r\nform {\r\n    width: 450px;\r\n    position: relative;\r\n    \r\n    background: #fff;\r\n    left: 0px;\r\n    right: 0px;\r\n    margin: auto;\r\n    box-shadow: 3px 4px 10px #333;\r\n    border:2px solid #f3f3f3;\r\n}\r\n\r\nlabel {\r\n    color: #555;\r\n    display: inline-block;\r\n    margin-left: 18px;\r\n    padding-top: 1px;\r\n    font-size: 12px;\r\n    font-weight: bold;\r\n}\r\np a {\r\n    font-size: 12px;\r\n    color: #aaa;\r\n    float: right;\r\n    margin-top: -13px;\r\n    margin-right: 20px;\r\n -webkit-transition: all .4s ease;\r\n    -moz-transition: all .4s ease;\r\n    transition: all .4s ease;\r\n}\r\np a:hover {\r\n    color: #555;\r\n}\r\nlabel{\r\n  font-family: \"Arial\", Helvetica, sans-serif;\r\n  font-size: 12px;\r\n}\r\ninput {\r\n    font-family: \"Arial\", Helvetica, sans-serif;\r\n    font-size: 12px;\r\n    border: 1px solid #d0122d;\r\n    box-shadow: none;\r\n}\r\ninput[type=text],\r\ninput[type=password] ,input[type=time]{\r\n    color: #777;\r\n    padding-left: 10px;\r\n    margin: 10px;\r\n    margin-top: 5px;\r\n    margin-left: 18px;\r\n    width: 290px;\r\n    height: 25px;\r\n    border: 1px solid #e8e8e8;\r\n    border-radius: 2px;\r\n    -webkit-transition: all .4s ease;\r\n    -moz-transition: all .4s ease;\r\n    transition: all .4s ease;\r\n    }\r\ninput[type=text]:hover,\r\ninput[type=password]:hover,input[type=time]:hover {\r\n    border: 1px solid #d0122d;\r\n}\r\ninput[type=text]:focus,\r\ninput[type=password]:focus,input[type=time]:focus {\r\n    border: 1px solid #d0122d;\r\n}\r\n#lower {\r\n/*    background: #dbdbdb;\r\n    width: 100%;\r\n    height: 65px;\r\n    margin-top: 20px;\r\n    box-shadow: inset 0 1px 1px #fff;\r\n    border-top: 1px solid #ccc;\r\n    border-bottom-right-radius: 3px;\r\n    border-bottom-left-radius: 3px;*/\r\n}\r\ninput[type=checkbox] {\r\n    margin-left: 20px;\r\n    margin-top: 30px;\r\n}\r\n.check {\r\n    margin-left: 3px;\r\n    font-size: 11px;\r\n    color: #444;\r\n    text-shadow: 0 1px 0 #fff;\r\n}\r\n.campos-inline input[type=submit] {\r\n  display: inline-block;\r\n  margin-left: 2px;\r\n  padding: 10px;\r\n  color: #fff;\r\n  background: #d0122d\r\n    /*float: right;\r\n    margin-right: 20px;\r\n    margin-top: 5px;\r\n    width: 80px;\r\n    height: 30px;\r\n    font-size: 12px;\r\n    font-weight: Arial bold;\r\n    color: #ffffff;\r\n    background-color: #d0122d ;\r\n    background-image: -webkit-gradient(linear, left top, left bottom, from(#dbdbdb), to(#bcbcbc));\r\n    background-image: -moz-linear-gradient(top left 90deg, #dbdbdb 0%, #bcbcbc 100%);\r\n    background-image: linear-gradient(top left 90deg, #dbdbdb 0%, #bcbcbc 100%);\r\n    border-radius: 30px;\r\n    border: 1px solid #d0122d;\r\n    cursor: pointer;*/\r\n}\r\n/*input[type=submit]:hover {\r\n    background-image: -webkit-gradient(linear, left top, left bottom, from(#dbdbdb), to(#bcbcbc));\r\n    background-image: -moz-linear-gradient(top left 90deg, #dbdbdb 0%, #bcbcbc 100%);\r\n    background-image: linear-gradient(top left 90deg, #dbdbdb 0%, #bcbcbc 100%);\r\n}\r\ninput[type=submit]:active {\r\n    background-image: -webkit-gradient(linear, left top, left bottom, from(#dbdbdb), to(#bcbcbc));\r\n    background-image: -moz-linear-gradient(top left 90deg, #dbdbdb 0%, #bcbcbc 100%);\r\n    background-image: linear-gradient(top left 90deg, #dbdbdb 0%, #bcbcbc 100%);\r\n}*/\r\n\r\n.header {\r\n  position: fixed;\r\n  top: 0;\r\n  left: 0;\r\n  width: 100%;\r\n  padding-bottom: 10px;  \r\n  z-index: 10; \r\n  background: #FFFFFF;\r\n  -webkit-box-shadow: 0 7px 8px rgba(0, 0, 0, 0.12);\r\n  -moz-box-shadow: 0 7px 8px rgba(0, 0, 0, 0.12);\r\n  box-shadow: 0 7px 8px rgba(0, 0, 0, 0.12);\r\n}\r\n\r\n .footer{\r\n  position: fixed;\r\n  bottom:0;\r\n  left: 0;\r\n  width: 100%;\r\n  padding-bottom: 10px;  \r\n  z-index: 10; \r\n  background: #FFFFFF;\r\n  -webkit-box-shadow: 0 7px 8px rgba(0, 0, 0, 0.12);\r\n  -moz-box-shadow: 0 7px 8px rgba(0, 0, 0, 0.12);\r\n  box-shadow: 0 7px 8px rgba(0, 0, 0, 0.12);\r\n}\r\n\r\n.imgHeader{\r\n  font-size: 0;\r\n  margin-left: auto;\r\n  margin-right: auto;\r\n  text-align:center;\r\n}\r\n\r\n.imgFooter{\r\n  font-size: 0;\r\n  margin-left: auto;\r\n  margin-right: auto;\r\n  text-align:right;\r\n}\r\n.campos-inline{\r\n  margin-bottom: 20px;\r\n}\r\n.campos-inline label, .campos-inline input{\r\n  display: inline-block;\r\n  vertical-align: middle;\r\n  margin: 0;\r\n  padding: 0;\r\n}\r\n.campos-inline label{\r\n  width: 30%;\r\n}\r\n.campos-inline input{\r\n  width: 67%;\r\n}\r\n.formulario-login{\r\n  margin: 2px;\r\n  border: 1px solid #d0122d;\r\n}\r\n.formulario-login > div{\r\n  padding: 20px 60px 10px;\r\n}\r\n.form-header {\r\n    height: 30px;\r\n    background: #f3f3f3;\r\n}\r\n.circulo{\r\n  width: 5px;\r\n  height: 5px;\r\n  display: inline-block;\r\n  vertical-align: middle;\r\n  border-radius: 50%;\r\n  margin-top: 5px;\r\n}\r\n.c-rojo{\r\n  background: #f5a2a2;\r\n}\r\n.c-verde{\r\n  background: #46ec6d;\r\n}\r\n.c-gris{\r\n  background: #cacaf9;\r\n}\r\n.login-isotipo{\r\n  text-align: center;\r\n  padding-top: 25px;\r\n}\r\n\r\n\r\n\r\n</style>\r\n</head>\r\n\t <body> \r\n\t\t".toCharArray();
  private final static char[] _jsp_string8 = "<!-- Begin Page Content -->".toCharArray();
  private final static char[] _jsp_string9 = "\r\n\t\t<div class=\"header\"  style=\"background-color: #d01f2f; text-align: left; \">\r\n\t\t  <h1 class=\"header__content-text\"></h1>\r\n\t\t  \t<div class=\"imgHeader\" style=\"padding: 0 20px; text-align: left;\">\r\n\t\t      <img src=\"".toCharArray();
  private final static char[] _jsp_string10 = "/images/de/bancompartir-logo-header.png\" >\r\n\t      \t</div>\r\n\t\t</div>\t\t\r\n\t\t<br>\t\r\n\t\t<div id=\"container\">\r\n      <div class=\"login-isotipo\">\r\n        <img src=\"".toCharArray();
  private final static char[] _jsp_string11 = "/images/bancompartir_isotipo.png\" width=\"130px\" >\r\n      </div>\r\n\t\t\t<form METHOD=\"post\" ACTION=\"".toCharArray();
  private final static char[] _jsp_string12 = "/servlet/datapro.eibs.menu.JSESS0030\">\r\n      <div class=\"form-header\">\r\n        <span class=\"circulo c-rojo\"></span>\r\n        <span class=\"circulo c-verde\"></span>\r\n        <span class=\"circulo c-gris\"></span>\r\n      </div>\r\n        <div class=\"formulario-login\">\r\n          <h2>LOGIN</h2>\r\n          <div>\r\n    \t\t\t  <INPUT TYPE=\"hidden\" NAME=\"Language\" VALUE=\"s\">\r\n    \t\t\t  <INPUT TYPE=\"hidden\" NAME=\"LOGIN\" VALUE=\"NO\">\r\n    \t\t\t  <INPUT TYPE=\"hidden\" NAME=\"option-menu\" VALUE=\"".toCharArray();
  private final static char[] _jsp_string13 = "\">\r\n    \t\t\t\t<label for=\"loginmsg\" style=\"color:hsla(0,100%,50%,0.5); font-family: \"Arial\" ,Helvetica,sans-serif;\">\r\n    \t\t\t   ".toCharArray();
  private final static char[] _jsp_string14 = "\r\n    \t\t\t\t\t ".toCharArray();
  private final static char[] _jsp_string15 = " \r\n    \t\t\t\t".toCharArray();
  private final static char[] _jsp_string16 = "\t\r\n    \t\t\t\t</label>\r\n    \t\t\t\t<div class=\"campos-inline\">\r\n              <label for=\"username\">Usuario:</label>\r\n              <input type=\"text\" id=\"UserId\" name=\"UserId\" SIZE=\"18\" MAXLENGTH=\"10\" placeholder=\"Escribe tu usuario\" >\r\n            </div>\r\n    \t\t\t\t<div class=\"campos-inline\">\r\n              <label for=\"password\">Contrase&ntilde;a:</label>\r\n              <input type=\"password\" id=\"Password\" name=\"Password\" autocomplete=\"off\" SIZE=\"18\" MAXLENGTH=20 placeholder=\"Escribe tu contrase&ntilde;a\" >\r\n            </div>\r\n\t\t\t\t\t\t  <div id=\"lower\" class=\"campos-inline\"><label></label><input type=\"submit\" value=\"Login\"></div>\r\n          </div>\r\n        </div>\r\n\t\t\t</form>\r\n\t\t</div>\r\n\t\t<div class=\"footer\">\r\n\t\t  <h1 class=\"footer__content-text\"></h1>\r\n\t\t  \t<div class=\"imgFooter\">\r\n\t\t  \t\t<div class=\"imgFooter\">\r\n\t\t      \t\t<img src=\"".toCharArray();
  private final static char[] _jsp_string17 = "/images/login eibs.gif\"  align=left>\r\n\t\t      \t\t<img src=\"".toCharArray();
  private final static char[] _jsp_string18 = "/images/login_datapro.gif\" >\r\n\t\t      \t\t<img src=\"".toCharArray();
  private final static char[] _jsp_string19 = "/images/login_datapro_2.gif\" >\r\n\t\t      \t</div>\r\n\t      \t</div>\r\n\t\t</div>\t\t\t\r\n\t".toCharArray();
  private final static char[] _jsp_string20 = "<!--/ container-->".toCharArray();
  private final static char[] _jsp_string21 = "\r\n\t".toCharArray();
  private final static char[] _jsp_string22 = "<!-- End Page Content -->".toCharArray();
  private final static char[] _jsp_string23 = "\r\n\t\r\n<script type=\"text/javascript\">\r\n   if (checkCookie(\"eibs\")) {\r\n   \t\tdeleteCookie(\"eibs\");\r\n   }\r\n\r\n  document.forms[0].UserId.focus();\r\n  document.forms[0].UserId.select();\r\n</script>\t\r\n\t</body>\r\n</html>\r\n".toCharArray();

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
      
      response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1.
      response.setHeader("Pragma", "no-cache"); // HTTP 1.0.
      response.setHeader("Expires", "0"); // Proxies.
      Logger.getLogger(this.getClass().getName()).log(Level.FINEST,"TIME ESS0030LOGIN :" + System.currentTimeMillis());
      out.write(_jsp_string2);
      datapro.eibs.beans.ELEERRMessage error = null;
      synchronized (request) {
        error = (datapro.eibs.beans.ELEERRMessage) pageContext.getAttribute("error", PageContext.REQUEST_SCOPE);
        if (error == null) {
          error =  new datapro.eibs.beans.ELEERRMessage();
          pageContext.setAttribute("error", error, PageContext.REQUEST_SCOPE);
        }
      }
      out.write(_jsp_string3);
      out.print(request.getContextPath());
      out.write(_jsp_string4);
      out.print(request.getContextPath());
      out.write(_jsp_string5);
      out.print(request.getContextPath());
      out.write(_jsp_string6);
      out.print(request.getContextPath());
      out.write(_jsp_string7);
      out.write(_jsp_string8);
      out.write(_jsp_string9);
      out.print(request.getContextPath());
      out.write(_jsp_string10);
      out.print(request.getContextPath());
      out.write(_jsp_string11);
      out.print(request.getContextPath());
      out.write(_jsp_string12);
      out.print( request.getParameter("option-menu") != null ? request.getParameter("option-menu") : "" );
      out.write(_jsp_string13);
        if (error != null && !error.getERRNUM().equals("0")  ) {
        out.write(_jsp_string14);
        out.print( error.getERDS01());
        out.write(_jsp_string15);
       } 
      out.write(_jsp_string16);
      out.print(request.getContextPath());
      out.write(_jsp_string17);
      out.print(request.getContextPath());
      out.write(_jsp_string18);
      out.print(request.getContextPath());
      out.write(_jsp_string19);
      out.write(_jsp_string20);
      out.write(_jsp_string21);
      out.write(_jsp_string22);
      out.write(_jsp_string23);

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
