package pl.pointsprizes.controller.servlets;

import sun.util.logging.resources.logging;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/LogoutServlet")
public class LogoutServlet extends HttpServlet {
    private static final Long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        Cookie[] cookies = request.getCookies();
        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if (cookie.getName().equals("JSESSIONID")) {
                    System.out.println("JSESSIONID=" + cookie.getValue());
                    break;
                }
            }
        }
        //invalidate the session if exists
        HttpSession session = request.getSession(false);
        System.out.println("User=" + session.getAttribute("user"));
        if (session != null) {
            session.invalidate(); //kasuje sesje
        }
        response.sendRedirect("views/login.html");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {



//        <!DOCTYPE web-app PUBLIC
//        "-//Sun Microsystems, Inc.//DTD Web Application 2.3//EN"
//        "http://java.sun.com/dtd/web-app_2_3.dtd" >
//
//<web-app>
//  <display-name>Archetype Created Web Application</display-name>
//        protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//
//        }
//  <filter>
//    <filter-name>RequestLoggingFilter</filter-name>
//    <filter-class>pl.pointsprizes.controller.filters.RequestLoggingFilter</filter-class>
//    <init-param>
//      <param-name>test</param-name>
//      <param-value>testValue</param-value>
//    </init-param>
//  </filter>
//<filter>
//  <filter-name>AuthenticationFilter</filter-name>
//  <filter-class>pl.pointsprizes.controller.filters.AuthenticationFilter</filter-class>
//</filter>
//
//  <filter-mapping>
//    <filter-name>RequestLoggingFilter</filter-name>
//    <url-pattern>/*/</url-pattern>
//
//  </filter-mapping>
//  <filter-mapping>
//    <filter-name>AuthenticationFilter</filter-name>
//    <url-pattern>/*/</url-pattern>
//  </filter-mapping>
//</web-app>

//        # Root logger option
//        log4j.rootLogger=INFO, stdout
//        log4j.logger.AuthenticationFilter=INFO, file, stdout
//        log4j.additivity.AuthenticationFilter=(false)
//
//# Direct log messages to a log file
//        log4j.appender.file=org.apache.log4j.FileAppender
//        log4j.appender.file.File=/home/tomasz/Portfolio/pl.pointsprizes/ logging.log
//        log4j.appender.file.MaxFileSize=10MB
//        log4j.appender.file.MaxBackupIndex=10
//        log4j.appender.file.layout=org.apache.log4j.PatternLayout
//        log4j.appender.file.layout.ConversionPattern=%d{yyyy-MM-dd HH:mm:ss} %-5p %c{1}:%L - %m%n
//
//# Direct log messages to stdout
//        log4j.appender.stdout=org.apache.log4j.ConsoleAppender
//        log4j.appender.stdout.Target=System.out
//        log4j.appender.stdout.layout=org.apache.log4j.PatternLayout
//        log4j.appender.stdout.layout.ConversionPattern=%d{yyyy-MM-dd HH:mm:ss} %-5p %c{1}:%L - %m%n
//
//#Exmaple from: https://www.mkyong.com/logging/log4j-log4j-properties-examples/
    }
}
