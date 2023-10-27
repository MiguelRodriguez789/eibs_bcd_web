package datapro.eibs.beans;

import datapro.eibs.sockets.*;
import java.io.*;
import java.math.*;

import java.util.*;

/**
* Class generated by AS/400 CRTCLASS command from ELC050008 physical file definition.
* 
* File level identifier is 1140108171633.
* Record format level identifier is 50C77F8385297.
*/

public class ELC050008Message extends MessageRecord
{
  final static String fldnames[] = {
                                     "H08USERID",
                                     "H08PROGRM",
                                     "H08TIMSYS",
                                     "H08SCRCOD",
                                     "H08OPECOD",
                                     "H08FLGMAS",
                                     "H08FLGWK1",
                                     "H08FLGWK2",
                                     "H08FLGWK3",
                                     "E08LCMACC",
                                     "E08LCMCUN",
                                     "E08CUSNA1",
                                     "E08LCMPRO",
                                     "E08LCMBNK",
                                     "E08LCMATY",
                                     "E08LCMTYP",
                                     "E08CCCTTA",
                                     "E08CCCVTT",
                                     "E08CCCVST",
                                     "E08CCCVEN",
                                     "E08CCCIPT",
                                     "E08CCCTBA"
                                   };
  final static String tnames[] = {
                                   "H08USERID",
                                   "H08PROGRM",
                                   "H08TIMSYS",
                                   "H08SCRCOD",
                                   "H08OPECOD",
                                   "H08FLGMAS",
                                   "H08FLGWK1",
                                   "H08FLGWK2",
                                   "H08FLGWK3",
                                   "E08LCMACC",
                                   "E08LCMCUN",
                                   "E08CUSNA1",
                                   "E08LCMPRO",
                                   "E08LCMBNK",
                                   "E08LCMATY",
                                   "E08LCMTYP",
                                   "E08CCCTTA",
                                   "E08CCCVTT",
                                   "E08CCCVST",
                                   "E08CCCVEN",
                                   "E08CCCIPT",
                                   "E08CCCTBA"
                                 };
  final static String fid = "1140108171633";
  final static String rid = "50C77F8385297";
  final static String fmtname = "ELC050008";
  final int FIELDCOUNT = 22;
  private static Hashtable tlookup = new Hashtable();
  private CharacterField fieldH08USERID = null;
  private CharacterField fieldH08PROGRM = null;
  private CharacterField fieldH08TIMSYS = null;
  private CharacterField fieldH08SCRCOD = null;
  private CharacterField fieldH08OPECOD = null;
  private CharacterField fieldH08FLGMAS = null;
  private CharacterField fieldH08FLGWK1 = null;
  private CharacterField fieldH08FLGWK2 = null;
  private CharacterField fieldH08FLGWK3 = null;
  private DecimalField fieldE08LCMACC = null;
  private DecimalField fieldE08LCMCUN = null;
  private CharacterField fieldE08CUSNA1 = null;
  private CharacterField fieldE08LCMPRO = null;
  private CharacterField fieldE08LCMBNK = null;
  private CharacterField fieldE08LCMATY = null;
  private CharacterField fieldE08LCMTYP = null;
  private CharacterField fieldE08CCCTTA = null;
  private DecimalField fieldE08CCCVTT = null;
  private DecimalField fieldE08CCCVST = null;
  private DecimalField fieldE08CCCVEN = null;
  private DecimalField fieldE08CCCIPT = null;
  private DecimalField fieldE08CCCTBA = null;

  /**
  * Constructor for ELC050008Message.
  */
  public ELC050008Message()
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
    recordsize = 193;
    fileid = fid;
    recordid = rid;
    message = new byte[getByteLength()];
    formatname = fmtname;
    fieldnames = fldnames;
    tagnames = tnames;
    fields = new MessageField[FIELDCOUNT];

    fields[0] = fieldH08USERID =
    new CharacterField(message, HEADERSIZE + 0, 10, "H08USERID");
    fields[1] = fieldH08PROGRM =
    new CharacterField(message, HEADERSIZE + 10, 10, "H08PROGRM");
    fields[2] = fieldH08TIMSYS =
    new CharacterField(message, HEADERSIZE + 20, 12, "H08TIMSYS");
    fields[3] = fieldH08SCRCOD =
    new CharacterField(message, HEADERSIZE + 32, 2, "H08SCRCOD");
    fields[4] = fieldH08OPECOD =
    new CharacterField(message, HEADERSIZE + 34, 4, "H08OPECOD");
    fields[5] = fieldH08FLGMAS =
    new CharacterField(message, HEADERSIZE + 38, 1, "H08FLGMAS");
    fields[6] = fieldH08FLGWK1 =
    new CharacterField(message, HEADERSIZE + 39, 1, "H08FLGWK1");
    fields[7] = fieldH08FLGWK2 =
    new CharacterField(message, HEADERSIZE + 40, 1, "H08FLGWK2");
    fields[8] = fieldH08FLGWK3 =
    new CharacterField(message, HEADERSIZE + 41, 1, "H08FLGWK3");
    fields[9] = fieldE08LCMACC =
    new DecimalField(message, HEADERSIZE + 42, 13, 0, "E08LCMACC");
    fields[10] = fieldE08LCMCUN =
    new DecimalField(message, HEADERSIZE + 55, 10, 0, "E08LCMCUN");
    fields[11] = fieldE08CUSNA1 =
    new CharacterField(message, HEADERSIZE + 65, 60, "E08CUSNA1");
    fields[12] = fieldE08LCMPRO =
    new CharacterField(message, HEADERSIZE + 125, 4, "E08LCMPRO");
    fields[13] = fieldE08LCMBNK =
    new CharacterField(message, HEADERSIZE + 129, 2, "E08LCMBNK");
    fields[14] = fieldE08LCMATY =
    new CharacterField(message, HEADERSIZE + 131, 4, "E08LCMATY");
    fields[15] = fieldE08LCMTYP =
    new CharacterField(message, HEADERSIZE + 135, 1, "E08LCMTYP");
    fields[16] = fieldE08CCCTTA =
    new CharacterField(message, HEADERSIZE + 136, 2, "E08CCCTTA");
    fields[17] = fieldE08CCCVTT =
    new DecimalField(message, HEADERSIZE + 138, 11, 6, "E08CCCVTT");
    fields[18] = fieldE08CCCVST =
    new DecimalField(message, HEADERSIZE + 149, 11, 6, "E08CCCVST");
    fields[19] = fieldE08CCCVEN =
    new DecimalField(message, HEADERSIZE + 160, 11, 6, "E08CCCVEN");
    fields[20] = fieldE08CCCIPT =
    new DecimalField(message, HEADERSIZE + 171, 11, 6, "E08CCCIPT");
    fields[21] = fieldE08CCCTBA =
    new DecimalField(message, HEADERSIZE + 182, 11, 6, "E08CCCTBA");

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
  * Set field H08USERID using a String value.
  */
  public void setH08USERID(String newvalue)
  {
    fieldH08USERID.setString(newvalue);
  }

  /**
  * Get value of field H08USERID as a String.
  */
  public String getH08USERID()
  {
    return fieldH08USERID.getString();
  }

  /**
  * Set field H08PROGRM using a String value.
  */
  public void setH08PROGRM(String newvalue)
  {
    fieldH08PROGRM.setString(newvalue);
  }

  /**
  * Get value of field H08PROGRM as a String.
  */
  public String getH08PROGRM()
  {
    return fieldH08PROGRM.getString();
  }

  /**
  * Set field H08TIMSYS using a String value.
  */
  public void setH08TIMSYS(String newvalue)
  {
    fieldH08TIMSYS.setString(newvalue);
  }

  /**
  * Get value of field H08TIMSYS as a String.
  */
  public String getH08TIMSYS()
  {
    return fieldH08TIMSYS.getString();
  }

  /**
  * Set field H08SCRCOD using a String value.
  */
  public void setH08SCRCOD(String newvalue)
  {
    fieldH08SCRCOD.setString(newvalue);
  }

  /**
  * Get value of field H08SCRCOD as a String.
  */
  public String getH08SCRCOD()
  {
    return fieldH08SCRCOD.getString();
  }

  /**
  * Set field H08OPECOD using a String value.
  */
  public void setH08OPECOD(String newvalue)
  {
    fieldH08OPECOD.setString(newvalue);
  }

  /**
  * Get value of field H08OPECOD as a String.
  */
  public String getH08OPECOD()
  {
    return fieldH08OPECOD.getString();
  }

  /**
  * Set field H08FLGMAS using a String value.
  */
  public void setH08FLGMAS(String newvalue)
  {
    fieldH08FLGMAS.setString(newvalue);
  }

  /**
  * Get value of field H08FLGMAS as a String.
  */
  public String getH08FLGMAS()
  {
    return fieldH08FLGMAS.getString();
  }

  /**
  * Set field H08FLGWK1 using a String value.
  */
  public void setH08FLGWK1(String newvalue)
  {
    fieldH08FLGWK1.setString(newvalue);
  }

  /**
  * Get value of field H08FLGWK1 as a String.
  */
  public String getH08FLGWK1()
  {
    return fieldH08FLGWK1.getString();
  }

  /**
  * Set field H08FLGWK2 using a String value.
  */
  public void setH08FLGWK2(String newvalue)
  {
    fieldH08FLGWK2.setString(newvalue);
  }

  /**
  * Get value of field H08FLGWK2 as a String.
  */
  public String getH08FLGWK2()
  {
    return fieldH08FLGWK2.getString();
  }

  /**
  * Set field H08FLGWK3 using a String value.
  */
  public void setH08FLGWK3(String newvalue)
  {
    fieldH08FLGWK3.setString(newvalue);
  }

  /**
  * Get value of field H08FLGWK3 as a String.
  */
  public String getH08FLGWK3()
  {
    return fieldH08FLGWK3.getString();
  }

  /**
  * Set field E08LCMACC using a String value.
  */
  public void setE08LCMACC(String newvalue)
  {
    fieldE08LCMACC.setString(newvalue);
  }

  /**
  * Get value of field E08LCMACC as a String.
  */
  public String getE08LCMACC()
  {
    return fieldE08LCMACC.getString();
  }

  /**
  * Set numeric field E08LCMACC using a BigDecimal value.
  */
  public void setE08LCMACC(BigDecimal newvalue)
  {
    fieldE08LCMACC.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E08LCMACC as a BigDecimal.
  */
  public BigDecimal getBigDecimalE08LCMACC()
  {
    return fieldE08LCMACC.getBigDecimal();
  }

  /**
  * Set field E08LCMCUN using a String value.
  */
  public void setE08LCMCUN(String newvalue)
  {
    fieldE08LCMCUN.setString(newvalue);
  }

  /**
  * Get value of field E08LCMCUN as a String.
  */
  public String getE08LCMCUN()
  {
    return fieldE08LCMCUN.getString();
  }

  /**
  * Set numeric field E08LCMCUN using a BigDecimal value.
  */
  public void setE08LCMCUN(BigDecimal newvalue)
  {
    fieldE08LCMCUN.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E08LCMCUN as a BigDecimal.
  */
  public BigDecimal getBigDecimalE08LCMCUN()
  {
    return fieldE08LCMCUN.getBigDecimal();
  }

  /**
  * Set field E08CUSNA1 using a String value.
  */
  public void setE08CUSNA1(String newvalue)
  {
    fieldE08CUSNA1.setString(newvalue);
  }

  /**
  * Get value of field E08CUSNA1 as a String.
  */
  public String getE08CUSNA1()
  {
    return fieldE08CUSNA1.getString();
  }

  /**
  * Set field E08LCMPRO using a String value.
  */
  public void setE08LCMPRO(String newvalue)
  {
    fieldE08LCMPRO.setString(newvalue);
  }

  /**
  * Get value of field E08LCMPRO as a String.
  */
  public String getE08LCMPRO()
  {
    return fieldE08LCMPRO.getString();
  }

  /**
  * Set field E08LCMBNK using a String value.
  */
  public void setE08LCMBNK(String newvalue)
  {
    fieldE08LCMBNK.setString(newvalue);
  }

  /**
  * Get value of field E08LCMBNK as a String.
  */
  public String getE08LCMBNK()
  {
    return fieldE08LCMBNK.getString();
  }

  /**
  * Set field E08LCMATY using a String value.
  */
  public void setE08LCMATY(String newvalue)
  {
    fieldE08LCMATY.setString(newvalue);
  }

  /**
  * Get value of field E08LCMATY as a String.
  */
  public String getE08LCMATY()
  {
    return fieldE08LCMATY.getString();
  }

  /**
  * Set field E08LCMTYP using a String value.
  */
  public void setE08LCMTYP(String newvalue)
  {
    fieldE08LCMTYP.setString(newvalue);
  }

  /**
  * Get value of field E08LCMTYP as a String.
  */
  public String getE08LCMTYP()
  {
    return fieldE08LCMTYP.getString();
  }

  /**
  * Set field E08CCCTTA using a String value.
  */
  public void setE08CCCTTA(String newvalue)
  {
    fieldE08CCCTTA.setString(newvalue);
  }

  /**
  * Get value of field E08CCCTTA as a String.
  */
  public String getE08CCCTTA()
  {
    return fieldE08CCCTTA.getString();
  }

  /**
  * Set field E08CCCVTT using a String value.
  */
  public void setE08CCCVTT(String newvalue)
  {
    fieldE08CCCVTT.setString(newvalue);
  }

  /**
  * Get value of field E08CCCVTT as a String.
  */
  public String getE08CCCVTT()
  {
    return fieldE08CCCVTT.getString();
  }

  /**
  * Set numeric field E08CCCVTT using a BigDecimal value.
  */
  public void setE08CCCVTT(BigDecimal newvalue)
  {
    fieldE08CCCVTT.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E08CCCVTT as a BigDecimal.
  */
  public BigDecimal getBigDecimalE08CCCVTT()
  {
    return fieldE08CCCVTT.getBigDecimal();
  }

  /**
  * Set field E08CCCVST using a String value.
  */
  public void setE08CCCVST(String newvalue)
  {
    fieldE08CCCVST.setString(newvalue);
  }

  /**
  * Get value of field E08CCCVST as a String.
  */
  public String getE08CCCVST()
  {
    return fieldE08CCCVST.getString();
  }

  /**
  * Set numeric field E08CCCVST using a BigDecimal value.
  */
  public void setE08CCCVST(BigDecimal newvalue)
  {
    fieldE08CCCVST.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E08CCCVST as a BigDecimal.
  */
  public BigDecimal getBigDecimalE08CCCVST()
  {
    return fieldE08CCCVST.getBigDecimal();
  }

  /**
  * Set field E08CCCVEN using a String value.
  */
  public void setE08CCCVEN(String newvalue)
  {
    fieldE08CCCVEN.setString(newvalue);
  }

  /**
  * Get value of field E08CCCVEN as a String.
  */
  public String getE08CCCVEN()
  {
    return fieldE08CCCVEN.getString();
  }

  /**
  * Set numeric field E08CCCVEN using a BigDecimal value.
  */
  public void setE08CCCVEN(BigDecimal newvalue)
  {
    fieldE08CCCVEN.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E08CCCVEN as a BigDecimal.
  */
  public BigDecimal getBigDecimalE08CCCVEN()
  {
    return fieldE08CCCVEN.getBigDecimal();
  }

  /**
  * Set field E08CCCIPT using a String value.
  */
  public void setE08CCCIPT(String newvalue)
  {
    fieldE08CCCIPT.setString(newvalue);
  }

  /**
  * Get value of field E08CCCIPT as a String.
  */
  public String getE08CCCIPT()
  {
    return fieldE08CCCIPT.getString();
  }

  /**
  * Set numeric field E08CCCIPT using a BigDecimal value.
  */
  public void setE08CCCIPT(BigDecimal newvalue)
  {
    fieldE08CCCIPT.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E08CCCIPT as a BigDecimal.
  */
  public BigDecimal getBigDecimalE08CCCIPT()
  {
    return fieldE08CCCIPT.getBigDecimal();
  }

  /**
  * Set field E08CCCTBA using a String value.
  */
  public void setE08CCCTBA(String newvalue)
  {
    fieldE08CCCTBA.setString(newvalue);
  }

  /**
  * Get value of field E08CCCTBA as a String.
  */
  public String getE08CCCTBA()
  {
    return fieldE08CCCTBA.getString();
  }

  /**
  * Set numeric field E08CCCTBA using a BigDecimal value.
  */
  public void setE08CCCTBA(BigDecimal newvalue)
  {
    fieldE08CCCTBA.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E08CCCTBA as a BigDecimal.
  */
  public BigDecimal getBigDecimalE08CCCTBA()
  {
    return fieldE08CCCTBA.getBigDecimal();
  }

}
