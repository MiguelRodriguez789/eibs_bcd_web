package datapro.eibs.beans;

import datapro.eibs.sockets.*;
import java.io.*;
import java.math.*;

import java.util.*;

/**
* Class generated by AS/400 CRTCLASS command from EIE026001 physical file definition.
* 
* File level identifier is 1130611113211.
* Record format level identifier is 38D59D658FB3D.
*/

public class EIE026001Message extends MessageRecord
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
                                     "E01OLDCUN",
                                     "E01OLDNM1",
                                     "E01OLDCBK",
                                     "E01OLDCBR",
                                     "E01OLDCCY",
                                     "E01OLDCGL",
                                     "E01OLDCAC",
                                     "E01NEWCUN",
                                     "E01NEWNM1",
                                     "E01NEWCBK",
                                     "E01NEWCBR",
                                     "E01NEWCCY",
                                     "E01NEWCGL",
                                     "E01NEWCAC",
                                     "E01ISIIIC",
                                     "E01ISIDSC",
                                     "E01ISIPTY",
                                     "E01ISINUM",
                                     "E01ISICCY",
                                     "E01POSBAL",
                                     "E01ORDPRF",
                                     "E01PRFDSC"
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
                                   "E01OLDCUN",
                                   "E01OLDNM1",
                                   "E01OLDCBK",
                                   "E01OLDCBR",
                                   "E01OLDCCY",
                                   "E01OLDCGL",
                                   "E01OLDCAC",
                                   "E01NEWCUN",
                                   "E01NEWNM1",
                                   "E01NEWCBK",
                                   "E01NEWCBR",
                                   "E01NEWCCY",
                                   "E01NEWCGL",
                                   "E01NEWCAC",
                                   "E01ISIIIC",
                                   "E01ISIDSC",
                                   "E01ISIPTY",
                                   "E01ISINUM",
                                   "E01ISICCY",
                                   "E01POSBAL",
                                   "E01ORDPRF",
                                   "E01PRFDSC"
                                 };
  final static String fid = "1130611113211";
  final static String rid = "38D59D658FB3D";
  final static String fmtname = "EIE026001";
  final int FIELDCOUNT = 31;
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
  private CharacterField fieldE01OLDCUN = null;
  private CharacterField fieldE01OLDNM1 = null;
  private CharacterField fieldE01OLDCBK = null;
  private DecimalField fieldE01OLDCBR = null;
  private CharacterField fieldE01OLDCCY = null;
  private DecimalField fieldE01OLDCGL = null;
  private DecimalField fieldE01OLDCAC = null;
  private CharacterField fieldE01NEWCUN = null;
  private CharacterField fieldE01NEWNM1 = null;
  private CharacterField fieldE01NEWCBK = null;
  private DecimalField fieldE01NEWCBR = null;
  private CharacterField fieldE01NEWCCY = null;
  private DecimalField fieldE01NEWCGL = null;
  private DecimalField fieldE01NEWCAC = null;
  private DecimalField fieldE01ISIIIC = null;
  private CharacterField fieldE01ISIDSC = null;
  private CharacterField fieldE01ISIPTY = null;
  private CharacterField fieldE01ISINUM = null;
  private CharacterField fieldE01ISICCY = null;
  private DecimalField fieldE01POSBAL = null;
  private DecimalField fieldE01ORDPRF = null;
  private CharacterField fieldE01PRFDSC = null;

  /**
  * Constructor for EIE026001Message.
  */
  public EIE026001Message()
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
    recordsize = 435;
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
    fields[9] = fieldE01OLDCUN =
    new CharacterField(message, HEADERSIZE + 42, 4, "E01OLDCUN");
    fields[10] = fieldE01OLDNM1 =
    new CharacterField(message, HEADERSIZE + 46, 60, "E01OLDNM1");
    fields[11] = fieldE01OLDCBK =
    new CharacterField(message, HEADERSIZE + 106, 2, "E01OLDCBK");
    fields[12] = fieldE01OLDCBR =
    new DecimalField(message, HEADERSIZE + 108, 5, 0, "E01OLDCBR");
    fields[13] = fieldE01OLDCCY =
    new CharacterField(message, HEADERSIZE + 113, 3, "E01OLDCCY");
    fields[14] = fieldE01OLDCGL =
    new DecimalField(message, HEADERSIZE + 116, 17, 0, "E01OLDCGL");
    fields[15] = fieldE01OLDCAC =
    new DecimalField(message, HEADERSIZE + 133, 13, 0, "E01OLDCAC");
    fields[16] = fieldE01NEWCUN =
    new CharacterField(message, HEADERSIZE + 146, 4, "E01NEWCUN");
    fields[17] = fieldE01NEWNM1 =
    new CharacterField(message, HEADERSIZE + 150, 60, "E01NEWNM1");
    fields[18] = fieldE01NEWCBK =
    new CharacterField(message, HEADERSIZE + 210, 2, "E01NEWCBK");
    fields[19] = fieldE01NEWCBR =
    new DecimalField(message, HEADERSIZE + 212, 5, 0, "E01NEWCBR");
    fields[20] = fieldE01NEWCCY =
    new CharacterField(message, HEADERSIZE + 217, 3, "E01NEWCCY");
    fields[21] = fieldE01NEWCGL =
    new DecimalField(message, HEADERSIZE + 220, 17, 0, "E01NEWCGL");
    fields[22] = fieldE01NEWCAC =
    new DecimalField(message, HEADERSIZE + 237, 13, 0, "E01NEWCAC");
    fields[23] = fieldE01ISIIIC =
    new DecimalField(message, HEADERSIZE + 250, 13, 0, "E01ISIIIC");
    fields[24] = fieldE01ISIDSC =
    new CharacterField(message, HEADERSIZE + 263, 60, "E01ISIDSC");
    fields[25] = fieldE01ISIPTY =
    new CharacterField(message, HEADERSIZE + 323, 4, "E01ISIPTY");
    fields[26] = fieldE01ISINUM =
    new CharacterField(message, HEADERSIZE + 327, 12, "E01ISINUM");
    fields[27] = fieldE01ISICCY =
    new CharacterField(message, HEADERSIZE + 339, 3, "E01ISICCY");
    fields[28] = fieldE01POSBAL =
    new DecimalField(message, HEADERSIZE + 342, 23, 6, "E01POSBAL");
    fields[29] = fieldE01ORDPRF =
    new DecimalField(message, HEADERSIZE + 365, 10, 0, "E01ORDPRF");
    fields[30] = fieldE01PRFDSC =
    new CharacterField(message, HEADERSIZE + 375, 60, "E01PRFDSC");

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
  * Set field E01OLDCUN using a String value.
  */
  public void setE01OLDCUN(String newvalue)
  {
    fieldE01OLDCUN.setString(newvalue);
  }

  /**
  * Get value of field E01OLDCUN as a String.
  */
  public String getE01OLDCUN()
  {
    return fieldE01OLDCUN.getString();
  }

  /**
  * Set field E01OLDNM1 using a String value.
  */
  public void setE01OLDNM1(String newvalue)
  {
    fieldE01OLDNM1.setString(newvalue);
  }

  /**
  * Get value of field E01OLDNM1 as a String.
  */
  public String getE01OLDNM1()
  {
    return fieldE01OLDNM1.getString();
  }

  /**
  * Set field E01OLDCBK using a String value.
  */
  public void setE01OLDCBK(String newvalue)
  {
    fieldE01OLDCBK.setString(newvalue);
  }

  /**
  * Get value of field E01OLDCBK as a String.
  */
  public String getE01OLDCBK()
  {
    return fieldE01OLDCBK.getString();
  }

  /**
  * Set field E01OLDCBR using a String value.
  */
  public void setE01OLDCBR(String newvalue)
  {
    fieldE01OLDCBR.setString(newvalue);
  }

  /**
  * Get value of field E01OLDCBR as a String.
  */
  public String getE01OLDCBR()
  {
    return fieldE01OLDCBR.getString();
  }

  /**
  * Set numeric field E01OLDCBR using a BigDecimal value.
  */
  public void setE01OLDCBR(BigDecimal newvalue)
  {
    fieldE01OLDCBR.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01OLDCBR as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01OLDCBR()
  {
    return fieldE01OLDCBR.getBigDecimal();
  }

  /**
  * Set field E01OLDCCY using a String value.
  */
  public void setE01OLDCCY(String newvalue)
  {
    fieldE01OLDCCY.setString(newvalue);
  }

  /**
  * Get value of field E01OLDCCY as a String.
  */
  public String getE01OLDCCY()
  {
    return fieldE01OLDCCY.getString();
  }

  /**
  * Set field E01OLDCGL using a String value.
  */
  public void setE01OLDCGL(String newvalue)
  {
    fieldE01OLDCGL.setString(newvalue);
  }

  /**
  * Get value of field E01OLDCGL as a String.
  */
  public String getE01OLDCGL()
  {
    return fieldE01OLDCGL.getString();
  }

  /**
  * Set numeric field E01OLDCGL using a BigDecimal value.
  */
  public void setE01OLDCGL(BigDecimal newvalue)
  {
    fieldE01OLDCGL.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01OLDCGL as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01OLDCGL()
  {
    return fieldE01OLDCGL.getBigDecimal();
  }

  /**
  * Set field E01OLDCAC using a String value.
  */
  public void setE01OLDCAC(String newvalue)
  {
    fieldE01OLDCAC.setString(newvalue);
  }

  /**
  * Get value of field E01OLDCAC as a String.
  */
  public String getE01OLDCAC()
  {
    return fieldE01OLDCAC.getString();
  }

  /**
  * Set numeric field E01OLDCAC using a BigDecimal value.
  */
  public void setE01OLDCAC(BigDecimal newvalue)
  {
    fieldE01OLDCAC.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01OLDCAC as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01OLDCAC()
  {
    return fieldE01OLDCAC.getBigDecimal();
  }

  /**
  * Set field E01NEWCUN using a String value.
  */
  public void setE01NEWCUN(String newvalue)
  {
    fieldE01NEWCUN.setString(newvalue);
  }

  /**
  * Get value of field E01NEWCUN as a String.
  */
  public String getE01NEWCUN()
  {
    return fieldE01NEWCUN.getString();
  }

  /**
  * Set field E01NEWNM1 using a String value.
  */
  public void setE01NEWNM1(String newvalue)
  {
    fieldE01NEWNM1.setString(newvalue);
  }

  /**
  * Get value of field E01NEWNM1 as a String.
  */
  public String getE01NEWNM1()
  {
    return fieldE01NEWNM1.getString();
  }

  /**
  * Set field E01NEWCBK using a String value.
  */
  public void setE01NEWCBK(String newvalue)
  {
    fieldE01NEWCBK.setString(newvalue);
  }

  /**
  * Get value of field E01NEWCBK as a String.
  */
  public String getE01NEWCBK()
  {
    return fieldE01NEWCBK.getString();
  }

  /**
  * Set field E01NEWCBR using a String value.
  */
  public void setE01NEWCBR(String newvalue)
  {
    fieldE01NEWCBR.setString(newvalue);
  }

  /**
  * Get value of field E01NEWCBR as a String.
  */
  public String getE01NEWCBR()
  {
    return fieldE01NEWCBR.getString();
  }

  /**
  * Set numeric field E01NEWCBR using a BigDecimal value.
  */
  public void setE01NEWCBR(BigDecimal newvalue)
  {
    fieldE01NEWCBR.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01NEWCBR as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01NEWCBR()
  {
    return fieldE01NEWCBR.getBigDecimal();
  }

  /**
  * Set field E01NEWCCY using a String value.
  */
  public void setE01NEWCCY(String newvalue)
  {
    fieldE01NEWCCY.setString(newvalue);
  }

  /**
  * Get value of field E01NEWCCY as a String.
  */
  public String getE01NEWCCY()
  {
    return fieldE01NEWCCY.getString();
  }

  /**
  * Set field E01NEWCGL using a String value.
  */
  public void setE01NEWCGL(String newvalue)
  {
    fieldE01NEWCGL.setString(newvalue);
  }

  /**
  * Get value of field E01NEWCGL as a String.
  */
  public String getE01NEWCGL()
  {
    return fieldE01NEWCGL.getString();
  }

  /**
  * Set numeric field E01NEWCGL using a BigDecimal value.
  */
  public void setE01NEWCGL(BigDecimal newvalue)
  {
    fieldE01NEWCGL.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01NEWCGL as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01NEWCGL()
  {
    return fieldE01NEWCGL.getBigDecimal();
  }

  /**
  * Set field E01NEWCAC using a String value.
  */
  public void setE01NEWCAC(String newvalue)
  {
    fieldE01NEWCAC.setString(newvalue);
  }

  /**
  * Get value of field E01NEWCAC as a String.
  */
  public String getE01NEWCAC()
  {
    return fieldE01NEWCAC.getString();
  }

  /**
  * Set numeric field E01NEWCAC using a BigDecimal value.
  */
  public void setE01NEWCAC(BigDecimal newvalue)
  {
    fieldE01NEWCAC.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01NEWCAC as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01NEWCAC()
  {
    return fieldE01NEWCAC.getBigDecimal();
  }

  /**
  * Set field E01ISIIIC using a String value.
  */
  public void setE01ISIIIC(String newvalue)
  {
    fieldE01ISIIIC.setString(newvalue);
  }

  /**
  * Get value of field E01ISIIIC as a String.
  */
  public String getE01ISIIIC()
  {
    return fieldE01ISIIIC.getString();
  }

  /**
  * Set numeric field E01ISIIIC using a BigDecimal value.
  */
  public void setE01ISIIIC(BigDecimal newvalue)
  {
    fieldE01ISIIIC.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01ISIIIC as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01ISIIIC()
  {
    return fieldE01ISIIIC.getBigDecimal();
  }

  /**
  * Set field E01ISIDSC using a String value.
  */
  public void setE01ISIDSC(String newvalue)
  {
    fieldE01ISIDSC.setString(newvalue);
  }

  /**
  * Get value of field E01ISIDSC as a String.
  */
  public String getE01ISIDSC()
  {
    return fieldE01ISIDSC.getString();
  }

  /**
  * Set field E01ISIPTY using a String value.
  */
  public void setE01ISIPTY(String newvalue)
  {
    fieldE01ISIPTY.setString(newvalue);
  }

  /**
  * Get value of field E01ISIPTY as a String.
  */
  public String getE01ISIPTY()
  {
    return fieldE01ISIPTY.getString();
  }

  /**
  * Set field E01ISINUM using a String value.
  */
  public void setE01ISINUM(String newvalue)
  {
    fieldE01ISINUM.setString(newvalue);
  }

  /**
  * Get value of field E01ISINUM as a String.
  */
  public String getE01ISINUM()
  {
    return fieldE01ISINUM.getString();
  }

  /**
  * Set field E01ISICCY using a String value.
  */
  public void setE01ISICCY(String newvalue)
  {
    fieldE01ISICCY.setString(newvalue);
  }

  /**
  * Get value of field E01ISICCY as a String.
  */
  public String getE01ISICCY()
  {
    return fieldE01ISICCY.getString();
  }

  /**
  * Set field E01POSBAL using a String value.
  */
  public void setE01POSBAL(String newvalue)
  {
    fieldE01POSBAL.setString(newvalue);
  }

  /**
  * Get value of field E01POSBAL as a String.
  */
  public String getE01POSBAL()
  {
    return fieldE01POSBAL.getString();
  }

  /**
  * Set numeric field E01POSBAL using a BigDecimal value.
  */
  public void setE01POSBAL(BigDecimal newvalue)
  {
    fieldE01POSBAL.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01POSBAL as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01POSBAL()
  {
    return fieldE01POSBAL.getBigDecimal();
  }

  /**
  * Set field E01ORDPRF using a String value.
  */
  public void setE01ORDPRF(String newvalue)
  {
    fieldE01ORDPRF.setString(newvalue);
  }

  /**
  * Get value of field E01ORDPRF as a String.
  */
  public String getE01ORDPRF()
  {
    return fieldE01ORDPRF.getString();
  }

  /**
  * Set numeric field E01ORDPRF using a BigDecimal value.
  */
  public void setE01ORDPRF(BigDecimal newvalue)
  {
    fieldE01ORDPRF.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01ORDPRF as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01ORDPRF()
  {
    return fieldE01ORDPRF.getBigDecimal();
  }

  /**
  * Set field E01PRFDSC using a String value.
  */
  public void setE01PRFDSC(String newvalue)
  {
    fieldE01PRFDSC.setString(newvalue);
  }

  /**
  * Get value of field E01PRFDSC as a String.
  */
  public String getE01PRFDSC()
  {
    return fieldE01PRFDSC.getString();
  }

}