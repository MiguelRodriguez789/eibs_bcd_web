package datapro.eibs.beans;

import datapro.eibs.sockets.*;
import java.io.*;
import java.math.*;

import java.util.*;

/**
* Class generated by AS/400 CRTCLASS command from EDD061004 physical file definition.
* 
* File level identifier is 1170113153139.
* Record format level identifier is 2DAC20C5EAEEF.
*/

public class EDD061004Message extends MessageRecord
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
                                     "E04SCHBNK",
                                     "E04SCHTYA",
                                     "E04SCHNUM",
                                     "E04TLXORD",
                                     "E04TLXVIA",
                                     "E04TLXCNU",
                                     "E04TLXLOG",
                                     "E04WRTCAM",
                                     "E04TLXTO1",
                                     "E04TLXTO2",
                                     "E04TLXCSN",
                                     "E04TLXTYN",
                                     "E04TLXTSN",
                                     "E04TLXBYO",
                                     "E04TLXORB",
                                     "E04WRTORF",
                                     "E04TLXBF1",
                                     "E04TLXBF2",
                                     "E04TLXBB1",
                                     "E04TLXBNA",
                                     "E04TLXBNB",
                                     "E04TLXBN1",
                                     "E04TLXDT1",
                                     "E04TLXDT2",
                                     "E04TLXOUA",
                                     "E04TLXOU1",
                                     "E04TLXCHB",
                                     "E04TLXCHO",
                                     "E04TLXCVP",
                                     "E04TLXOTC",
                                     "E04INSDTM",
                                     "E04INSDTD",
                                     "E04INSDTY",
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
                                   "E04SCHBNK",
                                   "E04SCHTYA",
                                   "E04SCHNUM",
                                   "E04TLXORD",
                                   "E04TLXVIA",
                                   "E04TLXCNU",
                                   "E04TLXLOG",
                                   "E04WRTCAM",
                                   "E04TLXTO1",
                                   "E04TLXTO2",
                                   "E04TLXCSN",
                                   "E04TLXTYN",
                                   "E04TLXTSN",
                                   "E04TLXBYO",
                                   "E04TLXORB",
                                   "E04WRTORF",
                                   "E04TLXBF1",
                                   "E04TLXBF2",
                                   "E04TLXBB1",
                                   "E04TLXBNA",
                                   "E04TLXBNB",
                                   "E04TLXBN1",
                                   "E04TLXDT1",
                                   "E04TLXDT2",
                                   "E04TLXOUA",
                                   "E04TLXOU1",
                                   "E04TLXCHB",
                                   "E04TLXCHO",
                                   "E04TLXCVP",
                                   "E04TLXOTC",
                                   "E04INSDTM",
                                   "E04INSDTD",
                                   "E04INSDTY",
                                   "E04NUMREC",
                                   "E04INDOPE"
                                 };
  final static String fid = "1170113153139";
  final static String rid = "2DAC20C5EAEEF";
  final static String fmtname = "EDD061004";
  final int FIELDCOUNT = 44;
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
  private CharacterField fieldE04SCHBNK = null;
  private CharacterField fieldE04SCHTYA = null;
  private CharacterField fieldE04SCHNUM = null;
  private CharacterField fieldE04TLXORD = null;
  private CharacterField fieldE04TLXVIA = null;
  private DecimalField fieldE04TLXCNU = null;
  private CharacterField fieldE04TLXLOG = null;
  private DecimalField fieldE04WRTCAM = null;
  private CharacterField fieldE04TLXTO1 = null;
  private CharacterField fieldE04TLXTO2 = null;
  private CharacterField fieldE04TLXCSN = null;
  private CharacterField fieldE04TLXTYN = null;
  private CharacterField fieldE04TLXTSN = null;
  private CharacterField fieldE04TLXBYO = null;
  private CharacterField fieldE04TLXORB = null;
  private CharacterField fieldE04WRTORF = null;
  private CharacterField fieldE04TLXBF1 = null;
  private CharacterField fieldE04TLXBF2 = null;
  private CharacterField fieldE04TLXBB1 = null;
  private CharacterField fieldE04TLXBNA = null;
  private CharacterField fieldE04TLXBNB = null;
  private CharacterField fieldE04TLXBN1 = null;
  private CharacterField fieldE04TLXDT1 = null;
  private CharacterField fieldE04TLXDT2 = null;
  private CharacterField fieldE04TLXOUA = null;
  private CharacterField fieldE04TLXOU1 = null;
  private CharacterField fieldE04TLXCHB = null;
  private CharacterField fieldE04TLXCHO = null;
  private CharacterField fieldE04TLXCVP = null;
  private CharacterField fieldE04TLXOTC = null;
  private DecimalField fieldE04INSDTM = null;
  private DecimalField fieldE04INSDTD = null;
  private DecimalField fieldE04INSDTY = null;
  private DecimalField fieldE04NUMREC = null;
  private CharacterField fieldE04INDOPE = null;

  /**
  * Constructor for EDD061004Message.
  */
  public EDD061004Message()
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
    recordsize = 917;
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
    fields[9] = fieldE04SCHBNK =
    new CharacterField(message, HEADERSIZE + 42, 2, "E04SCHBNK");
    fields[10] = fieldE04SCHTYA =
    new CharacterField(message, HEADERSIZE + 44, 1, "E04SCHTYA");
    fields[11] = fieldE04SCHNUM =
    new CharacterField(message, HEADERSIZE + 45, 7, "E04SCHNUM");
    fields[12] = fieldE04TLXORD =
    new CharacterField(message, HEADERSIZE + 52, 12, "E04TLXORD");
    fields[13] = fieldE04TLXVIA =
    new CharacterField(message, HEADERSIZE + 64, 1, "E04TLXVIA");
    fields[14] = fieldE04TLXCNU =
    new DecimalField(message, HEADERSIZE + 65, 10, 0, "E04TLXCNU");
    fields[15] = fieldE04TLXLOG =
    new CharacterField(message, HEADERSIZE + 75, 12, "E04TLXLOG");
    fields[16] = fieldE04WRTCAM =
    new DecimalField(message, HEADERSIZE + 87, 17, 2, "E04WRTCAM");
    fields[17] = fieldE04TLXTO1 =
    new CharacterField(message, HEADERSIZE + 104, 35, "E04TLXTO1");
    fields[18] = fieldE04TLXTO2 =
    new CharacterField(message, HEADERSIZE + 139, 35, "E04TLXTO2");
    fields[19] = fieldE04TLXCSN =
    new CharacterField(message, HEADERSIZE + 174, 15, "E04TLXCSN");
    fields[20] = fieldE04TLXTYN =
    new CharacterField(message, HEADERSIZE + 189, 1, "E04TLXTYN");
    fields[21] = fieldE04TLXTSN =
    new CharacterField(message, HEADERSIZE + 190, 20, "E04TLXTSN");
    fields[22] = fieldE04TLXBYO =
    new CharacterField(message, HEADERSIZE + 210, 70, "E04TLXBYO");
    fields[23] = fieldE04TLXORB =
    new CharacterField(message, HEADERSIZE + 280, 70, "E04TLXORB");
    fields[24] = fieldE04WRTORF =
    new CharacterField(message, HEADERSIZE + 350, 16, "E04WRTORF");
    fields[25] = fieldE04TLXBF1 =
    new CharacterField(message, HEADERSIZE + 366, 45, "E04TLXBF1");
    fields[26] = fieldE04TLXBF2 =
    new CharacterField(message, HEADERSIZE + 411, 45, "E04TLXBF2");
    fields[27] = fieldE04TLXBB1 =
    new CharacterField(message, HEADERSIZE + 456, 70, "E04TLXBB1");
    fields[28] = fieldE04TLXBNA =
    new CharacterField(message, HEADERSIZE + 526, 45, "E04TLXBNA");
    fields[29] = fieldE04TLXBNB =
    new CharacterField(message, HEADERSIZE + 571, 45, "E04TLXBNB");
    fields[30] = fieldE04TLXBN1 =
    new CharacterField(message, HEADERSIZE + 616, 70, "E04TLXBN1");
    fields[31] = fieldE04TLXDT1 =
    new CharacterField(message, HEADERSIZE + 686, 45, "E04TLXDT1");
    fields[32] = fieldE04TLXDT2 =
    new CharacterField(message, HEADERSIZE + 731, 45, "E04TLXDT2");
    fields[33] = fieldE04TLXOUA =
    new CharacterField(message, HEADERSIZE + 776, 16, "E04TLXOUA");
    fields[34] = fieldE04TLXOU1 =
    new CharacterField(message, HEADERSIZE + 792, 13, "E04TLXOU1");
    fields[35] = fieldE04TLXCHB =
    new CharacterField(message, HEADERSIZE + 805, 1, "E04TLXCHB");
    fields[36] = fieldE04TLXCHO =
    new CharacterField(message, HEADERSIZE + 806, 1, "E04TLXCHO");
    fields[37] = fieldE04TLXCVP =
    new CharacterField(message, HEADERSIZE + 807, 20, "E04TLXCVP");
    fields[38] = fieldE04TLXOTC =
    new CharacterField(message, HEADERSIZE + 827, 70, "E04TLXOTC");
    fields[39] = fieldE04INSDTM =
    new DecimalField(message, HEADERSIZE + 897, 3, 0, "E04INSDTM");
    fields[40] = fieldE04INSDTD =
    new DecimalField(message, HEADERSIZE + 900, 3, 0, "E04INSDTD");
    fields[41] = fieldE04INSDTY =
    new DecimalField(message, HEADERSIZE + 903, 5, 0, "E04INSDTY");
    fields[42] = fieldE04NUMREC =
    new DecimalField(message, HEADERSIZE + 908, 8, 0, "E04NUMREC");
    fields[43] = fieldE04INDOPE =
    new CharacterField(message, HEADERSIZE + 916, 1, "E04INDOPE");

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
  * Set field E04SCHBNK using a String value.
  */
  public void setE04SCHBNK(String newvalue)
  {
    fieldE04SCHBNK.setString(newvalue);
  }

  /**
  * Get value of field E04SCHBNK as a String.
  */
  public String getE04SCHBNK()
  {
    return fieldE04SCHBNK.getString();
  }

  /**
  * Set field E04SCHTYA using a String value.
  */
  public void setE04SCHTYA(String newvalue)
  {
    fieldE04SCHTYA.setString(newvalue);
  }

  /**
  * Get value of field E04SCHTYA as a String.
  */
  public String getE04SCHTYA()
  {
    return fieldE04SCHTYA.getString();
  }

  /**
  * Set field E04SCHNUM using a String value.
  */
  public void setE04SCHNUM(String newvalue)
  {
    fieldE04SCHNUM.setString(newvalue);
  }

  /**
  * Get value of field E04SCHNUM as a String.
  */
  public String getE04SCHNUM()
  {
    return fieldE04SCHNUM.getString();
  }

  /**
  * Set field E04TLXORD using a String value.
  */
  public void setE04TLXORD(String newvalue)
  {
    fieldE04TLXORD.setString(newvalue);
  }

  /**
  * Get value of field E04TLXORD as a String.
  */
  public String getE04TLXORD()
  {
    return fieldE04TLXORD.getString();
  }

  /**
  * Set field E04TLXVIA using a String value.
  */
  public void setE04TLXVIA(String newvalue)
  {
    fieldE04TLXVIA.setString(newvalue);
  }

  /**
  * Get value of field E04TLXVIA as a String.
  */
  public String getE04TLXVIA()
  {
    return fieldE04TLXVIA.getString();
  }

  /**
  * Set field E04TLXCNU using a String value.
  */
  public void setE04TLXCNU(String newvalue)
  {
    fieldE04TLXCNU.setString(newvalue);
  }

  /**
  * Get value of field E04TLXCNU as a String.
  */
  public String getE04TLXCNU()
  {
    return fieldE04TLXCNU.getString();
  }

  /**
  * Set numeric field E04TLXCNU using a BigDecimal value.
  */
  public void setE04TLXCNU(BigDecimal newvalue)
  {
    fieldE04TLXCNU.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E04TLXCNU as a BigDecimal.
  */
  public BigDecimal getBigDecimalE04TLXCNU()
  {
    return fieldE04TLXCNU.getBigDecimal();
  }

  /**
  * Set field E04TLXLOG using a String value.
  */
  public void setE04TLXLOG(String newvalue)
  {
    fieldE04TLXLOG.setString(newvalue);
  }

  /**
  * Get value of field E04TLXLOG as a String.
  */
  public String getE04TLXLOG()
  {
    return fieldE04TLXLOG.getString();
  }

  /**
  * Set field E04WRTCAM using a String value.
  */
  public void setE04WRTCAM(String newvalue)
  {
    fieldE04WRTCAM.setString(newvalue);
  }

  /**
  * Get value of field E04WRTCAM as a String.
  */
  public String getE04WRTCAM()
  {
    return fieldE04WRTCAM.getString();
  }

  /**
  * Set numeric field E04WRTCAM using a BigDecimal value.
  */
  public void setE04WRTCAM(BigDecimal newvalue)
  {
    fieldE04WRTCAM.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E04WRTCAM as a BigDecimal.
  */
  public BigDecimal getBigDecimalE04WRTCAM()
  {
    return fieldE04WRTCAM.getBigDecimal();
  }

  /**
  * Set field E04TLXTO1 using a String value.
  */
  public void setE04TLXTO1(String newvalue)
  {
    fieldE04TLXTO1.setString(newvalue);
  }

  /**
  * Get value of field E04TLXTO1 as a String.
  */
  public String getE04TLXTO1()
  {
    return fieldE04TLXTO1.getString();
  }

  /**
  * Set field E04TLXTO2 using a String value.
  */
  public void setE04TLXTO2(String newvalue)
  {
    fieldE04TLXTO2.setString(newvalue);
  }

  /**
  * Get value of field E04TLXTO2 as a String.
  */
  public String getE04TLXTO2()
  {
    return fieldE04TLXTO2.getString();
  }

  /**
  * Set field E04TLXCSN using a String value.
  */
  public void setE04TLXCSN(String newvalue)
  {
    fieldE04TLXCSN.setString(newvalue);
  }

  /**
  * Get value of field E04TLXCSN as a String.
  */
  public String getE04TLXCSN()
  {
    return fieldE04TLXCSN.getString();
  }

  /**
  * Set field E04TLXTYN using a String value.
  */
  public void setE04TLXTYN(String newvalue)
  {
    fieldE04TLXTYN.setString(newvalue);
  }

  /**
  * Get value of field E04TLXTYN as a String.
  */
  public String getE04TLXTYN()
  {
    return fieldE04TLXTYN.getString();
  }

  /**
  * Set field E04TLXTSN using a String value.
  */
  public void setE04TLXTSN(String newvalue)
  {
    fieldE04TLXTSN.setString(newvalue);
  }

  /**
  * Get value of field E04TLXTSN as a String.
  */
  public String getE04TLXTSN()
  {
    return fieldE04TLXTSN.getString();
  }

  /**
  * Set field E04TLXBYO using a String value.
  */
  public void setE04TLXBYO(String newvalue)
  {
    fieldE04TLXBYO.setString(newvalue);
  }

  /**
  * Get value of field E04TLXBYO as a String.
  */
  public String getE04TLXBYO()
  {
    return fieldE04TLXBYO.getString();
  }

  /**
  * Set field E04TLXORB using a String value.
  */
  public void setE04TLXORB(String newvalue)
  {
    fieldE04TLXORB.setString(newvalue);
  }

  /**
  * Get value of field E04TLXORB as a String.
  */
  public String getE04TLXORB()
  {
    return fieldE04TLXORB.getString();
  }

  /**
  * Set field E04WRTORF using a String value.
  */
  public void setE04WRTORF(String newvalue)
  {
    fieldE04WRTORF.setString(newvalue);
  }

  /**
  * Get value of field E04WRTORF as a String.
  */
  public String getE04WRTORF()
  {
    return fieldE04WRTORF.getString();
  }

  /**
  * Set field E04TLXBF1 using a String value.
  */
  public void setE04TLXBF1(String newvalue)
  {
    fieldE04TLXBF1.setString(newvalue);
  }

  /**
  * Get value of field E04TLXBF1 as a String.
  */
  public String getE04TLXBF1()
  {
    return fieldE04TLXBF1.getString();
  }

  /**
  * Set field E04TLXBF2 using a String value.
  */
  public void setE04TLXBF2(String newvalue)
  {
    fieldE04TLXBF2.setString(newvalue);
  }

  /**
  * Get value of field E04TLXBF2 as a String.
  */
  public String getE04TLXBF2()
  {
    return fieldE04TLXBF2.getString();
  }

  /**
  * Set field E04TLXBB1 using a String value.
  */
  public void setE04TLXBB1(String newvalue)
  {
    fieldE04TLXBB1.setString(newvalue);
  }

  /**
  * Get value of field E04TLXBB1 as a String.
  */
  public String getE04TLXBB1()
  {
    return fieldE04TLXBB1.getString();
  }

  /**
  * Set field E04TLXBNA using a String value.
  */
  public void setE04TLXBNA(String newvalue)
  {
    fieldE04TLXBNA.setString(newvalue);
  }

  /**
  * Get value of field E04TLXBNA as a String.
  */
  public String getE04TLXBNA()
  {
    return fieldE04TLXBNA.getString();
  }

  /**
  * Set field E04TLXBNB using a String value.
  */
  public void setE04TLXBNB(String newvalue)
  {
    fieldE04TLXBNB.setString(newvalue);
  }

  /**
  * Get value of field E04TLXBNB as a String.
  */
  public String getE04TLXBNB()
  {
    return fieldE04TLXBNB.getString();
  }

  /**
  * Set field E04TLXBN1 using a String value.
  */
  public void setE04TLXBN1(String newvalue)
  {
    fieldE04TLXBN1.setString(newvalue);
  }

  /**
  * Get value of field E04TLXBN1 as a String.
  */
  public String getE04TLXBN1()
  {
    return fieldE04TLXBN1.getString();
  }

  /**
  * Set field E04TLXDT1 using a String value.
  */
  public void setE04TLXDT1(String newvalue)
  {
    fieldE04TLXDT1.setString(newvalue);
  }

  /**
  * Get value of field E04TLXDT1 as a String.
  */
  public String getE04TLXDT1()
  {
    return fieldE04TLXDT1.getString();
  }

  /**
  * Set field E04TLXDT2 using a String value.
  */
  public void setE04TLXDT2(String newvalue)
  {
    fieldE04TLXDT2.setString(newvalue);
  }

  /**
  * Get value of field E04TLXDT2 as a String.
  */
  public String getE04TLXDT2()
  {
    return fieldE04TLXDT2.getString();
  }

  /**
  * Set field E04TLXOUA using a String value.
  */
  public void setE04TLXOUA(String newvalue)
  {
    fieldE04TLXOUA.setString(newvalue);
  }

  /**
  * Get value of field E04TLXOUA as a String.
  */
  public String getE04TLXOUA()
  {
    return fieldE04TLXOUA.getString();
  }

  /**
  * Set field E04TLXOU1 using a String value.
  */
  public void setE04TLXOU1(String newvalue)
  {
    fieldE04TLXOU1.setString(newvalue);
  }

  /**
  * Get value of field E04TLXOU1 as a String.
  */
  public String getE04TLXOU1()
  {
    return fieldE04TLXOU1.getString();
  }

  /**
  * Set field E04TLXCHB using a String value.
  */
  public void setE04TLXCHB(String newvalue)
  {
    fieldE04TLXCHB.setString(newvalue);
  }

  /**
  * Get value of field E04TLXCHB as a String.
  */
  public String getE04TLXCHB()
  {
    return fieldE04TLXCHB.getString();
  }

  /**
  * Set field E04TLXCHO using a String value.
  */
  public void setE04TLXCHO(String newvalue)
  {
    fieldE04TLXCHO.setString(newvalue);
  }

  /**
  * Get value of field E04TLXCHO as a String.
  */
  public String getE04TLXCHO()
  {
    return fieldE04TLXCHO.getString();
  }

  /**
  * Set field E04TLXCVP using a String value.
  */
  public void setE04TLXCVP(String newvalue)
  {
    fieldE04TLXCVP.setString(newvalue);
  }

  /**
  * Get value of field E04TLXCVP as a String.
  */
  public String getE04TLXCVP()
  {
    return fieldE04TLXCVP.getString();
  }

  /**
  * Set field E04TLXOTC using a String value.
  */
  public void setE04TLXOTC(String newvalue)
  {
    fieldE04TLXOTC.setString(newvalue);
  }

  /**
  * Get value of field E04TLXOTC as a String.
  */
  public String getE04TLXOTC()
  {
    return fieldE04TLXOTC.getString();
  }

  /**
  * Set field E04INSDTM using a String value.
  */
  public void setE04INSDTM(String newvalue)
  {
    fieldE04INSDTM.setString(newvalue);
  }

  /**
  * Get value of field E04INSDTM as a String.
  */
  public String getE04INSDTM()
  {
    return fieldE04INSDTM.getString();
  }

  /**
  * Set numeric field E04INSDTM using a BigDecimal value.
  */
  public void setE04INSDTM(BigDecimal newvalue)
  {
    fieldE04INSDTM.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E04INSDTM as a BigDecimal.
  */
  public BigDecimal getBigDecimalE04INSDTM()
  {
    return fieldE04INSDTM.getBigDecimal();
  }

  /**
  * Set field E04INSDTD using a String value.
  */
  public void setE04INSDTD(String newvalue)
  {
    fieldE04INSDTD.setString(newvalue);
  }

  /**
  * Get value of field E04INSDTD as a String.
  */
  public String getE04INSDTD()
  {
    return fieldE04INSDTD.getString();
  }

  /**
  * Set numeric field E04INSDTD using a BigDecimal value.
  */
  public void setE04INSDTD(BigDecimal newvalue)
  {
    fieldE04INSDTD.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E04INSDTD as a BigDecimal.
  */
  public BigDecimal getBigDecimalE04INSDTD()
  {
    return fieldE04INSDTD.getBigDecimal();
  }

  /**
  * Set field E04INSDTY using a String value.
  */
  public void setE04INSDTY(String newvalue)
  {
    fieldE04INSDTY.setString(newvalue);
  }

  /**
  * Get value of field E04INSDTY as a String.
  */
  public String getE04INSDTY()
  {
    return fieldE04INSDTY.getString();
  }

  /**
  * Set numeric field E04INSDTY using a BigDecimal value.
  */
  public void setE04INSDTY(BigDecimal newvalue)
  {
    fieldE04INSDTY.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E04INSDTY as a BigDecimal.
  */
  public BigDecimal getBigDecimalE04INSDTY()
  {
    return fieldE04INSDTY.getBigDecimal();
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