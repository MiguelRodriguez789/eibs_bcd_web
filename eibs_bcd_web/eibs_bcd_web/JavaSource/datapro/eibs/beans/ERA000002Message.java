package datapro.eibs.beans;

import datapro.eibs.sockets.*;
import java.io.*;
import java.math.*;

import java.util.*;

/**
* Class generated by AS/400 CRTCLASS command from ERA000002 physical file definition.
* 
* File level identifier is 1180405163349.
* Record format level identifier is 5A69DB13EF546.
*/

public class ERA000002Message extends MessageRecord
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
                                     "E02RCLACB",
                                     "E02RCLBCCY",
                                     "E02RCLBPRO",
                                     "E02RCLBTYP",
                                     "E02RCLBACD",
                                     "E02CUSCUN",
                                     "E02CUSNA1",
                                     "E02CUSPER",
                                     "E02RCLBBAL",
                                     "E02RCLBDIS",
                                     "E02RCLACA",
                                     "E02RCLLNA",
                                     "E02RCLACCY",
                                     "E02RCLAPRO",
                                     "E02RCLATYP",
                                     "E02RCLAACD",
                                     "E02RCLACOL",
                                     "E02RCLOCOL",
                                     "E02RCLAREM",
                                     "E02RCLABAL",
                                     "E02ENDFLD"
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
                                   "E02RCLACB",
                                   "E02RCLBCCY",
                                   "E02RCLBPRO",
                                   "E02RCLBTYP",
                                   "E02RCLBACD",
                                   "E02CUSCUN",
                                   "E02CUSNA1",
                                   "E02CUSPER",
                                   "E02RCLBBAL",
                                   "E02RCLBDIS",
                                   "E02RCLACA",
                                   "E02RCLLNA",
                                   "E02RCLACCY",
                                   "E02RCLAPRO",
                                   "E02RCLATYP",
                                   "E02RCLAACD",
                                   "E02RCLACOL",
                                   "E02RCLOCOL",
                                   "E02RCLAREM",
                                   "E02RCLABAL",
                                   "E02ENDFLD"
                                 };
  final static String fid = "1180405163349";
  final static String rid = "5A69DB13EF546";
  final static String fmtname = "ERA000002";
  final int FIELDCOUNT = 30;
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
  private DecimalField fieldE02RCLACB = null;
  private CharacterField fieldE02RCLBCCY = null;
  private CharacterField fieldE02RCLBPRO = null;
  private CharacterField fieldE02RCLBTYP = null;
  private CharacterField fieldE02RCLBACD = null;
  private DecimalField fieldE02CUSCUN = null;
  private CharacterField fieldE02CUSNA1 = null;
  private DecimalField fieldE02CUSPER = null;
  private DecimalField fieldE02RCLBBAL = null;
  private DecimalField fieldE02RCLBDIS = null;
  private DecimalField fieldE02RCLACA = null;
  private DecimalField fieldE02RCLLNA = null;
  private CharacterField fieldE02RCLACCY = null;
  private CharacterField fieldE02RCLAPRO = null;
  private CharacterField fieldE02RCLATYP = null;
  private CharacterField fieldE02RCLAACD = null;
  private DecimalField fieldE02RCLACOL = null;
  private DecimalField fieldE02RCLOCOL = null;
  private DecimalField fieldE02RCLAREM = null;
  private DecimalField fieldE02RCLABAL = null;
  private CharacterField fieldE02ENDFLD = null;

  /**
  * Constructor for ERA000002Message.
  */
  public ERA000002Message()
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
    recordsize = 280;
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
    fields[9] = fieldE02RCLACB =
    new DecimalField(message, HEADERSIZE + 42, 13, 0, "E02RCLACB");
    fields[10] = fieldE02RCLBCCY =
    new CharacterField(message, HEADERSIZE + 55, 3, "E02RCLBCCY");
    fields[11] = fieldE02RCLBPRO =
    new CharacterField(message, HEADERSIZE + 58, 4, "E02RCLBPRO");
    fields[12] = fieldE02RCLBTYP =
    new CharacterField(message, HEADERSIZE + 62, 4, "E02RCLBTYP");
    fields[13] = fieldE02RCLBACD =
    new CharacterField(message, HEADERSIZE + 66, 2, "E02RCLBACD");
    fields[14] = fieldE02CUSCUN =
    new DecimalField(message, HEADERSIZE + 68, 10, 0, "E02CUSCUN");
    fields[15] = fieldE02CUSNA1 =
    new CharacterField(message, HEADERSIZE + 78, 60, "E02CUSNA1");
    fields[16] = fieldE02CUSPER =
    new DecimalField(message, HEADERSIZE + 138, 8, 3, "E02CUSPER");
    fields[17] = fieldE02RCLBBAL =
    new DecimalField(message, HEADERSIZE + 146, 17, 2, "E02RCLBBAL");
    fields[18] = fieldE02RCLBDIS =
    new DecimalField(message, HEADERSIZE + 163, 17, 2, "E02RCLBDIS");
    fields[19] = fieldE02RCLACA =
    new DecimalField(message, HEADERSIZE + 180, 13, 0, "E02RCLACA");
    fields[20] = fieldE02RCLLNA =
    new DecimalField(message, HEADERSIZE + 193, 5, 0, "E02RCLLNA");
    fields[21] = fieldE02RCLACCY =
    new CharacterField(message, HEADERSIZE + 198, 3, "E02RCLACCY");
    fields[22] = fieldE02RCLAPRO =
    new CharacterField(message, HEADERSIZE + 201, 4, "E02RCLAPRO");
    fields[23] = fieldE02RCLATYP =
    new CharacterField(message, HEADERSIZE + 205, 4, "E02RCLATYP");
    fields[24] = fieldE02RCLAACD =
    new CharacterField(message, HEADERSIZE + 209, 2, "E02RCLAACD");
    fields[25] = fieldE02RCLACOL =
    new DecimalField(message, HEADERSIZE + 211, 17, 2, "E02RCLACOL");
    fields[26] = fieldE02RCLOCOL =
    new DecimalField(message, HEADERSIZE + 228, 17, 2, "E02RCLOCOL");
    fields[27] = fieldE02RCLAREM =
    new DecimalField(message, HEADERSIZE + 245, 17, 2, "E02RCLAREM");
    fields[28] = fieldE02RCLABAL =
    new DecimalField(message, HEADERSIZE + 262, 17, 2, "E02RCLABAL");
    fields[29] = fieldE02ENDFLD =
    new CharacterField(message, HEADERSIZE + 279, 1, "E02ENDFLD");

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
  * Set field E02RCLACB using a String value.
  */
  public void setE02RCLACB(String newvalue)
  {
    fieldE02RCLACB.setString(newvalue);
  }

  /**
  * Get value of field E02RCLACB as a String.
  */
  public String getE02RCLACB()
  {
    return fieldE02RCLACB.getString();
  }

  /**
  * Set numeric field E02RCLACB using a BigDecimal value.
  */
  public void setE02RCLACB(BigDecimal newvalue)
  {
    fieldE02RCLACB.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02RCLACB as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02RCLACB()
  {
    return fieldE02RCLACB.getBigDecimal();
  }

  /**
  * Set field E02RCLBCCY using a String value.
  */
  public void setE02RCLBCCY(String newvalue)
  {
    fieldE02RCLBCCY.setString(newvalue);
  }

  /**
  * Get value of field E02RCLBCCY as a String.
  */
  public String getE02RCLBCCY()
  {
    return fieldE02RCLBCCY.getString();
  }

  /**
  * Set field E02RCLBPRO using a String value.
  */
  public void setE02RCLBPRO(String newvalue)
  {
    fieldE02RCLBPRO.setString(newvalue);
  }

  /**
  * Get value of field E02RCLBPRO as a String.
  */
  public String getE02RCLBPRO()
  {
    return fieldE02RCLBPRO.getString();
  }

  /**
  * Set field E02RCLBTYP using a String value.
  */
  public void setE02RCLBTYP(String newvalue)
  {
    fieldE02RCLBTYP.setString(newvalue);
  }

  /**
  * Get value of field E02RCLBTYP as a String.
  */
  public String getE02RCLBTYP()
  {
    return fieldE02RCLBTYP.getString();
  }

  /**
  * Set field E02RCLBACD using a String value.
  */
  public void setE02RCLBACD(String newvalue)
  {
    fieldE02RCLBACD.setString(newvalue);
  }

  /**
  * Get value of field E02RCLBACD as a String.
  */
  public String getE02RCLBACD()
  {
    return fieldE02RCLBACD.getString();
  }

  /**
  * Set field E02CUSCUN using a String value.
  */
  public void setE02CUSCUN(String newvalue)
  {
    fieldE02CUSCUN.setString(newvalue);
  }

  /**
  * Get value of field E02CUSCUN as a String.
  */
  public String getE02CUSCUN()
  {
    return fieldE02CUSCUN.getString();
  }

  /**
  * Set numeric field E02CUSCUN using a BigDecimal value.
  */
  public void setE02CUSCUN(BigDecimal newvalue)
  {
    fieldE02CUSCUN.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02CUSCUN as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02CUSCUN()
  {
    return fieldE02CUSCUN.getBigDecimal();
  }

  /**
  * Set field E02CUSNA1 using a String value.
  */
  public void setE02CUSNA1(String newvalue)
  {
    fieldE02CUSNA1.setString(newvalue);
  }

  /**
  * Get value of field E02CUSNA1 as a String.
  */
  public String getE02CUSNA1()
  {
    return fieldE02CUSNA1.getString();
  }

  /**
  * Set field E02CUSPER using a String value.
  */
  public void setE02CUSPER(String newvalue)
  {
    fieldE02CUSPER.setString(newvalue);
  }

  /**
  * Get value of field E02CUSPER as a String.
  */
  public String getE02CUSPER()
  {
    return fieldE02CUSPER.getString();
  }

  /**
  * Set numeric field E02CUSPER using a BigDecimal value.
  */
  public void setE02CUSPER(BigDecimal newvalue)
  {
    fieldE02CUSPER.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02CUSPER as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02CUSPER()
  {
    return fieldE02CUSPER.getBigDecimal();
  }

  /**
  * Set field E02RCLBBAL using a String value.
  */
  public void setE02RCLBBAL(String newvalue)
  {
    fieldE02RCLBBAL.setString(newvalue);
  }

  /**
  * Get value of field E02RCLBBAL as a String.
  */
  public String getE02RCLBBAL()
  {
    return fieldE02RCLBBAL.getString();
  }

  /**
  * Set numeric field E02RCLBBAL using a BigDecimal value.
  */
  public void setE02RCLBBAL(BigDecimal newvalue)
  {
    fieldE02RCLBBAL.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02RCLBBAL as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02RCLBBAL()
  {
    return fieldE02RCLBBAL.getBigDecimal();
  }

  /**
  * Set field E02RCLBDIS using a String value.
  */
  public void setE02RCLBDIS(String newvalue)
  {
    fieldE02RCLBDIS.setString(newvalue);
  }

  /**
  * Get value of field E02RCLBDIS as a String.
  */
  public String getE02RCLBDIS()
  {
    return fieldE02RCLBDIS.getString();
  }

  /**
  * Set numeric field E02RCLBDIS using a BigDecimal value.
  */
  public void setE02RCLBDIS(BigDecimal newvalue)
  {
    fieldE02RCLBDIS.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02RCLBDIS as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02RCLBDIS()
  {
    return fieldE02RCLBDIS.getBigDecimal();
  }

  /**
  * Set field E02RCLACA using a String value.
  */
  public void setE02RCLACA(String newvalue)
  {
    fieldE02RCLACA.setString(newvalue);
  }

  /**
  * Get value of field E02RCLACA as a String.
  */
  public String getE02RCLACA()
  {
    return fieldE02RCLACA.getString();
  }

  /**
  * Set numeric field E02RCLACA using a BigDecimal value.
  */
  public void setE02RCLACA(BigDecimal newvalue)
  {
    fieldE02RCLACA.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02RCLACA as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02RCLACA()
  {
    return fieldE02RCLACA.getBigDecimal();
  }

  /**
  * Set field E02RCLLNA using a String value.
  */
  public void setE02RCLLNA(String newvalue)
  {
    fieldE02RCLLNA.setString(newvalue);
  }

  /**
  * Get value of field E02RCLLNA as a String.
  */
  public String getE02RCLLNA()
  {
    return fieldE02RCLLNA.getString();
  }

  /**
  * Set numeric field E02RCLLNA using a BigDecimal value.
  */
  public void setE02RCLLNA(BigDecimal newvalue)
  {
    fieldE02RCLLNA.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02RCLLNA as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02RCLLNA()
  {
    return fieldE02RCLLNA.getBigDecimal();
  }

  /**
  * Set field E02RCLACCY using a String value.
  */
  public void setE02RCLACCY(String newvalue)
  {
    fieldE02RCLACCY.setString(newvalue);
  }

  /**
  * Get value of field E02RCLACCY as a String.
  */
  public String getE02RCLACCY()
  {
    return fieldE02RCLACCY.getString();
  }

  /**
  * Set field E02RCLAPRO using a String value.
  */
  public void setE02RCLAPRO(String newvalue)
  {
    fieldE02RCLAPRO.setString(newvalue);
  }

  /**
  * Get value of field E02RCLAPRO as a String.
  */
  public String getE02RCLAPRO()
  {
    return fieldE02RCLAPRO.getString();
  }

  /**
  * Set field E02RCLATYP using a String value.
  */
  public void setE02RCLATYP(String newvalue)
  {
    fieldE02RCLATYP.setString(newvalue);
  }

  /**
  * Get value of field E02RCLATYP as a String.
  */
  public String getE02RCLATYP()
  {
    return fieldE02RCLATYP.getString();
  }

  /**
  * Set field E02RCLAACD using a String value.
  */
  public void setE02RCLAACD(String newvalue)
  {
    fieldE02RCLAACD.setString(newvalue);
  }

  /**
  * Get value of field E02RCLAACD as a String.
  */
  public String getE02RCLAACD()
  {
    return fieldE02RCLAACD.getString();
  }

  /**
  * Set field E02RCLACOL using a String value.
  */
  public void setE02RCLACOL(String newvalue)
  {
    fieldE02RCLACOL.setString(newvalue);
  }

  /**
  * Get value of field E02RCLACOL as a String.
  */
  public String getE02RCLACOL()
  {
    return fieldE02RCLACOL.getString();
  }

  /**
  * Set numeric field E02RCLACOL using a BigDecimal value.
  */
  public void setE02RCLACOL(BigDecimal newvalue)
  {
    fieldE02RCLACOL.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02RCLACOL as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02RCLACOL()
  {
    return fieldE02RCLACOL.getBigDecimal();
  }

  /**
  * Set field E02RCLOCOL using a String value.
  */
  public void setE02RCLOCOL(String newvalue)
  {
    fieldE02RCLOCOL.setString(newvalue);
  }

  /**
  * Get value of field E02RCLOCOL as a String.
  */
  public String getE02RCLOCOL()
  {
    return fieldE02RCLOCOL.getString();
  }

  /**
  * Set numeric field E02RCLOCOL using a BigDecimal value.
  */
  public void setE02RCLOCOL(BigDecimal newvalue)
  {
    fieldE02RCLOCOL.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02RCLOCOL as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02RCLOCOL()
  {
    return fieldE02RCLOCOL.getBigDecimal();
  }

  /**
  * Set field E02RCLAREM using a String value.
  */
  public void setE02RCLAREM(String newvalue)
  {
    fieldE02RCLAREM.setString(newvalue);
  }

  /**
  * Get value of field E02RCLAREM as a String.
  */
  public String getE02RCLAREM()
  {
    return fieldE02RCLAREM.getString();
  }

  /**
  * Set numeric field E02RCLAREM using a BigDecimal value.
  */
  public void setE02RCLAREM(BigDecimal newvalue)
  {
    fieldE02RCLAREM.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02RCLAREM as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02RCLAREM()
  {
    return fieldE02RCLAREM.getBigDecimal();
  }

  /**
  * Set field E02RCLABAL using a String value.
  */
  public void setE02RCLABAL(String newvalue)
  {
    fieldE02RCLABAL.setString(newvalue);
  }

  /**
  * Get value of field E02RCLABAL as a String.
  */
  public String getE02RCLABAL()
  {
    return fieldE02RCLABAL.getString();
  }

  /**
  * Set numeric field E02RCLABAL using a BigDecimal value.
  */
  public void setE02RCLABAL(BigDecimal newvalue)
  {
    fieldE02RCLABAL.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02RCLABAL as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02RCLABAL()
  {
    return fieldE02RCLABAL.getBigDecimal();
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