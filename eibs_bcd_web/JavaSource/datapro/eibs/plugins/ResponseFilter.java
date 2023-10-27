package datapro.eibs.plugins;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ResponseFilter implements Filter {

	public void init(FilterConfig filterConfig) throws ServletException {
	}
	
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain filterChain)
			throws IOException, ServletException {
		
		if ((request instanceof HttpServletRequest)
			&& (response instanceof HttpServletResponse)) {
			
			HttpServletRequest httpRequest = (HttpServletRequest) request;
			HttpServletResponse httpResponse = (HttpServletResponse) response;
	
	        httpResponse.addHeader("X-Frame-Options", "SAMEORIGIN");
	        httpResponse.addHeader("X-Content-Type-Options", "nosniff");
	        
			filterChain.doFilter(httpRequest, httpResponse);
		}		
	}
	
	public void destroy() {
	}
}
