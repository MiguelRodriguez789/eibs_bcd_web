package datapro.eibs.beans;

import datapro.eibs.sockets.*;
import java.io.*;
import java.math.*;

import java.util.*;

/**
* Class generated by AS/400 CRTCLASS command from EPV107002 physical file definition.
* 
* File level identifier is 1130611113307.
* Record format level identifier is 4EE26D40DEBC3.
*/

public class EPV107002Message extends MessageRecord
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
                                     "E02SELBNK",
                                     "E02SELBRN",
                                     "E02SELCNV",
                                     "E02SELVEN",
                                     "E02SELSUP",
                                     "E02SELFID",
                                     "E02SELFIM",
                                     "E02SELFIY",
                                     "E02SELFFD",
                                     "E02SELFFM",
                                     "E02SELFFY",
                                     "E02TIMERP",
                                     "E02TOTREC",
                                     "E02TOTAPA",
                                     "E02TOTNET",
                                     "E02TOTPLR",
                                     "E02TOTPMM",
                                     "E02TOTSAM",
                                     "E02TOTSOM",
                                     "E02TOTTVI",
                                     "E02TOTTRA",
                                     "E02TOTCQT",
                                     "E02TOTGNT",
                                     "E02TOTIMP",
                                     "E02TOTOTH",
                                     "E02RTEPON",
                                     "E02SPRPON",
                                     "E02CSTPON"
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
                                   "E02SELBNK",
                                   "E02SELBRN",
                                   "E02SELCNV",
                                   "E02SELVEN",
                                   "E02SELSUP",
                                   "E02SELFID",
                                   "E02SELFIM",
                                   "E02SELFIY",
                                   "E02SELFFD",
                                   "E02SELFFM",
                                   "E02SELFFY",
                                   "E02TIMERP",
                                   "E02TOTREC",
                                   "E02TOTAPA",
                                   "E02TOTNET",
                                   "E02TOTPLR",
                                   "E02TOTPMM",
                                   "E02TOTSAM",
                                   "E02TOTSOM",
                                   "E02TOTTVI",
                                   "E02TOTTRA",
                                   "E02TOTCQT",
                                   "E02TOTGNT",
                                   "E02TOTIMP",
                                   "E02TOTOTH",
                                   "E02RTEPON",
                                   "E02SPRPON",
                                   "E02CSTPON"
                                 };
  final static String fid = "1130611113307";
  final static String rid = "4EE26D40DEBC3";
  final static String fmtname = "EPV107002";
  final int FIELDCOUNT = 37;
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
  private CharacterField fieldE02SELBNK = null;
  private DecimalField fieldE02SELBRN = null;
  private CharacterField fieldE02SELCNV = null;
  private CharacterField fieldE02SELVEN = null;
  private CharacterField fieldE02SELSUP = null;
  private DecimalField fieldE02SELFID = null;
  private DecimalField fieldE02SELFIM = null;
  private DecimalField fieldE02SELFIY = null;
  private DecimalField fieldE02SELFFD = null;
  private DecimalField fieldE02SELFFM = null;
  private DecimalField fieldE02SELFFY = null;
  private CharacterField fieldE02TIMERP = null;
  private DecimalField fieldE02TOTREC = null;
  private DecimalField fieldE02TOTAPA = null;
  private DecimalField fieldE02TOTNET = null;
  private DecimalField fieldE02TOTPLR = null;
  private DecimalField fieldE02TOTPMM = null;
  private DecimalField fieldE02TOTSAM = null;
  private DecimalField fieldE02TOTSOM = null;
  private DecimalField fieldE02TOTTVI = null;
  private DecimalField fieldE02TOTTRA = null;
  private DecimalField fieldE02TOTCQT = null;
  private DecimalField fieldE02TOTGNT = null;
  private DecimalField fieldE02TOTIMP = null;
  private DecimalField fieldE02TOTOTH = null;
  private DecimalField fieldE02RTEPON = null;
  private DecimalField fieldE02SPRPON = null;
  private DecimalField fieldE02CSTPON = null;

  /**
  * Constructor for EPV107002Message.
  */
  public EPV107002Message()
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
    recordsize = 352;
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
    fields[9] = fieldE02SELBNK =
    new CharacterField(message, HEADERSIZE + 42, 2, "E02SELBNK");
    fields[10] = fieldE02SELBRN =
    new DecimalField(message, HEADERSIZE + 44, 5, 0, "E02SELBRN");
    fields[11] = fieldE02SELCNV =
    new CharacterField(message, HEADERSIZE + 49, 4, "E02SELCNV");
    fields[12] = fieldE02SELVEN =
    new CharacterField(message, HEADERSIZE + 53, 4, "E02SELVEN");
    fields[13] = fieldE02SELSUP =
    new CharacterField(message, HEADERSIZE + 57, 4, "E02SELSUP");
    fields[14] = fieldE02SELFID =
    new DecimalField(message, HEADERSIZE + 61, 3, 0, "E02SELFID");
    fields[15] = fieldE02SELFIM =
    new DecimalField(message, HEADERSIZE + 64, 3, 0, "E02SELFIM");
    fields[16] = fieldE02SELFIY =
    new DecimalField(message, HEADERSIZE + 67, 5, 0, "E02SELFIY");
    fields[17] = fieldE02SELFFD =
    new DecimalField(message, HEADERSIZE + 72, 3, 0, "E02SELFFD");
    fields[18] = fieldE02SELFFM =
    new DecimalField(message, HEADERSIZE + 75, 3, 0, "E02SELFFM");
    fields[19] = fieldE02SELFFY =
    new DecimalField(message, HEADERSIZE + 78, 5, 0, "E02SELFFY");
    fields[20] = fieldE02TIMERP =
    new CharacterField(message, HEADERSIZE + 83, 26, "E02TIMERP");
    fields[21] = fieldE02TOTREC =
    new DecimalField(message, HEADERSIZE + 109, 6, 0, "E02TOTREC");
    fields[22] = fieldE02TOTAPA =
    new DecimalField(message, HEADERSIZE + 115, 17, 2, "E02TOTAPA");
    fields[23] = fieldE02TOTNET =
    new DecimalField(message, HEADERSIZE + 132, 17, 2, "E02TOTNET");
    fields[24] = fieldE02TOTPLR =
    new DecimalField(message, HEADERSIZE + 149, 17, 2, "E02TOTPLR");
    fields[25] = fieldE02TOTPMM =
    new DecimalField(message, HEADERSIZE + 166, 17, 2, "E02TOTPMM");
    fields[26] = fieldE02TOTSAM =
    new DecimalField(message, HEADERSIZE + 183, 17, 2, "E02TOTSAM");
    fields[27] = fieldE02TOTSOM =
    new DecimalField(message, HEADERSIZE + 200, 17, 2, "E02TOTSOM");
    fields[28] = fieldE02TOTTVI =
    new DecimalField(message, HEADERSIZE + 217, 17, 2, "E02TOTTVI");
    fields[29] = fieldE02TOTTRA =
    new DecimalField(message, HEADERSIZE + 234, 17, 2, "E02TOTTRA");
    fields[30] = fieldE02TOTCQT =
    new DecimalField(message, HEADERSIZE + 251, 17, 2, "E02TOTCQT");
    fields[31] = fieldE02TOTGNT =
    new DecimalField(message, HEADERSIZE + 268, 17, 2, "E02TOTGNT");
    fields[32] = fieldE02TOTIMP =
    new DecimalField(message, HEADERSIZE + 285, 17, 2, "E02TOTIMP");
    fields[33] = fieldE02TOTOTH =
    new DecimalField(message, HEADERSIZE + 302, 17, 2, "E02TOTOTH");
    fields[34] = fieldE02RTEPON =
    new DecimalField(message, HEADERSIZE + 319, 11, 6, "E02RTEPON");
    fields[35] = fieldE02SPRPON =
    new DecimalField(message, HEADERSIZE + 330, 11, 6, "E02SPRPON");
    fields[36] = fieldE02CSTPON =
    new DecimalField(message, HEADERSIZE + 341, 11, 6, "E02CSTPON");

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
  * Set field E02SELBNK using a String value.
  */
  public void setE02SELBNK(String newvalue)
  {
    fieldE02SELBNK.setString(newvalue);
  }

  /**
  * Get value of field E02SELBNK as a String.
  */
  public String getE02SELBNK()
  {
    return fieldE02SELBNK.getString();
  }

  /**
  * Set field E02SELBRN using a String value.
  */
  public void setE02SELBRN(String newvalue)
  {
    fieldE02SELBRN.setString(newvalue);
  }

  /**
  * Get value of field E02SELBRN as a String.
  */
  public String getE02SELBRN()
  {
    return fieldE02SELBRN.getString();
  }

  /**
  * Set numeric field E02SELBRN using a BigDecimal value.
  */
  public void setE02SELBRN(BigDecimal newvalue)
  {
    fieldE02SELBRN.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02SELBRN as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02SELBRN()
  {
    return fieldE02SELBRN.getBigDecimal();
  }

  /**
  * Set field E02SELCNV using a String value.
  */
  public void setE02SELCNV(String newvalue)
  {
    fieldE02SELCNV.setString(newvalue);
  }

  /**
  * Get value of field E02SELCNV as a String.
  */
  public String getE02SELCNV()
  {
    return fieldE02SELCNV.getString();
  }

  /**
  * Set field E02SELVEN using a String value.
  */
  public void setE02SELVEN(String newvalue)
  {
    fieldE02SELVEN.setString(newvalue);
  }

  /**
  * Get value of field E02SELVEN as a String.
  */
  public String getE02SELVEN()
  {
    return fieldE02SELVEN.getString();
  }

  /**
  * Set field E02SELSUP using a String value.
  */
  public void setE02SELSUP(String newvalue)
  {
    fieldE02SELSUP.setString(newvalue);
  }

  /**
  * Get value of field E02SELSUP as a String.
  */
  public String getE02SELSUP()
  {
    return fieldE02SELSUP.getString();
  }

  /**
  * Set field E02SELFID using a String value.
  */
  public void setE02SELFID(String newvalue)
  {
    fieldE02SELFID.setString(newvalue);
  }

  /**
  * Get value of field E02SELFID as a String.
  */
  public String getE02SELFID()
  {
    return fieldE02SELFID.getString();
  }

  /**
  * Set numeric field E02SELFID using a BigDecimal value.
  */
  public void setE02SELFID(BigDecimal newvalue)
  {
    fieldE02SELFID.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02SELFID as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02SELFID()
  {
    return fieldE02SELFID.getBigDecimal();
  }

  /**
  * Set field E02SELFIM using a String value.
  */
  public void setE02SELFIM(String newvalue)
  {
    fieldE02SELFIM.setString(newvalue);
  }

  /**
  * Get value of field E02SELFIM as a String.
  */
  public String getE02SELFIM()
  {
    return fieldE02SELFIM.getString();
  }

  /**
  * Set numeric field E02SELFIM using a BigDecimal value.
  */
  public void setE02SELFIM(BigDecimal newvalue)
  {
    fieldE02SELFIM.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02SELFIM as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02SELFIM()
  {
    return fieldE02SELFIM.getBigDecimal();
  }

  /**
  * Set field E02SELFIY using a String value.
  */
  public void setE02SELFIY(String newvalue)
  {
    fieldE02SELFIY.setString(newvalue);
  }

  /**
  * Get value of field E02SELFIY as a String.
  */
  public String getE02SELFIY()
  {
    return fieldE02SELFIY.getString();
  }

  /**
  * Set numeric field E02SELFIY using a BigDecimal value.
  */
  public void setE02SELFIY(BigDecimal newvalue)
  {
    fieldE02SELFIY.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02SELFIY as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02SELFIY()
  {
    return fieldE02SELFIY.getBigDecimal();
  }

  /**
  * Set field E02SELFFD using a String value.
  */
  public void setE02SELFFD(String newvalue)
  {
    fieldE02SELFFD.setString(newvalue);
  }

  /**
  * Get value of field E02SELFFD as a String.
  */
  public String getE02SELFFD()
  {
    return fieldE02SELFFD.getString();
  }

  /**
  * Set numeric field E02SELFFD using a BigDecimal value.
  */
  public void setE02SELFFD(BigDecimal newvalue)
  {
    fieldE02SELFFD.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02SELFFD as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02SELFFD()
  {
    return fieldE02SELFFD.getBigDecimal();
  }

  /**
  * Set field E02SELFFM using a String value.
  */
  public void setE02SELFFM(String newvalue)
  {
    fieldE02SELFFM.setString(newvalue);
  }

  /**
  * Get value of field E02SELFFM as a String.
  */
  public String getE02SELFFM()
  {
    return fieldE02SELFFM.getString();
  }

  /**
  * Set numeric field E02SELFFM using a BigDecimal value.
  */
  public void setE02SELFFM(BigDecimal newvalue)
  {
    fieldE02SELFFM.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02SELFFM as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02SELFFM()
  {
    return fieldE02SELFFM.getBigDecimal();
  }

  /**
  * Set field E02SELFFY using a String value.
  */
  public void setE02SELFFY(String newvalue)
  {
    fieldE02SELFFY.setString(newvalue);
  }

  /**
  * Get value of field E02SELFFY as a String.
  */
  public String getE02SELFFY()
  {
    return fieldE02SELFFY.getString();
  }

  /**
  * Set numeric field E02SELFFY using a BigDecimal value.
  */
  public void setE02SELFFY(BigDecimal newvalue)
  {
    fieldE02SELFFY.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02SELFFY as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02SELFFY()
  {
    return fieldE02SELFFY.getBigDecimal();
  }

  /**
  * Set field E02TIMERP using a String value.
  */
  public void setE02TIMERP(String newvalue)
  {
    fieldE02TIMERP.setString(newvalue);
  }

  /**
  * Get value of field E02TIMERP as a String.
  */
  public String getE02TIMERP()
  {
    return fieldE02TIMERP.getString();
  }

  /**
  * Set field E02TOTREC using a String value.
  */
  public void setE02TOTREC(String newvalue)
  {
    fieldE02TOTREC.setString(newvalue);
  }

  /**
  * Get value of field E02TOTREC as a String.
  */
  public String getE02TOTREC()
  {
    return fieldE02TOTREC.getString();
  }

  /**
  * Set numeric field E02TOTREC using a BigDecimal value.
  */
  public void setE02TOTREC(BigDecimal newvalue)
  {
    fieldE02TOTREC.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02TOTREC as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02TOTREC()
  {
    return fieldE02TOTREC.getBigDecimal();
  }

  /**
  * Set field E02TOTAPA using a String value.
  */
  public void setE02TOTAPA(String newvalue)
  {
    fieldE02TOTAPA.setString(newvalue);
  }

  /**
  * Get value of field E02TOTAPA as a String.
  */
  public String getE02TOTAPA()
  {
    return fieldE02TOTAPA.getString();
  }

  /**
  * Set numeric field E02TOTAPA using a BigDecimal value.
  */
  public void setE02TOTAPA(BigDecimal newvalue)
  {
    fieldE02TOTAPA.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02TOTAPA as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02TOTAPA()
  {
    return fieldE02TOTAPA.getBigDecimal();
  }

  /**
  * Set field E02TOTNET using a String value.
  */
  public void setE02TOTNET(String newvalue)
  {
    fieldE02TOTNET.setString(newvalue);
  }

  /**
  * Get value of field E02TOTNET as a String.
  */
  public String getE02TOTNET()
  {
    return fieldE02TOTNET.getString();
  }

  /**
  * Set numeric field E02TOTNET using a BigDecimal value.
  */
  public void setE02TOTNET(BigDecimal newvalue)
  {
    fieldE02TOTNET.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02TOTNET as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02TOTNET()
  {
    return fieldE02TOTNET.getBigDecimal();
  }

  /**
  * Set field E02TOTPLR using a String value.
  */
  public void setE02TOTPLR(String newvalue)
  {
    fieldE02TOTPLR.setString(newvalue);
  }

  /**
  * Get value of field E02TOTPLR as a String.
  */
  public String getE02TOTPLR()
  {
    return fieldE02TOTPLR.getString();
  }

  /**
  * Set numeric field E02TOTPLR using a BigDecimal value.
  */
  public void setE02TOTPLR(BigDecimal newvalue)
  {
    fieldE02TOTPLR.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02TOTPLR as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02TOTPLR()
  {
    return fieldE02TOTPLR.getBigDecimal();
  }

  /**
  * Set field E02TOTPMM using a String value.
  */
  public void setE02TOTPMM(String newvalue)
  {
    fieldE02TOTPMM.setString(newvalue);
  }

  /**
  * Get value of field E02TOTPMM as a String.
  */
  public String getE02TOTPMM()
  {
    return fieldE02TOTPMM.getString();
  }

  /**
  * Set numeric field E02TOTPMM using a BigDecimal value.
  */
  public void setE02TOTPMM(BigDecimal newvalue)
  {
    fieldE02TOTPMM.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02TOTPMM as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02TOTPMM()
  {
    return fieldE02TOTPMM.getBigDecimal();
  }

  /**
  * Set field E02TOTSAM using a String value.
  */
  public void setE02TOTSAM(String newvalue)
  {
    fieldE02TOTSAM.setString(newvalue);
  }

  /**
  * Get value of field E02TOTSAM as a String.
  */
  public String getE02TOTSAM()
  {
    return fieldE02TOTSAM.getString();
  }

  /**
  * Set numeric field E02TOTSAM using a BigDecimal value.
  */
  public void setE02TOTSAM(BigDecimal newvalue)
  {
    fieldE02TOTSAM.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02TOTSAM as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02TOTSAM()
  {
    return fieldE02TOTSAM.getBigDecimal();
  }

  /**
  * Set field E02TOTSOM using a String value.
  */
  public void setE02TOTSOM(String newvalue)
  {
    fieldE02TOTSOM.setString(newvalue);
  }

  /**
  * Get value of field E02TOTSOM as a String.
  */
  public String getE02TOTSOM()
  {
    return fieldE02TOTSOM.getString();
  }

  /**
  * Set numeric field E02TOTSOM using a BigDecimal value.
  */
  public void setE02TOTSOM(BigDecimal newvalue)
  {
    fieldE02TOTSOM.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02TOTSOM as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02TOTSOM()
  {
    return fieldE02TOTSOM.getBigDecimal();
  }

  /**
  * Set field E02TOTTVI using a String value.
  */
  public void setE02TOTTVI(String newvalue)
  {
    fieldE02TOTTVI.setString(newvalue);
  }

  /**
  * Get value of field E02TOTTVI as a String.
  */
  public String getE02TOTTVI()
  {
    return fieldE02TOTTVI.getString();
  }

  /**
  * Set numeric field E02TOTTVI using a BigDecimal value.
  */
  public void setE02TOTTVI(BigDecimal newvalue)
  {
    fieldE02TOTTVI.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02TOTTVI as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02TOTTVI()
  {
    return fieldE02TOTTVI.getBigDecimal();
  }

  /**
  * Set field E02TOTTRA using a String value.
  */
  public void setE02TOTTRA(String newvalue)
  {
    fieldE02TOTTRA.setString(newvalue);
  }

  /**
  * Get value of field E02TOTTRA as a String.
  */
  public String getE02TOTTRA()
  {
    return fieldE02TOTTRA.getString();
  }

  /**
  * Set numeric field E02TOTTRA using a BigDecimal value.
  */
  public void setE02TOTTRA(BigDecimal newvalue)
  {
    fieldE02TOTTRA.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02TOTTRA as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02TOTTRA()
  {
    return fieldE02TOTTRA.getBigDecimal();
  }

  /**
  * Set field E02TOTCQT using a String value.
  */
  public void setE02TOTCQT(String newvalue)
  {
    fieldE02TOTCQT.setString(newvalue);
  }

  /**
  * Get value of field E02TOTCQT as a String.
  */
  public String getE02TOTCQT()
  {
    return fieldE02TOTCQT.getString();
  }

  /**
  * Set numeric field E02TOTCQT using a BigDecimal value.
  */
  public void setE02TOTCQT(BigDecimal newvalue)
  {
    fieldE02TOTCQT.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02TOTCQT as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02TOTCQT()
  {
    return fieldE02TOTCQT.getBigDecimal();
  }

  /**
  * Set field E02TOTGNT using a String value.
  */
  public void setE02TOTGNT(String newvalue)
  {
    fieldE02TOTGNT.setString(newvalue);
  }

  /**
  * Get value of field E02TOTGNT as a String.
  */
  public String getE02TOTGNT()
  {
    return fieldE02TOTGNT.getString();
  }

  /**
  * Set numeric field E02TOTGNT using a BigDecimal value.
  */
  public void setE02TOTGNT(BigDecimal newvalue)
  {
    fieldE02TOTGNT.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02TOTGNT as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02TOTGNT()
  {
    return fieldE02TOTGNT.getBigDecimal();
  }

  /**
  * Set field E02TOTIMP using a String value.
  */
  public void setE02TOTIMP(String newvalue)
  {
    fieldE02TOTIMP.setString(newvalue);
  }

  /**
  * Get value of field E02TOTIMP as a String.
  */
  public String getE02TOTIMP()
  {
    return fieldE02TOTIMP.getString();
  }

  /**
  * Set numeric field E02TOTIMP using a BigDecimal value.
  */
  public void setE02TOTIMP(BigDecimal newvalue)
  {
    fieldE02TOTIMP.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02TOTIMP as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02TOTIMP()
  {
    return fieldE02TOTIMP.getBigDecimal();
  }

  /**
  * Set field E02TOTOTH using a String value.
  */
  public void setE02TOTOTH(String newvalue)
  {
    fieldE02TOTOTH.setString(newvalue);
  }

  /**
  * Get value of field E02TOTOTH as a String.
  */
  public String getE02TOTOTH()
  {
    return fieldE02TOTOTH.getString();
  }

  /**
  * Set numeric field E02TOTOTH using a BigDecimal value.
  */
  public void setE02TOTOTH(BigDecimal newvalue)
  {
    fieldE02TOTOTH.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02TOTOTH as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02TOTOTH()
  {
    return fieldE02TOTOTH.getBigDecimal();
  }

  /**
  * Set field E02RTEPON using a String value.
  */
  public void setE02RTEPON(String newvalue)
  {
    fieldE02RTEPON.setString(newvalue);
  }

  /**
  * Get value of field E02RTEPON as a String.
  */
  public String getE02RTEPON()
  {
    return fieldE02RTEPON.getString();
  }

  /**
  * Set numeric field E02RTEPON using a BigDecimal value.
  */
  public void setE02RTEPON(BigDecimal newvalue)
  {
    fieldE02RTEPON.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02RTEPON as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02RTEPON()
  {
    return fieldE02RTEPON.getBigDecimal();
  }

  /**
  * Set field E02SPRPON using a String value.
  */
  public void setE02SPRPON(String newvalue)
  {
    fieldE02SPRPON.setString(newvalue);
  }

  /**
  * Get value of field E02SPRPON as a String.
  */
  public String getE02SPRPON()
  {
    return fieldE02SPRPON.getString();
  }

  /**
  * Set numeric field E02SPRPON using a BigDecimal value.
  */
  public void setE02SPRPON(BigDecimal newvalue)
  {
    fieldE02SPRPON.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02SPRPON as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02SPRPON()
  {
    return fieldE02SPRPON.getBigDecimal();
  }

  /**
  * Set field E02CSTPON using a String value.
  */
  public void setE02CSTPON(String newvalue)
  {
    fieldE02CSTPON.setString(newvalue);
  }

  /**
  * Get value of field E02CSTPON as a String.
  */
  public String getE02CSTPON()
  {
    return fieldE02CSTPON.getString();
  }

  /**
  * Set numeric field E02CSTPON using a BigDecimal value.
  */
  public void setE02CSTPON(BigDecimal newvalue)
  {
    fieldE02CSTPON.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02CSTPON as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02CSTPON()
  {
    return fieldE02CSTPON.getBigDecimal();
  }

}
