package datapro.eibs.beans;

import datapro.eibs.sockets.*;
import java.io.*;
import java.math.*;

import java.util.*;

/**
* Class generated by AS/400 CRTCLASS command from EFIX03001 physical file definition.
* 
* File level identifier is 1160823175511.
* Record format level identifier is 3FCEBD0A123E7.
*/

public class EFIX03001Message extends MessageRecord
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
                                     "E01FIXBNK",
                                     "E01FIXCCY",
                                     "E01FIXGLN",
                                     "E01FIXDRA",
                                     "E01FIXCRA",
                                     "E01FIXDAI",
                                     "E01FIXCAI",
                                     "E01FIXADD",
                                     "E01FIXADC",
                                     "E01FIXALD",
                                     "E01FIXALC",
                                     "E01GLNDSC",
                                     "E01DRADSC",
                                     "E01CRADSC",
                                     "E01DAIDSC",
                                     "E01CAIDSC",
                                     "E01ADDDSC",
                                     "E01ADCDSC",
                                     "E01ALDDSC",
                                     "E01ALCDSC",
                                     "E01FIXBAJ",
                                     "E01FIXDRI",
                                     "E01FIXCRI",
                                     "E01BAJDSC",
                                     "E01DRIDSC",
                                     "E01CRIDSC",
                                     "E01FIXDRE",
                                     "E01FIXCRE",
                                     "E01DREDSC",
                                     "E01CREDSC"
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
                                   "E01FIXBNK",
                                   "E01FIXCCY",
                                   "E01FIXGLN",
                                   "E01FIXDRA",
                                   "E01FIXCRA",
                                   "E01FIXDAI",
                                   "E01FIXCAI",
                                   "E01FIXADD",
                                   "E01FIXADC",
                                   "E01FIXALD",
                                   "E01FIXALC",
                                   "E01GLNDSC",
                                   "E01DRADSC",
                                   "E01CRADSC",
                                   "E01DAIDSC",
                                   "E01CAIDSC",
                                   "E01ADDDSC",
                                   "E01ADCDSC",
                                   "E01ALDDSC",
                                   "E01ALCDSC",
                                   "E01FIXBAJ",
                                   "E01FIXDRI",
                                   "E01FIXCRI",
                                   "E01BAJDSC",
                                   "E01DRIDSC",
                                   "E01CRIDSC",
                                   "E01FIXDRE",
                                   "E01FIXCRE",
                                   "E01DREDSC",
                                   "E01CREDSC"
                                 };
  final static String fid = "1160823175511";
  final static String rid = "3FCEBD0A123E7";
  final static String fmtname = "EFIX03001";
  final int FIELDCOUNT = 39;
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
  private CharacterField fieldE01FIXBNK = null;
  private CharacterField fieldE01FIXCCY = null;
  private DecimalField fieldE01FIXGLN = null;
  private DecimalField fieldE01FIXDRA = null;
  private DecimalField fieldE01FIXCRA = null;
  private DecimalField fieldE01FIXDAI = null;
  private DecimalField fieldE01FIXCAI = null;
  private DecimalField fieldE01FIXADD = null;
  private DecimalField fieldE01FIXADC = null;
  private DecimalField fieldE01FIXALD = null;
  private DecimalField fieldE01FIXALC = null;
  private CharacterField fieldE01GLNDSC = null;
  private CharacterField fieldE01DRADSC = null;
  private CharacterField fieldE01CRADSC = null;
  private CharacterField fieldE01DAIDSC = null;
  private CharacterField fieldE01CAIDSC = null;
  private CharacterField fieldE01ADDDSC = null;
  private CharacterField fieldE01ADCDSC = null;
  private CharacterField fieldE01ALDDSC = null;
  private CharacterField fieldE01ALCDSC = null;
  private DecimalField fieldE01FIXBAJ = null;
  private DecimalField fieldE01FIXDRI = null;
  private DecimalField fieldE01FIXCRI = null;
  private CharacterField fieldE01BAJDSC = null;
  private CharacterField fieldE01DRIDSC = null;
  private CharacterField fieldE01CRIDSC = null;
  private DecimalField fieldE01FIXDRE = null;
  private DecimalField fieldE01FIXCRE = null;
  private CharacterField fieldE01DREDSC = null;
  private CharacterField fieldE01CREDSC = null;

  /**
  * Constructor for EFIX03001Message.
  */
  public EFIX03001Message()
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
    recordsize = 915;
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
    fields[9] = fieldE01FIXBNK =
    new CharacterField(message, HEADERSIZE + 42, 2, "E01FIXBNK");
    fields[10] = fieldE01FIXCCY =
    new CharacterField(message, HEADERSIZE + 44, 3, "E01FIXCCY");
    fields[11] = fieldE01FIXGLN =
    new DecimalField(message, HEADERSIZE + 47, 17, 0, "E01FIXGLN");
    fields[12] = fieldE01FIXDRA =
    new DecimalField(message, HEADERSIZE + 64, 17, 0, "E01FIXDRA");
    fields[13] = fieldE01FIXCRA =
    new DecimalField(message, HEADERSIZE + 81, 17, 0, "E01FIXCRA");
    fields[14] = fieldE01FIXDAI =
    new DecimalField(message, HEADERSIZE + 98, 17, 0, "E01FIXDAI");
    fields[15] = fieldE01FIXCAI =
    new DecimalField(message, HEADERSIZE + 115, 17, 0, "E01FIXCAI");
    fields[16] = fieldE01FIXADD =
    new DecimalField(message, HEADERSIZE + 132, 17, 0, "E01FIXADD");
    fields[17] = fieldE01FIXADC =
    new DecimalField(message, HEADERSIZE + 149, 17, 0, "E01FIXADC");
    fields[18] = fieldE01FIXALD =
    new DecimalField(message, HEADERSIZE + 166, 17, 0, "E01FIXALD");
    fields[19] = fieldE01FIXALC =
    new DecimalField(message, HEADERSIZE + 183, 17, 0, "E01FIXALC");
    fields[20] = fieldE01GLNDSC =
    new CharacterField(message, HEADERSIZE + 200, 45, "E01GLNDSC");
    fields[21] = fieldE01DRADSC =
    new CharacterField(message, HEADERSIZE + 245, 45, "E01DRADSC");
    fields[22] = fieldE01CRADSC =
    new CharacterField(message, HEADERSIZE + 290, 45, "E01CRADSC");
    fields[23] = fieldE01DAIDSC =
    new CharacterField(message, HEADERSIZE + 335, 45, "E01DAIDSC");
    fields[24] = fieldE01CAIDSC =
    new CharacterField(message, HEADERSIZE + 380, 45, "E01CAIDSC");
    fields[25] = fieldE01ADDDSC =
    new CharacterField(message, HEADERSIZE + 425, 45, "E01ADDDSC");
    fields[26] = fieldE01ADCDSC =
    new CharacterField(message, HEADERSIZE + 470, 45, "E01ADCDSC");
    fields[27] = fieldE01ALDDSC =
    new CharacterField(message, HEADERSIZE + 515, 45, "E01ALDDSC");
    fields[28] = fieldE01ALCDSC =
    new CharacterField(message, HEADERSIZE + 560, 45, "E01ALCDSC");
    fields[29] = fieldE01FIXBAJ =
    new DecimalField(message, HEADERSIZE + 605, 17, 0, "E01FIXBAJ");
    fields[30] = fieldE01FIXDRI =
    new DecimalField(message, HEADERSIZE + 622, 17, 0, "E01FIXDRI");
    fields[31] = fieldE01FIXCRI =
    new DecimalField(message, HEADERSIZE + 639, 17, 0, "E01FIXCRI");
    fields[32] = fieldE01BAJDSC =
    new CharacterField(message, HEADERSIZE + 656, 45, "E01BAJDSC");
    fields[33] = fieldE01DRIDSC =
    new CharacterField(message, HEADERSIZE + 701, 45, "E01DRIDSC");
    fields[34] = fieldE01CRIDSC =
    new CharacterField(message, HEADERSIZE + 746, 45, "E01CRIDSC");
    fields[35] = fieldE01FIXDRE =
    new DecimalField(message, HEADERSIZE + 791, 17, 0, "E01FIXDRE");
    fields[36] = fieldE01FIXCRE =
    new DecimalField(message, HEADERSIZE + 808, 17, 0, "E01FIXCRE");
    fields[37] = fieldE01DREDSC =
    new CharacterField(message, HEADERSIZE + 825, 45, "E01DREDSC");
    fields[38] = fieldE01CREDSC =
    new CharacterField(message, HEADERSIZE + 870, 45, "E01CREDSC");

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
  * Set field E01FIXBNK using a String value.
  */
  public void setE01FIXBNK(String newvalue)
  {
    fieldE01FIXBNK.setString(newvalue);
  }

  /**
  * Get value of field E01FIXBNK as a String.
  */
  public String getE01FIXBNK()
  {
    return fieldE01FIXBNK.getString();
  }

  /**
  * Set field E01FIXCCY using a String value.
  */
  public void setE01FIXCCY(String newvalue)
  {
    fieldE01FIXCCY.setString(newvalue);
  }

  /**
  * Get value of field E01FIXCCY as a String.
  */
  public String getE01FIXCCY()
  {
    return fieldE01FIXCCY.getString();
  }

  /**
  * Set field E01FIXGLN using a String value.
  */
  public void setE01FIXGLN(String newvalue)
  {
    fieldE01FIXGLN.setString(newvalue);
  }

  /**
  * Get value of field E01FIXGLN as a String.
  */
  public String getE01FIXGLN()
  {
    return fieldE01FIXGLN.getString();
  }

  /**
  * Set numeric field E01FIXGLN using a BigDecimal value.
  */
  public void setE01FIXGLN(BigDecimal newvalue)
  {
    fieldE01FIXGLN.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01FIXGLN as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01FIXGLN()
  {
    return fieldE01FIXGLN.getBigDecimal();
  }

  /**
  * Set field E01FIXDRA using a String value.
  */
  public void setE01FIXDRA(String newvalue)
  {
    fieldE01FIXDRA.setString(newvalue);
  }

  /**
  * Get value of field E01FIXDRA as a String.
  */
  public String getE01FIXDRA()
  {
    return fieldE01FIXDRA.getString();
  }

  /**
  * Set numeric field E01FIXDRA using a BigDecimal value.
  */
  public void setE01FIXDRA(BigDecimal newvalue)
  {
    fieldE01FIXDRA.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01FIXDRA as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01FIXDRA()
  {
    return fieldE01FIXDRA.getBigDecimal();
  }

  /**
  * Set field E01FIXCRA using a String value.
  */
  public void setE01FIXCRA(String newvalue)
  {
    fieldE01FIXCRA.setString(newvalue);
  }

  /**
  * Get value of field E01FIXCRA as a String.
  */
  public String getE01FIXCRA()
  {
    return fieldE01FIXCRA.getString();
  }

  /**
  * Set numeric field E01FIXCRA using a BigDecimal value.
  */
  public void setE01FIXCRA(BigDecimal newvalue)
  {
    fieldE01FIXCRA.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01FIXCRA as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01FIXCRA()
  {
    return fieldE01FIXCRA.getBigDecimal();
  }

  /**
  * Set field E01FIXDAI using a String value.
  */
  public void setE01FIXDAI(String newvalue)
  {
    fieldE01FIXDAI.setString(newvalue);
  }

  /**
  * Get value of field E01FIXDAI as a String.
  */
  public String getE01FIXDAI()
  {
    return fieldE01FIXDAI.getString();
  }

  /**
  * Set numeric field E01FIXDAI using a BigDecimal value.
  */
  public void setE01FIXDAI(BigDecimal newvalue)
  {
    fieldE01FIXDAI.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01FIXDAI as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01FIXDAI()
  {
    return fieldE01FIXDAI.getBigDecimal();
  }

  /**
  * Set field E01FIXCAI using a String value.
  */
  public void setE01FIXCAI(String newvalue)
  {
    fieldE01FIXCAI.setString(newvalue);
  }

  /**
  * Get value of field E01FIXCAI as a String.
  */
  public String getE01FIXCAI()
  {
    return fieldE01FIXCAI.getString();
  }

  /**
  * Set numeric field E01FIXCAI using a BigDecimal value.
  */
  public void setE01FIXCAI(BigDecimal newvalue)
  {
    fieldE01FIXCAI.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01FIXCAI as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01FIXCAI()
  {
    return fieldE01FIXCAI.getBigDecimal();
  }

  /**
  * Set field E01FIXADD using a String value.
  */
  public void setE01FIXADD(String newvalue)
  {
    fieldE01FIXADD.setString(newvalue);
  }

  /**
  * Get value of field E01FIXADD as a String.
  */
  public String getE01FIXADD()
  {
    return fieldE01FIXADD.getString();
  }

  /**
  * Set numeric field E01FIXADD using a BigDecimal value.
  */
  public void setE01FIXADD(BigDecimal newvalue)
  {
    fieldE01FIXADD.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01FIXADD as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01FIXADD()
  {
    return fieldE01FIXADD.getBigDecimal();
  }

  /**
  * Set field E01FIXADC using a String value.
  */
  public void setE01FIXADC(String newvalue)
  {
    fieldE01FIXADC.setString(newvalue);
  }

  /**
  * Get value of field E01FIXADC as a String.
  */
  public String getE01FIXADC()
  {
    return fieldE01FIXADC.getString();
  }

  /**
  * Set numeric field E01FIXADC using a BigDecimal value.
  */
  public void setE01FIXADC(BigDecimal newvalue)
  {
    fieldE01FIXADC.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01FIXADC as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01FIXADC()
  {
    return fieldE01FIXADC.getBigDecimal();
  }

  /**
  * Set field E01FIXALD using a String value.
  */
  public void setE01FIXALD(String newvalue)
  {
    fieldE01FIXALD.setString(newvalue);
  }

  /**
  * Get value of field E01FIXALD as a String.
  */
  public String getE01FIXALD()
  {
    return fieldE01FIXALD.getString();
  }

  /**
  * Set numeric field E01FIXALD using a BigDecimal value.
  */
  public void setE01FIXALD(BigDecimal newvalue)
  {
    fieldE01FIXALD.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01FIXALD as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01FIXALD()
  {
    return fieldE01FIXALD.getBigDecimal();
  }

  /**
  * Set field E01FIXALC using a String value.
  */
  public void setE01FIXALC(String newvalue)
  {
    fieldE01FIXALC.setString(newvalue);
  }

  /**
  * Get value of field E01FIXALC as a String.
  */
  public String getE01FIXALC()
  {
    return fieldE01FIXALC.getString();
  }

  /**
  * Set numeric field E01FIXALC using a BigDecimal value.
  */
  public void setE01FIXALC(BigDecimal newvalue)
  {
    fieldE01FIXALC.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01FIXALC as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01FIXALC()
  {
    return fieldE01FIXALC.getBigDecimal();
  }

  /**
  * Set field E01GLNDSC using a String value.
  */
  public void setE01GLNDSC(String newvalue)
  {
    fieldE01GLNDSC.setString(newvalue);
  }

  /**
  * Get value of field E01GLNDSC as a String.
  */
  public String getE01GLNDSC()
  {
    return fieldE01GLNDSC.getString();
  }

  /**
  * Set field E01DRADSC using a String value.
  */
  public void setE01DRADSC(String newvalue)
  {
    fieldE01DRADSC.setString(newvalue);
  }

  /**
  * Get value of field E01DRADSC as a String.
  */
  public String getE01DRADSC()
  {
    return fieldE01DRADSC.getString();
  }

  /**
  * Set field E01CRADSC using a String value.
  */
  public void setE01CRADSC(String newvalue)
  {
    fieldE01CRADSC.setString(newvalue);
  }

  /**
  * Get value of field E01CRADSC as a String.
  */
  public String getE01CRADSC()
  {
    return fieldE01CRADSC.getString();
  }

  /**
  * Set field E01DAIDSC using a String value.
  */
  public void setE01DAIDSC(String newvalue)
  {
    fieldE01DAIDSC.setString(newvalue);
  }

  /**
  * Get value of field E01DAIDSC as a String.
  */
  public String getE01DAIDSC()
  {
    return fieldE01DAIDSC.getString();
  }

  /**
  * Set field E01CAIDSC using a String value.
  */
  public void setE01CAIDSC(String newvalue)
  {
    fieldE01CAIDSC.setString(newvalue);
  }

  /**
  * Get value of field E01CAIDSC as a String.
  */
  public String getE01CAIDSC()
  {
    return fieldE01CAIDSC.getString();
  }

  /**
  * Set field E01ADDDSC using a String value.
  */
  public void setE01ADDDSC(String newvalue)
  {
    fieldE01ADDDSC.setString(newvalue);
  }

  /**
  * Get value of field E01ADDDSC as a String.
  */
  public String getE01ADDDSC()
  {
    return fieldE01ADDDSC.getString();
  }

  /**
  * Set field E01ADCDSC using a String value.
  */
  public void setE01ADCDSC(String newvalue)
  {
    fieldE01ADCDSC.setString(newvalue);
  }

  /**
  * Get value of field E01ADCDSC as a String.
  */
  public String getE01ADCDSC()
  {
    return fieldE01ADCDSC.getString();
  }

  /**
  * Set field E01ALDDSC using a String value.
  */
  public void setE01ALDDSC(String newvalue)
  {
    fieldE01ALDDSC.setString(newvalue);
  }

  /**
  * Get value of field E01ALDDSC as a String.
  */
  public String getE01ALDDSC()
  {
    return fieldE01ALDDSC.getString();
  }

  /**
  * Set field E01ALCDSC using a String value.
  */
  public void setE01ALCDSC(String newvalue)
  {
    fieldE01ALCDSC.setString(newvalue);
  }

  /**
  * Get value of field E01ALCDSC as a String.
  */
  public String getE01ALCDSC()
  {
    return fieldE01ALCDSC.getString();
  }

  /**
  * Set field E01FIXBAJ using a String value.
  */
  public void setE01FIXBAJ(String newvalue)
  {
    fieldE01FIXBAJ.setString(newvalue);
  }

  /**
  * Get value of field E01FIXBAJ as a String.
  */
  public String getE01FIXBAJ()
  {
    return fieldE01FIXBAJ.getString();
  }

  /**
  * Set numeric field E01FIXBAJ using a BigDecimal value.
  */
  public void setE01FIXBAJ(BigDecimal newvalue)
  {
    fieldE01FIXBAJ.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01FIXBAJ as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01FIXBAJ()
  {
    return fieldE01FIXBAJ.getBigDecimal();
  }

  /**
  * Set field E01FIXDRI using a String value.
  */
  public void setE01FIXDRI(String newvalue)
  {
    fieldE01FIXDRI.setString(newvalue);
  }

  /**
  * Get value of field E01FIXDRI as a String.
  */
  public String getE01FIXDRI()
  {
    return fieldE01FIXDRI.getString();
  }

  /**
  * Set numeric field E01FIXDRI using a BigDecimal value.
  */
  public void setE01FIXDRI(BigDecimal newvalue)
  {
    fieldE01FIXDRI.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01FIXDRI as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01FIXDRI()
  {
    return fieldE01FIXDRI.getBigDecimal();
  }

  /**
  * Set field E01FIXCRI using a String value.
  */
  public void setE01FIXCRI(String newvalue)
  {
    fieldE01FIXCRI.setString(newvalue);
  }

  /**
  * Get value of field E01FIXCRI as a String.
  */
  public String getE01FIXCRI()
  {
    return fieldE01FIXCRI.getString();
  }

  /**
  * Set numeric field E01FIXCRI using a BigDecimal value.
  */
  public void setE01FIXCRI(BigDecimal newvalue)
  {
    fieldE01FIXCRI.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01FIXCRI as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01FIXCRI()
  {
    return fieldE01FIXCRI.getBigDecimal();
  }

  /**
  * Set field E01BAJDSC using a String value.
  */
  public void setE01BAJDSC(String newvalue)
  {
    fieldE01BAJDSC.setString(newvalue);
  }

  /**
  * Get value of field E01BAJDSC as a String.
  */
  public String getE01BAJDSC()
  {
    return fieldE01BAJDSC.getString();
  }

  /**
  * Set field E01DRIDSC using a String value.
  */
  public void setE01DRIDSC(String newvalue)
  {
    fieldE01DRIDSC.setString(newvalue);
  }

  /**
  * Get value of field E01DRIDSC as a String.
  */
  public String getE01DRIDSC()
  {
    return fieldE01DRIDSC.getString();
  }

  /**
  * Set field E01CRIDSC using a String value.
  */
  public void setE01CRIDSC(String newvalue)
  {
    fieldE01CRIDSC.setString(newvalue);
  }

  /**
  * Get value of field E01CRIDSC as a String.
  */
  public String getE01CRIDSC()
  {
    return fieldE01CRIDSC.getString();
  }

  /**
  * Set field E01FIXDRE using a String value.
  */
  public void setE01FIXDRE(String newvalue)
  {
    fieldE01FIXDRE.setString(newvalue);
  }

  /**
  * Get value of field E01FIXDRE as a String.
  */
  public String getE01FIXDRE()
  {
    return fieldE01FIXDRE.getString();
  }

  /**
  * Set numeric field E01FIXDRE using a BigDecimal value.
  */
  public void setE01FIXDRE(BigDecimal newvalue)
  {
    fieldE01FIXDRE.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01FIXDRE as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01FIXDRE()
  {
    return fieldE01FIXDRE.getBigDecimal();
  }

  /**
  * Set field E01FIXCRE using a String value.
  */
  public void setE01FIXCRE(String newvalue)
  {
    fieldE01FIXCRE.setString(newvalue);
  }

  /**
  * Get value of field E01FIXCRE as a String.
  */
  public String getE01FIXCRE()
  {
    return fieldE01FIXCRE.getString();
  }

  /**
  * Set numeric field E01FIXCRE using a BigDecimal value.
  */
  public void setE01FIXCRE(BigDecimal newvalue)
  {
    fieldE01FIXCRE.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01FIXCRE as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01FIXCRE()
  {
    return fieldE01FIXCRE.getBigDecimal();
  }

  /**
  * Set field E01DREDSC using a String value.
  */
  public void setE01DREDSC(String newvalue)
  {
    fieldE01DREDSC.setString(newvalue);
  }

  /**
  * Get value of field E01DREDSC as a String.
  */
  public String getE01DREDSC()
  {
    return fieldE01DREDSC.getString();
  }

  /**
  * Set field E01CREDSC using a String value.
  */
  public void setE01CREDSC(String newvalue)
  {
    fieldE01CREDSC.setString(newvalue);
  }

  /**
  * Get value of field E01CREDSC as a String.
  */
  public String getE01CREDSC()
  {
    return fieldE01CREDSC.getString();
  }

}
