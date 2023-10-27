package datapro.eibs.beans;

import datapro.eibs.sockets.*;
import java.io.*;
import java.math.*;

import java.util.*;

/**
* Class generated by AS/400 CRTCLASS command from ECL000116 physical file definition.
* 
* File level identifier is 1100706173538.
* Record format level identifier is 4C341E279ED6D.
*/

public class ECL000116Message extends MessageRecord
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
                                     "CNOCF1",
                                     "CNORC1",
                                     "CNODS1",
                                     "CNORC2",
                                     "CNODS2"
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
                                   "CNOCF1",
                                   "CNORC1",
                                   "CNODS1",
                                   "CNORC2",
                                   "CNODS2"
                                 };
  final static String fid = "1100706173538";
  final static String rid = "4C341E279ED6D";
  final static String fmtname = "ECL000116";
  final int FIELDCOUNT = 14;
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
  private CharacterField fieldCNOCF1 = null;
  private CharacterField fieldCNORC1 = null;
  private CharacterField fieldCNODS1 = null;
  private CharacterField fieldCNORC2 = null;
  private CharacterField fieldCNODS2 = null;

  /**
  * Constructor for ECL000116Message.
  */
  public ECL000116Message()
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
    recordsize = 122;
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
    fields[9] = fieldCNOCF1 =
    new CharacterField(message, HEADERSIZE + 42, 2, "CNOCF1");
    fields[10] = fieldCNORC1 =
    new CharacterField(message, HEADERSIZE + 44, 4, "CNORC1");
    fields[11] = fieldCNODS1 =
    new CharacterField(message, HEADERSIZE + 48, 35, "CNODS1");
    fields[12] = fieldCNORC2 =
    new CharacterField(message, HEADERSIZE + 83, 4, "CNORC2");
    fields[13] = fieldCNODS2 =
    new CharacterField(message, HEADERSIZE + 87, 35, "CNODS2");

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
  * Set field CNOCF1 using a String value.
  */
  public void setCNOCF1(String newvalue)
  {
    fieldCNOCF1.setString(newvalue);
  }

  /**
  * Get value of field CNOCF1 as a String.
  */
  public String getCNOCF1()
  {
    return fieldCNOCF1.getString();
  }

  /**
  * Set field CNORC1 using a String value.
  */
  public void setCNORC1(String newvalue)
  {
    fieldCNORC1.setString(newvalue);
  }

  /**
  * Get value of field CNORC1 as a String.
  */
  public String getCNORC1()
  {
    return fieldCNORC1.getString();
  }

  /**
  * Set field CNODS1 using a String value.
  */
  public void setCNODS1(String newvalue)
  {
    fieldCNODS1.setString(newvalue);
  }

  /**
  * Get value of field CNODS1 as a String.
  */
  public String getCNODS1()
  {
    return fieldCNODS1.getString();
  }

  /**
  * Set field CNORC2 using a String value.
  */
  public void setCNORC2(String newvalue)
  {
    fieldCNORC2.setString(newvalue);
  }

  /**
  * Get value of field CNORC2 as a String.
  */
  public String getCNORC2()
  {
    return fieldCNORC2.getString();
  }

  /**
  * Set field CNODS2 using a String value.
  */
  public void setCNODS2(String newvalue)
  {
    fieldCNODS2.setString(newvalue);
  }

  /**
  * Get value of field CNODS2 as a String.
  */
  public String getCNODS2()
  {
    return fieldCNODS2.getString();
  }

}
