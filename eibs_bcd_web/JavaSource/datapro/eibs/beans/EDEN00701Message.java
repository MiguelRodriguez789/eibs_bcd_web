package datapro.eibs.beans;

import datapro.eibs.sockets.*;
import java.io.*;
import java.math.*;

import java.util.*;

/**
* Class generated by AS/400 CRTCLASS command from EDEN00701 physical file definition.
* 
* File level identifier is 1130828131410.
* Record format level identifier is 44CAF7EB3864D.
*/

public class EDEN00701Message extends MessageRecord
{
  final static String fldnames[] = {
                                     "H01USERID",
                                     "H01PROGRM",
                                     "H01TIMSYS",
                                     "H01SCRCOD",
                                     "H01OPECOD",
                                     "H01FLGMAS",
                                     "H01FLGWK1",
                                     "H01FLGWK2",
                                     "H01FLGWK3",
                                     "E01DTCCDE",
                                     "E01DTCDSC",
                                     "E01DTCMDY",
                                     "E01DTCMDM",
                                     "E01DTCMDD",
                                     "E01DTCUSR",
                                     "E01DTC",
                                     "E01NUMREC",
                                     "E01INDOPE"
                                   };
  final static String tnames[] = {
                                   "H01USERID",
                                   "H01PROGRM",
                                   "H01TIMSYS",
                                   "H01SCRCOD",
                                   "H01OPECOD",
                                   "H01FLGMAS",
                                   "H01FLGWK1",
                                   "H01FLGWK2",
                                   "H01FLGWK3",
                                   "E01DTCCDE",
                                   "E01DTCDSC",
                                   "E01DTCMDY",
                                   "E01DTCMDM",
                                   "E01DTCMDD",
                                   "E01DTCUSR",
                                   "E01DTC",
                                   "E01NUMREC",
                                   "E01INDOPE"
                                 };
  final static String fid = "1130828131410";
  final static String rid = "44CAF7EB3864D";
  final static String fmtname = "EDEN00701";
  final int FIELDCOUNT = 18;
  private static Hashtable tlookup = new Hashtable();
  private CharacterField fieldH01USERID = null;
  private CharacterField fieldH01PROGRM = null;
  private CharacterField fieldH01TIMSYS = null;
  private CharacterField fieldH01SCRCOD = null;
  private CharacterField fieldH01OPECOD = null;
  private CharacterField fieldH01FLGMAS = null;
  private CharacterField fieldH01FLGWK1 = null;
  private CharacterField fieldH01FLGWK2 = null;
  private CharacterField fieldH01FLGWK3 = null;
  private CharacterField fieldE01DTCCDE = null;
  private CharacterField fieldE01DTCDSC = null;
  private DecimalField fieldE01DTCMDY = null;
  private DecimalField fieldE01DTCMDM = null;
  private DecimalField fieldE01DTCMDD = null;
  private CharacterField fieldE01DTCUSR = null;
  private CharacterField fieldE01DTC = null;
  private DecimalField fieldE01NUMREC = null;
  private CharacterField fieldE01INDOPE = null;

  /**
  * Constructor for EDEN00701Message.
  */
  public EDEN00701Message()
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
    recordsize = 138;
    fileid = fid;
    recordid = rid;
    message = new byte[getByteLength()];
    formatname = fmtname;
    fieldnames = fldnames;
    tagnames = tnames;
    fields = new MessageField[FIELDCOUNT];

    fields[0] = fieldH01USERID =
    new CharacterField(message, HEADERSIZE + 0, 10, "H01USERID");
    fields[1] = fieldH01PROGRM =
    new CharacterField(message, HEADERSIZE + 10, 10, "H01PROGRM");
    fields[2] = fieldH01TIMSYS =
    new CharacterField(message, HEADERSIZE + 20, 12, "H01TIMSYS");
    fields[3] = fieldH01SCRCOD =
    new CharacterField(message, HEADERSIZE + 32, 2, "H01SCRCOD");
    fields[4] = fieldH01OPECOD =
    new CharacterField(message, HEADERSIZE + 34, 4, "H01OPECOD");
    fields[5] = fieldH01FLGMAS =
    new CharacterField(message, HEADERSIZE + 38, 1, "H01FLGMAS");
    fields[6] = fieldH01FLGWK1 =
    new CharacterField(message, HEADERSIZE + 39, 1, "H01FLGWK1");
    fields[7] = fieldH01FLGWK2 =
    new CharacterField(message, HEADERSIZE + 40, 1, "H01FLGWK2");
    fields[8] = fieldH01FLGWK3 =
    new CharacterField(message, HEADERSIZE + 41, 1, "H01FLGWK3");
    fields[9] = fieldE01DTCCDE =
    new CharacterField(message, HEADERSIZE + 42, 5, "E01DTCCDE");
    fields[10] = fieldE01DTCDSC =
    new CharacterField(message, HEADERSIZE + 47, 60, "E01DTCDSC");
    fields[11] = fieldE01DTCMDY =
    new DecimalField(message, HEADERSIZE + 107, 5, 0, "E01DTCMDY");
    fields[12] = fieldE01DTCMDM =
    new DecimalField(message, HEADERSIZE + 112, 3, 0, "E01DTCMDM");
    fields[13] = fieldE01DTCMDD =
    new DecimalField(message, HEADERSIZE + 115, 3, 0, "E01DTCMDD");
    fields[14] = fieldE01DTCUSR =
    new CharacterField(message, HEADERSIZE + 118, 10, "E01DTCUSR");
    fields[15] = fieldE01DTC =
    new CharacterField(message, HEADERSIZE + 128, 1, "E01DTC");
    fields[16] = fieldE01NUMREC =
    new DecimalField(message, HEADERSIZE + 129, 8, 0, "E01NUMREC");
    fields[17] = fieldE01INDOPE =
    new CharacterField(message, HEADERSIZE + 137, 1, "E01INDOPE");

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
  * Set field H01USERID using a String value.
  */
  public void setH01USERID(String newvalue)
  {
    fieldH01USERID.setString(newvalue);
  }

  /**
  * Get value of field H01USERID as a String.
  */
  public String getH01USERID()
  {
    return fieldH01USERID.getString();
  }

  /**
  * Set field H01PROGRM using a String value.
  */
  public void setH01PROGRM(String newvalue)
  {
    fieldH01PROGRM.setString(newvalue);
  }

  /**
  * Get value of field H01PROGRM as a String.
  */
  public String getH01PROGRM()
  {
    return fieldH01PROGRM.getString();
  }

  /**
  * Set field H01TIMSYS using a String value.
  */
  public void setH01TIMSYS(String newvalue)
  {
    fieldH01TIMSYS.setString(newvalue);
  }

  /**
  * Get value of field H01TIMSYS as a String.
  */
  public String getH01TIMSYS()
  {
    return fieldH01TIMSYS.getString();
  }

  /**
  * Set field H01SCRCOD using a String value.
  */
  public void setH01SCRCOD(String newvalue)
  {
    fieldH01SCRCOD.setString(newvalue);
  }

  /**
  * Get value of field H01SCRCOD as a String.
  */
  public String getH01SCRCOD()
  {
    return fieldH01SCRCOD.getString();
  }

  /**
  * Set field H01OPECOD using a String value.
  */
  public void setH01OPECOD(String newvalue)
  {
    fieldH01OPECOD.setString(newvalue);
  }

  /**
  * Get value of field H01OPECOD as a String.
  */
  public String getH01OPECOD()
  {
    return fieldH01OPECOD.getString();
  }

  /**
  * Set field H01FLGMAS using a String value.
  */
  public void setH01FLGMAS(String newvalue)
  {
    fieldH01FLGMAS.setString(newvalue);
  }

  /**
  * Get value of field H01FLGMAS as a String.
  */
  public String getH01FLGMAS()
  {
    return fieldH01FLGMAS.getString();
  }

  /**
  * Set field H01FLGWK1 using a String value.
  */
  public void setH01FLGWK1(String newvalue)
  {
    fieldH01FLGWK1.setString(newvalue);
  }

  /**
  * Get value of field H01FLGWK1 as a String.
  */
  public String getH01FLGWK1()
  {
    return fieldH01FLGWK1.getString();
  }

  /**
  * Set field H01FLGWK2 using a String value.
  */
  public void setH01FLGWK2(String newvalue)
  {
    fieldH01FLGWK2.setString(newvalue);
  }

  /**
  * Get value of field H01FLGWK2 as a String.
  */
  public String getH01FLGWK2()
  {
    return fieldH01FLGWK2.getString();
  }

  /**
  * Set field H01FLGWK3 using a String value.
  */
  public void setH01FLGWK3(String newvalue)
  {
    fieldH01FLGWK3.setString(newvalue);
  }

  /**
  * Get value of field H01FLGWK3 as a String.
  */
  public String getH01FLGWK3()
  {
    return fieldH01FLGWK3.getString();
  }

  /**
  * Set field E01DTCCDE using a String value.
  */
  public void setE01DTCCDE(String newvalue)
  {
    fieldE01DTCCDE.setString(newvalue);
  }

  /**
  * Get value of field E01DTCCDE as a String.
  */
  public String getE01DTCCDE()
  {
    return fieldE01DTCCDE.getString();
  }

  /**
  * Set field E01DTCDSC using a String value.
  */
  public void setE01DTCDSC(String newvalue)
  {
    fieldE01DTCDSC.setString(newvalue);
  }

  /**
  * Get value of field E01DTCDSC as a String.
  */
  public String getE01DTCDSC()
  {
    return fieldE01DTCDSC.getString();
  }

  /**
  * Set field E01DTCMDY using a String value.
  */
  public void setE01DTCMDY(String newvalue)
  {
    fieldE01DTCMDY.setString(newvalue);
  }

  /**
  * Get value of field E01DTCMDY as a String.
  */
  public String getE01DTCMDY()
  {
    return fieldE01DTCMDY.getString();
  }

  /**
  * Set numeric field E01DTCMDY using a BigDecimal value.
  */
  public void setE01DTCMDY(BigDecimal newvalue)
  {
    fieldE01DTCMDY.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01DTCMDY as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01DTCMDY()
  {
    return fieldE01DTCMDY.getBigDecimal();
  }

  /**
  * Set field E01DTCMDM using a String value.
  */
  public void setE01DTCMDM(String newvalue)
  {
    fieldE01DTCMDM.setString(newvalue);
  }

  /**
  * Get value of field E01DTCMDM as a String.
  */
  public String getE01DTCMDM()
  {
    return fieldE01DTCMDM.getString();
  }

  /**
  * Set numeric field E01DTCMDM using a BigDecimal value.
  */
  public void setE01DTCMDM(BigDecimal newvalue)
  {
    fieldE01DTCMDM.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01DTCMDM as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01DTCMDM()
  {
    return fieldE01DTCMDM.getBigDecimal();
  }

  /**
  * Set field E01DTCMDD using a String value.
  */
  public void setE01DTCMDD(String newvalue)
  {
    fieldE01DTCMDD.setString(newvalue);
  }

  /**
  * Get value of field E01DTCMDD as a String.
  */
  public String getE01DTCMDD()
  {
    return fieldE01DTCMDD.getString();
  }

  /**
  * Set numeric field E01DTCMDD using a BigDecimal value.
  */
  public void setE01DTCMDD(BigDecimal newvalue)
  {
    fieldE01DTCMDD.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01DTCMDD as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01DTCMDD()
  {
    return fieldE01DTCMDD.getBigDecimal();
  }

  /**
  * Set field E01DTCUSR using a String value.
  */
  public void setE01DTCUSR(String newvalue)
  {
    fieldE01DTCUSR.setString(newvalue);
  }

  /**
  * Get value of field E01DTCUSR as a String.
  */
  public String getE01DTCUSR()
  {
    return fieldE01DTCUSR.getString();
  }

  /**
  * Set field E01DTC using a String value.
  */
  public void setE01DTC(String newvalue)
  {
    fieldE01DTC.setString(newvalue);
  }

  /**
  * Get value of field E01DTC as a String.
  */
  public String getE01DTC()
  {
    return fieldE01DTC.getString();
  }

  /**
  * Set field E01NUMREC using a String value.
  */
  public void setE01NUMREC(String newvalue)
  {
    fieldE01NUMREC.setString(newvalue);
  }

  /**
  * Get value of field E01NUMREC as a String.
  */
  public String getE01NUMREC()
  {
    return fieldE01NUMREC.getString();
  }

  /**
  * Set numeric field E01NUMREC using a BigDecimal value.
  */
  public void setE01NUMREC(BigDecimal newvalue)
  {
    fieldE01NUMREC.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01NUMREC as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01NUMREC()
  {
    return fieldE01NUMREC.getBigDecimal();
  }

  /**
  * Set field E01INDOPE using a String value.
  */
  public void setE01INDOPE(String newvalue)
  {
    fieldE01INDOPE.setString(newvalue);
  }

  /**
  * Get value of field E01INDOPE as a String.
  */
  public String getE01INDOPE()
  {
    return fieldE01INDOPE.getString();
  }

}
