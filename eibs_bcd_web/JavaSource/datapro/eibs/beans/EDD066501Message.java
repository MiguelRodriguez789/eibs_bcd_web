package datapro.eibs.beans;

import datapro.eibs.sockets.*;
import java.io.*;
import java.math.*;

import java.util.*;

/**
* Class generated by AS/400 CRTCLASS command from EDD066501 physical file definition.
* 
* File level identifier is 1130611112901.
* Record format level identifier is 4347D8EA5FBB6.
*/

public class EDD066501Message extends MessageRecord
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
                                     "E01ACC",
                                     "E01ACD",
                                     "E01PRO",
                                     "E01CUN",
                                     "E01NAME",
                                     "E01CCY",
                                     "E11AMP",
                                     "E21AMP",
                                     "E31AMP",
                                     "E41AMP",
                                     "E51AMP",
                                     "E61AMP",
                                     "E71AMP",
                                     "E81AMP",
                                     "E91AMP",
                                     "E11PVI",
                                     "E21PVI",
                                     "E31PVI",
                                     "E41PVI",
                                     "E51PVI",
                                     "E61PVI",
                                     "E71PVI",
                                     "E81PVI",
                                     "E91PVI",
                                     "E11FLG",
                                     "E21FLG",
                                     "E31FLG",
                                     "E41FLG",
                                     "E51FLG",
                                     "E61FLG",
                                     "E71FLG",
                                     "E81FLG",
                                     "E91FLG",
                                     "E11POR",
                                     "E21POR",
                                     "E31POR",
                                     "E41POR",
                                     "E51POR",
                                     "E61POR",
                                     "E71POR",
                                     "E81POR",
                                     "E91POR",
                                     "E11DEL",
                                     "E21DEL",
                                     "E31DEL",
                                     "E41DEL",
                                     "E51DEL",
                                     "E61DEL",
                                     "E71DEL",
                                     "E81DEL",
                                     "E91DEL"
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
                                   "E01ACC",
                                   "E01ACD",
                                   "E01PRO",
                                   "E01CUN",
                                   "E01NAME",
                                   "E01CCY",
                                   "E11AMP",
                                   "E21AMP",
                                   "E31AMP",
                                   "E41AMP",
                                   "E51AMP",
                                   "E61AMP",
                                   "E71AMP",
                                   "E81AMP",
                                   "E91AMP",
                                   "E11PVI",
                                   "E21PVI",
                                   "E31PVI",
                                   "E41PVI",
                                   "E51PVI",
                                   "E61PVI",
                                   "E71PVI",
                                   "E81PVI",
                                   "E91PVI",
                                   "E11FLG",
                                   "E21FLG",
                                   "E31FLG",
                                   "E41FLG",
                                   "E51FLG",
                                   "E61FLG",
                                   "E71FLG",
                                   "E81FLG",
                                   "E91FLG",
                                   "E11POR",
                                   "E21POR",
                                   "E31POR",
                                   "E41POR",
                                   "E51POR",
                                   "E61POR",
                                   "E71POR",
                                   "E81POR",
                                   "E91POR",
                                   "E11DEL",
                                   "E21DEL",
                                   "E31DEL",
                                   "E41DEL",
                                   "E51DEL",
                                   "E61DEL",
                                   "E71DEL",
                                   "E81DEL",
                                   "E91DEL"
                                 };
  final static String fid = "1130611112901";
  final static String rid = "4347D8EA5FBB6";
  final static String fmtname = "EDD066501";
  final int FIELDCOUNT = 60;
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
  private DecimalField fieldE01ACC = null;
  private CharacterField fieldE01ACD = null;
  private CharacterField fieldE01PRO = null;
  private DecimalField fieldE01CUN = null;
  private CharacterField fieldE01NAME = null;
  private CharacterField fieldE01CCY = null;
  private DecimalField fieldE11AMP = null;
  private DecimalField fieldE21AMP = null;
  private DecimalField fieldE31AMP = null;
  private DecimalField fieldE41AMP = null;
  private DecimalField fieldE51AMP = null;
  private DecimalField fieldE61AMP = null;
  private DecimalField fieldE71AMP = null;
  private DecimalField fieldE81AMP = null;
  private DecimalField fieldE91AMP = null;
  private CharacterField fieldE11PVI = null;
  private CharacterField fieldE21PVI = null;
  private CharacterField fieldE31PVI = null;
  private CharacterField fieldE41PVI = null;
  private CharacterField fieldE51PVI = null;
  private CharacterField fieldE61PVI = null;
  private CharacterField fieldE71PVI = null;
  private CharacterField fieldE81PVI = null;
  private CharacterField fieldE91PVI = null;
  private CharacterField fieldE11FLG = null;
  private CharacterField fieldE21FLG = null;
  private CharacterField fieldE31FLG = null;
  private CharacterField fieldE41FLG = null;
  private CharacterField fieldE51FLG = null;
  private CharacterField fieldE61FLG = null;
  private CharacterField fieldE71FLG = null;
  private CharacterField fieldE81FLG = null;
  private CharacterField fieldE91FLG = null;
  private DecimalField fieldE11POR = null;
  private DecimalField fieldE21POR = null;
  private DecimalField fieldE31POR = null;
  private DecimalField fieldE41POR = null;
  private DecimalField fieldE51POR = null;
  private DecimalField fieldE61POR = null;
  private DecimalField fieldE71POR = null;
  private DecimalField fieldE81POR = null;
  private DecimalField fieldE91POR = null;
  private CharacterField fieldE11DEL = null;
  private CharacterField fieldE21DEL = null;
  private CharacterField fieldE31DEL = null;
  private CharacterField fieldE41DEL = null;
  private CharacterField fieldE51DEL = null;
  private CharacterField fieldE61DEL = null;
  private CharacterField fieldE71DEL = null;
  private CharacterField fieldE81DEL = null;
  private CharacterField fieldE91DEL = null;

  /**
  * Constructor for EDD066501Message.
  */
  public EDD066501Message()
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
    recordsize = 359;
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
    fields[9] = fieldE01ACC =
    new DecimalField(message, HEADERSIZE + 42, 13, 0, "E01ACC");
    fields[10] = fieldE01ACD =
    new CharacterField(message, HEADERSIZE + 55, 2, "E01ACD");
    fields[11] = fieldE01PRO =
    new CharacterField(message, HEADERSIZE + 57, 4, "E01PRO");
    fields[12] = fieldE01CUN =
    new DecimalField(message, HEADERSIZE + 61, 10, 0, "E01CUN");
    fields[13] = fieldE01NAME =
    new CharacterField(message, HEADERSIZE + 71, 60, "E01NAME");
    fields[14] = fieldE01CCY =
    new CharacterField(message, HEADERSIZE + 131, 3, "E01CCY");
    fields[15] = fieldE11AMP =
    new DecimalField(message, HEADERSIZE + 134, 17, 2, "E11AMP");
    fields[16] = fieldE21AMP =
    new DecimalField(message, HEADERSIZE + 151, 17, 2, "E21AMP");
    fields[17] = fieldE31AMP =
    new DecimalField(message, HEADERSIZE + 168, 17, 2, "E31AMP");
    fields[18] = fieldE41AMP =
    new DecimalField(message, HEADERSIZE + 185, 17, 2, "E41AMP");
    fields[19] = fieldE51AMP =
    new DecimalField(message, HEADERSIZE + 202, 17, 2, "E51AMP");
    fields[20] = fieldE61AMP =
    new DecimalField(message, HEADERSIZE + 219, 17, 2, "E61AMP");
    fields[21] = fieldE71AMP =
    new DecimalField(message, HEADERSIZE + 236, 17, 2, "E71AMP");
    fields[22] = fieldE81AMP =
    new DecimalField(message, HEADERSIZE + 253, 17, 2, "E81AMP");
    fields[23] = fieldE91AMP =
    new DecimalField(message, HEADERSIZE + 270, 17, 2, "E91AMP");
    fields[24] = fieldE11PVI =
    new CharacterField(message, HEADERSIZE + 287, 1, "E11PVI");
    fields[25] = fieldE21PVI =
    new CharacterField(message, HEADERSIZE + 288, 1, "E21PVI");
    fields[26] = fieldE31PVI =
    new CharacterField(message, HEADERSIZE + 289, 1, "E31PVI");
    fields[27] = fieldE41PVI =
    new CharacterField(message, HEADERSIZE + 290, 1, "E41PVI");
    fields[28] = fieldE51PVI =
    new CharacterField(message, HEADERSIZE + 291, 1, "E51PVI");
    fields[29] = fieldE61PVI =
    new CharacterField(message, HEADERSIZE + 292, 1, "E61PVI");
    fields[30] = fieldE71PVI =
    new CharacterField(message, HEADERSIZE + 293, 1, "E71PVI");
    fields[31] = fieldE81PVI =
    new CharacterField(message, HEADERSIZE + 294, 1, "E81PVI");
    fields[32] = fieldE91PVI =
    new CharacterField(message, HEADERSIZE + 295, 1, "E91PVI");
    fields[33] = fieldE11FLG =
    new CharacterField(message, HEADERSIZE + 296, 1, "E11FLG");
    fields[34] = fieldE21FLG =
    new CharacterField(message, HEADERSIZE + 297, 1, "E21FLG");
    fields[35] = fieldE31FLG =
    new CharacterField(message, HEADERSIZE + 298, 1, "E31FLG");
    fields[36] = fieldE41FLG =
    new CharacterField(message, HEADERSIZE + 299, 1, "E41FLG");
    fields[37] = fieldE51FLG =
    new CharacterField(message, HEADERSIZE + 300, 1, "E51FLG");
    fields[38] = fieldE61FLG =
    new CharacterField(message, HEADERSIZE + 301, 1, "E61FLG");
    fields[39] = fieldE71FLG =
    new CharacterField(message, HEADERSIZE + 302, 1, "E71FLG");
    fields[40] = fieldE81FLG =
    new CharacterField(message, HEADERSIZE + 303, 1, "E81FLG");
    fields[41] = fieldE91FLG =
    new CharacterField(message, HEADERSIZE + 304, 1, "E91FLG");
    fields[42] = fieldE11POR =
    new DecimalField(message, HEADERSIZE + 305, 5, 0, "E11POR");
    fields[43] = fieldE21POR =
    new DecimalField(message, HEADERSIZE + 310, 5, 0, "E21POR");
    fields[44] = fieldE31POR =
    new DecimalField(message, HEADERSIZE + 315, 5, 0, "E31POR");
    fields[45] = fieldE41POR =
    new DecimalField(message, HEADERSIZE + 320, 5, 0, "E41POR");
    fields[46] = fieldE51POR =
    new DecimalField(message, HEADERSIZE + 325, 5, 0, "E51POR");
    fields[47] = fieldE61POR =
    new DecimalField(message, HEADERSIZE + 330, 5, 0, "E61POR");
    fields[48] = fieldE71POR =
    new DecimalField(message, HEADERSIZE + 335, 5, 0, "E71POR");
    fields[49] = fieldE81POR =
    new DecimalField(message, HEADERSIZE + 340, 5, 0, "E81POR");
    fields[50] = fieldE91POR =
    new DecimalField(message, HEADERSIZE + 345, 5, 0, "E91POR");
    fields[51] = fieldE11DEL =
    new CharacterField(message, HEADERSIZE + 350, 1, "E11DEL");
    fields[52] = fieldE21DEL =
    new CharacterField(message, HEADERSIZE + 351, 1, "E21DEL");
    fields[53] = fieldE31DEL =
    new CharacterField(message, HEADERSIZE + 352, 1, "E31DEL");
    fields[54] = fieldE41DEL =
    new CharacterField(message, HEADERSIZE + 353, 1, "E41DEL");
    fields[55] = fieldE51DEL =
    new CharacterField(message, HEADERSIZE + 354, 1, "E51DEL");
    fields[56] = fieldE61DEL =
    new CharacterField(message, HEADERSIZE + 355, 1, "E61DEL");
    fields[57] = fieldE71DEL =
    new CharacterField(message, HEADERSIZE + 356, 1, "E71DEL");
    fields[58] = fieldE81DEL =
    new CharacterField(message, HEADERSIZE + 357, 1, "E81DEL");
    fields[59] = fieldE91DEL =
    new CharacterField(message, HEADERSIZE + 358, 1, "E91DEL");

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
  * Set field E01ACC using a String value.
  */
  public void setE01ACC(String newvalue)
  {
    fieldE01ACC.setString(newvalue);
  }

  /**
  * Get value of field E01ACC as a String.
  */
  public String getE01ACC()
  {
    return fieldE01ACC.getString();
  }

  /**
  * Set numeric field E01ACC using a BigDecimal value.
  */
  public void setE01ACC(BigDecimal newvalue)
  {
    fieldE01ACC.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01ACC as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01ACC()
  {
    return fieldE01ACC.getBigDecimal();
  }

  /**
  * Set field E01ACD using a String value.
  */
  public void setE01ACD(String newvalue)
  {
    fieldE01ACD.setString(newvalue);
  }

  /**
  * Get value of field E01ACD as a String.
  */
  public String getE01ACD()
  {
    return fieldE01ACD.getString();
  }

  /**
  * Set field E01PRO using a String value.
  */
  public void setE01PRO(String newvalue)
  {
    fieldE01PRO.setString(newvalue);
  }

  /**
  * Get value of field E01PRO as a String.
  */
  public String getE01PRO()
  {
    return fieldE01PRO.getString();
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
  * Set field E01NAME using a String value.
  */
  public void setE01NAME(String newvalue)
  {
    fieldE01NAME.setString(newvalue);
  }

  /**
  * Get value of field E01NAME as a String.
  */
  public String getE01NAME()
  {
    return fieldE01NAME.getString();
  }

  /**
  * Set field E01CCY using a String value.
  */
  public void setE01CCY(String newvalue)
  {
    fieldE01CCY.setString(newvalue);
  }

  /**
  * Get value of field E01CCY as a String.
  */
  public String getE01CCY()
  {
    return fieldE01CCY.getString();
  }

  /**
  * Set field E11AMP using a String value.
  */
  public void setE11AMP(String newvalue)
  {
    fieldE11AMP.setString(newvalue);
  }

  /**
  * Get value of field E11AMP as a String.
  */
  public String getE11AMP()
  {
    return fieldE11AMP.getString();
  }

  /**
  * Set numeric field E11AMP using a BigDecimal value.
  */
  public void setE11AMP(BigDecimal newvalue)
  {
    fieldE11AMP.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E11AMP as a BigDecimal.
  */
  public BigDecimal getBigDecimalE11AMP()
  {
    return fieldE11AMP.getBigDecimal();
  }

  /**
  * Set field E21AMP using a String value.
  */
  public void setE21AMP(String newvalue)
  {
    fieldE21AMP.setString(newvalue);
  }

  /**
  * Get value of field E21AMP as a String.
  */
  public String getE21AMP()
  {
    return fieldE21AMP.getString();
  }

  /**
  * Set numeric field E21AMP using a BigDecimal value.
  */
  public void setE21AMP(BigDecimal newvalue)
  {
    fieldE21AMP.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E21AMP as a BigDecimal.
  */
  public BigDecimal getBigDecimalE21AMP()
  {
    return fieldE21AMP.getBigDecimal();
  }

  /**
  * Set field E31AMP using a String value.
  */
  public void setE31AMP(String newvalue)
  {
    fieldE31AMP.setString(newvalue);
  }

  /**
  * Get value of field E31AMP as a String.
  */
  public String getE31AMP()
  {
    return fieldE31AMP.getString();
  }

  /**
  * Set numeric field E31AMP using a BigDecimal value.
  */
  public void setE31AMP(BigDecimal newvalue)
  {
    fieldE31AMP.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E31AMP as a BigDecimal.
  */
  public BigDecimal getBigDecimalE31AMP()
  {
    return fieldE31AMP.getBigDecimal();
  }

  /**
  * Set field E41AMP using a String value.
  */
  public void setE41AMP(String newvalue)
  {
    fieldE41AMP.setString(newvalue);
  }

  /**
  * Get value of field E41AMP as a String.
  */
  public String getE41AMP()
  {
    return fieldE41AMP.getString();
  }

  /**
  * Set numeric field E41AMP using a BigDecimal value.
  */
  public void setE41AMP(BigDecimal newvalue)
  {
    fieldE41AMP.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E41AMP as a BigDecimal.
  */
  public BigDecimal getBigDecimalE41AMP()
  {
    return fieldE41AMP.getBigDecimal();
  }

  /**
  * Set field E51AMP using a String value.
  */
  public void setE51AMP(String newvalue)
  {
    fieldE51AMP.setString(newvalue);
  }

  /**
  * Get value of field E51AMP as a String.
  */
  public String getE51AMP()
  {
    return fieldE51AMP.getString();
  }

  /**
  * Set numeric field E51AMP using a BigDecimal value.
  */
  public void setE51AMP(BigDecimal newvalue)
  {
    fieldE51AMP.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E51AMP as a BigDecimal.
  */
  public BigDecimal getBigDecimalE51AMP()
  {
    return fieldE51AMP.getBigDecimal();
  }

  /**
  * Set field E61AMP using a String value.
  */
  public void setE61AMP(String newvalue)
  {
    fieldE61AMP.setString(newvalue);
  }

  /**
  * Get value of field E61AMP as a String.
  */
  public String getE61AMP()
  {
    return fieldE61AMP.getString();
  }

  /**
  * Set numeric field E61AMP using a BigDecimal value.
  */
  public void setE61AMP(BigDecimal newvalue)
  {
    fieldE61AMP.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E61AMP as a BigDecimal.
  */
  public BigDecimal getBigDecimalE61AMP()
  {
    return fieldE61AMP.getBigDecimal();
  }

  /**
  * Set field E71AMP using a String value.
  */
  public void setE71AMP(String newvalue)
  {
    fieldE71AMP.setString(newvalue);
  }

  /**
  * Get value of field E71AMP as a String.
  */
  public String getE71AMP()
  {
    return fieldE71AMP.getString();
  }

  /**
  * Set numeric field E71AMP using a BigDecimal value.
  */
  public void setE71AMP(BigDecimal newvalue)
  {
    fieldE71AMP.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E71AMP as a BigDecimal.
  */
  public BigDecimal getBigDecimalE71AMP()
  {
    return fieldE71AMP.getBigDecimal();
  }

  /**
  * Set field E81AMP using a String value.
  */
  public void setE81AMP(String newvalue)
  {
    fieldE81AMP.setString(newvalue);
  }

  /**
  * Get value of field E81AMP as a String.
  */
  public String getE81AMP()
  {
    return fieldE81AMP.getString();
  }

  /**
  * Set numeric field E81AMP using a BigDecimal value.
  */
  public void setE81AMP(BigDecimal newvalue)
  {
    fieldE81AMP.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E81AMP as a BigDecimal.
  */
  public BigDecimal getBigDecimalE81AMP()
  {
    return fieldE81AMP.getBigDecimal();
  }

  /**
  * Set field E91AMP using a String value.
  */
  public void setE91AMP(String newvalue)
  {
    fieldE91AMP.setString(newvalue);
  }

  /**
  * Get value of field E91AMP as a String.
  */
  public String getE91AMP()
  {
    return fieldE91AMP.getString();
  }

  /**
  * Set numeric field E91AMP using a BigDecimal value.
  */
  public void setE91AMP(BigDecimal newvalue)
  {
    fieldE91AMP.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E91AMP as a BigDecimal.
  */
  public BigDecimal getBigDecimalE91AMP()
  {
    return fieldE91AMP.getBigDecimal();
  }

  /**
  * Set field E11PVI using a String value.
  */
  public void setE11PVI(String newvalue)
  {
    fieldE11PVI.setString(newvalue);
  }

  /**
  * Get value of field E11PVI as a String.
  */
  public String getE11PVI()
  {
    return fieldE11PVI.getString();
  }

  /**
  * Set field E21PVI using a String value.
  */
  public void setE21PVI(String newvalue)
  {
    fieldE21PVI.setString(newvalue);
  }

  /**
  * Get value of field E21PVI as a String.
  */
  public String getE21PVI()
  {
    return fieldE21PVI.getString();
  }

  /**
  * Set field E31PVI using a String value.
  */
  public void setE31PVI(String newvalue)
  {
    fieldE31PVI.setString(newvalue);
  }

  /**
  * Get value of field E31PVI as a String.
  */
  public String getE31PVI()
  {
    return fieldE31PVI.getString();
  }

  /**
  * Set field E41PVI using a String value.
  */
  public void setE41PVI(String newvalue)
  {
    fieldE41PVI.setString(newvalue);
  }

  /**
  * Get value of field E41PVI as a String.
  */
  public String getE41PVI()
  {
    return fieldE41PVI.getString();
  }

  /**
  * Set field E51PVI using a String value.
  */
  public void setE51PVI(String newvalue)
  {
    fieldE51PVI.setString(newvalue);
  }

  /**
  * Get value of field E51PVI as a String.
  */
  public String getE51PVI()
  {
    return fieldE51PVI.getString();
  }

  /**
  * Set field E61PVI using a String value.
  */
  public void setE61PVI(String newvalue)
  {
    fieldE61PVI.setString(newvalue);
  }

  /**
  * Get value of field E61PVI as a String.
  */
  public String getE61PVI()
  {
    return fieldE61PVI.getString();
  }

  /**
  * Set field E71PVI using a String value.
  */
  public void setE71PVI(String newvalue)
  {
    fieldE71PVI.setString(newvalue);
  }

  /**
  * Get value of field E71PVI as a String.
  */
  public String getE71PVI()
  {
    return fieldE71PVI.getString();
  }

  /**
  * Set field E81PVI using a String value.
  */
  public void setE81PVI(String newvalue)
  {
    fieldE81PVI.setString(newvalue);
  }

  /**
  * Get value of field E81PVI as a String.
  */
  public String getE81PVI()
  {
    return fieldE81PVI.getString();
  }

  /**
  * Set field E91PVI using a String value.
  */
  public void setE91PVI(String newvalue)
  {
    fieldE91PVI.setString(newvalue);
  }

  /**
  * Get value of field E91PVI as a String.
  */
  public String getE91PVI()
  {
    return fieldE91PVI.getString();
  }

  /**
  * Set field E11FLG using a String value.
  */
  public void setE11FLG(String newvalue)
  {
    fieldE11FLG.setString(newvalue);
  }

  /**
  * Get value of field E11FLG as a String.
  */
  public String getE11FLG()
  {
    return fieldE11FLG.getString();
  }

  /**
  * Set field E21FLG using a String value.
  */
  public void setE21FLG(String newvalue)
  {
    fieldE21FLG.setString(newvalue);
  }

  /**
  * Get value of field E21FLG as a String.
  */
  public String getE21FLG()
  {
    return fieldE21FLG.getString();
  }

  /**
  * Set field E31FLG using a String value.
  */
  public void setE31FLG(String newvalue)
  {
    fieldE31FLG.setString(newvalue);
  }

  /**
  * Get value of field E31FLG as a String.
  */
  public String getE31FLG()
  {
    return fieldE31FLG.getString();
  }

  /**
  * Set field E41FLG using a String value.
  */
  public void setE41FLG(String newvalue)
  {
    fieldE41FLG.setString(newvalue);
  }

  /**
  * Get value of field E41FLG as a String.
  */
  public String getE41FLG()
  {
    return fieldE41FLG.getString();
  }

  /**
  * Set field E51FLG using a String value.
  */
  public void setE51FLG(String newvalue)
  {
    fieldE51FLG.setString(newvalue);
  }

  /**
  * Get value of field E51FLG as a String.
  */
  public String getE51FLG()
  {
    return fieldE51FLG.getString();
  }

  /**
  * Set field E61FLG using a String value.
  */
  public void setE61FLG(String newvalue)
  {
    fieldE61FLG.setString(newvalue);
  }

  /**
  * Get value of field E61FLG as a String.
  */
  public String getE61FLG()
  {
    return fieldE61FLG.getString();
  }

  /**
  * Set field E71FLG using a String value.
  */
  public void setE71FLG(String newvalue)
  {
    fieldE71FLG.setString(newvalue);
  }

  /**
  * Get value of field E71FLG as a String.
  */
  public String getE71FLG()
  {
    return fieldE71FLG.getString();
  }

  /**
  * Set field E81FLG using a String value.
  */
  public void setE81FLG(String newvalue)
  {
    fieldE81FLG.setString(newvalue);
  }

  /**
  * Get value of field E81FLG as a String.
  */
  public String getE81FLG()
  {
    return fieldE81FLG.getString();
  }

  /**
  * Set field E91FLG using a String value.
  */
  public void setE91FLG(String newvalue)
  {
    fieldE91FLG.setString(newvalue);
  }

  /**
  * Get value of field E91FLG as a String.
  */
  public String getE91FLG()
  {
    return fieldE91FLG.getString();
  }

  /**
  * Set field E11POR using a String value.
  */
  public void setE11POR(String newvalue)
  {
    fieldE11POR.setString(newvalue);
  }

  /**
  * Get value of field E11POR as a String.
  */
  public String getE11POR()
  {
    return fieldE11POR.getString();
  }

  /**
  * Set numeric field E11POR using a BigDecimal value.
  */
  public void setE11POR(BigDecimal newvalue)
  {
    fieldE11POR.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E11POR as a BigDecimal.
  */
  public BigDecimal getBigDecimalE11POR()
  {
    return fieldE11POR.getBigDecimal();
  }

  /**
  * Set field E21POR using a String value.
  */
  public void setE21POR(String newvalue)
  {
    fieldE21POR.setString(newvalue);
  }

  /**
  * Get value of field E21POR as a String.
  */
  public String getE21POR()
  {
    return fieldE21POR.getString();
  }

  /**
  * Set numeric field E21POR using a BigDecimal value.
  */
  public void setE21POR(BigDecimal newvalue)
  {
    fieldE21POR.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E21POR as a BigDecimal.
  */
  public BigDecimal getBigDecimalE21POR()
  {
    return fieldE21POR.getBigDecimal();
  }

  /**
  * Set field E31POR using a String value.
  */
  public void setE31POR(String newvalue)
  {
    fieldE31POR.setString(newvalue);
  }

  /**
  * Get value of field E31POR as a String.
  */
  public String getE31POR()
  {
    return fieldE31POR.getString();
  }

  /**
  * Set numeric field E31POR using a BigDecimal value.
  */
  public void setE31POR(BigDecimal newvalue)
  {
    fieldE31POR.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E31POR as a BigDecimal.
  */
  public BigDecimal getBigDecimalE31POR()
  {
    return fieldE31POR.getBigDecimal();
  }

  /**
  * Set field E41POR using a String value.
  */
  public void setE41POR(String newvalue)
  {
    fieldE41POR.setString(newvalue);
  }

  /**
  * Get value of field E41POR as a String.
  */
  public String getE41POR()
  {
    return fieldE41POR.getString();
  }

  /**
  * Set numeric field E41POR using a BigDecimal value.
  */
  public void setE41POR(BigDecimal newvalue)
  {
    fieldE41POR.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E41POR as a BigDecimal.
  */
  public BigDecimal getBigDecimalE41POR()
  {
    return fieldE41POR.getBigDecimal();
  }

  /**
  * Set field E51POR using a String value.
  */
  public void setE51POR(String newvalue)
  {
    fieldE51POR.setString(newvalue);
  }

  /**
  * Get value of field E51POR as a String.
  */
  public String getE51POR()
  {
    return fieldE51POR.getString();
  }

  /**
  * Set numeric field E51POR using a BigDecimal value.
  */
  public void setE51POR(BigDecimal newvalue)
  {
    fieldE51POR.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E51POR as a BigDecimal.
  */
  public BigDecimal getBigDecimalE51POR()
  {
    return fieldE51POR.getBigDecimal();
  }

  /**
  * Set field E61POR using a String value.
  */
  public void setE61POR(String newvalue)
  {
    fieldE61POR.setString(newvalue);
  }

  /**
  * Get value of field E61POR as a String.
  */
  public String getE61POR()
  {
    return fieldE61POR.getString();
  }

  /**
  * Set numeric field E61POR using a BigDecimal value.
  */
  public void setE61POR(BigDecimal newvalue)
  {
    fieldE61POR.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E61POR as a BigDecimal.
  */
  public BigDecimal getBigDecimalE61POR()
  {
    return fieldE61POR.getBigDecimal();
  }

  /**
  * Set field E71POR using a String value.
  */
  public void setE71POR(String newvalue)
  {
    fieldE71POR.setString(newvalue);
  }

  /**
  * Get value of field E71POR as a String.
  */
  public String getE71POR()
  {
    return fieldE71POR.getString();
  }

  /**
  * Set numeric field E71POR using a BigDecimal value.
  */
  public void setE71POR(BigDecimal newvalue)
  {
    fieldE71POR.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E71POR as a BigDecimal.
  */
  public BigDecimal getBigDecimalE71POR()
  {
    return fieldE71POR.getBigDecimal();
  }

  /**
  * Set field E81POR using a String value.
  */
  public void setE81POR(String newvalue)
  {
    fieldE81POR.setString(newvalue);
  }

  /**
  * Get value of field E81POR as a String.
  */
  public String getE81POR()
  {
    return fieldE81POR.getString();
  }

  /**
  * Set numeric field E81POR using a BigDecimal value.
  */
  public void setE81POR(BigDecimal newvalue)
  {
    fieldE81POR.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E81POR as a BigDecimal.
  */
  public BigDecimal getBigDecimalE81POR()
  {
    return fieldE81POR.getBigDecimal();
  }

  /**
  * Set field E91POR using a String value.
  */
  public void setE91POR(String newvalue)
  {
    fieldE91POR.setString(newvalue);
  }

  /**
  * Get value of field E91POR as a String.
  */
  public String getE91POR()
  {
    return fieldE91POR.getString();
  }

  /**
  * Set numeric field E91POR using a BigDecimal value.
  */
  public void setE91POR(BigDecimal newvalue)
  {
    fieldE91POR.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E91POR as a BigDecimal.
  */
  public BigDecimal getBigDecimalE91POR()
  {
    return fieldE91POR.getBigDecimal();
  }

  /**
  * Set field E11DEL using a String value.
  */
  public void setE11DEL(String newvalue)
  {
    fieldE11DEL.setString(newvalue);
  }

  /**
  * Get value of field E11DEL as a String.
  */
  public String getE11DEL()
  {
    return fieldE11DEL.getString();
  }

  /**
  * Set field E21DEL using a String value.
  */
  public void setE21DEL(String newvalue)
  {
    fieldE21DEL.setString(newvalue);
  }

  /**
  * Get value of field E21DEL as a String.
  */
  public String getE21DEL()
  {
    return fieldE21DEL.getString();
  }

  /**
  * Set field E31DEL using a String value.
  */
  public void setE31DEL(String newvalue)
  {
    fieldE31DEL.setString(newvalue);
  }

  /**
  * Get value of field E31DEL as a String.
  */
  public String getE31DEL()
  {
    return fieldE31DEL.getString();
  }

  /**
  * Set field E41DEL using a String value.
  */
  public void setE41DEL(String newvalue)
  {
    fieldE41DEL.setString(newvalue);
  }

  /**
  * Get value of field E41DEL as a String.
  */
  public String getE41DEL()
  {
    return fieldE41DEL.getString();
  }

  /**
  * Set field E51DEL using a String value.
  */
  public void setE51DEL(String newvalue)
  {
    fieldE51DEL.setString(newvalue);
  }

  /**
  * Get value of field E51DEL as a String.
  */
  public String getE51DEL()
  {
    return fieldE51DEL.getString();
  }

  /**
  * Set field E61DEL using a String value.
  */
  public void setE61DEL(String newvalue)
  {
    fieldE61DEL.setString(newvalue);
  }

  /**
  * Get value of field E61DEL as a String.
  */
  public String getE61DEL()
  {
    return fieldE61DEL.getString();
  }

  /**
  * Set field E71DEL using a String value.
  */
  public void setE71DEL(String newvalue)
  {
    fieldE71DEL.setString(newvalue);
  }

  /**
  * Get value of field E71DEL as a String.
  */
  public String getE71DEL()
  {
    return fieldE71DEL.getString();
  }

  /**
  * Set field E81DEL using a String value.
  */
  public void setE81DEL(String newvalue)
  {
    fieldE81DEL.setString(newvalue);
  }

  /**
  * Get value of field E81DEL as a String.
  */
  public String getE81DEL()
  {
    return fieldE81DEL.getString();
  }

  /**
  * Set field E91DEL using a String value.
  */
  public void setE91DEL(String newvalue)
  {
    fieldE91DEL.setString(newvalue);
  }

  /**
  * Get value of field E91DEL as a String.
  */
  public String getE91DEL()
  {
    return fieldE91DEL.getString();
  }

}
