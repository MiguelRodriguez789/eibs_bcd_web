package datapro.eibs.tools;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpServletResponseWrapper;

/**
 * This class wraps a HttpServletResponse with a buffered output.
 * You can use this to forward or include a Servlet or JSP page
 * and capture the output from it.
 * 
 * Use getOutput to get the output which was written to the response.
 * Only buffers the Writer. Not the OutputStream !!
 *  
 * @author Joost den Boer
 */
public class BufferedHttpResponseWrapper extends HttpServletResponseWrapper {

	ByteArrayOutputStream baos = null;
	PrintWriter writer = null;
	ServletOutputStream sos = null;

	/**
	 * Constructor for BufferedHttpResponseWrapper.
	 * Create a new buffered Writer
	 * 
	 * @param response The response object to wrap
	 */
	public BufferedHttpResponseWrapper(HttpServletResponse response) {
		super(response);
		baos = new ByteArrayOutputStream();
		sos = new ServletOutputStream() {
			public void write(int b) throws IOException {
				baos.write(b);
			}
			public void write(byte[] b) throws IOException {
				baos.write(b);
			}
			public void write(byte[] b, int off, int len) throws IOException {
				baos.write(b, off, len);
			}
		};
	}

	public ServletOutputStream getOutputStream() throws IOException {
		return sos;
	}

	/**
	 * Return the buffered Writer
	 *  
	 * @see javax.servlet.ServletResponse#getWriter()
	 */
	public PrintWriter getWriter() throws IOException {
		if (writer == null) {
			writer = new PrintWriter(sos);
		}
		return writer;
	}

	/**
	 * Return the output written to the Writer.
	 * To get the output, the Writer must be flushed and closed.
	 * The content is captured by the ByteArrayOutputStream.
	 *  
	 * @return
	 */
	public String getOutput() {
		if (writer != null) {
			writer.flush();
			writer.close();
			writer = null;
		}
		return baos.toString();
	}
}