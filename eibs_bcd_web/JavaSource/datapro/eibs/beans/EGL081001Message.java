package datapro.eibs.beans;

import datapro.eibs.sockets.*;
import java.io.*;
import java.math.*;

import java.util.*;

/**
* Class generated by AS/400 CRTCLASS command from EGL081001 physical file definition.
* 
* File level identifier is 1130611113204.
* Record format level identifier is 360D4D381F6AD.
*/

public class EGL081001Message extends MessageRecord
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
                                     "E01TRABNK",
                                     "E01TRABRN",
                                     "E01TRACCY",
                                     "E01TRAGLN",
                                     "E01TRAACC",
                                     "E01TRACCN",
                                     "E01TRABTH",
                                     "E01TRACDE",
                                     "E01TRANAR",
                                     "E01DATE11",
                                     "E01DATE12",
                                     "E01DATE13",
                                     "E01DATE21",
                                     "E01DATE22",
                                     "E01DATE23",
                                     "E01TRACKN",
                                     "E01TRAPTS",
                                     "E01TRACUN",
                                     "E01TRAAMT",
                                     "E01TRADCC",
                                     "E01TRAEAM",
                                     "E01TRAAPC",
                                     "E01TRAEXR",
                                     "E01TRAOBK",
                                     "E01TRAOBR",
                                     "E01TRATIM",
                                     "E01TRADRR",
                                     "E01TRAACR",
                                     "E01ENDBAL",
                                     "E01NUMNAR",
                                     "E01TRANA1",
                                     "E01TRANA2",
                                     "E01TRANA3",
                                     "E01TRANA4",
                                     "E01TRANA5",
                                     "E01TRANA6",
                                     "E01TRANA7",
                                     "E01TRANA8",
                                     "E01TRANA9",
                                     "E01TRAPD1",
                                     "E01TRAPD2",
                                     "E01TRAPD3",
                                     "E01NUMREC",
                                     "E01INDOPE"
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
                                   "E01TRABNK",
                                   "E01TRABRN",
                                   "E01TRACCY",
                                   "E01TRAGLN",
                                   "E01TRAACC",
                                   "E01TRACCN",
                                   "E01TRABTH",
                                   "E01TRACDE",
                                   "E01TRANAR",
                                   "E01DATE11",
                                   "E01DATE12",
                                   "E01DATE13",
                                   "E01DATE21",
                                   "E01DATE22",
                                   "E01DATE23",
                                   "E01TRACKN",
                                   "E01TRAPTS",
                                   "E01TRACUN",
                                   "E01TRAAMT",
                                   "E01TRADCC",
                                   "E01TRAEAM",
                                   "E01TRAAPC",
                                   "E01TRAEXR",
                                   "E01TRAOBK",
                                   "E01TRAOBR",
                                   "E01TRATIM",
                                   "E01TRADRR",
                                   "E01TRAACR",
                                   "E01ENDBAL",
                                   "E01NUMNAR",
                                   "E01TRANA1",
                                   "E01TRANA2",
                                   "E01TRANA3",
                                   "E01TRANA4",
                                   "E01TRANA5",
                                   "E01TRANA6",
                                   "E01TRANA7",
                                   "E01TRANA8",
                                   "E01TRANA9",
                                   "E01TRAPD1",
                                   "E01TRAPD2",
                                   "E01TRAPD3",
                                   "E01NUMREC",
                                   "E01INDOPE"
                                 };
  final static String fid = "1130611113204";
  final static String rid = "360D4D381F6AD";
  final static String fmtname = "EGL081001";
  final int FIELDCOUNT = 53;
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
  private CharacterField fieldE01TRABNK = null;
  private DecimalField fieldE01TRABRN = null;
  private CharacterField fieldE01TRACCY = null;
  private DecimalField fieldE01TRAGLN = null;
  private DecimalField fieldE01TRAACC = null;
  private DecimalField fieldE01TRACCN = null;
  private DecimalField fieldE01TRABTH = null;
  private CharacterField fieldE01TRACDE = null;
  private CharacterField fieldE01TRANAR = null;
  private DecimalField fieldE01DATE11 = null;
  private DecimalField fieldE01DATE12 = null;
  private DecimalField fieldE01DATE13 = null;
  private DecimalField fieldE01DATE21 = null;
  private DecimalField fieldE01DATE22 = null;
  private DecimalField fieldE01DATE23 = null;
  private DecimalField fieldE01TRACKN = null;
  private DecimalField fieldE01TRAPTS = null;
  private DecimalField fieldE01TRACUN = null;
  private DecimalField fieldE01TRAAMT = null;
  private CharacterField fieldE01TRADCC = null;
  private DecimalField fieldE01TRAEAM = null;
  private CharacterField fieldE01TRAAPC = null;
  private DecimalField fieldE01TRAEXR = null;
  private CharacterField fieldE01TRAOBK = null;
  private DecimalField fieldE01TRAOBR = null;
  private DecimalField fieldE01TRATIM = null;
  private DecimalField fieldE01TRADRR = null;
  private DecimalField fieldE01TRAACR = null;
  private DecimalField fieldE01ENDBAL = null;
  private DecimalField fieldE01NUMNAR = null;
  private CharacterField fieldE01TRANA1 = null;
  private CharacterField fieldE01TRANA2 = null;
  private CharacterField fieldE01TRANA3 = null;
  private CharacterField fieldE01TRANA4 = null;
  private CharacterField fieldE01TRANA5 = null;
  private CharacterField fieldE01TRANA6 = null;
  private CharacterField fieldE01TRANA7 = null;
  private CharacterField fieldE01TRANA8 = null;
  private CharacterField fieldE01TRANA9 = null;
  private DecimalField fieldE01TRAPD1 = null;
  private DecimalField fieldE01TRAPD2 = null;
  private DecimalField fieldE01TRAPD3 = null;
  private DecimalField fieldE01NUMREC = null;
  private CharacterField fieldE01INDOPE = null;

  /**
  * Constructor for EGL081001Message.
  */
  public EGL081001Message()
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
    recordsize = 885;
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
    fields[9] = fieldE01TRABNK =
    new CharacterField(message, HEADERSIZE + 42, 2, "E01TRABNK");
    fields[10] = fieldE01TRABRN =
    new DecimalField(message, HEADERSIZE + 44, 5, 0, "E01TRABRN");
    fields[11] = fieldE01TRACCY =
    new CharacterField(message, HEADERSIZE + 49, 3, "E01TRACCY");
    fields[12] = fieldE01TRAGLN =
    new DecimalField(message, HEADERSIZE + 52, 17, 0, "E01TRAGLN");
    fields[13] = fieldE01TRAACC =
    new DecimalField(message, HEADERSIZE + 69, 13, 0, "E01TRAACC");
    fields[14] = fieldE01TRACCN =
    new DecimalField(message, HEADERSIZE + 82, 9, 0, "E01TRACCN");
    fields[15] = fieldE01TRABTH =
    new DecimalField(message, HEADERSIZE + 91, 6, 0, "E01TRABTH");
    fields[16] = fieldE01TRACDE =
    new CharacterField(message, HEADERSIZE + 97, 4, "E01TRACDE");
    fields[17] = fieldE01TRANAR =
    new CharacterField(message, HEADERSIZE + 101, 60, "E01TRANAR");
    fields[18] = fieldE01DATE11 =
    new DecimalField(message, HEADERSIZE + 161, 3, 0, "E01DATE11");
    fields[19] = fieldE01DATE12 =
    new DecimalField(message, HEADERSIZE + 164, 3, 0, "E01DATE12");
    fields[20] = fieldE01DATE13 =
    new DecimalField(message, HEADERSIZE + 167, 5, 0, "E01DATE13");
    fields[21] = fieldE01DATE21 =
    new DecimalField(message, HEADERSIZE + 172, 3, 0, "E01DATE21");
    fields[22] = fieldE01DATE22 =
    new DecimalField(message, HEADERSIZE + 175, 3, 0, "E01DATE22");
    fields[23] = fieldE01DATE23 =
    new DecimalField(message, HEADERSIZE + 178, 5, 0, "E01DATE23");
    fields[24] = fieldE01TRACKN =
    new DecimalField(message, HEADERSIZE + 183, 12, 0, "E01TRACKN");
    fields[25] = fieldE01TRAPTS =
    new DecimalField(message, HEADERSIZE + 195, 6, 0, "E01TRAPTS");
    fields[26] = fieldE01TRACUN =
    new DecimalField(message, HEADERSIZE + 201, 10, 0, "E01TRACUN");
    fields[27] = fieldE01TRAAMT =
    new DecimalField(message, HEADERSIZE + 211, 17, 2, "E01TRAAMT");
    fields[28] = fieldE01TRADCC =
    new CharacterField(message, HEADERSIZE + 228, 1, "E01TRADCC");
    fields[29] = fieldE01TRAEAM =
    new DecimalField(message, HEADERSIZE + 229, 17, 2, "E01TRAEAM");
    fields[30] = fieldE01TRAAPC =
    new CharacterField(message, HEADERSIZE + 246, 2, "E01TRAAPC");
    fields[31] = fieldE01TRAEXR =
    new DecimalField(message, HEADERSIZE + 248, 13, 6, "E01TRAEXR");
    fields[32] = fieldE01TRAOBK =
    new CharacterField(message, HEADERSIZE + 261, 2, "E01TRAOBK");
    fields[33] = fieldE01TRAOBR =
    new DecimalField(message, HEADERSIZE + 263, 5, 0, "E01TRAOBR");
    fields[34] = fieldE01TRATIM =
    new DecimalField(message, HEADERSIZE + 268, 7, 0, "E01TRATIM");
    fields[35] = fieldE01TRADRR =
    new DecimalField(message, HEADERSIZE + 275, 13, 0, "E01TRADRR");
    fields[36] = fieldE01TRAACR =
    new DecimalField(message, HEADERSIZE + 288, 13, 0, "E01TRAACR");
    fields[37] = fieldE01ENDBAL =
    new DecimalField(message, HEADERSIZE + 301, 21, 2, "E01ENDBAL");
    fields[38] = fieldE01NUMNAR =
    new DecimalField(message, HEADERSIZE + 322, 3, 0, "E01NUMNAR");
    fields[39] = fieldE01TRANA1 =
    new CharacterField(message, HEADERSIZE + 325, 60, "E01TRANA1");
    fields[40] = fieldE01TRANA2 =
    new CharacterField(message, HEADERSIZE + 385, 60, "E01TRANA2");
    fields[41] = fieldE01TRANA3 =
    new CharacterField(message, HEADERSIZE + 445, 60, "E01TRANA3");
    fields[42] = fieldE01TRANA4 =
    new CharacterField(message, HEADERSIZE + 505, 60, "E01TRANA4");
    fields[43] = fieldE01TRANA5 =
    new CharacterField(message, HEADERSIZE + 565, 60, "E01TRANA5");
    fields[44] = fieldE01TRANA6 =
    new CharacterField(message, HEADERSIZE + 625, 60, "E01TRANA6");
    fields[45] = fieldE01TRANA7 =
    new CharacterField(message, HEADERSIZE + 685, 60, "E01TRANA7");
    fields[46] = fieldE01TRANA8 =
    new CharacterField(message, HEADERSIZE + 745, 60, "E01TRANA8");
    fields[47] = fieldE01TRANA9 =
    new CharacterField(message, HEADERSIZE + 805, 60, "E01TRANA9");
    fields[48] = fieldE01TRAPD1 =
    new DecimalField(message, HEADERSIZE + 865, 3, 0, "E01TRAPD1");
    fields[49] = fieldE01TRAPD2 =
    new DecimalField(message, HEADERSIZE + 868, 3, 0, "E01TRAPD2");
    fields[50] = fieldE01TRAPD3 =
    new DecimalField(message, HEADERSIZE + 871, 5, 0, "E01TRAPD3");
    fields[51] = fieldE01NUMREC =
    new DecimalField(message, HEADERSIZE + 876, 8, 0, "E01NUMREC");
    fields[52] = fieldE01INDOPE =
    new CharacterField(message, HEADERSIZE + 884, 1, "E01INDOPE");

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
  * Set field E01TRABNK using a String value.
  */
  public void setE01TRABNK(String newvalue)
  {
    fieldE01TRABNK.setString(newvalue);
  }

  /**
  * Get value of field E01TRABNK as a String.
  */
  public String getE01TRABNK()
  {
    return fieldE01TRABNK.getString();
  }

  /**
  * Set field E01TRABRN using a String value.
  */
  public void setE01TRABRN(String newvalue)
  {
    fieldE01TRABRN.setString(newvalue);
  }

  /**
  * Get value of field E01TRABRN as a String.
  */
  public String getE01TRABRN()
  {
    return fieldE01TRABRN.getString();
  }

  /**
  * Set numeric field E01TRABRN using a BigDecimal value.
  */
  public void setE01TRABRN(BigDecimal newvalue)
  {
    fieldE01TRABRN.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01TRABRN as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01TRABRN()
  {
    return fieldE01TRABRN.getBigDecimal();
  }

  /**
  * Set field E01TRACCY using a String value.
  */
  public void setE01TRACCY(String newvalue)
  {
    fieldE01TRACCY.setString(newvalue);
  }

  /**
  * Get value of field E01TRACCY as a String.
  */
  public String getE01TRACCY()
  {
    return fieldE01TRACCY.getString();
  }

  /**
  * Set field E01TRAGLN using a String value.
  */
  public void setE01TRAGLN(String newvalue)
  {
    fieldE01TRAGLN.setString(newvalue);
  }

  /**
  * Get value of field E01TRAGLN as a String.
  */
  public String getE01TRAGLN()
  {
    return fieldE01TRAGLN.getString();
  }

  /**
  * Set numeric field E01TRAGLN using a BigDecimal value.
  */
  public void setE01TRAGLN(BigDecimal newvalue)
  {
    fieldE01TRAGLN.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01TRAGLN as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01TRAGLN()
  {
    return fieldE01TRAGLN.getBigDecimal();
  }

  /**
  * Set field E01TRAACC using a String value.
  */
  public void setE01TRAACC(String newvalue)
  {
    fieldE01TRAACC.setString(newvalue);
  }

  /**
  * Get value of field E01TRAACC as a String.
  */
  public String getE01TRAACC()
  {
    return fieldE01TRAACC.getString();
  }

  /**
  * Set numeric field E01TRAACC using a BigDecimal value.
  */
  public void setE01TRAACC(BigDecimal newvalue)
  {
    fieldE01TRAACC.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01TRAACC as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01TRAACC()
  {
    return fieldE01TRAACC.getBigDecimal();
  }

  /**
  * Set field E01TRACCN using a String value.
  */
  public void setE01TRACCN(String newvalue)
  {
    fieldE01TRACCN.setString(newvalue);
  }

  /**
  * Get value of field E01TRACCN as a String.
  */
  public String getE01TRACCN()
  {
    return fieldE01TRACCN.getString();
  }

  /**
  * Set numeric field E01TRACCN using a BigDecimal value.
  */
  public void setE01TRACCN(BigDecimal newvalue)
  {
    fieldE01TRACCN.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01TRACCN as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01TRACCN()
  {
    return fieldE01TRACCN.getBigDecimal();
  }

  /**
  * Set field E01TRABTH using a String value.
  */
  public void setE01TRABTH(String newvalue)
  {
    fieldE01TRABTH.setString(newvalue);
  }

  /**
  * Get value of field E01TRABTH as a String.
  */
  public String getE01TRABTH()
  {
    return fieldE01TRABTH.getString();
  }

  /**
  * Set numeric field E01TRABTH using a BigDecimal value.
  */
  public void setE01TRABTH(BigDecimal newvalue)
  {
    fieldE01TRABTH.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01TRABTH as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01TRABTH()
  {
    return fieldE01TRABTH.getBigDecimal();
  }

  /**
  * Set field E01TRACDE using a String value.
  */
  public void setE01TRACDE(String newvalue)
  {
    fieldE01TRACDE.setString(newvalue);
  }

  /**
  * Get value of field E01TRACDE as a String.
  */
  public String getE01TRACDE()
  {
    return fieldE01TRACDE.getString();
  }

  /**
  * Set field E01TRANAR using a String value.
  */
  public void setE01TRANAR(String newvalue)
  {
    fieldE01TRANAR.setString(newvalue);
  }

  /**
  * Get value of field E01TRANAR as a String.
  */
  public String getE01TRANAR()
  {
    return fieldE01TRANAR.getString();
  }

  /**
  * Set field E01DATE11 using a String value.
  */
  public void setE01DATE11(String newvalue)
  {
    fieldE01DATE11.setString(newvalue);
  }

  /**
  * Get value of field E01DATE11 as a String.
  */
  public String getE01DATE11()
  {
    return fieldE01DATE11.getString();
  }

  /**
  * Set numeric field E01DATE11 using a BigDecimal value.
  */
  public void setE01DATE11(BigDecimal newvalue)
  {
    fieldE01DATE11.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01DATE11 as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01DATE11()
  {
    return fieldE01DATE11.getBigDecimal();
  }

  /**
  * Set field E01DATE12 using a String value.
  */
  public void setE01DATE12(String newvalue)
  {
    fieldE01DATE12.setString(newvalue);
  }

  /**
  * Get value of field E01DATE12 as a String.
  */
  public String getE01DATE12()
  {
    return fieldE01DATE12.getString();
  }

  /**
  * Set numeric field E01DATE12 using a BigDecimal value.
  */
  public void setE01DATE12(BigDecimal newvalue)
  {
    fieldE01DATE12.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01DATE12 as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01DATE12()
  {
    return fieldE01DATE12.getBigDecimal();
  }

  /**
  * Set field E01DATE13 using a String value.
  */
  public void setE01DATE13(String newvalue)
  {
    fieldE01DATE13.setString(newvalue);
  }

  /**
  * Get value of field E01DATE13 as a String.
  */
  public String getE01DATE13()
  {
    return fieldE01DATE13.getString();
  }

  /**
  * Set numeric field E01DATE13 using a BigDecimal value.
  */
  public void setE01DATE13(BigDecimal newvalue)
  {
    fieldE01DATE13.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01DATE13 as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01DATE13()
  {
    return fieldE01DATE13.getBigDecimal();
  }

  /**
  * Set field E01DATE21 using a String value.
  */
  public void setE01DATE21(String newvalue)
  {
    fieldE01DATE21.setString(newvalue);
  }

  /**
  * Get value of field E01DATE21 as a String.
  */
  public String getE01DATE21()
  {
    return fieldE01DATE21.getString();
  }

  /**
  * Set numeric field E01DATE21 using a BigDecimal value.
  */
  public void setE01DATE21(BigDecimal newvalue)
  {
    fieldE01DATE21.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01DATE21 as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01DATE21()
  {
    return fieldE01DATE21.getBigDecimal();
  }

  /**
  * Set field E01DATE22 using a String value.
  */
  public void setE01DATE22(String newvalue)
  {
    fieldE01DATE22.setString(newvalue);
  }

  /**
  * Get value of field E01DATE22 as a String.
  */
  public String getE01DATE22()
  {
    return fieldE01DATE22.getString();
  }

  /**
  * Set numeric field E01DATE22 using a BigDecimal value.
  */
  public void setE01DATE22(BigDecimal newvalue)
  {
    fieldE01DATE22.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01DATE22 as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01DATE22()
  {
    return fieldE01DATE22.getBigDecimal();
  }

  /**
  * Set field E01DATE23 using a String value.
  */
  public void setE01DATE23(String newvalue)
  {
    fieldE01DATE23.setString(newvalue);
  }

  /**
  * Get value of field E01DATE23 as a String.
  */
  public String getE01DATE23()
  {
    return fieldE01DATE23.getString();
  }

  /**
  * Set numeric field E01DATE23 using a BigDecimal value.
  */
  public void setE01DATE23(BigDecimal newvalue)
  {
    fieldE01DATE23.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01DATE23 as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01DATE23()
  {
    return fieldE01DATE23.getBigDecimal();
  }

  /**
  * Set field E01TRACKN using a String value.
  */
  public void setE01TRACKN(String newvalue)
  {
    fieldE01TRACKN.setString(newvalue);
  }

  /**
  * Get value of field E01TRACKN as a String.
  */
  public String getE01TRACKN()
  {
    return fieldE01TRACKN.getString();
  }

  /**
  * Set numeric field E01TRACKN using a BigDecimal value.
  */
  public void setE01TRACKN(BigDecimal newvalue)
  {
    fieldE01TRACKN.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01TRACKN as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01TRACKN()
  {
    return fieldE01TRACKN.getBigDecimal();
  }

  /**
  * Set field E01TRAPTS using a String value.
  */
  public void setE01TRAPTS(String newvalue)
  {
    fieldE01TRAPTS.setString(newvalue);
  }

  /**
  * Get value of field E01TRAPTS as a String.
  */
  public String getE01TRAPTS()
  {
    return fieldE01TRAPTS.getString();
  }

  /**
  * Set numeric field E01TRAPTS using a BigDecimal value.
  */
  public void setE01TRAPTS(BigDecimal newvalue)
  {
    fieldE01TRAPTS.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01TRAPTS as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01TRAPTS()
  {
    return fieldE01TRAPTS.getBigDecimal();
  }

  /**
  * Set field E01TRACUN using a String value.
  */
  public void setE01TRACUN(String newvalue)
  {
    fieldE01TRACUN.setString(newvalue);
  }

  /**
  * Get value of field E01TRACUN as a String.
  */
  public String getE01TRACUN()
  {
    return fieldE01TRACUN.getString();
  }

  /**
  * Set numeric field E01TRACUN using a BigDecimal value.
  */
  public void setE01TRACUN(BigDecimal newvalue)
  {
    fieldE01TRACUN.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01TRACUN as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01TRACUN()
  {
    return fieldE01TRACUN.getBigDecimal();
  }

  /**
  * Set field E01TRAAMT using a String value.
  */
  public void setE01TRAAMT(String newvalue)
  {
    fieldE01TRAAMT.setString(newvalue);
  }

  /**
  * Get value of field E01TRAAMT as a String.
  */
  public String getE01TRAAMT()
  {
    return fieldE01TRAAMT.getString();
  }

  /**
  * Set numeric field E01TRAAMT using a BigDecimal value.
  */
  public void setE01TRAAMT(BigDecimal newvalue)
  {
    fieldE01TRAAMT.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01TRAAMT as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01TRAAMT()
  {
    return fieldE01TRAAMT.getBigDecimal();
  }

  /**
  * Set field E01TRADCC using a String value.
  */
  public void setE01TRADCC(String newvalue)
  {
    fieldE01TRADCC.setString(newvalue);
  }

  /**
  * Get value of field E01TRADCC as a String.
  */
  public String getE01TRADCC()
  {
    return fieldE01TRADCC.getString();
  }

  /**
  * Set field E01TRAEAM using a String value.
  */
  public void setE01TRAEAM(String newvalue)
  {
    fieldE01TRAEAM.setString(newvalue);
  }

  /**
  * Get value of field E01TRAEAM as a String.
  */
  public String getE01TRAEAM()
  {
    return fieldE01TRAEAM.getString();
  }

  /**
  * Set numeric field E01TRAEAM using a BigDecimal value.
  */
  public void setE01TRAEAM(BigDecimal newvalue)
  {
    fieldE01TRAEAM.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01TRAEAM as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01TRAEAM()
  {
    return fieldE01TRAEAM.getBigDecimal();
  }

  /**
  * Set field E01TRAAPC using a String value.
  */
  public void setE01TRAAPC(String newvalue)
  {
    fieldE01TRAAPC.setString(newvalue);
  }

  /**
  * Get value of field E01TRAAPC as a String.
  */
  public String getE01TRAAPC()
  {
    return fieldE01TRAAPC.getString();
  }

  /**
  * Set field E01TRAEXR using a String value.
  */
  public void setE01TRAEXR(String newvalue)
  {
    fieldE01TRAEXR.setString(newvalue);
  }

  /**
  * Get value of field E01TRAEXR as a String.
  */
  public String getE01TRAEXR()
  {
    return fieldE01TRAEXR.getString();
  }

  /**
  * Set numeric field E01TRAEXR using a BigDecimal value.
  */
  public void setE01TRAEXR(BigDecimal newvalue)
  {
    fieldE01TRAEXR.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01TRAEXR as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01TRAEXR()
  {
    return fieldE01TRAEXR.getBigDecimal();
  }

  /**
  * Set field E01TRAOBK using a String value.
  */
  public void setE01TRAOBK(String newvalue)
  {
    fieldE01TRAOBK.setString(newvalue);
  }

  /**
  * Get value of field E01TRAOBK as a String.
  */
  public String getE01TRAOBK()
  {
    return fieldE01TRAOBK.getString();
  }

  /**
  * Set field E01TRAOBR using a String value.
  */
  public void setE01TRAOBR(String newvalue)
  {
    fieldE01TRAOBR.setString(newvalue);
  }

  /**
  * Get value of field E01TRAOBR as a String.
  */
  public String getE01TRAOBR()
  {
    return fieldE01TRAOBR.getString();
  }

  /**
  * Set numeric field E01TRAOBR using a BigDecimal value.
  */
  public void setE01TRAOBR(BigDecimal newvalue)
  {
    fieldE01TRAOBR.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01TRAOBR as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01TRAOBR()
  {
    return fieldE01TRAOBR.getBigDecimal();
  }

  /**
  * Set field E01TRATIM using a String value.
  */
  public void setE01TRATIM(String newvalue)
  {
    fieldE01TRATIM.setString(newvalue);
  }

  /**
  * Get value of field E01TRATIM as a String.
  */
  public String getE01TRATIM()
  {
    return fieldE01TRATIM.getString();
  }

  /**
  * Set numeric field E01TRATIM using a BigDecimal value.
  */
  public void setE01TRATIM(BigDecimal newvalue)
  {
    fieldE01TRATIM.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01TRATIM as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01TRATIM()
  {
    return fieldE01TRATIM.getBigDecimal();
  }

  /**
  * Set field E01TRADRR using a String value.
  */
  public void setE01TRADRR(String newvalue)
  {
    fieldE01TRADRR.setString(newvalue);
  }

  /**
  * Get value of field E01TRADRR as a String.
  */
  public String getE01TRADRR()
  {
    return fieldE01TRADRR.getString();
  }

  /**
  * Set numeric field E01TRADRR using a BigDecimal value.
  */
  public void setE01TRADRR(BigDecimal newvalue)
  {
    fieldE01TRADRR.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01TRADRR as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01TRADRR()
  {
    return fieldE01TRADRR.getBigDecimal();
  }

  /**
  * Set field E01TRAACR using a String value.
  */
  public void setE01TRAACR(String newvalue)
  {
    fieldE01TRAACR.setString(newvalue);
  }

  /**
  * Get value of field E01TRAACR as a String.
  */
  public String getE01TRAACR()
  {
    return fieldE01TRAACR.getString();
  }

  /**
  * Set numeric field E01TRAACR using a BigDecimal value.
  */
  public void setE01TRAACR(BigDecimal newvalue)
  {
    fieldE01TRAACR.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01TRAACR as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01TRAACR()
  {
    return fieldE01TRAACR.getBigDecimal();
  }

  /**
  * Set field E01ENDBAL using a String value.
  */
  public void setE01ENDBAL(String newvalue)
  {
    fieldE01ENDBAL.setString(newvalue);
  }

  /**
  * Get value of field E01ENDBAL as a String.
  */
  public String getE01ENDBAL()
  {
    return fieldE01ENDBAL.getString();
  }

  /**
  * Set numeric field E01ENDBAL using a BigDecimal value.
  */
  public void setE01ENDBAL(BigDecimal newvalue)
  {
    fieldE01ENDBAL.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01ENDBAL as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01ENDBAL()
  {
    return fieldE01ENDBAL.getBigDecimal();
  }

  /**
  * Set field E01NUMNAR using a String value.
  */
  public void setE01NUMNAR(String newvalue)
  {
    fieldE01NUMNAR.setString(newvalue);
  }

  /**
  * Get value of field E01NUMNAR as a String.
  */
  public String getE01NUMNAR()
  {
    return fieldE01NUMNAR.getString();
  }

  /**
  * Set numeric field E01NUMNAR using a BigDecimal value.
  */
  public void setE01NUMNAR(BigDecimal newvalue)
  {
    fieldE01NUMNAR.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01NUMNAR as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01NUMNAR()
  {
    return fieldE01NUMNAR.getBigDecimal();
  }

  /**
  * Set field E01TRANA1 using a String value.
  */
  public void setE01TRANA1(String newvalue)
  {
    fieldE01TRANA1.setString(newvalue);
  }

  /**
  * Get value of field E01TRANA1 as a String.
  */
  public String getE01TRANA1()
  {
    return fieldE01TRANA1.getString();
  }

  /**
  * Set field E01TRANA2 using a String value.
  */
  public void setE01TRANA2(String newvalue)
  {
    fieldE01TRANA2.setString(newvalue);
  }

  /**
  * Get value of field E01TRANA2 as a String.
  */
  public String getE01TRANA2()
  {
    return fieldE01TRANA2.getString();
  }

  /**
  * Set field E01TRANA3 using a String value.
  */
  public void setE01TRANA3(String newvalue)
  {
    fieldE01TRANA3.setString(newvalue);
  }

  /**
  * Get value of field E01TRANA3 as a String.
  */
  public String getE01TRANA3()
  {
    return fieldE01TRANA3.getString();
  }

  /**
  * Set field E01TRANA4 using a String value.
  */
  public void setE01TRANA4(String newvalue)
  {
    fieldE01TRANA4.setString(newvalue);
  }

  /**
  * Get value of field E01TRANA4 as a String.
  */
  public String getE01TRANA4()
  {
    return fieldE01TRANA4.getString();
  }

  /**
  * Set field E01TRANA5 using a String value.
  */
  public void setE01TRANA5(String newvalue)
  {
    fieldE01TRANA5.setString(newvalue);
  }

  /**
  * Get value of field E01TRANA5 as a String.
  */
  public String getE01TRANA5()
  {
    return fieldE01TRANA5.getString();
  }

  /**
  * Set field E01TRANA6 using a String value.
  */
  public void setE01TRANA6(String newvalue)
  {
    fieldE01TRANA6.setString(newvalue);
  }

  /**
  * Get value of field E01TRANA6 as a String.
  */
  public String getE01TRANA6()
  {
    return fieldE01TRANA6.getString();
  }

  /**
  * Set field E01TRANA7 using a String value.
  */
  public void setE01TRANA7(String newvalue)
  {
    fieldE01TRANA7.setString(newvalue);
  }

  /**
  * Get value of field E01TRANA7 as a String.
  */
  public String getE01TRANA7()
  {
    return fieldE01TRANA7.getString();
  }

  /**
  * Set field E01TRANA8 using a String value.
  */
  public void setE01TRANA8(String newvalue)
  {
    fieldE01TRANA8.setString(newvalue);
  }

  /**
  * Get value of field E01TRANA8 as a String.
  */
  public String getE01TRANA8()
  {
    return fieldE01TRANA8.getString();
  }

  /**
  * Set field E01TRANA9 using a String value.
  */
  public void setE01TRANA9(String newvalue)
  {
    fieldE01TRANA9.setString(newvalue);
  }

  /**
  * Get value of field E01TRANA9 as a String.
  */
  public String getE01TRANA9()
  {
    return fieldE01TRANA9.getString();
  }

  /**
  * Set field E01TRAPD1 using a String value.
  */
  public void setE01TRAPD1(String newvalue)
  {
    fieldE01TRAPD1.setString(newvalue);
  }

  /**
  * Get value of field E01TRAPD1 as a String.
  */
  public String getE01TRAPD1()
  {
    return fieldE01TRAPD1.getString();
  }

  /**
  * Set numeric field E01TRAPD1 using a BigDecimal value.
  */
  public void setE01TRAPD1(BigDecimal newvalue)
  {
    fieldE01TRAPD1.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01TRAPD1 as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01TRAPD1()
  {
    return fieldE01TRAPD1.getBigDecimal();
  }

  /**
  * Set field E01TRAPD2 using a String value.
  */
  public void setE01TRAPD2(String newvalue)
  {
    fieldE01TRAPD2.setString(newvalue);
  }

  /**
  * Get value of field E01TRAPD2 as a String.
  */
  public String getE01TRAPD2()
  {
    return fieldE01TRAPD2.getString();
  }

  /**
  * Set numeric field E01TRAPD2 using a BigDecimal value.
  */
  public void setE01TRAPD2(BigDecimal newvalue)
  {
    fieldE01TRAPD2.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01TRAPD2 as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01TRAPD2()
  {
    return fieldE01TRAPD2.getBigDecimal();
  }

  /**
  * Set field E01TRAPD3 using a String value.
  */
  public void setE01TRAPD3(String newvalue)
  {
    fieldE01TRAPD3.setString(newvalue);
  }

  /**
  * Get value of field E01TRAPD3 as a String.
  */
  public String getE01TRAPD3()
  {
    return fieldE01TRAPD3.getString();
  }

  /**
  * Set numeric field E01TRAPD3 using a BigDecimal value.
  */
  public void setE01TRAPD3(BigDecimal newvalue)
  {
    fieldE01TRAPD3.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01TRAPD3 as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01TRAPD3()
  {
    return fieldE01TRAPD3.getBigDecimal();
  }

  /**
  * Set field E01NUMREC using a String value.
  */
  public void setE01NUMREC(String newvalue)
  {
    fieldE01NUMREC.setString(newvalue);
  }

  /**
  * Get value of field E01NUMREC as a String.
  */
  public String getE01NUMREC()
  {
    return fieldE01NUMREC.getString();
  }

  /**
  * Set numeric field E01NUMREC using a BigDecimal value.
  */
  public void setE01NUMREC(BigDecimal newvalue)
  {
    fieldE01NUMREC.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01NUMREC as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01NUMREC()
  {
    return fieldE01NUMREC.getBigDecimal();
  }

  /**
  * Set field E01INDOPE using a String value.
  */
  public void setE01INDOPE(String newvalue)
  {
    fieldE01INDOPE.setString(newvalue);
  }

  /**
  * Get value of field E01INDOPE as a String.
  */
  public String getE01INDOPE()
  {
    return fieldE01INDOPE.getString();
  }

}
