package datapro.eibs.beans;

import datapro.eibs.sockets.*;
import java.io.*;
import java.math.*;

import java.util.*;

/**
* Class generated by AS/400 CRTCLASS command from ERG000102 physical file definition.
* 
* File level identifier is 1100706173646.
* Record format level identifier is 41D32CB66BF57.
*/

public class ERG000102Message extends MessageRecord
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
                                     "CODACC",
                                     "GENDRO",
                                     "GENARC",
                                     "GENCRE",
                                     "GENINS",
                                     "GENNRP",
                                     "GENPER"
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
                                   "CODACC",
                                   "GENDRO",
                                   "GENARC",
                                   "GENCRE",
                                   "GENINS",
                                   "GENNRP",
                                   "GENPER"
                                 };
  final static String fid = "1100706173646";
  final static String rid = "41D32CB66BF57";
  final static String fmtname = "ERG000102";
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
  private CharacterField fieldCODACC = null;
  private CharacterField fieldGENDRO = null;
  private CharacterField fieldGENARC = null;
  private CharacterField fieldGENCRE = null;
  private CharacterField fieldGENINS = null;
  private DecimalField fieldGENNRP = null;
  private CharacterField fieldGENPER = null;

  /**
  * Constructor for ERG000102Message.
  */
  public ERG000102Message()
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
    recordsize = 1216;
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
    fields[9] = fieldCODACC =
    new CharacterField(message, HEADERSIZE + 42, 1, "CODACC");
    fields[10] = fieldGENDRO =
    new CharacterField(message, HEADERSIZE + 43, 50, "GENDRO");
    fields[11] = fieldGENARC =
    new CharacterField(message, HEADERSIZE + 93, 8, "GENARC");
    fields[12] = fieldGENCRE =
    new CharacterField(message, HEADERSIZE + 101, 700, "GENCRE");
    fields[13] = fieldGENINS =
    new CharacterField(message, HEADERSIZE + 801, 400, "GENINS");
    fields[14] = fieldGENNRP =
    new DecimalField(message, HEADERSIZE + 1201, 9, 0, "GENNRP");
    fields[15] = fieldGENPER =
    new CharacterField(message, HEADERSIZE + 1210, 6, "GENPER");

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
  * Set field CODACC using a String value.
  */
  public void setCODACC(String newvalue)
  {
    fieldCODACC.setString(newvalue);
  }

  /**
  * Get value of field CODACC as a String.
  */
  public String getCODACC()
  {
    return fieldCODACC.getString();
  }

  /**
  * Set field GENDRO using a String value.
  */
  public void setGENDRO(String newvalue)
  {
    fieldGENDRO.setString(newvalue);
  }

  /**
  * Get value of field GENDRO as a String.
  */
  public String getGENDRO()
  {
    return fieldGENDRO.getString();
  }

  /**
  * Set field GENARC using a String value.
  */
  public void setGENARC(String newvalue)
  {
    fieldGENARC.setString(newvalue);
  }

  /**
  * Get value of field GENARC as a String.
  */
  public String getGENARC()
  {
    return fieldGENARC.getString();
  }

  /**
  * Set field GENCRE using a String value.
  */
  public void setGENCRE(String newvalue)
  {
    fieldGENCRE.setString(newvalue);
  }

  /**
  * Get value of field GENCRE as a String.
  */
  public String getGENCRE()
  {
    return fieldGENCRE.getString();
  }

  /**
  * Set field GENINS using a String value.
  */
  public void setGENINS(String newvalue)
  {
    fieldGENINS.setString(newvalue);
  }

  /**
  * Get value of field GENINS as a String.
  */
  public String getGENINS()
  {
    return fieldGENINS.getString();
  }

  /**
  * Set field GENNRP using a String value.
  */
  public void setGENNRP(String newvalue)
  {
    fieldGENNRP.setString(newvalue);
  }

  /**
  * Get value of field GENNRP as a String.
  */
  public String getGENNRP()
  {
    return fieldGENNRP.getString();
  }

  /**
  * Set numeric field GENNRP using a BigDecimal value.
  */
  public void setGENNRP(BigDecimal newvalue)
  {
    fieldGENNRP.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field GENNRP as a BigDecimal.
  */
  public BigDecimal getBigDecimalGENNRP()
  {
    return fieldGENNRP.getBigDecimal();
  }

  /**
  * Set field GENPER using a String value.
  */
  public void setGENPER(String newvalue)
  {
    fieldGENPER.setString(newvalue);
  }

  /**
  * Get value of field GENPER as a String.
  */
  public String getGENPER()
  {
    return fieldGENPER.getString();
  }

}
