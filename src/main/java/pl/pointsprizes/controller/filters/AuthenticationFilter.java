package pl.pointsprizes.controller.filters;

import org.apache.log4j.Logger;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

//@WebFilter("/AuthenticationFilter")
public class AuthenticationFilter implements Filter {
    public static Logger logger = Logger.getLogger(AuthenticationFilter.class);

    //private ServletContext context;

    public void init(FilterConfig fConfig) throws ServletException {
        //.context = fConfig.getServletContext();
        logger.info("AuthenticationFilter initialized");
        // this.context.log("AuthenticationFilter initialized");

    }

    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {

        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse res = (HttpServletResponse) response;

        String uri = req.getRequestURI();
        logger.info("Requested Resource::" + uri);

        HttpSession session = req.getSession(false);

        if (session == null && !(uri.endsWith("html") || uri.endsWith("LoginServlet"))) {
            logger.info("Unauthorized access request");
            res.sendRedirect("/loginBAKU.html");
        } else {
            // pass the request along the filter chain
            chain.doFilter(request, response);
        }


    }


    public void destroy() {
        //close any resources here
    }

}