package datapro.eibs.beans;

import datapro.eibs.sockets.*;
import java.io.*;
import java.math.*;

import java.util.*;

/**
* Class generated by AS/400 CRTCLASS command from EPV100604 physical file definition.
* 
* File level identifier is 1130611113305.
* Record format level identifier is 541542CF5A691.
*/

public class EPV100604Message extends MessageRecord
{
  final static String fldnames[] = {
                                     "H04USERID",
                                     "H04PROGRM",
                                     "H04TIMSYS",
                                     "H04SCRCOD",
                                     "H04OPECOD",
                                     "H04FLGMAS",
                                     "H04FLGWK1",
                                     "H04FLGWK2",
                                     "H04FLGWK3",
                                     "E04PVMUC1",
                                     "E04PVMACD",
                                     "E04PVMTYP",
                                     "E04PVMPRO",
                                     "E04DSCPRO",
                                     "E04PVMREC"
                                   };
  final static String tnames[] = {
                                   "H04USERID",
                                   "H04PROGRM",
                                   "H04TIMSYS",
                                   "H04SCRCOD",
                                   "H04OPECOD",
                                   "H04FLGMAS",
                                   "H04FLGWK1",
                                   "H04FLGWK2",
                                   "H04FLGWK3",
                                   "E04PVMUC1",
                                   "E04PVMACD",
                                   "E04PVMTYP",
                                   "E04PVMPRO",
                                   "E04DSCPRO",
                                   "E04PVMREC"
                                 };
  final static String fid = "1130611113305";
  final static String rid = "541542CF5A691";
  final static String fmtname = "EPV100604";
  final int FIELDCOUNT = 15;
  private static Hashtable tlookup = new Hashtable();
  private CharacterField fieldH04USERID = null;
  private CharacterField fieldH04PROGRM = null;
  private CharacterField fieldH04TIMSYS = null;
  private CharacterField fieldH04SCRCOD = null;
  private CharacterField fieldH04OPECOD = null;
  private CharacterField fieldH04FLGMAS = null;
  private CharacterField fieldH04FLGWK1 = null;
  private CharacterField fieldH04FLGWK2 = null;
  private CharacterField fieldH04FLGWK3 = null;
  private CharacterField fieldE04PVMUC1 = null;
  private CharacterField fieldE04PVMACD = null;
  private CharacterField fieldE04PVMTYP = null;
  private CharacterField fieldE04PVMPRO = null;
  private CharacterField fieldE04DSCPRO = null;
  private CharacterField fieldE04PVMREC = null;

  /**
  * Constructor for EPV100604Message.
  */
  public EPV100604Message()
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
    recordsize = 87;
    fileid = fid;
    recordid = rid;
    message = new byte[getByteLength()];
    formatname = fmtname;
    fieldnames = fldnames;
    tagnames = tnames;
    fields = new MessageField[FIELDCOUNT];

    fields[0] = fieldH04USERID =
    new CharacterField(message, HEADERSIZE + 0, 10, "H04USERID");
    fields[1] = fieldH04PROGRM =
    new CharacterField(message, HEADERSIZE + 10, 10, "H04PROGRM");
    fields[2] = fieldH04TIMSYS =
    new CharacterField(message, HEADERSIZE + 20, 12, "H04TIMSYS");
    fields[3] = fieldH04SCRCOD =
    new CharacterField(message, HEADERSIZE + 32, 2, "H04SCRCOD");
    fields[4] = fieldH04OPECOD =
    new CharacterField(message, HEADERSIZE + 34, 4, "H04OPECOD");
    fields[5] = fieldH04FLGMAS =
    new CharacterField(message, HEADERSIZE + 38, 1, "H04FLGMAS");
    fields[6] = fieldH04FLGWK1 =
    new CharacterField(message, HEADERSIZE + 39, 1, "H04FLGWK1");
    fields[7] = fieldH04FLGWK2 =
    new CharacterField(message, HEADERSIZE + 40, 1, "H04FLGWK2");
    fields[8] = fieldH04FLGWK3 =
    new CharacterField(message, HEADERSIZE + 41, 1, "H04FLGWK3");
    fields[9] = fieldE04PVMUC1 =
    new CharacterField(message, HEADERSIZE + 42, 4, "E04PVMUC1");
    fields[10] = fieldE04PVMACD =
    new CharacterField(message, HEADERSIZE + 46, 2, "E04PVMACD");
    fields[11] = fieldE04PVMTYP =
    new CharacterField(message, HEADERSIZE + 48, 4, "E04PVMTYP");
    fields[12] = fieldE04PVMPRO =
    new CharacterField(message, HEADERSIZE + 52, 4, "E04PVMPRO");
    fields[13] = fieldE04DSCPRO =
    new CharacterField(message, HEADERSIZE + 56, 30, "E04DSCPRO");
    fields[14] = fieldE04PVMREC =
    new CharacterField(message, HEADERSIZE + 86, 1, "E04PVMREC");

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
  * Set field H04USERID using a String value.
  */
  public void setH04USERID(String newvalue)
  {
    fieldH04USERID.setString(newvalue);
  }

  /**
  * Get value of field H04USERID as a String.
  */
  public String getH04USERID()
  {
    return fieldH04USERID.getString();
  }

  /**
  * Set field H04PROGRM using a String value.
  */
  public void setH04PROGRM(String newvalue)
  {
    fieldH04PROGRM.setString(newvalue);
  }

  /**
  * Get value of field H04PROGRM as a String.
  */
  public String getH04PROGRM()
  {
    return fieldH04PROGRM.getString();
  }

  /**
  * Set field H04TIMSYS using a String value.
  */
  public void setH04TIMSYS(String newvalue)
  {
    fieldH04TIMSYS.setString(newvalue);
  }

  /**
  * Get value of field H04TIMSYS as a String.
  */
  public String getH04TIMSYS()
  {
    return fieldH04TIMSYS.getString();
  }

  /**
  * Set field H04SCRCOD using a String value.
  */
  public void setH04SCRCOD(String newvalue)
  {
    fieldH04SCRCOD.setString(newvalue);
  }

  /**
  * Get value of field H04SCRCOD as a String.
  */
  public String getH04SCRCOD()
  {
    return fieldH04SCRCOD.getString();
  }

  /**
  * Set field H04OPECOD using a String value.
  */
  public void setH04OPECOD(String newvalue)
  {
    fieldH04OPECOD.setString(newvalue);
  }

  /**
  * Get value of field H04OPECOD as a String.
  */
  public String getH04OPECOD()
  {
    return fieldH04OPECOD.getString();
  }

  /**
  * Set field H04FLGMAS using a String value.
  */
  public void setH04FLGMAS(String newvalue)
  {
    fieldH04FLGMAS.setString(newvalue);
  }

  /**
  * Get value of field H04FLGMAS as a String.
  */
  public String getH04FLGMAS()
  {
    return fieldH04FLGMAS.getString();
  }

  /**
  * Set field H04FLGWK1 using a String value.
  */
  public void setH04FLGWK1(String newvalue)
  {
    fieldH04FLGWK1.setString(newvalue);
  }

  /**
  * Get value of field H04FLGWK1 as a String.
  */
  public String getH04FLGWK1()
  {
    return fieldH04FLGWK1.getString();
  }

  /**
  * Set field H04FLGWK2 using a String value.
  */
  public void setH04FLGWK2(String newvalue)
  {
    fieldH04FLGWK2.setString(newvalue);
  }

  /**
  * Get value of field H04FLGWK2 as a String.
  */
  public String getH04FLGWK2()
  {
    return fieldH04FLGWK2.getString();
  }

  /**
  * Set field H04FLGWK3 using a String value.
  */
  public void setH04FLGWK3(String newvalue)
  {
    fieldH04FLGWK3.setString(newvalue);
  }

  /**
  * Get value of field H04FLGWK3 as a String.
  */
  public String getH04FLGWK3()
  {
    return fieldH04FLGWK3.getString();
  }

  /**
  * Set field E04PVMUC1 using a String value.
  */
  public void setE04PVMUC1(String newvalue)
  {
    fieldE04PVMUC1.setString(newvalue);
  }

  /**
  * Get value of field E04PVMUC1 as a String.
  */
  public String getE04PVMUC1()
  {
    return fieldE04PVMUC1.getString();
  }

  /**
  * Set field E04PVMACD using a String value.
  */
  public void setE04PVMACD(String newvalue)
  {
    fieldE04PVMACD.setString(newvalue);
  }

  /**
  * Get value of field E04PVMACD as a String.
  */
  public String getE04PVMACD()
  {
    return fieldE04PVMACD.getString();
  }

  /**
  * Set field E04PVMTYP using a String value.
  */
  public void setE04PVMTYP(String newvalue)
  {
    fieldE04PVMTYP.setString(newvalue);
  }

  /**
  * Get value of field E04PVMTYP as a String.
  */
  public String getE04PVMTYP()
  {
    return fieldE04PVMTYP.getString();
  }

  /**
  * Set field E04PVMPRO using a String value.
  */
  public void setE04PVMPRO(String newvalue)
  {
    fieldE04PVMPRO.setString(newvalue);
  }

  /**
  * Get value of field E04PVMPRO as a String.
  */
  public String getE04PVMPRO()
  {
    return fieldE04PVMPRO.getString();
  }

  /**
  * Set field E04DSCPRO using a String value.
  */
  public void setE04DSCPRO(String newvalue)
  {
    fieldE04DSCPRO.setString(newvalue);
  }

  /**
  * Get value of field E04DSCPRO as a String.
  */
  public String getE04DSCPRO()
  {
    return fieldE04DSCPRO.getString();
  }

  /**
  * Set field E04PVMREC using a String value.
  */
  public void setE04PVMREC(String newvalue)
  {
    fieldE04PVMREC.setString(newvalue);
  }

  /**
  * Get value of field E04PVMREC as a String.
  */
  public String getE04PVMREC()
  {
    return fieldE04PVMREC.getString();
  }

}