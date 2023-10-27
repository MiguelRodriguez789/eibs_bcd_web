
package com.datapro.eibs.internet.beans;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.datapro.eibs.internet.databeans.DC_LOG;
import com.datapro.eibs.internet.databeans.DC_MENU;
import com.datapro.eibs.internet.databeans.DC_USRPROFILE;
import com.datapro.exception.ServiceLocatorException;
import com.datapro.generic.beanutil.BeanParser;
import com.datapro.services.ServiceLocator;

import datapro.eibs.beans.JBObjList;

// Referenced classes of package datapro.eibs.beans:
//            JBObjList, DC_LOG, DC_USRPROFILE, DC_MENU

public class JBLog
    implements Serializable
{

    public JBLog()
    {
    }

    public JBObjList getAllEntities()
    {
        JBObjList lsEntities = new JBObjList();
        Connection cnx = null;
        try
        {
            cnx = ServiceLocator.getInstance().getDBConn("MSS");
            String STM = "SELECT DISTINCT(ENTITYID) from DC_USRPROFILE ORDER BY ENTITYID ASC";
            PreparedStatement ps = cnx.prepareStatement(STM);
            ResultSet rs = ps.executeQuery();
            java.sql.ResultSetMetaData md = rs.getMetaData();
            DC_LOG logdatabean;
            for(; rs.next(); lsEntities.addRow(logdatabean.getENTITYID().trim()))
            {
                logdatabean = new DC_LOG();
                BeanParser bp = new BeanParser(logdatabean);
                bp.parseResultSet(md, rs);
            }

            rs.close();
            ps.close();
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
        return lsEntities;
    }

    public JBObjList getListUsers(String ENTITYID)
    {
        DC_USRPROFILE usersdatabean = new DC_USRPROFILE();
        JBObjList lsUsers = new JBObjList();
        Connection cnx = null;
        try
        {
            cnx = ServiceLocator.getInstance().getDBConn("MSS");
            String STM = "SELECT * from DC_USRPROFILE WHERE ENTITYID = '" + ENTITYID + "'";
            PreparedStatement ps = cnx.prepareStatement(STM);
            ResultSet rs = ps.executeQuery();
            java.sql.ResultSetMetaData md = rs.getMetaData();
            for(; rs.next(); lsUsers.addRow(usersdatabean))
            {
                usersdatabean = new DC_USRPROFILE();
                BeanParser bp = new BeanParser(usersdatabean);
                bp.parseResultSet(md, rs);
            }

            rs.close();
            ps.close();
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
        return lsUsers;
    }

    public JBObjList getListTrans()
    {
        JBObjList lsLogTrans = new JBObjList();
        Connection cnx = null;
        try
        {
            cnx = ServiceLocator.getInstance().getDBConn("MSS");
            String STM = "";
            STM = "SELECT * from DC_MENU WHERE LOG_DC = 'Y' order by TRANSCODE";
            PreparedStatement ps = cnx.prepareStatement(STM);
            ResultSet rs = ps.executeQuery();
            java.sql.ResultSetMetaData md = rs.getMetaData();
            DC_MENU logtransdatabean;
            for(; rs.next(); lsLogTrans.addRow(logtransdatabean))
            {
                logtransdatabean = new DC_MENU();
                BeanParser bp = new BeanParser(logtransdatabean);
                bp.parseResultSet(md, rs);
            }

            rs.close();
            ps.close();
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
        return lsLogTrans;
    }

    private String getSelectSQL()
    {
        return "SELECT * from DC_LOG ";
    }

    private String addParameterSQL(String parameter, String value, String command)
    {
        if(value.equals("") || value.equals("*"))
            return "";
        else
            return " " + command + " " + parameter + " = '" + value + "'";
    }

    private String orderBy(String parameter)
    {
        return " ORDER BY " + parameter + " DESC";
    }

    public JBObjList getLogListAllUserTransNoDate(String ENTITYID, String TRANSCODE, int index)
    {
        JBObjList lsLog = new JBObjList();
        JBObjList lsLogTrans = getListTrans();
        Connection cnx = null;
        try
        {
            cnx = ServiceLocator.getInstance().getDBConn("MSS");
            String STM = getSelectSQL() + addParameterSQL("TRANSCODE", TRANSCODE, "WHERE") + addParameterSQL("ENTITYID", ENTITYID, "AND") + orderBy("DTTM");
            PreparedStatement ps = cnx.prepareStatement(STM, 1005, 1007);
            ResultSet rs = ps.executeQuery();
            java.sql.ResultSetMetaData md = rs.getMetaData();
            if(index > 0)
            {
                rs.last();
                int size = rs.getRow();
                rs.absolute(index);
                boolean firstTime = true;
                DC_LOG logdatabean;
                int loop;
                for(loop = 0; rs.next() && loop < 50; lsLog.addRow(logdatabean))
                {
                    if(firstTime)
                    {
                        firstTime = false;
                        lsLog.setFirstRec(index);
                    }
                    loop++;
                    logdatabean = new DC_LOG();
                    BeanParser bp = new BeanParser(logdatabean);
                    bp.parseResultSet(md, rs);
                    lsLogTrans.initRow();
                    while(lsLogTrans.getNextRow()) 
                    {
                        DC_MENU logtransdatabean = (DC_MENU)lsLogTrans.getRecord();
                        String TCODE = logtransdatabean.getTRANSCODE();
                        if(TCODE.trim().equals(logdatabean.getTRANSCODE().trim()))
                        {
                            logdatabean.setTRANSCODE(logtransdatabean.getNAME());
                            break;
                        }
                    }
                }

                lsLog.setLastRec(index + loop);
                if(size > index + 50)
                    lsLog.setShowNext(true);
            } else
            {
                DC_LOG logdatabean;
                for(; rs.next(); lsLog.addRow(logdatabean))
                {
                    logdatabean = new DC_LOG();
                    BeanParser bp = new BeanParser(logdatabean);
                    bp.parseResultSet(md, rs);
                    lsLogTrans.initRow();
                    while(lsLogTrans.getNextRow()) 
                    {
                        DC_MENU logtransdatabean = (DC_MENU)lsLogTrans.getRecord();
                        String TCODE = logtransdatabean.getTRANSCODE();
                        if(TCODE.trim().equals(logdatabean.getTRANSCODE().trim()))
                        {
                            logdatabean.setTRANSCODE(logtransdatabean.getNAME());
                            break;
                        }
                    }
                }

            }
            rs.close();
            ps.close();
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
        return lsLog;
    }

    public JBObjList getLogListOneUserTransNoDate(String ENTITYID, String UserID, String TRANSCODE)
    {
        JBObjList lsLog = new JBObjList();
        JBObjList lsLogTrans = getListTrans();
        Connection cnx = null;
        try
        {
            cnx = ServiceLocator.getInstance().getDBConn("MSS");
            String STM = getSelectSQL() + addParameterSQL("USERID", UserID, "WHERE") + addParameterSQL("ENTITYID", ENTITYID, "AND") + addParameterSQL("TRANSCODE", TRANSCODE, "AND") + orderBy("USERID, DTTM");
            PreparedStatement ps = cnx.prepareStatement(STM);
            ResultSet rs = ps.executeQuery();
            java.sql.ResultSetMetaData md = rs.getMetaData();
            DC_LOG logdatabean;
            for(; rs.next(); lsLog.addRow(logdatabean))
            {
                logdatabean = new DC_LOG();
                BeanParser bp = new BeanParser(logdatabean);
                bp.parseResultSet(md, rs);
                lsLogTrans.initRow();
                while(lsLogTrans.getNextRow()) 
                {
                    DC_MENU logtransdatabean = (DC_MENU)lsLogTrans.getRecord();
                    String TCODE = logtransdatabean.getTRANSCODE();
                    if(TCODE.trim().equals(logdatabean.getTRANSCODE().trim()))
                    {
                        logdatabean.setTRANSCODE(logtransdatabean.getNAME());
                        break;
                    }
                }
            }

            rs.close();
            ps.close();
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
        return lsLog;
    }

    public JBObjList getLogListAllUsersAll(String ENTITYID, int index)
    {
        JBObjList lsLog = new JBObjList();
        JBObjList lsLogTrans = getListTrans();
        Connection cnx = null;
        try
        {
            cnx = ServiceLocator.getInstance().getDBConn("MSS");
            String STM = getSelectSQL() + addParameterSQL("ENTITYID", ENTITYID, "WHERE") + orderBy("DTTM");
            PreparedStatement ps = cnx.prepareStatement(STM, 1005, 1007);
            ResultSet rs = ps.executeQuery();
            java.sql.ResultSetMetaData md = rs.getMetaData();
            if(index > 0)
            {
                rs.last();
                int size = rs.getRow();
                rs.absolute(index);
                boolean firstTime = true;
                DC_LOG logdatabean;
                int loop;
                for(loop = 0; rs.next() && loop < 50; lsLog.addRow(logdatabean))
                {
                    if(firstTime)
                    {
                        firstTime = false;
                        lsLog.setFirstRec(index);
                    }
                    loop++;
                    logdatabean = new DC_LOG();
                    BeanParser bp = new BeanParser(logdatabean);
                    bp.parseResultSet(md, rs);
                    lsLogTrans.initRow();
                    while(lsLogTrans.getNextRow()) 
                    {
                        DC_MENU logtransdatabean = (DC_MENU)lsLogTrans.getRecord();
                        String TCODE = logtransdatabean.getTRANSCODE();
                        if(TCODE.trim().equals(logdatabean.getTRANSCODE().trim()))
                        {
                            logdatabean.setTRANSCODE(logtransdatabean.getNAME());
                            break;
                        }
                    }
                }

                lsLog.setLastRec(index + loop);
                if(size > index + 50)
                    lsLog.setShowNext(true);
            } else
            {
                DC_LOG logdatabean;
                for(; rs.next(); lsLog.addRow(logdatabean))
                {
                    logdatabean = new DC_LOG();
                    BeanParser bp = new BeanParser(logdatabean);
                    bp.parseResultSet(md, rs);
                    lsLogTrans.initRow();
                    while(lsLogTrans.getNextRow()) 
                    {
                        DC_MENU logtransdatabean = (DC_MENU)lsLogTrans.getRecord();
                        String TCODE = logtransdatabean.getTRANSCODE();
                        if(TCODE.trim().equals(logdatabean.getTRANSCODE().trim()))
                        {
                            logdatabean.setTRANSCODE(logtransdatabean.getNAME());
                            break;
                        }
                    }
                }

            }
            rs.close();
            ps.close();
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
        return lsLog;
    }

    public JBObjList getLogListOneUsersAll(String ENTITYID, String UserID)
    {
        JBObjList lsLog = new JBObjList();
        JBObjList lsLogTrans = getListTrans();
        Connection cnx = null;
        try
        {
            cnx = ServiceLocator.getInstance().getDBConn("MSS");
            String STM = getSelectSQL() + addParameterSQL("USERID", UserID, "WHERE") + addParameterSQL("ENTITYID", ENTITYID, "AND") + orderBy("USERID, DTTM");
            PreparedStatement ps = cnx.prepareStatement(STM);
            ResultSet rs = ps.executeQuery();
            java.sql.ResultSetMetaData md = rs.getMetaData();
            DC_LOG logdatabean;
            for(; rs.next(); lsLog.addRow(logdatabean))
            {
                logdatabean = new DC_LOG();
                BeanParser bp = new BeanParser(logdatabean);
                bp.parseResultSet(md, rs);
                lsLogTrans.initRow();
                while(lsLogTrans.getNextRow()) 
                {
                    DC_MENU logtransdatabean = (DC_MENU)lsLogTrans.getRecord();
                    String TCODE = logtransdatabean.getTRANSCODE();
                    if(TCODE.trim().equals(logdatabean.getTRANSCODE().trim()))
                    {
                        logdatabean.setTRANSCODE(logtransdatabean.getNAME());
                        break;
                    }
                }
            }

            rs.close();
            ps.close();
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
        return lsLog;
    }

    public JBObjList getLogListAllUsersAllTransacByDate(String ENTITYID, String FDATE, String EDATE, int index)
    {
        JBObjList lsLog = new JBObjList();
        JBObjList lsLogTrans = getListTrans();
        Connection cnx = null;
        try
        {
            cnx = ServiceLocator.getInstance().getDBConn("MSS");
            String STM = getSelectSQL() + " WHERE TDATE BETWEEN '" + FDATE + "' AND '" + EDATE + "' " + addParameterSQL("ENTITYID", ENTITYID, "AND") + orderBy("DTTM");
            PreparedStatement ps = cnx.prepareStatement(STM, 1005, 1007);
            ResultSet rs = ps.executeQuery();
            if(index > 0)
            {
                rs.absolute(index);
                java.sql.ResultSetMetaData md = rs.getMetaData();
                rs.last();
                int size = rs.getRow();
                rs.absolute(index);
                boolean firstTime = true;
                DC_LOG logdatabean;
                int loop;
                for(loop = 0; rs.next() && loop < 50; lsLog.addRow(logdatabean))
                {
                    if(firstTime)
                    {
                        firstTime = false;
                        lsLog.setFirstRec(index);
                    }
                    loop++;
                    logdatabean = new DC_LOG();
                    BeanParser bp = new BeanParser(logdatabean);
                    bp.parseResultSet(md, rs);
                    lsLogTrans.initRow();
                    while(lsLogTrans.getNextRow()) 
                    {
                        DC_MENU logtransdatabean = (DC_MENU)lsLogTrans.getRecord();
                        String TCODE = logtransdatabean.getTRANSCODE();
                        if(TCODE.trim().equals(logdatabean.getTRANSCODE().trim()))
                        {
                            logdatabean.setTRANSCODE(logtransdatabean.getNAME());
                            break;
                        }
                    }
                }

                lsLog.setLastRec(index + loop);
                if(size > index + 50)
                    lsLog.setShowNext(true);
            } else
            {
                java.sql.ResultSetMetaData md = rs.getMetaData();
                DC_LOG logdatabean;
                for(; rs.next(); lsLog.addRow(logdatabean))
                {
                    logdatabean = new DC_LOG();
                    BeanParser bp = new BeanParser(logdatabean);
                    bp.parseResultSet(md, rs);
                    lsLogTrans.initRow();
                    while(lsLogTrans.getNextRow()) 
                    {
                        DC_MENU logtransdatabean = (DC_MENU)lsLogTrans.getRecord();
                        String TCODE = logtransdatabean.getTRANSCODE();
                        if(TCODE.trim().equals(logdatabean.getTRANSCODE().trim()))
                        {
                            logdatabean.setTRANSCODE(logtransdatabean.getNAME());
                            break;
                        }
                    }
                }

            }
            rs.close();
            ps.close();
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
        return lsLog;
    }

    public JBObjList getLogListOneUsersAllTransacByDate(String ENTITYID, String UserID, String FDATE, String TDATE)
    {
        JBObjList lsLog = new JBObjList();
        JBObjList lsLogTrans = getListTrans();
        Connection cnx = null;
        try
        {
            cnx = ServiceLocator.getInstance().getDBConn("MSS");
            String STM = getSelectSQL() + " WHERE TDATE BETWEEN '" + FDATE + "' AND '" + TDATE + "' " + addParameterSQL("USERID", UserID, "AND") + addParameterSQL("ENTITYID", ENTITYID, "AND") + orderBy("USERID, DTTM");
            PreparedStatement ps = cnx.prepareStatement(STM);
            ResultSet rs = ps.executeQuery();
            java.sql.ResultSetMetaData md = rs.getMetaData();
            DC_LOG logdatabean;
            for(; rs.next(); lsLog.addRow(logdatabean))
            {
                logdatabean = new DC_LOG();
                BeanParser bp = new BeanParser(logdatabean);
                bp.parseResultSet(md, rs);
                lsLogTrans.initRow();
                while(lsLogTrans.getNextRow()) 
                {
                    DC_MENU logtransdatabean = (DC_MENU)lsLogTrans.getRecord();
                    String TCODE = logtransdatabean.getTRANSCODE();
                    if(TCODE.trim().equals(logdatabean.getTRANSCODE().trim()))
                    {
                        logdatabean.setTRANSCODE(logtransdatabean.getNAME());
                        break;
                    }
                }
            }

            rs.close();
            ps.close();
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
        return lsLog;
    }

    public JBObjList getLogListAllUserTransAllDate(String ENTITYID, String TRANSCODE, String FDATE, String EDATE, int index)
    {
        JBObjList lsLog = new JBObjList();
        JBObjList lsLogTrans = getListTrans();
        Connection cnx = null;
        try
        {
            cnx = ServiceLocator.getInstance().getDBConn("MSS");
            String STM = getSelectSQL() + " WHERE TDATE BETWEEN '" + FDATE + "' AND '" + EDATE + "' " + addParameterSQL("TRANSCODE", TRANSCODE, "AND") + addParameterSQL("ENTITYID", ENTITYID, "AND") + orderBy("DTTM");
            PreparedStatement ps = cnx.prepareStatement(STM, 1005, 1007);
            ResultSet rs = ps.executeQuery();
            java.sql.ResultSetMetaData md = rs.getMetaData();
            if(index > 0)
            {
                rs.last();
                int size = rs.getRow();
                rs.absolute(index);
                boolean firstTime = true;
                DC_LOG logdatabean;
                int loop;
                for(loop = 0; rs.next() && loop < 50; lsLog.addRow(logdatabean))
                {
                    if(firstTime)
                    {
                        firstTime = false;
                        lsLog.setFirstRec(index);
                    }
                    loop++;
                    logdatabean = new DC_LOG();
                    BeanParser bp = new BeanParser(logdatabean);
                    bp.parseResultSet(md, rs);
                    lsLogTrans.initRow();
                    while(lsLogTrans.getNextRow()) 
                    {
                        DC_MENU logtransdatabean = (DC_MENU)lsLogTrans.getRecord();
                        String TCODE = logtransdatabean.getTRANSCODE();
                        if(TCODE.trim().equals(logdatabean.getTRANSCODE().trim()))
                        {
                            logdatabean.setTRANSCODE(logtransdatabean.getNAME());
                            break;
                        }
                    }
                }

                lsLog.setLastRec(index + loop);
                if(size > index + 50)
                    lsLog.setShowNext(true);
            } else
            {
                DC_LOG logdatabean;
                for(; rs.next(); lsLog.addRow(logdatabean))
                {
                    logdatabean = new DC_LOG();
                    BeanParser bp = new BeanParser(logdatabean);
                    bp.parseResultSet(md, rs);
                    lsLogTrans.initRow();
                    while(lsLogTrans.getNextRow()) 
                    {
                        DC_MENU logtransdatabean = (DC_MENU)lsLogTrans.getRecord();
                        String TCODE = logtransdatabean.getTRANSCODE();
                        if(TCODE.trim().equals(logdatabean.getTRANSCODE().trim()))
                        {
                            logdatabean.setTRANSCODE(logtransdatabean.getNAME());
                            break;
                        }
                    }
                }

            }
            rs.close();
            ps.close();
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
        return lsLog;
    }

    public JBObjList getLogListOneUserTransAllDate(String ENTITYID, String UserID, String TRANSCODE, String FDATE, String TDATE)
    {
        JBObjList lsLog = new JBObjList();
        JBObjList lsLogTrans = getListTrans();
        Connection cnx = null;
        try
        {
            cnx = ServiceLocator.getInstance().getDBConn("MSS");
            String STM = getSelectSQL() + " WHERE TDATE BETWEEN '" + FDATE + "' AND '" + TDATE + "' " + addParameterSQL("USERID", UserID, "AND") + addParameterSQL("TRANSCODE", TRANSCODE, "AND") + addParameterSQL("ENTITYID", ENTITYID, "AND") + orderBy("USERID, DTTM");
            PreparedStatement ps = cnx.prepareStatement(STM);
            ResultSet rs = ps.executeQuery();
            java.sql.ResultSetMetaData md = rs.getMetaData();
            DC_LOG logdatabean;
            for(; rs.next(); lsLog.addRow(logdatabean))
            {
                logdatabean = new DC_LOG();
                BeanParser bp = new BeanParser(logdatabean);
                bp.parseResultSet(md, rs);
                lsLogTrans.initRow();
                while(lsLogTrans.getNextRow()) 
                {
                    DC_MENU logtransdatabean = (DC_MENU)lsLogTrans.getRecord();
                    String TCODE = logtransdatabean.getTRANSCODE();
                    if(TCODE.trim().equals(logdatabean.getTRANSCODE().trim()))
                    {
                        logdatabean.setTRANSCODE(logtransdatabean.getNAME());
                        break;
                    }
                }
            }

            rs.close();
            ps.close();
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
        return lsLog;
    }

    public DC_LOG getLogLogin(String ENTITYID, String UserID)
    {
        DC_LOG logdatabean = new DC_LOG();
        Connection cnx = null;
        try
        {
            cnx = ServiceLocator.getInstance().getDBConn("MSS");
            String STM = getSelectSQL() + addParameterSQL("USERID", UserID, "WHERE") + addParameterSQL("TRANSCODE", "00001", "AND") + addParameterSQL("ENTITYID", ENTITYID, "AND") + orderBy("USERID, DTTM");
            PreparedStatement ps = cnx.prepareStatement(STM);
            ResultSet rs = ps.executeQuery();
            java.sql.ResultSetMetaData md = rs.getMetaData();
            if(rs.next())
            {
                logdatabean = new DC_LOG();
                BeanParser bp = new BeanParser(logdatabean);
                bp.parseResultSet(md, rs);
            }
            rs.close();
            ps.close();
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
        return logdatabean;
    }

    public JBObjList getGLogListAllUsersAll1(String ENTITYID, int index)
    {
        JBObjList lsLog = new JBObjList();
        JBObjList lsLogTrans = getListTrans();
        Connection cnx = null;
        try
        {
            cnx = ServiceLocator.getInstance().getDBConn("MSS");
            String STM = "select substring(tdate,1,4) as yy,substring(tdate,5,2) as mm,count(*) as num";
            STM = STM + " from dc_log";
            if(ENTITYID.trim().length() > 0 && !ENTITYID.equals("*"))
                STM = STM + " WHERE ENTITYID='" + ENTITYID + "'";
            STM = STM + " group by substring(tdate,1,4), substring(tdate,5,2)";
            STM = STM + " order by yy,mm";
            PreparedStatement ps = cnx.prepareStatement(STM, 1005, 1007);
            ResultSet rs = ps.executeQuery();
            java.sql.ResultSetMetaData md = rs.getMetaData();
            DC_LOG logdatabean;
            for(; rs.next(); lsLog.addRow(logdatabean))
            {
                logdatabean = new DC_LOG();
                BeanParser bp = new BeanParser(logdatabean);
                logdatabean.setAMOUNT(rs.getString(3));
                logdatabean.setDEBITACC(rs.getString(1));
                logdatabean.setCREDITACC(rs.getString(2));
                logdatabean.setTRANSCODE("ALL");
            }

            rs.close();
            ps.close();
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
        return lsLog;
    }

    public JBObjList getGLogListAllUsersAll2(String ENTITYID, int index)
    {
        JBObjList lsLog = new JBObjList();
        JBObjList lsLogTrans = getListTrans();
        Connection cnx = null;
        try
        {
            cnx = ServiceLocator.getInstance().getDBConn("MSS");
            String STM = "select substring(tdate,1,4) as yy,substring(tdate,5,2) as mm,count(*) as num";
            STM = STM + " from dc_log";
            STM = STM + " WHERE TRANSCODE='" + ENTITYID + "'";
            STM = STM + " group by substring(tdate,1,4), substring(tdate,5,2)";
            STM = STM + " order by yy,mm";
            PreparedStatement ps = cnx.prepareStatement(STM, 1005, 1007);
            ResultSet rs = ps.executeQuery();
            java.sql.ResultSetMetaData md = rs.getMetaData();
            while(rs.next()) 
            {
                DC_LOG logdatabean = new DC_LOG();
                BeanParser bp = new BeanParser(logdatabean);
                logdatabean.setAMOUNT(rs.getString(3));
                logdatabean.setDEBITACC(rs.getString(1));
                logdatabean.setCREDITACC(rs.getString(2));
                lsLog.addRow(logdatabean);
                lsLogTrans.initRow();
                while(lsLogTrans.getNextRow()) 
                {
                    DC_MENU logtransdatabean = (DC_MENU)lsLogTrans.getRecord();
                    String TCODE = logtransdatabean.getTRANSCODE();
                    if(TCODE.trim().equals(ENTITYID))
                    {
                        logdatabean.setTRANSCODE(logtransdatabean.getNAME());
                        break;
                    }
                }
            }
            rs.close();
            ps.close();
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
        return lsLog;
    }

    private static final int records = 50;
}
