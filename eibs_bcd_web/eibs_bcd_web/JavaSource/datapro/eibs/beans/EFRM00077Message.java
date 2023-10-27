package datapro.eibs.beans;

import datapro.eibs.sockets.*;
import java.io.*;
import java.math.*;

import java.util.*;

/**
* Class generated by AS/400 CRTCLASS command from EFRM00077 physical file definition.
* 
* File level identifier is 1170202115311.
* Record format level identifier is 35A5BB82E130A.
*/

public class EFRM00077Message extends MessageRecord
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
                                     "EUSUSR",
                                     "EUSSTS",
                                     "EUSOPR",
                                     "EUSCTY",
                                     "EUSENT",
                                     "EUSCUN",
                                     "EUSACC",
                                     "EUSMXT",
                                     "DUSMXT",
                                     "EUSTRA",
                                     "EUSBPA",
                                     "EUSLCA",
                                     "EUSEXT",
                                     "EUSTPT",
                                     "EUSLNA",
                                     "EUSCCP",
                                     "EUSCTL",
                                     "EUSCON",
                                     "EUSPHN",
                                     "EUSIAD",
                                     "EUSCFM",
                                     "DUSCFM",
                                     "EUSIEF",
                                     "DUSIEF",
                                     "EUSA01",
                                     "EUSA02",
                                     "EUSA03",
                                     "EUSA04",
                                     "EUSA05",
                                     "EUSA06",
                                     "EUSA07",
                                     "EUSA08",
                                     "EUSA09",
                                     "EUSA10",
                                     "EUSNAM",
                                     "EUSFAC",
                                     "EUSMAX",
                                     "EUSAMX",
                                     "EUSETL",
                                     "EUSEAL",
                                     "EUSTTL",
                                     "EUSTAL"
                                   };
  final static String tnames[] = {
                                   "USER",
                                   "PROGRAM",
                                   "TIME-DATE",
                                   "SCREEN",
                                   "OPERAT",
                                   "MORE",
                                   "LENGUAJE",
                                   "FLAG",
                                   "FLAG",
                                   "user",
                                   "status",
                                   "reqPwd",
                                   "customerType",
                                   "masterUserProf",
                                   "cusNumber",
                                   "primaryAccount",
                                   "acumType",
                                   "acumTypeDsc",
                                   "transferAllowed",
                                   "payToAcc",
                                   "payToLetterCredit",
                                   "extTransfer",
                                   "thirdTransfer",
                                   "payToLoan",
                                   "payToCreditCard",
                                   "payToCollateral",
                                   "contactExcutive",
                                   "contactPhoneNum",
                                   "email",
                                   "confirmationType",
                                   "confTypeDsc",
                                   "includeAcc",
                                   "includeAccDsc",
                                   "account1",
                                   "account2",
                                   "account3",
                                   "account4",
                                   "account5",
                                   "account6",
                                   "account7",
                                   "account8",
                                   "account9",
                                   "account10",
                                   "masterName",
                                   "accControl",
                                   "maxInternalTransf",
                                   "maxAcumIntTransf",
                                   "maxExtTransAmount",
                                   "maxAcumExtTransf",
                                   "maxThirdTransfer",
                                   "maxAcumThirdTrans"
                                 };
  final static String fid = "1170202115311";
  final static String rid = "35A5BB82E130A";
  final static String fmtname = "EFRM00077";
  final int FIELDCOUNT = 51;
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
  private CharacterField fieldEUSUSR = null;
  private CharacterField fieldEUSSTS = null;
  private CharacterField fieldEUSOPR = null;
  private CharacterField fieldEUSCTY = null;
  private CharacterField fieldEUSENT = null;
  private DecimalField fieldEUSCUN = null;
  private DecimalField fieldEUSACC = null;
  private CharacterField fieldEUSMXT = null;
  private CharacterField fieldDUSMXT = null;
  private CharacterField fieldEUSTRA = null;
  private CharacterField fieldEUSBPA = null;
  private CharacterField fieldEUSLCA = null;
  private CharacterField fieldEUSEXT = null;
  private CharacterField fieldEUSTPT = null;
  private CharacterField fieldEUSLNA = null;
  private CharacterField fieldEUSCCP = null;
  private CharacterField fieldEUSCTL = null;
  private CharacterField fieldEUSCON = null;
  private DecimalField fieldEUSPHN = null;
  private CharacterField fieldEUSIAD = null;
  private CharacterField fieldEUSCFM = null;
  private CharacterField fieldDUSCFM = null;
  private CharacterField fieldEUSIEF = null;
  private CharacterField fieldDUSIEF = null;
  private DecimalField fieldEUSA01 = null;
  private DecimalField fieldEUSA02 = null;
  private DecimalField fieldEUSA03 = null;
  private DecimalField fieldEUSA04 = null;
  private DecimalField fieldEUSA05 = null;
  private DecimalField fieldEUSA06 = null;
  private DecimalField fieldEUSA07 = null;
  private DecimalField fieldEUSA08 = null;
  private DecimalField fieldEUSA09 = null;
  private DecimalField fieldEUSA10 = null;
  private CharacterField fieldEUSNAM = null;
  private CharacterField fieldEUSFAC = null;
  private DecimalField fieldEUSMAX = null;
  private DecimalField fieldEUSAMX = null;
  private DecimalField fieldEUSETL = null;
  private DecimalField fieldEUSEAL = null;
  private DecimalField fieldEUSTTL = null;
  private DecimalField fieldEUSTAL = null;

  /**
  * Constructor for EFRM00077Message.
  */
  public EFRM00077Message()
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
    recordsize = 583;
    fileid = fid;
    recordid = rid;
    message = new byte[getByteLength()];
    formatname = fmtname;
    fieldnames = fldnames;
    tagnames = tnames;
    fields = new MessageField[FIELDCOUNT];

    fields[0] = fieldH02USERID =
    new CharacterField(message, HEADERSIZE + 0, 10, "USER");
    fields[1] = fieldH02PROGRM =
    new CharacterField(message, HEADERSIZE + 10, 10, "PROGRAM");
    fields[2] = fieldH02TIMSYS =
    new CharacterField(message, HEADERSIZE + 20, 12, "TIME-DATE");
    fields[3] = fieldH02SCRCOD =
    new CharacterField(message, HEADERSIZE + 32, 2, "SCREEN");
    fields[4] = fieldH02OPECOD =
    new CharacterField(message, HEADERSIZE + 34, 4, "OPERAT");
    fields[5] = fieldH02FLGMAS =
    new CharacterField(message, HEADERSIZE + 38, 1, "MORE");
    fields[6] = fieldH02FLGWK1 =
    new CharacterField(message, HEADERSIZE + 39, 1, "LENGUAJE");
    fields[7] = fieldH02FLGWK2 =
    new CharacterField(message, HEADERSIZE + 40, 1, "FLAG");
    fields[8] = fieldH02FLGWK3 =
    new CharacterField(message, HEADERSIZE + 41, 1, "FLAG");
    fields[9] = fieldEUSUSR =
    new CharacterField(message, HEADERSIZE + 42, 10, "user");
    fields[10] = fieldEUSSTS =
    new CharacterField(message, HEADERSIZE + 52, 1, "status");
    fields[11] = fieldEUSOPR =
    new CharacterField(message, HEADERSIZE + 53, 1, "reqPwd");
    fields[12] = fieldEUSCTY =
    new CharacterField(message, HEADERSIZE + 54, 1, "customerType");
    fields[13] = fieldEUSENT =
    new CharacterField(message, HEADERSIZE + 55, 10, "masterUserProf");
    fields[14] = fieldEUSCUN =
    new DecimalField(message, HEADERSIZE + 65, 10, 0, "cusNumber");
    fields[15] = fieldEUSACC =
    new DecimalField(message, HEADERSIZE + 75, 13, 0, "primaryAccount");
    fields[16] = fieldEUSMXT =
    new CharacterField(message, HEADERSIZE + 88, 1, "acumType");
    fields[17] = fieldDUSMXT =
    new CharacterField(message, HEADERSIZE + 89, 35, "acumTypeDsc");
    fields[18] = fieldEUSTRA =
    new CharacterField(message, HEADERSIZE + 124, 1, "transferAllowed");
    fields[19] = fieldEUSBPA =
    new CharacterField(message, HEADERSIZE + 125, 1, "payToAcc");
    fields[20] = fieldEUSLCA =
    new CharacterField(message, HEADERSIZE + 126, 1, "payToLetterCredit");
    fields[21] = fieldEUSEXT =
    new CharacterField(message, HEADERSIZE + 127, 1, "extTransfer");
    fields[22] = fieldEUSTPT =
    new CharacterField(message, HEADERSIZE + 128, 1, "thirdTransfer");
    fields[23] = fieldEUSLNA =
    new CharacterField(message, HEADERSIZE + 129, 1, "payToLoan");
    fields[24] = fieldEUSCCP =
    new CharacterField(message, HEADERSIZE + 130, 1, "payToCreditCard");
    fields[25] = fieldEUSCTL =
    new CharacterField(message, HEADERSIZE + 131, 1, "payToCollateral");
    fields[26] = fieldEUSCON =
    new CharacterField(message, HEADERSIZE + 132, 60, "contactExcutive");
    fields[27] = fieldEUSPHN =
    new DecimalField(message, HEADERSIZE + 192, 16, 0, "contactPhoneNum");
    fields[28] = fieldEUSIAD =
    new CharacterField(message, HEADERSIZE + 208, 60, "email");
    fields[29] = fieldEUSCFM =
    new CharacterField(message, HEADERSIZE + 268, 1, "confirmationType");
    fields[30] = fieldDUSCFM =
    new CharacterField(message, HEADERSIZE + 269, 35, "confTypeDsc");
    fields[31] = fieldEUSIEF =
    new CharacterField(message, HEADERSIZE + 304, 1, "includeAcc");
    fields[32] = fieldDUSIEF =
    new CharacterField(message, HEADERSIZE + 305, 35, "includeAccDsc");
    fields[33] = fieldEUSA01 =
    new DecimalField(message, HEADERSIZE + 340, 13, 0, "account1");
    fields[34] = fieldEUSA02 =
    new DecimalField(message, HEADERSIZE + 353, 13, 0, "account2");
    fields[35] = fieldEUSA03 =
    new DecimalField(message, HEADERSIZE + 366, 13, 0, "account3");
    fields[36] = fieldEUSA04 =
    new DecimalField(message, HEADERSIZE + 379, 13, 0, "account4");
    fields[37] = fieldEUSA05 =
    new DecimalField(message, HEADERSIZE + 392, 13, 0, "account5");
    fields[38] = fieldEUSA06 =
    new DecimalField(message, HEADERSIZE + 405, 13, 0, "account6");
    fields[39] = fieldEUSA07 =
    new DecimalField(message, HEADERSIZE + 418, 13, 0, "account7");
    fields[40] = fieldEUSA08 =
    new DecimalField(message, HEADERSIZE + 431, 13, 0, "account8");
    fields[41] = fieldEUSA09 =
    new DecimalField(message, HEADERSIZE + 444, 13, 0, "account9");
    fields[42] = fieldEUSA10 =
    new DecimalField(message, HEADERSIZE + 457, 13, 0, "account10");
    fields[43] = fieldEUSNAM =
    new CharacterField(message, HEADERSIZE + 470, 10, "masterName");
    fields[44] = fieldEUSFAC =
    new CharacterField(message, HEADERSIZE + 480, 1, "accControl");
    fields[45] = fieldEUSMAX =
    new DecimalField(message, HEADERSIZE + 481, 17, 2, "maxInternalTransf");
    fields[46] = fieldEUSAMX =
    new DecimalField(message, HEADERSIZE + 498, 17, 2, "maxAcumIntTransf");
    fields[47] = fieldEUSETL =
    new DecimalField(message, HEADERSIZE + 515, 17, 2, "maxExtTransAmount");
    fields[48] = fieldEUSEAL =
    new DecimalField(message, HEADERSIZE + 532, 17, 2, "maxAcumExtTransf");
    fields[49] = fieldEUSTTL =
    new DecimalField(message, HEADERSIZE + 549, 17, 2, "maxThirdTransfer");
    fields[50] = fieldEUSTAL =
    new DecimalField(message, HEADERSIZE + 566, 17, 2, "maxAcumThirdTrans");

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
  * Set field EUSUSR using a String value.
  */
  public void setEUSUSR(String newvalue)
  {
    fieldEUSUSR.setString(newvalue);
  }

  /**
  * Get value of field EUSUSR as a String.
  */
  public String getEUSUSR()
  {
    return fieldEUSUSR.getString();
  }

  /**
  * Set field EUSSTS using a String value.
  */
  public void setEUSSTS(String newvalue)
  {
    fieldEUSSTS.setString(newvalue);
  }

  /**
  * Get value of field EUSSTS as a String.
  */
  public String getEUSSTS()
  {
    return fieldEUSSTS.getString();
  }

  /**
  * Set field EUSOPR using a String value.
  */
  public void setEUSOPR(String newvalue)
  {
    fieldEUSOPR.setString(newvalue);
  }

  /**
  * Get value of field EUSOPR as a String.
  */
  public String getEUSOPR()
  {
    return fieldEUSOPR.getString();
  }

  /**
  * Set field EUSCTY using a String value.
  */
  public void setEUSCTY(String newvalue)
  {
    fieldEUSCTY.setString(newvalue);
  }

  /**
  * Get value of field EUSCTY as a String.
  */
  public String getEUSCTY()
  {
    return fieldEUSCTY.getString();
  }

  /**
  * Set field EUSENT using a String value.
  */
  public void setEUSENT(String newvalue)
  {
    fieldEUSENT.setString(newvalue);
  }

  /**
  * Get value of field EUSENT as a String.
  */
  public String getEUSENT()
  {
    return fieldEUSENT.getString();
  }

  /**
  * Set field EUSCUN using a String value.
  */
  public void setEUSCUN(String newvalue)
  {
    fieldEUSCUN.setString(newvalue);
  }

  /**
  * Get value of field EUSCUN as a String.
  */
  public String getEUSCUN()
  {
    return fieldEUSCUN.getString();
  }

  /**
  * Set numeric field EUSCUN using a BigDecimal value.
  */
  public void setEUSCUN(BigDecimal newvalue)
  {
    fieldEUSCUN.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field EUSCUN as a BigDecimal.
  */
  public BigDecimal getBigDecimalEUSCUN()
  {
    return fieldEUSCUN.getBigDecimal();
  }

  /**
  * Set field EUSACC using a String value.
  */
  public void setEUSACC(String newvalue)
  {
    fieldEUSACC.setString(newvalue);
  }

  /**
  * Get value of field EUSACC as a String.
  */
  public String getEUSACC()
  {
    return fieldEUSACC.getString();
  }

  /**
  * Set numeric field EUSACC using a BigDecimal value.
  */
  public void setEUSACC(BigDecimal newvalue)
  {
    fieldEUSACC.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field EUSACC as a BigDecimal.
  */
  public BigDecimal getBigDecimalEUSACC()
  {
    return fieldEUSACC.getBigDecimal();
  }

  /**
  * Set field EUSMXT using a String value.
  */
  public void setEUSMXT(String newvalue)
  {
    fieldEUSMXT.setString(newvalue);
  }

  /**
  * Get value of field EUSMXT as a String.
  */
  public String getEUSMXT()
  {
    return fieldEUSMXT.getString();
  }

  /**
  * Set field DUSMXT using a String value.
  */
  public void setDUSMXT(String newvalue)
  {
    fieldDUSMXT.setString(newvalue);
  }

  /**
  * Get value of field DUSMXT as a String.
  */
  public String getDUSMXT()
  {
    return fieldDUSMXT.getString();
  }

  /**
  * Set field EUSTRA using a String value.
  */
  public void setEUSTRA(String newvalue)
  {
    fieldEUSTRA.setString(newvalue);
  }

  /**
  * Get value of field EUSTRA as a String.
  */
  public String getEUSTRA()
  {
    return fieldEUSTRA.getString();
  }

  /**
  * Set field EUSBPA using a String value.
  */
  public void setEUSBPA(String newvalue)
  {
    fieldEUSBPA.setString(newvalue);
  }

  /**
  * Get value of field EUSBPA as a String.
  */
  public String getEUSBPA()
  {
    return fieldEUSBPA.getString();
  }

  /**
  * Set field EUSLCA using a String value.
  */
  public void setEUSLCA(String newvalue)
  {
    fieldEUSLCA.setString(newvalue);
  }

  /**
  * Get value of field EUSLCA as a String.
  */
  public String getEUSLCA()
  {
    return fieldEUSLCA.getString();
  }

  /**
  * Set field EUSEXT using a String value.
  */
  public void setEUSEXT(String newvalue)
  {
    fieldEUSEXT.setString(newvalue);
  }

  /**
  * Get value of field EUSEXT as a String.
  */
  public String getEUSEXT()
  {
    return fieldEUSEXT.getString();
  }

  /**
  * Set field EUSTPT using a String value.
  */
  public void setEUSTPT(String newvalue)
  {
    fieldEUSTPT.setString(newvalue);
  }

  /**
  * Get value of field EUSTPT as a String.
  */
  public String getEUSTPT()
  {
    return fieldEUSTPT.getString();
  }

  /**
  * Set field EUSLNA using a String value.
  */
  public void setEUSLNA(String newvalue)
  {
    fieldEUSLNA.setString(newvalue);
  }

  /**
  * Get value of field EUSLNA as a String.
  */
  public String getEUSLNA()
  {
    return fieldEUSLNA.getString();
  }

  /**
  * Set field EUSCCP using a String value.
  */
  public void setEUSCCP(String newvalue)
  {
    fieldEUSCCP.setString(newvalue);
  }

  /**
  * Get value of field EUSCCP as a String.
  */
  public String getEUSCCP()
  {
    return fieldEUSCCP.getString();
  }

  /**
  * Set field EUSCTL using a String value.
  */
  public void setEUSCTL(String newvalue)
  {
    fieldEUSCTL.setString(newvalue);
  }

  /**
  * Get value of field EUSCTL as a String.
  */
  public String getEUSCTL()
  {
    return fieldEUSCTL.getString();
  }

  /**
  * Set field EUSCON using a String value.
  */
  public void setEUSCON(String newvalue)
  {
    fieldEUSCON.setString(newvalue);
  }

  /**
  * Get value of field EUSCON as a String.
  */
  public String getEUSCON()
  {
    return fieldEUSCON.getString();
  }

  /**
  * Set field EUSPHN using a String value.
  */
  public void setEUSPHN(String newvalue)
  {
    fieldEUSPHN.setString(newvalue);
  }

  /**
  * Get value of field EUSPHN as a String.
  */
  public String getEUSPHN()
  {
    return fieldEUSPHN.getString();
  }

  /**
  * Set numeric field EUSPHN using a BigDecimal value.
  */
  public void setEUSPHN(BigDecimal newvalue)
  {
    fieldEUSPHN.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field EUSPHN as a BigDecimal.
  */
  public BigDecimal getBigDecimalEUSPHN()
  {
    return fieldEUSPHN.getBigDecimal();
  }

  /**
  * Set field EUSIAD using a String value.
  */
  public void setEUSIAD(String newvalue)
  {
    fieldEUSIAD.setString(newvalue);
  }

  /**
  * Get value of field EUSIAD as a String.
  */
  public String getEUSIAD()
  {
    return fieldEUSIAD.getString();
  }

  /**
  * Set field EUSCFM using a String value.
  */
  public void setEUSCFM(String newvalue)
  {
    fieldEUSCFM.setString(newvalue);
  }

  /**
  * Get value of field EUSCFM as a String.
  */
  public String getEUSCFM()
  {
    return fieldEUSCFM.getString();
  }

  /**
  * Set field DUSCFM using a String value.
  */
  public void setDUSCFM(String newvalue)
  {
    fieldDUSCFM.setString(newvalue);
  }

  /**
  * Get value of field DUSCFM as a String.
  */
  public String getDUSCFM()
  {
    return fieldDUSCFM.getString();
  }

  /**
  * Set field EUSIEF using a String value.
  */
  public void setEUSIEF(String newvalue)
  {
    fieldEUSIEF.setString(newvalue);
  }

  /**
  * Get value of field EUSIEF as a String.
  */
  public String getEUSIEF()
  {
    return fieldEUSIEF.getString();
  }

  /**
  * Set field DUSIEF using a String value.
  */
  public void setDUSIEF(String newvalue)
  {
    fieldDUSIEF.setString(newvalue);
  }

  /**
  * Get value of field DUSIEF as a String.
  */
  public String getDUSIEF()
  {
    return fieldDUSIEF.getString();
  }

  /**
  * Set field EUSA01 using a String value.
  */
  public void setEUSA01(String newvalue)
  {
    fieldEUSA01.setString(newvalue);
  }

  /**
  * Get value of field EUSA01 as a String.
  */
  public String getEUSA01()
  {
    return fieldEUSA01.getString();
  }

  /**
  * Set numeric field EUSA01 using a BigDecimal value.
  */
  public void setEUSA01(BigDecimal newvalue)
  {
    fieldEUSA01.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field EUSA01 as a BigDecimal.
  */
  public BigDecimal getBigDecimalEUSA01()
  {
    return fieldEUSA01.getBigDecimal();
  }

  /**
  * Set field EUSA02 using a String value.
  */
  public void setEUSA02(String newvalue)
  {
    fieldEUSA02.setString(newvalue);
  }

  /**
  * Get value of field EUSA02 as a String.
  */
  public String getEUSA02()
  {
    return fieldEUSA02.getString();
  }

  /**
  * Set numeric field EUSA02 using a BigDecimal value.
  */
  public void setEUSA02(BigDecimal newvalue)
  {
    fieldEUSA02.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field EUSA02 as a BigDecimal.
  */
  public BigDecimal getBigDecimalEUSA02()
  {
    return fieldEUSA02.getBigDecimal();
  }

  /**
  * Set field EUSA03 using a String value.
  */
  public void setEUSA03(String newvalue)
  {
    fieldEUSA03.setString(newvalue);
  }

  /**
  * Get value of field EUSA03 as a String.
  */
  public String getEUSA03()
  {
    return fieldEUSA03.getString();
  }

  /**
  * Set numeric field EUSA03 using a BigDecimal value.
  */
  public void setEUSA03(BigDecimal newvalue)
  {
    fieldEUSA03.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field EUSA03 as a BigDecimal.
  */
  public BigDecimal getBigDecimalEUSA03()
  {
    return fieldEUSA03.getBigDecimal();
  }

  /**
  * Set field EUSA04 using a String value.
  */
  public void setEUSA04(String newvalue)
  {
    fieldEUSA04.setString(newvalue);
  }

  /**
  * Get value of field EUSA04 as a String.
  */
  public String getEUSA04()
  {
    return fieldEUSA04.getString();
  }

  /**
  * Set numeric field EUSA04 using a BigDecimal value.
  */
  public void setEUSA04(BigDecimal newvalue)
  {
    fieldEUSA04.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field EUSA04 as a BigDecimal.
  */
  public BigDecimal getBigDecimalEUSA04()
  {
    return fieldEUSA04.getBigDecimal();
  }

  /**
  * Set field EUSA05 using a String value.
  */
  public void setEUSA05(String newvalue)
  {
    fieldEUSA05.setString(newvalue);
  }

  /**
  * Get value of field EUSA05 as a String.
  */
  public String getEUSA05()
  {
    return fieldEUSA05.getString();
  }

  /**
  * Set numeric field EUSA05 using a BigDecimal value.
  */
  public void setEUSA05(BigDecimal newvalue)
  {
    fieldEUSA05.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field EUSA05 as a BigDecimal.
  */
  public BigDecimal getBigDecimalEUSA05()
  {
    return fieldEUSA05.getBigDecimal();
  }

  /**
  * Set field EUSA06 using a String value.
  */
  public void setEUSA06(String newvalue)
  {
    fieldEUSA06.setString(newvalue);
  }

  /**
  * Get value of field EUSA06 as a String.
  */
  public String getEUSA06()
  {
    return fieldEUSA06.getString();
  }

  /**
  * Set numeric field EUSA06 using a BigDecimal value.
  */
  public void setEUSA06(BigDecimal newvalue)
  {
    fieldEUSA06.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field EUSA06 as a BigDecimal.
  */
  public BigDecimal getBigDecimalEUSA06()
  {
    return fieldEUSA06.getBigDecimal();
  }

  /**
  * Set field EUSA07 using a String value.
  */
  public void setEUSA07(String newvalue)
  {
    fieldEUSA07.setString(newvalue);
  }

  /**
  * Get value of field EUSA07 as a String.
  */
  public String getEUSA07()
  {
    return fieldEUSA07.getString();
  }

  /**
  * Set numeric field EUSA07 using a BigDecimal value.
  */
  public void setEUSA07(BigDecimal newvalue)
  {
    fieldEUSA07.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field EUSA07 as a BigDecimal.
  */
  public BigDecimal getBigDecimalEUSA07()
  {
    return fieldEUSA07.getBigDecimal();
  }

  /**
  * Set field EUSA08 using a String value.
  */
  public void setEUSA08(String newvalue)
  {
    fieldEUSA08.setString(newvalue);
  }

  /**
  * Get value of field EUSA08 as a String.
  */
  public String getEUSA08()
  {
    return fieldEUSA08.getString();
  }

  /**
  * Set numeric field EUSA08 using a BigDecimal value.
  */
  public void setEUSA08(BigDecimal newvalue)
  {
    fieldEUSA08.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field EUSA08 as a BigDecimal.
  */
  public BigDecimal getBigDecimalEUSA08()
  {
    return fieldEUSA08.getBigDecimal();
  }

  /**
  * Set field EUSA09 using a String value.
  */
  public void setEUSA09(String newvalue)
  {
    fieldEUSA09.setString(newvalue);
  }

  /**
  * Get value of field EUSA09 as a String.
  */
  public String getEUSA09()
  {
    return fieldEUSA09.getString();
  }

  /**
  * Set numeric field EUSA09 using a BigDecimal value.
  */
  public void setEUSA09(BigDecimal newvalue)
  {
    fieldEUSA09.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field EUSA09 as a BigDecimal.
  */
  public BigDecimal getBigDecimalEUSA09()
  {
    return fieldEUSA09.getBigDecimal();
  }

  /**
  * Set field EUSA10 using a String value.
  */
  public void setEUSA10(String newvalue)
  {
    fieldEUSA10.setString(newvalue);
  }

  /**
  * Get value of field EUSA10 as a String.
  */
  public String getEUSA10()
  {
    return fieldEUSA10.getString();
  }

  /**
  * Set numeric field EUSA10 using a BigDecimal value.
  */
  public void setEUSA10(BigDecimal newvalue)
  {
    fieldEUSA10.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field EUSA10 as a BigDecimal.
  */
  public BigDecimal getBigDecimalEUSA10()
  {
    return fieldEUSA10.getBigDecimal();
  }

  /**
  * Set field EUSNAM using a String value.
  */
  public void setEUSNAM(String newvalue)
  {
    fieldEUSNAM.setString(newvalue);
  }

  /**
  * Get value of field EUSNAM as a String.
  */
  public String getEUSNAM()
  {
    return fieldEUSNAM.getString();
  }

  /**
  * Set field EUSFAC using a String value.
  */
  public void setEUSFAC(String newvalue)
  {
    fieldEUSFAC.setString(newvalue);
  }

  /**
  * Get value of field EUSFAC as a String.
  */
  public String getEUSFAC()
  {
    return fieldEUSFAC.getString();
  }

  /**
  * Set field EUSMAX using a String value.
  */
  public void setEUSMAX(String newvalue)
  {
    fieldEUSMAX.setString(newvalue);
  }

  /**
  * Get value of field EUSMAX as a String.
  */
  public String getEUSMAX()
  {
    return fieldEUSMAX.getString();
  }

  /**
  * Set numeric field EUSMAX using a BigDecimal value.
  */
  public void setEUSMAX(BigDecimal newvalue)
  {
    fieldEUSMAX.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field EUSMAX as a BigDecimal.
  */
  public BigDecimal getBigDecimalEUSMAX()
  {
    return fieldEUSMAX.getBigDecimal();
  }

  /**
  * Set field EUSAMX using a String value.
  */
  public void setEUSAMX(String newvalue)
  {
    fieldEUSAMX.setString(newvalue);
  }

  /**
  * Get value of field EUSAMX as a String.
  */
  public String getEUSAMX()
  {
    return fieldEUSAMX.getString();
  }

  /**
  * Set numeric field EUSAMX using a BigDecimal value.
  */
  public void setEUSAMX(BigDecimal newvalue)
  {
    fieldEUSAMX.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field EUSAMX as a BigDecimal.
  */
  public BigDecimal getBigDecimalEUSAMX()
  {
    return fieldEUSAMX.getBigDecimal();
  }

  /**
  * Set field EUSETL using a String value.
  */
  public void setEUSETL(String newvalue)
  {
    fieldEUSETL.setString(newvalue);
  }

  /**
  * Get value of field EUSETL as a String.
  */
  public String getEUSETL()
  {
    return fieldEUSETL.getString();
  }

  /**
  * Set numeric field EUSETL using a BigDecimal value.
  */
  public void setEUSETL(BigDecimal newvalue)
  {
    fieldEUSETL.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field EUSETL as a BigDecimal.
  */
  public BigDecimal getBigDecimalEUSETL()
  {
    return fieldEUSETL.getBigDecimal();
  }

  /**
  * Set field EUSEAL using a String value.
  */
  public void setEUSEAL(String newvalue)
  {
    fieldEUSEAL.setString(newvalue);
  }

  /**
  * Get value of field EUSEAL as a String.
  */
  public String getEUSEAL()
  {
    return fieldEUSEAL.getString();
  }

  /**
  * Set numeric field EUSEAL using a BigDecimal value.
  */
  public void setEUSEAL(BigDecimal newvalue)
  {
    fieldEUSEAL.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field EUSEAL as a BigDecimal.
  */
  public BigDecimal getBigDecimalEUSEAL()
  {
    return fieldEUSEAL.getBigDecimal();
  }

  /**
  * Set field EUSTTL using a String value.
  */
  public void setEUSTTL(String newvalue)
  {
    fieldEUSTTL.setString(newvalue);
  }

  /**
  * Get value of field EUSTTL as a String.
  */
  public String getEUSTTL()
  {
    return fieldEUSTTL.getString();
  }

  /**
  * Set numeric field EUSTTL using a BigDecimal value.
  */
  public void setEUSTTL(BigDecimal newvalue)
  {
    fieldEUSTTL.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field EUSTTL as a BigDecimal.
  */
  public BigDecimal getBigDecimalEUSTTL()
  {
    return fieldEUSTTL.getBigDecimal();
  }

  /**
  * Set field EUSTAL using a String value.
  */
  public void setEUSTAL(String newvalue)
  {
    fieldEUSTAL.setString(newvalue);
  }

  /**
  * Get value of field EUSTAL as a String.
  */
  public String getEUSTAL()
  {
    return fieldEUSTAL.getString();
  }

  /**
  * Set numeric field EUSTAL using a BigDecimal value.
  */
  public void setEUSTAL(BigDecimal newvalue)
  {
    fieldEUSTAL.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field EUSTAL as a BigDecimal.
  */
  public BigDecimal getBigDecimalEUSTAL()
  {
    return fieldEUSTAL.getBigDecimal();
  }

}
