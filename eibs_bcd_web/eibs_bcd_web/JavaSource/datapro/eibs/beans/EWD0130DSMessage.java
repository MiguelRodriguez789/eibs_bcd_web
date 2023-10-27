package datapro.eibs.beans;

import datapro.eibs.sockets.*;
import java.io.*;
import java.math.*;

import java.util.*;

/**
* Class generated by AS/400 CRTCLASS command from EWD0130DS physical file definition.
* 
* File level identifier is 1130611113450.
* Record format level identifier is 4B0D23FCEACD3.
*/

public class EWD0130DSMessage extends MessageRecord
{
  final static String fldnames[] = {
                                     "BNKUSR",
                                     "BNKPVI",
                                     "BNKID",
                                     "BNKNME",
                                     "BNKAD1",
                                     "BNKCTY",
                                     "BNKSTA",
                                     "BNKCTR"
                                   };
  final static String tnames[] = {
                                   "BNKUSR",
                                   "BNKPVI",
                                   "BNKID",
                                   "BNKNME",
                                   "BNKAD1",
                                   "BNKCTY",
                                   "BNKSTA",
                                   "BNKCTR"
                                 };
  final static String fid = "1130611113450";
  final static String rid = "4B0D23FCEACD3";
  final static String fmtname = "EWD0130DS";
  final int FIELDCOUNT = 8;
  private static Hashtable tlookup = new Hashtable();
  private CharacterField fieldBNKUSR = null;
  private CharacterField fieldBNKPVI = null;
  private CharacterField fieldBNKID = null;
  private CharacterField fieldBNKNME = null;
  private CharacterField fieldBNKAD1 = null;
  private CharacterField fieldBNKCTY = null;
  private CharacterField fieldBNKSTA = null;
  private CharacterField fieldBNKCTR = null;

  /**
  * Constructor for EWD0130DSMessage.
  */
  public EWD0130DSMessage()
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
    recordsize = 220;
    fileid = fid;
    recordid = rid;
    message = new byte[getByteLength()];
    formatname = fmtname;
    fieldnames = fldnames;
    tagnames = tnames;
    fields = new MessageField[FIELDCOUNT];

    fields[0] = fieldBNKUSR =
    new CharacterField(message, HEADERSIZE + 0, 10, "BNKUSR");
    fields[1] = fieldBNKPVI =
    new CharacterField(message, HEADERSIZE + 10, 1, "BNKPVI");
    fields[2] = fieldBNKID =
    new CharacterField(message, HEADERSIZE + 11, 25, "BNKID");
    fields[3] = fieldBNKNME =
    new CharacterField(message, HEADERSIZE + 36, 45, "BNKNME");
    fields[4] = fieldBNKAD1 =
    new CharacterField(message, HEADERSIZE + 81, 45, "BNKAD1");
    fields[5] = fieldBNKCTY =
    new CharacterField(message, HEADERSIZE + 126, 45, "BNKCTY");
    fields[6] = fieldBNKSTA =
    new CharacterField(message, HEADERSIZE + 171, 4, "BNKSTA");
    fields[7] = fieldBNKCTR =
    new CharacterField(message, HEADERSIZE + 175, 45, "BNKCTR");

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
  * Set field BNKUSR using a String value.
  */
  public void setBNKUSR(String newvalue)
  {
    fieldBNKUSR.setString(newvalue);
  }

  /**
  * Get value of field BNKUSR as a String.
  */
  public String getBNKUSR()
  {
    return fieldBNKUSR.getString();
  }

  /**
  * Set field BNKPVI using a String value.
  */
  public void setBNKPVI(String newvalue)
  {
    fieldBNKPVI.setString(newvalue);
  }

  /**
  * Get value of field BNKPVI as a String.
  */
  public String getBNKPVI()
  {
    return fieldBNKPVI.getString();
  }

  /**
  * Set field BNKID using a String value.
  */
  public void setBNKID(String newvalue)
  {
    fieldBNKID.setString(newvalue);
  }

  /**
  * Get value of field BNKID as a String.
  */
  public String getBNKID()
  {
    return fieldBNKID.getString();
  }

  /**
  * Set field BNKNME using a String value.
  */
  public void setBNKNME(String newvalue)
  {
    fieldBNKNME.setString(newvalue);
  }

  /**
  * Get value of field BNKNME as a String.
  */
  public String getBNKNME()
  {
    return fieldBNKNME.getString();
  }

  /**
  * Set field BNKAD1 using a String value.
  */
  public void setBNKAD1(String newvalue)
  {
    fieldBNKAD1.setString(newvalue);
  }

  /**
  * Get value of field BNKAD1 as a String.
  */
  public String getBNKAD1()
  {
    return fieldBNKAD1.getString();
  }

  /**
  * Set field BNKCTY using a String value.
  */
  public void setBNKCTY(String newvalue)
  {
    fieldBNKCTY.setString(newvalue);
  }

  /**
  * Get value of field BNKCTY as a String.
  */
  public String getBNKCTY()
  {
    return fieldBNKCTY.getString();
  }

  /**
  * Set field BNKSTA using a String value.
  */
  public void setBNKSTA(String newvalue)
  {
    fieldBNKSTA.setString(newvalue);
  }

  /**
  * Get value of field BNKSTA as a String.
  */
  public String getBNKSTA()
  {
    return fieldBNKSTA.getString();
  }

  /**
  * Set field BNKCTR using a String value.
  */
  public void setBNKCTR(String newvalue)
  {
    fieldBNKCTR.setString(newvalue);
  }

  /**
  * Get value of field BNKCTR as a String.
  */
  public String getBNKCTR()
  {
    return fieldBNKCTR.getString();
  }

}
