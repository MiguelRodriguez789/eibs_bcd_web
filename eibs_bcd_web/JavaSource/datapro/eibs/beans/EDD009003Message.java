package datapro.eibs.beans;

import datapro.eibs.sockets.*;
import java.io.*;
import java.math.*;

import java.util.*;

/**
* Class generated by AS/400 CRTCLASS command from EDD009003 physical file definition.
* 
* File level identifier is 1170113101616.
* Record format level identifier is 47A86BED1258F.
*/

public class EDD009003Message extends MessageRecord
{
  final static String fldnames[] = {
                                     "H03USERID",
                                     "H03PROGRM",
                                     "H03TIMSYS",
                                     "H03SCRCOD",
                                     "H03OPECOD",
                                     "H03FLGMAS",
                                     "H03FLGWK1",
                                     "H03FLGWK2",
                                     "H03FLGWK3",
                                     "E03ACMACC",
                                     "E03DATEM",
                                     "E03DATED",
                                     "E03DATEY",
                                     "E03AMT",
                                     "E03DRCR",
                                     "E03NAR",
                                     "E03PRCFLG"
                                   };
  final static String tnames[] = {
                                   "H03USERID",
                                   "H03PROGRM",
                                   "H03TIMSYS",
                                   "H03SCRCOD",
                                   "H03OPECOD",
                                   "H03FLGMAS",
                                   "H03FLGWK1",
                                   "H03FLGWK2",
                                   "H03FLGWK3",
                                   "E03ACMACC",
                                   "E03DATEM",
                                   "E03DATED",
                                   "E03DATEY",
                                   "E03AMT",
                                   "E03DRCR",
                                   "E03NAR",
                                   "E03PRCFLG"
                                 };
  final static String fid = "1170113101616";
  final static String rid = "47A86BED1258F";
  final static String fmtname = "EDD009003";
  final int FIELDCOUNT = 17;
  private static Hashtable tlookup = new Hashtable();
  private CharacterField fieldH03USERID = null;
  private CharacterField fieldH03PROGRM = null;
  private CharacterField fieldH03TIMSYS = null;
  private CharacterField fieldH03SCRCOD = null;
  private CharacterField fieldH03OPECOD = null;
  private CharacterField fieldH03FLGMAS = null;
  private CharacterField fieldH03FLGWK1 = null;
  private CharacterField fieldH03FLGWK2 = null;
  private CharacterField fieldH03FLGWK3 = null;
  private DecimalField fieldE03ACMACC = null;
  private DecimalField fieldE03DATEM = null;
  private DecimalField fieldE03DATED = null;
  private DecimalField fieldE03DATEY = null;
  private DecimalField fieldE03AMT = null;
  private CharacterField fieldE03DRCR = null;
  private CharacterField fieldE03NAR = null;
  private CharacterField fieldE03PRCFLG = null;

  /**
  * Constructor for EDD009003Message.
  */
  public EDD009003Message()
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
    recordsize = 145;
    fileid = fid;
    recordid = rid;
    message = new byte[getByteLength()];
    formatname = fmtname;
    fieldnames = fldnames;
    tagnames = tnames;
    fields = new MessageField[FIELDCOUNT];

    fields[0] = fieldH03USERID =
    new CharacterField(message, HEADERSIZE + 0, 10, "H03USERID");
    fields[1] = fieldH03PROGRM =
    new CharacterField(message, HEADERSIZE + 10, 10, "H03PROGRM");
    fields[2] = fieldH03TIMSYS =
    new CharacterField(message, HEADERSIZE + 20, 12, "H03TIMSYS");
    fields[3] = fieldH03SCRCOD =
    new CharacterField(message, HEADERSIZE + 32, 2, "H03SCRCOD");
    fields[4] = fieldH03OPECOD =
    new CharacterField(message, HEADERSIZE + 34, 4, "H03OPECOD");
    fields[5] = fieldH03FLGMAS =
    new CharacterField(message, HEADERSIZE + 38, 1, "H03FLGMAS");
    fields[6] = fieldH03FLGWK1 =
    new CharacterField(message, HEADERSIZE + 39, 1, "H03FLGWK1");
    fields[7] = fieldH03FLGWK2 =
    new CharacterField(message, HEADERSIZE + 40, 1, "H03FLGWK2");
    fields[8] = fieldH03FLGWK3 =
    new CharacterField(message, HEADERSIZE + 41, 1, "H03FLGWK3");
    fields[9] = fieldE03ACMACC =
    new DecimalField(message, HEADERSIZE + 42, 13, 0, "E03ACMACC");
    fields[10] = fieldE03DATEM =
    new DecimalField(message, HEADERSIZE + 55, 3, 0, "E03DATEM");
    fields[11] = fieldE03DATED =
    new DecimalField(message, HEADERSIZE + 58, 3, 0, "E03DATED");
    fields[12] = fieldE03DATEY =
    new DecimalField(message, HEADERSIZE + 61, 5, 0, "E03DATEY");
    fields[13] = fieldE03AMT =
    new DecimalField(message, HEADERSIZE + 66, 17, 2, "E03AMT");
    fields[14] = fieldE03DRCR =
    new CharacterField(message, HEADERSIZE + 83, 1, "E03DRCR");
    fields[15] = fieldE03NAR =
    new CharacterField(message, HEADERSIZE + 84, 60, "E03NAR");
    fields[16] = fieldE03PRCFLG =
    new CharacterField(message, HEADERSIZE + 144, 1, "E03PRCFLG");

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
  * Set field H03USERID using a String value.
  */
  public void setH03USERID(String newvalue)
  {
    fieldH03USERID.setString(newvalue);
  }

  /**
  * Get value of field H03USERID as a String.
  */
  public String getH03USERID()
  {
    return fieldH03USERID.getString();
  }

  /**
  * Set field H03PROGRM using a String value.
  */
  public void setH03PROGRM(String newvalue)
  {
    fieldH03PROGRM.setString(newvalue);
  }

  /**
  * Get value of field H03PROGRM as a String.
  */
  public String getH03PROGRM()
  {
    return fieldH03PROGRM.getString();
  }

  /**
  * Set field H03TIMSYS using a String value.
  */
  public void setH03TIMSYS(String newvalue)
  {
    fieldH03TIMSYS.setString(newvalue);
  }

  /**
  * Get value of field H03TIMSYS as a String.
  */
  public String getH03TIMSYS()
  {
    return fieldH03TIMSYS.getString();
  }

  /**
  * Set field H03SCRCOD using a String value.
  */
  public void setH03SCRCOD(String newvalue)
  {
    fieldH03SCRCOD.setString(newvalue);
  }

  /**
  * Get value of field H03SCRCOD as a String.
  */
  public String getH03SCRCOD()
  {
    return fieldH03SCRCOD.getString();
  }

  /**
  * Set field H03OPECOD using a String value.
  */
  public void setH03OPECOD(String newvalue)
  {
    fieldH03OPECOD.setString(newvalue);
  }

  /**
  * Get value of field H03OPECOD as a String.
  */
  public String getH03OPECOD()
  {
    return fieldH03OPECOD.getString();
  }

  /**
  * Set field H03FLGMAS using a String value.
  */
  public void setH03FLGMAS(String newvalue)
  {
    fieldH03FLGMAS.setString(newvalue);
  }

  /**
  * Get value of field H03FLGMAS as a String.
  */
  public String getH03FLGMAS()
  {
    return fieldH03FLGMAS.getString();
  }

  /**
  * Set field H03FLGWK1 using a String value.
  */
  public void setH03FLGWK1(String newvalue)
  {
    fieldH03FLGWK1.setString(newvalue);
  }

  /**
  * Get value of field H03FLGWK1 as a String.
  */
  public String getH03FLGWK1()
  {
    return fieldH03FLGWK1.getString();
  }

  /**
  * Set field H03FLGWK2 using a String value.
  */
  public void setH03FLGWK2(String newvalue)
  {
    fieldH03FLGWK2.setString(newvalue);
  }

  /**
  * Get value of field H03FLGWK2 as a String.
  */
  public String getH03FLGWK2()
  {
    return fieldH03FLGWK2.getString();
  }

  /**
  * Set field H03FLGWK3 using a String value.
  */
  public void setH03FLGWK3(String newvalue)
  {
    fieldH03FLGWK3.setString(newvalue);
  }

  /**
  * Get value of field H03FLGWK3 as a String.
  */
  public String getH03FLGWK3()
  {
    return fieldH03FLGWK3.getString();
  }

  /**
  * Set field E03ACMACC using a String value.
  */
  public void setE03ACMACC(String newvalue)
  {
    fieldE03ACMACC.setString(newvalue);
  }

  /**
  * Get value of field E03ACMACC as a String.
  */
  public String getE03ACMACC()
  {
    return fieldE03ACMACC.getString();
  }

  /**
  * Set numeric field E03ACMACC using a BigDecimal value.
  */
  public void setE03ACMACC(BigDecimal newvalue)
  {
    fieldE03ACMACC.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E03ACMACC as a BigDecimal.
  */
  public BigDecimal getBigDecimalE03ACMACC()
  {
    return fieldE03ACMACC.getBigDecimal();
  }

  /**
  * Set field E03DATEM using a String value.
  */
  public void setE03DATEM(String newvalue)
  {
    fieldE03DATEM.setString(newvalue);
  }

  /**
  * Get value of field E03DATEM as a String.
  */
  public String getE03DATEM()
  {
    return fieldE03DATEM.getString();
  }

  /**
  * Set numeric field E03DATEM using a BigDecimal value.
  */
  public void setE03DATEM(BigDecimal newvalue)
  {
    fieldE03DATEM.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E03DATEM as a BigDecimal.
  */
  public BigDecimal getBigDecimalE03DATEM()
  {
    return fieldE03DATEM.getBigDecimal();
  }

  /**
  * Set field E03DATED using a String value.
  */
  public void setE03DATED(String newvalue)
  {
    fieldE03DATED.setString(newvalue);
  }

  /**
  * Get value of field E03DATED as a String.
  */
  public String getE03DATED()
  {
    return fieldE03DATED.getString();
  }

  /**
  * Set numeric field E03DATED using a BigDecimal value.
  */
  public void setE03DATED(BigDecimal newvalue)
  {
    fieldE03DATED.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E03DATED as a BigDecimal.
  */
  public BigDecimal getBigDecimalE03DATED()
  {
    return fieldE03DATED.getBigDecimal();
  }

  /**
  * Set field E03DATEY using a String value.
  */
  public void setE03DATEY(String newvalue)
  {
    fieldE03DATEY.setString(newvalue);
  }

  /**
  * Get value of field E03DATEY as a String.
  */
  public String getE03DATEY()
  {
    return fieldE03DATEY.getString();
  }

  /**
  * Set numeric field E03DATEY using a BigDecimal value.
  */
  public void setE03DATEY(BigDecimal newvalue)
  {
    fieldE03DATEY.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E03DATEY as a BigDecimal.
  */
  public BigDecimal getBigDecimalE03DATEY()
  {
    return fieldE03DATEY.getBigDecimal();
  }

  /**
  * Set field E03AMT using a String value.
  */
  public void setE03AMT(String newvalue)
  {
    fieldE03AMT.setString(newvalue);
  }

  /**
  * Get value of field E03AMT as a String.
  */
  public String getE03AMT()
  {
    return fieldE03AMT.getString();
  }

  /**
  * Set numeric field E03AMT using a BigDecimal value.
  */
  public void setE03AMT(BigDecimal newvalue)
  {
    fieldE03AMT.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E03AMT as a BigDecimal.
  */
  public BigDecimal getBigDecimalE03AMT()
  {
    return fieldE03AMT.getBigDecimal();
  }

  /**
  * Set field E03DRCR using a String value.
  */
  public void setE03DRCR(String newvalue)
  {
    fieldE03DRCR.setString(newvalue);
  }

  /**
  * Get value of field E03DRCR as a String.
  */
  public String getE03DRCR()
  {
    return fieldE03DRCR.getString();
  }

  /**
  * Set field E03NAR using a String value.
  */
  public void setE03NAR(String newvalue)
  {
    fieldE03NAR.setString(newvalue);
  }

  /**
  * Get value of field E03NAR as a String.
  */
  public String getE03NAR()
  {
    return fieldE03NAR.getString();
  }

  /**
  * Set field E03PRCFLG using a String value.
  */
  public void setE03PRCFLG(String newvalue)
  {
    fieldE03PRCFLG.setString(newvalue);
  }

  /**
  * Get value of field E03PRCFLG as a String.
  */
  public String getE03PRCFLG()
  {
    return fieldE03PRCFLG.getString();
  }

}