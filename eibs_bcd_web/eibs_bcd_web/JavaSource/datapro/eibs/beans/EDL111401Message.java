package datapro.eibs.beans;

import datapro.eibs.sockets.*;
import java.io.*;
import java.math.*;

import java.util.*;

/**
* Class generated by AS/400 CRTCLASS command from EDL111401 physical file definition.
* 
* File level identifier is 1170221163206.
* Record format level identifier is 3733CA0770EAF.
*/

public class EDL111401Message extends MessageRecord
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
                                     "E01INFTYP",
                                     "E01FRDTEM",
                                     "E01FRDTED",
                                     "E01FRDTEY",
                                     "E01TODTEM",
                                     "E01TODTED",
                                     "E01TODTEY",
                                     "E01GLMATY",
                                     "E01DLSACC",
                                     "E01DEACUN",
                                     "E01CUSNA1",
                                     "E01DATE1M",
                                     "E01DATE1D",
                                     "E01DATE1Y",
                                     "E01DATE2M",
                                     "E01DATE2D",
                                     "E01DATE2Y",
                                     "E01DLSSTS",
                                     "E01DLSPFL",
                                     "E01DLSAMT",
                                     "E01DLSPAD",
                                     "E01LIMMTH",
                                     "E01LIMYTD",
                                     "E01DEAOAM",
                                     "E01DEAIDG",
                                     "E01DLPPNU",
                                     "E01DLSCDE",
                                     "E01DLSSEQ",
                                     "E01DLSOBK",
                                     "E01DLSOBR",
                                     "E01DLSOCY",
                                     "E01DLSOGL",
                                     "E01ROCSP1",
                                     "E01ROCSP2",
                                     "E01ENDBAL",
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
                                   "E01INFTYP",
                                   "E01FRDTEM",
                                   "E01FRDTED",
                                   "E01FRDTEY",
                                   "E01TODTEM",
                                   "E01TODTED",
                                   "E01TODTEY",
                                   "E01GLMATY",
                                   "E01DLSACC",
                                   "E01DEACUN",
                                   "E01CUSNA1",
                                   "E01DATE1M",
                                   "E01DATE1D",
                                   "E01DATE1Y",
                                   "E01DATE2M",
                                   "E01DATE2D",
                                   "E01DATE2Y",
                                   "E01DLSSTS",
                                   "E01DLSPFL",
                                   "E01DLSAMT",
                                   "E01DLSPAD",
                                   "E01LIMMTH",
                                   "E01LIMYTD",
                                   "E01DEAOAM",
                                   "E01DEAIDG",
                                   "E01DLPPNU",
                                   "E01DLSCDE",
                                   "E01DLSSEQ",
                                   "E01DLSOBK",
                                   "E01DLSOBR",
                                   "E01DLSOCY",
                                   "E01DLSOGL",
                                   "E01ROCSP1",
                                   "E01ROCSP2",
                                   "E01ENDBAL",
                                   "E01NUMREC",
                                   "E01INDOPE"
                                 };
  final static String fid = "1170221163206";
  final static String rid = "3733CA0770EAF";
  final static String fmtname = "EDL111401";
  final int FIELDCOUNT = 46;
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
  private CharacterField fieldE01INFTYP = null;
  private DecimalField fieldE01FRDTEM = null;
  private DecimalField fieldE01FRDTED = null;
  private DecimalField fieldE01FRDTEY = null;
  private DecimalField fieldE01TODTEM = null;
  private DecimalField fieldE01TODTED = null;
  private DecimalField fieldE01TODTEY = null;
  private CharacterField fieldE01GLMATY = null;
  private DecimalField fieldE01DLSACC = null;
  private DecimalField fieldE01DEACUN = null;
  private CharacterField fieldE01CUSNA1 = null;
  private DecimalField fieldE01DATE1M = null;
  private DecimalField fieldE01DATE1D = null;
  private DecimalField fieldE01DATE1Y = null;
  private DecimalField fieldE01DATE2M = null;
  private DecimalField fieldE01DATE2D = null;
  private DecimalField fieldE01DATE2Y = null;
  private CharacterField fieldE01DLSSTS = null;
  private CharacterField fieldE01DLSPFL = null;
  private DecimalField fieldE01DLSAMT = null;
  private DecimalField fieldE01DLSPAD = null;
  private DecimalField fieldE01LIMMTH = null;
  private DecimalField fieldE01LIMYTD = null;
  private DecimalField fieldE01DEAOAM = null;
  private DecimalField fieldE01DEAIDG = null;
  private DecimalField fieldE01DLPPNU = null;
  private CharacterField fieldE01DLSCDE = null;
  private DecimalField fieldE01DLSSEQ = null;
  private CharacterField fieldE01DLSOBK = null;
  private DecimalField fieldE01DLSOBR = null;
  private CharacterField fieldE01DLSOCY = null;
  private DecimalField fieldE01DLSOGL = null;
  private CharacterField fieldE01ROCSP1 = null;
  private CharacterField fieldE01ROCSP2 = null;
  private DecimalField fieldE01ENDBAL = null;
  private DecimalField fieldE01NUMREC = null;
  private CharacterField fieldE01INDOPE = null;

  /**
  * Constructor for EDL111401Message.
  */
  public EDL111401Message()
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
    recordsize = 444;
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
    fields[9] = fieldE01INFTYP =
    new CharacterField(message, HEADERSIZE + 42, 1, "E01INFTYP");
    fields[10] = fieldE01FRDTEM =
    new DecimalField(message, HEADERSIZE + 43, 3, 0, "E01FRDTEM");
    fields[11] = fieldE01FRDTED =
    new DecimalField(message, HEADERSIZE + 46, 3, 0, "E01FRDTED");
    fields[12] = fieldE01FRDTEY =
    new DecimalField(message, HEADERSIZE + 49, 5, 0, "E01FRDTEY");
    fields[13] = fieldE01TODTEM =
    new DecimalField(message, HEADERSIZE + 54, 3, 0, "E01TODTEM");
    fields[14] = fieldE01TODTED =
    new DecimalField(message, HEADERSIZE + 57, 3, 0, "E01TODTED");
    fields[15] = fieldE01TODTEY =
    new DecimalField(message, HEADERSIZE + 60, 5, 0, "E01TODTEY");
    fields[16] = fieldE01GLMATY =
    new CharacterField(message, HEADERSIZE + 65, 4, "E01GLMATY");
    fields[17] = fieldE01DLSACC =
    new DecimalField(message, HEADERSIZE + 69, 13, 0, "E01DLSACC");
    fields[18] = fieldE01DEACUN =
    new DecimalField(message, HEADERSIZE + 82, 10, 0, "E01DEACUN");
    fields[19] = fieldE01CUSNA1 =
    new CharacterField(message, HEADERSIZE + 92, 60, "E01CUSNA1");
    fields[20] = fieldE01DATE1M =
    new DecimalField(message, HEADERSIZE + 152, 3, 0, "E01DATE1M");
    fields[21] = fieldE01DATE1D =
    new DecimalField(message, HEADERSIZE + 155, 3, 0, "E01DATE1D");
    fields[22] = fieldE01DATE1Y =
    new DecimalField(message, HEADERSIZE + 158, 5, 0, "E01DATE1Y");
    fields[23] = fieldE01DATE2M =
    new DecimalField(message, HEADERSIZE + 163, 3, 0, "E01DATE2M");
    fields[24] = fieldE01DATE2D =
    new DecimalField(message, HEADERSIZE + 166, 3, 0, "E01DATE2D");
    fields[25] = fieldE01DATE2Y =
    new DecimalField(message, HEADERSIZE + 169, 5, 0, "E01DATE2Y");
    fields[26] = fieldE01DLSSTS =
    new CharacterField(message, HEADERSIZE + 174, 1, "E01DLSSTS");
    fields[27] = fieldE01DLSPFL =
    new CharacterField(message, HEADERSIZE + 175, 1, "E01DLSPFL");
    fields[28] = fieldE01DLSAMT =
    new DecimalField(message, HEADERSIZE + 176, 17, 2, "E01DLSAMT");
    fields[29] = fieldE01DLSPAD =
    new DecimalField(message, HEADERSIZE + 193, 17, 2, "E01DLSPAD");
    fields[30] = fieldE01LIMMTH =
    new DecimalField(message, HEADERSIZE + 210, 11, 6, "E01LIMMTH");
    fields[31] = fieldE01LIMYTD =
    new DecimalField(message, HEADERSIZE + 221, 11, 6, "E01LIMYTD");
    fields[32] = fieldE01DEAOAM =
    new DecimalField(message, HEADERSIZE + 232, 17, 2, "E01DEAOAM");
    fields[33] = fieldE01DEAIDG =
    new DecimalField(message, HEADERSIZE + 249, 17, 2, "E01DEAIDG");
    fields[34] = fieldE01DLPPNU =
    new DecimalField(message, HEADERSIZE + 266, 6, 0, "E01DLPPNU");
    fields[35] = fieldE01DLSCDE =
    new CharacterField(message, HEADERSIZE + 272, 4, "E01DLSCDE");
    fields[36] = fieldE01DLSSEQ =
    new DecimalField(message, HEADERSIZE + 276, 3, 0, "E01DLSSEQ");
    fields[37] = fieldE01DLSOBK =
    new CharacterField(message, HEADERSIZE + 279, 2, "E01DLSOBK");
    fields[38] = fieldE01DLSOBR =
    new DecimalField(message, HEADERSIZE + 281, 5, 0, "E01DLSOBR");
    fields[39] = fieldE01DLSOCY =
    new CharacterField(message, HEADERSIZE + 286, 3, "E01DLSOCY");
    fields[40] = fieldE01DLSOGL =
    new DecimalField(message, HEADERSIZE + 289, 17, 0, "E01DLSOGL");
    fields[41] = fieldE01ROCSP1 =
    new CharacterField(message, HEADERSIZE + 306, 56, "E01ROCSP1");
    fields[42] = fieldE01ROCSP2 =
    new CharacterField(message, HEADERSIZE + 362, 56, "E01ROCSP2");
    fields[43] = fieldE01ENDBAL =
    new DecimalField(message, HEADERSIZE + 418, 17, 2, "E01ENDBAL");
    fields[44] = fieldE01NUMREC =
    new DecimalField(message, HEADERSIZE + 435, 8, 0, "E01NUMREC");
    fields[45] = fieldE01INDOPE =
    new CharacterField(message, HEADERSIZE + 443, 1, "E01INDOPE");

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
  * Set field E01INFTYP using a String value.
  */
  public void setE01INFTYP(String newvalue)
  {
    fieldE01INFTYP.setString(newvalue);
  }

  /**
  * Get value of field E01INFTYP as a String.
  */
  public String getE01INFTYP()
  {
    return fieldE01INFTYP.getString();
  }

  /**
  * Set field E01FRDTEM using a String value.
  */
  public void setE01FRDTEM(String newvalue)
  {
    fieldE01FRDTEM.setString(newvalue);
  }

  /**
  * Get value of field E01FRDTEM as a String.
  */
  public String getE01FRDTEM()
  {
    return fieldE01FRDTEM.getString();
  }

  /**
  * Set numeric field E01FRDTEM using a BigDecimal value.
  */
  public void setE01FRDTEM(BigDecimal newvalue)
  {
    fieldE01FRDTEM.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01FRDTEM as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01FRDTEM()
  {
    return fieldE01FRDTEM.getBigDecimal();
  }

  /**
  * Set field E01FRDTED using a String value.
  */
  public void setE01FRDTED(String newvalue)
  {
    fieldE01FRDTED.setString(newvalue);
  }

  /**
  * Get value of field E01FRDTED as a String.
  */
  public String getE01FRDTED()
  {
    return fieldE01FRDTED.getString();
  }

  /**
  * Set numeric field E01FRDTED using a BigDecimal value.
  */
  public void setE01FRDTED(BigDecimal newvalue)
  {
    fieldE01FRDTED.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01FRDTED as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01FRDTED()
  {
    return fieldE01FRDTED.getBigDecimal();
  }

  /**
  * Set field E01FRDTEY using a String value.
  */
  public void setE01FRDTEY(String newvalue)
  {
    fieldE01FRDTEY.setString(newvalue);
  }

  /**
  * Get value of field E01FRDTEY as a String.
  */
  public String getE01FRDTEY()
  {
    return fieldE01FRDTEY.getString();
  }

  /**
  * Set numeric field E01FRDTEY using a BigDecimal value.
  */
  public void setE01FRDTEY(BigDecimal newvalue)
  {
    fieldE01FRDTEY.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01FRDTEY as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01FRDTEY()
  {
    return fieldE01FRDTEY.getBigDecimal();
  }

  /**
  * Set field E01TODTEM using a String value.
  */
  public void setE01TODTEM(String newvalue)
  {
    fieldE01TODTEM.setString(newvalue);
  }

  /**
  * Get value of field E01TODTEM as a String.
  */
  public String getE01TODTEM()
  {
    return fieldE01TODTEM.getString();
  }

  /**
  * Set numeric field E01TODTEM using a BigDecimal value.
  */
  public void setE01TODTEM(BigDecimal newvalue)
  {
    fieldE01TODTEM.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01TODTEM as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01TODTEM()
  {
    return fieldE01TODTEM.getBigDecimal();
  }

  /**
  * Set field E01TODTED using a String value.
  */
  public void setE01TODTED(String newvalue)
  {
    fieldE01TODTED.setString(newvalue);
  }

  /**
  * Get value of field E01TODTED as a String.
  */
  public String getE01TODTED()
  {
    return fieldE01TODTED.getString();
  }

  /**
  * Set numeric field E01TODTED using a BigDecimal value.
  */
  public void setE01TODTED(BigDecimal newvalue)
  {
    fieldE01TODTED.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01TODTED as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01TODTED()
  {
    return fieldE01TODTED.getBigDecimal();
  }

  /**
  * Set field E01TODTEY using a String value.
  */
  public void setE01TODTEY(String newvalue)
  {
    fieldE01TODTEY.setString(newvalue);
  }

  /**
  * Get value of field E01TODTEY as a String.
  */
  public String getE01TODTEY()
  {
    return fieldE01TODTEY.getString();
  }

  /**
  * Set numeric field E01TODTEY using a BigDecimal value.
  */
  public void setE01TODTEY(BigDecimal newvalue)
  {
    fieldE01TODTEY.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01TODTEY as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01TODTEY()
  {
    return fieldE01TODTEY.getBigDecimal();
  }

  /**
  * Set field E01GLMATY using a String value.
  */
  public void setE01GLMATY(String newvalue)
  {
    fieldE01GLMATY.setString(newvalue);
  }

  /**
  * Get value of field E01GLMATY as a String.
  */
  public String getE01GLMATY()
  {
    return fieldE01GLMATY.getString();
  }

  /**
  * Set field E01DLSACC using a String value.
  */
  public void setE01DLSACC(String newvalue)
  {
    fieldE01DLSACC.setString(newvalue);
  }

  /**
  * Get value of field E01DLSACC as a String.
  */
  public String getE01DLSACC()
  {
    return fieldE01DLSACC.getString();
  }

  /**
  * Set numeric field E01DLSACC using a BigDecimal value.
  */
  public void setE01DLSACC(BigDecimal newvalue)
  {
    fieldE01DLSACC.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01DLSACC as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01DLSACC()
  {
    return fieldE01DLSACC.getBigDecimal();
  }

  /**
  * Set field E01DEACUN using a String value.
  */
  public void setE01DEACUN(String newvalue)
  {
    fieldE01DEACUN.setString(newvalue);
  }

  /**
  * Get value of field E01DEACUN as a String.
  */
  public String getE01DEACUN()
  {
    return fieldE01DEACUN.getString();
  }

  /**
  * Set numeric field E01DEACUN using a BigDecimal value.
  */
  public void setE01DEACUN(BigDecimal newvalue)
  {
    fieldE01DEACUN.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01DEACUN as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01DEACUN()
  {
    return fieldE01DEACUN.getBigDecimal();
  }

  /**
  * Set field E01CUSNA1 using a String value.
  */
  public void setE01CUSNA1(String newvalue)
  {
    fieldE01CUSNA1.setString(newvalue);
  }

  /**
  * Get value of field E01CUSNA1 as a String.
  */
  public String getE01CUSNA1()
  {
    return fieldE01CUSNA1.getString();
  }

  /**
  * Set field E01DATE1M using a String value.
  */
  public void setE01DATE1M(String newvalue)
  {
    fieldE01DATE1M.setString(newvalue);
  }

  /**
  * Get value of field E01DATE1M as a String.
  */
  public String getE01DATE1M()
  {
    return fieldE01DATE1M.getString();
  }

  /**
  * Set numeric field E01DATE1M using a BigDecimal value.
  */
  public void setE01DATE1M(BigDecimal newvalue)
  {
    fieldE01DATE1M.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01DATE1M as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01DATE1M()
  {
    return fieldE01DATE1M.getBigDecimal();
  }

  /**
  * Set field E01DATE1D using a String value.
  */
  public void setE01DATE1D(String newvalue)
  {
    fieldE01DATE1D.setString(newvalue);
  }

  /**
  * Get value of field E01DATE1D as a String.
  */
  public String getE01DATE1D()
  {
    return fieldE01DATE1D.getString();
  }

  /**
  * Set numeric field E01DATE1D using a BigDecimal value.
  */
  public void setE01DATE1D(BigDecimal newvalue)
  {
    fieldE01DATE1D.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01DATE1D as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01DATE1D()
  {
    return fieldE01DATE1D.getBigDecimal();
  }

  /**
  * Set field E01DATE1Y using a String value.
  */
  public void setE01DATE1Y(String newvalue)
  {
    fieldE01DATE1Y.setString(newvalue);
  }

  /**
  * Get value of field E01DATE1Y as a String.
  */
  public String getE01DATE1Y()
  {
    return fieldE01DATE1Y.getString();
  }

  /**
  * Set numeric field E01DATE1Y using a BigDecimal value.
  */
  public void setE01DATE1Y(BigDecimal newvalue)
  {
    fieldE01DATE1Y.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01DATE1Y as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01DATE1Y()
  {
    return fieldE01DATE1Y.getBigDecimal();
  }

  /**
  * Set field E01DATE2M using a String value.
  */
  public void setE01DATE2M(String newvalue)
  {
    fieldE01DATE2M.setString(newvalue);
  }

  /**
  * Get value of field E01DATE2M as a String.
  */
  public String getE01DATE2M()
  {
    return fieldE01DATE2M.getString();
  }

  /**
  * Set numeric field E01DATE2M using a BigDecimal value.
  */
  public void setE01DATE2M(BigDecimal newvalue)
  {
    fieldE01DATE2M.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01DATE2M as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01DATE2M()
  {
    return fieldE01DATE2M.getBigDecimal();
  }

  /**
  * Set field E01DATE2D using a String value.
  */
  public void setE01DATE2D(String newvalue)
  {
    fieldE01DATE2D.setString(newvalue);
  }

  /**
  * Get value of field E01DATE2D as a String.
  */
  public String getE01DATE2D()
  {
    return fieldE01DATE2D.getString();
  }

  /**
  * Set numeric field E01DATE2D using a BigDecimal value.
  */
  public void setE01DATE2D(BigDecimal newvalue)
  {
    fieldE01DATE2D.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01DATE2D as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01DATE2D()
  {
    return fieldE01DATE2D.getBigDecimal();
  }

  /**
  * Set field E01DATE2Y using a String value.
  */
  public void setE01DATE2Y(String newvalue)
  {
    fieldE01DATE2Y.setString(newvalue);
  }

  /**
  * Get value of field E01DATE2Y as a String.
  */
  public String getE01DATE2Y()
  {
    return fieldE01DATE2Y.getString();
  }

  /**
  * Set numeric field E01DATE2Y using a BigDecimal value.
  */
  public void setE01DATE2Y(BigDecimal newvalue)
  {
    fieldE01DATE2Y.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01DATE2Y as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01DATE2Y()
  {
    return fieldE01DATE2Y.getBigDecimal();
  }

  /**
  * Set field E01DLSSTS using a String value.
  */
  public void setE01DLSSTS(String newvalue)
  {
    fieldE01DLSSTS.setString(newvalue);
  }

  /**
  * Get value of field E01DLSSTS as a String.
  */
  public String getE01DLSSTS()
  {
    return fieldE01DLSSTS.getString();
  }

  /**
  * Set field E01DLSPFL using a String value.
  */
  public void setE01DLSPFL(String newvalue)
  {
    fieldE01DLSPFL.setString(newvalue);
  }

  /**
  * Get value of field E01DLSPFL as a String.
  */
  public String getE01DLSPFL()
  {
    return fieldE01DLSPFL.getString();
  }

  /**
  * Set field E01DLSAMT using a String value.
  */
  public void setE01DLSAMT(String newvalue)
  {
    fieldE01DLSAMT.setString(newvalue);
  }

  /**
  * Get value of field E01DLSAMT as a String.
  */
  public String getE01DLSAMT()
  {
    return fieldE01DLSAMT.getString();
  }

  /**
  * Set numeric field E01DLSAMT using a BigDecimal value.
  */
  public void setE01DLSAMT(BigDecimal newvalue)
  {
    fieldE01DLSAMT.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01DLSAMT as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01DLSAMT()
  {
    return fieldE01DLSAMT.getBigDecimal();
  }

  /**
  * Set field E01DLSPAD using a String value.
  */
  public void setE01DLSPAD(String newvalue)
  {
    fieldE01DLSPAD.setString(newvalue);
  }

  /**
  * Get value of field E01DLSPAD as a String.
  */
  public String getE01DLSPAD()
  {
    return fieldE01DLSPAD.getString();
  }

  /**
  * Set numeric field E01DLSPAD using a BigDecimal value.
  */
  public void setE01DLSPAD(BigDecimal newvalue)
  {
    fieldE01DLSPAD.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01DLSPAD as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01DLSPAD()
  {
    return fieldE01DLSPAD.getBigDecimal();
  }

  /**
  * Set field E01LIMMTH using a String value.
  */
  public void setE01LIMMTH(String newvalue)
  {
    fieldE01LIMMTH.setString(newvalue);
  }

  /**
  * Get value of field E01LIMMTH as a String.
  */
  public String getE01LIMMTH()
  {
    return fieldE01LIMMTH.getString();
  }

  /**
  * Set numeric field E01LIMMTH using a BigDecimal value.
  */
  public void setE01LIMMTH(BigDecimal newvalue)
  {
    fieldE01LIMMTH.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01LIMMTH as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01LIMMTH()
  {
    return fieldE01LIMMTH.getBigDecimal();
  }

  /**
  * Set field E01LIMYTD using a String value.
  */
  public void setE01LIMYTD(String newvalue)
  {
    fieldE01LIMYTD.setString(newvalue);
  }

  /**
  * Get value of field E01LIMYTD as a String.
  */
  public String getE01LIMYTD()
  {
    return fieldE01LIMYTD.getString();
  }

  /**
  * Set numeric field E01LIMYTD using a BigDecimal value.
  */
  public void setE01LIMYTD(BigDecimal newvalue)
  {
    fieldE01LIMYTD.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01LIMYTD as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01LIMYTD()
  {
    return fieldE01LIMYTD.getBigDecimal();
  }

  /**
  * Set field E01DEAOAM using a String value.
  */
  public void setE01DEAOAM(String newvalue)
  {
    fieldE01DEAOAM.setString(newvalue);
  }

  /**
  * Get value of field E01DEAOAM as a String.
  */
  public String getE01DEAOAM()
  {
    return fieldE01DEAOAM.getString();
  }

  /**
  * Set numeric field E01DEAOAM using a BigDecimal value.
  */
  public void setE01DEAOAM(BigDecimal newvalue)
  {
    fieldE01DEAOAM.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01DEAOAM as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01DEAOAM()
  {
    return fieldE01DEAOAM.getBigDecimal();
  }

  /**
  * Set field E01DEAIDG using a String value.
  */
  public void setE01DEAIDG(String newvalue)
  {
    fieldE01DEAIDG.setString(newvalue);
  }

  /**
  * Get value of field E01DEAIDG as a String.
  */
  public String getE01DEAIDG()
  {
    return fieldE01DEAIDG.getString();
  }

  /**
  * Set numeric field E01DEAIDG using a BigDecimal value.
  */
  public void setE01DEAIDG(BigDecimal newvalue)
  {
    fieldE01DEAIDG.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01DEAIDG as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01DEAIDG()
  {
    return fieldE01DEAIDG.getBigDecimal();
  }

  /**
  * Set field E01DLPPNU using a String value.
  */
  public void setE01DLPPNU(String newvalue)
  {
    fieldE01DLPPNU.setString(newvalue);
  }

  /**
  * Get value of field E01DLPPNU as a String.
  */
  public String getE01DLPPNU()
  {
    return fieldE01DLPPNU.getString();
  }

  /**
  * Set numeric field E01DLPPNU using a BigDecimal value.
  */
  public void setE01DLPPNU(BigDecimal newvalue)
  {
    fieldE01DLPPNU.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01DLPPNU as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01DLPPNU()
  {
    return fieldE01DLPPNU.getBigDecimal();
  }

  /**
  * Set field E01DLSCDE using a String value.
  */
  public void setE01DLSCDE(String newvalue)
  {
    fieldE01DLSCDE.setString(newvalue);
  }

  /**
  * Get value of field E01DLSCDE as a String.
  */
  public String getE01DLSCDE()
  {
    return fieldE01DLSCDE.getString();
  }

  /**
  * Set field E01DLSSEQ using a String value.
  */
  public void setE01DLSSEQ(String newvalue)
  {
    fieldE01DLSSEQ.setString(newvalue);
  }

  /**
  * Get value of field E01DLSSEQ as a String.
  */
  public String getE01DLSSEQ()
  {
    return fieldE01DLSSEQ.getString();
  }

  /**
  * Set numeric field E01DLSSEQ using a BigDecimal value.
  */
  public void setE01DLSSEQ(BigDecimal newvalue)
  {
    fieldE01DLSSEQ.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01DLSSEQ as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01DLSSEQ()
  {
    return fieldE01DLSSEQ.getBigDecimal();
  }

  /**
  * Set field E01DLSOBK using a String value.
  */
  public void setE01DLSOBK(String newvalue)
  {
    fieldE01DLSOBK.setString(newvalue);
  }

  /**
  * Get value of field E01DLSOBK as a String.
  */
  public String getE01DLSOBK()
  {
    return fieldE01DLSOBK.getString();
  }

  /**
  * Set field E01DLSOBR using a String value.
  */
  public void setE01DLSOBR(String newvalue)
  {
    fieldE01DLSOBR.setString(newvalue);
  }

  /**
  * Get value of field E01DLSOBR as a String.
  */
  public String getE01DLSOBR()
  {
    return fieldE01DLSOBR.getString();
  }

  /**
  * Set numeric field E01DLSOBR using a BigDecimal value.
  */
  public void setE01DLSOBR(BigDecimal newvalue)
  {
    fieldE01DLSOBR.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01DLSOBR as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01DLSOBR()
  {
    return fieldE01DLSOBR.getBigDecimal();
  }

  /**
  * Set field E01DLSOCY using a String value.
  */
  public void setE01DLSOCY(String newvalue)
  {
    fieldE01DLSOCY.setString(newvalue);
  }

  /**
  * Get value of field E01DLSOCY as a String.
  */
  public String getE01DLSOCY()
  {
    return fieldE01DLSOCY.getString();
  }

  /**
  * Set field E01DLSOGL using a String value.
  */
  public void setE01DLSOGL(String newvalue)
  {
    fieldE01DLSOGL.setString(newvalue);
  }

  /**
  * Get value of field E01DLSOGL as a String.
  */
  public String getE01DLSOGL()
  {
    return fieldE01DLSOGL.getString();
  }

  /**
  * Set numeric field E01DLSOGL using a BigDecimal value.
  */
  public void setE01DLSOGL(BigDecimal newvalue)
  {
    fieldE01DLSOGL.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01DLSOGL as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01DLSOGL()
  {
    return fieldE01DLSOGL.getBigDecimal();
  }

  /**
  * Set field E01ROCSP1 using a String value.
  */
  public void setE01ROCSP1(String newvalue)
  {
    fieldE01ROCSP1.setString(newvalue);
  }

  /**
  * Get value of field E01ROCSP1 as a String.
  */
  public String getE01ROCSP1()
  {
    return fieldE01ROCSP1.getString();
  }

  /**
  * Set field E01ROCSP2 using a String value.
  */
  public void setE01ROCSP2(String newvalue)
  {
    fieldE01ROCSP2.setString(newvalue);
  }

  /**
  * Get value of field E01ROCSP2 as a String.
  */
  public String getE01ROCSP2()
  {
    return fieldE01ROCSP2.getString();
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
