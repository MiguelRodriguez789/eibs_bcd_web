
package com.datapro.eibs.internet.beans;

import com.datapro.exception.ServiceLocatorException;
import com.datapro.services.ServiceLocator;
import java.io.PrintStream;
import java.sql.*;
import java.util.Vector;

public class JBMenu
{

    public JBMenu()
    {
    }

    public void addRow(String newMMID, String newCMID, String newNAME, String newFLAG, String newCHK)
    {
        MMID.addElement(new Integer(newMMID));
        CMID.addElement(new Integer(newCMID));
        NAME.addElement(newNAME);
        FLAG.addElement(newFLAG);
        CHK.addElement(newCHK);
        row++;
    }

    public boolean getDBMenu(String INTOK, String EXTOK, String THIOK, String BILLS)
    {
        boolean sqlerror = false;
        String mmid = "";
        String cmid = "";
        Connection cnx = null;
        try
        {
            cnx = ServiceLocator.getInstance().getDBConn("MSS");
            Statement st = cnx.createStatement();
            String STM = "SELECT * from DC_MENU where  ADM='N' and STS_DC = 'Y' ORDER BY MMID, CMID";
            ResultSet rs = st.executeQuery(STM);
            init();
            while(rs.next()) 
            {
                boolean ADDOK = true;
                mmid = rs.getString("mmid").trim();
                cmid = rs.getString("cmid").trim();
                if(INTOK.equals("N") && mmid.equals("2") && cmid.equals("1"))
                    ADDOK = false;
                if(THIOK.equals("N") && mmid.equals("2") && cmid.equals("2"))
                    ADDOK = false;
                if(EXTOK.equals("N") && mmid.equals("2") && cmid.equals("3"))
                    ADDOK = false;
                if(BILLS.equals("N") && mmid.equals("5"))
                    ADDOK = false;
                if(ADDOK)
                    addRow(mmid, cmid, rs.getString("NAME"), rs.getString("FLG_LMT_AMNT"), rs.getString("CHK").trim());
            }
            rs.close();
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

    public boolean getNextRow()
    {
        currentRow++;
        return currentRow < row;
    }

    public void init()
    {
        MMID = new Vector();
        CMID = new Vector();
        NAME = new Vector();
        FLAG = new Vector();
        CHK = new Vector();
        row = 0;
    }

    public void initRow()
    {
        currentRow = -1;
    }

    public int getMMID()
    {
        Integer rtn = (Integer)MMID.elementAt(currentRow);
        return rtn.intValue();
    }

    public int getCMID()
    {
        Integer rtn = (Integer)CMID.elementAt(currentRow);
        return rtn.intValue();
    }

    public String getNAME()
    {
        String rtn = (String)NAME.elementAt(currentRow);
        return rtn;
    }

    public String getFLAG()
    {
        String rtn = (String)FLAG.elementAt(currentRow);
        return rtn;
    }

    public String getCHK()
    {
        String rtn = (String)CHK.elementAt(currentRow);
        return rtn;
    }

    private int row;
    private int currentRow;
    private Vector MMID;
    private Vector CMID;
    private Vector NAME;
    private Vector FLAG;
    private Vector CHK;
}
