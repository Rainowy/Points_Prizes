package pl.pointsprizes.controller.filters;

import org.apache.log4j.Logger;
import sun.applet.Main;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.List;

//@WebFilter("/RequestLoggingFilter")
public class RequestLoggingFilter implements Filter {
    public static Logger logger = Logger.getLogger(RequestLoggingFilter.class);
    //private ServletContext context;

    public void destroy() {
    }

    public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");  /**Bez ustawienia kodowania(tego wpisu) brak polskich znaków w LoginServlet do autentykacji = musi być w tym buildzie*/
        //resp.setCharacterEncoding("UTF-8");
        //resp.setContentType("html/text");

        HttpServletRequest request = (HttpServletRequest) req;
        Enumeration<String> params = req.getParameterNames();
        //  req.getParameterNames();
        //req.getParameterMap();


      //  List<String> parameterNames = new ArrayList<String>(req.getParameterMap().keySet());
        while (params.hasMoreElements()) {
            String name = params.nextElement();
            String value = req.getParameter(name);
//            logger.info(req.getRemoteAddr() + "::Request Params:: {" + name + "=" + value + "}");
////            this.context.log(req.getRemoteAddr() + "::Request Params:: {" + name + "=" + value + "}");
        }

        Cookie[] cookies = request.getCookies();
        if (cookies != null) {
            for (Cookie cookie : cookies) {
//                logger.info(req.getRemoteAddr() + "::Cookie::{" + cookie.getName() + "," + cookie.getValue() + "}");
            }
        }
        chain.doFilter(req, resp);
    }

    public void init(FilterConfig config) throws ServletException {
        // this.context = config.getServletContext();
        logger.info("RequestLoggingFilter Initialized");
    }
}
