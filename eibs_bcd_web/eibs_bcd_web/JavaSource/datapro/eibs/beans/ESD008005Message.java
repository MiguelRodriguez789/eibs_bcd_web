package datapro.eibs.beans;

import datapro.eibs.sockets.*;
import java.io.*;
import java.math.*;

import java.util.*;

/**
* Class generated by AS/400 CRTCLASS command from ESD008005 physical file definition.
* 
* File level identifier is 1100706173650.
* Record format level identifier is 5744A1FB85923.
*/

public class ESD008005Message extends MessageRecord
{
  final static String fldnames[] = {
                                     "H05USR",
                                     "H05PGM",
                                     "H05TIM",
                                     "H05SCR",
                                     "H05OPE",
                                     "H05MAS",
                                     "H05WK1",
                                     "H05WK2",
                                     "H05WK3",
                                     "E05LGT",
                                     "E05CUN",
                                     "E05FNA",
                                     "E05FN2",
                                     "E05LN1",
                                     "E05LN2",
                                     "E05ACA",
                                     "E05NA1",
                                     "E05NA2",
                                     "E05NA3",
                                     "E05NA4",
                                     "E05CTY",
                                     "E05STE",
                                     "E05CTR",
                                     "E05SHN",
                                     "E05POB",
                                     "E05CCS",
                                     "E05ZPC",
                                     "E05IDN",
                                     "E05TID",
                                     "E05PID",
                                     "E05IDF",
                                     "E05BDM",
                                     "E05BDD",
                                     "E05BDY",
                                     "E05PHN",
                                     "E05IAD",
                                     "D05TID",
                                     "D05PID",
                                     "D05STE",
                                     "F05LGT",
                                     "F05CUN",
                                     "F05FNA",
                                     "F05FN2",
                                     "F05LN1",
                                     "F05LN2",
                                     "F05ACA",
                                     "F05NA1",
                                     "F05NA2",
                                     "F05NA3",
                                     "F05NA4",
                                     "F05CTY",
                                     "F05STE",
                                     "F05CTR",
                                     "F05SHN",
                                     "F05POB",
                                     "F05CCS",
                                     "F05ZPC",
                                     "F05IDN",
                                     "F05TID",
                                     "F05PID",
                                     "F05IDF",
                                     "F05BDM",
                                     "F05BDD",
                                     "F05BDY",
                                     "F05PHN",
                                     "F05IAD"
                                   };
  final static String tnames[] = {
                                   "H05USR",
                                   "H05PGM",
                                   "H05TIM",
                                   "H05SCR",
                                   "H05OPE",
                                   "H05MAS",
                                   "H05WK1",
                                   "H05WK2",
                                   "H05WK3",
                                   "E05LGT",
                                   "E05CUN",
                                   "E05FNA",
                                   "E05FN2",
                                   "E05LN1",
                                   "E05LN2",
                                   "E05ACA",
                                   "E05NA1",
                                   "E05NA2",
                                   "E05NA3",
                                   "E05NA4",
                                   "E05CTY",
                                   "E05STE",
                                   "E05CTR",
                                   "E05SHN",
                                   "E05POB",
                                   "E05CCS",
                                   "E05ZPC",
                                   "E05IDN",
                                   "E05TID",
                                   "E05PID",
                                   "E05IDF",
                                   "E05BDM",
                                   "E05BDD",
                                   "E05BDY",
                                   "E05PHN",
                                   "E05IAD",
                                   "D05TID",
                                   "D05PID",
                                   "D05STE",
                                   "F05LGT",
                                   "F05CUN",
                                   "F05FNA",
                                   "F05FN2",
                                   "F05LN1",
                                   "F05LN2",
                                   "F05ACA",
                                   "F05NA1",
                                   "F05NA2",
                                   "F05NA3",
                                   "F05NA4",
                                   "F05CTY",
                                   "F05STE",
                                   "F05CTR",
                                   "F05SHN",
                                   "F05POB",
                                   "F05CCS",
                                   "F05ZPC",
                                   "F05IDN",
                                   "F05TID",
                                   "F05PID",
                                   "F05IDF",
                                   "F05BDM",
                                   "F05BDD",
                                   "F05BDY",
                                   "F05PHN",
                                   "F05IAD"
                                 };
  final static String fid = "1100706173650";
  final static String rid = "5744A1FB85923";
  final static String fmtname = "ESD008005";
  final int FIELDCOUNT = 66;
  private static Hashtable tlookup = new Hashtable();
  private CharacterField fieldH05USR = null;
  private CharacterField fieldH05PGM = null;
  private CharacterField fieldH05TIM = null;
  private CharacterField fieldH05SCR = null;
  private CharacterField fieldH05OPE = null;
  private CharacterField fieldH05MAS = null;
  private CharacterField fieldH05WK1 = null;
  private CharacterField fieldH05WK2 = null;
  private CharacterField fieldH05WK3 = null;
  private CharacterField fieldE05LGT = null;
  private DecimalField fieldE05CUN = null;
  private CharacterField fieldE05FNA = null;
  private CharacterField fieldE05FN2 = null;
  private CharacterField fieldE05LN1 = null;
  private CharacterField fieldE05LN2 = null;
  private CharacterField fieldE05ACA = null;
  private CharacterField fieldE05NA1 = null;
  private CharacterField fieldE05NA2 = null;
  private CharacterField fieldE05NA3 = null;
  private CharacterField fieldE05NA4 = null;
  private CharacterField fieldE05CTY = null;
  private CharacterField fieldE05STE = null;
  private CharacterField fieldE05CTR = null;
  private CharacterField fieldE05SHN = null;
  private CharacterField fieldE05POB = null;
  private CharacterField fieldE05CCS = null;
  private CharacterField fieldE05ZPC = null;
  private CharacterField fieldE05IDN = null;
  private CharacterField fieldE05TID = null;
  private CharacterField fieldE05PID = null;
  private CharacterField fieldE05IDF = null;
  private DecimalField fieldE05BDM = null;
  private DecimalField fieldE05BDD = null;
  private DecimalField fieldE05BDY = null;
  private DecimalField fieldE05PHN = null;
  private CharacterField fieldE05IAD = null;
  private CharacterField fieldD05TID = null;
  private CharacterField fieldD05PID = null;
  private CharacterField fieldD05STE = null;
  private CharacterField fieldF05LGT = null;
  private CharacterField fieldF05CUN = null;
  private CharacterField fieldF05FNA = null;
  private CharacterField fieldF05FN2 = null;
  private CharacterField fieldF05LN1 = null;
  private CharacterField fieldF05LN2 = null;
  private CharacterField fieldF05ACA = null;
  private CharacterField fieldF05NA1 = null;
  private CharacterField fieldF05NA2 = null;
  private CharacterField fieldF05NA3 = null;
  private CharacterField fieldF05NA4 = null;
  private CharacterField fieldF05CTY = null;
  private CharacterField fieldF05STE = null;
  private CharacterField fieldF05CTR = null;
  private CharacterField fieldF05SHN = null;
  private CharacterField fieldF05POB = null;
  private CharacterField fieldF05CCS = null;
  private CharacterField fieldF05ZPC = null;
  private CharacterField fieldF05IDN = null;
  private CharacterField fieldF05TID = null;
  private CharacterField fieldF05PID = null;
  private CharacterField fieldF05IDF = null;
  private CharacterField fieldF05BDM = null;
  private CharacterField fieldF05BDD = null;
  private CharacterField fieldF05BDY = null;
  private CharacterField fieldF05PHN = null;
  private CharacterField fieldF05IAD = null;

  /**
  * Constructor for ESD008005Message.
  */
  public ESD008005Message()
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
    recordsize = 684;
    fileid = fid;
    recordid = rid;
    message = new byte[getByteLength()];
    formatname = fmtname;
    fieldnames = fldnames;
    tagnames = tnames;
    fields = new MessageField[FIELDCOUNT];

    fields[0] = fieldH05USR =
    new CharacterField(message, HEADERSIZE + 0, 10, "H05USR");
    fields[1] = fieldH05PGM =
    new CharacterField(message, HEADERSIZE + 10, 10, "H05PGM");
    fields[2] = fieldH05TIM =
    new CharacterField(message, HEADERSIZE + 20, 12, "H05TIM");
    fields[3] = fieldH05SCR =
    new CharacterField(message, HEADERSIZE + 32, 2, "H05SCR");
    fields[4] = fieldH05OPE =
    new CharacterField(message, HEADERSIZE + 34, 4, "H05OPE");
    fields[5] = fieldH05MAS =
    new CharacterField(message, HEADERSIZE + 38, 1, "H05MAS");
    fields[6] = fieldH05WK1 =
    new CharacterField(message, HEADERSIZE + 39, 1, "H05WK1");
    fields[7] = fieldH05WK2 =
    new CharacterField(message, HEADERSIZE + 40, 1, "H05WK2");
    fields[8] = fieldH05WK3 =
    new CharacterField(message, HEADERSIZE + 41, 1, "H05WK3");
    fields[9] = fieldE05LGT =
    new CharacterField(message, HEADERSIZE + 42, 1, "E05LGT");
    fields[10] = fieldE05CUN =
    new DecimalField(message, HEADERSIZE + 43, 10, 0, "E05CUN");
    fields[11] = fieldE05FNA =
    new CharacterField(message, HEADERSIZE + 53, 30, "E05FNA");
    fields[12] = fieldE05FN2 =
    new CharacterField(message, HEADERSIZE + 83, 30, "E05FN2");
    fields[13] = fieldE05LN1 =
    new CharacterField(message, HEADERSIZE + 113, 30, "E05LN1");
    fields[14] = fieldE05LN2 =
    new CharacterField(message, HEADERSIZE + 143, 30, "E05LN2");
    fields[15] = fieldE05ACA =
    new CharacterField(message, HEADERSIZE + 173, 30, "E05ACA");
    fields[16] = fieldE05NA1 =
    new CharacterField(message, HEADERSIZE + 203, 45, "E05NA1");
    fields[17] = fieldE05NA2 =
    new CharacterField(message, HEADERSIZE + 248, 35, "E05NA2");
    fields[18] = fieldE05NA3 =
    new CharacterField(message, HEADERSIZE + 283, 35, "E05NA3");
    fields[19] = fieldE05NA4 =
    new CharacterField(message, HEADERSIZE + 318, 35, "E05NA4");
    fields[20] = fieldE05CTY =
    new CharacterField(message, HEADERSIZE + 353, 30, "E05CTY");
    fields[21] = fieldE05STE =
    new CharacterField(message, HEADERSIZE + 383, 4, "E05STE");
    fields[22] = fieldE05CTR =
    new CharacterField(message, HEADERSIZE + 387, 20, "E05CTR");
    fields[23] = fieldE05SHN =
    new CharacterField(message, HEADERSIZE + 407, 15, "E05SHN");
    fields[24] = fieldE05POB =
    new CharacterField(message, HEADERSIZE + 422, 10, "E05POB");
    fields[25] = fieldE05CCS =
    new CharacterField(message, HEADERSIZE + 432, 4, "E05CCS");
    fields[26] = fieldE05ZPC =
    new CharacterField(message, HEADERSIZE + 436, 15, "E05ZPC");
    fields[27] = fieldE05IDN =
    new CharacterField(message, HEADERSIZE + 451, 15, "E05IDN");
    fields[28] = fieldE05TID =
    new CharacterField(message, HEADERSIZE + 466, 4, "E05TID");
    fields[29] = fieldE05PID =
    new CharacterField(message, HEADERSIZE + 470, 4, "E05PID");
    fields[30] = fieldE05IDF =
    new CharacterField(message, HEADERSIZE + 474, 15, "E05IDF");
    fields[31] = fieldE05BDM =
    new DecimalField(message, HEADERSIZE + 489, 3, 0, "E05BDM");
    fields[32] = fieldE05BDD =
    new DecimalField(message, HEADERSIZE + 492, 3, 0, "E05BDD");
    fields[33] = fieldE05BDY =
    new DecimalField(message, HEADERSIZE + 495, 5, 0, "E05BDY");
    fields[34] = fieldE05PHN =
    new DecimalField(message, HEADERSIZE + 500, 12, 0, "E05PHN");
    fields[35] = fieldE05IAD =
    new CharacterField(message, HEADERSIZE + 512, 40, "E05IAD");
    fields[36] = fieldD05TID =
    new CharacterField(message, HEADERSIZE + 552, 35, "D05TID");
    fields[37] = fieldD05PID =
    new CharacterField(message, HEADERSIZE + 587, 35, "D05PID");
    fields[38] = fieldD05STE =
    new CharacterField(message, HEADERSIZE + 622, 35, "D05STE");
    fields[39] = fieldF05LGT =
    new CharacterField(message, HEADERSIZE + 657, 1, "F05LGT");
    fields[40] = fieldF05CUN =
    new CharacterField(message, HEADERSIZE + 658, 1, "F05CUN");
    fields[41] = fieldF05FNA =
    new CharacterField(message, HEADERSIZE + 659, 1, "F05FNA");
    fields[42] = fieldF05FN2 =
    new CharacterField(message, HEADERSIZE + 660, 1, "F05FN2");
    fields[43] = fieldF05LN1 =
    new CharacterField(message, HEADERSIZE + 661, 1, "F05LN1");
    fields[44] = fieldF05LN2 =
    new CharacterField(message, HEADERSIZE + 662, 1, "F05LN2");
    fields[45] = fieldF05ACA =
    new CharacterField(message, HEADERSIZE + 663, 1, "F05ACA");
    fields[46] = fieldF05NA1 =
    new CharacterField(message, HEADERSIZE + 664, 1, "F05NA1");
    fields[47] = fieldF05NA2 =
    new CharacterField(message, HEADERSIZE + 665, 1, "F05NA2");
    fields[48] = fieldF05NA3 =
    new CharacterField(message, HEADERSIZE + 666, 1, "F05NA3");
    fields[49] = fieldF05NA4 =
    new CharacterField(message, HEADERSIZE + 667, 1, "F05NA4");
    fields[50] = fieldF05CTY =
    new CharacterField(message, HEADERSIZE + 668, 1, "F05CTY");
    fields[51] = fieldF05STE =
    new CharacterField(message, HEADERSIZE + 669, 1, "F05STE");
    fields[52] = fieldF05CTR =
    new CharacterField(message, HEADERSIZE + 670, 1, "F05CTR");
    fields[53] = fieldF05SHN =
    new CharacterField(message, HEADERSIZE + 671, 1, "F05SHN");
    fields[54] = fieldF05POB =
    new CharacterField(message, HEADERSIZE + 672, 1, "F05POB");
    fields[55] = fieldF05CCS =
    new CharacterField(message, HEADERSIZE + 673, 1, "F05CCS");
    fields[56] = fieldF05ZPC =
    new CharacterField(message, HEADERSIZE + 674, 1, "F05ZPC");
    fields[57] = fieldF05IDN =
    new CharacterField(message, HEADERSIZE + 675, 1, "F05IDN");
    fields[58] = fieldF05TID =
    new CharacterField(message, HEADERSIZE + 676, 1, "F05TID");
    fields[59] = fieldF05PID =
    new CharacterField(message, HEADERSIZE + 677, 1, "F05PID");
    fields[60] = fieldF05IDF =
    new CharacterField(message, HEADERSIZE + 678, 1, "F05IDF");
    fields[61] = fieldF05BDM =
    new CharacterField(message, HEADERSIZE + 679, 1, "F05BDM");
    fields[62] = fieldF05BDD =
    new CharacterField(message, HEADERSIZE + 680, 1, "F05BDD");
    fields[63] = fieldF05BDY =
    new CharacterField(message, HEADERSIZE + 681, 1, "F05BDY");
    fields[64] = fieldF05PHN =
    new CharacterField(message, HEADERSIZE + 682, 1, "F05PHN");
    fields[65] = fieldF05IAD =
    new CharacterField(message, HEADERSIZE + 683, 1, "F05IAD");

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
  * Set field H05USR using a String value.
  */
  public void setH05USR(String newvalue)
  {
    fieldH05USR.setString(newvalue);
  }

  /**
  * Get value of field H05USR as a String.
  */
  public String getH05USR()
  {
    return fieldH05USR.getString();
  }

  /**
  * Set field H05PGM using a String value.
  */
  public void setH05PGM(String newvalue)
  {
    fieldH05PGM.setString(newvalue);
  }

  /**
  * Get value of field H05PGM as a String.
  */
  public String getH05PGM()
  {
    return fieldH05PGM.getString();
  }

  /**
  * Set field H05TIM using a String value.
  */
  public void setH05TIM(String newvalue)
  {
    fieldH05TIM.setString(newvalue);
  }

  /**
  * Get value of field H05TIM as a String.
  */
  public String getH05TIM()
  {
    return fieldH05TIM.getString();
  }

  /**
  * Set field H05SCR using a String value.
  */
  public void setH05SCR(String newvalue)
  {
    fieldH05SCR.setString(newvalue);
  }

  /**
  * Get value of field H05SCR as a String.
  */
  public String getH05SCR()
  {
    return fieldH05SCR.getString();
  }

  /**
  * Set field H05OPE using a String value.
  */
  public void setH05OPE(String newvalue)
  {
    fieldH05OPE.setString(newvalue);
  }

  /**
  * Get value of field H05OPE as a String.
  */
  public String getH05OPE()
  {
    return fieldH05OPE.getString();
  }

  /**
  * Set field H05MAS using a String value.
  */
  public void setH05MAS(String newvalue)
  {
    fieldH05MAS.setString(newvalue);
  }

  /**
  * Get value of field H05MAS as a String.
  */
  public String getH05MAS()
  {
    return fieldH05MAS.getString();
  }

  /**
  * Set field H05WK1 using a String value.
  */
  public void setH05WK1(String newvalue)
  {
    fieldH05WK1.setString(newvalue);
  }

  /**
  * Get value of field H05WK1 as a String.
  */
  public String getH05WK1()
  {
    return fieldH05WK1.getString();
  }

  /**
  * Set field H05WK2 using a String value.
  */
  public void setH05WK2(String newvalue)
  {
    fieldH05WK2.setString(newvalue);
  }

  /**
  * Get value of field H05WK2 as a String.
  */
  public String getH05WK2()
  {
    return fieldH05WK2.getString();
  }

  /**
  * Set field H05WK3 using a String value.
  */
  public void setH05WK3(String newvalue)
  {
    fieldH05WK3.setString(newvalue);
  }

  /**
  * Get value of field H05WK3 as a String.
  */
  public String getH05WK3()
  {
    return fieldH05WK3.getString();
  }

  /**
  * Set field E05LGT using a String value.
  */
  public void setE05LGT(String newvalue)
  {
    fieldE05LGT.setString(newvalue);
  }

  /**
  * Get value of field E05LGT as a String.
  */
  public String getE05LGT()
  {
    return fieldE05LGT.getString();
  }

  /**
  * Set field E05CUN using a String value.
  */
  public void setE05CUN(String newvalue)
  {
    fieldE05CUN.setString(newvalue);
  }

  /**
  * Get value of field E05CUN as a String.
  */
  public String getE05CUN()
  {
    return fieldE05CUN.getString();
  }

  /**
  * Set numeric field E05CUN using a BigDecimal value.
  */
  public void setE05CUN(BigDecimal newvalue)
  {
    fieldE05CUN.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E05CUN as a BigDecimal.
  */
  public BigDecimal getBigDecimalE05CUN()
  {
    return fieldE05CUN.getBigDecimal();
  }

  /**
  * Set field E05FNA using a String value.
  */
  public void setE05FNA(String newvalue)
  {
    fieldE05FNA.setString(newvalue);
  }

  /**
  * Get value of field E05FNA as a String.
  */
  public String getE05FNA()
  {
    return fieldE05FNA.getString();
  }

  /**
  * Set field E05FN2 using a String value.
  */
  public void setE05FN2(String newvalue)
  {
    fieldE05FN2.setString(newvalue);
  }

  /**
  * Get value of field E05FN2 as a String.
  */
  public String getE05FN2()
  {
    return fieldE05FN2.getString();
  }

  /**
  * Set field E05LN1 using a String value.
  */
  public void setE05LN1(String newvalue)
  {
    fieldE05LN1.setString(newvalue);
  }

  /**
  * Get value of field E05LN1 as a String.
  */
  public String getE05LN1()
  {
    return fieldE05LN1.getString();
  }

  /**
  * Set field E05LN2 using a String value.
  */
  public void setE05LN2(String newvalue)
  {
    fieldE05LN2.setString(newvalue);
  }

  /**
  * Get value of field E05LN2 as a String.
  */
  public String getE05LN2()
  {
    return fieldE05LN2.getString();
  }

  /**
  * Set field E05ACA using a String value.
  */
  public void setE05ACA(String newvalue)
  {
    fieldE05ACA.setString(newvalue);
  }

  /**
  * Get value of field E05ACA as a String.
  */
  public String getE05ACA()
  {
    return fieldE05ACA.getString();
  }

  /**
  * Set field E05NA1 using a String value.
  */
  public void setE05NA1(String newvalue)
  {
    fieldE05NA1.setString(newvalue);
  }

  /**
  * Get value of field E05NA1 as a String.
  */
  public String getE05NA1()
  {
    return fieldE05NA1.getString();
  }

  /**
  * Set field E05NA2 using a String value.
  */
  public void setE05NA2(String newvalue)
  {
    fieldE05NA2.setString(newvalue);
  }

  /**
  * Get value of field E05NA2 as a String.
  */
  public String getE05NA2()
  {
    return fieldE05NA2.getString();
  }

  /**
  * Set field E05NA3 using a String value.
  */
  public void setE05NA3(String newvalue)
  {
    fieldE05NA3.setString(newvalue);
  }

  /**
  * Get value of field E05NA3 as a String.
  */
  public String getE05NA3()
  {
    return fieldE05NA3.getString();
  }

  /**
  * Set field E05NA4 using a String value.
  */
  public void setE05NA4(String newvalue)
  {
    fieldE05NA4.setString(newvalue);
  }

  /**
  * Get value of field E05NA4 as a String.
  */
  public String getE05NA4()
  {
    return fieldE05NA4.getString();
  }

  /**
  * Set field E05CTY using a String value.
  */
  public void setE05CTY(String newvalue)
  {
    fieldE05CTY.setString(newvalue);
  }

  /**
  * Get value of field E05CTY as a String.
  */
  public String getE05CTY()
  {
    return fieldE05CTY.getString();
  }

  /**
  * Set field E05STE using a String value.
  */
  public void setE05STE(String newvalue)
  {
    fieldE05STE.setString(newvalue);
  }

  /**
  * Get value of field E05STE as a String.
  */
  public String getE05STE()
  {
    return fieldE05STE.getString();
  }

  /**
  * Set field E05CTR using a String value.
  */
  public void setE05CTR(String newvalue)
  {
    fieldE05CTR.setString(newvalue);
  }

  /**
  * Get value of field E05CTR as a String.
  */
  public String getE05CTR()
  {
    return fieldE05CTR.getString();
  }

  /**
  * Set field E05SHN using a String value.
  */
  public void setE05SHN(String newvalue)
  {
    fieldE05SHN.setString(newvalue);
  }

  /**
  * Get value of field E05SHN as a String.
  */
  public String getE05SHN()
  {
    return fieldE05SHN.getString();
  }

  /**
  * Set field E05POB using a String value.
  */
  public void setE05POB(String newvalue)
  {
    fieldE05POB.setString(newvalue);
  }

  /**
  * Get value of field E05POB as a String.
  */
  public String getE05POB()
  {
    return fieldE05POB.getString();
  }

  /**
  * Set field E05CCS using a String value.
  */
  public void setE05CCS(String newvalue)
  {
    fieldE05CCS.setString(newvalue);
  }

  /**
  * Get value of field E05CCS as a String.
  */
  public String getE05CCS()
  {
    return fieldE05CCS.getString();
  }

  /**
  * Set field E05ZPC using a String value.
  */
  public void setE05ZPC(String newvalue)
  {
    fieldE05ZPC.setString(newvalue);
  }

  /**
  * Get value of field E05ZPC as a String.
  */
  public String getE05ZPC()
  {
    return fieldE05ZPC.getString();
  }

  /**
  * Set field E05IDN using a String value.
  */
  public void setE05IDN(String newvalue)
  {
    fieldE05IDN.setString(newvalue);
  }

  /**
  * Get value of field E05IDN as a String.
  */
  public String getE05IDN()
  {
    return fieldE05IDN.getString();
  }

  /**
  * Set field E05TID using a String value.
  */
  public void setE05TID(String newvalue)
  {
    fieldE05TID.setString(newvalue);
  }

  /**
  * Get value of field E05TID as a String.
  */
  public String getE05TID()
  {
    return fieldE05TID.getString();
  }

  /**
  * Set field E05PID using a String value.
  */
  public void setE05PID(String newvalue)
  {
    fieldE05PID.setString(newvalue);
  }

  /**
  * Get value of field E05PID as a String.
  */
  public String getE05PID()
  {
    return fieldE05PID.getString();
  }

  /**
  * Set field E05IDF using a String value.
  */
  public void setE05IDF(String newvalue)
  {
    fieldE05IDF.setString(newvalue);
  }

  /**
  * Get value of field E05IDF as a String.
  */
  public String getE05IDF()
  {
    return fieldE05IDF.getString();
  }

  /**
  * Set field E05BDM using a String value.
  */
  public void setE05BDM(String newvalue)
  {
    fieldE05BDM.setString(newvalue);
  }

  /**
  * Get value of field E05BDM as a String.
  */
  public String getE05BDM()
  {
    return fieldE05BDM.getString();
  }

  /**
  * Set numeric field E05BDM using a BigDecimal value.
  */
  public void setE05BDM(BigDecimal newvalue)
  {
    fieldE05BDM.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E05BDM as a BigDecimal.
  */
  public BigDecimal getBigDecimalE05BDM()
  {
    return fieldE05BDM.getBigDecimal();
  }

  /**
  * Set field E05BDD using a String value.
  */
  public void setE05BDD(String newvalue)
  {
    fieldE05BDD.setString(newvalue);
  }

  /**
  * Get value of field E05BDD as a String.
  */
  public String getE05BDD()
  {
    return fieldE05BDD.getString();
  }

  /**
  * Set numeric field E05BDD using a BigDecimal value.
  */
  public void setE05BDD(BigDecimal newvalue)
  {
    fieldE05BDD.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E05BDD as a BigDecimal.
  */
  public BigDecimal getBigDecimalE05BDD()
  {
    return fieldE05BDD.getBigDecimal();
  }

  /**
  * Set field E05BDY using a String value.
  */
  public void setE05BDY(String newvalue)
  {
    fieldE05BDY.setString(newvalue);
  }

  /**
  * Get value of field E05BDY as a String.
  */
  public String getE05BDY()
  {
    return fieldE05BDY.getString();
  }

  /**
  * Set numeric field E05BDY using a BigDecimal value.
  */
  public void setE05BDY(BigDecimal newvalue)
  {
    fieldE05BDY.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E05BDY as a BigDecimal.
  */
  public BigDecimal getBigDecimalE05BDY()
  {
    return fieldE05BDY.getBigDecimal();
  }

  /**
  * Set field E05PHN using a String value.
  */
  public void setE05PHN(String newvalue)
  {
    fieldE05PHN.setString(newvalue);
  }

  /**
  * Get value of field E05PHN as a String.
  */
  public String getE05PHN()
  {
    return fieldE05PHN.getString();
  }

  /**
  * Set numeric field E05PHN using a BigDecimal value.
  */
  public void setE05PHN(BigDecimal newvalue)
  {
    fieldE05PHN.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E05PHN as a BigDecimal.
  */
  public BigDecimal getBigDecimalE05PHN()
  {
    return fieldE05PHN.getBigDecimal();
  }

  /**
  * Set field E05IAD using a String value.
  */
  public void setE05IAD(String newvalue)
  {
    fieldE05IAD.setString(newvalue);
  }

  /**
  * Get value of field E05IAD as a String.
  */
  public String getE05IAD()
  {
    return fieldE05IAD.getString();
  }

  /**
  * Set field D05TID using a String value.
  */
  public void setD05TID(String newvalue)
  {
    fieldD05TID.setString(newvalue);
  }

  /**
  * Get value of field D05TID as a String.
  */
  public String getD05TID()
  {
    return fieldD05TID.getString();
  }

  /**
  * Set field D05PID using a String value.
  */
  public void setD05PID(String newvalue)
  {
    fieldD05PID.setString(newvalue);
  }

  /**
  * Get value of field D05PID as a String.
  */
  public String getD05PID()
  {
    return fieldD05PID.getString();
  }

  /**
  * Set field D05STE using a String value.
  */
  public void setD05STE(String newvalue)
  {
    fieldD05STE.setString(newvalue);
  }

  /**
  * Get value of field D05STE as a String.
  */
  public String getD05STE()
  {
    return fieldD05STE.getString();
  }

  /**
  * Set field F05LGT using a String value.
  */
  public void setF05LGT(String newvalue)
  {
    fieldF05LGT.setString(newvalue);
  }

  /**
  * Get value of field F05LGT as a String.
  */
  public String getF05LGT()
  {
    return fieldF05LGT.getString();
  }

  /**
  * Set field F05CUN using a String value.
  */
  public void setF05CUN(String newvalue)
  {
    fieldF05CUN.setString(newvalue);
  }

  /**
  * Get value of field F05CUN as a String.
  */
  public String getF05CUN()
  {
    return fieldF05CUN.getString();
  }

  /**
  * Set field F05FNA using a String value.
  */
  public void setF05FNA(String newvalue)
  {
    fieldF05FNA.setString(newvalue);
  }

  /**
  * Get value of field F05FNA as a String.
  */
  public String getF05FNA()
  {
    return fieldF05FNA.getString();
  }

  /**
  * Set field F05FN2 using a String value.
  */
  public void setF05FN2(String newvalue)
  {
    fieldF05FN2.setString(newvalue);
  }

  /**
  * Get value of field F05FN2 as a String.
  */
  public String getF05FN2()
  {
    return fieldF05FN2.getString();
  }

  /**
  * Set field F05LN1 using a String value.
  */
  public void setF05LN1(String newvalue)
  {
    fieldF05LN1.setString(newvalue);
  }

  /**
  * Get value of field F05LN1 as a String.
  */
  public String getF05LN1()
  {
    return fieldF05LN1.getString();
  }

  /**
  * Set field F05LN2 using a String value.
  */
  public void setF05LN2(String newvalue)
  {
    fieldF05LN2.setString(newvalue);
  }

  /**
  * Get value of field F05LN2 as a String.
  */
  public String getF05LN2()
  {
    return fieldF05LN2.getString();
  }

  /**
  * Set field F05ACA using a String value.
  */
  public void setF05ACA(String newvalue)
  {
    fieldF05ACA.setString(newvalue);
  }

  /**
  * Get value of field F05ACA as a String.
  */
  public String getF05ACA()
  {
    return fieldF05ACA.getString();
  }

  /**
  * Set field F05NA1 using a String value.
  */
  public void setF05NA1(String newvalue)
  {
    fieldF05NA1.setString(newvalue);
  }

  /**
  * Get value of field F05NA1 as a String.
  */
  public String getF05NA1()
  {
    return fieldF05NA1.getString();
  }

  /**
  * Set field F05NA2 using a String value.
  */
  public void setF05NA2(String newvalue)
  {
    fieldF05NA2.setString(newvalue);
  }

  /**
  * Get value of field F05NA2 as a String.
  */
  public String getF05NA2()
  {
    return fieldF05NA2.getString();
  }

  /**
  * Set field F05NA3 using a String value.
  */
  public void setF05NA3(String newvalue)
  {
    fieldF05NA3.setString(newvalue);
  }

  /**
  * Get value of field F05NA3 as a String.
  */
  public String getF05NA3()
  {
    return fieldF05NA3.getString();
  }

  /**
  * Set field F05NA4 using a String value.
  */
  public void setF05NA4(String newvalue)
  {
    fieldF05NA4.setString(newvalue);
  }

  /**
  * Get value of field F05NA4 as a String.
  */
  public String getF05NA4()
  {
    return fieldF05NA4.getString();
  }

  /**
  * Set field F05CTY using a String value.
  */
  public void setF05CTY(String newvalue)
  {
    fieldF05CTY.setString(newvalue);
  }

  /**
  * Get value of field F05CTY as a String.
  */
  public String getF05CTY()
  {
    return fieldF05CTY.getString();
  }

  /**
  * Set field F05STE using a String value.
  */
  public void setF05STE(String newvalue)
  {
    fieldF05STE.setString(newvalue);
  }

  /**
  * Get value of field F05STE as a String.
  */
  public String getF05STE()
  {
    return fieldF05STE.getString();
  }

  /**
  * Set field F05CTR using a String value.
  */
  public void setF05CTR(String newvalue)
  {
    fieldF05CTR.setString(newvalue);
  }

  /**
  * Get value of field F05CTR as a String.
  */
  public String getF05CTR()
  {
    return fieldF05CTR.getString();
  }

  /**
  * Set field F05SHN using a String value.
  */
  public void setF05SHN(String newvalue)
  {
    fieldF05SHN.setString(newvalue);
  }

  /**
  * Get value of field F05SHN as a String.
  */
  public String getF05SHN()
  {
    return fieldF05SHN.getString();
  }

  /**
  * Set field F05POB using a String value.
  */
  public void setF05POB(String newvalue)
  {
    fieldF05POB.setString(newvalue);
  }

  /**
  * Get value of field F05POB as a String.
  */
  public String getF05POB()
  {
    return fieldF05POB.getString();
  }

  /**
  * Set field F05CCS using a String value.
  */
  public void setF05CCS(String newvalue)
  {
    fieldF05CCS.setString(newvalue);
  }

  /**
  * Get value of field F05CCS as a String.
  */
  public String getF05CCS()
  {
    return fieldF05CCS.getString();
  }

  /**
  * Set field F05ZPC using a String value.
  */
  public void setF05ZPC(String newvalue)
  {
    fieldF05ZPC.setString(newvalue);
  }

  /**
  * Get value of field F05ZPC as a String.
  */
  public String getF05ZPC()
  {
    return fieldF05ZPC.getString();
  }

  /**
  * Set field F05IDN using a String value.
  */
  public void setF05IDN(String newvalue)
  {
    fieldF05IDN.setString(newvalue);
  }

  /**
  * Get value of field F05IDN as a String.
  */
  public String getF05IDN()
  {
    return fieldF05IDN.getString();
  }

  /**
  * Set field F05TID using a String value.
  */
  public void setF05TID(String newvalue)
  {
    fieldF05TID.setString(newvalue);
  }

  /**
  * Get value of field F05TID as a String.
  */
  public String getF05TID()
  {
    return fieldF05TID.getString();
  }

  /**
  * Set field F05PID using a String value.
  */
  public void setF05PID(String newvalue)
  {
    fieldF05PID.setString(newvalue);
  }

  /**
  * Get value of field F05PID as a String.
  */
  public String getF05PID()
  {
    return fieldF05PID.getString();
  }

  /**
  * Set field F05IDF using a String value.
  */
  public void setF05IDF(String newvalue)
  {
    fieldF05IDF.setString(newvalue);
  }

  /**
  * Get value of field F05IDF as a String.
  */
  public String getF05IDF()
  {
    return fieldF05IDF.getString();
  }

  /**
  * Set field F05BDM using a String value.
  */
  public void setF05BDM(String newvalue)
  {
    fieldF05BDM.setString(newvalue);
  }

  /**
  * Get value of field F05BDM as a String.
  */
  public String getF05BDM()
  {
    return fieldF05BDM.getString();
  }

  /**
  * Set field F05BDD using a String value.
  */
  public void setF05BDD(String newvalue)
  {
    fieldF05BDD.setString(newvalue);
  }

  /**
  * Get value of field F05BDD as a String.
  */
  public String getF05BDD()
  {
    return fieldF05BDD.getString();
  }

  /**
  * Set field F05BDY using a String value.
  */
  public void setF05BDY(String newvalue)
  {
    fieldF05BDY.setString(newvalue);
  }

  /**
  * Get value of field F05BDY as a String.
  */
  public String getF05BDY()
  {
    return fieldF05BDY.getString();
  }

  /**
  * Set field F05PHN using a String value.
  */
  public void setF05PHN(String newvalue)
  {
    fieldF05PHN.setString(newvalue);
  }

  /**
  * Get value of field F05PHN as a String.
  */
  public String getF05PHN()
  {
    return fieldF05PHN.getString();
  }

  /**
  * Set field F05IAD using a String value.
  */
  public void setF05IAD(String newvalue)
  {
    fieldF05IAD.setString(newvalue);
  }

  /**
  * Get value of field F05IAD as a String.
  */
  public String getF05IAD()
  {
    return fieldF05IAD.getString();
  }

}
