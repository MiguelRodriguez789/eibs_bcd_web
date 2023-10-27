package datapro.eibs.beans;

import datapro.eibs.sockets.*;
import java.io.*;
import java.math.*;

import java.util.*;

/**
* Class generated by AS/400 CRTCLASS command from EST054001 physical file definition.
* 
* File level identifier is 1100706173659.
* Record format level identifier is 4E27749C843AB.
*/

public class EST054001Message extends MessageRecord
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
                                     "E01CRLSEC",
                                     "E01CRLNRE",
                                     "E01CRLFGY",
                                     "E01CRLFGM",
                                     "E01CRLFGD",
                                     "E01CRLNTA",
                                     "E01CRLGL1",
                                     "E01CRLGL2",
                                     "E01CRLGL3",
                                     "E01CRLGL4",
                                     "E01CRLGL5",
                                     "E01CRLCID",
                                     "E01CRLNOM",
                                     "E01CRLUSR",
                                     "E01CRLFAY",
                                     "E01CRLFAM",
                                     "E01CRLFAD",
                                     "E01CRLHOR",
                                     "E01CRLGUB",
                                     "E01CRLCPL",
                                     "E01CRLACT"
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
                                   "E01CRLSEC",
                                   "E01CRLNRE",
                                   "E01CRLFGY",
                                   "E01CRLFGM",
                                   "E01CRLFGD",
                                   "E01CRLNTA",
                                   "E01CRLGL1",
                                   "E01CRLGL2",
                                   "E01CRLGL3",
                                   "E01CRLGL4",
                                   "E01CRLGL5",
                                   "E01CRLCID",
                                   "E01CRLNOM",
                                   "E01CRLUSR",
                                   "E01CRLFAY",
                                   "E01CRLFAM",
                                   "E01CRLFAD",
                                   "E01CRLHOR",
                                   "E01CRLGUB",
                                   "E01CRLCPL",
                                   "E01CRLACT"
                                 };
  final static String fid = "1100706173659";
  final static String rid = "4E27749C843AB";
  final static String fmtname = "EST054001";
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
  private DecimalField fieldE01CRLSEC = null;
  private DecimalField fieldE01CRLNRE = null;
  private DecimalField fieldE01CRLFGY = null;
  private DecimalField fieldE01CRLFGM = null;
  private DecimalField fieldE01CRLFGD = null;
  private CharacterField fieldE01CRLNTA = null;
  private CharacterField fieldE01CRLGL1 = null;
  private CharacterField fieldE01CRLGL2 = null;
  private CharacterField fieldE01CRLGL3 = null;
  private CharacterField fieldE01CRLGL4 = null;
  private CharacterField fieldE01CRLGL5 = null;
  private CharacterField fieldE01CRLCID = null;
  private CharacterField fieldE01CRLNOM = null;
  private CharacterField fieldE01CRLUSR = null;
  private DecimalField fieldE01CRLFAY = null;
  private DecimalField fieldE01CRLFAM = null;
  private DecimalField fieldE01CRLFAD = null;
  private DecimalField fieldE01CRLHOR = null;
  private CharacterField fieldE01CRLGUB = null;
  private DecimalField fieldE01CRLCPL = null;
  private CharacterField fieldE01CRLACT = null;

  /**
  * Constructor for EST054001Message.
  */
  public EST054001Message()
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
    fields[9] = fieldE01CRLSEC =
    new DecimalField(message, HEADERSIZE + 42, 9, 0, "E01CRLSEC");
    fields[10] = fieldE01CRLNRE =
    new DecimalField(message, HEADERSIZE + 51, 9, 0, "E01CRLNRE");
    fields[11] = fieldE01CRLFGY =
    new DecimalField(message, HEADERSIZE + 60, 5, 0, "E01CRLFGY");
    fields[12] = fieldE01CRLFGM =
    new DecimalField(message, HEADERSIZE + 65, 3, 0, "E01CRLFGM");
    fields[13] = fieldE01CRLFGD =
    new DecimalField(message, HEADERSIZE + 68, 3, 0, "E01CRLFGD");
    fields[14] = fieldE01CRLNTA =
    new CharacterField(message, HEADERSIZE + 71, 19, "E01CRLNTA");
    fields[15] = fieldE01CRLGL1 =
    new CharacterField(message, HEADERSIZE + 90, 30, "E01CRLGL1");
    fields[16] = fieldE01CRLGL2 =
    new CharacterField(message, HEADERSIZE + 120, 30, "E01CRLGL2");
    fields[17] = fieldE01CRLGL3 =
    new CharacterField(message, HEADERSIZE + 150, 30, "E01CRLGL3");
    fields[18] = fieldE01CRLGL4 =
    new CharacterField(message, HEADERSIZE + 180, 30, "E01CRLGL4");
    fields[19] = fieldE01CRLGL5 =
    new CharacterField(message, HEADERSIZE + 210, 30, "E01CRLGL5");
    fields[20] = fieldE01CRLCID =
    new CharacterField(message, HEADERSIZE + 240, 15, "E01CRLCID");
    fields[21] = fieldE01CRLNOM =
    new CharacterField(message, HEADERSIZE + 255, 40, "E01CRLNOM");
    fields[22] = fieldE01CRLUSR =
    new CharacterField(message, HEADERSIZE + 295, 10, "E01CRLUSR");
    fields[23] = fieldE01CRLFAY =
    new DecimalField(message, HEADERSIZE + 305, 5, 0, "E01CRLFAY");
    fields[24] = fieldE01CRLFAM =
    new DecimalField(message, HEADERSIZE + 310, 3, 0, "E01CRLFAM");
    fields[25] = fieldE01CRLFAD =
    new DecimalField(message, HEADERSIZE + 313, 3, 0, "E01CRLFAD");
    fields[26] = fieldE01CRLHOR =
    new DecimalField(message, HEADERSIZE + 316, 7, 0, "E01CRLHOR");
    fields[27] = fieldE01CRLGUB =
    new CharacterField(message, HEADERSIZE + 323, 30, "E01CRLGUB");
    fields[28] = fieldE01CRLCPL =
    new DecimalField(message, HEADERSIZE + 353, 7, 0, "E01CRLCPL");
    fields[29] = fieldE01CRLACT =
    new CharacterField(message, HEADERSIZE + 360, 30, "E01CRLACT");

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
  * Set field E01CRLSEC using a String value.
  */
  public void setE01CRLSEC(String newvalue)
  {
    fieldE01CRLSEC.setString(newvalue);
  }

  /**
  * Get value of field E01CRLSEC as a String.
  */
  public String getE01CRLSEC()
  {
    return fieldE01CRLSEC.getString();
  }

  /**
  * Set numeric field E01CRLSEC using a BigDecimal value.
  */
  public void setE01CRLSEC(BigDecimal newvalue)
  {
    fieldE01CRLSEC.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01CRLSEC as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01CRLSEC()
  {
    return fieldE01CRLSEC.getBigDecimal();
  }

  /**
  * Set field E01CRLNRE using a String value.
  */
  public void setE01CRLNRE(String newvalue)
  {
    fieldE01CRLNRE.setString(newvalue);
  }

  /**
  * Get value of field E01CRLNRE as a String.
  */
  public String getE01CRLNRE()
  {
    return fieldE01CRLNRE.getString();
  }

  /**
  * Set numeric field E01CRLNRE using a BigDecimal value.
  */
  public void setE01CRLNRE(BigDecimal newvalue)
  {
    fieldE01CRLNRE.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01CRLNRE as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01CRLNRE()
  {
    return fieldE01CRLNRE.getBigDecimal();
  }

  /**
  * Set field E01CRLFGY using a String value.
  */
  public void setE01CRLFGY(String newvalue)
  {
    fieldE01CRLFGY.setString(newvalue);
  }

  /**
  * Get value of field E01CRLFGY as a String.
  */
  public String getE01CRLFGY()
  {
    return fieldE01CRLFGY.getString();
  }

  /**
  * Set numeric field E01CRLFGY using a BigDecimal value.
  */
  public void setE01CRLFGY(BigDecimal newvalue)
  {
    fieldE01CRLFGY.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01CRLFGY as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01CRLFGY()
  {
    return fieldE01CRLFGY.getBigDecimal();
  }

  /**
  * Set field E01CRLFGM using a String value.
  */
  public void setE01CRLFGM(String newvalue)
  {
    fieldE01CRLFGM.setString(newvalue);
  }

  /**
  * Get value of field E01CRLFGM as a String.
  */
  public String getE01CRLFGM()
  {
    return fieldE01CRLFGM.getString();
  }

  /**
  * Set numeric field E01CRLFGM using a BigDecimal value.
  */
  public void setE01CRLFGM(BigDecimal newvalue)
  {
    fieldE01CRLFGM.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01CRLFGM as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01CRLFGM()
  {
    return fieldE01CRLFGM.getBigDecimal();
  }

  /**
  * Set field E01CRLFGD using a String value.
  */
  public void setE01CRLFGD(String newvalue)
  {
    fieldE01CRLFGD.setString(newvalue);
  }

  /**
  * Get value of field E01CRLFGD as a String.
  */
  public String getE01CRLFGD()
  {
    return fieldE01CRLFGD.getString();
  }

  /**
  * Set numeric field E01CRLFGD using a BigDecimal value.
  */
  public void setE01CRLFGD(BigDecimal newvalue)
  {
    fieldE01CRLFGD.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01CRLFGD as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01CRLFGD()
  {
    return fieldE01CRLFGD.getBigDecimal();
  }

  /**
  * Set field E01CRLNTA using a String value.
  */
  public void setE01CRLNTA(String newvalue)
  {
    fieldE01CRLNTA.setString(newvalue);
  }

  /**
  * Get value of field E01CRLNTA as a String.
  */
  public String getE01CRLNTA()
  {
    return fieldE01CRLNTA.getString();
  }

  /**
  * Set field E01CRLGL1 using a String value.
  */
  public void setE01CRLGL1(String newvalue)
  {
    fieldE01CRLGL1.setString(newvalue);
  }

  /**
  * Get value of field E01CRLGL1 as a String.
  */
  public String getE01CRLGL1()
  {
    return fieldE01CRLGL1.getString();
  }

  /**
  * Set field E01CRLGL2 using a String value.
  */
  public void setE01CRLGL2(String newvalue)
  {
    fieldE01CRLGL2.setString(newvalue);
  }

  /**
  * Get value of field E01CRLGL2 as a String.
  */
  public String getE01CRLGL2()
  {
    return fieldE01CRLGL2.getString();
  }

  /**
  * Set field E01CRLGL3 using a String value.
  */
  public void setE01CRLGL3(String newvalue)
  {
    fieldE01CRLGL3.setString(newvalue);
  }

  /**
  * Get value of field E01CRLGL3 as a String.
  */
  public String getE01CRLGL3()
  {
    return fieldE01CRLGL3.getString();
  }

  /**
  * Set field E01CRLGL4 using a String value.
  */
  public void setE01CRLGL4(String newvalue)
  {
    fieldE01CRLGL4.setString(newvalue);
  }

  /**
  * Get value of field E01CRLGL4 as a String.
  */
  public String getE01CRLGL4()
  {
    return fieldE01CRLGL4.getString();
  }

  /**
  * Set field E01CRLGL5 using a String value.
  */
  public void setE01CRLGL5(String newvalue)
  {
    fieldE01CRLGL5.setString(newvalue);
  }

  /**
  * Get value of field E01CRLGL5 as a String.
  */
  public String getE01CRLGL5()
  {
    return fieldE01CRLGL5.getString();
  }

  /**
  * Set field E01CRLCID using a String value.
  */
  public void setE01CRLCID(String newvalue)
  {
    fieldE01CRLCID.setString(newvalue);
  }

  /**
  * Get value of field E01CRLCID as a String.
  */
  public String getE01CRLCID()
  {
    return fieldE01CRLCID.getString();
  }

  /**
  * Set field E01CRLNOM using a String value.
  */
  public void setE01CRLNOM(String newvalue)
  {
    fieldE01CRLNOM.setString(newvalue);
  }

  /**
  * Get value of field E01CRLNOM as a String.
  */
  public String getE01CRLNOM()
  {
    return fieldE01CRLNOM.getString();
  }

  /**
  * Set field E01CRLUSR using a String value.
  */
  public void setE01CRLUSR(String newvalue)
  {
    fieldE01CRLUSR.setString(newvalue);
  }

  /**
  * Get value of field E01CRLUSR as a String.
  */
  public String getE01CRLUSR()
  {
    return fieldE01CRLUSR.getString();
  }

  /**
  * Set field E01CRLFAY using a String value.
  */
  public void setE01CRLFAY(String newvalue)
  {
    fieldE01CRLFAY.setString(newvalue);
  }

  /**
  * Get value of field E01CRLFAY as a String.
  */
  public String getE01CRLFAY()
  {
    return fieldE01CRLFAY.getString();
  }

  /**
  * Set numeric field E01CRLFAY using a BigDecimal value.
  */
  public void setE01CRLFAY(BigDecimal newvalue)
  {
    fieldE01CRLFAY.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01CRLFAY as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01CRLFAY()
  {
    return fieldE01CRLFAY.getBigDecimal();
  }

  /**
  * Set field E01CRLFAM using a String value.
  */
  public void setE01CRLFAM(String newvalue)
  {
    fieldE01CRLFAM.setString(newvalue);
  }

  /**
  * Get value of field E01CRLFAM as a String.
  */
  public String getE01CRLFAM()
  {
    return fieldE01CRLFAM.getString();
  }

  /**
  * Set numeric field E01CRLFAM using a BigDecimal value.
  */
  public void setE01CRLFAM(BigDecimal newvalue)
  {
    fieldE01CRLFAM.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01CRLFAM as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01CRLFAM()
  {
    return fieldE01CRLFAM.getBigDecimal();
  }

  /**
  * Set field E01CRLFAD using a String value.
  */
  public void setE01CRLFAD(String newvalue)
  {
    fieldE01CRLFAD.setString(newvalue);
  }

  /**
  * Get value of field E01CRLFAD as a String.
  */
  public String getE01CRLFAD()
  {
    return fieldE01CRLFAD.getString();
  }

  /**
  * Set numeric field E01CRLFAD using a BigDecimal value.
  */
  public void setE01CRLFAD(BigDecimal newvalue)
  {
    fieldE01CRLFAD.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01CRLFAD as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01CRLFAD()
  {
    return fieldE01CRLFAD.getBigDecimal();
  }

  /**
  * Set field E01CRLHOR using a String value.
  */
  public void setE01CRLHOR(String newvalue)
  {
    fieldE01CRLHOR.setString(newvalue);
  }

  /**
  * Get value of field E01CRLHOR as a String.
  */
  public String getE01CRLHOR()
  {
    return fieldE01CRLHOR.getString();
  }

  /**
  * Set numeric field E01CRLHOR using a BigDecimal value.
  */
  public void setE01CRLHOR(BigDecimal newvalue)
  {
    fieldE01CRLHOR.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01CRLHOR as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01CRLHOR()
  {
    return fieldE01CRLHOR.getBigDecimal();
  }

  /**
  * Set field E01CRLGUB using a String value.
  */
  public void setE01CRLGUB(String newvalue)
  {
    fieldE01CRLGUB.setString(newvalue);
  }

  /**
  * Get value of field E01CRLGUB as a String.
  */
  public String getE01CRLGUB()
  {
    return fieldE01CRLGUB.getString();
  }

  /**
  * Set field E01CRLCPL using a String value.
  */
  public void setE01CRLCPL(String newvalue)
  {
    fieldE01CRLCPL.setString(newvalue);
  }

  /**
  * Get value of field E01CRLCPL as a String.
  */
  public String getE01CRLCPL()
  {
    return fieldE01CRLCPL.getString();
  }

  /**
  * Set numeric field E01CRLCPL using a BigDecimal value.
  */
  public void setE01CRLCPL(BigDecimal newvalue)
  {
    fieldE01CRLCPL.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01CRLCPL as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01CRLCPL()
  {
    return fieldE01CRLCPL.getBigDecimal();
  }

  /**
  * Set field E01CRLACT using a String value.
  */
  public void setE01CRLACT(String newvalue)
  {
    fieldE01CRLACT.setString(newvalue);
  }

  /**
  * Get value of field E01CRLACT as a String.
  */
  public String getE01CRLACT()
  {
    return fieldE01CRLACT.getString();
  }

}