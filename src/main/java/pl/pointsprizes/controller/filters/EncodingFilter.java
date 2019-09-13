package pl.pointsprizes.controller.filters;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import java.io.IOException;

//@WebFilter("/*")
public class EncodingFilter implements Filter {
    private String charsetEncoding = "UTF-8";
    private String contentType = "text/html";

    public void destroy() {
    }

    public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain) throws ServletException, IOException {
        chain.doFilter(req, resp);
        req.setCharacterEncoding(charsetEncoding);
        resp.setContentType(contentType);
        resp.setCharacterEncoding(charsetEncoding);

    }

    public void init(FilterConfig config) throws ServletException {
        String encodingParam = config.getInitParameter("charsetEncoding");
        String charsetParam = config.getInitParameter("contentType");
        if (encodingParam != null && charsetParam != null) {
            contentType = encodingParam;
            charsetEncoding = charsetParam;
        }
    }
}


