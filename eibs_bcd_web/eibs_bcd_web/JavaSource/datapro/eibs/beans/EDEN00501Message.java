package datapro.eibs.beans;

import datapro.eibs.sockets.*;
import java.io.*;
import java.math.*;

import java.util.*;

/**
* Class generated by AS/400 CRTCLASS command from EDEN00501 physical file definition.
* 
* File level identifier is 1130828131410.
* Record format level identifier is 5ED244A92BC23.
*/

public class EDEN00501Message extends MessageRecord
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
                                     "E01RSVWRD",
                                     "E01RSVMDY",
                                     "E01RSVMDM",
                                     "E01RSVMDD",
                                     "E01RSVUSR",
                                     "E01ACT",
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
                                   "E01RSVWRD",
                                   "E01RSVMDY",
                                   "E01RSVMDM",
                                   "E01RSVMDD",
                                   "E01RSVUSR",
                                   "E01ACT",
                                   "E01NUMREC",
                                   "E01INDOPE"
                                 };
  final static String fid = "1130828131410";
  final static String rid = "5ED244A92BC23";
  final static String fmtname = "EDEN00501";
  final int FIELDCOUNT = 17;
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
  private CharacterField fieldE01RSVWRD = null;
  private DecimalField fieldE01RSVMDY = null;
  private DecimalField fieldE01RSVMDM = null;
  private DecimalField fieldE01RSVMDD = null;
  private CharacterField fieldE01RSVUSR = null;
  private CharacterField fieldE01ACT = null;
  private DecimalField fieldE01NUMREC = null;
  private CharacterField fieldE01INDOPE = null;

  /**
  * Constructor for EDEN00501Message.
  */
  public EDEN00501Message()
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
    recordsize = 118;
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
    fields[9] = fieldE01RSVWRD =
    new CharacterField(message, HEADERSIZE + 42, 45, "E01RSVWRD");
    fields[10] = fieldE01RSVMDY =
    new DecimalField(message, HEADERSIZE + 87, 5, 0, "E01RSVMDY");
    fields[11] = fieldE01RSVMDM =
    new DecimalField(message, HEADERSIZE + 92, 3, 0, "E01RSVMDM");
    fields[12] = fieldE01RSVMDD =
    new DecimalField(message, HEADERSIZE + 95, 3, 0, "E01RSVMDD");
    fields[13] = fieldE01RSVUSR =
    new CharacterField(message, HEADERSIZE + 98, 10, "E01RSVUSR");
    fields[14] = fieldE01ACT =
    new CharacterField(message, HEADERSIZE + 108, 1, "E01ACT");
    fields[15] = fieldE01NUMREC =
    new DecimalField(message, HEADERSIZE + 109, 8, 0, "E01NUMREC");
    fields[16] = fieldE01INDOPE =
    new CharacterField(message, HEADERSIZE + 117, 1, "E01INDOPE");

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
  * Set field E01RSVWRD using a String value.
  */
  public void setE01RSVWRD(String newvalue)
  {
    fieldE01RSVWRD.setString(newvalue);
  }

  /**
  * Get value of field E01RSVWRD as a String.
  */
  public String getE01RSVWRD()
  {
    return fieldE01RSVWRD.getString();
  }

  /**
  * Set field E01RSVMDY using a String value.
  */
  public void setE01RSVMDY(String newvalue)
  {
    fieldE01RSVMDY.setString(newvalue);
  }

  /**
  * Get value of field E01RSVMDY as a String.
  */
  public String getE01RSVMDY()
  {
    return fieldE01RSVMDY.getString();
  }

  /**
  * Set numeric field E01RSVMDY using a BigDecimal value.
  */
  public void setE01RSVMDY(BigDecimal newvalue)
  {
    fieldE01RSVMDY.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01RSVMDY as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01RSVMDY()
  {
    return fieldE01RSVMDY.getBigDecimal();
  }

  /**
  * Set field E01RSVMDM using a String value.
  */
  public void setE01RSVMDM(String newvalue)
  {
    fieldE01RSVMDM.setString(newvalue);
  }

  /**
  * Get value of field E01RSVMDM as a String.
  */
  public String getE01RSVMDM()
  {
    return fieldE01RSVMDM.getString();
  }

  /**
  * Set numeric field E01RSVMDM using a BigDecimal value.
  */
  public void setE01RSVMDM(BigDecimal newvalue)
  {
    fieldE01RSVMDM.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01RSVMDM as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01RSVMDM()
  {
    return fieldE01RSVMDM.getBigDecimal();
  }

  /**
  * Set field E01RSVMDD using a String value.
  */
  public void setE01RSVMDD(String newvalue)
  {
    fieldE01RSVMDD.setString(newvalue);
  }

  /**
  * Get value of field E01RSVMDD as a String.
  */
  public String getE01RSVMDD()
  {
    return fieldE01RSVMDD.getString();
  }

  /**
  * Set numeric field E01RSVMDD using a BigDecimal value.
  */
  public void setE01RSVMDD(BigDecimal newvalue)
  {
    fieldE01RSVMDD.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01RSVMDD as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01RSVMDD()
  {
    return fieldE01RSVMDD.getBigDecimal();
  }

  /**
  * Set field E01RSVUSR using a String value.
  */
  public void setE01RSVUSR(String newvalue)
  {
    fieldE01RSVUSR.setString(newvalue);
  }

  /**
  * Get value of field E01RSVUSR as a String.
  */
  public String getE01RSVUSR()
  {
    return fieldE01RSVUSR.getString();
  }

  /**
  * Set field E01ACT using a String value.
  */
  public void setE01ACT(String newvalue)
  {
    fieldE01ACT.setString(newvalue);
  }

  /**
  * Get value of field E01ACT as a String.
  */
  public String getE01ACT()
  {
    return fieldE01ACT.getString();
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