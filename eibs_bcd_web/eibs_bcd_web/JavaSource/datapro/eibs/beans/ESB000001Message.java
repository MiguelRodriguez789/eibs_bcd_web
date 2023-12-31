package datapro.eibs.beans;

import datapro.eibs.sockets.*;
import java.io.*;
import java.math.*;

import java.util.*;

/**
* Class generated by AS/400 CRTCLASS command from ESB000001 physical file definition.
* 
* File level identifier is 1130611113337.
* Record format level identifier is 37D806C31235F.
*/

public class ESB000001Message extends MessageRecord
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
                                     "E01SBFBNK",
                                     "E01SBFCOD",
                                     "E01SBFDSC",
                                     "E01SBFCUN",
                                     "E01SBFFD1",
                                     "E01SBFFD2",
                                     "E01SBFAM1",
                                     "E01SBFAM2",
                                     "E01SBFFR1",
                                     "E01SBFFR2",
                                     "E01SBFFA1",
                                     "E01SBFFA2",
                                     "E01SBFTX1",
                                     "E01SBFTX2",
                                     "E01SBFBK1",
                                     "E01SBFBR1",
                                     "E01SBFCY1",
                                     "E01SBFGL1",
                                     "E01SBFAC1",
                                     "E01SBFCC1",
                                     "E01SBFBK2",
                                     "E01SBFBR2",
                                     "E01SBFCY2",
                                     "E01SBFGL2",
                                     "E01SBFAC2",
                                     "E01SBFCC2",
                                     "E01SBFFL1",
                                     "E01SBFFL2",
                                     "E01SBFFL3",
                                     "E01SBFFL4",
                                     "E01SBFFL5",
                                     "E01SBFFL6",
                                     "E01SBFFL7",
                                     "E01SBFFL8",
                                     "E01SBFFL9"
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
                                   "E01SBFBNK",
                                   "E01SBFCOD",
                                   "E01SBFDSC",
                                   "E01SBFCUN",
                                   "E01SBFFD1",
                                   "E01SBFFD2",
                                   "E01SBFAM1",
                                   "E01SBFAM2",
                                   "E01SBFFR1",
                                   "E01SBFFR2",
                                   "E01SBFFA1",
                                   "E01SBFFA2",
                                   "E01SBFTX1",
                                   "E01SBFTX2",
                                   "E01SBFBK1",
                                   "E01SBFBR1",
                                   "E01SBFCY1",
                                   "E01SBFGL1",
                                   "E01SBFAC1",
                                   "E01SBFCC1",
                                   "E01SBFBK2",
                                   "E01SBFBR2",
                                   "E01SBFCY2",
                                   "E01SBFGL2",
                                   "E01SBFAC2",
                                   "E01SBFCC2",
                                   "E01SBFFL1",
                                   "E01SBFFL2",
                                   "E01SBFFL3",
                                   "E01SBFFL4",
                                   "E01SBFFL5",
                                   "E01SBFFL6",
                                   "E01SBFFL7",
                                   "E01SBFFL8",
                                   "E01SBFFL9"
                                 };
  final static String fid = "1130611113337";
  final static String rid = "37D806C31235F";
  final static String fmtname = "ESB000001";
  final int FIELDCOUNT = 44;
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
  private CharacterField fieldE01SBFBNK = null;
  private CharacterField fieldE01SBFCOD = null;
  private CharacterField fieldE01SBFDSC = null;
  private DecimalField fieldE01SBFCUN = null;
  private CharacterField fieldE01SBFFD1 = null;
  private CharacterField fieldE01SBFFD2 = null;
  private DecimalField fieldE01SBFAM1 = null;
  private DecimalField fieldE01SBFAM2 = null;
  private CharacterField fieldE01SBFFR1 = null;
  private CharacterField fieldE01SBFFR2 = null;
  private CharacterField fieldE01SBFFA1 = null;
  private CharacterField fieldE01SBFFA2 = null;
  private CharacterField fieldE01SBFTX1 = null;
  private CharacterField fieldE01SBFTX2 = null;
  private CharacterField fieldE01SBFBK1 = null;
  private DecimalField fieldE01SBFBR1 = null;
  private CharacterField fieldE01SBFCY1 = null;
  private DecimalField fieldE01SBFGL1 = null;
  private DecimalField fieldE01SBFAC1 = null;
  private DecimalField fieldE01SBFCC1 = null;
  private CharacterField fieldE01SBFBK2 = null;
  private DecimalField fieldE01SBFBR2 = null;
  private CharacterField fieldE01SBFCY2 = null;
  private DecimalField fieldE01SBFGL2 = null;
  private DecimalField fieldE01SBFAC2 = null;
  private DecimalField fieldE01SBFCC2 = null;
  private CharacterField fieldE01SBFFL1 = null;
  private CharacterField fieldE01SBFFL2 = null;
  private CharacterField fieldE01SBFFL3 = null;
  private CharacterField fieldE01SBFFL4 = null;
  private CharacterField fieldE01SBFFL5 = null;
  private CharacterField fieldE01SBFFL6 = null;
  private DecimalField fieldE01SBFFL7 = null;
  private DecimalField fieldE01SBFFL8 = null;
  private DecimalField fieldE01SBFFL9 = null;

  /**
  * Constructor for ESB000001Message.
  */
  public ESB000001Message()
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
    recordsize = 473;
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
    fields[9] = fieldE01SBFBNK =
    new CharacterField(message, HEADERSIZE + 42, 2, "E01SBFBNK");
    fields[10] = fieldE01SBFCOD =
    new CharacterField(message, HEADERSIZE + 44, 2, "E01SBFCOD");
    fields[11] = fieldE01SBFDSC =
    new CharacterField(message, HEADERSIZE + 46, 60, "E01SBFDSC");
    fields[12] = fieldE01SBFCUN =
    new DecimalField(message, HEADERSIZE + 106, 10, 0, "E01SBFCUN");
    fields[13] = fieldE01SBFFD1 =
    new CharacterField(message, HEADERSIZE + 116, 60, "E01SBFFD1");
    fields[14] = fieldE01SBFFD2 =
    new CharacterField(message, HEADERSIZE + 176, 60, "E01SBFFD2");
    fields[15] = fieldE01SBFAM1 =
    new DecimalField(message, HEADERSIZE + 236, 17, 2, "E01SBFAM1");
    fields[16] = fieldE01SBFAM2 =
    new DecimalField(message, HEADERSIZE + 253, 17, 2, "E01SBFAM2");
    fields[17] = fieldE01SBFFR1 =
    new CharacterField(message, HEADERSIZE + 270, 1, "E01SBFFR1");
    fields[18] = fieldE01SBFFR2 =
    new CharacterField(message, HEADERSIZE + 271, 1, "E01SBFFR2");
    fields[19] = fieldE01SBFFA1 =
    new CharacterField(message, HEADERSIZE + 272, 1, "E01SBFFA1");
    fields[20] = fieldE01SBFFA2 =
    new CharacterField(message, HEADERSIZE + 273, 1, "E01SBFFA2");
    fields[21] = fieldE01SBFTX1 =
    new CharacterField(message, HEADERSIZE + 274, 1, "E01SBFTX1");
    fields[22] = fieldE01SBFTX2 =
    new CharacterField(message, HEADERSIZE + 275, 1, "E01SBFTX2");
    fields[23] = fieldE01SBFBK1 =
    new CharacterField(message, HEADERSIZE + 276, 2, "E01SBFBK1");
    fields[24] = fieldE01SBFBR1 =
    new DecimalField(message, HEADERSIZE + 278, 5, 0, "E01SBFBR1");
    fields[25] = fieldE01SBFCY1 =
    new CharacterField(message, HEADERSIZE + 283, 3, "E01SBFCY1");
    fields[26] = fieldE01SBFGL1 =
    new DecimalField(message, HEADERSIZE + 286, 17, 0, "E01SBFGL1");
    fields[27] = fieldE01SBFAC1 =
    new DecimalField(message, HEADERSIZE + 303, 13, 0, "E01SBFAC1");
    fields[28] = fieldE01SBFCC1 =
    new DecimalField(message, HEADERSIZE + 316, 9, 0, "E01SBFCC1");
    fields[29] = fieldE01SBFBK2 =
    new CharacterField(message, HEADERSIZE + 325, 2, "E01SBFBK2");
    fields[30] = fieldE01SBFBR2 =
    new DecimalField(message, HEADERSIZE + 327, 5, 0, "E01SBFBR2");
    fields[31] = fieldE01SBFCY2 =
    new CharacterField(message, HEADERSIZE + 332, 3, "E01SBFCY2");
    fields[32] = fieldE01SBFGL2 =
    new DecimalField(message, HEADERSIZE + 335, 17, 0, "E01SBFGL2");
    fields[33] = fieldE01SBFAC2 =
    new DecimalField(message, HEADERSIZE + 352, 13, 0, "E01SBFAC2");
    fields[34] = fieldE01SBFCC2 =
    new DecimalField(message, HEADERSIZE + 365, 9, 0, "E01SBFCC2");
    fields[35] = fieldE01SBFFL1 =
    new CharacterField(message, HEADERSIZE + 374, 1, "E01SBFFL1");
    fields[36] = fieldE01SBFFL2 =
    new CharacterField(message, HEADERSIZE + 375, 1, "E01SBFFL2");
    fields[37] = fieldE01SBFFL3 =
    new CharacterField(message, HEADERSIZE + 376, 1, "E01SBFFL3");
    fields[38] = fieldE01SBFFL4 =
    new CharacterField(message, HEADERSIZE + 377, 15, "E01SBFFL4");
    fields[39] = fieldE01SBFFL5 =
    new CharacterField(message, HEADERSIZE + 392, 15, "E01SBFFL5");
    fields[40] = fieldE01SBFFL6 =
    new CharacterField(message, HEADERSIZE + 407, 15, "E01SBFFL6");
    fields[41] = fieldE01SBFFL7 =
    new DecimalField(message, HEADERSIZE + 422, 17, 2, "E01SBFFL7");
    fields[42] = fieldE01SBFFL8 =
    new DecimalField(message, HEADERSIZE + 439, 17, 2, "E01SBFFL8");
    fields[43] = fieldE01SBFFL9 =
    new DecimalField(message, HEADERSIZE + 456, 17, 2, "E01SBFFL9");

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
  * Set field E01SBFBNK using a String value.
  */
  public void setE01SBFBNK(String newvalue)
  {
    fieldE01SBFBNK.setString(newvalue);
  }

  /**
  * Get value of field E01SBFBNK as a String.
  */
  public String getE01SBFBNK()
  {
    return fieldE01SBFBNK.getString();
  }

  /**
  * Set field E01SBFCOD using a String value.
  */
  public void setE01SBFCOD(String newvalue)
  {
    fieldE01SBFCOD.setString(newvalue);
  }

  /**
  * Get value of field E01SBFCOD as a String.
  */
  public String getE01SBFCOD()
  {
    return fieldE01SBFCOD.getString();
  }

  /**
  * Set field E01SBFDSC using a String value.
  */
  public void setE01SBFDSC(String newvalue)
  {
    fieldE01SBFDSC.setString(newvalue);
  }

  /**
  * Get value of field E01SBFDSC as a String.
  */
  public String getE01SBFDSC()
  {
    return fieldE01SBFDSC.getString();
  }

  /**
  * Set field E01SBFCUN using a String value.
  */
  public void setE01SBFCUN(String newvalue)
  {
    fieldE01SBFCUN.setString(newvalue);
  }

  /**
  * Get value of field E01SBFCUN as a String.
  */
  public String getE01SBFCUN()
  {
    return fieldE01SBFCUN.getString();
  }

  /**
  * Set numeric field E01SBFCUN using a BigDecimal value.
  */
  public void setE01SBFCUN(BigDecimal newvalue)
  {
    fieldE01SBFCUN.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01SBFCUN as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01SBFCUN()
  {
    return fieldE01SBFCUN.getBigDecimal();
  }

  /**
  * Set field E01SBFFD1 using a String value.
  */
  public void setE01SBFFD1(String newvalue)
  {
    fieldE01SBFFD1.setString(newvalue);
  }

  /**
  * Get value of field E01SBFFD1 as a String.
  */
  public String getE01SBFFD1()
  {
    return fieldE01SBFFD1.getString();
  }

  /**
  * Set field E01SBFFD2 using a String value.
  */
  public void setE01SBFFD2(String newvalue)
  {
    fieldE01SBFFD2.setString(newvalue);
  }

  /**
  * Get value of field E01SBFFD2 as a String.
  */
  public String getE01SBFFD2()
  {
    return fieldE01SBFFD2.getString();
  }

  /**
  * Set field E01SBFAM1 using a String value.
  */
  public void setE01SBFAM1(String newvalue)
  {
    fieldE01SBFAM1.setString(newvalue);
  }

  /**
  * Get value of field E01SBFAM1 as a String.
  */
  public String getE01SBFAM1()
  {
    return fieldE01SBFAM1.getString();
  }

  /**
  * Set numeric field E01SBFAM1 using a BigDecimal value.
  */
  public void setE01SBFAM1(BigDecimal newvalue)
  {
    fieldE01SBFAM1.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01SBFAM1 as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01SBFAM1()
  {
    return fieldE01SBFAM1.getBigDecimal();
  }

  /**
  * Set field E01SBFAM2 using a String value.
  */
  public void setE01SBFAM2(String newvalue)
  {
    fieldE01SBFAM2.setString(newvalue);
  }

  /**
  * Get value of field E01SBFAM2 as a String.
  */
  public String getE01SBFAM2()
  {
    return fieldE01SBFAM2.getString();
  }

  /**
  * Set numeric field E01SBFAM2 using a BigDecimal value.
  */
  public void setE01SBFAM2(BigDecimal newvalue)
  {
    fieldE01SBFAM2.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01SBFAM2 as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01SBFAM2()
  {
    return fieldE01SBFAM2.getBigDecimal();
  }

  /**
  * Set field E01SBFFR1 using a String value.
  */
  public void setE01SBFFR1(String newvalue)
  {
    fieldE01SBFFR1.setString(newvalue);
  }

  /**
  * Get value of field E01SBFFR1 as a String.
  */
  public String getE01SBFFR1()
  {
    return fieldE01SBFFR1.getString();
  }

  /**
  * Set field E01SBFFR2 using a String value.
  */
  public void setE01SBFFR2(String newvalue)
  {
    fieldE01SBFFR2.setString(newvalue);
  }

  /**
  * Get value of field E01SBFFR2 as a String.
  */
  public String getE01SBFFR2()
  {
    return fieldE01SBFFR2.getString();
  }

  /**
  * Set field E01SBFFA1 using a String value.
  */
  public void setE01SBFFA1(String newvalue)
  {
    fieldE01SBFFA1.setString(newvalue);
  }

  /**
  * Get value of field E01SBFFA1 as a String.
  */
  public String getE01SBFFA1()
  {
    return fieldE01SBFFA1.getString();
  }

  /**
  * Set field E01SBFFA2 using a String value.
  */
  public void setE01SBFFA2(String newvalue)
  {
    fieldE01SBFFA2.setString(newvalue);
  }

  /**
  * Get value of field E01SBFFA2 as a String.
  */
  public String getE01SBFFA2()
  {
    return fieldE01SBFFA2.getString();
  }

  /**
  * Set field E01SBFTX1 using a String value.
  */
  public void setE01SBFTX1(String newvalue)
  {
    fieldE01SBFTX1.setString(newvalue);
  }

  /**
  * Get value of field E01SBFTX1 as a String.
  */
  public String getE01SBFTX1()
  {
    return fieldE01SBFTX1.getString();
  }

  /**
  * Set field E01SBFTX2 using a String value.
  */
  public void setE01SBFTX2(String newvalue)
  {
    fieldE01SBFTX2.setString(newvalue);
  }

  /**
  * Get value of field E01SBFTX2 as a String.
  */
  public String getE01SBFTX2()
  {
    return fieldE01SBFTX2.getString();
  }

  /**
  * Set field E01SBFBK1 using a String value.
  */
  public void setE01SBFBK1(String newvalue)
  {
    fieldE01SBFBK1.setString(newvalue);
  }

  /**
  * Get value of field E01SBFBK1 as a String.
  */
  public String getE01SBFBK1()
  {
    return fieldE01SBFBK1.getString();
  }

  /**
  * Set field E01SBFBR1 using a String value.
  */
  public void setE01SBFBR1(String newvalue)
  {
    fieldE01SBFBR1.setString(newvalue);
  }

  /**
  * Get value of field E01SBFBR1 as a String.
  */
  public String getE01SBFBR1()
  {
    return fieldE01SBFBR1.getString();
  }

  /**
  * Set numeric field E01SBFBR1 using a BigDecimal value.
  */
  public void setE01SBFBR1(BigDecimal newvalue)
  {
    fieldE01SBFBR1.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01SBFBR1 as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01SBFBR1()
  {
    return fieldE01SBFBR1.getBigDecimal();
  }

  /**
  * Set field E01SBFCY1 using a String value.
  */
  public void setE01SBFCY1(String newvalue)
  {
    fieldE01SBFCY1.setString(newvalue);
  }

  /**
  * Get value of field E01SBFCY1 as a String.
  */
  public String getE01SBFCY1()
  {
    return fieldE01SBFCY1.getString();
  }

  /**
  * Set field E01SBFGL1 using a String value.
  */
  public void setE01SBFGL1(String newvalue)
  {
    fieldE01SBFGL1.setString(newvalue);
  }

  /**
  * Get value of field E01SBFGL1 as a String.
  */
  public String getE01SBFGL1()
  {
    return fieldE01SBFGL1.getString();
  }

  /**
  * Set numeric field E01SBFGL1 using a BigDecimal value.
  */
  public void setE01SBFGL1(BigDecimal newvalue)
  {
    fieldE01SBFGL1.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01SBFGL1 as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01SBFGL1()
  {
    return fieldE01SBFGL1.getBigDecimal();
  }

  /**
  * Set field E01SBFAC1 using a String value.
  */
  public void setE01SBFAC1(String newvalue)
  {
    fieldE01SBFAC1.setString(newvalue);
  }

  /**
  * Get value of field E01SBFAC1 as a String.
  */
  public String getE01SBFAC1()
  {
    return fieldE01SBFAC1.getString();
  }

  /**
  * Set numeric field E01SBFAC1 using a BigDecimal value.
  */
  public void setE01SBFAC1(BigDecimal newvalue)
  {
    fieldE01SBFAC1.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01SBFAC1 as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01SBFAC1()
  {
    return fieldE01SBFAC1.getBigDecimal();
  }

  /**
  * Set field E01SBFCC1 using a String value.
  */
  public void setE01SBFCC1(String newvalue)
  {
    fieldE01SBFCC1.setString(newvalue);
  }

  /**
  * Get value of field E01SBFCC1 as a String.
  */
  public String getE01SBFCC1()
  {
    return fieldE01SBFCC1.getString();
  }

  /**
  * Set numeric field E01SBFCC1 using a BigDecimal value.
  */
  public void setE01SBFCC1(BigDecimal newvalue)
  {
    fieldE01SBFCC1.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01SBFCC1 as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01SBFCC1()
  {
    return fieldE01SBFCC1.getBigDecimal();
  }

  /**
  * Set field E01SBFBK2 using a String value.
  */
  public void setE01SBFBK2(String newvalue)
  {
    fieldE01SBFBK2.setString(newvalue);
  }

  /**
  * Get value of field E01SBFBK2 as a String.
  */
  public String getE01SBFBK2()
  {
    return fieldE01SBFBK2.getString();
  }

  /**
  * Set field E01SBFBR2 using a String value.
  */
  public void setE01SBFBR2(String newvalue)
  {
    fieldE01SBFBR2.setString(newvalue);
  }

  /**
  * Get value of field E01SBFBR2 as a String.
  */
  public String getE01SBFBR2()
  {
    return fieldE01SBFBR2.getString();
  }

  /**
  * Set numeric field E01SBFBR2 using a BigDecimal value.
  */
  public void setE01SBFBR2(BigDecimal newvalue)
  {
    fieldE01SBFBR2.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01SBFBR2 as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01SBFBR2()
  {
    return fieldE01SBFBR2.getBigDecimal();
  }

  /**
  * Set field E01SBFCY2 using a String value.
  */
  public void setE01SBFCY2(String newvalue)
  {
    fieldE01SBFCY2.setString(newvalue);
  }

  /**
  * Get value of field E01SBFCY2 as a String.
  */
  public String getE01SBFCY2()
  {
    return fieldE01SBFCY2.getString();
  }

  /**
  * Set field E01SBFGL2 using a String value.
  */
  public void setE01SBFGL2(String newvalue)
  {
    fieldE01SBFGL2.setString(newvalue);
  }

  /**
  * Get value of field E01SBFGL2 as a String.
  */
  public String getE01SBFGL2()
  {
    return fieldE01SBFGL2.getString();
  }

  /**
  * Set numeric field E01SBFGL2 using a BigDecimal value.
  */
  public void setE01SBFGL2(BigDecimal newvalue)
  {
    fieldE01SBFGL2.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01SBFGL2 as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01SBFGL2()
  {
    return fieldE01SBFGL2.getBigDecimal();
  }

  /**
  * Set field E01SBFAC2 using a String value.
  */
  public void setE01SBFAC2(String newvalue)
  {
    fieldE01SBFAC2.setString(newvalue);
  }

  /**
  * Get value of field E01SBFAC2 as a String.
  */
  public String getE01SBFAC2()
  {
    return fieldE01SBFAC2.getString();
  }

  /**
  * Set numeric field E01SBFAC2 using a BigDecimal value.
  */
  public void setE01SBFAC2(BigDecimal newvalue)
  {
    fieldE01SBFAC2.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01SBFAC2 as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01SBFAC2()
  {
    return fieldE01SBFAC2.getBigDecimal();
  }

  /**
  * Set field E01SBFCC2 using a String value.
  */
  public void setE01SBFCC2(String newvalue)
  {
    fieldE01SBFCC2.setString(newvalue);
  }

  /**
  * Get value of field E01SBFCC2 as a String.
  */
  public String getE01SBFCC2()
  {
    return fieldE01SBFCC2.getString();
  }

  /**
  * Set numeric field E01SBFCC2 using a BigDecimal value.
  */
  public void setE01SBFCC2(BigDecimal newvalue)
  {
    fieldE01SBFCC2.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01SBFCC2 as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01SBFCC2()
  {
    return fieldE01SBFCC2.getBigDecimal();
  }

  /**
  * Set field E01SBFFL1 using a String value.
  */
  public void setE01SBFFL1(String newvalue)
  {
    fieldE01SBFFL1.setString(newvalue);
  }

  /**
  * Get value of field E01SBFFL1 as a String.
  */
  public String getE01SBFFL1()
  {
    return fieldE01SBFFL1.getString();
  }

  /**
  * Set field E01SBFFL2 using a String value.
  */
  public void setE01SBFFL2(String newvalue)
  {
    fieldE01SBFFL2.setString(newvalue);
  }

  /**
  * Get value of field E01SBFFL2 as a String.
  */
  public String getE01SBFFL2()
  {
    return fieldE01SBFFL2.getString();
  }

  /**
  * Set field E01SBFFL3 using a String value.
  */
  public void setE01SBFFL3(String newvalue)
  {
    fieldE01SBFFL3.setString(newvalue);
  }

  /**
  * Get value of field E01SBFFL3 as a String.
  */
  public String getE01SBFFL3()
  {
    return fieldE01SBFFL3.getString();
  }

  /**
  * Set field E01SBFFL4 using a String value.
  */
  public void setE01SBFFL4(String newvalue)
  {
    fieldE01SBFFL4.setString(newvalue);
  }

  /**
  * Get value of field E01SBFFL4 as a String.
  */
  public String getE01SBFFL4()
  {
    return fieldE01SBFFL4.getString();
  }

  /**
  * Set field E01SBFFL5 using a String value.
  */
  public void setE01SBFFL5(String newvalue)
  {
    fieldE01SBFFL5.setString(newvalue);
  }

  /**
  * Get value of field E01SBFFL5 as a String.
  */
  public String getE01SBFFL5()
  {
    return fieldE01SBFFL5.getString();
  }

  /**
  * Set field E01SBFFL6 using a String value.
  */
  public void setE01SBFFL6(String newvalue)
  {
    fieldE01SBFFL6.setString(newvalue);
  }

  /**
  * Get value of field E01SBFFL6 as a String.
  */
  public String getE01SBFFL6()
  {
    return fieldE01SBFFL6.getString();
  }

  /**
  * Set field E01SBFFL7 using a String value.
  */
  public void setE01SBFFL7(String newvalue)
  {
    fieldE01SBFFL7.setString(newvalue);
  }

  /**
  * Get value of field E01SBFFL7 as a String.
  */
  public String getE01SBFFL7()
  {
    return fieldE01SBFFL7.getString();
  }

  /**
  * Set numeric field E01SBFFL7 using a BigDecimal value.
  */
  public void setE01SBFFL7(BigDecimal newvalue)
  {
    fieldE01SBFFL7.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01SBFFL7 as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01SBFFL7()
  {
    return fieldE01SBFFL7.getBigDecimal();
  }

  /**
  * Set field E01SBFFL8 using a String value.
  */
  public void setE01SBFFL8(String newvalue)
  {
    fieldE01SBFFL8.setString(newvalue);
  }

  /**
  * Get value of field E01SBFFL8 as a String.
  */
  public String getE01SBFFL8()
  {
    return fieldE01SBFFL8.getString();
  }

  /**
  * Set numeric field E01SBFFL8 using a BigDecimal value.
  */
  public void setE01SBFFL8(BigDecimal newvalue)
  {
    fieldE01SBFFL8.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01SBFFL8 as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01SBFFL8()
  {
    return fieldE01SBFFL8.getBigDecimal();
  }

  /**
  * Set field E01SBFFL9 using a String value.
  */
  public void setE01SBFFL9(String newvalue)
  {
    fieldE01SBFFL9.setString(newvalue);
  }

  /**
  * Get value of field E01SBFFL9 as a String.
  */
  public String getE01SBFFL9()
  {
    return fieldE01SBFFL9.getString();
  }

  /**
  * Set numeric field E01SBFFL9 using a BigDecimal value.
  */
  public void setE01SBFFL9(BigDecimal newvalue)
  {
    fieldE01SBFFL9.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01SBFFL9 as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01SBFFL9()
  {
    return fieldE01SBFFL9.getBigDecimal();
  }

}
