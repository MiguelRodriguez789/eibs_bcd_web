package datapro.eibs.services;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.StringTokenizer;
import java.util.logging.Logger;

import org.apache.commons.net.ftp.FTPClient;
import org.apache.commons.net.ftp.FTPFile;
import org.apache.commons.net.ftp.FTPReply;

import com.datapro.generic.beanutil.BeanList;


/**
 * @author erodriguez
 *
 * To change the template for this generated type comment go to
 * Window&gt;Preferences&gt;Java&gt;Code Generation&gt;Code and Comments
 */
public class FTPStdWrapper implements FTPWrapper {
	
	private static final Logger log = Logger.getLogger(FTPStdWrapper.class.getName()); 
	
	private String server; 
	private String username; 
	private String password; 
	private String local;
	private int port = 21;
	private int filetype;
	
	private FTPClient ftp;

	public FTPStdWrapper() {
		super();
	}

	public FTPStdWrapper(String server, String username, String password, String local) {
		this();
		this.server = server;
		this.username = username;
		this.password = password;
		this.local = local;
		this.filetype = BINARY;
	}
	
	public FTPStdWrapper(String server, String username, String password, String local, int port) {
		this();
		this.server = server;
		this.username = username;
		this.password = password;
		this.local = local;
		this.port = port;
		this.filetype = BINARY;
	}
	
	public boolean open() throws IOException {
		if (ftp == null) {
			ftp = new FTPClient();
		}
		log.info("Connecting to " + server + ":"+port);
		ftp.connect(server);
		// Use passive mode as default because most of us are
        // behind firewalls these days.
		ftp.enterLocalPassiveMode();
		// After connection attempt, you should check the reply code to verify success.
        int reply = ftp.getReplyCode();
        if (!FTPReply.isPositiveCompletion(reply)) {
            ftp.disconnect();
            log.info("FTP server refused connection.");
            return false;
        } else {
        	if (ftp.login(username, password)) {
        		log.info("Remote system is " + ftp.getSystemName());
           		return true;
        	} else {
        		return false;
        	}
        }	
	}
	
	public void close() throws IOException {
		if (ftp.isConnected()) {
			if (ftp.logout()) {
				ftp.disconnect();
				log.info("Connection closed.");
			}
		}
	}
	
	public BeanList getWorkDir() throws IOException {
		BeanList result = new BeanList();
		//String [] files = ftp.listNames(getRemotePath());
		FTPFile[] files = ftp.listFiles();
		for (int i = 0; i < files.length; i++) {
			FTPFile file = files[i];
			result.addRow(file.getName());
		}
		return result;
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
	
	public void download(String filename, OutputStream output) throws IOException {
		try {
			ftp.setFileType(filetype);
			ftp.retrieveFile(filename, output);
		} finally {	
			if (output != null) output.close();
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
			ftp.setFileType(filetype);
			ftp.retrieveFile(filename, output);
		} finally {	
			if (output != null) output.close();
		}	
	}

	public void download(String remoteName, String localName) throws IOException {
		OutputStream output = null;
		try {
			File file = new File(getLocalPath(), localName);
			try {
				output = new FileOutputStream(file);
			} catch (FileNotFoundException e) {
				if (file.createNewFile()) {
					output = new FileOutputStream(file);
				} else {
					throw new IOException("Can't create file. Please contact your network administrator.");
				}
			}
			ftp.setFileType(filetype);
			ftp.retrieveFile(remoteName, output);
		} finally {	
			if (output != null) output.close();
		}	
	}

	public void upload(String filename) throws IOException {
		File file = new File(local, filename);
		upload(new FileInputStream(file), filename);
	}
	
	public void upload(InputStream input, String filename) throws IOException {
		try {
			ftp.setFileType(filetype);
			ftp.storeFile(filename, input);
		} finally {	
			if (input != null) input.close();
		}	
	}
	
	public boolean delete(String filename) throws IOException {
		return ftp.deleteFile(filename);
	}
	
	public boolean makeDir(String directory) throws IOException {
		return ftp.makeDirectory(directory);
	}

	public boolean removeDir(String directory) throws IOException {
		return removeDirectory(ftp, directory, "");
	}

	public int getFiletype() {
		return filetype;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public boolean cdRemotePath(String directory) throws IOException {
		return ftp.changeWorkingDirectory(directory);
	}

	public boolean command(String cmd, String params) throws IOException {
		// TODO Auto-generated method stub
		return false;
	}

	public String getRemotePath() throws IOException {
		return ftp.printWorkingDirectory();
	}

	public void setLocalPath(String local) {
		this.local = local;
	}

	public void setServerName(String server) {
		this.server = server;
	}

	public void setUserName(String username) {
		this.username = username;
	}

	public String getLocalPath() {
		return local == null ? "" : local;
	}

	public void setFileType(int type) {
		this.filetype = type;
	}

    private boolean removeDirectory(FTPClient ftpClient, String parentDir,
            String currentDir) throws IOException {
    	
    	boolean removed = false;
    	
        String dirToList = parentDir;
        if (!currentDir.equals("")) {
            dirToList += "/" + currentDir;
        }
 
        FTPFile[] subFiles = ftpClient.listFiles(dirToList);
 
        if (subFiles != null && subFiles.length > 0) {
            for (FTPFile aFile : subFiles) {
                String currentFileName = aFile.getName();
                if (currentFileName.equals(".") || currentFileName.equals("..")) {
                    // skip parent directory and the directory itself
                    continue;
                }
                String filePath = parentDir + "/" + currentDir + "/"
                        + currentFileName;
                if (currentDir.equals("")) {
                    filePath = parentDir + "/" + currentFileName;
                }
 
                if (aFile.isDirectory()) {
                    // remove the sub directory
                    removeDirectory(ftpClient, dirToList, currentFileName);
                } else {
                    // delete the file
                    boolean deleted = ftpClient.deleteFile(filePath);
                    if (deleted) {
                    	log.info("DELETED the file: " + filePath);
                    } else {
                    	log.info("CANNOT delete the file: " + filePath);
                    }
                }
            }
            // finally, remove the directory itself
            removed = ftpClient.removeDirectory(dirToList);
            if (removed) {
            	log.info("REMOVED the directory: " + dirToList);
            } else {
            	log.info("CANNOT remove the directory: " + dirToList);
            }
        }
        return removed;
    }
}
