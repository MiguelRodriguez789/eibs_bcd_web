package datapro.eibs.beans;

import datapro.eibs.sockets.*;
import java.io.*;
import java.math.*;

import java.util.*;

/**
* Class generated by AS/400 CRTCLASS command from ESD051001 physical file definition.
* 
* File level identifier is 1130819174705.
* Record format level identifier is 46B52A7386A55.
*/

public class ESD051001Message extends MessageRecord
{
  final static String fldnames[] = {
                                     "H01USR",
                                     "H01PGM",
                                     "H01TIM",
                                     "H01SCR",
                                     "H01OPE",
                                     "H01MAS",
                                     "H01WK1",
                                     "H01WK2",
                                     "H01WK3",
                                     "E01RTX",
                                     "D01RTX",
                                     "D01ADT",
                                     "F01MA1",
                                     "F01MA2",
                                     "F01MA3",
                                     "F01MA4",
                                     "F01MA5",
                                     "F01MA6",
                                     "E01FBNK",
                                     "E01FCN1",
                                     "E01FGIN",
                                     "E01FPCA",
                                     "E01FVAL",
                                     "E01FCCY"
                                   };
  final static String tnames[] = {
                                   "H01USR",
                                   "H01PGM",
                                   "H01TIM",
                                   "H01SCR",
                                   "H01OPE",
                                   "H01MAS",
                                   "H01WK1",
                                   "H01WK2",
                                   "H01WK3",
                                   "E01RTX",
                                   "D01RTX",
                                   "D01ADT",
                                   "F01MA1",
                                   "F01MA2",
                                   "F01MA3",
                                   "F01MA4",
                                   "F01MA5",
                                   "F01MA6",
                                   "E01FBNK",
                                   "E01FCN1",
                                   "E01FGIN",
                                   "E01FPCA",
                                   "E01FVAL",
                                   "E01FCCY"
                                 };
  final static String fid = "1130819174705";
  final static String rid = "46B52A7386A55";
  final static String fmtname = "ESD051001";
  final int FIELDCOUNT = 24;
  private static Hashtable tlookup = new Hashtable();
  private CharacterField fieldH01USR = null;
  private CharacterField fieldH01PGM = null;
  private CharacterField fieldH01TIM = null;
  private CharacterField fieldH01SCR = null;
  private CharacterField fieldH01OPE = null;
  private CharacterField fieldH01MAS = null;
  private CharacterField fieldH01WK1 = null;
  private CharacterField fieldH01WK2 = null;
  private CharacterField fieldH01WK3 = null;
  private CharacterField fieldE01RTX = null;
  private CharacterField fieldD01RTX = null;
  private CharacterField fieldD01ADT = null;
  private CharacterField fieldF01MA1 = null;
  private CharacterField fieldF01MA2 = null;
  private CharacterField fieldF01MA3 = null;
  private CharacterField fieldF01MA4 = null;
  private CharacterField fieldF01MA5 = null;
  private CharacterField fieldF01MA6 = null;
  private CharacterField fieldE01FBNK = null;
  private CharacterField fieldE01FCN1 = null;
  private CharacterField fieldE01FGIN = null;
  private DecimalField fieldE01FPCA = null;
  private DecimalField fieldE01FVAL = null;
  private CharacterField fieldE01FCCY = null;

  /**
  * Constructor for ESD051001Message.
  */
  public ESD051001Message()
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
    recordsize = 186;
    fileid = fid;
    recordid = rid;
    message = new byte[getByteLength()];
    formatname = fmtname;
    fieldnames = fldnames;
    tagnames = tnames;
    fields = new MessageField[FIELDCOUNT];

    fields[0] = fieldH01USR =
    new CharacterField(message, HEADERSIZE + 0, 10, "H01USR");
    fields[1] = fieldH01PGM =
    new CharacterField(message, HEADERSIZE + 10, 10, "H01PGM");
    fields[2] = fieldH01TIM =
    new CharacterField(message, HEADERSIZE + 20, 12, "H01TIM");
    fields[3] = fieldH01SCR =
    new CharacterField(message, HEADERSIZE + 32, 2, "H01SCR");
    fields[4] = fieldH01OPE =
    new CharacterField(message, HEADERSIZE + 34, 4, "H01OPE");
    fields[5] = fieldH01MAS =
    new CharacterField(message, HEADERSIZE + 38, 1, "H01MAS");
    fields[6] = fieldH01WK1 =
    new CharacterField(message, HEADERSIZE + 39, 1, "H01WK1");
    fields[7] = fieldH01WK2 =
    new CharacterField(message, HEADERSIZE + 40, 1, "H01WK2");
    fields[8] = fieldH01WK3 =
    new CharacterField(message, HEADERSIZE + 41, 1, "H01WK3");
    fields[9] = fieldE01RTX =
    new CharacterField(message, HEADERSIZE + 42, 1, "E01RTX");
    fields[10] = fieldD01RTX =
    new CharacterField(message, HEADERSIZE + 43, 45, "D01RTX");
    fields[11] = fieldD01ADT =
    new CharacterField(message, HEADERSIZE + 88, 45, "D01ADT");
    fields[12] = fieldF01MA1 =
    new CharacterField(message, HEADERSIZE + 133, 1, "F01MA1");
    fields[13] = fieldF01MA2 =
    new CharacterField(message, HEADERSIZE + 134, 1, "F01MA2");
    fields[14] = fieldF01MA3 =
    new CharacterField(message, HEADERSIZE + 135, 1, "F01MA3");
    fields[15] = fieldF01MA4 =
    new CharacterField(message, HEADERSIZE + 136, 1, "F01MA4");
    fields[16] = fieldF01MA5 =
    new CharacterField(message, HEADERSIZE + 137, 1, "F01MA5");
    fields[17] = fieldF01MA6 =
    new CharacterField(message, HEADERSIZE + 138, 1, "F01MA6");
    fields[18] = fieldE01FBNK =
    new CharacterField(message, HEADERSIZE + 139, 2, "E01FBNK");
    fields[19] = fieldE01FCN1 =
    new CharacterField(message, HEADERSIZE + 141, 1, "E01FCN1");
    fields[20] = fieldE01FGIN =
    new CharacterField(message, HEADERSIZE + 142, 20, "E01FGIN");
    fields[21] = fieldE01FPCA =
    new DecimalField(message, HEADERSIZE + 162, 4, 0, "E01FPCA");
    fields[22] = fieldE01FVAL =
    new DecimalField(message, HEADERSIZE + 166, 17, 2, "E01FVAL");
    fields[23] = fieldE01FCCY =
    new CharacterField(message, HEADERSIZE + 183, 3, "E01FCCY");

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
  * Set field H01USR using a String value.
  */
  public void setH01USR(String newvalue)
  {
    fieldH01USR.setString(newvalue);
  }

  /**
  * Get value of field H01USR as a String.
  */
  public String getH01USR()
  {
    return fieldH01USR.getString();
  }

  /**
  * Set field H01PGM using a String value.
  */
  public void setH01PGM(String newvalue)
  {
    fieldH01PGM.setString(newvalue);
  }

  /**
  * Get value of field H01PGM as a String.
  */
  public String getH01PGM()
  {
    return fieldH01PGM.getString();
  }

  /**
  * Set field H01TIM using a String value.
  */
  public void setH01TIM(String newvalue)
  {
    fieldH01TIM.setString(newvalue);
  }

  /**
  * Get value of field H01TIM as a String.
  */
  public String getH01TIM()
  {
    return fieldH01TIM.getString();
  }

  /**
  * Set field H01SCR using a String value.
  */
  public void setH01SCR(String newvalue)
  {
    fieldH01SCR.setString(newvalue);
  }

  /**
  * Get value of field H01SCR as a String.
  */
  public String getH01SCR()
  {
    return fieldH01SCR.getString();
  }

  /**
  * Set field H01OPE using a String value.
  */
  public void setH01OPE(String newvalue)
  {
    fieldH01OPE.setString(newvalue);
  }

  /**
  * Get value of field H01OPE as a String.
  */
  public String getH01OPE()
  {
    return fieldH01OPE.getString();
  }

  /**
  * Set field H01MAS using a String value.
  */
  public void setH01MAS(String newvalue)
  {
    fieldH01MAS.setString(newvalue);
  }

  /**
  * Get value of field H01MAS as a String.
  */
  public String getH01MAS()
  {
    return fieldH01MAS.getString();
  }

  /**
  * Set field H01WK1 using a String value.
  */
  public void setH01WK1(String newvalue)
  {
    fieldH01WK1.setString(newvalue);
  }

  /**
  * Get value of field H01WK1 as a String.
  */
  public String getH01WK1()
  {
    return fieldH01WK1.getString();
  }

  /**
  * Set field H01WK2 using a String value.
  */
  public void setH01WK2(String newvalue)
  {
    fieldH01WK2.setString(newvalue);
  }

  /**
  * Get value of field H01WK2 as a String.
  */
  public String getH01WK2()
  {
    return fieldH01WK2.getString();
  }

  /**
  * Set field H01WK3 using a String value.
  */
  public void setH01WK3(String newvalue)
  {
    fieldH01WK3.setString(newvalue);
  }

  /**
  * Get value of field H01WK3 as a String.
  */
  public String getH01WK3()
  {
    return fieldH01WK3.getString();
  }

  /**
  * Set field E01RTX using a String value.
  */
  public void setE01RTX(String newvalue)
  {
    fieldE01RTX.setString(newvalue);
  }

  /**
  * Get value of field E01RTX as a String.
  */
  public String getE01RTX()
  {
    return fieldE01RTX.getString();
  }

  /**
  * Set field D01RTX using a String value.
  */
  public void setD01RTX(String newvalue)
  {
    fieldD01RTX.setString(newvalue);
  }

  /**
  * Get value of field D01RTX as a String.
  */
  public String getD01RTX()
  {
    return fieldD01RTX.getString();
  }

  /**
  * Set field D01ADT using a String value.
  */
  public void setD01ADT(String newvalue)
  {
    fieldD01ADT.setString(newvalue);
  }

  /**
  * Get value of field D01ADT as a String.
  */
  public String getD01ADT()
  {
    return fieldD01ADT.getString();
  }

  /**
  * Set field F01MA1 using a String value.
  */
  public void setF01MA1(String newvalue)
  {
    fieldF01MA1.setString(newvalue);
  }

  /**
  * Get value of field F01MA1 as a String.
  */
  public String getF01MA1()
  {
    return fieldF01MA1.getString();
  }

  /**
  * Set field F01MA2 using a String value.
  */
  public void setF01MA2(String newvalue)
  {
    fieldF01MA2.setString(newvalue);
  }

  /**
  * Get value of field F01MA2 as a String.
  */
  public String getF01MA2()
  {
    return fieldF01MA2.getString();
  }

  /**
  * Set field F01MA3 using a String value.
  */
  public void setF01MA3(String newvalue)
  {
    fieldF01MA3.setString(newvalue);
  }

  /**
  * Get value of field F01MA3 as a String.
  */
  public String getF01MA3()
  {
    return fieldF01MA3.getString();
  }

  /**
  * Set field F01MA4 using a String value.
  */
  public void setF01MA4(String newvalue)
  {
    fieldF01MA4.setString(newvalue);
  }

  /**
  * Get value of field F01MA4 as a String.
  */
  public String getF01MA4()
  {
    return fieldF01MA4.getString();
  }

  /**
  * Set field F01MA5 using a String value.
  */
  public void setF01MA5(String newvalue)
  {
    fieldF01MA5.setString(newvalue);
  }

  /**
  * Get value of field F01MA5 as a String.
  */
  public String getF01MA5()
  {
    return fieldF01MA5.getString();
  }

  /**
  * Set field F01MA6 using a String value.
  */
  public void setF01MA6(String newvalue)
  {
    fieldF01MA6.setString(newvalue);
  }

  /**
  * Get value of field F01MA6 as a String.
  */
  public String getF01MA6()
  {
    return fieldF01MA6.getString();
  }

  /**
  * Set field E01FBNK using a String value.
  */
  public void setE01FBNK(String newvalue)
  {
    fieldE01FBNK.setString(newvalue);
  }

  /**
  * Get value of field E01FBNK as a String.
  */
  public String getE01FBNK()
  {
    return fieldE01FBNK.getString();
  }

  /**
  * Set field E01FCN1 using a String value.
  */
  public void setE01FCN1(String newvalue)
  {
    fieldE01FCN1.setString(newvalue);
  }

  /**
  * Get value of field E01FCN1 as a String.
  */
  public String getE01FCN1()
  {
    return fieldE01FCN1.getString();
  }

  /**
  * Set field E01FGIN using a String value.
  */
  public void setE01FGIN(String newvalue)
  {
    fieldE01FGIN.setString(newvalue);
  }

  /**
  * Get value of field E01FGIN as a String.
  */
  public String getE01FGIN()
  {
    return fieldE01FGIN.getString();
  }

  /**
  * Set field E01FPCA using a String value.
  */
  public void setE01FPCA(String newvalue)
  {
    fieldE01FPCA.setString(newvalue);
  }

  /**
  * Get value of field E01FPCA as a String.
  */
  public String getE01FPCA()
  {
    return fieldE01FPCA.getString();
  }

  /**
  * Set numeric field E01FPCA using a BigDecimal value.
  */
  public void setE01FPCA(BigDecimal newvalue)
  {
    fieldE01FPCA.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01FPCA as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01FPCA()
  {
    return fieldE01FPCA.getBigDecimal();
  }

  /**
  * Set field E01FVAL using a String value.
  */
  public void setE01FVAL(String newvalue)
  {
    fieldE01FVAL.setString(newvalue);
  }

  /**
  * Get value of field E01FVAL as a String.
  */
  public String getE01FVAL()
  {
    return fieldE01FVAL.getString();
  }

  /**
  * Set numeric field E01FVAL using a BigDecimal value.
  */
  public void setE01FVAL(BigDecimal newvalue)
  {
    fieldE01FVAL.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01FVAL as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01FVAL()
  {
    return fieldE01FVAL.getBigDecimal();
  }

  /**
  * Set field E01FCCY using a String value.
  */
  public void setE01FCCY(String newvalue)
  {
    fieldE01FCCY.setString(newvalue);
  }

  /**
  * Get value of field E01FCCY as a String.
  */
  public String getE01FCCY()
  {
    return fieldE01FCCY.getString();
  }

}
