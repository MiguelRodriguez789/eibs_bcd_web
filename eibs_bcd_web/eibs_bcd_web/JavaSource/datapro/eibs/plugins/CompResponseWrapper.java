package datapro.eibs.plugins;

import java.io.IOException;
import java.io.OutputStreamWriter;
import java.io.PrintWriter;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpServletResponseWrapper;

public class CompResponseWrapper extends HttpServletResponseWrapper{
		private ServletResponseCompressOutputStream compressStream;
		private ServletOutputStream outputStream;
		private HttpServletResponse httpResponse;
		private PrintWriter printWriter;

	  public CompResponseWrapper(HttpServletResponse res) {
	    super(res);
	    httpResponse = res;
	  } 

	    public void finish() 
	    		throws IOException {
	        if (printWriter != null) {
	            printWriter.close();
	        }
	        if (outputStream != null) {
	            outputStream.close();
	        }
	    }
	    
	    @Override
	    public void flushBuffer() throws IOException {
	        if (printWriter != null) {
	            printWriter.flush();
	        }
	        if (outputStream != null) {
	            outputStream.flush();
	        }
	        super.flushBuffer();
	    }

	    @Override
	    public ServletOutputStream getOutputStream() throws IOException {
	        if (printWriter != null) {
	            throw new IllegalStateException("printWriter already defined");
	        }
	        if (outputStream == null) {
	            outputStream = createOutputStream();
	        }
	        return outputStream;
	    }

	    @Override
	    public PrintWriter getWriter() throws IOException {
	        if (outputStream != null) {
	            throw new IllegalStateException("printWriter already defined");
	        }
	        if (printWriter == null) {
	        	outputStream = createOutputStream();
	            printWriter = new PrintWriter(new OutputStreamWriter(outputStream, getResponse().getCharacterEncoding()));
	        }
	        return printWriter;
	    }

	    public  ServletOutputStream  createOutputStream() throws IOException {
	        compressStream = new ServletResponseCompressOutputStream(httpResponse);
	        return compressStream;
	    }

}
