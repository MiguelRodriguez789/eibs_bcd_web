package datapro.eibs.beans;

import datapro.eibs.sockets.*;
import java.io.*;
import java.math.*;

import java.util.*;

/**
* Class generated by AS/400 CRTCLASS command from ERP000001 physical file definition.
* 
* File level identifier is 1160810131325.
* Record format level identifier is 49D2865A300C4.
*/

public class ERP000001Message extends MessageRecord
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
                                     "E01IBSRPN",
                                     "E01IBSLIF",
                                     "E01IBSDSC",
                                     "E01IBSMOD",
                                     "E01IBSPER",
                                     "E01IBSPRG",
                                     "E01IBSPRM",
                                     "D01USRDSC",
                                     "D01MODDSC",
                                     "E01CDM",
                                     "E01CDD",
                                     "E01CDY",
                                     "E01CTM",
                                     "E01CUS",
                                     "E01MDM",
                                     "E01MDD",
                                     "E01MDY",
                                     "E01MTM",
                                     "E01MUS",
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
                                   "E01IBSRPN",
                                   "E01IBSLIF",
                                   "E01IBSDSC",
                                   "E01IBSMOD",
                                   "E01IBSPER",
                                   "E01IBSPRG",
                                   "E01IBSPRM",
                                   "D01USRDSC",
                                   "D01MODDSC",
                                   "E01CDM",
                                   "E01CDD",
                                   "E01CDY",
                                   "E01CTM",
                                   "E01CUS",
                                   "E01MDM",
                                   "E01MDD",
                                   "E01MDY",
                                   "E01MTM",
                                   "E01MUS",
                                   "E01NUMREC",
                                   "E01INDOPE"
                                 };
  final static String fid = "1160810131325";
  final static String rid = "49D2865A300C4";
  final static String fmtname = "ERP000001";
  final int FIELDCOUNT = 30;
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
  private CharacterField fieldE01IBSRPN = null;
  private CharacterField fieldE01IBSLIF = null;
  private CharacterField fieldE01IBSDSC = null;
  private CharacterField fieldE01IBSMOD = null;
  private CharacterField fieldE01IBSPER = null;
  private CharacterField fieldE01IBSPRG = null;
  private CharacterField fieldE01IBSPRM = null;
  private CharacterField fieldD01USRDSC = null;
  private CharacterField fieldD01MODDSC = null;
  private DecimalField fieldE01CDM = null;
  private DecimalField fieldE01CDD = null;
  private DecimalField fieldE01CDY = null;
  private CharacterField fieldE01CTM = null;
  private CharacterField fieldE01CUS = null;
  private DecimalField fieldE01MDM = null;
  private DecimalField fieldE01MDD = null;
  private DecimalField fieldE01MDY = null;
  private CharacterField fieldE01MTM = null;
  private CharacterField fieldE01MUS = null;
  private DecimalField fieldE01NUMREC = null;
  private CharacterField fieldE01INDOPE = null;

  /**
  * Constructor for ERP000001Message.
  */
  public ERP000001Message()
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
    recordsize = 310;
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
    fields[9] = fieldE01IBSRPN =
    new CharacterField(message, HEADERSIZE + 42, 10, "E01IBSRPN");
    fields[10] = fieldE01IBSLIF =
    new CharacterField(message, HEADERSIZE + 52, 1, "E01IBSLIF");
    fields[11] = fieldE01IBSDSC =
    new CharacterField(message, HEADERSIZE + 53, 50, "E01IBSDSC");
    fields[12] = fieldE01IBSMOD =
    new CharacterField(message, HEADERSIZE + 103, 2, "E01IBSMOD");
    fields[13] = fieldE01IBSPER =
    new CharacterField(message, HEADERSIZE + 105, 1, "E01IBSPER");
    fields[14] = fieldE01IBSPRG =
    new CharacterField(message, HEADERSIZE + 106, 10, "E01IBSPRG");
    fields[15] = fieldE01IBSPRM =
    new CharacterField(message, HEADERSIZE + 116, 1, "E01IBSPRM");
    fields[16] = fieldD01USRDSC =
    new CharacterField(message, HEADERSIZE + 117, 45, "D01USRDSC");
    fields[17] = fieldD01MODDSC =
    new CharacterField(message, HEADERSIZE + 162, 45, "D01MODDSC");
    fields[18] = fieldE01CDM =
    new DecimalField(message, HEADERSIZE + 207, 3, 0, "E01CDM");
    fields[19] = fieldE01CDD =
    new DecimalField(message, HEADERSIZE + 210, 3, 0, "E01CDD");
    fields[20] = fieldE01CDY =
    new DecimalField(message, HEADERSIZE + 213, 5, 0, "E01CDY");
    fields[21] = fieldE01CTM =
    new CharacterField(message, HEADERSIZE + 218, 26, "E01CTM");
    fields[22] = fieldE01CUS =
    new CharacterField(message, HEADERSIZE + 244, 10, "E01CUS");
    fields[23] = fieldE01MDM =
    new DecimalField(message, HEADERSIZE + 254, 3, 0, "E01MDM");
    fields[24] = fieldE01MDD =
    new DecimalField(message, HEADERSIZE + 257, 3, 0, "E01MDD");
    fields[25] = fieldE01MDY =
    new DecimalField(message, HEADERSIZE + 260, 5, 0, "E01MDY");
    fields[26] = fieldE01MTM =
    new CharacterField(message, HEADERSIZE + 265, 26, "E01MTM");
    fields[27] = fieldE01MUS =
    new CharacterField(message, HEADERSIZE + 291, 10, "E01MUS");
    fields[28] = fieldE01NUMREC =
    new DecimalField(message, HEADERSIZE + 301, 8, 0, "E01NUMREC");
    fields[29] = fieldE01INDOPE =
    new CharacterField(message, HEADERSIZE + 309, 1, "E01INDOPE");

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
  * Set field E01IBSRPN using a String value.
  */
  public void setE01IBSRPN(String newvalue)
  {
    fieldE01IBSRPN.setString(newvalue);
  }

  /**
  * Get value of field E01IBSRPN as a String.
  */
  public String getE01IBSRPN()
  {
    return fieldE01IBSRPN.getString();
  }

  /**
  * Set field E01IBSLIF using a String value.
  */
  public void setE01IBSLIF(String newvalue)
  {
    fieldE01IBSLIF.setString(newvalue);
  }

  /**
  * Get value of field E01IBSLIF as a String.
  */
  public String getE01IBSLIF()
  {
    return fieldE01IBSLIF.getString();
  }

  /**
  * Set field E01IBSDSC using a String value.
  */
  public void setE01IBSDSC(String newvalue)
  {
    fieldE01IBSDSC.setString(newvalue);
  }

  /**
  * Get value of field E01IBSDSC as a String.
  */
  public String getE01IBSDSC()
  {
    return fieldE01IBSDSC.getString();
  }

  /**
  * Set field E01IBSMOD using a String value.
  */
  public void setE01IBSMOD(String newvalue)
  {
    fieldE01IBSMOD.setString(newvalue);
  }

  /**
  * Get value of field E01IBSMOD as a String.
  */
  public String getE01IBSMOD()
  {
    return fieldE01IBSMOD.getString();
  }

  /**
  * Set field E01IBSPER using a String value.
  */
  public void setE01IBSPER(String newvalue)
  {
    fieldE01IBSPER.setString(newvalue);
  }

  /**
  * Get value of field E01IBSPER as a String.
  */
  public String getE01IBSPER()
  {
    return fieldE01IBSPER.getString();
  }

  /**
  * Set field E01IBSPRG using a String value.
  */
  public void setE01IBSPRG(String newvalue)
  {
    fieldE01IBSPRG.setString(newvalue);
  }

  /**
  * Get value of field E01IBSPRG as a String.
  */
  public String getE01IBSPRG()
  {
    return fieldE01IBSPRG.getString();
  }

  /**
  * Set field E01IBSPRM using a String value.
  */
  public void setE01IBSPRM(String newvalue)
  {
    fieldE01IBSPRM.setString(newvalue);
  }

  /**
  * Get value of field E01IBSPRM as a String.
  */
  public String getE01IBSPRM()
  {
    return fieldE01IBSPRM.getString();
  }

  /**
  * Set field D01USRDSC using a String value.
  */
  public void setD01USRDSC(String newvalue)
  {
    fieldD01USRDSC.setString(newvalue);
  }

  /**
  * Get value of field D01USRDSC as a String.
  */
  public String getD01USRDSC()
  {
    return fieldD01USRDSC.getString();
  }

  /**
  * Set field D01MODDSC using a String value.
  */
  public void setD01MODDSC(String newvalue)
  {
    fieldD01MODDSC.setString(newvalue);
  }

  /**
  * Get value of field D01MODDSC as a String.
  */
  public String getD01MODDSC()
  {
    return fieldD01MODDSC.getString();
  }

  /**
  * Set field E01CDM using a String value.
  */
  public void setE01CDM(String newvalue)
  {
    fieldE01CDM.setString(newvalue);
  }

  /**
  * Get value of field E01CDM as a String.
  */
  public String getE01CDM()
  {
    return fieldE01CDM.getString();
  }

  /**
  * Set numeric field E01CDM using a BigDecimal value.
  */
  public void setE01CDM(BigDecimal newvalue)
  {
    fieldE01CDM.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01CDM as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01CDM()
  {
    return fieldE01CDM.getBigDecimal();
  }

  /**
  * Set field E01CDD using a String value.
  */
  public void setE01CDD(String newvalue)
  {
    fieldE01CDD.setString(newvalue);
  }

  /**
  * Get value of field E01CDD as a String.
  */
  public String getE01CDD()
  {
    return fieldE01CDD.getString();
  }

  /**
  * Set numeric field E01CDD using a BigDecimal value.
  */
  public void setE01CDD(BigDecimal newvalue)
  {
    fieldE01CDD.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01CDD as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01CDD()
  {
    return fieldE01CDD.getBigDecimal();
  }

  /**
  * Set field E01CDY using a String value.
  */
  public void setE01CDY(String newvalue)
  {
    fieldE01CDY.setString(newvalue);
  }

  /**
  * Get value of field E01CDY as a String.
  */
  public String getE01CDY()
  {
    return fieldE01CDY.getString();
  }

  /**
  * Set numeric field E01CDY using a BigDecimal value.
  */
  public void setE01CDY(BigDecimal newvalue)
  {
    fieldE01CDY.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01CDY as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01CDY()
  {
    return fieldE01CDY.getBigDecimal();
  }

  /**
  * Set field E01CTM using a String value.
  */
  public void setE01CTM(String newvalue)
  {
    fieldE01CTM.setString(newvalue);
  }

  /**
  * Get value of field E01CTM as a String.
  */
  public String getE01CTM()
  {
    return fieldE01CTM.getString();
  }

  /**
  * Set field E01CUS using a String value.
  */
  public void setE01CUS(String newvalue)
  {
    fieldE01CUS.setString(newvalue);
  }

  /**
  * Get value of field E01CUS as a String.
  */
  public String getE01CUS()
  {
    return fieldE01CUS.getString();
  }

  /**
  * Set field E01MDM using a String value.
  */
  public void setE01MDM(String newvalue)
  {
    fieldE01MDM.setString(newvalue);
  }

  /**
  * Get value of field E01MDM as a String.
  */
  public String getE01MDM()
  {
    return fieldE01MDM.getString();
  }

  /**
  * Set numeric field E01MDM using a BigDecimal value.
  */
  public void setE01MDM(BigDecimal newvalue)
  {
    fieldE01MDM.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01MDM as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01MDM()
  {
    return fieldE01MDM.getBigDecimal();
  }

  /**
  * Set field E01MDD using a String value.
  */
  public void setE01MDD(String newvalue)
  {
    fieldE01MDD.setString(newvalue);
  }

  /**
  * Get value of field E01MDD as a String.
  */
  public String getE01MDD()
  {
    return fieldE01MDD.getString();
  }

  /**
  * Set numeric field E01MDD using a BigDecimal value.
  */
  public void setE01MDD(BigDecimal newvalue)
  {
    fieldE01MDD.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01MDD as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01MDD()
  {
    return fieldE01MDD.getBigDecimal();
  }

  /**
  * Set field E01MDY using a String value.
  */
  public void setE01MDY(String newvalue)
  {
    fieldE01MDY.setString(newvalue);
  }

  /**
  * Get value of field E01MDY as a String.
  */
  public String getE01MDY()
  {
    return fieldE01MDY.getString();
  }

  /**
  * Set numeric field E01MDY using a BigDecimal value.
  */
  public void setE01MDY(BigDecimal newvalue)
  {
    fieldE01MDY.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01MDY as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01MDY()
  {
    return fieldE01MDY.getBigDecimal();
  }

  /**
  * Set field E01MTM using a String value.
  */
  public void setE01MTM(String newvalue)
  {
    fieldE01MTM.setString(newvalue);
  }

  /**
  * Get value of field E01MTM as a String.
  */
  public String getE01MTM()
  {
    return fieldE01MTM.getString();
  }

  /**
  * Set field E01MUS using a String value.
  */
  public void setE01MUS(String newvalue)
  {
    fieldE01MUS.setString(newvalue);
  }

  /**
  * Get value of field E01MUS as a String.
  */
  public String getE01MUS()
  {
    return fieldE01MUS.getString();
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
