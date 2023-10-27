package datapro.eibs.beans;

import datapro.eibs.sockets.*;
import java.io.*;
import java.math.*;

import java.util.*;

/**
* Class generated by AS/400 CRTCLASS command from EDD067401 physical file definition.
* 
* File level identifier is 1130611112901.
* Record format level identifier is 487CAF9C864DF.
*/

public class EDD067401Message extends MessageRecord
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
                                     "E01CNTNME",
                                     "E01POTORD",
                                     "E01POTLOG",
                                     "E01POTCNU",
                                     "E01POTCSN",
                                     "E01POTTO1",
                                     "E01POTVIA",
                                     "E01POTTO2",
                                     "E01POTNRO",
                                     "E01POTBB1",
                                     "E01POTBB2",
                                     "E01POTBB3",
                                     "E01POTBF1",
                                     "E01POTBF2",
                                     "E01POTBF3",
                                     "E01POTBYO",
                                     "E01POTORB",
                                     "E01POTDT1",
                                     "E01POTDT2",
                                     "E01POTCHB",
                                     "E01POTCHO",
                                     "E01POTOU1",
                                     "E01POTOUA",
                                     "E01POTCVP",
                                     "E01POTOTC",
                                     "E01PODLDT",
                                     "E01POSLPN",
                                     "E01POSLPA",
                                     "E01LSTREF",
                                     "E01POTAM1",
                                     "E01POTAM2",
                                     "E01POTDCY",
                                     "E01POTDGL",
                                     "E01POTDAC",
                                     "E01POTDSB",
                                     "E01POTDCS",
                                     "E01DEBDSC",
                                     "E01POTCCY",
                                     "E01POTCGL",
                                     "E01POTCAC",
                                     "E01POTCSB",
                                     "E01POTCCS",
                                     "E01CREDSC",
                                     "E01POTFRQ",
                                     "E01POTPMD",
                                     "E01POTDYS",
                                     "E01POTNPM",
                                     "E01POTODA",
                                     "E01POTSPM",
                                     "E01POTDBR",
                                     "E01POTCBR",
                                     "E01POTPMT",
                                     "E01POTDAS"
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
                                   "E01CNTNME",
                                   "E01POTORD",
                                   "E01POTLOG",
                                   "E01POTCNU",
                                   "E01POTCSN",
                                   "E01POTTO1",
                                   "E01POTVIA",
                                   "E01POTTO2",
                                   "E01POTNRO",
                                   "E01POTBB1",
                                   "E01POTBB2",
                                   "E01POTBB3",
                                   "E01POTBF1",
                                   "E01POTBF2",
                                   "E01POTBF3",
                                   "E01POTBYO",
                                   "E01POTORB",
                                   "E01POTDT1",
                                   "E01POTDT2",
                                   "E01POTCHB",
                                   "E01POTCHO",
                                   "E01POTOU1",
                                   "E01POTOUA",
                                   "E01POTCVP",
                                   "E01POTOTC",
                                   "E01PODLDT",
                                   "E01POSLPN",
                                   "E01POSLPA",
                                   "E01LSTREF",
                                   "E01POTAM1",
                                   "E01POTAM2",
                                   "E01POTDCY",
                                   "E01POTDGL",
                                   "E01POTDAC",
                                   "E01POTDSB",
                                   "E01POTDCS",
                                   "E01DEBDSC",
                                   "E01POTCCY",
                                   "E01POTCGL",
                                   "E01POTCAC",
                                   "E01POTCSB",
                                   "E01POTCCS",
                                   "E01CREDSC",
                                   "E01POTFRQ",
                                   "E01POTPMD",
                                   "E01POTDYS",
                                   "E01POTNPM",
                                   "E01POTODA",
                                   "E01POTSPM",
                                   "E01POTDBR",
                                   "E01POTCBR",
                                   "E01POTPMT",
                                   "E01POTDAS"
                                 };
  final static String fid = "1130611112901";
  final static String rid = "487CAF9C864DF";
  final static String fmtname = "EDD067401";
  final int FIELDCOUNT = 62;
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
  private CharacterField fieldE01CNTNME = null;
  private CharacterField fieldE01POTORD = null;
  private CharacterField fieldE01POTLOG = null;
  private DecimalField fieldE01POTCNU = null;
  private CharacterField fieldE01POTCSN = null;
  private CharacterField fieldE01POTTO1 = null;
  private CharacterField fieldE01POTVIA = null;
  private CharacterField fieldE01POTTO2 = null;
  private CharacterField fieldE01POTNRO = null;
  private CharacterField fieldE01POTBB1 = null;
  private CharacterField fieldE01POTBB2 = null;
  private CharacterField fieldE01POTBB3 = null;
  private CharacterField fieldE01POTBF1 = null;
  private CharacterField fieldE01POTBF2 = null;
  private CharacterField fieldE01POTBF3 = null;
  private CharacterField fieldE01POTBYO = null;
  private CharacterField fieldE01POTORB = null;
  private CharacterField fieldE01POTDT1 = null;
  private CharacterField fieldE01POTDT2 = null;
  private CharacterField fieldE01POTCHB = null;
  private CharacterField fieldE01POTCHO = null;
  private CharacterField fieldE01POTOU1 = null;
  private CharacterField fieldE01POTOUA = null;
  private CharacterField fieldE01POTCVP = null;
  private CharacterField fieldE01POTOTC = null;
  private CharacterField fieldE01PODLDT = null;
  private DecimalField fieldE01POSLPN = null;
  private DecimalField fieldE01POSLPA = null;
  private CharacterField fieldE01LSTREF = null;
  private CharacterField fieldE01POTAM1 = null;
  private CharacterField fieldE01POTAM2 = null;
  private CharacterField fieldE01POTDCY = null;
  private DecimalField fieldE01POTDGL = null;
  private DecimalField fieldE01POTDAC = null;
  private DecimalField fieldE01POTDSB = null;
  private DecimalField fieldE01POTDCS = null;
  private CharacterField fieldE01DEBDSC = null;
  private CharacterField fieldE01POTCCY = null;
  private DecimalField fieldE01POTCGL = null;
  private DecimalField fieldE01POTCAC = null;
  private DecimalField fieldE01POTCSB = null;
  private DecimalField fieldE01POTCCS = null;
  private CharacterField fieldE01CREDSC = null;
  private CharacterField fieldE01POTFRQ = null;
  private CharacterField fieldE01POTPMD = null;
  private CharacterField fieldE01POTDYS = null;
  private CharacterField fieldE01POTNPM = null;
  private CharacterField fieldE01POTODA = null;
  private CharacterField fieldE01POTSPM = null;
  private DecimalField fieldE01POTDBR = null;
  private DecimalField fieldE01POTCBR = null;
  private CharacterField fieldE01POTPMT = null;
  private CharacterField fieldE01POTDAS = null;

  /**
  * Constructor for EDD067401Message.
  */
  public EDD067401Message()
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
    recordsize = 1258;
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
    fields[9] = fieldE01CNTNME =
    new CharacterField(message, HEADERSIZE + 42, 60, "E01CNTNME");
    fields[10] = fieldE01POTORD =
    new CharacterField(message, HEADERSIZE + 102, 25, "E01POTORD");
    fields[11] = fieldE01POTLOG =
    new CharacterField(message, HEADERSIZE + 127, 25, "E01POTLOG");
    fields[12] = fieldE01POTCNU =
    new DecimalField(message, HEADERSIZE + 152, 10, 0, "E01POTCNU");
    fields[13] = fieldE01POTCSN =
    new CharacterField(message, HEADERSIZE + 162, 15, "E01POTCSN");
    fields[14] = fieldE01POTTO1 =
    new CharacterField(message, HEADERSIZE + 177, 25, "E01POTTO1");
    fields[15] = fieldE01POTVIA =
    new CharacterField(message, HEADERSIZE + 202, 1, "E01POTVIA");
    fields[16] = fieldE01POTTO2 =
    new CharacterField(message, HEADERSIZE + 203, 25, "E01POTTO2");
    fields[17] = fieldE01POTNRO =
    new CharacterField(message, HEADERSIZE + 228, 15, "E01POTNRO");
    fields[18] = fieldE01POTBB1 =
    new CharacterField(message, HEADERSIZE + 243, 60, "E01POTBB1");
    fields[19] = fieldE01POTBB2 =
    new CharacterField(message, HEADERSIZE + 303, 60, "E01POTBB2");
    fields[20] = fieldE01POTBB3 =
    new CharacterField(message, HEADERSIZE + 363, 60, "E01POTBB3");
    fields[21] = fieldE01POTBF1 =
    new CharacterField(message, HEADERSIZE + 423, 60, "E01POTBF1");
    fields[22] = fieldE01POTBF2 =
    new CharacterField(message, HEADERSIZE + 483, 60, "E01POTBF2");
    fields[23] = fieldE01POTBF3 =
    new CharacterField(message, HEADERSIZE + 543, 60, "E01POTBF3");
    fields[24] = fieldE01POTBYO =
    new CharacterField(message, HEADERSIZE + 603, 60, "E01POTBYO");
    fields[25] = fieldE01POTORB =
    new CharacterField(message, HEADERSIZE + 663, 60, "E01POTORB");
    fields[26] = fieldE01POTDT1 =
    new CharacterField(message, HEADERSIZE + 723, 60, "E01POTDT1");
    fields[27] = fieldE01POTDT2 =
    new CharacterField(message, HEADERSIZE + 783, 60, "E01POTDT2");
    fields[28] = fieldE01POTCHB =
    new CharacterField(message, HEADERSIZE + 843, 1, "E01POTCHB");
    fields[29] = fieldE01POTCHO =
    new CharacterField(message, HEADERSIZE + 844, 1, "E01POTCHO");
    fields[30] = fieldE01POTOU1 =
    new CharacterField(message, HEADERSIZE + 845, 13, "E01POTOU1");
    fields[31] = fieldE01POTOUA =
    new CharacterField(message, HEADERSIZE + 858, 12, "E01POTOUA");
    fields[32] = fieldE01POTCVP =
    new CharacterField(message, HEADERSIZE + 870, 35, "E01POTCVP");
    fields[33] = fieldE01POTOTC =
    new CharacterField(message, HEADERSIZE + 905, 60, "E01POTOTC");
    fields[34] = fieldE01PODLDT =
    new CharacterField(message, HEADERSIZE + 965, 6, "E01PODLDT");
    fields[35] = fieldE01POSLPN =
    new DecimalField(message, HEADERSIZE + 971, 5, 0, "E01POSLPN");
    fields[36] = fieldE01POSLPA =
    new DecimalField(message, HEADERSIZE + 976, 17, 2, "E01POSLPA");
    fields[37] = fieldE01LSTREF =
    new CharacterField(message, HEADERSIZE + 993, 10, "E01LSTREF");
    fields[38] = fieldE01POTAM1 =
    new CharacterField(message, HEADERSIZE + 1003, 11, "E01POTAM1");
    fields[39] = fieldE01POTAM2 =
    new CharacterField(message, HEADERSIZE + 1014, 2, "E01POTAM2");
    fields[40] = fieldE01POTDCY =
    new CharacterField(message, HEADERSIZE + 1016, 3, "E01POTDCY");
    fields[41] = fieldE01POTDGL =
    new DecimalField(message, HEADERSIZE + 1019, 17, 0, "E01POTDGL");
    fields[42] = fieldE01POTDAC =
    new DecimalField(message, HEADERSIZE + 1036, 13, 0, "E01POTDAC");
    fields[43] = fieldE01POTDSB =
    new DecimalField(message, HEADERSIZE + 1049, 6, 0, "E01POTDSB");
    fields[44] = fieldE01POTDCS =
    new DecimalField(message, HEADERSIZE + 1055, 9, 0, "E01POTDCS");
    fields[45] = fieldE01DEBDSC =
    new CharacterField(message, HEADERSIZE + 1064, 60, "E01DEBDSC");
    fields[46] = fieldE01POTCCY =
    new CharacterField(message, HEADERSIZE + 1124, 3, "E01POTCCY");
    fields[47] = fieldE01POTCGL =
    new DecimalField(message, HEADERSIZE + 1127, 17, 0, "E01POTCGL");
    fields[48] = fieldE01POTCAC =
    new DecimalField(message, HEADERSIZE + 1144, 13, 0, "E01POTCAC");
    fields[49] = fieldE01POTCSB =
    new DecimalField(message, HEADERSIZE + 1157, 6, 0, "E01POTCSB");
    fields[50] = fieldE01POTCCS =
    new DecimalField(message, HEADERSIZE + 1163, 9, 0, "E01POTCCS");
    fields[51] = fieldE01CREDSC =
    new CharacterField(message, HEADERSIZE + 1172, 60, "E01CREDSC");
    fields[52] = fieldE01POTFRQ =
    new CharacterField(message, HEADERSIZE + 1232, 1, "E01POTFRQ");
    fields[53] = fieldE01POTPMD =
    new CharacterField(message, HEADERSIZE + 1233, 2, "E01POTPMD");
    fields[54] = fieldE01POTDYS =
    new CharacterField(message, HEADERSIZE + 1235, 4, "E01POTDYS");
    fields[55] = fieldE01POTNPM =
    new CharacterField(message, HEADERSIZE + 1239, 4, "E01POTNPM");
    fields[56] = fieldE01POTODA =
    new CharacterField(message, HEADERSIZE + 1243, 1, "E01POTODA");
    fields[57] = fieldE01POTSPM =
    new CharacterField(message, HEADERSIZE + 1244, 1, "E01POTSPM");
    fields[58] = fieldE01POTDBR =
    new DecimalField(message, HEADERSIZE + 1245, 5, 0, "E01POTDBR");
    fields[59] = fieldE01POTCBR =
    new DecimalField(message, HEADERSIZE + 1250, 5, 0, "E01POTCBR");
    fields[60] = fieldE01POTPMT =
    new CharacterField(message, HEADERSIZE + 1255, 1, "E01POTPMT");
    fields[61] = fieldE01POTDAS =
    new CharacterField(message, HEADERSIZE + 1256, 2, "E01POTDAS");

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
  * Set field E01CNTNME using a String value.
  */
  public void setE01CNTNME(String newvalue)
  {
    fieldE01CNTNME.setString(newvalue);
  }

  /**
  * Get value of field E01CNTNME as a String.
  */
  public String getE01CNTNME()
  {
    return fieldE01CNTNME.getString();
  }

  /**
  * Set field E01POTORD using a String value.
  */
  public void setE01POTORD(String newvalue)
  {
    fieldE01POTORD.setString(newvalue);
  }

  /**
  * Get value of field E01POTORD as a String.
  */
  public String getE01POTORD()
  {
    return fieldE01POTORD.getString();
  }

  /**
  * Set field E01POTLOG using a String value.
  */
  public void setE01POTLOG(String newvalue)
  {
    fieldE01POTLOG.setString(newvalue);
  }

  /**
  * Get value of field E01POTLOG as a String.
  */
  public String getE01POTLOG()
  {
    return fieldE01POTLOG.getString();
  }

  /**
  * Set field E01POTCNU using a String value.
  */
  public void setE01POTCNU(String newvalue)
  {
    fieldE01POTCNU.setString(newvalue);
  }

  /**
  * Get value of field E01POTCNU as a String.
  */
  public String getE01POTCNU()
  {
    return fieldE01POTCNU.getString();
  }

  /**
  * Set numeric field E01POTCNU using a BigDecimal value.
  */
  public void setE01POTCNU(BigDecimal newvalue)
  {
    fieldE01POTCNU.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01POTCNU as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01POTCNU()
  {
    return fieldE01POTCNU.getBigDecimal();
  }

  /**
  * Set field E01POTCSN using a String value.
  */
  public void setE01POTCSN(String newvalue)
  {
    fieldE01POTCSN.setString(newvalue);
  }

  /**
  * Get value of field E01POTCSN as a String.
  */
  public String getE01POTCSN()
  {
    return fieldE01POTCSN.getString();
  }

  /**
  * Set field E01POTTO1 using a String value.
  */
  public void setE01POTTO1(String newvalue)
  {
    fieldE01POTTO1.setString(newvalue);
  }

  /**
  * Get value of field E01POTTO1 as a String.
  */
  public String getE01POTTO1()
  {
    return fieldE01POTTO1.getString();
  }

  /**
  * Set field E01POTVIA using a String value.
  */
  public void setE01POTVIA(String newvalue)
  {
    fieldE01POTVIA.setString(newvalue);
  }

  /**
  * Get value of field E01POTVIA as a String.
  */
  public String getE01POTVIA()
  {
    return fieldE01POTVIA.getString();
  }

  /**
  * Set field E01POTTO2 using a String value.
  */
  public void setE01POTTO2(String newvalue)
  {
    fieldE01POTTO2.setString(newvalue);
  }

  /**
  * Get value of field E01POTTO2 as a String.
  */
  public String getE01POTTO2()
  {
    return fieldE01POTTO2.getString();
  }

  /**
  * Set field E01POTNRO using a String value.
  */
  public void setE01POTNRO(String newvalue)
  {
    fieldE01POTNRO.setString(newvalue);
  }

  /**
  * Get value of field E01POTNRO as a String.
  */
  public String getE01POTNRO()
  {
    return fieldE01POTNRO.getString();
  }

  /**
  * Set field E01POTBB1 using a String value.
  */
  public void setE01POTBB1(String newvalue)
  {
    fieldE01POTBB1.setString(newvalue);
  }

  /**
  * Get value of field E01POTBB1 as a String.
  */
  public String getE01POTBB1()
  {
    return fieldE01POTBB1.getString();
  }

  /**
  * Set field E01POTBB2 using a String value.
  */
  public void setE01POTBB2(String newvalue)
  {
    fieldE01POTBB2.setString(newvalue);
  }

  /**
  * Get value of field E01POTBB2 as a String.
  */
  public String getE01POTBB2()
  {
    return fieldE01POTBB2.getString();
  }

  /**
  * Set field E01POTBB3 using a String value.
  */
  public void setE01POTBB3(String newvalue)
  {
    fieldE01POTBB3.setString(newvalue);
  }

  /**
  * Get value of field E01POTBB3 as a String.
  */
  public String getE01POTBB3()
  {
    return fieldE01POTBB3.getString();
  }

  /**
  * Set field E01POTBF1 using a String value.
  */
  public void setE01POTBF1(String newvalue)
  {
    fieldE01POTBF1.setString(newvalue);
  }

  /**
  * Get value of field E01POTBF1 as a String.
  */
  public String getE01POTBF1()
  {
    return fieldE01POTBF1.getString();
  }

  /**
  * Set field E01POTBF2 using a String value.
  */
  public void setE01POTBF2(String newvalue)
  {
    fieldE01POTBF2.setString(newvalue);
  }

  /**
  * Get value of field E01POTBF2 as a String.
  */
  public String getE01POTBF2()
  {
    return fieldE01POTBF2.getString();
  }

  /**
  * Set field E01POTBF3 using a String value.
  */
  public void setE01POTBF3(String newvalue)
  {
    fieldE01POTBF3.setString(newvalue);
  }

  /**
  * Get value of field E01POTBF3 as a String.
  */
  public String getE01POTBF3()
  {
    return fieldE01POTBF3.getString();
  }

  /**
  * Set field E01POTBYO using a String value.
  */
  public void setE01POTBYO(String newvalue)
  {
    fieldE01POTBYO.setString(newvalue);
  }

  /**
  * Get value of field E01POTBYO as a String.
  */
  public String getE01POTBYO()
  {
    return fieldE01POTBYO.getString();
  }

  /**
  * Set field E01POTORB using a String value.
  */
  public void setE01POTORB(String newvalue)
  {
    fieldE01POTORB.setString(newvalue);
  }

  /**
  * Get value of field E01POTORB as a String.
  */
  public String getE01POTORB()
  {
    return fieldE01POTORB.getString();
  }

  /**
  * Set field E01POTDT1 using a String value.
  */
  public void setE01POTDT1(String newvalue)
  {
    fieldE01POTDT1.setString(newvalue);
  }

  /**
  * Get value of field E01POTDT1 as a String.
  */
  public String getE01POTDT1()
  {
    return fieldE01POTDT1.getString();
  }

  /**
  * Set field E01POTDT2 using a String value.
  */
  public void setE01POTDT2(String newvalue)
  {
    fieldE01POTDT2.setString(newvalue);
  }

  /**
  * Get value of field E01POTDT2 as a String.
  */
  public String getE01POTDT2()
  {
    return fieldE01POTDT2.getString();
  }

  /**
  * Set field E01POTCHB using a String value.
  */
  public void setE01POTCHB(String newvalue)
  {
    fieldE01POTCHB.setString(newvalue);
  }

  /**
  * Get value of field E01POTCHB as a String.
  */
  public String getE01POTCHB()
  {
    return fieldE01POTCHB.getString();
  }

  /**
  * Set field E01POTCHO using a String value.
  */
  public void setE01POTCHO(String newvalue)
  {
    fieldE01POTCHO.setString(newvalue);
  }

  /**
  * Get value of field E01POTCHO as a String.
  */
  public String getE01POTCHO()
  {
    return fieldE01POTCHO.getString();
  }

  /**
  * Set field E01POTOU1 using a String value.
  */
  public void setE01POTOU1(String newvalue)
  {
    fieldE01POTOU1.setString(newvalue);
  }

  /**
  * Get value of field E01POTOU1 as a String.
  */
  public String getE01POTOU1()
  {
    return fieldE01POTOU1.getString();
  }

  /**
  * Set field E01POTOUA using a String value.
  */
  public void setE01POTOUA(String newvalue)
  {
    fieldE01POTOUA.setString(newvalue);
  }

  /**
  * Get value of field E01POTOUA as a String.
  */
  public String getE01POTOUA()
  {
    return fieldE01POTOUA.getString();
  }

  /**
  * Set field E01POTCVP using a String value.
  */
  public void setE01POTCVP(String newvalue)
  {
    fieldE01POTCVP.setString(newvalue);
  }

  /**
  * Get value of field E01POTCVP as a String.
  */
  public String getE01POTCVP()
  {
    return fieldE01POTCVP.getString();
  }

  /**
  * Set field E01POTOTC using a String value.
  */
  public void setE01POTOTC(String newvalue)
  {
    fieldE01POTOTC.setString(newvalue);
  }

  /**
  * Get value of field E01POTOTC as a String.
  */
  public String getE01POTOTC()
  {
    return fieldE01POTOTC.getString();
  }

  /**
  * Set field E01PODLDT using a String value.
  */
  public void setE01PODLDT(String newvalue)
  {
    fieldE01PODLDT.setString(newvalue);
  }

  /**
  * Get value of field E01PODLDT as a String.
  */
  public String getE01PODLDT()
  {
    return fieldE01PODLDT.getString();
  }

  /**
  * Set field E01POSLPN using a String value.
  */
  public void setE01POSLPN(String newvalue)
  {
    fieldE01POSLPN.setString(newvalue);
  }

  /**
  * Get value of field E01POSLPN as a String.
  */
  public String getE01POSLPN()
  {
    return fieldE01POSLPN.getString();
  }

  /**
  * Set numeric field E01POSLPN using a BigDecimal value.
  */
  public void setE01POSLPN(BigDecimal newvalue)
  {
    fieldE01POSLPN.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01POSLPN as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01POSLPN()
  {
    return fieldE01POSLPN.getBigDecimal();
  }

  /**
  * Set field E01POSLPA using a String value.
  */
  public void setE01POSLPA(String newvalue)
  {
    fieldE01POSLPA.setString(newvalue);
  }

  /**
  * Get value of field E01POSLPA as a String.
  */
  public String getE01POSLPA()
  {
    return fieldE01POSLPA.getString();
  }

  /**
  * Set numeric field E01POSLPA using a BigDecimal value.
  */
  public void setE01POSLPA(BigDecimal newvalue)
  {
    fieldE01POSLPA.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01POSLPA as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01POSLPA()
  {
    return fieldE01POSLPA.getBigDecimal();
  }

  /**
  * Set field E01LSTREF using a String value.
  */
  public void setE01LSTREF(String newvalue)
  {
    fieldE01LSTREF.setString(newvalue);
  }

  /**
  * Get value of field E01LSTREF as a String.
  */
  public String getE01LSTREF()
  {
    return fieldE01LSTREF.getString();
  }

  /**
  * Set field E01POTAM1 using a String value.
  */
  public void setE01POTAM1(String newvalue)
  {
    fieldE01POTAM1.setString(newvalue);
  }

  /**
  * Get value of field E01POTAM1 as a String.
  */
  public String getE01POTAM1()
  {
    return fieldE01POTAM1.getString();
  }

  /**
  * Set field E01POTAM2 using a String value.
  */
  public void setE01POTAM2(String newvalue)
  {
    fieldE01POTAM2.setString(newvalue);
  }

  /**
  * Get value of field E01POTAM2 as a String.
  */
  public String getE01POTAM2()
  {
    return fieldE01POTAM2.getString();
  }

  /**
  * Set field E01POTDCY using a String value.
  */
  public void setE01POTDCY(String newvalue)
  {
    fieldE01POTDCY.setString(newvalue);
  }

  /**
  * Get value of field E01POTDCY as a String.
  */
  public String getE01POTDCY()
  {
    return fieldE01POTDCY.getString();
  }

  /**
  * Set field E01POTDGL using a String value.
  */
  public void setE01POTDGL(String newvalue)
  {
    fieldE01POTDGL.setString(newvalue);
  }

  /**
  * Get value of field E01POTDGL as a String.
  */
  public String getE01POTDGL()
  {
    return fieldE01POTDGL.getString();
  }

  /**
  * Set numeric field E01POTDGL using a BigDecimal value.
  */
  public void setE01POTDGL(BigDecimal newvalue)
  {
    fieldE01POTDGL.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01POTDGL as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01POTDGL()
  {
    return fieldE01POTDGL.getBigDecimal();
  }

  /**
  * Set field E01POTDAC using a String value.
  */
  public void setE01POTDAC(String newvalue)
  {
    fieldE01POTDAC.setString(newvalue);
  }

  /**
  * Get value of field E01POTDAC as a String.
  */
  public String getE01POTDAC()
  {
    return fieldE01POTDAC.getString();
  }

  /**
  * Set numeric field E01POTDAC using a BigDecimal value.
  */
  public void setE01POTDAC(BigDecimal newvalue)
  {
    fieldE01POTDAC.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01POTDAC as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01POTDAC()
  {
    return fieldE01POTDAC.getBigDecimal();
  }

  /**
  * Set field E01POTDSB using a String value.
  */
  public void setE01POTDSB(String newvalue)
  {
    fieldE01POTDSB.setString(newvalue);
  }

  /**
  * Get value of field E01POTDSB as a String.
  */
  public String getE01POTDSB()
  {
    return fieldE01POTDSB.getString();
  }

  /**
  * Set numeric field E01POTDSB using a BigDecimal value.
  */
  public void setE01POTDSB(BigDecimal newvalue)
  {
    fieldE01POTDSB.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01POTDSB as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01POTDSB()
  {
    return fieldE01POTDSB.getBigDecimal();
  }

  /**
  * Set field E01POTDCS using a String value.
  */
  public void setE01POTDCS(String newvalue)
  {
    fieldE01POTDCS.setString(newvalue);
  }

  /**
  * Get value of field E01POTDCS as a String.
  */
  public String getE01POTDCS()
  {
    return fieldE01POTDCS.getString();
  }

  /**
  * Set numeric field E01POTDCS using a BigDecimal value.
  */
  public void setE01POTDCS(BigDecimal newvalue)
  {
    fieldE01POTDCS.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01POTDCS as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01POTDCS()
  {
    return fieldE01POTDCS.getBigDecimal();
  }

  /**
  * Set field E01DEBDSC using a String value.
  */
  public void setE01DEBDSC(String newvalue)
  {
    fieldE01DEBDSC.setString(newvalue);
  }

  /**
  * Get value of field E01DEBDSC as a String.
  */
  public String getE01DEBDSC()
  {
    return fieldE01DEBDSC.getString();
  }

  /**
  * Set field E01POTCCY using a String value.
  */
  public void setE01POTCCY(String newvalue)
  {
    fieldE01POTCCY.setString(newvalue);
  }

  /**
  * Get value of field E01POTCCY as a String.
  */
  public String getE01POTCCY()
  {
    return fieldE01POTCCY.getString();
  }

  /**
  * Set field E01POTCGL using a String value.
  */
  public void setE01POTCGL(String newvalue)
  {
    fieldE01POTCGL.setString(newvalue);
  }

  /**
  * Get value of field E01POTCGL as a String.
  */
  public String getE01POTCGL()
  {
    return fieldE01POTCGL.getString();
  }

  /**
  * Set numeric field E01POTCGL using a BigDecimal value.
  */
  public void setE01POTCGL(BigDecimal newvalue)
  {
    fieldE01POTCGL.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01POTCGL as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01POTCGL()
  {
    return fieldE01POTCGL.getBigDecimal();
  }

  /**
  * Set field E01POTCAC using a String value.
  */
  public void setE01POTCAC(String newvalue)
  {
    fieldE01POTCAC.setString(newvalue);
  }

  /**
  * Get value of field E01POTCAC as a String.
  */
  public String getE01POTCAC()
  {
    return fieldE01POTCAC.getString();
  }

  /**
  * Set numeric field E01POTCAC using a BigDecimal value.
  */
  public void setE01POTCAC(BigDecimal newvalue)
  {
    fieldE01POTCAC.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01POTCAC as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01POTCAC()
  {
    return fieldE01POTCAC.getBigDecimal();
  }

  /**
  * Set field E01POTCSB using a String value.
  */
  public void setE01POTCSB(String newvalue)
  {
    fieldE01POTCSB.setString(newvalue);
  }

  /**
  * Get value of field E01POTCSB as a String.
  */
  public String getE01POTCSB()
  {
    return fieldE01POTCSB.getString();
  }

  /**
  * Set numeric field E01POTCSB using a BigDecimal value.
  */
  public void setE01POTCSB(BigDecimal newvalue)
  {
    fieldE01POTCSB.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01POTCSB as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01POTCSB()
  {
    return fieldE01POTCSB.getBigDecimal();
  }

  /**
  * Set field E01POTCCS using a String value.
  */
  public void setE01POTCCS(String newvalue)
  {
    fieldE01POTCCS.setString(newvalue);
  }

  /**
  * Get value of field E01POTCCS as a String.
  */
  public String getE01POTCCS()
  {
    return fieldE01POTCCS.getString();
  }

  /**
  * Set numeric field E01POTCCS using a BigDecimal value.
  */
  public void setE01POTCCS(BigDecimal newvalue)
  {
    fieldE01POTCCS.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01POTCCS as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01POTCCS()
  {
    return fieldE01POTCCS.getBigDecimal();
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

  /**
  * Set field E01POTFRQ using a String value.
  */
  public void setE01POTFRQ(String newvalue)
  {
    fieldE01POTFRQ.setString(newvalue);
  }

  /**
  * Get value of field E01POTFRQ as a String.
  */
  public String getE01POTFRQ()
  {
    return fieldE01POTFRQ.getString();
  }

  /**
  * Set field E01POTPMD using a String value.
  */
  public void setE01POTPMD(String newvalue)
  {
    fieldE01POTPMD.setString(newvalue);
  }

  /**
  * Get value of field E01POTPMD as a String.
  */
  public String getE01POTPMD()
  {
    return fieldE01POTPMD.getString();
  }

  /**
  * Set field E01POTDYS using a String value.
  */
  public void setE01POTDYS(String newvalue)
  {
    fieldE01POTDYS.setString(newvalue);
  }

  /**
  * Get value of field E01POTDYS as a String.
  */
  public String getE01POTDYS()
  {
    return fieldE01POTDYS.getString();
  }

  /**
  * Set field E01POTNPM using a String value.
  */
  public void setE01POTNPM(String newvalue)
  {
    fieldE01POTNPM.setString(newvalue);
  }

  /**
  * Get value of field E01POTNPM as a String.
  */
  public String getE01POTNPM()
  {
    return fieldE01POTNPM.getString();
  }

  /**
  * Set field E01POTODA using a String value.
  */
  public void setE01POTODA(String newvalue)
  {
    fieldE01POTODA.setString(newvalue);
  }

  /**
  * Get value of field E01POTODA as a String.
  */
  public String getE01POTODA()
  {
    return fieldE01POTODA.getString();
  }

  /**
  * Set field E01POTSPM using a String value.
  */
  public void setE01POTSPM(String newvalue)
  {
    fieldE01POTSPM.setString(newvalue);
  }

  /**
  * Get value of field E01POTSPM as a String.
  */
  public String getE01POTSPM()
  {
    return fieldE01POTSPM.getString();
  }

  /**
  * Set field E01POTDBR using a String value.
  */
  public void setE01POTDBR(String newvalue)
  {
    fieldE01POTDBR.setString(newvalue);
  }

  /**
  * Get value of field E01POTDBR as a String.
  */
  public String getE01POTDBR()
  {
    return fieldE01POTDBR.getString();
  }

  /**
  * Set numeric field E01POTDBR using a BigDecimal value.
  */
  public void setE01POTDBR(BigDecimal newvalue)
  {
    fieldE01POTDBR.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01POTDBR as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01POTDBR()
  {
    return fieldE01POTDBR.getBigDecimal();
  }

  /**
  * Set field E01POTCBR using a String value.
  */
  public void setE01POTCBR(String newvalue)
  {
    fieldE01POTCBR.setString(newvalue);
  }

  /**
  * Get value of field E01POTCBR as a String.
  */
  public String getE01POTCBR()
  {
    return fieldE01POTCBR.getString();
  }

  /**
  * Set numeric field E01POTCBR using a BigDecimal value.
  */
  public void setE01POTCBR(BigDecimal newvalue)
  {
    fieldE01POTCBR.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01POTCBR as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01POTCBR()
  {
    return fieldE01POTCBR.getBigDecimal();
  }

  /**
  * Set field E01POTPMT using a String value.
  */
  public void setE01POTPMT(String newvalue)
  {
    fieldE01POTPMT.setString(newvalue);
  }

  /**
  * Get value of field E01POTPMT as a String.
  */
  public String getE01POTPMT()
  {
    return fieldE01POTPMT.getString();
  }

  /**
  * Set field E01POTDAS using a String value.
  */
  public void setE01POTDAS(String newvalue)
  {
    fieldE01POTDAS.setString(newvalue);
  }

  /**
  * Get value of field E01POTDAS as a String.
  */
  public String getE01POTDAS()
  {
    return fieldE01POTDAS.getString();
  }

}
