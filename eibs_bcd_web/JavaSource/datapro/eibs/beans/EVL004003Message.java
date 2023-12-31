package datapro.eibs.beans;

import datapro.eibs.sockets.*;
import java.io.*;
import java.math.*;

import java.util.*;

/**
* Class generated by AS/400 CRTCLASS command from EVL004003 physical file definition.
* 
* File level identifier is 1130611113445.
* Record format level identifier is 46ABC048B09E6.
*/

public class EVL004003Message extends MessageRecord
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
                                     "E03DOCBNK",
                                     "E03DOCBRN",
                                     "E03DOCTIP",
                                     "E03DOCTIN",
                                     "E03DOCSUB",
                                     "E03DOCSUN",
                                     "E03DOCUSR",
                                     "E03DOCLOT",
                                     "E03DOCBAL",
                                     "E03DOCLST",
                                     "E03DOCFIN",
                                     "E03DOCAIN",
                                     "E03DOCAFI",
                                     "E03DOCMOT",
                                     "E03DOCMON",
                                     "E03DOCAQT"
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
                                   "E03DOCBNK",
                                   "E03DOCBRN",
                                   "E03DOCTIP",
                                   "E03DOCTIN",
                                   "E03DOCSUB",
                                   "E03DOCSUN",
                                   "E03DOCUSR",
                                   "E03DOCLOT",
                                   "E03DOCBAL",
                                   "E03DOCLST",
                                   "E03DOCFIN",
                                   "E03DOCAIN",
                                   "E03DOCAFI",
                                   "E03DOCMOT",
                                   "E03DOCMON",
                                   "E03DOCAQT"
                                 };
  final static String fid = "1130611113445";
  final static String rid = "46ABC048B09E6";
  final static String fmtname = "EVL004003";
  final int FIELDCOUNT = 25;
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
  private CharacterField fieldE03DOCBNK = null;
  private DecimalField fieldE03DOCBRN = null;
  private CharacterField fieldE03DOCTIP = null;
  private CharacterField fieldE03DOCTIN = null;
  private CharacterField fieldE03DOCSUB = null;
  private CharacterField fieldE03DOCSUN = null;
  private CharacterField fieldE03DOCUSR = null;
  private DecimalField fieldE03DOCLOT = null;
  private DecimalField fieldE03DOCBAL = null;
  private DecimalField fieldE03DOCLST = null;
  private DecimalField fieldE03DOCFIN = null;
  private DecimalField fieldE03DOCAIN = null;
  private DecimalField fieldE03DOCAFI = null;
  private CharacterField fieldE03DOCMOT = null;
  private CharacterField fieldE03DOCMON = null;
  private DecimalField fieldE03DOCAQT = null;

  /**
  * Constructor for EVL004003Message.
  */
  public EVL004003Message()
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
    recordsize = 297;
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
    fields[9] = fieldE03DOCBNK =
    new CharacterField(message, HEADERSIZE + 42, 2, "E03DOCBNK");
    fields[10] = fieldE03DOCBRN =
    new DecimalField(message, HEADERSIZE + 44, 5, 0, "E03DOCBRN");
    fields[11] = fieldE03DOCTIP =
    new CharacterField(message, HEADERSIZE + 49, 4, "E03DOCTIP");
    fields[12] = fieldE03DOCTIN =
    new CharacterField(message, HEADERSIZE + 53, 45, "E03DOCTIN");
    fields[13] = fieldE03DOCSUB =
    new CharacterField(message, HEADERSIZE + 98, 4, "E03DOCSUB");
    fields[14] = fieldE03DOCSUN =
    new CharacterField(message, HEADERSIZE + 102, 45, "E03DOCSUN");
    fields[15] = fieldE03DOCUSR =
    new CharacterField(message, HEADERSIZE + 147, 10, "E03DOCUSR");
    fields[16] = fieldE03DOCLOT =
    new DecimalField(message, HEADERSIZE + 157, 13, 0, "E03DOCLOT");
    fields[17] = fieldE03DOCBAL =
    new DecimalField(message, HEADERSIZE + 170, 13, 0, "E03DOCBAL");
    fields[18] = fieldE03DOCLST =
    new DecimalField(message, HEADERSIZE + 183, 13, 0, "E03DOCLST");
    fields[19] = fieldE03DOCFIN =
    new DecimalField(message, HEADERSIZE + 196, 13, 0, "E03DOCFIN");
    fields[20] = fieldE03DOCAIN =
    new DecimalField(message, HEADERSIZE + 209, 13, 0, "E03DOCAIN");
    fields[21] = fieldE03DOCAFI =
    new DecimalField(message, HEADERSIZE + 222, 13, 0, "E03DOCAFI");
    fields[22] = fieldE03DOCMOT =
    new CharacterField(message, HEADERSIZE + 235, 4, "E03DOCMOT");
    fields[23] = fieldE03DOCMON =
    new CharacterField(message, HEADERSIZE + 239, 45, "E03DOCMON");
    fields[24] = fieldE03DOCAQT =
    new DecimalField(message, HEADERSIZE + 284, 13, 0, "E03DOCAQT");

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
  * Set field E03DOCBNK using a String value.
  */
  public void setE03DOCBNK(String newvalue)
  {
    fieldE03DOCBNK.setString(newvalue);
  }

  /**
  * Get value of field E03DOCBNK as a String.
  */
  public String getE03DOCBNK()
  {
    return fieldE03DOCBNK.getString();
  }

  /**
  * Set field E03DOCBRN using a String value.
  */
  public void setE03DOCBRN(String newvalue)
  {
    fieldE03DOCBRN.setString(newvalue);
  }

  /**
  * Get value of field E03DOCBRN as a String.
  */
  public String getE03DOCBRN()
  {
    return fieldE03DOCBRN.getString();
  }

  /**
  * Set numeric field E03DOCBRN using a BigDecimal value.
  */
  public void setE03DOCBRN(BigDecimal newvalue)
  {
    fieldE03DOCBRN.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E03DOCBRN as a BigDecimal.
  */
  public BigDecimal getBigDecimalE03DOCBRN()
  {
    return fieldE03DOCBRN.getBigDecimal();
  }

  /**
  * Set field E03DOCTIP using a String value.
  */
  public void setE03DOCTIP(String newvalue)
  {
    fieldE03DOCTIP.setString(newvalue);
  }

  /**
  * Get value of field E03DOCTIP as a String.
  */
  public String getE03DOCTIP()
  {
    return fieldE03DOCTIP.getString();
  }

  /**
  * Set field E03DOCTIN using a String value.
  */
  public void setE03DOCTIN(String newvalue)
  {
    fieldE03DOCTIN.setString(newvalue);
  }

  /**
  * Get value of field E03DOCTIN as a String.
  */
  public String getE03DOCTIN()
  {
    return fieldE03DOCTIN.getString();
  }

  /**
  * Set field E03DOCSUB using a String value.
  */
  public void setE03DOCSUB(String newvalue)
  {
    fieldE03DOCSUB.setString(newvalue);
  }

  /**
  * Get value of field E03DOCSUB as a String.
  */
  public String getE03DOCSUB()
  {
    return fieldE03DOCSUB.getString();
  }

  /**
  * Set field E03DOCSUN using a String value.
  */
  public void setE03DOCSUN(String newvalue)
  {
    fieldE03DOCSUN.setString(newvalue);
  }

  /**
  * Get value of field E03DOCSUN as a String.
  */
  public String getE03DOCSUN()
  {
    return fieldE03DOCSUN.getString();
  }

  /**
  * Set field E03DOCUSR using a String value.
  */
  public void setE03DOCUSR(String newvalue)
  {
    fieldE03DOCUSR.setString(newvalue);
  }

  /**
  * Get value of field E03DOCUSR as a String.
  */
  public String getE03DOCUSR()
  {
    return fieldE03DOCUSR.getString();
  }

  /**
  * Set field E03DOCLOT using a String value.
  */
  public void setE03DOCLOT(String newvalue)
  {
    fieldE03DOCLOT.setString(newvalue);
  }

  /**
  * Get value of field E03DOCLOT as a String.
  */
  public String getE03DOCLOT()
  {
    return fieldE03DOCLOT.getString();
  }

  /**
  * Set numeric field E03DOCLOT using a BigDecimal value.
  */
  public void setE03DOCLOT(BigDecimal newvalue)
  {
    fieldE03DOCLOT.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E03DOCLOT as a BigDecimal.
  */
  public BigDecimal getBigDecimalE03DOCLOT()
  {
    return fieldE03DOCLOT.getBigDecimal();
  }

  /**
  * Set field E03DOCBAL using a String value.
  */
  public void setE03DOCBAL(String newvalue)
  {
    fieldE03DOCBAL.setString(newvalue);
  }

  /**
  * Get value of field E03DOCBAL as a String.
  */
  public String getE03DOCBAL()
  {
    return fieldE03DOCBAL.getString();
  }

  /**
  * Set numeric field E03DOCBAL using a BigDecimal value.
  */
  public void setE03DOCBAL(BigDecimal newvalue)
  {
    fieldE03DOCBAL.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E03DOCBAL as a BigDecimal.
  */
  public BigDecimal getBigDecimalE03DOCBAL()
  {
    return fieldE03DOCBAL.getBigDecimal();
  }

  /**
  * Set field E03DOCLST using a String value.
  */
  public void setE03DOCLST(String newvalue)
  {
    fieldE03DOCLST.setString(newvalue);
  }

  /**
  * Get value of field E03DOCLST as a String.
  */
  public String getE03DOCLST()
  {
    return fieldE03DOCLST.getString();
  }

  /**
  * Set numeric field E03DOCLST using a BigDecimal value.
  */
  public void setE03DOCLST(BigDecimal newvalue)
  {
    fieldE03DOCLST.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E03DOCLST as a BigDecimal.
  */
  public BigDecimal getBigDecimalE03DOCLST()
  {
    return fieldE03DOCLST.getBigDecimal();
  }

  /**
  * Set field E03DOCFIN using a String value.
  */
  public void setE03DOCFIN(String newvalue)
  {
    fieldE03DOCFIN.setString(newvalue);
  }

  /**
  * Get value of field E03DOCFIN as a String.
  */
  public String getE03DOCFIN()
  {
    return fieldE03DOCFIN.getString();
  }

  /**
  * Set numeric field E03DOCFIN using a BigDecimal value.
  */
  public void setE03DOCFIN(BigDecimal newvalue)
  {
    fieldE03DOCFIN.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E03DOCFIN as a BigDecimal.
  */
  public BigDecimal getBigDecimalE03DOCFIN()
  {
    return fieldE03DOCFIN.getBigDecimal();
  }

  /**
  * Set field E03DOCAIN using a String value.
  */
  public void setE03DOCAIN(String newvalue)
  {
    fieldE03DOCAIN.setString(newvalue);
  }

  /**
  * Get value of field E03DOCAIN as a String.
  */
  public String getE03DOCAIN()
  {
    return fieldE03DOCAIN.getString();
  }

  /**
  * Set numeric field E03DOCAIN using a BigDecimal value.
  */
  public void setE03DOCAIN(BigDecimal newvalue)
  {
    fieldE03DOCAIN.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E03DOCAIN as a BigDecimal.
  */
  public BigDecimal getBigDecimalE03DOCAIN()
  {
    return fieldE03DOCAIN.getBigDecimal();
  }

  /**
  * Set field E03DOCAFI using a String value.
  */
  public void setE03DOCAFI(String newvalue)
  {
    fieldE03DOCAFI.setString(newvalue);
  }

  /**
  * Get value of field E03DOCAFI as a String.
  */
  public String getE03DOCAFI()
  {
    return fieldE03DOCAFI.getString();
  }

  /**
  * Set numeric field E03DOCAFI using a BigDecimal value.
  */
  public void setE03DOCAFI(BigDecimal newvalue)
  {
    fieldE03DOCAFI.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E03DOCAFI as a BigDecimal.
  */
  public BigDecimal getBigDecimalE03DOCAFI()
  {
    return fieldE03DOCAFI.getBigDecimal();
  }

  /**
  * Set field E03DOCMOT using a String value.
  */
  public void setE03DOCMOT(String newvalue)
  {
    fieldE03DOCMOT.setString(newvalue);
  }

  /**
  * Get value of field E03DOCMOT as a String.
  */
  public String getE03DOCMOT()
  {
    return fieldE03DOCMOT.getString();
  }

  /**
  * Set field E03DOCMON using a String value.
  */
  public void setE03DOCMON(String newvalue)
  {
    fieldE03DOCMON.setString(newvalue);
  }

  /**
  * Get value of field E03DOCMON as a String.
  */
  public String getE03DOCMON()
  {
    return fieldE03DOCMON.getString();
  }

  /**
  * Set field E03DOCAQT using a String value.
  */
  public void setE03DOCAQT(String newvalue)
  {
    fieldE03DOCAQT.setString(newvalue);
  }

  /**
  * Get value of field E03DOCAQT as a String.
  */
  public String getE03DOCAQT()
  {
    return fieldE03DOCAQT.getString();
  }

  /**
  * Set numeric field E03DOCAQT using a BigDecimal value.
  */
  public void setE03DOCAQT(BigDecimal newvalue)
  {
    fieldE03DOCAQT.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E03DOCAQT as a BigDecimal.
  */
  public BigDecimal getBigDecimalE03DOCAQT()
  {
    return fieldE03DOCAQT.getBigDecimal();
  }

}
