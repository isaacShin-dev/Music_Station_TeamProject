/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/9.0.45
 * Generated at: 2021-05-25 13:54:02 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.WEB_002dINF.views.template.client;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class header_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent,
                 org.apache.jasper.runtime.JspSourceImports {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  static {
    _jspx_dependants = new java.util.HashMap<java.lang.String,java.lang.Long>(2);
    _jspx_dependants.put("/WEB-INF/lib/tiles-jsp-3.0.8.jar", Long.valueOf(1621247903980L));
    _jspx_dependants.put("jar:file:/Users/isaac/Documents/isaacProject/TeamProject/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/mtaProject/WEB-INF/lib/tiles-jsp-3.0.8.jar!/META-INF/tld/tiles-jsp.tld", Long.valueOf(1506773284000L));
  }

  private static final java.util.Set<java.lang.String> _jspx_imports_packages;

  private static final java.util.Set<java.lang.String> _jspx_imports_classes;

  static {
    _jspx_imports_packages = new java.util.HashSet<>();
    _jspx_imports_packages.add("javax.servlet");
    _jspx_imports_packages.add("javax.servlet.http");
    _jspx_imports_packages.add("javax.servlet.jsp");
    _jspx_imports_classes = null;
  }

  private volatile javax.el.ExpressionFactory _el_expressionfactory;
  private volatile org.apache.tomcat.InstanceManager _jsp_instancemanager;

  public java.util.Map<java.lang.String,java.lang.Long> getDependants() {
    return _jspx_dependants;
  }

  public java.util.Set<java.lang.String> getPackageImports() {
    return _jspx_imports_packages;
  }

  public java.util.Set<java.lang.String> getClassImports() {
    return _jspx_imports_classes;
  }

  public javax.el.ExpressionFactory _jsp_getExpressionFactory() {
    if (_el_expressionfactory == null) {
      synchronized (this) {
        if (_el_expressionfactory == null) {
          _el_expressionfactory = _jspxFactory.getJspApplicationContext(getServletConfig().getServletContext()).getExpressionFactory();
        }
      }
    }
    return _el_expressionfactory;
  }

  public org.apache.tomcat.InstanceManager _jsp_getInstanceManager() {
    if (_jsp_instancemanager == null) {
      synchronized (this) {
        if (_jsp_instancemanager == null) {
          _jsp_instancemanager = org.apache.jasper.runtime.InstanceManagerFactory.getInstanceManager(getServletConfig());
        }
      }
    }
    return _jsp_instancemanager;
  }

  public void _jspInit() {
  }

  public void _jspDestroy() {
  }

  public void _jspService(final javax.servlet.http.HttpServletRequest request, final javax.servlet.http.HttpServletResponse response)
      throws java.io.IOException, javax.servlet.ServletException {

    if (!javax.servlet.DispatcherType.ERROR.equals(request.getDispatcherType())) {
      final java.lang.String _jspx_method = request.getMethod();
      if ("OPTIONS".equals(_jspx_method)) {
        response.setHeader("Allow","GET, HEAD, POST, OPTIONS");
        return;
      }
      if (!"GET".equals(_jspx_method) && !"POST".equals(_jspx_method) && !"HEAD".equals(_jspx_method)) {
        response.setHeader("Allow","GET, HEAD, POST, OPTIONS");
        response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED, "JSPs only permit GET, POST or HEAD. Jasper also permits OPTIONS");
        return;
      }
    }

    final javax.servlet.jsp.PageContext pageContext;
    javax.servlet.http.HttpSession session = null;
    final javax.servlet.ServletContext application;
    final javax.servlet.ServletConfig config;
    javax.servlet.jsp.JspWriter out = null;
    final java.lang.Object page = this;
    javax.servlet.jsp.JspWriter _jspx_out = null;
    javax.servlet.jsp.PageContext _jspx_page_context = null;


    try {
      response.setContentType("text/html; charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write("<!--좌측 슬라이드바  -->\r\n");
      out.write("\t\t\t  <input type=\"checkbox\" id=\"menuicon\">\r\n");
      out.write("\t\t\t  <label for=\"menuicon\">\r\n");
      out.write("\t\t\t\t  <span></span>\r\n");
      out.write("\t\t\t\t  <span></span>\r\n");
      out.write("\t\t\t\t  <span></span>\r\n");
      out.write("\t\t\t  </label>\r\n");
      out.write("\t\t\t\t  <div class=\"sidebar\">\r\n");
      out.write("\t\t\t\t\t   <div class=\"categori\">\r\n");
      out.write("\t\t\t\t\t\t   <h3>Ballad</h3>\r\n");
      out.write("\t\t\t\t\t\t  \r\n");
      out.write("\t\t\t\t\t\t   <h3>Rock</h3>\r\n");
      out.write("\t\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t\t   <h3>R&B</h3>\r\n");
      out.write("\t\t\t\t\t\t \r\n");
      out.write("\t\t\t\t\t\t   <h3>New Age</h3>\r\n");
      out.write("\t\t\t\t\t\t \r\n");
      out.write("\t\t\t\t\t\t   <h3>Rap/Hiphop</h3>\r\n");
      out.write("\t\t\t\t\t\t   <br><br><hr>\r\n");
      out.write("\t\t\t\t\t\t   <br>\r\n");
      out.write("\t\t\t\t\t\t   <h3>News Board</h3>\r\n");
      out.write("\t\t\t\t\t\t  \r\n");
      out.write("\t\t\t\t\t\t   <h3>Community</h3>\r\n");
      out.write("\t\t\t\t\t\t   <h3>About</h3>\r\n");
      out.write("\t\t\t\t\t   </div>\r\n");
      out.write("\t\t\t\t </div>\r\n");
      out.write("\t\t\t\t <div id=mainhomepagecategori>\r\n");
      out.write("\t\t<div id=\"topcategori\">\r\n");
      out.write("\t\t\t<div id=\"leftcategori\">\r\n");
      out.write("\t\t\t\t<a href=\"eventintro.html\" class=\"1\">MTA 소개</a>\r\n");
      out.write("\t\t\t\t<a href=\"#\" id=\"introhomepage\"class=\"1\">MTA Intro</a>\r\n");
      out.write("\t\t\t</div>\r\n");
      out.write("\t\t\t<div id=\"rightcategori\">\t\r\n");
      out.write("\t\t\t\t<a href=\"#\" id=mypagelogin>로그인</a>\r\n");
      out.write("\t\t\t\t<a href=\"/template/client/mainLayout\" id=mypagebutton>마이페이지</a>\r\n");
      out.write("\t\t\t\t<a href=\"#\">고객센터</a>\r\n");
      out.write("\t\t\t\t<a href=\"#\">공지사항</a>\t\r\n");
      out.write("\t\t\t\t<a href =\"/board/cartList\">장바구니</a>\r\n");
      out.write("\t\t\t</div>\r\n");
      out.write("\t\t</div>\r\n");
      out.write("\t\t\t\t <!-- 메인페이지 제목-->\r\n");
      out.write("\t\t<div id=\"buttoncategori\">\r\n");
      out.write("\t\t\t<div>\r\n");
      out.write("\t\t\t\t<h1>MTA에 오신걸 환영합니다.</h1>\r\n");
      out.write("\t\t\t\t<p>각종 다양한 장르인 음악과 저작권을 팔거나 구입하세요!</p>\r\n");
      out.write("\t\t\t</div>\r\n");
      out.write("\t\t</div>\t\r\n");
      out.write("\t</div>\r\n");
      out.write("\t<hr>\r\n");
      out.write("\t</br><br></br></br>\r\n");
      out.write("\t\t\t\t \r\n");
      out.write("\r\n");
      out.write("\t\t <!-- 우측 슬라이드바  -->\r\n");
      out.write("\t\t \t<label class=\"inner\" id=\"inner\" onclick=\"click_page\">\r\n");
      out.write("\t\t \t<div id=\"logindiv\">\r\n");
      out.write("  \t\t\t\t<div id=\"main_page\">\r\n");
      out.write("  \t\t\t\t\t\r\n");
      out.write("  \t\t\t\t</div>\r\n");
      out.write(" \t\t\t\t<br><br> \t\t\t\r\n");
      out.write("  \t\t\t\t<h1>Sign Up</h1>\r\n");
      out.write("  \t\t\t\t<br><br><hr><br>\r\n");
      out.write("  \t\t\t\t<div id=\"idpwddiv\">\r\n");
      out.write("  \t\t\t\t\t<p id=\"idpwd\">ID</p>\r\n");
      out.write("  \t\t\t\t\t<input type=\"text\" class=\"login\" id=\"id_login\">\r\n");
      out.write("  \t\t\t\t\t<p id=\"idpwd\">Passward</p>\r\n");
      out.write("  \t\t\t\t\t<input type=\"password\" class=\"login\"  id=\"psw_login\">\r\n");
      out.write("  \t\t\t\t<br><br>\r\n");
      out.write("  \t\t\t\t<input type=\"button\" id=\"login_button\" value=\"Log In\">\r\n");
      out.write("  \t\t\t\t<br />\r\n");
      out.write("  \t\t\t\t<br>\r\n");
      out.write("  \t\t\t\t<a href=\"#\" class=\"new_login\" id=\"new_login\">회원가입</a>\r\n");
      out.write("  \t\t\t\t<a href=\"#\" class=\"id.pwd\" id=\"id.pwd\">아이디/비밀번호 찾기</a>\r\n");
      out.write("  \t\t\t\t\r\n");
      out.write("  \t\t\t\t</div>\r\n");
      out.write("  \t\t\t</div>\r\n");
      out.write("  \t\t\t</label>");
    } catch (java.lang.Throwable t) {
      if (!(t instanceof javax.servlet.jsp.SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          try {
            if (response.isCommitted()) {
              out.flush();
            } else {
              out.clearBuffer();
            }
          } catch (java.io.IOException e) {}
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
