package datapro.eibs.beans;

import datapro.eibs.sockets.*;
import java.io.*;
import java.math.*;

import java.util.*;

/**
* Class generated by AS/400 CRTCLASS command from EGC001301 physical file definition.
* 
* File level identifier is 1100706173616.
* Record format level identifier is 4529334A933C8.
*/

public class EGC001301Message extends MessageRecord
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
                                     "EUPUBK",
                                     "EUPUBR",
                                     "EUPOFC",
                                     "EUPNME"
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
                                   "EUPUBK",
                                   "EUPUBR",
                                   "EUPOFC",
                                   "EUPNME"
                                 };
  final static String fid = "1100706173616";
  final static String rid = "4529334A933C8";
  final static String fmtname = "EGC001301";
  final int FIELDCOUNT = 13;
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
  private CharacterField fieldEUPUBK = null;
  private DecimalField fieldEUPUBR = null;
  private CharacterField fieldEUPOFC = null;
  private CharacterField fieldEUPNME = null;

  /**
  * Constructor for EGC001301Message.
  */
  public EGC001301Message()
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
    recordsize = 97;
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
    fields[9] = fieldEUPUBK =
    new CharacterField(message, HEADERSIZE + 42, 2, "EUPUBK");
    fields[10] = fieldEUPUBR =
    new DecimalField(message, HEADERSIZE + 44, 4, 0, "EUPUBR");
    fields[11] = fieldEUPOFC =
    new CharacterField(message, HEADERSIZE + 48, 4, "EUPOFC");
    fields[12] = fieldEUPNME =
    new CharacterField(message, HEADERSIZE + 52, 45, "EUPNME");

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
  * Set field EUPUBK using a String value.
  */
  public void setEUPUBK(String newvalue)
  {
    fieldEUPUBK.setString(newvalue);
  }

  /**
  * Get value of field EUPUBK as a String.
  */
  public String getEUPUBK()
  {
    return fieldEUPUBK.getString();
  }

  /**
  * Set field EUPUBR using a String value.
  */
  public void setEUPUBR(String newvalue)
  {
    fieldEUPUBR.setString(newvalue);
  }

  /**
  * Get value of field EUPUBR as a String.
  */
  public String getEUPUBR()
  {
    return fieldEUPUBR.getString();
  }

  /**
  * Set numeric field EUPUBR using a BigDecimal value.
  */
  public void setEUPUBR(BigDecimal newvalue)
  {
    fieldEUPUBR.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field EUPUBR as a BigDecimal.
  */
  public BigDecimal getBigDecimalEUPUBR()
  {
    return fieldEUPUBR.getBigDecimal();
  }

  /**
  * Set field EUPOFC using a String value.
  */
  public void setEUPOFC(String newvalue)
  {
    fieldEUPOFC.setString(newvalue);
  }

  /**
  * Get value of field EUPOFC as a String.
  */
  public String getEUPOFC()
  {
    return fieldEUPOFC.getString();
  }

  /**
  * Set field EUPNME using a String value.
  */
  public void setEUPNME(String newvalue)
  {
    fieldEUPNME.setString(newvalue);
  }

  /**
  * Get value of field EUPNME as a String.
  */
  public String getEUPNME()
  {
    return fieldEUPNME.getString();
  }

}
