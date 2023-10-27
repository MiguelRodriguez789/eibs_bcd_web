package datapro.eibs.beans;

import datapro.eibs.sockets.*;
import java.io.*;
import java.math.*;

import java.util.*;

/**
* Class generated by AS/400 CRTCLASS command from ESB011001 physical file definition.
* 
* File level identifier is 1130611113338.
* Record format level identifier is 3AAA43F286660.
*/

public class ESB011001Message extends MessageRecord
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
                                     "E01SBMBNK",
                                     "E01SBMCOD",
                                     "E01SBMTYP",
                                     "E01SBMCUN",
                                     "E01SBMLOC",
                                     "E01SBMDSC",
                                     "E01SBMSER",
                                     "E01SBMKEY",
                                     "E01SBMKNU",
                                     "E01SBMRBK",
                                     "E01SBMRBR",
                                     "E01SBMRCY",
                                     "E01SBMRGL",
                                     "E01SBMRAC",
                                     "E01SBMRCC",
                                     "E01SBMFEE",
                                     "E01SBMFRQ",
                                     "E01SBMODY",
                                     "E01SBMODM",
                                     "E01SBMODD",
                                     "E01SBMCDY",
                                     "E01SBMCDM",
                                     "E01SBMCDD",
                                     "E01SBMUC1",
                                     "E01SBMUC2",
                                     "E01SBMUC3",
                                     "E01SBMUC4",
                                     "E01SBMUC5",
                                     "D01SBTDSC",
                                     "D01LOCNME",
                                     "D01CUSNA1",
                                     "D01UC1DSC",
                                     "D01UC2DSC",
                                     "D01UC3DSC",
                                     "D01UC4DSC",
                                     "D01UC5DSC"
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
                                   "E01SBMBNK",
                                   "E01SBMCOD",
                                   "E01SBMTYP",
                                   "E01SBMCUN",
                                   "E01SBMLOC",
                                   "E01SBMDSC",
                                   "E01SBMSER",
                                   "E01SBMKEY",
                                   "E01SBMKNU",
                                   "E01SBMRBK",
                                   "E01SBMRBR",
                                   "E01SBMRCY",
                                   "E01SBMRGL",
                                   "E01SBMRAC",
                                   "E01SBMRCC",
                                   "E01SBMFEE",
                                   "E01SBMFRQ",
                                   "E01SBMODY",
                                   "E01SBMODM",
                                   "E01SBMODD",
                                   "E01SBMCDY",
                                   "E01SBMCDM",
                                   "E01SBMCDD",
                                   "E01SBMUC1",
                                   "E01SBMUC2",
                                   "E01SBMUC3",
                                   "E01SBMUC4",
                                   "E01SBMUC5",
                                   "D01SBTDSC",
                                   "D01LOCNME",
                                   "D01CUSNA1",
                                   "D01UC1DSC",
                                   "D01UC2DSC",
                                   "D01UC3DSC",
                                   "D01UC4DSC",
                                   "D01UC5DSC"
                                 };
  final static String fid = "1130611113338";
  final static String rid = "3AAA43F286660";
  final static String fmtname = "ESB011001";
  final int FIELDCOUNT = 45;
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
  private CharacterField fieldE01SBMBNK = null;
  private DecimalField fieldE01SBMCOD = null;
  private DecimalField fieldE01SBMTYP = null;
  private DecimalField fieldE01SBMCUN = null;
  private CharacterField fieldE01SBMLOC = null;
  private CharacterField fieldE01SBMDSC = null;
  private DecimalField fieldE01SBMSER = null;
  private DecimalField fieldE01SBMKEY = null;
  private DecimalField fieldE01SBMKNU = null;
  private CharacterField fieldE01SBMRBK = null;
  private DecimalField fieldE01SBMRBR = null;
  private CharacterField fieldE01SBMRCY = null;
  private DecimalField fieldE01SBMRGL = null;
  private DecimalField fieldE01SBMRAC = null;
  private DecimalField fieldE01SBMRCC = null;
  private CharacterField fieldE01SBMFEE = null;
  private CharacterField fieldE01SBMFRQ = null;
  private DecimalField fieldE01SBMODY = null;
  private DecimalField fieldE01SBMODM = null;
  private DecimalField fieldE01SBMODD = null;
  private DecimalField fieldE01SBMCDY = null;
  private DecimalField fieldE01SBMCDM = null;
  private DecimalField fieldE01SBMCDD = null;
  private CharacterField fieldE01SBMUC1 = null;
  private CharacterField fieldE01SBMUC2 = null;
  private CharacterField fieldE01SBMUC3 = null;
  private CharacterField fieldE01SBMUC4 = null;
  private CharacterField fieldE01SBMUC5 = null;
  private CharacterField fieldD01SBTDSC = null;
  private CharacterField fieldD01LOCNME = null;
  private CharacterField fieldD01CUSNA1 = null;
  private CharacterField fieldD01UC1DSC = null;
  private CharacterField fieldD01UC2DSC = null;
  private CharacterField fieldD01UC3DSC = null;
  private CharacterField fieldD01UC4DSC = null;
  private CharacterField fieldD01UC5DSC = null;

  /**
  * Constructor for ESB011001Message.
  */
  public ESB011001Message()
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
    recordsize = 687;
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
    fields[9] = fieldE01SBMBNK =
    new CharacterField(message, HEADERSIZE + 42, 2, "E01SBMBNK");
    fields[10] = fieldE01SBMCOD =
    new DecimalField(message, HEADERSIZE + 44, 13, 0, "E01SBMCOD");
    fields[11] = fieldE01SBMTYP =
    new DecimalField(message, HEADERSIZE + 57, 5, 0, "E01SBMTYP");
    fields[12] = fieldE01SBMCUN =
    new DecimalField(message, HEADERSIZE + 62, 10, 0, "E01SBMCUN");
    fields[13] = fieldE01SBMLOC =
    new CharacterField(message, HEADERSIZE + 72, 4, "E01SBMLOC");
    fields[14] = fieldE01SBMDSC =
    new CharacterField(message, HEADERSIZE + 76, 60, "E01SBMDSC");
    fields[15] = fieldE01SBMSER =
    new DecimalField(message, HEADERSIZE + 136, 14, 0, "E01SBMSER");
    fields[16] = fieldE01SBMKEY =
    new DecimalField(message, HEADERSIZE + 150, 14, 0, "E01SBMKEY");
    fields[17] = fieldE01SBMKNU =
    new DecimalField(message, HEADERSIZE + 164, 4, 0, "E01SBMKNU");
    fields[18] = fieldE01SBMRBK =
    new CharacterField(message, HEADERSIZE + 168, 2, "E01SBMRBK");
    fields[19] = fieldE01SBMRBR =
    new DecimalField(message, HEADERSIZE + 170, 5, 0, "E01SBMRBR");
    fields[20] = fieldE01SBMRCY =
    new CharacterField(message, HEADERSIZE + 175, 3, "E01SBMRCY");
    fields[21] = fieldE01SBMRGL =
    new DecimalField(message, HEADERSIZE + 178, 17, 0, "E01SBMRGL");
    fields[22] = fieldE01SBMRAC =
    new DecimalField(message, HEADERSIZE + 195, 13, 0, "E01SBMRAC");
    fields[23] = fieldE01SBMRCC =
    new DecimalField(message, HEADERSIZE + 208, 9, 0, "E01SBMRCC");
    fields[24] = fieldE01SBMFEE =
    new CharacterField(message, HEADERSIZE + 217, 2, "E01SBMFEE");
    fields[25] = fieldE01SBMFRQ =
    new CharacterField(message, HEADERSIZE + 219, 1, "E01SBMFRQ");
    fields[26] = fieldE01SBMODY =
    new DecimalField(message, HEADERSIZE + 220, 5, 0, "E01SBMODY");
    fields[27] = fieldE01SBMODM =
    new DecimalField(message, HEADERSIZE + 225, 3, 0, "E01SBMODM");
    fields[28] = fieldE01SBMODD =
    new DecimalField(message, HEADERSIZE + 228, 3, 0, "E01SBMODD");
    fields[29] = fieldE01SBMCDY =
    new DecimalField(message, HEADERSIZE + 231, 5, 0, "E01SBMCDY");
    fields[30] = fieldE01SBMCDM =
    new DecimalField(message, HEADERSIZE + 236, 3, 0, "E01SBMCDM");
    fields[31] = fieldE01SBMCDD =
    new DecimalField(message, HEADERSIZE + 239, 3, 0, "E01SBMCDD");
    fields[32] = fieldE01SBMUC1 =
    new CharacterField(message, HEADERSIZE + 242, 4, "E01SBMUC1");
    fields[33] = fieldE01SBMUC2 =
    new CharacterField(message, HEADERSIZE + 246, 4, "E01SBMUC2");
    fields[34] = fieldE01SBMUC3 =
    new CharacterField(message, HEADERSIZE + 250, 4, "E01SBMUC3");
    fields[35] = fieldE01SBMUC4 =
    new CharacterField(message, HEADERSIZE + 254, 4, "E01SBMUC4");
    fields[36] = fieldE01SBMUC5 =
    new CharacterField(message, HEADERSIZE + 258, 4, "E01SBMUC5");
    fields[37] = fieldD01SBTDSC =
    new CharacterField(message, HEADERSIZE + 262, 60, "D01SBTDSC");
    fields[38] = fieldD01LOCNME =
    new CharacterField(message, HEADERSIZE + 322, 80, "D01LOCNME");
    fields[39] = fieldD01CUSNA1 =
    new CharacterField(message, HEADERSIZE + 402, 60, "D01CUSNA1");
    fields[40] = fieldD01UC1DSC =
    new CharacterField(message, HEADERSIZE + 462, 45, "D01UC1DSC");
    fields[41] = fieldD01UC2DSC =
    new CharacterField(message, HEADERSIZE + 507, 45, "D01UC2DSC");
    fields[42] = fieldD01UC3DSC =
    new CharacterField(message, HEADERSIZE + 552, 45, "D01UC3DSC");
    fields[43] = fieldD01UC4DSC =
    new CharacterField(message, HEADERSIZE + 597, 45, "D01UC4DSC");
    fields[44] = fieldD01UC5DSC =
    new CharacterField(message, HEADERSIZE + 642, 45, "D01UC5DSC");

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
  * Set field E01SBMBNK using a String value.
  */
  public void setE01SBMBNK(String newvalue)
  {
    fieldE01SBMBNK.setString(newvalue);
  }

  /**
  * Get value of field E01SBMBNK as a String.
  */
  public String getE01SBMBNK()
  {
    return fieldE01SBMBNK.getString();
  }

  /**
  * Set field E01SBMCOD using a String value.
  */
  public void setE01SBMCOD(String newvalue)
  {
    fieldE01SBMCOD.setString(newvalue);
  }

  /**
  * Get value of field E01SBMCOD as a String.
  */
  public String getE01SBMCOD()
  {
    return fieldE01SBMCOD.getString();
  }

  /**
  * Set numeric field E01SBMCOD using a BigDecimal value.
  */
  public void setE01SBMCOD(BigDecimal newvalue)
  {
    fieldE01SBMCOD.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01SBMCOD as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01SBMCOD()
  {
    return fieldE01SBMCOD.getBigDecimal();
  }

  /**
  * Set field E01SBMTYP using a String value.
  */
  public void setE01SBMTYP(String newvalue)
  {
    fieldE01SBMTYP.setString(newvalue);
  }

  /**
  * Get value of field E01SBMTYP as a String.
  */
  public String getE01SBMTYP()
  {
    return fieldE01SBMTYP.getString();
  }

  /**
  * Set numeric field E01SBMTYP using a BigDecimal value.
  */
  public void setE01SBMTYP(BigDecimal newvalue)
  {
    fieldE01SBMTYP.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01SBMTYP as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01SBMTYP()
  {
    return fieldE01SBMTYP.getBigDecimal();
  }

  /**
  * Set field E01SBMCUN using a String value.
  */
  public void setE01SBMCUN(String newvalue)
  {
    fieldE01SBMCUN.setString(newvalue);
  }

  /**
  * Get value of field E01SBMCUN as a String.
  */
  public String getE01SBMCUN()
  {
    return fieldE01SBMCUN.getString();
  }

  /**
  * Set numeric field E01SBMCUN using a BigDecimal value.
  */
  public void setE01SBMCUN(BigDecimal newvalue)
  {
    fieldE01SBMCUN.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01SBMCUN as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01SBMCUN()
  {
    return fieldE01SBMCUN.getBigDecimal();
  }

  /**
  * Set field E01SBMLOC using a String value.
  */
  public void setE01SBMLOC(String newvalue)
  {
    fieldE01SBMLOC.setString(newvalue);
  }

  /**
  * Get value of field E01SBMLOC as a String.
  */
  public String getE01SBMLOC()
  {
    return fieldE01SBMLOC.getString();
  }

  /**
  * Set field E01SBMDSC using a String value.
  */
  public void setE01SBMDSC(String newvalue)
  {
    fieldE01SBMDSC.setString(newvalue);
  }

  /**
  * Get value of field E01SBMDSC as a String.
  */
  public String getE01SBMDSC()
  {
    return fieldE01SBMDSC.getString();
  }

  /**
  * Set field E01SBMSER using a String value.
  */
  public void setE01SBMSER(String newvalue)
  {
    fieldE01SBMSER.setString(newvalue);
  }

  /**
  * Get value of field E01SBMSER as a String.
  */
  public String getE01SBMSER()
  {
    return fieldE01SBMSER.getString();
  }

  /**
  * Set numeric field E01SBMSER using a BigDecimal value.
  */
  public void setE01SBMSER(BigDecimal newvalue)
  {
    fieldE01SBMSER.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01SBMSER as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01SBMSER()
  {
    return fieldE01SBMSER.getBigDecimal();
  }

  /**
  * Set field E01SBMKEY using a String value.
  */
  public void setE01SBMKEY(String newvalue)
  {
    fieldE01SBMKEY.setString(newvalue);
  }

  /**
  * Get value of field E01SBMKEY as a String.
  */
  public String getE01SBMKEY()
  {
    return fieldE01SBMKEY.getString();
  }

  /**
  * Set numeric field E01SBMKEY using a BigDecimal value.
  */
  public void setE01SBMKEY(BigDecimal newvalue)
  {
    fieldE01SBMKEY.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01SBMKEY as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01SBMKEY()
  {
    return fieldE01SBMKEY.getBigDecimal();
  }

  /**
  * Set field E01SBMKNU using a String value.
  */
  public void setE01SBMKNU(String newvalue)
  {
    fieldE01SBMKNU.setString(newvalue);
  }

  /**
  * Get value of field E01SBMKNU as a String.
  */
  public String getE01SBMKNU()
  {
    return fieldE01SBMKNU.getString();
  }

  /**
  * Set numeric field E01SBMKNU using a BigDecimal value.
  */
  public void setE01SBMKNU(BigDecimal newvalue)
  {
    fieldE01SBMKNU.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01SBMKNU as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01SBMKNU()
  {
    return fieldE01SBMKNU.getBigDecimal();
  }

  /**
  * Set field E01SBMRBK using a String value.
  */
  public void setE01SBMRBK(String newvalue)
  {
    fieldE01SBMRBK.setString(newvalue);
  }

  /**
  * Get value of field E01SBMRBK as a String.
  */
  public String getE01SBMRBK()
  {
    return fieldE01SBMRBK.getString();
  }

  /**
  * Set field E01SBMRBR using a String value.
  */
  public void setE01SBMRBR(String newvalue)
  {
    fieldE01SBMRBR.setString(newvalue);
  }

  /**
  * Get value of field E01SBMRBR as a String.
  */
  public String getE01SBMRBR()
  {
    return fieldE01SBMRBR.getString();
  }

  /**
  * Set numeric field E01SBMRBR using a BigDecimal value.
  */
  public void setE01SBMRBR(BigDecimal newvalue)
  {
    fieldE01SBMRBR.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01SBMRBR as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01SBMRBR()
  {
    return fieldE01SBMRBR.getBigDecimal();
  }

  /**
  * Set field E01SBMRCY using a String value.
  */
  public void setE01SBMRCY(String newvalue)
  {
    fieldE01SBMRCY.setString(newvalue);
  }

  /**
  * Get value of field E01SBMRCY as a String.
  */
  public String getE01SBMRCY()
  {
    return fieldE01SBMRCY.getString();
  }

  /**
  * Set field E01SBMRGL using a String value.
  */
  public void setE01SBMRGL(String newvalue)
  {
    fieldE01SBMRGL.setString(newvalue);
  }

  /**
  * Get value of field E01SBMRGL as a String.
  */
  public String getE01SBMRGL()
  {
    return fieldE01SBMRGL.getString();
  }

  /**
  * Set numeric field E01SBMRGL using a BigDecimal value.
  */
  public void setE01SBMRGL(BigDecimal newvalue)
  {
    fieldE01SBMRGL.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01SBMRGL as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01SBMRGL()
  {
    return fieldE01SBMRGL.getBigDecimal();
  }

  /**
  * Set field E01SBMRAC using a String value.
  */
  public void setE01SBMRAC(String newvalue)
  {
    fieldE01SBMRAC.setString(newvalue);
  }

  /**
  * Get value of field E01SBMRAC as a String.
  */
  public String getE01SBMRAC()
  {
    return fieldE01SBMRAC.getString();
  }

  /**
  * Set numeric field E01SBMRAC using a BigDecimal value.
  */
  public void setE01SBMRAC(BigDecimal newvalue)
  {
    fieldE01SBMRAC.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01SBMRAC as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01SBMRAC()
  {
    return fieldE01SBMRAC.getBigDecimal();
  }

  /**
  * Set field E01SBMRCC using a String value.
  */
  public void setE01SBMRCC(String newvalue)
  {
    fieldE01SBMRCC.setString(newvalue);
  }

  /**
  * Get value of field E01SBMRCC as a String.
  */
  public String getE01SBMRCC()
  {
    return fieldE01SBMRCC.getString();
  }

  /**
  * Set numeric field E01SBMRCC using a BigDecimal value.
  */
  public void setE01SBMRCC(BigDecimal newvalue)
  {
    fieldE01SBMRCC.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01SBMRCC as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01SBMRCC()
  {
    return fieldE01SBMRCC.getBigDecimal();
  }

  /**
  * Set field E01SBMFEE using a String value.
  */
  public void setE01SBMFEE(String newvalue)
  {
    fieldE01SBMFEE.setString(newvalue);
  }

  /**
  * Get value of field E01SBMFEE as a String.
  */
  public String getE01SBMFEE()
  {
    return fieldE01SBMFEE.getString();
  }

  /**
  * Set field E01SBMFRQ using a String value.
  */
  public void setE01SBMFRQ(String newvalue)
  {
    fieldE01SBMFRQ.setString(newvalue);
  }

  /**
  * Get value of field E01SBMFRQ as a String.
  */
  public String getE01SBMFRQ()
  {
    return fieldE01SBMFRQ.getString();
  }

  /**
  * Set field E01SBMODY using a String value.
  */
  public void setE01SBMODY(String newvalue)
  {
    fieldE01SBMODY.setString(newvalue);
  }

  /**
  * Get value of field E01SBMODY as a String.
  */
  public String getE01SBMODY()
  {
    return fieldE01SBMODY.getString();
  }

  /**
  * Set numeric field E01SBMODY using a BigDecimal value.
  */
  public void setE01SBMODY(BigDecimal newvalue)
  {
    fieldE01SBMODY.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01SBMODY as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01SBMODY()
  {
    return fieldE01SBMODY.getBigDecimal();
  }

  /**
  * Set field E01SBMODM using a String value.
  */
  public void setE01SBMODM(String newvalue)
  {
    fieldE01SBMODM.setString(newvalue);
  }

  /**
  * Get value of field E01SBMODM as a String.
  */
  public String getE01SBMODM()
  {
    return fieldE01SBMODM.getString();
  }

  /**
  * Set numeric field E01SBMODM using a BigDecimal value.
  */
  public void setE01SBMODM(BigDecimal newvalue)
  {
    fieldE01SBMODM.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01SBMODM as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01SBMODM()
  {
    return fieldE01SBMODM.getBigDecimal();
  }

  /**
  * Set field E01SBMODD using a String value.
  */
  public void setE01SBMODD(String newvalue)
  {
    fieldE01SBMODD.setString(newvalue);
  }

  /**
  * Get value of field E01SBMODD as a String.
  */
  public String getE01SBMODD()
  {
    return fieldE01SBMODD.getString();
  }

  /**
  * Set numeric field E01SBMODD using a BigDecimal value.
  */
  public void setE01SBMODD(BigDecimal newvalue)
  {
    fieldE01SBMODD.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01SBMODD as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01SBMODD()
  {
    return fieldE01SBMODD.getBigDecimal();
  }

  /**
  * Set field E01SBMCDY using a String value.
  */
  public void setE01SBMCDY(String newvalue)
  {
    fieldE01SBMCDY.setString(newvalue);
  }

  /**
  * Get value of field E01SBMCDY as a String.
  */
  public String getE01SBMCDY()
  {
    return fieldE01SBMCDY.getString();
  }

  /**
  * Set numeric field E01SBMCDY using a BigDecimal value.
  */
  public void setE01SBMCDY(BigDecimal newvalue)
  {
    fieldE01SBMCDY.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01SBMCDY as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01SBMCDY()
  {
    return fieldE01SBMCDY.getBigDecimal();
  }

  /**
  * Set field E01SBMCDM using a String value.
  */
  public void setE01SBMCDM(String newvalue)
  {
    fieldE01SBMCDM.setString(newvalue);
  }

  /**
  * Get value of field E01SBMCDM as a String.
  */
  public String getE01SBMCDM()
  {
    return fieldE01SBMCDM.getString();
  }

  /**
  * Set numeric field E01SBMCDM using a BigDecimal value.
  */
  public void setE01SBMCDM(BigDecimal newvalue)
  {
    fieldE01SBMCDM.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01SBMCDM as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01SBMCDM()
  {
    return fieldE01SBMCDM.getBigDecimal();
  }

  /**
  * Set field E01SBMCDD using a String value.
  */
  public void setE01SBMCDD(String newvalue)
  {
    fieldE01SBMCDD.setString(newvalue);
  }

  /**
  * Get value of field E01SBMCDD as a String.
  */
  public String getE01SBMCDD()
  {
    return fieldE01SBMCDD.getString();
  }

  /**
  * Set numeric field E01SBMCDD using a BigDecimal value.
  */
  public void setE01SBMCDD(BigDecimal newvalue)
  {
    fieldE01SBMCDD.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01SBMCDD as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01SBMCDD()
  {
    return fieldE01SBMCDD.getBigDecimal();
  }

  /**
  * Set field E01SBMUC1 using a String value.
  */
  public void setE01SBMUC1(String newvalue)
  {
    fieldE01SBMUC1.setString(newvalue);
  }

  /**
  * Get value of field E01SBMUC1 as a String.
  */
  public String getE01SBMUC1()
  {
    return fieldE01SBMUC1.getString();
  }

  /**
  * Set field E01SBMUC2 using a String value.
  */
  public void setE01SBMUC2(String newvalue)
  {
    fieldE01SBMUC2.setString(newvalue);
  }

  /**
  * Get value of field E01SBMUC2 as a String.
  */
  public String getE01SBMUC2()
  {
    return fieldE01SBMUC2.getString();
  }

  /**
  * Set field E01SBMUC3 using a String value.
  */
  public void setE01SBMUC3(String newvalue)
  {
    fieldE01SBMUC3.setString(newvalue);
  }

  /**
  * Get value of field E01SBMUC3 as a String.
  */
  public String getE01SBMUC3()
  {
    return fieldE01SBMUC3.getString();
  }

  /**
  * Set field E01SBMUC4 using a String value.
  */
  public void setE01SBMUC4(String newvalue)
  {
    fieldE01SBMUC4.setString(newvalue);
  }

  /**
  * Get value of field E01SBMUC4 as a String.
  */
  public String getE01SBMUC4()
  {
    return fieldE01SBMUC4.getString();
  }

  /**
  * Set field E01SBMUC5 using a String value.
  */
  public void setE01SBMUC5(String newvalue)
  {
    fieldE01SBMUC5.setString(newvalue);
  }

  /**
  * Get value of field E01SBMUC5 as a String.
  */
  public String getE01SBMUC5()
  {
    return fieldE01SBMUC5.getString();
  }

  /**
  * Set field D01SBTDSC using a String value.
  */
  public void setD01SBTDSC(String newvalue)
  {
    fieldD01SBTDSC.setString(newvalue);
  }

  /**
  * Get value of field D01SBTDSC as a String.
  */
  public String getD01SBTDSC()
  {
    return fieldD01SBTDSC.getString();
  }

  /**
  * Set field D01LOCNME using a String value.
  */
  public void setD01LOCNME(String newvalue)
  {
    fieldD01LOCNME.setString(newvalue);
  }

  /**
  * Get value of field D01LOCNME as a String.
  */
  public String getD01LOCNME()
  {
    return fieldD01LOCNME.getString();
  }

  /**
  * Set field D01CUSNA1 using a String value.
  */
  public void setD01CUSNA1(String newvalue)
  {
    fieldD01CUSNA1.setString(newvalue);
  }

  /**
  * Get value of field D01CUSNA1 as a String.
  */
  public String getD01CUSNA1()
  {
    return fieldD01CUSNA1.getString();
  }

  /**
  * Set field D01UC1DSC using a String value.
  */
  public void setD01UC1DSC(String newvalue)
  {
    fieldD01UC1DSC.setString(newvalue);
  }

  /**
  * Get value of field D01UC1DSC as a String.
  */
  public String getD01UC1DSC()
  {
    return fieldD01UC1DSC.getString();
  }

  /**
  * Set field D01UC2DSC using a String value.
  */
  public void setD01UC2DSC(String newvalue)
  {
    fieldD01UC2DSC.setString(newvalue);
  }

  /**
  * Get value of field D01UC2DSC as a String.
  */
  public String getD01UC2DSC()
  {
    return fieldD01UC2DSC.getString();
  }

  /**
  * Set field D01UC3DSC using a String value.
  */
  public void setD01UC3DSC(String newvalue)
  {
    fieldD01UC3DSC.setString(newvalue);
  }

  /**
  * Get value of field D01UC3DSC as a String.
  */
  public String getD01UC3DSC()
  {
    return fieldD01UC3DSC.getString();
  }

  /**
  * Set field D01UC4DSC using a String value.
  */
  public void setD01UC4DSC(String newvalue)
  {
    fieldD01UC4DSC.setString(newvalue);
  }

  /**
  * Get value of field D01UC4DSC as a String.
  */
  public String getD01UC4DSC()
  {
    return fieldD01UC4DSC.getString();
  }

  /**
  * Set field D01UC5DSC using a String value.
  */
  public void setD01UC5DSC(String newvalue)
  {
    fieldD01UC5DSC.setString(newvalue);
  }

  /**
  * Get value of field D01UC5DSC as a String.
  */
  public String getD01UC5DSC()
  {
    return fieldD01UC5DSC.getString();
  }

}
