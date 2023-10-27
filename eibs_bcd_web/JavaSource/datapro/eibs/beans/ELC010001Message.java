package datapro.eibs.beans;

import datapro.eibs.sockets.*;
import java.io.*;
import java.math.*;

import java.util.*;

/**
* Class generated by AS/400 CRTCLASS command from ELC010001 physical file definition.
* 
* File level identifier is 1160706131359.
* Record format level identifier is 3C0AC6BB00037.
*/

public class ELC010001Message extends MessageRecord
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
                                     "E01LCRNUM",
                                     "E01DRWNUM",
                                     "E01LCMCCY",
                                     "E01DRWAMN",
                                     "E01OPCODE",
                                     "E01OPCDSC",
                                     "E01LCMCUN",
                                     "E01CUSNA1",
                                     "E01LCCBTH",
                                     "E01LCCOPR",
                                     "E01NEGDTM",
                                     "E01NEGDTD",
                                     "E01NEGDTY",
                                     "E01PMTVIA",
                                     "E01LCCOCK",
                                     "E01TRFNUM",
                                     "E01LCCRF1"
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
                                   "E01LCRNUM",
                                   "E01DRWNUM",
                                   "E01LCMCCY",
                                   "E01DRWAMN",
                                   "E01OPCODE",
                                   "E01OPCDSC",
                                   "E01LCMCUN",
                                   "E01CUSNA1",
                                   "E01LCCBTH",
                                   "E01LCCOPR",
                                   "E01NEGDTM",
                                   "E01NEGDTD",
                                   "E01NEGDTY",
                                   "E01PMTVIA",
                                   "E01LCCOCK",
                                   "E01TRFNUM",
                                   "E01LCCRF1"
                                 };
  final static String fid = "1160706131359";
  final static String rid = "3C0AC6BB00037";
  final static String fmtname = "ELC010001";
  final int FIELDCOUNT = 26;
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
  private DecimalField fieldE01LCRNUM = null;
  private DecimalField fieldE01DRWNUM = null;
  private CharacterField fieldE01LCMCCY = null;
  private DecimalField fieldE01DRWAMN = null;
  private CharacterField fieldE01OPCODE = null;
  private CharacterField fieldE01OPCDSC = null;
  private DecimalField fieldE01LCMCUN = null;
  private CharacterField fieldE01CUSNA1 = null;
  private DecimalField fieldE01LCCBTH = null;
  private CharacterField fieldE01LCCOPR = null;
  private DecimalField fieldE01NEGDTM = null;
  private DecimalField fieldE01NEGDTD = null;
  private DecimalField fieldE01NEGDTY = null;
  private CharacterField fieldE01PMTVIA = null;
  private DecimalField fieldE01LCCOCK = null;
  private DecimalField fieldE01TRFNUM = null;
  private CharacterField fieldE01LCCRF1 = null;

  /**
  * Constructor for ELC010001Message.
  */
  public ELC010001Message()
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
    recordsize = 262;
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
    fields[9] = fieldE01LCRNUM =
    new DecimalField(message, HEADERSIZE + 42, 13, 0, "E01LCRNUM");
    fields[10] = fieldE01DRWNUM =
    new DecimalField(message, HEADERSIZE + 55, 3, 0, "E01DRWNUM");
    fields[11] = fieldE01LCMCCY =
    new CharacterField(message, HEADERSIZE + 58, 3, "E01LCMCCY");
    fields[12] = fieldE01DRWAMN =
    new DecimalField(message, HEADERSIZE + 61, 17, 2, "E01DRWAMN");
    fields[13] = fieldE01OPCODE =
    new CharacterField(message, HEADERSIZE + 78, 1, "E01OPCODE");
    fields[14] = fieldE01OPCDSC =
    new CharacterField(message, HEADERSIZE + 79, 45, "E01OPCDSC");
    fields[15] = fieldE01LCMCUN =
    new DecimalField(message, HEADERSIZE + 124, 10, 0, "E01LCMCUN");
    fields[16] = fieldE01CUSNA1 =
    new CharacterField(message, HEADERSIZE + 134, 60, "E01CUSNA1");
    fields[17] = fieldE01LCCBTH =
    new DecimalField(message, HEADERSIZE + 194, 6, 0, "E01LCCBTH");
    fields[18] = fieldE01LCCOPR =
    new CharacterField(message, HEADERSIZE + 200, 10, "E01LCCOPR");
    fields[19] = fieldE01NEGDTM =
    new DecimalField(message, HEADERSIZE + 210, 3, 0, "E01NEGDTM");
    fields[20] = fieldE01NEGDTD =
    new DecimalField(message, HEADERSIZE + 213, 3, 0, "E01NEGDTD");
    fields[21] = fieldE01NEGDTY =
    new DecimalField(message, HEADERSIZE + 216, 5, 0, "E01NEGDTY");
    fields[22] = fieldE01PMTVIA =
    new CharacterField(message, HEADERSIZE + 221, 1, "E01PMTVIA");
    fields[23] = fieldE01LCCOCK =
    new DecimalField(message, HEADERSIZE + 222, 12, 0, "E01LCCOCK");
    fields[24] = fieldE01TRFNUM =
    new DecimalField(message, HEADERSIZE + 234, 12, 0, "E01TRFNUM");
    fields[25] = fieldE01LCCRF1 =
    new CharacterField(message, HEADERSIZE + 246, 16, "E01LCCRF1");

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
  * Set field E01LCRNUM using a String value.
  */
  public void setE01LCRNUM(String newvalue)
  {
    fieldE01LCRNUM.setString(newvalue);
  }

  /**
  * Get value of field E01LCRNUM as a String.
  */
  public String getE01LCRNUM()
  {
    return fieldE01LCRNUM.getString();
  }

  /**
  * Set numeric field E01LCRNUM using a BigDecimal value.
  */
  public void setE01LCRNUM(BigDecimal newvalue)
  {
    fieldE01LCRNUM.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01LCRNUM as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01LCRNUM()
  {
    return fieldE01LCRNUM.getBigDecimal();
  }

  /**
  * Set field E01DRWNUM using a String value.
  */
  public void setE01DRWNUM(String newvalue)
  {
    fieldE01DRWNUM.setString(newvalue);
  }

  /**
  * Get value of field E01DRWNUM as a String.
  */
  public String getE01DRWNUM()
  {
    return fieldE01DRWNUM.getString();
  }

  /**
  * Set numeric field E01DRWNUM using a BigDecimal value.
  */
  public void setE01DRWNUM(BigDecimal newvalue)
  {
    fieldE01DRWNUM.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01DRWNUM as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01DRWNUM()
  {
    return fieldE01DRWNUM.getBigDecimal();
  }

  /**
  * Set field E01LCMCCY using a String value.
  */
  public void setE01LCMCCY(String newvalue)
  {
    fieldE01LCMCCY.setString(newvalue);
  }

  /**
  * Get value of field E01LCMCCY as a String.
  */
  public String getE01LCMCCY()
  {
    return fieldE01LCMCCY.getString();
  }

  /**
  * Set field E01DRWAMN using a String value.
  */
  public void setE01DRWAMN(String newvalue)
  {
    fieldE01DRWAMN.setString(newvalue);
  }

  /**
  * Get value of field E01DRWAMN as a String.
  */
  public String getE01DRWAMN()
  {
    return fieldE01DRWAMN.getString();
  }

  /**
  * Set numeric field E01DRWAMN using a BigDecimal value.
  */
  public void setE01DRWAMN(BigDecimal newvalue)
  {
    fieldE01DRWAMN.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01DRWAMN as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01DRWAMN()
  {
    return fieldE01DRWAMN.getBigDecimal();
  }

  /**
  * Set field E01OPCODE using a String value.
  */
  public void setE01OPCODE(String newvalue)
  {
    fieldE01OPCODE.setString(newvalue);
  }

  /**
  * Get value of field E01OPCODE as a String.
  */
  public String getE01OPCODE()
  {
    return fieldE01OPCODE.getString();
  }

  /**
  * Set field E01OPCDSC using a String value.
  */
  public void setE01OPCDSC(String newvalue)
  {
    fieldE01OPCDSC.setString(newvalue);
  }

  /**
  * Get value of field E01OPCDSC as a String.
  */
  public String getE01OPCDSC()
  {
    return fieldE01OPCDSC.getString();
  }

  /**
  * Set field E01LCMCUN using a String value.
  */
  public void setE01LCMCUN(String newvalue)
  {
    fieldE01LCMCUN.setString(newvalue);
  }

  /**
  * Get value of field E01LCMCUN as a String.
  */
  public String getE01LCMCUN()
  {
    return fieldE01LCMCUN.getString();
  }

  /**
  * Set numeric field E01LCMCUN using a BigDecimal value.
  */
  public void setE01LCMCUN(BigDecimal newvalue)
  {
    fieldE01LCMCUN.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01LCMCUN as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01LCMCUN()
  {
    return fieldE01LCMCUN.getBigDecimal();
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
  * Set field E01LCCBTH using a String value.
  */
  public void setE01LCCBTH(String newvalue)
  {
    fieldE01LCCBTH.setString(newvalue);
  }

  /**
  * Get value of field E01LCCBTH as a String.
  */
  public String getE01LCCBTH()
  {
    return fieldE01LCCBTH.getString();
  }

  /**
  * Set numeric field E01LCCBTH using a BigDecimal value.
  */
  public void setE01LCCBTH(BigDecimal newvalue)
  {
    fieldE01LCCBTH.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01LCCBTH as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01LCCBTH()
  {
    return fieldE01LCCBTH.getBigDecimal();
  }

  /**
  * Set field E01LCCOPR using a String value.
  */
  public void setE01LCCOPR(String newvalue)
  {
    fieldE01LCCOPR.setString(newvalue);
  }

  /**
  * Get value of field E01LCCOPR as a String.
  */
  public String getE01LCCOPR()
  {
    return fieldE01LCCOPR.getString();
  }

  /**
  * Set field E01NEGDTM using a String value.
  */
  public void setE01NEGDTM(String newvalue)
  {
    fieldE01NEGDTM.setString(newvalue);
  }

  /**
  * Get value of field E01NEGDTM as a String.
  */
  public String getE01NEGDTM()
  {
    return fieldE01NEGDTM.getString();
  }

  /**
  * Set numeric field E01NEGDTM using a BigDecimal value.
  */
  public void setE01NEGDTM(BigDecimal newvalue)
  {
    fieldE01NEGDTM.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01NEGDTM as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01NEGDTM()
  {
    return fieldE01NEGDTM.getBigDecimal();
  }

  /**
  * Set field E01NEGDTD using a String value.
  */
  public void setE01NEGDTD(String newvalue)
  {
    fieldE01NEGDTD.setString(newvalue);
  }

  /**
  * Get value of field E01NEGDTD as a String.
  */
  public String getE01NEGDTD()
  {
    return fieldE01NEGDTD.getString();
  }

  /**
  * Set numeric field E01NEGDTD using a BigDecimal value.
  */
  public void setE01NEGDTD(BigDecimal newvalue)
  {
    fieldE01NEGDTD.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01NEGDTD as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01NEGDTD()
  {
    return fieldE01NEGDTD.getBigDecimal();
  }

  /**
  * Set field E01NEGDTY using a String value.
  */
  public void setE01NEGDTY(String newvalue)
  {
    fieldE01NEGDTY.setString(newvalue);
  }

  /**
  * Get value of field E01NEGDTY as a String.
  */
  public String getE01NEGDTY()
  {
    return fieldE01NEGDTY.getString();
  }

  /**
  * Set numeric field E01NEGDTY using a BigDecimal value.
  */
  public void setE01NEGDTY(BigDecimal newvalue)
  {
    fieldE01NEGDTY.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01NEGDTY as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01NEGDTY()
  {
    return fieldE01NEGDTY.getBigDecimal();
  }

  /**
  * Set field E01PMTVIA using a String value.
  */
  public void setE01PMTVIA(String newvalue)
  {
    fieldE01PMTVIA.setString(newvalue);
  }

  /**
  * Get value of field E01PMTVIA as a String.
  */
  public String getE01PMTVIA()
  {
    return fieldE01PMTVIA.getString();
  }

  /**
  * Set field E01LCCOCK using a String value.
  */
  public void setE01LCCOCK(String newvalue)
  {
    fieldE01LCCOCK.setString(newvalue);
  }

  /**
  * Get value of field E01LCCOCK as a String.
  */
  public String getE01LCCOCK()
  {
    return fieldE01LCCOCK.getString();
  }

  /**
  * Set numeric field E01LCCOCK using a BigDecimal value.
  */
  public void setE01LCCOCK(BigDecimal newvalue)
  {
    fieldE01LCCOCK.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01LCCOCK as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01LCCOCK()
  {
    return fieldE01LCCOCK.getBigDecimal();
  }

  /**
  * Set field E01TRFNUM using a String value.
  */
  public void setE01TRFNUM(String newvalue)
  {
    fieldE01TRFNUM.setString(newvalue);
  }

  /**
  * Get value of field E01TRFNUM as a String.
  */
  public String getE01TRFNUM()
  {
    return fieldE01TRFNUM.getString();
  }

  /**
  * Set numeric field E01TRFNUM using a BigDecimal value.
  */
  public void setE01TRFNUM(BigDecimal newvalue)
  {
    fieldE01TRFNUM.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01TRFNUM as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01TRFNUM()
  {
    return fieldE01TRFNUM.getBigDecimal();
  }

  /**
  * Set field E01LCCRF1 using a String value.
  */
  public void setE01LCCRF1(String newvalue)
  {
    fieldE01LCCRF1.setString(newvalue);
  }

  /**
  * Get value of field E01LCCRF1 as a String.
  */
  public String getE01LCCRF1()
  {
    return fieldE01LCCRF1.getString();
  }

}
