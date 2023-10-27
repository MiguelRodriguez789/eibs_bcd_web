package datapro.eibs.plugins;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.OutputStream;

import javax.servlet.ServletOutputStream;

/**
 * @author fhernandez
 * 
 */
public class ServletOutputStreamWrapper extends ServletOutputStream {
   
	private OutputStream outputStream;
	private ByteArrayOutputStream buffer;
	private RequestWrapper request;
	private ResponseWrapper response;

	public ServletOutputStreamWrapper(OutputStream outputStream, 
		RequestWrapper httpRequest, ResponseWrapper response) throws IOException {
		super();
		buffer = new ByteArrayOutputStream();
		this.outputStream = outputStream;
		this.request = httpRequest;
		this.response = response;
	}
	
	public boolean isClosed() {
		return buffer == null;
	}

	public void write(int b) throws IOException {
		if (response.isChacheable()) {
			buffer.write(b);
		} else {
			outputStream.write(b);
		}
	}
	
	public void write(byte[] b, int off, int len) throws IOException {
		if (response.isChacheable()) {
			buffer.write(b, off, len);
		} else {
			outputStream.write(b, off, len);
		}
	}

	public void write(byte[] b) throws IOException {
		if (response.isChacheable()) {
			buffer.write(b);
		} else {
			outputStream.write(b);
		}
	}
	
	public void close() throws IOException {
		if (response.isChacheable()) {
			if(buffer != null && buffer.size() != 0){
				outputStream.write(response.getAuthorizationMapper().mapURI(
					buffer.toByteArray()).getBytes());
			}
			outputStream.flush();
		}
		buffer = null;
		outputStream.close();
	}
	
	public void writeTo(OutputStream out) throws IOException {
		if (outputStream instanceof ByteArrayOutputStream) {
			out.write(((ByteArrayOutputStream) outputStream).toByteArray());
		}
		out.flush();
	}

	public String toString() {
		return outputStream.toString();
	}
	
}