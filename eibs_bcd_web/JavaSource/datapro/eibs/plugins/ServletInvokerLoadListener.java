package datapro.eibs.plugins;

import java.io.File;
import java.io.IOException;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.lang.reflect.Modifier;
import java.net.JarURLConnection;
import java.net.URL;
import java.net.URLConnection;
import java.sql.Driver;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.util.zip.ZipEntry;
import java.util.zip.ZipFile;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.http.HttpServlet;

import com.datapro.eibs.facade.FASecurity;
import com.datapro.eibs.security.vo.WEBCO;
import com.datapro.generic.tool.Util;

import datapro.eibs.master.LocateMe;

public class ServletInvokerLoadListener implements ServletContextListener {
	
	private Logger logger = Logger.getLogger(this.getClass().getName());

    /**
     * Invoker parameter that defines the packages to search servlets.
     * Comma separated list of packages
     */
    public static final String PACKAGES_PARAMETER = "invoker.packages";
    
    /**
     * Invoker parameter to setup the mapping name. By default is "/servlet/"
     */
    public static final String INVOKER_PREFIX_PARAMETER = "invoker.prefix";
    
    /**
     * Scans all classes accessible from the context class loader which 
     * belong to the given package and subpackages.
     * 
     * @param packageName
     * @return The list of classes found
     */
    private Set getClasses(String packageName) {
        Set classes = new HashSet();
        try {
            ClassLoader classLoader = Thread.currentThread().getContextClassLoader();
            String path = packageName.replace('.', '/');
            Enumeration resources = classLoader.getResources(path);
            while (resources.hasMoreElements()) {
                URL resource = (URL) resources.nextElement();
                logger.config("URL to resource : " + resource);
                if (resource.getProtocol().equals("jar")
                	|| resource.getProtocol().equals("zip")) {
                    // inside a jar => read the jar files and check
                    findClassesJar(resource, path, classes);
                } else if (resource.getProtocol().startsWith("vfs")) {
                	// inside a vf => read the vf files and check
                	findClassesVF(resource, packageName, classes);
                } else if (resource.getProtocol().equals("file")) {
                    // read subdirectories and find
                    findClassesFile(new File(resource.toURI()), packageName, classes);
                } else {
                	logger.warning("Unknown protocol connection: " + resource);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return classes;
    }
    
    /**
     * Reads a jar file and checks all the classes inside it with the package
     * name specified.
     * 
     * @param resource The resource url
     * @param path
     * @param classes
     * @return 
     */
    private Set findClassesJar(URL resource, String path, Set classes) {
    	URLConnection urlConn = null;
        ZipFile file = null;
        try {
        	urlConn = resource.openConnection();
        	file = ((JarURLConnection) urlConn).getJarFile();
            Enumeration e = file.entries();
            while (e.hasMoreElements()) {
                ZipEntry entry = (ZipEntry) e.nextElement();
                if ((entry.getName().startsWith(path + "/")
                        || entry.getName().startsWith(path + "."))
                        && entry.getName().endsWith(".class")) {
                    String name = entry.getName().replace('/', '.');
                    name = name.substring(0, name.length() - 6);
                    checkClass(name, classes);
                }
            }
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            try {
            	if(file != null) file.close();
            } catch (IOException e) {
            }
        }
        return classes;
    }

    /**
     * Recursive method used to find all classes in a given file (file
     * or directory).
     *
     * @param file   The base directory
     * @param packageName The package name for classes found inside the base directory
     * @ classes The list of classes
     * @return The same classes
     * @throws ClassNotFoundException
     */
    private Set findClassesFile(File file, String packageName, Set classes) {
        if (file.isFile() && file.getName().endsWith(".class")) {
            //classes.add(Class.forName(packageName + '.' + file.getName().substring(0, file.getName().length() - 6)));
            checkClass(packageName.substring(0, packageName.length() - 6), classes);
        } else {
            File[] files = file.listFiles();
            if (files != null) {
            	for (int i = 0; i < files.length; i++) {
            		findClassesFile(files[i], packageName + "." + files[i].getName(), classes);
            	}
			}
        }
        return classes;
    }
    
    private Set findClassesVF(URL resource, String packageName, Set classes) {
    	URLConnection urlConn = null;
        Object file = null;
        try {
        	urlConn = resource.openConnection();
        	file = invokeMethod(urlConn, "getContent");
            List list = (List) invokeMethod(file, "getChildren");
            Iterator e = list.listIterator();
            while (e.hasNext()) {
            	Object entry = invokeMethod(e, "next");
            	String name = (String) invokeMethod(entry, "getName");
                if (name.endsWith(".class")) {
                    checkClass(packageName + "." + name.substring(0, name.length() - 6), classes);
                }
            }
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
        	if(file != null) 
        		invokeMethod(urlConn, "close");
        }
        return classes;
    }
    
	public Object invokeMethod(Object bean, String name){
		try {
			Method method = bean.getClass().getMethod(name,  new Class[]{});
			method.setAccessible(true);
			return method.invoke(bean, new Object[]{});
		} catch (Exception e) {
		}
		return null;
	}
    
    private Set checkClass(String name, Set classes) {
        try {
            Class clazz = Class.forName(name);
            if (HttpServlet.class.isAssignableFrom(clazz)) {
                classes.add(clazz);
            }
        } catch (Throwable e) {
        	logger.severe("Error checking class: " + name);
            e.printStackTrace();
        }
        return classes;
    }
    
	public void contextInitialized(ServletContextEvent sce) {
        logger.info("Context Listener > Initializing (" + sce.getServletContext().getServletContextName() + ")");
        ServletContext sc = sce.getServletContext();
        String list = sc.getInitParameter(PACKAGES_PARAMETER);
        String prefix = sc.getInitParameter(INVOKER_PREFIX_PARAMETER);
        if (prefix == null) {
            prefix = "/servlet/";
        }
        if (list != null) {
            String[] packages = list.split(",");
            for (int i = 0; i < packages.length; i++) {
                String packageName = packages[i].trim();
                if (packageName.length() > 0) {
                	logger.config("Checking package: " + packageName);
                    // load classes under servlet.invoker
                    Set classes = getClasses(packageName);
                    logger.config("Servlet count on package " + packageName + " is: " + classes.size());
                    for (Iterator iterator = classes.iterator(); iterator.hasNext();) {
                    	Class clazz = (Class) iterator.next();
                        String mapping = prefix + clazz.getName();
                        doProgrammaticRegistration(sc, mapping, clazz.getName());						
					}
                }
            }
        }
        if(Boolean.valueOf(sc.getInitParameter("cacheMenu")).booleanValue()){
            buildOptionsMenu(sc);
        }
        if(Boolean.valueOf(sc.getInitParameter("resourceHashing")).booleanValue()){
			try {
				getResourceHashes(sc);
			} catch (IOException e) {
			}
        } 
    } 
 
    private void getResourceHashes(ServletContext sc) throws IOException  {
    	/* For now, resources with Hashed names shall only found in /pages/ directory
    	 * locatMe finds the file; A relative path can be passed and is respected.
    	 * Use URI to create hasmaps of values in AccessVersion Singleton
    	 * */
		LocateMe locateMe = new LocateMe();
    	File file = new File(sc.getRealPath(LocateMe.rootPath));
    	ArrayList<File> directories = locateMe.findDirectories(file);
		String[] hashedResources = Util.split(sc.getInitParameter("hashed_resources"), ",");
		
		for(String resource : hashedResources){
			AccessVersion.mapResource(locateMe.staticFilePath(resource, sc, directories), sc);
		}
	}

	private void doProgrammaticRegistration(ServletContext sc, String mapping,
    	String servletName) {
        try {
            logger.config("Adding '" + servletName + "' in mapping '" + mapping + "'");
            sc.addServlet(servletName, servletName).addMapping(new String[]{mapping});
		} catch (Exception e) {
			logger.info("Error adding servlet: " + servletName);
		}
    }

	public void contextDestroyed(ServletContextEvent sce) {
		//Get a list of all classes loaded by the current webapp classloader
		java.lang.ClassLoader classLoader = (ClassLoader) getClass().getClassLoader();
		Field classLoaderClassesField = null;
		Class clazz = ClassLoader.class;
		while (classLoaderClassesField == null && clazz != null) {
		    try {
		        classLoaderClassesField = clazz.getDeclaredField("classes");
		    } catch (Exception exception) {
		        //do nothing
		    }
		    clazz = clazz.getSuperclass();
		}
		List classes = new ArrayList(); 
		if (classLoaderClassesField != null) {
			classLoaderClassesField.setAccessible(true);
			//new ArrayList((Vector)classLoaderClassesField.get(classLoader));
		}

        Iterator e = classes.listIterator();
        while (e.hasNext()) {
		    Class c = (Class)e.next();
		    //Make sure you identify only the packages that are holding references to the classloader.
		    //Allowing this code to clear all static references will result in all sorts
		    //of horrible things (like java segfaulting).
		    logger.config("className =  '" + c.getName());
		    if (c.getName().startsWith("com.datapro")
		    	|| c.getName().startsWith("datapro")) {
		        //Kill any static references within all these classes.
		    	for (int i = 0; i < c.getDeclaredFields().length; i++) {
		    		Field f = c.getDeclaredFields()[i];
		            if (Modifier.isStatic(f.getModifiers())
		                    && !Modifier.isFinal(f.getModifiers())
		                    && !f.getType().isPrimitive()) {
		                try {
		                    f.setAccessible(true);
		                    f.set(null, null);
		                } catch (Exception exception) {
		                    //Log the exception
		                }
		            }
		        }
		    }
		}

		classes.clear();
		
		deRegisterDrivers();
		
		logger.info("contextDestroyed (" + sce.getServletContext().getServletContextName() + ")");
	}
	
    private void buildOptionsMenu(ServletContext sc) {
    	Map out = new HashMap();
		try {
			FASecurity fa = FASecurity.getInstance();
			List list = fa.getOptionsMenu("S");
			logger.info("Building Options Menu with size: "+list.size());
			Iterator iter = list.listIterator();
			List subMenu = null;
			String current = null;
			WEBCO element = null;
			if (iter.hasNext()) {
				element = (WEBCO) iter.next();
			}
			while (element != null) {
				if (current == null 
					|| !current.equals(element.getCMOCDE())) {
					current = element.getCMOCDE();
					subMenu = new ArrayList();
					out.put(current, subMenu);
				}
				subMenu.add(element);
				if (iter.hasNext()) {
					element = (WEBCO) iter.next();
				} else {
					element = null;
				}
			}
			
		} catch (Exception e) {
			e.printStackTrace();			
		}
		sc.setAttribute("optionMenu", out);
    }
    
	
    private void deRegisterDrivers() {
		
        Enumeration<Driver> drivers = DriverManager.getDrivers();
        final List<Driver> driversList = new ArrayList<Driver>();
      
        while (drivers.hasMoreElements()) {
        	driversList.add(drivers.nextElement());
        }
        
        for (Driver driver : driversList) {
            if (driver.getClass().getClassLoader() != getClass().getClassLoader()) {
                logger.log(Level.INFO, String.format("Not deregistering %s as it does not originate from this webapp", driver));
                continue;
            }        	
        	
            try {
                DriverManager.deregisterDriver(driver);
                logger.log(Level.INFO, String.format("deregistering jdbc driver: %s", driver));
            } catch (SQLException e) {
            	logger.log(Level.SEVERE, String.format("Error deregistering driver %s", driver), e);
            }
        }
	}    
    
}
