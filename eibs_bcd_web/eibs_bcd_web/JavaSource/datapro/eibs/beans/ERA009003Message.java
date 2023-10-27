package datapro.eibs.beans;

import datapro.eibs.sockets.*;
import java.io.*;
import java.math.*;

import java.util.*;

/**
* Class generated by AS/400 CRTCLASS command from ERA009003 physical file definition.
* 
* File level identifier is 1151015123202.
* Record format level identifier is 4C17B4E3A8F2C.
*/

public class ERA009003Message extends MessageRecord
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
                                     "E03CODFIL",
                                     "E03NOMFIL",
                                     "E03ROCCUN",
                                     "E03CUSNA1",
                                     "E03RW3REF",
                                     "E03RW3NIT",
                                     "E03RW3TIP",
                                     "E03RW3RCN",
                                     "E03RW3EMP",
                                     "E03RW3PAR",
                                     "E03RW3CEN",
                                     "E03RW3PAL",
                                     "E03RW3EOD",
                                     "E03RW3DEU",
                                     "E03NUMREG",
                                     "E03OPECDE"
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
                                   "E03CODFIL",
                                   "E03NOMFIL",
                                   "E03ROCCUN",
                                   "E03CUSNA1",
                                   "E03RW3REF",
                                   "E03RW3NIT",
                                   "E03RW3TIP",
                                   "E03RW3RCN",
                                   "E03RW3EMP",
                                   "E03RW3PAR",
                                   "E03RW3CEN",
                                   "E03RW3PAL",
                                   "E03RW3EOD",
                                   "E03RW3DEU",
                                   "E03NUMREG",
                                   "E03OPECDE"
                                 };
  final static String fid = "1151015123202";
  final static String rid = "4C17B4E3A8F2C";
  final static String fmtname = "ERA009003";
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
  private CharacterField fieldE03CODFIL = null;
  private CharacterField fieldE03NOMFIL = null;
  private DecimalField fieldE03ROCCUN = null;
  private CharacterField fieldE03CUSNA1 = null;
  private DecimalField fieldE03RW3REF = null;
  private DecimalField fieldE03RW3NIT = null;
  private CharacterField fieldE03RW3TIP = null;
  private DecimalField fieldE03RW3RCN = null;
  private CharacterField fieldE03RW3EMP = null;
  private DecimalField fieldE03RW3PAR = null;
  private CharacterField fieldE03RW3CEN = null;
  private CharacterField fieldE03RW3PAL = null;
  private DecimalField fieldE03RW3EOD = null;
  private DecimalField fieldE03RW3DEU = null;
  private DecimalField fieldE03NUMREG = null;
  private CharacterField fieldE03OPECDE = null;

  /**
  * Constructor for ERA009003Message.
  */
  public ERA009003Message()
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
    recordsize = 306;
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
    fields[9] = fieldE03CODFIL =
    new CharacterField(message, HEADERSIZE + 42, 10, "E03CODFIL");
    fields[10] = fieldE03NOMFIL =
    new CharacterField(message, HEADERSIZE + 52, 60, "E03NOMFIL");
    fields[11] = fieldE03ROCCUN =
    new DecimalField(message, HEADERSIZE + 112, 10, 0, "E03ROCCUN");
    fields[12] = fieldE03CUSNA1 =
    new CharacterField(message, HEADERSIZE + 122, 60, "E03CUSNA1");
    fields[13] = fieldE03RW3REF =
    new DecimalField(message, HEADERSIZE + 182, 21, 0, "E03RW3REF");
    fields[14] = fieldE03RW3NIT =
    new DecimalField(message, HEADERSIZE + 203, 15, 0, "E03RW3NIT");
    fields[15] = fieldE03RW3TIP =
    new CharacterField(message, HEADERSIZE + 218, 10, "E03RW3TIP");
    fields[16] = fieldE03RW3RCN =
    new DecimalField(message, HEADERSIZE + 228, 13, 0, "E03RW3RCN");
    fields[17] = fieldE03RW3EMP =
    new CharacterField(message, HEADERSIZE + 241, 1, "E03RW3EMP");
    fields[18] = fieldE03RW3PAR =
    new DecimalField(message, HEADERSIZE + 242, 20, 2, "E03RW3PAR");
    fields[19] = fieldE03RW3CEN =
    new CharacterField(message, HEADERSIZE + 262, 4, "E03RW3CEN");
    fields[20] = fieldE03RW3PAL =
    new CharacterField(message, HEADERSIZE + 266, 1, "E03RW3PAL");
    fields[21] = fieldE03RW3EOD =
    new DecimalField(message, HEADERSIZE + 267, 9, 0, "E03RW3EOD");
    fields[22] = fieldE03RW3DEU =
    new DecimalField(message, HEADERSIZE + 276, 22, 2, "E03RW3DEU");
    fields[23] = fieldE03NUMREG =
    new DecimalField(message, HEADERSIZE + 298, 7, 0, "E03NUMREG");
    fields[24] = fieldE03OPECDE =
    new CharacterField(message, HEADERSIZE + 305, 1, "E03OPECDE");

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
  * Set field E03CODFIL using a String value.
  */
  public void setE03CODFIL(String newvalue)
  {
    fieldE03CODFIL.setString(newvalue);
  }

  /**
  * Get value of field E03CODFIL as a String.
  */
  public String getE03CODFIL()
  {
    return fieldE03CODFIL.getString();
  }

  /**
  * Set field E03NOMFIL using a String value.
  */
  public void setE03NOMFIL(String newvalue)
  {
    fieldE03NOMFIL.setString(newvalue);
  }

  /**
  * Get value of field E03NOMFIL as a String.
  */
  public String getE03NOMFIL()
  {
    return fieldE03NOMFIL.getString();
  }

  /**
  * Set field E03ROCCUN using a String value.
  */
  public void setE03ROCCUN(String newvalue)
  {
    fieldE03ROCCUN.setString(newvalue);
  }

  /**
  * Get value of field E03ROCCUN as a String.
  */
  public String getE03ROCCUN()
  {
    return fieldE03ROCCUN.getString();
  }

  /**
  * Set numeric field E03ROCCUN using a BigDecimal value.
  */
  public void setE03ROCCUN(BigDecimal newvalue)
  {
    fieldE03ROCCUN.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E03ROCCUN as a BigDecimal.
  */
  public BigDecimal getBigDecimalE03ROCCUN()
  {
    return fieldE03ROCCUN.getBigDecimal();
  }

  /**
  * Set field E03CUSNA1 using a String value.
  */
  public void setE03CUSNA1(String newvalue)
  {
    fieldE03CUSNA1.setString(newvalue);
  }

  /**
  * Get value of field E03CUSNA1 as a String.
  */
  public String getE03CUSNA1()
  {
    return fieldE03CUSNA1.getString();
  }

  /**
  * Set field E03RW3REF using a String value.
  */
  public void setE03RW3REF(String newvalue)
  {
    fieldE03RW3REF.setString(newvalue);
  }

  /**
  * Get value of field E03RW3REF as a String.
  */
  public String getE03RW3REF()
  {
    return fieldE03RW3REF.getString();
  }

  /**
  * Set numeric field E03RW3REF using a BigDecimal value.
  */
  public void setE03RW3REF(BigDecimal newvalue)
  {
    fieldE03RW3REF.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E03RW3REF as a BigDecimal.
  */
  public BigDecimal getBigDecimalE03RW3REF()
  {
    return fieldE03RW3REF.getBigDecimal();
  }

  /**
  * Set field E03RW3NIT using a String value.
  */
  public void setE03RW3NIT(String newvalue)
  {
    fieldE03RW3NIT.setString(newvalue);
  }

  /**
  * Get value of field E03RW3NIT as a String.
  */
  public String getE03RW3NIT()
  {
    return fieldE03RW3NIT.getString();
  }

  /**
  * Set numeric field E03RW3NIT using a BigDecimal value.
  */
  public void setE03RW3NIT(BigDecimal newvalue)
  {
    fieldE03RW3NIT.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E03RW3NIT as a BigDecimal.
  */
  public BigDecimal getBigDecimalE03RW3NIT()
  {
    return fieldE03RW3NIT.getBigDecimal();
  }

  /**
  * Set field E03RW3TIP using a String value.
  */
  public void setE03RW3TIP(String newvalue)
  {
    fieldE03RW3TIP.setString(newvalue);
  }

  /**
  * Get value of field E03RW3TIP as a String.
  */
  public String getE03RW3TIP()
  {
    return fieldE03RW3TIP.getString();
  }

  /**
  * Set field E03RW3RCN using a String value.
  */
  public void setE03RW3RCN(String newvalue)
  {
    fieldE03RW3RCN.setString(newvalue);
  }

  /**
  * Get value of field E03RW3RCN as a String.
  */
  public String getE03RW3RCN()
  {
    return fieldE03RW3RCN.getString();
  }

  /**
  * Set numeric field E03RW3RCN using a BigDecimal value.
  */
  public void setE03RW3RCN(BigDecimal newvalue)
  {
    fieldE03RW3RCN.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E03RW3RCN as a BigDecimal.
  */
  public BigDecimal getBigDecimalE03RW3RCN()
  {
    return fieldE03RW3RCN.getBigDecimal();
  }

  /**
  * Set field E03RW3EMP using a String value.
  */
  public void setE03RW3EMP(String newvalue)
  {
    fieldE03RW3EMP.setString(newvalue);
  }

  /**
  * Get value of field E03RW3EMP as a String.
  */
  public String getE03RW3EMP()
  {
    return fieldE03RW3EMP.getString();
  }

  /**
  * Set field E03RW3PAR using a String value.
  */
  public void setE03RW3PAR(String newvalue)
  {
    fieldE03RW3PAR.setString(newvalue);
  }

  /**
  * Get value of field E03RW3PAR as a String.
  */
  public String getE03RW3PAR()
  {
    return fieldE03RW3PAR.getString();
  }

  /**
  * Set numeric field E03RW3PAR using a BigDecimal value.
  */
  public void setE03RW3PAR(BigDecimal newvalue)
  {
    fieldE03RW3PAR.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E03RW3PAR as a BigDecimal.
  */
  public BigDecimal getBigDecimalE03RW3PAR()
  {
    return fieldE03RW3PAR.getBigDecimal();
  }

  /**
  * Set field E03RW3CEN using a String value.
  */
  public void setE03RW3CEN(String newvalue)
  {
    fieldE03RW3CEN.setString(newvalue);
  }

  /**
  * Get value of field E03RW3CEN as a String.
  */
  public String getE03RW3CEN()
  {
    return fieldE03RW3CEN.getString();
  }

  /**
  * Set field E03RW3PAL using a String value.
  */
  public void setE03RW3PAL(String newvalue)
  {
    fieldE03RW3PAL.setString(newvalue);
  }

  /**
  * Get value of field E03RW3PAL as a String.
  */
  public String getE03RW3PAL()
  {
    return fieldE03RW3PAL.getString();
  }

  /**
  * Set field E03RW3EOD using a String value.
  */
  public void setE03RW3EOD(String newvalue)
  {
    fieldE03RW3EOD.setString(newvalue);
  }

  /**
  * Get value of field E03RW3EOD as a String.
  */
  public String getE03RW3EOD()
  {
    return fieldE03RW3EOD.getString();
  }

  /**
  * Set numeric field E03RW3EOD using a BigDecimal value.
  */
  public void setE03RW3EOD(BigDecimal newvalue)
  {
    fieldE03RW3EOD.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E03RW3EOD as a BigDecimal.
  */
  public BigDecimal getBigDecimalE03RW3EOD()
  {
    return fieldE03RW3EOD.getBigDecimal();
  }

  /**
  * Set field E03RW3DEU using a String value.
  */
  public void setE03RW3DEU(String newvalue)
  {
    fieldE03RW3DEU.setString(newvalue);
  }

  /**
  * Get value of field E03RW3DEU as a String.
  */
  public String getE03RW3DEU()
  {
    return fieldE03RW3DEU.getString();
  }

  /**
  * Set numeric field E03RW3DEU using a BigDecimal value.
  */
  public void setE03RW3DEU(BigDecimal newvalue)
  {
    fieldE03RW3DEU.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E03RW3DEU as a BigDecimal.
  */
  public BigDecimal getBigDecimalE03RW3DEU()
  {
    return fieldE03RW3DEU.getBigDecimal();
  }

  /**
  * Set field E03NUMREG using a String value.
  */
  public void setE03NUMREG(String newvalue)
  {
    fieldE03NUMREG.setString(newvalue);
  }

  /**
  * Get value of field E03NUMREG as a String.
  */
  public String getE03NUMREG()
  {
    return fieldE03NUMREG.getString();
  }

  /**
  * Set numeric field E03NUMREG using a BigDecimal value.
  */
  public void setE03NUMREG(BigDecimal newvalue)
  {
    fieldE03NUMREG.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E03NUMREG as a BigDecimal.
  */
  public BigDecimal getBigDecimalE03NUMREG()
  {
    return fieldE03NUMREG.getBigDecimal();
  }

  /**
  * Set field E03OPECDE using a String value.
  */
  public void setE03OPECDE(String newvalue)
  {
    fieldE03OPECDE.setString(newvalue);
  }

  /**
  * Get value of field E03OPECDE as a String.
  */
  public String getE03OPECDE()
  {
    return fieldE03OPECDE.getString();
  }

}