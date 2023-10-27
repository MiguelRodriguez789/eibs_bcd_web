package datapro.eibs.plugins;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.util.concurrent.atomic.AtomicBoolean;
import java.util.zip.GZIPOutputStream;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;


public class ServletResponseCompressOutputStream extends ServletOutputStream { 
	  protected ByteArrayOutputStream baos = null;
	  protected GZIPOutputStream gzipstream = null;
	  protected HttpServletResponse response = null;
	  protected ServletOutputStream output = null;

	  final AtomicBoolean open;


	  public ServletResponseCompressOutputStream(HttpServletResponse response) throws IOException {
	    super();
	    this.response = response;
	    this.output = response.getOutputStream();
	    open = new AtomicBoolean(true);
	    baos = new ByteArrayOutputStream();
		gzipstream = new GZIPOutputStream(baos);
	  }

	  public void close() throws IOException {
	    if (open.compareAndSet(true, false)){	    
		    gzipstream.finish();
	
		    byte[] bytes = baos.toByteArray();
	
		    response.addHeader("Content-Length", String.valueOf(bytes.length)); 
		    response.addHeader("Content-Encoding", "gzip");
		    output.write(bytes);
		    output.flush();
		    output.close();
	    }
	  }

	  public void flush() throws IOException {
	    if (!open.get()) {
	      throw new IOException("Cannot flush a closed output stream");
	    }
	    gzipstream.flush();
	  }
	  
	  @Override
	  public void write(int b) throws IOException {
	    if (!open.get()) {
	      throw new IOException("Cannot write to a closed output stream");
	    }
	    gzipstream.write((byte)b);
	  }
	  
	  @Override
	  public void write(byte b[]) throws IOException {
		  if (!open.get()) {
			  throw new IOException("Cannot write to a closed output stream");
		  }		  
		  gzipstream.write(b, 0, b.length);
	  }

	  @Override
	  public void write(byte b[], int off, int len) throws IOException {
	    if (!open.get()) {
	      throw new IOException("Cannot write to a closed output stream");
	    }
	    gzipstream.write(b, off, len);
	  }

}
