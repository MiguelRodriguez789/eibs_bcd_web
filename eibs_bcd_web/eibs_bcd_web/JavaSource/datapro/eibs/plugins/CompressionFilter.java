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

public class CompressionFilter implements Filter{

    private boolean compressionEnable;
	
	@Override
	public void doFilter(ServletRequest req, ServletResponse res, FilterChain filter)
			throws IOException, ServletException {
		
	    if(res instanceof HttpServletResponse && !res.isCommitted() && compressionEnable){
	    	
	    	HttpServletRequest httpRequest;
            HttpServletResponse httpResponse;
            String acceptedEncoding, accept;
            CompResponseWrapper responseWrapper;
	    	
            httpRequest = (HttpServletRequest) req;
            httpResponse = (HttpServletResponse) res;

            accept = httpRequest.getHeader("accept");
            acceptedEncoding = httpRequest.getHeader("accept-encoding");
            
            if("false".equals(httpRequest.getParameter("gzip"))){
			    filter.doFilter(req, httpResponse);
            	return;
            }else if (acceptedEncoding != null && acceptedEncoding.indexOf("gzip") != -1 && !accept.equals("image/png,image/*;q=0.8,*/*;q=0.5")){
				responseWrapper = new CompResponseWrapper(httpResponse);
			    filter.doFilter(req, responseWrapper);
			    responseWrapper.finish();
			    return; 
			    
            }else{
			    filter.doFilter(req, httpResponse);
            }
			

	    }else{
		    filter.doFilter(req,res);
	    }
		
	}

	@Override
	public void init(FilterConfig filterConfig) 
			throws ServletException {
		compressionEnable = Boolean.valueOf(filterConfig.getInitParameter("compressionEnable"));
	}

	@Override
	public void destroy() {
		// TODO Auto-generated method stub
	}


}
