package datapro.eibs.beans;

import datapro.eibs.sockets.*;
import java.io.*;
import java.math.*;

import java.util.*;

/**
* Class generated by AS/400 CRTCLASS command from EWS001616 physical file definition.
* 
* File level identifier is 1130611113511.
* Record format level identifier is 397B433D1746C.
*/

public class EWS001616Message extends MessageRecord
{
  final static String fldnames[] = {
                                     "H16USR",
                                     "H16PGM",
                                     "H16TIM",
                                     "H16SCR",
                                     "H16OPE",
                                     "H16MAS",
                                     "H16WK1",
                                     "H16WK2",
                                     "H16WK3",
                                     "E16ACD",
                                     "E16ACC",
                                     "E16SEQ",
                                     "E16DSC",
                                     "E26DSC",
                                     "E36DSC",
                                     "E46DSC",
                                     "E56DSC",
                                     "E66DSC",
                                     "E76DSC",
                                     "E86DSC",
                                     "E96DSC",
                                     "E06DSC",
                                     "EA6DSC",
                                     "EB6DSC",
                                     "EC6DSC",
                                     "ED6DSC",
                                     "EE6DSC",
                                     "EF6DSC",
                                     "EG6DSC",
                                     "EH6DSC",
                                     "EI6DSC",
                                     "EJ6DSC",
                                     "E16RCN",
                                     "E26RCN",
                                     "E36RCN",
                                     "E46RCN",
                                     "E56RCN",
                                     "E66RCN",
                                     "E76RCN",
                                     "E86RCN",
                                     "E96RCN",
                                     "E06RCN",
                                     "EA6RCN",
                                     "EB6RCN",
                                     "EC6RCN",
                                     "ED6RCN",
                                     "EE6RCN",
                                     "EF6RCN",
                                     "EG6RCN",
                                     "EH6RCN",
                                     "EI6RCN",
                                     "EJ6RCN"
                                   };
  final static String tnames[] = {
                                   "H16USR",
                                   "H16PGM",
                                   "H16TIM",
                                   "H16SCR",
                                   "H16OPE",
                                   "H16MAS",
                                   "H16WK1",
                                   "H16WK2",
                                   "H16WK3",
                                   "E16ACD",
                                   "E16ACC",
                                   "E16SEQ",
                                   "E16DSC",
                                   "E26DSC",
                                   "E36DSC",
                                   "E46DSC",
                                   "E56DSC",
                                   "E66DSC",
                                   "E76DSC",
                                   "E86DSC",
                                   "E96DSC",
                                   "E06DSC",
                                   "EA6DSC",
                                   "EB6DSC",
                                   "EC6DSC",
                                   "ED6DSC",
                                   "EE6DSC",
                                   "EF6DSC",
                                   "EG6DSC",
                                   "EH6DSC",
                                   "EI6DSC",
                                   "EJ6DSC",
                                   "E16RCN",
                                   "E26RCN",
                                   "E36RCN",
                                   "E46RCN",
                                   "E56RCN",
                                   "E66RCN",
                                   "E76RCN",
                                   "E86RCN",
                                   "E96RCN",
                                   "E06RCN",
                                   "EA6RCN",
                                   "EB6RCN",
                                   "EC6RCN",
                                   "ED6RCN",
                                   "EE6RCN",
                                   "EF6RCN",
                                   "EG6RCN",
                                   "EH6RCN",
                                   "EI6RCN",
                                   "EJ6RCN"
                                 };
  final static String fid = "1130611113511";
  final static String rid = "397B433D1746C";
  final static String fmtname = "EWS001616";
  final int FIELDCOUNT = 52;
  private static Hashtable tlookup = new Hashtable();
  private CharacterField fieldH16USR = null;
  private CharacterField fieldH16PGM = null;
  private CharacterField fieldH16TIM = null;
  private CharacterField fieldH16SCR = null;
  private CharacterField fieldH16OPE = null;
  private CharacterField fieldH16MAS = null;
  private CharacterField fieldH16WK1 = null;
  private CharacterField fieldH16WK2 = null;
  private CharacterField fieldH16WK3 = null;
  private CharacterField fieldE16ACD = null;
  private DecimalField fieldE16ACC = null;
  private DecimalField fieldE16SEQ = null;
  private CharacterField fieldE16DSC = null;
  private CharacterField fieldE26DSC = null;
  private CharacterField fieldE36DSC = null;
  private CharacterField fieldE46DSC = null;
  private CharacterField fieldE56DSC = null;
  private CharacterField fieldE66DSC = null;
  private CharacterField fieldE76DSC = null;
  private CharacterField fieldE86DSC = null;
  private CharacterField fieldE96DSC = null;
  private CharacterField fieldE06DSC = null;
  private CharacterField fieldEA6DSC = null;
  private CharacterField fieldEB6DSC = null;
  private CharacterField fieldEC6DSC = null;
  private CharacterField fieldED6DSC = null;
  private CharacterField fieldEE6DSC = null;
  private CharacterField fieldEF6DSC = null;
  private CharacterField fieldEG6DSC = null;
  private CharacterField fieldEH6DSC = null;
  private CharacterField fieldEI6DSC = null;
  private CharacterField fieldEJ6DSC = null;
  private DecimalField fieldE16RCN = null;
  private DecimalField fieldE26RCN = null;
  private DecimalField fieldE36RCN = null;
  private DecimalField fieldE46RCN = null;
  private DecimalField fieldE56RCN = null;
  private DecimalField fieldE66RCN = null;
  private DecimalField fieldE76RCN = null;
  private DecimalField fieldE86RCN = null;
  private DecimalField fieldE96RCN = null;
  private DecimalField fieldE06RCN = null;
  private DecimalField fieldEA6RCN = null;
  private DecimalField fieldEB6RCN = null;
  private DecimalField fieldEC6RCN = null;
  private DecimalField fieldED6RCN = null;
  private DecimalField fieldEE6RCN = null;
  private DecimalField fieldEF6RCN = null;
  private DecimalField fieldEG6RCN = null;
  private DecimalField fieldEH6RCN = null;
  private DecimalField fieldEI6RCN = null;
  private DecimalField fieldEJ6RCN = null;

  /**
  * Constructor for EWS001616Message.
  */
  public EWS001616Message()
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
    recordsize = 2901;
    fileid = fid;
    recordid = rid;
    message = new byte[getByteLength()];
    formatname = fmtname;
    fieldnames = fldnames;
    tagnames = tnames;
    fields = new MessageField[FIELDCOUNT];

    fields[0] = fieldH16USR =
    new CharacterField(message, HEADERSIZE + 0, 10, "H16USR");
    fields[1] = fieldH16PGM =
    new CharacterField(message, HEADERSIZE + 10, 10, "H16PGM");
    fields[2] = fieldH16TIM =
    new CharacterField(message, HEADERSIZE + 20, 12, "H16TIM");
    fields[3] = fieldH16SCR =
    new CharacterField(message, HEADERSIZE + 32, 2, "H16SCR");
    fields[4] = fieldH16OPE =
    new CharacterField(message, HEADERSIZE + 34, 4, "H16OPE");
    fields[5] = fieldH16MAS =
    new CharacterField(message, HEADERSIZE + 38, 1, "H16MAS");
    fields[6] = fieldH16WK1 =
    new CharacterField(message, HEADERSIZE + 39, 1, "H16WK1");
    fields[7] = fieldH16WK2 =
    new CharacterField(message, HEADERSIZE + 40, 1, "H16WK2");
    fields[8] = fieldH16WK3 =
    new CharacterField(message, HEADERSIZE + 41, 1, "H16WK3");
    fields[9] = fieldE16ACD =
    new CharacterField(message, HEADERSIZE + 42, 2, "E16ACD");
    fields[10] = fieldE16ACC =
    new DecimalField(message, HEADERSIZE + 44, 13, 0, "E16ACC");
    fields[11] = fieldE16SEQ =
    new DecimalField(message, HEADERSIZE + 57, 4, 0, "E16SEQ");
    fields[12] = fieldE16DSC =
    new CharacterField(message, HEADERSIZE + 61, 132, "E16DSC");
    fields[13] = fieldE26DSC =
    new CharacterField(message, HEADERSIZE + 193, 132, "E26DSC");
    fields[14] = fieldE36DSC =
    new CharacterField(message, HEADERSIZE + 325, 132, "E36DSC");
    fields[15] = fieldE46DSC =
    new CharacterField(message, HEADERSIZE + 457, 132, "E46DSC");
    fields[16] = fieldE56DSC =
    new CharacterField(message, HEADERSIZE + 589, 132, "E56DSC");
    fields[17] = fieldE66DSC =
    new CharacterField(message, HEADERSIZE + 721, 132, "E66DSC");
    fields[18] = fieldE76DSC =
    new CharacterField(message, HEADERSIZE + 853, 132, "E76DSC");
    fields[19] = fieldE86DSC =
    new CharacterField(message, HEADERSIZE + 985, 132, "E86DSC");
    fields[20] = fieldE96DSC =
    new CharacterField(message, HEADERSIZE + 1117, 132, "E96DSC");
    fields[21] = fieldE06DSC =
    new CharacterField(message, HEADERSIZE + 1249, 132, "E06DSC");
    fields[22] = fieldEA6DSC =
    new CharacterField(message, HEADERSIZE + 1381, 132, "EA6DSC");
    fields[23] = fieldEB6DSC =
    new CharacterField(message, HEADERSIZE + 1513, 132, "EB6DSC");
    fields[24] = fieldEC6DSC =
    new CharacterField(message, HEADERSIZE + 1645, 132, "EC6DSC");
    fields[25] = fieldED6DSC =
    new CharacterField(message, HEADERSIZE + 1777, 132, "ED6DSC");
    fields[26] = fieldEE6DSC =
    new CharacterField(message, HEADERSIZE + 1909, 132, "EE6DSC");
    fields[27] = fieldEF6DSC =
    new CharacterField(message, HEADERSIZE + 2041, 132, "EF6DSC");
    fields[28] = fieldEG6DSC =
    new CharacterField(message, HEADERSIZE + 2173, 132, "EG6DSC");
    fields[29] = fieldEH6DSC =
    new CharacterField(message, HEADERSIZE + 2305, 132, "EH6DSC");
    fields[30] = fieldEI6DSC =
    new CharacterField(message, HEADERSIZE + 2437, 132, "EI6DSC");
    fields[31] = fieldEJ6DSC =
    new CharacterField(message, HEADERSIZE + 2569, 132, "EJ6DSC");
    fields[32] = fieldE16RCN =
    new DecimalField(message, HEADERSIZE + 2701, 10, 0, "E16RCN");
    fields[33] = fieldE26RCN =
    new DecimalField(message, HEADERSIZE + 2711, 10, 0, "E26RCN");
    fields[34] = fieldE36RCN =
    new DecimalField(message, HEADERSIZE + 2721, 10, 0, "E36RCN");
    fields[35] = fieldE46RCN =
    new DecimalField(message, HEADERSIZE + 2731, 10, 0, "E46RCN");
    fields[36] = fieldE56RCN =
    new DecimalField(message, HEADERSIZE + 2741, 10, 0, "E56RCN");
    fields[37] = fieldE66RCN =
    new DecimalField(message, HEADERSIZE + 2751, 10, 0, "E66RCN");
    fields[38] = fieldE76RCN =
    new DecimalField(message, HEADERSIZE + 2761, 10, 0, "E76RCN");
    fields[39] = fieldE86RCN =
    new DecimalField(message, HEADERSIZE + 2771, 10, 0, "E86RCN");
    fields[40] = fieldE96RCN =
    new DecimalField(message, HEADERSIZE + 2781, 10, 0, "E96RCN");
    fields[41] = fieldE06RCN =
    new DecimalField(message, HEADERSIZE + 2791, 10, 0, "E06RCN");
    fields[42] = fieldEA6RCN =
    new DecimalField(message, HEADERSIZE + 2801, 10, 0, "EA6RCN");
    fields[43] = fieldEB6RCN =
    new DecimalField(message, HEADERSIZE + 2811, 10, 0, "EB6RCN");
    fields[44] = fieldEC6RCN =
    new DecimalField(message, HEADERSIZE + 2821, 10, 0, "EC6RCN");
    fields[45] = fieldED6RCN =
    new DecimalField(message, HEADERSIZE + 2831, 10, 0, "ED6RCN");
    fields[46] = fieldEE6RCN =
    new DecimalField(message, HEADERSIZE + 2841, 10, 0, "EE6RCN");
    fields[47] = fieldEF6RCN =
    new DecimalField(message, HEADERSIZE + 2851, 10, 0, "EF6RCN");
    fields[48] = fieldEG6RCN =
    new DecimalField(message, HEADERSIZE + 2861, 10, 0, "EG6RCN");
    fields[49] = fieldEH6RCN =
    new DecimalField(message, HEADERSIZE + 2871, 10, 0, "EH6RCN");
    fields[50] = fieldEI6RCN =
    new DecimalField(message, HEADERSIZE + 2881, 10, 0, "EI6RCN");
    fields[51] = fieldEJ6RCN =
    new DecimalField(message, HEADERSIZE + 2891, 10, 0, "EJ6RCN");

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
  * Set field H16USR using a String value.
  */
  public void setH16USR(String newvalue)
  {
    fieldH16USR.setString(newvalue);
  }

  /**
  * Get value of field H16USR as a String.
  */
  public String getH16USR()
  {
    return fieldH16USR.getString();
  }

  /**
  * Set field H16PGM using a String value.
  */
  public void setH16PGM(String newvalue)
  {
    fieldH16PGM.setString(newvalue);
  }

  /**
  * Get value of field H16PGM as a String.
  */
  public String getH16PGM()
  {
    return fieldH16PGM.getString();
  }

  /**
  * Set field H16TIM using a String value.
  */
  public void setH16TIM(String newvalue)
  {
    fieldH16TIM.setString(newvalue);
  }

  /**
  * Get value of field H16TIM as a String.
  */
  public String getH16TIM()
  {
    return fieldH16TIM.getString();
  }

  /**
  * Set field H16SCR using a String value.
  */
  public void setH16SCR(String newvalue)
  {
    fieldH16SCR.setString(newvalue);
  }

  /**
  * Get value of field H16SCR as a String.
  */
  public String getH16SCR()
  {
    return fieldH16SCR.getString();
  }

  /**
  * Set field H16OPE using a String value.
  */
  public void setH16OPE(String newvalue)
  {
    fieldH16OPE.setString(newvalue);
  }

  /**
  * Get value of field H16OPE as a String.
  */
  public String getH16OPE()
  {
    return fieldH16OPE.getString();
  }

  /**
  * Set field H16MAS using a String value.
  */
  public void setH16MAS(String newvalue)
  {
    fieldH16MAS.setString(newvalue);
  }

  /**
  * Get value of field H16MAS as a String.
  */
  public String getH16MAS()
  {
    return fieldH16MAS.getString();
  }

  /**
  * Set field H16WK1 using a String value.
  */
  public void setH16WK1(String newvalue)
  {
    fieldH16WK1.setString(newvalue);
  }

  /**
  * Get value of field H16WK1 as a String.
  */
  public String getH16WK1()
  {
    return fieldH16WK1.getString();
  }

  /**
  * Set field H16WK2 using a String value.
  */
  public void setH16WK2(String newvalue)
  {
    fieldH16WK2.setString(newvalue);
  }

  /**
  * Get value of field H16WK2 as a String.
  */
  public String getH16WK2()
  {
    return fieldH16WK2.getString();
  }

  /**
  * Set field H16WK3 using a String value.
  */
  public void setH16WK3(String newvalue)
  {
    fieldH16WK3.setString(newvalue);
  }

  /**
  * Get value of field H16WK3 as a String.
  */
  public String getH16WK3()
  {
    return fieldH16WK3.getString();
  }

  /**
  * Set field E16ACD using a String value.
  */
  public void setE16ACD(String newvalue)
  {
    fieldE16ACD.setString(newvalue);
  }

  /**
  * Get value of field E16ACD as a String.
  */
  public String getE16ACD()
  {
    return fieldE16ACD.getString();
  }

  /**
  * Set field E16ACC using a String value.
  */
  public void setE16ACC(String newvalue)
  {
    fieldE16ACC.setString(newvalue);
  }

  /**
  * Get value of field E16ACC as a String.
  */
  public String getE16ACC()
  {
    return fieldE16ACC.getString();
  }

  /**
  * Set numeric field E16ACC using a BigDecimal value.
  */
  public void setE16ACC(BigDecimal newvalue)
  {
    fieldE16ACC.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E16ACC as a BigDecimal.
  */
  public BigDecimal getBigDecimalE16ACC()
  {
    return fieldE16ACC.getBigDecimal();
  }

  /**
  * Set field E16SEQ using a String value.
  */
  public void setE16SEQ(String newvalue)
  {
    fieldE16SEQ.setString(newvalue);
  }

  /**
  * Get value of field E16SEQ as a String.
  */
  public String getE16SEQ()
  {
    return fieldE16SEQ.getString();
  }

  /**
  * Set numeric field E16SEQ using a BigDecimal value.
  */
  public void setE16SEQ(BigDecimal newvalue)
  {
    fieldE16SEQ.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E16SEQ as a BigDecimal.
  */
  public BigDecimal getBigDecimalE16SEQ()
  {
    return fieldE16SEQ.getBigDecimal();
  }

  /**
  * Set field E16DSC using a String value.
  */
  public void setE16DSC(String newvalue)
  {
    fieldE16DSC.setString(newvalue);
  }

  /**
  * Get value of field E16DSC as a String.
  */
  public String getE16DSC()
  {
    return fieldE16DSC.getString();
  }

  /**
  * Set field E26DSC using a String value.
  */
  public void setE26DSC(String newvalue)
  {
    fieldE26DSC.setString(newvalue);
  }

  /**
  * Get value of field E26DSC as a String.
  */
  public String getE26DSC()
  {
    return fieldE26DSC.getString();
  }

  /**
  * Set field E36DSC using a String value.
  */
  public void setE36DSC(String newvalue)
  {
    fieldE36DSC.setString(newvalue);
  }

  /**
  * Get value of field E36DSC as a String.
  */
  public String getE36DSC()
  {
    return fieldE36DSC.getString();
  }

  /**
  * Set field E46DSC using a String value.
  */
  public void setE46DSC(String newvalue)
  {
    fieldE46DSC.setString(newvalue);
  }

  /**
  * Get value of field E46DSC as a String.
  */
  public String getE46DSC()
  {
    return fieldE46DSC.getString();
  }

  /**
  * Set field E56DSC using a String value.
  */
  public void setE56DSC(String newvalue)
  {
    fieldE56DSC.setString(newvalue);
  }

  /**
  * Get value of field E56DSC as a String.
  */
  public String getE56DSC()
  {
    return fieldE56DSC.getString();
  }

  /**
  * Set field E66DSC using a String value.
  */
  public void setE66DSC(String newvalue)
  {
    fieldE66DSC.setString(newvalue);
  }

  /**
  * Get value of field E66DSC as a String.
  */
  public String getE66DSC()
  {
    return fieldE66DSC.getString();
  }

  /**
  * Set field E76DSC using a String value.
  */
  public void setE76DSC(String newvalue)
  {
    fieldE76DSC.setString(newvalue);
  }

  /**
  * Get value of field E76DSC as a String.
  */
  public String getE76DSC()
  {
    return fieldE76DSC.getString();
  }

  /**
  * Set field E86DSC using a String value.
  */
  public void setE86DSC(String newvalue)
  {
    fieldE86DSC.setString(newvalue);
  }

  /**
  * Get value of field E86DSC as a String.
  */
  public String getE86DSC()
  {
    return fieldE86DSC.getString();
  }

  /**
  * Set field E96DSC using a String value.
  */
  public void setE96DSC(String newvalue)
  {
    fieldE96DSC.setString(newvalue);
  }

  /**
  * Get value of field E96DSC as a String.
  */
  public String getE96DSC()
  {
    return fieldE96DSC.getString();
  }

  /**
  * Set field E06DSC using a String value.
  */
  public void setE06DSC(String newvalue)
  {
    fieldE06DSC.setString(newvalue);
  }

  /**
  * Get value of field E06DSC as a String.
  */
  public String getE06DSC()
  {
    return fieldE06DSC.getString();
  }

  /**
  * Set field EA6DSC using a String value.
  */
  public void setEA6DSC(String newvalue)
  {
    fieldEA6DSC.setString(newvalue);
  }

  /**
  * Get value of field EA6DSC as a String.
  */
  public String getEA6DSC()
  {
    return fieldEA6DSC.getString();
  }

  /**
  * Set field EB6DSC using a String value.
  */
  public void setEB6DSC(String newvalue)
  {
    fieldEB6DSC.setString(newvalue);
  }

  /**
  * Get value of field EB6DSC as a String.
  */
  public String getEB6DSC()
  {
    return fieldEB6DSC.getString();
  }

  /**
  * Set field EC6DSC using a String value.
  */
  public void setEC6DSC(String newvalue)
  {
    fieldEC6DSC.setString(newvalue);
  }

  /**
  * Get value of field EC6DSC as a String.
  */
  public String getEC6DSC()
  {
    return fieldEC6DSC.getString();
  }

  /**
  * Set field ED6DSC using a String value.
  */
  public void setED6DSC(String newvalue)
  {
    fieldED6DSC.setString(newvalue);
  }

  /**
  * Get value of field ED6DSC as a String.
  */
  public String getED6DSC()
  {
    return fieldED6DSC.getString();
  }

  /**
  * Set field EE6DSC using a String value.
  */
  public void setEE6DSC(String newvalue)
  {
    fieldEE6DSC.setString(newvalue);
  }

  /**
  * Get value of field EE6DSC as a String.
  */
  public String getEE6DSC()
  {
    return fieldEE6DSC.getString();
  }

  /**
  * Set field EF6DSC using a String value.
  */
  public void setEF6DSC(String newvalue)
  {
    fieldEF6DSC.setString(newvalue);
  }

  /**
  * Get value of field EF6DSC as a String.
  */
  public String getEF6DSC()
  {
    return fieldEF6DSC.getString();
  }

  /**
  * Set field EG6DSC using a String value.
  */
  public void setEG6DSC(String newvalue)
  {
    fieldEG6DSC.setString(newvalue);
  }

  /**
  * Get value of field EG6DSC as a String.
  */
  public String getEG6DSC()
  {
    return fieldEG6DSC.getString();
  }

  /**
  * Set field EH6DSC using a String value.
  */
  public void setEH6DSC(String newvalue)
  {
    fieldEH6DSC.setString(newvalue);
  }

  /**
  * Get value of field EH6DSC as a String.
  */
  public String getEH6DSC()
  {
    return fieldEH6DSC.getString();
  }

  /**
  * Set field EI6DSC using a String value.
  */
  public void setEI6DSC(String newvalue)
  {
    fieldEI6DSC.setString(newvalue);
  }

  /**
  * Get value of field EI6DSC as a String.
  */
  public String getEI6DSC()
  {
    return fieldEI6DSC.getString();
  }

  /**
  * Set field EJ6DSC using a String value.
  */
  public void setEJ6DSC(String newvalue)
  {
    fieldEJ6DSC.setString(newvalue);
  }

  /**
  * Get value of field EJ6DSC as a String.
  */
  public String getEJ6DSC()
  {
    return fieldEJ6DSC.getString();
  }

  /**
  * Set field E16RCN using a String value.
  */
  public void setE16RCN(String newvalue)
  {
    fieldE16RCN.setString(newvalue);
  }

  /**
  * Get value of field E16RCN as a String.
  */
  public String getE16RCN()
  {
    return fieldE16RCN.getString();
  }

  /**
  * Set numeric field E16RCN using a BigDecimal value.
  */
  public void setE16RCN(BigDecimal newvalue)
  {
    fieldE16RCN.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E16RCN as a BigDecimal.
  */
  public BigDecimal getBigDecimalE16RCN()
  {
    return fieldE16RCN.getBigDecimal();
  }

  /**
  * Set field E26RCN using a String value.
  */
  public void setE26RCN(String newvalue)
  {
    fieldE26RCN.setString(newvalue);
  }

  /**
  * Get value of field E26RCN as a String.
  */
  public String getE26RCN()
  {
    return fieldE26RCN.getString();
  }

  /**
  * Set numeric field E26RCN using a BigDecimal value.
  */
  public void setE26RCN(BigDecimal newvalue)
  {
    fieldE26RCN.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E26RCN as a BigDecimal.
  */
  public BigDecimal getBigDecimalE26RCN()
  {
    return fieldE26RCN.getBigDecimal();
  }

  /**
  * Set field E36RCN using a String value.
  */
  public void setE36RCN(String newvalue)
  {
    fieldE36RCN.setString(newvalue);
  }

  /**
  * Get value of field E36RCN as a String.
  */
  public String getE36RCN()
  {
    return fieldE36RCN.getString();
  }

  /**
  * Set numeric field E36RCN using a BigDecimal value.
  */
  public void setE36RCN(BigDecimal newvalue)
  {
    fieldE36RCN.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E36RCN as a BigDecimal.
  */
  public BigDecimal getBigDecimalE36RCN()
  {
    return fieldE36RCN.getBigDecimal();
  }

  /**
  * Set field E46RCN using a String value.
  */
  public void setE46RCN(String newvalue)
  {
    fieldE46RCN.setString(newvalue);
  }

  /**
  * Get value of field E46RCN as a String.
  */
  public String getE46RCN()
  {
    return fieldE46RCN.getString();
  }

  /**
  * Set numeric field E46RCN using a BigDecimal value.
  */
  public void setE46RCN(BigDecimal newvalue)
  {
    fieldE46RCN.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E46RCN as a BigDecimal.
  */
  public BigDecimal getBigDecimalE46RCN()
  {
    return fieldE46RCN.getBigDecimal();
  }

  /**
  * Set field E56RCN using a String value.
  */
  public void setE56RCN(String newvalue)
  {
    fieldE56RCN.setString(newvalue);
  }

  /**
  * Get value of field E56RCN as a String.
  */
  public String getE56RCN()
  {
    return fieldE56RCN.getString();
  }

  /**
  * Set numeric field E56RCN using a BigDecimal value.
  */
  public void setE56RCN(BigDecimal newvalue)
  {
    fieldE56RCN.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E56RCN as a BigDecimal.
  */
  public BigDecimal getBigDecimalE56RCN()
  {
    return fieldE56RCN.getBigDecimal();
  }

  /**
  * Set field E66RCN using a String value.
  */
  public void setE66RCN(String newvalue)
  {
    fieldE66RCN.setString(newvalue);
  }

  /**
  * Get value of field E66RCN as a String.
  */
  public String getE66RCN()
  {
    return fieldE66RCN.getString();
  }

  /**
  * Set numeric field E66RCN using a BigDecimal value.
  */
  public void setE66RCN(BigDecimal newvalue)
  {
    fieldE66RCN.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E66RCN as a BigDecimal.
  */
  public BigDecimal getBigDecimalE66RCN()
  {
    return fieldE66RCN.getBigDecimal();
  }

  /**
  * Set field E76RCN using a String value.
  */
  public void setE76RCN(String newvalue)
  {
    fieldE76RCN.setString(newvalue);
  }

  /**
  * Get value of field E76RCN as a String.
  */
  public String getE76RCN()
  {
    return fieldE76RCN.getString();
  }

  /**
  * Set numeric field E76RCN using a BigDecimal value.
  */
  public void setE76RCN(BigDecimal newvalue)
  {
    fieldE76RCN.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E76RCN as a BigDecimal.
  */
  public BigDecimal getBigDecimalE76RCN()
  {
    return fieldE76RCN.getBigDecimal();
  }

  /**
  * Set field E86RCN using a String value.
  */
  public void setE86RCN(String newvalue)
  {
    fieldE86RCN.setString(newvalue);
  }

  /**
  * Get value of field E86RCN as a String.
  */
  public String getE86RCN()
  {
    return fieldE86RCN.getString();
  }

  /**
  * Set numeric field E86RCN using a BigDecimal value.
  */
  public void setE86RCN(BigDecimal newvalue)
  {
    fieldE86RCN.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E86RCN as a BigDecimal.
  */
  public BigDecimal getBigDecimalE86RCN()
  {
    return fieldE86RCN.getBigDecimal();
  }

  /**
  * Set field E96RCN using a String value.
  */
  public void setE96RCN(String newvalue)
  {
    fieldE96RCN.setString(newvalue);
  }

  /**
  * Get value of field E96RCN as a String.
  */
  public String getE96RCN()
  {
    return fieldE96RCN.getString();
  }

  /**
  * Set numeric field E96RCN using a BigDecimal value.
  */
  public void setE96RCN(BigDecimal newvalue)
  {
    fieldE96RCN.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E96RCN as a BigDecimal.
  */
  public BigDecimal getBigDecimalE96RCN()
  {
    return fieldE96RCN.getBigDecimal();
  }

  /**
  * Set field E06RCN using a String value.
  */
  public void setE06RCN(String newvalue)
  {
    fieldE06RCN.setString(newvalue);
  }

  /**
  * Get value of field E06RCN as a String.
  */
  public String getE06RCN()
  {
    return fieldE06RCN.getString();
  }

  /**
  * Set numeric field E06RCN using a BigDecimal value.
  */
  public void setE06RCN(BigDecimal newvalue)
  {
    fieldE06RCN.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E06RCN as a BigDecimal.
  */
  public BigDecimal getBigDecimalE06RCN()
  {
    return fieldE06RCN.getBigDecimal();
  }

  /**
  * Set field EA6RCN using a String value.
  */
  public void setEA6RCN(String newvalue)
  {
    fieldEA6RCN.setString(newvalue);
  }

  /**
  * Get value of field EA6RCN as a String.
  */
  public String getEA6RCN()
  {
    return fieldEA6RCN.getString();
  }

  /**
  * Set numeric field EA6RCN using a BigDecimal value.
  */
  public void setEA6RCN(BigDecimal newvalue)
  {
    fieldEA6RCN.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field EA6RCN as a BigDecimal.
  */
  public BigDecimal getBigDecimalEA6RCN()
  {
    return fieldEA6RCN.getBigDecimal();
  }

  /**
  * Set field EB6RCN using a String value.
  */
  public void setEB6RCN(String newvalue)
  {
    fieldEB6RCN.setString(newvalue);
  }

  /**
  * Get value of field EB6RCN as a String.
  */
  public String getEB6RCN()
  {
    return fieldEB6RCN.getString();
  }

  /**
  * Set numeric field EB6RCN using a BigDecimal value.
  */
  public void setEB6RCN(BigDecimal newvalue)
  {
    fieldEB6RCN.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field EB6RCN as a BigDecimal.
  */
  public BigDecimal getBigDecimalEB6RCN()
  {
    return fieldEB6RCN.getBigDecimal();
  }

  /**
  * Set field EC6RCN using a String value.
  */
  public void setEC6RCN(String newvalue)
  {
    fieldEC6RCN.setString(newvalue);
  }

  /**
  * Get value of field EC6RCN as a String.
  */
  public String getEC6RCN()
  {
    return fieldEC6RCN.getString();
  }

  /**
  * Set numeric field EC6RCN using a BigDecimal value.
  */
  public void setEC6RCN(BigDecimal newvalue)
  {
    fieldEC6RCN.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field EC6RCN as a BigDecimal.
  */
  public BigDecimal getBigDecimalEC6RCN()
  {
    return fieldEC6RCN.getBigDecimal();
  }

  /**
  * Set field ED6RCN using a String value.
  */
  public void setED6RCN(String newvalue)
  {
    fieldED6RCN.setString(newvalue);
  }

  /**
  * Get value of field ED6RCN as a String.
  */
  public String getED6RCN()
  {
    return fieldED6RCN.getString();
  }

  /**
  * Set numeric field ED6RCN using a BigDecimal value.
  */
  public void setED6RCN(BigDecimal newvalue)
  {
    fieldED6RCN.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field ED6RCN as a BigDecimal.
  */
  public BigDecimal getBigDecimalED6RCN()
  {
    return fieldED6RCN.getBigDecimal();
  }

  /**
  * Set field EE6RCN using a String value.
  */
  public void setEE6RCN(String newvalue)
  {
    fieldEE6RCN.setString(newvalue);
  }

  /**
  * Get value of field EE6RCN as a String.
  */
  public String getEE6RCN()
  {
    return fieldEE6RCN.getString();
  }

  /**
  * Set numeric field EE6RCN using a BigDecimal value.
  */
  public void setEE6RCN(BigDecimal newvalue)
  {
    fieldEE6RCN.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field EE6RCN as a BigDecimal.
  */
  public BigDecimal getBigDecimalEE6RCN()
  {
    return fieldEE6RCN.getBigDecimal();
  }

  /**
  * Set field EF6RCN using a String value.
  */
  public void setEF6RCN(String newvalue)
  {
    fieldEF6RCN.setString(newvalue);
  }

  /**
  * Get value of field EF6RCN as a String.
  */
  public String getEF6RCN()
  {
    return fieldEF6RCN.getString();
  }

  /**
  * Set numeric field EF6RCN using a BigDecimal value.
  */
  public void setEF6RCN(BigDecimal newvalue)
  {
    fieldEF6RCN.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field EF6RCN as a BigDecimal.
  */
  public BigDecimal getBigDecimalEF6RCN()
  {
    return fieldEF6RCN.getBigDecimal();
  }

  /**
  * Set field EG6RCN using a String value.
  */
  public void setEG6RCN(String newvalue)
  {
    fieldEG6RCN.setString(newvalue);
  }

  /**
  * Get value of field EG6RCN as a String.
  */
  public String getEG6RCN()
  {
    return fieldEG6RCN.getString();
  }

  /**
  * Set numeric field EG6RCN using a BigDecimal value.
  */
  public void setEG6RCN(BigDecimal newvalue)
  {
    fieldEG6RCN.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field EG6RCN as a BigDecimal.
  */
  public BigDecimal getBigDecimalEG6RCN()
  {
    return fieldEG6RCN.getBigDecimal();
  }

  /**
  * Set field EH6RCN using a String value.
  */
  public void setEH6RCN(String newvalue)
  {
    fieldEH6RCN.setString(newvalue);
  }

  /**
  * Get value of field EH6RCN as a String.
  */
  public String getEH6RCN()
  {
    return fieldEH6RCN.getString();
  }

  /**
  * Set numeric field EH6RCN using a BigDecimal value.
  */
  public void setEH6RCN(BigDecimal newvalue)
  {
    fieldEH6RCN.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field EH6RCN as a BigDecimal.
  */
  public BigDecimal getBigDecimalEH6RCN()
  {
    return fieldEH6RCN.getBigDecimal();
  }

  /**
  * Set field EI6RCN using a String value.
  */
  public void setEI6RCN(String newvalue)
  {
    fieldEI6RCN.setString(newvalue);
  }

  /**
  * Get value of field EI6RCN as a String.
  */
  public String getEI6RCN()
  {
    return fieldEI6RCN.getString();
  }

  /**
  * Set numeric field EI6RCN using a BigDecimal value.
  */
  public void setEI6RCN(BigDecimal newvalue)
  {
    fieldEI6RCN.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field EI6RCN as a BigDecimal.
  */
  public BigDecimal getBigDecimalEI6RCN()
  {
    return fieldEI6RCN.getBigDecimal();
  }

  /**
  * Set field EJ6RCN using a String value.
  */
  public void setEJ6RCN(String newvalue)
  {
    fieldEJ6RCN.setString(newvalue);
  }

  /**
  * Get value of field EJ6RCN as a String.
  */
  public String getEJ6RCN()
  {
    return fieldEJ6RCN.getString();
  }

  /**
  * Set numeric field EJ6RCN using a BigDecimal value.
  */
  public void setEJ6RCN(BigDecimal newvalue)
  {
    fieldEJ6RCN.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field EJ6RCN as a BigDecimal.
  */
  public BigDecimal getBigDecimalEJ6RCN()
  {
    return fieldEJ6RCN.getBigDecimal();
  }

}