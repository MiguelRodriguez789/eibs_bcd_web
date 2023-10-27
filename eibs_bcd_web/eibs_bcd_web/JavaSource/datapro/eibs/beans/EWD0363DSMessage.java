package datapro.eibs.beans;

import datapro.eibs.sockets.*;
import java.io.*;
import java.math.*;

import java.util.*;

/**
* Class generated by AS/400 CRTCLASS command from EWD0363DS physical file definition.
* 
* File level identifier is 1130611113506.
* Record format level identifier is 37BC3D3F5836C.
*/

public class EWD0363DSMessage extends MessageRecord
{
  final static String fldnames[] = {
                                     "RWDUSR",
                                     "RWDTYP",
                                     "RWDFRC",
                                     "SWDCDE",
                                     "SWDDSC",
                                     "SWDDC",
                                     "SWDTYP",
                                     "SWDITC",
                                     "SWDRET",
                                     "SWDAMT",
                                     "SWDAT1",
                                     "SWDAT2",
                                     "SWDAT3",
                                     "SWDAT4",
                                     "SWDAT5",
                                     "SWDAT6",
                                     "SWDAT7",
                                     "SWDAT8",
                                     "SWDAT9",
                                     "SWDREC",
                                     "SWDOPE"
                                   };
  final static String tnames[] = {
                                   "RWDUSR",
                                   "RWDTYP",
                                   "RWDFRC",
                                   "SWDCDE",
                                   "SWDDSC",
                                   "SWDDC",
                                   "SWDTYP",
                                   "SWDITC",
                                   "SWDRET",
                                   "SWDAMT",
                                   "SWDAT1",
                                   "SWDAT2",
                                   "SWDAT3",
                                   "SWDAT4",
                                   "SWDAT5",
                                   "SWDAT6",
                                   "SWDAT7",
                                   "SWDAT8",
                                   "SWDAT9",
                                   "SWDREC",
                                   "SWDOPE"
                                 };
  final static String fid = "1130611113506";
  final static String rid = "37BC3D3F5836C";
  final static String fmtname = "EWD0363DS";
  final int FIELDCOUNT = 21;
  private static Hashtable tlookup = new Hashtable();
  private CharacterField fieldRWDUSR = null;
  private CharacterField fieldRWDTYP = null;
  private DecimalField fieldRWDFRC = null;
  private CharacterField fieldSWDCDE = null;
  private CharacterField fieldSWDDSC = null;
  private CharacterField fieldSWDDC = null;
  private CharacterField fieldSWDTYP = null;
  private CharacterField fieldSWDITC = null;
  private CharacterField fieldSWDRET = null;
  private CharacterField fieldSWDAMT = null;
  private CharacterField fieldSWDAT1 = null;
  private CharacterField fieldSWDAT2 = null;
  private CharacterField fieldSWDAT3 = null;
  private CharacterField fieldSWDAT4 = null;
  private CharacterField fieldSWDAT5 = null;
  private CharacterField fieldSWDAT6 = null;
  private CharacterField fieldSWDAT7 = null;
  private CharacterField fieldSWDAT8 = null;
  private CharacterField fieldSWDAT9 = null;
  private DecimalField fieldSWDREC = null;
  private CharacterField fieldSWDOPE = null;

  /**
  * Constructor for EWD0363DSMessage.
  */
  public EWD0363DSMessage()
  {
    createFields();
    initialize();
  }

  /**
  * Create fields for this message.
  * This method implements the abstract method in the MessageRecord superclass.
  */
  protected void createFields()
  {
    recordsize = 111;
    fileid = fid;
    recordid = rid;
    message = new byte[getByteLength()];
    formatname = fmtname;
    fieldnames = fldnames;
    tagnames = tnames;
    fields = new MessageField[FIELDCOUNT];

    fields[0] = fieldRWDUSR =
    new CharacterField(message, HEADERSIZE + 0, 10, "RWDUSR");
    fields[1] = fieldRWDTYP =
    new CharacterField(message, HEADERSIZE + 10, 1, "RWDTYP");
    fields[2] = fieldRWDFRC =
    new DecimalField(message, HEADERSIZE + 11, 8, 0, "RWDFRC");
    fields[3] = fieldSWDCDE =
    new CharacterField(message, HEADERSIZE + 19, 2, "SWDCDE");
    fields[4] = fieldSWDDSC =
    new CharacterField(message, HEADERSIZE + 21, 45, "SWDDSC");
    fields[5] = fieldSWDDC =
    new CharacterField(message, HEADERSIZE + 66, 1, "SWDDC");
    fields[6] = fieldSWDTYP =
    new CharacterField(message, HEADERSIZE + 67, 1, "SWDTYP");
    fields[7] = fieldSWDITC =
    new CharacterField(message, HEADERSIZE + 68, 4, "SWDITC");
    fields[8] = fieldSWDRET =
    new CharacterField(message, HEADERSIZE + 72, 2, "SWDRET");
    fields[9] = fieldSWDAMT =
    new CharacterField(message, HEADERSIZE + 74, 1, "SWDAMT");
    fields[10] = fieldSWDAT1 =
    new CharacterField(message, HEADERSIZE + 75, 3, "SWDAT1");
    fields[11] = fieldSWDAT2 =
    new CharacterField(message, HEADERSIZE + 78, 3, "SWDAT2");
    fields[12] = fieldSWDAT3 =
    new CharacterField(message, HEADERSIZE + 81, 3, "SWDAT3");
    fields[13] = fieldSWDAT4 =
    new CharacterField(message, HEADERSIZE + 84, 3, "SWDAT4");
    fields[14] = fieldSWDAT5 =
    new CharacterField(message, HEADERSIZE + 87, 3, "SWDAT5");
    fields[15] = fieldSWDAT6 =
    new CharacterField(message, HEADERSIZE + 90, 3, "SWDAT6");
    fields[16] = fieldSWDAT7 =
    new CharacterField(message, HEADERSIZE + 93, 3, "SWDAT7");
    fields[17] = fieldSWDAT8 =
    new CharacterField(message, HEADERSIZE + 96, 3, "SWDAT8");
    fields[18] = fieldSWDAT9 =
    new CharacterField(message, HEADERSIZE + 99, 3, "SWDAT9");
    fields[19] = fieldSWDREC =
    new DecimalField(message, HEADERSIZE + 102, 8, 0, "SWDREC");
    fields[20] = fieldSWDOPE =
    new CharacterField(message, HEADERSIZE + 110, 1, "SWDOPE");

    synchronized (tlookup)
    {
      if (tlookup.isEmpty())
      {
        for (int i = 0; i < tnames.length; i++)
          tlookup.put(tnames[i], new Integer(i));
      }
    }

    taglookup = tlookup;
  }

  /**
  * Set field RWDUSR using a String value.
  */
  public void setRWDUSR(String newvalue)
  {
    fieldRWDUSR.setString(newvalue);
  }

  /**
  * Get value of field RWDUSR as a String.
  */
  public String getRWDUSR()
  {
    return fieldRWDUSR.getString();
  }

  /**
  * Set field RWDTYP using a String value.
  */
  public void setRWDTYP(String newvalue)
  {
    fieldRWDTYP.setString(newvalue);
  }

  /**
  * Get value of field RWDTYP as a String.
  */
  public String getRWDTYP()
  {
    return fieldRWDTYP.getString();
  }

  /**
  * Set field RWDFRC using a String value.
  */
  public void setRWDFRC(String newvalue)
  {
    fieldRWDFRC.setString(newvalue);
  }

  /**
  * Get value of field RWDFRC as a String.
  */
  public String getRWDFRC()
  {
    return fieldRWDFRC.getString();
  }

  /**
  * Set numeric field RWDFRC using a BigDecimal value.
  */
  public void setRWDFRC(BigDecimal newvalue)
  {
    fieldRWDFRC.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field RWDFRC as a BigDecimal.
  */
  public BigDecimal getBigDecimalRWDFRC()
  {
    return fieldRWDFRC.getBigDecimal();
  }

  /**
  * Set field SWDCDE using a String value.
  */
  public void setSWDCDE(String newvalue)
  {
    fieldSWDCDE.setString(newvalue);
  }

  /**
  * Get value of field SWDCDE as a String.
  */
  public String getSWDCDE()
  {
    return fieldSWDCDE.getString();
  }

  /**
  * Set field SWDDSC using a String value.
  */
  public void setSWDDSC(String newvalue)
  {
    fieldSWDDSC.setString(newvalue);
  }

  /**
  * Get value of field SWDDSC as a String.
  */
  public String getSWDDSC()
  {
    return fieldSWDDSC.getString();
  }

  /**
  * Set field SWDDC using a String value.
  */
  public void setSWDDC(String newvalue)
  {
    fieldSWDDC.setString(newvalue);
  }

  /**
  * Get value of field SWDDC as a String.
  */
  public String getSWDDC()
  {
    return fieldSWDDC.getString();
  }

  /**
  * Set field SWDTYP using a String value.
  */
  public void setSWDTYP(String newvalue)
  {
    fieldSWDTYP.setString(newvalue);
  }

  /**
  * Get value of field SWDTYP as a String.
  */
  public String getSWDTYP()
  {
    return fieldSWDTYP.getString();
  }

  /**
  * Set field SWDITC using a String value.
  */
  public void setSWDITC(String newvalue)
  {
    fieldSWDITC.setString(newvalue);
  }

  /**
  * Get value of field SWDITC as a String.
  */
  public String getSWDITC()
  {
    return fieldSWDITC.getString();
  }

  /**
  * Set field SWDRET using a String value.
  */
  public void setSWDRET(String newvalue)
  {
    fieldSWDRET.setString(newvalue);
  }

  /**
  * Get value of field SWDRET as a String.
  */
  public String getSWDRET()
  {
    return fieldSWDRET.getString();
  }

  /**
  * Set field SWDAMT using a String value.
  */
  public void setSWDAMT(String newvalue)
  {
    fieldSWDAMT.setString(newvalue);
  }

  /**
  * Get value of field SWDAMT as a String.
  */
  public String getSWDAMT()
  {
    return fieldSWDAMT.getString();
  }

  /**
  * Set field SWDAT1 using a String value.
  */
  public void setSWDAT1(String newvalue)
  {
    fieldSWDAT1.setString(newvalue);
  }

  /**
  * Get value of field SWDAT1 as a String.
  */
  public String getSWDAT1()
  {
    return fieldSWDAT1.getString();
  }

  /**
  * Set field SWDAT2 using a String value.
  */
  public void setSWDAT2(String newvalue)
  {
    fieldSWDAT2.setString(newvalue);
  }

  /**
  * Get value of field SWDAT2 as a String.
  */
  public String getSWDAT2()
  {
    return fieldSWDAT2.getString();
  }

  /**
  * Set field SWDAT3 using a String value.
  */
  public void setSWDAT3(String newvalue)
  {
    fieldSWDAT3.setString(newvalue);
  }

  /**
  * Get value of field SWDAT3 as a String.
  */
  public String getSWDAT3()
  {
    return fieldSWDAT3.getString();
  }

  /**
  * Set field SWDAT4 using a String value.
  */
  public void setSWDAT4(String newvalue)
  {
    fieldSWDAT4.setString(newvalue);
  }

  /**
  * Get value of field SWDAT4 as a String.
  */
  public String getSWDAT4()
  {
    return fieldSWDAT4.getString();
  }

  /**
  * Set field SWDAT5 using a String value.
  */
  public void setSWDAT5(String newvalue)
  {
    fieldSWDAT5.setString(newvalue);
  }

  /**
  * Get value of field SWDAT5 as a String.
  */
  public String getSWDAT5()
  {
    return fieldSWDAT5.getString();
  }

  /**
  * Set field SWDAT6 using a String value.
  */
  public void setSWDAT6(String newvalue)
  {
    fieldSWDAT6.setString(newvalue);
  }

  /**
  * Get value of field SWDAT6 as a String.
  */
  public String getSWDAT6()
  {
    return fieldSWDAT6.getString();
  }

  /**
  * Set field SWDAT7 using a String value.
  */
  public void setSWDAT7(String newvalue)
  {
    fieldSWDAT7.setString(newvalue);
  }

  /**
  * Get value of field SWDAT7 as a String.
  */
  public String getSWDAT7()
  {
    return fieldSWDAT7.getString();
  }

  /**
  * Set field SWDAT8 using a String value.
  */
  public void setSWDAT8(String newvalue)
  {
    fieldSWDAT8.setString(newvalue);
  }

  /**
  * Get value of field SWDAT8 as a String.
  */
  public String getSWDAT8()
  {
    return fieldSWDAT8.getString();
  }

  /**
  * Set field SWDAT9 using a String value.
  */
  public void setSWDAT9(String newvalue)
  {
    fieldSWDAT9.setString(newvalue);
  }

  /**
  * Get value of field SWDAT9 as a String.
  */
  public String getSWDAT9()
  {
    return fieldSWDAT9.getString();
  }

  /**
  * Set field SWDREC using a String value.
  */
  public void setSWDREC(String newvalue)
  {
    fieldSWDREC.setString(newvalue);
  }

  /**
  * Get value of field SWDREC as a String.
  */
  public String getSWDREC()
  {
    return fieldSWDREC.getString();
  }

  /**
  * Set numeric field SWDREC using a BigDecimal value.
  */
  public void setSWDREC(BigDecimal newvalue)
  {
    fieldSWDREC.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field SWDREC as a BigDecimal.
  */
  public BigDecimal getBigDecimalSWDREC()
  {
    return fieldSWDREC.getBigDecimal();
  }

  /**
  * Set field SWDOPE using a String value.
  */
  public void setSWDOPE(String newvalue)
  {
    fieldSWDOPE.setString(newvalue);
  }

  /**
  * Get value of field SWDOPE as a String.
  */
  public String getSWDOPE()
  {
    return fieldSWDOPE.getString();
  }

}