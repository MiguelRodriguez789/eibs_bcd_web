package datapro.eibs.beans;

import datapro.eibs.sockets.*;
import java.io.*;
import java.math.*;

import java.util.*;

/**
* Class generated by AS/400 CRTCLASS command from EDD057501 physical file definition.
* 
* File level identifier is 1041209165901.
* Record format level identifier is 45117CB833B04.
*/

public class EDD057501Message extends MessageRecord
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
                                     "E01ACMBNK",
                                     "E01FRMACC",
                                     "E01TOACC",
                                     "E01OPEACC",
                                     "E01TRACD1",
                                     "E01DESCD1",
                                     "E01TRACD2",
                                     "E01DESCD2",
                                     "E01TRACD3",
                                     "E01DESCD3",
                                     "E01TRACD4",
                                     "E01DESCD4",
                                     "E01TRACD5",
                                     "E01DESCD5",
                                     "E01RETSTS",
                                     "E01RETRD1",
                                     "E01RETRD2",
                                     "E01RETRD3",
                                     "E01FRMNME",
                                     "E01FRMPRD",
                                     "E01FRMCCY",
                                     "E01FRMPRO",
                                     "E01TONME",
                                     "E01TOPRD",
                                     "E01TOCCY",
                                     "E01OPENME",
                                     "E01OPEPRD",
                                     "E01OPECCY"
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
                                   "E01ACMBNK",
                                   "E01FRMACC",
                                   "E01TOACC",
                                   "E01OPEACC",
                                   "E01TRACD1",
                                   "E01DESCD1",
                                   "E01TRACD2",
                                   "E01DESCD2",
                                   "E01TRACD3",
                                   "E01DESCD3",
                                   "E01TRACD4",
                                   "E01DESCD4",
                                   "E01TRACD5",
                                   "E01DESCD5",
                                   "E01RETSTS",
                                   "E01RETRD1",
                                   "E01RETRD2",
                                   "E01RETRD3",
                                   "E01FRMNME",
                                   "E01FRMPRD",
                                   "E01FRMCCY",
                                   "E01FRMPRO",
                                   "E01TONME",
                                   "E01TOPRD",
                                   "E01TOCCY",
                                   "E01OPENME",
                                   "E01OPEPRD",
                                   "E01OPECCY"
                                 };
  final static String fid = "1041209165901";
  final static String rid = "45117CB833B04";
  final static String fmtname = "EDD057501";
  final int FIELDCOUNT = 37;
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
  private CharacterField fieldE01ACMBNK = null;
  private DecimalField fieldE01FRMACC = null;
  private DecimalField fieldE01TOACC = null;
  private DecimalField fieldE01OPEACC = null;
  private CharacterField fieldE01TRACD1 = null;
  private CharacterField fieldE01DESCD1 = null;
  private CharacterField fieldE01TRACD2 = null;
  private CharacterField fieldE01DESCD2 = null;
  private CharacterField fieldE01TRACD3 = null;
  private CharacterField fieldE01DESCD3 = null;
  private CharacterField fieldE01TRACD4 = null;
  private CharacterField fieldE01DESCD4 = null;
  private CharacterField fieldE01TRACD5 = null;
  private CharacterField fieldE01DESCD5 = null;
  private CharacterField fieldE01RETSTS = null;
  private DecimalField fieldE01RETRD1 = null;
  private DecimalField fieldE01RETRD2 = null;
  private DecimalField fieldE01RETRD3 = null;
  private CharacterField fieldE01FRMNME = null;
  private CharacterField fieldE01FRMPRD = null;
  private CharacterField fieldE01FRMCCY = null;
  private CharacterField fieldE01FRMPRO = null;
  private CharacterField fieldE01TONME = null;
  private CharacterField fieldE01TOPRD = null;
  private CharacterField fieldE01TOCCY = null;
  private CharacterField fieldE01OPENME = null;
  private CharacterField fieldE01OPEPRD = null;
  private CharacterField fieldE01OPECCY = null;

  /**
  * Constructor for EDD057501Message.
  */
  public EDD057501Message()
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
    recordsize = 439;
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
    fields[9] = fieldE01ACMBNK =
    new CharacterField(message, HEADERSIZE + 42, 2, "E01ACMBNK");
    fields[10] = fieldE01FRMACC =
    new DecimalField(message, HEADERSIZE + 44, 13, 0, "E01FRMACC");
    fields[11] = fieldE01TOACC =
    new DecimalField(message, HEADERSIZE + 57, 13, 0, "E01TOACC");
    fields[12] = fieldE01OPEACC =
    new DecimalField(message, HEADERSIZE + 70, 13, 0, "E01OPEACC");
    fields[13] = fieldE01TRACD1 =
    new CharacterField(message, HEADERSIZE + 83, 2, "E01TRACD1");
    fields[14] = fieldE01DESCD1 =
    new CharacterField(message, HEADERSIZE + 85, 35, "E01DESCD1");
    fields[15] = fieldE01TRACD2 =
    new CharacterField(message, HEADERSIZE + 120, 2, "E01TRACD2");
    fields[16] = fieldE01DESCD2 =
    new CharacterField(message, HEADERSIZE + 122, 35, "E01DESCD2");
    fields[17] = fieldE01TRACD3 =
    new CharacterField(message, HEADERSIZE + 157, 2, "E01TRACD3");
    fields[18] = fieldE01DESCD3 =
    new CharacterField(message, HEADERSIZE + 159, 35, "E01DESCD3");
    fields[19] = fieldE01TRACD4 =
    new CharacterField(message, HEADERSIZE + 194, 2, "E01TRACD4");
    fields[20] = fieldE01DESCD4 =
    new CharacterField(message, HEADERSIZE + 196, 35, "E01DESCD4");
    fields[21] = fieldE01TRACD5 =
    new CharacterField(message, HEADERSIZE + 231, 2, "E01TRACD5");
    fields[22] = fieldE01DESCD5 =
    new CharacterField(message, HEADERSIZE + 233, 35, "E01DESCD5");
    fields[23] = fieldE01RETSTS =
    new CharacterField(message, HEADERSIZE + 268, 1, "E01RETSTS");
    fields[24] = fieldE01RETRD1 =
    new DecimalField(message, HEADERSIZE + 269, 3, 0, "E01RETRD1");
    fields[25] = fieldE01RETRD2 =
    new DecimalField(message, HEADERSIZE + 272, 3, 0, "E01RETRD2");
    fields[26] = fieldE01RETRD3 =
    new DecimalField(message, HEADERSIZE + 275, 3, 0, "E01RETRD3");
    fields[27] = fieldE01FRMNME =
    new CharacterField(message, HEADERSIZE + 278, 45, "E01FRMNME");
    fields[28] = fieldE01FRMPRD =
    new CharacterField(message, HEADERSIZE + 323, 4, "E01FRMPRD");
    fields[29] = fieldE01FRMCCY =
    new CharacterField(message, HEADERSIZE + 327, 3, "E01FRMCCY");
    fields[30] = fieldE01FRMPRO =
    new CharacterField(message, HEADERSIZE + 330, 4, "E01FRMPRO");
    fields[31] = fieldE01TONME =
    new CharacterField(message, HEADERSIZE + 334, 45, "E01TONME");
    fields[32] = fieldE01TOPRD =
    new CharacterField(message, HEADERSIZE + 379, 4, "E01TOPRD");
    fields[33] = fieldE01TOCCY =
    new CharacterField(message, HEADERSIZE + 383, 3, "E01TOCCY");
    fields[34] = fieldE01OPENME =
    new CharacterField(message, HEADERSIZE + 386, 45, "E01OPENME");
    fields[35] = fieldE01OPEPRD =
    new CharacterField(message, HEADERSIZE + 431, 4, "E01OPEPRD");
    fields[36] = fieldE01OPECCY =
    new CharacterField(message, HEADERSIZE + 435, 4, "E01OPECCY");

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
  * Set field E01FRMACC using a String value.
  */
  public void setE01FRMACC(String newvalue)
  {
    fieldE01FRMACC.setString(newvalue);
  }

  /**
  * Get value of field E01FRMACC as a String.
  */
  public String getE01FRMACC()
  {
    return fieldE01FRMACC.getString();
  }

  /**
  * Set numeric field E01FRMACC using a BigDecimal value.
  */
  public void setE01FRMACC(BigDecimal newvalue)
  {
    fieldE01FRMACC.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01FRMACC as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01FRMACC()
  {
    return fieldE01FRMACC.getBigDecimal();
  }

  /**
  * Set field E01TOACC using a String value.
  */
  public void setE01TOACC(String newvalue)
  {
    fieldE01TOACC.setString(newvalue);
  }

  /**
  * Get value of field E01TOACC as a String.
  */
  public String getE01TOACC()
  {
    return fieldE01TOACC.getString();
  }

  /**
  * Set numeric field E01TOACC using a BigDecimal value.
  */
  public void setE01TOACC(BigDecimal newvalue)
  {
    fieldE01TOACC.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01TOACC as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01TOACC()
  {
    return fieldE01TOACC.getBigDecimal();
  }

  /**
  * Set field E01OPEACC using a String value.
  */
  public void setE01OPEACC(String newvalue)
  {
    fieldE01OPEACC.setString(newvalue);
  }

  /**
  * Get value of field E01OPEACC as a String.
  */
  public String getE01OPEACC()
  {
    return fieldE01OPEACC.getString();
  }

  /**
  * Set numeric field E01OPEACC using a BigDecimal value.
  */
  public void setE01OPEACC(BigDecimal newvalue)
  {
    fieldE01OPEACC.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01OPEACC as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01OPEACC()
  {
    return fieldE01OPEACC.getBigDecimal();
  }

  /**
  * Set field E01TRACD1 using a String value.
  */
  public void setE01TRACD1(String newvalue)
  {
    fieldE01TRACD1.setString(newvalue);
  }

  /**
  * Get value of field E01TRACD1 as a String.
  */
  public String getE01TRACD1()
  {
    return fieldE01TRACD1.getString();
  }

  /**
  * Set field E01DESCD1 using a String value.
  */
  public void setE01DESCD1(String newvalue)
  {
    fieldE01DESCD1.setString(newvalue);
  }

  /**
  * Get value of field E01DESCD1 as a String.
  */
  public String getE01DESCD1()
  {
    return fieldE01DESCD1.getString();
  }

  /**
  * Set field E01TRACD2 using a String value.
  */
  public void setE01TRACD2(String newvalue)
  {
    fieldE01TRACD2.setString(newvalue);
  }

  /**
  * Get value of field E01TRACD2 as a String.
  */
  public String getE01TRACD2()
  {
    return fieldE01TRACD2.getString();
  }

  /**
  * Set field E01DESCD2 using a String value.
  */
  public void setE01DESCD2(String newvalue)
  {
    fieldE01DESCD2.setString(newvalue);
  }

  /**
  * Get value of field E01DESCD2 as a String.
  */
  public String getE01DESCD2()
  {
    return fieldE01DESCD2.getString();
  }

  /**
  * Set field E01TRACD3 using a String value.
  */
  public void setE01TRACD3(String newvalue)
  {
    fieldE01TRACD3.setString(newvalue);
  }

  /**
  * Get value of field E01TRACD3 as a String.
  */
  public String getE01TRACD3()
  {
    return fieldE01TRACD3.getString();
  }

  /**
  * Set field E01DESCD3 using a String value.
  */
  public void setE01DESCD3(String newvalue)
  {
    fieldE01DESCD3.setString(newvalue);
  }

  /**
  * Get value of field E01DESCD3 as a String.
  */
  public String getE01DESCD3()
  {
    return fieldE01DESCD3.getString();
  }

  /**
  * Set field E01TRACD4 using a String value.
  */
  public void setE01TRACD4(String newvalue)
  {
    fieldE01TRACD4.setString(newvalue);
  }

  /**
  * Get value of field E01TRACD4 as a String.
  */
  public String getE01TRACD4()
  {
    return fieldE01TRACD4.getString();
  }

  /**
  * Set field E01DESCD4 using a String value.
  */
  public void setE01DESCD4(String newvalue)
  {
    fieldE01DESCD4.setString(newvalue);
  }

  /**
  * Get value of field E01DESCD4 as a String.
  */
  public String getE01DESCD4()
  {
    return fieldE01DESCD4.getString();
  }

  /**
  * Set field E01TRACD5 using a String value.
  */
  public void setE01TRACD5(String newvalue)
  {
    fieldE01TRACD5.setString(newvalue);
  }

  /**
  * Get value of field E01TRACD5 as a String.
  */
  public String getE01TRACD5()
  {
    return fieldE01TRACD5.getString();
  }

  /**
  * Set field E01DESCD5 using a String value.
  */
  public void setE01DESCD5(String newvalue)
  {
    fieldE01DESCD5.setString(newvalue);
  }

  /**
  * Get value of field E01DESCD5 as a String.
  */
  public String getE01DESCD5()
  {
    return fieldE01DESCD5.getString();
  }

  /**
  * Set field E01RETSTS using a String value.
  */
  public void setE01RETSTS(String newvalue)
  {
    fieldE01RETSTS.setString(newvalue);
  }

  /**
  * Get value of field E01RETSTS as a String.
  */
  public String getE01RETSTS()
  {
    return fieldE01RETSTS.getString();
  }

  /**
  * Set field E01RETRD1 using a String value.
  */
  public void setE01RETRD1(String newvalue)
  {
    fieldE01RETRD1.setString(newvalue);
  }

  /**
  * Get value of field E01RETRD1 as a String.
  */
  public String getE01RETRD1()
  {
    return fieldE01RETRD1.getString();
  }

  /**
  * Set numeric field E01RETRD1 using a BigDecimal value.
  */
  public void setE01RETRD1(BigDecimal newvalue)
  {
    fieldE01RETRD1.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01RETRD1 as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01RETRD1()
  {
    return fieldE01RETRD1.getBigDecimal();
  }

  /**
  * Set field E01RETRD2 using a String value.
  */
  public void setE01RETRD2(String newvalue)
  {
    fieldE01RETRD2.setString(newvalue);
  }

  /**
  * Get value of field E01RETRD2 as a String.
  */
  public String getE01RETRD2()
  {
    return fieldE01RETRD2.getString();
  }

  /**
  * Set numeric field E01RETRD2 using a BigDecimal value.
  */
  public void setE01RETRD2(BigDecimal newvalue)
  {
    fieldE01RETRD2.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01RETRD2 as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01RETRD2()
  {
    return fieldE01RETRD2.getBigDecimal();
  }

  /**
  * Set field E01RETRD3 using a String value.
  */
  public void setE01RETRD3(String newvalue)
  {
    fieldE01RETRD3.setString(newvalue);
  }

  /**
  * Get value of field E01RETRD3 as a String.
  */
  public String getE01RETRD3()
  {
    return fieldE01RETRD3.getString();
  }

  /**
  * Set numeric field E01RETRD3 using a BigDecimal value.
  */
  public void setE01RETRD3(BigDecimal newvalue)
  {
    fieldE01RETRD3.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01RETRD3 as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01RETRD3()
  {
    return fieldE01RETRD3.getBigDecimal();
  }

  /**
  * Set field E01FRMNME using a String value.
  */
  public void setE01FRMNME(String newvalue)
  {
    fieldE01FRMNME.setString(newvalue);
  }

  /**
  * Get value of field E01FRMNME as a String.
  */
  public String getE01FRMNME()
  {
    return fieldE01FRMNME.getString();
  }

  /**
  * Set field E01FRMPRD using a String value.
  */
  public void setE01FRMPRD(String newvalue)
  {
    fieldE01FRMPRD.setString(newvalue);
  }

  /**
  * Get value of field E01FRMPRD as a String.
  */
  public String getE01FRMPRD()
  {
    return fieldE01FRMPRD.getString();
  }

  /**
  * Set field E01FRMCCY using a String value.
  */
  public void setE01FRMCCY(String newvalue)
  {
    fieldE01FRMCCY.setString(newvalue);
  }

  /**
  * Get value of field E01FRMCCY as a String.
  */
  public String getE01FRMCCY()
  {
    return fieldE01FRMCCY.getString();
  }

  /**
  * Set field E01FRMPRO using a String value.
  */
  public void setE01FRMPRO(String newvalue)
  {
    fieldE01FRMPRO.setString(newvalue);
  }

  /**
  * Get value of field E01FRMPRO as a String.
  */
  public String getE01FRMPRO()
  {
    return fieldE01FRMPRO.getString();
  }

  /**
  * Set field E01TONME using a String value.
  */
  public void setE01TONME(String newvalue)
  {
    fieldE01TONME.setString(newvalue);
  }

  /**
  * Get value of field E01TONME as a String.
  */
  public String getE01TONME()
  {
    return fieldE01TONME.getString();
  }

  /**
  * Set field E01TOPRD using a String value.
  */
  public void setE01TOPRD(String newvalue)
  {
    fieldE01TOPRD.setString(newvalue);
  }

  /**
  * Get value of field E01TOPRD as a String.
  */
  public String getE01TOPRD()
  {
    return fieldE01TOPRD.getString();
  }

  /**
  * Set field E01TOCCY using a String value.
  */
  public void setE01TOCCY(String newvalue)
  {
    fieldE01TOCCY.setString(newvalue);
  }

  /**
  * Get value of field E01TOCCY as a String.
  */
  public String getE01TOCCY()
  {
    return fieldE01TOCCY.getString();
  }

  /**
  * Set field E01OPENME using a String value.
  */
  public void setE01OPENME(String newvalue)
  {
    fieldE01OPENME.setString(newvalue);
  }

  /**
  * Get value of field E01OPENME as a String.
  */
  public String getE01OPENME()
  {
    return fieldE01OPENME.getString();
  }

  /**
  * Set field E01OPEPRD using a String value.
  */
  public void setE01OPEPRD(String newvalue)
  {
    fieldE01OPEPRD.setString(newvalue);
  }

  /**
  * Get value of field E01OPEPRD as a String.
  */
  public String getE01OPEPRD()
  {
    return fieldE01OPEPRD.getString();
  }

  /**
  * Set field E01OPECCY using a String value.
  */
  public void setE01OPECCY(String newvalue)
  {
    fieldE01OPECCY.setString(newvalue);
  }

  /**
  * Get value of field E01OPECCY as a String.
  */
  public String getE01OPECCY()
  {
    return fieldE01OPECCY.getString();
  }

}
