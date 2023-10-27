package datapro.eibs.beans;

import datapro.eibs.sockets.*;
import java.io.*;
import java.math.*;

import java.util.*;

/**
* Class generated by AS/400 CRTCLASS command from EDD009501 physical file definition.
* 
* File level identifier is 1100706173546.
* Record format level identifier is 37A5264459E1A.
*/

public class EDD009501Message extends MessageRecord
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
                                     "E01ACMACC",
                                     "E01ACMPRO",
                                     "E01ACMCUN",
                                     "E01CUSNA1",
                                     "E01ACMBNK",
                                     "E01ACMBRN",
                                     "E01ACMCCY",
                                     "E01ACMGLN",
                                     "E01ACMCCN",
                                     "E01ACMGAV",
                                     "E01ACMNAV",
                                     "E01ACMGMA",
                                     "E01ACMNMA",
                                     "E01ACMMOA"
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
                                   "E01ACMACC",
                                   "E01ACMPRO",
                                   "E01ACMCUN",
                                   "E01CUSNA1",
                                   "E01ACMBNK",
                                   "E01ACMBRN",
                                   "E01ACMCCY",
                                   "E01ACMGLN",
                                   "E01ACMCCN",
                                   "E01ACMGAV",
                                   "E01ACMNAV",
                                   "E01ACMGMA",
                                   "E01ACMNMA",
                                   "E01ACMMOA"
                                 };
  final static String fid = "1100706173546";
  final static String rid = "37A5264459E1A";
  final static String fmtname = "EDD009501";
  final int FIELDCOUNT = 23;
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
  private DecimalField fieldE01ACMACC = null;
  private CharacterField fieldE01ACMPRO = null;
  private DecimalField fieldE01ACMCUN = null;
  private CharacterField fieldE01CUSNA1 = null;
  private CharacterField fieldE01ACMBNK = null;
  private DecimalField fieldE01ACMBRN = null;
  private CharacterField fieldE01ACMCCY = null;
  private DecimalField fieldE01ACMGLN = null;
  private DecimalField fieldE01ACMCCN = null;
  private DecimalField fieldE01ACMGAV = null;
  private DecimalField fieldE01ACMNAV = null;
  private DecimalField fieldE01ACMGMA = null;
  private DecimalField fieldE01ACMNMA = null;
  private DecimalField fieldE01ACMMOA = null;

  /**
  * Constructor for EDD009501Message.
  */
  public EDD009501Message()
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
    recordsize = 244;
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
    fields[9] = fieldE01ACMACC =
    new DecimalField(message, HEADERSIZE + 42, 13, 0, "E01ACMACC");
    fields[10] = fieldE01ACMPRO =
    new CharacterField(message, HEADERSIZE + 55, 4, "E01ACMPRO");
    fields[11] = fieldE01ACMCUN =
    new DecimalField(message, HEADERSIZE + 59, 10, 0, "E01ACMCUN");
    fields[12] = fieldE01CUSNA1 =
    new CharacterField(message, HEADERSIZE + 69, 45, "E01CUSNA1");
    fields[13] = fieldE01ACMBNK =
    new CharacterField(message, HEADERSIZE + 114, 2, "E01ACMBNK");
    fields[14] = fieldE01ACMBRN =
    new DecimalField(message, HEADERSIZE + 116, 4, 0, "E01ACMBRN");
    fields[15] = fieldE01ACMCCY =
    new CharacterField(message, HEADERSIZE + 120, 3, "E01ACMCCY");
    fields[16] = fieldE01ACMGLN =
    new DecimalField(message, HEADERSIZE + 123, 17, 0, "E01ACMGLN");
    fields[17] = fieldE01ACMCCN =
    new DecimalField(message, HEADERSIZE + 140, 9, 0, "E01ACMCCN");
    fields[18] = fieldE01ACMGAV =
    new DecimalField(message, HEADERSIZE + 149, 19, 2, "E01ACMGAV");
    fields[19] = fieldE01ACMNAV =
    new DecimalField(message, HEADERSIZE + 168, 19, 2, "E01ACMNAV");
    fields[20] = fieldE01ACMGMA =
    new DecimalField(message, HEADERSIZE + 187, 19, 2, "E01ACMGMA");
    fields[21] = fieldE01ACMNMA =
    new DecimalField(message, HEADERSIZE + 206, 19, 2, "E01ACMNMA");
    fields[22] = fieldE01ACMMOA =
    new DecimalField(message, HEADERSIZE + 225, 19, 2, "E01ACMMOA");

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
  * Set field E01ACMACC using a String value.
  */
  public void setE01ACMACC(String newvalue)
  {
    fieldE01ACMACC.setString(newvalue);
  }

  /**
  * Get value of field E01ACMACC as a String.
  */
  public String getE01ACMACC()
  {
    return fieldE01ACMACC.getString();
  }

  /**
  * Set numeric field E01ACMACC using a BigDecimal value.
  */
  public void setE01ACMACC(BigDecimal newvalue)
  {
    fieldE01ACMACC.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01ACMACC as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01ACMACC()
  {
    return fieldE01ACMACC.getBigDecimal();
  }

  /**
  * Set field E01ACMPRO using a String value.
  */
  public void setE01ACMPRO(String newvalue)
  {
    fieldE01ACMPRO.setString(newvalue);
  }

  /**
  * Get value of field E01ACMPRO as a String.
  */
  public String getE01ACMPRO()
  {
    return fieldE01ACMPRO.getString();
  }

  /**
  * Set field E01ACMCUN using a String value.
  */
  public void setE01ACMCUN(String newvalue)
  {
    fieldE01ACMCUN.setString(newvalue);
  }

  /**
  * Get value of field E01ACMCUN as a String.
  */
  public String getE01ACMCUN()
  {
    return fieldE01ACMCUN.getString();
  }

  /**
  * Set numeric field E01ACMCUN using a BigDecimal value.
  */
  public void setE01ACMCUN(BigDecimal newvalue)
  {
    fieldE01ACMCUN.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01ACMCUN as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01ACMCUN()
  {
    return fieldE01ACMCUN.getBigDecimal();
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
  * Set field E01ACMBNK using a String value.
  */
  public void setE01ACMBNK(String newvalue)
  {
    fieldE01ACMBNK.setString(newvalue);
  }

  /**
  * Get value of field E01ACMBNK as a String.
  */
  public String getE01ACMBNK()
  {
    return fieldE01ACMBNK.getString();
  }

  /**
  * Set field E01ACMBRN using a String value.
  */
  public void setE01ACMBRN(String newvalue)
  {
    fieldE01ACMBRN.setString(newvalue);
  }

  /**
  * Get value of field E01ACMBRN as a String.
  */
  public String getE01ACMBRN()
  {
    return fieldE01ACMBRN.getString();
  }

  /**
  * Set numeric field E01ACMBRN using a BigDecimal value.
  */
  public void setE01ACMBRN(BigDecimal newvalue)
  {
    fieldE01ACMBRN.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01ACMBRN as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01ACMBRN()
  {
    return fieldE01ACMBRN.getBigDecimal();
  }

  /**
  * Set field E01ACMCCY using a String value.
  */
  public void setE01ACMCCY(String newvalue)
  {
    fieldE01ACMCCY.setString(newvalue);
  }

  /**
  * Get value of field E01ACMCCY as a String.
  */
  public String getE01ACMCCY()
  {
    return fieldE01ACMCCY.getString();
  }

  /**
  * Set field E01ACMGLN using a String value.
  */
  public void setE01ACMGLN(String newvalue)
  {
    fieldE01ACMGLN.setString(newvalue);
  }

  /**
  * Get value of field E01ACMGLN as a String.
  */
  public String getE01ACMGLN()
  {
    return fieldE01ACMGLN.getString();
  }

  /**
  * Set numeric field E01ACMGLN using a BigDecimal value.
  */
  public void setE01ACMGLN(BigDecimal newvalue)
  {
    fieldE01ACMGLN.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01ACMGLN as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01ACMGLN()
  {
    return fieldE01ACMGLN.getBigDecimal();
  }

  /**
  * Set field E01ACMCCN using a String value.
  */
  public void setE01ACMCCN(String newvalue)
  {
    fieldE01ACMCCN.setString(newvalue);
  }

  /**
  * Get value of field E01ACMCCN as a String.
  */
  public String getE01ACMCCN()
  {
    return fieldE01ACMCCN.getString();
  }

  /**
  * Set numeric field E01ACMCCN using a BigDecimal value.
  */
  public void setE01ACMCCN(BigDecimal newvalue)
  {
    fieldE01ACMCCN.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01ACMCCN as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01ACMCCN()
  {
    return fieldE01ACMCCN.getBigDecimal();
  }

  /**
  * Set field E01ACMGAV using a String value.
  */
  public void setE01ACMGAV(String newvalue)
  {
    fieldE01ACMGAV.setString(newvalue);
  }

  /**
  * Get value of field E01ACMGAV as a String.
  */
  public String getE01ACMGAV()
  {
    return fieldE01ACMGAV.getString();
  }

  /**
  * Set numeric field E01ACMGAV using a BigDecimal value.
  */
  public void setE01ACMGAV(BigDecimal newvalue)
  {
    fieldE01ACMGAV.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01ACMGAV as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01ACMGAV()
  {
    return fieldE01ACMGAV.getBigDecimal();
  }

  /**
  * Set field E01ACMNAV using a String value.
  */
  public void setE01ACMNAV(String newvalue)
  {
    fieldE01ACMNAV.setString(newvalue);
  }

  /**
  * Get value of field E01ACMNAV as a String.
  */
  public String getE01ACMNAV()
  {
    return fieldE01ACMNAV.getString();
  }

  /**
  * Set numeric field E01ACMNAV using a BigDecimal value.
  */
  public void setE01ACMNAV(BigDecimal newvalue)
  {
    fieldE01ACMNAV.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01ACMNAV as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01ACMNAV()
  {
    return fieldE01ACMNAV.getBigDecimal();
  }

  /**
  * Set field E01ACMGMA using a String value.
  */
  public void setE01ACMGMA(String newvalue)
  {
    fieldE01ACMGMA.setString(newvalue);
  }

  /**
  * Get value of field E01ACMGMA as a String.
  */
  public String getE01ACMGMA()
  {
    return fieldE01ACMGMA.getString();
  }

  /**
  * Set numeric field E01ACMGMA using a BigDecimal value.
  */
  public void setE01ACMGMA(BigDecimal newvalue)
  {
    fieldE01ACMGMA.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01ACMGMA as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01ACMGMA()
  {
    return fieldE01ACMGMA.getBigDecimal();
  }

  /**
  * Set field E01ACMNMA using a String value.
  */
  public void setE01ACMNMA(String newvalue)
  {
    fieldE01ACMNMA.setString(newvalue);
  }

  /**
  * Get value of field E01ACMNMA as a String.
  */
  public String getE01ACMNMA()
  {
    return fieldE01ACMNMA.getString();
  }

  /**
  * Set numeric field E01ACMNMA using a BigDecimal value.
  */
  public void setE01ACMNMA(BigDecimal newvalue)
  {
    fieldE01ACMNMA.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01ACMNMA as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01ACMNMA()
  {
    return fieldE01ACMNMA.getBigDecimal();
  }

  /**
  * Set field E01ACMMOA using a String value.
  */
  public void setE01ACMMOA(String newvalue)
  {
    fieldE01ACMMOA.setString(newvalue);
  }

  /**
  * Get value of field E01ACMMOA as a String.
  */
  public String getE01ACMMOA()
  {
    return fieldE01ACMMOA.getString();
  }

  /**
  * Set numeric field E01ACMMOA using a BigDecimal value.
  */
  public void setE01ACMMOA(BigDecimal newvalue)
  {
    fieldE01ACMMOA.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01ACMMOA as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01ACMMOA()
  {
    return fieldE01ACMMOA.getBigDecimal();
  }

}
