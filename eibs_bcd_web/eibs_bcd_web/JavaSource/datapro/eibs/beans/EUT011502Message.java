package datapro.eibs.beans;

import datapro.eibs.sockets.*;
import java.io.*;
import java.math.*;

import java.util.*;

/**
* Class generated by AS/400 CRTCLASS command from EUT011502 physical file definition.
* 
* File level identifier is 1130918171944.
* Record format level identifier is 46449ACA37E28.
*/

public class EUT011502Message extends MessageRecord
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
                                     "E02COMSID",
                                     "E02COIDEN",
                                     "E02COILIF",
                                     "E02COENDS",
                                     "E02COIMFL",
                                     "E02COTGAD",
                                     "E02COTGPO",
                                     "E02CMOCDE"
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
                                   "E02COMSID",
                                   "E02COIDEN",
                                   "E02COILIF",
                                   "E02COENDS",
                                   "E02COIMFL",
                                   "E02COTGAD",
                                   "E02COTGPO",
                                   "E02CMOCDE"
                                 };
  final static String fid = "1130918171944";
  final static String rid = "46449ACA37E28";
  final static String fmtname = "EUT011502";
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
  private CharacterField fieldE02COMSID = null;
  private CharacterField fieldE02COIDEN = null;
  private CharacterField fieldE02COILIF = null;
  private CharacterField fieldE02COENDS = null;
  private CharacterField fieldE02COIMFL = null;
  private CharacterField fieldE02COTGAD = null;
  private CharacterField fieldE02COTGPO = null;
  private CharacterField fieldE02CMOCDE = null;

  /**
  * Constructor for EUT011502Message.
  */
  public EUT011502Message()
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
    recordsize = 517;
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
    fields[9] = fieldE02COMSID =
    new CharacterField(message, HEADERSIZE + 42, 6, "E02COMSID");
    fields[10] = fieldE02COIDEN =
    new CharacterField(message, HEADERSIZE + 48, 3, "E02COIDEN");
    fields[11] = fieldE02COILIF =
    new CharacterField(message, HEADERSIZE + 51, 1, "E02COILIF");
    fields[12] = fieldE02COENDS =
    new CharacterField(message, HEADERSIZE + 52, 80, "E02COENDS");
    fields[13] = fieldE02COIMFL =
    new CharacterField(message, HEADERSIZE + 132, 50, "E02COIMFL");
    fields[14] = fieldE02COTGAD =
    new CharacterField(message, HEADERSIZE + 182, 255, "E02COTGAD");
    fields[15] = fieldE02COTGPO =
    new CharacterField(message, HEADERSIZE + 437, 50, "E02COTGPO");
    fields[16] = fieldE02CMOCDE =
    new CharacterField(message, HEADERSIZE + 487, 30, "E02CMOCDE");

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
  * Set field E02COMSID using a String value.
  */
  public void setE02COMSID(String newvalue)
  {
    fieldE02COMSID.setString(newvalue);
  }

  /**
  * Get value of field E02COMSID as a String.
  */
  public String getE02COMSID()
  {
    return fieldE02COMSID.getString();
  }

  /**
  * Set field E02COIDEN using a String value.
  */
  public void setE02COIDEN(String newvalue)
  {
    fieldE02COIDEN.setString(newvalue);
  }

  /**
  * Get value of field E02COIDEN as a String.
  */
  public String getE02COIDEN()
  {
    return fieldE02COIDEN.getString();
  }

  /**
  * Set field E02COILIF using a String value.
  */
  public void setE02COILIF(String newvalue)
  {
    fieldE02COILIF.setString(newvalue);
  }

  /**
  * Get value of field E02COILIF as a String.
  */
  public String getE02COILIF()
  {
    return fieldE02COILIF.getString();
  }

  /**
  * Set field E02COENDS using a String value.
  */
  public void setE02COENDS(String newvalue)
  {
    fieldE02COENDS.setString(newvalue);
  }

  /**
  * Get value of field E02COENDS as a String.
  */
  public String getE02COENDS()
  {
    return fieldE02COENDS.getString();
  }

  /**
  * Set field E02COIMFL using a String value.
  */
  public void setE02COIMFL(String newvalue)
  {
    fieldE02COIMFL.setString(newvalue);
  }

  /**
  * Get value of field E02COIMFL as a String.
  */
  public String getE02COIMFL()
  {
    return fieldE02COIMFL.getString();
  }

  /**
  * Set field E02COTGAD using a String value.
  */
  public void setE02COTGAD(String newvalue)
  {
    fieldE02COTGAD.setString(newvalue);
  }

  /**
  * Get value of field E02COTGAD as a String.
  */
  public String getE02COTGAD()
  {
    return fieldE02COTGAD.getString();
  }

  /**
  * Set field E02COTGPO using a String value.
  */
  public void setE02COTGPO(String newvalue)
  {
    fieldE02COTGPO.setString(newvalue);
  }

  /**
  * Get value of field E02COTGPO as a String.
  */
  public String getE02COTGPO()
  {
    return fieldE02COTGPO.getString();
  }

  /**
  * Set field E02CMOCDE using a String value.
  */
  public void setE02CMOCDE(String newvalue)
  {
    fieldE02CMOCDE.setString(newvalue);
  }

  /**
  * Get value of field E02CMOCDE as a String.
  */
  public String getE02CMOCDE()
  {
    return fieldE02CMOCDE.getString();
  }

}
