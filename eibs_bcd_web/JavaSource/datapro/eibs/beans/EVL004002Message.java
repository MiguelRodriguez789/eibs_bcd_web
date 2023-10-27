package datapro.eibs.beans;

import datapro.eibs.sockets.*;
import java.io.*;
import java.math.*;

import java.util.*;

/**
* Class generated by AS/400 CRTCLASS command from EVL004002 physical file definition.
* 
* File level identifier is 1170519143732.
* Record format level identifier is 4202E59461A87.
*/

public class EVL004002Message extends MessageRecord
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
                                     "E02DOCBNK",
                                     "E02DOCBRN",
                                     "E02DOCTIP",
                                     "E02DOCTIN",
                                     "E02DOCSUB",
                                     "E02DOCSUN",
                                     "E02DOCUSR",
                                     "E02DOCLOT",
                                     "E02DOCBAL",
                                     "E02DOCLST",
                                     "E02DOCFIN",
                                     "E02MOVUSR",
                                     "E02MOVINI",
                                     "E02MOVFIN",
                                     "E02MOVQTY",
                                     "E02MOVBRN"
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
                                   "E02DOCBNK",
                                   "E02DOCBRN",
                                   "E02DOCTIP",
                                   "E02DOCTIN",
                                   "E02DOCSUB",
                                   "E02DOCSUN",
                                   "E02DOCUSR",
                                   "E02DOCLOT",
                                   "E02DOCBAL",
                                   "E02DOCLST",
                                   "E02DOCFIN",
                                   "E02MOVUSR",
                                   "E02MOVINI",
                                   "E02MOVFIN",
                                   "E02MOVQTY",
                                   "E02MOVBRN"
                                 };
  final static String fid = "1170519143732";
  final static String rid = "4202E59461A87";
  final static String fmtname = "EVL004002";
  final int FIELDCOUNT = 25;
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
  private CharacterField fieldE02DOCBNK = null;
  private DecimalField fieldE02DOCBRN = null;
  private CharacterField fieldE02DOCTIP = null;
  private CharacterField fieldE02DOCTIN = null;
  private CharacterField fieldE02DOCSUB = null;
  private CharacterField fieldE02DOCSUN = null;
  private CharacterField fieldE02DOCUSR = null;
  private DecimalField fieldE02DOCLOT = null;
  private DecimalField fieldE02DOCBAL = null;
  private DecimalField fieldE02DOCLST = null;
  private DecimalField fieldE02DOCFIN = null;
  private CharacterField fieldE02MOVUSR = null;
  private DecimalField fieldE02MOVINI = null;
  private DecimalField fieldE02MOVFIN = null;
  private DecimalField fieldE02MOVQTY = null;
  private DecimalField fieldE02MOVBRN = null;

  /**
  * Constructor for EVL004002Message.
  */
  public EVL004002Message()
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
    recordsize = 263;
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
    fields[9] = fieldE02DOCBNK =
    new CharacterField(message, HEADERSIZE + 42, 2, "E02DOCBNK");
    fields[10] = fieldE02DOCBRN =
    new DecimalField(message, HEADERSIZE + 44, 5, 0, "E02DOCBRN");
    fields[11] = fieldE02DOCTIP =
    new CharacterField(message, HEADERSIZE + 49, 4, "E02DOCTIP");
    fields[12] = fieldE02DOCTIN =
    new CharacterField(message, HEADERSIZE + 53, 45, "E02DOCTIN");
    fields[13] = fieldE02DOCSUB =
    new CharacterField(message, HEADERSIZE + 98, 4, "E02DOCSUB");
    fields[14] = fieldE02DOCSUN =
    new CharacterField(message, HEADERSIZE + 102, 45, "E02DOCSUN");
    fields[15] = fieldE02DOCUSR =
    new CharacterField(message, HEADERSIZE + 147, 10, "E02DOCUSR");
    fields[16] = fieldE02DOCLOT =
    new DecimalField(message, HEADERSIZE + 157, 13, 0, "E02DOCLOT");
    fields[17] = fieldE02DOCBAL =
    new DecimalField(message, HEADERSIZE + 170, 13, 0, "E02DOCBAL");
    fields[18] = fieldE02DOCLST =
    new DecimalField(message, HEADERSIZE + 183, 13, 0, "E02DOCLST");
    fields[19] = fieldE02DOCFIN =
    new DecimalField(message, HEADERSIZE + 196, 13, 0, "E02DOCFIN");
    fields[20] = fieldE02MOVUSR =
    new CharacterField(message, HEADERSIZE + 209, 10, "E02MOVUSR");
    fields[21] = fieldE02MOVINI =
    new DecimalField(message, HEADERSIZE + 219, 13, 0, "E02MOVINI");
    fields[22] = fieldE02MOVFIN =
    new DecimalField(message, HEADERSIZE + 232, 13, 0, "E02MOVFIN");
    fields[23] = fieldE02MOVQTY =
    new DecimalField(message, HEADERSIZE + 245, 13, 0, "E02MOVQTY");
    fields[24] = fieldE02MOVBRN =
    new DecimalField(message, HEADERSIZE + 258, 5, 0, "E02MOVBRN");

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
  * Set field E02DOCBNK using a String value.
  */
  public void setE02DOCBNK(String newvalue)
  {
    fieldE02DOCBNK.setString(newvalue);
  }

  /**
  * Get value of field E02DOCBNK as a String.
  */
  public String getE02DOCBNK()
  {
    return fieldE02DOCBNK.getString();
  }

  /**
  * Set field E02DOCBRN using a String value.
  */
  public void setE02DOCBRN(String newvalue)
  {
    fieldE02DOCBRN.setString(newvalue);
  }

  /**
  * Get value of field E02DOCBRN as a String.
  */
  public String getE02DOCBRN()
  {
    return fieldE02DOCBRN.getString();
  }

  /**
  * Set numeric field E02DOCBRN using a BigDecimal value.
  */
  public void setE02DOCBRN(BigDecimal newvalue)
  {
    fieldE02DOCBRN.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02DOCBRN as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02DOCBRN()
  {
    return fieldE02DOCBRN.getBigDecimal();
  }

  /**
  * Set field E02DOCTIP using a String value.
  */
  public void setE02DOCTIP(String newvalue)
  {
    fieldE02DOCTIP.setString(newvalue);
  }

  /**
  * Get value of field E02DOCTIP as a String.
  */
  public String getE02DOCTIP()
  {
    return fieldE02DOCTIP.getString();
  }

  /**
  * Set field E02DOCTIN using a String value.
  */
  public void setE02DOCTIN(String newvalue)
  {
    fieldE02DOCTIN.setString(newvalue);
  }

  /**
  * Get value of field E02DOCTIN as a String.
  */
  public String getE02DOCTIN()
  {
    return fieldE02DOCTIN.getString();
  }

  /**
  * Set field E02DOCSUB using a String value.
  */
  public void setE02DOCSUB(String newvalue)
  {
    fieldE02DOCSUB.setString(newvalue);
  }

  /**
  * Get value of field E02DOCSUB as a String.
  */
  public String getE02DOCSUB()
  {
    return fieldE02DOCSUB.getString();
  }

  /**
  * Set field E02DOCSUN using a String value.
  */
  public void setE02DOCSUN(String newvalue)
  {
    fieldE02DOCSUN.setString(newvalue);
  }

  /**
  * Get value of field E02DOCSUN as a String.
  */
  public String getE02DOCSUN()
  {
    return fieldE02DOCSUN.getString();
  }

  /**
  * Set field E02DOCUSR using a String value.
  */
  public void setE02DOCUSR(String newvalue)
  {
    fieldE02DOCUSR.setString(newvalue);
  }

  /**
  * Get value of field E02DOCUSR as a String.
  */
  public String getE02DOCUSR()
  {
    return fieldE02DOCUSR.getString();
  }

  /**
  * Set field E02DOCLOT using a String value.
  */
  public void setE02DOCLOT(String newvalue)
  {
    fieldE02DOCLOT.setString(newvalue);
  }

  /**
  * Get value of field E02DOCLOT as a String.
  */
  public String getE02DOCLOT()
  {
    return fieldE02DOCLOT.getString();
  }

  /**
  * Set numeric field E02DOCLOT using a BigDecimal value.
  */
  public void setE02DOCLOT(BigDecimal newvalue)
  {
    fieldE02DOCLOT.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02DOCLOT as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02DOCLOT()
  {
    return fieldE02DOCLOT.getBigDecimal();
  }

  /**
  * Set field E02DOCBAL using a String value.
  */
  public void setE02DOCBAL(String newvalue)
  {
    fieldE02DOCBAL.setString(newvalue);
  }

  /**
  * Get value of field E02DOCBAL as a String.
  */
  public String getE02DOCBAL()
  {
    return fieldE02DOCBAL.getString();
  }

  /**
  * Set numeric field E02DOCBAL using a BigDecimal value.
  */
  public void setE02DOCBAL(BigDecimal newvalue)
  {
    fieldE02DOCBAL.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02DOCBAL as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02DOCBAL()
  {
    return fieldE02DOCBAL.getBigDecimal();
  }

  /**
  * Set field E02DOCLST using a String value.
  */
  public void setE02DOCLST(String newvalue)
  {
    fieldE02DOCLST.setString(newvalue);
  }

  /**
  * Get value of field E02DOCLST as a String.
  */
  public String getE02DOCLST()
  {
    return fieldE02DOCLST.getString();
  }

  /**
  * Set numeric field E02DOCLST using a BigDecimal value.
  */
  public void setE02DOCLST(BigDecimal newvalue)
  {
    fieldE02DOCLST.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02DOCLST as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02DOCLST()
  {
    return fieldE02DOCLST.getBigDecimal();
  }

  /**
  * Set field E02DOCFIN using a String value.
  */
  public void setE02DOCFIN(String newvalue)
  {
    fieldE02DOCFIN.setString(newvalue);
  }

  /**
  * Get value of field E02DOCFIN as a String.
  */
  public String getE02DOCFIN()
  {
    return fieldE02DOCFIN.getString();
  }

  /**
  * Set numeric field E02DOCFIN using a BigDecimal value.
  */
  public void setE02DOCFIN(BigDecimal newvalue)
  {
    fieldE02DOCFIN.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02DOCFIN as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02DOCFIN()
  {
    return fieldE02DOCFIN.getBigDecimal();
  }

  /**
  * Set field E02MOVUSR using a String value.
  */
  public void setE02MOVUSR(String newvalue)
  {
    fieldE02MOVUSR.setString(newvalue);
  }

  /**
  * Get value of field E02MOVUSR as a String.
  */
  public String getE02MOVUSR()
  {
    return fieldE02MOVUSR.getString();
  }

  /**
  * Set field E02MOVINI using a String value.
  */
  public void setE02MOVINI(String newvalue)
  {
    fieldE02MOVINI.setString(newvalue);
  }

  /**
  * Get value of field E02MOVINI as a String.
  */
  public String getE02MOVINI()
  {
    return fieldE02MOVINI.getString();
  }

  /**
  * Set numeric field E02MOVINI using a BigDecimal value.
  */
  public void setE02MOVINI(BigDecimal newvalue)
  {
    fieldE02MOVINI.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02MOVINI as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02MOVINI()
  {
    return fieldE02MOVINI.getBigDecimal();
  }

  /**
  * Set field E02MOVFIN using a String value.
  */
  public void setE02MOVFIN(String newvalue)
  {
    fieldE02MOVFIN.setString(newvalue);
  }

  /**
  * Get value of field E02MOVFIN as a String.
  */
  public String getE02MOVFIN()
  {
    return fieldE02MOVFIN.getString();
  }

  /**
  * Set numeric field E02MOVFIN using a BigDecimal value.
  */
  public void setE02MOVFIN(BigDecimal newvalue)
  {
    fieldE02MOVFIN.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02MOVFIN as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02MOVFIN()
  {
    return fieldE02MOVFIN.getBigDecimal();
  }

  /**
  * Set field E02MOVQTY using a String value.
  */
  public void setE02MOVQTY(String newvalue)
  {
    fieldE02MOVQTY.setString(newvalue);
  }

  /**
  * Get value of field E02MOVQTY as a String.
  */
  public String getE02MOVQTY()
  {
    return fieldE02MOVQTY.getString();
  }

  /**
  * Set numeric field E02MOVQTY using a BigDecimal value.
  */
  public void setE02MOVQTY(BigDecimal newvalue)
  {
    fieldE02MOVQTY.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02MOVQTY as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02MOVQTY()
  {
    return fieldE02MOVQTY.getBigDecimal();
  }

  /**
  * Set field E02MOVBRN using a String value.
  */
  public void setE02MOVBRN(String newvalue)
  {
    fieldE02MOVBRN.setString(newvalue);
  }

  /**
  * Get value of field E02MOVBRN as a String.
  */
  public String getE02MOVBRN()
  {
    return fieldE02MOVBRN.getString();
  }

  /**
  * Set numeric field E02MOVBRN using a BigDecimal value.
  */
  public void setE02MOVBRN(BigDecimal newvalue)
  {
    fieldE02MOVBRN.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02MOVBRN as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02MOVBRN()
  {
    return fieldE02MOVBRN.getBigDecimal();
  }

}
