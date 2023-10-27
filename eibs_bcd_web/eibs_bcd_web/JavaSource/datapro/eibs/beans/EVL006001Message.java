package datapro.eibs.beans;

import datapro.eibs.sockets.*;
import java.io.*;
import java.math.*;

import java.util.*;

/**
* Class generated by AS/400 CRTCLASS command from EVL006001 physical file definition.
* 
* File level identifier is 1130611113446.
* Record format level identifier is 4B2D24C50A574.
*/

public class EVL006001Message extends MessageRecord
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
                                     "E01DOCBNK",
                                     "E01DOCBNN",
                                     "E01DOCBRN",
                                     "E01DOCBRM",
                                     "E01DOCTIP",
                                     "E01DOCTIN",
                                     "E01DOCSUB",
                                     "E01DOCSUN",
                                     "E01DOCUSR"
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
                                   "E01DOCBNK",
                                   "E01DOCBNN",
                                   "E01DOCBRN",
                                   "E01DOCBRM",
                                   "E01DOCTIP",
                                   "E01DOCTIN",
                                   "E01DOCSUB",
                                   "E01DOCSUN",
                                   "E01DOCUSR"
                                 };
  final static String fid = "1130611113446";
  final static String rid = "4B2D24C50A574";
  final static String fmtname = "EVL006001";
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
  private CharacterField fieldE01DOCBNK = null;
  private CharacterField fieldE01DOCBNN = null;
  private DecimalField fieldE01DOCBRN = null;
  private CharacterField fieldE01DOCBRM = null;
  private CharacterField fieldE01DOCTIP = null;
  private CharacterField fieldE01DOCTIN = null;
  private CharacterField fieldE01DOCSUB = null;
  private CharacterField fieldE01DOCSUN = null;
  private CharacterField fieldE01DOCUSR = null;

  /**
  * Constructor for EVL006001Message.
  */
  public EVL006001Message()
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
    recordsize = 247;
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
    fields[9] = fieldE01DOCBNK =
    new CharacterField(message, HEADERSIZE + 42, 2, "E01DOCBNK");
    fields[10] = fieldE01DOCBNN =
    new CharacterField(message, HEADERSIZE + 44, 45, "E01DOCBNN");
    fields[11] = fieldE01DOCBRN =
    new DecimalField(message, HEADERSIZE + 89, 5, 0, "E01DOCBRN");
    fields[12] = fieldE01DOCBRM =
    new CharacterField(message, HEADERSIZE + 94, 45, "E01DOCBRM");
    fields[13] = fieldE01DOCTIP =
    new CharacterField(message, HEADERSIZE + 139, 4, "E01DOCTIP");
    fields[14] = fieldE01DOCTIN =
    new CharacterField(message, HEADERSIZE + 143, 45, "E01DOCTIN");
    fields[15] = fieldE01DOCSUB =
    new CharacterField(message, HEADERSIZE + 188, 4, "E01DOCSUB");
    fields[16] = fieldE01DOCSUN =
    new CharacterField(message, HEADERSIZE + 192, 45, "E01DOCSUN");
    fields[17] = fieldE01DOCUSR =
    new CharacterField(message, HEADERSIZE + 237, 10, "E01DOCUSR");

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
  * Set field E01DOCBNK using a String value.
  */
  public void setE01DOCBNK(String newvalue)
  {
    fieldE01DOCBNK.setString(newvalue);
  }

  /**
  * Get value of field E01DOCBNK as a String.
  */
  public String getE01DOCBNK()
  {
    return fieldE01DOCBNK.getString();
  }

  /**
  * Set field E01DOCBNN using a String value.
  */
  public void setE01DOCBNN(String newvalue)
  {
    fieldE01DOCBNN.setString(newvalue);
  }

  /**
  * Get value of field E01DOCBNN as a String.
  */
  public String getE01DOCBNN()
  {
    return fieldE01DOCBNN.getString();
  }

  /**
  * Set field E01DOCBRN using a String value.
  */
  public void setE01DOCBRN(String newvalue)
  {
    fieldE01DOCBRN.setString(newvalue);
  }

  /**
  * Get value of field E01DOCBRN as a String.
  */
  public String getE01DOCBRN()
  {
    return fieldE01DOCBRN.getString();
  }

  /**
  * Set numeric field E01DOCBRN using a BigDecimal value.
  */
  public void setE01DOCBRN(BigDecimal newvalue)
  {
    fieldE01DOCBRN.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01DOCBRN as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01DOCBRN()
  {
    return fieldE01DOCBRN.getBigDecimal();
  }

  /**
  * Set field E01DOCBRM using a String value.
  */
  public void setE01DOCBRM(String newvalue)
  {
    fieldE01DOCBRM.setString(newvalue);
  }

  /**
  * Get value of field E01DOCBRM as a String.
  */
  public String getE01DOCBRM()
  {
    return fieldE01DOCBRM.getString();
  }

  /**
  * Set field E01DOCTIP using a String value.
  */
  public void setE01DOCTIP(String newvalue)
  {
    fieldE01DOCTIP.setString(newvalue);
  }

  /**
  * Get value of field E01DOCTIP as a String.
  */
  public String getE01DOCTIP()
  {
    return fieldE01DOCTIP.getString();
  }

  /**
  * Set field E01DOCTIN using a String value.
  */
  public void setE01DOCTIN(String newvalue)
  {
    fieldE01DOCTIN.setString(newvalue);
  }

  /**
  * Get value of field E01DOCTIN as a String.
  */
  public String getE01DOCTIN()
  {
    return fieldE01DOCTIN.getString();
  }

  /**
  * Set field E01DOCSUB using a String value.
  */
  public void setE01DOCSUB(String newvalue)
  {
    fieldE01DOCSUB.setString(newvalue);
  }

  /**
  * Get value of field E01DOCSUB as a String.
  */
  public String getE01DOCSUB()
  {
    return fieldE01DOCSUB.getString();
  }

  /**
  * Set field E01DOCSUN using a String value.
  */
  public void setE01DOCSUN(String newvalue)
  {
    fieldE01DOCSUN.setString(newvalue);
  }

  /**
  * Get value of field E01DOCSUN as a String.
  */
  public String getE01DOCSUN()
  {
    return fieldE01DOCSUN.getString();
  }

  /**
  * Set field E01DOCUSR using a String value.
  */
  public void setE01DOCUSR(String newvalue)
  {
    fieldE01DOCUSR.setString(newvalue);
  }

  /**
  * Get value of field E01DOCUSR as a String.
  */
  public String getE01DOCUSR()
  {
    return fieldE01DOCUSR.getString();
  }

}
