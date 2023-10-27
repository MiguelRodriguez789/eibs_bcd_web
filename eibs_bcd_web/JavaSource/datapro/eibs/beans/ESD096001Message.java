package datapro.eibs.beans;

import datapro.eibs.sockets.*;
import java.io.*;
import java.math.*;

import java.util.*;

/**
* Class generated by AS/400 CRTCLASS command from ESD096001 physical file definition.
* 
* File level identifier is 1151215112159.
* Record format level identifier is 4DD7FD9707D45.
*/

public class ESD096001Message extends MessageRecord
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
                                     "E01SELCDP",
                                     "E01MEXCDP",
                                     "E01MEXCLO",
                                     "E01MEXTCL",
                                     "E01MEXMUN",
                                     "E01MEXEDO",
                                     "E01MEXCIU",
                                     "E01OLDCIU"
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
                                   "E01SELCDP",
                                   "E01MEXCDP",
                                   "E01MEXCLO",
                                   "E01MEXTCL",
                                   "E01MEXMUN",
                                   "E01MEXEDO",
                                   "E01MEXCIU",
                                   "E01OLDCIU"
                                 };
  final static String fid = "1151215112159";
  final static String rid = "4DD7FD9707D45";
  final static String fmtname = "ESD096001";
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
  private CharacterField fieldE01SELCDP = null;
  private CharacterField fieldE01MEXCDP = null;
  private CharacterField fieldE01MEXCLO = null;
  private CharacterField fieldE01MEXTCL = null;
  private CharacterField fieldE01MEXMUN = null;
  private CharacterField fieldE01MEXEDO = null;
  private CharacterField fieldE01MEXCIU = null;
  private CharacterField fieldE01OLDCIU = null;

  /**
  * Constructor for ESD096001Message.
  */
  public ESD096001Message()
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
    recordsize = 242;
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
    fields[9] = fieldE01SELCDP =
    new CharacterField(message, HEADERSIZE + 42, 10, "E01SELCDP");
    fields[10] = fieldE01MEXCDP =
    new CharacterField(message, HEADERSIZE + 52, 10, "E01MEXCDP");
    fields[11] = fieldE01MEXCLO =
    new CharacterField(message, HEADERSIZE + 62, 30, "E01MEXCLO");
    fields[12] = fieldE01MEXTCL =
    new CharacterField(message, HEADERSIZE + 92, 30, "E01MEXTCL");
    fields[13] = fieldE01MEXMUN =
    new CharacterField(message, HEADERSIZE + 122, 30, "E01MEXMUN");
    fields[14] = fieldE01MEXEDO =
    new CharacterField(message, HEADERSIZE + 152, 30, "E01MEXEDO");
    fields[15] = fieldE01MEXCIU =
    new CharacterField(message, HEADERSIZE + 182, 30, "E01MEXCIU");
    fields[16] = fieldE01OLDCIU =
    new CharacterField(message, HEADERSIZE + 212, 30, "E01OLDCIU");

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
  * Set field E01SELCDP using a String value.
  */
  public void setE01SELCDP(String newvalue)
  {
    fieldE01SELCDP.setString(newvalue);
  }

  /**
  * Get value of field E01SELCDP as a String.
  */
  public String getE01SELCDP()
  {
    return fieldE01SELCDP.getString();
  }

  /**
  * Set field E01MEXCDP using a String value.
  */
  public void setE01MEXCDP(String newvalue)
  {
    fieldE01MEXCDP.setString(newvalue);
  }

  /**
  * Get value of field E01MEXCDP as a String.
  */
  public String getE01MEXCDP()
  {
    return fieldE01MEXCDP.getString();
  }

  /**
  * Set field E01MEXCLO using a String value.
  */
  public void setE01MEXCLO(String newvalue)
  {
    fieldE01MEXCLO.setString(newvalue);
  }

  /**
  * Get value of field E01MEXCLO as a String.
  */
  public String getE01MEXCLO()
  {
    return fieldE01MEXCLO.getString();
  }

  /**
  * Set field E01MEXTCL using a String value.
  */
  public void setE01MEXTCL(String newvalue)
  {
    fieldE01MEXTCL.setString(newvalue);
  }

  /**
  * Get value of field E01MEXTCL as a String.
  */
  public String getE01MEXTCL()
  {
    return fieldE01MEXTCL.getString();
  }

  /**
  * Set field E01MEXMUN using a String value.
  */
  public void setE01MEXMUN(String newvalue)
  {
    fieldE01MEXMUN.setString(newvalue);
  }

  /**
  * Get value of field E01MEXMUN as a String.
  */
  public String getE01MEXMUN()
  {
    return fieldE01MEXMUN.getString();
  }

  /**
  * Set field E01MEXEDO using a String value.
  */
  public void setE01MEXEDO(String newvalue)
  {
    fieldE01MEXEDO.setString(newvalue);
  }

  /**
  * Get value of field E01MEXEDO as a String.
  */
  public String getE01MEXEDO()
  {
    return fieldE01MEXEDO.getString();
  }

  /**
  * Set field E01MEXCIU using a String value.
  */
  public void setE01MEXCIU(String newvalue)
  {
    fieldE01MEXCIU.setString(newvalue);
  }

  /**
  * Get value of field E01MEXCIU as a String.
  */
  public String getE01MEXCIU()
  {
    return fieldE01MEXCIU.getString();
  }

  /**
  * Set field E01OLDCIU using a String value.
  */
  public void setE01OLDCIU(String newvalue)
  {
    fieldE01OLDCIU.setString(newvalue);
  }

  /**
  * Get value of field E01OLDCIU as a String.
  */
  public String getE01OLDCIU()
  {
    return fieldE01OLDCIU.getString();
  }

}