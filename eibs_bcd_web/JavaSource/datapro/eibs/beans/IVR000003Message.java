package datapro.eibs.beans;

import datapro.eibs.sockets.*;
import java.io.*;
import java.math.*;

import java.util.*;

/**
* Class generated by AS/400 CRTCLASS command from IVR000003 physical file definition.
* 
* File level identifier is 1040602162143.
* Record format level identifier is 416E7420AA32B.
*/

public class IVR000003Message extends MessageRecord
{
  final static String fldnames[] = {
                                     "IVR03USR",
                                     "IVR03PWD",
                                     "IVR03ACT",
                                     "IVR03BAL",
                                     "IVR03LPR",
                                     "IVR03DPR1",
                                     "IVR03DPR2",
                                     "IVR03DPR3",
                                     "IVR03NPA",
                                     "IVR03DNP1",
                                     "IVR03DNP2",
                                     "IVR03DNP3",
                                     "IVR03PMT",
                                     "IVR03RTE",
                                     "IVR03IPY",
                                     "IVR03IPA",
                                     "IVR03MAT",
                                     "IVR03MDT1",
                                     "IVR03MDT2",
                                     "IVR03MDT3",
                                     "IVR03TYP"
                                   };
  final static String tnames[] = {
                                   "IVR03USR",
                                   "IVR03PWD",
                                   "IVR03ACT",
                                   "IVR03BAL",
                                   "IVR03LPR",
                                   "IVR03DPR1",
                                   "IVR03DPR2",
                                   "IVR03DPR3",
                                   "IVR03NPA",
                                   "IVR03DNP1",
                                   "IVR03DNP2",
                                   "IVR03DNP3",
                                   "IVR03PMT",
                                   "IVR03RTE",
                                   "IVR03IPY",
                                   "IVR03IPA",
                                   "IVR03MAT",
                                   "IVR03MDT1",
                                   "IVR03MDT2",
                                   "IVR03MDT3",
                                   "IVR03TYP"
                                 };
  final static String fid = "1040602162143";
  final static String rid = "416E7420AA32B";
  final static String fmtname = "IVR000003";
  final int FIELDCOUNT = 21;
  private static Hashtable tlookup = new Hashtable();
  private CharacterField fieldIVR03USR = null;
  private CharacterField fieldIVR03PWD = null;
  private DecimalField fieldIVR03ACT = null;
  private DecimalField fieldIVR03BAL = null;
  private DecimalField fieldIVR03LPR = null;
  private DecimalField fieldIVR03DPR1 = null;
  private DecimalField fieldIVR03DPR2 = null;
  private DecimalField fieldIVR03DPR3 = null;
  private DecimalField fieldIVR03NPA = null;
  private DecimalField fieldIVR03DNP1 = null;
  private DecimalField fieldIVR03DNP2 = null;
  private DecimalField fieldIVR03DNP3 = null;
  private DecimalField fieldIVR03PMT = null;
  private DecimalField fieldIVR03RTE = null;
  private DecimalField fieldIVR03IPY = null;
  private DecimalField fieldIVR03IPA = null;
  private DecimalField fieldIVR03MAT = null;
  private DecimalField fieldIVR03MDT1 = null;
  private DecimalField fieldIVR03MDT2 = null;
  private DecimalField fieldIVR03MDT3 = null;
  private CharacterField fieldIVR03TYP = null;

  /**
  * Constructor for IVR000003Message.
  */
  public IVR000003Message()
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
    recordsize = 190;
    fileid = fid;
    recordid = rid;
    message = new byte[getByteLength()];
    formatname = fmtname;
    fieldnames = fldnames;
    tagnames = tnames;
    fields = new MessageField[FIELDCOUNT];

    fields[0] = fieldIVR03USR =
    new CharacterField(message, HEADERSIZE + 0, 10, "IVR03USR");
    fields[1] = fieldIVR03PWD =
    new CharacterField(message, HEADERSIZE + 10, 10, "IVR03PWD");
    fields[2] = fieldIVR03ACT =
    new DecimalField(message, HEADERSIZE + 20, 10, 0, "IVR03ACT");
    fields[3] = fieldIVR03BAL =
    new DecimalField(message, HEADERSIZE + 30, 17, 2, "IVR03BAL");
    fields[4] = fieldIVR03LPR =
    new DecimalField(message, HEADERSIZE + 47, 17, 2, "IVR03LPR");
    fields[5] = fieldIVR03DPR1 =
    new DecimalField(message, HEADERSIZE + 64, 3, 0, "IVR03DPR1");
    fields[6] = fieldIVR03DPR2 =
    new DecimalField(message, HEADERSIZE + 67, 3, 0, "IVR03DPR2");
    fields[7] = fieldIVR03DPR3 =
    new DecimalField(message, HEADERSIZE + 70, 3, 0, "IVR03DPR3");
    fields[8] = fieldIVR03NPA =
    new DecimalField(message, HEADERSIZE + 73, 17, 2, "IVR03NPA");
    fields[9] = fieldIVR03DNP1 =
    new DecimalField(message, HEADERSIZE + 90, 3, 0, "IVR03DNP1");
    fields[10] = fieldIVR03DNP2 =
    new DecimalField(message, HEADERSIZE + 93, 3, 0, "IVR03DNP2");
    fields[11] = fieldIVR03DNP3 =
    new DecimalField(message, HEADERSIZE + 96, 3, 0, "IVR03DNP3");
    fields[12] = fieldIVR03PMT =
    new DecimalField(message, HEADERSIZE + 99, 17, 2, "IVR03PMT");
    fields[13] = fieldIVR03RTE =
    new DecimalField(message, HEADERSIZE + 116, 11, 6, "IVR03RTE");
    fields[14] = fieldIVR03IPY =
    new DecimalField(message, HEADERSIZE + 127, 17, 2, "IVR03IPY");
    fields[15] = fieldIVR03IPA =
    new DecimalField(message, HEADERSIZE + 144, 17, 2, "IVR03IPA");
    fields[16] = fieldIVR03MAT =
    new DecimalField(message, HEADERSIZE + 161, 17, 2, "IVR03MAT");
    fields[17] = fieldIVR03MDT1 =
    new DecimalField(message, HEADERSIZE + 178, 3, 0, "IVR03MDT1");
    fields[18] = fieldIVR03MDT2 =
    new DecimalField(message, HEADERSIZE + 181, 3, 0, "IVR03MDT2");
    fields[19] = fieldIVR03MDT3 =
    new DecimalField(message, HEADERSIZE + 184, 3, 0, "IVR03MDT3");
    fields[20] = fieldIVR03TYP =
    new CharacterField(message, HEADERSIZE + 187, 3, "IVR03TYP");

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
  * Set field IVR03USR using a String value.
  */
  public void setIVR03USR(String newvalue)
  {
    fieldIVR03USR.setString(newvalue);
  }

  /**
  * Get value of field IVR03USR as a String.
  */
  public String getIVR03USR()
  {
    return fieldIVR03USR.getString();
  }

  /**
  * Set field IVR03PWD using a String value.
  */
  public void setIVR03PWD(String newvalue)
  {
    fieldIVR03PWD.setString(newvalue);
  }

  /**
  * Get value of field IVR03PWD as a String.
  */
  public String getIVR03PWD()
  {
    return fieldIVR03PWD.getString();
  }

  /**
  * Set field IVR03ACT using a String value.
  */
  public void setIVR03ACT(String newvalue)
  {
    fieldIVR03ACT.setString(newvalue);
  }

  /**
  * Get value of field IVR03ACT as a String.
  */
  public String getIVR03ACT()
  {
    return fieldIVR03ACT.getString();
  }

  /**
  * Set numeric field IVR03ACT using a BigDecimal value.
  */
  public void setIVR03ACT(BigDecimal newvalue)
  {
    fieldIVR03ACT.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field IVR03ACT as a BigDecimal.
  */
  public BigDecimal getBigDecimalIVR03ACT()
  {
    return fieldIVR03ACT.getBigDecimal();
  }

  /**
  * Set field IVR03BAL using a String value.
  */
  public void setIVR03BAL(String newvalue)
  {
    fieldIVR03BAL.setString(newvalue);
  }

  /**
  * Get value of field IVR03BAL as a String.
  */
  public String getIVR03BAL()
  {
    return fieldIVR03BAL.getString();
  }

  /**
  * Set numeric field IVR03BAL using a BigDecimal value.
  */
  public void setIVR03BAL(BigDecimal newvalue)
  {
    fieldIVR03BAL.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field IVR03BAL as a BigDecimal.
  */
  public BigDecimal getBigDecimalIVR03BAL()
  {
    return fieldIVR03BAL.getBigDecimal();
  }

  /**
  * Set field IVR03LPR using a String value.
  */
  public void setIVR03LPR(String newvalue)
  {
    fieldIVR03LPR.setString(newvalue);
  }

  /**
  * Get value of field IVR03LPR as a String.
  */
  public String getIVR03LPR()
  {
    return fieldIVR03LPR.getString();
  }

  /**
  * Set numeric field IVR03LPR using a BigDecimal value.
  */
  public void setIVR03LPR(BigDecimal newvalue)
  {
    fieldIVR03LPR.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field IVR03LPR as a BigDecimal.
  */
  public BigDecimal getBigDecimalIVR03LPR()
  {
    return fieldIVR03LPR.getBigDecimal();
  }

  /**
  * Set field IVR03DPR1 using a String value.
  */
  public void setIVR03DPR1(String newvalue)
  {
    fieldIVR03DPR1.setString(newvalue);
  }

  /**
  * Get value of field IVR03DPR1 as a String.
  */
  public String getIVR03DPR1()
  {
    return fieldIVR03DPR1.getString();
  }

  /**
  * Set numeric field IVR03DPR1 using a BigDecimal value.
  */
  public void setIVR03DPR1(BigDecimal newvalue)
  {
    fieldIVR03DPR1.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field IVR03DPR1 as a BigDecimal.
  */
  public BigDecimal getBigDecimalIVR03DPR1()
  {
    return fieldIVR03DPR1.getBigDecimal();
  }

  /**
  * Set field IVR03DPR2 using a String value.
  */
  public void setIVR03DPR2(String newvalue)
  {
    fieldIVR03DPR2.setString(newvalue);
  }

  /**
  * Get value of field IVR03DPR2 as a String.
  */
  public String getIVR03DPR2()
  {
    return fieldIVR03DPR2.getString();
  }

  /**
  * Set numeric field IVR03DPR2 using a BigDecimal value.
  */
  public void setIVR03DPR2(BigDecimal newvalue)
  {
    fieldIVR03DPR2.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field IVR03DPR2 as a BigDecimal.
  */
  public BigDecimal getBigDecimalIVR03DPR2()
  {
    return fieldIVR03DPR2.getBigDecimal();
  }

  /**
  * Set field IVR03DPR3 using a String value.
  */
  public void setIVR03DPR3(String newvalue)
  {
    fieldIVR03DPR3.setString(newvalue);
  }

  /**
  * Get value of field IVR03DPR3 as a String.
  */
  public String getIVR03DPR3()
  {
    return fieldIVR03DPR3.getString();
  }

  /**
  * Set numeric field IVR03DPR3 using a BigDecimal value.
  */
  public void setIVR03DPR3(BigDecimal newvalue)
  {
    fieldIVR03DPR3.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field IVR03DPR3 as a BigDecimal.
  */
  public BigDecimal getBigDecimalIVR03DPR3()
  {
    return fieldIVR03DPR3.getBigDecimal();
  }

  /**
  * Set field IVR03NPA using a String value.
  */
  public void setIVR03NPA(String newvalue)
  {
    fieldIVR03NPA.setString(newvalue);
  }

  /**
  * Get value of field IVR03NPA as a String.
  */
  public String getIVR03NPA()
  {
    return fieldIVR03NPA.getString();
  }

  /**
  * Set numeric field IVR03NPA using a BigDecimal value.
  */
  public void setIVR03NPA(BigDecimal newvalue)
  {
    fieldIVR03NPA.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field IVR03NPA as a BigDecimal.
  */
  public BigDecimal getBigDecimalIVR03NPA()
  {
    return fieldIVR03NPA.getBigDecimal();
  }

  /**
  * Set field IVR03DNP1 using a String value.
  */
  public void setIVR03DNP1(String newvalue)
  {
    fieldIVR03DNP1.setString(newvalue);
  }

  /**
  * Get value of field IVR03DNP1 as a String.
  */
  public String getIVR03DNP1()
  {
    return fieldIVR03DNP1.getString();
  }

  /**
  * Set numeric field IVR03DNP1 using a BigDecimal value.
  */
  public void setIVR03DNP1(BigDecimal newvalue)
  {
    fieldIVR03DNP1.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field IVR03DNP1 as a BigDecimal.
  */
  public BigDecimal getBigDecimalIVR03DNP1()
  {
    return fieldIVR03DNP1.getBigDecimal();
  }

  /**
  * Set field IVR03DNP2 using a String value.
  */
  public void setIVR03DNP2(String newvalue)
  {
    fieldIVR03DNP2.setString(newvalue);
  }

  /**
  * Get value of field IVR03DNP2 as a String.
  */
  public String getIVR03DNP2()
  {
    return fieldIVR03DNP2.getString();
  }

  /**
  * Set numeric field IVR03DNP2 using a BigDecimal value.
  */
  public void setIVR03DNP2(BigDecimal newvalue)
  {
    fieldIVR03DNP2.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field IVR03DNP2 as a BigDecimal.
  */
  public BigDecimal getBigDecimalIVR03DNP2()
  {
    return fieldIVR03DNP2.getBigDecimal();
  }

  /**
  * Set field IVR03DNP3 using a String value.
  */
  public void setIVR03DNP3(String newvalue)
  {
    fieldIVR03DNP3.setString(newvalue);
  }

  /**
  * Get value of field IVR03DNP3 as a String.
  */
  public String getIVR03DNP3()
  {
    return fieldIVR03DNP3.getString();
  }

  /**
  * Set numeric field IVR03DNP3 using a BigDecimal value.
  */
  public void setIVR03DNP3(BigDecimal newvalue)
  {
    fieldIVR03DNP3.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field IVR03DNP3 as a BigDecimal.
  */
  public BigDecimal getBigDecimalIVR03DNP3()
  {
    return fieldIVR03DNP3.getBigDecimal();
  }

  /**
  * Set field IVR03PMT using a String value.
  */
  public void setIVR03PMT(String newvalue)
  {
    fieldIVR03PMT.setString(newvalue);
  }

  /**
  * Get value of field IVR03PMT as a String.
  */
  public String getIVR03PMT()
  {
    return fieldIVR03PMT.getString();
  }

  /**
  * Set numeric field IVR03PMT using a BigDecimal value.
  */
  public void setIVR03PMT(BigDecimal newvalue)
  {
    fieldIVR03PMT.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field IVR03PMT as a BigDecimal.
  */
  public BigDecimal getBigDecimalIVR03PMT()
  {
    return fieldIVR03PMT.getBigDecimal();
  }

  /**
  * Set field IVR03RTE using a String value.
  */
  public void setIVR03RTE(String newvalue)
  {
    fieldIVR03RTE.setString(newvalue);
  }

  /**
  * Get value of field IVR03RTE as a String.
  */
  public String getIVR03RTE()
  {
    return fieldIVR03RTE.getString();
  }

  /**
  * Set numeric field IVR03RTE using a BigDecimal value.
  */
  public void setIVR03RTE(BigDecimal newvalue)
  {
    fieldIVR03RTE.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field IVR03RTE as a BigDecimal.
  */
  public BigDecimal getBigDecimalIVR03RTE()
  {
    return fieldIVR03RTE.getBigDecimal();
  }

  /**
  * Set field IVR03IPY using a String value.
  */
  public void setIVR03IPY(String newvalue)
  {
    fieldIVR03IPY.setString(newvalue);
  }

  /**
  * Get value of field IVR03IPY as a String.
  */
  public String getIVR03IPY()
  {
    return fieldIVR03IPY.getString();
  }

  /**
  * Set numeric field IVR03IPY using a BigDecimal value.
  */
  public void setIVR03IPY(BigDecimal newvalue)
  {
    fieldIVR03IPY.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field IVR03IPY as a BigDecimal.
  */
  public BigDecimal getBigDecimalIVR03IPY()
  {
    return fieldIVR03IPY.getBigDecimal();
  }

  /**
  * Set field IVR03IPA using a String value.
  */
  public void setIVR03IPA(String newvalue)
  {
    fieldIVR03IPA.setString(newvalue);
  }

  /**
  * Get value of field IVR03IPA as a String.
  */
  public String getIVR03IPA()
  {
    return fieldIVR03IPA.getString();
  }

  /**
  * Set numeric field IVR03IPA using a BigDecimal value.
  */
  public void setIVR03IPA(BigDecimal newvalue)
  {
    fieldIVR03IPA.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field IVR03IPA as a BigDecimal.
  */
  public BigDecimal getBigDecimalIVR03IPA()
  {
    return fieldIVR03IPA.getBigDecimal();
  }

  /**
  * Set field IVR03MAT using a String value.
  */
  public void setIVR03MAT(String newvalue)
  {
    fieldIVR03MAT.setString(newvalue);
  }

  /**
  * Get value of field IVR03MAT as a String.
  */
  public String getIVR03MAT()
  {
    return fieldIVR03MAT.getString();
  }

  /**
  * Set numeric field IVR03MAT using a BigDecimal value.
  */
  public void setIVR03MAT(BigDecimal newvalue)
  {
    fieldIVR03MAT.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field IVR03MAT as a BigDecimal.
  */
  public BigDecimal getBigDecimalIVR03MAT()
  {
    return fieldIVR03MAT.getBigDecimal();
  }

  /**
  * Set field IVR03MDT1 using a String value.
  */
  public void setIVR03MDT1(String newvalue)
  {
    fieldIVR03MDT1.setString(newvalue);
  }

  /**
  * Get value of field IVR03MDT1 as a String.
  */
  public String getIVR03MDT1()
  {
    return fieldIVR03MDT1.getString();
  }

  /**
  * Set numeric field IVR03MDT1 using a BigDecimal value.
  */
  public void setIVR03MDT1(BigDecimal newvalue)
  {
    fieldIVR03MDT1.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field IVR03MDT1 as a BigDecimal.
  */
  public BigDecimal getBigDecimalIVR03MDT1()
  {
    return fieldIVR03MDT1.getBigDecimal();
  }

  /**
  * Set field IVR03MDT2 using a String value.
  */
  public void setIVR03MDT2(String newvalue)
  {
    fieldIVR03MDT2.setString(newvalue);
  }

  /**
  * Get value of field IVR03MDT2 as a String.
  */
  public String getIVR03MDT2()
  {
    return fieldIVR03MDT2.getString();
  }

  /**
  * Set numeric field IVR03MDT2 using a BigDecimal value.
  */
  public void setIVR03MDT2(BigDecimal newvalue)
  {
    fieldIVR03MDT2.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field IVR03MDT2 as a BigDecimal.
  */
  public BigDecimal getBigDecimalIVR03MDT2()
  {
    return fieldIVR03MDT2.getBigDecimal();
  }

  /**
  * Set field IVR03MDT3 using a String value.
  */
  public void setIVR03MDT3(String newvalue)
  {
    fieldIVR03MDT3.setString(newvalue);
  }

  /**
  * Get value of field IVR03MDT3 as a String.
  */
  public String getIVR03MDT3()
  {
    return fieldIVR03MDT3.getString();
  }

  /**
  * Set numeric field IVR03MDT3 using a BigDecimal value.
  */
  public void setIVR03MDT3(BigDecimal newvalue)
  {
    fieldIVR03MDT3.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field IVR03MDT3 as a BigDecimal.
  */
  public BigDecimal getBigDecimalIVR03MDT3()
  {
    return fieldIVR03MDT3.getBigDecimal();
  }

  /**
  * Set field IVR03TYP using a String value.
  */
  public void setIVR03TYP(String newvalue)
  {
    fieldIVR03TYP.setString(newvalue);
  }

  /**
  * Get value of field IVR03TYP as a String.
  */
  public String getIVR03TYP()
  {
    return fieldIVR03TYP.getString();
  }

}
