package datapro.eibs.beans;

import datapro.eibs.sockets.*;
import java.io.*;
import java.math.*;

import java.util.*;

/**
* Class generated by AS/400 CRTCLASS command from ECL000110 physical file definition.
* 
* File level identifier is 1100706173537.
* Record format level identifier is 344E97ADC507A.
*/

public class ECL000110Message extends MessageRecord
{
  final static String fldnames[] = {
                                     "H02USERID",
                                     "H02PROGRM",
                                     "H02TIMSYS",
                                     "H02SCRCOD",
                                     "H02OPECOD",
                                     "H02FLGMAS",
                                     "H02FLGWK1",
                                     "H02FLGWK2",
                                     "H02FLGWK3",
                                     "BRNBNK",
                                     "BRNNUM",
                                     "BRNNME",
                                     "BRNADR",
                                     "BRNCIT",
                                     "BRNPHN",
                                     "BRNCLB",
                                     "BRNRGN",
                                     "BRNSBR",
                                     "BRNDID",
                                     "BRNUS1",
                                     "BRNUS2",
                                     "BRNFL1",
                                     "BRNFL2"
                                   };
  final static String tnames[] = {
                                   "H02USERID",
                                   "H02PROGRM",
                                   "H02TIMSYS",
                                   "H02SCRCOD",
                                   "H02OPECOD",
                                   "H02FLGMAS",
                                   "H02FLGWK1",
                                   "H02FLGWK2",
                                   "H02FLGWK3",
                                   "BRNBNK",
                                   "BRNNUM",
                                   "BRNNME",
                                   "BRNADR",
                                   "BRNCIT",
                                   "BRNPHN",
                                   "BRNCLB",
                                   "BRNRGN",
                                   "BRNSBR",
                                   "BRNDID",
                                   "BRNUS1",
                                   "BRNUS2",
                                   "BRNFL1",
                                   "BRNFL2"
                                 };
  final static String fid = "1100706173537";
  final static String rid = "344E97ADC507A";
  final static String fmtname = "ECL000110";
  final int FIELDCOUNT = 23;
  private static Hashtable tlookup = new Hashtable();
  private CharacterField fieldH02USERID = null;
  private CharacterField fieldH02PROGRM = null;
  private CharacterField fieldH02TIMSYS = null;
  private CharacterField fieldH02SCRCOD = null;
  private CharacterField fieldH02OPECOD = null;
  private CharacterField fieldH02FLGMAS = null;
  private CharacterField fieldH02FLGWK1 = null;
  private CharacterField fieldH02FLGWK2 = null;
  private CharacterField fieldH02FLGWK3 = null;
  private CharacterField fieldBRNBNK = null;
  private DecimalField fieldBRNNUM = null;
  private CharacterField fieldBRNNME = null;
  private CharacterField fieldBRNADR = null;
  private CharacterField fieldBRNCIT = null;
  private DecimalField fieldBRNPHN = null;
  private DecimalField fieldBRNCLB = null;
  private CharacterField fieldBRNRGN = null;
  private CharacterField fieldBRNSBR = null;
  private CharacterField fieldBRNDID = null;
  private CharacterField fieldBRNUS1 = null;
  private CharacterField fieldBRNUS2 = null;
  private CharacterField fieldBRNFL1 = null;
  private CharacterField fieldBRNFL2 = null;

  /**
  * Constructor for ECL000110Message.
  */
  public ECL000110Message()
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
    recordsize = 197;
    fileid = fid;
    recordid = rid;
    message = new byte[getByteLength()];
    formatname = fmtname;
    fieldnames = fldnames;
    tagnames = tnames;
    fields = new MessageField[FIELDCOUNT];

    fields[0] = fieldH02USERID =
    new CharacterField(message, HEADERSIZE + 0, 10, "H02USERID");
    fields[1] = fieldH02PROGRM =
    new CharacterField(message, HEADERSIZE + 10, 10, "H02PROGRM");
    fields[2] = fieldH02TIMSYS =
    new CharacterField(message, HEADERSIZE + 20, 12, "H02TIMSYS");
    fields[3] = fieldH02SCRCOD =
    new CharacterField(message, HEADERSIZE + 32, 2, "H02SCRCOD");
    fields[4] = fieldH02OPECOD =
    new CharacterField(message, HEADERSIZE + 34, 4, "H02OPECOD");
    fields[5] = fieldH02FLGMAS =
    new CharacterField(message, HEADERSIZE + 38, 1, "H02FLGMAS");
    fields[6] = fieldH02FLGWK1 =
    new CharacterField(message, HEADERSIZE + 39, 1, "H02FLGWK1");
    fields[7] = fieldH02FLGWK2 =
    new CharacterField(message, HEADERSIZE + 40, 1, "H02FLGWK2");
    fields[8] = fieldH02FLGWK3 =
    new CharacterField(message, HEADERSIZE + 41, 1, "H02FLGWK3");
    fields[9] = fieldBRNBNK =
    new CharacterField(message, HEADERSIZE + 42, 2, "BRNBNK");
    fields[10] = fieldBRNNUM =
    new DecimalField(message, HEADERSIZE + 44, 4, 0, "BRNNUM");
    fields[11] = fieldBRNNME =
    new CharacterField(message, HEADERSIZE + 48, 35, "BRNNME");
    fields[12] = fieldBRNADR =
    new CharacterField(message, HEADERSIZE + 83, 35, "BRNADR");
    fields[13] = fieldBRNCIT =
    new CharacterField(message, HEADERSIZE + 118, 35, "BRNCIT");
    fields[14] = fieldBRNPHN =
    new DecimalField(message, HEADERSIZE + 153, 12, 0, "BRNPHN");
    fields[15] = fieldBRNCLB =
    new DecimalField(message, HEADERSIZE + 165, 4, 0, "BRNCLB");
    fields[16] = fieldBRNRGN =
    new CharacterField(message, HEADERSIZE + 169, 4, "BRNRGN");
    fields[17] = fieldBRNSBR =
    new CharacterField(message, HEADERSIZE + 173, 4, "BRNSBR");
    fields[18] = fieldBRNDID =
    new CharacterField(message, HEADERSIZE + 177, 10, "BRNDID");
    fields[19] = fieldBRNUS1 =
    new CharacterField(message, HEADERSIZE + 187, 4, "BRNUS1");
    fields[20] = fieldBRNUS2 =
    new CharacterField(message, HEADERSIZE + 191, 4, "BRNUS2");
    fields[21] = fieldBRNFL1 =
    new CharacterField(message, HEADERSIZE + 195, 1, "BRNFL1");
    fields[22] = fieldBRNFL2 =
    new CharacterField(message, HEADERSIZE + 196, 1, "BRNFL2");

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
  * Set field H02USERID using a String value.
  */
  public void setH02USERID(String newvalue)
  {
    fieldH02USERID.setString(newvalue);
  }

  /**
  * Get value of field H02USERID as a String.
  */
  public String getH02USERID()
  {
    return fieldH02USERID.getString();
  }

  /**
  * Set field H02PROGRM using a String value.
  */
  public void setH02PROGRM(String newvalue)
  {
    fieldH02PROGRM.setString(newvalue);
  }

  /**
  * Get value of field H02PROGRM as a String.
  */
  public String getH02PROGRM()
  {
    return fieldH02PROGRM.getString();
  }

  /**
  * Set field H02TIMSYS using a String value.
  */
  public void setH02TIMSYS(String newvalue)
  {
    fieldH02TIMSYS.setString(newvalue);
  }

  /**
  * Get value of field H02TIMSYS as a String.
  */
  public String getH02TIMSYS()
  {
    return fieldH02TIMSYS.getString();
  }

  /**
  * Set field H02SCRCOD using a String value.
  */
  public void setH02SCRCOD(String newvalue)
  {
    fieldH02SCRCOD.setString(newvalue);
  }

  /**
  * Get value of field H02SCRCOD as a String.
  */
  public String getH02SCRCOD()
  {
    return fieldH02SCRCOD.getString();
  }

  /**
  * Set field H02OPECOD using a String value.
  */
  public void setH02OPECOD(String newvalue)
  {
    fieldH02OPECOD.setString(newvalue);
  }

  /**
  * Get value of field H02OPECOD as a String.
  */
  public String getH02OPECOD()
  {
    return fieldH02OPECOD.getString();
  }

  /**
  * Set field H02FLGMAS using a String value.
  */
  public void setH02FLGMAS(String newvalue)
  {
    fieldH02FLGMAS.setString(newvalue);
  }

  /**
  * Get value of field H02FLGMAS as a String.
  */
  public String getH02FLGMAS()
  {
    return fieldH02FLGMAS.getString();
  }

  /**
  * Set field H02FLGWK1 using a String value.
  */
  public void setH02FLGWK1(String newvalue)
  {
    fieldH02FLGWK1.setString(newvalue);
  }

  /**
  * Get value of field H02FLGWK1 as a String.
  */
  public String getH02FLGWK1()
  {
    return fieldH02FLGWK1.getString();
  }

  /**
  * Set field H02FLGWK2 using a String value.
  */
  public void setH02FLGWK2(String newvalue)
  {
    fieldH02FLGWK2.setString(newvalue);
  }

  /**
  * Get value of field H02FLGWK2 as a String.
  */
  public String getH02FLGWK2()
  {
    return fieldH02FLGWK2.getString();
  }

  /**
  * Set field H02FLGWK3 using a String value.
  */
  public void setH02FLGWK3(String newvalue)
  {
    fieldH02FLGWK3.setString(newvalue);
  }

  /**
  * Get value of field H02FLGWK3 as a String.
  */
  public String getH02FLGWK3()
  {
    return fieldH02FLGWK3.getString();
  }

  /**
  * Set field BRNBNK using a String value.
  */
  public void setBRNBNK(String newvalue)
  {
    fieldBRNBNK.setString(newvalue);
  }

  /**
  * Get value of field BRNBNK as a String.
  */
  public String getBRNBNK()
  {
    return fieldBRNBNK.getString();
  }

  /**
  * Set field BRNNUM using a String value.
  */
  public void setBRNNUM(String newvalue)
  {
    fieldBRNNUM.setString(newvalue);
  }

  /**
  * Get value of field BRNNUM as a String.
  */
  public String getBRNNUM()
  {
    return fieldBRNNUM.getString();
  }

  /**
  * Set numeric field BRNNUM using a BigDecimal value.
  */
  public void setBRNNUM(BigDecimal newvalue)
  {
    fieldBRNNUM.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field BRNNUM as a BigDecimal.
  */
  public BigDecimal getBigDecimalBRNNUM()
  {
    return fieldBRNNUM.getBigDecimal();
  }

  /**
  * Set field BRNNME using a String value.
  */
  public void setBRNNME(String newvalue)
  {
    fieldBRNNME.setString(newvalue);
  }

  /**
  * Get value of field BRNNME as a String.
  */
  public String getBRNNME()
  {
    return fieldBRNNME.getString();
  }

  /**
  * Set field BRNADR using a String value.
  */
  public void setBRNADR(String newvalue)
  {
    fieldBRNADR.setString(newvalue);
  }

  /**
  * Get value of field BRNADR as a String.
  */
  public String getBRNADR()
  {
    return fieldBRNADR.getString();
  }

  /**
  * Set field BRNCIT using a String value.
  */
  public void setBRNCIT(String newvalue)
  {
    fieldBRNCIT.setString(newvalue);
  }

  /**
  * Get value of field BRNCIT as a String.
  */
  public String getBRNCIT()
  {
    return fieldBRNCIT.getString();
  }

  /**
  * Set field BRNPHN using a String value.
  */
  public void setBRNPHN(String newvalue)
  {
    fieldBRNPHN.setString(newvalue);
  }

  /**
  * Get value of field BRNPHN as a String.
  */
  public String getBRNPHN()
  {
    return fieldBRNPHN.getString();
  }

  /**
  * Set numeric field BRNPHN using a BigDecimal value.
  */
  public void setBRNPHN(BigDecimal newvalue)
  {
    fieldBRNPHN.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field BRNPHN as a BigDecimal.
  */
  public BigDecimal getBigDecimalBRNPHN()
  {
    return fieldBRNPHN.getBigDecimal();
  }

  /**
  * Set field BRNCLB using a String value.
  */
  public void setBRNCLB(String newvalue)
  {
    fieldBRNCLB.setString(newvalue);
  }

  /**
  * Get value of field BRNCLB as a String.
  */
  public String getBRNCLB()
  {
    return fieldBRNCLB.getString();
  }

  /**
  * Set numeric field BRNCLB using a BigDecimal value.
  */
  public void setBRNCLB(BigDecimal newvalue)
  {
    fieldBRNCLB.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field BRNCLB as a BigDecimal.
  */
  public BigDecimal getBigDecimalBRNCLB()
  {
    return fieldBRNCLB.getBigDecimal();
  }

  /**
  * Set field BRNRGN using a String value.
  */
  public void setBRNRGN(String newvalue)
  {
    fieldBRNRGN.setString(newvalue);
  }

  /**
  * Get value of field BRNRGN as a String.
  */
  public String getBRNRGN()
  {
    return fieldBRNRGN.getString();
  }

  /**
  * Set field BRNSBR using a String value.
  */
  public void setBRNSBR(String newvalue)
  {
    fieldBRNSBR.setString(newvalue);
  }

  /**
  * Get value of field BRNSBR as a String.
  */
  public String getBRNSBR()
  {
    return fieldBRNSBR.getString();
  }

  /**
  * Set field BRNDID using a String value.
  */
  public void setBRNDID(String newvalue)
  {
    fieldBRNDID.setString(newvalue);
  }

  /**
  * Get value of field BRNDID as a String.
  */
  public String getBRNDID()
  {
    return fieldBRNDID.getString();
  }

  /**
  * Set field BRNUS1 using a String value.
  */
  public void setBRNUS1(String newvalue)
  {
    fieldBRNUS1.setString(newvalue);
  }

  /**
  * Get value of field BRNUS1 as a String.
  */
  public String getBRNUS1()
  {
    return fieldBRNUS1.getString();
  }

  /**
  * Set field BRNUS2 using a String value.
  */
  public void setBRNUS2(String newvalue)
  {
    fieldBRNUS2.setString(newvalue);
  }

  /**
  * Get value of field BRNUS2 as a String.
  */
  public String getBRNUS2()
  {
    return fieldBRNUS2.getString();
  }

  /**
  * Set field BRNFL1 using a String value.
  */
  public void setBRNFL1(String newvalue)
  {
    fieldBRNFL1.setString(newvalue);
  }

  /**
  * Get value of field BRNFL1 as a String.
  */
  public String getBRNFL1()
  {
    return fieldBRNFL1.getString();
  }

  /**
  * Set field BRNFL2 using a String value.
  */
  public void setBRNFL2(String newvalue)
  {
    fieldBRNFL2.setString(newvalue);
  }

  /**
  * Get value of field BRNFL2 as a String.
  */
  public String getBRNFL2()
  {
    return fieldBRNFL2.getString();
  }

}