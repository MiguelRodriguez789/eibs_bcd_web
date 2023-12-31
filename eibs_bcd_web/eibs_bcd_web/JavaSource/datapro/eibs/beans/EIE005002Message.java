package datapro.eibs.beans;

import datapro.eibs.sockets.*;
import java.io.*;
import java.math.*;

import java.util.*;

/**
* Class generated by AS/400 CRTCLASS command from EIE005002 physical file definition.
* 
* File level identifier is 1170309120247.
* Record format level identifier is 420DA42A90EC6.
*/

public class EIE005002Message extends MessageRecord
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
                                     "E02ISIIIC",
                                     "E02ISIDSC",
                                     "E02ISIACD",
                                     "E02ISIPTY",
                                     "E02ISINUM",
                                     "E02ISISER",
                                     "E02ISICUS",
                                     "E02ISISYM",
                                     "E02NEWPTY"
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
                                   "E02ISIIIC",
                                   "E02ISIDSC",
                                   "E02ISIACD",
                                   "E02ISIPTY",
                                   "E02ISINUM",
                                   "E02ISISER",
                                   "E02ISICUS",
                                   "E02ISISYM",
                                   "E02NEWPTY"
                                 };
  final static String fid = "1170309120247";
  final static String rid = "420DA42A90EC6";
  final static String fmtname = "EIE005002";
  final int FIELDCOUNT = 18;
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
  private DecimalField fieldE02ISIIIC = null;
  private CharacterField fieldE02ISIDSC = null;
  private CharacterField fieldE02ISIACD = null;
  private CharacterField fieldE02ISIPTY = null;
  private CharacterField fieldE02ISINUM = null;
  private CharacterField fieldE02ISISER = null;
  private CharacterField fieldE02ISICUS = null;
  private CharacterField fieldE02ISISYM = null;
  private CharacterField fieldE02NEWPTY = null;

  /**
  * Constructor for EIE005002Message.
  */
  public EIE005002Message()
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
    recordsize = 168;
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
    fields[9] = fieldE02ISIIIC =
    new DecimalField(message, HEADERSIZE + 42, 13, 0, "E02ISIIIC");
    fields[10] = fieldE02ISIDSC =
    new CharacterField(message, HEADERSIZE + 55, 60, "E02ISIDSC");
    fields[11] = fieldE02ISIACD =
    new CharacterField(message, HEADERSIZE + 115, 2, "E02ISIACD");
    fields[12] = fieldE02ISIPTY =
    new CharacterField(message, HEADERSIZE + 117, 4, "E02ISIPTY");
    fields[13] = fieldE02ISINUM =
    new CharacterField(message, HEADERSIZE + 121, 12, "E02ISINUM");
    fields[14] = fieldE02ISISER =
    new CharacterField(message, HEADERSIZE + 133, 4, "E02ISISER");
    fields[15] = fieldE02ISICUS =
    new CharacterField(message, HEADERSIZE + 137, 12, "E02ISICUS");
    fields[16] = fieldE02ISISYM =
    new CharacterField(message, HEADERSIZE + 149, 15, "E02ISISYM");
    fields[17] = fieldE02NEWPTY =
    new CharacterField(message, HEADERSIZE + 164, 4, "E02NEWPTY");

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
  * Set field E02ISIIIC using a String value.
  */
  public void setE02ISIIIC(String newvalue)
  {
    fieldE02ISIIIC.setString(newvalue);
  }

  /**
  * Get value of field E02ISIIIC as a String.
  */
  public String getE02ISIIIC()
  {
    return fieldE02ISIIIC.getString();
  }

  /**
  * Set numeric field E02ISIIIC using a BigDecimal value.
  */
  public void setE02ISIIIC(BigDecimal newvalue)
  {
    fieldE02ISIIIC.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02ISIIIC as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02ISIIIC()
  {
    return fieldE02ISIIIC.getBigDecimal();
  }

  /**
  * Set field E02ISIDSC using a String value.
  */
  public void setE02ISIDSC(String newvalue)
  {
    fieldE02ISIDSC.setString(newvalue);
  }

  /**
  * Get value of field E02ISIDSC as a String.
  */
  public String getE02ISIDSC()
  {
    return fieldE02ISIDSC.getString();
  }

  /**
  * Set field E02ISIACD using a String value.
  */
  public void setE02ISIACD(String newvalue)
  {
    fieldE02ISIACD.setString(newvalue);
  }

  /**
  * Get value of field E02ISIACD as a String.
  */
  public String getE02ISIACD()
  {
    return fieldE02ISIACD.getString();
  }

  /**
  * Set field E02ISIPTY using a String value.
  */
  public void setE02ISIPTY(String newvalue)
  {
    fieldE02ISIPTY.setString(newvalue);
  }

  /**
  * Get value of field E02ISIPTY as a String.
  */
  public String getE02ISIPTY()
  {
    return fieldE02ISIPTY.getString();
  }

  /**
  * Set field E02ISINUM using a String value.
  */
  public void setE02ISINUM(String newvalue)
  {
    fieldE02ISINUM.setString(newvalue);
  }

  /**
  * Get value of field E02ISINUM as a String.
  */
  public String getE02ISINUM()
  {
    return fieldE02ISINUM.getString();
  }

  /**
  * Set field E02ISISER using a String value.
  */
  public void setE02ISISER(String newvalue)
  {
    fieldE02ISISER.setString(newvalue);
  }

  /**
  * Get value of field E02ISISER as a String.
  */
  public String getE02ISISER()
  {
    return fieldE02ISISER.getString();
  }

  /**
  * Set field E02ISICUS using a String value.
  */
  public void setE02ISICUS(String newvalue)
  {
    fieldE02ISICUS.setString(newvalue);
  }

  /**
  * Get value of field E02ISICUS as a String.
  */
  public String getE02ISICUS()
  {
    return fieldE02ISICUS.getString();
  }

  /**
  * Set field E02ISISYM using a String value.
  */
  public void setE02ISISYM(String newvalue)
  {
    fieldE02ISISYM.setString(newvalue);
  }

  /**
  * Get value of field E02ISISYM as a String.
  */
  public String getE02ISISYM()
  {
    return fieldE02ISISYM.getString();
  }

  /**
  * Set field E02NEWPTY using a String value.
  */
  public void setE02NEWPTY(String newvalue)
  {
    fieldE02NEWPTY.setString(newvalue);
  }

  /**
  * Get value of field E02NEWPTY as a String.
  */
  public String getE02NEWPTY()
  {
    return fieldE02NEWPTY.getString();
  }

}
