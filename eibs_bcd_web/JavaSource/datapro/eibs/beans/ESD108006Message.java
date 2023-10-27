package datapro.eibs.beans;

import datapro.eibs.sockets.*;
import java.io.*;
import java.math.*;

import java.util.*;

/**
* Class generated by AS/400 CRTCLASS command from ESD108006 physical file definition.
* 
* File level identifier is 1140703131554.
* Record format level identifier is 4724E27B63B4C.
*/

public class ESD108006Message extends MessageRecord
{
  final static String fldnames[] = {
                                     "H06USERID",
                                     "H06PROGRM",
                                     "H06TIMSYS",
                                     "H06SCRCOD",
                                     "H06OPECOD",
                                     "H06FLGMAS",
                                     "H06FLGWK1",
                                     "H06FLGWK2",
                                     "H06FLGWK3",
                                     "E06ACT",
                                     "E06SELCUN",
                                     "E06SELACD", 
                                     "E06SELTYP",
                                     "E06SELPRO",
                                     "E06ACCNUM",
                                     "E06BNKNUM",
                                     "E06BRNNUM",
                                     "E06CCYCDE",
                                     "E06ACCTYP",
                                     "E06PROCDE",
                                     "E06PRIAMN",
                                     "E06INTAMN",
                                     "E06OTHAMN",
                                     "E06TOTAMN",
                                     "E06ACCSTS",
                                     "E06OPEDTM",
                                     "E06OPEDTD",
                                     "E06OPEDTY",
                                     "E06OFFICR",
                                     "D06PRD",
                                     "D06BRN",
                                     "D06ACD",
                                     "D06OFC",
                                     "E06NUMREC",
                                     "E06INDOPE"
                                   };
  final static String tnames[] = {
                                   "H06USERID",
                                   "H06PROGRM",
                                   "H06TIMSYS",
                                   "H06SCRCOD",
                                   "H06OPECOD",
                                   "H06FLGMAS",
                                   "H06FLGWK1",
                                   "H06FLGWK2",
                                   "H06FLGWK3",
                                   "E06ACT",
                                   "E06SELCUN",
                                   "E06SELACD",
                                   "E06SELTYP",
                                   "E06SELPRO",
                                   "E06ACCNUM",
                                   "E06BNKNUM",
                                   "E06BRNNUM",
                                   "E06CCYCDE",
                                   "E06ACCTYP",
                                   "E06PROCDE",
                                   "E06PRIAMN",
                                   "E06INTAMN",
                                   "E06OTHAMN",
                                   "E06TOTAMN",
                                   "E06ACCSTS",
                                   "E06OPEDTM",
                                   "E06OPEDTD",
                                   "E06OPEDTY",
                                   "E06OFFICR",
                                   "D06PRD",
                                   "D06BRN",
                                   "D06ACD",
                                   "D06OFC",
                                   "E06NUMREC",
                                   "E06INDOPE"
                                 };
  final static String fid = "1140703131554";
  final static String rid = "4724E27B63B4C";
  final static String fmtname = "ESD108006";
  final int FIELDCOUNT = 35;
  private static Hashtable tlookup = new Hashtable();
  private CharacterField fieldH06USERID = null;
  private CharacterField fieldH06PROGRM = null;
  private CharacterField fieldH06TIMSYS = null;
  private CharacterField fieldH06SCRCOD = null;
  private CharacterField fieldH06OPECOD = null;
  private CharacterField fieldH06FLGMAS = null;
  private CharacterField fieldH06FLGWK1 = null;
  private CharacterField fieldH06FLGWK2 = null;
  private CharacterField fieldH06FLGWK3 = null;
  private CharacterField fieldE06ACT = null;
  private DecimalField fieldE06SELCUN = null;
  private CharacterField fieldE06SELACD = null;
  private CharacterField fieldE06SELTYP = null;
  private CharacterField fieldE06SELPRO = null;
  private DecimalField fieldE06ACCNUM = null;
  private CharacterField fieldE06BNKNUM = null;
  private DecimalField fieldE06BRNNUM = null;
  private CharacterField fieldE06CCYCDE = null;
  private CharacterField fieldE06ACCTYP = null;
  private CharacterField fieldE06PROCDE = null;
  private DecimalField fieldE06PRIAMN = null;
  private DecimalField fieldE06INTAMN = null;
  private DecimalField fieldE06OTHAMN = null;
  private DecimalField fieldE06TOTAMN = null;
  private CharacterField fieldE06ACCSTS = null;
  private DecimalField fieldE06OPEDTM = null;
  private DecimalField fieldE06OPEDTD = null;
  private DecimalField fieldE06OPEDTY = null;
  private CharacterField fieldE06OFFICR = null;
  private CharacterField fieldD06PRD = null;
  private CharacterField fieldD06BRN = null;
  private CharacterField fieldD06ACD = null;
  private CharacterField fieldD06OFC = null;
  private DecimalField fieldE06NUMREC = null;
  private CharacterField fieldE06INDOPE = null;

  /**
  * Constructor for ESD108006Message.
  */
  public ESD108006Message()
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
    recordsize = 411;
    fileid = fid;
    recordid = rid;
    message = new byte[getByteLength()];
    formatname = fmtname;
    fieldnames = fldnames;
    tagnames = tnames;
    fields = new MessageField[FIELDCOUNT];

    fields[0] = fieldH06USERID =
    new CharacterField(message, HEADERSIZE + 0, 10, "H06USERID");
    fields[1] = fieldH06PROGRM =
    new CharacterField(message, HEADERSIZE + 10, 10, "H06PROGRM");
    fields[2] = fieldH06TIMSYS =
    new CharacterField(message, HEADERSIZE + 20, 12, "H06TIMSYS");
    fields[3] = fieldH06SCRCOD =
    new CharacterField(message, HEADERSIZE + 32, 2, "H06SCRCOD");
    fields[4] = fieldH06OPECOD =
    new CharacterField(message, HEADERSIZE + 34, 4, "H06OPECOD");
    fields[5] = fieldH06FLGMAS =
    new CharacterField(message, HEADERSIZE + 38, 1, "H06FLGMAS");
    fields[6] = fieldH06FLGWK1 =
    new CharacterField(message, HEADERSIZE + 39, 1, "H06FLGWK1");
    fields[7] = fieldH06FLGWK2 =
    new CharacterField(message, HEADERSIZE + 40, 1, "H06FLGWK2");
    fields[8] = fieldH06FLGWK3 =
    new CharacterField(message, HEADERSIZE + 41, 1, "H06FLGWK3");
    fields[9] = fieldE06ACT =
    new CharacterField(message, HEADERSIZE + 42, 1, "E06ACT");
    fields[10] = fieldE06SELCUN =
    new DecimalField(message, HEADERSIZE + 43, 10, 0, "E06SELCUN");
    fields[11] = fieldE06SELACD =
    new CharacterField(message, HEADERSIZE + 53, 2, "E06SELACD");
    fields[12] = fieldE06SELTYP =
    new CharacterField(message, HEADERSIZE + 55, 4, "E06SELTYP");
    fields[13] = fieldE06SELPRO =
    new CharacterField(message, HEADERSIZE + 59, 4, "E06SELPRO");
    fields[14] = fieldE06ACCNUM =
    new DecimalField(message, HEADERSIZE + 63, 13, 0, "E06ACCNUM");
    fields[15] = fieldE06BNKNUM =
    new CharacterField(message, HEADERSIZE + 76, 2, "E06BNKNUM");
    fields[16] = fieldE06BRNNUM =
    new DecimalField(message, HEADERSIZE + 78, 5, 0, "E06BRNNUM");
    fields[17] = fieldE06CCYCDE =
    new CharacterField(message, HEADERSIZE + 83, 3, "E06CCYCDE");
    fields[18] = fieldE06ACCTYP =
    new CharacterField(message, HEADERSIZE + 86, 4, "E06ACCTYP");
    fields[19] = fieldE06PROCDE =
    new CharacterField(message, HEADERSIZE + 90, 4, "E06PROCDE");
    fields[20] = fieldE06PRIAMN =
    new DecimalField(message, HEADERSIZE + 94, 17, 2, "E06PRIAMN");
    fields[21] = fieldE06INTAMN =
    new DecimalField(message, HEADERSIZE + 111, 17, 2, "E06INTAMN");
    fields[22] = fieldE06OTHAMN =
    new DecimalField(message, HEADERSIZE + 128, 17, 2, "E06OTHAMN");
    fields[23] = fieldE06TOTAMN =
    new DecimalField(message, HEADERSIZE + 145, 17, 2, "E06TOTAMN");
    fields[24] = fieldE06ACCSTS =
    new CharacterField(message, HEADERSIZE + 162, 45, "E06ACCSTS");
    fields[25] = fieldE06OPEDTM =
    new DecimalField(message, HEADERSIZE + 207, 3, 0, "E06OPEDTM");
    fields[26] = fieldE06OPEDTD =
    new DecimalField(message, HEADERSIZE + 210, 3, 0, "E06OPEDTD");
    fields[27] = fieldE06OPEDTY =
    new DecimalField(message, HEADERSIZE + 213, 5, 0, "E06OPEDTY");
    fields[28] = fieldE06OFFICR =
    new CharacterField(message, HEADERSIZE + 218, 4, "E06OFFICR");
    fields[29] = fieldD06PRD =
    new CharacterField(message, HEADERSIZE + 222, 45, "D06PRD");
    fields[30] = fieldD06BRN =
    new CharacterField(message, HEADERSIZE + 267, 45, "D06BRN");
    fields[31] = fieldD06ACD =
    new CharacterField(message, HEADERSIZE + 312, 45, "D06ACD");
    fields[32] = fieldD06OFC =
    new CharacterField(message, HEADERSIZE + 357, 45, "D06OFC");
    fields[33] = fieldE06NUMREC =
    new DecimalField(message, HEADERSIZE + 402, 8, 0, "E06NUMREC");
    fields[34] = fieldE06INDOPE =
    new CharacterField(message, HEADERSIZE + 410, 1, "E06INDOPE");

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
  * Set field H06USERID using a String value.
  */
  public void setH06USERID(String newvalue)
  {
    fieldH06USERID.setString(newvalue);
  }

  /**
  * Get value of field H06USERID as a String.
  */
  public String getH06USERID()
  {
    return fieldH06USERID.getString();
  }

  /**
  * Set field H06PROGRM using a String value.
  */
  public void setH06PROGRM(String newvalue)
  {
    fieldH06PROGRM.setString(newvalue);
  }

  /**
  * Get value of field H06PROGRM as a String.
  */
  public String getH06PROGRM()
  {
    return fieldH06PROGRM.getString();
  }

  /**
  * Set field H06TIMSYS using a String value.
  */
  public void setH06TIMSYS(String newvalue)
  {
    fieldH06TIMSYS.setString(newvalue);
  }

  /**
  * Get value of field H06TIMSYS as a String.
  */
  public String getH06TIMSYS()
  {
    return fieldH06TIMSYS.getString();
  }

  /**
  * Set field H06SCRCOD using a String value.
  */
  public void setH06SCRCOD(String newvalue)
  {
    fieldH06SCRCOD.setString(newvalue);
  }

  /**
  * Get value of field H06SCRCOD as a String.
  */
  public String getH06SCRCOD()
  {
    return fieldH06SCRCOD.getString();
  }

  /**
  * Set field H06OPECOD using a String value.
  */
  public void setH06OPECOD(String newvalue)
  {
    fieldH06OPECOD.setString(newvalue);
  }

  /**
  * Get value of field H06OPECOD as a String.
  */
  public String getH06OPECOD()
  {
    return fieldH06OPECOD.getString();
  }

  /**
  * Set field H06FLGMAS using a String value.
  */
  public void setH06FLGMAS(String newvalue)
  {
    fieldH06FLGMAS.setString(newvalue);
  }

  /**
  * Get value of field H06FLGMAS as a String.
  */
  public String getH06FLGMAS()
  {
    return fieldH06FLGMAS.getString();
  }

  /**
  * Set field H06FLGWK1 using a String value.
  */
  public void setH06FLGWK1(String newvalue)
  {
    fieldH06FLGWK1.setString(newvalue);
  }

  /**
  * Get value of field H06FLGWK1 as a String.
  */
  public String getH06FLGWK1()
  {
    return fieldH06FLGWK1.getString();
  }

  /**
  * Set field H06FLGWK2 using a String value.
  */
  public void setH06FLGWK2(String newvalue)
  {
    fieldH06FLGWK2.setString(newvalue);
  }

  /**
  * Get value of field H06FLGWK2 as a String.
  */
  public String getH06FLGWK2()
  {
    return fieldH06FLGWK2.getString();
  }

  /**
  * Set field H06FLGWK3 using a String value.
  */
  public void setH06FLGWK3(String newvalue)
  {
    fieldH06FLGWK3.setString(newvalue);
  }

  /**
  * Get value of field H06FLGWK3 as a String.
  */
  public String getH06FLGWK3()
  {
    return fieldH06FLGWK3.getString();
  }

  /**
  * Set field E06ACT using a String value.
  */
  public void setE06ACT(String newvalue)
  {
    fieldE06ACT.setString(newvalue);
  }

  /**
  * Get value of field E06ACT as a String.
  */
  public String getE06ACT()
  {
    return fieldE06ACT.getString();
  }

  /**
  * Set field E06SELCUN using a String value.
  */
  public void setE06SELCUN(String newvalue)
  {
    fieldE06SELCUN.setString(newvalue);
  }

  /**
  * Get value of field E06SELCUN as a String.
  */
  public String getE06SELCUN()
  {
    return fieldE06SELCUN.getString();
  }

  /**
  * Set numeric field E06SELCUN using a BigDecimal value.
  */
  public void setE06SELCUN(BigDecimal newvalue)
  {
    fieldE06SELCUN.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E06SELCUN as a BigDecimal.
  */
  public BigDecimal getBigDecimalE06SELCUN()
  {
    return fieldE06SELCUN.getBigDecimal();
  }

  /**
  * Set field E06SELACD using a String value.
  */
  public void setE06SELACD(String newvalue)
  {
    fieldE06SELACD.setString(newvalue);
  }

  /**
  * Get value of field E06SELACD as a String.
  */
  public String getE06SELACD()
  {
    return fieldE06SELACD.getString();
  }

  /**
  * Set field E06SELTYP using a String value.
  */
  public void setE06SELTYP(String newvalue)
  {
    fieldE06SELTYP.setString(newvalue);
  }

  /**
  * Get value of field E06SELTYP as a String.
  */
  public String getE06SELTYP()
  {
    return fieldE06SELTYP.getString();
  }

  /**
  * Set field E06SELPRO using a String value.
  */
  public void setE06SELPRO(String newvalue)
  {
    fieldE06SELPRO.setString(newvalue);
  }

  /**
  * Get value of field E06SELPRO as a String.
  */
  public String getE06SELPRO()
  {
    return fieldE06SELPRO.getString();
  }

  /**
  * Set field E06ACCNUM using a String value.
  */
  public void setE06ACCNUM(String newvalue)
  {
    fieldE06ACCNUM.setString(newvalue);
  }

  /**
  * Get value of field E06ACCNUM as a String.
  */
  public String getE06ACCNUM()
  {
    return fieldE06ACCNUM.getString();
  }

  /**
  * Set numeric field E06ACCNUM using a BigDecimal value.
  */
  public void setE06ACCNUM(BigDecimal newvalue)
  {
    fieldE06ACCNUM.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E06ACCNUM as a BigDecimal.
  */
  public BigDecimal getBigDecimalE06ACCNUM()
  {
    return fieldE06ACCNUM.getBigDecimal();
  }

  /**
  * Set field E06BNKNUM using a String value.
  */
  public void setE06BNKNUM(String newvalue)
  {
    fieldE06BNKNUM.setString(newvalue);
  }

  /**
  * Get value of field E06BNKNUM as a String.
  */
  public String getE06BNKNUM()
  {
    return fieldE06BNKNUM.getString();
  }

  /**
  * Set field E06BRNNUM using a String value.
  */
  public void setE06BRNNUM(String newvalue)
  {
    fieldE06BRNNUM.setString(newvalue);
  }

  /**
  * Get value of field E06BRNNUM as a String.
  */
  public String getE06BRNNUM()
  {
    return fieldE06BRNNUM.getString();
  }

  /**
  * Set numeric field E06BRNNUM using a BigDecimal value.
  */
  public void setE06BRNNUM(BigDecimal newvalue)
  {
    fieldE06BRNNUM.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E06BRNNUM as a BigDecimal.
  */
  public BigDecimal getBigDecimalE06BRNNUM()
  {
    return fieldE06BRNNUM.getBigDecimal();
  }

  /**
  * Set field E06CCYCDE using a String value.
  */
  public void setE06CCYCDE(String newvalue)
  {
    fieldE06CCYCDE.setString(newvalue);
  }

  /**
  * Get value of field E06CCYCDE as a String.
  */
  public String getE06CCYCDE()
  {
    return fieldE06CCYCDE.getString();
  }

  /**
  * Set field E06ACCTYP using a String value.
  */
  public void setE06ACCTYP(String newvalue)
  {
    fieldE06ACCTYP.setString(newvalue);
  }

  /**
  * Get value of field E06ACCTYP as a String.
  */
  public String getE06ACCTYP()
  {
    return fieldE06ACCTYP.getString();
  }

  /**
  * Set field E06PROCDE using a String value.
  */
  public void setE06PROCDE(String newvalue)
  {
    fieldE06PROCDE.setString(newvalue);
  }

  /**
  * Get value of field E06PROCDE as a String.
  */
  public String getE06PROCDE()
  {
    return fieldE06PROCDE.getString();
  }

  /**
  * Set field E06PRIAMN using a String value.
  */
  public void setE06PRIAMN(String newvalue)
  {
    fieldE06PRIAMN.setString(newvalue);
  }

  /**
  * Get value of field E06PRIAMN as a String.
  */
  public String getE06PRIAMN()
  {
    return fieldE06PRIAMN.getString();
  }

  /**
  * Set numeric field E06PRIAMN using a BigDecimal value.
  */
  public void setE06PRIAMN(BigDecimal newvalue)
  {
    fieldE06PRIAMN.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E06PRIAMN as a BigDecimal.
  */
  public BigDecimal getBigDecimalE06PRIAMN()
  {
    return fieldE06PRIAMN.getBigDecimal();
  }

  /**
  * Set field E06INTAMN using a String value.
  */
  public void setE06INTAMN(String newvalue)
  {
    fieldE06INTAMN.setString(newvalue);
  }

  /**
  * Get value of field E06INTAMN as a String.
  */
  public String getE06INTAMN()
  {
    return fieldE06INTAMN.getString();
  }

  /**
  * Set numeric field E06INTAMN using a BigDecimal value.
  */
  public void setE06INTAMN(BigDecimal newvalue)
  {
    fieldE06INTAMN.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E06INTAMN as a BigDecimal.
  */
  public BigDecimal getBigDecimalE06INTAMN()
  {
    return fieldE06INTAMN.getBigDecimal();
  }

  /**
  * Set field E06OTHAMN using a String value.
  */
  public void setE06OTHAMN(String newvalue)
  {
    fieldE06OTHAMN.setString(newvalue);
  }

  /**
  * Get value of field E06OTHAMN as a String.
  */
  public String getE06OTHAMN()
  {
    return fieldE06OTHAMN.getString();
  }

  /**
  * Set numeric field E06OTHAMN using a BigDecimal value.
  */
  public void setE06OTHAMN(BigDecimal newvalue)
  {
    fieldE06OTHAMN.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E06OTHAMN as a BigDecimal.
  */
  public BigDecimal getBigDecimalE06OTHAMN()
  {
    return fieldE06OTHAMN.getBigDecimal();
  }

  /**
  * Set field E06TOTAMN using a String value.
  */
  public void setE06TOTAMN(String newvalue)
  {
    fieldE06TOTAMN.setString(newvalue);
  }

  /**
  * Get value of field E06TOTAMN as a String.
  */
  public String getE06TOTAMN()
  {
    return fieldE06TOTAMN.getString();
  }

  /**
  * Set numeric field E06TOTAMN using a BigDecimal value.
  */
  public void setE06TOTAMN(BigDecimal newvalue)
  {
    fieldE06TOTAMN.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E06TOTAMN as a BigDecimal.
  */
  public BigDecimal getBigDecimalE06TOTAMN()
  {
    return fieldE06TOTAMN.getBigDecimal();
  }

  /**
  * Set field E06ACCSTS using a String value.
  */
  public void setE06ACCSTS(String newvalue)
  {
    fieldE06ACCSTS.setString(newvalue);
  }

  /**
  * Get value of field E06ACCSTS as a String.
  */
  public String getE06ACCSTS()
  {
    return fieldE06ACCSTS.getString();
  }

  /**
  * Set field E06OPEDTM using a String value.
  */
  public void setE06OPEDTM(String newvalue)
  {
    fieldE06OPEDTM.setString(newvalue);
  }

  /**
  * Get value of field E06OPEDTM as a String.
  */
  public String getE06OPEDTM()
  {
    return fieldE06OPEDTM.getString();
  }

  /**
  * Set numeric field E06OPEDTM using a BigDecimal value.
  */
  public void setE06OPEDTM(BigDecimal newvalue)
  {
    fieldE06OPEDTM.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E06OPEDTM as a BigDecimal.
  */
  public BigDecimal getBigDecimalE06OPEDTM()
  {
    return fieldE06OPEDTM.getBigDecimal();
  }

  /**
  * Set field E06OPEDTD using a String value.
  */
  public void setE06OPEDTD(String newvalue)
  {
    fieldE06OPEDTD.setString(newvalue);
  }

  /**
  * Get value of field E06OPEDTD as a String.
  */
  public String getE06OPEDTD()
  {
    return fieldE06OPEDTD.getString();
  }

  /**
  * Set numeric field E06OPEDTD using a BigDecimal value.
  */
  public void setE06OPEDTD(BigDecimal newvalue)
  {
    fieldE06OPEDTD.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E06OPEDTD as a BigDecimal.
  */
  public BigDecimal getBigDecimalE06OPEDTD()
  {
    return fieldE06OPEDTD.getBigDecimal();
  }

  /**
  * Set field E06OPEDTY using a String value.
  */
  public void setE06OPEDTY(String newvalue)
  {
    fieldE06OPEDTY.setString(newvalue);
  }

  /**
  * Get value of field E06OPEDTY as a String.
  */
  public String getE06OPEDTY()
  {
    return fieldE06OPEDTY.getString();
  }

  /**
  * Set numeric field E06OPEDTY using a BigDecimal value.
  */
  public void setE06OPEDTY(BigDecimal newvalue)
  {
    fieldE06OPEDTY.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E06OPEDTY as a BigDecimal.
  */
  public BigDecimal getBigDecimalE06OPEDTY()
  {
    return fieldE06OPEDTY.getBigDecimal();
  }

  /**
  * Set field E06OFFICR using a String value.
  */
  public void setE06OFFICR(String newvalue)
  {
    fieldE06OFFICR.setString(newvalue);
  }

  /**
  * Get value of field E06OFFICR as a String.
  */
  public String getE06OFFICR()
  {
    return fieldE06OFFICR.getString();
  }

  /**
  * Set field D06PRD using a String value.
  */
  public void setD06PRD(String newvalue)
  {
    fieldD06PRD.setString(newvalue);
  }

  /**
  * Get value of field D06PRD as a String.
  */
  public String getD06PRD()
  {
    return fieldD06PRD.getString();
  }

  /**
  * Set field D06BRN using a String value.
  */
  public void setD06BRN(String newvalue)
  {
    fieldD06BRN.setString(newvalue);
  }

  /**
  * Get value of field D06BRN as a String.
  */
  public String getD06BRN()
  {
    return fieldD06BRN.getString();
  }

  /**
  * Set field D06ACD using a String value.
  */
  public void setD06ACD(String newvalue)
  {
    fieldD06ACD.setString(newvalue);
  }

  /**
  * Get value of field D06ACD as a String.
  */
  public String getD06ACD()
  {
    return fieldD06ACD.getString();
  }

  /**
  * Set field D06OFC using a String value.
  */
  public void setD06OFC(String newvalue)
  {
    fieldD06OFC.setString(newvalue);
  }

  /**
  * Get value of field D06OFC as a String.
  */
  public String getD06OFC()
  {
    return fieldD06OFC.getString();
  }

  /**
  * Set field E06NUMREC using a String value.
  */
  public void setE06NUMREC(String newvalue)
  {
    fieldE06NUMREC.setString(newvalue);
  }

  /**
  * Get value of field E06NUMREC as a String.
  */
  public String getE06NUMREC()
  {
    return fieldE06NUMREC.getString();
  }

  /**
  * Set numeric field E06NUMREC using a BigDecimal value.
  */
  public void setE06NUMREC(BigDecimal newvalue)
  {
    fieldE06NUMREC.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E06NUMREC as a BigDecimal.
  */
  public BigDecimal getBigDecimalE06NUMREC()
  {
    return fieldE06NUMREC.getBigDecimal();
  }

  /**
  * Set field E06INDOPE using a String value.
  */
  public void setE06INDOPE(String newvalue)
  {
    fieldE06INDOPE.setString(newvalue);
  }

  /**
  * Get value of field E06INDOPE as a String.
  */
  public String getE06INDOPE()
  {
    return fieldE06INDOPE.getString();
  }

}