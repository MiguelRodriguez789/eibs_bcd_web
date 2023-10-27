package datapro.eibs.beans;

import datapro.eibs.sockets.*;
import java.io.*;
import java.math.*;

import java.util.*;

/**
* Class generated by AS/400 CRTCLASS command from ESD008015 physical file definition.
* 
* File level identifier is 1130717180300.
* Record format level identifier is 49E738FB08D54.
*/

public class ESD008015Message extends MessageRecord
{
  final static String fldnames[] = {
                                     "H15USR",
                                     "H15PGM",
                                     "H15TIM",
                                     "H15SCR",
                                     "H15OPE",
                                     "H15MAS",
                                     "H15WK1",
                                     "H15WK2",
                                     "H15WK3",
                                     "E15OPE",
                                     "E15LGT",
                                     "E15CUN",
                                     "E15FNA",
                                     "E15FN2",
                                     "E15LN1",
                                     "E15LN2",
                                     "E15ACA",
                                     "E15NA1",
                                     "E15NA2",
                                     "E15NA3",
                                     "E15NA4",
                                     "E15CTY",
                                     "E15STE",
                                     "E15CTR",
                                     "E15POB",
                                     "E15CCS",
                                     "E15ZPC",
                                     "E15TID",
                                     "E15PID",
                                     "E15IDN",
                                     "E15LN3",
                                     "E15GEC",
                                     "D15GEC",
                                     "F15IDN",
                                     "F15TID",
                                     "F15PID",
                                     "F15GEC"
                                   };
  final static String tnames[] = {
                                   "H15USR",
                                   "H15PGM",
                                   "H15TIM",
                                   "H15SCR",
                                   "H15OPE",
                                   "H15MAS",
                                   "H15WK1",
                                   "H15WK2",
                                   "H15WK3",
                                   "E15OPE",
                                   "E15LGT",
                                   "E15CUN",
                                   "E15FNA",
                                   "E15FN2",
                                   "E15LN1",
                                   "E15LN2",
                                   "E15ACA",
                                   "E15NA1",
                                   "E15NA2",
                                   "E15NA3",
                                   "E15NA4",
                                   "E15CTY",
                                   "E15STE",
                                   "E15CTR",
                                   "E15POB",
                                   "E15CCS",
                                   "E15ZPC",
                                   "E15TID",
                                   "E15PID",
                                   "E15IDN",
                                   "E15LN3",
                                   "E15GEC",
                                   "D15GEC",
                                   "F15IDN",
                                   "F15TID",
                                   "F15PID",
                                   "F15GEC"
                                 };
  final static String fid = "1130717180300";
  final static String rid = "49E738FB08D54";
  final static String fmtname = "ESD008015";
  final int FIELDCOUNT = 37;
  private static Hashtable tlookup = new Hashtable();
  private CharacterField fieldH15USR = null;
  private CharacterField fieldH15PGM = null;
  private CharacterField fieldH15TIM = null;
  private CharacterField fieldH15SCR = null;
  private CharacterField fieldH15OPE = null;
  private CharacterField fieldH15MAS = null;
  private CharacterField fieldH15WK1 = null;
  private CharacterField fieldH15WK2 = null;
  private CharacterField fieldH15WK3 = null;
  private CharacterField fieldE15OPE = null;
  private CharacterField fieldE15LGT = null;
  private DecimalField fieldE15CUN = null;
  private CharacterField fieldE15FNA = null;
  private CharacterField fieldE15FN2 = null;
  private CharacterField fieldE15LN1 = null;
  private CharacterField fieldE15LN2 = null;
  private CharacterField fieldE15ACA = null;
  private CharacterField fieldE15NA1 = null;
  private CharacterField fieldE15NA2 = null;
  private CharacterField fieldE15NA3 = null;
  private CharacterField fieldE15NA4 = null;
  private CharacterField fieldE15CTY = null;
  private CharacterField fieldE15STE = null;
  private CharacterField fieldE15CTR = null;
  private CharacterField fieldE15POB = null;
  private CharacterField fieldE15CCS = null;
  private CharacterField fieldE15ZPC = null;
  private CharacterField fieldE15TID = null;
  private CharacterField fieldE15PID = null;
  private CharacterField fieldE15IDN = null;
  private CharacterField fieldE15LN3 = null;
  private CharacterField fieldE15GEC = null;
  private CharacterField fieldD15GEC = null;
  private CharacterField fieldF15IDN = null;
  private CharacterField fieldF15TID = null;
  private CharacterField fieldF15PID = null;
  private CharacterField fieldF15GEC = null;

  /**
  * Constructor for ESD008015Message.
  */
  public ESD008015Message()
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
    recordsize = 619;
    fileid = fid;
    recordid = rid;
    message = new byte[getByteLength()];
    formatname = fmtname;
    fieldnames = fldnames;
    tagnames = tnames;
    fields = new MessageField[FIELDCOUNT];

    fields[0] = fieldH15USR =
    new CharacterField(message, HEADERSIZE + 0, 10, "H15USR");
    fields[1] = fieldH15PGM =
    new CharacterField(message, HEADERSIZE + 10, 10, "H15PGM");
    fields[2] = fieldH15TIM =
    new CharacterField(message, HEADERSIZE + 20, 12, "H15TIM");
    fields[3] = fieldH15SCR =
    new CharacterField(message, HEADERSIZE + 32, 2, "H15SCR");
    fields[4] = fieldH15OPE =
    new CharacterField(message, HEADERSIZE + 34, 4, "H15OPE");
    fields[5] = fieldH15MAS =
    new CharacterField(message, HEADERSIZE + 38, 1, "H15MAS");
    fields[6] = fieldH15WK1 =
    new CharacterField(message, HEADERSIZE + 39, 1, "H15WK1");
    fields[7] = fieldH15WK2 =
    new CharacterField(message, HEADERSIZE + 40, 1, "H15WK2");
    fields[8] = fieldH15WK3 =
    new CharacterField(message, HEADERSIZE + 41, 1, "H15WK3");
    fields[9] = fieldE15OPE =
    new CharacterField(message, HEADERSIZE + 42, 2, "E15OPE");
    fields[10] = fieldE15LGT =
    new CharacterField(message, HEADERSIZE + 44, 1, "E15LGT");
    fields[11] = fieldE15CUN =
    new DecimalField(message, HEADERSIZE + 45, 10, 0, "E15CUN");
    fields[12] = fieldE15FNA =
    new CharacterField(message, HEADERSIZE + 55, 30, "E15FNA");
    fields[13] = fieldE15FN2 =
    new CharacterField(message, HEADERSIZE + 85, 30, "E15FN2");
    fields[14] = fieldE15LN1 =
    new CharacterField(message, HEADERSIZE + 115, 30, "E15LN1");
    fields[15] = fieldE15LN2 =
    new CharacterField(message, HEADERSIZE + 145, 30, "E15LN2");
    fields[16] = fieldE15ACA =
    new CharacterField(message, HEADERSIZE + 175, 30, "E15ACA");
    fields[17] = fieldE15NA1 =
    new CharacterField(message, HEADERSIZE + 205, 60, "E15NA1");
    fields[18] = fieldE15NA2 =
    new CharacterField(message, HEADERSIZE + 265, 45, "E15NA2");
    fields[19] = fieldE15NA3 =
    new CharacterField(message, HEADERSIZE + 310, 45, "E15NA3");
    fields[20] = fieldE15NA4 =
    new CharacterField(message, HEADERSIZE + 355, 45, "E15NA4");
    fields[21] = fieldE15CTY =
    new CharacterField(message, HEADERSIZE + 400, 35, "E15CTY");
    fields[22] = fieldE15STE =
    new CharacterField(message, HEADERSIZE + 435, 4, "E15STE");
    fields[23] = fieldE15CTR =
    new CharacterField(message, HEADERSIZE + 439, 35, "E15CTR");
    fields[24] = fieldE15POB =
    new CharacterField(message, HEADERSIZE + 474, 10, "E15POB");
    fields[25] = fieldE15CCS =
    new CharacterField(message, HEADERSIZE + 484, 4, "E15CCS");
    fields[26] = fieldE15ZPC =
    new CharacterField(message, HEADERSIZE + 488, 15, "E15ZPC");
    fields[27] = fieldE15TID =
    new CharacterField(message, HEADERSIZE + 503, 4, "E15TID");
    fields[28] = fieldE15PID =
    new CharacterField(message, HEADERSIZE + 507, 4, "E15PID");
    fields[29] = fieldE15IDN =
    new CharacterField(message, HEADERSIZE + 511, 25, "E15IDN");
    fields[30] = fieldE15LN3 =
    new CharacterField(message, HEADERSIZE + 536, 30, "E15LN3");
    fields[31] = fieldE15GEC =
    new CharacterField(message, HEADERSIZE + 566, 4, "E15GEC");
    fields[32] = fieldD15GEC =
    new CharacterField(message, HEADERSIZE + 570, 45, "D15GEC");
    fields[33] = fieldF15IDN =
    new CharacterField(message, HEADERSIZE + 615, 1, "F15IDN");
    fields[34] = fieldF15TID =
    new CharacterField(message, HEADERSIZE + 616, 1, "F15TID");
    fields[35] = fieldF15PID =
    new CharacterField(message, HEADERSIZE + 617, 1, "F15PID");
    fields[36] = fieldF15GEC =
    new CharacterField(message, HEADERSIZE + 618, 1, "F15GEC");

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
  * Set field H15USR using a String value.
  */
  public void setH15USR(String newvalue)
  {
    fieldH15USR.setString(newvalue);
  }

  /**
  * Get value of field H15USR as a String.
  */
  public String getH15USR()
  {
    return fieldH15USR.getString();
  }

  /**
  * Set field H15PGM using a String value.
  */
  public void setH15PGM(String newvalue)
  {
    fieldH15PGM.setString(newvalue);
  }

  /**
  * Get value of field H15PGM as a String.
  */
  public String getH15PGM()
  {
    return fieldH15PGM.getString();
  }

  /**
  * Set field H15TIM using a String value.
  */
  public void setH15TIM(String newvalue)
  {
    fieldH15TIM.setString(newvalue);
  }

  /**
  * Get value of field H15TIM as a String.
  */
  public String getH15TIM()
  {
    return fieldH15TIM.getString();
  }

  /**
  * Set field H15SCR using a String value.
  */
  public void setH15SCR(String newvalue)
  {
    fieldH15SCR.setString(newvalue);
  }

  /**
  * Get value of field H15SCR as a String.
  */
  public String getH15SCR()
  {
    return fieldH15SCR.getString();
  }

  /**
  * Set field H15OPE using a String value.
  */
  public void setH15OPE(String newvalue)
  {
    fieldH15OPE.setString(newvalue);
  }

  /**
  * Get value of field H15OPE as a String.
  */
  public String getH15OPE()
  {
    return fieldH15OPE.getString();
  }

  /**
  * Set field H15MAS using a String value.
  */
  public void setH15MAS(String newvalue)
  {
    fieldH15MAS.setString(newvalue);
  }

  /**
  * Get value of field H15MAS as a String.
  */
  public String getH15MAS()
  {
    return fieldH15MAS.getString();
  }

  /**
  * Set field H15WK1 using a String value.
  */
  public void setH15WK1(String newvalue)
  {
    fieldH15WK1.setString(newvalue);
  }

  /**
  * Get value of field H15WK1 as a String.
  */
  public String getH15WK1()
  {
    return fieldH15WK1.getString();
  }

  /**
  * Set field H15WK2 using a String value.
  */
  public void setH15WK2(String newvalue)
  {
    fieldH15WK2.setString(newvalue);
  }

  /**
  * Get value of field H15WK2 as a String.
  */
  public String getH15WK2()
  {
    return fieldH15WK2.getString();
  }

  /**
  * Set field H15WK3 using a String value.
  */
  public void setH15WK3(String newvalue)
  {
    fieldH15WK3.setString(newvalue);
  }

  /**
  * Get value of field H15WK3 as a String.
  */
  public String getH15WK3()
  {
    return fieldH15WK3.getString();
  }

  /**
  * Set field E15OPE using a String value.
  */
  public void setE15OPE(String newvalue)
  {
    fieldE15OPE.setString(newvalue);
  }

  /**
  * Get value of field E15OPE as a String.
  */
  public String getE15OPE()
  {
    return fieldE15OPE.getString();
  }

  /**
  * Set field E15LGT using a String value.
  */
  public void setE15LGT(String newvalue)
  {
    fieldE15LGT.setString(newvalue);
  }

  /**
  * Get value of field E15LGT as a String.
  */
  public String getE15LGT()
  {
    return fieldE15LGT.getString();
  }

  /**
  * Set field E15CUN using a String value.
  */
  public void setE15CUN(String newvalue)
  {
    fieldE15CUN.setString(newvalue);
  }

  /**
  * Get value of field E15CUN as a String.
  */
  public String getE15CUN()
  {
    return fieldE15CUN.getString();
  }

  /**
  * Set numeric field E15CUN using a BigDecimal value.
  */
  public void setE15CUN(BigDecimal newvalue)
  {
    fieldE15CUN.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E15CUN as a BigDecimal.
  */
  public BigDecimal getBigDecimalE15CUN()
  {
    return fieldE15CUN.getBigDecimal();
  }

  /**
  * Set field E15FNA using a String value.
  */
  public void setE15FNA(String newvalue)
  {
    fieldE15FNA.setString(newvalue);
  }

  /**
  * Get value of field E15FNA as a String.
  */
  public String getE15FNA()
  {
    return fieldE15FNA.getString();
  }

  /**
  * Set field E15FN2 using a String value.
  */
  public void setE15FN2(String newvalue)
  {
    fieldE15FN2.setString(newvalue);
  }

  /**
  * Get value of field E15FN2 as a String.
  */
  public String getE15FN2()
  {
    return fieldE15FN2.getString();
  }

  /**
  * Set field E15LN1 using a String value.
  */
  public void setE15LN1(String newvalue)
  {
    fieldE15LN1.setString(newvalue);
  }

  /**
  * Get value of field E15LN1 as a String.
  */
  public String getE15LN1()
  {
    return fieldE15LN1.getString();
  }

  /**
  * Set field E15LN2 using a String value.
  */
  public void setE15LN2(String newvalue)
  {
    fieldE15LN2.setString(newvalue);
  }

  /**
  * Get value of field E15LN2 as a String.
  */
  public String getE15LN2()
  {
    return fieldE15LN2.getString();
  }

  /**
  * Set field E15ACA using a String value.
  */
  public void setE15ACA(String newvalue)
  {
    fieldE15ACA.setString(newvalue);
  }

  /**
  * Get value of field E15ACA as a String.
  */
  public String getE15ACA()
  {
    return fieldE15ACA.getString();
  }

  /**
  * Set field E15NA1 using a String value.
  */
  public void setE15NA1(String newvalue)
  {
    fieldE15NA1.setString(newvalue);
  }

  /**
  * Get value of field E15NA1 as a String.
  */
  public String getE15NA1()
  {
    return fieldE15NA1.getString();
  }

  /**
  * Set field E15NA2 using a String value.
  */
  public void setE15NA2(String newvalue)
  {
    fieldE15NA2.setString(newvalue);
  }

  /**
  * Get value of field E15NA2 as a String.
  */
  public String getE15NA2()
  {
    return fieldE15NA2.getString();
  }

  /**
  * Set field E15NA3 using a String value.
  */
  public void setE15NA3(String newvalue)
  {
    fieldE15NA3.setString(newvalue);
  }

  /**
  * Get value of field E15NA3 as a String.
  */
  public String getE15NA3()
  {
    return fieldE15NA3.getString();
  }

  /**
  * Set field E15NA4 using a String value.
  */
  public void setE15NA4(String newvalue)
  {
    fieldE15NA4.setString(newvalue);
  }

  /**
  * Get value of field E15NA4 as a String.
  */
  public String getE15NA4()
  {
    return fieldE15NA4.getString();
  }

  /**
  * Set field E15CTY using a String value.
  */
  public void setE15CTY(String newvalue)
  {
    fieldE15CTY.setString(newvalue);
  }

  /**
  * Get value of field E15CTY as a String.
  */
  public String getE15CTY()
  {
    return fieldE15CTY.getString();
  }

  /**
  * Set field E15STE using a String value.
  */
  public void setE15STE(String newvalue)
  {
    fieldE15STE.setString(newvalue);
  }

  /**
  * Get value of field E15STE as a String.
  */
  public String getE15STE()
  {
    return fieldE15STE.getString();
  }

  /**
  * Set field E15CTR using a String value.
  */
  public void setE15CTR(String newvalue)
  {
    fieldE15CTR.setString(newvalue);
  }

  /**
  * Get value of field E15CTR as a String.
  */
  public String getE15CTR()
  {
    return fieldE15CTR.getString();
  }

  /**
  * Set field E15POB using a String value.
  */
  public void setE15POB(String newvalue)
  {
    fieldE15POB.setString(newvalue);
  }

  /**
  * Get value of field E15POB as a String.
  */
  public String getE15POB()
  {
    return fieldE15POB.getString();
  }

  /**
  * Set field E15CCS using a String value.
  */
  public void setE15CCS(String newvalue)
  {
    fieldE15CCS.setString(newvalue);
  }

  /**
  * Get value of field E15CCS as a String.
  */
  public String getE15CCS()
  {
    return fieldE15CCS.getString();
  }

  /**
  * Set field E15ZPC using a String value.
  */
  public void setE15ZPC(String newvalue)
  {
    fieldE15ZPC.setString(newvalue);
  }

  /**
  * Get value of field E15ZPC as a String.
  */
  public String getE15ZPC()
  {
    return fieldE15ZPC.getString();
  }

  /**
  * Set field E15TID using a String value.
  */
  public void setE15TID(String newvalue)
  {
    fieldE15TID.setString(newvalue);
  }

  /**
  * Get value of field E15TID as a String.
  */
  public String getE15TID()
  {
    return fieldE15TID.getString();
  }

  /**
  * Set field E15PID using a String value.
  */
  public void setE15PID(String newvalue)
  {
    fieldE15PID.setString(newvalue);
  }

  /**
  * Get value of field E15PID as a String.
  */
  public String getE15PID()
  {
    return fieldE15PID.getString();
  }

  /**
  * Set field E15IDN using a String value.
  */
  public void setE15IDN(String newvalue)
  {
    fieldE15IDN.setString(newvalue);
  }

  /**
  * Get value of field E15IDN as a String.
  */
  public String getE15IDN()
  {
    return fieldE15IDN.getString();
  }

  /**
  * Set field E15LN3 using a String value.
  */
  public void setE15LN3(String newvalue)
  {
    fieldE15LN3.setString(newvalue);
  }

  /**
  * Get value of field E15LN3 as a String.
  */
  public String getE15LN3()
  {
    return fieldE15LN3.getString();
  }

  /**
  * Set field E15GEC using a String value.
  */
  public void setE15GEC(String newvalue)
  {
    fieldE15GEC.setString(newvalue);
  }

  /**
  * Get value of field E15GEC as a String.
  */
  public String getE15GEC()
  {
    return fieldE15GEC.getString();
  }

  /**
  * Set field D15GEC using a String value.
  */
  public void setD15GEC(String newvalue)
  {
    fieldD15GEC.setString(newvalue);
  }

  /**
  * Get value of field D15GEC as a String.
  */
  public String getD15GEC()
  {
    return fieldD15GEC.getString();
  }

  /**
  * Set field F15IDN using a String value.
  */
  public void setF15IDN(String newvalue)
  {
    fieldF15IDN.setString(newvalue);
  }

  /**
  * Get value of field F15IDN as a String.
  */
  public String getF15IDN()
  {
    return fieldF15IDN.getString();
  }

  /**
  * Set field F15TID using a String value.
  */
  public void setF15TID(String newvalue)
  {
    fieldF15TID.setString(newvalue);
  }

  /**
  * Get value of field F15TID as a String.
  */
  public String getF15TID()
  {
    return fieldF15TID.getString();
  }

  /**
  * Set field F15PID using a String value.
  */
  public void setF15PID(String newvalue)
  {
    fieldF15PID.setString(newvalue);
  }

  /**
  * Get value of field F15PID as a String.
  */
  public String getF15PID()
  {
    return fieldF15PID.getString();
  }

  /**
  * Set field F15GEC using a String value.
  */
  public void setF15GEC(String newvalue)
  {
    fieldF15GEC.setString(newvalue);
  }

  /**
  * Get value of field F15GEC as a String.
  */
  public String getF15GEC()
  {
    return fieldF15GEC.getString();
  }

}
