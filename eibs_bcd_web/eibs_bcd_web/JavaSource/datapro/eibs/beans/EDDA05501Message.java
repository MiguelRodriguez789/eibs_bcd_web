package datapro.eibs.beans;

import datapro.eibs.sockets.*;
import java.io.*;
import java.math.*;

import java.util.*;

/**
* Class generated by AS/400 CRTCLASS command from EDDA05501 physical file definition.
* 
* File level identifier is 1070509173239.
* Record format level identifier is 522A1CBCF77E6.
*/

public class EDDA05501Message extends MessageRecord
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
                                     "E01UNCBNK",
                                     "E01UNCBRN",
                                     "E01UNCACC",
                                     "E01UNCMDM",
                                     "E01UNCMDD",
                                     "E01UNCMDY",
                                     "E01UNCMDC"
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
                                   "E01UNCBNK",
                                   "E01UNCBRN",
                                   "E01UNCACC",
                                   "E01UNCMDM",
                                   "E01UNCMDD",
                                   "E01UNCMDY",
                                   "E01UNCMDC"
                                 };
  final static String fid = "1070509173239";
  final static String rid = "522A1CBCF77E6";
  final static String fmtname = "EDDA05501";
  final int FIELDCOUNT = 16;
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
  private CharacterField fieldE01UNCBNK = null;
  private DecimalField fieldE01UNCBRN = null;
  private DecimalField fieldE01UNCACC = null;
  private DecimalField fieldE01UNCMDM = null;
  private DecimalField fieldE01UNCMDD = null;
  private DecimalField fieldE01UNCMDY = null;
  private DecimalField fieldE01UNCMDC = null;

  /**
  * Constructor for EDDA05501Message.
  */
  public EDDA05501Message()
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
    recordsize = 72;
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
    fields[9] = fieldE01UNCBNK =
    new CharacterField(message, HEADERSIZE + 42, 2, "E01UNCBNK");
    fields[10] = fieldE01UNCBRN =
    new DecimalField(message, HEADERSIZE + 44, 4, 0, "E01UNCBRN");
    fields[11] = fieldE01UNCACC =
    new DecimalField(message, HEADERSIZE + 48, 13, 0, "E01UNCACC");
    fields[12] = fieldE01UNCMDM =
    new DecimalField(message, HEADERSIZE + 61, 3, 0, "E01UNCMDM");
    fields[13] = fieldE01UNCMDD =
    new DecimalField(message, HEADERSIZE + 64, 3, 0, "E01UNCMDD");
    fields[14] = fieldE01UNCMDY =
    new DecimalField(message, HEADERSIZE + 67, 3, 0, "E01UNCMDY");
    fields[15] = fieldE01UNCMDC =
    new DecimalField(message, HEADERSIZE + 70, 2, 0, "E01UNCMDC");

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
  * Set field E01UNCBNK using a String value.
  */
  public void setE01UNCBNK(String newvalue)
  {
    fieldE01UNCBNK.setString(newvalue);
  }

  /**
  * Get value of field E01UNCBNK as a String.
  */
  public String getE01UNCBNK()
  {
    return fieldE01UNCBNK.getString();
  }

  /**
  * Set field E01UNCBRN using a String value.
  */
  public void setE01UNCBRN(String newvalue)
  {
    fieldE01UNCBRN.setString(newvalue);
  }

  /**
  * Get value of field E01UNCBRN as a String.
  */
  public String getE01UNCBRN()
  {
    return fieldE01UNCBRN.getString();
  }

  /**
  * Set numeric field E01UNCBRN using a BigDecimal value.
  */
  public void setE01UNCBRN(BigDecimal newvalue)
  {
    fieldE01UNCBRN.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01UNCBRN as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01UNCBRN()
  {
    return fieldE01UNCBRN.getBigDecimal();
  }

  /**
  * Set field E01UNCACC using a String value.
  */
  public void setE01UNCACC(String newvalue)
  {
    fieldE01UNCACC.setString(newvalue);
  }

  /**
  * Get value of field E01UNCACC as a String.
  */
  public String getE01UNCACC()
  {
    return fieldE01UNCACC.getString();
  }

  /**
  * Set numeric field E01UNCACC using a BigDecimal value.
  */
  public void setE01UNCACC(BigDecimal newvalue)
  {
    fieldE01UNCACC.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01UNCACC as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01UNCACC()
  {
    return fieldE01UNCACC.getBigDecimal();
  }

  /**
  * Set field E01UNCMDM using a String value.
  */
  public void setE01UNCMDM(String newvalue)
  {
    fieldE01UNCMDM.setString(newvalue);
  }

  /**
  * Get value of field E01UNCMDM as a String.
  */
  public String getE01UNCMDM()
  {
    return fieldE01UNCMDM.getString();
  }

  /**
  * Set numeric field E01UNCMDM using a BigDecimal value.
  */
  public void setE01UNCMDM(BigDecimal newvalue)
  {
    fieldE01UNCMDM.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01UNCMDM as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01UNCMDM()
  {
    return fieldE01UNCMDM.getBigDecimal();
  }

  /**
  * Set field E01UNCMDD using a String value.
  */
  public void setE01UNCMDD(String newvalue)
  {
    fieldE01UNCMDD.setString(newvalue);
  }

  /**
  * Get value of field E01UNCMDD as a String.
  */
  public String getE01UNCMDD()
  {
    return fieldE01UNCMDD.getString();
  }

  /**
  * Set numeric field E01UNCMDD using a BigDecimal value.
  */
  public void setE01UNCMDD(BigDecimal newvalue)
  {
    fieldE01UNCMDD.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01UNCMDD as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01UNCMDD()
  {
    return fieldE01UNCMDD.getBigDecimal();
  }

  /**
  * Set field E01UNCMDY using a String value.
  */
  public void setE01UNCMDY(String newvalue)
  {
    fieldE01UNCMDY.setString(newvalue);
  }

  /**
  * Get value of field E01UNCMDY as a String.
  */
  public String getE01UNCMDY()
  {
    return fieldE01UNCMDY.getString();
  }

  /**
  * Set numeric field E01UNCMDY using a BigDecimal value.
  */
  public void setE01UNCMDY(BigDecimal newvalue)
  {
    fieldE01UNCMDY.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01UNCMDY as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01UNCMDY()
  {
    return fieldE01UNCMDY.getBigDecimal();
  }

  /**
  * Set field E01UNCMDC using a String value.
  */
  public void setE01UNCMDC(String newvalue)
  {
    fieldE01UNCMDC.setString(newvalue);
  }

  /**
  * Get value of field E01UNCMDC as a String.
  */
  public String getE01UNCMDC()
  {
    return fieldE01UNCMDC.getString();
  }

  /**
  * Set numeric field E01UNCMDC using a BigDecimal value.
  */
  public void setE01UNCMDC(BigDecimal newvalue)
  {
    fieldE01UNCMDC.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01UNCMDC as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01UNCMDC()
  {
    return fieldE01UNCMDC.getBigDecimal();
  }

}
