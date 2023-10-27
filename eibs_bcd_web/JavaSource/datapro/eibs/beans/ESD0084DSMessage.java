package datapro.eibs.beans;

import datapro.eibs.sockets.*;
import java.io.*;
import java.math.*;

import java.util.*;

/**
* Class generated by AS/400 CRTCLASS command from ESD0084DS physical file definition.
* 
* File level identifier is 1170223184556.
* Record format level identifier is 45DD3A0631CF2.
*/

public class ESD0084DSMessage extends MessageRecord
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
                                     "E01CUMCUN",
                                     "E01CUMRTP",
                                     "E01CUSNA1",
                                     "E01CUMMAN",
                                     "E01CUMMA1",
                                     "E01CUMMA2",
                                     "E01CUMMA3",
                                     "E01CUMMA4",
                                     "E01CUMCTY",
                                     "E01CUMSTE",
                                     "E01CUMZPC",
                                     "E01CUMPOB",
                                     "E01CUMCTR",
                                     "E01CUMMLC",
                                     "E01CUMHPN",
                                     "E01CUMBNC",
                                     "E01CUMBNI",
                                     "E01CUMINC",
                                     "E01CUMBSX",
                                     "E01CUMBMS",
                                     "E01CUMNST",
                                     "E01CUMRCN",
                                     "E01CUMTID",
                                     "E01CUMPID",
                                     "E01CUMAM1",
                                     "E01CUMAM2",
                                     "E01CUMDTM",
                                     "E01CUMDTD",
                                     "E01CUMDTY",
                                     "E01CUMRTY",
                                     "E01CUMFL1",
                                     "E01CUMFL2",
                                     "E01CUMFL3",
                                     "D01CUMSTE",
                                     "D01CUMMLC",
                                     "D01CUMBNC",
                                     "D01CUMINC",
                                     "D01CUMTID",
                                     "D01CUMPID",
                                     "E01CUMNME",
                                     "E01CUMD21",
                                     "E01CUMD22",
                                     "E01CUMD23",
                                     "D01CUMUC2",
                                     "E01CUMUC2",
                                     "E01TID",
                                     "E01CUN",
                                     "E01PT1",
                                     "E01PT2",
                                     "E01PT3",
                                     "E01PT4",
                                     "E01PT5",
                                     "E01PT6"
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
                                   "E01CUMCUN",
                                   "E01CUMRTP",
                                   "E01CUSNA1",
                                   "E01CUMMAN",
                                   "E01CUMMA1",
                                   "E01CUMMA2",
                                   "E01CUMMA3",
                                   "E01CUMMA4",
                                   "E01CUMCTY",
                                   "E01CUMSTE",
                                   "E01CUMZPC",
                                   "E01CUMPOB",
                                   "E01CUMCTR",
                                   "E01CUMMLC",
                                   "E01CUMHPN",
                                   "E01CUMBNC",
                                   "E01CUMBNI",
                                   "E01CUMINC",
                                   "E01CUMBSX",
                                   "E01CUMBMS",
                                   "E01CUMNST",
                                   "E01CUMRCN",
                                   "E01CUMTID",
                                   "E01CUMPID",
                                   "E01CUMAM1",
                                   "E01CUMAM2",
                                   "E01CUMDTM",
                                   "E01CUMDTD",
                                   "E01CUMDTY",
                                   "E01CUMRTY",
                                   "E01CUMFL1",
                                   "E01CUMFL2",
                                   "E01CUMFL3",
                                   "D01CUMSTE",
                                   "D01CUMMLC",
                                   "D01CUMBNC",
                                   "D01CUMINC",
                                   "D01CUMTID",
                                   "D01CUMPID",
                                   "E01CUMNME",
                                   "E01CUMD21",
                                   "E01CUMD22",
                                   "E01CUMD23",
                                   "D01CUMUC2",
                                   "E01CUMUC2",
                                   "E01TID",
                                   "E01CUN",
                                   "E01PT1",
                                   "E01PT2",
                                   "E01PT3",
                                   "E01PT4",
                                   "E01PT5",
                                   "E01PT6"
                                 };
  final static String fid = "1170223184556";
  final static String rid = "45DD3A0631CF2";
  final static String fmtname = "ESD0084DS";
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
  private DecimalField fieldE01CUMCUN = null;
  private CharacterField fieldE01CUMRTP = null;
  private CharacterField fieldE01CUSNA1 = null;
  private DecimalField fieldE01CUMMAN = null;
  private CharacterField fieldE01CUMMA1 = null;
  private CharacterField fieldE01CUMMA2 = null;
  private CharacterField fieldE01CUMMA3 = null;
  private CharacterField fieldE01CUMMA4 = null;
  private CharacterField fieldE01CUMCTY = null;
  private CharacterField fieldE01CUMSTE = null;
  private CharacterField fieldE01CUMZPC = null;
  private CharacterField fieldE01CUMPOB = null;
  private CharacterField fieldE01CUMCTR = null;
  private CharacterField fieldE01CUMMLC = null;
  private DecimalField fieldE01CUMHPN = null;
  private CharacterField fieldE01CUMBNC = null;
  private CharacterField fieldE01CUMBNI = null;
  private CharacterField fieldE01CUMINC = null;
  private CharacterField fieldE01CUMBSX = null;
  private CharacterField fieldE01CUMBMS = null;
  private DecimalField fieldE01CUMNST = null;
  private DecimalField fieldE01CUMRCN = null;
  private CharacterField fieldE01CUMTID = null;
  private CharacterField fieldE01CUMPID = null;
  private DecimalField fieldE01CUMAM1 = null;
  private DecimalField fieldE01CUMAM2 = null;
  private DecimalField fieldE01CUMDTM = null;
  private DecimalField fieldE01CUMDTD = null;
  private DecimalField fieldE01CUMDTY = null;
  private CharacterField fieldE01CUMRTY = null;
  private CharacterField fieldE01CUMFL1 = null;
  private CharacterField fieldE01CUMFL2 = null;
  private CharacterField fieldE01CUMFL3 = null;
  private CharacterField fieldD01CUMSTE = null;
  private CharacterField fieldD01CUMMLC = null;
  private CharacterField fieldD01CUMBNC = null;
  private CharacterField fieldD01CUMINC = null;
  private CharacterField fieldD01CUMTID = null;
  private CharacterField fieldD01CUMPID = null;
  private CharacterField fieldE01CUMNME = null;
  private DecimalField fieldE01CUMD21 = null;
  private DecimalField fieldE01CUMD22 = null;
  private DecimalField fieldE01CUMD23 = null;
  private CharacterField fieldD01CUMUC2 = null;
  private CharacterField fieldE01CUMUC2 = null;
  private CharacterField fieldE01TID = null;
  private DecimalField fieldE01CUN = null;
  private CharacterField fieldE01PT1 = null;
  private CharacterField fieldE01PT2 = null;
  private CharacterField fieldE01PT3 = null;
  private CharacterField fieldE01PT4 = null;
  private CharacterField fieldE01PT5 = null;
  private CharacterField fieldE01PT6 = null;

  /**
  * Constructor for ESD0084DSMessage.
  */
  public ESD0084DSMessage()
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
    recordsize = 986;
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
    fields[9] = fieldE01CUMCUN =
    new DecimalField(message, HEADERSIZE + 42, 13, 0, "E01CUMCUN");
    fields[10] = fieldE01CUMRTP =
    new CharacterField(message, HEADERSIZE + 55, 1, "E01CUMRTP");
    fields[11] = fieldE01CUSNA1 =
    new CharacterField(message, HEADERSIZE + 56, 60, "E01CUSNA1");
    fields[12] = fieldE01CUMMAN =
    new DecimalField(message, HEADERSIZE + 116, 3, 0, "E01CUMMAN");
    fields[13] = fieldE01CUMMA1 =
    new CharacterField(message, HEADERSIZE + 119, 60, "E01CUMMA1");
    fields[14] = fieldE01CUMMA2 =
    new CharacterField(message, HEADERSIZE + 179, 45, "E01CUMMA2");
    fields[15] = fieldE01CUMMA3 =
    new CharacterField(message, HEADERSIZE + 224, 45, "E01CUMMA3");
    fields[16] = fieldE01CUMMA4 =
    new CharacterField(message, HEADERSIZE + 269, 45, "E01CUMMA4");
    fields[17] = fieldE01CUMCTY =
    new CharacterField(message, HEADERSIZE + 314, 35, "E01CUMCTY");
    fields[18] = fieldE01CUMSTE =
    new CharacterField(message, HEADERSIZE + 349, 4, "E01CUMSTE");
    fields[19] = fieldE01CUMZPC =
    new CharacterField(message, HEADERSIZE + 353, 15, "E01CUMZPC");
    fields[20] = fieldE01CUMPOB =
    new CharacterField(message, HEADERSIZE + 368, 10, "E01CUMPOB");
    fields[21] = fieldE01CUMCTR =
    new CharacterField(message, HEADERSIZE + 378, 35, "E01CUMCTR");
    fields[22] = fieldE01CUMMLC =
    new CharacterField(message, HEADERSIZE + 413, 4, "E01CUMMLC");
    fields[23] = fieldE01CUMHPN =
    new DecimalField(message, HEADERSIZE + 417, 16, 0, "E01CUMHPN");
    fields[24] = fieldE01CUMBNC =
    new CharacterField(message, HEADERSIZE + 433, 4, "E01CUMBNC");
    fields[25] = fieldE01CUMBNI =
    new CharacterField(message, HEADERSIZE + 437, 25, "E01CUMBNI");
    fields[26] = fieldE01CUMINC =
    new CharacterField(message, HEADERSIZE + 462, 4, "E01CUMINC");
    fields[27] = fieldE01CUMBSX =
    new CharacterField(message, HEADERSIZE + 466, 1, "E01CUMBSX");
    fields[28] = fieldE01CUMBMS =
    new CharacterField(message, HEADERSIZE + 467, 1, "E01CUMBMS");
    fields[29] = fieldE01CUMNST =
    new DecimalField(message, HEADERSIZE + 468, 10, 0, "E01CUMNST");
    fields[30] = fieldE01CUMRCN =
    new DecimalField(message, HEADERSIZE + 478, 10, 0, "E01CUMRCN");
    fields[31] = fieldE01CUMTID =
    new CharacterField(message, HEADERSIZE + 488, 4, "E01CUMTID");
    fields[32] = fieldE01CUMPID =
    new CharacterField(message, HEADERSIZE + 492, 4, "E01CUMPID");
    fields[33] = fieldE01CUMAM1 =
    new DecimalField(message, HEADERSIZE + 496, 17, 2, "E01CUMAM1");
    fields[34] = fieldE01CUMAM2 =
    new DecimalField(message, HEADERSIZE + 513, 17, 2, "E01CUMAM2");
    fields[35] = fieldE01CUMDTM =
    new DecimalField(message, HEADERSIZE + 530, 3, 0, "E01CUMDTM");
    fields[36] = fieldE01CUMDTD =
    new DecimalField(message, HEADERSIZE + 533, 3, 0, "E01CUMDTD");
    fields[37] = fieldE01CUMDTY =
    new DecimalField(message, HEADERSIZE + 536, 5, 0, "E01CUMDTY");
    fields[38] = fieldE01CUMRTY =
    new CharacterField(message, HEADERSIZE + 541, 1, "E01CUMRTY");
    fields[39] = fieldE01CUMFL1 =
    new CharacterField(message, HEADERSIZE + 542, 1, "E01CUMFL1");
    fields[40] = fieldE01CUMFL2 =
    new CharacterField(message, HEADERSIZE + 543, 1, "E01CUMFL2");
    fields[41] = fieldE01CUMFL3 =
    new CharacterField(message, HEADERSIZE + 544, 1, "E01CUMFL3");
    fields[42] = fieldD01CUMSTE =
    new CharacterField(message, HEADERSIZE + 545, 45, "D01CUMSTE");
    fields[43] = fieldD01CUMMLC =
    new CharacterField(message, HEADERSIZE + 590, 45, "D01CUMMLC");
    fields[44] = fieldD01CUMBNC =
    new CharacterField(message, HEADERSIZE + 635, 45, "D01CUMBNC");
    fields[45] = fieldD01CUMINC =
    new CharacterField(message, HEADERSIZE + 680, 45, "D01CUMINC");
    fields[46] = fieldD01CUMTID =
    new CharacterField(message, HEADERSIZE + 725, 45, "D01CUMTID");
    fields[47] = fieldD01CUMPID =
    new CharacterField(message, HEADERSIZE + 770, 45, "D01CUMPID");
    fields[48] = fieldE01CUMNME =
    new CharacterField(message, HEADERSIZE + 815, 45, "E01CUMNME");
    fields[49] = fieldE01CUMD21 =
    new DecimalField(message, HEADERSIZE + 860, 3, 0, "E01CUMD21");
    fields[50] = fieldE01CUMD22 =
    new DecimalField(message, HEADERSIZE + 863, 3, 0, "E01CUMD22");
    fields[51] = fieldE01CUMD23 =
    new DecimalField(message, HEADERSIZE + 866, 5, 0, "E01CUMD23");
    fields[52] = fieldD01CUMUC2 =
    new CharacterField(message, HEADERSIZE + 871, 45, "D01CUMUC2");
    fields[53] = fieldE01CUMUC2 =
    new CharacterField(message, HEADERSIZE + 916, 4, "E01CUMUC2");
    fields[54] = fieldE01TID =
    new CharacterField(message, HEADERSIZE + 920, 4, "E01TID");
    fields[55] = fieldE01CUN =
    new DecimalField(message, HEADERSIZE + 924, 10, 0, "E01CUN");
    fields[56] = fieldE01PT1 =
    new CharacterField(message, HEADERSIZE + 934, 25, "E01PT1");
    fields[57] = fieldE01PT2 =
    new CharacterField(message, HEADERSIZE + 959, 7, "E01PT2");
    fields[58] = fieldE01PT3 =
    new CharacterField(message, HEADERSIZE + 966, 7, "E01PT3");
    fields[59] = fieldE01PT4 =
    new CharacterField(message, HEADERSIZE + 973, 7, "E01PT4");
    fields[60] = fieldE01PT5 =
    new CharacterField(message, HEADERSIZE + 980, 4, "E01PT5");
    fields[61] = fieldE01PT6 =
    new CharacterField(message, HEADERSIZE + 984, 2, "E01PT6");

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
  * Set field E01CUMCUN using a String value.
  */
  public void setE01CUMCUN(String newvalue)
  {
    fieldE01CUMCUN.setString(newvalue);
  }

  /**
  * Get value of field E01CUMCUN as a String.
  */
  public String getE01CUMCUN()
  {
    return fieldE01CUMCUN.getString();
  }

  /**
  * Set numeric field E01CUMCUN using a BigDecimal value.
  */
  public void setE01CUMCUN(BigDecimal newvalue)
  {
    fieldE01CUMCUN.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01CUMCUN as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01CUMCUN()
  {
    return fieldE01CUMCUN.getBigDecimal();
  }

  /**
  * Set field E01CUMRTP using a String value.
  */
  public void setE01CUMRTP(String newvalue)
  {
    fieldE01CUMRTP.setString(newvalue);
  }

  /**
  * Get value of field E01CUMRTP as a String.
  */
  public String getE01CUMRTP()
  {
    return fieldE01CUMRTP.getString();
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
  * Set field E01CUMMAN using a String value.
  */
  public void setE01CUMMAN(String newvalue)
  {
    fieldE01CUMMAN.setString(newvalue);
  }

  /**
  * Get value of field E01CUMMAN as a String.
  */
  public String getE01CUMMAN()
  {
    return fieldE01CUMMAN.getString();
  }

  /**
  * Set numeric field E01CUMMAN using a BigDecimal value.
  */
  public void setE01CUMMAN(BigDecimal newvalue)
  {
    fieldE01CUMMAN.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01CUMMAN as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01CUMMAN()
  {
    return fieldE01CUMMAN.getBigDecimal();
  }

  /**
  * Set field E01CUMMA1 using a String value.
  */
  public void setE01CUMMA1(String newvalue)
  {
    fieldE01CUMMA1.setString(newvalue);
  }

  /**
  * Get value of field E01CUMMA1 as a String.
  */
  public String getE01CUMMA1()
  {
    return fieldE01CUMMA1.getString();
  }

  /**
  * Set field E01CUMMA2 using a String value.
  */
  public void setE01CUMMA2(String newvalue)
  {
    fieldE01CUMMA2.setString(newvalue);
  }

  /**
  * Get value of field E01CUMMA2 as a String.
  */
  public String getE01CUMMA2()
  {
    return fieldE01CUMMA2.getString();
  }

  /**
  * Set field E01CUMMA3 using a String value.
  */
  public void setE01CUMMA3(String newvalue)
  {
    fieldE01CUMMA3.setString(newvalue);
  }

  /**
  * Get value of field E01CUMMA3 as a String.
  */
  public String getE01CUMMA3()
  {
    return fieldE01CUMMA3.getString();
  }

  /**
  * Set field E01CUMMA4 using a String value.
  */
  public void setE01CUMMA4(String newvalue)
  {
    fieldE01CUMMA4.setString(newvalue);
  }

  /**
  * Get value of field E01CUMMA4 as a String.
  */
  public String getE01CUMMA4()
  {
    return fieldE01CUMMA4.getString();
  }

  /**
  * Set field E01CUMCTY using a String value.
  */
  public void setE01CUMCTY(String newvalue)
  {
    fieldE01CUMCTY.setString(newvalue);
  }

  /**
  * Get value of field E01CUMCTY as a String.
  */
  public String getE01CUMCTY()
  {
    return fieldE01CUMCTY.getString();
  }

  /**
  * Set field E01CUMSTE using a String value.
  */
  public void setE01CUMSTE(String newvalue)
  {
    fieldE01CUMSTE.setString(newvalue);
  }

  /**
  * Get value of field E01CUMSTE as a String.
  */
  public String getE01CUMSTE()
  {
    return fieldE01CUMSTE.getString();
  }

  /**
  * Set field E01CUMZPC using a String value.
  */
  public void setE01CUMZPC(String newvalue)
  {
    fieldE01CUMZPC.setString(newvalue);
  }

  /**
  * Get value of field E01CUMZPC as a String.
  */
  public String getE01CUMZPC()
  {
    return fieldE01CUMZPC.getString();
  }

  /**
  * Set field E01CUMPOB using a String value.
  */
  public void setE01CUMPOB(String newvalue)
  {
    fieldE01CUMPOB.setString(newvalue);
  }

  /**
  * Get value of field E01CUMPOB as a String.
  */
  public String getE01CUMPOB()
  {
    return fieldE01CUMPOB.getString();
  }

  /**
  * Set field E01CUMCTR using a String value.
  */
  public void setE01CUMCTR(String newvalue)
  {
    fieldE01CUMCTR.setString(newvalue);
  }

  /**
  * Get value of field E01CUMCTR as a String.
  */
  public String getE01CUMCTR()
  {
    return fieldE01CUMCTR.getString();
  }

  /**
  * Set field E01CUMMLC using a String value.
  */
  public void setE01CUMMLC(String newvalue)
  {
    fieldE01CUMMLC.setString(newvalue);
  }

  /**
  * Get value of field E01CUMMLC as a String.
  */
  public String getE01CUMMLC()
  {
    return fieldE01CUMMLC.getString();
  }

  /**
  * Set field E01CUMHPN using a String value.
  */
  public void setE01CUMHPN(String newvalue)
  {
    fieldE01CUMHPN.setString(newvalue);
  }

  /**
  * Get value of field E01CUMHPN as a String.
  */
  public String getE01CUMHPN()
  {
    return fieldE01CUMHPN.getString();
  }

  /**
  * Set numeric field E01CUMHPN using a BigDecimal value.
  */
  public void setE01CUMHPN(BigDecimal newvalue)
  {
    fieldE01CUMHPN.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01CUMHPN as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01CUMHPN()
  {
    return fieldE01CUMHPN.getBigDecimal();
  }

  /**
  * Set field E01CUMBNC using a String value.
  */
  public void setE01CUMBNC(String newvalue)
  {
    fieldE01CUMBNC.setString(newvalue);
  }

  /**
  * Get value of field E01CUMBNC as a String.
  */
  public String getE01CUMBNC()
  {
    return fieldE01CUMBNC.getString();
  }

  /**
  * Set field E01CUMBNI using a String value.
  */
  public void setE01CUMBNI(String newvalue)
  {
    fieldE01CUMBNI.setString(newvalue);
  }

  /**
  * Get value of field E01CUMBNI as a String.
  */
  public String getE01CUMBNI()
  {
    return fieldE01CUMBNI.getString();
  }

  /**
  * Set field E01CUMINC using a String value.
  */
  public void setE01CUMINC(String newvalue)
  {
    fieldE01CUMINC.setString(newvalue);
  }

  /**
  * Get value of field E01CUMINC as a String.
  */
  public String getE01CUMINC()
  {
    return fieldE01CUMINC.getString();
  }

  /**
  * Set field E01CUMBSX using a String value.
  */
  public void setE01CUMBSX(String newvalue)
  {
    fieldE01CUMBSX.setString(newvalue);
  }

  /**
  * Get value of field E01CUMBSX as a String.
  */
  public String getE01CUMBSX()
  {
    return fieldE01CUMBSX.getString();
  }

  /**
  * Set field E01CUMBMS using a String value.
  */
  public void setE01CUMBMS(String newvalue)
  {
    fieldE01CUMBMS.setString(newvalue);
  }

  /**
  * Get value of field E01CUMBMS as a String.
  */
  public String getE01CUMBMS()
  {
    return fieldE01CUMBMS.getString();
  }

  /**
  * Set field E01CUMNST using a String value.
  */
  public void setE01CUMNST(String newvalue)
  {
    fieldE01CUMNST.setString(newvalue);
  }

  /**
  * Get value of field E01CUMNST as a String.
  */
  public String getE01CUMNST()
  {
    return fieldE01CUMNST.getString();
  }

  /**
  * Set numeric field E01CUMNST using a BigDecimal value.
  */
  public void setE01CUMNST(BigDecimal newvalue)
  {
    fieldE01CUMNST.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01CUMNST as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01CUMNST()
  {
    return fieldE01CUMNST.getBigDecimal();
  }

  /**
  * Set field E01CUMRCN using a String value.
  */
  public void setE01CUMRCN(String newvalue)
  {
    fieldE01CUMRCN.setString(newvalue);
  }

  /**
  * Get value of field E01CUMRCN as a String.
  */
  public String getE01CUMRCN()
  {
    return fieldE01CUMRCN.getString();
  }

  /**
  * Set numeric field E01CUMRCN using a BigDecimal value.
  */
  public void setE01CUMRCN(BigDecimal newvalue)
  {
    fieldE01CUMRCN.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01CUMRCN as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01CUMRCN()
  {
    return fieldE01CUMRCN.getBigDecimal();
  }

  /**
  * Set field E01CUMTID using a String value.
  */
  public void setE01CUMTID(String newvalue)
  {
    fieldE01CUMTID.setString(newvalue);
  }

  /**
  * Get value of field E01CUMTID as a String.
  */
  public String getE01CUMTID()
  {
    return fieldE01CUMTID.getString();
  }

  /**
  * Set field E01CUMPID using a String value.
  */
  public void setE01CUMPID(String newvalue)
  {
    fieldE01CUMPID.setString(newvalue);
  }

  /**
  * Get value of field E01CUMPID as a String.
  */
  public String getE01CUMPID()
  {
    return fieldE01CUMPID.getString();
  }

  /**
  * Set field E01CUMAM1 using a String value.
  */
  public void setE01CUMAM1(String newvalue)
  {
    fieldE01CUMAM1.setString(newvalue);
  }

  /**
  * Get value of field E01CUMAM1 as a String.
  */
  public String getE01CUMAM1()
  {
    return fieldE01CUMAM1.getString();
  }

  /**
  * Set numeric field E01CUMAM1 using a BigDecimal value.
  */
  public void setE01CUMAM1(BigDecimal newvalue)
  {
    fieldE01CUMAM1.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01CUMAM1 as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01CUMAM1()
  {
    return fieldE01CUMAM1.getBigDecimal();
  }

  /**
  * Set field E01CUMAM2 using a String value.
  */
  public void setE01CUMAM2(String newvalue)
  {
    fieldE01CUMAM2.setString(newvalue);
  }

  /**
  * Get value of field E01CUMAM2 as a String.
  */
  public String getE01CUMAM2()
  {
    return fieldE01CUMAM2.getString();
  }

  /**
  * Set numeric field E01CUMAM2 using a BigDecimal value.
  */
  public void setE01CUMAM2(BigDecimal newvalue)
  {
    fieldE01CUMAM2.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01CUMAM2 as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01CUMAM2()
  {
    return fieldE01CUMAM2.getBigDecimal();
  }

  /**
  * Set field E01CUMDTM using a String value.
  */
  public void setE01CUMDTM(String newvalue)
  {
    fieldE01CUMDTM.setString(newvalue);
  }

  /**
  * Get value of field E01CUMDTM as a String.
  */
  public String getE01CUMDTM()
  {
    return fieldE01CUMDTM.getString();
  }

  /**
  * Set numeric field E01CUMDTM using a BigDecimal value.
  */
  public void setE01CUMDTM(BigDecimal newvalue)
  {
    fieldE01CUMDTM.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01CUMDTM as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01CUMDTM()
  {
    return fieldE01CUMDTM.getBigDecimal();
  }

  /**
  * Set field E01CUMDTD using a String value.
  */
  public void setE01CUMDTD(String newvalue)
  {
    fieldE01CUMDTD.setString(newvalue);
  }

  /**
  * Get value of field E01CUMDTD as a String.
  */
  public String getE01CUMDTD()
  {
    return fieldE01CUMDTD.getString();
  }

  /**
  * Set numeric field E01CUMDTD using a BigDecimal value.
  */
  public void setE01CUMDTD(BigDecimal newvalue)
  {
    fieldE01CUMDTD.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01CUMDTD as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01CUMDTD()
  {
    return fieldE01CUMDTD.getBigDecimal();
  }

  /**
  * Set field E01CUMDTY using a String value.
  */
  public void setE01CUMDTY(String newvalue)
  {
    fieldE01CUMDTY.setString(newvalue);
  }

  /**
  * Get value of field E01CUMDTY as a String.
  */
  public String getE01CUMDTY()
  {
    return fieldE01CUMDTY.getString();
  }

  /**
  * Set numeric field E01CUMDTY using a BigDecimal value.
  */
  public void setE01CUMDTY(BigDecimal newvalue)
  {
    fieldE01CUMDTY.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01CUMDTY as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01CUMDTY()
  {
    return fieldE01CUMDTY.getBigDecimal();
  }

  /**
  * Set field E01CUMRTY using a String value.
  */
  public void setE01CUMRTY(String newvalue)
  {
    fieldE01CUMRTY.setString(newvalue);
  }

  /**
  * Get value of field E01CUMRTY as a String.
  */
  public String getE01CUMRTY()
  {
    return fieldE01CUMRTY.getString();
  }

  /**
  * Set field E01CUMFL1 using a String value.
  */
  public void setE01CUMFL1(String newvalue)
  {
    fieldE01CUMFL1.setString(newvalue);
  }

  /**
  * Get value of field E01CUMFL1 as a String.
  */
  public String getE01CUMFL1()
  {
    return fieldE01CUMFL1.getString();
  }

  /**
  * Set field E01CUMFL2 using a String value.
  */
  public void setE01CUMFL2(String newvalue)
  {
    fieldE01CUMFL2.setString(newvalue);
  }

  /**
  * Get value of field E01CUMFL2 as a String.
  */
  public String getE01CUMFL2()
  {
    return fieldE01CUMFL2.getString();
  }

  /**
  * Set field E01CUMFL3 using a String value.
  */
  public void setE01CUMFL3(String newvalue)
  {
    fieldE01CUMFL3.setString(newvalue);
  }

  /**
  * Get value of field E01CUMFL3 as a String.
  */
  public String getE01CUMFL3()
  {
    return fieldE01CUMFL3.getString();
  }

  /**
  * Set field D01CUMSTE using a String value.
  */
  public void setD01CUMSTE(String newvalue)
  {
    fieldD01CUMSTE.setString(newvalue);
  }

  /**
  * Get value of field D01CUMSTE as a String.
  */
  public String getD01CUMSTE()
  {
    return fieldD01CUMSTE.getString();
  }

  /**
  * Set field D01CUMMLC using a String value.
  */
  public void setD01CUMMLC(String newvalue)
  {
    fieldD01CUMMLC.setString(newvalue);
  }

  /**
  * Get value of field D01CUMMLC as a String.
  */
  public String getD01CUMMLC()
  {
    return fieldD01CUMMLC.getString();
  }

  /**
  * Set field D01CUMBNC using a String value.
  */
  public void setD01CUMBNC(String newvalue)
  {
    fieldD01CUMBNC.setString(newvalue);
  }

  /**
  * Get value of field D01CUMBNC as a String.
  */
  public String getD01CUMBNC()
  {
    return fieldD01CUMBNC.getString();
  }

  /**
  * Set field D01CUMINC using a String value.
  */
  public void setD01CUMINC(String newvalue)
  {
    fieldD01CUMINC.setString(newvalue);
  }

  /**
  * Get value of field D01CUMINC as a String.
  */
  public String getD01CUMINC()
  {
    return fieldD01CUMINC.getString();
  }

  /**
  * Set field D01CUMTID using a String value.
  */
  public void setD01CUMTID(String newvalue)
  {
    fieldD01CUMTID.setString(newvalue);
  }

  /**
  * Get value of field D01CUMTID as a String.
  */
  public String getD01CUMTID()
  {
    return fieldD01CUMTID.getString();
  }

  /**
  * Set field D01CUMPID using a String value.
  */
  public void setD01CUMPID(String newvalue)
  {
    fieldD01CUMPID.setString(newvalue);
  }

  /**
  * Get value of field D01CUMPID as a String.
  */
  public String getD01CUMPID()
  {
    return fieldD01CUMPID.getString();
  }

  /**
  * Set field E01CUMNME using a String value.
  */
  public void setE01CUMNME(String newvalue)
  {
    fieldE01CUMNME.setString(newvalue);
  }

  /**
  * Get value of field E01CUMNME as a String.
  */
  public String getE01CUMNME()
  {
    return fieldE01CUMNME.getString();
  }

  /**
  * Set field E01CUMD21 using a String value.
  */
  public void setE01CUMD21(String newvalue)
  {
    fieldE01CUMD21.setString(newvalue);
  }

  /**
  * Get value of field E01CUMD21 as a String.
  */
  public String getE01CUMD21()
  {
    return fieldE01CUMD21.getString();
  }

  /**
  * Set numeric field E01CUMD21 using a BigDecimal value.
  */
  public void setE01CUMD21(BigDecimal newvalue)
  {
    fieldE01CUMD21.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01CUMD21 as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01CUMD21()
  {
    return fieldE01CUMD21.getBigDecimal();
  }

  /**
  * Set field E01CUMD22 using a String value.
  */
  public void setE01CUMD22(String newvalue)
  {
    fieldE01CUMD22.setString(newvalue);
  }

  /**
  * Get value of field E01CUMD22 as a String.
  */
  public String getE01CUMD22()
  {
    return fieldE01CUMD22.getString();
  }

  /**
  * Set numeric field E01CUMD22 using a BigDecimal value.
  */
  public void setE01CUMD22(BigDecimal newvalue)
  {
    fieldE01CUMD22.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01CUMD22 as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01CUMD22()
  {
    return fieldE01CUMD22.getBigDecimal();
  }

  /**
  * Set field E01CUMD23 using a String value.
  */
  public void setE01CUMD23(String newvalue)
  {
    fieldE01CUMD23.setString(newvalue);
  }

  /**
  * Get value of field E01CUMD23 as a String.
  */
  public String getE01CUMD23()
  {
    return fieldE01CUMD23.getString();
  }

  /**
  * Set numeric field E01CUMD23 using a BigDecimal value.
  */
  public void setE01CUMD23(BigDecimal newvalue)
  {
    fieldE01CUMD23.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01CUMD23 as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01CUMD23()
  {
    return fieldE01CUMD23.getBigDecimal();
  }

  /**
  * Set field D01CUMUC2 using a String value.
  */
  public void setD01CUMUC2(String newvalue)
  {
    fieldD01CUMUC2.setString(newvalue);
  }

  /**
  * Get value of field D01CUMUC2 as a String.
  */
  public String getD01CUMUC2()
  {
    return fieldD01CUMUC2.getString();
  }

  /**
  * Set field E01CUMUC2 using a String value.
  */
  public void setE01CUMUC2(String newvalue)
  {
    fieldE01CUMUC2.setString(newvalue);
  }

  /**
  * Get value of field E01CUMUC2 as a String.
  */
  public String getE01CUMUC2()
  {
    return fieldE01CUMUC2.getString();
  }

  /**
  * Set field E01TID using a String value.
  */
  public void setE01TID(String newvalue)
  {
    fieldE01TID.setString(newvalue);
  }

  /**
  * Get value of field E01TID as a String.
  */
  public String getE01TID()
  {
    return fieldE01TID.getString();
  }

  /**
  * Set field E01CUN using a String value.
  */
  public void setE01CUN(String newvalue)
  {
    fieldE01CUN.setString(newvalue);
  }

  /**
  * Get value of field E01CUN as a String.
  */
  public String getE01CUN()
  {
    return fieldE01CUN.getString();
  }

  /**
  * Set numeric field E01CUN using a BigDecimal value.
  */
  public void setE01CUN(BigDecimal newvalue)
  {
    fieldE01CUN.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01CUN as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01CUN()
  {
    return fieldE01CUN.getBigDecimal();
  }

  /**
  * Set field E01PT1 using a String value.
  */
  public void setE01PT1(String newvalue)
  {
    fieldE01PT1.setString(newvalue);
  }

  /**
  * Get value of field E01PT1 as a String.
  */
  public String getE01PT1()
  {
    return fieldE01PT1.getString();
  }

  /**
  * Set field E01PT2 using a String value.
  */
  public void setE01PT2(String newvalue)
  {
    fieldE01PT2.setString(newvalue);
  }

  /**
  * Get value of field E01PT2 as a String.
  */
  public String getE01PT2()
  {
    return fieldE01PT2.getString();
  }

  /**
  * Set field E01PT3 using a String value.
  */
  public void setE01PT3(String newvalue)
  {
    fieldE01PT3.setString(newvalue);
  }

  /**
  * Get value of field E01PT3 as a String.
  */
  public String getE01PT3()
  {
    return fieldE01PT3.getString();
  }

  /**
  * Set field E01PT4 using a String value.
  */
  public void setE01PT4(String newvalue)
  {
    fieldE01PT4.setString(newvalue);
  }

  /**
  * Get value of field E01PT4 as a String.
  */
  public String getE01PT4()
  {
    return fieldE01PT4.getString();
  }

  /**
  * Set field E01PT5 using a String value.
  */
  public void setE01PT5(String newvalue)
  {
    fieldE01PT5.setString(newvalue);
  }

  /**
  * Get value of field E01PT5 as a String.
  */
  public String getE01PT5()
  {
    return fieldE01PT5.getString();
  }

  /**
  * Set field E01PT6 using a String value.
  */
  public void setE01PT6(String newvalue)
  {
    fieldE01PT6.setString(newvalue);
  }

  /**
  * Get value of field E01PT6 as a String.
  */
  public String getE01PT6()
  {
    return fieldE01PT6.getString();
  }

}
