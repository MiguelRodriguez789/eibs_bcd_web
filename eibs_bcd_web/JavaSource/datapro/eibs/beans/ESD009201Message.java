package datapro.eibs.beans;

import datapro.eibs.sockets.*;
import java.io.*;
import java.math.*;

import java.util.*;

/**
* Class generated by AS/400 CRTCLASS command from ESD009201 physical file definition.
* 
* File level identifier is 1171024010018.
* Record format level identifier is 323F37EAA266E.
*/

public class ESD009201Message extends MessageRecord
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
                                     "E01GEMGRP",
                                     "E01GEMMST",
                                     "E01GEMCUM",
                                     "E01GEMNA1",
                                     "E01GEMSTM",
                                     "E01GEMCUN",
                                     "E01GEMNA2",
                                     "E01GEMTID",
                                     "E01GEMPID",
                                     "E01GEMIDN",
                                     "E01GEMRLM",
                                     "E01GEMRLD",
                                     "E01GEMRLY",
                                     "E01GEMSTS",
                                     "D01GRP",
                                     "E01GEMCUS",
                                     "E01GEMCDM",
                                     "E01GEMCDD",
                                     "E01GEMCDY",
                                     "E01GEMCTM",
                                     "E01GEMMUS",
                                     "E01GEMRDM",
                                     "E01GEMRDD",
                                     "E01GEMRDY",
                                     "E01GEMMTM",
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
                                   "E01GEMGRP",
                                   "E01GEMMST",
                                   "E01GEMCUM",
                                   "E01GEMNA1",
                                   "E01GEMSTM",
                                   "E01GEMCUN",
                                   "E01GEMNA2",
                                   "E01GEMTID",
                                   "E01GEMPID",
                                   "E01GEMIDN",
                                   "E01GEMRLM",
                                   "E01GEMRLD",
                                   "E01GEMRLY",
                                   "E01GEMSTS",
                                   "D01GRP",
                                   "E01GEMCUS",
                                   "E01GEMCDM",
                                   "E01GEMCDD",
                                   "E01GEMCDY",
                                   "E01GEMCTM",
                                   "E01GEMMUS",
                                   "E01GEMRDM",
                                   "E01GEMRDD",
                                   "E01GEMRDY",
                                   "E01GEMMTM",
                                   "E01NUMREC",
                                   "E01INDOPE"
                                 };
  final static String fid = "1171024010018";
  final static String rid = "323F37EAA266E";
  final static String fmtname = "ESD009201";
  final int FIELDCOUNT = 36;
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
  private CharacterField fieldE01GEMGRP = null;
  private DecimalField fieldE01GEMMST = null;
  private DecimalField fieldE01GEMCUM = null;
  private CharacterField fieldE01GEMNA1 = null;
  private CharacterField fieldE01GEMSTM = null;
  private DecimalField fieldE01GEMCUN = null;
  private CharacterField fieldE01GEMNA2 = null;
  private CharacterField fieldE01GEMTID = null;
  private CharacterField fieldE01GEMPID = null;
  private CharacterField fieldE01GEMIDN = null;
  private DecimalField fieldE01GEMRLM = null;
  private DecimalField fieldE01GEMRLD = null;
  private DecimalField fieldE01GEMRLY = null;
  private CharacterField fieldE01GEMSTS = null;
  private CharacterField fieldD01GRP = null;
  private CharacterField fieldE01GEMCUS = null;
  private DecimalField fieldE01GEMCDM = null;
  private DecimalField fieldE01GEMCDD = null;
  private DecimalField fieldE01GEMCDY = null;
  private CharacterField fieldE01GEMCTM = null;
  private CharacterField fieldE01GEMMUS = null;
  private DecimalField fieldE01GEMRDM = null;
  private DecimalField fieldE01GEMRDD = null;
  private DecimalField fieldE01GEMRDY = null;
  private CharacterField fieldE01GEMMTM = null;
  private DecimalField fieldE01NUMREC = null;
  private CharacterField fieldE01INDOPE = null;

  /**
  * Constructor for ESD009201Message.
  */
  public ESD009201Message()
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
    recordsize = 390;
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
    fields[9] = fieldE01GEMGRP =
    new CharacterField(message, HEADERSIZE + 42, 4, "E01GEMGRP");
    fields[10] = fieldE01GEMMST =
    new DecimalField(message, HEADERSIZE + 46, 10, 0, "E01GEMMST");
    fields[11] = fieldE01GEMCUM =
    new DecimalField(message, HEADERSIZE + 56, 10, 0, "E01GEMCUM");
    fields[12] = fieldE01GEMNA1 =
    new CharacterField(message, HEADERSIZE + 66, 60, "E01GEMNA1");
    fields[13] = fieldE01GEMSTM =
    new CharacterField(message, HEADERSIZE + 126, 1, "E01GEMSTM");
    fields[14] = fieldE01GEMCUN =
    new DecimalField(message, HEADERSIZE + 127, 10, 0, "E01GEMCUN");
    fields[15] = fieldE01GEMNA2 =
    new CharacterField(message, HEADERSIZE + 137, 60, "E01GEMNA2");
    fields[16] = fieldE01GEMTID =
    new CharacterField(message, HEADERSIZE + 197, 4, "E01GEMTID");
    fields[17] = fieldE01GEMPID =
    new CharacterField(message, HEADERSIZE + 201, 4, "E01GEMPID");
    fields[18] = fieldE01GEMIDN =
    new CharacterField(message, HEADERSIZE + 205, 25, "E01GEMIDN");
    fields[19] = fieldE01GEMRLM =
    new DecimalField(message, HEADERSIZE + 230, 3, 0, "E01GEMRLM");
    fields[20] = fieldE01GEMRLD =
    new DecimalField(message, HEADERSIZE + 233, 3, 0, "E01GEMRLD");
    fields[21] = fieldE01GEMRLY =
    new DecimalField(message, HEADERSIZE + 236, 5, 0, "E01GEMRLY");
    fields[22] = fieldE01GEMSTS =
    new CharacterField(message, HEADERSIZE + 241, 1, "E01GEMSTS");
    fields[23] = fieldD01GRP =
    new CharacterField(message, HEADERSIZE + 242, 45, "D01GRP");
    fields[24] = fieldE01GEMCUS =
    new CharacterField(message, HEADERSIZE + 287, 10, "E01GEMCUS");
    fields[25] = fieldE01GEMCDM =
    new DecimalField(message, HEADERSIZE + 297, 3, 0, "E01GEMCDM");
    fields[26] = fieldE01GEMCDD =
    new DecimalField(message, HEADERSIZE + 300, 3, 0, "E01GEMCDD");
    fields[27] = fieldE01GEMCDY =
    new DecimalField(message, HEADERSIZE + 303, 5, 0, "E01GEMCDY");
    fields[28] = fieldE01GEMCTM =
    new CharacterField(message, HEADERSIZE + 308, 26, "E01GEMCTM");
    fields[29] = fieldE01GEMMUS =
    new CharacterField(message, HEADERSIZE + 334, 10, "E01GEMMUS");
    fields[30] = fieldE01GEMRDM =
    new DecimalField(message, HEADERSIZE + 344, 3, 0, "E01GEMRDM");
    fields[31] = fieldE01GEMRDD =
    new DecimalField(message, HEADERSIZE + 347, 3, 0, "E01GEMRDD");
    fields[32] = fieldE01GEMRDY =
    new DecimalField(message, HEADERSIZE + 350, 5, 0, "E01GEMRDY");
    fields[33] = fieldE01GEMMTM =
    new CharacterField(message, HEADERSIZE + 355, 26, "E01GEMMTM");
    fields[34] = fieldE01NUMREC =
    new DecimalField(message, HEADERSIZE + 381, 8, 0, "E01NUMREC");
    fields[35] = fieldE01INDOPE =
    new CharacterField(message, HEADERSIZE + 389, 1, "E01INDOPE");

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
  * Set field E01GEMGRP using a String value.
  */
  public void setE01GEMGRP(String newvalue)
  {
    fieldE01GEMGRP.setString(newvalue);
  }

  /**
  * Get value of field E01GEMGRP as a String.
  */
  public String getE01GEMGRP()
  {
    return fieldE01GEMGRP.getString();
  }

  /**
  * Set field E01GEMMST using a String value.
  */
  public void setE01GEMMST(String newvalue)
  {
    fieldE01GEMMST.setString(newvalue);
  }

  /**
  * Get value of field E01GEMMST as a String.
  */
  public String getE01GEMMST()
  {
    return fieldE01GEMMST.getString();
  }

  /**
  * Set numeric field E01GEMMST using a BigDecimal value.
  */
  public void setE01GEMMST(BigDecimal newvalue)
  {
    fieldE01GEMMST.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01GEMMST as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01GEMMST()
  {
    return fieldE01GEMMST.getBigDecimal();
  }

  /**
  * Set field E01GEMCUM using a String value.
  */
  public void setE01GEMCUM(String newvalue)
  {
    fieldE01GEMCUM.setString(newvalue);
  }

  /**
  * Get value of field E01GEMCUM as a String.
  */
  public String getE01GEMCUM()
  {
    return fieldE01GEMCUM.getString();
  }

  /**
  * Set numeric field E01GEMCUM using a BigDecimal value.
  */
  public void setE01GEMCUM(BigDecimal newvalue)
  {
    fieldE01GEMCUM.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01GEMCUM as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01GEMCUM()
  {
    return fieldE01GEMCUM.getBigDecimal();
  }

  /**
  * Set field E01GEMNA1 using a String value.
  */
  public void setE01GEMNA1(String newvalue)
  {
    fieldE01GEMNA1.setString(newvalue);
  }

  /**
  * Get value of field E01GEMNA1 as a String.
  */
  public String getE01GEMNA1()
  {
    return fieldE01GEMNA1.getString();
  }

  /**
  * Set field E01GEMSTM using a String value.
  */
  public void setE01GEMSTM(String newvalue)
  {
    fieldE01GEMSTM.setString(newvalue);
  }

  /**
  * Get value of field E01GEMSTM as a String.
  */
  public String getE01GEMSTM()
  {
    return fieldE01GEMSTM.getString();
  }

  /**
  * Set field E01GEMCUN using a String value.
  */
  public void setE01GEMCUN(String newvalue)
  {
    fieldE01GEMCUN.setString(newvalue);
  }

  /**
  * Get value of field E01GEMCUN as a String.
  */
  public String getE01GEMCUN()
  {
    return fieldE01GEMCUN.getString();
  }

  /**
  * Set numeric field E01GEMCUN using a BigDecimal value.
  */
  public void setE01GEMCUN(BigDecimal newvalue)
  {
    fieldE01GEMCUN.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01GEMCUN as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01GEMCUN()
  {
    return fieldE01GEMCUN.getBigDecimal();
  }

  /**
  * Set field E01GEMNA2 using a String value.
  */
  public void setE01GEMNA2(String newvalue)
  {
    fieldE01GEMNA2.setString(newvalue);
  }

  /**
  * Get value of field E01GEMNA2 as a String.
  */
  public String getE01GEMNA2()
  {
    return fieldE01GEMNA2.getString();
  }

  /**
  * Set field E01GEMTID using a String value.
  */
  public void setE01GEMTID(String newvalue)
  {
    fieldE01GEMTID.setString(newvalue);
  }

  /**
  * Get value of field E01GEMTID as a String.
  */
  public String getE01GEMTID()
  {
    return fieldE01GEMTID.getString();
  }

  /**
  * Set field E01GEMPID using a String value.
  */
  public void setE01GEMPID(String newvalue)
  {
    fieldE01GEMPID.setString(newvalue);
  }

  /**
  * Get value of field E01GEMPID as a String.
  */
  public String getE01GEMPID()
  {
    return fieldE01GEMPID.getString();
  }

  /**
  * Set field E01GEMIDN using a String value.
  */
  public void setE01GEMIDN(String newvalue)
  {
    fieldE01GEMIDN.setString(newvalue);
  }

  /**
  * Get value of field E01GEMIDN as a String.
  */
  public String getE01GEMIDN()
  {
    return fieldE01GEMIDN.getString();
  }

  /**
  * Set field E01GEMRLM using a String value.
  */
  public void setE01GEMRLM(String newvalue)
  {
    fieldE01GEMRLM.setString(newvalue);
  }

  /**
  * Get value of field E01GEMRLM as a String.
  */
  public String getE01GEMRLM()
  {
    return fieldE01GEMRLM.getString();
  }

  /**
  * Set numeric field E01GEMRLM using a BigDecimal value.
  */
  public void setE01GEMRLM(BigDecimal newvalue)
  {
    fieldE01GEMRLM.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01GEMRLM as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01GEMRLM()
  {
    return fieldE01GEMRLM.getBigDecimal();
  }

  /**
  * Set field E01GEMRLD using a String value.
  */
  public void setE01GEMRLD(String newvalue)
  {
    fieldE01GEMRLD.setString(newvalue);
  }

  /**
  * Get value of field E01GEMRLD as a String.
  */
  public String getE01GEMRLD()
  {
    return fieldE01GEMRLD.getString();
  }

  /**
  * Set numeric field E01GEMRLD using a BigDecimal value.
  */
  public void setE01GEMRLD(BigDecimal newvalue)
  {
    fieldE01GEMRLD.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01GEMRLD as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01GEMRLD()
  {
    return fieldE01GEMRLD.getBigDecimal();
  }

  /**
  * Set field E01GEMRLY using a String value.
  */
  public void setE01GEMRLY(String newvalue)
  {
    fieldE01GEMRLY.setString(newvalue);
  }

  /**
  * Get value of field E01GEMRLY as a String.
  */
  public String getE01GEMRLY()
  {
    return fieldE01GEMRLY.getString();
  }

  /**
  * Set numeric field E01GEMRLY using a BigDecimal value.
  */
  public void setE01GEMRLY(BigDecimal newvalue)
  {
    fieldE01GEMRLY.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01GEMRLY as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01GEMRLY()
  {
    return fieldE01GEMRLY.getBigDecimal();
  }

  /**
  * Set field E01GEMSTS using a String value.
  */
  public void setE01GEMSTS(String newvalue)
  {
    fieldE01GEMSTS.setString(newvalue);
  }

  /**
  * Get value of field E01GEMSTS as a String.
  */
  public String getE01GEMSTS()
  {
    return fieldE01GEMSTS.getString();
  }

  /**
  * Set field D01GRP using a String value.
  */
  public void setD01GRP(String newvalue)
  {
    fieldD01GRP.setString(newvalue);
  }

  /**
  * Get value of field D01GRP as a String.
  */
  public String getD01GRP()
  {
    return fieldD01GRP.getString();
  }

  /**
  * Set field E01GEMCUS using a String value.
  */
  public void setE01GEMCUS(String newvalue)
  {
    fieldE01GEMCUS.setString(newvalue);
  }

  /**
  * Get value of field E01GEMCUS as a String.
  */
  public String getE01GEMCUS()
  {
    return fieldE01GEMCUS.getString();
  }

  /**
  * Set field E01GEMCDM using a String value.
  */
  public void setE01GEMCDM(String newvalue)
  {
    fieldE01GEMCDM.setString(newvalue);
  }

  /**
  * Get value of field E01GEMCDM as a String.
  */
  public String getE01GEMCDM()
  {
    return fieldE01GEMCDM.getString();
  }

  /**
  * Set numeric field E01GEMCDM using a BigDecimal value.
  */
  public void setE01GEMCDM(BigDecimal newvalue)
  {
    fieldE01GEMCDM.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01GEMCDM as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01GEMCDM()
  {
    return fieldE01GEMCDM.getBigDecimal();
  }

  /**
  * Set field E01GEMCDD using a String value.
  */
  public void setE01GEMCDD(String newvalue)
  {
    fieldE01GEMCDD.setString(newvalue);
  }

  /**
  * Get value of field E01GEMCDD as a String.
  */
  public String getE01GEMCDD()
  {
    return fieldE01GEMCDD.getString();
  }

  /**
  * Set numeric field E01GEMCDD using a BigDecimal value.
  */
  public void setE01GEMCDD(BigDecimal newvalue)
  {
    fieldE01GEMCDD.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01GEMCDD as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01GEMCDD()
  {
    return fieldE01GEMCDD.getBigDecimal();
  }

  /**
  * Set field E01GEMCDY using a String value.
  */
  public void setE01GEMCDY(String newvalue)
  {
    fieldE01GEMCDY.setString(newvalue);
  }

  /**
  * Get value of field E01GEMCDY as a String.
  */
  public String getE01GEMCDY()
  {
    return fieldE01GEMCDY.getString();
  }

  /**
  * Set numeric field E01GEMCDY using a BigDecimal value.
  */
  public void setE01GEMCDY(BigDecimal newvalue)
  {
    fieldE01GEMCDY.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01GEMCDY as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01GEMCDY()
  {
    return fieldE01GEMCDY.getBigDecimal();
  }

  /**
  * Set field E01GEMCTM using a String value.
  */
  public void setE01GEMCTM(String newvalue)
  {
    fieldE01GEMCTM.setString(newvalue);
  }

  /**
  * Get value of field E01GEMCTM as a String.
  */
  public String getE01GEMCTM()
  {
    return fieldE01GEMCTM.getString();
  }

  /**
  * Set field E01GEMMUS using a String value.
  */
  public void setE01GEMMUS(String newvalue)
  {
    fieldE01GEMMUS.setString(newvalue);
  }

  /**
  * Get value of field E01GEMMUS as a String.
  */
  public String getE01GEMMUS()
  {
    return fieldE01GEMMUS.getString();
  }

  /**
  * Set field E01GEMRDM using a String value.
  */
  public void setE01GEMRDM(String newvalue)
  {
    fieldE01GEMRDM.setString(newvalue);
  }

  /**
  * Get value of field E01GEMRDM as a String.
  */
  public String getE01GEMRDM()
  {
    return fieldE01GEMRDM.getString();
  }

  /**
  * Set numeric field E01GEMRDM using a BigDecimal value.
  */
  public void setE01GEMRDM(BigDecimal newvalue)
  {
    fieldE01GEMRDM.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01GEMRDM as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01GEMRDM()
  {
    return fieldE01GEMRDM.getBigDecimal();
  }

  /**
  * Set field E01GEMRDD using a String value.
  */
  public void setE01GEMRDD(String newvalue)
  {
    fieldE01GEMRDD.setString(newvalue);
  }

  /**
  * Get value of field E01GEMRDD as a String.
  */
  public String getE01GEMRDD()
  {
    return fieldE01GEMRDD.getString();
  }

  /**
  * Set numeric field E01GEMRDD using a BigDecimal value.
  */
  public void setE01GEMRDD(BigDecimal newvalue)
  {
    fieldE01GEMRDD.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01GEMRDD as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01GEMRDD()
  {
    return fieldE01GEMRDD.getBigDecimal();
  }

  /**
  * Set field E01GEMRDY using a String value.
  */
  public void setE01GEMRDY(String newvalue)
  {
    fieldE01GEMRDY.setString(newvalue);
  }

  /**
  * Get value of field E01GEMRDY as a String.
  */
  public String getE01GEMRDY()
  {
    return fieldE01GEMRDY.getString();
  }

  /**
  * Set numeric field E01GEMRDY using a BigDecimal value.
  */
  public void setE01GEMRDY(BigDecimal newvalue)
  {
    fieldE01GEMRDY.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01GEMRDY as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01GEMRDY()
  {
    return fieldE01GEMRDY.getBigDecimal();
  }

  /**
  * Set field E01GEMMTM using a String value.
  */
  public void setE01GEMMTM(String newvalue)
  {
    fieldE01GEMMTM.setString(newvalue);
  }

  /**
  * Get value of field E01GEMMTM as a String.
  */
  public String getE01GEMMTM()
  {
    return fieldE01GEMMTM.getString();
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