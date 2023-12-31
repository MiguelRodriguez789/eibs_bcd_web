package datapro.eibs.beans;

import datapro.eibs.sockets.*;
import java.io.*;
import java.math.*;

import java.util.*;

/**
* Class generated by AS/400 CRTCLASS command from EMB001002 physical file definition.
* 
* File level identifier is 1180208132006.
* Record format level identifier is 2B4AE8D08B213.
*/

public class EMB001002Message extends MessageRecord
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
                                     "E02EMDCUN",
                                     "E02EMDNUM",
                                     "E02EMDACC",
                                     "E02EMDATY",
                                     "E02EMDPRO",
                                     "E02EMDOPM",
                                     "E02EMDOPD",
                                     "E02EMDOPY",
                                     "E02EMDHDM",
                                     "E02EMDHDD",
                                     "E02EMDHDY",
                                     "E02EMDHDT",
                                     "E02EMDLDM",
                                     "E02EMDLDD",
                                     "E02EMDLDY",
                                     "E02EMDLDT",
                                     "E02EMDAM1",
                                     "E02EMDAM2",
                                     "E02EMDTIT",
                                     "E02EMDPTI",
                                     "E02EMDAM3",
                                     "E02EMDOPE",
                                     "E02EMDAM4",
                                     "D02CUN",
                                     "D02COU",
                                     "D02TSE",
                                     "D02ATY",
                                     "D02PRO",
                                     "E02EMDUSH",
                                     "E02EMDUSR",
                                     "E02EMDUSA",
                                     "E02EMDCUS",
                                     "E02EMDCDM",
                                     "E02EMDCDD",
                                     "E02EMDCDY",
                                     "E02EMDCTM",
                                     "E02EMDLUM",
                                     "E02EMDLUD",
                                     "E02EMDLUY",
                                     "E02EMDLUT",
                                     "E02EMDLUU",
                                     "E02NUMREC",
                                     "E02INDOPE"
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
                                   "E02EMDCUN",
                                   "E02EMDNUM",
                                   "E02EMDACC",
                                   "E02EMDATY",
                                   "E02EMDPRO",
                                   "E02EMDOPM",
                                   "E02EMDOPD",
                                   "E02EMDOPY",
                                   "E02EMDHDM",
                                   "E02EMDHDD",
                                   "E02EMDHDY",
                                   "E02EMDHDT",
                                   "E02EMDLDM",
                                   "E02EMDLDD",
                                   "E02EMDLDY",
                                   "E02EMDLDT",
                                   "E02EMDAM1",
                                   "E02EMDAM2",
                                   "E02EMDTIT",
                                   "E02EMDPTI",
                                   "E02EMDAM3",
                                   "E02EMDOPE",
                                   "E02EMDAM4",
                                   "D02CUN",
                                   "D02COU",
                                   "D02TSE",
                                   "D02ATY",
                                   "D02PRO",
                                   "E02EMDUSH",
                                   "E02EMDUSR",
                                   "E02EMDUSA",
                                   "E02EMDCUS",
                                   "E02EMDCDM",
                                   "E02EMDCDD",
                                   "E02EMDCDY",
                                   "E02EMDCTM",
                                   "E02EMDLUM",
                                   "E02EMDLUD",
                                   "E02EMDLUY",
                                   "E02EMDLUT",
                                   "E02EMDLUU",
                                   "E02NUMREC",
                                   "E02INDOPE"
                                 };
  final static String fid = "1180208132006";
  final static String rid = "2B4AE8D08B213";
  final static String fmtname = "EMB001002";
  final int FIELDCOUNT = 52;
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
  private DecimalField fieldE02EMDCUN = null;
  private DecimalField fieldE02EMDNUM = null;
  private DecimalField fieldE02EMDACC = null;
  private CharacterField fieldE02EMDATY = null;
  private CharacterField fieldE02EMDPRO = null;
  private DecimalField fieldE02EMDOPM = null;
  private DecimalField fieldE02EMDOPD = null;
  private DecimalField fieldE02EMDOPY = null;
  private DecimalField fieldE02EMDHDM = null;
  private DecimalField fieldE02EMDHDD = null;
  private DecimalField fieldE02EMDHDY = null;
  private DecimalField fieldE02EMDHDT = null;
  private DecimalField fieldE02EMDLDM = null;
  private DecimalField fieldE02EMDLDD = null;
  private DecimalField fieldE02EMDLDY = null;
  private DecimalField fieldE02EMDLDT = null;
  private DecimalField fieldE02EMDAM1 = null;
  private DecimalField fieldE02EMDAM2 = null;
  private CharacterField fieldE02EMDTIT = null;
  private DecimalField fieldE02EMDPTI = null;
  private DecimalField fieldE02EMDAM3 = null;
  private CharacterField fieldE02EMDOPE = null;
  private DecimalField fieldE02EMDAM4 = null;
  private CharacterField fieldD02CUN = null;
  private CharacterField fieldD02COU = null;
  private CharacterField fieldD02TSE = null;
  private CharacterField fieldD02ATY = null;
  private CharacterField fieldD02PRO = null;
  private CharacterField fieldE02EMDUSH = null;
  private CharacterField fieldE02EMDUSR = null;
  private CharacterField fieldE02EMDUSA = null;
  private CharacterField fieldE02EMDCUS = null;
  private DecimalField fieldE02EMDCDM = null;
  private DecimalField fieldE02EMDCDD = null;
  private DecimalField fieldE02EMDCDY = null;
  private CharacterField fieldE02EMDCTM = null;
  private DecimalField fieldE02EMDLUM = null;
  private DecimalField fieldE02EMDLUD = null;
  private DecimalField fieldE02EMDLUY = null;
  private CharacterField fieldE02EMDLUT = null;
  private CharacterField fieldE02EMDLUU = null;
  private DecimalField fieldE02NUMREC = null;
  private CharacterField fieldE02INDOPE = null;

  /**
  * Constructor for EMB001002Message.
  */
  public EMB001002Message()
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
    recordsize = 569;
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
    fields[9] = fieldE02EMDCUN =
    new DecimalField(message, HEADERSIZE + 42, 10, 0, "E02EMDCUN");
    fields[10] = fieldE02EMDNUM =
    new DecimalField(message, HEADERSIZE + 52, 13, 0, "E02EMDNUM");
    fields[11] = fieldE02EMDACC =
    new DecimalField(message, HEADERSIZE + 65, 13, 0, "E02EMDACC");
    fields[12] = fieldE02EMDATY =
    new CharacterField(message, HEADERSIZE + 78, 4, "E02EMDATY");
    fields[13] = fieldE02EMDPRO =
    new CharacterField(message, HEADERSIZE + 82, 4, "E02EMDPRO");
    fields[14] = fieldE02EMDOPM =
    new DecimalField(message, HEADERSIZE + 86, 3, 0, "E02EMDOPM");
    fields[15] = fieldE02EMDOPD =
    new DecimalField(message, HEADERSIZE + 89, 3, 0, "E02EMDOPD");
    fields[16] = fieldE02EMDOPY =
    new DecimalField(message, HEADERSIZE + 92, 5, 0, "E02EMDOPY");
    fields[17] = fieldE02EMDHDM =
    new DecimalField(message, HEADERSIZE + 97, 3, 0, "E02EMDHDM");
    fields[18] = fieldE02EMDHDD =
    new DecimalField(message, HEADERSIZE + 100, 3, 0, "E02EMDHDD");
    fields[19] = fieldE02EMDHDY =
    new DecimalField(message, HEADERSIZE + 103, 5, 0, "E02EMDHDY");
    fields[20] = fieldE02EMDHDT =
    new DecimalField(message, HEADERSIZE + 108, 7, 0, "E02EMDHDT");
    fields[21] = fieldE02EMDLDM =
    new DecimalField(message, HEADERSIZE + 115, 3, 0, "E02EMDLDM");
    fields[22] = fieldE02EMDLDD =
    new DecimalField(message, HEADERSIZE + 118, 3, 0, "E02EMDLDD");
    fields[23] = fieldE02EMDLDY =
    new DecimalField(message, HEADERSIZE + 121, 5, 0, "E02EMDLDY");
    fields[24] = fieldE02EMDLDT =
    new DecimalField(message, HEADERSIZE + 126, 7, 0, "E02EMDLDT");
    fields[25] = fieldE02EMDAM1 =
    new DecimalField(message, HEADERSIZE + 133, 17, 2, "E02EMDAM1");
    fields[26] = fieldE02EMDAM2 =
    new DecimalField(message, HEADERSIZE + 150, 17, 2, "E02EMDAM2");
    fields[27] = fieldE02EMDTIT =
    new CharacterField(message, HEADERSIZE + 167, 1, "E02EMDTIT");
    fields[28] = fieldE02EMDPTI =
    new DecimalField(message, HEADERSIZE + 168, 8, 3, "E02EMDPTI");
    fields[29] = fieldE02EMDAM3 =
    new DecimalField(message, HEADERSIZE + 176, 17, 2, "E02EMDAM3");
    fields[30] = fieldE02EMDOPE =
    new CharacterField(message, HEADERSIZE + 193, 1, "E02EMDOPE");
    fields[31] = fieldE02EMDAM4 =
    new DecimalField(message, HEADERSIZE + 194, 17, 2, "E02EMDAM4");
    fields[32] = fieldD02CUN =
    new CharacterField(message, HEADERSIZE + 211, 45, "D02CUN");
    fields[33] = fieldD02COU =
    new CharacterField(message, HEADERSIZE + 256, 45, "D02COU");
    fields[34] = fieldD02TSE =
    new CharacterField(message, HEADERSIZE + 301, 45, "D02TSE");
    fields[35] = fieldD02ATY =
    new CharacterField(message, HEADERSIZE + 346, 45, "D02ATY");
    fields[36] = fieldD02PRO =
    new CharacterField(message, HEADERSIZE + 391, 45, "D02PRO");
    fields[37] = fieldE02EMDUSH =
    new CharacterField(message, HEADERSIZE + 436, 10, "E02EMDUSH");
    fields[38] = fieldE02EMDUSR =
    new CharacterField(message, HEADERSIZE + 446, 10, "E02EMDUSR");
    fields[39] = fieldE02EMDUSA =
    new CharacterField(message, HEADERSIZE + 456, 10, "E02EMDUSA");
    fields[40] = fieldE02EMDCUS =
    new CharacterField(message, HEADERSIZE + 466, 10, "E02EMDCUS");
    fields[41] = fieldE02EMDCDM =
    new DecimalField(message, HEADERSIZE + 476, 3, 0, "E02EMDCDM");
    fields[42] = fieldE02EMDCDD =
    new DecimalField(message, HEADERSIZE + 479, 3, 0, "E02EMDCDD");
    fields[43] = fieldE02EMDCDY =
    new DecimalField(message, HEADERSIZE + 482, 5, 0, "E02EMDCDY");
    fields[44] = fieldE02EMDCTM =
    new CharacterField(message, HEADERSIZE + 487, 26, "E02EMDCTM");
    fields[45] = fieldE02EMDLUM =
    new DecimalField(message, HEADERSIZE + 513, 3, 0, "E02EMDLUM");
    fields[46] = fieldE02EMDLUD =
    new DecimalField(message, HEADERSIZE + 516, 3, 0, "E02EMDLUD");
    fields[47] = fieldE02EMDLUY =
    new DecimalField(message, HEADERSIZE + 519, 5, 0, "E02EMDLUY");
    fields[48] = fieldE02EMDLUT =
    new CharacterField(message, HEADERSIZE + 524, 26, "E02EMDLUT");
    fields[49] = fieldE02EMDLUU =
    new CharacterField(message, HEADERSIZE + 550, 10, "E02EMDLUU");
    fields[50] = fieldE02NUMREC =
    new DecimalField(message, HEADERSIZE + 560, 8, 0, "E02NUMREC");
    fields[51] = fieldE02INDOPE =
    new CharacterField(message, HEADERSIZE + 568, 1, "E02INDOPE");

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
  * Set field E02EMDCUN using a String value.
  */
  public void setE02EMDCUN(String newvalue)
  {
    fieldE02EMDCUN.setString(newvalue);
  }

  /**
  * Get value of field E02EMDCUN as a String.
  */
  public String getE02EMDCUN()
  {
    return fieldE02EMDCUN.getString();
  }

  /**
  * Set numeric field E02EMDCUN using a BigDecimal value.
  */
  public void setE02EMDCUN(BigDecimal newvalue)
  {
    fieldE02EMDCUN.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02EMDCUN as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02EMDCUN()
  {
    return fieldE02EMDCUN.getBigDecimal();
  }

  /**
  * Set field E02EMDNUM using a String value.
  */
  public void setE02EMDNUM(String newvalue)
  {
    fieldE02EMDNUM.setString(newvalue);
  }

  /**
  * Get value of field E02EMDNUM as a String.
  */
  public String getE02EMDNUM()
  {
    return fieldE02EMDNUM.getString();
  }

  /**
  * Set numeric field E02EMDNUM using a BigDecimal value.
  */
  public void setE02EMDNUM(BigDecimal newvalue)
  {
    fieldE02EMDNUM.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02EMDNUM as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02EMDNUM()
  {
    return fieldE02EMDNUM.getBigDecimal();
  }

  /**
  * Set field E02EMDACC using a String value.
  */
  public void setE02EMDACC(String newvalue)
  {
    fieldE02EMDACC.setString(newvalue);
  }

  /**
  * Get value of field E02EMDACC as a String.
  */
  public String getE02EMDACC()
  {
    return fieldE02EMDACC.getString();
  }

  /**
  * Set numeric field E02EMDACC using a BigDecimal value.
  */
  public void setE02EMDACC(BigDecimal newvalue)
  {
    fieldE02EMDACC.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02EMDACC as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02EMDACC()
  {
    return fieldE02EMDACC.getBigDecimal();
  }

  /**
  * Set field E02EMDATY using a String value.
  */
  public void setE02EMDATY(String newvalue)
  {
    fieldE02EMDATY.setString(newvalue);
  }

  /**
  * Get value of field E02EMDATY as a String.
  */
  public String getE02EMDATY()
  {
    return fieldE02EMDATY.getString();
  }

  /**
  * Set field E02EMDPRO using a String value.
  */
  public void setE02EMDPRO(String newvalue)
  {
    fieldE02EMDPRO.setString(newvalue);
  }

  /**
  * Get value of field E02EMDPRO as a String.
  */
  public String getE02EMDPRO()
  {
    return fieldE02EMDPRO.getString();
  }

  /**
  * Set field E02EMDOPM using a String value.
  */
  public void setE02EMDOPM(String newvalue)
  {
    fieldE02EMDOPM.setString(newvalue);
  }

  /**
  * Get value of field E02EMDOPM as a String.
  */
  public String getE02EMDOPM()
  {
    return fieldE02EMDOPM.getString();
  }

  /**
  * Set numeric field E02EMDOPM using a BigDecimal value.
  */
  public void setE02EMDOPM(BigDecimal newvalue)
  {
    fieldE02EMDOPM.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02EMDOPM as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02EMDOPM()
  {
    return fieldE02EMDOPM.getBigDecimal();
  }

  /**
  * Set field E02EMDOPD using a String value.
  */
  public void setE02EMDOPD(String newvalue)
  {
    fieldE02EMDOPD.setString(newvalue);
  }

  /**
  * Get value of field E02EMDOPD as a String.
  */
  public String getE02EMDOPD()
  {
    return fieldE02EMDOPD.getString();
  }

  /**
  * Set numeric field E02EMDOPD using a BigDecimal value.
  */
  public void setE02EMDOPD(BigDecimal newvalue)
  {
    fieldE02EMDOPD.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02EMDOPD as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02EMDOPD()
  {
    return fieldE02EMDOPD.getBigDecimal();
  }

  /**
  * Set field E02EMDOPY using a String value.
  */
  public void setE02EMDOPY(String newvalue)
  {
    fieldE02EMDOPY.setString(newvalue);
  }

  /**
  * Get value of field E02EMDOPY as a String.
  */
  public String getE02EMDOPY()
  {
    return fieldE02EMDOPY.getString();
  }

  /**
  * Set numeric field E02EMDOPY using a BigDecimal value.
  */
  public void setE02EMDOPY(BigDecimal newvalue)
  {
    fieldE02EMDOPY.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02EMDOPY as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02EMDOPY()
  {
    return fieldE02EMDOPY.getBigDecimal();
  }

  /**
  * Set field E02EMDHDM using a String value.
  */
  public void setE02EMDHDM(String newvalue)
  {
    fieldE02EMDHDM.setString(newvalue);
  }

  /**
  * Get value of field E02EMDHDM as a String.
  */
  public String getE02EMDHDM()
  {
    return fieldE02EMDHDM.getString();
  }

  /**
  * Set numeric field E02EMDHDM using a BigDecimal value.
  */
  public void setE02EMDHDM(BigDecimal newvalue)
  {
    fieldE02EMDHDM.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02EMDHDM as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02EMDHDM()
  {
    return fieldE02EMDHDM.getBigDecimal();
  }

  /**
  * Set field E02EMDHDD using a String value.
  */
  public void setE02EMDHDD(String newvalue)
  {
    fieldE02EMDHDD.setString(newvalue);
  }

  /**
  * Get value of field E02EMDHDD as a String.
  */
  public String getE02EMDHDD()
  {
    return fieldE02EMDHDD.getString();
  }

  /**
  * Set numeric field E02EMDHDD using a BigDecimal value.
  */
  public void setE02EMDHDD(BigDecimal newvalue)
  {
    fieldE02EMDHDD.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02EMDHDD as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02EMDHDD()
  {
    return fieldE02EMDHDD.getBigDecimal();
  }

  /**
  * Set field E02EMDHDY using a String value.
  */
  public void setE02EMDHDY(String newvalue)
  {
    fieldE02EMDHDY.setString(newvalue);
  }

  /**
  * Get value of field E02EMDHDY as a String.
  */
  public String getE02EMDHDY()
  {
    return fieldE02EMDHDY.getString();
  }

  /**
  * Set numeric field E02EMDHDY using a BigDecimal value.
  */
  public void setE02EMDHDY(BigDecimal newvalue)
  {
    fieldE02EMDHDY.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02EMDHDY as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02EMDHDY()
  {
    return fieldE02EMDHDY.getBigDecimal();
  }

  /**
  * Set field E02EMDHDT using a String value.
  */
  public void setE02EMDHDT(String newvalue)
  {
    fieldE02EMDHDT.setString(newvalue);
  }

  /**
  * Get value of field E02EMDHDT as a String.
  */
  public String getE02EMDHDT()
  {
    return fieldE02EMDHDT.getString();
  }

  /**
  * Set numeric field E02EMDHDT using a BigDecimal value.
  */
  public void setE02EMDHDT(BigDecimal newvalue)
  {
    fieldE02EMDHDT.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02EMDHDT as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02EMDHDT()
  {
    return fieldE02EMDHDT.getBigDecimal();
  }

  /**
  * Set field E02EMDLDM using a String value.
  */
  public void setE02EMDLDM(String newvalue)
  {
    fieldE02EMDLDM.setString(newvalue);
  }

  /**
  * Get value of field E02EMDLDM as a String.
  */
  public String getE02EMDLDM()
  {
    return fieldE02EMDLDM.getString();
  }

  /**
  * Set numeric field E02EMDLDM using a BigDecimal value.
  */
  public void setE02EMDLDM(BigDecimal newvalue)
  {
    fieldE02EMDLDM.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02EMDLDM as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02EMDLDM()
  {
    return fieldE02EMDLDM.getBigDecimal();
  }

  /**
  * Set field E02EMDLDD using a String value.
  */
  public void setE02EMDLDD(String newvalue)
  {
    fieldE02EMDLDD.setString(newvalue);
  }

  /**
  * Get value of field E02EMDLDD as a String.
  */
  public String getE02EMDLDD()
  {
    return fieldE02EMDLDD.getString();
  }

  /**
  * Set numeric field E02EMDLDD using a BigDecimal value.
  */
  public void setE02EMDLDD(BigDecimal newvalue)
  {
    fieldE02EMDLDD.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02EMDLDD as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02EMDLDD()
  {
    return fieldE02EMDLDD.getBigDecimal();
  }

  /**
  * Set field E02EMDLDY using a String value.
  */
  public void setE02EMDLDY(String newvalue)
  {
    fieldE02EMDLDY.setString(newvalue);
  }

  /**
  * Get value of field E02EMDLDY as a String.
  */
  public String getE02EMDLDY()
  {
    return fieldE02EMDLDY.getString();
  }

  /**
  * Set numeric field E02EMDLDY using a BigDecimal value.
  */
  public void setE02EMDLDY(BigDecimal newvalue)
  {
    fieldE02EMDLDY.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02EMDLDY as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02EMDLDY()
  {
    return fieldE02EMDLDY.getBigDecimal();
  }

  /**
  * Set field E02EMDLDT using a String value.
  */
  public void setE02EMDLDT(String newvalue)
  {
    fieldE02EMDLDT.setString(newvalue);
  }

  /**
  * Get value of field E02EMDLDT as a String.
  */
  public String getE02EMDLDT()
  {
    return fieldE02EMDLDT.getString();
  }

  /**
  * Set numeric field E02EMDLDT using a BigDecimal value.
  */
  public void setE02EMDLDT(BigDecimal newvalue)
  {
    fieldE02EMDLDT.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02EMDLDT as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02EMDLDT()
  {
    return fieldE02EMDLDT.getBigDecimal();
  }

  /**
  * Set field E02EMDAM1 using a String value.
  */
  public void setE02EMDAM1(String newvalue)
  {
    fieldE02EMDAM1.setString(newvalue);
  }

  /**
  * Get value of field E02EMDAM1 as a String.
  */
  public String getE02EMDAM1()
  {
    return fieldE02EMDAM1.getString();
  }

  /**
  * Set numeric field E02EMDAM1 using a BigDecimal value.
  */
  public void setE02EMDAM1(BigDecimal newvalue)
  {
    fieldE02EMDAM1.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02EMDAM1 as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02EMDAM1()
  {
    return fieldE02EMDAM1.getBigDecimal();
  }

  /**
  * Set field E02EMDAM2 using a String value.
  */
  public void setE02EMDAM2(String newvalue)
  {
    fieldE02EMDAM2.setString(newvalue);
  }

  /**
  * Get value of field E02EMDAM2 as a String.
  */
  public String getE02EMDAM2()
  {
    return fieldE02EMDAM2.getString();
  }

  /**
  * Set numeric field E02EMDAM2 using a BigDecimal value.
  */
  public void setE02EMDAM2(BigDecimal newvalue)
  {
    fieldE02EMDAM2.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02EMDAM2 as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02EMDAM2()
  {
    return fieldE02EMDAM2.getBigDecimal();
  }

  /**
  * Set field E02EMDTIT using a String value.
  */
  public void setE02EMDTIT(String newvalue)
  {
    fieldE02EMDTIT.setString(newvalue);
  }

  /**
  * Get value of field E02EMDTIT as a String.
  */
  public String getE02EMDTIT()
  {
    return fieldE02EMDTIT.getString();
  }

  /**
  * Set field E02EMDPTI using a String value.
  */
  public void setE02EMDPTI(String newvalue)
  {
    fieldE02EMDPTI.setString(newvalue);
  }

  /**
  * Get value of field E02EMDPTI as a String.
  */
  public String getE02EMDPTI()
  {
    return fieldE02EMDPTI.getString();
  }

  /**
  * Set numeric field E02EMDPTI using a BigDecimal value.
  */
  public void setE02EMDPTI(BigDecimal newvalue)
  {
    fieldE02EMDPTI.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02EMDPTI as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02EMDPTI()
  {
    return fieldE02EMDPTI.getBigDecimal();
  }

  /**
  * Set field E02EMDAM3 using a String value.
  */
  public void setE02EMDAM3(String newvalue)
  {
    fieldE02EMDAM3.setString(newvalue);
  }

  /**
  * Get value of field E02EMDAM3 as a String.
  */
  public String getE02EMDAM3()
  {
    return fieldE02EMDAM3.getString();
  }

  /**
  * Set numeric field E02EMDAM3 using a BigDecimal value.
  */
  public void setE02EMDAM3(BigDecimal newvalue)
  {
    fieldE02EMDAM3.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02EMDAM3 as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02EMDAM3()
  {
    return fieldE02EMDAM3.getBigDecimal();
  }

  /**
  * Set field E02EMDOPE using a String value.
  */
  public void setE02EMDOPE(String newvalue)
  {
    fieldE02EMDOPE.setString(newvalue);
  }

  /**
  * Get value of field E02EMDOPE as a String.
  */
  public String getE02EMDOPE()
  {
    return fieldE02EMDOPE.getString();
  }

  /**
  * Set field E02EMDAM4 using a String value.
  */
  public void setE02EMDAM4(String newvalue)
  {
    fieldE02EMDAM4.setString(newvalue);
  }

  /**
  * Get value of field E02EMDAM4 as a String.
  */
  public String getE02EMDAM4()
  {
    return fieldE02EMDAM4.getString();
  }

  /**
  * Set numeric field E02EMDAM4 using a BigDecimal value.
  */
  public void setE02EMDAM4(BigDecimal newvalue)
  {
    fieldE02EMDAM4.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02EMDAM4 as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02EMDAM4()
  {
    return fieldE02EMDAM4.getBigDecimal();
  }

  /**
  * Set field D02CUN using a String value.
  */
  public void setD02CUN(String newvalue)
  {
    fieldD02CUN.setString(newvalue);
  }

  /**
  * Get value of field D02CUN as a String.
  */
  public String getD02CUN()
  {
    return fieldD02CUN.getString();
  }

  /**
  * Set field D02COU using a String value.
  */
  public void setD02COU(String newvalue)
  {
    fieldD02COU.setString(newvalue);
  }

  /**
  * Get value of field D02COU as a String.
  */
  public String getD02COU()
  {
    return fieldD02COU.getString();
  }

  /**
  * Set field D02TSE using a String value.
  */
  public void setD02TSE(String newvalue)
  {
    fieldD02TSE.setString(newvalue);
  }

  /**
  * Get value of field D02TSE as a String.
  */
  public String getD02TSE()
  {
    return fieldD02TSE.getString();
  }

  /**
  * Set field D02ATY using a String value.
  */
  public void setD02ATY(String newvalue)
  {
    fieldD02ATY.setString(newvalue);
  }

  /**
  * Get value of field D02ATY as a String.
  */
  public String getD02ATY()
  {
    return fieldD02ATY.getString();
  }

  /**
  * Set field D02PRO using a String value.
  */
  public void setD02PRO(String newvalue)
  {
    fieldD02PRO.setString(newvalue);
  }

  /**
  * Get value of field D02PRO as a String.
  */
  public String getD02PRO()
  {
    return fieldD02PRO.getString();
  }

  /**
  * Set field E02EMDUSH using a String value.
  */
  public void setE02EMDUSH(String newvalue)
  {
    fieldE02EMDUSH.setString(newvalue);
  }

  /**
  * Get value of field E02EMDUSH as a String.
  */
  public String getE02EMDUSH()
  {
    return fieldE02EMDUSH.getString();
  }

  /**
  * Set field E02EMDUSR using a String value.
  */
  public void setE02EMDUSR(String newvalue)
  {
    fieldE02EMDUSR.setString(newvalue);
  }

  /**
  * Get value of field E02EMDUSR as a String.
  */
  public String getE02EMDUSR()
  {
    return fieldE02EMDUSR.getString();
  }

  /**
  * Set field E02EMDUSA using a String value.
  */
  public void setE02EMDUSA(String newvalue)
  {
    fieldE02EMDUSA.setString(newvalue);
  }

  /**
  * Get value of field E02EMDUSA as a String.
  */
  public String getE02EMDUSA()
  {
    return fieldE02EMDUSA.getString();
  }

  /**
  * Set field E02EMDCUS using a String value.
  */
  public void setE02EMDCUS(String newvalue)
  {
    fieldE02EMDCUS.setString(newvalue);
  }

  /**
  * Get value of field E02EMDCUS as a String.
  */
  public String getE02EMDCUS()
  {
    return fieldE02EMDCUS.getString();
  }

  /**
  * Set field E02EMDCDM using a String value.
  */
  public void setE02EMDCDM(String newvalue)
  {
    fieldE02EMDCDM.setString(newvalue);
  }

  /**
  * Get value of field E02EMDCDM as a String.
  */
  public String getE02EMDCDM()
  {
    return fieldE02EMDCDM.getString();
  }

  /**
  * Set numeric field E02EMDCDM using a BigDecimal value.
  */
  public void setE02EMDCDM(BigDecimal newvalue)
  {
    fieldE02EMDCDM.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02EMDCDM as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02EMDCDM()
  {
    return fieldE02EMDCDM.getBigDecimal();
  }

  /**
  * Set field E02EMDCDD using a String value.
  */
  public void setE02EMDCDD(String newvalue)
  {
    fieldE02EMDCDD.setString(newvalue);
  }

  /**
  * Get value of field E02EMDCDD as a String.
  */
  public String getE02EMDCDD()
  {
    return fieldE02EMDCDD.getString();
  }

  /**
  * Set numeric field E02EMDCDD using a BigDecimal value.
  */
  public void setE02EMDCDD(BigDecimal newvalue)
  {
    fieldE02EMDCDD.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02EMDCDD as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02EMDCDD()
  {
    return fieldE02EMDCDD.getBigDecimal();
  }

  /**
  * Set field E02EMDCDY using a String value.
  */
  public void setE02EMDCDY(String newvalue)
  {
    fieldE02EMDCDY.setString(newvalue);
  }

  /**
  * Get value of field E02EMDCDY as a String.
  */
  public String getE02EMDCDY()
  {
    return fieldE02EMDCDY.getString();
  }

  /**
  * Set numeric field E02EMDCDY using a BigDecimal value.
  */
  public void setE02EMDCDY(BigDecimal newvalue)
  {
    fieldE02EMDCDY.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02EMDCDY as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02EMDCDY()
  {
    return fieldE02EMDCDY.getBigDecimal();
  }

  /**
  * Set field E02EMDCTM using a String value.
  */
  public void setE02EMDCTM(String newvalue)
  {
    fieldE02EMDCTM.setString(newvalue);
  }

  /**
  * Get value of field E02EMDCTM as a String.
  */
  public String getE02EMDCTM()
  {
    return fieldE02EMDCTM.getString();
  }

  /**
  * Set field E02EMDLUM using a String value.
  */
  public void setE02EMDLUM(String newvalue)
  {
    fieldE02EMDLUM.setString(newvalue);
  }

  /**
  * Get value of field E02EMDLUM as a String.
  */
  public String getE02EMDLUM()
  {
    return fieldE02EMDLUM.getString();
  }

  /**
  * Set numeric field E02EMDLUM using a BigDecimal value.
  */
  public void setE02EMDLUM(BigDecimal newvalue)
  {
    fieldE02EMDLUM.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02EMDLUM as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02EMDLUM()
  {
    return fieldE02EMDLUM.getBigDecimal();
  }

  /**
  * Set field E02EMDLUD using a String value.
  */
  public void setE02EMDLUD(String newvalue)
  {
    fieldE02EMDLUD.setString(newvalue);
  }

  /**
  * Get value of field E02EMDLUD as a String.
  */
  public String getE02EMDLUD()
  {
    return fieldE02EMDLUD.getString();
  }

  /**
  * Set numeric field E02EMDLUD using a BigDecimal value.
  */
  public void setE02EMDLUD(BigDecimal newvalue)
  {
    fieldE02EMDLUD.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02EMDLUD as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02EMDLUD()
  {
    return fieldE02EMDLUD.getBigDecimal();
  }

  /**
  * Set field E02EMDLUY using a String value.
  */
  public void setE02EMDLUY(String newvalue)
  {
    fieldE02EMDLUY.setString(newvalue);
  }

  /**
  * Get value of field E02EMDLUY as a String.
  */
  public String getE02EMDLUY()
  {
    return fieldE02EMDLUY.getString();
  }

  /**
  * Set numeric field E02EMDLUY using a BigDecimal value.
  */
  public void setE02EMDLUY(BigDecimal newvalue)
  {
    fieldE02EMDLUY.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02EMDLUY as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02EMDLUY()
  {
    return fieldE02EMDLUY.getBigDecimal();
  }

  /**
  * Set field E02EMDLUT using a String value.
  */
  public void setE02EMDLUT(String newvalue)
  {
    fieldE02EMDLUT.setString(newvalue);
  }

  /**
  * Get value of field E02EMDLUT as a String.
  */
  public String getE02EMDLUT()
  {
    return fieldE02EMDLUT.getString();
  }

  /**
  * Set field E02EMDLUU using a String value.
  */
  public void setE02EMDLUU(String newvalue)
  {
    fieldE02EMDLUU.setString(newvalue);
  }

  /**
  * Get value of field E02EMDLUU as a String.
  */
  public String getE02EMDLUU()
  {
    return fieldE02EMDLUU.getString();
  }

  /**
  * Set field E02NUMREC using a String value.
  */
  public void setE02NUMREC(String newvalue)
  {
    fieldE02NUMREC.setString(newvalue);
  }

  /**
  * Get value of field E02NUMREC as a String.
  */
  public String getE02NUMREC()
  {
    return fieldE02NUMREC.getString();
  }

  /**
  * Set numeric field E02NUMREC using a BigDecimal value.
  */
  public void setE02NUMREC(BigDecimal newvalue)
  {
    fieldE02NUMREC.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02NUMREC as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02NUMREC()
  {
    return fieldE02NUMREC.getBigDecimal();
  }

  /**
  * Set field E02INDOPE using a String value.
  */
  public void setE02INDOPE(String newvalue)
  {
    fieldE02INDOPE.setString(newvalue);
  }

  /**
  * Get value of field E02INDOPE as a String.
  */
  public String getE02INDOPE()
  {
    return fieldE02INDOPE.getString();
  }

}
