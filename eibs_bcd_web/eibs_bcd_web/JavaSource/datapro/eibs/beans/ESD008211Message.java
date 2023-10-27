package datapro.eibs.beans;

import datapro.eibs.sockets.*;
import java.io.*;
import java.math.*;

import java.util.*;

/**
* Class generated by AS/400 CRTCLASS command from ESD008211 physical file definition.
* 
* File level identifier is 1130611113355.
* Record format level identifier is 37248ACC234AD.
*/

public class ESD008211Message extends MessageRecord
{
  final static String fldnames[] = {
                                     "H011USR",
                                     "H011PGM",
                                     "H011TIM",
                                     "H011SCR",
                                     "H011OPE",
                                     "H011MAS",
                                     "H011WK1",
                                     "H011WK2",
                                     "H011WK3",
                                     "E11NOF",
                                     "E11CUS",
                                     "E11CCY",
                                     "E11TYP",
                                     "E11PYC",
                                     "E11PC1",
                                     "E11PC2",
                                     "E11PC3",
                                     "E11PC4",
                                     "E11PC5",
                                     "E11RCC",
                                     "E11RC1",
                                     "E11RC2",
                                     "E11RC3",
                                     "E11RC4",
                                     "E11RC5",
                                     "E11PI1",
                                     "E11PI2",
                                     "E11PI3",
                                     "E11PI4",
                                     "E11PI5",
                                     "E11RI1",
                                     "E11RI2",
                                     "E11RI3",
                                     "E11RI4",
                                     "E11RI5",
                                     "E11AW1",
                                     "E11AW2",
                                     "E11AW3",
                                     "E11AW4",
                                     "E11AW5",
                                     "E11BN1",
                                     "E11BN2",
                                     "E11BN3",
                                     "E11BN4",
                                     "E11BN5",
                                     "E11OFB",
                                     "E11OFA",
                                     "E11NA1",
                                     "E11IDN",
                                     "E11LN3"
                                   };
  final static String tnames[] = {
                                   "H011USR",
                                   "H011PGM",
                                   "H011TIM",
                                   "H011SCR",
                                   "H011OPE",
                                   "H011MAS",
                                   "H011WK1",
                                   "H011WK2",
                                   "H011WK3",
                                   "E11NOF",
                                   "E11CUS",
                                   "E11CCY",
                                   "E11TYP",
                                   "E11PYC",
                                   "E11PC1",
                                   "E11PC2",
                                   "E11PC3",
                                   "E11PC4",
                                   "E11PC5",
                                   "E11RCC",
                                   "E11RC1",
                                   "E11RC2",
                                   "E11RC3",
                                   "E11RC4",
                                   "E11RC5",
                                   "E11PI1",
                                   "E11PI2",
                                   "E11PI3",
                                   "E11PI4",
                                   "E11PI5",
                                   "E11RI1",
                                   "E11RI2",
                                   "E11RI3",
                                   "E11RI4",
                                   "E11RI5",
                                   "E11AW1",
                                   "E11AW2",
                                   "E11AW3",
                                   "E11AW4",
                                   "E11AW5",
                                   "E11BN1",
                                   "E11BN2",
                                   "E11BN3",
                                   "E11BN4",
                                   "E11BN5",
                                   "E11OFB",
                                   "E11OFA",
                                   "E11NA1",
                                   "E11IDN",
                                   "E11LN3"
                                 };
  final static String fid = "1130611113355";
  final static String rid = "37248ACC234AD";
  final static String fmtname = "ESD008211";
  final int FIELDCOUNT = 50;
  private static Hashtable tlookup = new Hashtable();
  private CharacterField fieldH011USR = null;
  private CharacterField fieldH011PGM = null;
  private CharacterField fieldH011TIM = null;
  private CharacterField fieldH011SCR = null;
  private CharacterField fieldH011OPE = null;
  private CharacterField fieldH011MAS = null;
  private CharacterField fieldH011WK1 = null;
  private CharacterField fieldH011WK2 = null;
  private CharacterField fieldH011WK3 = null;
  private CharacterField fieldE11NOF = null;
  private DecimalField fieldE11CUS = null;
  private CharacterField fieldE11CCY = null;
  private CharacterField fieldE11TYP = null;
  private DecimalField fieldE11PYC = null;
  private CharacterField fieldE11PC1 = null;
  private CharacterField fieldE11PC2 = null;
  private CharacterField fieldE11PC3 = null;
  private CharacterField fieldE11PC4 = null;
  private CharacterField fieldE11PC5 = null;
  private DecimalField fieldE11RCC = null;
  private CharacterField fieldE11RC1 = null;
  private CharacterField fieldE11RC2 = null;
  private CharacterField fieldE11RC3 = null;
  private CharacterField fieldE11RC4 = null;
  private CharacterField fieldE11RC5 = null;
  private CharacterField fieldE11PI1 = null;
  private CharacterField fieldE11PI2 = null;
  private CharacterField fieldE11PI3 = null;
  private CharacterField fieldE11PI4 = null;
  private CharacterField fieldE11PI5 = null;
  private CharacterField fieldE11RI1 = null;
  private CharacterField fieldE11RI2 = null;
  private CharacterField fieldE11RI3 = null;
  private CharacterField fieldE11RI4 = null;
  private CharacterField fieldE11RI5 = null;
  private CharacterField fieldE11AW1 = null;
  private CharacterField fieldE11AW2 = null;
  private CharacterField fieldE11AW3 = null;
  private CharacterField fieldE11AW4 = null;
  private CharacterField fieldE11AW5 = null;
  private CharacterField fieldE11BN1 = null;
  private CharacterField fieldE11BN2 = null;
  private CharacterField fieldE11BN3 = null;
  private CharacterField fieldE11BN4 = null;
  private CharacterField fieldE11BN5 = null;
  private CharacterField fieldE11OFB = null;
  private DecimalField fieldE11OFA = null;
  private CharacterField fieldE11NA1 = null;
  private CharacterField fieldE11IDN = null;
  private CharacterField fieldE11LN3 = null;

  /**
  * Constructor for ESD008211Message.
  */
  public ESD008211Message()
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
    recordsize = 1561;
    fileid = fid;
    recordid = rid;
    message = new byte[getByteLength()];
    formatname = fmtname;
    fieldnames = fldnames;
    tagnames = tnames;
    fields = new MessageField[FIELDCOUNT];

    fields[0] = fieldH011USR =
    new CharacterField(message, HEADERSIZE + 0, 10, "H011USR");
    fields[1] = fieldH011PGM =
    new CharacterField(message, HEADERSIZE + 10, 10, "H011PGM");
    fields[2] = fieldH011TIM =
    new CharacterField(message, HEADERSIZE + 20, 12, "H011TIM");
    fields[3] = fieldH011SCR =
    new CharacterField(message, HEADERSIZE + 32, 2, "H011SCR");
    fields[4] = fieldH011OPE =
    new CharacterField(message, HEADERSIZE + 34, 4, "H011OPE");
    fields[5] = fieldH011MAS =
    new CharacterField(message, HEADERSIZE + 38, 1, "H011MAS");
    fields[6] = fieldH011WK1 =
    new CharacterField(message, HEADERSIZE + 39, 1, "H011WK1");
    fields[7] = fieldH011WK2 =
    new CharacterField(message, HEADERSIZE + 40, 1, "H011WK2");
    fields[8] = fieldH011WK3 =
    new CharacterField(message, HEADERSIZE + 41, 1, "H011WK3");
    fields[9] = fieldE11NOF =
    new CharacterField(message, HEADERSIZE + 42, 1, "E11NOF");
    fields[10] = fieldE11CUS =
    new DecimalField(message, HEADERSIZE + 43, 10, 0, "E11CUS");
    fields[11] = fieldE11CCY =
    new CharacterField(message, HEADERSIZE + 53, 3, "E11CCY");
    fields[12] = fieldE11TYP =
    new CharacterField(message, HEADERSIZE + 56, 1, "E11TYP");
    fields[13] = fieldE11PYC =
    new DecimalField(message, HEADERSIZE + 57, 10, 0, "E11PYC");
    fields[14] = fieldE11PC1 =
    new CharacterField(message, HEADERSIZE + 67, 45, "E11PC1");
    fields[15] = fieldE11PC2 =
    new CharacterField(message, HEADERSIZE + 112, 45, "E11PC2");
    fields[16] = fieldE11PC3 =
    new CharacterField(message, HEADERSIZE + 157, 45, "E11PC3");
    fields[17] = fieldE11PC4 =
    new CharacterField(message, HEADERSIZE + 202, 45, "E11PC4");
    fields[18] = fieldE11PC5 =
    new CharacterField(message, HEADERSIZE + 247, 45, "E11PC5");
    fields[19] = fieldE11RCC =
    new DecimalField(message, HEADERSIZE + 292, 10, 0, "E11RCC");
    fields[20] = fieldE11RC1 =
    new CharacterField(message, HEADERSIZE + 302, 45, "E11RC1");
    fields[21] = fieldE11RC2 =
    new CharacterField(message, HEADERSIZE + 347, 45, "E11RC2");
    fields[22] = fieldE11RC3 =
    new CharacterField(message, HEADERSIZE + 392, 45, "E11RC3");
    fields[23] = fieldE11RC4 =
    new CharacterField(message, HEADERSIZE + 437, 45, "E11RC4");
    fields[24] = fieldE11RC5 =
    new CharacterField(message, HEADERSIZE + 482, 45, "E11RC5");
    fields[25] = fieldE11PI1 =
    new CharacterField(message, HEADERSIZE + 527, 45, "E11PI1");
    fields[26] = fieldE11PI2 =
    new CharacterField(message, HEADERSIZE + 572, 45, "E11PI2");
    fields[27] = fieldE11PI3 =
    new CharacterField(message, HEADERSIZE + 617, 45, "E11PI3");
    fields[28] = fieldE11PI4 =
    new CharacterField(message, HEADERSIZE + 662, 45, "E11PI4");
    fields[29] = fieldE11PI5 =
    new CharacterField(message, HEADERSIZE + 707, 45, "E11PI5");
    fields[30] = fieldE11RI1 =
    new CharacterField(message, HEADERSIZE + 752, 45, "E11RI1");
    fields[31] = fieldE11RI2 =
    new CharacterField(message, HEADERSIZE + 797, 45, "E11RI2");
    fields[32] = fieldE11RI3 =
    new CharacterField(message, HEADERSIZE + 842, 45, "E11RI3");
    fields[33] = fieldE11RI4 =
    new CharacterField(message, HEADERSIZE + 887, 45, "E11RI4");
    fields[34] = fieldE11RI5 =
    new CharacterField(message, HEADERSIZE + 932, 45, "E11RI5");
    fields[35] = fieldE11AW1 =
    new CharacterField(message, HEADERSIZE + 977, 45, "E11AW1");
    fields[36] = fieldE11AW2 =
    new CharacterField(message, HEADERSIZE + 1022, 45, "E11AW2");
    fields[37] = fieldE11AW3 =
    new CharacterField(message, HEADERSIZE + 1067, 45, "E11AW3");
    fields[38] = fieldE11AW4 =
    new CharacterField(message, HEADERSIZE + 1112, 45, "E11AW4");
    fields[39] = fieldE11AW5 =
    new CharacterField(message, HEADERSIZE + 1157, 45, "E11AW5");
    fields[40] = fieldE11BN1 =
    new CharacterField(message, HEADERSIZE + 1202, 45, "E11BN1");
    fields[41] = fieldE11BN2 =
    new CharacterField(message, HEADERSIZE + 1247, 45, "E11BN2");
    fields[42] = fieldE11BN3 =
    new CharacterField(message, HEADERSIZE + 1292, 45, "E11BN3");
    fields[43] = fieldE11BN4 =
    new CharacterField(message, HEADERSIZE + 1337, 45, "E11BN4");
    fields[44] = fieldE11BN5 =
    new CharacterField(message, HEADERSIZE + 1382, 45, "E11BN5");
    fields[45] = fieldE11OFB =
    new CharacterField(message, HEADERSIZE + 1427, 2, "E11OFB");
    fields[46] = fieldE11OFA =
    new DecimalField(message, HEADERSIZE + 1429, 17, 0, "E11OFA");
    fields[47] = fieldE11NA1 =
    new CharacterField(message, HEADERSIZE + 1446, 60, "E11NA1");
    fields[48] = fieldE11IDN =
    new CharacterField(message, HEADERSIZE + 1506, 25, "E11IDN");
    fields[49] = fieldE11LN3 =
    new CharacterField(message, HEADERSIZE + 1531, 30, "E11LN3");

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
  * Set field H011USR using a String value.
  */
  public void setH011USR(String newvalue)
  {
    fieldH011USR.setString(newvalue);
  }

  /**
  * Get value of field H011USR as a String.
  */
  public String getH011USR()
  {
    return fieldH011USR.getString();
  }

  /**
  * Set field H011PGM using a String value.
  */
  public void setH011PGM(String newvalue)
  {
    fieldH011PGM.setString(newvalue);
  }

  /**
  * Get value of field H011PGM as a String.
  */
  public String getH011PGM()
  {
    return fieldH011PGM.getString();
  }

  /**
  * Set field H011TIM using a String value.
  */
  public void setH011TIM(String newvalue)
  {
    fieldH011TIM.setString(newvalue);
  }

  /**
  * Get value of field H011TIM as a String.
  */
  public String getH011TIM()
  {
    return fieldH011TIM.getString();
  }

  /**
  * Set field H011SCR using a String value.
  */
  public void setH011SCR(String newvalue)
  {
    fieldH011SCR.setString(newvalue);
  }

  /**
  * Get value of field H011SCR as a String.
  */
  public String getH011SCR()
  {
    return fieldH011SCR.getString();
  }

  /**
  * Set field H011OPE using a String value.
  */
  public void setH011OPE(String newvalue)
  {
    fieldH011OPE.setString(newvalue);
  }

  /**
  * Get value of field H011OPE as a String.
  */
  public String getH011OPE()
  {
    return fieldH011OPE.getString();
  }

  /**
  * Set field H011MAS using a String value.
  */
  public void setH011MAS(String newvalue)
  {
    fieldH011MAS.setString(newvalue);
  }

  /**
  * Get value of field H011MAS as a String.
  */
  public String getH011MAS()
  {
    return fieldH011MAS.getString();
  }

  /**
  * Set field H011WK1 using a String value.
  */
  public void setH011WK1(String newvalue)
  {
    fieldH011WK1.setString(newvalue);
  }

  /**
  * Get value of field H011WK1 as a String.
  */
  public String getH011WK1()
  {
    return fieldH011WK1.getString();
  }

  /**
  * Set field H011WK2 using a String value.
  */
  public void setH011WK2(String newvalue)
  {
    fieldH011WK2.setString(newvalue);
  }

  /**
  * Get value of field H011WK2 as a String.
  */
  public String getH011WK2()
  {
    return fieldH011WK2.getString();
  }

  /**
  * Set field H011WK3 using a String value.
  */
  public void setH011WK3(String newvalue)
  {
    fieldH011WK3.setString(newvalue);
  }

  /**
  * Get value of field H011WK3 as a String.
  */
  public String getH011WK3()
  {
    return fieldH011WK3.getString();
  }

  /**
  * Set field E11NOF using a String value.
  */
  public void setE11NOF(String newvalue)
  {
    fieldE11NOF.setString(newvalue);
  }

  /**
  * Get value of field E11NOF as a String.
  */
  public String getE11NOF()
  {
    return fieldE11NOF.getString();
  }

  /**
  * Set field E11CUS using a String value.
  */
  public void setE11CUS(String newvalue)
  {
    fieldE11CUS.setString(newvalue);
  }

  /**
  * Get value of field E11CUS as a String.
  */
  public String getE11CUS()
  {
    return fieldE11CUS.getString();
  }

  /**
  * Set numeric field E11CUS using a BigDecimal value.
  */
  public void setE11CUS(BigDecimal newvalue)
  {
    fieldE11CUS.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E11CUS as a BigDecimal.
  */
  public BigDecimal getBigDecimalE11CUS()
  {
    return fieldE11CUS.getBigDecimal();
  }

  /**
  * Set field E11CCY using a String value.
  */
  public void setE11CCY(String newvalue)
  {
    fieldE11CCY.setString(newvalue);
  }

  /**
  * Get value of field E11CCY as a String.
  */
  public String getE11CCY()
  {
    return fieldE11CCY.getString();
  }

  /**
  * Set field E11TYP using a String value.
  */
  public void setE11TYP(String newvalue)
  {
    fieldE11TYP.setString(newvalue);
  }

  /**
  * Get value of field E11TYP as a String.
  */
  public String getE11TYP()
  {
    return fieldE11TYP.getString();
  }

  /**
  * Set field E11PYC using a String value.
  */
  public void setE11PYC(String newvalue)
  {
    fieldE11PYC.setString(newvalue);
  }

  /**
  * Get value of field E11PYC as a String.
  */
  public String getE11PYC()
  {
    return fieldE11PYC.getString();
  }

  /**
  * Set numeric field E11PYC using a BigDecimal value.
  */
  public void setE11PYC(BigDecimal newvalue)
  {
    fieldE11PYC.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E11PYC as a BigDecimal.
  */
  public BigDecimal getBigDecimalE11PYC()
  {
    return fieldE11PYC.getBigDecimal();
  }

  /**
  * Set field E11PC1 using a String value.
  */
  public void setE11PC1(String newvalue)
  {
    fieldE11PC1.setString(newvalue);
  }

  /**
  * Get value of field E11PC1 as a String.
  */
  public String getE11PC1()
  {
    return fieldE11PC1.getString();
  }

  /**
  * Set field E11PC2 using a String value.
  */
  public void setE11PC2(String newvalue)
  {
    fieldE11PC2.setString(newvalue);
  }

  /**
  * Get value of field E11PC2 as a String.
  */
  public String getE11PC2()
  {
    return fieldE11PC2.getString();
  }

  /**
  * Set field E11PC3 using a String value.
  */
  public void setE11PC3(String newvalue)
  {
    fieldE11PC3.setString(newvalue);
  }

  /**
  * Get value of field E11PC3 as a String.
  */
  public String getE11PC3()
  {
    return fieldE11PC3.getString();
  }

  /**
  * Set field E11PC4 using a String value.
  */
  public void setE11PC4(String newvalue)
  {
    fieldE11PC4.setString(newvalue);
  }

  /**
  * Get value of field E11PC4 as a String.
  */
  public String getE11PC4()
  {
    return fieldE11PC4.getString();
  }

  /**
  * Set field E11PC5 using a String value.
  */
  public void setE11PC5(String newvalue)
  {
    fieldE11PC5.setString(newvalue);
  }

  /**
  * Get value of field E11PC5 as a String.
  */
  public String getE11PC5()
  {
    return fieldE11PC5.getString();
  }

  /**
  * Set field E11RCC using a String value.
  */
  public void setE11RCC(String newvalue)
  {
    fieldE11RCC.setString(newvalue);
  }

  /**
  * Get value of field E11RCC as a String.
  */
  public String getE11RCC()
  {
    return fieldE11RCC.getString();
  }

  /**
  * Set numeric field E11RCC using a BigDecimal value.
  */
  public void setE11RCC(BigDecimal newvalue)
  {
    fieldE11RCC.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E11RCC as a BigDecimal.
  */
  public BigDecimal getBigDecimalE11RCC()
  {
    return fieldE11RCC.getBigDecimal();
  }

  /**
  * Set field E11RC1 using a String value.
  */
  public void setE11RC1(String newvalue)
  {
    fieldE11RC1.setString(newvalue);
  }

  /**
  * Get value of field E11RC1 as a String.
  */
  public String getE11RC1()
  {
    return fieldE11RC1.getString();
  }

  /**
  * Set field E11RC2 using a String value.
  */
  public void setE11RC2(String newvalue)
  {
    fieldE11RC2.setString(newvalue);
  }

  /**
  * Get value of field E11RC2 as a String.
  */
  public String getE11RC2()
  {
    return fieldE11RC2.getString();
  }

  /**
  * Set field E11RC3 using a String value.
  */
  public void setE11RC3(String newvalue)
  {
    fieldE11RC3.setString(newvalue);
  }

  /**
  * Get value of field E11RC3 as a String.
  */
  public String getE11RC3()
  {
    return fieldE11RC3.getString();
  }

  /**
  * Set field E11RC4 using a String value.
  */
  public void setE11RC4(String newvalue)
  {
    fieldE11RC4.setString(newvalue);
  }

  /**
  * Get value of field E11RC4 as a String.
  */
  public String getE11RC4()
  {
    return fieldE11RC4.getString();
  }

  /**
  * Set field E11RC5 using a String value.
  */
  public void setE11RC5(String newvalue)
  {
    fieldE11RC5.setString(newvalue);
  }

  /**
  * Get value of field E11RC5 as a String.
  */
  public String getE11RC5()
  {
    return fieldE11RC5.getString();
  }

  /**
  * Set field E11PI1 using a String value.
  */
  public void setE11PI1(String newvalue)
  {
    fieldE11PI1.setString(newvalue);
  }

  /**
  * Get value of field E11PI1 as a String.
  */
  public String getE11PI1()
  {
    return fieldE11PI1.getString();
  }

  /**
  * Set field E11PI2 using a String value.
  */
  public void setE11PI2(String newvalue)
  {
    fieldE11PI2.setString(newvalue);
  }

  /**
  * Get value of field E11PI2 as a String.
  */
  public String getE11PI2()
  {
    return fieldE11PI2.getString();
  }

  /**
  * Set field E11PI3 using a String value.
  */
  public void setE11PI3(String newvalue)
  {
    fieldE11PI3.setString(newvalue);
  }

  /**
  * Get value of field E11PI3 as a String.
  */
  public String getE11PI3()
  {
    return fieldE11PI3.getString();
  }

  /**
  * Set field E11PI4 using a String value.
  */
  public void setE11PI4(String newvalue)
  {
    fieldE11PI4.setString(newvalue);
  }

  /**
  * Get value of field E11PI4 as a String.
  */
  public String getE11PI4()
  {
    return fieldE11PI4.getString();
  }

  /**
  * Set field E11PI5 using a String value.
  */
  public void setE11PI5(String newvalue)
  {
    fieldE11PI5.setString(newvalue);
  }

  /**
  * Get value of field E11PI5 as a String.
  */
  public String getE11PI5()
  {
    return fieldE11PI5.getString();
  }

  /**
  * Set field E11RI1 using a String value.
  */
  public void setE11RI1(String newvalue)
  {
    fieldE11RI1.setString(newvalue);
  }

  /**
  * Get value of field E11RI1 as a String.
  */
  public String getE11RI1()
  {
    return fieldE11RI1.getString();
  }

  /**
  * Set field E11RI2 using a String value.
  */
  public void setE11RI2(String newvalue)
  {
    fieldE11RI2.setString(newvalue);
  }

  /**
  * Get value of field E11RI2 as a String.
  */
  public String getE11RI2()
  {
    return fieldE11RI2.getString();
  }

  /**
  * Set field E11RI3 using a String value.
  */
  public void setE11RI3(String newvalue)
  {
    fieldE11RI3.setString(newvalue);
  }

  /**
  * Get value of field E11RI3 as a String.
  */
  public String getE11RI3()
  {
    return fieldE11RI3.getString();
  }

  /**
  * Set field E11RI4 using a String value.
  */
  public void setE11RI4(String newvalue)
  {
    fieldE11RI4.setString(newvalue);
  }

  /**
  * Get value of field E11RI4 as a String.
  */
  public String getE11RI4()
  {
    return fieldE11RI4.getString();
  }

  /**
  * Set field E11RI5 using a String value.
  */
  public void setE11RI5(String newvalue)
  {
    fieldE11RI5.setString(newvalue);
  }

  /**
  * Get value of field E11RI5 as a String.
  */
  public String getE11RI5()
  {
    return fieldE11RI5.getString();
  }

  /**
  * Set field E11AW1 using a String value.
  */
  public void setE11AW1(String newvalue)
  {
    fieldE11AW1.setString(newvalue);
  }

  /**
  * Get value of field E11AW1 as a String.
  */
  public String getE11AW1()
  {
    return fieldE11AW1.getString();
  }

  /**
  * Set field E11AW2 using a String value.
  */
  public void setE11AW2(String newvalue)
  {
    fieldE11AW2.setString(newvalue);
  }

  /**
  * Get value of field E11AW2 as a String.
  */
  public String getE11AW2()
  {
    return fieldE11AW2.getString();
  }

  /**
  * Set field E11AW3 using a String value.
  */
  public void setE11AW3(String newvalue)
  {
    fieldE11AW3.setString(newvalue);
  }

  /**
  * Get value of field E11AW3 as a String.
  */
  public String getE11AW3()
  {
    return fieldE11AW3.getString();
  }

  /**
  * Set field E11AW4 using a String value.
  */
  public void setE11AW4(String newvalue)
  {
    fieldE11AW4.setString(newvalue);
  }

  /**
  * Get value of field E11AW4 as a String.
  */
  public String getE11AW4()
  {
    return fieldE11AW4.getString();
  }

  /**
  * Set field E11AW5 using a String value.
  */
  public void setE11AW5(String newvalue)
  {
    fieldE11AW5.setString(newvalue);
  }

  /**
  * Get value of field E11AW5 as a String.
  */
  public String getE11AW5()
  {
    return fieldE11AW5.getString();
  }

  /**
  * Set field E11BN1 using a String value.
  */
  public void setE11BN1(String newvalue)
  {
    fieldE11BN1.setString(newvalue);
  }

  /**
  * Get value of field E11BN1 as a String.
  */
  public String getE11BN1()
  {
    return fieldE11BN1.getString();
  }

  /**
  * Set field E11BN2 using a String value.
  */
  public void setE11BN2(String newvalue)
  {
    fieldE11BN2.setString(newvalue);
  }

  /**
  * Get value of field E11BN2 as a String.
  */
  public String getE11BN2()
  {
    return fieldE11BN2.getString();
  }

  /**
  * Set field E11BN3 using a String value.
  */
  public void setE11BN3(String newvalue)
  {
    fieldE11BN3.setString(newvalue);
  }

  /**
  * Get value of field E11BN3 as a String.
  */
  public String getE11BN3()
  {
    return fieldE11BN3.getString();
  }

  /**
  * Set field E11BN4 using a String value.
  */
  public void setE11BN4(String newvalue)
  {
    fieldE11BN4.setString(newvalue);
  }

  /**
  * Get value of field E11BN4 as a String.
  */
  public String getE11BN4()
  {
    return fieldE11BN4.getString();
  }

  /**
  * Set field E11BN5 using a String value.
  */
  public void setE11BN5(String newvalue)
  {
    fieldE11BN5.setString(newvalue);
  }

  /**
  * Get value of field E11BN5 as a String.
  */
  public String getE11BN5()
  {
    return fieldE11BN5.getString();
  }

  /**
  * Set field E11OFB using a String value.
  */
  public void setE11OFB(String newvalue)
  {
    fieldE11OFB.setString(newvalue);
  }

  /**
  * Get value of field E11OFB as a String.
  */
  public String getE11OFB()
  {
    return fieldE11OFB.getString();
  }

  /**
  * Set field E11OFA using a String value.
  */
  public void setE11OFA(String newvalue)
  {
    fieldE11OFA.setString(newvalue);
  }

  /**
  * Get value of field E11OFA as a String.
  */
  public String getE11OFA()
  {
    return fieldE11OFA.getString();
  }

  /**
  * Set numeric field E11OFA using a BigDecimal value.
  */
  public void setE11OFA(BigDecimal newvalue)
  {
    fieldE11OFA.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E11OFA as a BigDecimal.
  */
  public BigDecimal getBigDecimalE11OFA()
  {
    return fieldE11OFA.getBigDecimal();
  }

  /**
  * Set field E11NA1 using a String value.
  */
  public void setE11NA1(String newvalue)
  {
    fieldE11NA1.setString(newvalue);
  }

  /**
  * Get value of field E11NA1 as a String.
  */
  public String getE11NA1()
  {
    return fieldE11NA1.getString();
  }

  /**
  * Set field E11IDN using a String value.
  */
  public void setE11IDN(String newvalue)
  {
    fieldE11IDN.setString(newvalue);
  }

  /**
  * Get value of field E11IDN as a String.
  */
  public String getE11IDN()
  {
    return fieldE11IDN.getString();
  }

  /**
  * Set field E11LN3 using a String value.
  */
  public void setE11LN3(String newvalue)
  {
    fieldE11LN3.setString(newvalue);
  }

  /**
  * Get value of field E11LN3 as a String.
  */
  public String getE11LN3()
  {
    return fieldE11LN3.getString();
  }

}
