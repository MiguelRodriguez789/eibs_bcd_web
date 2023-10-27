package datapro.eibs.beans;

import datapro.eibs.sockets.*;
import java.io.*;
import java.math.*;

import java.util.*;

/**
* Class generated by AS/400 CRTCLASS command from EFRM01502 physical file definition.
* 
* File level identifier is 1210502165652.
* Record format level identifier is 38C6263AD5761.
*/

public class EFRM01502Message extends MessageRecord
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
                                     "E02CUN",
                                     "E02ACD",
                                     "E02BRN",
                                     "E02BRND",
                                     "E02ACC",
                                     "E02ATY",
                                     "E02ATYD",
                                     "E02PRD",
                                     "E02PRDD",
                                     "E02AM1",
                                     "E02AM2",
                                     "E02AM3",
                                     "E02ENDFLD"
                                   };
  final static String tnames[] = {
                                   "*userId",
                                   "*program",
                                   "*fechaHora",
                                   "*srcCode",
                                   "*opeCode",
                                   "*flagMas",
                                   "*flagWk1",
                                   "*flagWk2",
                                   "flag3",
                                   "customerNumber",
                                   "applicationCode",
                                   "branchNumber",
                                   "branchDsc",
                                   "accountNumber",
                                   "accountType",
                                   "accountTypeDsc",
                                   "productCode",
                                   "productCodeDsc",
                                   "saldoCapital",
                                   "interesPagado",
                                   "retencionFuente",
                                   "endOfFile"
                                 };
  final static String fid = "1210502165652";
  final static String rid = "38C6263AD5761";
  final static String fmtname = "EFRM01502";
  final int FIELDCOUNT = 22;
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
  private DecimalField fieldE02CUN = null;
  private CharacterField fieldE02ACD = null;
  private DecimalField fieldE02BRN = null;
  private CharacterField fieldE02BRND = null;
  private DecimalField fieldE02ACC = null;
  private CharacterField fieldE02ATY = null;
  private CharacterField fieldE02ATYD = null;
  private CharacterField fieldE02PRD = null;
  private CharacterField fieldE02PRDD = null;
  private DecimalField fieldE02AM1 = null;
  private DecimalField fieldE02AM2 = null;
  private DecimalField fieldE02AM3 = null;
  private CharacterField fieldE02ENDFLD = null;

  /**
  * Constructor for EFRM01502Message.
  */
  public EFRM01502Message()
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
    recordsize = 312;
    fileid = fid;
    recordid = rid;
    message = new byte[getByteLength()];
    formatname = fmtname;
    fieldnames = fldnames;
    tagnames = tnames;
    fields = new MessageField[FIELDCOUNT];

    fields[0] = fieldH02USERID =
    new CharacterField(message, HEADERSIZE + 0, 10, "*userId");
    fields[1] = fieldH02PROGRM =
    new CharacterField(message, HEADERSIZE + 10, 10, "*program");
    fields[2] = fieldH02TIMSYS =
    new CharacterField(message, HEADERSIZE + 20, 12, "*fechaHora");
    fields[3] = fieldH02SCRCOD =
    new CharacterField(message, HEADERSIZE + 32, 2, "*srcCode");
    fields[4] = fieldH02OPECOD =
    new CharacterField(message, HEADERSIZE + 34, 4, "*opeCode");
    fields[5] = fieldH02FLGMAS =
    new CharacterField(message, HEADERSIZE + 38, 1, "*flagMas");
    fields[6] = fieldH02FLGWK1 =
    new CharacterField(message, HEADERSIZE + 39, 1, "*flagWk1");
    fields[7] = fieldH02FLGWK2 =
    new CharacterField(message, HEADERSIZE + 40, 1, "*flagWk2");
    fields[8] = fieldH02FLGWK3 =
    new CharacterField(message, HEADERSIZE + 41, 1, "flag3");
    fields[9] = fieldE02CUN =
    new DecimalField(message, HEADERSIZE + 42, 10, 0, "customerNumber");
    fields[10] = fieldE02ACD =
    new CharacterField(message, HEADERSIZE + 52, 2, "applicationCode");
    fields[11] = fieldE02BRN =
    new DecimalField(message, HEADERSIZE + 54, 5, 0, "branchNumber");
    fields[12] = fieldE02BRND =
    new CharacterField(message, HEADERSIZE + 59, 60, "branchDsc");
    fields[13] = fieldE02ACC =
    new DecimalField(message, HEADERSIZE + 119, 13, 0, "accountNumber");
    fields[14] = fieldE02ATY =
    new CharacterField(message, HEADERSIZE + 132, 4, "accountType");
    fields[15] = fieldE02ATYD =
    new CharacterField(message, HEADERSIZE + 136, 60, "accountTypeDsc");
    fields[16] = fieldE02PRD =
    new CharacterField(message, HEADERSIZE + 196, 4, "productCode");
    fields[17] = fieldE02PRDD =
    new CharacterField(message, HEADERSIZE + 200, 60, "productCodeDsc");
    fields[18] = fieldE02AM1 =
    new DecimalField(message, HEADERSIZE + 260, 17, 2, "saldoCapital");
    fields[19] = fieldE02AM2 =
    new DecimalField(message, HEADERSIZE + 277, 17, 2, "interesPagado");
    fields[20] = fieldE02AM3 =
    new DecimalField(message, HEADERSIZE + 294, 17, 2, "retencionFuente");
    fields[21] = fieldE02ENDFLD =
    new CharacterField(message, HEADERSIZE + 311, 1, "endOfFile");

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
  * Set field E02CUN using a String value.
  */
  public void setE02CUN(String newvalue)
  {
    fieldE02CUN.setString(newvalue);
  }

  /**
  * Get value of field E02CUN as a String.
  */
  public String getE02CUN()
  {
    return fieldE02CUN.getString();
  }

  /**
  * Set numeric field E02CUN using a BigDecimal value.
  */
  public void setE02CUN(BigDecimal newvalue)
  {
    fieldE02CUN.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02CUN as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02CUN()
  {
    return fieldE02CUN.getBigDecimal();
  }

  /**
  * Set field E02ACD using a String value.
  */
  public void setE02ACD(String newvalue)
  {
    fieldE02ACD.setString(newvalue);
  }

  /**
  * Get value of field E02ACD as a String.
  */
  public String getE02ACD()
  {
    return fieldE02ACD.getString();
  }

  /**
  * Set field E02BRN using a String value.
  */
  public void setE02BRN(String newvalue)
  {
    fieldE02BRN.setString(newvalue);
  }

  /**
  * Get value of field E02BRN as a String.
  */
  public String getE02BRN()
  {
    return fieldE02BRN.getString();
  }

  /**
  * Set numeric field E02BRN using a BigDecimal value.
  */
  public void setE02BRN(BigDecimal newvalue)
  {
    fieldE02BRN.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02BRN as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02BRN()
  {
    return fieldE02BRN.getBigDecimal();
  }

  /**
  * Set field E02BRND using a String value.
  */
  public void setE02BRND(String newvalue)
  {
    fieldE02BRND.setString(newvalue);
  }

  /**
  * Get value of field E02BRND as a String.
  */
  public String getE02BRND()
  {
    return fieldE02BRND.getString();
  }

  /**
  * Set field E02ACC using a String value.
  */
  public void setE02ACC(String newvalue)
  {
    fieldE02ACC.setString(newvalue);
  }

  /**
  * Get value of field E02ACC as a String.
  */
  public String getE02ACC()
  {
    return fieldE02ACC.getString();
  }

  /**
  * Set numeric field E02ACC using a BigDecimal value.
  */
  public void setE02ACC(BigDecimal newvalue)
  {
    fieldE02ACC.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02ACC as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02ACC()
  {
    return fieldE02ACC.getBigDecimal();
  }

  /**
  * Set field E02ATY using a String value.
  */
  public void setE02ATY(String newvalue)
  {
    fieldE02ATY.setString(newvalue);
  }

  /**
  * Get value of field E02ATY as a String.
  */
  public String getE02ATY()
  {
    return fieldE02ATY.getString();
  }

  /**
  * Set field E02ATYD using a String value.
  */
  public void setE02ATYD(String newvalue)
  {
    fieldE02ATYD.setString(newvalue);
  }

  /**
  * Get value of field E02ATYD as a String.
  */
  public String getE02ATYD()
  {
    return fieldE02ATYD.getString();
  }

  /**
  * Set field E02PRD using a String value.
  */
  public void setE02PRD(String newvalue)
  {
    fieldE02PRD.setString(newvalue);
  }

  /**
  * Get value of field E02PRD as a String.
  */
  public String getE02PRD()
  {
    return fieldE02PRD.getString();
  }

  /**
  * Set field E02PRDD using a String value.
  */
  public void setE02PRDD(String newvalue)
  {
    fieldE02PRDD.setString(newvalue);
  }

  /**
  * Get value of field E02PRDD as a String.
  */
  public String getE02PRDD()
  {
    return fieldE02PRDD.getString();
  }

  /**
  * Set field E02AM1 using a String value.
  */
  public void setE02AM1(String newvalue)
  {
    fieldE02AM1.setString(newvalue);
  }

  /**
  * Get value of field E02AM1 as a String.
  */
  public String getE02AM1()
  {
    return fieldE02AM1.getString();
  }

  /**
  * Set numeric field E02AM1 using a BigDecimal value.
  */
  public void setE02AM1(BigDecimal newvalue)
  {
    fieldE02AM1.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02AM1 as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02AM1()
  {
    return fieldE02AM1.getBigDecimal();
  }

  /**
  * Set field E02AM2 using a String value.
  */
  public void setE02AM2(String newvalue)
  {
    fieldE02AM2.setString(newvalue);
  }

  /**
  * Get value of field E02AM2 as a String.
  */
  public String getE02AM2()
  {
    return fieldE02AM2.getString();
  }

  /**
  * Set numeric field E02AM2 using a BigDecimal value.
  */
  public void setE02AM2(BigDecimal newvalue)
  {
    fieldE02AM2.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02AM2 as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02AM2()
  {
    return fieldE02AM2.getBigDecimal();
  }

  /**
  * Set field E02AM3 using a String value.
  */
  public void setE02AM3(String newvalue)
  {
    fieldE02AM3.setString(newvalue);
  }

  /**
  * Get value of field E02AM3 as a String.
  */
  public String getE02AM3()
  {
    return fieldE02AM3.getString();
  }

  /**
  * Set numeric field E02AM3 using a BigDecimal value.
  */
  public void setE02AM3(BigDecimal newvalue)
  {
    fieldE02AM3.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02AM3 as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02AM3()
  {
    return fieldE02AM3.getBigDecimal();
  }

  /**
  * Set field E02ENDFLD using a String value.
  */
  public void setE02ENDFLD(String newvalue)
  {
    fieldE02ENDFLD.setString(newvalue);
  }

  /**
  * Get value of field E02ENDFLD as a String.
  */
  public String getE02ENDFLD()
  {
    return fieldE02ENDFLD.getString();
  }

}
