package datapro.eibs.services;

/**
 * @author erodriguez
 *
 * To change the template for this generated type comment go to
 * Window&gt;Preferences&gt;Java&gt;Code Generation&gt;Code and Comments
 */
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.Properties;
import java.util.StringTokenizer;
import java.util.Vector;

import com.datapro.generic.beanutil.BeanList;
import com.jcraft.jsch.Channel;
import com.jcraft.jsch.ChannelSftp;
import com.jcraft.jsch.JSch;
import com.jcraft.jsch.JSchException;
import com.jcraft.jsch.Session;
import com.jcraft.jsch.SftpException;

public class SFTPStdWrapper implements FTPWrapper {

	private String server; 
	private String username; 
	private String password; 
	private String local;
	private int port = 22; //Default port;
	private int filetype;
	
	private JSch jsch;
	private Session session;
	private Channel channel;
	private ChannelSftp ftp;
	
	
	public SFTPStdWrapper() {
		super();
		this.jsch = new JSch();
	}

	public SFTPStdWrapper(String server, String username, String password, String local) {
		super();
		this.server = server;
		this.username = username;
		this.password = password;
		this.local = local;
		this.jsch = new JSch();
	}

	public SFTPStdWrapper(String server, String username, String password, String local, int port) {
		super();
		this.server = server;
		this.username = username;
		this.password = password;
		this.local = local;
		this.port = port;
		this.jsch = new JSch();
	}

	public boolean cdRemotePath(String directory) throws IOException {
		try {
			ftp.cd(directory);
			return true;
		} catch (SftpException e) {
			e.printStackTrace();
			return false;
		}
	}

	public void close() throws IOException {
		ftp.exit();
		channel.disconnect();
		session.disconnect();
	}

	public boolean command(String cmd, String params) throws IOException {
		// TODO Auto-generated method stub
		return false;
	}

	public boolean delete(String filename) throws IOException {
		try {
			ftp.rm(filename);
			return true;
		} catch (SftpException e) {
			e.printStackTrace();
			return false;
		}
	}

	public void download(String filename) throws IOException {
		OutputStream output = null;
		try {
			File file = new File(getLocalPath(), filename);
			try {
				output = new FileOutputStream(file);
			} catch (FileNotFoundException e) {
				if (file.createNewFile()) {
					output = new FileOutputStream(file);
				} else {
					throw new IOException("Can't create file. Please contact your network administrator.");
				}
			}
			ftp.get(filename, output);
		} catch (SftpException e) {
			e.printStackTrace();
			throw new IOException(e.getMessage());
		} finally {	
			if (output != null) output.close();
		}	
	}

	public String getLocalPath() {
		return local == null ? "" : local;
	}

	public String getRemotePath() throws IOException {
		try {
			return ftp.pwd();
		} catch (SftpException e) {
			e.printStackTrace();
			throw new IOException(e.getMessage());
		}
	}

	public BeanList getWorkDir() throws IOException {
		BeanList result = new BeanList();
		try {
			Vector files = ftp.ls(getRemotePath());
			if (files != null) {
				for (int i = 0; i < files.size(); i++) {
					Object obj = files.elementAt(i);
					if (obj instanceof ChannelSftp.LsEntry) {
						String fileName = ((ChannelSftp.LsEntry) obj).getFilename();
						result.addRow(fileName);
					}	
				}	
			}
			return result;
		} catch (SftpException e) {
			e.printStackTrace();
			throw new IOException(e.getMessage());
		}
	}


	public BeanList getWorkDir(String ext) throws IOException {
		BeanList result = new BeanList();
		BeanList files = getWorkDir();
		files.initRow();
		while (files.getNextRow()) {
			String name = (String) files.getRecord();
			String extension = name.lastIndexOf(".") < 0 ? "" : name.trim().substring(name.trim().lastIndexOf("."));
			if (!extension.equals("")) {
				for (StringTokenizer st = new StringTokenizer(ext, "|"); st.hasMoreElements();) {
					if (extension.toLowerCase().equals(st.nextToken().toLowerCase())) {
						result.addRow(name);
					}
				}
			}				
		}	
		return result;
	}

	public boolean makeDir(String directory) throws IOException {
		try {
			ftp.mkdir(directory);
			return true;
		} catch (SftpException e) {
			e.printStackTrace();
			return false;
		}
	}

	public boolean open() throws IOException {
		try {
			session = jsch.getSession(username, server, port);
			session.setPassword(password);
			Properties config = new Properties();
			config.put("StrictHostKeyChecking", "no");
			session.setConfig(config);
			session.connect();
			channel = session.openChannel("sftp");
			channel.connect();
			ftp = (ChannelSftp) channel;
			return true;
		} catch (JSchException e) {
			e.printStackTrace();
			return false;
		}
	}

	public boolean removeDir(String directory) throws IOException {
		try {
			ftp.rmdir(directory);
			return true;
		} catch (SftpException e) {
			e.printStackTrace();
			return false;
		}
	}

	public void setFileType(int type) {
		this.filetype = type;
	}

	public void setLocalPath(String local) {
		this.local = local;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public void setServerName(String server) {
		this.server = server;
	}

	public void setUserName(String username) {
		this.username = username;
	}

	public void upload(String filename) throws IOException {
		try {
			File file = new File(filename);
			ftp.put(new FileInputStream(file), file.getName());
		} catch (SftpException e) {
			e.printStackTrace();
			throw new IOException(e.getMessage());
		}
	}

	public void upload(InputStream fileStream, String fileName)
			throws IOException {
		try {
			ftp.put(fileStream, fileName);
		} catch (SftpException e) {
			e.printStackTrace();
			throw new IOException(e.getMessage());
		}

	}

	public void setPort(int port) {
		this.port = port;
	}

}
