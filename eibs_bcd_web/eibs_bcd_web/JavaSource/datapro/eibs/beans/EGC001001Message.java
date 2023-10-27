package datapro.eibs.beans;

import datapro.eibs.sockets.*;
import java.io.*;
import java.math.*;

import java.util.*;

/**
* Class generated by AS/400 CRTCLASS command from EGC001001 physical file definition.
* 
* File level identifier is 1130611113159.
* Record format level identifier is 4CAEB18D2BEAE.
*/

public class EGC001001Message extends MessageRecord
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
                                     "E01SELTYP",
                                     "E01SELNME",
                                     "E01SELCUN",
                                     "E01SELACC",
                                     "E01NUMREC"
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
                                   "E01SELTYP",
                                   "E01SELNME",
                                   "E01SELCUN",
                                   "E01SELACC",
                                   "E01NUMREC"
                                 };
  final static String fid = "1130611113159";
  final static String rid = "4CAEB18D2BEAE";
  final static String fmtname = "EGC001001";
  final int FIELDCOUNT = 14;
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
  private CharacterField fieldE01SELTYP = null;
  private CharacterField fieldE01SELNME = null;
  private DecimalField fieldE01SELCUN = null;
  private DecimalField fieldE01SELACC = null;
  private DecimalField fieldE01NUMREC = null;

  /**
  * Constructor for EGC001001Message.
  */
  public EGC001001Message()
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
    recordsize = 119;
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
    fields[9] = fieldE01SELTYP =
    new CharacterField(message, HEADERSIZE + 42, 1, "E01SELTYP");
    fields[10] = fieldE01SELNME =
    new CharacterField(message, HEADERSIZE + 43, 45, "E01SELNME");
    fields[11] = fieldE01SELCUN =
    new DecimalField(message, HEADERSIZE + 88, 10, 0, "E01SELCUN");
    fields[12] = fieldE01SELACC =
    new DecimalField(message, HEADERSIZE + 98, 13, 0, "E01SELACC");
    fields[13] = fieldE01NUMREC =
    new DecimalField(message, HEADERSIZE + 111, 8, 0, "E01NUMREC");

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
  * Set field E01SELTYP using a String value.
  */
  public void setE01SELTYP(String newvalue)
  {
    fieldE01SELTYP.setString(newvalue);
  }

  /**
  * Get value of field E01SELTYP as a String.
  */
  public String getE01SELTYP()
  {
    return fieldE01SELTYP.getString();
  }

  /**
  * Set field E01SELNME using a String value.
  */
  public void setE01SELNME(String newvalue)
  {
    fieldE01SELNME.setString(newvalue);
  }

  /**
  * Get value of field E01SELNME as a String.
  */
  public String getE01SELNME()
  {
    return fieldE01SELNME.getString();
  }

  /**
  * Set field E01SELCUN using a String value.
  */
  public void setE01SELCUN(String newvalue)
  {
    fieldE01SELCUN.setString(newvalue);
  }

  /**
  * Get value of field E01SELCUN as a String.
  */
  public String getE01SELCUN()
  {
    return fieldE01SELCUN.getString();
  }

  /**
  * Set numeric field E01SELCUN using a BigDecimal value.
  */
  public void setE01SELCUN(BigDecimal newvalue)
  {
    fieldE01SELCUN.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01SELCUN as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01SELCUN()
  {
    return fieldE01SELCUN.getBigDecimal();
  }

  /**
  * Set field E01SELACC using a String value.
  */
  public void setE01SELACC(String newvalue)
  {
    fieldE01SELACC.setString(newvalue);
  }

  /**
  * Get value of field E01SELACC as a String.
  */
  public String getE01SELACC()
  {
    return fieldE01SELACC.getString();
  }

  /**
  * Set numeric field E01SELACC using a BigDecimal value.
  */
  public void setE01SELACC(BigDecimal newvalue)
  {
    fieldE01SELACC.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01SELACC as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01SELACC()
  {
    return fieldE01SELACC.getBigDecimal();
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

}
