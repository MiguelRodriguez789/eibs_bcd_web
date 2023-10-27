
package com.datapro.eibs.internet.beans;

import com.datapro.exception.ServiceLocatorException;
import com.datapro.services.ServiceLocator;
import java.io.PrintStream;
import java.sql.*;

// Referenced classes of package com.datapro.eibs.internet.beans:
//            JBGroupItemsList

public class JBGroupItems
{

    public JBGroupItems()
    {
        ENTITYID = "";
        grpitmlistbean = new JBGroupItemsList();
    }

    public String getENTITYID()
    {
        return ENTITYID;
    }

    public void setENTITYID(String newValue)
    {
        ENTITYID = newValue;
    }

    public JBGroupItemsList getGroupItemsList()
    {
        return grpitmlistbean;
    }

    public void setGroupItemsList(JBGroupItemsList newlist)
    {
        grpitmlistbean = newlist;
    }

    public JBGroupItemsList getDBGroupItemsList(int GRPID)
    {
        Connection cnx = null;
        try
        {
            cnx = ServiceLocator.getInstance().getDBConn("MSS");
            Statement st = cnx.createStatement();
            ResultSet rs = st.executeQuery("SELECT * from DC_USRGRPITM where GRPID = " + GRPID + " ORDER BY MMID, CMID");
            boolean GoIn = rs.next();
            grpitmlistbean.init();
            for(; GoIn; GoIn = rs.next())
                grpitmlistbean.addRow(rs.getString("ENTITYID").trim(), rs.getInt("GRPID"), rs.getInt("MMID"), rs.getInt("CMID"), rs.getInt("APPLEVEL"), rs.getDouble("LMTAMNT"));

            rs.close();
        }
        catch(SQLException e)
        {
            System.out.println("Exception e : " + e);
        }
        catch(ServiceLocatorException e)
        {
            System.out.println("Exception e : " + e);
        }
        finally
        {
            try
            {
                cnx.close();
            }
            catch(SQLException e)
            {
                System.out.println("Exception e : " + e);
            }
        }
        return grpitmlistbean;
    }

    public int getNewGroupID()
    {
        int grpid = 1;
        Connection cnx = null;
        try
        {
            cnx = ServiceLocator.getInstance().getDBConn("MSS");
            Statement st = cnx.createStatement();
            ResultSet rs = st.executeQuery("SELECT GRPID from DC_USRGRPITM ORDER BY GRPID DESC");
            if(rs.next())
                grpid = rs.getInt("GRPID") + 1;
            rs.close();
        }
        catch(SQLException e)
        {
            System.out.println("Exception e : " + e);
        }
        catch(ServiceLocatorException e)
        {
            System.out.println("Exception e : " + e);
        }
        finally
        {
            try
            {
                cnx.close();
            }
            catch(SQLException e)
            {
                System.out.println("Exception e : " + e);
            }
        }
        return grpid;
    }

    public boolean UpdateGroupItems(int GRPID)
    {
        boolean sqlerror = false;
        sqlerror = DeleteGroupItems(GRPID);
        sqlerror = AddGroupItems();
        return sqlerror;
    }

    public boolean DeleteGroupItems(int GRPID)
    {
        boolean sqlerror = false;
        Connection cnx = null;
        try
        {
            cnx = ServiceLocator.getInstance().getDBConn("MSS");
            Statement st = cnx.createStatement();
            st.execute("delete DC_USRGRPITM where GRPID = " + GRPID);
        }
        catch(SQLException e)
        {
            System.out.println("Exception e : " + e);
            sqlerror = true;
        }
        catch(ServiceLocatorException e)
        {
            System.out.println("Exception e : " + e);
            sqlerror = true;
        }
        finally
        {
            try
            {
                cnx.close();
            }
            catch(SQLException e)
            {
                System.out.println("Exception e : " + e);
                sqlerror = true;
            }
        }
        return sqlerror;
    }

    public boolean AddGroupItems()
    {
        boolean sqlerror = false;
        Connection cnx = null;
        try
        {
            cnx = ServiceLocator.getInstance().getDBConn("MSS");
            Statement st = cnx.createStatement();
            try
            {
                grpitmlistbean.initRow();
                String ENTITYID;
                int GRPID;
                int MMID;
                int CMID;
                int APPLEVEL;
                double LMTAMNT;
                for(; grpitmlistbean.getNextRow(); st.execute("insert into DC_USRGRPITM (ENTITYID,GRPID,MMID,CMID,APPLEVEL,LMTAMNT) values ('" + ENTITYID + "'," + GRPID + "," + MMID + "," + CMID + "," + APPLEVEL + "," + LMTAMNT + ")"))
                {
                    ENTITYID = grpitmlistbean.getENTITYID();
                    GRPID = grpitmlistbean.getGRPID();
                    MMID = grpitmlistbean.getMMID();
                    CMID = grpitmlistbean.getCMID();
                    APPLEVEL = grpitmlistbean.getAPPLEVEL();
                    LMTAMNT = grpitmlistbean.getLMTAMNT();
                }

            }
            finally
            {
                st.close();
            }
        }
        catch(SQLException e)
        {
            System.out.println("Exception e : " + e);
            sqlerror = true;
        }
        catch(ServiceLocatorException e)
        {
            System.out.println("Exception e : " + e);
            sqlerror = true;
        }
        finally
        {
            try
            {
                cnx.close();
            }
            catch(SQLException e)
            {
                System.out.println("Exception e : " + e);
                sqlerror = true;
            }
        }
        return sqlerror;
    }

    private JBGroupItemsList grpitmlistbean;
    private String ENTITYID;
}
