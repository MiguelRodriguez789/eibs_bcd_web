package datapro.eibs.beans;

import datapro.eibs.sockets.*;
import java.io.*;
import java.math.*;

import java.util.*;

/**
* Class generated by AS/400 CRTCLASS command from EDP073101 physical file definition.
* 
* File level identifier is 1130611113113.
* Record format level identifier is 3EC4330889F53.
*/

public class EDP073101Message extends MessageRecord
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
                                     "E01CNTLAN",
                                     "E01DPFFMT",
                                     "E01DPFDSC",
                                     "E01CNOCFL",
                                     "E01CNORCD",
                                     "E01CNODSC",
                                     "E01OPECDE"
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
                                   "E01CNTLAN",
                                   "E01DPFFMT",
                                   "E01DPFDSC",
                                   "E01CNOCFL",
                                   "E01CNORCD",
                                   "E01CNODSC",
                                   "E01OPECDE"
                                 };
  final static String fid = "1130611113113";
  final static String rid = "3EC4330889F53";
  final static String fmtname = "EDP073101";
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
  private CharacterField fieldE01CNTLAN = null;
  private CharacterField fieldE01DPFFMT = null;
  private CharacterField fieldE01DPFDSC = null;
  private CharacterField fieldE01CNOCFL = null;
  private CharacterField fieldE01CNORCD = null;
  private CharacterField fieldE01CNODSC = null;
  private CharacterField fieldE01OPECDE = null;

  /**
  * Constructor for EDP073101Message.
  */
  public EDP073101Message()
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
    recordsize = 157;
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
    fields[9] = fieldE01CNTLAN =
    new CharacterField(message, HEADERSIZE + 42, 1, "E01CNTLAN");
    fields[10] = fieldE01DPFFMT =
    new CharacterField(message, HEADERSIZE + 43, 2, "E01DPFFMT");
    fields[11] = fieldE01DPFDSC =
    new CharacterField(message, HEADERSIZE + 45, 60, "E01DPFDSC");
    fields[12] = fieldE01CNOCFL =
    new CharacterField(message, HEADERSIZE + 105, 2, "E01CNOCFL");
    fields[13] = fieldE01CNORCD =
    new CharacterField(message, HEADERSIZE + 107, 4, "E01CNORCD");
    fields[14] = fieldE01CNODSC =
    new CharacterField(message, HEADERSIZE + 111, 45, "E01CNODSC");
    fields[15] = fieldE01OPECDE =
    new CharacterField(message, HEADERSIZE + 156, 1, "E01OPECDE");

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
  * Set field E01CNTLAN using a String value.
  */
  public void setE01CNTLAN(String newvalue)
  {
    fieldE01CNTLAN.setString(newvalue);
  }

  /**
  * Get value of field E01CNTLAN as a String.
  */
  public String getE01CNTLAN()
  {
    return fieldE01CNTLAN.getString();
  }

  /**
  * Set field E01DPFFMT using a String value.
  */
  public void setE01DPFFMT(String newvalue)
  {
    fieldE01DPFFMT.setString(newvalue);
  }

  /**
  * Get value of field E01DPFFMT as a String.
  */
  public String getE01DPFFMT()
  {
    return fieldE01DPFFMT.getString();
  }

  /**
  * Set field E01DPFDSC using a String value.
  */
  public void setE01DPFDSC(String newvalue)
  {
    fieldE01DPFDSC.setString(newvalue);
  }

  /**
  * Get value of field E01DPFDSC as a String.
  */
  public String getE01DPFDSC()
  {
    return fieldE01DPFDSC.getString();
  }

  /**
  * Set field E01CNOCFL using a String value.
  */
  public void setE01CNOCFL(String newvalue)
  {
    fieldE01CNOCFL.setString(newvalue);
  }

  /**
  * Get value of field E01CNOCFL as a String.
  */
  public String getE01CNOCFL()
  {
    return fieldE01CNOCFL.getString();
  }

  /**
  * Set field E01CNORCD using a String value.
  */
  public void setE01CNORCD(String newvalue)
  {
    fieldE01CNORCD.setString(newvalue);
  }

  /**
  * Get value of field E01CNORCD as a String.
  */
  public String getE01CNORCD()
  {
    return fieldE01CNORCD.getString();
  }

  /**
  * Set field E01CNODSC using a String value.
  */
  public void setE01CNODSC(String newvalue)
  {
    fieldE01CNODSC.setString(newvalue);
  }

  /**
  * Get value of field E01CNODSC as a String.
  */
  public String getE01CNODSC()
  {
    return fieldE01CNODSC.getString();
  }

  /**
  * Set field E01OPECDE using a String value.
  */
  public void setE01OPECDE(String newvalue)
  {
    fieldE01OPECDE.setString(newvalue);
  }

  /**
  * Get value of field E01OPECDE as a String.
  */
  public String getE01OPECDE()
  {
    return fieldE01OPECDE.getString();
  }

}
