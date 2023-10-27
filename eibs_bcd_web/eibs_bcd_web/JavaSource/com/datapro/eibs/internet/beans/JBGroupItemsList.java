// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) 
// Source File Name:   JBGroupItemsList.java

package com.datapro.eibs.internet.beans;

import java.util.Vector;

public class JBGroupItemsList
{

    public JBGroupItemsList()
    {
    }

    public void addRow(String newENTITYID, int newGRPID, int newMMID, int newCMID, int newAPPLEVEL, double newLMTAMNT)
    {
        ENTITYID.addElement(newENTITYID);
        GRPID.addElement(new Integer(newGRPID));
        MMID.addElement(new Integer(newMMID));
        CMID.addElement(new Integer(newCMID));
        APPLEVEL.addElement(new Integer(newAPPLEVEL));
        LMTAMNT.addElement(new Double(newLMTAMNT));
        row++;
    }

    public boolean getNextRow()
    {
        currentRow++;
        return currentRow < row;
    }

    public void init()
    {
        ENTITYID = new Vector();
        GRPID = new Vector();
        MMID = new Vector();
        CMID = new Vector();
        APPLEVEL = new Vector();
        LMTAMNT = new Vector();
        row = 0;
    }

    public void initRow()
    {
        currentRow = -1;
    }

    public boolean isHere(int MM, int CM)
    {
        for(int i = 0; i < row; i++)
        {
            Integer mm = (Integer)MMID.elementAt(i);
            Integer cm = (Integer)CMID.elementAt(i);
            if(mm.intValue() == MM && cm.intValue() == CM)
            {
                currentRow = i;
                return true;
            }
        }

        return false;
    }

    public String getENTITYID()
    {
        String rtn = (String)ENTITYID.elementAt(currentRow);
        return rtn;
    }

    public int getGRPID()
    {
        Integer rtn = (Integer)GRPID.elementAt(currentRow);
        return rtn.intValue();
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

    public int getAPPLEVEL()
    {
        Integer rtn = (Integer)APPLEVEL.elementAt(currentRow);
        return rtn.intValue();
    }

    public double getLMTAMNT()
    {
        Double rtn = (Double)LMTAMNT.elementAt(currentRow);
        return rtn.doubleValue();
    }

    private int row;
    private int currentRow;
    private Vector ENTITYID;
    private Vector GRPID;
    private Vector MMID;
    private Vector CMID;
    private Vector APPLEVEL;
    private Vector LMTAMNT;
}
