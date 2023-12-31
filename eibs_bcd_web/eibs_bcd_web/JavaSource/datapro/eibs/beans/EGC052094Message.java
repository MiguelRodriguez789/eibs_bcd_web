package datapro.eibs.beans;

import datapro.eibs.sockets.*;
import java.io.*;
import java.math.*;

import java.util.*;

/**
* Class generated by AS/400 CRTCLASS command from EGC052094 physical file definition.
* 
* File level identifier is 1100706173619.
* Record format level identifier is 5DCFBCC4D43AA.
*/

public class EGC052094Message extends MessageRecord
{
  final static String fldnames[] = {
                                     "H94USERID",
                                     "H94PROGRM",
                                     "H94TIMSYS",
                                     "H94SCRCOD",
                                     "H94OPECOD",
                                     "H94FLGMAS",
                                     "H94FLGWK1",
                                     "H94FLGWK2",
                                     "H94FLGWK3",
                                     "E94CRMCID",
                                     "E94CUSNA1",
                                     "E94CRMGL1",
                                     "E94CRMGL2",
                                     "E94CRMGL3",
                                     "E94CRMGL4",
                                     "E94CRMLBC",
                                     "E94CRMLFC",
                                     "E94CRMDBS",
                                     "E94CRMDFC",
                                     "E94CRMNCC",
                                     "E94CRMBCY",
                                     "E94CRMUSR",
                                     "E94CRMAFI",
                                     "E94CRMTAR",
                                     "E94CRMSUC",
                                     "E94CRMNOM"
                                   };
  final static String tnames[] = {
                                   "H94USERID",
                                   "H94PROGRM",
                                   "H94TIMSYS",
                                   "H94SCRCOD",
                                   "H94OPECOD",
                                   "H94FLGMAS",
                                   "H94FLGWK1",
                                   "H94FLGWK2",
                                   "H94FLGWK3",
                                   "E94CRMCID",
                                   "E94CUSNA1",
                                   "E94CRMGL1",
                                   "E94CRMGL2",
                                   "E94CRMGL3",
                                   "E94CRMGL4",
                                   "E94CRMLBC",
                                   "E94CRMLFC",
                                   "E94CRMDBS",
                                   "E94CRMDFC",
                                   "E94CRMNCC",
                                   "E94CRMBCY",
                                   "E94CRMUSR",
                                   "E94CRMAFI",
                                   "E94CRMTAR",
                                   "E94CRMSUC",
                                   "E94CRMNOM"
                                 };
  final static String fid = "1100706173619";
  final static String rid = "5DCFBCC4D43AA";
  final static String fmtname = "EGC052094";
  final int FIELDCOUNT = 26;
  private static Hashtable tlookup = new Hashtable();
  private CharacterField fieldH94USERID = null;
  private CharacterField fieldH94PROGRM = null;
  private CharacterField fieldH94TIMSYS = null;
  private CharacterField fieldH94SCRCOD = null;
  private CharacterField fieldH94OPECOD = null;
  private CharacterField fieldH94FLGMAS = null;
  private CharacterField fieldH94FLGWK1 = null;
  private CharacterField fieldH94FLGWK2 = null;
  private CharacterField fieldH94FLGWK3 = null;
  private CharacterField fieldE94CRMCID = null;
  private CharacterField fieldE94CUSNA1 = null;
  private CharacterField fieldE94CRMGL1 = null;
  private CharacterField fieldE94CRMGL2 = null;
  private CharacterField fieldE94CRMGL3 = null;
  private CharacterField fieldE94CRMGL4 = null;
  private DecimalField fieldE94CRMLBC = null;
  private DecimalField fieldE94CRMLFC = null;
  private DecimalField fieldE94CRMDBS = null;
  private DecimalField fieldE94CRMDFC = null;
  private DecimalField fieldE94CRMNCC = null;
  private CharacterField fieldE94CRMBCY = null;
  private CharacterField fieldE94CRMUSR = null;
  private CharacterField fieldE94CRMAFI = null;
  private CharacterField fieldE94CRMTAR = null;
  private DecimalField fieldE94CRMSUC = null;
  private CharacterField fieldE94CRMNOM = null;

  /**
  * Constructor for EGC052094Message.
  */
  public EGC052094Message()
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
    recordsize = 371;
    fileid = fid;
    recordid = rid;
    message = new byte[getByteLength()];
    formatname = fmtname;
    fieldnames = fldnames;
    tagnames = tnames;
    fields = new MessageField[FIELDCOUNT];

    fields[0] = fieldH94USERID =
    new CharacterField(message, HEADERSIZE + 0, 10, "H94USERID");
    fields[1] = fieldH94PROGRM =
    new CharacterField(message, HEADERSIZE + 10, 10, "H94PROGRM");
    fields[2] = fieldH94TIMSYS =
    new CharacterField(message, HEADERSIZE + 20, 12, "H94TIMSYS");
    fields[3] = fieldH94SCRCOD =
    new CharacterField(message, HEADERSIZE + 32, 2, "H94SCRCOD");
    fields[4] = fieldH94OPECOD =
    new CharacterField(message, HEADERSIZE + 34, 4, "H94OPECOD");
    fields[5] = fieldH94FLGMAS =
    new CharacterField(message, HEADERSIZE + 38, 1, "H94FLGMAS");
    fields[6] = fieldH94FLGWK1 =
    new CharacterField(message, HEADERSIZE + 39, 1, "H94FLGWK1");
    fields[7] = fieldH94FLGWK2 =
    new CharacterField(message, HEADERSIZE + 40, 1, "H94FLGWK2");
    fields[8] = fieldH94FLGWK3 =
    new CharacterField(message, HEADERSIZE + 41, 1, "H94FLGWK3");
    fields[9] = fieldE94CRMCID =
    new CharacterField(message, HEADERSIZE + 42, 15, "E94CRMCID");
    fields[10] = fieldE94CUSNA1 =
    new CharacterField(message, HEADERSIZE + 57, 40, "E94CUSNA1");
    fields[11] = fieldE94CRMGL1 =
    new CharacterField(message, HEADERSIZE + 97, 30, "E94CRMGL1");
    fields[12] = fieldE94CRMGL2 =
    new CharacterField(message, HEADERSIZE + 127, 30, "E94CRMGL2");
    fields[13] = fieldE94CRMGL3 =
    new CharacterField(message, HEADERSIZE + 157, 30, "E94CRMGL3");
    fields[14] = fieldE94CRMGL4 =
    new CharacterField(message, HEADERSIZE + 187, 30, "E94CRMGL4");
    fields[15] = fieldE94CRMLBC =
    new DecimalField(message, HEADERSIZE + 217, 17, 2, "E94CRMLBC");
    fields[16] = fieldE94CRMLFC =
    new DecimalField(message, HEADERSIZE + 234, 17, 2, "E94CRMLFC");
    fields[17] = fieldE94CRMDBS =
    new DecimalField(message, HEADERSIZE + 251, 17, 2, "E94CRMDBS");
    fields[18] = fieldE94CRMDFC =
    new DecimalField(message, HEADERSIZE + 268, 17, 2, "E94CRMDFC");
    fields[19] = fieldE94CRMNCC =
    new DecimalField(message, HEADERSIZE + 285, 7, 0, "E94CRMNCC");
    fields[20] = fieldE94CRMBCY =
    new CharacterField(message, HEADERSIZE + 292, 2, "E94CRMBCY");
    fields[21] = fieldE94CRMUSR =
    new CharacterField(message, HEADERSIZE + 294, 10, "E94CRMUSR");
    fields[22] = fieldE94CRMAFI =
    new CharacterField(message, HEADERSIZE + 304, 4, "E94CRMAFI");
    fields[23] = fieldE94CRMTAR =
    new CharacterField(message, HEADERSIZE + 308, 19, "E94CRMTAR");
    fields[24] = fieldE94CRMSUC =
    new DecimalField(message, HEADERSIZE + 327, 4, 0, "E94CRMSUC");
    fields[25] = fieldE94CRMNOM =
    new CharacterField(message, HEADERSIZE + 331, 40, "E94CRMNOM");

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
  * Set field H94USERID using a String value.
  */
  public void setH94USERID(String newvalue)
  {
    fieldH94USERID.setString(newvalue);
  }

  /**
  * Get value of field H94USERID as a String.
  */
  public String getH94USERID()
  {
    return fieldH94USERID.getString();
  }

  /**
  * Set field H94PROGRM using a String value.
  */
  public void setH94PROGRM(String newvalue)
  {
    fieldH94PROGRM.setString(newvalue);
  }

  /**
  * Get value of field H94PROGRM as a String.
  */
  public String getH94PROGRM()
  {
    return fieldH94PROGRM.getString();
  }

  /**
  * Set field H94TIMSYS using a String value.
  */
  public void setH94TIMSYS(String newvalue)
  {
    fieldH94TIMSYS.setString(newvalue);
  }

  /**
  * Get value of field H94TIMSYS as a String.
  */
  public String getH94TIMSYS()
  {
    return fieldH94TIMSYS.getString();
  }

  /**
  * Set field H94SCRCOD using a String value.
  */
  public void setH94SCRCOD(String newvalue)
  {
    fieldH94SCRCOD.setString(newvalue);
  }

  /**
  * Get value of field H94SCRCOD as a String.
  */
  public String getH94SCRCOD()
  {
    return fieldH94SCRCOD.getString();
  }

  /**
  * Set field H94OPECOD using a String value.
  */
  public void setH94OPECOD(String newvalue)
  {
    fieldH94OPECOD.setString(newvalue);
  }

  /**
  * Get value of field H94OPECOD as a String.
  */
  public String getH94OPECOD()
  {
    return fieldH94OPECOD.getString();
  }

  /**
  * Set field H94FLGMAS using a String value.
  */
  public void setH94FLGMAS(String newvalue)
  {
    fieldH94FLGMAS.setString(newvalue);
  }

  /**
  * Get value of field H94FLGMAS as a String.
  */
  public String getH94FLGMAS()
  {
    return fieldH94FLGMAS.getString();
  }

  /**
  * Set field H94FLGWK1 using a String value.
  */
  public void setH94FLGWK1(String newvalue)
  {
    fieldH94FLGWK1.setString(newvalue);
  }

  /**
  * Get value of field H94FLGWK1 as a String.
  */
  public String getH94FLGWK1()
  {
    return fieldH94FLGWK1.getString();
  }

  /**
  * Set field H94FLGWK2 using a String value.
  */
  public void setH94FLGWK2(String newvalue)
  {
    fieldH94FLGWK2.setString(newvalue);
  }

  /**
  * Get value of field H94FLGWK2 as a String.
  */
  public String getH94FLGWK2()
  {
    return fieldH94FLGWK2.getString();
  }

  /**
  * Set field H94FLGWK3 using a String value.
  */
  public void setH94FLGWK3(String newvalue)
  {
    fieldH94FLGWK3.setString(newvalue);
  }

  /**
  * Get value of field H94FLGWK3 as a String.
  */
  public String getH94FLGWK3()
  {
    return fieldH94FLGWK3.getString();
  }

  /**
  * Set field E94CRMCID using a String value.
  */
  public void setE94CRMCID(String newvalue)
  {
    fieldE94CRMCID.setString(newvalue);
  }

  /**
  * Get value of field E94CRMCID as a String.
  */
  public String getE94CRMCID()
  {
    return fieldE94CRMCID.getString();
  }

  /**
  * Set field E94CUSNA1 using a String value.
  */
  public void setE94CUSNA1(String newvalue)
  {
    fieldE94CUSNA1.setString(newvalue);
  }

  /**
  * Get value of field E94CUSNA1 as a String.
  */
  public String getE94CUSNA1()
  {
    return fieldE94CUSNA1.getString();
  }

  /**
  * Set field E94CRMGL1 using a String value.
  */
  public void setE94CRMGL1(String newvalue)
  {
    fieldE94CRMGL1.setString(newvalue);
  }

  /**
  * Get value of field E94CRMGL1 as a String.
  */
  public String getE94CRMGL1()
  {
    return fieldE94CRMGL1.getString();
  }

  /**
  * Set field E94CRMGL2 using a String value.
  */
  public void setE94CRMGL2(String newvalue)
  {
    fieldE94CRMGL2.setString(newvalue);
  }

  /**
  * Get value of field E94CRMGL2 as a String.
  */
  public String getE94CRMGL2()
  {
    return fieldE94CRMGL2.getString();
  }

  /**
  * Set field E94CRMGL3 using a String value.
  */
  public void setE94CRMGL3(String newvalue)
  {
    fieldE94CRMGL3.setString(newvalue);
  }

  /**
  * Get value of field E94CRMGL3 as a String.
  */
  public String getE94CRMGL3()
  {
    return fieldE94CRMGL3.getString();
  }

  /**
  * Set field E94CRMGL4 using a String value.
  */
  public void setE94CRMGL4(String newvalue)
  {
    fieldE94CRMGL4.setString(newvalue);
  }

  /**
  * Get value of field E94CRMGL4 as a String.
  */
  public String getE94CRMGL4()
  {
    return fieldE94CRMGL4.getString();
  }

  /**
  * Set field E94CRMLBC using a String value.
  */
  public void setE94CRMLBC(String newvalue)
  {
    fieldE94CRMLBC.setString(newvalue);
  }

  /**
  * Get value of field E94CRMLBC as a String.
  */
  public String getE94CRMLBC()
  {
    return fieldE94CRMLBC.getString();
  }

  /**
  * Set numeric field E94CRMLBC using a BigDecimal value.
  */
  public void setE94CRMLBC(BigDecimal newvalue)
  {
    fieldE94CRMLBC.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E94CRMLBC as a BigDecimal.
  */
  public BigDecimal getBigDecimalE94CRMLBC()
  {
    return fieldE94CRMLBC.getBigDecimal();
  }

  /**
  * Set field E94CRMLFC using a String value.
  */
  public void setE94CRMLFC(String newvalue)
  {
    fieldE94CRMLFC.setString(newvalue);
  }

  /**
  * Get value of field E94CRMLFC as a String.
  */
  public String getE94CRMLFC()
  {
    return fieldE94CRMLFC.getString();
  }

  /**
  * Set numeric field E94CRMLFC using a BigDecimal value.
  */
  public void setE94CRMLFC(BigDecimal newvalue)
  {
    fieldE94CRMLFC.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E94CRMLFC as a BigDecimal.
  */
  public BigDecimal getBigDecimalE94CRMLFC()
  {
    return fieldE94CRMLFC.getBigDecimal();
  }

  /**
  * Set field E94CRMDBS using a String value.
  */
  public void setE94CRMDBS(String newvalue)
  {
    fieldE94CRMDBS.setString(newvalue);
  }

  /**
  * Get value of field E94CRMDBS as a String.
  */
  public String getE94CRMDBS()
  {
    return fieldE94CRMDBS.getString();
  }

  /**
  * Set numeric field E94CRMDBS using a BigDecimal value.
  */
  public void setE94CRMDBS(BigDecimal newvalue)
  {
    fieldE94CRMDBS.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E94CRMDBS as a BigDecimal.
  */
  public BigDecimal getBigDecimalE94CRMDBS()
  {
    return fieldE94CRMDBS.getBigDecimal();
  }

  /**
  * Set field E94CRMDFC using a String value.
  */
  public void setE94CRMDFC(String newvalue)
  {
    fieldE94CRMDFC.setString(newvalue);
  }

  /**
  * Get value of field E94CRMDFC as a String.
  */
  public String getE94CRMDFC()
  {
    return fieldE94CRMDFC.getString();
  }

  /**
  * Set numeric field E94CRMDFC using a BigDecimal value.
  */
  public void setE94CRMDFC(BigDecimal newvalue)
  {
    fieldE94CRMDFC.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E94CRMDFC as a BigDecimal.
  */
  public BigDecimal getBigDecimalE94CRMDFC()
  {
    return fieldE94CRMDFC.getBigDecimal();
  }

  /**
  * Set field E94CRMNCC using a String value.
  */
  public void setE94CRMNCC(String newvalue)
  {
    fieldE94CRMNCC.setString(newvalue);
  }

  /**
  * Get value of field E94CRMNCC as a String.
  */
  public String getE94CRMNCC()
  {
    return fieldE94CRMNCC.getString();
  }

  /**
  * Set numeric field E94CRMNCC using a BigDecimal value.
  */
  public void setE94CRMNCC(BigDecimal newvalue)
  {
    fieldE94CRMNCC.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E94CRMNCC as a BigDecimal.
  */
  public BigDecimal getBigDecimalE94CRMNCC()
  {
    return fieldE94CRMNCC.getBigDecimal();
  }

  /**
  * Set field E94CRMBCY using a String value.
  */
  public void setE94CRMBCY(String newvalue)
  {
    fieldE94CRMBCY.setString(newvalue);
  }

  /**
  * Get value of field E94CRMBCY as a String.
  */
  public String getE94CRMBCY()
  {
    return fieldE94CRMBCY.getString();
  }

  /**
  * Set field E94CRMUSR using a String value.
  */
  public void setE94CRMUSR(String newvalue)
  {
    fieldE94CRMUSR.setString(newvalue);
  }

  /**
  * Get value of field E94CRMUSR as a String.
  */
  public String getE94CRMUSR()
  {
    return fieldE94CRMUSR.getString();
  }

  /**
  * Set field E94CRMAFI using a String value.
  */
  public void setE94CRMAFI(String newvalue)
  {
    fieldE94CRMAFI.setString(newvalue);
  }

  /**
  * Get value of field E94CRMAFI as a String.
  */
  public String getE94CRMAFI()
  {
    return fieldE94CRMAFI.getString();
  }

  /**
  * Set field E94CRMTAR using a String value.
  */
  public void setE94CRMTAR(String newvalue)
  {
    fieldE94CRMTAR.setString(newvalue);
  }

  /**
  * Get value of field E94CRMTAR as a String.
  */
  public String getE94CRMTAR()
  {
    return fieldE94CRMTAR.getString();
  }

  /**
  * Set field E94CRMSUC using a String value.
  */
  public void setE94CRMSUC(String newvalue)
  {
    fieldE94CRMSUC.setString(newvalue);
  }

  /**
  * Get value of field E94CRMSUC as a String.
  */
  public String getE94CRMSUC()
  {
    return fieldE94CRMSUC.getString();
  }

  /**
  * Set numeric field E94CRMSUC using a BigDecimal value.
  */
  public void setE94CRMSUC(BigDecimal newvalue)
  {
    fieldE94CRMSUC.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E94CRMSUC as a BigDecimal.
  */
  public BigDecimal getBigDecimalE94CRMSUC()
  {
    return fieldE94CRMSUC.getBigDecimal();
  }

  /**
  * Set field E94CRMNOM using a String value.
  */
  public void setE94CRMNOM(String newvalue)
  {
    fieldE94CRMNOM.setString(newvalue);
  }

  /**
  * Get value of field E94CRMNOM as a String.
  */
  public String getE94CRMNOM()
  {
    return fieldE94CRMNOM.getString();
  }

}
