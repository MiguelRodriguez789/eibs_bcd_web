package datapro.eibs.beans;

import datapro.eibs.sockets.*;
import java.io.*;
import java.math.*;

import java.util.*;

/**
* Class generated by AS/400 CRTCLASS command from ESD008003 physical file definition.
* 
* File level identifier is 1151005060624.
* Record format level identifier is 3793D645E60CA.
*/

public class ESD008003Message extends MessageRecord
{
  final static String fldnames[] = {
                                     "H03USR",
                                     "H03PGM",
                                     "H03TIM",
                                     "H03SCR",
                                     "H03OPE",
                                     "H03MAS",
                                     "H03WK1",
                                     "H03WK2",
                                     "H03WK3",
                                     "E03CUN",
                                     "E03OFC",
                                     "E03OF2",
                                     "E03INC",
                                     "E03BUC",
                                     "E03GEC",
                                     "E03UC1",
                                     "E03UC2",
                                     "E03UC3",
                                     "E03UC4",
                                     "E03UC5",
                                     "E03UC6",
                                     "E03UC7",
                                     "E03UC8",
                                     "E03UC9",
                                     "E03SCH",
                                     "E03SST",
                                     "E03FC4",
                                     "E03FC5",
                                     "D03OFC",
                                     "D03OF2",
                                     "D03INC",
                                     "D03BUC",
                                     "D03GEC",
                                     "D03UC1",
                                     "D03UC2",
                                     "D03UC3",
                                     "D03UC4",
                                     "D03UC5",
                                     "D03UC6",
                                     "D03UC7",
                                     "D03UC8",
                                     "D03UC9",
                                     "D03SCH",
                                     "D03SST",
                                     "D03FC4",
                                     "D03FC5",
                                     "F03CUN",
                                     "F03OFC",
                                     "F03OF2",
                                     "F03INC",
                                     "F03BUC",
                                     "F03GEC",
                                     "F03UC1",
                                     "F03UC2",
                                     "F03UC3",
                                     "F03UC4",
                                     "F03UC5",
                                     "F03UC6",
                                     "F03UC7",
                                     "F03UC8",
                                     "F03UC9",
                                     "F03SCH",
                                     "F03SST",
                                     "F03FC4",
                                     "F03FC5"
                                   };
  final static String tnames[] = {
                                   "H03USR",
                                   "H03PGM",
                                   "H03TIM",
                                   "H03SCR",
                                   "H03OPE",
                                   "H03MAS",
                                   "H03WK1",
                                   "H03WK2",
                                   "H03WK3",
                                   "E03CUN",
                                   "E03OFC",
                                   "E03OF2",
                                   "E03INC",
                                   "E03BUC",
                                   "E03GEC",
                                   "E03UC1",
                                   "E03UC2",
                                   "E03UC3",
                                   "E03UC4",
                                   "E03UC5",
                                   "E03UC6",
                                   "E03UC7",
                                   "E03UC8",
                                   "E03UC9",
                                   "E03SCH",
                                   "E03SST",
                                   "E03FC4",
                                   "E03FC5",
                                   "D03OFC",
                                   "D03OF2",
                                   "D03INC",
                                   "D03BUC",
                                   "D03GEC",
                                   "D03UC1",
                                   "D03UC2",
                                   "D03UC3",
                                   "D03UC4",
                                   "D03UC5",
                                   "D03UC6",
                                   "D03UC7",
                                   "D03UC8",
                                   "D03UC9",
                                   "D03SCH",
                                   "D03SST",
                                   "D03FC4",
                                   "D03FC5",
                                   "F03CUN",
                                   "F03OFC",
                                   "F03OF2",
                                   "F03INC",
                                   "F03BUC",
                                   "F03GEC",
                                   "F03UC1",
                                   "F03UC2",
                                   "F03UC3",
                                   "F03UC4",
                                   "F03UC5",
                                   "F03UC6",
                                   "F03UC7",
                                   "F03UC8",
                                   "F03UC9",
                                   "F03SCH",
                                   "F03SST",
                                   "F03FC4",
                                   "F03FC5"
                                 };
  final static String fid = "1151005060624";
  final static String rid = "3793D645E60CA";
  final static String fmtname = "ESD008003";
  final int FIELDCOUNT = 65;
  private static Hashtable tlookup = new Hashtable();
  private CharacterField fieldH03USR = null;
  private CharacterField fieldH03PGM = null;
  private CharacterField fieldH03TIM = null;
  private CharacterField fieldH03SCR = null;
  private CharacterField fieldH03OPE = null;
  private CharacterField fieldH03MAS = null;
  private CharacterField fieldH03WK1 = null;
  private CharacterField fieldH03WK2 = null;
  private CharacterField fieldH03WK3 = null;
  private DecimalField fieldE03CUN = null;
  private CharacterField fieldE03OFC = null;
  private CharacterField fieldE03OF2 = null;
  private CharacterField fieldE03INC = null;
  private CharacterField fieldE03BUC = null;
  private CharacterField fieldE03GEC = null;
  private CharacterField fieldE03UC1 = null;
  private CharacterField fieldE03UC2 = null;
  private CharacterField fieldE03UC3 = null;
  private CharacterField fieldE03UC4 = null;
  private CharacterField fieldE03UC5 = null;
  private CharacterField fieldE03UC6 = null;
  private CharacterField fieldE03UC7 = null;
  private CharacterField fieldE03UC8 = null;
  private CharacterField fieldE03UC9 = null;
  private CharacterField fieldE03SCH = null;
  private CharacterField fieldE03SST = null;
  private CharacterField fieldE03FC4 = null;
  private CharacterField fieldE03FC5 = null;
  private CharacterField fieldD03OFC = null;
  private CharacterField fieldD03OF2 = null;
  private CharacterField fieldD03INC = null;
  private CharacterField fieldD03BUC = null;
  private CharacterField fieldD03GEC = null;
  private CharacterField fieldD03UC1 = null;
  private CharacterField fieldD03UC2 = null;
  private CharacterField fieldD03UC3 = null;
  private CharacterField fieldD03UC4 = null;
  private CharacterField fieldD03UC5 = null;
  private CharacterField fieldD03UC6 = null;
  private CharacterField fieldD03UC7 = null;
  private CharacterField fieldD03UC8 = null;
  private CharacterField fieldD03UC9 = null;
  private CharacterField fieldD03SCH = null;
  private CharacterField fieldD03SST = null;
  private CharacterField fieldD03FC4 = null;
  private CharacterField fieldD03FC5 = null;
  private CharacterField fieldF03CUN = null;
  private CharacterField fieldF03OFC = null;
  private CharacterField fieldF03OF2 = null;
  private CharacterField fieldF03INC = null;
  private CharacterField fieldF03BUC = null;
  private CharacterField fieldF03GEC = null;
  private CharacterField fieldF03UC1 = null;
  private CharacterField fieldF03UC2 = null;
  private CharacterField fieldF03UC3 = null;
  private CharacterField fieldF03UC4 = null;
  private CharacterField fieldF03UC5 = null;
  private CharacterField fieldF03UC6 = null;
  private CharacterField fieldF03UC7 = null;
  private CharacterField fieldF03UC8 = null;
  private CharacterField fieldF03UC9 = null;
  private CharacterField fieldF03SCH = null;
  private CharacterField fieldF03SST = null;
  private CharacterField fieldF03FC4 = null;
  private CharacterField fieldF03FC5 = null;

  /**
  * Constructor for ESD008003Message.
  */
  public ESD008003Message()
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
    recordsize = 957;
    fileid = fid;
    recordid = rid;
    message = new byte[getByteLength()];
    formatname = fmtname;
    fieldnames = fldnames;
    tagnames = tnames;
    fields = new MessageField[FIELDCOUNT];

    fields[0] = fieldH03USR =
    new CharacterField(message, HEADERSIZE + 0, 10, "H03USR");
    fields[1] = fieldH03PGM =
    new CharacterField(message, HEADERSIZE + 10, 10, "H03PGM");
    fields[2] = fieldH03TIM =
    new CharacterField(message, HEADERSIZE + 20, 12, "H03TIM");
    fields[3] = fieldH03SCR =
    new CharacterField(message, HEADERSIZE + 32, 2, "H03SCR");
    fields[4] = fieldH03OPE =
    new CharacterField(message, HEADERSIZE + 34, 4, "H03OPE");
    fields[5] = fieldH03MAS =
    new CharacterField(message, HEADERSIZE + 38, 1, "H03MAS");
    fields[6] = fieldH03WK1 =
    new CharacterField(message, HEADERSIZE + 39, 1, "H03WK1");
    fields[7] = fieldH03WK2 =
    new CharacterField(message, HEADERSIZE + 40, 1, "H03WK2");
    fields[8] = fieldH03WK3 =
    new CharacterField(message, HEADERSIZE + 41, 1, "H03WK3");
    fields[9] = fieldE03CUN =
    new DecimalField(message, HEADERSIZE + 42, 10, 0, "E03CUN");
    fields[10] = fieldE03OFC =
    new CharacterField(message, HEADERSIZE + 52, 4, "E03OFC");
    fields[11] = fieldE03OF2 =
    new CharacterField(message, HEADERSIZE + 56, 4, "E03OF2");
    fields[12] = fieldE03INC =
    new CharacterField(message, HEADERSIZE + 60, 4, "E03INC");
    fields[13] = fieldE03BUC =
    new CharacterField(message, HEADERSIZE + 64, 4, "E03BUC");
    fields[14] = fieldE03GEC =
    new CharacterField(message, HEADERSIZE + 68, 4, "E03GEC");
    fields[15] = fieldE03UC1 =
    new CharacterField(message, HEADERSIZE + 72, 4, "E03UC1");
    fields[16] = fieldE03UC2 =
    new CharacterField(message, HEADERSIZE + 76, 4, "E03UC2");
    fields[17] = fieldE03UC3 =
    new CharacterField(message, HEADERSIZE + 80, 4, "E03UC3");
    fields[18] = fieldE03UC4 =
    new CharacterField(message, HEADERSIZE + 84, 6, "E03UC4");
    fields[19] = fieldE03UC5 =
    new CharacterField(message, HEADERSIZE + 90, 4, "E03UC5");
    fields[20] = fieldE03UC6 =
    new CharacterField(message, HEADERSIZE + 94, 4, "E03UC6");
    fields[21] = fieldE03UC7 =
    new CharacterField(message, HEADERSIZE + 98, 4, "E03UC7");
    fields[22] = fieldE03UC8 =
    new CharacterField(message, HEADERSIZE + 102, 4, "E03UC8");
    fields[23] = fieldE03UC9 =
    new CharacterField(message, HEADERSIZE + 106, 4, "E03UC9");
    fields[24] = fieldE03SCH =
    new CharacterField(message, HEADERSIZE + 110, 4, "E03SCH");
    fields[25] = fieldE03SST =
    new CharacterField(message, HEADERSIZE + 114, 4, "E03SST");
    fields[26] = fieldE03FC4 =
    new CharacterField(message, HEADERSIZE + 118, 6, "E03FC4");
    fields[27] = fieldE03FC5 =
    new CharacterField(message, HEADERSIZE + 124, 4, "E03FC5");
    fields[28] = fieldD03OFC =
    new CharacterField(message, HEADERSIZE + 128, 45, "D03OFC");
    fields[29] = fieldD03OF2 =
    new CharacterField(message, HEADERSIZE + 173, 45, "D03OF2");
    fields[30] = fieldD03INC =
    new CharacterField(message, HEADERSIZE + 218, 45, "D03INC");
    fields[31] = fieldD03BUC =
    new CharacterField(message, HEADERSIZE + 263, 45, "D03BUC");
    fields[32] = fieldD03GEC =
    new CharacterField(message, HEADERSIZE + 308, 45, "D03GEC");
    fields[33] = fieldD03UC1 =
    new CharacterField(message, HEADERSIZE + 353, 45, "D03UC1");
    fields[34] = fieldD03UC2 =
    new CharacterField(message, HEADERSIZE + 398, 45, "D03UC2");
    fields[35] = fieldD03UC3 =
    new CharacterField(message, HEADERSIZE + 443, 45, "D03UC3");
    fields[36] = fieldD03UC4 =
    new CharacterField(message, HEADERSIZE + 488, 45, "D03UC4");
    fields[37] = fieldD03UC5 =
    new CharacterField(message, HEADERSIZE + 533, 45, "D03UC5");
    fields[38] = fieldD03UC6 =
    new CharacterField(message, HEADERSIZE + 578, 45, "D03UC6");
    fields[39] = fieldD03UC7 =
    new CharacterField(message, HEADERSIZE + 623, 45, "D03UC7");
    fields[40] = fieldD03UC8 =
    new CharacterField(message, HEADERSIZE + 668, 45, "D03UC8");
    fields[41] = fieldD03UC9 =
    new CharacterField(message, HEADERSIZE + 713, 45, "D03UC9");
    fields[42] = fieldD03SCH =
    new CharacterField(message, HEADERSIZE + 758, 45, "D03SCH");
    fields[43] = fieldD03SST =
    new CharacterField(message, HEADERSIZE + 803, 45, "D03SST");
    fields[44] = fieldD03FC4 =
    new CharacterField(message, HEADERSIZE + 848, 45, "D03FC4");
    fields[45] = fieldD03FC5 =
    new CharacterField(message, HEADERSIZE + 893, 45, "D03FC5");
    fields[46] = fieldF03CUN =
    new CharacterField(message, HEADERSIZE + 938, 1, "F03CUN");
    fields[47] = fieldF03OFC =
    new CharacterField(message, HEADERSIZE + 939, 1, "F03OFC");
    fields[48] = fieldF03OF2 =
    new CharacterField(message, HEADERSIZE + 940, 1, "F03OF2");
    fields[49] = fieldF03INC =
    new CharacterField(message, HEADERSIZE + 941, 1, "F03INC");
    fields[50] = fieldF03BUC =
    new CharacterField(message, HEADERSIZE + 942, 1, "F03BUC");
    fields[51] = fieldF03GEC =
    new CharacterField(message, HEADERSIZE + 943, 1, "F03GEC");
    fields[52] = fieldF03UC1 =
    new CharacterField(message, HEADERSIZE + 944, 1, "F03UC1");
    fields[53] = fieldF03UC2 =
    new CharacterField(message, HEADERSIZE + 945, 1, "F03UC2");
    fields[54] = fieldF03UC3 =
    new CharacterField(message, HEADERSIZE + 946, 1, "F03UC3");
    fields[55] = fieldF03UC4 =
    new CharacterField(message, HEADERSIZE + 947, 1, "F03UC4");
    fields[56] = fieldF03UC5 =
    new CharacterField(message, HEADERSIZE + 948, 1, "F03UC5");
    fields[57] = fieldF03UC6 =
    new CharacterField(message, HEADERSIZE + 949, 1, "F03UC6");
    fields[58] = fieldF03UC7 =
    new CharacterField(message, HEADERSIZE + 950, 1, "F03UC7");
    fields[59] = fieldF03UC8 =
    new CharacterField(message, HEADERSIZE + 951, 1, "F03UC8");
    fields[60] = fieldF03UC9 =
    new CharacterField(message, HEADERSIZE + 952, 1, "F03UC9");
    fields[61] = fieldF03SCH =
    new CharacterField(message, HEADERSIZE + 953, 1, "F03SCH");
    fields[62] = fieldF03SST =
    new CharacterField(message, HEADERSIZE + 954, 1, "F03SST");
    fields[63] = fieldF03FC4 =
    new CharacterField(message, HEADERSIZE + 955, 1, "F03FC4");
    fields[64] = fieldF03FC5 =
    new CharacterField(message, HEADERSIZE + 956, 1, "F03FC5");

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
  * Set field H03USR using a String value.
  */
  public void setH03USR(String newvalue)
  {
    fieldH03USR.setString(newvalue);
  }

  /**
  * Get value of field H03USR as a String.
  */
  public String getH03USR()
  {
    return fieldH03USR.getString();
  }

  /**
  * Set field H03PGM using a String value.
  */
  public void setH03PGM(String newvalue)
  {
    fieldH03PGM.setString(newvalue);
  }

  /**
  * Get value of field H03PGM as a String.
  */
  public String getH03PGM()
  {
    return fieldH03PGM.getString();
  }

  /**
  * Set field H03TIM using a String value.
  */
  public void setH03TIM(String newvalue)
  {
    fieldH03TIM.setString(newvalue);
  }

  /**
  * Get value of field H03TIM as a String.
  */
  public String getH03TIM()
  {
    return fieldH03TIM.getString();
  }

  /**
  * Set field H03SCR using a String value.
  */
  public void setH03SCR(String newvalue)
  {
    fieldH03SCR.setString(newvalue);
  }

  /**
  * Get value of field H03SCR as a String.
  */
  public String getH03SCR()
  {
    return fieldH03SCR.getString();
  }

  /**
  * Set field H03OPE using a String value.
  */
  public void setH03OPE(String newvalue)
  {
    fieldH03OPE.setString(newvalue);
  }

  /**
  * Get value of field H03OPE as a String.
  */
  public String getH03OPE()
  {
    return fieldH03OPE.getString();
  }

  /**
  * Set field H03MAS using a String value.
  */
  public void setH03MAS(String newvalue)
  {
    fieldH03MAS.setString(newvalue);
  }

  /**
  * Get value of field H03MAS as a String.
  */
  public String getH03MAS()
  {
    return fieldH03MAS.getString();
  }

  /**
  * Set field H03WK1 using a String value.
  */
  public void setH03WK1(String newvalue)
  {
    fieldH03WK1.setString(newvalue);
  }

  /**
  * Get value of field H03WK1 as a String.
  */
  public String getH03WK1()
  {
    return fieldH03WK1.getString();
  }

  /**
  * Set field H03WK2 using a String value.
  */
  public void setH03WK2(String newvalue)
  {
    fieldH03WK2.setString(newvalue);
  }

  /**
  * Get value of field H03WK2 as a String.
  */
  public String getH03WK2()
  {
    return fieldH03WK2.getString();
  }

  /**
  * Set field H03WK3 using a String value.
  */
  public void setH03WK3(String newvalue)
  {
    fieldH03WK3.setString(newvalue);
  }

  /**
  * Get value of field H03WK3 as a String.
  */
  public String getH03WK3()
  {
    return fieldH03WK3.getString();
  }

  /**
  * Set field E03CUN using a String value.
  */
  public void setE03CUN(String newvalue)
  {
    fieldE03CUN.setString(newvalue);
  }

  /**
  * Get value of field E03CUN as a String.
  */
  public String getE03CUN()
  {
    return fieldE03CUN.getString();
  }

  /**
  * Set numeric field E03CUN using a BigDecimal value.
  */
  public void setE03CUN(BigDecimal newvalue)
  {
    fieldE03CUN.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E03CUN as a BigDecimal.
  */
  public BigDecimal getBigDecimalE03CUN()
  {
    return fieldE03CUN.getBigDecimal();
  }

  /**
  * Set field E03OFC using a String value.
  */
  public void setE03OFC(String newvalue)
  {
    fieldE03OFC.setString(newvalue);
  }

  /**
  * Get value of field E03OFC as a String.
  */
  public String getE03OFC()
  {
    return fieldE03OFC.getString();
  }

  /**
  * Set field E03OF2 using a String value.
  */
  public void setE03OF2(String newvalue)
  {
    fieldE03OF2.setString(newvalue);
  }

  /**
  * Get value of field E03OF2 as a String.
  */
  public String getE03OF2()
  {
    return fieldE03OF2.getString();
  }

  /**
  * Set field E03INC using a String value.
  */
  public void setE03INC(String newvalue)
  {
    fieldE03INC.setString(newvalue);
  }

  /**
  * Get value of field E03INC as a String.
  */
  public String getE03INC()
  {
    return fieldE03INC.getString();
  }

  /**
  * Set field E03BUC using a String value.
  */
  public void setE03BUC(String newvalue)
  {
    fieldE03BUC.setString(newvalue);
  }

  /**
  * Get value of field E03BUC as a String.
  */
  public String getE03BUC()
  {
    return fieldE03BUC.getString();
  }

  /**
  * Set field E03GEC using a String value.
  */
  public void setE03GEC(String newvalue)
  {
    fieldE03GEC.setString(newvalue);
  }

  /**
  * Get value of field E03GEC as a String.
  */
  public String getE03GEC()
  {
    return fieldE03GEC.getString();
  }

  /**
  * Set field E03UC1 using a String value.
  */
  public void setE03UC1(String newvalue)
  {
    fieldE03UC1.setString(newvalue);
  }

  /**
  * Get value of field E03UC1 as a String.
  */
  public String getE03UC1()
  {
    return fieldE03UC1.getString();
  }

  /**
  * Set field E03UC2 using a String value.
  */
  public void setE03UC2(String newvalue)
  {
    fieldE03UC2.setString(newvalue);
  }

  /**
  * Get value of field E03UC2 as a String.
  */
  public String getE03UC2()
  {
    return fieldE03UC2.getString();
  }

  /**
  * Set field E03UC3 using a String value.
  */
  public void setE03UC3(String newvalue)
  {
    fieldE03UC3.setString(newvalue);
  }

  /**
  * Get value of field E03UC3 as a String.
  */
  public String getE03UC3()
  {
    return fieldE03UC3.getString();
  }

  /**
  * Set field E03UC4 using a String value.
  */
  public void setE03UC4(String newvalue)
  {
    fieldE03UC4.setString(newvalue);
  }

  /**
  * Get value of field E03UC4 as a String.
  */
  public String getE03UC4()
  {
    return fieldE03UC4.getString();
  }

  /**
  * Set field E03UC5 using a String value.
  */
  public void setE03UC5(String newvalue)
  {
    fieldE03UC5.setString(newvalue);
  }

  /**
  * Get value of field E03UC5 as a String.
  */
  public String getE03UC5()
  {
    return fieldE03UC5.getString();
  }

  /**
  * Set field E03UC6 using a String value.
  */
  public void setE03UC6(String newvalue)
  {
    fieldE03UC6.setString(newvalue);
  }

  /**
  * Get value of field E03UC6 as a String.
  */
  public String getE03UC6()
  {
    return fieldE03UC6.getString();
  }

  /**
  * Set field E03UC7 using a String value.
  */
  public void setE03UC7(String newvalue)
  {
    fieldE03UC7.setString(newvalue);
  }

  /**
  * Get value of field E03UC7 as a String.
  */
  public String getE03UC7()
  {
    return fieldE03UC7.getString();
  }

  /**
  * Set field E03UC8 using a String value.
  */
  public void setE03UC8(String newvalue)
  {
    fieldE03UC8.setString(newvalue);
  }

  /**
  * Get value of field E03UC8 as a String.
  */
  public String getE03UC8()
  {
    return fieldE03UC8.getString();
  }

  /**
  * Set field E03UC9 using a String value.
  */
  public void setE03UC9(String newvalue)
  {
    fieldE03UC9.setString(newvalue);
  }

  /**
  * Get value of field E03UC9 as a String.
  */
  public String getE03UC9()
  {
    return fieldE03UC9.getString();
  }

  /**
  * Set field E03SCH using a String value.
  */
  public void setE03SCH(String newvalue)
  {
    fieldE03SCH.setString(newvalue);
  }

  /**
  * Get value of field E03SCH as a String.
  */
  public String getE03SCH()
  {
    return fieldE03SCH.getString();
  }

  /**
  * Set field E03SST using a String value.
  */
  public void setE03SST(String newvalue)
  {
    fieldE03SST.setString(newvalue);
  }

  /**
  * Get value of field E03SST as a String.
  */
  public String getE03SST()
  {
    return fieldE03SST.getString();
  }

  /**
  * Set field E03FC4 using a String value.
  */
  public void setE03FC4(String newvalue)
  {
    fieldE03FC4.setString(newvalue);
  }

  /**
  * Get value of field E03FC4 as a String.
  */
  public String getE03FC4()
  {
    return fieldE03FC4.getString();
  }

  /**
  * Set field E03FC5 using a String value.
  */
  public void setE03FC5(String newvalue)
  {
    fieldE03FC5.setString(newvalue);
  }

  /**
  * Get value of field E03FC5 as a String.
  */
  public String getE03FC5()
  {
    return fieldE03FC5.getString();
  }

  /**
  * Set field D03OFC using a String value.
  */
  public void setD03OFC(String newvalue)
  {
    fieldD03OFC.setString(newvalue);
  }

  /**
  * Get value of field D03OFC as a String.
  */
  public String getD03OFC()
  {
    return fieldD03OFC.getString();
  }

  /**
  * Set field D03OF2 using a String value.
  */
  public void setD03OF2(String newvalue)
  {
    fieldD03OF2.setString(newvalue);
  }

  /**
  * Get value of field D03OF2 as a String.
  */
  public String getD03OF2()
  {
    return fieldD03OF2.getString();
  }

  /**
  * Set field D03INC using a String value.
  */
  public void setD03INC(String newvalue)
  {
    fieldD03INC.setString(newvalue);
  }

  /**
  * Get value of field D03INC as a String.
  */
  public String getD03INC()
  {
    return fieldD03INC.getString();
  }

  /**
  * Set field D03BUC using a String value.
  */
  public void setD03BUC(String newvalue)
  {
    fieldD03BUC.setString(newvalue);
  }

  /**
  * Get value of field D03BUC as a String.
  */
  public String getD03BUC()
  {
    return fieldD03BUC.getString();
  }

  /**
  * Set field D03GEC using a String value.
  */
  public void setD03GEC(String newvalue)
  {
    fieldD03GEC.setString(newvalue);
  }

  /**
  * Get value of field D03GEC as a String.
  */
  public String getD03GEC()
  {
    return fieldD03GEC.getString();
  }

  /**
  * Set field D03UC1 using a String value.
  */
  public void setD03UC1(String newvalue)
  {
    fieldD03UC1.setString(newvalue);
  }

  /**
  * Get value of field D03UC1 as a String.
  */
  public String getD03UC1()
  {
    return fieldD03UC1.getString();
  }

  /**
  * Set field D03UC2 using a String value.
  */
  public void setD03UC2(String newvalue)
  {
    fieldD03UC2.setString(newvalue);
  }

  /**
  * Get value of field D03UC2 as a String.
  */
  public String getD03UC2()
  {
    return fieldD03UC2.getString();
  }

  /**
  * Set field D03UC3 using a String value.
  */
  public void setD03UC3(String newvalue)
  {
    fieldD03UC3.setString(newvalue);
  }

  /**
  * Get value of field D03UC3 as a String.
  */
  public String getD03UC3()
  {
    return fieldD03UC3.getString();
  }

  /**
  * Set field D03UC4 using a String value.
  */
  public void setD03UC4(String newvalue)
  {
    fieldD03UC4.setString(newvalue);
  }

  /**
  * Get value of field D03UC4 as a String.
  */
  public String getD03UC4()
  {
    return fieldD03UC4.getString();
  }

  /**
  * Set field D03UC5 using a String value.
  */
  public void setD03UC5(String newvalue)
  {
    fieldD03UC5.setString(newvalue);
  }

  /**
  * Get value of field D03UC5 as a String.
  */
  public String getD03UC5()
  {
    return fieldD03UC5.getString();
  }

  /**
  * Set field D03UC6 using a String value.
  */
  public void setD03UC6(String newvalue)
  {
    fieldD03UC6.setString(newvalue);
  }

  /**
  * Get value of field D03UC6 as a String.
  */
  public String getD03UC6()
  {
    return fieldD03UC6.getString();
  }

  /**
  * Set field D03UC7 using a String value.
  */
  public void setD03UC7(String newvalue)
  {
    fieldD03UC7.setString(newvalue);
  }

  /**
  * Get value of field D03UC7 as a String.
  */
  public String getD03UC7()
  {
    return fieldD03UC7.getString();
  }

  /**
  * Set field D03UC8 using a String value.
  */
  public void setD03UC8(String newvalue)
  {
    fieldD03UC8.setString(newvalue);
  }

  /**
  * Get value of field D03UC8 as a String.
  */
  public String getD03UC8()
  {
    return fieldD03UC8.getString();
  }

  /**
  * Set field D03UC9 using a String value.
  */
  public void setD03UC9(String newvalue)
  {
    fieldD03UC9.setString(newvalue);
  }

  /**
  * Get value of field D03UC9 as a String.
  */
  public String getD03UC9()
  {
    return fieldD03UC9.getString();
  }

  /**
  * Set field D03SCH using a String value.
  */
  public void setD03SCH(String newvalue)
  {
    fieldD03SCH.setString(newvalue);
  }

  /**
  * Get value of field D03SCH as a String.
  */
  public String getD03SCH()
  {
    return fieldD03SCH.getString();
  }

  /**
  * Set field D03SST using a String value.
  */
  public void setD03SST(String newvalue)
  {
    fieldD03SST.setString(newvalue);
  }

  /**
  * Get value of field D03SST as a String.
  */
  public String getD03SST()
  {
    return fieldD03SST.getString();
  }

  /**
  * Set field D03FC4 using a String value.
  */
  public void setD03FC4(String newvalue)
  {
    fieldD03FC4.setString(newvalue);
  }

  /**
  * Get value of field D03FC4 as a String.
  */
  public String getD03FC4()
  {
    return fieldD03FC4.getString();
  }

  /**
  * Set field D03FC5 using a String value.
  */
  public void setD03FC5(String newvalue)
  {
    fieldD03FC5.setString(newvalue);
  }

  /**
  * Get value of field D03FC5 as a String.
  */
  public String getD03FC5()
  {
    return fieldD03FC5.getString();
  }

  /**
  * Set field F03CUN using a String value.
  */
  public void setF03CUN(String newvalue)
  {
    fieldF03CUN.setString(newvalue);
  }

  /**
  * Get value of field F03CUN as a String.
  */
  public String getF03CUN()
  {
    return fieldF03CUN.getString();
  }

  /**
  * Set field F03OFC using a String value.
  */
  public void setF03OFC(String newvalue)
  {
    fieldF03OFC.setString(newvalue);
  }

  /**
  * Get value of field F03OFC as a String.
  */
  public String getF03OFC()
  {
    return fieldF03OFC.getString();
  }

  /**
  * Set field F03OF2 using a String value.
  */
  public void setF03OF2(String newvalue)
  {
    fieldF03OF2.setString(newvalue);
  }

  /**
  * Get value of field F03OF2 as a String.
  */
  public String getF03OF2()
  {
    return fieldF03OF2.getString();
  }

  /**
  * Set field F03INC using a String value.
  */
  public void setF03INC(String newvalue)
  {
    fieldF03INC.setString(newvalue);
  }

  /**
  * Get value of field F03INC as a String.
  */
  public String getF03INC()
  {
    return fieldF03INC.getString();
  }

  /**
  * Set field F03BUC using a String value.
  */
  public void setF03BUC(String newvalue)
  {
    fieldF03BUC.setString(newvalue);
  }

  /**
  * Get value of field F03BUC as a String.
  */
  public String getF03BUC()
  {
    return fieldF03BUC.getString();
  }

  /**
  * Set field F03GEC using a String value.
  */
  public void setF03GEC(String newvalue)
  {
    fieldF03GEC.setString(newvalue);
  }

  /**
  * Get value of field F03GEC as a String.
  */
  public String getF03GEC()
  {
    return fieldF03GEC.getString();
  }

  /**
  * Set field F03UC1 using a String value.
  */
  public void setF03UC1(String newvalue)
  {
    fieldF03UC1.setString(newvalue);
  }

  /**
  * Get value of field F03UC1 as a String.
  */
  public String getF03UC1()
  {
    return fieldF03UC1.getString();
  }

  /**
  * Set field F03UC2 using a String value.
  */
  public void setF03UC2(String newvalue)
  {
    fieldF03UC2.setString(newvalue);
  }

  /**
  * Get value of field F03UC2 as a String.
  */
  public String getF03UC2()
  {
    return fieldF03UC2.getString();
  }

  /**
  * Set field F03UC3 using a String value.
  */
  public void setF03UC3(String newvalue)
  {
    fieldF03UC3.setString(newvalue);
  }

  /**
  * Get value of field F03UC3 as a String.
  */
  public String getF03UC3()
  {
    return fieldF03UC3.getString();
  }

  /**
  * Set field F03UC4 using a String value.
  */
  public void setF03UC4(String newvalue)
  {
    fieldF03UC4.setString(newvalue);
  }

  /**
  * Get value of field F03UC4 as a String.
  */
  public String getF03UC4()
  {
    return fieldF03UC4.getString();
  }

  /**
  * Set field F03UC5 using a String value.
  */
  public void setF03UC5(String newvalue)
  {
    fieldF03UC5.setString(newvalue);
  }

  /**
  * Get value of field F03UC5 as a String.
  */
  public String getF03UC5()
  {
    return fieldF03UC5.getString();
  }

  /**
  * Set field F03UC6 using a String value.
  */
  public void setF03UC6(String newvalue)
  {
    fieldF03UC6.setString(newvalue);
  }

  /**
  * Get value of field F03UC6 as a String.
  */
  public String getF03UC6()
  {
    return fieldF03UC6.getString();
  }

  /**
  * Set field F03UC7 using a String value.
  */
  public void setF03UC7(String newvalue)
  {
    fieldF03UC7.setString(newvalue);
  }

  /**
  * Get value of field F03UC7 as a String.
  */
  public String getF03UC7()
  {
    return fieldF03UC7.getString();
  }

  /**
  * Set field F03UC8 using a String value.
  */
  public void setF03UC8(String newvalue)
  {
    fieldF03UC8.setString(newvalue);
  }

  /**
  * Get value of field F03UC8 as a String.
  */
  public String getF03UC8()
  {
    return fieldF03UC8.getString();
  }

  /**
  * Set field F03UC9 using a String value.
  */
  public void setF03UC9(String newvalue)
  {
    fieldF03UC9.setString(newvalue);
  }

  /**
  * Get value of field F03UC9 as a String.
  */
  public String getF03UC9()
  {
    return fieldF03UC9.getString();
  }

  /**
  * Set field F03SCH using a String value.
  */
  public void setF03SCH(String newvalue)
  {
    fieldF03SCH.setString(newvalue);
  }

  /**
  * Get value of field F03SCH as a String.
  */
  public String getF03SCH()
  {
    return fieldF03SCH.getString();
  }

  /**
  * Set field F03SST using a String value.
  */
  public void setF03SST(String newvalue)
  {
    fieldF03SST.setString(newvalue);
  }

  /**
  * Get value of field F03SST as a String.
  */
  public String getF03SST()
  {
    return fieldF03SST.getString();
  }

  /**
  * Set field F03FC4 using a String value.
  */
  public void setF03FC4(String newvalue)
  {
    fieldF03FC4.setString(newvalue);
  }

  /**
  * Get value of field F03FC4 as a String.
  */
  public String getF03FC4()
  {
    return fieldF03FC4.getString();
  }

  /**
  * Set field F03FC5 using a String value.
  */
  public void setF03FC5(String newvalue)
  {
    fieldF03FC5.setString(newvalue);
  }

  /**
  * Get value of field F03FC5 as a String.
  */
  public String getF03FC5()
  {
    return fieldF03FC5.getString();
  }

}
