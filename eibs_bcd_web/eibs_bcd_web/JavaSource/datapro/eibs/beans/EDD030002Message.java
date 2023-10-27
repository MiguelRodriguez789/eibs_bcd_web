package datapro.eibs.beans;

import datapro.eibs.sockets.*;
import java.io.*;
import java.math.*;

import java.util.*;

/**
* Class generated by AS/400 CRTCLASS command from EDD030002 physical file definition.
* 
* File level identifier is 1131007181153.
* Record format level identifier is 4298E6BCB570A.
*/

public class EDD030002Message extends MessageRecord
{
  final static String fldnames[] = {
                                     "H02USERID",
                                     "H02PROGRM",
                                     "H02TIMSYS",
                                     "H02SCRCOD",
                                     "H02OPECOD",
                                     "H02FLGMAS",
                                     "H02FLGWK1",
                                     "H02FLGWK2",
                                     "H02FLGWK3",
                                     "E02UNCACC",
                                     "E02UNCACD",
                                     "E02UNCBNK",
                                     "E02UNCBRN",
                                     "E02UNCCCY",
                                     "E02UNCCUN",
                                     "E02UNCPRO",
                                     "E02CUSNA1"
                                   };
  final static String tnames[] = {
                                   "H02USERID",
                                   "H02PROGRM",
                                   "H02TIMSYS",
                                   "H02SCRCOD",
                                   "H02OPECOD",
                                   "H02FLGMAS",
                                   "H02FLGWK1",
                                   "H02FLGWK2",
                                   "H02FLGWK3",
                                   "E02UNCACC",
                                   "E02UNCACD",
                                   "E02UNCBNK",
                                   "E02UNCBRN",
                                   "E02UNCCCY",
                                   "E02UNCCUN",
                                   "E02UNCPRO",
                                   "E02CUSNA1"
                                 };
  final static String fid = "1131007181153";
  final static String rid = "4298E6BCB570A";
  final static String fmtname = "EDD030002";
  final int FIELDCOUNT = 17;
  private static Hashtable tlookup = new Hashtable();
  private CharacterField fieldH02USERID = null;
  private CharacterField fieldH02PROGRM = null;
  private CharacterField fieldH02TIMSYS = null;
  private CharacterField fieldH02SCRCOD = null;
  private CharacterField fieldH02OPECOD = null;
  private CharacterField fieldH02FLGMAS = null;
  private CharacterField fieldH02FLGWK1 = null;
  private CharacterField fieldH02FLGWK2 = null;
  private CharacterField fieldH02FLGWK3 = null;
  private DecimalField fieldE02UNCACC = null;
  private CharacterField fieldE02UNCACD = null;
  private CharacterField fieldE02UNCBNK = null;
  private DecimalField fieldE02UNCBRN = null;
  private CharacterField fieldE02UNCCCY = null;
  private DecimalField fieldE02UNCCUN = null;
  private CharacterField fieldE02UNCPRO = null;
  private CharacterField fieldE02CUSNA1 = null;

  /**
  * Constructor for EDD030002Message.
  */
  public EDD030002Message()
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
    recordsize = 141;
    fileid = fid;
    recordid = rid;
    message = new byte[getByteLength()];
    formatname = fmtname;
    fieldnames = fldnames;
    tagnames = tnames;
    fields = new MessageField[FIELDCOUNT];

    fields[0] = fieldH02USERID =
    new CharacterField(message, HEADERSIZE + 0, 10, "H02USERID");
    fields[1] = fieldH02PROGRM =
    new CharacterField(message, HEADERSIZE + 10, 10, "H02PROGRM");
    fields[2] = fieldH02TIMSYS =
    new CharacterField(message, HEADERSIZE + 20, 12, "H02TIMSYS");
    fields[3] = fieldH02SCRCOD =
    new CharacterField(message, HEADERSIZE + 32, 2, "H02SCRCOD");
    fields[4] = fieldH02OPECOD =
    new CharacterField(message, HEADERSIZE + 34, 4, "H02OPECOD");
    fields[5] = fieldH02FLGMAS =
    new CharacterField(message, HEADERSIZE + 38, 1, "H02FLGMAS");
    fields[6] = fieldH02FLGWK1 =
    new CharacterField(message, HEADERSIZE + 39, 1, "H02FLGWK1");
    fields[7] = fieldH02FLGWK2 =
    new CharacterField(message, HEADERSIZE + 40, 1, "H02FLGWK2");
    fields[8] = fieldH02FLGWK3 =
    new CharacterField(message, HEADERSIZE + 41, 1, "H02FLGWK3");
    fields[9] = fieldE02UNCACC =
    new DecimalField(message, HEADERSIZE + 42, 13, 0, "E02UNCACC");
    fields[10] = fieldE02UNCACD =
    new CharacterField(message, HEADERSIZE + 55, 2, "E02UNCACD");
    fields[11] = fieldE02UNCBNK =
    new CharacterField(message, HEADERSIZE + 57, 2, "E02UNCBNK");
    fields[12] = fieldE02UNCBRN =
    new DecimalField(message, HEADERSIZE + 59, 5, 0, "E02UNCBRN");
    fields[13] = fieldE02UNCCCY =
    new CharacterField(message, HEADERSIZE + 64, 3, "E02UNCCCY");
    fields[14] = fieldE02UNCCUN =
    new DecimalField(message, HEADERSIZE + 67, 10, 0, "E02UNCCUN");
    fields[15] = fieldE02UNCPRO =
    new CharacterField(message, HEADERSIZE + 77, 4, "E02UNCPRO");
    fields[16] = fieldE02CUSNA1 =
    new CharacterField(message, HEADERSIZE + 81, 60, "E02CUSNA1");

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
  * Set field H02USERID using a String value.
  */
  public void setH02USERID(String newvalue)
  {
    fieldH02USERID.setString(newvalue);
  }

  /**
  * Get value of field H02USERID as a String.
  */
  public String getH02USERID()
  {
    return fieldH02USERID.getString();
  }

  /**
  * Set field H02PROGRM using a String value.
  */
  public void setH02PROGRM(String newvalue)
  {
    fieldH02PROGRM.setString(newvalue);
  }

  /**
  * Get value of field H02PROGRM as a String.
  */
  public String getH02PROGRM()
  {
    return fieldH02PROGRM.getString();
  }

  /**
  * Set field H02TIMSYS using a String value.
  */
  public void setH02TIMSYS(String newvalue)
  {
    fieldH02TIMSYS.setString(newvalue);
  }

  /**
  * Get value of field H02TIMSYS as a String.
  */
  public String getH02TIMSYS()
  {
    return fieldH02TIMSYS.getString();
  }

  /**
  * Set field H02SCRCOD using a String value.
  */
  public void setH02SCRCOD(String newvalue)
  {
    fieldH02SCRCOD.setString(newvalue);
  }

  /**
  * Get value of field H02SCRCOD as a String.
  */
  public String getH02SCRCOD()
  {
    return fieldH02SCRCOD.getString();
  }

  /**
  * Set field H02OPECOD using a String value.
  */
  public void setH02OPECOD(String newvalue)
  {
    fieldH02OPECOD.setString(newvalue);
  }

  /**
  * Get value of field H02OPECOD as a String.
  */
  public String getH02OPECOD()
  {
    return fieldH02OPECOD.getString();
  }

  /**
  * Set field H02FLGMAS using a String value.
  */
  public void setH02FLGMAS(String newvalue)
  {
    fieldH02FLGMAS.setString(newvalue);
  }

  /**
  * Get value of field H02FLGMAS as a String.
  */
  public String getH02FLGMAS()
  {
    return fieldH02FLGMAS.getString();
  }

  /**
  * Set field H02FLGWK1 using a String value.
  */
  public void setH02FLGWK1(String newvalue)
  {
    fieldH02FLGWK1.setString(newvalue);
  }

  /**
  * Get value of field H02FLGWK1 as a String.
  */
  public String getH02FLGWK1()
  {
    return fieldH02FLGWK1.getString();
  }

  /**
  * Set field H02FLGWK2 using a String value.
  */
  public void setH02FLGWK2(String newvalue)
  {
    fieldH02FLGWK2.setString(newvalue);
  }

  /**
  * Get value of field H02FLGWK2 as a String.
  */
  public String getH02FLGWK2()
  {
    return fieldH02FLGWK2.getString();
  }

  /**
  * Set field H02FLGWK3 using a String value.
  */
  public void setH02FLGWK3(String newvalue)
  {
    fieldH02FLGWK3.setString(newvalue);
  }

  /**
  * Get value of field H02FLGWK3 as a String.
  */
  public String getH02FLGWK3()
  {
    return fieldH02FLGWK3.getString();
  }

  /**
  * Set field E02UNCACC using a String value.
  */
  public void setE02UNCACC(String newvalue)
  {
    fieldE02UNCACC.setString(newvalue);
  }

  /**
  * Get value of field E02UNCACC as a String.
  */
  public String getE02UNCACC()
  {
    return fieldE02UNCACC.getString();
  }

  /**
  * Set numeric field E02UNCACC using a BigDecimal value.
  */
  public void setE02UNCACC(BigDecimal newvalue)
  {
    fieldE02UNCACC.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02UNCACC as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02UNCACC()
  {
    return fieldE02UNCACC.getBigDecimal();
  }

  /**
  * Set field E02UNCACD using a String value.
  */
  public void setE02UNCACD(String newvalue)
  {
    fieldE02UNCACD.setString(newvalue);
  }

  /**
  * Get value of field E02UNCACD as a String.
  */
  public String getE02UNCACD()
  {
    return fieldE02UNCACD.getString();
  }

  /**
  * Set field E02UNCBNK using a String value.
  */
  public void setE02UNCBNK(String newvalue)
  {
    fieldE02UNCBNK.setString(newvalue);
  }

  /**
  * Get value of field E02UNCBNK as a String.
  */
  public String getE02UNCBNK()
  {
    return fieldE02UNCBNK.getString();
  }

  /**
  * Set field E02UNCBRN using a String value.
  */
  public void setE02UNCBRN(String newvalue)
  {
    fieldE02UNCBRN.setString(newvalue);
  }

  /**
  * Get value of field E02UNCBRN as a String.
  */
  public String getE02UNCBRN()
  {
    return fieldE02UNCBRN.getString();
  }

  /**
  * Set numeric field E02UNCBRN using a BigDecimal value.
  */
  public void setE02UNCBRN(BigDecimal newvalue)
  {
    fieldE02UNCBRN.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02UNCBRN as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02UNCBRN()
  {
    return fieldE02UNCBRN.getBigDecimal();
  }

  /**
  * Set field E02UNCCCY using a String value.
  */
  public void setE02UNCCCY(String newvalue)
  {
    fieldE02UNCCCY.setString(newvalue);
  }

  /**
  * Get value of field E02UNCCCY as a String.
  */
  public String getE02UNCCCY()
  {
    return fieldE02UNCCCY.getString();
  }

  /**
  * Set field E02UNCCUN using a String value.
  */
  public void setE02UNCCUN(String newvalue)
  {
    fieldE02UNCCUN.setString(newvalue);
  }

  /**
  * Get value of field E02UNCCUN as a String.
  */
  public String getE02UNCCUN()
  {
    return fieldE02UNCCUN.getString();
  }

  /**
  * Set numeric field E02UNCCUN using a BigDecimal value.
  */
  public void setE02UNCCUN(BigDecimal newvalue)
  {
    fieldE02UNCCUN.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02UNCCUN as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02UNCCUN()
  {
    return fieldE02UNCCUN.getBigDecimal();
  }

  /**
  * Set field E02UNCPRO using a String value.
  */
  public void setE02UNCPRO(String newvalue)
  {
    fieldE02UNCPRO.setString(newvalue);
  }

  /**
  * Get value of field E02UNCPRO as a String.
  */
  public String getE02UNCPRO()
  {
    return fieldE02UNCPRO.getString();
  }

  /**
  * Set field E02CUSNA1 using a String value.
  */
  public void setE02CUSNA1(String newvalue)
  {
    fieldE02CUSNA1.setString(newvalue);
  }

  /**
  * Get value of field E02CUSNA1 as a String.
  */
  public String getE02CUSNA1()
  {
    return fieldE02CUSNA1.getString();
  }

}
