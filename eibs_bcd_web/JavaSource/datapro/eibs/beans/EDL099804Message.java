package datapro.eibs.beans;

import datapro.eibs.sockets.*;
import java.io.*;
import java.math.*;

import java.util.*;

/**
* Class generated by AS/400 CRTCLASS command from EDL099804 physical file definition.
* 
* File level identifier is 1170804052142.
* Record format level identifier is 4279AD2871DC9.
*/

public class EDL099804Message extends MessageRecord
{
  final static String fldnames[] = {
                                     "H04USERID",
                                     "H04PROGRM",
                                     "H04TIMSYS",
                                     "H04SCRCOD",
                                     "H04OPECOD",
                                     "H04FLGMAS",
                                     "H04FLGWK1",
                                     "H04FLGWK2",
                                     "H04FLGWK3",
                                     "E04TRACDE",
                                     "E04TRAVDM",
                                     "E04TRAVDD",
                                     "E04TRAVDY",
                                     "E04TRAVRA",
                                     "E04TRAIPC",
                                     "E04TRAVRD",
                                     "E04TRATCR",
                                     "E04TRAVSM",
                                     "E04TRAPMS",
                                     "E04TRASTS",
                                     "E04TRACMM",
                                     "E04TRACMD",
                                     "E04TRACMY",
                                     "E04TRACTM",
                                     "E04TRACUS",
                                     "E04TRALMM",
                                     "E04TRALMD",
                                     "E04TRALMY",
                                     "E04TRALMT",
                                     "E04TRALMU",
                                     "E04NUMREC",
                                     "E04INDOPE"
                                   };
  final static String tnames[] = {
                                   "H04USERID",
                                   "H04PROGRM",
                                   "H04TIMSYS",
                                   "H04SCRCOD",
                                   "H04OPECOD",
                                   "H04FLGMAS",
                                   "H04FLGWK1",
                                   "H04FLGWK2",
                                   "H04FLGWK3",
                                   "E04TRACDE",
                                   "E04TRAVDM",
                                   "E04TRAVDD",
                                   "E04TRAVDY",
                                   "E04TRAVRA",
                                   "E04TRAIPC",
                                   "E04TRAVRD",
                                   "E04TRATCR",
                                   "E04TRAVSM",
                                   "E04TRAPMS",
                                   "E04TRASTS",
                                   "E04TRACMM",
                                   "E04TRACMD",
                                   "E04TRACMY",
                                   "E04TRACTM",
                                   "E04TRACUS",
                                   "E04TRALMM",
                                   "E04TRALMD",
                                   "E04TRALMY",
                                   "E04TRALMT",
                                   "E04TRALMU",
                                   "E04NUMREC",
                                   "E04INDOPE"
                                 };
  final static String fid = "1170804052142";
  final static String rid = "4279AD2871DC9";
  final static String fmtname = "EDL099804";
  final int FIELDCOUNT = 32;
  private static Hashtable tlookup = new Hashtable();
  private CharacterField fieldH04USERID = null;
  private CharacterField fieldH04PROGRM = null;
  private CharacterField fieldH04TIMSYS = null;
  private CharacterField fieldH04SCRCOD = null;
  private CharacterField fieldH04OPECOD = null;
  private CharacterField fieldH04FLGMAS = null;
  private CharacterField fieldH04FLGWK1 = null;
  private CharacterField fieldH04FLGWK2 = null;
  private CharacterField fieldH04FLGWK3 = null;
  private CharacterField fieldE04TRACDE = null;
  private DecimalField fieldE04TRAVDM = null;
  private DecimalField fieldE04TRAVDD = null;
  private DecimalField fieldE04TRAVDY = null;
  private DecimalField fieldE04TRAVRA = null;
  private DecimalField fieldE04TRAIPC = null;
  private DecimalField fieldE04TRAVRD = null;
  private DecimalField fieldE04TRATCR = null;
  private DecimalField fieldE04TRAVSM = null;
  private DecimalField fieldE04TRAPMS = null;
  private CharacterField fieldE04TRASTS = null;
  private DecimalField fieldE04TRACMM = null;
  private DecimalField fieldE04TRACMD = null;
  private DecimalField fieldE04TRACMY = null;
  private CharacterField fieldE04TRACTM = null;
  private CharacterField fieldE04TRACUS = null;
  private DecimalField fieldE04TRALMM = null;
  private DecimalField fieldE04TRALMD = null;
  private DecimalField fieldE04TRALMY = null;
  private CharacterField fieldE04TRALMT = null;
  private CharacterField fieldE04TRALMU = null;
  private DecimalField fieldE04NUMREC = null;
  private CharacterField fieldE04INDOPE = null;

  /**
  * Constructor for EDL099804Message.
  */
  public EDL099804Message()
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
    recordsize = 255;
    fileid = fid;
    recordid = rid;
    message = new byte[getByteLength()];
    formatname = fmtname;
    fieldnames = fldnames;
    tagnames = tnames;
    fields = new MessageField[FIELDCOUNT];

    fields[0] = fieldH04USERID =
    new CharacterField(message, HEADERSIZE + 0, 10, "H04USERID");
    fields[1] = fieldH04PROGRM =
    new CharacterField(message, HEADERSIZE + 10, 10, "H04PROGRM");
    fields[2] = fieldH04TIMSYS =
    new CharacterField(message, HEADERSIZE + 20, 12, "H04TIMSYS");
    fields[3] = fieldH04SCRCOD =
    new CharacterField(message, HEADERSIZE + 32, 2, "H04SCRCOD");
    fields[4] = fieldH04OPECOD =
    new CharacterField(message, HEADERSIZE + 34, 4, "H04OPECOD");
    fields[5] = fieldH04FLGMAS =
    new CharacterField(message, HEADERSIZE + 38, 1, "H04FLGMAS");
    fields[6] = fieldH04FLGWK1 =
    new CharacterField(message, HEADERSIZE + 39, 1, "H04FLGWK1");
    fields[7] = fieldH04FLGWK2 =
    new CharacterField(message, HEADERSIZE + 40, 1, "H04FLGWK2");
    fields[8] = fieldH04FLGWK3 =
    new CharacterField(message, HEADERSIZE + 41, 1, "H04FLGWK3");
    fields[9] = fieldE04TRACDE =
    new CharacterField(message, HEADERSIZE + 42, 4, "E04TRACDE");
    fields[10] = fieldE04TRAVDM =
    new DecimalField(message, HEADERSIZE + 46, 3, 0, "E04TRAVDM");
    fields[11] = fieldE04TRAVDD =
    new DecimalField(message, HEADERSIZE + 49, 3, 0, "E04TRAVDD");
    fields[12] = fieldE04TRAVDY =
    new DecimalField(message, HEADERSIZE + 52, 5, 0, "E04TRAVDY");
    fields[13] = fieldE04TRAVRA =
    new DecimalField(message, HEADERSIZE + 57, 22, 2, "E04TRAVRA");
    fields[14] = fieldE04TRAIPC =
    new DecimalField(message, HEADERSIZE + 79, 17, 6, "E04TRAIPC");
    fields[15] = fieldE04TRAVRD =
    new DecimalField(message, HEADERSIZE + 96, 22, 2, "E04TRAVRD");
    fields[16] = fieldE04TRATCR =
    new DecimalField(message, HEADERSIZE + 118, 11, 6, "E04TRATCR");
    fields[17] = fieldE04TRAVSM =
    new DecimalField(message, HEADERSIZE + 129, 11, 6, "E04TRAVSM");
    fields[18] = fieldE04TRAPMS =
    new DecimalField(message, HEADERSIZE + 140, 11, 6, "E04TRAPMS");
    fields[19] = fieldE04TRASTS =
    new CharacterField(message, HEADERSIZE + 151, 1, "E04TRASTS");
    fields[20] = fieldE04TRACMM =
    new DecimalField(message, HEADERSIZE + 152, 3, 0, "E04TRACMM");
    fields[21] = fieldE04TRACMD =
    new DecimalField(message, HEADERSIZE + 155, 3, 0, "E04TRACMD");
    fields[22] = fieldE04TRACMY =
    new DecimalField(message, HEADERSIZE + 158, 5, 0, "E04TRACMY");
    fields[23] = fieldE04TRACTM =
    new CharacterField(message, HEADERSIZE + 163, 26, "E04TRACTM");
    fields[24] = fieldE04TRACUS =
    new CharacterField(message, HEADERSIZE + 189, 10, "E04TRACUS");
    fields[25] = fieldE04TRALMM =
    new DecimalField(message, HEADERSIZE + 199, 3, 0, "E04TRALMM");
    fields[26] = fieldE04TRALMD =
    new DecimalField(message, HEADERSIZE + 202, 3, 0, "E04TRALMD");
    fields[27] = fieldE04TRALMY =
    new DecimalField(message, HEADERSIZE + 205, 5, 0, "E04TRALMY");
    fields[28] = fieldE04TRALMT =
    new CharacterField(message, HEADERSIZE + 210, 26, "E04TRALMT");
    fields[29] = fieldE04TRALMU =
    new CharacterField(message, HEADERSIZE + 236, 10, "E04TRALMU");
    fields[30] = fieldE04NUMREC =
    new DecimalField(message, HEADERSIZE + 246, 8, 0, "E04NUMREC");
    fields[31] = fieldE04INDOPE =
    new CharacterField(message, HEADERSIZE + 254, 1, "E04INDOPE");

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
  * Set field H04USERID using a String value.
  */
  public void setH04USERID(String newvalue)
  {
    fieldH04USERID.setString(newvalue);
  }

  /**
  * Get value of field H04USERID as a String.
  */
  public String getH04USERID()
  {
    return fieldH04USERID.getString();
  }

  /**
  * Set field H04PROGRM using a String value.
  */
  public void setH04PROGRM(String newvalue)
  {
    fieldH04PROGRM.setString(newvalue);
  }

  /**
  * Get value of field H04PROGRM as a String.
  */
  public String getH04PROGRM()
  {
    return fieldH04PROGRM.getString();
  }

  /**
  * Set field H04TIMSYS using a String value.
  */
  public void setH04TIMSYS(String newvalue)
  {
    fieldH04TIMSYS.setString(newvalue);
  }

  /**
  * Get value of field H04TIMSYS as a String.
  */
  public String getH04TIMSYS()
  {
    return fieldH04TIMSYS.getString();
  }

  /**
  * Set field H04SCRCOD using a String value.
  */
  public void setH04SCRCOD(String newvalue)
  {
    fieldH04SCRCOD.setString(newvalue);
  }

  /**
  * Get value of field H04SCRCOD as a String.
  */
  public String getH04SCRCOD()
  {
    return fieldH04SCRCOD.getString();
  }

  /**
  * Set field H04OPECOD using a String value.
  */
  public void setH04OPECOD(String newvalue)
  {
    fieldH04OPECOD.setString(newvalue);
  }

  /**
  * Get value of field H04OPECOD as a String.
  */
  public String getH04OPECOD()
  {
    return fieldH04OPECOD.getString();
  }

  /**
  * Set field H04FLGMAS using a String value.
  */
  public void setH04FLGMAS(String newvalue)
  {
    fieldH04FLGMAS.setString(newvalue);
  }

  /**
  * Get value of field H04FLGMAS as a String.
  */
  public String getH04FLGMAS()
  {
    return fieldH04FLGMAS.getString();
  }

  /**
  * Set field H04FLGWK1 using a String value.
  */
  public void setH04FLGWK1(String newvalue)
  {
    fieldH04FLGWK1.setString(newvalue);
  }

  /**
  * Get value of field H04FLGWK1 as a String.
  */
  public String getH04FLGWK1()
  {
    return fieldH04FLGWK1.getString();
  }

  /**
  * Set field H04FLGWK2 using a String value.
  */
  public void setH04FLGWK2(String newvalue)
  {
    fieldH04FLGWK2.setString(newvalue);
  }

  /**
  * Get value of field H04FLGWK2 as a String.
  */
  public String getH04FLGWK2()
  {
    return fieldH04FLGWK2.getString();
  }

  /**
  * Set field H04FLGWK3 using a String value.
  */
  public void setH04FLGWK3(String newvalue)
  {
    fieldH04FLGWK3.setString(newvalue);
  }

  /**
  * Get value of field H04FLGWK3 as a String.
  */
  public String getH04FLGWK3()
  {
    return fieldH04FLGWK3.getString();
  }

  /**
  * Set field E04TRACDE using a String value.
  */
  public void setE04TRACDE(String newvalue)
  {
    fieldE04TRACDE.setString(newvalue);
  }

  /**
  * Get value of field E04TRACDE as a String.
  */
  public String getE04TRACDE()
  {
    return fieldE04TRACDE.getString();
  }

  /**
  * Set field E04TRAVDM using a String value.
  */
  public void setE04TRAVDM(String newvalue)
  {
    fieldE04TRAVDM.setString(newvalue);
  }

  /**
  * Get value of field E04TRAVDM as a String.
  */
  public String getE04TRAVDM()
  {
    return fieldE04TRAVDM.getString();
  }

  /**
  * Set numeric field E04TRAVDM using a BigDecimal value.
  */
  public void setE04TRAVDM(BigDecimal newvalue)
  {
    fieldE04TRAVDM.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E04TRAVDM as a BigDecimal.
  */
  public BigDecimal getBigDecimalE04TRAVDM()
  {
    return fieldE04TRAVDM.getBigDecimal();
  }

  /**
  * Set field E04TRAVDD using a String value.
  */
  public void setE04TRAVDD(String newvalue)
  {
    fieldE04TRAVDD.setString(newvalue);
  }

  /**
  * Get value of field E04TRAVDD as a String.
  */
  public String getE04TRAVDD()
  {
    return fieldE04TRAVDD.getString();
  }

  /**
  * Set numeric field E04TRAVDD using a BigDecimal value.
  */
  public void setE04TRAVDD(BigDecimal newvalue)
  {
    fieldE04TRAVDD.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E04TRAVDD as a BigDecimal.
  */
  public BigDecimal getBigDecimalE04TRAVDD()
  {
    return fieldE04TRAVDD.getBigDecimal();
  }

  /**
  * Set field E04TRAVDY using a String value.
  */
  public void setE04TRAVDY(String newvalue)
  {
    fieldE04TRAVDY.setString(newvalue);
  }

  /**
  * Get value of field E04TRAVDY as a String.
  */
  public String getE04TRAVDY()
  {
    return fieldE04TRAVDY.getString();
  }

  /**
  * Set numeric field E04TRAVDY using a BigDecimal value.
  */
  public void setE04TRAVDY(BigDecimal newvalue)
  {
    fieldE04TRAVDY.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E04TRAVDY as a BigDecimal.
  */
  public BigDecimal getBigDecimalE04TRAVDY()
  {
    return fieldE04TRAVDY.getBigDecimal();
  }

  /**
  * Set field E04TRAVRA using a String value.
  */
  public void setE04TRAVRA(String newvalue)
  {
    fieldE04TRAVRA.setString(newvalue);
  }

  /**
  * Get value of field E04TRAVRA as a String.
  */
  public String getE04TRAVRA()
  {
    return fieldE04TRAVRA.getString();
  }

  /**
  * Set numeric field E04TRAVRA using a BigDecimal value.
  */
  public void setE04TRAVRA(BigDecimal newvalue)
  {
    fieldE04TRAVRA.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E04TRAVRA as a BigDecimal.
  */
  public BigDecimal getBigDecimalE04TRAVRA()
  {
    return fieldE04TRAVRA.getBigDecimal();
  }

  /**
  * Set field E04TRAIPC using a String value.
  */
  public void setE04TRAIPC(String newvalue)
  {
    fieldE04TRAIPC.setString(newvalue);
  }

  /**
  * Get value of field E04TRAIPC as a String.
  */
  public String getE04TRAIPC()
  {
    return fieldE04TRAIPC.getString();
  }

  /**
  * Set numeric field E04TRAIPC using a BigDecimal value.
  */
  public void setE04TRAIPC(BigDecimal newvalue)
  {
    fieldE04TRAIPC.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E04TRAIPC as a BigDecimal.
  */
  public BigDecimal getBigDecimalE04TRAIPC()
  {
    return fieldE04TRAIPC.getBigDecimal();
  }

  /**
  * Set field E04TRAVRD using a String value.
  */
  public void setE04TRAVRD(String newvalue)
  {
    fieldE04TRAVRD.setString(newvalue);
  }

  /**
  * Get value of field E04TRAVRD as a String.
  */
  public String getE04TRAVRD()
  {
    return fieldE04TRAVRD.getString();
  }

  /**
  * Set numeric field E04TRAVRD using a BigDecimal value.
  */
  public void setE04TRAVRD(BigDecimal newvalue)
  {
    fieldE04TRAVRD.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E04TRAVRD as a BigDecimal.
  */
  public BigDecimal getBigDecimalE04TRAVRD()
  {
    return fieldE04TRAVRD.getBigDecimal();
  }

  /**
  * Set field E04TRATCR using a String value.
  */
  public void setE04TRATCR(String newvalue)
  {
    fieldE04TRATCR.setString(newvalue);
  }

  /**
  * Get value of field E04TRATCR as a String.
  */
  public String getE04TRATCR()
  {
    return fieldE04TRATCR.getString();
  }

  /**
  * Set numeric field E04TRATCR using a BigDecimal value.
  */
  public void setE04TRATCR(BigDecimal newvalue)
  {
    fieldE04TRATCR.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E04TRATCR as a BigDecimal.
  */
  public BigDecimal getBigDecimalE04TRATCR()
  {
    return fieldE04TRATCR.getBigDecimal();
  }

  /**
  * Set field E04TRAVSM using a String value.
  */
  public void setE04TRAVSM(String newvalue)
  {
    fieldE04TRAVSM.setString(newvalue);
  }

  /**
  * Get value of field E04TRAVSM as a String.
  */
  public String getE04TRAVSM()
  {
    return fieldE04TRAVSM.getString();
  }

  /**
  * Set numeric field E04TRAVSM using a BigDecimal value.
  */
  public void setE04TRAVSM(BigDecimal newvalue)
  {
    fieldE04TRAVSM.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E04TRAVSM as a BigDecimal.
  */
  public BigDecimal getBigDecimalE04TRAVSM()
  {
    return fieldE04TRAVSM.getBigDecimal();
  }

  /**
  * Set field E04TRAPMS using a String value.
  */
  public void setE04TRAPMS(String newvalue)
  {
    fieldE04TRAPMS.setString(newvalue);
  }

  /**
  * Get value of field E04TRAPMS as a String.
  */
  public String getE04TRAPMS()
  {
    return fieldE04TRAPMS.getString();
  }

  /**
  * Set numeric field E04TRAPMS using a BigDecimal value.
  */
  public void setE04TRAPMS(BigDecimal newvalue)
  {
    fieldE04TRAPMS.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E04TRAPMS as a BigDecimal.
  */
  public BigDecimal getBigDecimalE04TRAPMS()
  {
    return fieldE04TRAPMS.getBigDecimal();
  }

  /**
  * Set field E04TRASTS using a String value.
  */
  public void setE04TRASTS(String newvalue)
  {
    fieldE04TRASTS.setString(newvalue);
  }

  /**
  * Get value of field E04TRASTS as a String.
  */
  public String getE04TRASTS()
  {
    return fieldE04TRASTS.getString();
  }

  /**
  * Set field E04TRACMM using a String value.
  */
  public void setE04TRACMM(String newvalue)
  {
    fieldE04TRACMM.setString(newvalue);
  }

  /**
  * Get value of field E04TRACMM as a String.
  */
  public String getE04TRACMM()
  {
    return fieldE04TRACMM.getString();
  }

  /**
  * Set numeric field E04TRACMM using a BigDecimal value.
  */
  public void setE04TRACMM(BigDecimal newvalue)
  {
    fieldE04TRACMM.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E04TRACMM as a BigDecimal.
  */
  public BigDecimal getBigDecimalE04TRACMM()
  {
    return fieldE04TRACMM.getBigDecimal();
  }

  /**
  * Set field E04TRACMD using a String value.
  */
  public void setE04TRACMD(String newvalue)
  {
    fieldE04TRACMD.setString(newvalue);
  }

  /**
  * Get value of field E04TRACMD as a String.
  */
  public String getE04TRACMD()
  {
    return fieldE04TRACMD.getString();
  }

  /**
  * Set numeric field E04TRACMD using a BigDecimal value.
  */
  public void setE04TRACMD(BigDecimal newvalue)
  {
    fieldE04TRACMD.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E04TRACMD as a BigDecimal.
  */
  public BigDecimal getBigDecimalE04TRACMD()
  {
    return fieldE04TRACMD.getBigDecimal();
  }

  /**
  * Set field E04TRACMY using a String value.
  */
  public void setE04TRACMY(String newvalue)
  {
    fieldE04TRACMY.setString(newvalue);
  }

  /**
  * Get value of field E04TRACMY as a String.
  */
  public String getE04TRACMY()
  {
    return fieldE04TRACMY.getString();
  }

  /**
  * Set numeric field E04TRACMY using a BigDecimal value.
  */
  public void setE04TRACMY(BigDecimal newvalue)
  {
    fieldE04TRACMY.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E04TRACMY as a BigDecimal.
  */
  public BigDecimal getBigDecimalE04TRACMY()
  {
    return fieldE04TRACMY.getBigDecimal();
  }

  /**
  * Set field E04TRACTM using a String value.
  */
  public void setE04TRACTM(String newvalue)
  {
    fieldE04TRACTM.setString(newvalue);
  }

  /**
  * Get value of field E04TRACTM as a String.
  */
  public String getE04TRACTM()
  {
    return fieldE04TRACTM.getString();
  }

  /**
  * Set field E04TRACUS using a String value.
  */
  public void setE04TRACUS(String newvalue)
  {
    fieldE04TRACUS.setString(newvalue);
  }

  /**
  * Get value of field E04TRACUS as a String.
  */
  public String getE04TRACUS()
  {
    return fieldE04TRACUS.getString();
  }

  /**
  * Set field E04TRALMM using a String value.
  */
  public void setE04TRALMM(String newvalue)
  {
    fieldE04TRALMM.setString(newvalue);
  }

  /**
  * Get value of field E04TRALMM as a String.
  */
  public String getE04TRALMM()
  {
    return fieldE04TRALMM.getString();
  }

  /**
  * Set numeric field E04TRALMM using a BigDecimal value.
  */
  public void setE04TRALMM(BigDecimal newvalue)
  {
    fieldE04TRALMM.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E04TRALMM as a BigDecimal.
  */
  public BigDecimal getBigDecimalE04TRALMM()
  {
    return fieldE04TRALMM.getBigDecimal();
  }

  /**
  * Set field E04TRALMD using a String value.
  */
  public void setE04TRALMD(String newvalue)
  {
    fieldE04TRALMD.setString(newvalue);
  }

  /**
  * Get value of field E04TRALMD as a String.
  */
  public String getE04TRALMD()
  {
    return fieldE04TRALMD.getString();
  }

  /**
  * Set numeric field E04TRALMD using a BigDecimal value.
  */
  public void setE04TRALMD(BigDecimal newvalue)
  {
    fieldE04TRALMD.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E04TRALMD as a BigDecimal.
  */
  public BigDecimal getBigDecimalE04TRALMD()
  {
    return fieldE04TRALMD.getBigDecimal();
  }

  /**
  * Set field E04TRALMY using a String value.
  */
  public void setE04TRALMY(String newvalue)
  {
    fieldE04TRALMY.setString(newvalue);
  }

  /**
  * Get value of field E04TRALMY as a String.
  */
  public String getE04TRALMY()
  {
    return fieldE04TRALMY.getString();
  }

  /**
  * Set numeric field E04TRALMY using a BigDecimal value.
  */
  public void setE04TRALMY(BigDecimal newvalue)
  {
    fieldE04TRALMY.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E04TRALMY as a BigDecimal.
  */
  public BigDecimal getBigDecimalE04TRALMY()
  {
    return fieldE04TRALMY.getBigDecimal();
  }

  /**
  * Set field E04TRALMT using a String value.
  */
  public void setE04TRALMT(String newvalue)
  {
    fieldE04TRALMT.setString(newvalue);
  }

  /**
  * Get value of field E04TRALMT as a String.
  */
  public String getE04TRALMT()
  {
    return fieldE04TRALMT.getString();
  }

  /**
  * Set field E04TRALMU using a String value.
  */
  public void setE04TRALMU(String newvalue)
  {
    fieldE04TRALMU.setString(newvalue);
  }

  /**
  * Get value of field E04TRALMU as a String.
  */
  public String getE04TRALMU()
  {
    return fieldE04TRALMU.getString();
  }

  /**
  * Set field E04NUMREC using a String value.
  */
  public void setE04NUMREC(String newvalue)
  {
    fieldE04NUMREC.setString(newvalue);
  }

  /**
  * Get value of field E04NUMREC as a String.
  */
  public String getE04NUMREC()
  {
    return fieldE04NUMREC.getString();
  }

  /**
  * Set numeric field E04NUMREC using a BigDecimal value.
  */
  public void setE04NUMREC(BigDecimal newvalue)
  {
    fieldE04NUMREC.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E04NUMREC as a BigDecimal.
  */
  public BigDecimal getBigDecimalE04NUMREC()
  {
    return fieldE04NUMREC.getBigDecimal();
  }

  /**
  * Set field E04INDOPE using a String value.
  */
  public void setE04INDOPE(String newvalue)
  {
    fieldE04INDOPE.setString(newvalue);
  }

  /**
  * Get value of field E04INDOPE as a String.
  */
  public String getE04INDOPE()
  {
    return fieldE04INDOPE.getString();
  }

}