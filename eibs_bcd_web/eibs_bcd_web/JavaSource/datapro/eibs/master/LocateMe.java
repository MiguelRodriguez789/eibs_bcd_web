package datapro.eibs.master;

import java.io.File;
import java.net.MalformedURLException;
import java.net.URI;
import java.net.URL;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

import javax.servlet.ServletContext;

import org.apache.commons.lang.StringUtils;


/**
 * This class can be used to return an object current application
 * root file-system path to the /classes directory or the object directory.
 * if not object is provided LocateMe is the target object.
 * @author: Frank Hernandez
 */
public class LocateMe {
	private Object obj = null;
	private URL url = null;
	public static final String rootPath = JSEIBSProp.getRootPath().substring(0, StringUtils.ordinalIndexOf(JSEIBSProp.getRootPath(),"/",2));
	public static final Logger logger = Logger.getLogger(LocateMe.class.getName());
	public LocateMe () {
		obj = this;
		setUrl("");
	}

	public LocateMe (Object obj) {
		this.obj = obj;
		setUrl("");
	}
	
	public LocateMe (String resourceName) {
		obj = this;
		setUrl(resourceName);
	}
	
	public LocateMe (Object obj, String resourceName) {
		this.obj = obj; 
		setUrl(resourceName);
	}
	
	private Object getObj() {
		return obj;
	}
	
	private Class getTargetClass() {
		return getObj() == null ? LocateMe.class.getClass() : getObj().getClass();
	}
	
	public void setUrl(URL url) {
		this.url = url;
	}
	
	public void setUrl(String resourceName){
		url = getTargetClass().getResource(resourceName);
		if (url == null) {
			String tmp = resourceName;
			for (int i = 0; i < 5; i++) {
				tmp = "../" + tmp;
				url = getTargetClass().getResource(tmp);
				if (url != null) break;
			}
		}
		if (url == null) url = getTargetClass().getResource("");
		if (url == null) url = getTargetClass().getResource("LocateMe.class");
	}
	
	public URL getUrl(){
		return url;
	}
	
	private String getPackagePath(){
		String myPackage = "";
		myPackage = getTargetClass().getPackage().getName();
		myPackage = myPackage.replace('.', '/') + "/";
		return myPackage;
	}	
	
	public String getClassesRoot(){
		String sClassesRoot = "";
		if (getWarPath().equals("")) {
			String sClassPath = getClassPath();
			sClassesRoot = sClassPath.substring(0, sClassPath.length() - getPackagePath().length());
			if (sClassesRoot.lastIndexOf('/') != (sClassesRoot.length() - 1)) sClassesRoot = sClassesRoot + "/";
		} else {
			sClassesRoot = getWarPath()+"/WEB-INF/classes/";
		}
		logger.log(Level.CONFIG ,"Classes Root Path = " + sClassesRoot);
		return sClassesRoot; 
	}
	
	public String getClassPath(){
		try {
			return getUrl() != null ? getUrl().getPath() : "";
			//return getUrl() != null ? (new URI(getUrl().toString()).getPath()) : "";
			//return getUrl() != null ? (URLDecoder.decode(getUrl().getPath(), "UTF-8")) : "";
		} catch (Exception e) {
			return "";
		}
	}
	
	public String getWarPath(){
		String path = "";
		if (getClassPath().indexOf("WEB-INF") > -1) {
			String nm = getClassPath();
			path = nm.substring(0, nm.indexOf("WEB-INF") - 1);
		}
		return path;
	}
	
	public String getEarPath(){
		String path = "";
		if (!getWarPath().equals("")) {
			String nm = getWarPath();
			path = nm.substring(0, nm.lastIndexOf("/"));
		} else if(getClassPath().indexOf(".jar") > -1){
			String classpath = getClassPath();
			String nm = classpath.substring(0, classpath.indexOf(".jar"));
			path = classpath.substring(0, nm.lastIndexOf("/"));
		} 
		return path;
	}
	
	public ArrayList<File> findDirectories(File dir){
        ArrayList<File> resultList = new ArrayList<File>();
        // get all the files from a directory
        File[] fList = dir.listFiles();
        resultList.add(dir);
        if(null != fList){
	        for (File file : fList) {
	            if (file.isFile()) {
	            } else if (file.isDirectory()) {
	                resultList.addAll(findDirectories(file));
	            }
	        }
        }
        return resultList;

	}

	public String getEarMetaFolderPath(){
		String path = "";
		if (!getEarPath().equals(""))
			path = getEarPath() + "/META-INF/";
		logger.log(Level.CONFIG ,"EAR META-INF Path = " + path);
		return path;
	}
	
	public String getWarMetaFolderPath(){
		String path = "";
		if (!getWarPath().equals(""))
			path = getWarPath() + "/META-INF/";
		logger.log(Level.CONFIG ,"WAR META-INF Path = " + path);
		return path;
	}
	
	public boolean checkFile(String pathname) {
		File file = new File(pathname.replaceFirst("file:", ""));
		boolean result = file.exists() && file.isFile(); 
		if (file.exists() && file.isFile()) {
			logger.log(Level.CONFIG ,"URL is : " + pathname);
		} else {
			logger.log(Level.CONFIG ,"Path Not Found = " + pathname);
		}
		return result;
	}
	
	private String filePath(String pathname) {
		String result = "";
		if (pathname.charAt(0) == '/') {
			result = "file:" + pathname.substring(1);
		} else {
			result = pathname;
		}
		return result;
	}
	
	public URL fileUrl(String fName){
		LocateMe locateMe = new LocateMe(fName);
		URL url = null;
		try {
			if (checkFile(fName))
				return new URL(filePath(fName));
			if (checkFile(locateMe.getEarMetaFolderPath() + fName)) 
				return new URL(filePath(locateMe.getEarMetaFolderPath() + fName));
			if (checkFile(locateMe.getWarMetaFolderPath() + fName)) 
				return new URL(filePath(locateMe.getWarMetaFolderPath() + fName));
			if (checkFile(locateMe.getClassesRoot() + fName)) 
				return new URL(filePath(locateMe.getClassesRoot() + fName));
			if (checkFile(locateMe.getUrl().getPath())) 
				return locateMe.getUrl();
			if (checkFile(fName)) 
				return new URL(fName);
		} catch (MalformedURLException e) {
			
		}
		return url;
	}	
	
	public URI staticFilePath(String fName, ServletContext sc){
		/*Search StaticFiles only in /pages*/
		LocateMe locateMe = new LocateMe(fName);
		File file = new File(sc.getRealPath(rootPath));
		ArrayList<File> list = locateMe.findDirectories(file);
		String path = null;
		URI uri = null;
		
		if (checkFile(sc.getRealPath(fName))){
			return URI.create(fName);
		} else {
			for (File fl : list) {
				if (checkFile(fl.getAbsolutePath() + fl.separator + fName)){
					path = URI.create(fl.toURI() + fName).toString();
					return URI.create(path.substring(path.indexOf(rootPath)));
				}
			}
		}
		return uri;
	}
	
	public URI staticFilePath(String fName, ServletContext sc, ArrayList<File> ls){
		/*Search StaticFiles only in /pages*/
		ArrayList<File> list = ls;
		String path = null;
		URI uri = null;
		
		if (checkFile(sc.getRealPath(fName))){
			return URI.create(fName);
		} else {
			for (File fl : list) {
				if (checkFile(fl.getAbsolutePath() + fl.separator + fName)){
					path = URI.create(fl.toURI() + fName).toString();
					return URI.create(path.substring(path.indexOf(rootPath)));
				}
			}
		}
		return uri;
	}	
	
}
