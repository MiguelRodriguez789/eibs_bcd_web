package datapro.eibs.beans;

import datapro.eibs.sockets.*;
import java.io.*;
import java.math.*;

import java.util.*;

/**
* Class generated by AS/400 CRTCLASS command from EDD066001 physical file definition.
* 
* File level identifier is 1140129163842.
* Record format level identifier is 5313E7A81FD9D.
*/

public class EDD066001Message extends MessageRecord
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
                                     "E01PRFBNK",
                                     "E01PRFACD",
                                     "E01PRFTBL",
                                     "E01PRFCUN",
                                     "E01PRFFCY",
                                     "E01PRFDSC",
                                     "E01PRFOPE"
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
                                   "E01PRFBNK",
                                   "E01PRFACD",
                                   "E01PRFTBL",
                                   "E01PRFCUN",
                                   "E01PRFFCY",
                                   "E01PRFDSC",
                                   "E01PRFOPE"
                                 };
  final static String fid = "1140129163842";
  final static String rid = "5313E7A81FD9D";
  final static String fmtname = "EDD066001";
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
  private CharacterField fieldE01PRFBNK = null;
  private CharacterField fieldE01PRFACD = null;
  private CharacterField fieldE01PRFTBL = null;
  private DecimalField fieldE01PRFCUN = null;
  private CharacterField fieldE01PRFFCY = null;
  private CharacterField fieldE01PRFDSC = null;
  private CharacterField fieldE01PRFOPE = null;

  /**
  * Constructor for EDD066001Message.
  */
  public EDD066001Message()
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
    recordsize = 107;
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
    fields[9] = fieldE01PRFBNK =
    new CharacterField(message, HEADERSIZE + 42, 2, "E01PRFBNK");
    fields[10] = fieldE01PRFACD =
    new CharacterField(message, HEADERSIZE + 44, 2, "E01PRFACD");
    fields[11] = fieldE01PRFTBL =
    new CharacterField(message, HEADERSIZE + 46, 2, "E01PRFTBL");
    fields[12] = fieldE01PRFCUN =
    new DecimalField(message, HEADERSIZE + 48, 10, 0, "E01PRFCUN");
    fields[13] = fieldE01PRFFCY =
    new CharacterField(message, HEADERSIZE + 58, 3, "E01PRFFCY");
    fields[14] = fieldE01PRFDSC =
    new CharacterField(message, HEADERSIZE + 61, 45, "E01PRFDSC");
    fields[15] = fieldE01PRFOPE =
    new CharacterField(message, HEADERSIZE + 106, 1, "E01PRFOPE");

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
  * Set field E01PRFBNK using a String value.
  */
  public void setE01PRFBNK(String newvalue)
  {
    fieldE01PRFBNK.setString(newvalue);
  }

  /**
  * Get value of field E01PRFBNK as a String.
  */
  public String getE01PRFBNK()
  {
    return fieldE01PRFBNK.getString();
  }

  /**
  * Set field E01PRFACD using a String value.
  */
  public void setE01PRFACD(String newvalue)
  {
    fieldE01PRFACD.setString(newvalue);
  }

  /**
  * Get value of field E01PRFACD as a String.
  */
  public String getE01PRFACD()
  {
    return fieldE01PRFACD.getString();
  }

  /**
  * Set field E01PRFTBL using a String value.
  */
  public void setE01PRFTBL(String newvalue)
  {
    fieldE01PRFTBL.setString(newvalue);
  }

  /**
  * Get value of field E01PRFTBL as a String.
  */
  public String getE01PRFTBL()
  {
    return fieldE01PRFTBL.getString();
  }

  /**
  * Set field E01PRFCUN using a String value.
  */
  public void setE01PRFCUN(String newvalue)
  {
    fieldE01PRFCUN.setString(newvalue);
  }

  /**
  * Get value of field E01PRFCUN as a String.
  */
  public String getE01PRFCUN()
  {
    return fieldE01PRFCUN.getString();
  }

  /**
  * Set numeric field E01PRFCUN using a BigDecimal value.
  */
  public void setE01PRFCUN(BigDecimal newvalue)
  {
    fieldE01PRFCUN.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01PRFCUN as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01PRFCUN()
  {
    return fieldE01PRFCUN.getBigDecimal();
  }

  /**
  * Set field E01PRFFCY using a String value.
  */
  public void setE01PRFFCY(String newvalue)
  {
    fieldE01PRFFCY.setString(newvalue);
  }

  /**
  * Get value of field E01PRFFCY as a String.
  */
  public String getE01PRFFCY()
  {
    return fieldE01PRFFCY.getString();
  }

  /**
  * Set field E01PRFDSC using a String value.
  */
  public void setE01PRFDSC(String newvalue)
  {
    fieldE01PRFDSC.setString(newvalue);
  }

  /**
  * Get value of field E01PRFDSC as a String.
  */
  public String getE01PRFDSC()
  {
    return fieldE01PRFDSC.getString();
  }

  /**
  * Set field E01PRFOPE using a String value.
  */
  public void setE01PRFOPE(String newvalue)
  {
    fieldE01PRFOPE.setString(newvalue);
  }

  /**
  * Get value of field E01PRFOPE as a String.
  */
  public String getE01PRFOPE()
  {
    return fieldE01PRFOPE.getString();
  }

}
