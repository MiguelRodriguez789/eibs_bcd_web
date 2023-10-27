package datapro.eibs.services;

import java.io.IOException;
import java.io.InputStream;

import com.datapro.generic.beanutil.BeanList;

/**
 * @author erodriguez
 *
 * To change the template for this generated type comment go to
 * Window&gt;Preferences&gt;Java&gt;Code Generation&gt;Code and Comments
 */
public interface FTPWrapper {
	
	public static final int ASCII = 0;

	public static final int BINARY = 2;

	public boolean open() throws IOException;
	
	public void close() throws IOException;
	
	public BeanList getWorkDir() throws IOException;
	
	public BeanList getWorkDir(String ext) throws IOException;
	
	public void download(String filename) throws IOException;
	
	public void upload(String filename) throws IOException;

	public void upload(InputStream fileStream, String fileName) throws IOException;
	
	public boolean delete(String filename) throws IOException;
	
	public boolean makeDir(String directory) throws IOException;
	
	public boolean removeDir(String directory) throws IOException;
	
	public void setServerName(String server);
	
	public void setUserName(String username);
	
	public void setPassword(String password);
	
	public String getRemotePath()  throws IOException;
	
	public String getLocalPath();
	
	public void setLocalPath(String local);
	
	public boolean cdRemotePath(String directory) throws IOException;
	
	public boolean command(String cmd, String params) throws IOException;
	
	public void setFileType(int type);
	
}
